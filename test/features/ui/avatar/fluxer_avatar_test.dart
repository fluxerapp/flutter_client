import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_cluster.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_status_badge.dart';
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

    testWidgets('hides status when showStatus is false', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: '7',
            fallbackText: 'Bob',
            status: 'online',
            showStatus: false,
          ),
        ),
      );

      expect(find.byType(FluxerStatusIndicator), findsNothing);
    });

    testWidgets('never draws status on avatars of 16pt or smaller', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: '8',
            fallbackText: 'Bob',
            status: 'online',
            size: 16,
          ),
        ),
      );

      expect(find.byType(FluxerStatusIndicator), findsNothing);
    });

    testWidgets('keeps the image element when status arrives', (tester) async {
      Widget avatar(String? status) => buildTestApp(
        FluxerAvatar.user(
          userId: '9',
          imageUrl: 'https://cdn.example/avatar.webp',
          fallbackText: 'Bob',
          status: status,
          size: 32,
        ),
      );

      await tester.pumpWidget(avatar(null));
      final Element before = tester.element(find.byType(CachedNetworkImage));

      await tester.pumpWidget(avatar('online'));
      await tester.pumpAndSettle();

      expect(tester.element(find.byType(CachedNetworkImage)), same(before));
      expect(find.byType(FluxerStatusIndicator), findsOneWidget);
    });

    testWidgets('status dot grows in instead of popping', (tester) async {
      Widget avatar(String? status) => buildTestApp(
        Center(
          child: FluxerAvatar.user(
            userId: '10',
            fallbackText: 'Bob',
            status: status,
            size: 32,
          ),
        ),
      );

      await tester.pumpWidget(avatar(null));
      await tester.pumpWidget(avatar('online'));
      await tester.pump(kAvatarStatusTransitionDuration ~/ 4);
      final double mid = tester
          .getSize(find.byType(FluxerStatusIndicator))
          .width;
      await tester.pumpAndSettle();
      final double end = tester
          .getSize(find.byType(FluxerStatusIndicator))
          .width;

      expect(mid, greaterThan(0));
      expect(mid, lessThan(end));
      expect(end, 10);
    });

    testWidgets('dot sits flush with the bottom-right corner', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const Center(
            child: FluxerAvatar.user(
              userId: '11',
              fallbackText: 'Bob',
              status: 'online',
              size: 32,
            ),
          ),
        ),
      );

      final Rect avatar = tester.getRect(find.byType(FluxerAvatar));
      final Rect dot = tester.getRect(find.byType(FluxerStatusIndicator));
      expect(dot.size, const Size(10, 10));
      expect(dot.bottomRight, avatar.bottomRight);
    });

    testWidgets('loading avatars show a placeholder and keep the old image', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatar.user(
            userId: '12',
            imageUrl: 'https://cdn.example/avatar.webp',
            fallbackText: 'Bob',
            avatarColor: 0xFF123456,
          ),
        ),
      );

      final CachedNetworkImage image = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(image.useOldImageOnUrlChange, isTrue);
      expect(image.fadeInDuration, Duration.zero);
      expect(image.placeholder, isNotNull);
    });

    testWidgets('presence avatar shows the last known status while loading', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            userPresenceProvider(
              '13',
            ).overrideWith((Ref ref) => const Stream<db.User?>.empty()),
            userPresenceCacheProvider.overrideWithValue(<String, db.User>{
              '13': const db.User(
                id: '13',
                username: 'bob',
                discriminator: '0001',
                bot: false,
                system: false,
                status: 'idle',
                mobile: false,
              ),
            }),
          ],
          child: buildTestApp(
            FluxerAvatar.userPresence(userId: '13', fallbackText: 'Bob'),
          ),
        ),
      );

      expect(
        tester
            .widget<FluxerStatusIndicator>(find.byType(FluxerStatusIndicator))
            .status,
        'idle',
      );
    });

    testWidgets('group clusters never show presence, only typing', (
      tester,
    ) async {
      const List<AvatarClusterMember> members = [
        AvatarClusterMember(userId: '1'),
        AvatarClusterMember(userId: '2'),
      ];
      await tester.pumpWidget(
        buildTestApp(const FluxerAvatarCluster(members: members)),
      );
      expect(find.byType(FluxerStatusIndicator), findsNothing);
      expect(find.byType(FluxerTypingStatusIndicator), findsNothing);

      await tester.pumpWidget(
        buildTestApp(
          const FluxerAvatarCluster(members: members, isTyping: true),
        ),
      );
      await tester.pump(kAvatarStatusTransitionDuration);
      expect(find.byType(FluxerTypingStatusIndicator), findsOneWidget);
      expect(find.byType(FluxerStatusIndicator), findsNothing);
    });

    testWidgets('typing cutout keeps the back circle of a group stack whole', (
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
              isTyping: true,
            ),
          ),
        ),
      );
      final ClipPath clip = tester.widget<ClipPath>(
        find
            .descendant(
              of: find.byType(FluxerAvatarStatusBadge),
              matching: find.byType(ClipPath),
            )
            .first,
      );
      final Path path = clip.clipper!.getClip(const Size.square(32));
      expect(path.contains(const Offset(3.5, 3.5)), isTrue);
      expect(path.contains(const Offset(28, 28)), isFalse);
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

    testWidgets('never shows a status dot', (tester) async {
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

      final ClipPath clip = tester.widget<ClipPath>(
        find.descendant(
          of: find.byType(Positioned).first,
          matching: find.byType(ClipPath),
        ),
      );
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

  group('FluxerStatusPainter', () {
    const Rect bounds = Rect.fromLTWH(0, 0, 10, 10);

    test('online is a solid disc', () {
      final Path path = FluxerStatusPainter.glyphPath('online', bounds);
      expect(path.contains(bounds.center), isTrue);
    });

    test('offline punches a transparent hole about 4.7pt wide', () {
      final Path path = FluxerStatusPainter.glyphPath('offline', bounds);
      expect(path.contains(bounds.center), isFalse);
      expect(path.contains(bounds.center + const Offset(2.2, 0)), isFalse);
      expect(path.contains(bounds.center + const Offset(3.6, 0)), isTrue);
    });

    test('idle bites the top-left out of the disc', () {
      final Path path = FluxerStatusPainter.glyphPath('idle', bounds);
      expect(path.contains(const Offset(3, 3)), isFalse);
      expect(path.contains(const Offset(7, 7)), isTrue);
    });

    test('dnd cuts a transparent bar through the centre', () {
      final Path path = FluxerStatusPainter.glyphPath('dnd', bounds);
      expect(path.contains(bounds.center), isFalse);
      expect(path.contains(const Offset(5, 2)), isTrue);
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

      expect(
        tester.getSize(find.byType(FluxerStatusIndicator)),
        const Size(15, 15),
      );
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
