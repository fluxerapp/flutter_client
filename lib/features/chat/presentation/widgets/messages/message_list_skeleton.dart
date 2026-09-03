import 'dart:math' show min;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_placeholder_specs.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class MessageListMismatchPlaceholder extends StatelessWidget {
  const MessageListMismatchPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: context.colors.chatBackground);
  }
}

class MessageListSkeleton extends ConsumerWidget {
  const MessageListSkeleton({required this.channelId, super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool compact = ref.watch(
      userSettingsViewModelProvider.select((s) => s.messageDisplayCompact),
    );
    final double groupSpacing = ref.watch(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState s) =>
            compact ? s.compactMessageGroupSpacing : s.messageGroupSpacing,
      ),
    );
    final double fontSize = ref.watch(
      themePreferenceProvider.select(
        (ThemePreferenceState s) => s.chatFontSize.toDouble(),
      ),
    );
    final MessageListPlaceholderSpecs specs = buildMessageListPlaceholderSpecs(
      seedKey: channelId,
      compact: compact,
      groupSpacing: groupSpacing,
      fontSize: fontSize,
    );
    return Semantics(
      label: FluxerLocalizations.of(context).chatLoadingMessages,
      child: ExcludeSemantics(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: ClipRect(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          kMessageRowPaddingHorizontal,
                          16,
                          kMessageRowPaddingHorizontal,
                          12,
                        ),
                        child: _MessageListSkeletonContent(specs: specs),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Stands in for unloaded history at a loaded edge of the message list, so a
/// fling runs into skeleton rows instead of a wall while the page loads.
/// Sized to [MessageListPlaceholderSpecs.totalHeight] and clipped, so the
/// host knows the extent it adds without measuring.
class MessageListEdgeFiller extends StatelessWidget {
  const MessageListEdgeFiller({
    required this.specs,
    required this.alignment,
    super.key,
  });

  final MessageListPlaceholderSpecs specs;

  /// Groups hug the loaded rows: bottom-aligned above the oldest row,
  /// top-aligned below the newest.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: FluxerLocalizations.of(context).chatLoadingMessages,
      child: ExcludeSemantics(
        child: SizedBox(
          height: specs.totalHeight,
          child: ClipRect(
            child: OverflowBox(
              alignment: alignment,
              minHeight: 0,
              maxHeight: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kMessageRowPaddingHorizontal,
                  vertical: 12,
                ),
                child: _MessageListSkeletonContent(
                  specs: specs,
                  groupCount: specs.messageCounts.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageListSkeletonContent extends StatelessWidget {
  const _MessageListSkeletonContent({
    required this.specs,
    this.groupCount = kMessageListLoadingSkeletonGroups,
  });

  final MessageListPlaceholderSpecs specs;
  final int groupCount;

  @override
  Widget build(BuildContext context) {
    final int count = min(specs.messageCounts.length, groupCount);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List<Widget>.generate(count, (int groupIndex) {
        return _MessageListSkeletonGroup(
          groupIndex: groupIndex,
          messageLineCount: specs.messageCounts[groupIndex],
          attachment: specs.attachmentSpecs[groupIndex],
          groupSpacing: groupIndex == count - 1 ? 0 : specs.groupSpacing,
        );
      }),
    );
  }
}

class _MessageListSkeletonGroup extends StatelessWidget {
  const _MessageListSkeletonGroup({
    required this.groupIndex,
    required this.messageLineCount,
    required this.attachment,
    required this.groupSpacing,
  });

  final int groupIndex;
  final int messageLineCount;
  final MessageListPlaceholderAttachment? attachment;
  final double groupSpacing;

  static const double _headerGap = 12;
  static const double _lineGap = 6;
  static const double _attachmentTopMargin = 8;
  static const double _attachmentMaxWidth = 420;
  static const double _attachmentMaxHeight = 250;

  @override
  Widget build(BuildContext context) {
    final int baseSeed = (groupIndex + 1) * 17;
    final double usernamePercent =
        48 + messageListSkeletonWidthFactor(baseSeed) * 36;
    final double timestampPercent =
        8 + messageListSkeletonWidthFactor(baseSeed + 3) * 12;
    return Padding(
      padding: EdgeInsets.only(bottom: groupSpacing),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: kMessageAvatarTopPadding),
            child: _MessageListSkeletonCircle(),
          ),
          const SizedBox(width: kMessageAvatarTextGap),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double maxWidth = constraints.maxWidth;
                final double usernameWidth =
                    maxWidth * usernamePercent.clamp(0, 92) / 100;
                final double timestampWidth = min(
                  maxWidth * timestampPercent.clamp(0, 24) / 100,
                  maxWidth - usernameWidth - _headerGap,
                ).clamp(0, double.infinity);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: <Widget>[
                          _MessageListSkeletonBar(
                            width: usernameWidth,
                            height: 12,
                            opacity: 0.55,
                          ),
                          const SizedBox(width: _headerGap),
                          _MessageListSkeletonBar(
                            width: timestampWidth,
                            height: 10,
                            opacity: 0.35,
                          ),
                        ],
                      ),
                    ),
                    for (
                      int lineIndex = 0;
                      lineIndex < messageLineCount;
                      lineIndex++
                    )
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: lineIndex == messageLineCount - 1
                              ? 0
                              : _lineGap,
                        ),
                        child: _MessageListSkeletonBar(
                          width:
                              maxWidth *
                              (75 +
                                      messageListSkeletonWidthFactor(
                                            baseSeed + lineIndex * 11,
                                          ) *
                                          18)
                                  .clamp(0, 98) /
                              100,
                          height: 12,
                          opacity: 0.45,
                        ),
                      ),
                    if (attachment != null) ...<Widget>[
                      const SizedBox(height: _attachmentTopMargin),
                      _MessageListSkeletonAttachment(
                        attachment: attachment!,
                        maxWidth: min(_attachmentMaxWidth, maxWidth),
                        maxHeight: _attachmentMaxHeight,
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageListSkeletonCircle extends StatelessWidget {
  const _MessageListSkeletonCircle();

  static const double _opacity = 0.45;

  @override
  Widget build(BuildContext context) {
    return const _MessageListSkeletonShape(
      opacity: _opacity,
      width: kMessageAvatarSize,
      height: kMessageAvatarSize,
      shape: BoxShape.circle,
    );
  }
}

class _MessageListSkeletonBar extends StatelessWidget {
  const _MessageListSkeletonBar({
    required this.width,
    required this.height,
    required this.opacity,
  });

  final double width;
  final double height;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return _MessageListSkeletonShape(
      opacity: opacity,
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(999),
    );
  }
}

class _MessageListSkeletonAttachment extends StatelessWidget {
  const _MessageListSkeletonAttachment({
    required this.attachment,
    required this.maxWidth,
    required this.maxHeight,
  });

  final MessageListPlaceholderAttachment attachment;
  final double maxWidth;
  final double maxHeight;

  static const double _opacity = 0.35;

  @override
  Widget build(BuildContext context) {
    return _MessageListSkeletonShape(
      opacity: _opacity,
      width: attachment.width.clamp(0, maxWidth),
      height: attachment.height.clamp(0, maxHeight),
      borderRadius: BorderRadius.circular(8),
    );
  }
}

class _MessageListSkeletonShape extends StatelessWidget {
  const _MessageListSkeletonShape({
    required this.opacity,
    this.width,
    this.height,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
  });

  final double opacity;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.colors.backgroundModifierAccent,
          shape: shape,
          borderRadius: shape == BoxShape.circle ? null : borderRadius,
        ),
      ),
    );
  }
}
