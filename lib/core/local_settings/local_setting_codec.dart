typedef LocalSettingJson = Map<String, Object?>;

abstract class LocalSettingCodec<T> {
  const LocalSettingCodec();

  Object? encode(T value);

  T? decode(Object? json);
}

class BoolSettingCodec extends LocalSettingCodec<bool> {
  const BoolSettingCodec();

  @override
  Object? encode(bool value) => value;

  @override
  bool? decode(Object? json) => json is bool ? json : null;
}

class IntSettingCodec extends LocalSettingCodec<int> {
  const IntSettingCodec();

  @override
  Object? encode(int value) => value;

  @override
  int? decode(Object? json) => json is num ? json.round() : null;
}

class NullableDoubleSettingCodec extends LocalSettingCodec<double?> {
  const NullableDoubleSettingCodec();

  @override
  Object? encode(double? value) => value;

  @override
  double? decode(Object? json) => json is num ? json.toDouble() : null;
}

class NullableStringSettingCodec extends LocalSettingCodec<String?> {
  const NullableStringSettingCodec();

  @override
  Object? encode(String? value) => value;

  @override
  String? decode(Object? json) => json is String ? json : null;
}

class StringListSettingCodec extends LocalSettingCodec<List<String>> {
  const StringListSettingCodec();

  @override
  Object? encode(List<String> value) => value;

  @override
  List<String>? decode(Object? json) =>
      json is List ? json.whereType<String>().toList(growable: false) : null;
}

class JsonSettingCodec extends LocalSettingCodec<LocalSettingJson> {
  const JsonSettingCodec();

  @override
  Object? encode(LocalSettingJson value) => value;

  @override
  LocalSettingJson? decode(Object? json) =>
      json is Map<String, Object?> ? json : null;
}
