import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';

void main() {
  test('account switch uses isolated family provider state', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    const String userA = 'user-a';
    const String userB = 'user-b';

    container.read(currentUserIdProvider.notifier).set(userA);
    container
        .read(typingIndicatorsProvider(userA).notifier)
        .addTyping('channel', 'user');
    container.read(inviteCacheProvider(userA).notifier).addInvite(
      <String, dynamic>{'code': 'abc'},
    );
    container.read(currentUserPremiumTypeProvider(userA).notifier).set(2);
    container
        .read(messageUploadSessionsProvider(userA).notifier)
        .createSession(
          nonce: 'nonce',
          channelId: 'channel',
          attachments: const [],
        );

    expect(container.read(typingIndicatorsProvider(userA)), isNotEmpty);
    expect(container.read(currentUserPremiumTypeProvider(userA)), 2);
    expect(container.read(messageUploadSessionsProvider(userA)), isNotEmpty);

    container.read(currentUserIdProvider.notifier).set(userB);

    expect(container.read(typingIndicatorsProvider(userB)), isEmpty);
    expect(container.read(currentUserPremiumTypeProvider(userB)), 0);
    expect(container.read(messageUploadSessionsProvider(userB)), isEmpty);

    expect(container.read(typingIndicatorsProvider(userA)), isNotEmpty);
    expect(container.read(currentUserPremiumTypeProvider(userA)), 2);
    expect(container.read(messageUploadSessionsProvider(userA)), isNotEmpty);
  });

  test('account-scoped providers tolerate missing user id at startup', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    expect(() => container.read(voiceSessionProvider), returnsNormally);
    expect(
      () => container.read(userSettingsViewModelProvider),
      returnsNormally,
    );
  });
}
