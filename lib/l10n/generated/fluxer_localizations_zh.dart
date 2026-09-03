// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class FluxerLocalizationsZh extends FluxerLocalizations {
  FluxerLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get reconnectingTitle => '我们出错了！';

  @override
  String get reconnectingBody => '服务器出现问题。\n很快就会修复！';

  @override
  String get gatewayReconnectingToast => '正在重新连接…';

  @override
  String get gatewayConnectedToast => '已连接';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return '启动失败：$error';
  }

  @override
  String get retry => '重试';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => '连接已丢失';

  @override
  String get splashViewOnStatusPage => '查看状态页';

  @override
  String get splashConnectionIssuesPrompt => '连接有问题？';

  @override
  String get splashStatusPageLink => '状态页';

  @override
  String get splashReadIncident => '阅读事件详情';

  @override
  String get splashIncidentHistory => '事件历史';

  @override
  String get nagbarLearnMore => 'Learn more';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Maintenance is scheduled for $localizedTime. Expected duration: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Maintenance is in progress. Expected duration: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Maintenance is complete.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hey $displayName, claim your account to prevent losing access.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hey $displayName, please verify your email address.';
  }

  @override
  String get nagbarOpenSettings => 'Open settings';

  @override
  String get systemPermissionSettingsTitle => 'Enable permission';

  @override
  String get systemPermissionSettingsOpenSettings => 'Open settings';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName doesn\'t have access to your microphone. You can enable it in your device privacy settings.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName doesn\'t have access to your camera. You can enable it in your device privacy settings.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName doesn\'t have access to your photo library. You can enable it in your device privacy settings.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName doesn\'t have permission to send notifications. You can enable it in your device settings.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Your subscription failed to renew, but you still have access to $productName perks until $graceDate. Take action now or you\'ll lose all perks.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Your $productName subscription has expired. Renew now to keep your perks.';
  }

  @override
  String get nagbarManageSubscription => 'Manage subscription';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Welcome to $productFullName. Explore your $productName perks and manage your subscription.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'View $productName features';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'You have a new gift code waiting in your gift inventory.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'You have $count new gift codes waiting in your gift inventory.';
  }

  @override
  String get nagbarViewGiftInventory => 'View gift inventory';

  @override
  String get nagbarVisionaryMfa =>
      'Enable two-factor authentication to protect your Visionary account.';

  @override
  String get nagbarEnableMfa => 'Enable 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'We\'ve updated our terms. Please review and accept them to continue.';

  @override
  String get nagbarReviewTerms => 'Review terms';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Join $communityName to chat with the team and stay up to date.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Join $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Enable notifications so you don\'t miss messages and mentions.';

  @override
  String get nagbarEnableNotifications => 'Enable notifications';

  @override
  String get nagbarBillingPortalFailed =>
      'Couldn\'t open the billing portal. Please try again in a moment.';

  @override
  String get welcomeBack => '欢迎回来';

  @override
  String get email => '邮箱';

  @override
  String get emailInvalid => '请输入有效的邮箱地址。';

  @override
  String get password => '密码';

  @override
  String get forgotPassword => '忘记密码？';

  @override
  String get logIn => '登录';

  @override
  String get logInWithPasskey => '使用密匙登录';

  @override
  String continueWithSso(String provider) {
    return '使用 $provider 继续';
  }

  @override
  String get ssoRequired => '需要 SSO 才能访问此实例。';

  @override
  String get organizationSsoProvider => '使用您组织的单点登录提供商登录。';

  @override
  String get failedToStartSso => '启动 SSO 失败';

  @override
  String get ssoCancelled => 'SSO 登录已取消';

  @override
  String preferSso(String provider) {
    return '倾向于使用 SSO？使用 $provider 继续。';
  }

  @override
  String get logInViaBrowser => '通过浏览器登录';

  @override
  String get needAccountPrompt => '需要账号？ ';

  @override
  String get register => '注册';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => '验证您是人类';

  @override
  String get captchaDescription => '我们需要确保您不是机器人。请完成以下验证。';

  @override
  String get captchaSwitchToHcaptcha => '有问题？尝试 hCaptcha';

  @override
  String get captchaSwitchToTurnstile => '尝试 Turnstile';

  @override
  String get cancel => '取消';

  @override
  String get ipAuthCheckEmail => '查看您的邮箱';

  @override
  String ipAuthDescription(String email) {
    return '我们已发送一封邮件到 $email 以授权此次登录。请打开您的收件箱。';
  }

  @override
  String get ipAuthConnectionLost => '连接已丢失';

  @override
  String get ipAuthConnectionLostDescription => '等待授权时连接丢失。请重试。';

  @override
  String get ipAuthLinkExpired => '登录链接已过期';

  @override
  String get ipAuthLinkExpiredDescription => '此授权链接已过期。请重新登录。';

  @override
  String get ipAuthResendEmail => '重新发送邮件';

  @override
  String get ipAuthResent => '已重发';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds秒';
  }

  @override
  String get back => '返回';

  @override
  String get next => 'Next';

  @override
  String get mfaTitle => '两步验证';

  @override
  String get mfaChooseMethod => '选择一种验证方式';

  @override
  String get mfaMethodTotp => '身份验证器应用';

  @override
  String get mfaMethodWebauthn => '安全密钥 / 密匙';

  @override
  String get mfaTotpDescription => '请输入您的身份验证器应用中的 6 位数字代码或您的备用代码之一。';

  @override
  String get mfaCodeLabel => '代码';

  @override
  String get mfaTryAnotherMethod => '尝试其他方式';

  @override
  String get mfaUseSecurityKey => '尝试使用安全密钥/通行密钥';

  @override
  String get accountSelectorTitle => '选择一个账户';

  @override
  String get accountSelectorDescription => '选择一个账户继续，或添加另一个账户。';

  @override
  String get accountAdd => '添加账户';

  @override
  String get accountRemove => '移除';

  @override
  String accountRemoveTitle(String username) {
    return '移除 $username';
  }

  @override
  String get accountRemoveDescription => '这将移除此账户的已保存会话。';

  @override
  String get accountRemoveOnlyDescription => '这将移除此设备上唯一已保存的账户。';

  @override
  String get accountExpired => '已过期';

  @override
  String accountSessionExpired(String identifier) {
    return '$identifier 的会话已过期。请重新登录。';
  }

  @override
  String get accountManageTitle => '管理账户';

  @override
  String get accountSwitchFailed => '无法切换账户。请重试。';

  @override
  String get profileTabMenuSwitchAccounts => '切换账户';

  @override
  String get statusChangeSheetTitle => '设置状态';

  @override
  String get statusOnlineStatusSection => '在线状态';

  @override
  String get statusOnline => '在线';

  @override
  String get statusIdle => '空闲';

  @override
  String get statusDnd => '请勿打扰';

  @override
  String get statusInvisible => '隐身';

  @override
  String get statusOffline => '离线';

  @override
  String get statusUntilIChangeIt => '直到我更改它';

  @override
  String get statusDontClear => '不清除';

  @override
  String get statusFor10Seconds => '10 秒';

  @override
  String get statusClearAfter10Seconds => '10 秒';

  @override
  String get statusClearAfter15Minutes => '15 分钟';

  @override
  String get statusClearAfter30Minutes => '30 分钟';

  @override
  String get statusClearAfter1Hour => '1 小时';

  @override
  String get statusClearAfter3Hours => '3 小时';

  @override
  String get statusClearAfter4Hours => '4 小时';

  @override
  String get statusClearAfter8Hours => '8 小时';

  @override
  String get statusClearAfter24Hours => '24 小时';

  @override
  String get statusClearAfter3Days => '3 天';

  @override
  String get statusDndDescription => '您将不会在桌面上收到通知';

  @override
  String get statusInvisibleDescription => '您将显示为离线';

  @override
  String get customStatusSetTitle => '设置自定义状态';

  @override
  String get customStatusCurrentHint => '自定义状态';

  @override
  String get customStatusClear => '清除自定义状态';

  @override
  String get customStatusPlaceholder => '有什么新鲜事？';

  @override
  String get customStatusChooseEmoji => '选择一个表情符号';

  @override
  String get customStatusClearAfter => '清除后';

  @override
  String get customStatusSave => '保存';

  @override
  String get accountActive => '当前账户';

  @override
  String get signOut => '退出登录';

  @override
  String get suspendedPermanentTitle => '账户永久封禁';

  @override
  String get suspendedTemporaryTitle => '账户暂停';

  @override
  String get suspendedPermanentDescription => '您的账户因违反我们的服务条款而被永久封禁。';

  @override
  String get suspendedTemporaryDescription => '您的账户已被暂时封禁。封禁期结束后，您将能够访问您的账户。';

  @override
  String get suspendedIssuedAt => '生效时间';

  @override
  String get suspendedEndsAt => '结束时间';

  @override
  String get suspendedDuration => '封禁时长';

  @override
  String get suspendedPermanent => '永久';

  @override
  String get suspendedReason => '原因';

  @override
  String get suspendedAppealDeadline => '申诉截止日期';

  @override
  String suspendedDeletionWarning(String date) {
    return '您的账户定于 $date 删除。';
  }

  @override
  String get suspendedRecheck => '检查更新';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return '请 $seconds 秒后再试';
  }

  @override
  String get suspendedBackToLogin => '返回登录';

  @override
  String get suspendedAppealTitle => '申诉';

  @override
  String get suspendedAppealHint => '说明您认为应重新考虑此次封禁的原因（至少 50 个字符）...';

  @override
  String get suspendedAppealSubmit => '提交申诉';

  @override
  String get suspendedAppealPending => '审核中';

  @override
  String get suspendedAppealAccepted => '申诉已接受';

  @override
  String get suspendedAppealRejected => '申诉已拒绝';

  @override
  String get suspendedAppealAcceptedDescription => '您的申诉已被接受，您的账户已恢复。';

  @override
  String get suspendedSignIn => '登录您的账户';

  @override
  String get forgotPasswordTitle => '忘记密码？';

  @override
  String get forgotPasswordDescription => '请输入您的电子邮件地址，我们将向您发送重置密码的链接。';

  @override
  String get forgotPasswordSubmit => '发送重置链接';

  @override
  String get forgotPasswordSentTitle => '检查您的电子邮件';

  @override
  String get forgotPasswordSentDescription =>
      '我们已将密码重置说明发送到您的电子邮件地址。请检查您的收件箱并点击链接重置密码。';

  @override
  String get forgotPasswordBackToLogin => '返回登录';

  @override
  String get resetPasswordTitle => '设置新密码';

  @override
  String get resetPasswordDescription => '在下方输入您的新密码以完成重置过程。';

  @override
  String get resetPasswordNewPassword => '新密码';

  @override
  String get resetPasswordConfirm => '确认新密码';

  @override
  String get resetPasswordSubmit => '重置密码';

  @override
  String get resetPasswordMismatch => '两次输入的密码不匹配。';

  @override
  String get registerTitle => '创建账户';

  @override
  String get registerDisplayName => '显示名称（可选）';

  @override
  String get registerDisplayNameHint => '别人应该怎么称呼您？';

  @override
  String get registerUsername => '用户名（可选）';

  @override
  String get registerUsernameHint => '留空则使用随机用户名';

  @override
  String get registerUsernameTagHint => '系统将自动添加一个 4 位数的标签以确保唯一性';

  @override
  String get registerDateOfBirth => '出生日期';

  @override
  String get registerMonth => '月份';

  @override
  String get registerDay => '日期';

  @override
  String get registerYear => '年份';

  @override
  String get registerConsent => '我同意服务条款和隐私政策';

  @override
  String get registerConsentPrefix => '我同意';

  @override
  String get registerConsentTerms => '服务条款';

  @override
  String get registerConsentAnd => '和';

  @override
  String get registerConsentPrivacy => '隐私政策';

  @override
  String get registerConfirmPassword => '确认密码';

  @override
  String get registerSubmit => '创建账户';

  @override
  String get registerHaveAccount => '已有账户？';

  @override
  String get registerPendingApproval =>
      'Your account request is pending approval. You can sign in after an admin approves it.';

  @override
  String get registerClosed =>
      'Registration is currently closed. Use a registration link from an admin to create an account.';

  @override
  String get passkeyNoCredentials => '此应用未找到任何通行密钥。请改用电子邮件和密码登录。';

  @override
  String get passkeyDeviceNotSupported => '此设备不支持通行密钥。';

  @override
  String get passkeyDomainNotAssociated => '此应用的通行密钥未配置。请改用电子邮件和密码登录。';

  @override
  String get passkeyTimeout => '通行密钥认证超时。请重试。';

  @override
  String get passkeyNotAvailable => '此应用无法使用通行密钥。请改用电子邮件和密码登录。';

  @override
  String get passkeyFailed => '密匙认证失败。请重试。';

  @override
  String get errorUnableToCreateAccount => '无法创建账户。请重试。';

  @override
  String get errorUnableToSignIn => '暂时无法登录。请重试。';

  @override
  String get errorInvalidEmailOrPassword => '电子邮件或密码无效。';

  @override
  String get errorUnableToSendResetLink => '无法发送重置链接。请重试。';

  @override
  String get errorUnableToResetPassword => '无法重置密码。请重试。';

  @override
  String get embedInviteJoin => '加入社区';

  @override
  String get embedInviteGoTo => '前往社区';

  @override
  String embedInviteOnline(String count) {
    return '$count 人在线';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count 位成员';
  }

  @override
  String get embedInviteUnknownTitle => '无效的邀请';

  @override
  String get embedInviteUnknownSubtitle => '尝试请求新邀请。';

  @override
  String get embedInviteUnavailable => '邀请不可用';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => '您已被邀请加入';

  @override
  String get inviteAcceptJoinButton => '加入社区';

  @override
  String get inviteAcceptGoToButton => '前往社区';

  @override
  String get inviteAcceptInvitesPaused => '邀请已暂停';

  @override
  String get inviteAcceptNotFoundTitle => '邀请无效';

  @override
  String get inviteAcceptNotFoundDescription => '此邀请可能已过期或无效。';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => '加入群组';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return '$inviterName 已邀请您加入群组 DM';
  }

  @override
  String get inviteAcceptSomeone => '某人';

  @override
  String get inviteAcceptEmojiPack => '表情包';

  @override
  String get inviteAcceptStickerPack => '贴纸包';

  @override
  String get inviteAcceptInstallEmojiPack => '安装表情包';

  @override
  String get inviteAcceptInstallStickerPack => '安装贴纸包';

  @override
  String get inviteAcceptPackInstallNote => '接受此邀请将自动安装表情包。';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => '无权访问频道';

  @override
  String get channelAccessDeniedDescription => '您无权访问发送此消息的频道。';

  @override
  String get messageJumpLinkNoAccess => '无权访问';

  @override
  String get okay => '好的';

  @override
  String get embedThemeTitle => '共享主题';

  @override
  String get embedThemeSubtitle => '此客户端不支持自定义主题。';

  @override
  String get embedThemeUnavailableButton => '主题不可用';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (lifetime $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days of $productName',
      one: '1 day of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks of $productName',
      one: '1 week of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months of $productName',
      one: '1 month of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years of $productName',
      one: '1 year of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'From $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Click to claim your gift!';

  @override
  String get embedGiftAlreadyRedeemed => 'Already redeemed';

  @override
  String get embedGiftClaimAccountHelp =>
      'Claim your account to redeem this gift.';

  @override
  String get embedGiftClaim => 'Claim gift';

  @override
  String get embedGiftClaimed => 'Gift claimed';

  @override
  String get embedGiftClaimAccount => 'Claim account to redeem';

  @override
  String get embedGiftUnknownTitle => 'Unknown gift';

  @override
  String get embedGiftUnknownSubtitle =>
      'This gift code is invalid or already claimed.';

  @override
  String get embedGiftUnavailable => 'Gift unavailable';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Claim your gift to activate your $productName subscription!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'This gift has already been claimed.';

  @override
  String get giftAcceptMaybeLater => 'Maybe later';

  @override
  String get giftRedeemedToast => 'Gift redeemed!';

  @override
  String get giftRedeemInvalidTitle => 'Invalid gift code';

  @override
  String get giftRedeemInvalidMessage =>
      'This code is invalid or already used.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Gift already redeemed';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'This code was already redeemed.';

  @override
  String get giftRedeemNotFoundTitle => 'Gift not found';

  @override
  String get giftRedeemNotFoundMessage => 'This code doesn\'t exist.';

  @override
  String get giftRedeemFailedTitle => 'Failed to redeem gift';

  @override
  String get giftRedeemFailedMessage =>
      'Couldn\'t redeem this gift. Try again.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Can\'t redeem this gift';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary accounts can\'t redeem Plutonium gifts. Copy the link to share it with a friend instead.';

  @override
  String get giftCopyLink => 'Copy gift link';

  @override
  String get privacySettings => '隐私设置';

  @override
  String get privacyDirectMessages => '直接消息';

  @override
  String get privacyDirectMessagesDescription => '允许此社区中的其他成员发送直接消息';

  @override
  String get privacyBotDirectMessages => '机器人直接消息';

  @override
  String get privacyBotDirectMessagesDescription => '允许此社区中的机器人向您发送直接消息';

  @override
  String get privacyMutualDmsDisabled => '社区管理员已禁用仅从此社区中的互相关联成员接收直接消息。';

  @override
  String get communityDebug => '社区调试';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get notificationSettings => '通知设置';

  @override
  String notificationMuteGuild(String guildName) {
    return '静音 $guildName';
  }

  @override
  String get notificationMuteDescription => '静音社区可防止出现未读指示器和通知，除非您被提及';

  @override
  String get notificationCommunitySettings => '社区通知设置';

  @override
  String get notificationAllMessages => '所有消息';

  @override
  String get notificationOnlyMentions => '仅提及';

  @override
  String get notificationNothing => '无';

  @override
  String get notificationSuppressEveryone => '屏蔽 @everyone 和 @here';

  @override
  String get notificationSuppressRoles => '屏蔽所有角色@提及';

  @override
  String get notificationMobilePush => '移动推送通知';

  @override
  String get notificationOverrides => '通知覆盖设置';

  @override
  String get notificationSelectChannel => '选择频道或类别';

  @override
  String get notificationOnlyAtMentions => '仅@提及';

  @override
  String get notificationMuteChannel => '静音频道';

  @override
  String get notificationUnmuteChannel => '取消静音频道';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => '无类别';

  @override
  String get dmMarkAsRead => '标记为已读';

  @override
  String get dmMuteConversation => '静音私信';

  @override
  String get dmUnmuteConversation => '取消静音私信';

  @override
  String get dmPinDm => '固定私信';

  @override
  String get dmUnpinDm => '取消固定私信';

  @override
  String get dmAlwaysShowInSidebar => '始终显示在侧边栏';

  @override
  String get dmRemoveFromAlwaysShown => '从“始终显示”中移除';

  @override
  String get dmCloseDm => '关闭私信';

  @override
  String get dmCloseDmConfirmTitle => '关闭私信';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '确定要关闭与 $username 的私信吗？之后可以随时重新打开。';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Delete your messages in this conversation?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this conversation. This cannot be undone.';

  @override
  String get dmCopyChannelId => '复制频道ID';

  @override
  String get dmChannelIdCopied => '频道ID已复制';

  @override
  String get dmCopyUserId => '复制用户ID';

  @override
  String get dmUserIdCopied => '用户ID已复制';

  @override
  String get dmViewProfile => '查看个人资料';

  @override
  String get dmVoiceCall => '发起语音通话';

  @override
  String get incomingVoiceCallTitle => '来电';

  @override
  String get incomingVoiceCallAccept => '接听';

  @override
  String get incomingVoiceCallDecline => '拒绝';

  @override
  String get incomingVoiceCallLabel => '来电';

  @override
  String get incomingVoiceCallIgnore => '忽略';

  @override
  String get directVoiceCallNotEligible => '目前无法发起此通话。请稍后重试。';

  @override
  String get voiceJoinCallFailed => '无法连接到此通话。请检查您的连接并重试。';

  @override
  String get voiceJoinIncomingCallFailed => '无法加入此通话。请检查您的连接并重试。';

  @override
  String get incomingVoiceRingingUpdateFailed => '无法更新服务器上的此通话。请检查您的连接并重试。';

  @override
  String get dmAddNote => '添加备注';

  @override
  String get dmEditGroup => '编辑群组';

  @override
  String get dmInviteToCommunity => '邀请加入社群';

  @override
  String get dmBlock => '屏蔽';

  @override
  String get dmLeaveGroup => '离开群组';

  @override
  String get dmNoCommunitiesAvailable => '没有可用的社群';

  @override
  String dmGroupMemberCount(int count) {
    return '$count 位成员';
  }

  @override
  String get dmMuteFor15Min => '15分钟';

  @override
  String get dmMuteFor30Min => '30分钟';

  @override
  String get dmMuteFor1Hour => '1小时';

  @override
  String get dmMuteFor3Hours => '3小时';

  @override
  String get dmMuteFor4Hours => '4小时';

  @override
  String get dmMuteFor8Hours => '8小时';

  @override
  String get dmMuteFor24Hours => '24小时';

  @override
  String get dmMuteFor3Days => '3天';

  @override
  String get dmMuteForever => '直到我重新开启';

  @override
  String get dmPinGroupDm => '固定群组私信';

  @override
  String get dmUnpinGroupDm => '取消置顶群聊';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => '收藏私信';

  @override
  String get dmUnfavoriteDm => '取消收藏私信';

  @override
  String get dmFavoriteGroupDm => '收藏群聊';

  @override
  String get dmUnfavoriteGroupDm => '取消收藏群聊';

  @override
  String get dmChangeFriendNickname => '更改好友昵称';

  @override
  String get dmRemoveFriend => '移除好友';

  @override
  String get dmAddFriend => '添加好友';

  @override
  String get dmAcceptFriendRequest => '接受好友请求';

  @override
  String get dmIgnoreFriendRequest => '忽略好友请求';

  @override
  String get dmFriendRequestSent => '好友请求已发送';

  @override
  String get dmUnblock => '解除屏蔽';

  @override
  String get dmDebugUser => '调试用户';

  @override
  String get dmDebugChannel => '调试频道';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => '已置顶私信';

  @override
  String get dmUnpinned => '已取消置顶私信';

  @override
  String get dmMuted => '已静音私信';

  @override
  String get dmUnmuted => '已取消静音私信';

  @override
  String get dmRemoveFriendConfirmTitle => '移除好友';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return '确定要将 $username 移除好友吗？';
  }

  @override
  String get dmBlockConfirmTitle => '屏蔽用户';

  @override
  String dmBlockConfirmDescription(String username) {
    return '确定要屏蔽 $username 吗？对方将无法给你发消息或发送好友请求。';
  }

  @override
  String get dmFriendRequestSentToast => '好友请求已发送';

  @override
  String get dmFriendRequestFailed => '发送好友请求失败';

  @override
  String get dmAcceptFriendRequestFailed => '接受好友请求失败';

  @override
  String get dmRemoveFriendFailed => '移除好友失败';

  @override
  String get dmBlockFailed => '屏蔽用户失败';

  @override
  String get dmUnblockFailed => '解除屏蔽用户失败';

  @override
  String get dmIgnoreFriendRequestFailed => '忽略好友请求失败';

  @override
  String get dmAddFriends => '添加好友';

  @override
  String get addFriendSheetTitle => '添加好友';

  @override
  String get addFriendUsernameHint => '用户名#0000';

  @override
  String get addFriendUsernameLabel => '好友的用户名';

  @override
  String get addFriendSendRequest => '发送请求';

  @override
  String get addFriendNoUserFound => '未找到该用户名的用户。';

  @override
  String get addFriendInvalidUsername => '请输入有效的用户名（用户名#0000）。';

  @override
  String get addFriendOutgoingSuccess => '好友请求已发送';

  @override
  String get addFriendClaimTitle => '认领您的账号';

  @override
  String get addFriendClaimDescription => '请先认领您的账号才能发送好友请求。';

  @override
  String get addFriendVerifyTitle => '验证您的邮箱';

  @override
  String get addFriendVerifyDescription => '您需要先验证您的邮箱地址才能发送好友请求。';

  @override
  String get addFriendVerifyEmail => '验证邮箱';

  @override
  String addFriendIncomingRequests(int count) {
    return '收到的好友请求（$count）';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return '发出的好友请求（$count）';
  }

  @override
  String get addFriendIncomingStatus => '收到的好友请求';

  @override
  String get addFriendOutgoingStatus => '好友请求已发送';

  @override
  String get addFriendViewProfile => '查看个人资料';

  @override
  String get addFriendAccept => '接受';

  @override
  String get addFriendIgnore => '忽略';

  @override
  String get addFriendAcceptTitle => '接受好友请求';

  @override
  String get addFriendIgnoreTitle => '忽略好友请求';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '接受来自 $userName 的好友请求吗？';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '忽略来自 $displayName 的好友请求吗？';
  }

  @override
  String get addFriendCancelRequest => '取消请求';

  @override
  String get addFriendCancelRequestFailed => '无法取消好友请求。请重试。';

  @override
  String get addFriendNotAcceptingRequests => '对方目前不接受好友请求。';

  @override
  String get addFriendUnblockFirst => '请先解除屏蔽才能发送好友请求。';

  @override
  String get addFriendCannotSendToSelf => '您无法发送好友请求给自己。';

  @override
  String get addFriendAlreadyFriends => '您已是该用户的好友。';

  @override
  String get addFriendClaimToSend => '完成注册即可发送好友请求。';

  @override
  String get addFriendVerifyToSend =>
      'Verify your email before sending friend requests.';

  @override
  String get addFriendFriendsListFull =>
      'Your friends list is full, or theirs is. Remove someone and try again.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => '系统';

  @override
  String get emojiSearchPlaceholder => '查找您想要的表情符号';

  @override
  String get emojiSearchEmpty => '没有表情符号匹配您的搜索';

  @override
  String get emojiAutocompleteDefaultLabel => '默认表情';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'This is a default emoji on $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'This emoji is from this community. You can use it everywhere.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'This is a custom emoji from a community.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'This is a custom emoji from a community. Ask the author for an invite to use this emoji.';

  @override
  String get emojiInfoFromHeader => 'This emoji is from';

  @override
  String get emojiInfoDiscoverableCommunity => 'Discoverable community';

  @override
  String get emojiInfoPrivateCommunity => 'Private community';

  @override
  String get emojiInfoVerifiedCommunity => 'Verified community';

  @override
  String get emojiInfoAddToFavorites => 'Add to Favorites';

  @override
  String get emojiInfoRemoveFromFavorites => 'Remove from Favorites';

  @override
  String get emojiFrequentlyUsed => '常用';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => '媒体';

  @override
  String get emojiTabStickers => '贴纸';

  @override
  String get emojiTabEmojis => '表情';

  @override
  String get gifPickerSearch => '搜索 GIF';

  @override
  String get gifPickerSearchKlipy => '搜索 KLIPY';

  @override
  String get gifPickerSearchTenor => '搜索 Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => '收藏';

  @override
  String get gifPickerFavoritesEmptyTitle => 'No favorite GIFs yet';

  @override
  String get gifPickerFavoritesEmptyDescription => 'Star a GIF to see it here.';

  @override
  String get gifPickerTrending => '热门 GIF';

  @override
  String get gifPickerNoResultsTitle => '无搜索结果';

  @override
  String get gifPickerNoResultsDescription => '尝试其他搜索词';

  @override
  String get gifPickerLoadFailedTitle => '无法加载 GIF';

  @override
  String get gifPickerLoadFailedBody => '检查您的网络连接并重试。';

  @override
  String get emojiCategoryPeople => '人物';

  @override
  String get emojiCategoryNature => '动物与自然';

  @override
  String get emojiCategoryFood => '美食与饮品';

  @override
  String get emojiCategoryActivity => '活动';

  @override
  String get emojiCategoryTravel => '旅行与地点';

  @override
  String get emojiCategoryObjects => '物品';

  @override
  String get emojiCategorySymbols => '符号';

  @override
  String get emojiCategoryFlags => '国旗';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return '通过 Plutonium 解锁 $communityCount 个社群中的 $emojiCount 个表情符号。';
  }

  @override
  String get emojiPlutoniumUpsellButton => '获取 Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => '不再显示';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个自定义表情符号',
      one: '1 个自定义表情符号',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个社群',
      one: '1 个社群',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => '外部链接警告';

  @override
  String externalLinkWarningLeaving(String productName) {
    return '您即将离开 $productName';
  }

  @override
  String get externalLinkWarningDescription => '外部链接可能存在风险。请小心。';

  @override
  String get externalLinkWarningDestinationUrl => '目标网址：';

  @override
  String get externalLinksSectionTitle => '外部链接';

  @override
  String get externalLinksSectionDescription => '配置外部链接警告的处理方式。';

  @override
  String get externalLinkWarningTrustPrefix => '始终信任 ';

  @override
  String get externalLinkWarningTrustSuffix => ' — 下次跳过此警告';

  @override
  String get externalLinkVisitSite => '访问网站';

  @override
  String get externalLinkTrustAllLabel => '信任所有外部链接';

  @override
  String get externalLinkStripTrackingLabel => '从网址中移除跟踪参数';

  @override
  String get externalLinkStripTrackingDescription =>
      '自动移除您发送的消息中网址的跟踪参数（如 utm_source, fbclid, gclid）。在链接发送给他人之前进行清理。';

  @override
  String get externalLinkTrustAllConfirmTitle => '信任所有外部链接？';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      '这将信任所有外部链接，并跳过所有域名的警告。您现有的受信任域名将被替换。这不太安全。';

  @override
  String get externalLinkTrustAllConfirmAction => '全部信任';

  @override
  String get externalLinkStopTrustingAllTitle => '停止信任所有链接？';

  @override
  String get externalLinkStopTrustingAllDescription =>
      '将再次显示外部链接警告。您需要单独添加受信任的域名。';

  @override
  String get externalLinkStopTrustingAllAction => '禁用全部信任';

  @override
  String get externalLinkTrustedAllDescription => '所有外部链接均已信任。将不显示警告。';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return '您已信任 $count 个域名。访问外部链接时勾选复选框可添加更多域名。';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      '启用后，将不显示任何外部链接警告。这不太安全。';

  @override
  String get imageFileTooLarge => '图片文件过大。请选择小于 10 MB 的文件。';

  @override
  String get animatedAvatarsRequirePlutonium => '动态头像需要 Plutonium';

  @override
  String get animatedBannersRequirePlutonium => '动态横幅需要 Plutonium';

  @override
  String get animatedAvifNotSupported => '不支持动态 AVIF';

  @override
  String get animatedAvifNotSupportedBody =>
      '目前不支持裁剪和旋转动态 AVIF 文件。如果继续，将以原始形式上传。';

  @override
  String get uploadAsIs => '按原样上传';

  @override
  String get croppingAnimatedNotSupported => '目前不支持裁剪动态图片。将使用原始上传文件。';

  @override
  String get cropAvatar => '裁剪头像';

  @override
  String get cropBanner => '裁剪横幅';

  @override
  String get skip => '跳过';

  @override
  String get crop => '裁剪';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => '更改您的 用户名';

  @override
  String get fluxerTagInputLabel => '用户名';

  @override
  String get fluxerTagDescriptionBase =>
      '用户名只能包含字母（a-z, A-Z）、数字（0-9）和下划线。用户名不区分大小写。';

  @override
  String get fluxerTagDescriptionVisionary =>
      '用户名只能包含字母（a-z, A-Z）、数字（0-9）和下划线。用户名不区分大小写。您可以选择 #0000 到 #9999 之间的任意可用 4 位数字标签。';

  @override
  String get fluxerTagDescriptionPremium =>
      '用户名只能包含字母（a-z, A-Z）、数字（0-9）和下划线。用户名不区分大小写。您可以选择 #0001 到 #9999 之间的任意可用 4 位数字标签。';

  @override
  String validationLengthRange(int min, int max) {
    return '介于 $min 和 $max 个字符之间';
  }

  @override
  String get validationAllowedChars => '仅限字母（a-z, A-Z）、数字（0-9）和下划线（_）';

  @override
  String get discriminatorPremiumTooltip => '获取 Plutonium 以自定义您的标签或在更改用户名时保留它';

  @override
  String get fluxerTagAlreadyTaken => '用户名 已被占用';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return '用户名 $username#$discriminator 已被占用。继续将自动重新分配您的数字标签。';
  }

  @override
  String get customTagIsTemporary => '自定义标签是临时的';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return '您的自定义 4 位数字标签仅在您的 Plutonium 订阅有效期间可用。当您的订阅于 $date 到期后，您的标签将在 3 天宽限期后恢复为随机分配的数字。';
  }

  @override
  String get customTagTemporaryBody =>
      '您的自定义 4 位数字标签仅在您的 Plutonium 订阅有效期间可用。当您的订阅到期后，您的标签将在 3 天宽限期后恢复为随机分配的数字。';

  @override
  String get iUnderstandContinue => '我明白了，继续';

  @override
  String get premiumWarningPendingDiscriminator =>
      '如果您保存此 用户名，您的自定义 4 位数字标签将在您的 Plutonium 订阅结束时恢复为随机数字。如果您的订阅未能续订，您将有 3 天宽限期，之后标签才会更改。';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return '您的自定义 4 位数字标签（#$discriminator）在您的 Plutonium 订阅有效期间处于激活状态。如果您的订阅在 3 天宽限期后结束或未能续订，您的标签将恢复为随机数字。';
  }

  @override
  String get premiumUpsellCustomizeTag => '自定义您的 4 位数字标签或在更改用户名时保留它';

  @override
  String premiumTrialExpiresOn(String date) {
    return '您的 Plutonium 试用版将于 $date 到期。升级以保留您的自定义标签并在您的个人资料上获得徽章。';
  }

  @override
  String get premiumTrialActive =>
      '您正在使用 Plutonium 试用版。升级以保留您的自定义标签并在您的个人资料上获得徽章。';

  @override
  String get fluxerTagUpdated => '用户名 已更新';

  @override
  String get fluxerTagUpdateFailed => '更新 用户名 失败。请重试。';

  @override
  String get continueAction => '继续';

  @override
  String get profileCustomizationTitle => '个人资料自定义';

  @override
  String get profileCustomizationDescription => '编辑您的个人资料外观并查看实时预览';

  @override
  String get usernameLabel => '用户名';

  @override
  String get claimAccountToChangeFluxerTag => '认领您的账户以更改您的 用户名';

  @override
  String get changeFluxerTag => '更改 用户名';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return '使用 Plutonium 自定义你的 4 位数字标签 (#$discriminator)';
  }

  @override
  String get changeUsernameAndTagHint => '更改你的用户名和 4 位数字标签';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return '你的自定义标签 (#$discriminator) 与你的 Plutonium 订阅绑定，如果订阅过期，它将恢复为随机标签。';
  }

  @override
  String get displayNameLabel => '显示名称';

  @override
  String get pronounsLabel => '代词';

  @override
  String get avatarLabel => '头像';

  @override
  String get changeAvatar => '更改头像';

  @override
  String get removeAvatar => '移除头像';

  @override
  String get avatarDescription => 'PNG、JPEG、WebP、GIF。最大 10MB。推荐：512×512px';

  @override
  String get bannerLabel => '横幅';

  @override
  String get changeBanner => '更改横幅';

  @override
  String get removeBanner => '移除横幅';

  @override
  String get bannerDescription =>
      'PNG、JPEG、WebP、GIF。最大 10MB。最小：960×540px (16:9)';

  @override
  String get accentColorLabel => '强调色';

  @override
  String get accentColorDescription => '自定义个人资料的边框和横幅颜色';

  @override
  String get aboutMeLabel => '关于我';

  @override
  String get aboutMeHelperText => '你可以使用链接、表情符号和 Markdown。';

  @override
  String get emojiPickerTitle => '表情符号';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium 徽章隐私';

  @override
  String get plutoniumBadgePrivacyDescription => '控制他人如何看到你的 Plutonium 徽章';

  @override
  String get hidePlutoniumBadgeLabel => '完全隐藏 Plutonium 徽章';

  @override
  String get hidePlutoniumBadgeDescription => '从其他用户那里完全隐藏你的 Plutonium 徽章';

  @override
  String get hidePlutoniumPurchaseDate => '隐藏 Plutonium 购买日期';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return '隐藏 Plutonium 购买日期 ($date)';
  }

  @override
  String get hidePurchaseDateDescription => '从你的徽章中移除 Plutonium 的首次购买日期';

  @override
  String get maskVisionaryAsSubscription => '将 Visionary 显示为订阅';

  @override
  String get maskVisionaryDescription => '将你的 Visionary 显示为常规订阅';

  @override
  String get hideVisionaryIdBadge => '隐藏 Visionary ID 徽章';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return '隐藏 Visionary ID 徽章 (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => '移除你的 Visionary ID 徽章';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return '你正在试用 Plutonium — 你的订阅将于 $date 开始';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      '试用期结束后，你的订阅将自动开始。无需操作。';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return '你正在试用 Plutonium，将于 $date 到期';
  }

  @override
  String get premiumTrialActiveProfile => '你正在试用 Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG、PNG、WebP。最大 10MB。推荐：512×512px。动态头像 (GIF) 需要 Plutonium。';

  @override
  String get bannerPlutoniumUpsell => '使用静态或动态横幅图片自定义你的个人资料，使其脱颖而出。';

  @override
  String get getPlutonium => '获取 Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody => '应用内购买在此平台暂不可用。敬请期待 — 即将推出！';

  @override
  String get profilePreviewLabel => '预览';

  @override
  String get profilePreviewMessage => '消息';

  @override
  String profilePreviewMemberSince(String productName) {
    return '$productName 会员自';
  }

  @override
  String get unclaimedAccountTitle => '未认领的账户';

  @override
  String get unclaimedAccountDescription =>
      '你的账户尚未认领。没有电子邮件和密码，你可能会丢失访问权限。立即认领你的账户以确保其安全。';

  @override
  String get claimAccount => '认领账户';

  @override
  String get profileTypeLabel => '个人资料类型';

  @override
  String get profileTypeGlobal => '全局个人资料';

  @override
  String get profileTypeGuildDescription =>
      '你正在编辑你的每个社区的个人资料。此个人资料仅在此社区可见，并将覆盖你的全局个人资料。';

  @override
  String get communityNicknameLabel => '社区昵称';

  @override
  String get perGuildPremiumUpsellText =>
      '为单个社群自定义头像、横幅、强调色和个人简介需要 Plutonium。社群昵称和代词对所有人免费。';

  @override
  String get avatarModeInherit => '使用全局资料';

  @override
  String get avatarModeCustom => '使用自定义图片';

  @override
  String get avatarModeUnset => '不显示';

  @override
  String get profileSavedToast => '个人资料已更新';

  @override
  String get profileEditButton => '编辑个人资料';

  @override
  String get profileNoteLabel => '备注';

  @override
  String get profileNoteVisibility => '（仅你可见）';

  @override
  String get profileNoteEmpty => '暂无备注。';

  @override
  String get sudoTitle => '验证你的身份';

  @override
  String get sudoDescription => '此操作需要验证才能继续。';

  @override
  String get sudoAuthenticatorCode => '验证器代码';

  @override
  String get sudoMethodPassword => '密码';

  @override
  String get sudoMethodTotp => '验证器';

  @override
  String get sudoVerificationFailed => '验证失败。请重试。';

  @override
  String get securityAccountTitle => '账号';

  @override
  String get securityAccountDescription => '管理你的电子邮件、密码和账号设置';

  @override
  String get securitySectionTitle => '安全';

  @override
  String get securitySectionDescription => '使用双重验证和通行密钥保护你的账号';

  @override
  String get securityLoginEmailSectionTitle => '电子邮件设置';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return '管理你用于登录 $productName 的电子邮件地址';
  }

  @override
  String get securityLoginEmailAddressLabel => '电子邮件地址';

  @override
  String get securityLoginNoEmailSet => '未设置电子邮件地址';

  @override
  String get securityLoginChangeEmail => '更改电子邮件';

  @override
  String get securityLoginAddEmail => '添加电子邮件';

  @override
  String get securityLoginReveal => '显示';

  @override
  String get securityLoginHide => '隐藏';

  @override
  String get securityLoginPasswordSectionTitle => '密码';

  @override
  String get securityLoginPasswordSectionDescription => '更改你的密码以确保账号安全';

  @override
  String get securityLoginCurrentPasswordLabel => '当前密码';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return '上次更改：$date';
  }

  @override
  String get securityLoginPasswordNeverChanged => '上次更改：从不';

  @override
  String get securityLoginNoPasswordSet => '未设置密码';

  @override
  String get securityLoginChangePassword => '更改密码';

  @override
  String get securityLoginSetPassword => '设置密码';

  @override
  String get passwordChangeTitle => '更改密码';

  @override
  String get passwordChangeIntroDescription =>
      '在更改密码前，我们会向你的电子邮件地址发送验证码以确认你的身份。';

  @override
  String get passwordChangeStart => '开始';

  @override
  String get passwordChangeVerifyTitle => '验证你的电子邮件';

  @override
  String get passwordChangeVerifyDescription => '输入发送到你电子邮件地址的验证码。';

  @override
  String get passwordChangeVerificationCode => '验证码';

  @override
  String get passwordChangeVerify => '验证';

  @override
  String get passwordChangeNewPasswordTitle => '设置新密码';

  @override
  String get passwordChangeNewPasswordDescription => '在下方输入你的新密码。';

  @override
  String get passwordChangeNewPassword => '新密码';

  @override
  String get passwordChangeConfirmPassword => '确认新密码';

  @override
  String get passwordChangeSubmit => '更改密码';

  @override
  String get passwordChangeSuccess => '密码已更改';

  @override
  String get passwordChangePasswordsDoNotMatch => '两次输入的密码不匹配';

  @override
  String get passwordChangeInvalidCode => '验证码无效或已过期';

  @override
  String get emailChangeTitle => '更改邮箱';

  @override
  String get emailChangeIntroDescription => '在更改您的邮箱地址前，我们会发送验证码以验证您的身份。';

  @override
  String get emailChangeStart => '开始';

  @override
  String get emailChangeVerifyOriginalTitle => '验证当前邮箱';

  @override
  String get emailChangeVerifyOriginalDescription => '请输入发送到您当前邮箱的验证码。';

  @override
  String get emailChangeNewEmailTitle => '输入新邮箱';

  @override
  String get emailChangeNewEmailDescription => '请输入您想使用的新邮箱地址。';

  @override
  String get emailChangeNewEmailLabel => '新邮箱';

  @override
  String get emailChangeNewEmailSubmit => '发送验证码';

  @override
  String get emailChangeVerifyNewTitle => '验证新邮箱';

  @override
  String get emailChangeVerifyNewDescription => '请输入发送到您新邮箱的验证码。';

  @override
  String get emailChangeSuccess => '邮箱已更改';

  @override
  String get emailChangeInvalidCode => '验证码无效或已过期';

  @override
  String get resend => '重发';

  @override
  String resendCountdown(int seconds) {
    return '重发 ($seconds秒)';
  }

  @override
  String get verificationCode => '验证码';

  @override
  String get verify => '验证';

  @override
  String get enable => '启用';

  @override
  String get disable => '禁用';

  @override
  String get delete => '删除';

  @override
  String get save => '保存';

  @override
  String get securityTfaSectionTitle => '两步验证';

  @override
  String get securityTfaSectionDescription => '为您的账户添加额外的安全层';

  @override
  String get securityTfaAuthenticatorApp => '验证器应用';

  @override
  String get securityTfaAuthenticatorEnabled => '两步验证已启用';

  @override
  String get securityTfaAuthenticatorDisabled => '使用验证器应用生成两步验证码';

  @override
  String get securityTfaBackupCodes => '备用码';

  @override
  String get securityTfaBackupCodesDescription => '查看和管理您的账户恢复备用码';

  @override
  String get securityTfaViewCodes => '查看备用码';

  @override
  String get securityPasskeysSectionTitle => '通行密钥';

  @override
  String get securityPasskeysSectionDescription => '使用通行密钥进行无密码登录和两步验证';

  @override
  String get securityPasskeysRegistered => '已注册的通行密钥';

  @override
  String get securityPasskeysNone => '未注册通行密钥';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '密钥',
      one: '密钥',
    );
    return '已注册 $count 个 $_temp0 (最多 10 个)';
  }

  @override
  String get securityPasskeysAdd => '添加通行密钥';

  @override
  String securityPasskeysAdded(String date) {
    return '添加于：$date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return '上次使用：$date';
  }

  @override
  String get securityPasskeysRename => '重命名';

  @override
  String get securityPasskeysDeleteTitle => '删除通行密钥';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return '您确定要删除通行密钥“$name”吗？';
  }

  @override
  String get securityPasskeyNameTitle => '通行密钥名称';

  @override
  String get securityPasskeyNameLabel => '通行密钥名称';

  @override
  String get securityPasskeyNameHint => '例如：YubiKey、iPhone、工作电脑';

  @override
  String get securityPhoneSectionTitle => '手机号码';

  @override
  String get securityPhoneSectionDescription => '管理您的手机号码';

  @override
  String get securityPhoneLabel => '手机号码';

  @override
  String get securityPhoneNone => '未添加手机号码。';

  @override
  String get securityPhoneAdd => '添加手机号码';

  @override
  String get securityPhoneRemove => '移除';

  @override
  String get securityPhoneRemoveTitle => '移除手机号码';

  @override
  String get securityPhoneRemoveDescription => '确定要移除您的手机号码吗？';

  @override
  String get securityPhoneRemoved => '手机号码已移除';

  @override
  String get securityClaimTitle => '安全功能';

  @override
  String get securityClaimDescription => '认领您的账号，即可使用双重验证和通行密钥等安全功能。';

  @override
  String get securityVerifyEmailRequired =>
      '您必须先验证您的电子邮件地址，才能设置双重验证、通行密钥或短信验证。';

  @override
  String get totpEnableTitle => '设置身份验证器应用';

  @override
  String get totpEnableDescription => '使用您的身份验证器应用扫描二维码，以生成双重验证码。';

  @override
  String get totpEnableCodeLabel => '验证码';

  @override
  String get totpEnableCodeHint => '输入身份验证器应用中的 6 位数验证码';

  @override
  String get totpEnableSuccess => '双重验证已启用';

  @override
  String get totpDisableTitle => '移除身份验证器应用';

  @override
  String get totpDisableDescription => '输入身份验证器应用中的 6 位数验证码，以禁用双重验证。';

  @override
  String get totpDisableSuccess => '双重验证已禁用';

  @override
  String get backupCodesTitle => '备用验证码';

  @override
  String get backupCodesWarning =>
      '如果您丢失了身份验证器应用的使用权限，并且没有这些备用验证码，您将永久无法登录您的账号。请立即下载或复制它们，并妥善保管。';

  @override
  String get backupCodesDownload => '下载';

  @override
  String get backupCodesCopy => '复制';

  @override
  String get backupCodesCopied => '备用验证码已复制到剪贴板';

  @override
  String get backupCodesAcknowledge => '我已下载或复制我的备用验证码并妥善保管。';

  @override
  String get backupCodesDone => '完成';

  @override
  String get backupCodesViewTitle => '查看备用验证码';

  @override
  String get backupCodesViewDescription => '查看备用验证码前可能需要进行验证。';

  @override
  String get phoneAddTitle => '添加手机号码';

  @override
  String get phoneAddLabel => '手机号码';

  @override
  String get phoneAddHint => '输入您的手机号码';

  @override
  String get phoneAddFooter => '请输入您的手机号码。我们将通过短信向您发送验证码。';

  @override
  String get phoneAddSendCode => '发送验证码';

  @override
  String get phoneVerifyTitle => '验证手机号码';

  @override
  String get phoneVerifyDescription => '输入发送到您手机号码的验证码。';

  @override
  String get phoneAddSuccess => '手机号码已添加';

  @override
  String get phoneCountryLabel => 'Country';

  @override
  String get phoneSearchCountries => 'Search countries...';

  @override
  String get phoneNumberRequired => 'Phone number is required';

  @override
  String get phoneEnterValidNumber => 'Enter a valid mobile phone number.';

  @override
  String get phoneCannotBeUsed =>
      'This phone number cannot be used. Try another mobile number or contact support.';

  @override
  String get phoneAlreadyUsed =>
      'This phone number has already been used. Try another number or contact support.';

  @override
  String get phoneCodeDidNotWork =>
      'That code didn\'t work. Check it and try again.';

  @override
  String get phoneTooManyAttempts =>
      'Too many attempts. Wait a bit, then try again.';

  @override
  String get phoneSmsUnavailable =>
      'SMS verification is unavailable right now. Try again later or contact support.';

  @override
  String get phoneNotEligible =>
      'Phone verification is not available for this account. Use another method or contact support.';

  @override
  String get phoneCaptchaRequired =>
      'A browser check is required before phone verification. Try again from the sign-in page or contact support.';

  @override
  String get phoneSomethingWentWrong => 'Something went wrong. Try again.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Sending an SMS to this phone number is too expensive, so we need you to send us an SMS instead. You can also contact support to have us lift this requirement from your account.';

  @override
  String get phoneInboundDefaultDescription =>
      'We need you to send us an SMS to verify your phone number.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Open your phone\'s messaging app and create a new text message.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Send the code $code to $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Wait for us to receive your message. This can take a minute.';

  @override
  String get phoneInboundGetNewCode => 'Get new code';

  @override
  String get phoneInboundChallengeCodeLabel => 'Code to send';

  @override
  String get phoneInboundOurNumberLabel => 'Send to';

  @override
  String get requiredActionTitle => 'Account verification required';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Complete the required verification to continue using $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Your registration needs an extra anti-spam check before you can continue.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Verify your email or phone to continue using $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Complete the required email and phone verification steps below to continue using $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Choose a verification method';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Complete one of the verification paths below to continue using $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Use email';

  @override
  String get requiredActionUsePhone => 'Use phone';

  @override
  String get requiredActionCheckEmailTitle => 'Check your email';

  @override
  String get requiredActionCheckEmailDescription =>
      'We sent a verification link to your email address. Open it to continue.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Resend verification email';

  @override
  String get requiredActionVerificationEmailSent =>
      'Verification email sent. Check your inbox.';

  @override
  String get requiredActionSignOut => 'Sign out';

  @override
  String get dangerZoneSectionTitle => '危险区域';

  @override
  String get dangerZoneSectionDescription => '不可逆转且具有破坏性的操作';

  @override
  String get dangerZoneDisableTitle => '禁用账号';

  @override
  String get dangerZoneDisableDescription => '暂时禁用您的账号。之后可以通过重新登录来重新激活。';

  @override
  String get dangerZoneDisableConfirmDescription =>
      '禁用您的账号将使您退出所有会话。您可以通过再次登录随时重新启用您的账号。';

  @override
  String get dangerZoneDeleteTitle => '删除账号';

  @override
  String get dangerZoneDeleteDescription => '永久删除您的账号及所有相关数据。此操作无法撤销。';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      '在删除账号前，请在 Plutonium 设置中取消您的有效 Plutonium 订阅。';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => '无法删除账号';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      '您不能在拥有社群的情况下删除账号。请先转移以下社群的所有权：';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return '及另外 $count 个';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return '要转移所有权，请前往 $settingsPath 并使用转移所有权选项。';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      '您确定要删除您的账号吗？此操作将安排您的账号进行永久删除。';

  @override
  String get dangerZoneDeleteBullet1 => '您可以在 14 天内取消删除流程';

  @override
  String get dangerZoneDeleteBullet2 => '14 天后，您的账号将被永久删除';

  @override
  String get dangerZoneDeleteBullet3 => '删除处理完成后，您将无法恢复对您账号的访问权限';

  @override
  String get dangerZoneDeleteBullet4 => '删除账号后，您将无法删除您发送的消息';

  @override
  String get dangerZoneDeleteDisclaimer =>
      '如果您想先导出数据或删除消息，请在继续操作前访问用户设置中的隐私中心。';

  @override
  String get claimAccountTitle => '认领您的账号';

  @override
  String get claimAccountDescription =>
      '通过添加电子邮件和密码来认领您的账号。在完成之前，我们将发送验证码来确认您的电子邮件。';

  @override
  String get claimAccountEmailLabel => '邮箱';

  @override
  String get claimAccountPasswordLabel => '密码';

  @override
  String get claimAccountSendCode => '发送验证码';

  @override
  String get claimAccountVerifyDescription =>
      '输入我们发送到您邮箱的验证码以完成验证。验证成功后，您将可以设置密码。';

  @override
  String get claimAccountSuccess => '账户已成功认领';

  @override
  String get importantInformation => '重要信息：';

  @override
  String get genericError => '发生错误';

  @override
  String get networkErrorMessage => 'Something went wrong. Please try again.';

  @override
  String get invalidCode => '验证码无效';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count年前',
      one: '1年前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个月前',
      one: '1个月前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count天前',
      one: '1天前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count小时前',
      one: '1小时前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分钟前',
      one: '1分钟前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks ago',
      one: '1 week ago',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count minutes',
      one: 'in 1 minute',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count hours',
      one: 'in 1 hour',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count days',
      one: 'in 1 day',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count weeks',
      one: 'in 1 week',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count months',
      one: 'in 1 month',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count years',
      one: 'in 1 year',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => '刚刚';

  @override
  String get authorizedAppsTitle => '已授权的应用';

  @override
  String authorizedAppsDescription(String productName) {
    return '以下应用已被授予访问您的$productName账户的权限。';
  }

  @override
  String get authorizedAppsEmptyTitle => '无已授权的应用';

  @override
  String get authorizedAppsEmptyDescription => '您尚未授权任何应用访问您的账户。';

  @override
  String get authorizedAppsLoadError => '无法加载已授权的应用';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return '授权于 $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => '已授予的权限';

  @override
  String get authorizedAppsRevoke => '撤销';

  @override
  String get authorizedAppsRevokeTitle => '撤销应用访问权限';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return '您确定要撤销对 $appName 的访问权限吗？该应用将无法再访问您的账户。';
  }

  @override
  String get authorizedAppsScopeIdentify => '访问您的基本个人资料信息（用户名、头像等）';

  @override
  String get authorizedAppsScopeEmail => '查看您的电子邮件地址';

  @override
  String get authorizedAppsScopeGuilds => '查看您所在的社群';

  @override
  String get authorizedAppsScopeConnections => '查看您已连接的账户';

  @override
  String get authorizedAppsScopeBot => '添加具有所需权限的机器人到社群';

  @override
  String get authorizedAppsScopeAdmin => '访问管理端点';

  @override
  String get privacyPendingDeletionTitle => '待删除';

  @override
  String get blockedUsersTitle => '已屏蔽的用户';

  @override
  String get blockedUsersDescription => '被屏蔽的用户无法向您发送好友请求或直接给您发消息。';

  @override
  String get blockedUsersEmptyTitle => '无已屏蔽的用户';

  @override
  String get blockedUsersEmptyDescription => '您尚未屏蔽任何人。';

  @override
  String get blockedUsersLoadError => '无法加载已屏蔽的用户';

  @override
  String get blockedUsersUnblock => '解除屏蔽';

  @override
  String get blockedUsersUnblockTitle => '解除屏蔽用户';

  @override
  String blockedUsersUnblockDescription(String username) {
    return '您确定要解除对 $username 的屏蔽吗？';
  }

  @override
  String get blockedUsersCopyTag => '复制用户名';

  @override
  String get blockedUsersCopyId => '复制用户ID';

  @override
  String get userProfileLoadError => '无法加载个人资料';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => '重试';

  @override
  String get userProfileMessage => '发送消息';

  @override
  String get userProfileVoiceCall => '语音通话';

  @override
  String get userProfileVideoCall => '视频通话';

  @override
  String get userProfileEditProfile => '编辑个人资料';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName 员工';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName 社区团队';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName 合作伙伴';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName Bug Hunter';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return '$productName Plutonium';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Plutonium 订阅者，始于 $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return '$productName Visionary';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Visionary，始于 $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return '共同好友 ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return '共同社群 ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => '共同好友';

  @override
  String get userProfileMutualCommunitiesTitle => '共同社群';

  @override
  String get userProfileNoMutualFriends => '未找到共同好友。';

  @override
  String get userProfileNoMutualCommunities => '未找到共同社群。';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return '昵称：$nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => '打开私信';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return '您已屏蔽 $username。除非您解除屏蔽，否则您将无法发送消息。';
  }

  @override
  String get blockedUserComposerBarrierAction => '解除屏蔽';

  @override
  String get userProfileOpenDm => '打开私信';

  @override
  String get userProfileNoteTitle => '备注';

  @override
  String get userProfileNoteVisibility => '（仅您可见）';

  @override
  String get userProfileNoteSave => '保存';

  @override
  String get userProfileNoteDelete => '删除';

  @override
  String get userProfileNoteEmpty => '点击添加备注';

  @override
  String get userProfileMemberSince => '加入时间';

  @override
  String get userProfileAboutMe => '关于我';

  @override
  String get userProfileRoles => 'Roles';

  @override
  String get memberRoleAdd => 'Add role';

  @override
  String memberRoleRemove(String roleName) {
    return 'Remove role $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'This user has no roles in this community.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'No roles yet. Add roles in $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'No roles available';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'There are no roles to assign in this community at this time, but you can create a new role in $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Community settings';

  @override
  String get guildSettingsRolesTab => 'Roles';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Local time';

  @override
  String get userProfileSameTimeAsYou => 'Same time as you';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration ahead of you';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration behind you';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hours',
      one: '1 hour',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes',
      one: '1 minute',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hours',
      one: '1 hour',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => '复制用户名';

  @override
  String get userProfileCopyUserId => '复制用户 ID';

  @override
  String get userProfileViewMainProfile => '查看主页';

  @override
  String get userProfileViewCommunityProfile => '查看社群资料';

  @override
  String get userProfileBlockUser => '屏蔽用户';

  @override
  String get userProfileUnblockUser => '解除屏蔽';

  @override
  String get userProfileRemoveFriend => '删除好友';

  @override
  String get userProfileBlockConfirmTitle => '屏蔽用户';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return '您确定要屏蔽 $username 吗？';
  }

  @override
  String get userProfileUnblockConfirmTitle => '解除屏蔽';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return '您确定要解除屏蔽 $username 吗？';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => '删除好友';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return '您确定要将 $username 从好友列表中删除吗？';
  }

  @override
  String get userProfileFailedOpenDm => '无法打开私信';

  @override
  String get userProfileFailedSaveNote => '无法保存备注';

  @override
  String get userProfileActionFailed => '操作失败，请重试';

  @override
  String get userProfileChangeNickname => '更改昵称';

  @override
  String get userProfileKick => '踢出';

  @override
  String get userProfileBan => '封禁';

  @override
  String get userProfileTimeout => '禁言';

  @override
  String get userProfileRemoveTimeout => '解除禁言';

  @override
  String get userProfileTransferOwnership => '转让所有权';

  @override
  String get userProfileReportUser => '举报用户';

  @override
  String get userProfileReportMessage => '举报消息';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '踢出 $username？';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return '您确定要踢出 $username 吗？他们可以重新加入。';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => '解除禁言？';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return '解除禁言后，$username 将可以再次发送消息、添加表情和加入语音频道。';
  }

  @override
  String get userProfileTransferConfirmTitle => '转移所有权？';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return '将此社区的所有权转移给 $username？此操作不可撤销，您将失去所有管理员权限。';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '封禁 $username';
  }

  @override
  String get userProfileBanDurationLabel => '封禁时长';

  @override
  String get userProfileBanCustomSecondsLabel => '自定义时长（秒）';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return '任意值，从 $min 到 $max 秒';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => '删除消息记录';

  @override
  String get userProfileBanDeleteNone => '不删除任何消息';

  @override
  String get userProfileBanDelete24h => '过去 24 小时';

  @override
  String get userProfileBanDelete7d => '过去 7 天';

  @override
  String get userProfileBanReasonLabel => '原因（选填）';

  @override
  String get userProfileBanReasonHint => '输入封禁原因';

  @override
  String get userProfileBanSubmit => '封禁成员';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '禁言 $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => '禁言时长';

  @override
  String get userProfileTimeoutSubmit => '禁言成员';

  @override
  String get userProfileNicknameLabel => '昵称';

  @override
  String get userProfileNicknameHint => '输入昵称';

  @override
  String get userProfileNicknameSave => '保存';

  @override
  String userProfileKickSuccess(String username) {
    return '$username 已被踢出';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username 已被封禁';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username 已被禁言';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return '已解除对 $username 的禁言';
  }

  @override
  String get userProfileNicknameSuccess => '昵称已更新';

  @override
  String get userProfileTransferSuccess => '所有权已转移';

  @override
  String get durationPermanent => '永久';

  @override
  String get duration60Seconds => '60 秒';

  @override
  String get duration5Minutes => '5 分钟';

  @override
  String get duration10Minutes => '10 分钟';

  @override
  String get duration1Hour => '1 小时';

  @override
  String get duration12Hours => '12 小时';

  @override
  String get duration1Day => '1 天';

  @override
  String get duration3Days => '3 天';

  @override
  String get duration5Days => '5 天';

  @override
  String get duration1Week => '1 周';

  @override
  String get duration2Weeks => '2 周';

  @override
  String get duration1Month => '1 个月';

  @override
  String get durationCustom => '自定义…';

  @override
  String get iarReportUserTitle => '举报用户';

  @override
  String get iarReportGuildTitle => 'Report community';

  @override
  String get iarReportGuildPreconfirmBody =>
      'If this report is about a specific message in this community, report that message instead. Message reports give our safety team the clearest context, and adding details in the comments can help us review it faster. Only continue with reporting the community as a whole if reporting a message would not capture the broader issue.';

  @override
  String get iarContinueToReportCommunity => 'Continue to report community';

  @override
  String get iarPreviewCommunitySubtitle => 'Community';

  @override
  String get iarReasonHarassmentGuildLabel => 'Harassment or targeted abuse';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Community facilitates pile-ons or targeted abuse.';

  @override
  String get iarReasonHateGuildDescription =>
      'Promotes hatred against protected groups.';

  @override
  String get iarReasonTerrorismLabel => 'Terrorism or violent extremism';

  @override
  String get iarReasonTerrorismDescription =>
      'Promotes, recruits for, or coordinates violent extremist activity.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Mature content or unsafe gating';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Mature content without proper gating.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Endangers minors or hosts child-exploitation content.';

  @override
  String get iarReasonRaidLabel => 'Raid coordination';

  @override
  String get iarReasonRaidDescription =>
      'Coordinates raids, brigading, or harassment against people or communities.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Community exists to spam, scam, or abuse the platform.';

  @override
  String get iarReasonMalwareGuildLabel => 'Malware distribution';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distributes malware, credential theft, or harmful files.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Privacy violation or doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Shares personal info, stalks users, or coordinates privacy abuse.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Encourages self-harm';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Encourages suicide, self-harm, or eating disorders.';

  @override
  String get iarReasonInappropriateProfile => '不当的个人资料';

  @override
  String get iarReasonInappropriateProfileDescription => '该用户的个人资料包含不当内容';

  @override
  String typingIndicatorOne(String name) {
    return '$name 正在输入...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 和 $name2 正在输入...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1、$name2 和 $name3 正在输入...';
  }

  @override
  String get typingIndicatorMultiple => '多人正在输入...';

  @override
  String get typingIndicatorHandful => '一群键盘侠正在集结...';

  @override
  String get typingIndicatorSymphony => '一场键盘敲击交响曲正在上演...';

  @override
  String get typingIndicatorFiesta => '这里正在进行一场激烈的打字狂欢！';

  @override
  String get typingIndicatorApocalypse => '哇，这是打字末日';

  @override
  String systemJoinGladYoureHere(String username) {
    return '欢迎你，$username！很高兴你来到这里！';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return '欢迎你，$username！请随意。';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return '你好，$username！很高兴你来到这里。';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return '你好，$username！随时可以加入。';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return '嘿 $username，很高兴你来到这里！';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return '嘿，$username！希望你在这里玩得开心。';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return '嘿，$username，欢迎加入！';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return '很高兴你来了，$username！';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return '欢迎加入，$username！';
  }

  @override
  String systemJoinWelcome(String username) {
    return '欢迎你，$username！';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return '欢迎你，$username！很高兴你来到这里。';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return '欢迎你，$username！希望你在这里玩得开心。';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return '欢迎你，$username！你的下一场对话从这里开始。';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return '欢迎你，$username。很高兴你来到这里。';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return '很高兴见到你，$username！欢迎加入。';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return '你来了，$username！很高兴有你加入我们。';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return '你已到达，$username！我们开始吧。';
  }

  @override
  String get relativeTimeShortNow => '现在';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分钟',
      one: '1分钟',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count小时',
      one: '1小时',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count天',
      one: '1天',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个月',
      one: '1个月',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count年',
      one: '1年',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => '我的设备';

  @override
  String get linkedDevicesDescription => '查看当前登录到您账户的所有设备。撤销任何您不认识的会话。';

  @override
  String get linkedDevicesCurrentDevice => '当前设备';

  @override
  String get linkedDevicesOtherDevices => '其他设备';

  @override
  String get linkedDevicesEnterSelection => '进入选择模式';

  @override
  String get linkedDevicesExitSelection => '退出选择模式';

  @override
  String get linkedDevicesSelectAll => '全选';

  @override
  String get linkedDevicesClearSelection => '清除选择';

  @override
  String get linkedDevicesRevokeTooltip => '撤销设备';

  @override
  String get linkedDevicesSignOutAll => '退出所有其他设备';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '退出 $count 台设备',
      one: '退出 1 台设备',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '退出 $count 台设备',
      one: '退出 1 台设备',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => '退出所有其他设备';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '这将使选定的设备退出您的账户。您需要在此类设备上重新登录。',
      one: '这将使选定的设备退出您的账户。您需要在此设备上重新登录。',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      '这将使选定的设备退出您的账户。您需要在此类设备上重新登录。';

  @override
  String get linkedDevicesSignOutConfirm => '继续';

  @override
  String get linkedDevicesLogoutDisclaimer => '您将不得不在所有已退出登录的设备上重新登录';

  @override
  String get linkedDevicesLoadErrorTitle => '网络错误';

  @override
  String get linkedDevicesLoadErrorDescription => '我们遇到了连接时空连续体的麻烦。请检查您的连接并重试。';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '设备已撤销',
      one: '设备已撤销',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => '无法退出登录。请重试。';

  @override
  String get linkedDevicesUnknownOs => '未知操作系统';

  @override
  String get linkedDevicesUnknownPlatform => '未知平台';

  @override
  String slowmodeLabel(String duration) {
    return '$duration 慢速模式';
  }

  @override
  String get slowmodeTooltipActive => '您处于慢速模式。请等待后再发送下一条消息。';

  @override
  String get slowmodeTooltipImmune => '慢速模式已启用，但您不受影响。';

  @override
  String get slowmodeStatusEnabled => 'Slowmode is enabled';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Slowmode is active ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Slowmode is set to $durationLabel, but you are immune.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Slowmode is set to $durationLabel. Wait before sending another message.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Slowmode is set to $durationLabel for this channel.';
  }

  @override
  String get channelNoSendPermissionHint => '你无法在此频道发送消息。';

  @override
  String systemDmComposerBarrier(String productName) {
    return '$productName 员工发送的系统公告。你无法在此回复。';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled => '此社区的消息已暂时暂停。';

  @override
  String get channelComposerBarrierTimedOut => '你已被禁言。消息、反应和语音功能将在禁言期结束后恢复。';

  @override
  String get channelComposerBarrierUnclaimedAccount => '你需要认领你的账号才能在此社区发送消息。';

  @override
  String get channelComposerBarrierUnverifiedEmail => '你需要验证你的邮箱才能在此社区发送消息。';

  @override
  String get channelComposerBarrierAccountTooNew => '你的账号太新，无法在此社区发送消息。';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      '你加入此社区的时间不够长，无法发送消息。';

  @override
  String get channelComposerBarrierNoPhoneNumber => '你需要验证手机号才能在此社区发送消息。';

  @override
  String get channelComposerBarrierVerifyEmail => '验证邮箱';

  @override
  String get channelComposerBarrierVerifyPhone => '验证手机';

  @override
  String chatAttachmentTooMany(int max) {
    return '附件过多（最多 $max 个）';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName 超出大小限制 ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge => '这些文件太大，无法一起发送';

  @override
  String get chatAttachmentDropToUpload => '拖放文件以上传';

  @override
  String get chatAttachmentDropToSend => '拖放文件立即发送';

  @override
  String get chatAttachmentSendVoiceMessage => '发送语音消息';

  @override
  String get voiceMessageTitle => '语音消息';

  @override
  String get voiceMessageHoldHint => '按住录制。向上拖动可锁定，松开即可发送。';

  @override
  String get voiceMessageDiscard => '丢弃语音消息';

  @override
  String get voiceMessageSend => '发送语音消息';

  @override
  String get voiceMessageMicPermissionDenied => '无法开始录制。请允许麦克风访问。';

  @override
  String get voiceMessageRecordingNotSupported => '此设备不支持语音录制。';

  @override
  String get voiceMessageMicInUse => '请离开语音通话以录制语音消息。';

  @override
  String get voiceMessageRecordingFailed => '录制失败。请重试。';

  @override
  String get voiceMessageSendFailed => '无法发送语音消息。请重试。';

  @override
  String get voiceMessageRecordingHint => '现在说话。完成后按停止 — 之后可以修剪。';

  @override
  String get voiceMessageReviewHint => '拖动句柄进行修剪，然后按发送。';

  @override
  String get voiceMessageStop => '停止';

  @override
  String get voiceMessageStartRecording => '开始录制';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => '播放';

  @override
  String get voiceMessagePause => '暂停';

  @override
  String get voiceMessageSeekForward => 'Seek forward';

  @override
  String get voiceMessageSeekBackward => 'Seek backward';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return '选择内容必须至少为 $secondsString 秒。';
  }

  @override
  String get chatAttachmentEditTitle => '编辑附件';

  @override
  String get chatAttachmentFilenameLabel => '文件名';

  @override
  String get chatAttachmentDescriptionLabel => '描述';

  @override
  String get chatAttachmentDescriptionHint => '可选的替代文本';

  @override
  String get chatAttachmentSpoilerLabel => '标记为剧透';

  @override
  String get chatAttachmentRemove => '移除附件';

  @override
  String get chatAttachmentDownload => '下载';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => '附件已过期';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand ($count lines)',
      one: 'Expand ($count line)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Collapse ($count lines)',
      one: 'Collapse ($count line)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand ($count rows)',
      one: 'Expand ($count row)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Collapse ($count rows)',
      one: 'Collapse ($count row)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count lines left)',
      one: '... ($count line left)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rows left)',
      one: '... ($count row left)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'View whole file';

  @override
  String get chatTextualPreviewChangeLanguage => 'Change language';

  @override
  String get chatTextualPreviewSearchLanguage => 'Search language…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntax highlighting';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'No results found';

  @override
  String get chatTextualPreviewMoreOptions => 'More options';

  @override
  String get chatTextualPreviewWrapText => 'Wrap text';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'File is too large for inline preview (limit $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Unable to load preview.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Plain text';

  @override
  String get chatTextualPreviewCopy => 'Copy';

  @override
  String get chatAttachmentSourceGallery => '图库';

  @override
  String get chatAttachmentSourceCamera => '相机';

  @override
  String get chatAttachmentSourceBrowse => '浏览文件';

  @override
  String get chatAttachmentPasteTooltip => '从剪贴板粘贴图片';

  @override
  String get chatAttachmentSpoiler => '剧透';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => '显示剧透';

  @override
  String get matureMediaRevealButton => '显示';

  @override
  String get matureMediaRevealHint => '点击显示';

  @override
  String get matureContentTitle => '不适宜内容';

  @override
  String get matureCommunityTitle => '成熟社群';

  @override
  String get matureCategoryTitle => '成熟分类';

  @override
  String get matureChannelTitle => '成熟频道';

  @override
  String get communityContentWarningTitle => '社群内容警告';

  @override
  String get categoryContentWarningTitle => '分类内容警告';

  @override
  String get channelContentWarningTitle => '频道内容警告';

  @override
  String get defaultContentWarningBody => '此内容包含敏感信息。';

  @override
  String get matureCommunityBody => '此社群已标记为包含成人内容，可能包含不适合某些用户的内容。';

  @override
  String get matureCategoryBody => '此分类已标记为包含成人内容，可能包含不适合某些用户的内容。';

  @override
  String get matureChannelBody => '此频道已标记为包含成人内容，可能包含不适合某些用户的内容。';

  @override
  String get matureVoiceChannelBody => '此语音频道已标记为包含成人内容，可能包含不适合某些用户的内容。';

  @override
  String get matureLinkChannelBody => '此链接频道已标记为包含成人内容，可能会打开不适合某些用户的内容。';

  @override
  String get matureCommunityUnavailableBody => '您的账号无法访问此成熟社群。';

  @override
  String get matureCategoryUnavailableBody => '您的账号无法访问此成熟分类。';

  @override
  String get matureChannelUnavailableBody => '您的账号无法访问此成熟频道。';

  @override
  String get matureContentProceedButton => '继续';

  @override
  String get matureContentUnderstandButton => '我明白了';

  @override
  String get matureContentOpenLinkButton => '打开链接';

  @override
  String get sensitiveContentSectionTitle => '敏感内容';

  @override
  String get sensitiveContentSectionDescription => '控制在不同情境下如何过滤成人或敏感媒体';

  @override
  String get sensitiveContentFriendDmLabel => '好友私信';

  @override
  String get sensitiveContentNonFriendDmLabel => '他人私信';

  @override
  String get sensitiveContentGuildLabel => '社群频道消息';

  @override
  String get sensitiveContentFilterShow => '显示';

  @override
  String get sensitiveContentFilterBlur => '模糊';

  @override
  String get sensitiveContentFilterBlock => '屏蔽';

  @override
  String get sensitiveContentBlurUnscannedLabel => '安全扫描完成前模糊媒体';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      '启用后，图片和视频在内容安全扫描完成前将保持模糊状态。';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      '此设置对您的账号始终处于开启状态。';

  @override
  String get sensitiveContentResetButton => '重置';

  @override
  String get sensitiveContentSaveButton => '保存';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
      one: '1 个文件',
    );
    return '正在上传 $_temp0';
  }

  @override
  String get chatCancelUpload => '取消上传';

  @override
  String chatAttachmentExpiresOn(String date) {
    return '将于 $date 过期';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return '将于 $start 和 $end 之间过期';
  }

  @override
  String get connectionsTitle => '连接';

  @override
  String connectionsDescription(String productName) {
    return '将外部账号和域名链接到您的 $productName 个人资料。已验证的连接将显示在您的个人资料上供他人查看。';
  }

  @override
  String get connectionsEmptyTitle => '暂无连接';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      '链接您的 Bluesky 账号或验证域名所有权，即可在您的个人资料上显示。';

  @override
  String get connectionsEmptyDescriptionDomainOnly => '验证域名所有权，即可在您的个人资料上显示。';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => '域名';

  @override
  String get connectionsAddBlueskyAriaLabel => '添加 Bluesky 连接';

  @override
  String get connectionsAddDomainAriaLabel => '添加域名连接';

  @override
  String get connectionEdit => '编辑';

  @override
  String get connectionRemove => '移除';

  @override
  String get connectionVerifiedLabel => '此连接已验证。';

  @override
  String get connectionUnverifiedLabel => '此连接未经验证。';

  @override
  String get connectionAddTitle => '添加连接';

  @override
  String get connectionTypeLabel => '连接类型';

  @override
  String get connectionHandleLabel => '用户名';

  @override
  String get connectionDomainLabel => '域名';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => '您已添加此连接。';

  @override
  String get connectionConnectBluesky => '通过 Bluesky 连接';

  @override
  String get connectionContinue => '继续';

  @override
  String get connectionVerifyTitle => '验证连接';

  @override
  String get connectionVerifyInstructions => '使用下方的记录来证明域名所有权。';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT 记录';

  @override
  String get connectionDnsHostLabel => '主机';

  @override
  String get connectionDnsValueLabel => '值';

  @override
  String get connectionCopyHost => '复制主机';

  @override
  String get connectionCopyValue => '复制值';

  @override
  String get connectionCopied => '已复制！';

  @override
  String get connectionTokenFileTitle => '提供令牌文件';

  @override
  String get connectionTokenFileDescription =>
      '下载 **fluxer-verification** 并将其放置在您的 **.well-known** 文件夹中，以便我们验证域名。';

  @override
  String get connectionTokenFileDownload => '下载 fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return '该文件包含我们将从 **$dnsUrl** 获取的验证令牌。';
  }

  @override
  String get connectionSaveTokenDialogTitle => '保存 fluxer-verification';

  @override
  String get connectionVerifyButton => '验证';

  @override
  String get connectionBack => '返回';

  @override
  String get connectionEditTitle => '编辑连接';

  @override
  String get connectionEditDescription => '选择谁可以在您的个人资料中看到此连接。';

  @override
  String get connectionVisibilityEveryone => '所有人';

  @override
  String get connectionVisibilityEveryoneDesc => '允许任何人查看您个人资料中的此连接';

  @override
  String get connectionVisibilityFriends => '好友';

  @override
  String get connectionVisibilityFriendsDesc => '允许您的好友查看此连接';

  @override
  String get connectionVisibilityCommunityMembers => '社区成员';

  @override
  String get connectionVisibilityCommunityMembersDesc => '允许您所在社区的成员查看此连接';

  @override
  String get connectionRemoveTitle => '移除连接';

  @override
  String get connectionRemoveDescription => '您确定要移除此连接吗？此操作无法撤销。';

  @override
  String get connectionRemoveConfirm => '移除';

  @override
  String get connectionsLoadError => '加载连接失败';

  @override
  String get connectionsReorderError => '更新顺序失败';

  @override
  String get connectionInitiateFailed => '无法开始验证。请重试。';

  @override
  String get connectionVerifyFailed => '无法验证。请检查您的 DNS 记录后重试。';

  @override
  String get connectionBlueskyAuthorizeFailed => '无法启动 Bluesky 授权。';

  @override
  String get connectionUpdateFailed => '无法更新连接';

  @override
  String get connectionRemoveFailed => '无法移除连接';

  @override
  String get connectionTokenSavedToast => '已保存 fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => '无法保存文件';

  @override
  String get connectionEnterHandle => '请输入 Bluesky 用户名。';

  @override
  String get connectionEnterDomain => '请输入域名。';

  @override
  String get lookAndFeelTitle => '外观';

  @override
  String get lookAndFeelThemeSectionTitle => '主题';

  @override
  String get lookAndFeelThemeSectionDescription => '在深色、煤黑色或浅色外观之间进行选择。';

  @override
  String get lookAndFeelHdrSectionTitle => 'High dynamic range';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Control how HDR images are displayed on HDR-capable monitors.';

  @override
  String get lookAndFeelHdrFullName => 'Full dynamic range';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Display HDR images at full brightness and color range.';

  @override
  String get lookAndFeelHdrStandardName => 'Standard range';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Tone-map HDR images to standard range, reducing peak brightness.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'High dynamic range display mode';

  @override
  String get lookAndFeelThemeDark => '深色主题';

  @override
  String get lookAndFeelThemeCoal => '煤黑色主题';

  @override
  String get lookAndFeelThemeLight => '浅色主题';

  @override
  String get lookAndFeelThemeSystem => '系统主题';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel => '跨设备同步主题';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      '启用后，主题更改将同步到您的所有设备。禁用后，此设备将使用自己的主题设置。';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      '系统主题会自动禁用同步，以跟踪此设备上的系统偏好设置。';

  @override
  String get lookAndFeelThemeSyncFailed => '无法将主题同步到您的帐户。请重试。';

  @override
  String get lookAndFeelChatFontScalingTitle => '聊天字体缩放';

  @override
  String get lookAndFeelChatFontScalingDescription => '调整聊天区域的字体大小。';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Chat font size';

  @override
  String get lookAndFeelAppZoomTitle => 'App zoom level';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Adjust the application\'s zoom level.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Messages';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Choose how messages are displayed in chat channels.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Space between message groups';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Message display mode';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Comfy';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Spacious layout with clear visual separation between messages.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Dense';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximizes visible messages with minimal spacing.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Hide user avatars';

  @override
  String get lookAndFeelInterfaceTitle => '界面';

  @override
  String get lookAndFeelInterfaceDescription => '自定义界面元素和行为。';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle => '频道列表输入指示器';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      '选择在有人在频道中输入时，输入指示器如何在频道列表中显示。';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName => '输入指示器 + 头像';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      '在频道列表中显示带有用户头像的输入指示器';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => '仅输入指示器';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      '仅显示输入指示器，不显示头像';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => '隐藏';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      '不在频道列表中显示输入指示器';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      '在选定频道显示输入状态';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      '禁用时（默认），输入指示器不会显示在您当前正在查看的频道中。';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => '键盘提示';

  @override
  String get lookAndFeelKeyboardHintsDescription => '控制键盘快捷键提示是否显示在工具提示中。';

  @override
  String get lookAndFeelHideKeyboardHintsLabel => '隐藏工具提示中的键盘提示';

  @override
  String get lookAndFeelHideKeyboardHintsDescription => '启用后，工具提示中的快捷键徽章将被隐藏。';

  @override
  String get lookAndFeelNekoTitle => '杂项';

  @override
  String get lookAndFeelNekoDescription => '杂项界面选项。';

  @override
  String get lookAndFeelShowNekoLabel => '显示 Neko';

  @override
  String get lookAndFeelShowNekoDescription => '启用后，Neko 会出现在聊天输入栏附近。';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => '语音频道加入行为';

  @override
  String get lookAndFeelVoiceChannelJoinDescription => '控制您在社区中加入语音频道的方式。';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel => '加入语音频道需要双击';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      '启用后，您需要双击语音频道才能加入。禁用时（默认），单击即可立即加入频道。';

  @override
  String get lookAndFeelChatFontPreviewSample => '敏捷的棕色狐狸跳过懒惰的狗。';

  @override
  String get lookAndFeelGuildSidebarTitle => '服务器边栏';

  @override
  String get lookAndFeelGuildSidebarDescription => '配置服务器边栏如何显示直接消息。';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个社区暂时不可用，因为通量电容器发生故障。',
      one: '由于通量电容器故障，1 个社区暂时不可用。',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Community temporarily unavailable';

  @override
  String get guildUnavailableDescription =>
      'Something went wrong. We\'re working on it.';

  @override
  String get guildNotFoundTitle =>
      'This is not the community you\'re looking for.';

  @override
  String get guildNotFoundDescription =>
      'The community you\'re looking for may have been deleted or you may not have access to it.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName is currently only accessible to $productName staff members';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'temporarily unavailable';

  @override
  String get lookAndFeelCollapseDMsLabel => '将私信折叠到文件夹';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return '启用后，服务器边栏中的未读私信将折叠到 $productName 按钮文件夹中。在私信页面上单击 $productName 按钮可展开或折叠文件夹。';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => '频道列表';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      '控制静音频道在频道列表中的未读指示器行为。';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel => '在静音频道显示未读指示器';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      '启用后，静音频道左侧会显示一个淡化的未读指示器。提及消息无论此设置如何都会显示。';

  @override
  String get lookAndFeelActiveNowSectionTitle => '当前活跃';

  @override
  String get lookAndFeelActiveNowSectionDescription => '控制当前活跃在应用中的显示方式。';

  @override
  String get lookAndFeelShowActiveNowLabel => '在主屏幕上显示当前活跃';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      '在主屏幕上显示当前活跃，以展示在语音频道中活跃的好友。您将看到预览、频道上下文、已在频道中的人以及快速加入的方式。';

  @override
  String get lookAndFeelFavoritesSectionTitle => '收藏夹';

  @override
  String get lookAndFeelFavoritesSectionDescription => '控制收藏夹在应用中的可见性。';

  @override
  String get lookAndFeelEnableFavoritesLabel => '启用收藏夹';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      '启用后，您可以收藏频道，它们将显示在收藏夹部分。禁用后，所有与收藏夹相关的 UI 元素（按钮、菜单项）都将隐藏。您现有的收藏夹将得到保留。';

  @override
  String get favoritesTitle => '收藏夹';

  @override
  String get favoritesEmptyTitle => '暂无收藏';

  @override
  String get favoritesEmptyDescription => '将频道添加到星标，即可在此处找到它们。';

  @override
  String get favoritesWelcomeTitle => '欢迎使用星标频道';

  @override
  String get favoritesWelcomeDescription =>
      '您快速访问喜爱频道、私信和群组的专属空间。在任意频道上按星标即可将其添加至此。';

  @override
  String get favoritesWelcomeTip => '不想要了？随时关闭。';

  @override
  String get favoritesDisableButton => '关闭星标频道';

  @override
  String get favoritesAddedToast => '已添加到星标';

  @override
  String get favoritesRemovedToast => '已从星标移除';

  @override
  String get favoritesHiddenToast => '星标频道已隐藏';

  @override
  String get favoritesMute => '静音星标频道';

  @override
  String get favoritesUnmute => '取消静音星标频道';

  @override
  String get favoritesHeaderMenu => '星标频道菜单';

  @override
  String get favoritesCreateCategory => '创建分类';

  @override
  String get favoritesCategoryNameLabel => '分类名称';

  @override
  String get favoritesHideMutedChannels => '隐藏静音频道';

  @override
  String get favoritesShowMutedChannels => '显示静音频道';

  @override
  String get favoritesSetNickname => '设置昵称';

  @override
  String get favoritesNicknameLabel => '昵称';

  @override
  String get favoritesSaveNickname => '保存昵称';

  @override
  String get favoritesMoveToCategory => '移至分类';

  @override
  String get favoritesUncategorized => '未分类';

  @override
  String get favoritesOtherCategory => '其他';

  @override
  String get favoritesRemoveFromFavorites => '从星标移除';

  @override
  String get favoritesAddToFavorites => '添加到星标';

  @override
  String get favoritesAddToSavedMedia => 'Add to saved media';

  @override
  String get favoritesRemoveFromSavedMedia => 'Remove from saved media';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Add to URL-only GIF favorites';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Remove from URL-only GIF favorites';

  @override
  String get savedMediaAddTitle => 'Add to saved media';

  @override
  String get savedMediaFormNameLabel => 'Name';

  @override
  String get savedMediaFormNameHint => 'My awesome media';

  @override
  String get savedMediaFormAltTextLabel => 'Alt text';

  @override
  String get savedMediaFormAltTextHint => 'Describe the media';

  @override
  String get savedMediaFormTagsLabel => 'Tags';

  @override
  String get savedMediaFormTagsHint => 'funny, reaction, work';

  @override
  String get savedMediaSaveError => 'Could not update saved media.';

  @override
  String get savedMediaNameRequired => 'Name is required.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'How should we save your GIF favorites?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'You can store starred GIFs as URL-only favorites or upload them to your saved media. Pick the one that fits how you use them. You can change it any time in Settings > Advanced > Media.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-only favorites (default): synced across your devices, no upload, doesn\'t count against saved media. The original media may disappear if its host removes it.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Saved media: uploaded, taggable, searchable, and persistent, but counts against your saved media limit.';

  @override
  String get gifFavoriteFirstTimeHint => 'We\'ll only ask once.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Use URL-only (recommended)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Use saved media';

  @override
  String get favoritesHideConfirmTitle => '隐藏星标频道';

  @override
  String get favoritesHideConfirmDescription =>
      '这将隐藏所有与星标频道相关的界面元素，包括按钮和菜单项。您现有的星标频道将得到保留，并可随时在“设置”>“高级”>“外观”中重新启用。';

  @override
  String get favoritesDirectMessageSubtitle => '私信';

  @override
  String get messagesMediaDisplayGroupTitle => '显示';

  @override
  String get messagesMediaDisplayGroupDescription => '控制消息、媒体和其他内容的显示方式。';

  @override
  String get messagesMediaMediaGroupTitle => '媒体';

  @override
  String get messagesMediaMediaGroupDescription => '自定义媒体大小偏好设置和按钮。';

  @override
  String get messagesMediaInputGroupTitle => '输入';

  @override
  String get messagesMediaInputGroupDescription => '自定义消息输入设置。';

  @override
  String get messagesMediaSidebarGroupTitle => '侧边栏';

  @override
  String get messagesMediaSidebarGroupDescription => '配置社区侧边栏的显示方式。';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel => '默认隐藏静音频道';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      '加入新社区时，自动在侧边栏隐藏静音频道';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle => '默认隐藏静音频道？';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      '您加入的新社区将自动隐藏静音频道。是否也希望将此设置应用于您所有现有的社区？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle => '停止默认隐藏静音频道？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      '您加入的新社区将不再自动隐藏静音频道。是否也希望在您所有现有的社区中显示静音频道？';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction => '应用于所有社区';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction => '在所有社区中显示';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction => '仅新社区';

  @override
  String get messagesMediaDisplaySectionTitle => '媒体显示';

  @override
  String get messagesMediaDisplaySectionDescription =>
      '控制图片、视频和其他媒体的显示方式。所有媒体都会被调整大小和转换。无法压缩到预览的超大文件将不会嵌入，无论这些设置如何。';

  @override
  String get messagesMediaDisplayInlineEmbedLabel => '作为链接发布到聊天时';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return '直接上传到 $productName 时';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => '链接预览';

  @override
  String get messagesMediaLinkPreviewsSectionDescription => '控制网站链接在聊天中的预览方式';

  @override
  String get messagesMediaLinkPreviewsToggleLabel => '显示嵌入内容并预览网站链接';

  @override
  String get messagesMediaReactionsSectionTitle => '表情回应';

  @override
  String get messagesMediaReactionsSectionDescription => '配置消息的表情回应';

  @override
  String get messagesMediaReactionsToggleLabel => '在消息上显示表情回应';

  @override
  String get messagesMediaSpoilersSectionTitle => '剧透内容';

  @override
  String get messagesMediaSpoilersSectionDescription => '控制剧透内容的显示方式';

  @override
  String get messagesMediaSpoilersRadioLabel => '显示剧透内容';

  @override
  String get messagesMediaSpoilersOnClickName => '点击时';

  @override
  String get messagesMediaSpoilersOnClickDescription => '点击时显示剧透内容';

  @override
  String get messagesMediaSpoilersIfModeratorName => '在我管理的频道中';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      '在你拥有“管理消息”权限的频道中始终显示剧透内容';

  @override
  String get messagesMediaSpoilersAlwaysName => '始终';

  @override
  String get messagesMediaSpoilersAlwaysDescription => '始终显示剧透内容';

  @override
  String get messagesMediaSizeSectionTitle => '媒体大小偏好';

  @override
  String get messagesMediaSizeSectionDescription =>
      '自定义嵌入式和附件媒体的最大显示尺寸。较小的尺寸占用更少的屏幕空间，而较大的尺寸则显示更多细节。';

  @override
  String get messagesMediaSizeEmbedLabel => '链接中的媒体（嵌入式）';

  @override
  String get messagesMediaSizeAttachmentLabel => '上传的附件';

  @override
  String get messagesMediaSizeCompactName => '紧凑型 (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => '较小的媒体尺寸';

  @override
  String get messagesMediaSizeComfortableName => '舒适型 (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription => '较大的媒体尺寸，细节更丰富';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF 行为';

  @override
  String get messagesMediaGifsSectionDescription => '控制 GIF 如何插入聊天';

  @override
  String get messagesMediaGifsAutoSendLabel => '选择 GIF 后自动发送';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Camera uploads';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Choose whether photos and videos taken with the in-app camera are kept on your device';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Save to device';

  @override
  String get messagesMediaAutocompleteSectionTitle => '表情自动补全（冒号补全）';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      '控制输入冒号时表情自动补全中显示的内容。自定义显示的建议以匹配你的偏好。';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel => '在表情自动补全中显示默认表情';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel => '在表情自动补全中显示自定义表情';

  @override
  String get messagesMediaAutocompleteStickersLabel => '在表情自动补全中显示贴纸';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel => '在表情自动补全中显示已保存的媒体';

  @override
  String get messagesMediaEditingSectionTitle => '消息编辑';

  @override
  String get messagesMediaEditingSectionDescription => '控制取消时对编辑草稿的处理方式。';

  @override
  String get messagesMediaEditingPreserveDraftLabel => '取消时保留编辑草稿';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Always underline links';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Dim strikethrough text';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => '私信消息预览';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      '控制私信列表中显示消息预览的时间。';

  @override
  String get accessibilityDmMessagePreviewModeLabel => '私信消息预览模式';

  @override
  String get accessibilityDmMessagePreviewAllName => '所有消息';

  @override
  String get accessibilityDmMessagePreviewAllDescription => '显示所有私信对话的消息预览';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => '仅未读私信';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      '仅显示有未读消息的私信的消息预览';

  @override
  String get accessibilityDmMessagePreviewNoneName => '无';

  @override
  String get accessibilityDmMessagePreviewNoneDescription => '不在私信列表中显示消息预览';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Screen reader';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Control how $productName works with screen readers.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Announce new messages';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Let screen readers announce new messages as they arrive in the open channel. Notification sounds are unaffected.';

  @override
  String get accessibilityTtsGroupTitle => 'Text-to-speech';

  @override
  String get accessibilityTtsGroupDescription =>
      'Choose a speed for spoken text.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Speech playback speed';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Play sample';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Silence sample';

  @override
  String get accessibilityPreviewButtonLabel => 'Preview button';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'This shows how links appear: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Preview User';

  @override
  String get accessibilityKeyboardGroupTitle => 'Keyboard';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Show focus ring on chat textarea';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Escape key exits keyboard mode';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Show context menu shortcuts';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirm before starting calls';

  @override
  String get accessibilityAnimationGroupTitle => 'Animation';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Reduced motion is on, so content animations are paused by default. You can still turn any of these back on to keep it playing.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'Play animated emojis';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'Automatically play GIFs';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Automatically play GIFs when $productName is focused';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Playing despite reduced motion.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Paused by reduced motion. Turn on to keep animated emojis playing.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Paused by reduced motion. Turn on to keep GIFs playing.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Defaults to off on mobile to preserve battery life and data usage.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Sticker animations';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Sticker animation preference';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Always animate';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Stickers will always animate';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animate on interaction';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Stickers will animate when you press them';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Stickers will animate when you hover or interact with them';

  @override
  String get accessibilityStickerNeverAnimateName => 'Never animate';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Stickers will never animate';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Always animating despite reduced motion.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Reduced motion limits stickers to animate on interaction. Choose always animate to override.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Defaults to animate on interaction on mobile to preserve battery life.';

  @override
  String get accessibilityMotionGroupTitle => 'Motion';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sync reduced motion setting with system';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Use this device\'s system reduced motion preference, or customize it below.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reduce motion';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Disable animations and transitions. Currently controlled by your system setting.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Disable animations and transitions throughout the app.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animated emojis, GIFs and stickers stay under your control in the Animation tab.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Start call?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Are you sure you want to start this call?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Start call';

  @override
  String get accessibilityTtsSampleDescription =>
      'Hear the sample line spoken with your chosen speed.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, I\'m from the future. I came here in a time machine that you invented. Now, I need your help to get back to the year 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Speech synthesis is unavailable on this device.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Speech playback failed. Try again, or check that audio output is working.';

  @override
  String get ttsSubstitutionUnknownUser => 'unknown user';

  @override
  String get ttsSubstitutionUnknownRole => 'unknown role';

  @override
  String get ttsSubstitutionUnknownChannel => 'unknown channel';

  @override
  String get ttsSubstitutionCodeBlock => 'code block';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'slash $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName said: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Replying to $replyAuthorName, $authorName said: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'sent a sticker';

  @override
  String get ttsSentAttachment => 'sent an attachment';

  @override
  String ttsSentAttachments(int count) {
    return 'sent $count attachments';
  }

  @override
  String get ttsSentEmbed => 'sent an embed';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author sent $summary';
  }

  @override
  String get dmListSentAnAttachment => '发送了附件';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username 将一条消息固定到了此频道。';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username 将 $userName 添加到了群组。';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username 添加了某人到群组。';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username 已离开群组。';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username 将 $userName 移出了群聊。';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username 移出了群聊中的某人。';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username 将频道名称改为了 $newName。';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username 更改了频道名称。';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username 更改了频道图标。';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username 发起了通话。';
  }

  @override
  String get systemCallJoinTheCall => 'Join the call';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username started a call that lasted $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'You missed a call from $username that lasted $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'You missed a call from $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'a few seconds';

  @override
  String get systemCallDurationMinute => 'a minute';

  @override
  String get systemCallDurationOneYear => '1 year';

  @override
  String get systemCallDurationOneMonth => '1 month';

  @override
  String get systemCallDurationOneWeek => '1 week';

  @override
  String get systemCallDurationOneDay => '1 day';

  @override
  String get systemCallDurationOneHour => '1 hour';

  @override
  String systemCallDurationYears(int count) {
    return '$count years';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count months';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count weeks';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count days';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count hours';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minutes';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Update $productName to view this message.';
  }

  @override
  String get voiceConnectionConfirmTitle => '语音连接确认';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '您已从其他 $count 个设备连接到此语音频道。您想怎么做？',
      one: '您已从其他 1 个设备连接到此语音频道。您想怎么做？',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => '切换到此设备';

  @override
  String get voiceConnectionConfirmJustJoin => '仅加入（保留其他连接）';

  @override
  String get voiceConnectionConfirmDoNothing => '什么都不做，我不想加入';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription => '这是一个语音频道。连接后即可开始交谈！';

  @override
  String get voiceChannelJoin => '加入语音频道';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => '连接到语音';

  @override
  String get voiceChannelNoConnectPermission => '您没有加入此语音频道的权限';

  @override
  String get voiceChannelE2eeEncrypted => '麦克风、摄像头和屏幕共享内容均已进行端到端加密。';

  @override
  String get voiceCallE2eeEncrypted => '麦克风、摄像头和屏幕共享内容均已进行端到端加密。';

  @override
  String get voiceChannelE2eeBroken => '由于此语音频道中存在不支持的参与者，端到端加密不可用。';

  @override
  String get voiceCallE2eeBroken => '由于此通话中存在不支持的参与者，端到端加密不可用。';

  @override
  String get voiceE2eeUpdateRequired => '加入此加密通话前必须更新此客户端。';

  @override
  String get voiceMicPublishFailedStayConnected => '无法启动您的麦克风。您仍在该通话中。';

  @override
  String get voiceChannelStatusConnecting => '正在连接…';

  @override
  String get voiceChannelStatusConnected => '已连接';

  @override
  String get voiceChannelStatusError => '错误';

  @override
  String get voiceParticipantTooltipMobileDevice => '移动设备';

  @override
  String get voiceParticipantTooltipDesktopDevice => '桌面设备';

  @override
  String get voiceParticipantTooltipCommunityMuted => '频道静音';

  @override
  String get voiceParticipantTooltipMuted => '已静音';

  @override
  String get voiceParticipantTooltipCommunityDeafened => '频道禁言';

  @override
  String get voiceParticipantTooltipDeafened => '已禁言';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return '连接：$connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位参与者',
      one: '1 位参与者',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => '离开';

  @override
  String get voiceControlMute => '静音';

  @override
  String get voiceControlUnmute => '取消静音';

  @override
  String get voiceControlDeafen => '禁言';

  @override
  String get voiceControlUndeafen => '取消禁言';

  @override
  String get voiceControlVideo => '视频';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => '屏幕共享';

  @override
  String get voiceScreenShareNotificationText => '正在共享您的屏幕。';

  @override
  String get voiceControlMore => '更多';

  @override
  String get voiceControlDisconnect => '断开连接';

  @override
  String get voiceInChat => 'In voice chat';

  @override
  String get voiceConnectionFailed => 'Connection failed';

  @override
  String get voiceConnectionRetry => 'Try again';

  @override
  String get voiceConnectionDismiss => 'Dismiss';

  @override
  String get voiceConnectionDisconnected => 'Disconnected';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: ${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => 'Measuring latency...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Jump to $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Voice connection';

  @override
  String get voiceConnectionAdvancedStats => 'Advanced';

  @override
  String get voiceShowCallAvatars => 'Show call avatars';

  @override
  String get voiceShowConnectionId => 'Show connection ID';

  @override
  String get voiceAudioProcessing => 'Audio processing';

  @override
  String get voiceConnectionSessionSection => 'Session';

  @override
  String get voiceConnectionDurationLabel => 'Duration';

  @override
  String get voiceConnectionParticipantsLabel => 'Participants';

  @override
  String get voiceConnectionNetworkSection => 'Network';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Send';

  @override
  String get voiceConnectionReceiveLabel => 'Receive';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '${minutes}m ${seconds}s';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency ms';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter ms';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => 'Mute microphone';

  @override
  String get userAreaUnmuteMicrophone => 'Unmute microphone';

  @override
  String get userAreaUserSettings => 'User settings';

  @override
  String get voiceParticipantMenuViewProfile => 'View profile';

  @override
  String get voiceParticipantMenuFocus => 'Focus this person';

  @override
  String get voiceParticipantMenuUnfocus => 'Unfocus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Community mute';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Community deafen';

  @override
  String get voiceParticipantMenuUserVolume => 'User volume';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream volume';

  @override
  String get voiceParticipantModerationFailed =>
      'Couldn\'t update that member. Please try again.';

  @override
  String get voiceControlChat => '聊天';

  @override
  String get voicePanelSettingsSectionTitle => 'Voice settings';

  @override
  String get voicePanelUseEarpieceLabel => 'Use earpiece';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Only show videos';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Only show participants who have their camera on.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Show my own camera';

  @override
  String get voicePrioritizeSpeakersLabel => 'Prioritize speakers';

  @override
  String get voiceTextChatShow => '显示聊天';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 条未读消息',
      one: '# 条未读消息',
    );
    return '显示聊天（$_temp0）';
  }

  @override
  String get voiceCameraPermissionRequired => '视频需要摄像头权限。';

  @override
  String get voiceErrorScreenShareToggle => '无法开始屏幕共享。请重试。';

  @override
  String get voiceErrorScreenSharePermissionDenied => '屏幕共享权限被拒绝。';

  @override
  String get voiceErrorScreenShareUnsupported => '此设备不支持屏幕共享。';

  @override
  String get voiceWatchStream => '观看直播';

  @override
  String get voiceStopWatching => '停止观看';

  @override
  String get voiceStopWatchingCurrentStreamTooltip => '停止观看当前流';

  @override
  String get voiceOwnScreenShareTitle => '你正在直播';

  @override
  String get voiceOwnScreenShareSubtitle => '你的流对参与者直播中。';

  @override
  String get voiceLiveBadge => '直播中';

  @override
  String get dmVoiceViewCall => '查看通话';

  @override
  String get dmVoiceCallFullScreen => '全屏';

  @override
  String get dmVoiceCallFullScreenTooltip => '全屏打开通话';

  @override
  String get dmVoiceStripStatusConnecting => '正在连接…';

  @override
  String get dmVoiceStripStatusInCall => '通话中';

  @override
  String get dmVoiceEmbeddedFallbackTitle => '语音通话';

  @override
  String get dmVoiceCallBarConnecting => '正在连接…';

  @override
  String get dmVoiceCallBarDirectPrimary => '直接通话';

  @override
  String get dmVoiceCallBarGroupPrimary => '群组通话';

  @override
  String get dmVoiceCallBarIssueFallback => '语音问题';

  @override
  String get dmVoiceFullscreenTitle => '语音';

  @override
  String get voiceCallBarGuildConnectedFallback => '语音已连接';

  @override
  String get notificationsPageTitle => '通知';

  @override
  String get notificationsFilterUnreads => '未读';

  @override
  String get notificationsFilterMentions => '提及';

  @override
  String get notificationsBookmarksTooltip => '书签';

  @override
  String get notificationsMentionFilterTooltip => '过滤提及';

  @override
  String get notificationsMentionFiltersTitle => '提及过滤';

  @override
  String get notificationsMentionIncludeEveryone => '包含 @everyone 和 @here 提及';

  @override
  String get notificationsMentionIncludeRoles => '包含角色提及';

  @override
  String get notificationsMentionIncludeGuilds => '包含所有社群提及';

  @override
  String get notificationsNoUnreadTitle => '没有未读消息';

  @override
  String get notificationsNoUnreadBody => '你已全部同步。';

  @override
  String get notificationsNoMentionsTitle => '没有近期提及';

  @override
  String get notificationsNoMentionsBody => '所有提及你的 @提及将在 7 天后出现在此处。';

  @override
  String get notificationsMentionsEndTitle => '已到达末尾';

  @override
  String get notificationsMentionsEndBody => '你已查看所有近期提及。别担心，很快就会有更多提及出现在这里。';

  @override
  String get notificationsJump => '跳转';

  @override
  String get notificationsRemoveMentionTooltip => '移除提及';

  @override
  String get notificationsViewAllUnread => '查看所有未读';

  @override
  String get notificationsMarkAsRead => '标记为已读';

  @override
  String get notificationsExpand => '展开';

  @override
  String get notificationsCollapse => '折叠';

  @override
  String get notificationsMessageUnavailable => '无法加载此消息。';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining 个字符剩余';
  }

  @override
  String get characterCounterTooLong => '消息太长';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining 个字符剩余。获取 $productName 可输入最多 $premiumMaxLength 个字符。';
  }

  @override
  String get chatMessageFailedToSend => '消息发送失败';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return '无法送达你的消息。这通常是因为你与收件人未共享同一社群，或者收件人仅接受好友的直接消息。你可能还需要在 $settingsPath 中调整你自己的直接消息隐私设置。';
  }

  @override
  String get chatSendFailureUnclaimedDm => '无法送达你的消息。你需要认领你的账户才能发送直接消息。';

  @override
  String get chatSendFailureUnclaimedGeneral => '无法送达你的消息。你需要认领你的账户才能发送消息。';

  @override
  String get chatSendFailureContentBlocked =>
      '你的消息因被我们的安全系统标记而无法送达。如果你认为这是一个错误，请联系支持。';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      '你的消息因包含在此上下文中不允许的成人表情符号或贴纸而无法送达。';

  @override
  String get chatClientSystemOnlyYouCanSee => '只有你能看到此消息。';

  @override
  String get chatClientSystemDismiss => '关闭';

  @override
  String get privacyDashboardCommunicationSection => '通讯';

  @override
  String get privacyDashboardProfilePrivacySection => 'Profile privacy';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Friends & direct messages';

  @override
  String get privacyDashboardActivitySharingSection => 'Activity sharing';

  @override
  String get privacyDashboardSensitiveContentSection => 'Sensitive content';

  @override
  String get privacyDashboardDataExportSection => 'Data export';

  @override
  String get privacyDashboardDataDeletionSection => 'Data deletion';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Who can see your full profile';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Friends and all communities';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Your full profile is visible to friends and to anyone in your communities';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Friends and small communities only';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Your full profile is visible to friends and members of your communities with 200 or fewer members';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Friends only';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Your full profile is only visible to your friends';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Friend requests';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Everyone';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Allow anyone to send you friend requests';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Friends of Friends';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Allow friends of your friends to send you requests';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Community Members';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Allow members from communities you\'re in to send you requests';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direct messages';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Allow direct messages from community members';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Allow members from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Allow direct messages from community bots';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Allow bots from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Control who can send you friend requests and direct messages';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Control who can call you and add you to group chats';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Incoming calls';

  @override
  String get privacyDashboardIncomingCallsDesc => 'Control who can call you';

  @override
  String get privacyDashboardAllowedCallers => 'Allowed callers';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nobody';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Block all incoming calls';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Friends Only';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Only allow friends to call you (recommended)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Friends + Custom';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Allow friends plus additional groups you choose';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Everyone';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Allow anyone to call you, even strangers';

  @override
  String get privacyDashboardAdditionalGroups => 'Additional Groups';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'People who are friends with your friends can call you';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'People from communities you\'re both in can call you';

  @override
  String get privacyDashboardRingBehavior => 'Ring Behavior';

  @override
  String get privacyDashboardSilentCalls => 'Silent calls from everyone';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'All calls will notify silently instead of ringing. By default, calls from non-friends are always silent.';

  @override
  String get privacyDashboardGroupDmTitle => 'Who Can Add You to Group Chats';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Control who can add you to group chats without asking. Anyone can still send you invite links to join.';

  @override
  String get privacyDashboardAllowedInvites => 'Allowed invites';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Don\'t let anyone add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Only allow friends to add you without asking (recommended)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Allow friends plus additional groups to add you';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Allow anyone to add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'People who are friends with your friends can add you to group chats';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'People from communities you\'re both in can add you to group chats';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Voice activity on active now';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Share your voice activity with friends';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Share voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Stop sharing voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'You\'re about to start sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'You\'re about to stop sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Yes, share with all friends';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Yes, stop sharing';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Available again in $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Voice activity sharing updated';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Couldn\'t update voice activity sharing right now';

  @override
  String get privacyDashboardDataExportDesc =>
      'Build a downloadable archive of your account data, including messages and attachment URLs. Most people want everything, but you can narrow the scope below.';

  @override
  String get privacyDashboardExportMyData => 'Export my data';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Permanently remove messages you have sent across DMs, group DMs, and communities. The work runs in the background, and you will get a DM when it finishes.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Delete my messages';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Allow direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Block direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Allow bots to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Block bots from sending you direct messages?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Do you also want to allow direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Do you also want to block direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Do you also want to allow bots from your existing communities to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Do you also want to block bots from your existing communities?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'You can also change this setting per-community by long-pressing the community name and selecting Privacy Settings.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Allow for all communities';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Block for all communities';

  @override
  String get privacyDashboardDmConfirmSkip => 'Skip this step';

  @override
  String get privacyDashboardDataRequestGoBack => 'Go back';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Export my data';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Delete my messages';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'We\'ll process this as soon as possible. You\'ll get an email when your archive is ready.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'We\'ll process this as soon as possible. You\'ll get a DM from us when it\'s done.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'What to include';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Everything';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Export every message you have ever sent, plus all of your account settings, memberships, and metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Custom selection';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Choose which conversation kinds, communities, and time window to include in the archive.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Choose what to include';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Pick which kinds of conversations to clean up.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Only places I can\'t access anymore';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Only delete messages from communities and group DMs you have left or been removed from.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Which conversations';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Toggle the kinds of conversations you want included.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Open DMs';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Closed DMs';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Which communities';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Community filter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Include all except selected';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Only the selected ones';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'You aren\'t in any communities right now.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Time range';

  @override
  String get privacyDashboardDataRequestDateMode => 'Time range';

  @override
  String get privacyDashboardDataRequestAllTime => 'All time';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Custom range';

  @override
  String get privacyDashboardDataRequestStartDate => 'Start date';

  @override
  String get privacyDashboardDataRequestEndDate => 'End date';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Leave either field blank to leave that end of the window unbounded.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Pick at least one kind of conversation to include.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Start date must be earlier than end date.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Review and confirm';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'We\'ll build a downloadable archive of every message you have ever sent and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'We\'ll build a downloadable archive that matches the filters below and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Permanently delete the messages that match the filters below. This cannot be undone.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'There is no recovery once this starts. We will DM you when it finishes.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Request export';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Delete messages';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Scope';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Conversations';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Time range';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'None';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'From $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Until $end';
  }

  @override
  String privacyDashboardDataRequestSummaryBetween(String start, String end) {
    return '$start – $end';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildExclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communities',
      one: '# community',
    );
    return 'All except $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communities',
      one: '# community',
    );
    return 'Only $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Open direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Closed direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Direct messages (open and closed)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Communities';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0 and $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# seconds',
      one: '# second',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'Failed to load privacy settings';

  @override
  String get privacyDashboardRetry => 'Retry';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Failed to save sensitive content settings.';

  @override
  String get privacyDashboardDataRequestFailed => 'Failed to complete request.';

  @override
  String get chatMessageDeleteFailed => '删除失败的消息';

  @override
  String get chatMessageAddReaction => '添加反应';

  @override
  String get chatMessageEdit => '编辑消息';

  @override
  String get chatMessageReply => '回复';

  @override
  String get chatMessageForward => '转发';

  @override
  String get forwardMessageTitle => '转发消息';

  @override
  String get forwardSearchHint => '搜索频道或私信';

  @override
  String get forwardDirectMessagesSection => '私信';

  @override
  String get forwardCommentHint => '添加评论（可选）';

  @override
  String forwardSendButton(int count, int limit) {
    return '发送 ($count/$limit)';
  }

  @override
  String get forwardEmptyState => '未找到频道';

  @override
  String get forwardSuccessToast => '消息已转发';

  @override
  String get forwardFailed => '转发消息失败';

  @override
  String get forwardCommentSlowmodeDisabled => '由于所选频道启用了慢速模式，评论不可用。';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Waiting for slowmode in one or more selected channels to expire.';

  @override
  String get slowmodeRateLimitedTitle => 'Slowmode active';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Slowmode is on — wait $duration before sending another.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Direct upload is disabled during slowmode.';

  @override
  String get shareMediaTitle => 'Share to';

  @override
  String get shareMediaMessageHint => 'Add an optional message…';

  @override
  String get shareMediaSendButton => 'Send';

  @override
  String get shareMediaSuccessToast => 'Media shared';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Shared to $count destinations';
  }

  @override
  String get shareMediaFailedToast => 'Failed to share media';

  @override
  String get forwardDestinationNoSendPermission => '您无法在此发送消息';

  @override
  String get forwardDestinationNoEmbedPermission => '您无法在此嵌入链接';

  @override
  String get forwardDestinationNoAttachPermission => '您无法在此附加文件';

  @override
  String get forwardDestinationGuildSendDisabled => '此社区已禁用发送消息';

  @override
  String get forwardDestinationTimedOut => '您在此社区被禁言';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return '慢速模式 - 请等待 $remaining';
  }

  @override
  String get chatMessageCopyText => '复制消息';

  @override
  String get chatMessageCopyEmbedText => 'Copy Embed Text';

  @override
  String get chatMessageTranslate => 'Translate';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Translated from $language';
  }

  @override
  String get chatMessageSeeOriginal => 'See original';

  @override
  String get chatMessageSeeTranslation => 'See translation';

  @override
  String get chatMessageTranslating => 'Translating…';

  @override
  String get chatMessageTranslateFailed => 'Couldn\'t translate this message.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Translation isn\'t available on this device.';

  @override
  String get chatMessageSpeak => 'Speak message';

  @override
  String get chatMessageStopSpeaking => 'Stop speaking';

  @override
  String get chatMessagePin => '固定消息';

  @override
  String get chatMessageUnpin => '取消固定消息';

  @override
  String get chatMessageUnpinIt => '取消固定';

  @override
  String get chatMessageBookmark => '收藏消息';

  @override
  String get chatMessageRemoveBookmark => '移除收藏';

  @override
  String get chatMessageMarkAsUnread => '标记为未读';

  @override
  String get chatMessageCopyMessageLink => '复制消息链接';

  @override
  String get chatMessageCopyMessageId => '复制消息ID';

  @override
  String get chatMessageViewReactions => '查看反应';

  @override
  String get chatMessageRemoveAllReactions => '移除所有反应';

  @override
  String get chatMessageDebug => '调试消息';

  @override
  String get chatMessageDebugSheetTitle => '调试消息';

  @override
  String get chatMessageDebugCopyJson => '复制 JSON';

  @override
  String get chatMessageDebugJsonCopiedToast => '消息 JSON 已复制到剪贴板';

  @override
  String get chatReactionsSheetTitle => '反应';

  @override
  String get chatReactionsSheetEmpty => '尚无人对此做出反应。';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => '举报消息';

  @override
  String get iarReportMessageTitle => '举报消息';

  @override
  String get iarThisUserFallback => '此用户';

  @override
  String get iarModalDescription => '举报违规行为，或查找管理联系人及偏好的工具。';

  @override
  String get iarPathStepAriaLabel => '您需要什么？';

  @override
  String get iarCategoryStepTitle => '违反了哪类规则？';

  @override
  String get iarReasonStepTitle => '违反了哪条规则？';

  @override
  String get iarReasonSelectHint => '选择一个原因';

  @override
  String get iarPickAnOptionToast => '请选择一个选项以继续。';

  @override
  String get iarPickARuleToast => '请选择被违反的规则。';

  @override
  String get iarPathPlatform => '举报平台规则违规';

  @override
  String get iarPathCommunity => '举报给此社区版主';

  @override
  String get iarPathPreferenceMessage => '我おこのコンテンツは好きではありません';

  @override
  String get iarCategoryTargetedHarmLabel => '脅迫、嫌がらせ、または危害';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'いじめ、脅迫、ヘイトスピーチ、暴力、荒らし、または自傷行為を助長するコンテンツ。';

  @override
  String get iarCategorySafetyMinorsLabel => '児童の安全または成人向けコンテンツ';

  @override
  String get iarCategorySafetyMinorsDescription =>
      '未成年者が危険にさらされている、不適切な場所での成人向けコンテンツ、または望まない行為。';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'プライバシーまたはなりすまし';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      '個人情報の暴露、ストーキング、他人のふり、または不適切なプロフィール。';

  @override
  String get iarCategoryDeceptionLabel => '詐欺、マルウェア、または誤情報';

  @override
  String get iarCategoryDeceptionDescription =>
      'フィッシング、詐欺、悪意のあるリンク、または現実世界での危害を引き起こす可能性のある虚偽の主張。';

  @override
  String get iarCategoryIllegalOtherLabel => '違法行為またはその他の問題';

  @override
  String get iarCategoryIllegalOtherDescription =>
      '違法な販売、犯罪行為の助長、または上記に当てはまらない明確な規約違反。';

  @override
  String get iarReasonHarassmentLabel => '嫌がらせまたは脅迫';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'いじめ、繰り返しの迷惑行為、ストーキング、または標的を絞った虐待。';

  @override
  String get iarReasonHateLabel => 'ヘイトスピーチ';

  @override
  String get iarReasonHateMessageDescription =>
      '差別用語、非人間的な言葉遣い、または保護されたグループへの攻撃。';

  @override
  String get iarReasonViolenceLabel => '暴力または暴力的な脅迫';

  @override
  String get iarReasonViolenceDescription => '信憑性のある脅迫、過激な暴力、または暴力の賛美。';

  @override
  String get iarReasonMatureContentLabel => '成人向けコンテンツまたは嫌がらせ';

  @override
  String get iarReasonMatureContentMessageDescription =>
      '望まない行為または不適切な場所での成人向けコンテンツ。';

  @override
  String get iarReasonChildSafetyLabel => '児童の安全または未成年者の搾取';

  @override
  String get iarReasonChildSafetyMessageDescription => 'グルーミングまたは児童搾取コンテンツ。';

  @override
  String get iarReasonHarmfulMisinfoLabel => '有害な誤情報';

  @override
  String get iarReasonHarmfulMisinfoDescription => '現実世界での危害を引き起こす可能性のある虚偽の主張。';

  @override
  String get iarReasonSpamLabel => 'スパム、詐欺、またはフィッシング';

  @override
  String get iarReasonSpamMessageDescription => '大量スパム、詐欺、偽の景品、またはアカウントの悪用。';

  @override
  String get iarReasonMalwareLabel => 'マルウェアまたは危険なリンク';

  @override
  String get iarReasonMalwareDescription => 'マルウェア、認証情報窃盗、または有害なファイル。';

  @override
  String get iarReasonPrivacyLabel => 'プライバシー侵害';

  @override
  String get iarReasonPrivacyDescription => '個人情報の暴露、プライベート情報の公開、またはストーキング。';

  @override
  String get iarReasonImpersonationLabel => 'なりすましまたは詐欺的メディア';

  @override
  String get iarReasonImpersonationMessageDescription =>
      '他人のふりをすること、AI生成の詐欺的コンテンツを含む。';

  @override
  String get iarReasonIllegalLabel => '違法行為';

  @override
  String get iarReasonIllegalDescription => '違法な販売、犯罪行為の助長、または違法行為。';

  @override
  String get iarReasonSelfHarmLabel => '自傷行為または自殺';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      '自傷行為または摂食障害を助長するコンテンツまたは指示。';

  @override
  String get iarReasonOtherLabel => 'その他の明確な規約違反';

  @override
  String iarReasonOtherDescription(String productName) {
    return '$productNameの規約に明確に違反し、上記に当てはまらない場合のみ使用してください。';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return '未成年者が関与している場合は、「$childSafetyReason」を使用してください。';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'CSAMまたは未成年者の搾取が関与している場合は、すぐに送信してください。素材の再共有はしないでください。';

  @override
  String get iarSafetyNoteSelfHarm =>
      '誰かが差し迫った危険にさらされている可能性がある場合は、安全にできる場合は現地の緊急サービスに連絡してください。';

  @override
  String get iarSafetyNoteViolence => '差し迫った脅迫がある場合は、現地の緊急サービスにも連絡してください。';

  @override
  String get iarSafetyNoteTerrorism => '差し迫ったテロの脅威がある場合は、現地の緊急サービスにも連絡してください。';

  @override
  String get iarActionBlockUserTitle => 'このユーザーをブロック';

  @override
  String get iarActionBlockUserDescription => 'メッセージと友達リクエストを停止します。';

  @override
  String get iarActionBlockUserButton => 'ブロック';

  @override
  String get iarActionCopyMessageLinkTitle => 'メッセージリンクをコピー';

  @override
  String get iarActionCopyMessageLinkDescription => 'コミュニティモデレーターと共有します。';

  @override
  String get iarActionCopyMessageLinkButton => 'コピー';

  @override
  String get iarActionCloseDmTitle => 'このDMを閉じる';

  @override
  String get iarActionCloseDmDescription => 'ブロックはしません。後で再開できます。';

  @override
  String get iarActionCloseDmButton => '关闭私信';

  @override
  String get iarActionLeaveCommunityTitle => '退出社群';

  @override
  String get iarActionLeaveCommunityDescription => '停止查看其内容和成员。';

  @override
  String get iarActionLeaveCommunityButton => '退出';

  @override
  String get iarActionDmSettingsTitle => '私信和好友请求设置';

  @override
  String get iarActionDmSettingsDescription => '更改谁可以联系你。';

  @override
  String get iarActionCallSettingsTitle => '通话和群聊设置';

  @override
  String get iarActionCallSettingsDescription => '更改谁可以给你打电话或将你拉入群聊。';

  @override
  String get iarActionOpenButton => '打开';

  @override
  String get iarActionDeleteMessageTitle => '删除此消息';

  @override
  String get iarActionDeleteMessageDescription => '从频道中移除，所有人均不可见。';

  @override
  String get iarActionDeleteMessageButton => '删除';

  @override
  String get iarActionDeleteMessageDeletedButton => '已删除';

  @override
  String get iarActionDeleteMessageDeletedTooltip => '此消息已被删除。';

  @override
  String get iarActionBanUserTitle => '封禁此用户';

  @override
  String get iarActionBanUserDescription => '为此社群打开封禁对话框。';

  @override
  String get iarActionBanUserButton => '封禁';

  @override
  String get iarActionBanUserBannedButton => '已封禁';

  @override
  String get iarActionBanUserBannedTooltip => '此用户已被封禁。';

  @override
  String get iarCloseDmConfirmTitle => '关闭私信';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return '关闭你与 $name 的当前私信。这不会拉黑对方；你之后可以重新开启。';
  }

  @override
  String get iarSuccessTitle => '举报已发送';

  @override
  String get iarSuccessBody => '我们的安全团队正在审核。一旦做出裁决，我们会通过私信和电子邮件通知你。';

  @override
  String get iarAlreadyReportedTitle => '已举报';

  @override
  String get iarAlreadyReportedBody => '你已举报此消息。我们的安全团队正在审核。';

  @override
  String get iarBackButton => '返回';

  @override
  String get iarContinueButton => '继续';

  @override
  String get iarSendReportButton => '发送举报';

  @override
  String get iarDoneButton => '完成';

  @override
  String get iarCouldntSendToast => '无法发送举报。请重试。';

  @override
  String get iarRateLimitedToast => '你举报得太快了。请稍等片刻再试。';

  @override
  String get iarReportSentToast => '举报已发送。我们的安全团队将进行审核。';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return '封禁 $name？他们将无法给你发消息或发送好友请求。之后你可以取消封禁。';
  }

  @override
  String get iarBlockUserFailedToast => '无法封禁此用户。请重试。';

  @override
  String get iarCloseDmSuccessToast => '私信已关闭。';

  @override
  String get iarCloseDmFailedToast => '无法关闭此私信。请重试。';

  @override
  String get iarLeaveCommunityFailedToast => '无法退出此社群。请重试。';

  @override
  String get chatMessageSuppressEmbeds => '隐藏链接预览';

  @override
  String get chatMessageUnsuppressEmbeds => '显示链接预览';

  @override
  String get chatMessageDelete => '删除消息';

  @override
  String get chatMessageDeleteConfirmTitle => '删除消息';

  @override
  String get chatMessageDeleteConfirmDescription => '你确定要删除此消息吗？';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => '更多';

  @override
  String get chatEditingMessage => '正在编辑消息';

  @override
  String get chatReplyOriginalDeleted => '原消息已被删除';

  @override
  String get chatReplyOriginalFailedToLoad => '原消息加载失败';

  @override
  String get chatReplyAttachedMedia => '消息包含附件媒体';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blocked messages',
      one: '1 blocked message',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potential spammer messages',
      one: '1 potential spammer message',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Reply hidden because the original author is blocked.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Reply hidden because the original author is marked as a spammer.';

  @override
  String get devMarkAsSpamLocally => 'Mark as spam locally';

  @override
  String get devIgnoreSpamFlag => 'Ignore spam flag';

  @override
  String get chatMessagesLoadError => '无法加载消息。';

  @override
  String get chatReplyMentionOverrideTitle => '覆盖提及偏好设置？';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname 偏好在回复时被 @提及。仍要发送而不提及吗？';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname 偏好不提及的回复。仍要发送提及吗？';
  }

  @override
  String get chatReplyMentionIgnorePreference => '忽略偏好';

  @override
  String get chatReplyMentionDisableTooltip => '点击以禁用提及你正在回复的用户';

  @override
  String get chatReplyMentionEnableTooltip => '点击以启用提及你正在回复的用户';

  @override
  String get chatReplyMentionAccessibilityLabel => '提及已回复用户';

  @override
  String get chatReplyMentionOn => '开启';

  @override
  String get chatReplyMentionOff => '关闭';

  @override
  String get chatReplyCancel => '取消回复';

  @override
  String get chatEditMessageHint => '编辑消息';

  @override
  String get chatEditNoChanges => '未保存任何更改';

  @override
  String get chatChannelNotReady => '此频道尚未准备就绪。请稍后再试。';

  @override
  String get chatMessageEdited => '（已编辑）';

  @override
  String get chatMessageSilent => '这是一条 @silent 消息。';

  @override
  String chatMessageTimestampToday(String time) {
    return '今天 $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return '昨天 $time';
  }

  @override
  String get mediaViewerImagePreview => '图片预览';

  @override
  String get mediaViewerClose => '关闭媒体查看器';

  @override
  String get mediaViewerOpenInBrowser => '在浏览器中打开';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => '转发';

  @override
  String get mediaViewerZoomIn => '放大';

  @override
  String get mediaViewerZoomOut => '缩小';

  @override
  String get mediaViewerPreviousAttachment => '上一个附件';

  @override
  String get mediaViewerNextAttachment => '下一个附件';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Attachment $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Dismiss';

  @override
  String get chatAttachmentVideoToggleControls => '切换视频控件';

  @override
  String get chatAttachmentVideoMute => '静音视频';

  @override
  String get chatAttachmentVideoUnmute => '取消静音视频';

  @override
  String get chatAttachmentVideoPlay => '播放视频';

  @override
  String get chatAttachmentVideoPause => '暂停视频';

  @override
  String get chatAttachmentVideoProgress => '视频进度';

  @override
  String get chatVideoPlaybackFailed => '无法播放此视频。';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      '通知具有此角色的用户，他们有权查看此频道。';

  @override
  String get composerAutocompleteSuggestions => 'Suggestions';

  @override
  String get composerAutocompleteCommandsHeading => 'Commands';

  @override
  String get composerAutocompleteChoicesHeading => 'Choices';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Optional arguments';

  @override
  String get composerAutocompleteChannelsHeading => 'Channels';

  @override
  String get composerAutocompleteMembersHeading => 'Members';

  @override
  String get composerAutocompleteUsersHeading => 'Users';

  @override
  String get composerAutocompleteMentionsHeading => 'Mentions';

  @override
  String get composerAutocompleteRolesHeading => 'Roles';

  @override
  String get composerAutocompleteMediaHeading => 'Media';

  @override
  String get composerAutocompleteStickersHeading => 'Stickers';

  @override
  String get composerAutocompleteGifsHeading => 'GIFs';

  @override
  String get composerAutocompleteNoGifs => 'No GIFs found';

  @override
  String get composerCommandShrugDescription =>
      'Appends ¯\\_(ツ)_/¯ to your message.';

  @override
  String get composerCommandTableflipDescription =>
      'Appends (╯°□°)╯︵ ┻━┻ to your message.';

  @override
  String get composerCommandUnflipDescription =>
      'Appends ┬─┬ ノ( ゜-゜ノ) to your message.';

  @override
  String get composerCommandMeDescription =>
      'Send an action message (wraps in italics).';

  @override
  String get composerCommandSpoilerDescription =>
      'Send a spoiler message (wraps in spoiler tags).';

  @override
  String get composerCommandTtsDescription => 'Send a text-to-speech message.';

  @override
  String get composerCommandNickDescription =>
      'Change your nickname in this community.';

  @override
  String get composerCommandKickDescription =>
      'Kick a member from this community.';

  @override
  String get composerCommandBanDescription =>
      'Ban a member from this community.';

  @override
  String get composerCommandMsgDescription =>
      'Send a direct message to a user.';

  @override
  String get composerCommandSavedDescription => 'Send a saved media item.';

  @override
  String get composerCommandStickerDescription => 'Send a sticker.';

  @override
  String get composerCommandGifDescription => 'Search for and send a GIF.';

  @override
  String get composerCommandMemberOption => 'The member to target.';

  @override
  String get composerCommandReasonOption => 'Reason (optional).';

  @override
  String get composerCommandMessageOption => 'The message to send.';

  @override
  String get composerCommandQueryOption => 'What to search for.';

  @override
  String get composerCommandNicknameOption =>
      'Your new nickname, or leave blank to reset it.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'How much of the member\'s recent message history to delete.';

  @override
  String get composerCommandDeleteMessagesNone => 'Don\'t delete any';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Previous $count days';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Previous 24 hours';

  @override
  String get composerCommandOptionRequired =>
      'This option is required. Please provide a value.';

  @override
  String get composerCommandClear => 'Clear command';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'You changed your nickname in this community from **$previousNickname** to **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Unknown user';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Failed to send a message to **$username**. They may have DMs disabled or you may be blocked.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count more';
  }

  @override
  String get addGuildModalTitle => '添加社区';

  @override
  String get addGuildModalLandingDescription => '创建新社区或加入现有社区。';

  @override
  String get addGuildCreateCommunity => '创建社区';

  @override
  String get addGuildJoinCommunity => '加入社区';

  @override
  String get addGuildImportDiscordTemplate => '导入 Discord 模板';

  @override
  String get addGuildJoinTitle => '加入社区';

  @override
  String get addGuildJoinDescription => '输入邀请链接以加入社区。';

  @override
  String get addGuildInviteLinkLabel => '邀请链接';

  @override
  String get addGuildJoinSubmit => '加入社区';

  @override
  String get addGuildInviteInvalid => '此邀请无效或已过期。';

  @override
  String get addGuildJoinFailed => '无法加入社区。请重试。';

  @override
  String get addGuildCreateTitle => 'Create a community';

  @override
  String get addGuildCreateDescription =>
      'Create a community for you and your friends to chat.';

  @override
  String get addGuildCreateNameLabel => 'Community name';

  @override
  String get addGuildCreateSubmit => 'Create community';

  @override
  String get addGuildCreateFailed =>
      'Could not create community. Please try again.';

  @override
  String get addGuildCreateClaimTitle => 'Claim your account';

  @override
  String get addGuildCreateClaimDescription =>
      'You need to claim your account before you can create a community.';

  @override
  String get addGuildCreateVerifyTitle => 'Verify your email';

  @override
  String get addGuildCreateVerifyDescription =>
      'You need to verify your email address before you can create a community.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animated icons are not supported when creating a new community. Use a static image.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'By creating a community, you agree to follow and uphold the ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName community guidelines';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'This instance is a single community, so additional communities cannot be created.';

  @override
  String get addGuildCreateChangeIcon => 'Change icon';

  @override
  String get addGuildCreateIconLabel => 'Community icon';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Max 10MB. Recommended: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Paste a Discord template URL to import its structure into a new community.';

  @override
  String get addGuildImportUrlLabel => 'Template URL';

  @override
  String get addGuildImportUrlInvalid =>
      'Enter a valid Discord template URL or code.';

  @override
  String get addGuildImportFetchFailed =>
      'Failed to fetch the community template. The template may not exist or the external service is unavailable.';

  @override
  String get addGuildImportInvalidResponse =>
      'This doesn\'t look like a valid template response.';

  @override
  String get addGuildImportTemplateLabel => 'Template';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount text, $voiceChannelCount voice, $categoryCount categories, $roleCount roles';
  }

  @override
  String get addGuildImportRemoveIcon => 'Remove icon';

  @override
  String get addGuildImportTemplateInvalid =>
      'The community template data is invalid or malformed.';

  @override
  String get addGuildPackInstalled => '表情包已成功安装。';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => '移除所有反应';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      '您确定要移除此消息的所有反应吗？';

  @override
  String get chatMessageUnpinConfirmTitle => '取消固定消息';

  @override
  String get chatMessageUnpinConfirmDescription => '将此固定消息送回过去？';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username 在此频道固定了 $messageLink。查看 $allPinsLink。';
  }

  @override
  String get systemPinMessageMessageLink => '一条消息';

  @override
  String get systemPinMessageAllPinsLink => '所有固定消息';

  @override
  String get channelPinsEmptyTitle => '无置顶消息';

  @override
  String get channelPinsEmptyDescription => '置顶消息会显示在这里。';

  @override
  String get channelDetailsFallbackTitle => 'Details';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Group DM · $count members';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Close your conversation with $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Leave $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Channel settings';

  @override
  String get channelDetailsGroupSettingsTitle => 'Group Settings';

  @override
  String get channelDetailsDmSettingsTitle => 'DM Settings';

  @override
  String get channelDetailsInvitePeople => 'Invite People';

  @override
  String get channelDetailsCopyLink => 'Copy Link';

  @override
  String get channelMenuCopyChannelLink => 'Copy channel link';

  @override
  String get channelMenuCopyRedirectLink => 'Copy redirect link';

  @override
  String get channelDetailsAddFriendsToGroup => 'Add friends to group';

  @override
  String get channelDetailsGroupInvites => 'Group invites';

  @override
  String get channelDetailsEditChannel => 'Edit channel';

  @override
  String get channelDetailsDeleteChannel => 'Delete channel';

  @override
  String get channelSettingsCategorySettingsTitle => 'Category settings';

  @override
  String get channelSettingsEditCategory => 'Edit category';

  @override
  String get channelSettingsTabOverview => 'Overview';

  @override
  String get channelSettingsTabPermissions => 'Permissions';

  @override
  String get channelSettingsTabInvites => 'Invites';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Delete channel';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Are you sure you want to delete $channelName? This cannot be undone.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Are you sure you want to delete $categoryName? This cannot be undone.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Delete category';

  @override
  String get channelSettingsChannelUpdated => 'Channel updated';

  @override
  String get channelSettingsChannelName => 'Channel name';

  @override
  String get channelSettingsCategoryName => 'Category name';

  @override
  String get channelSettingsMyCategory => 'My category';

  @override
  String get categoryExpandCategory => 'Expand category';

  @override
  String get categoryCollapseCategory => 'Collapse category';

  @override
  String get categoryExpandAllCategories => 'Expand all categories';

  @override
  String get categoryCollapseAllCategories => 'Collapse all categories';

  @override
  String get categoryMuteCategory => 'Mute category';

  @override
  String get categoryUnmuteCategory => 'Unmute category';

  @override
  String get categoryCopyCategoryId => 'Copy category ID';

  @override
  String get categoryIdCopied => 'Category ID copied';

  @override
  String get channelSettingsChannelNamePlaceholder => 'general';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Topic';

  @override
  String get channelSettingsTopicPlaceholder => 'Add a topic to this channel';

  @override
  String get channelSettingsInsertEmoji => 'Insert emoji';

  @override
  String get channelSettingsTopicTooLongTitle => 'Channel topic is too long.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Shorten the topic and try again.';

  @override
  String get channelSettingsSlowmode => 'Slowmode';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Wait between messages. \"$bypassSlowmodePermissionLabel\" can bypass it.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Off';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds seconds';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minutes';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours hours';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minute';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour hour';
  }

  @override
  String get channelSettingsVoiceQuality => 'Voice quality';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Higher bitrate = better quality and higher bandwidth usage.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Participant limit';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maximum members who can join at once. 0 means unlimited.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participants',
      one: '1 participant',
      zero: '∞ No limit',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Connection limit';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maximum active connections one member can keep in this channel.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count connections',
      one: '1 connection',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Voice region';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Select a voice region for this channel. Automatic uses the closest region.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatic';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Couldn\'t load voice regions';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Try again in a moment.';

  @override
  String get channelSettingsResetSlider => 'Reset slider to default value';

  @override
  String get channelSettingsAdvanced => 'Advanced';

  @override
  String get channelSettingsMatureContentOverride => 'Mature content override';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Override the $scopeLevel-level setting for this channel. Mature content is shown behind a gate before entry.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Inherit';

  @override
  String get channelSettingsMatureContentOn => 'On';

  @override
  String get channelSettingsMatureContentOff => 'Off';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Marks this channel for mature content.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Leave this channel ungated for mature content.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Inherited from $inheritedSourceLabel: on';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Inherited from $inheritedSourceLabel: off';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'category';

  @override
  String get channelSettingsMatureContentCommunitySource => 'community';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Category';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Community';

  @override
  String get channelSettingsContentWarningToggle =>
      'Show a content warning in this channel';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Turns on a consent prompt before entering this channel.';

  @override
  String get channelSettingsContentWarningText => 'Custom warning text';

  @override
  String get channelSettingsContentWarningDefault =>
      'This contains sensitive content.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'You need the \"$manageChannelsPermissionLabel\" permission to edit these permissions.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'You need the \"$manageRolesPermissionLabel\" permission to edit these permissions.';
  }

  @override
  String get channelSettingsUnknownRole => 'Unknown role';

  @override
  String get channelSettingsUnknownUser => 'Unknown user';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'Access overrides';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Edit access for $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => 'Back to overrides';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Configure base access for this channel';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Configure overrides for this role';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Configure overrides for this member';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Search permissions…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Channel access updated';

  @override
  String get channelSettingsPermissionsTitle => 'Access control';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'This channel is synced with the parent category ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'This channel is not synced with the parent category ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => 'Sync with category';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Channel synced with parent category';

  @override
  String get channelSettingsPermissionsAddOverride => 'Add override';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Search roles or members…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Roles and members';

  @override
  String get channelSettingsDeleteInvite => 'Delete invite';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Delete this invite? Can\'t be undone.';

  @override
  String get channelSettingsCopyInviteCode => 'Copy invite code';

  @override
  String get channelSettingsCopyInviteUrl => 'Copy invite URL';

  @override
  String get channelSettingsWebhookCreated => 'Webhook created';

  @override
  String get channelSettingsWebhookCreateFailed => 'Failed to create webhook';

  @override
  String get channelSettingsCreateWebhook => 'Create webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Manage invite links for this channel.';

  @override
  String get channelSettingsInvitesCreate => 'Create invite';

  @override
  String get channelSettingsInvitesEmpty => 'No invite links';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'This channel doesn\'t have any invite links yet. Create one to invite people to this channel.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'There was an error loading the invite links for this channel. Try again.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Manage incoming webhooks that can post messages into this channel.';

  @override
  String get channelSettingsWebhooksEmpty => 'No webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'There are no webhooks configured for this channel. Create a webhook to allow external applications to post messages.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'This channel does not support webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'You need the \"$permission\" permission to view and edit webhooks for this channel.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Failed to load webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'There was an error loading the webhooks for this channel. Try again.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Created by $creator on $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Unknown user';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Upload image';

  @override
  String get channelSettingsWebhooksRemove => 'Remove';

  @override
  String get channelSettingsWebhooksName => 'Name';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook name';

  @override
  String get channelSettingsWebhooksChannel => 'Channel';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Copy webhook URL';

  @override
  String get channelSettingsWebhooksDelete => 'Delete webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Couldn\'t delete this webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Delete this webhook? Can\'t be undone.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Try again in a moment.';

  @override
  String get channelMenuOpenChat => 'Open chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplicate channel';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Reset mature content agreement state';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Delete your messages in this channel?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this channel. This cannot be undone.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Delete My Messages';

  @override
  String get channelMenuDeletedYourMessages => 'Deleted your messages';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Couldn\'t delete your messages';

  @override
  String get channelDetailsSystemMessage => 'System message';

  @override
  String get channelDetailsTextChannel => 'Text channel';

  @override
  String get channelDetailsVoiceChannel => 'Voice channel';

  @override
  String get channelDetailsCategory => 'Category';

  @override
  String get channelDetailsLinkChannel => 'Link channel';

  @override
  String get channelDetailsGenericChannel => 'Channel';

  @override
  String get channelDetailsMutedConversation => 'Muted conversation';

  @override
  String get channelDetailsUnmutedConversation => 'Unmuted conversation';

  @override
  String get channelDetailsMutedChannel => 'Muted channel';

  @override
  String get channelDetailsUnmutedChannel => 'Unmuted channel';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Notification settings updated';

  @override
  String get channelDetailsTabMembers => 'Members';

  @override
  String get channelDetailsTabPins => 'Pins';

  @override
  String get channelDetailsActionMute => 'Mute';

  @override
  String get channelDetailsActionUnmute => 'Unmute';

  @override
  String get channelDetailsActionSearch => 'Search';

  @override
  String get channelDetailsActionMore => 'More';

  @override
  String get channelDetailsMembersEmptyTitle => 'No members to show';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Members will appear here once the community data is loaded.';

  @override
  String get memberListPermissionDeniedTitle => 'You can\'t view members';

  @override
  String get memberListPermissionDeniedBody =>
      'You can\'t view the members of this channel in this community';

  @override
  String get memberListUnavailableTitle => 'Member list unavailable';

  @override
  String get memberListUnavailableBody =>
      'Member lists are temporarily unavailable in this community';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'Pins could not be loaded';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Members with the \"Pin Messages\" permission can pin messages for everyone to see.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'You can pin messages in this conversation for everyone to see.';

  @override
  String get channelDetailsPinsEndReached => 'You\'ve reached the end';

  @override
  String get channelHeaderOpenDetails => 'Open channel details';

  @override
  String get channelHeaderPinnedMessages => 'Pinned messages';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Pinned messages, unread';

  @override
  String get channelHeaderMemberList => 'Member list';

  @override
  String get channelHeaderInbox => 'Inbox';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Notification settings, muted';

  @override
  String get channelDetailsSearchTitle => 'Search';

  @override
  String get channelDetailsSearchHint => 'Search Messages';

  @override
  String get channelDetailsSearchFilterFrom => 'From';

  @override
  String get channelDetailsSearchFilterHas => 'Has';

  @override
  String get channelDetailsSearchFilterIn => 'In';

  @override
  String get channelDetailsSearchFilterMentions => 'Mentions';

  @override
  String get channelDetailsSearchFilterMore => 'More';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Active';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count channels';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count users';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'User';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filter by channel';

  @override
  String get channelDetailsSearchChannelsHint => 'Search channels';

  @override
  String get channelDetailsSearchChannelsEmpty => 'No channels found';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Pinned';

  @override
  String get channelDetailsSearchPinnedTrue => 'Pinned only';

  @override
  String get channelDetailsSearchPinnedFalse => 'Exclude pinned';

  @override
  String get channelDetailsSearchClearFilter => 'Clear';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Author type';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Date';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Date mode';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Pick a date';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link hostname';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Filename contains';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'File extension';

  @override
  String get channelDetailsSearchContentPoll => 'Poll';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Messages with a poll';

  @override
  String get channelDetailsSearchContentForward => 'Forward';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Forwarded messages';

  @override
  String get channelDetailsSearchFilterSort => 'Sort';

  @override
  String get channelHeaderSearchFiltersTitle => 'Search Filters';

  @override
  String get channelHeaderSearchRecentTitle => 'Recent Searches';

  @override
  String get channelHeaderSearchUsersTitle => 'Users';

  @override
  String get channelHeaderSearchChannelsTitle => 'Channels';

  @override
  String get channelHeaderSearchValuesTitle => 'Values';

  @override
  String get channelHeaderSearchDatesTitle => 'Dates';

  @override
  String get channelHeaderSearchDefaultBadge => 'Default';

  @override
  String get channelHeaderSearchClearHistory => 'Clear';

  @override
  String get channelHeaderSearchFilterDescFrom => 'a user';

  @override
  String get channelHeaderSearchFilterDescMentions => 'a user';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, embed, image, video, sound, file, sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'a date or date range';

  @override
  String get channelHeaderSearchFilterDescOn => 'a date or date range';

  @override
  String get channelHeaderSearchFilterDescDuring => 'a date or date range';

  @override
  String get channelHeaderSearchFilterDescAfter => 'a date or date range';

  @override
  String get channelHeaderSearchFilterDescIn => 'a channel';

  @override
  String get channelHeaderSearchFilterDescPinned => 'true or false';

  @override
  String get channelHeaderSearchFilterDescAuthorType => 'user, bot, or webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'a hostname, e.g. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'part of an attachment filename';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'a file extension, e.g. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'timestamp or relevance';

  @override
  String get channelHeaderSearchFilterDescOrder => 'asc or desc';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Results',
      one: '1 Result',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filter by user';

  @override
  String get channelDetailsSearchFilterByContent => 'Filter by content';

  @override
  String get channelDetailsSearchSortBy => 'Sort results by';

  @override
  String get channelDetailsSearchIn => 'Search In';

  @override
  String get channelDetailsSearchEmptyTitle => 'Search this conversation';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Enter text, an author, or a content filter to find messages.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Messages are indexing';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Try again shortly once search finishes indexing this scope.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'No results';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Try different search terms or filters.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

  @override
  String get channelDetailsMemberYou => 'You';

  @override
  String get channelDetailsSearchUsersHint => 'Search users';

  @override
  String get channelDetailsSearchUsersTypeToSearch => 'Type to search members';

  @override
  String get channelDetailsSearchUsersEmpty => 'No users found';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'No users available';

  @override
  String get channelDetailsDone => 'Done';

  @override
  String get channelDetailsHasFilterPrompt => 'Show messages that contain:';

  @override
  String get channelDetailsRetry => 'Retry';

  @override
  String get channelDetailsPinnedMessageTitle => 'Pinned Message';

  @override
  String get channelDetailsSearchResultTitle => 'Search Result';

  @override
  String get channelDetailsJumpToMessage => 'Jump to Message';

  @override
  String get channelDetailsUnpinMessage => 'Unpin Message';

  @override
  String get channelDetailsCopyMessageLink => 'Copy Message Link';

  @override
  String get channelDetailsCopyMessageId => 'Copy Message ID';

  @override
  String get channelDetailsMessageUnpinned => 'Message unpinned';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Current Community';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Current DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'All Communities';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'All DMs Only';

  @override
  String get channelDetailsSearchScopeAllDms => 'All DMs';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Open DMs Only';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Open DMs';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'All DMs + Communities';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Open DMs + Communities';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Search only in the current Community';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Search only in the current DM';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Across all Communities you\'re currently in';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Across all DMs you\'ve ever been in only';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Across all DMs you\'ve ever been in';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Across all DMs you currently have open only';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Across all DMs you currently have open';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Across all DMs you\'ve ever been in + all Communities you\'re currently in';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Across all DMs you currently have open + all Communities you\'re currently in';

  @override
  String get channelDetailsSearchSortNewest => 'Newest First';

  @override
  String get channelDetailsSearchSortOldest => 'Oldest First';

  @override
  String get channelDetailsSearchSortRelevance => 'Most Relevant';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Show most recent messages first';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Show oldest messages first';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Show most relevant messages first';

  @override
  String get channelDetailsSearchContentImage => 'Image Upload';

  @override
  String get channelDetailsSearchContentVideo => 'Video Upload';

  @override
  String get channelDetailsSearchContentAudio => 'Audio Upload';

  @override
  String get channelDetailsSearchContentFile => 'File Upload';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed => 'Link Preview or Embed';

  @override
  String get channelDetailsSearchContentSticker => 'Sticker';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Uploaded image files only';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Uploaded video files only';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Uploaded audio files only';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Any uploaded attachment';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Typed URL in the message text';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Resolved previews and rich embeds, not uploads';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker attached to the message';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count types';
  }

  @override
  String get personalNotesTitle => '个人笔记';

  @override
  String get personalNotesSubtitle => '你的私人空间，用于记录想法和提醒';

  @override
  String groupDmWelcome(String displayName) {
    return 'Welcome to $displayName. Add friends to get the group going.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Edit group';

  @override
  String get groupDmWelcomeAddFriends => 'Add friends to group';

  @override
  String get dmGroupInvites => 'Invites';

  @override
  String get groupDmEditTitle => 'Edit group';

  @override
  String get groupDmEditDetailsTooltip => 'Edit group details';

  @override
  String get groupDmGroupName => 'Group name';

  @override
  String get groupDmMyGroup => 'My group';

  @override
  String get groupDmGroupNameMaxLength =>
      'Group name must not exceed 100 characters';

  @override
  String get groupDmGroupIcon => 'Group icon';

  @override
  String get groupDmUploadIcon => 'Upload icon';

  @override
  String get groupDmChangeIcon => 'Change icon';

  @override
  String get groupDmRemoveIcon => 'Remove icon';

  @override
  String get groupDmUpdated => 'Group updated';

  @override
  String get groupDmUpdateFailed => 'Couldn\'t update group. Try again.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animated icons are not supported. Use a static image.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animated icons are not supported';

  @override
  String get groupDmIconFileTooLargeTitle => 'Icon file is too large';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Icon file is too large. Choose a file smaller than $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Unsupported icon format';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Unsupported file type.';

  @override
  String get groupDmCouldntProcessImage => 'Couldn\'t process image';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Failed to process the cropped image. Try again.';

  @override
  String get groupDmInvalidImage => 'Invalid image';

  @override
  String get groupDmInvalidImageBody =>
      'That image is invalid. Try another one.';

  @override
  String get groupDmAddFriends => 'Add';

  @override
  String get groupDmOrSendInvite => 'or send an invite to a friend:';

  @override
  String get groupDmGenerateInviteLink => 'Generate invite link';

  @override
  String get groupDmCreateInvite => 'Create';

  @override
  String get groupDmInviteExpires24Hours => 'Your invite expires in 24 hours';

  @override
  String get groupDmAddFriendFailed =>
      'Couldn\'t add this friend to the group. Please try again.';

  @override
  String get groupDmAddFailed => 'Couldn\'t add to group';

  @override
  String get groupDmGroupFull =>
      'This group is full. Remove someone before adding more people.';

  @override
  String get groupDmRateLimited =>
      'You\'re going too fast. Wait a moment and try again.';

  @override
  String get groupDmCreateInviteFailed => 'Couldn\'t create invite link';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Couldn\'t generate an invite link. Please try again.';

  @override
  String get groupDmCopyInviteFailed => 'Failed to copy invite link';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Only the group owner can manage invites.';

  @override
  String get groupDmNoInvitesCreated => 'No invites created';

  @override
  String get groupDmLoadingInvites => 'Loading invites...';

  @override
  String get groupDmInvitesLoadFailed => 'Failed to load invites. Try again.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Revoke this invite? Can\'t be undone.';

  @override
  String get groupDmInviteRevoked => 'Invite revoked';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Created by $name. Expires in $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return '欢迎来到 $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return '起初，万物皆空。然后，有了 $channelName。一切都变得美好。';
  }

  @override
  String get personalNotesComposerHint => '给自己发消息';

  @override
  String channelComposerHint(String channelName) {
    return 'Message #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Message @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Message $groupName';
  }

  @override
  String get groupDmComposerHint => 'Message group';

  @override
  String get composerHint => 'Message';

  @override
  String get composerOpenExpressionPicker => 'Open expression picker';

  @override
  String get composerShowKeyboard => 'Show keyboard';

  @override
  String get composerCloseAttachmentPanel => 'Close attachment picker';

  @override
  String get chatAttachmentPanelPhotos => 'Photos';

  @override
  String get chatAttachmentPanelFiles => 'Files';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Photo library access needed';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Allow photo library access to browse and attach recent photos and videos.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Open settings';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', sending';

  @override
  String get messageAccessibilityFailedSuffix => ', failed to send';

  @override
  String get messageAccessibilityAttachmentSummary => 'an attachment';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count attachments';
  }

  @override
  String get messageAccessibilityImageSummary => 'an image';

  @override
  String get messageAccessibilityVideoSummary => 'a video';

  @override
  String get messageAccessibilityAudioSummary => 'an audio file';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'file $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'a spoiler attachment';

  @override
  String get messageAccessibilityEmbedSummary => 'an embed';

  @override
  String get messageAccessibilityEmptySummary => 'a message';

  @override
  String get personalNotesPrivateSpace => '你的私人空间';

  @override
  String get purgePersonalNotes => '清除个人笔记';

  @override
  String get purgePersonalNotesConfirmDescription =>
      '这将永久删除你个人笔记中的所有消息和附件。此操作无法撤销。';

  @override
  String get purgePersonalNotesConfirmButton => '清除';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '已从个人笔记中清除 $count 条消息';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => '个人笔记已为空';

  @override
  String get purgePersonalNotesFailed => '无法清除个人笔记';

  @override
  String get userSettingsGroupYourAccount => '你的账户';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Search settings...';

  @override
  String get userSettingsSearchFieldLabel => 'Search settings';

  @override
  String get userSettingsSearchClear => 'Clear search';

  @override
  String get userSettingsSearchNoResults => 'No settings found';

  @override
  String get userSettingsNavProfile => '个人资料';

  @override
  String get userSettingsNavSecurityLogin => '安全与登录';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => '礼物与兑换码';

  @override
  String get giftSettingsClaimAccountTitle => 'Claim your account';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Claim your account to redeem or manage Plutonium gift codes.';

  @override
  String get giftSettingsRedeemTitle => 'Redeem a gift';

  @override
  String get giftSettingsRedeemDescription =>
      'Enter a gift code to redeem Plutonium for your account.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Enter gift code…';

  @override
  String get giftSettingsRedeemButton => 'Redeem';

  @override
  String get giftSettingsRedeemSuccess =>
      'Gift redeemed successfully. Enjoy your Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Purchased gifts';

  @override
  String get giftSettingsPurchasedDescription =>
      'Manage your purchased Plutonium gift codes. Share the gift URL with someone special or redeem it for yourself!';

  @override
  String get giftSettingsEmptyTitle => 'No gifts yet';

  @override
  String get giftSettingsEmptyDescription =>
      'Buy a Plutonium gift from the Plutonium tab to share with friends.';

  @override
  String get giftSettingsGoToPlutonium => 'Go to Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'Failed to load gift inventory';

  @override
  String get giftSettingsLoadFailedDescription => 'Try again later.';

  @override
  String get giftSettingsTryAgain => 'Try again';

  @override
  String get giftSettingsGiftUrl => 'Gift URL';

  @override
  String get giftSettingsCopy => 'Copy';

  @override
  String get giftSettingsCopied => 'Copied';

  @override
  String get giftSettingsGiftUrlCopied => 'Gift URL copied to clipboard!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Couldn\'t copy gift URL';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Purchased $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Redeemed $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Redeemed by $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'This gift has been redeemed';

  @override
  String get giftSettingsRedeemForYourself => 'Redeem for yourself';

  @override
  String get giftSettingsShareWithFriend => 'Share with a friend';

  @override
  String get premiumPlutoniumTagline =>
      'Unlock higher limits and exclusive features while supporting an independent communication platform.';

  @override
  String get premiumPurchaseMode => 'Purchase mode';

  @override
  String get premiumForMe => 'For me';

  @override
  String get premiumAsAGift => 'As a gift';

  @override
  String get premiumMonthly => 'Monthly';

  @override
  String get premiumYearly => 'Yearly';

  @override
  String get premiumPerMonth => 'per month';

  @override
  String get premiumPerYear => 'per year';

  @override
  String get premiumOneTimePurchase => 'one-time purchase';

  @override
  String get premiumSave17 => 'Save 17%';

  @override
  String get premiumUpgradeNow => 'Upgrade now';

  @override
  String get premiumBuyGift => 'Buy gift';

  @override
  String get premiumOneYearGift => '1 year gift';

  @override
  String get premiumOneMonthGift => '1 month gift';

  @override
  String get premiumMostPopular => 'Most popular';

  @override
  String get premiumScrollPrompt =>
      'Scroll down to view all the perks included with Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Free vs Plutonium';

  @override
  String get premiumFreeColumn => 'Free';

  @override
  String get premiumGiftSectionTitle => 'Gift Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Share the Plutonium experience with your friends by purchasing a gift subscription.';

  @override
  String get premiumGiftBannerOne =>
      'You have a new gift code waiting for you!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'You have $count new gift codes waiting for you!';
  }

  @override
  String get premiumViewGifts => 'View gifts';

  @override
  String get premiumReadyToUpgrade => 'Ready to upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Ready to buy a gift?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Monthly $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Yearly $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 year $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 month $price';
  }

  @override
  String get premiumManageSubscription => 'Manage subscription';

  @override
  String get premiumRedeemGiftCode => 'Redeem gift code';

  @override
  String get premiumGiftBadge => 'Gift';

  @override
  String get premiumCancelSubscriptionTitle => 'Cancel subscription?';

  @override
  String get premiumCancelSubscriptionBody =>
      'You keep your perks until your next renewal date, then have a 3-day grace period to resubscribe and keep your subscriber history.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Cancel subscription';

  @override
  String get premiumKeepSubscription => 'Keep subscription';

  @override
  String get premiumPurchaseHistoryTitle => 'Purchase history';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Your recent invoices. To change the payment method for your subscription, add or choose one in the billing portal and make it the default.';

  @override
  String get premiumManagePaymentMethods => 'Manage payment methods';

  @override
  String get premiumBillingHistory => 'Billing history';

  @override
  String get premiumSelfServeRefundTitle => 'Self-serve refund';

  @override
  String get premiumSelfServeRefundButton => 'Refund latest purchase';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'By purchasing, you agree to our ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'By purchasing, you agreed to our ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' and ';

  @override
  String premiumActiveUntil(String date) {
    return 'Active until $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Canceling';

  @override
  String premiumCancelsOn(String date) {
    return 'Cancels on $date. Perks remain active until then.';
  }

  @override
  String get premiumReactivateSubscription => 'Reactivate';

  @override
  String premiumGiftedUntil(String date) {
    return 'Gifted until $date. Does not renew automatically.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Feature';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'By purchasing, you agreed to our $terms and $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Self-serve refunds available within 3 days of payment, once every 30 days. Refunding a subscription cancels it. EU/EEA buyers waive the 14-day right of withdrawal at checkout to access content immediately. Use the in-app refund button instead of a chargeback. Chargebacks can permanently restrict your account. Stripe handles payment securely. We never see your full card number.';

  @override
  String get premiumTermsOfService => 'Terms of service';

  @override
  String get premiumPrivacyPolicy => 'Privacy policy';

  @override
  String get premiumCheckoutStartFailedTitle => 'Couldn\'t start checkout';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Something went wrong while starting checkout. Please try again in a moment.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'You\'re currently on a gift subscription. It won\'t renew. You can redeem more gift codes to extend it. Recurring subscriptions can be started after your gift time ends.';

  @override
  String get premiumPlanUnavailable =>
      'This plan isn\'t available. Contact support.';

  @override
  String get premiumCompletePaymentTitle => 'Complete payment';

  @override
  String get premiumCompletePaymentBody =>
      'You are now navigating to Stripe to complete the payment. Return to Fluxer once you\'ve completed it.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Choose payment method';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Pay with Pix automático to authorize recurring charges directly from your Brazilian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUsePix => 'Use Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Pay with UPI to set up an RBI-compliant e-mandate from your Indian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUseUpi => 'Use UPI';

  @override
  String get premiumUseCard => 'Use card';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Couldn\'t open the billing portal';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Something went wrong while opening the billing portal. Please try again in a moment.';

  @override
  String get premiumAlreadyVisionaryTitle => 'You\'re already Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary already includes permanent access, so a recurring subscription isn\'t needed. You can still buy gifts for others.';

  @override
  String get premiumExistingSubscriptionTitle => 'Subscription already exists';

  @override
  String get premiumExistingSubscriptionBody =>
      'We found an existing Fluxer Plutonium subscription for this account. Manage it in the secure billing portal to update payment details or check renewal status. If you just paid, wait a minute and reopen this page.';

  @override
  String get premiumPurchasesDisabledTitle => 'Purchases unavailable';

  @override
  String get premiumPurchasesDisabledBody =>
      'Purchases are disabled for this account. Contact support@fluxer.app if this looks wrong.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Claim your account to purchase Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'You need to verify your email before you can purchase Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Custom username tag';

  @override
  String get premiumPerkPerCommunityProfiles => 'Per-community profiles';

  @override
  String get premiumPerkMessageScheduling => 'Message scheduling';

  @override
  String get premiumPerkProfileBadge => 'Profile badge';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Custom video backgrounds';

  @override
  String get premiumPerkEntranceSounds => 'Entrance sounds';

  @override
  String get premiumPerkCommunities => 'Communities';

  @override
  String get premiumPerkMessageCharacterLimit => 'Message character limit';

  @override
  String get premiumPerkBookmarkedMessages => 'Bookmarked messages';

  @override
  String get premiumPerkFileUploadSize => 'File upload size';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji & sticker packs';

  @override
  String get premiumPerkSavedMedia => 'Saved media';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Use animated emojis';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Global emoji & sticker access';

  @override
  String get premiumPerkVideoQuality => 'Video quality';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animated avatars & profile banners';

  @override
  String get premiumPerkEarlyAccess => 'Early access to new features';

  @override
  String get premiumPerkCustomThemes => 'Custom themes';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Up to 4K/60fps';

  @override
  String get userSettingsNavPrivacyDashboard => '隐私仪表盘';

  @override
  String get userSettingsNavAuthorizedApps => '已授权的应用';

  @override
  String get userSettingsNavBlockedUsers => '已屏蔽用户';

  @override
  String get userSettingsNavLinkedDevices => '已关联设备';

  @override
  String get userSettingsNavConnections => '连接';

  @override
  String get userSettingsNavLookAndFeel => '外观';

  @override
  String get userSettingsNavAccessibility => '辅助功能';

  @override
  String get userSettingsNavChat => '消息与媒体';

  @override
  String get userSettingsNavAudioAndVideo => '音频与视频';

  @override
  String get userSettingsNavShortcuts => 'Shortcuts';

  @override
  String get audioAndVideoAudioSectionTitle => 'Audio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Configure your microphone, speakers, and voice processing.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Configure your camera and screen sharing quality.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'In-call behavior';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Control confirmation prompts during voice and video calls.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Input device';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Output device';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Default';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Use speaker';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'When off, audio plays through the earpiece or connected headphones.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Input volume';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Output volume';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Voice processing';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Focused voice';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Recommended. Cleans up your mic for clear speech.';

  @override
  String get audioAndVideoDirectInputLabel => 'Direct input';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Sends your audio untouched. Best if you\'re using external audio software.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Custom';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Adjust each setting yourself: noise suppression, echo cancellation, and gain.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Noise suppression';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Enhanced';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'None';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Echo cancellation';

  @override
  String get audioAndVideoAutomaticGainControlLabel => 'Automatic gain control';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Evens out your mic volume. Off when enhanced suppression is on.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mic test';

  @override
  String get audioAndVideoMicTestStartLabel => 'Start mic test';

  @override
  String get audioAndVideoMicTestStopLabel => 'Stop mic test';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName needs microphone access to test your input.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Camera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Mirror camera';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Camera quality';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Screen share quality';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Frame rate';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p and 60 FPS require $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'This instance currently allows screen share up to 720p at 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName needs microphone access to list your devices.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName needs camera access to list your devices.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Don\'t ask when hiding my camera';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Don\'t ask when hiding my screen share';

  @override
  String get userSettingsNavNotifications => 'Notifications';

  @override
  String get notificationsGeneralSectionTitle => 'General';

  @override
  String get notificationsEnableNotificationsLabel => 'Enable notifications';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Get notified when you receive messages. You may need to allow notifications for $productName in your device settings. For per-channel/per-community controls, open notification settings from a community\'s menu.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Enable desktop notifications';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Uses the OS notification center. For per-channel/per-community controls, right-click a community icon and open notification settings.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Enable browser notifications';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Get notified when you receive messages. You may need to allow notifications in your browser settings. For per-channel/per-community controls, right-click a community icon and open notification settings.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Push notification inactive timeout';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName avoids sending push notifications to your mobile devices when you are at your computer. Choose how long you need to be inactive on desktop before you receive push notifications.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minute';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minutes';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'Mention preference';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Reply mention preference';

  @override
  String get notificationsMentionNoPreferenceName => 'No preference';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respect the sender\'s intent, with no warning when they toggle the @ mention';

  @override
  String get notificationsMentionPreferMentionName => 'Prefer @mention';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Default replies to @mention you, and warn the sender if they disable it';

  @override
  String get notificationsMentionPreferNoMentionName => 'Prefer no @mention';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Default replies to omit the @mention, and warn the sender if they enable it';

  @override
  String get notificationsTtsSectionTitle => 'Text-to-speech notifications';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Enable /tts speech playback';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Let /tts read your message aloud. Disabling the setting keeps those commands as regular text.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Adjust playback speed in ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accessibility';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatic message narration';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Converts incoming content to speech, regardless of whether it came from /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Every channel';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Let every incoming message be spoken, regardless of which channel is open.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Active channel only';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narrates only the channel you\'re viewing. Narration follows you between channels.';

  @override
  String get notificationsTtsModeNeverName => 'Never automatically';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Remain silent unless someone runs /tts manually.';

  @override
  String get notificationsTtsModeAriaLabel => 'Speak all messages out loud';

  @override
  String get notificationsSoundsSectionTitle => 'Sounds';

  @override
  String get notificationsMasterVolumeLabel => 'Master volume';

  @override
  String get notificationsMasterVolumeDescription =>
      'Sets the level for every sound effect. Per-sound overrides ignore this.';

  @override
  String get notificationsResetToDefaultVolume => 'Reset to default volume';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Disable all notification sounds';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Your existing notification sound settings will be preserved.';

  @override
  String get notificationsShowMoreSoundEffects => 'Show more sound effects';

  @override
  String get notificationsShowFewerSoundEffects => 'Show fewer sound effects';

  @override
  String get notificationsPreviewSound => 'Preview sound';

  @override
  String get notificationsPerSoundVolumeTitle => 'Per-sound volume';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Set custom volumes for individual sounds. Sounds without an override follow the master volume.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Active custom sound volume overrides: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Following master • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Reset $label to master volume';
  }

  @override
  String get notificationsResetAllOverrides => 'Reset all overrides';

  @override
  String notificationsMuteSound(String label) {
    return 'Mute $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Unmute $label';
  }

  @override
  String get notificationsSoundMessage => 'Community message notifications';

  @override
  String get notificationsSoundDirectMessage => 'Direct message notifications';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Current channel message notifications';

  @override
  String get notificationsSoundMute => 'Voice mute';

  @override
  String get notificationsSoundUnmute => 'Voice unmute';

  @override
  String get notificationsSoundDeaf => 'Voice deafen';

  @override
  String get notificationsSoundUndeaf => 'Voice undeafen';

  @override
  String get notificationsSoundUserJoin => 'User joins channel';

  @override
  String get notificationsSoundUserLeave => 'User leaves channel';

  @override
  String get notificationsSoundUserMove => 'User moved channel';

  @override
  String get notificationsSoundViewerJoin => 'Viewer joins stream';

  @override
  String get notificationsSoundViewerLeave => 'Viewer leaves stream';

  @override
  String get notificationsSoundVoiceDisconnect => 'Voice disconnected';

  @override
  String get notificationsSoundIncomingRing => 'Incoming call';

  @override
  String get notificationsSoundCameraOn => 'Camera on';

  @override
  String get notificationsSoundCameraOff => 'Camera off';

  @override
  String get notificationsSoundScreenShareStart => 'Screen share start';

  @override
  String get notificationsSoundScreenShareStop => 'Screen share stop';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Couldn\'t update push notification timeout. Try again.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Couldn\'t update mention preference. Try again.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notifications blocked';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Couldn\'t enable notifications. Allow notification permission to continue.';

  @override
  String get userSettingsNavLanguageAndTime => '语言与时间';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Interface language';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Choose the language used throughout the app';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Open language settings';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Time format';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Choose how times are displayed throughout the app';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Time format selection';

  @override
  String get languageAndTimeTimeFormatAuto => 'Auto';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-hour';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-hour';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'App language: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'System locale: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Use system locale for time format';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Failed to update time format';

  @override
  String get userSettingsNavDefaultApps => 'Default Apps';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Web Browser';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Choose which browser opens when you tap a link.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'If an app is installed for a site, links will open in that app first.';

  @override
  String get defaultAppsWebBrowserInApp => 'In-app browser';

  @override
  String get defaultAppsWebBrowserExternal => 'External browser';

  @override
  String get userSettingsNavAdvanced => '高级';

  @override
  String get advancedPerformanceReportingTitle => '性能报告';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return '通过分享匿名的崩溃和性能数据来帮助改进 $productName。';
  }

  @override
  String get advancedPerformanceReportingLabel => '发送崩溃和性能报告';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return '所有报告的数据都是匿名的，并且仅发送到 $productName 自有的监控服务——不使用任何第三方提供商。';
  }

  @override
  String get advancedSettingsConfigure => 'Configure';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacy';

  @override
  String get advancedSettingsCategoryAppearance => 'Appearance';

  @override
  String get advancedSettingsCategoryAccessibility => 'Accessibility';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Voice';

  @override
  String get advancedSettingsCategoryDeveloper => 'Developer';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'Enable text selection';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Allow selecting text in the app';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Enable video seek thumbnails';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Thumbnail or live frame while scrubbing video';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptic feedback';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibration feedback for taps and actions. Won\'t sync across devices.';

  @override
  String get advancedSettingShowNekoLabel => 'Show Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko cat that chases your cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Show Neko on your chat input';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Splash zoom animation';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Zoom the logo out when leaving the splash screen';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Keyboard hints';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Keyboard shortcut hints in tooltips';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Enable favorites';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Show favorites throughout the app';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Voice channel join behavior';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmation or double-click for community voice joins';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Require double-click to join voice channels';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Confirm before joining voice channels';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Automatically send GIFs when selected';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Automatically send GIFs from the picker without confirmation';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Save GIF favorites as saved media';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Choose how starred GIF favorites are stored';

  @override
  String get advancedSettingMediaButtonsLabel => 'Media buttons';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Customize which buttons and indicators appear on media attachments and embeds';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Upload attachments before sending';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Start uploading attachments as soon as they are added to the message input';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Strip tracking parameters from URLs';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automatically remove tracking parameters from URLs in messages you send';

  @override
  String get advancedSettingTrustAllLinksLabel => 'Trust all external links';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Skip the external link warning for all domains';

  @override
  String get advancedSettingSearchEnginesLabel => 'Search engines';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configure search engines used from selected text';

  @override
  String get advancedSettingTranslatorsLabel => 'Translators';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configure translator providers used from selected text';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Reverse image search';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Reverse image search providers';

  @override
  String get advancedSettingMessageActionBarLabel => 'Message action bar';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Customize the action bar that appears when hovering over messages';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Expression autocomplete';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Pick what appears when you type a colon in the message input';

  @override
  String get advancedSettingInputButtonsLabel => 'Message input buttons';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Pick which buttons show in the message input';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Scroll to bottom when sending a message';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Choose how chat moves after you send a message';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Skip \"Mark all as read\" confirmation';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Mark all unread inbox channels as read immediately, without asking to confirm';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Hide muted channels by default';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Hide channels you\'ve muted from community sidebars';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Show GIF indicator';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Show attachment expiry indicator';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Show delete button';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Show download button';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Show favorite button';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Show suppress embeds button';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Show message action bar';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'Show only more button';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Show quick reactions';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Enable Shift to expand';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Show default emojis in expression autocomplete';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Show custom emojis in expression autocomplete';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Show stickers in expression autocomplete';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Show saved media in expression autocomplete';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Show GIFs button';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Show media button';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Show stickers button';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Show emoji button';

  @override
  String get advancedSettingShowSendButtonLabel => 'Show send button';

  @override
  String get advancedSettingNewDeviceAlertsLabel => 'Show new device alerts';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Prompt for new audio devices';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Connection volume controls';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Show per-device participant volume sliders in voice menus';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Screen share preview behavior';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Preview, popout, and stream thumbnail behavior';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Screen share codec';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Video codec for screen sharing';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatic (recommended)';

  @override
  String get advancedSettingScreenShareCodecAv1 => 'AV1';

  @override
  String get advancedSettingScreenShareCodecH265 => 'H.265';

  @override
  String get advancedSettingScreenShareCodecVp9 => 'VP9';

  @override
  String get advancedSettingScreenShareCodecH264 => 'H.264';

  @override
  String get advancedSettingScreenShareCodecVp8 => 'VP8';

  @override
  String get advancedSettingPauseScreenSharePreviewLabel =>
      'Pause my screen share preview in the background';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Hide my stream preview thumbnail';

  @override
  String get advancedSettingDeveloperModeLabel => 'Enable developer mode';

  @override
  String get advancedSettingDeveloperModeDescription => 'Enable developer mode';

  @override
  String get advancedSettingSearchEngineGoogle => 'Google';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'Bing';

  @override
  String get advancedSettingSearchEngineGoogleLens => 'Google Lens';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => 'Google Translate';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Default search engine';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Choose which search engine is used by default when searching selected text.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Built-in search engines';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Enable or disable built-in search engines. Enabled engines appear in the message context menu when text is selected.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Custom search engines';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Add your own search engines with a custom URL pattern. Use \'$query\' as a placeholder for the search text.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Add search engine';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Enable at least one search engine below.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Remove search engine';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Default translator';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Choose which translator is used by default when translating selected text.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Built-in translators';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Enable or disable built-in translators. Enabled translators appear in the message context menu when text is selected.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Custom translators';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Add your own translators with a custom URL pattern. Use \'$query\' as a placeholder for the text to translate.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Add translator';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Enable at least one translator below.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Remove translator';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Default reverse image search';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Choose which reverse image search service is used by default when searching an image.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Built-in reverse image search';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Enable or disable built-in reverse image search providers. Enabled providers appear in the context menu of images, avatars, banners, stickers, and emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Custom reverse image search';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Add your own reverse image search providers with a custom URL pattern. Use \'$url\' as a placeholder for the image URL.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Add reverse image search';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Enable at least one reverse image search provider below.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Remove reverse image search';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Add search engine';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Edit search engine';

  @override
  String get advancedSettingAddTranslatorTitle => 'Add translation provider';

  @override
  String get advancedSettingEditTranslatorTitle => 'Edit translation provider';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Add reverse image search engine';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Edit reverse image search engine';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Name';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL pattern';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'My search engine';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'My translator';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'My reverse image search';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Use \'$query\' where the search text should be inserted.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Use \'$query\' where the text to translate should be inserted.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Use \'$url\' where the image URL should be inserted.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Name is required.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'URL pattern is required.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL pattern must contain \'$query\' placeholder.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL pattern must contain \'$url\' placeholder.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL pattern must be a valid URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Add';

  @override
  String get advancedSettingEditSearchProviderAction => 'Edit';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Remove';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Are you sure you want to remove $engineName?';
  }

  @override
  String get userSettingsNavApplications => '应用';

  @override
  String get userSettingsNavAppLogs => '应用日志';

  @override
  String get userSettingsNavDeveloperTools => '开发者工具';

  @override
  String get userSettingsNavLimitsConfig => '限制配置';

  @override
  String get userSettingsNavFeatureFlags => '功能标志';

  @override
  String get userSettingsNavWhatsNew => '新内容';

  @override
  String get userSettingsJoinFluxerLabs => 'Join Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'App Licenses';

  @override
  String get userSettingsAppLicensesDescription =>
      'Open-source software used by this app. This app is built with Flutter.';

  @override
  String get userSettingsAppLicensesLoadError => 'Could not load app licenses.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenses',
      one: '1 license',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => '退出登录';

  @override
  String get quickSwitcherTabSearch => '搜索';

  @override
  String get quickSwitcherTabFriends => '好友';

  @override
  String get quickSwitcherSearchPlaceholder => '搜索频道、用户或社区';

  @override
  String get quickSwitcherSearchFriends => '搜索好友';

  @override
  String get quickSwitcherNoMatchesFound => '未找到匹配项';

  @override
  String get quickSwitcherEmptyHint => '尝试输入其他名称，或使用 @ / # / ! / * 前缀筛选结果。';

  @override
  String get quickSwitcherSectionPeople => '用户';

  @override
  String get quickSwitcherSectionGroupMessages => '群聊';

  @override
  String get quickSwitcherSectionTextChannels => '文本频道';

  @override
  String get quickSwitcherSectionVoiceChannels => '语音频道';

  @override
  String get quickSwitcherSectionCommunities => '社区';

  @override
  String get quickSwitcherSectionSettings => '设置';

  @override
  String get quickSwitcherHomeLabel => '主页';

  @override
  String get quickSwitcherDirectMessagesLabel => '私信';

  @override
  String get quickSwitcherFavoritesLabel => '收藏夹';

  @override
  String get quickSwitcherUserSettingsLabel => '用户设置';

  @override
  String get quickSwitcherNotificationsLabel => '通知';

  @override
  String get quickSwitcherBookmarksLabel => '书签';

  @override
  String get savedMessagesEmptyTitle => 'No bookmarks';

  @override
  String get savedMessagesEmptyBody =>
      'Bookmark messages to save them for later.';

  @override
  String get savedMessagesEndBody => 'There\'s nothing more to see here.';

  @override
  String get savedMessagesRemoveTooltip => 'Remove bookmark';

  @override
  String get quickSwitcherMentionsLabel => '提及';

  @override
  String get quickSwitcherFriendsEmptyTitle => '暂无好友';

  @override
  String get quickSwitcherFriendsEmptyHint => '添加好友开始吧。';

  @override
  String get quickSwitcherFriendsNoMatchTitle => '没有好友匹配搜索';

  @override
  String get quickSwitcherFriendsNoMatchHint => '尝试输入其他名称。';

  @override
  String get quickSwitcherSearchAliasUser => '用户';

  @override
  String get quickSwitcherSearchAliasYou => '你';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => '私信';

  @override
  String get quickSwitcherSearchAliasMessages => '消息';

  @override
  String get quickSwitcherSearchAliasFav => '收藏';

  @override
  String get quickSwitcherSearchAliasStarred => '星标';

  @override
  String get quickSwitcherSearchAliasInbox => '收件箱';

  @override
  String get quickSwitcherSearchAliasSaved => '已保存';

  @override
  String get uiClose => '关闭';

  @override
  String get chatJumpToBottom => '跳至底部';

  @override
  String get uiConfirm => '确认';

  @override
  String get uiLoading => '正在加载';

  @override
  String get uiUnsavedChanges => '未保存的更改';

  @override
  String get uiReset => '重置';

  @override
  String get uiOpenColorPicker => '打开颜色选择器';

  @override
  String get uiSelectPlaceholder => '选择';

  @override
  String get uiSearchPlaceholder => '搜索';

  @override
  String get uiNoOptionsFound => '未找到选项';

  @override
  String get uiDismissNotification => '关闭通知';

  @override
  String get uiColorPickerTitle => '颜色选择器';

  @override
  String get mentionConfirmTitle => '提及所有人？';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return '这将通知 $count 位成员。继续？';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return '这将通知 $count 位在线成员。继续？';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => '提及';

  @override
  String get composerEmojiUnavailable => '您无法在此处使用此表情符号。';

  @override
  String get instanceUrlLabel => '实例 URL';

  @override
  String get instanceUrlPlaceholder => '输入实例 URL（例如 fluxer.app）';

  @override
  String get resetToDefaultInstance => '重置为 Fluxer';

  @override
  String get instanceConnect => '连接';

  @override
  String get instanceConnecting => '正在连接…';

  @override
  String get instanceConnectFailed => '无法连接到实例';

  @override
  String get recentInstances => '最近的实例';

  @override
  String removeRecentInstance(String domain) {
    return '从最近的实例中移除 $domain';
  }

  @override
  String get instanceSheetTitle => '连接到实例';

  @override
  String get connectToDifferentInstance => '连接到其他实例';

  @override
  String get changeInstance => '更改';

  @override
  String get instanceConnectionRequired => '连接到实例后才能登录';

  @override
  String get comingSoon => '即将推出';

  @override
  String get guildNavbarDirectMessages => '私信';

  @override
  String get guildNavbarExploreDiscoverableCommunities => '探索可发现的社区';

  @override
  String get discoveryExplore => '探索';

  @override
  String get discoveryExplorePublicCommunities => '探索公开社区';

  @override
  String get discoveryListingSubheading => '想在此列出您的社区？如果符合社区设置 > 发现中的要求，请申请。';

  @override
  String get discoverySearchCommunities => '搜索社区';

  @override
  String get discoveryFilterByLanguage => '按语言筛选';

  @override
  String get discoveryAllLanguages => '所有语言';

  @override
  String get discoveryAllCategories => '全部';

  @override
  String get discoveryCategoryGaming => '游戏';

  @override
  String get discoveryCategoryMusic => '音乐';

  @override
  String get discoveryCategoryEntertainment => '娱乐';

  @override
  String get discoveryCategoryEducation => '教育';

  @override
  String get discoveryCategoryScienceAndTechnology => '科学与技术';

  @override
  String get discoveryCategoryContentCreator => '内容创作者';

  @override
  String get discoveryCategoryAnimeAndManga => '动漫与漫画';

  @override
  String get discoveryCategoryMoviesAndTv => '电影与电视';

  @override
  String get discoveryCategoryOther => '其他';

  @override
  String get discoveryNoCommunitiesMatch => '没有社区匹配。';

  @override
  String get discoveryJoinCommunity => '加入社区';

  @override
  String get discoveryJoined => '已加入';

  @override
  String discoveryOnlineCount(String count) {
    return '$count 人在线';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 位成员',
      one: '1 位成员',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => '无描述。';

  @override
  String get discoveryCommunities => '社区';

  @override
  String get discoveryApps => '应用';

  @override
  String get discoveryJoinErrorGenericTitle => '无法加入此社区';

  @override
  String get discoveryJoinErrorGenericMessage => '出现问题。请稍后重试。';

  @override
  String get discoveryJoinErrorFullTitle => '此社区已满';

  @override
  String get discoveryJoinErrorFullMessage => '此社区已达到成员上限，您暂时无法加入。';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => '您已达到社区数量上限';

  @override
  String get discoveryJoinErrorMaxGuildsMessage => '您已加入的社区数量已达上限。请离开一个社区后再试。';

  @override
  String get discoveryJoinErrorBannedTitle => '您无法加入此社区';

  @override
  String get discoveryJoinErrorBannedMessage => '您已被禁止加入此社区。';

  @override
  String get discoveryJoinErrorNotAvailableTitle => '此社区不再可用';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      '它可能已退出发现或关闭了新成员加入。刷新页面后将不再显示。';

  @override
  String get discoveryJoinErrorRateLimitTitle => '您操作太快了';

  @override
  String get discoveryJoinErrorRateLimitMessage => '请稍等片刻再试。';

  @override
  String get guildNavbarAddCommunity => '添加社区';

  @override
  String get guildNavbarHelp => '帮助';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => '新消息';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '$folderName 已折叠';
  }

  @override
  String get guildNavbarGuildSelected => 'selected';

  @override
  String get guildNavbarGuildUnread => 'unread';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mentions',
      one: '1 mention',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'muted';

  @override
  String get authShowPassword => 'Show password';

  @override
  String get authHidePassword => 'Hide password';

  @override
  String get chatLoadingMessages => 'Loading messages';

  @override
  String get friendsMessageFriend => 'Message';

  @override
  String get friendsFriendActions => 'Friend actions';

  @override
  String get friendsAcceptRequest => 'Accept friend request';

  @override
  String get friendsDeclineRequest => 'Decline friend request';

  @override
  String get friendsCancelRequest => 'Cancel friend request';

  @override
  String get friendsOpenInbox => 'Inbox';

  @override
  String get profileRemoveFriend => 'Remove friend';

  @override
  String get profileUnblockUser => 'Unblock user';

  @override
  String get profileAcceptFriendRequest => 'Accept friend request';

  @override
  String get profileCancelFriendRequest => 'Cancel friend request';

  @override
  String get profileSendFriendRequest => 'Add friend';

  @override
  String get accountOverflowMenu => 'Account options';

  @override
  String get navHome => 'Home';

  @override
  String get navNotifications => 'Notifications';

  @override
  String get navYou => 'You';

  @override
  String get guildFolderSettingsTitle => 'Folder settings';

  @override
  String get guildFolderNameLabel => 'Folder name';

  @override
  String get guildFolderColorLabel => 'Folder color';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Show icon when collapsed';

  @override
  String get guildFolderIconLabel => 'Folder icon';

  @override
  String get guildFolderDelete => 'Delete folder';

  @override
  String get guildFolderIconFolder => 'Folder';

  @override
  String get guildFolderIconStar => 'Star';

  @override
  String get guildFolderIconHeart => 'Heart';

  @override
  String get guildFolderIconBookmark => 'Bookmark';

  @override
  String get guildFolderIconGameController => 'Game controller';

  @override
  String get guildFolderIconShield => 'Shield';

  @override
  String get guildFolderIconMusicNote => 'Music note';

  @override
  String get guildFolderMarkAsRead => 'Mark folder as read';

  @override
  String get guildBulkMuteCommunities => 'Mute communities';

  @override
  String get guildBulkUnmuteCommunities => 'Unmute communities';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Community notification settings';

  @override
  String get guildBulkCommunityPrivacySettings => 'Community privacy settings';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Allow @everyone and @here';

  @override
  String get guildBulkAllowRoleMentions => 'Allow role mentions';

  @override
  String get guildBulkEnableMobilePush => 'Enable mobile push notifications';

  @override
  String get guildBulkDisableMobilePush => 'Disable mobile push notifications';

  @override
  String get guildBulkAllowDirectMessages => 'Allow direct messages';

  @override
  String get guildBulkBlockDirectMessages => 'Block direct messages';

  @override
  String get guildBulkAllowBotDirectMessages => 'Allow bot direct messages';

  @override
  String get guildBulkBlockBotDirectMessages => 'Block bot direct messages';

  @override
  String get guildNavbarGroupDm => '群聊';

  @override
  String get guildNavbarCreateChannel => '创建频道';

  @override
  String get guildNavbarChannelType => '频道类型';

  @override
  String get guildNavbarTextChannel => '文本频道';

  @override
  String get guildNavbarTextChannelDescription => '发送消息、图片、GIF 和表情';

  @override
  String get guildNavbarVoiceChannel => '语音频道';

  @override
  String get guildNavbarVoiceChannelDescription => '通过语音、视频和屏幕共享一起畅聊';

  @override
  String get guildNavbarLinkChannel => '链接频道';

  @override
  String get guildNavbarLinkChannelDescription => '快速访问外部网站或资源';

  @override
  String get guildNavbarNameLabel => '名称';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => '创建分类';

  @override
  String get guildNavbarNewCategoryHint => '新分类';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return '邀请好友加入 $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return '接收者将进入 #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => '搜索好友';

  @override
  String get guildNavbarNoFriendsYet => '还没有好友';

  @override
  String get guildNavbarNoResults => '无结果';

  @override
  String get guildNavbarInviteLinkPrompt => '或者，向好友发送邀请链接：';

  @override
  String get guildNavbarInviteLink => '邀请链接';

  @override
  String get guildNavbarCopy => '复制';

  @override
  String get guildNavbarCopied => '已复制！';

  @override
  String get guildNavbarInviteExpiresSevenDays => '您的邀请链接将在 7 天后过期。';

  @override
  String get guildNavbarInviteNeverExpires => '此邀请链接永不过期。';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return '您的邀请链接将在 $duration 后过期。';
  }

  @override
  String get guildNavbarEditInviteLink => '编辑邀请链接';

  @override
  String get guildNavbarInviteLinkSettings => '邀请链接设置';

  @override
  String get guildNavbarExpireAfter => '过期时间';

  @override
  String get guildNavbarMaxUses => '最大使用次数';

  @override
  String get guildNavbarGrantTemporaryMembership => '授予临时会员资格';

  @override
  String get guildNavbarTemporaryMembershipDescription => '除非分配了角色，否则会员下线时将被移除';

  @override
  String get guildNavbarCreateNewLink => '创建新链接';

  @override
  String get guildNavbarSent => '已发送';

  @override
  String get guildNavbarInvite => '邀请';

  @override
  String get guildNavbarLeaveCommunityTitle => '离开社群';

  @override
  String get guildNavbarLeaveCommunityDescription => '确定要离开此社群吗？您将无法再看到任何消息。';

  @override
  String get guildNavbarLeaveCommunityConfirm => '离开社群';

  @override
  String get guildNavbarDeleteMyMessagesTitle => '删除在此社群中的消息？';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      '永久删除您在此处、所有频道中发送的每条消息。无法撤销。';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => '删除我的消息';

  @override
  String get guildNavbarDeletedYourMessages => '已删除您的消息';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => '无法删除您的消息';

  @override
  String get guildNavbarRemoveOverride => '移除覆盖设置';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return '静音至 $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return '仅限 $productName 员工访问';
  }

  @override
  String get guildNavbarInvitesPaused => '此社群的邀请当前已暂停';

  @override
  String get guildNavbarDurationNever => '永不';

  @override
  String get guildNavbarDuration30Minutes => '30 分钟';

  @override
  String get guildNavbarDuration1Hour => '1 小时';

  @override
  String get guildNavbarDuration6Hours => '6 小时';

  @override
  String get guildNavbarDuration12Hours => '12小时';

  @override
  String get guildNavbarDuration1Day => '1天';

  @override
  String get guildNavbarDuration7Days => '7天';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count秒';
  }

  @override
  String get guildNavbarNever => '从不';

  @override
  String get guildNavbarNoLimit => '无限制';

  @override
  String get guildNavbarOneUse => '1次';

  @override
  String guildNavbarUses(int count) {
    return '$count次';
  }

  @override
  String get guildMenuMarkAsRead => '标记为已读';

  @override
  String get guildPeekMoreOptions => '更多选项';

  @override
  String get guildMenuInviteMembers => '邀请成员';

  @override
  String get guildMenuCommunitySettings => '社区设置';

  @override
  String get guildMenuEditCommunityProfile => '编辑社区资料';

  @override
  String get guildMenuUnmuteCommunity => '取消静音社区';

  @override
  String get guildMenuMuteCommunity => '静音社区';

  @override
  String get guildMenuHideMutedChannels => '隐藏已静音频道';

  @override
  String get guildMenuReportCommunity => '举报社区';

  @override
  String get guildMenuDebugCommunity => '调试社区';

  @override
  String get guildMenuCopyCommunityId => '复制社区ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return '直到 $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => '概览';

  @override
  String get guildMenuSettingsRoles => '角色和权限';

  @override
  String get guildMenuSettingsEmoji => '自定义表情';

  @override
  String get guildMenuSettingsStickers => '自定义贴纸';

  @override
  String get guildMenuSettingsSafetyModeration => '安全与审核';

  @override
  String get guildMenuSettingsActivityLog => '活动日志';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook';

  @override
  String get guildMenuSettingsCustomInviteUrl => '自定义邀请链接';

  @override
  String get guildMenuSettingsDiscovery => '发现';

  @override
  String get guildMenuSettingsMembers => '成员';

  @override
  String get guildMenuSettingsInviteLinks => '邀请链接';

  @override
  String get guildMenuSettingsBans => '封禁';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission => '您没有权限查看此设置标签页。';

  @override
  String get guildSettingsOverviewIconTitle => '图标';

  @override
  String get guildSettingsUploadImage => '上传图片';

  @override
  String get guildSettingsOverviewBannerTitle => '横幅';

  @override
  String get guildSettingsOverviewBannerHint => '为您的服务器上传一张横幅。';

  @override
  String get guildSettingsOverviewNameTitle => '名称';

  @override
  String get guildSettingsOverviewNameHint => '我的超棒社区';

  @override
  String get guildSettingsOverviewStatsTitle => '统计';

  @override
  String get guildSettingsOverviewMembers => '成员';

  @override
  String get guildSettingsOverviewOnline => '在线';

  @override
  String get guildSettingsRolesDescription => '使用角色对成员进行分组并分配权限。';

  @override
  String get guildSettingsCreateRole => '创建角色';

  @override
  String get guildSettingsRolesListTitle => '角色';

  @override
  String get guildSettingsRolesNewRole => 'New role';

  @override
  String get guildSettingsRolesDeleteRole => 'Delete role';

  @override
  String get guildSettingsRolesBackToRoles => 'Back to roles';

  @override
  String get guildSettingsBackToSettings => 'Back to settings';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Edit \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configure role settings and permissions';

  @override
  String get guildSettingsRolesDisplaySection => 'Display';

  @override
  String get guildSettingsRolesRoleName => 'Role name';

  @override
  String get guildSettingsRolesRoleColor => 'Role color';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Type a color (hex, rgb(), hsl(), or name) or use the picker.';

  @override
  String get guildSettingsRolesShowSeparately => 'Show this role separately';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Lists members with this role in their own section in the member list.';

  @override
  String get guildSettingsRolesAllowMentions => 'Allow mentions for this role';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Members with the \"$permission\" permission can always mention roles, regardless of this setting.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Use this button to quickly clear all permissions.';

  @override
  String get guildSettingsRolesClearPermissions => 'Clear permissions';

  @override
  String get guildSettingsRolesPermissionsSection => 'Permissions';

  @override
  String get guildSettingsRolesSearchPermissions => 'Search permissions';

  @override
  String get guildSettingsRolesDenseLayout => 'Dense layout';

  @override
  String get guildSettingsRolesComfyLayout => 'Comfy layout';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => 'Switch to dense layout';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => 'Switch to comfy layout';

  @override
  String get guildSettingsRolesSingleColumn => 'Single column';

  @override
  String get guildSettingsRolesTwoColumns => 'Two columns';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Switch to single column';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Switch to two columns';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'No permissions found';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'Custom hoist order';

  @override
  String get guildSettingsRolesHoistOrder => 'Hoist order';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Reset to default';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Drag roles to customize the order they appear in the member list.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'No hoisted roles. Enable \"Show this role separately\" on a role to see it here.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'You cannot edit this role because it is your highest role or above you';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'You need the \"$permission\" permission to edit these permissions';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'You cannot edit a role at or above your highest role';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'You cannot grant a permission you don\'t have';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'You cannot remove this permission because it would remove it from yourself';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Roles updated successfully';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Role created successfully';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Role deleted successfully';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Hoist order reset to default';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Role name is required';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Give the role a name before saving.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Couldn\'t create role';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'Couldn\'t update roles';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Couldn\'t delete role';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" wouldn\'t delete. Try again.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Couldn\'t reset hoist order';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Try again in a moment.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Are you sure you want to delete the $name role? Any members with this role will no longer have it.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Community-wide';

  @override
  String get permissionCategoryMessagesMedia => 'Messages & media';

  @override
  String get permissionCategoryModeration => 'Moderation';

  @override
  String get permissionCategoryChannelAccess => 'Channel access';

  @override
  String get permissionCategoryChannelManagement => 'Channel management';

  @override
  String get permissionCategoryAudioVideo => 'Audio & video';

  @override
  String get permissionUnknown => 'Unknown permission';

  @override
  String get permissionAdministrator => 'Administrator';

  @override
  String get permissionAdministratorDescription =>
      'Grants all permissions and bypasses channel restrictions. Highly sensitive.';

  @override
  String get permissionViewActivityLog => 'View activity log';

  @override
  String get permissionViewActivityLogDescription =>
      'Read the community\'s activity log of changes and moderation actions.';

  @override
  String get permissionManageCommunity => 'Manage community';

  @override
  String get permissionManageCommunityDescription =>
      'Edit global settings like name, description, and icon.';

  @override
  String get permissionManageRoles => 'Manage roles';

  @override
  String get permissionManageRolesDescription =>
      'Create, edit, or delete roles below your highest role. Also allows editing channel permission overwrites.';

  @override
  String get permissionManageChannels => 'Manage channels';

  @override
  String get permissionManageChannel => 'Manage channel';

  @override
  String get permissionManageChannelDescription =>
      'Rename and edit this channel\'s settings.';

  @override
  String get permissionManagePermissions => 'Manage permissions';

  @override
  String get permissionManagePermissionsDescription =>
      'Edit overwrites for roles and members in this channel.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Create, edit, or delete webhooks for this channel.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'See the member list for this channel.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Manage invite links for this channel.';

  @override
  String get permissionOverwriteDeny => 'Deny';

  @override
  String get permissionOverwriteInherit => 'Neutral (inherit)';

  @override
  String get permissionOverwriteAllow => 'Allow';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Use these buttons to quickly set all permissions.';

  @override
  String get permissionManageChannelsDescription =>
      'Create, edit, or delete channels and categories.';

  @override
  String get permissionKickMembers => 'Kick members';

  @override
  String get permissionBanMembers => 'Ban members';

  @override
  String get permissionCreateInviteLinks => 'Create invite links';

  @override
  String get permissionChangeOwnNickname => 'Change own nickname';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Update your own nickname.';

  @override
  String get permissionManageNicknames => 'Manage nicknames';

  @override
  String get permissionManageNicknamesDescription =>
      'Change other members\' nicknames.';

  @override
  String get permissionCreateEmojiStickers => 'Create emoji & stickers';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Upload new emoji and stickers, and manage your own creations.';

  @override
  String get permissionManageEmojiStickers => 'Manage emoji & stickers';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Edit or delete emoji and stickers created by other members.';

  @override
  String get permissionManageWebhooks => 'Manage webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Create, edit, or delete webhooks.';

  @override
  String get permissionSendMessages => 'Send messages';

  @override
  String get permissionSendTtsMessages => 'Send TTS messages';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Send text-to-speech messages.';

  @override
  String get permissionManageMessages => 'Manage messages';

  @override
  String get permissionManageMessagesDescription =>
      'Delete other members\' messages. Pinning is controlled separately.';

  @override
  String get permissionPinMessages => 'Pin messages';

  @override
  String get permissionEmbedLinks => 'Embed links';

  @override
  String get permissionAttachFiles => 'Attach files';

  @override
  String get permissionMentionEveryone => 'Use @everyone/@here and @role';

  @override
  String get permissionMentionEveryoneDescription =>
      'Mention everyone or any role (even if the role isn\'t set to be mentionable).';

  @override
  String get permissionUseExternalEmoji => 'Use external emoji';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Use emoji from other communities.';

  @override
  String get permissionUseExternalStickers => 'Use external stickers';

  @override
  String get permissionAddReactions => 'Add reactions';

  @override
  String get permissionAddReactionsDescription =>
      'Add new reactions to messages.';

  @override
  String get permissionBypassSlowmode => 'Bypass slowmode';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignore per-channel message rate limits.';

  @override
  String get permissionTimeOutMembers => 'Time out members';

  @override
  String get permissionTimeOutMembersDescription =>
      'Prevent members from sending messages, reacting, and joining voice for a duration.';

  @override
  String get permissionViewChannel => 'View channel';

  @override
  String get permissionViewChannelMembers => 'View channel members';

  @override
  String get permissionViewChannelMembersDescription =>
      'See the member list for channels in this community.';

  @override
  String get permissionConnect => 'Connect';

  @override
  String get permissionSpeak => 'Speak';

  @override
  String get permissionStreamVideo => 'Stream video';

  @override
  String get permissionUseVoiceActivity => 'Use voice activity';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Without this permission, push-to-talk is required.';

  @override
  String get permissionPrioritySpeaker => 'Priority speaker';

  @override
  String get permissionMuteMembers => 'Mute members';

  @override
  String get permissionDeafenMembers => 'Deafen members';

  @override
  String get permissionMoveMembers => 'Move members';

  @override
  String get permissionMoveMembersDescription =>
      'Drag members between channels they can access.';

  @override
  String get permissionSetVoiceRegion => 'Set voice region';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '已用 $staticCount 个静态表情，$animatedCount 个动态表情';
  }

  @override
  String get guildSettingsEmojiEmpty => '暂无自定义表情。';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '已上传 $count 个贴纸';
  }

  @override
  String get guildSettingsStickersEmpty => '暂无自定义贴纸。';

  @override
  String get guildSettingsModerationVerificationTitle => '成员验证';

  @override
  String get guildSettingsModerationVerificationDescription =>
      '选择成员在可以发布消息或向社区成员发送私信前必须满足的条件。';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      '拥有特定角色的成员可以绕过这些检查。对于公开的社区，我们建议启用验证。';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      '列在“发现”中的社区至少需要已验证的电子邮件。启用“发现”时无法选择“无”。';

  @override
  String get guildSettingsModerationMatureTitle => '不适宜内容和内容警告';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      '配置不适宜内容的标签和成员可选的内容警告。';

  @override
  String get guildSettingsModerationMatureToggle => '不适宜内容';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      '将此社区标记为包含不适宜内容。';

  @override
  String get guildSettingsVerificationNone => '无';

  @override
  String get guildSettingsVerificationNoneDescription => '无需验证。';

  @override
  String get guildSettingsVerificationLow => '低';

  @override
  String get guildSettingsVerificationLowDescription => '需要已验证的电子邮件地址。';

  @override
  String get guildSettingsVerificationMedium => '中';

  @override
  String get guildSettingsVerificationMediumDescription =>
      '需要已验证的电子邮件地址，并且账户已创建至少 5 分钟。';

  @override
  String get guildSettingsVerificationHigh => '高';

  @override
  String get guildSettingsVerificationHighDescription =>
      '需要满足中等验证的所有条件，并且已成为社区成员至少 10 分钟。';

  @override
  String get guildSettingsVerificationHighest => '非常高';

  @override
  String get guildSettingsVerificationHighestDescription => '需要已验证的电话号码。';

  @override
  String get guildSettingsAuditLogDescription => '跟踪社区内的版主操作。';

  @override
  String get guildSettingsAuditLogEmpty => '暂无日志';

  @override
  String get guildSettingsAuditLogEmptyDescription => '版主操作和社区更改将显示在此处。';

  @override
  String get guildSettingsAuditLogFilterAllUsers => '所有用户';

  @override
  String get guildSettingsAuditLogFilterAllActions => '所有操作';

  @override
  String get guildSettingsAuditLogNoReason => '未提供原因。';

  @override
  String get guildSettingsAuditLogUnknownUser => '未知用户';

  @override
  String get guildSettingsAuditLogLoadError => '加载活动日志时出错。';

  @override
  String get guildSettingsAuditLogLoadErrorTitle => '无法加载活动日志';

  @override
  String get guildSettingsAuditLogReason => '原因';

  @override
  String get guildSettingsAuditLogSomeone => '某人';

  @override
  String get guildSettingsAuditLogSomething => '某事';

  @override
  String get guildSettingsAuditLogUnknownEntity => '未知实体';

  @override
  String get guildSettingsAuditLogNothing => '无';

  @override
  String get guildSettingsAuditLogUnknownTarget => '未知目标';

  @override
  String get auditLogActionGuildUpdate => '社区已更新';

  @override
  String get auditLogActionChannelCreate => '频道已创建';

  @override
  String get auditLogActionChannelUpdate => '频道已更新';

  @override
  String get auditLogActionChannelDelete => '频道已删除';

  @override
  String get auditLogActionChannelOverwriteCreate => '频道覆盖已添加';

  @override
  String get auditLogActionChannelOverwriteUpdate => '频道覆盖已更新';

  @override
  String get auditLogActionChannelOverwriteDelete => '频道覆盖已移除';

  @override
  String get auditLogActionMemberKick => '成员已被踢出';

  @override
  String get auditLogActionMemberPrune => '成员已被清理';

  @override
  String get auditLogActionMemberBanAdd => '成员已被禁止';

  @override
  String get auditLogActionMemberBanRemove => '成员已解除禁止';

  @override
  String get auditLogActionMemberUpdate => '成员已更新';

  @override
  String get auditLogActionMemberRoleUpdate => '成员角色已更新';

  @override
  String get auditLogActionMemberMove => '成员已被移动';

  @override
  String get auditLogActionMemberDisconnect => '成员已断开连接';

  @override
  String get auditLogActionBotAdd => '机器人已添加';

  @override
  String get auditLogActionRoleCreate => '角色已创建';

  @override
  String get auditLogActionRoleUpdate => '角色已更新';

  @override
  String get auditLogActionRoleDelete => '角色已删除';

  @override
  String get auditLogActionInviteCreate => '邀请已创建';

  @override
  String get auditLogActionInviteUpdate => '邀请已更新';

  @override
  String get auditLogActionInviteDelete => '邀请已删除';

  @override
  String get auditLogActionWebhookCreate => 'Webhook 已创建';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook 已更新';

  @override
  String get auditLogActionWebhookDelete => 'Webhook 已删除';

  @override
  String get auditLogActionEmojiCreate => '表情符号已创建';

  @override
  String get auditLogActionEmojiUpdate => '表情符号已更新';

  @override
  String get auditLogActionEmojiDelete => '表情符号已删除';

  @override
  String get auditLogActionStickerCreate => '贴纸已创建';

  @override
  String get auditLogActionStickerUpdate => '贴纸已更新';

  @override
  String get auditLogActionStickerDelete => '贴纸已删除';

  @override
  String get auditLogActionMessageDelete => '消息已删除';

  @override
  String get auditLogActionMessageBulkDelete => '消息已删除';

  @override
  String get auditLogActionMessagePin => '消息已置顶';

  @override
  String get auditLogActionMessageUnpin => '消息已取消置顶';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor 更新了社区设置。';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor 创建了频道 $target。';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor 更新了频道 $target。';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor 删除频道 $target。';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor 为 $target 添加了频道权限。';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 在频道 $channel 中为 $target 添加了频道权限。';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor 更新了 $target 的频道权限。';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 在频道 $channel 中更新了 $target 的频道权限。';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor 移除了 $target 的频道权限。';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 在频道 $channel 中移除了 $target 的频道权限。';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor 将 $target 踢出。';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor 封禁了 $target。';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor 解除了对 $target 的封禁。';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor 更新了 $target。';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor 更新了 $target 的角色。';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor 清理了不活跃成员。';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor 清理了不活跃 $days 天的成员。';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor 将 $target 移动到另一个语音频道。';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 将 $target 移动到 $channel。';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor 将 $target 从语音断开连接。';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor 添加了机器人 $target。';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor 创建了角色 $target。';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor 更新了角色 $target。';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor 删除角色 $target。';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor 创建了邀请 $target。';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 为频道 $channel 创建了邀请 $target。';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor 更新了邀请 $target。';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 为频道 $channel 更新了邀请 $target。';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor 删除邀请 $target。';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 为频道 $channel 删除邀请 $target。';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor 创建了 Webhook $target。';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor 更新了 Webhook $target。';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor 删除 Webhook $target。';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor 添加了表情符号 $target。';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor 更新了表情符号 $target。';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor 删除了表情符号 $target。';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor 添加了贴纸 $target。';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor 更新了贴纸 $target。';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor 删除了贴纸 $target。';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor 删除了一条消息。';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor 在 $channel 中删除了一条消息。';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor 删除多条消息。';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor 删除 $count 条消息。';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor 在 $channel 中删除多条消息。';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor 在 $channel 中删除 $count 条消息。';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor 钉选了一条消息。';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor 在 $channel 中钉选了一条消息。';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor 取消了消息的钉选。';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor 在 $channel 中取消了消息的钉选。';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor 对 $target 执行了审计操作。';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '将 $field 从 $oldValue 更新为 $newValue。';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '将 $field 设置为 $newValue。';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '已清除 $field（原值为 $oldValue）。';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '已更新 $field。';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return '将社区重命名为 $name。';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon => '已更新社区图标。';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return '将频道重命名为 $name。';
  }

  @override
  String get auditLogChangeClearedTopic => '已清除主题。';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return '已将主题更新为 $topic。';
  }

  @override
  String get auditLogChangeEnabledMatureContent => '已启用不适宜内容。';

  @override
  String get auditLogChangeDisabledMatureContent => '已禁用不适宜内容。';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return '将昵称设置为 $nickname。';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return '已移除昵称 $nickname。';
  }

  @override
  String get auditLogChangeMutedMember => '已将成员静音。';

  @override
  String get auditLogChangeUnmutedMember => '已取消成员静音。';

  @override
  String get auditLogChangeDeafenedMember => '已将成员设为听障。';

  @override
  String get auditLogChangeUndeafenedMember => '已取消成员的听障设置。';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '添加了 $roles。';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '移除了 $roles。';
  }

  @override
  String auditLogOptionChannel(String value) {
    return '频道：$value。';
  }

  @override
  String auditLogOptionMessage(String value) {
    return '消息：$value。';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return '邀请者：$value。';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除了 # 条消息。',
      one: '删除了 # 条消息。',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '移除了 # 名成员。',
      one: '移除了 # 名成员。',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => '此邀请永不过期。';

  @override
  String get auditLogOptionTemporaryMembership => '授予临时成员资格。';

  @override
  String get auditLogOptionPermanentMembership => '授予永久成员资格。';

  @override
  String get guildSettingsLoadMore => '加载更多';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription => '管理发布消息到频道的 Webhook。';

  @override
  String get guildSettingsWebhooksEmpty => '未配置 Webhook。';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'This community doesn\'t have any webhooks yet. Go to $channelSettingsPath to create one.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'You need the \"$permission\" permission to view and edit webhooks for this community.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'Failed to load webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'There was an error loading the webhooks. Try again.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks updated';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'Failed to update webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Unknown channel';

  @override
  String get guildSettingsCopyUrl => '复制 URL';

  @override
  String get guildSettingsCopiedUrl => 'URL 已复制到剪贴板';

  @override
  String get guildSettingsDeleteWebhook => '删除 Webhook';

  @override
  String get guildSettingsVanityUrlDescription => '设置服务器的自定义邀请链接。';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => '保存';

  @override
  String get guildSettingsVanityUrlUsageTitle => '使用情况';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count 次使用';
  }

  @override
  String get guildSettingsDiscoveryDescription => '申请在服务器发现中列出。';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return '申请需要至少 $count 名成员。';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Pending';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Approved';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Rejected';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Removed';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Reason: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Your community is listed in Discovery. You can update your listing details below or withdraw to remove it.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Your application is pending review. You can still update your listing details or withdraw the application.';

  @override
  String get guildSettingsDiscoveryCategory => '类别';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => '描述';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Describe what your community is about';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'A description is required.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Description must be at least $minLength characters.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Description must be no more than $maxLength characters.';
  }

  @override
  String get guildSettingsDiscoveryTags => '标签';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => '游戏、艺术、音乐';

  @override
  String get guildSettingsDiscoveryAddTag => 'Add';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Remove tag $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Couldn\'t add tag';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Tags must be 2 to $maxLength characters and alphanumeric.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'You can only add up to $maxTags tags.';
  }

  @override
  String get guildSettingsDiscoveryApply => '提交申请';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => '撤回';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Discovery application sent';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Discovery listing updated';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Discovery application withdrawn';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Couldn\'t withdraw application';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Try again in a moment.';

  @override
  String get guildSettingsMembersDescription => '搜索和管理服务器成员。';

  @override
  String get guildSettingsMembersSearchHint => '搜索成员';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count 名成员';
  }

  @override
  String get guildMembersRecentTitle => 'Recent members';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Showing $displayedCount of $totalCount total members';
  }

  @override
  String get guildMembersSort => 'Sort';

  @override
  String get guildSettingsMembersSortNewest => '最新优先';

  @override
  String get guildMembersSortOldest => 'Oldest first';

  @override
  String get guildMembersColumnName => 'Name';

  @override
  String get guildMembersColumnMemberSince => 'Member since';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Joined $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Join method';

  @override
  String get guildMembersColumnRoles => 'Roles';

  @override
  String get guildMembersColumnActions => 'Actions';

  @override
  String get guildMembersFilterMemberSince => 'Filter by member since';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filter by account creation date';

  @override
  String get guildMembersFilterJoinMethod => 'Filter by join method';

  @override
  String get guildMembersFilterRoles => 'Filter by roles';

  @override
  String get guildMembersFilterAll => 'All';

  @override
  String get guildMembersFilterPast1Hour => 'Past 1 hour';

  @override
  String get guildMembersFilterPast24Hours => 'Past 24 hours';

  @override
  String get guildMembersFilterPast7Days => 'Past 7 days';

  @override
  String get guildMembersFilterPast2Weeks => 'Past 2 weeks';

  @override
  String get guildMembersFilterPast3Weeks => 'Past 3 weeks';

  @override
  String get guildMembersFilterPast4Weeks => 'Past 4 weeks';

  @override
  String get guildMembersFilterPast3Months => 'Past 3 months';

  @override
  String get guildMembersFilterCustomRange => 'Custom range...';

  @override
  String get guildMembersDateRangeTitle => 'Custom date range';

  @override
  String get guildMembersDateAfter => 'After date';

  @override
  String get guildMembersDateBefore => 'Before date';

  @override
  String get guildMembersClearAll => 'Clear all';

  @override
  String get guildMembersRowsPerPage => 'Rows per page';

  @override
  String get guildMembersEmptySearch => 'Nobody matches that search.';

  @override
  String get guildMembersLoadError =>
      'Something went wrong loading members. Try again later.';

  @override
  String get guildMembersIndexing => 'Indexing members…';

  @override
  String get guildMembersGoToPage => 'Go to page';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Go to page $page';
  }

  @override
  String get guildMembersJumpToPage => 'Jump to page';

  @override
  String get guildMembersJoinSourceCreator => 'Community creator';

  @override
  String get guildMembersJoinSourceInvite => 'Invite';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Invite ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Invited by $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Vanity URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Bot invite';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Platform admin';

  @override
  String get guildMembersJoinSourceDiscovery => 'Discovery';

  @override
  String get guildMembersJoinMethodUnknown => 'Unknown';

  @override
  String get guildMembersCommunityOwner => 'Community owner';

  @override
  String get guildMembersViewAllRoles => 'View all roles';

  @override
  String get guildMembersJoinedJustNow => 'Just now';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Members';

  @override
  String get guildMembersChannelListSelected => 'Members, selected';

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription => '查看和撤销活动的邀请链接。';

  @override
  String get guildSettingsInvitesEmpty => '没有活动邀请。';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'This community doesn\'t have any invite links yet. Go to a channel and create an invite to invite people.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'Failed to load invites';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'There was an error loading the invites. Try again.';

  @override
  String get guildSettingsInvitesTryAgain => 'Try again';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Show creation date instead of expiration date';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pause invites';

  @override
  String get guildSettingsInvitesEnableInvites => 'Enable invites';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pause invites for this community';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Enable invites for this community';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pause invites? New users won\'t be able to join through invite links until you re-enable them. Existing members won\'t be affected.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Enable invites? Users will be able to join this community through invite links again.';

  @override
  String get guildSettingsInvitesPause => 'Pause';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Invites are paused for this community.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Invites are paused because $productName detected a potential raid. New users can\'t join right now.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Inviter:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Channel:';

  @override
  String get guildSettingsInvitesLabelCode => 'Code:';

  @override
  String get guildSettingsInvitesLabelUses => 'Uses:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Created:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Expires:';

  @override
  String get guildSettingsInvitesUnknown => 'Unknown';

  @override
  String get guildSettingsInvitesNoCategory => 'No category';

  @override
  String get guildSettingsInvitesExpired => 'Expired';

  @override
  String get guildSettingsInvitesNever => 'Never';

  @override
  String get guildSettingsInvitesCopyLink => 'Copy invite link';

  @override
  String get guildSettingsInvitesRevoke => 'Revoke invite';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => 'Couldn\'t revoke invite';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'The link may still work. Try again in a moment.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses 次使用';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return '将于 $date 过期';
  }

  @override
  String get guildSettingsBansDescription => '查看和管理被封禁的用户。';

  @override
  String get guildSettingsBansSearchHint => '搜索封禁';

  @override
  String get guildSettingsBansEmpty => '没有被封禁的用户。';

  @override
  String get guildSettingsBanPermanent => '永久封禁';

  @override
  String guildSettingsBanExpires(String date) {
    return '将于 $date 过期';
  }

  @override
  String get guildSettingsBanExpiresLabel => '过期';

  @override
  String get guildSettingsUnban => '解除封禁';

  @override
  String get guildSettingsBansLoading => '正在加载被封禁的用户';

  @override
  String get guildSettingsBansNoSearchResults => '未找到符合您搜索条件的封禁。';

  @override
  String get guildSettingsBanDetailsTitle => '封禁详情';

  @override
  String get guildSettingsBanViewDetails => '查看详情';

  @override
  String get guildSettingsBannedOn => '封禁于';

  @override
  String get guildSettingsBannedBy => '封禁者';

  @override
  String get guildSettingsRevokeBanTitle => '撤销封禁';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return '您确定要撤销对 $displayName 的封禁吗？他们将能够重新加入社区。';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return '已撤销对 $displayName 的封禁';
  }

  @override
  String get guildSettingsBansLoadError => '无法加载封禁。请重试。';

  @override
  String get guildSettingsRevokeBanError => '无法撤销封禁。请重试。';

  @override
  String get guildSettingsCommunitySettings => '社区设置';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewDescription => '管理您的社区资料、频道和默认设置。';

  @override
  String get guildSettingsOverviewBrandingTitle => '品牌';

  @override
  String get guildSettingsOverviewBrandingDescription => '更新您的图标、名称、横幅和邀请背景';

  @override
  String get guildSettingsOverviewBannerUpload => '上传横幅';

  @override
  String get guildSettingsOverviewIdleTitle => '闲置设置';

  @override
  String get guildSettingsOverviewIdleDescription => '配置挂起频道和超时';

  @override
  String get guildSettingsOverviewSystemTitle => '系统与欢迎';

  @override
  String get guildSettingsOverviewSystemDescription => '选择系统和欢迎消息的目的地';

  @override
  String get guildSettingsOverviewNotificationsTitle => '默认通知';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      '超过 250 人的社区将被强制设置为“仅提及”设置。您的原始设置将被保留，并在社区成员少于 250 人时恢复。';

  @override
  String get guildSettingsOverviewAdvancedTitle => '高级设置';

  @override
  String get guildSettingsOverviewFlexibleNames => '允许自定义文本频道名称';

  @override
  String get guildSettingsOverviewHideOwnerCrown => '隐藏社群管理员皇冠';

  @override
  String get guildSettingsOverviewDetachedBanner => '独立横幅';

  @override
  String get guildSettingsOverviewDetachedBannerHint => '在社群标题下方单独显示横幅。';

  @override
  String get guildSettingsOverviewUploadIcon => '上传图标';

  @override
  String get guildSettingsOverviewRemoveImage => '移除';

  @override
  String get guildSettingsOverviewSplashTitle => '邀请背景';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => '聊天嵌入背景';

  @override
  String get guildSettingsOverviewEmbedSplashHint => '显示在聊天中的邀请嵌入中。';

  @override
  String get guildSettingsOverviewUploadBackground => '上传背景';

  @override
  String get guildSettingsOverviewNoCommunityBanner => '无社群横幅';

  @override
  String get guildSettingsOverviewNoInviteBackground => '无邀请背景';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => '预览';

  @override
  String get guildSettingsOverviewInvitePreviewHint => '查看你的邀请对访客的显示效果。';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => '文本频道名称';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => '社群管理员皇冠';

  @override
  String get guildSettingsOverviewOwnerCrownDescription => '配置是否在社群管理员旁边显示皇冠图标';

  @override
  String get guildSettingsSplashCardAlignment => '卡片对齐';

  @override
  String get guildSettingsSplashAlignmentCenter => '居中';

  @override
  String get guildSettingsSplashAlignmentLeft => '左对齐';

  @override
  String get guildSettingsSplashAlignmentRight => '右对齐';

  @override
  String get guildSettingsSplashAlignmentHint => '仅在宽屏上生效。';

  @override
  String get permissionReadMessageHistory => '读取消息历史';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return '更改无“$permission”权限的用户可查看的内容';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return '使用专用弹窗设置无“$permission”权限成员的消息历史记录阈值日期。';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen => '打开消息历史记录阈值设置';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => '消息历史记录阈值';

  @override
  String get guildSettingsMessageHistoryThresholdEnable => '启用消息历史记录阈值';

  @override
  String get guildSettingsMessageHistoryThresholdDate => '阈值日期';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      '无“读取消息历史”权限的成员可查看此日期之后发送的消息。';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated => '消息历史记录阈值已更新';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      '允许文本频道名称包含大写字母和空格。关闭后，名称将仅限于小写字母、连字符和下划线。';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint => '隐藏社群管理员旁边的皇冠图标。';

  @override
  String get guildSettingsAnimatedIconRequiresFeature => '动态图标需要“动态图标”社群功能。';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature => '动态横幅需要“动态横幅”社群功能。';

  @override
  String get guildSettingsAfkChannel => 'AFK / 闲置频道';

  @override
  String get guildSettingsAfkChannelHint => '成员 AFK 时将他们移至此频道。';

  @override
  String get guildSettingsNoAfkChannel => '无 AFK 频道';

  @override
  String get guildSettingsAfkTimeout => 'AFK 超时';

  @override
  String get guildSettingsAfkTimeout1Min => '1 分钟';

  @override
  String get guildSettingsAfkTimeout5Min => '5 分钟';

  @override
  String get guildSettingsAfkTimeout15Min => '15 分钟';

  @override
  String get guildSettingsAfkTimeout30Min => '30 分钟';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 小时';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get guildSettingsSystemChannel => '系统消息频道';

  @override
  String get guildSettingsSystemChannelHint => '欢迎和系统消息将显示在此处。';

  @override
  String get guildSettingsNoSystemChannel => '无系统消息频道';

  @override
  String get guildSettingsHideJoinMessages => '隐藏加入消息';

  @override
  String get guildSettingsHideJoinMessagesHint => '隐藏加入消息，仅在目标频道中显示。';

  @override
  String get guildSettingsDefaultNotifications => '默认通知设置';

  @override
  String get guildSettingsNotificationsAll => '所有消息';

  @override
  String get guildSettingsNotificationsAllDescription => '通知所有消息';

  @override
  String get guildSettingsNotificationsMentions => '仅提及';

  @override
  String get guildSettingsNotificationsMentionsDescription => '仅通知提及';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG、PNG、WebP、AVIF。最大 10MB。最小：960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG、PNG、WebP、AVIF。最大 10MB。最小：960×540px (16:9)。在聊天中的邀请卡片中显示。';

  @override
  String get guildSettingsModerationDescription => '配置验证、内容过滤和不适宜内容设置。';

  @override
  String get guildSettingsModerationDiscoveryNotice => '已在发现中列出的社群具有受限的审核选项。';

  @override
  String get guildSettingsModerationContentFilterTitle => '内容过滤';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      '自动筛查未标记为不适宜内容频道的成员消息。';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      '已在发现中列出的社群必须扫描所有成员。启用发现功能时，此设置无法更改。';

  @override
  String get guildSettingsContentFilterOff => '关闭';

  @override
  String get guildSettingsContentFilterOffDescription => '允许社群自行管理';

  @override
  String get guildSettingsContentFilterNoRole => '过滤无角色成员';

  @override
  String get guildSettingsContentFilterNoRoleDescription => '建议大多数社群使用';

  @override
  String get guildSettingsContentFilterAll => '过滤所有人';

  @override
  String get guildSettingsContentFilterAllDescription => '为家庭友好空间提供最大程度的保护';

  @override
  String get guildSettingsModerationMatureOff => '关闭';

  @override
  String get guildSettingsModerationMatureOn => '开启';

  @override
  String get guildSettingsContentWarningToggle => '显示内容警告';

  @override
  String get guildSettingsContentWarningToggleDescription => '在进入任何频道前，切换同意提示。';

  @override
  String get guildSettingsContentWarningText => '自定义警告文本';

  @override
  String get guildSettingsContentWarningTextPlaceholder => '此内容包含敏感信息。';

  @override
  String get guildSettingsModeration2faTitle => '双重验证要求';

  @override
  String get guildSettingsModeration2faDescription =>
      '要求版主在能够禁言、踢出、暂时禁言或删除消息前进行双重验证。';

  @override
  String get guildSettingsModeration2faSwitchLabel => '要求版主操作进行双重验证';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip => '只有社群所有者可以更改此设置';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      '请先在您的账户上启用双重验证，才能更改此设置';

  @override
  String get guildSettingsEmojiSearchHint => '搜索表情符号';

  @override
  String get guildSettingsEmojiUploadTitle => '上传表情符号';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Emoji slots';

  @override
  String get guildSettingsEmojiDropZone => 'Drag and drop emoji files here';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Failed to load emojis. Try again later.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'No emojis found matching your search.';

  @override
  String get guildSettingsEmojiNoSlots => 'No emoji slots available';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'You\'ve reached the maximum number of emojis. Delete some existing emojis to make room.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emoji names need at least 2 characters and can use letters, numbers, and underscores. Emojis must be under $maxSize. Static images are resized to 128x128 pixels and compressed automatically. Animated emojis and SVGs must already fit the limit.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Uploading emojis';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojis',
      one: '# emoji',
    );
    return 'Uploading $_temp0. This may take a little while.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Failed to upload emojis. Try again.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Some emojis couldn\'t be added';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Review these files and try again with smaller or simpler images.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Rename emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 characters, letters, numbers, underscores.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Name';

  @override
  String get guildSettingsEmojiColumnUploader => 'Uploaded by';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Unknown';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Delete emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Delete :$name:? Can\'t be undone.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Purge this emoji from storage and CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Emoji name must be at least 2 characters long';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Emoji name must be at most 32 characters long';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Invalid emoji name';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Couldn\'t rename this emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'The name was reverted to what it was before. Please try again in a moment.';

  @override
  String get guildSettingsEmojiGoneTitle => 'This emoji no longer exists';

  @override
  String get guildSettingsEmojiGoneBody =>
      'It may have been deleted. The name was reverted to what it was before.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'You can\'t rename this emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'You don\'t have permission to rename this emoji. The name was reverted to what it was before.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'You\'re going too fast';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Please wait a moment and try renaming again.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Couldn\'t delete this emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'You can\'t delete this emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Allow others to clone your emojis';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'When enabled, members of other communities can use the in-app one-click \"Clone\" shortcut on your custom emojis. This does not prevent them from saving the image and uploading it themselves.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Allow others to clone your stickers';

  @override
  String get guildSettingsCloneStickerDescription =>
      'When enabled, members of other communities can use the in-app one-click \"Clone\" shortcut on your custom stickers. This does not prevent them from saving the image and uploading it themselves.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Only members with the \"$permission\" permission can change this.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Couldn\'t update emoji cloning';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Couldn\'t update sticker cloning';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return '静态表情符号 ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return '动态表情符号 ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => '搜索贴纸';

  @override
  String get guildSettingsStickerSlotsTitle => 'Sticker slots';

  @override
  String get guildSettingsStickerUploadTitle => 'Upload sticker';

  @override
  String get guildSettingsStickerDropZone =>
      'Drag and drop a sticker file here (one at a time)';

  @override
  String get guildSettingsStickerDensity => 'Sticker density';

  @override
  String get guildSettingsStickerDensityCozy => 'Cozy';

  @override
  String get guildSettingsStickerDensityCompact => 'Compact';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'Failed to load stickers';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'There was an error loading the stickers. Try again.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'No stickers found matching your search.';

  @override
  String get guildSettingsStickersEmptySearch => 'No stickers found';

  @override
  String get guildSettingsStickerNoSlots => 'No sticker slots available';

  @override
  String get guildSettingsStickerSlotsFull =>
      'You\'ve reached the maximum number of stickers. Delete some existing stickers to make room.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Stickers are saved at 320x320 pixels and must be under $maxSize. Static images are resized and compressed automatically. Animated stickers and SVGs must already fit the limit.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => 'Unsupported sticker file';

  @override
  String get guildSettingsStickerAddTitle => 'Add sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Edit sticker';

  @override
  String get guildSettingsStickerNameLabel => 'Name';

  @override
  String get guildSettingsStickerNameHint => 'My awesome sticker';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Description';

  @override
  String get guildSettingsStickerDescriptionHint => 'Describe the sticker';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tags ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Add a tag';

  @override
  String get guildSettingsStickerTagAdd => 'Add';

  @override
  String get guildSettingsStickerNameRequired => 'Name is required';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Name must be at least 2 characters';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Name must be 30 characters or less';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Description must be 500 characters or less';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Couldn\'t create this sticker';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Sticker is too large';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Sticker couldn\'t be compressed enough';

  @override
  String get guildSettingsStickerDeleteTitle => 'Delete sticker';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Delete \"$name\"? Can\'t be undone.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Purge this sticker from storage and CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Couldn\'t delete this sticker';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'You can\'t delete this sticker';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return '从频道设置创建 webhook。在此处编辑。';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      '除非至少有一个频道对所有人可见，否则您的自定义 URL 将无法正常工作。';

  @override
  String get guildSettingsVanityUrlRemove => '移除';

  @override
  String get guildSettingsBannedUsersTitle => '被封禁用户';

  @override
  String get guildSettingsInvitesTableInviter => '邀请者';

  @override
  String get guildSettingsInvitesTableChannel => '频道';

  @override
  String get guildSettingsInvitesTableCode => '代码';

  @override
  String get guildSettingsInvitesTableUses => '使用次数';

  @override
  String get guildSettingsInvitesTableCreated => '创建时间';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => '按用户筛选';

  @override
  String get guildSettingsAuditLogFilterAction => '按操作筛选';

  @override
  String get createDm => 'Create DM';

  @override
  String get createGroupDm => 'Create group DM';

  @override
  String get createDmNewMessage => 'New message';

  @override
  String get createDmSelectFriends => 'Select friends';

  @override
  String get createDmChooseFriendsSubtitle => 'Choose friends to message.';

  @override
  String get createDmSearchFriends => 'Search friends';

  @override
  String get createDmNoFriendsFound => 'No friends found';

  @override
  String get createDmNoFriendsYet => 'You have no friends yet';

  @override
  String get createDmClaimToStartDms => 'Claim your account to start DMs.';

  @override
  String get createDmVerifyToStartDms => 'Verify your email to start DMs.';

  @override
  String get createDmVerifyYourEmail => 'Verify your email';

  @override
  String get createDmNewGroup => 'New group';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Create a new group with $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Confirm new group';

  @override
  String get createDmCreateNewGroup => 'Create new group';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Remove $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'You already have a group with these users. Do you really want to create a new one? That\'s fine too!';

  @override
  String get createDmNoActivityYet => 'No activity yet';

  @override
  String get createDmSomeUsersCantBeAdded => 'Some users can\'t be added';

  @override
  String get createDmCreateWithoutThem => 'Create without them';

  @override
  String get createDmUnaddableIntro =>
      'The following people can\'t be added to this group DM:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Create the group DM with the remaining $count recipient(s) and skip the others?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'No remaining recipients to create a group DM with.';

  @override
  String get createDmUnaddableUserNotFound => 'User not found';

  @override
  String get createDmUnaddableBlocked => 'You can\'t message this user';

  @override
  String get createDmUnaddableNotFriends => 'Not on your friends list';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Doesn\'t allow being added to group DMs';

  @override
  String get createDmFailed => 'Couldn\'t create the conversation. Try again.';

  @override
  String get dmListMessagesTitle => 'Messages';

  @override
  String get dmListDirectMessagesTitle => 'Direct Messages';

  @override
  String get keybindsSearchShortcuts => 'Search shortcuts';

  @override
  String get keybindSectionDefaults => 'Defaults';

  @override
  String get keybindSectionMessages => 'Messages';

  @override
  String get keybindSectionNavigation => 'Navigation';

  @override
  String get keybindSectionDragAndDrop => 'Drag and drop';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Voice and video';

  @override
  String get keybindSectionMisc => 'Miscellaneous';

  @override
  String get keybindActionShowShortcutsList => 'Show keyboard shortcuts list';

  @override
  String get keybindActionCopyText => 'Copy text';

  @override
  String get keybindActionMarkUnread => 'Mark as unread';

  @override
  String get keybindActionFocusTextarea => 'Focus text area';

  @override
  String get keybindActionSwitchCommunities => 'Switch between communities';

  @override
  String get keybindActionSwitchChannels => 'Switch between channels';

  @override
  String get keybindActionHistoryBack =>
      'Move back through viewed channel history';

  @override
  String get keybindActionHistoryForward =>
      'Move forward through viewed channel history';

  @override
  String get keybindActionJumpUnreadChannels => 'Jump between unread channels';

  @override
  String get keybindActionJumpMentionChannels =>
      'Jump between unread channels with mentions';

  @override
  String get keybindActionJumpCurrentCall => 'Jump to the current call';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Toggle between last community and DMs';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Switch to previous community or DMs';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Switch to next community or DMs';

  @override
  String get keybindActionGoToDms => 'Go to Direct Messages';

  @override
  String get keybindActionGoToFirstCommunity => 'Go to first community';

  @override
  String get keybindActionGoToSecondCommunity => 'Go to second community';

  @override
  String get keybindActionGoToThirdCommunity => 'Go to third community';

  @override
  String get keybindActionGoToFourthCommunity => 'Go to fourth community';

  @override
  String get keybindActionGoToFifthCommunity => 'Go to fifth community';

  @override
  String get keybindActionGoToSixthCommunity => 'Go to sixth community';

  @override
  String get keybindActionGoToSeventhCommunity => 'Go to seventh community';

  @override
  String get keybindActionGoToEighthCommunity => 'Go to eighth community';

  @override
  String get keybindActionToggleQuickSwitcher => 'Toggle quick switcher';

  @override
  String get keybindActionCreateOrJoinCommunity => 'Create or join a community';

  @override
  String get keybindActionStartDragAndDrop => 'Start drag and drop';

  @override
  String get keybindActionMove => 'Move';

  @override
  String get keybindActionDropItem => 'Drop item';

  @override
  String get keybindActionCancel => 'Cancel';

  @override
  String get keybindActionMarkCommunityRead => 'Mark community as read';

  @override
  String get keybindActionMarkChannelRead => 'Mark channel as read';

  @override
  String get keybindActionStartGroupDm => 'Start a group DM';

  @override
  String get keybindActionTogglePinnedMessages => 'Toggle pinned messages';

  @override
  String get keybindActionToggleInbox => 'Toggle the inbox';

  @override
  String get keybindActionMarkTopInboxRead => 'Mark top inbox channel as read';

  @override
  String get keybindActionMarkAllInboxRead => 'Mark all inbox channels as read';

  @override
  String get keybindActionToggleMemberList =>
      'Toggle the member list or voice chat';

  @override
  String get keybindActionToggleEmojiPicker => 'Toggle the emoji picker';

  @override
  String get keybindActionToggleGifPicker => 'Toggle the GIF picker';

  @override
  String get keybindActionToggleStickerPicker => 'Toggle the sticker picker';

  @override
  String get keybindActionScrollChatUp => 'Scroll chat up';

  @override
  String get keybindActionScrollChatDown => 'Scroll chat down';

  @override
  String get keybindActionJumpOldestUnread =>
      'Jump to the oldest unread message';

  @override
  String get keybindActionFocusComposer => 'Focus the text area';

  @override
  String get keybindActionUploadFile => 'Upload a file';

  @override
  String get keybindActionCopyChannelLink => 'Copy channel link';

  @override
  String get keybindActionToggleSavedMedia => 'Toggle saved media';

  @override
  String get keybindActionSendVoiceMessage => 'Send voice message';

  @override
  String get keybindActionAnswerCall => 'Answer the incoming call';

  @override
  String get keybindActionDeclineCall => 'Decline the incoming call';

  @override
  String get keybindActionStartDmCall => 'Start a call in a DM or group';

  @override
  String get keybindActionToggleSoundboard => 'Toggle the soundboard';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expand or collapse compact call view';

  @override
  String get keybindActionPushToTalkPriority => 'Push to talk (priority)';

  @override
  String get keybindActionVoiceActivityPriority => 'Voice activity priority';

  @override
  String get keybindActionOpenHelp => 'Open help';

  @override
  String get keybindActionSearchMessages => 'Search messages';

  @override
  String get keybindActionOpenContextMenu => 'Open the context menu';

  @override
  String get keybindActionOpenSettings => 'Open your settings';

  @override
  String get keybindActionOpenThemeStudio => 'Open theme studio popout';

  @override
  String get keybindActionZoomIn => 'Zoom in';

  @override
  String get keybindActionZoomOut => 'Zoom out';

  @override
  String get keybindActionZoomReset => 'Reset zoom';

  @override
  String get clipboardPasteFailed =>
      'Couldn\'t paste. The clipboard was empty or blocked for this app.';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class FluxerLocalizationsZhHant extends FluxerLocalizationsZh {
  FluxerLocalizationsZhHant() : super('zh_Hant');

  @override
  String get reconnectingTitle => '我們出錯了！';

  @override
  String get reconnectingBody => '伺服器似乎出了點問題。\n應該很快就會修好！';

  @override
  String get gatewayReconnectingToast => '正在重新連線…';

  @override
  String get gatewayConnectedToast => '已連線';

  @override
  String splashStartupFailed(String error) {
    return '啟動失敗：$error';
  }

  @override
  String get retry => '重試';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => '連線中斷';

  @override
  String get splashViewOnStatusPage => '前往狀態頁';

  @override
  String get splashConnectionIssuesPrompt => '連線有問題嗎？';

  @override
  String get splashStatusPageLink => '狀態頁';

  @override
  String get splashReadIncident => '閱讀事件詳情';

  @override
  String get splashIncidentHistory => '事件記錄';

  @override
  String get welcomeBack => '歡迎回來';

  @override
  String get email => '電子郵件';

  @override
  String get emailInvalid => '請輸入有效的電子郵件地址。';

  @override
  String get password => '密碼';

  @override
  String get forgotPassword => '忘記密碼了嗎？';

  @override
  String get logIn => '登入';

  @override
  String get logInWithPasskey => '使用通行金鑰登入';

  @override
  String continueWithSso(String provider) {
    return '透過 $provider 繼續';
  }

  @override
  String get ssoRequired => '必須使用 SSO 才能存取此執行個體。';

  @override
  String get organizationSsoProvider => '使用您組織的單一登入提供者登入。';

  @override
  String get failedToStartSso => '無法啟動 SSO';

  @override
  String get ssoCancelled => 'SSO 登入已取消';

  @override
  String preferSso(String provider) {
    return '偏好使用 SSO？透過 $provider 繼續。';
  }

  @override
  String get logInViaBrowser => '透過瀏覽器登入';

  @override
  String get needAccountPrompt => '需要帳號？ ';

  @override
  String get register => '註冊';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => '請驗證您是人類';

  @override
  String get captchaDescription => '我們需要確認您不是機器人。請完成下方的驗證。';

  @override
  String get captchaSwitchToHcaptcha => '有問題嗎？試試 hCaptcha';

  @override
  String get captchaSwitchToTurnstile => '試試 Turnstile';

  @override
  String get cancel => '取消';

  @override
  String get ipAuthCheckEmail => '檢查您的電子郵件';

  @override
  String ipAuthDescription(String email) {
    return '我們已寄送一封授權此登入的連結到您的電子郵件。請開啟您的收件匣以查看 $email。';
  }

  @override
  String get ipAuthConnectionLost => '連線中斷';

  @override
  String get ipAuthConnectionLostDescription => '等待授權時連線中斷。請再試一次。';

  @override
  String get ipAuthLinkExpired => '登入連結已過期';

  @override
  String get ipAuthLinkExpiredDescription => '此授權連結已過期。請重新登入。';

  @override
  String get ipAuthResendEmail => '重寄電子郵件';

  @override
  String get ipAuthResent => '已重寄';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get back => '上一頁';

  @override
  String get mfaTitle => '雙重要素驗證';

  @override
  String get mfaChooseMethod => '選擇驗證方式';

  @override
  String get mfaMethodTotp => '驗證器應用程式';

  @override
  String get mfaMethodWebauthn => '安全金鑰 / 通行金鑰';

  @override
  String get mfaTotpDescription => '輸入您的驗證器應用程式提供的 6 位數驗證碼或其中一個備份代碼。';

  @override
  String get mfaCodeLabel => '驗證碼';

  @override
  String get mfaTryAnotherMethod => '嘗試其他方式';

  @override
  String get mfaUseSecurityKey => '改用安全金鑰/通行金鑰';

  @override
  String get accountSelectorTitle => '選擇帳號';

  @override
  String get accountSelectorDescription => '選擇帳號以繼續，或新增其他帳號。';

  @override
  String get accountAdd => '新增帳號';

  @override
  String get accountRemove => '移除';

  @override
  String accountRemoveTitle(String username) {
    return '移除 $username';
  }

  @override
  String get accountRemoveDescription => '這將移除此帳號的已儲存的連線。';

  @override
  String get accountRemoveOnlyDescription => '這將移除此裝置上唯一已儲存的帳號。';

  @override
  String get accountExpired => '已過期';

  @override
  String accountSessionExpired(String identifier) {
    return '對 $identifier 的連線已過期。請重新登入。';
  }

  @override
  String get accountManageTitle => '管理帳號';

  @override
  String get accountSwitchFailed => '無法切換帳號。請再試一次。';

  @override
  String get profileTabMenuSwitchAccounts => '切換帳號';

  @override
  String get statusChangeSheetTitle => '設定狀態';

  @override
  String get statusOnlineStatusSection => '上線狀態';

  @override
  String get statusOnline => '上線';

  @override
  String get statusIdle => '閒置';

  @override
  String get statusDnd => '請勿打擾';

  @override
  String get statusInvisible => '隱形';

  @override
  String get statusOffline => '離線';

  @override
  String get statusUntilIChangeIt => '直到我變更為止';

  @override
  String get statusDontClear => '不要清除';

  @override
  String get statusFor10Seconds => '10 秒';

  @override
  String get statusClearAfter10Seconds => '10 秒';

  @override
  String get statusClearAfter15Minutes => '15 分鐘';

  @override
  String get statusClearAfter30Minutes => '30 分鐘';

  @override
  String get statusClearAfter1Hour => '1 小時';

  @override
  String get statusClearAfter3Hours => '3 小時';

  @override
  String get statusClearAfter4Hours => '4 小時';

  @override
  String get statusClearAfter8Hours => '8 小時';

  @override
  String get statusClearAfter24Hours => '24 小時';

  @override
  String get statusClearAfter3Days => '3 天';

  @override
  String get statusDndDescription => '您將不會收到桌面通知';

  @override
  String get statusInvisibleDescription => '您將顯示為離線';

  @override
  String get customStatusSetTitle => '設定自訂狀態';

  @override
  String get customStatusCurrentHint => '自訂狀態';

  @override
  String get customStatusClear => '清除自訂狀態';

  @override
  String get customStatusPlaceholder => '發生什麼事了？';

  @override
  String get customStatusChooseEmoji => '選擇表情符號';

  @override
  String get customStatusClearAfter => '清除時間';

  @override
  String get customStatusSave => '儲存';

  @override
  String get accountActive => '作用中帳號';

  @override
  String get signOut => '登出';

  @override
  String get suspendedPermanentTitle => '帳號永久停權';

  @override
  String get suspendedTemporaryTitle => '帳號停權';

  @override
  String get suspendedPermanentDescription => '您的帳號因違反我們的服務條款已被永久停權。';

  @override
  String get suspendedTemporaryDescription => '您的帳號已被暫時停權。停權期間結束後，您將可以存取您的帳號。';

  @override
  String get suspendedIssuedAt => '生效日期';

  @override
  String get suspendedEndsAt => '結束日期';

  @override
  String get suspendedDuration => '停權期間';

  @override
  String get suspendedPermanent => '永久';

  @override
  String get suspendedReason => '原因';

  @override
  String get suspendedAppealDeadline => '申訴截止日期';

  @override
  String suspendedDeletionWarning(String date) {
    return '您的帳戶預計於 $date 刪除。';
  }

  @override
  String get suspendedRecheck => '檢查更新';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return '請在 $seconds 秒後再試';
  }

  @override
  String get suspendedBackToLogin => '返回登入';

  @override
  String get suspendedAppealTitle => '申訴';

  @override
  String get suspendedAppealHint => '請說明為何應重新考慮您的停權（至少 50 個字元）...';

  @override
  String get suspendedAppealSubmit => '提交申訴';

  @override
  String get suspendedAppealPending => '審核中';

  @override
  String get suspendedAppealAccepted => '申訴已接受';

  @override
  String get suspendedAppealRejected => '申訴已駁回';

  @override
  String get suspendedAppealAcceptedDescription => '您的申訴已獲接受，帳戶已恢復。';

  @override
  String get suspendedSignIn => '登入您的帳戶';

  @override
  String get forgotPasswordTitle => '忘記密碼？';

  @override
  String get forgotPasswordDescription => '請輸入您的電子郵件地址，我們將寄送重設密碼連結給您。';

  @override
  String get forgotPasswordSubmit => '寄送重設連結';

  @override
  String get forgotPasswordSentTitle => '請檢查您的電子郵件';

  @override
  String get forgotPasswordSentDescription =>
      '我們已將重設密碼說明寄至您的電子郵件地址。請檢查您的收件匣並點擊連結以重設密碼。';

  @override
  String get forgotPasswordBackToLogin => '返回登入';

  @override
  String get resetPasswordTitle => '設定新密碼';

  @override
  String get resetPasswordDescription => '請在下方輸入您的新密碼以完成重設程序。';

  @override
  String get resetPasswordNewPassword => '新密碼';

  @override
  String get resetPasswordConfirm => '確認新密碼';

  @override
  String get resetPasswordSubmit => '重設密碼';

  @override
  String get resetPasswordMismatch => '密碼不符。';

  @override
  String get registerTitle => '建立帳戶';

  @override
  String get registerDisplayName => '顯示名稱（選填）';

  @override
  String get registerDisplayNameHint => '大家該如何稱呼您？';

  @override
  String get registerUsername => '使用者名稱（選填）';

  @override
  String get registerUsernameHint => '留空以使用隨機名稱';

  @override
  String get registerUsernameTagHint => '系統將自動加上 4 位數字標籤以確保唯一性';

  @override
  String get registerDateOfBirth => '出生日期';

  @override
  String get registerMonth => '月份';

  @override
  String get registerDay => '日期';

  @override
  String get registerYear => '年份';

  @override
  String get registerConsent => '我同意服務條款與隱私權政策';

  @override
  String get registerConsentPrefix => '我同意';

  @override
  String get registerConsentTerms => '服務條款';

  @override
  String get registerConsentAnd => '與';

  @override
  String get registerConsentPrivacy => '隱私權政策';

  @override
  String get registerConfirmPassword => '確認密碼';

  @override
  String get registerSubmit => '建立帳戶';

  @override
  String get registerHaveAccount => '已經有帳戶了？ ';

  @override
  String get passkeyNoCredentials => '此應用程式找不到任何通行金鑰。請改用電子郵件和密碼登入。';

  @override
  String get passkeyDeviceNotSupported => '此裝置不支援通行金鑰。';

  @override
  String get passkeyDomainNotAssociated => '此應用程式未設定通行金鑰。請改用電子郵件和密碼登入。';

  @override
  String get passkeyTimeout => '通行金鑰驗證逾時。請再試一次。';

  @override
  String get passkeyNotAvailable => '此應用程式無法使用通行金鑰。請改用電子郵件和密碼登入。';

  @override
  String get passkeyFailed => '通行密鑰驗證失敗。請再試一次。';

  @override
  String get errorUnableToCreateAccount => '無法建立帳號。請再試一次。';

  @override
  String get errorUnableToSignIn => '目前無法登入。請再試一次。';

  @override
  String get errorInvalidEmailOrPassword => '電子郵件或密碼無效。';

  @override
  String get errorUnableToSendResetLink => '無法傳送重設連結。請再試一次。';

  @override
  String get errorUnableToResetPassword => '無法重設密碼。請再試一次。';

  @override
  String get embedInviteJoin => '加入社群';

  @override
  String get embedInviteGoTo => '前往社群';

  @override
  String embedInviteOnline(String count) {
    return '$count 人在線上';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count 位成員';
  }

  @override
  String get embedInviteUnknownTitle => '無效的邀請';

  @override
  String get embedInviteUnknownSubtitle => '請嘗試索取新的邀請。';

  @override
  String get embedInviteUnavailable => '邀請無法使用';

  @override
  String get inviteAcceptTitle => '您受邀加入';

  @override
  String get inviteAcceptJoinButton => '加入社群';

  @override
  String get inviteAcceptGoToButton => '前往社群';

  @override
  String get inviteAcceptInvitesPaused => '邀請已暫停';

  @override
  String get inviteAcceptNotFoundTitle => '邀請無效';

  @override
  String get inviteAcceptNotFoundDescription => '此邀請可能已過期或無效。';

  @override
  String get inviteAcceptJoinGroupButton => '加入群組';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return '$inviterName 已邀請您加入群組私訊';
  }

  @override
  String get inviteAcceptSomeone => '某人';

  @override
  String get inviteAcceptEmojiPack => '表情符號包';

  @override
  String get inviteAcceptStickerPack => '貼圖包';

  @override
  String get inviteAcceptInstallEmojiPack => '安裝表情符號包';

  @override
  String get inviteAcceptInstallStickerPack => '安裝貼圖包';

  @override
  String get inviteAcceptPackInstallNote => '接受此邀請將自動安裝套件。';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => '頻道存取遭拒';

  @override
  String get channelAccessDeniedDescription => '您沒有權限存取傳送此訊息的頻道。';

  @override
  String get messageJumpLinkNoAccess => '無權限';

  @override
  String get okay => '好的';

  @override
  String get embedThemeTitle => '已分享的主題';

  @override
  String get embedThemeSubtitle => '此用戶端不支援自訂主題。';

  @override
  String get embedThemeUnavailableButton => '主題無法使用';

  @override
  String get privacySettings => '隱私設定';

  @override
  String get privacyDirectMessages => '私訊';

  @override
  String get privacyDirectMessagesDescription => '允許此社群中的其他成員傳送私訊給您';

  @override
  String get privacyBotDirectMessages => '機器人私訊';

  @override
  String get privacyBotDirectMessagesDescription => '允許此社群的機器人傳送私訊給您';

  @override
  String get privacyMutualDmsDisabled => '社群管理員已停用僅接收此社群中互相為成員的私訊。';

  @override
  String get communityDebug => '社群偵錯';

  @override
  String get copiedToClipboard => '已複製到剪貼簿';

  @override
  String get notificationSettings => '通知設定';

  @override
  String notificationMuteGuild(String guildName) {
    return '將 $guildName 設為靜音';
  }

  @override
  String get notificationMuteDescription => '將社群設為靜音後，除非您被提及，否則將不會顯示未讀指示器和通知';

  @override
  String get notificationCommunitySettings => '社群通知設定';

  @override
  String get notificationAllMessages => '所有訊息';

  @override
  String get notificationOnlyMentions => '僅提及';

  @override
  String get notificationNothing => '無';

  @override
  String get notificationSuppressEveryone => '隱藏 @everyone 和 @here';

  @override
  String get notificationSuppressRoles => '禁止所有角色提及';

  @override
  String get notificationMobilePush => '行動推播通知';

  @override
  String get notificationOverrides => '通知覆寫';

  @override
  String get notificationSelectChannel => '選擇頻道或分類';

  @override
  String get notificationOnlyAtMentions => '僅提及時通知';

  @override
  String get notificationMuteChannel => '靜音頻道';

  @override
  String get notificationUnmuteChannel => '取消靜音頻道';

  @override
  String get notificationNoCategory => '無分類';

  @override
  String get dmMarkAsRead => '標示為已讀';

  @override
  String get dmMuteConversation => '靜音私訊';

  @override
  String get dmUnmuteConversation => '取消靜音私訊';

  @override
  String get dmPinDm => '釘選私訊';

  @override
  String get dmUnpinDm => '取消釘選私訊';

  @override
  String get dmAlwaysShowInSidebar => '一律顯示於側邊欄';

  @override
  String get dmRemoveFromAlwaysShown => '從一律顯示移除';

  @override
  String get dmCloseDm => '關閉私訊';

  @override
  String get dmCloseDmConfirmTitle => '關閉私訊';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '確定要關閉與 $username 的私訊嗎？之後隨時可以重新開啟。';
  }

  @override
  String get dmCopyChannelId => '複製頻道 ID';

  @override
  String get dmChannelIdCopied => '頻道 ID 已複製';

  @override
  String get dmCopyUserId => '複製使用者 ID';

  @override
  String get dmUserIdCopied => '使用者 ID 已複製';

  @override
  String get dmViewProfile => '檢視個人檔案';

  @override
  String get dmVoiceCall => '開始語音通話';

  @override
  String get incomingVoiceCallTitle => '收到語音通話';

  @override
  String get incomingVoiceCallAccept => '接聽';

  @override
  String get incomingVoiceCallDecline => '拒絕';

  @override
  String get incomingVoiceCallLabel => '來電';

  @override
  String get incomingVoiceCallIgnore => '忽略';

  @override
  String get directVoiceCallNotEligible => '目前無法撥打此通話。請稍後再試。';

  @override
  String get voiceJoinCallFailed => '無法連線至此通話。請檢查您的連線並再試一次。';

  @override
  String get voiceJoinIncomingCallFailed => '無法加入此通話。請檢查您的連線並再試一次。';

  @override
  String get incomingVoiceRingingUpdateFailed => '無法更新伺服器上的此通話。請檢查您的連線並再試一次。';

  @override
  String get dmAddNote => '新增備註';

  @override
  String get dmEditGroup => '編輯群組';

  @override
  String get dmInviteToCommunity => '邀請加入社群';

  @override
  String get dmBlock => '封鎖';

  @override
  String get dmLeaveGroup => '離開群組';

  @override
  String get dmNoCommunitiesAvailable => '沒有可用的社群';

  @override
  String dmGroupMemberCount(int count) {
    return '$count 位成員';
  }

  @override
  String get dmMuteFor15Min => '15 分鐘';

  @override
  String get dmMuteFor30Min => '30 分鐘';

  @override
  String get dmMuteFor1Hour => '1 小時';

  @override
  String get dmMuteFor3Hours => '3 小時';

  @override
  String get dmMuteFor4Hours => '4 小時';

  @override
  String get dmMuteFor8Hours => '8 小時';

  @override
  String get dmMuteFor24Hours => '24 小時';

  @override
  String get dmMuteFor3Days => '3 天';

  @override
  String get dmMuteForever => '直到我再次開啟';

  @override
  String get dmPinGroupDm => '釘選群組私訊';

  @override
  String get dmUnpinGroupDm => '取消釘選群組私訊';

  @override
  String get dmFavoriteDm => '收藏私訊';

  @override
  String get dmUnfavoriteDm => '取消收藏私訊';

  @override
  String get dmFavoriteGroupDm => '收藏群組私訊';

  @override
  String get dmUnfavoriteGroupDm => '取消收藏群組私訊';

  @override
  String get dmChangeFriendNickname => '更改朋友暱稱';

  @override
  String get dmRemoveFriend => '移除朋友';

  @override
  String get dmAddFriend => '新增朋友';

  @override
  String get dmAcceptFriendRequest => '接受朋友要求';

  @override
  String get dmIgnoreFriendRequest => '忽略朋友要求';

  @override
  String get dmFriendRequestSent => '朋友要求已送出';

  @override
  String get dmUnblock => '解除封鎖';

  @override
  String get dmDebugUser => '偵錯使用者';

  @override
  String get dmDebugChannel => '偵錯頻道';

  @override
  String get dmPinned => '已釘選私訊';

  @override
  String get dmUnpinned => '已取消釘選私訊';

  @override
  String get dmMuted => '已將私訊設為靜音';

  @override
  String get dmUnmuted => '已取消私訊靜音';

  @override
  String get dmRemoveFriendConfirmTitle => '移除朋友';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return '確定要將 $username 移除為朋友嗎？';
  }

  @override
  String get dmBlockConfirmTitle => '封鎖使用者';

  @override
  String dmBlockConfirmDescription(String username) {
    return '確定要封鎖 $username 嗎？對方將無法傳送訊息或朋友要求給你。';
  }

  @override
  String get dmFriendRequestSentToast => '朋友要求已送出';

  @override
  String get dmFriendRequestFailed => '傳送朋友要求失敗';

  @override
  String get dmAcceptFriendRequestFailed => '接受朋友要求失敗';

  @override
  String get dmRemoveFriendFailed => '移除朋友失敗';

  @override
  String get dmBlockFailed => '封鎖使用者失敗';

  @override
  String get dmUnblockFailed => '解除封鎖使用者失敗';

  @override
  String get dmIgnoreFriendRequestFailed => '忽略朋友要求失敗';

  @override
  String get dmAddFriends => '新增朋友';

  @override
  String get addFriendSheetTitle => '新增朋友';

  @override
  String get addFriendUsernameHint => '使用者名稱#0000';

  @override
  String get addFriendUsernameLabel => '朋友的使用者名稱';

  @override
  String get addFriendSendRequest => '傳送要求';

  @override
  String get addFriendNoUserFound => '找不到具有該使用者名稱的使用者。';

  @override
  String get addFriendInvalidUsername => '請輸入有效的使用者名稱 (使用者名稱#0000)。';

  @override
  String get addFriendOutgoingSuccess => '朋友要求已送出';

  @override
  String get addFriendClaimTitle => '領取您的帳號';

  @override
  String get addFriendClaimDescription => '請領取您的帳號才能傳送朋友要求。';

  @override
  String get addFriendVerifyTitle => '驗證您的電子郵件';

  @override
  String get addFriendVerifyDescription => '您需要驗證您的電子郵件地址，才能傳送朋友要求。';

  @override
  String get addFriendVerifyEmail => '驗證電子郵件';

  @override
  String addFriendIncomingRequests(int count) {
    return '收到的朋友要求 ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return '送出的朋友要求 ($count)';
  }

  @override
  String get addFriendIncomingStatus => '收到的朋友要求';

  @override
  String get addFriendOutgoingStatus => '朋友要求已送出';

  @override
  String get addFriendViewProfile => '檢視個人檔案';

  @override
  String get addFriendAccept => '接受';

  @override
  String get addFriendIgnore => '忽略';

  @override
  String get addFriendAcceptTitle => '接受朋友要求';

  @override
  String get addFriendIgnoreTitle => '忽略好友要求';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '接受來自 $userName 的好友要求嗎？';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '忽略來自 $displayName 的好友要求嗎？';
  }

  @override
  String get addFriendCancelRequest => '取消要求';

  @override
  String get addFriendCancelRequestFailed => '無法取消好友要求。請再試一次。';

  @override
  String get addFriendNotAcceptingRequests => '對方目前不接受好友要求。';

  @override
  String get addFriendUnblockFirst => '請先解除封鎖才能傳送好友要求。';

  @override
  String get addFriendCannotSendToSelf => '您無法傳送好友要求給自己。';

  @override
  String get addFriendAlreadyFriends => '你們已經是好友了。';

  @override
  String get addFriendClaimToSend => '完成註冊即可傳送好友要求。';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => '系統';

  @override
  String get emojiSearchPlaceholder => '尋找你夢寐以求的表情符號';

  @override
  String get emojiSearchEmpty => '沒有表情符號符合您的搜尋。';

  @override
  String get emojiAutocompleteDefaultLabel => '預設表情符號';

  @override
  String get emojiFrequentlyUsed => '常用';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => '媒體';

  @override
  String get emojiTabStickers => '貼圖';

  @override
  String get emojiTabEmojis => '表情符號';

  @override
  String get gifPickerSearch => '搜尋 GIF';

  @override
  String get gifPickerSearchKlipy => '搜尋 KLIPY';

  @override
  String get gifPickerSearchTenor => '搜尋 Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => '我的最愛';

  @override
  String get gifPickerTrending => '熱門 GIF';

  @override
  String get gifPickerNoResultsTitle => '無搜尋結果';

  @override
  String get gifPickerNoResultsDescription => '請嘗試其他搜尋字詞';

  @override
  String get gifPickerLoadFailedTitle => '無法載入 GIF';

  @override
  String get gifPickerLoadFailedBody => '請檢查您的連線並重試。';

  @override
  String get emojiCategoryPeople => '人物';

  @override
  String get emojiCategoryNature => '自然';

  @override
  String get emojiCategoryFood => '食物與飲品';

  @override
  String get emojiCategoryActivity => '活動';

  @override
  String get emojiCategoryTravel => '旅遊與地點';

  @override
  String get emojiCategoryObjects => '物品';

  @override
  String get emojiCategorySymbols => '符號';

  @override
  String get emojiCategoryFlags => '旗幟';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return '使用 Plutonium 解鎖 $communityCount 個社群中的 $emojiCount 個表情符號。';
  }

  @override
  String get emojiPlutoniumUpsellButton => '取得 Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => '不要再顯示此訊息';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個自訂表情符號',
      one: '1 個自訂表情符號',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個社群',
      one: '1 個社群',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => '外部連結警告';

  @override
  String externalLinkWarningLeaving(String productName) {
    return '您即將離開 $productName';
  }

  @override
  String get externalLinkWarningDescription => '外部連結可能很危險。請小心。';

  @override
  String get externalLinkWarningDestinationUrl => '目標網址：';

  @override
  String get externalLinksSectionTitle => '外部連結';

  @override
  String get externalLinksSectionDescription => '設定外部連結警告的處理方式。';

  @override
  String get externalLinkWarningTrustPrefix => '永遠信任 ';

  @override
  String get externalLinkWarningTrustSuffix => ' — 下次略過此警告';

  @override
  String get externalLinkVisitSite => '前往網站';

  @override
  String get externalLinkTrustAllLabel => '信任所有外部連結';

  @override
  String get externalLinkStripTrackingLabel => '從網址移除追蹤參數';

  @override
  String get externalLinkStripTrackingDescription =>
      '自動移除您傳送訊息中網址的追蹤參數（例如 utm_source、fbclid、gclid）。在連結傳送給任何人之前進行清理。';

  @override
  String get externalLinkTrustAllConfirmTitle => '信任所有外部連結？';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      '這將信任所有外部連結並略過所有網域的警告。您現有的信任網域將被取代。這樣較不安全。';

  @override
  String get externalLinkTrustAllConfirmAction => '全部信任';

  @override
  String get externalLinkStopTrustingAllTitle => '停止信任所有連結？';

  @override
  String get externalLinkStopTrustingAllDescription =>
      '將會再次顯示外部連結警告。您需要個別新增信任的網域。';

  @override
  String get externalLinkStopTrustingAllAction => '停用全部信任';

  @override
  String get externalLinkTrustedAllDescription => '所有外部連結皆已信任。將不會顯示警告。';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return '您已信任 $count 個網域。透過在造訪外部連結時勾選方塊來新增更多網域。';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      '啟用時，將不會顯示任何外部連結警告。這樣較不安全。';

  @override
  String get imageFileTooLarge => '圖片檔案過大。請選擇小於 10 MB 的檔案。';

  @override
  String get animatedAvatarsRequirePlutonium => '動態頭像需要 Plutonium';

  @override
  String get animatedBannersRequirePlutonium => '動態橫幅需要 Plutonium';

  @override
  String get animatedAvifNotSupported => '不支援動態 AVIF';

  @override
  String get animatedAvifNotSupportedBody =>
      '目前不支援裁切和旋轉動態 AVIF 檔案。若您繼續，將以原始格式上傳。';

  @override
  String get uploadAsIs => '維持原狀上傳';

  @override
  String get croppingAnimatedNotSupported => '目前不支援裁切動態圖片。將使用原始上傳的檔案。';

  @override
  String get cropAvatar => '裁切頭像';

  @override
  String get cropBanner => '裁切橫幅';

  @override
  String get skip => '略過';

  @override
  String get crop => '裁切';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => '變更您的 使用者名稱';

  @override
  String get fluxerTagInputLabel => '使用者名稱';

  @override
  String get fluxerTagDescriptionBase =>
      '使用者名稱只能包含字母 (a-z, A-Z)、數字 (0-9) 和底線。使用者名稱不區分大小寫。';

  @override
  String get fluxerTagDescriptionVisionary =>
      '使用者名稱只能包含字母 (a-z, A-Z)、數字 (0-9) 和底線。使用者名稱不區分大小寫。您可以選擇 #0000 到 #9999 之間的任何可用 4 位數字標籤。';

  @override
  String get fluxerTagDescriptionPremium =>
      '使用者名稱只能包含字母 (a-z, A-Z)、數字 (0-9) 和底線。使用者名稱不區分大小寫。您可以選擇 #0001 到 #9999 之間的任何可用 4 位數字標籤。';

  @override
  String validationLengthRange(int min, int max) {
    return '介於 $min 到 $max 個字元之間';
  }

  @override
  String get validationAllowedChars => '僅限字母 (a-z, A-Z)、數字 (0-9) 和底線 (_)';

  @override
  String get discriminatorPremiumTooltip =>
      '取得 Plutonium 以自訂您的標籤，或在變更使用者名稱時保留它';

  @override
  String get fluxerTagAlreadyTaken => '使用者名稱 已被佔用';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return '使用者名稱 $username#$discriminator 已被佔用。繼續將會自動重新分配您的標籤。';
  }

  @override
  String get customTagIsTemporary => '自訂標籤是暫時的';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return '您的自訂 4 位數字標籤僅在您的 Plutonium 訂閱有效期間內可用。當您的訂閱於 $date 到期後，您的標籤將在 3 天寬限期後恢復為隨機分配的號碼。';
  }

  @override
  String get customTagTemporaryBody =>
      '您的自訂 4 位數字標籤僅在您的 Plutonium 訂閱有效期間內可用。當您的訂閱到期後，您的標籤將在 3 天寬限期後恢復為隨機分配的號碼。';

  @override
  String get iUnderstandContinue => '我了解，繼續';

  @override
  String get premiumWarningPendingDiscriminator =>
      '如果您儲存此 使用者名稱，您的自訂 4 位數字標籤將在您的 Plutonium 訂閱結束時恢復為隨機號碼。如果您的訂閱未能續訂，您將有 3 天寬限期，之後標籤才會變更。';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return '您的自訂 4 位數字標籤 (#$discriminator) 在您的 Plutonium 訂閱有效期間內有效。如果您的訂閱結束或在 3 天寬限期後未能續訂，您的標籤將恢復為隨機號碼。';
  }

  @override
  String get premiumUpsellCustomizeTag => '自訂您的 4 位數字標籤，或在變更使用者名稱時保留它';

  @override
  String premiumTrialExpiresOn(String date) {
    return '您的 Plutonium 試用將於 $date 到期。升級即可保留您的自訂標籤並在個人資料中獲得徽章。';
  }

  @override
  String get premiumTrialActive =>
      '您目前處於 Plutonium 試用期。升級即可保留您的自訂標籤並在個人資料中獲得徽章。';

  @override
  String get fluxerTagUpdated => '使用者名稱 已更新';

  @override
  String get fluxerTagUpdateFailed => '更新 使用者名稱 失敗。請再試一次。';

  @override
  String get continueAction => '繼續';

  @override
  String get profileCustomizationTitle => '個人資料自訂';

  @override
  String get profileCustomizationDescription => '編輯您的個人資料外觀並預覽';

  @override
  String get usernameLabel => '使用者名稱';

  @override
  String get claimAccountToChangeFluxerTag => '請認領您的帳戶以變更您的 使用者名稱';

  @override
  String get changeFluxerTag => '更改 使用者名稱';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return '使用 Plutonium 自訂您的 4 位數字標籤 (#$discriminator)';
  }

  @override
  String get changeUsernameAndTagHint => '更改您的使用者名稱和 4 位數字標籤';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return '您的自訂標籤 (#$discriminator) 與您的 Plutonium 訂閱綁定，若訂閱過期將會還原為隨機標籤。';
  }

  @override
  String get displayNameLabel => '顯示名稱';

  @override
  String get pronounsLabel => '代名詞';

  @override
  String get avatarLabel => '頭像';

  @override
  String get changeAvatar => '更改頭像';

  @override
  String get removeAvatar => '移除頭像';

  @override
  String get avatarDescription => 'PNG、JPEG、WebP、GIF。上限 10MB。建議：512×512px';

  @override
  String get bannerLabel => '橫幅';

  @override
  String get changeBanner => '更改橫幅';

  @override
  String get removeBanner => '移除橫幅';

  @override
  String get bannerDescription =>
      'PNG、JPEG、WebP、GIF。上限 10MB。最小：960×540px (16:9)';

  @override
  String get accentColorLabel => '強調色';

  @override
  String get accentColorDescription => '自訂個人檔案中的邊框和橫幅顏色';

  @override
  String get aboutMeLabel => '關於我';

  @override
  String get aboutMeHelperText => '您可以使用連結、表情符號和 Markdown。';

  @override
  String get emojiPickerTitle => '表情符號';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium 徽章隱私設定';

  @override
  String get plutoniumBadgePrivacyDescription => '控制他人如何顯示您的 Plutonium 徽章';

  @override
  String get hidePlutoniumBadgeLabel => '完全隱藏 Plutonium 徽章';

  @override
  String get hidePlutoniumBadgeDescription => '完全向其他使用者隱藏您的 Plutonium 徽章';

  @override
  String get hidePlutoniumPurchaseDate => '隱藏 Plutonium 購買日期';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return '隱藏 Plutonium 購買日期 ($date)';
  }

  @override
  String get hidePurchaseDateDescription => '從您的徽章中移除首次購買 Plutonium 的日期';

  @override
  String get maskVisionaryAsSubscription => '將 Visionary 顯示為訂閱';

  @override
  String get maskVisionaryDescription => '將您的 Visionary 顯示為一般訂閱';

  @override
  String get hideVisionaryIdBadge => '隱藏 Visionary ID 徽章';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return '隱藏 Visionary ID 徽章 (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => '移除您的 Visionary ID 徽章';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return '您目前處於 Plutonium 試用期 — 您的訂閱將於 $date 開始';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      '您的試用期結束後，訂閱將自動開始。無需任何操作。';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return '您目前處於 Plutonium 試用期，將於 $date 到期';
  }

  @override
  String get premiumTrialActiveProfile => '您目前處於 Plutonium 試用期';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG、PNG、WebP。上限 10MB。建議：512×512px。動態頭像 (GIF) 需要 Plutonium。';

  @override
  String get bannerPlutoniumUpsell => '使用靜態或動態橫幅圖片自訂您的個人檔案，讓它脫穎而出。';

  @override
  String get getPlutonium => '取得 Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody => '應用程式內購買在此平台尚未開放。敬請期待 — 即將推出！';

  @override
  String get profilePreviewLabel => '預覽';

  @override
  String get profilePreviewMessage => '訊息';

  @override
  String profilePreviewMemberSince(String productName) {
    return '$productName 會員自';
  }

  @override
  String get unclaimedAccountTitle => '未認領帳戶';

  @override
  String get unclaimedAccountDescription =>
      '您的帳戶尚未認領。若沒有電子郵件和密碼，您可能會失去存取權。立即認領您的帳戶以確保其安全。';

  @override
  String get claimAccount => '認領帳戶';

  @override
  String get profileTypeLabel => '個人檔案類型';

  @override
  String get profileTypeGlobal => '全域個人檔案';

  @override
  String get profileTypeGuildDescription =>
      '您正在編輯每社群的個人檔案。此個人檔案僅在此社群中可見，並將覆蓋您的全域個人檔案。';

  @override
  String get communityNicknameLabel => '社群暱稱';

  @override
  String get perGuildPremiumUpsellText =>
      '個人化社群的個人頭像、橫幅、強調色和個人簡介需要 Plutonium。社群暱稱和代名詞對所有人免費。';

  @override
  String get avatarModeInherit => '使用全域個人資料';

  @override
  String get avatarModeCustom => '使用自訂圖片';

  @override
  String get avatarModeUnset => '不顯示';

  @override
  String get profileSavedToast => '個人資料已更新';

  @override
  String get profileEditButton => '編輯個人資料';

  @override
  String get profileNoteLabel => '備註';

  @override
  String get profileNoteVisibility => '(僅您可見)';

  @override
  String get profileNoteEmpty => '尚未新增備註。';

  @override
  String get sudoTitle => '驗證您的身分';

  @override
  String get sudoDescription => '此操作需要驗證才能繼續。';

  @override
  String get sudoAuthenticatorCode => '驗證器代碼';

  @override
  String get sudoMethodPassword => '密碼';

  @override
  String get sudoMethodTotp => '驗證器';

  @override
  String get sudoVerificationFailed => '驗證失敗。請再試一次。';

  @override
  String get securityAccountTitle => '帳號';

  @override
  String get securityAccountDescription => '管理您的電子郵件、密碼和帳號設定';

  @override
  String get securitySectionTitle => '安全性';

  @override
  String get securitySectionDescription => '使用雙重驗證和通行金鑰保護您的帳號';

  @override
  String get securityLoginEmailSectionTitle => '電子郵件設定';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return '管理您用來登入 $productName 的電子郵件地址';
  }

  @override
  String get securityLoginEmailAddressLabel => '電子郵件地址';

  @override
  String get securityLoginNoEmailSet => '尚未設定電子郵件地址';

  @override
  String get securityLoginChangeEmail => '變更電子郵件';

  @override
  String get securityLoginAddEmail => '新增電子郵件';

  @override
  String get securityLoginReveal => '顯示';

  @override
  String get securityLoginHide => '隱藏';

  @override
  String get securityLoginPasswordSectionTitle => '密碼';

  @override
  String get securityLoginPasswordSectionDescription => '變更您的密碼以確保帳號安全';

  @override
  String get securityLoginCurrentPasswordLabel => '目前密碼';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return '上次變更：$date';
  }

  @override
  String get securityLoginPasswordNeverChanged => '上次變更：從未';

  @override
  String get securityLoginNoPasswordSet => '尚未設定密碼';

  @override
  String get securityLoginChangePassword => '變更密碼';

  @override
  String get securityLoginSetPassword => '設定密碼';

  @override
  String get passwordChangeTitle => '變更密碼';

  @override
  String get passwordChangeIntroDescription =>
      '在變更密碼前，我們會將驗證碼傳送至您的電子郵件地址以確認您的身分。';

  @override
  String get passwordChangeStart => '開始';

  @override
  String get passwordChangeVerifyTitle => '驗證您的電子郵件';

  @override
  String get passwordChangeVerifyDescription => '輸入傳送至您電子郵件地址的驗證碼。';

  @override
  String get passwordChangeVerificationCode => '驗證碼';

  @override
  String get passwordChangeVerify => '驗證';

  @override
  String get passwordChangeNewPasswordTitle => '設定新密碼';

  @override
  String get passwordChangeNewPasswordDescription => '在下方輸入您的新密碼。';

  @override
  String get passwordChangeNewPassword => '新密碼';

  @override
  String get passwordChangeConfirmPassword => '確認新密碼';

  @override
  String get passwordChangeSubmit => '變更密碼';

  @override
  String get passwordChangeSuccess => '密碼已變更';

  @override
  String get passwordChangePasswordsDoNotMatch => '密碼不相符';

  @override
  String get passwordChangeInvalidCode => '驗證碼無效或已過期';

  @override
  String get emailChangeTitle => '更改電子郵件';

  @override
  String get emailChangeIntroDescription => '在更改您的電子郵件地址之前，我們會發送驗證碼來驗證您的身份。';

  @override
  String get emailChangeStart => '開始';

  @override
  String get emailChangeVerifyOriginalTitle => '驗證目前電子郵件';

  @override
  String get emailChangeVerifyOriginalDescription => '請輸入已發送到您目前電子郵件地址的驗證碼。';

  @override
  String get emailChangeNewEmailTitle => '輸入新電子郵件';

  @override
  String get emailChangeNewEmailDescription => '請輸入您想使用的電子郵件地址。';

  @override
  String get emailChangeNewEmailLabel => '新電子郵件';

  @override
  String get emailChangeNewEmailSubmit => '發送驗證碼';

  @override
  String get emailChangeVerifyNewTitle => '驗證新電子郵件';

  @override
  String get emailChangeVerifyNewDescription => '請輸入已發送到您新電子郵件地址的驗證碼。';

  @override
  String get emailChangeSuccess => '電子郵件已更改';

  @override
  String get emailChangeInvalidCode => '驗證碼無效或已過期';

  @override
  String get resend => '重寄';

  @override
  String resendCountdown(int seconds) {
    return '重寄 ($seconds秒)';
  }

  @override
  String get verificationCode => '驗證碼';

  @override
  String get verify => '驗證';

  @override
  String get enable => '啟用';

  @override
  String get disable => '停用';

  @override
  String get delete => '刪除';

  @override
  String get save => '儲存';

  @override
  String get securityTfaSectionTitle => '雙重驗證';

  @override
  String get securityTfaSectionDescription => '為您的帳戶增加一層額外的安全性';

  @override
  String get securityTfaAuthenticatorApp => '驗證器應用程式';

  @override
  String get securityTfaAuthenticatorEnabled => '已啟用雙重驗證';

  @override
  String get securityTfaAuthenticatorDisabled => '使用驗證器應用程式產生雙重驗證碼';

  @override
  String get securityTfaBackupCodes => '備份碼';

  @override
  String get securityTfaBackupCodesDescription => '查看並管理您的備份碼以復原帳號';

  @override
  String get securityTfaViewCodes => '查看碼';

  @override
  String get securityPasskeysSectionTitle => '通行金鑰';

  @override
  String get securityPasskeysSectionDescription => '使用通行金鑰進行無密碼登入和雙重驗證';

  @override
  String get securityPasskeysRegistered => '已註冊的通行金鑰';

  @override
  String get securityPasskeysNone => '未註冊任何通行金鑰';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已註冊 # 個通行金鑰',
      one: '已註冊 1 個通行金鑰',
    );
    return '$_temp0 (最多 10 個)';
  }

  @override
  String get securityPasskeysAdd => '新增通行金鑰';

  @override
  String securityPasskeysAdded(String date) {
    return '新增於：$date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return '上次使用：$date';
  }

  @override
  String get securityPasskeysRename => '重新命名';

  @override
  String get securityPasskeysDeleteTitle => '刪除密碼金鑰';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return '確定要刪除密碼金鑰「$name」嗎？';
  }

  @override
  String get securityPasskeyNameTitle => '為密碼金鑰命名';

  @override
  String get securityPasskeyNameLabel => '密碼金鑰名稱';

  @override
  String get securityPasskeyNameHint => '例如：YubiKey、iPhone、工作電腦';

  @override
  String get securityPhoneSectionTitle => '電話號碼';

  @override
  String get securityPhoneSectionDescription => '管理您的電話號碼。';

  @override
  String get securityPhoneLabel => '電話號碼';

  @override
  String get securityPhoneNone => '尚未新增電話號碼。';

  @override
  String get securityPhoneAdd => '新增電話';

  @override
  String get securityPhoneRemove => '移除';

  @override
  String get securityPhoneRemoveTitle => '移除電話號碼';

  @override
  String get securityPhoneRemoveDescription => '確定要移除您的電話號碼嗎？';

  @override
  String get securityPhoneRemoved => '電話號碼已移除';

  @override
  String get securityClaimTitle => '安全功能';

  @override
  String get securityClaimDescription => '領取您的帳號，以存取雙重驗證和通行金鑰等安全功能。';

  @override
  String get securityVerifyEmailRequired =>
      '您必須先驗證您的電子郵件地址，才能設定雙重驗證、通行金鑰或簡訊驗證。';

  @override
  String get totpEnableTitle => '設定驗證器應用程式';

  @override
  String get totpEnableDescription => '使用您的驗證器應用程式掃描 QR code，以產生雙重驗證碼。';

  @override
  String get totpEnableCodeLabel => '驗證碼';

  @override
  String get totpEnableCodeHint => '輸入驗證器應用程式中的 6 位數驗證碼';

  @override
  String get totpEnableSuccess => '已啟用雙重驗證';

  @override
  String get totpDisableTitle => '移除驗證器應用程式';

  @override
  String get totpDisableDescription => '輸入驗證器應用程式中的 6 位數驗證碼，以停用雙重驗證。';

  @override
  String get totpDisableSuccess => '已停用雙重驗證';

  @override
  String get backupCodesTitle => '備份碼';

  @override
  String get backupCodesWarning =>
      '如果您遺失了驗證器應用程式的存取權且沒有這些備份碼，您將永遠無法登入您的帳號。請立即下載或複製這些備份碼，並將它們存放在安全的地方。';

  @override
  String get backupCodesDownload => '下載';

  @override
  String get backupCodesCopy => '複製';

  @override
  String get backupCodesCopied => '備份碼已複製到剪貼簿';

  @override
  String get backupCodesAcknowledge => '我已下載或複製我的備份碼，並將它們存放在安全的地方。';

  @override
  String get backupCodesDone => '完成';

  @override
  String get backupCodesViewTitle => '檢視備份碼';

  @override
  String get backupCodesViewDescription => '在檢視您的備份碼之前，可能需要進行驗證。';

  @override
  String get phoneAddTitle => '新增電話號碼';

  @override
  String get phoneAddLabel => '電話號碼';

  @override
  String get phoneAddHint => '輸入您的電話號碼';

  @override
  String get phoneAddFooter => '輸入您的電話號碼。我們會透過簡訊傳送驗證碼給您。';

  @override
  String get phoneAddSendCode => '傳送驗證碼';

  @override
  String get phoneVerifyTitle => '驗證電話號碼';

  @override
  String get phoneVerifyDescription => '輸入傳送至您電話號碼的驗證碼。';

  @override
  String get phoneAddSuccess => '電話號碼已新增';

  @override
  String get dangerZoneSectionTitle => '危險區域';

  @override
  String get dangerZoneSectionDescription => '無法復原且具破壞性的動作';

  @override
  String get dangerZoneDisableTitle => '停用帳號';

  @override
  String get dangerZoneDisableDescription => '暫時停用您的帳號。之後您可以透過重新登入來重新啟用。';

  @override
  String get dangerZoneDisableConfirmDescription =>
      '停用您的帳號將會登出所有裝置。您可以隨時透過再次登入來重新啟用您的帳號。';

  @override
  String get dangerZoneDeleteTitle => '刪除帳號';

  @override
  String get dangerZoneDeleteDescription => '永久刪除您的帳號及所有相關資料。此動作無法復原。';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      '刪除帳號前，請先在 Plutonium 設定中取消您的 Plutonium 付費方案。';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => '無法刪除帳號';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      '您無法在擁有社群的情況下刪除帳號。請先轉移以下社群的所有權：';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return '及另外 $count 個';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return '若要轉移所有權，請前往 $settingsPath 並使用轉移所有權選項。';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      '確定要刪除您的帳號嗎？此動作將會排定您的帳號進行永久刪除。';

  @override
  String get dangerZoneDeleteBullet1 => '您可以在 14 天內取消刪除程序';

  @override
  String get dangerZoneDeleteBullet2 => '14 天後，您的帳號將會被永久刪除';

  @override
  String get dangerZoneDeleteBullet3 => '刪除程序一旦完成，您將無法復原帳號存取權';

  @override
  String get dangerZoneDeleteBullet4 => '刪除帳號後，您將無法刪除您已傳送的訊息';

  @override
  String get dangerZoneDeleteDisclaimer =>
      '如果您想匯出資料或先刪除您的訊息，請在繼續之前前往使用者設定中的隱私權儀表板。';

  @override
  String get claimAccountTitle => '領取您的帳號';

  @override
  String get claimAccountDescription =>
      '透過新增電子郵件和密碼來領取您的帳號。我們將傳送驗證碼以確認您的電子郵件，然後完成設定。';

  @override
  String get claimAccountEmailLabel => '電子郵件';

  @override
  String get claimAccountPasswordLabel => '密碼';

  @override
  String get claimAccountSendCode => '傳送驗證碼';

  @override
  String get claimAccountVerifyDescription =>
      '輸入我們寄到你電子郵件的驗證碼以進行驗證。驗證碼確認後，你將可以設定密碼。';

  @override
  String get claimAccountSuccess => '帳號已成功領取';

  @override
  String get importantInformation => '重要資訊：';

  @override
  String get genericError => '發生錯誤';

  @override
  String get invalidCode => '無效的驗證碼';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count年前',
      one: '1年前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個月前',
      one: '1個月前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count天前',
      one: '1天前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count小時前',
      one: '1小時前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分鐘前',
      one: '1分鐘前',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => '剛剛';

  @override
  String get authorizedAppsTitle => '已授權的應用程式';

  @override
  String authorizedAppsDescription(String productName) {
    return '這些應用程式已被授權存取你的 $productName 帳號。';
  }

  @override
  String get authorizedAppsEmptyTitle => '沒有已授權的應用程式';

  @override
  String get authorizedAppsEmptyDescription => '你尚未授權任何應用程式存取你的帳號。';

  @override
  String get authorizedAppsLoadError => '無法載入已授權的應用程式';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return '於 $date 授權';
  }

  @override
  String get authorizedAppsPermissionsGranted => '已授權的權限';

  @override
  String get authorizedAppsRevoke => '撤銷';

  @override
  String get authorizedAppsRevokeTitle => '撤銷應用程式存取權';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return '確定要撤銷 $appName 的存取權嗎？此應用程式將無法再存取你的帳號。';
  }

  @override
  String get authorizedAppsScopeIdentify => '存取你的基本個人資料資訊（使用者名稱、頭像等）';

  @override
  String get authorizedAppsScopeEmail => '檢視你的電子郵件地址';

  @override
  String get authorizedAppsScopeGuilds => '檢視你所屬的社群';

  @override
  String get authorizedAppsScopeConnections => '檢視你已連結的帳號';

  @override
  String get authorizedAppsScopeBot => '以要求的權限將機器人新增至社群';

  @override
  String get authorizedAppsScopeAdmin => '存取管理員端點';

  @override
  String get privacyPendingDeletionTitle => '待刪除';

  @override
  String get blockedUsersTitle => '已封鎖的使用者';

  @override
  String get blockedUsersDescription => '被封鎖的使用者無法傳送好友邀請或直接傳訊給你。';

  @override
  String get blockedUsersEmptyTitle => '沒有已封鎖的使用者';

  @override
  String get blockedUsersEmptyDescription => '你尚未封鎖任何人。';

  @override
  String get blockedUsersLoadError => '無法載入已封鎖的使用者';

  @override
  String get blockedUsersUnblock => '解除封鎖';

  @override
  String get blockedUsersUnblockTitle => '解除封鎖使用者';

  @override
  String blockedUsersUnblockDescription(String username) {
    return '確定要解除封鎖 $username 嗎？';
  }

  @override
  String get blockedUsersCopyTag => '複製 使用者名稱';

  @override
  String get blockedUsersCopyId => '複製使用者 ID';

  @override
  String get userProfileLoadError => '無法載入個人資料';

  @override
  String get userProfileRetry => '重試';

  @override
  String get userProfileMessage => '傳訊';

  @override
  String get userProfileVoiceCall => '語音通話';

  @override
  String get userProfileVideoCall => '視訊通話';

  @override
  String get userProfileEditProfile => '編輯個人資料';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName 團隊成員';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName 社群團隊';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName 合作夥伴';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName 蟲蟲獵人';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return '$productName Plutonium';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Plutonium 訂閱者自 $date 起';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return '$productName Visionary';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Visionary 自 $date 起';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return '共同好友 ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return '共同社群 ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => '共同好友';

  @override
  String get userProfileMutualCommunitiesTitle => '共同社群';

  @override
  String get userProfileNoMutualFriends => '找不到共同好友。';

  @override
  String get userProfileNoMutualCommunities => '找不到共同社群。';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return '暱稱：$nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => '開啟私訊';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return '你已封鎖 $username。除非解除封鎖，否則你無法傳送訊息。';
  }

  @override
  String get blockedUserComposerBarrierAction => '解除封鎖';

  @override
  String get userProfileOpenDm => '開啟私訊';

  @override
  String get userProfileNoteTitle => '備註';

  @override
  String get userProfileNoteVisibility => '（僅你可見）';

  @override
  String get userProfileNoteSave => '儲存';

  @override
  String get userProfileNoteDelete => '刪除';

  @override
  String get userProfileNoteEmpty => '點擊新增備註';

  @override
  String get userProfileMemberSince => '成為會員以來';

  @override
  String get userProfileAboutMe => '關於我';

  @override
  String get userProfileCopyUsername => '複製使用者名稱';

  @override
  String get userProfileCopyUserId => '複製使用者 ID';

  @override
  String get userProfileViewMainProfile => '檢視主要個人檔案';

  @override
  String get userProfileViewCommunityProfile => '檢視社群個人檔案';

  @override
  String get userProfileBlockUser => '封鎖使用者';

  @override
  String get userProfileUnblockUser => '解除封鎖使用者';

  @override
  String get userProfileRemoveFriend => '移除好友';

  @override
  String get userProfileBlockConfirmTitle => '封鎖使用者';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return '確定要封鎖 $username 嗎？';
  }

  @override
  String get userProfileUnblockConfirmTitle => '解除封鎖使用者';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return '確定要解除封鎖 $username 嗎？';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => '移除好友';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return '確定要將 $username 移除好友嗎？';
  }

  @override
  String get userProfileFailedOpenDm => '無法開啟私訊';

  @override
  String get userProfileFailedSaveNote => '無法儲存備註';

  @override
  String get userProfileActionFailed => '動作失敗，請再試一次';

  @override
  String get userProfileChangeNickname => '更改暱稱';

  @override
  String get userProfileKick => '踢出';

  @override
  String get userProfileBan => '封鎖';

  @override
  String get userProfileTimeout => '暫停發言';

  @override
  String get userProfileRemoveTimeout => '移除暫停發言';

  @override
  String get userProfileTransferOwnership => '轉移所有權';

  @override
  String get userProfileReportUser => '檢舉使用者';

  @override
  String get userProfileReportMessage => '檢舉訊息';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '踢出 $username？';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return '確定要踢出 $username 嗎？他們可以透過新的邀請重新加入。';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => '移除禁言？';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return '移除禁言後，$username 將能再次傳送訊息、回應和加入語音頻道。';
  }

  @override
  String get userProfileTransferConfirmTitle => '轉移擁有權？';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return '將此社群的擁有權轉移給 $username？此操作無法復原，您將失去所有擁有者權限。';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '封鎖 $username';
  }

  @override
  String get userProfileBanDurationLabel => '封鎖期間';

  @override
  String get userProfileBanCustomSecondsLabel => '自訂期間（秒）';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return '任何介於 $min 到 $max 秒之間的數值';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => '刪除訊息紀錄';

  @override
  String get userProfileBanDeleteNone => '不刪除任何訊息';

  @override
  String get userProfileBanDelete24h => '過去 24 小時';

  @override
  String get userProfileBanDelete7d => '過去 7 天';

  @override
  String get userProfileBanReasonLabel => '原因（選填）';

  @override
  String get userProfileBanReasonHint => '輸入封鎖原因';

  @override
  String get userProfileBanSubmit => '封鎖成員';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '禁言 $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => '禁言期間';

  @override
  String get userProfileTimeoutSubmit => '禁言成員';

  @override
  String get userProfileNicknameLabel => '暱稱';

  @override
  String get userProfileNicknameHint => '輸入暱稱';

  @override
  String get userProfileNicknameSave => '儲存';

  @override
  String userProfileKickSuccess(String username) {
    return '$username 已被踢出';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username 已被封鎖';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username 已被禁言';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return '已移除 $username 的禁言';
  }

  @override
  String get userProfileNicknameSuccess => '暱稱已更新';

  @override
  String get userProfileTransferSuccess => '擁有權已轉移';

  @override
  String get durationPermanent => '永久';

  @override
  String get duration60Seconds => '60 秒';

  @override
  String get duration5Minutes => '5 分鐘';

  @override
  String get duration10Minutes => '10 分鐘';

  @override
  String get duration1Hour => '1 小時';

  @override
  String get duration12Hours => '12 小時';

  @override
  String get duration1Day => '1 天';

  @override
  String get duration3Days => '3 天';

  @override
  String get duration5Days => '5 天';

  @override
  String get duration1Week => '1 週';

  @override
  String get duration2Weeks => '2 週';

  @override
  String get duration1Month => '1 個月';

  @override
  String get durationCustom => '自訂...';

  @override
  String get iarReportUserTitle => '檢舉使用者';

  @override
  String get iarReasonInappropriateProfile => '不當個人檔案';

  @override
  String get iarReasonInappropriateProfileDescription => '此使用者的個人檔案包含不當內容';

  @override
  String typingIndicatorOne(String name) {
    return '$name 正在輸入...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 和 $name2 正在輸入...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1、$name2 和 $name3 正在輸入...';
  }

  @override
  String get typingIndicatorMultiple => '多人正在輸入...';

  @override
  String get typingIndicatorHandful => '一群鍵盤戰士正在集結...';

  @override
  String get typingIndicatorSymphony => '一場按鍵交響樂正在上演...';

  @override
  String get typingIndicatorFiesta => '這裡正展開一場熱鬧的輸入派對';

  @override
  String get typingIndicatorApocalypse => '哇，這是一場打字末日';

  @override
  String systemJoinGladYoureHere(String username) {
    return '很高興你來了，$username！';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return '歡迎你，$username！請自在些。';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return '哈囉，$username！很高興你來到這裡。';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return '哈囉，$username！隨時都可以加入對話。';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return '嘿 $username，很高興在這裡見到你！';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return '嘿，$username！希望你在此一切愉快。';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return '嘿，$username，歡迎加入！';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return '很高興你來了，$username！';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return '歡迎加入，$username！';
  }

  @override
  String systemJoinWelcome(String username) {
    return '歡迎，$username！';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return '歡迎，$username！我們很高興你來了。';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return '歡迎，$username！希望你在此過得愉快。';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return '歡迎，$username！你的下一段對話從這裡開始。';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return '歡迎，$username。我們很高興你來了。';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return '很高興見到你，$username！歡迎加入。';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return '你來了，$username！很高興有你加入我們。';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return '你來了，$username！我們開始吧。';
  }

  @override
  String get relativeTimeShortNow => '剛才';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分',
      one: '1分',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count小時',
      one: '1小時',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count天',
      one: '1天',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個月',
      one: '1個月',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count年',
      one: '1年',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => '我的裝置';

  @override
  String get linkedDevicesDescription => '查看目前登入您帳戶的所有裝置。撤銷任何您不認識的連線。';

  @override
  String get linkedDevicesCurrentDevice => '目前裝置';

  @override
  String get linkedDevicesOtherDevices => '其他裝置';

  @override
  String get linkedDevicesEnterSelection => '進入選取模式';

  @override
  String get linkedDevicesExitSelection => '退出選取模式';

  @override
  String get linkedDevicesSelectAll => '全選';

  @override
  String get linkedDevicesClearSelection => '清除選取';

  @override
  String get linkedDevicesRevokeTooltip => '撤銷裝置';

  @override
  String get linkedDevicesSignOutAll => '登出所有其他裝置';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '登出 $count 個裝置',
      one: '登出 1 個裝置',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '登出 $count 個裝置',
      one: '登出 1 個裝置',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => '登出所有其他裝置';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '這將會登出您帳戶中的選定裝置。您需要在那些裝置上重新登入。',
      one: '這將會登出您帳戶中的選定裝置。您需要在該裝置上重新登入。',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      '這將會登出您帳戶中的選定裝置。您需要在那些裝置上重新登入。';

  @override
  String get linkedDevicesSignOutConfirm => '繼續';

  @override
  String get linkedDevicesLogoutDisclaimer => '您必須在所有已登出的裝置上重新登入';

  @override
  String get linkedDevicesLoadErrorTitle => '網路錯誤';

  @override
  String get linkedDevicesLoadErrorDescription =>
      '我們遇到連線問題，無法存取時空連續體。請檢查您的連線並再試一次。';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '裝置已撤銷',
      one: '裝置已撤銷',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => '無法登出。請再試一次。';

  @override
  String get linkedDevicesUnknownOs => '不明的作業系統';

  @override
  String get linkedDevicesUnknownPlatform => '不明的平台';

  @override
  String slowmodeLabel(String duration) {
    return '$duration 慢速模式';
  }

  @override
  String get slowmodeTooltipActive => '您目前處於慢速模式。請稍後再傳送訊息。';

  @override
  String get slowmodeTooltipImmune => '慢速模式已啟用，但您不受影響。';

  @override
  String get channelNoSendPermissionHint => '您無法在此頻道中傳送訊息。';

  @override
  String systemDmComposerBarrier(String productName) {
    return '$productName 員工的系統公告。您無法在此回覆。';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled => '此社群的訊息傳送已暫停。';

  @override
  String get channelComposerBarrierTimedOut =>
      '您已被暫時禁止發言。訊息、表情符號回應和語音功能將暫停，直到禁言時間結束。';

  @override
  String get channelComposerBarrierUnclaimedAccount => '您需要領取您的帳號才能在此社群中傳送訊息。';

  @override
  String get channelComposerBarrierUnverifiedEmail => '您需要驗證您的電子郵件才能在此社群中傳送訊息。';

  @override
  String get channelComposerBarrierAccountTooNew => '您的帳號太新，無法在此社群中傳送訊息。';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      '您加入此社群的時間不夠長，無法傳送訊息。';

  @override
  String get channelComposerBarrierNoPhoneNumber => '您需要驗證手機號碼才能在此社群中傳送訊息。';

  @override
  String get channelComposerBarrierVerifyEmail => '驗證電子郵件';

  @override
  String get channelComposerBarrierVerifyPhone => '驗證手機';

  @override
  String chatAttachmentTooMany(int max) {
    return '附件太多（最多 $max 個）';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName 超過大小限制 ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge => '這些檔案太大，無法一起傳送';

  @override
  String get chatAttachmentDropToUpload => '拖曳檔案以上傳';

  @override
  String get chatAttachmentDropToSend => '拖曳檔案立即傳送';

  @override
  String get chatAttachmentSendVoiceMessage => '傳送語音訊息';

  @override
  String get voiceMessageTitle => '語音訊息';

  @override
  String get voiceMessageHoldHint => '按住以錄製。向上拖曳以鎖定，或放開以傳送。';

  @override
  String get voiceMessageDiscard => '捨棄語音訊息';

  @override
  String get voiceMessageSend => '傳送語音訊息';

  @override
  String get voiceMessageMicPermissionDenied => '無法開始錄製。請允許麥克風存取權。';

  @override
  String get voiceMessageRecordingNotSupported => '此裝置不支援語音錄製。';

  @override
  String get voiceMessageMicInUse => '請離開語音通話才能錄製語音訊息。';

  @override
  String get voiceMessageRecordingFailed => '錄製失敗。請再試一次。';

  @override
  String get voiceMessageSendFailed => '無法傳送語音訊息。請再試一次。';

  @override
  String get voiceMessageRecordingHint => '請開始說話。完成後請按停止 — 您之後可以進行修剪。';

  @override
  String get voiceMessageReviewHint => '拖曳控點進行修剪，然後按傳送。';

  @override
  String get voiceMessageStop => '停止';

  @override
  String get voiceMessageStartRecording => '開始錄製';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => '播放';

  @override
  String get voiceMessagePause => '暫停';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return '選取內容必須至少為 $secondsString 秒。';
  }

  @override
  String get chatAttachmentEditTitle => '編輯附件';

  @override
  String get chatAttachmentFilenameLabel => '檔案名稱';

  @override
  String get chatAttachmentDescriptionLabel => '說明';

  @override
  String get chatAttachmentDescriptionHint => '選用的替代文字';

  @override
  String get chatAttachmentSpoilerLabel => '標示為劇透';

  @override
  String get chatAttachmentRemove => '移除附件';

  @override
  String get chatAttachmentDownload => '下載';

  @override
  String get chatAttachmentExpiredTooltip => '附件已過期';

  @override
  String get chatAttachmentSourceGallery => '相簿';

  @override
  String get chatAttachmentSourceCamera => '相機';

  @override
  String get chatAttachmentSourceBrowse => '瀏覽檔案';

  @override
  String get chatAttachmentPasteTooltip => '從剪貼簿貼上圖片';

  @override
  String get chatAttachmentSpoiler => '劇透';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => '顯示劇透';

  @override
  String get matureMediaRevealButton => '顯示';

  @override
  String get matureMediaRevealHint => '點擊以顯示';

  @override
  String get matureContentTitle => '成人內容';

  @override
  String get matureCommunityTitle => '成熟社群';

  @override
  String get matureCategoryTitle => '成熟分類';

  @override
  String get matureChannelTitle => '成熟頻道';

  @override
  String get communityContentWarningTitle => '社群內容警告';

  @override
  String get categoryContentWarningTitle => '分類內容警告';

  @override
  String get channelContentWarningTitle => '頻道內容警告';

  @override
  String get defaultContentWarningBody => '此內容包含敏感資訊。';

  @override
  String get matureCommunityBody => '此社群已標記為包含成人內容，可能包含對某些使用者不適宜的素材。';

  @override
  String get matureCategoryBody => '此分類已標記為包含成人內容，可能包含對某些使用者不適宜的素材。';

  @override
  String get matureChannelBody => '此頻道已標記為包含成人內容，可能包含對某些使用者不適宜的素材。';

  @override
  String get matureVoiceChannelBody => '此語音頻道已標記為包含成人內容，可能包含對某些使用者不適宜的素材。';

  @override
  String get matureLinkChannelBody => '此連結頻道已標記為包含成人內容，可能會開啟對某些使用者不適宜的素材。';

  @override
  String get matureCommunityUnavailableBody => '您的帳號無法存取此成熟社群。';

  @override
  String get matureCategoryUnavailableBody => '您的帳號無法存取此成熟分類。';

  @override
  String get matureChannelUnavailableBody => '您的帳號無法存取此成熟頻道。';

  @override
  String get matureContentProceedButton => '繼續';

  @override
  String get matureContentUnderstandButton => '我了解';

  @override
  String get matureContentOpenLinkButton => '開啟連結';

  @override
  String get sensitiveContentSectionTitle => '敏感內容';

  @override
  String get sensitiveContentSectionDescription => '控制在不同情境下如何篩選成人或敏感媒體';

  @override
  String get sensitiveContentFriendDmLabel => '朋友的私訊';

  @override
  String get sensitiveContentNonFriendDmLabel => '其他人的私訊';

  @override
  String get sensitiveContentGuildLabel => '社群頻道的訊息';

  @override
  String get sensitiveContentFilterShow => '顯示';

  @override
  String get sensitiveContentFilterBlur => '模糊';

  @override
  String get sensitiveContentFilterBlock => '封鎖';

  @override
  String get sensitiveContentBlurUnscannedLabel => '掃描完成前模糊媒體';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      '啟用後，圖片和影片將會模糊處理，直到內容安全掃描完成。';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor => '此設定對您的帳號一律保持啟用。';

  @override
  String get sensitiveContentResetButton => '重設';

  @override
  String get sensitiveContentSaveButton => '儲存';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個檔案',
      one: '1 個檔案',
    );
    return '正在上傳 $_temp0';
  }

  @override
  String get chatCancelUpload => '取消上傳';

  @override
  String chatAttachmentExpiresOn(String date) {
    return '將於 $date 到期';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return '將於 $start 和 $end 之間到期';
  }

  @override
  String get connectionsTitle => '連線';

  @override
  String connectionsDescription(String productName) {
    return '連結外部帳號和網域至您的 $productName 個人檔案。已驗證的連線將顯示在您的個人檔案上供他人查看。';
  }

  @override
  String get connectionsEmptyTitle => '尚未有連線';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      '連結您的 Bluesky 帳號或驗證網域所有權，即可在您的個人檔案上顯示。';

  @override
  String get connectionsEmptyDescriptionDomainOnly => '驗證網域所有權，即可在您的個人檔案上顯示。';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => '網域';

  @override
  String get connectionsAddBlueskyAriaLabel => '新增 Bluesky 連線';

  @override
  String get connectionsAddDomainAriaLabel => '新增網域連線';

  @override
  String get connectionEdit => '編輯';

  @override
  String get connectionRemove => '移除';

  @override
  String get connectionVerifiedLabel => '此連線已驗證。';

  @override
  String get connectionUnverifiedLabel => '此連線尚未驗證。';

  @override
  String get connectionAddTitle => '新增連線';

  @override
  String get connectionTypeLabel => '連線類型';

  @override
  String get connectionHandleLabel => '帳號名稱';

  @override
  String get connectionDomainLabel => '網域';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => '您已擁有此連線。';

  @override
  String get connectionConnectBluesky => '透過 Bluesky 連線';

  @override
  String get connectionContinue => '繼續';

  @override
  String get connectionVerifyTitle => '驗證連線';

  @override
  String get connectionVerifyInstructions => '使用下方的紀錄來證明網域擁有權。';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT 紀錄';

  @override
  String get connectionDnsHostLabel => '主機';

  @override
  String get connectionDnsValueLabel => '值';

  @override
  String get connectionCopyHost => '複製主機';

  @override
  String get connectionCopyValue => '複製值';

  @override
  String get connectionCopied => '已複製！';

  @override
  String get connectionTokenFileTitle => '提供權杖檔案';

  @override
  String get connectionTokenFileDescription =>
      '下載 **fluxer-verification** 並將其放置在您的 **.well-known** 資料夾中，以便我們驗證網域。';

  @override
  String get connectionTokenFileDownload => '下載 fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return '檔案包含我們將從 **$dnsUrl** 擷取的驗證權杖。';
  }

  @override
  String get connectionSaveTokenDialogTitle => '儲存 fluxer-verification';

  @override
  String get connectionVerifyButton => '驗證';

  @override
  String get connectionBack => '上一頁';

  @override
  String get connectionEditTitle => '編輯連線';

  @override
  String get connectionEditDescription => '選擇誰可以在您的個人檔案中看到此連線。';

  @override
  String get connectionVisibilityEveryone => '所有人';

  @override
  String get connectionVisibilityEveryoneDesc => '允許任何人查看您個人檔案中的此連線';

  @override
  String get connectionVisibilityFriends => '朋友';

  @override
  String get connectionVisibilityFriendsDesc => '允許您的朋友查看此連線';

  @override
  String get connectionVisibilityCommunityMembers => '社群成員';

  @override
  String get connectionVisibilityCommunityMembersDesc => '允許您所屬社群的成員查看此連線';

  @override
  String get connectionRemoveTitle => '移除連線';

  @override
  String get connectionRemoveDescription => '確定要移除此連線嗎？此動作無法復原。';

  @override
  String get connectionRemoveConfirm => '移除';

  @override
  String get connectionsLoadError => '無法載入連線';

  @override
  String get connectionsReorderError => '無法更新順序';

  @override
  String get connectionInitiateFailed => '無法開始驗證。請再試一次。';

  @override
  String get connectionVerifyFailed => '無法驗證。請檢查您的 DNS 紀錄並再試一次。';

  @override
  String get connectionBlueskyAuthorizeFailed => '無法開始 Bluesky 授權。';

  @override
  String get connectionUpdateFailed => '無法更新連線';

  @override
  String get connectionRemoveFailed => '無法移除連線';

  @override
  String get connectionTokenSavedToast => '已儲存 fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => '無法儲存檔案';

  @override
  String get connectionEnterHandle => '請輸入 Bluesky 帳號名稱。';

  @override
  String get connectionEnterDomain => '請輸入網域。';

  @override
  String get lookAndFeelTitle => '外觀';

  @override
  String get lookAndFeelThemeSectionTitle => '佈景主題';

  @override
  String get lookAndFeelThemeSectionDescription => '在深色、煤炭黑或淺色外觀之間選擇。';

  @override
  String get lookAndFeelThemeDark => '深色佈景主題';

  @override
  String get lookAndFeelThemeCoal => '煤炭黑佈景主題';

  @override
  String get lookAndFeelThemeLight => '淺色佈景主題';

  @override
  String get lookAndFeelThemeSystem => '系統佈景主題';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel => '跨裝置同步佈景主題';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      '啟用後，主題變更將同步到您的所有裝置。停用後，此裝置將使用自己的佈景主題設定。';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      '系統主題會自動停用同步，以追蹤此裝置上的系統偏好設定。';

  @override
  String get lookAndFeelThemeSyncFailed => '無法將佈景主題同步到您的帳戶。請再試一次。';

  @override
  String get lookAndFeelChatFontScalingTitle => '聊天字體縮放';

  @override
  String get lookAndFeelChatFontScalingDescription => '調整聊天區域的字體大小。';

  @override
  String get lookAndFeelInterfaceTitle => '介面';

  @override
  String get lookAndFeelInterfaceDescription => '自訂介面元素和行為。';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle => '頻道列表輸入指示器';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      '選擇當有人在頻道中輸入時，輸入指示器如何在頻道列表中顯示。';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName => '輸入指示器 + 個人頭像';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      '在頻道列表中顯示帶有使用者個人頭像的輸入指示器';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => '僅輸入指示器';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      '僅顯示輸入指示器，不顯示個人頭像';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => '隱藏';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      '不在頻道列表中顯示輸入指示器';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      '顯示目前頻道的輸入狀態';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      '停用時（預設），輸入指示器不會出現在您目前檢視的頻道。';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => '鍵盤提示';

  @override
  String get lookAndFeelKeyboardHintsDescription => '控制鍵盤快速鍵提示是否顯示在工具提示中。';

  @override
  String get lookAndFeelHideKeyboardHintsLabel => '在工具提示中隱藏鍵盤提示';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      '啟用時，工具提示彈出視窗中會隱藏快速鍵徽章。';

  @override
  String get lookAndFeelNekoTitle => '其他';

  @override
  String get lookAndFeelNekoDescription => '其他介面選項。';

  @override
  String get lookAndFeelShowNekoLabel => '顯示 Neko';

  @override
  String get lookAndFeelShowNekoDescription => '啟用時，Neko 會出現在聊天輸入列附近。';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => '語音頻道加入行為';

  @override
  String get lookAndFeelVoiceChannelJoinDescription => '控制您在社群中加入語音頻道的方式。';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel => '需要按兩下才能加入語音頻道';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      '啟用時，您需要按兩下語音頻道才能加入。停用時（預設），按一下即可立即加入頻道。';

  @override
  String get lookAndFeelChatFontPreviewSample => '敏捷的棕色狐狸跳過懶惰的狗。';

  @override
  String get lookAndFeelGuildSidebarTitle => '伺服器側邊欄';

  @override
  String get lookAndFeelGuildSidebarDescription => '設定伺服器側邊欄如何顯示私訊。';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '由於 flux capacitor 故障，有 $count 個社群暫時無法使用。',
      one: '由於 flux capacitor 故障，有 1 個社群暫時無法使用。',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => '將私訊摺疊到資料夾';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return '啟用時，伺服器側邊欄中的未讀私訊會摺疊到 $productName 按鈕資料夾中。在私訊頁面上按一下 $productName 按鈕即可展開或摺疊資料夾。';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => '頻道列表';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      '控制靜音頻道在頻道列表中的未讀指示器行為。';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel => '在靜音頻道上顯示未讀指示器';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      '啟用時，靜音頻道左側會顯示淡化的未讀指示器。提及訊息仍會顯示，不受此設定影響。';

  @override
  String get lookAndFeelActiveNowSectionTitle => '目前活躍';

  @override
  String get lookAndFeelActiveNowSectionDescription => '控制目前活躍在應用程式中的顯示方式。';

  @override
  String get lookAndFeelShowActiveNowLabel => '在首頁顯示目前活躍';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      '在首頁顯示目前活躍，以顯示正在語音頻道中的朋友。您將看到預覽、頻道內容、已在線上的人員，以及快速加入的方式。';

  @override
  String get lookAndFeelFavoritesSectionTitle => '我的最愛';

  @override
  String get lookAndFeelFavoritesSectionDescription => '控制我的最愛在應用程式中的可見性。';

  @override
  String get lookAndFeelEnableFavoritesLabel => '啟用我的最愛';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      '啟用後，您可以將頻道加入我的最愛，它們將出現在我的最愛區段。停用後，所有與我的最愛相關的 UI 元素（按鈕、選單項目）將會隱藏。您現有的我的最愛將會保留。';

  @override
  String get favoritesTitle => '我的最愛';

  @override
  String get favoritesEmptyTitle => '尚未有我的最愛';

  @override
  String get favoritesEmptyDescription => '將頻道從聊天標頭加上星號，即可將其保留在此處。';

  @override
  String get favoritesWelcomeTitle => '歡迎使用我的最愛';

  @override
  String get favoritesWelcomeDescription =>
      '您快速存取喜愛頻道、私訊和群組的專屬空間。按下任何頻道的星號即可將其加入。';

  @override
  String get favoritesWelcomeTip => '不喜歡嗎？隨時關閉。';

  @override
  String get favoritesDisableButton => '關閉我的最愛';

  @override
  String get favoritesAddedToast => '已加入我的最愛';

  @override
  String get favoritesRemovedToast => '已從我的最愛移除';

  @override
  String get favoritesHiddenToast => '我的最愛已隱藏';

  @override
  String get favoritesMute => '噤我的最愛';

  @override
  String get favoritesUnmute => '取消噤我的最愛';

  @override
  String get favoritesHeaderMenu => '我的最愛選單';

  @override
  String get favoritesCreateCategory => '建立分類';

  @override
  String get favoritesCategoryNameLabel => '分類名稱';

  @override
  String get favoritesHideMutedChannels => '隱藏已噤頻道';

  @override
  String get favoritesShowMutedChannels => '顯示已噤頻道';

  @override
  String get favoritesSetNickname => '設定暱稱';

  @override
  String get favoritesNicknameLabel => '暱稱';

  @override
  String get favoritesSaveNickname => '儲存暱稱';

  @override
  String get favoritesMoveToCategory => '移至分類';

  @override
  String get favoritesUncategorized => '未分類';

  @override
  String get favoritesOtherCategory => '其他';

  @override
  String get favoritesRemoveFromFavorites => '從我的最愛移除';

  @override
  String get favoritesAddToFavorites => '加入我的最愛';

  @override
  String get favoritesHideConfirmTitle => '隱藏我的最愛';

  @override
  String get favoritesHideConfirmDescription =>
      '這將隱藏所有與我的最愛相關的 UI 元素，包括按鈕和選單項目。您現有的我的最愛將會保留，並可隨時從「設定」>「進階」>「外觀」重新啟用。';

  @override
  String get favoritesDirectMessageSubtitle => '私人訊息';

  @override
  String get messagesMediaDisplayGroupTitle => '顯示';

  @override
  String get messagesMediaDisplayGroupDescription => '控制訊息、媒體和其他內容的顯示方式。';

  @override
  String get messagesMediaMediaGroupTitle => '媒體';

  @override
  String get messagesMediaMediaGroupDescription => '自訂媒體大小偏好設定和按鈕。';

  @override
  String get messagesMediaInputGroupTitle => '輸入';

  @override
  String get messagesMediaInputGroupDescription => '自訂訊息輸入設定。';

  @override
  String get messagesMediaSidebarGroupTitle => '側邊欄';

  @override
  String get messagesMediaSidebarGroupDescription => '設定社群側邊欄的顯示方式。';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel => '預設隱藏已噤頻道';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      '加入新社群時，側邊欄中自動隱藏已噤頻道';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle => '預設隱藏已噤頻道嗎？';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      '您加入的新社群將自動隱藏已噤頻道。您是否也想將此設定套用到您所有現有的社群？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      '停止預設隱藏已噤頻道嗎？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      '您加入的新社群將不再自動隱藏已噤頻道。您是否也想顯示您所有現有社群中的已噤頻道？';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction => '套用到所有社群';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction => '顯示於所有社群';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction => '僅限新社群';

  @override
  String get messagesMediaDisplaySectionTitle => '媒體顯示';

  @override
  String get messagesMediaDisplaySectionDescription =>
      '控制圖片、影片和其他媒體的顯示方式。所有媒體都會調整大小並轉換。無法壓縮成預覽的極大檔案，無論這些設定為何，都不會嵌入。';

  @override
  String get messagesMediaDisplayInlineEmbedLabel => '當以連結形式張貼到聊天時';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return '當直接上傳到 $productName 時';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => '連結預覽';

  @override
  String get messagesMediaLinkPreviewsSectionDescription => '控制網站連結在聊天中的預覽方式';

  @override
  String get messagesMediaLinkPreviewsToggleLabel => '顯示嵌入內容並預覽網站連結';

  @override
  String get messagesMediaReactionsSectionTitle => '表情符號回應';

  @override
  String get messagesMediaReactionsSectionDescription => '設定訊息的表情符號回應';

  @override
  String get messagesMediaReactionsToggleLabel => '在訊息上顯示表情符號回應';

  @override
  String get messagesMediaSpoilersSectionTitle => '劇透內容';

  @override
  String get messagesMediaSpoilersSectionDescription => '控制劇透內容的顯示方式';

  @override
  String get messagesMediaSpoilersRadioLabel => '顯示劇透內容';

  @override
  String get messagesMediaSpoilersOnClickName => '點擊時';

  @override
  String get messagesMediaSpoilersOnClickDescription => '點擊時顯示劇透內容';

  @override
  String get messagesMediaSpoilersIfModeratorName => '在我管理的頻道中';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      '在你擁有「管理訊息」權限的頻道中一律顯示劇透內容';

  @override
  String get messagesMediaSpoilersAlwaysName => '一律顯示';

  @override
  String get messagesMediaSpoilersAlwaysDescription => '一律顯示劇透內容';

  @override
  String get messagesMediaSizeSectionTitle => '媒體尺寸偏好設定';

  @override
  String get messagesMediaSizeSectionDescription =>
      '自訂嵌入式和附加媒體的最大顯示尺寸。較小的尺寸佔用較少的螢幕空間，而較大的尺寸則顯示更多細節。';

  @override
  String get messagesMediaSizeEmbedLabel => '來自連結的媒體 (嵌入式)';

  @override
  String get messagesMediaSizeAttachmentLabel => '上傳的附件';

  @override
  String get messagesMediaSizeCompactName => '壓縮 (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => '較小的媒體尺寸';

  @override
  String get messagesMediaSizeComfortableName => '舒適 (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription => '較大的媒體尺寸，更多細節';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF 行為';

  @override
  String get messagesMediaGifsSectionDescription => '控制 GIF 如何插入聊天中';

  @override
  String get messagesMediaGifsAutoSendLabel => '選取 GIF 後自動傳送';

  @override
  String get messagesMediaAutocompleteSectionTitle => '表情符號自動完成 (冒號自動完成)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      '控制輸入冒號時表情符號自動完成中出現的內容。自訂顯示哪些建議以符合你的偏好設定。';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      '在表情符號自動完成中顯示預設表情符號';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel => '在表情符號自動完成中顯示自訂表情符號';

  @override
  String get messagesMediaAutocompleteStickersLabel => '在表情符號自動完成中顯示貼圖';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel => '在表情符號自動完成中顯示已儲存的媒體';

  @override
  String get messagesMediaEditingSectionTitle => '訊息編輯';

  @override
  String get messagesMediaEditingSectionDescription => '控制取消編輯時草稿的處理方式。';

  @override
  String get messagesMediaEditingPreserveDraftLabel => '取消時保留編輯草稿';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => '私訊訊息預覽';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      '控制私訊列表中顯示訊息預覽的時間。';

  @override
  String get accessibilityDmMessagePreviewModeLabel => '私訊訊息預覽模式';

  @override
  String get accessibilityDmMessagePreviewAllName => '所有訊息';

  @override
  String get accessibilityDmMessagePreviewAllDescription => '顯示所有私訊對話的訊息預覽';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => '僅未讀私訊';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      '僅顯示有未讀訊息的私訊的訊息預覽';

  @override
  String get accessibilityDmMessagePreviewNoneName => '無';

  @override
  String get accessibilityDmMessagePreviewNoneDescription => '不在私訊列表中顯示訊息預覽';

  @override
  String get dmListSentAnAttachment => '傳送了附件';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username 將訊息釘選到此頻道。';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username 將 $userName 加入群組。';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username 加入了某人到群組。';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username 已離開群組。';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username 將 $userName 從群組中移除。';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username 從群組中移除了某人。';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username 將頻道名稱更改為 $newName。';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username 更改了頻道名稱。';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username 更改了頻道圖示。';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username 發起了通話。';
  }

  @override
  String get voiceConnectionConfirmTitle => '語音連線確認';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '您已從 $count 個其他裝置連線到此語音頻道。您想怎麼做？',
      one: '您已從 1 個其他裝置連線到此語音頻道。您想怎麼做？',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => '切換到此裝置';

  @override
  String get voiceConnectionConfirmJustJoin => '僅加入（保留其他連線）';

  @override
  String get voiceConnectionConfirmDoNothing => '不做任何事，我不想加入';

  @override
  String get voiceChannelEmptyDescription => '這是語音頻道。連線即可開始交談！';

  @override
  String get voiceChannelJoin => '加入語音頻道';

  @override
  String get voiceChannelJoinConnect => '連線到語音';

  @override
  String get voiceChannelNoConnectPermission => '您沒有加入此語音頻道的權限';

  @override
  String get voiceChannelE2eeEncrypted => '麥克風、相機和螢幕分享內容均為端對端加密。';

  @override
  String get voiceCallE2eeEncrypted => '麥克風、相機和螢幕分享內容均為端對端加密。';

  @override
  String get voiceChannelE2eeBroken => '由於有不支援的參與者在此語音頻道中，無法使用端對端加密。';

  @override
  String get voiceCallE2eeBroken => '由於有不支援的參與者在此通話中，無法使用端對端加密。';

  @override
  String get voiceE2eeUpdateRequired => '加入此加密通話前必須更新此用戶端。';

  @override
  String get voiceMicPublishFailedStayConnected => '無法啟動您的麥克風。您仍在通話中。';

  @override
  String get voiceChannelStatusConnecting => '正在連線中…';

  @override
  String get voiceChannelStatusConnected => '已連線';

  @override
  String get voiceChannelStatusError => '錯誤';

  @override
  String get voiceParticipantTooltipMobileDevice => '行動裝置';

  @override
  String get voiceParticipantTooltipDesktopDevice => '桌面裝置';

  @override
  String get voiceParticipantTooltipCommunityMuted => '社群靜音';

  @override
  String get voiceParticipantTooltipMuted => '已靜音';

  @override
  String get voiceParticipantTooltipCommunityDeafened => '社群禁聲';

  @override
  String get voiceParticipantTooltipDeafened => '已禁聲';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return '連線：$connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位參與者',
      one: '1 位參與者',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => '離開';

  @override
  String get voiceControlMute => '靜音';

  @override
  String get voiceControlUnmute => '取消靜音';

  @override
  String get voiceControlDeafen => '禁聲';

  @override
  String get voiceControlUndeafen => '取消禁聲';

  @override
  String get voiceControlVideo => '視訊';

  @override
  String get voiceControlScreenShare => '螢幕分享';

  @override
  String get voiceScreenShareNotificationText => '正在分享您的螢幕。';

  @override
  String get voiceControlMore => '更多';

  @override
  String get voiceControlDisconnect => '中斷連線';

  @override
  String get voiceControlChat => '聊天';

  @override
  String get voiceTextChatShow => '顯示聊天';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 則未讀訊息',
      one: '# 則未讀訊息',
    );
    return '顯示聊天（有 $_temp0）';
  }

  @override
  String get voiceCameraPermissionRequired => '視訊需要相機權限。';

  @override
  String get voiceErrorScreenShareToggle => '無法開始螢幕分享。請再試一次。';

  @override
  String get voiceErrorScreenSharePermissionDenied => '已拒絕螢幕分享權限。';

  @override
  String get voiceErrorScreenShareUnsupported => '此裝置不支援螢幕分享。';

  @override
  String get voiceWatchStream => '觀看串流';

  @override
  String get voiceStopWatching => '停止觀看';

  @override
  String get voiceStopWatchingCurrentStreamTooltip => '停止觀看目前的串流';

  @override
  String get voiceOwnScreenShareTitle => '您正在廣播';

  @override
  String get voiceOwnScreenShareSubtitle => '您的串流對參與者直播中。';

  @override
  String get voiceLiveBadge => '直播中';

  @override
  String get dmVoiceViewCall => '檢視通話';

  @override
  String get dmVoiceCallFullScreen => '全螢幕';

  @override
  String get dmVoiceCallFullScreenTooltip => '全螢幕開啟通話';

  @override
  String get dmVoiceStripStatusConnecting => '正在連線中…';

  @override
  String get dmVoiceStripStatusInCall => '通話中';

  @override
  String get dmVoiceEmbeddedFallbackTitle => '語音通話';

  @override
  String get dmVoiceCallBarConnecting => '正在連線中…';

  @override
  String get dmVoiceCallBarDirectPrimary => '直接通話';

  @override
  String get dmVoiceCallBarGroupPrimary => '群組通話';

  @override
  String get dmVoiceCallBarIssueFallback => '語音問題';

  @override
  String get dmVoiceFullscreenTitle => '語音';

  @override
  String get voiceCallBarGuildConnectedFallback => '語音已連線';

  @override
  String get notificationsPageTitle => '通知';

  @override
  String get notificationsFilterUnreads => '未讀';

  @override
  String get notificationsFilterMentions => '提及';

  @override
  String get notificationsBookmarksTooltip => '書籤';

  @override
  String get notificationsMentionFilterTooltip => '篩選提及';

  @override
  String get notificationsMentionFiltersTitle => '提及篩選器';

  @override
  String get notificationsMentionIncludeEveryone => '包含 @everyone 和 @here 提及';

  @override
  String get notificationsMentionIncludeRoles => '包含角色提及';

  @override
  String get notificationsMentionIncludeGuilds => '包含所有社群提及';

  @override
  String get notificationsNoUnreadTitle => '沒有未讀訊息';

  @override
  String get notificationsNoUnreadBody => '您已全部讀完。';

  @override
  String get notificationsNoMentionsTitle => '沒有近期提及';

  @override
  String get notificationsNoMentionsBody => '所有提及您的訊息將在此顯示 7 天。';

  @override
  String get notificationsMentionsEndTitle => '您已到達結尾';

  @override
  String get notificationsMentionsEndBody => '您已看過所有近期提及。別擔心，很快就會有更多出現。';

  @override
  String get notificationsJump => '跳至';

  @override
  String get notificationsRemoveMentionTooltip => '移除提及';

  @override
  String get notificationsViewAllUnread => '檢視所有未讀';

  @override
  String get notificationsMarkAsRead => '標示為已讀';

  @override
  String get notificationsExpand => '展開';

  @override
  String get notificationsCollapse => '摺疊';

  @override
  String get notificationsMessageUnavailable => '無法載入此訊息。';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining 個字元剩餘';
  }

  @override
  String get characterCounterTooLong => '訊息太長';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining 個字元剩餘。購買 $productName 可撰寫最多 $premiumMaxLength 個字元。';
  }

  @override
  String get chatMessageFailedToSend => '訊息傳送失敗';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return '您的訊息無法送達。這通常是因為您與收件者沒有共同的社群，或是收件者僅接受朋友的直接訊息。您可能也需要在 $settingsPath 中調整您自己的直接訊息隱私設定。';
  }

  @override
  String get chatSendFailureUnclaimedDm => '您的訊息無法送達。您需要領取您的帳戶才能傳送直接訊息。';

  @override
  String get chatSendFailureUnclaimedGeneral => '您的訊息無法送達。您需要領取您的帳戶才能傳送訊息。';

  @override
  String get chatSendFailureContentBlocked =>
      '您的訊息因被我們的安全系統標記而無法送達。如果您認為這是錯誤，請聯絡支援團隊。';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      '您的訊息無法送達，因為其中包含在此情境不允許的成人表情符號或貼圖。';

  @override
  String get chatClientSystemOnlyYouCanSee => '只有您能看到此訊息。';

  @override
  String get chatClientSystemDismiss => '關閉';

  @override
  String get privacyDashboardCommunicationSection => '通訊';

  @override
  String get chatMessageDeleteFailed => '刪除失敗訊息';

  @override
  String get chatMessageAddReaction => '新增反應';

  @override
  String get chatMessageEdit => '編輯訊息';

  @override
  String get chatMessageReply => '回覆';

  @override
  String get chatMessageForward => '轉寄';

  @override
  String get forwardMessageTitle => '轉寄訊息';

  @override
  String get forwardSearchHint => '搜尋頻道或私訊';

  @override
  String get forwardDirectMessagesSection => '私訊';

  @override
  String get forwardCommentHint => '新增備註（選填）';

  @override
  String forwardSendButton(int count, int limit) {
    return '傳送 ($count/$limit)';
  }

  @override
  String get forwardEmptyState => '找不到頻道';

  @override
  String get forwardSuccessToast => '訊息已轉寄';

  @override
  String get forwardFailed => '無法轉寄訊息';

  @override
  String get forwardCommentSlowmodeDisabled => '由於選取的頻道已啟用慢速模式，備註功能無法使用。';

  @override
  String get forwardDestinationNoSendPermission => '您無法在此傳送訊息';

  @override
  String get forwardDestinationNoEmbedPermission => '您無法在此嵌入連結';

  @override
  String get forwardDestinationNoAttachPermission => '您無法在此附加檔案';

  @override
  String get forwardDestinationGuildSendDisabled => '此社群已停用訊息傳送';

  @override
  String get forwardDestinationTimedOut => '您在此社群中被暫時禁言';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return '慢速模式 - 請稍候 $remaining';
  }

  @override
  String get chatMessageCopyText => '複製訊息';

  @override
  String get chatMessagePin => '釘選訊息';

  @override
  String get chatMessageUnpin => '取消釘選訊息';

  @override
  String get chatMessageUnpinIt => '取消釘選';

  @override
  String get chatMessageBookmark => '加入書籤';

  @override
  String get chatMessageRemoveBookmark => '移除書籤';

  @override
  String get chatMessageMarkAsUnread => '標示為未讀';

  @override
  String get chatMessageCopyMessageLink => '複製訊息連結';

  @override
  String get chatMessageCopyMessageId => '複製訊息 ID';

  @override
  String get chatMessageViewReactions => '檢視反應';

  @override
  String get chatMessageRemoveAllReactions => '移除所有反應';

  @override
  String get chatMessageDebug => '偵錯訊息';

  @override
  String get chatMessageDebugSheetTitle => '偵錯訊息';

  @override
  String get chatMessageDebugCopyJson => '複製 JSON';

  @override
  String get chatMessageDebugJsonCopiedToast => '訊息 JSON 已複製到剪貼簿';

  @override
  String get chatReactionsSheetTitle => '反應';

  @override
  String get chatReactionsSheetEmpty => '目前沒有人對此做出反應。';

  @override
  String get chatMessageReport => '檢舉訊息';

  @override
  String get iarReportMessageTitle => '檢舉訊息';

  @override
  String get iarThisUserFallback => '此使用者';

  @override
  String get iarModalDescription => '檢舉違規行為，或尋找管理聯絡人與偏好的工具。';

  @override
  String get iarPathStepAriaLabel => '您需要什麼？';

  @override
  String get iarCategoryStepTitle => '違反了哪種規則？';

  @override
  String get iarReasonStepTitle => '違反了哪個規則？';

  @override
  String get iarReasonSelectHint => '選擇原因';

  @override
  String get iarPickAnOptionToast => '請選擇一個選項以繼續。';

  @override
  String get iarPickARuleToast => '請選擇違反的規則。';

  @override
  String get iarPathPlatform => '檢舉平台規則違規';

  @override
  String get iarPathCommunity => '向此社群管理員檢舉';

  @override
  String get iarPathPreferenceMessage => '我不喜歡這個內容';

  @override
  String get iarCategoryTargetedHarmLabel => '威脅、騷擾或傷害';

  @override
  String get iarCategoryTargetedHarmDescription => '霸凌、威脅、仇恨言論、暴力、騷擾或推廣自殘的內容。';

  @override
  String get iarCategorySafetyMinorsLabel => '兒童安全或成人內容';

  @override
  String get iarCategorySafetyMinorsDescription => '未成年人處於風險中、不適當的成人內容或不當行為。';

  @override
  String get iarCategoryPrivacyIdentityLabel => '隱私或冒充';

  @override
  String get iarCategoryPrivacyIdentityDescription => '洩漏個資、跟蹤、冒充他人或不當的個人資料。';

  @override
  String get iarCategoryDeceptionLabel => '詐騙、惡意軟體或錯誤資訊';

  @override
  String get iarCategoryDeceptionDescription => '網路釣魚、詐騙、惡意連結或可能造成現實世界傷害的虛假聲明。';

  @override
  String get iarCategoryIllegalOtherLabel => '非法活動或其他';

  @override
  String get iarCategoryIllegalOtherDescription => '非法銷售、協助犯罪或明顯違反規定但未歸類於以上項目。';

  @override
  String get iarReasonHarassmentLabel => '騷擾或威脅';

  @override
  String get iarReasonHarassmentMessageDescription => '霸凌、重複的騷擾訊息、跟蹤或針對性的辱罵。';

  @override
  String get iarReasonHateLabel => '仇恨言論';

  @override
  String get iarReasonHateMessageDescription => '歧視性稱呼、非人化語言或針對特定群體的攻擊。';

  @override
  String get iarReasonViolenceLabel => '暴力或暴力威脅';

  @override
  String get iarReasonViolenceDescription => '可信的威脅、血腥暴力或頌揚暴力。';

  @override
  String get iarReasonMatureContentLabel => '成人內容或騷擾';

  @override
  String get iarReasonMatureContentMessageDescription => '不當的行為或不適當的成人內容。';

  @override
  String get iarReasonChildSafetyLabel => '兒童安全或剝削未成年人';

  @override
  String get iarReasonChildSafetyMessageDescription => '誘騙或剝削兒童的內容。';

  @override
  String get iarReasonHarmfulMisinfoLabel => '有害的錯誤資訊';

  @override
  String get iarReasonHarmfulMisinfoDescription => '可能造成現實世界傷害的虛假聲明。';

  @override
  String get iarReasonSpamLabel => '垃圾訊息、詐騙或網路釣魚';

  @override
  String get iarReasonSpamMessageDescription => '大量垃圾訊息、詐騙、假贈品或帳號濫用。';

  @override
  String get iarReasonMalwareLabel => '惡意軟體或危險連結';

  @override
  String get iarReasonMalwareDescription => '惡意軟體、竊取帳號資訊或有害檔案。';

  @override
  String get iarReasonPrivacyLabel => '侵犯隱私';

  @override
  String get iarReasonPrivacyDescription => '洩漏個資、公開私人資訊或跟蹤。';

  @override
  String get iarReasonImpersonationLabel => '冒充或欺騙性媒體';

  @override
  String get iarReasonImpersonationMessageDescription => '冒充他人，包括欺騙性的 AI 生成內容。';

  @override
  String get iarReasonIllegalLabel => '非法活動';

  @override
  String get iarReasonIllegalDescription => '非法銷售、協助犯罪或非法活動。';

  @override
  String get iarReasonSelfHarmLabel => '自殘或自殺';

  @override
  String get iarReasonSelfHarmMessageDescription => '推廣或指導鼓勵自殘或飲食失調。';

  @override
  String get iarReasonOtherLabel => '其他明顯的違規行為';

  @override
  String iarReasonOtherDescription(String productName) {
    return '僅在內容明顯違反 $productName 規定且不符合以上任何類別時使用。';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return '若涉及未成年人，請改用「$childSafetyReason」。';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      '若涉及兒童性犯罪圖像 (CSAM) 或剝削未成年人，請立即檢舉，請勿再次分享相關內容。';

  @override
  String get iarSafetyNoteSelfHarm => '若有人可能處於立即危險中，請在安全的情況下聯繫當地緊急服務。';

  @override
  String get iarSafetyNoteViolence => '若這是可信的迫在眉睫的威脅，也請聯繫當地緊急服務。';

  @override
  String get iarSafetyNoteTerrorism => '若這是迫在眉睫的恐怖主義威脅，也請聯繫當地緊急服務。';

  @override
  String get iarActionBlockUserTitle => '封鎖此用戶';

  @override
  String get iarActionBlockUserDescription => '停止接收訊息和好友邀請。';

  @override
  String get iarActionBlockUserButton => '封鎖';

  @override
  String get iarActionCopyMessageLinkTitle => '複製訊息連結';

  @override
  String get iarActionCopyMessageLinkDescription => '與社群管理員分享。';

  @override
  String get iarActionCopyMessageLinkButton => '複製';

  @override
  String get iarActionCloseDmTitle => '關閉此私訊';

  @override
  String get iarActionCloseDmDescription => '不會封鎖。之後仍可重新開啟。';

  @override
  String get iarActionCloseDmButton => '關閉私訊';

  @override
  String get iarActionLeaveCommunityTitle => '離開社群';

  @override
  String get iarActionLeaveCommunityDescription => '停止查看其內容和成員。';

  @override
  String get iarActionLeaveCommunityButton => '離開';

  @override
  String get iarActionDmSettingsTitle => '私訊與交友邀請設定';

  @override
  String get iarActionDmSettingsDescription => '變更誰可以聯絡你。';

  @override
  String get iarActionCallSettingsTitle => '通話與群組聊天設定';

  @override
  String get iarActionCallSettingsDescription => '變更誰可以撥打電話給你或將你加入。';

  @override
  String get iarActionOpenButton => '開啟';

  @override
  String get iarActionDeleteMessageTitle => '刪除此訊息';

  @override
  String get iarActionDeleteMessageDescription => '從頻道中移除，對所有人隱藏。';

  @override
  String get iarActionDeleteMessageButton => '刪除';

  @override
  String get iarActionDeleteMessageDeletedButton => '已刪除';

  @override
  String get iarActionDeleteMessageDeletedTooltip => '此訊息已刪除。';

  @override
  String get iarActionBanUserTitle => '封鎖此使用者';

  @override
  String get iarActionBanUserDescription => '開啟此社群的封鎖使用者對話方塊。';

  @override
  String get iarActionBanUserButton => '封鎖';

  @override
  String get iarActionBanUserBannedButton => '已封鎖';

  @override
  String get iarActionBanUserBannedTooltip => '此使用者已遭封鎖，無法加入此社群。';

  @override
  String get iarCloseDmConfirmTitle => '關閉私訊';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return '關閉你與 $name 的目前私訊。這不會封鎖對方；你之後可以重新開啟。';
  }

  @override
  String get iarSuccessTitle => '已送出檢舉';

  @override
  String get iarSuccessBody => '我們的安全團隊正在審查。一旦有結果，我們會透過私訊和電子郵件通知你。';

  @override
  String get iarAlreadyReportedTitle => '已檢舉';

  @override
  String get iarAlreadyReportedBody => '你已檢舉此訊息。我們的安全團隊正在審查。';

  @override
  String get iarBackButton => '上一頁';

  @override
  String get iarContinueButton => '繼續';

  @override
  String get iarSendReportButton => '送出檢舉';

  @override
  String get iarDoneButton => '完成';

  @override
  String get iarCouldntSendToast => '無法送出檢舉。請再試一次。';

  @override
  String get iarRateLimitedToast => '你檢舉的頻率太快。請稍候再試。';

  @override
  String get iarReportSentToast => '已送出檢舉。我們的安全團隊會進行審查。';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return '要封鎖 $name 嗎？對方將無法傳送訊息給你或傳送交友邀請。你之後可以解除封鎖。';
  }

  @override
  String get iarBlockUserFailedToast => '無法封鎖此使用者。請再試一次。';

  @override
  String get iarCloseDmSuccessToast => '已關閉私訊。';

  @override
  String get iarCloseDmFailedToast => '無法關閉此私訊。請再試一次。';

  @override
  String get iarLeaveCommunityFailedToast => '無法離開此社群。請再試一次。';

  @override
  String get chatMessageSuppressEmbeds => '隱藏嵌入內容';

  @override
  String get chatMessageUnsuppressEmbeds => '顯示嵌入內容';

  @override
  String get chatMessageDelete => '刪除訊息';

  @override
  String get chatMessageDeleteConfirmTitle => '刪除訊息';

  @override
  String get chatMessageDeleteConfirmDescription => '確定要刪除此訊息嗎？';

  @override
  String get chatMessageMore => '更多';

  @override
  String get chatEditingMessage => '正在編輯訊息';

  @override
  String get chatReplyOriginalDeleted => '原始訊息已刪除';

  @override
  String get chatReplyOriginalFailedToLoad => '無法載入原始訊息';

  @override
  String get chatReplyAttachedMedia => '訊息包含附加媒體';

  @override
  String get chatMessagesLoadError => '無法載入訊息。';

  @override
  String get chatReplyMentionOverrideTitle => '覆寫提及偏好設定？';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname 偏好在回覆時被提及。仍要傳送而不提及嗎？';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname 偏好不透過提及來回覆。仍要透過提及傳送嗎？';
  }

  @override
  String get chatReplyMentionIgnorePreference => '忽略偏好設定';

  @override
  String get chatReplyMentionDisableTooltip => '點擊以停用提及您正在回覆的使用者。';

  @override
  String get chatReplyMentionEnableTooltip => '點擊以啟用提及您正在回覆的使用者。';

  @override
  String get chatReplyMentionAccessibilityLabel => '提及回覆的使用者';

  @override
  String get chatReplyMentionOn => '開啟';

  @override
  String get chatReplyMentionOff => '關閉';

  @override
  String get chatReplyCancel => '取消回覆';

  @override
  String get chatEditMessageHint => '編輯訊息';

  @override
  String get chatEditNoChanges => '沒有要儲存的變更';

  @override
  String get chatChannelNotReady => '此頻道尚未準備就緒。請稍後再試。';

  @override
  String get chatMessageEdited => '(已編輯)';

  @override
  String get chatMessageSilent => '這是 @silent 訊息。';

  @override
  String chatMessageTimestampToday(String time) {
    return '今天 $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return '昨天 $time';
  }

  @override
  String get mediaViewerImagePreview => '圖片預覽';

  @override
  String get mediaViewerClose => '關閉媒體檢視器';

  @override
  String get mediaViewerOpenInBrowser => '在瀏覽器中開啟';

  @override
  String get mediaViewerForward => '轉寄';

  @override
  String get mediaViewerZoomIn => '放大';

  @override
  String get mediaViewerZoomOut => '縮小';

  @override
  String get mediaViewerPreviousAttachment => '上一則附件';

  @override
  String get mediaViewerNextAttachment => '下一則附件';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => '切換影片控制項';

  @override
  String get chatAttachmentVideoMute => '將影片設為靜音';

  @override
  String get chatAttachmentVideoUnmute => '取消影片靜音';

  @override
  String get chatAttachmentVideoPlay => '播放影片';

  @override
  String get chatAttachmentVideoPause => '暫停影片';

  @override
  String get chatAttachmentVideoProgress => '影片進度';

  @override
  String get chatVideoPlaybackFailed => '無法播放此影片。';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      '通知具有此角色的使用者，他們有權檢視此頻道。';

  @override
  String get addGuildModalTitle => '新增社群';

  @override
  String get addGuildModalLandingDescription => '建立新社群或加入現有社群。';

  @override
  String get addGuildCreateCommunity => '建立社群';

  @override
  String get addGuildJoinCommunity => '加入社群';

  @override
  String get addGuildImportDiscordTemplate => '匯入 Discord 範本';

  @override
  String get addGuildJoinTitle => '加入社群';

  @override
  String get addGuildJoinDescription => '輸入邀請連結以加入社群。';

  @override
  String get addGuildInviteLinkLabel => '邀請連結';

  @override
  String get addGuildJoinSubmit => '加入社群';

  @override
  String get addGuildInviteInvalid => '此邀請無效或已過期。';

  @override
  String get addGuildJoinFailed => '無法加入社群。請再試一次。';

  @override
  String get addGuildPackInstalled => '套件已成功安裝。';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => '移除所有反應';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      '確定要移除此訊息的所有反應嗎？';

  @override
  String get chatMessageUnpinConfirmTitle => '取消釘選訊息';

  @override
  String get chatMessageUnpinConfirmDescription => '將此釘選訊息送回過去？';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username 釘選了 $messageLink 到此頻道。請參閱 $allPinsLink。';
  }

  @override
  String get systemPinMessageMessageLink => '一則訊息';

  @override
  String get systemPinMessageAllPinsLink => '所有釘選訊息';

  @override
  String get channelPinsEmptyTitle => '沒有釘選訊息';

  @override
  String get channelPinsEmptyDescription => '釘選的訊息會顯示在這裡。';

  @override
  String get personalNotesTitle => '個人筆記';

  @override
  String get personalNotesSubtitle => '你的專屬空間，用於記錄想法和提醒';

  @override
  String channelWelcomeHeading(String channelName) {
    return '歡迎來到 $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return '起初，萬物皆空。然後，有了 $channelName。一切都變得美好。';
  }

  @override
  String get personalNotesComposerHint => '傳訊息給自己';

  @override
  String channelComposerHint(String channelName) {
    return 'Message #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Message @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Message $groupName';
  }

  @override
  String get groupDmComposerHint => 'Message group';

  @override
  String get composerHint => 'Message';

  @override
  String get personalNotesPrivateSpace => '你的私人空間';

  @override
  String get purgePersonalNotes => '清除個人筆記';

  @override
  String get purgePersonalNotesConfirmDescription =>
      '這將永久刪除你個人筆記中的所有訊息和附件。此操作無法復原。';

  @override
  String get purgePersonalNotesConfirmButton => '清除';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '已從個人筆記中清除 $count 則訊息';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => '個人筆記已是空的';

  @override
  String get purgePersonalNotesFailed => '無法清除個人筆記';

  @override
  String get userSettingsGroupYourAccount => '你的帳戶';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => '個人資料';

  @override
  String get userSettingsNavSecurityLogin => '安全性與登入';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => '禮物與代碼';

  @override
  String get userSettingsNavPrivacyDashboard => '隱私權儀表板';

  @override
  String get userSettingsNavAuthorizedApps => '已授權的應用程式';

  @override
  String get userSettingsNavBlockedUsers => '封鎖的使用者';

  @override
  String get userSettingsNavLinkedDevices => '已連結的裝置';

  @override
  String get userSettingsNavConnections => '連線';

  @override
  String get userSettingsNavLookAndFeel => '外觀';

  @override
  String get userSettingsNavAccessibility => '輔助功能';

  @override
  String get userSettingsNavChat => '訊息與媒體';

  @override
  String get userSettingsNavAudioAndVideo => '音訊與視訊';

  @override
  String get userSettingsNavLanguageAndTime => '語言與時間';

  @override
  String get userSettingsNavAdvanced => '進階';

  @override
  String get advancedPerformanceReportingTitle => '效能報告';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return '透過分享匿名的當機和效能資料，協助改進 $productName。';
  }

  @override
  String get advancedPerformanceReportingLabel => '傳送當機和效能報告';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return '所有回報的資料均為匿名，且僅傳送至 $productName 自有的監控服務 — 不會使用任何第三方供應商。';
  }

  @override
  String get userSettingsNavApplications => '應用程式';

  @override
  String get userSettingsNavAppLogs => '應用程式記錄';

  @override
  String get userSettingsNavDeveloperTools => '開發人員工具';

  @override
  String get userSettingsNavLimitsConfig => '限制設定';

  @override
  String get userSettingsNavFeatureFlags => '功能旗標';

  @override
  String get userSettingsNavWhatsNew => '新功能';

  @override
  String get userSettingsNavLogOut => '登出';

  @override
  String get quickSwitcherTabSearch => '搜尋';

  @override
  String get quickSwitcherTabFriends => '朋友';

  @override
  String get quickSwitcherSearchPlaceholder => '搜尋頻道、人員或社群';

  @override
  String get quickSwitcherSearchFriends => '搜尋朋友';

  @override
  String get quickSwitcherNoMatchesFound => '找不到相符項目';

  @override
  String get quickSwitcherEmptyHint => '嘗試輸入不同的名稱，或使用 @ / # / ! / * 前綴篩選結果。';

  @override
  String get quickSwitcherSectionPeople => '人員';

  @override
  String get quickSwitcherSectionGroupMessages => '群組訊息';

  @override
  String get quickSwitcherSectionTextChannels => '文字頻道';

  @override
  String get quickSwitcherSectionVoiceChannels => '語音頻道';

  @override
  String get quickSwitcherSectionCommunities => '社群';

  @override
  String get quickSwitcherSectionSettings => '設定';

  @override
  String get quickSwitcherHomeLabel => '首頁';

  @override
  String get quickSwitcherDirectMessagesLabel => '私訊';

  @override
  String get quickSwitcherFavoritesLabel => '我的最愛';

  @override
  String get quickSwitcherUserSettingsLabel => '使用者設定';

  @override
  String get quickSwitcherNotificationsLabel => '通知';

  @override
  String get quickSwitcherBookmarksLabel => '書籤';

  @override
  String get quickSwitcherMentionsLabel => '提及';

  @override
  String get quickSwitcherFriendsEmptyTitle => '尚未有朋友';

  @override
  String get quickSwitcherFriendsEmptyHint => '新增朋友開始使用。';

  @override
  String get quickSwitcherFriendsNoMatchTitle => '沒有朋友符合搜尋條件';

  @override
  String get quickSwitcherFriendsNoMatchHint => '嘗試輸入不同的名稱。';

  @override
  String get quickSwitcherSearchAliasUser => '使用者';

  @override
  String get quickSwitcherSearchAliasYou => '你';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => '私訊';

  @override
  String get quickSwitcherSearchAliasMessages => '訊息';

  @override
  String get quickSwitcherSearchAliasFav => '最愛';

  @override
  String get quickSwitcherSearchAliasStarred => '已加星號';

  @override
  String get quickSwitcherSearchAliasInbox => '收件匣';

  @override
  String get quickSwitcherSearchAliasSaved => '已儲存';

  @override
  String get uiClose => '關閉';

  @override
  String get chatJumpToBottom => '跳至底部';

  @override
  String get uiConfirm => '確認';

  @override
  String get uiLoading => '載入中';

  @override
  String get uiUnsavedChanges => '未儲存的變更';

  @override
  String get uiReset => '重設';

  @override
  String get uiOpenColorPicker => '開啟色彩選擇器';

  @override
  String get uiSelectPlaceholder => '選擇';

  @override
  String get uiSearchPlaceholder => '搜尋';

  @override
  String get uiNoOptionsFound => '找不到選項';

  @override
  String get uiDismissNotification => '關閉通知';

  @override
  String get uiColorPickerTitle => '色彩選擇器';

  @override
  String get mentionConfirmTitle => '提及所有人嗎？';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return '這將會通知 $count 位成員。是否繼續？';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return '這將會通知 $count 位線上成員。是否繼續？';
  }

  @override
  String get mentionConfirmButton => '提及';

  @override
  String get composerEmojiUnavailable => '您無法在此處使用該表情符號。';

  @override
  String get instanceUrlLabel => '伺服器網址';

  @override
  String get instanceUrlPlaceholder => '輸入伺服器網址 (例如 fluxer.app)';

  @override
  String get resetToDefaultInstance => '重設為 Fluxer';

  @override
  String get instanceConnect => '連線';

  @override
  String get instanceConnecting => '正在連線…';

  @override
  String get instanceConnectFailed => '無法連線到此伺服器';

  @override
  String get recentInstances => '近期伺服器';

  @override
  String removeRecentInstance(String domain) {
    return '從近期伺服器移除 $domain';
  }

  @override
  String get instanceSheetTitle => '連線到伺服器';

  @override
  String get connectToDifferentInstance => '連線到其他伺服器';

  @override
  String get changeInstance => '變更';

  @override
  String get instanceConnectionRequired => '請先連線到伺服器才能登入';

  @override
  String get comingSoon => '即將推出';

  @override
  String get guildNavbarDirectMessages => '私訊';

  @override
  String get guildNavbarExploreDiscoverableCommunities => '探索可發現的社群';

  @override
  String get discoveryExplore => '探索';

  @override
  String get discoveryExplorePublicCommunities => '探索公開社群';

  @override
  String get discoveryListingSubheading =>
      '想在此列出你的社群嗎？如果符合資格，請在你的社群設定 > 探索中申請。';

  @override
  String get discoverySearchCommunities => '搜尋社群';

  @override
  String get discoveryFilterByLanguage => '依語言篩選';

  @override
  String get discoveryAllLanguages => '所有語言';

  @override
  String get discoveryAllCategories => '全部';

  @override
  String get discoveryCategoryGaming => '遊戲';

  @override
  String get discoveryCategoryMusic => '音樂';

  @override
  String get discoveryCategoryEntertainment => '娛樂';

  @override
  String get discoveryCategoryEducation => '教育';

  @override
  String get discoveryCategoryScienceAndTechnology => '科學與科技';

  @override
  String get discoveryCategoryContentCreator => '內容創作者';

  @override
  String get discoveryCategoryAnimeAndManga => '動漫與漫畫';

  @override
  String get discoveryCategoryMoviesAndTv => '電影與電視';

  @override
  String get discoveryCategoryOther => '其他';

  @override
  String get discoveryNoCommunitiesMatch => '沒有社群符合條件。';

  @override
  String get discoveryJoinCommunity => '加入社群';

  @override
  String get discoveryJoined => '已加入';

  @override
  String discoveryOnlineCount(String count) {
    return '$count 人在線上';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 位成員',
      one: '1 位成員',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => '無說明。';

  @override
  String get discoveryCommunities => '社群';

  @override
  String get discoveryApps => '應用程式';

  @override
  String get discoveryJoinErrorGenericTitle => '無法加入此社群';

  @override
  String get discoveryJoinErrorGenericMessage => '發生錯誤。請稍後再試。';

  @override
  String get discoveryJoinErrorFullTitle => '此社群已滿';

  @override
  String get discoveryJoinErrorFullMessage => '此社群已達到成員上限，目前無法加入。';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => '你已達到社群上限';

  @override
  String get discoveryJoinErrorMaxGuildsMessage => '你已加入最多數量的社群。請離開一個再試一次。';

  @override
  String get discoveryJoinErrorBannedTitle => '你無法加入此社群';

  @override
  String get discoveryJoinErrorBannedMessage => '你已被禁止加入此社群。';

  @override
  String get discoveryJoinErrorNotAvailableTitle => '此社群已不再提供';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      '它可能已離開探索或關閉新成員加入。重新整理頁面後將不會再看到它。';

  @override
  String get discoveryJoinErrorRateLimitTitle => '你操作太快了';

  @override
  String get discoveryJoinErrorRateLimitMessage => '請稍候片刻再試。';

  @override
  String get guildNavbarAddCommunity => '新增社群';

  @override
  String get guildNavbarHelp => '說明';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => '新訊息';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '$folderName 文件夹';
  }

  @override
  String get guildNavbarGroupDm => '群组私讯';

  @override
  String get guildNavbarCreateChannel => '建立频道';

  @override
  String get guildNavbarChannelType => '频道类型';

  @override
  String get guildNavbarTextChannel => '文字频道';

  @override
  String get guildNavbarTextChannelDescription => '发送讯息、图片、GIF 和表情符号';

  @override
  String get guildNavbarVoiceChannel => '语音频道';

  @override
  String get guildNavbarVoiceChannelDescription => '透过语音、视讯和画面分享一起闲聊';

  @override
  String get guildNavbarLinkChannel => '连结频道';

  @override
  String get guildNavbarLinkChannelDescription => '快速存取外部网站或资源';

  @override
  String get guildNavbarNameLabel => '名称';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarCreateCategory => '建立分类';

  @override
  String get guildNavbarNewCategoryHint => '新分类';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return '邀请朋友加入 $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return '收件者将进入 #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => '搜寻朋友';

  @override
  String get guildNavbarNoFriendsYet => '还没有朋友';

  @override
  String get guildNavbarNoResults => '没有结果';

  @override
  String get guildNavbarInviteLinkPrompt => '或者，将邀请连结寄给朋友：';

  @override
  String get guildNavbarInviteLink => '邀请连结';

  @override
  String get guildNavbarCopy => '复制';

  @override
  String get guildNavbarCopied => '已复制！';

  @override
  String get guildNavbarInviteExpiresSevenDays => '您的邀请连结将在 7 天后到期。';

  @override
  String get guildNavbarInviteNeverExpires => '此邀请连结永不过期。';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return '您的邀请连结将在 $duration 后到期。';
  }

  @override
  String get guildNavbarEditInviteLink => '编辑邀请连结';

  @override
  String get guildNavbarInviteLinkSettings => '邀请连结设定';

  @override
  String get guildNavbarExpireAfter => '到期时间';

  @override
  String get guildNavbarMaxUses => '最多使用次数';

  @override
  String get guildNavbarGrantTemporaryMembership => '授予临时会员资格';

  @override
  String get guildNavbarTemporaryMembershipDescription => '除非分配角色，否则会员离线时将被移除';

  @override
  String get guildNavbarCreateNewLink => '建立新连结';

  @override
  String get guildNavbarSent => '已寄送';

  @override
  String get guildNavbarInvite => '邀请';

  @override
  String get guildNavbarLeaveCommunityTitle => '离开社群';

  @override
  String get guildNavbarLeaveCommunityDescription => '确定要离开这个社群吗？您将无法再看到任何讯息。';

  @override
  String get guildNavbarLeaveCommunityConfirm => '离开社群';

  @override
  String get guildNavbarDeleteMyMessagesTitle => '删除您在此社群中的讯息？';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      '永久删除您在此处、所有频道中发送的每则讯息。无法复原。';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => '删除我的讯息';

  @override
  String get guildNavbarDeletedYourMessages => '已删除您的讯息';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => '无法删除您的讯息';

  @override
  String get guildNavbarRemoveOverride => '移除覆盖设定';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return '静音至 $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return '仅限 $productName 员工存取';
  }

  @override
  String get guildNavbarInvitesPaused => '此社群的邀请目前已暂停';

  @override
  String get guildNavbarDurationNever => '永不';

  @override
  String get guildNavbarDuration30Minutes => '30 分钟';

  @override
  String get guildNavbarDuration1Hour => '1 小时';

  @override
  String get guildNavbarDuration6Hours => '6 小时';

  @override
  String get guildNavbarDuration12Hours => '12 小時';

  @override
  String get guildNavbarDuration1Day => '1 天';

  @override
  String get guildNavbarDuration7Days => '7 天';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count 秒';
  }

  @override
  String get guildNavbarNever => '永不';

  @override
  String get guildNavbarNoLimit => '無上限';

  @override
  String get guildNavbarOneUse => '1 次';

  @override
  String guildNavbarUses(int count) {
    return '$count 次';
  }

  @override
  String get guildMenuMarkAsRead => '標示為已讀';

  @override
  String get guildPeekMoreOptions => '更多選項';

  @override
  String get guildMenuInviteMembers => '邀請成員';

  @override
  String get guildMenuCommunitySettings => '社群設定';

  @override
  String get guildMenuEditCommunityProfile => '編輯社群個人資料';

  @override
  String get guildMenuUnmuteCommunity => '解除社群靜音';

  @override
  String get guildMenuMuteCommunity => '靜音社群';

  @override
  String get guildMenuHideMutedChannels => '隱藏已靜音的頻道';

  @override
  String get guildMenuReportCommunity => '檢舉社群';

  @override
  String get guildMenuDebugCommunity => '偵錯社群';

  @override
  String get guildMenuCopyCommunityId => '複製社群 ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return '直到 $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => '一般';

  @override
  String get guildMenuSettingsRoles => '角色與權限';

  @override
  String get guildMenuSettingsEmoji => '自訂表情符號';

  @override
  String get guildMenuSettingsStickers => '自訂貼圖';

  @override
  String get guildMenuSettingsSafetyModeration => '安全與管理';

  @override
  String get guildMenuSettingsActivityLog => '活動紀錄';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook';

  @override
  String get guildMenuSettingsCustomInviteUrl => '自訂邀請網址';

  @override
  String get guildMenuSettingsDiscovery => '探索';

  @override
  String get guildMenuSettingsMembers => '成員';

  @override
  String get guildMenuSettingsInviteLinks => '邀請連結';

  @override
  String get guildMenuSettingsBans => '封鎖名單';

  @override
  String get guildSettingsNoPermission => '您沒有權限檢視此設定分頁。';

  @override
  String get guildSettingsOverviewIconTitle => '圖示';

  @override
  String get guildSettingsUploadImage => '上傳圖片';

  @override
  String get guildSettingsOverviewBannerTitle => '橫幅';

  @override
  String get guildSettingsOverviewBannerHint => '為您的伺服器上傳橫幅。';

  @override
  String get guildSettingsOverviewNameTitle => '名稱';

  @override
  String get guildSettingsOverviewNameHint => '我的超讚社群';

  @override
  String get guildSettingsOverviewStatsTitle => '統計資料';

  @override
  String get guildSettingsOverviewMembers => '成員';

  @override
  String get guildSettingsOverviewOnline => '線上';

  @override
  String get guildSettingsRolesDescription => '使用角色來分組成員並指派權限。';

  @override
  String get guildSettingsCreateRole => '建立角色';

  @override
  String get guildSettingsRolesListTitle => '角色';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '已使用 $staticCount 個靜態表情符號、$animatedCount 個動態表情符號';
  }

  @override
  String get guildSettingsEmojiEmpty => '尚未有自訂表情符號。';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '已上傳 $count 個貼圖';
  }

  @override
  String get guildSettingsStickersEmpty => '尚未有自訂貼圖。';

  @override
  String get guildSettingsModerationVerificationTitle => '成員驗證';

  @override
  String get guildSettingsModerationVerificationDescription =>
      '選擇成員在能夠發佈訊息或傳送私訊給社群成員前必須具備的條件。';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      '擁有特定身份組的成員可以略過這些檢查。對於公開空間，我們建議啟用驗證。';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      '列在「探索」中的社群需要至少驗證過的電子郵件。啟用「探索」時無法選擇「無」。';

  @override
  String get guildSettingsModerationMatureTitle => '成人內容與內容警告';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      '設定成人內容標記與成員可選的內容警告。';

  @override
  String get guildSettingsModerationMatureToggle => '成人內容';

  @override
  String get guildSettingsModerationMatureToggleDescription => '將此社群標記為包含成人內容。';

  @override
  String get guildSettingsVerificationNone => '無';

  @override
  String get guildSettingsVerificationNoneDescription => '無需驗證。';

  @override
  String get guildSettingsVerificationLow => '低';

  @override
  String get guildSettingsVerificationLowDescription => '需要已驗證的電子郵件地址。';

  @override
  String get guildSettingsVerificationMedium => '中';

  @override
  String get guildSettingsVerificationMediumDescription =>
      '需要已驗證的電子郵件地址，且帳號至少已建立 5 分鐘。';

  @override
  String get guildSettingsVerificationHigh => '高';

  @override
  String get guildSettingsVerificationHighDescription =>
      '需要中等級別的所有條件，外加已加入社群至少 10 分鐘。';

  @override
  String get guildSettingsVerificationHighest => '非常高';

  @override
  String get guildSettingsVerificationHighestDescription => '需要已驗證的手機號碼。';

  @override
  String get guildSettingsAuditLogDescription => '追蹤管理員在整個社群中的操作。';

  @override
  String get guildSettingsAuditLogEmpty => '尚無紀錄';

  @override
  String get guildSettingsAuditLogEmptyDescription => '管理操作與社群變更將顯示在此處。';

  @override
  String get guildSettingsAuditLogFilterAllUsers => '所有使用者';

  @override
  String get guildSettingsAuditLogFilterAllActions => '所有動作';

  @override
  String get guildSettingsAuditLogNoReason => '未提供原因。';

  @override
  String get guildSettingsAuditLogUnknownUser => '未知使用者';

  @override
  String get guildSettingsAuditLogLoadError => '載入活動紀錄時發生錯誤。';

  @override
  String get guildSettingsAuditLogLoadErrorTitle => '無法載入活動紀錄';

  @override
  String get guildSettingsAuditLogReason => '原因';

  @override
  String get guildSettingsAuditLogSomeone => '某人';

  @override
  String get guildSettingsAuditLogSomething => '某事';

  @override
  String get guildSettingsAuditLogUnknownEntity => '未知實體';

  @override
  String get guildSettingsAuditLogNothing => '無';

  @override
  String get guildSettingsAuditLogUnknownTarget => '未知目標';

  @override
  String get auditLogActionGuildUpdate => '社群已更新';

  @override
  String get auditLogActionChannelCreate => '頻道已建立';

  @override
  String get auditLogActionChannelUpdate => '頻道已更新';

  @override
  String get auditLogActionChannelDelete => '頻道已刪除';

  @override
  String get auditLogActionChannelOverwriteCreate => '頻道權限已新增';

  @override
  String get auditLogActionChannelOverwriteUpdate => '頻道權限已更新';

  @override
  String get auditLogActionChannelOverwriteDelete => '頻道權限已移除';

  @override
  String get auditLogActionMemberKick => '成員已被踢出';

  @override
  String get auditLogActionMemberPrune => '成員已被清除';

  @override
  String get auditLogActionMemberBanAdd => '成員已被封鎖';

  @override
  String get auditLogActionMemberBanRemove => '成員已解除封鎖';

  @override
  String get auditLogActionMemberUpdate => '成員已更新';

  @override
  String get auditLogActionMemberRoleUpdate => '成員身份組已更新';

  @override
  String get auditLogActionMemberMove => '成員已移動';

  @override
  String get auditLogActionMemberDisconnect => '成員已中斷連線';

  @override
  String get auditLogActionBotAdd => '機器人已新增';

  @override
  String get auditLogActionRoleCreate => '身份組已建立';

  @override
  String get auditLogActionRoleUpdate => '身份組已更新';

  @override
  String get auditLogActionRoleDelete => '角色已刪除';

  @override
  String get auditLogActionInviteCreate => '邀請已建立';

  @override
  String get auditLogActionInviteUpdate => '邀請已更新';

  @override
  String get auditLogActionInviteDelete => '邀請已刪除';

  @override
  String get auditLogActionWebhookCreate => 'Webhook 已建立';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook 已更新';

  @override
  String get auditLogActionWebhookDelete => 'Webhook 已刪除';

  @override
  String get auditLogActionEmojiCreate => '表情符號已建立';

  @override
  String get auditLogActionEmojiUpdate => '表情符號已更新';

  @override
  String get auditLogActionEmojiDelete => '表情符號已刪除';

  @override
  String get auditLogActionStickerCreate => '貼圖已建立';

  @override
  String get auditLogActionStickerUpdate => '貼圖已更新';

  @override
  String get auditLogActionStickerDelete => '貼圖已刪除';

  @override
  String get auditLogActionMessageDelete => '訊息已刪除';

  @override
  String get auditLogActionMessageBulkDelete => '訊息已刪除';

  @override
  String get auditLogActionMessagePin => '訊息已釘選';

  @override
  String get auditLogActionMessageUnpin => '訊息已取消釘選';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor 更新了社群設定。';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor 建立了頻道 $target。';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor 更新了頻道 $target。';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor 刪除了頻道 $target。';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor 為 $target 新增了頻道權限。';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 在 $channel 為 $target 新增了頻道權限。';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor 更新了 $target 的頻道權限。';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 在 $channel 更新了 $target 的頻道權限。';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor 移除了 $target 的頻道權限。';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 在 $channel 移除了 $target 的頻道權限。';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor 將 $target 踢出。';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor 禁止 $target 進入。';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor 解除了對 $target 的禁止。';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor 更新了 $target。';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor 更新了 $target 的角色。';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor 清除了不活躍的成員。';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor 清除了不活躍達 $days 天的成員。';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor 將 $target 移動到另一個語音頻道。';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 將 $target 移動到 $channel。';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor 將 $target 從語音斷開連接。';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor 新增了機器人 $target。';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor 建立了角色 $target。';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor 更新了角色 $target。';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor 刪除了角色 $target。';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor 建立了邀請 $target。';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 為 $channel 建立了邀請 $target。';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor 更新了邀請 $target。';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 為 $channel 更新了邀請 $target。';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor 刪除了邀請 $target。';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor 為 $channel 刪除了邀請 $target。';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor 建立了 Webhook $target。';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor 更新了 Webhook $target。';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor 刪除了 Webhook $target。';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor 新增了表情符號 $target。';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor 更新了表情符號 $target。';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor 刪除了表情符號 $target。';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor 新貼了貼圖 $target。';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor 更新了貼圖 $target。';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor 刪除了貼圖 $target。';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor 刪除了一則訊息。';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor 在 $channel 中刪除了一則訊息。';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor 刪除了多則訊息。';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor 刪除了 $count 則訊息。';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor 在 $channel 中刪除了多則訊息。';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor 在 $channel 中刪除了 $count 則訊息。';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor 釘選了一則訊息。';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor 在 $channel 中釘選了一則訊息。';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor 取消釘選了一則訊息。';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor 在 $channel 中取消釘選了一則訊息。';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor 對 $target 執行了稽核動作。';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '將 $field 從 $oldValue 更新為 $newValue。';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '將 $field 設定為 $newValue。';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '已清除 $field (原為 $oldValue)。';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '已更新 $field。';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return '將社群重新命名為 $name。';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon => '已更新社群圖示。';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return '將頻道重新命名為 $name。';
  }

  @override
  String get auditLogChangeClearedTopic => '已清除主題。';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return '已將主題更新為 $topic。';
  }

  @override
  String get auditLogChangeEnabledMatureContent => '已啟用成人內容。';

  @override
  String get auditLogChangeDisabledMatureContent => '已停用成人內容。';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return '將暱稱設定為 $nickname。';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return '已移除暱稱 $nickname。';
  }

  @override
  String get auditLogChangeMutedMember => '已將成員設為靜音。';

  @override
  String get auditLogChangeUnmutedMember => '已解除成員靜音。';

  @override
  String get auditLogChangeDeafenedMember => '已將成員設為聽障。';

  @override
  String get auditLogChangeUndeafenedMember => '已解除成員聽障。';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '已新增 $roles。';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '已移除 $roles。';
  }

  @override
  String auditLogOptionChannel(String value) {
    return '頻道：$value。';
  }

  @override
  String auditLogOptionMessage(String value) {
    return '訊息：$value。';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return '邀請者：$value。';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '刪除 # 則訊息。',
      one: '刪除 # 則訊息。',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '移除 # 位成員。',
      one: '移除 # 位成員。',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => '此邀請永不過期。';

  @override
  String get auditLogOptionTemporaryMembership => '授予臨時會員資格。';

  @override
  String get auditLogOptionPermanentMembership => '授予永久會員資格。';

  @override
  String get guildSettingsLoadMore => '載入更多';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription => '管理將訊息發佈到頻道的網頁掛鉤。';

  @override
  String get guildSettingsWebhooksEmpty => '尚未設定任何網頁掛鉤。';

  @override
  String get guildSettingsCopyUrl => '複製網址';

  @override
  String get guildSettingsCopiedUrl => '網址已複製到剪貼簿';

  @override
  String get guildSettingsDeleteWebhook => '刪除網頁掛鉤';

  @override
  String get guildSettingsVanityUrlDescription => '設定伺服器的自訂邀請連結。';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => '儲存';

  @override
  String get guildSettingsVanityUrlUsageTitle => '使用狀況';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count 次使用';
  }

  @override
  String get guildSettingsDiscoveryDescription => '申請列在伺服器探索中。';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return '申請至少需要 $count 位成員。';
  }

  @override
  String get guildSettingsDiscoveryCategory => '類別';

  @override
  String get guildSettingsDiscoveryDescriptionField => '說明';

  @override
  String get guildSettingsDiscoveryTags => '標籤';

  @override
  String get guildSettingsDiscoveryTagsHint => '遊戲、藝術、音樂';

  @override
  String get guildSettingsDiscoveryApply => '提交申請';

  @override
  String get guildSettingsDiscoveryWithdraw => '撤回';

  @override
  String get guildSettingsMembersDescription => '搜尋並管理伺服器成員。';

  @override
  String get guildSettingsMembersSearchHint => '搜尋成員';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count 位成員';
  }

  @override
  String get guildSettingsMembersSortNewest => '最新優先';

  @override
  String get guildSettingsInvitesDescription => '檢視並撤銷有效的邀請連結。';

  @override
  String get guildSettingsInvitesEmpty => '沒有作用中的邀請。';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses 次使用';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return '將於 $date 到期';
  }

  @override
  String get guildSettingsBansDescription => '檢視並管理被封鎖的使用者。';

  @override
  String get guildSettingsBansSearchHint => '搜尋封鎖';

  @override
  String get guildSettingsBansEmpty => '沒有被封鎖的使用者。';

  @override
  String get guildSettingsBanPermanent => '永久封鎖';

  @override
  String guildSettingsBanExpires(String date) {
    return '將於 $date 到期';
  }

  @override
  String get guildSettingsBanExpiresLabel => '到期';

  @override
  String get guildSettingsUnban => '解除封鎖';

  @override
  String get guildSettingsBansLoading => '正在載入被封鎖的使用者';

  @override
  String get guildSettingsBansNoSearchResults => '找不到符合您搜尋條件的封鎖。';

  @override
  String get guildSettingsBanDetailsTitle => '封鎖詳細資訊';

  @override
  String get guildSettingsBanViewDetails => '檢視詳細資訊';

  @override
  String get guildSettingsBannedOn => '封鎖日期';

  @override
  String get guildSettingsBannedBy => '封鎖者';

  @override
  String get guildSettingsRevokeBanTitle => '撤銷封鎖';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return '確定要撤銷對 $displayName 的封鎖嗎？他們將能夠重新加入社群。';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return '已撤銷對 $displayName 的封鎖';
  }

  @override
  String get guildSettingsBansLoadError => '無法載入封鎖。請再試一次。';

  @override
  String get guildSettingsRevokeBanError => '無法撤銷封鎖。請再試一次。';

  @override
  String get guildSettingsCommunitySettings => '社群設定';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewDescription => '管理您的社群個人資料、頻道和預設設定。';

  @override
  String get guildSettingsOverviewBrandingTitle => '品牌';

  @override
  String get guildSettingsOverviewBrandingDescription => '更新您的圖示、名稱、橫幅和邀請背景';

  @override
  String get guildSettingsOverviewBannerUpload => '上傳橫幅';

  @override
  String get guildSettingsOverviewIdleTitle => '閒置設定';

  @override
  String get guildSettingsOverviewIdleDescription => '設定 AFK 頻道和逾時';

  @override
  String get guildSettingsOverviewSystemTitle => '系統與歡迎訊息';

  @override
  String get guildSettingsOverviewSystemDescription => '選擇系統和歡迎訊息的目的地';

  @override
  String get guildSettingsOverviewNotificationsTitle => '預設通知';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      '超過 250 人的社群會被強制設為「僅提及」設定。您的原始設定將會保留，並在社群人數低於 250 人時恢復。';

  @override
  String get guildSettingsOverviewAdvancedTitle => '進階';

  @override
  String get guildSettingsOverviewFlexibleNames => '允許彈性的文字頻道名稱';

  @override
  String get guildSettingsOverviewHideOwnerCrown => '隱藏社群擁有者皇冠';

  @override
  String get guildSettingsOverviewDetachedBanner => '獨立顯示橫幅';

  @override
  String get guildSettingsOverviewDetachedBannerHint => '在社群標頭下方以獨立區塊顯示橫幅。';

  @override
  String get guildSettingsOverviewUploadIcon => '上傳圖示';

  @override
  String get guildSettingsOverviewRemoveImage => '移除';

  @override
  String get guildSettingsOverviewSplashTitle => '邀請背景';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => '聊天嵌入背景';

  @override
  String get guildSettingsOverviewEmbedSplashHint => '顯示在聊天中的邀請嵌入。';

  @override
  String get guildSettingsOverviewUploadBackground => '上傳背景';

  @override
  String get guildSettingsOverviewNoCommunityBanner => '無社群橫幅';

  @override
  String get guildSettingsOverviewNoInviteBackground => '無邀請背景';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => '預覽';

  @override
  String get guildSettingsOverviewInvitePreviewHint => '查看你的邀請對訪客的樣子。';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => '文字頻道名稱';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => '社群擁有者皇冠';

  @override
  String get guildSettingsOverviewOwnerCrownDescription => '設定是否在社群擁有者旁邊顯示皇冠圖示';

  @override
  String get guildSettingsSplashCardAlignment => '卡片對齊';

  @override
  String get guildSettingsSplashAlignmentCenter => '置中';

  @override
  String get guildSettingsSplashAlignmentLeft => '靠左';

  @override
  String get guildSettingsSplashAlignmentRight => '靠右';

  @override
  String get guildSettingsSplashAlignmentHint => '僅適用於寬螢幕。';

  @override
  String get permissionReadMessageHistory => '讀取訊息歷史';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return '變更未擁有「$permission」權限的使用者可見內容';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return '使用專用彈出視窗，為沒有「$permission」權限的成員設定訊息歷史記錄的門檻日期。';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen => '開啟訊息歷史記錄門檻';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => '訊息歷史記錄門檻';

  @override
  String get guildSettingsMessageHistoryThresholdEnable => '啟用訊息歷史記錄門檻';

  @override
  String get guildSettingsMessageHistoryThresholdDate => '門檻日期';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      '沒有「讀取訊息歷史」權限的成員可查看此日期之後傳送的訊息。';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated => '訊息歷史記錄門檻已更新';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      '允許在文字頻道名稱中使用大寫字母和空格。關閉時，名稱僅限小寫並使用連字號和底線。';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint => '隱藏社群擁有者旁邊的皇冠圖示。';

  @override
  String get guildSettingsAnimatedIconRequiresFeature => '動畫圖示需要「動畫圖示」社群功能。';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature => '動畫橫幅需要「動畫橫幅」社群功能。';

  @override
  String get guildSettingsAfkChannel => 'AFK / 閒置頻道';

  @override
  String get guildSettingsAfkChannelHint => '當成員處於 AFK 狀態時，將他們移至此頻道。';

  @override
  String get guildSettingsNoAfkChannel => '無 AFK 頻道';

  @override
  String get guildSettingsAfkTimeout => 'AFK 超時';

  @override
  String get guildSettingsAfkTimeout1Min => '1 分鐘';

  @override
  String get guildSettingsAfkTimeout5Min => '5 分鐘';

  @override
  String get guildSettingsAfkTimeout15Min => '15 分鐘';

  @override
  String get guildSettingsAfkTimeout30Min => '30 分鐘';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 小時';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get guildSettingsSystemChannel => '目的地頻道';

  @override
  String get guildSettingsSystemChannelHint => '歡迎訊息和系統訊息將顯示在此。';

  @override
  String get guildSettingsNoSystemChannel => '無系統頻道';

  @override
  String get guildSettingsHideJoinMessages => '隱藏加入訊息';

  @override
  String get guildSettingsHideJoinMessagesHint => '隱藏目標頻道的加入訊息。';

  @override
  String get guildSettingsDefaultNotifications => '預設通知設定';

  @override
  String get guildSettingsNotificationsAll => '所有訊息';

  @override
  String get guildSettingsNotificationsAllDescription => '通知所有訊息';

  @override
  String get guildSettingsNotificationsMentions => '僅提及';

  @override
  String get guildSettingsNotificationsMentionsDescription => '僅通知提及';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG、PNG、WebP、AVIF。上限 10MB。最低：960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG、PNG、WebP、AVIF。上限 10MB。最低：960×540px (16:9)。顯示於聊天中的邀請嵌入內容。';

  @override
  String get guildSettingsModerationDescription => '設定驗證、內容篩選及成人內容設定。';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      '列於 Discovery 中的社群有受限的內容管理選項。';

  @override
  String get guildSettingsModerationContentFilterTitle => '內容篩選';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      '自動篩選未標示為成人內容頻道的訊息中的露骨內容。';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      '列於 Discovery 中的社群必須掃描所有成員。啟用 Discovery 時無法變更此設定。';

  @override
  String get guildSettingsContentFilterOff => '關閉';

  @override
  String get guildSettingsContentFilterOffDescription => '讓社群自行管理';

  @override
  String get guildSettingsContentFilterNoRole => '篩選沒有角色的成員';

  @override
  String get guildSettingsContentFilterNoRoleDescription => '建議用於大多數社群';

  @override
  String get guildSettingsContentFilterAll => '篩選所有人';

  @override
  String get guildSettingsContentFilterAllDescription => '為適合全家觀看的空間提供最高等級的保護';

  @override
  String get guildSettingsModerationMatureOff => '關閉';

  @override
  String get guildSettingsModerationMatureOn => '開啟';

  @override
  String get guildSettingsContentWarningToggle => '顯示內容警告';

  @override
  String get guildSettingsContentWarningToggleDescription => '在進入任何頻道前切換同意提示';

  @override
  String get guildSettingsContentWarningText => '自訂警告文字';

  @override
  String get guildSettingsContentWarningTextPlaceholder => '此內容包含敏感資訊。';

  @override
  String get guildSettingsModeration2faTitle => '2FA 要求';

  @override
  String get guildSettingsModeration2faDescription =>
      '要求管理員在封鎖、踢出、暫停或移除訊息前啟用雙重驗證。';

  @override
  String get guildSettingsModeration2faSwitchLabel => '要求管理動作啟用 2FA';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip => '僅社群擁有者可變更此設定';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      '請先啟用您帳戶的 2FA 以變更此設定';

  @override
  String get guildSettingsEmojiSearchHint => '搜尋表情符號';

  @override
  String get guildSettingsEmojiUploadTitle => '上傳表情符號';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return '非動態表情符號 ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return '動態表情符號 ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => '搜尋貼圖';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return '從頻道設定建立網頁掛鉤。在此編輯。';
  }

  @override
  String get guildSettingsVanityUrlWarning => '除非至少有一個頻道對所有人可見，否則您的自訂網址將無法運作。';

  @override
  String get guildSettingsVanityUrlRemove => '移除';

  @override
  String get guildSettingsBannedUsersTitle => '被封鎖的使用者';

  @override
  String get guildSettingsInvitesTableInviter => '邀請者';

  @override
  String get guildSettingsInvitesTableChannel => '頻道';

  @override
  String get guildSettingsInvitesTableCode => '代碼';

  @override
  String get guildSettingsInvitesTableUses => '使用次數';

  @override
  String get guildSettingsInvitesTableCreated => '建立時間';

  @override
  String get guildSettingsAuditLogFilterUser => '依使用者篩選';

  @override
  String get guildSettingsAuditLogFilterAction => '依動作篩選';
}
