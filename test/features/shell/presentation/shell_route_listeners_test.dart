import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_coordinator.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/push/push_notifications_coordinator.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_prompt_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/shell_route_listeners.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

late FluxerDatabase _database;

void main() {
  setUp(() {
    _database = openTestDatabase();
  });

  testWidgets('restored guild route loads channels on first shell mount', (
    WidgetTester tester,
  ) async {
    final _RouteStateSource routeStateSource = _RouteStateSource(
      location: '/channels/guild-1/channel-1',
    );
    final _RecordingChannelRepository channelRepository =
        _RecordingChannelRepository();
    final GatewayConnection gatewayConnection = GatewayConnection(
      token: 'test-token',
      dio: Dio(),
    );
    addTearDown(gatewayConnection.dispose);

    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(_database),
        routeStateProvider.overrideWith(
          () => _TestRouteStateNotifier(routeStateSource),
        ),
        guildListViewModelProvider.overrideWithValue(
          const GuildListViewState(
            guilds: <Guild>[Guild(id: 'guild-1', name: 'Guild One')],
          ),
        ),
        channelRepositoryProvider.overrideWithValue(channelRepository),
        gatewayConnectionProvider.overrideWithValue(gatewayConnection),
        pushNotificationsCoordinatorProvider.overrideWithValue(false),
        appIconBadgeCoordinatorProvider.overrideWithValue(null),
        instanceRuntimeConfigProvider.overrideWithValue(
          InstanceRuntimeConfig.defaults,
        ),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const Directionality(
          textDirection: TextDirection.ltr,
          child: ShellRouteListeners(child: SizedBox.shrink()),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(channelRepository.watchedGuildIds, <String>['guild-1']);
    expect(container.read(channelListViewModelProvider).guild?.id, 'guild-1');
  });

  testWidgets('active guild route effect loads channels for current guild', (
    WidgetTester tester,
  ) async {
    final _RouteStateSource routeStateSource = _RouteStateSource();
    final _RecordingChannelRepository channelRepository =
        _RecordingChannelRepository();
    final GatewayConnection gatewayConnection = GatewayConnection(
      token: 'test-token',
      dio: Dio(),
    );
    addTearDown(gatewayConnection.dispose);

    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(_database),
        routeStateProvider.overrideWith(
          () => _TestRouteStateNotifier(routeStateSource),
        ),
        guildListViewModelProvider.overrideWithValue(
          const GuildListViewState(
            guilds: <Guild>[Guild(id: 'guild-1', name: 'Guild One')],
          ),
        ),
        channelRepositoryProvider.overrideWithValue(channelRepository),
        gatewayConnectionProvider.overrideWithValue(gatewayConnection),
        pushNotificationsCoordinatorProvider.overrideWithValue(false),
        appIconBadgeCoordinatorProvider.overrideWithValue(null),
        instanceRuntimeConfigProvider.overrideWithValue(
          InstanceRuntimeConfig.defaults,
        ),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ShellRouteListeners(
            child: _InvalidateRouteStateAfterBuild(routeStateSource),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(channelRepository.watchedGuildIds, <String>['guild-1']);
    expect(container.read(channelListViewModelProvider).guild?.id, 'guild-1');
  });

  testWidgets('switching guild never builds with the previous guild loaded', (
    WidgetTester tester,
  ) async {
    final _RouteStateSource routeStateSource = _RouteStateSource(
      location: '/channels/guild-2/channel-2',
    );
    final _RecordingChannelRepository channelRepository =
        _RecordingChannelRepository();
    final GatewayConnection gatewayConnection = GatewayConnection(
      token: 'test-token',
      dio: Dio(),
    );
    addTearDown(gatewayConnection.dispose);

    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(_database),
        routeStateProvider.overrideWith(
          () => _TestRouteStateNotifier(routeStateSource),
        ),
        guildListViewModelProvider.overrideWithValue(
          const GuildListViewState(
            guilds: <Guild>[
              Guild(id: 'guild-1', name: 'Sim Lab'),
              Guild(id: 'guild-2', name: 'Owner Only'),
            ],
          ),
        ),
        channelRepositoryProvider.overrideWithValue(channelRepository),
        gatewayConnectionProvider.overrideWithValue(gatewayConnection),
        pushNotificationsCoordinatorProvider.overrideWithValue(false),
        appIconBadgeCoordinatorProvider.overrideWithValue(null),
        instanceRuntimeConfigProvider.overrideWithValue(
          InstanceRuntimeConfig.defaults,
        ),
      ],
    );
    addTearDown(container.dispose);

    final List<(String?, String?)> frames = <(String?, String?)>[];
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ShellRouteListeners(child: _ActiveGuildFrameRecorder(frames)),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(container.read(channelListViewModelProvider).guild?.id, 'guild-2');

    frames.clear();
    for (final String location in <String>[
      '/channels/@me',
      '/channels/guild-1',
    ]) {
      routeStateSource.location = location;
      container.invalidate(routeStateProvider);
      await tester.pump();
      await tester.pump();
    }
    await tester.pump(const Duration(seconds: 1));

    expect(tester.takeException(), isNull);
    expect(container.read(channelListViewModelProvider).guild?.id, 'guild-1');
    expect(frames.last, ('guild-1', 'guild-1'));
    expect(
      frames.where(
        ((String?, String?) frame) => frame.$1 != null && frame.$1 != frame.$2,
      ),
      isEmpty,
    );
  });

  testWidgets('relay consent requested before shell mount shows once', (
    WidgetTester tester,
  ) async {
    final GatewayConnection gatewayConnection = GatewayConnection(
      token: 'test-token',
      dio: Dio(),
    );
    addTearDown(gatewayConnection.dispose);

    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(_database),
        routeStateProvider.overrideWith(
          () => _TestRouteStateNotifier(_RouteStateSource()),
        ),
        guildListViewModelProvider.overrideWithValue(
          const GuildListViewState(guilds: <Guild>[]),
        ),
        channelRepositoryProvider.overrideWithValue(
          _RecordingChannelRepository(),
        ),
        gatewayConnectionProvider.overrideWithValue(gatewayConnection),
        pushNotificationsCoordinatorProvider.overrideWithValue(false),
        appIconBadgeCoordinatorProvider.overrideWithValue(null),
        instanceRuntimeConfigProvider.overrideWithValue(
          InstanceRuntimeConfig.defaults,
        ),
        isActiveInstanceOfficialProvider.overrideWithValue(false),
      ],
    );
    addTearDown(container.dispose);

    container.read(pushRelayConsentPromptProvider.notifier).requestPrompt();

    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          navigatorKey: rootNavigatorKey,
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: const ShellRouteListeners(child: SizedBox.shrink()),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(tester.takeException(), isNull);
    expect(find.text(testL10n.pushRelayConsentTitle), findsOneWidget);
    expect(container.read(pushRelayConsentPromptProvider), isFalse);

    container.read(pushRelayConsentPromptProvider.notifier).requestPrompt();
    expect(container.read(pushRelayConsentPromptProvider), isFalse);
  });
}

class _ActiveGuildFrameRecorder extends ConsumerWidget {
  const _ActiveGuildFrameRecorder(this.frames);

  final List<(String?, String?)> frames;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    frames.add((
      ref.watch(activeGuildIdProvider),
      ref.watch(channelListViewModelProvider.select((s) => s.guild?.id)),
    ));
    return const SizedBox.shrink();
  }
}

class _InvalidateRouteStateAfterBuild extends ConsumerWidget {
  const _InvalidateRouteStateAfterBuild(this.source);

  final _RouteStateSource source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!source.didInvalidateDuringBuild) {
      source
        ..didInvalidateDuringBuild = true
        ..location = '/channels/guild-1/channel-1';
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.invalidate(routeStateProvider);
      });
    }
    ref.watch(activeGuildIdProvider);
    return const SizedBox.shrink();
  }
}

class _RouteStateSource {
  _RouteStateSource({this.location = '/channels/@me'});

  String location;
  bool didInvalidateDuringBuild = false;

  RouteState get state => RouteState(
    location: location,
    activeBranchLocation: location,
    activeBranchIndex: 0,
    kind: classifyRoute(location),
    guildId: extractGuildId(location),
    channelId: extractChannelId(location),
  );
}

class _TestRouteStateNotifier extends RouteStateNotifier {
  _TestRouteStateNotifier(this.source);

  final _RouteStateSource source;

  @override
  RouteState build() => source.state;
}

class _RecordingChannelRepository implements ChannelRepository {
  final List<String> watchedGuildIds = <String>[];

  @override
  Stream<List<Channel>> watchChannels(String guildId) {
    watchedGuildIds.add(guildId);
    return const Stream<List<Channel>>.empty();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
