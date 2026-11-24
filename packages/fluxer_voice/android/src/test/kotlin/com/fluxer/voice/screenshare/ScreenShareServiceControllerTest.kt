package com.fluxer.voice.screenshare

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class ScreenShareServiceControllerTest {
    private val calls = mutableListOf<String>()
    private val results = mutableListOf<Boolean>()
    private var startError: RuntimeException? = null
    private val controller = ScreenShareServiceController(
        startService = { title, text ->
            calls.add("start $title/$text")
            startError?.let { throw it }
        },
        stopService = { calls.add("stop") },
    )

    private fun start() = controller.start("Fluxer", "Sharing") { results.add(it) }

    @Test
    fun startCompletesOnceTheServiceIsForeground() {
        start()
        assertTrue(results.isEmpty())
        assertFalse(controller.isRunning)

        assertTrue(controller.onStartCommand { true })

        assertEquals(listOf(true), results)
        assertTrue(controller.isRunning)
    }

    @Test
    fun stoppingAServiceThatIsNotRunningDoesNothing() {
        controller.stop()
        assertTrue(calls.isEmpty())
    }

    @Test
    fun stoppingAfterTheSystemDestroyedTheServiceDoesNothing() {
        start()
        controller.onStartCommand { true }
        controller.onDestroyed()

        assertFalse(controller.isRunning)
        controller.stop()

        assertEquals(listOf("start Fluxer/Sharing"), calls)
    }

    @Test
    fun repeatedStopsOnlyStopTheServiceOnce() {
        start()
        controller.onStartCommand { true }

        controller.stop()
        controller.stop()

        assertEquals(listOf("start Fluxer/Sharing", "stop"), calls)
    }

    @Test
    fun stopDuringAPendingStartWaitsForThePromotion() {
        start()
        controller.stop()
        assertEquals(listOf("start Fluxer/Sharing"), calls)
        assertEquals(listOf(false), results)

        var promoted = false
        assertFalse(controller.onStartCommand { promoted = true; true })

        assertTrue(promoted)
        assertFalse(controller.isRunning)
    }

    @Test
    fun restartDuringAPendingStopKeepsTheService() {
        start()
        controller.stop()
        start()

        assertTrue(controller.onStartCommand { true })

        assertEquals(listOf("start Fluxer/Sharing"), calls)
        assertEquals(listOf(false, true), results)
    }

    @Test
    fun concurrentStartsShareOneService() {
        start()
        start()
        controller.onStartCommand { true }
        start()

        assertEquals(listOf("start Fluxer/Sharing"), calls)
        assertEquals(listOf(true, true, true), results)
    }

    @Test
    fun rejectedStartReportsFailureAndCanBeRetried() {
        startError = IllegalStateException()
        start()
        assertEquals(listOf(false), results)

        startError = null
        start()
        assertTrue(controller.onStartCommand { true })
        assertEquals(listOf(false, true), results)
    }

    @Test
    fun failedPromotionReportsFailure() {
        start()
        assertFalse(controller.onStartCommand { false })
        assertEquals(listOf(false), results)
        assertFalse(controller.isRunning)
    }
}
