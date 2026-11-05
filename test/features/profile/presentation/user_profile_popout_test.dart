import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' show User;
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/friends/data/friend_repository.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_popout_frame.dart';
import 'package:fluxer_app/features/profile/providers/user_note_view_model.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/input_modality_override.dart';
import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/test_l10n.dart';

const String _kSelfId = '1';
const String _kUserId = '2';

class _FakeUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: _kSelfId,
    username: 'tester',
    displayName: 'Tester',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
  );
}

class _FakeNote extends UserNoteViewModel {
  @override
  Stream<String?> build({required String userId}) =>
      Stream<String?>.value(null);
}

class _FakeFriendRepository implements FriendRepository {
  @override
  Stream<List<Friend>> watchRelationships() =>
      Stream<List<Friend>>.value(const <Friend>[]);

  @override
  Future<List<Friend>> getRelationships() async => const <Friend>[];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const UserProfileFullResponse _profile = UserProfileFullResponse(
  user: UserPartialResponse(
    id: _kUserId,
    username: 'ptnick',
    discriminator: '0002',
    globalName: 'PT Nick',
    avatar: null,
    avatarColor: 0x4641D9,
    flags: 0,
  ),
  userProfile: UserProfileFullResponseUserProfile(
    bio: 'Building things on the internet.',
    pronouns: 'they/them',
    banner: null,
    accentColor: 0x4641D9,
  ),
  timezoneOffset: null,
);

Widget _app({required bool touch}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      inputModalityOverride(touch: touch),
      instanceRuntimeConfigOverride(),
      userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
      friendRepositoryProvider.overrideWithValue(_FakeFriendRepository()),
      userPresenceProvider(
        _kUserId,
      ).overrideWith((Ref ref) => Stream<User?>.value(null)),
      userNoteViewModelProvider(userId: _kUserId).overrideWith(_FakeNote.new),
      userProfileProvider(userId: _kUserId).overrideWith(
        (Ref ref) => Future<UserProfileFullResponse?>.value(_profile),
      ),
    ],
    child: RepaintBoundary(
      key: const ValueKey<String>('root'),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          body: Align(
            alignment: const Alignment(-0.7, -0.7),
            child: Builder(
              builder: (BuildContext context) => TextButton(
                onPressed: () => unawaited(
                  FluxerUserProfileSheet.show(context, userId: _kUserId),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

void _setSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

ModalRoute<dynamic> _routeOf(WidgetTester tester, Finder finder) =>
    ModalRoute.of(tester.element(finder.first))!;

void main() {
  testWidgets('a mouse opens a compact popout beside the clicked user', (
    tester,
  ) async {
    _setSize(tester, const Size(1000, 700));
    await tester.pumpWidget(_app(touch: false));
    final Rect button = tester.getRect(find.byType(TextButton));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    final Finder panel = find.byType(FluxerDesktopPopoutPanel);
    expect(panel, findsOneWidget);
    expect(tester.getSize(panel).width, kUserProfilePopoutWidth);
    expect(tester.getTopLeft(panel).dx, greaterThanOrEqualTo(button.right));
    expect(tester.getTopLeft(panel).dy, button.top);
    expect(find.text('PT Nick'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
    expect(find.byType(FluxerUserProfileSheet), findsNothing);
  });

  testWidgets('clicking the name opens the full profile modal', (tester) async {
    _setSize(tester, const Size(1000, 700));
    await tester.pumpWidget(_app(touch: false));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('PT Nick'));
    await tester.pumpAndSettle();

    expect(find.byType(FluxerDesktopPopoutPanel), findsNothing);
    final route =
        _routeOf(tester, find.text('PT Nick')) as FluxerDesktopRoute<dynamic>;
    expect(route.surface, FluxerDesktopSurface.modal);
  });

  testWidgets('clicking away closes the popout', (tester) async {
    _setSize(tester, const Size(1000, 700));
    await tester.pumpWidget(_app(touch: false));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tapAt(const Offset(990, 690));
    await tester.pumpAndSettle();

    expect(find.byType(FluxerDesktopPopoutPanel), findsNothing);
  });

  testWidgets('touch on a tablet keeps the profile bottom sheet', (
    tester,
  ) async {
    _setSize(tester, const Size(1366, 1024));
    await tester.pumpWidget(_app(touch: true));
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(
      _routeOf(tester, find.text('PT Nick')),
      isA<FluxerSheetRoute<dynamic>>(),
    );
  });
}
