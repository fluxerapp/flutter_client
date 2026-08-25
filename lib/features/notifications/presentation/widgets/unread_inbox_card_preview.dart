import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/utils/message_grouping_utils.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const int _kMaxPreviewMessages = 24;
const double _kPreviewLoaderHeight = 80;

/// Collapsable preview body of an unread inbox card. Shows a loading spinner
/// while messages are fetched, the inline message list when available, and a
/// "view all unread" button beneath the list.
class UnreadInboxCardPreview extends ConsumerWidget {
  const UnreadInboxCardPreview({
    required this.preview,
    required this.isLoading,
    required this.previewRoleGuildId,
    required this.onViewAllUnread,
    super.key,
  });

  final List<Message>? preview;
  final bool isLoading;
  final String? previewRoleGuildId;
  final ValueChanged<Message> onViewAllUnread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerColorTheme colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: colors.backgroundHeaderSecondary),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildBody(context, ref, colors),
              if (_shouldShowViewAllButton())
                _buildViewAllButton(context, colors),
            ],
          ),
        ),
      ),
    );
  }

  bool _shouldShowViewAllButton() {
    final List<Message>? items = preview;
    return items != null && items.isNotEmpty && !isLoading;
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    FluxerColorTheme colors,
  ) {
    if (isLoading) {
      return SizedBox(
        height: _kPreviewLoaderHeight,
        child: Center(child: FluxerLoadingSpinner(color: colors.brandPrimary)),
      );
    }
    final List<Message>? items = preview;
    if (items == null || items.isEmpty) {
      return const SizedBox(height: 4);
    }
    final String? currentUserId = ref.watch(currentUserIdProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (int i = 0; i < items.length && i < _kMaxPreviewMessages; i++)
          MessageItem(
            message: items[i],
            isGrouped: computeMessageRowGrouped(
              message: items[i],
              previousMessage: i > 0 ? items[i - 1] : null,
              isNewDay: false,
            ),
            currentUserId: currentUserId,
            inboxPreviewMode: true,
            previewRoleGuildId: previewRoleGuildId,
          ),
      ],
    );
  }

  Widget _buildViewAllButton(BuildContext context, FluxerColorTheme colors) {
    final FluxerTextTheme textStyles = context.textStyles;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<Message>? items = preview;
    final Message? first = items != null && items.isNotEmpty
        ? items.first
        : null;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: OutlinedButton(
          onPressed: first == null ? null : () => onViewAllUnread(first),
          style: OutlinedButton.styleFrom(
            foregroundColor: colors.textPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            side: BorderSide(color: colors.backgroundHeaderSecondary),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            l10n.notificationsViewAllUnread,
            style: textStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
