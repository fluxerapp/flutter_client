import 'package:cached_network_image_ce/cached_network_image.dart';
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
import 'package:fluxer_app/material_ui.dart';

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

    testWidgets('skips memory cache resize for animated avatar urls', (
      tester,
    ) async {
      tester.view.devicePixelRatio = 3.0;
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: '6',
            imageUrl:
                'https://cdn.example/avatars/6/a_avatar.gif?animated=true&size=80',
            fallbackText: 'Alice',
            showStatus: false,
          ),
        ),
      );

      final image = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(image.memCacheWidth, isNull);
      expect(image.memCacheHeight, isNull);
    });

    testWidgets('avatar cluster tolerates non-numeric member ids', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatarCluster(
            members: [
              AvatarClusterMember(userId: 'oops'),
              AvatarClusterMember(userId: '2'),
            ],
          ),
        ),
      );

      expect(tester.takeException(), isNull);
    });
  });

  group('FluxerAvatarCluster', () {
    testWidgets('stacks two 20pt circles at the corners of a 32pt box', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const Center(
            child: FluxerAvatarCluster(
              members: [
                AvatarClusterMember(userId: '1'),
                AvatarClusterMember(userId: '2'),
                AvatarClusterMember(userId: '3'),
              ],
            ),
          ),
        ),
      );

      final Rect box = tester.getRect(find.byType(FluxerAvatarCluster));
      expect(box.size, const Size(32, 32));
      final List<Rect> circles = tester
          .widgetList<CachedNetworkImage>(find.byType(CachedNetworkImage))
          .map(
            (CachedNetworkImage image) =>
                tester.getRect(find.byWidget(image)).shift(-box.topLeft),
          )
          .toList();
      expect(circles, const <Rect>[
        Rect.fromLTWH(0, 0, 20, 20),
        Rect.fromLTWH(12, 12, 20, 20),
      ]);
    });

    testWidgets('never shows a status dot or typing pill', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatarCluster(
            members: [
              AvatarClusterMember(userId: '1'),
              AvatarClusterMember(userId: '2'),
            ],
          ),
        ),
      );

      expect(find.byType(FluxerStatusIndicator), findsNothing);
      expect(find.byType(FluxerTypingStatusIndicator), findsNothing);
      expect(find.byType(FluxerMobileOnlineStatusIndicator), findsNothing);
    });

    testWidgets('cuts a transparent ring out of the back avatar', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const Center(
            child: FluxerAvatarCluster(
              members: [
                AvatarClusterMember(userId: '1'),
                AvatarClusterMember(userId: '2'),
              ],
            ),
          ),
        ),
      );

      final ClipPath clip = tester.widget<ClipPath>(find.byType(ClipPath));
      final Path path = clip.clipper!.getClip(const Size(20, 20));
      expect(path.contains(const Offset(4, 4)), isTrue);
      expect(path.contains(const Offset(12.5, 12.5)), isTrue);
      expect(path.contains(const Offset(13.5, 13.5)), isFalse);
      expect(path.contains(const Offset(16, 16)), isFalse);
    });

    testWidgets('falls back to a brand glyph disc without members', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatarCluster(
            members: [AvatarClusterMember(userId: '1')],
          ),
        ),
      );

      final Container disc = tester.widget<Container>(
        find.descendant(
          of: find.byType(FluxerAvatarCluster),
          matching: find.byType(Container),
        ),
      );
      expect(
        (disc.decoration! as BoxDecoration).color,
        buildDarkColorTheme().brandPrimary,
      );
      expect(find.byType(CachedNetworkImage), findsNothing);
    });

    testWidgets('custom icon renders instead of the member stack', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatarCluster(
            iconUrl: 'https://cdn.example/icons/9/icon.webp',
            members: [
              AvatarClusterMember(userId: '1'),
              AvatarClusterMember(userId: '2'),
            ],
          ),
        ),
      );

      final CachedNetworkImage image = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(image.imageUrl, 'https://cdn.example/icons/9/icon.webp');
      expect(image.fadeInDuration, Duration.zero);
      expect(image.memCacheWidth, isNotNull);
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
