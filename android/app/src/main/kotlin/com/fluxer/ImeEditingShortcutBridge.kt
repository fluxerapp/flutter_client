package com.fluxer

import android.view.KeyCharacterMap
import android.view.KeyEvent
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

private const val CHANNEL_NAME = "fluxer_app/ime_editing_shortcut"
private const val METHOD_PERFORM = "perform"

internal fun imeEditingShortcutFor(deviceId: Int, keyCode: Int, metaState: Int): String? {
    if (deviceId != KeyCharacterMap.VIRTUAL_KEYBOARD) {
        return null
    }
    if ((metaState and KeyEvent.META_CTRL_ON) == 0) {
        return null
    }
    if ((metaState and (KeyEvent.META_ALT_ON or KeyEvent.META_META_ON)) != 0) {
        return null
    }
    val shiftPressed = (metaState and KeyEvent.META_SHIFT_ON) != 0
    return when (keyCode) {
        KeyEvent.KEYCODE_A -> "selectAll"
        KeyEvent.KEYCODE_C -> "copy"
        KeyEvent.KEYCODE_X -> "cut"
        KeyEvent.KEYCODE_V -> "paste"
        KeyEvent.KEYCODE_Y -> "redo"
        KeyEvent.KEYCODE_Z -> if (shiftPressed) "redo" else "undo"
        else -> null
    }
}

class ImeEditingShortcutBridge {
    private var channel: MethodChannel? = null

    fun register(flutterEngine: FlutterEngine) {
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
    }

    fun dispatch(event: KeyEvent): Boolean {
        val shortcut = imeEditingShortcutFor(event.deviceId, event.keyCode, event.metaState)
            ?: return false
        val channel = channel ?: return false
        if (event.action == KeyEvent.ACTION_DOWN) {
            channel.invokeMethod(METHOD_PERFORM, shortcut)
        }
        return true
    }
}
