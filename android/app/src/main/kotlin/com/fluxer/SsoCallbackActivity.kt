package com.fluxer

import android.app.Activity
import android.os.Bundle
import com.linusu.flutter_web_auth_2.FlutterWebAuth2Plugin

class SsoCallbackActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val url = intent?.data
        if (url != null && SsoAuthSessionTasks.isSsoCallbackUri(url)) {
            FlutterWebAuth2Plugin.callbacks.remove(url.scheme)?.success(url.toString())
        }

        SsoAuthSessionTasks.dismissOverlayTasks(this)
        SsoAuthSessionTasks.bringMainActivityToFront(applicationContext)

        finishAndRemoveTask()
    }
}
