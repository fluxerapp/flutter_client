import 'package:fluxer_app/features/voice/utils/connection/e2ee_runtime_sync.dart';
import 'package:fluxer_app/features/voice/utils/e2ee/e2ee_status.dart';
import 'package:test/test.dart';

void main() {
  test('enables encryption for an encrypted channel with a key', () {
    expect(
      desiredRuntimeE2eeEnabled(
        status: ChannelE2eeStatus.encrypted,
        hasE2eeKey: true,
        guildHasVoiceE2ee: true,
      ),
      isTrue,
    );
  });

  test('leaves encryption alone without a key', () {
    expect(
      desiredRuntimeE2eeEnabled(
        status: ChannelE2eeStatus.encrypted,
        hasE2eeKey: false,
        guildHasVoiceE2ee: true,
      ),
      isNull,
    );
  });

  test('keeps a guild E2EE session on in a mixed channel', () {
    expect(
      desiredRuntimeE2eeEnabled(
        status: ChannelE2eeStatus.broken,
        hasE2eeKey: true,
        guildHasVoiceE2ee: true,
      ),
      isNull,
    );
  });

  test('falls back to plaintext in a mixed channel otherwise', () {
    expect(
      desiredRuntimeE2eeEnabled(
        status: ChannelE2eeStatus.broken,
        hasE2eeKey: true,
        guildHasVoiceE2ee: false,
      ),
      isFalse,
    );
  });

  test('does nothing for a channel without E2EE', () {
    expect(
      desiredRuntimeE2eeEnabled(
        status: ChannelE2eeStatus.none,
        hasE2eeKey: true,
        guildHasVoiceE2ee: true,
      ),
      isNull,
    );
  });
}
