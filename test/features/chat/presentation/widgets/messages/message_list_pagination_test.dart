import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_pagination.dart';

void main() {
  group('shouldLoadOlderAtEdge', () {
    test('loads when within the margin of the top edge', () {
      expect(
        shouldLoadOlderAtEdge(
          pixels: 5000 - kMessageListLoadMargin + 1,
          maxScrollExtent: 5000,
          hasMoreMessages: true,
          isLoadingMore: false,
        ),
        isTrue,
      );
    });

    test('does not load when outside the margin', () {
      expect(
        shouldLoadOlderAtEdge(
          pixels: 5000 - kMessageListLoadMargin - 1,
          maxScrollExtent: 5000,
          hasMoreMessages: true,
          isLoadingMore: false,
        ),
        isFalse,
      );
    });

    test('loads exactly at the margin boundary', () {
      expect(
        shouldLoadOlderAtEdge(
          pixels: 5000 - kMessageListLoadMargin,
          maxScrollExtent: 5000,
          hasMoreMessages: true,
          isLoadingMore: false,
        ),
        isTrue,
      );
    });

    test('short-circuits when there are no more older messages', () {
      expect(
        shouldLoadOlderAtEdge(
          pixels: 5000,
          maxScrollExtent: 5000,
          hasMoreMessages: false,
          isLoadingMore: false,
        ),
        isFalse,
      );
    });

    test('short-circuits while a load is already in flight', () {
      expect(
        shouldLoadOlderAtEdge(
          pixels: 5000,
          maxScrollExtent: 5000,
          hasMoreMessages: true,
          isLoadingMore: true,
        ),
        isFalse,
      );
    });
  });

  group('shouldLoadNewerAtEdge', () {
    test('loads when within the margin of the bottom edge', () {
      expect(
        shouldLoadNewerAtEdge(
          pixels: kMessageListLoadMargin - 1,
          minScrollExtent: 0,
          hasMoreNewerMessages: true,
          isLoadingNewer: false,
        ),
        isTrue,
      );
    });

    test('does not load when outside the margin', () {
      expect(
        shouldLoadNewerAtEdge(
          pixels: kMessageListLoadMargin + 1,
          minScrollExtent: 0,
          hasMoreNewerMessages: true,
          isLoadingNewer: false,
        ),
        isFalse,
      );
    });

    test('loads exactly at the margin boundary', () {
      expect(
        shouldLoadNewerAtEdge(
          pixels: kMessageListLoadMargin,
          minScrollExtent: 0,
          hasMoreNewerMessages: true,
          isLoadingNewer: false,
        ),
        isTrue,
      );
    });

    test('respects a negative minScrollExtent offset', () {
      expect(
        shouldLoadNewerAtEdge(
          pixels: -300 + kMessageListLoadMargin,
          minScrollExtent: -300,
          hasMoreNewerMessages: true,
          isLoadingNewer: false,
        ),
        isTrue,
      );
    });

    test('short-circuits when there are no more newer messages', () {
      expect(
        shouldLoadNewerAtEdge(
          pixels: 0,
          minScrollExtent: 0,
          hasMoreNewerMessages: false,
          isLoadingNewer: false,
        ),
        isFalse,
      );
    });

    test('short-circuits while a load is already in flight', () {
      expect(
        shouldLoadNewerAtEdge(
          pixels: 0,
          minScrollExtent: 0,
          hasMoreNewerMessages: true,
          isLoadingNewer: true,
        ),
        isFalse,
      );
    });
  });
}
