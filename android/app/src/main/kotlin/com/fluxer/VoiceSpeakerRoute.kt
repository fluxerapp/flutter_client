package com.fluxer

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
private const val REAPPLY_DELAY_MS = 200L

internal enum class VoiceOutputRoute {
    Speaker,
    Earpiece,
    Headset,
}

internal val headsetCommunicationDeviceTypes: List<Int> = listOf(
    AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
    AudioDeviceInfo.TYPE_BLE_HEADSET,
    AudioDeviceInfo.TYPE_BLUETOOTH_A2DP,
    AudioDeviceInfo.TYPE_BLE_SPEAKER,
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

internal fun communicationDeviceForRoute(
    route: VoiceOutputRoute,
    devices: List<AudioDeviceInfo>,
): AudioDeviceInfo? {
    val types = when (route) {
        VoiceOutputRoute.Speaker -> listOf(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER)
        VoiceOutputRoute.Earpiece -> listOf(AudioDeviceInfo.TYPE_BUILTIN_EARPIECE)
        VoiceOutputRoute.Headset -> headsetCommunicationDeviceTypes
    }
    for (type in types) {
        val match = devices.firstOrNull { it.type == type }
        if (match != null) {
            return match
        }
    }
    return null
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
    private var reapply: Runnable? = null

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
                reapply?.let(mainHandler::removeCallbacks)
                applyVoiceOutputRoute(audioManager, route)
                val again = Runnable { applyVoiceOutputRoute(audioManager, route) }
                reapply = again
                mainHandler.postDelayed(again, REAPPLY_DELAY_MS)
                result.success(null)
            }
            "availableRoutes" -> {
                result.success(availableVoiceOutputRouteNames(outputTypes(audioManager), hasEarpiece()))
            }
            else -> result.notImplemented()
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
    }
}
