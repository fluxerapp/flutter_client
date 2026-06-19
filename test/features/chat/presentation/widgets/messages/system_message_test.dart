import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/system_message.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';

void main() {
  testWidgets('colors the system-message author name with the role color', (
    tester,
  ) async {
    const Color roleColor = Color(0xFF4641D9);
    final message = Message(
      id: '1',
      channelId: 'c1',
      authorId: 'u1',
      authorName: 'Jiralite',
      content: '',
      timestamp: DateTime(2026),
      type: messageTypeChannelPinnedMessage,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          memberRoleColorProvider(('u1', 'g1')).overrideWith((ref) => roleColor),
        ],
        child: MaterialApp(
          theme: ThemeData(extensions: <ThemeExtension>[buildDarkColorTheme()]),
          home: Scaffold(body: SystemMessage(message: message, guildId: 'g1')),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final RichText line = tester.widget(
      find.byWidgetPredicate(
        (w) => w is RichText && w.text.toPlainText().startsWith('Jiralite'),
      ),
    );
    final TextSpan username = (line.text as TextSpan).children!.first as TextSpan;
    expect(username.style?.color, roleColor);
  });
}
