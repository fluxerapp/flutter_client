import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class BlockedAuthorPreview extends ConsumerWidget {
  const BlockedAuthorPreview({
    required this.message,
    required this.child,
    super.key,
  });

  final Message message;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool blocked =
        message.isUserMessage &&
        ref.watch(
          blockedUserIdsProvider.select(
            (Set<String> ids) => ids.contains(message.authorId),
          ),
        );
    if (!blocked) {
      return child;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kMessageRowPaddingHorizontal,
        vertical: 4,
      ),
      child: Text(
        FluxerLocalizations.of(context).chatBlockedMessagesCollapsed(1),
        style: context.textStyles.smallText.copyWith(
          color: context.colors.textPrimaryMuted,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
