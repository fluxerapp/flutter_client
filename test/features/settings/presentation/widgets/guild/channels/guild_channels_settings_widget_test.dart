import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_drop_indicator.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_draggable.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_row.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channels_settings_widget.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../../helpers/wide_layout_test_sizes.dart';
import '../../../../../../helpers/test_l10n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const String guildId = 'guild-1';

  Channel channel({
    required String id,
    int type = 0,
    String? parentId,
    int position = 0,
  }) {
    return Channel(
      id: id,
      guildId: guildId,
      name: id,
      type: ChannelType.fromWire(type),
      parentId: parentId,
      position: position,
    );
  }

  Widget buildTestApp({
    required Widget child,
    required _TrackingChannelRepository repository,
    Size viewportSize = kWideTestViewportSize,
  }) {
    final colorTheme = buildDarkColorTheme();
    return ProviderScope(
      overrides: [
        channelRepositoryProvider.overrideWithValue(repository),
        guildPermissionsProvider.overrideWithValue(<String, int>{
          guildId: Permission.manageChannels.value,
        }),
      ],
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: MediaQuery(
          data: MediaQueryData(size: viewportSize),
          child: Scaffold(body: child),
        ),
      ),
    );
  }

  group('GuildChannelsSettingsWidget drag movement', () {
    late _TrackingChannelRepository repository;
    late List<Channel> channels;

    setUp(() {
      channels = <Channel>[
        channel(id: 'cat-1', type: 4),
        channel(id: 'text-1', parentId: 'cat-1'),
        channel(id: 'text-2', position: 1),
      ];
      repository = _TrackingChannelRepository(channels: channels);
    });

    testWidgets('shows trailing drop target while dragging', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          repository: repository,
          child: const GuildChannelsSettingsWidget(guildId: guildId),
        ),
      );
      await tester.pumpAndSettle();

      final Finder dragHandle = find.byIcon(PhosphorIconsBold.dotsSixVertical);
      expect(dragHandle, findsNWidgets(3));

      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(dragHandle.last),
      );
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pump();

      expect(find.byType(DragTarget<ChannelReorderDragItem>), findsWidgets);
      await gesture.up();
      await tester.pumpAndSettle();
    });

    testWidgets('shows at most one drop slot between adjacent channels', (
      WidgetTester tester,
    ) async {
      channels = <Channel>[
        channel(id: 'cat-1', type: 4),
        channel(id: 'text-1', parentId: 'cat-1'),
        channel(id: 'text-2', parentId: 'cat-1', position: 1),
      ];
      repository = _TrackingChannelRepository(channels: channels);

      await tester.pumpWidget(
        buildTestApp(
          repository: repository,
          child: const GuildChannelsSettingsWidget(guildId: guildId),
        ),
      );
      await tester.pumpAndSettle();

      final Finder dragHandle = find.byIcon(PhosphorIconsBold.dotsSixVertical);
      final Offset start = tester.getCenter(dragHandle.last);
      final Offset boundary =
          tester.getBottomLeft(find.text('text-1')) + const Offset(20, -2);
      final TestGesture gesture = await tester.startGesture(start);
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pump();
      await gesture.moveTo(boundary);
      await tester.pump();

      expect(find.byType(GuildChannelDropIndicator), findsOneWidget);

      await gesture.up();
      await tester.pumpAndSettle();
    });

    testWidgets('completes move on drop for desktop drag handle', (
      WidgetTester tester,
    ) async {
      channels = <Channel>[
        channel(id: 'cat-1', type: 4),
        channel(id: 'text-1', parentId: 'cat-1'),
        channel(id: 'text-2', parentId: 'cat-1', position: 1),
      ];
      repository = _TrackingChannelRepository(channels: channels);

      await tester.pumpWidget(
        buildTestApp(
          repository: repository,
          child: const GuildChannelsSettingsWidget(guildId: guildId),
        ),
      );
      await tester.pumpAndSettle();

      final Finder dragHandle = find.byIcon(PhosphorIconsBold.dotsSixVertical);
      final Offset start = tester.getCenter(dragHandle.last);
      final Offset dropPoint =
          tester.getBottomLeft(find.text('text-1')) + const Offset(20, -2);
      final TestGesture gesture = await tester.startGesture(start);
      await tester.pump(const Duration(milliseconds: 20));
      await tester.pump();
      await gesture.moveTo(dropPoint);
      await tester.pump();

      await gesture.up();
      await tester.pumpAndSettle();

      expect(repository.moveChannelCallCount, 1);
    });

    testWidgets('uses full-row long press drag on mobile', (
      WidgetTester tester,
    ) async {
      channels = <Channel>[
        channel(id: 'cat-1', type: 4),
        channel(id: 'text-1', parentId: 'cat-1'),
        channel(id: 'text-2', parentId: 'cat-1', position: 1),
      ];
      repository = _TrackingChannelRepository(channels: channels);

      await tester.pumpWidget(
        buildTestApp(
          repository: repository,
          viewportSize: const Size(390, 844),
          child: const GuildChannelsSettingsWidget(guildId: guildId),
        ),
      );
      await tester.pumpAndSettle();

      final Finder row = find.ancestor(
        of: find.text('text-2'),
        matching: find.byType(GuildChannelSettingsRow),
      );
      final Finder longPressDraggable = find.descendant(
        of: row,
        matching: find.byType(LongPressDraggable<ChannelReorderDragItem>),
      );
      expect(longPressDraggable, findsOneWidget);

      final Offset start = tester.getCenter(find.text('text-2'));
      final TestGesture gesture = await tester.startGesture(start);
      await tester.pump(kGuildChannelSettingsMobileDragDelay);
      await tester.pump();
      await gesture.moveBy(const Offset(0, -120));
      await tester.pump();

      expect(find.byType(GuildChannelDropIndicator), findsOneWidget);

      await gesture.up();
      await tester.pumpAndSettle();
      expect(repository.moveChannelCallCount, 1);
    });

    testWidgets('drops channel at bottom of category via tail zone', (
      WidgetTester tester,
    ) async {
      channels = <Channel>[
        channel(id: 'cat-1', type: 4),
        channel(id: 'text-1', parentId: 'cat-1'),
        channel(id: 'text-2', parentId: 'cat-1', position: 1),
        channel(id: 'cat-2', type: 4, position: 1),
        channel(id: 'text-3', parentId: 'cat-2', position: 2),
        channel(id: 'text-4', position: 3),
      ];
      repository = _TrackingChannelRepository(channels: channels);

      await tester.pumpWidget(
        buildTestApp(
          repository: repository,
          child: const GuildChannelsSettingsWidget(guildId: guildId),
        ),
      );
      await tester.pumpAndSettle();

      final Finder dragHandle = find.byIcon(PhosphorIconsBold.dotsSixVertical);
      final Offset start = tester.getCenter(dragHandle.last);
      final Offset textBottom = tester.getBottomLeft(find.text('text-2'));
      final Offset tailZone =
          textBottom +
          Offset(tester.getSize(find.text('text-2')).width / 2, 10);
      final TestGesture gesture = await tester.startGesture(start);
      await tester.pump(const Duration(milliseconds: 20));
      await tester.pump();
      await gesture.moveTo(tailZone);
      await tester.pump();

      await gesture.up();
      await tester.pumpAndSettle();

      expect(repository.moveChannelCallCount, 1);
    });

    testWidgets('keeps dragged row in layout while dragging', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          repository: repository,
          child: const GuildChannelsSettingsWidget(guildId: guildId),
        ),
      );
      await tester.pumpAndSettle();

      final Finder dragHandle = find.byIcon(PhosphorIconsBold.dotsSixVertical);
      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(dragHandle.last),
      );
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pump();

      expect(find.text('text-2'), findsOneWidget);
      expect(
        find.descendant(
          of: find.ancestor(
            of: find.text('text-2'),
            matching: find.byType(GuildChannelSettingsRow),
          ),
          matching: find.byType(Visibility),
        ),
        findsNothing,
      );

      await gesture.up();
      await tester.pumpAndSettle();
    });
  });
}

class _TrackingChannelRepository implements ChannelRepository {
  _TrackingChannelRepository({required this.channels});

  List<Channel> channels;
  int moveChannelCallCount = 0;
  int applyLocalChannelsCallCount = 0;

  @override
  Future<List<ChannelCategory>> getChannels(String guildId) async {
    return groupChannelsIntoCategories(channels);
  }

  @override
  Stream<List<Channel>> watchChannels(String guildId) {
    return Stream<List<Channel>>.value(channels);
  }

  @override
  Future<void> applyLocalChannels(
    String guildId,
    List<Channel> updatedChannels,
  ) async {
    applyLocalChannelsCallCount++;
    channels = List<Channel>.from(updatedChannels);
  }

  @override
  Future<void> moveChannel({
    required String guildId,
    required ChannelMoveOperation operation,
    List<Channel>? rollbackChannels,
  }) async {
    moveChannelCallCount++;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
