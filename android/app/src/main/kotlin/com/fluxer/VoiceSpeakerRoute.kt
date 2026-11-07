package com.fluxer

import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.telecom.CallAudioState
import android.telecom.Connection
import com.hiennv.flutter_callkit_incoming.CallkitConnection
import com.hiennv.flutter_callkit_incoming.getDataActiveCalls
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

private const val CHANNEL_NAME = "fluxer_app/voice_speaker_route"
private const val ROUTE_FOLLOW_UP_MS = 400L

internal object FluxerRouteOwnership {
    @Volatile
    var holdsRoute: Boolean = false
}

internal enum class VoiceOutputRoute {
    Speaker,
    Earpiece,
    Headset,
    Bluetooth,
}

internal val bluetoothCommunicationDeviceTypes: List<Int> = listOf(
    AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
    AudioDeviceInfo.TYPE_BLE_HEADSET,
    AudioDeviceInfo.TYPE_BLE_SPEAKER,
    AudioDeviceInfo.TYPE_HEARING_AID,
)

internal val headsetCommunicationDeviceTypes: List<Int> = listOf(
    AudioDeviceInfo.TYPE_WIRED_HEADSET,
    AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
    AudioDeviceInfo.TYPE_USB_HEADSET,
)

internal fun voiceOutputRouteFromName(name: String?): VoiceOutputRoute {
    return when (name) {
        "earpiece" -> VoiceOutputRoute.Earpiece
        "headset" -> VoiceOutputRoute.Headset
        "bluetooth" -> VoiceOutputRoute.Bluetooth
        else -> VoiceOutputRoute.Speaker
    }
}

internal enum class VoiceOutputDeviceKind(
    val wireName: String,
    val route: VoiceOutputRoute,
) {
    Earpiece("earpiece", VoiceOutputRoute.Earpiece),
    Speaker("speaker", VoiceOutputRoute.Speaker),
    Wired("wired", VoiceOutputRoute.Headset),
    Usb("usb", VoiceOutputRoute.Headset),
    Bluetooth("bluetooth", VoiceOutputRoute.Bluetooth),
    BluetoothLe("bluetoothLe", VoiceOutputRoute.Bluetooth),
    HearingAid("hearingAid", VoiceOutputRoute.Bluetooth),
}

internal fun voiceOutputDeviceKind(type: Int): VoiceOutputDeviceKind? {
    return when (type) {
        AudioDeviceInfo.TYPE_BUILTIN_EARPIECE -> VoiceOutputDeviceKind.Earpiece
        AudioDeviceInfo.TYPE_BUILTIN_SPEAKER -> VoiceOutputDeviceKind.Speaker
        AudioDeviceInfo.TYPE_WIRED_HEADSET,
        AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
        -> VoiceOutputDeviceKind.Wired
        AudioDeviceInfo.TYPE_USB_HEADSET -> VoiceOutputDeviceKind.Usb
        AudioDeviceInfo.TYPE_BLUETOOTH_SCO -> VoiceOutputDeviceKind.Bluetooth
        AudioDeviceInfo.TYPE_BLE_HEADSET,
        AudioDeviceInfo.TYPE_BLE_SPEAKER,
        -> VoiceOutputDeviceKind.BluetoothLe
        AudioDeviceInfo.TYPE_HEARING_AID -> VoiceOutputDeviceKind.HearingAid
        else -> null
    }
}

internal data class VoiceOutputDevice(
    val id: Int,
    val kind: VoiceOutputDeviceKind,
    val name: String?,
    val active: Boolean,
) {
    fun toMap(): Map<String, Any?> = mapOf(
        "id" to id,
        "kind" to kind.wireName,
        "name" to name,
        "active" to active,
    )
}

internal fun voiceOutputDevices(
    devices: List<AudioDeviceInfo>,
    hasEarpiece: Boolean,
    activeDeviceId: Int?,
): List<VoiceOutputDevice> {
    val routeNames = availableVoiceOutputRouteNames(devices.map { it.type }.toSet(), hasEarpiece)
    return devices
        .mapNotNull { device ->
            val kind = voiceOutputDeviceKind(device.type) ?: return@mapNotNull null
            VoiceOutputDevice(
                id = device.id,
                kind = kind,
                name = device.productName?.toString()?.takeIf { it.isNotBlank() },
                active = device.id == activeDeviceId,
            )
        }
        .filter { it.kind.route.name.lowercase() in routeNames }
        .distinctBy { it.kind to it.name }
        .sortedBy { it.kind.ordinal }
}

internal fun bluetoothAddressesMatch(first: String?, second: String?): Boolean {
    if (first.isNullOrBlank() || second.isNullOrBlank()) {
        return false
    }
    if (first.equals(second, ignoreCase = true)) {
        return true
    }
    val anonymized = first.startsWith("XX", ignoreCase = true) ||
        second.startsWith("XX", ignoreCase = true)
    return anonymized && first.takeLast(5).equals(second.takeLast(5), ignoreCase = true)
}

internal fun communicationDeviceTypeForRoute(
    route: VoiceOutputRoute,
    deviceTypes: Iterable<Int>,
): Int? {
    val available = deviceTypes.toSet()
    val preferredTypes = when (route) {
        VoiceOutputRoute.Speaker -> listOf(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER)
        VoiceOutputRoute.Earpiece -> listOf(AudioDeviceInfo.TYPE_BUILTIN_EARPIECE)
        VoiceOutputRoute.Headset -> headsetCommunicationDeviceTypes
        VoiceOutputRoute.Bluetooth -> bluetoothCommunicationDeviceTypes
    }
    for (type in preferredTypes) {
        if (type in available) {
            return type
        }
    }
    return null
}

internal fun communicationDeviceForRoute(
    route: VoiceOutputRoute,
    devices: List<AudioDeviceInfo>,
    deviceId: Int? = null,
): AudioDeviceInfo? {
    val requested = devices.firstOrNull { it.id == deviceId }
    if (requested != null && voiceOutputDeviceKind(requested.type)?.route == route) {
        return requested
    }
    val type = communicationDeviceTypeForRoute(route, devices.map { it.type }) ?: return null
    return devices.firstOrNull { it.type == type }
}

internal fun speakerphoneOnForRoute(route: VoiceOutputRoute): Boolean {
    return route == VoiceOutputRoute.Speaker
}

internal fun routesSpeakerWithCommunicationDevice(
    manufacturer: String?,
    brand: String? = null,
): Boolean {
    return manufacturer.equalsSamsung() || brand.equalsSamsung()
}

private fun String?.equalsSamsung(): Boolean {
    return this?.equals("samsung", ignoreCase = true) == true
}

internal fun routeFollowUpDelaysMs(
    manufacturer: String?,
    brand: String? = null,
): List<Long> {
    return if (routesSpeakerWithCommunicationDevice(manufacturer, brand)) {
        listOf(ROUTE_FOLLOW_UP_MS, 1000L, 2500L, 5000L)
    } else {
        listOf(ROUTE_FOLLOW_UP_MS)
    }
}

internal fun telecomRouteForVoiceOutput(route: VoiceOutputRoute): Int {
    return when (route) {
        VoiceOutputRoute.Speaker -> CallAudioState.ROUTE_SPEAKER
        VoiceOutputRoute.Earpiece -> CallAudioState.ROUTE_EARPIECE
        VoiceOutputRoute.Headset -> CallAudioState.ROUTE_WIRED_HEADSET
        VoiceOutputRoute.Bluetooth -> CallAudioState.ROUTE_BLUETOOTH
    }
}

internal fun telecomRouteRequestNeeded(
    target: Int,
    currentRoute: Int?,
    supportedRouteMask: Int?,
    force: Boolean,
): Boolean {
    if (supportedRouteMask != null && supportedRouteMask and target == 0) {
        return false
    }
    return force || currentRoute != target
}

internal fun availableVoiceOutputRouteNames(
    outputTypes: Set<Int>,
    hasEarpiece: Boolean,
): List<String> {
    val names = mutableListOf("speaker")
    val wiredConnected = outputTypes.any { it in headsetCommunicationDeviceTypes }
    if (!wiredConnected && (AudioDeviceInfo.TYPE_BUILTIN_EARPIECE in outputTypes || hasEarpiece)) {
        names.add("earpiece")
    }
    if (wiredConnected) {
        names.add("headset")
    }
    if (outputTypes.any { it in bluetoothCommunicationDeviceTypes }) {
        names.add("bluetooth")
    }
    return names
}

class VoiceSpeakerRouteBridge(
    private val activity: Activity,
) {
    private val context: Context = activity.applicationContext
    private val mainHandler = Handler(Looper.getMainLooper())
    private var routeFollowUp: Runnable? = null
    private var telecomOwnsRoute = false

    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setMethodCallHandler(::onMethodCall)
    }

    private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
        when (call.method) {
            "setRoute" -> {
                val route = voiceOutputRouteFromName(call.argument<String>("route"))
                val hold = call.argument<Boolean>("hold") ?: false
                val deviceId = call.argument<Int>("deviceId")
                cancelRouteFollowUp()
                if (!hold && isExternalVoiceCallActive(context, fluxerOwnsVoice = false)) {
                    result.success(null)
                    return
                }
                if (hold) {
                    setVoiceCallVolumeKeys(true)
                    scheduleRouteFollowUp(audioManager, route, deviceId)
                }
                applyRoute(audioManager, route, deviceId, force = true)
                FluxerRouteOwnership.holdsRoute = true
                result.success(null)
            }
            "clearRouteHold" -> {
                clearRouteHold(audioManager)
                result.success(null)
            }
            "routeDiagnostics" -> {
                result.success(
                    voiceRouteDiagnostics(
                        audioManager,
                        telecomCallConnections(context),
                        telecomOwnsRoute,
                    ),
                )
            }
            "availableRoutes" -> {
                result.success(availableVoiceOutputRouteNames(outputTypes(audioManager), hasEarpiece()))
            }
            "outputDevices" -> {
                result.success(
                    voiceOutputDevices(
                        outputDevices(audioManager),
                        hasEarpiece(),
                        activeCommunicationDeviceId(audioManager),
                    ).map { it.toMap() },
                )
            }
            else -> result.notImplemented()
        }
    }

    private fun clearRouteHold(audioManager: AudioManager) {
        cancelRouteFollowUp()
        telecomOwnsRoute = false
        if (!FluxerRouteOwnership.holdsRoute) {
            return
        }
        FluxerRouteOwnership.holdsRoute = false
        setVoiceCallVolumeKeys(false)
        releaseCallSpeaker(audioManager)
        val work = Runnable { releaseCallSpeaker(audioManager) }
        routeFollowUp = work
        mainHandler.postDelayed(work, ROUTE_FOLLOW_UP_MS)
    }

    private fun scheduleRouteFollowUp(
        audioManager: AudioManager,
        route: VoiceOutputRoute,
        deviceId: Int?,
        delaysMs: List<Long> = routeFollowUpDelaysMs(Build.MANUFACTURER, Build.BRAND),
    ) {
        val delayMs = delaysMs.firstOrNull() ?: return
        val work = Runnable {
            applyRoute(audioManager, route, deviceId)
            scheduleRouteFollowUp(audioManager, route, deviceId, delaysMs.drop(1))
        }
        routeFollowUp = work
        mainHandler.postDelayed(work, delayMs)
    }

    private fun applyRoute(
        audioManager: AudioManager,
        route: VoiceOutputRoute,
        deviceId: Int?,
        force: Boolean = false,
    ) {
        val connections = if (routesSpeakerWithCommunicationDevice(Build.MANUFACTURER, Build.BRAND)) {
            telecomCallConnections(context)
        } else {
            emptyList()
        }
        if (connections.isEmpty()) {
            telecomOwnsRoute = false
            applyVoiceOutputRoute(audioManager, route, deviceId)
            return
        }
        val bluetoothAddress = requestedBluetoothAddress(audioManager, route, deviceId)
        val handingOff = !telecomOwnsRoute
        if (handingOff) {
            telecomOwnsRoute = true
            releaseCallSpeaker(audioManager)
        }
        for (connection in connections) {
            applyTelecomCallRoute(
                connection,
                route,
                bluetoothAddress,
                force = force || handingOff,
            )
        }
    }

    private fun cancelRouteFollowUp() {
        routeFollowUp?.let(mainHandler::removeCallbacks)
        routeFollowUp = null
    }

    private fun setVoiceCallVolumeKeys(enabled: Boolean) {
        val stream = if (enabled) {
            AudioManager.STREAM_VOICE_CALL
        } else {
            AudioManager.USE_DEFAULT_STREAM_TYPE
        }
        activity.runOnUiThread {
            activity.volumeControlStream = stream
        }
    }

    private fun hasEarpiece(): Boolean {
        return context.packageManager.hasSystemFeature(PackageManager.FEATURE_TELEPHONY)
    }
}

internal fun outputDevices(audioManager: AudioManager): List<AudioDeviceInfo> {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        return audioManager.availableCommunicationDevices
    }
    return audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS).toList()
}

internal fun outputTypes(audioManager: AudioManager): Set<Int> {
    return outputDevices(audioManager).map { it.type }.toSet()
}

private fun activeCommunicationDeviceId(audioManager: AudioManager): Int? {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
        return null
    }
    return audioManager.communicationDevice?.id
}

private fun requestedBluetoothAddress(
    audioManager: AudioManager,
    route: VoiceOutputRoute,
    deviceId: Int?,
): String? {
    if (route != VoiceOutputRoute.Bluetooth ||
        deviceId == null ||
        Build.VERSION.SDK_INT < Build.VERSION_CODES.P
    ) {
        return null
    }
    return outputDevices(audioManager).firstOrNull { it.id == deviceId }?.address
}

internal fun applyVoiceOutputRoute(
    audioManager: AudioManager,
    route: VoiceOutputRoute,
    deviceId: Int? = null,
) {
    audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
    val speakerphoneOn = speakerphoneOnForRoute(route)
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn = speakerphoneOn
        setBluetoothSco(audioManager, route == VoiceOutputRoute.Bluetooth)
        return
    }
    if (route == VoiceOutputRoute.Speaker &&
        !routesSpeakerWithCommunicationDevice(Build.MANUFACTURER, Build.BRAND)
    ) {
        val current = audioManager.communicationDevice
        if (current != null && current.type != AudioDeviceInfo.TYPE_BUILTIN_SPEAKER) {
            audioManager.clearCommunicationDevice()
        }
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn = true
        return
    }
    val device = communicationDeviceForRoute(
        route,
        audioManager.availableCommunicationDevices,
        deviceId,
    )
    if (device != null && audioManager.communicationDevice?.id != device.id) {
        if (!audioManager.setCommunicationDevice(device)) {
            audioManager.clearCommunicationDevice()
        }
    }
    @Suppress("DEPRECATION")
    audioManager.isSpeakerphoneOn = speakerphoneOn
}

@Suppress("DEPRECATION")
private fun setBluetoothSco(audioManager: AudioManager, enabled: Boolean) {
    if (audioManager.isBluetoothScoOn == enabled) {
        return
    }
    if (enabled) {
        audioManager.startBluetoothSco()
    } else {
        audioManager.stopBluetoothSco()
    }
}

internal fun telecomCallConnections(context: Context): List<CallkitConnection> {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
        return emptyList()
    }
    return getDataActiveCalls(context).mapNotNull { CallkitConnection.find(it.id) }
}

@Suppress("DEPRECATION")
internal fun applyTelecomCallRoute(
    connection: CallkitConnection,
    route: VoiceOutputRoute,
    bluetoothAddress: String?,
    force: Boolean,
) {
    val state = connection.callAudioState
    val target = telecomRouteForVoiceOutput(route)
    if (bluetoothAddress != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && state != null) {
        val bluetoothDevice = state.supportedBluetoothDevices.firstOrNull {
            bluetoothAddressesMatch(it.address, bluetoothAddress)
        }
        if (bluetoothDevice != null) {
            val alreadyActive = state.route == CallAudioState.ROUTE_BLUETOOTH &&
                bluetoothAddressesMatch(state.activeBluetoothDevice?.address, bluetoothAddress)
            if (force || !alreadyActive) {
                connection.requestBluetoothAudio(bluetoothDevice)
            }
            return
        }
    }
    if (telecomRouteRequestNeeded(target, state?.route, state?.supportedRouteMask, force)) {
        connection.setAudioRoute(target)
    }
}

@Suppress("DEPRECATION")
internal fun voiceRouteDiagnostics(
    audioManager: AudioManager,
    connections: List<CallkitConnection>,
    telecomOwnsRoute: Boolean,
): String {
    val communicationDevice = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        when (val type = audioManager.communicationDevice?.type) {
            null -> "none"
            AudioDeviceInfo.TYPE_BUILTIN_SPEAKER -> "speaker"
            AudioDeviceInfo.TYPE_BUILTIN_EARPIECE -> "earpiece"
            else -> "type$type"
        }
    } else {
        "unsupported"
    }
    val telecomCalls = connections.joinToString(prefix = "[", postfix = "]") { connection ->
        val state = connection.callAudioState
        val route = state?.let { CallAudioState.audioRouteToString(it.route) } ?: "unknown"
        "${Connection.stateToString(connection.state)}/$route"
    }
    return "mode=${audioManager.mode} " +
        "commDevice=$communicationDevice " +
        "commDeviceId=${activeCommunicationDeviceId(audioManager)} " +
        "speakerphoneOn=${audioManager.isSpeakerphoneOn} " +
        "telecomOwnsRoute=$telecomOwnsRoute " +
        "telecomCalls=$telecomCalls " +
        "build=${Build.DISPLAY}"
}

internal fun releaseCallSpeaker(audioManager: AudioManager) {
    @Suppress("DEPRECATION")
    audioManager.isSpeakerphoneOn = false
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        audioManager.clearCommunicationDevice()
    } else {
        setBluetoothSco(audioManager, false)
    }
    audioManager.mode = AudioManager.MODE_NORMAL
    @Suppress("DEPRECATION")
    audioManager.isSpeakerphoneOn = false
}
