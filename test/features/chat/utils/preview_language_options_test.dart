import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/preview_language_options.dart';

void main() {
  test('preview language options include alias secondary names', () {
    expect(previewLanguageCanonicalCode('js'), 'javascript');
    expect(previewLanguageCanonicalCode('py'), 'python');
    expect(previewLanguageCanonicalCode('yml'), 'yaml');
    expect(previewLanguageCanonicalCode('plaintext'), 'text');
    expect(previewLanguageCanonicalCode('javascript'), 'javascript');

    final List<PreviewLanguageOption> options = buildPreviewLanguageOptions();
    final PreviewLanguageOption js = options.firstWhere(
      (PreviewLanguageOption option) => option.code == 'js',
    );
    expect(js.canonicalCode, 'javascript');
    expect(js.hasSecondaryName, isTrue);

    final PreviewLanguageOption javascript = options.firstWhere(
      (PreviewLanguageOption option) => option.code == 'javascript',
    );
    expect(javascript.hasSecondaryName, isFalse);
  });
}
