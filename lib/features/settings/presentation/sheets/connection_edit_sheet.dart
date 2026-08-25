import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/connections_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_toggle_switch.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class _VisibilityFlag {
  static const int everyone = 1;
  static const int friends = 2;
  static const int mutualGuilds = 4;
}

class ConnectionEditSheet {
  const ConnectionEditSheet._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required ConnectionResponse connection,
  }) {
    final l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.connectionEditTitle,
      useRootNavigator: true,
      builder: (sheetContext, close) =>
          _ConnectionEditBody(connection: connection, close: close),
    );
  }
}

class _ConnectionEditBody extends ConsumerStatefulWidget {
  const _ConnectionEditBody({required this.connection, required this.close});

  final ConnectionResponse connection;
  final VoidCallback close;

  @override
  ConsumerState<_ConnectionEditBody> createState() =>
      _ConnectionEditBodyState();
}

class _ConnectionEditBodyState extends ConsumerState<_ConnectionEditBody> {
  late int _flags = widget.connection.visibilityFlags;

  bool _hasFlag(int flag) => (_flags & flag) == flag;

  void _toggle(int flag, bool value) {
    setState(() {
      _flags = value ? (_flags | flag) : (_flags & ~flag);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final everyoneEnabled = _hasFlag(_VisibilityFlag.everyone);

    return Padding(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.connectionEditDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s3),
          FluxerToggleSwitch(
            label: l10n.connectionVisibilityEveryone,
            description: l10n.connectionVisibilityEveryoneDesc,
            value: everyoneEnabled,
            onChanged: (v) => _toggle(_VisibilityFlag.everyone, v),
          ),
          SizedBox(height: layout.s3),
          FluxerToggleSwitch(
            label: l10n.connectionVisibilityFriends,
            description: l10n.connectionVisibilityFriendsDesc,
            value: everyoneEnabled || _hasFlag(_VisibilityFlag.friends),
            onChanged: (v) => _toggle(_VisibilityFlag.friends, v),
            enabled: !everyoneEnabled,
          ),
          SizedBox(height: layout.s3),
          FluxerToggleSwitch(
            label: l10n.connectionVisibilityCommunityMembers,
            description: l10n.connectionVisibilityCommunityMembersDesc,
            value: everyoneEnabled || _hasFlag(_VisibilityFlag.mutualGuilds),
            onChanged: (v) => _toggle(_VisibilityFlag.mutualGuilds, v),
            enabled: !everyoneEnabled,
          ),
          SizedBox(height: layout.s4),
          FluxerButton.primary(label: l10n.save, onPressedAsync: _save),
        ],
      ),
    );
  }

  Future<void> _save() async {
    final l10n = FluxerLocalizations.of(context);
    try {
      await ref
          .read(connectionsViewModelProvider.notifier)
          .updateVisibility(
            widget.connection.type.toJson(),
            widget.connection.id,
            _flags,
          );
      if (mounted) {
        widget.close();
      }
    } on Object catch (_) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.connectionUpdateFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }
}
