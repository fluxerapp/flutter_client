// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class FluxerLocalizationsFa extends FluxerLocalizations {
  FluxerLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get reconnectingTitle => 'مشکل فنی!';

  @override
  String get reconnectingBody =>
      'مشکلی در سرورها وجود دارد.\nبه زودی درست می‌شود!';

  @override
  String get gatewayReconnectingToast => 'درحال اتصال مجدد…';

  @override
  String get gatewayConnectedToast => 'متصل شد';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'شروع با شکست مواجه شد: $error';
  }

  @override
  String get retry => 'تلاش مجدد';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'اتصال قطع شد';

  @override
  String get splashViewOnStatusPage => 'مشاهده در صفحه وضعیت';

  @override
  String get splashConnectionIssuesPrompt => 'مشکلات اتصال؟';

  @override
  String get splashStatusPageLink => 'صفحه وضعیت';

  @override
  String get splashReadIncident => 'مشاهده حادثه';

  @override
  String get splashIncidentHistory => 'تاریخچه حوادث';

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
  String get systemPermissionMicrophoneMessage =>
      'Fluxer doesn\'t have access to your microphone. You can enable it in your device privacy settings.';

  @override
  String get systemPermissionCameraMessage =>
      'Fluxer doesn\'t have access to your camera. You can enable it in your device privacy settings.';

  @override
  String get systemPermissionNotificationsMessage =>
      'Fluxer doesn\'t have permission to send notifications. You can enable it in your device settings.';

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
  String get welcomeBack => 'خوش برگشتی';

  @override
  String get email => 'ایمیل';

  @override
  String get emailInvalid => 'لطفاً یک آدرس ایمیل معتبر وارد کنید.';

  @override
  String get password => 'رمز عبور';

  @override
  String get forgotPassword => 'رمز عبور خود را فراموش کرده‌اید؟';

  @override
  String get logIn => 'ورود';

  @override
  String get logInWithPasskey => 'ورود با کلید عبور';

  @override
  String continueWithSso(String provider) {
    return 'ادامه با $provider';
  }

  @override
  String get ssoRequired => 'برای دسترسی به این نمونه، SSO الزامی است.';

  @override
  String get organizationSsoProvider =>
      'با ارائه‌دهنده ورود یکپارچه سازمان خود وارد شوید.';

  @override
  String get failedToStartSso => 'شروع SSO با شکست مواجه شد';

  @override
  String get ssoCancelled => 'ورود SSO لغو شد';

  @override
  String preferSso(String provider) {
    return 'ترجیح می‌دهید از SSO استفاده کنید؟ با $provider ادامه دهید.';
  }

  @override
  String get logInViaBrowser => 'ورود از طریق مرورگر';

  @override
  String get needAccountPrompt => 'حساب کاربری ندارید؟ ';

  @override
  String get register => 'ثبت‌نام';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'تأیید کنید که انسان هستید';

  @override
  String get captchaDescription =>
      'باید مطمئن شویم که ربات نیستید. لطفاً تأیید را در زیر تکمیل کنید.';

  @override
  String get captchaSwitchToHcaptcha =>
      'مشکل دارید؟ به جای آن hCaptcha را امتحان کنید';

  @override
  String get captchaSwitchToTurnstile => 'به جای آن Turnstile را امتحان کنید';

  @override
  String get cancel => 'لغو';

  @override
  String get ipAuthCheckEmail => 'ایمیل خود را بررسی کنید';

  @override
  String ipAuthDescription(String email) {
    return 'ما لینکی برای تأیید این ورود برای شما ایمیل کردیم. لطفاً صندوق ورودی خود را برای $email باز کنید.';
  }

  @override
  String get ipAuthConnectionLost => 'اتصال قطع شد';

  @override
  String get ipAuthConnectionLostDescription =>
      'هنگام انتظار برای تأیید، اتصال را از دست دادیم. لطفاً دوباره امتحان کنید.';

  @override
  String get ipAuthLinkExpired => 'لینک ورود منقضی شد';

  @override
  String get ipAuthLinkExpiredDescription =>
      'این لینک تأیید منقضی شده است. لطفاً دوباره وارد شوید.';

  @override
  String get ipAuthResendEmail => 'ارسال مجدد ایمیل';

  @override
  String get ipAuthResent => 'ارسال شد';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$secondsث';
  }

  @override
  String get back => 'بازگشت';

  @override
  String get mfaTitle => 'احراز هویت دو مرحله‌ای';

  @override
  String get mfaChooseMethod => 'یک روش تأیید را انتخاب کنید';

  @override
  String get mfaMethodTotp => 'برنامه احراز هویت';

  @override
  String get mfaMethodWebauthn => 'کلید امنیتی / کلید عبور';

  @override
  String get mfaTotpDescription =>
      'کد ۶ رقمی را از برنامه احراز هویت خود یا یکی از کدهای پشتیبان خود وارد کنید.';

  @override
  String get mfaCodeLabel => 'کد';

  @override
  String get mfaTryAnotherMethod => 'روش دیگری را امتحان کنید';

  @override
  String get mfaUseSecurityKey => 'از کلید امنیتی / گذرواژه عبور استفاده کنید';

  @override
  String get accountSelectorTitle => 'انتخاب حساب کاربری';

  @override
  String get accountSelectorDescription =>
      'برای ادامه یک حساب را انتخاب کنید، یا حساب دیگری اضافه کنید.';

  @override
  String get accountAdd => 'افزودن حساب کاربری';

  @override
  String get accountRemove => 'حذف';

  @override
  String accountRemoveTitle(String username) {
    return 'حذف $username';
  }

  @override
  String get accountRemoveDescription =>
      'این کار جلسه ذخیره شده برای این حساب را حذف می‌کند.';

  @override
  String get accountRemoveOnlyDescription =>
      'این کار تنها حساب ذخیره شده در این دستگاه را حذف می‌کند.';

  @override
  String get accountExpired => 'منقضی شده';

  @override
  String accountSessionExpired(String identifier) {
    return 'جلسه برای $identifier منقضی شده است. لطفاً دوباره وارد شوید.';
  }

  @override
  String get accountManageTitle => 'مدیریت حساب‌های کاربری';

  @override
  String get accountSwitchFailed =>
      'تغییر حساب کاربری امکان‌پذیر نبود. دوباره تلاش کنید.';

  @override
  String get profileTabMenuSwitchAccounts => 'تغییر حساب‌های کاربری';

  @override
  String get statusChangeSheetTitle => 'تنظیم وضعیت';

  @override
  String get statusOnlineStatusSection => 'وضعیت آنلاین';

  @override
  String get statusOnline => 'آنلاین';

  @override
  String get statusIdle => 'غیرفعال';

  @override
  String get statusDnd => 'مزاحم نشوید';

  @override
  String get statusInvisible => 'نامرئی';

  @override
  String get statusOffline => 'آفلاین';

  @override
  String get statusUntilIChangeIt => 'تا زمانی که آن را تغییر دهم';

  @override
  String get statusDontClear => 'پاک نکن';

  @override
  String get statusFor10Seconds => 'برای ۱۰ ثانیه';

  @override
  String get statusClearAfter10Seconds => '۱۰ ثانیه';

  @override
  String get statusClearAfter15Minutes => '۱۵ دقیقه';

  @override
  String get statusClearAfter30Minutes => '۳۰ دقیقه';

  @override
  String get statusClearAfter1Hour => '۱ ساعت';

  @override
  String get statusClearAfter3Hours => '۳ ساعت';

  @override
  String get statusClearAfter4Hours => '۴ ساعت';

  @override
  String get statusClearAfter8Hours => '۸ ساعت';

  @override
  String get statusClearAfter24Hours => '۲۴ ساعت';

  @override
  String get statusClearAfter3Days => '۳ روز';

  @override
  String get statusDndDescription =>
      'شما اعلان‌ها را در دسکتاپ دریافت نخواهید کرد';

  @override
  String get statusInvisibleDescription => 'شما آفلاین به نظر خواهید رسید';

  @override
  String get customStatusSetTitle => 'تنظیم وضعیت سفارشی';

  @override
  String get customStatusCurrentHint => 'وضعیت سفارشی';

  @override
  String get customStatusClear => 'حذف وضعیت سفارشی';

  @override
  String get customStatusPlaceholder => 'چه خبر است؟';

  @override
  String get customStatusChooseEmoji => 'انتخاب ایموجی';

  @override
  String get customStatusClearAfter => 'پاک کردن پس از';

  @override
  String get customStatusSave => 'ذخیره';

  @override
  String get accountActive => 'حساب فعال';

  @override
  String get signOut => 'خروج';

  @override
  String get suspendedPermanentTitle => 'حساب کاربری به طور دائم مسدود شده است';

  @override
  String get suspendedTemporaryTitle => 'حساب کاربری مسدود شده است';

  @override
  String get suspendedPermanentDescription =>
      'حساب کاربری شما به دلیل نقض شرایط خدمات ما به طور دائم مسدود شده است.';

  @override
  String get suspendedTemporaryDescription =>
      'حساب کاربری شما به طور موقت مسدود شده است. پس از پایان دوره تعلیق، می‌توانید به حساب خود دسترسی پیدا کنید.';

  @override
  String get suspendedIssuedAt => 'صادر شده در';

  @override
  String get suspendedEndsAt => 'پایان در';

  @override
  String get suspendedDuration => 'مدت زمان';

  @override
  String get suspendedPermanent => 'دائمی';

  @override
  String get suspendedReason => 'دلیل';

  @override
  String get suspendedAppealDeadline => 'مهلت تجدید نظر';

  @override
  String suspendedDeletionWarning(String date) {
    return 'حساب شما برای حذف در تاریخ $date زمان‌بندی شده است.';
  }

  @override
  String get suspendedRecheck => 'بررسی مجدد به‌روزرسانی‌ها';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'دوباره در $seconds ثانیه دیگر بررسی کنید';
  }

  @override
  String get suspendedBackToLogin => 'بازگشت به ورود';

  @override
  String get suspendedAppealTitle => 'تجدید نظر';

  @override
  String get suspendedAppealHint =>
      'توضیح دهید چرا تعلیق شما باید دوباره بررسی شود (حداقل ۵۰ کاراکتر)...';

  @override
  String get suspendedAppealSubmit => 'ارسال درخواست تجدید نظر';

  @override
  String get suspendedAppealPending => 'در انتظار بررسی';

  @override
  String get suspendedAppealAccepted => 'درخواست تجدید نظر پذیرفته شد';

  @override
  String get suspendedAppealRejected => 'درخواست تجدید نظر رد شد';

  @override
  String get suspendedAppealAcceptedDescription =>
      'درخواست تجدید نظر شما پذیرفته شده و حساب شما دوباره فعال شده است.';

  @override
  String get suspendedSignIn => 'ورود به حساب کاربری خود';

  @override
  String get forgotPasswordTitle => 'رمز عبور خود را فراموش کرده‌اید؟';

  @override
  String get forgotPasswordDescription =>
      'آدرس ایمیل خود را وارد کنید و ما لینکی برای بازنشانی رمز عبور برای شما ارسال خواهیم کرد.';

  @override
  String get forgotPasswordSubmit => 'ارسال لینک بازنشانی';

  @override
  String get forgotPasswordSentTitle => 'ایمیل خود را بررسی کنید';

  @override
  String get forgotPasswordSentDescription =>
      'دستورالعمل‌های بازنشانی رمز عبور به آدرس ایمیل شما ارسال شده است. لطفاً صندوق ورودی خود را بررسی کرده و برای بازنشانی رمز عبور، روی لینک کلیک کنید.';

  @override
  String get forgotPasswordBackToLogin => 'بازگشت به ورود';

  @override
  String get resetPasswordTitle => 'رمز عبور جدید تنظیم کنید';

  @override
  String get resetPasswordDescription =>
      'برای تکمیل فرآیند بازنشانی، رمز عبور جدید خود را در زیر وارد کنید.';

  @override
  String get resetPasswordNewPassword => 'رمز عبور جدید';

  @override
  String get resetPasswordConfirm => 'تأیید رمز عبور جدید';

  @override
  String get resetPasswordSubmit => 'بازنشانی رمز عبور';

  @override
  String get resetPasswordMismatch => 'رمزهای عبور مطابقت ندارند.';

  @override
  String get registerTitle => 'ایجاد حساب کاربری';

  @override
  String get registerDisplayName => 'نام نمایشی (اختیاری)';

  @override
  String get registerDisplayNameHint => 'مردم شما را با چه نامی صدا بزنند؟';

  @override
  String get registerUsername => 'نام کاربری (اختیاری)';

  @override
  String get registerUsernameHint => 'برای نام کاربری تصادفی، خالی بگذارید';

  @override
  String get registerUsernameTagHint =>
      'یک تگ ۴ رقمی به طور خودکار برای اطمینان از منحصر به فرد بودن اضافه می‌شود';

  @override
  String get registerDateOfBirth => 'تاریخ تولد';

  @override
  String get registerMonth => 'ماه';

  @override
  String get registerDay => 'روز';

  @override
  String get registerYear => 'سال';

  @override
  String get registerConsent => 'من با شرایط خدمات و خط مشی رازداری موافقم';

  @override
  String get registerConsentPrefix => 'من با ';

  @override
  String get registerConsentTerms => 'شرایط خدمات';

  @override
  String get registerConsentAnd => ' و ';

  @override
  String get registerConsentPrivacy => 'خط مشی رازداری';

  @override
  String get registerConfirmPassword => 'تأیید رمز عبور';

  @override
  String get registerSubmit => 'ایجاد حساب کاربری';

  @override
  String get registerHaveAccount => 'از قبل حساب کاربری دارید؟ ';

  @override
  String get passkeyNoCredentials =>
      'هیچ کلید عبوری برای این برنامه یافت نشد. در عوض با ایمیل و رمز عبور وارد شوید.';

  @override
  String get passkeyDeviceNotSupported =>
      'کلیدهای عبور در این دستگاه پشتیبانی نمی‌شوند.';

  @override
  String get passkeyDomainNotAssociated =>
      'کلیدهای عبور برای این برنامه پیکربندی نشده‌اند. در عوض با ایمیل و رمز عبور وارد شوید.';

  @override
  String get passkeyTimeout =>
      'احراز هویت کلید عبور منقضی شد. لطفاً دوباره امتحان کنید.';

  @override
  String get passkeyNotAvailable =>
      'کلیدهای عبور برای این برنامه در دسترس نیستند. در عوض با ایمیل و رمز عبور وارد شوید.';

  @override
  String get passkeyFailed =>
      'احراز هویت با کلید عبور ناموفق بود. لطفاً دوباره امتحان کنید.';

  @override
  String get errorUnableToCreateAccount =>
      'ایجاد حساب کاربری امکان‌پذیر نیست. لطفاً دوباره امتحان کنید.';

  @override
  String get errorUnableToSignIn =>
      'ورود به سیستم در حال حاضر امکان‌پذیر نیست. لطفاً دوباره امتحان کنید.';

  @override
  String get errorInvalidEmailOrPassword => 'ایمیل یا رمز عبور نامعتبر است.';

  @override
  String get errorUnableToSendResetLink =>
      'ارسال لینک بازنشانی امکان‌پذیر نیست. لطفاً دوباره امتحان کنید.';

  @override
  String get errorUnableToResetPassword =>
      'بازنشانی رمز عبور امکان‌پذیر نیست. لطفاً دوباره امتحان کنید.';

  @override
  String get embedInviteJoin => 'پیوستن به انجمن';

  @override
  String get embedInviteGoTo => 'رفتن به انجمن';

  @override
  String embedInviteOnline(String count) {
    return '$count نفر آنلاین';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count عضو';
  }

  @override
  String get embedInviteUnknownTitle => 'دعوت‌نامه نامعتبر';

  @override
  String get embedInviteUnknownSubtitle => 'سعی کنید دعوت‌نامه جدیدی بخواهید.';

  @override
  String get embedInviteUnavailable => 'دعوت‌نامه در دسترس نیست';

  @override
  String get inviteAcceptTitle => 'شما دعوت شده‌اید تا بپیوندید';

  @override
  String get inviteAcceptJoinButton => 'پیوستن به انجمن';

  @override
  String get inviteAcceptGoToButton => 'رفتن به انجمن';

  @override
  String get inviteAcceptInvitesPaused => 'دعوت‌نامه‌ها متوقف شده‌اند';

  @override
  String get inviteAcceptNotFoundTitle => 'دعوت‌نامه نامعتبر است';

  @override
  String get inviteAcceptNotFoundDescription =>
      'این دعوت‌نامه ممکن است منقضی شده یا نامعتبر باشد.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'پیوستن به گروه';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'شما توسط $inviterName به یک گروه پیام خصوصی دعوت شده‌اید';
  }

  @override
  String get inviteAcceptSomeone => 'شخصی';

  @override
  String get inviteAcceptEmojiPack => 'بسته ایموجی';

  @override
  String get inviteAcceptStickerPack => 'بسته استیکر';

  @override
  String get inviteAcceptInstallEmojiPack => 'نصب بسته ایموجی';

  @override
  String get inviteAcceptInstallStickerPack => 'نصب بسته استیکر';

  @override
  String get inviteAcceptPackInstallNote =>
      'با پذیرش این دعوت‌نامه، بسته به طور خودکار نصب می‌شود.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'دسترسی به کانال رد شد';

  @override
  String get channelAccessDeniedDescription =>
      'شما به کانالی که این پیام در آن ارسال شده است دسترسی ندارید.';

  @override
  String get messageJumpLinkNoAccess => 'دسترسی وجود ندارد';

  @override
  String get okay => 'باشه';

  @override
  String get embedThemeTitle => 'قالب اشتراک‌گذاری شده';

  @override
  String get embedThemeSubtitle =>
      'این کلاینت از قالب‌های سفارشی پشتیبانی نمی‌کند.';

  @override
  String get embedThemeUnavailableButton => 'قالب‌ها در دسترس نیستند';

  @override
  String get privacySettings => 'تنظیمات حریم خصوصی';

  @override
  String get privacyDirectMessages => 'پیام‌های خصوصی';

  @override
  String get privacyDirectMessagesDescription =>
      'اجازه ارسال پیام خصوصی از سایر اعضای این انجمن';

  @override
  String get privacyBotDirectMessages => 'پیام‌های خصوصی ربات';

  @override
  String get privacyBotDirectMessagesDescription =>
      'به ربات‌های این انجمن اجازه دهید پیام‌های خصوصی برای شما ارسال کنند';

  @override
  String get privacyMutualDmsDisabled =>
      'مدیران انجمن دریافت پیام‌های خصوصی صرفاً از اعضای مشترک در این انجمن را غیرفعال کرده‌اند.';

  @override
  String get communityDebug => 'اشکال‌زدایی انجمن';

  @override
  String get copiedToClipboard => 'کپی شد';

  @override
  String get notificationSettings => 'تنظیمات اعلان';

  @override
  String notificationMuteGuild(String guildName) {
    return 'بی‌صدا کردن $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'بی‌صدا کردن یک انجمن از نمایش نشانگرهای خوانده نشده و اعلان‌ها جلوگیری می‌کند مگر اینکه شما را منشن کنند.';

  @override
  String get notificationCommunitySettings => 'تنظیمات اعلان انجمن';

  @override
  String get notificationAllMessages => 'همه پیام‌ها';

  @override
  String get notificationOnlyMentions => 'فقط منشن‌ها';

  @override
  String get notificationNothing => 'هیچ';

  @override
  String get notificationSuppressEveryone => 'سرکوب @everyone و @here';

  @override
  String get notificationSuppressRoles => 'نادیده گرفتن تمام @منشن‌های نقش';

  @override
  String get notificationMobilePush => 'اعلان‌های پوش نوتیفیکیشن موبایل';

  @override
  String get notificationOverrides => 'لغو تنظیمات اعلان';

  @override
  String get notificationSelectChannel => 'انتخاب کانال یا دسته';

  @override
  String get notificationOnlyAtMentions => 'فقط @منشن‌ها';

  @override
  String get notificationMuteChannel => 'بی‌صدا کردن کانال';

  @override
  String get notificationUnmuteChannel => 'برداشتن بی‌صدا از کانال';

  @override
  String get notificationNoCategory => 'بدون دسته';

  @override
  String get dmMarkAsRead => 'علامت‌گذاری به عنوان خوانده شده';

  @override
  String get dmMuteConversation => 'بی‌صدا کردن گفتگوی خصوصی';

  @override
  String get dmUnmuteConversation => 'برداشتن بی‌صدا از گفتگوی خصوصی';

  @override
  String get dmPinDm => 'پین کردن گفتگوی خصوصی';

  @override
  String get dmUnpinDm => 'باز کردن پین گفتگوی خصوصی';

  @override
  String get dmAlwaysShowInSidebar => 'همیشه در نوار کناری نمایش بده';

  @override
  String get dmRemoveFromAlwaysShown => 'حذف از نمایش همیشگی';

  @override
  String get dmCloseDm => 'بستن گفتگوی خصوصی';

  @override
  String get dmCloseDmConfirmTitle => 'بستن گفتگوی خصوصی';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'آیا مطمئن هستید که می‌خواهید گفتگوی خصوصی خود را با $username ببندید؟ همیشه می‌توانید بعداً آن را دوباره باز کنید.';
  }

  @override
  String get dmCopyChannelId => 'کپی کردن شناسه کانال';

  @override
  String get dmChannelIdCopied => 'شناسه کانال کپی شد';

  @override
  String get dmCopyUserId => 'کپی کردن شناسه کاربر';

  @override
  String get dmUserIdCopied => 'شناسه کاربر کپی شد';

  @override
  String get dmViewProfile => 'مشاهده پروفایل';

  @override
  String get dmVoiceCall => 'شروع تماس صوتی';

  @override
  String get incomingVoiceCallTitle => 'تماس صوتی ورودی';

  @override
  String get incomingVoiceCallAccept => 'پاسخ دادن';

  @override
  String get incomingVoiceCallDecline => 'رد کردن';

  @override
  String get incomingVoiceCallLabel => 'تماس ورودی';

  @override
  String get incomingVoiceCallIgnore => 'نادیده گرفتن';

  @override
  String get directVoiceCallNotEligible =>
      'این تماس در حال حاضر قابل شروع نیست. لحظه‌ای دیگر دوباره امتحان کنید.';

  @override
  String get voiceJoinCallFailed =>
      'اتصال به این تماس امکان‌پذیر نبود. اتصال خود را بررسی کرده و دوباره امتحان کنید.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'اتصال به این تماس امکان‌پذیر نبود. اتصال خود را بررسی کرده و دوباره امتحان کنید.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'به‌روزرسانی این تماس در سرور امکان‌پذیر نبود. اتصال خود را بررسی کرده و دوباره امتحان کنید.';

  @override
  String get dmAddNote => 'افزودن یادداشت';

  @override
  String get dmEditGroup => 'ویرایش گروه';

  @override
  String get dmInviteToCommunity => 'دعوت به انجمن';

  @override
  String get dmBlock => 'مسدود کردن';

  @override
  String get dmLeaveGroup => 'ترک گروه';

  @override
  String get dmNoCommunitiesAvailable => 'انجمنی در دسترس نیست';

  @override
  String dmGroupMemberCount(int count) {
    return '$count عضو';
  }

  @override
  String get dmMuteFor15Min => 'برای ۱۵ دقیقه';

  @override
  String get dmMuteFor30Min => 'برای ۳۰ دقیقه';

  @override
  String get dmMuteFor1Hour => 'برای ۱ ساعت';

  @override
  String get dmMuteFor3Hours => 'برای ۳ ساعت';

  @override
  String get dmMuteFor4Hours => 'برای ۴ ساعت';

  @override
  String get dmMuteFor8Hours => 'برای ۸ ساعت';

  @override
  String get dmMuteFor24Hours => 'برای ۲۴ ساعت';

  @override
  String get dmMuteFor3Days => 'برای ۳ روز';

  @override
  String get dmMuteForever => 'تا زمانی که دوباره فعالش کنم';

  @override
  String get dmPinGroupDm => 'پین کردن گروه گفتگوی خصوصی';

  @override
  String get dmUnpinGroupDm => 'لغو پین کردن گروه DM';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'مورد علاقه کردن DM';

  @override
  String get dmUnfavoriteDm => 'حذف از مورد علاقه DM';

  @override
  String get dmFavoriteGroupDm => 'مورد علاقه کردن گروه DM';

  @override
  String get dmUnfavoriteGroupDm => 'حذف از مورد علاقه گروه DM';

  @override
  String get dmChangeFriendNickname => 'تغییر نام مستعار دوست';

  @override
  String get dmRemoveFriend => 'حذف دوست';

  @override
  String get dmAddFriend => 'افزودن دوست';

  @override
  String get dmAcceptFriendRequest => 'پذیرش درخواست دوستی';

  @override
  String get dmIgnoreFriendRequest => 'نادیده گرفتن درخواست دوستی';

  @override
  String get dmFriendRequestSent => 'درخواست دوستی ارسال شد';

  @override
  String get dmUnblock => 'رفع مسدودیت';

  @override
  String get dmDebugUser => 'اشکال‌زدایی کاربر';

  @override
  String get dmDebugChannel => 'اشکال‌زدایی کانال';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'DM پین شده';

  @override
  String get dmUnpinned => 'DM لغو پین شد';

  @override
  String get dmMuted => 'DM بی‌صدا شد';

  @override
  String get dmUnmuted => 'DM از بی‌صدا خارج شد';

  @override
  String get dmRemoveFriendConfirmTitle => 'حذف دوست';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'آیا مطمئن هستید که می‌خواهید $username را به عنوان دوست حذف کنید؟';
  }

  @override
  String get dmBlockConfirmTitle => 'مسدود کردن کاربر';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'آیا مطمئن هستید که می‌خواهید $username را مسدود کنید؟ او قادر به ارسال پیام یا درخواست دوستی به شما نخواهد بود.';
  }

  @override
  String get dmFriendRequestSentToast => 'درخواست دوستی ارسال شد';

  @override
  String get dmFriendRequestFailed => 'ارسال درخواست دوستی ناموفق بود';

  @override
  String get dmAcceptFriendRequestFailed => 'پذیرش درخواست دوستی ناموفق بود';

  @override
  String get dmRemoveFriendFailed => 'حذف دوست ناموفق بود';

  @override
  String get dmBlockFailed => 'مسدود کردن کاربر ناموفق بود';

  @override
  String get dmUnblockFailed => 'رفع مسدودیت کاربر ناموفق بود';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'نادیده گرفتن درخواست دوستی ناموفق بود';

  @override
  String get dmAddFriends => 'افزودن دوستان';

  @override
  String get addFriendSheetTitle => 'افزودن دوست';

  @override
  String get addFriendUsernameHint => 'نام کاربری#0000';

  @override
  String get addFriendUsernameLabel => 'نام کاربری دوست';

  @override
  String get addFriendSendRequest => 'ارسال درخواست';

  @override
  String get addFriendNoUserFound => 'هیچ کاربری با این نام کاربری یافت نشد.';

  @override
  String get addFriendInvalidUsername =>
      'یک نام کاربری معتبر وارد کنید (نام کاربری#0000).';

  @override
  String get addFriendOutgoingSuccess => 'درخواست دوستی ارسال شد';

  @override
  String get addFriendClaimTitle => 'حساب خود را ادعا کنید';

  @override
  String get addFriendClaimDescription =>
      'برای ارسال درخواست دوستی، حساب خود را ادعا کنید.';

  @override
  String get addFriendVerifyTitle => 'ایمیل خود را تأیید کنید';

  @override
  String get addFriendVerifyDescription =>
      'شما باید قبل از ارسال درخواست دوستی، آدرس ایمیل خود را تأیید کنید.';

  @override
  String get addFriendVerifyEmail => 'تأیید ایمیل';

  @override
  String addFriendIncomingRequests(int count) {
    return 'درخواست‌های دوستی ورودی ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'درخواست‌های دوستی خروجی ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'درخواست دوستی ورودی';

  @override
  String get addFriendOutgoingStatus => 'درخواست دوستی ارسال شد';

  @override
  String get addFriendViewProfile => 'مشاهده پروفایل';

  @override
  String get addFriendAccept => 'پذیرش';

  @override
  String get addFriendIgnore => 'نادیده گرفتن';

  @override
  String get addFriendAcceptTitle => 'پذیرش درخواست دوستی';

  @override
  String get addFriendIgnoreTitle => 'رد درخواست دوستی';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'آیا درخواست دوستی از $userName را می‌پذیرید؟';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'آیا درخواست دوستی از $displayName را نادیده می‌گیرید؟';
  }

  @override
  String get addFriendCancelRequest => 'لغو درخواست';

  @override
  String get addFriendCancelRequestFailed =>
      'امکان لغو درخواست دوستی وجود نداشت. دوباره تلاش کنید.';

  @override
  String get addFriendNotAcceptingRequests =>
      'آنها در حال حاضر درخواست دوستی را نمی‌پذیرند.';

  @override
  String get addFriendUnblockFirst =>
      'برای ارسال درخواست دوستی، ابتدا آنها را از مسدودیت خارج کنید.';

  @override
  String get addFriendCannotSendToSelf =>
      'شما نمی‌توانید درخواست دوستی برای خودتان ارسال کنید.';

  @override
  String get addFriendAlreadyFriends => 'شما از قبل با این کاربر دوست هستید.';

  @override
  String get addFriendClaimToSend =>
      'برای ارسال درخواست دوستی، ثبت نام خود را کامل کنید.';

  @override
  String get addFriendSendFailedGeneric =>
      'امکان ارسال درخواست دوستی وجود نداشت. دوباره تلاش کنید.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'سیستم';

  @override
  String get emojiSearchPlaceholder => 'بهترین ایموجی را پیدا کنید';

  @override
  String get emojiSearchEmpty => 'هیچ ایموجی با جستجوی شما مطابقت ندارد';

  @override
  String get emojiAutocompleteDefaultLabel => 'ایموجی پیش‌فرض';

  @override
  String get emojiFrequentlyUsed => 'اخیراً استفاده شده';

  @override
  String get emojiTabGifs => 'گیف‌ها';

  @override
  String get emojiTabMedia => 'رسانه';

  @override
  String get emojiTabStickers => 'استیکرها';

  @override
  String get emojiTabEmojis => 'ایموجی‌ها';

  @override
  String get gifPickerSearch => 'جستجوی گیف';

  @override
  String get gifPickerSearchKlipy => 'جستجوی KLIPY';

  @override
  String get gifPickerSearchTenor => 'جستجوی Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'مورد علاقه';

  @override
  String get gifPickerTrending => 'گیف‌های پرطرفدار';

  @override
  String get gifPickerNoResultsTitle => 'نتیجه جستجو یافت نشد';

  @override
  String get gifPickerNoResultsDescription =>
      'یک عبارت جستجوی دیگر را امتحان کنید';

  @override
  String get gifPickerLoadFailedTitle => 'بارگیری گیف‌ها ممکن نبود';

  @override
  String get gifPickerLoadFailedBody =>
      'اتصال خود را بررسی کرده و دوباره امتحان کنید.';

  @override
  String get emojiCategoryPeople => 'افراد';

  @override
  String get emojiCategoryNature => 'طبیعت';

  @override
  String get emojiCategoryFood => 'غذا و نوشیدنی';

  @override
  String get emojiCategoryActivity => 'فعالیت‌ها';

  @override
  String get emojiCategoryTravel => 'سفر و مکان‌ها';

  @override
  String get emojiCategoryObjects => 'اشیاء';

  @override
  String get emojiCategorySymbols => 'نمادها';

  @override
  String get emojiCategoryFlags => 'پرچم‌ها';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'با پلوتونیوم $emojiCount از $communityCount را باز کنید.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'پلوتونیوم را دریافت کنید';

  @override
  String get emojiPlutoniumUpsellDismiss => 'دیگر این را نشان نده';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ایموجی سفارشی',
      one: '۱ ایموجی سفارشی',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count انجمن',
      one: '۱ انجمن',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'هشدار لینک خارجی';

  @override
  String get externalLinkWarningLeaving => 'شما در حال خروج از فلوکسر هستید';

  @override
  String get externalLinkWarningDescription =>
      'پیوندهای خارجی می‌توانند خطرناک باشند. لطفاً مراقب باشید.';

  @override
  String get externalLinkWarningDestinationUrl => 'آدرس مقصد:';

  @override
  String get externalLinksSectionTitle => 'پیوندهای خارجی';

  @override
  String get externalLinksSectionDescription =>
      'نحوه رسیدگی به هشدارهای لینک خارجی را پیکربندی کنید.';

  @override
  String get externalLinkWarningTrustPrefix => 'همیشه اعتماد کن ';

  @override
  String get externalLinkWarningTrustSuffix => '— این هشدار را دفعه بعد رد کن';

  @override
  String get externalLinkVisitSite => 'مشاهده سایت';

  @override
  String get externalLinkTrustAllLabel => 'اعتماد به همه لینک‌های خارجی';

  @override
  String get externalLinkStripTrackingLabel => 'حذف پارامترهای ردیابی از URLها';

  @override
  String get externalLinkStripTrackingDescription =>
      'پارامترهای ردیابی (مانند utm_source، fbclid، gclid) را از URLهای پیام‌های ارسالی خود به‌طور خودکار حذف کنید. لینک را قبل از رسیدن به دیگران پاک می‌کند.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'به همه لینک‌های خارجی اعتماد می‌کنید؟';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'این کار به همه لینک‌های خارجی اعتماد می‌کند و هشدار برای هر دامنه را رد می‌کند. دامنه‌های مورد اعتماد فعلی شما جایگزین خواهند شد. این کمتر امن است.';

  @override
  String get externalLinkTrustAllConfirmAction => 'اعتماد به همه';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'اعتماد به همه لینک‌ها را متوقف می‌کنید؟';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'هشدارهای لینک خارجی دوباره نمایش داده می‌شوند. باید دامنه‌ها را به‌صورت جداگانه اضافه کنید.';

  @override
  String get externalLinkStopTrustingAllAction => 'غیرفعال کردن اعتماد به همه';

  @override
  String get externalLinkTrustedAllDescription =>
      'به همه لینک‌های خارجی اعتماد شده است. هشدارها نمایش داده نمی‌شوند.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'شما $count دامنه مورد اعتماد دارید. با علامت زدن کادر هنگام بازدید از لینک‌های خارجی، دامنه‌های بیشتری اضافه کنید.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'هنگامی که فعال باشد، هیچ هشداری برای لینک خارجی نمایش داده نمی‌شود. این کمتر امن است.';

  @override
  String get imageFileTooLarge =>
      'فایل تصویر خیلی بزرگ است. لطفاً فایلی با حجم کمتر از ۱۰ مگابایت انتخاب کنید.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'آواتارهای متحرک به Plutonium نیاز دارند';

  @override
  String get animatedBannersRequirePlutonium =>
      'بنرهای متحرک به Plutonium نیاز دارند';

  @override
  String get animatedAvifNotSupported => 'AVIF متحرک پشتیبانی نمی‌شود';

  @override
  String get animatedAvifNotSupportedBody =>
      'برش و چرخش فایل‌های AVIF متحرک هنوز پشتیبانی نمی‌شود. اگر ادامه دهید، در فرمت اصلی خود آپلود خواهد شد.';

  @override
  String get uploadAsIs => 'همانطور که هست آپلود کن';

  @override
  String get croppingAnimatedNotSupported =>
      'برش تصاویر متحرک هنوز پشتیبانی نمی‌شود. فایل اصلی آپلود شده استفاده خواهد شد.';

  @override
  String get cropAvatar => 'برش آواتار';

  @override
  String get cropBanner => 'برش بنر';

  @override
  String get skip => 'رد شدن';

  @override
  String get crop => 'برش';

  @override
  String get changeYourFluxerTag => 'تغییر FluxerTag شما';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'نام‌های کاربری فقط می‌توانند شامل حروف (a-z، A-Z)، اعداد (0-9) و خط زیر باشند. نام‌های کاربری به بزرگی و کوچکی حروف حساس نیستند.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'نام‌های کاربری فقط می‌توانند شامل حروف (a-z، A-Z)، اعداد (0-9) و خط زیر باشند. نام‌های کاربری به بزرگی و کوچکی حروف حساس نیستند. می‌توانید هر تگ ۴ رقمی موجود از #0000 تا #9999 را انتخاب کنید.';

  @override
  String get fluxerTagDescriptionPremium =>
      'نام‌های کاربری فقط می‌توانند شامل حروف (a-z، A-Z)، اعداد (0-9) و خط زیر باشند. نام‌های کاربری به بزرگی و کوچکی حروف حساس نیستند. می‌توانید هر تگ ۴ رقمی موجود از #0001 تا #9999 را انتخاب کنید.';

  @override
  String validationLengthRange(int min, int max) {
    return 'بین $min و $max کاراکتر';
  }

  @override
  String get validationAllowedChars =>
      'فقط حروف (a-z، A-Z)، اعداد (0-9) و خط زیر (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'برای سفارشی کردن تگ خود یا حفظ آن هنگام تغییر نام کاربری، Plutonium دریافت کنید';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag از قبل گرفته شده است';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminator از قبل گرفته شده است. ادامه دادن باعث می‌شود که دیسکریمییناتور شما به‌طور خودکار دوباره انتخاب شود.';
  }

  @override
  String get customTagIsTemporary => 'تگ سفارشی موقتی است';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'تگ ۴ رقمی سفارشی شما فقط تا زمانی که اشتراک Plutonium شما فعال باشد در دسترس است. هنگامی که اشتراک شما در تاریخ $date منقضی شود، تگ شما پس از یک دوره مهلت ۳ روزه به یک عدد تصادفی باز می‌گردد.';
  }

  @override
  String get customTagTemporaryBody =>
      'تگ ۴ رقمی سفارشی شما فقط تا زمانی که اشتراک Plutonium شما فعال باشد در دسترس است. هنگامی که اشتراک شما منقضی شود، تگ شما پس از یک دوره مهلت ۳ روزه به یک عدد تصادفی باز می‌گردد.';

  @override
  String get iUnderstandContinue => 'متوجه شدم، ادامه می‌دهم';

  @override
  String get premiumWarningPendingDiscriminator =>
      'اگر این FluxerTag را ذخیره کنید، تگ ۴ رقمی سفارشی شما هنگام پایان اشتراک Plutonium به یک عدد تصادفی باز می‌گردد. اگر اشتراک شما تمدید نشود، قبل از تغییر تگ، ۳ روز مهلت خواهید داشت.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'تگ ۴ رقمی سفارشی شما (#$discriminator) تا زمانی که اشتراک Plutonium شما فعال باشد، فعال است. اگر اشتراک شما پس از ۳ روز مهلت منقضی شود یا تمدید نشود، تگ شما به یک عدد تصادفی باز می‌گردد.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'تگ ۴ رقمی خود را سفارشی کنید یا هنگام تغییر نام کاربری آن را حفظ کنید';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'دوره آزمایشی Plutonium شما در $date منقضی می‌شود. برای حفظ تگ سفارشی خود و کسب نشان در پروفایل خود، ارتقا دهید.';
  }

  @override
  String get premiumTrialActive =>
      'شما در دوره آزمایشی Plutonium هستید. برای حفظ تگ سفارشی خود و کسب نشان در پروفایل خود، ارتقا دهید.';

  @override
  String get fluxerTagUpdated => 'FluxerTag به‌روز شد';

  @override
  String get fluxerTagUpdateFailed =>
      'به‌روزرسانی FluxerTag ناموفق بود. لطفاً دوباره امتحان کنید.';

  @override
  String get continueAction => 'ادامه';

  @override
  String get profileCustomizationTitle => 'سفارشی‌سازی پروفایل';

  @override
  String get profileCustomizationDescription =>
      'ظاهر پروفایل خود را ویرایش کنید و پیش‌نمایش زنده را ببینید';

  @override
  String get usernameLabel => 'نام کاربری';

  @override
  String get claimAccountToChangeFluxerTag =>
      'برای تغییر FluxerTag خود حساب خود را ادعا کنید';

  @override
  String get changeFluxerTag => 'تغییر FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'تگ ۴ رقمی خود (#$discriminator) را با پلوتونیوم شخصی‌سازی کنید';
  }

  @override
  String get changeUsernameAndTagHint =>
      'نام کاربری و تگ ۴ رقمی خود را تغییر دهید';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'تگ سفارشی شما (#$discriminator) به اشتراک پلوتونیوم شما گره خورده است و در صورت انقضا به یک تگ تصادفی باز خواهد گشت.';
  }

  @override
  String get displayNameLabel => 'نام نمایشی';

  @override
  String get pronounsLabel => 'ضمایر';

  @override
  String get avatarLabel => 'آواتار';

  @override
  String get changeAvatar => 'تغییر آواتار';

  @override
  String get removeAvatar => 'حذف آواتار';

  @override
  String get avatarDescription =>
      'PNG، JPEG، WebP، GIF. حداکثر ۱۰ مگابایت. توصیه شده: ۵۱۲×۵۱۲ پیکسل';

  @override
  String get bannerLabel => 'بنر';

  @override
  String get changeBanner => 'تغییر بنر';

  @override
  String get removeBanner => 'حذف بنر';

  @override
  String get bannerDescription =>
      'PNG، JPEG، WebP، GIF. حداکثر ۱۰ مگابایت. حداقل: ۹۶۰×۵۴۰ پیکسل (۱۶:۹)';

  @override
  String get accentColorLabel => 'رنگ برجسته';

  @override
  String get accentColorDescription =>
      'رنگ حاشیه و بنر پروفایل شما را سفارشی می‌کند';

  @override
  String get aboutMeLabel => 'درباره من';

  @override
  String get aboutMeHelperText =>
      'می‌توانید از لینک‌ها، ایموجی‌ها و Markdown استفاده کنید.';

  @override
  String get emojiPickerTitle => 'ایموجی';

  @override
  String get plutoniumBadgePrivacyTitle => 'حریم خصوصی نشان پلوتونیوم';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'نحوه نمایش نشان پلوتونیوم خود را به دیگران کنترل کنید';

  @override
  String get hidePlutoniumBadgeLabel => 'پنهان کردن کامل نشان پلوتونیوم';

  @override
  String get hidePlutoniumBadgeDescription =>
      'نشان پلوتونیوم خود را کاملاً از سایر کاربران پنهان کنید';

  @override
  String get hidePlutoniumPurchaseDate => 'تاریخ خرید پلوتونیوم را پنهان کنید';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'تاریخ خرید پلوتونیوم را پنهان کنید ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'تاریخ اولین خرید پلوتونیوم خود را از نشان خود حذف کنید';

  @override
  String get maskVisionaryAsSubscription => 'نمایش Visionary به عنوان اشتراک';

  @override
  String get maskVisionaryDescription =>
      'Visionary خود را به جای آن به عنوان یک اشتراک معمولی نمایش دهید';

  @override
  String get hideVisionaryIdBadge => 'پنهان کردن نشان شناسه Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'پنهان کردن نشان شناسه Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'نشان شناسه Visionary خود را حذف کنید';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'شما در دوره آزمایشی پلوتونیوم هستید — اشتراک شما در تاریخ $date آغاز می‌شود';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'اشتراک شما به طور خودکار پس از پایان دوره آزمایشی آغاز خواهد شد. نیازی به اقدام نیست.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'شما در دوره آزمایشی پلوتونیوم هستید که در تاریخ $date منقضی می‌شود';
  }

  @override
  String get premiumTrialActiveProfile => 'شما در دوره آزمایشی پلوتونیوم هستید';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG، PNG، WebP. حداکثر ۱۰ مگابایت. توصیه شده: ۵۱۲×۵۱۲ پیکسل. آواتارهای متحرک (GIF) به پلوتونیوم نیاز دارند.';

  @override
  String get bannerPlutoniumUpsell =>
      'پروفایل خود را با یک تصویر بنر ثابت یا متحرک سفارشی کنید تا برجسته شود.';

  @override
  String get getPlutonium => 'دریافت پلوتونیوم';

  @override
  String get plutoniumNotAvailableTitle => 'پلوتونیوم';

  @override
  String get plutoniumNotAvailableBody =>
      'خرید درون برنامه‌ای هنوز در این پلتفرم در دسترس نیست. منتظر باشید — به زودی!';

  @override
  String get profilePreviewLabel => 'پیش‌نمایش';

  @override
  String get profilePreviewMessage => 'پیام';

  @override
  String get profilePreviewMemberSince => 'عضو Fluxer از';

  @override
  String get unclaimedAccountTitle => 'حساب ادعا نشده';

  @override
  String get unclaimedAccountDescription =>
      'حساب شما هنوز ادعا نشده است. بدون ایمیل و رمز عبور، ممکن است دسترسی خود را از دست بدهید. برای امن کردن حساب خود، اکنون آن را ادعا کنید.';

  @override
  String get claimAccount => 'ادعای حساب';

  @override
  String get profileTypeLabel => 'نوع پروفایل';

  @override
  String get profileTypeGlobal => 'پروفایل سراسری';

  @override
  String get profileTypeGuildDescription =>
      'شما در حال ویرایش پروفایل مخصوص انجمن خود هستید. این پروفایل فقط در این انجمن قابل مشاهده خواهد بود و پروفایل سراسری شما را لغو می‌کند.';

  @override
  String get communityNicknameLabel => 'نام مستعار انجمن';

  @override
  String get perGuildPremiumUpsellText =>
      'شخصی‌سازی آواتار، بنر، رنگ تأکید و بیو برای انجمن‌های خاص نیازمند پلوتونیوم است. نام مستعار انجمن و ضمایر برای همه رایگان است.';

  @override
  String get avatarModeInherit => 'استفاده از پروفایل سراسری';

  @override
  String get avatarModeCustom => 'استفاده از تصویر سفارشی';

  @override
  String get avatarModeUnset => 'عدم نمایش';

  @override
  String get profileSavedToast => 'پروفایل به‌روز شد';

  @override
  String get profileEditButton => 'ویرایش پروفایل';

  @override
  String get profileNoteLabel => 'یادداشت';

  @override
  String get profileNoteVisibility => '(فقط برای شما قابل مشاهده است)';

  @override
  String get profileNoteEmpty => 'هنوز یادداشتی وجود ندارد.';

  @override
  String get sudoTitle => 'هویت خود را تأیید کنید';

  @override
  String get sudoDescription => 'این اقدام برای ادامه نیاز به تأیید دارد.';

  @override
  String get sudoAuthenticatorCode => 'کد احراز هویت';

  @override
  String get sudoMethodPassword => 'گذرواژه';

  @override
  String get sudoMethodTotp => 'احراز هویت';

  @override
  String get sudoVerificationFailed =>
      'تأیید ناموفق بود. لطفاً دوباره تلاش کنید.';

  @override
  String get securityAccountTitle => 'حساب';

  @override
  String get securityAccountDescription =>
      'تنظیمات ایمیل، گذرواژه و حساب خود را مدیریت کنید';

  @override
  String get securitySectionTitle => 'امنیت';

  @override
  String get securitySectionDescription =>
      'حساب خود را با احراز هویت دو مرحله‌ای و کلیدهای عبور محافظت کنید';

  @override
  String get securityLoginEmailSectionTitle => 'تنظیمات ایمیل';

  @override
  String get securityLoginEmailSectionDescription =>
      'آدرس ایمیلی را که برای ورود به فلوکسر استفاده می‌کنید مدیریت کنید';

  @override
  String get securityLoginEmailAddressLabel => 'آدرس ایمیل';

  @override
  String get securityLoginNoEmailSet => 'هیچ آدرس ایمیلی تنظیم نشده است';

  @override
  String get securityLoginChangeEmail => 'تغییر ایمیل';

  @override
  String get securityLoginAddEmail => 'افزودن ایمیل';

  @override
  String get securityLoginReveal => 'نمایش';

  @override
  String get securityLoginHide => 'پنهان کردن';

  @override
  String get securityLoginPasswordSectionTitle => 'گذرواژه';

  @override
  String get securityLoginPasswordSectionDescription =>
      'گذرواژه خود را تغییر دهید تا حساب خود را امن نگه دارید';

  @override
  String get securityLoginCurrentPasswordLabel => 'گذرواژه فعلی';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'آخرین تغییر: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'آخرین تغییر: هرگز';

  @override
  String get securityLoginNoPasswordSet => 'هیچ گذرواژه‌ای تنظیم نشده است';

  @override
  String get securityLoginChangePassword => 'تغییر گذرواژه';

  @override
  String get securityLoginSetPassword => 'تنظیم گذرواژه';

  @override
  String get passwordChangeTitle => 'تغییر گذرواژه';

  @override
  String get passwordChangeIntroDescription =>
      'قبل از تغییر گذرواژه، یک کد تأیید به آدرس ایمیل شما ارسال می‌کنیم تا هویت شما را تأیید کنیم.';

  @override
  String get passwordChangeStart => 'شروع';

  @override
  String get passwordChangeVerifyTitle => 'ایمیل خود را تأیید کنید';

  @override
  String get passwordChangeVerifyDescription =>
      'کد تأیید ارسال شده به آدرس ایمیل خود را وارد کنید.';

  @override
  String get passwordChangeVerificationCode => 'کد تأیید';

  @override
  String get passwordChangeVerify => 'تأیید';

  @override
  String get passwordChangeNewPasswordTitle => 'تنظیم گذرواژه جدید';

  @override
  String get passwordChangeNewPasswordDescription =>
      'گذرواژه جدید خود را در زیر وارد کنید.';

  @override
  String get passwordChangeNewPassword => 'گذرواژه جدید';

  @override
  String get passwordChangeConfirmPassword => 'تأیید گذرواژه جدید';

  @override
  String get passwordChangeSubmit => 'تغییر گذرواژه';

  @override
  String get passwordChangeSuccess => 'گذرواژه تغییر کرد';

  @override
  String get passwordChangePasswordsDoNotMatch => 'گذرواژه‌ها مطابقت ندارند';

  @override
  String get passwordChangeInvalidCode => 'کد نامعتبر یا منقضی شده';

  @override
  String get emailChangeTitle => 'تغییر ایمیل';

  @override
  String get emailChangeIntroDescription =>
      'برای تأیید هویت شما قبل از تغییر آدرس ایمیل، کدهای تأیید ارسال خواهیم کرد.';

  @override
  String get emailChangeStart => 'شروع';

  @override
  String get emailChangeVerifyOriginalTitle => 'تأیید ایمیل فعلی';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'کد تأیید ارسال شده به ایمیل فعلی خود را وارد کنید.';

  @override
  String get emailChangeNewEmailTitle => 'ورود ایمیل جدید';

  @override
  String get emailChangeNewEmailDescription =>
      'آدرس ایمیل جدیدی را که می‌خواهید استفاده کنید وارد کنید.';

  @override
  String get emailChangeNewEmailLabel => 'ایمیل جدید';

  @override
  String get emailChangeNewEmailSubmit => 'ارسال کد تأیید';

  @override
  String get emailChangeVerifyNewTitle => 'تأیید ایمیل جدید';

  @override
  String get emailChangeVerifyNewDescription =>
      'کد تأیید ارسال شده به آدرس ایمیل جدید خود را وارد کنید.';

  @override
  String get emailChangeSuccess => 'ایمیل تغییر کرد';

  @override
  String get emailChangeInvalidCode => 'کد نامعتبر یا منقضی شده';

  @override
  String get resend => 'ارسال مجدد';

  @override
  String resendCountdown(int seconds) {
    return 'ارسال مجدد (${seconds}s)';
  }

  @override
  String get verificationCode => 'کد تأیید';

  @override
  String get verify => 'تأیید';

  @override
  String get enable => 'فعال کردن';

  @override
  String get disable => 'غیرفعال کردن';

  @override
  String get delete => 'حذف';

  @override
  String get save => 'ذخیره';

  @override
  String get securityTfaSectionTitle => 'احراز هویت دو مرحله‌ای';

  @override
  String get securityTfaSectionDescription =>
      'یک لایه امنیتی اضافی به حساب خود اضافه کنید';

  @override
  String get securityTfaAuthenticatorApp => 'برنامه احراز هویت';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'احراز هویت دو مرحله‌ای فعال است';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'از یک برنامه احراز هویت برای تولید کد برای احراز هویت دو مرحله‌ای استفاده کنید';

  @override
  String get securityTfaBackupCodes => 'کدهای پشتیبان';

  @override
  String get securityTfaBackupCodesDescription =>
      'کدهای پشتیبان خود را برای بازیابی حساب مشاهده و مدیریت کنید';

  @override
  String get securityTfaViewCodes => 'مشاهده کدها';

  @override
  String get securityPasskeysSectionTitle => 'کلیدهای عبور';

  @override
  String get securityPasskeysSectionDescription =>
      'از کلیدهای عبور برای ورود بدون رمز عبور و احراز هویت دو مرحله‌ای استفاده کنید';

  @override
  String get securityPasskeysRegistered => 'کلیدهای عبور ثبت شده';

  @override
  String get securityPasskeysNone => 'هیچ کلید عبوری ثبت نشده است';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'کلید عبور',
      one: 'کلید عبور',
    );
    return '$count $_temp0 ثبت شده (حداکثر ۱۰)';
  }

  @override
  String get securityPasskeysAdd => 'افزودن کلید عبور';

  @override
  String securityPasskeysAdded(String date) {
    return 'افزوده شده در: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'آخرین استفاده: $date';
  }

  @override
  String get securityPasskeysRename => 'تغییر نام';

  @override
  String get securityPasskeysDeleteTitle => 'حذف کلید عبور';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'آیا مطمئن هستید که می‌خواهید کلید عبور \"$name\" را حذف کنید؟';
  }

  @override
  String get securityPasskeyNameTitle => 'نام‌گذاری کلید عبور';

  @override
  String get securityPasskeyNameLabel => 'نام کلید عبور';

  @override
  String get securityPasskeyNameHint =>
      'مثال: YubiKey، iPhone، کامپیوتر محل کار';

  @override
  String get securityPhoneSectionTitle => 'شماره تلفن';

  @override
  String get securityPhoneSectionDescription =>
      'شماره تلفن خود را مدیریت کنید.';

  @override
  String get securityPhoneLabel => 'شماره تلفن';

  @override
  String get securityPhoneNone => 'هیچ شماره تلفنی اضافه نشده است.';

  @override
  String get securityPhoneAdd => 'افزودن تلفن';

  @override
  String get securityPhoneRemove => 'حذف';

  @override
  String get securityPhoneRemoveTitle => 'حذف شماره تلفن';

  @override
  String get securityPhoneRemoveDescription =>
      'آیا مطمئن هستید که می‌خواهید شماره تلفن خود را حذف کنید؟';

  @override
  String get securityPhoneRemoved => 'شماره تلفن حذف شد';

  @override
  String get securityClaimTitle => 'ویژگی‌های امنیتی';

  @override
  String get securityClaimDescription =>
      'برای دسترسی به ویژگی‌های امنیتی مانند احراز هویت دو مرحله‌ای و کلیدهای عبور، حساب خود را ادعا کنید.';

  @override
  String get securityVerifyEmailRequired =>
      'قبل از راه‌اندازی احراز هویت دو مرحله‌ای، کلیدهای عبور یا تأیید پیامک، باید آدرس ایمیل خود را تأیید کنید.';

  @override
  String get totpEnableTitle => 'راه‌اندازی برنامه احراز هویت';

  @override
  String get totpEnableDescription =>
      'کد QR را با برنامه احراز هویت خود اسکن کنید تا کدهایی برای احراز هویت دو مرحله‌ای تولید شود.';

  @override
  String get totpEnableCodeLabel => 'کد';

  @override
  String get totpEnableCodeHint =>
      'کد ۶ رقمی برنامه احراز هویت خود را وارد کنید';

  @override
  String get totpEnableSuccess => 'احراز هویت دو مرحله‌ای فعال شد';

  @override
  String get totpDisableTitle => 'حذف برنامه احراز هویت';

  @override
  String get totpDisableDescription =>
      'برای غیرفعال کردن احراز هویت دو مرحله‌ای، کد ۶ رقمی برنامه احراز هویت خود را وارد کنید.';

  @override
  String get totpDisableSuccess => 'احراز هویت دو مرحله‌ای غیرفعال شد';

  @override
  String get backupCodesTitle => 'کدهای پشتیبان';

  @override
  String get backupCodesWarning =>
      'اگر دسترسی به برنامه احراز هویت خود را از دست بدهید و این کدها را نداشته باشید، برای همیشه از حساب خود قفل خواهید شد. اکنون آن‌ها را دانلود یا کپی کنید و در جایی امن نگهداری کنید.';

  @override
  String get backupCodesDownload => 'دانلود';

  @override
  String get backupCodesCopy => 'کپی';

  @override
  String get backupCodesCopied => 'کدهای پشتیبان در کلیپ‌بورد کپی شد';

  @override
  String get backupCodesAcknowledge =>
      'من کدهای پشتیبان خود را دانلود یا کپی کرده و در مکانی امن نگهداری کرده‌ام.';

  @override
  String get backupCodesDone => 'انجام شد';

  @override
  String get backupCodesViewTitle => 'مشاهده کدهای پشتیبان';

  @override
  String get backupCodesViewDescription =>
      'ممکن است قبل از مشاهده کدهای پشتیبان شما، تأیید لازم باشد.';

  @override
  String get phoneAddTitle => 'افزودن شماره تلفن';

  @override
  String get phoneAddLabel => 'شماره تلفن';

  @override
  String get phoneAddHint => 'شماره تلفن خود را وارد کنید';

  @override
  String get phoneAddFooter =>
      'شماره تلفن خود را وارد کنید. ما یک کد تأیید از طریق پیامک برای شما ارسال خواهیم کرد.';

  @override
  String get phoneAddSendCode => 'ارسال کد';

  @override
  String get phoneVerifyTitle => 'تأیید شماره تلفن';

  @override
  String get phoneVerifyDescription =>
      'کد تأیید ارسال شده به شماره تلفن خود را وارد کنید.';

  @override
  String get phoneAddSuccess => 'شماره تلفن اضافه شد';

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
  String get requiredActionIntroGeneric =>
      'Complete the required verification to continue using Fluxer.';

  @override
  String get requiredActionIntroPhone =>
      'Your registration needs an extra anti-spam check before you can continue.';

  @override
  String get requiredActionIntroEmailOrPhone =>
      'Verify your email or phone to continue using Fluxer.';

  @override
  String get requiredActionIntroEmailAndPhone =>
      'Complete the required email and phone verification steps below to continue using Fluxer.';

  @override
  String get requiredActionChooseMethodTitle => 'Choose a verification method';

  @override
  String get requiredActionChooseMethodDescription =>
      'Complete one of the verification paths below to continue using Fluxer.';

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
  String get dangerZoneSectionTitle => 'منطقه خطر';

  @override
  String get dangerZoneSectionDescription => 'اقدامات برگشت‌ناپذیر و مخرب';

  @override
  String get dangerZoneDisableTitle => 'غیرفعال کردن حساب';

  @override
  String get dangerZoneDisableDescription =>
      'حساب خود را به طور موقت غیرفعال کنید. بعداً با ورود مجدد می‌توانید آن را دوباره فعال کنید.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'غیرفعال کردن حساب شما باعث خروج شما از تمام جلسات خواهد شد. شما می‌توانید در هر زمان با ورود مجدد، حساب خود را دوباره فعال کنید.';

  @override
  String get dangerZoneDeleteTitle => 'حذف حساب';

  @override
  String get dangerZoneDeleteDescription =>
      'حساب و تمام داده‌های مرتبط را به طور دائم حذف کنید. این عمل قابل برگشت نیست.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'لطفاً قبل از حذف حساب، اشتراک فعال Plutonium خود را در تنظیمات Plutonium لغو کنید.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'امکان حذف حساب وجود ندارد';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'شما نمی‌توانید حساب خود را در حالی که مالک انجمن‌ها هستید حذف کنید. ابتدا مالکیت انجمن‌های زیر را منتقل کنید:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'و $count مورد دیگر';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'برای انتقال مالکیت، به $settingsPath بروید و از گزینه انتقال مالکیت استفاده کنید.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'آیا مطمئن هستید که می‌خواهید حساب خود را حذف کنید؟ این عمل حساب شما را برای حذف دائمی زمان‌بندی می‌کند.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'شما می‌توانید فرآیند حذف را ظرف ۱۴ روز لغو کنید';

  @override
  String get dangerZoneDeleteBullet2 =>
      'پس از ۱۴ روز، حساب شما به طور دائم حذف خواهد شد';

  @override
  String get dangerZoneDeleteBullet3 =>
      'پس از پردازش حذف، نمی‌توانید دسترسی به حساب خود را بازیابی کنید';

  @override
  String get dangerZoneDeleteBullet4 =>
      'پس از حذف حساب، قادر به حذف پیام‌های ارسالی خود نخواهید بود';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'اگر می‌خواهید داده‌های خود را صادر کنید یا پیام‌های خود را ابتدا حذف کنید، لطفاً قبل از ادامه به بخش داشبورد حریم خصوصی در تنظیمات کاربر مراجعه کنید.';

  @override
  String get claimAccountTitle => 'ادعای حساب کاربری شما';

  @override
  String get claimAccountDescription =>
      'با افزودن ایمیل و رمز عبور، حساب خود را ادعا کنید. ما قبل از اتمام، یک کد تأیید به ایمیل شما ارسال خواهیم کرد.';

  @override
  String get claimAccountEmailLabel => 'ایمیل';

  @override
  String get claimAccountPasswordLabel => 'رمز عبور';

  @override
  String get claimAccountSendCode => 'ارسال کد';

  @override
  String get claimAccountVerifyDescription =>
      'کدی را که به ایمیل شما ارسال کردیم وارد کنید تا آن را تأیید کنید. رمز عبور شما پس از تأیید کد تنظیم خواهد شد.';

  @override
  String get claimAccountSuccess => 'حساب با موفقیت ادعا شد';

  @override
  String get importantInformation => 'اطلاعات مهم:';

  @override
  String get genericError => 'خطایی رخ داد';

  @override
  String get invalidCode => 'کد نامعتبر است';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سال پیش',
      one: '1 سال پیش',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ماه پیش',
      one: '1 ماه پیش',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count روز پیش',
      one: '1 روز پیش',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ساعت پیش',
      one: '1 ساعت پیش',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقیقه پیش',
      one: '1 دقیقه پیش',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'همین الان';

  @override
  String get authorizedAppsTitle => 'برنامه‌های مجاز';

  @override
  String get authorizedAppsDescription =>
      'به این برنامه‌ها دسترسی به حساب Fluxer شما اعطا شده است.';

  @override
  String get authorizedAppsEmptyTitle => 'هیچ برنامه مجاز وجود ندارد';

  @override
  String get authorizedAppsEmptyDescription =>
      'شما هیچ برنامه‌ای را برای دسترسی به حساب خود مجاز نکرده‌اید.';

  @override
  String get authorizedAppsLoadError => 'بارگیری برنامه‌های مجاز ناموفق بود';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'مجاز شده در $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'مجوزهای اعطا شده';

  @override
  String get authorizedAppsRevoke => 'لغو';

  @override
  String get authorizedAppsRevokeTitle => 'لغو دسترسی برنامه';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'آیا مطمئن هستید که می‌خواهید دسترسی $appName را لغو کنید؟ این برنامه دیگر به حساب شما دسترسی نخواهد داشت.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'به اطلاعات اولیه پروفایل شما (نام کاربری، آواتار و غیره) دسترسی داشته باشید';

  @override
  String get authorizedAppsScopeEmail => 'آدرس ایمیل شما را مشاهده کنید';

  @override
  String get authorizedAppsScopeGuilds =>
      'انجمن‌هایی را که عضو آن‌ها هستید مشاهده کنید';

  @override
  String get authorizedAppsScopeConnections =>
      'حساب‌های متصل خود را مشاهده کنید';

  @override
  String get authorizedAppsScopeBot =>
      'یک ربات را با مجوزهای درخواستی به یک انجمن اضافه کنید';

  @override
  String get authorizedAppsScopeAdmin =>
      'به نقاط پایانی مدیریتی دسترسی داشته باشید';

  @override
  String get privacyPendingDeletionTitle => 'در انتظار حذف';

  @override
  String get blockedUsersTitle => 'کاربران مسدود شده';

  @override
  String get blockedUsersDescription =>
      'کاربران مسدود شده نمی‌توانند درخواست دوستی یا پیام مستقیم برای شما ارسال کنند.';

  @override
  String get blockedUsersEmptyTitle => 'هیچ کاربر مسدود شده‌ای وجود ندارد';

  @override
  String get blockedUsersEmptyDescription => 'شما هنوز کسی را مسدود نکرده‌اید.';

  @override
  String get blockedUsersLoadError => 'بارگیری کاربران مسدود شده ناموفق بود';

  @override
  String get blockedUsersUnblock => 'رفع مسدودیت';

  @override
  String get blockedUsersUnblockTitle => 'رفع مسدودیت کاربر';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'آیا مطمئن هستید که می‌خواهید $username را از مسدودیت خارج کنید؟';
  }

  @override
  String get blockedUsersCopyTag => 'کپی کردن تگ Fluxer';

  @override
  String get blockedUsersCopyId => 'کپی کردن شناسه کاربر';

  @override
  String get userProfileLoadError => 'پروفایل بارگیری نشد';

  @override
  String get userProfileRetry => 'تلاش مجدد';

  @override
  String get userProfileMessage => 'پیام';

  @override
  String get userProfileVoiceCall => 'تماس صوتی';

  @override
  String get userProfileVideoCall => 'تماس تصویری';

  @override
  String get userProfileEditProfile => 'ویرایش پروفایل';

  @override
  String get userProfileStaffBadgeTooltip => 'کارکنان Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'تیم انجمن Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'شریک Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'شکارچی باگ فاکسر';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'پلوتونیوم فاکسر';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'مشترک پلوتونیوم فاکسر از $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'رویابین فاکسر';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'رویابین فاکسر از $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'شناسه رویابین #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'دوستان مشترک ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'انجمن‌های مشترک ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'دوستان مشترک';

  @override
  String get userProfileMutualCommunitiesTitle => 'انجمن‌های مشترک';

  @override
  String get userProfileNoMutualFriends => 'هیچ دوست مشترکی یافت نشد.';

  @override
  String get userProfileNoMutualCommunities => 'هیچ انجمن مشترکی یافت نشد.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'نام مستعار: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'باز کردن پیام خصوصی';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'شما $username را مسدود کرده‌اید. تا زمانی که او را از مسدودیت خارج نکنید، قادر به ارسال پیام نخواهید بود.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'لغو مسدودیت';

  @override
  String get userProfileOpenDm => 'باز کردن پیام خصوصی';

  @override
  String get userProfileNoteTitle => 'یادداشت';

  @override
  String get userProfileNoteVisibility => '(فقط برای شما قابل مشاهده است)';

  @override
  String get userProfileNoteSave => 'ذخیره';

  @override
  String get userProfileNoteDelete => 'حذف';

  @override
  String get userProfileNoteEmpty => 'برای افزودن یادداشت کلیک کنید';

  @override
  String get userProfileMemberSince => 'عضو از';

  @override
  String get userProfileAboutMe => 'درباره من';

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
  String get userProfileCopyUsername => 'کپی نام کاربری';

  @override
  String get userProfileCopyUserId => 'کپی شناسه کاربر';

  @override
  String get userProfileViewMainProfile => 'مشاهده پروفایل اصلی';

  @override
  String get userProfileViewCommunityProfile => 'مشاهده پروفایل انجمن';

  @override
  String get userProfileBlockUser => 'مسدود کردن کاربر';

  @override
  String get userProfileUnblockUser => 'لغو مسدودیت کاربر';

  @override
  String get userProfileRemoveFriend => 'حذف دوست';

  @override
  String get userProfileBlockConfirmTitle => 'مسدود کردن کاربر';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'آیا مطمئن هستید که می‌خواهید $username را مسدود کنید؟';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'لغو مسدودیت کاربر';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'آیا مطمئن هستید که می‌خواهید $username را از مسدودیت خارج کنید؟';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'حذف دوست';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'آیا مطمئن هستید که می‌خواهید $username را به عنوان دوست حذف کنید؟';
  }

  @override
  String get userProfileFailedOpenDm => 'خطا در باز کردن پیام خصوصی';

  @override
  String get userProfileFailedSaveNote => 'خطا در ذخیره یادداشت';

  @override
  String get userProfileActionFailed =>
      'عملیات ناموفق بود، لطفاً دوباره امتحان کنید';

  @override
  String get userProfileChangeNickname => 'تغییر نام مستعار';

  @override
  String get userProfileKick => 'اخراج';

  @override
  String get userProfileBan => 'مسدود کردن';

  @override
  String get userProfileTimeout => 'محدودیت زمانی';

  @override
  String get userProfileRemoveTimeout => 'حذف محدودیت زمانی';

  @override
  String get userProfileTransferOwnership => 'انتقال مالکیت';

  @override
  String get userProfileReportUser => 'گزارش کاربر';

  @override
  String get userProfileReportMessage => 'گزارش پیام';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'اخراج $username؟';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'آیا مطمئن هستید که می‌خواهید $username را اخراج کنید؟ او می‌تواند با یک دعوت‌نامه جدید دوباره بپیوندد.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'حذف مسدودیت موقت؟';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'حذف مسدودیت موقت به $username اجازه می‌دهد دوباره پیام ارسال کند، واکنش نشان دهد و به کانال‌های صوتی بپیوندد.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'انتقال مالکیت؟';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'مالکیت این انجمن را به $username منتقل می‌کنید؟ این عمل برگشت‌ناپذیر است و شما تمام امتیازات مالکیت را از دست خواهید داد.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'مسدود کردن $username';
  }

  @override
  String get userProfileBanDurationLabel => 'مدت زمان مسدودیت';

  @override
  String get userProfileBanCustomSecondsLabel => 'مدت زمان سفارشی (ثانیه)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'هر مقداری بین $min تا $max ثانیه';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'حذف تاریخچه پیام‌ها';

  @override
  String get userProfileBanDeleteNone => 'هیچ موردی حذف نشود';

  @override
  String get userProfileBanDelete24h => '۲۴ ساعت گذشته';

  @override
  String get userProfileBanDelete7d => '۷ روز گذشته';

  @override
  String get userProfileBanReasonLabel => 'دلیل (اختیاری)';

  @override
  String get userProfileBanReasonHint => 'دلیل مسدودیت را وارد کنید';

  @override
  String get userProfileBanSubmit => 'مسدود کردن عضو';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'مسدودیت موقت $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'مدت زمان مسدودیت موقت';

  @override
  String get userProfileTimeoutSubmit => 'مسدودیت موقت عضو';

  @override
  String get userProfileNicknameLabel => 'نام مستعار';

  @override
  String get userProfileNicknameHint => 'نام مستعار را وارد کنید';

  @override
  String get userProfileNicknameSave => 'ذخیره';

  @override
  String userProfileKickSuccess(String username) {
    return '$username اخراج شد';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username مسدود شد';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'مسدودیت موقت $username اعمال شد';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'مسدودیت موقت $username حذف شد';
  }

  @override
  String get userProfileNicknameSuccess => 'نام مستعار به‌روز شد';

  @override
  String get userProfileTransferSuccess => 'مالکیت منتقل شد';

  @override
  String get durationPermanent => 'دائمی';

  @override
  String get duration60Seconds => '۶۰ ثانیه';

  @override
  String get duration5Minutes => '۵ دقیقه';

  @override
  String get duration10Minutes => '۱۰ دقیقه';

  @override
  String get duration1Hour => '۱ ساعت';

  @override
  String get duration12Hours => '۱۲ ساعت';

  @override
  String get duration1Day => '۱ روز';

  @override
  String get duration3Days => '۳ روز';

  @override
  String get duration5Days => '۵ روز';

  @override
  String get duration1Week => '۱ هفته';

  @override
  String get duration2Weeks => '۲ هفته';

  @override
  String get duration1Month => '۱ ماه';

  @override
  String get durationCustom => 'سفارشی...';

  @override
  String get iarReportUserTitle => 'گزارش کاربر';

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
  String get iarReasonInappropriateProfile => 'پروفایل نامناسب';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'پروفایل این کاربر حاوی محتوای نامناسب است';

  @override
  String typingIndicatorOne(String name) {
    return 'در حال تایپ $name...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'در حال تایپ $name1 و $name2...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'در حال تایپ $name1، $name2 و $name3...';
  }

  @override
  String get typingIndicatorMultiple => 'چند نفر در حال تایپ هستند...';

  @override
  String get typingIndicatorHandful =>
      'تعدادی جنگجوی کیبورد در حال آماده شدن هستند...';

  @override
  String get typingIndicatorSymphony =>
      'سمفونی کلیک‌های کیبورد در حال اجراست...';

  @override
  String get typingIndicatorFiesta => 'یک جشن تایپ تمام عیار در اینجا برپاست';

  @override
  String get typingIndicatorApocalypse => 'وای، چه آخرالزمان تایپ کردنی!';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'خوش اومدی $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'خوش اومدی $username! راحت باش.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'سلام $username! خوشحالیم که اینجا هستی.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'سلام $username! هر وقت آماده بودی شروع کن.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'سلام $username، خوشحالیم که اینجا می‌بینیمت!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'سلام $username! امیدواریم از حضورت لذت ببری.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'سلام $username، به جمع ما خوش اومدی!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'خوشحالم که رسیدی $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'خوش اومدی $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'خوش اومدی $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'خوش اومدی $username! خوشحالیم که اینجا هستی.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'خوش اومدی $username! امیدواریم از وقتت اینجا لذت ببری.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'خوش اومدی $username! مکالمه بعدی شما از اینجا شروع می‌شه.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'خوش اومدی $username. خوشحالیم که اینجا هستی.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'خوشحالم که می‌بینمت $username! خوش اومدی.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'اینجایی $username! خوبه که با ما هستی.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'رسیدی $username! بیا شروع کنیم.';
  }

  @override
  String get relativeTimeShortNow => 'الان';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقیقه',
      one: '1 دقیقه',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ساعت',
      one: '1 ساعت',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count روز',
      one: '1 روز',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ماه',
      one: '1 ماه',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سال',
      one: '1 سال',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'دستگاه‌های من';

  @override
  String get linkedDevicesDescription =>
      'تمام دستگاه‌هایی که در حال حاضر به حساب شما وارد شده‌اند را ببینید. جلساتی را که نمی‌شناسید لغو کنید.';

  @override
  String get linkedDevicesCurrentDevice => 'دستگاه فعلی';

  @override
  String get linkedDevicesOtherDevices => 'دستگاه‌های دیگر';

  @override
  String get linkedDevicesEnterSelection => 'حالت انتخاب را وارد کنید';

  @override
  String get linkedDevicesExitSelection => 'حالت انتخاب را خارج شوید';

  @override
  String get linkedDevicesSelectAll => 'انتخاب همه';

  @override
  String get linkedDevicesClearSelection => 'پاک کردن انتخاب';

  @override
  String get linkedDevicesRevokeTooltip => 'لغو دستگاه';

  @override
  String get linkedDevicesSignOutAll => 'خروج از همه دستگاه‌های دیگر';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'خروج از $count دستگاه',
      one: 'خروج از ۱ دستگاه',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'خروج از $count دستگاه',
      one: 'خروج از ۱ دستگاه',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'خروج از همه دستگاه‌های دیگر';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'این کار دستگاه‌های انتخاب شده را از حساب شما خارج می‌کند. دوباره باید در آن دستگاه‌ها وارد شوید.',
      one:
          'این کار دستگاه انتخاب شده را از حساب شما خارج می‌کند. دوباره باید در آن دستگاه وارد شوید.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'این کار دستگاه‌های انتخاب شده را از حساب شما خارج می‌کند. دوباره باید در آن دستگاه‌ها وارد شوید.';

  @override
  String get linkedDevicesSignOutConfirm => 'ادامه';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'شما باید دوباره در تمام دستگاه‌های خارج شده وارد شوید';

  @override
  String get linkedDevicesLoadErrorTitle => 'خطای شبکه';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'ما در اتصال به پیوستار فضا-زمان مشکل داریم. لطفاً اتصال خود را بررسی کرده و دوباره امتحان کنید.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'دستگاه‌ها لغو شدند',
      one: 'دستگاه لغو شد',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'امکان خروج وجود نداشت. دوباره امتحان کنید.';

  @override
  String get linkedDevicesUnknownOs => 'سیستم عامل ناشناخته';

  @override
  String get linkedDevicesUnknownPlatform => 'پلتفرم ناشناخته';

  @override
  String slowmodeLabel(String duration) {
    return '$duration حالت کند';
  }

  @override
  String get slowmodeTooltipActive =>
      'شما در حالت کند هستید. لطفاً قبل از ارسال پیام دیگر صبر کنید.';

  @override
  String get slowmodeTooltipImmune => 'حالت کند فعال است، اما شما مصون هستید.';

  @override
  String get channelNoSendPermissionHint =>
      'شما نمی‌توانید در این کانال پیام ارسال کنید.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'اعلان‌های سیستمی از طرف کارکنان $productName. شما نمی‌توانید اینجا پاسخ دهید.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'ارسال پیام در این انجمن به طور موقت متوقف شده است.';

  @override
  String get channelComposerBarrierTimedOut =>
      'شما تایم‌اوت شده‌اید. ارسال پیام، واکنش‌ها و صدا تا پایان زمان تایم‌اوت متوقف شده است.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'برای ارسال پیام در این انجمن باید حساب خود را ادعا کنید.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'برای ارسال پیام در این انجمن باید ایمیل خود را تأیید کنید.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'حساب شما برای ارسال پیام در این انجمن خیلی جدید است.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'شما به اندازه کافی عضو این انجمن نبوده‌اید تا بتوانید پیام ارسال کنید.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'برای ارسال پیام در این انجمن باید شماره تلفن خود را تأیید کنید.';

  @override
  String get channelComposerBarrierVerifyEmail => 'تأیید ایمیل';

  @override
  String get channelComposerBarrierVerifyPhone => 'تأیید تلفن';

  @override
  String chatAttachmentTooMany(int max) {
    return 'پیوست‌های زیاد (حداکثر $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'یک یا چند فایل از حد مجاز بزرگتر هستند';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'این فایل‌ها برای ارسال با هم خیلی بزرگ هستند';

  @override
  String get chatAttachmentDropToUpload => 'فایل‌ها را رها کنید تا آپلود شوند';

  @override
  String get chatAttachmentDropToSend =>
      'فایل‌ها را رها کنید تا فوراً ارسال شوند';

  @override
  String get chatAttachmentSendVoiceMessage => 'ارسال پیام صوتی';

  @override
  String get voiceMessageTitle => 'پیام صوتی';

  @override
  String get voiceMessageHoldHint =>
      'برای ضبط نگه دارید. برای قفل کردن بکشید، یا برای ارسال رها کنید.';

  @override
  String get voiceMessageDiscard => 'حذف پیام صوتی';

  @override
  String get voiceMessageSend => 'ارسال پیام صوتی';

  @override
  String get voiceMessageMicPermissionDenied =>
      'امکان شروع ضبط وجود ندارد. دسترسی به میکروفون را مجاز کنید.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'ضبط صدا در این دستگاه پشتیبانی نمی‌شود.';

  @override
  String get voiceMessageMicInUse =>
      'برای ضبط پیام صوتی، تماس صوتی را ترک کنید.';

  @override
  String get voiceMessageRecordingFailed =>
      'ضبط ناموفق بود. دوباره امتحان کنید.';

  @override
  String get voiceMessageSendFailed =>
      'ارسال پیام صوتی امکان‌پذیر نیست. دوباره امتحان کنید.';

  @override
  String get voiceMessageRecordingHint =>
      'حالا صحبت کنید. وقتی تمام شد روی توقف ضربه بزنید — می‌توانید بعداً کوتاه کنید.';

  @override
  String get voiceMessageReviewHint =>
      'دستگیره‌ها را بکشید تا کوتاه کنید، سپس ارسال را فشار دهید.';

  @override
  String get voiceMessageStop => 'توقف';

  @override
  String get voiceMessageStartRecording => 'شروع ضبط';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'پخش';

  @override
  String get voiceMessagePause => 'مکث';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'انتخاب باید حداقل $secondsString ثانیه باشد.';
  }

  @override
  String get chatAttachmentEditTitle => 'ویرایش پیوست';

  @override
  String get chatAttachmentFilenameLabel => 'نام فایل';

  @override
  String get chatAttachmentDescriptionLabel => 'توضیحات';

  @override
  String get chatAttachmentDescriptionHint => 'متن جایگزین اختیاری';

  @override
  String get chatAttachmentSpoilerLabel => 'علامت‌گذاری به عنوان اسپویلر';

  @override
  String get chatAttachmentRemove => 'حذف پیوست';

  @override
  String get chatAttachmentDownload => 'دانلود';

  @override
  String get chatAttachmentExpiredTooltip => 'پیوست منقضی شده است';

  @override
  String get chatAttachmentSourceGallery => 'گالری';

  @override
  String get chatAttachmentSourceCamera => 'دوربین';

  @override
  String get chatAttachmentSourceBrowse => 'مرور فایل‌ها';

  @override
  String get chatAttachmentPasteTooltip => 'چسباندن تصویر از کلیپ‌بورد';

  @override
  String get chatAttachmentSpoiler => 'اسپویلر';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'نمایش اسپویلر';

  @override
  String get matureMediaRevealButton => 'نمایش';

  @override
  String get matureMediaRevealHint => 'برای نمایش کلیک کنید';

  @override
  String get matureContentTitle => 'محتوای نامناسب';

  @override
  String get matureCommunityTitle => 'انجمن بالغین';

  @override
  String get matureCategoryTitle => 'دسته بندی بالغین';

  @override
  String get matureChannelTitle => 'کانال بالغین';

  @override
  String get communityContentWarningTitle => 'هشدار محتوای انجمن';

  @override
  String get categoryContentWarningTitle => 'هشدار محتوای دسته بندی';

  @override
  String get channelContentWarningTitle => 'هشدار محتوای کانال';

  @override
  String get defaultContentWarningBody => 'این حاوی محتوای حساس است.';

  @override
  String get matureCommunityBody =>
      'این انجمن برای محتوای بالغین علامت‌گذاری شده است و ممکن است حاوی مطالبی باشد که برای برخی کاربران نامناسب باشد.';

  @override
  String get matureCategoryBody =>
      'این دسته بندی برای محتوای بالغین علامت‌گذاری شده است و ممکن است حاوی مطالبی باشد که برای برخی کاربران نامناسب باشد.';

  @override
  String get matureChannelBody =>
      'این کانال برای محتوای بالغین علامت‌گذاری شده است و ممکن است حاوی مطالبی باشد که برای برخی کاربران نامناسب باشد.';

  @override
  String get matureVoiceChannelBody =>
      'این کانال صوتی برای محتوای بالغین علامت‌گذاری شده است و ممکن است حاوی مطالبی باشد که برای برخی کاربران نامناسب باشد.';

  @override
  String get matureLinkChannelBody =>
      'این کانال پیوند برای محتوای بالغین علامت‌گذاری شده است و ممکن است مطالبی را باز کند که برای برخی کاربران نامناسب باشد.';

  @override
  String get matureCommunityUnavailableBody =>
      'این انجمن بالغین برای حساب شما در دسترس نیست.';

  @override
  String get matureCategoryUnavailableBody =>
      'این دسته بندی بالغین برای حساب شما در دسترس نیست.';

  @override
  String get matureChannelUnavailableBody =>
      'این کانال بالغین برای حساب شما در دسترس نیست.';

  @override
  String get matureContentProceedButton => 'ادامه';

  @override
  String get matureContentUnderstandButton => 'متوجه شدم';

  @override
  String get matureContentOpenLinkButton => 'باز کردن پیوند';

  @override
  String get sensitiveContentSectionTitle => 'محتوای حساس';

  @override
  String get sensitiveContentSectionDescription =>
      'نحوه فیلتر شدن رسانه های بالغ یا حساس را در زمینه های مختلف کنترل کنید';

  @override
  String get sensitiveContentFriendDmLabel => 'پیام های مستقیم از دوستان';

  @override
  String get sensitiveContentNonFriendDmLabel => 'پیام های مستقیم از دیگران';

  @override
  String get sensitiveContentGuildLabel => 'پیام ها در کانال های انجمن';

  @override
  String get sensitiveContentFilterShow => 'نمایش';

  @override
  String get sensitiveContentFilterBlur => 'تار کردن';

  @override
  String get sensitiveContentFilterBlock => 'مسدود کردن';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'رسانه را تا اتمام اسکن ایمنی تار کنید';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'هنگامی که فعال باشد، تصاویر و ویدیوها تا زمانی که اسکن ایمنی محتوا به پایان برسد، تار می شوند.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'این تنظیم همیشه برای حساب شما فعال است.';

  @override
  String get sensitiveContentResetButton => 'بازنشانی';

  @override
  String get sensitiveContentSaveButton => 'ذخیره';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فایل',
      one: '1 فایل',
    );
    return 'در حال بارگذاری $_temp0';
  }

  @override
  String get chatCancelUpload => 'لغو بارگذاری';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'منقضی در $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'منقضی بین $start و $end';
  }

  @override
  String get connectionsTitle => 'اتصالات';

  @override
  String get connectionsDescription =>
      'حساب ها و دامنه های خارجی را به پروفایل Fluxer خود پیوند دهید. اتصالات تأیید شده در پروفایل شما نمایش داده می شوند تا دیگران ببینند.';

  @override
  String get connectionsEmptyTitle => 'هنوز هیچ اتصالی وجود ندارد';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'حساب Bluesky خود را پیوند دهید یا مالکیت دامنه را تأیید کنید تا آنها را در پروفایل خود نمایش دهید.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'مالکیت دامنه را تأیید کنید تا آن را در پروفایل خود نمایش دهید.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'دامنه';

  @override
  String get connectionsAddBlueskyAriaLabel => 'افزودن اتصال Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'افزودن اتصال دامنه';

  @override
  String get connectionEdit => 'ویرایش';

  @override
  String get connectionRemove => 'حذف';

  @override
  String get connectionVerifiedLabel => 'این اتصال تأیید شده است.';

  @override
  String get connectionUnverifiedLabel => 'این اتصال تأیید نشده است.';

  @override
  String get connectionAddTitle => 'افزودن اتصال';

  @override
  String get connectionTypeLabel => 'نوع اتصال';

  @override
  String get connectionHandleLabel => 'نام کاربری';

  @override
  String get connectionDomainLabel => 'دامنه';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'شما قبلاً این اتصال را دارید.';

  @override
  String get connectionConnectBluesky => 'اتصال با بلواسکای';

  @override
  String get connectionContinue => 'ادامه';

  @override
  String get connectionVerifyTitle => 'تأیید اتصال';

  @override
  String get connectionVerifyInstructions =>
      'از رکورد زیر برای اثبات مالکیت دامنه استفاده کنید.';

  @override
  String get connectionDnsRecordTitle => 'رکورد TXT DNS';

  @override
  String get connectionDnsHostLabel => 'میزبان';

  @override
  String get connectionDnsValueLabel => 'مقدار';

  @override
  String get connectionCopyHost => 'کپی میزبان';

  @override
  String get connectionCopyValue => 'کپی مقدار';

  @override
  String get connectionCopied => 'کپی شد!';

  @override
  String get connectionTokenFileTitle => 'فایل توکن را ارائه دهید';

  @override
  String get connectionTokenFileDescription =>
      'فایل **fluxer-verification** را دانلود کرده و در پوشه **.well-known** خود قرار دهید تا بتوانیم دامنه را تأیید کنیم.';

  @override
  String get connectionTokenFileDownload => 'دانلود fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'فایل حاوی توکن تأیید است که از **$dnsUrl** دریافت خواهیم کرد.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'ذخیره fluxer-verification';

  @override
  String get connectionVerifyButton => 'تأیید';

  @override
  String get connectionBack => 'بازگشت';

  @override
  String get connectionEditTitle => 'ویرایش اتصال';

  @override
  String get connectionEditDescription =>
      'انتخاب کنید چه کسانی بتوانند این اتصال را در پروفایل شما ببینند.';

  @override
  String get connectionVisibilityEveryone => 'همه';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'به هر کسی اجازه دهید این اتصال را در پروفایل شما ببیند';

  @override
  String get connectionVisibilityFriends => 'دوستان';

  @override
  String get connectionVisibilityFriendsDesc =>
      'به دوستان خود اجازه دهید این اتصال را ببینند';

  @override
  String get connectionVisibilityCommunityMembers => 'اعضای انجمن';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'به اعضای انجمن‌هایی که در آن‌ها هستید اجازه دهید این اتصال را ببینند';

  @override
  String get connectionRemoveTitle => 'حذف اتصال';

  @override
  String get connectionRemoveDescription =>
      'آیا مطمئن هستید که می‌خواهید این اتصال را حذف کنید؟ این عمل قابل بازگشت نیست.';

  @override
  String get connectionRemoveConfirm => 'حذف';

  @override
  String get connectionsLoadError => 'بارگیری اتصالات ناموفق بود';

  @override
  String get connectionsReorderError => 'به‌روزرسانی ترتیب ناموفق بود';

  @override
  String get connectionInitiateFailed =>
      'شروع تأیید ممکن نبود. دوباره امتحان کنید.';

  @override
  String get connectionVerifyFailed =>
      'تأیید ممکن نبود. رکورد DNS خود را بررسی کرده و دوباره امتحان کنید.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'شروع مجوز بلواسکای ممکن نبود.';

  @override
  String get connectionUpdateFailed => 'به‌روزرسانی اتصال ممکن نبود';

  @override
  String get connectionRemoveFailed => 'حذف اتصال ممکن نبود';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification ذخیره شد';

  @override
  String get connectionTokenSaveFailedToast => 'ذخیره فایل ممکن نبود';

  @override
  String get connectionEnterHandle => 'یک نام کاربری بلواسکای وارد کنید.';

  @override
  String get connectionEnterDomain => 'یک دامنه وارد کنید.';

  @override
  String get lookAndFeelTitle => 'ظاهر و حس';

  @override
  String get lookAndFeelThemeSectionTitle => 'قالب';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'بین ظاهر تیره، زغالی یا روشن انتخاب کنید.';

  @override
  String get lookAndFeelThemeDark => 'قالب تیره';

  @override
  String get lookAndFeelThemeCoal => 'قالب زغالی';

  @override
  String get lookAndFeelThemeLight => 'قالب روشن';

  @override
  String get lookAndFeelThemeSystem => 'قالب سیستم';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'همگام‌سازی قالب در دستگاه‌های مختلف';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'وقتی فعال باشد، تغییرات تم به همه دستگاه‌های شما همگام‌سازی می‌شوند. وقتی غیرفعال باشد، این دستگاه از تنظیمات تم خود استفاده می‌کند.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'تم سیستم به‌طور خودکار همگام‌سازی را غیرفعال می‌کند تا اولویت سیستم شما را در این دستگاه پیگیری کند.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'همگام‌سازی تم با حساب شما انجام نشد. لطفاً دوباره امتحان کنید.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'تغییر مقیاس فونت چت';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'اندازه فونت را در ناحیه چت تنظیم کنید.';

  @override
  String get lookAndFeelInterfaceTitle => 'رابط کاربری';

  @override
  String get lookAndFeelInterfaceDescription =>
      'عناصر و رفتارهای رابط کاربری را سفارشی کنید.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'نشانگرهای تایپ در لیست کانال';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'نحوه نمایش نشانگرهای تایپ در لیست کانال را هنگام تایپ کردن کسی در کانال انتخاب کنید.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'نشانگر تایپ + آواتارها';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'نشانگر تایپ را با آواتارهای کاربر در لیست کانال نمایش دهید';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'فقط نشانگر تایپ';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'فقط نشانگر تایپ را بدون آواتار نمایش دهید';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'مخفی';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'نشانگرهای تایپ را در لیست کانال نمایش ندهید';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'نمایش تایپ در کانال انتخاب شده';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'وقتی غیرفعال است (پیش‌فرض)، نشانگرهای تایپ در کانالی که در حال مشاهده آن هستید ظاهر نمی‌شوند.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'عمومی';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'راهنمای صفحه کلید';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'کنترل کنید که آیا راهنمای میانبر صفحه کلید در راهنمای ابزار ظاهر می‌شود یا خیر.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'راهنمای صفحه کلید را در راهنمای ابزار مخفی کنید';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'وقتی فعال باشد، نشان‌های میانبر در پنجره‌های راهنمای ابزار مخفی می‌شوند.';

  @override
  String get lookAndFeelNekoTitle => 'متفرقه';

  @override
  String get lookAndFeelNekoDescription => 'گزینه‌های متفرقه رابط کاربری.';

  @override
  String get lookAndFeelShowNekoLabel => 'نمایش نکو';

  @override
  String get lookAndFeelShowNekoDescription =>
      'وقتی فعال باشد، نکو نزدیک نوار ورودی چت ظاهر می‌شود.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => 'رفتار پیوستن به کانال صوتی';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'نحوه پیوستن به کانال‌های صوتی در انجمن‌ها را کنترل کنید.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'برای پیوستن به کانال‌های صوتی روی دابل کلیک کنید';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'وقتی فعال باشد، برای پیوستن به کانال‌های صوتی باید روی آن‌ها دابل کلیک کنید. وقتی غیرفعال است (پیش‌فرض)، با یک کلیک کانال بلافاصله پیوست می‌شود.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'روباه قهوه‌ای چابک از روی سگ تنبل پرید.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'نوار کناری انجمن';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'نحوه نمایش پیام‌های مستقیم در نوار کناری انجمن را پیکربندی کنید.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count انجمن به دلیل نقص خازن فلاکس به طور موقت در دسترس نیست.',
      one: '۱ انجمن به دلیل نقص خازن فلاکس به طور موقت در دسترس نیست.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel =>
      'پیام‌های مستقیم را در پوشه جمع کنید';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'وقتی فعال باشد، پیام‌های مستقیم خوانده نشده در نوار کناری انجمن در پوشه‌ای در دکمه فلاکسر جمع می‌شوند. برای باز کردن یا بستن پوشه، هنگام حضور در صفحه پیام‌های مستقیم روی دکمه فلاکسر کلیک کنید.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'لیست کانال';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'رفتار نشانگر خوانده نشده برای کانال‌های بی‌صدا شده در لیست کانال‌ها را کنترل کنید.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'نمایش نشانگر خوانده نشده در کانال‌های بی‌صدا شده';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'وقتی فعال باشد، کانال‌های بی‌صدا شده یک نشانگر خوانده نشده کم‌رنگ در سمت چپ نشان می‌دهند. ذکرها همچنان صرف نظر از این تنظیم ظاهر می‌شوند.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'اکنون فعال';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'نحوه نمایش \"اکنون فعال\" در سراسر برنامه را کنترل کنید.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'نمایش \"اکنون فعال\" در صفحه اصلی';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      '\"اکنون فعال\" را در صفحه اصلی نمایش دهید تا دوستان فعال در صدا را ببینید. پیش‌نمایشی از زمینه کانال، کسانی که در حال حاضر آنجا هستند و راهی سریع برای پیوستن را مشاهده خواهید کرد.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'موارد دلخواه';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'قابلیت مشاهده موارد دلخواه را در سراسر برنامه کنترل کنید.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'فعال کردن موارد دلخواه';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'وقتی فعال باشد، می‌توانید کانال‌ها را به موارد دلخواه خود اضافه کنید و آن‌ها در بخش موارد دلخواه ظاهر می‌شوند. وقتی غیرفعال باشد، تمام عناصر رابط کاربری مربوط به موارد دلخواه (دکمه‌ها، موارد منو) مخفی می‌شوند. موارد دلخواه موجود شما حفظ خواهند شد.';

  @override
  String get favoritesTitle => 'موارد دلخواه';

  @override
  String get favoritesEmptyTitle => 'هنوز موردی دلخواه وجود ندارد';

  @override
  String get favoritesEmptyDescription =>
      'کانال‌ها را از سربرگ چت ستاره‌دار کنید تا اینجا نگه داشته شوند.';

  @override
  String get favoritesWelcomeTitle => 'به موارد دلخواه خوش آمدید';

  @override
  String get favoritesWelcomeDescription =>
      'فضای شخصی شما برای دسترسی سریع به کانال‌ها، پیام‌های خصوصی و گروه‌های مورد علاقه‌تان. برای افزودن به اینجا، روی ستاره هر کانال فشار دهید.';

  @override
  String get favoritesWelcomeTip =>
      'برای شما مناسب نیست؟ هر زمان خواستید آن را خاموش کنید.';

  @override
  String get favoritesDisableButton => 'موارد دلخواه را غیرفعال کنید';

  @override
  String get favoritesAddedToast => 'به موارد دلخواه اضافه شد';

  @override
  String get favoritesRemovedToast => 'از موارد دلخواه حذف شد';

  @override
  String get favoritesHiddenToast => 'موارد دلخواه مخفی شدند';

  @override
  String get favoritesMute => 'موارد دلخواه را بی‌صدا کنید';

  @override
  String get favoritesUnmute => 'موارد دلخواه را از حالت بی‌صدا خارج کنید';

  @override
  String get favoritesHeaderMenu => 'منوی موارد دلخواه';

  @override
  String get favoritesCreateCategory => 'ایجاد دسته';

  @override
  String get favoritesCategoryNameLabel => 'نام دسته';

  @override
  String get favoritesHideMutedChannels => 'کانال‌های بی‌صدا شده را مخفی کنید';

  @override
  String get favoritesShowMutedChannels => 'کانال‌های بی‌صدا شده را نمایش دهید';

  @override
  String get favoritesSetNickname => 'نام مستعار تنظیم کنید';

  @override
  String get favoritesNicknameLabel => 'نام مستعار';

  @override
  String get favoritesSaveNickname => 'نام مستعار را ذخیره کنید';

  @override
  String get favoritesMoveToCategory => 'انتقال به دسته';

  @override
  String get favoritesUncategorized => 'دسته‌بندی نشده';

  @override
  String get favoritesOtherCategory => 'دیگر';

  @override
  String get favoritesRemoveFromFavorites => 'حذف از موارد دلخواه';

  @override
  String get favoritesAddToFavorites => 'افزودن به موارد دلخواه';

  @override
  String get favoritesHideConfirmTitle => 'موارد دلخواه را مخفی کنید';

  @override
  String get favoritesHideConfirmDescription =>
      'این کار تمام عناصر رابط کاربری مربوط به موارد دلخواه، از جمله دکمه‌ها و موارد منو را مخفی می‌کند. موارد دلخواه موجود شما حفظ می‌شوند و هر زمان از تنظیمات > پیشرفته > ظاهر قابل فعال‌سازی مجدد هستند.';

  @override
  String get favoritesDirectMessageSubtitle => 'پیام مستقیم';

  @override
  String get messagesMediaDisplayGroupTitle => 'نمایش';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'نحوه نمایش پیام‌ها، رسانه‌ها و سایر محتوا را کنترل کنید.';

  @override
  String get messagesMediaMediaGroupTitle => 'رسانه';

  @override
  String get messagesMediaMediaGroupDescription =>
      'تنظیمات اندازه و دکمه‌های رسانه را سفارشی کنید.';

  @override
  String get messagesMediaInputGroupTitle => 'ورودی';

  @override
  String get messagesMediaInputGroupDescription =>
      'تنظیمات ورودی پیام را سفارشی کنید.';

  @override
  String get messagesMediaSidebarGroupTitle => 'نوار کناری';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'نحوه نمایش نوار کناری انجمن را پیکربندی کنید.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'کانال‌های بی‌صدا شده را به‌طور پیش‌فرض مخفی کنید';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'هنگام پیوستن به انجمن‌های جدید، کانال‌های بی‌صدا شده را در نوار کناری به‌طور خودکار مخفی کنید';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'آیا کانال‌های بی‌صدا شده را به‌طور پیش‌فرض مخفی کنید؟';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'انجمن‌های جدیدی که به آن‌ها می‌پیوندید به‌طور خودکار کانال‌های بی‌صدا شده را مخفی می‌کنند. آیا می‌خواهید این تنظیم را برای تمام انجمن‌های موجود خود نیز اعمال کنید؟';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'آیا مخفی کردن کانال‌های بی‌صدا شده به‌طور پیش‌فرض را متوقف کنید؟';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'انجمن‌های جدیدی که به آن‌ها می‌پیوندید دیگر به‌طور خودکار کانال‌های بی‌صدا شده را مخفی نمی‌کنند. آیا می‌خواهید کانال‌های بی‌صدا شده را در تمام انجمن‌های موجود خود نیز نمایش دهید؟';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'برای همه انجمن‌ها اعمال کنید';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'در همه انجمن‌ها نمایش دهید';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'فقط انجمن‌های جدید';

  @override
  String get messagesMediaDisplaySectionTitle => 'نمایش رسانه';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'نحوه نمایش تصاویر، ویدیوها و سایر رسانه‌ها را کنترل کنید. همه رسانه‌ها تغییر اندازه داده و تبدیل می‌شوند. فایل‌های بسیار بزرگ که قابل فشرده‌سازی به پیش‌نمایش نیستند، صرف‌نظر از این تنظیمات، جاسازی نخواهند شد.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'هنگام ارسال به‌عنوان پیوند به چت';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'هنگام آپلود مستقیم در فلوکسر';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'پیش‌نمایش پیوندها';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'نحوه پیش‌نمایش پیوندهای وب‌سایت در چت را کنترل کنید';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'نمایش جاسازی‌ها و پیش‌نمایش پیوندهای وب‌سایت';

  @override
  String get messagesMediaReactionsSectionTitle => 'واکنش‌ها';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'تنظیم واکنش‌های ایموجی به پیام‌ها';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'نمایش واکنش‌های ایموجی به پیام‌ها';

  @override
  String get messagesMediaSpoilersSectionTitle => 'محتوای اسپویلر';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'نحوه نمایش محتوای اسپویلر را کنترل کنید';

  @override
  String get messagesMediaSpoilersRadioLabel => 'نمایش محتوای اسپویلر';

  @override
  String get messagesMediaSpoilersOnClickName => 'با کلیک';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'محتوای اسپویلر را هنگام کلیک نمایش دهید';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'در کانال‌هایی که مدیریت می‌کنم';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'همیشه محتوای اسپویلر را در کانال‌هایی که مجوز \"مدیریت پیام‌ها\" را دارید نمایش دهید';

  @override
  String get messagesMediaSpoilersAlwaysName => 'همیشه';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'همیشه محتوای اسپویلر را نمایش دهید';

  @override
  String get messagesMediaSizeSectionTitle => 'تنظیمات اندازه رسانه';

  @override
  String get messagesMediaSizeSectionDescription =>
      'حداکثر اندازه نمایش رسانه‌های جاسازی شده و پیوست شده را سفارشی کنید. اندازه‌های کوچک‌تر فضای کمتری از صفحه را اشغال می‌کنند، در حالی که اندازه‌های بزرگ‌تر جزئیات بیشتری را نشان می‌دهند.';

  @override
  String get messagesMediaSizeEmbedLabel => 'رسانه از پیوندها (جاسازی‌ها)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'پیوست‌های آپلود شده';

  @override
  String get messagesMediaSizeCompactName => 'فشرده (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'اندازه کوچک‌تر رسانه';

  @override
  String get messagesMediaSizeComfortableName => 'راحت (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'اندازه بزرگ‌تر رسانه با جزئیات بیشتر';

  @override
  String get messagesMediaGifsSectionTitle => 'رفتار GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'نحوه درج GIFها در چت را کنترل کنید';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'هنگام انتخاب، GIFها را به‌طور خودکار ارسال کنید';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'تکمیل خودکار عبارت (تکمیل خودکار با دونقطه)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'کنترل کنید چه چیزی در تکمیل خودکار عبارت هنگام تایپ دونقطه ظاهر می‌شود. سفارشی کنید که چه پیشنهاداتی برای مطابقت با اولویت‌های شما نمایش داده شوند.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'نمایش ایموجی‌های پیش‌فرض در تکمیل خودکار عبارت';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'نمایش ایموجی‌های سفارشی در تکمیل خودکار عبارت';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'نمایش استیکرها در تکمیل خودکار عبارت';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'نمایش رسانه‌های ذخیره شده در تکمیل خودکار عبارت';

  @override
  String get messagesMediaEditingSectionTitle => 'ویرایش پیام';

  @override
  String get messagesMediaEditingSectionDescription =>
      'کنترل کنید هنگام لغو ویرایش، چه اتفاقی برای پیش‌نویس شما می‌افتد.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'پیش‌نویس ویرایش را هنگام لغو حفظ کنید';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'نشانگرهای خوانده نشده';

  @override
  String get accessibilityUnreadGroupDescription =>
      'نحوه نمایش نشانگرهای پیام خوانده نشده را کنترل کنید.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'نمایش نشانگر خوانده نشده کم‌رنگ در کانال‌های بی‌صدا شده';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'یک نشانگر خوانده نشده کم‌رنگ در کنار پیام‌های مستقیم و کانال‌های بی‌صدا شده نمایش دهید تا همچنان بتوانید با یک نگاه متوجه فعالیت شوید.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'پیش‌نمایش پیام‌های DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'کنترل کنید چه زمانی پیش‌نمایش پیام‌ها در لیست DM نمایش داده شود.';

  @override
  String get accessibilityDmMessagePreviewModeLabel => 'حالت پیش‌نمایش پیام DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'همه پیام‌ها';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'پیش‌نمایش پیام‌ها را برای همه مکالمات DM نمایش دهید';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'فقط DMهای خوانده نشده';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'فقط پیش‌نمایش پیام‌ها را برای DMهایی که پیام خوانده نشده دارند نمایش دهید';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'هیچ‌کدام';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'پیش‌نمایش پیام‌ها را در لیست DM نمایش ندهید';

  @override
  String get dmListSentAnAttachment => 'یک پیوست ارسال شد';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username یک پیام را در این کانال پین کرد.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username $userName را به گروه اضافه کرد.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username شخصی را به گروه اضافه کرد.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username گروه را ترک کرد.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username $userName را از گروه حذف کرد.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username شخصی را از گروه حذف کرد.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username نام کانال را به $newName تغییر داد.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username نام کانال را تغییر داد.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username آیکون کانال را تغییر داد.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username تماس را شروع کرد.';
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
  String get voiceConnectionConfirmTitle => 'تأیید اتصال صوتی';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'شما در حال حاضر از $count دستگاه دیگر به این کانال صوتی متصل هستید. چه کاری می‌خواهید انجام دهید؟',
      one:
          'شما در حال حاضر از ۱ دستگاه دیگر به این کانال صوتی متصل هستید. چه کاری می‌خواهید انجام دهید؟',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'به این دستگاه سوئیچ کنید';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'فقط ملحق شوید (اتصالات دیگر را حفظ کنید)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'کاری انجام ندهید، نمی‌خواهم ملحق شوم';

  @override
  String get voiceChannelEmptyDescription =>
      'این یک کانال صوتی است. برای شروع صحبت کردن وصل شوید!';

  @override
  String get voiceChannelJoin => 'به کانال صوتی ملحق شوید';

  @override
  String get voiceChannelJoinConnect => 'به صدا وصل شوید';

  @override
  String get voiceChannelNoConnectPermission =>
      'شما اجازه پیوستن به این کانال صوتی را ندارید';

  @override
  String get voiceChannelE2eeEncrypted =>
      'میکروفون، دوربین و محتوای اشتراک‌گذاری صفحه نمایش به صورت سرتاسری رمزگذاری شده‌اند.';

  @override
  String get voiceCallE2eeEncrypted =>
      'میکروفون، دوربین و محتوای اشتراک‌گذاری صفحه نمایش به صورت سرتاسری رمزگذاری شده‌اند.';

  @override
  String get voiceChannelE2eeBroken =>
      'رمزگذاری سرتاسری در دسترس نیست زیرا یک شرکت‌کننده پشتیبانی نشده در این کانال صوتی حضور دارد.';

  @override
  String get voiceCallE2eeBroken =>
      'رمزگذاری سرتاسری در دسترس نیست زیرا یک شرکت‌کننده پشتیبانی نشده در این تماس حضور دارد.';

  @override
  String get voiceE2eeUpdateRequired =>
      'این کلاینت باید قبل از پیوستن به این تماس رمزگذاری شده به‌روزرسانی شود.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'شروع میکروفون شما امکان‌پذیر نبود. شما همچنان در تماس هستید.';

  @override
  String get voiceChannelStatusConnecting => 'در حال اتصال…';

  @override
  String get voiceChannelStatusConnected => 'متصل شد';

  @override
  String get voiceChannelStatusError => 'خطا';

  @override
  String get voiceParticipantTooltipMobileDevice => 'دستگاه موبایل';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'دستگاه دسکتاپ';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'بی‌صدا شده توسط جامعه کاربری';

  @override
  String get voiceParticipantTooltipMuted => 'بی‌صدا';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'کر شده توسط جامعه کاربری';

  @override
  String get voiceParticipantTooltipDeafened => 'کر شده';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'اتصال: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شرکت‌کننده',
      one: '۱ شرکت‌کننده',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'ترک';

  @override
  String get voiceControlMute => 'بی‌صدا کردن';

  @override
  String get voiceControlUnmute => 'فعال کردن صدا';

  @override
  String get voiceControlDeafen => 'کر کردن';

  @override
  String get voiceControlUndeafen => 'غیرفعال کردن کر';

  @override
  String get voiceControlVideo => 'ویدیو';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'اشتراک‌گذاری صفحه نمایش';

  @override
  String get voiceScreenShareNotificationText =>
      'در حال اشتراک‌گذاری صفحه نمایش شما.';

  @override
  String get voiceControlMore => 'بیشتر';

  @override
  String get voiceControlDisconnect => 'قطع اتصال';

  @override
  String get voiceParticipantMenuViewProfile => 'View profile';

  @override
  String get voiceParticipantMenuFocus => 'Focus this person';

  @override
  String get voiceParticipantMenuUnfocus => 'Unfocus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Mute';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Deafen';

  @override
  String get voiceParticipantMenuUserVolume => 'User volume';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream volume';

  @override
  String get voiceParticipantModerationFailed =>
      'Couldn\'t update that member. Please try again.';

  @override
  String get voiceControlChat => 'چت';

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
  String get voiceTextChatShow => 'نمایش چت';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# پیام خوانده نشده',
      one: '# پیام خوانده نشده',
    );
    return 'نمایش چت با $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'دسترسی به دوربین برای ویدیو لازم است.';

  @override
  String get voiceErrorScreenShareToggle =>
      'شروع اشتراک‌گذاری صفحه نمایش امکان‌پذیر نبود. لطفاً دوباره امتحان کنید.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'دسترسی اشتراک‌گذاری صفحه نمایش رد شد.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'اشتراک‌گذاری صفحه نمایش در این دستگاه در دسترس نیست.';

  @override
  String get voiceWatchStream => 'تماشای استریم';

  @override
  String get voiceStopWatching => 'توقف تماشا';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'تماشای استریم فعلی را متوقف کنید';

  @override
  String get voiceOwnScreenShareTitle => 'شما در حال پخش هستید';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'استریم شما برای شرکت‌کنندگان زنده است.';

  @override
  String get voiceLiveBadge => 'زنده';

  @override
  String get dmVoiceViewCall => 'مشاهده تماس';

  @override
  String get dmVoiceCallFullScreen => 'تمام صفحه';

  @override
  String get dmVoiceCallFullScreenTooltip => 'تماس را در تمام صفحه باز کنید';

  @override
  String get dmVoiceStripStatusConnecting => 'در حال اتصال…';

  @override
  String get dmVoiceStripStatusInCall => 'در تماس';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'تماس صوتی';

  @override
  String get dmVoiceCallBarConnecting => 'در حال اتصال…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'تماس مستقیم';

  @override
  String get dmVoiceCallBarGroupPrimary => 'تماس گروهی';

  @override
  String get dmVoiceCallBarIssueFallback => 'مشکل صوتی';

  @override
  String get dmVoiceFullscreenTitle => 'صوتی';

  @override
  String get voiceCallBarGuildConnectedFallback => 'صوتی متصل شد';

  @override
  String get notificationsPageTitle => 'اعلان‌ها';

  @override
  String get notificationsFilterUnreads => 'خوانده نشده‌ها';

  @override
  String get notificationsFilterMentions => 'منشن‌ها';

  @override
  String get notificationsBookmarksTooltip => 'نشانک‌ها';

  @override
  String get notificationsMentionFilterTooltip => 'فیلتر کردن منشن‌ها';

  @override
  String get notificationsMentionFiltersTitle => 'فیلترهای منشن';

  @override
  String get notificationsMentionIncludeEveryone =>
      'شامل منشن‌های @everyone و @here باشید';

  @override
  String get notificationsMentionIncludeRoles => 'شامل منشن‌های نقش باشید';

  @override
  String get notificationsMentionIncludeGuilds =>
      'شامل تمام منشن‌های انجمن باشید';

  @override
  String get notificationsNoUnreadTitle => 'پیام خوانده نشده‌ای وجود ندارد';

  @override
  String get notificationsNoUnreadBody => 'همه چیز را بررسی کرده‌اید.';

  @override
  String get notificationsNoMentionsTitle => 'منشن اخیر وجود ندارد';

  @override
  String get notificationsNoMentionsBody =>
      'تمام @منشن‌های شما به مدت ۷ روز در اینجا ظاهر می‌شوند.';

  @override
  String get notificationsMentionsEndTitle => 'به انتها رسیده‌اید';

  @override
  String get notificationsMentionsEndBody =>
      'تمام منشن‌های اخیر خود را دیده‌اید. نگران نباشید، به زودی موارد بیشتری در اینجا ظاهر می‌شوند.';

  @override
  String get notificationsJump => 'پرش';

  @override
  String get notificationsRemoveMentionTooltip => 'حذف منشن';

  @override
  String get notificationsViewAllUnread => 'مشاهده تمام خوانده نشده‌ها';

  @override
  String get notificationsMarkAsRead => 'علامت‌گذاری به عنوان خوانده شده';

  @override
  String get notificationsExpand => 'گسترش';

  @override
  String get notificationsCollapse => 'جمع کردن';

  @override
  String get notificationsMessageUnavailable => 'این پیام بارگیری نشد.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining کاراکتر باقی مانده';
  }

  @override
  String get characterCounterTooLong => 'پیام خیلی طولانی است';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining کاراکتر باقی مانده. برای نوشتن تا $premiumMaxLength کاراکتر، $productName را دریافت کنید.';
  }

  @override
  String get chatMessageFailedToSend => 'ارسال پیام ناموفق بود';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'پیام شما تحویل داده نشد. این معمولاً به این دلیل است که شما با گیرنده انجمنی مشترک ندارید یا گیرنده فقط پیام‌های مستقیم را از دوستان دریافت می‌کند. همچنین ممکن است لازم باشد تنظیمات حریم خصوصی پیام مستقیم خود را در $settingsPath تنظیم کنید.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'پیام شما تحویل داده نشد. برای ارسال پیام‌های مستقیم باید حساب خود را ادعا کنید.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'پیام شما تحویل داده نشد. برای ارسال پیام باید حساب خود را ادعا کنید.';

  @override
  String get chatSendFailureContentBlocked =>
      'پیام شما به دلیل مسدود شدن توسط سیستم‌های ایمنی ما تحویل داده نشد. اگر فکر می‌کنید این اشتباه است، لطفاً با پشتیبانی تماس بگیرید.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'پیام شما به دلیل داشتن ایموجی‌ها یا استیکرهای نامناسب که در این زمینه مجاز نیستند، تحویل داده نشد.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'فقط شما می‌توانید این پیام را ببینید.';

  @override
  String get chatClientSystemDismiss => 'رد کردن';

  @override
  String get privacyDashboardCommunicationSection => 'ارتباطات';

  @override
  String get chatMessageDeleteFailed => 'حذف پیام ناموفق بود';

  @override
  String get chatMessageAddReaction => 'افزودن واکنش';

  @override
  String get chatMessageEdit => 'ویرایش پیام';

  @override
  String get chatMessageReply => 'پاسخ دادن';

  @override
  String get chatMessageForward => 'ارسال';

  @override
  String get forwardMessageTitle => 'ارسال پیام';

  @override
  String get forwardSearchHint => 'جستجوی کانال‌ها یا پیام‌های خصوصی';

  @override
  String get forwardDirectMessagesSection => 'پیام‌های خصوصی';

  @override
  String get forwardCommentHint => 'افزودن نظر (اختیاری)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'ارسال ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'کانالی یافت نشد';

  @override
  String get forwardSuccessToast => 'پیام ارسال شد';

  @override
  String get forwardFailed => 'ارسال پیام ناموفق بود';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'نظرات در دسترس نیستند زیرا یک کانال انتخاب شده حالت کندی را فعال کرده است.';

  @override
  String get forwardDestinationNoSendPermission =>
      'شما نمی‌توانید پیام‌ها را اینجا ارسال کنید';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'شما نمی‌توانید پیوندها را اینجا جاسازی کنید';

  @override
  String get forwardDestinationNoAttachPermission =>
      'شما نمی‌توانید فایل‌ها را اینجا پیوست کنید';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'ارسال پیام‌ها در این انجمن غیرفعال شده است';

  @override
  String get forwardDestinationTimedOut =>
      'شما در این انجمن در حالت انتظار هستید';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'حالت کندی - منتظر بمانید $remaining';
  }

  @override
  String get chatMessageCopyText => 'کپی پیام';

  @override
  String get chatMessagePin => 'پین کردن پیام';

  @override
  String get chatMessageUnpin => 'حذف پین پیام';

  @override
  String get chatMessageUnpinIt => 'حذف پین';

  @override
  String get chatMessageBookmark => 'نشانه‌گذاری پیام';

  @override
  String get chatMessageRemoveBookmark => 'حذف نشانه‌گذاری';

  @override
  String get chatMessageMarkAsUnread => 'علامت‌گذاری به عنوان خوانده نشده';

  @override
  String get chatMessageCopyMessageLink => 'کپی لینک پیام';

  @override
  String get chatMessageCopyMessageId => 'کپی شناسه پیام';

  @override
  String get chatMessageViewReactions => 'مشاهده واکنش‌ها';

  @override
  String get chatMessageRemoveAllReactions => 'حذف همه واکنش‌ها';

  @override
  String get chatMessageDebug => 'اشکال‌زدایی پیام';

  @override
  String get chatMessageDebugSheetTitle => 'اشکال‌زدایی پیام';

  @override
  String get chatMessageDebugCopyJson => 'کپی JSON';

  @override
  String get chatMessageDebugJsonCopiedToast => 'JSON پیام در کلیپ‌بورد کپی شد';

  @override
  String get chatReactionsSheetTitle => 'واکنش‌ها';

  @override
  String get chatReactionsSheetEmpty =>
      'هنوز هیچ‌کس با این واکنش نشان نداده است.';

  @override
  String get chatMessageReport => 'گزارش پیام';

  @override
  String get iarReportMessageTitle => 'گزارش پیام';

  @override
  String get iarThisUserFallback => 'این کاربر';

  @override
  String get iarModalDescription =>
      'گزارش نقض قوانین، یا یافتن ابزارهایی برای مدیریت تماس و ترجیحات.';

  @override
  String get iarPathStepAriaLabel => 'چه چیزی نیاز دارید؟';

  @override
  String get iarCategoryStepTitle => 'چه نوع قانونی نقض شد؟';

  @override
  String get iarReasonStepTitle => 'کدام قانون نقض شد؟';

  @override
  String get iarReasonSelectHint => 'انتخاب دلیل';

  @override
  String get iarPickAnOptionToast => 'برای ادامه یک گزینه را انتخاب کنید.';

  @override
  String get iarPickARuleToast => 'قانونی که نقض شده را انتخاب کنید.';

  @override
  String get iarPathPlatform => 'گزارش نقض قانون پلتفرم';

  @override
  String get iarPathCommunity => 'گزارش به مدیران این انجمن';

  @override
  String get iarPathPreferenceMessage => 'من این محتوا را دوست ندارم';

  @override
  String get iarCategoryTargetedHarmLabel => 'تهدید، آزار یا آسیب';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'قلدری، تهدید، نفرت‌پراکنی، خشونت، یورش یا محتوایی که به خودآزاری دامن می‌زند.';

  @override
  String get iarCategorySafetyMinorsLabel => 'ایمنی کودکان یا محتوای نامناسب';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'کودکان در معرض خطر، محتوای نامناسب در جای نامناسب، یا رفتار ناخواسته.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'حریم خصوصی یا جعل هویت';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'افشای اطلاعات شخصی، تعقیب، جا زدن خود به جای دیگران، یا پروفایل نامناسب.';

  @override
  String get iarCategoryDeceptionLabel =>
      'کلاهبرداری، بدافزار یا اطلاعات نادرست';

  @override
  String get iarCategoryDeceptionDescription =>
      'فیشینگ، کلاهبرداری، لینک‌های مخرب، یا ادعاهای نادرست که احتمالاً باعث آسیب واقعی می‌شود.';

  @override
  String get iarCategoryIllegalOtherLabel => 'فعالیت غیرقانونی یا مورد دیگر';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'فروش‌های غیرقانونی، تسهیل جرم، یا نقض آشکار قوانین که در موارد بالا نمی‌گنجد.';

  @override
  String get iarReasonHarassmentLabel => 'آزار یا تهدید';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'قلدری، تماس مکرر ناخواسته، تعقیب، یا سوءاستفاده هدفمند.';

  @override
  String get iarReasonHateLabel => 'نفرت‌پراکنی';

  @override
  String get iarReasonHateMessageDescription =>
      'استفاده از کلمات توهین‌آمیز، زبان غیرانسانی، یا حملات به گروه‌های تحت حمایت.';

  @override
  String get iarReasonViolenceLabel => 'خشونت یا تهدید به خشونت';

  @override
  String get iarReasonViolenceDescription =>
      'تهدیدهای معتبر، خشونت گرافیکی، یا تجلیل از خشونت.';

  @override
  String get iarReasonMatureContentLabel => 'محتوای نامناسب یا آزار';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'رفتار ناخواسته یا محتوای نامناسب در جای نامناسب.';

  @override
  String get iarReasonChildSafetyLabel =>
      'ایمنی کودکان یا بهره‌کشی از خردسالان';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'محتوای مربوط به اغفال یا بهره‌کشی از کودکان.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'اطلاعات نادرست مضر';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'ادعاهای نادرستی که احتمالاً باعث آسیب واقعی می‌شود.';

  @override
  String get iarReasonSpamLabel => 'هرزنامه، کلاهبرداری، یا فیشینگ';

  @override
  String get iarReasonSpamMessageDescription =>
      'هرزنامه انبوه، کلاهبرداری، هدایای جعلی، یا سوءاستفاده از حساب کاربری.';

  @override
  String get iarReasonMalwareLabel => 'بدافزار یا لینک‌های خطرناک';

  @override
  String get iarReasonMalwareDescription =>
      'بدافزار، سرقت اطلاعات ورود به سیستم، یا فایل‌های مخرب.';

  @override
  String get iarReasonPrivacyLabel => 'نقض حریم خصوصی';

  @override
  String get iarReasonPrivacyDescription =>
      'افشای اطلاعات شخصی، اطلاعات خصوصی فاش شده، یا تعقیب.';

  @override
  String get iarReasonImpersonationLabel => 'جعل هویت یا رسانه فریبنده';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'جا زدن خود به جای شخص دیگر، از جمله محتوای تولید شده توسط هوش مصنوعی فریبنده.';

  @override
  String get iarReasonIllegalLabel => 'فعالیت غیرقانونی';

  @override
  String get iarReasonIllegalDescription =>
      'فروش‌های غیرقانونی، تسهیل جرم، یا فعالیت غیرقانونی.';

  @override
  String get iarReasonSelfHarmLabel => 'خودآزاری یا خودکشی';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'ترویج یا دستورالعمل‌هایی که به خودآزاری یا اختلالات خوردن تشویق می‌کند.';

  @override
  String get iarReasonOtherLabel => 'نقض آشکار قانون دیگر';

  @override
  String get iarReasonOtherDescription =>
      'فقط در صورتی استفاده کنید که به وضوح قوانین فلوکسر را نقض کند و در موارد بالا نگنجد.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'اگر پای یک فرد زیر سن قانونی در میان است، به جای آن از «$childSafetyReason» استفاده کنید.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'اگر این مورد شامل CSAM یا بهره‌کشی از یک فرد زیر سن قانونی است، فوراً آن را ارسال کنید و مجدداً مواد را به اشتراک نگذارید.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'اگر کسی ممکن است در معرض خطر فوری باشد، در صورت امکان با خیال راحت با خدمات اضطراری محلی تماس بگیرید.';

  @override
  String get iarSafetyNoteViolence =>
      'اگر این یک تهدید فوری معتبر است، با خدمات اضطراری محلی نیز تماس بگیرید.';

  @override
  String get iarSafetyNoteTerrorism =>
      'اگر این یک تهدید تروریستی فوری است، با خدمات اضطراری محلی نیز تماس بگیرید.';

  @override
  String get iarActionBlockUserTitle => 'مسدود کردن این کاربر';

  @override
  String get iarActionBlockUserDescription =>
      'جلوگیری از پیام‌ها و درخواست‌های دوستی.';

  @override
  String get iarActionBlockUserButton => 'مسدود کردن';

  @override
  String get iarActionCopyMessageLinkTitle => 'کپی کردن لینک پیام';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'با مدیران انجمن به اشتراک بگذارید.';

  @override
  String get iarActionCopyMessageLinkButton => 'کپی';

  @override
  String get iarActionCloseDmTitle => 'بستن این پیام خصوصی';

  @override
  String get iarActionCloseDmDescription =>
      'مسدود نمی‌کند. می‌توانید بعداً دوباره باز کنید.';

  @override
  String get iarActionCloseDmButton => 'بستن پیام خصوصی';

  @override
  String get iarActionLeaveCommunityTitle => 'ترک انجمن';

  @override
  String get iarActionLeaveCommunityDescription =>
      'مشاهده محتوا و اعضای آن را متوقف کنید.';

  @override
  String get iarActionLeaveCommunityButton => 'ترک';

  @override
  String get iarActionDmSettingsTitle => 'تنظیمات پیام خصوصی و درخواست دوستی';

  @override
  String get iarActionDmSettingsDescription =>
      'تغییر دهید چه کسی می‌تواند با شما تماس بگیرد.';

  @override
  String get iarActionCallSettingsTitle => 'تنظیمات تماس و چت گروهی';

  @override
  String get iarActionCallSettingsDescription =>
      'تغییر دهید چه کسی می‌تواند با شما تماس بگیرد یا شما را اضافه کند.';

  @override
  String get iarActionOpenButton => 'باز کردن';

  @override
  String get iarActionDeleteMessageTitle => 'حذف این پیام';

  @override
  String get iarActionDeleteMessageDescription =>
      'آن را برای همه از کانال حذف کنید.';

  @override
  String get iarActionDeleteMessageButton => 'حذف';

  @override
  String get iarActionDeleteMessageDeletedButton => 'حذف شده';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'این پیام قبلاً حذف شده است.';

  @override
  String get iarActionBanUserTitle => 'مسدود کردن این کاربر';

  @override
  String get iarActionBanUserDescription =>
      'پنجره مسدود کردن را برای این انجمن باز کنید.';

  @override
  String get iarActionBanUserButton => 'مسدود کردن';

  @override
  String get iarActionBanUserBannedButton => 'مسدود شده';

  @override
  String get iarActionBanUserBannedTooltip =>
      'این کاربر قبلاً از انجمن مسدود شده است.';

  @override
  String get iarCloseDmConfirmTitle => 'بستن پیام خصوصی';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'پیام خصوصی فعلی خود را با $name ببندید. این کار آنها را مسدود نمی‌کند؛ می‌توانید بعداً دوباره باز کنید.';
  }

  @override
  String get iarSuccessTitle => 'گزارش ارسال شد';

  @override
  String get iarSuccessBody =>
      'تیم امنیتی ما در حال بررسی آن است. پس از رسیدن به نتیجه، یک پیام خصوصی و ایمیل برای شما ارسال خواهیم کرد.';

  @override
  String get iarAlreadyReportedTitle => 'قبلاً گزارش شده است';

  @override
  String get iarAlreadyReportedBody =>
      'شما قبلاً این پیام را گزارش کرده‌اید. تیم امنیتی ما در حال بررسی آن است.';

  @override
  String get iarBackButton => 'بازگشت';

  @override
  String get iarContinueButton => 'ادامه';

  @override
  String get iarSendReportButton => 'ارسال گزارش';

  @override
  String get iarDoneButton => 'انجام شد';

  @override
  String get iarCouldntSendToast =>
      'ارسال گزارش ممکن نبود. لطفاً دوباره امتحان کنید.';

  @override
  String get iarRateLimitedToast =>
      'شما خیلی سریع گزارش می‌دهید. لطفاً لحظه‌ای صبر کنید و دوباره امتحان کنید.';

  @override
  String get iarReportSentToast =>
      'گزارش ارسال شد. تیم امنیتی ما آن را بررسی خواهد کرد.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'آیا $name را مسدود می‌کنید؟ آنها قادر به ارسال پیام یا درخواست دوستی به شما نخواهند بود. می‌توانید بعداً آنها را از مسدودیت خارج کنید.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'مسدود کردن این کاربر ممکن نبود. لطفاً دوباره امتحان کنید.';

  @override
  String get iarCloseDmSuccessToast => 'پیام خصوصی بسته شد.';

  @override
  String get iarCloseDmFailedToast =>
      'بستن این پیام خصوصی ممکن نبود. لطفاً دوباره امتحان کنید.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'ترک این انجمن ممکن نبود. لطفاً دوباره امتحان کنید.';

  @override
  String get chatMessageSuppressEmbeds => 'پنهان کردن پیش‌نمایش پیوند';

  @override
  String get chatMessageUnsuppressEmbeds => 'نمایش پیش‌نمایش پیوند';

  @override
  String get chatMessageDelete => 'حذف پیام';

  @override
  String get chatMessageDeleteConfirmTitle => 'حذف پیام';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'آیا مطمئن هستید که می‌خواهید این پیام را حذف کنید؟';

  @override
  String get chatMessageMore => 'بیشتر';

  @override
  String get chatEditingMessage => 'در حال ویرایش پیام';

  @override
  String get chatReplyOriginalDeleted => 'پیام اصلی حذف شد';

  @override
  String get chatReplyOriginalFailedToLoad => 'بارگیری پیام اصلی ناموفق بود';

  @override
  String get chatReplyAttachedMedia => 'پیام حاوی رسانه پیوست شده است';

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
  String get chatMessagesLoadError => 'بارگیری پیام‌ها ممکن نبود.';

  @override
  String get chatReplyMentionOverrideTitle => 'نادیده گرفتن تنظیمات منشن؟';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'کاربر $authorNickname ترجیح می‌دهد در پاسخ‌ها منشن شود. آیا همچنان بدون منشن ارسال می‌کنید؟';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname ترجیح می‌دهد پاسخ‌ها بدون منشن @ باشد. با این حال ارسال می‌کنید؟';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'نادیده گرفتن ترجیح';

  @override
  String get chatReplyMentionDisableTooltip =>
      'برای غیرفعال کردن پینگ کردن کاربری که به او پاسخ می‌دهید، کلیک کنید.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'برای فعال کردن پینگ کردن کاربری که به او پاسخ می‌دهید، کلیک کنید.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'منشن کردن کاربر پاسخ‌داده‌شده';

  @override
  String get chatReplyMentionOn => 'روشن';

  @override
  String get chatReplyMentionOff => 'خاموش';

  @override
  String get chatReplyCancel => 'لغو پاسخ';

  @override
  String get chatEditMessageHint => 'ویرایش پیام';

  @override
  String get chatEditNoChanges => 'تغییری برای ذخیره وجود ندارد';

  @override
  String get chatChannelNotReady =>
      'این کانال هنوز آماده نیست. لحظه‌ای دیگر دوباره امتحان کنید.';

  @override
  String get chatMessageEdited => '(ویرایش شده)';

  @override
  String get chatMessageSilent => 'این یک پیام @silent بود.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'امروز در $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'دیروز در $time';
  }

  @override
  String get mediaViewerImagePreview => 'پیش‌نمایش تصویر';

  @override
  String get mediaViewerClose => 'بستن نمایشگر رسانه';

  @override
  String get mediaViewerOpenInBrowser => 'باز کردن در مرورگر';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'ارسال';

  @override
  String get mediaViewerZoomIn => 'بزرگ‌نمایی';

  @override
  String get mediaViewerZoomOut => 'کوچک‌نمایی';

  @override
  String get mediaViewerPreviousAttachment => 'رسانه قبلی';

  @override
  String get mediaViewerNextAttachment => 'رسانه بعدی';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls =>
      'نمایش/پنهان کردن کنترل‌های ویدیو';

  @override
  String get chatAttachmentVideoMute => 'بی‌صدا کردن ویدیو';

  @override
  String get chatAttachmentVideoUnmute => 'باصدا کردن ویدیو';

  @override
  String get chatAttachmentVideoPlay => 'پخش ویدیو';

  @override
  String get chatAttachmentVideoPause => 'مکث ویدیو';

  @override
  String get chatAttachmentVideoProgress => 'پیشرفت ویدیو';

  @override
  String get chatVideoPlaybackFailed => 'پخش این ویدیو امکان‌پذیر نبود.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'به کاربران این نقش که مجوز مشاهده این کانال را دارند اطلاع دهید.';

  @override
  String get addGuildModalTitle => 'افزودن یک انجمن';

  @override
  String get addGuildModalLandingDescription =>
      'یک انجمن جدید ایجاد کنید یا به انجمن موجود بپیوندید.';

  @override
  String get addGuildCreateCommunity => 'ایجاد انجمن';

  @override
  String get addGuildJoinCommunity => 'پیوستن به انجمن';

  @override
  String get addGuildImportDiscordTemplate => 'وارد کردن قالب دیسکورد';

  @override
  String get addGuildJoinTitle => 'پیوستن به یک انجمن';

  @override
  String get addGuildJoinDescription =>
      'برای پیوستن به یک انجمن، لینک دعوت را وارد کنید.';

  @override
  String get addGuildInviteLinkLabel => 'لینک دعوت';

  @override
  String get addGuildJoinSubmit => 'پیوستن به انجمن';

  @override
  String get addGuildInviteInvalid =>
      'این دعوت‌نامه نامعتبر است یا منقضی شده است.';

  @override
  String get addGuildJoinFailed =>
      'پیوستن به انجمن امکان‌پذیر نبود. لطفاً دوباره امتحان کنید.';

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
  String get addGuildPackInstalled => 'بسته با موفقیت نصب شد.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'حذف همه واکنش‌ها';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'آیا مطمئن هستید که می‌خواهید همه واکنش‌ها را از این پیام حذف کنید؟';

  @override
  String get chatMessageUnpinConfirmTitle => 'حذف پین پیام';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'آیا می‌خواهید این پین را به گذشته برگردانید؟';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username $messageLink را به این کانال پین کرد. $allPinsLink را ببینید.';
  }

  @override
  String get systemPinMessageMessageLink => 'یک پیام';

  @override
  String get systemPinMessageAllPinsLink => 'همه پیام‌های پین‌شده';

  @override
  String get channelPinsEmptyTitle => 'هیچ پیام پین شده‌ای وجود ندارد';

  @override
  String get channelPinsEmptyDescription =>
      'پیام‌های پین شده در اینجا نمایش داده می‌شوند.';

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
  String get channelDetailsSearchTitle => 'Search';

  @override
  String get channelDetailsSearchHint => 'Search Messages';

  @override
  String get channelDetailsSearchFilterFrom => 'From';

  @override
  String get channelDetailsSearchFilterHas => 'Has';

  @override
  String get channelDetailsSearchFilterSort => 'Sort';

  @override
  String channelDetailsSearchResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Results',
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
  String get personalNotesTitle => 'یادداشت‌های شخصی';

  @override
  String get personalNotesSubtitle => 'فضای خصوصی شما برای افکار و یادآوری‌ها';

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
    return 'به $channelName خوش آمدید';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'در ابتدا، هیچ چیز نبود. سپس، $channelName پدیدار شد. و نیکو بود.';
  }

  @override
  String get personalNotesComposerHint => 'به خودتان پیام دهید';

  @override
  String get personalNotesPrivateSpace => 'فضای خصوصی شما';

  @override
  String get purgePersonalNotes => 'پاک کردن یادداشت‌های شخصی';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'این کار هر پیام و پیوست در یادداشت‌های شخصی شما را به طور دائم حذف می‌کند. این عمل قابل بازگشت نیست.';

  @override
  String get purgePersonalNotesConfirmButton => 'پاک کردن';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count پیام از یادداشت‌های شخصی پاک شد';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'یادداشت‌های شخصی از قبل خالی بودند';

  @override
  String get purgePersonalNotesFailed =>
      'امکان پاک کردن یادداشت‌های شخصی وجود نداشت';

  @override
  String get userSettingsGroupYourAccount => 'حساب کاربری شما';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'پروفایل';

  @override
  String get userSettingsNavSecurityLogin => 'امنیت و ورود';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'هدیه‌ها و کدها';

  @override
  String get userSettingsNavPrivacyDashboard => 'داشبورد حریم خصوصی';

  @override
  String get userSettingsNavAuthorizedApps => 'برنامه‌های مجاز';

  @override
  String get userSettingsNavBlockedUsers => 'کاربران مسدود شده';

  @override
  String get userSettingsNavLinkedDevices => 'دستگاه‌های متصل';

  @override
  String get userSettingsNavConnections => 'اتصالات';

  @override
  String get userSettingsNavLookAndFeel => 'ظاهر و حس';

  @override
  String get userSettingsNavAccessibility => 'دسترسی‌پذیری';

  @override
  String get userSettingsNavChat => 'پیام‌ها و رسانه';

  @override
  String get userSettingsNavAudioAndVideo => 'صدا و تصویر';

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
  String get audioAndVideoMicTestSectionDescription =>
      'Listen to how you sound with your current settings.';

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
  String get userSettingsNavLanguageAndTime => 'زبان و زمان';

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
  String get userSettingsNavAdvanced => 'پیشرفته';

  @override
  String get advancedPerformanceReportingTitle => 'گزارش عملکرد';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'با اشتراک‌گذاری داده‌های ناشناس خرابی و عملکرد، به بهبود Fluxer کمک کنید.';

  @override
  String get advancedPerformanceReportingLabel =>
      'ارسال گزارش‌های خرابی و عملکرد';

  @override
  String get advancedPerformanceReportingDescription =>
      'تمام داده‌های گزارش شده ناشناس هستند و فقط به سرویس نظارت خود Fluxer ارسال می‌شوند — هیچ ارائه‌دهنده شخص ثالثی استفاده نمی‌شود.';

  @override
  String get userSettingsNavApplications => 'برنامه‌ها';

  @override
  String get userSettingsNavAppLogs => 'لاگ‌های برنامه';

  @override
  String get userSettingsNavDeveloperTools => 'ابزارهای توسعه‌دهنده';

  @override
  String get userSettingsNavLimitsConfig => 'پیکربندی محدودیت‌ها';

  @override
  String get userSettingsNavFeatureFlags => 'پرچم‌های ویژگی';

  @override
  String get userSettingsNavWhatsNew => 'تازه‌ها';

  @override
  String get userSettingsNavLogOut => 'خروج';

  @override
  String get betaWarningTitle => 'نرم‌افزار بتا';

  @override
  String get betaWarningMessage =>
      'این نرم‌افزار بتا است. هنوز همه چیز کامل یا اضافه نشده است.';

  @override
  String get betaWarningReportIssues =>
      'لطفاً هر مشکلی را که پیدا می‌کنید به جامعه موبایل Fluxer گزارش دهید (در حال حاضر برای پیوستن به جامعه باید Plutonium داشته باشید).';

  @override
  String get betaWarningRepoLink => 'مشاهده سورس در گیت‌هاب';

  @override
  String get betaWarningGotIt => 'متوجه شدم';

  @override
  String get quickSwitcherTabSearch => 'جستجو';

  @override
  String get quickSwitcherTabFriends => 'دوستان';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'جستجو در کانال‌ها، افراد یا انجمن‌ها';

  @override
  String get quickSwitcherSearchFriends => 'جستجوی دوستان';

  @override
  String get quickSwitcherNoMatchesFound => 'موردی یافت نشد';

  @override
  String get quickSwitcherEmptyHint =>
      'نام دیگری را امتحان کنید یا از پیشوندها @ / # / ! / * برای فیلتر کردن نتایج استفاده کنید.';

  @override
  String get quickSwitcherSectionPeople => 'افراد';

  @override
  String get quickSwitcherSectionGroupMessages => 'پیام‌های گروهی';

  @override
  String get quickSwitcherSectionTextChannels => 'کانال‌های متنی';

  @override
  String get quickSwitcherSectionVoiceChannels => 'کانال‌های صوتی';

  @override
  String get quickSwitcherSectionCommunities => 'انجمن‌ها';

  @override
  String get quickSwitcherSectionSettings => 'تنظیمات';

  @override
  String get quickSwitcherHomeLabel => 'خانه';

  @override
  String get quickSwitcherDirectMessagesLabel => 'پیام‌های مستقیم';

  @override
  String get quickSwitcherFavoritesLabel => 'موارد دلخواه';

  @override
  String get quickSwitcherUserSettingsLabel => 'تنظیمات کاربر';

  @override
  String get quickSwitcherNotificationsLabel => 'اعلان‌ها';

  @override
  String get quickSwitcherBookmarksLabel => 'نشانک‌ها';

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
  String get quickSwitcherMentionsLabel => 'منشن‌ها';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'هنوز دوستی ندارید';

  @override
  String get quickSwitcherFriendsEmptyHint => 'برای شروع یک دوست اضافه کنید.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'هیچ دوستی با این جستجو مطابقت ندارد';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'نام دیگری را امتحان کنید.';

  @override
  String get quickSwitcherSearchAliasUser => 'کاربر';

  @override
  String get quickSwitcherSearchAliasYou => 'شما';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'پیام‌های مستقیم';

  @override
  String get quickSwitcherSearchAliasMessages => 'پیام‌ها';

  @override
  String get quickSwitcherSearchAliasFav => 'مورد دلخواه';

  @override
  String get quickSwitcherSearchAliasStarred => 'ستاره‌دار';

  @override
  String get quickSwitcherSearchAliasInbox => 'صندوق ورودی';

  @override
  String get quickSwitcherSearchAliasSaved => 'ذخیره شده';

  @override
  String get uiClose => 'بستن';

  @override
  String get chatJumpToBottom => 'پرش به پایین';

  @override
  String get uiConfirm => 'تأیید';

  @override
  String get uiLoading => 'در حال بارگیری';

  @override
  String get uiUnsavedChanges => 'تغییرات ذخیره نشده';

  @override
  String get uiReset => 'بازنشانی';

  @override
  String get uiOpenColorPicker => 'باز کردن انتخابگر رنگ';

  @override
  String get uiSelectPlaceholder => 'انتخاب کنید';

  @override
  String get uiSearchPlaceholder => 'جستجو';

  @override
  String get uiNoOptionsFound => 'گزینه‌ای یافت نشد';

  @override
  String get uiDismissNotification => 'رد کردن اعلان';

  @override
  String get uiColorPickerTitle => 'انتخابگر رنگ';

  @override
  String get mentionConfirmTitle => 'همه را منشن می‌کنید؟';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'این کار $count عضو را مطلع می‌کند. ادامه می‌دهید؟';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'این کار $count عضو آنلاین را مطلع می‌کند. ادامه می‌دهید؟';
  }

  @override
  String get mentionConfirmButton => 'منشن';

  @override
  String get composerEmojiUnavailable =>
      'شما نمی‌توانید از این ایموجی در اینجا استفاده کنید.';

  @override
  String get instanceUrlLabel => 'آدرس URL نمونه';

  @override
  String get instanceUrlPlaceholder =>
      'آدرس URL نمونه را وارد کنید (مانند fluxer.app)';

  @override
  String get resetToDefaultInstance => 'بازنشانی به Fluxer';

  @override
  String get instanceConnect => 'اتصال';

  @override
  String get instanceConnecting => 'در حال اتصال…';

  @override
  String get instanceConnectFailed => 'اتصال به نمونه ناموفق بود';

  @override
  String get recentInstances => 'نمونه‌های اخیر';

  @override
  String removeRecentInstance(String domain) {
    return 'حذف $domain از نمونه‌های اخیر';
  }

  @override
  String get instanceSheetTitle => 'اتصال به نمونه';

  @override
  String get connectToDifferentInstance => 'اتصال به نمونه‌ای دیگر';

  @override
  String get changeInstance => 'تغییر';

  @override
  String get instanceConnectionRequired =>
      'برای ورود به سیستم به نمونه متصل شوید';

  @override
  String get comingSoon => 'به زودی';

  @override
  String get guildNavbarDirectMessages => 'پیام‌های مستقیم';

  @override
  String get guildNavbarExploreDiscoverableCommunities => 'کاوش جوامع قابل کشف';

  @override
  String get discoveryExplore => 'کاوش';

  @override
  String get discoveryExplorePublicCommunities => 'کاوش جوامع عمومی';

  @override
  String get discoveryListingSubheading =>
      'آیا می‌خواهید جامعه خود را در اینجا فهرست کنید؟ اگر شرایط را در تنظیمات جامعه خود > کشف برآورده می‌کنید، درخواست دهید.';

  @override
  String get discoverySearchCommunities => 'جستجوی جوامع';

  @override
  String get discoveryFilterByLanguage => 'فیلتر بر اساس زبان';

  @override
  String get discoveryAllLanguages => 'همه زبان‌ها';

  @override
  String get discoveryAllCategories => 'همه';

  @override
  String get discoveryCategoryGaming => 'بازی';

  @override
  String get discoveryCategoryMusic => 'موسیقی';

  @override
  String get discoveryCategoryEntertainment => 'سرگرمی';

  @override
  String get discoveryCategoryEducation => 'آموزش';

  @override
  String get discoveryCategoryScienceAndTechnology => 'علم و فناوری';

  @override
  String get discoveryCategoryContentCreator => 'سازنده محتوا';

  @override
  String get discoveryCategoryAnimeAndManga => 'انیمه و مانگا';

  @override
  String get discoveryCategoryMoviesAndTv => 'فیلم و تلویزیون';

  @override
  String get discoveryCategoryOther => 'دیگر';

  @override
  String get discoveryNoCommunitiesMatch => 'هیچ جامعه‌ای مطابقت ندارد.';

  @override
  String get discoveryJoinCommunity => 'پیوستن به جامعه';

  @override
  String get discoveryJoined => 'پیوسته';

  @override
  String discoveryOnlineCount(String count) {
    return '$count آنلاین';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString عضو',
      one: '1 عضو',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'بدون توضیحات.';

  @override
  String get discoveryCommunities => 'جوامع';

  @override
  String get discoveryApps => 'برنامه‌ها';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'امکان پیوستن به این جامعه وجود نداشت';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'مشکلی پیش آمد. لطفاً لحظه‌ای دیگر دوباره امتحان کنید.';

  @override
  String get discoveryJoinErrorFullTitle => 'این جامعه پر است';

  @override
  String get discoveryJoinErrorFullMessage =>
      'این جامعه به حداکثر تعداد اعضای خود رسیده است، بنابراین در حال حاضر نمی‌توانید بپیوندید.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'به حداکثر تعداد جامعه رسیده‌اید';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'شما در حداکثر تعداد جوامع هستید. یکی را ترک کنید و دوباره امتحان کنید.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'شما نمی‌توانید به این جامعه بپیوندید';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'شما از این جامعه محروم شده‌اید.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'این جامعه دیگر در دسترس نیست';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'ممکن است از کشف خارج شده باشد یا پیوستن جدید را غیرفعال کرده باشد. صفحه را تازه کنید و دیگر آن را نخواهید دید.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'خیلی سریع عمل می‌کنید';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'لطفاً لحظه‌ای صبر کنید و دوباره امتحان کنید.';

  @override
  String get guildNavbarAddCommunity => 'افزودن جامعه';

  @override
  String get guildNavbarHelp => 'راهنما';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'پیام جدید';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '$folderName را ببند';
  }

  @override
  String get guildNavbarGroupDm => 'پیام خصوصی گروهی';

  @override
  String get guildNavbarCreateChannel => 'ایجاد کانال';

  @override
  String get guildNavbarChannelType => 'نوع کانال';

  @override
  String get guildNavbarTextChannel => 'کانال متنی';

  @override
  String get guildNavbarTextChannelDescription =>
      'ارسال پیام، عکس، گیف و ایموجی';

  @override
  String get guildNavbarVoiceChannel => 'کانال صوتی';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'با صدا، تصویر و اشتراک‌گذاری صفحه با هم وقت بگذرانید';

  @override
  String get guildNavbarLinkChannel => 'لینک کانال';

  @override
  String get guildNavbarLinkChannelDescription =>
      'دسترسی سریع به یک وب‌سایت یا منبع خارجی';

  @override
  String get guildNavbarNameLabel => 'نام';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'ایجاد دسته';

  @override
  String get guildNavbarNewCategoryHint => 'دسته جدید';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'دوستان را به $communityName دعوت کنید';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'گیرندگان به #$channelName هدایت می‌شوند';
  }

  @override
  String get guildNavbarSearchFriends => 'جستجوی دوستان';

  @override
  String get guildNavbarNoFriendsYet => 'هنوز دوستی ندارید';

  @override
  String get guildNavbarNoResults => 'نتیجه‌ای یافت نشد';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'یا، یک لینک دعوت برای دوستی بفرستید:';

  @override
  String get guildNavbarInviteLink => 'لینک دعوت';

  @override
  String get guildNavbarCopy => 'کپی';

  @override
  String get guildNavbarCopied => 'کپی شد!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'لینک دعوت شما در ۷ روز منقضی می‌شود.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'این لینک دعوت هرگز منقضی نمی‌شود.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'لینک دعوت شما در $duration منقضی می‌شود.';
  }

  @override
  String get guildNavbarEditInviteLink => 'ویرایش لینک دعوت';

  @override
  String get guildNavbarInviteLinkSettings => 'تنظیمات لینک دعوت';

  @override
  String get guildNavbarExpireAfter => 'انقضا پس از';

  @override
  String get guildNavbarMaxUses => 'حداکثر تعداد استفاده';

  @override
  String get guildNavbarGrantTemporaryMembership => 'اعطای عضویت موقت';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'اعضا تا زمانی که آفلاین شوند حذف خواهند شد مگر اینکه نقشی اختصاص داده شود';

  @override
  String get guildNavbarCreateNewLink => 'ایجاد لینک جدید';

  @override
  String get guildNavbarSent => 'ارسال شد';

  @override
  String get guildNavbarInvite => 'دعوت';

  @override
  String get guildNavbarLeaveCommunityTitle => 'ترک انجمن';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'آیا مطمئن هستید که می‌خواهید این انجمن را ترک کنید؟ دیگر قادر به مشاهده هیچ پیامی نخواهید بود.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'ترک انجمن';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'پیام‌های خود را در این انجمن حذف می‌کنید؟';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'تمام پیام‌هایی را که در اینجا، در هر کانالی ارسال کرده‌اید، به‌طور دائم حذف کنید. قابل بازگشت نیست.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'حذف پیام‌های من';

  @override
  String get guildNavbarDeletedYourMessages => 'پیام‌های شما حذف شد';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'امکان حذف پیام‌های شما وجود نداشت';

  @override
  String get guildNavbarRemoveOverride => 'حذف جایگزینی';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'بی‌صدا تا $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'فقط برای کارکنان فلوکسر قابل دسترسی است';

  @override
  String get guildNavbarInvitesPaused =>
      'دعوت‌ها در حال حاضر در این انجمن متوقف شده‌اند';

  @override
  String get guildNavbarDurationNever => 'هرگز';

  @override
  String get guildNavbarDuration30Minutes => '۳۰ دقیقه';

  @override
  String get guildNavbarDuration1Hour => '۱ ساعت';

  @override
  String get guildNavbarDuration6Hours => '۶ ساعت';

  @override
  String get guildNavbarDuration12Hours => '۱۲ ساعت';

  @override
  String get guildNavbarDuration1Day => '۱ روز';

  @override
  String get guildNavbarDuration7Days => '۷ روز';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count ثانیه';
  }

  @override
  String get guildNavbarNever => 'هرگز';

  @override
  String get guildNavbarNoLimit => 'بدون محدودیت';

  @override
  String get guildNavbarOneUse => '۱ استفاده';

  @override
  String guildNavbarUses(int count) {
    return '$count استفاده';
  }

  @override
  String get guildMenuMarkAsRead => 'علامت‌گذاری به عنوان خوانده شده';

  @override
  String get guildPeekMoreOptions => 'گزینه‌های بیشتر';

  @override
  String get guildMenuInviteMembers => 'دعوت اعضا';

  @override
  String get guildMenuCommunitySettings => 'تنظیمات انجمن';

  @override
  String get guildMenuEditCommunityProfile => 'ویرایش پروفایل انجمن';

  @override
  String get guildMenuUnmuteCommunity => 'لغو بی‌صدا کردن انجمن';

  @override
  String get guildMenuMuteCommunity => 'بی‌صدا کردن انجمن';

  @override
  String get guildMenuHideMutedChannels => 'پنهان کردن کانال‌های بی‌صدا شده';

  @override
  String get guildMenuReportCommunity => 'گزارش انجمن';

  @override
  String get guildMenuDebugCommunity => 'اشکال‌زدایی انجمن';

  @override
  String get guildMenuCopyCommunityId => 'کپی کردن شناسه انجمن';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'تا $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'عمومی';

  @override
  String get guildMenuSettingsRoles => 'نقش‌ها و مجوزها';

  @override
  String get guildMenuSettingsEmoji => 'اموجی سفارشی';

  @override
  String get guildMenuSettingsStickers => 'استیکرهای سفارشی';

  @override
  String get guildMenuSettingsSafetyModeration => 'ایمنی و نظارت';

  @override
  String get guildMenuSettingsActivityLog => 'گزارش فعالیت';

  @override
  String get guildMenuSettingsWebhooks => 'وب‌هوک‌ها';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'لینک دعوت سفارشی';

  @override
  String get guildMenuSettingsDiscovery => 'کشف';

  @override
  String get guildMenuSettingsMembers => 'اعضا';

  @override
  String get guildMenuSettingsInviteLinks => 'لینک‌های دعوت';

  @override
  String get guildMenuSettingsBans => 'ممنوعیت‌ها';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'شما اجازه مشاهده این تب تنظیمات را ندارید.';

  @override
  String get guildSettingsOverviewIconTitle => 'آیکون';

  @override
  String get guildSettingsUploadImage => 'آپلود تصویر';

  @override
  String get guildSettingsOverviewBannerTitle => 'بنر';

  @override
  String get guildSettingsOverviewBannerHint =>
      'یک بنر برای سرور خود آپلود کنید.';

  @override
  String get guildSettingsOverviewNameTitle => 'نام';

  @override
  String get guildSettingsOverviewNameHint => 'انجمن شگفت‌انگیز من';

  @override
  String get guildSettingsOverviewStatsTitle => 'آمار';

  @override
  String get guildSettingsOverviewMembers => 'اعضا';

  @override
  String get guildSettingsOverviewOnline => 'آنلاین';

  @override
  String get guildSettingsRolesDescription =>
      'از نقش‌ها برای گروه‌بندی اعضا و تخصیص مجوزها استفاده کنید.';

  @override
  String get guildSettingsCreateRole => 'ایجاد نقش';

  @override
  String get guildSettingsRolesListTitle => 'نقش‌ها';

  @override
  String get guildSettingsRolesNewRole => 'New role';

  @override
  String get guildSettingsRolesDeleteRole => 'Delete role';

  @override
  String get guildSettingsRolesBackToRoles => 'Back to roles';

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
    return '$staticCount استاتیک، $animatedCount اسلات اموجی متحرک استفاده شده';
  }

  @override
  String get guildSettingsEmojiEmpty => 'هنوز اموجی سفارشی وجود ندارد.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count استیکر آپلود شده';
  }

  @override
  String get guildSettingsStickersEmpty => 'هنوز استیکر سفارشی وجود ندارد.';

  @override
  String get guildSettingsModerationVerificationTitle => 'تأیید عضو';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'انتخاب کنید اعضا قبل از ارسال یا ارسال پیام خصوصی به اعضای انجمن به چه مواردی نیاز دارند.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'اعضای دارای نقش می‌توانند این بررسی‌ها را دور بزنند. برای فضاهای عمومی، فعال کردن تأیید را توصیه می‌کنیم.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'انجمن‌های فهرست شده در Discovery حداقل به ایمیل تأیید شده نیاز دارند. هنگام فعال بودن Discovery، نمی‌توان None را انتخاب کرد.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'محتوای نامناسب و هشدارهای محتوا';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'برچسب‌گذاری محتوای نامناسب و هشدارهای محتوای اختیاری را برای اعضا پیکربندی کنید.';

  @override
  String get guildSettingsModerationMatureToggle => 'محتوای نامناسب';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'این انجمن را به عنوان حاوی محتوای نامناسب علامت‌گذاری کنید.';

  @override
  String get guildSettingsVerificationNone => 'هیچ‌کدام';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'هیچ تأییدی لازم نیست.';

  @override
  String get guildSettingsVerificationLow => 'پایین';

  @override
  String get guildSettingsVerificationLowDescription =>
      'نیاز به آدرس ایمیل تأیید شده دارد.';

  @override
  String get guildSettingsVerificationMedium => 'متوسط';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'نیاز به آدرس ایمیل تأیید شده و حسابی با حداقل ۵ دقیقه قدمت دارد.';

  @override
  String get guildSettingsVerificationHigh => 'بالا';

  @override
  String get guildSettingsVerificationHighDescription =>
      'همه موارد در سطح متوسط را به همراه عضویت در انجمن به مدت حداقل ۱۰ دقیقه نیاز دارد.';

  @override
  String get guildSettingsVerificationHighest => 'خیلی بالا';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'نیاز به شماره تلفن تأیید شده دارد.';

  @override
  String get guildSettingsAuditLogDescription =>
      'اقدامات مدیران را در سراسر انجمن پیگیری کنید.';

  @override
  String get guildSettingsAuditLogEmpty => 'هنوز هیچ گزارشی وجود ندارد';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'اقدامات مدیریتی و تغییرات انجمن در اینجا نمایش داده می‌شوند.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'همه کاربران';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'همه اقدامات';

  @override
  String get guildSettingsAuditLogNoReason => 'هیچ دلیلی ارائه نشد.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'کاربر ناشناس';

  @override
  String get guildSettingsAuditLogLoadError =>
      'هنگام بارگیری گزارش فعالیت مشکلی پیش آمد.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'امکان بارگیری گزارش‌های فعالیت وجود ندارد';

  @override
  String get guildSettingsAuditLogReason => 'دلیل';

  @override
  String get guildSettingsAuditLogSomeone => 'شخصی';

  @override
  String get guildSettingsAuditLogSomething => 'چیزی';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'موجودیت ناشناس';

  @override
  String get guildSettingsAuditLogNothing => 'هیچ چیز';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'هدف ناشناس';

  @override
  String get auditLogActionGuildUpdate => 'انجمن به‌روزرسانی شد';

  @override
  String get auditLogActionChannelCreate => 'کانال ایجاد شد';

  @override
  String get auditLogActionChannelUpdate => 'کانال به‌روزرسانی شد';

  @override
  String get auditLogActionChannelDelete => 'کانال حذف شد';

  @override
  String get auditLogActionChannelOverwriteCreate => 'بازنویسی کانال اضافه شد';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'بازنویسی کانال به‌روزرسانی شد';

  @override
  String get auditLogActionChannelOverwriteDelete => 'بازنویسی کانال حذف شد';

  @override
  String get auditLogActionMemberKick => 'عضو اخراج شد';

  @override
  String get auditLogActionMemberPrune => 'اعضا حذف شدند';

  @override
  String get auditLogActionMemberBanAdd => 'عضو مسدود شد';

  @override
  String get auditLogActionMemberBanRemove => 'عضو از مسدودیت خارج شد';

  @override
  String get auditLogActionMemberUpdate => 'عضو به‌روزرسانی شد';

  @override
  String get auditLogActionMemberRoleUpdate => 'نقش‌های عضو به‌روزرسانی شد';

  @override
  String get auditLogActionMemberMove => 'عضو منتقل شد';

  @override
  String get auditLogActionMemberDisconnect => 'عضو قطع اتصال شد';

  @override
  String get auditLogActionBotAdd => 'ربات اضافه شد';

  @override
  String get auditLogActionRoleCreate => 'نقش ایجاد شد';

  @override
  String get auditLogActionRoleUpdate => 'نقش به‌روزرسانی شد';

  @override
  String get auditLogActionRoleDelete => 'نقش حذف شد';

  @override
  String get auditLogActionInviteCreate => 'دعوت‌نامه ایجاد شد';

  @override
  String get auditLogActionInviteUpdate => 'دعوت‌نامه به‌روزرسانی شد';

  @override
  String get auditLogActionInviteDelete => 'دعوت‌نامه حذف شد';

  @override
  String get auditLogActionWebhookCreate => 'وب‌هوک ایجاد شد';

  @override
  String get auditLogActionWebhookUpdate => 'وب‌هوک به‌روزرسانی شد';

  @override
  String get auditLogActionWebhookDelete => 'وب‌هوک حذف شد';

  @override
  String get auditLogActionEmojiCreate => 'ایموجی ایجاد شد';

  @override
  String get auditLogActionEmojiUpdate => 'ایموجی به‌روزرسانی شد';

  @override
  String get auditLogActionEmojiDelete => 'ایموجی حذف شد';

  @override
  String get auditLogActionStickerCreate => 'استیکر ایجاد شد';

  @override
  String get auditLogActionStickerUpdate => 'استیکر به‌روزرسانی شد';

  @override
  String get auditLogActionStickerDelete => 'استیکر حذف شد';

  @override
  String get auditLogActionMessageDelete => 'پیام حذف شد';

  @override
  String get auditLogActionMessageBulkDelete => 'پیام‌ها حذف شدند';

  @override
  String get auditLogActionMessagePin => 'پیام پین شد';

  @override
  String get auditLogActionMessageUnpin => 'پیام از حالت پین خارج شد';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor تنظیمات انجمن را به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor کانال $target را ایجاد کرد.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor کانال $target را به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor کانال $target را حذف کرد.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor مجوزهای کانال را برای $target اضافه کرد.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor مجوزهای کانال را برای $target در $channel اضافه کرد.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor مجوزهای کانال را برای $target به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor مجوزهای کانال را برای $target در $channel به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor مجوزهای کانال را برای $target حذف کرد.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor مجوزهای کانال را برای $target در $channel حذف کرد.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor عضو $target را اخراج کرد.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor عضو $target را مسدود کرد.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor عضو $target را از مسدودیت خارج کرد.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor عضو $target را به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor نقش‌های $target را به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor اعضای غیرفعال را پاکسازی کرد.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor اعضای غیرفعال برای $days روز را پاکسازی کرد.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor عضو $target را به کانال صوتی دیگری منتقل کرد.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor عضو $target را به $channel منتقل کرد.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor عضو $target را از صدا قطع کرد.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor ربات $target را اضافه کرد.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor نقش $target را ایجاد کرد.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor نقش $target را به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor نقش $target را حذف کرد.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor دعوت‌نامه $target را ایجاد کرد.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor دعوت‌نامه $target را برای کانال $channel ایجاد کرد.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor دعوت‌نامه $target را به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor دعوت‌نامه $target را برای کانال $channel به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor دعوت‌نامه $target را حذف کرد.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor دعوت‌نامه $target را برای کانال $channel حذف کرد.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor وب‌هوک $target را ایجاد کرد.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor وب‌هوک $target را به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor وب‌هوک $target را حذف کرد.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor emoji $target را اضافه کرد.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor emoji $target را به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor emoji $target را حذف کرد.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor استیکر $target را اضافه کرد.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor استیکر $target را به‌روزرسانی کرد.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor استیکر $target را حذف کرد.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor یک پیام را حذف کرد.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor یک پیام را در $channel حذف کرد.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor چندین پیام را حذف کرد.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor $count پیام را حذف کرد.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor چندین پیام را در $channel حذف کرد.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor $count پیام را در $channel حذف کرد.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor یک پیام را پین کرد.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor یک پیام را در $channel پین کرد.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor یک پیام را از حالت پین خارج کرد.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor یک پیام را در $channel از حالت پین خارج کرد.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor یک اقدام حسابرسی روی $target انجام داد.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '$field از $oldValue به $newValue به‌روزرسانی شد.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '$field روی $newValue تنظیم شد.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '$field پاک شد (قبلاً $oldValue بود).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '$field به‌روزرسانی شد.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'انجمن به $name تغییر نام یافت.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'آیکون انجمن به‌روزرسانی شد.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'کانال به $name تغییر نام یافت.';
  }

  @override
  String get auditLogChangeClearedTopic => 'موضوع پاک شد.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'موضوع به $topic به‌روزرسانی شد.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'محتوای نامناسب فعال شد.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'محتوای نامناسب غیرفعال شد.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'نام مستعار به $nickname تنظیم شد.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'نام مستعار $nickname حذف شد.';
  }

  @override
  String get auditLogChangeMutedMember => 'عضو میوت شد.';

  @override
  String get auditLogChangeUnmutedMember => 'عضو از حالت میوت خارج شد.';

  @override
  String get auditLogChangeDeafenedMember => 'عضو ناشنوا شد.';

  @override
  String get auditLogChangeUndeafenedMember => 'عضو از حالت ناشنوا خارج شد.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '$roles اضافه شد.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '$roles حذف شد.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'کانال: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'پیام: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'دعوت شده توسط $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# پیام حذف شد.',
      one: 'یک پیام حذف شد.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# عضو حذف شد.',
      one: 'یک عضو حذف شد.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'این دعوت‌نامه هرگز منقضی نمی‌شود.';

  @override
  String get auditLogOptionTemporaryMembership => 'عضویت موقت اعطا می‌کند.';

  @override
  String get auditLogOptionPermanentMembership => 'عضویت دائمی اعطا می‌کند.';

  @override
  String get guildSettingsLoadMore => 'بارگذاری بیشتر';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'وب‌هوک‌هایی را که پیام‌ها را در کانال‌ها ارسال می‌کنند، مدیریت کنید.';

  @override
  String get guildSettingsWebhooksEmpty => 'وب‌هوک پیکربندی نشده است.';

  @override
  String get guildSettingsCopyUrl => 'کپی کردن URL';

  @override
  String get guildSettingsCopiedUrl => 'URL در کلیپ‌بورد کپی شد';

  @override
  String get guildSettingsDeleteWebhook => 'حذف وب‌هوک';

  @override
  String get guildSettingsVanityUrlDescription =>
      'یک لینک دعوت سفارشی برای سرور خود تنظیم کنید.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'ذخیره';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'استفاده';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count بار استفاده';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'برای فهرست شدن در بخش کشف سرور درخواست دهید.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'برای درخواست حداقل $count عضو لازم است.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'درخواست';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'وضعیت';

  @override
  String get guildSettingsDiscoveryCategory => 'دسته بندی';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'توضیحات';

  @override
  String get guildSettingsDiscoveryTags => 'تگ‌ها';

  @override
  String get guildSettingsDiscoveryTagsHint => 'بازی، هنر، موسیقی';

  @override
  String get guildSettingsDiscoveryApply => 'ارسال درخواست';

  @override
  String get guildSettingsDiscoveryWithdraw => 'لغو';

  @override
  String get guildSettingsMembersDescription =>
      'اعضای سرور را جستجو و مدیریت کنید.';

  @override
  String get guildSettingsMembersSearchHint => 'جستجوی اعضا';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count عضو';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'لینک‌های دعوت فعال را مشاهده و لغو کنید.';

  @override
  String get guildSettingsInvitesEmpty => 'دعوت‌نامه فعالی وجود ندارد.';

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
    return '$uses / $maxUses استفاده';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'منقضی می‌شود $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'کاربران مسدود شده را مشاهده و مدیریت کنید.';

  @override
  String get guildSettingsBansSearchHint => 'جستجوی مسدودیت‌ها';

  @override
  String get guildSettingsBansEmpty => 'کاربر مسدود شده‌ای وجود ندارد.';

  @override
  String get guildSettingsBanPermanent => 'مسدودیت دائمی';

  @override
  String guildSettingsBanExpires(String date) {
    return 'منقضی می‌شود $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'منقضی می‌شود';

  @override
  String get guildSettingsUnban => 'رفع مسدودیت';

  @override
  String get guildSettingsBansLoading => 'در حال بارگیری کاربران مسدود شده';

  @override
  String get guildSettingsBansNoSearchResults =>
      'هیچ مسدودیت مطابق با جستجوی شما یافت نشد.';

  @override
  String get guildSettingsBanDetailsTitle => 'جزئیات مسدودیت';

  @override
  String get guildSettingsBanViewDetails => 'مشاهده جزئیات';

  @override
  String get guildSettingsBannedOn => 'مسدود شده در';

  @override
  String get guildSettingsBannedBy => 'مسدود شده توسط';

  @override
  String get guildSettingsRevokeBanTitle => 'لغو مسدودیت';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'آیا مطمئن هستید که می‌خواهید مسدودیت $displayName را لغو کنید؟ او قادر به پیوستن مجدد به انجمن خواهد بود.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'مسدودیت $displayName لغو شد';
  }

  @override
  String get guildSettingsBansLoadError =>
      'امکان بارگیری مسدودیت‌ها وجود نداشت. دوباره تلاش کنید.';

  @override
  String get guildSettingsRevokeBanError =>
      'امکان لغو مسدودیت وجود نداشت. دوباره تلاش کنید.';

  @override
  String get guildSettingsCommunitySettings => 'تنظیمات انجمن';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewDescription =>
      'پروفایل، کانال‌ها و تنظیمات پیش‌فرض انجمن خود را مدیریت کنید.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'برندینگ';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'آیکون، نام، بنر و پس‌زمینه دعوت خود را به‌روز کنید';

  @override
  String get guildSettingsOverviewBannerUpload => 'بارگذاری بنر';

  @override
  String get guildSettingsOverviewIdleTitle => 'تنظیمات بیکاری';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'کانال AFK و مهلت زمانی را پیکربندی کنید';

  @override
  String get guildSettingsOverviewSystemTitle => 'سیستم و خوش‌آمدگویی';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'مقصد پیام‌های سیستمی و خوش‌آمدگویی را انتخاب کنید';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'اعلان‌های پیش‌فرض';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'انجمن‌های با بیش از ۲۵۰ نفر به تنظیمات «فقط منشن‌ها» اجبار می‌شوند. تنظیمات اصلی شما حفظ می‌شود و در صورت کاهش تعداد اعضای انجمن به زیر ۲۵۰ نفر، بازیابی خواهد شد.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'پیشرفته';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'اجازه نام‌های انعطاف‌پذیر کانال متنی';

  @override
  String get guildSettingsOverviewHideOwnerCrown => 'مخفی کردن تاج مالک انجمن';

  @override
  String get guildSettingsOverviewDetachedBanner => 'بنر جدا';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'بنر را در بخش جداگانه‌ای زیر هدر انجمن نمایش می‌دهد.';

  @override
  String get guildSettingsOverviewUploadIcon => 'بارگذاری آیکون';

  @override
  String get guildSettingsOverviewRemoveImage => 'حذف';

  @override
  String get guildSettingsOverviewSplashTitle => 'پس‌زمینه دعوت‌نامه';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'پس‌زمینه امبد چت';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'در امبد‌های دعوت‌نامه در چت نمایش داده می‌شود.';

  @override
  String get guildSettingsOverviewUploadBackground => 'بارگذاری پس‌زمینه';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'بدون بنر انجمن';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'بدون پس‌زمینه دعوت‌نامه';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'پیش‌نمایش';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'ببینید دعوت‌نامه شما برای بازدیدکنندگان چگونه به نظر می‌رسد.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'نام کانال‌های متنی';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'تاج مالک انجمن';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'تنظیم کنید که آیا آیکون تاج در کنار مالک انجمن نمایش داده شود یا خیر';

  @override
  String get guildSettingsSplashCardAlignment => 'تراز کارت';

  @override
  String get guildSettingsSplashAlignmentCenter => 'وسط';

  @override
  String get guildSettingsSplashAlignmentLeft => 'چپ';

  @override
  String get guildSettingsSplashAlignmentRight => 'راست';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'فقط در صفحه‌های عریض اعمال می‌شود.';

  @override
  String get permissionReadMessageHistory => 'خواندن تاریخچه پیام';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'تغییر آنچه کاربران بدون \"$permission\" می‌توانند ببینند';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'از یک پنجره اختصاصی برای تعیین تاریخ آستانه تاریخچه پیام برای اعضایی که مجوز $permission را ندارند استفاده کنید.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'باز کردن آستانه تاریخچه پیام';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'آستانه تاریخچه پیام';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'فعال کردن آستانه تاریخچه پیام';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'تاریخ آستانه';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'اعضایی که تاریخچه پیام را نمی‌خوانند می‌توانند پیام‌های ارسال شده پس از این تاریخ را مشاهده کنند.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'آستانه تاریخچه پیام به‌روز شد';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'اجازه حروف بزرگ و فاصله‌ها در نام کانال‌های متنی. غیرفعال کردن نام‌ها را به حروف کوچک با خط تیره و زیرخط محدود می‌کند.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'آیکون تاج را در کنار مالک انجمن در همه جا مخفی می‌کند.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'آیکون‌های متحرک به ویژگی انجمن آیکون متحرک نیاز دارند.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'بنرهای متحرک به ویژگی انجمن بنر متحرک نیاز دارند.';

  @override
  String get guildSettingsAfkChannel => 'کانال AFK / بیکار';

  @override
  String get guildSettingsAfkChannelHint =>
      'اعضا را هنگام بیکار بودن به این کانال منتقل کنید.';

  @override
  String get guildSettingsNoAfkChannel => 'بدون کانال AFK';

  @override
  String get guildSettingsAfkTimeout => 'زمان انتظار AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '۱ دقیقه';

  @override
  String get guildSettingsAfkTimeout5Min => '۵ دقیقه';

  @override
  String get guildSettingsAfkTimeout15Min => '۱۵ دقیقه';

  @override
  String get guildSettingsAfkTimeout30Min => '۳۰ دقیقه';

  @override
  String get guildSettingsAfkTimeout1Hour => '۱ ساعت';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds ثانیه';
  }

  @override
  String get guildSettingsSystemChannel => 'کانال مقصد';

  @override
  String get guildSettingsSystemChannelHint =>
      'پیام‌های خوش‌آمدگویی و سیستمی در اینجا ظاهر می‌شوند.';

  @override
  String get guildSettingsNoSystemChannel => 'بدون کانال سیستمی';

  @override
  String get guildSettingsHideJoinMessages => 'مخفی کردن پیام‌های پیوستن';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'پیام‌های ورود را در کانال مقصد پنهان می‌کند.';

  @override
  String get guildSettingsDefaultNotifications => 'تنظیمات پیش‌فرض اعلان';

  @override
  String get guildSettingsNotificationsAll => 'همه پیام‌ها';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'دریافت اعلان برای همه پیام‌ها';

  @override
  String get guildSettingsNotificationsMentions => 'فقط منشن‌ها';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'دریافت اعلان فقط برای منشن‌ها';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG، PNG، WebP، AVIF. حداکثر ۱۰ مگابایت. حداقل: ۹۶۰×۵۴۰ پیکسل (۱۶:۹)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG، PNG، WebP، AVIF. حداکثر ۱۰ مگابایت. حداقل: ۹۶۰×۵۴۰ پیکسل (۱۶:۹). در امبد‌های دعوت در چت نمایش داده می‌شود.';

  @override
  String get guildSettingsModerationDescription =>
      'تنظیمات تأیید، فیلتر محتوا و محتوای نامناسب را پیکربندی کنید.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'انجمن‌های فهرست شده در دیسکاوری گزینه‌های تعدیل محدودی دارند.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'فیلتر محتوا';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'پیام‌ها را برای محتوای صریح در کانال‌هایی که برای محتوای نامناسب علامت‌گذاری نشده‌اند، به‌طور خودکار غربالگری کنید.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'انجمن‌های فهرست شده در دیسکاوری موظف به اسکن همه اعضا هستند. این تنظیم را نمی‌توان در حالی که دیسکاوری فعال است تغییر داد.';

  @override
  String get guildSettingsContentFilterOff => 'خاموش';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'به انجمن اجازه دهید خود را تعدیل کند';

  @override
  String get guildSettingsContentFilterNoRole => 'فیلتر اعضای بدون نقش';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'برای اکثر انجمن‌ها پیشنهاد می‌شود';

  @override
  String get guildSettingsContentFilterAll => 'فیلتر همه';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'حداکثر محافظت برای فضاهای خانوادگی';

  @override
  String get guildSettingsModerationMatureOff => 'خاموش';

  @override
  String get guildSettingsModerationMatureOn => 'روشن';

  @override
  String get guildSettingsContentWarningToggle => 'نمایش هشدار محتوا';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'یک درخواست رضایت قبل از ورود به هر کانال را فعال/غیرفعال می‌کند.';

  @override
  String get guildSettingsContentWarningText => 'متن هشدار سفارشی';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'این حاوی محتوای حساس است.';

  @override
  String get guildSettingsModeration2faTitle => 'الزام احراز هویت دو مرحله‌ای';

  @override
  String get guildSettingsModeration2faDescription =>
      'قبل از اینکه بتوانند بن کنند، اخراج کنند، تایم‌اوت کنند یا پیام‌ها را حذف کنند، برای مدیران احراز هویت دو مرحله‌ای الزامی است.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'الزام احراز هویت دو مرحله‌ای برای اقدامات مدیریتی';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'فقط مالک انجمن می‌تواند این تنظیم را تغییر دهد';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'برای تغییر این تنظیم، احراز هویت دو مرحله‌ای را در حساب خود فعال کنید';

  @override
  String get guildSettingsEmojiSearchHint => 'جستجوی ایموجی';

  @override
  String get guildSettingsEmojiUploadTitle => 'بارگذاری ایموجی';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'ایموجی غیر متحرک ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'ایموجی متحرک ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'جستجوی استیکر';

  @override
  String get guildSettingsWebhooksInfo =>
      'وب‌هوک‌ها را از تنظیمات کانال ایجاد کنید. آن‌ها را اینجا ویرایش کنید.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'URL سفارشی شما کار نخواهد کرد مگر اینکه حداقل یک کانال برای همه قابل مشاهده باشد.';

  @override
  String get guildSettingsVanityUrlRemove => 'حذف';

  @override
  String get guildSettingsBannedUsersTitle => 'کاربران مسدود شده';

  @override
  String get guildSettingsInvitesTableInviter => 'دعوت‌کننده';

  @override
  String get guildSettingsInvitesTableChannel => 'کانال';

  @override
  String get guildSettingsInvitesTableCode => 'کد';

  @override
  String get guildSettingsInvitesTableUses => 'استفاده‌ها';

  @override
  String get guildSettingsInvitesTableCreated => 'ایجاد شده';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'جدیدترین اول';

  @override
  String get guildSettingsAuditLogFilterUser => 'فیلتر بر اساس کاربر';

  @override
  String get guildSettingsAuditLogFilterAction => 'فیلتر بر اساس اقدام';

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
}
