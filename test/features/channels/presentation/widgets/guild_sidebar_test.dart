import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/experiments/experiments_provider.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_nav_page.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar_skeleton.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_settings_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_sidebar_icon_connect_bits_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_collapsed_categories_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_avatar.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_stats.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mute_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/material_ui.dart' hide SensitiveContent;
import 'package:fluxer_dart/export.dart' show FluxerClient;
import 'package:go_router/go_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/pump_fluxer_app.dart';
import '../../../../helpers/rendered_text_test_helpers.dart';
import '../../../../helpers/test_l10n.dart';
import '../../../../helpers/wide_layout_test_sizes.dart';

Future<void> _pumpSidebar(WidgetTester tester) async {
  await pumpFluxerFrames(tester);
}

const String _guildId = 'g1';
const String _otherGuildId = 'g2';
const GuildReadStateEntry _unreadGuildReadState = GuildReadStateEntry(
  hasUnread: true,
  hasPlainUnread: false,
  mentionCount: 0,
  mentionCountByChannel: <String, int>{},
  unreadChannelId: null,
  sentinel: 0,
);

class _GuildSwitchTestHarness {
  String activeGuildId = _guildId;
  late ChannelListState channelListState;
}

void main() {
  group('GuildSidebar loading skeleton', () {
    testWidgets('shows skeleton before initial channel list is received', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: const ChannelListState(
              guild: Guild(id: _guildId, name: 'Test Guild'),
              categories: [],
              selectedChannelId: null,
            ),
          ),
        ),
      );
      await _pumpSidebar(tester);

      expect(find.byType(GuildSidebarSkeleton), findsOneWidget);
      expect(find.text('general'), findsNothing);
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar collapsed category visibility', () {
    testWidgets('keeps the unread channel and hides the read one', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            collapsed: const {'cat1'},
            unread: const {
              'c1': UnreadState(hasUnread: true, hasUnreadMessages: true),
              'c2': UnreadState(),
            },
          ),
        ),
      );
      await _pumpSidebar(tester);

      expect(find.text('My Category'), findsOneWidget);
      expect(find.text('general'), findsOneWidget);
      expect(find.text('random'), findsNothing);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('keeps the selected channel even when it is read', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(selectedChannelId: 'c2'),
            selectedChannelId: 'c2',
            collapsed: const {'cat1'},
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
          ),
        ),
      );
      await _pumpSidebar(tester);

      expect(find.text('random'), findsOneWidget);
      expect(find.text('general'), findsNothing);
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar selected channel indicators', () {
    testWidgets('shows unread and mention indicators on mobile', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(selectedChannelId: 'c1'),
            selectedChannelId: 'c1',
            unread: const {
              'c1': UnreadState(
                hasUnread: true,
                hasUnreadMessages: true,
                mentionCount: 2,
              ),
              'c2': UnreadState(),
            },
          ),
        ),
      );
      await _pumpSidebar(tester);

      expect(find.byType(ChannelUnreadIndicator), findsOneWidget);
      expect(find.byType(FluxerBadge), findsOneWidget);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('selected row is a 38pt box inset 8pt with an 8pt radius', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(selectedChannelId: 'c1'),
            selectedChannelId: 'c1',
            unread: const {
              'c1': UnreadState(),
              'c2': UnreadState(hasUnread: true, hasUnreadMessages: true),
            },
          ),
        ),
      );
      await _pumpSidebar(tester);
      FontWeight? weightOf(String name) =>
          tester.widget<Text>(findAppText(name)).style?.fontWeight;

      final Finder selected = find.ancestor(
        of: find.text('general'),
        matching: find.byType(FluxerSelectableRow),
      );
      final FluxerSelectableRow row = tester.widget<FluxerSelectableRow>(
        selected,
      );
      expect(row.borderRadius, BorderRadius.circular(8));
      expect(
        row.selectedColor,
        buildDarkColorTheme().backgroundModifierSelected,
      );
      final Rect box = tester.getRect(
        find.descendant(of: selected, matching: find.byType(Container)).first,
      );
      expect(box.height, 38);
      expect(weightOf('random'), FontWeight.w600);
      expect(weightOf('general'), FontWeight.w500);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('hides unread and mention indicators on wide layout', (
      tester,
    ) async {
      _setWideSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(selectedChannelId: 'c1'),
            selectedChannelId: 'c1',
            unread: const {
              'c1': UnreadState(
                hasUnread: true,
                hasUnreadMessages: true,
                mentionCount: 2,
              ),
              'c2': UnreadState(),
            },
          ),
        ),
      );
      await _pumpSidebar(tester);

      expect(find.byType(ChannelUnreadIndicator), findsNothing);
      expect(find.byType(FluxerBadge), findsNothing);
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar unread channel rows', () {
    testWidgets('unread names are bold primary text with a ringless badge', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {
              'c1': UnreadState(
                hasUnread: true,
                hasUnreadMessages: true,
                mentionCount: 3,
              ),
              'c2': UnreadState(),
            },
          ),
        ),
      );
      await _pumpSidebar(tester);

      final colors = buildDarkColorTheme();
      final TextStyle unread = tester
          .widget<widgets.Text>(find.text('general'))
          .style!;
      final TextStyle read = tester
          .widget<widgets.Text>(find.text('random'))
          .style!;
      expect(unread.fontWeight, FontWeight.w600);
      expect(unread.color, colors.textPrimary);
      expect(read.fontWeight, FontWeight.w500);
      expect(read.color, colors.textTertiaryMuted);

      final Container pill = tester.widget<Container>(
        find.descendant(
          of: find.byType(FluxerBadge),
          matching: find.byType(Container),
        ),
      );
      expect((pill.decoration! as BoxDecoration).border, isNull);
      expect(find.byType(FluxerBadgeEntrance), findsOneWidget);
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar hide muted channels', () {
    testWidgets('keeps a mentioned muted channel and hides a plain muted one', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            hideMuted: true,
            muted: const {'c1', 'c2'},
            unread: const {
              'c1': UnreadState(
                hasUnread: true,
                hasUnreadMessages: true,
                mentionCount: 1,
              ),
              'c2': UnreadState(),
            },
          ),
        ),
      );
      await _pumpSidebar(tester);

      expect(find.text('general'), findsOneWidget);
      expect(find.text('random'), findsNothing);
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar channels without a category', () {
    testWidgets('renders channels without a category with no header', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: const ChannelListState(
              guild: Guild(id: _guildId, name: 'Test Guild'),
              categories: [
                ChannelCategory(
                  id: kUncategorizedCategoryId,
                  name: 'Channels',
                  channels: [
                    Channel(
                      id: 'uncategorized',
                      guildId: _guildId,
                      name: 'uncategorized',
                    ),
                  ],
                ),
              ],
              selectedChannelId: null,
              hasReceivedInitialChannelList: true,
            ),
            collapsed: const {kUncategorizedCategoryId},
            unread: const {'uncategorized': UnreadState()},
          ),
        ),
      );
      await _pumpSidebar(tester);

      expect(find.text('uncategorized'), findsOneWidget);
      expect(find.text('Channels'), findsNothing);
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar community header sheet', () {
    ChannelListState stateFor({String? ownerId}) => ChannelListState(
      guild: Guild(id: _guildId, name: 'Test Guild', ownerId: ownerId),
      categories: _state().categories,
      selectedChannelId: null,
      hasReceivedInitialChannelList: true,
    );

    Future<void> openHeaderSheet(
      WidgetTester tester, {
      required ChannelListState state,
      required int guildPermissions,
    }) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: state,
            guildPermissions: guildPermissions,
          ),
        ),
      );
      await _pumpSidebar(tester);
      await tester.tap(find.text('Test Guild'));
      await _pumpSidebar(tester);
    }

    void expectInOrder(WidgetTester tester, List<String> labels) {
      for (final String label in labels) {
        expect(find.text(label), findsOneWidget, reason: label);
      }
      for (var i = 1; i < labels.length; i++) {
        expect(
          tester.getTopLeft(find.text(labels[i - 1])).dy,
          lessThan(tester.getTopLeft(find.text(labels[i])).dy),
          reason: '${labels[i - 1]} before ${labels[i]}',
        );
      }
    }

    testWidgets('owner gets the desktop dropdown items in a bottom sheet', (
      tester,
    ) async {
      await openHeaderSheet(
        tester,
        state: stateFor(ownerId: 'me'),
        guildPermissions: allPermissions,
      );

      expect(find.byType(GuildBottomSheetStats), findsOneWidget);
      expect(find.byType(GuildBottomSheetAvatar), findsOneWidget);
      expect(find.text('More options'), findsNothing);
      expectInOrder(tester, <String>[
        'Community settings',
        'Create channel',
        'Create category',
        'Notification settings',
        'Privacy settings',
        'Edit community profile',
        'Mute community',
        'Hide muted channels',
      ]);
      expect(find.text('Delete my messages'), findsNothing);
      expect(find.text('Leave community'), findsNothing);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('a plain member only gets the items they can use', (
      tester,
    ) async {
      await openHeaderSheet(tester, state: stateFor(), guildPermissions: 0);

      expect(find.text('More options'), findsNothing);
      expect(find.text('Community settings'), findsNothing);
      expect(find.text('Create channel'), findsNothing);
      expect(find.text('Create category'), findsNothing);
      expect(find.text('Invite members'), findsNothing);
      expectInOrder(tester, <String>[
        'Notification settings',
        'Privacy settings',
        'Edit community profile',
        'Mute community',
        'Hide muted channels',
        'Delete my messages',
        'Leave community',
      ]);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('a channel manager also gets the create items', (tester) async {
      await openHeaderSheet(
        tester,
        state: stateFor(),
        guildPermissions: Permission.manageChannels.value,
      );

      expectInOrder(tester, <String>[
        'Create channel',
        'Create category',
        'Notification settings',
        'Leave community',
      ]);
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar long-press menus', () {
    testWidgets('channel menu hides mark as read when channel is read', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);

      expect(find.text('Mark as read'), findsNothing);
      expect(find.text('Copy link'), findsOneWidget);
      expect(find.text('Copy channel ID'), findsOneWidget);
      expect(find.text('Notification settings'), findsOneWidget);
      expect(find.text('Delete my messages'), findsOneWidget);
      expect(find.text('Open link'), findsNothing);
      expect(find.text('Debug channel'), findsNothing);
      expect(find.text('Delete channel'), findsNothing);

      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Copy link'), lessThan(dy('Mute channel')));
      expect(dy('Mute channel'), lessThan(dy('Notification settings')));
      expect(dy('Notification settings'), lessThan(dy('Copy channel ID')));
      expect(dy('Copy channel ID'), lessThan(dy('Delete my messages')));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('tablet channel menu opens near the pressed row', (
      tester,
    ) async {
      _setWideSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
          ),
        ),
      );
      await _pumpSidebar(tester);

      final Offset channelCenter = tester.getCenter(find.text('general'));
      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);

      expect(find.text('Copy link'), findsOneWidget);
      expect(
        find.ancestor(
          of: find.text('Copy link'),
          matching: find.byType(Material),
        ),
        findsWidgets,
      );

      final Offset menuTopLeft = tester.getTopLeft(find.text('Copy link'));
      expect(menuTopLeft.dx, greaterThan(channelCenter.dx - 40));
      expect(menuTopLeft.dy, greaterThan(channelCenter.dy - 40));
      expect((menuTopLeft - channelCenter).distance, lessThan(280));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('channel menu shows mark as read when channel is unread', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {
              'c1': UnreadState(hasUnread: true, hasUnreadMessages: true),
              'c2': UnreadState(),
            },
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);

      expect(find.text('Mark as read'), findsOneWidget);
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Mark as read'), lessThan(dy('Copy link')));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('channel menu shows invite people when permitted', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            permissionBits: {
              'c1': Permission.createInstantInvite.value,
              'c2': Permission.viewChannel.value,
            },
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);

      expect(find.text('Invite people'), findsOneWidget);
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Invite people'), lessThan(dy('Copy link')));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('voice channel menu shows open chat and delete my messages', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _mixedChannelState(),
            unread: const {'c1': UnreadState(), 'voice-1': UnreadState()},
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('voice-room'));
      await _pumpSidebar(tester);

      expect(find.text('Open chat'), findsOneWidget);
      expect(find.text('Delete my messages'), findsOneWidget);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('category menu shows mute, copy id, and mark read actions', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('My Category'));
      await _pumpSidebar(tester);

      expect(find.text('Mute category'), findsOneWidget);
      expect(find.text('Copy category ID'), findsOneWidget);
      expect(find.text('Mark as read'), findsOneWidget);
      expect(find.text('Debug category'), findsNothing);

      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Mark as read'), lessThan(dy('Mute category')));
      expect(dy('Mute category'), lessThan(dy('Copy category ID')));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('category menu hides create channel without manage channels', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: <Override>[
            ..._buildOverrides(
              channelListState: _state(),
              unread: const {'c1': UnreadState(), 'c2': UnreadState()},
              permissionBits: {'c1': Permission.manageChannels.value},
            ),
            effectiveGuildChannelPermissionBitsProvider(
              'cat1',
            ).overrideWith((ref) => 0),
          ],
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('My Category'));
      await _pumpSidebar(tester);

      expect(find.text('Mute category'), findsOneWidget);
      expect(find.text('Create channel'), findsNothing);
      expect(find.text('Edit category'), findsNothing);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('category create channel preselects the category as parent', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final _RecordingAdapter adapter = _RecordingAdapter();
      await tester.pumpWidget(
        _buildTestApp(
          overrides: <Override>[
            ..._buildOverrides(
              channelListState: _state(),
              unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            ),
            ..._apiOverrides(adapter),
            effectiveGuildChannelPermissionBitsProvider(
              'cat1',
            ).overrideWith((ref) => Permission.manageChannels.value),
          ],
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('My Category'));
      await _pumpSidebar(tester);
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Create channel'), lessThan(dy('Edit category')));
      await tester.tap(find.text('Create channel'));
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      await tester.enterText(find.byType(EditableText).first, 'backstage');
      await _pumpSidebar(tester);
      await tester.tap(find.text(testL10n.create));
      await _pumpSidebar(tester);

      expect(adapter.requests, hasLength(1));
      final RequestOptions request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.path, endsWith('/guilds/$_guildId/channels'));
      final Map<String, Object?> body = request.data as Map<String, Object?>;
      expect(body['name'], 'backstage');
      expect(body['parent_id'], 'cat1');
      await releaseTestWidgetTree(tester);
    });

    testWidgets('channel menu hides move to category without manage channels', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);

      expect(find.text('Copy channel ID'), findsOneWidget);
      expect(find.text('Move to category'), findsNothing);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('move to category marks the current one and moves out of it', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final FluxerDatabase database = openTestDatabase();
      await database.channelDao.upsertChannels(
        <Channel>[
          const Channel(
            id: 'cat1',
            guildId: _guildId,
            name: 'My Category',
            type: ChannelType.guildCategory,
          ),
          const Channel(
            id: 'cat2',
            guildId: _guildId,
            name: 'Archive',
            type: ChannelType.guildCategory,
            position: 1,
          ),
          _channel('c1', 'general'),
          const Channel(
            id: 'c2',
            guildId: _guildId,
            name: 'random',
            parentId: 'cat1',
            position: 1,
          ),
        ].map((Channel channel) => channel.toCompanion()).toList(),
      );
      final _RecordingAdapter adapter = _RecordingAdapter();
      await tester.pumpWidget(
        _buildTestApp(
          overrides: <Override>[
            ..._buildOverrides(
              channelListState: _state(),
              unread: const {'c1': UnreadState(), 'c2': UnreadState()},
              permissionBits: {'c1': Permission.manageChannels.value},
              database: database,
            ),
            ..._apiOverrides(adapter),
          ],
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Edit channel'), lessThan(dy('Move to category')));
      expect(dy('Move to category'), lessThan(dy('Duplicate channel')));
      await tester.tap(find.text('Move to category'));
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      FluxerBottomSheetMenuItem option(String label) =>
          tester.widget<FluxerBottomSheetMenuItem>(
            find.byWidgetPredicate(
              (widgets.Widget widget) =>
                  widget is FluxerBottomSheetMenuItem && widget.label == label,
            ),
          );
      expect(option('No category').isSelected, isFalse);
      expect(option('My Category').isSelected, isTrue);
      expect(option('Archive').isSelected, isFalse);
      expect(dy('No category'), lessThan(dy('Archive')));
      expect(
        find.descendant(
          of: find.byWidget(option('My Category')),
          matching: find.byType(FluxerSelectedCheck),
        ),
        findsOneWidget,
      );

      await tester.tap(find.text('No category'));
      await _pumpSidebar(tester);

      expect(adapter.requests, hasLength(1));
      final RequestOptions request = adapter.requests.single;
      expect(request.method, 'PATCH');
      expect(request.path, '/guilds/$_guildId/channels');
      expect(request.data, <Map<String, Object?>>[
        <String, Object?>{
          'id': 'c1',
          'parent_id': null,
          'preceding_sibling_id': 'cat2',
          'position': 2,
          'lock_permissions': false,
        },
      ]);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('move to category sends the channel to the end of another', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final FluxerDatabase database = openTestDatabase();
      await database.channelDao.upsertChannels(
        <Channel>[
          const Channel(
            id: 'cat1',
            guildId: _guildId,
            name: 'My Category',
            type: ChannelType.guildCategory,
          ),
          const Channel(
            id: 'cat2',
            guildId: _guildId,
            name: 'Archive',
            type: ChannelType.guildCategory,
            position: 1,
          ),
          _channel('c1', 'general'),
          const Channel(
            id: 'old-1',
            guildId: _guildId,
            name: 'old-one',
            parentId: 'cat2',
          ),
          const Channel(
            id: 'old-2',
            guildId: _guildId,
            name: 'old-two',
            parentId: 'cat2',
            position: 1,
          ),
        ].map((Channel channel) => channel.toCompanion()).toList(),
      );
      final _RecordingAdapter adapter = _RecordingAdapter();
      await tester.pumpWidget(
        _buildTestApp(
          overrides: <Override>[
            ..._buildOverrides(
              channelListState: _state(),
              unread: const {'c1': UnreadState(), 'c2': UnreadState()},
              permissionBits: {'c1': Permission.manageChannels.value},
              database: database,
            ),
            ..._apiOverrides(adapter),
          ],
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);
      await tester.tap(find.text('Move to category'));
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await tester.tap(find.text('Archive'));
      await _pumpSidebar(tester);

      expect(adapter.requests.single.data, <Map<String, Object?>>[
        <String, Object?>{
          'id': 'c1',
          'parent_id': 'cat2',
          'preceding_sibling_id': 'old-2',
          'position': 2,
          'lock_permissions': false,
        },
      ]);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('channel menu shows "Delete channel" for managers', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            permissionBits: {'c1': Permission.manageChannels.value},
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);

      expect(find.text('Edit channel'), findsOneWidget);
      expect(find.text('Duplicate channel'), findsOneWidget);
      expect(find.text('Delete channel'), findsOneWidget);
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Edit channel'), lessThan(dy('Duplicate channel')));
      expect(dy('Duplicate channel'), lessThan(dy('Copy channel ID')));
      expect(dy('Copy channel ID'), lessThan(dy('Delete channel')));
      expect(dy('Delete channel'), lessThan(dy('Delete my messages')));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('edit channel opens channel settings', (tester) async {
      _setMobileSurface(tester);
      final Channel channel = _channel('c1', 'general');
      await tester.pumpWidget(
        _buildTestApp(
          overrides: <Override>[
            ..._buildOverrides(
              channelListState: _state(),
              unread: const {'c1': UnreadState(), 'c2': UnreadState()},
              permissionBits: {'c1': Permission.manageChannels.value},
            ),
            channelByIdProvider(
              'c1',
            ).overrideWith((Ref ref) => Stream<Channel?>.value(channel)),
          ],
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await tester.tap(find.text('Edit channel'));
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      expect(find.text('general'), findsOneWidget);
      expect(find.text('Overview'), findsOneWidget);
      expect(find.text('Coming soon'), findsNothing);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('channel menu shows Debug Channel in developer mode', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            developerMode: true,
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);

      expect(find.text('Debug channel'), findsOneWidget);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('category menu shows Debug Category in developer mode', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            developerMode: true,
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('My Category'));
      await _pumpSidebar(tester);

      expect(find.text('Debug category'), findsOneWidget);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('link channel menu shows Open Link', (tester) async {
      _setMobileSurface(tester);
      final linkState = ChannelListState(
        guild: const Guild(id: _guildId, name: 'Test Guild'),
        categories: [
          ChannelCategory(
            id: 'cat1',
            name: 'My Category',
            channels: [
              _linkChannel('c1', 'announcements', 'https://example.com'),
            ],
          ),
        ],
        selectedChannelId: null,
        hasReceivedInitialChannelList: true,
      );
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: linkState,
            unread: const {'c1': UnreadState()},
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('announcements'));
      await _pumpSidebar(tester);

      expect(find.text('Open link'), findsOneWidget);
      expect(find.text('Copy channel link'), findsOneWidget);
      expect(find.text('Copy redirect link'), findsOneWidget);
      expect(find.text('Notification settings'), findsOneWidget);
      expect(find.text('Mute channel'), findsNothing);
      expect(find.text('Copy link'), findsNothing);

      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Open link'), lessThan(dy('Copy redirect link')));
      expect(dy('Copy redirect link'), lessThan(dy('Copy channel link')));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('adding a favorite from the channel menu shows a toast', (
      tester,
    ) async {
      _setWideSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            showFavorites: true,
          ),
        ),
      );
      await _pumpSidebar(tester);

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      await tester.tap(find.text(testL10n.favoritesAddToFavorites));
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      final List<ToastEntry> toasts = ProviderScope.containerOf(
        tester.element(find.byType(GuildSidebar)),
      ).read(toastProvider);
      expect(toasts.single.toast.message, testL10n.favoritesAddedToast);
      expect(toasts.single.toast.variant, FluxerToastVariant.success);

      await tester.pump(const Duration(seconds: 5));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('removing a favorite from the channel menu shows a toast', (
      tester,
    ) async {
      _setWideSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            showFavorites: true,
          ),
        ),
      );
      await _pumpSidebar(tester);

      await ProviderScope.containerOf(tester.element(find.byType(GuildSidebar)))
          .read(favoriteChannelsRepositoryProvider)
          .addChannel(channelId: 'c1', guildId: _guildId, nickname: 'general');

      await tester.longPress(find.text('general'));
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      await tester.tap(find.text(testL10n.favoritesRemoveFromFavorites));
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      final List<ToastEntry> toasts = ProviderScope.containerOf(
        tester.element(find.byType(GuildSidebar)),
      ).read(toastProvider);
      expect(toasts.single.toast.message, testL10n.favoritesRemovedToast);
      expect(toasts.single.toast.variant, FluxerToastVariant.success);

      await tester.pump(const Duration(seconds: 5));
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar voice channel access icons', () {
    testWidgets('shows no-connect icon when connect permission is denied', (
      tester,
    ) async {
      _setMobileSurface(tester);
      const String voiceChannelId = 'voice-1';
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _voiceChannelState(),
            unread: const {'voice-1': UnreadState()},
            sidebarConnectBits: {voiceChannelId: Permission.viewChannel.value},
          ),
        ),
      );
      await _pumpSidebar(tester);

      final Finder voiceRow = find.ancestor(
        of: find.text('locked-voice'),
        matching: find.byType(Row),
      );
      final SvgPicture svg = tester.widget<SvgPicture>(
        find.descendant(of: voiceRow, matching: find.byType(SvgPicture)),
      );
      final String asset = (svg.bytesLoader as SvgAssetLoader).assetName;
      expect(asset, contains('voice_no_connect'));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('shows default voice icon while connect bits are unresolved', (
      tester,
    ) async {
      _setMobileSurface(tester);
      const String voiceChannelId = 'voice-1';
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _voiceChannelState(),
            unread: const {'voice-1': UnreadState()},
            sidebarConnectBits: {voiceChannelId: null},
          ),
        ),
      );
      await _pumpSidebar(tester);

      final Finder voiceRow = find.ancestor(
        of: find.text('locked-voice'),
        matching: find.byType(Row),
      );
      final SvgPicture svg = tester.widget<SvgPicture>(
        find.descendant(of: voiceRow, matching: find.byType(SvgPicture)),
      );
      final String asset = (svg.bytesLoader as SvgAssetLoader).assetName;
      expect(asset, contains('voice.svg'));
      expect(asset, isNot(contains('voice_no_connect')));
      await releaseTestWidgetTree(tester);
    });

    testWidgets('shows default voice icon when connect is allowed', (
      tester,
    ) async {
      _setMobileSurface(tester);
      const String voiceChannelId = 'voice-1';
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _voiceChannelState(),
            unread: const {'voice-1': UnreadState()},
            sidebarConnectBits: {
              voiceChannelId:
                  Permission.viewChannel.value | Permission.connect.value,
            },
          ),
        ),
      );
      await _pumpSidebar(tester);

      final Finder voiceRow = find.ancestor(
        of: find.text('locked-voice'),
        matching: find.byType(Row),
      );
      final SvgPicture svg = tester.widget<SvgPicture>(
        find.descendant(of: voiceRow, matching: find.byType(SvgPicture)),
      );
      final String asset = (svg.bytesLoader as SvgAssetLoader).assetName;
      expect(asset, contains('voice.svg'));
      expect(asset, isNot(contains('voice_no_connect')));
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar scroll indicator', () {
    testWidgets('shows NEW MESSAGES when unread channel is off-screen below', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 220);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final List<Channel> channels = List<Channel>.generate(
        20,
        (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
      );
      final Map<String, UnreadState> unread = <String, UnreadState>{
        for (int index = 1; index <= 20; index++)
          'c$index': index == 20
              ? const UnreadState(hasUnread: true, hasUnreadMessages: true)
              : const UnreadState(),
      };
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: ChannelListState(
              guild: const Guild(id: _guildId, name: 'Test Guild'),
              categories: [
                ChannelCategory(
                  id: 'cat1',
                  name: 'My Category',
                  channels: channels,
                ),
              ],
              selectedChannelId: 'c1',
              hasReceivedInitialChannelList: true,
            ),
            selectedChannelId: 'c1',
            unread: unread,
            guildReadState: {_guildId: _unreadGuildReadState},
          ),
        ),
      );
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      final Finder indicator = find.text('NEW MESSAGES');
      expect(indicator, findsNWidgets(2));

      await tester.tap(indicator.last);
      await tester.pump(const Duration(milliseconds: 250));
      await tester.pump(const Duration(milliseconds: 250));

      expect(find.text('channel-20'), findsOneWidget);
      await releaseTestWidgetTree(tester);
    });

    testWidgets(
      'shows a NEW MESSAGES pill at each edge when unread channels exist above and below',
      (tester) async {
        tester.view.physicalSize = const Size(390, 220);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final List<Channel> channels = List<Channel>.generate(
          20,
          (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
        );
        final Map<String, UnreadState> unread = <String, UnreadState>{
          for (int index = 1; index <= 20; index++)
            'c$index': index == 1 || index == 20
                ? const UnreadState(hasUnread: true, hasUnreadMessages: true)
                : const UnreadState(),
        };
        await tester.pumpWidget(
          _buildTestApp(
            overrides: _buildOverrides(
              channelListState: ChannelListState(
                guild: const Guild(id: _guildId, name: 'Test Guild'),
                categories: [
                  ChannelCategory(
                    id: 'cat1',
                    name: 'My Category',
                    channels: channels,
                  ),
                ],
                selectedChannelId: 'c10',
                hasReceivedInitialChannelList: true,
              ),
              selectedChannelId: 'c10',
              unread: unread,
              guildReadState: {_guildId: _unreadGuildReadState},
            ),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 300));

        final ScrollableState scrollable = tester.state<ScrollableState>(
          find.byType(Scrollable).first,
        );
        scrollable.position.jumpTo(scrollable.position.maxScrollExtent / 2);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 300));

        final Iterable<AnimatedOpacity> opacities = tester
            .widgetList<AnimatedOpacity>(
              find.descendant(
                of: find.byType(GuildScrollIndicatorLayer),
                matching: find.byType(AnimatedOpacity),
              ),
            );
        final int visibleCount = opacities
            .where((AnimatedOpacity opacity) => opacity.opacity == 1.0)
            .length;
        expect(visibleCount, 2);
        await releaseTestWidgetTree(tester);
      },
    );

    testWidgets(
      'shows the off-screen mention pill once a remounted list settles',
      (tester) async {
        tester.view.physicalSize = const Size(390, 220);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final ProviderContainer container = ProviderContainer(
          overrides: _buildOverrides(
            channelListState: ChannelListState(
              guild: const Guild(id: _guildId, name: 'Test Guild'),
              categories: [
                ChannelCategory(
                  id: 'cat1',
                  name: 'My Category',
                  channels: List<Channel>.generate(
                    40,
                    (int index) =>
                        _channel('c${index + 1}', 'channel-${index + 1}'),
                  ),
                ),
              ],
              selectedChannelId: 'c1',
              hasReceivedInitialChannelList: true,
            ),
            selectedChannelId: 'c1',
            unread: <String, UnreadState>{
              for (int index = 1; index <= 40; index++)
                'c$index': index == 40
                    ? const UnreadState(
                        hasUnread: true,
                        hasUnreadMessages: true,
                        mentionCount: 1,
                      )
                    : const UnreadState(),
            },
          ),
        );
        addTearDown(container.dispose);
        final colorTheme = buildDarkColorTheme();
        Future<void> mountSidebar() async {
          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: MaterialApp(
                locale: kTestLocale,
                localizationsDelegates: fluxerLocalizationsDelegates,
                supportedLocales: FluxerLocalizations.supportedLocales,
                theme: buildFluxerTheme(
                  colorTheme: colorTheme,
                  textTheme: FluxerTextTheme.fromColors(colorTheme),
                  layoutTheme: FluxerLayoutTheme.scaled(),
                ),
                home: const Scaffold(body: GuildSidebar()),
              ),
            ),
          );
          await _pumpSidebar(tester);
        }

        Future<void> showDirectMessages() async {
          await tester.pumpWidget(const SizedBox.shrink());
          await _pumpSidebar(tester);
        }

        await mountSidebar();
        expect(_visibleScrollIndicatorCount(tester), 1);

        await showDirectMessages();
        await mountSidebar();
        expect(_visibleScrollIndicatorCount(tester), 1);

        final ScrollableState scrollable = tester.state<ScrollableState>(
          find.byType(Scrollable).first,
        );
        scrollable.position.jumpTo(40);
        await _pumpSidebar(tester);
        await showDirectMessages();
        await mountSidebar();
        expect(
          tester
              .state<ScrollableState>(find.byType(Scrollable).first)
              .position
              .pixels,
          40,
        );
        expect(_visibleScrollIndicatorCount(tester), 1);
        await releaseTestWidgetTree(tester);
      },
    );
  });

  group('GuildSidebar scroll persistence', () {
    testWidgets('restores channel list scroll after widget recreation', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 220);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final List<Channel> channels = List<Channel>.generate(
        20,
        (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
      );
      final Map<String, UnreadState> unread = <String, UnreadState>{
        for (int index = 1; index <= 20; index++)
          'c$index': index == 20
              ? const UnreadState(hasUnread: true, hasUnreadMessages: true)
              : const UnreadState(),
      };
      final List<Override> overrides = _buildOverrides(
        channelListState: ChannelListState(
          guild: const Guild(id: _guildId, name: 'Test Guild'),
          categories: [
            ChannelCategory(
              id: 'cat1',
              name: 'My Category',
              channels: channels,
            ),
          ],
          selectedChannelId: 'c1',
          hasReceivedInitialChannelList: true,
        ),
        selectedChannelId: 'c1',
        unread: unread,
      );
      final ProviderContainer container = ProviderContainer(
        overrides: overrides,
      );
      addTearDown(container.dispose);
      final colorTheme = buildDarkColorTheme();
      Future<void> pumpSidebar() async {
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              locale: kTestLocale,
              localizationsDelegates: fluxerLocalizationsDelegates,
              supportedLocales: FluxerLocalizations.supportedLocales,
              theme: buildFluxerTheme(
                colorTheme: colorTheme,
                textTheme: FluxerTextTheme.fromColors(colorTheme),
                layoutTheme: FluxerLayoutTheme.scaled(),
              ),
              home: const Scaffold(body: GuildSidebar()),
            ),
          ),
        );
        await _pumpSidebar(tester);
        for (int i = 0; i < 4; i += 1) {
          await tester.pump(const Duration(milliseconds: 100));
        }
      }

      await pumpSidebar();
      await tester.scrollUntilVisible(
        find.text('channel-20'),
        100,
        scrollable: find.byType(Scrollable).first,
      );
      await _pumpSidebar(tester);
      expect(find.text('channel-20'), findsOneWidget);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      await pumpSidebar();

      expect(find.text('channel-20'), findsOneWidget);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('a restored channel list is never blank or hidden', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 220);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final List<Channel> channels = List<Channel>.generate(
        20,
        (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
      );
      final Map<String, UnreadState> unread = <String, UnreadState>{
        for (int index = 1; index <= 20; index++)
          'c$index': index == 20
              ? const UnreadState(hasUnread: true, hasUnreadMessages: true)
              : const UnreadState(),
      };
      final List<Override> overrides = _buildOverrides(
        channelListState: ChannelListState(
          guild: const Guild(id: _guildId, name: 'Test Guild'),
          categories: [
            ChannelCategory(
              id: 'cat1',
              name: 'My Category',
              channels: channels,
            ),
          ],
          selectedChannelId: 'c1',
          hasReceivedInitialChannelList: true,
        ),
        selectedChannelId: 'c1',
        unread: unread,
      );
      final ProviderContainer container = ProviderContainer(
        overrides: overrides,
      );
      addTearDown(container.dispose);
      final colorTheme = buildDarkColorTheme();
      Future<void> pumpSidebar() async {
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              locale: kTestLocale,
              localizationsDelegates: fluxerLocalizationsDelegates,
              supportedLocales: FluxerLocalizations.supportedLocales,
              theme: buildFluxerTheme(
                colorTheme: colorTheme,
                textTheme: FluxerTextTheme.fromColors(colorTheme),
                layoutTheme: FluxerLayoutTheme.scaled(),
              ),
              home: const Scaffold(body: GuildSidebar()),
            ),
          ),
        );
        await _pumpSidebar(tester);
        for (int i = 0; i < 4; i += 1) {
          await tester.pump(const Duration(milliseconds: 100));
        }
      }

      await pumpSidebar();
      await tester.scrollUntilVisible(
        find.text('channel-20'),
        100,
        scrollable: find.byType(Scrollable).first,
      );
      await _pumpSidebar(tester);
      expect(find.text('channel-20'), findsOneWidget);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            locale: kTestLocale,
            localizationsDelegates: fluxerLocalizationsDelegates,
            supportedLocales: FluxerLocalizations.supportedLocales,
            theme: buildFluxerTheme(
              colorTheme: colorTheme,
              textTheme: FluxerTextTheme.fromColors(colorTheme),
              layoutTheme: FluxerLayoutTheme.scaled(),
            ),
            home: const Scaffold(body: GuildSidebar()),
          ),
        ),
      );
      for (int frame = 0; frame < 20; frame += 1) {
        if (find.byType(GuildSidebarSkeleton).evaluate().isEmpty) {
          final Finder channel = find.text('channel-20');
          expect(channel, findsOneWidget, reason: 'frame $frame');
          final Iterable<Opacity> opacities = tester.widgetList<Opacity>(
            find.ancestor(of: channel, matching: find.byType(Opacity)),
          );
          expect(
            opacities.every((Opacity o) => o.opacity == 1),
            isTrue,
            reason: 'frame $frame',
          );
        }
        await tester.pump(const Duration(milliseconds: 16));
      }
      await releaseTestWidgetTree(tester);
    });

    testWidgets('restores channel list scroll after switching guilds', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 220);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final List<Channel> guildAChannels = List<Channel>.generate(
        20,
        (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
      );
      final List<Channel> guildBChannels = List<Channel>.generate(
        5,
        (int index) => Channel(
          id: 'b${index + 1}',
          guildId: _otherGuildId,
          name: 'guild-b-${index + 1}',
          parentId: 'cat-b1',
        ),
      );
      final Map<String, UnreadState> unread = <String, UnreadState>{
        for (int index = 1; index <= 20; index++)
          'c$index': index == 20
              ? const UnreadState(hasUnread: true, hasUnreadMessages: true)
              : const UnreadState(),
      };
      final _GuildSwitchTestHarness harness = _GuildSwitchTestHarness();
      final ChannelListState guildAState = ChannelListState(
        guild: const Guild(id: _guildId, name: 'Test Guild'),
        categories: <ChannelCategory>[
          ChannelCategory(
            id: 'cat1',
            name: 'My Category',
            channels: guildAChannels,
          ),
        ],
        selectedChannelId: 'c1',
        hasReceivedInitialChannelList: true,
      );
      final ChannelListState guildBState = ChannelListState(
        guild: const Guild(id: _otherGuildId, name: 'Other Guild'),
        categories: <ChannelCategory>[
          ChannelCategory(
            id: 'cat-b1',
            name: 'Other Category',
            channels: guildBChannels,
          ),
        ],
        selectedChannelId: 'b1',
        hasReceivedInitialChannelList: true,
      );
      harness.channelListState = guildAState;
      final List<Override> overrides = <Override>[
        ..._buildOverrides(
          channelListState: guildAState,
          selectedChannelId: 'c1',
          unread: unread,
          activeGuildIdReader: (Ref ref) => harness.activeGuildId,
          channelListViewModelFactory: () =>
              _HarnessChannelListViewModel(harness),
        ),
        guildMuteProvider(
          _otherGuildId,
        ).overrideWithValue(const AsyncData<GuildMuteState>(GuildMuteState())),
        mutedChannelIdsProvider(
          _otherGuildId,
        ).overrideWithValue(const AsyncData<Set<String>>(<String>{})),
        guildCollapsedCategoriesProvider(
          _otherGuildId,
        ).overrideWithValue(const AsyncData<Set<String>>(<String>{})),
        for (final Channel channel in guildBChannels)
          channelUnreadProvider(channel.id).overrideWith(
            (Ref ref) => Stream<UnreadState>.value(const UnreadState()),
          ),
      ];
      final ProviderContainer container = ProviderContainer(
        overrides: overrides,
      );
      addTearDown(container.dispose);
      final colorTheme = buildDarkColorTheme();
      Future<void> pumpSidebar() async {
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              locale: kTestLocale,
              localizationsDelegates: fluxerLocalizationsDelegates,
              supportedLocales: FluxerLocalizations.supportedLocales,
              theme: buildFluxerTheme(
                colorTheme: colorTheme,
                textTheme: FluxerTextTheme.fromColors(colorTheme),
                layoutTheme: FluxerLayoutTheme.scaled(),
              ),
              home: const Scaffold(body: GuildSidebar()),
            ),
          ),
        );
        await _pumpSidebar(tester);
        for (int i = 0; i < 4; i += 1) {
          await tester.pump(const Duration(milliseconds: 100));
        }
      }

      await pumpSidebar();
      await tester.scrollUntilVisible(
        find.text('channel-20'),
        100,
        scrollable: find.byType(Scrollable).first,
      );
      await _pumpSidebar(tester);
      expect(find.text('channel-20'), findsOneWidget);

      harness
        ..activeGuildId = _otherGuildId
        ..channelListState = guildBState;
      container
        ..invalidate(activeGuildIdProvider)
        ..invalidate(channelListViewModelProvider);
      await pumpSidebar();
      expect(find.text('guild-b-1'), findsOneWidget);

      harness
        ..activeGuildId = _guildId
        ..channelListState = guildAState;
      container
        ..invalidate(activeGuildIdProvider)
        ..invalidate(channelListViewModelProvider);
      await pumpSidebar();
      expect(find.text('channel-20'), findsOneWidget);
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar selected channel anchoring', () {
    testWidgets('opens centered on the selected channel without a saved '
        'scroll position', (tester) async {
      tester.view.physicalSize = const Size(390, 400);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final List<Channel> channels = List<Channel>.generate(
        40,
        (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
      );
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: ChannelListState(
              guild: const Guild(id: _guildId, name: 'Test Guild'),
              categories: <ChannelCategory>[
                ChannelCategory(
                  id: 'cat1',
                  name: 'My Category',
                  channels: channels,
                ),
              ],
              selectedChannelId: 'c30',
              hasReceivedInitialChannelList: true,
            ),
            selectedChannelId: 'c30',
            unread: <String, UnreadState>{
              for (final Channel channel in channels)
                channel.id: const UnreadState(),
            },
          ),
        ),
      );
      await _pumpSidebar(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      final Finder selected = find.text('channel-30');
      expect(selected, findsOneWidget);
      final Rect list = tester.getRect(find.byType(Scrollable).first);
      final double visibleCenter = (list.top + 56 + list.bottom) / 2;
      expect(tester.getCenter(selected).dy, closeTo(visibleCenter, 24));
      await releaseTestWidgetTree(tester);
    });
  });

  group('GuildSidebar unread gate fallback', () {
    Future<void> expectChannelsAfterWait(WidgetTester tester) async {
      await tester.pump();
      expect(find.text('general'), findsNothing);
      await tester.pump(kGuildUnreadPrimeLimit);
      await tester.pump();
      expect(find.text('general'), findsOneWidget);
      expect(find.text('random'), findsOneWidget);
      await releaseTestWidgetTree(tester);
    }

    testWidgets('shows channels when an unread state never resolves', (
      tester,
    ) async {
      final StreamController<UnreadState> never =
          StreamController<UnreadState>();
      addTearDown(() => unawaited(never.close()));
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState()},
            unreadStreams: {'c2': never.stream},
          ),
        ),
      );
      await expectChannelsAfterWait(tester);
    });

    testWidgets('shows channels when an unread state fails', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState()},
            unreadStreams: {
              'c2': Stream<UnreadState>.error(StateError('unread failed')),
            },
          ),
        ),
      );
      await expectChannelsAfterWait(tester);
    });

    testWidgets('shows channels when guild settings never load', (
      tester,
    ) async {
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            mutedValue: const AsyncLoading<Set<String>>(),
          ),
        ),
      );
      await expectChannelsAfterWait(tester);
    });
  });

  group('GuildSidebar voice session isolation', () {
    testWidgets(
      'keeps text channels visible when voice session is connecting',
      (tester) async {
        _setMobileSurface(tester);
        final _MutableVoiceSession session = _MutableVoiceSession();
        await tester.pumpWidget(
          _buildTestApp(
            overrides: _buildOverrides(
              channelListState: _mixedChannelState(),
              unread: const {'c1': UnreadState(), 'voice-1': UnreadState()},
              voiceSessionFactory: () => session,
            ),
          ),
        );
        await _pumpSidebar(tester);
        expect(find.text('general'), findsOneWidget);

        session.setSession(
          const VoiceSessionState(
            isConnecting: true,
            guildId: _guildId,
            channelId: 'voice-1',
            voiceServerEndpoint: 'wss://voice.example',
          ),
        );
        await tester.pump();

        expect(find.text('general'), findsOneWidget);
        await releaseTestWidgetTree(tester);
      },
    );
  });
}

int _visibleScrollIndicatorCount(WidgetTester tester) {
  return tester
      .widgetList<AnimatedOpacity>(
        find.descendant(
          of: find.byType(GuildScrollIndicatorLayer),
          matching: find.byType(AnimatedOpacity),
        ),
      )
      .where((AnimatedOpacity opacity) => opacity.opacity == 1.0)
      .length;
}

void _setMobileSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void _setWideSurface(WidgetTester tester) {
  tester.view.physicalSize = kWideTestViewportSize;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

Channel _channel(String id, String name) =>
    Channel(id: id, guildId: _guildId, name: name, parentId: 'cat1');

Channel _linkChannel(String id, String name, String url) => Channel(
  id: id,
  guildId: _guildId,
  name: name,
  url: url,
  type: ChannelType.guildLink,
  parentId: 'cat1',
);

ChannelListState _state({String? selectedChannelId}) => ChannelListState(
  guild: const Guild(id: _guildId, name: 'Test Guild'),
  categories: [
    ChannelCategory(
      id: 'cat1',
      name: 'My Category',
      channels: [_channel('c1', 'general'), _channel('c2', 'random')],
    ),
  ],
  selectedChannelId: selectedChannelId,
  hasReceivedInitialChannelList: true,
);

ChannelListState _voiceChannelState() => const ChannelListState(
  guild: Guild(id: _guildId, name: 'Test Guild'),
  categories: [
    ChannelCategory(
      id: 'cat1',
      name: 'Voice',
      channels: [
        Channel(
          id: 'voice-1',
          guildId: _guildId,
          name: 'locked-voice',
          type: ChannelType.guildVoice,
          parentId: 'cat1',
        ),
      ],
    ),
  ],
  selectedChannelId: null,
  hasReceivedInitialChannelList: true,
);

ChannelListState _mixedChannelState() => ChannelListState(
  guild: const Guild(id: _guildId, name: 'Test Guild'),
  selectedChannelId: null,
  hasReceivedInitialChannelList: true,
  categories: [
    ChannelCategory(
      id: 'cat1',
      name: 'My Category',
      channels: [
        _channel('c1', 'general'),
        const Channel(
          id: 'voice-1',
          guildId: _guildId,
          name: 'voice-room',
          type: ChannelType.guildVoice,
          parentId: 'cat1',
        ),
      ],
    ),
  ],
);

List<Override> _buildOverrides({
  required ChannelListState channelListState,
  String? selectedChannelId,
  Set<String> collapsed = const {},
  Set<String> muted = const {},
  bool hideMuted = false,
  Map<String, UnreadState> unread = const {},
  Map<String, Stream<UnreadState>> unreadStreams = const {},
  AsyncValue<Set<String>>? mutedValue,
  Map<String, GuildReadStateEntry> guildReadState = const {},
  Map<String, int> permissionBits = const {},
  Map<String, int?> sidebarConnectBits = const {},
  bool developerMode = false,
  bool showFavorites = false,
  VoiceSession Function()? voiceSessionFactory,
  String? Function(Ref ref)? activeGuildIdReader,
  ChannelListViewModel Function()? channelListViewModelFactory,
  int guildPermissions = 0,
  FluxerDatabase? database,
}) {
  final db = database ?? openTestDatabase();
  final String routeLocation = selectedChannelId != null
      ? '/channels/$_guildId/$selectedChannelId'
      : '/channels/$_guildId';
  final List<Guild> guildList = <Guild>[
    if (channelListState.guild != null) channelListState.guild!,
    const Guild(id: _otherGuildId, name: 'Other Guild'),
  ];
  return [
    fluxerDatabaseProvider.overrideWithValue(db),
    currentUserIdProvider.overrideWithValue('me'),
    experimentsProvider.overrideWithValue(null),
    routeStateProvider.overrideWithValue(
      RouteState(
        location: routeLocation,
        activeBranchLocation: routeLocation,
        activeBranchIndex: 0,
        kind: classifyRoute(routeLocation),
        guildId: _guildId,
        channelId: selectedChannelId,
      ),
    ),
    guildListViewModelProvider.overrideWithValue(
      GuildListViewState(guilds: guildList),
    ),
    if (activeGuildIdReader != null)
      activeGuildIdProvider.overrideWith(activeGuildIdReader)
    else
      activeGuildIdProvider.overrideWithValue(_guildId),
    activeChannelIdProvider.overrideWithValue(selectedChannelId),
    channelListViewModelProvider.overrideWith(
      channelListViewModelFactory ??
          () => _FakeChannelListViewModel(channelListState),
    ),
    appearancePreferencesProvider.overrideWith(
      () => _FakeAppearancePreferences(showFavorites: showFavorites),
    ),
    voiceSessionProvider.overrideWith(
      voiceSessionFactory ?? _FakeVoiceSession.new,
    ),
    userSettingsViewModelProvider.overrideWith(
      () => _FakeUserSettings(developerMode: developerMode),
    ),
    sensitiveContentProvider.overrideWith(_FakeSensitiveContent.new),
    matureContentAgreementsProvider.overrideWith(_FakeMatureAgreements.new),
    guildMuteProvider(_guildId).overrideWithValue(
      AsyncData<GuildMuteState>(GuildMuteState(hideMutedChannels: hideMuted)),
    ),
    mutedChannelIdsProvider(
      _guildId,
    ).overrideWithValue(mutedValue ?? AsyncData<Set<String>>(muted)),
    guildCollapsedCategoriesProvider(
      _guildId,
    ).overrideWithValue(AsyncData<Set<String>>(collapsed)),
    for (final Channel channel in channelListState.categories.expand<Channel>(
      (ChannelCategory category) => category.channels,
    )) ...[
      effectiveGuildChannelPermissionBitsProvider(
        channel.id,
      ).overrideWith((ref) => permissionBits[channel.id] ?? 0),
      channelSettingsPermissionBitsProvider(
        channel.id,
      ).overrideWith((ref) => permissionBits[channel.id] ?? 0),
      if (sidebarConnectBits.containsKey(channel.id))
        channelSidebarIconConnectBitsProvider(
          channel.id,
        ).overrideWith((ref) => sidebarConnectBits[channel.id]),
    ],
    for (final entry in unread.entries)
      channelUnreadProvider(
        entry.key,
      ).overrideWith((ref) => Stream.value(entry.value)),
    for (final entry in unreadStreams.entries)
      channelUnreadProvider(entry.key).overrideWith((ref) => entry.value),
    guildReadStateProvider.overrideWithValue(guildReadState),
    guildPermissionsProvider.overrideWith(
      () => _FakeGuildPermissions(<String, int>{_guildId: guildPermissions}),
    ),
  ];
}

class _FakeGuildPermissions extends GuildPermissions {
  _FakeGuildPermissions(this._initial);

  final Map<String, int> _initial;

  @override
  Map<String, int> build() => _initial;

  @override
  Future<void> refreshPermissions(String guildId) async {}
}

Widget _buildTestApp({required List<Override> overrides}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp.router(
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      routerConfig: GoRouter(
        initialLocation: '/channels/$_guildId',
        routes: [
          GoRoute(
            path: '/channels/$_guildId',
            builder: (context, state) => const Scaffold(body: GuildSidebar()),
          ),
          GoRoute(
            path: '/channels/$_guildId/:channelId',
            builder: (context, state) => const Scaffold(body: GuildSidebar()),
          ),
          GoRoute(
            path: '/settings/channel/:channelId',
            builder: (context, state) => ChannelSettingsNavPage(
              channelId: state.pathParameters['channelId'] ?? '',
            ),
          ),
        ],
      ),
    ),
  );
}

class _FakeChannelListViewModel extends ChannelListViewModel {
  _FakeChannelListViewModel(this._state);

  final ChannelListState _state;

  @override
  ChannelListState build() => _state;
}

class _HarnessChannelListViewModel extends ChannelListViewModel {
  _HarnessChannelListViewModel(this._harness);

  final _GuildSwitchTestHarness _harness;

  @override
  ChannelListState build() => _harness.channelListState;
}

class _FakeAppearancePreferences extends AppearancePreferences {
  _FakeAppearancePreferences({this.showFavorites = false});

  final bool showFavorites;

  @override
  AppearancePreferencesState build() =>
      AppearancePreferencesState(showFavorites: showFavorites);
}

class _FakeVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

class _MutableVoiceSession extends VoiceSession {
  VoiceSessionState _sessionState = const VoiceSessionState();

  @override
  VoiceSessionState build() => _sessionState;

  void setSession(VoiceSessionState next) {
    _sessionState = next;
    state = next;
  }
}

class _FakeUserSettings extends UserSettingsViewModel {
  _FakeUserSettings({required this.developerMode});

  final bool developerMode;

  @override
  UserSettingsViewState build() => UserSettingsViewState(
    userId: 'me',
    username: '',
    displayName: '',
    discriminator: '0',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'offline',
    messageDisplayCompact: false,
    developerMode: developerMode,
    trustedDomains: const [],
  );
}

class _FakeSensitiveContent extends SensitiveContent {
  @override
  SensitiveContentState build() =>
      const SensitiveContentState(isLoading: false);
}

class _FakeMatureAgreements extends MatureContentAgreements {
  @override
  MatureContentAgreementsState build() =>
      const MatureContentAgreementsState(isLoaded: true);
}

List<Override> _apiOverrides(_RecordingAdapter adapter) {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  return <Override>[
    fluxerDioProvider.overrideWithValue(dio),
    fluxerClientProvider.overrideWithValue(
      FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1'),
    ),
  ];
}

class _RecordingAdapter implements HttpClientAdapter {
  final List<RequestOptions> requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return ResponseBody.fromString(
      jsonEncode(<String, Object?>{
        'id': 'created',
        'type': 0,
        'guild_id': _guildId,
        'name': 'created',
      }),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
