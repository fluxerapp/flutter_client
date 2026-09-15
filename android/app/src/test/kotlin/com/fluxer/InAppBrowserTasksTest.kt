package com.fluxer

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class InAppBrowserTasksTest {
    @Test
    fun matchesPluginCustomTabActivities() {
        assertTrue(
            InAppBrowserTasks.isInAppBrowserActivityClass(
                "com.pichillilorenzo.flutter_inappwebview_android.chrome_custom_tabs.ChromeCustomTabsActivity",
            ),
        )
        assertTrue(
            InAppBrowserTasks.isInAppBrowserActivityClass(
                "com.pichillilorenzo.flutter_inappwebview_android.chrome_custom_tabs.ChromeCustomTabsActivitySingleInstance",
            ),
        )
        assertTrue(
            InAppBrowserTasks.isInAppBrowserActivityClass(
                "com.pichillilorenzo.flutter_inappwebview_android.chrome_custom_tabs.TrustedWebActivity",
            ),
        )
    }

    @Test
    fun matchesBrowserCustomTabActivities() {
        assertTrue(
            InAppBrowserTasks.isInAppBrowserActivityClass(
                "org.chromium.chrome.browser.customtabs.CustomTabActivity",
            ),
        )
        assertTrue(
            InAppBrowserTasks.isInAppBrowserActivityClass(
                "androidx.browser.customtabs.CustomTabsActivity",
            ),
        )
    }

    @Test
    fun ignoresAppAndSystemActivities() {
        assertFalse(
            InAppBrowserTasks.isInAppBrowserActivityClass(
                "com.fluxer.MainActivity",
            ),
        )
        assertFalse(
            InAppBrowserTasks.isInAppBrowserActivityClass(
                "com.linusu.flutter_web_auth_2.CallbackActivity",
            ),
        )
        assertFalse(InAppBrowserTasks.isInAppBrowserActivityClass(null))
        assertFalse(InAppBrowserTasks.isInAppBrowserActivityClass(""))
    }
}
