package com.fluxer.voice.pip

import android.app.Activity
import android.content.pm.PackageManager
import android.os.Build
import com.fluxer.voice.NativePipConfig
import com.fluxer.voice.NativePipVideoSource
import com.fluxer.voice.NativePipVideoSourceKind
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
class VoicePipControllerTest {
    private val config = NativePipConfig(
        source = NativePipVideoSource(NativePipVideoSourceKind.WEB_RTC_TRACK, "track"),
        aspectWidth = 16,
        aspectHeight = 9,
        mirror = false,
    )

    private fun enablePipFeature() {
        val context = RuntimeEnvironment.getApplication()
        shadowOf(context.packageManager)
            .setSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE, true)
    }

    @Test
    @Config(sdk = [Build.VERSION_CODES.N_MR1])
    fun androidSevenIsANoOp() {
        enablePipFeature()
        val controller = VoicePipController(RuntimeEnvironment.getApplication())
        val activity = Robolectric.buildActivity(Activity::class.java).setup().get()
        controller.attachActivity(activity)

        assertFalse(controller.isSupported())
        controller.arm(config)
        controller.onUserLeaveHint()
        controller.stop()
        controller.disarm()
        assertFalse(activity.isInPictureInPictureMode)
    }

    @Test
    @Config(sdk = [Build.VERSION_CODES.S])
    fun supportedWhenTheFeatureExists() {
        enablePipFeature()
        val controller = VoicePipController(RuntimeEnvironment.getApplication())
        assertTrue(controller.isSupported())
    }

    @Test
    @Config(sdk = [Build.VERSION_CODES.S])
    fun armAndDisarmApplyParamsWithoutAnActivityOrWithOne() {
        enablePipFeature()
        val controller = VoicePipController(RuntimeEnvironment.getApplication())
        controller.arm(config)
        val activity = Robolectric.buildActivity(Activity::class.java).setup().get()
        controller.attachActivity(activity)
        controller.arm(config.copy(aspectWidth = 4, aspectHeight = 3))
        controller.disarm()
        controller.attachActivity(null)
    }

    @Test
    @Config(sdk = [Build.VERSION_CODES.R])
    fun userLeaveHintEntersPipWhenArmedBeforeS() {
        enablePipFeature()
        val controller = VoicePipController(RuntimeEnvironment.getApplication())
        val activity = Robolectric.buildActivity(Activity::class.java).setup().get()
        controller.attachActivity(activity)
        controller.onUserLeaveHint()
        assertFalse(activity.isInPictureInPictureMode)

        controller.arm(config)
        controller.onUserLeaveHint()
        assertTrue(activity.isInPictureInPictureMode)
    }
}
