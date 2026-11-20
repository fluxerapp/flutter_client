package com.fluxer

import android.app.ActivityManager
import android.app.Service
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.IBinder

internal fun resolvesToMainActivity(context: Context, component: ComponentName?): Boolean {
    if (component == null || component.packageName != context.packageName) {
        return false
    }
    val mainName = MainActivity::class.java.name
    if (component.className == mainName) {
        return true
    }
    return try {
        val info = context.packageManager.getActivityInfo(component, 0)
        (info.targetActivity ?: info.name) == mainName
    } catch (_: PackageManager.NameNotFoundException) {
        false
    }
}

internal fun mainTaskStillPresent(context: Context): Boolean {
    val activityManager = context.getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager
        ?: return false
    val tasks = try {
        activityManager.appTasks
    } catch (_: RuntimeException) {
        return false
    }
    return tasks.any { task ->
        try {
            val info = task.taskInfo ?: return@any false
            resolvesToMainActivity(context, info.baseActivity ?: info.baseIntent?.component)
        } catch (_: RuntimeException) {
            false
        }
    }
}

internal fun shouldEndVoiceForRemovedTask(
    removedRootIsMain: Boolean,
    mainTaskStillPresent: () -> Boolean,
): Boolean {
    if (removedRootIsMain) {
        return true
    }
    return !mainTaskStillPresent()
}

class VoiceTaskRemovedWatcherService : Service() {
    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_NOT_STICKY
    }

    override fun onTaskRemoved(rootIntent: Intent?) {
        val context = applicationContext
        val endVoice = shouldEndVoiceForRemovedTask(
            removedRootIsMain = resolvesToMainActivity(context, rootIntent?.component),
            mainTaskStillPresent = { mainTaskStillPresent(context) },
        )
        if (endVoice) {
            VoiceTaskRemovedRegistry.notifyAppTaskRemoved(context)
            stopSelf()
        }
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
