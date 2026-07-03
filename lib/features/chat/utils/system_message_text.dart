import 'package:flutter/material.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

const String kSystemMessageUsernamePlaceholder = '{username}';
const String kSystemMessageMessageLinkPlaceholder = '{messageLink}';
const String kSystemMessageAllPinsLinkPlaceholder = '{allPinsLink}';

typedef GuildJoinMessageBuilder = String Function(String username);

List<GuildJoinMessageBuilder> guildJoinMessageBuilders(
  FluxerLocalizations l10n,
) => <GuildJoinMessageBuilder>[
  l10n.systemJoinGladYoureHere,
  l10n.systemJoinWelcomeMakeYourselfAtHome,
  l10n.systemJoinHelloNiceToHaveYouHere,
  l10n.systemJoinHelloJumpInWheneverYoureReady,
  l10n.systemJoinHeyGreatToSeeYouHere,
  l10n.systemJoinHeyThereHopeYouEnjoyYourStay,
  l10n.systemJoinHeyWelcomeAboard,
  l10n.systemJoinGladYouMadeIt,
  l10n.systemJoinWelcomeIn,
  l10n.systemJoinWelcome,
  l10n.systemJoinWelcomeWereGladYoureHere,
  l10n.systemJoinWelcomeHopeYouEnjoyYourTimeHere,
  l10n.systemJoinWelcomeYourNextConversationStartsHere,
  l10n.systemJoinWelcomeWereHappyToHaveYouHere,
  l10n.systemJoinGreatToSeeYouWelcomeIn,
  l10n.systemJoinYoureHereGoodToHaveYouWithUs,
  l10n.systemJoinYouveArrivedLetsGetStarted,
];

int guildJoinMessageIndex({
  required String messageId,
  required int messageCount,
}) {
  if (messageCount <= 0) {
    return 0;
  }
  final int? parsed = int.tryParse(messageId);
  if (parsed == null) {
    return 0;
  }
  final int timestampMs = (parsed >> 22) + kSnowflakeEpochMs;
  return timestampMs % messageCount;
}

String resolveGuildJoinMessageTemplate(
  FluxerLocalizations l10n, {
  required String messageId,
}) {
  final builders = guildJoinMessageBuilders(l10n);
  final index = guildJoinMessageIndex(
    messageId: messageId,
    messageCount: builders.length,
  );
  return builders[index](kSystemMessageUsernamePlaceholder);
}

String resolvePinMessageTemplate(FluxerLocalizations l10n) {
  return l10n.systemPinMessage(
    kSystemMessageUsernamePlaceholder,
    kSystemMessageMessageLinkPlaceholder,
    kSystemMessageAllPinsLinkPlaceholder,
  );
}

String resolveGuildJoinMessage(
  FluxerLocalizations l10n, {
  required String messageId,
  required String username,
}) {
  final builders = guildJoinMessageBuilders(l10n);
  final index = guildJoinMessageIndex(
    messageId: messageId,
    messageCount: builders.length,
  );
  return builders[index](username);
}

List<InlineSpan> buildPinMessageTextSpans({
  required FluxerLocalizations l10n,
  required String authorName,
  required TextStyle textStyle,
  required TextStyle usernameStyle,
  required TextStyle linkStyle,
  VoidCallback? onMessageLinkTap,
  VoidCallback? onAllPinsLinkTap,
}) {
  return _expandPinMessageTemplate(
    resolvePinMessageTemplate(l10n),
    authorName: authorName,
    messageLinkLabel: l10n.systemPinMessageMessageLink,
    allPinsLinkLabel: l10n.systemPinMessageAllPinsLink,
    textStyle: textStyle,
    usernameStyle: usernameStyle,
    linkStyle: linkStyle,
    onMessageLinkTap: onMessageLinkTap,
    onAllPinsLinkTap: onAllPinsLinkTap,
  );
}

enum _PinMessagePlaceholder { username, messageLink, allPinsLink }

List<InlineSpan> _expandPinMessageTemplate(
  String input, {
  required String authorName,
  required String messageLinkLabel,
  required String allPinsLinkLabel,
  required TextStyle textStyle,
  required TextStyle usernameStyle,
  required TextStyle linkStyle,
  VoidCallback? onMessageLinkTap,
  VoidCallback? onAllPinsLinkTap,
}) {
  if (input.isEmpty) {
    return <InlineSpan>[];
  }
  final int usernameIndex = input.indexOf(kSystemMessageUsernamePlaceholder);
  final int messageLinkIndex = input.indexOf(
    kSystemMessageMessageLinkPlaceholder,
  );
  final int allPinsIndex = input.indexOf(kSystemMessageAllPinsLinkPlaceholder);
  final List<(int, _PinMessagePlaceholder)>
  markers = <(int, _PinMessagePlaceholder)>[
    if (usernameIndex >= 0) (usernameIndex, _PinMessagePlaceholder.username),
    if (messageLinkIndex >= 0)
      (messageLinkIndex, _PinMessagePlaceholder.messageLink),
    if (allPinsIndex >= 0) (allPinsIndex, _PinMessagePlaceholder.allPinsLink),
  ]..sort((a, b) => a.$1.compareTo(b.$1));
  if (markers.isEmpty) {
    return <InlineSpan>[TextSpan(text: input, style: textStyle)];
  }
  final (int index, _PinMessagePlaceholder placeholder) = markers.first;
  final String before = input.substring(0, index);
  final String after = switch (placeholder) {
    _PinMessagePlaceholder.username => input.substring(
      index + kSystemMessageUsernamePlaceholder.length,
    ),
    _PinMessagePlaceholder.messageLink => input.substring(
      index + kSystemMessageMessageLinkPlaceholder.length,
    ),
    _PinMessagePlaceholder.allPinsLink => input.substring(
      index + kSystemMessageAllPinsLinkPlaceholder.length,
    ),
  };
  final InlineSpan replacement = switch (placeholder) {
    _PinMessagePlaceholder.username => TextSpan(
      text: authorName,
      style: usernameStyle,
    ),
    _PinMessagePlaceholder.messageLink => _pinMessageLinkSpan(
      linkText: messageLinkLabel,
      linkStyle: linkStyle,
      onTap: onMessageLinkTap,
    ),
    _PinMessagePlaceholder.allPinsLink => _pinMessageLinkSpan(
      linkText: allPinsLinkLabel,
      linkStyle: linkStyle,
      onTap: onAllPinsLinkTap,
    ),
  };
  return <InlineSpan>[
    ..._expandPinMessageTemplate(
      before,
      authorName: authorName,
      messageLinkLabel: messageLinkLabel,
      allPinsLinkLabel: allPinsLinkLabel,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
      linkStyle: linkStyle,
      onMessageLinkTap: onMessageLinkTap,
      onAllPinsLinkTap: onAllPinsLinkTap,
    ),
    replacement,
    ..._expandPinMessageTemplate(
      after,
      authorName: authorName,
      messageLinkLabel: messageLinkLabel,
      allPinsLinkLabel: allPinsLinkLabel,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
      linkStyle: linkStyle,
      onMessageLinkTap: onMessageLinkTap,
      onAllPinsLinkTap: onAllPinsLinkTap,
    ),
  ];
}

InlineSpan _pinMessageLinkSpan({
  required String linkText,
  required TextStyle linkStyle,
  VoidCallback? onTap,
}) {
  if (onTap == null) {
    return TextSpan(text: linkText, style: linkStyle);
  }
  return WidgetSpan(
    alignment: PlaceholderAlignment.baseline,
    baseline: TextBaseline.alphabetic,
    child: GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Text(linkText, style: linkStyle),
    ),
  );
}

String? stringifySystemMessageForDmListPreview({
  required FluxerLocalizations l10n,
  required int messageType,
  required String messageId,
  required String content,
  required String authorName,
  String? mentionedUserName,
  String? mentionedUserId,
  String? authorId,
}) {
  switch (messageType) {
    case messageTypeUserJoin:
      return _stripTrailingPeriod(
        resolveGuildJoinMessage(
          l10n,
          messageId: messageId,
          username: authorName,
        ),
      );
    case messageTypeChannelPinnedMessage:
      return _stripTrailingPeriod(l10n.systemPreviewPinnedMessage(authorName));
    case messageTypeRecipientAdd:
      if (mentionedUserName != null && mentionedUserName.isNotEmpty) {
        return _stripTrailingPeriod(
          l10n.systemPreviewAddedToGroup(authorName, mentionedUserName),
        );
      }
      return _stripTrailingPeriod(
        l10n.systemPreviewAddedSomeoneToGroup(authorName),
      );
    case messageTypeRecipientRemove:
      final bool isSelfRemove =
          mentionedUserId != null &&
          authorId != null &&
          mentionedUserId == authorId;
      if (isSelfRemove) {
        return _stripTrailingPeriod(l10n.systemPreviewHasLeftGroup(authorName));
      }
      if (mentionedUserName != null && mentionedUserName.isNotEmpty) {
        return _stripTrailingPeriod(
          l10n.systemPreviewRemovedFromGroup(authorName, mentionedUserName),
        );
      }
      return _stripTrailingPeriod(
        l10n.systemPreviewRemovedSomeoneFromGroup(authorName),
      );
    case messageTypeChannelNameChange:
      final String newName = content.trim();
      if (newName.isNotEmpty) {
        return _stripTrailingPeriod(
          l10n.systemPreviewChangedChannelNameTo(authorName, newName),
        );
      }
      return _stripTrailingPeriod(
        l10n.systemPreviewChangedChannelName(authorName),
      );
    case messageTypeChannelIconChange:
      return _stripTrailingPeriod(
        l10n.systemPreviewChangedChannelIcon(authorName),
      );
    case messageTypeCall:
      return _stripTrailingPeriod(l10n.systemPreviewStartedCall(authorName));
    default:
      return null;
  }
}

String _stripTrailingPeriod(String text) {
  if (text.endsWith('.')) {
    return text.substring(0, text.length - 1);
  }
  return text;
}
