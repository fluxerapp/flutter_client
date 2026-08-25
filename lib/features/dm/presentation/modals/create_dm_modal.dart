import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/create_dm_body.dart';
import 'package:fluxer_app/features/dm/providers/create_dm_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class CreateDmModal {
  CreateDmModal._();

  static Future<void> show(
    BuildContext context, {
    CreateDmOptions options = const CreateDmOptions(),
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerModal.show<void>(
      context,
      title: l10n.createDmSelectFriends,
      description: l10n.createDmChooseFriendsSubtitle,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return _CreateDmModalContent(options: options, onClose: close);
      },
    );
  }
}

class _CreateDmModalContent extends ConsumerStatefulWidget {
  const _CreateDmModalContent({required this.options, required this.onClose});

  final CreateDmOptions options;
  final VoidCallback onClose;

  @override
  ConsumerState<_CreateDmModalContent> createState() =>
      _CreateDmModalContentState();
}

class _CreateDmModalContentState extends ConsumerState<_CreateDmModalContent> {
  CreateDmController? _controller;
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _searchController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller != null) {
      return;
    }
    final CreateDmController controller = CreateDmController(
      container: ref.container,
      options: widget.options,
      onCreated: _handleCreated,
    );
    _searchController.addListener(() {
      controller.setSearchQuery(_searchController.text);
    });
    controller.addListener(_handleControllerChanged);
    _controller = controller;
  }

  @override
  void dispose() {
    _controller
      ?..removeListener(_handleControllerChanged)
      ..dispose();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _handleControllerChanged() {
    if (!mounted || _isClosing) {
      return;
    }
    final CreateDmController? controller = _controller;
    if (controller == null) {
      return;
    }
    if (_searchController.text != controller.searchQuery) {
      _searchController.value = _searchController.value.copyWith(
        text: controller.searchQuery,
        selection: TextSelection.collapsed(
          offset: controller.searchQuery.length,
        ),
      );
    }
    setState(() {});
  }

  Future<void> _handleCreated(String channelId) async {
    final CreateDmController? controller = _controller;
    if (controller == null) {
      return;
    }
    controller.removeListener(_handleControllerChanged);
    _isClosing = true;
    widget.onClose();
    if (!context.mounted) {
      return;
    }
    await navigateToDmChannelContent(
      context: context,
      ref: ref,
      channelId: channelId,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isClosing) {
      return const SizedBox.shrink();
    }
    final CreateDmController? controller = _controller;
    if (controller == null) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool showSearch = controller.restriction == null;
    final bool disabled =
        controller.isCreating || controller.restriction != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (showSearch)
          PickerSearchInput(
            controller: _searchController,
            hintText: l10n.createDmSearchFriends,
            topPadding: 0,
            bottomPadding: context.layout.s3,
          ),
        CreateDmBody(
          controller: controller,
          scrollController: _scrollController,
          showInlineSearch: false,
          listHeight: 320,
        ),
        FluxerBottomSheetFooter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FluxerButton.primary(
                label: controller.buttonLabel(l10n),
                isLoading: controller.isCreating,
                onPressed: disabled
                    ? null
                    : () => unawaited(
                        controller.handleCreateWithDuplicateCheck(context, ref),
                      ),
              ),
              const SizedBox(height: 8),
              FluxerButton.secondary(
                label: l10n.cancel,
                onPressed: widget.onClose,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
