String? extractFcmCiphertext(Map<String, dynamic> data) {
  final Object? value = data['p'];
  if (value is! String || value.isEmpty) {
    return null;
  }
  return value;
}
