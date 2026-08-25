import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_view.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

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
    return FluxerBottomSheet.showScrollable<void>(
      context,
      useRootNavigator: true,
      initialChildSize: 0.95,
      minChildSize: 0.5,
      disableTopPadding: true,
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
      showTopHandle: true,
      isWebhook: widget.isWebhook,
      message: widget.message,
    );
  }
}
