import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_upload_utils.dart';

void main() {
  test('chunkExpressionUploadBatch splits requests into batches of 50', () {
    final List<int> items = List<int>.generate(125, (int index) => index);
    final List<List<int>> batches = chunkExpressionUploadBatch(items);
    expect(batches, hasLength(3));
    expect(batches[0], hasLength(50));
    expect(batches[1], hasLength(50));
    expect(batches[2], hasLength(25));
    expect(batches.expand((List<int> batch) => batch).toList(), items);
  });

  test('chunkExpressionUploadBatch returns empty list for empty input', () {
    expect(chunkExpressionUploadBatch(<int>[]), isEmpty);
  });
}
