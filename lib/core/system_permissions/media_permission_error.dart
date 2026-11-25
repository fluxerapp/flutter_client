const List<String> _kPermissionErrorFragments = <String>[
  'notallowederror',
  'permissiondenied',
  'permission denied',
  'permission_denied',
  'access denied',
  'access is denied',
  '0x80070005',
];

bool isMediaPermissionDeniedError(Object error) {
  final String message = error.toString().toLowerCase();
  return _kPermissionErrorFragments.any(message.contains);
}
