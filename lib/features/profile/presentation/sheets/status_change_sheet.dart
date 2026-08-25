import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/domain/presence_status_labels.dart';
import 'package:fluxer_app/features/profile/domain/time_window_presets.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/custom_status_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_status_service.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const List<PresenceStatus> kSelectablePresenceStatuses = <PresenceStatus>[
  PresenceStatus.online,
  PresenceStatus.idle,
  PresenceStatus.dnd,
  PresenceStatus.invisible,
];

class StatusChangeSheet {
  StatusChangeSheet._();

  static Future<void> show(BuildContext context) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).statusChangeSheetTitle,
      variant: FluxerBottomSheetVariant.menu,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return FluxerBottomSheetContent(
          child: StatusChangeSheetBody(onClose: close),
        );
      },
    );
  }
}

class StatusChangeSheetBody extends ConsumerStatefulWidget {
  const StatusChangeSheetBody({required this.onClose, super.key});

  final VoidCallback onClose;

  @override
  ConsumerState<StatusChangeSheetBody> createState() =>
      _StatusChangeSheetBodyState();
}

class _StatusChangeSheetBodyState extends ConsumerState<StatusChangeSheetBody> {
  PresenceStatus? _expandedStatus;
  bool _isSaving = false;

  Future<void> _selectPresence(
    PresenceStatus status, {
    Duration? duration,
  }) async {
    if (_isSaving) {
      return;
    }
    setState(() => _isSaving = true);
    try {
      await ref
          .read(userStatusServiceProvider)
          .setPresenceStatus(status: status, duration: duration);
      if (mounted) {
        widget.onClose();
      }
    } on Object {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _clearCustomStatus() async {
    if (_isSaving) {
      return;
    }
    setState(() => _isSaving = true);
    try {
      await ref.read(userStatusServiceProvider).clearCustomStatus();
      if (mounted) {
        setState(() => _isSaving = false);
      }
    } on Object {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _openCustomStatusEditor(CustomStatusResponse? existing) async {
    await CustomStatusSheet.show(
      context,
      existing: existing,
      onSaved: widget.onClose,
    );
  }

  void _toggleExpandedStatus(PresenceStatus status) {
    setState(() {
      _expandedStatus = _expandedStatus == status ? null : status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final UserSettingsResponse? settings = ref.watch(
      userSettingsStatusProvider,
    );
    final String currentStatus = settings?.status ?? 'online';
    final CustomStatusResponse? customStatus = normalizeCustomStatus(
      settings?.customStatus,
    );
    final bool includeDeveloperOptions = ref
        .watch(userSettingsViewModelProvider)
        .developerMode;
    final List<TimeWindowPreset> expiryPresets = getTimeWindowPresets(
      includeDeveloperOptions: includeDeveloperOptions,
    );

    return AbsorbPointer(
      absorbing: _isSaving,
      child: AnimatedOpacity(
        opacity: _isSaving ? 0.6 : 1.0,
        duration: context.motion.fast,
        child: FluxerBottomSheetGroupColumn(
          children: [
            _buildCustomStatusSection(l10n, customStatus),
            FluxerBottomSheetSection(
              title: l10n.statusOnlineStatusSection,
              padding: EdgeInsets.zero,
              child: FluxerMenuGroup(
                children: [
                  for (final PresenceStatus status
                      in kSelectablePresenceStatuses)
                    _ExpandableStatusMenuItem(
                      status: status,
                      currentStatus: currentStatus,
                      expiryPresets: expiryPresets,
                      isExpanded: _expandedStatus == status,
                      onToggleExpanded: () => _toggleExpandedStatus(status),
                      onSelectPresence: _selectPresence,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomStatusSection(
    FluxerLocalizations l10n,
    CustomStatusResponse? customStatus,
  ) {
    if (customStatus == null) {
      return FluxerMenuGroup(
        children: [
          FluxerBottomSheetMenuItem(
            label: l10n.customStatusSetTitle,
            icon: PhosphorIconsBold.smiley,
            onTap: () => unawaited(_openCustomStatusEditor(null)),
          ),
        ],
      );
    }
    final String? text = customStatus.text?.trim();
    final String displayText = text != null && text.isNotEmpty ? text : '';
    final Widget? emojiLeading = _customStatusMenuLeading(customStatus);
    return FluxerMenuGroup(
      children: [
        FluxerBottomSheetMenuItem(
          label: displayText.isEmpty ? l10n.customStatusSetTitle : displayText,
          hint: l10n.customStatusCurrentHint,
          leading: emojiLeading,
          icon: emojiLeading == null ? PhosphorIconsBold.smiley : null,
          onTap: () => unawaited(_openCustomStatusEditor(customStatus)),
        ),
        FluxerBottomSheetMenuItem(
          label: l10n.customStatusClear,
          icon: PhosphorIconsBold.x,
          onTap: () => unawaited(_clearCustomStatus()),
        ),
      ],
    );
  }

  Widget? _customStatusMenuLeading(CustomStatusResponse status) {
    final SnowflakeType? emojiId = status.emojiId;
    if (emojiId != null) {
      return CachedEmojiImage(
        emojiId: emojiId,
        animated: status.emojiAnimated,
        requestSize: kCustomStatusEmojiRequestSize,
        size: 20,
      );
    }
    final String? emojiName = status.emojiName;
    if (emojiName != null && emojiName.isNotEmpty) {
      return UnicodeEmojiWidget(emoji: emojiName, size: 20);
    }
    return null;
  }
}

class _ExpandableStatusMenuItem extends StatelessWidget {
  const _ExpandableStatusMenuItem({
    required this.status,
    required this.currentStatus,
    required this.expiryPresets,
    required this.isExpanded,
    required this.onToggleExpanded,
    required this.onSelectPresence,
  });

  final PresenceStatus status;
  final String currentStatus;
  final List<TimeWindowPreset> expiryPresets;
  final bool isExpanded;
  final VoidCallback onToggleExpanded;
  final Future<void> Function(PresenceStatus status, {Duration? duration})
  onSelectPresence;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String statusValue = status.json ?? 'online';
    final bool isSelected = currentStatus == statusValue;
    final String? description = presenceStatusDescription(statusValue, l10n);
    final bool hasExpiryOptions = status != PresenceStatus.online;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FluxerBottomSheetMenuItem(
          label: presenceStatusLabel(statusValue, l10n),
          hint: description,
          leading: FluxerStatusIndicator(status: statusValue, size: 14),
          isSelected: isSelected && !isExpanded,
          trailing: hasExpiryOptions
              ? AnimatedRotation(
                  turns: isExpanded ? 0.25 : 0,
                  duration: context.motion.normal,
                  curve: context.motion.curve,
                  child: PhosphorIcon(
                    PhosphorIconsBold.caretRight,
                    size: 20,
                    color: context.colors.textPrimaryMuted,
                  ),
                )
              : null,
          onTap: () {
            if (!hasExpiryOptions) {
              unawaited(onSelectPresence(status));
              return;
            }
            onToggleExpanded();
          },
        ),
        if (hasExpiryOptions)
          AnimatedSize(
            duration: context.motion.normal,
            curve: context.motion.curve,
            alignment: Alignment.topCenter,
            child: isExpanded
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final TimeWindowPreset preset in expiryPresets)
                        FluxerBottomSheetMenuItem(
                          label: statusExpiryLabel(preset.key, l10n),
                          onTap: () => unawaited(
                            onSelectPresence(
                              status,
                              duration: minutesToDuration(preset.minutes),
                            ),
                          ),
                        ),
                    ],
                  )
                : const SizedBox(width: double.infinity),
          ),
      ],
    );
  }
}
