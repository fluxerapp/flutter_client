import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/data/local_device_translation_source.dart';
import 'package:fluxer_app/features/chat/data/message_translation_service.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/message_translate_offer.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_translation_provider.g.dart';

@Riverpod(keepAlive: true)
MessageTranslationService messageTranslationService(Ref ref) {
  return MessageTranslationService(
    messageDao: ref.watch(fluxerDatabaseProvider).messageDao,
    sources: <LocalDeviceTranslationSource>[LocalDeviceTranslationSource()],
  );
}

@Riverpod(keepAlive: true)
Future<bool> messageTranslationAvailable(Ref ref) {
  return ref.watch(messageTranslationServiceProvider).isAvailable();
}

@riverpod
Future<String?> detectedMessageLanguage(Ref ref, String sample) {
  if (sample.trim().isEmpty) {
    return Future.value();
  }
  return ref.watch(messageTranslationServiceProvider).detectLanguage(sample);
}

@Riverpod(keepAlive: true)
class TranslatingMessageIds extends _$TranslatingMessageIds {
  @override
  Set<String> build() => <String>{};

  void add(String messageId) {
    state = <String>{...state, messageId};
  }

  void remove(String messageId) {
    if (!state.contains(messageId)) {
      return;
    }
    final Set<String> next = <String>{...state}..remove(messageId);
    state = next;
  }
}

bool watchCanOfferMessageTranslate(WidgetRef ref, Message message) {
  if (message.content.trim().isEmpty || message.hasValidTranslation) {
    return false;
  }
  if (!(ref.watch(messageTranslationAvailableProvider).value ?? false)) {
    return false;
  }
  if (ref.watch(
    translatingMessageIdsProvider.select(
      (Set<String> ids) => ids.contains(message.id),
    ),
  )) {
    return false;
  }
  final String appLanguage = ref.watch(effectiveAppLocaleProvider).languageCode;
  final TranslateOfferHint hint = translateOfferHint(
    message.content,
    appLanguage,
  );
  if (hint != TranslateOfferHint.detect) {
    return shouldOfferMessageTranslate(hint: hint, appLanguage: appLanguage);
  }
  final AsyncValue<String?> detected = ref.watch(
    detectedMessageLanguageProvider(languageDetectionSample(message.content)),
  );
  return shouldOfferMessageTranslate(
    hint: hint,
    appLanguage: appLanguage,
    detectedLanguage: detected.asData?.value,
    detectedLanguageReady: detected.hasValue,
  );
}
