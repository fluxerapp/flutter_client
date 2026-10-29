List<List<T>> chunkExpressionUploadBatch<T>(
  List<T> items, {
  int batchSize = 50,
}) {
  if (items.isEmpty || batchSize <= 0) {
    return <List<T>>[];
  }
  final List<List<T>> batches = <List<T>>[];
  for (int start = 0; start < items.length; start += batchSize) {
    final int end = (start + batchSize).clamp(0, items.length);
    batches.add(items.sublist(start, end));
  }
  return batches;
}
