final RegExp _zeroDiscriminator = RegExp(r'^0+$');

bool shouldShowDiscriminator(
  String discriminator, {
  required bool uniqueUsernames,
  bool bot = false,
}) {
  if (!uniqueUsernames || bot) {
    return true;
  }
  return !_zeroDiscriminator.hasMatch(discriminator);
}

String formatUserTag(
  String username,
  String discriminator, {
  required bool uniqueUsernames,
  bool bot = false,
}) {
  return shouldShowDiscriminator(
        discriminator,
        uniqueUsernames: uniqueUsernames,
        bot: bot,
      )
      ? '$username#$discriminator'
      : username;
}
