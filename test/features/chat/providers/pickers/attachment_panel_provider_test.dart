import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';

void main() {
  test('attachment panel toggle opens and closes', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(attachmentPanelProvider), isFalse);
    container.read(attachmentPanelProvider.notifier).toggle();
    expect(container.read(attachmentPanelProvider), isTrue);
    container.read(attachmentPanelProvider.notifier).toggle();
    expect(container.read(attachmentPanelProvider), isFalse);
  });

  test('opening one composer panel can leave the other closed', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(attachmentPanelProvider.notifier).open();
    container.read(expressionPanelProvider.notifier).close();
    expect(container.read(attachmentPanelProvider), isTrue);
    expect(container.read(expressionPanelProvider), isFalse);

    container.read(expressionPanelProvider.notifier).open();
    container.read(attachmentPanelProvider.notifier).close();
    expect(container.read(expressionPanelProvider), isTrue);
    expect(container.read(attachmentPanelProvider), isFalse);
  });
}
