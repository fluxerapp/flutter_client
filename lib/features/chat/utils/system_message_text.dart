import 'package:flutter/material.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/call_duration_format.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

const String kSystemMessageUsernamePlaceholder = '{username}';
const String kSystemMessageMentionedUsernamePlaceholder = '{userName}';
const String kSystemMessageNewNamePlaceholder = '{newName}';
const String kSystemMessageMessageLinkPlaceholder = '{messageLink}';
const String kSystemMessageAllPinsLinkPlaceholder = '{allPinsLink}';
const String kSystemMessageDurationPlaceholder = '{duration}';
const String kFluxerProductName = 'Fluxer';

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

String? stringifySystemMessage({
  required FluxerLocalizations l10n,
  required Message message,
  required String authorName,
  String? mentionedUserName,
  String? currentUserId,
}) {
  switch (message.type) {
    case messageTypeUserJoin:
      return resolveGuildJoinMessage(
        l10n,
        messageId: message.id,
        username: authorName,
      );
    case messageTypeChannelPinnedMessage:
      return l10n.systemPreviewPinnedMessage(authorName);
    case messageTypeRecipientAdd:
      if (mentionedUserName != null && mentionedUserName.isNotEmpty) {
        return l10n.systemPreviewAddedToGroup(authorName, mentionedUserName);
      }
      return l10n.systemPreviewAddedSomeoneToGroup(authorName);
    case messageTypeRecipientRemove:
      final String? mentionedUserId = message.mentionedUserIds.isEmpty
          ? null
          : message.mentionedUserIds.first;
      final bool isSelfRemove =
          mentionedUserId != null && mentionedUserId == message.authorId;
      if (isSelfRemove) {
        return l10n.systemPreviewHasLeftGroup(authorName);
      }
      if (mentionedUserName != null && mentionedUserName.isNotEmpty) {
        return l10n.systemPreviewRemovedFromGroup(
          authorName,
          mentionedUserName,
        );
      }
      return l10n.systemPreviewRemovedSomeoneFromGroup(authorName);
    case messageTypeChannelNameChange:
      final String newName = message.content.trim();
      if (newName.isNotEmpty) {
        return l10n.systemPreviewChangedChannelNameTo(authorName, newName);
      }
      return l10n.systemPreviewChangedChannelName(authorName);
    case messageTypeChannelIconChange:
      return l10n.systemPreviewChangedChannelIcon(authorName);
    case messageTypeCall:
      return l10n.systemPreviewStartedCall(authorName);
    default:
      if (message.isSystemMessage) {
        return l10n.systemUnknownMessage(kFluxerProductName);
      }
      return null;
  }
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
  final String? text = stringifySystemMessage(
    l10n: l10n,
    message: Message(
      id: messageId,
      channelId: '',
      authorId: authorId ?? '',
      authorName: authorName,
      content: content,
      timestamp: DateTime.fromMillisecondsSinceEpoch(0),
      type: messageType,
      mentionedUserIds: mentionedUserId == null || mentionedUserId.isEmpty
          ? const <String>[]
          : <String>[mentionedUserId],
    ),
    authorName: authorName,
    mentionedUserName: mentionedUserName,
    currentUserId: authorId,
  );
  if (text == null) {
    return null;
  }
  return _stripTrailingPeriod(text);
}

List<InlineSpan> buildSystemMessageTextSpans({
  required FluxerLocalizations l10n,
  required Message message,
  required String authorName,
  required TextStyle textStyle,
  required TextStyle usernameStyle,
  String? mentionedUserName,
  TextStyle? newNameStyle,
  TextStyle? linkStyle,
  VoidCallback? onMessageLinkTap,
  VoidCallback? onAllPinsLinkTap,
  VoidCallback? onJoinCallTap,
  String? currentUserId,
}) {
  if (message.type == messageTypeUserJoin) {
    return _guildJoinTextSpans(
      l10n,
      messageId: message.id,
      authorName: authorName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
    );
  }
  if (message.type == messageTypeChannelPinnedMessage) {
    return buildPinMessageTextSpans(
      l10n: l10n,
      authorName: authorName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
      linkStyle: linkStyle ?? usernameStyle,
      onMessageLinkTap: onMessageLinkTap,
      onAllPinsLinkTap: onAllPinsLinkTap,
    );
  }
  if (message.type == messageTypeCall) {
    return _callMessageTextSpans(
      l10n: l10n,
      message: message,
      authorName: authorName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
      linkStyle: linkStyle ?? usernameStyle,
      onJoinCallTap: onJoinCallTap,
      currentUserId: currentUserId,
    );
  }
  final String? template = _systemMessageTemplate(
    l10n: l10n,
    message: message,
    authorName: authorName,
    mentionedUserName: mentionedUserName,
  );
  if (template == null) {
    return <InlineSpan>[TextSpan(text: message.content, style: textStyle)];
  }
  return expandSystemMessageTemplate(
    template,
    authorName: authorName,
    mentionedUserName: mentionedUserName,
    newName: message.content.trim().isEmpty ? null : message.content.trim(),
    textStyle: textStyle,
    usernameStyle: usernameStyle,
    newNameStyle: newNameStyle ?? usernameStyle,
  );
}

String? _systemMessageTemplate({
  required FluxerLocalizations l10n,
  required Message message,
  required String authorName,
  String? mentionedUserName,
}) {
  switch (message.type) {
    case messageTypeRecipientAdd:
      if (mentionedUserName != null && mentionedUserName.isNotEmpty) {
        return l10n.systemPreviewAddedToGroup(
          kSystemMessageUsernamePlaceholder,
          kSystemMessageMentionedUsernamePlaceholder,
        );
      }
      return l10n.systemPreviewAddedSomeoneToGroup(
        kSystemMessageUsernamePlaceholder,
      );
    case messageTypeRecipientRemove:
      final String? mentionedUserId = message.mentionedUserIds.isEmpty
          ? null
          : message.mentionedUserIds.first;
      final bool isSelfRemove =
          mentionedUserId != null && mentionedUserId == message.authorId;
      if (isSelfRemove) {
        return l10n.systemPreviewHasLeftGroup(
          kSystemMessageUsernamePlaceholder,
        );
      }
      if (mentionedUserName != null && mentionedUserName.isNotEmpty) {
        return l10n.systemPreviewRemovedFromGroup(
          kSystemMessageUsernamePlaceholder,
          kSystemMessageMentionedUsernamePlaceholder,
        );
      }
      return l10n.systemPreviewRemovedSomeoneFromGroup(
        kSystemMessageUsernamePlaceholder,
      );
    case messageTypeChannelNameChange:
      final String newName = message.content.trim();
      if (newName.isNotEmpty) {
        return l10n.systemPreviewChangedChannelNameTo(
          kSystemMessageUsernamePlaceholder,
          kSystemMessageNewNamePlaceholder,
        );
      }
      return l10n.systemPreviewChangedChannelName(
        kSystemMessageUsernamePlaceholder,
      );
    case messageTypeChannelIconChange:
      return l10n.systemPreviewChangedChannelIcon(
        kSystemMessageUsernamePlaceholder,
      );
    default:
      if (message.isSystemMessage && !isKnownSystemMessageType(message.type)) {
        return l10n.systemUnknownMessage(kFluxerProductName);
      }
      return null;
  }
}

List<InlineSpan> _guildJoinTextSpans(
  FluxerLocalizations l10n, {
  required String messageId,
  required String authorName,
  required TextStyle textStyle,
  required TextStyle usernameStyle,
}) {
  final template = resolveGuildJoinMessageTemplate(l10n, messageId: messageId);
  return expandSystemMessageTemplate(
    template,
    authorName: authorName,
    textStyle: textStyle,
    usernameStyle: usernameStyle,
  );
}

List<InlineSpan> _callMessageTextSpans({
  required FluxerLocalizations l10n,
  required Message message,
  required String authorName,
  required TextStyle textStyle,
  required TextStyle usernameStyle,
  required TextStyle linkStyle,
  VoidCallback? onJoinCallTap,
  String? currentUserId,
}) {
  final MessageCall? call = message.call;
  if (call == null) {
    return const <InlineSpan>[];
  }
  final bool callEnded = call.isEnded;
  final bool includesCurrentUser =
      currentUserId != null && call.participants.contains(currentUserId);
  final bool authorIsCurrentUser =
      currentUserId != null && message.authorId == currentUserId;
  final bool isMissedCall =
      callEnded && !includesCurrentUser && !authorIsCurrentUser;
  final String durationText = callEnded && call.endedTimestamp != null
      ? formatCallDuration(
          l10n: l10n,
          durationSeconds: call.endedTimestamp!
              .difference(message.timestamp)
              .inSeconds
              .clamp(0, 1 << 30)
              .toDouble(),
        )
      : l10n.systemCallDurationFewSeconds;
  if (!callEnded) {
    final List<InlineSpan> spans = expandSystemMessageTemplate(
      l10n.systemPreviewStartedCall(kSystemMessageUsernamePlaceholder),
      authorName: authorName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
    );
    if (onJoinCallTap != null) {
      spans.add(const TextSpan(text: ' '));
      spans.add(
        _systemMessageActionSpan(
          label: l10n.systemCallJoinTheCall,
          style: linkStyle,
          onTap: onJoinCallTap,
        ),
      );
    }
    return spans;
  }
  if (isMissedCall) {
    if (durationText.isNotEmpty) {
      return expandSystemMessageTemplate(
        l10n.systemCallMissedWithDuration(
          kSystemMessageUsernamePlaceholder,
          durationText,
        ),
        authorName: authorName,
        textStyle: textStyle,
        usernameStyle: usernameStyle,
      );
    }
    return expandSystemMessageTemplate(
      l10n.systemCallMissed(kSystemMessageUsernamePlaceholder),
      authorName: authorName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
    );
  }
  return expandSystemMessageTemplate(
    l10n.systemCallStartedThatLasted(
      kSystemMessageUsernamePlaceholder,
      durationText,
    ),
    authorName: authorName,
    textStyle: textStyle,
    usernameStyle: usernameStyle,
  );
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

enum _SystemMessagePlaceholder { username, mentionedUsername, newName }

List<InlineSpan> expandSystemMessageTemplate(
  String input, {
  required String authorName,
  required TextStyle textStyle,
  required TextStyle usernameStyle,
  String? mentionedUserName,
  String? newName,
  TextStyle? newNameStyle,
}) {
  if (input.isEmpty) {
    return <InlineSpan>[];
  }
  final int usernameIndex = input.indexOf(kSystemMessageUsernamePlaceholder);
  final int mentionedUsernameIndex = input.indexOf(
    kSystemMessageMentionedUsernamePlaceholder,
  );
  final int newNameIndex = input.indexOf(kSystemMessageNewNamePlaceholder);
  final List<(int, _SystemMessagePlaceholder)>
  markers = <(int, _SystemMessagePlaceholder)>[
    if (usernameIndex >= 0) (usernameIndex, _SystemMessagePlaceholder.username),
    if (mentionedUsernameIndex >= 0)
      (mentionedUsernameIndex, _SystemMessagePlaceholder.mentionedUsername),
    if (newNameIndex >= 0) (newNameIndex, _SystemMessagePlaceholder.newName),
  ]..sort((a, b) => a.$1.compareTo(b.$1));
  if (markers.isEmpty) {
    return <InlineSpan>[TextSpan(text: input, style: textStyle)];
  }
  final (int index, _SystemMessagePlaceholder placeholder) = markers.first;
  final String before = input.substring(0, index);
  final String after = switch (placeholder) {
    _SystemMessagePlaceholder.username => input.substring(
      index + kSystemMessageUsernamePlaceholder.length,
    ),
    _SystemMessagePlaceholder.mentionedUsername => input.substring(
      index + kSystemMessageMentionedUsernamePlaceholder.length,
    ),
    _SystemMessagePlaceholder.newName => input.substring(
      index + kSystemMessageNewNamePlaceholder.length,
    ),
  };
  final InlineSpan replacement = switch (placeholder) {
    _SystemMessagePlaceholder.username => TextSpan(
      text: authorName,
      style: usernameStyle,
    ),
    _SystemMessagePlaceholder.mentionedUsername => TextSpan(
      text: mentionedUserName ?? 'someone',
      style: usernameStyle,
    ),
    _SystemMessagePlaceholder.newName => TextSpan(
      text: newName ?? '',
      style: newNameStyle ?? usernameStyle,
    ),
  };
  return <InlineSpan>[
    ...expandSystemMessageTemplate(
      before,
      authorName: authorName,
      mentionedUserName: mentionedUserName,
      newName: newName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
      newNameStyle: newNameStyle,
    ),
    replacement,
    ...expandSystemMessageTemplate(
      after,
      authorName: authorName,
      mentionedUserName: mentionedUserName,
      newName: newName,
      textStyle: textStyle,
      usernameStyle: usernameStyle,
      newNameStyle: newNameStyle,
    ),
  ];
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
    _PinMessagePlaceholder.messageLink => _systemMessageActionSpan(
      label: messageLinkLabel,
      style: linkStyle,
      onTap: onMessageLinkTap,
    ),
    _PinMessagePlaceholder.allPinsLink => _systemMessageActionSpan(
      label: allPinsLinkLabel,
      style: linkStyle,
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

InlineSpan _systemMessageActionSpan({
  required String label,
  required TextStyle style,
  VoidCallback? onTap,
}) {
  if (onTap == null) {
    return TextSpan(text: label, style: style);
  }
  return WidgetSpan(
    alignment: PlaceholderAlignment.baseline,
    baseline: TextBaseline.alphabetic,
    child: GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Text(label, style: style),
    ),
  );
}

String _stripTrailingPeriod(String text) {
  if (text.endsWith('.')) {
    return text.substring(0, text.length - 1);
  }
  return text;
}
