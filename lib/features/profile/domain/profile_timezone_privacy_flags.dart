/// Who can see profile local time.
abstract final class ProfileTimezonePrivacyFlags {
  static const int everyone = 1 << 0;
  static const int friends = 1 << 1;
  static const int mutualGuilds = 1 << 2;

  static const int defaultFlags = everyone;
}

bool hasProfileTimezonePrivacyFlag(int flags, int flag) =>
    (flags & flag) == flag;
