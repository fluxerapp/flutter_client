import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/utils/chat_shell_layout.dart';

void main() {
  final colors = buildDarkColorTheme();

  test('phone shell uses composer track color', () {
    expect(
      channelChatShellBackgroundForLayout(
        colors: colors,
        mobileLayout: true,
        duoHostedUi: false,
      ),
      colors.chatInputBackground,
    );
  });

  test('Duo hosted UI shell uses chat canvas', () {
    expect(
      channelChatShellBackgroundForLayout(
        colors: colors,
        mobileLayout: true,
        duoHostedUi: true,
      ),
      colors.chatBackground,
    );
  });
}
