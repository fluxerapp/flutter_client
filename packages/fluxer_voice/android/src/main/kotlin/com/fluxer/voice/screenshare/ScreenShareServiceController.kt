package com.fluxer.voice.screenshare

internal class ScreenShareServiceController(
    private val startService: (title: String, text: String) -> Unit,
    private val stopService: () -> Unit,
) {
    private var startPending = false
    private var stopRequested = false
    private val callbacks = mutableListOf<(Boolean) -> Unit>()

    var isRunning = false
        private set

    fun start(title: String, text: String, callback: (Boolean) -> Unit) {
        if (isRunning) {
            callback(true)
            return
        }
        stopRequested = false
        callbacks.add(callback)
        if (startPending) {
            return
        }
        startPending = true
        try {
            startService(title, text)
        } catch (_: RuntimeException) {
            startPending = false
            complete(false)
        }
    }

    fun stop() {
        complete(false)
        if (startPending) {
            stopRequested = true
            return
        }
        if (isRunning) {
            isRunning = false
            stopService()
        }
    }

    fun onStartCommand(promote: () -> Boolean): Boolean {
        startPending = false
        val keepRunning = promote() && !stopRequested
        stopRequested = false
        isRunning = keepRunning
        complete(keepRunning)
        return keepRunning
    }

    fun onDestroyed() {
        isRunning = false
    }

    private fun complete(started: Boolean) {
        val pending = callbacks.toList()
        callbacks.clear()
        pending.forEach { it(started) }
    }
}
