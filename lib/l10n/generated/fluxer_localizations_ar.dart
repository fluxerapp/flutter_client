// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class FluxerLocalizationsAr extends FluxerLocalizations {
  FluxerLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get reconnectingTitle => 'لقد أخطأنا!';

  @override
  String get reconnectingBody =>
      'هناك خطأ ما في الخوادم.\nسيتم إصلاحه في لحظة!';

  @override
  String get gatewayReconnectingToast => 'إعادة الاتصال…';

  @override
  String get gatewayConnectedToast => 'متصل';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'فشل البدء: $error';
  }

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'فُقد الاتصال';

  @override
  String get splashViewOnStatusPage => 'عرض على صفحة الحالة';

  @override
  String get splashConnectionIssuesPrompt => 'مشاكل في الاتصال؟';

  @override
  String get splashStatusPageLink => 'صفحة الحالة';

  @override
  String get splashReadIncident => 'قراءة الحادث';

  @override
  String get splashIncidentHistory => 'سجل الحوادث';

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
  String get welcomeBack => 'أهلاً بعودتك';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailInvalid => 'الرجاء إدخال عنوان بريد إلكتروني صالح.';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get logIn => 'تسجيل الدخول';

  @override
  String get logInWithPasskey => 'تسجيل الدخول باستخدام مفتاح المرور';

  @override
  String continueWithSso(String provider) {
    return 'متابعة باستخدام $provider';
  }

  @override
  String get ssoRequired => 'تسجيل الدخول الموحد مطلوب للوصول إلى هذه النسخة.';

  @override
  String get organizationSsoProvider =>
      'قم بتسجيل الدخول باستخدام موفر تسجيل الدخول الموحد الخاص بمؤسستك.';

  @override
  String get failedToStartSso => 'فشل بدء تسجيل الدخول الموحد';

  @override
  String get ssoCancelled => 'تم إلغاء تسجيل الدخول الموحد';

  @override
  String preferSso(String provider) {
    return 'تفضل استخدام تسجيل الدخول الموحد؟ تابع باستخدام $provider.';
  }

  @override
  String get logInViaBrowser => 'تسجيل الدخول عبر المتصفح';

  @override
  String get needAccountPrompt => 'هل تحتاج إلى حساب؟ ';

  @override
  String get register => 'تسجيل';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'تأكد أنك إنسان';

  @override
  String get captchaDescription =>
      'نحتاج للتأكد من أنك لست روبوتًا. الرجاء إكمال التحقق أدناه.';

  @override
  String get captchaSwitchToHcaptcha =>
      'هل تواجه مشاكل؟ جرب hCaptcha بدلاً من ذلك';

  @override
  String get captchaSwitchToTurnstile => 'جرب Turnstile بدلاً من ذلك';

  @override
  String get cancel => 'إلغاء';

  @override
  String get ipAuthCheckEmail => 'تحقق من بريدك الإلكتروني';

  @override
  String ipAuthDescription(String email) {
    return 'لقد أرسلنا رابطًا عبر البريد الإلكتروني لتفويض هذا تسجيل الدخول. الرجاء فتح صندوق الوارد الخاص بك لـ $email.';
  }

  @override
  String get ipAuthConnectionLost => 'فُقد الاتصال';

  @override
  String get ipAuthConnectionLostDescription =>
      'فقدنا الاتصال أثناء انتظار التفويض. الرجاء المحاولة مرة أخرى.';

  @override
  String get ipAuthLinkExpired => 'انتهت صلاحية رابط تسجيل الدخول';

  @override
  String get ipAuthLinkExpiredDescription =>
      'انتهت صلاحية رابط التفويض هذا. الرجاء تسجيل الدخول مرة أخرى.';

  @override
  String get ipAuthResendEmail => 'إعادة إرسال البريد الإلكتروني';

  @override
  String get ipAuthResent => 'تمت إعادة الإرسال';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$secondsث';
  }

  @override
  String get back => 'رجوع';

  @override
  String get mfaTitle => 'المصادقة الثنائية';

  @override
  String get mfaChooseMethod => 'اختر طريقة تحقق';

  @override
  String get mfaMethodTotp => 'تطبيق المصادقة';

  @override
  String get mfaMethodWebauthn => 'مفتاح الأمان / مفتاح المرور';

  @override
  String get mfaTotpDescription =>
      'أدخل الرمز المكون من 6 أرقام من تطبيق المصادقة الخاص بك أو أحد رموز النسخ الاحتياطي الخاصة بك.';

  @override
  String get mfaCodeLabel => 'الرمز';

  @override
  String get mfaTryAnotherMethod => 'جرب طريقة أخرى';

  @override
  String get mfaUseSecurityKey => 'جرب مفتاح الأمان / كلمة المرور بدلاً من ذلك';

  @override
  String get accountSelectorTitle => 'اختر حسابًا';

  @override
  String get accountSelectorDescription =>
      'حدد حسابًا للمتابعة، أو أضف حسابًا آخر.';

  @override
  String get accountAdd => 'إضافة حساب';

  @override
  String get accountRemove => 'إزالة';

  @override
  String accountRemoveTitle(String username) {
    return 'إزالة $username';
  }

  @override
  String get accountRemoveDescription =>
      'سيؤدي هذا إلى إزالة الجلسة المحفوظة لهذا الحساب.';

  @override
  String get accountRemoveOnlyDescription =>
      'سيؤدي هذا إلى إزالة الحساب المحفوظ الوحيد على هذا الجهاز.';

  @override
  String get accountExpired => 'منتهي الصلاحية';

  @override
  String accountSessionExpired(String identifier) {
    return 'انتهت صلاحية الجلسة لـ $identifier. يرجى تسجيل الدخول مرة أخرى.';
  }

  @override
  String get accountManageTitle => 'إدارة الحسابات';

  @override
  String get accountSwitchFailed =>
      'لم نتمكن من تبديل الحسابات. حاول مرة أخرى.';

  @override
  String get profileTabMenuSwitchAccounts => 'تبديل الحسابات';

  @override
  String get statusChangeSheetTitle => 'تعيين الحالة';

  @override
  String get statusOnlineStatusSection => 'حالة الاتصال';

  @override
  String get statusOnline => 'متصل';

  @override
  String get statusIdle => 'غير نشط';

  @override
  String get statusDnd => 'عدم الإزعاج';

  @override
  String get statusInvisible => 'غير مرئي';

  @override
  String get statusOffline => 'غير متصل';

  @override
  String get statusUntilIChangeIt => 'حتى أقوم بتغييرها';

  @override
  String get statusDontClear => 'لا تمسح';

  @override
  String get statusFor10Seconds => 'لمدة 10 ثوانٍ';

  @override
  String get statusClearAfter10Seconds => '10 ثوانٍ';

  @override
  String get statusClearAfter15Minutes => '15 دقيقة';

  @override
  String get statusClearAfter30Minutes => '30 دقيقة';

  @override
  String get statusClearAfter1Hour => 'ساعة واحدة';

  @override
  String get statusClearAfter3Hours => '3 ساعات';

  @override
  String get statusClearAfter4Hours => '4 ساعات';

  @override
  String get statusClearAfter8Hours => '8 ساعات';

  @override
  String get statusClearAfter24Hours => '24 ساعة';

  @override
  String get statusClearAfter3Days => '3 أيام';

  @override
  String get statusDndDescription => 'لن تتلقى إشعارات على سطح المكتب';

  @override
  String get statusInvisibleDescription => 'ستظهر كغير متصل';

  @override
  String get customStatusSetTitle => 'تعيين حالة مخصصة';

  @override
  String get customStatusCurrentHint => 'حالة مخصصة';

  @override
  String get customStatusClear => 'مسح الحالة المخصصة';

  @override
  String get customStatusPlaceholder => 'ماذا يحدث؟';

  @override
  String get customStatusChooseEmoji => 'اختر رمز تعبيري';

  @override
  String get customStatusClearAfter => 'المسح بعد';

  @override
  String get customStatusSave => 'حفظ';

  @override
  String get accountActive => 'الحساب النشط';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get suspendedPermanentTitle => 'تم تعليق الحساب بشكل دائم';

  @override
  String get suspendedTemporaryTitle => 'تم تعليق الحساب';

  @override
  String get suspendedPermanentDescription =>
      'تم تعليق حسابك بشكل دائم لانتهاكه شروط الخدمة الخاصة بنا.';

  @override
  String get suspendedTemporaryDescription =>
      'تم تعليق حسابك مؤقتًا. ستتمكن من الوصول إلى حسابك بمجرد انتهاء فترة التعليق.';

  @override
  String get suspendedIssuedAt => 'صدر في';

  @override
  String get suspendedEndsAt => 'ينتهي في';

  @override
  String get suspendedDuration => 'المدة';

  @override
  String get suspendedPermanent => 'دائم';

  @override
  String get suspendedReason => 'السبب';

  @override
  String get suspendedAppealDeadline => 'موعد استئناف الحظر';

  @override
  String suspendedDeletionWarning(String date) {
    return 'حسابك مجدول للحذف في $date.';
  }

  @override
  String get suspendedRecheck => 'التحقق من التحديثات';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'حاول مرة أخرى بعد $seconds ثوانٍ';
  }

  @override
  String get suspendedBackToLogin => 'العودة إلى تسجيل الدخول';

  @override
  String get suspendedAppealTitle => 'استئناف';

  @override
  String get suspendedAppealHint =>
      'اشرح لماذا يجب إعادة النظر في تعليقك (50 حرفًا على الأقل)...';

  @override
  String get suspendedAppealSubmit => 'تقديم الاستئناف';

  @override
  String get suspendedAppealPending => 'قيد المراجعة';

  @override
  String get suspendedAppealAccepted => 'تم قبول الاستئناف';

  @override
  String get suspendedAppealRejected => 'تم رفض الاستئناف';

  @override
  String get suspendedAppealAcceptedDescription =>
      'تم قبول استئنافك وتمت استعادة حسابك.';

  @override
  String get suspendedSignIn => 'تسجيل الدخول إلى حسابك';

  @override
  String get forgotPasswordTitle => 'هل نسيت كلمة المرور؟';

  @override
  String get forgotPasswordDescription =>
      'أدخل عنوان بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.';

  @override
  String get forgotPasswordSubmit => 'إرسال رابط إعادة التعيين';

  @override
  String get forgotPasswordSentTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String get forgotPasswordSentDescription =>
      'لقد أرسلنا تعليمات إعادة تعيين كلمة المرور إلى عنوان بريدك الإلكتروني. يرجى التحقق من صندوق الوارد الخاص بك واتباع الرابط لإعادة تعيين كلمة المرور الخاصة بك.';

  @override
  String get forgotPasswordBackToLogin => 'العودة إلى تسجيل الدخول';

  @override
  String get resetPasswordTitle => 'تعيين كلمة مرور جديدة';

  @override
  String get resetPasswordDescription =>
      'أدخل كلمة المرور الجديدة أدناه لإكمال عملية إعادة التعيين.';

  @override
  String get resetPasswordNewPassword => 'كلمة المرور الجديدة';

  @override
  String get resetPasswordConfirm => 'تأكيد كلمة المرور الجديدة';

  @override
  String get resetPasswordSubmit => 'إعادة تعيين كلمة المرور';

  @override
  String get resetPasswordMismatch => 'كلمتا المرور غير متطابقتين.';

  @override
  String get registerTitle => 'إنشاء حساب';

  @override
  String get registerDisplayName => 'اسم العرض (اختياري)';

  @override
  String get registerDisplayNameHint => 'بماذا تريد أن يناديك الناس؟';

  @override
  String get registerUsername => 'اسم المستخدم (اختياري)';

  @override
  String get registerUsernameHint =>
      'اتركه فارغًا للحصول على اسم مستخدم عشوائي';

  @override
  String get registerUsernameTagHint =>
      'سيتم إضافة علامة مكونة من 4 أرقام تلقائيًا لضمان التفرد';

  @override
  String get registerDateOfBirth => 'تاريخ الميلاد';

  @override
  String get registerMonth => 'الشهر';

  @override
  String get registerDay => 'اليوم';

  @override
  String get registerYear => 'السنة';

  @override
  String get registerConsent => 'أوافق على شروط الخدمة وسياسة الخصوصية';

  @override
  String get registerConsentPrefix => 'أوافق على ';

  @override
  String get registerConsentTerms => 'شروط الخدمة';

  @override
  String get registerConsentAnd => ' و ';

  @override
  String get registerConsentPrivacy => 'سياسة الخصوصية';

  @override
  String get registerConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get registerSubmit => 'إنشاء حساب';

  @override
  String get registerHaveAccount => 'هل لديك حساب بالفعل؟ ';

  @override
  String get passkeyNoCredentials =>
      'لم يتم العثور على مفاتيح مرور لهذا التطبيق. قم بتسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور بدلاً من ذلك.';

  @override
  String get passkeyDeviceNotSupported =>
      'مفاتيح المرور غير مدعومة على هذا الجهاز.';

  @override
  String get passkeyDomainNotAssociated =>
      'لم يتم تكوين مفاتيح المرور لهذا التطبيق. قم بتسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور بدلاً من ذلك.';

  @override
  String get passkeyTimeout =>
      'انتهت مهلة مصادقة مفتاح المرور. يرجى المحاولة مرة أخرى.';

  @override
  String get passkeyNotAvailable =>
      'مفاتيح المرور غير متاحة لهذا التطبيق. قم بتسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور بدلاً من ذلك.';

  @override
  String get passkeyFailed =>
      'فشل المصادقة باستخدام المفتاح السري. يرجى المحاولة مرة أخرى.';

  @override
  String get errorUnableToCreateAccount =>
      'تعذر إنشاء الحساب. يرجى المحاولة مرة أخرى.';

  @override
  String get errorUnableToSignIn =>
      'تعذر تسجيل الدخول الآن. يرجى المحاولة مرة أخرى.';

  @override
  String get errorInvalidEmailOrPassword =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

  @override
  String get errorUnableToSendResetLink =>
      'تعذر إرسال رابط إعادة التعيين. يرجى المحاولة مرة أخرى.';

  @override
  String get errorUnableToResetPassword =>
      'تعذر إعادة تعيين كلمة المرور. يرجى المحاولة مرة أخرى.';

  @override
  String get embedInviteJoin => 'انضم إلى المجتمع';

  @override
  String get embedInviteGoTo => 'انتقل إلى المجتمع';

  @override
  String embedInviteOnline(String count) {
    return '$count متصل';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count عضو';
  }

  @override
  String get embedInviteUnknownTitle => 'دعوة غير معروفة';

  @override
  String get embedInviteUnknownSubtitle => 'حاول طلب دعوة جديدة.';

  @override
  String get embedInviteUnavailable => 'الدعوة غير متاحة';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => 'لقد تمت دعوتك للانضمام';

  @override
  String get inviteAcceptJoinButton => 'انضم إلى المجتمع';

  @override
  String get inviteAcceptGoToButton => 'انتقل إلى المجتمع';

  @override
  String get inviteAcceptInvitesPaused => 'تم إيقاف الدعوات مؤقتًا';

  @override
  String get inviteAcceptNotFoundTitle => 'الدعوة غير صالحة';

  @override
  String get inviteAcceptNotFoundDescription =>
      'قد تكون هذه الدعوة منتهية الصلاحية أو غير صالحة.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'انضم إلى المجموعة';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'لقد تمت دعوتك للانضمام إلى محادثة جماعية خاصة بواسطة $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'شخص ما';

  @override
  String get inviteAcceptEmojiPack => 'حزمة رموز تعبيرية';

  @override
  String get inviteAcceptStickerPack => 'حزمة ملصقات';

  @override
  String get inviteAcceptInstallEmojiPack => 'تثبيت حزمة الرموز التعبيرية';

  @override
  String get inviteAcceptInstallStickerPack => 'تثبيت حزمة الملصقات';

  @override
  String get inviteAcceptPackInstallNote =>
      'قبول هذه الدعوة سيقوم بتثبيت الحزمة تلقائيًا.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'تم رفض الوصول إلى القناة';

  @override
  String get channelAccessDeniedDescription =>
      'ليس لديك حق الوصول إلى القناة التي تم إرسال هذه الرسالة فيها.';

  @override
  String get messageJumpLinkNoAccess => 'لا يوجد وصول';

  @override
  String get okay => 'موافق';

  @override
  String get embedThemeTitle => 'سمة مشتركة';

  @override
  String get embedThemeSubtitle => 'هذا العميل لا يدعم السمات المخصصة.';

  @override
  String get embedThemeUnavailableButton => 'السمات غير متاحة';

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
  String get privacySettings => 'إعدادات الخصوصية';

  @override
  String get privacyDirectMessages => 'الرسائل المباشرة';

  @override
  String get privacyDirectMessagesDescription =>
      'السماح بالرسائل المباشرة من الأعضاء الآخرين في هذا المجتمع';

  @override
  String get privacyBotDirectMessages => 'رسائل الروبوت المباشرة';

  @override
  String get privacyBotDirectMessagesDescription =>
      'السماح للروبوتات من هذا المجتمع بإرسال رسائل مباشرة إليك';

  @override
  String get privacyMutualDmsDisabled =>
      'قام مسؤولو المجتمع بتعطيل تلقي الرسائل المباشرة حصريًا من الأعضاء المتبادلين في هذا المجتمع.';

  @override
  String get communityDebug => 'تصحيح أخطاء المجتمع';

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get notificationSettings => 'إعدادات الإشعارات';

  @override
  String notificationMuteGuild(String guildName) {
    return 'كتم صوت $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'كتم صوت مجتمع يمنع ظهور مؤشرات غير مقروءة وإشعارات ما لم يتم ذكرك';

  @override
  String get notificationCommunitySettings => 'إعدادات إشعارات المجتمع';

  @override
  String get notificationAllMessages => 'جميع الرسائل';

  @override
  String get notificationOnlyMentions => 'الإشارات فقط';

  @override
  String get notificationNothing => 'لا شيء';

  @override
  String get notificationSuppressEveryone => 'كبت إشارات @everyone و @here';

  @override
  String get notificationSuppressRoles => 'كتم جميع إشارات الأدوار';

  @override
  String get notificationMobilePush => 'إشعارات الدفع على الهاتف المحمول';

  @override
  String get notificationOverrides => 'تجاوزات الإشعارات';

  @override
  String get notificationSelectChannel => 'اختر قناة أو فئة';

  @override
  String get notificationOnlyAtMentions => 'الإشارات فقط';

  @override
  String get notificationMuteChannel => 'كتم القناة';

  @override
  String get notificationUnmuteChannel => 'إلغاء كتم القناة';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'لا توجد فئة';

  @override
  String get dmMarkAsRead => 'وضع علامة كمقروء';

  @override
  String get dmMuteConversation => 'كتم المحادثة';

  @override
  String get dmUnmuteConversation => 'إلغاء كتم المحادثة';

  @override
  String get dmPinDm => 'تثبيت المحادثة الخاصة';

  @override
  String get dmUnpinDm => 'إلغاء تثبيت المحادثة الخاصة';

  @override
  String get dmAlwaysShowInSidebar => 'إظهار دائمًا في الشريط الجانبي';

  @override
  String get dmRemoveFromAlwaysShown => 'إزالة من الإظهار الدائم';

  @override
  String get dmCloseDm => 'إغلاق المحادثة الخاصة';

  @override
  String get dmCloseDmConfirmTitle => 'إغلاق المحادثة الخاصة';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'هل أنت متأكد أنك تريد إغلاق محادثتك الخاصة مع $username؟ يمكنك إعادة فتحها لاحقًا.';
  }

  @override
  String get dmCopyChannelId => 'نسخ معرف القناة';

  @override
  String get dmChannelIdCopied => 'تم نسخ معرف القناة';

  @override
  String get dmCopyUserId => 'نسخ معرف المستخدم';

  @override
  String get dmUserIdCopied => 'تم نسخ معرف المستخدم';

  @override
  String get dmViewProfile => 'عرض الملف الشخصي';

  @override
  String get dmVoiceCall => 'بدء مكالمة صوتية';

  @override
  String get incomingVoiceCallTitle => 'مكالمة صوتية واردة';

  @override
  String get incomingVoiceCallAccept => 'قبول';

  @override
  String get incomingVoiceCallDecline => 'رفض';

  @override
  String get incomingVoiceCallLabel => 'مكالمة واردة';

  @override
  String get incomingVoiceCallIgnore => 'تجاهل';

  @override
  String get directVoiceCallNotEligible =>
      'لا يمكن بدء هذه المكالمة الآن. حاول مرة أخرى بعد قليل.';

  @override
  String get voiceJoinCallFailed =>
      'فشل الاتصال بهذه المكالمة. تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'فشل الانضمام إلى هذه المكالمة. تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'فشل تحديث هذه المكالمة على الخادم. تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get dmAddNote => 'إضافة ملاحظة';

  @override
  String get dmEditGroup => 'تعديل المجموعة';

  @override
  String get dmInviteToCommunity => 'دعوة إلى المجتمع';

  @override
  String get dmBlock => 'حظر';

  @override
  String get dmLeaveGroup => 'مغادرة المجموعة';

  @override
  String get dmNoCommunitiesAvailable => 'لا توجد مجتمعات متاحة';

  @override
  String dmGroupMemberCount(int count) {
    return '$count أعضاء';
  }

  @override
  String get dmMuteFor15Min => 'لمدة 15 دقيقة';

  @override
  String get dmMuteFor30Min => 'لمدة 30 دقيقة';

  @override
  String get dmMuteFor1Hour => 'لمدة ساعة واحدة';

  @override
  String get dmMuteFor3Hours => 'لمدة 3 ساعات';

  @override
  String get dmMuteFor4Hours => 'لمدة 4 ساعات';

  @override
  String get dmMuteFor8Hours => 'لمدة 8 ساعات';

  @override
  String get dmMuteFor24Hours => 'لمدة 24 ساعة';

  @override
  String get dmMuteFor3Days => 'لمدة 3 أيام';

  @override
  String get dmMuteForever => 'حتى أعيد تشغيلها';

  @override
  String get dmPinGroupDm => 'تثبيت مجموعة المحادثات الخاصة';

  @override
  String get dmUnpinGroupDm => 'إلغاء تثبيت محادثة جماعية';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'تمييز المحادثة كمفضلة';

  @override
  String get dmUnfavoriteDm => 'إلغاء تمييز المحادثة كمفضلة';

  @override
  String get dmFavoriteGroupDm => 'تمييز المحادثة الجماعية كمفضلة';

  @override
  String get dmUnfavoriteGroupDm => 'إلغاء تمييز المحادثة الجماعية كمفضلة';

  @override
  String get dmChangeFriendNickname => 'تغيير اسم مستعار للصديق';

  @override
  String get dmRemoveFriend => 'إزالة صديق';

  @override
  String get dmAddFriend => 'إضافة صديق';

  @override
  String get dmAcceptFriendRequest => 'قبول طلب صداقة';

  @override
  String get dmIgnoreFriendRequest => 'تجاهل طلب صداقة';

  @override
  String get dmFriendRequestSent => 'تم إرسال طلب الصداقة';

  @override
  String get dmUnblock => 'إلغاء الحظر';

  @override
  String get dmDebugUser => 'تصحيح بيانات المستخدم';

  @override
  String get dmDebugChannel => 'تصحيح بيانات القناة';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'تم تثبيت المحادثة';

  @override
  String get dmUnpinned => 'تم إلغاء تثبيت المحادثة';

  @override
  String get dmMuted => 'تم كتم صوت المحادثة';

  @override
  String get dmUnmuted => 'تم إلغاء كتم صوت المحادثة';

  @override
  String get dmRemoveFriendConfirmTitle => 'إزالة صديق';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'هل أنت متأكد أنك تريد إزالة $username كصديق؟';
  }

  @override
  String get dmBlockConfirmTitle => 'حظر المستخدم';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'هل أنت متأكد أنك تريد حظر $username؟ لن يتمكن من مراسلتك أو إرسال طلبات صداقة إليك.';
  }

  @override
  String get dmFriendRequestSentToast => 'تم إرسال طلب الصداقة';

  @override
  String get dmFriendRequestFailed => 'فشل إرسال طلب الصداقة';

  @override
  String get dmAcceptFriendRequestFailed => 'فشل قبول طلب الصداقة';

  @override
  String get dmRemoveFriendFailed => 'فشل إزالة الصديق';

  @override
  String get dmBlockFailed => 'فشل حظر المستخدم';

  @override
  String get dmUnblockFailed => 'فشل إلغاء حظر المستخدم';

  @override
  String get dmIgnoreFriendRequestFailed => 'فشل تجاهل طلب الصداقة';

  @override
  String get dmAddFriends => 'إضافة أصدقاء';

  @override
  String get addFriendSheetTitle => 'إضافة صديق';

  @override
  String get addFriendUsernameHint => 'اسم المستخدم#0000';

  @override
  String get addFriendUsernameLabel => 'اسم مستخدم الصديق';

  @override
  String get addFriendSendRequest => 'إرسال الطلب';

  @override
  String get addFriendNoUserFound => 'لم يتم العثور على مستخدم بهذا الاسم.';

  @override
  String get addFriendInvalidUsername =>
      'أدخل اسم مستخدم صالح (اسم المستخدم#0000).';

  @override
  String get addFriendOutgoingSuccess => 'تم إرسال طلب الصداقة';

  @override
  String get addFriendClaimTitle => 'طالب بحسابك';

  @override
  String get addFriendClaimDescription => 'طالب بحسابك لإرسال طلبات الصداقة.';

  @override
  String get addFriendVerifyTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String get addFriendVerifyDescription =>
      'تحتاج إلى التحقق من عنوان بريدك الإلكتروني قبل أن تتمكن من إرسال طلبات الصداقة.';

  @override
  String get addFriendVerifyEmail => 'تحقق من البريد الإلكتروني';

  @override
  String addFriendIncomingRequests(int count) {
    return 'طلبات الصداقة الواردة ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'طلبات الصداقة الصادرة ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'طلب صداقة وارد';

  @override
  String get addFriendOutgoingStatus => 'تم إرسال طلب الصداقة';

  @override
  String get addFriendViewProfile => 'عرض الملف الشخصي';

  @override
  String get addFriendAccept => 'قبول';

  @override
  String get addFriendIgnore => 'تجاهل';

  @override
  String get addFriendAcceptTitle => 'قبول طلب الصداقة';

  @override
  String get addFriendIgnoreTitle => 'تجاهل طلب صداقة';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'قبول طلب الصداقة من $userName؟';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'تجاهل طلب الصداقة من $displayName؟';
  }

  @override
  String get addFriendCancelRequest => 'إلغاء الطلب';

  @override
  String get addFriendCancelRequestFailed =>
      'تعذر إلغاء طلب الصداقة. حاول مرة أخرى.';

  @override
  String get addFriendNotAcceptingRequests =>
      'إنهم لا يقبلون طلبات الصداقة حاليًا.';

  @override
  String get addFriendUnblockFirst => 'قم بإلغاء الحظر أولاً لإرسال طلب صداقة.';

  @override
  String get addFriendCannotSendToSelf => 'لا يمكنك إرسال طلب صداقة لنفسك.';

  @override
  String get addFriendAlreadyFriends => 'أنتم أصدقاء بالفعل مع هذا المستخدم.';

  @override
  String get addFriendClaimToSend => 'أكمل التسجيل لإرسال طلبات الصداقة.';

  @override
  String get addFriendSendFailedGeneric =>
      'تعذر إرسال طلب الصداقة. حاول مرة أخرى.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'النظام';

  @override
  String get emojiSearchPlaceholder => 'ابحث عن الإيموجي الذي تحلم به';

  @override
  String get emojiSearchEmpty => 'لا توجد إيموجيات تطابق بحثك';

  @override
  String get emojiAutocompleteDefaultLabel => 'إيموجي افتراضي';

  @override
  String get emojiFrequentlyUsed => 'المستخدم بكثرة';

  @override
  String get emojiTabGifs => 'ملفات GIF';

  @override
  String get emojiTabMedia => 'وسائط';

  @override
  String get emojiTabStickers => 'ملصقات';

  @override
  String get emojiTabEmojis => 'إيموجيات';

  @override
  String get gifPickerSearch => 'ابحث عن ملفات GIF';

  @override
  String get gifPickerSearchKlipy => 'ابحث في KLIPY';

  @override
  String get gifPickerSearchTenor => 'ابحث في Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'المفضلة';

  @override
  String get gifPickerTrending => 'ملفات GIF رائجة';

  @override
  String get gifPickerNoResultsTitle => 'لا توجد نتائج بحث';

  @override
  String get gifPickerNoResultsDescription => 'جرّب مصطلح بحث آخر';

  @override
  String get gifPickerLoadFailedTitle => 'تعذر تحميل صور GIF';

  @override
  String get gifPickerLoadFailedBody => 'تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get emojiCategoryPeople => 'أشخاص';

  @override
  String get emojiCategoryNature => 'طبيعة';

  @override
  String get emojiCategoryFood => 'طعام وشراب';

  @override
  String get emojiCategoryActivity => 'أنشطة';

  @override
  String get emojiCategoryTravel => 'سفر وأماكن';

  @override
  String get emojiCategoryObjects => 'أشياء';

  @override
  String get emojiCategorySymbols => 'رموز';

  @override
  String get emojiCategoryFlags => 'أعلام';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'افتح $emojiCount من أصل $communityCount باستخدام Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'احصل على Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'لا تُظهر هذا مرة أخرى';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رموز تعبيرية مخصصة',
      one: '1 رمز تعبيري مخصص',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مجتمعات',
      one: '1 مجتمع',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'تحذير بشأن رابط خارجي';

  @override
  String get externalLinkWarningLeaving => 'أنت على وشك مغادرة Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'قد تكون الروابط الخارجية خطيرة. يرجى توخي الحذر.';

  @override
  String get externalLinkWarningDestinationUrl => 'عنوان الوجهة:';

  @override
  String get externalLinksSectionTitle => 'الروابط الخارجية';

  @override
  String get externalLinksSectionDescription =>
      'تكوين كيفية التعامل مع تحذيرات الروابط الخارجية.';

  @override
  String get externalLinkWarningTrustPrefix => 'ثق دائمًا بـ ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — تخطي هذا التحذير في المرة القادمة';

  @override
  String get externalLinkVisitSite => 'زيارة الموقع';

  @override
  String get externalLinkTrustAllLabel => 'الوثوق بجميع الروابط الخارجية';

  @override
  String get externalLinkStripTrackingLabel =>
      'إزالة معلمات التتبع من عناوين URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'تتم إزالة معلمات التتبع تلقائيًا (مثل utm_source، fbclid، gclid) من عناوين URL في الرسائل التي ترسلها. يتم تنظيف الرابط قبل أن يصل إلى أي شخص آخر.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'الوثوق بجميع الروابط الخارجية؟';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'سيؤدي هذا إلى الوثوق بجميع الروابط الخارجية وتخطي التحذير لكل نطاق. سيتم استبدال نطاقاتك الموثوقة الحالية. هذا أقل أمانًا.';

  @override
  String get externalLinkTrustAllConfirmAction => 'الوثوق بالجميع';

  @override
  String get externalLinkStopTrustingAllTitle => 'إيقاف الوثوق بجميع الروابط؟';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'سيتم عرض تحذيرات الروابط الخارجية مرة أخرى. ستحتاج إلى إضافة نطاقات موثوقة بشكل فردي.';

  @override
  String get externalLinkStopTrustingAllAction => 'تعطيل الوثوق بالجميع';

  @override
  String get externalLinkTrustedAllDescription =>
      'تم الوثوق بجميع الروابط الخارجية. لن يتم عرض التحذيرات.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'لديك $count نطاق موثوق به. أضف المزيد عن طريق تحديد المربع عند زيارة الروابط الخارجية.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'عند تمكين هذا الخيار، لن يتم عرض أي تحذيرات للروابط الخارجية. هذا أقل أمانًا.';

  @override
  String get imageFileTooLarge =>
      'ملف الصورة كبير جدًا. يرجى اختيار ملف أصغر من 10 ميجابايت.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'الصور الرمزية المتحركة تتطلب Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'اللافتات المتحركة تتطلب Plutonium';

  @override
  String get animatedAvifNotSupported => 'ملفات AVIF المتحركة غير مدعومة';

  @override
  String get animatedAvifNotSupportedBody =>
      'قص وتدوير ملفات AVIF المتحركة غير مدعوم بعد. إذا تابعت، فسيتم تحميلها في شكلها الأصلي.';

  @override
  String get uploadAsIs => 'تحميل كما هو';

  @override
  String get croppingAnimatedNotSupported =>
      'قص الصور المتحركة غير مدعوم بعد. سيتم استخدام التحميل الأصلي.';

  @override
  String get cropAvatar => 'قص الصورة الرمزية';

  @override
  String get cropBanner => 'قص اللافتة';

  @override
  String get skip => 'تخطي';

  @override
  String get crop => 'قص';

  @override
  String get changeYourFluxerTag => 'تغيير اسم المستخدم الخاص بك';

  @override
  String get fluxerTagInputLabel => 'اسم المستخدم';

  @override
  String get fluxerTagDescriptionBase =>
      'يمكن أن تحتوي أسماء المستخدمين على الأحرف (a-z، A-Z) والأرقام (0-9) والشرطات السفلية فقط. أسماء المستخدمين غير حساسة لحالة الأحرف.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'يمكن أن تحتوي أسماء المستخدمين على الأحرف (a-z، A-Z) والأرقام (0-9) والشرطات السفلية فقط. أسماء المستخدمين غير حساسة لحالة الأحرف. يمكنك اختيار أي علامة مكونة من 4 أرقام متاحة من #0000 إلى #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'يمكن أن تحتوي أسماء المستخدمين على الأحرف (a-z، A-Z) والأرقام (0-9) والشرطات السفلية فقط. أسماء المستخدمين غير حساسة لحالة الأحرف. يمكنك اختيار أي علامة مكونة من 4 أرقام متاحة من #0001 إلى #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'بين $min و $max حرفًا';
  }

  @override
  String get validationAllowedChars =>
      'الأحرف (a-z، A-Z) والأرقام (0-9) والشرطات السفلية (_) فقط';

  @override
  String get discriminatorPremiumTooltip =>
      'احصل على Plutonium لتخصيص علامتك أو الاحتفاظ بها عند تغيير اسم المستخدم الخاص بك';

  @override
  String get fluxerTagAlreadyTaken => 'اسم المستخدم مأخوذ بالفعل';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'علامة اسم المستخدم $username#$discriminator مأخوذة بالفعل. المتابعة ستعيد تعيين رقمك المميز تلقائيًا.';
  }

  @override
  String get customTagIsTemporary => 'العلامة المخصصة مؤقتة';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'علامتك المكونة من 4 أرقام متاحة فقط طالما أن اشتراك Plutonium الخاص بك نشط. عند انتهاء صلاحية اشتراكك في $date، ستعود علامتك إلى رقم عشوائي بعد فترة سماح مدتها 3 أيام.';
  }

  @override
  String get customTagTemporaryBody =>
      'علامتك المكونة من 4 أرقام متاحة فقط طالما أن اشتراك Plutonium الخاص بك نشط. عند انتهاء صلاحية اشتراكك، ستعود علامتك إلى رقم عشوائي بعد فترة سماح مدتها 3 أيام.';

  @override
  String get iUnderstandContinue => 'أتفهم، متابعة';

  @override
  String get premiumWarningPendingDiscriminator =>
      'إذا قمت بحفظ علامة اسم المستخدم هذه، فستعود علامتك المكونة من 4 أرقام إلى رقم عشوائي عند انتهاء اشتراك Plutonium الخاص بك. إذا فشل اشتراكك في التجديد، فستحصل على فترة سماح مدتها 3 أيام قبل تغيير العلامة.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'علامتك المكونة من 4 أرقام (#$discriminator) نشطة طالما أن اشتراك Plutonium الخاص بك نشط. إذا انتهى اشتراكك أو فشل في التجديد بعد فترة سماح مدتها 3 أيام، فستعود علامتك إلى رقم عشوائي.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'خصص علامتك المكونة من 4 أرقام أو احتفظ بها عند تغيير اسم المستخدم الخاص بك';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'تنتهي فترة تجريبية لـ Plutonium الخاصة بك في $date. قم بالترقية للاحتفاظ بعلامتك المخصصة واكسب شارة على ملفك الشخصي.';
  }

  @override
  String get premiumTrialActive =>
      'أنت في فترة تجريبية لـ Plutonium. قم بالترقية للاحتفاظ بعلامتك المخصصة واكسب شارة على ملفك الشخصي.';

  @override
  String get fluxerTagUpdated => 'تم تحديث اسم المستخدم';

  @override
  String get fluxerTagUpdateFailed =>
      'فشل تحديث اسم المستخدم. يرجى المحاولة مرة أخرى.';

  @override
  String get continueAction => 'متابعة';

  @override
  String get profileCustomizationTitle => 'تخصيص الملف الشخصي';

  @override
  String get profileCustomizationDescription =>
      'قم بتحرير مظهر ملفك الشخصي وشاهد معاينة مباشرة';

  @override
  String get usernameLabel => 'اسم المستخدم';

  @override
  String get claimAccountToChangeFluxerTag =>
      'طالب بحسابك لتغيير اسم المستخدم الخاص بك';

  @override
  String get changeFluxerTag => 'تغيير اسم المستخدم';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'خصص علامة اسم المستخدم المكونة من 4 أرقام ($discriminator) كما تريد باستخدام Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'تغيير اسم المستخدم وعلامة اسم المستخدم المكونة من 4 أرقام';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'علامة اسم المستخدم المخصصة الخاصة بك ($discriminator) مرتبطة باشتراك Plutonium الخاص بك وستعود إلى علامة عشوائية إذا انتهت صلاحيتها.';
  }

  @override
  String get displayNameLabel => 'اسم العرض';

  @override
  String get pronounsLabel => 'الضمائر';

  @override
  String get avatarLabel => 'الصورة الرمزية';

  @override
  String get changeAvatar => 'تغيير الصورة الرمزية';

  @override
  String get removeAvatar => 'إزالة الصورة الرمزية';

  @override
  String get avatarDescription =>
      'PNG، JPEG، WebP، GIF. بحد أقصى 10 ميجابايت. موصى به: 512×512 بكسل';

  @override
  String get bannerLabel => 'الشعار';

  @override
  String get changeBanner => 'تغيير الشعار';

  @override
  String get removeBanner => 'إزالة الشعار';

  @override
  String get bannerDescription =>
      'PNG، JPEG، WebP، GIF. بحد أقصى 10 ميجابايت. الحد الأدنى: 960×540 بكسل (16:9)';

  @override
  String get accentColorLabel => 'لون التمييز';

  @override
  String get accentColorDescription =>
      'يخصص لون الحدود والشعار على ملفك الشخصي';

  @override
  String get aboutMeLabel => 'نبذة عني';

  @override
  String get aboutMeHelperText =>
      'يمكنك استخدام الروابط والرموز التعبيرية و Markdown.';

  @override
  String get emojiPickerTitle => 'رموز تعبيرية';

  @override
  String get plutoniumBadgePrivacyTitle => 'خصوصية شارة Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'تحكم في كيفية عرض شارة Plutonium الخاصة بك للآخرين';

  @override
  String get hidePlutoniumBadgeLabel => 'إخفاء شارة Plutonium بالكامل';

  @override
  String get hidePlutoniumBadgeDescription =>
      'إخفاء شارة Plutonium الخاصة بك تمامًا عن المستخدمين الآخرين';

  @override
  String get hidePlutoniumPurchaseDate => 'إخفاء تاريخ شراء Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'إخفاء تاريخ شراء Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'إزالة تاريخ شراء Plutonium من شارتك';

  @override
  String get maskVisionaryAsSubscription => 'إخفاء Visionary كاشتراك';

  @override
  String get maskVisionaryDescription =>
      'عرض Visionary الخاص بك كاشتراك عادي بدلاً من ذلك';

  @override
  String get hideVisionaryIdBadge => 'إخفاء شارة معرف Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'إخفاء شارة معرف Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'إزالة شارة معرف Visionary الخاصة بك';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'أنت في فترة تجريبية لـ Plutonium — يبدأ اشتراكك في $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'سيبدأ اشتراكك تلقائيًا عند انتهاء الفترة التجريبية. لا يلزم اتخاذ أي إجراء.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'أنت في فترة تجريبية لـ Plutonium تنتهي في $date';
  }

  @override
  String get premiumTrialActiveProfile => 'أنت في فترة تجريبية لـ Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG، PNG، WebP. بحد أقصى 10 ميجابايت. موصى به: 512×512 بكسل. تتطلب الصور الرمزية المتحركة (GIF) Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'خصص ملفك الشخصي بشعار ثابت أو متحرك لجعله مميزًا.';

  @override
  String get getPlutonium => 'احصل على Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'عمليات الشراء داخل التطبيق غير متاحة على هذه المنصة بعد. ترقبوا — قريبًا!';

  @override
  String get profilePreviewLabel => 'معاينة';

  @override
  String get profilePreviewMessage => 'رسالة';

  @override
  String get profilePreviewMemberSince => 'عضو في Fluxer منذ';

  @override
  String get unclaimedAccountTitle => 'حساب غير مطالب به';

  @override
  String get unclaimedAccountDescription =>
      'لم يتم المطالبة بحسابك بعد. بدون بريد إلكتروني وكلمة مرور، قد تفقد الوصول. طالب بحسابك الآن لتأمينه.';

  @override
  String get claimAccount => 'المطالبة بالحساب';

  @override
  String get profileTypeLabel => 'نوع الملف الشخصي';

  @override
  String get profileTypeGlobal => 'ملف شخصي عام';

  @override
  String get profileTypeGuildDescription =>
      'أنت تقوم بتحرير ملفك الشخصي الخاص بكل مجتمع. سيكون هذا الملف الشخصي مرئيًا فقط في هذا المجتمع وسيتجاوز ملفك الشخصي العام.';

  @override
  String get communityNicknameLabel => 'اسم مستعار للمجتمع';

  @override
  String get perGuildPremiumUpsellText =>
      'يتطلب تخصيص صورتك الرمزية، وصورة الغلاف، ولون التمييز، والسيرة الذاتية لمجتمعات معينة Plutonium. أسماء المجتمعات المستعارة والضمائر مجانية للجميع.';

  @override
  String get avatarModeInherit => 'استخدام الملف الشخصي العام';

  @override
  String get avatarModeCustom => 'استخدام صورة مخصصة';

  @override
  String get avatarModeUnset => 'عدم الإظهار';

  @override
  String get profileSavedToast => 'تم تحديث الملف الشخصي';

  @override
  String get profileEditButton => 'تعديل الملف الشخصي';

  @override
  String get profileNoteLabel => 'ملاحظة';

  @override
  String get profileNoteVisibility => '(مرئي لك فقط)';

  @override
  String get profileNoteEmpty => 'لا توجد ملاحظة بعد.';

  @override
  String get sudoTitle => 'تحقق من هويتك';

  @override
  String get sudoDescription => 'يتطلب هذا الإجراء التحقق للمتابعة.';

  @override
  String get sudoAuthenticatorCode => 'رمز المصادقة';

  @override
  String get sudoMethodPassword => 'كلمة المرور';

  @override
  String get sudoMethodTotp => 'المصادقة';

  @override
  String get sudoVerificationFailed => 'فشل التحقق. يرجى المحاولة مرة أخرى.';

  @override
  String get securityAccountTitle => 'الحساب';

  @override
  String get securityAccountDescription =>
      'إدارة بريدك الإلكتروني وكلمة المرور وإعدادات حسابك';

  @override
  String get securitySectionTitle => 'الأمان';

  @override
  String get securitySectionDescription =>
      'احمِ حسابك بالمصادقة الثنائية ومفاتيح المرور';

  @override
  String get securityLoginEmailSectionTitle => 'إعدادات البريد الإلكتروني';

  @override
  String get securityLoginEmailSectionDescription =>
      'إدارة عنوان البريد الإلكتروني الذي تستخدمه لتسجيل الدخول إلى Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'عنوان البريد الإلكتروني';

  @override
  String get securityLoginNoEmailSet => 'لم يتم تعيين عنوان بريد إلكتروني';

  @override
  String get securityLoginChangeEmail => 'تغيير البريد الإلكتروني';

  @override
  String get securityLoginAddEmail => 'إضافة بريد إلكتروني';

  @override
  String get securityLoginReveal => 'إظهار';

  @override
  String get securityLoginHide => 'إخفاء';

  @override
  String get securityLoginPasswordSectionTitle => 'كلمة المرور';

  @override
  String get securityLoginPasswordSectionDescription =>
      'غيّر كلمة المرور الخاصة بك للحفاظ على أمان حسابك';

  @override
  String get securityLoginCurrentPasswordLabel => 'كلمة المرور الحالية';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'آخر تغيير: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'آخر تغيير: لم يتم التغيير قط';

  @override
  String get securityLoginNoPasswordSet => 'لم يتم تعيين كلمة مرور';

  @override
  String get securityLoginChangePassword => 'تغيير كلمة المرور';

  @override
  String get securityLoginSetPassword => 'تعيين كلمة المرور';

  @override
  String get passwordChangeTitle => 'تغيير كلمة المرور';

  @override
  String get passwordChangeIntroDescription =>
      'سنرسل رمز تحقق إلى عنوان بريدك الإلكتروني لتأكيد هويتك قبل تغيير كلمة المرور.';

  @override
  String get passwordChangeStart => 'ابدأ';

  @override
  String get passwordChangeVerifyTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String get passwordChangeVerifyDescription =>
      'أدخل رمز التحقق المرسل إلى عنوان بريدك الإلكتروني.';

  @override
  String get passwordChangeVerificationCode => 'رمز التحقق';

  @override
  String get passwordChangeVerify => 'تحقق';

  @override
  String get passwordChangeNewPasswordTitle => 'تعيين كلمة مرور جديدة';

  @override
  String get passwordChangeNewPasswordDescription =>
      'أدخل كلمة المرور الجديدة أدناه.';

  @override
  String get passwordChangeNewPassword => 'كلمة المرور الجديدة';

  @override
  String get passwordChangeConfirmPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get passwordChangeSubmit => 'تغيير كلمة المرور';

  @override
  String get passwordChangeSuccess => 'تم تغيير كلمة المرور';

  @override
  String get passwordChangePasswordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get passwordChangeInvalidCode => 'رمز غير صالح أو منتهي الصلاحية';

  @override
  String get emailChangeTitle => 'تغيير البريد الإلكتروني';

  @override
  String get emailChangeIntroDescription =>
      'سنرسل رموز تحقق للتحقق من هويتك قبل تغيير عنوان بريدك الإلكتروني.';

  @override
  String get emailChangeStart => 'ابدأ';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'التحقق من البريد الإلكتروني الحالي';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'أدخل رمز التحقق المرسل إلى عنوان بريدك الإلكتروني الحالي.';

  @override
  String get emailChangeNewEmailTitle => 'أدخل البريد الإلكتروني الجديد';

  @override
  String get emailChangeNewEmailDescription =>
      'أدخل عنوان البريد الإلكتروني الجديد الذي ترغب في استخدامه.';

  @override
  String get emailChangeNewEmailLabel => 'بريد إلكتروني جديد';

  @override
  String get emailChangeNewEmailSubmit => 'إرسال رمز التحقق';

  @override
  String get emailChangeVerifyNewTitle => 'التحقق من البريد الإلكتروني الجديد';

  @override
  String get emailChangeVerifyNewDescription =>
      'أدخل رمز التحقق المرسل إلى عنوان بريدك الإلكتروني الجديد.';

  @override
  String get emailChangeSuccess => 'تم تغيير البريد الإلكتروني';

  @override
  String get emailChangeInvalidCode => 'رمز غير صالح أو منتهي الصلاحية';

  @override
  String get resend => 'إعادة الإرسال';

  @override
  String resendCountdown(int seconds) {
    return 'إعادة الإرسال ($seconds ثانية)';
  }

  @override
  String get verificationCode => 'رمز التحقق';

  @override
  String get verify => 'تحقق';

  @override
  String get enable => 'تمكين';

  @override
  String get disable => 'تعطيل';

  @override
  String get delete => 'حذف';

  @override
  String get save => 'حفظ';

  @override
  String get securityTfaSectionTitle => 'المصادقة الثنائية';

  @override
  String get securityTfaSectionDescription =>
      'أضف طبقة إضافية من الأمان إلى حسابك';

  @override
  String get securityTfaAuthenticatorApp => 'تطبيق المصادقة';

  @override
  String get securityTfaAuthenticatorEnabled => 'تم تمكين المصادقة الثنائية';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'استخدم تطبيق مصادقة لإنشاء رموز للمصادقة الثنائية';

  @override
  String get securityTfaBackupCodes => 'رموز النسخ الاحتياطي';

  @override
  String get securityTfaBackupCodesDescription =>
      'عرض وإدارة رموز النسخ الاحتياطي لاستعادة الحساب';

  @override
  String get securityTfaViewCodes => 'عرض الرموز';

  @override
  String get securityPasskeysSectionTitle => 'المفاتيح المرجعية';

  @override
  String get securityPasskeysSectionDescription =>
      'استخدم المفاتيح المرجعية لتسجيل الدخول بدون كلمة مرور والمصادقة الثنائية';

  @override
  String get securityPasskeysRegistered => 'المفاتيح المرجعية المسجلة';

  @override
  String get securityPasskeysNone => 'لم يتم تسجيل أي مفاتيح مرجعية';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'مفاتيح مرجعية',
      one: 'مفتاح مرجعي',
    );
    return '$count $_temp0 مسجل (بحد أقصى 10)';
  }

  @override
  String get securityPasskeysAdd => 'إضافة مفتاح مرجعي';

  @override
  String securityPasskeysAdded(String date) {
    return 'تمت الإضافة: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'آخر استخدام: $date';
  }

  @override
  String get securityPasskeysRename => 'إعادة تسمية';

  @override
  String get securityPasskeysDeleteTitle => 'حذف المفتاح المرجعي';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'هل أنت متأكد أنك تريد حذف المفتاح المرجعي \"$name\"؟';
  }

  @override
  String get securityPasskeyNameTitle => 'تسمية المفتاح المرجعي';

  @override
  String get securityPasskeyNameLabel => 'اسم المفتاح المرجعي';

  @override
  String get securityPasskeyNameHint => 'مثل: YubiKey، iPhone، كمبيوتر العمل';

  @override
  String get securityPhoneSectionTitle => 'رقم الهاتف';

  @override
  String get securityPhoneSectionDescription => 'إدارة رقم هاتفك.';

  @override
  String get securityPhoneLabel => 'رقم الهاتف';

  @override
  String get securityPhoneNone => 'لم يتم إضافة رقم هاتف.';

  @override
  String get securityPhoneAdd => 'إضافة هاتف';

  @override
  String get securityPhoneRemove => 'إزالة';

  @override
  String get securityPhoneRemoveTitle => 'إزالة رقم الهاتف';

  @override
  String get securityPhoneRemoveDescription =>
      'هل أنت متأكد أنك تريد إزالة رقم هاتفك؟';

  @override
  String get securityPhoneRemoved => 'تمت إزالة رقم الهاتف';

  @override
  String get securityClaimTitle => 'ميزات الأمان';

  @override
  String get securityClaimDescription =>
      'طالب بحسابك للوصول إلى ميزات الأمان مثل المصادقة الثنائية والمفاتيح السرية.';

  @override
  String get securityVerifyEmailRequired =>
      'يجب عليك التحقق من عنوان بريدك الإلكتروني قبل إعداد المصادقة الثنائية أو المفاتيح السرية أو التحقق عبر الرسائل القصيرة.';

  @override
  String get totpEnableTitle => 'إعداد تطبيق المصادقة';

  @override
  String get totpEnableDescription =>
      'امسح رمز الاستجابة السريعة ضوئيًا باستخدام تطبيق المصادقة الخاص بك لإنشاء رموز للمصادقة الثنائية.';

  @override
  String get totpEnableCodeLabel => 'الرمز';

  @override
  String get totpEnableCodeHint =>
      'أدخل الرمز المكون من 6 أرقام من تطبيق المصادقة الخاص بك';

  @override
  String get totpEnableSuccess => 'تم تمكين المصادقة الثنائية';

  @override
  String get totpDisableTitle => 'إزالة تطبيق المصادقة';

  @override
  String get totpDisableDescription =>
      'أدخل الرمز المكون من 6 أرقام من تطبيق المصادقة الخاص بك لتعطيل المصادقة الثنائية.';

  @override
  String get totpDisableSuccess => 'تم تعطيل المصادقة الثنائية';

  @override
  String get backupCodesTitle => 'رموز النسخ الاحتياطي';

  @override
  String get backupCodesWarning =>
      'إذا فقدت الوصول إلى تطبيق المصادقة الخاص بك ولم يكن لديك هذه الرموز، فسيتم قفل حسابك بشكل دائم. قم بتنزيلها أو نسخها الآن وقم بتخزينها في مكان آمن.';

  @override
  String get backupCodesDownload => 'تنزيل';

  @override
  String get backupCodesCopy => 'نسخ';

  @override
  String get backupCodesCopied => 'تم نسخ رموز النسخ الاحتياطي إلى الحافظة';

  @override
  String get backupCodesAcknowledge =>
      'لقد قمت بتنزيل أو نسخ رموز النسخ الاحتياطي الخاصة بي وتخزينها في مكان آمن.';

  @override
  String get backupCodesDone => 'تم';

  @override
  String get backupCodesViewTitle => 'عرض رموز النسخ الاحتياطي';

  @override
  String get backupCodesViewDescription =>
      'قد يكون التحقق مطلوبًا قبل عرض رموز النسخ الاحتياطي الخاصة بك.';

  @override
  String get phoneAddTitle => 'إضافة رقم هاتف';

  @override
  String get phoneAddLabel => 'رقم الهاتف';

  @override
  String get phoneAddHint => 'أدخل رقم هاتفك';

  @override
  String get phoneAddFooter =>
      'أدخل رقم هاتفك. سنرسل لك رمز تحقق عبر الرسائل القصيرة.';

  @override
  String get phoneAddSendCode => 'إرسال الرمز';

  @override
  String get phoneVerifyTitle => 'التحقق من رقم الهاتف';

  @override
  String get phoneVerifyDescription => 'أدخل رمز التحقق المرسل إلى رقم هاتفك.';

  @override
  String get phoneAddSuccess => 'تمت إضافة رقم الهاتف';

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
  String get dangerZoneSectionTitle => 'منطقة الخطر';

  @override
  String get dangerZoneSectionDescription => 'إجراءات لا رجعة فيها ومدمرة';

  @override
  String get dangerZoneDisableTitle => 'تعطيل الحساب';

  @override
  String get dangerZoneDisableDescription =>
      'قم بتعطيل حسابك مؤقتًا. يمكنك إعادة تنشيطه لاحقًا عن طريق تسجيل الدخول مرة أخرى.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'سيؤدي تعطيل حسابك إلى تسجيل خروجك من جميع الجلسات. يمكنك إعادة تمكين حسابك في أي وقت عن طريق تسجيل الدخول مرة أخرى.';

  @override
  String get dangerZoneDeleteTitle => 'حذف الحساب';

  @override
  String get dangerZoneDeleteDescription =>
      'حذف حسابك وجميع البيانات المرتبطة به بشكل دائم. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'قم بإلغاء اشتراك Plutonium النشط الخاص بك في إعدادات Plutonium قبل حذف حسابك.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'لا يمكن حذف الحساب';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'لا يمكنك حذف حسابك أثناء امتلاكك للمجتمعات. قم بتحويل ملكية المجتمعات التالية أولاً:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'و $count أخرى';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'لتحويل الملكية، انتقل إلى $settingsPath واستخدم خيار تحويل الملكية.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'هل أنت متأكد أنك تريد حذف حسابك؟ سيؤدي هذا الإجراء إلى جدولة حسابك للحذف الدائم.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'يمكنك إلغاء عملية الحذف في غضون 14 يومًا';

  @override
  String get dangerZoneDeleteBullet2 =>
      'بعد 14 يومًا، سيتم حذف حسابك بشكل دائم';

  @override
  String get dangerZoneDeleteBullet3 =>
      'بمجرد معالجة الحذف، لا يمكنك استعادة الوصول إلى حسابك';

  @override
  String get dangerZoneDeleteBullet4 =>
      'لن تتمكن من حذف رسائلك المرسلة بعد حذف حسابك';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'إذا كنت ترغب في تصدير بياناتك أو حذف رسائلك أولاً، فيرجى زيارة قسم لوحة تحكم الخصوصية في إعدادات المستخدم قبل المتابعة.';

  @override
  String get claimAccountTitle => 'استعادة حسابك';

  @override
  String get claimAccountDescription =>
      'استعد حسابك بإضافة بريد إلكتروني وكلمة مرور. سنرسل رمز تحقق لتأكيد بريدك الإلكتروني قبل الانتهاء.';

  @override
  String get claimAccountEmailLabel => 'البريد الإلكتروني';

  @override
  String get claimAccountPasswordLabel => 'كلمة المرور';

  @override
  String get claimAccountSendCode => 'إرسال الرمز';

  @override
  String get claimAccountVerifyDescription =>
      'أدخل الرمز الذي أرسلناه إلى بريدك الإلكتروني للتحقق منه. سيتم تعيين كلمة المرور الخاصة بك بمجرد تأكيد الرمز.';

  @override
  String get claimAccountSuccess => 'تم استعادة الحساب بنجاح';

  @override
  String get importantInformation => 'معلومات هامة:';

  @override
  String get genericError => 'حدث خطأ';

  @override
  String get invalidCode => 'رمز غير صالح';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count عامًا',
      one: 'قبل عام واحد',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count شهرًا',
      one: 'قبل شهر واحد',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count يومًا',
      one: 'قبل يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count ساعة',
      one: 'قبل ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count دقيقة',
      one: 'قبل دقيقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'الآن';

  @override
  String get authorizedAppsTitle => 'التطبيقات المصرح بها';

  @override
  String get authorizedAppsDescription =>
      'تم منح هذه التطبيقات حق الوصول إلى حساب Fluxer الخاص بك.';

  @override
  String get authorizedAppsEmptyTitle => 'لا توجد تطبيقات مصرح بها';

  @override
  String get authorizedAppsEmptyDescription =>
      'لم تقم بتفويض أي تطبيقات للوصول إلى حسابك.';

  @override
  String get authorizedAppsLoadError => 'فشل تحميل التطبيقات المصرح بها';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'تم التفويض في $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'الأذونات الممنوحة';

  @override
  String get authorizedAppsRevoke => 'إلغاء';

  @override
  String get authorizedAppsRevokeTitle => 'إلغاء وصول التطبيق';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'هل أنت متأكد أنك تريد إلغاء الوصول لـ $appName؟ لن يتمكن هذا التطبيق من الوصول إلى حسابك بعد الآن.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'الوصول إلى معلومات ملفك الشخصي الأساسية (اسم المستخدم، الصورة الرمزية، إلخ)';

  @override
  String get authorizedAppsScopeEmail => 'عرض عنوان بريدك الإلكتروني';

  @override
  String get authorizedAppsScopeGuilds => 'عرض المجتمعات التي تنتمي إليها';

  @override
  String get authorizedAppsScopeConnections => 'عرض الحسابات المتصلة الخاصة بك';

  @override
  String get authorizedAppsScopeBot =>
      'إضافة روبوت إلى مجتمع بالأذونات المطلوبة';

  @override
  String get authorizedAppsScopeAdmin => 'الوصول إلى نقاط النهاية الإدارية';

  @override
  String get privacyPendingDeletionTitle => 'قيد الحذف';

  @override
  String get blockedUsersTitle => 'المستخدمون المحظورون';

  @override
  String get blockedUsersDescription =>
      'لا يمكن للمستخدمين المحظورين إرسال طلبات صداقة إليك أو مراسلتك مباشرة.';

  @override
  String get blockedUsersEmptyTitle => 'لا يوجد مستخدمون محظورون';

  @override
  String get blockedUsersEmptyDescription => 'لم تقم بحظر أي شخص بعد.';

  @override
  String get blockedUsersLoadError => 'فشل تحميل المستخدمين المحظورين';

  @override
  String get blockedUsersUnblock => 'إلغاء الحظر';

  @override
  String get blockedUsersUnblockTitle => 'إلغاء حظر المستخدم';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'هل أنت متأكد أنك تريد إلغاء حظر $username؟';
  }

  @override
  String get blockedUsersCopyTag => 'نسخ اسم المستخدم';

  @override
  String get blockedUsersCopyId => 'نسخ معرف المستخدم';

  @override
  String get userProfileLoadError => 'تعذر تحميل الملف الشخصي';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'إعادة المحاولة';

  @override
  String get userProfileMessage => 'رسالة';

  @override
  String get userProfileVoiceCall => 'مكالمة صوتية';

  @override
  String get userProfileVideoCall => 'مكالمة فيديو';

  @override
  String get userProfileEditProfile => 'تعديل الملف الشخصي';

  @override
  String get userProfileStaffBadgeTooltip => 'فريق Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'فريق مجتمع Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'شريك Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'صائد أخطاء Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'مشترك Fluxer Plutonium منذ $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Visionary منذ $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'معرّف Visionary #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'الأصدقاء المشتركون ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'المجتمعات المشتركة ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'الأصدقاء المشتركون';

  @override
  String get userProfileMutualCommunitiesTitle => 'المجتمعات المشتركة';

  @override
  String get userProfileNoMutualFriends => 'لم يتم العثور على أصدقاء مشتركين.';

  @override
  String get userProfileNoMutualCommunities =>
      'لم يتم العثور على مجتمعات مشتركة.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'الاسم المستعار: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'فتح رسالة مباشرة';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'لقد قمت بحظر $username. لن تتمكن من إرسال رسائل ما لم تقم بإلغاء الحظر.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'إلغاء الحظر';

  @override
  String get userProfileOpenDm => 'فتح رسالة مباشرة';

  @override
  String get userProfileNoteTitle => 'ملاحظة';

  @override
  String get userProfileNoteVisibility => '(مرئية لك فقط)';

  @override
  String get userProfileNoteSave => 'حفظ';

  @override
  String get userProfileNoteDelete => 'حذف';

  @override
  String get userProfileNoteEmpty => 'انقر لإضافة ملاحظة';

  @override
  String get userProfileMemberSince => 'عضو منذ';

  @override
  String get userProfileAboutMe => 'نبذة عني';

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
  String get userProfileCopyUsername => 'نسخ اسم المستخدم';

  @override
  String get userProfileCopyUserId => 'نسخ معرّف المستخدم';

  @override
  String get userProfileViewMainProfile => 'عرض الملف الشخصي الرئيسي';

  @override
  String get userProfileViewCommunityProfile => 'عرض الملف الشخصي للمجتمع';

  @override
  String get userProfileBlockUser => 'حظر المستخدم';

  @override
  String get userProfileUnblockUser => 'إلغاء حظر المستخدم';

  @override
  String get userProfileRemoveFriend => 'إزالة صديق';

  @override
  String get userProfileBlockConfirmTitle => 'حظر المستخدم';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'هل أنت متأكد أنك تريد حظر $username؟';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'إلغاء حظر المستخدم';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'هل أنت متأكد أنك تريد إلغاء حظر $username؟';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'إزالة صديق';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'هل أنت متأكد أنك تريد إزالة $username كصديق؟';
  }

  @override
  String get userProfileFailedOpenDm => 'فشل فتح الرسالة المباشرة';

  @override
  String get userProfileFailedSaveNote => 'فشل حفظ الملاحظة';

  @override
  String get userProfileActionFailed => 'فشل الإجراء، يرجى المحاولة مرة أخرى';

  @override
  String get userProfileChangeNickname => 'تغيير الاسم المستعار';

  @override
  String get userProfileKick => 'طرد';

  @override
  String get userProfileBan => 'حظر';

  @override
  String get userProfileTimeout => 'تقييد مؤقت';

  @override
  String get userProfileRemoveTimeout => 'إزالة التقييد المؤقت';

  @override
  String get userProfileTransferOwnership => 'نقل الملكية';

  @override
  String get userProfileReportUser => 'الإبلاغ عن المستخدم';

  @override
  String get userProfileReportMessage => 'الإبلاغ عن الرسالة';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'طرد $username؟';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'هل أنت متأكد أنك تريد طرد $username؟ يمكنهم الانضمام مرة أخرى بدعوة جديدة.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'إزالة حظر الكتابة؟';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'إزالة حظر الكتابة ستسمح لـ $username بإرسال الرسائل، والتفاعل، والانضمام إلى قنوات الصوت مرة أخرى.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'نقل الملكية؟';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'نقل ملكية هذا المجتمع إلى $username؟ هذا الإجراء لا رجعة فيه وستفقد جميع امتيازات المالك.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'حظر $username';
  }

  @override
  String get userProfileBanDurationLabel => 'مدة الحظر';

  @override
  String get userProfileBanCustomSecondsLabel => 'مدة مخصصة (بالثواني)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'أي قيمة من $min إلى $max ثانية';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'حذف سجل الرسائل';

  @override
  String get userProfileBanDeleteNone => 'عدم حذف أي شيء';

  @override
  String get userProfileBanDelete24h => 'آخر 24 ساعة';

  @override
  String get userProfileBanDelete7d => 'آخر 7 أيام';

  @override
  String get userProfileBanReasonLabel => 'السبب (اختياري)';

  @override
  String get userProfileBanReasonHint => 'أدخل سببًا للحظر';

  @override
  String get userProfileBanSubmit => 'حظر العضو';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'حظر كتابة $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'مدة حظر الكتابة';

  @override
  String get userProfileTimeoutSubmit => 'حظر العضو من الكتابة';

  @override
  String get userProfileNicknameLabel => 'اسم مستعار';

  @override
  String get userProfileNicknameHint => 'أدخل اسمًا مستعارًا';

  @override
  String get userProfileNicknameSave => 'حفظ';

  @override
  String userProfileKickSuccess(String username) {
    return 'تم طرد $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'تم حظر $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'تم حظر $username من الكتابة';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'تمت إزالة حظر الكتابة عن $username';
  }

  @override
  String get userProfileNicknameSuccess => 'تم تحديث الاسم المستعار';

  @override
  String get userProfileTransferSuccess => 'تم نقل الملكية';

  @override
  String get durationPermanent => 'دائم';

  @override
  String get duration60Seconds => '60 ثانية';

  @override
  String get duration5Minutes => '5 دقائق';

  @override
  String get duration10Minutes => '10 دقائق';

  @override
  String get duration1Hour => 'ساعة واحدة';

  @override
  String get duration12Hours => '12 ساعة';

  @override
  String get duration1Day => 'يوم واحد';

  @override
  String get duration3Days => '3 أيام';

  @override
  String get duration5Days => '5 أيام';

  @override
  String get duration1Week => 'أسبوع واحد';

  @override
  String get duration2Weeks => 'أسبوعان';

  @override
  String get duration1Month => 'شهر واحد';

  @override
  String get durationCustom => 'مخصص…';

  @override
  String get iarReportUserTitle => 'الإبلاغ عن مستخدم';

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
  String get iarReasonInappropriateProfile => 'ملف شخصي غير لائق';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'ملف هذا المستخدم الشخصي يحتوي على محتوى غير لائق';

  @override
  String typingIndicatorOne(String name) {
    return 'يكتب $name...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'يكتب $name1 و $name2...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'يكتب $name1 و $name2 و $name3...';
  }

  @override
  String get typingIndicatorMultiple => 'يكتب العديد من الأشخاص...';

  @override
  String get typingIndicatorHandful =>
      'مجموعة من محاربي لوحة المفاتيح يتجمعون...';

  @override
  String get typingIndicatorSymphony =>
      'سيمفونية من نقرات المفاتيح تجري حاليًا...';

  @override
  String get typingIndicatorFiesta => 'إنها حفلة كتابة كاملة هنا';

  @override
  String get typingIndicatorApocalypse => 'واو، إنها نهاية عالم الكتابة';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'سعيد بوجودك هنا، $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'أهلاً بك، $username! اجعل هذا بيتك.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'مرحباً، $username! يسعدنا وجودك هنا.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'مرحباً، $username! انضم متى كنت مستعداً.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'مرحباً $username، يسعدنا رؤيتك هنا!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'مرحباً، $username! نأمل أن تستمتع بإقامتك.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'مرحباً، $username، أهلاً بك على متن السفينة!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'سعيد بوصولك، $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'أهلاً بك، $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'أهلاً بك، $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'أهلاً بك، $username! يسعدنا وجودك هنا.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'أهلاً بك، $username! نأمل أن تستمتع بوقتك هنا.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'أهلاً بك، $username! محادثتك القادمة تبدأ هنا.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'أهلاً بك، $username. يسعدنا وجودك هنا.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'يسعدنا رؤيتك، $username! أهلاً بك.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'لقد وصلت، $username! يسعدنا انضمامك إلينا.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'لقد وصلت، $username! لنبدأ.';
  }

  @override
  String get relativeTimeShortNow => 'الآن';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countد',
      one: '1د',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countس',
      one: '1س',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countي',
      one: '1ي',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countش',
      one: '1ش',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countس',
      one: '1س',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'أجهزتي';

  @override
  String get linkedDevicesDescription =>
      'شاهد جميع الأجهزة التي تم تسجيل الدخول إليها حاليًا في حسابك. قم بإلغاء أي جلسات لا تتعرف عليها.';

  @override
  String get linkedDevicesCurrentDevice => 'الجهاز الحالي';

  @override
  String get linkedDevicesOtherDevices => 'أجهزة أخرى';

  @override
  String get linkedDevicesEnterSelection => 'الدخول إلى وضع التحديد';

  @override
  String get linkedDevicesExitSelection => 'الخروج من وضع التحديد';

  @override
  String get linkedDevicesSelectAll => 'تحديد الكل';

  @override
  String get linkedDevicesClearSelection => 'مسح التحديد';

  @override
  String get linkedDevicesRevokeTooltip => 'إلغاء الجهاز';

  @override
  String get linkedDevicesSignOutAll => 'تسجيل الخروج من جميع الأجهزة الأخرى';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تسجيل الخروج من $count أجهزة',
      one: 'تسجيل الخروج من جهاز واحد',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تسجيل الخروج من $count أجهزة',
      one: 'تسجيل الخروج من جهاز واحد',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'تسجيل الخروج من جميع الأجهزة الأخرى';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'سيؤدي هذا إلى تسجيل خروج الأجهزة المحددة من حسابك. ستحتاج إلى تسجيل الدخول مرة أخرى على تلك الأجهزة.',
      one:
          'سيؤدي هذا إلى تسجيل خروج الجهاز المحدد من حسابك. ستحتاج إلى تسجيل الدخول مرة أخرى على هذا الجهاز.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'سيؤدي هذا إلى تسجيل خروج الأجهزة المحددة من حسابك. ستحتاج إلى تسجيل الدخول مرة أخرى على تلك الأجهزة.';

  @override
  String get linkedDevicesSignOutConfirm => 'متابعة';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'ستحتاج إلى تسجيل الدخول مرة أخرى على جميع الأجهزة التي تم تسجيل الخروج منها';

  @override
  String get linkedDevicesLoadErrorTitle => 'خطأ في الشبكة';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'نواجه مشكلة في الاتصال بالزمكان. يرجى التحقق من اتصالك والمحاولة مرة أخرى.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم إلغاء الأجهزة',
      one: 'تم إلغاء الجهاز',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'تعذر تسجيل الخروج. حاول مرة أخرى.';

  @override
  String get linkedDevicesUnknownOs => 'نظام تشغيل غير معروف';

  @override
  String get linkedDevicesUnknownPlatform => 'منصة غير معروفة';

  @override
  String slowmodeLabel(String duration) {
    return '$duration وضع بطيء';
  }

  @override
  String get slowmodeTooltipActive =>
      'أنت في وضع الإبطاء. يرجى الانتظار قبل إرسال رسالة أخرى.';

  @override
  String get slowmodeTooltipImmune => 'وضع الإبطاء ممكّن، لكنك معفي منه.';

  @override
  String get channelNoSendPermissionHint =>
      'لا يمكنك إرسال رسائل في هذه القناة.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'إعلانات النظام من موظفي $productName. لا يمكنك الرد هنا.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'تم إيقاف المراسلة مؤقتًا في هذا المجتمع.';

  @override
  String get channelComposerBarrierTimedOut =>
      'تم حظر رسائلك مؤقتًا. تم إيقاف المراسلة وردود الفعل والصوت حتى انتهاء فترة الحظر.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'تحتاج إلى المطالبة بحسابك لإرسال رسائل في هذا المجتمع.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'تحتاج إلى التحقق من بريدك الإلكتروني لإرسال رسائل في هذا المجتمع.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'حسابك حديث جدًا لإرسال رسائل في هذا المجتمع.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'لم تكن عضوًا في هذا المجتمع لفترة كافية لإرسال الرسائل.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'تحتاج إلى التحقق من رقم هاتف لإرسال رسائل في هذا المجتمع.';

  @override
  String get channelComposerBarrierVerifyEmail => 'تحقق من البريد الإلكتروني';

  @override
  String get channelComposerBarrierVerifyPhone => 'تحقق من الهاتف';

  @override
  String chatAttachmentTooMany(int max) {
    return 'ملفات مرفقة كثيرة جدًا (الحد الأقصى $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'ملف واحد أو أكثر يتجاوز الحد الأقصى للحجم';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'هذه الملفات كبيرة جدًا لإرسالها معًا';

  @override
  String get chatAttachmentDropToUpload => 'أسقط الملفات للتحميل';

  @override
  String get chatAttachmentDropToSend => 'أسقط الملفات للإرسال الآن';

  @override
  String get chatAttachmentSendVoiceMessage => 'إرسال رسالة صوتية';

  @override
  String get voiceMessageTitle => 'رسالة صوتية';

  @override
  String get voiceMessageHoldHint =>
      'اضغط للتسجيل. اسحب للأعلى للقفل، أو أفلت للإرسال.';

  @override
  String get voiceMessageDiscard => 'تجاهل الرسالة الصوتية';

  @override
  String get voiceMessageSend => 'إرسال الرسالة الصوتية';

  @override
  String get voiceMessageMicPermissionDenied =>
      'تعذر بدء التسجيل. اسمح بالوصول إلى الميكروفون.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'التسجيل الصوتي غير مدعوم على هذا الجهاز.';

  @override
  String get voiceMessageMicInUse =>
      'غادر المكالمة الصوتية لتسجيل رسالة صوتية.';

  @override
  String get voiceMessageRecordingFailed => 'فشل التسجيل. حاول مرة أخرى.';

  @override
  String get voiceMessageSendFailed =>
      'تعذر إرسال الرسالة الصوتية. حاول مرة أخرى.';

  @override
  String get voiceMessageRecordingHint =>
      'تحدث الآن. اضغط على إيقاف عند الانتهاء — يمكنك القص لاحقًا.';

  @override
  String get voiceMessageReviewHint => 'اسحب المقابض للقص، ثم اضغط على إرسال.';

  @override
  String get voiceMessageStop => 'إيقاف';

  @override
  String get voiceMessageStartRecording => 'بدء التسجيل';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'تشغيل';

  @override
  String get voiceMessagePause => 'إيقاف مؤقت';

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

    return 'يجب أن يكون التحديد $secondsString ثانية على الأقل.';
  }

  @override
  String get chatAttachmentEditTitle => 'تعديل المرفق';

  @override
  String get chatAttachmentFilenameLabel => 'اسم الملف';

  @override
  String get chatAttachmentDescriptionLabel => 'الوصف';

  @override
  String get chatAttachmentDescriptionHint => 'نص بديل اختياري';

  @override
  String get chatAttachmentSpoilerLabel => 'وضع علامة كمحتوى محظور';

  @override
  String get chatAttachmentRemove => 'إزالة المرفق';

  @override
  String get chatAttachmentDownload => 'تنزيل';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'انتهت صلاحية المرفق';

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
  String get chatAttachmentSourceGallery => 'المعرض';

  @override
  String get chatAttachmentSourceCamera => 'الكاميرا';

  @override
  String get chatAttachmentSourceBrowse => 'تصفح الملفات';

  @override
  String get chatAttachmentPasteTooltip => 'لصق صورة من الحافظة';

  @override
  String get chatAttachmentSpoiler => 'محتوى محظور';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'كشف المحتوى المحظور';

  @override
  String get matureMediaRevealButton => 'كشف';

  @override
  String get matureMediaRevealHint => 'انقر للكشف';

  @override
  String get matureContentTitle => 'محتوى للبالغين';

  @override
  String get matureCommunityTitle => 'مجتمع للبالغين';

  @override
  String get matureCategoryTitle => 'فئة للبالغين';

  @override
  String get matureChannelTitle => 'قناة للبالغين';

  @override
  String get communityContentWarningTitle => 'تحذير محتوى المجتمع';

  @override
  String get categoryContentWarningTitle => 'تحذير محتوى الفئة';

  @override
  String get channelContentWarningTitle => 'تحذير محتوى القناة';

  @override
  String get defaultContentWarningBody => 'يحتوي هذا على محتوى حساس.';

  @override
  String get matureCommunityBody =>
      'هذا المجتمع مُصنف للمحتوى الخاص بالبالغين وقد يحتوي على مواد قد تكون غير مناسبة لبعض المستخدمين.';

  @override
  String get matureCategoryBody =>
      'هذه الفئة مُصنفة للمحتوى الخاص بالبالغين وقد تحتوي على مواد قد تكون غير مناسبة لبعض المستخدمين.';

  @override
  String get matureChannelBody =>
      'هذه القناة مُصنفة للمحتوى الخاص بالبالغين وقد تحتوي على مواد قد تكون غير مناسبة لبعض المستخدمين.';

  @override
  String get matureVoiceChannelBody =>
      'هذه القناة الصوتية مُصنفة للمحتوى الخاص بالبالغين وقد تحتوي على مواد قد تكون غير مناسبة لبعض المستخدمين.';

  @override
  String get matureLinkChannelBody =>
      'هذه القناة الرابط مُصنفة للمحتوى الخاص بالبالغين وقد تفتح مواد قد تكون غير مناسبة لبعض المستخدمين.';

  @override
  String get matureCommunityUnavailableBody =>
      'هذا المجتمع الخاص بالبالغين غير متاح لحسابك.';

  @override
  String get matureCategoryUnavailableBody =>
      'هذه الفئة الخاصة بالبالغين غير متاحة لحسابك.';

  @override
  String get matureChannelUnavailableBody =>
      'هذه القناة الخاصة بالبالغين غير متاحة لحسابك.';

  @override
  String get matureContentProceedButton => 'متابعة';

  @override
  String get matureContentUnderstandButton => 'أفهم';

  @override
  String get matureContentOpenLinkButton => 'فتح الرابط';

  @override
  String get sensitiveContentSectionTitle => 'محتوى حساس';

  @override
  String get sensitiveContentSectionDescription =>
      'تحكم في كيفية تصفية الوسائط الخاصة بالبالغين أو الحساسة في سياقات مختلفة';

  @override
  String get sensitiveContentFriendDmLabel => 'الرسائل المباشرة من الأصدقاء';

  @override
  String get sensitiveContentNonFriendDmLabel => 'الرسائل المباشرة من الآخرين';

  @override
  String get sensitiveContentGuildLabel => 'الرسائل في قنوات المجتمع';

  @override
  String get sensitiveContentFilterShow => 'إظهار';

  @override
  String get sensitiveContentFilterBlur => 'تمويه';

  @override
  String get sensitiveContentFilterBlock => 'حظر';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'تمويه الوسائط حتى اكتمال فحص الأمان';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'عند التمكين، يتم تمويه الصور ومقاطع الفيديو حتى تنتهي عملية فحص سلامة المحتوى.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'هذا الإعداد قيد التشغيل دائمًا لحسابك.';

  @override
  String get sensitiveContentResetButton => 'إعادة تعيين';

  @override
  String get sensitiveContentSaveButton => 'حفظ';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملفات',
      one: 'ملف واحد',
    );
    return 'جارٍ تحميل $_temp0';
  }

  @override
  String get chatCancelUpload => 'إلغاء التحميل';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'تنتهي الصلاحية في $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'تنتهي الصلاحية بين $start و $end';
  }

  @override
  String get connectionsTitle => 'الاتصالات';

  @override
  String get connectionsDescription =>
      'اربط الحسابات والنطاقات الخارجية بملف تعريف Fluxer الخاص بك. سيتم عرض الاتصالات التي تم التحقق منها في ملفك الشخصي ليراها الآخرون.';

  @override
  String get connectionsEmptyTitle => 'لا توجد اتصالات بعد';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'اربط حساب Bluesky الخاص بك أو تحقق من ملكية النطاق لعرضها في ملفك الشخصي.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'تحقق من ملكية النطاق لعرضها في ملفك الشخصي.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'نطاق';

  @override
  String get connectionsAddBlueskyAriaLabel => 'إضافة اتصال Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'إضافة اتصال نطاق';

  @override
  String get connectionEdit => 'تعديل';

  @override
  String get connectionRemove => 'إزالة';

  @override
  String get connectionVerifiedLabel => 'تم التحقق من هذا الاتصال.';

  @override
  String get connectionUnverifiedLabel => 'لم يتم التحقق من هذا الاتصال.';

  @override
  String get connectionAddTitle => 'إضافة اتصال';

  @override
  String get connectionTypeLabel => 'نوع الاتصال';

  @override
  String get connectionHandleLabel => 'المقبض';

  @override
  String get connectionDomainLabel => 'النطاق';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'لديك هذا الاتصال بالفعل.';

  @override
  String get connectionConnectBluesky => 'الاتصال بـ Bluesky';

  @override
  String get connectionContinue => 'متابعة';

  @override
  String get connectionVerifyTitle => 'التحقق من الاتصال';

  @override
  String get connectionVerifyInstructions =>
      'استخدم السجل أدناه لإثبات ملكية النطاق.';

  @override
  String get connectionDnsRecordTitle => 'سجل TXT الخاص بـ DNS';

  @override
  String get connectionDnsHostLabel => 'المضيف';

  @override
  String get connectionDnsValueLabel => 'القيمة';

  @override
  String get connectionCopyHost => 'نسخ المضيف';

  @override
  String get connectionCopyValue => 'نسخ القيمة';

  @override
  String get connectionCopied => 'تم النسخ!';

  @override
  String get connectionTokenFileTitle => 'تقديم ملف الرمز المميز';

  @override
  String get connectionTokenFileDescription =>
      'قم بتنزيل **fluxer-verification** وضعه في مجلد **.well-known** الخاص بك حتى نتمكن من التحقق من صحة النطاق.';

  @override
  String get connectionTokenFileDownload => 'تنزيل fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'يحتوي الملف على رمز التحقق الذي سنقوم بجلبة من **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'حفظ fluxer-verification';

  @override
  String get connectionVerifyButton => 'تحقق';

  @override
  String get connectionBack => 'رجوع';

  @override
  String get connectionEditTitle => 'تعديل الاتصال';

  @override
  String get connectionEditDescription =>
      'اختر من يمكنه رؤية هذا الاتصال في ملفك الشخصي.';

  @override
  String get connectionVisibilityEveryone => 'الجميع';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'اسمح لأي شخص برؤية هذا الاتصال في ملفك الشخصي';

  @override
  String get connectionVisibilityFriends => 'الأصدقاء';

  @override
  String get connectionVisibilityFriendsDesc =>
      'اسمح لأصدقائك برؤية هذا الاتصال';

  @override
  String get connectionVisibilityCommunityMembers => 'أعضاء المجتمع';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'اسمح للأعضاء من المجتمعات التي تنتمي إليها برؤية هذا الاتصال';

  @override
  String get connectionRemoveTitle => 'إزالة الاتصال';

  @override
  String get connectionRemoveDescription =>
      'هل أنت متأكد أنك تريد إزالة هذا الاتصال؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get connectionRemoveConfirm => 'إزالة';

  @override
  String get connectionsLoadError => 'فشل تحميل الاتصالات';

  @override
  String get connectionsReorderError => 'فشل تحديث الترتيب';

  @override
  String get connectionInitiateFailed => 'تعذر بدء التحقق. حاول مرة أخرى.';

  @override
  String get connectionVerifyFailed =>
      'تعذر التحقق. تحقق من سجل DNS الخاص بك وحاول مرة أخرى.';

  @override
  String get connectionBlueskyAuthorizeFailed => 'تعذر بدء تفويض Bluesky.';

  @override
  String get connectionUpdateFailed => 'تعذر تحديث الاتصال';

  @override
  String get connectionRemoveFailed => 'تعذر إزالة الاتصال';

  @override
  String get connectionTokenSavedToast => 'تم حفظ fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'تعذر حفظ الملف';

  @override
  String get connectionEnterHandle => 'أدخل مقبض Bluesky.';

  @override
  String get connectionEnterDomain => 'أدخل نطاقًا.';

  @override
  String get lookAndFeelTitle => 'المظهر والإحساس';

  @override
  String get lookAndFeelThemeSectionTitle => 'السمة';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'اختر بين المظهر الداكن أو الفحمي أو الفاتح.';

  @override
  String get lookAndFeelThemeDark => 'السمة الداكنة';

  @override
  String get lookAndFeelThemeCoal => 'سمة الفحم';

  @override
  String get lookAndFeelThemeLight => 'السمة الفاتحة';

  @override
  String get lookAndFeelThemeSystem => 'سمة النظام';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'مزامنة السمة عبر الأجهزة';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'عند التمكين، ستتم مزامنة تغييرات السمة إلى جميع أجهزتك. عند التعطيل، سيستخدم هذا الجهاز إعداد السمة الخاص به.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'تعطّل سمة النظام تلقائيًا المزامنة لتتبع تفضيلات نظامك على هذا الجهاز.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'لم نتمكن من مزامنة السمة إلى حسابك. يرجى المحاولة مرة أخرى.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'توسيع خط الدردشة';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'اضبط حجم الخط في منطقة الدردشة.';

  @override
  String get lookAndFeelInterfaceTitle => 'الواجهة';

  @override
  String get lookAndFeelInterfaceDescription =>
      'تخصيص عناصر الواجهة وسلوكياتها.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'مؤشرات الكتابة في قائمة القنوات';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'اختر كيف تظهر مؤشرات الكتابة في قائمة القنوات عندما يكتب شخص ما في قناة.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'مؤشر الكتابة + الصور الرمزية';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'عرض مؤشر الكتابة مع الصور الرمزية للمستخدمين في قائمة القنوات';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'مؤشر الكتابة فقط';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'عرض مؤشر الكتابة فقط بدون صور رمزية';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'مخفي';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'لا تعرض مؤشرات الكتابة في قائمة القنوات';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'إظهار الكتابة في القناة المحددة';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'عند التعطيل (افتراضي)، لن تظهر مؤشرات الكتابة في القناة التي تشاهدها حاليًا.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'عام';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'تلميحات لوحة المفاتيح';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'تحكم فيما إذا كانت تلميحات اختصارات لوحة المفاتيح تظهر داخل التلميحات.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'إخفاء تلميحات لوحة المفاتيح في التلميحات';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'عند التمكين، يتم إخفاء شارات الاختصارات في نوافذ التلميحات المنبثقة.';

  @override
  String get lookAndFeelNekoTitle => 'متفرقات';

  @override
  String get lookAndFeelNekoDescription => 'خيارات واجهة متفرقة.';

  @override
  String get lookAndFeelShowNekoLabel => 'إظهار Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'عند التمكين، يظهر Neko بالقرب من شريط إدخال الدردشة.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'سلوك الانضمام إلى قنوات الصوت';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'تحكم في كيفية الانضمام إلى قنوات الصوت في المجتمعات.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'تتطلب النقر المزدوج للانضمام إلى قنوات الصوت';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'عند التمكين، ستحتاج إلى النقر المزدوج على قنوات الصوت للانضمام إليها. عند التعطيل (افتراضي)، سيؤدي النقر الفردي إلى الانضمام إلى القناة فورًا.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'الثعلب البني السريع يقفز فوق الكلب الكسول.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'الشريط الجانبي للمجتمع';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'تكوين كيفية عرض الشريط الجانبي للمجتمع للرسائل المباشرة.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مجتمعات غير متاحة مؤقتًا بسبب عطل في مكثف التدفق.',
      one: 'مجتمع واحد غير متاح مؤقتًا بسبب عطل في مكثف التدفق.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'طي الرسائل المباشرة في مجلد';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'عند التمكين، يتم طي الرسائل المباشرة غير المقروءة في الشريط الجانبي للمجتمع في مجلد زر Fluxer. انقر فوق زر Fluxer أثناء وجودك في صفحة الرسائل المباشرة لتوسيع أو طي المجلد.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'قائمة القنوات';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'تحكم في سلوك مؤشر غير المقروء للقنوات المكتومة في قوائم القنوات.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'إظهار مؤشر غير المقروء على القنوات المكتومة';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'عند التمكين، تعرض القنوات المكتومة مؤشرًا باهتًا غير مقروء على الجانب الأيسر. تظهر الإشارات بغض النظر عن هذا الإعداد.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'نشط الآن';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'تحكم في كيفية ظهور النشط الآن عبر التطبيق.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'إظهار نشط الآن على الشاشة الرئيسية';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'اعرض النشط الآن على الشاشة الرئيسية لعرض الأصدقاء النشطين في الصوت. سترى معاينة، وسياق القناة، ومن هم موجودون بالفعل، وطريقة سريعة للانضمام.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'المفضلة';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'تحكم في رؤية المفضلة في جميع أنحاء التطبيق.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'تمكين المفضلة';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'عند التمكين، يمكنك تمييز القنوات كمفضلة وستظهر في قسم المفضلة. عند التعطيل، سيتم إخفاء جميع عناصر واجهة المستخدم المتعلقة بالمفضلة (الأزرار، عناصر القائمة). سيتم الاحتفاظ بالمفضلة الحالية.';

  @override
  String get favoritesTitle => 'المفضلة';

  @override
  String get favoritesEmptyTitle => 'لا توجد مفضلات بعد';

  @override
  String get favoritesEmptyDescription =>
      'ضع علامة نجمة على القنوات من رأس الدردشة للاحتفاظ بها هنا.';

  @override
  String get favoritesWelcomeTitle => 'مرحباً بك في المفضلة';

  @override
  String get favoritesWelcomeDescription =>
      'مساحتك الشخصية للوصول السريع إلى القنوات والرسائل المباشرة والمجموعات التي تحبها. اضغط على النجمة في أي قناة لإضافتها هنا.';

  @override
  String get favoritesWelcomeTip => 'ليست لك؟ قم بتعطيلها في أي وقت.';

  @override
  String get favoritesDisableButton => 'تعطيل المفضلة';

  @override
  String get favoritesAddedToast => 'تمت الإضافة إلى المفضلة';

  @override
  String get favoritesRemovedToast => 'تمت الإزالة من المفضلة';

  @override
  String get favoritesHiddenToast => 'تم إخفاء المفضلة';

  @override
  String get favoritesMute => 'كتم المفضلة';

  @override
  String get favoritesUnmute => 'إلغاء كتم المفضلة';

  @override
  String get favoritesHeaderMenu => 'قائمة المفضلة';

  @override
  String get favoritesCreateCategory => 'إنشاء فئة';

  @override
  String get favoritesCategoryNameLabel => 'اسم الفئة';

  @override
  String get favoritesHideMutedChannels => 'إخفاء القنوات المكتومة';

  @override
  String get favoritesShowMutedChannels => 'إظهار القنوات المكتومة';

  @override
  String get favoritesSetNickname => 'تعيين اسم مستعار';

  @override
  String get favoritesNicknameLabel => 'اسم مستعار';

  @override
  String get favoritesSaveNickname => 'حفظ الاسم المستعار';

  @override
  String get favoritesMoveToCategory => 'نقل إلى فئة';

  @override
  String get favoritesUncategorized => 'غير مصنفة';

  @override
  String get favoritesOtherCategory => 'أخرى';

  @override
  String get favoritesRemoveFromFavorites => 'إزالة من المفضلة';

  @override
  String get favoritesAddToFavorites => 'إضافة إلى المفضلة';

  @override
  String get favoritesHideConfirmTitle => 'إخفاء المفضلة';

  @override
  String get favoritesHideConfirmDescription =>
      'سيؤدي هذا إلى إخفاء جميع عناصر واجهة المستخدم المتعلقة بالمفضلة بما في ذلك الأزرار وعناصر القائمة. سيتم الاحتفاظ بالمفضلات الحالية الخاصة بك ويمكن إعادة تمكينها في أي وقت من الإعدادات > متقدم > المظهر.';

  @override
  String get favoritesDirectMessageSubtitle => 'رسالة مباشرة';

  @override
  String get messagesMediaDisplayGroupTitle => 'العرض';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'التحكم في كيفية عرض الرسائل والوسائط والمحتويات الأخرى.';

  @override
  String get messagesMediaMediaGroupTitle => 'الوسائط';

  @override
  String get messagesMediaMediaGroupDescription =>
      'تخصيص تفضيلات حجم الوسائط والأزرار.';

  @override
  String get messagesMediaInputGroupTitle => 'الإدخال';

  @override
  String get messagesMediaInputGroupDescription =>
      'تخصيص إعدادات إدخال الرسائل.';

  @override
  String get messagesMediaSidebarGroupTitle => 'الشريط الجانبي';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'تكوين كيفية عرض الشريط الجانبي للمجتمع.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'إخفاء القنوات المكتومة افتراضيًا';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'إخفاء القنوات المكتومة تلقائيًا في الشريط الجانبي عند الانضمام إلى مجتمعات جديدة';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'إخفاء القنوات المكتومة افتراضيًا؟';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'سيتم إخفاء القنوات المكتومة تلقائيًا في المجتمعات الجديدة التي تنضم إليها. هل ترغب أيضًا في تطبيق هذا الإعداد على جميع مجتمعاتك الحالية؟';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'إيقاف إخفاء القنوات المكتومة افتراضيًا؟';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'لن يتم إخفاء القنوات المكتومة تلقائيًا في المجتمعات الجديدة التي تنضم إليها. هل ترغب أيضًا في إظهار القنوات المكتومة في جميع مجتمعاتك الحالية؟';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'تطبيق على جميع المجتمعات';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'إظهار في جميع المجتمعات';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'المجتمعات الجديدة فقط';

  @override
  String get messagesMediaDisplaySectionTitle => 'عرض الوسائط';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'تحكم في كيفية عرض الصور ومقاطع الفيديو والوسائط الأخرى. يتم تغيير حجم جميع الوسائط وتحويلها. لن يتم تضمين الملفات الكبيرة جدًا التي لا يمكن ضغطها في معاينة بغض النظر عن هذه الإعدادات.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel => 'عند نشرها كروابط للدردشة';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'عند تحميلها مباشرة إلى Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'معاينات الروابط';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'تحكم في كيفية معاينة روابط مواقع الويب في الدردشة';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'عرض المضمنات ومعاينة روابط مواقع الويب';

  @override
  String get messagesMediaReactionsSectionTitle => 'ردود الفعل';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'تكوين ردود فعل الرموز التعبيرية على الرسائل';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'عرض ردود فعل الرموز التعبيرية على الرسائل';

  @override
  String get messagesMediaSpoilersSectionTitle => 'المحتوى المخفي';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'تحكم في كيفية عرض المحتوى المخفي';

  @override
  String get messagesMediaSpoilersRadioLabel => 'عرض المحتوى المخفي';

  @override
  String get messagesMediaSpoilersOnClickName => 'عند النقر';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'عرض المحتوى المخفي عند النقر';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'في القنوات التي أشرف عليها';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'عرض المحتوى المخفي دائمًا في القنوات التي لديك فيها إذن \"إدارة الرسائل\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'دائمًا';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'عرض المحتوى المخفي دائمًا';

  @override
  String get messagesMediaSizeSectionTitle => 'تفضيلات حجم الوسائط';

  @override
  String get messagesMediaSizeSectionDescription =>
      'تخصيص الحد الأقصى لحجم العرض للوسائط المضمنة والمرفقة. الأحجام الأصغر تشغل مساحة أقل، بينما تعرض الأحجام الأكبر مزيدًا من التفاصيل.';

  @override
  String get messagesMediaSizeEmbedLabel => 'الوسائط من الروابط (المضمنات)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'المرفقات التي تم تحميلها';

  @override
  String get messagesMediaSizeCompactName => 'مدمج (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'حجم وسائط أصغر';

  @override
  String get messagesMediaSizeComfortableName => 'مريح (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'حجم وسائط أكبر مع مزيد من التفاصيل';

  @override
  String get messagesMediaGifsSectionTitle => 'سلوك صور GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'تحكم في كيفية إدراج صور GIF في الدردشة';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'إرسال صور GIF تلقائيًا عند تحديدها';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'الإكمال التلقائي للتعبيرات (الإكمال التلقائي للنقطتين)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'تحكم في ما يظهر في الإكمال التلقائي للتعبيرات عند كتابة نقطتين. قم بتخصيص الاقتراحات التي تظهر لتناسب تفضيلاتك.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'عرض الرموز التعبيرية الافتراضية في الإكمال التلقائي للتعبيرات';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'عرض الرموز التعبيرية المخصصة في الإكمال التلقائي للتعبيرات';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'عرض الملصقات في الإكمال التلقائي للتعبيرات';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'عرض الوسائط المحفوظة في الإكمال التلقائي للتعبيرات';

  @override
  String get messagesMediaEditingSectionTitle => 'تعديل الرسائل';

  @override
  String get messagesMediaEditingSectionDescription =>
      'تحكم في ما يحدث لمسودة التعديل عند الإلغاء.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'الاحتفاظ بمسودة التعديل عند الإلغاء';

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
  String get accessibilityDmMessagePreviewGroupTitle =>
      'معاينات رسائل الدردشة المباشرة';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'تحكم في وقت عرض معاينات الرسائل في قائمة الدردشة المباشرة.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'وضع معاينة رسائل الدردشة المباشرة';

  @override
  String get accessibilityDmMessagePreviewAllName => 'جميع الرسائل';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'عرض معاينات الرسائل لجميع محادثات الدردشة المباشرة';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'الرسائل غير المقروءة فقط';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'عرض معاينات الرسائل فقط للدردشات المباشرة التي تحتوي على رسائل غير مقروءة';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'لا شيء';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'عدم عرض معاينات الرسائل في قائمة الدردشة المباشرة';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Screen reader';

  @override
  String get accessibilityScreenReaderGroupDescription =>
      'Control how Fluxer works with screen readers.';

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
  String get dmListSentAnAttachment => 'تم إرسال مرفق';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username قام بتثبيت رسالة في هذه القناة.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username أضاف $userName إلى المجموعة.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username أضاف شخصًا إلى المجموعة.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username غادر المجموعة.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username أزال $userName من المجموعة.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username أزال شخصًا من المجموعة.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username غيّر اسم القناة إلى $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username غيّر اسم القناة.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username غيّر أيقونة القناة.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username بدأ مكالمة.';
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
  String get voiceConnectionConfirmTitle => 'تأكيد اتصال الصوت';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'أنت متصل بالفعل بهذه القناة الصوتية من $count أجهزة أخرى. ماذا تريد أن تفعل؟',
      one:
          'أنت متصل بالفعل بهذه القناة الصوتية من جهاز آخر. ماذا تريد أن تفعل؟',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'التبديل إلى هذا الجهاز';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'الانضمام فقط (مع الاحتفاظ بالاتصالات الأخرى)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'لا تفعل شيئًا، لا أريد الانضمام';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'هذه قناة صوتية. اتصل لبدء التحدث!';

  @override
  String get voiceChannelJoin => 'الانضمام إلى القناة الصوتية';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'الاتصال بالصوت';

  @override
  String get voiceChannelNoConnectPermission =>
      'ليس لديك إذن للانضمام إلى هذه القناة الصوتية';

  @override
  String get voiceChannelE2eeEncrypted =>
      'الميكروفون والكاميرا ومحتوى مشاركة الشاشة مشفرة بالكامل.';

  @override
  String get voiceCallE2eeEncrypted =>
      'الميكروفون والكاميرا ومحتوى مشاركة الشاشة مشفرة بالكامل.';

  @override
  String get voiceChannelE2eeBroken =>
      'التشفير من طرف إلى طرف غير متاح لأن مشاركًا غير مدعوم موجود في هذه القناة الصوتية.';

  @override
  String get voiceCallE2eeBroken =>
      'التشفير من طرف إلى طرف غير متاح لأن مشاركًا غير مدعوم موجود في هذه المكالمة.';

  @override
  String get voiceE2eeUpdateRequired =>
      'يجب تحديث هذا العميل قبل الانضمام إلى هذه المكالمة المشفرة.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'تعذر بدء تشغيل الميكروفون الخاص بك. ما زلت في المكالمة.';

  @override
  String get voiceChannelStatusConnecting => 'جارٍ الاتصال…';

  @override
  String get voiceChannelStatusConnected => 'متصل';

  @override
  String get voiceChannelStatusError => 'خطأ';

  @override
  String get voiceParticipantTooltipMobileDevice => 'جهاز محمول';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'جهاز مكتبي';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'كتم الصوت بواسطة المجتمع';

  @override
  String get voiceParticipantTooltipMuted => 'تم كتم الصوت';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'تم تعطيل الصوت بواسطة المجتمع';

  @override
  String get voiceParticipantTooltipDeafened => 'تم تعطيل الصوت';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'الاتصال: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مشاركًا',
      one: 'مشارك واحد',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'مغادرة';

  @override
  String get voiceControlMute => 'كتم الصوت';

  @override
  String get voiceControlUnmute => 'إلغاء كتم الصوت';

  @override
  String get voiceControlDeafen => 'تعطيل الصوت';

  @override
  String get voiceControlUndeafen => 'إلغاء تعطيل الصوت';

  @override
  String get voiceControlVideo => 'الفيديو';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'مشاركة الشاشة';

  @override
  String get voiceScreenShareNotificationText => 'جارٍ مشاركة شاشتك.';

  @override
  String get voiceControlMore => 'المزيد';

  @override
  String get voiceControlDisconnect => 'قطع الاتصال';

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
  String get voiceControlChat => 'الدردشة';

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
  String get voiceTextChatShow => 'إظهار الدردشة';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رسالة غير مقروءة',
      one: 'رسالة واحدة غير مقروءة',
    );
    return 'إظهار الدردشة مع $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired => 'إذن الكاميرا مطلوب للفيديو.';

  @override
  String get voiceErrorScreenShareToggle =>
      'تعذر بدء مشاركة الشاشة. يرجى المحاولة مرة أخرى.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'تم رفض إذن مشاركة الشاشة.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'مشاركة الشاشة غير متاحة على هذا الجهاز.';

  @override
  String get voiceWatchStream => 'مشاهدة البث';

  @override
  String get voiceStopWatching => 'إيقاف المشاهدة';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'إيقاف مشاهدة البث الحالي';

  @override
  String get voiceOwnScreenShareTitle => 'أنت تبث';

  @override
  String get voiceOwnScreenShareSubtitle => 'البث الخاص بك مباشر للمشاركين.';

  @override
  String get voiceLiveBadge => 'بث مباشر';

  @override
  String get dmVoiceViewCall => 'عرض المكالمة';

  @override
  String get dmVoiceCallFullScreen => 'ملء الشاشة';

  @override
  String get dmVoiceCallFullScreenTooltip => 'فتح المكالمة بملء الشاشة';

  @override
  String get dmVoiceStripStatusConnecting => 'جارٍ الاتصال…';

  @override
  String get dmVoiceStripStatusInCall => 'في مكالمة';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'مكالمة صوتية';

  @override
  String get dmVoiceCallBarConnecting => 'جارٍ الاتصال…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'مكالمة مباشرة';

  @override
  String get dmVoiceCallBarGroupPrimary => 'مكالمة جماعية';

  @override
  String get dmVoiceCallBarIssueFallback => 'مشكلة صوتية';

  @override
  String get dmVoiceFullscreenTitle => 'صوتي';

  @override
  String get voiceCallBarGuildConnectedFallback => 'تم الاتصال بالصوت';

  @override
  String get notificationsPageTitle => 'الإشعارات';

  @override
  String get notificationsFilterUnreads => 'غير مقروءة';

  @override
  String get notificationsFilterMentions => 'الإشارات';

  @override
  String get notificationsBookmarksTooltip => 'الإشارات المرجعية';

  @override
  String get notificationsMentionFilterTooltip => 'تصفية الإشارات';

  @override
  String get notificationsMentionFiltersTitle => 'مرشحات الإشارات';

  @override
  String get notificationsMentionIncludeEveryone =>
      'تضمين إشارة @everyone و @here';

  @override
  String get notificationsMentionIncludeRoles => 'تضمين إشارات الأدوار';

  @override
  String get notificationsMentionIncludeGuilds => 'تضمين جميع إشارات المجتمعات';

  @override
  String get notificationsNoUnreadTitle => 'لا توجد رسائل غير مقروءة';

  @override
  String get notificationsNoUnreadBody => 'لقد انتهيت من كل شيء.';

  @override
  String get notificationsNoMentionsTitle => 'لا توجد إشارات حديثة';

  @override
  String get notificationsNoMentionsBody =>
      'ستظهر جميع الإشارات @ لك هنا لمدة 7 أيام.';

  @override
  String get notificationsMentionsEndTitle => 'لقد وصلت إلى النهاية';

  @override
  String get notificationsMentionsEndBody =>
      'لقد رأيت جميع إشاراتك الحديثة. لا تقلق، ستظهر المزيد هنا قريبًا.';

  @override
  String get notificationsJump => 'انتقل';

  @override
  String get notificationsRemoveMentionTooltip => 'إزالة الإشارة';

  @override
  String get notificationsViewAllUnread => 'عرض كل غير المقروء';

  @override
  String get notificationsMarkAsRead => 'وضع علامة كمقروء';

  @override
  String get notificationsExpand => 'توسيع';

  @override
  String get notificationsCollapse => 'طي';

  @override
  String get notificationsMessageUnavailable => 'لم يتم تحميل هذه الرسالة.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining حرفًا متبقيًا';
  }

  @override
  String get characterCounterTooLong => 'الرسالة طويلة جدًا';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining حرفًا متبقيًا. احصل على $productName للكتابة بما يصل إلى $premiumMaxLength حرفًا.';
  }

  @override
  String get chatMessageFailedToSend => 'فشل إرسال الرسالة';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'لم يتم تسليم رسالتك. عادةً ما يكون ذلك بسبب عدم وجود مجتمع مشترك مع المستلم أو أن المستلم يقبل الرسائل المباشرة من الأصدقاء فقط. قد تحتاج أيضًا إلى تعديل إعدادات خصوصية الرسائل المباشرة الخاصة بك في $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'لم يتم تسليم رسالتك. تحتاج إلى المطالبة بحسابك لإرسال الرسائل المباشرة.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'لم يتم تسليم رسالتك. تحتاج إلى المطالبة بحسابك لإرسال الرسائل.';

  @override
  String get chatSendFailureContentBlocked =>
      'لم يتم تسليم رسالتك لأنها تم تمييزها بواسطة أنظمة الأمان لدينا. إذا كنت تعتقد أن هذا خطأ، فيرجى الاتصال بالدعم.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'لم يتم تسليم رسالتك لأنها تحتوي على رموز تعبيرية أو ملصقات ناضجة غير مسموح بها في هذا السياق.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'يمكنك رؤية هذه الرسالة فقط.';

  @override
  String get chatClientSystemDismiss => 'رفض';

  @override
  String get privacyDashboardCommunicationSection => 'التواصل';

  @override
  String get chatMessageDeleteFailed => 'فشل حذف الرسالة';

  @override
  String get chatMessageAddReaction => 'إضافة رد فعل';

  @override
  String get chatMessageEdit => 'تعديل الرسالة';

  @override
  String get chatMessageReply => 'رد';

  @override
  String get chatMessageForward => 'إعادة توجيه';

  @override
  String get forwardMessageTitle => 'إعادة توجيه الرسالة';

  @override
  String get forwardSearchHint => 'البحث عن قنوات أو رسائل مباشرة';

  @override
  String get forwardDirectMessagesSection => 'الرسائل المباشرة';

  @override
  String get forwardCommentHint => 'إضافة تعليق (اختياري)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'إرسال ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'لم يتم العثور على قنوات';

  @override
  String get forwardSuccessToast => 'تمت إعادة توجيه الرسالة';

  @override
  String get forwardFailed => 'فشل إعادة توجيه الرسالة';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'التعليقات غير متاحة لأن قناة محددة لديها وضع بطيء مفعل.';

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
  String get forwardDestinationNoSendPermission => 'لا يمكنك إرسال رسائل هنا';

  @override
  String get forwardDestinationNoEmbedPermission => 'لا يمكنك تضمين روابط هنا';

  @override
  String get forwardDestinationNoAttachPermission => 'لا يمكنك إرفاق ملفات هنا';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'تم تعطيل إرسال الرسائل في هذا المجتمع';

  @override
  String get forwardDestinationTimedOut => 'أنت في فترة انتظار في هذا المجتمع';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'وضع بطيء - انتظر $remaining';
  }

  @override
  String get chatMessageCopyText => 'نسخ الرسالة';

  @override
  String get chatMessageSpeak => 'Speak message';

  @override
  String get chatMessageStopSpeaking => 'Stop speaking';

  @override
  String get chatMessagePin => 'تثبيت الرسالة';

  @override
  String get chatMessageUnpin => 'إلغاء تثبيت الرسالة';

  @override
  String get chatMessageUnpinIt => 'إلغاء تثبيتها';

  @override
  String get chatMessageBookmark => 'حفظ الرسالة';

  @override
  String get chatMessageRemoveBookmark => 'إزالة الحفظ';

  @override
  String get chatMessageMarkAsUnread => 'وضع علامة كغير مقروءة';

  @override
  String get chatMessageCopyMessageLink => 'نسخ رابط الرسالة';

  @override
  String get chatMessageCopyMessageId => 'نسخ معرف الرسالة';

  @override
  String get chatMessageViewReactions => 'عرض ردود الفعل';

  @override
  String get chatMessageRemoveAllReactions => 'إزالة جميع ردود الفعل';

  @override
  String get chatMessageDebug => 'تصحيح الرسالة';

  @override
  String get chatMessageDebugSheetTitle => 'تصحيح الرسالة';

  @override
  String get chatMessageDebugCopyJson => 'نسخ JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'تم نسخ JSON الرسالة إلى الحافظة';

  @override
  String get chatReactionsSheetTitle => 'ردود الفعل';

  @override
  String get chatReactionsSheetEmpty => 'لم يقم أحد بالرد على هذا بعد.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'الإبلاغ عن الرسالة';

  @override
  String get iarReportMessageTitle => 'الإبلاغ عن الرسالة';

  @override
  String get iarThisUserFallback => 'هذا المستخدم';

  @override
  String get iarModalDescription =>
      'الإبلاغ عن انتهاك للقواعد، أو العثور على أدوات لإدارة جهات الاتصال والتفضيلات.';

  @override
  String get iarPathStepAriaLabel => 'ماذا تحتاج؟';

  @override
  String get iarCategoryStepTitle => 'ما نوع القاعدة التي تم كسرها؟';

  @override
  String get iarReasonStepTitle => 'ما القاعدة التي تم كسرها؟';

  @override
  String get iarReasonSelectHint => 'اختر سببًا';

  @override
  String get iarPickAnOptionToast => 'اختر خيارًا للمتابعة.';

  @override
  String get iarPickARuleToast => 'اختر القاعدة التي تم كسرها.';

  @override
  String get iarPathPlatform => 'الإبلاغ عن انتهاك لقواعد المنصة';

  @override
  String get iarPathCommunity => 'الإبلاغ لمشرفي هذا المجتمع';

  @override
  String get iarPathPreferenceMessage => 'لا يعجبني هذا المحتوى';

  @override
  String get iarCategoryTargetedHarmLabel => 'التهديدات أو المضايقات أو الأذى';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'التنمر أو التهديدات أو الكراهية أو العنف أو الغارات أو المحتوى الذي يشجع على إيذاء النفس.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'سلامة الأطفال أو المحتوى غير اللائق';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'الأطفال في خطر، أو محتوى غير لائق في المكان الخطأ، أو سلوك غير مرغوب فيه.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'الخصوصية أو انتحال الشخصية';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'نشر معلومات خاصة، أو التتبع، أو انتحال شخصية شخص آخر، أو ملف شخصي غير لائق.';

  @override
  String get iarCategoryDeceptionLabel =>
      'عمليات الاحتيال أو البرامج الضارة أو المعلومات المضللة';

  @override
  String get iarCategoryDeceptionDescription =>
      'التصيد الاحتيالي، أو الاحتيال، أو الروابط الضارة، أو الادعاءات الكاذبة التي قد تسبب ضررًا في العالم الحقيقي.';

  @override
  String get iarCategoryIllegalOtherLabel => 'نشاط غير قانوني أو شيء آخر';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'مبيعات غير قانونية، أو تسهيل جرائم، أو انتهاك واضح للقواعد لا يندرج تحت الفئات المذكورة أعلاه.';

  @override
  String get iarReasonHarassmentLabel => 'مضايقة أو تهديدات';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'التنمر، أو الاتصال المتكرر غير المرغوب فيه، أو التتبع، أو الإساءة الموجهة.';

  @override
  String get iarReasonHateLabel => 'خطاب الكراهية';

  @override
  String get iarReasonHateMessageDescription =>
      'الشتائم، أو اللغة المهينة، أو الهجمات على مجموعات محمية.';

  @override
  String get iarReasonViolenceLabel => 'عنف أو تهديدات عنيفة';

  @override
  String get iarReasonViolenceDescription =>
      'تهديدات موثوقة، أو عنف تصويري، أو تمجيد للعنف.';

  @override
  String get iarReasonMatureContentLabel => 'محتوى غير لائق أو مضايقة';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'سلوك غير مرغوب فيه أو محتوى غير لائق في المكان الخطأ.';

  @override
  String get iarReasonChildSafetyLabel => 'سلامة الأطفال أو استغلال القاصرين';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'محتوى يتعلق بالاستدراج أو استغلال الأطفال.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'معلومات مضللة ضارة';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'ادعاءات كاذبة من المحتمل أن تسبب ضررًا في العالم الحقيقي.';

  @override
  String get iarReasonSpamLabel =>
      'بريد عشوائي، عمليات احتيال، أو تصيد احتيالي';

  @override
  String get iarReasonSpamMessageDescription =>
      'بريد عشوائي جماعي، احتيال، هدايا وهمية، أو إساءة استخدام للحساب.';

  @override
  String get iarReasonMalwareLabel => 'برامج ضارة أو روابط خطرة';

  @override
  String get iarReasonMalwareDescription =>
      'برامج ضارة، سرقة بيانات اعتماد، أو ملفات ضارة.';

  @override
  String get iarReasonPrivacyLabel => 'انتهاك الخصوصية';

  @override
  String get iarReasonPrivacyDescription =>
      'نشر معلومات خاصة، أو كشف معلومات خاصة، أو تتبع.';

  @override
  String get iarReasonImpersonationLabel => 'انتحال شخصية أو وسائط خادعة';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'انتحال شخصية شخص آخر، بما في ذلك المحتوى الذي تم إنشاؤه بواسطة الذكاء الاصطناعي بشكل خادع.';

  @override
  String get iarReasonIllegalLabel => 'نشاط غير قانوني';

  @override
  String get iarReasonIllegalDescription =>
      'مبيعات غير قانونية، أو تسهيل جرائم، أو نشاط غير قانوني.';

  @override
  String get iarReasonSelfHarmLabel => 'إيذاء النفس أو الانتحار';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'الترويج أو التعليمات التي تشجع على إيذاء النفس أو اضطرابات الأكل.';

  @override
  String get iarReasonOtherLabel => 'انتهاك واضح آخر للقواعد';

  @override
  String get iarReasonOtherDescription =>
      'استخدم هذا فقط إذا كان ينتهك بوضوح قواعد Fluxer ولا يندرج تحت الفئات المذكورة أعلاه.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'إذا كان هناك قاصر متورط، استخدم \"$childSafetyReason\" بدلاً من ذلك.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'إذا كان هذا يتعلق بـ CSAM أو استغلال قاصر، فأرسله الآن ولا تشارك المادة مرة أخرى.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'إذا كان شخص ما في خطر وشيك، فاتصل بخدمات الطوارئ المحلية إذا كان بإمكانك القيام بذلك بأمان.';

  @override
  String get iarSafetyNoteViolence =>
      'إذا كان هذا تهديدًا وشيكًا وموثوقًا، فاتصل بخدمات الطوارئ المحلية أيضًا.';

  @override
  String get iarSafetyNoteTerrorism =>
      'إذا كان هذا تهديدًا إرهابيًا وشيكًا، فاتصل بخدمات الطوارئ المحلية أيضًا.';

  @override
  String get iarActionBlockUserTitle => 'حظر هذا المستخدم';

  @override
  String get iarActionBlockUserDescription => 'إيقاف الرسائل وطلبات الصداقة.';

  @override
  String get iarActionBlockUserButton => 'حظر';

  @override
  String get iarActionCopyMessageLinkTitle => 'نسخ رابط الرسالة';

  @override
  String get iarActionCopyMessageLinkDescription => 'شارك مع مشرفي المجتمع.';

  @override
  String get iarActionCopyMessageLinkButton => 'نسخ';

  @override
  String get iarActionCloseDmTitle => 'إغلاق هذه الرسالة المباشرة';

  @override
  String get iarActionCloseDmDescription =>
      'لا يؤدي إلى الحظر. يمكنك إعادة الفتح لاحقًا.';

  @override
  String get iarActionCloseDmButton => 'إغلاق الرسالة المباشرة';

  @override
  String get iarActionLeaveCommunityTitle => 'مغادرة المجتمع';

  @override
  String get iarActionLeaveCommunityDescription =>
      'التوقف عن رؤية محتواه وأعضائه.';

  @override
  String get iarActionLeaveCommunityButton => 'مغادرة';

  @override
  String get iarActionDmSettingsTitle =>
      'إعدادات الرسائل المباشرة وطلبات الصداقة';

  @override
  String get iarActionDmSettingsDescription => 'تغيير من يمكنه التواصل معك.';

  @override
  String get iarActionCallSettingsTitle =>
      'إعدادات المكالمات والدردشة الجماعية';

  @override
  String get iarActionCallSettingsDescription =>
      'تغيير من يمكنه الاتصال بك أو إضافتك.';

  @override
  String get iarActionOpenButton => 'فتح';

  @override
  String get iarActionDeleteMessageTitle => 'حذف هذه الرسالة';

  @override
  String get iarActionDeleteMessageDescription => 'إزالتها من القناة للجميع.';

  @override
  String get iarActionDeleteMessageButton => 'حذف';

  @override
  String get iarActionDeleteMessageDeletedButton => 'تم الحذف';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'تم حذف هذه الرسالة بالفعل.';

  @override
  String get iarActionBanUserTitle => 'حظر هذا المستخدم';

  @override
  String get iarActionBanUserDescription => 'فتح حوار الحظر لهذا المجتمع.';

  @override
  String get iarActionBanUserButton => 'حظر';

  @override
  String get iarActionBanUserBannedButton => 'تم الحظر';

  @override
  String get iarActionBanUserBannedTooltip =>
      'تم حظر هذا المستخدم بالفعل من المجتمع.';

  @override
  String get iarCloseDmConfirmTitle => 'إغلاق الرسالة المباشرة';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'إغلاق رسالتك المباشرة الحالية مع $name. هذا لا يحظرهم؛ يمكنك إعادة الفتح لاحقًا.';
  }

  @override
  String get iarSuccessTitle => 'تم إرسال البلاغ';

  @override
  String get iarSuccessBody =>
      'يقوم فريق السلامة لدينا بمراجعته. سنرسل لك رسالة مباشرة وبريدًا إلكترونيًا بمجرد التوصل إلى قرار.';

  @override
  String get iarAlreadyReportedTitle => 'تم الإبلاغ عنه بالفعل';

  @override
  String get iarAlreadyReportedBody =>
      'لقد أبلغت عن هذه الرسالة بالفعل. يقوم فريق السلامة لدينا بمراجعته.';

  @override
  String get iarBackButton => 'رجوع';

  @override
  String get iarContinueButton => 'متابعة';

  @override
  String get iarSendReportButton => 'إرسال البلاغ';

  @override
  String get iarDoneButton => 'تم';

  @override
  String get iarCouldntSendToast =>
      'تعذر إرسال البلاغ. يرجى المحاولة مرة أخرى.';

  @override
  String get iarRateLimitedToast =>
      'أنت تبلغ بسرعة كبيرة. يرجى الانتظار لحظة والمحاولة مرة أخرى.';

  @override
  String get iarReportSentToast =>
      'تم إرسال البلاغ. سيقوم فريق السلامة لدينا بمراجعته.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'هل تريد حظر $name؟ لن يتمكنوا من مراسلتك أو إرسال طلبات صداقة إليك. يمكنك إلغاء حظرهم لاحقًا.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'تعذر حظر هذا المستخدم. يرجى المحاولة مرة أخرى.';

  @override
  String get iarCloseDmSuccessToast => 'تم إغلاق الرسالة المباشرة.';

  @override
  String get iarCloseDmFailedToast =>
      'تعذر إغلاق هذه الرسالة المباشرة. يرجى المحاولة مرة أخرى.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'تعذر مغادرة هذا المجتمع. يرجى المحاولة مرة أخرى.';

  @override
  String get chatMessageSuppressEmbeds => 'كبت المعاينات';

  @override
  String get chatMessageUnsuppressEmbeds => 'إظهار المعاينات';

  @override
  String get chatMessageDelete => 'حذف الرسالة';

  @override
  String get chatMessageDeleteConfirmTitle => 'حذف الرسالة';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'هل أنت متأكد أنك تريد حذف هذه الرسالة؟';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'المزيد';

  @override
  String get chatEditingMessage => 'جاري تعديل الرسالة';

  @override
  String get chatReplyOriginalDeleted => 'تم حذف الرسالة الأصلية';

  @override
  String get chatReplyOriginalFailedToLoad => 'فشل تحميل الرسالة الأصلية';

  @override
  String get chatReplyAttachedMedia => 'تحتوي الرسالة على وسائط مرفقة';

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
  String get chatMessagesLoadError => 'تعذر تحميل الرسائل.';

  @override
  String get chatReplyMentionOverrideTitle => 'تجاوز تفضيل الإشارة؟';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'يفضل $authorNickname الإشارة إليه في الردود. هل تريد الإرسال بدون الإشارة على أي حال؟';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return 'يفضل $authorNickname الردود بدون إشارة. هل تريد الإرسال مع الإشارة على أي حال؟';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'تجاهل التفضيل';

  @override
  String get chatReplyMentionDisableTooltip =>
      'انقر لتعطيل تنبيه المستخدم الذي ترد عليه.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'انقر لتمكين تنبيه المستخدم الذي ترد عليه.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'الإشارة إلى المستخدم الذي تم الرد عليه';

  @override
  String get chatReplyMentionOn => 'تشغيل';

  @override
  String get chatReplyMentionOff => 'إيقاف';

  @override
  String get chatReplyCancel => 'إلغاء الرد';

  @override
  String get chatEditMessageHint => 'تعديل الرسالة';

  @override
  String get chatEditNoChanges => 'لا توجد تغييرات للحفظ';

  @override
  String get chatChannelNotReady =>
      'هذه القناة غير جاهزة بعد. حاول مرة أخرى بعد لحظة.';

  @override
  String get chatMessageEdited => '(مُعدّل)';

  @override
  String get chatMessageSilent => 'كانت هذه رسالة @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'اليوم في $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'أمس في $time';
  }

  @override
  String get mediaViewerImagePreview => 'معاينة الصورة';

  @override
  String get mediaViewerClose => 'إغلاق عارض الوسائط';

  @override
  String get mediaViewerOpenInBrowser => 'فتح في المتصفح';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'إعادة توجيه';

  @override
  String get mediaViewerZoomIn => 'تكبير';

  @override
  String get mediaViewerZoomOut => 'تصغير';

  @override
  String get mediaViewerPreviousAttachment => 'المرفق السابق';

  @override
  String get mediaViewerNextAttachment => 'المرفق التالي';

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
  String get chatAttachmentVideoToggleControls => 'تبديل عناصر تحكم الفيديو';

  @override
  String get chatAttachmentVideoMute => 'كتم صوت الفيديو';

  @override
  String get chatAttachmentVideoUnmute => 'إلغاء كتم صوت الفيديو';

  @override
  String get chatAttachmentVideoPlay => 'تشغيل الفيديو';

  @override
  String get chatAttachmentVideoPause => 'إيقاف مؤقت للفيديو';

  @override
  String get chatAttachmentVideoProgress => 'تقدم الفيديو';

  @override
  String get chatVideoPlaybackFailed => 'تعذر تشغيل هذا الفيديو.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'إخطار المستخدمين بهذا الدور الذين لديهم إذن لعرض هذه القناة.';

  @override
  String get addGuildModalTitle => 'إضافة مجتمع';

  @override
  String get addGuildModalLandingDescription =>
      'إنشاء مجتمع جديد أو الانضمام إلى مجتمع موجود.';

  @override
  String get addGuildCreateCommunity => 'إنشاء مجتمع';

  @override
  String get addGuildJoinCommunity => 'الانضمام إلى مجتمع';

  @override
  String get addGuildImportDiscordTemplate => 'استيراد قالب Discord';

  @override
  String get addGuildJoinTitle => 'الانضمام إلى مجتمع';

  @override
  String get addGuildJoinDescription => 'أدخل رابط الدعوة للانضمام إلى مجتمع.';

  @override
  String get addGuildInviteLinkLabel => 'رابط الدعوة';

  @override
  String get addGuildJoinSubmit => 'الانضمام إلى المجتمع';

  @override
  String get addGuildInviteInvalid => 'هذه الدعوة غير صالحة أو انتهت صلاحيتها.';

  @override
  String get addGuildJoinFailed =>
      'تعذر الانضمام إلى المجتمع. يرجى المحاولة مرة أخرى.';

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
  String get addGuildPackInstalled => 'تم تثبيت الحزمة بنجاح.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'إزالة جميع ردود الفعل';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'هل أنت متأكد أنك تريد إزالة جميع ردود الفعل من هذه الرسالة؟';

  @override
  String get chatMessageUnpinConfirmTitle => 'إلغاء تثبيت الرسالة';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'هل تريد إعادة هذه الرسالة المثبتة إلى وقت سابق؟';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return 'قام $username بتثبيت $messageLink في هذه القناة. عرض $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'رسالة';

  @override
  String get systemPinMessageAllPinsLink => 'كل الرسائل المثبتة';

  @override
  String get channelPinsEmptyTitle => 'لا توجد رسائل مثبتة';

  @override
  String get channelPinsEmptyDescription => 'ستظهر الرسائل المثبتة هنا.';

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
  String get personalNotesTitle => 'ملاحظات شخصية';

  @override
  String get personalNotesSubtitle => 'مساحتك الخاصة للأفكار والتذكيرات';

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
    return 'مرحباً بك في $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'في البداية، لم يكن هناك شيء. ثم، كان هناك $channelName. وكان ذلك جيداً.';
  }

  @override
  String get personalNotesComposerHint => 'أرسل رسالة لنفسك';

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
  String get personalNotesPrivateSpace => 'مساحتك الخاصة';

  @override
  String get purgePersonalNotes => 'مسح الملاحظات الشخصية';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'سيؤدي هذا إلى حذف كل رسالة ومرفق بشكل دائم في ملاحظاتك الشخصية. لا يمكن التراجع عن هذا.';

  @override
  String get purgePersonalNotesConfirmButton => 'مسح';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'تم مسح $count رسالة من الملاحظات الشخصية';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'كانت الملاحظات الشخصية فارغة بالفعل';

  @override
  String get purgePersonalNotesFailed => 'تعذر مسح الملاحظات الشخصية';

  @override
  String get userSettingsGroupYourAccount => 'حسابك';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'الملف الشخصي';

  @override
  String get userSettingsNavSecurityLogin => 'الأمان وتسجيل الدخول';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'الهدايا والرموز';

  @override
  String get userSettingsNavPrivacyDashboard => 'لوحة تحكم الخصوصية';

  @override
  String get userSettingsNavAuthorizedApps => 'التطبيقات المصرح بها';

  @override
  String get userSettingsNavBlockedUsers => 'المستخدمون المحظورون';

  @override
  String get userSettingsNavLinkedDevices => 'الأجهزة المرتبطة';

  @override
  String get userSettingsNavConnections => 'الاتصالات';

  @override
  String get userSettingsNavLookAndFeel => 'المظهر';

  @override
  String get userSettingsNavAccessibility => 'إمكانية الوصول';

  @override
  String get userSettingsNavChat => 'الرسائل والوسائط';

  @override
  String get userSettingsNavAudioAndVideo => 'الصوت والفيديو';

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
  String get userSettingsNavLanguageAndTime => 'اللغة والوقت';

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
  String get userSettingsNavAdvanced => 'خيارات متقدمة';

  @override
  String get advancedPerformanceReportingTitle => 'تقارير الأداء';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'ساعد في تحسين Fluxer عن طريق مشاركة بيانات الأعطال والأداء المجهولة.';

  @override
  String get advancedPerformanceReportingLabel =>
      'إرسال تقارير الأعطال والأداء';

  @override
  String get advancedPerformanceReportingDescription =>
      'جميع البيانات المبلغ عنها مجهولة ويتم إرسالها فقط إلى خدمة المراقبة الخاصة بـ Fluxer - لا يتم استخدام أي مزودين خارجيين.';

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
  String get advancedSettingShowNekoLabel => 'Show Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko cat that chases your cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Show Neko on your chat input';

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
  String get userSettingsNavApplications => 'التطبيقات';

  @override
  String get userSettingsNavAppLogs => 'سجلات التطبيق';

  @override
  String get userSettingsNavDeveloperTools => 'أدوات المطور';

  @override
  String get userSettingsNavLimitsConfig => 'تكوين الحدود';

  @override
  String get userSettingsNavFeatureFlags => 'علامات الميزات';

  @override
  String get userSettingsNavWhatsNew => 'ما الجديد';

  @override
  String get userSettingsNavLogOut => 'تسجيل الخروج';

  @override
  String get quickSwitcherTabSearch => 'بحث';

  @override
  String get quickSwitcherTabFriends => 'الأصدقاء';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'ابحث عن قنوات أو أشخاص أو مجتمعات';

  @override
  String get quickSwitcherSearchFriends => 'بحث عن الأصدقاء';

  @override
  String get quickSwitcherNoMatchesFound => 'لم يتم العثور على مطابقات';

  @override
  String get quickSwitcherEmptyHint =>
      'جرّب اسمًا مختلفًا أو استخدم البادئات @ / # / ! / * لتصفية النتائج.';

  @override
  String get quickSwitcherSectionPeople => 'الأشخاص';

  @override
  String get quickSwitcherSectionGroupMessages => 'رسائل جماعية';

  @override
  String get quickSwitcherSectionTextChannels => 'قنوات نصية';

  @override
  String get quickSwitcherSectionVoiceChannels => 'قنوات صوتية';

  @override
  String get quickSwitcherSectionCommunities => 'مجتمعات';

  @override
  String get quickSwitcherSectionSettings => 'إعدادات';

  @override
  String get quickSwitcherHomeLabel => 'الرئيسية';

  @override
  String get quickSwitcherDirectMessagesLabel => 'رسائل مباشرة';

  @override
  String get quickSwitcherFavoritesLabel => 'المفضلة';

  @override
  String get quickSwitcherUserSettingsLabel => 'إعدادات المستخدم';

  @override
  String get quickSwitcherNotificationsLabel => 'الإشعارات';

  @override
  String get quickSwitcherBookmarksLabel => 'الإشارات المرجعية';

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
  String get quickSwitcherMentionsLabel => 'الإشارات';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'لا يوجد أصدقاء بعد';

  @override
  String get quickSwitcherFriendsEmptyHint => 'أضف صديقًا للبدء.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'لا يوجد أصدقاء يطابقون هذا البحث';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'جرّب اسمًا مختلفًا.';

  @override
  String get quickSwitcherSearchAliasUser => 'مستخدم';

  @override
  String get quickSwitcherSearchAliasYou => 'أنت';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'رسائل مباشرة';

  @override
  String get quickSwitcherSearchAliasMessages => 'رسائل';

  @override
  String get quickSwitcherSearchAliasFav => 'مفضل';

  @override
  String get quickSwitcherSearchAliasStarred => 'مميز بنجمة';

  @override
  String get quickSwitcherSearchAliasInbox => 'صندوق الوارد';

  @override
  String get quickSwitcherSearchAliasSaved => 'محفوظ';

  @override
  String get uiClose => 'إغلاق';

  @override
  String get chatJumpToBottom => 'الانتقال إلى الأسفل';

  @override
  String get uiConfirm => 'تأكيد';

  @override
  String get uiLoading => 'جارٍ التحميل';

  @override
  String get uiUnsavedChanges => 'تغييرات غير محفوظة';

  @override
  String get uiReset => 'إعادة تعيين';

  @override
  String get uiOpenColorPicker => 'فتح منتقي الألوان';

  @override
  String get uiSelectPlaceholder => 'تحديد';

  @override
  String get uiSearchPlaceholder => 'بحث';

  @override
  String get uiNoOptionsFound => 'لم يتم العثور على خيارات';

  @override
  String get uiDismissNotification => 'رفض الإشعار';

  @override
  String get uiColorPickerTitle => 'منتقي الألوان';

  @override
  String get mentionConfirmTitle => 'الإشارة إلى الجميع؟';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'سيؤدي هذا إلى إخطار $count عضوًا. هل تريد المتابعة؟';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'سيؤدي هذا إلى إخطار $count عضوًا متصلًا بالإنترنت. هل تريد المتابعة؟';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'الإشارة';

  @override
  String get composerEmojiUnavailable =>
      'لا يمكنك استخدام هذا الرمز التعبيري هنا.';

  @override
  String get instanceUrlLabel => 'عنوان URL للمثيل';

  @override
  String get instanceUrlPlaceholder => 'أدخل عنوان URL للمثيل (مثل fluxer.app)';

  @override
  String get resetToDefaultInstance => 'إعادة الضبط إلى Fluxer';

  @override
  String get instanceConnect => 'اتصال';

  @override
  String get instanceConnecting => 'جارٍ الاتصال…';

  @override
  String get instanceConnectFailed => 'فشل الاتصال بالخادم';

  @override
  String get recentInstances => 'الخوادم الأخيرة';

  @override
  String removeRecentInstance(String domain) {
    return 'إزالة $domain من الخوادم الأخيرة';
  }

  @override
  String get instanceSheetTitle => 'الاتصال بخادم';

  @override
  String get connectToDifferentInstance => 'الاتصال بخادم مختلف';

  @override
  String get changeInstance => 'تغيير';

  @override
  String get instanceConnectionRequired => 'اتصل بالخادم لتسجيل الدخول';

  @override
  String get comingSoon => 'قريبًا';

  @override
  String get guildNavbarDirectMessages => 'الرسائل المباشرة';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'استكشاف المجتمعات القابلة للاكتشاف';

  @override
  String get discoveryExplore => 'استكشاف';

  @override
  String get discoveryExplorePublicCommunities => 'استكشاف المجتمعات العامة';

  @override
  String get discoveryListingSubheading =>
      'هل ترغب في إدراج مجتمعك هنا؟ قدم طلبًا إذا كنت تستوفي المتطلبات في إعدادات مجتمعك > الاستكشاف.';

  @override
  String get discoverySearchCommunities => 'البحث عن المجتمعات';

  @override
  String get discoveryFilterByLanguage => 'التصفية حسب اللغة';

  @override
  String get discoveryAllLanguages => 'كل اللغات';

  @override
  String get discoveryAllCategories => 'الكل';

  @override
  String get discoveryCategoryGaming => 'ألعاب';

  @override
  String get discoveryCategoryMusic => 'موسيقى';

  @override
  String get discoveryCategoryEntertainment => 'ترفيه';

  @override
  String get discoveryCategoryEducation => 'تعليم';

  @override
  String get discoveryCategoryScienceAndTechnology => 'علوم وتكنولوجيا';

  @override
  String get discoveryCategoryContentCreator => 'صانع المحتوى';

  @override
  String get discoveryCategoryAnimeAndManga => 'أنمي ومانغا';

  @override
  String get discoveryCategoryMoviesAndTv => 'أفلام ومسلسلات';

  @override
  String get discoveryCategoryOther => 'أخرى';

  @override
  String get discoveryNoCommunitiesMatch => 'لا توجد مجتمعات مطابقة.';

  @override
  String get discoveryJoinCommunity => 'انضم إلى المجتمع';

  @override
  String get discoveryJoined => 'منضم';

  @override
  String discoveryOnlineCount(String count) {
    return '$count متصل';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString أعضاء',
      one: 'عضو واحد',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'لا يوجد وصف.';

  @override
  String get discoveryCommunities => 'المجتمعات';

  @override
  String get discoveryApps => 'التطبيقات';

  @override
  String get discoveryJoinErrorGenericTitle => 'تعذر الانضمام إلى هذا المجتمع';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'حدث خطأ ما. يرجى المحاولة مرة أخرى بعد لحظة.';

  @override
  String get discoveryJoinErrorFullTitle => 'هذا المجتمع ممتلئ';

  @override
  String get discoveryJoinErrorFullMessage =>
      'لقد وصل هذا المجتمع إلى الحد الأقصى لعدد الأعضاء، لذا لا يمكنك الانضمام الآن.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'لقد وصلت إلى الحد الأقصى للمجتمعات';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'أنت في الحد الأقصى لعدد المجتمعات. اترك واحدًا وحاول مرة أخرى.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'لا يمكنك الانضمام إلى هذا المجتمع';

  @override
  String get discoveryJoinErrorBannedMessage => 'لقد تم حظرُك من هذا المجتمع.';

  @override
  String get discoveryJoinErrorNotAvailableTitle => 'هذا المجتمع لم يعد متاحًا';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'ربما غادر المجتمع قسم الاكتشاف أو ألغى استقبال الأعضاء الجدد. قم بتحديث الصفحة ولن تراه مرة أخرى.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'أنت تسرع كثيرًا';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'يرجى الانتظار لحظة والمحاولة مرة أخرى.';

  @override
  String get guildNavbarAddCommunity => 'إضافة مجتمع';

  @override
  String get guildNavbarHelp => 'مساعدة';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'رسالة جديدة';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'طي $folderName';
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
  String get guildNavbarGroupDm => 'رسالة جماعية خاصة';

  @override
  String get guildNavbarCreateChannel => 'إنشاء قناة';

  @override
  String get guildNavbarChannelType => 'نوع القناة';

  @override
  String get guildNavbarTextChannel => 'قناة نصية';

  @override
  String get guildNavbarTextChannelDescription =>
      'إرسال رسائل وصور وملفات GIF ورموز تعبيرية';

  @override
  String get guildNavbarVoiceChannel => 'قناة صوتية';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'تواصلوا معًا بالصوت والفيديو ومشاركة الشاشة';

  @override
  String get guildNavbarLinkChannel => 'ربط قناة';

  @override
  String get guildNavbarLinkChannelDescription =>
      'وصول سريع إلى موقع خارجي أو مورد';

  @override
  String get guildNavbarNameLabel => 'الاسم';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'إنشاء فئة';

  @override
  String get guildNavbarNewCategoryHint => 'فئة جديدة';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'دعوة الأصدقاء إلى $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'سيتم توجيه المستلمين إلى #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'البحث عن الأصدقاء';

  @override
  String get guildNavbarNoFriendsYet => 'لا يوجد أصدقاء بعد';

  @override
  String get guildNavbarNoResults => 'لا توجد نتائج';

  @override
  String get guildNavbarInviteLinkPrompt => 'أو، أرسل رابط دعوة لصديق:';

  @override
  String get guildNavbarInviteLink => 'رابط الدعوة';

  @override
  String get guildNavbarCopy => 'نسخ';

  @override
  String get guildNavbarCopied => 'تم النسخ!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'ينتهي رابط دعوتك خلال 7 أيام.';

  @override
  String get guildNavbarInviteNeverExpires => 'رابط الدعوة هذا لا ينتهي أبدًا.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'ينتهي رابط دعوتك خلال $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'تعديل رابط الدعوة';

  @override
  String get guildNavbarInviteLinkSettings => 'إعدادات رابط الدعوة';

  @override
  String get guildNavbarExpireAfter => 'انتهاء بعد';

  @override
  String get guildNavbarMaxUses => 'الحد الأقصى لعدد الاستخدامات';

  @override
  String get guildNavbarGrantTemporaryMembership => 'منح عضوية مؤقتة';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'سيتم إزالة الأعضاء عند عدم الاتصال بالإنترنت ما لم يتم تعيين دور';

  @override
  String get guildNavbarCreateNewLink => 'إنشاء رابط جديد';

  @override
  String get guildNavbarSent => 'تم الإرسال';

  @override
  String get guildNavbarInvite => 'دعوة';

  @override
  String get guildNavbarLeaveCommunityTitle => 'مغادرة المجتمع';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'هل أنت متأكد أنك تريد مغادرة هذا المجتمع؟ لن تتمكن من رؤية أي رسائل بعد الآن.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'مغادرة المجتمع';

  @override
  String get guildNavbarDeleteMyMessagesTitle => 'حذف رسائلك في هذا المجتمع؟';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'حذف نهائي لكل رسالة أرسلتها هنا، عبر كل القنوات. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'حذف رسائلي';

  @override
  String get guildNavbarDeletedYourMessages => 'تم حذف رسائلك';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => 'تعذر حذف رسائلك';

  @override
  String get guildNavbarRemoveOverride => 'إزالة تجاوز';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'كتم حتى $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible => 'متاح لموظفي Fluxer فقط';

  @override
  String get guildNavbarInvitesPaused => 'الدعوات متوقفة حاليًا في هذا المجتمع';

  @override
  String get guildNavbarDurationNever => 'أبدًا';

  @override
  String get guildNavbarDuration30Minutes => '30 دقيقة';

  @override
  String get guildNavbarDuration1Hour => 'ساعة واحدة';

  @override
  String get guildNavbarDuration6Hours => '6 ساعات';

  @override
  String get guildNavbarDuration12Hours => '12 ساعة';

  @override
  String get guildNavbarDuration1Day => 'يوم واحد';

  @override
  String get guildNavbarDuration7Days => '7 أيام';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count ثانية';
  }

  @override
  String get guildNavbarNever => 'أبداً';

  @override
  String get guildNavbarNoLimit => 'بلا حدود';

  @override
  String get guildNavbarOneUse => 'استخدام واحد';

  @override
  String guildNavbarUses(int count) {
    return '$count استخدام';
  }

  @override
  String get guildMenuMarkAsRead => 'وضع علامة كمقروء';

  @override
  String get guildPeekMoreOptions => 'المزيد من الخيارات';

  @override
  String get guildMenuInviteMembers => 'دعوة الأعضاء';

  @override
  String get guildMenuCommunitySettings => 'إعدادات المجتمع';

  @override
  String get guildMenuEditCommunityProfile => 'تعديل ملف المجتمع الشخصي';

  @override
  String get guildMenuUnmuteCommunity => 'إلغاء كتم المجتمع';

  @override
  String get guildMenuMuteCommunity => 'كتم المجتمع';

  @override
  String get guildMenuHideMutedChannels => 'إخفاء القنوات المكتومة';

  @override
  String get guildMenuReportCommunity => 'الإبلاغ عن المجتمع';

  @override
  String get guildMenuDebugCommunity => 'تصحيح أخطاء المجتمع';

  @override
  String get guildMenuCopyCommunityId => 'نسخ معرف المجتمع';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'حتى $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'عام';

  @override
  String get guildMenuSettingsRoles => 'الأدوار والصلاحيات';

  @override
  String get guildMenuSettingsEmoji => 'رموز تعبيرية مخصصة';

  @override
  String get guildMenuSettingsStickers => 'ملصقات مخصصة';

  @override
  String get guildMenuSettingsSafetyModeration => 'السلامة والإشراف';

  @override
  String get guildMenuSettingsActivityLog => 'Activity Log';

  @override
  String get guildMenuSettingsWebhooks => 'خطافات الويب';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'رابط دعوة مخصص';

  @override
  String get guildMenuSettingsDiscovery => 'الاكتشاف';

  @override
  String get guildMenuSettingsMembers => 'الأعضاء';

  @override
  String get guildMenuSettingsInviteLinks => 'روابط الدعوة';

  @override
  String get guildMenuSettingsBans => 'الحظر';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'ليس لديك الإذن لعرض علامة تبويب الإعدادات هذه.';

  @override
  String get guildSettingsOverviewIconTitle => 'الأيقونة';

  @override
  String get guildSettingsUploadImage => 'تحميل صورة';

  @override
  String get guildSettingsOverviewBannerTitle => 'اللافتة';

  @override
  String get guildSettingsOverviewBannerHint => 'قم بتحميل لافتة لخادمك.';

  @override
  String get guildSettingsOverviewNameTitle => 'الاسم';

  @override
  String get guildSettingsOverviewNameHint => 'مجتمعي الرائع';

  @override
  String get guildSettingsOverviewStatsTitle => 'الإحصائيات';

  @override
  String get guildSettingsOverviewMembers => 'الأعضاء';

  @override
  String get guildSettingsOverviewOnline => 'متصلون';

  @override
  String get guildSettingsRolesDescription =>
      'استخدم الأدوار لتجميع الأعضاء وتعيين الصلاحيات.';

  @override
  String get guildSettingsCreateRole => 'إنشاء دور';

  @override
  String get guildSettingsRolesListTitle => 'الأدوار';

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
    return 'تم استخدام $staticCount رمز تعبيري ثابت، و $animatedCount رمز تعبيري متحرك';
  }

  @override
  String get guildSettingsEmojiEmpty => 'لا توجد رموز تعبيرية مخصصة بعد.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return 'تم تحميل $count ملصق';
  }

  @override
  String get guildSettingsStickersEmpty => 'لا توجد ملصقات مخصصة بعد.';

  @override
  String get guildSettingsModerationVerificationTitle => 'التحقق من الأعضاء';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'اختر ما يجب أن يمتلكه الأعضاء قبل أن يتمكنوا من النشر أو إرسال رسائل مباشرة لأعضاء المجتمع.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'يمكن للأعضاء الذين لديهم أدوار تجاوز هذه الفحوصات. بالنسبة للمساحات العامة، نوصي بتمكين التحقق.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'تتطلب المجتمعات المدرجة في الاكتشاف بريدًا إلكترونيًا تم التحقق منه على الأقل. لا يمكن تحديد \"لا شيء\" أثناء تمكين الاكتشاف.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'المحتوى الناضج وتحذيرات المحتوى';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'قم بتكوين تسمية المحتوى الناضج وتحذيرات المحتوى الاختيارية للأعضاء.';

  @override
  String get guildSettingsModerationMatureToggle => 'محتوى ناضج';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'ضع علامة على هذا المجتمع على أنه يحتوي على محتوى ناضج.';

  @override
  String get guildSettingsVerificationNone => 'لا شيء';

  @override
  String get guildSettingsVerificationNoneDescription => 'لا يلزم التحقق.';

  @override
  String get guildSettingsVerificationLow => 'منخفض';

  @override
  String get guildSettingsVerificationLowDescription =>
      'يتطلب عنوان بريد إلكتروني تم التحقق منه.';

  @override
  String get guildSettingsVerificationMedium => 'متوسط';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'يتطلب عنوان بريد إلكتروني تم التحقق منه، وحسابًا عمره 5 دقائق على الأقل.';

  @override
  String get guildSettingsVerificationHigh => 'مرتفع';

  @override
  String get guildSettingsVerificationHighDescription =>
      'يتطلب كل شيء في المتوسط، بالإضافة إلى أن تكون عضوًا في المجتمع لمدة 10 دقائق على الأقل.';

  @override
  String get guildSettingsVerificationHighest => 'مرتفع جدًا';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'يتطلب رقم هاتف تم التحقق منه.';

  @override
  String get guildSettingsAuditLogDescription =>
      'تتبع إجراءات المشرفين عبر المجتمع.';

  @override
  String get guildSettingsAuditLogEmpty => 'لا توجد سجلات بعد';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'ستظهر إجراءات الإشراف وتغييرات المجتمع هنا.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'جميع المستخدمين';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'جميع الإجراءات';

  @override
  String get guildSettingsAuditLogNoReason => 'لم يتم تقديم سبب.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'مستخدم غير معروف';

  @override
  String get guildSettingsAuditLogLoadError =>
      'حدث خطأ ما أثناء تحميل سجل النشاط.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle => 'تعذر تحميل سجلات النشاط';

  @override
  String get guildSettingsAuditLogReason => 'السبب';

  @override
  String get guildSettingsAuditLogSomeone => 'شخص ما';

  @override
  String get guildSettingsAuditLogSomething => 'شيء ما';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'كيان غير معروف';

  @override
  String get guildSettingsAuditLogNothing => 'لا شيء';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'هدف غير معروف';

  @override
  String get auditLogActionGuildUpdate => 'تم تحديث المجتمع';

  @override
  String get auditLogActionChannelCreate => 'تم إنشاء قناة';

  @override
  String get auditLogActionChannelUpdate => 'تم تحديث القناة';

  @override
  String get auditLogActionChannelDelete => 'تم حذف القناة';

  @override
  String get auditLogActionChannelOverwriteCreate => 'تمت إضافة تجاوز للقناة';

  @override
  String get auditLogActionChannelOverwriteUpdate => 'تم تحديث تجاوز القناة';

  @override
  String get auditLogActionChannelOverwriteDelete => 'تمت إزالة تجاوز القناة';

  @override
  String get auditLogActionMemberKick => 'تم طرد عضو';

  @override
  String get auditLogActionMemberPrune => 'تم تقليم الأعضاء';

  @override
  String get auditLogActionMemberBanAdd => 'تم حظر عضو';

  @override
  String get auditLogActionMemberBanRemove => 'تم إلغاء حظر عضو';

  @override
  String get auditLogActionMemberUpdate => 'تم تحديث عضو';

  @override
  String get auditLogActionMemberRoleUpdate => 'تم تحديث أدوار الأعضاء';

  @override
  String get auditLogActionMemberMove => 'تم نقل عضو';

  @override
  String get auditLogActionMemberDisconnect => 'تم قطع اتصال عضو';

  @override
  String get auditLogActionBotAdd => 'تمت إضافة روبوت';

  @override
  String get auditLogActionRoleCreate => 'تم إنشاء دور';

  @override
  String get auditLogActionRoleUpdate => 'تم تحديث الدور';

  @override
  String get auditLogActionRoleDelete => 'تم حذف الدور';

  @override
  String get auditLogActionInviteCreate => 'تم إنشاء الدعوة';

  @override
  String get auditLogActionInviteUpdate => 'تم تحديث الدعوة';

  @override
  String get auditLogActionInviteDelete => 'تم حذف الدعوة';

  @override
  String get auditLogActionWebhookCreate => 'تم إنشاء الويب هوك';

  @override
  String get auditLogActionWebhookUpdate => 'تم تحديث الويب هوك';

  @override
  String get auditLogActionWebhookDelete => 'تم حذف الويب هوك';

  @override
  String get auditLogActionEmojiCreate => 'تم إنشاء الإيموجي';

  @override
  String get auditLogActionEmojiUpdate => 'تم تحديث الإيموجي';

  @override
  String get auditLogActionEmojiDelete => 'تم حذف الإيموجي';

  @override
  String get auditLogActionStickerCreate => 'تم إنشاء الملصق';

  @override
  String get auditLogActionStickerUpdate => 'تم تحديث الملصق';

  @override
  String get auditLogActionStickerDelete => 'تم حذف الملصق';

  @override
  String get auditLogActionMessageDelete => 'تم حذف الرسالة';

  @override
  String get auditLogActionMessageBulkDelete => 'تم حذف الرسائل';

  @override
  String get auditLogActionMessagePin => 'تم تثبيت الرسالة';

  @override
  String get auditLogActionMessageUnpin => 'تم إلغاء تثبيت الرسالة';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return 'قام $actor بتحديث إعدادات المجتمع.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return 'قام $actor بإنشاء القناة $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return 'قام $actor بتحديث القناة $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return 'قام $actor بحذف القناة $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return 'قام $actor بإضافة أذونات القناة لـ $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'قام $actor بإضافة أذونات القناة لـ $target في $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return 'قام $actor بتحديث أذونات القناة لـ $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'قام $actor بتحديث أذونات القناة لـ $target في $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return 'قام $actor بإزالة أذونات القناة لـ $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'قام $actor بإزالة أذونات القناة لـ $target في $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return 'قام $actor بطرد $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return 'قام $actor بحظر $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return 'قام $actor بإلغاء حظر $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return 'قام $actor بتحديث $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return 'قام $actor بتحديث الأدوار لـ $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return 'قام $actor بتقليم الأعضاء غير النشطين.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return 'قام $actor بتقليم الأعضاء غير النشطين لمدة $days أيام.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return 'قام $actor بنقل $target إلى قناة صوتية أخرى.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'قام $actor بنقل $target إلى $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return 'قام $actor بفصل $target عن الصوت.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return 'قام $actor بإضافة البوت $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return 'قام $actor بإنشاء الدور $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return 'قام $actor بتحديث الدور $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return 'قام $actor بحذف الدور $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return 'قام $actor بإنشاء الدعوة $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'قام $actor بإنشاء الدعوة $target للقناة $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return 'قام $actor بتحديث الدعوة $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'قام $actor بتحديث الدعوة $target للقناة $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return 'قام $actor بحذف الدعوة $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'قام $actor بحذف الدعوة $target للقناة $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return 'قام $actor بإنشاء الويب هوك $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return 'قام $actor بتحديث الويب هوك $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor deleted the webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor added the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor updated the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor deleted the emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor added the sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor updated the sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor deleted the sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor deleted a message.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor deleted a message in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor deleted multiple messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor deleted $count messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor deleted multiple messages in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor deleted $count messages in $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor pinned a message.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor pinned a message in $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor unpinned a message.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor unpinned a message in $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor performed an audit action on $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Updated $field from $oldValue to $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Set $field to $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Cleared $field (was $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Updated $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Renamed the community to $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Updated the community icon.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Renamed the channel to $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Cleared the topic.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Updated the topic to $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Enabled mature content.';

  @override
  String get auditLogChangeDisabledMatureContent => 'Disabled mature content.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Set nickname to $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Removed nickname $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Muted the member.';

  @override
  String get auditLogChangeUnmutedMember => 'Unmuted the member.';

  @override
  String get auditLogChangeDeafenedMember => 'Deafened the member.';

  @override
  String get auditLogChangeUndeafenedMember => 'Undeafened the member.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Added $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Removed $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Channel: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Message: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Invited by $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deleted # messages.',
      one: 'Deleted # message.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Removed # members.',
      one: 'Removed # member.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'This invite never expires.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Grants temporary membership.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Grants permanent membership.';

  @override
  String get guildSettingsLoadMore => 'Load more';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Manage webhooks that post messages to channels.';

  @override
  String get guildSettingsWebhooksEmpty => 'No webhooks configured.';

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
  String get guildSettingsCopyUrl => 'Copy URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copied to clipboard';

  @override
  String get guildSettingsDeleteWebhook => 'حذف خطاف الويب';

  @override
  String get guildSettingsVanityUrlDescription =>
      'قم بتعيين رابط دعوة مخصص لخادمك.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'حفظ';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'الاستخدام';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count استخدامًا';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'تقدم بطلب ليتم إدراجك في اكتشاف الخادم.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'يتطلب ما لا يقل عن $count عضوًا للتقديم.';
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
  String get guildSettingsDiscoveryCategory => 'الفئة';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'الوصف';

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
  String get guildSettingsDiscoveryTags => 'العلامات';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'ألعاب، فن، موسيقى';

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
  String get guildSettingsDiscoveryApply => 'إرسال الطلب';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'سحب';

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
  String get guildSettingsMembersDescription =>
      'البحث عن أعضاء الخادم وإدارتهم.';

  @override
  String get guildSettingsMembersSearchHint => 'البحث عن الأعضاء';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count عضوًا';
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
  String get guildSettingsMembersSortNewest => 'الأحدث أولاً';

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
  String get guildSettingsInvitesDescription =>
      'عرض روابط الدعوة النشطة وإلغاؤها.';

  @override
  String get guildSettingsInvitesEmpty => 'لا توجد دعوات نشطة.';

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
    return '$uses / $maxUses استخدامًا';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'تنتهي صلاحية $date';
  }

  @override
  String get guildSettingsBansDescription => 'عرض وإدارة المستخدمين المحظورين.';

  @override
  String get guildSettingsBansSearchHint => 'البحث عن الحظر';

  @override
  String get guildSettingsBansEmpty => 'لا يوجد مستخدمون محظورون.';

  @override
  String get guildSettingsBanPermanent => 'حظر دائم';

  @override
  String guildSettingsBanExpires(String date) {
    return 'تنتهي صلاحية $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'تنتهي صلاحية';

  @override
  String get guildSettingsUnban => 'إلغاء الحظر';

  @override
  String get guildSettingsBansLoading => 'جارٍ تحميل المستخدمين المحظورين';

  @override
  String get guildSettingsBansNoSearchResults =>
      'لم يتم العثور على حظر مطابق لبحثك.';

  @override
  String get guildSettingsBanDetailsTitle => 'تفاصيل الحظر';

  @override
  String get guildSettingsBanViewDetails => 'عرض التفاصيل';

  @override
  String get guildSettingsBannedOn => 'تم الحظر في';

  @override
  String get guildSettingsBannedBy => 'تم الحظر بواسطة';

  @override
  String get guildSettingsRevokeBanTitle => 'إلغاء الحظر';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'هل أنت متأكد أنك تريد إلغاء حظر $displayName؟ سيتمكن من إعادة الانضمام إلى المجتمع.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'تم إلغاء حظر $displayName';
  }

  @override
  String get guildSettingsBansLoadError => 'تعذر تحميل الحظر. حاول مرة أخرى.';

  @override
  String get guildSettingsRevokeBanError => 'تعذر إلغاء الحظر. حاول مرة أخرى.';

  @override
  String get guildSettingsCommunitySettings => 'إعدادات المجتمع';

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
      'إدارة ملف تعريف مجتمعك وقنواته والإعدادات الافتراضية.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'العلامة التجارية';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'تحديث الأيقونة والاسم والشعار وخلفية الدعوة';

  @override
  String get guildSettingsOverviewBannerUpload => 'تحميل الشعار';

  @override
  String get guildSettingsOverviewIdleTitle => 'إعدادات الخمول';

  @override
  String get guildSettingsOverviewIdleDescription => 'تكوين قناة AFK والمهلة';

  @override
  String get guildSettingsOverviewSystemTitle => 'النظام والترحيب';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'اختيار وجهة رسائل النظام والترحيب';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'الإشعارات الافتراضية';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'المجتمعات التي تضم أكثر من 250 شخصًا تُجبر على إعداد \"الإشعارات فقط\". يتم الاحتفاظ بالإعداد الأصلي الخاص بك وسيتم استعادته إذا انخفض عدد أفراد المجتمع عن 250 عضوًا.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'متقدم';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'السماح بأسماء قنوات نصية مرنة';

  @override
  String get guildSettingsOverviewHideOwnerCrown => 'إخفاء تاج مالك المجتمع';

  @override
  String get guildSettingsOverviewDetachedBanner => 'شعار منفصل';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'يعرض الشعار في قسم خاص به أسفل رأس المجتمع.';

  @override
  String get guildSettingsOverviewUploadIcon => 'تحميل أيقونة';

  @override
  String get guildSettingsOverviewRemoveImage => 'إزالة';

  @override
  String get guildSettingsOverviewSplashTitle => 'خلفية الدعوة';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'خلفية تضمين الدردشة';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'تظهر في تضمينات الدعوة في الدردشة.';

  @override
  String get guildSettingsOverviewUploadBackground => 'تحميل الخلفية';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'لا يوجد شعار للمجتمع';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'لا توجد خلفية للدعوة';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'معاينة';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'شاهد كيف تبدو دعوتك للزوار.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'أسماء القنوات النصية';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'تاج مالك المجتمع';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'تكوين ما إذا كان سيتم عرض أيقونة التاج بجوار مالك المجتمع';

  @override
  String get guildSettingsSplashCardAlignment => 'محاذاة البطاقة';

  @override
  String get guildSettingsSplashAlignmentCenter => 'وسط';

  @override
  String get guildSettingsSplashAlignmentLeft => 'يسار';

  @override
  String get guildSettingsSplashAlignmentRight => 'يمين';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'ينطبق فقط على الشاشات العريضة.';

  @override
  String get permissionReadMessageHistory => 'قراءة سجل الرسائل';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'تغيير ما يمكن للمستخدمين الذين لا يملكون \"$permission\" رؤيته';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'استخدم نافذة منبثقة مخصصة لتعيين تاريخ حد لسجل الرسائل للأعضاء الذين لا يملكون إذن $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen => 'فتح حد سجل الرسائل';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'حد سجل الرسائل';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'تمكين حد سجل الرسائل';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'تاريخ الحد';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'يمكن للأعضاء الذين لا يملكون إذن قراءة سجل الرسائل رؤية الرسائل المرسلة بعد هذا التاريخ.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'تم تحديث حد سجل الرسائل';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'السماح بالأحرف الكبيرة والمسافات في أسماء القنوات النصية. يقتصر الإيقاف على الأسماء بأحرف صغيرة مع الشرطات والشرطات السفلية.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'يخفي أيقونة التاج بجوار مالك المجتمع عبر جميع الأسطح.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'الأيقونات المتحركة تتطلب ميزة المجتمع \"الأيقونة المتحركة\".';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'الشعارات المتحركة تتطلب ميزة المجتمع \"الشعار المتحرك\".';

  @override
  String get guildSettingsAfkChannel => 'قناة غير نشط / خامل';

  @override
  String get guildSettingsAfkChannelHint =>
      'انقل الأعضاء إلى هذه القناة عندما يكونون غير نشطين.';

  @override
  String get guildSettingsNoAfkChannel => 'لا توجد قناة غير نشط';

  @override
  String get guildSettingsAfkTimeout => 'مهلة عدم النشاط';

  @override
  String get guildSettingsAfkTimeout1Min => 'دقيقة واحدة';

  @override
  String get guildSettingsAfkTimeout5Min => '5 دقائق';

  @override
  String get guildSettingsAfkTimeout15Min => '15 دقيقة';

  @override
  String get guildSettingsAfkTimeout30Min => '30 دقيقة';

  @override
  String get guildSettingsAfkTimeout1Hour => 'ساعة واحدة';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds ثانية';
  }

  @override
  String get guildSettingsSystemChannel => 'قناة الوجهة';

  @override
  String get guildSettingsSystemChannelHint =>
      'ستظهر رسائل الترحيب والنظام هنا.';

  @override
  String get guildSettingsNoSystemChannel => 'لا توجد قناة نظام';

  @override
  String get guildSettingsHideJoinMessages => 'إخفاء رسائل الانضمام';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'يمنع ظهور رسائل الانضمام في القناة الوجهة.';

  @override
  String get guildSettingsDefaultNotifications =>
      'إعدادات الإشعارات الافتراضية';

  @override
  String get guildSettingsNotificationsAll => 'جميع الرسائل';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'الإشعار بجميع الرسائل';

  @override
  String get guildSettingsNotificationsMentions => 'الإشارات فقط';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'الإشعار بالإشارات فقط';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG، PNG، WebP، AVIF. بحد أقصى 10 ميجابايت. الحد الأدنى: 960×540 بكسل (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG، PNG، WebP، AVIF. بحد أقصى 10 ميجابايت. الحد الأدنى: 960×540 بكسل (16:9). تُعرض في تضمينات الدعوة في الدردشة.';

  @override
  String get guildSettingsModerationDescription =>
      'تكوين إعدادات التحقق وتصفية المحتوى والمحتوى المخصص للبالغين.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'المجتمعات المدرجة في الاكتشاف لديها خيارات إشراف مقيدة.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'تصفية المحتوى';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'فحص الرسائل تلقائيًا بحثًا عن المحتوى الصريح في القنوات غير المحددة للمحتوى المخصص للبالغين.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'يُطلب من المجتمعات المدرجة في الاكتشاف فحص جميع الأعضاء. لا يمكن تغيير هذا الإعداد أثناء تمكين الاكتشاف.';

  @override
  String get guildSettingsContentFilterOff => 'إيقاف';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'دع المجتمع يشرف على نفسه';

  @override
  String get guildSettingsContentFilterNoRole =>
      'تصفية الأعضاء الذين ليس لديهم أدوار';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'مقترح لمعظم المجتمعات';

  @override
  String get guildSettingsContentFilterAll => 'تصفية الجميع';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'أقصى حماية للمساحات المناسبة للعائلة';

  @override
  String get guildSettingsModerationMatureOff => 'إيقاف';

  @override
  String get guildSettingsModerationMatureOn => 'تشغيل';

  @override
  String get guildSettingsContentWarningToggle => 'عرض تحذير المحتوى';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'تبديل موجه الموافقة قبل دخول أي قناة.';

  @override
  String get guildSettingsContentWarningText => 'نص تحذير مخصص';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'يحتوي هذا على محتوى حساس.';

  @override
  String get guildSettingsModeration2faTitle => 'متطلب المصادقة الثنائية';

  @override
  String get guildSettingsModeration2faDescription =>
      'طلب المصادقة الثنائية للمشرفين قبل أن يتمكنوا من حظر أو طرد أو تقييد الوقت أو إزالة الرسائل.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'طلب المصادقة الثنائية لإجراءات الإشراف';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'يمكن لمالك المجتمع فقط تغيير هذا الإعداد';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'قم بتمكين المصادقة الثنائية على حسابك لتغيير هذا الإعداد';

  @override
  String get guildSettingsEmojiSearchHint => 'بحث الرموز التعبيرية';

  @override
  String get guildSettingsEmojiUploadTitle => 'تحميل رمز تعبيري';

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
    return 'رموز تعبيرية غير متحركة ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'رموز تعبيرية متحركة ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'بحث الملصقات';

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
    return 'إنشاء خطافات الويب من إعدادات القناة. قم بتحريرها هنا.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'لن يعمل عنوان URL المخصص الخاص بك ما لم تكن هناك قناة واحدة على الأقل مرئية للجميع.';

  @override
  String get guildSettingsVanityUrlRemove => 'إزالة';

  @override
  String get guildSettingsBannedUsersTitle => 'المستخدمون المحظورون';

  @override
  String get guildSettingsInvitesTableInviter => 'الداعي';

  @override
  String get guildSettingsInvitesTableChannel => 'القناة';

  @override
  String get guildSettingsInvitesTableCode => 'الرمز';

  @override
  String get guildSettingsInvitesTableUses => 'الاستخدامات';

  @override
  String get guildSettingsInvitesTableCreated => 'تاريخ الإنشاء';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'التصفية حسب المستخدم';

  @override
  String get guildSettingsAuditLogFilterAction => 'التصفية حسب الإجراء';

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
