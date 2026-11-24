typedef LocalSettingId = ({String scope, String key});

const String kDeviceLocalSettingScope = 'device';

String accountLocalSettingScope(String userId) => 'account:$userId';
