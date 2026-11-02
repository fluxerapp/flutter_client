package com.fluxer

import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.IBinder

class VoiceTaskRemovedWatcherService : Service() {
    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_NOT_STICKY
    }

    override fun onTaskRemoved(rootIntent: Intent?) {
        VoiceTaskRemovedRegistry.notifyAppTaskRemoved(applicationContext)
        stopSelf()
        super.onTaskRemoved(rootIntent)
    }

    companion object {
        fun start(context: Context) {
            val appContext = context.applicationContext
            appContext.startService(
                Intent(appContext, VoiceTaskRemovedWatcherService::class.java),
            )
        }

        fun stop(context: Context) {
            val appContext = context.applicationContext
            appContext.stopService(
                Intent(appContext, VoiceTaskRemovedWatcherService::class.java),
            )
        }
    }
}
