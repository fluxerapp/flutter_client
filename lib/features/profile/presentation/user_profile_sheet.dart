import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_popout_card.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_popout_frame.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_view.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class FluxerUserProfileSheet {
  FluxerUserProfileSheet._();

  static Future<void> show(
    BuildContext context, {
    required String userId,
    String? guildId,
    bool autoFocusNote = false,
    bool isWebhook = false,
    Message? message,
  }) {
    if (!autoFocusNote && usesDesktopPointerUi(context)) {
      final BuildContext hostContext = Navigator.of(
        context,
        rootNavigator: true,
      ).context;
      return FluxerBottomSheet.show<void>(
        context,
        useRootNavigator: true,
        desktop: const FluxerDesktopPresentation(
          surface: FluxerDesktopSurface.popout,
          width: kUserProfilePopoutWidth,
          placement: FluxerDesktopPlacement.rightStart,
          showPanelBorder: false,
          borderRadius: 6,
        ),
        builder: (BuildContext sheetContext, VoidCallback close) =>
            UserProfilePopoutCard(
              userId: userId,
              guildId: guildId,
              isWebhook: isWebhook,
              message: message,
              onClose: close,
              onOpenFullProfile: () {
                close();
                unawaited(
                  showFull(hostContext, userId: userId, guildId: guildId),
                );
              },
            ),
      );
    }
    return showFull(
      context,
      userId: userId,
      guildId: guildId,
      autoFocusNote: autoFocusNote,
      isWebhook: isWebhook,
      message: message,
    );
  }

  static Future<void> showFull(
    BuildContext context, {
    required String userId,
    String? guildId,
    bool autoFocusNote = false,
    bool isWebhook = false,
    Message? message,
  }) {
    return FluxerBottomSheet.showScrollable<void>(
      context,
      useRootNavigator: true,
      minChildSize: 0.5,
      showDragHandle: false,
      builder: (sheetContext, scrollController, close) => _SheetBody(
        userId: userId,
        autoFocusNote: autoFocusNote,
        scrollController: scrollController,
        onClose: close,
        guildId: guildId,
        isWebhook: isWebhook,
        message: message,
      ),
    );
  }
}

class _SheetBody extends ConsumerStatefulWidget {
  const _SheetBody({
    required this.userId,
    required this.autoFocusNote,
    required this.scrollController,
    required this.onClose,
    this.guildId,
    this.isWebhook = false,
    this.message,
  });

  final String userId;
  final String? guildId;
  final bool autoFocusNote;
  final ScrollController scrollController;
  final VoidCallback onClose;
  final bool isWebhook;
  final Message? message;

  @override
  ConsumerState<_SheetBody> createState() => _SheetBodyState();
}

class _SheetBodyState extends ConsumerState<_SheetBody> {
  @override
  Widget build(BuildContext context) {
    return UserProfileView(
      userId: widget.userId,
      guildId: widget.guildId,
      autoFocusNote: widget.autoFocusNote,
      scrollController: widget.scrollController,
      onCloseRequested: widget.onClose,
      showTopHandle: !usesDesktopPointerUi(context),
      isWebhook: widget.isWebhook,
      message: widget.message,
    );
  }
}
