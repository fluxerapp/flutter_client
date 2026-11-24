package com.fluxer.voice.screenshare

import com.fluxer.voice.NativeScreenShareNotification
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class ScreenShareServiceBridgeTest {
    private val calls = mutableListOf<String>()
    private val controller = ScreenShareServiceController(
        startService = { _, _ -> calls.add("start") },
        stopService = { calls.add("stop") },
    )

    private fun ScreenShareServiceBridge.startService() {
        start(NativeScreenShareNotification("Fluxer", "Sharing")) {}
        controller.onStartCommand { true }
    }

    @Test
    fun detachingTheOwningEngineStopsTheService() {
        val bridge = ScreenShareServiceBridge(controller)
        bridge.startService()
        assertTrue(bridge.isRunning())

        bridge.unregister()

        assertEquals(listOf("start", "stop"), calls)
        assertFalse(controller.isRunning)
    }

    @Test
    fun detachingAnotherEngineKeepsTheService() {
        ScreenShareServiceBridge(controller).startService()

        ScreenShareServiceBridge(controller).unregister()

        assertEquals(listOf("start"), calls)
        assertTrue(controller.isRunning)
    }
}
