import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/material_ui.dart' hide SensitiveContent;
import 'package:go_router/go_router.dart';

import '../../../helpers/test_l10n.dart';

class _AdultSensitive extends SensitiveContent {
  @override
  SensitiveContentState build() => const SensitiveContentState();
}

class _LoadedAgreements extends MatureContentAgreements {
  @override
  MatureContentAgreementsState build() =>
      const MatureContentAgreementsState(isLoaded: true);

  @override
  Future<void> ensureLoaded() async {}
}

void main() {
  const String guildId = '111111111111111111';
  const String channelId = '222222222222222222';
  const Channel linkChannel = Channel(
    id: channelId,
    guildId: guildId,
    name: 'test-nsfw-link',
    type: ChannelType.guildLink,
    url: 'https://example.com',
    nsfw: true,
  );

  testWidgets('cancelling the mature gate of a link channel stays put', (
    WidgetTester tester,
  ) async {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (_, _) => Consumer(
            builder: (BuildContext context, WidgetRef ref, _) => TextButton(
              onPressed: () => openGuildChannelContent(
                context: context,
                ref: ref,
                guildId: guildId,
                channel: linkChannel,
                chatPath: '/channels/$guildId/$channelId',
              ),
              child: const Text('open'),
            ),
          ),
        ),
        GoRoute(
          path: '/channels/:guildId/:channelId',
          builder: (_, _) => const Text('channel page'),
        ),
      ],
    );
    addTearDown(router.dispose);

    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fluxerRouterProvider.overrideWithValue(router),
          channelListViewModelProvider.overrideWithValue(
            const ChannelListState(
              guild: null,
              selectedChannelId: null,
              categories: [],
            ),
          ),
          sensitiveContentProvider.overrideWith(_AdultSensitive.new),
          matureContentAgreementsProvider.overrideWith(_LoadedAgreements.new),
          matureContentGateReasonProvider(channelId).overrideWith(
            (Ref ref) => Future<MatureContentGateReason>.value(
              MatureContentGateReason.consentRequired,
            ),
          ),
          matureGateContextProvider(channelId).overrideWith(
            (Ref ref) => const ResolvedMatureGateContext(
              channelId: channelId,
              categoryId: null,
              guildId: guildId,
              effectiveMatureContent: true,
              effectiveWarningLevel: contentWarningLevelInherit,
              effectiveWarningText: null,
              scope: MatureContentAgreementScope.channel,
              scopeId: channelId,
            ),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, '/');
    expect(find.text('channel page'), findsNothing);
  });
}
