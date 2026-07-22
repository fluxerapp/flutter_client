import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_placeholder_specs.dart';

void main() {
  group('buildMessageListPlaceholderSpecs', () {
    test('cozy mode generates 26 message groups', () {
      final MessageListPlaceholderSpecs specs =
          buildMessageListPlaceholderSpecs(
            seedKey: 'channel-1',
            compact: false,
            groupSpacing: 16,
            fontSize: 16,
          );
      expect(specs.messageCounts, hasLength(kMessageListPlaceholderCozyGroups));
    });

    test('compact mode generates 30 message groups', () {
      final MessageListPlaceholderSpecs specs =
          buildMessageListPlaceholderSpecs(
            seedKey: 'channel-1',
            compact: true,
            groupSpacing: 0,
            fontSize: 16,
          );
      expect(
        specs.messageCounts,
        hasLength(kMessageListPlaceholderCompactGroups),
      );
    });

    test('same seed produces identical specs', () {
      final MessageListPlaceholderSpecs first =
          buildMessageListPlaceholderSpecs(
            seedKey: 'stable-channel',
            compact: false,
            groupSpacing: 16,
            fontSize: 16,
          );
      final MessageListPlaceholderSpecs second =
          buildMessageListPlaceholderSpecs(
            seedKey: 'stable-channel',
            compact: false,
            groupSpacing: 16,
            fontSize: 16,
          );
      expect(second.messageCounts, first.messageCounts);
      expect(second.totalHeight, first.totalHeight);
      expect(
        second.attachmentSpecs.map(
          (MessageListPlaceholderAttachment? spec) =>
              spec == null ? null : '${spec.width}x${spec.height}',
        ),
        first.attachmentSpecs.map(
          (MessageListPlaceholderAttachment? spec) =>
              spec == null ? null : '${spec.width}x${spec.height}',
        ),
      );
    });

    test('each group has between 1 and 4 message lines', () {
      final MessageListPlaceholderSpecs specs =
          buildMessageListPlaceholderSpecs(
            seedKey: 'channel-lines',
            compact: false,
            groupSpacing: 16,
            fontSize: 16,
          );
      for (final int count in specs.messageCounts) {
        expect(count, inInclusiveRange(1, 4));
      }
    });

    test('assigns eight attachment placeholders', () {
      final MessageListPlaceholderSpecs specs =
          buildMessageListPlaceholderSpecs(
            seedKey: 'channel-attachments',
            compact: false,
            groupSpacing: 16,
            fontSize: 16,
          );
      expect(
        specs.attachmentSpecs
            .whereType<MessageListPlaceholderAttachment>()
            .length,
        8,
      );
    });
  });

  group('messageListSkeletonWidthFactor', () {
    test('returns stable values between 0 and 1', () {
      expect(
        messageListSkeletonWidthFactor(17),
        messageListSkeletonWidthFactor(17),
      );
      expect(messageListSkeletonWidthFactor(42), inInclusiveRange(0, 1));
    });
  });
}
