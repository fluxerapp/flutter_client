import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_custom_status.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_dart/export.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

void main() {
  group('UserProfileCustomStatus', () {
    testWidgets('renders nothing for null', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const UserProfileCustomStatus(text: null)),
      );
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('renders nothing for empty', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const UserProfileCustomStatus(text: '')),
      );
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('renders text when set', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const UserProfileCustomStatus(text: 'Coding')),
      );
      expect(find.text('Coding'), findsOneWidget);
    });

    testWidgets('renders custom emoji for emoji-only stored status', (
      tester,
    ) async {
      final String stored = serializeCustomStatus(
        const CustomStatusResponse(emojiId: '123456789', emojiAnimated: true),
      )!;
      await tester.pumpWidget(
        buildTestApp(UserProfileCustomStatus(text: stored)),
      );
      expect(find.byType(CachedEmojiImage), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });
  });
}
