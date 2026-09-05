import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/message_translate_offer.dart';

void main() {
  group('translateOfferHint', () {
    test('shows immediately when scripts differ', () {
      expect(translateOfferHint('こんにちは', 'en'), TranslateOfferHint.show);
      expect(translateOfferHint('Привет', 'en'), TranslateOfferHint.show);
    });

    test('detects among latin or cjk of the same script', () {
      expect(translateOfferHint('hello', 'en'), TranslateOfferHint.detect);
      expect(translateOfferHint('bonjour', 'en'), TranslateOfferHint.detect);
      expect(translateOfferHint('你好', 'ja'), TranslateOfferHint.detect);
    });

    test('hides same non-latin script as the app language', () {
      expect(translateOfferHint('مرحبا', 'ar'), TranslateOfferHint.hide);
    });
  });

  group('translatableMessageText', () {
    test('drops custom emoji markup so only prose is judged', () {
      expect(translatableMessageText('<:pepe:123> <a:dance:456>'), isEmpty);
      expect(translatableMessageText('hello <:pepe:123>'), 'hello');
      expect(translatableMessageText('  привет  '), 'привет');
    });
  });

  group('shouldOfferMessageTranslate', () {
    test('hides until detection finishes for latin text', () {
      expect(
        shouldOfferMessageTranslate(
          hint: TranslateOfferHint.detect,
          appLanguage: 'en',
          detectedLanguageReady: false,
        ),
        isFalse,
      );
    });

    test('shows latin text once detection differs from the app language', () {
      expect(
        shouldOfferMessageTranslate(
          hint: TranslateOfferHint.detect,
          appLanguage: 'en',
          detectedLanguage: 'fr',
        ),
        isTrue,
      );
    });

    test('hides latin text that matches the app language', () {
      expect(
        shouldOfferMessageTranslate(
          hint: TranslateOfferHint.detect,
          appLanguage: 'en-US',
          detectedLanguage: 'en',
        ),
        isFalse,
      );
    });

    test('hides undetermined detections', () {
      expect(
        shouldOfferMessageTranslate(
          hint: TranslateOfferHint.detect,
          appLanguage: 'en',
          detectedLanguage: 'und',
        ),
        isFalse,
      );
    });
  });
}
