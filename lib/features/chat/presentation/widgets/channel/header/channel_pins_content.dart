import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelPinsContent extends ConsumerStatefulWidget {
  const ChannelPinsContent({
    required this.channelId,
    required this.guildId,
    required this.onClose,
    super.key,
  });

  final String channelId;
  final String? guildId;
  final VoidCallback onClose;

  @override
  ConsumerState<ChannelPinsContent> createState() => _ChannelPinsContentState();
}

class _ChannelPinsContentState extends ConsumerState<ChannelPinsContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(
        ReadStateRepository(
          ref.read(fluxerClientProvider),
          ref.read(fluxerDatabaseProvider),
        ).ackPins(widget.channelId),
      );
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final ScrollPosition position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - 160) {
      return;
    }
    unawaited(
      ref.read(channelPinsProvider(widget.channelId).notifier).loadMore(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final pins = ref.watch(channelPinsProvider(widget.channelId));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            context.layout.s3,
            context.layout.s2,
            context.layout.s2,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l10n.channelDetailsTabPins,
                  style: context.textStyles.heading,
                ),
              ),
              FluxerButton.ghost(
                onPressed: widget.onClose,
                icon: PhosphorIconsBold.x,
                isSquare: true,
                semanticLabel: l10n.uiClose,
              ),
            ],
          ),
        ),
        Expanded(
          child: pins.when(
            loading: () => const Center(child: FluxerLoadingSpinner()),
            error: (Object error, StackTrace stack) =>
                Center(child: Text(l10n.channelDetailsPinsLoadFailedTitle)),
            data: (ChannelPinsState state) {
              if (state.items.isEmpty) {
                return _PinsEmptyState();
              }
              final String endStateDescription = widget.guildId != null
                  ? l10n.channelDetailsPinsGuildEndHint
                  : l10n.channelDetailsPinsDmEndHint;
              return ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
                itemCount:
                    state.items.length +
                    (state.isLoadingMore || !state.hasMore ? 1 : 0),
                itemBuilder: (BuildContext context, int index) {
                  if (index >= state.items.length) {
                    if (state.isLoadingMore) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: FluxerLoadingSpinner()),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Center(
                        child: Text(
                          endStateDescription,
                          style: context.textStyles.bodySmall.copyWith(
                            color: context.colors.textPrimaryMuted,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  final PinnedMessageEntry entry = state.items[index];
                  return MessagePreviewTile(
                    message: entry.message,
                    guildId: widget.guildId,
                    onTap: () => _jumpToMessage(entry.message),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _jumpToMessage(Message message) async {
    // Captured before the awaits: the panel is dismissed mid-jump, and a ref
    // read after onClose() would be dead.
    final ProviderContainer container = ref.container;
    final database = container.read(fluxerDatabaseProvider);
    await database.messageDao.upsertMessage(message.toCompanion());
    final String? resolvedGuildId =
        widget.guildId ??
        (await database.channelDao.getChannelById(message.channelId))?.guildId;
    if (!mounted) {
      return;
    }
    widget.onClose();
    final ChannelJumpLink link = MessageJumpLink(
      scope: resolvedGuildId ?? '@me',
      channelId: message.channelId,
      messageId: message.id,
    );
    await navigateToChannelJumpLink(
      container: container,
      context: context,
      link: link,
    );
  }
}

class _PinsEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsFill.sparkle,
              size: 64,
              color: context.colors.textPrimaryMuted,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.channelPinsEmptyTitle,
              style: context.textStyles.heading,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              l10n.channelPinsEmptyDescription,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
