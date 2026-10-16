import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

const String _body = 'hi \u{1F600} \u{1F44B}\u{1F3FD} \u2764\uFE0F';

Widget _app({
  required Future<void> registryLoaded,
  required ValueListenable<bool> show,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      emojiRegistryLoadedProvider.overrideWith((ref) => registryLoaded),
      androidAnimatorDurationDisabledProvider.overrideWith(
        (ref) => Stream<bool>.value(false),
      ),
    ],
    child: MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        FluxerLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: ValueListenableBuilder<bool>(
          valueListenable: show,
          builder: (BuildContext context, bool visible, Widget? child) =>
              visible
              ? const MessageMarkdown(data: _body, messageId: 'm1')
              : const SizedBox.shrink(),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets(
    'messages rendered before the emoji registry loads switch to Twemoji',
    (WidgetTester tester) async {
      expect(EmojiRegistry.unicodeEmojiRegexSync, isNull);
      final registryLoaded = Completer<void>();
      final show = ValueNotifier<bool>(true);
      addTearDown(show.dispose);

      await tester.pumpWidget(
        _app(registryLoaded: registryLoaded.future, show: show),
      );
      expect(find.byType(CachedEmojiAssetImage), findsNothing);

      show.value = false;
      await tester.pump();
      show.value = true;
      await tester.pump();

      await tester.runAsync(EmojiRegistry.preload);
      registryLoaded.complete();
      await tester.pumpAndSettle();

      expect(find.byType(CachedEmojiAssetImage), findsNWidgets(3));

      show.value = false;
      await tester.pump();
      show.value = true;
      await tester.pump();
      expect(find.byType(CachedEmojiAssetImage), findsNWidgets(3));
    },
  );
}
