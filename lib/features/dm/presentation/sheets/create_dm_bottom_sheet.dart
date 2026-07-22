import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/create_dm_body.dart';
import 'package:fluxer_app/features/dm/providers/create_dm_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class CreateDmBottomSheet {
  CreateDmBottomSheet._();

  static Future<void> show(
    BuildContext context, {
    CreateDmOptions options = const CreateDmOptions(),
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.createDmSelectFriends,
      subtitle: Text(
        l10n.createDmChooseFriendsSubtitle,
        style: TextStyle(
          color: context.colors.textSecondary,
          fontSize: 13,
          height: 1.4,
        ),
      ),
      useRootNavigator: true,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      builder: (sheetContext, scrollController, close) {
        return _CreateDmBottomSheetBody(
          options: options,
          scrollController: scrollController,
          onClose: close,
        );
      },
    );
  }
}

class _CreateDmBottomSheetBody extends ConsumerStatefulWidget {
  const _CreateDmBottomSheetBody({
    required this.options,
    required this.scrollController,
    required this.onClose,
  });

  final CreateDmOptions options;
  final ScrollController scrollController;
  final VoidCallback onClose;

  @override
  ConsumerState<_CreateDmBottomSheetBody> createState() =>
      _CreateDmBottomSheetBodyState();
}

class _CreateDmBottomSheetBodyState
    extends ConsumerState<_CreateDmBottomSheetBody> {
  CreateDmController? _controller;
  bool _isClosing = false;

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
    )..addListener(_handleControllerChanged);
    _controller = controller;
  }

  @override
  void dispose() {
    _controller
      ?..removeListener(_handleControllerChanged)
      ..dispose();
    super.dispose();
  }

  void _handleControllerChanged() {
    if (!mounted || _isClosing) {
      return;
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
    final bool disabled =
        controller.isCreating || controller.restriction != null;
    return Column(
      children: <Widget>[
        Expanded(
          child: CreateDmBody(
            controller: controller,
            scrollController: widget.scrollController,
            showInlineSearch: true,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            context.layout.s3,
            context.layout.s4,
            context.layout.s4,
          ),
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
