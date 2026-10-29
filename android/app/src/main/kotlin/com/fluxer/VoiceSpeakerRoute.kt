package com.fluxer

import android.content.Context
import android.content.pm.PackageManager
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.Executor

private const val CHANNEL_NAME = "fluxer_app/voice_speaker_route"
private const val ROUTE_HOLD_DEBOUNCE_MS = 300L
private const val ROUTE_APPLY_SUPPRESS_MS = 600L

internal enum class VoiceOutputRoute {
    Speaker,
    Earpiece,
    Headset,
}

internal val headsetCommunicationDeviceTypes: List<Int> = listOf(
    AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
    AudioDeviceInfo.TYPE_BLE_HEADSET,
    AudioDeviceInfo.TYPE_WIRED_HEADSET,
    AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
    AudioDeviceInfo.TYPE_USB_HEADSET,
)

internal fun voiceOutputRouteFromName(name: String?): VoiceOutputRoute {
    return when (name) {
        "earpiece" -> VoiceOutputRoute.Earpiece
        "headset" -> VoiceOutputRoute.Headset
        else -> VoiceOutputRoute.Speaker
    }
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
): AudioDeviceInfo? {
    val type = communicationDeviceTypeForRoute(route, devices.map { it.type }) ?: return null
    return devices.firstOrNull { it.type == type }
}

internal fun activeCommunicationDeviceTypeMatchesRoute(
    route: VoiceOutputRoute,
    activeDeviceType: Int?,
    speakerphoneOn: Boolean,
    sdkAtLeast31: Boolean,
): Boolean {
    if (!sdkAtLeast31) {
        return when (route) {
            VoiceOutputRoute.Speaker -> speakerphoneOn
            VoiceOutputRoute.Earpiece, VoiceOutputRoute.Headset -> !speakerphoneOn
        }
    }
    return when (route) {
        VoiceOutputRoute.Speaker -> {
            activeDeviceType == AudioDeviceInfo.TYPE_BUILTIN_SPEAKER ||
                (speakerphoneOn && activeDeviceType == null)
        }
        VoiceOutputRoute.Earpiece ->
            activeDeviceType == AudioDeviceInfo.TYPE_BUILTIN_EARPIECE
        VoiceOutputRoute.Headset ->
            activeDeviceType != null && activeDeviceType in headsetCommunicationDeviceTypes
    }
}

internal fun needsSpeakerphoneFallback(
    route: VoiceOutputRoute,
    sdkAtLeast31: Boolean,
    availableTypes: Set<Int>,
    communicationDeviceAccepted: Boolean,
): Boolean {
    if (route != VoiceOutputRoute.Speaker) {
        return false
    }
    if (!sdkAtLeast31) {
        return true
    }
    if (AudioDeviceInfo.TYPE_BUILTIN_SPEAKER !in availableTypes) {
        return true
    }
    return !communicationDeviceAccepted
}

internal fun availableVoiceOutputRouteNames(
    outputTypes: Set<Int>,
    hasEarpiece: Boolean,
): List<String> {
    val names = mutableListOf("speaker")
    if (AudioDeviceInfo.TYPE_BUILTIN_EARPIECE in outputTypes || hasEarpiece) {
        names.add("earpiece")
    }
    if (outputTypes.any { it in headsetCommunicationDeviceTypes }) {
        names.add("headset")
    }
    return names
}

class VoiceSpeakerRouteBridge(
    private val context: Context,
) {
    private val mainHandler = Handler(Looper.getMainLooper())
    private var heldRoute: VoiceOutputRoute? = null
    private var routeHoldDebounce: Runnable? = null
    private var communicationDeviceListener: AudioManager.OnCommunicationDeviceChangedListener? = null
    private var suppressRouteListenerUntilElapsed: Long = 0L

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
                if (hold) {
                    routeHoldDebounce?.let(mainHandler::removeCallbacks)
                    routeHoldDebounce = null
                    heldRoute = route
                    startRouteHoldListener(audioManager)
                    applyHeldRoute(audioManager, route)
                } else {
                    applyVoiceOutputRoute(audioManager, route)
                }
                result.success(null)
            }
            "clearRouteHold" -> {
                clearRouteHold(audioManager)
                result.success(null)
            }
            "availableRoutes" -> {
                result.success(availableVoiceOutputRouteNames(outputTypes(audioManager), hasEarpiece()))
            }
            else -> result.notImplemented()
        }
    }

    private fun clearRouteHold(audioManager: AudioManager) {
        heldRoute = null
        routeHoldDebounce?.let(mainHandler::removeCallbacks)
        routeHoldDebounce = null
        suppressRouteListenerUntilElapsed = 0L
        stopRouteHoldListener(audioManager)
    }

    private fun startRouteHoldListener(audioManager: AudioManager) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            return
        }
        if (communicationDeviceListener != null) {
            return
        }
        val executor = Executor { runnable -> mainHandler.post(runnable) }
        val listener = AudioManager.OnCommunicationDeviceChangedListener {
            scheduleReapplyHeldRoute(audioManager)
        }
        communicationDeviceListener = listener
        audioManager.addOnCommunicationDeviceChangedListener(executor, listener)
    }

    private fun stopRouteHoldListener(audioManager: AudioManager) {
        val listener = communicationDeviceListener ?: return
        try {
            audioManager.removeOnCommunicationDeviceChangedListener(listener)
        } catch (_: Exception) {
        }
        communicationDeviceListener = null
    }

    private fun scheduleReapplyHeldRoute(audioManager: AudioManager) {
        if (SystemClock.elapsedRealtime() < suppressRouteListenerUntilElapsed) {
            return
        }
        val route = heldRoute ?: return
        routeHoldDebounce?.let(mainHandler::removeCallbacks)
        val work = Runnable {
            if (SystemClock.elapsedRealtime() < suppressRouteListenerUntilElapsed) {
                return@Runnable
            }
            if (heldRoute != route) {
                return@Runnable
            }
            if (routeAlreadyActive(audioManager, route)) {
                return@Runnable
            }
            applyHeldRoute(audioManager, route)
        }
        routeHoldDebounce = work
        mainHandler.postDelayed(work, ROUTE_HOLD_DEBOUNCE_MS)
    }

    private fun applyHeldRoute(audioManager: AudioManager, route: VoiceOutputRoute) {
        markRouteApplySuppressWindow()
        applyVoiceOutputRoute(audioManager, route)
    }

    private fun routeAlreadyActive(audioManager: AudioManager, route: VoiceOutputRoute): Boolean {
        val sdkAtLeast31 = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
        @Suppress("DEPRECATION")
        val speakerphoneOn = audioManager.isSpeakerphoneOn
        val activeType = if (sdkAtLeast31) {
            audioManager.communicationDevice?.type
        } else {
            null
        }
        return activeCommunicationDeviceTypeMatchesRoute(
            route = route,
            activeDeviceType = activeType,
            speakerphoneOn = speakerphoneOn,
            sdkAtLeast31 = sdkAtLeast31,
        )
    }

    private fun markRouteApplySuppressWindow() {
        suppressRouteListenerUntilElapsed =
            SystemClock.elapsedRealtime() + ROUTE_APPLY_SUPPRESS_MS
    }

    private fun hasEarpiece(): Boolean {
        return context.packageManager.hasSystemFeature(PackageManager.FEATURE_TELEPHONY)
    }
}

internal fun outputTypes(audioManager: AudioManager): Set<Int> {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        return audioManager.availableCommunicationDevices.map { it.type }.toSet()
    }
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
        return audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS).map { it.type }.toSet()
    }
    return emptySet()
}

internal fun applyVoiceOutputRoute(audioManager: AudioManager, route: VoiceOutputRoute) {
    audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
    if (route != VoiceOutputRoute.Speaker) {
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn = false
    }
    val sdkAtLeast31 = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
    if (!sdkAtLeast31) {
        if (route == VoiceOutputRoute.Speaker) {
            @Suppress("DEPRECATION")
            audioManager.isSpeakerphoneOn = true
        }
        return
    }
    audioManager.clearCommunicationDevice()
    val devices = audioManager.availableCommunicationDevices
    val availableTypes = devices.map { it.type }.toSet()
    val device = communicationDeviceForRoute(route, devices)
    val accepted = device != null && audioManager.setCommunicationDevice(device)
    if (
        needsSpeakerphoneFallback(
            route = route,
            sdkAtLeast31 = true,
            availableTypes = availableTypes,
            communicationDeviceAccepted = accepted,
        )
    ) {
        audioManager.clearCommunicationDevice()
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn = true
    } else if (route == VoiceOutputRoute.Speaker) {
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn = false
    }
}
