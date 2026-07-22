import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';

void main() {
  group('ExpressionPanelTab', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('defaults to emojis', () {
      expect(
        container.read(expressionPanelTabProvider),
        ExpressionPickerTab.emojis,
      );
    });

    test('select updates the active tab', () {
      container.read(expressionPanelTabProvider.notifier).tab =
          ExpressionPickerTab.gifs;

      expect(
        container.read(expressionPanelTabProvider),
        ExpressionPickerTab.gifs,
      );
    });

    test('reset returns to emojis', () {
      container.read(expressionPanelTabProvider.notifier).tab =
          ExpressionPickerTab.stickers;
      container.read(expressionPanelTabProvider.notifier).reset();

      expect(
        container.read(expressionPanelTabProvider),
        ExpressionPickerTab.emojis,
      );
    });
  });

  group('ExpressionPanel.close', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('resets tab to emojis', () {
      container.read(expressionPanelProvider.notifier).open();
      container.read(expressionPanelTabProvider.notifier).tab =
          ExpressionPickerTab.gifs;

      container.read(expressionPanelProvider.notifier).close();

      expect(container.read(expressionPanelProvider), isFalse);
      expect(
        container.read(expressionPanelTabProvider),
        ExpressionPickerTab.emojis,
      );
    });
  });

  group('ExpressionPanelContentFade', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('defaults to not played', () {
      expect(container.read(expressionPanelContentFadeProvider), isFalse);
    });

    test('markPlayed prevents repeat fade', () {
      container.read(expressionPanelContentFadeProvider.notifier).markPlayed();
      expect(container.read(expressionPanelContentFadeProvider), isTrue);
    });

    test('close resets fade state', () {
      container.read(expressionPanelContentFadeProvider.notifier).markPlayed();
      container.read(expressionPanelProvider.notifier).open();
      container.read(expressionPanelProvider.notifier).close();
      expect(container.read(expressionPanelContentFadeProvider), isFalse);
    });
  });
}
