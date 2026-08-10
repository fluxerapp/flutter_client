import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_cluster.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_mobile_online_status_indicator.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_typing_status_indicator.dart';

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
  group('avatarClusterGeometryChanged', () {
    test('returns true when cutouts change', () {
      expect(
        avatarClusterGeometryChanged(
          ownCenter: const Offset(12, 12),
          ownRadius: 10,
          cutouts: const [Rect.fromLTWH(4, 6, 8, 8)],
          oldOwnCenter: const Offset(12, 12),
          oldOwnRadius: 10,
          oldCutouts: const [Rect.fromLTWH(8, 6, 8, 8)],
        ),
        isTrue,
      );
    });
  });

  group('FluxerAvatar', () {
    testWidgets('user variant renders default avatar for user id', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: '1',
            fallbackText: 'Alice',
            showStatus: false,
          ),
        ),
      );

      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.text('A'), findsNothing);
    });

    testWidgets('user variant never renders letter fallback', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: 'not-a-number',
            fallbackText: 'Alice',
            showStatus: false,
          ),
        ),
      );

      expect(find.text('A'), findsNothing);
      expect(find.text('?'), findsNothing);
    });

    testWidgets('user variant shows status indicator when status set', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: '2',
            fallbackText: 'Bob',
            status: 'online',
          ),
        ),
      );

      expect(find.byType(FluxerStatusIndicator), findsOneWidget);
    });

    testWidgets('user variant shows phone indicator for mobile online', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: '3',
            fallbackText: 'Bob',
            status: 'online',
            isMobileStatus: true,
            size: 32,
          ),
        ),
      );

      expect(find.byType(FluxerMobileOnlineStatusIndicator), findsOneWidget);
      expect(find.byType(FluxerStatusIndicator), findsNothing);
    });

    testWidgets('mobile idle status keeps round indicator', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: '4',
            fallbackText: 'Bob',
            status: 'idle',
            isMobileStatus: true,
            size: 32,
          ),
        ),
      );

      expect(find.byType(FluxerStatusIndicator), findsOneWidget);
      expect(find.byType(FluxerMobileOnlineStatusIndicator), findsNothing);
    });

    testWidgets('user variant shows typing indicator when isTyping is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: '5',
            fallbackText: 'Bob',
            status: 'online',
            isTyping: true,
          ),
        ),
      );

      expect(find.byType(FluxerTypingStatusIndicator), findsOneWidget);
      expect(find.byType(FluxerStatusIndicator), findsNothing);
    });

    testWidgets('typing indicator renders three dots', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerTypingStatusIndicator(
            status: 'online',
            width: 22,
            height: 12,
          ),
        ),
      );

      expect(find.byType(FluxerTypingStatusIndicator), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
    });

    testWidgets('guild variant renders with fallback text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerAvatar.guild(fallbackText: 'My Server')),
      );

      expect(find.text('M'), findsOneWidget);
      expect(find.byType(FluxerStatusIndicator), findsNothing);
    });

    testWidgets('default constructor renders without status', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerAvatar(fallbackText: 'Test')),
      );

      expect(find.text('T'), findsOneWidget);
      expect(find.byType(FluxerStatusIndicator), findsNothing);
    });

    testWidgets(
      'network image preserves aspect ratio in memory cache for cover fit',
      (tester) async {
        tester.view.devicePixelRatio = 3.0;
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          buildTestApp(
            const FluxerAvatar.user(
              userId: '6',
              imageUrl: 'https://cdn.example/avatar.webp',
              fallbackText: 'Alice',
              showStatus: false,
            ),
          ),
        );

        final image = tester.widget<CachedNetworkImage>(
          find.byType(CachedNetworkImage),
        );
        expect(image.memCacheWidth, 120);
        expect(image.memCacheHeight, isNull);
        expect(image.fit, BoxFit.cover);
      },
    );

    testWidgets(
      'avatar cluster renders overlapping members without layout errors',
      (tester) async {
        await tester.pumpWidget(
          buildTestApp(
            const FluxerAvatarCluster(
              channelId: '123',
              members: [
                AvatarClusterMember(userId: '1', fallbackText: 'Alice'),
                AvatarClusterMember(userId: '2', fallbackText: 'Bob'),
                AvatarClusterMember(userId: '3', fallbackText: 'Cara'),
              ],
            ),
          ),
        );

        expect(tester.takeException(), isNull);
      },
    );

    testWidgets('avatar cluster tolerates non-numeric member ids', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatarCluster(
            channelId: '123',
            members: [
              AvatarClusterMember(userId: 'oops', fallbackText: 'Alice'),
              AvatarClusterMember(userId: '2', fallbackText: 'Bob'),
            ],
          ),
        ),
      );

      expect(tester.takeException(), isNull);
    });
  });

  group('FluxerStatusIndicator', () {
    testWidgets('shows correct color for online status', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerStatusIndicator(status: 'online')),
      );

      final indicator = tester.widget<FluxerStatusIndicator>(
        find.byType(FluxerStatusIndicator),
      );
      expect(indicator.status, 'online');

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, 15);
      expect(sizedBox.height, 15);
    });

    testWidgets('renders all status variants without error', (tester) async {
      for (final status in ['online', 'idle', 'dnd', 'streaming', 'offline']) {
        await tester.pumpWidget(
          buildTestApp(FluxerStatusIndicator(status: status)),
        );
        expect(find.byType(FluxerStatusIndicator), findsOneWidget);
      }
    });
  });
}
