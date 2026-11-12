part of '../user_area_popout.dart';

const double _kStatusFlyoutWidth = 280;
const double _kAccountFlyoutWidth = 280;
const Key kUserAreaPopoutCopyVoiceDiagnosticsKey = Key(
  'user-area-popout-copy-voice-diagnostics',
);

class _DesktopUserAreaCard extends ConsumerStatefulWidget {
  const _DesktopUserAreaCard({required this.onClose});

  final VoidCallback onClose;

  @override
  ConsumerState<_DesktopUserAreaCard> createState() =>
      _DesktopUserAreaCardState();
}

class _DesktopUserAreaCardState extends ConsumerState<_DesktopUserAreaCard> {
  final ScrollController _scrollController = ScrollController();
  bool _hovered = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  BuildContext get _rootContext =>
      Navigator.of(context, rootNavigator: true).context;

  void _openFullProfile(String userId) {
    final BuildContext host = _rootContext;
    widget.onClose();
    unawaited(FluxerUserProfileSheet.showFull(host, userId: userId));
  }

  void _openEditProfile() {
    final BuildContext host = _rootContext;
    widget.onClose();
    unawaited(UserSettingsModal.show(host, openProfileSection: true));
  }

  void _openManageAccounts() {
    final BuildContext host = _rootContext;
    widget.onClose();
    unawaited(AccountSwitcherSheet.show(host));
  }

  void _openCustomStatus(CustomStatusResponse? existing) {
    final BuildContext host = _rootContext;
    widget.onClose();
    unawaited(CustomStatusSheet.show(host, existing: existing));
  }

  @override
  Widget build(BuildContext context) {
    final CurrentUserCachedProfile? profile = ref.watch(
      currentUserCachedProfileProvider,
    );
    if (profile == null) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final UserSettingsResponse? settings = ref.watch(
      userSettingsStatusProvider,
    );
    final String status = settings?.status ?? 'online';
    final CustomStatusResponse? customStatus = normalizeCustomStatus(
      settings?.customStatus,
    );
    final String? customStatusText = ref
        .watch(userPresenceProvider(profile.id))
        .value
        ?.customStatus;
    final String displayName = profile.globalName ?? profile.username;
    final String userTag = formatUserTag(
      profile.username,
      profile.discriminator,
      uniqueUsernames: true,
    );
    final String? pronouns = profile.pronouns?.trim();
    final String? bio = profile.bio?.trim();
    final bool isInCall = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.isConnected),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: UserProfilePopoutFrame(
        scrollController: _scrollController,
        accentColor: resolveGuildProfileBannerColor(
          bannerColor: null,
          accentColor: profile.accentColor,
          avatarColor: profile.avatarColor,
        ),
        bannerUrl: FluxerMediaUrl.userBanner(
          userId: profile.id,
          hash: profile.banner,
          animated: true,
        ),
        badges: ref.watch(ownProfileBadgesProvider),
        avatar: UserProfileIdentityAvatar(
          userId: profile.id,
          displayName: displayName,
          avatarUrl: FluxerMediaUrl.userAvatar(
            userId: profile.id,
            hash: profile.avatar,
            size: MediaProxySizes.avatarProfile,
            animated: true,
          ),
          avatarColor: profile.avatarColor,
          showStatus: true,
          onTap: () => _openFullProfile(profile.id),
        ),
        footer: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _ActionGroup(
              children: <Widget>[
                FluxerDesktopHoverFlyout(
                  width: _kStatusFlyoutWidth,
                  flyoutBuilder: (BuildContext _) =>
                      StatusFlyoutMenu(onClose: widget.onClose),
                  child: _ActionRow(
                    icon: FluxerStatusIndicator(status: status, size: 14),
                    label: presenceStatusLabel(status, l10n),
                    showChevron: true,
                  ),
                ),
                FluxerDesktopHoverFlyout(
                  width: _kAccountFlyoutWidth,
                  flyoutBuilder: (BuildContext _) =>
                      AccountSwitcherSheetBody(onClose: widget.onClose),
                  child: _ActionRow(
                    icon: const PhosphorIcon(
                      PhosphorIconsBold.usersThree,
                      size: 16,
                    ),
                    label: l10n.profileTabMenuSwitchAccounts,
                    showChevron: true,
                    onTap: _openManageAccounts,
                  ),
                ),
                _ActionRow(
                  icon: const PhosphorIcon(
                    PhosphorIconsBold.identificationBadge,
                    size: 16,
                  ),
                  label: l10n.userProfileCopyUserId,
                  onTap: () => unawaited(
                    copyToClipboard(context: context, value: profile.id),
                  ),
                ),
                _ActionRow(
                  key: kUserAreaPopoutCopyVoiceDiagnosticsKey,
                  icon: const PhosphorIcon(
                    PhosphorIconsBold.chartLine,
                    size: 16,
                  ),
                  label: l10n.voiceDiagnosticsCopy,
                  hint: isInCall ? l10n.voiceDiagnosticsInCallHint : null,
                  onTap: () => unawaited(copyVoiceDiagnostics(context)),
                ),
              ],
            ),
            SizedBox(height: layout.s3),
            FluxerButton.primary(
              label: l10n.userProfileEditProfile,
              icon: PhosphorIconsBold.pencil,
              onPressed: _openEditProfile,
            ),
          ],
        ),
        children: <Widget>[
          Text(
            displayName,
            style: textStyles.heading.copyWith(
              color: colors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  userTag,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Opacity(
                opacity: _hovered ? 1 : 0,
                child: _CopyUsernameButton(
                  semanticLabel: l10n.userProfileCopyUsername,
                  onTap: () => unawaited(
                    copyToClipboard(context: context, value: userTag),
                  ),
                ),
              ),
            ],
          ),
          if (pronouns != null && pronouns.isNotEmpty)
            Text(
              pronouns,
              style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
            ),
          SizedBox(height: layout.s1),
          if (hasVisibleCustomStatus(customStatusText))
            FluxerTappable(
              onTap: () => _openCustomStatus(customStatus),
              builder: (BuildContext _, Set<WidgetState> states) =>
                  UserProfileCustomStatus(text: customStatusText),
            )
          else
            _SetCustomStatusRow(
              label: l10n.customStatusSetTitle,
              onTap: () => _openCustomStatus(customStatus),
            ),
          if (bio != null && bio.isNotEmpty) ...<Widget>[
            SizedBox(height: layout.s3),
            MessageMarkdown(
              data: bio,
              markdownContext: FluxerMarkdownContext.restrictedUserBio,
              baseStyle: textStyles.bodySmall.copyWith(
                color: colors.textChat,
                height: 1.35,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ActionGroup extends StatelessWidget {
  const _ActionGroup({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: colors.backgroundSecondaryAlt,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int index = 0; index < children.length; index++) ...<Widget>[
            if (index > 0)
              Container(
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: colors.backgroundHeaderSecondary.withValues(alpha: 0.3),
              ),
            children[index],
          ],
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.icon,
    required this.label,
    this.hint,
    this.showChevron = false,
    this.onTap,
    super.key,
  });

  final Widget icon;
  final String label;
  final String? hint;
  final bool showChevron;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTappable(
      onTap: onTap ?? () {},
      semanticLabel: label,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          color: states.contains(WidgetState.hovered)
              ? colors.backgroundModifierHover
              : Colors.transparent,
          child: Row(
            children: <Widget>[
              SizedBox.square(
                dimension: 22,
                child: Center(
                  child: IconTheme.merge(
                    data: IconThemeData(color: colors.textSecondary),
                    child: icon,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: fluxerDesktopMenuLabelStyle(
                    context,
                  ).copyWith(color: colors.textPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (hint case final String hintText) ...<Widget>[
                const SizedBox(width: 8),
                Text(
                  hintText,
                  style: fluxerDesktopMenuLabelStyle(
                    context,
                  ).copyWith(color: colors.textTertiary, fontSize: 12),
                  maxLines: 1,
                ),
              ],
              if (showChevron)
                PhosphorIcon(
                  PhosphorIconsBold.caretRight,
                  size: kFluxerDesktopMenuCaretSize,
                  color: colors.textTertiary,
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SetCustomStatusRow extends StatelessWidget {
  const _SetCustomStatusRow({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color color = context.colors.textTertiary;
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: FluxerTappable(
        onTap: onTap,
        semanticLabel: label,
        excludeChildSemantics: true,
        builder: (BuildContext context, Set<WidgetState> states) => Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhosphorIcon(PhosphorIconsRegular.smiley, size: 14, color: color),
            const SizedBox(width: 3),
            Text(
              label,
              style: context.textStyles.timestamp.copyWith(
                fontSize: 12,
                height: 16 / 12,
                color: color,
                decoration: states.contains(WidgetState.hovered)
                    ? TextDecoration.underline
                    : null,
                decorationColor: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CopyUsernameButton extends StatelessWidget {
  const _CopyUsernameButton({required this.semanticLabel, required this.onTap});

  final String semanticLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTappable(
      onTap: onTap,
      semanticLabel: semanticLabel,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = states.contains(WidgetState.hovered);
        return Container(
          width: 20,
          height: 20,
          margin: const EdgeInsetsDirectional.only(start: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: hovered
                ? colors.backgroundModifierHover
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: PhosphorIcon(
            PhosphorIconsFill.copy,
            size: 14,
            color: hovered ? colors.textPrimary : colors.textTertiary,
          ),
        );
      },
    );
  }
}
