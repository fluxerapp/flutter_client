package com.fluxer

import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.net.Uri

object SsoAuthSessionTasks {
    const val AUTH_MANAGEMENT_ACTIVITY_CLASS =
        "com.linusu.flutter_web_auth_2.AuthenticationManagementActivity"

    private const val CALLBACK_SCHEME = "fluxer"
    private const val CALLBACK_HOST = "auth"
    private const val CALLBACK_PATH_PREFIX = "/sso/callback"

    fun isSsoCallbackUri(uri: Uri): Boolean {
        return uri.scheme == CALLBACK_SCHEME &&
            uri.host == CALLBACK_HOST &&
            uri.path?.startsWith(CALLBACK_PATH_PREFIX) == true
    }

    fun isSsoAuthSessionActivityClass(className: String?): Boolean {
        if (className.isNullOrEmpty()) {
            return false
        }
        return className == AUTH_MANAGEMENT_ACTIVITY_CLASS
    }

    fun isSsoAuthSessionTask(info: ActivityManager.RecentTaskInfo): Boolean {
        return isSsoAuthSessionActivityClass(info.baseActivity?.className) ||
            isSsoAuthSessionActivityClass(info.topActivity?.className)
    }

    fun dismissOverlayTasks(context: Context) {
        dismissAuthSessions(context)
        InAppBrowserTasks.dismiss(context)
    }

    fun dismissAuthSessions(context: Context) {
        val activityManager =
            context.getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager
                ?: return
        for (task in activityManager.appTasks) {
            if (isSsoAuthSessionTask(task.taskInfo)) {
                task.finishAndRemoveTask()
            }
        }
    }

    fun bringMainActivityToFront(context: Context) {
        val activityManager =
            context.getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager
        val mainClassName = MainActivity::class.java.name
        if (activityManager != null) {
            for (task in activityManager.appTasks) {
                val info = task.taskInfo
                if (
                    info.baseActivity?.className == mainClassName ||
                    info.topActivity?.className == mainClassName
                ) {
                    task.moveToFront()
                    return
                }
            }
        }
        val intent = Intent(context, MainActivity::class.java).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
        }
        context.startActivity(intent)
    }
}
