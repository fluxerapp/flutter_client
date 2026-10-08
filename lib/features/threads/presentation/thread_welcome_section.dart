import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/wallpaper/chat_wallpaper_text_theme.dart';
import 'package:fluxer_app/features/threads/presentation/thread_messages.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_welcome_section.g.dart';

@riverpod
Stream<bool> threadStarterMissing(Ref ref, String threadId) => ref
    .watch(fluxerDatabaseProvider)
    .messageDao
    .watchMessage(threadId)
    .map((db.Message? row) => row == null)
    .distinct();

class ThreadWelcomeSection extends ConsumerWidget {
  const ThreadWelcomeSection({required this.thread, super.key});

  final Channel thread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? parentId = thread.parentId;
    final Channel? parent = parentId == null
        ? null
        : ref.watch(channelByIdProvider(parentId)).value;
    final bool isPost = parent != null && parent.isThreadOnly;
    final bool starterMissing =
        isPost &&
        (ref.watch(threadStarterMissingProvider(thread.id)).value ?? false);
    final String? ownerId = thread.ownerId;
    final String? ownerName = ownerId == null
        ? null
        : watchMentionUserDisplayName(
            ref: ref,
            userId: ownerId,
            guildId: thread.guildId,
          );
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ChatSurfaceTheme(
            builder: (BuildContext context) => Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colors.guildListForeground,
                shape: BoxShape.circle,
              ),
              child: PhosphorIcon(
                PhosphorIconsFill.chatsCircle,
                size: 48,
                color: context.colors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            thread.name,
            style: context.textStyles.heading.copyWith(fontSize: 24),
          ),
          if (ownerName != null) ...<Widget>[
            const SizedBox(height: 4),
            Text(
              l10n.threadStartedBy(ownerName),
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
          ],
          if (starterMissing) ...<Widget>[
            const SizedBox(height: 8),
            const ThreadStarterDeletedNotice(),
          ],
        ],
      ),
    );
  }
}
