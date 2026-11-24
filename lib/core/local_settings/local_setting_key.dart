import 'package:fluxer_app/core/local_settings/local_setting_codec.dart';
import 'package:fluxer_app/core/local_settings/local_setting_id.dart';

LocalSettingId deviceSettingId(DeviceSettingKey<Object?> key) =>
    (scope: kDeviceLocalSettingScope, key: key.name);

LocalSettingId accountSettingId(
  AccountSettingKey<Object?> key,
  String userId,
) => (scope: accountLocalSettingScope(userId), key: key.name);

sealed class LocalSettingKey<T> {
  const LocalSettingKey(
    this.name, {
    required this.defaultValue,
    required this.codec,
  });

  final String name;
  final T defaultValue;
  final LocalSettingCodec<T> codec;
}

class DeviceSettingKey<T> extends LocalSettingKey<T> {
  const DeviceSettingKey(
    super.name, {
    required super.defaultValue,
    required super.codec,
  });
}

class AccountSettingKey<T> extends LocalSettingKey<T> {
  const AccountSettingKey(
    super.name, {
    required super.defaultValue,
    required super.codec,
  });
}

class DeviceFlag extends DeviceSettingKey<bool> {
  const DeviceFlag(super.name, {super.defaultValue = false})
    : super(codec: const BoolSettingCodec());
}

class AccountFlag extends AccountSettingKey<bool> {
  const AccountFlag(super.name, {super.defaultValue = false})
    : super(codec: const BoolSettingCodec());
}
