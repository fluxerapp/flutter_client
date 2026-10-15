import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/presentation/add_account_screen.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/account_switcher_sheet.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/domain/presence_status_labels.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/status_change_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kRowIconSize = 32;
const double _kRowGlyphSize = 18;
const double _kStatusGlyphSize = 16;
const double _kTitleMaxWidthRatio = 0.6;
const double _kStackAvatarSize = 24;
const double _kStackAvatarRing = 2;
const double _kStackAvatarOverlap = 10;
const int _kMaxStackedAvatars = 3;

class UserProfileSelfCard extends ConsumerStatefulWidget {
  const UserProfileSelfCard({super.key});

  @override
  ConsumerState<UserProfileSelfCard> createState() =>
      _UserProfileSelfCardState();
}

class _UserProfileSelfCardState extends ConsumerState<UserProfileSelfCard> {
  @override
  void initState() {
    super.initState();
    unawaited(ref.read(accountManagerProvider.notifier).loadAccounts());
  }

  Future<void> _addAccount() async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => const AddAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final List<StoredAccount> others = ref
        .watch(accountManagerProvider.select((state) => state.accounts))
        .where((StoredAccount account) => account.userId != currentUserId)
        .toList();
    final bool canSwitch = others.isNotEmpty;
    final UserSettingsResponse? settings = ref.watch(
      userSettingsStatusProvider,
    );
    final String status = settings?.status ?? 'online';
    final String statusLabel = presenceStatusLabel(status, l10n);
    final CustomStatusResponse? normalizedCustomStatus = normalizeCustomStatus(
      settings?.customStatus,
    );
    final String? customStatus = serializeCustomStatus(normalizedCustomStatus);
    final String customStatusText = normalizedCustomStatus?.text?.trim() ?? '';
    final bool hasCustomStatus = hasVisibleCustomStatus(customStatus);
    final Color statusColor = resolveStatusColor(context, status);
    final TextStyle valueStyle = context.textStyles.bodySmall.copyWith(
      color: colors.textSecondary,
    );

    return FluxerMenuGroup(
      color: colors.backgroundSecondary,
      borderRadius: layout.radiusXl,
      children: [
        _SelfCardRow(
          semanticLabel: <String>[
            l10n.statusChangeSheetTitle,
            statusLabel,
            if (customStatusText.isNotEmpty) customStatusText,
          ].join(', '),
          onTap: () => unawaited(StatusChangeSheet.show(context)),
          icon: _RowIcon(
            background: statusColor.withValues(alpha: 0.16),
            child: FluxerStatusIndicator(
              status: status,
              size: _kStatusGlyphSize,
            ),
          ),
          title: l10n.statusChangeSheetTitle,
          value: hasCustomStatus
              ? CustomStatusDisplay(
                  stored: customStatus,
                  maxLines: 1,
                  trailing: true,
                  textStyle: valueStyle,
                )
              : Text(
                  statusLabel,
                  style: valueStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
        ),
        _SelfCardRow(
          semanticLabel: canSwitch
              ? l10n.profileTabMenuSwitchAccounts
              : l10n.accountAdd,
          onTap: canSwitch
              ? () => unawaited(AccountSwitcherSheet.show(context))
              : () => unawaited(_addAccount()),
          icon: _RowIcon(
            background: colors.backgroundTertiary,
            child: PhosphorIcon(
              canSwitch ? PhosphorIconsBold.users : PhosphorIconsBold.plus,
              size: _kRowGlyphSize,
              color: colors.textPrimary,
            ),
          ),
          title: canSwitch
              ? l10n.profileTabMenuSwitchAccounts
              : l10n.accountAdd,
          value: canSwitch
              ? ExcludeSemantics(child: _StackedAccountAvatars(others))
              : null,
        ),
      ],
    );
  }
}

class _RowIcon extends StatelessWidget {
  const _RowIcon({required this.background, required this.child});

  final Color background;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: _kRowIconSize,
      child: DecoratedBox(
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: Center(child: child),
      ),
    );
  }
}

class _SelfCardRow extends StatelessWidget {
  const _SelfCardRow({
    required this.semanticLabel,
    required this.onTap,
    required this.icon,
    required this.title,
    this.value,
  });

  final String semanticLabel;
  final VoidCallback onTap;
  final Widget icon;
  final String title;
  final Widget? value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final Widget? trailingValue = value;
    return FluxerTappable(
      onTap: onTap,
      semanticLabel: semanticLabel,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) =>
          AnimatedContainer(
            duration: context.motion.fast,
            curve: context.motion.curve,
            color: states.contains(WidgetState.pressed)
                ? colors.backgroundModifierHover.withValues(alpha: 0.45)
                : Colors.transparent,
            padding: EdgeInsets.symmetric(
              horizontal: layout.s4,
              vertical: layout.s3,
            ),
            child: Row(
              children: [
                icon,
                SizedBox(width: layout.s3),
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) =>
                            Row(
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        constraints.maxWidth *
                                        _kTitleMaxWidthRatio,
                                  ),
                                  child: Text(
                                    title,
                                    style: textStyles.label.copyWith(
                                      color: colors.textPrimary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: layout.s3),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: trailingValue,
                                  ),
                                ),
                              ],
                            ),
                  ),
                ),
                SizedBox(width: layout.s2),
                PhosphorIcon(
                  PhosphorIconsBold.caretRight,
                  size: 18,
                  color: colors.textPrimaryMuted,
                ),
              ],
            ),
          ),
    );
  }
}

class _StackedAccountAvatars extends StatelessWidget {
  const _StackedAccountAvatars(this.accounts);

  final List<StoredAccount> accounts;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final List<StoredAccount> shown = accounts
        .take(_kMaxStackedAvatars)
        .toList();
    const double step = _kStackAvatarSize - _kStackAvatarOverlap;

    return SizedBox(
      width: _stackedAvatarsWidth(shown.length),
      height: _kStackAvatarSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = shown.length - 1; i >= 0; i--)
            Positioned(
              left: step * i,
              top: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.backgroundSecondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(_kStackAvatarRing),
                  child: FluxerAvatar.user(
                    userId: shown[i].userId,
                    imageUrl: shown[i].avatarUrl(),
                    fallbackText: shown[i].displayName,
                    showStatus: false,
                    size: _kStackAvatarSize - 2 * _kStackAvatarRing,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

double _stackedAvatarsWidth(int count) =>
    _kStackAvatarSize +
    (_kStackAvatarSize - _kStackAvatarOverlap) *
        (math.min(count, _kMaxStackedAvatars) - 1);
