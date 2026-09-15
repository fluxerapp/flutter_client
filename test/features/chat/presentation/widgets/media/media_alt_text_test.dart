import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/media_alt_text.dart';

void main() {
  test('resolvedMediaAltText ignores blank descriptions', () {
    expect(resolvedMediaAltText(null), isNull);
    expect(resolvedMediaAltText(''), isNull);
    expect(resolvedMediaAltText('   '), isNull);
    expect(resolvedMediaAltText(' A waving cat '), 'A waving cat');
  });
}
