import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/system_message.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

void main() {
  testWidgets('colors the system-message author name with the role color', (
    tester,
  ) async {
    const Color roleColor = Color(0xFF4641D9);
    final message = Message(
      id: '1',
      channelId: 'c1',
      authorId: 'u1',
      authorName: 'Sample User',
      content: '',
      timestamp: DateTime(2026),
      type: messageTypeChannelPinnedMessage,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          guildUserDisplayProvider(('u1', 'g1')).overrideWith(
            (ref) => const AsyncValue.data(
              GuildUserDisplay(
                displayName: 'Sample User',
                avatarUrl: null,
                avatarColor: null,
                accountDisplayName: 'Sample User',
              ),
            ),
          ),
          memberRoleColorProvider((
            'u1',
            'g1',
          )).overrideWith((ref) => roleColor),
        ],
        child: MaterialApp(
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: ThemeData(extensions: <ThemeExtension>[buildDarkColorTheme()]),
          home: Scaffold(
            body: SystemMessage(message: message, guildId: 'g1'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final RichText line = tester.widget(
      find.byWidgetPredicate(
        (w) => w is RichText && w.text.toPlainText().startsWith('Sample User'),
      ),
    );
    expect(_findSpan(line.text, 'Sample User')?.style?.color, roleColor);
  });
}

TextSpan? _findSpan(InlineSpan span, String text) {
  if (span is TextSpan) {
    if (span.text == text) {
      return span;
    }
    final children = span.children;
    if (children != null) {
      for (final child in children) {
        final match = _findSpan(child, text);
        if (match != null) {
          return match;
        }
      }
    }
  }
  return null;
}
