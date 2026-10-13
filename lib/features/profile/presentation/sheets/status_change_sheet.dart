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
import 'package:fluxer_app/features/ui/selected_check/fluxer_selected_check.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
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

  void _selectPresence(PresenceStatus status, {Duration? duration}) {
    final UserStatusService service = ref.read(userStatusServiceProvider);
    widget.onClose();
    unawaited(
      service
          .setPresenceStatus(status: status, duration: duration)
          .catchError((Object _) {}),
    );
  }

  void _clearCustomStatus() {
    unawaited(
      ref
          .read(userStatusServiceProvider)
          .clearCustomStatus()
          .catchError((Object _) {}),
    );
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

    return FluxerBottomSheetGroupColumn(
      children: [
        AnimatedSize(
          duration: _kStatusCollapseDuration,
          curve: Curves.easeInOutCubic,
          alignment: Alignment.topCenter,
          child: _buildCustomStatusSection(l10n, customStatus),
        ),
        FluxerBottomSheetSection(
          title: l10n.statusOnlineStatusSection,
          padding: EdgeInsets.zero,
          child: FluxerMenuGroup(
            children: [
              for (final PresenceStatus status in kSelectablePresenceStatuses)
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
          onTap: _clearCustomStatus,
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

const Duration _kStatusRevealDuration = Duration(milliseconds: 300);
const Duration _kStatusCollapseDuration = Duration(milliseconds: 220);
const double _kStatusOptionInset = 48;

class _ExpandableStatusMenuItem extends StatefulWidget {
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
  final void Function(PresenceStatus status, {Duration? duration})
  onSelectPresence;

  @override
  State<_ExpandableStatusMenuItem> createState() =>
      _ExpandableStatusMenuItemState();
}

class _ExpandableStatusMenuItemState extends State<_ExpandableStatusMenuItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _kStatusRevealDuration,
    reverseDuration: _kStatusCollapseDuration,
    value: widget.isExpanded ? 1 : 0,
  );
  late final CurvedAnimation _size = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInOutCubic,
  );
  late final CurvedAnimation _fade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.2, 1, curve: Curves.easeOut),
    reverseCurve: const Interval(0.4, 1, curve: Curves.easeIn),
  );

  @override
  void didUpdateWidget(covariant _ExpandableStatusMenuItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isExpanded == widget.isExpanded) {
      return;
    }
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = widget.isExpanded ? 1 : 0;
      return;
    }
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _size.dispose();
    _fade.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final PresenceStatus status = widget.status;
    final String statusValue = status.json ?? 'online';
    final bool isSelected = widget.currentStatus == statusValue;
    final String? description = presenceStatusDescription(statusValue, l10n);
    final bool hasExpiryOptions = status != PresenceStatus.online;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FluxerBottomSheetMenuItem(
          label: presenceStatusLabel(statusValue, l10n),
          hint: description,
          leading: FluxerStatusIndicator(status: statusValue, size: 14),
          isSelected: isSelected,
          trailing: hasExpiryOptions
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSelected) ...[
                      const FluxerSelectedCheck(),
                      const SizedBox(width: 12),
                    ],
                    RotationTransition(
                      turns: Tween<double>(begin: 0, end: 0.25).animate(_size),
                      child: PhosphorIcon(
                        PhosphorIconsBold.caretRight,
                        size: 16,
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                )
              : null,
          onTap: () {
            if (!hasExpiryOptions) {
              widget.onSelectPresence(status);
              return;
            }
            widget.onToggleExpanded();
          },
        ),
        if (hasExpiryOptions)
          SizeTransition(
            sizeFactor: _size,
            alignment: AlignmentDirectional.topStart,
            child: FadeTransition(
              opacity: _fade,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final TimeWindowPreset preset in widget.expiryPresets)
                    _StatusExpiryOption(
                      label: statusExpiryLabel(preset.key, l10n),
                      onTap: () => widget.onSelectPresence(
                        status,
                        duration: minutesToDuration(preset.minutes),
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _StatusExpiryOption extends StatelessWidget {
  const _StatusExpiryOption({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTappable(
      onTap: onTap,
      semanticLabel: label,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool isPressed = states.contains(WidgetState.pressed);
        return ColoredBox(
          color: isPressed ? colors.listItemPressedBg : Colors.transparent,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: _kStatusOptionInset,
              end: 16,
            ),
            child: SizedBox(
              height: 44,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  label,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
