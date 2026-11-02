package com.fluxer

import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

private const val CHANNEL_NAME = "fluxer_app/voice_speaker_route"
private const val ROUTE_FOLLOW_UP_MS = 400L

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
        VoiceOutputRoute.Speaker ->
            speakerphoneOn && activeDeviceType != AudioDeviceInfo.TYPE_BUILTIN_EARPIECE &&
                (activeDeviceType == null ||
                    activeDeviceType == AudioDeviceInfo.TYPE_BUILTIN_SPEAKER)
        VoiceOutputRoute.Earpiece ->
            activeDeviceType == AudioDeviceInfo.TYPE_BUILTIN_EARPIECE
        VoiceOutputRoute.Headset ->
            activeDeviceType != null && activeDeviceType in headsetCommunicationDeviceTypes
    }
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
    private val activity: Activity,
) {
    private val context: Context = activity.applicationContext
    private val mainHandler = Handler(Looper.getMainLooper())
    private var routeFollowUp: Runnable? = null

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
                cancelRouteFollowUp()
                if (hold) {
                    setVoiceCallVolumeKeys(true)
                    scheduleRouteFollowUp(audioManager, route)
                }
                applyVoiceOutputRoute(audioManager, route)
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
        cancelRouteFollowUp()
        setVoiceCallVolumeKeys(false)
        releaseCallSpeaker(audioManager)
        val work = Runnable { releaseCallSpeaker(audioManager) }
        routeFollowUp = work
        mainHandler.postDelayed(work, ROUTE_FOLLOW_UP_MS)
    }

    private fun scheduleRouteFollowUp(audioManager: AudioManager, route: VoiceOutputRoute) {
        val work = Runnable { applyVoiceOutputRoute(audioManager, route) }
        routeFollowUp = work
        mainHandler.postDelayed(work, ROUTE_FOLLOW_UP_MS)
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
    val speakerphoneOn = speakerphoneOnForRoute(route)
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn = speakerphoneOn
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
    @Suppress("DEPRECATION")
    audioManager.isSpeakerphoneOn = speakerphoneOn
    val device = communicationDeviceForRoute(
        route,
        audioManager.availableCommunicationDevices,
    ) ?: return
    if (audioManager.communicationDevice?.id == device.id) {
        return
    }
    audioManager.setCommunicationDevice(device)
    @Suppress("DEPRECATION")
    audioManager.isSpeakerphoneOn = speakerphoneOn
}

internal fun releaseCallSpeaker(audioManager: AudioManager) {
    @Suppress("DEPRECATION")
    audioManager.isSpeakerphoneOn = false
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        audioManager.clearCommunicationDevice()
    }
    audioManager.mode = AudioManager.MODE_NORMAL
    @Suppress("DEPRECATION")
    audioManager.isSpeakerphoneOn = false
}
