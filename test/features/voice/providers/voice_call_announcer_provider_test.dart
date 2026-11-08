import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/providers/screen_reader_active_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_accessibility_layer.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_announcer_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';

import '../../../helpers/test_l10n.dart';

const VoiceSessionState _connected = VoiceSessionState(
  isConnected: true,
  channelId: 'voice-1',
  guildId: 'g1',
  activeConnectionId: 'conn-me',
);

class _ControlledVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();

  VoiceSessionState get current => state;

  set current(VoiceSessionState next) => state = next;
}

class _Roster extends Notifier<VoiceCallParticipantRoster> {
  @override
  VoiceCallParticipantRoster build() => const VoiceCallParticipantRoster();

  void emit(Map<String, String> names, {String key = 'g1|voice-1'}) {
    state = VoiceCallParticipantRoster(key: key, namesByUserId: names);
  }
}

final NotifierProvider<_Roster, VoiceCallParticipantRoster> _rosterProvider =
    NotifierProvider<_Roster, VoiceCallParticipantRoster>(_Roster.new);

class _OwnServerFlags extends Notifier<VoiceCallServerFlags?> {
  @override
  VoiceCallServerFlags? build() => null;

  VoiceCallServerFlags? get current => state;

  set current(VoiceCallServerFlags? next) => state = next;
}

final NotifierProvider<_OwnServerFlags, VoiceCallServerFlags?>
_ownFlagsProvider = NotifierProvider<_OwnServerFlags, VoiceCallServerFlags?>(
  _OwnServerFlags.new,
);

class _ScreenReader extends ScreenReaderActive {
  _ScreenReader({required this.initial});

  final bool initial;

  @override
  bool build() => initial;
}

class _Appearance extends AppearancePreferences {
  _Appearance({required this.announceJoins});

  final bool announceJoins;

  @override
  AppearancePreferencesState build() =>
      AppearancePreferencesState(announceCallJoinsAndLeaves: announceJoins);
}

class _Harness {
  _Harness(this.container);

  final ProviderContainer container;

  _ControlledVoiceSession get session =>
      container.read(voiceSessionProvider.notifier) as _ControlledVoiceSession;

  _Roster get roster => container.read(_rosterProvider.notifier);

  _OwnServerFlags get own => container.read(_ownFlagsProvider.notifier);
}

_Harness _harness({bool screenReader = true, bool announceJoins = true}) {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      voiceSessionProvider.overrideWith(_ControlledVoiceSession.new),
      voiceCallParticipantRosterProvider.overrideWith(
        (Ref ref) => ref.watch(_rosterProvider),
      ),
      voiceCallOwnServerFlagsProvider.overrideWith(
        (Ref ref) => ref.watch(_ownFlagsProvider),
      ),
      screenReaderActiveProvider.overrideWith(
        () => _ScreenReader(initial: screenReader),
      ),
      appearancePreferencesProvider.overrideWith(
        () => _Appearance(announceJoins: announceJoins),
      ),
      appLocalizationsProvider.overrideWithValue(testL10n),
    ],
  );
  _containers.add(container);
  container.listen(voiceCallAnnouncerProvider, (_, _) {});
  return _Harness(container);
}

final List<ProviderContainer> _containers = <ProviderContainer>[];

void _testAnnouncer(
  String description,
  Future<void> Function(WidgetTester tester) body,
) {
  testWidgets(description, (WidgetTester tester) async {
    await body(tester);
    for (final ProviderContainer container in _containers) {
      container.dispose();
    }
    _containers.clear();
    await tester.pump(kVoiceCallLiveRegionClearDelay);
  });
}

Future<void> _joinCall(WidgetTester tester, _Harness h) async {
  h.roster.emit(const <String, String>{'u1': 'Sam'});
  h.session.current = _connected;
  await tester.pump(kVoiceCallAnnouncementSettleDelay);
  tester.takeAnnouncements();
}

List<String> _messages(WidgetTester tester) => tester
    .takeAnnouncements()
    .map((CapturedAccessibilityAnnouncement a) => a.message)
    .toList();

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized()
        .platformDispatcher
        .accessibilityFeaturesTestValue = const FakeAccessibilityFeatures(
      supportsAnnounce: true,
    );
  });

  tearDown(() {
    TestWidgetsFlutterBinding.instance.platformDispatcher
        .clearAccessibilityFeaturesTestValue();
  });

  _testAnnouncer('announces connecting and a single join by name', (
    tester,
  ) async {
    final _Harness h = _harness();
    h.roster.emit(const <String, String>{'u1': 'Sam'});
    h.session.current = _connected;
    await tester.pump();
    expect(_messages(tester), <String>[testL10n.voiceAnnounceConnected]);
    await tester.pump(kVoiceCallAnnouncementSettleDelay);
    h.roster.emit(const <String, String>{'u1': 'Sam', 'u2': 'Alex'});
    await tester.pump(kVoiceCallAnnouncementBatchWindow);
    expect(_messages(tester), <String>[
      testL10n.voiceAnnounceUserJoined('Alex'),
    ]);
  });

  _testAnnouncer('batches several joins into a count', (tester) async {
    final _Harness h = _harness();
    await _joinCall(tester, h);
    h.roster.emit(const <String, String>{'u1': 'Sam', 'u2': 'Alex'});
    await tester.pump(const Duration(milliseconds: 200));
    h.roster.emit(const <String, String>{
      'u1': 'Sam',
      'u2': 'Alex',
      'u3': 'Kai',
    });
    await tester.pump(kVoiceCallAnnouncementBatchWindow);
    expect(_messages(tester), <String>[testL10n.voiceAnnounceUsersJoined(2)]);
  });

  _testAnnouncer('a join and leave inside one batch cancel out', (
    tester,
  ) async {
    final _Harness h = _harness();
    await _joinCall(tester, h);
    h.roster.emit(const <String, String>{'u1': 'Sam', 'u2': 'Alex'});
    await tester.pump(const Duration(milliseconds: 200));
    h.roster.emit(const <String, String>{'u1': 'Sam'});
    await tester.pump(kVoiceCallAnnouncementBatchWindow);
    expect(_messages(tester), isEmpty);
  });

  _testAnnouncer('announces a leave using the last known name', (tester) async {
    final _Harness h = _harness();
    await _joinCall(tester, h);
    h.roster.emit(const <String, String>{});
    await tester.pump(kVoiceCallAnnouncementBatchWindow);
    expect(_messages(tester), <String>[testL10n.voiceAnnounceUserLeft('Sam')]);
  });

  _testAnnouncer('stays quiet while the roster settles after a reconnect', (
    tester,
  ) async {
    final _Harness h = _harness();
    await _joinCall(tester, h);
    h.session.current = const VoiceSessionState(
      isConnected: true,
      isReconnecting: true,
      channelId: 'voice-1',
      guildId: 'g1',
      activeConnectionId: 'conn-me',
    );
    await tester.pump();
    expect(_messages(tester), <String>[testL10n.voiceAnnounceReconnecting]);
    h.session.current = _connected;
    await tester.pump();
    expect(_messages(tester), <String>[testL10n.voiceAnnounceReconnected]);
    h.roster.emit(const <String, String>{'u1': 'Sam', 'u2': 'Alex'});
    await tester.pump(kVoiceCallAnnouncementBatchWindow);
    expect(_messages(tester), isEmpty);
  });

  _testAnnouncer('the setting turns off join and leave but not connection', (
    tester,
  ) async {
    final _Harness h = _harness(announceJoins: false);
    h.roster.emit(const <String, String>{'u1': 'Sam'});
    h.session.current = _connected;
    await tester.pump();
    expect(_messages(tester), <String>[testL10n.voiceAnnounceConnected]);
    await tester.pump(kVoiceCallAnnouncementSettleDelay);
    h.roster.emit(const <String, String>{'u1': 'Sam', 'u2': 'Alex'});
    await tester.pump(kVoiceCallAnnouncementBatchWindow);
    expect(_messages(tester), isEmpty);
  });

  _testAnnouncer('says nothing without a screen reader', (tester) async {
    final _Harness h = _harness(screenReader: false);
    await _joinCall(tester, h);
    h.roster.emit(const <String, String>{'u1': 'Sam', 'u2': 'Alex'});
    h.session.current = const VoiceSessionState();
    await tester.pump(kVoiceCallAnnouncementBatchWindow);
    expect(_messages(tester), isEmpty);
  });

  _testAnnouncer('announces moderator mute and deafen changes', (tester) async {
    final _Harness h = _harness();
    await _joinCall(tester, h);
    h.own.current = (mute: false, deaf: false);
    await tester.pump(const Duration(milliseconds: 50));
    h.own.current = (mute: true, deaf: true);
    await tester.pump(const Duration(milliseconds: 50));
    expect(_messages(tester), <String>[
      testL10n.voiceAnnounceServerMuted,
      testL10n.voiceAnnounceServerDeafened,
    ]);
  });

  _testAnnouncer('announces disconnecting', (tester) async {
    final _Harness h = _harness();
    await _joinCall(tester, h);
    h.session.current = const VoiceSessionState();
    await tester.pump();
    expect(_messages(tester), <String>[testL10n.voiceAnnounceDisconnected]);
  });

  _testAnnouncer('falls back to a live region where announcements are not '
      'supported', (tester) async {
    tester.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures();
    final _Harness h = _harness();
    h.session.current = _connected;
    await tester.pump();
    expect(tester.takeAnnouncements(), isEmpty);
    expect(
      h.container.read(voiceCallAnnouncerProvider),
      testL10n.voiceAnnounceConnected,
    );
    await tester.pump(kVoiceCallLiveRegionClearDelay);
    expect(h.container.read(voiceCallAnnouncerProvider), isNull);
  });

  testWidgets('layer keeps one live region node and swaps its label', (
    tester,
  ) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    tester.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          voiceSessionProvider.overrideWith(_ControlledVoiceSession.new),
          voiceCallParticipantRosterProvider.overrideWith(
            (Ref ref) => const VoiceCallParticipantRoster(),
          ),
          voiceCallOwnServerFlagsProvider.overrideWith((Ref ref) => null),
          screenReaderActiveProvider.overrideWith(
            () => _ScreenReader(initial: true),
          ),
          appLocalizationsProvider.overrideWithValue(testL10n),
        ],
        child: const MediaQuery(
          data: MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: VoiceCallAccessibilityLayer(child: SizedBox.expand()),
          ),
        ),
      ),
    );
    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(VoiceCallAccessibilityLayer)),
    );
    container.read(voiceCallAnnouncerProvider.notifier).announce('Sam joined');
    await tester.pump();
    final SemanticsNode first = tester.getSemantics(
      find.bySemanticsLabel('Sam joined'),
    );
    expect(first.flagsCollection.isLiveRegion, isTrue);
    container.read(voiceCallAnnouncerProvider.notifier).announce('Sam left');
    await tester.pump();
    final SemanticsNode second = tester.getSemantics(
      find.bySemanticsLabel('Sam left'),
    );
    expect(second.id, first.id);
    expect(second.flagsCollection.isLiveRegion, isTrue);
    await tester.pump(kVoiceCallLiveRegionClearDelay);
    expect(find.bySemanticsLabel('Sam left'), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
    handle.dispose();
  });
}
