package com.fluxer.voice

import android.content.Context
import android.content.pm.PackageManager
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Build
import android.telecom.CallAudioState
import android.telecom.Connection
import com.hiennv.flutter_callkit_incoming.CallkitConnection
import com.hiennv.flutter_callkit_incoming.getDataActiveCalls

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
    AudioDeviceInfo.TYPE_HEARING_AID,
    AudioDeviceInfo.TYPE_BLE_SPEAKER,
)

internal val headsetCommunicationDeviceTypes: List<Int> = listOf(
    AudioDeviceInfo.TYPE_WIRED_HEADSET,
    AudioDeviceInfo.TYPE_USB_HEADSET,
    AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
    AudioDeviceInfo.TYPE_USB_DEVICE,
    AudioDeviceInfo.TYPE_USB_ACCESSORY,
)

internal val speakerCommunicationDeviceTypes: List<Int> = listOf(
    AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
    AudioDeviceInfo.TYPE_BUILTIN_SPEAKER_SAFE,
)

internal fun isWatchDevice(device: AudioDeviceInfo): Boolean {
    return device.productName?.toString()?.contains(" Watch", ignoreCase = true) == true
}

internal fun autoSelectableDevices(devices: List<AudioDeviceInfo>): List<AudioDeviceInfo> {
    return devices.filterNot(::isWatchDevice)
}

internal fun voiceOutputRouteFromName(name: String?): VoiceOutputRoute {
    return when (name) {
        "earpiece" -> VoiceOutputRoute.Earpiece
        "headset" -> VoiceOutputRoute.Headset
        "bluetooth" -> VoiceOutputRoute.Bluetooth
        else -> VoiceOutputRoute.Speaker
    }
}

internal fun VoiceOutputRoute.toMessage(): NativeVoiceRoute {
    return when (this) {
        VoiceOutputRoute.Speaker -> NativeVoiceRoute.SPEAKER
        VoiceOutputRoute.Earpiece -> NativeVoiceRoute.EARPIECE
        VoiceOutputRoute.Headset -> NativeVoiceRoute.HEADSET
        VoiceOutputRoute.Bluetooth -> NativeVoiceRoute.BLUETOOTH
    }
}

internal fun NativeVoiceRoute.toVoiceOutputRoute(): VoiceOutputRoute {
    return when (this) {
        NativeVoiceRoute.SPEAKER -> VoiceOutputRoute.Speaker
        NativeVoiceRoute.EARPIECE -> VoiceOutputRoute.Earpiece
        NativeVoiceRoute.HEADSET -> VoiceOutputRoute.Headset
        NativeVoiceRoute.BLUETOOTH -> VoiceOutputRoute.Bluetooth
    }
}

internal enum class VoiceOutputDeviceKind(
    val message: NativeVoiceDeviceKind,
    val route: VoiceOutputRoute,
) {
    Earpiece(NativeVoiceDeviceKind.EARPIECE, VoiceOutputRoute.Earpiece),
    Speaker(NativeVoiceDeviceKind.SPEAKER, VoiceOutputRoute.Speaker),
    Wired(NativeVoiceDeviceKind.WIRED, VoiceOutputRoute.Headset),
    Usb(NativeVoiceDeviceKind.USB, VoiceOutputRoute.Headset),
    Bluetooth(NativeVoiceDeviceKind.BLUETOOTH, VoiceOutputRoute.Bluetooth),
    BluetoothLe(NativeVoiceDeviceKind.BLUETOOTH_LE, VoiceOutputRoute.Bluetooth),
    HearingAid(NativeVoiceDeviceKind.HEARING_AID, VoiceOutputRoute.Bluetooth),
}

internal fun voiceOutputDeviceKind(type: Int): VoiceOutputDeviceKind? {
    return when (type) {
        AudioDeviceInfo.TYPE_BUILTIN_EARPIECE -> VoiceOutputDeviceKind.Earpiece
        AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
        AudioDeviceInfo.TYPE_BUILTIN_SPEAKER_SAFE,
        -> VoiceOutputDeviceKind.Speaker
        AudioDeviceInfo.TYPE_WIRED_HEADSET,
        AudioDeviceInfo.TYPE_WIRED_HEADPHONES,
        -> VoiceOutputDeviceKind.Wired
        AudioDeviceInfo.TYPE_USB_HEADSET,
        AudioDeviceInfo.TYPE_USB_DEVICE,
        AudioDeviceInfo.TYPE_USB_ACCESSORY,
        -> VoiceOutputDeviceKind.Usb
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
    fun toMessage(): NativeVoiceDevice = NativeVoiceDevice(
        id = id.toLong(),
        kind = kind.message,
        name = name,
        active = active,
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
        .sortedWith(compareBy({ it.kind.ordinal }, { it.name?.contains(" Watch", ignoreCase = true) == true }))
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

internal fun communicationDeviceTypesForRoute(route: VoiceOutputRoute): List<Int> {
    return when (route) {
        VoiceOutputRoute.Speaker -> speakerCommunicationDeviceTypes
        VoiceOutputRoute.Earpiece -> listOf(AudioDeviceInfo.TYPE_BUILTIN_EARPIECE)
        VoiceOutputRoute.Headset -> headsetCommunicationDeviceTypes
        VoiceOutputRoute.Bluetooth -> bluetoothCommunicationDeviceTypes
    }
}

internal fun communicationDeviceCandidates(
    route: VoiceOutputRoute,
    devices: List<AudioDeviceInfo>,
    deviceId: Int? = null,
): List<AudioDeviceInfo> {
    val requested = devices.firstOrNull {
        it.id == deviceId && voiceOutputDeviceKind(it.type)?.route == route
    }
    val automatic = autoSelectableDevices(devices)
    val ordered = communicationDeviceTypesForRoute(route).flatMap { type -> automatic.filter { it.type == type } }
    return (listOfNotNull(requested) + ordered).distinctBy { it.id }
}

internal fun voiceOutputRouteForTelecom(route: Int): VoiceOutputRoute? {
    return when (route) {
        CallAudioState.ROUTE_SPEAKER -> VoiceOutputRoute.Speaker
        CallAudioState.ROUTE_EARPIECE -> VoiceOutputRoute.Earpiece
        CallAudioState.ROUTE_WIRED_HEADSET -> VoiceOutputRoute.Headset
        CallAudioState.ROUTE_BLUETOOTH -> VoiceOutputRoute.Bluetooth
        else -> null
    }
}

internal fun speakerphoneOnForRoute(route: VoiceOutputRoute): Boolean {
    return route == VoiceOutputRoute.Speaker
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

internal fun outputDevices(audioManager: AudioManager): List<AudioDeviceInfo> {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        return audioManager.availableCommunicationDevices
    }
    return audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS).toList()
}

internal fun outputTypes(audioManager: AudioManager): Set<Int> {
    return outputDevices(audioManager).map { it.type }.toSet()
}

internal fun activeCommunicationDeviceId(audioManager: AudioManager): Int? {
    return safeCommunicationDeviceId(audioManager)
}

internal fun requestedBluetoothAddress(
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
    force: Boolean = false,
): Int? {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn = speakerphoneOnForRoute(route)
        return null
    }
    val candidates = communicationDeviceCandidates(
        route,
        audioManager.availableCommunicationDevices,
        deviceId,
    )
    for (device in candidates) {
        if (!force && safeCommunicationDeviceId(audioManager) == device.id) {
            return device.id
        }
        if (force) {
            safeClearCommunicationDevice(audioManager)
        }
        if (safeSetCommunicationDevice(audioManager, device)) {
            return device.id
        }
    }
    return null
}

internal fun safeSetCommunicationDevice(audioManager: AudioManager, device: AudioDeviceInfo): Boolean {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
        return false
    }
    return try {
        audioManager.setCommunicationDevice(device)
    } catch (_: IllegalArgumentException) {
        false
    } catch (_: SecurityException) {
        false
    }
}

internal fun safeClearCommunicationDevice(audioManager: AudioManager) {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
        return
    }
    try {
        audioManager.clearCommunicationDevice()
    } catch (_: RuntimeException) {
    }
}

internal fun safeCommunicationDeviceId(audioManager: AudioManager): Int? {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
        return null
    }
    return try {
        audioManager.communicationDevice?.id
    } catch (_: RuntimeException) {
        null
    }
}

internal fun voiceRouteSearchOrder(
    desired: VoiceOutputRoute,
    builtInDefault: VoiceOutputRoute,
    availableRouteNames: List<String>,
    unavailable: Set<VoiceOutputRoute> = emptySet(),
): List<VoiceOutputRoute> {
    return listOf(
        desired,
        VoiceOutputRoute.Bluetooth,
        VoiceOutputRoute.Headset,
        builtInDefault,
        VoiceOutputRoute.Speaker,
        VoiceOutputRoute.Earpiece,
    )
        .distinct()
        .filter { it !in unavailable && it.name.lowercase() in availableRouteNames }
        .ifEmpty { listOf(VoiceOutputRoute.Speaker) }
}

internal fun automaticRouteNames(devices: List<AudioDeviceInfo>, hasEarpiece: Boolean): List<String> {
    return availableVoiceOutputRouteNames(
        autoSelectableDevices(devices).map { it.type }.toSet(),
        hasEarpiece,
    )
}

internal class ReassertLimiter(
    private val maxCount: Int,
    private val windowMs: Long,
) {
    private val attempts = ArrayDeque<Long>()

    fun tryAcquire(nowMs: Long): Boolean {
        while (attempts.isNotEmpty() && nowMs - attempts.first() >= windowMs) {
            attempts.removeFirst()
        }
        if (attempts.size >= maxCount) {
            return false
        }
        attempts.addLast(nowMs)
        return true
    }

    fun millisUntilNextSlot(nowMs: Long): Long {
        val oldest = attempts.firstOrNull() ?: return 0
        return (windowMs - (nowMs - oldest)).coerceAtLeast(0)
    }

    fun reset() {
        attempts.clear()
    }
}

internal class VoiceRouteEventLog(
    private val capacity: Int,
    private val clock: () -> Long,
) {
    private val entries = ArrayDeque<String>()
    private val origin = clock()

    fun add(message: String) {
        if (entries.size >= capacity) {
            entries.removeFirst()
        }
        entries.addLast("+${clock() - origin}ms $message")
    }

    fun snapshot(): List<String> = entries.toList()
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
        val current = try {
            audioManager.communicationDevice
        } catch (_: RuntimeException) {
            null
        }
        when (val type = current?.type) {
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
        "commDeviceId=${safeCommunicationDeviceId(audioManager)} " +
        "speakerphoneOn=${audioManager.isSpeakerphoneOn} " +
        "callVolume=${audioManager.getStreamVolume(AudioManager.STREAM_VOICE_CALL)}" +
        "/${audioManager.getStreamMaxVolume(AudioManager.STREAM_VOICE_CALL)} " +
        "telecomOwnsRoute=$telecomOwnsRoute " +
        "telecomCalls=$telecomCalls " +
        "sdk=${Build.VERSION.SDK_INT} " +
        "device=${Build.MANUFACTURER}/${Build.MODEL} " +
        "build=${Build.DISPLAY}"
}

internal fun releaseVoiceOutputRoute(audioManager: AudioManager) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        safeClearCommunicationDevice(audioManager)
        return
    }
    @Suppress("DEPRECATION")
    audioManager.isSpeakerphoneOn = false
}
