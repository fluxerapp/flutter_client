import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/invite_accept_modal.dart';
import 'package:fluxer_app/features/guilds/providers/invite_accept_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';

import '../../../../helpers/fake_well_known.dart';
import '../../../../helpers/instance_runtime_config_override.dart';
import '../../../../helpers/test_l10n.dart';

const String _code = 'bioinvite';
const String _groupChannelId = '1000000000000000005';

final InviteResponseSchema _groupInvite = InviteResponseSchema.fromJson(
  <String, dynamic>{
    'code': _code,
    'temporary': false,
    'type': 1,
    'channel': <String, dynamic>{
      'id': _groupChannelId,
      'type': 3,
      'name': 'Sim group',
    },
    'member_count': 2,
  },
);

class _FakeInvitesApi implements InvitesApi {
  final List<String> accepted = <String>[];

  @override
  Future<InviteResponseSchema> getInvite({required String inviteCode}) async =>
      _groupInvite;

  @override
  Future<InviteResponseSchema> acceptInvite({
    required String inviteCode,
  }) async {
    accepted.add(inviteCode);
    return _groupInvite;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._invites) : super(Dio());

  final InvitesApi _invites;

  @override
  InvitesApi get invites => _invites;
}

void main() {
  late GoRouter router;

  setUp(() {
    router = GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const SizedBox.shrink(),
        ),
        GoRoute(
          path: '/channels/@me/:channelId',
          builder: (BuildContext context, GoRouterState state) =>
              const SizedBox.shrink(),
        ),
      ],
    );
    addTearDown(router.dispose);
  });

  testWidgets('joining from an invite in a profile closes the profile', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final _FakeInvitesApi invites = _FakeInvitesApi();
    final ProviderContainer container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerRouterProvider.overrideWithValue(router),
        wellKnownProvider.overrideWith(FakeWellKnown.new),
        fluxerClientProvider.overrideWithValue(_FakeClient(invites)),
        inviteAcceptProvider(_code).overrideWith(
          (ref) => Future<InviteAcceptState>.value(
            InviteAcceptGroupDm(_groupInvite.toGroupDmInviteResponse()),
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    late BuildContext branch;
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          navigatorKey: rootNavigatorKey,
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Navigator(
            key: homeBranchNavigatorKey,
            onGenerateRoute: (RouteSettings settings) =>
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    branch = context;
                    return const Scaffold(body: Text('chat'));
                  },
                ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    unawaited(
      FluxerBottomSheet.show<void>(
        branch,
        builder: (BuildContext sheetContext, VoidCallback close) => TextButton(
          onPressed: () =>
              unawaited(showInviteAcceptModal(sheetContext, code: _code)),
          child: const Text('profile bio invite'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('profile bio invite'));
    await tester.pumpAndSettle();

    await tester.tap(find.text(testL10n.inviteAcceptJoinGroupButton));
    await tester.pumpAndSettle();

    expect(invites.accepted, <String>[_code]);
    expect(
      router.routeInformationProvider.value.uri.path,
      '/channels/@me/$_groupChannelId',
    );
    expect(
      find.text(testL10n.inviteAcceptJoinGroupButton, skipOffstage: false),
      findsNothing,
    );
    expect(
      find.text('profile bio invite', skipOffstage: false),
      findsNothing,
      reason: 'the profile must not stay open over the joined community',
    );
    expect(find.text('chat'), findsOneWidget);
  });
}
