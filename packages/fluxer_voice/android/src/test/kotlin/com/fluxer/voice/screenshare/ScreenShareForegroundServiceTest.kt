package com.fluxer.voice.screenshare

import android.app.Application
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Intent
import android.os.Build
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [Build.VERSION_CODES.S])
class ScreenShareForegroundServiceTest {
    private val app: Application = RuntimeEnvironment.getApplication()

    @Test
    fun startedServiceIsForegroundAndStopsWithoutAnotherStart() {
        val controller = ScreenShareForegroundService.controller(app)
        controller.start("Fluxer", "Sharing") {}
        val intent: Intent = shadowOf(app).nextStartedService
        val service = Robolectric.buildService(ScreenShareForegroundService::class.java, intent)
            .create()
            .startCommand(0, 1)

        assertTrue(controller.isRunning)
        assertNotNull(shadowOf(service.get()).lastForegroundNotification)

        ScreenShareForegroundService.stop(app)

        assertNull(shadowOf(app).nextStartedService)
        assertNotNull(shadowOf(app).nextStoppedService)

        service.destroy()
        ScreenShareForegroundService.stop(app)

        assertFalse(controller.isRunning)
        assertNull(shadowOf(app).nextStartedService)
        assertNull(shadowOf(app).nextStoppedService)
    }

    @Test
    fun destroyingAReplacedInstanceKeepsTheNewOneRunning() {
        val controller = ScreenShareForegroundService.controller(app)
        controller.start("Fluxer", "Sharing") {}
        val first = Robolectric.buildService(
            ScreenShareForegroundService::class.java,
            shadowOf(app).nextStartedService,
        ).create().startCommand(0, 1)
        controller.stop()
        controller.start("Fluxer", "Sharing") {}
        val second = Robolectric.buildService(
            ScreenShareForegroundService::class.java,
            shadowOf(app).nextStartedService,
        ).create().startCommand(0, 1)

        first.destroy()
        assertTrue(controller.isRunning)

        second.destroy()
        assertFalse(controller.isRunning)
    }

    @Test
    fun startReplacesTheLegacyNotificationChannel() {
        val manager = app.getSystemService(NotificationManager::class.java)
        manager.createNotificationChannel(
            NotificationChannel("flutter_background", "Fluxer", NotificationManager.IMPORTANCE_DEFAULT),
        )
        ScreenShareForegroundService.controller(app).start("Fluxer", "Sharing") {}
        val service = Robolectric.buildService(
            ScreenShareForegroundService::class.java,
            shadowOf(app).nextStartedService,
        ).create().startCommand(0, 1)

        assertNull(manager.getNotificationChannel("flutter_background"))
        assertNotNull(manager.getNotificationChannel("fluxer_screen_share"))

        service.destroy()
    }
}
