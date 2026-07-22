import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/add_friends_to_group_body.dart';
import 'package:fluxer_app/features/dm/providers/add_friends_to_group_controller.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class AddFriendsToGroupModal {
  AddFriendsToGroupModal._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required DmConversation dm,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerModal.show<void>(
      context,
      title: l10n.createDmSelectFriends,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return _AddFriendsToGroupModalContent(dm: dm, onClose: close);
      },
    );
  }
}

class _AddFriendsToGroupModalContent extends ConsumerStatefulWidget {
  const _AddFriendsToGroupModalContent({
    required this.dm,
    required this.onClose,
  });

  final DmConversation dm;
  final VoidCallback onClose;

  @override
  ConsumerState<_AddFriendsToGroupModalContent> createState() =>
      _AddFriendsToGroupModalContentState();
}

class _AddFriendsToGroupModalContentState
    extends ConsumerState<_AddFriendsToGroupModalContent> {
  AddFriendsToGroupController? _controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller != null) {
      return;
    }
    final AddFriendsToGroupController controller = AddFriendsToGroupController(
      container: ref.container,
      channelId: widget.dm.id,
      dm: widget.dm,
    )..addListener(_handleControllerChanged);
    _controller = controller;
  }

  @override
  void dispose() {
    _controller
      ?..removeListener(_handleControllerChanged)
      ..dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleControllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final AddFriendsToGroupController? controller = _controller;
    if (controller == null) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 420,
      child: AddFriendsToGroupBody(
        controller: controller,
        scrollController: _scrollController,
      ),
    );
  }
}
