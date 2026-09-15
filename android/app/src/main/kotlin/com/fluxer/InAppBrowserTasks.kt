package com.fluxer

import android.app.Activity
import android.app.ActivityManager
import android.content.Context

object InAppBrowserTasks {
    fun dismiss(context: Context) {
        val activityManager =
            context.getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager
                ?: return
        val currentTaskId = (context as? Activity)?.taskId
        for (task in activityManager.appTasks) {
            if (currentTaskId != null && task.taskInfo.taskId == currentTaskId) {
                continue
            }
            if (isInAppBrowserTask(task.taskInfo)) {
                task.finishAndRemoveTask()
            }
        }
    }

    fun isInAppBrowserTask(info: ActivityManager.RecentTaskInfo): Boolean {
        return isInAppBrowserActivityClass(info.baseActivity?.className) ||
            isInAppBrowserActivityClass(info.topActivity?.className)
    }

    fun isInAppBrowserActivityClass(className: String?): Boolean {
        if (className.isNullOrEmpty()) {
            return false
        }
        val name = className.lowercase()
        return name.contains("chrome_custom_tabs") ||
            name.contains("customtabs") ||
            name.contains("customtabactivity") ||
            name.contains("trustedwebactivity") ||
            name.contains("externalappbrowseractivity")
    }
}
