package com.fluxer.voice

import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.media.AudioAttributes
import android.media.AudioDeviceCallback
import android.media.AudioDeviceInfo
import android.media.AudioFocusRequest
import android.media.AudioManager
import android.media.AudioRecordingConfiguration
import android.os.Build
import android.os.Handler
import android.os.HandlerThread
import android.os.Looper
import android.os.SystemClock
import androidx.annotation.RequiresApi
import com.hiennv.flutter_callkit_incoming.CallkitConnection
import java.util.concurrent.Executor

private const val REASSERT_DEBOUNCE_MS = 250L
private const val DEVICE_REFRESH_DEBOUNCE_MS = 300L
private const val OWN_CHANGE_GRACE_MS = 300L
private const val SETTLED_REAPPLY_MS = 2_000L
private const val FOCUS_RETRY_MS = 500L
private const val FOCUS_REREQUEST_MS = 2_000L
private const val SCO_TIMEOUT_MS = 4_000L
private const val SCO_MAX_ATTEMPTS = 2
private const val REASSERT_MAX_COUNT = 6
private const val REASSERT_WINDOW_MS = 10_000L
private const val EVENT_LOG_CAPACITY = 40

private val externalCallModes = setOf(
    AudioManager.MODE_IN_CALL,
    AudioManager.MODE_RINGTONE,
    AudioManager.MODE_CALL_SCREENING,
)

internal class VoiceAudioSession(
    private val context: Context,
    val handler: Handler,
    private val emit: (NativeVoiceSessionState) -> Unit,
    private val clock: () -> Long = SystemClock::elapsedRealtime,
    private val connections: () -> List<CallkitConnection> = { telecomCallConnections(context) },
    private val registerPlatformListeners: Boolean = true,
    private val keepalive: VoiceKeepalive = SilentVoiceKeepalive(context),
) {
    private val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    private val executor = Executor { handler.post(it) }
    private val owners = linkedSetOf<String>()
    private val limiter = ReassertLimiter(REASSERT_MAX_COUNT, REASSERT_WINDOW_MS)
    private val eventLog = VoiceRouteEventLog(EVENT_LOG_CAPACITY, clock)
    private val proximity = ProximityScreenLock(context)

    var activityProvider: () -> Activity? = { null }
    var hasListeners: Boolean = false
        set(value) {
            field = value
            syncDeviceCallback()
        }

    var desiredRoute: VoiceOutputRoute = VoiceOutputRoute.Speaker
        private set
    private var desiredDeviceId: Int? = null
    private var desiredExplicit = false
    private var builtInDefault: VoiceOutputRoute = VoiceOutputRoute.Speaker
    private var appliedRoute: VoiceOutputRoute? = null
    private var appliedDeviceId: Int? = null
    private var ownChangeUntil = 0L
    private var savedMode: Int = AudioManager.MODE_NORMAL
    private var savedMicMute = false
    private var appliedMode: Int? = null
    private var focusRequest: AudioFocusRequest? = null
    private var focusState: String = "none"
    private var focusLost = false
    private var lastFocusRequestAt = 0L
    private var lastForcedApplyAt = Long.MIN_VALUE / 2
    private var telecomOwnsRoute = false
    private var waitingForExternalCall = false
    private var deviceCallbackRegistered = false
    private var receiversRegistered = false
    private var deviceSnapshot: Set<Int> = emptySet()
    private var pendingReassert: Runnable? = null
    private var deferredReassert: Runnable? = null
    private var pendingDeviceRefresh: Runnable? = null
    private var settledReapply: Runnable? = null
    private var scoTimeout: Runnable? = null
    private var scoRequested = false
    private var scoConnected = false
    private var scoAttempts = 0
    private var bluetoothFailed = false
    private var micSilenced = false
    private var api31: Api31Listeners? = null
    private var recordingListener: RecordingListener? = null

    val isActive: Boolean
        get() = owners.isNotEmpty()

    private val focusListener = AudioManager.OnAudioFocusChangeListener { change ->
        if (Looper.myLooper() == handler.looper) {
            onFocusChange(change)
        } else {
            handler.post { onFocusChange(change) }
        }
    }

    private val deviceCallback = object : AudioDeviceCallback() {
        override fun onAudioDevicesAdded(addedDevices: Array<out AudioDeviceInfo>) {
            scheduleDeviceRefresh("added=${addedDevices.joinToString { it.type.toString() }}")
        }

        override fun onAudioDevicesRemoved(removedDevices: Array<out AudioDeviceInfo>) {
            scheduleDeviceRefresh("removed=${removedDevices.joinToString { it.type.toString() }}")
        }
    }

    private val receiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            when (intent.action) {
                AudioManager.ACTION_AUDIO_BECOMING_NOISY -> scheduleDeviceRefresh("becomingNoisy", force = true)
                AudioManager.ACTION_SCO_AUDIO_STATE_UPDATED -> onScoState(
                    intent.getIntExtra(AudioManager.EXTRA_SCO_AUDIO_STATE, AudioManager.SCO_AUDIO_STATE_ERROR),
                )
            }
        }
    }

    fun acquire(owner: String) {
        val wasActive = isActive
        owners.add(owner)
        if (wasActive) {
            log("acquire owner=$owner owners=$owners")
            return
        }
        val mode = audioManager.mode
        log("activate owner=$owner mode=$mode")
        appliedMode = mode
        savedMode = if (mode == AudioManager.MODE_IN_COMMUNICATION || mode == AudioManager.MODE_IN_CALL) {
            AudioManager.MODE_NORMAL
        } else {
            mode
        }
        savedMicMute = audioManager.isMicrophoneMute
        FluxerRouteOwnership.holdsRoute = true
        limiter.reset()
        bluetoothFailed = false
        requestFocus(retry = true)
        registerSessionListeners()
        deviceSnapshot = currentDeviceIds()
        setVolumeKeys(true)
        audioManager.isMicrophoneMute = false
        applyRoute("activate", force = true)
        startKeepalive()
        scheduleSettledReapply()
    }

    fun release(owner: String) {
        if (!owners.remove(owner)) {
            return
        }
        if (isActive) {
            log("release owner=$owner owners=$owners")
            return
        }
        deactivate(owner)
    }

    fun setPreferredRoute(route: VoiceOutputRoute, deviceId: Int?, explicit: Boolean) {
        val changed = route != desiredRoute || deviceId != desiredDeviceId || explicit != desiredExplicit
        desiredRoute = route
        desiredDeviceId = deviceId
        desiredExplicit = explicit
        if (route == VoiceOutputRoute.Speaker || route == VoiceOutputRoute.Earpiece) {
            builtInDefault = route
        }
        log("preferred route=${route.name} deviceId=$deviceId explicit=$explicit changed=$changed")
        if (!isActive) {
            return
        }
        if (changed) {
            limiter.reset()
        }
        applyRoute("preferred", telecomForce = changed)
    }

    fun refreshRoute(reason: String) {
        if (!isActive) {
            return
        }
        applyRoute(reason, force = true)
    }

    fun availableRouteNames(): List<String> {
        return availableVoiceOutputRouteNames(outputTypes(audioManager), hasEarpiece())
    }

    fun availableRoutes(): List<NativeVoiceRoute> {
        return availableRouteNames().map { voiceOutputRouteFromName(it).toMessage() }
    }

    fun outputDeviceMessages(): List<NativeVoiceDevice> {
        return voiceOutputDevices(
            outputDevices(audioManager),
            hasEarpiece(),
            appliedDeviceId ?: activeCommunicationDeviceId(audioManager),
        ).map { it.toMessage() }
    }

    fun diagnostics(): String {
        val devices = outputDevices(audioManager).joinToString(prefix = "[", postfix = "]") {
            "${it.type}:${it.id}"
        }
        return voiceRouteDiagnostics(audioManager, connections(), telecomOwnsRoute) +
            " owners=$owners" +
            " desired=${desiredRoute.name}/${desiredDeviceId}/explicit=$desiredExplicit" +
            " builtInDefault=${builtInDefault.name}" +
            " applied=${appliedRoute?.name}/${appliedDeviceId}" +
            " appliedMode=$appliedMode" +
            " focus=$focusState" +
            " focusLost=$focusLost" +
            " waitingForExternalCall=$waitingForExternalCall" +
            " keepalive=${keepalive.isPlaying}" +
            " micSilenced=$micSilenced" +
            " sco=requested:$scoRequested/connected:$scoConnected/failed:$bluetoothFailed" +
            " devices=$devices" +
            " proximity=${proximity.isHeld}" +
            " events=${eventLog.snapshot()}"
    }

    fun state(type: String): NativeVoiceSessionState = NativeVoiceSessionState(
        type = type,
        active = isActive,
        route = (currentRoute() ?: desiredRoute).toMessage(),
        routes = availableRoutes(),
        devices = outputDeviceMessages(),
        activeDeviceId = (appliedDeviceId ?: activeCommunicationDeviceId(audioManager))?.toLong(),
        telecom = telecomOwnsRoute,
        micSilenced = micSilenced,
    )

    fun onActivityVisibilityChanged() {
        updateProximity()
    }

    internal fun onFocusChange(change: Int) {
        focusState = when (change) {
            AudioManager.AUDIOFOCUS_GAIN -> "gain"
            AudioManager.AUDIOFOCUS_LOSS -> "loss"
            AudioManager.AUDIOFOCUS_LOSS_TRANSIENT -> "lossTransient"
            AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK -> "duck"
            else -> "change$change"
        }
        log("focus=$focusState")
        when (change) {
            AudioManager.AUDIOFOCUS_LOSS,
            AudioManager.AUDIOFOCUS_LOSS_TRANSIENT,
            -> focusLost = true
            AudioManager.AUDIOFOCUS_GAIN -> {
                val wasLost = focusLost
                focusLost = false
                if (wasLost && isActive && !telecomOwnsRoute) {
                    limiter.reset()
                    applyRoute("focusGain", force = true)
                }
            }
        }
    }

    internal fun onModeChanged(mode: Int) {
        appliedMode = mode
        if (!isActive) {
            return
        }
        log("modeChanged=$mode")
        when {
            mode == AudioManager.MODE_IN_COMMUNICATION -> {
                if (!telecomOwnsRoute && !waitingForExternalCall && desiredExplicit && communicationDeviceDrifted()) {
                    scheduleReassert("modeConfirmed", force = true)
                }
            }
            mode in externalCallModes -> {
                waitingForExternalCall = true
                cancelReasserts()
            }
            telecomOwnsRoute -> {
                if (connections().isEmpty()) {
                    applyRoute("telecomEnded", force = true)
                }
            }
            waitingForExternalCall -> {
                waitingForExternalCall = false
                limiter.reset()
                applyRoute("externalCallEnded", force = true)
            }
            else -> scheduleReassert("mode", force = true)
        }
    }

    internal fun onCommunicationDeviceChanged(device: AudioDeviceInfo?) {
        if (!isActive) {
            return
        }
        if (telecomOwnsRoute) {
            appliedRoute = telecomActualRoute(connections()) ?: appliedRoute
            updateProximity()
            emitState("routeChanged")
            return
        }
        if (waitingForExternalCall || device?.id == appliedDeviceId) {
            return
        }
        if (device == null && clock() < ownChangeUntil) {
            return
        }
        if (desiredExplicit && appliedRoute == desiredRoute) {
            log("commDeviceChanged=${device?.type}:${device?.id} expected=$appliedDeviceId reassert")
            scheduleReassert("commDevice", force = false)
            return
        }
        appliedDeviceId = device?.id
        appliedRoute = device?.let { voiceOutputDeviceKind(it.type)?.route } ?: appliedRoute
        log("commDeviceChanged=${device?.type}:${device?.id} adopted")
        updateProximity()
        emitState("routeChanged")
    }

    internal fun onScoState(state: Int) {
        log("scoState=$state")
        if (!scoRequested) {
            return
        }
        when (state) {
            AudioManager.SCO_AUDIO_STATE_CONNECTED -> {
                scoConnected = true
                cancel(scoTimeout)
                scoTimeout = null
            }
            AudioManager.SCO_AUDIO_STATE_DISCONNECTED -> {
                if (scoConnected) {
                    releaseLegacySco()
                    scheduleDeviceRefresh("scoLost", force = true)
                }
            }
        }
    }

    internal fun onMicrophoneSilenced(silenced: Boolean) {
        if (silenced == micSilenced) {
            return
        }
        micSilenced = silenced
        log("micSilenced=$silenced")
        emitState("micSilenced")
    }

    private fun deactivate(owner: String) {
        log("deactivate owner=$owner")
        cancelReasserts()
        cancel(pendingDeviceRefresh)
        pendingDeviceRefresh = null
        cancel(settledReapply)
        settledReapply = null
        releaseLegacySco()
        unregisterSessionListeners()
        keepalive.stop()
        if (!telecomOwnsRoute) {
            releaseVoiceOutputRoute(audioManager)
        }
        audioManager.mode = savedMode
        telecomOwnsRoute = false
        waitingForExternalCall = false
        abandonFocus()
        audioManager.isMicrophoneMute = savedMicMute
        setVolumeKeys(false)
        appliedRoute = null
        appliedDeviceId = null
        focusLost = false
        micSilenced = false
        FluxerRouteOwnership.holdsRoute = false
        proximity.update(false)
        emitState("routeChanged")
    }

    private fun applyRoute(reason: String, force: Boolean = false, telecomForce: Boolean = false) {
        if (!isActive) {
            return
        }
        val calls = connections()
        if (calls.isNotEmpty()) {
            applyTelecomRoute(calls, reason, telecomForce)
            return
        }
        var forceApply = force
        if (telecomOwnsRoute) {
            telecomOwnsRoute = false
            forceApply = true
            log("telecom ended, reclaiming route")
            requestFocus(retry = false)
        }
        if (externalCallActive()) {
            log("defer $reason: external call")
            return
        }
        if (focusLost && clock() - lastFocusRequestAt >= FOCUS_REREQUEST_MS) {
            requestFocus(retry = false)
        }
        audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            appliedMode = audioManager.mode
        }
        ownChangeUntil = clock() + OWN_CHANGE_GRACE_MS
        if (forceApply) {
            lastForcedApplyAt = clock()
        }
        val devices = outputDevices(audioManager)
        val names = if (desiredDeviceId != null && devices.any { it.id == desiredDeviceId }) {
            availableVoiceOutputRouteNames(devices.map { it.type }.toSet(), hasEarpiece())
        } else {
            automaticRouteNames(devices, hasEarpiece())
        }
        val unavailable = if (bluetoothFailed) setOf(VoiceOutputRoute.Bluetooth) else emptySet()
        val order = voiceRouteSearchOrder(desiredRoute, builtInDefault, names, unavailable)
        var chosen: VoiceOutputRoute? = null
        var chosenDeviceId: Int? = null
        for (route in order) {
            val requestedId = if (route == desiredRoute) desiredDeviceId else null
            val deviceId = applyVoiceOutputRoute(audioManager, route, requestedId, forceApply)
            if (deviceId != null || Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
                chosen = route
                chosenDeviceId = deviceId
                break
            }
        }
        appliedRoute = chosen
        appliedDeviceId = chosenDeviceId
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            if (chosen == VoiceOutputRoute.Bluetooth) startLegacySco() else releaseLegacySco()
        }
        log("apply reason=$reason force=$forceApply route=${chosen?.name} deviceId=$chosenDeviceId")
        updateProximity()
        emitState("routeChanged")
    }

    private fun applyTelecomRoute(
        calls: List<CallkitConnection>,
        reason: String,
        force: Boolean,
    ) {
        val handingOff = !telecomOwnsRoute
        if (handingOff) {
            telecomOwnsRoute = true
            cancelReasserts()
            releaseLegacySco()
            safeClearCommunicationDevice(audioManager)
            abandonFocus()
            log("handoff to telecom calls=${calls.size}")
        }
        if (desiredExplicit) {
            val bluetoothAddress = requestedBluetoothAddress(audioManager, desiredRoute, desiredDeviceId)
            for (connection in calls) {
                applyTelecomCallRoute(connection, desiredRoute, bluetoothAddress, force = force || handingOff)
            }
        }
        appliedDeviceId = null
        appliedRoute = telecomActualRoute(calls) ?: desiredRoute
        log("telecom apply reason=$reason explicit=$desiredExplicit route=${appliedRoute?.name}")
        updateProximity()
        emitState("routeChanged")
    }

    private fun telecomActualRoute(calls: List<CallkitConnection>): VoiceOutputRoute? {
        return calls.firstNotNullOfOrNull { connection ->
            @Suppress("DEPRECATION")
            connection.callAudioState?.route?.let(::voiceOutputRouteForTelecom)
        }
    }

    private fun currentRoute(): VoiceOutputRoute? {
        if (telecomOwnsRoute) {
            return telecomActualRoute(connections()) ?: appliedRoute
        }
        return appliedRoute
    }

    private fun externalCallActive(): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            waitingForExternalCall = audioManager.mode in externalCallModes
        } else if (appliedMode in externalCallModes) {
            waitingForExternalCall = true
        }
        return waitingForExternalCall
    }

    private fun communicationDeviceDrifted(): Boolean {
        val expected = appliedDeviceId ?: return false
        return safeCommunicationDeviceId(audioManager) != expected
    }

    private fun scheduleReassert(reason: String, force: Boolean) {
        cancel(pendingReassert)
        val work = Runnable {
            pendingReassert = null
            val now = clock()
            if (limiter.tryAcquire(now)) {
                applyRoute("reassert:$reason", force = force)
                return@Runnable
            }
            if (deferredReassert != null) {
                return@Runnable
            }
            val delay = limiter.millisUntilNextSlot(now)
            log("reassert capped reason=$reason retryIn=${delay}ms")
            val deferred = Runnable {
                deferredReassert = null
                applyRoute("reassertDeferred:$reason", force = force)
            }
            deferredReassert = deferred
            handler.postDelayed(deferred, delay)
        }
        pendingReassert = work
        handler.postDelayed(work, REASSERT_DEBOUNCE_MS)
    }

    private fun cancelReasserts() {
        cancel(pendingReassert)
        pendingReassert = null
        cancel(deferredReassert)
        deferredReassert = null
    }

    private fun scheduleSettledReapply() {
        cancel(settledReapply)
        val work = Runnable {
            settledReapply = null
            if (isActive && !telecomOwnsRoute && clock() - lastForcedApplyAt >= SETTLED_REAPPLY_MS / 2) {
                applyRoute("settled", force = true)
            }
        }
        settledReapply = work
        handler.postDelayed(work, SETTLED_REAPPLY_MS)
    }

    private fun scheduleDeviceRefresh(reason: String, force: Boolean = false) {
        cancel(pendingDeviceRefresh)
        val work = Runnable {
            pendingDeviceRefresh = null
            val ids = currentDeviceIds()
            if (!force && ids == deviceSnapshot) {
                log("devices unchanged $reason")
                return@Runnable
            }
            val added = ids - deviceSnapshot
            deviceSnapshot = ids
            if (added.isNotEmpty()) {
                bluetoothFailed = false
            }
            log("devices $reason")
            if (isActive) {
                applyRoute("devices")
            }
            emitState("devicesChanged")
        }
        pendingDeviceRefresh = work
        handler.postDelayed(work, DEVICE_REFRESH_DEBOUNCE_MS)
    }

    private fun currentDeviceIds(): Set<Int> {
        return outputDevices(audioManager).map { it.id }.toSet()
    }

    private fun requestFocus(retry: Boolean) {
        lastFocusRequestAt = clock()
        val result = try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                val request = focusRequest ?: AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN)
                    .setAudioAttributes(
                        AudioAttributes.Builder()
                            .setUsage(AudioAttributes.USAGE_VOICE_COMMUNICATION)
                            .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                            .build(),
                    )
                    .setAcceptsDelayedFocusGain(true)
                    .setOnAudioFocusChangeListener(focusListener, handler)
                    .build()
                    .also { focusRequest = it }
                audioManager.requestAudioFocus(request)
            } else {
                @Suppress("DEPRECATION")
                audioManager.requestAudioFocus(
                    focusListener,
                    AudioManager.STREAM_VOICE_CALL,
                    AudioManager.AUDIOFOCUS_GAIN,
                )
            }
        } catch (_: SecurityException) {
            AudioManager.AUDIOFOCUS_REQUEST_FAILED
        }
        focusState = when (result) {
            AudioManager.AUDIOFOCUS_REQUEST_GRANTED -> "gain"
            AudioManager.AUDIOFOCUS_REQUEST_DELAYED -> "delayed"
            else -> "failed"
        }
        if (result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED) {
            focusLost = false
        }
        log("requestFocus=$focusState")
        if (result == AudioManager.AUDIOFOCUS_REQUEST_FAILED && retry) {
            handler.postDelayed({ if (isActive && !telecomOwnsRoute) requestFocus(retry = false) }, FOCUS_RETRY_MS)
        }
    }

    private fun abandonFocus() {
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                focusRequest?.let { audioManager.abandonAudioFocusRequest(it) }
            } else {
                @Suppress("DEPRECATION")
                audioManager.abandonAudioFocus(focusListener)
            }
        } catch (_: RuntimeException) {
        }
        focusState = "none"
    }

    private fun startKeepalive() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            return
        }
        keepalive.start()
        log("keepalive=${keepalive.isPlaying}")
    }

    private fun registerSessionListeners() {
        if (registerPlatformListeners && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && api31 == null) {
            api31 = Api31Listeners(
                audioManager,
                executor,
                ::onModeChanged,
                ::onCommunicationDeviceChanged,
            ).also { it.register() }
        }
        if (registerPlatformListeners && Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && recordingListener == null) {
            recordingListener = RecordingListener(audioManager, handler, ::onMicrophoneSilenced).also { it.register() }
        }
        if (!receiversRegistered) {
            val filter = IntentFilter().apply {
                addAction(AudioManager.ACTION_AUDIO_BECOMING_NOISY)
                addAction(AudioManager.ACTION_SCO_AUDIO_STATE_UPDATED)
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                context.registerReceiver(receiver, filter, null, handler, Context.RECEIVER_NOT_EXPORTED)
            } else {
                context.registerReceiver(receiver, filter, null, handler)
            }
            receiversRegistered = true
        }
        syncDeviceCallback()
    }

    private fun unregisterSessionListeners() {
        api31?.unregister()
        api31 = null
        recordingListener?.unregister()
        recordingListener = null
        if (receiversRegistered) {
            try {
                context.unregisterReceiver(receiver)
            } catch (_: IllegalArgumentException) {
            }
            receiversRegistered = false
        }
        syncDeviceCallback()
    }

    private fun syncDeviceCallback() {
        val wanted = isActive || hasListeners
        if (wanted && !deviceCallbackRegistered) {
            deviceSnapshot = currentDeviceIds()
            audioManager.registerAudioDeviceCallback(deviceCallback, handler)
            deviceCallbackRegistered = true
        } else if (!wanted && deviceCallbackRegistered) {
            try {
                audioManager.unregisterAudioDeviceCallback(deviceCallback)
            } catch (_: RuntimeException) {
            }
            deviceCallbackRegistered = false
            cancel(pendingDeviceRefresh)
            pendingDeviceRefresh = null
        }
    }

    @Suppress("DEPRECATION")
    private fun startLegacySco() {
        if (scoRequested) {
            return
        }
        scoRequested = true
        scoConnected = false
        scoAttempts = 1
        audioManager.startBluetoothSco()
        audioManager.isBluetoothScoOn = true
        scheduleScoTimeout()
    }

    @Suppress("DEPRECATION")
    private fun scheduleScoTimeout() {
        cancel(scoTimeout)
        val work = Runnable {
            scoTimeout = null
            if (!scoRequested || scoConnected) {
                return@Runnable
            }
            if (scoAttempts < SCO_MAX_ATTEMPTS) {
                scoAttempts++
                log("sco retry attempt=$scoAttempts")
                audioManager.stopBluetoothSco()
                audioManager.startBluetoothSco()
                audioManager.isBluetoothScoOn = true
                scheduleScoTimeout()
                return@Runnable
            }
            log("sco failed, falling back")
            releaseLegacySco()
            bluetoothFailed = true
            applyRoute("scoFailed")
        }
        scoTimeout = work
        handler.postDelayed(work, SCO_TIMEOUT_MS)
    }

    @Suppress("DEPRECATION")
    private fun releaseLegacySco() {
        cancel(scoTimeout)
        scoTimeout = null
        if (!scoRequested) {
            return
        }
        audioManager.isBluetoothScoOn = false
        audioManager.stopBluetoothSco()
        scoRequested = false
        scoConnected = false
    }

    private fun setVolumeKeys(enabled: Boolean) {
        val stream = if (enabled) AudioManager.STREAM_VOICE_CALL else AudioManager.USE_DEFAULT_STREAM_TYPE
        val activity = activityProvider() ?: return
        activity.runOnUiThread { activity.volumeControlStream = stream }
    }

    private fun updateProximity() {
        proximity.update(isActive && currentRoute() == VoiceOutputRoute.Earpiece && activityProvider() != null)
    }

    private fun hasEarpiece(): Boolean {
        return Build.VERSION.SDK_INT < Build.VERSION_CODES.S &&
            context.packageManager.hasSystemFeature(PackageManager.FEATURE_TELEPHONY)
    }

    private fun emitState(type: String) {
        if (hasListeners) {
            emit(state(type))
        }
    }

    private fun cancel(work: Runnable?) {
        work?.let(handler::removeCallbacks)
    }

    private fun log(message: String) {
        eventLog.add(message)
    }

    companion object {
        @Volatile
        private var instance: VoiceAudioSession? = null
        private val sinks = mutableListOf<(NativeVoiceSessionState) -> Unit>()
        private val mainHandler by lazy { Handler(Looper.getMainLooper()) }

        fun shared(context: Context): VoiceAudioSession {
            instance?.let { return it }
            synchronized(this) {
                instance?.let { return it }
                val thread = HandlerThread("FluxerVoiceAudio").apply { start() }
                val session = VoiceAudioSession(
                    context.applicationContext,
                    Handler(thread.looper),
                    emit = { event -> mainHandler.post { synchronized(sinks) { sinks.toList() }.forEach { it(event) } } },
                )
                instance = session
                return session
            }
        }

        fun addSink(session: VoiceAudioSession, sink: (NativeVoiceSessionState) -> Unit) {
            val count = synchronized(sinks) {
                sinks.add(sink)
                sinks.size
            }
            session.handler.post { session.hasListeners = count > 0 }
        }

        fun removeSink(session: VoiceAudioSession, sink: (NativeVoiceSessionState) -> Unit) {
            val count = synchronized(sinks) {
                sinks.remove(sink)
                sinks.size
            }
            session.handler.post { session.hasListeners = count > 0 }
        }
    }
}

@RequiresApi(Build.VERSION_CODES.S)
private class Api31Listeners(
    private val audioManager: AudioManager,
    private val executor: Executor,
    private val onMode: (Int) -> Unit,
    private val onDevice: (AudioDeviceInfo?) -> Unit,
) {
    private val modeListener = AudioManager.OnModeChangedListener { onMode(it) }
    private val deviceListener = AudioManager.OnCommunicationDeviceChangedListener { onDevice(it) }

    fun register() {
        audioManager.addOnModeChangedListener(executor, modeListener)
        audioManager.addOnCommunicationDeviceChangedListener(executor, deviceListener)
    }

    fun unregister() {
        try {
            audioManager.removeOnModeChangedListener(modeListener)
        } catch (_: RuntimeException) {
        }
        try {
            audioManager.removeOnCommunicationDeviceChangedListener(deviceListener)
        } catch (_: RuntimeException) {
        }
    }
}

@RequiresApi(Build.VERSION_CODES.Q)
private class RecordingListener(
    private val audioManager: AudioManager,
    private val handler: Handler,
    private val onSilenced: (Boolean) -> Unit,
) {
    private val callback = object : AudioManager.AudioRecordingCallback() {
        override fun onRecordingConfigChanged(configs: MutableList<AudioRecordingConfiguration>) {
            onSilenced(configs.any { it.isClientSilenced })
        }
    }

    fun register() {
        audioManager.registerAudioRecordingCallback(callback, handler)
    }

    fun unregister() {
        try {
            audioManager.unregisterAudioRecordingCallback(callback)
        } catch (_: RuntimeException) {
        }
    }
}
