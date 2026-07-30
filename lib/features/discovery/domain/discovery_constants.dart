abstract final class DiscoveryConstants {
  static const int descriptionMinLength = 10;
  static const int descriptionMaxLength = 300;
  static const int tagMinLength = 2;
  static const int tagMaxLength = 30;
  static const int maxTags = 10;
  static const String defaultLanguage = 'en-US';
}

abstract final class DiscoveryApplicationStatus {
  static const String pending = 'pending';
  static const String approved = 'approved';
  static const String rejected = 'rejected';
  static const String removed = 'removed';
}
