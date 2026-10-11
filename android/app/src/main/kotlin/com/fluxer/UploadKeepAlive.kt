package com.fluxer

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat
import androidx.core.app.ServiceCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

private const val CHANNEL_NAME = "fluxer_app/upload_keep_alive"
private const val NOTIFICATION_CHANNEL_ID = "fluxer_uploads"
private const val NOTIFICATION_CHANNEL_NAME = "Uploads"
private const val NOTIFICATION_ID = 0x75706c
private const val EXTRA_TITLE = "title"

class UploadKeepAliveBridge(private val context: Context) {
    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "start" -> {
                        UploadKeepAliveService.stopRequested = false
                        val title = call.argument<String>(EXTRA_TITLE) ?: ""
                        val intent = Intent(context, UploadKeepAliveService::class.java)
                            .putExtra(EXTRA_TITLE, title)
                        runCatching { ContextCompat.startForegroundService(context, intent) }
                            .onSuccess { UploadKeepAliveService.pendingStarts += 1 }
                        result.success(null)
                    }
                    "stop" -> {
                        if (UploadKeepAliveService.pendingStarts == 0) {
                            context.stopService(Intent(context, UploadKeepAliveService::class.java))
                        } else {
                            UploadKeepAliveService.stopRequested = true
                        }
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
    }
}

class UploadKeepAliveService : Service() {
    companion object {
        var pendingStarts = 0
        var stopRequested = false
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        pendingStarts = maxOf(pendingStarts - 1, 0)
        val title = intent?.getStringExtra(EXTRA_TITLE).orEmpty()
        val type = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC
        } else {
            0
        }
        val started = runCatching {
            ServiceCompat.startForeground(this, NOTIFICATION_ID, buildNotification(title), type)
        }
        if (started.isFailure || (stopRequested && pendingStarts == 0)) {
            stopSelf(startId)
        }
        return START_NOT_STICKY
    }

    override fun onTimeout(startId: Int, fgsType: Int) {
        stopSelf()
    }

    private fun buildNotification(title: String): Notification {
        val manager = getSystemService(NotificationManager::class.java)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O &&
            manager?.getNotificationChannel(NOTIFICATION_CHANNEL_ID) == null
        ) {
            manager?.createNotificationChannel(
                NotificationChannel(
                    NOTIFICATION_CHANNEL_ID,
                    NOTIFICATION_CHANNEL_NAME,
                    NotificationManager.IMPORTANCE_LOW,
                ),
            )
        }
        return NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
            .setSmallIcon(R.drawable.fluxer_logo_monochrome)
            .setContentTitle(title)
            .setProgress(0, 0, true)
            .setOngoing(true)
            .setSilent(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()
    }
}
