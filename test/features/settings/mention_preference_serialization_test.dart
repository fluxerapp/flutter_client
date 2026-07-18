import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  test('mention_flags request body uses integer values', () {
    final Map<String, Object?> body = <String, Object?>{
      'mention_flags': MentionReplyPreferences.preferMention.json,
    };
    expect(body['mention_flags'], 1);
  });

  test('SDK toJson still emits enum object for mention_flags', () {
    final Map<String, Object?> json = const UserUpdateWithVerificationRequest(
      mentionFlags: MentionReplyPreferences.preferMention,
    ).toJson();
    expect(json['mention_flags'], MentionReplyPreferences.preferMention);
  });
}
