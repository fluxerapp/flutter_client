import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';

void main() {
  group('ChannelChatContent mobile target sync', () {
    testWidgets(
      'defers switchChannel when targetMessageId is set but chat is not visible',
      (WidgetTester tester) async {
        final recorder = _RecordingChatViewModel();
        final container = ProviderContainer(
          overrides: _commonOverrides(
            recorder: recorder,
            revealSide: RevealSide.left,
          ),
        );
        addTearDown(container.dispose);

        await tester.pumpWidget(
          _buildTestApp(
            container: container,
            child: const ChannelChatContent(
              channelId: 'target-channel',
              targetMessageId: 'target-message',
            ),
          ),
        );
        await tester.pump();
        await tester.pump();

        final badCalls = recorder.switchChannelCalls
            .where((call) => !call.loadMessages)
            .toList();
        expect(badCalls, isEmpty);

        await tester.pumpAndSettle();
      },
    );

    testWidgets('runs switchChannel with target when chat is visible', (
      WidgetTester tester,
    ) async {
      final recorder = _RecordingChatViewModel();
      final container = ProviderContainer(
        overrides: _commonOverrides(
          recorder: recorder,
          revealSide: RevealSide.main,
        ),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _buildTestApp(
          container: container,
          child: const ChannelChatContent(
            channelId: 'target-channel',
            targetMessageId: 'target-message',
          ),
        ),
      );
      await tester.pump();
      await tester.pump();

      final goodCalls = recorder.switchChannelCalls
          .where(
            (call) =>
                call.channelId == 'target-channel' &&
                call.targetMessageId == 'target-message' &&
                call.loadMessages,
          )
          .toList();
      expect(goodCalls, isNotEmpty);
      final badCalls = recorder.switchChannelCalls
          .where((call) => !call.loadMessages)
          .toList();
      expect(badCalls, isEmpty);

      await tester.pumpAndSettle();
    });
  });
}

List<Override> _commonOverrides({
  required _RecordingChatViewModel recorder,
  required RevealSide revealSide,
}) {
  return [
    activeChannelIdProvider.overrideWithValue('target-channel'),
    shellHasPopupOverlayProvider.overrideWithValue(false),
    currentRevealSideProvider.overrideWithValue(revealSide),
    chatViewModelProvider.overrideWith(() => recorder),
    fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
    wellKnownProvider.overrideWith(_FakeWellKnown.new),
  ];
}

class _FakeWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() async {
    return const WellKnownFluxerResponse(
      apiCodeVersion: 1,
      endpoints: WellKnownFluxerResponseEndpoints(
        api: '',
        apiClient: '',
        apiPublic: '',
        gateway: '',
        media: '',
        staticCdn: '',
        marketing: '',
        admin: '',
        invite: '',
        gift: '',
        webapp: '',
      ),
      captcha: WellKnownFluxerResponseCaptcha(
        provider: 'none',
        hcaptchaSiteKey: null,
        turnstileSiteKey: null,
      ),
      features: WellKnownFluxerResponseFeatures(
        voiceEnabled: false,
        stripeEnabled: false,
        selfHosted: false,
        presignedAttachmentUploads: false,
        emailsEnabled: false,
      ),
      gif: WellKnownFluxerResponseGif(
        provider: '',
        displayName: '',
        attributionRequired: false,
      ),
      sso: WellKnownFluxerResponseSso(
        enabled: false,
        enforced: false,
        displayName: null,
        redirectUri: '',
      ),
      registration: WellKnownFluxerResponseRegistration(
        mode: WellKnownFluxerResponseRegistrationModeMode.open,
        adminRegistrationUrlsEnabled: false,
      ),
      community: WellKnownFluxerResponseCommunity(
        singleCommunity: false,
        singleCommunityGuildId: null,
        directMessagesDisabled: false,
      ),
      services: WellKnownFluxerResponseServices(
        gifEnabled: false,
        youtubeEnabled: false,
        blueskyEnabled: false,
      ),
      limits: WellKnownFluxerResponseLimits(
        version: WellKnownFluxerResponseLimitsVersionVersion.value2,
        traitDefinitions: <String>[],
        rules: <WellKnownFluxerResponseLimitsRules>[],
        defaultsHash: '',
      ),
      push: WellKnownFluxerResponsePush(publicVapidKey: null),
      appPublic: WellKnownFluxerResponseAppPublic(
        branding: WellKnownFluxerResponseAppPublicBranding(
          productName: '',
          iconUrl: null,
          symbolUrl: null,
          logoUrl: null,
          wordmarkUrl: null,
          faviconUrl: null,
          themeColor: null,
        ),
        setup: WellKnownFluxerResponseAppPublicSetup(
          configured: true,
          adminUrl: null,
        ),
        legal: WellKnownFluxerResponseAppPublicLegal(
          termsUrl: null,
          privacyUrl: null,
        ),
        registration: WellKnownFluxerResponseAppPublicRegistration(
          collectDateOfBirth: false,
        ),
      ),
    );
  }
}

Widget _buildTestApp({
  required ProviderContainer container,
  required Widget child,
}) {
  final colorTheme = buildDarkColorTheme();
  final textTheme = FluxerTextTheme.fromColors(colorTheme);
  final layoutTheme = FluxerLayoutTheme.scaled();

  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: textTheme,
        layoutTheme: layoutTheme,
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: MediaQuery(
        data: const MediaQueryData(size: Size(400, 800)),
        child: Scaffold(body: child),
      ),
    ),
  );
}

class _SwitchChannelCall {
  _SwitchChannelCall({
    required this.channelId,
    required this.targetMessageId,
    required this.loadMessages,
  });

  final String channelId;
  final String? targetMessageId;
  final bool loadMessages;
}

class _RecordingChatViewModel extends ChatViewModel {
  final List<_SwitchChannelCall> switchChannelCalls = [];

  @override
  ChatViewState build() {
    ref.read(chatReadViewportProvider.notifier).setActiveChannel('');
    return const ChatViewState(
      channelId: '',
      messages: [],
      replyingTo: null,
      replyMentioning: false,
      editingMessage: null,
      messageText: '',
      scrollToBottomSignal: 0,
      isLoading: false,
      isSyncingMessages: false,
      isLoadingMore: false,
      isLoadingNewer: false,
      hasMoreMessages: false,
      hasMoreNewerMessages: false,
      errorMessage: null,
    );
  }

  @override
  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {
    switchChannelCalls.add(
      _SwitchChannelCall(
        channelId: channelId,
        targetMessageId: targetMessageId,
        loadMessages: loadMessages,
      ),
    );
  }

  @override
  void clearStickyUnreadAfterBuildForCurrentChannel() {}
}
