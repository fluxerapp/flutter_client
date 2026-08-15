import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:material_ui/material_ui.dart';

import '../../helpers/test_l10n.dart';

void main() {
  testWidgets('copyToClipboard writes value and shows toast', (tester) async {
    final clipboardWrites = <Object?>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          clipboardWrites.add((call.arguments as Map)['text']);
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );

    WidgetRef? capturedRef;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, _) => ElevatedButton(
                onPressed: () {
                  capturedRef = ref;
                  unawaited(
                    copyToClipboard(context: context, value: 'test-value'),
                  );
                },
                child: const Text('Copy'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Copy'));
    await tester.pumpAndSettle();

    expect(clipboardWrites, ['test-value']);

    final entries = capturedRef!.read(toastProvider);
    expect(entries, hasLength(1));
    expect(entries.single.toast.message, 'Copied to clipboard');
    expect(entries.single.toast.variant, FluxerToastVariant.success);
  });

  testWidgets('copyToClipboard uses custom message', (tester) async {
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (_) async => null,
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );

    WidgetRef? capturedRef;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          home: Scaffold(
            body: Consumer(
              builder: (context, ref, _) => ElevatedButton(
                onPressed: () {
                  capturedRef = ref;
                  unawaited(
                    copyToClipboard(
                      context: context,
                      value: 'value',
                      message: 'Custom copied',
                      variant: FluxerToastVariant.info,
                    ),
                  );
                },
                child: const Text('Copy'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Copy'));
    await tester.pumpAndSettle();

    final entries = capturedRef!.read(toastProvider);
    expect(entries.single.toast.message, 'Custom copied');
    expect(entries.single.toast.variant, FluxerToastVariant.info);
  });
}
