package com.fluxer.voice.screenshare

import com.fluxer.voice.NativeScreenShareNotification
import com.fluxer.voice.VoiceScreenShareServiceHostApi
import io.flutter.plugin.common.BinaryMessenger

internal class ScreenShareServiceBridge(
    private val controller: ScreenShareServiceController,
) : VoiceScreenShareServiceHostApi {
    private var messenger: BinaryMessenger? = null
    private var ownsService = false

    fun register(messenger: BinaryMessenger) {
        this.messenger = messenger
        VoiceScreenShareServiceHostApi.setUp(messenger, this)
    }

    fun unregister() {
        messenger?.let { VoiceScreenShareServiceHostApi.setUp(it, null) }
        messenger = null
        if (ownsService) {
            stop()
        }
    }

    override fun start(
        notification: NativeScreenShareNotification,
        callback: (Result<Boolean>) -> Unit,
    ) {
        ownsService = true
        controller.start(notification.title, notification.text) { started ->
            callback(Result.success(started))
        }
    }

    override fun stop() {
        ownsService = false
        controller.stop()
    }

    override fun isRunning(): Boolean = controller.isRunning
}
