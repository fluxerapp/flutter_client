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
  String get reconnectingBody => '实例出现问题。\n很快就会修复！';

  @override
  String get gatewayReconnectingToast => '正在重新连接…';

  @override
  String get gatewayConnectedToast => '已连接';

  @override
  String get sessionExpiredToast => '您的会话已过期。请重新登录。';

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
  String get nagbarLearnMore => '了解详情';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return '系统维护计划于 $localizedTime 进行。预计持续时间：$duration。';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return '维护正在进行中。预计持续时间：$duration。';
  }

  @override
  String get nagbarMaintenanceComplete => '维护已完成。';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return '嘿，$displayName，请认领你的帐户，以免失去访问权限。';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return '嘿，$displayName，请验证你的电子邮件地址。';
  }

  @override
  String get nagbarOpenSettings => '打开设置';

  @override
  String get systemPermissionSettingsTitle => '启用权限';

  @override
  String get systemPermissionSettingsOpenSettings => '打开设置';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName 没有麦克风访问权限。你可以在设备隐私设置中启用它。';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName 没有相机访问权限。您可以在设备隐私设置中启用它。';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName 未获得访问您照片图库的权限。您可以在设备隐私设置中启用它。';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName 没有发送通知的权限。你可以在设备设置中启用它。';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return '您的订阅续订失败，但您仍可享受 $productName 福利直至 $graceDate。请立即采取行动，否则将失去所有福利。';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return '您的 $productName 订阅已过期。立即续订以保留您的会员权益。';
  }

  @override
  String get nagbarManageSubscription => '管理订阅';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return '欢迎使用 $productFullName。探索您的 $productName 福利并管理您的订阅。';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return '查看 $productName 功能';
  }

  @override
  String get nagbarGiftInventoryOne => '您有一个新的礼品码在您的礼品库中等待领取。';

  @override
  String nagbarGiftInventoryMany(int count) {
    return '您有 $count 个新的礼品码在您的礼品库中等待领取。';
  }

  @override
  String get nagbarViewGiftInventory => '查看礼物库存';

  @override
  String get nagbarVisionaryMfa => '启用双重身份验证以保护你的 Visionary 账户。';

  @override
  String get nagbarEnableMfa => '启用双重验证';

  @override
  String get nagbarTermsAcceptance => '我们已更新条款。请查看并接受，以继续使用。';

  @override
  String get nagbarReviewTerms => '查看条款';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return '加入 $communityName，与团队聊天并获取最新资讯。';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return '加入 $communityName';
  }

  @override
  String get nagbarPushNotification => '开启通知，以免错过消息和提及。';

  @override
  String get nagbarEnableNotifications => '开启通知';

  @override
  String get nagbarBillingPortalFailed => '无法打开账单门户。请稍后重试。';

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
  String get next => '下一步';

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
  String get registerPendingApproval => '你的账号申请正在等待审核。管理员批准后即可登录。';

  @override
  String get registerClosed => '当前已关闭注册。请使用管理员提供的注册链接创建账号。';

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
  String get errorServiceUnavailable => '此实例暂时不可用。请稍后重试。';

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
  String get embedInviteJoinGroup => '加入群聊';

  @override
  String get embedInviteAlreadyJoined => '已加入';

  @override
  String get embedInviteDisabled => '邀请已禁用';

  @override
  String get embedInvitePaused => '本社区已暂停邀请。';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName 检测到潜在的恶意攻击，因此新用户暂时无法加入。';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain => '该社群已暂停邀请。请稍后重试。';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName 在此社群中检测到潜在的恶意攻击。邀请已暂停，因此新用户暂时无法加入。';
  }

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
  String get invalidDeepLinkTitle => '链接无法打开';

  @override
  String get invalidDeepLinkDescription =>
      '此链接可能已损坏、仅在网上可用，或者您没有访问权限。请检查链接后重试。';

  @override
  String get invalidDeepLinkGoHomeButton => '前往首页';

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
    return '愿景家（永久 $productName）';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天 $productName',
      one: '1 天 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 周 $productName',
      one: '1 周 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个月 $productName',
      one: '1 个月 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 年 $productName',
      one: '1 年 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return '来自 $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => '点击领取礼物！';

  @override
  String get embedGiftAlreadyRedeemed => '已兑换';

  @override
  String get embedGiftClaimAccountHelp => '请先注册账户，然后领取礼物。';

  @override
  String get embedGiftClaim => '领取礼物';

  @override
  String get embedGiftClaimed => '礼物已领取';

  @override
  String get embedGiftClaimAccount => '登录账号领取';

  @override
  String get embedGiftUnknownTitle => '未知礼物';

  @override
  String get embedGiftUnknownSubtitle => '此礼物码无效或已被领取。';

  @override
  String get embedGiftUnavailable => '礼物不可用';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return '领取您的礼物，以激活您的 $productName 订阅！';
  }

  @override
  String get giftAcceptAlreadyClaimed => '此礼物已被领取。';

  @override
  String get giftAcceptMaybeLater => '稍后';

  @override
  String get giftRedeemedToast => '礼品已兑换！';

  @override
  String get giftRedeemInvalidTitle => '无效的礼物码';

  @override
  String get giftRedeemInvalidMessage => '此兑换码无效或已被使用。';

  @override
  String get giftRedeemAlreadyRedeemedTitle => '礼物已兑换';

  @override
  String get giftRedeemAlreadyRedeemedMessage => '此兑换码已被使用。';

  @override
  String get giftRedeemNotFoundTitle => '未找到礼物';

  @override
  String get giftRedeemNotFoundMessage => '此兑换码不存在。';

  @override
  String get giftRedeemFailedTitle => '无法兑换礼品';

  @override
  String get giftRedeemFailedMessage => '无法兑换此礼物。请重试。';

  @override
  String get giftVisionaryCannotRedeemTitle => '无法兑换此礼品';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary 账户无法兑换 Plutonium 礼物。请复制链接分享给朋友。';

  @override
  String get giftCopyLink => '复制赠礼链接';

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
  String get notificationUseCategoryDefault => '使用分类默认设置';

  @override
  String get notificationUseCommunityDefault => '使用社区默认设置';

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
  String get dmDeleteMyMessagesTitle => '删除您在此对话中的消息？';

  @override
  String get dmDeleteMyMessagesDescription => '此操作将永久删除您在此对话中发送过的所有消息，且无法撤销。';

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
  String get dmUnnamedGroup => '未命名群组';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName的群组';
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
  String get dmDebugCategory => '调试分类';

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
  String get addFriendVerifyToSend => '请先验证你的邮箱，然后才能发送好友请求。';

  @override
  String get addFriendFriendsListFull => '您的好友列表已满，或对方的好友列表已满。请移除一些好友后再试。';

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
    return '这是 $productName 上的默认表情符号。';
  }

  @override
  String get emojiInfoCustomGuildDescription => '此表情符号来自该社区。您可以在任何地方使用它。';

  @override
  String get emojiInfoCustomUnknownDescription => '这是社群中的自定义表情。';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      '这是社群中的自定义表情。请联系作者，获取邀请以使用此表情。';

  @override
  String get emojiInfoFromHeader => '此表情符号来自';

  @override
  String get emojiInfoDiscoverableCommunity => '可发现的社群';

  @override
  String get emojiInfoPrivateCommunity => '私有社区';

  @override
  String get emojiInfoVerifiedCommunity => '已认证社群';

  @override
  String get emojiInfoAddToFavorites => '添加到收藏夹';

  @override
  String get emojiInfoRemoveFromFavorites => '从收藏夹中移除';

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
  String get gifPickerFavoritesEmptyTitle => '暂无收藏的 GIF';

  @override
  String get gifPickerFavoritesEmptyDescription => '收藏 GIF 即可在此处查看。';

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
  String get phoneAddFooter =>
      '我们将发送短信验证码（如果可用）。您的号码不会与您的帐户关联。我们仅保留一个加密标记，不含用户 ID，以便在约 30 天内最多进行 2 次验证。';

  @override
  String get phoneAddSendCode => '发送验证码';

  @override
  String get phoneVerifyTitle => '验证手机号码';

  @override
  String get phoneVerifyDescription => '输入发送到您手机号码的验证码。';

  @override
  String get phoneAddSuccess => '手机号已验证';

  @override
  String get phoneCountryLabel => '国家/地区';

  @override
  String get phoneSearchCountries => '搜索国家/地区…';

  @override
  String get phoneNumberRequired => '需要手机号';

  @override
  String get phoneEnterValidNumber => '请输入有效的手机号码。';

  @override
  String get phoneCannotBeUsed => '此电话号码无法使用。请尝试其他手机号码或联系客服。';

  @override
  String get phoneAlreadyUsed => '此电话号码已被使用。请尝试其他号码或联系客服。';

  @override
  String get phoneCodeDidNotWork => '验证码无效。请检查后重试。';

  @override
  String get phoneTooManyAttempts => '尝试次数过多。请稍等片刻，然后重试。';

  @override
  String get phoneSmsUnavailable => '短信验证暂时不可用。请稍后重试或联系客服。';

  @override
  String get phoneNotEligible => '此账号无法进行手机验证。请使用其他方式或联系客服。';

  @override
  String get phoneCaptchaRequired => '电话验证前需要进行浏览器检查。请从登录页面重试，或联系客服。';

  @override
  String get phoneSomethingWentWrong => '出错了。请再试一次。';

  @override
  String get phoneInboundExpensiveDescription =>
      '发送短信到此号码费用过高，因此我们需要您改用短信联系我们。您也可以联系客服，要求我们为您解除此项要求。';

  @override
  String get phoneInboundDefaultDescription => '我们需要您发送一条短信来验证您的手机号码。';

  @override
  String get phoneInboundStepOpenMessaging => '打开手机短信应用，创建一条新短信。';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return '发送验证码 $code 到 $number。';
  }

  @override
  String get phoneInboundStepWait => '请等待我们收到您的消息。这可能需要一分钟。';

  @override
  String get phoneInboundGetNewCode => '获取新验证码';

  @override
  String get phoneInboundChallengeCodeLabel => '发送代码';

  @override
  String get phoneInboundOurNumberLabel => '发送至';

  @override
  String get requiredActionTitle => '需要验证账号';

  @override
  String requiredActionIntroGeneric(String productName) {
    return '请完成必要的验证，以继续使用$productName。';
  }

  @override
  String get requiredActionIntroPhone => '为防止垃圾信息，你需要先完成一项额外的安全验证，然后才能继续。';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return '请验证您的邮箱或手机，以继续使用$productName。';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return '请完成以下所需的邮箱和手机验证步骤，以继续使用 $productName。';
  }

  @override
  String get requiredActionChooseMethodTitle => '选择验证方式';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return '请完成以下任一验证路径，以继续使用 $productName。';
  }

  @override
  String get requiredActionUseEmail => '使用邮箱';

  @override
  String get requiredActionUsePhone => '使用手机';

  @override
  String get requiredActionCheckEmailTitle => '检查你的邮箱';

  @override
  String get requiredActionCheckEmailDescription => '我们已向您的邮箱发送了验证链接。请打开它以继续。';

  @override
  String get requiredActionResendVerificationEmail => '重新发送验证邮件';

  @override
  String get requiredActionVerificationEmailSent => '验证邮件已发送。请检查你的收件箱。';

  @override
  String get requiredActionSignOut => '退出登录';

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
  String get networkErrorMessage => '出错了。请重试。';

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
      other: '$count周前',
      one: '1周前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分钟后',
      one: '1分钟后',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count小时内',
      one: '1小时内',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count天后',
      one: '明天',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count周后',
      one: '1周后',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个月后',
      one: '1个月后',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '在 $count 年后',
      one: '1年后',
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
  String get userProfileLoading => '正在加载个人资料';

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
  String get userProfileRoles => '角色';

  @override
  String get memberRoleAdd => '添加身份组';

  @override
  String memberRoleRemove(String roleName) {
    return '移除角色\"$roleName\"';
  }

  @override
  String get userProfileNoRolesInCommunity => '该用户在此社群中没有角色。';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return '暂无身份组。在$rolesSettingsPath中添加身份组';
  }

  @override
  String get memberRolesNoRolesAvailable => '暂无角色';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return '此社区暂时没有可分配的角色，但您可以在 $rolesSettingsPath 中创建新角色。';
  }

  @override
  String get guildSettingsTitle => '社群设置';

  @override
  String get guildSettingsRolesTab => '角色';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => '当地时间';

  @override
  String get userProfileSameTimeAsYou => '与您时区相同';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '比你快 $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '比你晚 $duration';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours小时',
      one: '1小时',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes分钟',
      one: '1分钟',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours小时',
      one: '1小时',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes 分钟',
      one: '1 分钟',
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
  String get iarReportGuildTitle => '举报社群';

  @override
  String get iarReportGuildPreconfirmBody =>
      '如果举报内容是此社群中的某条消息，请改为举报该消息。举报消息能为我们的安全团队提供最清晰的上下文，在评论中添加详细信息有助于我们更快地审核。仅当举报消息无法涵盖更广泛的问题时，才继续举报整个社群。';

  @override
  String get iarContinueToReportCommunity => '继续举报社群';

  @override
  String get iarPreviewCommunitySubtitle => '社群';

  @override
  String get iarReasonHarassmentGuildLabel => '骚扰或恶意辱骂';

  @override
  String get iarReasonHarassmentGuildDescription => '社群容易出现群起攻击或恶意骚扰。';

  @override
  String get iarReasonHateGuildDescription => '宣扬对受保护群体的仇恨。';

  @override
  String get iarReasonTerrorismLabel => '恐怖主义或暴力极端主义';

  @override
  String get iarReasonTerrorismDescription => '宣扬、招募或协调暴力极端主义活动。';

  @override
  String get iarReasonMatureContentGuildLabel => '成人内容或不安全的分级';

  @override
  String get iarReasonMatureContentGuildDescription => '未正确设置门槛的成人内容。';

  @override
  String get iarReasonChildSafetyGuildDescription => '危害未成年人或包含儿童色情内容.';

  @override
  String get iarReasonRaidLabel => '组织突袭';

  @override
  String get iarReasonRaidDescription => '协调针对个人或社群的突袭、围攻或骚扰行为。';

  @override
  String get iarReasonSpamGuildDescription => '社群存在是为了发送垃圾信息、诈骗或滥用平台。';

  @override
  String get iarReasonMalwareGuildLabel => '分发恶意软件';

  @override
  String get iarReasonMalwareGuildDescription => '传播恶意软件、窃取凭据或有害文件。';

  @override
  String get iarReasonPrivacyGuildLabel => '侵犯隐私或人肉搜索';

  @override
  String get iarReasonPrivacyGuildDescription => '分享个人信息、跟踪用户或协同侵犯隐私。';

  @override
  String get iarReasonSelfHarmGuildLabel => '鼓励自残';

  @override
  String get iarReasonSelfHarmGuildDescription => '宣扬自杀、自残或饮食失调。';

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
  String get slowmodeStatusEnabled => '慢速模式已启用';

  @override
  String slowmodeStatusActive(String remaining) {
    return '慢速模式生效中（$remaining）';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return '慢速模式已设置为 $durationLabel，但您不受限制。';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return '慢速模式已设置为 $durationLabel。请等待后再发送下一条消息。';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return '此频道的慢速模式已设置为 $durationLabel。';
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
  String get voiceMessageHoldHint => '按住录音。拖到垃圾桶可删除，向上滑动可锁定，或松开即可发送。';

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
  String get voiceMessageSeekForward => '快进';

  @override
  String get voiceMessageSeekBackward => '后退';

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
  String get chatAttachmentDownloadedToast => '已保存到照片';

  @override
  String get chatAttachmentDownloadFailedToast => '无法下载附件';

  @override
  String get chatAttachmentExpiredTooltip => '附件已过期';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '展开 ($count 行)',
      one: '展开 ($count 行)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '折叠 ($count 行)',
      one: '折叠 ($count 行)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '展开（$count 行）',
      one: '展开（$count 行）',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '收起 ($count 行)',
      one: '收起 ($count 行)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '...（还剩 $count 行）',
      one: '...（还剩 $count 行）',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '...（还剩 $count 行）',
      one: '...（还剩 $count 行）',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => '查看完整文件';

  @override
  String get chatTextualPreviewChangeLanguage => '更改语言';

  @override
  String get chatTextualPreviewSearchLanguage => '搜索语言…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => '语法高亮';

  @override
  String get chatTextualPreviewNoLanguagesFound => '无结果';

  @override
  String get chatTextualPreviewMoreOptions => '更多选项';

  @override
  String get chatTextualPreviewWrapText => '自动换行';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return '文件过大，无法内联预览（限制为 $previewLimitKb KB）。';
  }

  @override
  String get chatTextualPreviewLoadError => '无法加载预览。';

  @override
  String get chatTextualPreviewLanguagePlaintext => '纯文本';

  @override
  String get chatTextualPreviewCopy => '复制';

  @override
  String get chatAttachmentSourceGallery => '图库';

  @override
  String get chatAttachmentSourceCamera => '相机';

  @override
  String get chatAttachmentSourceBrowse => '浏览文件';

  @override
  String get chatAttachmentPasteTooltip => '从剪贴板粘贴文件';

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
  String get lookAndFeelHdrSectionTitle => '高动态范围';

  @override
  String get lookAndFeelHdrSectionDescription => '控制 HDR 图像在支持 HDR 的显示器上的显示方式。';

  @override
  String get lookAndFeelHdrFullName => '全动态范围';

  @override
  String get lookAndFeelHdrFullDescription => '以全亮度、全色域显示 HDR 图像。';

  @override
  String get lookAndFeelHdrStandardName => '标准范围';

  @override
  String get lookAndFeelHdrStandardDescription => '将 HDR 图像色调映射到标准范围，降低峰值亮度。';

  @override
  String get lookAndFeelHdrDisplayModeLabel => '高动态范围显示模式';

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
  String get lookAndFeelChatFontScalingTitle => '聊天字体大小';

  @override
  String get lookAndFeelChatFontScalingDescription => '调整聊天区域的字体大小。';

  @override
  String get lookAndFeelChatFontSizeLabel => '聊天字体大小';

  @override
  String get lookAndFeelAppZoomTitle => '应用缩放级别';

  @override
  String get lookAndFeelAppZoomDescription => '调整应用缩放级别。';

  @override
  String get lookAndFeelChatWallpaperTitle => '聊天背景';

  @override
  String get lookAndFeelChatWallpaperDescription => '为聊天选择背景。此背景将保留在此设备上。';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip => '此设置保留在此设备上';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      '聊天壁纸仅保存在此设备上，不会同步到其他设备。';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => '默认';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => '自定义图片';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return '颜色 $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return '渐变 $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => '壁纸调暗';

  @override
  String get lookAndFeelChatWallpaperPickFailed => '无法将此图片设为你的壁纸。';

  @override
  String get lookAndFeelMessagesSectionTitle => '消息';

  @override
  String get lookAndFeelMessagesSectionDescription => '选择聊天频道中消息的显示方式。';

  @override
  String get lookAndFeelMessageGroupSpacingLabel => '消息组间距';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing像素';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => '消息显示模式';

  @override
  String get lookAndFeelMessageDisplayComfyName => '舒适';

  @override
  String get lookAndFeelMessageDisplayComfyDescription => '宽敞的布局，消息之间视觉分隔清晰。';

  @override
  String get lookAndFeelMessageDisplayDenseName => '紧凑';

  @override
  String get lookAndFeelMessageDisplayDenseDescription => '以最小间距显示更多消息。';

  @override
  String get lookAndFeelHideUserAvatarsLabel => '隐藏用户头像';

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
  String get communityTemporarilyUnavailable => '社群暂时不可用';

  @override
  String get guildUnavailableDescription => '出错了，我们正在修复。';

  @override
  String get guildNotFoundTitle => '此社群并非您要寻找的社群。';

  @override
  String get guildNotFoundDescription => '您要找的社群可能已被删除，或者您没有访问权限。';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName目前仅供$productName员工访问';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => '暂时不可用';

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
  String get favoritesAddToSavedMedia => '添加到收藏';

  @override
  String get favoritesRemoveFromSavedMedia => '从已保存的媒体中移除';

  @override
  String get favoritesAddToUrlOnlyGifFavorites => '添加到仅限 URL 的 GIF 收藏夹';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites => '从仅 URL GIF 收藏夹中移除';

  @override
  String get savedMediaAddTitle => '添加到收藏';

  @override
  String get savedMediaFormNameLabel => '名称';

  @override
  String get savedMediaFormNameHint => '我的精彩媒体';

  @override
  String get savedMediaFormAltTextLabel => '替代文本';

  @override
  String get savedMediaFormAltTextHint => '描述媒体内容';

  @override
  String get savedMediaFormTagsLabel => '标签';

  @override
  String get savedMediaFormTagsHint => '有趣，反应，工作';

  @override
  String get savedMediaSaveError => '无法更新已保存的媒体。';

  @override
  String get savedMediaNameRequired => '名称为必填项。';

  @override
  String get gifFavoriteFirstTimeTitle => '我们应该如何保存您收藏的 GIF？';

  @override
  String get gifFavoriteFirstTimeDescription =>
      '您可以将收藏的 GIF 以纯 URL 的形式收藏，或上传到您的媒体库。选择适合您使用习惯的方式。您随时可以在“设置”>“高级”>“媒体”中更改此设置。';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL 收藏（默认）：跨设备同步，无需上传，不计入已保存媒体。如果原始媒体被托管方移除，可能会消失。';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      '已保存媒体：可上传、可标记、可搜索、永久保存，但会占用你的已保存媒体额度。';

  @override
  String get gifFavoriteFirstTimeHint => '我们只会问一次。';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => '仅使用网址（推荐）';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => '使用已保存的媒体';

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
  String get messagesMediaCameraUploadsSectionTitle => '相机上传';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      '选择是否将使用应用内相机拍摄的照片和视频保留在您的设备上';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => '保存到设备';

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
  String get accessibilitySaturationTitle => '饱和度';

  @override
  String get accessibilitySaturationDescription => '调整应用主题颜色的鲜艳程度。';

  @override
  String get accessibilityVisualGroupTitle => '视觉';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => '始终显示链接下划线';

  @override
  String get accessibilityDimStrikethroughTextLabel => '调暗删除线文本';

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
  String get accessibilityScreenReaderGroupTitle => '屏幕阅读器';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return '控制 $productName 与屏幕阅读器的配合方式。';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel => '朗读新消息';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      '当新消息到达开放频道时，屏幕阅读器会朗读。通知声音不受影响。';

  @override
  String get accessibilityTtsGroupTitle => '文字转语音';

  @override
  String get accessibilityTtsGroupDescription => '为语音文本选择语速。';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => '语音播放速度';

  @override
  String get accessibilityTtsPlaySampleLabel => '播放示例';

  @override
  String get accessibilityTtsSilenceSampleLabel => '静音示例';

  @override
  String get accessibilityPreviewButtonLabel => '预览按钮';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return '链接显示效果如下：$linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => '预览用户';

  @override
  String get accessibilityKeyboardGroupTitle => '键盘';

  @override
  String get accessibilityShowTextareaFocusRingLabel => '在聊天输入框中显示焦点环';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel => '按 Esc 键退出键盘模式';

  @override
  String get accessibilityShowContextMenuShortcutsLabel => '显示上下文菜单快捷方式';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel => '通话前确认';

  @override
  String get accessibilityAnimationGroupTitle => '动画';

  @override
  String get accessibilityReducedMotionActiveNote =>
      '已开启减弱动态效果，因此内容动画默认暂停。您仍然可以重新开启任何动画以继续播放。';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => '播放动态表情';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => '自动播放GIF';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return '当 $productName 处于焦点时自动播放 GIF';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion => '正在播放，尽管已开启减弱动态效果。';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      '已因减少动态效果而暂停。开启后可继续播放动态表情。';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      '因“减少动态效果”而暂停。开启后可继续播放 GIF。';

  @override
  String get accessibilityGifDefaultsOffOnMobile => '移动设备上默认关闭，以节省电量和流量。';

  @override
  String get accessibilityStickerAnimationsTitle => '贴纸动画';

  @override
  String get accessibilityStickerAnimationPreferenceLabel => '贴纸动画偏好设置';

  @override
  String get accessibilityStickerAlwaysAnimateName => '始终播放动画';

  @override
  String get accessibilityStickerAlwaysAnimateDescription => '贴纸始终播放动画';

  @override
  String get accessibilityStickerAnimateOnInteractionName => '互动时播放动画';

  @override
  String get accessibilityStickerAnimateOnPressDescription => '点按贴纸时播放动画';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      '鼠标悬停或互动时，表情包会动起来';

  @override
  String get accessibilityStickerNeverAnimateName => '永不播放动画';

  @override
  String get accessibilityStickerNeverAnimateDescription => '贴纸永不播放动画';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      '即使开启了“减少动态效果”，贴纸仍会始终播放动画。';

  @override
  String get accessibilityStickersReducedMotionHint =>
      '开启“减少动态效果”后，贴纸仅在互动时播放动画。选择“始终播放动画”可覆盖此设置。';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      '在移动设备上，默认仅在交互时播放动画，以节省电量。';

  @override
  String get accessibilityMotionGroupTitle => '动态效果';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel => '同步系统减弱动态效果设置';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      '使用此设备的系统减弱动态效果偏好设置，或在下方自定义。';

  @override
  String get accessibilityReducedMotionOverrideLabel => '减少动态效果';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      '禁用动画和过渡效果。当前由您的系统设置控制。';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      '禁用应用内的动画和过渡效果。';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      '在“动画”选项卡中，您可以控制动效表情、GIF 和贴纸。';

  @override
  String get accessibilityConfirmStartCallTitle => '开始通话？';

  @override
  String get accessibilityConfirmStartCallDescription => '确定要开始此通话吗？';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => '发起通话';

  @override
  String get accessibilityTtsSampleDescription => '以所选语速播放示例语句。';

  @override
  String get accessibilityTtsSampleText =>
      '博士，我来自未来。我乘坐您发明的时光机来到这里。现在，我需要您的帮助才能回到1985年。';

  @override
  String get accessibilityTtsUnsupportedDescription => '此设备无法使用语音合成。';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      '语音播放失败。请重试，或检查音频输出是否正常。';

  @override
  String get ttsSubstitutionUnknownUser => '未知用户';

  @override
  String get ttsSubstitutionUnknownRole => '未知角色';

  @override
  String get ttsSubstitutionUnknownChannel => '未知频道';

  @override
  String get ttsSubstitutionCodeBlock => '代码块';

  @override
  String get ttsSubstitutionSpoiler => '剧透';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '表情符号 $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/$commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName说：$formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return '回复$replyAuthorName：$authorName说：$formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName$description';
  }

  @override
  String get ttsSentSticker => '发送了一个表情包';

  @override
  String get ttsSentAttachment => '发送了附件';

  @override
  String ttsSentAttachments(int count) {
    return '发送了 $count 个附件';
  }

  @override
  String get ttsSentEmbed => '发送了嵌入消息';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author 发送了 $summary';
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
  String get systemCallJoinTheCall => '加入通话';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username 发起了通话，通话时长为 $duration。';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return '你错过了 $username 的通话，通话时长为 $duration。';
  }

  @override
  String systemCallMissed(String username) {
    return '您错过了 $username 的来电。';
  }

  @override
  String get systemCallDurationFewSeconds => '几秒前';

  @override
  String get systemCallDurationMinute => '1 分钟';

  @override
  String get systemCallDurationOneYear => '1 年';

  @override
  String get systemCallDurationOneMonth => '1 个月';

  @override
  String get systemCallDurationOneWeek => '1 周';

  @override
  String get systemCallDurationOneDay => '1 天';

  @override
  String get systemCallDurationOneHour => '1 小时';

  @override
  String systemCallDurationYears(int count) {
    return '$count 年';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count 个月';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count 周';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count 天';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count 小时';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count 分钟';
  }

  @override
  String systemUnknownMessage(String productName) {
    return '更新 $productName 即可查看此消息。';
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
  String get voiceJoinFailedTitle => '无法加入语音';

  @override
  String get voiceMultiDeviceDisconnectFailed => '无法断开其他设备连接。请稍后重试。';

  @override
  String get voiceChannelEmptyDescription => '这是一个语音频道。连接后即可开始交谈！';

  @override
  String get voiceChannelJoin => '加入语音频道';

  @override
  String get voiceCallJoin => '加入通话';

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
  String get voiceControlFlipCamera => '切换摄像头';

  @override
  String get voiceControlScreenShare => '屏幕共享';

  @override
  String get voiceScreenShareNotificationText => '正在共享您的屏幕。';

  @override
  String get voiceControlMore => '更多';

  @override
  String get voiceControlDisconnect => '断开连接';

  @override
  String get voiceInChat => '在语音聊天中';

  @override
  String get voiceConnectionFailed => '连接失败';

  @override
  String get voiceConnectionRetry => '重试';

  @override
  String get voiceConnectionDismiss => '关闭';

  @override
  String get voiceConnectionDisconnected => '已断开连接';

  @override
  String voicePingMs(int currentLatency) {
    return '延迟：$currentLatency毫秒';
  }

  @override
  String get voiceMeasuringLatency => '正在测量延迟…';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return '跳转到$channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => '语音连接';

  @override
  String get voiceConnectionAdvancedStats => '高级';

  @override
  String get voiceShowCallAvatars => '显示通话头像';

  @override
  String get voiceShowConnectionId => '显示连接 ID';

  @override
  String get voiceAudioProcessing => '音频处理中';

  @override
  String get voiceConnectionSessionSection => '会话';

  @override
  String get voiceConnectionDurationLabel => '时长';

  @override
  String get voiceConnectionParticipantsLabel => '参与者';

  @override
  String get voiceConnectionNetworkSection => '网络';

  @override
  String get voiceConnectionPingLabel => '提示音';

  @override
  String get voiceConnectionJitterLabel => '抖动';

  @override
  String get voiceConnectionSendLabel => '发送';

  @override
  String get voiceConnectionReceiveLabel => '接收';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes分钟 $seconds秒';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency 毫秒';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter 毫秒';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => '麦克风静音';

  @override
  String get userAreaUnmuteMicrophone => '取消静音麦克风';

  @override
  String get userAreaUserSettings => '用户设置';

  @override
  String get voiceParticipantMenuViewProfile => '查看个人资料';

  @override
  String get voiceParticipantMenuFocus => '聚焦此人';

  @override
  String get voiceParticipantMenuUnfocus => '取消聚焦';

  @override
  String get voiceParticipantMenuCommunityMute => '社区静音';

  @override
  String get voiceParticipantMenuCommunityDeafen => '社区闭麦';

  @override
  String get voiceParticipantMenuUserVolume => '用户音量';

  @override
  String get voiceParticipantMenuStreamVolume => '语音直播音量';

  @override
  String get voiceParticipantMenuStopStreaming => '停止串流';

  @override
  String get voiceParticipantModerationFailed => '无法更新该成员。请重试。';

  @override
  String get voiceControlChat => '聊天';

  @override
  String get voiceCallViewModeLabel => '查看';

  @override
  String get voiceCallViewModeGrid => '网格';

  @override
  String get voiceCallViewModeFocus => '专注模式';

  @override
  String get voicePanelSettingsSectionTitle => '语音设置';

  @override
  String get voicePanelUseEarpieceLabel => '使用听筒';

  @override
  String get voicePanelOnlyShowVideosLabel => '仅显示视频';

  @override
  String get voicePanelOnlyShowVideosDescription => '仅显示开启摄像头的参与者。';

  @override
  String get voicePanelShowOwnCameraLabel => '显示我的摄像头';

  @override
  String get voicePrioritizeSpeakersLabel => '优先显示发言者';

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
  String get privacyDashboardProfilePrivacySection => '个人资料隐私';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection => '好友和私信';

  @override
  String get privacyDashboardActivitySharingSection => '活动共享';

  @override
  String get privacyDashboardSensitiveContentSection => '敏感内容';

  @override
  String get privacyDashboardDataExportSection => '数据导出';

  @override
  String get privacyDashboardDataDeletionSection => '数据删除';

  @override
  String get privacyDashboardProfilePrivacyTitle => '谁可以查看你的完整资料';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities => '所有社区成员和好友';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      '你的完整个人资料对好友和所有社群成员可见';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities => '仅限好友和小社群';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      '您的完整个人资料对好友和成员数不超过 200 人的社群成员可见';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => '仅限好友';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc => '您的完整个人资料仅对好友可见';

  @override
  String get privacyDashboardFriendRequestsTitle => '好友请求';

  @override
  String get privacyDashboardFriendRequestsEveryone => '所有人';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc => '允许任何人向你发送好友请求';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => '好友的好友';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      '允许你朋友的朋友向你发送请求';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers => '社区成员';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      '允许你所在社群的成员向你发送请求';

  @override
  String get privacyDashboardDirectMessagesTitle => '私信';

  @override
  String get privacyDashboardDirectMessagesMembers => '允许社群成员直接发消息';

  @override
  String get privacyDashboardDirectMessagesMembersDesc => '允许你所在社群的成员向你发送私信';

  @override
  String get privacyDashboardDirectMessagesBots => '允许社群机器人发送私信';

  @override
  String get privacyDashboardDirectMessagesBotsDesc => '允许你所在社群的机器人向你发送私信';

  @override
  String get privacyDashboardConnectionsSectionDesc => '控制谁可以向你发送好友请求和私信';

  @override
  String get privacyDashboardCommunicationSectionDesc => '控制谁可以给你打电话以及将你添加到群聊';

  @override
  String get privacyDashboardIncomingCallsTitle => '来电';

  @override
  String get privacyDashboardIncomingCallsDesc => '控制谁可以给你打电话';

  @override
  String get privacyDashboardAllowedCallers => '允许的来电方';

  @override
  String get privacyDashboardIncomingCallNobody => '无人';

  @override
  String get privacyDashboardIncomingCallNobodyDesc => '阻止所有来电';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => '仅限好友';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc => '仅允许好友给你打电话（推荐）';

  @override
  String get privacyDashboardIncomingCallCustom => '好友 + 自定义';

  @override
  String get privacyDashboardIncomingCallCustomDesc => '允许好友以及您选择的其他群组';

  @override
  String get privacyDashboardIncomingCallEveryone => '所有人';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc => '允许任何人给你打电话，包括陌生人';

  @override
  String get privacyDashboardAdditionalGroups => '其他群组';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc => '你朋友的朋友可以给你打电话';

  @override
  String get privacyDashboardCallGuildMembersDesc => '你来自双方都加入的社群的人可以给你打电话';

  @override
  String get privacyDashboardRingBehavior => '铃铛行为';

  @override
  String get privacyDashboardSilentCalls => '所有人来电静音';

  @override
  String get privacyDashboardSilentCallsDesc =>
      '所有来电将静默通知，而非响铃。默认情况下，非好友的来电始终静默。';

  @override
  String get privacyDashboardGroupDmTitle => '谁可以将您添加到群聊';

  @override
  String get privacyDashboardGroupDmDesc =>
      '控制谁可以在不询问的情况下将你添加到群聊。任何人仍然可以向你发送邀请链接加入。';

  @override
  String get privacyDashboardAllowedInvites => '允许的邀请者';

  @override
  String get privacyDashboardGroupDmNobodyDesc => '未经允许，任何人不得将您添加到群聊';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc => '仅允许好友在不询问的情况下添加你（推荐）';

  @override
  String get privacyDashboardGroupDmCustomDesc => '允许好友以及其他群组添加你';

  @override
  String get privacyDashboardGroupDmEveryoneDesc => '允许任何人将你添加到群聊，无需询问';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc => '你朋友的朋友可以把你拉进群聊';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc => '你来自的社群中的成员可以拉你进群聊';

  @override
  String get privacyDashboardVoiceActivityTitle => '在线状态下的语音活动';

  @override
  String get privacyDashboardShareVoiceActivity => '与朋友分享你的语音活动';

  @override
  String get privacyDashboardVoiceActivityEnableTitle => '与所有朋友分享语音活动？';

  @override
  String get privacyDashboardVoiceActivityDisableTitle => '停止与所有朋友分享语音活动？';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      '你即将开始与所有好友（包括未来的好友）分享你的语音活动。此操作会向他们发送更新，且 24 小时内只能更改一次。';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      '你即将停止与所有好友（包括未来的好友）分享你的语音活动。此操作会向他们发送更新，并且在 24 小时内无法再次更改。';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm => '是，与所有朋友分享';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => '是的，停止分享';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return '还剩 $time 可用';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated => '语音活动分享已更新';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed => '暂时无法更新语音活动分享设置';

  @override
  String get privacyDashboardDataExportDesc =>
      '创建可下载的账户数据存档，包括消息和附件网址。大多数人会选择全部导出，但你也可以在下方缩小范围。';

  @override
  String get privacyDashboardExportMyData => '导出我的数据';

  @override
  String get privacyDashboardDataDeletionDesc =>
      '永久删除您在私信、群组私信和社群中发送的消息。此操作将在后台运行，完成后您会收到一条私信通知。';

  @override
  String get privacyDashboardDeleteMyMessages => '删除我的消息';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle => '允许社群成员发私信？';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle => '要屏蔽社群成员的私信吗？';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle => '允许机器人给你发私信吗？';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle => '要阻止机器人给你发私信吗？';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc => '是否允许现有社群成员向你发送私信？';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc => '要同时屏蔽现有社群成员的私信吗？';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc => '是否允许现有社群中的机器人向你发送私信？';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc => '要同时屏蔽来自现有社群的机器人吗？';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      '你也可以通过长按社群名称并选择“隐私设置”来为每个社群更改此设置。';

  @override
  String get privacyDashboardDmConfirmAllowAll => '允许所有社群';

  @override
  String get privacyDashboardDmConfirmBlockAll => '在所有社群中屏蔽';

  @override
  String get privacyDashboardDmConfirmSkip => '跳过此步骤';

  @override
  String get privacyDashboardDataRequestGoBack => '返回';

  @override
  String get privacyDashboardDataRequestExportTitle => '导出我的数据';

  @override
  String get privacyDashboardDataRequestDeleteTitle => '删除我的消息';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      '我们会尽快处理。档案准备就绪后，您会收到一封电子邮件。';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      '我们会尽快处理。完成后，您会收到我们的私信。';

  @override
  String get privacyDashboardDataRequestScopeTitle => '要包含什么';

  @override
  String get privacyDashboardDataRequestExportEverything => '所有内容';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      '导出您发送过的所有消息，以及您的帐户设置、成员身份和元数据。';

  @override
  String get privacyDashboardDataRequestExportCustom => '自定义选择';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      '选择要包含在存档中的对话类型、社区和时间范围。';

  @override
  String get privacyDashboardDataRequestDeleteSelected => '选择要包含的内容';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc => '选择要清理的对话类型。';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible => '仅限我无法再访问的社区';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      '仅删除您已离开或已被移出的社群和群组私信中的消息。';

  @override
  String get privacyDashboardDataRequestKindsTitle => '哪些对话';

  @override
  String get privacyDashboardDataRequestKindsBody => '选择要包含的对话类型。';

  @override
  String get privacyDashboardDataRequestKindDms => '私信';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => '已关闭的私信';

  @override
  String get privacyDashboardDataRequestKindGroupDms => '群组私信';

  @override
  String get privacyDashboardDataRequestKindCommunities => '社群';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => '选择社区';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => '社群筛选条件';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude => '排除所选';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => '仅限选定的';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty => '你目前不在任何社群中。';

  @override
  String get privacyDashboardDataRequestWhenTitle => '时间范围';

  @override
  String get privacyDashboardDataRequestDateMode => '时间范围';

  @override
  String get privacyDashboardDataRequestAllTime => '所有时间';

  @override
  String get privacyDashboardDataRequestCustomRange => '自定义范围';

  @override
  String get privacyDashboardDataRequestStartDate => '开始日期';

  @override
  String get privacyDashboardDataRequestEndDate => '结束日期';

  @override
  String get privacyDashboardDataRequestDateHelper => '将任一字段留空，则该时间范围将不设上限。';

  @override
  String get privacyDashboardDataRequestNeedInclusion => '请至少选择一种对话类型。';

  @override
  String get privacyDashboardDataRequestDateRangeError => '开始日期必须早于结束日期。';

  @override
  String get privacyDashboardDataRequestConfirmTitle => '查看并确认';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      '我们将创建包含您发送过的所有消息的可下载存档，并在准备就绪后通过电子邮件通知您。该电子邮件中的下载链接将在 7 天后过期。';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      '我们将根据以下筛选条件生成一个可下载的存档，并在准备就绪后通过电子邮件通知您。邮件中的下载链接将在 7 天后失效。';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      '永久删除符合以下筛选条件的消息。此操作无法撤消。';

  @override
  String get privacyDashboardDataRequestDeleteDanger => '此操作无法撤销。完成后我们会私信通知您。';

  @override
  String get privacyDashboardDataRequestRequestExport => '申请导出';

  @override
  String get privacyDashboardDataRequestDeleteMessages => '删除消息';

  @override
  String get privacyDashboardDataRequestSummaryScope => '范围';

  @override
  String get privacyDashboardDataRequestSummaryConversations => '对话';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => '社群';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => '时间范围';

  @override
  String get privacyDashboardDataRequestSummaryNone => '无';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return '从 $start 开始';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return '截止$end';
  }

  @override
  String privacyDashboardDataRequestSummaryBetween(String start, String end) {
    return '$start - $end';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildExclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 个社群',
      one: '# 个社群',
    );
    return '除 $_temp0 外的所有社群';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 个社群',
      one: '# 个社群',
    );
    return '仅限 $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen => '开放的私信';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed => '已关闭的私信';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth => '私信（开放和已关闭）';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => '群组私信';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded => '社群';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# 小时',
      one: '# 小时',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# 分钟',
      one: '# 分钟',
    );
    return '$_temp0又$_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# 小时',
      one: '# 小时',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# 分钟',
      one: '# 分钟',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# 秒',
      one: '# 秒',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => '无法加载隐私设置';

  @override
  String get privacyDashboardRetry => '重试';

  @override
  String get privacyDashboardSensitiveContentSaveFailed => '未能保存敏感内容设置。';

  @override
  String get privacyDashboardDataRequestFailed => '请求处理失败。';

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
  String get forwardSendSlowmodeBlocked => '正在等待一个或多个所选频道的慢速模式结束。';

  @override
  String get slowmodeRateLimitedTitle => '慢速模式已开启';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return '慢速模式已开启 — 请等待 $duration 后再发送消息。';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled => '慢速模式下已禁用直接上传。';

  @override
  String get shareMediaTitle => '分享到';

  @override
  String get shareMediaMessageHint => '添加可选消息…';

  @override
  String get shareMediaSendButton => '发送';

  @override
  String get shareMediaSuccessToast => '媒体已分享';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return '已分享到 $count 个目的地';
  }

  @override
  String get shareMediaFailedToast => '分享媒体失败';

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
  String get chatMessageCopyEmbedText => '复制嵌入文本';

  @override
  String get chatMessageTranslate => '翻译';

  @override
  String chatMessageTranslatedFrom(String language) {
    return '已翻译自 $language';
  }

  @override
  String get chatMessageSeeOriginal => '查看原文';

  @override
  String get chatMessageSeeTranslation => '查看翻译';

  @override
  String get chatMessageTranslating => '正在翻译…';

  @override
  String get chatMessageTranslateFailed => '无法翻译此消息。';

  @override
  String get chatMessageTranslateUnavailable => '此设备上不提供翻译。';

  @override
  String get chatMessageSpeak => '朗读消息';

  @override
  String get chatMessageStopSpeaking => '停止发言';

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
  String get chatMessageOpenLink => '打开链接';

  @override
  String get chatMessageCopyLink => '复制链接';

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
  String get chatReactionAddFailed => '添加反应失败';

  @override
  String get chatReactionRemoveFailed => '移除反应失败';

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
  String get chatMessageDeleteAttachment => '删除附件';

  @override
  String get chatMessageEditAttachmentAltText => '编辑替代文本';

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
      other: '$count 条被屏蔽的消息',
      one: '1 条被屏蔽的消息',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条潜在垃圾消息',
      one: '1 条潜在垃圾消息',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor => '由于原作者已被屏蔽，回复已隐藏。';

  @override
  String get chatReplyHiddenSpammerAuthor => '由于原作者被标记为垃圾信息发送者，回复已隐藏。';

  @override
  String get devMarkAsSpamLocally => '本地标记为垃圾信息';

  @override
  String get devIgnoreSpamFlag => '忽略垃圾信息标记';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => '媒体选项';

  @override
  String get mediaViewerCopyLink => '复制链接';

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
    return '附件 $index';
  }

  @override
  String get mediaViewerDismissBackdrop => '关闭';

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
  String get composerAutocompleteSuggestions => '建议';

  @override
  String get composerAutocompleteCommandsHeading => '命令';

  @override
  String get composerAutocompleteChoicesHeading => '选项';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => '可选参数';

  @override
  String get composerAutocompleteChannelsHeading => '频道';

  @override
  String get composerAutocompleteMembersHeading => '成员';

  @override
  String get composerAutocompleteUsersHeading => '用户';

  @override
  String get composerAutocompleteMentionsHeading => '提及';

  @override
  String get composerAutocompleteRolesHeading => '角色';

  @override
  String get composerAutocompleteMediaHeading => '媒体';

  @override
  String get composerAutocompleteStickersHeading => '贴纸';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => '未找到 GIF';

  @override
  String get composerCommandShrugDescription => '在你的消息后添加 ¯\\_(ツ)_/¯。';

  @override
  String get composerCommandTableflipDescription => '在你的消息后添加 (╯°□°)╯︵ ┻━┻。';

  @override
  String get composerCommandUnflipDescription => '在你的消息后添加 ┬─┬ ノ( ゜-゜ノ)。';

  @override
  String get composerCommandMeDescription => '发送操作消息（斜体显示）.';

  @override
  String get composerCommandSpoilerDescription => '发送剧透消息（用剧透标签包裹）.';

  @override
  String get composerCommandTtsDescription => '发送文本转语音消息。';

  @override
  String get composerCommandNickDescription => '修改你在本社区的昵称。';

  @override
  String get composerCommandKickDescription => '将成员踢出此社群。';

  @override
  String get composerCommandBanDescription => '在此社群中封禁成员。';

  @override
  String get composerCommandMsgDescription => '给用户发送私信。';

  @override
  String get composerCommandSavedDescription => '发送已保存的媒体项目。';

  @override
  String get composerCommandStickerDescription => '发送贴纸.';

  @override
  String get composerCommandGifDescription => '搜索并发送GIF.';

  @override
  String get composerCommandMemberOption => '要操作的成员。';

  @override
  String get composerCommandReasonOption => '原因（可选）。';

  @override
  String get composerCommandMessageOption => '要发送的消息';

  @override
  String get composerCommandQueryOption => '搜索内容。';

  @override
  String get composerCommandNicknameOption => '你的新昵称，留空则重置。';

  @override
  String get composerCommandDeleteMessagesOption => '要删除多少成员的近期消息历史记录。';

  @override
  String get composerCommandDeleteMessagesNone => '不删除任何';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return '过去 $count 天';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '过去 24 小时';

  @override
  String get composerCommandOptionRequired => '此选项为必填项。请输入一个值。';

  @override
  String get composerCommandClear => '清除命令';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return '你在此社群中的昵称已从\"**$previousNickname**\"更改为\"**$newNickname**\"。';
  }

  @override
  String get composerCommandUnknownUser => '未知用户';

  @override
  String composerCommandMsgFailed(String username) {
    return '无法向 **$username** 发送消息。他们可能已禁用私信，或者您已被屏蔽。';
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
  String get addGuildCreateTitle => '创建社群';

  @override
  String get addGuildCreateDescription => '创建社区，和朋友们一起畅聊。';

  @override
  String get addGuildCreateNameLabel => '社群名称';

  @override
  String get addGuildCreateSubmit => '创建社群';

  @override
  String get addGuildCreateFailed => '无法创建社区。请重试。';

  @override
  String get addGuildCreateClaimTitle => '认领你的账号';

  @override
  String get addGuildCreateClaimDescription => '您需要先认领帐户，然后才能创建社群。';

  @override
  String get addGuildCreateVerifyTitle => '验证邮箱';

  @override
  String get addGuildCreateVerifyDescription => '创建社群前，请先验证你的邮箱地址。';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      '创建社区时，不支持使用动画图标。请使用静态图片。';

  @override
  String get addGuildCreateGuidelinesBefore => '创建社群即表示您同意遵守并维护 ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName 社区指南';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked => '此实例是单个社区，因此无法创建其他社区。';

  @override
  String get addGuildCreateChangeIcon => '更改图标';

  @override
  String get addGuildCreateIconLabel => '社群图标';

  @override
  String get addGuildCreateIconHint =>
      'PNG、JPEG、WebP、AVIF、HEIC、HEIF、JXL、SVG。最大 10MB。推荐：512×512px';

  @override
  String get addGuildImportDescription => '粘贴 Discord 模板网址，将该模板结构导入新社区。';

  @override
  String get addGuildImportUrlLabel => '模板网址';

  @override
  String get addGuildImportUrlInvalid => '请输入有效的 Discord 模板网址或代码。';

  @override
  String get addGuildImportFetchFailed => '无法获取社群模板。该模板可能不存在，或外部服务暂时不可用。';

  @override
  String get addGuildImportInvalidResponse => '这看起来不是一个有效的模板响应。';

  @override
  String get addGuildImportTemplateLabel => '模板';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount 个文字频道，$voiceChannelCount 个语音频道，$categoryCount 个类别，$roleCount 个身份组';
  }

  @override
  String get addGuildImportRemoveIcon => '移除图标';

  @override
  String get addGuildImportTemplateInvalid => '社区模板数据无效或格式错误。';

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
  String get channelDetailsFallbackTitle => '详情';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return '群聊 · $count 位成员';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return '关闭与 $name 的对话？';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return '退出 $name？';
  }

  @override
  String get channelDetailsChannelSettingsTitle => '频道设置';

  @override
  String get channelDetailsGroupSettingsTitle => '群设置';

  @override
  String get channelDetailsDmSettingsTitle => '私信设置';

  @override
  String get channelDetailsInvitePeople => '邀请用户';

  @override
  String get channelDetailsCopyLink => '复制链接';

  @override
  String get channelMenuCopyChannelLink => '复制频道链接';

  @override
  String get channelMenuCopyRedirectLink => '复制重定向链接';

  @override
  String get channelDetailsAddFriendsToGroup => '添加朋友进群';

  @override
  String get channelDetailsGroupInvites => '群邀请';

  @override
  String get channelDetailsEditChannel => '编辑频道';

  @override
  String get channelDetailsDeleteChannel => '删除频道';

  @override
  String get channelSettingsCategorySettingsTitle => '分类设置';

  @override
  String get channelSettingsEditCategory => '编辑类别';

  @override
  String get channelSettingsTabOverview => '概览';

  @override
  String get channelSettingsTabPermissions => '权限';

  @override
  String get channelSettingsTabInvites => '邀请';

  @override
  String get channelSettingsTabWebhooks => 'Webhook';

  @override
  String get channelSettingsDeleteChannel => '删除频道';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return '确定要删除 $channelName 吗？此操作无法撤销。';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return '确定要删除 $categoryName 吗？此操作无法撤销。';
  }

  @override
  String get channelSettingsDeleteCategory => '删除类别';

  @override
  String get channelSettingsChannelUpdated => '频道已更新';

  @override
  String get channelSettingsChannelName => '频道名称';

  @override
  String get channelSettingsCategoryName => '类别名称';

  @override
  String get channelSettingsMyCategory => '我的分类';

  @override
  String get categoryExpandCategory => '展开类别';

  @override
  String get categoryCollapseCategory => '收起类别';

  @override
  String get categoryExpandAllCategories => '展开所有类别';

  @override
  String get categoryCollapseAllCategories => '收起所有类别';

  @override
  String get categoryMuteCategory => '将此类别静音';

  @override
  String get categoryUnmuteCategory => '取消静音分类';

  @override
  String get categoryCopyCategoryId => '复制类别ID';

  @override
  String get categoryIdCopied => '类别 ID 已复制';

  @override
  String get channelSettingsChannelNamePlaceholder => '通用';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => '话题';

  @override
  String get channelSettingsTopicPlaceholder => '为频道添加话题';

  @override
  String get channelSettingsInsertEmoji => '插入表情';

  @override
  String get channelSettingsTopicTooLongTitle => '频道话题过长。';

  @override
  String get channelSettingsTopicTooLongMessage => '缩短话题，然后重试。';

  @override
  String get channelSettingsSlowmode => '慢速模式';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return '消息之间的等待时间。“$bypassSlowmodePermissionLabel”可以跳过此限制。';
  }

  @override
  String get channelSettingsSlowmodeOff => '关';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours 小时';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute 分钟';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour 小时';
  }

  @override
  String get channelSettingsVoiceQuality => '语音质量';

  @override
  String get channelSettingsVoiceQualityDescription =>
      '更高的比特率 = 更好的音质和更高的带宽占用。';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits 千比特每秒';
  }

  @override
  String get channelSettingsParticipantLimit => '人数上限';

  @override
  String get channelSettingsParticipantLimitDescription =>
      '最多可同时加入的成员数。0 表示不限。';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位参与者',
      one: '1 位参与者',
      zero: '∞ 无限制',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => '连接数限制';

  @override
  String get channelSettingsConnectionLimitDescription =>
      '单个成员在此频道中可保持的最大活跃连接数。';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个连接',
      one: '1 个连接',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => '语音地区';

  @override
  String get channelSettingsVoiceRegionDescription =>
      '为此频道选择一个语音区域。自动将使用最近的区域。';

  @override
  String get channelSettingsVoiceRegionAutomatic => '自动';

  @override
  String get channelSettingsVoiceRegionsLoadFailed => '无法加载语音区域';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription => '请稍后重试。';

  @override
  String get channelSettingsResetSlider => '将滑块重置为默认值';

  @override
  String get channelSettingsAdvanced => '高级';

  @override
  String get channelSettingsMatureContentOverride => '成人内容覆盖';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return '覆盖此频道的 $scopeLevel 设置。不适宜内容将在进入前进行屏蔽。';
  }

  @override
  String get channelSettingsMatureContentInherit => '继承';

  @override
  String get channelSettingsMatureContentOn => '开启';

  @override
  String get channelSettingsMatureContentOff => '关';

  @override
  String get channelSettingsMatureContentOnDescription => '将此频道标记为包含不适宜内容。';

  @override
  String get channelSettingsMatureContentOffDescription => '允许此频道不受限制地展示成人内容。';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return '从 $inheritedSourceLabel 继承：开启';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return '从 $inheritedSourceLabel 继承：关闭';
  }

  @override
  String get channelSettingsMatureContentCategorySource => '类别';

  @override
  String get channelSettingsMatureContentCommunitySource => '社区';

  @override
  String get channelSettingsMatureContentCategoryScope => '类别';

  @override
  String get channelSettingsMatureContentCommunityScope => '社群';

  @override
  String get channelSettingsContentWarningToggle => '在此频道中显示内容警告';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      '开启频道前会显示一个同意提示。';

  @override
  String get channelSettingsContentWarningText => '自定义警告文本';

  @override
  String get channelSettingsContentWarningDefault => '此内容可能包含敏感信息。';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return '你需要\"$manageChannelsPermissionLabel\"权限才能编辑这些权限。';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return '你需要\"$manageRolesPermissionLabel\"权限才能编辑这些权限。';
  }

  @override
  String get channelSettingsUnknownRole => '未知角色';

  @override
  String get channelSettingsUnknownUser => '未知用户';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => '访问覆盖';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return '编辑 $name 的访问权限';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => '返回覆盖';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess => '配置此频道的访问权限';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides => '配置此角色的覆盖权限';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides => '配置此成员的覆盖权限';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => '搜索权限…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated => '频道访问权限已更新';

  @override
  String get channelSettingsPermissionsTitle => '访问控制';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix => '此频道与父类别同步 ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      '此频道未与父类别同步 ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => '与类别同步';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast => '频道已与父类别同步';

  @override
  String get channelSettingsPermissionsAddOverride => '添加覆盖';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers => '搜索角色或成员…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => '角色与成员';

  @override
  String get channelSettingsDeleteInvite => '删除邀请';

  @override
  String get channelSettingsDeleteInviteConfirm => '删除此邀请？此操作无法撤消。';

  @override
  String get channelSettingsCopyInviteCode => '复制邀请码';

  @override
  String get channelSettingsCopyInviteUrl => '复制邀请链接';

  @override
  String get channelSettingsWebhookCreated => 'Webhook 已创建';

  @override
  String get channelSettingsWebhookCreateFailed => '创建 Webhook 失败';

  @override
  String get channelSettingsCreateWebhook => '创建 Webhook';

  @override
  String get channelSettingsInvitesDescription => '管理此频道的邀请链接。';

  @override
  String get channelSettingsInvitesCreate => '创建邀请';

  @override
  String get channelSettingsInvitesEmpty => '没有邀请链接';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      '此频道还没有邀请链接。创建链接以邀请用户加入此频道。';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      '加载此频道的邀请链接时出错。请重试。';

  @override
  String get channelSettingsWebhooksDescription => '管理可在此频道中发布消息的传入 Webhook。';

  @override
  String get channelSettingsWebhooksEmpty => '无 Webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      '此频道未配置任何 Webhook。请创建一个 Webhook，以允许外部应用发布消息。';

  @override
  String get channelSettingsWebhooksUnsupported => '此频道不支持网页链接。';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return '您需要“$permission”权限才能查看和编辑此频道的Webhook。';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => '未能加载 Webhook';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      '加载此频道 Webhook 时出错。请重试。';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return '由 $creator 创建于 $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => '未知用户';

  @override
  String get channelSettingsWebhooksAvatar => '头像';

  @override
  String get channelSettingsWebhooksUploadImage => '上传图片';

  @override
  String get channelSettingsWebhooksRemove => '移除';

  @override
  String get channelSettingsWebhooksName => '名称';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook 名称';

  @override
  String get channelSettingsWebhooksChannel => '频道';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook 网址';

  @override
  String get channelSettingsWebhooksCopyUrl => '复制 Webhook URL';

  @override
  String get channelSettingsWebhooksDelete => '删除 Webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed => '无法删除此 Webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm => '删除此Webhook？此操作无法撤销。';

  @override
  String get channelSettingsWebhookTryAgainInAMoment => '请稍后重试。';

  @override
  String get channelMenuOpenChat => '打开聊天';

  @override
  String get channelMenuDuplicateChannel => '复制频道';

  @override
  String get channelMenuResetMatureContentAgreeState => '重置成人内容协议状态';

  @override
  String get channelMenuDeleteMyMessagesTitle => '删除您在此频道中的消息？';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      '此操作将永久删除您在此频道中发送过的所有消息，且无法撤销。';

  @override
  String get channelMenuDeleteMyMessagesConfirm => '删除我的消息';

  @override
  String get channelMenuDeletedYourMessages => '已删除你的消息';

  @override
  String get channelMenuCouldNotDeleteYourMessages => '无法删除你的消息';

  @override
  String get channelDetailsSystemMessage => '系统消息';

  @override
  String get channelDetailsTextChannel => '文字频道';

  @override
  String get channelDetailsVoiceChannel => '语音频道';

  @override
  String get channelDetailsCategory => '类别';

  @override
  String get channelDetailsLinkChannel => '链接频道';

  @override
  String get channelDetailsGenericChannel => '频道';

  @override
  String get channelDetailsMutedConversation => '已静音对话';

  @override
  String get channelDetailsUnmutedConversation => '已取消静音的对话';

  @override
  String get channelDetailsMutedChannel => '已静音频道';

  @override
  String get channelDetailsUnmutedChannel => '已取消频道静音';

  @override
  String get channelDetailsNotificationSettingsUpdated => '通知设置已更新';

  @override
  String get channelDetailsTabMembers => '成员';

  @override
  String get channelDetailsTabPins => '置顶消息';

  @override
  String get channelDetailsActionMute => '静音';

  @override
  String get channelDetailsActionUnmute => '取消静音';

  @override
  String get channelDetailsActionSearch => '搜索';

  @override
  String get channelDetailsActionMore => '更多';

  @override
  String get channelDetailsMembersEmptyTitle => '暂无成员';

  @override
  String get channelDetailsMembersEmptyBody => '社区数据加载后，成员将在此处显示。';

  @override
  String get memberListPermissionDeniedTitle => '无法查看成员';

  @override
  String get memberListPermissionDeniedBody => '你无法查看此社群中此频道的成员';

  @override
  String get memberListUnavailableTitle => '成员列表不可用';

  @override
  String get memberListUnavailableBody => '社群成员列表暂时无法查看';

  @override
  String get channelDetailsPinsLoadFailedTitle => '无法加载置顶消息';

  @override
  String get channelDetailsPinsGuildEndHint => '拥有“固定消息”权限的成员可以固定消息供所有人查看。';

  @override
  String get channelDetailsPinsDmEndHint => '你可以置顶此对话中的消息，以便所有人都能看到。';

  @override
  String get channelDetailsPinsEndReached => '已到底部';

  @override
  String get channelHeaderOpenDetails => '打开频道详情';

  @override
  String get channelHeaderPinnedMessages => '已置顶消息';

  @override
  String get channelHeaderPinnedMessagesUnread => '置顶消息，未读';

  @override
  String get channelHeaderMemberList => '成员列表';

  @override
  String get channelHeaderInbox => '收件箱';

  @override
  String get channelHeaderNotificationSettingsMuted => '通知设置，已静音';

  @override
  String get channelDetailsSearchTitle => '搜索';

  @override
  String get channelDetailsSearchHint => '搜索消息';

  @override
  String get channelDetailsSearchFilterFrom => '发件人';

  @override
  String get channelDetailsSearchFilterHas => '包含';

  @override
  String get channelDetailsSearchFilterIn => '在';

  @override
  String get channelDetailsSearchFilterMentions => '提及';

  @override
  String get channelDetailsSearchFilterMore => '更多';

  @override
  String get channelDetailsSearchMoreFiltersActive => '有效';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count 个频道';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count 位用户';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => '用户';

  @override
  String get channelDetailsSearchAuthorTypeBot => '机器人';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => '按频道筛选';

  @override
  String get channelDetailsSearchChannelsHint => '搜索频道';

  @override
  String get channelDetailsSearchChannelsEmpty => '未找到频道';

  @override
  String get channelDetailsSearchMoreFiltersPinned => '已固定';

  @override
  String get channelDetailsSearchPinnedTrue => '仅显示已固定';

  @override
  String get channelDetailsSearchPinnedFalse => '不包括已固定';

  @override
  String get channelDetailsSearchClearFilter => '清空';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => '作者类型';

  @override
  String get channelDetailsSearchMoreFiltersDate => '日期';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => '日期模式';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => '选择日期';

  @override
  String get channelDetailsSearchMoreFiltersLink => '链接主机名';

  @override
  String get channelDetailsSearchMoreFiltersFileName => '文件名包含';

  @override
  String get channelDetailsSearchMoreFiltersFileType => '文件扩展名';

  @override
  String get channelDetailsSearchContentPoll => '投票';

  @override
  String get channelDetailsSearchContentPollDescription => '包含投票的消息';

  @override
  String get channelDetailsSearchContentForward => '转发';

  @override
  String get channelDetailsSearchContentForwardDescription => '转发的消息';

  @override
  String get channelDetailsSearchFilterSort => '排序';

  @override
  String get channelHeaderSearchFiltersTitle => '搜索过滤器';

  @override
  String get channelHeaderSearchRecentTitle => '最近搜索';

  @override
  String get channelHeaderSearchUsersTitle => '用户';

  @override
  String get channelHeaderSearchChannelsTitle => '频道';

  @override
  String get channelHeaderSearchValuesTitle => '值';

  @override
  String get channelHeaderSearchDatesTitle => '日期';

  @override
  String get channelHeaderSearchDefaultBadge => '默认';

  @override
  String get channelHeaderSearchClearHistory => '清空';

  @override
  String get channelHeaderSearchFilterDescFrom => '某个用户';

  @override
  String get channelHeaderSearchFilterDescMentions => '某个用户';

  @override
  String get channelHeaderSearchFilterDescHas => '链接、嵌入、图片、视频、音频、文件、表情包，…';

  @override
  String get channelHeaderSearchFilterDescBefore => '日期或日期范围';

  @override
  String get channelHeaderSearchFilterDescOn => '日期或日期范围';

  @override
  String get channelHeaderSearchFilterDescDuring => '日期或日期范围';

  @override
  String get channelHeaderSearchFilterDescAfter => '日期或日期范围';

  @override
  String get channelHeaderSearchFilterDescIn => '某个频道';

  @override
  String get channelHeaderSearchFilterDescPinned => '是或否';

  @override
  String get channelHeaderSearchFilterDescAuthorType => '用户、机器人或Webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom => '主机名，例如 example.com';

  @override
  String get channelHeaderSearchFilterDescFileName => '附件文件名的一部分';

  @override
  String get channelHeaderSearchFilterDescFileType => '文件扩展名，例如 png';

  @override
  String get channelHeaderSearchFilterDescSort => '时间戳或相关性';

  @override
  String get channelHeaderSearchFilterDescOrder => '升序或降序';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 条结果',
      one: '1 条结果',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => '按用户筛选';

  @override
  String get channelDetailsSearchFilterByContent => '按内容筛选';

  @override
  String get channelDetailsSearchSortBy => '排序结果方式';

  @override
  String get channelDetailsSearchIn => '在...中搜索';

  @override
  String get channelDetailsSearchEmptyTitle => '搜索此对话';

  @override
  String get channelDetailsSearchEmptyBody => '输入文字、作者或内容过滤器以查找消息。';

  @override
  String get channelDetailsSearchIndexingTitle => '消息正在索引';

  @override
  String get channelDetailsSearchIndexingBody => '请稍后重试，搜索将完成此范围的索引。';

  @override
  String get channelDetailsSearchNoResultsTitle => '无结果';

  @override
  String get channelDetailsSearchNoResultsBody => '尝试不同的搜索词或筛选条件。';

  @override
  String get channelDetailsMembersOnline => '在线';

  @override
  String get channelDetailsMembersOffline => '离线';

  @override
  String get channelDetailsMemberYou => '你';

  @override
  String get channelDetailsSearchUsersHint => '搜索用户';

  @override
  String get channelDetailsSearchUsersTypeToSearch => '输入以搜索成员';

  @override
  String get channelDetailsSearchUsersEmpty => '未找到用户';

  @override
  String get channelDetailsSearchUsersNoAvailable => '没有可用用户';

  @override
  String get channelDetailsDone => '完成';

  @override
  String get channelDetailsHasFilterPrompt => '显示包含以下内容的聊天消息：';

  @override
  String get channelDetailsRetry => '重试';

  @override
  String get channelDetailsPinnedMessageTitle => '置顶消息';

  @override
  String get channelDetailsSearchResultTitle => '搜索结果';

  @override
  String get channelDetailsJumpToMessage => '跳转到消息';

  @override
  String get channelDetailsUnpinMessage => '取消置顶消息';

  @override
  String get channelDetailsCopyMessageLink => '复制消息链接';

  @override
  String get channelDetailsCopyMessageId => '复制消息 ID';

  @override
  String get channelDetailsMessageUnpinned => '消息已取消置顶';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => '当前社区';

  @override
  String get channelDetailsSearchScopeCurrentDm => '当前私聊';

  @override
  String get channelDetailsSearchScopeAllCommunities => '所有社群';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => '所有私信';

  @override
  String get channelDetailsSearchScopeAllDms => '所有私信';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => '仅限公开私信';

  @override
  String get channelDetailsSearchScopeOpenDms => '私信';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities => '所有私信 + 社群';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities => '私信和社群';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription => '仅在此社区内搜索';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription => '仅搜索当前私聊';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      '在你当前加入的所有社群中';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      '仅限你曾加入过的所有私聊';

  @override
  String get channelDetailsSearchScopeAllDmsDescription => '在所有你曾加入的私聊中';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      '在你已打开的所有私信中';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription => '你所有已打开的私信中';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      '在所有你曾加入的私信 + 所有你当前加入的社群中';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      '在所有你当前打开的私信 + 你当前加入的所有社群中';

  @override
  String get channelDetailsSearchSortNewest => '按最新排序';

  @override
  String get channelDetailsSearchSortOldest => '从旧到新';

  @override
  String get channelDetailsSearchSortRelevance => '最相关';

  @override
  String get channelDetailsSearchSortNewestDescription => '最新消息优先显示';

  @override
  String get channelDetailsSearchSortOldestDescription => '优先显示最旧消息';

  @override
  String get channelDetailsSearchSortRelevanceDescription => '优先显示最相关的消息';

  @override
  String get channelDetailsSearchContentImage => '图片上传';

  @override
  String get channelDetailsSearchContentVideo => '视频上传';

  @override
  String get channelDetailsSearchContentAudio => '音频上传';

  @override
  String get channelDetailsSearchContentFile => '文件上传';

  @override
  String get channelDetailsSearchContentLink => '链接';

  @override
  String get channelDetailsSearchContentEmbed => '链接预览或嵌入';

  @override
  String get channelDetailsSearchContentSticker => '贴纸';

  @override
  String get channelDetailsSearchContentImageDescription => '仅限上传的图片文件';

  @override
  String get channelDetailsSearchContentVideoDescription => '仅限已上传的视频文件';

  @override
  String get channelDetailsSearchContentAudioDescription => '仅限已上传的音频文件';

  @override
  String get channelDetailsSearchContentFileDescription => '任意上传的附件';

  @override
  String get channelDetailsSearchContentLinkDescription => '消息文本中包含网址';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      '已解析的预览和富媒体嵌入，而非上传内容';

  @override
  String get channelDetailsSearchContentStickerDescription => '消息中包含贴纸';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count 种类型';
  }

  @override
  String get personalNotesTitle => '个人笔记';

  @override
  String get personalNotesSubtitle => '你的私人空间，用于记录想法和提醒';

  @override
  String groupDmWelcome(String displayName) {
    return '欢迎来到 $displayName。添加好友，让群聊活跃起来。';
  }

  @override
  String get groupDmWelcomeEditGroup => '编辑群组';

  @override
  String get groupDmWelcomeAddFriends => '添加朋友进群';

  @override
  String get dmGroupInvites => '邀请';

  @override
  String get groupDmEditTitle => '编辑群组';

  @override
  String get groupDmEditDetailsTooltip => '编辑群组详情';

  @override
  String get groupDmGroupName => '群名称';

  @override
  String get groupDmMyGroup => '我的群组';

  @override
  String get groupDmGroupNameMaxLength => '群名称不能超过100个字符';

  @override
  String get groupDmGroupIcon => '群图标';

  @override
  String get groupDmUploadIcon => '上传图标';

  @override
  String get groupDmChangeIcon => '更改图标';

  @override
  String get groupDmRemoveIcon => '移除图标';

  @override
  String get groupDmUpdated => '群组已更新';

  @override
  String get groupDmUpdateFailed => '无法更新群组。请重试。';

  @override
  String get groupDmAnimatedIconNotSupported => '不支持使用动画图标。请使用静态图片。';

  @override
  String get groupDmAnimatedIconNotSupportedTitle => '不支持动态图标';

  @override
  String get groupDmIconFileTooLargeTitle => '图标文件过大';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return '图标文件过大。请选择一个小于 $maxSize 的文件。';
  }

  @override
  String get groupDmUnsupportedIconFormat => '不支持的图标格式';

  @override
  String get groupDmUnsupportedIconFormatBody => '不支持的文件类型。';

  @override
  String get groupDmCouldntProcessImage => '无法处理图片';

  @override
  String get groupDmFailedToProcessCroppedImage => '处理裁剪后的图片失败。请重试。';

  @override
  String get groupDmInvalidImage => '图片无效';

  @override
  String get groupDmInvalidImageBody => '图片无效。请尝试其他图片。';

  @override
  String get groupDmAddFriends => '添加';

  @override
  String get groupDmOrSendInvite => '或发送邀请给好友：';

  @override
  String get groupDmGenerateInviteLink => '生成邀请链接';

  @override
  String get groupDmCreateInvite => '创建';

  @override
  String get groupDmInviteExpires24Hours => '你的邀请24小时后失效';

  @override
  String get groupDmAddFriendFailed => '无法将该好友添加到群组。请重试。';

  @override
  String get groupDmAddFailed => '无法添加到群组';

  @override
  String get groupDmGroupFull => '群组已满。请先移除一些成员，再添加其他人。';

  @override
  String get groupDmRateLimited => '您的操作过于频繁。请稍候片刻再试。';

  @override
  String get groupDmCreateInviteFailed => '无法创建邀请链接';

  @override
  String get groupDmCreateInviteFailedBody => '无法生成邀请链接。请再试一次。';

  @override
  String get guildNavbarCreateInviteFailed => '无法创建邀请链接。请重试。';

  @override
  String get guildNavbarCreateInviteMissingPermissions => '你没有在此频道创建邀请的权限。';

  @override
  String get guildNavbarCreateInviteMaxInvites => '此社区已达到邀请上限。';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled => '创建邀请功能在此社区暂时被禁用。';

  @override
  String get groupDmCopyInviteFailed => '复制邀请链接失败';

  @override
  String get groupDmInvitesOwnerOnly => '只有群主可以管理邀请。';

  @override
  String get groupDmNoInvitesCreated => '暂无邀请';

  @override
  String get groupDmLoadingInvites => '正在加载邀请…';

  @override
  String get groupDmInvitesLoadFailed => '邀请加载失败。请重试。';

  @override
  String get groupDmInvitesRevokeConfirm => '要撤销此邀请吗？此操作无法撤销。';

  @override
  String get groupDmInviteRevoked => '邀请已撤销';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return '由 $name 创建。将在 $time 后过期。';
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
  String get composerOpenExpressionPicker => '打开表情选择器';

  @override
  String get composerShowKeyboard => '显示键盘';

  @override
  String get composerCloseAttachmentPanel => '关闭附件选择器';

  @override
  String get chatAttachmentPanelPhotos => '照片';

  @override
  String get chatAttachmentPanelFiles => '文件';

  @override
  String get chatAttachmentLibraryPermissionTitle => '需要访问照片图库';

  @override
  String get chatAttachmentLibraryPermissionBody => '允许访问照片图库以浏览和附加最近的照片和视频。';

  @override
  String get chatAttachmentLibraryPermissionSettings => '打开设置';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => '，正在发送';

  @override
  String get messageAccessibilityFailedSuffix => '，发送失败';

  @override
  String get messageAccessibilityAttachmentSummary => '一个附件';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count 个附件';
  }

  @override
  String get messageAccessibilityImageSummary => '一张图片';

  @override
  String get messageAccessibilityVideoSummary => '一个视频';

  @override
  String get messageAccessibilityAudioSummary => '一个音频文件';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return '贴纸 $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return '文件 $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => '一个隐藏内容附件';

  @override
  String get messageAccessibilityEmbedSummary => '一个嵌入';

  @override
  String get messageAccessibilityEmptySummary => '一条消息';

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
  String get userSettingsSearchPlaceholder => '搜索设置…';

  @override
  String get userSettingsSearchFieldLabel => '搜索设置';

  @override
  String get userSettingsSearchClear => '清除搜索';

  @override
  String get userSettingsSearchNoResults => '未找到设置';

  @override
  String get userSettingsNavProfile => '个人资料';

  @override
  String get userSettingsNavSecurityLogin => '安全与登录';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => '礼物';

  @override
  String get giftSettingsClaimAccountTitle => '认领你的账号';

  @override
  String get giftSettingsClaimAccountDescription =>
      '领取你的账户以兑换或管理 Plutonium 礼品码。';

  @override
  String get giftSettingsRedeemTitle => '兑换礼物';

  @override
  String get giftSettingsRedeemDescription => '输入兑换码以兑换您账户的 Plutonium。';

  @override
  String get giftSettingsRedeemPlaceholder => '输入礼物码…';

  @override
  String get giftSettingsRedeemButton => '兑换';

  @override
  String get giftSettingsRedeemSuccess => '已成功兑换礼物。请享用您的 Plutonium。';

  @override
  String get giftSettingsPurchasedTitle => '已购礼物';

  @override
  String get giftSettingsPurchasedDescription =>
      '管理您购买的 Plutonium 礼品码。与特别的人分享礼品链接，或自行兑换！';

  @override
  String get giftSettingsEmptyTitle => '暂无礼物';

  @override
  String get giftSettingsEmptyDescription =>
      '从“Plutonium”标签页购买 Plutonium 礼物与好友分享。';

  @override
  String get giftSettingsGoToPlutonium => '前往 Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => '礼物库存加载失败';

  @override
  String get giftSettingsLoadFailedDescription => '请稍后重试。';

  @override
  String get giftSettingsTryAgain => '重试';

  @override
  String get giftSettingsGiftUrl => '礼物链接';

  @override
  String get giftSettingsCopy => '复制';

  @override
  String get giftSettingsCopied => '已复制';

  @override
  String get giftSettingsGiftUrlCopied => '礼物链接已复制到剪贴板！';

  @override
  String get giftSettingsGiftUrlCopyFailed => '无法复制礼物链接';

  @override
  String giftSettingsPurchasedDate(String date) {
    return '购买于 $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return '已兑换 $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return '已由 $name 兑换';
  }

  @override
  String get giftSettingsAlreadyRedeemed => '此礼物已兑换';

  @override
  String get giftSettingsRedeemForYourself => '为自己兑换';

  @override
  String get giftSettingsShareWithFriend => '分享给好友';

  @override
  String get premiumPlutoniumTagline => '解锁更高上限和专属功能，同时支持一个独立的通讯平台。';

  @override
  String get premiumPurchaseMode => '购买方式';

  @override
  String get premiumForMe => '为我';

  @override
  String get premiumAsAGift => '作为礼物';

  @override
  String get premiumMonthly => '每月';

  @override
  String get premiumYearly => '每年';

  @override
  String get premiumPerMonth => '/月';

  @override
  String get premiumPerYear => '每年';

  @override
  String get premiumOneTimePurchase => '一次性购买';

  @override
  String get premiumSave17 => '立省 17%';

  @override
  String get premiumUpgradeNow => '立即升级';

  @override
  String get premiumBuyGift => '赠送';

  @override
  String get premiumOneYearGift => '1 年赠礼';

  @override
  String get premiumOneMonthGift => '1个月赠礼';

  @override
  String get premiumMostPopular => '最受欢迎';

  @override
  String get premiumScrollPrompt => '向下滚动，查看 Plutonium 包含的所有特权';

  @override
  String get premiumFreeVsPlutonium => '免费版与 Plutonium 版';

  @override
  String get premiumFreeColumn => '免费';

  @override
  String get premiumGiftSectionTitle => '赠送 Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      '将 Plutonium 的体验分享给你的朋友，购买一份礼品订阅。';

  @override
  String get premiumGiftBannerOne => '您有一个新的礼品码等待领取！';

  @override
  String premiumGiftBannerMany(int count) {
    return '您有 $count 个新的礼品码待领取！';
  }

  @override
  String get premiumViewGifts => '查看礼物';

  @override
  String get premiumReadyToUpgrade => '准备好升级了吗？';

  @override
  String get premiumReadyToBuyGift => '准备好购买礼物了吗？';

  @override
  String premiumMonthlyPrice(String price) {
    return '每月 $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return '每年 $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 年 $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 个月 $price';
  }

  @override
  String get premiumManageSubscription => '管理订阅';

  @override
  String get premiumRedeemGiftCode => '兑换礼品码';

  @override
  String get premiumGiftBadge => '赠送';

  @override
  String get premiumCancelSubscriptionTitle => '取消订阅？';

  @override
  String get premiumCancelSubscriptionBody =>
      '您可以保留特权直到下一个续订日期，之后有 3 天的宽限期来重新订阅并保留您的订阅历史记录。';

  @override
  String get premiumCancelSubscriptionConfirm => '取消订阅';

  @override
  String get premiumKeepSubscription => '保留订阅';

  @override
  String get premiumPurchaseHistoryTitle => '购买记录';

  @override
  String get premiumPurchaseHistoryDescription =>
      '您最近的账单。要更改订阅的付款方式，请在账单门户中添加或选择一种并将其设为默认。';

  @override
  String get premiumManagePaymentMethods => '管理付款方式';

  @override
  String get premiumBillingHistory => '账单历史';

  @override
  String get premiumSelfServeRefundTitle => '自助退款';

  @override
  String get premiumSelfServeRefundButton => '退款最近一次购买';

  @override
  String get premiumDisclaimerAgreementPrefix => '购买即表示您同意我们的 ';

  @override
  String get premiumDisclaimerAgreementPastPrefix => '购买即表示您同意我们的 ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' 和 ';

  @override
  String premiumActiveUntil(String date) {
    return '在此之前有效 $date';
  }

  @override
  String get premiumSubscriptionCanceling => '正在取消';

  @override
  String premiumCancelsOn(String date) {
    return '将于 $date 取消。在此之前，权益将保持有效。';
  }

  @override
  String get premiumReactivateSubscription => '重新激活';

  @override
  String premiumGiftedUntil(String date) {
    return '已赠送至 $date。不会自动续订。';
  }

  @override
  String get premiumComparisonFeatureColumn => '功能';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return '购买即表示您同意我们的$terms和$privacy。';
  }

  @override
  String get premiumDisclaimerRefund =>
      '付款后 3 天内可自助退款，每 30 天限一次。退款订阅将取消订阅。欧盟/欧洲经济区买家在结账时放弃 14 天撤回权，以立即访问内容。请使用应用内退款按钮，而不是申请退单。退单可能会永久限制您的帐户。Stripe 安全处理付款。我们绝不会看到您的完整卡号。';

  @override
  String get premiumTermsOfService => '服务条款';

  @override
  String get premiumPrivacyPolicy => '隐私政策';

  @override
  String get premiumCheckoutStartFailedTitle => '无法开始结账';

  @override
  String get premiumCheckoutStartFailedBody => '启动结账时出现问题。请稍后重试。';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      '您目前使用的是赠送订阅，它不会自动续订。您可以兑换更多赠送码来延长订阅时长。赠送订阅结束后，您可以开始常规订阅。';

  @override
  String get premiumPlanUnavailable => '此套餐不可用。请联系客服。';

  @override
  String get premiumCompletePaymentTitle => '完成支付';

  @override
  String get premiumCompletePaymentBody => '您即将跳转至 Stripe 完成支付。完成后请返回 Fluxer。';

  @override
  String get premiumChoosePaymentMethodTitle => '选择付款方式';

  @override
  String get premiumPixPaymentPromptDescription =>
      '使用 Pix 自动支付，直接从您的巴西银行账户授权定期扣款。或者选择使用银行卡，在 Stripe 的下一个屏幕上输入信用卡信息。';

  @override
  String get premiumUsePix => '使用 Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      '使用 UPI 付款，即可设置符合 RBI 规定的印度银行电子授权。或者选择使用银行卡，在 Stripe 的下一个屏幕上输入信用卡信息。';

  @override
  String get premiumUseUpi => '使用 UPI';

  @override
  String get premiumUseCard => '使用银行卡';

  @override
  String get premiumCustomerPortalOpenFailedTitle => '无法打开账单门户';

  @override
  String get premiumCustomerPortalOpenFailedBody => '打开账单门户时出现问题。请稍后重试。';

  @override
  String get premiumAlreadyVisionaryTitle => '您已经是远见者了';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary 已包含永久访问权限，因此无需订阅。您仍然可以为他人购买礼物。';

  @override
  String get premiumExistingSubscriptionTitle => '已订阅';

  @override
  String get premiumExistingSubscriptionBody =>
      '我们已在此账号下找到一个现有的 Fluxer Plutonium 订阅。请在安全账单门户中管理它，以更新付款详情或查看续订状态。如果您刚付款，请等待一分钟后重新打开此页面。';

  @override
  String get premiumPurchasesDisabledTitle => '无法购买';

  @override
  String get premiumPurchasesDisabledBody =>
      '此账号已禁用购买功能。如果此情况不正确，请联系 support@fluxer.app。';

  @override
  String get premiumClaimAccountToPurchase => '认领您的账号以购买 Fluxer Plutonium。';

  @override
  String get premiumVerifyEmailToPurchase =>
      '您需要先验证您的电子邮件，然后才能购买 Fluxer Plutonium。';

  @override
  String get premiumPerkCustomUsernameTag => '自定义用户名标签';

  @override
  String get premiumPerkPerCommunityProfiles => '社群专属个人资料';

  @override
  String get premiumPerkMessageScheduling => '消息定时发送';

  @override
  String get premiumPerkProfileBadge => '个人资料徽章';

  @override
  String get premiumPerkCustomVideoBackgrounds => '自定义视频背景';

  @override
  String get premiumPerkEntranceSounds => '进场音效';

  @override
  String get premiumPerkCommunities => '社群';

  @override
  String get premiumPerkMessageCharacterLimit => '消息字数限制';

  @override
  String get premiumPerkBookmarkedMessages => '已收藏的消息';

  @override
  String get premiumPerkFileUploadSize => '文件上传大小';

  @override
  String get premiumPerkEmojiStickerPacks => '表情符号和贴纸包';

  @override
  String get premiumPerkSavedMedia => '已保存的媒体';

  @override
  String get premiumPerkUseAnimatedEmojis => '使用动态表情';

  @override
  String get premiumPerkGlobalEmojiStickerAccess => '全球表情和贴纸访问';

  @override
  String get premiumPerkVideoQuality => '视频画质';

  @override
  String get premiumPerkAnimatedAvatarsBanners => '动态头像和个人资料横幅';

  @override
  String get premiumPerkEarlyAccess => '抢先体验新功能';

  @override
  String get premiumPerkCustomThemes => '自定义主题';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => '高达 4K/60fps';

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
  String get userSettingsNavShortcuts => '快捷键';

  @override
  String get audioAndVideoAudioSectionTitle => '音频';

  @override
  String get audioAndVideoAudioSectionDescription => '配置你的麦克风、扬声器和语音处理。';

  @override
  String get audioAndVideoVideoSectionTitle => '视频';

  @override
  String get audioAndVideoVideoSectionDescription => '配置你的摄像头和屏幕共享质量。';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => '通话中行为';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      '在语音和视频通话中控制确认提示。';

  @override
  String get audioAndVideoInputDeviceLabel => '输入设备';

  @override
  String get audioAndVideoOutputDeviceLabel => '输出设备';

  @override
  String get audioAndVideoDefaultDeviceLabel => '默认';

  @override
  String get audioAndVideoUseSpeakerLabel => '使用扬声器';

  @override
  String get audioAndVideoUseSpeakerDescription => '关闭时，音频将通过听筒或已连接的耳机播放。';

  @override
  String get audioAndVideoInputVolumeLabel => '输入音量';

  @override
  String get audioAndVideoOutputVolumeLabel => '输出音量';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => '语音处理';

  @override
  String get audioAndVideoFocusedVoiceLabel => '专注语音';

  @override
  String get audioAndVideoFocusedVoiceDescription => '推荐。优化麦克风，让语音更清晰。';

  @override
  String get audioAndVideoDirectInputLabel => '直接输入';

  @override
  String get audioAndVideoDirectInputDescription =>
      '直接发送你的音频，不作任何处理。如果你正在使用外部音频软件，推荐此选项。';

  @override
  String get audioAndVideoCustomProfileLabel => '自定义';

  @override
  String get audioAndVideoCustomProfileDescription => '自行调整各项设置：降噪、回声消除和增益。';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => '降噪';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => '增强';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => '标准';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => '无';

  @override
  String get audioAndVideoEchoCancellationLabel => '回音消除';

  @override
  String get audioAndVideoAutomaticGainControlLabel => '自动增益控制';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      '自动均衡麦克风音量。开启增强抑制时关闭。';

  @override
  String get audioAndVideoMicTestSectionTitle => '麦克风测试';

  @override
  String get audioAndVideoMicTestStartLabel => '开始麦克风测试';

  @override
  String get audioAndVideoMicTestStopLabel => '停止麦克风测试';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName 需要麦克风访问权限才能测试您的输入。';
  }

  @override
  String get audioAndVideoCameraLabel => '摄像头';

  @override
  String get audioAndVideoMirrorCameraLabel => '镜像摄像头';

  @override
  String get audioAndVideoCameraQualitySectionTitle => '相机画质';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle => '屏幕共享画质';

  @override
  String get audioAndVideoFrameRateSectionTitle => '帧率';

  @override
  String get audioAndVideoFrameRate15Label => '15 帧/秒';

  @override
  String get audioAndVideoFrameRate30Label => '30 帧/秒';

  @override
  String get audioAndVideoFrameRate60Label => '60 帧/秒';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p 和 60 FPS 需要 $premiumProductName。';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      '此实例目前支持最高 720p、30 FPS 的屏幕共享。';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName 需要麦克风权限才能列出你的设备。';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName 需要相机访问权限才能列出您的设备。';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel => '隐藏我的摄像头时不再询问';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel => '隐藏我的屏幕共享时不再询问';

  @override
  String get userSettingsNavNotifications => '通知';

  @override
  String get notificationsGeneralSectionTitle => '通用';

  @override
  String get notificationsEnableNotificationsLabel => '开启通知';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return '当您收到消息时获取通知。您可能需要在设备设置中允许 $productName 的通知。如需进行频道/社群通知控制，请从社群菜单中打开通知设置。';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel => '开启桌面通知';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      '使用系统通知中心。要设置频道/社群通知，请右键点击社群图标，然后打开通知设置。';

  @override
  String get notificationsEnableBrowserNotificationsLabel => '开启浏览器通知';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      '当您收到消息时获取通知。您可能需要在浏览器设置中允许通知。如需设置频道/社群通知，请右键点击社群图标并打开通知设置。';

  @override
  String get notificationsPushInactiveTimeoutLabel => '推送通知不活跃超时';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName 会在您使用电脑时停止向您的移动设备发送推送通知。请选择您希望在桌面端处于非活动状态多长时间后，才开始接收推送通知。';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute 分钟';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => '提及偏好';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel => '回复提及偏好设置';

  @override
  String get notificationsMentionNoPreferenceName => '无偏好';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      '尊重发送者意图，对方切换@提及设置时，不发出提醒';

  @override
  String get notificationsMentionPreferMentionName => '@提及偏好';

  @override
  String get notificationsMentionPreferMentionDescription =>
      '默认回复会提及你，如果对方关闭此功能，会提醒对方';

  @override
  String get notificationsMentionPreferNoMentionName => '不接收提及通知';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      '默认回复不带@提及，如果发送者开启了@提及，则会收到警告';

  @override
  String get notificationsTtsSectionTitle => '文本转语音通知';

  @override
  String get notificationsTtsEnableCommandLabel => '启用 /tts 语音播放';

  @override
  String get notificationsTtsEnableCommandDescription =>
      '让 /tts 朗读你的消息。禁用此设置后，这些命令将显示为普通文本。';

  @override
  String get notificationsTtsAccessibilityLinkPrefix => '在以下位置调整播放速度 ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => '无障碍';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => '自动朗读消息';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      '将收到的内容转为语音，无论是否来自 /tts。';

  @override
  String get notificationsTtsModeAllChannelsName => '所有频道';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      '朗读每条收到的消息，无论当前打开哪个频道。';

  @override
  String get notificationsTtsModeCurrentChannelName => '仅当前频道';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      '仅朗读您正在查看的频道。切换频道时，朗读会随之切换。';

  @override
  String get notificationsTtsModeNeverName => '从不自动播放';

  @override
  String get notificationsTtsModeNeverDescription => '除非有人手动运行 /tts，否则保持静默。';

  @override
  String get notificationsTtsModeAriaLabel => '朗读所有消息';

  @override
  String get notificationsSoundsSectionTitle => '声音';

  @override
  String get notificationsMasterVolumeLabel => '主音量';

  @override
  String get notificationsMasterVolumeDescription => '设置所有音效的音量。单独音效设置会覆盖此项。';

  @override
  String get notificationsResetToDefaultVolume => '重置为默认音量';

  @override
  String get notificationsDisableAllSoundsLabel => '关闭所有通知提示音';

  @override
  String get notificationsDisableAllSoundsDescription => '您现有的通知声音设置将保留不变。';

  @override
  String get notificationsShowMoreSoundEffects => '显示更多音效';

  @override
  String get notificationsShowFewerSoundEffects => '显示更少的音效';

  @override
  String get notificationsPreviewSound => '试听提示音';

  @override
  String get notificationsPerSoundVolumeTitle => '单条提示音量';

  @override
  String get notificationsPerSoundVolumeDescription =>
      '为单个声音设置自定义音量。未单独设置音量的声音将遵循主音量设置。';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return '已启用的自定义音量设置：$overrideCount。';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return '跟随主设置 • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return '将\"$label\"重置为主音量';
  }

  @override
  String get notificationsResetAllOverrides => '重置所有自定义设置';

  @override
  String notificationsMuteSound(String label) {
    return '静音 $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '取消静音 $label';
  }

  @override
  String get notificationsSoundMessage => '社群消息通知';

  @override
  String get notificationsSoundDirectMessage => '私信通知';

  @override
  String get notificationsSoundSameChannelMessage => '当前频道消息通知';

  @override
  String get notificationsSoundMute => '语音静音';

  @override
  String get notificationsSoundUnmute => '语音取消静音';

  @override
  String get notificationsSoundDeaf => '语音闭麦';

  @override
  String get notificationsSoundUndeaf => '解除闭麦';

  @override
  String get notificationsSoundUserJoin => '用户加入频道';

  @override
  String get notificationsSoundUserLeave => '用户离开频道';

  @override
  String get notificationsSoundUserMove => '用户移动了频道';

  @override
  String get notificationsSoundViewerJoin => '观众加入直播';

  @override
  String get notificationsSoundViewerLeave => '观众离开直播';

  @override
  String get notificationsSoundVoiceDisconnect => '语音已断开';

  @override
  String get notificationsSoundIncomingRing => '来电';

  @override
  String get notificationsSoundCameraOn => '摄像头已开启';

  @override
  String get notificationsSoundCameraOff => '摄像头已关闭';

  @override
  String get notificationsSoundScreenShareStart => '屏幕共享开始';

  @override
  String get notificationsSoundScreenShareStop => '屏幕共享已停止';

  @override
  String get notificationsAfkTimeoutSyncFailed => '无法更新推送通知超时设置。请重试。';

  @override
  String get notificationsMentionPreferenceSyncFailed => '无法更新提及偏好设置。请重试。';

  @override
  String get notificationsPermissionDeniedTitle => '通知已屏蔽';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      '无法启用通知。请允许通知权限后继续。';

  @override
  String get userSettingsNavLanguageAndTime => '语言与时间';

  @override
  String get languageAndTimeLanguageSectionTitle => '界面语言';

  @override
  String get languageAndTimeLanguageSectionDescription => '选择应用中使用的语言';

  @override
  String get languageAndTimeOpenLanguageSettings => '打开语言设置';

  @override
  String get languageAndTimeTimeFormatSectionTitle => '时间格式';

  @override
  String get languageAndTimeTimeFormatSectionDescription => '选择应用中时间的显示方式';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => '时间格式选择';

  @override
  String get languageAndTimeTimeFormatAuto => '自动';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 小时制';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 小时制';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return '应用语言：$format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return '系统语言区域：$format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat => '使用系统语言区域设置时间格式';

  @override
  String get languageAndTimeTimeFormatSyncFailed => '更新时间格式失败';

  @override
  String get userSettingsNavDefaultApps => '默认应用';

  @override
  String get defaultAppsWebBrowserSectionTitle => '网页浏览器';

  @override
  String get defaultAppsWebBrowserSectionDescription => '选择点击链接时打开的浏览器。';

  @override
  String get defaultAppsWebBrowserNativeAppNote => '如果已安装某个网站的应用，链接将优先在该应用中打开。';

  @override
  String get defaultAppsWebBrowserInApp => '应用内浏览器';

  @override
  String get defaultAppsWebBrowserExternal => '外部浏览器';

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
  String get advancedSettingsConfigure => '配置';

  @override
  String get advancedSettingsCategoryPrivacy => '隐私';

  @override
  String get advancedSettingsCategoryAppearance => '外观';

  @override
  String get advancedSettingsCategoryAccessibility => '无障碍';

  @override
  String get advancedSettingsCategoryChat => '聊天';

  @override
  String get advancedSettingsCategoryMedia => '媒体';

  @override
  String get advancedSettingsCategoryVoice => '语音';

  @override
  String get advancedSettingsCategoryDeveloper => '开发者';

  @override
  String get advancedSettingEnableTextSelectionLabel => '启用文本选择';

  @override
  String get advancedSettingEnableTextSelectionDescription => '允许在应用中选择文本';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel => '启用视频片段缩略图';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription => '视频播放时显示缩略图或实时帧';

  @override
  String get advancedSettingHapticFeedbackLabel => '触感反馈';

  @override
  String get advancedSettingHapticFeedbackDescription => '轻触和操作的振动反馈。不会跨设备同步。';

  @override
  String get advancedSettingShowNekoLabel => '显示 Neko';

  @override
  String get advancedSettingShowNekoDescription => '一只会跟着你鼠标指针跑的猫咪';

  @override
  String get advancedSettingShowNekoDescriptionTouch => '在聊天输入框中显示 Neko';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel => '启动缩放动画';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      '离开启动屏时缩小 Logo';

  @override
  String get advancedSettingKeyboardHintsLabel => '键盘提示';

  @override
  String get advancedSettingKeyboardHintsDescription => '工具提示中的键盘快捷键提示';

  @override
  String get advancedSettingEnableFavoritesLabel => '启用收藏夹';

  @override
  String get advancedSettingEnableFavoritesDescription => '在整个应用中显示收藏夹';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel => '语音频道加入行为';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      '确认或双击以加入社区语音频道。';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel => '加入语音频道需双击';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel => '加入语音频道前确认';

  @override
  String get advancedSettingAutoSendGifsLabel => '选中后自动发送GIF';

  @override
  String get advancedSettingAutoSendGifsDescription => '从选择器自动发送 GIF，无需确认';

  @override
  String get advancedSettingSaveGifFavoritesLabel => '将收藏的 GIF 保存为媒体';

  @override
  String get advancedSettingSaveGifFavoritesDescription => '选择收藏的 GIF 存储方式';

  @override
  String get advancedSettingMediaButtonsLabel => '媒体按钮';

  @override
  String get advancedSettingMediaButtonsDescription =>
      '自定义媒体附件和嵌入内容上显示哪些按钮和指示器';

  @override
  String get advancedSettingPreuploadAttachmentsLabel => '发送前上传附件';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      '添加附件到消息输入框后，立即开始上传';

  @override
  String get advancedSettingStripTrackingLabel => '移除链接跟踪参数';

  @override
  String get advancedSettingStripTrackingDescription => '自动移除你发送消息中网址的跟踪参数';

  @override
  String get advancedSettingTrustAllLinksLabel => '信任所有外部链接';

  @override
  String get advancedSettingTrustAllLinksDescription => '跳过所有域名的外部链接警告';

  @override
  String get advancedSettingSearchEnginesLabel => '搜索引擎';

  @override
  String get advancedSettingSearchEnginesDescription => '配置从选定文本中使用的搜索引擎';

  @override
  String get advancedSettingTranslatorsLabel => '翻译人员';

  @override
  String get advancedSettingTranslatorsDescription => '配置从选定文本使用的翻译提供程序';

  @override
  String get advancedSettingReverseImageSearchLabel => '搜图';

  @override
  String get advancedSettingReverseImageSearchDescription => '反向图像搜索提供程序';

  @override
  String get advancedSettingMessageActionBarLabel => '消息操作栏';

  @override
  String get advancedSettingMessageActionBarDescription => '自定义鼠标悬停在消息上时显示的操作栏';

  @override
  String get advancedSettingExpressionAutocompleteLabel => '表情自动补全';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      '选择在消息输入框中键入冒号时显示的内容';

  @override
  String get advancedSettingInputButtonsLabel => '消息输入按钮';

  @override
  String get advancedSettingInputButtonsDescription => '选择要在消息输入框中显示的按钮';

  @override
  String get advancedSettingScrollToBottomOnSendLabel => '发送消息后滚动到底部';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      '选择发送消息后聊天窗口的滚动方式';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel => '跳过\"全部标为已读\"确认';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      '将所有未读收件箱频道标记为已读，无需确认';

  @override
  String get advancedSettingHideMutedChannelsLabel => '默认隐藏已静音的频道';

  @override
  String get advancedSettingHideMutedChannelsDescription => '在社群侧边栏中隐藏你已静音的频道';

  @override
  String get advancedSettingShowGifIndicatorLabel => '显示 GIF 提示';

  @override
  String get advancedSettingShowAttachmentExpiryLabel => '显示附件过期指示';

  @override
  String get advancedSettingShowMediaDeleteLabel => '显示删除按钮';

  @override
  String get advancedSettingShowMediaDownloadLabel => '显示下载按钮';

  @override
  String get advancedSettingShowMediaFavoriteLabel => '显示收藏按钮';

  @override
  String get advancedSettingShowSuppressEmbedsLabel => '显示屏蔽嵌入内容按钮';

  @override
  String get advancedSettingShowMessageActionBarLabel => '显示消息操作栏';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => '只显示\"更多\"按钮';

  @override
  String get advancedSettingShowQuickReactionsLabel => '显示快捷回应';

  @override
  String get advancedSettingEnableShiftToExpandLabel => '启用 Shift 键展开';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      '在表情自动补全中显示默认表情';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      '在表情自动补全中显示自定义表情';

  @override
  String get advancedSettingShowStickersAutocompleteLabel => '在表情自动填充中显示贴纸';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      '在表情自动填充中显示已保存的媒体';

  @override
  String get advancedSettingShowGifsButtonLabel => '显示 GIF 按钮';

  @override
  String get advancedSettingShowMediaButtonLabel => '显示媒体按钮';

  @override
  String get advancedSettingShowStickersButtonLabel => '显示贴纸按钮';

  @override
  String get advancedSettingShowEmojiButtonLabel => '显示表情按钮';

  @override
  String get advancedSettingShowSendButtonLabel => '显示发送按钮';

  @override
  String get advancedSettingNewDeviceAlertsLabel => '显示新设备提醒';

  @override
  String get advancedSettingNewDeviceAlertsDescription => '提示新的音频设备';

  @override
  String get advancedSettingConnectionVolumeControlsLabel => '连接音量控制';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      '在语音菜单中显示每个设备的参与者音量滑块';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel => '屏幕共享预览行为';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      '预览、弹出和流式缩略图行为';

  @override
  String get advancedSettingScreenShareCodecLabel => '屏幕共享编解码器';

  @override
  String get advancedSettingScreenShareCodecDescription => '屏幕共享的视频编解码器';

  @override
  String get advancedSettingScreenShareCodecAuto => '自动（推荐）';

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
  String get advancedSettingPauseScreenSharePreviewLabel => '在后台暂停我的屏幕共享预览';

  @override
  String get advancedSettingHideStreamPreviewLabel => '隐藏我的直播预览缩略图';

  @override
  String get advancedSettingDeveloperModeLabel => '启用开发者模式';

  @override
  String get advancedSettingDeveloperModeDescription => '启用开发者模式';

  @override
  String get advancedSettingSearchEngineGoogle => 'Google';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => '必应';

  @override
  String get advancedSettingSearchEngineGoogleLens => 'Google Lens';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => '谷歌翻译';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => '默认搜索引擎';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      '选择在搜索选中文字时默认使用的搜索引擎。';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => '内置搜索引擎';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      '启用或停用内置搜索引擎。启用后，在消息中选择文本时，它们会显示在上下文菜单中。';

  @override
  String get advancedSettingCustomSearchEnginesLabel => '自定义搜索引擎';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return '添加你自己的搜索引擎，并自定义网址模式。请使用“$query”作为搜索文本的占位符。';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => '添加搜索引擎';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel => '请至少启用一个搜索引擎。';

  @override
  String get advancedSettingRemoveSearchEngineLabel => '移除搜索引擎';

  @override
  String get advancedSettingDefaultTranslatorLabel => '默认翻译器';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      '选择翻译选中文字时默认使用的翻译器。';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => '内置翻译器';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      '启用或停用内置翻译器。启用后，在选中文字时，翻译器会出现在消息上下文菜单中。';

  @override
  String get advancedSettingCustomTranslatorsLabel => '自定义翻译器';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return '使用自定义网址模式添加你自己的翻译器。使用“$query”作为要翻译文本的占位符。';
  }

  @override
  String get advancedSettingAddTranslatorLabel => '添加翻译器';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel => '请至少启用一个翻译器。';

  @override
  String get advancedSettingRemoveTranslatorLabel => '移除翻译器';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel => '默认反向图片搜索';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      '选择默认的反向图片搜索服务。';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel => '内置识图搜索';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      '启用或停用内置反向图片搜索提供方。已启用的提供方会显示在图片、头像、横幅、贴纸和表情的上下文菜单中。';

  @override
  String get advancedSettingCustomReverseImageSearchLabel => '自定义识图搜索';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return '添加自定义网址模式的自定义反向图片搜索提供商。使用“$url”作为图片网址的占位符。';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel => '添加反向图片搜索';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      '请至少启用一个反向图片搜索提供方。';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel => '移除反向图片搜索';

  @override
  String get advancedSettingAddSearchEngineTitle => '添加搜索引擎';

  @override
  String get advancedSettingEditSearchEngineTitle => '编辑搜索引擎';

  @override
  String get advancedSettingAddTranslatorTitle => '添加翻译提供商';

  @override
  String get advancedSettingEditTranslatorTitle => '编辑翻译提供方';

  @override
  String get advancedSettingAddReverseImageSearchTitle => '添加反向图片搜索引擎';

  @override
  String get advancedSettingEditReverseImageSearchTitle => '编辑反向图片搜索引擎';

  @override
  String get advancedSettingSearchProviderNameLabel => '名称';

  @override
  String get advancedSettingSearchProviderUrlLabel => '网址格式';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder => '我的搜索引擎';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder => '我的翻译器';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder => '我的搜图';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return '在搜索文本中插入“$query”。';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return '在“$query”中输入要翻译的文本。';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return '在此处插入图片 URL 时，请使用“$url”。';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => '名称为必填项。';

  @override
  String get advancedSettingSearchProviderUrlRequired => '需要填写网址格式。';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL 模式必须包含“$query”。';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL 模式必须包含“$url”占位符。';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid => 'URL 模式必须是有效的网址。';

  @override
  String get advancedSettingAddSearchProviderAction => '添加';

  @override
  String get advancedSettingEditSearchProviderAction => '编辑';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => '移除';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return '您确定要移除 $engineName 吗？';
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
  String get userSettingsJoinFluxerLabs => '加入 Fluxer 实验室';

  @override
  String get userSettingsNavAppLicenses => '应用许可';

  @override
  String get userSettingsAppLicensesDescription =>
      '本应用使用的开源软件。本应用基于 Flutter 构建。';

  @override
  String get userSettingsAppLicensesLoadError => '无法加载应用许可。';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个许可证',
      one: '1 个许可证',
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
  String get savedMessagesEmptyTitle => '无书签';

  @override
  String get savedMessagesEmptyBody => '收藏消息，稍后查看。';

  @override
  String get savedMessagesEndBody => '这里没有更多内容了。';

  @override
  String get savedMessagesRemoveTooltip => '取消收藏';

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
  String get uiSearch => '搜索';

  @override
  String get uiStartCall => '发起通话';

  @override
  String get uiStartVideoCall => '发起视频通话';

  @override
  String get uiPlay => '播放';

  @override
  String get uiPause => '暂停';

  @override
  String get uiDownload => '下载';

  @override
  String get uiMoreActions => '更多操作';

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
    return '此操作将通知 $count 位拥有 $roleName 角色的成员。继续？';
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
  String get guildNavbarGuildSelected => '已选';

  @override
  String get guildNavbarGuildUnread => '未读';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条提及',
      one: '1 条提及',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => '已静音';

  @override
  String get authShowPassword => '显示密码';

  @override
  String get authHidePassword => '隐藏密码';

  @override
  String get chatLoadingMessages => '正在加载消息';

  @override
  String get friendsMessageFriend => '发消息';

  @override
  String get friendsFriendActions => '好友操作';

  @override
  String get friendsAcceptRequest => '接受好友请求';

  @override
  String get friendsDeclineRequest => '拒绝好友请求';

  @override
  String get friendsCancelRequest => '取消好友请求';

  @override
  String get friendsOpenInbox => '收件箱';

  @override
  String get profileRemoveFriend => '删除好友';

  @override
  String get profileUnblockUser => '取消屏蔽';

  @override
  String get profileAcceptFriendRequest => '接受好友请求';

  @override
  String get profileCancelFriendRequest => '取消好友请求';

  @override
  String get profileSendFriendRequest => '添加好友';

  @override
  String get accountOverflowMenu => '账户选项';

  @override
  String get navHome => '首页';

  @override
  String get navNotifications => '通知';

  @override
  String get navYou => '你';

  @override
  String get guildFolderSettingsTitle => '文件夹设置';

  @override
  String get guildFolderNameLabel => '文件夹名称';

  @override
  String get guildFolderColorLabel => '文件夹颜色';

  @override
  String get guildFolderShowIconWhenCollapsed => '折叠时显示图标';

  @override
  String get guildFolderIconLabel => '文件夹图标';

  @override
  String get guildFolderDelete => '删除文件夹';

  @override
  String get guildFolderIconFolder => '文件夹';

  @override
  String get guildFolderIconStar => '星标';

  @override
  String get guildFolderIconHeart => '心形';

  @override
  String get guildFolderIconBookmark => '书签';

  @override
  String get guildFolderIconGameController => '游戏手柄';

  @override
  String get guildFolderIconShield => '屏蔽';

  @override
  String get guildFolderIconMusicNote => '音符';

  @override
  String get guildFolderMarkAsRead => '将文件夹标为已读';

  @override
  String get guildBulkMuteCommunities => '将社群设为静音';

  @override
  String get guildBulkUnmuteCommunities => '取消社群静音';

  @override
  String get guildBulkCommunityNotificationSettings => '社群通知设置';

  @override
  String get guildBulkCommunityPrivacySettings => '社群隐私设置';

  @override
  String get guildBulkAllowEveryoneAndHere => '允许 @everyone 和 @here';

  @override
  String get guildBulkAllowRoleMentions => '允许提及身份组';

  @override
  String get guildBulkEnableMobilePush => '开启移动推送通知';

  @override
  String get guildBulkDisableMobilePush => '关闭移动推送通知';

  @override
  String get guildBulkAllowDirectMessages => '允许私信';

  @override
  String get guildBulkBlockDirectMessages => '屏蔽私信';

  @override
  String get guildBulkAllowBotDirectMessages => '允许机器人私信';

  @override
  String get guildBulkBlockBotDirectMessages => '屏蔽机器人私信';

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
  String get guildNavbarChannelTypeSelection => '选择频道类型';

  @override
  String get guildNavbarCreateCategory => '创建类别';

  @override
  String get guildNavbarNewCategoryHint => '新建分类';

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
  String get guildMenuSettingsEmoji => '表情符号';

  @override
  String get guildMenuSettingsStickers => '贴纸';

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
  String get guildMenuSettingsInviteLinks => '邀请';

  @override
  String get guildMenuSettingsBans => '封禁';

  @override
  String get guildMenuSettingsChannels => '频道';

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
  String get guildSettingsCreateRole => '创建身份组';

  @override
  String get guildSettingsRolesListTitle => '角色';

  @override
  String get guildSettingsRolesNewRole => '新角色';

  @override
  String get guildSettingsRolesDeleteRole => '删除身份组';

  @override
  String get guildSettingsRolesBackToRoles => '返回身份组';

  @override
  String get guildSettingsBackToSettings => '返回设置';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return '编辑“$name”';
  }

  @override
  String get guildSettingsRolesEditSubtitle => '配置角色设置和权限';

  @override
  String get guildSettingsRolesDisplaySection => '显示';

  @override
  String get guildSettingsRolesRoleName => '角色名称';

  @override
  String get guildSettingsRolesRoleColor => '角色颜色';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      '输入颜色（十六进制、RGB、HSL 或颜色名称），或使用取色器.';

  @override
  String get guildSettingsRolesShowSeparately => '单独显示此身份组';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      '在成员列表中，将拥有此角色的成员显示在单独的部分。';

  @override
  String get guildSettingsRolesAllowMentions => '允许提及此身份组';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return '拥有“$permission”权限的成员可以随时提及角色，不受此设置影响。';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp => '使用此按钮可快速清除所有权限。';

  @override
  String get guildSettingsRolesClearPermissions => '清除权限';

  @override
  String get guildSettingsRolesPermissionsSection => '权限';

  @override
  String get guildSettingsRolesSearchPermissions => '搜索权限';

  @override
  String get guildSettingsRolesDenseLayout => '紧凑布局';

  @override
  String get guildSettingsRolesComfyLayout => '舒适布局';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => '切换为紧凑布局';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => '切换到舒适布局';

  @override
  String get guildSettingsRolesSingleColumn => '单列';

  @override
  String get guildSettingsRolesTwoColumns => '两列';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => '切换为单列';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => '切换为双列';

  @override
  String get guildSettingsRolesNoPermissionsFound => '未找到权限';

  @override
  String get guildSettingsRolesCustomHoistOrder => '自定义排序';

  @override
  String get guildSettingsRolesHoistOrder => '显示顺序';

  @override
  String get guildSettingsRolesResetHoistOrder => '重置为默认值';

  @override
  String get guildSettingsRolesHoistOrderHelp => '拖动角色可调整其在成员列表中的显示顺序。';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      '没有置顶身份组。请在身份组设置中开启\"单独显示此身份组\"即可在此处查看。';

  @override
  String get guildSettingsRolesLockedTooltip => '你无法编辑此角色，因为它高于或等同于你的最高角色';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return '您需要“$permission”权限才能编辑这些权限';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole => '你无法编辑与你最高角色相同或更高层级的角色';

  @override
  String get guildSettingsRolesCannotGrantPermission => '你无法授予自己没有的权限';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      '你无法移除此权限，因为它会把你自己的权限也移除';

  @override
  String get guildSettingsRolesUpdatedSuccess => '角色更新成功';

  @override
  String get guildSettingsRolesCreatedSuccess => '角色创建成功';

  @override
  String get guildSettingsRolesDeletedSuccess => '角色已删除';

  @override
  String get guildSettingsRolesHoistResetSuccess => '提升顺序已重置为默认';

  @override
  String get guildSettingsRolesNameRequiredTitle => '角色名称为必填项';

  @override
  String get guildSettingsRolesNameRequiredBody => '保存前请先给角色命名。';

  @override
  String get guildSettingsRolesCreateFailedTitle => '无法创建角色';

  @override
  String get guildSettingsRolesUpdateFailedTitle => '未能更新角色';

  @override
  String get guildSettingsRolesDeleteFailedTitle => '无法删除角色';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '“$name” 无法删除。请重试。';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle => '无法重置置顶顺序';

  @override
  String get guildSettingsRolesTryAgainInAMoment => '请稍后重试。';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return '确定要删除 $name 角色吗？拥有此角色的任何成员将不再拥有该角色。';
  }

  @override
  String get permissionCategoryCommunityWide => '社群范围';

  @override
  String get permissionCategoryMessagesMedia => '消息与媒体';

  @override
  String get permissionCategoryModeration => '管理';

  @override
  String get permissionCategoryChannelAccess => '频道访问';

  @override
  String get permissionCategoryChannelManagement => '频道管理';

  @override
  String get permissionCategoryAudioVideo => '音频和视频';

  @override
  String get permissionUnknown => '未知权限';

  @override
  String get permissionAdministrator => '管理员';

  @override
  String get permissionAdministratorDescription => '授予所有权限并绕过频道限制。高度敏感。';

  @override
  String get permissionViewActivityLog => '查看活动日志';

  @override
  String get permissionViewActivityLogDescription => '查看社区的活动日志，包括更改和管理操作。';

  @override
  String get permissionManageCommunity => '管理社群';

  @override
  String get permissionManageCommunityDescription => '编辑全局设置，例如名称、描述和图标。';

  @override
  String get permissionManageRoles => '管理角色';

  @override
  String get permissionManageRolesDescription =>
      '创建、编辑或删除低于您最高角色的角色。也可以编辑频道权限覆盖。';

  @override
  String get permissionManageChannels => '管理频道';

  @override
  String get permissionManageChannel => '管理频道';

  @override
  String get permissionManageChannelDescription => '重命名并编辑此频道的设置.';

  @override
  String get permissionManagePermissions => '管理权限';

  @override
  String get permissionManagePermissionsDescription => '编辑此频道中角色和成员的覆盖权限。';

  @override
  String get permissionManageWebhooksChannelDescription => '创建、编辑或删除此频道的网页挂钩。';

  @override
  String get permissionViewChannelMembersChannelDescription => '查看此频道的成员列表。';

  @override
  String get permissionCreateInviteLinksChannelDescription => '管理此频道的邀请链接。';

  @override
  String get permissionOverwriteDeny => '拒绝';

  @override
  String get permissionOverwriteInherit => '中立（继承）';

  @override
  String get permissionOverwriteAllow => '允许';

  @override
  String get permissionOverwriteSetAllHelp => '使用这些按钮可快速设置所有权限。';

  @override
  String get permissionManageChannelsDescription => '创建、编辑或删除频道和类别。';

  @override
  String get permissionKickMembers => '踢出成员';

  @override
  String get permissionBanMembers => '封禁成员';

  @override
  String get permissionCreateInviteLinks => '创建邀请链接';

  @override
  String get permissionChangeOwnNickname => '更改自己的昵称';

  @override
  String get permissionChangeOwnNicknameDescription => '更新你的昵称.';

  @override
  String get permissionManageNicknames => '管理昵称';

  @override
  String get permissionManageNicknamesDescription => '修改其他成员的昵称.';

  @override
  String get permissionCreateEmojiStickers => '创建表情和贴纸';

  @override
  String get permissionCreateEmojiStickersDescription => '上传新的表情和贴纸，并管理你的作品。';

  @override
  String get permissionManageEmojiStickers => '管理表情符号和贴纸';

  @override
  String get permissionManageEmojiStickersDescription => '编辑或删除其他成员创建的表情和贴纸。';

  @override
  String get permissionManageWebhooks => '管理 Webhook';

  @override
  String get permissionManageWebhooksDescription => '创建、编辑或删除 Webhook.';

  @override
  String get permissionSendMessages => '发送消息';

  @override
  String get permissionSendTtsMessages => '发送 TTS 消息';

  @override
  String get permissionSendTtsMessagesDescription => '发送文本转语音消息';

  @override
  String get permissionManageMessages => '管理消息';

  @override
  String get permissionManageMessagesDescription => '删除其他成员的消息。置顶功能单独管理。';

  @override
  String get permissionPinMessages => '置顶消息';

  @override
  String get permissionEmbedLinks => '嵌入链接';

  @override
  String get permissionAttachFiles => '附加文件';

  @override
  String get permissionMentionEveryone => '使用 @everyone、@here 和 @角色';

  @override
  String get permissionMentionEveryoneDescription =>
      '提及所有人或任何身份组（即使该身份组未设置为可提及）。';

  @override
  String get permissionUseExternalEmoji => '使用外部表情符号';

  @override
  String get permissionUseExternalEmojiDescription => '使用其他社群的表情符号.';

  @override
  String get permissionUseExternalStickers => '使用外部贴纸';

  @override
  String get permissionAddReactions => '添加表情回应';

  @override
  String get permissionAddReactionsDescription => '给消息添加新表情回应.';

  @override
  String get permissionBypassSlowmode => '忽略慢速模式';

  @override
  String get permissionBypassSlowmodeDescription => '忽略每个频道的发消息频率限制.';

  @override
  String get permissionTimeOutMembers => '暂停成员活动';

  @override
  String get permissionTimeOutMembersDescription =>
      '禁止成员发送消息、发表反应和加入语音，持续一段时间。';

  @override
  String get permissionViewChannel => '查看频道';

  @override
  String get permissionViewChannelMembers => '查看频道成员';

  @override
  String get permissionViewChannelMembersDescription => '查看社群中频道的成员列表。';

  @override
  String get permissionConnect => '连接';

  @override
  String get permissionSpeak => '发言';

  @override
  String get permissionStreamVideo => '视频直播';

  @override
  String get permissionUseVoiceActivity => '使用语音活动';

  @override
  String get permissionUseVoiceActivityDescription => '没有此权限，需要按住说话。';

  @override
  String get permissionPrioritySpeaker => '优先发言人';

  @override
  String get permissionMuteMembers => '将成员设为静音';

  @override
  String get permissionDeafenMembers => '将成员静音';

  @override
  String get permissionMoveMembers => '移动成员';

  @override
  String get permissionMoveMembersDescription => '将成员拖动到他们有权访问的频道之间。';

  @override
  String get permissionSetVoiceRegion => '设置语音区域';

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
  String get guildSettingsWebhooksDescription => '查看和管理社群中配置的所有 Webhook。';

  @override
  String get guildSettingsWebhooksEmpty => '无 Webhook';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return '此社区尚未设置任何Webhook。前往 $channelSettingsPath 创建一个。';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return '您需要拥有“$permission”权限才能查看和编辑此社区的网络钩子。';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => '未能加载 Webhook';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      '加载 Webhook 时出错。请重试。';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhook 已更新';

  @override
  String get guildSettingsWebhooksUpdateFailed => '未能更新网页挂钩';

  @override
  String get guildSettingsUnknownChannel => '未知频道';

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
  String get guildSettingsDiscoveryDescription => '将你的社群列在\"发现\"中，以便其他人找到并加入。';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => '成员不足';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return '您的社区需要至少有 $count 名成员才能在发现中列出。';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => '状态：';

  @override
  String get guildSettingsDiscoveryStatusPending => '待处理';

  @override
  String get guildSettingsDiscoveryStatusApproved => '已批准';

  @override
  String get guildSettingsDiscoveryStatusRejected => '已拒绝';

  @override
  String get guildSettingsDiscoveryStatusRemoved => '已移除';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return '原因：$reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      '你的社群已在\"发现\"中列出。你可以在下方更新列表详情，或撤回以将其移除。';

  @override
  String get guildSettingsDiscoveryPendingInfo => '你的申请正在审核中。你仍然可以更新资料或撤回申请。';

  @override
  String get guildSettingsDiscoveryCategory => '类别';

  @override
  String get guildSettingsDiscoveryCategoryHelp => '选择最能描述你社群的类别。你可以随时更改。';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => '主要语言';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      '社群成员最常用的语言。用于筛选探索结果。';

  @override
  String get guildSettingsDiscoveryDescriptionField => '描述';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder => '介绍一下你的社群';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => '需要填写描述。';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return '描述必须至少包含 $minLength 个字符。';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return '描述不能超过 $maxLength 个字符。';
  }

  @override
  String get guildSettingsDiscoveryTags => '自定义标签';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return '最多 $maxTags 个标签可帮助人们找到你的社群。它们会显示在“发现”搜索中。';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => '添加标签后按回车键';

  @override
  String get guildSettingsDiscoveryAddTag => '添加';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return '移除标签 $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => '无法添加标签';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return '标签必须为 2 到 $maxLength 个字符，且只能包含字母和数字。';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return '您最多只能添加 $maxTags 个标签。';
  }

  @override
  String get guildSettingsDiscoveryApply => '应用';

  @override
  String get guildSettingsDiscoverySave => '保存';

  @override
  String get guildSettingsDiscoveryWithdraw => '撤回';

  @override
  String get guildSettingsDiscoveryApplicationSent => '发现申请已发送';

  @override
  String get guildSettingsDiscoveryListingUpdated => '发现列表已更新';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn => '发现申请已撤回';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle => '无法撤回申请';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription => '请稍后重试。';

  @override
  String get guildSettingsMembersDescription => '搜索和管理服务器成员。';

  @override
  String get guildSettingsMembersSearchHint => '按用户名或ID搜索';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count 名成员';
  }

  @override
  String get guildMembersRecentTitle => '新成员';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return '显示 $displayedCount / $totalCount 位成员';
  }

  @override
  String get guildMembersSort => '排序';

  @override
  String get guildSettingsMembersSortNewest => '最新优先';

  @override
  String get guildMembersSortOldest => '最早';

  @override
  String get guildMembersColumnName => '名称';

  @override
  String get guildMembersColumnMemberSince => '成员时间';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return '加入 $productName 的日期';
  }

  @override
  String get guildMembersColumnJoinMethod => '加入方式';

  @override
  String get guildMembersColumnRoles => '角色';

  @override
  String get guildMembersColumnActions => '操作';

  @override
  String get guildMembersFilterMemberSince => '按加入时间筛选';

  @override
  String get guildMembersFilterJoinedProduct => '按账号创建日期筛选';

  @override
  String get guildMembersFilterJoinMethod => '按加入方式筛选';

  @override
  String get guildMembersFilterRoles => '按身份组筛选';

  @override
  String get guildMembersFilterAll => '全部';

  @override
  String get guildMembersFilterPast1Hour => '过去 1 小时';

  @override
  String get guildMembersFilterPast24Hours => '过去 24 小时';

  @override
  String get guildMembersFilterPast7Days => '过去 7 天';

  @override
  String get guildMembersFilterPast2Weeks => '过去 2 周';

  @override
  String get guildMembersFilterPast3Weeks => '过去 3 周';

  @override
  String get guildMembersFilterPast4Weeks => '过去 4 周';

  @override
  String get guildMembersFilterPast3Months => '近 3 个月';

  @override
  String get guildMembersFilterCustomRange => '自定义范围…';

  @override
  String get guildMembersDateRangeTitle => '自定义日期范围';

  @override
  String get guildMembersDateAfter => '在此日期之后';

  @override
  String get guildMembersDateBefore => '早于此日期';

  @override
  String get guildMembersClearAll => '全部清除';

  @override
  String get guildMembersRowsPerPage => '每页行数';

  @override
  String get guildMembersEmptySearch => '没有匹配的搜索结果。';

  @override
  String get guildMembersLoadError => '加载成员时出错了。请稍后重试。';

  @override
  String get guildMembersIndexing => '正在索引成员…';

  @override
  String get guildMembersGoToPage => '前往页面';

  @override
  String guildMembersGoToPageItem(int page) {
    return '前往第 $page 页';
  }

  @override
  String get guildMembersJumpToPage => '跳转到页面';

  @override
  String get guildMembersJoinSourceCreator => '社群创建者';

  @override
  String get guildMembersJoinSourceInvite => '邀请';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return '邀请 ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return '$name 邀请加入';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => '自定义网址';

  @override
  String get guildMembersJoinSourceBotInvite => '邀请机器人';

  @override
  String get guildMembersJoinSourcePlatformAdmin => '平台管理员';

  @override
  String get guildMembersJoinSourceDiscovery => '发现';

  @override
  String get guildMembersJoinMethodUnknown => '未知';

  @override
  String get guildMembersCommunityOwner => '社群拥有者';

  @override
  String get guildMembersViewAllRoles => '查看所有角色';

  @override
  String get guildMembersJoinedJustNow => '刚刚';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分钟前',
      one: '1 分钟前',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 小时前',
      one: '1 小时前',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天前',
      one: '1 天前',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => '成员';

  @override
  String get guildMembersChannelListSelected => '成员 (已选)';

  @override
  String get guildSettingsInvitesTitle => '邀请';

  @override
  String get guildSettingsInvitesDescription =>
      '查看此社群的所有邀请。要创建新邀请，请前往频道并使用邀请按钮。';

  @override
  String get guildSettingsInvitesEmpty => '没有邀请链接';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      '此社群还没有任何邀请链接。前往频道并创建邀请，即可邀请他人。';

  @override
  String get guildSettingsInvitesLoadFailedTitle => '邀请加载失败';

  @override
  String get guildSettingsInvitesLoadFailedDescription => '加载邀请时出错。请重试。';

  @override
  String get guildSettingsInvitesTryAgain => '重试';

  @override
  String get guildSettingsInvitesShowCreatedDate => '显示创建日期而非过期日期';

  @override
  String get guildSettingsInvitesPauseInvites => '暂停邀请';

  @override
  String get guildSettingsInvitesEnableInvites => '启用邀请';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle => '暂停本社区的邀请';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle => '允许社群成员邀请他人';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      '暂停邀请？新用户将无法通过邀请链接加入，直到你重新启用。现有成员不受影响。';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      '启用邀请？用户将能再次通过邀请链接加入此社群。';

  @override
  String get guildSettingsInvitesPause => '暂停';

  @override
  String get guildSettingsInvitesPausedForCommunity => '本社区已暂停邀请。';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return '由于 $productName 检测到潜在的恶意攻击，邀请功能已暂停。新用户暂时无法加入。';
  }

  @override
  String get guildSettingsInvitesLabelInviter => '邀请者：';

  @override
  String get guildSettingsInvitesLabelChannel => '频道：';

  @override
  String get guildSettingsInvitesLabelCode => '代码：';

  @override
  String get guildSettingsInvitesLabelUses => '使用：';

  @override
  String get guildSettingsInvitesLabelCreated => '创建时间：';

  @override
  String get guildSettingsInvitesLabelExpires => '过期时间：';

  @override
  String get guildSettingsInvitesUnknown => '未知';

  @override
  String get guildSettingsInvitesNoCategory => '无类别';

  @override
  String get guildSettingsInvitesExpired => '已过期';

  @override
  String get guildSettingsInvitesNever => '从不';

  @override
  String get guildSettingsInvitesCopyLink => '复制邀请链接';

  @override
  String get guildSettingsInvitesRevoke => '撤销邀请';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => '无法撤销邀请';

  @override
  String get guildSettingsInvitesRevokeFailedDescription => '链接可能仍然有效。请稍后重试。';

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
  String get guildSettingsEmojiUploadTitle => '上传表情';

  @override
  String get guildSettingsEmojiSlotsTitle => '表情槽位';

  @override
  String get guildSettingsEmojiDropZone => '将表情文件拖放到此处';

  @override
  String get guildSettingsEmojiLoadFailed => '表情符号加载失败。请稍后重试。';

  @override
  String get guildSettingsEmojiSearchEmpty => '没有找到符合搜索条件的表情符号。';

  @override
  String get guildSettingsEmojiNoSlots => '没有可用的表情符号栏位';

  @override
  String get guildSettingsEmojiSlotsFull => '您已达到表情符号数量上限。请删除一些现有表情符号以腾出空间。';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return '表情符号名称至少需要 2 个字符，并且可以使用字母、数字和下划线。表情符号的大小必须小于 $maxSize。静态图像将自动调整为 128x128 像素并进行压缩。动画表情符号和 SVG 必须已经符合大小限制。';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => '正在上传表情';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 个表情符号',
      one: '# 个表情符号',
    );
    return '正在上传 $_temp0。这可能需要一点时间。';
  }

  @override
  String get guildSettingsEmojiUploadFailed => '表情包上传失败。请重试。';

  @override
  String get guildSettingsEmojiSomeFailedTitle => '部分表情符号无法添加';

  @override
  String get guildSettingsEmojiSomeFailedBody => '请检查这些文件，然后尝试使用更小或更简单的图片。';

  @override
  String get guildSettingsEmojiRenameTitle => '重命名表情';

  @override
  String get guildSettingsEmojiRenameHint => '2-32个字符，可包含字母、数字、下划线。';

  @override
  String get guildSettingsEmojiColumnEmoji => '表情符号';

  @override
  String get guildSettingsEmojiColumnName => '名称';

  @override
  String get guildSettingsEmojiColumnUploader => '上传者';

  @override
  String get guildSettingsEmojiUnknownUploader => '未知';

  @override
  String get guildSettingsEmojiDeleteTitle => '删除表情';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return '删除 :$name:？此操作无法撤销。';
  }

  @override
  String get guildSettingsEmojiPurgeLabel => '从存储和 CDN 中清除此表情';

  @override
  String get guildSettingsEmojiNameTooShort => '表情名称至少需要2个字符';

  @override
  String get guildSettingsEmojiNameTooLong => '表情名称最多32个字符';

  @override
  String get guildSettingsEmojiInvalidNameTitle => '表情符号名称无效';

  @override
  String get guildSettingsEmojiRenameFailedTitle => '无法重命名此表情符号';

  @override
  String get guildSettingsEmojiRenameFailedBody => '名称已恢复到之前的状态。请稍后重试。';

  @override
  String get guildSettingsEmojiGoneTitle => '此表情符号已不存在';

  @override
  String get guildSettingsEmojiGoneBody => '表情可能已被删除。名称已恢复到之前的状态。';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle => '你无法重命名此表情符号';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      '您没有权限重命名此表情符号。名称已恢复为之前的名称。';

  @override
  String get guildSettingsEmojiRateLimitedTitle => '您的操作过于频繁';

  @override
  String get guildSettingsEmojiRateLimitedBody => '请稍候片刻，然后重试重命名。';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => '无法删除此表情符号';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle => '你无法删除此表情符号';

  @override
  String get guildSettingsCloneEmojiTitle => '允许他人克隆你的表情';

  @override
  String get guildSettingsCloneEmojiDescription =>
      '启用后，其他社群的成员可以使用应用内的一键\"克隆\"快捷方式复制你的自定义表情。但这并不能阻止他们保存图片并自行上传。';

  @override
  String get guildSettingsCloneStickerTitle => '允许他人克隆你的贴纸';

  @override
  String get guildSettingsCloneStickerDescription =>
      '启用后，其他社群的成员可以使用应用内的一键\"克隆\"快捷方式来克隆你的自定义贴纸。但这并不能阻止他们保存图片并自行上传。';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return '只有拥有“$permission”权限的成员才能更改此设置。';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed => '无法更新表情符号克隆设置';

  @override
  String get guildSettingsCloneStickerUpdateFailed => '无法更新贴纸克隆设置';

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
  String get guildSettingsStickerSlotsTitle => '贴纸栏位';

  @override
  String get guildSettingsStickerUploadTitle => '上传贴纸';

  @override
  String get guildSettingsStickerDropZone => '拖放贴纸文件到这里（一次一个）';

  @override
  String get guildSettingsStickerDensity => '贴纸密度';

  @override
  String get guildSettingsStickerDensityCozy => '温馨';

  @override
  String get guildSettingsStickerDensityCompact => '紧凑';

  @override
  String get guildSettingsStickersLoadFailedTitle => '贴图加载失败';

  @override
  String get guildSettingsStickersLoadFailedBody => '加载贴纸时出错。请重试。';

  @override
  String get guildSettingsStickersSearchEmpty => '没有找到符合搜索条件的贴纸。';

  @override
  String get guildSettingsStickersEmptySearch => '未找到表情包';

  @override
  String get guildSettingsStickerNoSlots => '没有可用的贴纸栏位';

  @override
  String get guildSettingsStickerSlotsFull => '您已达到贴纸数量上限。请删除一些现有贴纸以腾出空间。';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return '贴纸以 320x320 像素保存，并且大小必须小于 $maxSize。静态图像将自动调整大小并进行压缩。动画贴纸和 SVG 必须已经符合大小限制。';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => '不支持的贴纸文件';

  @override
  String get guildSettingsStickerAddTitle => '添加贴纸';

  @override
  String get guildSettingsStickerEditTitle => '编辑贴纸';

  @override
  String get guildSettingsStickerNameLabel => '名称';

  @override
  String get guildSettingsStickerNameHint => '我的超赞贴纸';

  @override
  String get guildSettingsStickerDescriptionLabel => '描述';

  @override
  String get guildSettingsStickerDescriptionHint => '描述贴纸';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return '标签 ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => '添加标签';

  @override
  String get guildSettingsStickerTagAdd => '添加';

  @override
  String get guildSettingsStickerNameRequired => '名称为必填项';

  @override
  String get guildSettingsStickerNameTooShort => '名称至少需要2个字符';

  @override
  String get guildSettingsStickerNameTooLong => '名称不能超过30个字符';

  @override
  String get guildSettingsStickerDescriptionTooLong => '描述不能超过500个字符';

  @override
  String get guildSettingsStickerCreateFailedTitle => '无法创建此贴纸';

  @override
  String get guildSettingsStickerTooLargeTitle => '贴纸过大';

  @override
  String get guildSettingsStickerCompressFailedTitle => '贴纸无法充分压缩';

  @override
  String get guildSettingsStickerDeleteTitle => '删除贴纸';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '删除“$name”？此操作无法撤销。';
  }

  @override
  String get guildSettingsStickerPurgeLabel => '从存储和CDN中清除此贴纸';

  @override
  String get guildSettingsStickerDeleteFailedTitle => '无法删除此表情包';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle => '你无法删除此表情包';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return '要创建 webhook，请打开 $channelSettingsPath。您仍可在此处编辑和整理所有现有 webhook。';
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
  String get guildSettingsInvitesTableExpires => '有效期';

  @override
  String get guildSettingsAuditLogFilterUser => '按用户筛选';

  @override
  String get guildSettingsAuditLogFilterAction => '按操作筛选';

  @override
  String get createDm => '创建私聊';

  @override
  String get createGroupDm => '发起群聊';

  @override
  String get createDmNewMessage => '新消息';

  @override
  String get createDmSelectFriends => '选择朋友';

  @override
  String get createDmChooseFriendsSubtitle => '选择要发消息的好友。';

  @override
  String get createDmSearchFriends => '搜索好友';

  @override
  String get createDmNoFriendsFound => '未找到好友';

  @override
  String get createDmNoFriendsYet => '你还没有任何好友';

  @override
  String get createDmClaimToStartDms => '请先认领您的帐户，然后才能开始私信。';

  @override
  String get createDmVerifyToStartDms => '验证你的邮箱以开始私聊。';

  @override
  String get createDmVerifyYourEmail => '验证邮箱';

  @override
  String get createDmNewGroup => '新建群聊';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return '与 $userName 创建新群组';
  }

  @override
  String get createDmConfirmNewGroup => '确认新群组';

  @override
  String get createDmCreateNewGroup => '创建新群组';

  @override
  String createDmRemoveFriend(String displayName) {
    return '移除 $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      '你已有一个包含这些成员的群组。确定要新建一个吗？当然也可以！';

  @override
  String get createDmNoActivityYet => '暂无动态';

  @override
  String get createDmSomeUsersCantBeAdded => '部分用户无法添加';

  @override
  String get createDmCreateWithoutThem => '不带他们创建';

  @override
  String get createDmUnaddableIntro => '以下用户无法添加到群聊：';

  @override
  String createDmUnaddableProceed(int count) {
    return '是否创建包含剩余 $count 位成员的群聊，并跳过其他人？';
  }

  @override
  String get createDmUnaddableNoneRemaining => '没有其他收件人可以创建群聊。';

  @override
  String get createDmUnaddableUserNotFound => '用户不存在';

  @override
  String get createDmUnaddableBlocked => '你无法给该用户发消息';

  @override
  String get createDmUnaddableNotFriends => '不在你的朋友列表里';

  @override
  String get createDmUnaddableGroupDisabled => '无法被添加到群聊';

  @override
  String get createDmFailed => '无法创建对话。请重试。';

  @override
  String get dmListMessagesTitle => '消息';

  @override
  String get dmListDirectMessagesTitle => '私信';

  @override
  String get keybindsSearchShortcuts => '搜索快捷键';

  @override
  String get keybindSectionDefaults => '默认值';

  @override
  String get keybindSectionMessages => '消息';

  @override
  String get keybindSectionNavigation => '导航';

  @override
  String get keybindSectionDragAndDrop => '拖放';

  @override
  String get keybindSectionChat => '聊天';

  @override
  String get keybindSectionVoiceAndVideo => '语音和视频';

  @override
  String get keybindSectionMisc => '其他';

  @override
  String get keybindActionShowShortcutsList => '显示键盘快捷键列表';

  @override
  String get keybindActionCopyText => '复制文本';

  @override
  String get keybindActionMarkUnread => '标记为未读';

  @override
  String get keybindActionFocusTextarea => '聚焦文本框';

  @override
  String get keybindActionSwitchCommunities => '切换社群';

  @override
  String get keybindActionSwitchChannels => '切换频道';

  @override
  String get keybindActionHistoryBack => '在浏览过的频道历史中后退';

  @override
  String get keybindActionHistoryForward => '在已查看的频道历史记录中向前移动';

  @override
  String get keybindActionJumpUnreadChannels => '跳转到未读频道';

  @override
  String get keybindActionJumpMentionChannels => '跳转到有提及的未读频道';

  @override
  String get keybindActionJumpCurrentCall => '跳转到当前通话';

  @override
  String get keybindActionToggleLastGuildDms => '切换上次访问的社群和私信';

  @override
  String get keybindActionPreviousCommunityOrDms => '切换到上一个社群或私信';

  @override
  String get keybindActionNextCommunityOrDms => '切换到下一个社群或私信';

  @override
  String get keybindActionGoToDms => '前往私信';

  @override
  String get keybindActionGoToFirstCommunity => '前往第一个社群';

  @override
  String get keybindActionGoToSecondCommunity => '前往第二个社群';

  @override
  String get keybindActionGoToThirdCommunity => '前往第三个社群';

  @override
  String get keybindActionGoToFourthCommunity => '前往第四个社群';

  @override
  String get keybindActionGoToFifthCommunity => '前往第 5 个社群';

  @override
  String get keybindActionGoToSixthCommunity => '前往第 6 个社群';

  @override
  String get keybindActionGoToSeventhCommunity => '前往第 7 个社群';

  @override
  String get keybindActionGoToEighthCommunity => '前往第 8 个社群';

  @override
  String get keybindActionToggleQuickSwitcher => '切换快速切换器';

  @override
  String get keybindActionCreateOrJoinCommunity => '创建或加入社群';

  @override
  String get keybindActionStartDragAndDrop => '开始拖放';

  @override
  String get keybindActionMove => '移动';

  @override
  String get keybindActionDropItem => '丢弃物品';

  @override
  String get keybindActionCancel => '取消';

  @override
  String get keybindActionMarkCommunityRead => '将社群标为已读';

  @override
  String get keybindActionMarkChannelRead => '将频道标为已读';

  @override
  String get keybindActionStartGroupDm => '发起群聊';

  @override
  String get keybindActionTogglePinnedMessages => '切换置顶消息';

  @override
  String get keybindActionToggleInbox => '切换收件箱';

  @override
  String get keybindActionMarkTopInboxRead => '将收件箱顶部频道标为已读';

  @override
  String get keybindActionMarkAllInboxRead => '将收件箱中的所有频道标记为已读';

  @override
  String get keybindActionToggleMemberList => '切换成员列表或语音聊天';

  @override
  String get keybindActionToggleEmojiPicker => '切换表情符号选择器';

  @override
  String get keybindActionToggleGifPicker => '切换 GIF 选择器';

  @override
  String get keybindActionToggleStickerPicker => '切换贴纸选择器';

  @override
  String get keybindActionScrollChatUp => '向上滚动聊天';

  @override
  String get keybindActionScrollChatDown => '向下滚动聊天';

  @override
  String get keybindActionJumpOldestUnread => '跳转到最早的未读消息';

  @override
  String get keybindActionFocusComposer => '聚焦文本输入框';

  @override
  String get keybindActionUploadFile => '上传文件';

  @override
  String get keybindActionCopyChannelLink => '复制频道链接';

  @override
  String get keybindActionToggleSavedMedia => '切换已保存的媒体';

  @override
  String get keybindActionSendVoiceMessage => '发送语音消息';

  @override
  String get keybindActionAnswerCall => '接听来电';

  @override
  String get keybindActionDeclineCall => '拒接来电';

  @override
  String get keybindActionStartDmCall => '在私聊或群组中发起通话';

  @override
  String get keybindActionToggleSoundboard => '切换音效板';

  @override
  String get keybindActionToggleCompactCallView => '展开或收起紧凑通话视图';

  @override
  String get keybindActionPushToTalkPriority => '按住说话（优先）';

  @override
  String get keybindActionVoiceActivityPriority => '语音活动优先';

  @override
  String get keybindActionOpenHelp => '打开帮助';

  @override
  String get keybindActionSearchMessages => '搜索消息';

  @override
  String get keybindActionOpenContextMenu => '打开上下文菜单';

  @override
  String get keybindActionOpenSettings => '打开设置';

  @override
  String get keybindActionOpenThemeStudio => '打开主题工作室浮窗';

  @override
  String get keybindActionZoomIn => '放大';

  @override
  String get keybindActionZoomOut => '缩小';

  @override
  String get keybindActionZoomReset => '重置缩放';

  @override
  String get clipboardPasteFailed => '无法粘贴。剪贴板为空或被此应用阻止。';

  @override
  String get homeQuickActionDms => '私信';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class FluxerLocalizationsZhHant extends FluxerLocalizationsZh {
  FluxerLocalizationsZhHant() : super('zh_Hant');

  @override
  String get reconnectingTitle => '我們出錯了！';

  @override
  String get reconnectingBody => '連線發生問題。\n幾秒鐘內就會修復！';

  @override
  String get gatewayReconnectingToast => '正在重新連線…';

  @override
  String get gatewayConnectedToast => '已連線';

  @override
  String get sessionExpiredToast => '您的連線已過期。請重新登入。';

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
  String get nagbarLearnMore => '瞭解詳情';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return '預計於 $localizedTime 進行維護。預計持續時間：$duration。';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return '維護正在進行中。預計持續時間：$duration。';
  }

  @override
  String get nagbarMaintenanceComplete => '維護已完成。';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return '嗨，$displayName，請領取你的帳號，以免失去存取權限。';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return '嗨，$displayName，請驗證您的電子郵件地址。';
  }

  @override
  String get nagbarOpenSettings => '開啟設定';

  @override
  String get systemPermissionSettingsTitle => '啟用權限';

  @override
  String get systemPermissionSettingsOpenSettings => '開啟設定';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName 無法存取您的麥克風。您可以在裝置的隱私權設定中啟用它。';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName 無法存取您的相機。您可以在裝置的隱私權設定中啟用它。';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName 無法存取您的相片圖庫。您可以在裝置的隱私權設定中啟用此權限。';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName 沒有傳送通知的權限。你可以在裝置設定中啟用它。';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return '您的訂閱續訂失敗，但您仍可享有 $productName 的專屬福利直到 $graceDate。請立即採取行動，否則將失去所有福利。';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return '您的 $productName 訂閱已過期。立即續訂以保留您的福利。';
  }

  @override
  String get nagbarManageSubscription => '管理訂閱';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return '歡迎使用 $productFullName。探索您的 $productName 福利並管理您的訂閱。';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return '查看 $productName 功能';
  }

  @override
  String get nagbarGiftInventoryOne => '你有一個新的禮物代碼在你的禮物庫存中等著你。';

  @override
  String nagbarGiftInventoryMany(int count) {
    return '你有 $count 個新的禮物代碼在你的禮物庫存中等待領取。';
  }

  @override
  String get nagbarViewGiftInventory => '查看禮物庫存';

  @override
  String get nagbarVisionaryMfa => '啟用雙重驗證，保護你的 Visionary 帳號。';

  @override
  String get nagbarEnableMfa => '啟用 2FA';

  @override
  String get nagbarTermsAcceptance => '我們更新了條款。請閱讀並接受，以便繼續使用。';

  @override
  String get nagbarReviewTerms => '檢視條款';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return '加入「$communityName」與團隊聊天，並隨時掌握最新資訊。';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return '加入「$communityName」';
  }

  @override
  String get nagbarPushNotification => '啟用通知，這樣才不會錯過訊息和提及。';

  @override
  String get nagbarEnableNotifications => '開啟通知';

  @override
  String get nagbarBillingPortalFailed => '無法開啟帳單入口網站。請稍後再試。';

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
  String get next => '下一步';

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
  String get registerPendingApproval => '你的帳號申請正在等待核准。管理員核准後即可登入。';

  @override
  String get registerClosed => '目前已關閉註冊。請使用管理員提供的註冊連結建立帳號。';

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
  String get errorServiceUnavailable => '這個執行個體暫時無法使用。請稍後再試。';

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
  String get embedInviteJoinGroup => '加入群組';

  @override
  String get embedInviteAlreadyJoined => '已加入';

  @override
  String get embedInviteDisabled => '已停用邀請';

  @override
  String get embedInvitePaused => '此社群的邀請功能已暫停。';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName偵測到潛在的惡意攻擊，因此新使用者目前無法加入。';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain => '此社群已暫停邀請。您可以稍後再試。';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName 在此社群中偵測到潛在的惡意攻擊。邀請功能已暫停，因此新使用者目前無法加入。';
  }

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
  String get invalidDeepLinkTitle => '連結無法開啟';

  @override
  String get invalidDeepLinkDescription =>
      '這個連結可能已損壞、僅限網頁版使用，或您沒有存取權限。請檢查連結後再試一次。';

  @override
  String get invalidDeepLinkGoHomeButton => '回首頁';

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
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary（永久 $productName）';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天的 $productName',
      one: '1 天的 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 週的 $productName',
      one: '1 週的 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個月的 $productName',
      one: '1 個月的 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 年的 $productName',
      one: '1 年的 $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return '來自 $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => '點擊領取你的禮物！';

  @override
  String get embedGiftAlreadyRedeemed => '已兌換';

  @override
  String get embedGiftClaimAccountHelp => '領取您的帳號即可兌換此禮物。';

  @override
  String get embedGiftClaim => '領取禮物';

  @override
  String get embedGiftClaimed => '禮物已領取';

  @override
  String get embedGiftClaimAccount => '領取帳號即可兌換';

  @override
  String get embedGiftUnknownTitle => '不明禮物';

  @override
  String get embedGiftUnknownSubtitle => '此禮物代碼無效或已被領取。';

  @override
  String get embedGiftUnavailable => '贈禮不可用';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return '領取你的禮物以啟用你的 $productName 訂閱！';
  }

  @override
  String get giftAcceptAlreadyClaimed => '這個禮物已經被領取了。';

  @override
  String get giftAcceptMaybeLater => '稍後再說';

  @override
  String get giftRedeemedToast => '禮物已兌換！';

  @override
  String get giftRedeemInvalidTitle => '無效的禮物代碼';

  @override
  String get giftRedeemInvalidMessage => '此代碼無效或已被使用。';

  @override
  String get giftRedeemAlreadyRedeemedTitle => '禮物已兌換';

  @override
  String get giftRedeemAlreadyRedeemedMessage => '此代碼已被兌換。';

  @override
  String get giftRedeemNotFoundTitle => '找不到贈禮';

  @override
  String get giftRedeemNotFoundMessage => '這個代碼不存在。';

  @override
  String get giftRedeemFailedTitle => '無法兌換禮物';

  @override
  String get giftRedeemFailedMessage => '無法兌換此禮物。請再試一次。';

  @override
  String get giftVisionaryCannotRedeemTitle => '無法兌換此贈禮';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary 帳號無法兌換 Plutonium 禮物。請複製連結分享給朋友。';

  @override
  String get giftCopyLink => '複製贈禮連結';

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
  String get notificationUseCategoryDefault => '沿用分類預設值';

  @override
  String get notificationUseCommunityDefault => '沿用社群預設值';

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
  String get dmDeleteMyMessagesTitle => '要刪除您在此對話中的所有訊息嗎？';

  @override
  String get dmDeleteMyMessagesDescription => '這會永久刪除您在此對話中傳送過的所有訊息。此動作無法復原。';

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
  String get dmUnnamedGroup => '未命名群組';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName 的群組';
  }

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
  String get dmDebugCategory => '偵錯分類';

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
  String get addFriendVerifyToSend => '請先驗證你的電子郵件，才能傳送交友邀請。';

  @override
  String get addFriendFriendsListFull => '您的好友名單已滿，或對方的好友名單已滿。請移除一些好友後再試一次。';

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
  String emojiInfoDefaultDescription(String productName) {
    return '這是 $productName 上的預設表情符號。';
  }

  @override
  String get emojiInfoCustomGuildDescription => '這個表情符號來自這個社群。你可以在任何地方使用它。';

  @override
  String get emojiInfoCustomUnknownDescription => '這是社群中的自訂表情符號。';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      '這是社群的自訂表情符號。請洽作者以取得使用此表情符號的邀請。';

  @override
  String get emojiInfoFromHeader => '這個表情符號來自';

  @override
  String get emojiInfoDiscoverableCommunity => '可被搜尋的社群';

  @override
  String get emojiInfoPrivateCommunity => '私人社群';

  @override
  String get emojiInfoVerifiedCommunity => '認證社群';

  @override
  String get emojiInfoAddToFavorites => '加入我的最愛';

  @override
  String get emojiInfoRemoveFromFavorites => '從我的最愛移除';

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
  String get gifPickerFavoritesEmptyTitle => '還沒有任何最愛 GIF';

  @override
  String get gifPickerFavoritesEmptyDescription => '將 GIF 標記為星號，即可在此處看到。';

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
  String get phoneAddFooter =>
      '我們會在收到驗證碼時傳送簡訊。您的號碼不會連結到您的帳號。我們只會保留一個加密標記，不含使用者 ID，以便在約 30 天內最多驗證 2 次。';

  @override
  String get phoneAddSendCode => '傳送驗證碼';

  @override
  String get phoneVerifyTitle => '驗證電話號碼';

  @override
  String get phoneVerifyDescription => '輸入傳送至您電話號碼的驗證碼。';

  @override
  String get phoneAddSuccess => '電話號碼已驗證';

  @override
  String get phoneCountryLabel => '國家／地區';

  @override
  String get phoneSearchCountries => '搜尋國家…';

  @override
  String get phoneNumberRequired => '請輸入電話號碼';

  @override
  String get phoneEnterValidNumber => '請輸入有效的行動電話號碼。';

  @override
  String get phoneCannotBeUsed => '此電話號碼無法使用。請嘗試其他手機號碼或聯絡客服。';

  @override
  String get phoneAlreadyUsed => '此電話號碼已被使用。請嘗試其他號碼或聯絡客服。';

  @override
  String get phoneCodeDidNotWork => '代碼無效。請檢查後再試一次。';

  @override
  String get phoneTooManyAttempts => '嘗試次數過多。請稍候再試。';

  @override
  String get phoneSmsUnavailable => '目前無法進行簡訊驗證。請稍後再試或聯絡客服。';

  @override
  String get phoneNotEligible => '此帳號無法使用電話驗證。請使用其他方式或聯絡客服。';

  @override
  String get phoneCaptchaRequired => '電話驗證前需要進行瀏覽器檢查。請從登入頁面重試，或聯絡客服。';

  @override
  String get phoneSomethingWentWrong => '發生錯誤。請再試一次。';

  @override
  String get phoneInboundExpensiveDescription =>
      '傳送 SMS 到此電話號碼費用過高，因此我們需要您改為傳送 SMS 給我們。您也可以聯絡客服，要求我們移除您帳戶的此項要求。';

  @override
  String get phoneInboundDefaultDescription => '我們需要你傳送一則簡訊來驗證你的手機號碼。';

  @override
  String get phoneInboundStepOpenMessaging => '開啟手機的訊息應用程式，然後建立新簡訊。';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return '將驗證碼 $code 發送至 $number。';
  }

  @override
  String get phoneInboundStepWait => '請稍候，我們正在接收您的訊息。這可能需要一分鐘。';

  @override
  String get phoneInboundGetNewCode => '取得新驗證碼';

  @override
  String get phoneInboundChallengeCodeLabel => '要傳送的驗證碼';

  @override
  String get phoneInboundOurNumberLabel => '傳送至';

  @override
  String get requiredActionTitle => '需要驗證帳號';

  @override
  String requiredActionIntroGeneric(String productName) {
    return '請完成必要的驗證，以繼續使用 $productName。';
  }

  @override
  String get requiredActionIntroPhone => '您的註冊需要額外的防垃圾訊息驗證，才能繼續。';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return '請驗證您的電子郵件或電話，以繼續使用 $productName。';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return '請完成下方所需的電子郵件和電話驗證步驟，以繼續使用 $productName。';
  }

  @override
  String get requiredActionChooseMethodTitle => '選擇驗證方式';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return '請完成以下其中一個驗證路徑，以繼續使用 $productName。';
  }

  @override
  String get requiredActionUseEmail => '使用電子郵件';

  @override
  String get requiredActionUsePhone => '使用電話號碼';

  @override
  String get requiredActionCheckEmailTitle => '請檢查你的電子郵件';

  @override
  String get requiredActionCheckEmailDescription =>
      '我們已將驗證連結寄到您的電子郵件地址。請開啟連結以繼續。';

  @override
  String get requiredActionResendVerificationEmail => '重新傳送驗證電子郵件';

  @override
  String get requiredActionVerificationEmailSent => '驗證電子郵件已寄出。請檢查您的收件匣。';

  @override
  String get requiredActionSignOut => '登出';

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
  String get networkErrorMessage => '發生了些問題。請再試一次。';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 週前',
      one: '1 週前',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分鐘後',
      one: '1 分鐘後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ' $count 小時後',
      one: '1 小時後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天後',
      one: '1 天後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '在 $count 週後',
      one: '一週後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ' $count 個月後',
      one: '1 個月後',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '在 $count 年內',
      one: '一年內',
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
  String get userProfileLoading => '正在載入個人檔案';

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
  String get userProfileRoles => '角色';

  @override
  String get memberRoleAdd => '新增身分組';

  @override
  String memberRoleRemove(String roleName) {
    return '移除「$roleName」角色';
  }

  @override
  String get userProfileNoRolesInCommunity => '此用戶在此社群中沒有任何角色。';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return '還沒有任何身分組。請在$rolesSettingsPath新增身分組';
  }

  @override
  String get memberRolesNoRolesAvailable => '沒有可用的角色';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return '此社群目前沒有可指派的角色，但你可以在 $rolesSettingsPath 中建立新角色。';
  }

  @override
  String get guildSettingsTitle => '社群設定';

  @override
  String get guildSettingsRolesTab => '角色';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => '當地時間';

  @override
  String get userProfileSameTimeAsYou => '與您時區相同';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '比您快 $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '比你晚 $duration';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours 小時',
      one: '1 小時',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes 分鐘',
      one: '1 分鐘',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours 小時',
      one: '1 小時',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes 分鐘',
      one: '1 分鐘',
    );
    return '$_temp0';
  }

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
  String get iarReportGuildTitle => '檢舉社群';

  @override
  String get iarReportGuildPreconfirmBody =>
      '如果這份檢舉是關於此社群中的特定訊息，請改為檢舉該訊息。訊息檢舉能讓我們的安全團隊掌握最清楚的脈絡，在評論中新增詳細資訊有助於我們更快審查。只有在檢舉訊息無法涵蓋更廣泛的問題時，才繼續檢舉整個社群。';

  @override
  String get iarContinueToReportCommunity => '繼續檢舉社群';

  @override
  String get iarPreviewCommunitySubtitle => '社群';

  @override
  String get iarReasonHarassmentGuildLabel => '騷擾或針對性霸凌';

  @override
  String get iarReasonHarassmentGuildDescription => '社群容易出現群體攻擊或針對性騷擾。';

  @override
  String get iarReasonHateGuildDescription => '宣揚對受保護族群的仇恨.';

  @override
  String get iarReasonTerrorismLabel => '恐怖主義或暴力極端主義';

  @override
  String get iarReasonTerrorismDescription => '宣傳、招募或協調暴力極端主義活動。';

  @override
  String get iarReasonMatureContentGuildLabel => '成人內容或不安全內容篩選';

  @override
  String get iarReasonMatureContentGuildDescription => '未經適當把關的成人內容。';

  @override
  String get iarReasonChildSafetyGuildDescription => '危害未成年人或含有兒童剝削內容.';

  @override
  String get iarReasonRaidLabel => '群體攻擊協調';

  @override
  String get iarReasonRaidDescription => '協調對個人或社群的突襲、集體騷擾或騷擾行為。';

  @override
  String get iarReasonSpamGuildDescription => '社群的存在是為了濫發訊息、詐騙或濫用平台。';

  @override
  String get iarReasonMalwareGuildLabel => '散佈惡意軟體';

  @override
  String get iarReasonMalwareGuildDescription => '散佈惡意軟體、竊取憑證或有害檔案。';

  @override
  String get iarReasonPrivacyGuildLabel => '侵犯隱私或人肉搜索';

  @override
  String get iarReasonPrivacyGuildDescription => '分享個人資訊、跟蹤使用者或協調濫用隱私。';

  @override
  String get iarReasonSelfHarmGuildLabel => '鼓勵自殘';

  @override
  String get iarReasonSelfHarmGuildDescription => '鼓勵自殺、自殘或飲食失調。';

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
  String get slowmodeStatusEnabled => '慢速模式已啟用';

  @override
  String slowmodeStatusActive(String remaining) {
    return '慢速模式進行中（$remaining）';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return '慢速模式設為 $durationLabel，但您不受限制。';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return '慢速模式設為 $durationLabel。請稍候再傳送下一則訊息。';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return '此頻道的慢速模式設為 $durationLabel。';
  }

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
  String get voiceMessageHoldHint => '按住錄製。拖曳至垃圾桶刪除、向上滑動鎖定，或放開傳送。';

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
  String get voiceMessageSeekForward => '向前跳轉';

  @override
  String get voiceMessageSeekBackward => '倒轉音訊';

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
  String get chatAttachmentDownloadedToast => '已儲存到相簿';

  @override
  String get chatAttachmentDownloadFailedToast => '無法下載附件';

  @override
  String get chatAttachmentExpiredTooltip => '附件已過期';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '展開 ($count 行)',
      one: '展開 ($count 行)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '收合 ($count 行)',
      one: '收合 ($count 行)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '展開 ($count 列)',
      one: '展開 ($count 列)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '收合 ($count 列)',
      one: '收合 ($count 列)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (剩餘 $count 行)',
      one: '... (剩餘 $count 行)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (剩餘 $count 列)',
      one: '... (剩餘 $count 列)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => '檢視完整檔案';

  @override
  String get chatTextualPreviewChangeLanguage => '變更語言';

  @override
  String get chatTextualPreviewSearchLanguage => '搜尋語言…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => '語法突顯';

  @override
  String get chatTextualPreviewNoLanguagesFound => '沒有結果';

  @override
  String get chatTextualPreviewMoreOptions => '更多選項';

  @override
  String get chatTextualPreviewWrapText => '自動換行';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return '檔案過大，無法內嵌預覽（限制 $previewLimitKb KB）。';
  }

  @override
  String get chatTextualPreviewLoadError => '無法載入預覽。';

  @override
  String get chatTextualPreviewLanguagePlaintext => '純文字';

  @override
  String get chatTextualPreviewCopy => '複製';

  @override
  String get chatAttachmentSourceGallery => '相簿';

  @override
  String get chatAttachmentSourceCamera => '相機';

  @override
  String get chatAttachmentSourceBrowse => '瀏覽檔案';

  @override
  String get chatAttachmentPasteTooltip => '從剪貼簿貼上檔案';

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
  String get lookAndFeelHdrSectionTitle => '高動態範圍';

  @override
  String get lookAndFeelHdrSectionDescription => '控制 HDR 影像在支援 HDR 的螢幕上如何顯示。';

  @override
  String get lookAndFeelHdrFullName => '全動態範圍';

  @override
  String get lookAndFeelHdrFullDescription => '以完整亮度與色彩範圍顯示 HDR 影像。';

  @override
  String get lookAndFeelHdrStandardName => '標準範圍';

  @override
  String get lookAndFeelHdrStandardDescription => '將 HDR 影像色調對應至標準範圍，降低峰值亮度。';

  @override
  String get lookAndFeelHdrDisplayModeLabel => '高動態範圍顯示模式';

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
  String get lookAndFeelChatFontScalingTitle => '聊天字體大小';

  @override
  String get lookAndFeelChatFontScalingDescription => '調整聊天區域的字體大小。';

  @override
  String get lookAndFeelChatFontSizeLabel => '聊天字體大小';

  @override
  String get lookAndFeelAppZoomTitle => 'App 縮放等級';

  @override
  String get lookAndFeelAppZoomDescription => '調整應用程式的縮放等級。';

  @override
  String get lookAndFeelChatWallpaperTitle => '聊天背景';

  @override
  String get lookAndFeelChatWallpaperDescription => '選擇聊天背景。此設定僅保留在此裝置上。';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip => '此設定僅保留在此裝置上';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      '聊天背景圖片僅儲存在此裝置，不會同步到其他裝置。';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => '預設';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => '自訂圖片';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return '顏色 $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return '漸層 $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => '調暗背景';

  @override
  String get lookAndFeelChatWallpaperPickFailed => '無法將該圖片設為您的背景圖片。';

  @override
  String get lookAndFeelMessagesSectionTitle => '訊息';

  @override
  String get lookAndFeelMessagesSectionDescription => '選擇訊息在聊天頻道中的顯示方式。';

  @override
  String get lookAndFeelMessageGroupSpacingLabel => '訊息群組間距';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => '訊息顯示模式';

  @override
  String get lookAndFeelMessageDisplayComfyName => '舒適';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      '寬敞的版面配置，訊息之間有清晰的視覺區隔。';

  @override
  String get lookAndFeelMessageDisplayDenseName => '緊湊';

  @override
  String get lookAndFeelMessageDisplayDenseDescription => '以最小間距顯示最多訊息。';

  @override
  String get lookAndFeelHideUserAvatarsLabel => '隱藏使用者頭像';

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
  String get communityTemporarilyUnavailable => '社群暫時無法使用';

  @override
  String get guildUnavailableDescription => '發生了一些問題，我們正在處理中。';

  @override
  String get guildNotFoundTitle => '這不是您要找的社群。';

  @override
  String get guildNotFoundDescription => '您要找的社群可能已被刪除，或是您沒有權限存取。';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '目前只有 $productName 的員工可以存取「$communityName」';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => '暫時無法使用';

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
  String get favoritesAddToSavedMedia => '儲存到我的內容';

  @override
  String get favoritesRemoveFromSavedMedia => '從已儲存的媒體中移除';

  @override
  String get favoritesAddToUrlOnlyGifFavorites => '將 GIF 加入僅限 URL 的收藏夾';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites => '從僅限 URL 的 GIF 收藏中移除';

  @override
  String get savedMediaAddTitle => '儲存到我的內容';

  @override
  String get savedMediaFormNameLabel => '名稱';

  @override
  String get savedMediaFormNameHint => '我的超讚媒體';

  @override
  String get savedMediaFormAltTextLabel => '替代文字';

  @override
  String get savedMediaFormAltTextHint => '描述此媒體';

  @override
  String get savedMediaFormTagsLabel => '標籤';

  @override
  String get savedMediaFormTagsHint => '有趣、反應、工作';

  @override
  String get savedMediaSaveError => '無法更新已儲存的媒體。';

  @override
  String get savedMediaNameRequired => '請輸入名稱。';

  @override
  String get gifFavoriteFirstTimeTitle => 'GIF 收藏要如何儲存？';

  @override
  String get gifFavoriteFirstTimeDescription =>
      '你可以將標記星號的 GIF 儲存為僅限 URL 的收藏，或上傳至你的已儲存媒體。請選擇最符合你使用方式的選項。你隨時可以在「設定」>「進階」>「媒體」中進行變更。';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL 專用收藏（預設）：跨裝置同步，無須上傳，不計入儲存媒體。若原始媒體主機移除，可能會消失。';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      '儲存的媒體：可上傳、標記、搜尋且永久保存，但會計入您的儲存媒體額度。';

  @override
  String get gifFavoriteFirstTimeHint => '我們只會問一次。';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => '僅限網址（建議）';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => '使用儲存的媒體';

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
  String get messagesMediaCameraUploadsSectionTitle => '相機上傳';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      '選擇是否將使用應用程式內相機拍攝的照片和影片保留在您的裝置上';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => '儲存到裝置';

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
  String get accessibilitySaturationTitle => '飽和度';

  @override
  String get accessibilitySaturationDescription => '調整應用程式中主題色彩的鮮豔度。';

  @override
  String get accessibilityVisualGroupTitle => '視覺';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => '一律為連結加上底線';

  @override
  String get accessibilityDimStrikethroughTextLabel => '調暗刪除線文字';

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
  String get accessibilityScreenReaderGroupTitle => '螢幕閱讀器';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return '控制 $productName 與螢幕助讀程式的互動方式。';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel => '播報新訊息';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      '讓螢幕閱讀器在開啟的頻道中收到新訊息時，即時朗讀訊息內容。通知音效不受影響。';

  @override
  String get accessibilityTtsGroupTitle => '文字轉語音';

  @override
  String get accessibilityTtsGroupDescription => '為語音內容選擇速度。';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => '語音播放速度';

  @override
  String get accessibilityTtsPlaySampleLabel => '播放範例';

  @override
  String get accessibilityTtsSilenceSampleLabel => '靜音範例';

  @override
  String get accessibilityPreviewButtonLabel => '預覽按鈕';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return '這會顯示連結的顯示方式：$linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => '預覽使用者';

  @override
  String get accessibilityKeyboardGroupTitle => '鍵盤';

  @override
  String get accessibilityShowTextareaFocusRingLabel => '在聊天文字輸入區顯示焦點框';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel => '按下 Esc 鍵可離開鍵盤模式';

  @override
  String get accessibilityShowContextMenuShortcutsLabel => '顯示快捷選單捷徑';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel => '通話前確認';

  @override
  String get accessibilityAnimationGroupTitle => '動畫';

  @override
  String get accessibilityReducedMotionActiveNote =>
      '已開啟減少動態效果，因此內容動畫預設為暫停。您仍然可以重新開啟任何動畫以繼續播放。';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => '播放動態表情符號';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => '自動播放 GIF';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return '當 $productName 處於焦點時自動播放 GIF';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion => '播放動畫，不顧「減少動態」設定。';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      '因減少動態效果而暫停。開啟即可繼續播放動態表情符號。';

  @override
  String get accessibilityPausedGifByReducedMotion => '因減少動態而暫停。開啟以繼續播放 GIF。';

  @override
  String get accessibilityGifDefaultsOffOnMobile => '為節省電力與數據用量，行動裝置預設為關閉。';

  @override
  String get accessibilityStickerAnimationsTitle => '貼圖動畫';

  @override
  String get accessibilityStickerAnimationPreferenceLabel => '貼圖動畫偏好設定';

  @override
  String get accessibilityStickerAlwaysAnimateName => '總是播放動畫';

  @override
  String get accessibilityStickerAlwaysAnimateDescription => '貼圖一律會動';

  @override
  String get accessibilityStickerAnimateOnInteractionName => '互動時播放動畫';

  @override
  String get accessibilityStickerAnimateOnPressDescription => '貼圖會在您點擊時播放動畫';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      '當您將滑鼠游標移到貼圖上方或與貼圖互動時，貼圖會動起來';

  @override
  String get accessibilityStickerNeverAnimateName => '永不播放動畫';

  @override
  String get accessibilityStickerNeverAnimateDescription => '貼圖永不播放動畫';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      '即使開啟了減少動態效果，仍會持續播放動畫。';

  @override
  String get accessibilityStickersReducedMotionHint =>
      '「減少動態效果」會限制貼圖只在互動時播放動畫。選擇「總是播放動畫」來覆寫此設定。';

  @override
  String get accessibilityStickersDefaultsOnMobile => '預設為在行動裝置上互動時播放動畫，以節省電力。';

  @override
  String get accessibilityMotionGroupTitle => '動態效果';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel => '同步系統的減少動態設定';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      '使用此裝置的系統減少動態偏好設定，或在下方自訂。';

  @override
  String get accessibilityReducedMotionOverrideLabel => '減少動態效果';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      '停用動畫和轉場效果。目前由您的系統設定控制。';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      '停用應用程式中的所有動畫和轉場效果。';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      '在「動畫」分頁中，您可以隨心所欲地控制動畫表情符號、GIF 和貼圖。';

  @override
  String get accessibilityConfirmStartCallTitle => '要開始通話嗎？';

  @override
  String get accessibilityConfirmStartCallDescription => '確定要開始通話嗎？';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => '開始通話';

  @override
  String get accessibilityTtsSampleDescription => '以您選擇的速度聽取範例語音。';

  @override
  String get accessibilityTtsSampleText =>
      '醫生，我來自未來。我搭乘您發明的時光機來到這裡。現在，我需要您的幫助才能回到 1985 年。';

  @override
  String get accessibilityTtsUnsupportedDescription => '此裝置無法使用語音合成。';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      '語音播放失敗。請再試一次，或檢查音訊輸出是否正常運作。';

  @override
  String get ttsSubstitutionUnknownUser => '不明使用者';

  @override
  String get ttsSubstitutionUnknownRole => '不明角色';

  @override
  String get ttsSubstitutionUnknownChannel => '不明頻道';

  @override
  String get ttsSubstitutionCodeBlock => '程式碼區塊';

  @override
  String get ttsSubstitutionSpoiler => '劇透';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '表情符號 $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '斜線 $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName說：「$formatted」';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return '回覆 $replyAuthorName：$authorName 說：$formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName$description';
  }

  @override
  String get ttsSentSticker => '傳送了貼圖';

  @override
  String get ttsSentAttachment => '傳送了附件';

  @override
  String ttsSentAttachments(int count) {
    return '已傳送 $count 個附件';
  }

  @override
  String get ttsSentEmbed => '傳送了內嵌訊息';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author 傳送了 $summary';
  }

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
  String get systemCallJoinTheCall => '加入通話';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username 發起的通話，通話時長為 $duration。';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return '你錯過了 $username 的通話，該通話持續了 $duration。';
  }

  @override
  String systemCallMissed(String username) {
    return '您錯過了 $username 的來電。';
  }

  @override
  String get systemCallDurationFewSeconds => '幾秒前';

  @override
  String get systemCallDurationMinute => '1 分鐘';

  @override
  String get systemCallDurationOneYear => '1 年';

  @override
  String get systemCallDurationOneMonth => '1 個月';

  @override
  String get systemCallDurationOneWeek => '1 週';

  @override
  String get systemCallDurationOneDay => '1 天';

  @override
  String get systemCallDurationOneHour => '1 小時';

  @override
  String systemCallDurationYears(int count) {
    return '$count 年';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count 個月';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count 週';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count 天';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count 小時';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count 分鐘';
  }

  @override
  String systemUnknownMessage(String productName) {
    return '請更新 $productName 以檢視此訊息。';
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
  String get voiceJoinFailedTitle => '無法加入語音';

  @override
  String get voiceMultiDeviceDisconnectFailed => '無法中斷您的其他裝置連線。請稍後再試。';

  @override
  String get voiceChannelEmptyDescription => '這是語音頻道。連線即可開始交談！';

  @override
  String get voiceChannelJoin => '加入語音頻道';

  @override
  String get voiceCallJoin => '加入通話';

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
  String get voiceControlFlipCamera => '切換相機';

  @override
  String get voiceControlScreenShare => '螢幕分享';

  @override
  String get voiceScreenShareNotificationText => '正在分享您的螢幕。';

  @override
  String get voiceControlMore => '更多';

  @override
  String get voiceControlDisconnect => '中斷連線';

  @override
  String get voiceInChat => '在語音聊天中';

  @override
  String get voiceConnectionFailed => '連線失敗';

  @override
  String get voiceConnectionRetry => '再試一次';

  @override
  String get voiceConnectionDismiss => '關閉';

  @override
  String get voiceConnectionDisconnected => '已中斷連線';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency 毫秒';
  }

  @override
  String get voiceMeasuringLatency => '測量延遲中…';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return '跳到「$channelSourceLabel」';
  }

  @override
  String get voiceConnectionTitle => '語音連線';

  @override
  String get voiceConnectionAdvancedStats => '進階';

  @override
  String get voiceShowCallAvatars => '顯示通話頭像';

  @override
  String get voiceShowConnectionId => '顯示連線 ID';

  @override
  String get voiceAudioProcessing => '音訊處理中';

  @override
  String get voiceConnectionSessionSection => '工作階段';

  @override
  String get voiceConnectionDurationLabel => '時間';

  @override
  String get voiceConnectionParticipantsLabel => '參與者';

  @override
  String get voiceConnectionNetworkSection => '網路';

  @override
  String get voiceConnectionPingLabel => '發送提醒';

  @override
  String get voiceConnectionJitterLabel => '抖動';

  @override
  String get voiceConnectionSendLabel => '傳送';

  @override
  String get voiceConnectionReceiveLabel => '接收';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes 分 $seconds 秒';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency 毫秒';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter 毫秒';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => '麥克風靜音';

  @override
  String get userAreaUnmuteMicrophone => '解除麥克風靜音';

  @override
  String get userAreaUserSettings => '使用者設定';

  @override
  String get voiceParticipantMenuViewProfile => '查看個人檔案';

  @override
  String get voiceParticipantMenuFocus => '聚焦此人';

  @override
  String get voiceParticipantMenuUnfocus => '取消聚焦';

  @override
  String get voiceParticipantMenuCommunityMute => '社群靜音';

  @override
  String get voiceParticipantMenuCommunityDeafen => '社群靜音';

  @override
  String get voiceParticipantMenuUserVolume => '使用者音量';

  @override
  String get voiceParticipantMenuStreamVolume => '串流音量';

  @override
  String get voiceParticipantMenuStopStreaming => '停止串流';

  @override
  String get voiceParticipantModerationFailed => '無法更新該成員。請再試一次。';

  @override
  String get voiceControlChat => '聊天';

  @override
  String get voiceCallViewModeLabel => '檢視';

  @override
  String get voiceCallViewModeGrid => '網格';

  @override
  String get voiceCallViewModeFocus => '專注模式';

  @override
  String get voicePanelSettingsSectionTitle => '語音設定';

  @override
  String get voicePanelUseEarpieceLabel => '使用聽筒';

  @override
  String get voicePanelOnlyShowVideosLabel => '只顯示影片';

  @override
  String get voicePanelOnlyShowVideosDescription => '只顯示開啟攝影機的參與者。';

  @override
  String get voicePanelShowOwnCameraLabel => '顯示我的相機';

  @override
  String get voicePrioritizeSpeakersLabel => '優先顯示發言者';

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
  String get privacyDashboardProfilePrivacySection => '個人檔案隱私設定';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection => '朋友與私訊';

  @override
  String get privacyDashboardActivitySharingSection => '活動分享';

  @override
  String get privacyDashboardSensitiveContentSection => '敏感內容';

  @override
  String get privacyDashboardDataExportSection => '資料匯出';

  @override
  String get privacyDashboardDataDeletionSection => '資料刪除';

  @override
  String get privacyDashboardProfilePrivacyTitle => '誰能看見你的完整個人檔案';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities => '朋友和所有社群';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      '您的完整個人資料對朋友和社群中的所有人可見';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities => '僅限朋友和小型社群';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      '您的完整個人檔案會對朋友和成員人數不超過 200 人的社群成員顯示';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => '僅限朋友';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      '您的完整個人資料只會對您的朋友顯示';

  @override
  String get privacyDashboardFriendRequestsTitle => '好友邀請';

  @override
  String get privacyDashboardFriendRequestsEveryone => '所有人';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc => '允許任何人傳送好友邀請給你';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => '朋友的朋友';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      '允許朋友的朋友向你傳送要求';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers => '社群成員';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      '允許你所屬社群的成員傳送好友邀請給你';

  @override
  String get privacyDashboardDirectMessagesTitle => '私訊';

  @override
  String get privacyDashboardDirectMessagesMembers => '允許社群成員傳送私人訊息';

  @override
  String get privacyDashboardDirectMessagesMembersDesc => '允許你所在社群的成員傳送私人訊息給你';

  @override
  String get privacyDashboardDirectMessagesBots => '允許社群機器人傳送私人訊息';

  @override
  String get privacyDashboardDirectMessagesBotsDesc => '允許你所在社群的機器人傳送私訊給你';

  @override
  String get privacyDashboardConnectionsSectionDesc => '控制誰可以向您傳送好友要求和私訊';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      '控制誰可以撥打電話給你，以及將你加入群組聊天';

  @override
  String get privacyDashboardIncomingCallsTitle => '來電';

  @override
  String get privacyDashboardIncomingCallsDesc => '控制誰可以打電話給你';

  @override
  String get privacyDashboardAllowedCallers => '允許的來電者';

  @override
  String get privacyDashboardIncomingCallNobody => '無人';

  @override
  String get privacyDashboardIncomingCallNobodyDesc => '封鎖所有來電';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => '僅限朋友';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc => '只允許朋友撥打您的電話（建議）';

  @override
  String get privacyDashboardIncomingCallCustom => '朋友 + 自訂';

  @override
  String get privacyDashboardIncomingCallCustomDesc => '允許朋友以及你選擇的其他群組';

  @override
  String get privacyDashboardIncomingCallEveryone => '所有人';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc => '允許任何人撥打你的電話，即使是陌生人';

  @override
  String get privacyDashboardAdditionalGroups => '其他群組';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc => '你朋友的朋友也能打給你';

  @override
  String get privacyDashboardCallGuildMembersDesc => '你來自你們都加入的社群的朋友可以打電話給你';

  @override
  String get privacyDashboardRingBehavior => '環繞行為';

  @override
  String get privacyDashboardSilentCalls => '所有人來電靜音';

  @override
  String get privacyDashboardSilentCallsDesc =>
      '所有來電都會改為靜音通知，而非響鈴。預設情況下，非好友的來電一律為靜音。';

  @override
  String get privacyDashboardGroupDmTitle => '誰可以將你加入群組聊天';

  @override
  String get privacyDashboardGroupDmDesc =>
      '控制誰可以在未經詢問的情況下將你加入群組聊天。任何人仍可傳送邀請連結給你加入。';

  @override
  String get privacyDashboardAllowedInvites => '允許的邀請';

  @override
  String get privacyDashboardGroupDmNobodyDesc => '未經詢問，禁止任何人將您加入群組聊天';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc => '僅允許朋友直接加你（建議）';

  @override
  String get privacyDashboardGroupDmCustomDesc => '允許朋友及額外群組加入您';

  @override
  String get privacyDashboardGroupDmEveryoneDesc => '允許任何人將你加入群組聊天，無需詢問';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc => '你朋友的朋友可以將你加入群組聊天';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      '你與對方都同屬的社群中的成員可以將你加入群組聊天';

  @override
  String get privacyDashboardVoiceActivityTitle => '目前上線中的語音活動';

  @override
  String get privacyDashboardShareVoiceActivity => '與朋友分享你的語音活動';

  @override
  String get privacyDashboardVoiceActivityEnableTitle => '與所有朋友分享語音活動嗎？';

  @override
  String get privacyDashboardVoiceActivityDisableTitle => '停止與所有朋友分享語音活動嗎？';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      '您即將開始與所有朋友（包括未來的朋友）分享您的語音活動。這會向他們所有人發送更新，並且只能在 24 小時後再次更改。';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      '您即將停止與所有朋友（包括未來的朋友）分享您的語音活動。這會向他們所有人發送更新，並且只能在 24 小時後再次更改。';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm => '是，與所有朋友分享';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => '是，停止分享';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return '$time 後可再次使用';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated => '語音活動分享已更新';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed => '目前無法更新語音活動分享設定';

  @override
  String get privacyDashboardDataExportDesc =>
      '建立可下載的帳號資料封存檔，包含訊息和附件網址。大多數人都會選擇所有資料，但您也可以在下方縮小範圍。';

  @override
  String get privacyDashboardExportMyData => '匯出我的資料';

  @override
  String get privacyDashboardDataDeletionDesc =>
      '永久移除您在私訊、群組私訊和社群中傳送的訊息。此作業會在背景執行，完成後您會收到一則私訊通知。';

  @override
  String get privacyDashboardDeleteMyMessages => '刪除我的訊息';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle => '允許社群成員傳送私人訊息？';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle => '要阻擋來自社群成員的私人訊息嗎？';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle => '允許機器人傳送私人訊息給您？';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle => '要阻擋機器人傳送私人訊息給您嗎？';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc => '是否也要允許來自您現有社群成員的私訊？';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc => '您也想封鎖來自現有社群成員的私訊嗎？';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      '您是否也想允許來自現有社群的機器人傳送私人訊息給您？';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc => '您也要封鎖來自現有社群的機器人嗎？';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      '你也可以透過長按社群名稱並選擇「隱私設定」來針對個別社群變更此設定。';

  @override
  String get privacyDashboardDmConfirmAllowAll => '允許所有社群';

  @override
  String get privacyDashboardDmConfirmBlockAll => '在所有社群中封鎖';

  @override
  String get privacyDashboardDmConfirmSkip => '略過此步驟';

  @override
  String get privacyDashboardDataRequestGoBack => '返回';

  @override
  String get privacyDashboardDataRequestExportTitle => '匯出我的資料';

  @override
  String get privacyDashboardDataRequestDeleteTitle => '刪除我的訊息';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      '我們會盡快處理。當您的封存檔準備好時，您會收到一封電子郵件。';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      '我們會盡快處理。完成後，您會收到我們的私訊。';

  @override
  String get privacyDashboardDataRequestScopeTitle => '要包含的內容';

  @override
  String get privacyDashboardDataRequestExportEverything => '所有內容';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      '匯出您傳送過的每則訊息，以及所有帳戶設定、成員資格和中繼資料。';

  @override
  String get privacyDashboardDataRequestExportCustom => '自訂選取';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      '選擇要包含在封存檔中的對話類型、社群和時間範圍。';

  @override
  String get privacyDashboardDataRequestDeleteSelected => '選擇要包含的內容';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc => '選擇要清理哪些類型的對話。';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible => '僅限我無法再存取的地方';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      '只刪除您已離開或已被移除的社群和群組私訊中的訊息。';

  @override
  String get privacyDashboardDataRequestKindsTitle => '哪些對話';

  @override
  String get privacyDashboardDataRequestKindsBody => '切換您想納入的對話類型。';

  @override
  String get privacyDashboardDataRequestKindDms => '開啟私訊';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => '已關閉的私訊';

  @override
  String get privacyDashboardDataRequestKindGroupDms => '群組私訊';

  @override
  String get privacyDashboardDataRequestKindCommunities => '社群';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => '哪些社群';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => '社群篩選條件';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude => '包含所有，除了選取的';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => '僅限選取的社群';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty => '您目前沒有加入任何社群。';

  @override
  String get privacyDashboardDataRequestWhenTitle => '時間範圍';

  @override
  String get privacyDashboardDataRequestDateMode => '時間範圍';

  @override
  String get privacyDashboardDataRequestAllTime => '所有時間';

  @override
  String get privacyDashboardDataRequestCustomRange => '自訂範圍';

  @override
  String get privacyDashboardDataRequestStartDate => '開始日期';

  @override
  String get privacyDashboardDataRequestEndDate => '結束日期';

  @override
  String get privacyDashboardDataRequestDateHelper => '將任一欄位留空，即可讓該時間範圍保持不設限。';

  @override
  String get privacyDashboardDataRequestNeedInclusion => '請至少選擇一種要包含的對話類型。';

  @override
  String get privacyDashboardDataRequestDateRangeError => '開始日期必須早於結束日期。';

  @override
  String get privacyDashboardDataRequestConfirmTitle => '檢閱並確認';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      '我們會建立一個包含您所有傳送訊息的可下載封存檔，並在準備好時透過電子郵件通知您。該電子郵件中的下載連結將在 7 天後失效。';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      '我們會根據以下篩選條件建立可下載的封存檔，並在準備好時透過電子郵件通知您。該電子郵件中的下載連結將在 7 天後過期。';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      '永久刪除符合以下篩選條件的訊息。此動作無法復原。';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      '一旦開始就無法復原。完成後我們會私訊通知您。';

  @override
  String get privacyDashboardDataRequestRequestExport => '要求匯出資料';

  @override
  String get privacyDashboardDataRequestDeleteMessages => '刪除訊息';

  @override
  String get privacyDashboardDataRequestSummaryScope => '搜尋範圍';

  @override
  String get privacyDashboardDataRequestSummaryConversations => '對話';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => '社群';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => '時間範圍';

  @override
  String get privacyDashboardDataRequestSummaryNone => '無';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return '從 $start 起';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return '直到 $end';
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
      other: '# 個社群',
      one: '# 個社群',
    );
    return '所有社群，除了 $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 個社群',
      one: '# 個社群',
    );
    return '僅限 $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen => '開啟的私訊';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed => '已關閉的私訊';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth => '私訊（開放和已關閉）';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => '群組私訊';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded => '社群';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# 小時',
      one: '# 小時',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# 分鐘',
      one: '# 分鐘',
    );
    return '$_temp0又$_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# 小時',
      one: '# 小時',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# 分鐘',
      one: '# 分鐘',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# 秒',
      one: '# 秒',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => '無法載入隱私權設定';

  @override
  String get privacyDashboardRetry => '重試';

  @override
  String get privacyDashboardSensitiveContentSaveFailed => '無法儲存敏感內容設定。';

  @override
  String get privacyDashboardDataRequestFailed => '無法完成要求。';

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
  String get forwardSendSlowmodeBlocked => '等待一個或多個所選頻道的慢速模式結束。';

  @override
  String get slowmodeRateLimitedTitle => '慢速模式已啟用';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return '慢速模式已開啟 — 請在 $duration 後再傳送訊息。';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled => '慢速模式期間停用直接上傳。';

  @override
  String get shareMediaTitle => '分享到';

  @override
  String get shareMediaMessageHint => '加上訊息…';

  @override
  String get shareMediaSendButton => '傳送';

  @override
  String get shareMediaSuccessToast => '媒體已分享';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return '已分享到 $count 個目的地';
  }

  @override
  String get shareMediaFailedToast => '無法分享媒體';

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
  String get chatMessageCopyEmbedText => '複製嵌入文字';

  @override
  String get chatMessageTranslate => '翻譯';

  @override
  String chatMessageTranslatedFrom(String language) {
    return '翻譯自 $language';
  }

  @override
  String get chatMessageSeeOriginal => '查看原文';

  @override
  String get chatMessageSeeTranslation => '查看翻譯';

  @override
  String get chatMessageTranslating => '翻譯中…';

  @override
  String get chatMessageTranslateFailed => '無法翻譯此訊息。';

  @override
  String get chatMessageTranslateUnavailable => '此裝置無法翻譯。';

  @override
  String get chatMessageSpeak => '朗讀訊息';

  @override
  String get chatMessageStopSpeaking => '停止發言';

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
  String get chatMessageOpenLink => '開啟連結';

  @override
  String get chatMessageCopyLink => '複製連結';

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
  String get chatReactionAddFailed => '無法新增表情符號';

  @override
  String get chatReactionRemoveFailed => '無法移除表情符號';

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
  String get chatMessageDeleteAttachment => '刪除附件';

  @override
  String get chatMessageEditAttachmentAltText => '編輯替代文字';

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
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則封鎖訊息',
      one: '1 封鎖訊息',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則潛在的垃圾訊息',
      one: '1 則潛在的垃圾訊息',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor => '回覆已隱藏，因為您已封鎖原作者。';

  @override
  String get chatReplyHiddenSpammerAuthor => '回覆已隱藏，因為原作者被標記為垃圾訊息傳送者。';

  @override
  String get devMarkAsSpamLocally => '標示為騷擾訊息 (僅限本機)';

  @override
  String get devIgnoreSpamFlag => '忽略垃圾訊息標記';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => '媒體選項';

  @override
  String get mediaViewerCopyLink => '複製連結';

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
  String mediaViewerAttachmentThumbnail(int index) {
    return '附件 $index';
  }

  @override
  String get mediaViewerDismissBackdrop => '關閉';

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
  String get composerAutocompleteSuggestions => '建議';

  @override
  String get composerAutocompleteCommandsHeading => '指令';

  @override
  String get composerAutocompleteChoicesHeading => '選項';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => '選用參數';

  @override
  String get composerAutocompleteChannelsHeading => '頻道';

  @override
  String get composerAutocompleteMembersHeading => '成員';

  @override
  String get composerAutocompleteUsersHeading => '用戶';

  @override
  String get composerAutocompleteMentionsHeading => '提及';

  @override
  String get composerAutocompleteRolesHeading => '角色';

  @override
  String get composerAutocompleteMediaHeading => '媒體';

  @override
  String get composerAutocompleteStickersHeading => '貼圖';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => '找不到 GIF';

  @override
  String get composerCommandShrugDescription => '在你的訊息後面加上 ¯\\_(ツ)_/¯。';

  @override
  String get composerCommandTableflipDescription => '在你的訊息後面加上 (╯°□°)╯︵ ┻━┻。';

  @override
  String get composerCommandUnflipDescription => '在你的訊息後面加上 ┬─┬ ノ( ゜-゜ノ)。';

  @override
  String get composerCommandMeDescription => '傳送動作訊息（會以斜體顯示）.';

  @override
  String get composerCommandSpoilerDescription => '傳送爆雷訊息（會用爆雷標籤包住）.';

  @override
  String get composerCommandTtsDescription => '傳送語音訊息.';

  @override
  String get composerCommandNickDescription => '變更您在這個社群的暱稱。';

  @override
  String get composerCommandKickDescription => '將成員從此社群中踢除。';

  @override
  String get composerCommandBanDescription => '將成員從此社群中停權。';

  @override
  String get composerCommandMsgDescription => '傳送私人訊息給使用者。';

  @override
  String get composerCommandSavedDescription => '傳送儲存的媒體項目。';

  @override
  String get composerCommandStickerDescription => '傳送貼圖.';

  @override
  String get composerCommandGifDescription => '搜尋並傳送 GIF。';

  @override
  String get composerCommandMemberOption => '要鎖定的成員。';

  @override
  String get composerCommandReasonOption => '原因（選填）。';

  @override
  String get composerCommandMessageOption => '要傳送的訊息。';

  @override
  String get composerCommandQueryOption => '搜尋內容。';

  @override
  String get composerCommandNicknameOption => '你的新暱稱，留空則重設。';

  @override
  String get composerCommandDeleteMessagesOption => '要刪除多少成員的近期訊息記錄。';

  @override
  String get composerCommandDeleteMessagesNone => '不刪除任何';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return '過去 $count 天';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '過去 24 小時';

  @override
  String get composerCommandOptionRequired => '這個選項是必填的。請提供值。';

  @override
  String get composerCommandClear => '清除指令';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return '你在此社群的暱稱已從 **$previousNickname** 變更為 **$newNickname**。';
  }

  @override
  String get composerCommandUnknownUser => '不明使用者';

  @override
  String composerCommandMsgFailed(String username) {
    return '無法傳送訊息給 **$username**。對方可能關閉了私訊功能，或你已被封鎖。';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count 個更多';
  }

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
  String get addGuildCreateTitle => '建立社群';

  @override
  String get addGuildCreateDescription => '建立社群，和朋友一起聊天。';

  @override
  String get addGuildCreateNameLabel => '社群名稱';

  @override
  String get addGuildCreateSubmit => '建立社群';

  @override
  String get addGuildCreateFailed => '無法建立社群。請再試一次。';

  @override
  String get addGuildCreateClaimTitle => '領取你的帳號';

  @override
  String get addGuildCreateClaimDescription => '您必須先驗證帳號，才能建立社群。';

  @override
  String get addGuildCreateVerifyTitle => '驗證你的電子郵件';

  @override
  String get addGuildCreateVerifyDescription => '您必須先驗證電子郵件地址，才能建立社群。';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      '建立社群時，無法在動畫圖片中使用動畫。請使用靜態圖片。';

  @override
  String get addGuildCreateGuidelinesBefore => '建立社群即表示您同意遵守並維護 ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName 社群指南';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked => '此伺服器僅限建立一個社群，因此無法再新增社群。';

  @override
  String get addGuildCreateChangeIcon => '更換圖示';

  @override
  String get addGuildCreateIconLabel => '社群圖示';

  @override
  String get addGuildCreateIconHint =>
      'PNG、JPEG、WebP、AVIF、HEIC、HEIF、JXL、SVG。上限 10MB。建議：512×512px';

  @override
  String get addGuildImportDescription => '貼上 Discord 範本 URL，將其結構匯入新的社群。';

  @override
  String get addGuildImportUrlLabel => '範本網址';

  @override
  String get addGuildImportUrlInvalid => '請輸入有效的 Discord 伺服器範本網址或代碼。';

  @override
  String get addGuildImportFetchFailed => '無法擷取社群範本。該範本可能不存在，或外部服務暫時無法使用。';

  @override
  String get addGuildImportInvalidResponse => '這看起來不是有效的範本回覆。';

  @override
  String get addGuildImportTemplateLabel => '範本';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount 個文字頻道、$voiceChannelCount 個語音頻道、$categoryCount 個類別、$roleCount 個身分組';
  }

  @override
  String get addGuildImportRemoveIcon => '移除圖示';

  @override
  String get addGuildImportTemplateInvalid => '社群範本資料無效或格式錯誤。';

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
  String get channelDetailsFallbackTitle => '詳細資訊';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return '群組私訊 · $count 位成員';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return '關閉與 $name 的對話？';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return '離開 $name？';
  }

  @override
  String get channelDetailsChannelSettingsTitle => '頻道設定';

  @override
  String get channelDetailsGroupSettingsTitle => '群組設定';

  @override
  String get channelDetailsDmSettingsTitle => '私訊設定';

  @override
  String get channelDetailsInvitePeople => '邀請朋友';

  @override
  String get channelDetailsCopyLink => '複製連結';

  @override
  String get channelMenuCopyChannelLink => '複製頻道連結';

  @override
  String get channelMenuCopyRedirectLink => '複製轉送連結';

  @override
  String get channelDetailsAddFriendsToGroup => '新增朋友至群組';

  @override
  String get channelDetailsGroupInvites => '群組邀請';

  @override
  String get channelDetailsEditChannel => '編輯頻道';

  @override
  String get channelDetailsDeleteChannel => '刪除頻道';

  @override
  String get channelSettingsCategorySettingsTitle => '類別設定';

  @override
  String get channelSettingsEditCategory => '編輯分類';

  @override
  String get channelSettingsTabOverview => '總覽';

  @override
  String get channelSettingsTabPermissions => '權限';

  @override
  String get channelSettingsTabInvites => '邀請';

  @override
  String get channelSettingsTabWebhooks => 'Webhook';

  @override
  String get channelSettingsDeleteChannel => '刪除頻道';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return '確定要刪除 $channelName 嗎？此操作無法復原。';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return '確定要刪除 $categoryName 嗎？此操作無法復原。';
  }

  @override
  String get channelSettingsDeleteCategory => '刪除類別';

  @override
  String get channelSettingsChannelUpdated => '頻道已更新';

  @override
  String get channelSettingsChannelName => '頻道名稱';

  @override
  String get channelSettingsCategoryName => '類別名稱';

  @override
  String get channelSettingsMyCategory => '我的類別';

  @override
  String get categoryExpandCategory => '展開類別';

  @override
  String get categoryCollapseCategory => '收合類別';

  @override
  String get categoryExpandAllCategories => '展開所有類別';

  @override
  String get categoryCollapseAllCategories => '收合所有類別';

  @override
  String get categoryMuteCategory => '將類別設為靜音';

  @override
  String get categoryUnmuteCategory => '解除類別靜音';

  @override
  String get categoryCopyCategoryId => '複製類別 ID';

  @override
  String get categoryIdCopied => '已複製類別 ID';

  @override
  String get channelSettingsChannelNamePlaceholder => '一般';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => '主題';

  @override
  String get channelSettingsTopicPlaceholder => '新增頻道主題';

  @override
  String get channelSettingsInsertEmoji => '插入表情符號';

  @override
  String get channelSettingsTopicTooLongTitle => '頻道主題過長。';

  @override
  String get channelSettingsTopicTooLongMessage => '縮短主題後再試一次。';

  @override
  String get channelSettingsSlowmode => '慢速模式';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return '訊息之間間隔時間。\"$bypassSlowmodePermissionLabel\" 可以繞過此設定。';
  }

  @override
  String get channelSettingsSlowmodeOff => '關閉';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes 分鐘';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours 小時';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute 分鐘';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour 小時';
  }

  @override
  String get channelSettingsVoiceQuality => '語音品質';

  @override
  String get channelSettingsVoiceQualityDescription =>
      '較高的位元率 = 更好的音質和更高的頻寬使用量。';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => '成員上限';

  @override
  String get channelSettingsParticipantLimitDescription =>
      '最多可同時加入的成員人數。0 代表不設上限。';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位成員',
      one: '1 位成員',
      zero: '∞ 無上限',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => '連線限制';

  @override
  String get channelSettingsConnectionLimitDescription =>
      '單一成員在此頻道中最多可維持的活躍連線數。';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個連線',
      one: '1 個連線',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => '語音地區';

  @override
  String get channelSettingsVoiceRegionDescription => '為此頻道選擇語音區域。自動會使用最近的區域。';

  @override
  String get channelSettingsVoiceRegionAutomatic => '自動';

  @override
  String get channelSettingsVoiceRegionsLoadFailed => '無法載入語音區域';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription => '請稍後再試一次。';

  @override
  String get channelSettingsResetSlider => '將滑桿重設為預設值';

  @override
  String get channelSettingsAdvanced => '進階';

  @override
  String get channelSettingsMatureContentOverride => '覆寫成人內容設定';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return '覆寫此頻道的 $scopeLevel 設定。進入前，成人內容會顯示在閘門後。';
  }

  @override
  String get channelSettingsMatureContentInherit => '繼承';

  @override
  String get channelSettingsMatureContentOn => '開啟';

  @override
  String get channelSettingsMatureContentOff => '關閉';

  @override
  String get channelSettingsMatureContentOnDescription => '將此頻道標記為成人內容。';

  @override
  String get channelSettingsMatureContentOffDescription => '允許此頻道顯示成人內容。';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return '繼承自 $inheritedSourceLabel：開啟';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return '從 $inheritedSourceLabel 繼承：關閉';
  }

  @override
  String get channelSettingsMatureContentCategorySource => '分類';

  @override
  String get channelSettingsMatureContentCommunitySource => '社群';

  @override
  String get channelSettingsMatureContentCategoryScope => '類別';

  @override
  String get channelSettingsMatureContentCommunityScope => '社群';

  @override
  String get channelSettingsContentWarningToggle => '在此頻道中顯示內容警示';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      '開啟後，進入此頻道前會顯示同意提示。';

  @override
  String get channelSettingsContentWarningText => '自訂警告文字';

  @override
  String get channelSettingsContentWarningDefault => '此內容含有敏感資訊。';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return '你需要「$manageChannelsPermissionLabel」權限才能編輯這些權限。';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return '你需要有「$manageRolesPermissionLabel」權限才能編輯這些權限。';
  }

  @override
  String get channelSettingsUnknownRole => '不明角色';

  @override
  String get channelSettingsUnknownUser => '不明使用者';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => '存取權限覆寫';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return '編輯 $name 的存取權限';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => '返回覆寫設定';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess => '設定此頻道的基礎存取權限';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides => '設定此身分組的覆寫權限';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides => '設定此成員的權限覆寫';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => '搜尋權限…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated => '頻道存取權已更新';

  @override
  String get channelSettingsPermissionsTitle => '存取控制';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix => '此頻道與父類別同步 ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      '此頻道未與父類別同步 ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => '與類別同步';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast => '頻道已與父類別同步';

  @override
  String get channelSettingsPermissionsAddOverride => '新增覆寫';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers => '搜尋身分組或成員…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => '身分組和成員';

  @override
  String get channelSettingsDeleteInvite => '刪除邀請';

  @override
  String get channelSettingsDeleteInviteConfirm => '要刪除此邀請嗎？此動作無法復原。';

  @override
  String get channelSettingsCopyInviteCode => '複製邀請碼';

  @override
  String get channelSettingsCopyInviteUrl => '複製邀請連結';

  @override
  String get channelSettingsWebhookCreated => '已建立 Webhook';

  @override
  String get channelSettingsWebhookCreateFailed => '建立 Webhook 失敗';

  @override
  String get channelSettingsCreateWebhook => '建立 Webhook';

  @override
  String get channelSettingsInvitesDescription => '管理此頻道的邀請連結。';

  @override
  String get channelSettingsInvitesCreate => '建立邀請';

  @override
  String get channelSettingsInvitesEmpty => '沒有邀請連結';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      '這個頻道還沒有任何邀請連結。建立一個來邀請大家加入這個頻道吧。';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      '載入此頻道的邀請連結時發生錯誤。請再試一次。';

  @override
  String get channelSettingsWebhooksDescription => '管理可將訊息發佈到此頻道的傳入 Webhook。';

  @override
  String get channelSettingsWebhooksEmpty => '沒有網路掛鉤';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      '此頻道尚未設定任何 Webhook。請建立 Webhook，以允許外部應用程式發佈訊息。';

  @override
  String get channelSettingsWebhooksUnsupported => '此頻道不支援網路掛鉤。';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return '你需要擁有「$permission」權限才能檢視和編輯此頻道的網頁掛鉤。';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => '載入網路掛鉤失敗';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      '載入此頻道的 Webhook 時發生錯誤。請再試一次。';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return '由 $creator 於 $date 建立';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => '不明使用者';

  @override
  String get channelSettingsWebhooksAvatar => '大頭貼';

  @override
  String get channelSettingsWebhooksUploadImage => '上傳圖片';

  @override
  String get channelSettingsWebhooksRemove => '移除';

  @override
  String get channelSettingsWebhooksName => '名稱';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook 名稱';

  @override
  String get channelSettingsWebhooksChannel => '頻道';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook 網址';

  @override
  String get channelSettingsWebhooksCopyUrl => '複製 Webhook 網址';

  @override
  String get channelSettingsWebhooksDelete => '刪除 Webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed => '無法刪除此 Webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm => '刪除此網頁掛鉤？此操作無法復原。';

  @override
  String get channelSettingsWebhookTryAgainInAMoment => '請稍後再試一次。';

  @override
  String get channelMenuOpenChat => '開啟聊天';

  @override
  String get channelMenuDuplicateChannel => '複製頻道';

  @override
  String get channelMenuResetMatureContentAgreeState => '重設成人內容同意狀態';

  @override
  String get channelMenuDeleteMyMessagesTitle => '要刪除您在此頻道的訊息嗎？';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      '這會永久刪除您在此頻道中傳送過的所有訊息。此動作無法復原。';

  @override
  String get channelMenuDeleteMyMessagesConfirm => '刪除我的訊息';

  @override
  String get channelMenuDeletedYourMessages => '已刪除你的訊息';

  @override
  String get channelMenuCouldNotDeleteYourMessages => '無法刪除你的訊息';

  @override
  String get channelDetailsSystemMessage => '系統訊息';

  @override
  String get channelDetailsTextChannel => '文字頻道';

  @override
  String get channelDetailsVoiceChannel => '語音頻道';

  @override
  String get channelDetailsCategory => '類別';

  @override
  String get channelDetailsLinkChannel => '連結頻道';

  @override
  String get channelDetailsGenericChannel => '頻道';

  @override
  String get channelDetailsMutedConversation => '已封鎖的對話';

  @override
  String get channelDetailsUnmutedConversation => '已取消訊息通知';

  @override
  String get channelDetailsMutedChannel => '已設為靜音頻道';

  @override
  String get channelDetailsUnmutedChannel => '已取消頻道的靜音';

  @override
  String get channelDetailsNotificationSettingsUpdated => '通知設定已更新';

  @override
  String get channelDetailsTabMembers => '成員';

  @override
  String get channelDetailsTabPins => '釘選訊息';

  @override
  String get channelDetailsActionMute => '靜音';

  @override
  String get channelDetailsActionUnmute => '解除靜音';

  @override
  String get channelDetailsActionSearch => '搜尋';

  @override
  String get channelDetailsActionMore => '更多';

  @override
  String get channelDetailsMembersEmptyTitle => '沒有成員可顯示';

  @override
  String get channelDetailsMembersEmptyBody => '成員載入社群資料後就會顯示在這裡。';

  @override
  String get memberListPermissionDeniedTitle => '你無法查看成員';

  @override
  String get memberListPermissionDeniedBody => '您無法在此社群中查看此頻道的成員';

  @override
  String get memberListUnavailableTitle => '成員列表無法使用';

  @override
  String get memberListUnavailableBody => '此社群的成員列表暫時無法使用';

  @override
  String get channelDetailsPinsLoadFailedTitle => '無法載入釘選訊息';

  @override
  String get channelDetailsPinsGuildEndHint => '擁有「釘選訊息」權限的成員可以釘選訊息，供所有人查看。';

  @override
  String get channelDetailsPinsDmEndHint => '你可以在這個對話中釘選訊息，讓所有人都能看到。';

  @override
  String get channelDetailsPinsEndReached => '你已看到底囉';

  @override
  String get channelHeaderOpenDetails => '開啟頻道詳細資訊';

  @override
  String get channelHeaderPinnedMessages => '釘選的訊息';

  @override
  String get channelHeaderPinnedMessagesUnread => '已釘選訊息，未讀';

  @override
  String get channelHeaderMemberList => '成員列表';

  @override
  String get channelHeaderInbox => '收件匣';

  @override
  String get channelHeaderNotificationSettingsMuted => '通知設定，已靜音';

  @override
  String get channelDetailsSearchTitle => '搜尋';

  @override
  String get channelDetailsSearchHint => '搜尋訊息';

  @override
  String get channelDetailsSearchFilterFrom => '寄件人';

  @override
  String get channelDetailsSearchFilterHas => '有';

  @override
  String get channelDetailsSearchFilterIn => '在';

  @override
  String get channelDetailsSearchFilterMentions => '提及';

  @override
  String get channelDetailsSearchFilterMore => '更多';

  @override
  String get channelDetailsSearchMoreFiltersActive => '啟用中';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count 個頻道';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count 位使用者';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => '用戶';

  @override
  String get channelDetailsSearchAuthorTypeBot => '機器人';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => '依頻道篩選';

  @override
  String get channelDetailsSearchChannelsHint => '搜尋頻道';

  @override
  String get channelDetailsSearchChannelsEmpty => '找不到任何頻道';

  @override
  String get channelDetailsSearchMoreFiltersPinned => '已釘選';

  @override
  String get channelDetailsSearchPinnedTrue => '僅釘選';

  @override
  String get channelDetailsSearchPinnedFalse => '排除釘選訊息';

  @override
  String get channelDetailsSearchClearFilter => '清除';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => '作者類型';

  @override
  String get channelDetailsSearchMoreFiltersDate => '日期';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => '日期模式';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => '選擇日期';

  @override
  String get channelDetailsSearchMoreFiltersLink => '連結主機名稱';

  @override
  String get channelDetailsSearchMoreFiltersFileName => '檔名包含';

  @override
  String get channelDetailsSearchMoreFiltersFileType => '檔案副檔名';

  @override
  String get channelDetailsSearchContentPoll => '投票';

  @override
  String get channelDetailsSearchContentPollDescription => '含有投票的訊息';

  @override
  String get channelDetailsSearchContentForward => '轉傳';

  @override
  String get channelDetailsSearchContentForwardDescription => '轉寄的訊息';

  @override
  String get channelDetailsSearchFilterSort => '排序';

  @override
  String get channelHeaderSearchFiltersTitle => '搜尋篩選條件';

  @override
  String get channelHeaderSearchRecentTitle => '最近的搜尋';

  @override
  String get channelHeaderSearchUsersTitle => '用戶';

  @override
  String get channelHeaderSearchChannelsTitle => '頻道';

  @override
  String get channelHeaderSearchValuesTitle => '數值';

  @override
  String get channelHeaderSearchDatesTitle => '日期';

  @override
  String get channelHeaderSearchDefaultBadge => '預設';

  @override
  String get channelHeaderSearchClearHistory => '清除';

  @override
  String get channelHeaderSearchFilterDescFrom => '使用者';

  @override
  String get channelHeaderSearchFilterDescMentions => '使用者';

  @override
  String get channelHeaderSearchFilterDescHas => '連結、嵌入、圖片、影片、音訊、檔案、貼圖，…';

  @override
  String get channelHeaderSearchFilterDescBefore => '日期或日期範圍';

  @override
  String get channelHeaderSearchFilterDescOn => '日期或日期範圍';

  @override
  String get channelHeaderSearchFilterDescDuring => '日期或日期範圍';

  @override
  String get channelHeaderSearchFilterDescAfter => '日期或日期範圍';

  @override
  String get channelHeaderSearchFilterDescIn => '頻道';

  @override
  String get channelHeaderSearchFilterDescPinned => '是或否';

  @override
  String get channelHeaderSearchFilterDescAuthorType => '用戶、機器人或 webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom => '主機名稱，例如 example.com';

  @override
  String get channelHeaderSearchFilterDescFileName => '附件檔案名稱的一部分';

  @override
  String get channelHeaderSearchFilterDescFileType => '檔案副檔名，例如 png';

  @override
  String get channelHeaderSearchFilterDescSort => '時間戳記或關聯性';

  @override
  String get channelHeaderSearchFilterDescOrder => '升序或降序';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 個結果',
      one: '1 個結果',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => '依用戶篩選';

  @override
  String get channelDetailsSearchFilterByContent => '依內容篩選';

  @override
  String get channelDetailsSearchSortBy => '排序結果依據';

  @override
  String get channelDetailsSearchIn => '在...搜尋';

  @override
  String get channelDetailsSearchEmptyTitle => '搜尋此對話';

  @override
  String get channelDetailsSearchEmptyBody => '輸入文字、作者或內容篩選器來尋找訊息。';

  @override
  String get channelDetailsSearchIndexingTitle => '訊息正在建立索引';

  @override
  String get channelDetailsSearchIndexingBody => '請稍候片刻，待搜尋完成此範圍的索引後再試一次。';

  @override
  String get channelDetailsSearchNoResultsTitle => '沒有結果';

  @override
  String get channelDetailsSearchNoResultsBody => '試試不同的搜尋字詞或篩選條件。';

  @override
  String get channelDetailsMembersOnline => '線上';

  @override
  String get channelDetailsMembersOffline => '離線';

  @override
  String get channelDetailsMemberYou => '你';

  @override
  String get channelDetailsSearchUsersHint => '搜尋用戶';

  @override
  String get channelDetailsSearchUsersTypeToSearch => '輸入以搜尋成員';

  @override
  String get channelDetailsSearchUsersEmpty => '找不到用戶';

  @override
  String get channelDetailsSearchUsersNoAvailable => '沒有可用的用戶';

  @override
  String get channelDetailsDone => '完成';

  @override
  String get channelDetailsHasFilterPrompt => '顯示包含以下內容的訊息：';

  @override
  String get channelDetailsRetry => '重試';

  @override
  String get channelDetailsPinnedMessageTitle => '已釘選訊息';

  @override
  String get channelDetailsSearchResultTitle => '搜尋結果';

  @override
  String get channelDetailsJumpToMessage => '跳至訊息';

  @override
  String get channelDetailsUnpinMessage => '取消訊息置頂';

  @override
  String get channelDetailsCopyMessageLink => '複製訊息連結';

  @override
  String get channelDetailsCopyMessageId => '複製訊息 ID';

  @override
  String get channelDetailsMessageUnpinned => '訊息已解除釘選';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => '目前社群';

  @override
  String get channelDetailsSearchScopeCurrentDm => '目前私訊';

  @override
  String get channelDetailsSearchScopeAllCommunities => '所有社群';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => '所有私訊';

  @override
  String get channelDetailsSearchScopeAllDms => '所有私訊';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => '僅限開放的私訊';

  @override
  String get channelDetailsSearchScopeOpenDms => '開啟私訊';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities => '所有私訊和社群';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities => '你的私訊和社群';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription => '只在此社群中搜尋';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription => '僅搜尋此聊天室';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      '在你目前加入的所有社群中';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      '僅限您曾參與的所有私訊';

  @override
  String get channelDetailsSearchScopeAllDmsDescription => '搜尋所有你曾參與的私訊';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      '在你目前開啟的所有私訊中';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription => '你目前所有開啟的私訊';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      '在所有你曾加入的私訊和目前所在的社群中';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      '在你目前開啟的所有私訊和所有你目前加入的社群';

  @override
  String get channelDetailsSearchSortNewest => '最新優先';

  @override
  String get channelDetailsSearchSortOldest => '由舊到新';

  @override
  String get channelDetailsSearchSortRelevance => '最相關';

  @override
  String get channelDetailsSearchSortNewestDescription => '優先顯示最新訊息';

  @override
  String get channelDetailsSearchSortOldestDescription => '顯示最舊訊息優先';

  @override
  String get channelDetailsSearchSortRelevanceDescription => '優先顯示最相關的訊息';

  @override
  String get channelDetailsSearchContentImage => '圖片上傳';

  @override
  String get channelDetailsSearchContentVideo => '影片上傳';

  @override
  String get channelDetailsSearchContentAudio => '音訊上傳';

  @override
  String get channelDetailsSearchContentFile => '檔案上傳';

  @override
  String get channelDetailsSearchContentLink => '連結';

  @override
  String get channelDetailsSearchContentEmbed => '連結預覽或嵌入';

  @override
  String get channelDetailsSearchContentSticker => '貼圖';

  @override
  String get channelDetailsSearchContentImageDescription => '僅限上傳的圖片檔';

  @override
  String get channelDetailsSearchContentVideoDescription => '僅限上傳的影片檔案';

  @override
  String get channelDetailsSearchContentAudioDescription => '僅限上傳的語音訊息';

  @override
  String get channelDetailsSearchContentFileDescription => '任何上傳的附件';

  @override
  String get channelDetailsSearchContentLinkDescription => '訊息文字中的網址';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      '已解析的預覽和富媒體嵌入，而非上傳項目';

  @override
  String get channelDetailsSearchContentStickerDescription => '訊息中附有貼圖';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count 種內容';
  }

  @override
  String get personalNotesTitle => '個人筆記';

  @override
  String get personalNotesSubtitle => '你的專屬空間，用於記錄想法和提醒';

  @override
  String groupDmWelcome(String displayName) {
    return '歡迎來到 $displayName。邀請朋友加入，讓群組更熱鬧。';
  }

  @override
  String get groupDmWelcomeEditGroup => '編輯群組';

  @override
  String get groupDmWelcomeAddFriends => '新增朋友至群組';

  @override
  String get dmGroupInvites => '邀請';

  @override
  String get groupDmEditTitle => '編輯群組';

  @override
  String get groupDmEditDetailsTooltip => '編輯群組資訊';

  @override
  String get groupDmGroupName => '群組名稱';

  @override
  String get groupDmMyGroup => '我的群組';

  @override
  String get groupDmGroupNameMaxLength => '群組名稱不能超過 100 個字元';

  @override
  String get groupDmGroupIcon => '群組圖示';

  @override
  String get groupDmUploadIcon => '上傳圖示';

  @override
  String get groupDmChangeIcon => '更換圖示';

  @override
  String get groupDmRemoveIcon => '移除圖示';

  @override
  String get groupDmUpdated => '群組已更新';

  @override
  String get groupDmUpdateFailed => '無法更新群組。請再試一次。';

  @override
  String get groupDmAnimatedIconNotSupported => '無法使用動畫圖示。請使用靜態圖片。';

  @override
  String get groupDmAnimatedIconNotSupportedTitle => '不支援動態圖示';

  @override
  String get groupDmIconFileTooLargeTitle => '圖示檔案過大';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return '圖示檔案過大。請選擇一個小於 $maxSize 的檔案。';
  }

  @override
  String get groupDmUnsupportedIconFormat => '不支援的圖示格式';

  @override
  String get groupDmUnsupportedIconFormatBody => '不支援的檔案類型。';

  @override
  String get groupDmCouldntProcessImage => '無法處理圖片';

  @override
  String get groupDmFailedToProcessCroppedImage => '無法處理裁切後的圖片。請再試一次。';

  @override
  String get groupDmInvalidImage => '無效的圖片';

  @override
  String get groupDmInvalidImageBody => '該圖片無效。請嘗試另一張。';

  @override
  String get groupDmAddFriends => '新增';

  @override
  String get groupDmOrSendInvite => '或傳送邀請給朋友：';

  @override
  String get groupDmGenerateInviteLink => '產生邀請連結';

  @override
  String get groupDmCreateInvite => '建立';

  @override
  String get groupDmInviteExpires24Hours => '您的邀請將在 24 小時後失效';

  @override
  String get groupDmAddFriendFailed => '無法將這位朋友新增到群組。請再試一次。';

  @override
  String get groupDmAddFailed => '無法新增至群組';

  @override
  String get groupDmGroupFull => '此群組已滿。請先移除成員，才能再新增成員。';

  @override
  String get groupDmRateLimited => '您的操作太快了。請稍候片刻再試一次。';

  @override
  String get groupDmCreateInviteFailed => '無法建立邀請連結';

  @override
  String get groupDmCreateInviteFailedBody => '無法產生邀請連結。請再試一次。';

  @override
  String get guildNavbarCreateInviteFailed => '無法建立邀請連結。請再試一次。';

  @override
  String get guildNavbarCreateInviteMissingPermissions => '你沒有在此頻道中建立邀請的權限。';

  @override
  String get guildNavbarCreateInviteMaxInvites => '這個社群已達到邀請上限。';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled => '暫時無法為此社群建立邀請。';

  @override
  String get groupDmCopyInviteFailed => '無法複製邀請連結';

  @override
  String get groupDmInvitesOwnerOnly => '只有群組擁有者可以管理邀請。';

  @override
  String get groupDmNoInvitesCreated => '尚未建立邀請';

  @override
  String get groupDmLoadingInvites => '正在載入邀請…';

  @override
  String get groupDmInvitesLoadFailed => '載入邀請失敗。請再試一次。';

  @override
  String get groupDmInvitesRevokeConfirm => '要撤銷此邀請嗎？此動作無法復原。';

  @override
  String get groupDmInviteRevoked => '邀請已撤銷';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return '由 $name 建立。將於 $time 過期。';
  }

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
  String get composerOpenExpressionPicker => '開啟表情符號選擇器';

  @override
  String get composerShowKeyboard => '顯示鍵盤';

  @override
  String get composerCloseAttachmentPanel => '關閉附件選擇器';

  @override
  String get chatAttachmentPanelPhotos => '相片';

  @override
  String get chatAttachmentPanelFiles => '檔案';

  @override
  String get chatAttachmentLibraryPermissionTitle => '需要相簿權限';

  @override
  String get chatAttachmentLibraryPermissionBody => '允許取用相簿，以便瀏覽並附加最近的照片和影片。';

  @override
  String get chatAttachmentLibraryPermissionSettings => '開啟設定';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => '，正在傳送';

  @override
  String get messageAccessibilityFailedSuffix => '，傳送失敗';

  @override
  String get messageAccessibilityAttachmentSummary => '一個附件';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count 個附件';
  }

  @override
  String get messageAccessibilityImageSummary => '一張圖片';

  @override
  String get messageAccessibilityVideoSummary => '一段影片';

  @override
  String get messageAccessibilityAudioSummary => '音訊檔案';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return '貼圖 $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return '檔案 $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => '一個隱藏附件';

  @override
  String get messageAccessibilityEmbedSummary => '一個嵌入';

  @override
  String get messageAccessibilityEmptySummary => '一則訊息';

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
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => '搜尋設定...';

  @override
  String get userSettingsSearchFieldLabel => '搜尋設定';

  @override
  String get userSettingsSearchClear => '清除搜尋';

  @override
  String get userSettingsSearchNoResults => '找不到設定';

  @override
  String get userSettingsNavProfile => '個人資料';

  @override
  String get userSettingsNavSecurityLogin => '安全性與登入';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => '贈禮';

  @override
  String get giftSettingsClaimAccountTitle => '領取你的帳號';

  @override
  String get giftSettingsClaimAccountDescription =>
      '領取你的帳號以兌換或管理 Plutonium 禮物代碼。';

  @override
  String get giftSettingsRedeemTitle => '兌換禮物';

  @override
  String get giftSettingsRedeemDescription => '輸入兌換碼以兌換您帳戶的 Plutonium。';

  @override
  String get giftSettingsRedeemPlaceholder => '輸入禮物代碼…';

  @override
  String get giftSettingsRedeemButton => '兌換';

  @override
  String get giftSettingsRedeemSuccess => '已成功兌換禮物。請享用您的 Plutonium。';

  @override
  String get giftSettingsPurchasedTitle => '已購買的禮物';

  @override
  String get giftSettingsPurchasedDescription =>
      '管理你購買的 Plutonium 禮物代碼。與特別的人分享禮物連結，或為自己兌換！';

  @override
  String get giftSettingsEmptyTitle => '還沒有任何禮物';

  @override
  String get giftSettingsEmptyDescription =>
      '從「Plutonium」分頁購買 Plutonium 禮物與朋友分享。';

  @override
  String get giftSettingsGoToPlutonium => '前往 Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => '載入禮物庫失敗';

  @override
  String get giftSettingsLoadFailedDescription => '稍後再試。';

  @override
  String get giftSettingsTryAgain => '再試一次';

  @override
  String get giftSettingsGiftUrl => '贈禮網址';

  @override
  String get giftSettingsCopy => '複製';

  @override
  String get giftSettingsCopied => '已複製';

  @override
  String get giftSettingsGiftUrlCopied => '禮物連結已複製到剪貼簿！';

  @override
  String get giftSettingsGiftUrlCopyFailed => '無法複製贈禮網址';

  @override
  String giftSettingsPurchasedDate(String date) {
    return '已購買 $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return '已兌換 $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return '由 $name 兌換';
  }

  @override
  String get giftSettingsAlreadyRedeemed => '此禮物已兌換';

  @override
  String get giftSettingsRedeemForYourself => '兌換給自己';

  @override
  String get giftSettingsShareWithFriend => '分享給朋友';

  @override
  String get premiumPlutoniumTagline => '解鎖更高上限和獨家功能，同時支持獨立通訊平台。';

  @override
  String get premiumPurchaseMode => '購買模式';

  @override
  String get premiumForMe => '為我';

  @override
  String get premiumAsAGift => '做為贈禮';

  @override
  String get premiumMonthly => '每月';

  @override
  String get premiumYearly => '年繳';

  @override
  String get premiumPerMonth => '每月';

  @override
  String get premiumPerYear => '每年';

  @override
  String get premiumOneTimePurchase => '一次性購買';

  @override
  String get premiumSave17 => '省 17%';

  @override
  String get premiumUpgradeNow => '立即升級';

  @override
  String get premiumBuyGift => '購買禮物';

  @override
  String get premiumOneYearGift => '1 年贈禮';

  @override
  String get premiumOneMonthGift => '贈送 1 個月';

  @override
  String get premiumMostPopular => '最熱門';

  @override
  String get premiumScrollPrompt => '向下捲動以查看 Plutonium 包含的所有優惠';

  @override
  String get premiumFreeVsPlutonium => '免費版與 Plutonium 版';

  @override
  String get premiumFreeColumn => '免費';

  @override
  String get premiumGiftSectionTitle => '贈送 Plutonium';

  @override
  String get premiumGiftSectionDescription => '贈送訂閱方案，與好友一同體驗 Plutonium。';

  @override
  String get premiumGiftBannerOne => '你有一個新的禮物代碼等著你！';

  @override
  String premiumGiftBannerMany(int count) {
    return '您有 $count 個新的禮物代碼等著您！';
  }

  @override
  String get premiumViewGifts => '檢視禮物';

  @override
  String get premiumReadyToUpgrade => '準備好升級了嗎？';

  @override
  String get premiumReadyToBuyGift => '準備好購買禮物了嗎？';

  @override
  String premiumMonthlyPrice(String price) {
    return '每月 $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return '每年 $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 年 $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 個月 $price';
  }

  @override
  String get premiumManageSubscription => '管理訂閱';

  @override
  String get premiumRedeemGiftCode => '兌換禮物代碼';

  @override
  String get premiumGiftBadge => '贈禮';

  @override
  String get premiumCancelSubscriptionTitle => '取消訂閱？';

  @override
  String get premiumCancelSubscriptionBody =>
      '您可以保留您的福利直到下一個續訂日期，然後有 3 天的寬限期可以重新訂閱並保留您的訂閱記錄。';

  @override
  String get premiumCancelSubscriptionConfirm => '取消訂閱';

  @override
  String get premiumKeepSubscription => '保留訂閱';

  @override
  String get premiumPurchaseHistoryTitle => '購買紀錄';

  @override
  String get premiumPurchaseHistoryDescription =>
      '您近期的發票。若要更改訂閱的付款方式，請在帳單入口網站中新增或選擇一種並設為預設。';

  @override
  String get premiumManagePaymentMethods => '管理付款方式';

  @override
  String get premiumBillingHistory => '帳單記錄';

  @override
  String get premiumSelfServeRefundTitle => '自助退款';

  @override
  String get premiumSelfServeRefundButton => '退款最新購買項目';

  @override
  String get premiumDisclaimerAgreementPrefix => '購買即表示您同意我們的 ';

  @override
  String get premiumDisclaimerAgreementPastPrefix => '購買即表示您同意我們的 ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' 和 ';

  @override
  String premiumActiveUntil(String date) {
    return '有效期限至 $date';
  }

  @override
  String get premiumSubscriptionCanceling => '正在取消';

  @override
  String premiumCancelsOn(String date) {
    return '將於 $date 取消。福利將保留至該日期。';
  }

  @override
  String get premiumReactivateSubscription => '重新啟用';

  @override
  String premiumGiftedUntil(String date) {
    return '贈送至 $date。不會自動續訂。';
  }

  @override
  String get premiumComparisonFeatureColumn => '功能';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return '購買即表示您同意我們的$terms和$privacy。';
  }

  @override
  String get premiumDisclaimerRefund =>
      '付款後 3 天內可自行申請退款，每 30 天限一次。訂閱退款後即會取消訂閱。歐盟/歐洲經濟區買家在結帳時放棄 14 天的撤銷權，以立即存取內容。請使用應用程式內的退款按鈕，而非申請退款。申請退款可能會永久限制您的帳戶。Stripe 會安全處理付款。我們絕不會看到您的完整卡號。';

  @override
  String get premiumTermsOfService => '服務條款';

  @override
  String get premiumPrivacyPolicy => '隱私權政策';

  @override
  String get premiumCheckoutStartFailedTitle => '無法開始結帳';

  @override
  String get premiumCheckoutStartFailedBody => '啟動結帳時發生錯誤。請稍後再試一次。';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      '您目前使用的是贈禮訂閱，到期後不會自動續訂。您可以兌換更多贈禮序號來延長訂閱。贈禮訂閱到期後，即可開始定期訂閱。';

  @override
  String get premiumPlanUnavailable => '此方案無法使用。請聯絡客服。';

  @override
  String get premiumCompletePaymentTitle => '完成付款';

  @override
  String get premiumCompletePaymentBody => '您即將前往 Stripe 完成付款。完成後請返回 Fluxer。';

  @override
  String get premiumChoosePaymentMethodTitle => '選擇付款方式';

  @override
  String get premiumPixPaymentPromptDescription =>
      '使用 Pix 自動扣款，直接從您的巴西銀行帳戶授權定期收費。或者選擇使用信用卡，在 Stripe 的下一個畫面輸入您的信用卡資訊。';

  @override
  String get premiumUsePix => '使用 Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      '使用 UPI 付款，即可設定符合 RBI 規範的印度銀行電子授權。或者選擇使用信用卡，在 Stripe 的下一個畫面輸入信用卡資訊。';

  @override
  String get premiumUseUpi => '使用 UPI';

  @override
  String get premiumUseCard => '使用卡片';

  @override
  String get premiumCustomerPortalOpenFailedTitle => '無法開啟帳務入口網站';

  @override
  String get premiumCustomerPortalOpenFailedBody => '開啟帳務入口網站時發生錯誤。請稍後再試一次。';

  @override
  String get premiumAlreadyVisionaryTitle => '您已經是 Visionary 了';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary 已包含永久存取權，因此不需要重複訂閱。您仍然可以購買禮物送給其他人。';

  @override
  String get premiumExistingSubscriptionTitle => '您已訂閱此項目';

  @override
  String get premiumExistingSubscriptionBody =>
      '我們在此帳戶找到現有的 Fluxer Plutonium 訂閱。請前往安全的帳單入口網站進行管理，以更新付款詳情或查看續訂狀態。如果您剛付款，請稍候一分鐘後重新開啟此頁面。';

  @override
  String get premiumPurchasesDisabledTitle => '無法購買';

  @override
  String get premiumPurchasesDisabledBody =>
      '此帳號已停用購買功能。如果這看起來有誤，請聯絡 support@fluxer.app。';

  @override
  String get premiumClaimAccountToPurchase => '領取你的帳號即可購買 Fluxer Plutonium。';

  @override
  String get premiumVerifyEmailToPurchase =>
      '購買 Fluxer Plutonium 前，你需要驗證你的電子郵件。';

  @override
  String get premiumPerkCustomUsernameTag => '自訂使用者名稱標籤';

  @override
  String get premiumPerkPerCommunityProfiles => '各社群獨立個人檔案';

  @override
  String get premiumPerkMessageScheduling => '訊息排程';

  @override
  String get premiumPerkProfileBadge => '個人檔案徽章';

  @override
  String get premiumPerkCustomVideoBackgrounds => '自訂視訊背景';

  @override
  String get premiumPerkEntranceSounds => '進場音效';

  @override
  String get premiumPerkCommunities => '社群';

  @override
  String get premiumPerkMessageCharacterLimit => '訊息字數限制';

  @override
  String get premiumPerkBookmarkedMessages => '已加星號的訊息';

  @override
  String get premiumPerkFileUploadSize => '檔案上傳大小';

  @override
  String get premiumPerkEmojiStickerPacks => '表情符號與貼圖套件';

  @override
  String get premiumPerkSavedMedia => '已儲存的媒體';

  @override
  String get premiumPerkUseAnimatedEmojis => '使用動態表情符號';

  @override
  String get premiumPerkGlobalEmojiStickerAccess => '全球表情符號和貼圖存取權';

  @override
  String get premiumPerkVideoQuality => '視訊畫質';

  @override
  String get premiumPerkAnimatedAvatarsBanners => '動態大頭貼和個人檔案封面';

  @override
  String get premiumPerkEarlyAccess => '搶先體驗新功能';

  @override
  String get premiumPerkCustomThemes => '自訂主題';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => '最高 4K/60fps';

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
  String get userSettingsNavShortcuts => '捷徑';

  @override
  String get audioAndVideoAudioSectionTitle => '音訊';

  @override
  String get audioAndVideoAudioSectionDescription => '設定你的麥克風、喇叭和語音處理。';

  @override
  String get audioAndVideoVideoSectionTitle => '視訊';

  @override
  String get audioAndVideoVideoSectionDescription => '設定你的相機和螢幕分享品質。';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => '通話中行為';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      '在語音和視訊通話中控制確認提示。';

  @override
  String get audioAndVideoInputDeviceLabel => '輸入裝置';

  @override
  String get audioAndVideoOutputDeviceLabel => '輸出裝置';

  @override
  String get audioAndVideoDefaultDeviceLabel => '預設';

  @override
  String get audioAndVideoUseSpeakerLabel => '使用揚聲器';

  @override
  String get audioAndVideoUseSpeakerDescription => '關閉時，音訊會透過聽筒或連接的耳機播放。';

  @override
  String get audioAndVideoInputVolumeLabel => '輸入音量';

  @override
  String get audioAndVideoOutputVolumeLabel => '輸出音量';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => '語音處理';

  @override
  String get audioAndVideoFocusedVoiceLabel => '語音聚焦';

  @override
  String get audioAndVideoFocusedVoiceDescription => '建議使用。讓你的麥克風更清晰地收音。';

  @override
  String get audioAndVideoDirectInputLabel => '直接輸入';

  @override
  String get audioAndVideoDirectInputDescription =>
      '直接傳送您的音訊。如果您使用外部音訊軟體，此為最佳選擇。';

  @override
  String get audioAndVideoCustomProfileLabel => '自訂';

  @override
  String get audioAndVideoCustomProfileDescription => '自行調整每個設定：雜訊抑制、回音消除和增益。';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => '抑制雜音';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => '加強';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => '標準';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => '無';

  @override
  String get audioAndVideoEchoCancellationLabel => '消除迴音';

  @override
  String get audioAndVideoAutomaticGainControlLabel => '自動增益控制';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      '讓你的麥克風音量更平均。啟用增強式抑制時會關閉。';

  @override
  String get audioAndVideoMicTestSectionTitle => '麥克風測試';

  @override
  String get audioAndVideoMicTestStartLabel => '開始麥克風測試';

  @override
  String get audioAndVideoMicTestStopLabel => '停止麥克風測試';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName 需要麥克風權限才能測試您的輸入。';
  }

  @override
  String get audioAndVideoCameraLabel => '相機';

  @override
  String get audioAndVideoMirrorCameraLabel => '鏡像相機';

  @override
  String get audioAndVideoCameraQualitySectionTitle => '相機畫質';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle => '螢幕分享畫質';

  @override
  String get audioAndVideoFrameRateSectionTitle => '影格率';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p 和 60 FPS 需要 $premiumProductName。';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      '此伺服器目前支援最高 720p、30 FPS 的螢幕分享。';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName 需要麥克風存取權限才能列出您的裝置。';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName 需要相機存取權限才能列出您的裝置。';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel => '隱藏我的鏡頭時不要再詢問';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      '隱藏我的螢幕分享時不要再詢問';

  @override
  String get userSettingsNavNotifications => '通知';

  @override
  String get notificationsGeneralSectionTitle => '一般';

  @override
  String get notificationsEnableNotificationsLabel => '開啟通知';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return '當您收到訊息時取得通知。您可能需要在裝置設定中允許 $productName 的通知。若要進行個別頻道/社群的控制，請從社群選單中開啟通知設定。';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel => '啟用桌面通知';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      '使用作業系統的通知中心。如要設定個別頻道或社群的通知，請在社群圖示上按一下右鍵，然後開啟通知設定。';

  @override
  String get notificationsEnableBrowserNotificationsLabel => '啟用瀏覽器通知';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      '當您收到訊息時會收到通知。您可能需要在瀏覽器設定中允許通知。若要設定個別頻道/社群的通知，請在社群圖示上按一下右鍵，然後開啟通知設定。';

  @override
  String get notificationsPushInactiveTimeoutLabel => '推播通知閒置逾時';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName 可避免在您使用電腦時向您的行動裝置傳送推播通知。請選擇您希望在桌面端保持不活動多久後，才開始接收推播通知。';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute 分鐘';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes 分鐘';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => '提及偏好設定';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel => '回覆提及偏好設定';

  @override
  String get notificationsMentionNoPreferenceName => '無偏好設定';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      '尊重傳送者的意圖，當對方開啟或關閉提及功能時，不顯示警告';

  @override
  String get notificationsMentionPreferMentionName => '偏好提及';

  @override
  String get notificationsMentionPreferMentionDescription =>
      '預設回覆會提及你，如果對方關閉此功能，則會警告寄件者';

  @override
  String get notificationsMentionPreferNoMentionName => '不接收提及通知';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      '預設回覆會省略 @提及，如果寄件人啟用提及功能，則會發出警告';

  @override
  String get notificationsTtsSectionTitle => '文字轉語音通知';

  @override
  String get notificationsTtsEnableCommandLabel => '啟用語音合成播放';

  @override
  String get notificationsTtsEnableCommandDescription =>
      '讓 /tts 唸出你的訊息。關閉此設定會讓這些指令顯示為一般文字。';

  @override
  String get notificationsTtsAccessibilityLinkPrefix => '在下列位置調整播放速度 ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => '協助工具';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => '自動朗讀訊息';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      '將收到的內容轉換為語音，無論是否來自 /tts。';

  @override
  String get notificationsTtsModeAllChannelsName => '所有頻道';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      '讓所有收到的訊息都唸出來，無論開啟哪個頻道。';

  @override
  String get notificationsTtsModeCurrentChannelName => '僅限目前頻道';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      '只朗讀您正在檢視的頻道。朗讀功能會跟隨您切換頻道。';

  @override
  String get notificationsTtsModeNeverName => '永不自動';

  @override
  String get notificationsTtsModeNeverDescription => '除非有人手動執行 /tts，否則保持靜音。';

  @override
  String get notificationsTtsModeAriaLabel => '朗讀所有訊息';

  @override
  String get notificationsSoundsSectionTitle => '音效';

  @override
  String get notificationsMasterVolumeLabel => '主音量';

  @override
  String get notificationsMasterVolumeDescription => '設定所有音效的音量。個別音效的設定會忽略此項。';

  @override
  String get notificationsResetToDefaultVolume => '重設為預設音量';

  @override
  String get notificationsDisableAllSoundsLabel => '關閉所有通知音效';

  @override
  String get notificationsDisableAllSoundsDescription => '您現有的通知音效設定將會保留。';

  @override
  String get notificationsShowMoreSoundEffects => '顯示更多音效';

  @override
  String get notificationsShowFewerSoundEffects => '顯示較少音效';

  @override
  String get notificationsPreviewSound => '預覽音效';

  @override
  String get notificationsPerSoundVolumeTitle => '個別音效音量';

  @override
  String get notificationsPerSoundVolumeDescription =>
      '為個別音效設定自訂音量。未覆寫的音效將依循主音量。';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return '已啟用自訂音量覆寫：$overrideCount。';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return '跟隨主設定 • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return '將「$label」重設為主要音量';
  }

  @override
  String get notificationsResetAllOverrides => '重設所有覆寫設定';

  @override
  String notificationsMuteSound(String label) {
    return '靜音 $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '取消靜音 $label';
  }

  @override
  String get notificationsSoundMessage => '社群訊息通知';

  @override
  String get notificationsSoundDirectMessage => '私訊通知';

  @override
  String get notificationsSoundSameChannelMessage => '目前頻道訊息通知';

  @override
  String get notificationsSoundMute => '語音靜音';

  @override
  String get notificationsSoundUnmute => '語音取消靜音';

  @override
  String get notificationsSoundDeaf => '語音停用';

  @override
  String get notificationsSoundUndeaf => '語音解除靜音';

  @override
  String get notificationsSoundUserJoin => '使用者已加入頻道';

  @override
  String get notificationsSoundUserLeave => '使用者離開頻道';

  @override
  String get notificationsSoundUserMove => '使用者已移動頻道';

  @override
  String get notificationsSoundViewerJoin => '觀眾加入直播';

  @override
  String get notificationsSoundViewerLeave => '觀眾離開直播';

  @override
  String get notificationsSoundVoiceDisconnect => '語音通話已中斷連線';

  @override
  String get notificationsSoundIncomingRing => '來電';

  @override
  String get notificationsSoundCameraOn => '相機已開啟';

  @override
  String get notificationsSoundCameraOff => '相機關閉';

  @override
  String get notificationsSoundScreenShareStart => '螢幕分享開始';

  @override
  String get notificationsSoundScreenShareStop => '螢幕分享已停止';

  @override
  String get notificationsAfkTimeoutSyncFailed => '無法更新推播通知逾時。請再試一次。';

  @override
  String get notificationsMentionPreferenceSyncFailed => '無法更新提及偏好設定。請再試一次。';

  @override
  String get notificationsPermissionDeniedTitle => '已關閉通知';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      '無法啟用通知。請允許通知權限以繼續。';

  @override
  String get userSettingsNavLanguageAndTime => '語言與時間';

  @override
  String get languageAndTimeLanguageSectionTitle => '介面語言';

  @override
  String get languageAndTimeLanguageSectionDescription => '選擇應用程式中使用的語言';

  @override
  String get languageAndTimeOpenLanguageSettings => '開啟語言設定';

  @override
  String get languageAndTimeTimeFormatSectionTitle => '時間格式';

  @override
  String get languageAndTimeTimeFormatSectionDescription => '選擇應用程式中時間的顯示方式';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => '時間格式選擇';

  @override
  String get languageAndTimeTimeFormatAuto => '自動';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 小時制';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 小時制';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return '應用程式語言：$format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return '系統地區設定：$format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat => '使用系統地區設定來顯示時間格式';

  @override
  String get languageAndTimeTimeFormatSyncFailed => '更新時間格式失敗';

  @override
  String get userSettingsNavDefaultApps => '預設應用程式';

  @override
  String get defaultAppsWebBrowserSectionTitle => '網頁瀏覽器';

  @override
  String get defaultAppsWebBrowserSectionDescription => '選擇點按連結時要開啟的瀏覽器。';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      '如果已安裝某個網站的應用程式，連結將會優先在此應用程式中開啟。';

  @override
  String get defaultAppsWebBrowserInApp => '應用程式內瀏覽器';

  @override
  String get defaultAppsWebBrowserExternal => '外部瀏覽器';

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
  String get advancedSettingsConfigure => '設定';

  @override
  String get advancedSettingsCategoryPrivacy => '隱私';

  @override
  String get advancedSettingsCategoryAppearance => '外觀設定';

  @override
  String get advancedSettingsCategoryAccessibility => '協助工具';

  @override
  String get advancedSettingsCategoryChat => '聊天';

  @override
  String get advancedSettingsCategoryMedia => '媒體';

  @override
  String get advancedSettingsCategoryVoice => '語音';

  @override
  String get advancedSettingsCategoryDeveloper => '開發人員';

  @override
  String get advancedSettingEnableTextSelectionLabel => '啟用文字選取';

  @override
  String get advancedSettingEnableTextSelectionDescription => '允許在應用程式中選取文字';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel => '啟用影片搜尋縮圖';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription => '影片播放期間的縮圖或即時畫面';

  @override
  String get advancedSettingHapticFeedbackLabel => '觸覺回饋';

  @override
  String get advancedSettingHapticFeedbackDescription => '點擊和動作的震動回饋。不會在裝置間同步。';

  @override
  String get advancedSettingShowNekoLabel => '顯示 Neko';

  @override
  String get advancedSettingShowNekoDescription => '追逐你游標的貓咪';

  @override
  String get advancedSettingShowNekoDescriptionTouch => '在聊天輸入框顯示 Neko';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel => '啟動縮放動畫';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      '縮放標誌以在離開啟動畫面時縮小';

  @override
  String get advancedSettingKeyboardHintsLabel => '鍵盤提示';

  @override
  String get advancedSettingKeyboardHintsDescription => '工具提示中的鍵盤快捷方式提示。';

  @override
  String get advancedSettingEnableFavoritesLabel => '啟用我的最愛';

  @override
  String get advancedSettingEnableFavoritesDescription => '在應用程式中顯示收藏夾';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel => '語音頻道加入行為';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      '社群語音加入時的確認或雙擊動作';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel => '需要按兩下才能加入語音頻道';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel => '在加入語音頻道前確認';

  @override
  String get advancedSettingAutoSendGifsLabel => '選取後自動傳送 GIF';

  @override
  String get advancedSettingAutoSendGifsDescription => '從選取器自動傳送 GIF，不需確認';

  @override
  String get advancedSettingSaveGifFavoritesLabel => '將 GIF 收藏儲存為已儲存的媒體';

  @override
  String get advancedSettingSaveGifFavoritesDescription => '選擇珍藏的 GIF 儲存方式';

  @override
  String get advancedSettingMediaButtonsLabel => '媒體按鈕';

  @override
  String get advancedSettingMediaButtonsDescription => '自訂媒體附件和嵌入內容上顯示哪些按鈕和指示器';

  @override
  String get advancedSettingPreuploadAttachmentsLabel => '在傳送前上傳附件';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      '訊息輸入欄位中新增附件時，立即開始上傳';

  @override
  String get advancedSettingStripTrackingLabel => '移除網址中的追蹤參數';

  @override
  String get advancedSettingStripTrackingDescription => '自動移除您傳送訊息中網址的追蹤參數';

  @override
  String get advancedSettingTrustAllLinksLabel => '信任所有外部連結';

  @override
  String get advancedSettingTrustAllLinksDescription => '略過所有網域的外部連結警告';

  @override
  String get advancedSettingSearchEnginesLabel => '搜尋引擎';

  @override
  String get advancedSettingSearchEnginesDescription => '設定從選取文字使用的搜尋引擎';

  @override
  String get advancedSettingTranslatorsLabel => '翻譯人員';

  @override
  String get advancedSettingTranslatorsDescription => '設定從選取文字使用的翻譯器提供者';

  @override
  String get advancedSettingReverseImageSearchLabel => '以圖搜圖';

  @override
  String get advancedSettingReverseImageSearchDescription => '圖片反向搜尋供應商';

  @override
  String get advancedSettingMessageActionBarLabel => '訊息操作列';

  @override
  String get advancedSettingMessageActionBarDescription =>
      '自訂將滑鼠游標移至訊息上方時顯示的動作列';

  @override
  String get advancedSettingExpressionAutocompleteLabel => '表情符號自動完成';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      '選擇當您在訊息輸入欄中輸入冒號時，要顯示的內容';

  @override
  String get advancedSettingInputButtonsLabel => '訊息輸入按鈕';

  @override
  String get advancedSettingInputButtonsDescription => '選擇要在訊息輸入欄中顯示哪些按鈕';

  @override
  String get advancedSettingScrollToBottomOnSendLabel => '傳送訊息時捲動至底部';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      '選擇在您傳送訊息後，聊天視窗如何移動';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel => '跳過「全部標示為已讀」的確認步驟';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      '立即將所有未讀的收件匣頻道標示為已讀，不需確認';

  @override
  String get advancedSettingHideMutedChannelsLabel => '預設隱藏已靜音的頻道';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      '在社群側邊欄中隱藏你已設為靜音的頻道';

  @override
  String get advancedSettingShowGifIndicatorLabel => '顯示 GIF 指示器';

  @override
  String get advancedSettingShowAttachmentExpiryLabel => '顯示附件到期指示';

  @override
  String get advancedSettingShowMediaDeleteLabel => '顯示刪除按鈕';

  @override
  String get advancedSettingShowMediaDownloadLabel => '顯示下載按鈕';

  @override
  String get advancedSettingShowMediaFavoriteLabel => '顯示我的最愛按鈕';

  @override
  String get advancedSettingShowSuppressEmbedsLabel => '顯示隱藏嵌入內容按鈕';

  @override
  String get advancedSettingShowMessageActionBarLabel => '顯示訊息操作列';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => '只顯示「更多」按鈕';

  @override
  String get advancedSettingShowQuickReactionsLabel => '顯示快速回應';

  @override
  String get advancedSettingEnableShiftToExpandLabel => '啟用 Shift 鍵展開';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      '在表情符號自動完成中顯示預設表情符號';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      '在表情符號自動完成中顯示自訂表情符號';

  @override
  String get advancedSettingShowStickersAutocompleteLabel => '在表情符號自動完成中顯示貼圖';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      '在表情符號自動完成中顯示儲存的媒體';

  @override
  String get advancedSettingShowGifsButtonLabel => '顯示 GIF 按鈕';

  @override
  String get advancedSettingShowMediaButtonLabel => '顯示媒體按鈕';

  @override
  String get advancedSettingShowStickersButtonLabel => '顯示貼圖按鈕';

  @override
  String get advancedSettingShowEmojiButtonLabel => '顯示表情符號按鈕';

  @override
  String get advancedSettingShowSendButtonLabel => '顯示傳送按鈕';

  @override
  String get advancedSettingNewDeviceAlertsLabel => '顯示新裝置提醒';

  @override
  String get advancedSettingNewDeviceAlertsDescription => '提示新的音訊裝置';

  @override
  String get advancedSettingConnectionVolumeControlsLabel => '連線音量控制';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      '在語音選單中顯示個別裝置的參與者音量滑桿';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel => '螢幕分享預覽行為';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      '預覽、彈出和串流縮圖行為';

  @override
  String get advancedSettingScreenShareCodecLabel => '螢幕分享編解碼器';

  @override
  String get advancedSettingScreenShareCodecDescription => '螢幕分享的視訊編碼器';

  @override
  String get advancedSettingScreenShareCodecAuto => '自動（建議）';

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
  String get advancedSettingPauseScreenSharePreviewLabel => '在背景暫停我的螢幕分享預覽';

  @override
  String get advancedSettingHideStreamPreviewLabel => '隱藏我的直播預覽縮圖';

  @override
  String get advancedSettingDeveloperModeLabel => '啟用開發者模式';

  @override
  String get advancedSettingDeveloperModeDescription => '啟用開發者模式';

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
  String get advancedSettingTranslatorGoogle => 'Google 翻譯';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => '預設搜尋引擎';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      '選擇預設搜尋引擎，以用於搜尋選取的文字。';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => '內建搜尋引擎';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      '啟用或停用內建搜尋引擎。已啟用的引擎會在選取文字時，顯示於訊息操作選單中。';

  @override
  String get advancedSettingCustomSearchEnginesLabel => '自訂搜尋引擎';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return '新增自訂搜尋引擎，並設定自訂 URL 模式。請使用「$query」作為搜尋文字的預留位置。';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => '新增搜尋引擎';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel => '請至少啟用一個搜尋引擎。';

  @override
  String get advancedSettingRemoveSearchEngineLabel => '移除搜尋引擎';

  @override
  String get advancedSettingDefaultTranslatorLabel => '預設翻譯工具';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      '選擇翻譯選取文字時要使用的預設翻譯工具。';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => '內建翻譯工具';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      '啟用或停用內建翻譯工具。啟用後，當您選取文字時，翻譯工具會顯示在訊息的內容選單中。';

  @override
  String get advancedSettingCustomTranslatorsLabel => '自訂翻譯工具';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return '使用自訂 URL 模式新增你自己的翻譯工具。請使用「$query」作為要翻譯文字的預留位置。';
  }

  @override
  String get advancedSettingAddTranslatorLabel => '新增翻譯工具';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel => '請至少啟用一個翻譯工具。';

  @override
  String get advancedSettingRemoveTranslatorLabel => '移除翻譯工具';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel => '預設以圖搜圖';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      '選擇預設用於搜尋圖片的以圖搜圖服務。';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel => '內建以圖搜圖';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      '啟用或停用內建的以圖搜圖服務供應商。已啟用的供應商會顯示在圖片、大頭貼、封面、貼圖和表情符號的內容選單中。';

  @override
  String get advancedSettingCustomReverseImageSearchLabel => '自訂以圖搜圖';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return '新增自訂圖片搜尋來源，使用自訂網址模式。請使用「$url」作為圖片網址的預留位置。';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel => '新增以圖搜圖';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      '請至少啟用一個反向圖片搜尋服務。';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel => '移除以圖搜圖';

  @override
  String get advancedSettingAddSearchEngineTitle => '新增搜尋引擎';

  @override
  String get advancedSettingEditSearchEngineTitle => '編輯搜尋引擎';

  @override
  String get advancedSettingAddTranslatorTitle => '新增翻譯服務供應商';

  @override
  String get advancedSettingEditTranslatorTitle => '編輯翻譯服務供應商';

  @override
  String get advancedSettingAddReverseImageSearchTitle => '新增以圖搜圖引擎';

  @override
  String get advancedSettingEditReverseImageSearchTitle => '編輯反向圖片搜尋引擎';

  @override
  String get advancedSettingSearchProviderNameLabel => '名稱';

  @override
  String get advancedSettingSearchProviderUrlLabel => '網址格式';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder => '我的搜尋引擎';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder => '我的翻譯工具';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder => '我的以圖搜圖';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return '在 \'$query\' 中使用搜尋文字。';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return '請在「$query」中輸入您要搜尋的文字。';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return '請在圖片網址應插入的位置輸入「$url」。';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => '請輸入名稱。';

  @override
  String get advancedSettingSearchProviderUrlRequired => '需要填寫網址格式。';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL 模式必須包含「$query」預留位置。';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL 模式必須包含「$url」預留位置。';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid => '網址格式必須是有效的網址。';

  @override
  String get advancedSettingAddSearchProviderAction => '新增';

  @override
  String get advancedSettingEditSearchProviderAction => '編輯';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => '移除';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return '確定要移除 $engineName 嗎？';
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
  String get userSettingsJoinFluxerLabs => '加入 Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => '應用程式授權';

  @override
  String get userSettingsAppLicensesDescription =>
      '本應用程式使用的開源軟體。本應用程式以 Flutter 建置。';

  @override
  String get userSettingsAppLicensesLoadError => '無法載入應用程式授權。';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個授權',
      one: '1 個授權',
    );
    return '$_temp0';
  }

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
  String get savedMessagesEmptyTitle => '沒有書籤';

  @override
  String get savedMessagesEmptyBody => '將訊息加入書籤，以便稍後查看。';

  @override
  String get savedMessagesEndBody => '這裡沒有更多內容了。';

  @override
  String get savedMessagesRemoveTooltip => '移除書籤';

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
  String get uiSearch => '搜尋';

  @override
  String get uiStartCall => '開始通話';

  @override
  String get uiStartVideoCall => '發起視訊通話';

  @override
  String get uiPlay => '播放';

  @override
  String get uiPause => '暫停';

  @override
  String get uiDownload => '下載';

  @override
  String get uiMoreActions => '更多操作';

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
  String mentionConfirmRoleBody(int count, String roleName) {
    return '這將會通知 $count 位擁有 $roleName 角色的成員。繼續嗎？';
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
  String get guildNavbarGuildSelected => '已選取';

  @override
  String get guildNavbarGuildUnread => '未讀';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 則提及',
      one: '1 則提及',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => '已關閉通知';

  @override
  String get authShowPassword => '顯示密碼';

  @override
  String get authHidePassword => '隱藏密碼';

  @override
  String get chatLoadingMessages => '正在載入訊息';

  @override
  String get friendsMessageFriend => '傳送訊息';

  @override
  String get friendsFriendActions => '好友動作';

  @override
  String get friendsAcceptRequest => '接受好友邀請';

  @override
  String get friendsDeclineRequest => '拒絕好友邀請';

  @override
  String get friendsCancelRequest => '取消好友邀請';

  @override
  String get friendsOpenInbox => '收件匣';

  @override
  String get profileRemoveFriend => '移除好友';

  @override
  String get profileUnblockUser => '解除封鎖';

  @override
  String get profileAcceptFriendRequest => '接受好友邀請';

  @override
  String get profileCancelFriendRequest => '取消好友邀請';

  @override
  String get profileSendFriendRequest => '新增朋友';

  @override
  String get accountOverflowMenu => '帳戶選項';

  @override
  String get navHome => '首頁';

  @override
  String get navNotifications => '通知';

  @override
  String get navYou => '你';

  @override
  String get guildFolderSettingsTitle => '資料夾設定';

  @override
  String get guildFolderNameLabel => '資料夾名稱';

  @override
  String get guildFolderColorLabel => '資料夾顏色';

  @override
  String get guildFolderShowIconWhenCollapsed => '收合時顯示圖示';

  @override
  String get guildFolderIconLabel => '資料夾圖示';

  @override
  String get guildFolderDelete => '刪除資料夾';

  @override
  String get guildFolderIconFolder => '資料夾';

  @override
  String get guildFolderIconStar => '星號';

  @override
  String get guildFolderIconHeart => '愛心';

  @override
  String get guildFolderIconBookmark => '書籤';

  @override
  String get guildFolderIconGameController => '遊戲控制器';

  @override
  String get guildFolderIconShield => '隱藏';

  @override
  String get guildFolderIconMusicNote => '音符';

  @override
  String get guildFolderMarkAsRead => '將資料夾標示為已讀';

  @override
  String get guildBulkMuteCommunities => '將社群設為靜音';

  @override
  String get guildBulkUnmuteCommunities => '解除社群靜音';

  @override
  String get guildBulkCommunityNotificationSettings => '社群通知設定';

  @override
  String get guildBulkCommunityPrivacySettings => '社群隱私設定';

  @override
  String get guildBulkAllowEveryoneAndHere => '允許 @everyone 和 @here';

  @override
  String get guildBulkAllowRoleMentions => '允許提及身分組';

  @override
  String get guildBulkEnableMobilePush => '開啟行動裝置推播通知';

  @override
  String get guildBulkDisableMobilePush => '關閉行動裝置推播通知';

  @override
  String get guildBulkAllowDirectMessages => '允許陌生訊息';

  @override
  String get guildBulkBlockDirectMessages => '封鎖私訊';

  @override
  String get guildBulkAllowBotDirectMessages => '允許機器人傳送私人訊息';

  @override
  String get guildBulkBlockBotDirectMessages => '封鎖機器人私訊';

  @override
  String get guildNavbarGroupDm => '群组私讯';

  @override
  String get guildNavbarCreateChannel => '建立頻道';

  @override
  String get guildNavbarChannelType => '頻道類型';

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
  String get guildNavbarChannelTypeSelection => '選擇頻道類型';

  @override
  String get guildNavbarCreateCategory => '建立分類';

  @override
  String get guildNavbarNewCategoryHint => '新增分類';

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
  String get guildMenuSettingsEmoji => '表情符號';

  @override
  String get guildMenuSettingsStickers => '貼圖';

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
  String get guildMenuSettingsInviteLinks => '邀請';

  @override
  String get guildMenuSettingsBans => '封鎖名單';

  @override
  String get guildMenuSettingsChannels => '頻道';

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
  String get guildSettingsRolesNewRole => '新增身分組';

  @override
  String get guildSettingsRolesDeleteRole => '刪除身分組';

  @override
  String get guildSettingsRolesBackToRoles => '返回身分組';

  @override
  String get guildSettingsBackToSettings => '返回設定';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return '編輯「$name」';
  }

  @override
  String get guildSettingsRolesEditSubtitle => '設定角色權限';

  @override
  String get guildSettingsRolesDisplaySection => '顯示';

  @override
  String get guildSettingsRolesRoleName => '角色名稱';

  @override
  String get guildSettingsRolesRoleColor => '角色顏色';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      '輸入顏色（十六進位、rgb()、hsl() 或名稱）或使用選取器。';

  @override
  String get guildSettingsRolesShowSeparately => '將此身分組單獨顯示';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      '在成員列表中，將擁有此角色的成員顯示在獨立區塊。';

  @override
  String get guildSettingsRolesAllowMentions => '允許提及此身分組';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return '擁有「$permission」權限的成員可以隨時提及角色，不受此設定影響。';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp => '使用此按鈕快速清除所有權限。';

  @override
  String get guildSettingsRolesClearPermissions => '清除權限';

  @override
  String get guildSettingsRolesPermissionsSection => '權限';

  @override
  String get guildSettingsRolesSearchPermissions => '搜尋權限';

  @override
  String get guildSettingsRolesDenseLayout => '緊湊模式';

  @override
  String get guildSettingsRolesComfyLayout => '舒適版面';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => '切換為緊湊版面配置';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => '切換成舒適版面配置';

  @override
  String get guildSettingsRolesSingleColumn => '單欄';

  @override
  String get guildSettingsRolesTwoColumns => '兩欄';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => '切換成單欄顯示';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => '切換成兩欄顯示';

  @override
  String get guildSettingsRolesNoPermissionsFound => '找不到權限';

  @override
  String get guildSettingsRolesCustomHoistOrder => '自訂置頂順序';

  @override
  String get guildSettingsRolesHoistOrder => '提升順序';

  @override
  String get guildSettingsRolesResetHoistOrder => '重設為預設值';

  @override
  String get guildSettingsRolesHoistOrderHelp => '拖曳身分組以自訂其在成員列表中的顯示順序。';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      '沒有置頂身分組。請在身分組上啟用「單獨顯示此身分組」即可在此處查看。';

  @override
  String get guildSettingsRolesLockedTooltip => '您無法編輯此角色，因為這是您的最高角色或高於您的角色';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return '你需要「$permission」權限才能編輯這些權限';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole => '您無法編輯與您最高角色相同或更高權限的角色';

  @override
  String get guildSettingsRolesCannotGrantPermission => '您無法授予自己沒有的權限';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      '你無法移除此權限，因為這會將你自己的權限移除';

  @override
  String get guildSettingsRolesUpdatedSuccess => '身分組已成功更新';

  @override
  String get guildSettingsRolesCreatedSuccess => '身分組建立成功';

  @override
  String get guildSettingsRolesDeletedSuccess => '身分組已成功刪除';

  @override
  String get guildSettingsRolesHoistResetSuccess => '升級順序已重設為預設值';

  @override
  String get guildSettingsRolesNameRequiredTitle => '需要角色名稱';

  @override
  String get guildSettingsRolesNameRequiredBody => '儲存前請先為身分組命名。';

  @override
  String get guildSettingsRolesCreateFailedTitle => '無法建立身分組';

  @override
  String get guildSettingsRolesUpdateFailedTitle => '無法更新角色';

  @override
  String get guildSettingsRolesDeleteFailedTitle => '無法刪除身分組';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '「$name」無法刪除。請再試一次。';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle => '無法重設置頂順序';

  @override
  String get guildSettingsRolesTryAgainInAMoment => '請稍後再試一次。';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return '確定要刪除「$name」角色嗎？擁有此角色的成員將不再擁有該角色。';
  }

  @override
  String get permissionCategoryCommunityWide => '社群範圍';

  @override
  String get permissionCategoryMessagesMedia => '訊息與媒體';

  @override
  String get permissionCategoryModeration => '管理';

  @override
  String get permissionCategoryChannelAccess => '頻道存取權';

  @override
  String get permissionCategoryChannelManagement => '頻道管理';

  @override
  String get permissionCategoryAudioVideo => '語音與視訊';

  @override
  String get permissionUnknown => '不明權限';

  @override
  String get permissionAdministrator => '管理員';

  @override
  String get permissionAdministratorDescription => '授予所有權限並繞過頻道限制。高度敏感。';

  @override
  String get permissionViewActivityLog => '檢視活動記錄';

  @override
  String get permissionViewActivityLogDescription => '讀取社群的變更與管理操作活動紀錄。';

  @override
  String get permissionManageCommunity => '管理社群';

  @override
  String get permissionManageCommunityDescription => '編輯全域設定，例如名稱、說明和圖示。';

  @override
  String get permissionManageRoles => '管理身分組';

  @override
  String get permissionManageRolesDescription =>
      '建立、編輯或刪除低於您最高權限的身份組。也可以編輯頻道權限覆寫。';

  @override
  String get permissionManageChannels => '管理頻道';

  @override
  String get permissionManageChannel => '管理頻道';

  @override
  String get permissionManageChannelDescription => '重新命名並編輯此頻道的設定。';

  @override
  String get permissionManagePermissions => '管理權限';

  @override
  String get permissionManagePermissionsDescription => '編輯此頻道中身分組和成員的覆寫權限。';

  @override
  String get permissionManageWebhooksChannelDescription =>
      '建立、編輯或刪除此頻道的 Webhook。';

  @override
  String get permissionViewChannelMembersChannelDescription => '查看此頻道的成員列表。';

  @override
  String get permissionCreateInviteLinksChannelDescription => '管理此頻道的邀請連結。';

  @override
  String get permissionOverwriteDeny => '拒絕';

  @override
  String get permissionOverwriteInherit => '中立 (繼承)';

  @override
  String get permissionOverwriteAllow => '允許';

  @override
  String get permissionOverwriteSetAllHelp => '使用這些按鈕快速設定所有權限。';

  @override
  String get permissionManageChannelsDescription => '建立、編輯或刪除頻道和類別。';

  @override
  String get permissionKickMembers => '踢出成員';

  @override
  String get permissionBanMembers => '停權成員';

  @override
  String get permissionCreateInviteLinks => '建立邀請連結';

  @override
  String get permissionChangeOwnNickname => '變更自己的暱稱';

  @override
  String get permissionChangeOwnNicknameDescription => '更新你的暱稱。';

  @override
  String get permissionManageNicknames => '管理暱稱';

  @override
  String get permissionManageNicknamesDescription => '更改其他成員的暱稱.';

  @override
  String get permissionCreateEmojiStickers => '建立表情符號和貼圖';

  @override
  String get permissionCreateEmojiStickersDescription =>
      '上傳新的表情符號和貼圖，並管理你自己的創作。';

  @override
  String get permissionManageEmojiStickers => '管理表情符號和貼圖';

  @override
  String get permissionManageEmojiStickersDescription => '編輯或刪除其他成員建立的表情符號和貼圖。';

  @override
  String get permissionManageWebhooks => '管理網路掛鉤';

  @override
  String get permissionManageWebhooksDescription => '建立、編輯或刪除網路掛鉤。';

  @override
  String get permissionSendMessages => '傳送訊息';

  @override
  String get permissionSendTtsMessages => '傳送 TTS 訊息';

  @override
  String get permissionSendTtsMessagesDescription => '傳送語音訊息。';

  @override
  String get permissionManageMessages => '管理訊息';

  @override
  String get permissionManageMessagesDescription => '刪除其他成員的訊息。釘選功能是獨立控制的。';

  @override
  String get permissionPinMessages => '釘選訊息';

  @override
  String get permissionEmbedLinks => '嵌入連結';

  @override
  String get permissionAttachFiles => '附加檔案';

  @override
  String get permissionMentionEveryone => '使用 @everyone/@here 和 @角色';

  @override
  String get permissionMentionEveryoneDescription =>
      '提及所有人或任何身分組（即使該身分組未設定為可提及）.';

  @override
  String get permissionUseExternalEmoji => '使用外部表情符號';

  @override
  String get permissionUseExternalEmojiDescription => '使用其他社群的表情符號.';

  @override
  String get permissionUseExternalStickers => '使用外部貼圖';

  @override
  String get permissionAddReactions => '新增心情回應';

  @override
  String get permissionAddReactionsDescription => '新增訊息回應.';

  @override
  String get permissionBypassSlowmode => '略過慢速模式';

  @override
  String get permissionBypassSlowmodeDescription => '忽略各頻道訊息傳送速率限制。';

  @override
  String get permissionTimeOutMembers => '讓成員暫時停用';

  @override
  String get permissionTimeOutMembersDescription =>
      '在一段時間內，禁止成員傳送訊息、心情回應和加入語音通話。';

  @override
  String get permissionViewChannel => '檢視頻道';

  @override
  String get permissionViewChannelMembers => '檢視頻道成員';

  @override
  String get permissionViewChannelMembersDescription => '查看此社群中頻道的成員列表。';

  @override
  String get permissionConnect => '連線';

  @override
  String get permissionSpeak => '發言';

  @override
  String get permissionStreamVideo => '視訊直播';

  @override
  String get permissionUseVoiceActivity => '使用語音活動';

  @override
  String get permissionUseVoiceActivityDescription => '若沒有此權限，將需要使用按鈕通話。';

  @override
  String get permissionPrioritySpeaker => '優先發言者';

  @override
  String get permissionMuteMembers => '將成員靜音';

  @override
  String get permissionDeafenMembers => '將成員靜音';

  @override
  String get permissionMoveMembers => '移動成員';

  @override
  String get permissionMoveMembersDescription => '將成員拖曳到他們可以存取的頻道之間。';

  @override
  String get permissionSetVoiceRegion => '設定語音區域';

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
  String get guildSettingsWebhooksDescription => '檢視並管理社群中設定的所有 Webhook。';

  @override
  String get guildSettingsWebhooksEmpty => '沒有網路掛鉤';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return '這個社群目前還沒有任何網頁掛鉤。前往 $channelSettingsPath 建立一個。';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return '你需要擁有「$permission」權限才能檢視和編輯此社群的網頁掛鉤。';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => '載入網路掛鉤失敗';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      '載入 webhook 時發生錯誤。請再試一次。';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhook 已更新';

  @override
  String get guildSettingsWebhooksUpdateFailed => '無法更新網路掛鉤';

  @override
  String get guildSettingsUnknownChannel => '不明頻道';

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
  String get guildSettingsDiscoveryDescription => '將你的社群列在探索中，讓其他人可以找到並加入。';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => '成員不足';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return '您的社群需要至少有 $count 位成員，才能列入探索功能。';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => '狀態：';

  @override
  String get guildSettingsDiscoveryStatusPending => '待處理';

  @override
  String get guildSettingsDiscoveryStatusApproved => '已核准';

  @override
  String get guildSettingsDiscoveryStatusRejected => '已拒絕';

  @override
  String get guildSettingsDiscoveryStatusRemoved => '已移除';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return '原因：$reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      '您的社群已列在探索中。您可以更新下列的刊登資訊，或選擇撤下來移除社群。';

  @override
  String get guildSettingsDiscoveryPendingInfo => '您的申請正在審核中。您仍然可以更新刊登詳情或撤回申請。';

  @override
  String get guildSettingsDiscoveryCategory => '類別';

  @override
  String get guildSettingsDiscoveryCategoryHelp => '選擇最符合您社群的類別。您可以隨時變更。';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => '主要語言';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp => '社群中最常用的語言。用於篩選探索結果。';

  @override
  String get guildSettingsDiscoveryDescriptionField => '說明';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder => '描述你的社群主題';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => '必須填寫說明。';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return '說明必須至少包含 $minLength 個字元。';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return '說明長度最多為 $maxLength 個字元。';
  }

  @override
  String get guildSettingsDiscoveryTags => '自訂標籤';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return '最多 $maxTags 個標籤可協助人們找到你的社群。這些標籤會顯示在「探索」搜尋結果中。';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => '新增標籤後按下 Enter 鍵';

  @override
  String get guildSettingsDiscoveryAddTag => '新增';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return '移除標籤 $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => '無法新增標籤';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return '標籤長度必須介於 2 到 $maxLength 個字元，且只能包含英數字元。';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return '您最多只能新增 $maxTags 個標籤。';
  }

  @override
  String get guildSettingsDiscoveryApply => '套用';

  @override
  String get guildSettingsDiscoverySave => '儲存';

  @override
  String get guildSettingsDiscoveryWithdraw => '撤回';

  @override
  String get guildSettingsDiscoveryApplicationSent => '已送出探索申請';

  @override
  String get guildSettingsDiscoveryListingUpdated => '探索列表已更新';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn => '已撤回探索申請';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle => '無法撤回申請';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription => '請稍後再試一次。';

  @override
  String get guildSettingsMembersDescription => '搜尋並管理伺服器成員。';

  @override
  String get guildSettingsMembersSearchHint => '依使用者名稱或 ID 搜尋';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count 位成員';
  }

  @override
  String get guildMembersRecentTitle => '最近加入的成員';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return '顯示 $totalCount 位成員中的 $displayedCount 位';
  }

  @override
  String get guildMembersSort => '排序';

  @override
  String get guildSettingsMembersSortNewest => '最新優先';

  @override
  String get guildMembersSortOldest => '最早的優先';

  @override
  String get guildMembersColumnName => '名稱';

  @override
  String get guildMembersColumnMemberSince => '成員時間';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return '已加入 $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => '加入方式';

  @override
  String get guildMembersColumnRoles => '角色';

  @override
  String get guildMembersColumnActions => '動作';

  @override
  String get guildMembersFilterMemberSince => '篩選加入時間';

  @override
  String get guildMembersFilterJoinedProduct => '依帳號建立日期篩選';

  @override
  String get guildMembersFilterJoinMethod => '依加入方式篩選';

  @override
  String get guildMembersFilterRoles => '依身分組篩選';

  @override
  String get guildMembersFilterAll => '全部';

  @override
  String get guildMembersFilterPast1Hour => '過去 1 小時';

  @override
  String get guildMembersFilterPast24Hours => '過去 24 小時';

  @override
  String get guildMembersFilterPast7Days => '過去 7 天';

  @override
  String get guildMembersFilterPast2Weeks => '過去 2 週';

  @override
  String get guildMembersFilterPast3Weeks => '過去 3 週';

  @override
  String get guildMembersFilterPast4Weeks => '過去 4 週';

  @override
  String get guildMembersFilterPast3Months => '最近 3 個月';

  @override
  String get guildMembersFilterCustomRange => '自訂範圍…';

  @override
  String get guildMembersDateRangeTitle => '自訂日期範圍';

  @override
  String get guildMembersDateAfter => '此日期之後';

  @override
  String get guildMembersDateBefore => '日期之前';

  @override
  String get guildMembersClearAll => '全部清除';

  @override
  String get guildMembersRowsPerPage => '每頁列數';

  @override
  String get guildMembersEmptySearch => '沒有符合搜尋條件的結果。';

  @override
  String get guildMembersLoadError => '載入成員時發生錯誤。請稍後再試。';

  @override
  String get guildMembersIndexing => '正在為伺服器成員建立索引…';

  @override
  String get guildMembersGoToPage => '前往頁面';

  @override
  String guildMembersGoToPageItem(int page) {
    return '前往第 $page 頁';
  }

  @override
  String get guildMembersJumpToPage => '跳轉到頁面';

  @override
  String get guildMembersJoinSourceCreator => '社群建立者';

  @override
  String get guildMembersJoinSourceInvite => '邀請';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return '邀請 ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return '由 $name 邀請';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => '自訂網址';

  @override
  String get guildMembersJoinSourceBotInvite => '邀請機器人';

  @override
  String get guildMembersJoinSourcePlatformAdmin => '平台管理員';

  @override
  String get guildMembersJoinSourceDiscovery => '探索';

  @override
  String get guildMembersJoinMethodUnknown => '不明';

  @override
  String get guildMembersCommunityOwner => '社群擁有者';

  @override
  String get guildMembersViewAllRoles => '查看所有角色';

  @override
  String get guildMembersJoinedJustNow => '剛剛';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分鐘前',
      one: '1 分鐘前',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 小時前',
      one: '1 小時前',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天前',
      one: '1 天前',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => '成員';

  @override
  String get guildMembersChannelListSelected => '已選取成員';

  @override
  String get guildSettingsInvitesTitle => '邀請';

  @override
  String get guildSettingsInvitesDescription =>
      '查看此社群的所有邀請。若要建立新的邀請，請前往頻道並使用邀請按鈕。';

  @override
  String get guildSettingsInvitesEmpty => '沒有邀請連結';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      '這個社群還沒有任何邀請連結。前往頻道並建立邀請，即可邀請其他人。';

  @override
  String get guildSettingsInvitesLoadFailedTitle => '無法載入邀請';

  @override
  String get guildSettingsInvitesLoadFailedDescription => '載入邀請時發生錯誤。請再試一次。';

  @override
  String get guildSettingsInvitesTryAgain => '再試一次';

  @override
  String get guildSettingsInvitesShowCreatedDate => '顯示建立日期而非到期日';

  @override
  String get guildSettingsInvitesPauseInvites => '暫停邀請';

  @override
  String get guildSettingsInvitesEnableInvites => '啟用邀請';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle => '暫停這個社群的邀請';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle => '啟用此社群的邀請功能';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      '要暫停邀請嗎？在新功能重新啟用前，新用戶將無法透過邀請連結加入。現有成員不會受到影響。';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      '要啟用邀請嗎？使用者將能再次透過邀請連結加入此社群。';

  @override
  String get guildSettingsInvitesPause => '暫停';

  @override
  String get guildSettingsInvitesPausedForCommunity => '此社群的邀請功能已暫停。';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return '由於 $productName 偵測到潛在的惡意攻擊，邀請功能已暫停。新使用者目前無法加入。';
  }

  @override
  String get guildSettingsInvitesLabelInviter => '邀請者：';

  @override
  String get guildSettingsInvitesLabelChannel => '頻道：';

  @override
  String get guildSettingsInvitesLabelCode => '代碼：';

  @override
  String get guildSettingsInvitesLabelUses => '使用：';

  @override
  String get guildSettingsInvitesLabelCreated => '建立時間：';

  @override
  String get guildSettingsInvitesLabelExpires => '到期時間：';

  @override
  String get guildSettingsInvitesUnknown => '不明';

  @override
  String get guildSettingsInvitesNoCategory => '無類別';

  @override
  String get guildSettingsInvitesExpired => '已過期';

  @override
  String get guildSettingsInvitesNever => '永不';

  @override
  String get guildSettingsInvitesCopyLink => '複製邀請連結';

  @override
  String get guildSettingsInvitesRevoke => '撤銷邀請';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => '無法撤銷邀請';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      '此連結可能仍然有效。請稍後再試一次。';

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
  String get guildSettingsEmojiSlotsTitle => '表情符號欄位';

  @override
  String get guildSettingsEmojiDropZone => '將表情符號檔案拖曳到這裡';

  @override
  String get guildSettingsEmojiLoadFailed => '表情符號載入失敗。請稍後再試。';

  @override
  String get guildSettingsEmojiSearchEmpty => '找不到符合搜尋條件的表情符號。';

  @override
  String get guildSettingsEmojiNoSlots => '沒有可用的表情符號欄位';

  @override
  String get guildSettingsEmojiSlotsFull => '您已達到表情符號數量上限。請刪除一些現有的表情符號以騰出空間。';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return '表情符號名稱至少需要 2 個字元，並且可以使用字母、數字和底線。表情符號的大小必須小於 $maxSize。靜態圖片會自動調整大小到 128x128 像素並進行壓縮。動畫表情符號和 SVG 檔案必須已符合限制。';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => '正在上傳表情符號';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 個表情符號',
      one: '# 個表情符號',
    );
    return '正在上傳 $_temp0。這可能需要一點時間。';
  }

  @override
  String get guildSettingsEmojiUploadFailed => '表情符號上傳失敗。請再試一次。';

  @override
  String get guildSettingsEmojiSomeFailedTitle => '部分表情符號無法新增';

  @override
  String get guildSettingsEmojiSomeFailedBody => '請檢查這些檔案，然後使用較小或較簡單的圖片再試一次。';

  @override
  String get guildSettingsEmojiRenameTitle => '重新命名表情符號';

  @override
  String get guildSettingsEmojiRenameHint => '2-32 個字元，限英數字、底線。';

  @override
  String get guildSettingsEmojiColumnEmoji => '表情符號';

  @override
  String get guildSettingsEmojiColumnName => '名稱';

  @override
  String get guildSettingsEmojiColumnUploader => '上傳者';

  @override
  String get guildSettingsEmojiUnknownUploader => '不明';

  @override
  String get guildSettingsEmojiDeleteTitle => '刪除表情符號';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return '刪除 :$name:？此操作無法復原。';
  }

  @override
  String get guildSettingsEmojiPurgeLabel => '從儲存空間和 CDN 清除此表情符號';

  @override
  String get guildSettingsEmojiNameTooShort => '表情符號名稱至少需要 2 個字元';

  @override
  String get guildSettingsEmojiNameTooLong => '表情符號名稱最多只能有 32 個字元';

  @override
  String get guildSettingsEmojiInvalidNameTitle => '無效的表情符號名稱';

  @override
  String get guildSettingsEmojiRenameFailedTitle => '無法重新命名此表情符號';

  @override
  String get guildSettingsEmojiRenameFailedBody => '名稱已還原。請稍後再試一次。';

  @override
  String get guildSettingsEmojiGoneTitle => '這個表情符號已不存在';

  @override
  String get guildSettingsEmojiGoneBody => '表情符號可能已被刪除。名稱已還原為先前的名稱。';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle => '您無法重新命名此表情符號';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      '您沒有重新命名此表情符號的權限。名稱已還原為先前的名稱。';

  @override
  String get guildSettingsEmojiRateLimitedTitle => '您的操作太頻繁了';

  @override
  String get guildSettingsEmojiRateLimitedBody => '請稍候片刻，然後再試著重新命名。';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => '無法刪除此表情符號';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle => '您無法刪除此表情符號';

  @override
  String get guildSettingsCloneEmojiTitle => '允許其他人複製你的表情符號';

  @override
  String get guildSettingsCloneEmojiDescription =>
      '啟用後，其他社群的成員就能使用應用程式內的「複製」捷徑來複製您的自訂表情符號。這並不會阻止他們自行儲存圖片並上傳。';

  @override
  String get guildSettingsCloneStickerTitle => '允許其他人複製你的貼圖';

  @override
  String get guildSettingsCloneStickerDescription =>
      '啟用後，其他社群的成員就能使用應用程式內的「一鍵複製」捷徑來複製您的自訂貼圖。這並不會阻止他們儲存圖片並自行上傳。';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return '只有擁有「$permission」權限的成員才能變更此設定。';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed => '無法更新表情符號複製設定';

  @override
  String get guildSettingsCloneStickerUpdateFailed => '無法更新貼圖複製設定';

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
  String get guildSettingsStickerSlotsTitle => '貼圖欄位';

  @override
  String get guildSettingsStickerUploadTitle => '上傳貼圖';

  @override
  String get guildSettingsStickerDropZone => '拖曳貼圖檔案到這裡 (一次一個)';

  @override
  String get guildSettingsStickerDensity => '貼圖密度';

  @override
  String get guildSettingsStickerDensityCozy => '溫馨';

  @override
  String get guildSettingsStickerDensityCompact => '精簡';

  @override
  String get guildSettingsStickersLoadFailedTitle => '貼圖載入失敗';

  @override
  String get guildSettingsStickersLoadFailedBody => '載入貼圖時發生錯誤。請再試一次。';

  @override
  String get guildSettingsStickersSearchEmpty => '找不到符合您搜尋條件的貼圖。';

  @override
  String get guildSettingsStickersEmptySearch => '找不到貼圖';

  @override
  String get guildSettingsStickerNoSlots => '沒有可用的貼圖欄位';

  @override
  String get guildSettingsStickerSlotsFull => '您已達到貼圖數量上限。請刪除一些現有貼圖以騰出空間。';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return '貼圖會以 320x320 像素儲存，且大小必須小於 $maxSize。靜態圖片會自動調整大小並進行壓縮。動畫貼圖和 SVG 檔案必須已符合限制。';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => '不支援的貼圖檔案';

  @override
  String get guildSettingsStickerAddTitle => '新增貼圖';

  @override
  String get guildSettingsStickerEditTitle => '編輯貼圖';

  @override
  String get guildSettingsStickerNameLabel => '名稱';

  @override
  String get guildSettingsStickerNameHint => '我的超讚貼圖';

  @override
  String get guildSettingsStickerDescriptionLabel => '說明';

  @override
  String get guildSettingsStickerDescriptionHint => '描述貼圖';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return '標籤 ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => '新增標籤';

  @override
  String get guildSettingsStickerTagAdd => '新增';

  @override
  String get guildSettingsStickerNameRequired => '必須輸入名稱';

  @override
  String get guildSettingsStickerNameTooShort => '名稱至少需 2 個字元';

  @override
  String get guildSettingsStickerNameTooLong => '名稱長度必須在 30 個字元以下';

  @override
  String get guildSettingsStickerDescriptionTooLong => '說明文字不可超過 500 個字元';

  @override
  String get guildSettingsStickerCreateFailedTitle => '無法建立此貼圖';

  @override
  String get guildSettingsStickerTooLargeTitle => '貼圖檔案過大';

  @override
  String get guildSettingsStickerCompressFailedTitle => '貼圖無法充分壓縮';

  @override
  String get guildSettingsStickerDeleteTitle => '刪除貼圖';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '刪除「$name」？此操作無法復原。';
  }

  @override
  String get guildSettingsStickerPurgeLabel => '從儲存空間和 CDN 清除此貼圖';

  @override
  String get guildSettingsStickerDeleteFailedTitle => '無法刪除此貼圖';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle => '你無法刪除此貼圖';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return '如要建立網頁掛鉤，請開啟 $channelSettingsPath。您仍可在此編輯和整理所有現有的網頁掛鉤。';
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
  String get guildSettingsInvitesTableExpires => '到期';

  @override
  String get guildSettingsAuditLogFilterUser => '依使用者篩選';

  @override
  String get guildSettingsAuditLogFilterAction => '依動作篩選';

  @override
  String get createDm => '建立私人訊息';

  @override
  String get createGroupDm => '建立群組聊天';

  @override
  String get createDmNewMessage => '新訊息';

  @override
  String get createDmSelectFriends => '選擇朋友';

  @override
  String get createDmChooseFriendsSubtitle => '選擇要傳送訊息的朋友。';

  @override
  String get createDmSearchFriends => '搜尋朋友';

  @override
  String get createDmNoFriendsFound => '找不到朋友';

  @override
  String get createDmNoFriendsYet => '您還沒有任何朋友';

  @override
  String get createDmClaimToStartDms => '領取帳號即可開始私訊。';

  @override
  String get createDmVerifyToStartDms => '請驗證你的電子郵件以開始私訊。';

  @override
  String get createDmVerifyYourEmail => '驗證你的電子郵件';

  @override
  String get createDmNewGroup => '建立群組';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return '與 $userName 建立新群組';
  }

  @override
  String get createDmConfirmNewGroup => '確認新群組';

  @override
  String get createDmCreateNewGroup => '建立新群組';

  @override
  String createDmRemoveFriend(String displayName) {
    return '移除 $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      '您已經和這些用戶建立群組了。真的要再建立一個新的嗎？當然也可以！';

  @override
  String get createDmNoActivityYet => '尚無動態';

  @override
  String get createDmSomeUsersCantBeAdded => '部分用戶無法被加入';

  @override
  String get createDmCreateWithoutThem => '不加他們，直接建立';

  @override
  String get createDmUnaddableIntro => '以下成員無法被新增到這個群組訊息：';

  @override
  String createDmUnaddableProceed(int count) {
    return '要用剩餘的 $count 位成員建立群組私訊，並略過其他人嗎？';
  }

  @override
  String get createDmUnaddableNoneRemaining => '沒有可建立群組私訊的剩餘收件人。';

  @override
  String get createDmUnaddableUserNotFound => '找不到用戶';

  @override
  String get createDmUnaddableBlocked => '你無法傳送訊息給這位使用者';

  @override
  String get createDmUnaddableNotFriends => '不在你的好友名單中';

  @override
  String get createDmUnaddableGroupDisabled => '不允許被加到群組私訊';

  @override
  String get createDmFailed => '無法建立對話。請再試一次。';

  @override
  String get dmListMessagesTitle => '訊息';

  @override
  String get dmListDirectMessagesTitle => '直接訊息';

  @override
  String get keybindsSearchShortcuts => '搜尋捷徑';

  @override
  String get keybindSectionDefaults => '預設值';

  @override
  String get keybindSectionMessages => '訊息';

  @override
  String get keybindSectionNavigation => '導覽';

  @override
  String get keybindSectionDragAndDrop => '拖放';

  @override
  String get keybindSectionChat => '聊天';

  @override
  String get keybindSectionVoiceAndVideo => '語音和視訊';

  @override
  String get keybindSectionMisc => '其他';

  @override
  String get keybindActionShowShortcutsList => '顯示鍵盤快速鍵清單';

  @override
  String get keybindActionCopyText => '複製文字';

  @override
  String get keybindActionMarkUnread => '標示為未讀';

  @override
  String get keybindActionFocusTextarea => '聚焦文字輸入區';

  @override
  String get keybindActionSwitchCommunities => '切換社群';

  @override
  String get keybindActionSwitchChannels => '切換頻道';

  @override
  String get keybindActionHistoryBack => '在瀏覽過的頻道記錄中往回移動';

  @override
  String get keybindActionHistoryForward => '在已檢視的頻道記錄中往前移動';

  @override
  String get keybindActionJumpUnreadChannels => '跳轉未讀頻道';

  @override
  String get keybindActionJumpMentionChannels => '跳到有提及的未讀頻道';

  @override
  String get keybindActionJumpCurrentCall => '跳到目前的通話';

  @override
  String get keybindActionToggleLastGuildDms => '切換上次社群和私訊';

  @override
  String get keybindActionPreviousCommunityOrDms => '切換到上一個社群或訊息';

  @override
  String get keybindActionNextCommunityOrDms => '切換到下一個社群或訊息';

  @override
  String get keybindActionGoToDms => '前往私訊';

  @override
  String get keybindActionGoToFirstCommunity => '前往第一個社群';

  @override
  String get keybindActionGoToSecondCommunity => '前往第二個社群';

  @override
  String get keybindActionGoToThirdCommunity => '前往第三個社群';

  @override
  String get keybindActionGoToFourthCommunity => '前往第 4 個社群';

  @override
  String get keybindActionGoToFifthCommunity => '前往第 5 個社群';

  @override
  String get keybindActionGoToSixthCommunity => '前往第 6 個社群';

  @override
  String get keybindActionGoToSeventhCommunity => '前往第 7 個社群';

  @override
  String get keybindActionGoToEighthCommunity => '前往第 8 個社群';

  @override
  String get keybindActionToggleQuickSwitcher => '切換快速切換器';

  @override
  String get keybindActionCreateOrJoinCommunity => '建立或加入社群';

  @override
  String get keybindActionStartDragAndDrop => '開始拖放';

  @override
  String get keybindActionMove => '移動';

  @override
  String get keybindActionDropItem => '丟棄物品';

  @override
  String get keybindActionCancel => '取消';

  @override
  String get keybindActionMarkCommunityRead => '將社群標示為已讀';

  @override
  String get keybindActionMarkChannelRead => '將頻道標示為已讀';

  @override
  String get keybindActionStartGroupDm => '發起群組私訊';

  @override
  String get keybindActionTogglePinnedMessages => '切換釘選的訊息';

  @override
  String get keybindActionToggleInbox => '切換收件匣';

  @override
  String get keybindActionMarkTopInboxRead => '將最上方的收件匣頻道標示為已讀';

  @override
  String get keybindActionMarkAllInboxRead => '將收件匣中的所有頻道標示為已讀';

  @override
  String get keybindActionToggleMemberList => '切換成員列表或語音聊天';

  @override
  String get keybindActionToggleEmojiPicker => '切換表情符號選取器';

  @override
  String get keybindActionToggleGifPicker => '切換 GIF 選擇器';

  @override
  String get keybindActionToggleStickerPicker => '切換貼圖選取器';

  @override
  String get keybindActionScrollChatUp => '向上捲動聊天室';

  @override
  String get keybindActionScrollChatDown => '向下捲動聊天室';

  @override
  String get keybindActionJumpOldestUnread => '跳到最舊的未讀訊息';

  @override
  String get keybindActionFocusComposer => '聚焦文字輸入區';

  @override
  String get keybindActionUploadFile => '上傳檔案';

  @override
  String get keybindActionCopyChannelLink => '複製頻道連結';

  @override
  String get keybindActionToggleSavedMedia => '切換已儲存的媒體';

  @override
  String get keybindActionSendVoiceMessage => '傳送語音訊息';

  @override
  String get keybindActionAnswerCall => '接聽來電';

  @override
  String get keybindActionDeclineCall => '拒絕來電';

  @override
  String get keybindActionStartDmCall => '在私訊或群組中發起通話';

  @override
  String get keybindActionToggleSoundboard => '切換音效面板';

  @override
  String get keybindActionToggleCompactCallView => '展開或收合精簡通話檢視';

  @override
  String get keybindActionPushToTalkPriority => '按住說話 (優先)';

  @override
  String get keybindActionVoiceActivityPriority => '語音活動優先';

  @override
  String get keybindActionOpenHelp => '開啟說明';

  @override
  String get keybindActionSearchMessages => '搜尋訊息';

  @override
  String get keybindActionOpenContextMenu => '開啟操作選單';

  @override
  String get keybindActionOpenSettings => '開啟設定';

  @override
  String get keybindActionOpenThemeStudio => '開啟主題工作室彈出視窗';

  @override
  String get keybindActionZoomIn => '放大';

  @override
  String get keybindActionZoomOut => '縮小';

  @override
  String get keybindActionZoomReset => '重設縮放';

  @override
  String get clipboardPasteFailed => '無法貼上。剪貼簿是空的，或此應用程式無法存取剪貼簿。';

  @override
  String get homeQuickActionDms => '私訊';
}
