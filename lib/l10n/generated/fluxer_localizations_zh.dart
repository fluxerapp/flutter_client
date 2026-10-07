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
  String get splashConnectionLost => '连接已断开';

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
    return '维护计划于 $localizedTime 进行。预计持续时间：$duration。';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return '维护正在进行中。预计持续时间：$duration。';
  }

  @override
  String get nagbarMaintenanceComplete => '维护已完成。';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return '嘿，$displayName，请认领你的账号，以免失去访问权限。';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return '嘿，$displayName，请验证你的邮箱地址。';
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
  String get organizationSsoProvider => '使用你所在组织的单点登录服务商登录。';

  @override
  String get failedToStartSso => '启动单点登录失败';

  @override
  String get ssoCancelled => 'SSO 登录已取消';

  @override
  String preferSso(String provider) {
    return '倾向于使用 SSO？使用 $provider 继续。';
  }

  @override
  String get logInViaBrowser => '通过浏览器登录';

  @override
  String get needAccountPrompt => '还没有账号？ ';

  @override
  String get register => '注册';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => '取消';

  @override
  String get ipAuthCheckEmail => '检查你的邮箱';

  @override
  String ipAuthDescription(String email) {
    return '我们已发送一封邮件到 $email 以授权此次登录。请打开您的收件箱。';
  }

  @override
  String get ipAuthConnectionLost => '连接已断开';

  @override
  String get ipAuthConnectionLostDescription => '等待授权时连接丢失。请重试。';

  @override
  String get ipAuthLinkExpired => '登录链接已过期';

  @override
  String get ipAuthLinkExpiredDescription => '此授权链接已过期。请重新登录。';

  @override
  String get ipAuthResendEmail => '重新发送邮件';

  @override
  String get ipAuthResent => '已重新发送';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds秒';
  }

  @override
  String get back => '返回';

  @override
  String get next => '下一步';

  @override
  String get mfaTitle => '双重认证';

  @override
  String get mfaChooseMethod => '选择一种验证方式';

  @override
  String get mfaMethodTotp => '身份验证器应用';

  @override
  String get mfaMethodWebauthn => '安全密钥/通行密钥';

  @override
  String get mfaTotpDescription => '请输入您的身份验证器应用中的 6 位数字代码或您的备用代码之一。';

  @override
  String get mfaCodeLabel => '验证码';

  @override
  String get mfaTryAnotherMethod => '尝试其他方式';

  @override
  String get mfaUseSecurityKey => '改用安全密钥/通行密钥';

  @override
  String get accountSelectorTitle => '选择一个账号';

  @override
  String get accountSelectorDescription => '选择一个账号继续，或添加其他账号。';

  @override
  String get accountAdd => '添加账号';

  @override
  String get accountRemove => '移除';

  @override
  String accountRemoveTitle(String username) {
    return '移除 $username';
  }

  @override
  String get accountRemoveDescription => '这会移除此账号的已保存会话。';

  @override
  String get accountRemoveOnlyDescription => '这将移除此设备上保存的唯一账号。';

  @override
  String get accountExpired => '已过期';

  @override
  String accountSessionExpired(String identifier) {
    return '$identifier 的会话已过期。请重新登录。';
  }

  @override
  String get accountManageTitle => '管理账号';

  @override
  String get accountSwitchFailed => '无法切换账号。请重试。';

  @override
  String get profileTabMenuSwitchAccounts => '切换账号';

  @override
  String get statusChangeSheetTitle => '设置状态';

  @override
  String get statusOnlineStatusSection => '在线状态';

  @override
  String get statusOnline => '在线';

  @override
  String get statusIdle => '空闲';

  @override
  String get statusDnd => '免打扰';

  @override
  String get statusInvisible => '隐身';

  @override
  String get statusOffline => '离线';

  @override
  String get statusUntilIChangeIt => '直到我更改';

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
  String get statusDndDescription => '你不会在桌面端收到通知';

  @override
  String get statusInvisibleDescription => '你将显示为离线状态';

  @override
  String get customStatusSetTitle => '设置自定义状态';

  @override
  String get customStatusCurrentHint => '自定义状态';

  @override
  String get customStatusClear => '清除自定义状态';

  @override
  String get customStatusPlaceholder => '在忙些什么？';

  @override
  String get customStatusChooseEmoji => '选择表情';

  @override
  String get customStatusClearAfter => '清除时间';

  @override
  String get customStatusSave => '保存';

  @override
  String get accountActive => '当前账号';

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
  String get forgotPasswordDescription => '输入你的邮箱，我们会给你发送重置密码的链接。';

  @override
  String get forgotPasswordSubmit => '发送重置链接';

  @override
  String get forgotPasswordSentTitle => '检查你的邮箱';

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
  String get recoverAccountTitle => '恢复你的账户';

  @override
  String get recoverAccountDescription => '输入您的用户名和恢复工具包中的恢复密钥，然后选择一个新密码。';

  @override
  String get recoverAccountNoKit => '没有恢复工具？请向此实例的管理员请求重置密码链接。';

  @override
  String get recoveryKitTitle => '你的恢复工具包';

  @override
  String get recoveryKitCreatedDescription =>
      '如果忘记密码，此恢复工具是您重新登录账户的唯一途径。请将其存放在安全的地方，例如密码管理器或打印副本。';

  @override
  String get recoveryKitReplacedDescription => '您旧的恢复密钥已失效。请妥善保管新的恢复密钥。';

  @override
  String get recoveryKitRecoveredDescription =>
      '您的密码已重置。旧的恢复密钥已失效。请妥善保管新的恢复密钥。';

  @override
  String get recoveryKitWarning => '拥有此密钥的任何人都可以重置您的密码。切勿分享。';

  @override
  String get recoveryKitKeyLabel => '恢复密钥';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return '$productName 恢复密钥';
  }

  @override
  String get recoveryKitDocumentIntro =>
      '请妥善保管此页面。如果忘记密码，可以使用它重新登录您的账户。拥有此恢复密钥的任何人都可以重置您的密码，切勿分享。';

  @override
  String get recoveryKitInstanceLabel => '实例';

  @override
  String get recoveryKitCreatedAtLabel => '创建时间';

  @override
  String get recoveryKitQrCaption => '扫描以打开恢复页面，并填入您的详细信息。';

  @override
  String get recoveryKitStepsTitle => '如何恢复你的账户';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return '前往 $recoverUrl 或扫描二维码。';
  }

  @override
  String get recoveryKitStepEnter => '输入你的用户名和此恢复密钥。';

  @override
  String get recoveryKitStepPassword => '设置新密码。您将获得一套新的恢复工具包，旧的将失效。';

  @override
  String get recoveryKitBackupCodesTitle => '两步验证备份代码';

  @override
  String get recoveryKitBackupCodesNote => '每个代码在用于身份验证器应用时都可使用一次。';

  @override
  String get recoveryKitBackupCodesFailed => '无法加载您的备用代码。';

  @override
  String get recoveryKitIncludeBackupCodes => '在保存的图片中包含我的双重验证备用码';

  @override
  String get recoveryKitCopy => '复制';

  @override
  String get recoveryKitCopied => '已复制恢复密钥';

  @override
  String get recoveryKitSaveImage => '保存图片';

  @override
  String get recoveryKitSaved => '已保存恢复包';

  @override
  String get recoveryKitSavedToPhotos => '已将恢复包保存到照片';

  @override
  String get recoveryKitSaveFailed => '无法保存恢复包。请重试，或改为复制密钥。';

  @override
  String get recoveryKitAcknowledge => '我已将恢复工具包存放在安全的地方';

  @override
  String get recoveryKitCreateFailed => '无法创建你的恢复工具包。你可以在稍后在账户设置中创建。';

  @override
  String get recoveryKitSectionTitle => '恢复工具包';

  @override
  String get recoveryKitSectionDescription => '如果忘记密码，可以使用它来重置。';

  @override
  String get recoveryKitNone => '你还没有恢复工具包';

  @override
  String recoveryKitCreatedRelative(String time) {
    return '创建于 $time';
  }

  @override
  String get recoveryKitCreate => '创建恢复工具包';

  @override
  String get recoveryKitCreateNew => '创建新套件';

  @override
  String get recoveryKitReplaceTitle => '创建新的恢复套件？';

  @override
  String get recoveryKitReplaceDescription => '创建新恢复工具包后，您当前的工具包将停止工作。';

  @override
  String get recoveryKitReminderTitle => '保存恢复工具包';

  @override
  String get recoveryKitReminderBody =>
      '您的账号未绑定邮箱。如果忘记密码，恢复工具是找回账号的唯一途径。只需一分钟即可完成。';

  @override
  String get registerUsernameSignInHint => '您将使用此用户名登录。请选择一个您能记住的。';

  @override
  String get registerUsernameTaken => '该用户名已被占用';

  @override
  String get registerUsernameAvailable => '该用户名可用';

  @override
  String get claimAccountUsernameDescription =>
      '选择用户名和密码来认领你的账号。你将用它们来登录，所以请选择你记得住的。';

  @override
  String get unclaimedAccountDescriptionUsername =>
      '您的账户尚未认领。没有用户名和密码，您将无法从其他设备登录，并可能丢失账户访问权限。立即认领您的账户以确保其安全。';

  @override
  String get addFriendUsernameOnlyHint => '用户名';

  @override
  String get registerTitle => '创建账号';

  @override
  String get registerDisplayName => '显示名称（可选）';

  @override
  String get registerDisplayNameHint => '大家怎么称呼你？';

  @override
  String get registerUsername => '用户名（可选）';

  @override
  String get registerUsernameHint => '留空则随机生成用户名';

  @override
  String get registerUsernameTagHint => '系统将自动添加一个 4 位数的标签以确保唯一性';

  @override
  String get registerDateOfBirth => '出生日期';

  @override
  String get registerMonth => '月';

  @override
  String get registerDay => '日';

  @override
  String get registerYear => '年';

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
  String get registerSubmit => '创建账号';

  @override
  String get registerHaveAccount => '已有账号？';

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
  String get errorInvalidUsernameOrPassword => '用户名或密码无效。';

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
  String get embedInviteUnknownTitle => '未知邀请';

  @override
  String get embedInviteUnknownSubtitle => '可以请对方重新发送邀请。';

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
    return '$productName 检测到潜在的突袭，因此新用户暂时无法加入。';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain => '该社区已暂停邀请。请稍后重试。';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName 在此社区中检测到潜在的突袭。邀请已暂停，因此新用户暂时无法加入。';
  }

  @override
  String get inviteAcceptTitle => '你受邀加入';

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
  String get inviteAcceptJoinGroupButton => '加入群聊';

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
  String get channelAccessDeniedTitle => '无法访问频道';

  @override
  String get channelAccessDeniedDescription => '你无权访问发送此消息的频道。';

  @override
  String get messageJumpLinkNoAccess => '无法访问';

  @override
  String get okay => '好的';

  @override
  String get embedThemeTitle => '共享主题';

  @override
  String get embedThemeHelp => '你收到了 CSS！';

  @override
  String get embedThemeImport => '导入主题';

  @override
  String get embedThemeUnavailableTitle => '主题不可用';

  @override
  String get embedThemeUnavailableDescription => '此主题不再可用。';

  @override
  String get embedThemeImportUnavailable => '无法导入';

  @override
  String get themeImportTitle => '导入主题';

  @override
  String get themeImportDescription => '这会替换你当前的自定义主题。';

  @override
  String get themeImportReadFailed => '无法读取此主题。它可能已损坏或无效。';

  @override
  String get themeImportApply => '应用';

  @override
  String get themeImportApplied => '主题已成功应用。';

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
  String get embedGiftClaimAccountHelp => '请先认领账号，然后才能领取此礼物。';

  @override
  String get embedGiftClaim => '领取礼物';

  @override
  String get embedGiftClaimed => '礼物已领取';

  @override
  String get embedGiftClaimAccount => '认领账号后领取';

  @override
  String get embedGiftUnknownTitle => '未知礼物';

  @override
  String get embedGiftUnknownSubtitle => '此礼品码无效或已被领取。';

  @override
  String get embedGiftUnavailable => '礼物不可用';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return '领取您的礼物，以激活您的 $productName 订阅！';
  }

  @override
  String get giftAcceptAlreadyClaimed => '此礼物已被领取。';

  @override
  String get giftAcceptMaybeLater => '以后再说';

  @override
  String get giftRedeemedToast => '礼物已兑换！';

  @override
  String get giftRedeemInvalidTitle => '礼品码无效';

  @override
  String get giftRedeemInvalidMessage => '此兑换码无效或已被使用。';

  @override
  String get giftRedeemAlreadyRedeemedTitle => '礼物已兑换';

  @override
  String get giftRedeemAlreadyRedeemedMessage => '此兑换码已被兑换。';

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
  String get giftCopyLink => '复制礼物链接';

  @override
  String get privacySettings => '隐私设置';

  @override
  String get privacyDirectMessages => '私信';

  @override
  String get privacyDirectMessagesDescription => '允许此社区中的其他成员发送直接消息';

  @override
  String get privacyBotDirectMessages => '机器人私信';

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
    return '将 $guildName 静音';
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
  String get notificationMuteChannel => '将频道静音';

  @override
  String get notificationUnmuteChannel => '取消频道静音';

  @override
  String get notificationUseCategoryDefault => '使用类别默认设置';

  @override
  String get notificationUseCommunityDefault => '使用社区默认设置';

  @override
  String get notificationNoCategory => '无类别';

  @override
  String get dmMarkAsRead => '标为已读';

  @override
  String get dmMuteConversation => '将私信静音';

  @override
  String get dmUnmuteConversation => '取消私信静音';

  @override
  String get dmPinDm => '置顶私信';

  @override
  String get dmUnpinDm => '取消置顶私信';

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
  String get dmDeleteMyMessagesTitle => '删除你在此对话中的消息？';

  @override
  String get dmDeleteMyMessagesDescription => '此操作将永久删除你在此对话中发送过的所有消息，且无法撤销。';

  @override
  String get dmCopyChannelId => '复制频道 ID';

  @override
  String get dmChannelIdCopied => '频道 ID 已复制';

  @override
  String get dmCopyUserId => '复制用户 ID';

  @override
  String get dmUserIdCopied => '用户 ID 已复制';

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
  String get dmEditGroup => '编辑群聊';

  @override
  String get dmInviteToCommunity => '邀请加入社区';

  @override
  String get dmBlock => '屏蔽';

  @override
  String get dmLeaveGroup => '退出群聊';

  @override
  String dmInviteSentFor(String communityName) {
    return '已发送加入 $communityName 的邀请';
  }

  @override
  String get dmInviteSendFailed => '无法发送邀请。请重试。';

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
  String get dmPinGroupDm => '置顶群聊';

  @override
  String get dmUnpinGroupDm => '取消置顶群聊';

  @override
  String get dmUnnamedGroup => '未命名群聊';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName的群聊';
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
  String get dmChangeFriendNickname => '修改好友昵称';

  @override
  String get dmRemoveFriend => '删除好友';

  @override
  String get dmAddFriend => '添加好友';

  @override
  String get dmAcceptFriendRequest => '接受好友请求';

  @override
  String get dmIgnoreFriendRequest => '忽略好友请求';

  @override
  String get dmFriendRequestSent => '已发送好友请求';

  @override
  String get dmUnblock => '取消屏蔽';

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
  String get dmRemoveFriendConfirmTitle => '删除好友';

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
  String get dmFriendRequestSentToast => '已发送好友请求';

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
  String get addFriendUsernameLabel => '好友用户名';

  @override
  String get addFriendSendRequest => '发送请求';

  @override
  String get addFriendNoUserFound => '未找到该用户名的用户。';

  @override
  String get addFriendInvalidUsername => '请输入有效的用户名（用户名#0000）。';

  @override
  String get addFriendOutgoingSuccess => '已发送好友请求';

  @override
  String get addFriendClaimTitle => '认领你的账号';

  @override
  String get addFriendClaimDescription => '请先认领你的账号，然后才能发送好友请求。';

  @override
  String get addFriendVerifyTitle => '验证邮箱';

  @override
  String get addFriendVerifyDescription => '你需要先验证邮箱地址，才能发送好友请求。';

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
  String get addFriendOutgoingStatus => '已发送好友请求';

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
    return '接受 $userName 的好友请求吗？';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '忽略来自 $displayName 的好友请求？';
  }

  @override
  String get addFriendCancelRequest => '取消请求';

  @override
  String get addFriendCancelRequestFailed => '无法取消好友请求。请重试。';

  @override
  String get addFriendNotAcceptingRequests => '对方暂时不接受好友请求。';

  @override
  String get addFriendUnblockFirst => '请先取消屏蔽，才能发送好友请求。';

  @override
  String get addFriendCannotSendToSelf => '你不能给自己发送好友请求。';

  @override
  String get addFriendAlreadyFriends => '你和对方已经是好友。';

  @override
  String get addFriendClaimToSend => '请先完成注册，然后才能发送好友请求。';

  @override
  String get addFriendVerifyToSend => '请先验证你的邮箱，然后才能发送好友请求。';

  @override
  String get addFriendFriendsListFull => '你的好友列表已满，或者对方的已满。请移除一些好友后重试。';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => '系统';

  @override
  String get emojiSearchPlaceholder => '搜索你喜欢的表情';

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
  String get emojiInfoCustomUnknownDescription => '这是来自某个社区的自定义表情。';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      '这是社群中的自定义表情。请联系作者，获取邀请以使用此表情。';

  @override
  String get emojiInfoFromHeader => '此表情符号来自';

  @override
  String get emojiInfoDiscoverableCommunity => '可发现的社区';

  @override
  String get emojiInfoPrivateCommunity => '私有社区';

  @override
  String get emojiInfoVerifiedCommunity => '已认证社区';

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
  String get gifPickerFavorites => '收藏夹';

  @override
  String get gifPickerFavoritesEmptyTitle => '暂无收藏的 GIF';

  @override
  String get gifPickerFavoritesEmptyDescription => '收藏 GIF 即可在此处查看。';

  @override
  String get gifPickerTrending => '热门 GIF';

  @override
  String get gifPickerNoResultsTitle => '无搜索结果';

  @override
  String get gifPickerNoResultsDescription => '换个搜索词试试';

  @override
  String get gifPickerLoadFailedTitle => '无法加载 GIF';

  @override
  String get gifPickerLoadFailedBody => '请检查你的网络连接，然后重试。';

  @override
  String get emojiCategoryPeople => '用户';

  @override
  String get emojiCategoryNature => '自然';

  @override
  String get emojiCategoryFood => '食物与饮品';

  @override
  String get emojiCategoryActivity => '活动';

  @override
  String get emojiCategoryTravel => '旅行与地点';

  @override
  String get emojiCategoryObjects => '物品';

  @override
  String get emojiCategorySymbols => '符号';

  @override
  String get emojiCategoryFlags => '旗帜';

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
    return '你即将离开 $productName';
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
  String get externalLinkStripTrackingLabel => '移除链接跟踪参数';

  @override
  String get externalLinkStripTrackingDescription =>
      '自动移除你发送的消息中网址里的跟踪参数（例如 utm_source、fbclid、gclid）。链接在发送给其他人之前就会被清理。';

  @override
  String get externalLinkTrustAllConfirmTitle => '信任所有外部链接？';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      '这将信任所有外部链接，并跳过所有域名的警告。你现有的受信任域名将被替换。这样安全性较低。';

  @override
  String get externalLinkTrustAllConfirmAction => '全部信任';

  @override
  String get externalLinkStopTrustingAllTitle => '停止信任所有链接？';

  @override
  String get externalLinkStopTrustingAllDescription =>
      '外部链接警告将再次显示。你需要逐个添加受信任的域名。';

  @override
  String get externalLinkStopTrustingAllAction => '关闭全部信任';

  @override
  String get externalLinkTrustedAllDescription => '所有外部链接均受信任，不会显示警告。';

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
  String get changeYourFluxerTag => '更改用户名';

  @override
  String get fluxerTagInputLabel => '用户名';

  @override
  String get fluxerTagDescriptionBase =>
      '用户名只能包含字母（a-z、A-Z）、数字（0-9）和下划线。用户名不区分大小写。';

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
  String get fluxerTagAlreadyTaken => '用户名已被占用';

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
  String get fluxerTagUpdated => '用户名已更新';

  @override
  String get fluxerTagUpdateFailed => '更新 用户名 失败。请重试。';

  @override
  String get continueAction => '继续';

  @override
  String get profileCustomizationTitle => '个人资料自定义';

  @override
  String get profileCustomizationDescription => '编辑个人资料外观并实时预览';

  @override
  String get usernameLabel => '用户名';

  @override
  String get claimAccountToChangeFluxerTag => '认领账号后即可修改用户名';

  @override
  String get changeFluxerTag => '修改用户名';

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
  String get changeAvatar => '更换头像';

  @override
  String get removeAvatar => '移除头像';

  @override
  String get avatarDescription => 'PNG、JPEG、WebP、GIF。最大 10MB。推荐：512×512px';

  @override
  String get bannerLabel => '横幅';

  @override
  String get changeBanner => '更换横幅';

  @override
  String get removeBanner => '移除横幅';

  @override
  String get bannerDescription =>
      'PNG、JPEG、WebP、GIF。最大 10MB。最小：960×540px (16:9)';

  @override
  String get accentColorLabel => '主题色';

  @override
  String get accentColorDescription => '自定义个人资料页面的边框和横幅颜色';

  @override
  String get aboutMeLabel => '关于我';

  @override
  String get aboutMeHelperText => '你可以使用链接、表情和 Markdown。';

  @override
  String get emojiPickerTitle => '表情';

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
  String get maskVisionaryAsSubscription => '将 Visionary 显示为普通订阅';

  @override
  String get maskVisionaryDescription => '改为将你的 Visionary 显示为普通订阅';

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
    return '$productName 成员时间';
  }

  @override
  String get unclaimedAccountTitle => '未认领账号';

  @override
  String get unclaimedAccountDescription =>
      '你的账户尚未认领。没有电子邮件和密码，你可能会丢失访问权限。立即认领你的账户以确保其安全。';

  @override
  String get claimAccount => '认领账号';

  @override
  String get profileTypeLabel => '个人资料类型';

  @override
  String get profileTypeGlobal => '全局个人资料';

  @override
  String get profileTypeGuildDescription =>
      '你正在编辑社区专属个人资料。此资料仅在此社区可见，并会覆盖你的全局个人资料。';

  @override
  String get communityNicknameLabel => '社区昵称';

  @override
  String get perGuildPremiumUpsellText =>
      '为单个社群自定义头像、横幅、强调色和个人简介需要 Plutonium。社群昵称和代词对所有人免费。';

  @override
  String get avatarModeInherit => '使用全局个人资料';

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
  String get profileNoteVisibility => '（仅自己可见）';

  @override
  String get profileNoteEmpty => '暂无备注。';

  @override
  String get sudoTitle => '验证你的身份';

  @override
  String get sudoDescription => '此操作需要验证才能继续。';

  @override
  String get sudoAuthenticatorCode => '身份验证器验证码';

  @override
  String get sudoMethodPassword => '密码';

  @override
  String get sudoMethodTotp => '身份验证器';

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
  String get securityLoginEmailAddressLabel => '邮箱地址';

  @override
  String get securityLoginNoEmailSet => '未设置邮箱地址';

  @override
  String get securityLoginChangeEmail => '更改邮箱';

  @override
  String get securityLoginAddEmail => '添加邮箱';

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
  String get passwordChangeVerifyTitle => '验证邮箱';

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
  String get passwordChangePasswordsDoNotMatch => '密码不匹配';

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
  String get resend => '重新发送';

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
  String get disable => '停用';

  @override
  String get delete => '删除';

  @override
  String get save => '保存';

  @override
  String get securityTfaSectionTitle => '双重认证';

  @override
  String get securityTfaSectionDescription => '为你的账号添加额外的安全保护';

  @override
  String get securityTfaAuthenticatorApp => '验证器应用';

  @override
  String get securityTfaAuthenticatorEnabled => '双重认证已开启';

  @override
  String get securityTfaAuthenticatorDisabled => '使用身份验证器应用生成双重认证验证码';

  @override
  String get securityTfaBackupCodes => '备用码';

  @override
  String get securityTfaBackupCodesDescription => '查看和管理用于账号恢复的备用码';

  @override
  String get securityTfaViewCodes => '查看备用码';

  @override
  String get securityPasskeysSectionTitle => '通行密钥';

  @override
  String get securityPasskeysSectionDescription => '使用通行密钥进行无密码登录和两步验证';

  @override
  String get securityPasskeysRegistered => '已注册通行密钥';

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
  String get securityPasskeyNameTitle => '命名通行密钥';

  @override
  String get securityPasskeyNameLabel => '通行密钥名称';

  @override
  String get securityPasskeyNameHint => '例如：YubiKey、iPhone、工作电脑';

  @override
  String get securityPhoneSectionTitle => '手机号';

  @override
  String get securityPhoneSectionDescription => '管理您的手机号码';

  @override
  String get securityPhoneLabel => '手机号';

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
  String get securityClaimDescription => '认领你的账号，即可使用双重认证、通行密钥等安全功能。';

  @override
  String get securityVerifyEmailRequired => '您必须先验证您的电子邮件地址，才能设置双重验证或通行密钥。';

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
  String get totpDisableSuccess => '双重认证已停用';

  @override
  String get backupCodesTitle => '备用码';

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
  String get backupCodesViewTitle => '查看备用码';

  @override
  String get backupCodesViewDescription => '查看备用验证码前可能需要进行验证。';

  @override
  String get phoneAddTitle => '添加手机号码';

  @override
  String get phoneAddLabel => '手机号';

  @override
  String get phoneAddHint => '输入你的电话号码';

  @override
  String get phoneAddFooter =>
      '我们将发送短信验证码（如果可用）。您的号码不会与您的帐户关联。我们仅保留一个加密标记，不含用户 ID，以便在约 30 天内最多进行 2 次验证。';

  @override
  String get phoneAddSendCode => '发送验证码';

  @override
  String get phoneVerifyTitle => '验证手机号';

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
  String get phoneCannotBeUsed => '此电话号码无法使用。请尝试其他手机号码或联系支持团队。';

  @override
  String get phoneAlreadyUsed => '此电话号码已被使用。请尝试其他号码或联系支持团队。';

  @override
  String get phoneCodeDidNotWork => '验证码无效。请检查后重试。';

  @override
  String get phoneTooManyAttempts => '尝试次数过多。请稍等片刻，然后重试。';

  @override
  String get phoneSmsUnavailable => '短信验证暂时不可用。请稍后重试或联系支持团队。';

  @override
  String get phoneNotEligible => '此账号无法进行手机验证。请使用其他方式或联系支持团队。';

  @override
  String get phoneSomethingWentWrong => '出错了。请重试。';

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
    return '请完成必要的验证，以继续使用 $productName。';
  }

  @override
  String get requiredActionIntroPhone => '你的注册需要先完成一项额外的反垃圾信息检查，然后才能继续。';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return '请验证你的邮箱或手机号，以继续使用 $productName。';
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
  String get requiredActionUsePhone => '使用手机号';

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
  String get dangerZoneDisableTitle => '停用账号';

  @override
  String get dangerZoneDisableDescription => '暂时停用你的账号。之后重新登录即可恢复。';

  @override
  String get dangerZoneDisableConfirmDescription =>
      '禁用您的账号将使您退出所有会话。您可以通过再次登录随时重新启用您的账号。';

  @override
  String get dangerZoneDeleteTitle => '删除账号';

  @override
  String get dangerZoneDeleteDescription => '永久删除你的账号和所有相关数据。此操作无法撤销。';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      '在删除账号前，请在 Plutonium 设置中取消您的有效 Plutonium 订阅。';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => '无法删除账号';

  @override
  String get dangerZoneDeleteOwnsCommunities => '你还拥有社区，无法删除账号。请先转让以下社区的所有权：';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return '及另外 $count 个';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return '要转移所有权，请前往 $settingsPath 并使用转移所有权选项。';
  }

  @override
  String get dangerZoneDeleteConfirmDescription => '确定要删除你的账号吗？此操作将安排永久删除你的账号。';

  @override
  String get dangerZoneDeleteBullet1 => '你可以在 14 天内取消删除流程';

  @override
  String get dangerZoneDeleteBullet2 => '14 天后，你的账号将被永久删除';

  @override
  String get dangerZoneDeleteBullet3 => '删除处理完成后，你将无法再访问自己的账号';

  @override
  String get dangerZoneDeleteBullet4 => '删除账号后，您将无法删除您发送的消息';

  @override
  String get dangerZoneDeleteDisclaimer =>
      '如果您想先导出数据或删除消息，请在继续操作前访问用户设置中的隐私中心。';

  @override
  String get claimAccountTitle => '认领你的账号';

  @override
  String get claimAccountDescription => '添加邮箱和密码来认领你的账号。我们会在完成前发送验证码来确认你的邮箱。';

  @override
  String get claimAccountEmailLabel => '邮箱';

  @override
  String get claimAccountPasswordLabel => '密码';

  @override
  String get claimAccountSendCode => '发送验证码';

  @override
  String get claimAccountVerifyDescription =>
      '请输入我们发送到你邮箱的验证码以验证邮箱。验证码确认后，即可设置你的密码。';

  @override
  String get claimAccountSuccess => '账号认领成功';

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
  String get authorizedAppsTitle => '已授权应用';

  @override
  String authorizedAppsDescription(String productName) {
    return '以下应用已被授予访问您的$productName账户的权限。';
  }

  @override
  String get authorizedAppsEmptyTitle => '无已授权应用';

  @override
  String get authorizedAppsEmptyDescription => '你还没有授权任何应用访问你的账号。';

  @override
  String get authorizedAppsLoadError => '已授权应用加载失败';

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
  String get authorizedAppsScopeIdentify => '访问你的基本资料（用户名、头像等）';

  @override
  String get authorizedAppsScopeEmail => '查看你的邮箱地址';

  @override
  String get authorizedAppsScopeGuilds => '查看你加入的社区';

  @override
  String get authorizedAppsScopeConnections => '查看你已连接的账号';

  @override
  String get authorizedAppsScopeBot => '将机器人添加到社区并授予其请求的权限';

  @override
  String get authorizedAppsScopeAdmin => '访问管理端点';

  @override
  String get applicationsTitle => '应用';

  @override
  String get applicationsCreate => '创建应用';

  @override
  String get applicationsCreateSubmit => '创建';

  @override
  String get applicationsCreateClaimTooltip => '认领你的账号以创建应用。';

  @override
  String applicationsDocsLink(String domain) {
    return '阅读文档（$domain）';
  }

  @override
  String get applicationsLoadError => '无法加载应用';

  @override
  String get applicationsLoadErrorDescription => '请检查你的网络连接，然后重试。';

  @override
  String get applicationsEmptyTitle => '暂无应用';

  @override
  String applicationsEmptyDescription(String apiName) {
    return '创建你的第一个应用，开始使用 $apiName。';
  }

  @override
  String applicationsCreated(String date) {
    return '创建于 $date';
  }

  @override
  String get applicationsName => '应用名称';

  @override
  String get applicationsNameHint => '我的应用';

  @override
  String get applicationsNameRequired => '应用名称为必填项';

  @override
  String get applicationsBackToList => '返回列表';

  @override
  String get applicationsDetailLoadError => '无法加载此应用';

  @override
  String get applicationsDetailLoadErrorDescription => '请重试或返回应用列表。';

  @override
  String get applicationsId => '应用 ID';

  @override
  String get applicationsCopyId => '复制 ID';

  @override
  String get applicationsSecretsTitle => '密钥和令牌';

  @override
  String get applicationsSecretsDescription => '请妥善保管。重新生成会破坏现有集成。';

  @override
  String get applicationsClientSecret => '客户端密钥';

  @override
  String get applicationsBotToken => '机器人令牌';

  @override
  String get applicationsRegenerate => '重新生成';

  @override
  String get applicationsRegenerateClientSecretTitle => '重新生成客户端密钥？';

  @override
  String get applicationsRegenerateBotTokenTitle => '重新生成机器人令牌？';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      '重新生成会使当前密钥失效。请更新所有使用旧值的代码。';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      '重新生成会使当前令牌失效。请更新所有使用旧值的代码。';

  @override
  String get applicationsClientSecretRegenerated => '客户端密钥已重新生成。请更新所有使用旧密钥的代码。';

  @override
  String get applicationsBotTokenRegenerated => '机器人令牌已重新生成。请更新所有使用旧令牌的代码。';

  @override
  String get applicationsRegenerateFailed => '无法重新生成密钥';

  @override
  String get applicationsInfoTitle => '应用信息';

  @override
  String get applicationsInfoDescription => '基本设置和允许的重定向 URI。';

  @override
  String get applicationsPublicBot => '公开机器人';

  @override
  String get applicationsPublicBotDescription => '允许任何人邀请此机器人加入自己的社区。';

  @override
  String get applicationsRequireCodeGrant => '需要 OAuth2 授权码';

  @override
  String get applicationsRequireCodeGrantDescription =>
      '邀请此机器人时，需要重定向 URI 和授权码。';

  @override
  String get applicationsRedirectUris => '重定向 URI';

  @override
  String get applicationsAddRedirect => '添加重定向';

  @override
  String get applicationsDeleteRedirect => '删除重定向 URI';

  @override
  String get applicationsBotProfileTitle => '机器人资料';

  @override
  String get applicationsBotProfileDescription => '机器人的头像、标签和丰富的个人资料信息。';

  @override
  String get applicationsBotAvatar => '机器人头像';

  @override
  String get applicationsUsernameRequired => '需要填写用户名';

  @override
  String get applicationsUsernameTooLong => '用户名最多 32 个字符';

  @override
  String get applicationsUsernameInvalid => '用户名只能包含字母、数字和下划线';

  @override
  String get applicationsBotUsername => '机器人用户名';

  @override
  String get applicationsDiscriminator => '识别码';

  @override
  String get applicationsBotBio => '机器人简介';

  @override
  String get applicationsBotBioHint => '一个能做很多厉害事情的实用机器人！';

  @override
  String get applicationsNoBotBanner => '无机器人横幅';

  @override
  String get applicationsFriendlyBot => '友好机器人';

  @override
  String get applicationsFriendlyBotDescription => '允许用户向此机器人发送好友请求，以便手动批准。';

  @override
  String get applicationsManualFriendApproval => '需要手动批准好友申请';

  @override
  String get applicationsManualFriendApprovalDescription =>
      '此机器人收到的好友请求需要手动批准。';

  @override
  String get applicationsOauthBuilderTitle => 'OAuth2 URL 构建器';

  @override
  String get applicationsOauthBuilderDescription => '使用范围和权限构建授权 URL。';

  @override
  String get applicationsScopes => '权限范围';

  @override
  String get applicationsRedirectUri => '重定向 URI';

  @override
  String get applicationsSelectRedirectUri => '选择重定向 URI';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      '此机器人需要 OAuth2 授权码，因此必须填写重定向 URI。';

  @override
  String get applicationsRedirectRequiredScopes => '当权限范围不止机器人一项时，必须填写重定向 URI。';

  @override
  String get applicationsBotPermissions => '机器人权限';

  @override
  String get applicationsAuthorizeUrl => '授权网址';

  @override
  String get applicationsAuthorizeUrlPlaceholder => '选择权限范围（如果需要，可填写重定向 URI）';

  @override
  String get applicationsCopyAuthorizeUrl => '复制授权 URL';

  @override
  String get applicationsCopiedUrl => '已将网址复制到剪贴板';

  @override
  String get applicationsDangerTitle => '危险区域';

  @override
  String get applicationsDangerSubtitle => '此操作无法撤销。移除应用也会删除其机器人。';

  @override
  String get applicationsDangerHelper => '删除后，该应用及其凭据将被永久删除。';

  @override
  String get applicationsDelete => '删除应用';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return '你确定要删除 $name 吗？此操作无法撤消。所有相关数据，包括机器人用户，都将被永久删除。';
  }

  @override
  String get applicationsDeleteFailed => '无法删除应用';

  @override
  String get applicationsUpdated => '应用更新成功';

  @override
  String get applicationsNoChanges => '没有要保存的更改';

  @override
  String get applicationsSearchBots => '应用与机器人';

  @override
  String get applicationsSearchBotsDescription => '创建和管理你账号下的应用和机器人';

  @override
  String get applicationsSearchInfoDescription => '编辑应用基本信息和重定向 URI';

  @override
  String get applicationsSearchBotProfileDescription =>
      '编辑机器人头像、标签、简介、横幅和好友请求行为';

  @override
  String get applicationsSearchOauthDescription => '构建包含权限范围、重定向和机器人权限的授权网址';

  @override
  String get applicationsSearchSecretsDescription => '查看和重新生成客户端密钥与机器人令牌';

  @override
  String get applicationsSearchBotsKeyword => '机器人';

  @override
  String get applicationsSearchDocumentation => '文档';

  @override
  String get privacyPendingDeletionTitle => '待删除';

  @override
  String get blockedUsersTitle => '已屏蔽用户';

  @override
  String get blockedUsersDescription => '被屏蔽的用户无法向你发送好友请求，也无法直接给你发消息。';

  @override
  String get blockedUsersEmptyTitle => '暂无已屏蔽用户';

  @override
  String get blockedUsersEmptyDescription => '你还没有屏蔽任何人。';

  @override
  String get blockedUsersLoadError => '无法加载已屏蔽的用户';

  @override
  String get blockedUsersUnblock => '取消屏蔽';

  @override
  String get blockedUsersUnblockTitle => '取消屏蔽用户';

  @override
  String blockedUsersUnblockDescription(String username) {
    return '您确定要解除对 $username 的屏蔽吗？';
  }

  @override
  String get blockedUsersCopyTag => '复制用户名';

  @override
  String get blockedUsersCopyId => '复制用户 ID';

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
    return '$productName 捉虫猎人';
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
    return '共同好友（$count）';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return '共同社区（$count）';
  }

  @override
  String get userProfileMutualFriendsTitle => '共同好友';

  @override
  String get userProfileMutualCommunitiesTitle => '共同社区';

  @override
  String get userProfileNoMutualFriends => '没有共同好友。';

  @override
  String get userProfileNoMutualCommunities => '未找到共同社区。';

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
  String get blockedUserComposerBarrierAction => '取消屏蔽';

  @override
  String get userProfileOpenDm => '打开私信';

  @override
  String get userProfileNoteTitle => '备注';

  @override
  String get userProfileNoteVisibility => '（仅自己可见）';

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
  String get userProfileRoles => '身份组';

  @override
  String get memberRoleAdd => '添加身份组';

  @override
  String memberRoleRemove(String roleName) {
    return '移除身份组“$roleName”';
  }

  @override
  String get userProfileNoRolesInCommunity => '该用户在此社区中没有身份组。';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return '暂无身份组。在$rolesSettingsPath中添加身份组';
  }

  @override
  String get memberRolesNoRolesAvailable => '没有可用的身份组';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return '此社区暂时没有可分配的角色，但您可以在 $rolesSettingsPath 中创建新角色。';
  }

  @override
  String get guildSettingsTitle => '社区设置';

  @override
  String get guildSettingsRolesTab => '身份组';

  @override
  String get memberRolesConfirmOk => '确定';

  @override
  String get userProfileLocalTime => '当地时间';

  @override
  String get profileLocalTimeSettingsTitle => '个人资料中的当地时间';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return '设置一次你的时区，$productName 就能在夏令时变化时自动更新你的 UTC 偏移。其他人只能看到你的 UTC 偏移，看不到你确切的时区标识符。';
  }

  @override
  String get profileLocalTimeEditButton => '编辑个人资料中的当地时间';

  @override
  String get profileLocalTimeTimezoneLabel => '时区';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return '选择时区，$productName 将使用该时区来计算你个人资料本地时间的 UTC 偏移量。';
  }

  @override
  String get profileLocalTimeSearchTimezones => '搜索时区';

  @override
  String get profileLocalTimeNotSet => '未设置';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return '当你选择分享个人资料中的当地时间时，其他人只能看到你当前的 UTC 偏移量。他们看不到你确切的时区标识符，例如 $timezoneIdentifierExample。$productName 存储该标识符，只是为了在夏令时变化时自动更新偏移量。';
  }

  @override
  String get profileLocalTimePrivacyEveryone => '所有人';

  @override
  String get profileLocalTimePrivacyEveryoneDesc => '允许任何可以查看你完整个人资料的人看到你的本地时间';

  @override
  String get profileLocalTimePrivacyFriends => '好友';

  @override
  String get profileLocalTimePrivacyFriendsDesc => '允许好友查看你的当地时间';

  @override
  String get profileLocalTimePrivacyCommunityMembers => '社区成员';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      '允许你所在社区的成员查看你的当地时间';

  @override
  String get userProfileSameTimeAsYou => '与你的时区相同';

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
  String get userProfileViewCommunityProfile => '查看社区个人资料';

  @override
  String get userProfileBlockUser => '屏蔽用户';

  @override
  String get userProfileUnblockUser => '取消屏蔽用户';

  @override
  String get userProfileRemoveFriend => '删除好友';

  @override
  String get userProfileBlockConfirmTitle => '屏蔽用户';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return '您确定要屏蔽 $username 吗？';
  }

  @override
  String get userProfileUnblockConfirmTitle => '取消屏蔽用户';

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
  String get userProfileChangeNickname => '修改昵称';

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
  String get userProfileReportMessage => '举报消息';

  @override
  String get userProfileReportUserProfile => '举报个人资料';

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
  String get userProfileBanDeleteHistoryLabel => '删除聊天记录';

  @override
  String get userProfileBanDeleteNone => '不删除任何消息';

  @override
  String get userProfileBanDelete24h => '过去 24 小时';

  @override
  String get userProfileBanDelete7d => '过去 7 天';

  @override
  String get userProfileBanReasonLabel => '原因（可选）';

  @override
  String get userProfileBanReasonHint => '填写封禁理由';

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
  String get userProfileTransferSuccess => '所有权已转让';

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
  String get typingIndicatorMultiple => '多人正在输入…';

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
    return '很高兴你来了，$username！';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return '欢迎你，$username！把这里当自己家就好。';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return '你好，$username！很高兴你加入。';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return '你好，$username！准备好了就随时加入吧。';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return '嘿，$username，很高兴在这里见到你！';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return '嗨，$username！希望你在这里玩得开心。';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return '嘿，$username，欢迎加入！';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return '你来啦，$username！';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return '欢迎加入，$username！';
  }

  @override
  String systemJoinWelcome(String username) {
    return '欢迎，$username！';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return '欢迎，$username！很高兴你加入我们。';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return '欢迎你，$username！希望你在这里玩得开心。';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return '欢迎，$username！你的新对话从这里开始。';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return '欢迎你，$username。很高兴你加入。';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return '很高兴见到你，$username！欢迎加入。';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return '$username，你来啦！很高兴你加入我们。';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return '$username，你到啦！我们开始吧。';
  }

  @override
  String get relativeTimeShortNow => '刚刚';

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
  String get linkedDevicesViewDetails => '查看详情';

  @override
  String get linkedDevicesDetailsTitle => '设备详情';

  @override
  String get linkedDevicesDetailsDevice => '设备';

  @override
  String get linkedDevicesDetailsClient => '客户端';

  @override
  String get linkedDevicesDetailsLocation => '位置';

  @override
  String get linkedDevicesDetailsIp => 'IP 地址';

  @override
  String get linkedDevicesDetailsLastUsed => '上次使用';

  @override
  String get linkedDevicesCurrentSession => '当前会话';

  @override
  String get linkedDevicesUnknown => '未知';

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
    return '慢速模式已设置为 $durationLabel，但你不受限制。';
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
    return '来自 $productName 员工的系统公告。你无法在此回复。';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled => '此社区的消息功能已临时暂停。';

  @override
  String get channelComposerBarrierTimedOut =>
      '你已被禁言。在禁言结束前，你无法发送消息、使用反应或加入语音。';

  @override
  String get channelComposerBarrierUnclaimedAccount => '你需要先认领账号，才能在此社区中发送消息。';

  @override
  String get channelComposerBarrierUnverifiedEmail => '你需要验证邮箱才能在此社区中发送消息。';

  @override
  String get channelComposerBarrierAccountTooNew => '你的账号注册时间太短，无法在此社区中发送消息。';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      '你加入此社区的时间还不够长，暂时无法发送消息。';

  @override
  String get channelComposerBarrierNoPhoneNumber => '你需要验证手机号才能在此社区中发送消息。';

  @override
  String get channelComposerBarrierVerifyEmail => '验证邮箱';

  @override
  String get channelComposerBarrierVerifyPhone => '验证手机号';

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
  String get voiceMessageDiscard => '放弃语音消息';

  @override
  String get voiceMessageSend => '发送语音消息';

  @override
  String get voiceMessageMicPermissionDenied => '无法开始录音。请允许访问麦克风。';

  @override
  String get voiceMessageRecordingNotSupported => '此设备不支持语音录制。';

  @override
  String get voiceMessageMicInUse => '请离开语音通话以录制语音消息。';

  @override
  String get voiceMessageRecordingFailed => '录音失败，请重试。';

  @override
  String get voiceMessageSendFailed => '无法发送语音消息。请重试。';

  @override
  String get voiceMessageRecordingHint => '现在开始说话。完成后点击停止，之后可以修剪。';

  @override
  String get voiceMessageReviewHint => '拖动滑块修剪，然后点击发送。';

  @override
  String get voiceMessageStop => '停止';

  @override
  String get voiceMessageStartRecording => '开始录音';

  @override
  String get voiceMessageRerecord => '重新录音';

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

    return '所选内容时长必须至少为 $secondsString 秒。';
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
  String get chatTextualPreviewNoLanguagesFound => '未找到结果';

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
  String get chatAttachmentSourceCamera => '摄像头';

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
  String get matureContentTitle => '成人内容';

  @override
  String get matureCommunityTitle => '成人社区';

  @override
  String get matureCategoryTitle => '成人类别';

  @override
  String get matureChannelTitle => '成人频道';

  @override
  String get communityContentWarningTitle => '社区内容警告';

  @override
  String get categoryContentWarningTitle => '类别内容警告';

  @override
  String get channelContentWarningTitle => '频道内容警告';

  @override
  String get defaultContentWarningBody => '此处包含敏感内容。';

  @override
  String get matureCommunityBody => '此社区标记为成人内容，可能包含不适合某些用户的内容。';

  @override
  String get matureCategoryBody => '此类别标记为成人内容，可能包含不适合某些用户的内容。';

  @override
  String get matureChannelBody => '此频道标记为成人内容，可能包含不适合某些用户的内容。';

  @override
  String get matureVoiceChannelBody => '此语音频道已标记为成人内容，可能含有不适合部分用户的内容。';

  @override
  String get matureLinkChannelBody => '此链接频道标记为成人内容，打开的内容可能不适合某些用户。';

  @override
  String get matureCommunityUnavailableBody => '你的账号无法访问此成人社区。';

  @override
  String get matureCategoryUnavailableBody => '你的账号无法访问此成人内容类别。';

  @override
  String get matureChannelUnavailableBody => '你的账号无法访问此成人频道。';

  @override
  String get matureContentProceedButton => '继续';

  @override
  String get matureContentUnderstandButton => '我知道了';

  @override
  String get matureContentOpenLinkButton => '打开链接';

  @override
  String get sensitiveContentSectionTitle => '敏感内容';

  @override
  String get sensitiveContentSectionDescription => '控制在不同情境下如何过滤成人或敏感媒体';

  @override
  String get sensitiveContentFriendDmLabel => '好友发来的私信';

  @override
  String get sensitiveContentNonFriendDmLabel => '其他人发来的私信';

  @override
  String get sensitiveContentGuildLabel => '社区频道中的消息';

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
    return '$date 到期';
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
  String get connectionUnverifiedLabel => '此连接尚未验证。';

  @override
  String get connectionAddTitle => '添加连接';

  @override
  String get connectionTypeLabel => '连接类型';

  @override
  String get connectionHandleLabel => '账号';

  @override
  String get connectionDomainLabel => '域名';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => '你已添加此连接。';

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
  String get connectionEditDescription => '选择谁可以在你的个人资料中看到此连接。';

  @override
  String get connectionVisibilityEveryone => '所有人';

  @override
  String get connectionVisibilityEveryoneDesc => '允许所有人查看你个人资料中的此连接';

  @override
  String get connectionVisibilityFriends => '好友';

  @override
  String get connectionVisibilityFriendsDesc => '允许好友查看此连接';

  @override
  String get connectionVisibilityCommunityMembers => '社区成员';

  @override
  String get connectionVisibilityCommunityMembersDesc => '允许你所在社区的成员查看此连接';

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
  String get lookAndFeelHdrFullName => '完整动态范围';

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
  String get lookAndFeelThemeDarkLegacy => '深色（旧版）主题';

  @override
  String get lookAndFeelThemeCoal => '煤炭主题';

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
  String get lookAndFeelChatWallpaperStarfieldLabel => '星空';

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
  String get lookAndFeelChannelTypingIndicatorsTitle => '频道列表中的正在输入状态';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      '选择在有人在频道中输入时，输入指示器如何在频道列表中显示。';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName => '正在输入提示 + 头像';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      '在频道列表中显示用户头像和正在输入状态';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => '仅显示正在输入提示';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      '只显示正在输入状态，不显示头像';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => '隐藏';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      '不在频道列表中显示正在输入状态';

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
  String get lookAndFeelNekoTitle => '其他';

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
  String get lookAndFeelRequireDoubleClickJoinLabel => '加入语音频道需双击';

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
  String get communityTemporarilyUnavailable => '社区暂时不可用';

  @override
  String get guildUnavailableDescription => '出错了，我们正在修复。';

  @override
  String get guildNotFoundTitle => '这不是你要找的社区。';

  @override
  String get guildNotFoundDescription => '你要找的社区可能已被删除，或者你没有访问权限。';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName 目前仅供 $productName 员工访问';
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
  String get lookAndFeelChannelListSectionDescription => '控制频道列表中已静音频道的未读标记行为。';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel => '在已静音的频道上显示未读标记';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      '启用后，静音频道左侧会显示一个淡化的未读指示器。提及消息无论此设置如何都会显示。';

  @override
  String get lookAndFeelActiveNowSectionTitle => '当前活跃';

  @override
  String get lookAndFeelActiveNowSectionDescription => '控制当前活跃在应用中的显示方式。';

  @override
  String get lookAndFeelShowActiveNowLabel => '在首页显示“当前活跃”';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      '在首页显示“当前活跃”，方便发现正在语音中的好友。你会看到预览、所在频道、已在频道中的人，以及快速加入的入口。';

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
  String get favoritesWelcomeTitle => '欢迎使用收藏夹';

  @override
  String get favoritesWelcomeDescription =>
      '你的专属空间，可快速访问你喜欢的频道、私信和群聊。点击任意频道上的星标即可将其添加到这里。';

  @override
  String get favoritesWelcomeTip => '不喜欢？随时关闭。';

  @override
  String get favoritesDisableButton => '停用收藏夹';

  @override
  String get favoritesAddedToast => '已添加到收藏夹';

  @override
  String get favoritesRemovedToast => '已从收藏夹中移除';

  @override
  String get favoritesHiddenToast => '星标频道已隐藏';

  @override
  String get favoritesMute => '将收藏夹静音';

  @override
  String get favoritesUnmute => '取消收藏夹静音';

  @override
  String get favoritesHeaderMenu => '星标频道菜单';

  @override
  String get favoritesCreateCategory => '创建类别';

  @override
  String get favoritesCategoryNameLabel => '类别名称';

  @override
  String get favoritesHideMutedChannels => '隐藏已静音频道';

  @override
  String get favoritesShowMutedChannels => '显示已静音频道';

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
  String get favoritesRemoveFromFavorites => '从收藏夹中移除';

  @override
  String get favoritesAddToFavorites => '添加到收藏夹';

  @override
  String get favoritesAddToSavedMedia => '添加到已保存媒体';

  @override
  String get favoritesRemoveFromSavedMedia => '从已保存媒体中移除';

  @override
  String get favoritesAddToUrlOnlyGifFavorites => '添加到仅限 URL 的 GIF 收藏夹';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites => '从仅限 URL 的 GIF 收藏夹中移除';

  @override
  String get savedMediaAddTitle => '添加到已保存媒体';

  @override
  String get savedMediaFormNameLabel => '名称';

  @override
  String get savedMediaFormNameHint => '我的超赞媒体';

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
  String get favoritesHideConfirmTitle => '隐藏收藏夹';

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
  String get messagesMediaDefaultHideMutedChannelsLabel => '默认隐藏已静音频道';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      '加入新社区时，自动在侧边栏隐藏静音频道';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle => '默认隐藏已静音频道？';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      '你新加入的社区将自动隐藏已静音频道。是否也将此设置应用于所有现有社区？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      '不再默认隐藏已静音频道？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      '你新加入的社区将不再自动隐藏已静音频道。是否也要在所有现有社区中显示已静音频道？';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction => '应用于所有社区';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction => '在所有社区中显示';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction => '仅限新社区';

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
  String get messagesMediaLinkPreviewsToggleLabel => '显示嵌入内容和网站链接预览';

  @override
  String get messagesMediaReactionsSectionTitle => '反应';

  @override
  String get messagesMediaReactionsSectionDescription => '配置消息的表情回应';

  @override
  String get messagesMediaReactionsToggleLabel => '在消息中显示表情回应';

  @override
  String get messagesMediaSpoilersSectionTitle => '剧透内容';

  @override
  String get messagesMediaSpoilersSectionDescription => '控制剧透内容的显示方式';

  @override
  String get messagesMediaSpoilersRadioLabel => '显示剧透内容';

  @override
  String get messagesMediaSpoilersOnClickName => '点击时';

  @override
  String get messagesMediaSpoilersOnClickDescription => '点击后显示剧透内容';

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
  String get messagesMediaGifsAutoSendLabel => '选中后自动发送 GIF';

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
  String get messagesMediaAutocompleteSavedMediaLabel => '在表情自动补全中显示已保存媒体';

  @override
  String get messagesMediaEditingSectionTitle => '编辑消息';

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
  String get accessibilityShowAltTextOnImagesLabel => '在图片上显示替代文本';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      '如果图片有替代文本，则在图片下方显示。';

  @override
  String get accessibilityDimStrikethroughTextLabel => '调暗删除线文本';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => '私信预览';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      '控制私信列表中显示消息预览的时间。';

  @override
  String get accessibilityDmMessagePreviewModeLabel => '私信预览模式';

  @override
  String get accessibilityDmMessagePreviewAllName => '所有消息';

  @override
  String get accessibilityDmMessagePreviewAllDescription => '显示所有私信会话的消息预览';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => '仅未读私信';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      '仅为有未读消息的私信显示消息预览';

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
      '让屏幕阅读器朗读当前打开频道中新收到的消息。通知提示音不受影响。';

  @override
  String get accessibilityTtsGroupTitle => '文本转语音';

  @override
  String get accessibilityTtsGroupDescription => '为语音文本选择语速。';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => '语音播放速度';

  @override
  String get accessibilityTtsPlaySampleLabel => '播放示例';

  @override
  String get accessibilityTtsSilenceSampleLabel => '停止播放示例';

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
  String get accessibilityShowContextMenuShortcutsLabel => '显示上下文菜单快捷键';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel => '发起通话前确认';

  @override
  String get accessibilityAnimationGroupTitle => '动画';

  @override
  String get accessibilityReducedMotionActiveNote =>
      '已开启减弱动态效果，因此内容动画默认暂停。您仍然可以重新开启任何动画以继续播放。';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => '播放动态表情';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => '自动播放 GIF';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return '当 $productName 处于焦点时自动播放 GIF';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion => '即使已开启减少动态效果，仍会播放。';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      '因“减少动态效果”而暂停。开启后可继续播放动态表情。';

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
      '鼠标悬停或互动时，贴纸会播放动画';

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
  String get accessibilitySyncReducedMotionWithSystemLabel => '与系统同步减少动态效果设置';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      '使用此设备的系统减弱动态效果偏好设置，或在下方自定义。';

  @override
  String get accessibilityReducedMotionOverrideLabel => '减少动态效果';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      '禁用动画和过渡效果。当前由你的系统设置控制。';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      '禁用应用内的动画和过渡效果。';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      '在“动画”选项卡中，你可以控制动态表情、GIF 和贴纸。';

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
      '博士，我来自未来。我乘坐你发明的时光机来到这里。现在，我需要你的帮助才能回到 1985 年。';

  @override
  String get accessibilityTtsUnsupportedDescription => '此设备无法使用语音合成。';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      '语音播放失败。请重试，或检查音频输出是否正常。';

  @override
  String get ttsSubstitutionUnknownUser => '未知用户';

  @override
  String get ttsSubstitutionUnknownRole => '未知身份组';

  @override
  String get ttsSubstitutionUnknownChannel => '未知频道';

  @override
  String get ttsSubstitutionCodeBlock => '代码块';

  @override
  String get ttsSubstitutionSpoiler => '剧透';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '表情 $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '斜杠 $commandName';
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
    return '$authorName 回复 $replyAuthorName：$formatted';
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
    return '$username 将一条消息置顶到此频道。';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username 将 $userName 加入了群聊。';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username 将某人加入了群聊。';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username 退出了群聊。';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username 将 $userName 移出了群聊。';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username 将某人移出了群聊。';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username 将频道名称更改为 $newName。';
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
  String get systemCallDurationFewSeconds => '几秒';

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
  String get voiceConnectionConfirmJustJoin => '直接加入（保留其他连接）';

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
  String get voiceChannelJoinConnect => '连接语音';

  @override
  String get voiceChannelNoConnectPermission => '你没有加入此语音频道的权限';

  @override
  String get voiceChannelE2eeEncrypted => '麦克风、摄像头和屏幕共享内容均已进行端到端加密。';

  @override
  String get voiceCallE2eeEncrypted => '麦克风、摄像头和屏幕共享内容均已进行端到端加密。';

  @override
  String get voiceChannelE2eeBroken => '由于此语音频道中有不受支持的参与者，端到端加密不可用。';

  @override
  String get voiceCallE2eeBroken => '由于此通话中有一位不受支持的参与者，端到端加密不可用。';

  @override
  String get voiceE2eeUpdateRequired => '加入此加密通话前必须更新此客户端。';

  @override
  String get voiceMicPublishFailedStayConnected => '无法启动您的麦克风。您仍在该通话中。';

  @override
  String get voiceChannelStatusConnecting => '连接中…';

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
  String get voiceParticipantTooltipDeafened => '已拒听';

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
  String get voiceChannelLeave => '退出';

  @override
  String get voiceControlMute => '静音';

  @override
  String get voiceControlUnmute => '取消静音';

  @override
  String get voiceControlDeafen => '拒听';

  @override
  String get voiceControlUndeafen => '取消拒听';

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
    return '延迟：${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => '正在测量延迟…';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return '跳转到 $channelSourceLabel';
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
  String get voiceAudioProcessing => '音频处理';

  @override
  String get voiceConnectionSessionSection => '会话';

  @override
  String get voiceConnectionDurationLabel => '时长';

  @override
  String get voiceConnectionParticipantsLabel => '参与者';

  @override
  String get voiceConnectionNetworkSection => '网络';

  @override
  String get voiceConnectionPingLabel => 'Ping';

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
  String get userAreaUnmuteMicrophone => '取消麦克风静音';

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
  String get voiceParticipantMenuCommunityDeafen => '社区拒听';

  @override
  String get voiceParticipantMenuUserVolume => '用户音量';

  @override
  String get voiceParticipantMenuStreamVolume => '直播音量';

  @override
  String get voiceParticipantMenuStopStreaming => '停止直播';

  @override
  String get voiceParticipantModerationFailed => '无法更新该成员。请重试。';

  @override
  String get voiceControlChat => '聊天';

  @override
  String get voiceCallViewModeLabel => '查看';

  @override
  String get voiceCallViewModeGrid => '网格';

  @override
  String get voiceCallViewModeFocus => '焦点';

  @override
  String get voicePanelSettingsSectionTitle => '语音设置';

  @override
  String get voicePanelUseEarpieceLabel => '使用听筒';

  @override
  String get voiceOutputRouteSpeaker => '扬声器';

  @override
  String get voiceOutputRouteEarpiece => '听筒';

  @override
  String get voiceOutputRouteHeadset => '耳机';

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
  String get dmVoiceStripStatusConnecting => '连接中…';

  @override
  String get dmVoiceStripStatusInCall => '通话中';

  @override
  String get dmVoiceEmbeddedFallbackTitle => '语音通话';

  @override
  String get dmVoiceCallBarConnecting => '连接中…';

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
  String get notificationsFilterUnreads => '未读消息';

  @override
  String get notificationsFilterMentions => '提及';

  @override
  String get notificationsBookmarksTooltip => '书签';

  @override
  String get notificationsMentionFilterTooltip => '筛选提及';

  @override
  String get notificationsMentionFiltersTitle => '提及过滤';

  @override
  String get notificationsMentionIncludeEveryone => '包含 @everyone 和 @here 提及';

  @override
  String get notificationsMentionIncludeRoles => '包含角色提及';

  @override
  String get notificationsMentionIncludeGuilds => '包含所有社区提及';

  @override
  String get notificationsNoUnreadTitle => '没有未读消息';

  @override
  String get notificationsNoUnreadBody => '你已全部读完。';

  @override
  String get notificationsNoMentionsTitle => '暂无最近提及';

  @override
  String get notificationsNoMentionsBody => '所有提及你的 @提及将在 7 天后出现在此处。';

  @override
  String get notificationsMentionsEndTitle => '已到底部';

  @override
  String get notificationsMentionsEndBody => '你已查看所有近期提及。别担心，很快就会有更多提及出现在这里。';

  @override
  String get notificationsJump => '跳转';

  @override
  String get notificationsRemoveMentionTooltip => '移除提及';

  @override
  String get notificationsViewAllUnread => '查看所有未读';

  @override
  String get notificationsMarkAsRead => '标为已读';

  @override
  String get notificationsExpand => '展开';

  @override
  String get notificationsCollapse => '收起';

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
  String get chatSendFailureUnclaimedDm => '你的消息未能送达。你需要先认领账号才能发送私信。';

  @override
  String get chatSendFailureUnclaimedGeneral => '你的消息未能送达。你需要先认领账号才能发送消息。';

  @override
  String get chatSendFailureContentBlocked =>
      '你的消息未能送达，因为它被我们的安全系统标记了。如果你认为这是误判，请联系支持团队。';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      '你的消息未能送达，因为它被我们的安全系统标记了。如果你认为这是误判，请联系此实例的管理员。';

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
  String get privacyDashboardProfilePrivacyTitle => '谁可以查看你的完整个人资料';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities => '好友和所有社区';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      '你的完整个人资料对好友和所有社区的成员可见';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities => '仅限好友和小社区';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      '你的完整个人资料对好友以及成员数不超过 200 人的社区成员可见';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => '仅限好友';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc => '你的完整个人资料仅对好友可见';

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
  String get privacyDashboardDirectMessagesMembers => '允许社区成员发送私信';

  @override
  String get privacyDashboardDirectMessagesMembersDesc => '允许你所在社群的成员向你发送私信';

  @override
  String get privacyDashboardDirectMessagesBots => '允许社区机器人发送私信';

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
  String get privacyDashboardAllowedCallers => '允许的来电者';

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
  String get privacyDashboardRingBehavior => '来电行为';

  @override
  String get privacyDashboardSilentCalls => '所有人来电静音';

  @override
  String get privacyDashboardSilentCallsDesc =>
      '所有来电将静默通知，而非响铃。默认情况下，非好友的来电始终静默。';

  @override
  String get privacyDashboardGroupDmTitle => '谁可以将你加入群聊';

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
  String get privacyDashboardVoiceActivityTitle => '“当前活跃”中的语音活动';

  @override
  String get privacyDashboardShareVoiceActivity => '与好友分享你的语音活动';

  @override
  String get privacyDashboardVoiceActivityEnableTitle => '与所有好友分享语音活动？';

  @override
  String get privacyDashboardVoiceActivityDisableTitle => '不再向所有好友分享语音活动？';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      '你即将开始与所有好友（包括未来的好友）分享你的语音活动。此操作会向他们发送更新，且 24 小时内无法再次更改。';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      '你即将停止与所有好友（包括未来的好友）分享你的语音活动。此操作会向他们发送更新，且 24 小时内无法再次更改。';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm => '是的，与所有好友分享';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => '是的，停止分享';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return '$time 后可再次使用';
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
      '永久删除你在私信、群聊和社区中发送的消息。此操作会在后台运行，完成后你会收到一条私信通知。';

  @override
  String get privacyDashboardDeleteMyMessages => '删除我的消息';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle => '允许社区成员发送私信？';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle => '要屏蔽社区成员的私信吗？';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle => '允许机器人给你发私信吗？';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle => '要屏蔽机器人发来的私信吗？';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc => '要同时允许现有社区成员向你发送私信吗？';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc => '要同时屏蔽现有社区成员的私信吗？';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc => '要同时允许现有社区中的机器人向你发送私信吗？';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc => '要同时屏蔽来自现有社群的机器人吗？';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      '你也可以通过长按社群名称并选择“隐私设置”来为每个社群更改此设置。';

  @override
  String get privacyDashboardDmConfirmAllowAll => '允许所有社区';

  @override
  String get privacyDashboardDmConfirmBlockAll => '在所有社区中屏蔽';

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
      '我们会尽快处理。存档准备就绪后，你会收到一封邮件。';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      '我们会尽快处理。完成后，你会收到我们的私信。';

  @override
  String get privacyDashboardDataRequestScopeTitle => '包含哪些内容';

  @override
  String get privacyDashboardDataRequestExportEverything => '所有内容';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      '导出你发送过的所有消息，以及你的全部账号设置、成员身份和元数据。';

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
  String get privacyDashboardDataRequestDeleteInaccessible => '仅限我已无法访问的地方';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      '仅删除你已离开或已被移出的社区和群聊中的消息。';

  @override
  String get privacyDashboardDataRequestKindsTitle => '哪些对话';

  @override
  String get privacyDashboardDataRequestKindsBody => '选择要包含的对话类型。';

  @override
  String get privacyDashboardDataRequestKindDms => '已打开的私信';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => '已关闭的私信';

  @override
  String get privacyDashboardDataRequestKindGroupDms => '群聊';

  @override
  String get privacyDashboardDataRequestKindCommunities => '社区';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => '哪些社区';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => '社区筛选';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude => '排除所选';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => '仅包含所选';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty => '你目前不在任何社区中。';

  @override
  String get privacyDashboardDataRequestWhenTitle => '时间范围';

  @override
  String get privacyDashboardDataRequestDateMode => '时间范围';

  @override
  String get privacyDashboardDataRequestAllTime => '全部时间';

  @override
  String get privacyDashboardDataRequestCustomRange => '自定义范围';

  @override
  String get privacyDashboardDataRequestStartDate => '开始日期';

  @override
  String get privacyDashboardDataRequestEndDate => '结束日期';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      '将任一字段留空，该时间范围的对应一端就不受限制。';

  @override
  String get privacyDashboardDataRequestNeedInclusion => '请至少选择一种对话类型。';

  @override
  String get privacyDashboardDataRequestDateRangeError => '开始日期必须早于结束日期。';

  @override
  String get privacyDashboardDataRequestConfirmTitle => '查看并确认';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      '我们将创建包含你发送过的所有消息的可下载存档，并在准备就绪后通过邮件通知你。该邮件中的下载链接将在 7 天后过期。';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      '我们将根据以下筛选条件生成可下载的存档，并在准备就绪后通过邮件通知你。该邮件中的下载链接将在 7 天后过期。';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      '永久删除符合以下筛选条件的消息。此操作无法撤销。';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      '一旦开始就无法撤销。完成后我们会私信通知你。';

  @override
  String get privacyDashboardDataRequestRequestExport => '申请导出';

  @override
  String get privacyDashboardDataRequestDeleteMessages => '删除消息';

  @override
  String get privacyDashboardDataRequestSummaryScope => '范围';

  @override
  String get privacyDashboardDataRequestSummaryConversations => '对话';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => '社区';

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
    return '截止 $end';
  }

  @override
  String privacyDashboardDataRequestSummaryBetween(String start, String end) {
    return '$start 至 $end';
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
  String get privacyDashboardDataRequestSummaryDmsOpen => '已打开的私信';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed => '已关闭的私信';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth => '私信（已打开和已关闭）';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => '群聊';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded => '社区';

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
  String get doubleTapReactionHint => '双击消息即可回应';

  @override
  String get doubleTapReactionEdit => '编辑';

  @override
  String get doubleTapReactionEditTitle => '编辑默认表情';

  @override
  String get doubleTapReactionEditSubtitle => '选择双击表情符号';

  @override
  String get chatMessageEdit => '编辑消息';

  @override
  String get chatMessageReply => '回复';

  @override
  String get notificationReplyPlaceholder => '消息';

  @override
  String get notificationReplyFailed => '无法发送回复';

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
  String get forwardFailed => '消息转发失败';

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
  String get chatMessageStopSpeaking => '停止朗读';

  @override
  String get chatMessagePin => '置顶消息';

  @override
  String get chatMessageUnpin => '取消置顶消息';

  @override
  String get chatMessageUnpinIt => '取消置顶';

  @override
  String get chatMessageBookmark => '为消息添加书签';

  @override
  String get chatMessageRemoveBookmark => '移除书签';

  @override
  String get chatMessageMarkAsUnread => '标为未读';

  @override
  String get chatMessageCopyMessageLink => '复制消息链接';

  @override
  String get chatMessageOpenLink => '打开链接';

  @override
  String get chatMessageCopyLink => '复制链接';

  @override
  String get chatMessageCopyMessageId => '复制消息 ID';

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
  String get chatReactionsSheetEmpty => '还没有人使用此反应。';

  @override
  String get chatReactionAddFailed => '添加反应失败';

  @override
  String get chatReactionRemoveFailed => '移除反应失败';

  @override
  String get chatMessageReport => '举报消息';

  @override
  String get reportFlowTitleMessage => '举报消息';

  @override
  String get reportFlowTitleUserProfile => '举报个人资料';

  @override
  String get reportFlowSummaryTitle => '检查你的举报';

  @override
  String get reportFlowSummarySubtitle => '发送前请仔细检查。';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return '仅举报你真心认为违反规则的内容。滥用举报功能将违反我们的$guidelines。';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => '社区准则';

  @override
  String get reportFlowDisclaimerNoLink => '仅举报你真心认为违反规则的内容，请勿重复发送相同的举报。';

  @override
  String get reportFlowSelectedMessage => '你要举报的消息';

  @override
  String get reportFlowSelectedUser => '你正在举报的个人资料';

  @override
  String get reportFlowReportCategory => '你的回答';

  @override
  String get reportFlowSubmit => '发送举报';

  @override
  String get reportFlowBack => '返回';

  @override
  String get reportFlowNext => '下一步';

  @override
  String get reportFlowDone => '完成';

  @override
  String get reportFlowThankYouTitle => '举报已发送';

  @override
  String get reportFlowThankYouNoReportTitle => '感谢你的提醒';

  @override
  String reportFlowThankYouBody(String productName) {
    return '$productName 安全团队将审核你的举报。我们不会透露举报人是你。';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      '感谢你告知我们。此内容本身并未违反我们的规则，因此我们没有发送举报。如果内容针对某人或包含侮辱性言辞，请再次举报并选择“辱骂性或有害的内容”。';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      '感谢你告知我们。此内容本身并未违反我们的规则，因此我们没有发送举报。';

  @override
  String get reportFlowMoreYouCanDo => '你的选项';

  @override
  String reportFlowBlockName(String name) {
    return '屏蔽 $name';
  }

  @override
  String get reportFlowBlockDescription => '隐藏对方的消息，并阻止对方给你发私信';

  @override
  String get reportFlowBlockButton => '屏蔽';

  @override
  String get reportFlowBlockedButton => '已屏蔽';

  @override
  String get reportFlowUrgentBanner => '如果有人正处于紧急危险中，请先联系当地紧急服务机构。';

  @override
  String get reportFlowLoadFailed => '无法加载举报表单。';

  @override
  String get reportFlowTryAgain => '重试';

  @override
  String get reportFlowOutdated => '举报表单已更改。请重新开始。';

  @override
  String get reportFlowAlreadyReported => '你已举报过此消息。';

  @override
  String get reportFlowAlreadyReportedProfile => '你今天已经举报过此个人资料了。';

  @override
  String get reportFlowRateLimited => '你发送举报的速度过快。请稍后再试。';

  @override
  String get reportFlowSubmitFailed => '你的举报未能发送。请重试。';

  @override
  String get reportFlowAccountSetupRequired => '请先认领账号并验证邮箱，然后才能提交举报。';

  @override
  String get chatMessageSuppressEmbeds => '隐藏嵌入内容';

  @override
  String get chatMessageUnsuppressEmbeds => '重新显示嵌入内容';

  @override
  String get chatMessageDelete => '删除消息';

  @override
  String get chatMessageDeleteConfirmTitle => '删除消息';

  @override
  String get chatMessageDeleteConfirmDescription => '你确定要删除此消息吗？';

  @override
  String get chatMessageDeleteAttachment => '删除附件';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText => '编辑替代文本';

  @override
  String get chatMessageMore => '更多';

  @override
  String get chatEditingMessage => '正在编辑消息';

  @override
  String get chatReplyOriginalDeleted => '原消息已删除';

  @override
  String get chatReplyOriginalFailedToLoad => '原消息加载失败';

  @override
  String get chatReplyAttachedMedia => '消息包含媒体附件';

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
  String get chatReplyMentionOverrideTitle => '要覆盖提及偏好吗？';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname 希望在回复中被 @ 提及。仍要发送不带提及的回复吗？';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname 希望回复中不带 @ 提及。仍要发送带提及的回复吗？';
  }

  @override
  String get chatReplyMentionIgnorePreference => '忽略偏好设置';

  @override
  String get chatReplyMentionDisableTooltip => '点击即可停止提醒你回复的用户。';

  @override
  String get chatReplyMentionEnableTooltip => '点击即可提醒你回复的用户。';

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
  String get chatEditNoChanges => '没有要保存的更改';

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
  String get chatImageCouldNotLoad => '无法加载此图片。';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      '通知拥有此身份组且有权限查看此频道的用户。';

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
  String get composerAutocompleteRolesHeading => '身份组';

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
  String get composerCommandMeDescription => '发送操作消息（斜体显示）。';

  @override
  String get composerCommandSpoilerDescription => '发送剧透消息（用剧透标签包裹）。';

  @override
  String get composerCommandTtsDescription => '发送文本转语音消息。';

  @override
  String get composerCommandNickDescription => '修改你在本社区的昵称。';

  @override
  String get composerCommandKickDescription => '将成员踢出此社区。';

  @override
  String get composerCommandBanDescription => '在此社区中封禁成员。';

  @override
  String get composerCommandMsgDescription => '给用户发送私信。';

  @override
  String get composerCommandSavedDescription => '发送已保存媒体项目。';

  @override
  String get composerCommandStickerDescription => '发送贴纸。';

  @override
  String get composerCommandGifDescription => '搜索并发送 GIF。';

  @override
  String get composerCommandMemberOption => '要操作的成员。';

  @override
  String get composerCommandReasonOption => '原因（可选）。';

  @override
  String get composerCommandMessageOption => '要发送的消息。';

  @override
  String get composerCommandQueryOption => '要搜索的内容。';

  @override
  String get composerCommandNicknameOption => '你的新昵称，留空则重置。';

  @override
  String get composerCommandDeleteMessagesOption => '要删除该成员近期多少消息记录。';

  @override
  String get composerCommandDeleteMessagesNone => '不删除任何消息';

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
    return '你在此社区中的昵称已从 **$previousNickname** 改为 **$newNickname**。';
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
  String get addGuildJoinDescription => '输入邀请链接，加入社区。';

  @override
  String get addGuildInviteLinkLabel => '邀请链接';

  @override
  String get addGuildJoinSubmit => '加入社区';

  @override
  String get addGuildInviteInvalid => '此邀请无效或已过期。';

  @override
  String get addGuildJoinFailed => '无法加入社区。请重试。';

  @override
  String get addGuildCreateTitle => '创建社区';

  @override
  String get addGuildCreateDescription => '创建社区，和好友一起畅聊。';

  @override
  String get addGuildCreateNameLabel => '社区名称';

  @override
  String get addGuildCreateSubmit => '创建社区';

  @override
  String get addGuildCreateFailed => '无法创建社区。请重试。';

  @override
  String get addGuildCreateClaimTitle => '认领你的账号';

  @override
  String get addGuildCreateClaimDescription => '你需要先认领账号，才能创建社区。';

  @override
  String get addGuildCreateVerifyTitle => '验证邮箱';

  @override
  String get addGuildCreateVerifyDescription => '你需要先验证邮箱地址，才能创建社区。';

  @override
  String get addGuildCreateAnimatedIconUnsupported => '创建社区时不支持使用动态图标。请使用静态图片。';

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
  String get addGuildCreateIconLabel => '社区图标';

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
  String get chatMessagePinConfirm => '置顶';

  @override
  String get chatMessagePinConfirmDescription => '将这条消息置顶到频道，让大家都能看到。';

  @override
  String get chatMessageUnpinConfirmTitle => '取消置顶消息';

  @override
  String get chatMessageUnpinConfirmDescription => '要把这条置顶消息送回过去吗？';

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
  String get channelPinsEmptyTitle => '暂无置顶消息';

  @override
  String get channelPinsEmptyDescription => '已置顶消息会显示在此处。';

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
  String get channelDetailsInvitePeople => '邀请成员';

  @override
  String get channelDetailsCopyLink => '复制链接';

  @override
  String get channelMenuCopyChannelLink => '复制频道链接';

  @override
  String get channelMenuCopyRedirectLink => '复制重定向链接';

  @override
  String get channelDetailsAddFriendsToGroup => '添加好友到群聊';

  @override
  String get channelDetailsGroupInvites => '群邀请';

  @override
  String get channelDetailsEditChannel => '编辑频道';

  @override
  String get channelDetailsDeleteChannel => '删除频道';

  @override
  String get channelSettingsCategorySettingsTitle => '类别设置';

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
  String get channelSettingsMyCategory => '我的类别';

  @override
  String get categoryExpandCategory => '展开类别';

  @override
  String get categoryCollapseCategory => '收起类别';

  @override
  String get categoryExpandAllCategories => '展开所有类别';

  @override
  String get categoryCollapseAllCategories => '收起所有类别';

  @override
  String get categoryMuteCategory => '将类别静音';

  @override
  String get categoryUnmuteCategory => '取消类别静音';

  @override
  String get categoryCopyCategoryId => '复制类别 ID';

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
  String get channelSettingsTopicPlaceholder => '为此频道添加话题';

  @override
  String get channelSettingsInsertEmoji => '插入表情';

  @override
  String get channelSettingsTopicTooLongTitle => '频道话题过长。';

  @override
  String get channelSettingsTopicTooLongMessage => '请缩短话题后重试。';

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
    return '$kilobits kbps';
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
  String get channelSettingsMatureContentOn => '开';

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
  String get channelSettingsMatureContentCommunityScope => '社区';

  @override
  String get channelSettingsContentWarningToggle => '在此频道中显示内容警告';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      '开启频道前会显示一个同意提示。';

  @override
  String get channelSettingsContentWarningText => '自定义警告文本';

  @override
  String get channelSettingsContentWarningDefault => '此处包含敏感内容。';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return '你需要“$manageChannelsPermissionLabel”权限才能编辑这些权限。';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return '你需要“$manageRolesPermissionLabel”权限才能编辑这些权限。';
  }

  @override
  String get channelSettingsUnknownRole => '未知身份组';

  @override
  String get channelSettingsUnknownUser => '未知用户';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => '访问权限覆盖';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return '编辑 $name 的访问权限';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => '返回权限覆盖';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess => '配置此频道的基础访问权限';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides => '配置此身份组的覆盖权限';

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
  String get channelSettingsPermissionsSearchRolesOrMembers => '搜索身份组或成员…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => '身份组与成员';

  @override
  String get channelSettingsDeleteInvite => '删除邀请';

  @override
  String get channelSettingsDeleteInviteConfirm => '删除此邀请？此操作无法撤销。';

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
  String get channelSettingsWebhooksUnsupported => '此频道不支持 Webhook。';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return '您需要“$permission”权限才能查看和编辑此频道的Webhook。';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => '加载 Webhook 失败';

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
  String get channelSettingsWebhooksCopyUrl => '复制 Webhook 链接';

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
  String get channelMenuResetMatureContentAgreeState => '重置成人内容确认状态';

  @override
  String get channelMenuDeleteMyMessagesTitle => '删除你在此频道中的消息？';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      '此操作将永久删除你在此频道中发送过的所有消息，且无法撤销。';

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
  String get memberListPermissionDeniedTitle => '你无法查看成员';

  @override
  String get memberListPermissionDeniedBody => '你无法查看此社区中此频道的成员';

  @override
  String get memberListUnavailableTitle => '成员列表不可用';

  @override
  String get memberListUnavailableBody => '此社区的成员列表暂时不可用';

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
  String get channelDetailsSearchFilterFrom => '发送者';

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
  String get channelDetailsSearchClearFilter => '清除';

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
  String get channelHeaderSearchFiltersTitle => '搜索筛选条件';

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
  String get channelHeaderSearchClearHistory => '清除';

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
  String get channelDetailsSearchSortBy => '结果排序方式';

  @override
  String get channelDetailsSearchIn => '搜索范围';

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
  String get channelDetailsHasFilterPrompt => '显示包含以下内容的消息：';

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
  String get channelDetailsSearchScopeCurrentDm => '当前私信';

  @override
  String get channelDetailsSearchScopeAllCommunities => '所有社区';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => '仅私信';

  @override
  String get channelDetailsSearchScopeAllDms => '所有私信';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => '仅已打开的私信';

  @override
  String get channelDetailsSearchScopeOpenDms => '已打开的私信';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities => '所有私信 + 社区';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities => '已打开的私信 + 社区';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      '仅在当前社区中搜索';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription => '仅在当前私信中搜索';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      '在你当前加入的所有社群中';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      '仅在你参与过的所有私信中';

  @override
  String get channelDetailsSearchScopeAllDmsDescription => '在你参与过的所有私信中';

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
  String get channelDetailsSearchSortNewest => '最新优先';

  @override
  String get channelDetailsSearchSortOldest => '最早优先';

  @override
  String get channelDetailsSearchSortRelevance => '最相关';

  @override
  String get channelDetailsSearchSortNewestDescription => '优先显示最新消息';

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
  String get channelDetailsSearchContentImageDescription => '仅限已上传的图片文件';

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
  String get personalNotesSubtitle => '你的私密空间，用来记录想法和提醒';

  @override
  String groupDmWelcome(String displayName) {
    return '欢迎来到 $displayName。添加好友，让群聊活跃起来。';
  }

  @override
  String get groupDmWelcomeEditGroup => '编辑群聊';

  @override
  String get groupDmWelcomeAddFriends => '添加好友到群聊';

  @override
  String get dmGroupInvites => '邀请';

  @override
  String get groupDmEditTitle => '编辑群聊';

  @override
  String get groupDmEditDetailsTooltip => '编辑群聊详情';

  @override
  String get groupDmGroupName => '群名称';

  @override
  String get groupDmMyGroup => '我的群聊';

  @override
  String get groupDmGroupNameMaxLength => '群名称不能超过 100 个字符';

  @override
  String get groupDmGroupIcon => '群图标';

  @override
  String get groupDmUploadIcon => '上传图标';

  @override
  String get groupDmChangeIcon => '更改图标';

  @override
  String get groupDmRemoveIcon => '移除图标';

  @override
  String get groupDmUpdated => '群聊已更新';

  @override
  String get groupDmUpdateFailed => '无法更新群组。请重试。';

  @override
  String get groupDmAnimatedIconNotSupported => '不支持使用动态图标。请使用静态图片。';

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
  String get groupDmInviteExpires24Hours => '你的邀请将在 24 小时后失效';

  @override
  String get groupDmAddFriendFailed => '无法将该好友添加到群聊。请重试。';

  @override
  String get groupDmAddFailed => '无法添加到群聊';

  @override
  String get groupDmGroupFull => '群聊已满。请先移除一些成员，再添加其他人。';

  @override
  String get groupDmRateLimited => '你的操作过于频繁。请稍候片刻，然后重试。';

  @override
  String get groupDmCreateInviteFailed => '无法创建邀请链接';

  @override
  String get groupDmCreateInviteFailedBody => '无法生成邀请链接。请重试。';

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
  String get groupDmInvitesRevokeConfirm => '撤销此邀请？此操作无法撤销。';

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
    return '给 #$channelName 发消息';
  }

  @override
  String dmComposerHint(String recipientName) {
    return '给 @$recipientName 发消息';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return '给 $groupName 发消息';
  }

  @override
  String get groupDmComposerHint => '消息组';

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
  String get personalNotesPrivateSpace => '你的私密空间';

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
  String get purgePersonalNotesAlreadyEmpty => '个人笔记已经是空的';

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
  String get premiumPlutoniumTagline => '解锁更高上限和专属功能，同时支持独立的通讯平台。';

  @override
  String get premiumPurchaseMode => '购买方式';

  @override
  String get premiumForMe => '为自己';

  @override
  String get premiumAsAGift => '作为礼物';

  @override
  String get premiumMonthly => '每月';

  @override
  String get premiumYearly => '每年';

  @override
  String get premiumPerMonth => '每月';

  @override
  String get premiumPerYear => '每年';

  @override
  String get premiumOneTimePurchase => '一次性购买';

  @override
  String get premiumSave17 => '立省 17%';

  @override
  String get premiumUpgradeNow => '立即升级';

  @override
  String get premiumBuyGift => '购买礼物';

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
      '你可以保留福利直到下一个续订日期，之后有 3 天的宽限期来重新订阅并保留你的订阅历史记录。';

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
  String get premiumSubscriptionCanceling => '即将取消';

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
  String get premiumGiftGraceEnded => '您的赠送时间已结束。订阅即可继续使用 Plutonium。';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      '您将立即付费。剩余的赠送时长将添加到付费期之后，因此不会丢失。';

  @override
  String get premiumComparisonFeatureColumn => '功能';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return '购买即表示你已同意我们的$terms和$privacy。';
  }

  @override
  String get premiumDisclaimerRefund =>
      '付款后 3 天内可自助退款，每 30 天限一次。为订阅退款会同时取消该订阅。欧盟/欧洲经济区买家在结账时放弃 14 天撤回权，以便立即使用内容。请使用应用内的退款按钮，不要申请拒付。拒付可能会永久限制你的账号。Stripe 会安全处理付款。我们绝不会看到你的完整卡号。';

  @override
  String get premiumTermsOfService => '服务条款';

  @override
  String get premiumPrivacyPolicy => '隐私政策';

  @override
  String get premiumCheckoutStartFailedTitle => '无法开始结账';

  @override
  String get premiumCheckoutStartFailedBody => '启动结账时出错了。请稍后重试。';

  @override
  String get premiumPlanUnavailable => '此套餐不可用。请联系支持团队。';

  @override
  String get premiumPlanUnavailableSelfHosted => '此套餐不可用。请联系此实例的管理员。';

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
  String get premiumCustomerPortalOpenFailedBody => '打开账单门户时出错了。请稍后重试。';

  @override
  String get premiumAlreadyVisionaryTitle => '你已经是 Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary 已包含永久访问权限，因此无需周期性订阅。你仍然可以为他人购买礼物。';

  @override
  String get premiumExistingSubscriptionTitle => '订阅已存在';

  @override
  String get premiumExistingSubscriptionBody =>
      '我们已在此账号下找到一个现有的 Fluxer Plutonium 订阅。请在安全账单门户中管理它，以更新付款详情或查看续订状态。如果您刚付款，请等待一分钟后重新打开此页面。';

  @override
  String get premiumPurchasesDisabledTitle => '无法购买';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return '此账号已禁用购买功能。如果此情况不正确，请联系 $supportEmail。';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      '此账号已禁用购买功能。如果此情况不正确，请联系此实例的管理员。';

  @override
  String get premiumClaimAccountToPurchase => '认领您的账号以购买 Fluxer Plutonium。';

  @override
  String get premiumVerifyEmailToPurchase =>
      '您需要先验证您的电子邮件，然后才能购买 Fluxer Plutonium。';

  @override
  String get premiumPerkCustomUsernameTag => '自定义用户名标签';

  @override
  String get premiumPerkPerCommunityProfiles => '社区专属个人资料';

  @override
  String get premiumPerkMessageScheduling => '消息定时发送';

  @override
  String get premiumPerkProfileBadge => '个人资料徽章';

  @override
  String get premiumPerkCustomVideoBackgrounds => '自定义视频背景';

  @override
  String get premiumPerkEntranceSounds => '入场音效';

  @override
  String get premiumPerkCommunities => '社区';

  @override
  String get premiumPerkMessageCharacterLimit => '消息字数限制';

  @override
  String get premiumPerkBookmarkedMessages => '已添加书签的消息';

  @override
  String get premiumPerkFileUploadSize => '文件上传大小';

  @override
  String get premiumPerkEmojiStickerPacks => '表情符号和贴纸包';

  @override
  String get premiumPerkSavedMedia => '已保存媒体';

  @override
  String get premiumPerkUseAnimatedEmojis => '使用动态表情';

  @override
  String get premiumPerkGlobalEmojiStickerAccess => '跨社区使用表情和贴纸';

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
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly 或 $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/月';

  @override
  String get storePlutoniumYearSuffix => '/年';

  @override
  String get storePlutoniumPriceOr => '或';

  @override
  String get storePlutoniumEmojiTitle => '你的表情，随处可见';

  @override
  String get storePlutoniumEmojiBody => '将你社区的自定义表情和贴纸带到你所在的每个聊天和社区中。';

  @override
  String get storePlutoniumProfileTitle => '一个脱颖而出的个人资料';

  @override
  String get storePlutoniumProfileBody =>
      '获取动态头像和横幅、订阅者徽章、你想要的四位用户名标签*，以及每个社区的独立个人资料。';

  @override
  String get storePlutoniumFilesTitle => '发送最大 500 MB 的文件';

  @override
  String get storePlutoniumFilesBody => '分享完整视频和大型文件，无需压缩。免费帐户最多可发送 25 MB。';

  @override
  String get storePlutoniumCompareTitle => '比较免费版和 Plutonium';

  @override
  String get storePlutoniumCompareMobileNote => '并非所有功能都可在移动应用中使用。部分功能仅在桌面端可用。';

  @override
  String get storePlutoniumNotAvailable => '不可用';

  @override
  String get storePlutoniumAvailable => '可用';

  @override
  String get storePlutoniumCompareTag => '选择用户名后的 4 位数字*';

  @override
  String get storePlutoniumCompareProfile => '每个社区的独立个人资料';

  @override
  String get storePlutoniumCompareBadge => '个人资料上的订阅者徽章';

  @override
  String get storePlutoniumCompareBackgrounds => '可保存的视频通话背景';

  @override
  String get storePlutoniumCompareCommunities => '你可以加入的社区';

  @override
  String get storePlutoniumCompareCharacters => '单条消息的字符数';

  @override
  String get storePlutoniumCompareBookmarks => '可收藏的消息';

  @override
  String get storePlutoniumCompareUpload => '可上传的最大文件';

  @override
  String get storePlutoniumCompareSavedMedia => '可保存供以后使用的媒体内容';

  @override
  String get storePlutoniumCompareAnimatedEmoji => '在消息中使用动态表情';

  @override
  String get storePlutoniumCompareCustomEmoji => '在任何社区中使用自定义表情符号和贴纸';

  @override
  String get storePlutoniumCompareVideo => '视频通话和屏幕共享质量';

  @override
  String get storePlutoniumCompareAvatar => '动态头像和个人资料横幅';

  @override
  String get storePlutoniumCompareEarlyAccess => '抢先体验新功能';

  @override
  String get storePlutoniumCompareThemes => '应用自定义主题';

  @override
  String get storePlutoniumVideoFree => '最高 720p，30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => '最高 4K，60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      '你只能选择其他同名用户尚未使用的标签。用户名不区分大小写，因此 Mina#4821 和 mina#4821 视为相同。#0000 标签专供 Fluxer Visionary 成员使用。';

  @override
  String get storePlutoniumLearnVisionary => '了解 Visionary 详情。';

  @override
  String get storePlutoniumDonatePrompt => '只想支持 Fluxer 的开源开发？ ';

  @override
  String get storePlutoniumDonateLink => '改为捐赠。';

  @override
  String get storePlutoniumHighlightsLead => '订阅可为 Fluxer 提供资金并解锁';

  @override
  String get storePlutoniumHighlightEmoji => '在任何聊天中使用自定义表情符号和贴纸';

  @override
  String get storePlutoniumHighlightProfile => '动态个人资料、徽章和自定义 4 位数字';

  @override
  String get storePlutoniumHighlightFiles => '上传文件大小上限 500 MB';

  @override
  String get storePlutoniumHighlightMessages => '发送最长 4,000 个字符的消息';

  @override
  String get storePlutoniumHighlightCommunityProfile => '每个社区的独立个人资料';

  @override
  String get storePlutoniumHighlightsMore => '以及更多';

  @override
  String get storePlutoniumRenewsThroughPlay => '通过 Google Play 自动续订，直到你取消。';

  @override
  String get storePlutoniumRenewsThroughAppStore => '通过 App Store 自动续订，直到你取消。';

  @override
  String get storePlutoniumAlreadySubscribed => '你已拥有 Fluxer Plutonium 订阅。';

  @override
  String storePlutoniumSavePercent(int percent) {
    return '节省 $percent%';
  }

  @override
  String get storePlutoniumWaiting => '已收到购买。Plutonium 激活后将在此处显示。';

  @override
  String get storePlutoniumUnavailable => '此设备暂不支持应用内订阅。';

  @override
  String get storePlutoniumVisionaryStatus => 'Visionary 已包含永久访问权限，因此无需重复订阅。';

  @override
  String get userSettingsNavPrivacyDashboard => '隐私仪表盘';

  @override
  String get userSettingsNavAuthorizedApps => '已授权应用';

  @override
  String get userSettingsNavBlockedUsers => '已屏蔽用户';

  @override
  String get userSettingsNavLinkedDevices => '已关联设备';

  @override
  String get userSettingsNavConnections => '连接';

  @override
  String get userSettingsNavLookAndFeel => '外观';

  @override
  String get userSettingsNavAccessibility => '无障碍';

  @override
  String get userSettingsNavChat => '聊天';

  @override
  String get userSettingsNavAudioAndVideo => '音频和视频';

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
  String get audioAndVideoFocusedVoiceLabel => '人声优化';

  @override
  String get audioAndVideoFocusedVoiceDescription => '推荐。优化麦克风，让语音更清晰。';

  @override
  String get audioAndVideoDirectInputLabel => '直接输入';

  @override
  String get audioAndVideoDirectInputDescription =>
      '直接发送你的音频，不做任何处理。如果你正在使用外部音频软件，推荐此选项。';

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
  String get audioAndVideoEchoCancellationLabel => '回声消除';

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
  String get audioAndVideoCameraQualitySectionTitle => '摄像头画质';

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
    return '$productName 需要摄像头权限才能列出你的设备。';
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
    return '收到消息时通知你。你可能需要在设备设置中允许 $productName 发送通知。如需按频道或按社区单独设置，请从社区菜单中打开通知设置。';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel => '开启桌面通知';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      '使用系统通知中心。如需按频道或按社区设置，请右键点击社区图标，然后打开通知设置。';

  @override
  String get notificationsEnableBrowserNotificationsLabel => '开启浏览器通知';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      '收到消息时通知你。你可能需要在浏览器设置中允许通知。如需按频道或按社区单独设置，请右键点击社区图标并打开通知设置。';

  @override
  String get notificationsPushInactiveTimeoutLabel => '推送通知不活跃超时';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '当你在电脑前时，$productName 会避免向你的移动设备发送推送通知。请选择在桌面端处于非活动状态多久之后才接收推送通知。';
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
  String get notificationsMentionPreferMentionName => '接收 @提及';

  @override
  String get notificationsMentionPreferMentionDescription =>
      '默认回复会 @提及你，如果发送者关闭此功能，会提醒对方';

  @override
  String get notificationsMentionPreferNoMentionName => '不接收 @提及';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      '默认回复不带 @提及，如果发送者开启此功能，会提醒对方';

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
      '仅朗读你正在查看的频道。切换频道时，朗读会随之切换。';

  @override
  String get notificationsTtsModeNeverName => '从不自动朗读';

  @override
  String get notificationsTtsModeNeverDescription => '除非有人手动运行 /tts，否则保持静默。';

  @override
  String get notificationsTtsModeAriaLabel => '朗读所有消息';

  @override
  String get notificationsSoundsSectionTitle => '声音';

  @override
  String get notificationsMasterVolumeLabel => '主音量';

  @override
  String get notificationsMasterVolumeDescription =>
      '设置所有音效的音量。已单独设置音量的音效不受此项影响。';

  @override
  String get notificationsResetToDefaultVolume => '重置为默认音量';

  @override
  String get notificationsDisableAllSoundsLabel => '关闭所有通知提示音';

  @override
  String get notificationsDisableAllSoundsDescription => '你现有的通知声音设置将保留。';

  @override
  String get notificationsShowMoreSoundEffects => '显示更多音效';

  @override
  String get notificationsShowFewerSoundEffects => '显示更少的音效';

  @override
  String get notificationsPreviewSound => '试听提示音';

  @override
  String get notificationsPerSoundVolumeTitle => '单个提示音音量';

  @override
  String get notificationsPerSoundVolumeDescription =>
      '为单个声音设置自定义音量。未单独设置音量的声音将遵循主音量设置。';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return '已生效的自定义音量覆盖：$overrideCount。';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return '跟随主设置 • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return '将“$label”重置为主音量';
  }

  @override
  String get notificationsResetAllOverrides => '重置所有自定义音量';

  @override
  String notificationsMuteSound(String label) {
    return '静音 $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '取消 $label 的静音';
  }

  @override
  String get notificationsSoundMessage => '社区消息通知';

  @override
  String get notificationsSoundDirectMessage => '私信通知';

  @override
  String get notificationsSoundSameChannelMessage => '当前频道消息通知';

  @override
  String get notificationsSoundMute => '语音静音';

  @override
  String get notificationsSoundUnmute => '语音取消静音';

  @override
  String get notificationsSoundDeaf => '语音拒听';

  @override
  String get notificationsSoundUndeaf => '语音解除拒听';

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
  String get notificationsSoundCameraOn => '开启摄像头';

  @override
  String get notificationsSoundCameraOff => '关闭摄像头';

  @override
  String get notificationsSoundScreenShareStart => '屏幕共享开始';

  @override
  String get notificationsSoundScreenShareStop => '屏幕共享停止';

  @override
  String get notificationsAfkTimeoutSyncFailed => '无法更新推送通知超时设置。请重试。';

  @override
  String get notificationsMentionPreferenceSyncFailed => '无法更新提及偏好设置。请重试。';

  @override
  String get notificationsPermissionDeniedTitle => '通知已被阻止';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      '无法启用通知。请允许通知权限后继续。';

  @override
  String get notificationsPushRelaySectionTitle => '推送通知中继';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider 只通过自家服务投递推送通知，因此本设备的推送会经过 Fluxer 中继。';
  }

  @override
  String get notificationsPushRelayConsentLabel => '使用 Fluxer 推送中继';

  @override
  String get notificationsPushRelayConsentDescription =>
      '关闭后将移除本设备的推送注册，本设备将不再接收推送通知。';

  @override
  String get pushRelayConsentTitle => '推送通知中继';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider 只通过自家服务投递推送通知，因此本设备的推送会经过 Fluxer 中继。';
  }

  @override
  String get pushRelayConsentNoticePrefix => '若要在本设备上开启推送通知，请同意';

  @override
  String get pushRelayConsentNoticeLink => '推送中继隐私声明';

  @override
  String get pushRelayConsentNoticeSuffix => '。每台设备只需同意一次。';

  @override
  String get pushRelayConsentAgree => '同意并继续';

  @override
  String get pushRelayConsentDecline => '暂不';

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
    return '应用语言的时间格式：$format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return '系统时间格式：$format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat => '使用系统区域设置的时间格式';

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
  String get userSettingsNavAppIcon => '应用图标';

  @override
  String get appIconSectionTitle => '应用图标';

  @override
  String get appIconSectionDescription => '选择在主屏幕上显示的图标。';

  @override
  String get appIconOptionDefault => '默认';

  @override
  String get appIconOptionStarfield => '星空';

  @override
  String get appIconOptionSweden => '瑞典';

  @override
  String get appIconUnsupported => '此设备不支持更改应用图标。';

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
  String get advancedSettingVideoSeekThumbnailsLabel => '启用视频进度预览缩略图';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      '拖动视频进度条时显示缩略图或实时画面';

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
      '加入社区语音频道时需确认或双击';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel => '加入语音频道需双击';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel => '加入语音频道前确认';

  @override
  String get advancedSettingAutoSendGifsLabel => '选中后自动发送 GIF';

  @override
  String get advancedSettingAutoSendGifsDescription => '从选择器自动发送 GIF，无需确认';

  @override
  String get advancedSettingSaveGifFavoritesLabel => '将收藏的 GIF 存为已保存媒体';

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
  String get advancedSettingStripTrackingDescription => '自动移除你发送的消息中网址里的跟踪参数';

  @override
  String get advancedSettingTrustAllLinksLabel => '信任所有外部链接';

  @override
  String get advancedSettingTrustAllLinksDescription => '跳过所有域名的外部链接警告';

  @override
  String get advancedSettingSearchEnginesLabel => '搜索引擎';

  @override
  String get advancedSettingSearchEnginesDescription => '配置对选中文本使用的搜索引擎';

  @override
  String get advancedSettingTranslatorsLabel => '翻译服务';

  @override
  String get advancedSettingTranslatorsDescription => '配置对选中文本使用的翻译服务';

  @override
  String get advancedSettingReverseImageSearchLabel => '反向图片搜索';

  @override
  String get advancedSettingReverseImageSearchDescription => '反向图片搜索提供方';

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
  String get advancedSettingSkipMarkAllAsReadLabel => '跳过“全部标为已读”确认';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      '立即将所有未读收件箱频道标为已读，无需确认';

  @override
  String get advancedSettingHideMutedChannelsLabel => '默认隐藏已静音频道';

  @override
  String get advancedSettingHideMutedChannelsDescription => '在社区侧边栏中隐藏你已静音的频道';

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
  String get advancedSettingShowSuppressEmbedsLabel => '显示隐藏嵌入内容按钮';

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
  String get advancedSettingShowStickersAutocompleteLabel => '在表情自动补全中显示贴纸';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      '在表情自动补全中显示已保存媒体';

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
  String get advancedSettingNewDeviceAlertsDescription => '连接新音频设备时提示';

  @override
  String get advancedSettingConnectionVolumeControlsLabel => '连接音量控制';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      '在语音菜单中显示每个设备的参与者音量滑块';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel => '屏幕共享预览行为';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      '预览、弹出和直播缩略图行为';

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
  String get advancedSettingSearchEngineGoogleLens => 'Google 智能镜头';

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
      '启用或停用内置搜索引擎。已启用的搜索引擎会在选中文本时显示在消息上下文菜单中。';

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
      '启用或停用内置翻译器。已启用的翻译器会在选中文本时显示在消息上下文菜单中。';

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
      '选择搜索图片时默认使用的反向图片搜索服务。';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel => '内置反向图片搜索';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      '启用或停用内置反向图片搜索提供方。已启用的提供方会显示在图片、头像、横幅、贴纸和表情的上下文菜单中。';

  @override
  String get advancedSettingCustomReverseImageSearchLabel => '自定义反向图片搜索';

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
  String get advancedSettingSearchProviderNameImagePlaceholder => '我的反向图片搜索';

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
  String get advancedSettingSearchProviderUrlMustBeValid => '网址格式必须是有效的网址。';

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
  String get userSettingsNavWhatsNew => '新功能';

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
  String get userSettingsLogOutConfirmTitle => '要退出登录吗？';

  @override
  String get userSettingsLogOutConfirmDescription => '你可以随时重新登录。';

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
  String get quickSwitcherEmptyHint => '尝试其他名称，或使用 @ / # / ! / * 前缀筛选结果。';

  @override
  String get quickSwitcherSectionPeople => '用户';

  @override
  String get quickSwitcherSectionGroupMessages => '群聊';

  @override
  String get quickSwitcherSectionTextChannels => '文字频道';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

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
  String get savedMessagesEmptyBody => '为消息添加书签，以便稍后查看。';

  @override
  String get savedMessagesEndBody => '这里没有更多内容了。';

  @override
  String get savedMessagesRemoveTooltip => '移除书签';

  @override
  String get savedMessagesAddedToast => '已添加到书签';

  @override
  String get savedMessagesRemovedToast => '已从书签中移除';

  @override
  String get quickSwitcherMentionsLabel => '提及';

  @override
  String get quickSwitcherFriendsEmptyTitle => '暂无好友';

  @override
  String get quickSwitcherFriendsEmptyHint => '添加好友以开始聊天。';

  @override
  String get quickSwitcherFriendsNoMatchTitle => '没有匹配该搜索的好友';

  @override
  String get quickSwitcherFriendsNoMatchHint => '换个名字试试。';

  @override
  String get quickSwitcherSearchAliasUser => '用户';

  @override
  String get quickSwitcherSearchAliasYou => '你';

  @override
  String get quickSwitcherSearchAliasDm => '私信';

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
  String get uiLoading => '加载中';

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
  String get instanceUrlHelper => '官方实例请使用 fluxer.app，自托管实例请使用确切的 URL。';

  @override
  String get resetToDefaultInstance => '重置为 Fluxer';

  @override
  String get instanceConnect => '连接';

  @override
  String get instanceConnecting => '连接中…';

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
  String get discoveryCategoryScienceAndTechnology => '科技';

  @override
  String get discoveryCategoryContentCreator => '内容创作者';

  @override
  String get discoveryCategoryAnimeAndManga => '动漫';

  @override
  String get discoveryCategoryMoviesAndTv => '影视';

  @override
  String get discoveryCategoryOther => '其他';

  @override
  String get discoveryNoCommunitiesMatch => '没有匹配的社区。';

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
  String get discoveryNoDescription => '暂无描述。';

  @override
  String get discoveryCommunities => '社区';

  @override
  String get discoveryApps => '应用';

  @override
  String get discoveryJoinErrorGenericTitle => '无法加入此社区';

  @override
  String get discoveryJoinErrorGenericMessage => '出错了。请稍后重试。';

  @override
  String get discoveryJoinErrorFullTitle => '该社区已满员';

  @override
  String get discoveryJoinErrorFullMessage => '该社区已达到成员上限，你暂时无法加入。';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => '你已达到社区数量上限';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      '你加入的社区数量已达上限。请先退出一个社区，然后重试。';

  @override
  String get discoveryJoinErrorBannedTitle => '你无法加入此社区';

  @override
  String get discoveryJoinErrorBannedMessage => '你已被此社区封禁。';

  @override
  String get discoveryJoinErrorNotAvailableTitle => '该社区已不可用';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      '它可能已退出社区发现，或关闭了新成员加入。刷新页面后，你就不会再看到它了。';

  @override
  String get discoveryJoinErrorRateLimitTitle => '你的操作过于频繁';

  @override
  String get discoveryJoinErrorRateLimitMessage => '请稍候片刻，然后重试。';

  @override
  String get guildNavbarAddCommunity => '添加社区';

  @override
  String get guildNavbarHelp => '帮助';

  @override
  String get scrollIndicatorNew => '新';

  @override
  String get scrollIndicatorNewMessage => '新消息';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '收起“$folderName”';
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
  String get authCheckStillWorking => '仍在处理中…';

  @override
  String get authVerificationFailed => '无法完成验证。请重试。';

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
  String get profileUnblockUser => '取消屏蔽用户';

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
  String get guildFolderIconStar => '星形';

  @override
  String get guildFolderIconHeart => '心形';

  @override
  String get guildFolderIconBookmark => '书签';

  @override
  String get guildFolderIconGameController => '游戏手柄';

  @override
  String get guildFolderIconShield => '盾牌';

  @override
  String get guildFolderIconMusicNote => '音符';

  @override
  String get guildFolderMarkAsRead => '将文件夹标为已读';

  @override
  String get guildBulkMuteCommunities => '将所有社区静音';

  @override
  String get guildBulkUnmuteCommunities => '取消所有社区静音';

  @override
  String get guildBulkCommunityNotificationSettings => '社区通知设置';

  @override
  String get guildBulkCommunityPrivacySettings => '社区隐私设置';

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
  String get guildNavbarTextChannel => '文字频道';

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
  String get guildNavbarPrivateChannel => 'Private channel';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Only selected members and roles will be able to view this channel.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Add members or roles';

  @override
  String get guildNavbarAddMembersOrRolesHint => 'Search members or roles';

  @override
  String get guildNavbarCreateCategory => '创建类别';

  @override
  String get guildNavbarNewCategoryHint => '新建类别';

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
  String get guildNavbarNoFriendsYet => '暂无好友';

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
  String get guildNavbarExpireAfter => '有效期';

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
  String get guildNavbarLeaveCommunityTitle => '退出社区';

  @override
  String get guildNavbarLeaveCommunityDescription => '确定要离开此社群吗？您将无法再看到任何消息。';

  @override
  String get guildNavbarLeaveCommunityConfirm => '退出社区';

  @override
  String get guildNavbarDeleteMyMessagesTitle => '删除你在此社区中的消息？';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      '永久删除您在此处、所有频道中发送的每条消息。无法撤销。';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => '删除我的消息';

  @override
  String get guildNavbarDeletedYourMessages => '已删除您的消息';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => '无法删除你的消息';

  @override
  String get guildNavbarRemoveOverride => '移除覆盖';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return '静音至 $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return '仅限 $productName 员工访问';
  }

  @override
  String get guildNavbarInvitesPaused => '此社区的邀请目前已暂停';

  @override
  String get guildNavbarDurationNever => '永不';

  @override
  String get guildNavbarDuration30Minutes => '30 分钟';

  @override
  String get guildNavbarDuration1Hour => '1 小时';

  @override
  String get guildNavbarDuration6Hours => '6 小时';

  @override
  String get guildNavbarDuration12Hours => '12 小时';

  @override
  String get guildNavbarDuration1Day => '1 天';

  @override
  String get guildNavbarDuration7Days => '7 天';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count秒';
  }

  @override
  String get guildNavbarNever => '从不';

  @override
  String get guildNavbarNoLimit => '无限制';

  @override
  String get guildNavbarOneUse => '1 次使用';

  @override
  String guildNavbarUses(int count) {
    return '$count次';
  }

  @override
  String get guildMenuMarkAsRead => '标为已读';

  @override
  String get guildPeekMoreOptions => '更多选项';

  @override
  String get guildMenuInviteMembers => '邀请成员';

  @override
  String get guildMenuCommunitySettings => '社区设置';

  @override
  String get guildMenuEditCommunityProfile => '编辑社区资料';

  @override
  String get guildMenuUnmuteCommunity => '取消社区静音';

  @override
  String get guildMenuMuteCommunity => '将社区静音';

  @override
  String get guildMenuHideMutedChannels => '隐藏已静音频道';

  @override
  String get guildMenuDebugCommunity => '调试社区';

  @override
  String get guildMenuCopyCommunityId => '复制社区 ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return '直到 $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => '通用';

  @override
  String get guildMenuSettingsRoles => '角色和权限';

  @override
  String get guildMenuSettingsEmoji => '表情';

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
  String get guildMenuSettingsDiscovery => '社区发现';

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
  String get guildSettingsOverviewNameHint => '我的超赞社区';

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
  String get guildSettingsRolesListTitle => '身份组';

  @override
  String get guildSettingsRolesNewRole => '新身份组';

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
  String get guildSettingsRolesEditSubtitle => '配置身份组设置和权限';

  @override
  String get guildSettingsRolesDisplaySection => '显示';

  @override
  String get guildSettingsRolesRoleName => '身份组名称';

  @override
  String get guildSettingsRolesRoleColor => '身份组颜色';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      '输入颜色（hex、rgb()、hsl() 或颜色名称），或使用取色器。';

  @override
  String get guildSettingsRolesShowSeparately => '单独显示此身份组';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      '在成员列表中将拥有此身份组的成员单独分组显示。';

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
  String get guildSettingsRolesSwitchToComfyLayout => '切换为舒适布局';

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
  String get guildSettingsRolesCustomHoistOrder => '自定义置顶顺序';

  @override
  String get guildSettingsRolesHoistOrder => '显示顺序';

  @override
  String get guildSettingsRolesResetHoistOrder => '重置为默认值';

  @override
  String get guildSettingsRolesHoistOrderHelp => '拖动身份组可调整其在成员列表中的显示顺序。';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      '没有置顶身份组。为某个身份组开启“单独显示此身份组”后，即可在此处看到它。';

  @override
  String get guildSettingsRolesLockedTooltip => '你无法编辑此角色，因为它高于或等同于你的最高角色';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return '您需要“$permission”权限才能编辑这些权限';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole => '你无法编辑与你最高身份组同级或更高的身份组';

  @override
  String get guildSettingsRolesCannotGrantPermission => '你无法授予自己没有的权限';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      '你无法移除此权限，因为它会把你自己的权限也移除';

  @override
  String get guildSettingsRolesUpdatedSuccess => '身份组更新成功';

  @override
  String get guildSettingsRolesCreatedSuccess => '身份组创建成功';

  @override
  String get guildSettingsRolesDeletedSuccess => '身份组删除成功';

  @override
  String get guildSettingsRolesHoistResetSuccess => '显示顺序已重置为默认';

  @override
  String get guildSettingsRolesNameRequiredTitle => '身份组名称为必填项';

  @override
  String get guildSettingsRolesNameRequiredBody => '保存前请先给身份组命名。';

  @override
  String get guildSettingsRolesCreateFailedTitle => '无法创建身份组';

  @override
  String get guildSettingsRolesUpdateFailedTitle => '无法更新身份组';

  @override
  String get guildSettingsRolesDeleteFailedTitle => '无法删除身份组';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '“$name” 无法删除。请重试。';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle => '无法重置显示顺序';

  @override
  String get guildSettingsRolesTryAgainInAMoment => '请稍后重试。';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return '确定要删除 $name 角色吗？拥有此角色的任何成员将不再拥有该角色。';
  }

  @override
  String get permissionCategoryCommunityWide => '社区范围';

  @override
  String get permissionCategoryMessagesMedia => '消息与媒体';

  @override
  String get permissionCategoryModeration => '审核';

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
  String get permissionManageCommunity => '管理社区';

  @override
  String get permissionManageCommunityDescription => '编辑名称、描述和图标等社区整体设置。';

  @override
  String get permissionManageRoles => '管理身份组';

  @override
  String get permissionManageRolesDescription =>
      '创建、编辑或删除层级低于你最高身份组的身份组。也可以编辑频道权限覆盖。';

  @override
  String get permissionManageChannels => '管理频道';

  @override
  String get permissionManageChannel => '管理频道';

  @override
  String get permissionManageChannelDescription => '重命名并编辑此频道的设置。';

  @override
  String get permissionManagePermissions => '管理权限';

  @override
  String get permissionManagePermissionsDescription => '编辑此频道中身份组和成员的权限覆盖。';

  @override
  String get permissionManageWebhooksChannelDescription =>
      '创建、编辑或删除此频道的 Webhook。';

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
  String get permissionChangeOwnNicknameDescription => '更新你的昵称。';

  @override
  String get permissionManageNicknames => '管理昵称';

  @override
  String get permissionManageNicknamesDescription => '修改其他成员的昵称。';

  @override
  String get permissionCreateEmojiStickers => '创建表情和贴纸';

  @override
  String get permissionCreateEmojiStickersDescription => '上传新的表情和贴纸，并管理你的作品。';

  @override
  String get permissionManageEmojiStickers => '管理表情和贴纸';

  @override
  String get permissionManageEmojiStickersDescription => '编辑或删除其他成员创建的表情和贴纸。';

  @override
  String get permissionManageWebhooks => '管理 Webhook';

  @override
  String get permissionManageWebhooksDescription => '创建、编辑或删除 Webhook。';

  @override
  String get permissionSendMessages => '发送消息';

  @override
  String get permissionSendTtsMessages => '发送 TTS 消息';

  @override
  String get permissionSendTtsMessagesDescription => '发送文本转语音消息';

  @override
  String get permissionManageMessages => '管理消息';

  @override
  String get permissionManageMessagesDescription => '删除其他成员的消息。置顶消息有单独的权限控制。';

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
  String get permissionUseExternalEmoji => '使用外部表情';

  @override
  String get permissionUseExternalEmojiDescription => '使用其他社区的表情。';

  @override
  String get permissionUseExternalStickers => '使用外部贴纸';

  @override
  String get permissionAddReactions => '添加反应';

  @override
  String get permissionAddReactionsDescription => '为消息添加新的反应。';

  @override
  String get permissionBypassSlowmode => '忽略慢速模式';

  @override
  String get permissionBypassSlowmodeDescription => '忽略每个频道的发消息频率限制。';

  @override
  String get permissionTimeOutMembers => '禁言成员';

  @override
  String get permissionTimeOutMembersDescription => '在一段时间内禁止成员发送消息、添加反应和加入语音。';

  @override
  String get permissionViewChannel => '查看频道';

  @override
  String get permissionViewChannelMembers => '查看频道成员';

  @override
  String get permissionViewChannelMembersDescription => '查看此社区中各频道的成员列表。';

  @override
  String get permissionConnect => '连接';

  @override
  String get permissionSpeak => '发言';

  @override
  String get permissionStreamVideo => '视频直播';

  @override
  String get permissionUseVoiceActivity => '使用语音活动';

  @override
  String get permissionUseVoiceActivityDescription => '没有此权限时，必须使用按住说话。';

  @override
  String get permissionPrioritySpeaker => '优先发言者';

  @override
  String get permissionMuteMembers => '静音成员';

  @override
  String get permissionDeafenMembers => '将成员设为拒听';

  @override
  String get permissionMoveMembers => '移动成员';

  @override
  String get permissionMoveMembersDescription => '将成员拖动到他们有权访问的频道之间。';

  @override
  String get permissionSetVoiceRegion => '设置语音区域';

  @override
  String get permissionManageThreads => 'Manage threads';

  @override
  String get permissionManageThreadsDescription =>
      'Rename, archive, lock and delete threads, set their slowmode, and view private threads.';

  @override
  String get permissionCreatePublicThreads => 'Create public threads';

  @override
  String get permissionCreatePublicThreadsDescription =>
      'Start threads that everyone who can view the channel can see.';

  @override
  String get permissionCreatePrivateThreads => 'Create private threads';

  @override
  String get permissionCreatePrivateThreadsDescription =>
      'Start invite-only threads.';

  @override
  String get permissionSendMessagesInThreads => 'Send messages in threads';

  @override
  String get permissionSendMessagesInThreadsDescription =>
      'Send messages in threads and forum posts.';

  @override
  String get threadErrorArchived => 'This thread is archived.';

  @override
  String get threadErrorLocked =>
      'This thread is locked. Only moderators can post or reopen it.';

  @override
  String get threadErrorAlreadyCreated =>
      'A thread already exists for this message.';

  @override
  String get threadErrorMaxActiveThreads =>
      'This community has reached its limit of active threads.';

  @override
  String get threadErrorMaxMembers =>
      'This thread has reached its member limit.';

  @override
  String get threadErrorMaxPinnedPosts =>
      'Only one post can be pinned in this forum.';

  @override
  String get threadErrorMaxForumTags => 'A forum can have at most 20 tags.';

  @override
  String get threadErrorTagNamesUnique => 'Tag names must be unique.';

  @override
  String get threadErrorNoTagsForEveryone =>
      'Add a tag everyone can use before requiring tags.';

  @override
  String get threadErrorTagRequired => 'Pick at least one tag for this post.';

  @override
  String get threadErrorUnknownTag =>
      'One of the selected tags no longer exists.';

  @override
  String get threadErrorInvalidNotificationSettings =>
      'Those notification settings are not valid for a thread.';

  @override
  String get threadErrorSearchIndexNotReady =>
      'Posts are still being indexed. Try again in a moment.';

  @override
  String get threadErrorInvalidChannelType =>
      'This action is not available in this channel.';

  @override
  String get threadCreate => 'Create thread';

  @override
  String get threadName => 'Thread name';

  @override
  String get threadNameRequired => 'Give the thread a name.';

  @override
  String get threadNewThreadPlaceholder => 'New thread';

  @override
  String get threadPrivate => 'Private thread';

  @override
  String get threadPrivateDescription =>
      'Only people you invite and moderators can see this thread.';

  @override
  String get threadStarterMessage => 'Message';

  @override
  String get threadStarterMessagePlaceholder =>
      'Enter a message to start the conversation!';

  @override
  String threadCreateCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can start another thread in $seconds seconds.',
      one: 'You can start another thread in 1 second.',
    );
    return '$_temp0';
  }

  @override
  String threadCreateFailed(String detail) {
    return 'Could not start the thread: $detail';
  }

  @override
  String get threadBrowserTitle => 'Threads';

  @override
  String get threadBrowserActive => 'Active';

  @override
  String get threadBrowserArchived => 'Closed';

  @override
  String get threadBrowserJoined => 'Joined';

  @override
  String get threadBrowserOtherActive => 'Other active threads';

  @override
  String get threadBrowserPublic => 'Public threads';

  @override
  String get threadBrowserPrivate => 'Private threads';

  @override
  String get threadBrowserEmpty =>
      'There are no threads. Stay focused on a conversation with a thread, a temporary text channel.';

  @override
  String get threadBrowserArchivedEmpty => 'There are no closed threads.';

  @override
  String get threadBrowserLoadMore => 'Load more';

  @override
  String get threadBrowserSearch => 'Search threads';

  @override
  String get threadBrowserSearchEmpty => 'No threads match';

  @override
  String get threadBrowserSearchEmptyHint =>
      'Try a different name or check the other tab.';

  @override
  String get threadBrowserSearchFailed =>
      'Couldn\'t search threads. Try again later.';

  @override
  String get threadBrowserSearchIndexing =>
      'Search is getting ready for this community. Trying again shortly...';

  @override
  String threadMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages',
      one: '1 message',
    );
    return '$_temp0';
  }

  @override
  String get threadFailedToMentionSomeRoles =>
      'Some mentioned roles were not added to this thread.';

  @override
  String get threadMembers => 'Thread members';

  @override
  String threadMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get threadMembersEmpty => 'Nobody has joined this thread yet.';

  @override
  String threadRemoveMember(String name) {
    return 'Remove $name from thread';
  }

  @override
  String get threadJoin => 'Join thread';

  @override
  String get threadLeave => 'Leave thread';

  @override
  String get threadJoinNotice =>
      'Join this thread to follow it in your channel list and get notifications.';

  @override
  String get threadArchivedNotice =>
      'This thread is closed. Sending a message will open it again.';

  @override
  String get threadLockedNotice =>
      'This thread is locked. Only moderators can send messages.';

  @override
  String get threadArchive => 'Close thread';

  @override
  String get threadUnarchive => 'Open thread again';

  @override
  String get threadLock => 'Lock thread';

  @override
  String get threadUnlock => 'Unlock thread';

  @override
  String get threadDelete => 'Delete thread';

  @override
  String threadDeleteConfirm(String threadName) {
    return 'Are you sure you want to delete $threadName? This cannot be undone.';
  }

  @override
  String get threadDeleted => 'Thread deleted';

  @override
  String get threadMarkAsRead => 'Mark as read';

  @override
  String get threadMute => 'Mute thread';

  @override
  String get threadUnmute => 'Unmute thread';

  @override
  String get threadMuted => 'Thread muted';

  @override
  String get threadUnmuted => 'Thread unmuted';

  @override
  String get threadNotificationSettings => 'Notification settings';

  @override
  String get threadNotificationParentDefault => 'Use channel default';

  @override
  String get threadCopyLink => 'Copy link';

  @override
  String get threadCopyId => 'Copy thread ID';

  @override
  String get threadMoreOptions => 'More options';

  @override
  String get threadSettings => 'Thread settings';

  @override
  String get threadSettingsSaved => 'Thread settings saved';

  @override
  String get threadAutoArchive => 'Hide after inactivity';

  @override
  String get threadAutoArchiveDescription =>
      'The thread stops showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultAutoArchive => 'Default hide after inactivity';

  @override
  String get threadDefaultAutoArchiveDescription =>
      'New threads stop showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultSlowmode => 'Default thread slowmode';

  @override
  String get threadAutoArchiveOneHour => '1 Hour';

  @override
  String get threadAutoArchiveOneDay => '24 Hours';

  @override
  String get threadAutoArchiveThreeDays => '3 Days';

  @override
  String get threadAutoArchiveOneWeek => '1 Week';

  @override
  String get threadInvitable => 'Allow anyone to invite';

  @override
  String get threadInvitableDescription =>
      'Members of this private thread can add other people.';

  @override
  String threadStartedBy(String name) {
    return 'Started by $name';
  }

  @override
  String get threadStarterDeleted => 'Original message was deleted.';

  @override
  String systemThreadCreated(
    String username,
    String threadLink,
    String allThreadsLink,
  ) {
    return '$username started a thread: $threadLink. See $allThreadsLink.';
  }

  @override
  String get systemThreadCreatedAllThreadsLink => 'all threads';

  @override
  String get systemThreadCreatedThreadFallback => 'a thread';

  @override
  String systemPreviewThreadCreated(String username) {
    return '$username started a thread.';
  }

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
      '选择成员在发帖或私信社区成员前必须满足的条件。';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      '拥有身份组的成员可以绕过这些检查。对于公共空间，我们建议启用验证。';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      '列在“发现”中的社区至少需要已验证的电子邮件。启用“发现”时无法选择“无”。';

  @override
  String get guildSettingsModerationMatureTitle => '成人内容和内容警告';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      '配置不适宜内容的标签和成员可选的内容警告。';

  @override
  String get guildSettingsModerationMatureToggle => '成人内容';

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
  String get guildSettingsVerificationLowDescription => '需要已验证的邮箱地址。';

  @override
  String get guildSettingsVerificationMedium => '中';

  @override
  String get guildSettingsVerificationMediumDescription =>
      '需要已验证的电子邮件地址，并且账户已创建至少 5 分钟。';

  @override
  String get guildSettingsVerificationHigh => '高';

  @override
  String get guildSettingsVerificationHighDescription =>
      '需满足中等安全等级的所有要求，并且加入社区至少 10 分钟。';

  @override
  String get guildSettingsVerificationHighest => '非常高';

  @override
  String get guildSettingsVerificationHighestDescription => '需要已验证的电话号码。';

  @override
  String get guildSettingsAuditLogDescription => '追踪社区内的管理员操作。';

  @override
  String get guildSettingsAuditLogEmpty => '暂无日志';

  @override
  String get guildSettingsAuditLogEmptyDescription => '管理操作和社区变更将在此处显示。';

  @override
  String get guildSettingsAuditLogFilterAllUsers => '所有用户';

  @override
  String get guildSettingsAuditLogFilterAllActions => '所有操作';

  @override
  String get guildSettingsAuditLogNoReason => '未提供原因。';

  @override
  String get guildSettingsAuditLogUnknownUser => '未知用户';

  @override
  String get guildSettingsAuditLogLoadError => '加载活动日志时出错了。';

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
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

  @override
  String get auditLogActionChannelOverwriteCreate => '频道覆盖已添加';

  @override
  String get auditLogActionChannelOverwriteUpdate => '频道覆盖已更新';

  @override
  String get auditLogActionChannelOverwriteDelete => '频道覆盖已移除';

  @override
  String get auditLogActionMemberKick => '成员已踢出';

  @override
  String get auditLogActionMemberPrune => '成员已被清理';

  @override
  String get auditLogActionMemberBanAdd => '成员已封禁';

  @override
  String get auditLogActionMemberBanRemove => '成员已解除封禁';

  @override
  String get auditLogActionMemberUpdate => '成员已更新';

  @override
  String get auditLogActionMemberRoleUpdate => '成员身份组已更新';

  @override
  String get auditLogActionMemberMove => '成员已移动';

  @override
  String get auditLogActionMemberDisconnect => '成员已断开连接';

  @override
  String get auditLogActionBotAdd => '机器人已添加';

  @override
  String get auditLogActionRoleCreate => '身份组已创建';

  @override
  String get auditLogActionRoleUpdate => '身份组已更新';

  @override
  String get auditLogActionRoleDelete => '身份组已删除';

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
  String get auditLogActionEmojiCreate => '表情已创建';

  @override
  String get auditLogActionEmojiUpdate => '表情已更新';

  @override
  String get auditLogActionEmojiDelete => '表情已删除';

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
  String auditLogSummaryThreadCreate(String actor, String target) {
    return '$actor started the thread $target.';
  }

  @override
  String auditLogSummaryThreadUpdate(String actor, String target) {
    return '$actor updated the thread $target.';
  }

  @override
  String auditLogSummaryThreadDelete(String actor, String target) {
    return '$actor deleted the thread $target.';
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
  String get guildSettingsLoadingMore => '正在加载…';

  @override
  String get guildSettingsWebhooksDescription => '查看和管理社区中配置的所有 Webhook。';

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
  String get guildSettingsWebhooksLoadFailedTitle => '加载 Webhook 失败';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      '加载 Webhook 时出错。请重试。';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhook 已更新';

  @override
  String get guildSettingsWebhooksUpdateFailed => '更新 Webhook 失败';

  @override
  String get guildSettingsUnknownChannel => '未知频道';

  @override
  String get guildSettingsCopyUrl => '复制 URL';

  @override
  String get guildSettingsCopiedUrl => '网址已复制到剪贴板';

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
  String get guildSettingsDiscoveryDescription => '将你的社区列入社区发现，以便其他人找到并加入。';

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
      '你的社区已列入社区发现。你可以在下方更新展示信息，或撤回以将其移除。';

  @override
  String get guildSettingsDiscoveryPendingInfo => '你的申请正在审核中。你仍可以更新展示信息或撤回申请。';

  @override
  String get guildSettingsDiscoveryCategory => '类别';

  @override
  String get guildSettingsDiscoveryCategoryHelp => '选择最能描述你社区的类别。你可以随时更改。';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => '主要语言';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      '社区中大多数成员使用的语言。用于筛选社区发现结果。';

  @override
  String get guildSettingsDiscoveryDescriptionField => '描述';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder => '介绍一下你的社区';

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
    return '你最多只能添加 $maxTags 个标签。';
  }

  @override
  String get guildSettingsDiscoveryApply => '应用';

  @override
  String get guildSettingsDiscoverySave => '保存';

  @override
  String get guildSettingsDiscoveryWithdraw => '撤回';

  @override
  String get guildSettingsDiscoveryApplicationSent => '社区发现申请已发送';

  @override
  String get guildSettingsDiscoveryListingUpdated => '社区发现展示信息已更新';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn => '社区发现申请已撤回';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle => '无法撤回申请';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription => '请稍后重试。';

  @override
  String get guildSettingsMembersDescription => '搜索和管理服务器成员。';

  @override
  String get guildSettingsMembersSearchHint => '按用户名或 ID 搜索';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count 名成员';
  }

  @override
  String get guildMembersRecentTitle => '最近加入的成员';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return '显示 $displayedCount / $totalCount 位成员';
  }

  @override
  String get guildMembersSort => '排序';

  @override
  String get guildSettingsMembersSortNewest => '最新优先';

  @override
  String get guildMembersSortOldest => '最早优先';

  @override
  String get guildMembersColumnName => '名称';

  @override
  String get guildMembersColumnMemberSince => '加入时间';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return '加入 $productName 的日期';
  }

  @override
  String get guildMembersColumnJoinMethod => '加入方式';

  @override
  String get guildMembersColumnRoles => '身份组';

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
  String get guildMembersFilterPast3Months => '过去 3 个月';

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
  String get guildMembersEmptySearch => '没有匹配的成员。';

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
  String get guildMembersJumpToPage => '跳转到指定页';

  @override
  String get guildMembersJoinSourceCreator => '社区创建者';

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
  String get guildMembersJoinSourceVanityUrl => '自定义邀请链接';

  @override
  String get guildMembersJoinSourceBotInvite => '机器人邀请';

  @override
  String get guildMembersJoinSourcePlatformAdmin => '平台管理员';

  @override
  String get guildMembersJoinSourceDiscovery => '社区发现';

  @override
  String get guildMembersJoinMethodUnknown => '未知';

  @override
  String get guildMembersCommunityOwner => '社区所有者';

  @override
  String get guildMembersViewAllRoles => '查看所有身份组';

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
  String get guildMembersChannelListSelected => '成员（已选）';

  @override
  String get guildSettingsInvitesTitle => '邀请';

  @override
  String get guildSettingsInvitesDescription =>
      '查看此社区的所有邀请。要创建新邀请，请前往频道并使用邀请按钮。';

  @override
  String get guildSettingsInvitesEmpty => '没有邀请链接';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      '此社区还没有任何邀请链接。前往频道并创建邀请，即可邀请他人。';

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
  String get guildSettingsInvitesEnableForCommunityTitle => '为此社区启用邀请';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      '暂停邀请？新用户将无法通过邀请链接加入，直到你重新启用。现有成员不受影响。';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      '启用邀请？用户将能再次通过邀请链接加入此社区。';

  @override
  String get guildSettingsInvitesPause => '暂停';

  @override
  String get guildSettingsInvitesPausedForCommunity => '本社区已暂停邀请。';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return '由于 $productName 检测到潜在的突袭，邀请已暂停。新用户暂时无法加入。';
  }

  @override
  String get guildSettingsInvitesLabelInviter => '邀请人：';

  @override
  String get guildSettingsInvitesLabelChannel => '频道：';

  @override
  String get guildSettingsInvitesLabelCode => '邀请码：';

  @override
  String get guildSettingsInvitesLabelUses => '使用次数：';

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
  String get guildSettingsBansSearchHint => '搜索封禁用户';

  @override
  String get guildSettingsBansEmpty => '没有被封禁的用户。';

  @override
  String get guildSettingsBanPermanent => '永久封禁';

  @override
  String guildSettingsBanExpires(String date) {
    return '将于 $date 过期';
  }

  @override
  String get guildSettingsBanExpiresLabel => '有效期';

  @override
  String get guildSettingsUnban => '解除封禁';

  @override
  String get guildSettingsBansLoading => '正在加载被封禁用户';

  @override
  String get guildSettingsBansNoSearchResults => '未找到符合搜索条件的封禁用户。';

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
  String get guildSettingsDeleteCommunity => '删除社区';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      '确定要删除此社区吗？此操作无法撤销。所有频道、消息和设置都将被永久删除。';

  @override
  String get guildSettingsCommunityDeleted => '社区已删除';

  @override
  String get guildSettingsDeleteCommunityFailed => '无法删除此社区';

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
      '成员超过 250 人的社区会被强制设为“仅提及我的消息”。你原来的设置会保留，当社区成员降到 250 人以下时会自动恢复。';

  @override
  String get guildSettingsOverviewAdvancedTitle => '高级';

  @override
  String get guildSettingsOverviewFlexibleNames => '允许灵活的文字频道名称';

  @override
  String get guildSettingsOverviewHideOwnerCrown => '隐藏社区拥有者皇冠';

  @override
  String get guildSettingsOverviewDetachedBanner => '独立横幅';

  @override
  String get guildSettingsOverviewDetachedBannerHint => '在社区标题下方的独立部分中显示横幅。';

  @override
  String get guildSettingsOverviewUploadIcon => '上传图标';

  @override
  String get guildSettingsOverviewRemoveImage => '移除';

  @override
  String get guildSettingsOverviewSplashTitle => '邀请背景';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => '聊天嵌入背景';

  @override
  String get guildSettingsOverviewEmbedSplashHint => '会显示在聊天里的邀请嵌入内容中。';

  @override
  String get guildSettingsOverviewUploadBackground => '上传背景';

  @override
  String get guildSettingsOverviewNoCommunityBanner => '无社区横幅';

  @override
  String get guildSettingsOverviewNoInviteBackground => '无邀请背景';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => '预览';

  @override
  String get guildSettingsOverviewInvitePreviewHint => '查看访客看到的邀请界面。';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => '文字频道名称';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => '社区所有者皇冠';

  @override
  String get guildSettingsOverviewOwnerCrownDescription => '配置是否在社群管理员旁边显示皇冠图标';

  @override
  String get guildSettingsSplashCardAlignment => '卡片对齐方式';

  @override
  String get guildSettingsSplashAlignmentCenter => '居中';

  @override
  String get guildSettingsSplashAlignmentLeft => '左对齐';

  @override
  String get guildSettingsSplashAlignmentRight => '右对齐';

  @override
  String get guildSettingsSplashAlignmentHint => '仅在宽屏上生效。';

  @override
  String get permissionReadMessageHistory => '查看消息历史记录';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return '更改无“$permission”权限的用户可查看的内容';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return '使用专用弹窗设置无“$permission”权限成员的消息历史记录阈值日期。';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen => '打开消息历史记录阈值';

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
      '允许在文字频道名称中使用大写字母和空格。关闭后，名称将仅限小写字母、连字符和下划线。';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint => '隐藏社群管理员旁边的皇冠图标。';

  @override
  String get guildSettingsAnimatedIconRequiresFeature => '动态图标需要“动态图标”社群功能。';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature => '动态横幅需要“动态横幅”社群功能。';

  @override
  String get guildSettingsAfkChannel => 'AFK/闲置频道';

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
  String get guildSettingsSystemChannel => '目标频道';

  @override
  String get guildSettingsSystemChannelHint => '欢迎和系统消息将显示在此处。';

  @override
  String get guildSettingsNoSystemChannel => '无系统频道';

  @override
  String get guildSettingsHideJoinMessages => '隐藏入群消息';

  @override
  String get guildSettingsHideJoinMessagesHint => '隐藏加入消息，仅在目标频道中显示。';

  @override
  String get guildSettingsDefaultNotifications => '默认通知设置';

  @override
  String get guildSettingsNotificationsAll => '所有消息';

  @override
  String get guildSettingsNotificationsAllDescription => '通知所有消息';

  @override
  String get guildSettingsNotificationsMentions => '仅提及我的消息';

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
      '在未标记为成人内容的频道中，自动筛查消息中的露骨内容。';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      '已在发现中列出的社群必须扫描所有成员。启用发现功能时，此设置无法更改。';

  @override
  String get guildSettingsContentFilterOff => '关';

  @override
  String get guildSettingsContentFilterOffDescription => '让社区成员自行管理';

  @override
  String get guildSettingsContentFilterNoRole => '过滤无身份组成员';

  @override
  String get guildSettingsContentFilterNoRoleDescription => '推荐给大多数社区';

  @override
  String get guildSettingsContentFilterAll => '过滤所有人';

  @override
  String get guildSettingsContentFilterAllDescription => '为家庭友好空间提供最高等级保护';

  @override
  String get guildSettingsModerationMatureOff => '关';

  @override
  String get guildSettingsModerationMatureOn => '开';

  @override
  String get guildSettingsContentWarningToggle => '显示内容警告';

  @override
  String get guildSettingsContentWarningToggleDescription => '在进入任何频道前，切换同意提示。';

  @override
  String get guildSettingsContentWarningText => '自定义警告文本';

  @override
  String get guildSettingsContentWarningTextPlaceholder => '此处包含敏感内容。';

  @override
  String get guildSettingsModeration2faTitle => '双重认证要求';

  @override
  String get guildSettingsModeration2faDescription =>
      '要求版主在能够禁言、踢出、暂时禁言或删除消息前进行双重验证。';

  @override
  String get guildSettingsModeration2faSwitchLabel => '要求双重认证才能执行管理操作';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip => '只有社区所有者才能更改此设置';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      '请先在你的账号上启用双重认证，才能更改此设置';

  @override
  String get guildSettingsEmojiSearchHint => '搜索表情';

  @override
  String get guildSettingsEmojiUploadTitle => '上传表情';

  @override
  String get guildSettingsEmojiSlotsTitle => '表情槽位';

  @override
  String get guildSettingsEmojiDropZone => '将表情文件拖放到此处';

  @override
  String get guildSettingsEmojiLoadFailed => '表情加载失败。请稍后重试。';

  @override
  String get guildSettingsEmojiSearchEmpty => '没有找到符合搜索条件的表情。';

  @override
  String get guildSettingsEmojiNoSlots => '没有可用的表情槽位';

  @override
  String get guildSettingsEmojiSlotsFull => '你已达到表情数量上限。请删除一些现有表情以腾出空间。';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return '表情名称至少需要 2 个字符，可以使用字母、数字和下划线。表情大小必须小于 $maxSize。静态图片会自动调整为 128x128 像素并压缩。动态表情和 SVG 必须本身就符合大小限制。';
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
  String get guildSettingsEmojiUploadFailed => '表情上传失败。请重试。';

  @override
  String get guildSettingsEmojiSomeFailedTitle => '部分表情无法添加';

  @override
  String get guildSettingsEmojiSomeFailedBody => '请检查这些文件，然后尝试使用更小或更简单的图片。';

  @override
  String get guildSettingsEmojiRenameTitle => '重命名表情';

  @override
  String get guildSettingsEmojiRenameHint => '2-32个字符，可包含字母、数字、下划线。';

  @override
  String get guildSettingsEmojiColumnEmoji => '表情';

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
  String get guildSettingsEmojiNameTooShort => '表情名称至少需要 2 个字符';

  @override
  String get guildSettingsEmojiNameTooLong => '表情名称最多 32 个字符';

  @override
  String get guildSettingsEmojiInvalidNameTitle => '表情名称无效';

  @override
  String get guildSettingsEmojiRenameFailedTitle => '无法重命名此表情';

  @override
  String get guildSettingsEmojiRenameFailedBody => '名称已恢复到之前的状态。请稍后重试。';

  @override
  String get guildSettingsEmojiGoneTitle => '此表情已不存在';

  @override
  String get guildSettingsEmojiGoneBody => '表情可能已被删除。名称已恢复到之前的状态。';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle => '你无法重命名此表情';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      '你没有重命名此表情的权限。名称已恢复为之前的名称。';

  @override
  String get guildSettingsEmojiRateLimitedTitle => '你的操作过于频繁';

  @override
  String get guildSettingsEmojiRateLimitedBody => '请稍候片刻，然后再次尝试重命名。';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => '无法删除此表情';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle => '你无法删除此表情';

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
  String get guildSettingsCloneEmojiUpdateFailed => '无法更新表情克隆设置';

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
  String get guildSettingsStickerSlotsTitle => '贴纸槽位';

  @override
  String get guildSettingsStickerUploadTitle => '上传贴纸';

  @override
  String get guildSettingsStickerDropZone => '拖放贴纸文件到这里（一次一个）';

  @override
  String get guildSettingsStickerDensity => '贴纸密度';

  @override
  String get guildSettingsStickerDensityCozy => '舒适';

  @override
  String get guildSettingsStickerDensityCompact => '紧凑';

  @override
  String get guildSettingsStickersLoadFailedTitle => '贴纸加载失败';

  @override
  String get guildSettingsStickersLoadFailedBody => '加载贴纸时出错。请重试。';

  @override
  String get guildSettingsStickersSearchEmpty => '没有找到符合搜索条件的贴纸。';

  @override
  String get guildSettingsStickersEmptySearch => '未找到贴纸';

  @override
  String get guildSettingsStickerNoSlots => '没有可用的贴纸槽位';

  @override
  String get guildSettingsStickerSlotsFull => '你已达到贴纸数量上限。请删除一些现有贴纸以腾出空间。';

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
  String get guildSettingsStickerNameTooShort => '名称至少需要 2 个字符';

  @override
  String get guildSettingsStickerNameTooLong => '名称不能超过30个字符';

  @override
  String get guildSettingsStickerDescriptionTooLong => '描述不能超过500个字符';

  @override
  String get guildSettingsStickerCreateFailedTitle => '无法创建此贴纸';

  @override
  String get guildSettingsStickerTooLargeTitle => '贴纸过大';

  @override
  String get guildSettingsStickerCompressFailedTitle => '贴纸压缩后仍然过大';

  @override
  String get guildSettingsStickerDeleteTitle => '删除贴纸';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '删除“$name”？此操作无法撤销。';
  }

  @override
  String get guildSettingsStickerPurgeLabel => '从存储和 CDN 中清除此贴纸';

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
  String get guildSettingsBannedUsersTitle => '已封禁用户';

  @override
  String get guildSettingsInvitesTableInviter => '邀请人';

  @override
  String get guildSettingsInvitesTableChannel => '频道';

  @override
  String get guildSettingsInvitesTableCode => '验证码';

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
  String get createDm => '发起私信';

  @override
  String get createGroupDm => '发起群聊';

  @override
  String get createDmNewMessage => '新消息';

  @override
  String get createDmSelectFriends => '选择好友';

  @override
  String get createDmChooseFriendsSubtitle => '选择要发消息的好友。';

  @override
  String get createDmSearchFriends => '搜索好友';

  @override
  String get createDmNoFriendsFound => '未找到好友';

  @override
  String get createDmNoFriendsYet => '你还没有任何好友';

  @override
  String get createDmClaimToStartDms => '请先认领你的账号，然后才能开始私信。';

  @override
  String get createDmVerifyToStartDms => '验证邮箱后才能发起私信。';

  @override
  String get createDmVerifyYourEmail => '验证邮箱';

  @override
  String get createDmNewGroup => '新建群聊';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return '与 $userName 创建新群聊';
  }

  @override
  String get createDmConfirmNewGroup => '确认新群聊';

  @override
  String get createDmCreateNewGroup => '创建新群聊';

  @override
  String createDmRemoveFriend(String displayName) {
    return '移除 $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      '你已经有一个包含这些用户的群聊。确定要再建一个吗？当然也没问题！';

  @override
  String get createDmNoActivityYet => '暂无动态';

  @override
  String get createDmSomeUsersCantBeAdded => '部分用户无法添加';

  @override
  String get createDmCreateWithoutThem => '跳过他们并创建';

  @override
  String get createDmUnaddableIntro => '以下用户无法添加到群聊：';

  @override
  String createDmUnaddableProceed(int count) {
    return '是否创建包含剩余 $count 位成员的群聊，并跳过其他人？';
  }

  @override
  String get createDmUnaddableNoneRemaining => '没有可用于创建群聊的其他收件人。';

  @override
  String get createDmUnaddableUserNotFound => '用户不存在';

  @override
  String get createDmUnaddableBlocked => '你无法给该用户发消息';

  @override
  String get createDmUnaddableNotFriends => '不在你的好友列表中';

  @override
  String get createDmUnaddableGroupDisabled => '不允许被添加到群聊';

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
  String get keybindActionMarkUnread => '标为未读';

  @override
  String get keybindActionFocusTextarea => '聚焦文本框';

  @override
  String get keybindActionSwitchCommunities => '切换社区';

  @override
  String get keybindActionSwitchChannels => '切换频道';

  @override
  String get keybindActionHistoryBack => '在浏览过的频道历史中后退';

  @override
  String get keybindActionHistoryForward => '在浏览过的频道历史中前进';

  @override
  String get keybindActionJumpUnreadChannels => '在未读频道之间跳转';

  @override
  String get keybindActionJumpMentionChannels => '在有提及的未读频道之间跳转';

  @override
  String get keybindActionJumpCurrentCall => '跳转到当前通话';

  @override
  String get keybindActionToggleLastGuildDms => '在上次访问的社区和私信之间切换';

  @override
  String get keybindActionPreviousCommunityOrDms => '切换到上一个社区或私信';

  @override
  String get keybindActionNextCommunityOrDms => '切换到下一个社区或私信';

  @override
  String get keybindActionGoToDms => '前往私信';

  @override
  String get keybindActionGoToFirstCommunity => '前往第一个社区';

  @override
  String get keybindActionGoToSecondCommunity => '前往第二个社区';

  @override
  String get keybindActionGoToThirdCommunity => '前往第三个社区';

  @override
  String get keybindActionGoToFourthCommunity => '前往第四个社区';

  @override
  String get keybindActionGoToFifthCommunity => '前往第五个社区';

  @override
  String get keybindActionGoToSixthCommunity => '前往第六个社区';

  @override
  String get keybindActionGoToSeventhCommunity => '前往第七个社区';

  @override
  String get keybindActionGoToEighthCommunity => '前往第八个社区';

  @override
  String get keybindActionToggleQuickSwitcher => '切换快速切换器';

  @override
  String get keybindActionCreateOrJoinCommunity => '创建或加入社区';

  @override
  String get keybindActionStartDragAndDrop => '开始拖放';

  @override
  String get keybindActionMove => '移动';

  @override
  String get keybindActionDropItem => '放下项目';

  @override
  String get keybindActionCancel => '取消';

  @override
  String get keybindActionMarkCommunityRead => '将社区标为已读';

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
  String get keybindActionMarkAllInboxRead => '将收件箱中的所有频道标为已读';

  @override
  String get keybindActionToggleMemberList => '切换成员列表或语音聊天';

  @override
  String get keybindActionToggleEmojiPicker => '切换表情选择器';

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
  String get keybindActionToggleSavedMedia => '切换已保存媒体';

  @override
  String get keybindActionSendVoiceMessage => '发送语音消息';

  @override
  String get keybindActionAnswerCall => '接听来电';

  @override
  String get keybindActionDeclineCall => '拒接来电';

  @override
  String get keybindActionStartDmCall => '在私信或群聊中发起通话';

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

  @override
  String get assistantNeedsLogin => '请先打开 Fluxer 并登录。';

  @override
  String get assistantNotInVoice => '你不在通话中。';

  @override
  String get assistantNotFound => 'Fluxer 找不到该内容。';

  @override
  String get assistantDmsDisabled => '此实例已禁用私信。';

  @override
  String get assistantFailed => 'Fluxer 无法完成此操作。';

  @override
  String get assistantOkMuted => '已将麦克风静音。';

  @override
  String get assistantOkUnmuted => '已取消麦克风静音。';

  @override
  String get assistantOkLeftVoice => '已离开语音频道。';

  @override
  String get assistantOkJoinedVoice => '正在加入语音频道。';

  @override
  String get assistantOkStartedCall => '正在开始通话。';

  @override
  String assistantOkStatusSet(String status) {
    return '状态已设为$status。';
  }

  @override
  String get assistantOkOpened => '正在打开 Fluxer。';

  @override
  String get assistantOkMessageSent => '消息已发送。';

  @override
  String get assistantOkCustomStatusSet => '自定义状态已更新。';

  @override
  String get assistantOkCustomStatusCleared => '自定义状态已清除。';

  @override
  String get guildNavbarAnnouncementChannel => '公告频道';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      '发布更新，其他社区可以关注到自己的频道中';

  @override
  String get channelDetailsAnnouncementChannel => '公告频道';

  @override
  String get channelSettingsAnnouncementChannel => '公告频道';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      '让其他社区关注此频道，并获取你发布内容的副本。';

  @override
  String get channelSettingsStopAnnouncementTitle => '停止作为公告频道？';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个频道关注此频道。将其转换为文字频道会取消这些关注。',
      one: '1 个频道关注此频道。将其转换为文字频道会取消该关注。',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      '将此频道转换为文字频道会取消所有频道对它的关注。';

  @override
  String get channelSettingsConvertChannel => '转换';

  @override
  String get channelSettingsConvertFailed => '无法转换此频道';

  @override
  String get channelSettingsChannelHasFollowers => '仍有其他频道关注此频道。请在转换前移除这些关注。';

  @override
  String get channelMenuFollow => '关注频道';

  @override
  String get channelFollowTitle => '关注此频道';

  @override
  String get channelFollowBody => '选择其已发布消息的去向。你可以在“社区设置”→“Webhook”中随时取消关注。';

  @override
  String get channelFollowCommunity => '社区';

  @override
  String get channelFollowChannel => '频道';

  @override
  String get channelFollowSelectCommunity => 'Select a community';

  @override
  String get channelFollowSelectChannel => 'Select a channel';

  @override
  String get channelFollowAgeWarning => '这是一个年龄限制频道。更新只能发送到年龄限制频道。';

  @override
  String get channelFollowContentWarning => '此频道有内容警告。更新只能发送到有内容警告或年龄限制的频道。';

  @override
  String get channelFollowHiddenHint => '你无法管理 Webhook 的社区和频道已隐藏。';

  @override
  String get channelFollowEmpty => '你无法在任何社区中管理 Webhook。请让管理员关注此频道。';

  @override
  String get channelFollowSubmit => '关注';

  @override
  String get channelFollowFailed => '无法关注此频道。';

  @override
  String get channelFollowSuccessTitle => '更新已在路上！';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return '在 $sourceName 中发布的消息将显示在 #$targetName 中。';
  }

  @override
  String get channelFollowSuccessDismiss => '知道了！';

  @override
  String get channelFollowBarrier => '关注此频道，即可在你选择的频道中收到这些公告。';

  @override
  String get channelHeaderFollow => '关注频道';

  @override
  String get chatMessagePublish => '发布';

  @override
  String get chatMessagePublished => '已发布';

  @override
  String get chatMessagePublishConfirmTitle => '发布消息？';

  @override
  String get chatMessagePublishConfirmBody => '这会将此消息的副本发送到关注此频道的所有频道。';

  @override
  String get chatMessagePublishedToast => '消息已发布';

  @override
  String get chatMessageAlreadyPublished => '此消息已发布。';

  @override
  String get chatMessagePublishFailedTitle => '无法发布此消息';

  @override
  String get chatMessagePublishFailedBody => '出错了。请稍后重试。';

  @override
  String get chatMessagePublishLimitTitle => '慢一点';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return '你可以在 $duration 后再次发布。';
  }

  @override
  String get chatMessagePublishLimitUnknown => '你发布消息的速度过快。请稍后重试。';

  @override
  String get chatMessageDeletePublished => '这也会移除已发送到关注此频道的其他频道的副本。';

  @override
  String get chatMessageEditPublishedTitle => '编辑已发布消息？';

  @override
  String get chatMessageEditPublishedBody => '这会更新已发送到关注此频道的所有频道的副本。';

  @override
  String get chatMessageEditPublishedSave => '保存';

  @override
  String get chatMessageEditLimitTitle => '慢一点';

  @override
  String chatMessageEditLimitBody(String duration) {
    return '你可以在 $duration 后再次编辑此已发布消息。';
  }

  @override
  String get chatMessageEditLimitUnknown => '你编辑此已发布消息的速度过快。请稍后重试。';

  @override
  String get chatMessageOriginalDeleted => '[原始消息已删除]';

  @override
  String get userTagCommunity => '社区';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username 让此频道关注了 $source。在那里发布的消息将显示在此处。';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username 让此频道关注了 $source。';
  }

  @override
  String get publishNudgeNotSent => '尚未发送给关注者。';

  @override
  String get publishNudgeHideForever => '不再显示';

  @override
  String get publishNudgeDismiss => '忽略';

  @override
  String get channelSettingsFollowedChannels => '已关注频道';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      '此频道关注的公告频道。取消关注以停止接收副本。';

  @override
  String get guildSettingsFollowedChannelsDescription => '本社区中的频道所关注的公告频道。';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return '来自 $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused => '由于源频道不可用，更新已暂停。';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return '取消关注 $name？';
  }

  @override
  String get channelSettingsUnfollowBody => '此频道将停止接收来自该公告频道的副本。';

  @override
  String get channelSettingsUnfollow => '取消关注';

  @override
  String get channelSettingsUnfollowFailed =>
      'Couldn\'t unfollow this channel.';

  @override
  String channelSettingsDeliveredTo(String channelName) {
    return 'Delivered to #$channelName';
  }

  @override
  String get crosspostCommunityTitle => '社区';

  @override
  String get crosspostGoToCommunity => '前往社区';

  @override
  String get crosspostJoinCommunity => '加入社区';

  @override
  String get crosspostSourceFailed => '加载此社区失败。请稍后重试。';

  @override
  String get crosspostSourceUnavailable =>
      'This community is no longer available';

  @override
  String crosspostMembers(int count) {
    return '$count 名成员';
  }

  @override
  String crosspostOnline(int count) {
    return '$count 人在线';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分钟',
      one: '1 分钟',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 秒',
      one: '1 秒',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => '不支持的频道类型';

  @override
  String get channelUnsupportedBody => '此应用版本不支持此频道类型。';

  @override
  String get channelDetailsUnsupportedChannel => '不支持的频道';

  @override
  String get forumChannelTypeForum => 'Forum';

  @override
  String get forumChannelTypeForumDescription =>
      'Posts organized by topic and tags';

  @override
  String get forumChannelTypeMedia => 'Media';

  @override
  String get forumChannelTypeMediaDescription =>
      'Posts built around images and videos';

  @override
  String get forumNewPost => 'New post';

  @override
  String get forumNewMediaPost => 'New media post';

  @override
  String get forumSearchPosts => 'Search posts';

  @override
  String get forumViewOptions => 'Sort and view';

  @override
  String get forumSearchIndexing =>
      'Search is still being prepared for this community. Posts appear here as soon as it is ready.';

  @override
  String get forumNoPosts => 'There are no posts yet';

  @override
  String get forumNoPostsHint => 'Be the first to start a conversation here.';

  @override
  String get forumNoSearchResults => 'No posts match your search';

  @override
  String get forumNoSearchResultsHint =>
      'Try different words or clear the tag filter.';

  @override
  String get forumCreateFirstPost => 'Create the first post';

  @override
  String get forumOlderPosts => 'Older posts';

  @override
  String get forumPostsLoadFailed => 'Posts could not be loaded.';

  @override
  String get forumRetry => 'Try again';

  @override
  String get forumPostPinned => 'Pinned';

  @override
  String get forumPostLocked => 'Locked';

  @override
  String get forumPostArchived => 'Archived';

  @override
  String get forumPostNewBadge => 'NEW';

  @override
  String get forumPostStarterDeleted => 'The original message was deleted.';

  @override
  String forumPostSnippet(String author, String content) {
    return '$author: $content';
  }

  @override
  String forumPostNewMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new messages',
      one: '1 new message',
    );
    return '$_temp0';
  }

  @override
  String get forumPostReact => 'Add the default reaction';

  @override
  String get forumOpenPost => 'Open post';

  @override
  String get forumEditTags => 'Edit tags';

  @override
  String get forumSaveTags => 'Save tags';

  @override
  String forumTagsLimitHint(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pick up to $count tags.',
      one: 'Pick up to 1 tag.',
    );
    return '$_temp0';
  }

  @override
  String get forumPinPost => 'Pin post';

  @override
  String get forumUnpinPost => 'Unpin post';

  @override
  String get forumMarkPostRead => 'Mark as read';

  @override
  String get forumCopyPostLink => 'Copy link';

  @override
  String get forumPostGuidelines => 'Post guidelines';

  @override
  String get forumGuidelinesPlaceholder =>
      'Tell people what to post here and how to post it.';

  @override
  String get forumPostTitle => 'Title';

  @override
  String get forumPostMessage => 'Message';

  @override
  String get forumPostMessagePlaceholder =>
      'Write the first message of your post';

  @override
  String get forumPostMediaPlaceholder => 'Add a caption';

  @override
  String get forumPostTags => 'Tags';

  @override
  String get forumPostTagsRequired => 'Tags (required)';

  @override
  String get forumPostAddMedia => 'Add media';

  @override
  String get forumPostAddFile => 'Add file';

  @override
  String get forumPostRemoveAttachment => 'Remove attachment';

  @override
  String get forumPostSubmit => 'Post';

  @override
  String get forumPostTitleRequired => 'Give your post a title.';

  @override
  String get forumPostMediaRequired =>
      'Add at least one image or video to post here.';

  @override
  String get forumPostContentRequired => 'Write a message or add a file.';

  @override
  String get forumSortLatestActivity => 'Recently active';

  @override
  String get forumSortCreationTime => 'Date posted';

  @override
  String get forumLayoutList => 'List view';

  @override
  String get forumLayoutGallery => 'Gallery view';

  @override
  String get forumNewPostsUnread => 'Show unread for new posts';

  @override
  String get forumNewPostsUnreadDescription =>
      'Mark this channel unread when someone creates a post.';

  @override
  String get forumPostSlowmode => 'Post slowmode';

  @override
  String forumPostSlowmodeDescription(String bypassSlowmodePermissionLabel) {
    return 'Wait between creating posts. \"$bypassSlowmodePermissionLabel\" can bypass it.';
  }

  @override
  String get forumMessageSlowmode => 'Message slowmode in posts';

  @override
  String get forumMessageSlowmodeDescription =>
      'Slowmode applied to messages in new posts.';

  @override
  String get forumDefaultAutoArchive => 'Hide after inactivity';

  @override
  String get forumDefaultAutoArchiveDescription =>
      'New posts are archived after this long without activity.';

  @override
  String get forumDefaultReaction => 'Default reaction';

  @override
  String get forumSetDefaultReaction => 'Pick an emoji';

  @override
  String get forumChangeDefaultReaction => 'Change';

  @override
  String get forumRemoveDefaultReaction => 'Remove';

  @override
  String get forumDefaultSortOrder => 'Default sort order';

  @override
  String get forumDefaultLayout => 'Default layout';

  @override
  String get forumTagMatchSetting => 'Tag filter';

  @override
  String get forumTagMatchSome => 'Match any selected tag';

  @override
  String get forumTagMatchAll => 'Match all selected tags';

  @override
  String get forumRequireTag => 'Require tags';

  @override
  String get forumRequireTagDescription =>
      'People must pick at least one tag when they create a post.';

  @override
  String get forumHideMediaDownloads => 'Hide media download options';

  @override
  String get forumHideMediaDownloadsDescription =>
      'Hide download, open in browser and copy link for images and videos in posts.';

  @override
  String forumTagsTitle(int count, int max) {
    return 'Tags ($count/$max)';
  }

  @override
  String get forumTagsDescription =>
      'Tags help people find and filter posts. Only moderators can apply moderated tags.';

  @override
  String get forumCreateTag => 'Create tag';

  @override
  String get forumEditTag => 'Edit tag';

  @override
  String get forumSaveTag => 'Save tag';

  @override
  String get forumDeleteTag => 'Delete tag';

  @override
  String get forumTagName => 'Tag name';

  @override
  String get forumTagEmoji => 'Emoji';

  @override
  String get forumTagRemoveEmoji => 'Remove emoji';

  @override
  String get forumTagModerated => 'Only moderators can apply';

  @override
  String get forumTagModeratedDescription =>
      'Only members who can manage threads can apply or remove this tag.';

  @override
  String get forumTagModeratedBadge => 'Moderated';

  @override
  String forumPostCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can post again in $seconds seconds.',
      one: 'You can post again in 1 second.',
    );
    return '$_temp0';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class FluxerLocalizationsZhHant extends FluxerLocalizationsZh {
  FluxerLocalizationsZhHant() : super('zh_Hant');

  @override
  String get reconnectingTitle => '我們出錯了！';

  @override
  String get reconnectingBody => '連線發生問題。\n幾秒鐘內就會修復！';

  @override
  String get gatewayReconnectingToast => '重新連線中…';

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
  String get splashConnectionIssuesPrompt => '連線有問題？';

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
    return '嗨，$displayName，請認領您的帳號，以免失去存取權限。';
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
  String get forgotPassword => '忘記密碼？';

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
  String get organizationSsoProvider => '使用您機構的單一登入服務供應商登入。';

  @override
  String get failedToStartSso => '無法啟動單一登入';

  @override
  String get ssoCancelled => 'SSO 登入已取消';

  @override
  String preferSso(String provider) {
    return '偏好使用 SSO？透過 $provider 繼續。';
  }

  @override
  String get logInViaBrowser => '透過瀏覽器登入';

  @override
  String get needAccountPrompt => '還沒有帳號嗎？ ';

  @override
  String get register => '註冊';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => '取消';

  @override
  String get ipAuthCheckEmail => '請檢查您的電子郵件';

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
  String get ipAuthResendEmail => '重寄驗證信';

  @override
  String get ipAuthResent => '已重新傳送';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get back => '返回';

  @override
  String get next => '下一步';

  @override
  String get mfaTitle => '雙重驗證';

  @override
  String get mfaChooseMethod => '選擇驗證方式';

  @override
  String get mfaMethodTotp => '驗證器應用程式';

  @override
  String get mfaMethodWebauthn => '安全金鑰/通行金鑰';

  @override
  String get mfaTotpDescription => '輸入您的驗證器應用程式提供的 6 位數驗證碼或其中一個備份代碼。';

  @override
  String get mfaCodeLabel => '驗證碼';

  @override
  String get mfaTryAnotherMethod => '嘗試其他方式';

  @override
  String get mfaUseSecurityKey => '改用安全金鑰或通行金鑰';

  @override
  String get accountSelectorTitle => '選擇帳號';

  @override
  String get accountSelectorDescription => '請選擇一個帳號以繼續，或新增其他帳號。';

  @override
  String get accountAdd => '新增帳號';

  @override
  String get accountRemove => '移除';

  @override
  String accountRemoveTitle(String username) {
    return '移除 $username';
  }

  @override
  String get accountRemoveDescription => '這會移除此帳號的已儲存工作階段。';

  @override
  String get accountRemoveOnlyDescription => '這會移除此裝置上唯一儲存的帳號。';

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
  String get statusOnlineStatusSection => '線上狀態';

  @override
  String get statusOnline => '線上';

  @override
  String get statusIdle => '閒置中';

  @override
  String get statusDnd => '勿擾模式';

  @override
  String get statusInvisible => '隱身';

  @override
  String get statusOffline => '離線';

  @override
  String get statusUntilIChangeIt => '直到我更改為止';

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
  String get statusDndDescription => '您將不會在電腦版收到通知';

  @override
  String get statusInvisibleDescription => '您會顯示為離線';

  @override
  String get customStatusSetTitle => '設定自訂狀態';

  @override
  String get customStatusCurrentHint => '自訂狀態';

  @override
  String get customStatusClear => '清除自訂狀態';

  @override
  String get customStatusPlaceholder => '近況如何？';

  @override
  String get customStatusChooseEmoji => '選擇表情符號';

  @override
  String get customStatusClearAfter => '清除時間';

  @override
  String get customStatusSave => '儲存';

  @override
  String get accountActive => '使用中的帳號';

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
  String get forgotPasswordDescription => '請輸入您的電子郵件地址，我們會傳送密碼重設連結給您。';

  @override
  String get forgotPasswordSubmit => '傳送重設連結';

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
  String get recoverAccountTitle => '復原你的帳號';

  @override
  String get recoverAccountDescription => '輸入你的使用者名稱和復原套件中的復原金鑰，然後選擇一個新密碼。';

  @override
  String get recoverAccountNoKit => '沒有復原工具？請詢問此伺服器的管理員以取得重設密碼連結。';

  @override
  String get recoveryKitTitle => '你的復原工具組';

  @override
  String get recoveryKitCreatedDescription =>
      '如果忘記密碼，這個還原套件是您重新登入帳戶的唯一方法。請將它存放在安全的地方，例如密碼管理器或列印副本。';

  @override
  String get recoveryKitReplacedDescription => '你舊的復原工具組已失效。請將這個新的工具組存放在安全的地方。';

  @override
  String get recoveryKitRecoveredDescription =>
      '你的密碼已重設。你舊的復原套件已失效。請將這個新的套件存放在安全的地方。';

  @override
  String get recoveryKitWarning => '擁有此金鑰的任何人都可以重設您的密碼。請勿分享。';

  @override
  String get recoveryKitKeyLabel => '復原金鑰';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return '$productName 復原套件';
  }

  @override
  String get recoveryKitDocumentIntro =>
      '請將此頁面妥善保管。若您忘記密碼，可使用此頁面重新登入您的帳號。持有此還原金鑰的任何人皆可重設您的密碼，請勿與他人分享。';

  @override
  String get recoveryKitInstanceLabel => '伺服器位址';

  @override
  String get recoveryKitCreatedAtLabel => '建立時間';

  @override
  String get recoveryKitQrCaption => '掃描以開啟復原頁面，並填入您的詳細資料。';

  @override
  String get recoveryKitStepsTitle => '如何復原你的帳號';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return '前往 $recoverUrl 或掃描 QR code。';
  }

  @override
  String get recoveryKitStepEnter => '輸入你的使用者名稱和這個復原金鑰。';

  @override
  String get recoveryKitStepPassword => '設定新密碼。你會收到一份新的復原套件，而這份就無法使用了。';

  @override
  String get recoveryKitBackupCodesTitle => '兩步驟驗證備份驗證碼';

  @override
  String get recoveryKitBackupCodesNote => '每個代碼都可供您在驗證器應用程式中使用一次。';

  @override
  String get recoveryKitBackupCodesFailed => '無法載入您的備份驗證碼。';

  @override
  String get recoveryKitIncludeBackupCodes => '在儲存的圖片中加入我的雙重驗證備用碼';

  @override
  String get recoveryKitCopy => '複製';

  @override
  String get recoveryKitCopied => '已複製復原金鑰';

  @override
  String get recoveryKitSaveImage => '儲存圖片';

  @override
  String get recoveryKitSaved => '已儲存復原套件';

  @override
  String get recoveryKitSavedToPhotos => '已將復原套件儲存至照片';

  @override
  String get recoveryKitSaveFailed => '無法儲存復原套件。請再試一次，或改為複製金鑰。';

  @override
  String get recoveryKitAcknowledge => '我已將我的復原套件存放在安全的地方';

  @override
  String get recoveryKitCreateFailed => '無法建立你的復原工具組。你之後可以在帳戶設定中建立。';

  @override
  String get recoveryKitSectionTitle => '復原工具組';

  @override
  String get recoveryKitSectionDescription => '讓你忘記密碼時可以重設。';

  @override
  String get recoveryKitNone => '你還沒有復原套件';

  @override
  String recoveryKitCreatedRelative(String time) {
    return '建立於 $time';
  }

  @override
  String get recoveryKitCreate => '建立復原套件';

  @override
  String get recoveryKitCreateNew => '建立新套件';

  @override
  String get recoveryKitReplaceTitle => '要建立新的復原套件嗎？';

  @override
  String get recoveryKitReplaceDescription => '你目前的套件將在新套件建立後立即失效。';

  @override
  String get recoveryKitReminderTitle => '儲存復原套件';

  @override
  String get recoveryKitReminderBody =>
      '你的帳號沒有設定電子郵件。如果忘記密碼，恢復套件是唯一能重新登入的方式。只需一分鐘即可完成。';

  @override
  String get registerUsernameSignInHint => '你將使用此使用者名稱登入。請選擇一個你會記得的。';

  @override
  String get registerUsernameTaken => '這個使用者名稱已被註冊';

  @override
  String get registerUsernameAvailable => '這個使用者名稱可以使用';

  @override
  String get claimAccountUsernameDescription =>
      '選擇使用者名稱和密碼來領取你的帳號。你將使用它們來登入，所以請選擇你會記住的。';

  @override
  String get unclaimedAccountDescriptionUsername =>
      '您的帳戶尚未領取。沒有使用者名稱和密碼，您將無法從其他裝置登入，並且可能會遺失帳戶存取權。立即領取您的帳戶以確保安全。';

  @override
  String get addFriendUsernameOnlyHint => '使用者名稱';

  @override
  String get registerTitle => '建立帳號';

  @override
  String get registerDisplayName => '顯示名稱（選填）';

  @override
  String get registerDisplayNameHint => '大家該怎麼稱呼您？';

  @override
  String get registerUsername => '使用者名稱（選填）';

  @override
  String get registerUsernameHint => '留空以隨機產生使用者名稱';

  @override
  String get registerUsernameTagHint => '系統將自動加上 4 位數字標籤以確保唯一性';

  @override
  String get registerDateOfBirth => '出生日期';

  @override
  String get registerMonth => '月';

  @override
  String get registerDay => '日';

  @override
  String get registerYear => '年';

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
  String get registerSubmit => '建立帳號';

  @override
  String get registerHaveAccount => '已經有帳號了？ ';

  @override
  String get registerPendingApproval => '您的帳號申請正在等待核准。管理員核准後即可登入。';

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
  String get errorInvalidUsernameOrPassword => '使用者名稱或密碼無效。';

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
  String get embedInviteUnknownTitle => '不明邀請';

  @override
  String get embedInviteUnknownSubtitle => '試著要求新的邀請。';

  @override
  String get embedInviteUnavailable => '邀請無法使用';

  @override
  String get embedInviteJoinGroup => '加入群組';

  @override
  String get embedInviteAlreadyJoined => '已加入';

  @override
  String get embedInviteDisabled => '邀請已停用';

  @override
  String get embedInvitePaused => '此社群的邀請功能已暫停。';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName 偵測到可能的突襲，因此新使用者目前無法加入。';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain => '此社群已暫停邀請。您可以稍後再試。';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName 偵測到此社群可能遭到突襲。邀請功能已暫停，新使用者目前無法加入。';
  }

  @override
  String get inviteAcceptTitle => '您受邀加入';

  @override
  String get inviteAcceptJoinButton => '加入社群';

  @override
  String get inviteAcceptGoToButton => '前往社群';

  @override
  String get inviteAcceptInvitesPaused => '邀請功能已暫停';

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
  String get messageJumpLinkNoAccess => '無法存取';

  @override
  String get okay => '確定';

  @override
  String get embedThemeTitle => '分享的主題';

  @override
  String get embedThemeHelp => '您收到 CSS 了！';

  @override
  String get embedThemeImport => '匯入主題';

  @override
  String get embedThemeUnavailableTitle => '主題無法使用';

  @override
  String get embedThemeUnavailableDescription => '此主題已無法使用。';

  @override
  String get embedThemeImportUnavailable => '無法匯入';

  @override
  String get themeImportTitle => '匯入主題';

  @override
  String get themeImportDescription => '這會取代您目前的自訂主題。';

  @override
  String get themeImportReadFailed => '我們無法讀取此主題。它可能已損壞或無效。';

  @override
  String get themeImportApply => '套用';

  @override
  String get themeImportApplied => '主題已成功套用。';

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
  String get embedGiftClaimHelp => '點擊領取您的禮物！';

  @override
  String get embedGiftAlreadyRedeemed => '已兌換';

  @override
  String get embedGiftClaimAccountHelp => '認領您的帳號即可兌換此禮物。';

  @override
  String get embedGiftClaim => '領取禮物';

  @override
  String get embedGiftClaimed => '禮物已領取';

  @override
  String get embedGiftClaimAccount => '認領帳號即可兌換';

  @override
  String get embedGiftUnknownTitle => '不明禮物';

  @override
  String get embedGiftUnknownSubtitle => '此禮物代碼無效或已被領取。';

  @override
  String get embedGiftUnavailable => '禮物無法使用';

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
  String get giftRedeemNotFoundTitle => '找不到禮物';

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
  String get giftCopyLink => '複製禮物連結';

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
    return '將「$guildName」設為靜音';
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
  String get notificationNothing => '不通知';

  @override
  String get notificationSuppressEveryone => '隱藏 @everyone 和 @here';

  @override
  String get notificationSuppressRoles => '禁止所有角色提及';

  @override
  String get notificationMobilePush => '行動裝置推播通知';

  @override
  String get notificationOverrides => '通知設定覆寫';

  @override
  String get notificationSelectChannel => '選擇頻道或類別';

  @override
  String get notificationOnlyAtMentions => '僅提及時通知';

  @override
  String get notificationMuteChannel => '將頻道設為靜音';

  @override
  String get notificationUnmuteChannel => '解除頻道靜音';

  @override
  String get notificationUseCategoryDefault => '使用類別預設設定';

  @override
  String get notificationUseCommunityDefault => '沿用社群預設值';

  @override
  String get notificationNoCategory => '無類別';

  @override
  String get dmMarkAsRead => '標示為已讀';

  @override
  String get dmMuteConversation => '將此私訊設為靜音';

  @override
  String get dmUnmuteConversation => '解除此私訊靜音';

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
  String get dmUserIdCopied => '已複製使用者 ID';

  @override
  String get dmViewProfile => '查看個人檔案';

  @override
  String get dmVoiceCall => '發起語音通話';

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
  String dmInviteSentFor(String communityName) {
    return '已傳送加入 $communityName 的邀請';
  }

  @override
  String get dmInviteSendFailed => '無法傳送邀請。請再試一次。';

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
  String get dmFavoriteDm => '將私訊加入我的最愛';

  @override
  String get dmUnfavoriteDm => '將私訊從我的最愛移除';

  @override
  String get dmFavoriteGroupDm => '將群組私訊加入我的最愛';

  @override
  String get dmUnfavoriteGroupDm => '將群組私訊從我的最愛移除';

  @override
  String get dmChangeFriendNickname => '更改好友的暱稱';

  @override
  String get dmRemoveFriend => '移除好友';

  @override
  String get dmAddFriend => '新增好友';

  @override
  String get dmAcceptFriendRequest => '接受好友邀請';

  @override
  String get dmIgnoreFriendRequest => '忽略好友邀請';

  @override
  String get dmFriendRequestSent => '已送出好友邀請';

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
  String get dmRemoveFriendConfirmTitle => '移除好友';

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
  String get dmFriendRequestSentToast => '已送出好友邀請';

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
  String get dmAddFriends => '新增好友';

  @override
  String get addFriendSheetTitle => '新增好友';

  @override
  String get addFriendUsernameHint => '使用者名稱#0000';

  @override
  String get addFriendUsernameLabel => '好友的使用者名稱';

  @override
  String get addFriendSendRequest => '傳送好友邀請';

  @override
  String get addFriendNoUserFound => '找不到符合該使用者名稱的使用者。';

  @override
  String get addFriendInvalidUsername => '請輸入有效的使用者名稱 (使用者名稱#0000)。';

  @override
  String get addFriendOutgoingSuccess => '已送出好友邀請';

  @override
  String get addFriendClaimTitle => '認領您的帳號';

  @override
  String get addFriendClaimDescription => '請先認領帳號，才能傳送好友邀請。';

  @override
  String get addFriendVerifyTitle => '驗證您的電子郵件';

  @override
  String get addFriendVerifyDescription => '您必須先驗證電子郵件地址，才能傳送好友邀請。';

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
  String get addFriendIncomingStatus => '收到的好友邀請';

  @override
  String get addFriendOutgoingStatus => '已送出好友邀請';

  @override
  String get addFriendViewProfile => '查看個人檔案';

  @override
  String get addFriendAccept => '接受';

  @override
  String get addFriendIgnore => '忽略';

  @override
  String get addFriendAcceptTitle => '接受好友邀請';

  @override
  String get addFriendIgnoreTitle => '忽略好友邀請';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '接受來自 $userName 的好友邀請嗎？';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '要忽略來自 $displayName 的好友邀請嗎？';
  }

  @override
  String get addFriendCancelRequest => '取消邀請';

  @override
  String get addFriendCancelRequestFailed => '無法取消好友邀請。請再試一次。';

  @override
  String get addFriendNotAcceptingRequests => '對方目前不接受好友邀請。';

  @override
  String get addFriendUnblockFirst => '請先解除封鎖，才能傳送好友邀請。';

  @override
  String get addFriendCannotSendToSelf => '您無法傳送好友邀請給自己。';

  @override
  String get addFriendAlreadyFriends => '您已和這位使用者成為好友。';

  @override
  String get addFriendClaimToSend => '完成註冊以傳送好友邀請。';

  @override
  String get addFriendVerifyToSend => '請先驗證您的電子郵件，才能傳送好友邀請。';

  @override
  String get addFriendFriendsListFull => '您的好友名單已滿，或對方的好友名單已滿。請移除一些好友後再試一次。';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => '系統';

  @override
  String get emojiSearchPlaceholder => '尋找您夢寐以求的表情符號';

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
  String get emojiInfoDiscoverableCommunity => '可被探索的社群';

  @override
  String get emojiInfoPrivateCommunity => '私人社群';

  @override
  String get emojiInfoVerifiedCommunity => '已驗證社群';

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
  String get gifPickerNoResultsTitle => '沒有搜尋結果';

  @override
  String get gifPickerNoResultsDescription => '試試其他搜尋字詞';

  @override
  String get gifPickerLoadFailedTitle => '無法載入 GIF';

  @override
  String get gifPickerLoadFailedBody => '請檢查您的連線，然後再試一次。';

  @override
  String get emojiCategoryPeople => '人物';

  @override
  String get emojiCategoryNature => '大自然';

  @override
  String get emojiCategoryFood => '食物與飲料';

  @override
  String get emojiCategoryActivity => '活動';

  @override
  String get emojiCategoryTravel => '旅行與地點';

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
  String get emojiPlutoniumUpsellDismiss => '不要再顯示';

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
  String get externalLinkStripTrackingLabel => '移除網址中的追蹤參數';

  @override
  String get externalLinkStripTrackingDescription =>
      '自動移除您傳送訊息中網址的追蹤參數（例如 utm_source、fbclid、gclid）。在連結傳送給其他人之前先清除。';

  @override
  String get externalLinkTrustAllConfirmTitle => '信任所有外部連結？';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      '這會信任所有外部連結，並略過所有網域的警告。您現有的信任網域將會被取代。此設定較不安全。';

  @override
  String get externalLinkTrustAllConfirmAction => '全部信任';

  @override
  String get externalLinkStopTrustingAllTitle => '要停止信任所有連結嗎？';

  @override
  String get externalLinkStopTrustingAllDescription =>
      '將再次顯示外部連結警告。您需要逐一新增信任的網域。';

  @override
  String get externalLinkStopTrustingAllAction => '停用信任所有連結';

  @override
  String get externalLinkTrustedAllDescription => '所有外部連結皆為信任連結，將不會顯示警告。';

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
  String get cropAvatar => '裁切大頭貼';

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
  String get changeYourFluxerTag => '變更您的使用者名稱';

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
  String get validationAllowedChars => '僅限使用字母 (a-z, A-Z)、數字 (0-9) 和底線 (_)';

  @override
  String get discriminatorPremiumTooltip =>
      '取得 Plutonium 以自訂您的標籤，或在變更使用者名稱時保留它';

  @override
  String get fluxerTagAlreadyTaken => '此使用者名稱已被使用';

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
  String get fluxerTagUpdated => '使用者名稱已更新';

  @override
  String get fluxerTagUpdateFailed => '更新 使用者名稱 失敗。請再試一次。';

  @override
  String get continueAction => '繼續';

  @override
  String get profileCustomizationTitle => '個人檔案自訂';

  @override
  String get profileCustomizationDescription => '編輯個人檔案外觀並查看即時預覽';

  @override
  String get usernameLabel => '使用者名稱';

  @override
  String get claimAccountToChangeFluxerTag => '認領帳號後即可更改使用者名稱';

  @override
  String get changeFluxerTag => '變更使用者名稱';

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
  String get avatarLabel => '大頭貼';

  @override
  String get changeAvatar => '更換大頭貼';

  @override
  String get removeAvatar => '移除大頭貼';

  @override
  String get avatarDescription => 'PNG、JPEG、WebP、GIF。上限 10MB。建議：512×512px';

  @override
  String get bannerLabel => '橫幅';

  @override
  String get changeBanner => '更換封面';

  @override
  String get removeBanner => '移除橫幅';

  @override
  String get bannerDescription =>
      'PNG、JPEG、WebP、GIF。上限 10MB。最小：960×540px (16:9)';

  @override
  String get accentColorLabel => '強調色';

  @override
  String get accentColorDescription => '自訂個人檔案的邊框和橫幅顏色';

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
  String get maskVisionaryDescription => '改將您的 Visionary 顯示為一般訂閱';

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
    return '加入 $productName 的時間';
  }

  @override
  String get unclaimedAccountTitle => '未認領的帳號';

  @override
  String get unclaimedAccountDescription =>
      '您的帳戶尚未認領。若沒有電子郵件和密碼，您可能會失去存取權。立即認領您的帳戶以確保其安全。';

  @override
  String get claimAccount => '認領帳號';

  @override
  String get profileTypeLabel => '個人檔案類型';

  @override
  String get profileTypeGlobal => '全域個人檔案';

  @override
  String get profileTypeGuildDescription =>
      '您正在編輯您的社群專屬個人檔案。此個人檔案只會在此社群中顯示，並會覆寫您的全域個人檔案。';

  @override
  String get communityNicknameLabel => '社群暱稱';

  @override
  String get perGuildPremiumUpsellText =>
      '個人化社群的個人頭像、橫幅、強調色和個人簡介需要 Plutonium。社群暱稱和代名詞對所有人免費。';

  @override
  String get avatarModeInherit => '使用全域個人檔案';

  @override
  String get avatarModeCustom => '使用自訂圖片';

  @override
  String get avatarModeUnset => '不顯示';

  @override
  String get profileSavedToast => '個人檔案已更新';

  @override
  String get profileEditButton => '編輯個人檔案';

  @override
  String get profileNoteLabel => '備註';

  @override
  String get profileNoteVisibility => '（僅您可見）';

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
  String get securityLoginNoEmailSet => '未設定電子郵件地址';

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
  String get securityLoginNoPasswordSet => '未設定密碼';

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
  String get emailChangeTitle => '變更電子郵件';

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
  String get emailChangeNewEmailSubmit => '傳送驗證碼';

  @override
  String get emailChangeVerifyNewTitle => '驗證新電子郵件';

  @override
  String get emailChangeVerifyNewDescription => '請輸入已發送到您新電子郵件地址的驗證碼。';

  @override
  String get emailChangeSuccess => '電子郵件已變更';

  @override
  String get emailChangeInvalidCode => '驗證碼無效或已過期';

  @override
  String get resend => '重新傳送';

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
  String get securityTfaSectionDescription => '為您的帳號多加一層安全防護';

  @override
  String get securityTfaAuthenticatorApp => '驗證器應用程式';

  @override
  String get securityTfaAuthenticatorEnabled => '雙重驗證已啟用';

  @override
  String get securityTfaAuthenticatorDisabled => '使用驗證器應用程式產生雙重驗證碼';

  @override
  String get securityTfaBackupCodes => '備用碼';

  @override
  String get securityTfaBackupCodesDescription => '檢視並管理用於帳號復原的備用碼';

  @override
  String get securityTfaViewCodes => '檢視備用碼';

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
  String get securityPasskeysDeleteTitle => '刪除通行金鑰';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return '確定要刪除密碼金鑰「$name」嗎？';
  }

  @override
  String get securityPasskeyNameTitle => '命名通行金鑰';

  @override
  String get securityPasskeyNameLabel => '通行金鑰名稱';

  @override
  String get securityPasskeyNameHint => '例如：YubiKey、iPhone、公司電腦';

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
  String get securityClaimTitle => '安全性功能';

  @override
  String get securityClaimDescription => '認領您的帳號，即可使用雙重驗證和通行金鑰等安全功能。';

  @override
  String get securityVerifyEmailRequired => '您必須先驗證您的電子郵件地址，才能設定雙重驗證或通行金鑰。';

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
  String get totpDisableSuccess => '雙重驗證已停用';

  @override
  String get backupCodesTitle => '備用碼';

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
  String get backupCodesViewTitle => '查看備用碼';

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
  String get phoneCountryLabel => '國家/地區';

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
  String get phoneCodeDidNotWork => '驗證碼有誤。請檢查後再試一次。';

  @override
  String get phoneTooManyAttempts => '嘗試次數過多。請稍候再試。';

  @override
  String get phoneSmsUnavailable => '目前無法進行簡訊驗證。請稍後再試或聯絡客服。';

  @override
  String get phoneNotEligible => '此帳號無法使用電話驗證。請使用其他方式或聯絡客服。';

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
  String get requiredActionCheckEmailTitle => '請檢查您的電子郵件';

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
  String get dangerZoneDisableDescription => '暫時停用您的帳號。之後登入即可重新啟用。';

  @override
  String get dangerZoneDisableConfirmDescription =>
      '停用您的帳號將會登出所有裝置。您可以隨時透過再次登入來重新啟用您的帳號。';

  @override
  String get dangerZoneDeleteTitle => '刪除帳號';

  @override
  String get dangerZoneDeleteDescription => '永久刪除您的帳號和所有相關資料。此動作無法復原。';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      '刪除帳號前，請先在 Plutonium 設定中取消您的 Plutonium 付費方案。';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => '無法刪除帳號';

  @override
  String get dangerZoneDeleteOwnsCommunities => '您擁有社群時無法刪除帳號。請先轉移以下社群的擁有權：';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return '及另外 $count 個';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return '若要轉移所有權，請前往 $settingsPath 並使用轉移所有權選項。';
  }

  @override
  String get dangerZoneDeleteConfirmDescription => '確定要刪除帳號嗎？此動作會將您的帳號排定永久刪除。';

  @override
  String get dangerZoneDeleteBullet1 => '您可以在 14 天內取消刪除程序';

  @override
  String get dangerZoneDeleteBullet2 => '14 天後，您的帳號將會被永久刪除';

  @override
  String get dangerZoneDeleteBullet3 => '刪除程序一旦完成，您將無法再存取您的帳號';

  @override
  String get dangerZoneDeleteBullet4 => '刪除帳號後，您將無法刪除您已傳送的訊息';

  @override
  String get dangerZoneDeleteDisclaimer =>
      '如果您想匯出資料或先刪除您的訊息，請在繼續之前前往使用者設定中的隱私權儀表板。';

  @override
  String get claimAccountTitle => '認領您的帳號';

  @override
  String get claimAccountDescription =>
      '請新增電子郵件和密碼來認領您的帳號。完成前我們會傳送驗證碼，以確認您的電子郵件。';

  @override
  String get claimAccountEmailLabel => '電子郵件';

  @override
  String get claimAccountPasswordLabel => '密碼';

  @override
  String get claimAccountSendCode => '傳送驗證碼';

  @override
  String get claimAccountVerifyDescription =>
      '請輸入我們寄到您電子郵件的驗證碼。驗證碼確認後，您的密碼就會設定完成。';

  @override
  String get claimAccountSuccess => '帳號認領成功';

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
  String get authorizedAppsEmptyDescription => '您尚未授權任何應用程式存取您的帳號。';

  @override
  String get authorizedAppsLoadError => '載入已授權應用程式失敗';

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
  String get authorizedAppsScopeIdentify => '存取您的基本個人檔案資訊（使用者名稱、大頭貼等）';

  @override
  String get authorizedAppsScopeEmail => '查看您的電子郵件地址';

  @override
  String get authorizedAppsScopeGuilds => '查看您已加入的社群';

  @override
  String get authorizedAppsScopeConnections => '查看您已連結的帳號';

  @override
  String get authorizedAppsScopeBot => '將機器人新增至社群並授予要求的權限';

  @override
  String get authorizedAppsScopeAdmin => '存取管理員端點';

  @override
  String get applicationsTitle => '應用程式';

  @override
  String get applicationsCreate => '建立應用程式';

  @override
  String get applicationsCreateSubmit => '建立';

  @override
  String get applicationsCreateClaimTooltip => '認領您的帳號以建立應用程式。';

  @override
  String applicationsDocsLink(String domain) {
    return '閱讀說明文件（$domain）';
  }

  @override
  String get applicationsLoadError => '無法載入應用程式';

  @override
  String get applicationsLoadErrorDescription => '請檢查您的連線，然後再試一次。';

  @override
  String get applicationsEmptyTitle => '還沒有任何應用程式';

  @override
  String applicationsEmptyDescription(String apiName) {
    return '建立您的第一個應用程式，以開始使用 $apiName。';
  }

  @override
  String applicationsCreated(String date) {
    return '建立於 $date';
  }

  @override
  String get applicationsName => '應用程式名稱';

  @override
  String get applicationsNameHint => '我的應用程式';

  @override
  String get applicationsNameRequired => '請輸入應用程式名稱';

  @override
  String get applicationsBackToList => '返回列表';

  @override
  String get applicationsDetailLoadError => '無法載入此應用程式';

  @override
  String get applicationsDetailLoadErrorDescription => '請再試一次，或返回應用程式清單。';

  @override
  String get applicationsId => '應用程式 ID';

  @override
  String get applicationsCopyId => '複製 ID';

  @override
  String get applicationsSecretsTitle => '密鑰與權杖';

  @override
  String get applicationsSecretsDescription => '請妥善保管。重新產生金鑰會導致現有的整合服務中斷。';

  @override
  String get applicationsClientSecret => '用戶端密鑰';

  @override
  String get applicationsBotToken => '機器人權杖';

  @override
  String get applicationsRegenerate => '重新產生';

  @override
  String get applicationsRegenerateClientSecretTitle => '要重新產生用戶端密鑰嗎？';

  @override
  String get applicationsRegenerateBotTokenTitle => '要重新產生機器人權杖嗎？';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      '重新產生會讓目前的密鑰失效。請更新所有使用舊值的程式碼。';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      '重新產生會讓目前的權杖失效。請更新所有使用舊值的程式碼。';

  @override
  String get applicationsClientSecretRegenerated =>
      '用戶端密鑰已重新產生。請更新任何使用舊密鑰的程式碼。';

  @override
  String get applicationsBotTokenRegenerated => '機器人權杖已重新產生。請更新所有使用舊權杖的程式碼。';

  @override
  String get applicationsRegenerateFailed => '無法重新產生密鑰';

  @override
  String get applicationsInfoTitle => '應用程式資訊';

  @override
  String get applicationsInfoDescription => '基本設定和允許的重新導向 URI。';

  @override
  String get applicationsPublicBot => '公開機器人';

  @override
  String get applicationsPublicBotDescription => '允許任何人邀請此機器人至他們的社群。';

  @override
  String get applicationsRequireCodeGrant => '需要 OAuth2 授權碼授予';

  @override
  String get applicationsRequireCodeGrantDescription =>
      '邀請此機器人時，需要重新導向 URI 和授權碼。';

  @override
  String get applicationsRedirectUris => '重新導向 URI';

  @override
  String get applicationsAddRedirect => '新增重新導向';

  @override
  String get applicationsDeleteRedirect => '刪除重新導向 URI';

  @override
  String get applicationsBotProfileTitle => '機器人個人檔案';

  @override
  String get applicationsBotProfileDescription => '機器人的大頭貼、標籤和詳細個人檔案。';

  @override
  String get applicationsBotAvatar => '機器人大頭貼';

  @override
  String get applicationsUsernameRequired => '必須填寫使用者名稱';

  @override
  String get applicationsUsernameTooLong => '使用者名稱最多 32 個字元';

  @override
  String get applicationsUsernameInvalid => '使用者名稱只能包含字母、數字和底線';

  @override
  String get applicationsBotUsername => '機器人使用者名稱';

  @override
  String get applicationsDiscriminator => '識別碼';

  @override
  String get applicationsBotBio => '機器人簡介';

  @override
  String get applicationsBotBioHint => '一個能做許多驚人事情的實用機器人！';

  @override
  String get applicationsNoBotBanner => '沒有機器人橫幅';

  @override
  String get applicationsFriendlyBot => '友善的機器人';

  @override
  String get applicationsFriendlyBotDescription => '允許使用者傳送好友邀請給此機器人，以便手動核准。';

  @override
  String get applicationsManualFriendApproval => '需要手動核准好友';

  @override
  String get applicationsManualFriendApprovalDescription =>
      '此機器人收到的好友邀請需要手動核准。';

  @override
  String get applicationsOauthBuilderTitle => 'OAuth2 URL 產生器';

  @override
  String get applicationsOauthBuilderDescription => '使用範圍和權限建構授權 URL。';

  @override
  String get applicationsScopes => '權限';

  @override
  String get applicationsRedirectUri => '重新導向 URI';

  @override
  String get applicationsSelectRedirectUri => '選取重新導向 URI';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      '此機器人需要 OAuth2 授權碼，因此必須填寫重新導向 URI。';

  @override
  String get applicationsRedirectRequiredScopes => '當不只使用機器人範圍時，需要重新導向 URI。';

  @override
  String get applicationsBotPermissions => '機器人權限';

  @override
  String get applicationsAuthorizeUrl => '授權網址';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      '選取授權範圍（如有需要，請一併選取重新導向 URI）';

  @override
  String get applicationsCopyAuthorizeUrl => '複製授權 URL';

  @override
  String get applicationsCopiedUrl => '已將網址複製到剪貼簿';

  @override
  String get applicationsDangerTitle => '危險區域';

  @override
  String get applicationsDangerSubtitle => '此動作無法復原。移除應用程式也會一併刪除其機器人。';

  @override
  String get applicationsDangerHelper => '一旦刪除，應用程式和其憑證將永久移除。';

  @override
  String get applicationsDelete => '刪除應用程式';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return '您確定要刪除 $name 嗎？此動作無法復原。所有相關資料，包括機器人使用者，都將永久刪除。';
  }

  @override
  String get applicationsDeleteFailed => '無法刪除應用程式';

  @override
  String get applicationsUpdated => '應用程式已成功更新';

  @override
  String get applicationsNoChanges => '沒有要儲存的變更';

  @override
  String get applicationsSearchBots => '應用程式與機器人';

  @override
  String get applicationsSearchBotsDescription => '為您的帳號建立及管理應用程式和機器人';

  @override
  String get applicationsSearchInfoDescription => '編輯應用程式基本資訊和重新導向 URI';

  @override
  String get applicationsSearchBotProfileDescription =>
      '編輯機器人頭像、標籤、個人簡介、橫幅和好友邀請行為';

  @override
  String get applicationsSearchOauthDescription => '使用範圍、重新導向和機器人權限來建立授權網址';

  @override
  String get applicationsSearchSecretsDescription => '檢視並重新產生用戶端密鑰和機器人權杖';

  @override
  String get applicationsSearchBotsKeyword => '機器人';

  @override
  String get applicationsSearchDocumentation => '說明文件';

  @override
  String get privacyPendingDeletionTitle => '待刪除';

  @override
  String get blockedUsersTitle => '已封鎖的使用者';

  @override
  String get blockedUsersDescription => '被您封鎖的使用者無法傳送好友邀請給您，也無法直接傳送訊息給您。';

  @override
  String get blockedUsersEmptyTitle => '沒有已封鎖的使用者';

  @override
  String get blockedUsersEmptyDescription => '您還沒有封鎖任何人。';

  @override
  String get blockedUsersLoadError => '無法載入已封鎖的使用者';

  @override
  String get blockedUsersUnblock => '解除封鎖';

  @override
  String get blockedUsersUnblockTitle => '解除封鎖';

  @override
  String blockedUsersUnblockDescription(String username) {
    return '確定要解除封鎖 $username 嗎？';
  }

  @override
  String get blockedUsersCopyTag => '複製使用者名稱';

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
  String get userProfileEditProfile => '編輯個人檔案';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName 員工';
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
    return '$productName 錯誤獵人';
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
    return '$productName 遠見者';
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
  String get userProfileNoMutualFriends => '沒有共同好友。';

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
  String get userProfileNoteVisibility => '（僅您可見）';

  @override
  String get userProfileNoteSave => '儲存';

  @override
  String get userProfileNoteDelete => '刪除';

  @override
  String get userProfileNoteEmpty => '點擊以新增記事';

  @override
  String get userProfileMemberSince => '加入時間';

  @override
  String get userProfileAboutMe => '關於我';

  @override
  String get userProfileRoles => '身分組';

  @override
  String get memberRoleAdd => '新增身分組';

  @override
  String memberRoleRemove(String roleName) {
    return '移除「$roleName」身分組';
  }

  @override
  String get userProfileNoRolesInCommunity => '此使用者在此社群中沒有任何身分組。';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return '還沒有任何身分組。請在$rolesSettingsPath新增身分組';
  }

  @override
  String get memberRolesNoRolesAvailable => '沒有可用的身分組';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return '此社群目前沒有可指派的角色，但你可以在 $rolesSettingsPath 中建立新角色。';
  }

  @override
  String get guildSettingsTitle => '社群設定';

  @override
  String get guildSettingsRolesTab => '身分組';

  @override
  String get memberRolesConfirmOk => '確定';

  @override
  String get userProfileLocalTime => '當地時間';

  @override
  String get profileLocalTimeSettingsTitle => '個人檔案當地時間';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return '設定您的時區，以便 $productName 在日光節約時間變更時，可以保持您的 UTC 偏移量為最新狀態。其他人只能看到您的 UTC 偏移量，而不能看到您確切的時區識別碼。';
  }

  @override
  String get profileLocalTimeEditButton => '編輯個人檔案當地時間';

  @override
  String get profileLocalTimeTimezoneLabel => '時區';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return '選擇時區，$productName 將使用該時區來計算您的 UTC 偏移量，以顯示個人檔案中的當地時間。';
  }

  @override
  String get profileLocalTimeSearchTimezones => '搜尋時區';

  @override
  String get profileLocalTimeNotSet => '未設定';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return '當您選擇分享個人檔案中的當地時間時，其他人只能看到您目前的 UTC 時區偏移量。他們不會看到您的確切時區識別碼，例如 $timezoneIdentifierExample。$productName 會儲存該識別碼，以便在日光節約時間變更時自動更新偏移量。';
  }

  @override
  String get profileLocalTimePrivacyEveryone => '所有人';

  @override
  String get profileLocalTimePrivacyEveryoneDesc => '允許所有能檢視您完整個人檔案的人查看您的當地時間';

  @override
  String get profileLocalTimePrivacyFriends => '好友';

  @override
  String get profileLocalTimePrivacyFriendsDesc => '允許好友查看您的當地時間';

  @override
  String get profileLocalTimePrivacyCommunityMembers => '社群成員';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      '允許您所屬社群的成員查看您的當地時間';

  @override
  String get userProfileSameTimeAsYou => '與您的時區相同';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '比您快 $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '比您晚 $duration';
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
  String get userProfileViewCommunityProfile => '查看社群個人檔案';

  @override
  String get userProfileBlockUser => '封鎖使用者';

  @override
  String get userProfileUnblockUser => '解除封鎖';

  @override
  String get userProfileRemoveFriend => '移除好友';

  @override
  String get userProfileBlockConfirmTitle => '封鎖使用者';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return '確定要封鎖 $username 嗎？';
  }

  @override
  String get userProfileUnblockConfirmTitle => '解除封鎖';

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
  String get userProfileBan => '停權';

  @override
  String get userProfileTimeout => '暫時禁言';

  @override
  String get userProfileRemoveTimeout => '解除禁言';

  @override
  String get userProfileTransferOwnership => '轉移擁有權';

  @override
  String get userProfileReportMessage => '檢舉訊息';

  @override
  String get userProfileReportUserProfile => '檢舉個人檔案';

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
  String get userProfileBanDurationLabel => '停權期間';

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
  String get userProfileBanReasonHint => '輸入停權原因';

  @override
  String get userProfileBanSubmit => '停權成員';

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
  String get userProfileTransferSuccess => '已轉移擁有權';

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
  String get durationCustom => '自訂…';

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
  String get typingIndicatorMultiple => '多人正在輸入中…';

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
    return '$username，很高興有您加入！';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return '歡迎，$username！別客氣，把這裡當自己家。';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return '哈囉，$username！很高興有您加入。';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return '哈囉，$username！隨時都可以開始聊天喔。';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return '哈囉 $username，很高興在這裡見到您！';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return '哈囉，$username！希望您玩得愉快。';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return '哈囉，$username，歡迎加入！';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return '很高興您來了，$username！';
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
    return '歡迎，$username！很高興有您加入。';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return '歡迎，$username！希望您在這裡玩得愉快。';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return '歡迎，$username！您的下一段對話就從這裡開始。';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return '歡迎，$username。很高興有您在這裡。';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return '很高興見到您，$username！歡迎加入。';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return '$username，您來了！很高興有您加入。';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return '$username，歡迎上線！我們開始吧。';
  }

  @override
  String get relativeTimeShortNow => '剛剛';

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
  String get linkedDevicesCurrentDevice => '目前使用的裝置';

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
  String get linkedDevicesViewDetails => '查看詳情';

  @override
  String get linkedDevicesDetailsTitle => '裝置詳細資訊';

  @override
  String get linkedDevicesDetailsDevice => '裝置';

  @override
  String get linkedDevicesDetailsClient => '用戶端';

  @override
  String get linkedDevicesDetailsLocation => '地點';

  @override
  String get linkedDevicesDetailsIp => 'IP 位址';

  @override
  String get linkedDevicesDetailsLastUsed => '上次使用';

  @override
  String get linkedDevicesCurrentSession => '目前的工作階段';

  @override
  String get linkedDevicesUnknown => '不明';

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
    return '來自 $productName 團隊的系統公告。您無法在此回覆。';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled => '此社群的訊息功能已暫時停用。';

  @override
  String get channelComposerBarrierTimedOut => '您已被禁言。在禁言結束前，訊息、反應和語音功能將會暫停。';

  @override
  String get channelComposerBarrierUnclaimedAccount => '您必須先認領帳號，才能在這個社群傳送訊息。';

  @override
  String get channelComposerBarrierUnverifiedEmail => '您需要驗證電子郵件才能在這個社群傳送訊息。';

  @override
  String get channelComposerBarrierAccountTooNew => '您的帳號建立時間太短，無法在此社群傳送訊息。';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      '您加入此社群的時間還不夠長，因此無法傳送訊息。';

  @override
  String get channelComposerBarrierNoPhoneNumber => '您需要驗證電話號碼才能在這個社群傳送訊息。';

  @override
  String get channelComposerBarrierVerifyEmail => '驗證電子郵件';

  @override
  String get channelComposerBarrierVerifyPhone => '驗證電話號碼';

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
  String get voiceMessageMicPermissionDenied => '無法開始錄音。請允許麥克風存取權限。';

  @override
  String get voiceMessageRecordingNotSupported => '此裝置不支援語音錄製。';

  @override
  String get voiceMessageMicInUse => '請離開語音通話才能錄製語音訊息。';

  @override
  String get voiceMessageRecordingFailed => '錄音失敗。請再試一次。';

  @override
  String get voiceMessageSendFailed => '無法傳送語音訊息。請再試一次。';

  @override
  String get voiceMessageRecordingHint => '請開始說話。完成後請按「停止」，您之後可以再修剪。';

  @override
  String get voiceMessageReviewHint => '拖曳把手來修剪，然後按下「傳送」。';

  @override
  String get voiceMessageStop => '停止';

  @override
  String get voiceMessageStartRecording => '開始錄音';

  @override
  String get voiceMessageRerecord => '重新錄音';

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

    return '選取範圍必須至少為 $secondsString 秒。';
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
  String get chatMediaSpoilerRevealLabel => '顯示劇透內容';

  @override
  String get matureMediaRevealButton => '顯示';

  @override
  String get matureMediaRevealHint => '點擊顯示';

  @override
  String get matureContentTitle => '成人內容';

  @override
  String get matureCommunityTitle => '成人社群';

  @override
  String get matureCategoryTitle => '成人內容類別';

  @override
  String get matureChannelTitle => '成人頻道';

  @override
  String get communityContentWarningTitle => '社群內容警示';

  @override
  String get categoryContentWarningTitle => '類別內容警告';

  @override
  String get channelContentWarningTitle => '頻道內容警告';

  @override
  String get defaultContentWarningBody => '此內容含有敏感資訊。';

  @override
  String get matureCommunityBody => '此社群標示為成人內容，可能包含不適合部分使用者的內容。';

  @override
  String get matureCategoryBody => '此類別標示為成人內容，可能包含不適合部分使用者的內容。';

  @override
  String get matureChannelBody => '此頻道標示為成人內容，可能包含不適合部分使用者的內容。';

  @override
  String get matureVoiceChannelBody => '此語音頻道標示為成人內容，可能包含不適合部分使用者的內容。';

  @override
  String get matureLinkChannelBody => '此連結頻道已標示為成人內容，可能會開啟不適合部分使用者的內容。';

  @override
  String get matureCommunityUnavailableBody => '您的帳號無法使用此成人社群。';

  @override
  String get matureCategoryUnavailableBody => '您的帳號無法使用此成人內容類別。';

  @override
  String get matureChannelUnavailableBody => '您的帳號無法使用此成人頻道。';

  @override
  String get matureContentProceedButton => '繼續';

  @override
  String get matureContentUnderstandButton => '我了解了';

  @override
  String get matureContentOpenLinkButton => '開啟連結';

  @override
  String get sensitiveContentSectionTitle => '敏感內容';

  @override
  String get sensitiveContentSectionDescription => '控制在不同情境下如何篩選成人或敏感媒體';

  @override
  String get sensitiveContentFriendDmLabel => '來自好友的私訊';

  @override
  String get sensitiveContentNonFriendDmLabel => '來自其他人的私訊';

  @override
  String get sensitiveContentGuildLabel => '社群頻道中的訊息';

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
  String get connectionsTitle => '連結帳號';

  @override
  String connectionsDescription(String productName) {
    return '連結外部帳號和網域至您的 $productName 個人檔案。已驗證的連線將顯示在您的個人檔案上供他人查看。';
  }

  @override
  String get connectionsEmptyTitle => '尚未連結任何帳號';

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
  String get connectionsAddDomainAriaLabel => '新增網域連結';

  @override
  String get connectionEdit => '編輯';

  @override
  String get connectionRemove => '移除';

  @override
  String get connectionVerifiedLabel => '此連結帳號已驗證。';

  @override
  String get connectionUnverifiedLabel => '此連結帳號尚未驗證。';

  @override
  String get connectionAddTitle => '新增連結';

  @override
  String get connectionTypeLabel => '連結類型';

  @override
  String get connectionHandleLabel => '帳號';

  @override
  String get connectionDomainLabel => '網域';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => '您已經有這個連線了。';

  @override
  String get connectionConnectBluesky => '透過 Bluesky 連線';

  @override
  String get connectionContinue => '繼續';

  @override
  String get connectionVerifyTitle => '驗證連線';

  @override
  String get connectionVerifyInstructions => '使用下方的紀錄來證明網域擁有權。';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT 記錄';

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
  String get connectionBack => '返回';

  @override
  String get connectionEditTitle => '編輯連結';

  @override
  String get connectionEditDescription => '選擇誰可以在您的個人檔案上看到此連結。';

  @override
  String get connectionVisibilityEveryone => '所有人';

  @override
  String get connectionVisibilityEveryoneDesc => '允許所有人查看您個人檔案上的此連結';

  @override
  String get connectionVisibilityFriends => '好友';

  @override
  String get connectionVisibilityFriendsDesc => '允許好友查看此連結';

  @override
  String get connectionVisibilityCommunityMembers => '社群成員';

  @override
  String get connectionVisibilityCommunityMembersDesc => '允許您所屬社群的成員查看此連結';

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
  String get lookAndFeelThemeSectionTitle => '主題';

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
  String get lookAndFeelThemeDark => '深色主題';

  @override
  String get lookAndFeelThemeDarkLegacy => '深色（舊版）主題';

  @override
  String get lookAndFeelThemeCoal => '煤炭主題';

  @override
  String get lookAndFeelThemeLight => '淺色主題';

  @override
  String get lookAndFeelThemeSystem => '系統主題';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel => '跨裝置同步主題';

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
  String get lookAndFeelChatFontScalingDescription => '調整聊天區域的文字大小。';

  @override
  String get lookAndFeelChatFontSizeLabel => '聊天字體大小';

  @override
  String get lookAndFeelAppZoomTitle => '應用程式縮放等級';

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
  String get lookAndFeelChatWallpaperStarfieldLabel => '星空';

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
  String get lookAndFeelHideUserAvatarsLabel => '隱藏使用者大頭貼';

  @override
  String get lookAndFeelInterfaceTitle => '介面';

  @override
  String get lookAndFeelInterfaceDescription => '自訂介面元素和行為。';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle => '頻道列表輸入提示';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      '選擇當有人在頻道中輸入時，輸入指示器如何在頻道列表中顯示。';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName => '輸入指示器 + 頭像';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      '在頻道列表中顯示帶有使用者頭像的輸入狀態';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => '只顯示輸入狀態';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      '只顯示正在輸入提示，不顯示大頭貼';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => '隱藏';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      '不在頻道列表中顯示輸入狀態';

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
  String get guildUnavailableDescription => '發生錯誤，我們正在處理中。';

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
  String get lookAndFeelChannelListSectionDescription => '控制頻道列表中已靜音頻道的未讀指示行為。';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel => '在已靜音的頻道上顯示未讀標記';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      '啟用時，靜音頻道左側會顯示淡化的未讀指示器。提及訊息仍會顯示，不受此設定影響。';

  @override
  String get lookAndFeelActiveNowSectionTitle => '目前在線上';

  @override
  String get lookAndFeelActiveNowSectionDescription => '控制目前活躍在應用程式中的顯示方式。';

  @override
  String get lookAndFeelShowActiveNowLabel => '在主畫面顯示「目前在線上」';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      '在主畫面顯示「目前在線上」狀態，讓您看到正在語音聊天的好友。您會看到預覽、所在頻道、誰已經在裡面，以及快速加入的方式。';

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
      '您的個人空間，可快速存取您喜愛的頻道、私訊和群組。點選任何頻道上的星號即可將其新增到這裡。';

  @override
  String get favoritesWelcomeTip => '不喜歡？隨時都能關閉。';

  @override
  String get favoritesDisableButton => '停用我的最愛';

  @override
  String get favoritesAddedToast => '已加入我的最愛';

  @override
  String get favoritesRemovedToast => '已從我的最愛移除';

  @override
  String get favoritesHiddenToast => '我的最愛已隱藏';

  @override
  String get favoritesMute => '將最愛設為靜音';

  @override
  String get favoritesUnmute => '解除最愛靜音';

  @override
  String get favoritesHeaderMenu => '我的最愛選單';

  @override
  String get favoritesCreateCategory => '建立類別';

  @override
  String get favoritesCategoryNameLabel => '類別名稱';

  @override
  String get favoritesHideMutedChannels => '隱藏已靜音的頻道';

  @override
  String get favoritesShowMutedChannels => '顯示已靜音的頻道';

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
  String get favoritesAddToSavedMedia => '新增至已儲存的媒體';

  @override
  String get favoritesRemoveFromSavedMedia => '從已儲存的媒體中移除';

  @override
  String get favoritesAddToUrlOnlyGifFavorites => '加入僅限網址的 GIF 最愛';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites => '從僅限網址的 GIF 最愛中移除';

  @override
  String get savedMediaAddTitle => '新增至已儲存的媒體';

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
  String get favoritesDirectMessageSubtitle => '私訊';

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
  String get messagesMediaDefaultHideMutedChannelsLabel => '預設隱藏已靜音的頻道';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      '加入新社群時，側邊欄中自動隱藏已噤頻道';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle => '預設隱藏已靜音的頻道？';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      '您新加入的社群會自動隱藏已靜音的頻道。您想將此設定套用到所有現有社群嗎？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      '要停止預設隱藏已設為靜音的頻道嗎？';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      '您新加入的社群將不再自動隱藏已靜音的頻道。您是否也想在所有現有社群中顯示已靜音的頻道？';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction => '套用到所有社群';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction => '在所有社群中顯示';

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
    return '直接上傳到 $productName 時';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => '連結預覽';

  @override
  String get messagesMediaLinkPreviewsSectionDescription => '控制網站連結在聊天中的預覽方式';

  @override
  String get messagesMediaLinkPreviewsToggleLabel => '顯示嵌入內容和網站連結預覽';

  @override
  String get messagesMediaReactionsSectionTitle => '反應';

  @override
  String get messagesMediaReactionsSectionDescription => '設定訊息的表情符號回應';

  @override
  String get messagesMediaReactionsToggleLabel => '在訊息上顯示表情符號反應';

  @override
  String get messagesMediaSpoilersSectionTitle => '劇透內容';

  @override
  String get messagesMediaSpoilersSectionDescription => '控制劇透內容的顯示方式';

  @override
  String get messagesMediaSpoilersRadioLabel => '顯示劇透內容';

  @override
  String get messagesMediaSpoilersOnClickName => '點擊時';

  @override
  String get messagesMediaSpoilersOnClickDescription => '點擊後顯示劇透內容';

  @override
  String get messagesMediaSpoilersIfModeratorName => '在我管理的頻道中';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      '在你擁有「管理訊息」權限的頻道中一律顯示劇透內容';

  @override
  String get messagesMediaSpoilersAlwaysName => '總是';

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
  String get messagesMediaGifsAutoSendLabel => '選取後自動傳送 GIF';

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
  String get messagesMediaEditingSectionTitle => '編輯訊息';

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
  String get accessibilityShowAltTextOnImagesLabel => '在圖片上顯示替代文字';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      '當圖片有替代文字時，顯示在圖片下方。';

  @override
  String get accessibilityDimStrikethroughTextLabel => '調暗刪除線文字';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => '私訊預覽';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      '控制私訊列表中顯示訊息預覽的時間。';

  @override
  String get accessibilityDmMessagePreviewModeLabel => '私訊預覽模式';

  @override
  String get accessibilityDmMessagePreviewAllName => '所有訊息';

  @override
  String get accessibilityDmMessagePreviewAllDescription => '顯示所有私訊對話的訊息預覽';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => '只顯示未讀私訊';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      '只顯示有未讀訊息的私訊預覽';

  @override
  String get accessibilityDmMessagePreviewNoneName => '無';

  @override
  String get accessibilityDmMessagePreviewNoneDescription => '不在私訊列表顯示訊息預覽';

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
  String get accessibilityTtsGroupDescription => '選擇文字朗讀的速度。';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => '語音播放速度';

  @override
  String get accessibilityTtsPlaySampleLabel => '播放範例';

  @override
  String get accessibilityTtsSilenceSampleLabel => '停止播放範例';

  @override
  String get accessibilityPreviewButtonLabel => '預覽按鈕';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return '這是連結的顯示方式：$linkPreviewExampleUrl';
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
  String get accessibilityShowContextMenuShortcutsLabel => '顯示右鍵選單的快速鍵';

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
    return '當 $productName 為作用中視窗時自動播放 GIF';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion => '即使開啟了減少動態效果，仍會播放。';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      '因減少動態效果而暫停。開啟即可繼續播放動態表情符號。';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      '因減少動態效果而暫停。開啟即可繼續播放 GIF。';

  @override
  String get accessibilityGifDefaultsOffOnMobile => '為節省電力與數據用量，行動裝置預設為關閉。';

  @override
  String get accessibilityStickerAnimationsTitle => '貼圖動畫';

  @override
  String get accessibilityStickerAnimationPreferenceLabel => '貼圖動畫偏好設定';

  @override
  String get accessibilityStickerAlwaysAnimateName => '一律播放動畫';

  @override
  String get accessibilityStickerAlwaysAnimateDescription => '貼圖一律播放動畫';

  @override
  String get accessibilityStickerAnimateOnInteractionName => '互動時播放動畫';

  @override
  String get accessibilityStickerAnimateOnPressDescription => '貼圖會在您點擊時播放動畫';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      '將滑鼠游標移到貼圖上或與貼圖互動時，貼圖會播放動畫';

  @override
  String get accessibilityStickerNeverAnimateName => '永不播放動畫';

  @override
  String get accessibilityStickerNeverAnimateDescription => '貼圖一律不會播放動畫';

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
  String get accessibilitySyncReducedMotionWithSystemLabel => '與系統同步減少動態效果設定';

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
      '動態表情符號、GIF 和貼圖仍可在「動畫」分頁中自行設定。';

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
      '博士，我來自未來。我搭乘您發明的時光機來到這裡。現在，我需要您的幫助才能回到 1985 年。';

  @override
  String get accessibilityTtsUnsupportedDescription => '此裝置無法使用語音合成。';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      '語音播放失敗。請再試一次，或檢查音訊輸出是否正常運作。';

  @override
  String get ttsSubstitutionUnknownUser => '不明使用者';

  @override
  String get ttsSubstitutionUnknownRole => '不明身分組';

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
    return '$authorName回覆 $replyAuthorName：「$formatted」';
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
    return '$username 在這個頻道釘選了一則訊息。';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username 將 $userName 加入群組。';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username 將某人加入了群組。';
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
    return '$username 將某人從群組中移除。';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username 將頻道名稱更改為「$newName」。';
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
    return '$username 已開始通話。';
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
  String get systemCallDurationFewSeconds => '幾秒';

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
  String get voiceConnectionConfirmJustJoin => '直接加入（保留其他連線）';

  @override
  String get voiceConnectionConfirmDoNothing => '不要，我不想加入';

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
  String get voiceChannelJoinConnect => '連線語音';

  @override
  String get voiceChannelNoConnectPermission => '您沒有權限加入此語音頻道';

  @override
  String get voiceChannelE2eeEncrypted => '麥克風、相機和螢幕分享內容已進行端對端加密。';

  @override
  String get voiceCallE2eeEncrypted => '麥克風、相機和螢幕分享內容已進行端對端加密。';

  @override
  String get voiceChannelE2eeBroken => '由於語音頻道中有不支援的參與者，因此無法使用端對端加密。';

  @override
  String get voiceCallE2eeBroken => '由於通話中有不支援的參與者，因此無法使用端對端加密。';

  @override
  String get voiceE2eeUpdateRequired => '加入此加密通話前必須更新此用戶端。';

  @override
  String get voiceMicPublishFailedStayConnected => '無法啟動您的麥克風。您仍在通話中。';

  @override
  String get voiceChannelStatusConnecting => '連線中…';

  @override
  String get voiceChannelStatusConnected => '已連線';

  @override
  String get voiceChannelStatusError => '錯誤';

  @override
  String get voiceParticipantTooltipMobileDevice => '行動裝置';

  @override
  String get voiceParticipantTooltipDesktopDevice => '電腦裝置';

  @override
  String get voiceParticipantTooltipCommunityMuted => '社群靜音';

  @override
  String get voiceParticipantTooltipMuted => '已靜音';

  @override
  String get voiceParticipantTooltipCommunityDeafened => '社群禁聲';

  @override
  String get voiceParticipantTooltipDeafened => '已耳機靜音';

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
  String get voiceControlDeafen => '耳機靜音';

  @override
  String get voiceControlUndeafen => '解除耳機靜音';

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
  String get voiceAudioProcessing => '音訊處理';

  @override
  String get voiceConnectionSessionSection => '工作階段';

  @override
  String get voiceConnectionDurationLabel => '時間';

  @override
  String get voiceConnectionParticipantsLabel => '參與者';

  @override
  String get voiceConnectionNetworkSection => '網路';

  @override
  String get voiceConnectionPingLabel => 'Ping';

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
  String get voiceParticipantMenuCommunityMute => '社群麥克風靜音';

  @override
  String get voiceParticipantMenuCommunityDeafen => '社群耳機靜音';

  @override
  String get voiceParticipantMenuUserVolume => '使用者音量';

  @override
  String get voiceParticipantMenuStreamVolume => '直播音量';

  @override
  String get voiceParticipantMenuStopStreaming => '停止直播';

  @override
  String get voiceParticipantModerationFailed => '無法更新該成員。請再試一次。';

  @override
  String get voiceControlChat => '聊天';

  @override
  String get voiceCallViewModeLabel => '檢視';

  @override
  String get voiceCallViewModeGrid => '網格';

  @override
  String get voiceCallViewModeFocus => '焦點';

  @override
  String get voicePanelSettingsSectionTitle => '語音設定';

  @override
  String get voicePanelUseEarpieceLabel => '使用聽筒';

  @override
  String get voiceOutputRouteSpeaker => '揚聲器';

  @override
  String get voiceOutputRouteEarpiece => '聽筒';

  @override
  String get voiceOutputRouteHeadset => '耳機';

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
  String get voiceWatchStream => '觀看直播';

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
  String get dmVoiceStripStatusConnecting => '連線中…';

  @override
  String get dmVoiceStripStatusInCall => '通話中';

  @override
  String get dmVoiceEmbeddedFallbackTitle => '語音通話';

  @override
  String get dmVoiceCallBarConnecting => '連線中…';

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
  String get notificationsFilterUnreads => '未讀訊息';

  @override
  String get notificationsFilterMentions => '提及';

  @override
  String get notificationsBookmarksTooltip => '書籤';

  @override
  String get notificationsMentionFilterTooltip => '篩選提及訊息';

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
  String get notificationsNoUnreadBody => '您都看完了。';

  @override
  String get notificationsNoMentionsTitle => '沒有最近被提及的訊息';

  @override
  String get notificationsNoMentionsBody => '所有提及您的訊息將在此顯示 7 天。';

  @override
  String get notificationsMentionsEndTitle => '您已看到底囉';

  @override
  String get notificationsMentionsEndBody => '您已看過所有近期提及。別擔心，很快就會有更多出現。';

  @override
  String get notificationsJump => '跳轉';

  @override
  String get notificationsRemoveMentionTooltip => '移除提及';

  @override
  String get notificationsViewAllUnread => '查看所有未讀訊息';

  @override
  String get notificationsMarkAsRead => '標示為已讀';

  @override
  String get notificationsExpand => '展開';

  @override
  String get notificationsCollapse => '收合';

  @override
  String get notificationsMessageUnavailable => '無法載入此訊息。';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining 個字元剩餘';
  }

  @override
  String get characterCounterTooLong => '訊息過長';

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
  String get chatSendFailureUnclaimedDm => '您的訊息無法送達。您需要先認領帳號才能傳送私訊。';

  @override
  String get chatSendFailureUnclaimedGeneral => '您的訊息無法送達。您需要先認領帳號才能傳送訊息。';

  @override
  String get chatSendFailureContentBlocked =>
      '您的訊息無法送達，因為它已被我們的安全系統標記。如果您認為這是錯誤，請聯絡客服。';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      '您的訊息無法送達，因為它已被我們的安全系統標記。如果您認為這是錯誤，請聯絡此實例的管理員。';

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
  String get privacyDashboardFriendsAndDirectMessagesSection => '好友與私訊';

  @override
  String get privacyDashboardActivitySharingSection => '活動分享';

  @override
  String get privacyDashboardSensitiveContentSection => '敏感內容';

  @override
  String get privacyDashboardDataExportSection => '資料匯出';

  @override
  String get privacyDashboardDataDeletionSection => '資料刪除';

  @override
  String get privacyDashboardProfilePrivacyTitle => '誰能看見您的完整個人檔案';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities => '好友和所有社群';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      '您的完整個人檔案會對好友和您社群中的所有人顯示';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities => '僅限好友和小型社群';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      '您的完整個人檔案會對好友，以及您所屬且成員數不超過 200 人的社群成員顯示';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => '僅限好友';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      '您的完整個人檔案只會對您的好友顯示';

  @override
  String get privacyDashboardFriendRequestsTitle => '好友邀請';

  @override
  String get privacyDashboardFriendRequestsEveryone => '所有人';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc => '允許任何人傳送好友邀請給你';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => '好友的好友';

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
  String get privacyDashboardDirectMessagesMembers => '允許社群成員傳送私訊';

  @override
  String get privacyDashboardDirectMessagesMembersDesc => '允許你所在社群的成員傳送私人訊息給你';

  @override
  String get privacyDashboardDirectMessagesBots => '允許社群機器人傳送私訊';

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
  String get privacyDashboardIncomingCallFriendsOnly => '僅限好友';

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
  String get privacyDashboardRingBehavior => '鈴聲行為';

  @override
  String get privacyDashboardSilentCalls => '所有人來電靜音';

  @override
  String get privacyDashboardSilentCallsDesc =>
      '所有來電都會改為靜音通知，而非響鈴。預設情況下，非好友的來電一律為靜音。';

  @override
  String get privacyDashboardGroupDmTitle => '誰可以將您加入群組聊天';

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
  String get privacyDashboardShareVoiceActivity => '與好友分享您的語音活動';

  @override
  String get privacyDashboardVoiceActivityEnableTitle => '與所有好友分享語音活動嗎？';

  @override
  String get privacyDashboardVoiceActivityDisableTitle => '要停止與所有好友分享語音活動嗎？';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      '您即將開始與所有好友（包括未來的好友）分享您的語音活動。這會向他們所有人傳送更新，而且要 24 小時後才能再次變更。';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      '您即將停止與所有好友（包括未來的好友）分享您的語音活動。這會向他們所有人傳送更新，而且要 24 小時後才能再次變更。';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm => '是，與所有好友分享';

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
  String get privacyDashboardDmConfirmAllowMembersTitle => '允許社群成員傳送私訊？';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle => '要封鎖來自社群成員的私訊嗎？';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle => '允許機器人傳送私訊給您？';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle => '要封鎖機器人傳送私訊給您嗎？';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      '是否也要允許您現有社群中的成員傳送私訊給您？';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      '是否也要封鎖您現有社群中成員傳送的私訊？';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      '是否也要允許您現有社群中的機器人傳送私訊給您？';

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
      '匯出您傳送過的每則訊息，以及所有帳號設定、成員資格和中繼資料。';

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
  String get privacyDashboardDataRequestKindDms => '已開啟的私訊';

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
  String get privacyDashboardDataRequestGuildFilterExclude => '選取以外的所有社群';

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
  String get privacyDashboardDataRequestConfirmTitle => '檢視並確認';

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
  String get privacyDashboardDataRequestSummaryScope => '範圍';

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
  String get privacyDashboardDataRequestSummaryDmsOpen => '已開啟的私訊';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed => '已關閉的私訊';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth => '私訊（開啟中與已關閉）';

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
  String get doubleTapReactionHint => '輕觸兩下訊息即可回應';

  @override
  String get doubleTapReactionEdit => '編輯';

  @override
  String get doubleTapReactionEditTitle => '編輯預設';

  @override
  String get doubleTapReactionEditSubtitle => '選擇雙擊表情符號';

  @override
  String get chatMessageEdit => '編輯訊息';

  @override
  String get chatMessageReply => '回覆';

  @override
  String get notificationReplyPlaceholder => '訊息';

  @override
  String get notificationReplyFailed => '無法傳送回覆';

  @override
  String get chatMessageForward => '轉傳';

  @override
  String get forwardMessageTitle => '轉傳訊息';

  @override
  String get forwardSearchHint => '搜尋頻道或私訊';

  @override
  String get forwardDirectMessagesSection => '私訊';

  @override
  String get forwardCommentHint => '新增留言（選填）';

  @override
  String forwardSendButton(int count, int limit) {
    return '傳送 ($count/$limit)';
  }

  @override
  String get forwardEmptyState => '找不到任何頻道';

  @override
  String get forwardSuccessToast => '訊息已轉傳';

  @override
  String get forwardFailed => '訊息轉傳失敗';

  @override
  String get forwardCommentSlowmodeDisabled => '由於選取的頻道已啟用慢速模式，備註功能無法使用。';

  @override
  String get forwardSendSlowmodeBlocked => '正在等待一個或多個所選頻道的慢速模式結束。';

  @override
  String get slowmodeRateLimitedTitle => '慢速模式進行中';

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
  String get forwardDestinationGuildSendDisabled => '此社群已停用訊息傳送功能';

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
  String get chatMessageStopSpeaking => '停止朗讀';

  @override
  String get chatMessagePin => '釘選訊息';

  @override
  String get chatMessageUnpin => '取消釘選訊息';

  @override
  String get chatMessageUnpinIt => '取消釘選';

  @override
  String get chatMessageBookmark => '將訊息加入書籤';

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
  String get chatMessageViewReactions => '查看反應';

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
  String get chatReactionsSheetEmpty => '還沒有人做出這個反應。';

  @override
  String get chatReactionAddFailed => '無法新增表情符號';

  @override
  String get chatReactionRemoveFailed => '無法移除表情符號';

  @override
  String get chatMessageReport => '檢舉訊息';

  @override
  String get reportFlowTitleMessage => '檢舉訊息';

  @override
  String get reportFlowTitleUserProfile => '檢舉個人檔案';

  @override
  String get reportFlowSummaryTitle => '檢查您的檢舉';

  @override
  String get reportFlowSummarySubtitle => '送出前請再次確認內容是否正確。';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return '僅檢舉您真心認為違反規則的內容。濫用檢舉功能將違反我們的$guidelines。';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => '社群準則';

  @override
  String get reportFlowDisclaimerNoLink => '請僅檢舉您真心認為違反規則的內容，且請勿重複送出相同的檢舉。';

  @override
  String get reportFlowSelectedMessage => '您要檢舉的訊息';

  @override
  String get reportFlowSelectedUser => '您要檢舉的個人檔案';

  @override
  String get reportFlowReportCategory => '您的回答';

  @override
  String get reportFlowSubmit => '送出檢舉';

  @override
  String get reportFlowBack => '返回';

  @override
  String get reportFlowNext => '下一步';

  @override
  String get reportFlowDone => '完成';

  @override
  String get reportFlowThankYouTitle => '已送出檢舉';

  @override
  String get reportFlowThankYouNoReportTitle => '感謝您告知我們';

  @override
  String reportFlowThankYouBody(String productName) {
    return '$productName 安全團隊會審核您的檢舉。我們不會透露是您檢舉的。';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      '感謝您告訴我們。這本身並不違反我們的規定，所以我們沒有送出檢舉。如果內容針對特定對象或使用侮辱性字眼，請再次檢舉並選擇「辱罵性或有害的內容」。';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      '感謝您告訴我們。這本身並不違反我們的規定，所以我們沒有送出檢舉。';

  @override
  String get reportFlowMoreYouCanDo => '您的選項';

  @override
  String reportFlowBlockName(String name) {
    return '封鎖 $name';
  }

  @override
  String get reportFlowBlockDescription => '隱藏對方的訊息，並使對方無法傳送私訊給您';

  @override
  String get reportFlowBlockButton => '封鎖';

  @override
  String get reportFlowBlockedButton => '已封鎖';

  @override
  String get reportFlowUrgentBanner => '如果有人面臨立即危險，請先聯絡當地緊急救援單位。';

  @override
  String get reportFlowLoadFailed => '無法載入檢舉表單。';

  @override
  String get reportFlowTryAgain => '再試一次';

  @override
  String get reportFlowOutdated => '檢舉表單已變更。請重新開始。';

  @override
  String get reportFlowAlreadyReported => '您已經檢舉過這則訊息了。';

  @override
  String get reportFlowAlreadyReportedProfile => '您今天已經檢舉過這個個人檔案了。';

  @override
  String get reportFlowRateLimited => '您傳送檢舉的速度太快了。請稍後再試。';

  @override
  String get reportFlowSubmitFailed => '您的檢舉未成功送出。請再試一次。';

  @override
  String get reportFlowAccountSetupRequired => '請先認領帳號並驗證電子郵件，才能傳送檢舉。';

  @override
  String get chatMessageSuppressEmbeds => '隱藏嵌入內容';

  @override
  String get chatMessageUnsuppressEmbeds => '取消隱藏嵌入內容';

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
  String get chatReplyOriginalFailedToLoad => '載入原始訊息失敗';

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
  String get devMarkAsSpamLocally => '標示為垃圾訊息（僅限本機）';

  @override
  String get devIgnoreSpamFlag => '忽略垃圾訊息標記';

  @override
  String get chatMessagesLoadError => '無法載入訊息。';

  @override
  String get chatReplyMentionOverrideTitle => '要忽略提及偏好設定嗎？';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname 偏好在回覆時被 @提及。仍要不提及就傳送嗎？';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname 偏好回覆時不要 @提及。仍要提及並傳送嗎？';
  }

  @override
  String get chatReplyMentionIgnorePreference => '忽略偏好設定';

  @override
  String get chatReplyMentionDisableTooltip => '點擊以停用提及您回覆的對象。';

  @override
  String get chatReplyMentionEnableTooltip => '點擊以啟用提及您回覆的對象。';

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
  String get chatMessageEdited => '（已編輯）';

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
  String get mediaViewerForward => '轉傳';

  @override
  String get mediaViewerZoomIn => '放大';

  @override
  String get mediaViewerZoomOut => '縮小';

  @override
  String get mediaViewerPreviousAttachment => '上一個附件';

  @override
  String get mediaViewerNextAttachment => '下一個附件';

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
  String get chatImageCouldNotLoad => '無法載入此圖片。';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      '通知擁有此身分組且有權限查看此頻道的使用者。';

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
  String get composerAutocompleteUsersHeading => '使用者';

  @override
  String get composerAutocompleteMentionsHeading => '提及';

  @override
  String get composerAutocompleteRolesHeading => '身分組';

  @override
  String get composerAutocompleteMediaHeading => '媒體';

  @override
  String get composerAutocompleteStickersHeading => '貼圖';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => '找不到 GIF';

  @override
  String get composerCommandShrugDescription => '在您的訊息後面加上 ¯\\_(ツ)_/¯。';

  @override
  String get composerCommandTableflipDescription => '在您的訊息後面加上 (╯°□°)╯︵ ┻━┻。';

  @override
  String get composerCommandUnflipDescription => '在您的訊息後面加上 ┬─┬ ノ( ゜-゜ノ)。';

  @override
  String get composerCommandMeDescription => '傳送動作訊息（會以斜體顯示）。';

  @override
  String get composerCommandSpoilerDescription => '傳送劇透訊息（會以劇透標籤包起來）。';

  @override
  String get composerCommandTtsDescription => '傳送文字轉語音訊息。';

  @override
  String get composerCommandNickDescription => '變更您在這個社群的暱稱。';

  @override
  String get composerCommandKickDescription => '將成員從此社群踢出。';

  @override
  String get composerCommandBanDescription => '將成員從此社群中停權。';

  @override
  String get composerCommandMsgDescription => '傳送私訊給使用者。';

  @override
  String get composerCommandSavedDescription => '傳送已儲存的媒體項目。';

  @override
  String get composerCommandStickerDescription => '傳送貼圖。';

  @override
  String get composerCommandGifDescription => '搜尋並傳送 GIF。';

  @override
  String get composerCommandMemberOption => '要操作的成員。';

  @override
  String get composerCommandReasonOption => '原因（選填）。';

  @override
  String get composerCommandMessageOption => '要傳送的訊息。';

  @override
  String get composerCommandQueryOption => '要搜尋的內容。';

  @override
  String get composerCommandNicknameOption => '您的新暱稱，留空則重設。';

  @override
  String get composerCommandDeleteMessagesOption => '要刪除該成員多少近期訊息紀錄。';

  @override
  String get composerCommandDeleteMessagesNone => '不刪除任何訊息';

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
    return '您在此社群的暱稱已從 **$previousNickname** 變更為 **$newNickname**。';
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
  String get addGuildCreateDescription => '建立社群，和好友一起聊天。';

  @override
  String get addGuildCreateNameLabel => '社群名稱';

  @override
  String get addGuildCreateSubmit => '建立社群';

  @override
  String get addGuildCreateFailed => '無法建立社群。請再試一次。';

  @override
  String get addGuildCreateClaimTitle => '認領您的帳號';

  @override
  String get addGuildCreateClaimDescription => '您必須先認領帳號，才能建立社群。';

  @override
  String get addGuildCreateVerifyTitle => '驗證您的電子郵件';

  @override
  String get addGuildCreateVerifyDescription => '您必須先驗證電子郵件地址，才能建立社群。';

  @override
  String get addGuildCreateAnimatedIconUnsupported => '建立社群時不支援動態圖示。請使用靜態圖片。';

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
  String get chatMessagePinConfirm => '釘選';

  @override
  String get chatMessagePinConfirmDescription => '將此訊息釘選到頻道，讓所有人都能看到。';

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
  String get channelPinsEmptyTitle => '沒有釘選的訊息';

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
  String get channelDetailsInvitePeople => '邀請成員';

  @override
  String get channelDetailsCopyLink => '複製連結';

  @override
  String get channelMenuCopyChannelLink => '複製頻道連結';

  @override
  String get channelMenuCopyRedirectLink => '複製轉送連結';

  @override
  String get channelDetailsAddFriendsToGroup => '新增好友至群組';

  @override
  String get channelDetailsGroupInvites => '群組邀請';

  @override
  String get channelDetailsEditChannel => '編輯頻道';

  @override
  String get channelDetailsDeleteChannel => '刪除頻道';

  @override
  String get channelSettingsCategorySettingsTitle => '類別設定';

  @override
  String get channelSettingsEditCategory => '編輯類別';

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
  String get channelSettingsUrl => '網址';

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
  String get channelSettingsVoiceRegion => '語音區域';

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
  String get channelSettingsMatureContentCategorySource => '類別';

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
    return '您需要「$manageChannelsPermissionLabel」權限才能編輯這些權限。';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return '您需要「$manageRolesPermissionLabel」權限才能編輯這些權限。';
  }

  @override
  String get channelSettingsUnknownRole => '不明身分組';

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
  String get channelSettingsCopyInviteUrl => '複製邀請網址';

  @override
  String get channelSettingsWebhookCreated => 'Webhook 已建立';

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
  String get channelSettingsWebhooksEmpty => '沒有 Webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      '此頻道尚未設定任何 Webhook。請建立 Webhook，以允許外部應用程式發佈訊息。';

  @override
  String get channelSettingsWebhooksUnsupported => '此頻道不支援 Webhook。';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return '你需要擁有「$permission」權限才能檢視和編輯此頻道的網頁掛鉤。';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => '載入 Webhook 失敗';

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
  String get channelMenuCouldNotDeleteYourMessages => '無法刪除您的訊息';

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
  String get memberListPermissionDeniedTitle => '您無法查看成員';

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
  String get channelDetailsPinsEndReached => '您已看到底囉';

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
  String get channelDetailsSearchFilterFrom => '來自';

  @override
  String get channelDetailsSearchFilterHas => '包含';

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
  String get channelDetailsSearchAuthorTypeUser => '使用者';

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
  String get channelHeaderSearchUsersTitle => '使用者';

  @override
  String get channelHeaderSearchChannelsTitle => '頻道';

  @override
  String get channelHeaderSearchValuesTitle => '值';

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
  String get channelDetailsSearchFilterByUser => '依使用者篩選';

  @override
  String get channelDetailsSearchFilterByContent => '依內容篩選';

  @override
  String get channelDetailsSearchSortBy => '結果排序依據';

  @override
  String get channelDetailsSearchIn => '搜尋範圍';

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
  String get channelDetailsMemberYou => '您';

  @override
  String get channelDetailsSearchUsersHint => '搜尋使用者';

  @override
  String get channelDetailsSearchUsersTypeToSearch => '輸入以搜尋成員';

  @override
  String get channelDetailsSearchUsersEmpty => '找不到使用者';

  @override
  String get channelDetailsSearchUsersNoAvailable => '沒有可用的使用者';

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
  String get channelDetailsJumpToMessage => '跳到訊息';

  @override
  String get channelDetailsUnpinMessage => '取消釘選訊息';

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
  String get channelDetailsSearchScopeAllDmsOnlyGuild => '僅限所有私訊';

  @override
  String get channelDetailsSearchScopeAllDms => '所有私訊';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => '僅限已開啟的私訊';

  @override
  String get channelDetailsSearchScopeOpenDms => '已開啟的私訊';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities => '所有私訊 + 社群';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities => '已開啟的私訊 + 社群';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription => '僅搜尋此社群';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription => '僅搜尋此私訊';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      '在你目前加入的所有社群中';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      '僅限您曾參與的所有私訊';

  @override
  String get channelDetailsSearchScopeAllDmsDescription => '您曾參與的所有私訊';

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
  String get channelDetailsSearchSortOldest => '最舊優先';

  @override
  String get channelDetailsSearchSortRelevance => '最相關';

  @override
  String get channelDetailsSearchSortNewestDescription => '優先顯示最新訊息';

  @override
  String get channelDetailsSearchSortOldestDescription => '優先顯示最舊訊息';

  @override
  String get channelDetailsSearchSortRelevanceDescription => '優先顯示最相關的訊息';

  @override
  String get channelDetailsSearchContentImage => '上傳圖片';

  @override
  String get channelDetailsSearchContentVideo => '上傳影片';

  @override
  String get channelDetailsSearchContentAudio => '上傳音訊';

  @override
  String get channelDetailsSearchContentFile => '檔案上傳';

  @override
  String get channelDetailsSearchContentLink => '連結';

  @override
  String get channelDetailsSearchContentEmbed => '連結預覽或嵌入內容';

  @override
  String get channelDetailsSearchContentSticker => '貼圖';

  @override
  String get channelDetailsSearchContentImageDescription => '僅限上傳的圖片檔案';

  @override
  String get channelDetailsSearchContentVideoDescription => '僅限上傳的影片檔案';

  @override
  String get channelDetailsSearchContentAudioDescription => '僅限上傳的音訊檔案';

  @override
  String get channelDetailsSearchContentFileDescription => '任何上傳的附件';

  @override
  String get channelDetailsSearchContentLinkDescription => '訊息文字中的網址';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      '已解析的預覽與豐富嵌入內容，而非上傳的檔案';

  @override
  String get channelDetailsSearchContentStickerDescription => '訊息中附有貼圖';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count 種內容';
  }

  @override
  String get personalNotesTitle => '個人筆記';

  @override
  String get personalNotesSubtitle => '專屬於您的私人空間，記錄想法與提醒';

  @override
  String groupDmWelcome(String displayName) {
    return '歡迎來到 $displayName。邀請朋友加入，讓群組更熱鬧。';
  }

  @override
  String get groupDmWelcomeEditGroup => '編輯群組';

  @override
  String get groupDmWelcomeAddFriends => '新增好友至群組';

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
  String get groupDmAnimatedIconNotSupported => '不支援動態圖示。請使用靜態圖片。';

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
  String get groupDmInvalidImageBody => '這張圖片無效。請換一張試試。';

  @override
  String get groupDmAddFriends => '新增';

  @override
  String get groupDmOrSendInvite => '或傳送邀請給好友：';

  @override
  String get groupDmGenerateInviteLink => '產生邀請連結';

  @override
  String get groupDmCreateInvite => '建立';

  @override
  String get groupDmInviteExpires24Hours => '您的邀請將在 24 小時後失效';

  @override
  String get groupDmAddFriendFailed => '無法將這位好友新增到群組。請再試一次。';

  @override
  String get groupDmAddFailed => '無法新增至群組';

  @override
  String get groupDmGroupFull => '此群組已滿。請先移除成員，才能再新增成員。';

  @override
  String get groupDmRateLimited => '您的操作太頻繁了。請稍候片刻再試一次。';

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
    return '在 #$channelName 中傳送訊息';
  }

  @override
  String dmComposerHint(String recipientName) {
    return '傳送訊息給 @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return '傳送訊息給 $groupName';
  }

  @override
  String get groupDmComposerHint => '訊息群組';

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
  String get personalNotesPrivateSpace => '您的私人空間';

  @override
  String get purgePersonalNotes => '清除個人記事';

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
  String get purgePersonalNotesAlreadyEmpty => '個人筆記已經是空的了';

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
  String get userSettingsNavProfile => '個人檔案';

  @override
  String get userSettingsNavSecurityLogin => '安全性與登入';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => '禮物';

  @override
  String get giftSettingsClaimAccountTitle => '認領您的帳號';

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
  String get giftSettingsGiftUrl => '禮物網址';

  @override
  String get giftSettingsCopy => '複製';

  @override
  String get giftSettingsCopied => '已複製';

  @override
  String get giftSettingsGiftUrlCopied => '禮物網址已複製到剪貼簿！';

  @override
  String get giftSettingsGiftUrlCopyFailed => '無法複製禮物網址';

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
  String get giftSettingsShareWithFriend => '分享給好友';

  @override
  String get premiumPlutoniumTagline => '解鎖更高上限和獨家功能，同時支持獨立通訊平台。';

  @override
  String get premiumPurchaseMode => '購買模式';

  @override
  String get premiumForMe => '自己使用';

  @override
  String get premiumAsAGift => '作為禮物';

  @override
  String get premiumMonthly => '每月';

  @override
  String get premiumYearly => '每年';

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
  String get premiumGiftBadge => '禮物';

  @override
  String get premiumCancelSubscriptionTitle => '取消訂閱？';

  @override
  String get premiumCancelSubscriptionBody =>
      '您會保留福利到下一個續訂日期，之後有 3 天寬限期可以重新訂閱並保留您的訂閱者歷史記錄。';

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
  String get premiumSubscriptionCanceling => '即將取消';

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
  String get premiumGiftGraceEnded => '您的贈送時間已到期。訂閱即可繼續享有 Plutonium。';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      '您將立即付費。剩餘的免費使用時間將加在付費方案之後，所以不會浪費。';

  @override
  String get premiumComparisonFeatureColumn => '功能';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return '購買即表示您已同意我們的$terms和$privacy。';
  }

  @override
  String get premiumDisclaimerRefund =>
      '付款後 3 天內可自行申請退款，每 30 天限一次。訂閱退款後即會取消訂閱。歐盟/歐洲經濟區買家在結帳時放棄 14 天的撤銷權，以立即存取內容。請使用應用程式內的退款按鈕，而非向發卡機構提出拒付。拒付可能會導致您的帳號被永久限制。Stripe 會安全處理付款。我們絕不會看到您的完整卡號。';

  @override
  String get premiumTermsOfService => '服務條款';

  @override
  String get premiumPrivacyPolicy => '隱私權政策';

  @override
  String get premiumCheckoutStartFailedTitle => '無法開始結帳';

  @override
  String get premiumCheckoutStartFailedBody => '啟動結帳時發生錯誤。請稍後再試一次。';

  @override
  String get premiumPlanUnavailable => '此方案無法使用。請聯絡客服。';

  @override
  String get premiumPlanUnavailableSelfHosted => '此方案無法使用。請聯絡此實例的管理員。';

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
  String get premiumExistingSubscriptionTitle => '您已有訂閱';

  @override
  String get premiumExistingSubscriptionBody =>
      '我們在此帳戶找到現有的 Fluxer Plutonium 訂閱。請前往安全的帳單入口網站進行管理，以更新付款詳情或查看續訂狀態。如果您剛付款，請稍候一分鐘後重新開啟此頁面。';

  @override
  String get premiumPurchasesDisabledTitle => '無法購買';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return '此帳號已停用購買功能。如果這看起來有誤，請聯絡 $supportEmail。';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      '此帳號已停用購買功能。如果這看起來有誤，請聯絡此實例的管理員。';

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
  String get premiumPerkBookmarkedMessages => '已加入書籤的訊息';

  @override
  String get premiumPerkFileUploadSize => '檔案上傳大小';

  @override
  String get premiumPerkEmojiStickerPacks => '表情符號與貼圖套件';

  @override
  String get premiumPerkSavedMedia => '已儲存的媒體';

  @override
  String get premiumPerkUseAnimatedEmojis => '使用動態表情符號';

  @override
  String get premiumPerkGlobalEmojiStickerAccess => '全域表情符號和貼圖存取權';

  @override
  String get premiumPerkVideoQuality => '視訊畫質';

  @override
  String get premiumPerkAnimatedAvatarsBanners => '動態頭像與個人檔案橫幅';

  @override
  String get premiumPerkEarlyAccess => '搶先體驗新功能';

  @override
  String get premiumPerkCustomThemes => '自訂主題';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => '最高 4K/60fps';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly 或 $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/月';

  @override
  String get storePlutoniumYearSuffix => '/年';

  @override
  String get storePlutoniumPriceOr => '或';

  @override
  String get storePlutoniumEmojiTitle => '您的表情符號，隨處可用';

  @override
  String get storePlutoniumEmojiBody => '將您社群中的自訂表情符號和貼圖，帶到您加入的每個聊天和社群中。';

  @override
  String get storePlutoniumProfileTitle => '一個脫穎而出的個人檔案';

  @override
  String get storePlutoniumProfileBody =>
      '取得動態大頭貼和橫幅、訂閱者徽章、使用者名稱後方您想要的四位數標籤*，以及每個社群的獨立個人檔案。';

  @override
  String get storePlutoniumFilesTitle => '傳送最大 500 MB 的檔案';

  @override
  String get storePlutoniumFilesBody => '分享完整長度的影片和大型檔案，無需先壓縮。免費帳戶最多可傳送 25 MB。';

  @override
  String get storePlutoniumCompareTitle => '比較免費版與 Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      '這些功能並非全部都可在行動應用程式中使用。部分功能僅限於桌面版。';

  @override
  String get storePlutoniumNotAvailable => '不可用';

  @override
  String get storePlutoniumAvailable => '可用';

  @override
  String get storePlutoniumCompareTag => '選擇使用者名稱後的 4 位數數字*';

  @override
  String get storePlutoniumCompareProfile => '每個社群的獨立個人檔案';

  @override
  String get storePlutoniumCompareBadge => '個人檔案上的訂閱者徽章';

  @override
  String get storePlutoniumCompareBackgrounds => '可儲存的視訊通話背景';

  @override
  String get storePlutoniumCompareCommunities => '您可以加入的社群';

  @override
  String get storePlutoniumCompareCharacters => '單則訊息中的字元數';

  @override
  String get storePlutoniumCompareBookmarks => '可收藏的訊息';

  @override
  String get storePlutoniumCompareUpload => '您可上傳的最大檔案';

  @override
  String get storePlutoniumCompareSavedMedia => '可儲存的媒體項目';

  @override
  String get storePlutoniumCompareAnimatedEmoji => '在訊息中使用動態表情符號';

  @override
  String get storePlutoniumCompareCustomEmoji => '在任何社群中使用自訂表情符號和貼圖';

  @override
  String get storePlutoniumCompareVideo => '視訊通話與畫面分享品質';

  @override
  String get storePlutoniumCompareAvatar => '動畫頭像與個人檔案橫幅';

  @override
  String get storePlutoniumCompareEarlyAccess => '搶先體驗新功能';

  @override
  String get storePlutoniumCompareThemes => '應用程式的自訂佈景主題';

  @override
  String get storePlutoniumVideoFree => '最高 720p，30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => '最高 4K，60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      '您只能選擇沒有其他使用者名稱相同的人使用的標籤。使用者名稱不區分大小寫，因此 Mina#4821 和 mina#4821 視為相同。#0000 標籤保留給 Fluxer Visionary 會員。';

  @override
  String get storePlutoniumLearnVisionary => '深入了解 Visionary。';

  @override
  String get storePlutoniumDonatePrompt => '只想支持 Fluxer 的開源開發嗎？ ';

  @override
  String get storePlutoniumDonateLink => '改為捐款。';

  @override
  String get storePlutoniumHighlightsLead => '訂閱可資助 Fluxer 並解鎖';

  @override
  String get storePlutoniumHighlightEmoji => '在任何聊天室中使用自訂表情符號和貼圖';

  @override
  String get storePlutoniumHighlightProfile => '動態個人檔案、徽章和自訂 4 位數號碼';

  @override
  String get storePlutoniumHighlightFiles => '上傳檔案大小上限 500 MB';

  @override
  String get storePlutoniumHighlightMessages => '傳送最長 4,000 個字元的訊息';

  @override
  String get storePlutoniumHighlightCommunityProfile => '每個社群的獨立個人檔案';

  @override
  String get storePlutoniumHighlightsMore => '還有更多';

  @override
  String get storePlutoniumRenewsThroughPlay => '透過 Google Play 自動續訂，直到您取消為止。';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      '透過 App Store 自動續訂，直到您取消為止。';

  @override
  String get storePlutoniumAlreadySubscribed => '您已經有 Fluxer Plutonium 訂閱了。';

  @override
  String storePlutoniumSavePercent(int percent) {
    return '節省 $percent%';
  }

  @override
  String get storePlutoniumWaiting => '已收到購買。Plutonium 啟用後將會顯示於此。';

  @override
  String get storePlutoniumUnavailable => '此裝置尚不支援應用程式內訂閱。';

  @override
  String get storePlutoniumVisionaryStatus => 'Visionary 已包含永久存取權，因此不需要定期訂閱。';

  @override
  String get userSettingsNavPrivacyDashboard => '隱私權儀表板';

  @override
  String get userSettingsNavAuthorizedApps => '已授權的應用程式';

  @override
  String get userSettingsNavBlockedUsers => '已封鎖的使用者';

  @override
  String get userSettingsNavLinkedDevices => '已連結的裝置';

  @override
  String get userSettingsNavConnections => '連結帳號';

  @override
  String get userSettingsNavLookAndFeel => '外觀';

  @override
  String get userSettingsNavAccessibility => '協助工具';

  @override
  String get userSettingsNavChat => '聊天';

  @override
  String get userSettingsNavAudioAndVideo => '音訊與視訊';

  @override
  String get userSettingsNavShortcuts => '快速鍵';

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
  String get audioAndVideoFocusedVoiceDescription => '建議使用。讓您的麥克風更清晰地收音。';

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
  String get audioAndVideoNoiseSuppressionSectionTitle => '雜訊抑制';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => '加強';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => '標準';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => '無';

  @override
  String get audioAndVideoEchoCancellationLabel => '回音消除';

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
    return '收到訊息時通知您。您可能需要在裝置設定中允許 $productName 的通知。若要設定個別頻道或社群的通知，請從社群選單開啟通知設定。';
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
      '收到訊息時通知您。您可能需要在瀏覽器設定中允許通知。若要設定個別頻道或社群的通知，請在社群圖示上按一下右鍵，然後開啟通知設定。';

  @override
  String get notificationsPushInactiveTimeoutLabel => '推播通知閒置逾時';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName 會在您使用電腦時，避免向您的行動裝置傳送推播通知。請選擇要在桌面端閒置多久之後，才開始接收推播通知。';
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
  String get notificationsMentionNoPreferenceName => '無偏好';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      '尊重傳送者的意圖，當對方開啟或關閉提及功能時，不顯示警告';

  @override
  String get notificationsMentionPreferMentionName => '偏好 @提及';

  @override
  String get notificationsMentionPreferMentionDescription =>
      '預設回覆會 @提及您，若傳送者關閉提及，會提醒對方';

  @override
  String get notificationsMentionPreferNoMentionName => '偏好不要 @提及';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      '預設回覆會省略 @提及，若傳送者啟用提及，會提醒對方';

  @override
  String get notificationsTtsSectionTitle => '文字轉語音通知';

  @override
  String get notificationsTtsEnableCommandLabel => '啟用 /tts 語音播放';

  @override
  String get notificationsTtsEnableCommandDescription =>
      '讓 /tts 唸出您的訊息。關閉此設定會讓這些指令顯示為一般文字。';

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
  String get notificationsTtsModeNeverName => '永不自動朗讀';

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
    return '使用中的自訂音效音量覆寫：$overrideCount。';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return '跟隨主設定 • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return '將「$label」重設為主音量';
  }

  @override
  String get notificationsResetAllOverrides => '重設所有覆寫設定';

  @override
  String notificationsMuteSound(String label) {
    return '靜音 $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '將「$label」解除靜音';
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
  String get notificationsSoundDeaf => '語音耳機靜音';

  @override
  String get notificationsSoundUndeaf => '語音解除耳機靜音';

  @override
  String get notificationsSoundUserJoin => '使用者加入頻道';

  @override
  String get notificationsSoundUserLeave => '使用者離開頻道';

  @override
  String get notificationsSoundUserMove => '使用者已移動頻道';

  @override
  String get notificationsSoundViewerJoin => '觀眾加入直播';

  @override
  String get notificationsSoundViewerLeave => '觀眾離開直播';

  @override
  String get notificationsSoundVoiceDisconnect => '語音連線已中斷';

  @override
  String get notificationsSoundIncomingRing => '來電';

  @override
  String get notificationsSoundCameraOn => '相機開啟';

  @override
  String get notificationsSoundCameraOff => '相機關閉';

  @override
  String get notificationsSoundScreenShareStart => '螢幕分享開始';

  @override
  String get notificationsSoundScreenShareStop => '螢幕分享停止';

  @override
  String get notificationsAfkTimeoutSyncFailed => '無法更新推播通知逾時。請再試一次。';

  @override
  String get notificationsMentionPreferenceSyncFailed => '無法更新提及偏好設定。請再試一次。';

  @override
  String get notificationsPermissionDeniedTitle => '通知已封鎖';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      '無法啟用通知。請允許通知權限以繼續。';

  @override
  String get notificationsPushRelaySectionTitle => '推播通知中繼';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider 只透過自家服務傳送推播通知，因此本裝置的推播會經過 Fluxer 中繼。';
  }

  @override
  String get notificationsPushRelayConsentLabel => '使用 Fluxer 推播中繼';

  @override
  String get notificationsPushRelayConsentDescription =>
      '關閉後會移除本裝置的推播註冊，本裝置將不再收到推播通知。';

  @override
  String get pushRelayConsentTitle => '推播通知中繼';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider 只透過自家服務傳送推播通知，因此本裝置的推播會經過 Fluxer 中繼。';
  }

  @override
  String get pushRelayConsentNoticePrefix => '若要在本裝置上開啟推播通知，請同意';

  @override
  String get pushRelayConsentNoticeLink => '推播中繼隱私權聲明';

  @override
  String get pushRelayConsentNoticeSuffix => '。每部裝置只需同意一次。';

  @override
  String get pushRelayConsentAgree => '同意並繼續';

  @override
  String get pushRelayConsentDecline => '暫時不要';

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
    return '應用程式語言的時間格式：$format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return '系統時間格式：$format';
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
  String get userSettingsNavAppIcon => '應用程式圖示';

  @override
  String get appIconSectionTitle => '應用程式圖示';

  @override
  String get appIconSectionDescription => '選擇要在主畫面顯示的圖示。';

  @override
  String get appIconOptionDefault => '預設';

  @override
  String get appIconOptionStarfield => '星空';

  @override
  String get appIconOptionSweden => '瑞典';

  @override
  String get appIconUnsupported => '此裝置無法變更應用程式圖示。';

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
  String get advancedSettingsCategoryAppearance => '外觀';

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
  String get advancedSettingVideoSeekThumbnailsLabel => '啟用影片進度預覽縮圖';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      '拖曳影片進度時顯示縮圖或即時畫面';

  @override
  String get advancedSettingHapticFeedbackLabel => '觸覺回饋';

  @override
  String get advancedSettingHapticFeedbackDescription => '點擊和動作的震動回饋。不會在裝置間同步。';

  @override
  String get advancedSettingShowNekoLabel => '顯示 Neko';

  @override
  String get advancedSettingShowNekoDescription => '追逐您游標的貓咪';

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
  String get advancedSettingKeyboardHintsDescription => '工具提示中的鍵盤快速鍵提示';

  @override
  String get advancedSettingEnableFavoritesLabel => '啟用我的最愛';

  @override
  String get advancedSettingEnableFavoritesDescription => '在應用程式各處顯示我的最愛';

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
  String get advancedSettingAutoSendGifsDescription => '從選擇器自動傳送 GIF，不需確認';

  @override
  String get advancedSettingSaveGifFavoritesLabel => '將 GIF 最愛儲存為已儲存的媒體';

  @override
  String get advancedSettingSaveGifFavoritesDescription => '選擇我的最愛 GIF 的儲存方式';

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
  String get advancedSettingSearchEnginesDescription => '設定選取文字時使用的搜尋引擎';

  @override
  String get advancedSettingTranslatorsLabel => '翻譯服務';

  @override
  String get advancedSettingTranslatorsDescription => '設定選取文字時使用的翻譯工具';

  @override
  String get advancedSettingReverseImageSearchLabel => '以圖搜圖';

  @override
  String get advancedSettingReverseImageSearchDescription => '以圖搜圖服務供應商';

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
  String get advancedSettingSkipMarkAllAsReadLabel => '略過「全部標示為已讀」的確認步驟';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      '立即將所有未讀的收件匣頻道標示為已讀，不需確認';

  @override
  String get advancedSettingHideMutedChannelsLabel => '預設隱藏已靜音的頻道';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      '在社群側邊欄中隱藏您已設為靜音的頻道';

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
  String get advancedSettingShowSuppressEmbedsLabel => '顯示「隱藏嵌入內容」按鈕';

  @override
  String get advancedSettingShowMessageActionBarLabel => '顯示訊息操作列';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => '只顯示「更多」按鈕';

  @override
  String get advancedSettingShowQuickReactionsLabel => '顯示快速反應';

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
      '在表情符號自動完成中顯示已儲存的媒體';

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
  String get advancedSettingNewDeviceAlertsDescription => '偵測到新音訊裝置時提示';

  @override
  String get advancedSettingConnectionVolumeControlsLabel => '連線音量控制';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      '在語音選單中顯示個別裝置的參與者音量滑桿';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel => '螢幕分享預覽行為';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      '預覽、彈出視窗和串流縮圖行為';

  @override
  String get advancedSettingScreenShareCodecLabel => '螢幕分享編解碼器';

  @override
  String get advancedSettingScreenShareCodecDescription => '螢幕分享的視訊編解碼器';

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
  String get advancedSettingSearchEngineGoogleLens => 'Google 智慧鏡頭';

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
      '啟用或停用內建翻譯工具。已啟用的翻譯工具會在選取文字時，顯示於訊息操作選單中。';

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
      '啟用或停用內建的以圖搜圖服務供應商。已啟用的供應商會顯示在圖片、大頭貼、橫幅、貼圖和表情符號的操作選單中。';

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
  String get userSettingsNavWhatsNew => '最新功能';

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
  String get userSettingsLogOutConfirmTitle => '要登出嗎？';

  @override
  String get userSettingsLogOutConfirmDescription => '您可以隨時重新登入。';

  @override
  String get quickSwitcherTabSearch => '搜尋';

  @override
  String get quickSwitcherTabFriends => '好友';

  @override
  String get quickSwitcherSearchPlaceholder => '搜尋頻道、使用者或社群';

  @override
  String get quickSwitcherSearchFriends => '搜尋好友';

  @override
  String get quickSwitcherNoMatchesFound => '沒有找到符合的項目';

  @override
  String get quickSwitcherEmptyHint => '請嘗試其他名稱，或使用 @ / # / ! / * 前綴篩選結果。';

  @override
  String get quickSwitcherSectionPeople => '人物';

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
  String get savedMessagesAddedToast => '已加入書籤';

  @override
  String get savedMessagesRemovedToast => '已從書籤中移除';

  @override
  String get quickSwitcherMentionsLabel => '提及';

  @override
  String get quickSwitcherFriendsEmptyTitle => '還沒有好友';

  @override
  String get quickSwitcherFriendsEmptyHint => '新增好友以開始使用。';

  @override
  String get quickSwitcherFriendsNoMatchTitle => '沒有好友符合搜尋條件';

  @override
  String get quickSwitcherFriendsNoMatchHint => '試試其他名稱。';

  @override
  String get quickSwitcherSearchAliasUser => '使用者';

  @override
  String get quickSwitcherSearchAliasYou => '您';

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
  String get uiConfirm => '確定';

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
  String get uiOpenColorPicker => '開啟選色器';

  @override
  String get uiSelectPlaceholder => '選擇';

  @override
  String get uiSearchPlaceholder => '搜尋';

  @override
  String get uiNoOptionsFound => '找不到選項';

  @override
  String get uiDismissNotification => '關閉通知';

  @override
  String get uiColorPickerTitle => '顏色選擇器';

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
  String get instanceUrlHelper => '官方伺服器請使用 fluxer.app，自架伺服器請使用確切的網址。';

  @override
  String get resetToDefaultInstance => '重設為 Fluxer';

  @override
  String get instanceConnect => '連線';

  @override
  String get instanceConnecting => '連線中…';

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
  String get discoveryCategoryAnimeAndManga => '動漫';

  @override
  String get discoveryCategoryMoviesAndTv => '電影與電視';

  @override
  String get discoveryCategoryOther => '其他';

  @override
  String get discoveryNoCommunitiesMatch => '沒有符合的社群。';

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
  String get discoveryNoDescription => '沒有說明。';

  @override
  String get discoveryCommunities => '社群';

  @override
  String get discoveryApps => '應用程式';

  @override
  String get discoveryJoinErrorGenericTitle => '無法加入此社群';

  @override
  String get discoveryJoinErrorGenericMessage => '發生錯誤。請稍後再試一次。';

  @override
  String get discoveryJoinErrorFullTitle => '此社群已滿';

  @override
  String get discoveryJoinErrorFullMessage => '此社群已達成員上限，因此您目前無法加入。';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => '您已達到社群上限';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      '您加入的社群數量已達上限。請先離開一個社群，然後再試一次。';

  @override
  String get discoveryJoinErrorBannedTitle => '您無法加入此社群';

  @override
  String get discoveryJoinErrorBannedMessage => '您已被此社群停權。';

  @override
  String get discoveryJoinErrorNotAvailableTitle => '此社群已無法使用';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      '這個社群可能已退出探索，或關閉了新成員加入。重新整理頁面後就不會再看到它。';

  @override
  String get discoveryJoinErrorRateLimitTitle => '您的操作太頻繁了';

  @override
  String get discoveryJoinErrorRateLimitMessage => '請稍候片刻再試一次。';

  @override
  String get guildNavbarAddCommunity => '新增社群';

  @override
  String get guildNavbarHelp => '說明';

  @override
  String get scrollIndicatorNew => '新';

  @override
  String get scrollIndicatorNewMessage => '新訊息';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '收合「$folderName」';
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
  String get navigationItemMuted => '已靜音';

  @override
  String get authShowPassword => '顯示密碼';

  @override
  String get authHidePassword => '隱藏密碼';

  @override
  String get authCheckStillWorking => '仍在處理中…';

  @override
  String get authVerificationFailed => '無法完成驗證。請再試一次。';

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
  String get profileSendFriendRequest => '新增好友';

  @override
  String get accountOverflowMenu => '帳戶選項';

  @override
  String get navHome => '首頁';

  @override
  String get navNotifications => '通知';

  @override
  String get navYou => '您';

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
  String get guildFolderIconStar => '星形';

  @override
  String get guildFolderIconHeart => '愛心';

  @override
  String get guildFolderIconBookmark => '書籤';

  @override
  String get guildFolderIconGameController => '遊戲控制器';

  @override
  String get guildFolderIconShield => '盾牌';

  @override
  String get guildFolderIconMusicNote => '音符';

  @override
  String get guildFolderMarkAsRead => '將資料夾標示為已讀';

  @override
  String get guildBulkMuteCommunities => '將所有社群設為靜音';

  @override
  String get guildBulkUnmuteCommunities => '解除所有社群靜音';

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
  String get guildBulkAllowDirectMessages => '允許私訊';

  @override
  String get guildBulkBlockDirectMessages => '封鎖私訊';

  @override
  String get guildBulkAllowBotDirectMessages => '允許機器人傳送私訊';

  @override
  String get guildBulkBlockBotDirectMessages => '封鎖機器人私訊';

  @override
  String get guildNavbarGroupDm => '群組私訊';

  @override
  String get guildNavbarCreateChannel => '建立頻道';

  @override
  String get guildNavbarChannelType => '頻道類型';

  @override
  String get guildNavbarTextChannel => '文字頻道';

  @override
  String get guildNavbarTextChannelDescription => '发送讯息、图片、GIF 和表情符号';

  @override
  String get guildNavbarVoiceChannel => '語音頻道';

  @override
  String get guildNavbarVoiceChannelDescription => '透过语音、视讯和画面分享一起闲聊';

  @override
  String get guildNavbarLinkChannel => '连结频道';

  @override
  String get guildNavbarLinkChannelDescription => '快速存取外部网站或资源';

  @override
  String get guildNavbarNameLabel => '名稱';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => '網址';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => '選擇頻道類型';

  @override
  String get guildNavbarCreateCategory => '建立類別';

  @override
  String get guildNavbarNewCategoryHint => '新增類別';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return '邀请朋友加入 $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return '收件者将进入 #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => '搜尋好友';

  @override
  String get guildNavbarNoFriendsYet => '還沒有好友';

  @override
  String get guildNavbarNoResults => '沒有結果';

  @override
  String get guildNavbarInviteLinkPrompt => '或者，将邀请连结寄给朋友：';

  @override
  String get guildNavbarInviteLink => '邀請連結';

  @override
  String get guildNavbarCopy => '複製';

  @override
  String get guildNavbarCopied => '已复制！';

  @override
  String get guildNavbarInviteExpiresSevenDays => '您的邀请连结将在 7 天后到期。';

  @override
  String get guildNavbarInviteNeverExpires => '此邀請連結永不過期。';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return '您的邀请连结将在 $duration 后到期。';
  }

  @override
  String get guildNavbarEditInviteLink => '編輯邀請連結';

  @override
  String get guildNavbarInviteLinkSettings => '邀請連結設定';

  @override
  String get guildNavbarExpireAfter => '有效期限';

  @override
  String get guildNavbarMaxUses => '使用次數上限';

  @override
  String get guildNavbarGrantTemporaryMembership => '授予临时会员资格';

  @override
  String get guildNavbarTemporaryMembershipDescription => '除非分配角色，否则会员离线时将被移除';

  @override
  String get guildNavbarCreateNewLink => '建立新連結';

  @override
  String get guildNavbarSent => '已傳送';

  @override
  String get guildNavbarInvite => '邀請';

  @override
  String get guildNavbarLeaveCommunityTitle => '離開社群';

  @override
  String get guildNavbarLeaveCommunityDescription => '确定要离开这个社群吗？您将无法再看到任何讯息。';

  @override
  String get guildNavbarLeaveCommunityConfirm => '離開社群';

  @override
  String get guildNavbarDeleteMyMessagesTitle => '要刪除您在此社群中的訊息嗎？';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      '永久删除您在此处、所有频道中发送的每则讯息。无法复原。';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => '刪除我的訊息';

  @override
  String get guildNavbarDeletedYourMessages => '已删除您的讯息';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => '無法刪除您的訊息';

  @override
  String get guildNavbarRemoveOverride => '移除覆寫設定';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return '静音至 $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return '仅限 $productName 员工存取';
  }

  @override
  String get guildNavbarInvitesPaused => '此社群目前暫停邀請';

  @override
  String get guildNavbarDurationNever => '永不';

  @override
  String get guildNavbarDuration30Minutes => '30 分鐘';

  @override
  String get guildNavbarDuration1Hour => '1 小時';

  @override
  String get guildNavbarDuration6Hours => '6 小時';

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
  String get guildNavbarNoLimit => '無限制';

  @override
  String get guildNavbarOneUse => '1 次使用';

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
  String get guildMenuEditCommunityProfile => '編輯社群個人檔案';

  @override
  String get guildMenuUnmuteCommunity => '解除社群靜音';

  @override
  String get guildMenuMuteCommunity => '將社群設為靜音';

  @override
  String get guildMenuHideMutedChannels => '隱藏已靜音的頻道';

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
  String get guildMenuSettingsBans => '停權名單';

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
  String get guildSettingsCreateRole => '建立身分組';

  @override
  String get guildSettingsRolesListTitle => '身分組';

  @override
  String get guildSettingsRolesNewRole => '新身分組';

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
  String get guildSettingsRolesEditSubtitle => '設定身分組的各項設定與權限';

  @override
  String get guildSettingsRolesDisplaySection => '顯示';

  @override
  String get guildSettingsRolesRoleName => '身分組名稱';

  @override
  String get guildSettingsRolesRoleColor => '身分組顏色';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      '輸入顏色（十六進位、rgb()、hsl() 或名稱）或使用選擇器。';

  @override
  String get guildSettingsRolesShowSeparately => '將此身分組單獨顯示';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      '在成員列表中，將擁有此身分組的成員顯示在獨立區塊。';

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
  String get guildSettingsRolesSwitchToDenseLayout => '切換成緊湊版面配置';

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
  String get guildSettingsRolesHoistOrder => '置頂順序';

  @override
  String get guildSettingsRolesResetHoistOrder => '重設為預設值';

  @override
  String get guildSettingsRolesHoistOrderHelp => '拖曳身分組以自訂其在成員列表中的顯示順序。';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      '沒有置頂的身分組。在身分組上啟用「將此身分組單獨顯示」後，即可在此處看到。';

  @override
  String get guildSettingsRolesLockedTooltip => '您無法編輯此角色，因為這是您的最高角色或高於您的角色';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return '你需要「$permission」權限才能編輯這些權限';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole => '您無法編輯與您最高身分組同級或更高的身分組';

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
  String get guildSettingsRolesHoistResetSuccess => '置頂順序已重設為預設值';

  @override
  String get guildSettingsRolesNameRequiredTitle => '請輸入身分組名稱';

  @override
  String get guildSettingsRolesNameRequiredBody => '儲存前請先為身分組命名。';

  @override
  String get guildSettingsRolesCreateFailedTitle => '無法建立身分組';

  @override
  String get guildSettingsRolesUpdateFailedTitle => '無法更新身分組';

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
  String get permissionCategoryAudioVideo => '音訊與視訊';

  @override
  String get permissionUnknown => '不明權限';

  @override
  String get permissionAdministrator => '管理員';

  @override
  String get permissionAdministratorDescription => '授予所有權限並繞過頻道限制。高度敏感。';

  @override
  String get permissionViewActivityLog => '檢視活動紀錄';

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
      '建立、編輯或刪除排序低於您最高身分組的身分組。也可以編輯頻道權限覆寫。';

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
  String get permissionOverwriteInherit => '中立（繼承）';

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
  String get permissionChangeOwnNicknameDescription => '更新您的暱稱。';

  @override
  String get permissionManageNicknames => '管理暱稱';

  @override
  String get permissionManageNicknamesDescription => '更改其他成員的暱稱。';

  @override
  String get permissionCreateEmojiStickers => '建立表情符號和貼圖';

  @override
  String get permissionCreateEmojiStickersDescription =>
      '上傳新的表情符號和貼圖，並管理您自己的創作。';

  @override
  String get permissionManageEmojiStickers => '管理表情符號和貼圖';

  @override
  String get permissionManageEmojiStickersDescription => '編輯或刪除其他成員建立的表情符號和貼圖。';

  @override
  String get permissionManageWebhooks => '管理 Webhook';

  @override
  String get permissionManageWebhooksDescription => '建立、編輯或刪除 Webhook。';

  @override
  String get permissionSendMessages => '傳送訊息';

  @override
  String get permissionSendTtsMessages => '傳送 TTS 訊息';

  @override
  String get permissionSendTtsMessagesDescription => '傳送語音訊息。';

  @override
  String get permissionManageMessages => '管理訊息';

  @override
  String get permissionManageMessagesDescription => '刪除其他成員的訊息。釘選另有獨立權限。';

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
      '提及所有人或任何身分組（即使該身分組未設定為可提及）。';

  @override
  String get permissionUseExternalEmoji => '使用外部表情符號';

  @override
  String get permissionUseExternalEmojiDescription => '使用其他社群的表情符號。';

  @override
  String get permissionUseExternalStickers => '使用外部貼圖';

  @override
  String get permissionAddReactions => '新增反應';

  @override
  String get permissionAddReactionsDescription => '為訊息加上新的反應。';

  @override
  String get permissionBypassSlowmode => '略過慢速模式';

  @override
  String get permissionBypassSlowmodeDescription => '忽略各頻道訊息傳送速率限制。';

  @override
  String get permissionTimeOutMembers => '將成員暫時禁言';

  @override
  String get permissionTimeOutMembersDescription => '在一段時間內禁止成員傳送訊息、新增反應和加入語音。';

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
  String get permissionUseVoiceActivityDescription => '如果沒有這項權限，就必須使用「按住說話」。';

  @override
  String get permissionPrioritySpeaker => '優先發言者';

  @override
  String get permissionMuteMembers => '將成員靜音';

  @override
  String get permissionDeafenMembers => '將成員耳機靜音';

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
      '選擇成員發文或傳送私訊給社群成員前，必須具備的條件。';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      '擁有身分組的成員可以略過這些檢查。對於公開空間，我們建議啟用驗證。';

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
  String get guildSettingsVerificationNoneDescription => '不需要驗證。';

  @override
  String get guildSettingsVerificationLow => '低';

  @override
  String get guildSettingsVerificationLowDescription => '需要驗證電子郵件地址。';

  @override
  String get guildSettingsVerificationMedium => '中等';

  @override
  String get guildSettingsVerificationMediumDescription =>
      '需要已驗證的電子郵件地址，且帳號至少已建立 5 分鐘。';

  @override
  String get guildSettingsVerificationHigh => '高';

  @override
  String get guildSettingsVerificationHighDescription =>
      '除了中等安全等級的所有要求外，還必須成為社群成員至少 10 分鐘。';

  @override
  String get guildSettingsVerificationHighest => '非常高';

  @override
  String get guildSettingsVerificationHighestDescription => '需要已驗證的電話號碼。';

  @override
  String get guildSettingsAuditLogDescription => '追蹤社群中的管理員操作。';

  @override
  String get guildSettingsAuditLogEmpty => '尚無紀錄';

  @override
  String get guildSettingsAuditLogEmptyDescription => '管理動作與社群變更將顯示在這裡。';

  @override
  String get guildSettingsAuditLogFilterAllUsers => '所有使用者';

  @override
  String get guildSettingsAuditLogFilterAllActions => '所有動作';

  @override
  String get guildSettingsAuditLogNoReason => '未提供原因。';

  @override
  String get guildSettingsAuditLogUnknownUser => '不明使用者';

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
  String get auditLogActionMemberKick => '成員已遭踢出';

  @override
  String get auditLogActionMemberPrune => '成員已被清除';

  @override
  String get auditLogActionMemberBanAdd => '成員已遭停權';

  @override
  String get auditLogActionMemberBanRemove => '成員已解除停權';

  @override
  String get auditLogActionMemberUpdate => '成員已更新';

  @override
  String get auditLogActionMemberRoleUpdate => '成員身分組已更新';

  @override
  String get auditLogActionMemberMove => '成員已移動';

  @override
  String get auditLogActionMemberDisconnect => '成員已遭中斷連線';

  @override
  String get auditLogActionBotAdd => '已新增機器人';

  @override
  String get auditLogActionRoleCreate => '已建立身分組';

  @override
  String get auditLogActionRoleUpdate => '身分組已更新';

  @override
  String get auditLogActionRoleDelete => '身分組已刪除';

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
  String get auditLogActionEmojiCreate => '已建立表情符號';

  @override
  String get auditLogActionEmojiUpdate => '表情符號已更新';

  @override
  String get auditLogActionEmojiDelete => '已刪除表情符號';

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
  String get auditLogActionMessageUnpin => '訊息已解除釘選';

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
  String get guildSettingsLoadingMore => '正在載入…';

  @override
  String get guildSettingsWebhooksDescription => '檢視並管理社群中設定的所有 Webhook。';

  @override
  String get guildSettingsWebhooksEmpty => '沒有 Webhook';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return '這個社群目前還沒有任何網頁掛鉤。前往 $channelSettingsPath 建立一個。';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return '你需要擁有「$permission」權限才能檢視和編輯此社群的網頁掛鉤。';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => '載入 Webhook 失敗';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      '載入 Webhook 時發生錯誤。請再試一次。';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhook 已更新';

  @override
  String get guildSettingsWebhooksUpdateFailed => '無法更新 Webhook';

  @override
  String get guildSettingsUnknownChannel => '不明頻道';

  @override
  String get guildSettingsCopyUrl => '複製網址';

  @override
  String get guildSettingsCopiedUrl => '網址已複製到剪貼簿';

  @override
  String get guildSettingsDeleteWebhook => '刪除 Webhook';

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
  String get guildSettingsDiscoveryDescription => '將您的社群列入探索，讓其他人可以找到並加入。';

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
      '您的社群已列在探索中。您可以在下方更新刊登資訊，或撤回以移除刊登。';

  @override
  String get guildSettingsDiscoveryPendingInfo => '您的申請正在審核中。您仍然可以更新刊登資訊或撤回申請。';

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
  String get guildSettingsDiscoveryDescriptionPlaceholder => '描述您的社群主題';

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
  String get guildSettingsDiscoveryListingUpdated => '探索資訊已更新';

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
  String get guildMembersSortOldest => '最舊優先';

  @override
  String get guildMembersColumnName => '名稱';

  @override
  String get guildMembersColumnMemberSince => '加入時間';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return '已加入 $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => '加入方式';

  @override
  String get guildMembersColumnRoles => '身分組';

  @override
  String get guildMembersColumnActions => '動作';

  @override
  String get guildMembersFilterMemberSince => '依加入時間篩選';

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
  String get guildMembersFilterPast3Months => '過去 3 個月';

  @override
  String get guildMembersFilterCustomRange => '自訂範圍…';

  @override
  String get guildMembersDateRangeTitle => '自訂日期範圍';

  @override
  String get guildMembersDateAfter => '此日期之後';

  @override
  String get guildMembersDateBefore => '此日期之前';

  @override
  String get guildMembersClearAll => '全部清除';

  @override
  String get guildMembersRowsPerPage => '每頁列數';

  @override
  String get guildMembersEmptySearch => '沒有符合搜尋條件的成員。';

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
  String get guildMembersJoinSourceBotInvite => '機器人邀請';

  @override
  String get guildMembersJoinSourcePlatformAdmin => '平台管理員';

  @override
  String get guildMembersJoinSourceDiscovery => '探索';

  @override
  String get guildMembersJoinMethodUnknown => '不明';

  @override
  String get guildMembersCommunityOwner => '社群擁有者';

  @override
  String get guildMembersViewAllRoles => '查看所有身分組';

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
      '要暫停邀請嗎？在您重新啟用之前，新使用者將無法透過邀請連結加入。現有成員不會受到影響。';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      '要啟用邀請嗎？使用者將能再次透過邀請連結加入此社群。';

  @override
  String get guildSettingsInvitesPause => '暫停';

  @override
  String get guildSettingsInvitesPausedForCommunity => '此社群的邀請功能已暫停。';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return '由於 $productName 偵測到可能的突襲，邀請功能已暫停。新使用者目前無法加入。';
  }

  @override
  String get guildSettingsInvitesLabelInviter => '邀請人：';

  @override
  String get guildSettingsInvitesLabelChannel => '頻道：';

  @override
  String get guildSettingsInvitesLabelCode => '代碼：';

  @override
  String get guildSettingsInvitesLabelUses => '使用次數：';

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
  String get guildSettingsBansDescription => '檢視並管理已停權的使用者。';

  @override
  String get guildSettingsBansSearchHint => '搜尋停權名單';

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
  String get guildSettingsBansLoading => '正在載入已停權的使用者';

  @override
  String get guildSettingsBansNoSearchResults => '找不到符合您搜尋條件的停權紀錄。';

  @override
  String get guildSettingsBanDetailsTitle => '停權詳情';

  @override
  String get guildSettingsBanViewDetails => '查看詳情';

  @override
  String get guildSettingsBannedOn => '停權日期';

  @override
  String get guildSettingsBannedBy => '停權執行者';

  @override
  String get guildSettingsRevokeBanTitle => '解除停權';

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
  String get guildSettingsDeleteCommunity => '刪除社群';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      '確定要刪除這個社群嗎？此動作無法復原。所有頻道、訊息和設定都將永久刪除。';

  @override
  String get guildSettingsCommunityDeleted => '社群已刪除';

  @override
  String get guildSettingsDeleteCommunityFailed => '無法刪除此社群';

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
  String get guildSettingsOverviewBrandingTitle => '品牌設定';

  @override
  String get guildSettingsOverviewBrandingDescription => '更新您的圖示、名稱、橫幅和邀請背景';

  @override
  String get guildSettingsOverviewBannerUpload => '上傳橫幅';

  @override
  String get guildSettingsOverviewIdleTitle => '閒置設定';

  @override
  String get guildSettingsOverviewIdleDescription => '設定 AFK 頻道和逾時';

  @override
  String get guildSettingsOverviewSystemTitle => '系統與歡迎';

  @override
  String get guildSettingsOverviewSystemDescription => '選擇系統和歡迎訊息的目的地';

  @override
  String get guildSettingsOverviewNotificationsTitle => '預設通知';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      '成員人數超過 250 人的社群會強制套用「只接收提及通知」設定。您原本的設定會保留，若社群成員人數降到 250 人以下就會還原。';

  @override
  String get guildSettingsOverviewAdvancedTitle => '進階';

  @override
  String get guildSettingsOverviewFlexibleNames => '允許彈性的文字頻道名稱';

  @override
  String get guildSettingsOverviewHideOwnerCrown => '隱藏社群擁有者皇冠';

  @override
  String get guildSettingsOverviewDetachedBanner => '分離式橫幅';

  @override
  String get guildSettingsOverviewDetachedBannerHint => '在社群標頭下方的獨立區塊中顯示橫幅。';

  @override
  String get guildSettingsOverviewUploadIcon => '上傳圖示';

  @override
  String get guildSettingsOverviewRemoveImage => '移除';

  @override
  String get guildSettingsOverviewSplashTitle => '邀請背景';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => '聊天嵌入背景';

  @override
  String get guildSettingsOverviewEmbedSplashHint => '會顯示在聊天的邀請嵌入內容中。';

  @override
  String get guildSettingsOverviewUploadBackground => '上傳背景圖片';

  @override
  String get guildSettingsOverviewNoCommunityBanner => '沒有社群橫幅';

  @override
  String get guildSettingsOverviewNoInviteBackground => '沒有邀請背景';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => '預覽';

  @override
  String get guildSettingsOverviewInvitePreviewHint => '預覽訪客看到的邀請畫面。';

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
  String get permissionReadMessageHistory => '讀取訊息歷史記錄';

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
  String get guildSettingsMessageHistoryThresholdTitle => '訊息紀錄門檻';

  @override
  String get guildSettingsMessageHistoryThresholdEnable => '啟用訊息歷史紀錄門檻';

  @override
  String get guildSettingsMessageHistoryThresholdDate => '門檻日期';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      '沒有「讀取訊息歷史」權限的成員可查看此日期之後傳送的訊息。';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated => '訊息紀錄門檻已更新';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      '允許文字頻道名稱使用大寫字母和空格。關閉此設定會將名稱限制為小寫字母，並使用連字號和底線。';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint => '隱藏社群擁有者旁邊的皇冠圖示。';

  @override
  String get guildSettingsAnimatedIconRequiresFeature => '動畫圖示需要「動畫圖示」社群功能。';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature => '動畫橫幅需要「動畫橫幅」社群功能。';

  @override
  String get guildSettingsAfkChannel => 'AFK／閒置頻道';

  @override
  String get guildSettingsAfkChannelHint => '當成員處於 AFK 狀態時，將他們移至此頻道。';

  @override
  String get guildSettingsNoAfkChannel => '沒有閒置頻道';

  @override
  String get guildSettingsAfkTimeout => '閒置逾時';

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
  String get guildSettingsSystemChannel => '目標頻道';

  @override
  String get guildSettingsSystemChannelHint => '歡迎訊息和系統訊息將顯示在此。';

  @override
  String get guildSettingsNoSystemChannel => '沒有系統頻道';

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
  String get guildSettingsNotificationsMentions => '只接收提及通知';

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
      '自動篩選未標示為成人內容的頻道中，含有露骨內容的訊息。';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      '列於 Discovery 中的社群必須掃描所有成員。啟用 Discovery 時無法變更此設定。';

  @override
  String get guildSettingsContentFilterOff => '關閉';

  @override
  String get guildSettingsContentFilterOffDescription => '讓社群自行管理';

  @override
  String get guildSettingsContentFilterNoRole => '篩選沒有身分組的成員';

  @override
  String get guildSettingsContentFilterNoRoleDescription => '建議用於大多數社群';

  @override
  String get guildSettingsContentFilterAll => '篩選所有人';

  @override
  String get guildSettingsContentFilterAllDescription => '為闔家適宜的空間提供最高等級的保護';

  @override
  String get guildSettingsModerationMatureOff => '關閉';

  @override
  String get guildSettingsModerationMatureOn => '開啟';

  @override
  String get guildSettingsContentWarningToggle => '顯示內容警示';

  @override
  String get guildSettingsContentWarningToggleDescription => '在進入任何頻道前切換同意提示';

  @override
  String get guildSettingsContentWarningText => '自訂警告文字';

  @override
  String get guildSettingsContentWarningTextPlaceholder => '此內容含有敏感資訊。';

  @override
  String get guildSettingsModeration2faTitle => '雙重驗證要求';

  @override
  String get guildSettingsModeration2faDescription =>
      '要求管理員在封鎖、踢出、暫停或移除訊息前啟用雙重驗證。';

  @override
  String get guildSettingsModeration2faSwitchLabel => '管理動作需要雙重驗證';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip => '只有社群擁有者可以變更此設定';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      '請先為您的帳號啟用雙重驗證，才能變更此設定';

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
  String get guildSettingsStickerDropZone => '拖曳貼圖檔案到這裡（一次一個）';

  @override
  String get guildSettingsStickerDensity => '貼圖密度';

  @override
  String get guildSettingsStickerDensityCozy => '舒適';

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
  String get guildSettingsStickerNameRequired => '請輸入名稱';

  @override
  String get guildSettingsStickerNameTooShort => '名稱至少需要 2 個字元';

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
  String get guildSettingsBannedUsersTitle => '已停權的使用者';

  @override
  String get guildSettingsInvitesTableInviter => '邀請人';

  @override
  String get guildSettingsInvitesTableChannel => '頻道';

  @override
  String get guildSettingsInvitesTableCode => '驗證碼';

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
  String get createDm => '建立私訊';

  @override
  String get createGroupDm => '建立群組私訊';

  @override
  String get createDmNewMessage => '新訊息';

  @override
  String get createDmSelectFriends => '選擇好友';

  @override
  String get createDmChooseFriendsSubtitle => '選擇要傳送訊息的好友。';

  @override
  String get createDmSearchFriends => '搜尋好友';

  @override
  String get createDmNoFriendsFound => '找不到好友';

  @override
  String get createDmNoFriendsYet => '您還沒有任何好友';

  @override
  String get createDmClaimToStartDms => '認領帳號即可開始私訊。';

  @override
  String get createDmVerifyToStartDms => '請驗證您的電子郵件以開始私訊。';

  @override
  String get createDmVerifyYourEmail => '驗證您的電子郵件';

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
      '您已經和這些使用者建立群組了。真的要再建立一個新的嗎？當然也可以！';

  @override
  String get createDmNoActivityYet => '尚無動態';

  @override
  String get createDmSomeUsersCantBeAdded => '部分使用者無法新增';

  @override
  String get createDmCreateWithoutThem => '不加他們，直接建立';

  @override
  String get createDmUnaddableIntro => '以下使用者無法新增至這個群組私訊：';

  @override
  String createDmUnaddableProceed(int count) {
    return '要用剩餘的 $count 位成員建立群組私訊，並略過其他人嗎？';
  }

  @override
  String get createDmUnaddableNoneRemaining => '沒有剩餘的收件人可以建立群組私訊。';

  @override
  String get createDmUnaddableUserNotFound => '找不到使用者';

  @override
  String get createDmUnaddableBlocked => '您無法傳送訊息給這位使用者';

  @override
  String get createDmUnaddableNotFriends => '不在您的好友名單中';

  @override
  String get createDmUnaddableGroupDisabled => '不允許被加入群組私訊';

  @override
  String get createDmFailed => '無法建立對話。請再試一次。';

  @override
  String get dmListMessagesTitle => '訊息';

  @override
  String get dmListDirectMessagesTitle => '私訊';

  @override
  String get keybindsSearchShortcuts => '搜尋快速鍵';

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
  String get keybindSectionVoiceAndVideo => '語音與視訊';

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
  String get keybindActionHistoryForward => '在瀏覽過的頻道記錄中往前移動';

  @override
  String get keybindActionJumpUnreadChannels => '在未讀頻道間跳轉';

  @override
  String get keybindActionJumpMentionChannels => '在有提及的未讀頻道間跳轉';

  @override
  String get keybindActionJumpCurrentCall => '跳到目前的通話';

  @override
  String get keybindActionToggleLastGuildDms => '在上一個社群與私訊之間切換';

  @override
  String get keybindActionPreviousCommunityOrDms => '切換到上一個社群或私訊';

  @override
  String get keybindActionNextCommunityOrDms => '切換到下一個社群或私訊';

  @override
  String get keybindActionGoToDms => '前往私訊';

  @override
  String get keybindActionGoToFirstCommunity => '前往第一個社群';

  @override
  String get keybindActionGoToSecondCommunity => '前往第二個社群';

  @override
  String get keybindActionGoToThirdCommunity => '前往第三個社群';

  @override
  String get keybindActionGoToFourthCommunity => '前往第四個社群';

  @override
  String get keybindActionGoToFifthCommunity => '前往第五個社群';

  @override
  String get keybindActionGoToSixthCommunity => '前往第六個社群';

  @override
  String get keybindActionGoToSeventhCommunity => '前往第七個社群';

  @override
  String get keybindActionGoToEighthCommunity => '前往第八個社群';

  @override
  String get keybindActionToggleQuickSwitcher => '切換快速切換器';

  @override
  String get keybindActionCreateOrJoinCommunity => '建立或加入社群';

  @override
  String get keybindActionStartDragAndDrop => '開始拖放';

  @override
  String get keybindActionMove => '移動';

  @override
  String get keybindActionDropItem => '放下項目';

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
  String get keybindActionToggleEmojiPicker => '切換表情符號選擇器';

  @override
  String get keybindActionToggleGifPicker => '切換 GIF 選擇器';

  @override
  String get keybindActionToggleStickerPicker => '切換貼圖選擇器';

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
  String get keybindActionPushToTalkPriority => '按住說話（優先）';

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

  @override
  String get assistantNeedsLogin => '請先開啟 Fluxer 並登入。';

  @override
  String get assistantNotInVoice => '您沒有在通話中。';

  @override
  String get assistantNotFound => 'Fluxer 找不到該項目。';

  @override
  String get assistantDmsDisabled => '此伺服器已停用私訊功能。';

  @override
  String get assistantFailed => 'Fluxer 無法完成該操作。';

  @override
  String get assistantOkMuted => '已將麥克風靜音。';

  @override
  String get assistantOkUnmuted => '已取消麥克風靜音。';

  @override
  String get assistantOkLeftVoice => '已離開語音頻道。';

  @override
  String get assistantOkJoinedVoice => '正在加入語音頻道。';

  @override
  String get assistantOkStartedCall => '正在開始通話。';

  @override
  String assistantOkStatusSet(String status) {
    return '狀態已設為「$status」。';
  }

  @override
  String get assistantOkOpened => '正在開啟 Fluxer。';

  @override
  String get assistantOkMessageSent => '訊息已傳送。';

  @override
  String get assistantOkCustomStatusSet => '自訂狀態已更新。';

  @override
  String get assistantOkCustomStatusCleared => '自訂狀態已清除。';

  @override
  String get guildNavbarAnnouncementChannel => '公告頻道';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      '發布更新，讓其他社群可以追蹤到自己的頻道中';

  @override
  String get channelDetailsAnnouncementChannel => '公告頻道';

  @override
  String get channelSettingsAnnouncementChannel => '公告頻道';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      '讓其他社群追蹤此頻道，並取得您發布內容的副本。';

  @override
  String get channelSettingsStopAnnouncementTitle => '停止作為公告頻道？';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '有 $count 個頻道正在追蹤此頻道。將其轉換為文字頻道會移除這些追蹤。',
      one: '有 1 個頻道正在追蹤此頻道。將其轉換為文字頻道會移除該追蹤。',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      '將此頻道轉換為文字頻道後，所有頻道都會取消追蹤它。';

  @override
  String get channelSettingsConvertChannel => '轉換';

  @override
  String get channelSettingsConvertFailed => '無法轉換此頻道';

  @override
  String get channelSettingsChannelHasFollowers =>
      '仍有其他頻道追蹤此頻道。請先移除這些追蹤，再轉換此頻道。';

  @override
  String get channelMenuFollow => '追蹤頻道';

  @override
  String get channelFollowTitle => '追蹤此頻道';

  @override
  String get channelFollowBody => '選擇要發布訊息的目的地。您隨時可以在「社群設定」→「Webhook」中取消追蹤。';

  @override
  String get channelFollowCommunity => '社群';

  @override
  String get channelFollowChannel => '頻道';

  @override
  String get channelFollowAgeWarning => '這是年齡限制頻道。更新只能發送到年齡限制頻道。';

  @override
  String get channelFollowContentWarning => '這個頻道有內容警告。更新只能傳送到設有內容警告或年齡限制的頻道。';

  @override
  String get channelFollowHiddenHint => '您無法管理 Webhook 的社群和頻道已隱藏。';

  @override
  String get channelFollowEmpty => '您無法在任何社群中管理 Webhook。請要求管理員追蹤此頻道。';

  @override
  String get channelFollowSubmit => '追蹤';

  @override
  String get channelFollowFailed => '無法追蹤此頻道。';

  @override
  String get channelFollowSuccessTitle => '更新訊息即將送達！';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return '在 $sourceName 發布的訊息將會顯示在 #$targetName。';
  }

  @override
  String get channelFollowSuccessDismiss => '知道了！';

  @override
  String get channelFollowBarrier => '追蹤此頻道，即可在您選擇的頻道中接收這些公告。';

  @override
  String get channelHeaderFollow => '追蹤頻道';

  @override
  String get chatMessagePublish => '發布';

  @override
  String get chatMessagePublished => '已發布';

  @override
  String get chatMessagePublishConfirmTitle => '發布訊息？';

  @override
  String get chatMessagePublishConfirmBody => '這會將副本傳送至所有追蹤此頻道的頻道。';

  @override
  String get chatMessagePublishedToast => '訊息已發布';

  @override
  String get chatMessageAlreadyPublished => '此訊息已發布。';

  @override
  String get chatMessagePublishFailedTitle => '無法發布此訊息';

  @override
  String get chatMessagePublishFailedBody => '發生錯誤。請稍後再試。';

  @override
  String get chatMessagePublishLimitTitle => '慢一點';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return '您可以在 $duration 後再次發布。';
  }

  @override
  String get chatMessagePublishLimitUnknown => '您發布訊息的速度太快了。請稍後再試。';

  @override
  String get chatMessageDeletePublished => '這也會移除傳送至追蹤此頻道的其他頻道的訊息副本。';

  @override
  String get chatMessageEditPublishedTitle => '編輯已發布的訊息？';

  @override
  String get chatMessageEditPublishedBody => '這會更新已傳送至追蹤此頻道的其他頻道的訊息副本。';

  @override
  String get chatMessageEditPublishedSave => '儲存';

  @override
  String get chatMessageEditLimitTitle => '慢一點';

  @override
  String chatMessageEditLimitBody(String duration) {
    return '您可以在 $duration 後再次編輯這則已發布的訊息。';
  }

  @override
  String get chatMessageEditLimitUnknown => '您編輯這則已發布訊息的速度太快了。請稍後再試。';

  @override
  String get chatMessageOriginalDeleted => '[原始訊息已刪除]';

  @override
  String get userTagCommunity => '社群';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username 讓此頻道追蹤了 $source。在那裡發布的訊息將會顯示在這裡。';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username 讓此頻道追蹤了 $source。';
  }

  @override
  String get publishNudgeNotSent => '尚未發送給追蹤者。';

  @override
  String get publishNudgeHideForever => '不再顯示';

  @override
  String get publishNudgeDismiss => '關閉';

  @override
  String get channelSettingsFollowedChannels => '已追蹤的頻道';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      '此頻道追蹤的公告頻道。停止追蹤以停止接收副本。';

  @override
  String get guildSettingsFollowedChannelsDescription => '此社群中的頻道所追蹤的公告頻道。';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return '來自 $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused => '由於來源頻道已不再可用，更新已暫停。';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return '取消追蹤 $name？';
  }

  @override
  String get channelSettingsUnfollowBody => '此頻道將停止接收來自該公告頻道的副本。';

  @override
  String get channelSettingsUnfollow => '停止追蹤';

  @override
  String get crosspostCommunityTitle => '社群';

  @override
  String get crosspostGoToCommunity => '前往社群';

  @override
  String get crosspostJoinCommunity => '加入社群';

  @override
  String get crosspostSourceFailed => '無法載入這個社群。請稍後再試。';

  @override
  String crosspostMembers(int count) {
    return '$count 位成員';
  }

  @override
  String crosspostOnline(int count) {
    return '$count 人在線上';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分鐘',
      one: '1 分鐘',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 秒',
      one: '1 秒',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => '不支援的頻道類型';

  @override
  String get channelUnsupportedBody => '此應用程式版本不支援此頻道類型。';

  @override
  String get channelDetailsUnsupportedChannel => '不支援的頻道';
}
