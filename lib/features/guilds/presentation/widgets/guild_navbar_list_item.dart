part of 'guild_navbar.dart';

int _guildNavbarIconMemCache(BuildContext context, double logicalSize) =>
    (logicalSize * MediaQuery.devicePixelRatioOf(context)).round();

class GuildNavbarIconShape extends StatelessWidget {
  const GuildNavbarIconShape({
    required this.isActive,
    required this.child,
    this.hasImage = false,
    this.isUnavailable = false,
    super.key,
  });

  static const double size = 48;
  static const double idleRadius = size * 0.5;
  static const double activeRadius = size * 0.3;
  static const double itemSpacing = 8;

  final bool isActive;
  final bool hasImage;
  final bool isUnavailable;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final double target = isActive ? 1 : 0;
    final Color idleBackground = isUnavailable
        ? colors.statusDanger
        : hasImage
        ? Colors.transparent
        : colors.serverIconBackground;
    final Color activeBackground = isUnavailable || hasImage
        ? idleBackground
        : colors.brandPrimary;
    final Color idleForeground = isUnavailable
        ? colors.textOnBrandPrimary
        : colors.textPrimary;
    return TweenAnimationBuilder<double>(
      duration: context.motion.hover,
      curve: Curves.easeOut,
      tween: Tween<double>(begin: target, end: target),
      builder: (BuildContext context, double t, Widget? child) => ClipRRect(
        borderRadius: BorderRadius.circular(
          idleRadius + (activeRadius - idleRadius) * t,
        ),
        child: ColoredBox(
          color: Color.lerp(idleBackground, activeBackground, t)!,
          child: SizedBox.square(
            dimension: size,
            child: IconTheme.merge(
              data: IconThemeData(
                color: Color.lerp(idleForeground, colors.textOnBrandPrimary, t),
              ),
              child: child!,
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}

class GuildNavbarPill extends StatelessWidget {
  const GuildNavbarPill({required this.height, this.faded = false, super.key});

  static const double width = 4;
  static const double selectedHeight = 40;
  static const double hoverHeight = 20;
  static const double unreadHeight = 8;
  static const double badgeInset = -4;

  final double height;
  final bool faded;

  @override
  Widget build(BuildContext context) {
    if (height <= 0) {
      return const SizedBox.shrink();
    }
    final Color color = context.colors.textPrimary;
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: faded ? color.withValues(alpha: color.a * 0.5) : color,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(width),
          ),
        ),
      ),
    );
  }
}

class _GuildListItem extends StatefulWidget {
  final String label;
  final Guild? guild;
  final bool isSelected;
  final int permissions;
  final bool isOwner;
  final bool isUnavailable;
  final int unavailableCount;
  final bool isMuted;
  final DateTime? muteEndTime;
  final bool hideMutedChannels;
  final VoiceActivityType voiceActivity;
  final IconData? icon;
  final VoidCallback onTap;
  final VoidCallback? onMenuOpened;
  final String? iconUrl;
  final bool hasUnread;
  final int mentionCount;
  final bool guildUnreadReady;
  final bool invitesPaused;
  final bool developerMode;
  final VoidCallback? onMarkAsRead;
  final VoidCallback? onLeaveGuild;
  final Future<void> Function(String guildId)? onDeleteMyMessages;
  final void Function(GuildAction)? onGuildSettingsAction;
  final void Function(String name)? onCreateCategory;
  final void Function(ChannelCreateRequest request)? onCreateChannel;
  final Future<({String url, String channelName, bool useVanityUrl})?>
  Function({int maxAge, int maxUses, bool temporary})?
  onCreateInvite;
  final Future<List<InvitePeopleRecipient>> Function()? onGetRecipients;
  final Future<void> Function(
    String? channelId,
    String? recipientId,
    String inviteUrl,
  )?
  onSendInviteTo;
  final Future<({bool isDmsAllowed, bool isBotDmsAllowed})> Function()?
  onGetPrivacyState;
  final void Function({required bool allowed})? onToggleDms;
  final void Function({required bool allowed})? onToggleBotDms;
  final Future<Map<String, Object?>> Function()? onGetGuildDebugJson;
  final void Function(FluxerToast toast)? onShowToast;
  final Future<
    ({
      bool muted,
      int messageNotifications,
      bool suppressEveryone,
      bool suppressRoles,
      bool mobilePush,
      Map<String, ({int messageNotifications, bool muted})> channelOverrides,
    })
  >
  Function()?
  onGetNotificationSettings;
  final void Function({
    bool? muted,
    UserNotificationSettings? messageNotifications,
    bool? suppressEveryone,
    bool? suppressRoles,
    bool? mobilePush,
  })?
  onUpdateNotificationSetting;
  final Future<
    List<({String id, String name, int type, String? parentId, int position})>
  >
  Function()?
  onGetGuildChannels;
  final void Function(
    String channelId,
    int messageNotifications, {
    required bool muted,
  })?
  onUpdateChannelOverride;
  final void Function(String channelId)? onRemoveChannelOverride;
  final VoidCallback? onMounted;
  final bool enableLongPressMenu;
  final bool opaqueHitTarget;
  final Future<int> Function()? resolveMenuPermissions;
  final Future<bool> Function()? resolveCanInvite;

  const _GuildListItem({
    required this.label,
    required this.onTap,
    super.key,
    this.guild,
    this.isSelected = false,
    this.permissions = 0,
    this.isOwner = false,
    this.isUnavailable = false,
    this.unavailableCount = 0,
    this.isMuted = false,
    this.muteEndTime,
    this.hideMutedChannels = false,
    this.voiceActivity = VoiceActivityType.none,
    this.icon,
    this.iconUrl,
    this.onMenuOpened,
    this.hasUnread = false,
    this.mentionCount = 0,
    this.guildUnreadReady = true,
    this.invitesPaused = false,
    this.developerMode = false,
    this.onMarkAsRead,
    this.onLeaveGuild,
    this.onDeleteMyMessages,
    this.onGuildSettingsAction,
    this.onCreateCategory,
    this.onCreateChannel,
    this.onCreateInvite,
    this.onGetRecipients,
    this.onSendInviteTo,
    this.onGetPrivacyState,
    this.onToggleDms,
    this.onToggleBotDms,
    this.onGetGuildDebugJson,
    this.onShowToast,
    this.onGetNotificationSettings,
    this.onUpdateNotificationSetting,
    this.onGetGuildChannels,
    this.onUpdateChannelOverride,
    this.onRemoveChannelOverride,
    this.onMounted,
    this.enableLongPressMenu = true,
    this.opaqueHitTarget = false,
    this.resolveMenuPermissions,
    this.resolveCanInvite,
  });

  @override
  State<_GuildListItem> createState() => _GuildListItemState();
}

@visibleForTesting
Widget guildListItemForTest({
  required String label,
  bool isSelected = false,
  int mentionCount = 0,
}) => _GuildListItem(
  label: label,
  onTap: () {},
  isSelected: isSelected,
  mentionCount: mentionCount,
);
