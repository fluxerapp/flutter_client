import 'package:shared_preferences/shared_preferences.dart';

const String kVoiceLifecycleBreadcrumbEventKey =
    'voice_lifecycle_breadcrumb_event';
const String kVoiceLifecycleBreadcrumbGenerationKey =
    'voice_lifecycle_breadcrumb_generation';
const String kVoiceLifecycleBreadcrumbReasonKey =
    'voice_lifecycle_breadcrumb_reason';
const String kVoiceLifecycleBreadcrumbAtKey =
    'voice_lifecycle_breadcrumb_at_ms';

Future<void> persistVoiceLifecycleBreadcrumb({
  required String event,
  required int connectGeneration,
  String? reason,
}) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kVoiceLifecycleBreadcrumbEventKey, event);
    await prefs.setInt(
      kVoiceLifecycleBreadcrumbGenerationKey,
      connectGeneration,
    );
    if (reason != null && reason.isNotEmpty) {
      await prefs.setString(kVoiceLifecycleBreadcrumbReasonKey, reason);
    } else {
      await prefs.remove(kVoiceLifecycleBreadcrumbReasonKey);
    }
    await prefs.setInt(
      kVoiceLifecycleBreadcrumbAtKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  } on Object {
    // Throw away error
  }
}

Future<Map<String, String>?> readVoiceLifecycleBreadcrumb() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? event = prefs.getString(kVoiceLifecycleBreadcrumbEventKey);
    if (event == null || event.isEmpty) {
      return null;
    }
    final int? generation = prefs.getInt(
      kVoiceLifecycleBreadcrumbGenerationKey,
    );
    final String? reason = prefs.getString(kVoiceLifecycleBreadcrumbReasonKey);
    final int? atMs = prefs.getInt(kVoiceLifecycleBreadcrumbAtKey);
    return <String, String>{
      'voice.lifecycle.event': event,
      if (generation != null) 'voice.lifecycle.generation': '$generation',
      if (reason != null && reason.isNotEmpty) 'voice.lifecycle.reason': reason,
      if (atMs != null) 'voice.lifecycle.at_ms': '$atMs',
    };
  } on Object {
    return null;
  }
}

Future<void> clearVoiceLifecycleBreadcrumb() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(kVoiceLifecycleBreadcrumbEventKey);
    await prefs.remove(kVoiceLifecycleBreadcrumbGenerationKey);
    await prefs.remove(kVoiceLifecycleBreadcrumbReasonKey);
    await prefs.remove(kVoiceLifecycleBreadcrumbAtKey);
  } on Object {
    // Throw away error
  }
}
