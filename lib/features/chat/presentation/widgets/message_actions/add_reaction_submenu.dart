import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_loader.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const int kAddReactionSubmenuCount = 16;
const double _kAddReactionEmojiSize = 22;

class AddReactionSubmenuItems extends ConsumerStatefulWidget {
  const AddReactionSubmenuItems({
    required this.channelId,
    required this.guildId,
    required this.onReaction,
    required this.onOpenPicker,
    super.key,
  });

  final String channelId;
  final String? guildId;
  final ValueChanged<QuickReactionItem> onReaction;
  final VoidCallback onOpenPicker;

  @override
  ConsumerState<AddReactionSubmenuItems> createState() =>
      _AddReactionSubmenuItemsState();
}

class _AddReactionSubmenuItemsState
    extends ConsumerState<AddReactionSubmenuItems> {
  List<QuickReactionItem> _items = const <QuickReactionItem>[];

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    final List<QuickReactionItem>? items = await loadQuickReactionItems(
      ref,
      channelId: widget.channelId,
      guildId: widget.guildId,
      count: kAddReactionSubmenuCount,
    );
    if (!mounted || items == null) {
      return;
    }
    setState(() => _items = items);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (final QuickReactionItem item in _items)
          FluxerDesktopMenuRow(
            label: quickReactionShortcode(item),
            onTap: () => widget.onReaction(item),
            trailing: SizedBox.square(
              dimension: _kAddReactionEmojiSize,
              child: Center(
                child: QuickReactionGlyph(
                  item: item,
                  size: _kAddReactionEmojiSize,
                ),
              ),
            ),
          ),
        if (_items.isNotEmpty) const FluxerMenuDivider(),
        FluxerMenuItem(
          label: FluxerLocalizations.of(context).chatMessageOtherReaction,
          onPressed: widget.onOpenPicker,
        ),
      ],
    );
  }
}
