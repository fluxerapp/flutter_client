import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show Member, User;
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/friends/data/friend_repository.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/members/domain/member.dart' show MemberRole;
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/profile_tab_menu_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/status_change_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_loading_skeleton.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_view.dart';
import 'package:fluxer_app/features/profile/providers/user_note_view_model.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_profile_guild_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/instance_runtime_config_override.dart';
import '../../../../helpers/test_l10n.dart';

const String _kUserId = '1';
const String _kOtherUserId = '2';
const String _kGuildId = '10';

class _FakeUserSettings extends UserSettingsViewModel {
  _FakeUserSettings({
    this.premiumType,
    this.premiumSince,
    this.premiumBadgeTimestampHidden = false,
  });

  final int? premiumType;
  final String? premiumSince;
  final bool premiumBadgeTimestampHidden;

  @override
  UserSettingsViewState build() => UserSettingsViewState(
    userId: _kUserId,
    username: 'tester',
    displayName: 'Tester',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: const <String>[],
    premiumType: premiumType,
    premiumSince: premiumSince,
    premiumBadgeTimestampHidden: premiumBadgeTimestampHidden,
  );
}

class _FakeCurrentUserFullProfile extends CurrentUserFullProfile {
  @override
  UserProfileFullResponse? build() => null;
}

class _FakeAccountManager extends AccountManager {
  @override
  AccountManagerState build() =>
      const AccountManagerState(accounts: [], isSwitching: false);

  @override
  Future<void> loadAccounts() async {}
}

class _FakeUserNoteViewModel extends UserNoteViewModel {
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

User _onlineUser() {
  return const User(
    id: _kUserId,
    username: 'tester',
    discriminator: '0001',
    bot: false,
    system: false,
    status: 'online',
    mobile: false,
  );
}

CurrentUserCachedProfile _cachedProfile() {
  return const CurrentUserCachedProfile(
    id: _kUserId,
    username: 'tester',
    discriminator: '0001',
    globalName: 'Tester',
    avatar: null,
    avatarColor: null,
    bio: null,
    pronouns: null,
    accentColor: null,
    banner: null,
    publicFlags: 0,
  );
}

List<Override> _overrides({UserSettingsViewModel Function()? settings}) {
  return <Override>[
    instanceRuntimeConfigOverride(),
    userSettingsViewModelProvider.overrideWith(
      settings ?? _FakeUserSettings.new,
    ),
    accountManagerProvider.overrideWith(_FakeAccountManager.new),
    friendRepositoryProvider.overrideWithValue(_FakeFriendRepository()),
    userPresenceProvider(
      _kUserId,
    ).overrideWith((Ref ref) => Stream<User?>.value(_onlineUser())),
    userNoteViewModelProvider(
      userId: _kUserId,
    ).overrideWith(_FakeUserNoteViewModel.new),
    currentUserCachedProfileProvider.overrideWithValue(_cachedProfile()),
    currentUserFullProfileProvider.overrideWith(
      _FakeCurrentUserFullProfile.new,
    ),
  ];
}

Widget _buildApp(
  ScrollController scrollController, {
  UserSettingsViewModel Function()? settings,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: _overrides(settings: settings),
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: FluxerToastOverlay(
        child: Scaffold(
          body: UserProfileView(
            userId: _kUserId,
            autoFocusNote: false,
            scrollController: scrollController,
            useCurrentUserCache: true,
          ),
        ),
      ),
    ),
  );
}

User _cachedOtherUser() {
  return const User(
    id: _kOtherUserId,
    username: 'ptnick',
    discriminator: '0002',
    globalName: 'PT Nick',
    bot: false,
    system: false,
    status: 'online',
    mobile: false,
  );
}

UserProfileFullResponse _fetchedOtherProfile() {
  return const UserProfileFullResponse(
    user: UserPartialResponse(
      id: _kOtherUserId,
      username: 'ptnick',
      discriminator: '0002',
      globalName: 'PT Nick Fetched',
      avatar: null,
      avatarColor: null,
      flags: 0,
    ),
    userProfile: UserProfileFullResponseUserProfile(
      bio: null,
      pronouns: null,
      banner: null,
      accentColor: null,
    ),
    timezoneOffset: null,
  );
}

List<Override> _otherUserOverrides(
  Future<UserProfileFullResponse?> profile,
  String? guildId,
) {
  return <Override>[
    ..._overrides(),
    userPresenceProvider(
      _kOtherUserId,
    ).overrideWith((Ref ref) => Stream<User?>.value(_cachedOtherUser())),
    userNoteViewModelProvider(
      userId: _kOtherUserId,
    ).overrideWith(_FakeUserNoteViewModel.new),
    userProfileProvider(
      userId: _kOtherUserId,
      guildId: guildId,
    ).overrideWith((Ref ref) => profile),
    memberRowByGuildProvider((_kOtherUserId, _kGuildId)).overrideWith(
      (Ref ref) => Stream<Member?>.value(
        Member(
          userId: _kOtherUserId,
          guildId: _kGuildId,
          nick: 'Guild Nick',
          roleIdsJson: '[]',
          joinedAt: DateTime.utc(2026),
        ),
      ),
    ),
    userProfileGuildInfoProvider(_kGuildId).overrideWith((Ref ref) => null),
    userProfileGuildRolesProvider(
      _kGuildId,
    ).overrideWith((Ref ref) => const <MemberRole>[]),
    currentUserMemberIdentityProvider(
      _kGuildId,
    ).overrideWith((Ref ref) => Stream<CurrentUserMemberIdentity?>.value(null)),
  ];
}

Widget _buildOtherUserApp(
  ScrollController scrollController,
  Future<UserProfileFullResponse?> profile, {
  String? guildId,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: _otherUserOverrides(profile, guildId),
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: FluxerToastOverlay(
        child: Scaffold(
          body: UserProfileView(
            userId: _kOtherUserId,
            guildId: guildId,
            autoFocusNote: false,
            scrollController: scrollController,
          ),
        ),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    FluxerHaptics.enabled = false;
  });

  tearDown(() {
    FluxerHaptics.enabled = true;
  });

  testWidgets('profile tab avatar tap opens the status sheet', (tester) async {
    final ScrollController scrollController = ScrollController();
    addTearDown(scrollController.dispose);
    tester.view.physicalSize = const Size(1400, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(_buildApp(scrollController));
    await tester.pumpAndSettle();

    expect(find.byType(StatusChangeSheetBody), findsNothing);
    await tester.tap(find.byType(FluxerAvatar));
    await tester.pumpAndSettle();

    expect(find.byType(StatusChangeSheetBody), findsOneWidget);
    expect(find.byType(ProfileTabMenuSheetBody), findsNothing);
  });

  testWidgets('phone profile menu offers status and account switching', (
    tester,
  ) async {
    final ScrollController scrollController = ScrollController();
    addTearDown(scrollController.dispose);
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(_buildApp(scrollController));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tester').first);
    await tester.pumpAndSettle();

    expect(find.byType(ProfileTabMenuSheetBody), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(ProfileTabMenuSheetBody),
        matching: find.text(testL10n.statusOnline),
      ),
      findsOneWidget,
    );

    await tester.tap(
      find.descendant(
        of: find.byType(ProfileTabMenuSheetBody),
        matching: find.text(testL10n.statusOnline),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(StatusChangeSheetBody), findsOneWidget);
  });

  testWidgets('profile avatar is 80pt inside a 3.2pt sheet-coloured ring', (
    tester,
  ) async {
    final ScrollController scrollController = ScrollController();
    addTearDown(scrollController.dispose);
    tester.view.physicalSize = const Size(1400, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(_buildApp(scrollController));
    await tester.pumpAndSettle();

    final FluxerAvatar avatar = tester.widget<FluxerAvatar>(
      find.byType(FluxerAvatar),
    );
    expect(avatar.size, 80);
    final Container ring = tester.widget<Container>(
      find
          .ancestor(
            of: find.byType(FluxerAvatar),
            matching: find.byType(Container),
          )
          .first,
    );
    expect(ring.padding, const EdgeInsets.all(3.2));
  });

  testWidgets('profile tab status tap opens the status sheet', (tester) async {
    final ScrollController scrollController = ScrollController();
    addTearDown(scrollController.dispose);
    tester.view.physicalSize = const Size(1400, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(_buildApp(scrollController));
    await tester.pumpAndSettle();

    expect(find.byType(StatusChangeSheetBody), findsNothing);
    await tester.tap(find.byType(FluxerStatusIndicator).first);
    await tester.pumpAndSettle();

    expect(find.byType(StatusChangeSheetBody), findsOneWidget);
    expect(find.byType(ProfileTabMenuSheetBody), findsNothing);
  });

  testWidgets(
    'You tab plutonium badge toast omits the date when purchase date is hidden',
    (tester) async {
      final ScrollController scrollController = ScrollController();
      addTearDown(scrollController.dispose);

      await tester.pumpWidget(
        _buildApp(
          scrollController,
          settings: () => _FakeUserSettings(
            premiumType: UserPremiumTypes.subscription.json,
            premiumSince: '2026-03-14',
            premiumBadgeTimestampHidden: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SvgPicture));
      await tester.pump();

      expect(find.text('Fluxer Plutonium'), findsOneWidget);
      expect(find.textContaining('subscriber since'), findsNothing);
    },
  );

  testWidgets(
    'You tab Visionary badge toast omits the date when purchase date is hidden',
    (tester) async {
      final ScrollController scrollController = ScrollController();
      addTearDown(scrollController.dispose);

      await tester.pumpWidget(
        _buildApp(
          scrollController,
          settings: () => _FakeUserSettings(
            premiumType: UserPremiumTypes.lifetime.json,
            premiumSince: '2026-03-14',
            premiumBadgeTimestampHidden: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SvgPicture));
      await tester.pump();

      expect(find.text('Fluxer Visionary'), findsOneWidget);
      expect(find.textContaining('Visionary since'), findsNothing);
    },
  );
  testWidgets('shows the cached user while the profile fetch is pending', (
    tester,
  ) async {
    final ScrollController scrollController = ScrollController();
    addTearDown(scrollController.dispose);
    final Completer<UserProfileFullResponse?> profile =
        Completer<UserProfileFullResponse?>();

    await tester.pumpWidget(
      _buildOtherUserApp(scrollController, profile.future),
    );
    await tester.pump();

    expect(find.byType(UserProfileLoadingSkeleton), findsNothing);
    expect(find.text('PT Nick'), findsWidgets);

    profile.complete(_fetchedOtherProfile());
    await tester.pump();

    expect(find.byType(UserProfileLoadingSkeleton), findsNothing);
    expect(find.text('PT Nick Fetched'), findsWidgets);
  });

  testWidgets(
    'shows the cached guild nickname while the profile fetch is pending',
    (tester) async {
      final ScrollController scrollController = ScrollController();
      addTearDown(scrollController.dispose);
      final Completer<UserProfileFullResponse?> profile =
          Completer<UserProfileFullResponse?>();

      await tester.pumpWidget(
        _buildOtherUserApp(
          scrollController,
          profile.future,
          guildId: _kGuildId,
        ),
      );
      await tester.pump();

      expect(find.byType(UserProfileLoadingSkeleton), findsNothing);
      expect(find.text('Guild Nick'), findsWidgets);
    },
  );
}
