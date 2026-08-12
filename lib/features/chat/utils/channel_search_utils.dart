import 'package:flutter/material.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_chip_filters.dart'
    as chip_filters;
import 'package:fluxer_app/features/chat/domain/channel_search_segments.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

List<MessageSearchScopeFilter> channelSearchScopeOptions({
  required bool isGuildChannel,
}) {
  if (isGuildChannel) {
    return const <MessageSearchScopeFilter>[
      MessageSearchScopeFilter.current,
      MessageSearchScopeFilter.allGuilds,
      MessageSearchScopeFilter.allDms,
      MessageSearchScopeFilter.openDms,
      MessageSearchScopeFilter.all,
      MessageSearchScopeFilter.openDmsAndAllGuilds,
    ];
  }
  return const <MessageSearchScopeFilter>[
    MessageSearchScopeFilter.current,
    MessageSearchScopeFilter.allDms,
    MessageSearchScopeFilter.openDms,
    MessageSearchScopeFilter.all,
    MessageSearchScopeFilter.openDmsAndAllGuilds,
  ];
}

String channelSearchScopeLabel(
  FluxerLocalizations l10n,
  MessageSearchScopeFilter value, {
  required bool isGuildChannel,
}) => switch (value) {
  MessageSearchScopeFilter.current =>
    isGuildChannel
        ? l10n.channelDetailsSearchScopeCurrentCommunity
        : l10n.channelDetailsSearchScopeCurrentDm,
  MessageSearchScopeFilter.allGuilds =>
    l10n.channelDetailsSearchScopeAllCommunities,
  MessageSearchScopeFilter.allDms =>
    isGuildChannel
        ? l10n.channelDetailsSearchScopeAllDmsOnlyGuild
        : l10n.channelDetailsSearchScopeAllDms,
  MessageSearchScopeFilter.openDms =>
    isGuildChannel
        ? l10n.channelDetailsSearchScopeOpenDmsOnlyGuild
        : l10n.channelDetailsSearchScopeOpenDms,
  MessageSearchScopeFilter.all =>
    l10n.channelDetailsSearchScopeAllDmsAndCommunities,
  MessageSearchScopeFilter.openDmsAndAllGuilds =>
    l10n.channelDetailsSearchScopeOpenDmsAndCommunities,
};

String channelSearchScopeDescription(
  FluxerLocalizations l10n,
  MessageSearchScopeFilter value, {
  required bool isGuildChannel,
}) => switch (value) {
  MessageSearchScopeFilter.current =>
    isGuildChannel
        ? l10n.channelDetailsSearchScopeCurrentCommunityDescription
        : l10n.channelDetailsSearchScopeCurrentDmDescription,
  MessageSearchScopeFilter.allGuilds =>
    l10n.channelDetailsSearchScopeAllCommunitiesDescription,
  MessageSearchScopeFilter.allDms =>
    isGuildChannel
        ? l10n.channelDetailsSearchScopeAllDmsOnlyGuildDescription
        : l10n.channelDetailsSearchScopeAllDmsDescription,
  MessageSearchScopeFilter.openDms =>
    isGuildChannel
        ? l10n.channelDetailsSearchScopeOpenDmsOnlyGuildDescription
        : l10n.channelDetailsSearchScopeOpenDmsDescription,
  MessageSearchScopeFilter.all =>
    l10n.channelDetailsSearchScopeAllDmsAndCommunitiesDescription,
  MessageSearchScopeFilter.openDmsAndAllGuilds =>
    l10n.channelDetailsSearchScopeOpenDmsAndCommunitiesDescription,
};

IconData channelSearchSortIcon(MessageSearchSortFilter value) =>
    switch (value) {
      MessageSearchSortFilter.newest => PhosphorIconsFill.clockCounterClockwise,
      MessageSearchSortFilter.oldest => PhosphorIconsFill.clockClockwise,
      MessageSearchSortFilter.relevance => PhosphorIconsFill.sparkle,
    };

String channelSearchSortDescription(
  FluxerLocalizations l10n,
  MessageSearchSortFilter value,
) => switch (value) {
  MessageSearchSortFilter.newest =>
    l10n.channelDetailsSearchSortNewestDescription,
  MessageSearchSortFilter.oldest =>
    l10n.channelDetailsSearchSortOldestDescription,
  MessageSearchSortFilter.relevance =>
    l10n.channelDetailsSearchSortRelevanceDescription,
};

bool shouldShowGuildMetaForSearchScope(MessageSearchScopeFilter scope) =>
    switch (scope) {
      MessageSearchScopeFilter.allGuilds ||
      MessageSearchScopeFilter.all ||
      MessageSearchScopeFilter.openDmsAndAllGuilds => true,
      _ => false,
    };

IconData channelSearchScopeIcon(MessageSearchScopeFilter value) =>
    switch (value) {
      MessageSearchScopeFilter.current => PhosphorIconsBold.hash,
      MessageSearchScopeFilter.openDms => PhosphorIconsFill.chatCenteredDots,
      MessageSearchScopeFilter.allDms => PhosphorIconsFill.envelopeSimple,
      MessageSearchScopeFilter.allGuilds => PhosphorIconsFill.globe,
      MessageSearchScopeFilter.all => PhosphorIconsFill.users,
      MessageSearchScopeFilter.openDmsAndAllGuilds => PhosphorIconsFill.users,
    };

String channelSearchSortLabel(
  FluxerLocalizations l10n,
  MessageSearchSortFilter value,
) => switch (value) {
  MessageSearchSortFilter.newest => l10n.channelDetailsSearchSortNewest,
  MessageSearchSortFilter.oldest => l10n.channelDetailsSearchSortOldest,
  MessageSearchSortFilter.relevance => l10n.channelDetailsSearchSortRelevance,
};

String channelSearchContentDescription(
  FluxerLocalizations l10n,
  MessageSearchContentFilter value,
) => switch (value) {
  MessageSearchContentFilter.image =>
    l10n.channelDetailsSearchContentImageDescription,
  MessageSearchContentFilter.video =>
    l10n.channelDetailsSearchContentVideoDescription,
  MessageSearchContentFilter.audio =>
    l10n.channelDetailsSearchContentAudioDescription,
  MessageSearchContentFilter.file =>
    l10n.channelDetailsSearchContentFileDescription,
  MessageSearchContentFilter.link =>
    l10n.channelDetailsSearchContentLinkDescription,
  MessageSearchContentFilter.embed =>
    l10n.channelDetailsSearchContentEmbedDescription,
  MessageSearchContentFilter.sticker =>
    l10n.channelDetailsSearchContentStickerDescription,
  MessageSearchContentFilter.poll =>
    l10n.channelDetailsSearchContentPollDescription,
  MessageSearchContentFilter.forward =>
    l10n.channelDetailsSearchContentForwardDescription,
};

String channelSearchContentLabel(
  FluxerLocalizations l10n,
  MessageSearchContentFilter value,
) => switch (value) {
  MessageSearchContentFilter.image => l10n.channelDetailsSearchContentImage,
  MessageSearchContentFilter.video => l10n.channelDetailsSearchContentVideo,
  MessageSearchContentFilter.audio => l10n.channelDetailsSearchContentAudio,
  MessageSearchContentFilter.file => l10n.channelDetailsSearchContentFile,
  MessageSearchContentFilter.link => l10n.channelDetailsSearchContentLink,
  MessageSearchContentFilter.embed => l10n.channelDetailsSearchContentEmbed,
  MessageSearchContentFilter.sticker => l10n.channelDetailsSearchContentSticker,
  MessageSearchContentFilter.poll => l10n.channelDetailsSearchContentPoll,
  MessageSearchContentFilter.forward => l10n.channelDetailsSearchContentForward,
};

IconData channelSearchContentIcon(MessageSearchContentFilter value) =>
    switch (value) {
      MessageSearchContentFilter.image => PhosphorIconsFill.image,
      MessageSearchContentFilter.video => PhosphorIconsFill.videoCamera,
      MessageSearchContentFilter.audio => PhosphorIconsFill.musicNote,
      MessageSearchContentFilter.file => PhosphorIconsFill.file,
      MessageSearchContentFilter.link => PhosphorIconsBold.link,
      MessageSearchContentFilter.embed => PhosphorIconsFill.browser,
      MessageSearchContentFilter.sticker => PhosphorIconsFill.sticker,
      MessageSearchContentFilter.poll => PhosphorIconsFill.chartBar,
      MessageSearchContentFilter.forward => PhosphorIconsFill.shareFat,
    };

const List<MessageSearchContentFilter> kChannelSearchHasContentFilters =
    <MessageSearchContentFilter>[
      MessageSearchContentFilter.image,
      MessageSearchContentFilter.video,
      MessageSearchContentFilter.audio,
      MessageSearchContentFilter.file,
      MessageSearchContentFilter.link,
      MessageSearchContentFilter.embed,
      MessageSearchContentFilter.sticker,
      MessageSearchContentFilter.poll,
      MessageSearchContentFilter.forward,
    ];

const List<String> kChannelSearchAuthorTypeValues = <String>[
  'user',
  'bot',
  'webhook',
];

const List<String> kChannelSearchDateFilterKeys = <String>[
  'before',
  'on',
  'during',
  'after',
];

String formatChannelSearchDate(DateTime date) {
  return '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';
}

String formatChannelSearchUserTag(String username, String? discriminator) {
  final String disc = (discriminator ?? '').trim();
  if (disc.isEmpty || disc == '0') {
    return username;
  }
  return '$username#$disc';
}

String? resolveChannelIdByName(
  List<ChannelCategory> categories,
  String channelName,
) {
  final String normalized = channelName.toLowerCase();
  for (final ChannelCategory category in categories) {
    for (final Channel channel in category.channels) {
      if (channel.name.toLowerCase() == normalized) {
        return channel.id;
      }
    }
  }
  for (final ChannelCategory category in categories) {
    for (final Channel channel in category.channels) {
      if (channel.name.toLowerCase().contains(normalized)) {
        return channel.id;
      }
    }
  }
  return null;
}

String channelSearchAuthorTypeLabel(FluxerLocalizations l10n, String value) =>
    switch (value) {
      'user' => l10n.channelDetailsSearchAuthorTypeUser,
      'bot' => l10n.channelDetailsSearchAuthorTypeBot,
      'webhook' => l10n.channelDetailsSearchAuthorTypeWebhook,
      _ => value,
    };

String channelSearchHasValueForContentFilter(
  MessageSearchContentFilter filter,
) => chip_filters.channelSearchHasValueForContentFilter(filter);

String channelSearchFilterDescription(
  FluxerLocalizations l10n,
  String filterKey,
) => switch (filterKey) {
  'from' => l10n.channelHeaderSearchFilterDescFrom,
  'mentions' => l10n.channelHeaderSearchFilterDescMentions,
  'has' => l10n.channelHeaderSearchFilterDescHas,
  'before' => l10n.channelHeaderSearchFilterDescBefore,
  'on' => l10n.channelHeaderSearchFilterDescOn,
  'during' => l10n.channelHeaderSearchFilterDescDuring,
  'after' => l10n.channelHeaderSearchFilterDescAfter,
  'in' => l10n.channelHeaderSearchFilterDescIn,
  'pinned' => l10n.channelHeaderSearchFilterDescPinned,
  'author-type' => l10n.channelHeaderSearchFilterDescAuthorType,
  'link-from' => l10n.channelHeaderSearchFilterDescLinkFrom,
  'file-name' => l10n.channelHeaderSearchFilterDescFileName,
  'file-type' => l10n.channelHeaderSearchFilterDescFileType,
  'sort' => l10n.channelHeaderSearchFilterDescSort,
  'order' => l10n.channelHeaderSearchFilterDescOrder,
  _ => '',
};

List<ChannelSearchFilterOption> channelSearchHistoryFilterOptions({
  required bool isGuildChannel,
}) {
  return kChannelSearchFilterOptions.where((ChannelSearchFilterOption option) {
    if (option.requiresGuild && !isGuildChannel) {
      return false;
    }
    return true;
  }).toList();
}

IconData channelSearchFilterIcon(String filterKey) => switch (filterKey) {
  'from' => PhosphorIconsFill.user,
  'mentions' => PhosphorIconsFill.at,
  'has' => PhosphorIconsFill.funnel,
  'before' || 'after' || 'on' || 'during' => PhosphorIconsFill.calendar,
  'in' => PhosphorIconsBold.hash,
  'pinned' => PhosphorIconsFill.pushPin,
  'author-type' => PhosphorIconsFill.robot,
  'link-from' => PhosphorIconsBold.link,
  'file-name' => PhosphorIconsFill.file,
  'file-type' => PhosphorIconsFill.fileCode,
  'sort' => PhosphorIconsFill.sortAscending,
  'order' => PhosphorIconsFill.arrowsDownUp,
  _ => PhosphorIconsFill.funnel,
};
