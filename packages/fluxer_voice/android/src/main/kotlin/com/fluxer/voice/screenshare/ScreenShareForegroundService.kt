package com.fluxer.voice.screenshare

import android.annotation.SuppressLint
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder
import android.os.PowerManager
import androidx.core.app.NotificationCompat
import androidx.core.app.ServiceCompat
import androidx.core.content.ContextCompat

private const val NOTIFICATION_CHANNEL_ID = "fluxer_screen_share"
private const val NOTIFICATION_CHANNEL_NAME = "Screen sharing"
private const val LEGACY_NOTIFICATION_CHANNEL_ID = "flutter_background"
private const val NOTIFICATION_ID = 0x73637273
private const val WAKE_LOCK_TAG = "fluxer:screen-share"
private const val ICON_META_DATA = "com.fluxer.voice.SCREEN_SHARE_ICON"
private const val EXTRA_TITLE = "title"
private const val EXTRA_TEXT = "text"

class ScreenShareForegroundService : Service() {
    companion object {
        private var controller: ScreenShareServiceController? = null
        private var current: ScreenShareForegroundService? = null

        internal fun controller(context: Context): ScreenShareServiceController {
            controller?.let { return it }
            val appContext = context.applicationContext
            return ScreenShareServiceController(
                startService = { title, text ->
                    ContextCompat.startForegroundService(
                        appContext,
                        Intent(appContext, ScreenShareForegroundService::class.java)
                            .putExtra(EXTRA_TITLE, title)
                            .putExtra(EXTRA_TEXT, text),
                    )
                },
                stopService = {
                    appContext.stopService(
                        Intent(appContext, ScreenShareForegroundService::class.java),
                    )
                },
            ).also { controller = it }
        }

        fun stop(context: Context) {
            controller(context).stop()
        }
    }

    private var wakeLock: PowerManager.WakeLock? = null

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        current = this
        val keepRunning = controller(this).onStartCommand { promote(intent) }
        if (!keepRunning) {
            stopSelf(startId)
        }
        return START_NOT_STICKY
    }

    override fun onDestroy() {
        releaseWakeLock()
        ServiceCompat.stopForeground(this, ServiceCompat.STOP_FOREGROUND_REMOVE)
        if (current === this) {
            current = null
            controller(this).onDestroyed()
        }
        super.onDestroy()
    }

    private fun promote(intent: Intent?): Boolean {
        val type = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PROJECTION
        } else {
            0
        }
        return try {
            ServiceCompat.startForeground(this, NOTIFICATION_ID, buildNotification(intent), type)
            runCatching { acquireWakeLock() }
            runCatching { deleteLegacyChannel() }
            true
        } catch (_: RuntimeException) {
            false
        }
    }

    private fun deleteLegacyChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            getSystemService(NotificationManager::class.java)
                .deleteNotificationChannel(LEGACY_NOTIFICATION_CHANNEL_ID)
        }
    }

    @SuppressLint("WakelockTimeout")
    private fun acquireWakeLock() {
        if (wakeLock != null) {
            return
        }
        val power = getSystemService(Context.POWER_SERVICE) as PowerManager
        wakeLock = power.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, WAKE_LOCK_TAG).apply {
            setReferenceCounted(false)
            acquire()
        }
    }

    private fun releaseWakeLock() {
        wakeLock?.takeIf { it.isHeld }?.release()
        wakeLock = null
    }

    private fun buildNotification(intent: Intent?): Notification {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            getSystemService(NotificationManager::class.java).createNotificationChannel(
                NotificationChannel(
                    NOTIFICATION_CHANNEL_ID,
                    NOTIFICATION_CHANNEL_NAME,
                    NotificationManager.IMPORTANCE_LOW,
                ),
            )
        }
        return NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
            .setSmallIcon(notificationIcon())
            .setContentTitle(intent?.getStringExtra(EXTRA_TITLE).orEmpty())
            .setContentText(intent?.getStringExtra(EXTRA_TEXT).orEmpty())
            .setContentIntent(launchIntent())
            .setOngoing(true)
            .setSilent(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()
    }

    private fun notificationIcon(): Int {
        val info = packageManager.getApplicationInfo(packageName, PackageManager.GET_META_DATA)
        val icon = info.metaData?.getInt(ICON_META_DATA) ?: 0
        return if (icon != 0) icon else info.icon
    }

    private fun launchIntent(): PendingIntent? {
        val intent = packageManager.getLaunchIntentForPackage(packageName) ?: return null
        return PendingIntent.getActivity(
            this,
            0,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }
}
