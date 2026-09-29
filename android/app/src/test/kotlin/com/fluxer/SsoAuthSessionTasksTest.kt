package com.fluxer

import android.net.Uri
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class SsoAuthSessionTasksTest {
    @Test
    fun acceptsRegisteredSsoCallbackUri() {
        assertTrue(
            SsoAuthSessionTasks.isSsoCallbackUri(
                Uri.parse("fluxer://auth/sso/callback?code=1&state=2"),
            ),
        )
    }

    @Test
    fun rejectsOtherFluxerDeepLinks() {
        assertFalse(
            SsoAuthSessionTasks.isSsoCallbackUri(Uri.parse("fluxer://channels/@me")),
        )
        assertFalse(
            SsoAuthSessionTasks.isSsoCallbackUri(Uri.parse("https://auth/sso/callback")),
        )
    }

    @Test
    fun matchesFlutterWebAuthManagementActivity() {
        assertTrue(
            SsoAuthSessionTasks.isSsoAuthSessionActivityClass(
                SsoAuthSessionTasks.AUTH_MANAGEMENT_ACTIVITY_CLASS,
            ),
        )
    }

    @Test
    fun ignoresAppAndPluginCallbackActivities() {
        assertFalse(
            SsoAuthSessionTasks.isSsoAuthSessionActivityClass(
                "com.fluxer.MainActivity",
            ),
        )
        assertFalse(
            SsoAuthSessionTasks.isSsoAuthSessionActivityClass(
                "com.fluxer.SsoCallbackActivity",
            ),
        )
        assertFalse(
            SsoAuthSessionTasks.isSsoAuthSessionActivityClass(
                "com.linusu.flutter_web_auth_2.CallbackActivity",
            ),
        )
        assertFalse(SsoAuthSessionTasks.isSsoAuthSessionActivityClass(null))
        assertFalse(SsoAuthSessionTasks.isSsoAuthSessionActivityClass(""))
    }
}
