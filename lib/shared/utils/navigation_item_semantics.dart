import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String navigationItemSemanticLabel({
  required FluxerLocalizations l10n,
  required String name,
  bool isSelected = false,
  bool hasUnread = false,
  int mentionCount = 0,
  bool isMuted = false,
}) {
  final StringBuffer label = StringBuffer(name);
  if (isSelected) {
    label.write(', ${l10n.guildNavbarGuildSelected}');
  }
  if (mentionCount > 0) {
    label.write(', ${l10n.guildNavbarGuildMentions(mentionCount)}');
  } else if (hasUnread) {
    label.write(', ${l10n.guildNavbarGuildUnread}');
  }
  if (isMuted) {
    label.write(', ${l10n.navigationItemMuted}');
  }
  return label.toString();
}
