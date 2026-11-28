package com.fluxer

import android.app.ForegroundServiceStartNotAllowedException
import android.content.Context
import android.content.SharedPreferences
import android.os.Build

internal object UnifiedPushBackgroundDeliveryStore {
    private const val PREFS_NAME = "fluxer_unified_push_delivery"
    private const val KEY_FOREGROUND_START_REFUSED = "foreground_start_refused"

    fun isForegroundStartRefusal(error: Throwable): Boolean =
        Build.VERSION.SDK_INT >= Build.VERSION_CODES.S &&
            error is ForegroundServiceStartNotAllowedException

    fun markForegroundStartRefused(context: Context) {
        prefs(context).edit().putBoolean(KEY_FOREGROUND_START_REFUSED, true).apply()
    }

    fun wasForegroundStartRefused(context: Context): Boolean =
        prefs(context).getBoolean(KEY_FOREGROUND_START_REFUSED, false)

    fun clear(context: Context) {
        prefs(context).edit().remove(KEY_FOREGROUND_START_REFUSED).apply()
    }

    private fun prefs(context: Context): SharedPreferences =
        context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
}
