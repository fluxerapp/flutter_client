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
      'انتهت صلاحية جلستك. يرجى تسجيل الدخول مرة أخرى.';

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
  String get nagbarLearnMore => 'معرفة المزيد';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'تمت جدولة الصيانة في $localizedTime. المدة المتوقعة: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'الصيانة قيد التقدم. المدة المتوقعة: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'اكتملت الصيانة.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'مرحباً $displayName، طالب بحسابك لتجنب فقدان الوصول إليه.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'مرحباً $displayName، يُرجى التحقق من عنوان بريدك الإلكتروني.';
  }

  @override
  String get nagbarOpenSettings => 'فتح الإعدادات';

  @override
  String get systemPermissionSettingsTitle => 'تمكين الإذن';

  @override
  String get systemPermissionSettingsOpenSettings => 'فتح الإعدادات';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return 'لا يمتلك $productName إمكانية الوصول إلى الميكروفون الخاص بك. يمكنك تمكينه في إعدادات خصوصية جهازك.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return 'لا يمتلك $productName إمكانية الوصول إلى الكاميرا الخاصة بك. يمكنك تمكينها في إعدادات خصوصية جهازك.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return 'لا يمتلك $productName إمكانية الوصول إلى مكتبة الصور الخاصة بك. يمكنك تمكين ذلك في إعدادات خصوصية جهازك.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return 'لا يملك $productName الإذن لإرسال الإشعارات. يمكنك تفعيله في إعدادات جهازك.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'لم يتم تجديد اشتراكك بنجاح، لكن لا يزال بإمكانك الوصول إلى مزايا $productName حتى تاريخ $graceDate. اتخذ إجراءً الآن وإلا ستفقد جميع المزايا.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'انتهت صلاحية اشتراكك في $productName. جدّده الآن للاحتفاظ بمزاياك.';
  }

  @override
  String get nagbarManageSubscription => 'إدارة الاشتراك';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'مرحبًا بك في $productFullName. استكشف مزايا $productName الخاصة بك وأدر اشتراكك.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'عرض ميزات $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'لديك رمز هدية جديد ينتظر في مخزون الهدايا الخاص بك.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'لديك $count رمز هدية جديد بانتظارك في مخزون الهدايا الخاص بك.';
  }

  @override
  String get nagbarViewGiftInventory => 'عرض مخزون الهدايا';

  @override
  String get nagbarVisionaryMfa =>
      'قم بتمكين المصادقة الثنائية لحماية حسابك المميز.';

  @override
  String get nagbarEnableMfa => 'تمكين المصادقة الثنائية';

  @override
  String get nagbarTermsAcceptance =>
      'لقد قمنا بتحديث شروطنا. يُرجى مراجعتها وقبولها للمتابعة.';

  @override
  String get nagbarReviewTerms => 'مراجعة الشروط';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'انضم إلى $communityName للدردشة مع الفريق والبقاء على اطلاع دائم.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'انضم إلى $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'فعّل الإشعارات حتى لا تفوتك الرسائل والإشارات.';

  @override
  String get nagbarEnableNotifications => 'تفعيل الإشعارات';

  @override
  String get nagbarBillingPortalFailed =>
      'تعذر فتح بوابة الفوترة. يُرجى المحاولة مرة أخرى بعد لحظة.';

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
  String get next => 'التالي';

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
  String get registerPendingApproval =>
      'طلب حسابك بانتظار الموافقة. يمكنك تسجيل الدخول بعد أن يوافق عليه أحد المشرفين.';

  @override
  String get registerClosed =>
      'التسجيل مغلق حالياً. استخدم رابط تسجيل من أحد المشرفين لإنشاء حساب.';

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
  String get errorServiceUnavailable =>
      'هذا المثيل غير متاح مؤقتًا. حاول مرة أخرى بعد لحظة.';

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
  String get embedInviteJoinGroup => 'الانضمام إلى المجموعة';

  @override
  String get embedInviteAlreadyJoined => 'انضممت بالفعل';

  @override
  String get embedInviteDisabled => 'الدعوات معطلة';

  @override
  String get embedInvitePaused => 'تم إيقاف الدعوات مؤقتًا لهذا المجتمع.';

  @override
  String embedInvitePausedRaid(String productName) {
    return 'اكتشف $productName هجومًا محتملاً، لذا لا يمكن للمستخدمين الجدد الانضمام الآن.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'أوقف هذا المجتمع الدعوات مؤقتًا. يمكنك المحاولة مرة أخرى لاحقًا.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return 'اكتشف $productName هجومًا محتملاً في هذا المجتمع. تمت إيقاف الدعوات مؤقتًا، لذا لا يمكن للمستخدمين الجدد الانضمام الآن.';
  }

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
  String get invalidDeepLinkTitle => 'تعذر فتح الرابط';

  @override
  String get invalidDeepLinkDescription =>
      'قد يكون هذا الرابط معطلاً، أو متاحًا على الويب فقط، أو قد لا يكون لديك إذن بالوصول إليه. تحقق من الرابط وحاول مرة أخرى.';

  @override
  String get invalidDeepLinkGoHomeButton => 'الذهاب إلى الشاشة الرئيسية';

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
    return 'رؤيوي (مدى الحياة $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أيام من $productName',
      one: 'يوم واحد من $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أسابيع من $productName',
      one: 'أسبوع واحد من $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أشهر من $productName',
      one: 'شهر واحد من $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سنوات من $productName',
      one: 'سنة واحدة من $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'من $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'انقر للمطالبة بهديتك!';

  @override
  String get embedGiftAlreadyRedeemed => 'تم الاسترداد بالفعل';

  @override
  String get embedGiftClaimAccountHelp =>
      'طالب بملكيتك للحساب لاستلام هذه الهدية.';

  @override
  String get embedGiftClaim => 'المطالبة بالهدية';

  @override
  String get embedGiftClaimed => 'تم استلام الهدية';

  @override
  String get embedGiftClaimAccount => 'المطالبة بالحساب للاسترداد';

  @override
  String get embedGiftUnknownTitle => 'هدية غير معروفة';

  @override
  String get embedGiftUnknownSubtitle =>
      'رمز الهدية هذا غير صالح أو تمت المطالبة به بالفعل.';

  @override
  String get embedGiftUnavailable => 'الهدية غير متاحة';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'طالب هديتك لتفعيل اشتراك $productName الخاص بك!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'تم استلام هذه الهدية بالفعل.';

  @override
  String get giftAcceptMaybeLater => 'ربما لاحقًا';

  @override
  String get giftRedeemedToast => 'تم استرداد الهدية!';

  @override
  String get giftRedeemInvalidTitle => 'رمز الهدية غير صالح';

  @override
  String get giftRedeemInvalidMessage => 'هذا الرمز غير صالح أو مستخدم بالفعل.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'تم استرداد الهدية بالفعل';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'تم استرداد هذا الرمز بالفعل.';

  @override
  String get giftRedeemNotFoundTitle => 'لم يتم العثور على الهدية';

  @override
  String get giftRedeemNotFoundMessage => 'هذا الرمز غير موجود.';

  @override
  String get giftRedeemFailedTitle => 'فشل استرداد الهدية';

  @override
  String get giftRedeemFailedMessage =>
      'تعذّر استرداد هذه الهدية. حاول مرة أخرى.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'لا يمكن استرداد هذه الهدية';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'لا يمكن لحسابات Visionary استرداد هدايا Plutonium. انسخ الرابط لمشاركته مع صديق بدلاً من ذلك.';

  @override
  String get giftCopyLink => 'نسخ رابط الهدية';

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
  String get notificationUseCategoryDefault => 'استخدام افتراضي للفئة';

  @override
  String get notificationUseCommunityDefault =>
      'استخدام إعدادات المجتمع الافتراضية';

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
  String get dmDeleteMyMessagesTitle => 'حذف رسائلك في هذه المحادثة؟';

  @override
  String get dmDeleteMyMessagesDescription =>
      'سيؤدي هذا إلى حذف جميع الرسائل التي أرسلتها في هذه المحادثة نهائيًا. لا يمكن التراجع عن هذا الإجراء.';

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
  String get dmUnnamedGroup => 'مجموعة بلا اسم';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'مجموعة $resolvedName';
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
  String get dmDebugCategory => 'تصحيح بيانات الفئة';

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
  String get addFriendVerifyToSend =>
      'يجب عليك تفعيل بريدك الإلكتروني قبل إرسال طلبات الصداقة.';

  @override
  String get addFriendFriendsListFull =>
      'قائمة أصدقائك ممتلئة، أو قائمة أصدقائهم ممتلئة. أزل شخصًا ما وحاول مرة أخرى.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'هذا إيموجي افتراضي على $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'هذا الرمز التعبيري من هذا المجتمع. يمكنك استخدامه في كل مكان.';

  @override
  String get emojiInfoCustomUnknownDescription => 'هذا إيموجي مخصص من مجتمع.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'هذا إيموجي مخصص من مجتمع. اطلب من المؤلف دعوة لاستخدام هذا الإيموجي.';

  @override
  String get emojiInfoFromHeader => 'هذا الرمز التعبيري من';

  @override
  String get emojiInfoDiscoverableCommunity => 'مجتمع قابل للاكتشاف';

  @override
  String get emojiInfoPrivateCommunity => 'مجتمع خاص';

  @override
  String get emojiInfoVerifiedCommunity => 'مجتمع موثّق';

  @override
  String get emojiInfoAddToFavorites => 'إضافة إلى المفضلة';

  @override
  String get emojiInfoRemoveFromFavorites => 'إزالة من المفضلة';

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
  String get gifPickerFavoritesEmptyTitle => 'لا توجد صور GIF مفضلة بعد';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'ضع علامة نجمة على صورة GIF لرؤيتها هنا.';

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
  String externalLinkWarningLeaving(String productName) {
    return 'أنت على وشك مغادرة $productName';
  }

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
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

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
  String profilePreviewMemberSince(String productName) {
    return 'عضو في $productName منذ';
  }

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'إدارة عنوان البريد الإلكتروني الذي تستخدمه لتسجيل الدخول إلى $productName';
  }

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
  String get phoneCountryLabel => 'البلد';

  @override
  String get phoneSearchCountries => 'البحث عن البلدان...';

  @override
  String get phoneNumberRequired => 'رقم الهاتف مطلوب';

  @override
  String get phoneEnterValidNumber => 'أدخل رقم هاتف جوال صالحًا.';

  @override
  String get phoneCannotBeUsed =>
      'لا يمكن استخدام رقم الهاتف هذا. جرّب رقم هاتف محمول آخر أو اتصل بالدعم.';

  @override
  String get phoneAlreadyUsed =>
      'لقد تم استخدام رقم الهاتف هذا بالفعل. جرّب رقمًا آخر أو اتصل بالدعم.';

  @override
  String get phoneCodeDidNotWork =>
      'هذا الرمز غير صحيح. يرجى التحقق منه والمحاولة مرة أخرى.';

  @override
  String get phoneTooManyAttempts =>
      'محاولات كثيرة جدًا. انتظر قليلًا، ثم حاول مرة أخرى.';

  @override
  String get phoneSmsUnavailable =>
      'تعذرت عملية التحقق عبر الرسائل النصية القصيرة حاليًا. يُرجى المحاولة مرة أخرى لاحقًا أو التواصل مع فريق الدعم.';

  @override
  String get phoneNotEligible =>
      'التحقق من الهاتف غير متاح لهذا الحساب. استخدم طريقة أخرى أو اتصل بالدعم.';

  @override
  String get phoneCaptchaRequired =>
      'يلزم إجراء فحص للمتصفح قبل التحقق من رقم الهاتف. حاول مرة أخرى من صفحة تسجيل الدخول أو اتصل بالدعم.';

  @override
  String get phoneSomethingWentWrong => 'حدث خطأ ما. يُرجى المحاولة مرة أخرى.';

  @override
  String get phoneInboundExpensiveDescription =>
      'إرسال رسالة نصية قصيرة إلى رقم الهاتف هذا مُكلف للغاية، لذا نحتاج منك إرسال رسالة نصية قصيرة إلينا بدلاً من ذلك. يمكنك أيضًا الاتصال بالدعم لطلب إزالة هذا المتطلب من حسابك.';

  @override
  String get phoneInboundDefaultDescription =>
      'نحتاج منك إرسال رسالة نصية قصيرة إلينا للتحقق من رقم هاتفك.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'افتح تطبيق الرسائل على هاتفك وأنشئ رسالة نصية جديدة.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'أرسل الرمز $code إلى $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'انتظر حتى نستلم رسالتك. قد يستغرق هذا دقيقة واحدة.';

  @override
  String get phoneInboundGetNewCode => 'الحصول على رمز جديد';

  @override
  String get phoneInboundChallengeCodeLabel => 'رمز للإرسال';

  @override
  String get phoneInboundOurNumberLabel => 'إرسال إلى';

  @override
  String get requiredActionTitle => 'يلزم التحقق من الحساب';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'أكمل عملية التحقق المطلوبة لمتابعة استخدام $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'يتطلب تسجيلك فحصًا إضافيًا لمكافحة الرسائل المزعجة قبل أن تتمكن من المتابعة.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'يجب التحقق من بريدك الإلكتروني أو هاتفك لمتابعة استخدام $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'أكمل خطوات التحقق المطلوبة من البريد الإلكتروني والهاتف أدناه لمتابعة استخدام $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'اختر طريقة التحقق';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'أكمل أحد مسارات التحقق أدناه لمتابعة استخدام $productName.';
  }

  @override
  String get requiredActionUseEmail => 'استخدام البريد الإلكتروني';

  @override
  String get requiredActionUsePhone => 'استخدام الهاتف';

  @override
  String get requiredActionCheckEmailTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String get requiredActionCheckEmailDescription =>
      'لقد أرسلنا رابط تحقق إلى عنوان بريدك الإلكتروني. افتحه للمتابعة.';

  @override
  String get requiredActionResendVerificationEmail =>
      'إعادة إرسال البريد الإلكتروني للتحقق';

  @override
  String get requiredActionVerificationEmailSent =>
      'تم إرسال رسالة التحقق عبر البريد الإلكتروني. تحقق من صندوق الوارد الخاص بك.';

  @override
  String get requiredActionSignOut => 'تسجيل الخروج';

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
  String get networkErrorMessage => 'حدث خطأ ما. يُرجى المحاولة مرة أخرى.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ $count أسابيع',
      one: 'منذ أسبوع واحد',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'في $count دقائق',
      one: 'في دقيقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'خلال $count ساعات',
      one: 'خلال ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'في $count أيام',
      one: 'في يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'في $count أسابيع',
      one: 'في أسبوع واحد',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'في $count أشهر',
      one: 'في شهر واحد',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'في غضون $count أعوام',
      one: 'في عام واحد',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'الآن';

  @override
  String get authorizedAppsTitle => 'التطبيقات المصرح بها';

  @override
  String authorizedAppsDescription(String productName) {
    return 'تم منح هذه التطبيقات حق الوصول إلى حساب $productName الخاص بك.';
  }

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
  String get userProfileLoading => 'جارٍ تحميل الملف الشخصي';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return 'فريق $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'فريق مجتمع $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'شريك $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'صائد أخطاء $productName';
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
    return 'مشترك $productName Plutonium منذ $date';
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
  String get userProfileRoles => 'الأدوار';

  @override
  String get memberRoleAdd => 'إضافة دور';

  @override
  String memberRoleRemove(String roleName) {
    return 'إزالة دور $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'ليس لدى هذا المستخدم أي أدوار في هذا المجتمع.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'لا توجد أدوار بعد. أضف أدوارًا في $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'لا توجد أدوار متاحة';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'لا توجد أدوار لتعيينها في هذا المجتمع في الوقت الحالي، ولكن يمكنك إنشاء دور جديد في $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'إعدادات المجتمع';

  @override
  String get guildSettingsRolesTab => 'الأدوار';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'التوقيت المحلي';

  @override
  String get userProfileSameTimeAsYou => 'نفس توقيتك';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'أمامك بـ $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'متأخر عنك بـ $duration';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ساعات',
      one: 'ساعة واحدة',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes دقائق',
      one: 'دقيقة واحدة',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ساعات',
      one: 'ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes دقائق',
      one: 'دقيقة واحدة',
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
  String get iarReportGuildTitle => 'الإبلاغ عن المجتمع';

  @override
  String get iarReportGuildPreconfirmBody =>
      'إذا كان هذا البلاغ يتعلق برسالة معينة في هذا المجتمع، فقم بالإبلاغ عن تلك الرسالة بدلاً من ذلك. بلاغات الرسائل تمنح فريق السلامة لدينا أوضح سياق، وإضافة التفاصيل في التعليقات يمكن أن يساعدنا في مراجعتها بشكل أسرع. استمر في الإبلاغ عن المجتمع ككل فقط إذا كان الإبلاغ عن رسالة لن يوضح المشكلة الأوسع.';

  @override
  String get iarContinueToReportCommunity => 'متابعة الإبلاغ عن المجتمع';

  @override
  String get iarPreviewCommunitySubtitle => 'المنتدى';

  @override
  String get iarReasonHarassmentGuildLabel => 'مضايقة أو إساءة استهداف';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'المجتمع يسهل الهجمات الجماعية أو الإساءة الموجهة.';

  @override
  String get iarReasonHateGuildDescription =>
      'يروج للكراهية ضد الفئات المحمية.';

  @override
  String get iarReasonTerrorismLabel => 'الإرهاب أو التطرف العنيف';

  @override
  String get iarReasonTerrorismDescription =>
      'يروج للنشاط المتطرف العنيف أو يجند له أو ينسقه.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'محتوى للبالغين أو حجب غير آمن';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'محتوى للبالغين بدون حماية مناسبة.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'يعرض القاصرين للخطر أو يستضيف محتوى استغلال الأطفال.';

  @override
  String get iarReasonRaidLabel => 'تنسيق الهجمات';

  @override
  String get iarReasonRaidDescription =>
      'ينسق الغارات أو الهجمات المنظمة أو المضايقات ضد أشخاص أو مجتمعات.';

  @override
  String get iarReasonSpamGuildDescription =>
      'المجتمع موجود لإرسال الرسائل المزعجة أو الاحتيال أو إساءة استخدام المنصة.';

  @override
  String get iarReasonMalwareGuildLabel => 'توزيع البرامج الضارة';

  @override
  String get iarReasonMalwareGuildDescription =>
      'يوزع برامج ضارة أو يسرق بيانات الاعتماد أو ملفات ضارة.';

  @override
  String get iarReasonPrivacyGuildLabel => 'انتهاك الخصوصية أو التشهير';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'يشارك معلومات شخصية، أو يطارد المستخدمين، أو ينسق انتهاك الخصوصية.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'يشجع على إيذاء النفس';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'يشجع على الانتحار أو إيذاء النفس أو اضطرابات الأكل.';

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
  String get slowmodeStatusEnabled => 'الوضع البطيء مُفعّل';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'الوضع البطيء نشط ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'الوضع البطيء مضبوط على $durationLabel، لكنك مُستثنى.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'الوضع البطيء مضبوط على $durationLabel. انتظر قبل إرسال رسالة أخرى.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'الوضع البطيء مضبوط على $durationLabel لهذه القناة.';
  }

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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName يتجاوز الحد الأقصى للحجم ($fileSize)';
  }

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
  String get voiceMessageSeekForward => 'تقديم للأمام';

  @override
  String get voiceMessageSeekBackward => 'تقديم للخلف';

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
  String get chatAttachmentDownloadedToast => 'تم الحفظ في الصور';

  @override
  String get chatAttachmentDownloadFailedToast => 'تعذر تنزيل المرفق';

  @override
  String get chatAttachmentExpiredTooltip => 'انتهت صلاحية المرفق';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'توسيع ($count أسطر)',
      one: 'توسيع ($count سطر)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'إخفاء ($count أسطر)',
      one: 'إخفاء ($count سطر)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'عرض ($count صفوف)',
      one: 'عرض ($count صف)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'إخفاء ($count صفوف)',
      one: 'إخفاء ($count صف)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (يتبقى $count أسطر)',
      one: '... (يتبقى سطر واحد)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count صفوف متبقية)',
      one: '... ($count صف متبقي)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'عرض الملف كاملاً';

  @override
  String get chatTextualPreviewChangeLanguage => 'تغيير اللغة';

  @override
  String get chatTextualPreviewSearchLanguage => 'ابحث عن اللغة…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'تمييز الصيغة';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'لم يتم العثور على نتائج';

  @override
  String get chatTextualPreviewMoreOptions => 'المزيد من الخيارات';

  @override
  String get chatTextualPreviewWrapText => 'التفاف النص';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'الملف كبير جدًا للمعاينة المضمنة (الحد الأقصى $previewLimitKb كيلوبايت).';
  }

  @override
  String get chatTextualPreviewLoadError => 'تعذر تحميل المعاينة.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'نص عادي';

  @override
  String get chatTextualPreviewCopy => 'نسخ';

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
  String connectionsDescription(String productName) {
    return 'اربط الحسابات والنطاقات الخارجية بملف تعريف $productName الخاص بك. سيتم عرض الاتصالات التي تم التحقق منها في ملفك الشخصي ليراها الآخرون.';
  }

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
  String get lookAndFeelHdrSectionTitle => 'المدى الديناميكي العالي';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'تحكّم في كيفية عرض صور HDR على الشاشات المتوافقة مع HDR.';

  @override
  String get lookAndFeelHdrFullName => 'نطاق ديناميكي كامل';

  @override
  String get lookAndFeelHdrFullDescription =>
      'عرض صور HDR بأقصى سطوع ونطاق ألوان.';

  @override
  String get lookAndFeelHdrStandardName => 'نطاق قياسي';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'تعيين نغمة صور HDR إلى النطاق القياسي، مما يقلل ذروة السطوع.';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'وضع العرض بنطاق ديناميكي عالٍ';

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
  String get lookAndFeelChatFontSizeLabel => 'حجم خط الدردشة';

  @override
  String get lookAndFeelAppZoomTitle => 'مستوى تكبير التطبيق';

  @override
  String get lookAndFeelAppZoomDescription => 'ضبط مستوى تكبير التطبيق.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'خلفية الدردشة';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'اختر خلفية للمحادثة. ستبقى هذه الخلفية على هذا الجهاز.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'يبقى هذا الإعداد على هذا الجهاز';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'تم حفظ خلفية الدردشة على هذا الجهاز فقط ولا تتم مزامنتها مع الأجهزة الأخرى.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'افتراضي';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'صورة مخصصة';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'اللون $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'تدرج $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'تعتيم الخلفية';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'تعذر تعيين هذه الصورة كخلفية لك.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'الرسائل';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'اختر كيفية عرض الرسائل في قنوات الدردشة.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'المسافة بين مجموعات الرسائل';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing بكسل';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'وضع عرض الرسائل';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'مريح';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'تصميم واسع مع فصل بصري واضح بين الرسائل.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'مكثف';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'يزيد من الرسائل المرئية بأقل مسافة.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'إخفاء صور المستخدمين الرمزية';

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
  String get communityTemporarilyUnavailable => 'المنتدى غير متاح مؤقتًا';

  @override
  String get guildUnavailableDescription => 'حدث خطأ ما. نحن نعمل على إصلاحه.';

  @override
  String get guildNotFoundTitle => 'هذه ليست المجموعة التي تبحث عنها.';

  @override
  String get guildNotFoundDescription =>
      'قد تكون المجموعة التي تبحث عنها حُذفت أو قد لا تملك صلاحية الوصول إليها.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'لا يمكن الوصول إلى $communityName حاليًا إلا لموظفي $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'غير متاح مؤقتًا';

  @override
  String get lookAndFeelCollapseDMsLabel => 'طي الرسائل المباشرة في مجلد';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'عند التمكين، يتم طي الرسائل المباشرة غير المقروءة في الشريط الجانبي للمجتمع في مجلد زر $productName. انقر فوق زر $productName أثناء وجودك في صفحة الرسائل المباشرة لتوسيع أو طي المجلد.';
  }

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
  String get favoritesAddToSavedMedia => 'إضافة إلى الوسائط المحفوظة';

  @override
  String get favoritesRemoveFromSavedMedia => 'إزالة من الوسائط المحفوظة';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'إضافة إلى قائمة الصور المتحركة المفضلة (عن طريق عنوان URL فقط)';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'إزالة من قائمة صور GIF المفضلة التي تم حفظها عن طريق عنوان URL';

  @override
  String get savedMediaAddTitle => 'إضافة إلى الوسائط المحفوظة';

  @override
  String get savedMediaFormNameLabel => 'الاسم';

  @override
  String get savedMediaFormNameHint => 'الوسائط الرائعة الخاصة بي';

  @override
  String get savedMediaFormAltTextLabel => 'نص بديل';

  @override
  String get savedMediaFormAltTextHint => 'وصف الوسائط';

  @override
  String get savedMediaFormTagsLabel => 'الوسوم';

  @override
  String get savedMediaFormTagsHint => 'مضحك، رد فعل، عمل';

  @override
  String get savedMediaSaveError => 'تعذر تحديث الوسائط المحفوظة.';

  @override
  String get savedMediaNameRequired => 'الاسم مطلوب.';

  @override
  String get gifFavoriteFirstTimeTitle => 'كيف تريد حفظ صور GIF المفضلة لديك؟';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'يمكنك تخزين صور GIF المميزة كعناصر مفضلة برابط فقط أو تحميلها إلى وسائطك المحفوظة. اختر الخيار الذي يناسب طريقة استخدامك لها. يمكنك تغيير ذلك في أي وقت من الإعدادات > متقدم > الوسائط.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'المفضلة (الافتراضية) بروابط فقط: تتم مزامنتها عبر أجهزتك، ولا يتم تحميل أي شيء، ولا تُحتسب ضمن الوسائط المحفوظة. قد تختفي الوسائط الأصلية إذا قام المضيف بإزالتها.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'الوسائط المحفوظة: يتم تحميلها، ووضع علامات عليها، والبحث فيها، وهي دائمة، ولكنها تُحتسب ضمن حد الوسائط المحفوظة لديك.';

  @override
  String get gifFavoriteFirstTimeHint => 'سنطلب منك مرة واحدة فقط.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'استخدام عنوان URL فقط (موصى به)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'استخدام الوسائط المحفوظة';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'عند تحميلها مباشرة إلى $productName';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'تحميلات الكاميرا';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'اختر ما إذا كان سيتم الاحتفاظ بالصور ومقاطع الفيديو الملتقطة بالكاميرا داخل التطبيق على جهازك';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'حفظ على الجهاز';

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
  String get accessibilitySaturationTitle => 'التشبع';

  @override
  String get accessibilitySaturationDescription =>
      'اضبط مدى ظهور ألوان السمة عبر التطبيق.';

  @override
  String get accessibilityVisualGroupTitle => 'مرئي';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'تسطير الروابط دائمًا';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'تعتيم النص المشطوب';

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
  String get accessibilityScreenReaderGroupTitle => 'قارئ الشاشة';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'تحكم في كيفية عمل $productName مع قارئات الشاشة.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'إعلان الرسائل الجديدة';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'دع قارئات الشاشة تعلن عن الرسائل الجديدة فور وصولها إلى القناة المفتوحة. لا تتأثر أصوات الإشعارات.';

  @override
  String get accessibilityTtsGroupTitle => 'تحويل النص إلى كلام';

  @override
  String get accessibilityTtsGroupDescription => 'اختر سرعة للنص المنطوق.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => 'سرعة تشغيل الكلام';

  @override
  String get accessibilityTtsPlaySampleLabel => 'تشغيل عينة';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'كتم عينة';

  @override
  String get accessibilityPreviewButtonLabel => 'زر المعاينة';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'هذا يوضح كيفية ظهور الروابط: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'معاينة المستخدم';

  @override
  String get accessibilityKeyboardGroupTitle => 'لوحة المفاتيح';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'إظهار حلقة التركيز على مربع نص الدردشة';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'مفتاح الهروب يخرج من وضع لوحة المفاتيح';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'إظهار اختصارات قائمة السياق';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'تأكيد قبل بدء المكالمات';

  @override
  String get accessibilityAnimationGroupTitle => 'الرسوم المتحركة';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'تم تفعيل تقليل الحركة، لذا يتم إيقاف رسوم المحتوى المتحركة مؤقتًا بشكل افتراضي. لا يزال بإمكانك إعادة تشغيل أي منها لمواصلة العرض.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'تشغيل الرموز التعبيرية المتحركة';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'تشغيل صور GIF تلقائيًا';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'تشغيل صور GIF تلقائيًا عند التركيز على $productName';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'يتم التشغيل على الرغم من تقليل الحركة.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'متوقف مؤقتًا بسبب تقليل الحركة. قم بالتشغيل لمواصلة تشغيل الرموز التعبيرية المتحركة.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'متوقف مؤقتًا بسبب الحركة المخفّضة. قم بالتشغيل لمواصلة عرض صور GIF.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'يتم إيقاف تشغيله افتراضيًا على الهاتف المحمول للحفاظ على عمر البطارية واستخدام البيانات.';

  @override
  String get accessibilityStickerAnimationsTitle => 'رسوم الملصقات المتحركة';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'تفضيلات حركة الملصقات';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'تحريك دائمًا';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'ستتحرك الملصقات دائمًا';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'تحريك عند التفاعل';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'ستتحرك الملصقات عند الضغط عليها';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'ستتحرك الملصقات عند التمرير فوقها أو التفاعل معها';

  @override
  String get accessibilityStickerNeverAnimateName => 'عدم التحريك مطلقًا';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'الملصقات لن تتحرك أبدًا';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'التحريك دائمًا على الرغم من تقليل الحركة.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'تحد حركة الرسوم المتحركة الملصقات لتتحرك عند التفاعل. اختر \"تحريك دائمًا\" للتجاوز.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'يتم التفعيل افتراضيًا عند التفاعل على الهاتف المحمول للحفاظ على عمر البطارية.';

  @override
  String get accessibilityMotionGroupTitle => 'الحركة';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'مزامنة إعدادات تقليل الحركة مع النظام';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'استخدم تفضيل تقليل الحركة في نظام هذا الجهاز، أو خصصه أدناه.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'تقليل الحركة';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'تعطيل الرسوم المتحركة والانتقالات. يتم التحكم بها حاليًا من خلال إعدادات نظامك.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'تعطيل الرسوم المتحركة والانتقالات في جميع أنحاء التطبيق.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'يمكنك التحكم في الرموز التعبيرية المتحركة وصور GIF والملصقات في علامة تبويب الرسوم المتحركة.';

  @override
  String get accessibilityConfirmStartCallTitle => 'بدء المكالمة؟';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'هل أنت متأكد أنك تريد بدء هذه المكالمة؟';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'بدء المكالمة';

  @override
  String get accessibilityTtsSampleDescription =>
      'استمع إلى السطر النموذجي بالسرعة التي اخترتها.';

  @override
  String get accessibilityTtsSampleText =>
      'يا دكتور، أنا من المستقبل. جئت إلى هنا بآلة زمن اخترعتها أنت. والآن، أحتاج مساعدتك للعودة إلى عام 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'التركيب الصوتي غير متاح على هذا الجهاز.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'فشل تشغيل الكلام. حاول مرة أخرى، أو تحقق من أن إخراج الصوت يعمل.';

  @override
  String get ttsSubstitutionUnknownUser => 'مستخدم غير معروف';

  @override
  String get ttsSubstitutionUnknownRole => 'دور غير معروف';

  @override
  String get ttsSubstitutionUnknownChannel => 'قناة غير معروفة';

  @override
  String get ttsSubstitutionCodeBlock => 'كتلة برمجية';

  @override
  String get ttsSubstitutionSpoiler => 'محتوى مخفي';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'إيموجي $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'الأمر $commandName/';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return 'قال $authorName: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'ردًا على $replyAuthorName، قال $authorName: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'أرسل ملصقًا';

  @override
  String get ttsSentAttachment => 'أرسل مرفقًا';

  @override
  String ttsSentAttachments(int count) {
    return 'تم إرسال $count مرفقات';
  }

  @override
  String get ttsSentEmbed => 'أرسل تضمينًا';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return 'أرسل $author $summary';
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
  String get systemCallJoinTheCall => 'الانضمام للمكالمة';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return 'بدأ $username مكالمة استمرت $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'لقد فاتتك مكالمة من $username استمرت $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'لقد فاتتك مكالمة من $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'منذ ثوانٍ قليلة';

  @override
  String get systemCallDurationMinute => 'دقيقة واحدة';

  @override
  String get systemCallDurationOneYear => 'سنة واحدة';

  @override
  String get systemCallDurationOneMonth => 'شهر واحد';

  @override
  String get systemCallDurationOneWeek => 'أسبوع واحد';

  @override
  String get systemCallDurationOneDay => 'يوم واحد';

  @override
  String get systemCallDurationOneHour => 'ساعة واحدة';

  @override
  String systemCallDurationYears(int count) {
    return '$count سنوات';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count أشهر';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count أسابيع';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count أيام';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count ساعات';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count دقائق';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'حدّث $productName لعرض هذه الرسالة.';
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
  String get voiceJoinFailedTitle => 'تعذر الانضمام إلى المكالمة الصوتية';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'تعذر قطع الاتصال بأجهزتك الأخرى. حاول مرة أخرى بعد لحظة.';

  @override
  String get voiceChannelEmptyDescription =>
      'هذه قناة صوتية. اتصل لبدء التحدث!';

  @override
  String get voiceChannelJoin => 'الانضمام إلى القناة الصوتية';

  @override
  String get voiceCallJoin => 'الانضمام للمكالمة';

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
  String get voiceControlFlipCamera => 'تبديل الكاميرا';

  @override
  String get voiceControlScreenShare => 'مشاركة الشاشة';

  @override
  String get voiceScreenShareNotificationText => 'جارٍ مشاركة شاشتك.';

  @override
  String get voiceControlMore => 'المزيد';

  @override
  String get voiceControlDisconnect => 'قطع الاتصال';

  @override
  String get voiceInChat => 'في الدردشة الصوتية';

  @override
  String get voiceConnectionFailed => 'فشل الاتصال';

  @override
  String get voiceConnectionRetry => 'حاول مرة أخرى';

  @override
  String get voiceConnectionDismiss => 'تجاهل';

  @override
  String get voiceConnectionDisconnected => 'غير متصل';

  @override
  String voicePingMs(int currentLatency) {
    return 'البينج: $currentLatency مللي ثانية';
  }

  @override
  String get voiceMeasuringLatency => 'جارٍ قياس زمن الوصول...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'الانتقال إلى $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'الاتصال الصوتي';

  @override
  String get voiceConnectionAdvancedStats => 'متقدم';

  @override
  String get voiceShowCallAvatars => 'إظهار صور المتصلين';

  @override
  String get voiceShowConnectionId => 'إظهار معرّف الاتصال';

  @override
  String get voiceAudioProcessing => 'معالجة الصوت';

  @override
  String get voiceConnectionSessionSection => 'الجلسة';

  @override
  String get voiceConnectionDurationLabel => 'المدة';

  @override
  String get voiceConnectionParticipantsLabel => 'المشاركون';

  @override
  String get voiceConnectionNetworkSection => 'الشبكة';

  @override
  String get voiceConnectionPingLabel => 'تنبيه';

  @override
  String get voiceConnectionJitterLabel => 'الاضطراب';

  @override
  String get voiceConnectionSendLabel => 'إرسال';

  @override
  String get voiceConnectionReceiveLabel => 'استلام';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes دقيقة $seconds ثانية';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency مللي ثانية';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter ملي ثانية';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth كيلوبت في الثانية';
  }

  @override
  String get userAreaMuteMicrophone => 'كتم الميكروفون';

  @override
  String get userAreaUnmuteMicrophone => 'إلغاء كتم صوت الميكروفون';

  @override
  String get userAreaUserSettings => 'إعدادات المستخدم';

  @override
  String get voiceParticipantMenuViewProfile => 'عرض الملف الشخصي';

  @override
  String get voiceParticipantMenuFocus => 'ركّز على هذا الشخص';

  @override
  String get voiceParticipantMenuUnfocus => 'إلغاء التركيز';

  @override
  String get voiceParticipantMenuCommunityMute => 'كتم صوت العضو في المجتمع';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'إسكات صوتي للمجتمع';

  @override
  String get voiceParticipantMenuUserVolume => 'مستوى صوت المستخدم';

  @override
  String get voiceParticipantMenuStreamVolume => 'مستوى صوت البث';

  @override
  String get voiceParticipantMenuStopStreaming => 'إيقاف المشاركة';

  @override
  String get voiceParticipantModerationFailed =>
      'تعذر تحديث هذا العضو. يُرجى المحاولة مرة أخرى.';

  @override
  String get voiceControlChat => 'الدردشة';

  @override
  String get voiceCallViewModeLabel => 'عرض';

  @override
  String get voiceCallViewModeGrid => 'شبكة';

  @override
  String get voiceCallViewModeFocus => 'التركيز';

  @override
  String get voicePanelSettingsSectionTitle => 'إعدادات الصوت';

  @override
  String get voicePanelUseEarpieceLabel => 'استخدام سماعة الأذن';

  @override
  String get voicePanelOnlyShowVideosLabel => 'إظهار مقاطع الفيديو فقط';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'عرض المشاركين الذين لديهم كاميراتهم قيد التشغيل فقط.';

  @override
  String get voicePanelShowOwnCameraLabel => 'إظهار الكاميرا الخاصة بي';

  @override
  String get voicePrioritizeSpeakersLabel => 'إعطاء الأولوية للمتحدثين';

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
  String get privacyDashboardProfilePrivacySection => 'خصوصية الملف الشخصي';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'الأصدقاء والرسائل المباشرة';

  @override
  String get privacyDashboardActivitySharingSection => 'مشاركة النشاط';

  @override
  String get privacyDashboardSensitiveContentSection => 'المحتوى الحساس';

  @override
  String get privacyDashboardDataExportSection => 'تصدير البيانات';

  @override
  String get privacyDashboardDataDeletionSection => 'حذف البيانات';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'من يمكنه رؤية ملفك الشخصي بالكامل';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'الأصدقاء وجميع المجتمعات';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'ملفك الشخصي الكامل مرئي للأصدقاء ولأي شخص في مجتمعاتك';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'للأصدقاء والمجتمعات الصغيرة فقط';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'ملفك الشخصي الكامل مرئي للأصدقاء وأعضاء مجتمعاتك التي تضم 200 عضو أو أقل';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'الأصدقاء فقط';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'ملفك الشخصي الكامل مرئي لأصدقائك فقط';

  @override
  String get privacyDashboardFriendRequestsTitle => 'طلبات الصداقة';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'الجميع';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'السماح لأي شخص بإرسال طلبات صداقة إليك';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'أصدقاء الأصدقاء';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'السماح لأصدقاء أصدقائك بإرسال طلبات إليك';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers => 'أعضاء المجتمع';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'السماح للأعضاء من المجتمعات التي تنتمي إليها بإرسال طلبات إليك';

  @override
  String get privacyDashboardDirectMessagesTitle => 'الرسائل المباشرة';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'السماح بالرسائل المباشرة من أعضاء المجتمع';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'السماح للأعضاء من المجتمعات التي تنتمي إليها بإرسال رسائل مباشرة إليك';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'السماح بالرسائل المباشرة من بوتات المجتمع';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'السماح للبوتات من المجتمعات التي تنتمي إليها بإرسال رسائل مباشرة إليك';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'تحكم في من يمكنه إرسال طلبات صداقة ورسائل مباشرة إليك';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'تحكم فيمن يمكنه الاتصال بك وإضافتك إلى المحادثات الجماعية';

  @override
  String get privacyDashboardIncomingCallsTitle => 'المكالمات الواردة';

  @override
  String get privacyDashboardIncomingCallsDesc => 'تحكم فيمن يمكنه الاتصال بك';

  @override
  String get privacyDashboardAllowedCallers => 'المُتصلون المسموح بهم';

  @override
  String get privacyDashboardIncomingCallNobody => 'لا أحد';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'حظر جميع المكالمات الواردة';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'الأصدقاء فقط';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'السماح للأصدقاء فقط بالاتصال بك (موصى به)';

  @override
  String get privacyDashboardIncomingCallCustom => 'الأصدقاء + مخصص';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'السماح للأصدقاء بالإضافة إلى المجموعات الإضافية التي تختارها';

  @override
  String get privacyDashboardIncomingCallEveryone => 'الجميع';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'السماح لأي شخص بالاتصال بك، حتى الغرباء';

  @override
  String get privacyDashboardAdditionalGroups => 'مجموعات إضافية';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'يمكن للأشخاص الذين تربطهم صداقة بأصدقائك الاتصال بك';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'يمكن للأشخاص من المجتمعات المشتركة بينكما الاتصال بك';

  @override
  String get privacyDashboardRingBehavior => 'سلوك الحلقة';

  @override
  String get privacyDashboardSilentCalls => 'مكالمات صامتة من الجميع';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'سيتم إخطار جميع المكالمات بصمت بدلاً من الرنين. بشكل افتراضي، تكون المكالمات من غير الأصدقاء صامتة دائمًا.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'من يمكنه إضافتك إلى المحادثات الجماعية';

  @override
  String get privacyDashboardGroupDmDesc =>
      'تحكم في من يمكنه إضافتك إلى الدردشات الجماعية دون طلب إذن. لا يزال بإمكان أي شخص إرسال روابط دعوة للانضمام إليك.';

  @override
  String get privacyDashboardAllowedInvites => 'الدعوات المسموح بها';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'لا تسمح لأحد بإضافتك إلى الدردشات الجماعية دون إذن';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'السماح للأصدقاء فقط بإضافتك دون طلب (موصى به)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'السماح للأصدقاء والمجموعات الإضافية بإضافتك';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'السماح لأي شخص بإضافتك إلى الدردشات الجماعية دون طلب';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'يمكن للأشخاص الذين تربطك بهم صداقة أن يضيفوك إلى الدردشات الجماعية';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'يمكن للأشخاص من المجتمعات المشتركة إضافتك إلى الدردشات الجماعية';

  @override
  String get privacyDashboardVoiceActivityTitle => 'نشاط الصوت في نشط الآن';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'مشاركة نشاطك الصوتي مع الأصدقاء';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'مشاركة النشاط الصوتي مع جميع الأصدقاء؟';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'إيقاف مشاركة النشاط الصوتي مع جميع الأصدقاء؟';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'أنت على وشك البدء في مشاركة نشاطك الصوتي مع كل أصدقائك الحاليين والمستقبليين. سيؤدي هذا إلى إرسال تحديث إليهم جميعًا ولا يمكن تغييره مرة أخرى إلا بعد 24 ساعة.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'أنت على وشك إيقاف مشاركة نشاطك الصوتي مع جميع أصدقائك، بمن فيهم الأصدقاء المستقبليون. سيؤدي هذا إلى إرسال تحديث إليهم جميعًا ولا يمكن تغييره مرة أخرى إلا بعد 24 ساعة.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'نعم، شارك مع جميع الأصدقاء';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'نعم، إيقاف المشاركة';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'متاح مرة أخرى خلال $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'تم تحديث مشاركة النشاط الصوتي';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'تعذر تحديث مشاركة النشاط الصوتي الآن';

  @override
  String get privacyDashboardDataExportDesc =>
      'أنشئ أرشيفًا قابلاً للتنزيل لبيانات حسابك، بما في ذلك الرسائل وعناوين URL للمرفقات. يرغب معظم الأشخاص في الحصول على كل شيء، ولكن يمكنك تضييق النطاق أدناه.';

  @override
  String get privacyDashboardExportMyData => 'تصدير بياناتي';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'إزالة الرسائل التي أرسلتها نهائيًا عبر الرسائل المباشرة والرسائل المباشرة الجماعية والمجتمعات. تتم العملية في الخلفية، وستتلقى رسالة مباشرة عند الانتهاء.';

  @override
  String get privacyDashboardDeleteMyMessages => 'حذف رسائلي';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'السماح بالرسائل المباشرة من أعضاء المجتمع؟';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'حظر الرسائل المباشرة من أعضاء المجتمع؟';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'السماح للبوتات بإرسال رسائل مباشرة إليك؟';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'حظر البوتات من إرسال رسائل مباشرة إليك؟';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'هل تريد أيضًا السماح بالرسائل المباشرة من أعضاء مجتمعاتك الحالية؟';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'هل تريد أيضًا حظر الرسائل المباشرة من أعضاء مجتمعاتك الحالية؟';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'هل تريد أيضًا السماح للبوتات من مجتمعاتك الحالية بإرسال رسائل مباشرة إليك؟';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'هل تريد أيضًا حظر الروبوتات من مجتمعاتك الحالية؟';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'يمكنك أيضًا تغيير هذا الإعداد لكل مجتمع بالضغط المطول على اسم المجتمع واختيار إعدادات الخصوصية.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'السماح لكل المجتمعات';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'حظر لجميع المجتمعات';

  @override
  String get privacyDashboardDmConfirmSkip => 'تخطّي هذه الخطوة';

  @override
  String get privacyDashboardDataRequestGoBack => 'رجوع';

  @override
  String get privacyDashboardDataRequestExportTitle => 'تصدير بياناتي';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'حذف رسائلي';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'سنعالج هذا في أقرب وقت ممكن. ستتلقى رسالة بريد إلكتروني عندما يكون أرشيفك جاهزًا.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'سنعالج هذا في أقرب وقت ممكن. ستتلقى رسالة مباشرة منا عند الانتهاء.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'ماذا تريد أن يتضمن';

  @override
  String get privacyDashboardDataRequestExportEverything => 'كل شيء';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'تصدير كل رسالة أرسلتها على الإطلاق، بالإضافة إلى جميع إعدادات حسابك وعضوياتك وبياناتك الوصفية.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'تحديد مخصص';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'اختر أنواع المحادثات والمجتمعات والنطاق الزمني المراد تضمينها في الأرشيف.';

  @override
  String get privacyDashboardDataRequestDeleteSelected => 'اختر ما تريد تضمينه';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'اختر أنواع المحادثات التي تريد تنظيفها.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'الأماكن التي لا يمكنني الوصول إليها بعد الآن فقط';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'حذف الرسائل فقط من المجتمعات والمحادثات الجماعية التي غادرتها أو تمت إزالتك منها.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'أي المحادثات';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'بدّل أنواع المحادثات التي تريد تضمينها.';

  @override
  String get privacyDashboardDataRequestKindDms => 'المحادثات المفتوحة';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'الرسائل المباشرة المغلقة';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'المحادثات الجماعية';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'المجتمعات';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'أي مجتمعات';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'فلتر المجتمع';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'تضمين الكل باستثناء المحدد';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'المحددة فقط';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'أنت لست عضوًا في أي مجتمعات حاليًا.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'النطاق الزمني';

  @override
  String get privacyDashboardDataRequestDateMode => 'النطاق الزمني';

  @override
  String get privacyDashboardDataRequestAllTime => 'كل الوقت';

  @override
  String get privacyDashboardDataRequestCustomRange => 'نطاق مخصص';

  @override
  String get privacyDashboardDataRequestStartDate => 'تاريخ البدء';

  @override
  String get privacyDashboardDataRequestEndDate => 'تاريخ الانتهاء';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'اترك أي حقل فارغًا لترك هذا الطرف من النافذة غير محدود.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'اختر نوعًا واحدًا على الأقل من المحادثات لتضمينه.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'يجب أن يكون تاريخ البدء قبل تاريخ الانتهاء.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'مراجعة وتأكيد';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'سنُنشئ أرشيفًا قابلاً للتنزيل لكل رسالة أرسلتها على الإطلاق وسنرسل إليك بريدًا إلكترونيًا عندما يصبح جاهزًا. تنتهي صلاحية رابط التنزيل في ذلك البريد الإلكتروني بعد 7 أيام.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'سنُنشئ أرشيفًا قابلاً للتنزيل يطابق الفلاتر أدناه، وسنرسل إليك بريدًا إلكترونيًا عندما يصبح جاهزًا. سينتهي صلاحية رابط التنزيل في ذلك البريد الإلكتروني بعد 7 أيام.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'حذف الرسائل التي تطابق الفلاتر أدناه نهائيًا. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'لا يمكن التراجع عن هذه العملية بمجرد بدئها. سنرسل لك رسالة مباشرة عند انتهائها.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'طلب تصدير';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'حذف الرسائل';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'النطاق';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'المحادثات';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'المجتمعات';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'النطاق الزمني';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'بلا';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'منذ $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'حتى $end';
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
      other: '# مجتمعات',
      one: '# مجتمع',
    );
    return 'الكل باستثناء $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# مجتمعات فقط',
      one: '# مجتمع فقط',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'الرسائل المباشرة المفتوحة';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'الرسائل المباشرة المغلقة';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'الرسائل المباشرة (المفتوحة والمغلقة)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'المحادثات الجماعية';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'المجتمعات';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ساعات',
      one: '# ساعة',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# دقائق',
      one: '# دقيقة',
    );
    return '$_temp0 و$_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ساعات',
      many: '# ساعة',
      few: '# ساعات',
      one: '# ساعة',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# دقائق',
      many: '# دقيقة',
      few: '# دقائق',
      one: '# دقيقة',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# ثانية',
      many: '# ثانية',
      few: '# ثوانٍ',
      one: '# ثانية',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'فشل تحميل إعدادات الخصوصية';

  @override
  String get privacyDashboardRetry => 'إعادة المحاولة';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'فشل حفظ إعدادات المحتوى الحساس.';

  @override
  String get privacyDashboardDataRequestFailed => 'فشل إكمال الطلب.';

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
      'في انتظار انتهاء وضع التحديد البطيء في قناة واحدة أو أكثر من القنوات المحددة.';

  @override
  String get slowmodeRateLimitedTitle => 'الوضع البطيء نشط';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'الوضع البطيء قيد التشغيل — انتظر $duration قبل إرسال رسالة أخرى.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'تم تعطيل التحميل المباشر أثناء وضع البطء.';

  @override
  String get shareMediaTitle => 'مشاركة إلى';

  @override
  String get shareMediaMessageHint => 'أضف رسالة اختيارية…';

  @override
  String get shareMediaSendButton => 'إرسال';

  @override
  String get shareMediaSuccessToast => 'تمت مشاركة الوسائط';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'تمت المشاركة إلى $count وجهة';
  }

  @override
  String get shareMediaFailedToast => 'فشل مشاركة الوسائط';

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
  String get chatMessageCopyEmbedText => 'نسخ نص التضمين';

  @override
  String get chatMessageTranslate => 'ترجمة';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'مترجم من $language';
  }

  @override
  String get chatMessageSeeOriginal => 'عرض الأصلي';

  @override
  String get chatMessageSeeTranslation => 'عرض الترجمة';

  @override
  String get chatMessageTranslating => 'جارٍ الترجمة…';

  @override
  String get chatMessageTranslateFailed => 'تعذر ترجمة هذه الرسالة.';

  @override
  String get chatMessageTranslateUnavailable =>
      'الترجمة غير متاحة على هذا الجهاز.';

  @override
  String get chatMessageSpeak => 'نطق الرسالة';

  @override
  String get chatMessageStopSpeaking => 'إيقاف التحدث';

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
  String get chatMessageOpenLink => 'فتح الرابط';

  @override
  String get chatMessageCopyLink => 'نسخ الرابط';

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
  String get chatReactionAddFailed => 'فشل إضافة رد الفعل';

  @override
  String get chatReactionRemoveFailed => 'فشل إزالة رد الفعل';

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
  String iarReasonOtherDescription(String productName) {
    return 'استخدم هذا فقط إذا كان ينتهك بوضوح قواعد $productName ولا يندرج تحت الفئات المذكورة أعلاه.';
  }

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
  String get chatMessageDeleteAttachment => 'حذف المرفق';

  @override
  String get chatMessageEditAttachmentAltText => 'تعديل النص البديل';

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
      other: 'رسائل محظورة $count',
      one: 'رسالة محظورة واحدة',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رسائل محتملة من مرسل رسائل مزعجة',
      one: 'رسالة واحدة محتملة من مرسل رسائل مزعجة',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'الرد مخفي لأن الكاتب الأصلي محظور.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'تم إخفاء الرد لأن المؤلف الأصلي مصنف كمُرسل رسائل مزعجة.';

  @override
  String get devMarkAsSpamLocally => 'وضع علامة كمحتوى غير مرغوب فيه محليًا';

  @override
  String get devIgnoreSpamFlag => 'تجاهل الإبلاغ عن رسائل مزعجة';

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
  String get mediaViewerOptions => 'خيارات الوسائط';

  @override
  String get mediaViewerCopyLink => 'نسخ الرابط';

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
    return 'مرفق $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'تجاهل';

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
  String get composerAutocompleteSuggestions => 'اقتراحات';

  @override
  String get composerAutocompleteCommandsHeading => 'الأوامر';

  @override
  String get composerAutocompleteChoicesHeading => 'خيارات';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => 'وسائط اختيارية';

  @override
  String get composerAutocompleteChannelsHeading => 'القنوات';

  @override
  String get composerAutocompleteMembersHeading => 'الأعضاء';

  @override
  String get composerAutocompleteUsersHeading => 'المستخدمون';

  @override
  String get composerAutocompleteMentionsHeading => 'الإشارات';

  @override
  String get composerAutocompleteRolesHeading => 'الأدوار';

  @override
  String get composerAutocompleteMediaHeading => 'الوسائط';

  @override
  String get composerAutocompleteStickersHeading => 'الملصقات';

  @override
  String get composerAutocompleteGifsHeading => 'صور GIF';

  @override
  String get composerAutocompleteNoGifs => 'لم يتم العثور على صور GIF';

  @override
  String get composerCommandShrugDescription => 'يُلحق ¯\\_(ツ)_/¯ برسالتك.';

  @override
  String get composerCommandTableflipDescription =>
      'يُلحق (╯°□°)╯︵ ┻━┻ برسالتك.';

  @override
  String get composerCommandUnflipDescription => 'يُلحق ┬─┬ ノ( ゜-゜ノ) برسالتك.';

  @override
  String get composerCommandMeDescription =>
      'إرسال رسالة إجراء (تظهر بخط مائل).';

  @override
  String get composerCommandSpoilerDescription =>
      'إرسال رسالة مخفية (تُغلّف بعلامات إخفاء).';

  @override
  String get composerCommandTtsDescription =>
      'إرسال رسالة تحويل النص إلى كلام.';

  @override
  String get composerCommandNickDescription =>
      'غيّر اسمك المستعار في هذا المجتمع.';

  @override
  String get composerCommandKickDescription => 'طرد عضو من هذا المجتمع.';

  @override
  String get composerCommandBanDescription => 'حظر عضو من هذا المجتمع.';

  @override
  String get composerCommandMsgDescription => 'إرسال رسالة مباشرة إلى مستخدم.';

  @override
  String get composerCommandSavedDescription => 'إرسال عنصر وسائط محفوظ.';

  @override
  String get composerCommandStickerDescription => 'إرسال ملصق.';

  @override
  String get composerCommandGifDescription => 'ابحث عن صورة GIF وأرسلها.';

  @override
  String get composerCommandMemberOption => 'العضو المستهدف.';

  @override
  String get composerCommandReasonOption => 'سبب (اختياري).';

  @override
  String get composerCommandMessageOption => 'الرسالة المراد إرسالها.';

  @override
  String get composerCommandQueryOption => 'ما الذي تبحث عنه.';

  @override
  String get composerCommandNicknameOption =>
      'اسمك الجديد، أو اتركه فارغًا لإعادة تعيينه.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'مقدار سجل الرسائل الحديثة للعضو الذي سيتم حذفه.';

  @override
  String get composerCommandDeleteMessagesNone => 'عدم حذف أي رسائل';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'السابق $count أيام';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'آخر 24 ساعة';

  @override
  String get composerCommandOptionRequired =>
      'هذا الخيار مطلوب. يرجى تقديم قيمة.';

  @override
  String get composerCommandClear => 'مسح الأمر';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'لقد غيرت اسمك المستعار في هذا المجتمع من **$previousNickname** إلى **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'مستخدم غير معروف';

  @override
  String composerCommandMsgFailed(String username) {
    return 'فشل إرسال رسالة إلى **$username**. قد يكونون قد عطّلوا الرسائل المباشرة أو قد تكون محظورًا.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count المزيد';
  }

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
  String get addGuildCreateTitle => 'إنشاء مجتمع';

  @override
  String get addGuildCreateDescription => 'أنشئ مجتمعًا لك ولأصدقائك للدردشة.';

  @override
  String get addGuildCreateNameLabel => 'اسم المجتمع';

  @override
  String get addGuildCreateSubmit => 'إنشاء مجتمع';

  @override
  String get addGuildCreateFailed =>
      'تعذر إنشاء المجتمع. يُرجى المحاولة مرة أخرى.';

  @override
  String get addGuildCreateClaimTitle => 'المطالبة بحسابك';

  @override
  String get addGuildCreateClaimDescription =>
      'يجب عليك المطالبة بحسابك قبل أن تتمكن من إنشاء مجتمع.';

  @override
  String get addGuildCreateVerifyTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String get addGuildCreateVerifyDescription =>
      'يجب عليك التحقق من عنوان بريدك الإلكتروني قبل أن تتمكن من إنشاء مجتمع.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'لا يتم دعم الرموز المتحركة عند إنشاء مجتمع جديد. استخدم صورة ثابتة.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'بإنشاء مجتمع، أنت توافق على اتباع والالتزام بـ ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'إرشادات مجتمع $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'هذا المثيل مجتمع واحد، لذا لا يمكن إنشاء مجتمعات إضافية.';

  @override
  String get addGuildCreateChangeIcon => 'تغيير الأيقونة';

  @override
  String get addGuildCreateIconLabel => 'أيقونة المجتمع';

  @override
  String get addGuildCreateIconHint =>
      'PNG، JPEG، WebP، AVIF، HEIC، HEIF، JXL، SVG. بحد أقصى 10 ميجابايت. موصى به: 512×512 بكسل';

  @override
  String get addGuildImportDescription =>
      'الصق رابط قالب Discord لاستيراد هيكله إلى مجتمع جديد.';

  @override
  String get addGuildImportUrlLabel => 'رابط القالب';

  @override
  String get addGuildImportUrlInvalid =>
      'أدخل عنوان URL أو رمز قالب Discord صالحًا.';

  @override
  String get addGuildImportFetchFailed =>
      'فشل في جلب قالب المجتمع. قد لا يكون القالب موجودًا أو أن الخدمة الخارجية غير متاحة.';

  @override
  String get addGuildImportInvalidResponse =>
      'هذا لا يبدو كاستجابة قالب صالحة.';

  @override
  String get addGuildImportTemplateLabel => 'قالب';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount قناة نصية، $voiceChannelCount قناة صوتية، $categoryCount فئات، $roleCount أدوار';
  }

  @override
  String get addGuildImportRemoveIcon => 'إزالة الأيقونة';

  @override
  String get addGuildImportTemplateInvalid =>
      'بيانات قالب المجتمع غير صالحة أو تالفة.';

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
  String get channelDetailsFallbackTitle => 'التفاصيل';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'رسالة جماعية · $count أعضاء';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'هل تريد إغلاق محادثتك مع $name؟';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'مغادرة $name؟';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'إعدادات القناة';

  @override
  String get channelDetailsGroupSettingsTitle => 'إعدادات المجموعة';

  @override
  String get channelDetailsDmSettingsTitle => 'إعدادات الرسائل المباشرة';

  @override
  String get channelDetailsInvitePeople => 'دعوة الأشخاص';

  @override
  String get channelDetailsCopyLink => 'نسخ الرابط';

  @override
  String get channelMenuCopyChannelLink => 'نسخ رابط القناة';

  @override
  String get channelMenuCopyRedirectLink => 'نسخ رابط إعادة التوجيه';

  @override
  String get channelDetailsAddFriendsToGroup => 'إضافة أصدقاء إلى المجموعة';

  @override
  String get channelDetailsGroupInvites => 'دعوات المجموعة';

  @override
  String get channelDetailsEditChannel => 'تعديل القناة';

  @override
  String get channelDetailsDeleteChannel => 'حذف القناة';

  @override
  String get channelSettingsCategorySettingsTitle => 'إعدادات الفئة';

  @override
  String get channelSettingsEditCategory => 'تعديل الفئة';

  @override
  String get channelSettingsTabOverview => 'نظرة عامة';

  @override
  String get channelSettingsTabPermissions => 'الأذونات';

  @override
  String get channelSettingsTabInvites => 'الدعوات';

  @override
  String get channelSettingsTabWebhooks => 'خطافات الويب';

  @override
  String get channelSettingsDeleteChannel => 'حذف القناة';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'هل أنت متأكد أنك تريد حذف $channelName؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'هل أنت متأكد أنك تريد حذف $categoryName؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get channelSettingsDeleteCategory => 'حذف الفئة';

  @override
  String get channelSettingsChannelUpdated => 'تم تحديث القناة';

  @override
  String get channelSettingsChannelName => 'اسم القناة';

  @override
  String get channelSettingsCategoryName => 'اسم الفئة';

  @override
  String get channelSettingsMyCategory => 'فئتي';

  @override
  String get categoryExpandCategory => 'توسيع الفئة';

  @override
  String get categoryCollapseCategory => 'طي الفئة';

  @override
  String get categoryExpandAllCategories => 'توسيع كل الفئات';

  @override
  String get categoryCollapseAllCategories => 'طي جميع الفئات';

  @override
  String get categoryMuteCategory => 'كتم الفئة';

  @override
  String get categoryUnmuteCategory => 'إلغاء كتم الفئة';

  @override
  String get categoryCopyCategoryId => 'نسخ معرّف الفئة';

  @override
  String get categoryIdCopied => 'تم نسخ معرّف الفئة';

  @override
  String get channelSettingsChannelNamePlaceholder => 'عام';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'الموضوع';

  @override
  String get channelSettingsTopicPlaceholder => 'أضف موضوعًا إلى هذه القناة';

  @override
  String get channelSettingsInsertEmoji => 'إدراج إيموجي';

  @override
  String get channelSettingsTopicTooLongTitle => 'موضوع القناة طويل جدًا.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'قصّر الموضوع وحاول مرة أخرى.';

  @override
  String get channelSettingsSlowmode => 'الوضع البطيء';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'الانتظار بين الرسائل. يمكن لـ \"$bypassSlowmodePermissionLabel\" تجاوز ذلك.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'إيقاف';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds ثانية';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes دقيقة';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours ساعات';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute دقيقة';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour ساعة';
  }

  @override
  String get channelSettingsVoiceQuality => 'جودة الصوت';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'جودة أعلى = جودة أفضل واستخدام أعلى للنطاق الترددي.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits كيلوبت في الثانية';
  }

  @override
  String get channelSettingsParticipantLimit => 'حد المشاركين';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'الحد الأقصى للأعضاء الذين يمكنهم الانضمام في وقت واحد. 0 يعني غير محدود.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مشاركين',
      one: 'مشارك واحد',
      zero: '∞ بلا حدود',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'حد الاتصال';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'الحد الأقصى للاتصالات النشطة التي يمكن لعضو واحد الاحتفاظ بها في هذه القناة.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count اتصالات',
      one: 'اتصال واحد',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'منطقة الصوت';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'اختر منطقة صوتية لهذه القناة. تلقائي يستخدم أقرب منطقة.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'تلقائي';

  @override
  String get channelSettingsVoiceRegionsLoadFailed => 'تعذر تحميل مناطق الصوت';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'حاول مرة أخرى بعد قليل.';

  @override
  String get channelSettingsResetSlider =>
      'إعادة تعيين شريط التمرير إلى القيمة الافتراضية';

  @override
  String get channelSettingsAdvanced => 'متقدم';

  @override
  String get channelSettingsMatureContentOverride => 'تجاوز محتوى البالغين';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'تجاوز إعداد مستوى $scopeLevel لهذا القناة. سيتم عرض المحتوى غير اللائق خلف بوابة قبل الدخول.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'وراثة';

  @override
  String get channelSettingsMatureContentOn => 'تشغيل';

  @override
  String get channelSettingsMatureContentOff => 'إيقاف';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'يحدد هذه القناة للمحتوى غير اللائق.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'اترك هذه القناة متاحة للمحتوى غير اللائق.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'موروث من $inheritedSourceLabel: تشغيل';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'موروث من $inheritedSourceLabel: إيقاف';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'الفئة';

  @override
  String get channelSettingsMatureContentCommunitySource => 'المجتمع';

  @override
  String get channelSettingsMatureContentCategoryScope => 'الفئة';

  @override
  String get channelSettingsMatureContentCommunityScope => 'المنتدى';

  @override
  String get channelSettingsContentWarningToggle =>
      'إظهار تحذير محتوى في هذه القناة';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'يعرض مطالبة موافقة قبل دخول هذه القناة.';

  @override
  String get channelSettingsContentWarningText => 'نص تحذير مخصص';

  @override
  String get channelSettingsContentWarningDefault =>
      'يحتوي هذا على محتوى حساس.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'أنت بحاجة إلى إذن \"$manageChannelsPermissionLabel\" لتعديل هذه الأذونات.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'أنت بحاجة إلى إذن \"$manageRolesPermissionLabel\" لتعديل هذه الأذونات.';
  }

  @override
  String get channelSettingsUnknownRole => 'دور غير معروف';

  @override
  String get channelSettingsUnknownUser => 'مستخدم غير معروف';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'تجاوزات الوصول';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'تعديل الوصول لـ $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'العودة إلى التجاوزات';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'تكوين الوصول الأساسي لهذه القناة';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'تكوين التجاوزات لهذا الدور';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'تكوين التجاوزات لهذا العضو';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      '\"بحث في الأذونات…\"…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'تم تحديث صلاحية الوصول للقناة';

  @override
  String get channelSettingsPermissionsTitle => 'التحكم في الوصول';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'هذه القناة متزامنة مع الفئة الرئيسية ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'هذه القناة غير متزامنة مع الفئة الرئيسية ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => 'مزامنة مع الفئة';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'القناة متزامنة مع الفئة الرئيسية';

  @override
  String get channelSettingsPermissionsAddOverride => 'إضافة تجاوز';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'البحث عن الأدوار أو الأعضاء…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'الأدوار والأعضاء';

  @override
  String get channelSettingsDeleteInvite => 'حذف الدعوة';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'هل تريد حذف هذه الدعوة؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get channelSettingsCopyInviteCode => 'نسخ رمز الدعوة';

  @override
  String get channelSettingsCopyInviteUrl => 'نسخ رابط الدعوة';

  @override
  String get channelSettingsWebhookCreated => 'تم إنشاء رابط ويب';

  @override
  String get channelSettingsWebhookCreateFailed => 'فشل إنشاء رابط ويب';

  @override
  String get channelSettingsCreateWebhook => 'إنشاء رابط ويب';

  @override
  String get channelSettingsInvitesDescription =>
      'إدارة روابط الدعوة لهذه القناة.';

  @override
  String get channelSettingsInvitesCreate => 'إنشاء دعوة';

  @override
  String get channelSettingsInvitesEmpty => 'لا توجد روابط دعوة';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'لا يحتوي هذا المجتمع على أي روابط دعوة بعد. أنشئ رابطًا لدعوة الأشخاص إلى هذا المجتمع.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'حدث خطأ أثناء تحميل روابط الدعوة لهذه القناة. حاول مرة أخرى.';

  @override
  String get channelSettingsWebhooksDescription =>
      'إدارة الـ webhooks الواردة التي يمكنها نشر الرسائل في هذه القناة.';

  @override
  String get channelSettingsWebhooksEmpty => 'لا توجد Webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'لم يتم إعداد أي خطاطيف ويب لهذه القناة. أنشئ خطاف ويب للسماح للتطبيقات الخارجية بنشر الرسائل.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'هذه القناة لا تدعم الويب هوكس.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'تحتاج إلى صلاحية \"$permission\" لعرض وتعديل خطافات الويب لهذه القناة.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'تعذّر تحميل خطاطيف الويب';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'حدث خطأ أثناء تحميل خطاطيف الويب لهذه القناة. حاول مرة أخرى.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'تم الإنشاء بواسطة $creator في $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'مستخدم غير معروف';

  @override
  String get channelSettingsWebhooksAvatar => 'الصورة الرمزية';

  @override
  String get channelSettingsWebhooksUploadImage => 'تحميل صورة';

  @override
  String get channelSettingsWebhooksRemove => 'إزالة';

  @override
  String get channelSettingsWebhooksName => 'الاسم';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'اسم الويب هوك';

  @override
  String get channelSettingsWebhooksChannel => 'القناة';

  @override
  String get channelSettingsWebhooksUrl => 'رابط الويب هوك';

  @override
  String get channelSettingsWebhooksCopyUrl => 'نسخ رابط الويب هوك';

  @override
  String get channelSettingsWebhooksDelete => 'حذف رابط الويب';

  @override
  String get channelSettingsWebhooksDeleteFailed => 'تعذّر حذف خطاف الويب هذا';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'حذف هذا الرابط؟ لا يمكن التراجع عنه.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'حاول مرة أخرى بعد قليل.';

  @override
  String get channelMenuOpenChat => 'فتح الدردشة';

  @override
  String get channelMenuDuplicateChannel => 'تكرار القناة';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'إعادة تعيين حالة الموافقة على المحتوى للبالغين';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'هل تريد حذف رسائلك في هذه القناة؟';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'سيؤدي هذا إلى حذف كل رسالة أرسلتها في هذه القناة نهائيًا. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'حذف رسائلي';

  @override
  String get channelMenuDeletedYourMessages => 'تم حذف رسائلك';

  @override
  String get channelMenuCouldNotDeleteYourMessages => 'تعذّر حذف رسائلك';

  @override
  String get channelDetailsSystemMessage => 'رسالة نظام';

  @override
  String get channelDetailsTextChannel => 'قناة نصية';

  @override
  String get channelDetailsVoiceChannel => 'قناة صوتية';

  @override
  String get channelDetailsCategory => 'الفئة';

  @override
  String get channelDetailsLinkChannel => 'ربط القناة';

  @override
  String get channelDetailsGenericChannel => 'القناة';

  @override
  String get channelDetailsMutedConversation => 'تم كتم المحادثة';

  @override
  String get channelDetailsUnmutedConversation => 'تم إلغاء كتم المحادثة';

  @override
  String get channelDetailsMutedChannel => 'تم كتم القناة';

  @override
  String get channelDetailsUnmutedChannel => 'تم إلغاء كتم القناة';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'تم تحديث إعدادات الإشعارات';

  @override
  String get channelDetailsTabMembers => 'الأعضاء';

  @override
  String get channelDetailsTabPins => 'الدبابيس';

  @override
  String get channelDetailsActionMute => 'كتم الصوت';

  @override
  String get channelDetailsActionUnmute => 'إلغاء كتم الصوت';

  @override
  String get channelDetailsActionSearch => 'بحث';

  @override
  String get channelDetailsActionMore => 'المزيد';

  @override
  String get channelDetailsMembersEmptyTitle => 'لا يوجد أعضاء لعرضهم';

  @override
  String get channelDetailsMembersEmptyBody =>
      'سيظهر الأعضاء هنا بمجرد تحميل بيانات المجتمع.';

  @override
  String get memberListPermissionDeniedTitle => 'لا يمكنك عرض الأعضاء';

  @override
  String get memberListPermissionDeniedBody =>
      'لا يمكنك عرض أعضاء هذه القناة في هذا المجتمع';

  @override
  String get memberListUnavailableTitle => 'قائمة الأعضاء غير متاحة';

  @override
  String get memberListUnavailableBody =>
      'قوائم الأعضاء غير متاحة مؤقتًا في هذا المجتمع';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'تعذر تحميل الدبابيس';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'يمكن للأعضاء الذين لديهم إذن \"تثبيت الرسائل\" تثبيت رسائل ليراها الجميع.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'يمكنك تثبيت الرسائل في هذه المحادثة ليراها الجميع.';

  @override
  String get channelDetailsPinsEndReached => 'لقد وصلت إلى النهاية';

  @override
  String get channelHeaderOpenDetails => 'فتح تفاصيل القناة';

  @override
  String get channelHeaderPinnedMessages => 'الرسائل المثبتة';

  @override
  String get channelHeaderPinnedMessagesUnread => 'رسائل مثبتة، غير مقروءة';

  @override
  String get channelHeaderMemberList => 'قائمة الأعضاء';

  @override
  String get channelHeaderInbox => 'البريد الوارد';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'إعدادات الإشعارات، مكتوم';

  @override
  String get channelDetailsSearchTitle => 'بحث';

  @override
  String get channelDetailsSearchHint => 'بحث الرسائل';

  @override
  String get channelDetailsSearchFilterFrom => 'من';

  @override
  String get channelDetailsSearchFilterHas => 'يحتوي على';

  @override
  String get channelDetailsSearchFilterIn => 'في';

  @override
  String get channelDetailsSearchFilterMentions => 'الإشارات';

  @override
  String get channelDetailsSearchFilterMore => 'المزيد';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'نشط';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count قنوات';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count مستخدمين';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'المستخدم';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'بوت';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'خطاف الويب';

  @override
  String get channelDetailsSearchFilterByChannel => 'تصفية حسب القناة';

  @override
  String get channelDetailsSearchChannelsHint => 'البحث في القنوات';

  @override
  String get channelDetailsSearchChannelsEmpty => 'لم يتم العثور على قنوات';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'مثبتة';

  @override
  String get channelDetailsSearchPinnedTrue => 'مثبت فقط';

  @override
  String get channelDetailsSearchPinnedFalse => 'استبعاد المثبت';

  @override
  String get channelDetailsSearchClearFilter => 'مسح';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'نوع المؤلف';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'التاريخ';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'وضع التاريخ';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'اختر تاريخًا';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'رابط اسم المضيف';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'اسم الملف يحتوي على';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'امتداد الملف';

  @override
  String get channelDetailsSearchContentPoll => 'استطلاع';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'رسائل تحتوي على استطلاع';

  @override
  String get channelDetailsSearchContentForward => 'إعادة توجيه';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'الرسائل المعاد توجيهها';

  @override
  String get channelDetailsSearchFilterSort => 'فرز';

  @override
  String get channelHeaderSearchFiltersTitle => 'فلاتر البحث';

  @override
  String get channelHeaderSearchRecentTitle => 'عمليات البحث الأخيرة';

  @override
  String get channelHeaderSearchUsersTitle => 'المستخدمون';

  @override
  String get channelHeaderSearchChannelsTitle => 'القنوات';

  @override
  String get channelHeaderSearchValuesTitle => 'القيم';

  @override
  String get channelHeaderSearchDatesTitle => 'التواريخ';

  @override
  String get channelHeaderSearchDefaultBadge => 'افتراضي';

  @override
  String get channelHeaderSearchClearHistory => 'مسح';

  @override
  String get channelHeaderSearchFilterDescFrom => 'مستخدم';

  @override
  String get channelHeaderSearchFilterDescMentions => 'مستخدم';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'رابط، تضمين، صورة، فيديو، صوت، ملف، ملصق، …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'تاريخ أو نطاق تاريخ';

  @override
  String get channelHeaderSearchFilterDescOn => 'تاريخ أو نطاق تاريخ';

  @override
  String get channelHeaderSearchFilterDescDuring => 'تاريخ أو نطاق تاريخ';

  @override
  String get channelHeaderSearchFilterDescAfter => 'تاريخ أو نطاق تاريخ';

  @override
  String get channelHeaderSearchFilterDescIn => 'قناة';

  @override
  String get channelHeaderSearchFilterDescPinned => 'صحيح أم خطأ';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'مستخدم أو بوت أو خطاف ويب';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'اسم مضيف، مثل example.com';

  @override
  String get channelHeaderSearchFilterDescFileName => 'جزء من اسم ملف مرفق';

  @override
  String get channelHeaderSearchFilterDescFileType => 'امتداد ملف، مثل png';

  @override
  String get channelHeaderSearchFilterDescSort => 'التاريخ أو الصلة';

  @override
  String get channelHeaderSearchFilterDescOrder => 'تصاعدي أو تنازلي';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString نتائج',
      one: 'نتيجة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'تصفية حسب المستخدم';

  @override
  String get channelDetailsSearchFilterByContent => 'تصفية حسب المحتوى';

  @override
  String get channelDetailsSearchSortBy => 'ترتيب النتائج حسب';

  @override
  String get channelDetailsSearchIn => 'البحث في';

  @override
  String get channelDetailsSearchEmptyTitle => 'ابحث في هذه المحادثة';

  @override
  String get channelDetailsSearchEmptyBody =>
      'أدخل نصًا أو مؤلفًا أو فلتر محتوى للعثور على الرسائل.';

  @override
  String get channelDetailsSearchIndexingTitle => 'جارٍ فهرسة الرسائل';

  @override
  String get channelDetailsSearchIndexingBody =>
      'حاول مرة أخرى بعد فترة وجيزة بمجرد انتهاء البحث من فهرسة هذا النطاق.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'لا توجد نتائج';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'جرب مصطلحات بحث أو عوامل تصفية مختلفة.';

  @override
  String get channelDetailsMembersOnline => 'متصل';

  @override
  String get channelDetailsMembersOffline => 'غير متصل';

  @override
  String get channelDetailsMemberYou => 'أنت';

  @override
  String get channelDetailsSearchUsersHint => 'البحث عن مستخدمين';

  @override
  String get channelDetailsSearchUsersTypeToSearch => 'اكتب للبحث عن الأعضاء';

  @override
  String get channelDetailsSearchUsersEmpty => 'لم يتم العثور على مستخدمين';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'لا يوجد مستخدمون متاحون';

  @override
  String get channelDetailsDone => 'تم';

  @override
  String get channelDetailsHasFilterPrompt => 'إظهار الرسائل التي تحتوي على:';

  @override
  String get channelDetailsRetry => 'إعادة المحاولة';

  @override
  String get channelDetailsPinnedMessageTitle => 'رسالة مثبتة';

  @override
  String get channelDetailsSearchResultTitle => 'نتيجة البحث';

  @override
  String get channelDetailsJumpToMessage => 'الانتقال إلى الرسالة';

  @override
  String get channelDetailsUnpinMessage => 'إلغاء تثبيت الرسالة';

  @override
  String get channelDetailsCopyMessageLink => 'نسخ رابط الرسالة';

  @override
  String get channelDetailsCopyMessageId => 'نسخ معرف الرسالة';

  @override
  String get channelDetailsMessageUnpinned => 'تم إلغاء تثبيت الرسالة';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'المجتمع الحالي';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'المحادثة الحالية';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'كل المجتمعات';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'كل الرسائل الخاصة فقط';

  @override
  String get channelDetailsSearchScopeAllDms => 'كل المحادثات';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'الرسائل المباشرة المفتوحة فقط';

  @override
  String get channelDetailsSearchScopeOpenDms => 'المحادثات المفتوحة';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'كل الرسائل الخاصة والمجتمعات';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'الرسائل المباشرة والمجتمعات المفتوحة';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'ابحث فقط في المجتمع الحالي';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'البحث في هذه الدردشة فقط';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'عبر جميع المجتمعات التي تتواجد فيها حاليًا';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'في كل المحادثات الخاصة التي كنت فيها فقط';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'في كل المحادثات الخاصة التي كنت فيها';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'عبر جميع الرسائل المباشرة المفتوحة لديك حاليًا فقط';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'عبر جميع الرسائل المباشرة المفتوحة حاليًا';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'عبر جميع الرسائل الخاصة التي كنت فيها + جميع المجتمعات التي تتواجد فيها حاليًا';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'في جميع الرسائل المباشرة المفتوحة حاليًا + جميع المجتمعات التي أنت عضو فيها';

  @override
  String get channelDetailsSearchSortNewest => 'الأحدث أولاً';

  @override
  String get channelDetailsSearchSortOldest => 'الأقدم أولاً';

  @override
  String get channelDetailsSearchSortRelevance => 'الأكثر صلة';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'إظهار أحدث الرسائل أولاً';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'إظهار أقدم الرسائل أولاً';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'إظهار الرسائل الأكثر صلة أولاً';

  @override
  String get channelDetailsSearchContentImage => 'تحميل صورة';

  @override
  String get channelDetailsSearchContentVideo => 'تحميل الفيديو';

  @override
  String get channelDetailsSearchContentAudio => 'تحميل صوتي';

  @override
  String get channelDetailsSearchContentFile => 'تحميل ملف';

  @override
  String get channelDetailsSearchContentLink => 'رابط';

  @override
  String get channelDetailsSearchContentEmbed => 'معاينة الرابط أو تضمينه';

  @override
  String get channelDetailsSearchContentSticker => 'ملصق';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'ملفات الصور التي تم تحميلها فقط';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'ملفات الفيديو التي تم تحميلها فقط';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'ملفات صوتية تم تحميلها فقط';

  @override
  String get channelDetailsSearchContentFileDescription => 'أي مرفق تم تحميله';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'عنوان URL مكتوب في نص الرسالة';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'معاينات ومرفقات منسقة تم حلها، وليس مرفوعات';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'ملصق مرفق بالرسالة';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count أنواع';
  }

  @override
  String get personalNotesTitle => 'ملاحظات شخصية';

  @override
  String get personalNotesSubtitle => 'مساحتك الخاصة للأفكار والتذكيرات';

  @override
  String groupDmWelcome(String displayName) {
    return 'أهلاً بك في $displayName. أضف الأصدقاء لبدء المجموعة.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'تعديل المجموعة';

  @override
  String get groupDmWelcomeAddFriends => 'إضافة أصدقاء إلى المجموعة';

  @override
  String get dmGroupInvites => 'الدعوات';

  @override
  String get groupDmEditTitle => 'تعديل المجموعة';

  @override
  String get groupDmEditDetailsTooltip => 'تعديل تفاصيل المجموعة';

  @override
  String get groupDmGroupName => 'اسم المجموعة';

  @override
  String get groupDmMyGroup => 'مجموعتي';

  @override
  String get groupDmGroupNameMaxLength => 'يجب ألا يتجاوز اسم المجموعة 100 حرف';

  @override
  String get groupDmGroupIcon => 'أيقونة المجموعة';

  @override
  String get groupDmUploadIcon => 'تحميل أيقونة';

  @override
  String get groupDmChangeIcon => 'تغيير الأيقونة';

  @override
  String get groupDmRemoveIcon => 'إزالة الأيقونة';

  @override
  String get groupDmUpdated => 'تم تحديث المجموعة';

  @override
  String get groupDmUpdateFailed => 'تعذر تحديث المجموعة. حاول مرة أخرى.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'لا يتم دعم الرموز المتحركة. استخدم صورة ثابتة.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'الأيقونات المتحركة غير مدعومة';

  @override
  String get groupDmIconFileTooLargeTitle => 'ملف الأيقونة كبير جدًا';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'الملف كبير جدًا. اختر ملفًا أصغر من $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'تنسيق الأيقونة غير مدعوم';

  @override
  String get groupDmUnsupportedIconFormatBody => 'نوع ملف غير مدعوم.';

  @override
  String get groupDmCouldntProcessImage => 'تعذر معالجة الصورة';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'تعذر معالجة الصورة المقطوعة. حاول مرة أخرى.';

  @override
  String get groupDmInvalidImage => 'صورة غير صالحة';

  @override
  String get groupDmInvalidImageBody => 'هذه الصورة غير صالحة. جرب صورة أخرى.';

  @override
  String get groupDmAddFriends => 'إضافة';

  @override
  String get groupDmOrSendInvite => 'أو أرسل دعوة إلى صديق:';

  @override
  String get groupDmGenerateInviteLink => 'إنشاء رابط دعوة';

  @override
  String get groupDmCreateInvite => 'إنشاء';

  @override
  String get groupDmInviteExpires24Hours => 'تنتهي دعوتك خلال 24 ساعة';

  @override
  String get groupDmAddFriendFailed =>
      'تعذر إضافة هذا الصديق إلى المجموعة. الرجاء المحاولة مرة أخرى.';

  @override
  String get groupDmAddFailed => 'تعذّر الإضافة إلى المجموعة';

  @override
  String get groupDmGroupFull =>
      'هذه المجموعة ممتلئة. أزل شخصًا قبل إضافة المزيد من الأشخاص.';

  @override
  String get groupDmRateLimited => 'أنت سريع جدًا. انتظر لحظة وحاول مرة أخرى.';

  @override
  String get groupDmCreateInviteFailed => 'تعذّر إنشاء رابط الدعوة';

  @override
  String get groupDmCreateInviteFailedBody =>
      'تعذر إنشاء رابط دعوة. يرجى المحاولة مرة أخرى.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'تعذر إنشاء رابط دعوة. يُرجى المحاولة مرة أخرى.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'ليس لديك إذن لإنشاء دعوة في هذه القناة.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'لقد وصل هذا المجتمع إلى الحد الأقصى للدعوات.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'تم تعطيل إنشاء الدعوات مؤقتًا لهذا المجتمع.';

  @override
  String get groupDmCopyInviteFailed => 'تعذّر نسخ رابط الدعوة';

  @override
  String get groupDmInvitesOwnerOnly =>
      'يمكن لمالك المجموعة فقط إدارة الدعوات.';

  @override
  String get groupDmNoInvitesCreated => 'لم يتم إنشاء أي دعوات';

  @override
  String get groupDmLoadingInvites => 'جارٍ تحميل الدعوات...';

  @override
  String get groupDmInvitesLoadFailed => 'تعذّر تحميل الدعوات. حاول مرة أخرى.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'هل تريد إلغاء هذه الدعوة؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get groupDmInviteRevoked => 'الدعوة ملغاة';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'تم الإنشاء بواسطة $name. تنتهي صلاحيته خلال $time.';
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
  String get composerOpenExpressionPicker => 'فتح مُنتقي التعبيرات';

  @override
  String get composerShowKeyboard => 'إظهار لوحة المفاتيح';

  @override
  String get composerCloseAttachmentPanel => 'إغلاق محدد المرفقات';

  @override
  String get chatAttachmentPanelPhotos => 'صور';

  @override
  String get chatAttachmentPanelFiles => 'ملفات';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'مطلوب الوصول إلى مكتبة الصور';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'السماح بالوصول إلى مكتبة الصور لتصفح وإرفاق الصور ومقاطع الفيديو الحديثة.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'فتح الإعدادات';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => '، قيد الإرسال';

  @override
  String get messageAccessibilityFailedSuffix => '، فشل الإرسال';

  @override
  String get messageAccessibilityAttachmentSummary => 'مرفق';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count مرفقات';
  }

  @override
  String get messageAccessibilityImageSummary => 'صورة';

  @override
  String get messageAccessibilityVideoSummary => 'فيديو';

  @override
  String get messageAccessibilityAudioSummary => 'ملف صوتي';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'ملصق $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'ملف $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => 'مرفق مخفي';

  @override
  String get messageAccessibilityEmbedSummary => 'تضمين';

  @override
  String get messageAccessibilityEmptySummary => 'رسالة';

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
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'ابحث في الإعدادات...';

  @override
  String get userSettingsSearchFieldLabel => 'البحث في الإعدادات';

  @override
  String get userSettingsSearchClear => 'مسح البحث';

  @override
  String get userSettingsSearchNoResults => 'لم يتم العثور على إعدادات';

  @override
  String get userSettingsNavProfile => 'الملف الشخصي';

  @override
  String get userSettingsNavSecurityLogin => 'الأمان وتسجيل الدخول';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'الهدايا والرموز';

  @override
  String get giftSettingsClaimAccountTitle => 'المطالبة بحسابك';

  @override
  String get giftSettingsClaimAccountDescription =>
      'استلم حسابك لاسترداد أو إدارة رموز هدايا Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'استرداد هدية';

  @override
  String get giftSettingsRedeemDescription =>
      'أدخل رمز هدية لاسترداد Plutonium لحسابك.';

  @override
  String get giftSettingsRedeemPlaceholder => 'أدخل رمز الهدية…';

  @override
  String get giftSettingsRedeemButton => 'استرداد';

  @override
  String get giftSettingsRedeemSuccess =>
      'تم استرداد الهدية بنجاح. استمتع بـ Plutonium الخاص بك.';

  @override
  String get giftSettingsPurchasedTitle => 'الهدايا التي تم شراؤها';

  @override
  String get giftSettingsPurchasedDescription =>
      'إدارة رموز هدايا Plutonium التي اشتريتها. شارك رابط الهدية مع شخص مميز أو استردها لنفسك!';

  @override
  String get giftSettingsEmptyTitle => 'لا توجد هدايا بعد';

  @override
  String get giftSettingsEmptyDescription =>
      'اشترِ هدية Plutonium من علامة التبويب Plutonium لمشاركتها مع الأصدقاء.';

  @override
  String get giftSettingsGoToPlutonium => 'انتقل إلى Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'فشل تحميل مخزون الهدايا';

  @override
  String get giftSettingsLoadFailedDescription => 'حاول مرة أخرى لاحقًا.';

  @override
  String get giftSettingsTryAgain => 'حاول مرة أخرى';

  @override
  String get giftSettingsGiftUrl => 'رابط الهدية';

  @override
  String get giftSettingsCopy => 'نسخ';

  @override
  String get giftSettingsCopied => 'تم النسخ';

  @override
  String get giftSettingsGiftUrlCopied => 'تم نسخ رابط الهدية إلى الحافظة!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'تعذر نسخ رابط الهدية';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'تم الشراء في $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'تم الاستلام في $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'تم الاستلام بواسطة $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'تم استلام هذه الهدية';

  @override
  String get giftSettingsRedeemForYourself => 'استرد لنفسك';

  @override
  String get giftSettingsShareWithFriend => 'مشاركة مع صديق';

  @override
  String get premiumPlutoniumTagline =>
      'افتح حدودًا أعلى وميزات حصرية مع دعم منصة اتصالات مستقلة.';

  @override
  String get premiumPurchaseMode => 'وضع الشراء';

  @override
  String get premiumForMe => 'لي أنا';

  @override
  String get premiumAsAGift => 'كهدية';

  @override
  String get premiumMonthly => 'شهريًا';

  @override
  String get premiumYearly => 'سنويًا';

  @override
  String get premiumPerMonth => 'شهريًا';

  @override
  String get premiumPerYear => 'سنويًا';

  @override
  String get premiumOneTimePurchase => 'شراء لمرة واحدة';

  @override
  String get premiumSave17 => 'وفّر 17%';

  @override
  String get premiumUpgradeNow => 'الترقية الآن';

  @override
  String get premiumBuyGift => 'شراء هدية';

  @override
  String get premiumOneYearGift => 'هدية لمدة عام واحد';

  @override
  String get premiumOneMonthGift => 'هدية شهر واحد';

  @override
  String get premiumMostPopular => 'الأكثر شيوعًا';

  @override
  String get premiumScrollPrompt =>
      'مرر لأسفل لرؤية جميع المزايا المضمنة مع Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'مجاني مقابل Plutonium';

  @override
  String get premiumFreeColumn => 'مجاني';

  @override
  String get premiumGiftSectionTitle => 'إهداء Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'شارك تجربة Plutonium مع أصدقائك عن طريق شراء اشتراك هدية.';

  @override
  String get premiumGiftBannerOne => 'لديك رمز هدية جديد في انتظارك!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'لديك $count رمز هدية جديد في انتظارك!';
  }

  @override
  String get premiumViewGifts => 'عرض الهدايا';

  @override
  String get premiumReadyToUpgrade => 'هل أنت مستعد للترقية؟';

  @override
  String get premiumReadyToBuyGift => 'هل أنت مستعد لشراء هدية؟';

  @override
  String premiumMonthlyPrice(String price) {
    return 'شهريًا $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'سنويًا $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return 'سنة واحدة $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return 'شهر واحد $price';
  }

  @override
  String get premiumManageSubscription => 'إدارة الاشتراك';

  @override
  String get premiumRedeemGiftCode => 'استرداد رمز الهدية';

  @override
  String get premiumGiftBadge => 'هدية';

  @override
  String get premiumCancelSubscriptionTitle => 'إلغاء الاشتراك؟';

  @override
  String get premiumCancelSubscriptionBody =>
      'ستحتفظ بميزاتك حتى تاريخ التجديد التالي، ثم ستحصل على فترة سماح مدتها 3 أيام لإعادة الاشتراك والاحتفاظ بسجل المشتركين الخاص بك.';

  @override
  String get premiumCancelSubscriptionConfirm => 'إلغاء الاشتراك';

  @override
  String get premiumKeepSubscription => 'الاحتفاظ بالاشتراك';

  @override
  String get premiumPurchaseHistoryTitle => 'سجل الشراء';

  @override
  String get premiumPurchaseHistoryDescription =>
      'فواتيرك الأخيرة. لتغيير طريقة الدفع لاشتراكك، أضف واحدة أو اخترها في بوابة الفوترة واجعلها الافتراضية.';

  @override
  String get premiumManagePaymentMethods => 'إدارة طرق الدفع';

  @override
  String get premiumBillingHistory => 'سجل الفواتير';

  @override
  String get premiumSelfServeRefundTitle => 'استرداد ذاتي';

  @override
  String get premiumSelfServeRefundButton => 'استرداد آخر عملية شراء';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'بإتمام عملية الشراء، أنت توافق على ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'بشرائك، تكون قد وافقت على ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' و ';

  @override
  String premiumActiveUntil(String date) {
    return 'نشط حتى $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'جارٍ الإلغاء';

  @override
  String premiumCancelsOn(String date) {
    return 'يُلغى في $date. تظل المزايا نشطة حتى ذلك الحين.';
  }

  @override
  String get premiumReactivateSubscription => 'إعادة التفعيل';

  @override
  String premiumGiftedUntil(String date) {
    return 'مُهدى حتى $date. لا يتجدد تلقائيًا.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'الميزة';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'بإتمام الشراء، تكون قد وافقت على $terms و $privacy الخاصة بنا.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'تتوفر عمليات استرداد الخدمة الذاتية في غضون 3 أيام من الدفع، ومرة واحدة كل 30 يومًا. يؤدي استرداد الاشتراك إلى إلغائه. يتنازل المشترون في الاتحاد الأوروبي/المنطقة الاقتصادية الأوروبية عن حق الانسحاب لمدة 14 يومًا عند الدفع للوصول إلى المحتوى فورًا. استخدم زر استرداد الأموال داخل التطبيق بدلاً من استرداد المدفوعات. يمكن أن تؤدي عمليات استرداد المدفوعات إلى تقييد حسابك بشكل دائم. تتولى Stripe معالجة الدفع بأمان. لا نرى رقم بطاقتك بالكامل أبدًا.';

  @override
  String get premiumTermsOfService => 'شروط الخدمة';

  @override
  String get premiumPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get premiumCheckoutStartFailedTitle => 'تعذر بدء عملية الدفع';

  @override
  String get premiumCheckoutStartFailedBody =>
      'حدث خطأ ما أثناء بدء عملية الدفع. يرجى المحاولة مرة أخرى بعد قليل.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'أنت حاليًا مشترك في هدية. لن يتم تجديدها. يمكنك استرداد المزيد من رموز الهدايا لتمديدها. يمكن بدء الاشتراكات المتكررة بعد انتهاء فترة هديتك.';

  @override
  String get premiumPlanUnavailable =>
      'هذه الخطة غير متاحة. يُرجى التواصل مع فريق الدعم.';

  @override
  String get premiumCompletePaymentTitle => 'إتمام الدفع';

  @override
  String get premiumCompletePaymentBody =>
      'أنت الآن تنتقل إلى Stripe لإكمال الدفع. عد إلى Fluxer بمجرد الانتهاء منه.';

  @override
  String get premiumChoosePaymentMethodTitle => 'اختيار طريقة الدفع';

  @override
  String get premiumPixPaymentPromptDescription =>
      'ادفع باستخدام Pix تلقائي لتفويض الرسوم المتكررة مباشرة من حسابك البنكي البرازيلي. أو اختر استخدام البطاقة لإدخال بطاقة ائتمان في الشاشة التالية لـ Stripe.';

  @override
  String get premiumUsePix => 'استخدم بيكس';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'ادفع باستخدام UPI لإعداد تفويض إلكتروني متوافق مع RBI من البنك الهندي الخاص بك. أو اختر استخدام البطاقة لإدخال بطاقة ائتمان في الشاشة التالية لـ Stripe.';

  @override
  String get premiumUseUpi => 'استخدم UPI';

  @override
  String get premiumUseCard => 'استخدام البطاقة';

  @override
  String get premiumCustomerPortalOpenFailedTitle => 'تعذر فتح بوابة الفوترة';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'حدث خطأ ما أثناء فتح بوابة الفوترة. يرجى المحاولة مرة أخرى بعد قليل.';

  @override
  String get premiumAlreadyVisionaryTitle => 'أنت بالفعل Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'يتضمن Visionary بالفعل وصولاً دائمًا، لذا لا يلزم اشتراك متكرر. لا يزال بإمكانك شراء هدايا للآخرين.';

  @override
  String get premiumExistingSubscriptionTitle => 'الاشتراك موجود بالفعل';

  @override
  String get premiumExistingSubscriptionBody =>
      'لقد وجدنا اشتراكًا حاليًا في Fluxer Plutonium لهذا الحساب. قم بإدارته في بوابة الفوترة الآمنة لتحديث تفاصيل الدفع أو التحقق من حالة التجديد. إذا دفعت للتو، انتظر دقيقة وأعد فتح هذه الصفحة.';

  @override
  String get premiumPurchasesDisabledTitle => 'المشتريات غير متاحة';

  @override
  String get premiumPurchasesDisabledBody =>
      'تم تعطيل عمليات الشراء لهذا الحساب. اتصل بـ support@fluxer.app إذا بدا هذا الأمر خاطئًا.';

  @override
  String get premiumClaimAccountToPurchase =>
      'احصل على حسابك لشراء Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'تحتاج إلى التحقق من بريدك الإلكتروني قبل أن تتمكن من شراء Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'علامة اسم المستخدم المخصصة';

  @override
  String get premiumPerkPerCommunityProfiles => 'ملفات تعريف خاصة بكل مجتمع';

  @override
  String get premiumPerkMessageScheduling => 'جدولة الرسائل';

  @override
  String get premiumPerkProfileBadge => 'شارة الملف الشخصي';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'خلفيات فيديو مخصصة';

  @override
  String get premiumPerkEntranceSounds => 'أصوات الدخول';

  @override
  String get premiumPerkCommunities => 'المجتمعات';

  @override
  String get premiumPerkMessageCharacterLimit => 'حد الرسائل من حيث عدد الأحرف';

  @override
  String get premiumPerkBookmarkedMessages => 'الرسائل المحفوظة';

  @override
  String get premiumPerkFileUploadSize => 'حجم تحميل الملف';

  @override
  String get premiumPerkEmojiStickerPacks => 'حزم الرموز التعبيرية والملصقات';

  @override
  String get premiumPerkSavedMedia => 'الوسائط المحفوظة';

  @override
  String get premiumPerkUseAnimatedEmojis =>
      'استخدام الرموز التعبيرية المتحركة';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'الوصول الشامل إلى الرموز التعبيرية والملصقات';

  @override
  String get premiumPerkVideoQuality => 'جودة الفيديو';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'صور رمزية ولافتات ملف شخصي متحركة';

  @override
  String get premiumPerkEarlyAccess => 'وصول مبكر للميزات الجديدة';

  @override
  String get premiumPerkCustomThemes => 'سمات مخصصة';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'حتى 4K/60 إطارًا في الثانية';

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
  String get userSettingsNavShortcuts => 'اختصارات لوحة المفاتيح';

  @override
  String get audioAndVideoAudioSectionTitle => 'الصوت';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'اضبط الميكروفون ومكبرات الصوت ومعالجة الصوت لديك.';

  @override
  String get audioAndVideoVideoSectionTitle => 'فيديو';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'اضبط جودة الكاميرا ومشاركة الشاشة.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'سلوك أثناء المكالمة';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'التحكم في مطالبات التأكيد أثناء المكالمات الصوتية والمرئية.';

  @override
  String get audioAndVideoInputDeviceLabel => 'جهاز الإدخال';

  @override
  String get audioAndVideoOutputDeviceLabel => 'جهاز الإخراج';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'افتراضي';

  @override
  String get audioAndVideoUseSpeakerLabel => 'استخدام مكبر الصوت';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'عند إيقاف التشغيل، يتم تشغيل الصوت عبر سماعة الأذن أو سماعات الرأس المتصلة.';

  @override
  String get audioAndVideoInputVolumeLabel => 'مستوى صوت الإدخال';

  @override
  String get audioAndVideoOutputVolumeLabel => 'مستوى صوت الإخراج';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'معالجة الصوت';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'صوت مركّز';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'مُوصى به. ينقّي الميكروفون الخاص بك للحصول على كلام واضح.';

  @override
  String get audioAndVideoDirectInputLabel => 'إدخال مباشر';

  @override
  String get audioAndVideoDirectInputDescription =>
      'يرسل صوتك دون أي تعديل. الأفضل إذا كنت تستخدم برنامج صوت خارجي.';

  @override
  String get audioAndVideoCustomProfileLabel => 'مخصص';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'اضبط كل إعداد بنفسك: كتم الضوضاء، وإلغاء الصدى، والربح.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'إزالة الضوضاء';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'محسّن';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'عادي';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'بلا';

  @override
  String get audioAndVideoEchoCancellationLabel => 'إلغاء الصدى';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'التحكم التلقائي في الكسب';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'يعادل مستوى صوت الميكروفون لديك. يتم إيقافه عند تشغيل كبت الصوت المحسن.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'اختبار الميكروفون';

  @override
  String get audioAndVideoMicTestStartLabel => 'بدء اختبار الميكروفون';

  @override
  String get audioAndVideoMicTestStopLabel => 'إيقاف اختبار الميكروفون';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return 'يحتاج $productName إلى الوصول إلى الميكروفون لاختبار إدخالك.';
  }

  @override
  String get audioAndVideoCameraLabel => 'الكاميرا';

  @override
  String get audioAndVideoMirrorCameraLabel => 'عكس الكاميرا';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'جودة الكاميرا';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'جودة مشاركة الشاشة';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'معدل الإطارات';

  @override
  String get audioAndVideoFrameRate15Label => '15 إطارًا في الثانية';

  @override
  String get audioAndVideoFrameRate30Label => '30 إطارًا في الثانية';

  @override
  String get audioAndVideoFrameRate60Label => '60 إطارًا في الثانية';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return 'يتطلب خيار 1080p و 60 إطارًا في الثانية $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'تسمح هذه النسخة حاليًا بمشاركة الشاشة بدقة تصل إلى 720 بكسل بمعدل 30 إطارًا في الثانية.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return 'يحتاج $productName إلى إذن الوصول للميكروفون لسرد أجهزتك.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return 'يحتاج $productName إلى الوصول إلى الكاميرا لسرد أجهزتك.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'لا تسأل عند إخفاء الكاميرا الخاصة بي';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'لا تسأل عند إخفاء مشاركة شاشتي';

  @override
  String get userSettingsNavNotifications => 'الإشعارات';

  @override
  String get notificationsGeneralSectionTitle => 'عام';

  @override
  String get notificationsEnableNotificationsLabel => 'تفعيل الإشعارات';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'تلقَّ إشعارات عند استلام الرسائل. قد تحتاج إلى السماح بالإشعارات لتطبيق $productName في إعدادات جهازك. للتحكم في الإشعارات لكل قناة/مجتمع، افتح إعدادات الإشعارات من قائمة المجتمع.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'تفعيل إشعارات سطح المكتب';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'يستخدم مركز إشعارات نظام التشغيل. للتحكم في الإشعارات لكل قناة/مجتمع، انقر بزر الماوس الأيمن على أيقونة المجتمع وافتح إعدادات الإشعارات.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'تفعيل إشعارات المتصفح';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'تلقَّ إشعارات عند استلامك رسائل. قد تحتاج إلى السماح بالإشعارات في إعدادات المتصفح. للتحكم في الإشعارات لكل قناة/مجتمع، انقر بزر الفأرة الأيمن على أيقونة المجتمع وافتح إعدادات الإشعارات.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'مهلة عدم نشاط إشعارات الدفع';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return 'يتجنب $productName إرسال إشعارات الدفع إلى أجهزتك المحمولة عندما تكون أمام جهاز الكمبيوتر الخاص بك. اختر المدة التي تحتاجها لتكون غير نشط على سطح المكتب قبل أن تتلقى إشعارات الدفع.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute دقيقة';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes دقيقة';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'تفضيلات الإشارة';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'تفضيلات الإشارة في الردود';

  @override
  String get notificationsMentionNoPreferenceName => 'لا توجد أفضلية';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'احترام نية المرسل، بدون تحذير عند تبديل إشارة @';

  @override
  String get notificationsMentionPreferMentionName => 'تفضيل الإشارة إلى';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'الردود الافتراضية على الإشارة إليك، وتحذير المُرسِل إذا قام بتعطيلها';

  @override
  String get notificationsMentionPreferNoMentionName => 'تفضيل عدم الإشارة';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'الردود الافتراضية تحذف الإشارة (@mention)، وتنبه المُرسِل إذا قام بتفعيلها';

  @override
  String get notificationsTtsSectionTitle => 'إشعارات تحويل النص إلى كلام';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'تفعيل قراءة الرسائل بصوت عالٍ';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'دع /tts يقرأ رسالتك بصوت عالٍ. يؤدي تعطيل هذا الإعداد إلى إبقاء هذه الأوامر كنص عادي.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix => 'اضبط سرعة التشغيل في ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'تسهيلات الاستخدام';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => 'سرد الرسائل تلقائيًا';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'يحوّل المحتوى الوارد إلى كلام، بغض النظر عما إذا كان قد أتى من /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'كل القنوات';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'اجعل كل رسالة واردة تُنطق، بغض النظر عن القناة المفتوحة.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'القناة النشطة فقط';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'يسرد القناة التي تشاهدها فقط. تتبعك السرد بين القنوات.';

  @override
  String get notificationsTtsModeNeverName => 'أبدًا تلقائيًا';

  @override
  String get notificationsTtsModeNeverDescription =>
      'ابقَ صامتًا ما لم يقم شخص بتشغيل /tts يدويًا.';

  @override
  String get notificationsTtsModeAriaLabel => 'نطق جميع الرسائل بصوت عالٍ';

  @override
  String get notificationsSoundsSectionTitle => 'الأصوات';

  @override
  String get notificationsMasterVolumeLabel => 'مستوى الصوت الرئيسي';

  @override
  String get notificationsMasterVolumeDescription =>
      'يحدد مستوى كل مؤثر صوتي. تتجاهل التجاوزات لكل صوت هذا الإعداد.';

  @override
  String get notificationsResetToDefaultVolume =>
      'إعادة ضبط مستوى الصوت إلى الافتراضي';

  @override
  String get notificationsDisableAllSoundsLabel => 'تعطيل جميع أصوات الإشعارات';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'سيتم الاحتفاظ بإعدادات صوت الإشعارات الحالية.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'إظهار المزيد من المؤثرات الصوتية';

  @override
  String get notificationsShowFewerSoundEffects =>
      'إخفاء المزيد من المؤثرات الصوتية';

  @override
  String get notificationsPreviewSound => 'معاينة الصوت';

  @override
  String get notificationsPerSoundVolumeTitle => 'مستوى صوت كل صوت';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'عيّن مستويات صوت مخصصة للأصوات الفردية. تتبع الأصوات التي لا تحتوي على تجاوز مستوى الصوت الرئيسي.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'عدد التعديلات المطبقة على مستوى الصوت المخصص النشط: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'متابعة الرئيسي • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'إعادة ضبط $label إلى مستوى الصوت الرئيسي';
  }

  @override
  String get notificationsResetAllOverrides => 'إعادة ضبط كل التجاوزات';

  @override
  String notificationsMuteSound(String label) {
    return 'كتم صوت $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'إلغاء كتم صوت $label';
  }

  @override
  String get notificationsSoundMessage => 'إشعارات رسائل المجتمع';

  @override
  String get notificationsSoundDirectMessage => 'إشعارات الرسائل المباشرة';

  @override
  String get notificationsSoundSameChannelMessage =>
      'إشعارات رسائل القناة الحالية';

  @override
  String get notificationsSoundMute => 'كتم الصوت';

  @override
  String get notificationsSoundUnmute => 'إلغاء كتم الصوت';

  @override
  String get notificationsSoundDeaf => 'كتم صوتي';

  @override
  String get notificationsSoundUndeaf => 'إلغاء كتم الصوت';

  @override
  String get notificationsSoundUserJoin => 'انضم المستخدم إلى القناة';

  @override
  String get notificationsSoundUserLeave => 'غادر المستخدم القناة';

  @override
  String get notificationsSoundUserMove => 'نقل المستخدم القناة';

  @override
  String get notificationsSoundViewerJoin => 'انضم المشاهد إلى البث';

  @override
  String get notificationsSoundViewerLeave => 'غادر المشاهد البث';

  @override
  String get notificationsSoundVoiceDisconnect => 'تم قطع الاتصال الصوتي';

  @override
  String get notificationsSoundIncomingRing => 'مكالمة واردة';

  @override
  String get notificationsSoundCameraOn => 'الكاميرا قيد التشغيل';

  @override
  String get notificationsSoundCameraOff => 'الكاميرا متوقفة';

  @override
  String get notificationsSoundScreenShareStart => 'بدء مشاركة الشاشة';

  @override
  String get notificationsSoundScreenShareStop => 'إيقاف مشاركة الشاشة';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'تعذر تحديث مهلة إشعارات الدفع. حاول مرة أخرى.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'تعذر تحديث تفضيل الإشارة. حاول مرة أخرى.';

  @override
  String get notificationsPermissionDeniedTitle => 'الإشعارات محظورة';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'تعذر تمكين الإشعارات. اسمح بإذن الإشعارات للمتابعة.';

  @override
  String get userSettingsNavLanguageAndTime => 'اللغة والوقت';

  @override
  String get languageAndTimeLanguageSectionTitle => 'لغة الواجهة';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'اختر اللغة المستخدمة في التطبيق بأكمله';

  @override
  String get languageAndTimeOpenLanguageSettings => 'فتح إعدادات اللغة';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'تنسيق الوقت';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'اختر كيفية عرض الأوقات في جميع أنحاء التطبيق';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'اختيار تنسيق الوقت';

  @override
  String get languageAndTimeTimeFormatAuto => 'تلقائي';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 ساعة';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 ساعة';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'لغة التطبيق: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'لغة النظام: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'استخدام لغة النظام لتنسيق الوقت';

  @override
  String get languageAndTimeTimeFormatSyncFailed => 'فشل تحديث تنسيق الوقت';

  @override
  String get userSettingsNavDefaultApps => 'التطبيقات الافتراضية';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'متصفح الويب';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'اختر المتصفح الذي سيتم فتحه عند النقر على رابط.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'إذا كان هناك تطبيق مثبت لموقع ما، فستُفتح الروابط في هذا التطبيق أولاً.';

  @override
  String get defaultAppsWebBrowserInApp => 'متصفح داخل التطبيق';

  @override
  String get defaultAppsWebBrowserExternal => 'المتصفح الخارجي';

  @override
  String get userSettingsNavAdvanced => 'خيارات متقدمة';

  @override
  String get advancedPerformanceReportingTitle => 'تقارير الأداء';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'ساعد في تحسين $productName عن طريق مشاركة بيانات الأعطال والأداء المجهولة.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'إرسال تقارير الأعطال والأداء';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'جميع البيانات المبلغ عنها مجهولة ويتم إرسالها فقط إلى خدمة المراقبة الخاصة بـ $productName - لا يتم استخدام أي مزودين خارجيين.';
  }

  @override
  String get advancedSettingsConfigure => 'تكوين';

  @override
  String get advancedSettingsCategoryPrivacy => 'الخصوصية';

  @override
  String get advancedSettingsCategoryAppearance => 'المظهر';

  @override
  String get advancedSettingsCategoryAccessibility => 'تسهيلات الاستخدام';

  @override
  String get advancedSettingsCategoryChat => 'الدردشة';

  @override
  String get advancedSettingsCategoryMedia => 'الوسائط';

  @override
  String get advancedSettingsCategoryVoice => 'صوت';

  @override
  String get advancedSettingsCategoryDeveloper => 'مطور';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'تمكين تحديد النص';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'السماح بتحديد النص في التطبيق.';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'تفعيل صور مصغّرة للبحث في الفيديو';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'صورة مصغرة أو إطار مباشر أثناء التمرير عبر الفيديو';

  @override
  String get advancedSettingHapticFeedbackLabel => 'الاهتزاز';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'اهتزاز للتنبيه عند النقر والإجراءات. لن تتم مزامنته عبر الأجهزة.';

  @override
  String get advancedSettingShowNekoLabel => 'إظهار Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'قط نِيكو يطارد مؤشر الفأرة الخاص بك';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'إظهار Neko في مربع إدخال الدردشة لديك';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'رسوم متحركة لتكبير الشاشة';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'تصغير شعار التطبيق عند مغادرة شاشة البداية';

  @override
  String get advancedSettingKeyboardHintsLabel => 'تلميحات لوحة المفاتيح';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'تلميحات اختصارات لوحة المفاتيح في مربعات الأدوات.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'تفعيل المفضلة';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'إظهار العناصر المفضلة في جميع أنحاء التطبيق';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'سلوك الانضمام إلى القناة الصوتية';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'تأكيد أو نقر مزدوج للانضمام إلى قنوات الصوت الخاصة بالمجتمع.';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'تتطلب النقر المزدوج للانضمام إلى القنوات الصوتية';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'تأكيد قبل الانضمام إلى القنوات الصوتية';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'إرسال صور GIF تلقائيًا عند تحديدها';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'إرسال صور GIF تلقائيًا من المنتقي بدون تأكيد';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'حفظ صور GIF المفضلة كوسائط محفوظة';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'اختر كيفية تخزين صور GIF المفضلة والمميزة بنجمة';

  @override
  String get advancedSettingMediaButtonsLabel => 'أزرار الوسائط';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'خصّص الأزرار والمؤشرات التي تظهر على المرفقات والتضمينات الإعلامية';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'حمّل المرفقات قبل الإرسال';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'ابدأ بتحميل المرفقات بمجرد إضافتها إلى حقل إدخال الرسالة';

  @override
  String get advancedSettingStripTrackingLabel =>
      'إزالة معلمات التتبع من الروابط';

  @override
  String get advancedSettingStripTrackingDescription =>
      'إزالة معلمات التتبع تلقائيًا من الروابط في الرسائل التي ترسلها';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'الوثوق بجميع الروابط الخارجية';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'تجاوز تحذير الرابط الخارجي لجميع النطاقات';

  @override
  String get advancedSettingSearchEnginesLabel => 'محركات البحث';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'تكوين محركات البحث المستخدمة من النص المحدد';

  @override
  String get advancedSettingTranslatorsLabel => 'المترجمون';

  @override
  String get advancedSettingTranslatorsDescription =>
      'تكوين موفري الترجمة المستخدمين من النص المحدد';

  @override
  String get advancedSettingReverseImageSearchLabel => 'البحث العكسي عن الصور';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'موفرو خدمة البحث العكسي عن الصور';

  @override
  String get advancedSettingMessageActionBarLabel => 'شريط إجراءات الرسالة';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'تخصيص شريط الإجراءات الذي يظهر عند تمرير المؤشر فوق الرسائل';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'الإكمال التلقائي للتعبيرات';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'اختر ما يظهر عند كتابة علامة النقطتين في مربع إدخال الرسائل';

  @override
  String get advancedSettingInputButtonsLabel => 'أزرار إدخال الرسائل';

  @override
  String get advancedSettingInputButtonsDescription =>
      'اختر الأزرار التي ستظهر في مربع إدخال الرسائل';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'التمرير للأسفل عند إرسال رسالة';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'اختر كيفية انتقال الدردشة بعد إرسال رسالة';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'تخطّي تأكيد \"وضع علامة مقروء للكل\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'وضع علامة \"مقروء\" على جميع قنوات البريد الوارد غير المقروءة فورًا، دون طلب تأكيد';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'إخفاء القنوات المكتومة افتراضيًا';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'إخفاء القنوات التي كتمتها من الأشرطة الجانبية للمجتمعات';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'إظهار مؤشر GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'إظهار مؤشر انتهاء صلاحية المرفق';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'إظهار زر الحذف';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'إظهار زر التنزيل';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'إظهار زر المفضلة';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'إظهار زر \"إخفاء المرفقات\"';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'إظهار شريط إجراءات الرسالة';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'إظهار زر المزيد فقط';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'إظهار التفاعلات السريعة';

  @override
  String get advancedSettingEnableShiftToExpandLabel => 'تفعيل Shift للتوسيع';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'إظهار الرموز التعبيرية الافتراضية في الإكمال التلقائي للتعبيرات';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'إظهار الرموز التعبيرية المخصصة في الإكمال التلقائي للتعبيرات';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'إظهار الملصقات في الإكمال التلقائي للتعبيرات';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'إظهار الوسائط المحفوظة في الإكمال التلقائي للتعبيرات';

  @override
  String get advancedSettingShowGifsButtonLabel => 'إظهار زر صور GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'إظهار زر الوسائط';

  @override
  String get advancedSettingShowStickersButtonLabel => 'إظهار زر الملصقات';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'إظهار زر الرموز التعبيرية';

  @override
  String get advancedSettingShowSendButtonLabel => 'إظهار زر الإرسال';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'إظهار تنبيهات الجهاز الجديد';

  @override
  String get advancedSettingNewDeviceAlertsDescription => 'طلب أجهزة صوت جديدة';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'عناصر تحكم مستوى صوت الاتصال';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'إظهار عناصر تحكم مستوى صوت المشاركين لكل جهاز في قوائم الصوت';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'سلوك معاينة مشاركة الشاشة';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'معاينة، وإظهار في نافذة منفصلة، وسلوك الصورة المصغرة للبث المباشر';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'برنامج ترميز مشاركة الشاشة';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'برنامج ترميز الفيديو لمشاركة الشاشة';

  @override
  String get advancedSettingScreenShareCodecAuto => 'تلقائي (موصى به)';

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
      'إيقاف معاينة مشاركة الشاشة مؤقتًا في الخلفية';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'إخفاء الصورة المصغرة لمعاينة البث الخاص بي';

  @override
  String get advancedSettingDeveloperModeLabel => 'تفعيل وضع المطور';

  @override
  String get advancedSettingDeveloperModeDescription => 'تفعيل وضع المطور';

  @override
  String get advancedSettingSearchEngineGoogle => 'جوجل';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'Bing';

  @override
  String get advancedSettingSearchEngineGoogleLens => 'عدسة جوجل';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => 'ترجمة Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'محرك البحث الافتراضي';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'اختر محرك البحث الذي سيتم استخدامه افتراضيًا عند البحث عن النص المحدد.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'محركات البحث المضمّنة';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'تفعيل أو تعطيل محركات البحث المدمجة. تظهر المحركات المفعّلة في قائمة سياق الرسالة عند تحديد النص.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'محركات البحث المخصصة';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'أضف محركات البحث الخاصة بك بنمط عنوان URL مخصص. استخدم \"$query\" كعنصر نائب لنص البحث.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'إضافة محرك بحث';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'قم بتمكين محرك بحث واحد على الأقل أدناه.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'إزالة محرك البحث';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'المترجم الافتراضي';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'اختر المترجم الذي سيُستخدم افتراضيًا عند ترجمة النص المحدد.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'أدوات الترجمة المضمّنة';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'تفعيل أو تعطيل أدوات الترجمة المدمجة. تظهر أدوات الترجمة المفعّلة في قائمة سياق الرسالة عند تحديد النص.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'المترجمون المخصصون';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'أضف مترجمين خاصين بك بنمط عنوان URL مخصص. استخدم \"$query\" كعنصر نائب للنص المراد ترجمته.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'إضافة مترجم';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'يجب تفعيل مترجم واحد على الأقل أدناه.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'إزالة المترجم';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'البحث العكسي الافتراضي للصور';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'اختر خدمة البحث العكسي عن الصور التي تُستخدم افتراضيًا عند البحث عن صورة.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'البحث العكسي عن الصور المضمّن';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'تفعيل أو تعطيل مزودي البحث العكسي المدمجين عن الصور. تظهر الجهات المفعّلة في قائمة السياق للصور، والصور الرمزية، واللافتات، والملصقات، والرموز التعبيرية.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'بحث مخصص بالصور العكسي';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'أضف مزودي بحث الصور العكسية الخاصين بك بنمط عنوان URL مخصص. استخدم \"$url\" كعنصر نائب لرابط الصورة.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'إضافة بحث عكسي بالصور';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'قم بتمكين مزود واحد على الأقل للبحث العكسي عن الصور أدناه.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'إزالة البحث العكسي عن الصور';

  @override
  String get advancedSettingAddSearchEngineTitle => 'إضافة محرك بحث';

  @override
  String get advancedSettingEditSearchEngineTitle => 'تعديل محرك البحث';

  @override
  String get advancedSettingAddTranslatorTitle => 'إضافة مزود ترجمة';

  @override
  String get advancedSettingEditTranslatorTitle => 'تعديل مزود الترجمة';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'إضافة محرك بحث للصور العكسي';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'تعديل محرك البحث العكسي للصور';

  @override
  String get advancedSettingSearchProviderNameLabel => 'الاسم';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'نمط عنوان URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'محرك البحث الخاص بي';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'المترجم الخاص بي';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'بحثي العكسي عن الصور';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'استخدم \'$query\' حيث يجب إدراج نص البحث.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'استخدم \"$query\" حيث يجب إدراج النص المراد ترجمته.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'استخدم \'$url\' حيث يجب إدراج عنوان URL للصورة.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'الاسم مطلوب.';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'نمط عنوان URL مطلوب.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'يجب أن يحتوي نمط عنوان URL على العنصر النائب \"$query\".';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'يجب أن يحتوي نمط عنوان URL على العنصر النائب \"$url\".';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'يجب أن يكون نمط عنوان URL صالحًا.';

  @override
  String get advancedSettingAddSearchProviderAction => 'إضافة';

  @override
  String get advancedSettingEditSearchProviderAction => 'تعديل';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'إزالة';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'هل أنت متأكد أنك تريد إزالة $engineName؟';
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
  String get userSettingsJoinFluxerLabs => 'انضم إلى مختبرات Fluxer';

  @override
  String get userSettingsNavAppLicenses => 'تراخيص التطبيق';

  @override
  String get userSettingsAppLicensesDescription =>
      'البرامج مفتوحة المصدر المستخدمة في هذا التطبيق. هذا التطبيق مبني باستخدام Flutter.';

  @override
  String get userSettingsAppLicensesLoadError => 'تعذر تحميل تراخيص التطبيق.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تراخيص',
      one: 'ترخيص واحد',
    );
    return '$_temp0';
  }

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
  String get savedMessagesEmptyTitle => 'لا توجد رسائل محفوظة';

  @override
  String get savedMessagesEmptyBody => 'احفظ الرسائل للرجوع إليها لاحقًا.';

  @override
  String get savedMessagesEndBody => 'لا يوجد المزيد لرؤيته هنا.';

  @override
  String get savedMessagesRemoveTooltip => 'إزالة الإشارة المرجعية';

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
  String get uiSearch => 'بحث';

  @override
  String get uiStartCall => 'بدء المكالمة';

  @override
  String get uiStartVideoCall => 'بدء مكالمة فيديو';

  @override
  String get uiPlay => 'تشغيل';

  @override
  String get uiPause => 'إيقاف مؤقت';

  @override
  String get uiDownload => 'تنزيل';

  @override
  String get uiMoreActions => 'المزيد من الإجراءات';

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
    return 'سيؤدي هذا إلى إخطار $count من الأعضاء الذين لديهم دور $roleName. هل تريد المتابعة؟';
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
  String get guildNavbarGuildSelected => 'محدد';

  @override
  String get guildNavbarGuildUnread => 'غير مقروءة';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count منشنات',
      one: 'منشن واحد',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'صامت';

  @override
  String get authShowPassword => 'عرض كلمة المرور';

  @override
  String get authHidePassword => 'إخفاء كلمة المرور';

  @override
  String get chatLoadingMessages => 'جارٍ تحميل الرسائل';

  @override
  String get friendsMessageFriend => 'رسالة';

  @override
  String get friendsFriendActions => 'إجراءات الصديق';

  @override
  String get friendsAcceptRequest => 'قبول طلب الصداقة';

  @override
  String get friendsDeclineRequest => 'رفض طلب صداقة';

  @override
  String get friendsCancelRequest => 'إلغاء طلب الصداقة';

  @override
  String get friendsOpenInbox => 'البريد الوارد';

  @override
  String get profileRemoveFriend => 'إزالة صديق';

  @override
  String get profileUnblockUser => 'إلغاء حظر المستخدم';

  @override
  String get profileAcceptFriendRequest => 'قبول طلب الصداقة';

  @override
  String get profileCancelFriendRequest => 'إلغاء طلب الصداقة';

  @override
  String get profileSendFriendRequest => 'إضافة صديق';

  @override
  String get accountOverflowMenu => 'خيارات الحساب';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navNotifications => 'الإشعارات';

  @override
  String get navYou => 'أنت';

  @override
  String get guildFolderSettingsTitle => 'إعدادات المجلد';

  @override
  String get guildFolderNameLabel => 'اسم المجلد';

  @override
  String get guildFolderColorLabel => 'لون المجلد';

  @override
  String get guildFolderShowIconWhenCollapsed => 'إظهار الأيقونة عند الطي';

  @override
  String get guildFolderIconLabel => 'أيقونة المجلد';

  @override
  String get guildFolderDelete => 'حذف المجلد';

  @override
  String get guildFolderIconFolder => 'مجلد';

  @override
  String get guildFolderIconStar => 'تمييز بنجمة';

  @override
  String get guildFolderIconHeart => 'قلب';

  @override
  String get guildFolderIconBookmark => 'إشارة مرجعية';

  @override
  String get guildFolderIconGameController => 'وحدة تحكم الألعاب';

  @override
  String get guildFolderIconShield => 'درع';

  @override
  String get guildFolderIconMusicNote => 'نوتة موسيقية';

  @override
  String get guildFolderMarkAsRead => 'وضع المجلد كمقروء';

  @override
  String get guildBulkMuteCommunities => 'كتم صوت المنتديات';

  @override
  String get guildBulkUnmuteCommunities => 'إلغاء كتم صوت المجتمعات';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'إعدادات إشعارات المجتمع';

  @override
  String get guildBulkCommunityPrivacySettings => 'إعدادات خصوصية المجتمع';

  @override
  String get guildBulkAllowEveryoneAndHere => 'السماح لـ @everyone و @here';

  @override
  String get guildBulkAllowRoleMentions => 'السماح بالإشارة إلى الأدوار';

  @override
  String get guildBulkEnableMobilePush => 'تفعيل إشعارات الجوال الفورية';

  @override
  String get guildBulkDisableMobilePush => 'تعطيل إشعارات الدفع على الجوال';

  @override
  String get guildBulkAllowDirectMessages => 'السماح بالرسائل المباشرة';

  @override
  String get guildBulkBlockDirectMessages => 'حظر الرسائل المباشرة';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'السماح للروبوتات بإرسال رسائل مباشرة';

  @override
  String get guildBulkBlockBotDirectMessages => 'حظر الرسائل المباشرة من البوت';

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
  String get guildNavbarChannelTypeSelection => 'اختيار نوع القناة';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'متاح لموظفي $productName فقط';
  }

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
  String get guildMenuSettingsChannels => 'القنوات';

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
  String get guildSettingsRolesNewRole => 'دور جديد';

  @override
  String get guildSettingsRolesDeleteRole => 'حذف الدور';

  @override
  String get guildSettingsRolesBackToRoles => 'العودة إلى الأدوار';

  @override
  String get guildSettingsBackToSettings => 'العودة إلى الإعدادات';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'تعديل \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle => 'تكوين إعدادات الدور والأذونات';

  @override
  String get guildSettingsRolesDisplaySection => 'عرض';

  @override
  String get guildSettingsRolesRoleName => 'اسم الدور';

  @override
  String get guildSettingsRolesRoleColor => 'لون الدور';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'اكتب لونًا (سداسي عشري، rgb()، hsl()، أو اسم) أو استخدم منتقي الألوان.';

  @override
  String get guildSettingsRolesShowSeparately => 'إظهار هذا الدور بشكل منفصل';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'يعرض الأعضاء الذين لديهم هذا الدور في قسم خاص بهم ضمن قائمة الأعضاء.';

  @override
  String get guildSettingsRolesAllowMentions => 'السماح بالإشارة إلى هذا الدور';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'يمكن للأعضاء الذين لديهم صلاحية \"$permission\" دائمًا الإشارة إلى الأدوار، بغض النظر عن هذا الإعداد.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'استخدم هذا الزر لمسح جميع الأذونات بسرعة.';

  @override
  String get guildSettingsRolesClearPermissions => 'مسح الأذونات';

  @override
  String get guildSettingsRolesPermissionsSection => 'الأذونات';

  @override
  String get guildSettingsRolesSearchPermissions => 'البحث عن الأذونات';

  @override
  String get guildSettingsRolesDenseLayout => 'تخطيط مكثف';

  @override
  String get guildSettingsRolesComfyLayout => 'تخطيط مريح';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'التبديل إلى التخطيط المضغوط';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'التبديل إلى التخطيط المريح';

  @override
  String get guildSettingsRolesSingleColumn => 'عمود واحد';

  @override
  String get guildSettingsRolesTwoColumns => 'عمودان';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'التبديل إلى عمود واحد';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'التبديل إلى عمودين';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'لم يتم العثور على أذونات';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'ترتيب العرض المخصص';

  @override
  String get guildSettingsRolesHoistOrder => 'ترتيب الظهور';

  @override
  String get guildSettingsRolesResetHoistOrder => 'إعادة للوضع الافتراضي';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'اسحب الأدوار لتخصيص ترتيب ظهورها في قائمة الأعضاء.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'لا توجد أدوار معروضة. قم بتمكين \"إظهار هذا الدور بشكل منفصل\" على دور لرؤيته هنا.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'لا يمكنك تعديل هذا الدور لأنه دورك الأعلى أو أعلى منك';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'تحتاج إلى صلاحية \"$permission\" لتعديل هذه الصلاحيات';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'لا يمكنك تعديل دور مساوٍ لدورك الأعلى أو أعلى منه';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'لا يمكنك منح إذن لا تملكه';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'لا يمكنك إزالة هذا الإذن لأنه سيزيله منك';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'تم تحديث الأدوار بنجاح';

  @override
  String get guildSettingsRolesCreatedSuccess => 'تم إنشاء الدور بنجاح';

  @override
  String get guildSettingsRolesDeletedSuccess => 'تم حذف الدور بنجاح';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'تمت إعادة ترتيب الظهور إلى الافتراضي';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'اسم الدور مطلوب';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'امنح الدور اسمًا قبل الحفظ.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'تعذّر إنشاء الدور';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'تعذّر تحديث الأدوار';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'تعذّر حذف الدور';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'لم يتم حذف \"$name\". حاول مرة أخرى.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'تعذر إعادة تعيين ترتيب الرفع';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'حاول مرة أخرى بعد قليل.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'هل أنت متأكد من رغبتك في حذف دور $name؟ أي أعضاء لديهم هذا الدور لن يعود لديهم.';
  }

  @override
  String get permissionCategoryCommunityWide => 'على مستوى المجتمع';

  @override
  String get permissionCategoryMessagesMedia => 'الرسائل والوسائط';

  @override
  String get permissionCategoryModeration => 'الإشراف';

  @override
  String get permissionCategoryChannelAccess => 'الوصول إلى القناة';

  @override
  String get permissionCategoryChannelManagement => 'إدارة القنوات';

  @override
  String get permissionCategoryAudioVideo => 'الصوت والفيديو';

  @override
  String get permissionUnknown => 'إذن غير معروف';

  @override
  String get permissionAdministrator => 'مسؤول';

  @override
  String get permissionAdministratorDescription =>
      'يمنح جميع الأذونات ويتجاوز قيود القناة. حساسة للغاية.';

  @override
  String get permissionViewActivityLog => 'عرض سجل النشاط';

  @override
  String get permissionViewActivityLogDescription =>
      'قراءة سجل نشاط المجتمع للتغييرات وإجراءات الإشراف.';

  @override
  String get permissionManageCommunity => 'إدارة المجتمع';

  @override
  String get permissionManageCommunityDescription =>
      'تعديل الإعدادات العامة مثل الاسم والوصف والأيقونة.';

  @override
  String get permissionManageRoles => 'إدارة الأدوار';

  @override
  String get permissionManageRolesDescription =>
      'إنشاء الأدوار أو تعديلها أو حذفها الأقل من دورك الأعلى. يسمح أيضًا بتعديل تجاوزات أذونات القناة.';

  @override
  String get permissionManageChannels => 'إدارة القنوات';

  @override
  String get permissionManageChannel => 'إدارة القناة';

  @override
  String get permissionManageChannelDescription =>
      'إعادة تسمية هذه القناة وتعديل إعداداتها.';

  @override
  String get permissionManagePermissions => 'إدارة الأذونات';

  @override
  String get permissionManagePermissionsDescription =>
      'تعديل التجاوزات للأدوار والأعضاء في هذه القناة.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'إنشاء webhooks لهذه القناة أو تعديلها أو حذفها.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'الاطّلاع على قائمة أعضاء هذه القناة.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'إدارة روابط الدعوة لهذه القناة.';

  @override
  String get permissionOverwriteDeny => 'رفض';

  @override
  String get permissionOverwriteInherit => 'محايد (موروث)';

  @override
  String get permissionOverwriteAllow => 'السماح';

  @override
  String get permissionOverwriteSetAllHelp =>
      'استخدم هذه الأزرار لتعيين جميع الأذونات بسرعة.';

  @override
  String get permissionManageChannelsDescription =>
      'إنشاء القنوات والفئات أو تعديلها أو حذفها.';

  @override
  String get permissionKickMembers => 'طرد الأعضاء';

  @override
  String get permissionBanMembers => 'حظر الأعضاء';

  @override
  String get permissionCreateInviteLinks => 'إنشاء روابط دعوة';

  @override
  String get permissionChangeOwnNickname => 'تغيير الاسم المستعار الخاص';

  @override
  String get permissionChangeOwnNicknameDescription => 'تعديل اسمك المستعار.';

  @override
  String get permissionManageNicknames => 'إدارة الألقاب';

  @override
  String get permissionManageNicknamesDescription =>
      'تغيير أسماء المستعارة للأعضاء الآخرين.';

  @override
  String get permissionCreateEmojiStickers => 'إنشاء إيموجي وملصقات';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'حمّل ملصقات ورموزًا تعبيرية جديدة، وادِرْ تصميماتك الخاصة.';

  @override
  String get permissionManageEmojiStickers =>
      'إدارة الرموز التعبيرية والملصقات';

  @override
  String get permissionManageEmojiStickersDescription =>
      'تعديل أو حذف الرموز التعبيرية والملصقات التي أنشأها أعضاء آخرون.';

  @override
  String get permissionManageWebhooks => 'إدارة خطاطيف الويب';

  @override
  String get permissionManageWebhooksDescription =>
      'إنشاء الـ webhooks أو تعديلها أو حذفها.';

  @override
  String get permissionSendMessages => 'إرسال الرسائل';

  @override
  String get permissionSendTtsMessages => 'إرسال رسائل تحويل النص إلى كلام';

  @override
  String get permissionSendTtsMessagesDescription =>
      'إرسال رسائل تحويل النص إلى كلام.';

  @override
  String get permissionManageMessages => 'إدارة الرسائل';

  @override
  String get permissionManageMessagesDescription =>
      'حذف رسائل الأعضاء الآخرين. يتم التحكم في التثبيت بشكل منفصل.';

  @override
  String get permissionPinMessages => 'تثبيت الرسائل';

  @override
  String get permissionEmbedLinks => 'تضمين الروابط';

  @override
  String get permissionAttachFiles => 'إرفاق ملفات';

  @override
  String get permissionMentionEveryone => 'استخدم @everyone أو @here أو @role';

  @override
  String get permissionMentionEveryoneDescription =>
      'الإشارة إلى الجميع أو إلى أي دور (حتى لو لم يكن الدور قابلاً للإشارة إليه).';

  @override
  String get permissionUseExternalEmoji => 'استخدام الرموز التعبيرية الخارجية';

  @override
  String get permissionUseExternalEmojiDescription =>
      'استخدام الرموز التعبيرية من المجتمعات الأخرى.';

  @override
  String get permissionUseExternalStickers => 'استخدام الملصقات الخارجية';

  @override
  String get permissionAddReactions => 'إضافة ردود فعل';

  @override
  String get permissionAddReactionsDescription =>
      'أضِف ردود فعل جديدة إلى الرسائل.';

  @override
  String get permissionBypassSlowmode => 'تجاوز الوضع البطيء';

  @override
  String get permissionBypassSlowmodeDescription =>
      'تجاهل حدود معدل الرسائل لكل قناة.';

  @override
  String get permissionTimeOutMembers => 'إيقاف الأعضاء مؤقتًا';

  @override
  String get permissionTimeOutMembersDescription =>
      'منع الأعضاء من إرسال الرسائل والتفاعل والانضمام إلى المحادثات الصوتية لمدة محددة.';

  @override
  String get permissionViewChannel => 'عرض القناة';

  @override
  String get permissionViewChannelMembers => 'عرض أعضاء القناة';

  @override
  String get permissionViewChannelMembersDescription =>
      'الاطّلاع على قائمة الأعضاء للقنوات في هذا المجتمع.';

  @override
  String get permissionConnect => 'اتصال';

  @override
  String get permissionSpeak => 'التحدث';

  @override
  String get permissionStreamVideo => 'بث الفيديو';

  @override
  String get permissionUseVoiceActivity => 'استخدام نشاط الصوت';

  @override
  String get permissionUseVoiceActivityDescription =>
      'بدون هذا الإذن، سيتطلب الأمر الضغط للتحدث.';

  @override
  String get permissionPrioritySpeaker => 'متحدث ذو أولوية';

  @override
  String get permissionMuteMembers => 'كتم صوت الأعضاء';

  @override
  String get permissionDeafenMembers => 'كتم صوت الأعضاء';

  @override
  String get permissionMoveMembers => 'نقل الأعضاء';

  @override
  String get permissionMoveMembersDescription =>
      'اسحب الأعضاء بين القنوات التي يمكنهم الوصول إليها.';

  @override
  String get permissionSetVoiceRegion => 'تعيين منطقة الصوت';

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
    return 'لا يحتوي هذا المجتمع على أي خطافات ويب حتى الآن. انتقل إلى $channelSettingsPath لإنشاء واحد.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'تحتاج إلى صلاحية \"$permission\" لعرض وتعديل خطافات الويب لهذا المجتمع.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'تعذّر تحميل خطاطيف الويب';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'حدث خطأ أثناء تحميل خطاطيف الويب. حاول مرة أخرى.';

  @override
  String get guildSettingsWebhooksUpdated => 'تم تحديث Webhooks';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'فشل تحديث خطاطيف الويب';

  @override
  String get guildSettingsUnknownChannel => 'قناة غير معروفة';

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
      'عدد الأعضاء غير كافٍ';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'يتطلب ما لا يقل عن $count عضوًا للتقديم.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'الحالة:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'معلّق';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'موافق عليه';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'مرفوض';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'تمت الإزالة';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'السبب: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'مجتمعك مُدرج في الاكتشاف. يمكنك تحديث تفاصيل الإدراج أدناه أو سحبه لإزالته.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'طلبك قيد المراجعة. لا يزال بإمكانك تحديث تفاصيل قائمتك أو سحب الطلب.';

  @override
  String get guildSettingsDiscoveryCategory => 'الفئة';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'اختر الفئة التي تصف مجتمعك بشكل أفضل. يمكنك تغيير هذا في أي وقت.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'اللغة الأساسية';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'اللغة التي يتحدثها معظم أفراد مجتمعك. تُستخدم لتصفية نتائج الاستكشاف.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'الوصف';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder => 'صف مجتمعك';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'الوصف مطلوب.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'يجب أن يكون الوصف بطول $minLength أحرف على الأقل.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'يجب ألا يتجاوز الوصف $maxLength حرفًا.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'العلامات';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'يمكن لما يصل إلى $maxTags علامة مساعدة الأشخاص في العثور على مجتمعك. تظهر في بحث الاكتشاف.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'ألعاب، فن، موسيقى';

  @override
  String get guildSettingsDiscoveryAddTag => 'إضافة';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'إزالة الوسم $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'تعذر إضافة العلامة';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'يجب أن تتكون العلامات من حرفين إلى $maxLength حرف أبجدي رقمي.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'يمكنك إضافة ما يصل إلى $maxTags علامة فقط.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'إرسال الطلب';

  @override
  String get guildSettingsDiscoverySave => 'حفظ';

  @override
  String get guildSettingsDiscoveryWithdraw => 'سحب';

  @override
  String get guildSettingsDiscoveryApplicationSent => 'تم إرسال طلب الاستكشاف';

  @override
  String get guildSettingsDiscoveryListingUpdated => 'تم تحديث قائمة الاستكشاف';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'تم سحب طلب الاكتشاف';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle => 'تعذر سحب الطلب';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'حاول مرة أخرى بعد قليل.';

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
  String get guildMembersRecentTitle => 'الأعضاء الجدد';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'عرض $displayedCount من إجمالي $totalCount عضو';
  }

  @override
  String get guildMembersSort => 'فرز';

  @override
  String get guildSettingsMembersSortNewest => 'الأحدث أولاً';

  @override
  String get guildMembersSortOldest => 'الأقدم أولاً';

  @override
  String get guildMembersColumnName => 'الاسم';

  @override
  String get guildMembersColumnMemberSince => 'عضو منذ';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'انضم إلى $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'طريقة الانضمام';

  @override
  String get guildMembersColumnRoles => 'الأدوار';

  @override
  String get guildMembersColumnActions => 'إجراءات';

  @override
  String get guildMembersFilterMemberSince => 'تصفية حسب تاريخ الانضمام';

  @override
  String get guildMembersFilterJoinedProduct => 'تصفية حسب تاريخ إنشاء الحساب';

  @override
  String get guildMembersFilterJoinMethod => 'فلترة حسب طريقة الانضمام';

  @override
  String get guildMembersFilterRoles => 'تصفية حسب الأدوار';

  @override
  String get guildMembersFilterAll => 'الكل';

  @override
  String get guildMembersFilterPast1Hour => 'آخر ساعة';

  @override
  String get guildMembersFilterPast24Hours => 'آخر 24 ساعة';

  @override
  String get guildMembersFilterPast7Days => 'آخر 7 أيام';

  @override
  String get guildMembersFilterPast2Weeks => 'آخر أسبوعين';

  @override
  String get guildMembersFilterPast3Weeks => 'آخر 3 أسابيع';

  @override
  String get guildMembersFilterPast4Weeks => 'آخر 4 أسابيع';

  @override
  String get guildMembersFilterPast3Months => 'آخر 3 أشهر';

  @override
  String get guildMembersFilterCustomRange => 'نطاق مخصص...';

  @override
  String get guildMembersDateRangeTitle => 'نطاق تاريخ مخصص';

  @override
  String get guildMembersDateAfter => 'بعد التاريخ';

  @override
  String get guildMembersDateBefore => 'قبل تاريخ';

  @override
  String get guildMembersClearAll => 'مسح الكل';

  @override
  String get guildMembersRowsPerPage => 'الصفوف لكل صفحة';

  @override
  String get guildMembersEmptySearch => 'لا يوجد أحد يطابق هذا البحث.';

  @override
  String get guildMembersLoadError =>
      'حدث خطأ أثناء تحميل الأعضاء. حاول مرة أخرى لاحقًا.';

  @override
  String get guildMembersIndexing => 'جارٍ فهرسة الأعضاء…';

  @override
  String get guildMembersGoToPage => 'الانتقال إلى الصفحة';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'الانتقال إلى صفحة $page';
  }

  @override
  String get guildMembersJumpToPage => 'الانتقال إلى الصفحة';

  @override
  String get guildMembersJoinSourceCreator => 'منشئ المجتمع';

  @override
  String get guildMembersJoinSourceInvite => 'دعوة';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'دعوة ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'تمت الدعوة بواسطة $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'رابط مخصص';

  @override
  String get guildMembersJoinSourceBotInvite => 'دعوة بوت';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'مسؤول المنصة';

  @override
  String get guildMembersJoinSourceDiscovery => 'الاكتشاف';

  @override
  String get guildMembersJoinMethodUnknown => 'غير معروف';

  @override
  String get guildMembersCommunityOwner => 'مالك المنتدى';

  @override
  String get guildMembersViewAllRoles => 'عرض كل الأدوار';

  @override
  String get guildMembersJoinedJustNow => 'الآن';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'قبل $count دقائق',
      one: 'قبل دقيقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ $count ساعات',
      one: 'منذ ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ # أيام',
      one: 'منذ يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'الأعضاء';

  @override
  String get guildMembersChannelListSelected => 'الأعضاء، محدد';

  @override
  String get guildSettingsInvitesTitle => 'الدعوات';

  @override
  String get guildSettingsInvitesDescription =>
      'عرض روابط الدعوة النشطة وإلغاؤها.';

  @override
  String get guildSettingsInvitesEmpty => 'لا توجد دعوات نشطة.';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'لا يحتوي هذا المجتمع على أي روابط دعوة حتى الآن. انتقل إلى قناة وأنشئ دعوة لدعوة الأشخاص.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'تعذّر تحميل الدعوات';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'حدث خطأ أثناء تحميل الدعوات. حاول مرة أخرى.';

  @override
  String get guildSettingsInvitesTryAgain => 'حاول مرة أخرى';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'إظهار تاريخ الإنشاء بدلاً من تاريخ انتهاء الصلاحية';

  @override
  String get guildSettingsInvitesPauseInvites => 'إيقاف الدعوات مؤقتًا';

  @override
  String get guildSettingsInvitesEnableInvites => 'تفعيل الدعوات';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'إيقاف الدعوات مؤقتًا لهذا المجتمع';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'تفعيل الدعوات لهذا المجتمع';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'إيقاف الدعوات مؤقتًا؟ لن يتمكن المستخدمون الجدد من الانضمام عبر روابط الدعوة حتى تعيد تمكينها. لن يتأثر الأعضاء الحاليون.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'تفعيل الدعوات؟ سيتمكن المستخدمون من الانضمام إلى هذا المجتمع عبر روابط الدعوة مرة أخرى.';

  @override
  String get guildSettingsInvitesPause => 'إيقاف مؤقت';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'تم إيقاف الدعوات مؤقتًا لهذا المجتمع.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'تم إيقاف الدعوات مؤقتًا لأن $productName اكتشف هجومًا محتملاً. لا يمكن للمستخدمين الجدد الانضمام الآن.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'الداعي:';

  @override
  String get guildSettingsInvitesLabelChannel => 'القناة:';

  @override
  String get guildSettingsInvitesLabelCode => 'الرمز:';

  @override
  String get guildSettingsInvitesLabelUses => 'الاستخدامات:';

  @override
  String get guildSettingsInvitesLabelCreated => 'تم الإنشاء:';

  @override
  String get guildSettingsInvitesLabelExpires => 'تنتهي الصلاحية:';

  @override
  String get guildSettingsInvitesUnknown => 'غير معروف';

  @override
  String get guildSettingsInvitesNoCategory => 'بلا فئة';

  @override
  String get guildSettingsInvitesExpired => 'انتهت صلاحيته';

  @override
  String get guildSettingsInvitesNever => 'أبدًا';

  @override
  String get guildSettingsInvitesCopyLink => 'نسخ رابط الدعوة';

  @override
  String get guildSettingsInvitesRevoke => 'إلغاء الدعوة';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => 'تعذّر إلغاء الدعوة';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'قد يظل الرابط يعمل. حاول مرة أخرى بعد قليل.';

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
  String get guildSettingsEmojiSlotsTitle => 'أماكن الرموز التعبيرية';

  @override
  String get guildSettingsEmojiDropZone => 'اسحب ملفات الإيموجي وأفلتها هنا';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'تعذّر تحميل الرموز التعبيرية. حاول مرة أخرى لاحقًا.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'لم يتم العثور على أي رموز تعبيرية مطابقة لبحثك.';

  @override
  String get guildSettingsEmojiNoSlots => 'لا توجد خانات رموز تعبيرية متاحة';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'لقد وصلت إلى الحد الأقصى لعدد الرموز التعبيرية. احذف بعض الرموز التعبيرية الموجودة لإفساح المجال.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'يجب أن تتكون أسماء الرموز من حرفين على الأقل ويمكن أن تستخدم أحرفًا وأرقامًا وشرطات سفلية. يجب ألا يتجاوز حجم الرموز $maxSize. يتم تغيير حجم الصور الثابتة تلقائيًا إلى 128 × 128 بكسل وضغطها تلقائيًا. يجب أن يكون حجم الرموز المتحركة وملفات SVG بالفعل ضمن الحد.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'جارٍ تحميل الرموز التعبيرية';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# رموز تعبيرية',
      one: '# رمز تعبيري',
    );
    return 'جارٍ تحميل $_temp0. قد يستغرق هذا بعض الوقت.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'فشل تحميل الرموز التعبيرية. حاول مرة أخرى.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'تعذر إضافة بعض الرموز التعبيرية';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'راجع هذه الملفات وحاول مرة أخرى باستخدام صور أصغر أو أبسط.';

  @override
  String get guildSettingsEmojiRenameTitle => 'إعادة تسمية الرموز التعبيرية';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 حرفًا أو رقمًا أو شرطة سفلية.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'رموز تعبيرية';

  @override
  String get guildSettingsEmojiColumnName => 'الاسم';

  @override
  String get guildSettingsEmojiColumnUploader => 'تم الرفع بواسطة';

  @override
  String get guildSettingsEmojiUnknownUploader => 'غير معروف';

  @override
  String get guildSettingsEmojiDeleteTitle => 'حذف الرمز التعبيري';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'هل تريد حذف :$name:؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel => 'حذف هذا الإيموجي من التخزين وCDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'يجب أن يتكون اسم الرمز التعبيري من حرفين على الأقل';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'يجب ألا يتجاوز اسم الرموز التعبيرية 32 حرفًا';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'اسم إيموجي غير صالح';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'تعذّر تغيير اسم هذا الإيموجي';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'تمت إعادة الاسم إلى ما كان عليه سابقًا. يرجى المحاولة مرة أخرى بعد قليل.';

  @override
  String get guildSettingsEmojiGoneTitle => 'لم يعد هذا الإيموجي موجودًا';

  @override
  String get guildSettingsEmojiGoneBody =>
      'ربما تم حذفه. تمت إعادة الاسم إلى ما كان عليه من قبل.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'لا يمكنك إعادة تسمية هذا الإيموجي';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'ليس لديك إذن لإعادة تسمية هذا الإيموجي. تمت استعادة الاسم إلى ما كان عليه سابقًا.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'أنت سريع جدًا';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'الرجاء الانتظار لحظة ثم حاول إعادة التسمية مرة أخرى.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'تعذّر حذف هذا الرمز التعبيري';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'لا يمكنك حذف هذا الإيموجي';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'السماح للآخرين بنسخ رموزك التعبيرية';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'عند التمكين، يمكن لأعضاء المجتمعات الأخرى استخدام اختصار \"الاستنساخ\" بنقرة واحدة داخل التطبيق على الرموز التعبيرية المخصصة لديك. هذا لا يمنعهم من حفظ الصورة وتحميلها بأنفسهم.';

  @override
  String get guildSettingsCloneStickerTitle => 'السماح للآخرين بنسخ ملصقاتك';

  @override
  String get guildSettingsCloneStickerDescription =>
      'عند التفعيل، يمكن لأعضاء المجتمعات الأخرى استخدام اختصار \"الاستنساخ\" بنقرة واحدة داخل التطبيق على ملصقاتك المخصصة. هذا لا يمنعهم من حفظ الصورة ورفعها بأنفسهم.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'يمكن فقط للأعضاء الذين لديهم صلاحية \"$permission\" تغيير هذا.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'تعذر تحديث استنساخ الرموز التعبيرية';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'تعذر تحديث استنساخ الملصقات';

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
  String get guildSettingsStickerSlotsTitle => 'أماكن الملصقات';

  @override
  String get guildSettingsStickerUploadTitle => 'تحميل ملصق';

  @override
  String get guildSettingsStickerDropZone =>
      'اسحب ملف ملصق وأفلته هنا (واحد في كل مرة)';

  @override
  String get guildSettingsStickerDensity => 'كثافة الملصقات';

  @override
  String get guildSettingsStickerDensityCozy => 'مريح';

  @override
  String get guildSettingsStickerDensityCompact => 'مضغوط';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'تعذّر تحميل الملصقات';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'حدث خطأ أثناء تحميل الملصقات. حاول مرة أخرى.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'لم يتم العثور على ملصقات مطابقة لبحثك.';

  @override
  String get guildSettingsStickersEmptySearch => 'لم يتم العثور على ملصقات';

  @override
  String get guildSettingsStickerNoSlots => 'لا توجد خانات ملصقات متاحة';

  @override
  String get guildSettingsStickerSlotsFull =>
      'لقد وصلت إلى الحد الأقصى لعدد الملصقات. احذف بعض الملصقات الموجودة لإفساح المجال.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'يتم حفظ الملصقات بدقة 320 × 320 بكسل ويجب ألا يتجاوز حجمها $maxSize. يتم تغيير حجم الصور الثابتة وضغطها تلقائيًا. يجب أن يكون حجم الملصقات المتحركة وملفات SVG بالفعل ضمن الحد.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => 'ملف الملصق غير مدعوم';

  @override
  String get guildSettingsStickerAddTitle => 'إضافة ملصق';

  @override
  String get guildSettingsStickerEditTitle => 'تعديل الملصق';

  @override
  String get guildSettingsStickerNameLabel => 'الاسم';

  @override
  String get guildSettingsStickerNameHint => 'ملصقي الرائع';

  @override
  String get guildSettingsStickerDescriptionLabel => 'الوصف';

  @override
  String get guildSettingsStickerDescriptionHint => 'صف الملصق';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'العلامات ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'إضافة وسم';

  @override
  String get guildSettingsStickerTagAdd => 'إضافة';

  @override
  String get guildSettingsStickerNameRequired => 'الاسم مطلوب';

  @override
  String get guildSettingsStickerNameTooShort =>
      'يجب أن يتكون الاسم من حرفين على الأقل';

  @override
  String get guildSettingsStickerNameTooLong =>
      'يجب أن يكون الاسم 30 حرفًا أو أقل';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'يجب أن يكون الوصف 500 حرف أو أقل';

  @override
  String get guildSettingsStickerCreateFailedTitle => 'تعذّر إنشاء هذا الملصق';

  @override
  String get guildSettingsStickerTooLargeTitle => 'الملصق كبير جدًا';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'تعذر ضغط الملصق بالقدر الكافي';

  @override
  String get guildSettingsStickerDeleteTitle => 'حذف الملصق';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'هل تريد حذف \"$name\"؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get guildSettingsStickerPurgeLabel => 'حذف هذا الملصق من التخزين وCDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle => 'تعذر حذف هذا الملصق';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'لا يمكنك حذف هذا الملصق';

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
  String get guildSettingsInvitesTableExpires => 'ينتهي';

  @override
  String get guildSettingsAuditLogFilterUser => 'التصفية حسب المستخدم';

  @override
  String get guildSettingsAuditLogFilterAction => 'التصفية حسب الإجراء';

  @override
  String get createDm => 'إنشاء رسالة مباشرة';

  @override
  String get createGroupDm => 'إنشاء محادثة جماعية';

  @override
  String get createDmNewMessage => 'رسالة جديدة';

  @override
  String get createDmSelectFriends => 'اختر الأصدقاء';

  @override
  String get createDmChooseFriendsSubtitle => 'اختر الأصدقاء للمراسلة.';

  @override
  String get createDmSearchFriends => 'البحث عن أصدقاء';

  @override
  String get createDmNoFriendsFound => 'لم يتم العثور على أصدقاء';

  @override
  String get createDmNoFriendsYet => 'ليس لديك أصدقاء بعد';

  @override
  String get createDmClaimToStartDms =>
      'طالب بملكية حسابك لبدء الرسائل المباشرة.';

  @override
  String get createDmVerifyToStartDms =>
      'تحقق من بريدك الإلكتروني لبدء المحادثات المباشرة.';

  @override
  String get createDmVerifyYourEmail => 'تحقق من بريدك الإلكتروني';

  @override
  String get createDmNewGroup => 'مجموعة جديدة';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'إنشاء مجموعة جديدة مع $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'تأكيد المجموعة الجديدة';

  @override
  String get createDmCreateNewGroup => 'إنشاء مجموعة جديدة';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'إزالة $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'لديك بالفعل مجموعة مع هؤلاء المستخدمين. هل تريد إنشاء مجموعة جديدة حقًا؟ هذا جيد أيضًا!';

  @override
  String get createDmNoActivityYet => 'لا يوجد نشاط بعد';

  @override
  String get createDmSomeUsersCantBeAdded => 'لا يمكن إضافة بعض المستخدمين';

  @override
  String get createDmCreateWithoutThem => 'إنشاء بدونهم';

  @override
  String get createDmUnaddableIntro =>
      'لا يمكن إضافة الأشخاص التاليين إلى محادثة المجموعة هذه:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'إنشاء محادثة جماعية مع المستلمين المتبقين ($count) وتخطي الآخرين؟';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'لا يوجد مستلمون متبقون لإنشاء محادثة جماعية معهم.';

  @override
  String get createDmUnaddableUserNotFound => 'المستخدم غير موجود';

  @override
  String get createDmUnaddableBlocked => 'لا يمكنك مراسلة هذا المستخدم';

  @override
  String get createDmUnaddableNotFriends => 'ليس في قائمة أصدقائك';

  @override
  String get createDmUnaddableGroupDisabled =>
      'لا يسمح بإضافته إلى محادثات المجموعات المباشرة';

  @override
  String get createDmFailed => 'تعذر إنشاء المحادثة. حاول مرة أخرى.';

  @override
  String get dmListMessagesTitle => 'الرسائل';

  @override
  String get dmListDirectMessagesTitle => 'الرسائل المباشرة';

  @override
  String get keybindsSearchShortcuts => 'البحث عن الاختصارات';

  @override
  String get keybindSectionDefaults => 'الافتراضيات';

  @override
  String get keybindSectionMessages => 'الرسائل';

  @override
  String get keybindSectionNavigation => 'التنقل';

  @override
  String get keybindSectionDragAndDrop => 'اسحب وأفلت';

  @override
  String get keybindSectionChat => 'الدردشة';

  @override
  String get keybindSectionVoiceAndVideo => 'صوت وفيديو';

  @override
  String get keybindSectionMisc => 'متفرقات';

  @override
  String get keybindActionShowShortcutsList =>
      'عرض قائمة اختصارات لوحة المفاتيح';

  @override
  String get keybindActionCopyText => 'نسخ النص';

  @override
  String get keybindActionMarkUnread => 'وضع علامة غير مقروء';

  @override
  String get keybindActionFocusTextarea => 'تركيز على مربع النص';

  @override
  String get keybindActionSwitchCommunities => 'التبديل بين المجتمعات';

  @override
  String get keybindActionSwitchChannels => 'التبديل بين القنوات';

  @override
  String get keybindActionHistoryBack =>
      'الرجوع في سجل القنوات التي تمت مشاهدتها';

  @override
  String get keybindActionHistoryForward =>
      'التقدم في سجل القنوات التي تمت مشاهدتها';

  @override
  String get keybindActionJumpUnreadChannels =>
      'التنقل بين القنوات غير المقروءة';

  @override
  String get keybindActionJumpMentionChannels =>
      'الانتقال بين القنوات غير المقروءة التي تحتوي على إشارات';

  @override
  String get keybindActionJumpCurrentCall => 'الانتقال إلى المكالمة الحالية';

  @override
  String get keybindActionToggleLastGuildDms =>
      'التبديل بين آخر مجتمع ورسائل خاصة';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'التبديل إلى المجتمع السابق أو الرسائل المباشرة';

  @override
  String get keybindActionNextCommunityOrDms =>
      'التبديل إلى المجتمع أو المحادثات الخاصة التالية';

  @override
  String get keybindActionGoToDms => 'الانتقال إلى الرسائل المباشرة';

  @override
  String get keybindActionGoToFirstCommunity => 'الانتقال إلى أول مجتمع';

  @override
  String get keybindActionGoToSecondCommunity => 'الانتقال إلى المجتمع الثاني';

  @override
  String get keybindActionGoToThirdCommunity => 'الانتقال إلى المجتمع الثالث';

  @override
  String get keybindActionGoToFourthCommunity => 'الانتقال إلى المجتمع الرابع';

  @override
  String get keybindActionGoToFifthCommunity => 'الانتقال إلى المجتمع الخامس';

  @override
  String get keybindActionGoToSixthCommunity => 'الانتقال إلى المجتمع السادس';

  @override
  String get keybindActionGoToSeventhCommunity => 'الانتقال إلى المجتمع السابع';

  @override
  String get keybindActionGoToEighthCommunity => 'الانتقال إلى المجتمع الثامن';

  @override
  String get keybindActionToggleQuickSwitcher => 'تبديل أداة التبديل السريع';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'إنشاء مجتمع أو الانضمام إليه';

  @override
  String get keybindActionStartDragAndDrop => 'بدء السحب والإفلات';

  @override
  String get keybindActionMove => 'نقل';

  @override
  String get keybindActionDropItem => 'إسقاط العنصر';

  @override
  String get keybindActionCancel => 'إلغاء';

  @override
  String get keybindActionMarkCommunityRead => 'وضع المجتمع كمقروء';

  @override
  String get keybindActionMarkChannelRead => 'وضع القناة كمقروءة';

  @override
  String get keybindActionStartGroupDm => 'بدء محادثة جماعية';

  @override
  String get keybindActionTogglePinnedMessages => 'تبديل الرسائل المثبتة';

  @override
  String get keybindActionToggleInbox => 'تبديل صندوق الوارد';

  @override
  String get keybindActionMarkTopInboxRead =>
      'وضع علامة على أعلى قناة في البريد الوارد كمقروءة';

  @override
  String get keybindActionMarkAllInboxRead =>
      'وضع علامة \"مقروءة\" على جميع قنوات البريد الوارد';

  @override
  String get keybindActionToggleMemberList =>
      'تبديل قائمة الأعضاء أو الدردشة الصوتية';

  @override
  String get keybindActionToggleEmojiPicker => 'تبديل منتقي الرموز التعبيرية';

  @override
  String get keybindActionToggleGifPicker => 'تبديل منتقي صور GIF';

  @override
  String get keybindActionToggleStickerPicker => 'تبديل منتقي الملصقات';

  @override
  String get keybindActionScrollChatUp => 'مرر الدردشة للأعلى';

  @override
  String get keybindActionScrollChatDown => 'مرر الدردشة للأسفل';

  @override
  String get keybindActionJumpOldestUnread =>
      'الانتقال إلى أقدم رسالة غير مقروءة';

  @override
  String get keybindActionFocusComposer => 'التركيز على مربع النص';

  @override
  String get keybindActionUploadFile => 'تحميل ملف';

  @override
  String get keybindActionCopyChannelLink => 'نسخ رابط القناة';

  @override
  String get keybindActionToggleSavedMedia => 'تبديل الوسائط المحفوظة';

  @override
  String get keybindActionSendVoiceMessage => 'إرسال رسالة صوتية';

  @override
  String get keybindActionAnswerCall => 'الرد على المكالمة الواردة';

  @override
  String get keybindActionDeclineCall => 'رفض المكالمة الواردة';

  @override
  String get keybindActionStartDmCall => 'بدء مكالمة في رسالة مباشرة أو مجموعة';

  @override
  String get keybindActionToggleSoundboard => 'تبديل لوحة الصوت';

  @override
  String get keybindActionToggleCompactCallView =>
      'توسيع أو تصغير عرض المكالمة المصغر';

  @override
  String get keybindActionPushToTalkPriority => 'اضغط للتحدث (أولوية)';

  @override
  String get keybindActionVoiceActivityPriority => 'أولوية نشاط الصوت';

  @override
  String get keybindActionOpenHelp => 'فتح المساعدة';

  @override
  String get keybindActionSearchMessages => 'البحث في الرسائل';

  @override
  String get keybindActionOpenContextMenu => 'افتح قائمة السياق';

  @override
  String get keybindActionOpenSettings => 'افتح إعداداتك';

  @override
  String get keybindActionOpenThemeStudio =>
      'فتح نافذة استوديو السمات المنبثقة';

  @override
  String get keybindActionZoomIn => 'تكبير';

  @override
  String get keybindActionZoomOut => 'تصغير';

  @override
  String get keybindActionZoomReset => 'إعادة ضبط التكبير';

  @override
  String get clipboardPasteFailed =>
      'تعذر اللصق. الحافظة فارغة أو محظورة لهذا التطبيق.';

  @override
  String get homeQuickActionDms => 'الرسائل المباشرة';
}
