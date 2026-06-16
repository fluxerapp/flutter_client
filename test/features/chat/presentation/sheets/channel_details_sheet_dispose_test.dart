import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/members/domain/member_list_range_utils.dart';
import 'package:fluxer_app/features/members/providers/member_list_desired_ranges_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_subscription_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod/src/framework.dart' show Override;

const String _guildId = 'guild_1';
const String _channelId = 'chan_1';

class _FakeAppearance extends AppearancePreferences {
  @override
  AppearancePreferencesState build() =>
      const AppearancePreferencesState(showFavorites: false);
}

ProviderContainer _container(FluxerDatabase database) {
  return ProviderContainer(
    overrides: <Override>[
      fluxerDatabaseProvider.overrideWithValue(database),
      appearancePreferencesProvider.overrideWith(_FakeAppearance.new),
      // Neutralise the gateway/router-driven subscription; unrelated to dispose.
      memberListDetailsSubscriptionProvider(
        _guildId,
        _channelId,
        true,
      ).overrideWith((ref) {}),
    ],
  );
}

Widget _host(ProviderContainer container, {required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets(
    'disposing a guild-channel sheet clears member-list state without using ref',
    (tester) async {
      final FluxerDatabase database = FluxerDatabase.forTesting(
        NativeDatabase.memory(),
      );
      addTearDown(database.close);
      final ProviderContainer container = _container(database);
      addTearDown(container.dispose);
      final ScrollController scrollController = ScrollController();
      addTearDown(scrollController.dispose);

      const Channel channel = Channel(
        id: _channelId,
        guildId: _guildId,
        name: 'general',
      );

      await tester.pumpWidget(
        _host(
          container,
          child: ChannelDetailsSheet(
            channel: channel,
            dm: null,
            initialTab: ChannelDetailsInitialTab.members,
            openSearchImmediately: false,
            scrollController: scrollController,
            close: () {},
          ),
        ),
      );
      await tester.pumpAndSettle();

      final String key = memberListDesiredRangesKey(_guildId, _channelId);
      container
          .read(memberListViewportProvider.notifier)
          .setSubscribedRanges(
            guildId: _guildId,
            channelId: _channelId,
            ranges: kMemberListInitialSubscriptionRanges,
          );

      expect(
        container.read(memberListDesiredRangesProvider).containsKey(key),
        isTrue,
        reason: 'tab content should register desired ranges while mounted',
      );
      expect(
        container
            .read(memberListViewportProvider.notifier)
            .getList(guildId: _guildId, channelId: _channelId),
        isNotNull,
      );

      await tester.pumpWidget(_host(container, child: const SizedBox.shrink()));
      await tester.pumpAndSettle();

      expect(
        tester.takeException(),
        isNull,
        reason: 'closing the sheet must not throw during dispose',
      );
      expect(
        container.read(memberListDesiredRangesProvider).containsKey(key),
        isFalse,
        reason: 'dispose should clear the desired ranges for the channel',
      );
      expect(
        container
            .read(memberListViewportProvider.notifier)
            .getList(guildId: _guildId, channelId: _channelId),
        isNull,
        reason: 'dispose should clear the viewport list for the channel',
      );
    },
  );
}
