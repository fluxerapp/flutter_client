import 'package:shared_preferences/shared_preferences.dart';

const String kVoiceCallInProgressChannelIdKey =
    'voice_call_in_progress_channel_id';

Future<void> markVoiceCallInProgress(String channelId) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kVoiceCallInProgressChannelIdKey, channelId);
  } on Object {
    return;
  }
}

Future<void> clearVoiceCallInProgress() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(kVoiceCallInProgressChannelIdKey);
  } on Object {
    return;
  }
}

Future<String?> takeInterruptedVoiceCallChannelId() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? channelId = prefs.getString(kVoiceCallInProgressChannelIdKey);
    await prefs.remove(kVoiceCallInProgressChannelIdKey);
    if (channelId == null || channelId.isEmpty) {
      return null;
    }
    return channelId;
  } on Object {
    return null;
  }
}
