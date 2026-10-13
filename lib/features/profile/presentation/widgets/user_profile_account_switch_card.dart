import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/presentation/add_account_screen.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/profile_tab_menu_sheet.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kStackAvatarSize = 28;
const double _kStackAvatarRing = 2;
const double _kStackAvatarOverlap = 10;
const int _kMaxStackedAvatars = 3;

class UserProfileAccountSwitchCard extends ConsumerStatefulWidget {
  const UserProfileAccountSwitchCard({super.key});

  @override
  ConsumerState<UserProfileAccountSwitchCard> createState() =>
      _UserProfileAccountSwitchCardState();
}

class _UserProfileAccountSwitchCardState
    extends ConsumerState<UserProfileAccountSwitchCard> {
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
    final textStyles = context.textStyles;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final List<StoredAccount> others = ref
        .watch(accountManagerProvider.select((state) => state.accounts))
        .where((StoredAccount account) => account.userId != currentUserId)
        .toList();
    final bool canSwitch = others.isNotEmpty;

    return FluxerTappable(
      onTap: canSwitch
          ? () => unawaited(ProfileTabMenuSheet.show(context, ref))
          : () => unawaited(_addAccount()),
      builder: (context, _) => DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: layout.radiusXl,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: layout.s4,
            vertical: layout.s3,
          ),
          child: Row(
            children: [
              if (canSwitch)
                ExcludeSemantics(child: _StackedAccountAvatars(others))
              else
                SizedBox(
                  width: _kStackAvatarSize,
                  height: _kStackAvatarSize,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.backgroundTertiary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: PhosphorIcon(
                        PhosphorIconsBold.plus,
                        size: 14,
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                ),
              SizedBox(width: layout.s3),
              Expanded(
                child: Text(
                  canSwitch
                      ? l10n.profileTabMenuSwitchAccounts
                      : l10n.accountAdd,
                  style: textStyles.label.copyWith(
                    color: colors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
    final double width = _kStackAvatarSize + step * (shown.length - 1);

    return SizedBox(
      width: width,
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
