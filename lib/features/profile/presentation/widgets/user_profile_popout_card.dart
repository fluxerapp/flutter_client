import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_view.dart';
import 'package:fluxer_app/material_ui.dart';

class UserProfilePopoutCard extends StatefulWidget {
  const UserProfilePopoutCard({
    required this.userId,
    required this.onClose,
    this.guildId,
    this.isWebhook = false,
    this.message,
    this.onOpenFullProfile,
    super.key,
  });

  final String userId;
  final VoidCallback onClose;
  final String? guildId;
  final bool isWebhook;
  final Message? message;
  final VoidCallback? onOpenFullProfile;

  @override
  State<UserProfilePopoutCard> createState() => _UserProfilePopoutCardState();
}

class _UserProfilePopoutCardState extends State<UserProfilePopoutCard> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserProfileView(
      popout: true,
      userId: widget.userId,
      guildId: widget.guildId,
      autoFocusNote: false,
      scrollController: _scrollController,
      onCloseRequested: widget.onClose,
      onOpenFullProfile: widget.onOpenFullProfile,
      isWebhook: widget.isWebhook,
      message: widget.message,
    );
  }
}
