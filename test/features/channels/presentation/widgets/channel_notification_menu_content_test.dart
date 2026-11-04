import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/channel_notification_settings_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_notification_menu_content.dart';
import 'package:fluxer_app/features/channels/providers/channel_notification_menu_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

import '../../../../helpers/test_l10n.dart';

const Channel _channel = Channel(
  id: 'text-1',
  guildId: 'guild-1',
  name: 'general',
);

void main() {
  testWidgets('bottom sheet menu groups sit inside the page gutter', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    final colorTheme = buildDarkColorTheme();
    final FluxerLayoutTheme layout = FluxerLayoutTheme.scaled();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          channelNotificationMenuStateProvider(_channel).overrideWith(
            (Ref ref) => Stream<ChannelNotificationMenuState>.value(
              const ChannelNotificationMenuState(
                isMuted: false,
                selected: UserNotificationSettings.onlyMentions,
                effectiveDefault: UserNotificationSettings.onlyMentions,
                hasCategory: true,
              ),
            ),
          ),
        ],
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: layout,
          ),
          home: Scaffold(
            body: ChannelNotificationMenuContent(
              channel: _channel,
              onClose: () {},
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final Finder groups = find.byType(FluxerMenuGroup);
    expect(groups, findsNWidgets(3));
    for (final Element group in groups.evaluate()) {
      final Rect rect = tester.getRect(find.byWidget(group.widget));
      expect(rect.left, layout.pageGutter);
      expect(rect.right, 390 - layout.pageGutter);
    }
  });

  testWidgets('mute chosen from notification settings is saved', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    _RecordingGuildUserSettingsRepository? repository;
    final colorTheme = buildDarkColorTheme();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          channelNotificationMenuStateProvider(_channel).overrideWith(
            (Ref ref) => Stream<ChannelNotificationMenuState>.value(
              const ChannelNotificationMenuState(
                isMuted: false,
                selected: UserNotificationSettings.onlyMentions,
                effectiveDefault: UserNotificationSettings.onlyMentions,
                hasCategory: true,
              ),
            ),
          ),
          guildUserSettingsRepositoryProvider.overrideWith((Ref ref) {
            repository = _RecordingGuildUserSettingsRepository(ref);
            return repository!;
          }),
        ],
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: TextButton(
                  onPressed: () {
                    unawaited(
                      showChannelNotificationSettingsSheet(
                        context,
                        channel: _channel,
                      ),
                    );
                  },
                  child: const Text('Open settings'),
                ),
              );
            },
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Open settings'));
    await tester.pumpAndSettle();
    await tester.tap(find.text(testL10n.notificationMuteChannel));
    await tester.pumpAndSettle();
    await tester.tap(find.text(testL10n.dmMuteFor15Min));
    await tester.pumpAndSettle();

    expect(repository, isNotNull);
    final _RecordingGuildUserSettingsRepository recorded = repository!;
    expect(recorded.updates, hasLength(1));
    expect(recorded.updates.single.channelId, _channel.id);
    expect(recorded.updates.single.muted, isTrue);
    expect(recorded.updates.single.durationSeconds, 900);
  });
}

class _ChannelMuteUpdate {
  const _ChannelMuteUpdate({
    required this.channelId,
    required this.muted,
    required this.durationSeconds,
  });

  final String channelId;
  final bool? muted;
  final int? durationSeconds;
}

class _RecordingGuildUserSettingsRepository
    extends GuildUserSettingsRepository {
  _RecordingGuildUserSettingsRepository(super._ref);

  final List<_ChannelMuteUpdate> updates = <_ChannelMuteUpdate>[];

  @override
  Future<void> updateChannelOverride({
    required String guildId,
    required String channelId,
    bool? muted,
    int? durationSeconds,
    UserNotificationSettings? messageNotifications,
    bool? collapsed,
    int? flags,
    GuildUserSettingsPersistenceOptions options =
        const GuildUserSettingsPersistenceOptions(),
  }) async {
    updates.add(
      _ChannelMuteUpdate(
        channelId: channelId,
        muted: muted,
        durationSeconds: durationSeconds,
      ),
    );
  }
}
