package com.fluxer

import android.view.KeyCharacterMap
import android.view.KeyEvent
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class ImeEditingShortcutBridgeTest {
    private val virtualKeyboard = KeyCharacterMap.VIRTUAL_KEYBOARD
    private val ctrl = KeyEvent.META_CTRL_ON

    @Test
    fun mapsFutoQuickActions() {
        assertEquals("selectAll", imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_A, ctrl))
        assertEquals("copy", imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_C, ctrl))
        assertEquals("cut", imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_X, ctrl))
        assertEquals("paste", imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_V, ctrl))
        assertEquals("undo", imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_Z, ctrl))
        assertEquals("redo", imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_Y, ctrl))
    }

    @Test
    fun mapsCtrlShiftZToRedo() {
        assertEquals(
            "redo",
            imeEditingShortcutFor(
                virtualKeyboard,
                KeyEvent.KEYCODE_Z,
                ctrl or KeyEvent.META_SHIFT_ON,
            ),
        )
    }

    @Test
    fun leavesPhysicalKeyboardsToFlutter() {
        assertNull(imeEditingShortcutFor(3, KeyEvent.KEYCODE_Z, ctrl or KeyEvent.META_CTRL_LEFT_ON))
    }

    @Test
    fun ignoresKeysWithoutCtrl() {
        assertNull(imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_Z, 0))
    }

    @Test
    fun ignoresOtherModifierChords() {
        assertNull(imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_Z, ctrl or KeyEvent.META_ALT_ON))
        assertNull(imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_C, ctrl or KeyEvent.META_META_ON))
    }

    @Test
    fun ignoresOtherKeys() {
        assertNull(imeEditingShortcutFor(virtualKeyboard, KeyEvent.KEYCODE_B, ctrl))
    }
}
