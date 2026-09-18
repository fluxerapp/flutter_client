package com.fluxer

import android.content.res.Configuration
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class PhysicalKeyboardBridgeTest {
    @Test
    fun treatsHiddenKeyboardAsDisconnected() {
        val configuration = Configuration().apply {
            keyboard = Configuration.KEYBOARD_QWERTY
            hardKeyboardHidden = Configuration.HARDKEYBOARDHIDDEN_YES
        }
        assertFalse(isPhysicalKeyboardConnected(configuration))
    }

    @Test
    fun treatsUndefinedHiddenStateAsDisconnected() {
        val configuration = Configuration().apply {
            keyboard = Configuration.KEYBOARD_QWERTY
            hardKeyboardHidden = Configuration.HARDKEYBOARDHIDDEN_UNDEFINED
        }
        assertFalse(isPhysicalKeyboardConnected(configuration))
    }

    @Test
    fun treatsQwertyKeyboardAsConnected() {
        val configuration = Configuration().apply {
            keyboard = Configuration.KEYBOARD_QWERTY
            hardKeyboardHidden = Configuration.HARDKEYBOARDHIDDEN_NO
        }
        assertTrue(isPhysicalKeyboardConnected(configuration))
    }

    @Test
    fun treatsTwelveKeyKeyboardAsConnected() {
        val configuration = Configuration().apply {
            keyboard = Configuration.KEYBOARD_12KEY
            hardKeyboardHidden = Configuration.HARDKEYBOARDHIDDEN_NO
        }
        assertTrue(isPhysicalKeyboardConnected(configuration))
    }

    @Test
    fun treatsNoKeysAsDisconnected() {
        val configuration = Configuration().apply {
            keyboard = Configuration.KEYBOARD_NOKEYS
            hardKeyboardHidden = Configuration.HARDKEYBOARDHIDDEN_NO
        }
        assertFalse(isPhysicalKeyboardConnected(configuration))
    }
}
