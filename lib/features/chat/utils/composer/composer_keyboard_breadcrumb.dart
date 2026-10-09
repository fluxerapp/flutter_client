import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kComposerKeyboardStateKey = 'composer_keyboard_state';
const String kComposerKeyboardAtKey = 'composer_keyboard_at_ms';

Future<void> persistComposerKeyboardBreadcrumb({
  required String keyboardState,
}) async {
  if (!kDebugMode) {
    return;
  }
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kComposerKeyboardStateKey, keyboardState);
    await prefs.setInt(
      kComposerKeyboardAtKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  } on Object {
    // Throw error
  }
}

Future<Map<String, String>?> readComposerKeyboardBreadcrumb() async {
  if (!kDebugMode) {
    return null;
  }
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? keyboardState = prefs.getString(kComposerKeyboardStateKey);
    if (keyboardState == null || keyboardState.isEmpty) {
      return null;
    }
    final int? atMs = prefs.getInt(kComposerKeyboardAtKey);
    return <String, String>{
      'composer.keyboard.state': keyboardState,
      if (atMs != null) 'composer.keyboard.at_ms': '$atMs',
    };
  } on Object {
    return null;
  }
}

Future<void> clearComposerKeyboardBreadcrumb() async {
  if (!kDebugMode) {
    return;
  }
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(kComposerKeyboardStateKey);
    await prefs.remove(kComposerKeyboardAtKey);
  } on Object {
    // Throw error
  }
}
