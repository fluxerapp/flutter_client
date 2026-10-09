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
      'هناك مشكلة في الخادم.\nسيتم إصلاحها في ثانية!';

  @override
  String get gatewayReconnectingToast => 'جارٍ إعادة الاتصال…';

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
  String get splashConnectionLost => 'فُقد الاتصال';

  @override
  String get splashViewOnStatusPage => 'عرض على صفحة الحالة';

  @override
  String get splashConnectionIssuesPrompt => 'هل تواجه مشكلات في الاتصال؟';

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
    return 'الصيانة مجدولة في $localizedTime. المدة المتوقعة: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'الصيانة جارية. المدة المتوقعة: $duration.';
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
  String get organizationSsoProvider =>
      'تسجيل الدخول باستخدام موفر تسجيل الدخول الموحّد لمؤسستك.';

  @override
  String get failedToStartSso => 'تعذّر بدء تسجيل الدخول الموحّد';

  @override
  String get ssoCancelled => 'تم إلغاء تسجيل الدخول الموحد';

  @override
  String preferSso(String provider) {
    return 'تفضل استخدام تسجيل الدخول الموحد؟ تابع باستخدام $provider.';
  }

  @override
  String get needAccountPrompt => 'هل تحتاج إلى حساب؟ ';

  @override
  String get register => 'تسجيل';

  @override
  String get orDivider => 'OR';

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
  String get ipAuthResent => 'أُعيد الإرسال';

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
  String get mfaUseSecurityKey =>
      'جرّب مفتاح الأمان / مفتاح المرور بدلاً من ذلك';

  @override
  String get accountSelectorTitle => 'اختر حسابًا';

  @override
  String get accountSelectorDescription =>
      'اختر حسابًا للمتابعة، أو أضف حسابًا آخر.';

  @override
  String get accountAdd => 'إضافة حساب';

  @override
  String get accountRemoveDescription =>
      'سيؤدي هذا إلى إزالة الجلسة المحفوظة لهذا الحساب.';

  @override
  String get accountExpired => 'انتهت الصلاحية';

  @override
  String accountSessionExpired(String identifier) {
    return 'انتهت صلاحية الجلسة لـ $identifier. يرجى تسجيل الدخول مرة أخرى.';
  }

  @override
  String get accountManageTitle => 'إدارة الحسابات';

  @override
  String get accountSwitchFailed => 'تعذّر تبديل الحسابات. حاول مرة أخرى.';

  @override
  String get profileTabMenuSwitchAccounts => 'تبديل الحسابات';

  @override
  String get statusChangeSheetTitle => 'تعيين الحالة';

  @override
  String get statusOnlineStatusSection => 'حالة الاتصال';

  @override
  String get statusOnline => 'متصل';

  @override
  String get statusIdle => 'خامل';

  @override
  String get statusDnd => 'عدم الإزعاج';

  @override
  String get statusInvisible => 'غير مرئي';

  @override
  String get statusOffline => 'غير متصل';

  @override
  String get statusUntilIChangeIt => 'حتى أغيّرها';

  @override
  String get statusDontClear => 'عدم المسح';

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
  String get statusInvisibleDescription => 'ستظهر بحالة غير متصل';

  @override
  String get customStatusSetTitle => 'تعيين الحالة المخصصة';

  @override
  String get customStatusCurrentHint => 'الحالة المخصصة';

  @override
  String get customStatusClear => 'مسح الحالة المخصصة';

  @override
  String get customStatusPlaceholder => 'ماذا يحدث؟';

  @override
  String get customStatusChooseEmoji => 'اختر رمزًا تعبيريًا';

  @override
  String get customStatusClearAfter => 'مسح الحالة بعد';

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
  String get suspendedRecheck => 'التحقق من وجود تحديثات';

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
      'أدخل عنوان بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور.';

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
  String get resetPasswordNewPassword => 'كلمة مرور جديدة';

  @override
  String get resetPasswordConfirm => 'تأكيد كلمة المرور الجديدة';

  @override
  String get resetPasswordSubmit => 'إعادة تعيين كلمة المرور';

  @override
  String get resetPasswordMismatch => 'كلمتا المرور غير متطابقتين.';

  @override
  String get recoverAccountTitle => 'استعادة حسابك';

  @override
  String get recoverAccountDescription =>
      'أدخل اسم المستخدم الخاص بك ومفتاح الاسترداد من مجموعة الاسترداد الخاصة بك، ثم اختر كلمة مرور جديدة.';

  @override
  String get recoverAccountNoKit =>
      'ليس لديك مجموعة استرداد؟ اطلب من مسؤول هذا المثيل رابطًا لإعادة تعيين كلمة المرور.';

  @override
  String get recoveryKitTitle => 'عدة الاسترداد الخاصة بك';

  @override
  String get recoveryKitCreatedDescription =>
      'إذا نسيت كلمة مرورك، فهذه المجموعة هي الطريقة الوحيدة للعودة إلى حسابك. قم بتخزينها في مكان آمن، مثل مدير كلمات المرور أو نسخة مطبوعة.';

  @override
  String get recoveryKitReplacedDescription =>
      'لم تعد مجموعة الاسترداد القديمة الخاصة بك تعمل. قم بتخزين هذه المجموعة الجديدة في مكان آمن.';

  @override
  String get recoveryKitRecoveredDescription =>
      'تمت إعادة تعيين كلمة المرور الخاصة بك. لم تعد مجموعة الاسترداد القديمة الخاصة بك تعمل. قم بتخزين هذه المجموعة الجديدة في مكان آمن.';

  @override
  String get recoveryKitWarning =>
      'يمكن لأي شخص يمتلك هذا المفتاح إعادة تعيين كلمة مرورك. لا تشاركه أبدًا.';

  @override
  String get recoveryKitKeyLabel => 'مفتاح الاسترداد';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return 'عدة استرداد $productName';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'احتفظ بهذه الصفحة في مكان آمن. إذا نسيت كلمة مرورك، يمكنك استخدامها للعودة إلى حسابك. يمكن لأي شخص لديه مفتاح الاسترداد هذا إعادة تعيين كلمة مرورك، لذا لا تشاركه أبدًا.';

  @override
  String get recoveryKitInstanceLabel => 'المثيل';

  @override
  String get recoveryKitCreatedAtLabel => 'تم الإنشاء';

  @override
  String get recoveryKitQrCaption =>
      'امسح ضوئيًا لفتح صفحة الاسترداد مع ملء تفاصيلك.';

  @override
  String get recoveryKitStepsTitle => 'كيفية استعادة حسابك';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'انتقل إلى $recoverUrl أو امسح رمز الاستجابة السريعة.';
  }

  @override
  String get recoveryKitStepEnter =>
      'أدخل اسم المستخدم الخاص بك ومفتاح الاسترداد هذا.';

  @override
  String get recoveryKitStepPassword =>
      'اختر كلمة مرور جديدة. ستحصل على مجموعة استرداد جديدة وستتوقف هذه المجموعة عن العمل.';

  @override
  String get recoveryKitBackupCodesTitle =>
      'رموز النسخ الاحتياطي للعاملين بخطوتين';

  @override
  String get recoveryKitBackupCodesNote =>
      'كل رمز يعمل مرة واحدة بدلاً من تطبيق المصادقة الخاص بك.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'تعذر تحميل رموز النسخ الاحتياطي الخاصة بك.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'تضمين رموز النسخ الاحتياطي للمصادقة الثنائية في الصورة المحفوظة';

  @override
  String get recoveryKitCopy => 'نسخ';

  @override
  String get recoveryKitCopied => 'تم نسخ مفتاح الاسترداد';

  @override
  String get recoveryKitSaveImage => 'حفظ الصورة';

  @override
  String get recoveryKitSaved => 'تم حفظ مجموعة الاسترداد';

  @override
  String get recoveryKitSavedToPhotos => 'تم حفظ مجموعة الاسترداد في الصور';

  @override
  String get recoveryKitSaveFailed =>
      'تعذر حفظ مجموعة الاسترداد. حاول مرة أخرى أو انسخ المفتاح بدلًا من ذلك.';

  @override
  String get recoveryKitAcknowledge =>
      'لقد خزنت مجموعة الاسترداد الخاصة بي في مكان آمن';

  @override
  String get recoveryKitCreateFailed =>
      'تعذر إنشاء مجموعة الاسترداد الخاصة بك. يمكنك إنشاؤها لاحقًا في إعدادات حسابك.';

  @override
  String get recoveryKitSectionTitle => 'عدة الاسترداد';

  @override
  String get recoveryKitSectionDescription =>
      'يتيح لك إعادة تعيين كلمة المرور الخاصة بك إذا نسيتها.';

  @override
  String get recoveryKitNone => 'ليس لديك مجموعة استرداد بعد';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'تم الإنشاء $time';
  }

  @override
  String get recoveryKitCreate => 'إنشاء مجموعة استرداد';

  @override
  String get recoveryKitCreateNew => 'إنشاء مجموعة جديدة';

  @override
  String get recoveryKitReplaceTitle => 'إنشاء مجموعة استرداد جديدة؟';

  @override
  String get recoveryKitReplaceDescription =>
      'ستتوقف مجموعتك الحالية عن العمل بمجرد إنشاء المجموعة الجديدة.';

  @override
  String get recoveryKitReminderTitle => 'احفظ مجموعة استرداد';

  @override
  String get recoveryKitReminderBody =>
      'ليس لحسابك عنوان بريد إلكتروني. إذا نسيت كلمة مرورك، فإن مجموعة الاسترداد هي الطريقة الوحيدة للعودة. يستغرق الأمر دقيقة واحدة فقط.';

  @override
  String get registerUsernameSignInHint =>
      'تسجل الدخول باستخدام اسم المستخدم هذا. اختر اسمًا تتذكره.';

  @override
  String get registerUsernameTaken => 'اسم المستخدم هذا مستخدم بالفعل';

  @override
  String get registerUsernameAvailable => 'اسم المستخدم هذا متاح';

  @override
  String get claimAccountUsernameDescription =>
      'قم بالمطالبة بحسابك عن طريق اختيار اسم مستخدم وكلمة مرور. ستقوم بتسجيل الدخول بهما، لذا اختر كلمات تتذكرها.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'حسابك لم تتم المطالبة به بعد. بدون اسم مستخدم وكلمة مرور، لن تتمكن من تسجيل الدخول من أجهزة أخرى وقد تفقد الوصول إلى حسابك. طالب بحسابك الآن لتأمينه.';

  @override
  String get addFriendUsernameOnlyHint => 'اسم المستخدم';

  @override
  String get registerTitle => 'إنشاء حساب';

  @override
  String get registerDisplayName => 'اسم العرض (اختياري)';

  @override
  String get registerDisplayNameHint => 'بماذا تريد أن يناديك الناس؟';

  @override
  String get registerUsername => 'اسم المستخدم (اختياري)';

  @override
  String get registerUsernameHint => 'اتركه فارغًا لاختيار اسم مستخدم عشوائي';

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
      'طلب حسابك بانتظار الموافقة. يمكنك تسجيل الدخول بعد أن يوافق عليه أحد المسؤولين.';

  @override
  String get registerClosed =>
      'التسجيل مغلق حاليًا. استخدم رابط تسجيل من أحد المسؤولين لإنشاء حساب.';

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
  String get errorInvalidUsernameOrPassword =>
      'اسم المستخدم أو كلمة المرور غير صحيحة.';

  @override
  String get errorUnableToSendResetLink =>
      'تعذر إرسال رابط إعادة التعيين. يرجى المحاولة مرة أخرى.';

  @override
  String get errorUnableToResetPassword =>
      'تعذر إعادة تعيين كلمة المرور. يرجى المحاولة مرة أخرى.';

  @override
  String get embedInviteJoin => 'الانضمام إلى المجتمع';

  @override
  String get embedInviteGoTo => 'الانتقال إلى المجتمع';

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
    return 'اكتشف $productName هجومًا محتملاً في هذا المجتمع. تم إيقاف الدعوات مؤقتًا، لذا لا يمكن للمستخدمين الجدد الانضمام الآن.';
  }

  @override
  String get inviteAcceptTitle => 'لقد تمت دعوتك للانضمام';

  @override
  String get inviteAcceptJoinButton => 'الانضمام إلى المجتمع';

  @override
  String get inviteAcceptGoToButton => 'الانتقال إلى المجتمع';

  @override
  String get inviteAcceptInvitesPaused => 'الدعوات متوقفة مؤقتًا';

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
  String get invalidDeepLinkGoHomeButton => 'الانتقال إلى الشاشة الرئيسية';

  @override
  String get inviteAcceptJoinGroupButton => 'الانضمام إلى المجموعة';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'لقد تمت دعوتك للانضمام إلى محادثة جماعية خاصة بواسطة $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'شخص ما';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'لا يمكن الوصول إلى القناة';

  @override
  String get channelAccessDeniedDescription =>
      'ليس لديك صلاحية الوصول إلى القناة التي أُرسلت فيها هذه الرسالة.';

  @override
  String get messageJumpLinkNoAccess => 'لا يمكن الوصول';

  @override
  String get okay => 'موافق';

  @override
  String get embedThemeTitle => 'سمة مشتركة';

  @override
  String get embedThemeWebOnly =>
      'يمكنك استيراد السمات على الويب أو سطح المكتب فقط.';

  @override
  String get embedThemeImport => 'استيراد السمة';

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
  String get embedGiftClaimHelp => 'انقر لاستلام هديتك!';

  @override
  String get embedGiftAlreadyRedeemed => 'تم الاسترداد بالفعل';

  @override
  String get embedGiftClaimAccountHelp => 'طالب بحسابك لاسترداد هذه الهدية.';

  @override
  String get embedGiftClaim => 'استلام الهدية';

  @override
  String get embedGiftClaimed => 'تم استلام الهدية';

  @override
  String get embedGiftClaimAccount => 'المطالبة بالحساب للاسترداد';

  @override
  String get embedGiftUnknownTitle => 'هدية غير معروفة';

  @override
  String get embedGiftUnknownSubtitle =>
      'رمز الهدية هذا غير صالح أو تم استلامه بالفعل.';

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
  String get privacyBotDirectMessages => 'الرسائل المباشرة من البوتات';

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
    return 'كتم $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'كتم صوت مجتمع يمنع ظهور مؤشرات غير مقروءة وإشعارات ما لم يتم ذكرك';

  @override
  String get notificationCommunitySettings => 'إعدادات إشعارات المجتمع';

  @override
  String get notificationAllMessages => 'كل الرسائل';

  @override
  String get notificationOnlyMentions => 'الإشارات فقط';

  @override
  String get notificationNothing => 'لا شيء';

  @override
  String get notificationSuppressEveryone => 'كبت إشارات @everyone و @here';

  @override
  String get notificationSuppressRoles => 'كتم جميع إشارات الأدوار';

  @override
  String get notificationMobilePush => 'إشعارات الدفع على الجوال';

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
  String get notificationUseCategoryDefault =>
      'استخدام الإعداد الافتراضي للفئة';

  @override
  String get notificationUseCommunityDefault =>
      'استخدام إعدادات المجتمع الافتراضية';

  @override
  String get notificationNoCategory => 'بلا فئة';

  @override
  String get dmMarkAsRead => 'وضع علامة كمقروءة';

  @override
  String get dmMuteConversation => 'كتم الرسالة المباشرة';

  @override
  String get dmUnmuteConversation => 'إلغاء كتم الرسالة المباشرة';

  @override
  String get dmPinDm => 'تثبيت الرسالة المباشرة';

  @override
  String get dmUnpinDm => 'إلغاء تثبيت الرسالة المباشرة';

  @override
  String get dmAlwaysShowInSidebar => 'إظهار دائمًا في الشريط الجانبي';

  @override
  String get dmRemoveFromAlwaysShown => 'إزالة من الإظهار الدائم';

  @override
  String get dmCloseDm => 'إغلاق الرسالة المباشرة';

  @override
  String get dmCloseDmConfirmTitle => 'إغلاق الرسالة المباشرة';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'هل أنت متأكد أنك تريد إغلاق محادثتك الخاصة مع $username؟ يمكنك إعادة فتحها لاحقًا.';
  }

  @override
  String get dmDeleteMyMessagesTitle => 'هل تريد حذف رسائلك في هذه المحادثة؟';

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
  String dmInviteSentFor(String communityName) {
    return 'تم إرسال دعوة للانضمام إلى $communityName';
  }

  @override
  String get dmInviteSendFailed => 'تعذّر إرسال الدعوة. حاول مرة أخرى.';

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
  String get dmMuteForever => 'حتى أُلغي الكتم';

  @override
  String get dmPinGroupDm => 'تثبيت المحادثة الجماعية';

  @override
  String get dmUnpinGroupDm => 'إلغاء تثبيت المحادثة الجماعية';

  @override
  String get dmUnnamedGroup => 'مجموعة بلا اسم';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'مجموعة $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'إضافة الرسالة المباشرة إلى المفضلة';

  @override
  String get dmUnfavoriteDm => 'إزالة الرسالة المباشرة من المفضلة';

  @override
  String get dmFavoriteGroupDm => 'إضافة المحادثة الجماعية إلى المفضلة';

  @override
  String get dmUnfavoriteGroupDm => 'إزالة المحادثة الجماعية من المفضلة';

  @override
  String get dmChangeFriendNickname => 'تغيير الاسم المستعار للصديق';

  @override
  String get dmRemoveFriend => 'إزالة صديق';

  @override
  String get dmAddFriend => 'إضافة صديق';

  @override
  String get dmAcceptFriendRequest => 'قبول طلب الصداقة';

  @override
  String get dmIgnoreFriendRequest => 'تجاهل طلب الصداقة';

  @override
  String get dmFriendRequestSent => 'تم إرسال طلب الصداقة';

  @override
  String get dmUnblock => 'إلغاء الحظر';

  @override
  String get dmDebugUser => 'تصحيح أخطاء المستخدم';

  @override
  String get dmDebugChannel => 'تصحيح أخطاء القناة';

  @override
  String get dmDebugCategory => 'تصحيح بيانات الفئة';

  @override
  String get dmPinned => 'تم تثبيت الرسالة المباشرة';

  @override
  String get dmUnpinned => 'تم إلغاء تثبيت الرسالة المباشرة';

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
  String get addFriendSendRequest => 'إرسال طلب';

  @override
  String get addFriendNoUserFound =>
      'لم يتم العثور على مستخدم باسم المستخدم هذا.';

  @override
  String get addFriendInvalidUsername =>
      'أدخل اسم مستخدم صالح (اسم المستخدم#0000).';

  @override
  String get addFriendOutgoingSuccess => 'تم إرسال طلب الصداقة';

  @override
  String get addFriendClaimTitle => 'المطالبة بحسابك';

  @override
  String get addFriendClaimDescription => 'طالب بحسابك لإرسال طلبات الصداقة.';

  @override
  String get addFriendVerifyTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String get addFriendVerifyDescription =>
      'يجب عليك التحقق من عنوان بريدك الإلكتروني قبل أن تتمكن من إرسال طلبات الصداقة.';

  @override
  String get addFriendVerifyEmail => 'التحقق من البريد الإلكتروني';

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
  String get addFriendIgnoreTitle => 'تجاهل طلب الصداقة';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'هل تريد قبول طلب الصداقة من $userName؟';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'هل تريد تجاهل طلب الصداقة من $displayName؟';
  }

  @override
  String get addFriendCancelRequest => 'إلغاء الطلب';

  @override
  String get addFriendCancelRequestFailed =>
      'تعذّر إلغاء طلب الصداقة. يُرجى المحاولة مرة أخرى.';

  @override
  String get addFriendNotAcceptingRequests =>
      'هذا المستخدم لا يقبل طلبات الصداقة حاليًا.';

  @override
  String get addFriendUnblockFirst =>
      'ألغِ حظر هذا المستخدم أولًا لإرسال طلب صداقة.';

  @override
  String get addFriendCannotSendToSelf => 'لا يمكنك إرسال طلب صداقة لنفسك.';

  @override
  String get addFriendAlreadyFriends => 'أنت صديق لهذا المستخدم بالفعل.';

  @override
  String get addFriendClaimToSend => 'أكمل التسجيل لإرسال طلبات الصداقة.';

  @override
  String get addFriendVerifyToSend =>
      'تحقق من بريدك الإلكتروني قبل إرسال طلبات الصداقة.';

  @override
  String get addFriendFriendsListFull =>
      'قائمة أصدقائك ممتلئة، أو قائمة أصدقائهم ممتلئة. أزل شخصًا ما وحاول مرة أخرى.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'النظام';

  @override
  String get emojiSearchPlaceholder => 'ابحث عن الرمز التعبيري الذي تحلم به';

  @override
  String get emojiSearchEmpty => 'لا توجد إيموجيات تطابق بحثك';

  @override
  String get emojiAutocompleteDefaultLabel => 'الرمز التعبيري الافتراضي';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'هذا إيموجي افتراضي على $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'هذا الرمز التعبيري من هذا المجتمع. يمكنك استخدامه في كل مكان.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'هذا رمز تعبيري مخصص من أحد المجتمعات.';

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
  String get emojiFrequentlyUsed => 'الأكثر استخدامًا';

  @override
  String get emojiTabGifs => 'صور GIF';

  @override
  String get emojiTabMedia => 'الوسائط';

  @override
  String get emojiTabStickers => 'الملصقات';

  @override
  String get emojiTabEmojis => 'الرموز التعبيرية';

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
  String get gifPickerTrending => 'صور GIF رائجة';

  @override
  String get gifPickerNoResultsTitle => 'لا توجد نتائج بحث';

  @override
  String get gifPickerNoResultsDescription => 'جرّب مصطلح بحث آخر';

  @override
  String get gifPickerLoadFailedTitle => 'تعذر تحميل صور GIF';

  @override
  String get gifPickerLoadFailedBody => 'تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get emojiCategoryPeople => 'الأشخاص';

  @override
  String get emojiCategoryNature => 'الطبيعة';

  @override
  String get emojiCategoryFood => 'طعام وشراب';

  @override
  String get emojiCategoryActivity => 'الأنشطة';

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
  String get emojiPlutoniumUpsellDismiss => 'عدم الإظهار مرة أخرى';

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
  String get externalLinkWarningTitle => 'تحذير من رابط خارجي';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'أنت على وشك مغادرة $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'قد تكون الروابط الخارجية خطيرة. يرجى توخي الحذر.';

  @override
  String get externalLinkWarningDestinationUrl => 'رابط الوجهة:';

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
  String get externalLinkStripTrackingLabel => 'إزالة معلمات التتبع من الروابط';

  @override
  String get externalLinkStripTrackingDescription =>
      'إزالة معلمات التتبع تلقائيًا (مثل utm_source، fbclid، gclid) من الروابط في الرسائل التي ترسلها. ينظّف الرابط قبل أن يصل إلى أي شخص آخر.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'الوثوق بجميع الروابط الخارجية؟';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'سيؤدي هذا إلى الوثوق بجميع الروابط الخارجية وتجاوز التحذير لكل نطاق. سيتم استبدال نطاقاتك الموثوقة الحالية. هذا أقل أمانًا.';

  @override
  String get externalLinkTrustAllConfirmAction => 'الوثوق بالكل';

  @override
  String get externalLinkStopTrustingAllTitle => 'إيقاف الوثوق بجميع الروابط؟';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'ستظهر تحذيرات الروابط الخارجية مرة أخرى. ستحتاج إلى إضافة النطاقات الموثوقة بشكل فردي.';

  @override
  String get externalLinkStopTrustingAllAction => 'إيقاف الوثوق بجميع الروابط';

  @override
  String get externalLinkTrustedAllDescription =>
      'جميع الروابط الخارجية موثوقة. لن يتم عرض أي تحذيرات.';

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
  String get changeYourFluxerTag => 'تغيير اسم المستخدم';

  @override
  String get fluxerTagDescriptionBase =>
      'يمكن أن تتضمن أسماء المستخدمين أحرفًا (a-z, A-Z) وأرقامًا (0-9) وشرطات سفلية فقط. لا تميّز أسماء المستخدمين بين الأحرف الكبيرة والصغيرة.';

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
      'الأحرف (a-z وA-Z) والأرقام (0-9) والشرطات السفلية (_) فقط';

  @override
  String get fluxerTagAlreadyTaken => 'اسم المستخدم هذا مُستخدَم بالفعل';

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
      'عدّل مظهر ملفك الشخصي وشاهد معاينة مباشرة';

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
  String get bannerLabel => 'لافتة';

  @override
  String get changeBanner => 'تغيير اللافتة';

  @override
  String get removeBanner => 'إزالة اللافتة';

  @override
  String get bannerDescription =>
      'PNG، JPEG، WebP، GIF. بحد أقصى 10 ميجابايت. الحد الأدنى: 960×540 بكسل (16:9)';

  @override
  String get accentColorLabel => 'لون التمييز';

  @override
  String get accentColorDescription =>
      'تخصيص لون الحدود واللافتة في ملفك الشخصي';

  @override
  String get aboutMeLabel => 'نبذة عني';

  @override
  String get aboutMeHelperText =>
      'يمكنك استخدام الروابط والرموز التعبيرية وتنسيق ماركداون.';

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
  String get maskVisionaryAsSubscription => 'إظهار Visionary كاشتراك';

  @override
  String get maskVisionaryDescription =>
      'إظهار اشتراكك في Visionary كاشتراك عادي بدلاً من ذلك';

  @override
  String get hideVisionaryIdBadge => 'إخفاء شارة Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'إخفاء شارة معرف Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'إزالة شارة Visionary ID الخاصة بك';

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
  String get unclaimedAccountTitle => 'حساب غير مُطالَب به';

  @override
  String get unclaimedAccountDescription =>
      'لم يتم المطالبة بحسابك بعد. بدون بريد إلكتروني وكلمة مرور، قد تفقد الوصول. طالب بحسابك الآن لتأمينه.';

  @override
  String get claimAccount => 'المطالبة بالحساب';

  @override
  String get profileTypeLabel => 'نوع الملف الشخصي';

  @override
  String get profileTypeGlobal => 'الملف الشخصي العام';

  @override
  String get profileTypeGuildDescription =>
      'أنت تعدّل ملفك الشخصي الخاص بهذا المجتمع. سيظهر هذا الملف الشخصي في هذا المجتمع فقط وسيحل محل ملفك الشخصي العام.';

  @override
  String get communityNicknameLabel => 'الاسم المستعار في المجتمع';

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
  String get sudoTitle => 'تحقق من هويتك';

  @override
  String get sudoDescription => 'يتطلب هذا الإجراء التحقق للمتابعة.';

  @override
  String get sudoAuthenticatorCode => 'رمز المصادقة';

  @override
  String get sudoMethodPassword => 'كلمة المرور';

  @override
  String get sudoMethodTotp => 'تطبيق المصادقة';

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
  String get passwordChangeNewPassword => 'كلمة مرور جديدة';

  @override
  String get passwordChangeConfirmPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get passwordChangeSubmit => 'تغيير كلمة المرور';

  @override
  String get passwordChangeSuccess => 'تم تغيير كلمة المرور';

  @override
  String get passwordChangePasswordsDoNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get passwordChangeInvalidCode => 'الرمز غير صالح أو منتهي الصلاحية';

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
  String get emailChangeNewEmailTitle => 'أدخل بريدًا إلكترونيًا جديدًا';

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
  String get emailChangeInvalidCode => 'الرمز غير صالح أو منتهي الصلاحية';

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
  String get securityTfaSectionDescription => 'أضف طبقة أمان إضافية إلى حسابك';

  @override
  String get securityTfaAuthenticatorApp => 'تطبيق المصادقة';

  @override
  String get securityTfaAuthenticatorEnabled => 'تم تفعيل المصادقة الثنائية';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'استخدم تطبيق مصادقة لإنشاء رموز للمصادقة الثنائية';

  @override
  String get securityTfaBackupCodes => 'الرموز الاحتياطية';

  @override
  String get securityTfaBackupCodesDescription =>
      'عرض رموزك الاحتياطية وإدارتها لاستعادة الحساب';

  @override
  String get securityTfaViewCodes => 'عرض الرموز';

  @override
  String get securityPasskeysSectionTitle => 'مفاتيح المرور';

  @override
  String get securityPasskeysSectionDescription =>
      'استخدم المفاتيح المرجعية لتسجيل الدخول بدون كلمة مرور والمصادقة الثنائية';

  @override
  String get securityPasskeysRegistered => 'مفاتيح المرور المسجلة';

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
  String get securityPasskeysAdd => 'إضافة مفتاح مرور';

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
  String get securityPasskeysDeleteTitle => 'حذف مفتاح المرور';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'هل أنت متأكد أنك تريد حذف المفتاح المرجعي \"$name\"؟';
  }

  @override
  String get securityPasskeyNameTitle => 'تسمية مفتاح المرور';

  @override
  String get securityPasskeyNameLabel => 'اسم مفتاح المرور';

  @override
  String get securityPasskeyNameHint =>
      'مثال: YubiKey، أو iPhone، أو حاسوب العمل';

  @override
  String get securityClaimTitle => 'ميزات الأمان';

  @override
  String get securityClaimDescription =>
      'طالب بحسابك للوصول إلى ميزات الأمان مثل المصادقة الثنائية ومفاتيح المرور.';

  @override
  String get securityVerifyEmailRequired =>
      'يجب عليك التحقق من عنوان بريدك الإلكتروني قبل إعداد المصادقة الثنائية أو المفاتيح السرية.';

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
  String get backupCodesTitle => 'الرموز الاحتياطية';

  @override
  String get backupCodesWarning =>
      'إذا فقدت الوصول إلى تطبيق المصادقة الخاص بك ولم يكن لديك هذه الرموز، فسيتم قفل حسابك بشكل دائم. قم بتنزيلها أو نسخها الآن وقم بتخزينها في مكان آمن.';

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
  String get dangerZoneSectionTitle => 'منطقة الخطر';

  @override
  String get dangerZoneSectionDescription => 'إجراءات لا رجعة فيها ومدمرة';

  @override
  String get dangerZoneDisableTitle => 'تعطيل الحساب';

  @override
  String get dangerZoneDisableDescription =>
      'تعطيل حسابك مؤقتًا. يمكنك إعادة تنشيطه لاحقًا بتسجيل الدخول مرة أخرى.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'سيؤدي تعطيل حسابك إلى تسجيل خروجك من جميع الجلسات. يمكنك إعادة تمكين حسابك في أي وقت عن طريق تسجيل الدخول مرة أخرى.';

  @override
  String get dangerZoneDeleteTitle => 'حذف الحساب';

  @override
  String get dangerZoneDeleteDescription =>
      'احذف حسابك وجميع البيانات المرتبطة به نهائيًا. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'قم بإلغاء اشتراك Plutonium النشط الخاص بك في إعدادات Plutonium قبل حذف حسابك.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'لا يمكن حذف الحساب';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'لا يمكنك حذف حسابك أثناء امتلاكك لمجتمعات. يجب نقل ملكية المجتمعات التالية أولاً:';

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
  String get dangerZoneDeleteBullet1 => 'يمكنك إلغاء عملية الحذف خلال 14 يومًا';

  @override
  String get dangerZoneDeleteBullet2 => 'بعد 14 يومًا، سيتم حذف حسابك نهائيًا';

  @override
  String get dangerZoneDeleteBullet3 =>
      'بعد معالجة الحذف، لن تتمكن من استعادة الوصول إلى حسابك';

  @override
  String get dangerZoneDeleteBullet4 =>
      'لن تتمكن من حذف رسائلك المرسلة بعد حذف حسابك';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'إذا كنت ترغب في تصدير بياناتك أو حذف رسائلك أولاً، فيرجى زيارة قسم لوحة تحكم الخصوصية في إعدادات المستخدم قبل المتابعة.';

  @override
  String get claimAccountTitle => 'المطالبة بحسابك';

  @override
  String get claimAccountDescription =>
      'طالب بحسابك بإضافة بريد إلكتروني وكلمة مرور. سنرسل رمز تحقق لتأكيد بريدك الإلكتروني قبل الإتمام.';

  @override
  String get claimAccountEmailLabel => 'البريد الإلكتروني';

  @override
  String get claimAccountPasswordLabel => 'كلمة المرور';

  @override
  String get claimAccountSendCode => 'إرسال الرمز';

  @override
  String get claimAccountVerifyDescription =>
      'أدخل الرمز الذي أرسلناه إلى بريدك الإلكتروني للتحقق منه. سيتم تعيين كلمة مرورك بمجرد تأكيد الرمز.';

  @override
  String get claimAccountSuccess => 'تمت المطالبة بالحساب بنجاح';

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
  String get authorizedAppsTitle => 'التطبيقات المصرّح بها';

  @override
  String authorizedAppsDescription(String productName) {
    return 'تم منح هذه التطبيقات حق الوصول إلى حساب $productName الخاص بك.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'لا توجد تطبيقات مصرّح بها';

  @override
  String get authorizedAppsEmptyDescription =>
      'لم تسمح لأي تطبيقات بالوصول إلى حسابك.';

  @override
  String get authorizedAppsLoadError => 'تعذر تحميل التطبيقات المصرح بها';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'تم التفويض في $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'الأذونات الممنوحة';

  @override
  String get authorizedAppsRevoke => 'إلغاء الدعوة';

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
  String get authorizedAppsScopeGuilds => 'عرض المجتمعات التي أنت عضو فيها';

  @override
  String get authorizedAppsScopeConnections => 'عرض حساباتك المتصلة';

  @override
  String get authorizedAppsScopeBot => 'إضافة بوت إلى مجتمع بالأذونات المطلوبة';

  @override
  String get authorizedAppsScopeAdmin => 'الوصول إلى نقاط النهاية الإدارية';

  @override
  String get applicationsTitle => 'التطبيقات';

  @override
  String get applicationsCreate => 'إنشاء تطبيق';

  @override
  String get applicationsCreateSubmit => 'إنشاء';

  @override
  String get applicationsCreateClaimTooltip => 'طالب بحسابك لإنشاء التطبيقات.';

  @override
  String applicationsDocsLink(String domain) {
    return 'قراءة الوثائق ($domain)';
  }

  @override
  String get applicationsLoadError => 'تعذر تحميل التطبيقات';

  @override
  String get applicationsLoadErrorDescription =>
      'تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get applicationsEmptyTitle => 'لا توجد تطبيقات بعد';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'أنشئ تطبيقك الأول للبدء باستخدام $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'تم الإنشاء $date';
  }

  @override
  String get applicationsName => 'اسم التطبيق';

  @override
  String get applicationsNameHint => 'تطبيقي';

  @override
  String get applicationsNameRequired => 'اسم التطبيق مطلوب';

  @override
  String get applicationsBackToList => 'العودة إلى القائمة';

  @override
  String get applicationsDetailLoadError => 'تعذر تحميل هذا التطبيق';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'حاول مرة أخرى أو ارجع إلى قائمة التطبيقات.';

  @override
  String get applicationsId => 'معرف التطبيق';

  @override
  String get applicationsCopyId => 'نسخ المعرف';

  @override
  String get applicationsSecretsTitle => 'الأسرار والرموز المميّزة';

  @override
  String get applicationsSecretsDescription =>
      'حافظ على سريتها. ستؤدي إعادة الإنشاء إلى تعطيل عمليات التكامل الحالية.';

  @override
  String get applicationsClientSecret => 'سر العميل';

  @override
  String get applicationsBotToken => 'رمز البوت';

  @override
  String get applicationsRegenerate => 'إعادة إنشاء';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'هل تريد إعادة إنشاء سر العميل؟';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'هل تريد إعادة إنشاء رمز البوت؟';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'ستؤدي إعادة الإنشاء إلى إبطال السر الحالي. حدّث أي كود يستخدم القيمة القديمة.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'ستؤدي إعادة الإنشاء إلى إبطال الرمز الحالي. حدّث أي كود يستخدم القيمة القديمة.';

  @override
  String get applicationsClientSecretRegenerated =>
      'تم تجديد سر العميل. حدّث أي كود يستخدم السر القديم.';

  @override
  String get applicationsBotTokenRegenerated =>
      'تم تجديد رمز البوت. حدّث أي كود يستخدم الرمز القديم.';

  @override
  String get applicationsRegenerateFailed => 'تعذّرت إعادة إنشاء المفتاح السري';

  @override
  String get applicationsInfoTitle => 'معلومات التطبيق';

  @override
  String get applicationsInfoDescription =>
      'الإعدادات الأساسية وعناوين URI لإعادة التوجيه المسموح بها.';

  @override
  String get applicationsPublicBot => 'بوت عام';

  @override
  String get applicationsPublicBotDescription =>
      'السماح لأي شخص بدعوة هذا البوت إلى مجتمعاته.';

  @override
  String get applicationsRequireCodeGrant => 'اشتراط منح رمز التفويض في OAuth2';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'يتطلب عنوان URI لإعادة التوجيه ورمز تفويض عند دعوة هذا البوت.';

  @override
  String get applicationsRedirectUris => 'عناوين URI لإعادة التوجيه';

  @override
  String get applicationsAddRedirect => 'إضافة رابط إعادة توجيه';

  @override
  String get applicationsDeleteRedirect => 'حذف عنوان URI لإعادة التوجيه';

  @override
  String get applicationsBotProfileTitle => 'ملف البوت الشخصي';

  @override
  String get applicationsBotProfileDescription =>
      'الصورة الرمزية والعلامة وتفاصيل إضافية للملف الشخصي لبوتك.';

  @override
  String get applicationsBotAvatar => 'صورة البوت الرمزية';

  @override
  String get applicationsUsernameRequired => 'اسم المستخدم مطلوب';

  @override
  String get applicationsUsernameTooLong =>
      'يجب ألا يتجاوز اسم المستخدم 32 حرفًا';

  @override
  String get applicationsUsernameInvalid =>
      'يمكن أن يحتوي اسم المستخدم على أحرف وأرقام وشرطات سفلية فقط';

  @override
  String get applicationsBotUsername => 'اسم مستخدم البوت';

  @override
  String get applicationsDiscriminator => 'المميّز';

  @override
  String get applicationsBotBio => 'نبذة عن البوت';

  @override
  String get applicationsBotBioHint => 'بوت مفيد يقوم بأشياء مذهلة!';

  @override
  String get applicationsNoBotBanner => 'لا توجد لافتة للبوت';

  @override
  String get applicationsFriendlyBot => 'بوت يقبل الصداقة';

  @override
  String get applicationsFriendlyBotDescription =>
      'السماح للمستخدمين بإرسال طلبات صداقة لهذا البوت للموافقة اليدوية.';

  @override
  String get applicationsManualFriendApproval =>
      'اشتراط الموافقة اليدوية على طلبات الصداقة';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'تتطلب طلبات الصداقة المرسلة إلى هذا البوت موافقة يدوية.';

  @override
  String get applicationsOauthBuilderTitle => 'أداة إنشاء رابط OAuth2';

  @override
  String get applicationsOauthBuilderDescription =>
      'أنشئ عنوان URL للتفويض باستخدام النطاقات والأذونات.';

  @override
  String get applicationsScopes => 'نطاقات الصلاحيات';

  @override
  String get applicationsRedirectUri => 'عنوان URI لإعادة التوجيه';

  @override
  String get applicationsSelectRedirectUri => 'اختر عنوان URI لإعادة التوجيه';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'عنوان URI لإعادة التوجيه مطلوب لأن هذا البوت يتطلب منح رمز OAuth2.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'عنوان URI لإعادة التوجيه مطلوب عند عدم الاقتصار على نطاق bot.';

  @override
  String get applicationsBotPermissions => 'أذونات البوت';

  @override
  String get applicationsAuthorizeUrl => 'رابط التفويض';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'حدد النطاقات (وعنوان URI لإعادة التوجيه إذا لزم الأمر)';

  @override
  String get applicationsCopyAuthorizeUrl => 'نسخ رابط التفويض';

  @override
  String get applicationsCopiedUrl => 'تم نسخ الرابط إلى الحافظة';

  @override
  String get applicationsDangerTitle => 'منطقة الخطر';

  @override
  String get applicationsDangerSubtitle =>
      'لا يمكن التراجع عن هذا الإجراء. يؤدي حذف التطبيق أيضًا إلى حذف البوت الخاص به.';

  @override
  String get applicationsDangerHelper =>
      'بعد الحذف، ستتم إزالة التطبيق وبيانات اعتماده نهائيًا.';

  @override
  String get applicationsDelete => 'حذف التطبيق';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'هل أنت متأكد أنك تريد حذف $name؟ لا يمكن التراجع عن هذا الإجراء. سيتم حذف جميع البيانات المرتبطة، بما في ذلك مستخدم الروبوت، نهائيًا.';
  }

  @override
  String get applicationsDeleteFailed => 'تعذّر حذف التطبيق';

  @override
  String get applicationsUpdated => 'تم تحديث التطبيق بنجاح';

  @override
  String get applicationsNoChanges => 'لا توجد تغييرات لحفظها';

  @override
  String get applicationsSearchBots => 'التطبيقات والبوتات';

  @override
  String get applicationsSearchBotsDescription =>
      'إنشاء التطبيقات والبوتات لحسابك وإدارتها';

  @override
  String get applicationsSearchInfoDescription =>
      'تعديل أساسيات التطبيق وعناوين URI لإعادة التوجيه';

  @override
  String get applicationsSearchBotProfileDescription =>
      'تعديل صورة البوت الرمزية، والعلامة، والنبذة، واللافتة، وسلوك طلبات الصداقة';

  @override
  String get applicationsSearchOauthDescription =>
      'إنشاء رابط تفويض بالنطاقات وعناوين إعادة التوجيه وأذونات البوت';

  @override
  String get applicationsSearchSecretsDescription =>
      'عرض وإعادة إنشاء أسرار العميل ورموز البوت';

  @override
  String get applicationsSearchBotsKeyword => 'البوتات';

  @override
  String get applicationsSearchDocumentation => 'الوثائق';

  @override
  String get blockedUsersTitle => 'المستخدمون المحظورون';

  @override
  String get blockedUsersDescription =>
      'لا يمكن للمستخدمين المحظورين إرسال طلبات صداقة أو رسائل مباشرة إليك.';

  @override
  String get blockedUsersEmptyTitle => 'لا يوجد مستخدمون محظورون';

  @override
  String get blockedUsersEmptyDescription => 'لم تحظر أي شخص بعد.';

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
    return 'فريق عمل $productName';
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
    return '$productName رؤيوي منذ $date';
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
  String get userProfileMemberSince => 'عضو منذ';

  @override
  String get userProfileAboutMe => 'نبذة عني';

  @override
  String get userProfileRoles => 'الأدوار';

  @override
  String get memberRoleAdd => 'إضافة دور';

  @override
  String memberRoleRemove(String roleName) {
    return 'إزالة الدور $roleName';
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
  String get memberRolesConfirmOk => 'حسنًا';

  @override
  String get userProfileLocalTime => 'التوقيت المحلي';

  @override
  String get profileLocalTimeSettingsTitle => 'الوقت المحلي في الملف الشخصي';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'حدّد منطقتك الزمنية مرة واحدة ليُبقي $productName فارق توقيتك عن UTC محدّثًا عند تغيّر التوقيت الصيفي. لا يرى الآخرون إلا فارق توقيتك عن UTC، وليس معرف منطقتك الزمنية الدقيق.';
  }

  @override
  String get profileLocalTimeEditButton => 'تعديل التوقيت المحلي للملف الشخصي';

  @override
  String get profileLocalTimeTimezoneLabel => 'المنطقة الزمنية';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'اختر المنطقة الزمنية التي يستخدمها $productName لحساب الإزاحة عن التوقيت العالمي المنسق (UTC) لعرض الوقت المحلي في ملفك الشخصي.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'البحث عن المناطق الزمنية';

  @override
  String get profileLocalTimeNotSet => 'غير محدد';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'لا يرى الآخرون إزاحتك الحالية عن التوقيت العالمي المنسق (UTC) إلا عندما تختار مشاركة الوقت المحلي في ملفك الشخصي. ولا يرون معرف منطقتك الزمنية الدقيق، مثل $timezoneIdentifierExample. يخزّن $productName هذا المعرف فقط لكي تُحدَّث الإزاحة تلقائيًا عند تغيّر التوقيت الصيفي.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'الجميع';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'السماح لأي شخص يمكنه عرض ملفك الشخصي بالكامل برؤية وقتك المحلي';

  @override
  String get profileLocalTimePrivacyFriends => 'الأصدقاء';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'السماح لأصدقائك برؤية توقيتك المحلي';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'أعضاء المجتمع';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'السماح لأعضاء المجتمعات التي تنتمي إليها برؤية توقيتك المحلي';

  @override
  String get userProfileSameTimeAsYou => 'نفس توقيتك';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'يسبق توقيتك بـ $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'يتأخر عن توقيتك بـ $duration';
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
  String get userProfileCopyUserId => 'نسخ معرف المستخدم';

  @override
  String get userProfileViewMainProfile => 'عرض الملف الشخصي الرئيسي';

  @override
  String get userProfileViewCommunityProfile => 'عرض الملف الشخصي في المجتمع';

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
  String get userProfileTimeout => 'مهلة';

  @override
  String get userProfileRemoveTimeout => 'إزالة المهلة';

  @override
  String get userProfileTransferOwnership => 'نقل الملكية';

  @override
  String get userProfileReportMessage => 'الإبلاغ عن الرسالة';

  @override
  String get userProfileReportUserProfile => 'الإبلاغ عن الملف الشخصي';

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
  String get userProfileBanDeleteNone => 'عدم حذف أي رسالة';

  @override
  String get userProfileBanDelete24h => 'آخر 24 ساعة';

  @override
  String get userProfileBanDelete7d => 'آخر 7 أيام';

  @override
  String get userProfileBanReasonLabel => 'السبب (اختياري)';

  @override
  String get userProfileBanReasonHint => 'أدخل سبب الحظر';

  @override
  String get userProfileBanSubmit => 'حظر العضو';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'حظر كتابة $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'مدة المهلة';

  @override
  String get userProfileTimeoutSubmit => 'حظر العضو من الكتابة';

  @override
  String get userProfileNicknameLabel => 'الاسم المستعار';

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
  String get typingIndicatorMultiple => 'عدة أشخاص يكتبون...';

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
    return 'سعداء بوجودك هنا يا $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'أهلاً بك، $username! تفضل، البيت بيتك.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'مرحباً، $username! سعيدون بوجودك معنا.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'مرحبًا، $username! شاركنا متى كنت مستعدًا.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'أهلًا $username، يسعدنا أن نراك هنا!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'مرحبًا بك يا $username! نتمنى أن تستمتع بوقتك معنا.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'مرحباً يا $username، أهلاً بك!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'سعيدون بانضمامك، $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'أهلاً بك، $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'مرحباً بك، $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'مرحباً بك، $username! يسعدنا وجودك معنا.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'أهلاً بك، $username! نتمنى لك قضاء وقت ممتع هنا.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'مرحباً بك، $username! محادثتك التالية تبدأ من هنا.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'مرحباً بك يا $username. يسعدنا وجودك معنا.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'سعداء برؤيتك يا $username! أهلًا بك.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'أهلاً بك، $username! سعيدون بانضمامك إلينا.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'لقد وصلت، $username! هيا بنا نبدأ.';
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
  String get linkedDevicesRevokeTooltip => 'إلغاء ربط الجهاز';

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
  String get linkedDevicesViewDetails => 'عرض التفاصيل';

  @override
  String get linkedDevicesDetailsTitle => 'تفاصيل الجهاز';

  @override
  String get linkedDevicesDetailsDevice => 'الجهاز';

  @override
  String get linkedDevicesDetailsClient => 'العميل';

  @override
  String get linkedDevicesDetailsLocation => 'الموقع';

  @override
  String get linkedDevicesDetailsIp => 'عنوان IP';

  @override
  String get linkedDevicesDetailsLastUsed => 'آخر استخدام';

  @override
  String get linkedDevicesCurrentSession => 'الجلسة الحالية';

  @override
  String get linkedDevicesUnknown => 'غير معروف';

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
    return 'الوضع البطيء مضبوط على $durationLabel، لكنك مستثنى منه.';
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
    return 'إعلانات النظام من فريق $productName. لا يمكنك الرد هنا.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'تم إيقاف المراسلة مؤقتًا في هذا المجتمع.';

  @override
  String get channelComposerBarrierTimedOut =>
      'أنت في المهلة. المراسلة والتفاعلات والصوت متوقفة مؤقتًا حتى تنتهي المهلة.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'يجب المطالبة بحسابك لإرسال الرسائل في هذا المجتمع.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'يجب عليك التحقق من بريدك الإلكتروني لإرسال الرسائل في هذا المجتمع.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'حسابك جديد جدًا ولا يمكنه إرسال رسائل في هذا المجتمع.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'لم تكن عضوًا في هذا المجتمع لفترة كافية لإرسال الرسائل.';

  @override
  String get channelComposerBarrierVerifyEmail => 'التحقق من البريد الإلكتروني';

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
  String get voiceMessageTitle => 'رسالة صوتية';

  @override
  String get voiceMessageHoldHint =>
      'اضغط مع الاستمرار للتسجيل. اسحب إلى سلة المهملات للحذف، أو اسحب للأعلى للقفل، أو أفلت للإرسال.';

  @override
  String get voiceMessageDiscard => 'تجاهل الرسالة الصوتية';

  @override
  String get voiceMessageSend => 'إرسال رسالة صوتية';

  @override
  String get voiceMessageMicPermissionDenied =>
      'تعذّر بدء التسجيل. اسمح بالوصول إلى الميكروفون.';

  @override
  String get voiceMessageMicInUse =>
      'غادر المكالمة الصوتية لتسجيل رسالة صوتية.';

  @override
  String get voiceMessageRecordingFailed => 'فشل التسجيل. حاول مرة أخرى.';

  @override
  String get voiceMessageSendFailed =>
      'تعذّر إرسال الرسالة الصوتية. حاول مرة أخرى.';

  @override
  String get voiceMessagePlay => 'تشغيل';

  @override
  String get voiceMessagePause => 'إيقاف مؤقت';

  @override
  String get voiceMessageSeekForward => 'تقديم للأمام';

  @override
  String get voiceMessageSeekBackward => 'تقديم للخلف';

  @override
  String get chatAttachmentEditTitle => 'تعديل المرفق';

  @override
  String get chatAttachmentFilenameLabel => 'اسم الملف';

  @override
  String get chatAttachmentDescriptionLabel => 'الوصف';

  @override
  String get chatAttachmentDescriptionHint => 'نص بديل اختياري';

  @override
  String get chatAttachmentSpoilerLabel => 'وضع علامة كمحتوى مخفي';

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
  String get chatTextualPreviewSyntaxHighlighting => 'تمييز بناء الجملة';

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
  String get chatAttachmentSpoiler => 'محتوى مخفي';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'إظهار المحتوى المخفي';

  @override
  String get matureMediaRevealButton => 'إظهار';

  @override
  String get matureMediaRevealHint => 'انقر للإظهار';

  @override
  String get matureContentTitle => 'محتوى للبالغين';

  @override
  String get matureCommunityTitle => 'مجتمع للبالغين';

  @override
  String get matureCategoryTitle => 'فئة للبالغين';

  @override
  String get matureChannelTitle => 'قناة للبالغين';

  @override
  String get communityContentWarningTitle => 'تحذير بشأن محتوى المجتمع';

  @override
  String get categoryContentWarningTitle => 'تحذير محتوى الفئة';

  @override
  String get channelContentWarningTitle => 'تحذير محتوى القناة';

  @override
  String get defaultContentWarningBody => 'يحتوي هذا على محتوى حساس.';

  @override
  String get matureCommunityBody =>
      'تم وضع علامة على هذا المجتمع لاحتوائه على محتوى للبالغين وقد يتضمن مواد غير مناسبة لبعض المستخدمين.';

  @override
  String get matureCategoryBody =>
      'تم وضع علامة على هذه الفئة لاحتوائها على محتوى للبالغين وقد تتضمن مواد غير مناسبة لبعض المستخدمين.';

  @override
  String get matureChannelBody =>
      'تم وضع علامة على هذه القناة لاحتوائها على محتوى للبالغين وقد تتضمن مواد غير مناسبة لبعض المستخدمين.';

  @override
  String get matureVoiceChannelBody =>
      'هذه القناة الصوتية مصنّفة للبالغين وقد تحتوي على مواد قد تكون غير مناسبة لبعض المستخدمين.';

  @override
  String get matureLinkChannelBody =>
      'قناة الرابط هذه مصنفة للمحتوى للبالغين وقد تفتح مواد غير مناسبة لبعض المستخدمين.';

  @override
  String get matureCommunityUnavailableBody =>
      'هذا المجتمع المخصص للبالغين غير متاح لحسابك.';

  @override
  String get matureCategoryUnavailableBody =>
      'هذه الفئة المخصصة للبالغين غير متاحة لحسابك.';

  @override
  String get matureChannelUnavailableBody =>
      'هذه القناة المخصصة للبالغين غير متاحة لحسابك.';

  @override
  String get matureContentProceedButton => 'متابعة';

  @override
  String get matureContentUnderstandButton => 'فهمت';

  @override
  String get matureContentOpenLinkButton => 'فتح الرابط';

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
  String chatAttachmentExpiresOn(String date) {
    return 'تنتهي صلاحيته في $date';
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
  String get connectionsAddDomain => 'النطاق';

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
  String get connectionHandleLabel => 'اسم المستخدم';

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
  String get connectionDnsRecordTitle => 'سجل DNS TXT';

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
  String get connectionTokenFileTitle => 'استضِف ملف الرمز المميّز';

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
      'السماح لأي شخص برؤية هذا الاتصال في ملفك الشخصي';

  @override
  String get connectionVisibilityFriends => 'الأصدقاء';

  @override
  String get connectionVisibilityFriendsDesc =>
      'السماح لأصدقائك برؤية هذا الاتصال';

  @override
  String get connectionVisibilityCommunityMembers => 'أعضاء المجتمع';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'السماح لأعضاء المجتمعات التي تنتمي إليها برؤية هذا الاتصال';

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
  String get lookAndFeelThemeSectionTitle => 'السمة';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'اختر بين المظهر الداكن أو الفحمي أو الفاتح.';

  @override
  String get lookAndFeelHdrSectionTitle => 'النطاق الديناميكي العالي';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'تحكّم في كيفية عرض صور HDR على الشاشات المتوافقة مع HDR.';

  @override
  String get lookAndFeelHdrFullName => 'نطاق ديناميكي كامل';

  @override
  String get lookAndFeelHdrFullDescription =>
      'عرض صور HDR بكامل سطوعها ونطاق ألوانها.';

  @override
  String get lookAndFeelHdrStandardName => 'نطاق قياسي';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'تحويل درجات ألوان صور HDR إلى النطاق القياسي لتقليل ذروة السطوع.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'وضع العرض بالنطاق الديناميكي العالي';

  @override
  String get lookAndFeelThemeDark => 'السمة الداكنة';

  @override
  String get lookAndFeelThemeDarkLegacy => 'السمة الداكنة (القديمة)';

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
  String get lookAndFeelThemeColorsTitle => 'Theme colors';

  @override
  String get lookAndFeelThemeColorsConfigureDescription =>
      'Customize individual theme colors for this device.';

  @override
  String lookAndFeelThemeColorsEditingMode(String mode) {
    return 'Editing $mode';
  }

  @override
  String get lookAndFeelThemeColorsSyncSectionTitle => 'Theme Studio sync';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioLabel =>
      'Use colors from Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioDescription =>
      'When enabled, color changes from Theme Studio on desktop apply on this device. When disabled, this device keeps its own colors.';

  @override
  String get lookAndFeelThemeColorsSyncToStudioLabel =>
      'Send color changes to Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncToStudioDescription =>
      'When enabled, colors you change here sync to Theme Studio on your other devices. When disabled, desktop Theme Studio keeps its own colors.';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioOffBanner =>
      'Desktop Theme Studio color changes will not apply on this device.';

  @override
  String get lookAndFeelThemeColorsEssentialSectionTitle => 'Essential colors';

  @override
  String get lookAndFeelThemeColorsChatBackgroundWallpaperNote =>
      'If you have a chat wallpaper set, you won\'t see this color.';

  @override
  String lookAndFeelThemeColorsResetForMode(String mode) {
    return 'Reset all colors for $mode';
  }

  @override
  String get lookAndFeelThemeColorsResetConfirmTitle => 'Reset theme colors?';

  @override
  String lookAndFeelThemeColorsResetConfirmBody(String mode) {
    return 'This removes your custom color overrides for $mode on this device.';
  }

  @override
  String get lookAndFeelThemeColorsGroupBrandButtons => 'Brand & buttons';

  @override
  String get lookAndFeelThemeColorsGroupChatSurfaces => 'Chat & messages';

  @override
  String get lookAndFeelThemeColorsGroupSidebars => 'Sidebars & navigation';

  @override
  String get lookAndFeelThemeColorsGroupText => 'Text';

  @override
  String get lookAndFeelThemeColorsGroupHeaders => 'Headers';

  @override
  String get lookAndFeelThemeColorsGroupStatus => 'Status';

  @override
  String get lookAndFeelThemeColorsGroupEmbedsMarkup => 'Embeds & mentions';

  @override
  String get lookAndFeelThemeColorsGroupAccentsAlerts => 'Accents & alerts';

  @override
  String get lookAndFeelThemeColorsGroupControls => 'Surfaces & controls';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Chat font scaling';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Adjust the font size in the chat area.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'حجم خط الدردشة';

  @override
  String get lookAndFeelAppZoomTitle => 'مستوى تكبير التطبيق';

  @override
  String get lookAndFeelAppZoomDescription => 'اضبط مستوى تكبير التطبيق.';

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
  String get lookAndFeelChatWallpaperStarfieldLabel => 'حقل النجوم';

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
      'تخطيط واسع مع فصل بصري واضح بين الرسائل.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'مكثف';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'يعرض أكبر عدد من الرسائل بأقل تباعد.';

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
      'إظهار مؤشر الكتابة مع صور المستخدمين الرمزية في قائمة القنوات';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'مؤشر الكتابة فقط';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'إظهار مؤشر الكتابة فقط بدون صور رمزية';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'مخفي';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'عدم إظهار مؤشرات الكتابة في قائمة القنوات';

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
  String get communityTemporarilyUnavailable => 'المجتمع غير متاح مؤقتًا';

  @override
  String get guildUnavailableDescription => 'حدث خطأ ما. نحن نعمل على إصلاحه.';

  @override
  String get guildNotFoundTitle => 'هذا ليس المجتمع الذي تبحث عنه.';

  @override
  String get guildNotFoundDescription =>
      'ربما حُذف المجتمع الذي تبحث عنه أو ليس لديك صلاحية الوصول إليه.';

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
      'التحكم في سلوك مؤشر الرسائل غير المقروءة للقنوات المكتومة في قوائم القنوات.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'إظهار مؤشر الرسائل غير المقروءة في القنوات المكتومة';

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
      'إظهار «نشط الآن» على الشاشة الرئيسية';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'اعرض «نشط الآن» على الشاشة الرئيسية لإبراز الأصدقاء النشطين في القنوات الصوتية. سترى معاينة وسياق القناة ومن هناك بالفعل وطريقة سريعة للانضمام.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'المفضلة';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'تحكم في رؤية المفضلة في جميع أنحاء التطبيق.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'تفعيل المفضلة';

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
  String get favoritesWelcomeTip => 'ليست مناسبة لك؟ يمكنك تعطيلها في أي وقت.';

  @override
  String get favoritesDisableButton => 'تعطيل المفضلة';

  @override
  String get favoritesAddedToast => 'أُضيف إلى المفضلة';

  @override
  String get favoritesRemovedToast => 'أُزيل من المفضلة';

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
  String get favoritesNicknameLabel => 'الاسم المستعار';

  @override
  String get favoritesSaveNickname => 'حفظ الاسم المستعار';

  @override
  String get favoritesMoveToCategory => 'نقل إلى فئة';

  @override
  String get favoritesUncategorized => 'غير مصنف';

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
      'إضافة إلى صور GIF المفضلة (بالرابط فقط)';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'إزالة من صور GIF المفضلة (بالرابط فقط)';

  @override
  String get savedMediaAddTitle => 'إضافة إلى الوسائط المحفوظة';

  @override
  String get savedMediaFormNameLabel => 'الاسم';

  @override
  String get savedMediaFormNameHint => 'وسائطي الرائعة';

  @override
  String get savedMediaFormAltTextLabel => 'نص بديل';

  @override
  String get savedMediaFormAltTextHint => 'صف الوسائط';

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
      'إظهار في كل المجتمعات';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'للمجتمعات الجديدة فقط';

  @override
  String get messagesMediaDisplaySectionTitle => 'عرض الوسائط';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'تحكم في كيفية عرض الصور ومقاطع الفيديو والوسائط الأخرى. يتم تغيير حجم جميع الوسائط وتحويلها. لن يتم تضمين الملفات الكبيرة جدًا التي لا يمكن ضغطها في معاينة بغض النظر عن هذه الإعدادات.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel => 'عند نشرها كروابط للدردشة';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'عند الرفع مباشرة إلى $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'معاينات الروابط';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'تحكم في كيفية معاينة روابط مواقع الويب في الدردشة';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'إظهار التضمينات ومعاينة روابط المواقع';

  @override
  String get messagesMediaReactionsSectionTitle => 'التفاعلات';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'تكوين ردود فعل الرموز التعبيرية على الرسائل';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'إظهار التفاعلات بالرموز التعبيرية على الرسائل';

  @override
  String get messagesMediaSpoilersSectionTitle => 'محتوى مخفي';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'تحكم في كيفية عرض المحتوى المخفي';

  @override
  String get messagesMediaSpoilersRadioLabel => 'عرض المحتوى المخفي';

  @override
  String get messagesMediaSpoilersOnClickName => 'عند النقر';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'إظهار المحتوى المخفي عند النقر';

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
      'إظهار المحتوى المخفي دائمًا';

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
      'إظهار الرموز التعبيرية الافتراضية في الإكمال التلقائي للتعبيرات';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'إظهار الرموز التعبيرية المخصصة في الإكمال التلقائي للتعبيرات';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'إظهار الملصقات في الإكمال التلقائي للتعبيرات';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'إظهار الوسائط المحفوظة في الإكمال التلقائي للتعبيرات';

  @override
  String get accessibilitySaturationTitle => 'التشبع';

  @override
  String get accessibilityVisualGroupTitle => 'المرئيات';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'تسطير الروابط دائمًا';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'إظهار النص البديل على الصور';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'عرض النص البديل أسفل الصور عند توفره.';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'تعتيم النص المشطوب';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'معاينات الرسائل المباشرة';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'وضع معاينة الرسائل المباشرة';

  @override
  String get accessibilityDmMessagePreviewAllName => 'كل الرسائل';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'إظهار معاينات الرسائل لجميع محادثات الرسائل المباشرة';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'الرسائل المباشرة غير المقروءة فقط';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'إظهار معاينات الرسائل فقط للرسائل المباشرة التي تحتوي على رسائل غير مقروءة';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'لا شيء';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'عدم إظهار معاينات الرسائل في قائمة الرسائل المباشرة';

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
      'السماح لقارئات الشاشة بالإعلان عن الرسائل الجديدة فور وصولها إلى القناة المفتوحة. لا تتأثر أصوات الإشعارات.';

  @override
  String get accessibilityTtsGroupTitle => 'تحويل النص إلى كلام';

  @override
  String get accessibilityTtsGroupDescription => 'اختر سرعة للنص المنطوق.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => 'سرعة تشغيل الكلام';

  @override
  String get accessibilityTtsPlaySampleLabel => 'تشغيل عينة';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'إيقاف العينة';

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
      'الخروج من وضع لوحة المفاتيح بمفتاح الهروب';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'إظهار اختصارات قائمة السياق';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'التأكيد قبل بدء المكالمات';

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
    return 'تشغيل صور GIF تلقائيًا عندما تكون نافذة $productName نشطة';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'يتم التشغيل على الرغم من تقليل الحركة.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'متوقفة مؤقتًا بسبب تقليل الحركة. فعّل هذا الخيار لمواصلة تشغيل الرموز التعبيرية المتحركة.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'متوقفة مؤقتًا بسبب تقليل الحركة. فعّل هذا الخيار لمواصلة تشغيل صور GIF.';

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
      'لن تتحرك الملصقات أبدًا';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'يتم التحريك دائمًا على الرغم من تقليل الحركة.';

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
      'مزامنة إعداد تقليل الحركة مع النظام';

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
    return 'رمز تعبيري $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'الأمر $commandName';
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
  String get dmListSentAnAttachment => 'أرسل مرفقًا';

  @override
  String systemPreviewPinnedMessage(String username) {
    return 'ثبّت $username رسالة في هذه القناة.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return 'أضاف $username $userName إلى المجموعة.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return 'أضاف $username شخصًا إلى المجموعة.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return 'غادر $username المجموعة.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return 'أزال $username $userName من المجموعة.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return 'أزال $username شخصًا من المجموعة.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return 'غيّر $username اسم القناة إلى $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return 'غيّر $username اسم القناة.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return 'غيّر $username أيقونة القناة.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return 'بدأ $username مكالمة.';
  }

  @override
  String get systemCallJoinTheCall => 'الانضمام إلى المكالمة';

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
  String get systemCallDurationFewSeconds => 'بضع ثوانٍ';

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
  String get voiceConnectionConfirmTitle => 'تأكيد الاتصال الصوتي';

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
      'انضمام فقط (مع الاحتفاظ بالاتصالات الأخرى)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'لا تفعل شيئًا، لا أريد الانضمام';

  @override
  String get voiceJoinFailedTitle => 'تعذر الانضمام إلى المكالمة الصوتية';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'تعذر قطع الاتصال بأجهزتك الأخرى. حاول مرة أخرى بعد لحظة.';

  @override
  String get voiceChannelJoin => 'الانضمام إلى القناة الصوتية';

  @override
  String get voiceCallJoin => 'الانضمام إلى المكالمة';

  @override
  String get voiceChannelJoinConnect => 'الاتصال بالصوت';

  @override
  String get voiceChannelNoConnectPermission =>
      'ليس لديك إذن للانضمام إلى هذه القناة الصوتية';

  @override
  String get voiceChannelE2eeEncrypted =>
      'محتوى الميكروفون والكاميرا ومشاركة الشاشة مشفّر تشفيرًا تامًا بين الطرفين.';

  @override
  String get voiceCallE2eeEncrypted =>
      'محتوى الميكروفون والكاميرا ومشاركة الشاشة مشفّر تشفيرًا تامًا بين الطرفين.';

  @override
  String get voiceChannelE2eeBroken =>
      'التشفير التام بين الطرفين غير متاح لوجود مشارك غير مدعوم في هذه القناة الصوتية.';

  @override
  String get voiceCallE2eeBroken =>
      'التشفير التام بين الطرفين غير متاح لوجود مشارك غير مدعوم في هذه المكالمة.';

  @override
  String get voiceE2eeUpdateRequired =>
      'يجب تحديث هذا العميل قبل الانضمام إلى هذه المكالمة المشفرة.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'تعذر بدء تشغيل الميكروفون الخاص بك. ما زلت في المكالمة.';

  @override
  String get voiceChannelStatusConnecting => 'جارٍ الاتصال…';

  @override
  String get voiceParticipantTooltipMobileDevice => 'جهاز جوال';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'جهاز كمبيوتر';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'كتم الصوت بواسطة المجتمع';

  @override
  String get voiceParticipantTooltipMuted => 'تم كتم الصوت';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'تم تعطيل الصوت بواسطة المجتمع';

  @override
  String get voiceParticipantTooltipDeafened => 'السمع معطّل';

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
  String get voiceControlDeafen => 'تعطيل السمع';

  @override
  String get voiceControlUndeafen => 'إلغاء تعطيل السمع';

  @override
  String get voiceControlVideo => 'الفيديو';

  @override
  String get voiceControlFlipCamera => 'تبديل الكاميرا';

  @override
  String get voiceControlScreenShare => 'مشاركة الشاشة';

  @override
  String get voiceScreenShareNotificationText => 'جارٍ مشاركة شاشتك.';

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
  String get voiceMeasuringLatency => 'جارٍ قياس زمن الاستجابة...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'الانتقال إلى $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'الاتصال الصوتي';

  @override
  String get voiceConnectionAdvancedStats => 'خيارات متقدمة';

  @override
  String get voiceShowCallAvatars => 'إظهار الصور الرمزية في المكالمة';

  @override
  String get voiceShowConnectionId => 'إظهار معرف الاتصال';

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
  String get voiceConnectionPingLabel => 'البينج';

  @override
  String get voiceConnectionJitterLabel => 'التذبذب';

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
  String get userAreaUnmuteMicrophone => 'إلغاء كتم الميكروفون';

  @override
  String get userAreaUserSettings => 'إعدادات المستخدم';

  @override
  String get voiceParticipantMenuViewProfile => 'عرض الملف الشخصي';

  @override
  String get voiceParticipantMenuFocus => 'التركيز على هذا الشخص';

  @override
  String get voiceParticipantMenuUnfocus => 'إلغاء التركيز';

  @override
  String get voiceParticipantMenuCommunityMute => 'كتم صوت العضو في المجتمع';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'تعطيل سمع العضو في المجتمع';

  @override
  String get voiceParticipantMenuUserVolume => 'مستوى صوت المستخدم';

  @override
  String get voiceParticipantMenuStreamVolume => 'مستوى صوت البث';

  @override
  String get voiceParticipantMenuStopStreaming => 'إيقاف البث';

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
  String get voiceOutputRouteSpeaker => 'مكبر الصوت';

  @override
  String get voiceOutputRouteEarpiece => 'سماعة الأذن';

  @override
  String get voiceOutputRouteHeadset => 'سماعات الرأس';

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
  String get voiceLiveBadge => 'مباشر';

  @override
  String get dmVoiceViewCall => 'عرض المكالمة';

  @override
  String get dmVoiceCallFullScreen => 'ملء الشاشة';

  @override
  String get dmVoiceCallFullScreenTooltip => 'فتح المكالمة بملء الشاشة';

  @override
  String get dmVoiceStripStatusConnecting => 'جارٍ الاتصال…';

  @override
  String get dmVoiceStripStatusInCall => 'في المكالمة';

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
  String get dmVoiceFullscreenTitle => 'صوت';

  @override
  String get voiceCallBarGuildConnectedFallback => 'تم الاتصال بالصوت';

  @override
  String get notificationsPageTitle => 'الإشعارات';

  @override
  String get notificationsFilterUnreads => 'غير المقروءة';

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
  String get notificationsMentionIncludeGuilds =>
      'تضمين جميع الإشارات في المجتمعات';

  @override
  String get notificationsNoUnreadTitle => 'لا توجد رسائل غير مقروءة';

  @override
  String get notificationsNoUnreadBody => 'لقد اطلعت على كل جديد.';

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
  String get notificationsJump => 'انتقال';

  @override
  String get notificationsRemoveMentionTooltip => 'إزالة الإشارة';

  @override
  String get notificationsViewAllUnread => 'عرض كل الرسائل غير المقروءة';

  @override
  String get notificationsMarkAsRead => 'وضع علامة كمقروءة';

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
      'تعذّر تسليم رسالتك. يجب المطالبة بحسابك لإرسال رسائل مباشرة.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'تعذّر تسليم رسالتك. يجب المطالبة بحسابك لإرسال الرسائل.';

  @override
  String get chatSendFailureContentBlocked =>
      'تعذّر تسليم رسالتك لأن أنظمة الأمان لدينا وضعت عليها علامة. إذا كنت تعتقد أن هذا خطأ، فيُرجى التواصل مع الدعم.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'تعذّر تسليم رسالتك لأن أنظمة الأمان لدينا وضعت عليها علامة. إذا كنت تعتقد أن هذا خطأ، فيُرجى التواصل مع مسؤولي هذا المثيل.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'لم يتم تسليم رسالتك لأنها تحتوي على رموز تعبيرية أو ملصقات ناضجة غير مسموح بها في هذا السياق.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'يمكنك رؤية هذه الرسالة فقط.';

  @override
  String get chatClientSystemDismiss => 'تجاهل';

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
      'الأصدقاء والمجتمعات الصغيرة فقط';

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
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'أصدقاء الأصدقاء';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers => 'أعضاء المجتمع';

  @override
  String get privacyDashboardDirectMessagesTitle => 'الرسائل المباشرة';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'السماح بالرسائل المباشرة من أعضاء المجتمع';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'السماح بالرسائل المباشرة من بوتات المجتمع';

  @override
  String get privacyDashboardIncomingCallsTitle => 'المكالمات الواردة';

  @override
  String get privacyDashboardAllowedCallers => 'المتصلون المسموح لهم';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'حظر جميع المكالمات الواردة';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'السماح للأصدقاء فقط بالاتصال بك (موصى به)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'السماح للأصدقاء بالإضافة إلى المجموعات الإضافية التي تختارها';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'السماح لأي شخص بالاتصال بك، حتى الغرباء';

  @override
  String get privacyDashboardAdditionalGroups => 'مجموعات إضافية';

  @override
  String get privacyDashboardRingBehavior => 'سلوك الرنين';

  @override
  String get privacyDashboardSilentCalls => 'مكالمات صامتة من الجميع';

  @override
  String get privacyDashboardGroupDmTitle =>
      'من يمكنه إضافتك إلى المحادثات الجماعية';

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
  String get privacyDashboardVoiceActivityTitle =>
      'النشاط الصوتي في \"نشط الآن\"';

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
    return 'متاح مجددًا بعد $time';
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
      'إزالة الرسائل التي أرسلتها نهائيًا من الرسائل المباشرة والمحادثات الجماعية والمجتمعات. تتم العملية في الخلفية، وستصلك رسالة مباشرة عند انتهائها.';

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
  String get privacyDashboardDataRequestScopeTitle => 'ما الذي تريد تضمينه';

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
      'الأماكن التي لم يعد بإمكاني الوصول إليها فقط';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'حذف الرسائل فقط من المجتمعات والمحادثات الجماعية التي غادرتها أو تمت إزالتك منها.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'أي المحادثات';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'فعّل أنواع المحادثات التي تريد تضمينها أو عطّلها.';

  @override
  String get privacyDashboardDataRequestKindDms => 'الرسائل المباشرة المفتوحة';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'الرسائل المباشرة المغلقة';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'المحادثات الجماعية';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'المجتمعات';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'أي المجتمعات';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'تصفية المجتمعات';

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
  String get privacyDashboardDataRequestAllTime => 'كل الأوقات';

  @override
  String get privacyDashboardDataRequestCustomRange => 'نطاق مخصص';

  @override
  String get privacyDashboardDataRequestStartDate => 'تاريخ البدء';

  @override
  String get privacyDashboardDataRequestEndDate => 'تاريخ الانتهاء';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'اترك أيًّا من الحقلين فارغًا لإبقاء ذلك الطرف من النطاق الزمني مفتوحًا.';

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
      'سنُنشئ أرشيفًا قابلاً للتنزيل يطابق الفلاتر أدناه، وسنرسل إليك بريدًا إلكترونيًا عندما يصبح جاهزًا. تنتهي صلاحية رابط التنزيل في ذلك البريد الإلكتروني بعد 7 أيام.';

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
  String get privacyDashboardDataRequestSummaryNone => 'لا شيء';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'بدءًا من $start';
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
  String get doubleTapReactionHint => 'انقر نقرًا مزدوجًا على رسالة للتفاعل بـ';

  @override
  String get doubleTapReactionEdit => 'تعديل';

  @override
  String get doubleTapReactionEditTitle => 'تعديل الافتراضي';

  @override
  String get doubleTapReactionEditSubtitle =>
      'اختر رمزًا تعبيريًا للنقر المزدوج';

  @override
  String get messagesMediaDoubleTapSectionTitle => 'Double tap';

  @override
  String get messagesMediaDoubleTapSectionDescription =>
      'Choose what happens when you double tap a message.';

  @override
  String get messagesMediaDoubleTapActionLabel => 'Double tap action';

  @override
  String get messagesMediaDoubleTapActionReactName => 'Add reaction';

  @override
  String get messagesMediaDoubleTapActionReactDescription =>
      'Adds your default double-tap emoji as a reaction.';

  @override
  String get messagesMediaDoubleTapActionEditName => 'Edit message';

  @override
  String get messagesMediaDoubleTapActionEditDescription =>
      'Opens the editor on messages you sent. Other messages are unchanged.';

  @override
  String get messagesMediaDoubleTapActionNoneName => 'Nothing';

  @override
  String get messagesMediaDoubleTapActionNoneDescription =>
      'Double tap is disabled.';

  @override
  String get chatMessageEdit => 'تعديل الرسالة';

  @override
  String get chatMessageReply => 'رد';

  @override
  String get notificationReplyPlaceholder => 'رسالة';

  @override
  String get notificationReplyFailed => 'تعذّر إرسال الرد';

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
  String get forwardFailed => 'تعذّر إعادة توجيه الرسالة';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'التعليقات غير متاحة لأن قناة محددة لديها وضع بطيء مفعل.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'في انتظار انتهاء الوضع البطيء في قناة واحدة أو أكثر من القنوات المحددة.';

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
  String get chatMessageStopSpeaking => 'إيقاف النطق';

  @override
  String get chatMessagePin => 'تثبيت الرسالة';

  @override
  String get chatMessageUnpin => 'إلغاء تثبيت الرسالة';

  @override
  String get chatMessageUnpinIt => 'إلغاء التثبيت';

  @override
  String get chatMessageBookmark => 'وضع إشارة مرجعية على الرسالة';

  @override
  String get chatMessageRemoveBookmark => 'إزالة الإشارة المرجعية';

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
  String get chatMessageViewReactions => 'عرض التفاعلات';

  @override
  String get chatMessageRemoveAllReactions => 'إزالة جميع التفاعلات';

  @override
  String get chatMessageDebug => 'تصحيح أخطاء الرسالة';

  @override
  String get chatMessageDebugSheetTitle => 'تصحيح أخطاء الرسالة';

  @override
  String get chatMessageDebugCopyJson => 'نسخ JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'تم نسخ JSON الرسالة إلى الحافظة';

  @override
  String get chatReactionsSheetTitle => 'التفاعلات';

  @override
  String get chatReactionsSheetEmpty => 'لم يتفاعل أحد بهذا الرمز بعد.';

  @override
  String get chatReactionAddFailed => 'فشل إضافة رد الفعل';

  @override
  String get chatReactionRemoveFailed => 'فشل إزالة رد الفعل';

  @override
  String get chatMessageReport => 'الإبلاغ عن الرسالة';

  @override
  String get reportFlowTitleMessage => 'الإبلاغ عن الرسالة';

  @override
  String get reportFlowTitleUserProfile => 'الإبلاغ عن الملف الشخصي';

  @override
  String get reportFlowSummaryTitle => 'راجع بلاغك';

  @override
  String get reportFlowSummarySubtitle =>
      'تأكد من أن هذا يبدو صحيحًا قبل إرساله.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'لا تُبلغ إلا عما تعتقد بصدق أنه يخالف القواعد. إساءة استخدام البلاغات تتعارض مع $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'إرشادات المجتمع';

  @override
  String get reportFlowDisclaimerNoLink =>
      'لا تُبلغ إلا عما تعتقد بصدق أنه يخالف القواعد، ويرجى عدم إرسال البلاغ نفسه مرتين.';

  @override
  String get reportFlowSelectedMessage => 'الرسالة التي تبلغ عنها';

  @override
  String get reportFlowSelectedUser => 'الملف الشخصي الذي تبلّغ عنه';

  @override
  String get reportFlowReportCategory => 'إجاباتك';

  @override
  String get reportFlowSubmit => 'إرسال البلاغ';

  @override
  String get reportFlowBack => 'رجوع';

  @override
  String get reportFlowNext => 'التالي';

  @override
  String get reportFlowDone => 'تم';

  @override
  String get reportFlowThankYouTitle => 'تم إرسال البلاغ';

  @override
  String get reportFlowThankYouNoReportTitle => 'شكرًا لك على الإبلاغ عن هذا';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'سيراجع فريق السلامة في $productName بلاغك. لن نكشف أن البلاغ جاء منك.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'شكرًا لإخبارنا. هذا لا يخالف قواعدنا بمفرده، لذلك لم نرسل بلاغًا. إذا كان يستهدف شخصًا ما أو يستخدم ألفاظًا مهينة، فأبلغ عنه مرة أخرى واختر «محتوى مسيء أو ضار».';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'شكرًا لإخبارنا. هذا لا يخالف قواعدنا بمفرده، لذلك لم نرسل بلاغًا.';

  @override
  String get reportFlowMoreYouCanDo => 'خياراتك';

  @override
  String reportFlowBlockName(String name) {
    return 'حظر $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'يخفي رسائلهم ويمنعهم من إرسال رسائل إليك';

  @override
  String get reportFlowBlockButton => 'حظر';

  @override
  String get reportFlowBlockedButton => 'محظور';

  @override
  String get reportFlowUrgentBanner =>
      'إذا كان شخص ما في خطر وشيك، فاتصل بخدمات الطوارئ المحلية أولًا.';

  @override
  String get reportFlowLoadFailed => 'تعذّر تحميل نموذج البلاغ.';

  @override
  String get reportFlowTryAgain => 'حاول مرة أخرى';

  @override
  String get reportFlowOutdated => 'تغير نموذج البلاغ. يرجى البدء من جديد.';

  @override
  String get reportFlowAlreadyReported => 'لقد أبلغت عن هذه الرسالة بالفعل.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'لقد أبلغت عن هذا الملف الشخصي بالفعل اليوم.';

  @override
  String get reportFlowRateLimited =>
      'ترسل البلاغات بسرعة كبيرة. حاول مرة أخرى لاحقًا.';

  @override
  String get reportFlowSubmitFailed => 'لم يتم إرسال بلاغك. حاول مرة أخرى.';

  @override
  String get reportFlowAccountSetupRequired =>
      'طالب بحسابك وتحقق من بريدك الإلكتروني لإرسال البلاغات.';

  @override
  String get chatMessageSuppressEmbeds => 'إخفاء التضمينات';

  @override
  String get chatMessageUnsuppressEmbeds => 'إظهار التضمينات';

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
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText => 'تعديل النص البديل';

  @override
  String get chatMessageMore => 'المزيد';

  @override
  String get chatEditingMessage => 'جارٍ تعديل الرسالة';

  @override
  String get chatReplyOriginalDeleted => 'تم حذف الرسالة الأصلية';

  @override
  String get chatReplyOriginalFailedToLoad => 'تعذّر تحميل الرسالة الأصلية';

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
      'الرد مخفي لأن صاحب الرسالة الأصلية محظور.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'الرد مخفي لأن صاحب الرسالة الأصلية مصنّف كمرسل رسائل مزعجة.';

  @override
  String get devMarkAsSpamLocally => 'وضع علامة كرسالة مزعجة محليًا';

  @override
  String get devIgnoreSpamFlag => 'تجاهل تصنيف الرسائل المزعجة';

  @override
  String get chatMessagesLoadError => 'تعذر تحميل الرسائل.';

  @override
  String get chatReplyMentionOverrideTitle => 'تجاهل تفضيل الإشارة؟';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'يفضّل $authorNickname أن تتم الإشارة إليه بـ @ في الردود. هل تريد الإرسال دون الإشارة على أي حال؟';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return 'يفضّل $authorNickname الردود دون إشارة @. هل تريد الإرسال مع الإشارة على أي حال؟';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'تجاهل التفضيل';

  @override
  String get chatReplyMentionDisableTooltip =>
      'انقر لإيقاف الإشارة إلى المستخدم الذي ترد عليه.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'انقر لتفعيل الإشارة إلى المستخدم الذي ترد عليه.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'الإشارة إلى المستخدم الذي تم الرد عليه';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'إلغاء الرد';

  @override
  String get chatEditMessageHint => 'تعديل الرسالة';

  @override
  String get chatEditNoChanges => 'لا توجد تغييرات لحفظها';

  @override
  String get chatChannelNotReady =>
      'هذه القناة غير جاهزة بعد. حاول مرة أخرى بعد لحظة.';

  @override
  String get chatMessageEdited => '(معدّلة)';

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
  String get chatImageCouldNotLoad => 'تعذر تحميل هذه الصورة.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'إشعار أصحاب هذا الدور ممن لديهم إذن عرض هذه القناة.';

  @override
  String get composerAutocompleteSuggestions => 'اقتراحات';

  @override
  String get composerAutocompleteCommandsHeading => 'الأوامر';

  @override
  String get composerAutocompleteChoicesHeading => 'الخيارات';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => 'وسيطات اختيارية';

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
  String get composerCommandReasonOption => 'السبب (اختياري).';

  @override
  String get composerCommandMessageOption => 'الرسالة المراد إرسالها.';

  @override
  String get composerCommandQueryOption => 'ما تريد البحث عنه.';

  @override
  String get composerCommandNicknameOption =>
      'اسمك المستعار الجديد، أو اتركه فارغًا لإعادة تعيينه.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'مقدار ما سيُحذف من سجل رسائل العضو الحديثة.';

  @override
  String get composerCommandDeleteMessagesNone => 'عدم حذف أي رسالة';

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
      'أنشئ مجتمعًا جديدًا أو انضم إلى مجتمع موجود.';

  @override
  String get addGuildCreateCommunity => 'إنشاء مجتمع';

  @override
  String get addGuildJoinCommunity => 'الانضمام إلى المجتمع';

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
      'الأيقونات المتحركة غير مدعومة عند إنشاء مجتمع جديد. استخدم صورة ثابتة.';

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
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'إزالة جميع التفاعلات';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'هل أنت متأكد أنك تريد إزالة جميع ردود الفعل من هذه الرسالة؟';

  @override
  String get chatMessagePinConfirm => 'تثبيت';

  @override
  String get chatMessagePinConfirmDescription =>
      'ثبّت هذه الرسالة في القناة ليراها الجميع.';

  @override
  String get chatMessageUnpinConfirmTitle => 'إلغاء تثبيت الرسالة';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'هل تريد إعادة هذه الرسالة المثبتة إلى الماضي؟';

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
  String get channelPinsEmptyDescription => 'تظهر الرسائل المثبتة هنا.';

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
  String get channelDetailsInvitePeople => 'دعوة أشخاص';

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
  String get channelSettingsEditCategory => 'تعديل الفئة';

  @override
  String get channelSettingsTabOverview => 'نظرة عامة';

  @override
  String get channelSettingsTabPermissions => 'الأذونات';

  @override
  String get channelSettingsTabInvites => 'الدعوات';

  @override
  String get channelSettingsTabWebhooks => 'الويب هوك';

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
  String get categoryCopyCategoryId => 'نسخ معرف الفئة';

  @override
  String get categoryIdCopied => 'تم نسخ معرف الفئة';

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
  String get channelSettingsInsertEmoji => 'إدراج رمز تعبيري';

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
  String get channelSettingsConnectionLimit => 'حد الاتصالات';

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
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'تجاوز إعداد مستوى $scopeLevel لهذا القناة. سيتم عرض المحتوى غير اللائق خلف بوابة قبل الدخول.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'موروث';

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
  String get channelSettingsMatureContentCategoryScope => 'الفئة';

  @override
  String get channelSettingsMatureContentCommunityScope => 'المجتمع';

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
      'البحث في الأذونات…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'تم تحديث الوصول إلى القناة';

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
  String get channelSettingsDeleteInvite => 'حذف الدعوة';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'هل تريد حذف هذه الدعوة؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get channelSettingsCopyInviteCode => 'نسخ رمز الدعوة';

  @override
  String get channelSettingsCopyInviteUrl => 'نسخ رابط الدعوة';

  @override
  String get channelSettingsWebhookCreated => 'تم إنشاء الويب هوك';

  @override
  String get channelSettingsWebhookCreateFailed => 'تعذّر إنشاء الويب هوك';

  @override
  String get channelSettingsCreateWebhook => 'إنشاء ويب هوك';

  @override
  String get channelSettingsInvitesDescription =>
      'إدارة روابط الدعوة لهذه القناة.';

  @override
  String get channelSettingsInvitesCreate => 'إنشاء دعوة';

  @override
  String get channelSettingsInvitesEmpty => 'لا توجد روابط دعوة';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'لا تحتوي هذه القناة على أي روابط دعوة بعد. أنشئ رابطًا لدعوة الأشخاص إلى هذه القناة.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'حدث خطأ أثناء تحميل روابط الدعوة لهذه القناة. حاول مرة أخرى.';

  @override
  String get channelSettingsWebhooksDescription =>
      'إدارة الويب هوك الواردة التي يمكنها نشر الرسائل في هذه القناة.';

  @override
  String get channelSettingsWebhooksEmpty => 'لا يوجد أي ويب هوك';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'لم يتم إعداد أي ويب هوك لهذه القناة. أنشئ ويب هوك للسماح للتطبيقات الخارجية بنشر الرسائل.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'هذه القناة لا تدعم الويب هوك.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'تحتاج إلى صلاحية \"$permission\" لعرض وتعديل خطافات الويب لهذه القناة.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => 'تعذّر تحميل الويب هوك';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'حدث خطأ أثناء تحميل الويب هوك لهذه القناة. حاول مرة أخرى.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'تم الإنشاء بواسطة $creator في $date';
  }

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
  String get channelSettingsWebhooksDelete => 'حذف الويب هوك';

  @override
  String get channelSettingsWebhooksDeleteFailed => 'تعذّر حذف هذا الويب هوك';

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
  String get channelDetailsTabPins => 'الرسائل المثبتة';

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
  String get channelHeaderPinnedMessages => 'الرسائل المثبتة';

  @override
  String get channelHeaderPinnedMessagesUnread => 'رسائل مثبتة، غير مقروءة';

  @override
  String get channelHeaderMemberList => 'قائمة الأعضاء';

  @override
  String get channelHeaderInbox => 'صندوق الوارد';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'إعدادات الإشعارات، مكتوم';

  @override
  String get channelDetailsSearchTitle => 'بحث';

  @override
  String get channelDetailsSearchHint => 'البحث في الرسائل';

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
  String get channelDetailsSearchAuthorTypeWebhook => 'ويب هوك';

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
  String get channelHeaderSearchFilterDescBefore => 'تاريخ أو نطاق تواريخ';

  @override
  String get channelHeaderSearchFilterDescOn => 'تاريخ أو نطاق تواريخ';

  @override
  String get channelHeaderSearchFilterDescDuring => 'تاريخ أو نطاق تواريخ';

  @override
  String get channelHeaderSearchFilterDescAfter => 'تاريخ أو نطاق تواريخ';

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
  String get channelDetailsSearchScopeCurrentDm => 'الرسالة المباشرة الحالية';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'كل المجتمعات';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'كل الرسائل المباشرة فقط';

  @override
  String get channelDetailsSearchScopeAllDms => 'كل الرسائل المباشرة';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'الرسائل المباشرة المفتوحة فقط';

  @override
  String get channelDetailsSearchScopeOpenDms => 'الرسائل المباشرة المفتوحة';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'كل الرسائل المباشرة + المجتمعات';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'الرسائل المباشرة المفتوحة + المجتمعات';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'البحث في المجتمع الحالي فقط';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'البحث في الرسالة المباشرة الحالية فقط';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'عبر جميع المجتمعات التي تتواجد فيها حاليًا';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'في كل الرسائل المباشرة التي شاركت فيها فقط';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'في كل الرسائل المباشرة التي شاركت فيها';

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
  String get channelDetailsSearchContentVideo => 'فيديو مرفوع';

  @override
  String get channelDetailsSearchContentAudio => 'تحميل ملف صوتي';

  @override
  String get channelDetailsSearchContentFile => 'تحميل ملف';

  @override
  String get channelDetailsSearchContentLink => 'رابط';

  @override
  String get channelDetailsSearchContentEmbed => 'معاينة رابط أو محتوى مضمَّن';

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
      'ملفات الصوت التي تم تحميلها فقط';

  @override
  String get channelDetailsSearchContentFileDescription => 'أي مرفق تم تحميله';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'عنوان URL مكتوب في نص الرسالة';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'معاينات الروابط والتضمينات الغنية، وليس الملفات المرفوعة';

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
      'الأيقونات المتحركة غير مدعومة. استخدم صورة ثابتة.';

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
  String get groupDmInviteExpires24Hours => 'تنتهي صلاحية دعوتك خلال 24 ساعة';

  @override
  String get groupDmAddFriendFailed =>
      'تعذر إضافة هذا الصديق إلى المجموعة. الرجاء المحاولة مرة أخرى.';

  @override
  String get groupDmGroupFull =>
      'هذه المجموعة ممتلئة. أزل شخصًا قبل إضافة المزيد من الأشخاص.';

  @override
  String get groupDmRateLimited =>
      'أنت تفعل ذلك بسرعة كبيرة. انتظر لحظة وحاول مرة أخرى.';

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
  String get groupDmInviteRevoked => 'تم إلغاء الدعوة';

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
    return 'أرسل رسالة إلى #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'أرسل رسالة إلى @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'أرسل رسالة إلى $groupName';
  }

  @override
  String get groupDmComposerHint => 'مجموعة رسائل';

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
  String get purgePersonalNotesAlreadyEmpty => 'الملاحظات الشخصية فارغة بالفعل';

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
  String get userSettingsNavGiftsAndCodes => 'الهدايا';

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
  String get giftSettingsLoadFailedTitle => 'تعذّر تحميل مخزون الهدايا';

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
  String get giftSettingsAlreadyRedeemed => 'تم استرداد هذه الهدية';

  @override
  String get giftSettingsRedeemForYourself => 'استرداد لنفسك';

  @override
  String get giftSettingsShareWithFriend => 'مشاركة مع صديق';

  @override
  String get premiumPlutoniumTagline =>
      'احصل على حدود أعلى وميزات حصرية مع دعم منصة تواصل مستقلة.';

  @override
  String get premiumPurchaseMode => 'وضع الشراء';

  @override
  String get premiumForMe => 'لنفسي';

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
  String get premiumManageSubscription => 'إدارة الاشتراك';

  @override
  String get premiumRedeemGiftCode => 'استرداد رمز الهدية';

  @override
  String get premiumGiftBadge => 'هدية';

  @override
  String get premiumCancelSubscriptionTitle => 'هل تريد إلغاء الاشتراك؟';

  @override
  String get premiumCancelSubscriptionBody =>
      'ستحتفظ بمزاياك حتى تاريخ التجديد التالي، ثم تحصل على فترة سماح مدتها 3 أيام لإعادة الاشتراك والاحتفاظ بسجل اشتراكك.';

  @override
  String get premiumCancelSubscriptionConfirm => 'إلغاء الاشتراك';

  @override
  String get premiumPurchaseHistoryTitle => 'سجل الشراء';

  @override
  String get premiumPurchaseHistoryDescription =>
      'فواتيرك الأخيرة. لتغيير طريقة الدفع لاشتراكك، أضف واحدة أو اخترها في بوابة الفوترة واجعلها الافتراضية.';

  @override
  String get premiumManagePaymentMethods => 'إدارة طرق الدفع';

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
  String get premiumSubscriptionCanceling => 'سيتم الإلغاء';

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
  String get premiumGiftGraceEnded =>
      'انتهت فترة هديتك. اشترك للاحتفاظ بـ Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'سيتم محاسبتك الآن. تتم إضافة وقت هديتك المتبقي بعد فترة الدفع الخاصة بك، لذلك لن يُفقد أي منها.';

  @override
  String get premiumComparisonFeatureColumn => 'الميزة';

  @override
  String get premiumDisclaimerRefund =>
      'يمكنك استرداد أموالك بنفسك خلال 3 أيام من الدفع، مرة واحدة كل 30 يومًا. استرداد قيمة الاشتراك يلغيه. يتنازل المشترون في الاتحاد الأوروبي/المنطقة الاقتصادية الأوروبية عن حق الانسحاب خلال 14 يومًا عند إتمام الشراء، للوصول إلى المحتوى فورًا. استخدم زر الاسترداد داخل التطبيق بدلًا من طلب رد المبلغ عبر البنك. قد تؤدي طلبات رد المبالغ عبر البنك إلى تقييد حسابك نهائيًا. تتولى Stripe معالجة الدفع بأمان. لا نرى رقم بطاقتك كاملًا أبدًا.';

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
  String get premiumPlanUnavailable => 'هذه الخطة غير متاحة. اتصل بالدعم.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'هذه الخطة غير متاحة. اتصل بمسؤولي هذا المثيل.';

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
  String get premiumAlreadyVisionaryTitle => 'أنت من فئة Visionary بالفعل';

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
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'تم تعطيل عمليات الشراء لهذا الحساب. اتصل بـ $supportEmail إذا بدا هذا الأمر خاطئًا.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'تم تعطيل عمليات الشراء لهذا الحساب. اتصل بمسؤولي هذا المثيل إذا بدا هذا الأمر خاطئًا.';

  @override
  String get premiumClaimAccountToPurchase =>
      'احصل على حسابك لشراء Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'تحتاج إلى التحقق من بريدك الإلكتروني قبل أن تتمكن من شراء Fluxer Plutonium.';

  @override
  String get premiumPerkCommunities => 'المجتمعات';

  @override
  String get premiumPerkMessageCharacterLimit => 'الحد الأقصى لأحرف الرسالة';

  @override
  String get premiumPerkBookmarkedMessages => 'الرسائل ذات الإشارات المرجعية';

  @override
  String get premiumPerkFileUploadSize => 'حجم تحميل الملف';

  @override
  String get premiumPerkUseAnimatedEmojis =>
      'استخدام الرموز التعبيرية المتحركة';

  @override
  String get premiumPerkVideoQuality => 'جودة الفيديو';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'صور رمزية ولافتات ملف شخصي متحركة';

  @override
  String get premiumPerkEarlyAccess => 'وصول مبكر للميزات الجديدة';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'حتى 4K/60 إطارًا في الثانية';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly أو $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/شهر';

  @override
  String get storePlutoniumYearSuffix => '/سنة';

  @override
  String get storePlutoniumPriceOr => 'أو';

  @override
  String get storePlutoniumEmojiTitle => 'رموزك التعبيرية، في كل مكان';

  @override
  String get storePlutoniumEmojiBody =>
      'أضف رموزًا تعبيرية وملصقات مخصصة من أي من مجتمعاتك إلى كل محادثة ومجتمع تتواجد فيه.';

  @override
  String get storePlutoniumProfileTitle => 'ملف شخصي مميز';

  @override
  String get storePlutoniumProfileBody =>
      'احصل على صورة رمزية ولافتة متحركتين، وشارة مشترك، والعلامة المكونة من أربعة أرقام التي تريدها بعد اسم المستخدم الخاص بك*، وملف شخصي منفصل لكل مجتمع.';

  @override
  String get storePlutoniumFilesTitle =>
      'إرسال ملفات بحجم يصل إلى 500 ميجابايت';

  @override
  String get storePlutoniumFilesBody =>
      'شارك مقاطع الفيديو كاملة الطول والملفات الكبيرة دون تصغيرها أولاً. يمكن للحسابات المجانية إرسال ما يصل إلى 25 ميجابايت.';

  @override
  String get storePlutoniumCompareTitle => 'قارن بين المجاني وPlutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'ليست كل هذه الميزات متوفرة في تطبيق الجوال. بعضها متوفر فقط على سطح المكتب.';

  @override
  String get storePlutoniumNotAvailable => 'غير متاح';

  @override
  String get storePlutoniumAvailable => 'متاح';

  @override
  String get storePlutoniumCompareTag =>
      'اختر الرقم المكون من 4 أرقام بعد اسم المستخدم الخاص بك*';

  @override
  String get storePlutoniumCompareProfile => 'ملف شخصي منفصل لكل مجتمع';

  @override
  String get storePlutoniumCompareBadge => 'شارة المشترك في ملفك الشخصي';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'خلفيات مكالمات الفيديو التي يمكنك حفظها';

  @override
  String get storePlutoniumCompareCommunities =>
      'المجتمعات التي يمكنك الانضمام إليها';

  @override
  String get storePlutoniumCompareCharacters => 'الأحرف في رسالة واحدة';

  @override
  String get storePlutoniumCompareBookmarks => 'الرسائل التي يمكنك تمييزها';

  @override
  String get storePlutoniumCompareUpload => 'أكبر ملف يمكنك تحميله';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'عناصر الوسائط التي يمكنك حفظها لوقت لاحق';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'استخدم الرموز التعبيرية المتحركة في الرسائل';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'استخدم الرموز التعبيرية والملصقات المخصصة في أي مجتمع';

  @override
  String get storePlutoniumCompareVideo =>
      'جودة مكالمات الفيديو ومشاركة الشاشة';

  @override
  String get storePlutoniumCompareAvatar => 'صورة رمزية متحركة ولافتة ملف شخصي';

  @override
  String get storePlutoniumCompareEarlyAccess => 'وصول مبكر للميزات الجديدة';

  @override
  String get storePlutoniumCompareThemes => 'سمات مخصصة للتطبيق';

  @override
  String get storePlutoniumVideoFree => 'حتى 720p بمعدل 30 إطارًا في الثانية';

  @override
  String get storePlutoniumVideoPlutonium =>
      'حتى 4K بمعدل 60 إطارًا في الثانية';

  @override
  String get storePlutoniumTagFootnote =>
      'يمكنك اختيار علامة لا يمتلكها أي شخص آخر بنفس اسم المستخدم. أسماء المستخدمين لا تميز بين الأحرف الكبيرة والصغيرة، لذا فإن Mina#4821 وmina#4821 يعتبران متطابقين. العلامة #0000 محجوزة لأعضاء Fluxer Visionary.';

  @override
  String get storePlutoniumLearnVisionary => 'تعرّف على المزيد حول Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'هل تريد فقط دعم تطوير Fluxer مفتوح المصدر؟ ';

  @override
  String get storePlutoniumDonateLink => 'تبرّع بدلاً من ذلك.';

  @override
  String get storePlutoniumHighlightsLead =>
      'يساهم الاشتراك في تمويل Fluxer ويفتح لك';

  @override
  String get storePlutoniumHighlightEmoji =>
      'رموز تعبيرية وملصقات مخصصة في أي محادثة';

  @override
  String get storePlutoniumHighlightProfile =>
      'ملف شخصي متحرك، وشارة، ورقم مخصص مكون من 4 أرقام';

  @override
  String get storePlutoniumHighlightFiles => 'تحميلات تصل إلى 500 ميجابايت';

  @override
  String get storePlutoniumHighlightMessages =>
      'إرسال رسائل يصل عدد أحرفها إلى 4,000 حرف';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'ملف شخصي منفصل لكل مجتمع';

  @override
  String get storePlutoniumHighlightsMore => 'والمزيد';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'يُجدّد تلقائيًا عبر Google Play حتى تقوم بالإلغاء.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'يتجدد تلقائيًا عبر App Store حتى تقوم بالإلغاء.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'لديك بالفعل اشتراك في Fluxer Plutonium.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'وفر $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'تم استلام عملية الشراء. سيظهر Plutonium هنا بمجرد تفعيله.';

  @override
  String get storePlutoniumUnavailable =>
      'الاشتراكات داخل التطبيق غير متاحة على هذا الجهاز بعد.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'يتضمن Visionary بالفعل وصولاً دائمًا، لذا لا يلزم وجود اشتراك متكرر.';

  @override
  String get userSettingsNavPrivacyDashboard => 'لوحة تحكم الخصوصية';

  @override
  String get userSettingsNavAuthorizedApps => 'التطبيقات المصرّح بها';

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
  String get userSettingsNavChat => 'الدردشة';

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
      'مُوصى به. ينقّي صوت الميكروفون ليكون الكلام واضحًا.';

  @override
  String get audioAndVideoDirectInputLabel => 'إدخال مباشر';

  @override
  String get audioAndVideoDirectInputDescription =>
      'يرسل صوتك دون أي تعديل. مناسب إذا كنت تستخدم برامج صوت خارجية.';

  @override
  String get audioAndVideoCustomProfileLabel => 'مخصص';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'اضبط كل إعداد بنفسك: إزالة الضوضاء، وإلغاء الصدى، والكسب.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'إزالة الضوضاء';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'محسّن';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'عادي';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'لا شيء';

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
  String get audioAndVideoInstanceVideoQualityLimit =>
      'تسمح هذه النسخة حاليًا بمشاركة الشاشة بدقة تصل إلى 720 بكسل بمعدل 30 إطارًا في الثانية.';

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
  String get notificationsPushInactiveTimeoutLabel =>
      'مهلة عدم النشاط لإشعارات الدفع';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return 'يتجنب $productName إرسال إشعارات الدفع إلى أجهزتك المحمولة عندما تكون أمام الكمبيوتر. اختر مدة عدم النشاط على سطح المكتب قبل أن تبدأ إشعارات الدفع بالوصول إليك.';
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
      'تفضيل الإشارة في الردود';

  @override
  String get notificationsMentionNoPreferenceName => 'بلا تفضيل';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'احترام نية المرسل، بدون تحذير عند تبديل إشارة @';

  @override
  String get notificationsMentionPreferMentionName => 'تفضيل الإشارة بـ @';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'جعل الردود تشير إليك افتراضيًا، وتنبيه المُرسِل إذا عطّل الإشارة';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'تفضيل عدم الإشارة بـ @';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'جعل الردود بلا إشارة افتراضيًا، وتنبيه المُرسِل إذا فعّل الإشارة';

  @override
  String get notificationsTtsSectionTitle => 'إشعارات تحويل النص إلى كلام';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'تفعيل تشغيل رسائل /tts صوتيًا';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'السماح للأمر /tts بقراءة رسالتك بصوت عالٍ. عند تعطيل هذا الإعداد تبقى هذه الأوامر نصًا عاديًا.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix => 'اضبط سرعة التشغيل في ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'إمكانية الوصول';

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
      'يقرأ كل رسالة واردة بصوت عالٍ، بغض النظر عن القناة المفتوحة.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'القناة النشطة فقط';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'يقرأ رسائل القناة التي تشاهدها فقط. تنتقل القراءة معك بين القنوات.';

  @override
  String get notificationsTtsModeNeverName => 'عدم القراءة تلقائيًا';

  @override
  String get notificationsTtsModeNeverDescription =>
      'يبقى صامتًا ما لم يستخدم أحدهم الأمر /tts يدويًا.';

  @override
  String get notificationsTtsModeAriaLabel => 'نطق جميع الرسائل بصوت عالٍ';

  @override
  String get notificationsSoundsSectionTitle => 'الأصوات';

  @override
  String get notificationsMasterVolumeLabel => 'مستوى الصوت الرئيسي';

  @override
  String get notificationsMasterVolumeDescription =>
      'يضبط مستوى صوت كل المؤثرات الصوتية. الإعدادات المخصصة لكل صوت لا تتأثر بهذا.';

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
      'إظهار عدد أقل من المؤثرات الصوتية';

  @override
  String get notificationsPreviewSound => 'معاينة الصوت';

  @override
  String get notificationsPerSoundVolumeTitle => 'مستوى الصوت لكل صوت';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'عيّن مستوى صوت مخصصًا لكل صوت على حدة. الأصوات التي ليس لها مستوى مخصص تتبع مستوى الصوت الرئيسي.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'تجاوزات مستوى الصوت المخصصة النشطة: $overrideCount.';
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
  String get notificationsSoundDeaf => 'تعطيل السمع';

  @override
  String get notificationsSoundUndeaf => 'إلغاء تعطيل السمع';

  @override
  String get notificationsSoundUserJoin => 'انضمام مستخدم إلى القناة';

  @override
  String get notificationsSoundUserLeave => 'مغادرة مستخدم للقناة';

  @override
  String get notificationsSoundUserMove => 'نقل المستخدم القناة';

  @override
  String get notificationsSoundViewerJoin => 'انضمام مشاهد إلى البث';

  @override
  String get notificationsSoundViewerLeave => 'مغادرة مشاهد للبث';

  @override
  String get notificationsSoundVoiceDisconnect => 'تم قطع الاتصال الصوتي';

  @override
  String get notificationsSoundIncomingRing => 'مكالمة واردة';

  @override
  String get notificationsSoundCameraOn => 'تشغيل الكاميرا';

  @override
  String get notificationsSoundCameraOff => 'إيقاف الكاميرا';

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
  String get notificationsPushRelaySectionTitle => 'مُرحِّل الإشعارات الفورية';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return 'لا يوصّل $pushProvider الإشعارات الفورية إلا عبر خدمته الخاصة، لذلك تمر إشعارات هذا الجهاز عبر مُرحِّل Fluxer.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'استخدام مُرحِّل Fluxer للإشعارات';

  @override
  String get notificationsPushRelayConsentDescription =>
      'إيقاف هذا الخيار يزيل تسجيل الإشعارات لهذا الجهاز، فيتوقف عن تلقي الإشعارات الفورية.';

  @override
  String get pushRelayConsentTitle => 'مُرحِّل الإشعارات الفورية';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return 'لا يوصّل $pushProvider الإشعارات الفورية إلا عبر خدمته الخاصة، لذلك تمر إشعارات هذا الجهاز عبر مُرحِّل Fluxer.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'وافق على ';

  @override
  String get pushRelayConsentNoticeLink => 'إشعار خصوصية مُرحِّل الإشعارات';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' لتفعيل الإشعارات الفورية على هذا الجهاز. تكفي الموافقة مرة واحدة لكل جهاز.';

  @override
  String get pushRelayConsentAgree => 'الموافقة والمتابعة';

  @override
  String get pushRelayConsentDecline => 'ليس الآن';

  @override
  String get userSettingsNavLanguageAndTime => 'اللغة والوقت';

  @override
  String get languageAndTimeLanguageSectionTitle => 'لغة الواجهة';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'اختر اللغة المستخدمة في التطبيق بأكمله';

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
  String get languageAndTimeTimeFormat12Hour => 'نظام 12 ساعة';

  @override
  String get languageAndTimeTimeFormat24Hour => 'نظام 24 ساعة';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'تنسيق الوقت حسب لغة التطبيق: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'الإعدادات الإقليمية للنظام: $format';
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
  String get userSettingsNavAppIcon => 'أيقونة التطبيق';

  @override
  String get appIconSectionTitle => 'أيقونة التطبيق';

  @override
  String get appIconSectionDescription =>
      'اختر الأيقونة التي تظهر على شاشتك الرئيسية.';

  @override
  String get appIconOptionDefault => 'افتراضي';

  @override
  String get appIconOptionStarfield => 'حقل النجوم';

  @override
  String get appIconOptionSweden => 'السويد';

  @override
  String get appIconOptionGreyscale => 'Greyscale';

  @override
  String get appIconOptionRainbow => 'Rainbow';

  @override
  String get appIconOptionWaves => 'Waves';

  @override
  String get appIconOptionChromaticAberration => 'Chromatic aberration';

  @override
  String get appIconOptionDefaultBrutalist => 'Brutalist';

  @override
  String get appIconOptionGreyscaleBrutalist => 'Greyscale brutalist';

  @override
  String get appIconUnsupported =>
      'تغيير أيقونة التطبيق غير متاح على هذا الجهاز.';

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
  String get advancedSettingsCategoryAccessibility => 'إمكانية الوصول';

  @override
  String get advancedSettingsCategoryChat => 'الدردشة';

  @override
  String get advancedSettingsCategoryMedia => 'الوسائط';

  @override
  String get advancedSettingsCategoryVoice => 'صوت';

  @override
  String get advancedSettingsCategoryDeveloper => 'مطور';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'تفعيل تحديد النص';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'السماح بتحديد النص في التطبيق';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'تفعيل الصور المصغّرة عند التنقل في الفيديو';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'صورة مصغرة أو إطار مباشر عند السحب على شريط تقدم الفيديو';

  @override
  String get advancedSettingHapticFeedbackLabel => 'الاهتزاز';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'اهتزاز للتنبيه عند النقر والإجراءات. لن تتم مزامنته عبر الأجهزة.';

  @override
  String get advancedSettingShowNekoLabel => 'إظهار Neko';

  @override
  String get advancedSettingShowNekoDescription => 'قط نيكو يطارد مؤشر الفأرة';

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
      'إظهار اختصارات لوحة المفاتيح في التلميحات';

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
      'التأكيد أو النقر المزدوج للانضمام إلى القنوات الصوتية في المجتمعات';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'اشتراط النقر المزدوج للانضمام إلى القنوات الصوتية';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'التأكيد قبل الانضمام إلى القنوات الصوتية';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'إرسال صور GIF تلقائيًا عند تحديدها';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'إرسال صور GIF تلقائيًا من منتقي صور GIF بدون تأكيد';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'حفظ صور GIF المفضلة كوسائط محفوظة';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'اختر طريقة تخزين صور GIF المفضلة المميزة بنجمة';

  @override
  String get advancedSettingMediaButtonsLabel => 'أزرار الوسائط';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'تخصيص الأزرار والمؤشرات التي تظهر على مرفقات الوسائط والتضمينات';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'تحميل المرفقات قبل الإرسال';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'بدء تحميل المرفقات بمجرد إضافتها إلى حقل إدخال الرسالة';

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
      'مزوّدو البحث العكسي عن الصور';

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
      'تخطي تأكيد «وضع علامة على الكل كمقروء»';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'وضع علامة على كل قنوات صندوق الوارد غير المقروءة كمقروءة فورًا دون طلب تأكيد';

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
      'إظهار زر «إخفاء التضمينات»';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'إظهار شريط إجراءات الرسالة';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'إظهار زر المزيد فقط';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'إظهار التفاعلات السريعة';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'تفعيل التوسيع بمفتاح Shift';

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
      'إظهار تنبيهات الأجهزة الجديدة';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'السؤال عند توصيل أجهزة صوت جديدة';

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
      'سلوك المعاينة والنافذة المنفصلة والصورة المصغرة للبث';

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
      'فعّل محرك بحث واحدًا على الأقل أدناه.';

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
      'فعّل مترجمًا واحدًا على الأقل أدناه.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'إزالة المترجم';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'البحث العكسي الافتراضي عن الصور';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'اختر خدمة البحث العكسي عن الصور التي تُستخدم افتراضيًا عند البحث عن صورة.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'البحث العكسي عن الصور المضمّن';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'تفعيل أو تعطيل مزوّدي البحث العكسي عن الصور المدمجين. يظهر المزوّدون المفعّلون في قائمة السياق للصور والصور الرمزية واللافتات والملصقات والرموز التعبيرية.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'البحث العكسي المخصص عن الصور';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'أضف مزودي بحث الصور العكسية الخاصين بك بنمط عنوان URL مخصص. استخدم \"$url\" كعنصر نائب لرابط الصورة.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'إضافة بحث عكسي بالصور';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'فعّل مزودًا واحدًا على الأقل للبحث العكسي عن الصور أدناه.';

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
      'إضافة محرك بحث عكسي بالصور';

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
  String get userSettingsLogOutConfirmTitle => 'تسجيل الخروج؟';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'يمكنك تسجيل الدخول مرة أخرى في أي وقت.';

  @override
  String get quickSwitcherTabSearch => 'بحث';

  @override
  String get quickSwitcherTabFriends => 'الأصدقاء';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'البحث عن قنوات أو أشخاص أو مجتمعات';

  @override
  String get quickSwitcherSearchFriends => 'البحث في الأصدقاء';

  @override
  String get quickSwitcherNoMatchesFound => 'لم يتم العثور على نتائج مطابقة';

  @override
  String get quickSwitcherEmptyHint =>
      'جرّب اسمًا مختلفًا أو استخدم البادئات @ / # / ! / * لتصفية النتائج.';

  @override
  String get quickSwitcherSectionPeople => 'الأشخاص';

  @override
  String get quickSwitcherSectionGroupMessages => 'رسائل جماعية';

  @override
  String get quickSwitcherSectionTextChannels => 'القنوات النصية';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'القنوات الصوتية';

  @override
  String get quickSwitcherSectionCommunities => 'المجتمعات';

  @override
  String get quickSwitcherSectionSettings => 'الإعدادات';

  @override
  String get quickSwitcherHomeLabel => 'الرئيسية';

  @override
  String get quickSwitcherDirectMessagesLabel => 'الرسائل المباشرة';

  @override
  String get quickSwitcherFavoritesLabel => 'المفضلة';

  @override
  String get quickSwitcherUserSettingsLabel => 'إعدادات المستخدم';

  @override
  String get quickSwitcherNotificationsLabel => 'الإشعارات';

  @override
  String get quickSwitcherBookmarksLabel => 'الإشارات المرجعية';

  @override
  String get savedMessagesEmptyTitle => 'لا توجد إشارات مرجعية';

  @override
  String get savedMessagesEmptyBody =>
      'ضع إشارة مرجعية على الرسائل لحفظها للرجوع إليها لاحقًا.';

  @override
  String get savedMessagesEndBody => 'لا يوجد المزيد لرؤيته هنا.';

  @override
  String get savedMessagesRemoveTooltip => 'إزالة الإشارة المرجعية';

  @override
  String get savedMessagesAddedToast => 'أُضيف إلى الإشارات المرجعية';

  @override
  String get savedMessagesRemovedToast => 'أُزيل من الإشارات المرجعية';

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
  String get quickSwitcherSearchAliasUser => 'المستخدم';

  @override
  String get quickSwitcherSearchAliasYou => 'أنت';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'رسائل مباشرة';

  @override
  String get quickSwitcherSearchAliasMessages => 'الرسائل';

  @override
  String get quickSwitcherSearchAliasFav => 'مفضل';

  @override
  String get quickSwitcherSearchAliasStarred => 'مميز بنجمة';

  @override
  String get quickSwitcherSearchAliasInbox => 'صندوق الوارد';

  @override
  String get quickSwitcherSearchAliasSaved => 'محفوظة';

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
  String get mentionConfirmButton => 'إشارة';

  @override
  String get composerEmojiUnavailable =>
      'لا يمكنك استخدام هذا الرمز التعبيري هنا.';

  @override
  String get instanceUrlLabel => 'عنوان URL للمثيل';

  @override
  String get instanceUrlPlaceholder => 'أدخل عنوان URL للمثيل (مثل fluxer.app)';

  @override
  String get instanceUrlHelper =>
      'استخدم fluxer.app للمثيل الرسمي، أو عنوان URL الدقيق لمثيل مستضاف ذاتيًا.';

  @override
  String get resetToDefaultInstance => 'إعادة الضبط إلى Fluxer';

  @override
  String get instanceConnect => 'اتصال';

  @override
  String get instanceConnecting => 'جارٍ الاتصال…';

  @override
  String get instanceConnectFailed => 'فشل الاتصال بالخادم';

  @override
  String get instanceInvalidDiscoveryResponse =>
      'This client cannot connect to this instance. The instance is likely out of date. If the instance is up to date, try updating this app.';

  @override
  String get recentInstances => 'الخوادم الأخيرة';

  @override
  String removeRecentInstance(String domain) {
    return 'إزالة $domain من الخوادم الأخيرة';
  }

  @override
  String get instanceSheetTitle => 'الاتصال بخادم';

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
  String get discoverySearchCommunities => 'البحث عن مجتمعات';

  @override
  String get discoveryFilterByLanguage => 'تصفية حسب اللغة';

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
  String get discoveryCategoryScienceAndTechnology => 'العلوم والتكنولوجيا';

  @override
  String get discoveryCategoryContentCreator => 'صانع محتوى';

  @override
  String get discoveryCategoryAnimeAndManga => 'أنمي ومانغا';

  @override
  String get discoveryCategoryMoviesAndTv => 'أفلام وتلفزيون';

  @override
  String get discoveryCategoryOther => 'أخرى';

  @override
  String get discoveryNoCommunitiesMatch => 'لا توجد مجتمعات مطابقة.';

  @override
  String get discoveryJoinCommunity => 'الانضمام إلى المجتمع';

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
  String get discoveryJoinErrorGenericTitle => 'تعذّر الانضمام إلى هذا المجتمع';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'حدث خطأ ما. يرجى المحاولة مرة أخرى بعد قليل.';

  @override
  String get discoveryJoinErrorFullTitle => 'هذا المجتمع ممتلئ';

  @override
  String get discoveryJoinErrorFullMessage =>
      'لقد وصل هذا المجتمع إلى الحد الأقصى لعدد الأعضاء، لذا لا يمكنك الانضمام الآن.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'لقد وصلت إلى الحد الأقصى من المجتمعات';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'لقد بلغت الحد الأقصى لعدد المجتمعات. غادر أحدها وحاول مرة أخرى.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'لا يمكنك الانضمام إلى هذا المجتمع';

  @override
  String get discoveryJoinErrorBannedMessage => 'لقد تم حظرك من هذا المجتمع.';

  @override
  String get discoveryJoinErrorNotAvailableTitle => 'هذا المجتمع لم يعد متاحًا';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'ربما خرج هذا المجتمع من الاكتشاف أو أوقف انضمام أعضاء جدد. حدّث الصفحة ولن يظهر لك مرة أخرى.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'أنت تفعل ذلك بسرعة كبيرة';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'الرجاء الانتظار لحظة والمحاولة مرة أخرى.';

  @override
  String get guildNavbarAddCommunity => 'إضافة مجتمع';

  @override
  String get guildNavbarHelp => 'مساعدة';

  @override
  String get scrollIndicatorNew => 'جديد';

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
  String get navigationItemMuted => 'مكتوم';

  @override
  String get authShowPassword => 'عرض كلمة المرور';

  @override
  String get authHidePassword => 'إخفاء كلمة المرور';

  @override
  String get authCheckStillWorking => 'لا يزال قيد المعالجة…';

  @override
  String get authVerificationFailed => 'تعذر إكمال التحقق. حاول مرة أخرى.';

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
  String get friendsOpenInbox => 'صندوق الوارد';

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
  String get guildFolderIconStar => 'نجمة';

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
  String get guildFolderMarkAsRead => 'وضع علامة على المجلد كمقروء';

  @override
  String get guildBulkMuteCommunities => 'كتم المجتمعات';

  @override
  String get guildBulkUnmuteCommunities => 'إلغاء كتم المجتمعات';

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
  String get guildBulkEnableMobilePush => 'تفعيل إشعارات الدفع على الجوال';

  @override
  String get guildBulkDisableMobilePush => 'تعطيل إشعارات الدفع على الجوال';

  @override
  String get guildBulkAllowDirectMessages => 'السماح بالرسائل المباشرة';

  @override
  String get guildBulkBlockDirectMessages => 'حظر الرسائل المباشرة';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'السماح بالرسائل المباشرة من البوتات';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'حظر الرسائل المباشرة من البوتات';

  @override
  String get guildNavbarGroupDm => 'محادثة جماعية';

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
  String get guildNavbarPrivateChannel => 'Private channel';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Only selected members and roles will be able to view this channel.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Add members or roles';

  @override
  String get guildNavbarAddMembersOrRolesHint => 'Search members or roles';

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
  String get guildNavbarSearchFriends => 'البحث في الأصدقاء';

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
  String get guildNavbarInviteNeverExpires =>
      'رابط الدعوة هذا لا تنتهي صلاحيته أبدًا.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'ينتهي رابط دعوتك خلال $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'تعديل رابط الدعوة';

  @override
  String get guildNavbarInviteLinkSettings => 'إعدادات رابط الدعوة';

  @override
  String get guildNavbarExpireAfter => 'تنتهي الصلاحية بعد';

  @override
  String get guildNavbarMaxUses => 'الحد الأقصى لعدد مرات الاستخدام';

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
  String get guildNavbarDeleteMyMessagesTitle =>
      'هل تريد حذف رسائلك في هذا المجتمع؟';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'حذف نهائي لكل رسالة أرسلتها هنا، عبر كل القنوات. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'حذف رسائلي';

  @override
  String get guildNavbarDeletedYourMessages => 'تم حذف رسائلك';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => 'تعذّر حذف رسائلك';

  @override
  String get guildNavbarRemoveOverride => 'إزالة التجاوز';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'كتم حتى $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'متاح لموظفي $productName فقط';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'تم إيقاف الدعوات مؤقتًا في هذا المجتمع';

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
  String get guildNavbarNever => 'أبدًا';

  @override
  String get guildNavbarNoLimit => 'بلا حدود';

  @override
  String get guildNavbarOneUse => 'استخدام واحد';

  @override
  String guildNavbarUses(int count) {
    return '$count استخدام';
  }

  @override
  String get guildMenuMarkAsRead => 'وضع علامة كمقروءة';

  @override
  String get guildPeekMoreOptions => 'المزيد من الخيارات';

  @override
  String get guildMenuInviteMembers => 'دعوة أعضاء';

  @override
  String get guildMenuCommunitySettings => 'إعدادات المجتمع';

  @override
  String get guildMenuEditCommunityProfile => 'تعديل الملف الشخصي في المجتمع';

  @override
  String get guildMenuUnmuteCommunity => 'إلغاء كتم المجتمع';

  @override
  String get guildMenuMuteCommunity => 'كتم المجتمع';

  @override
  String get guildMenuHideMutedChannels => 'إخفاء القنوات المكتومة';

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
  String get guildMenuSettingsEmoji => 'الرموز التعبيرية';

  @override
  String get guildMenuSettingsStickers => 'الملصقات';

  @override
  String get guildMenuSettingsSafetyModeration => 'السلامة والإشراف';

  @override
  String get guildMenuSettingsActivityLog => 'سجل النشاط';

  @override
  String get guildMenuSettingsWebhooks => 'الويب هوك';

  @override
  String get guildMenuSettingsDiscovery => 'الاكتشاف';

  @override
  String get guildMenuSettingsMembers => 'الأعضاء';

  @override
  String get guildMenuSettingsInviteLinks => 'الدعوات';

  @override
  String get guildMenuSettingsBans => 'الحظر';

  @override
  String get guildMenuSettingsChannels => 'القنوات';

  @override
  String get guildSettingsNoPermission =>
      'ليس لديك الإذن لعرض علامة تبويب الإعدادات هذه.';

  @override
  String get guildSettingsOverviewIconTitle => 'أيقونة';

  @override
  String get guildSettingsOverviewBannerTitle => 'لافتة';

  @override
  String get guildSettingsOverviewNameTitle => 'الاسم';

  @override
  String get guildSettingsOverviewNameHint => 'مجتمعي الرائع';

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
      'اكتب لونًا (hex أو rgb() أو hsl() أو اسمًا) أو استخدم منتقي الألوان.';

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
  String get guildSettingsRolesSingleColumn => 'عمود واحد';

  @override
  String get guildSettingsRolesTwoColumns => 'عمودان';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'لم يتم العثور على أذونات';

  @override
  String get guildSettingsRolesHoistOrder => 'ترتيب الظهور';

  @override
  String get guildSettingsRolesResetHoistOrder => 'إعادة التعيين إلى الافتراضي';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'اسحب الأدوار لتخصيص ترتيب ظهورها في قائمة الأعضاء.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'لا توجد أدوار معروضة بشكل منفصل. فعّل «إظهار هذا الدور بشكل منفصل» لأحد الأدوار لتراه هنا.';

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
      'تمت إعادة تعيين ترتيب الظهور إلى الافتراضي';

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
      'تعذّر إعادة تعيين ترتيب الظهور';

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
  String get permissionAdministrator => 'مسؤول';

  @override
  String get permissionAdministratorDescription =>
      'يمنح جميع الأذونات ويتجاوز قيود القنوات. إذن حساس للغاية.';

  @override
  String get permissionViewActivityLog => 'عرض سجل النشاط';

  @override
  String get permissionViewActivityLogDescription =>
      'قراءة سجل نشاط المجتمع الذي يتضمن التغييرات وإجراءات الإشراف.';

  @override
  String get permissionManageCommunity => 'إدارة المجتمع';

  @override
  String get permissionManageCommunityDescription =>
      'تعديل الإعدادات العامة مثل الاسم والوصف والأيقونة.';

  @override
  String get permissionManageRoles => 'إدارة الأدوار';

  @override
  String get permissionManageRolesDescription =>
      'إنشاء الأدوار الأدنى من أعلى دور لديك أو تعديلها أو حذفها. يسمح أيضًا بتعديل تجاوزات أذونات القناة.';

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
      'تعديل تجاوزات الأذونات للأدوار والأعضاء في هذه القناة.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'إنشاء ويب هوك لهذه القناة أو تعديله أو حذفه.';

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
  String get permissionOverwriteAllow => 'سماح';

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
  String get permissionChangeOwnNickname => 'تغيير الاسم المستعار الشخصي';

  @override
  String get permissionChangeOwnNicknameDescription => 'تعديل اسمك المستعار.';

  @override
  String get permissionManageNicknames => 'إدارة الأسماء المستعارة';

  @override
  String get permissionManageNicknamesDescription =>
      'تغيير الأسماء المستعارة للأعضاء الآخرين.';

  @override
  String get permissionCreateEmojiStickers => 'إنشاء رموز تعبيرية وملصقات';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'تحميل رموز تعبيرية وملصقات جديدة، وإدارة ما أنشأته بنفسك.';

  @override
  String get permissionManageEmojiStickers =>
      'إدارة الرموز التعبيرية والملصقات';

  @override
  String get permissionManageEmojiStickersDescription =>
      'تعديل أو حذف الرموز التعبيرية والملصقات التي أنشأها أعضاء آخرون.';

  @override
  String get permissionManageWebhooks => 'إدارة الويب هوك';

  @override
  String get permissionManageWebhooksDescription =>
      'إنشاء ويب هوك أو تعديله أو حذفه.';

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
      'حذف رسائل الأعضاء الآخرين. للتثبيت إذن منفصل.';

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
      'إضافة ردود فعل جديدة على الرسائل.';

  @override
  String get permissionBypassSlowmode => 'تجاوز الوضع البطيء';

  @override
  String get permissionBypassSlowmodeDescription =>
      'تجاهل حدود معدل الرسائل لكل قناة.';

  @override
  String get permissionTimeOutMembers => 'فرض مهلة على الأعضاء';

  @override
  String get permissionTimeOutMembersDescription =>
      'منع الأعضاء من إرسال الرسائل وإضافة ردود الفعل والانضمام إلى القنوات الصوتية لمدة محددة.';

  @override
  String get permissionViewChannel => 'عرض القناة';

  @override
  String get permissionViewChannelMembers => 'عرض أعضاء القناة';

  @override
  String get permissionViewChannelMembersDescription =>
      'الاطّلاع على قائمة أعضاء القنوات في هذا المجتمع.';

  @override
  String get permissionConnect => 'اتصال';

  @override
  String get permissionSpeak => 'التحدث';

  @override
  String get permissionStreamVideo => 'بث الفيديو';

  @override
  String get permissionUseVoiceActivity => 'استخدام النشاط الصوتي';

  @override
  String get permissionUseVoiceActivityDescription =>
      'بدون هذا الإذن، يلزم استخدام الضغط للتحدث.';

  @override
  String get permissionPrioritySpeaker => 'متحدث ذو أولوية';

  @override
  String get permissionMuteMembers => 'كتم صوت الأعضاء';

  @override
  String get permissionDeafenMembers => 'تعطيل سمع الأعضاء';

  @override
  String get permissionMoveMembers => 'نقل الأعضاء';

  @override
  String get permissionMoveMembersDescription =>
      'اسحب الأعضاء بين القنوات التي يمكنهم الوصول إليها.';

  @override
  String get permissionSetVoiceRegion => 'تعيين منطقة الصوت';

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
  String get guildSettingsEmojiEmpty => 'لا توجد رموز تعبيرية مخصصة بعد.';

  @override
  String get guildSettingsStickersEmpty => 'لا توجد ملصقات مخصصة بعد.';

  @override
  String get guildSettingsModerationVerificationTitle => 'التحقق من الأعضاء';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'اختر ما يجب أن يستوفيه الأعضاء قبل أن يتمكنوا من النشر أو مراسلة أعضاء المجتمع مباشرة.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'يمكن للأعضاء ذوي الأدوار تجاوز هذه الفحوصات. للمساحات العامة، نوصي بتمكين التحقق.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'تتطلب المجتمعات المدرجة في الاكتشاف بريدًا إلكترونيًا تم التحقق منه على الأقل. لا يمكن تحديد \"لا شيء\" أثناء تمكين الاكتشاف.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'المحتوى للبالغين وتحذيرات المحتوى';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'قم بتكوين تسمية المحتوى الناضج وتحذيرات المحتوى الاختيارية للأعضاء.';

  @override
  String get guildSettingsModerationMatureToggle => 'محتوى للبالغين';

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
      'يتطلب عنوان بريد إلكتروني مُوثّق.';

  @override
  String get guildSettingsVerificationMedium => 'متوسط';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'يتطلب عنوان بريد إلكتروني تم التحقق منه، وحسابًا عمره 5 دقائق على الأقل.';

  @override
  String get guildSettingsVerificationHigh => 'مرتفع';

  @override
  String get guildSettingsVerificationHighDescription =>
      'يتطلب كل ما في المستوى المتوسط، بالإضافة إلى كونك عضوًا في المجتمع لمدة 10 دقائق على الأقل.';

  @override
  String get guildSettingsAuditLogDescription =>
      'تتبع إجراءات المشرفين في جميع أنحاء المجتمع.';

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
  String get auditLogActionChannelCreate => 'تم إنشاء القناة';

  @override
  String get auditLogActionChannelUpdate => 'تم تحديث القناة';

  @override
  String get auditLogActionChannelDelete => 'تم حذف القناة';

  @override
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

  @override
  String get auditLogActionChannelOverwriteCreate => 'تمت إضافة تجاوز للقناة';

  @override
  String get auditLogActionChannelOverwriteUpdate => 'تم تحديث تجاوز القناة';

  @override
  String get auditLogActionChannelOverwriteDelete => 'تمت إزالة تجاوز القناة';

  @override
  String get auditLogActionMemberKick => 'تم طرد العضو';

  @override
  String get auditLogActionMemberPrune => 'تم تقليم الأعضاء';

  @override
  String get auditLogActionMemberBanAdd => 'تم حظر العضو';

  @override
  String get auditLogActionMemberBanRemove => 'تم إلغاء حظر العضو';

  @override
  String get auditLogActionMemberUpdate => 'تم تحديث العضو';

  @override
  String get auditLogActionMemberRoleUpdate => 'تم تحديث أدوار العضو';

  @override
  String get auditLogActionMemberMove => 'تم نقل العضو';

  @override
  String get auditLogActionMemberDisconnect => 'تم قطع اتصال العضو';

  @override
  String get auditLogActionBotAdd => 'تمت إضافة بوت';

  @override
  String get auditLogActionRoleCreate => 'تم إنشاء الدور';

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
  String get auditLogActionEmojiCreate => 'تم إنشاء رمز تعبيري';

  @override
  String get auditLogActionEmojiUpdate => 'تم تحديث الرمز التعبيري';

  @override
  String get auditLogActionEmojiDelete => 'تم حذف الرمز التعبيري';

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
  String get guildSettingsWebhooksDescription =>
      'عرض كل الويب هوك المُعدّة في مجتمعك وإدارتها.';

  @override
  String get guildSettingsWebhooksEmpty => 'لا يوجد أي ويب هوك';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'لا يحتوي هذا المجتمع على أي خطافات ويب حتى الآن. انتقل إلى $channelSettingsPath لإنشاء واحد.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'تحتاج إلى صلاحية \"$permission\" لعرض وتعديل خطافات الويب لهذا المجتمع.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'تعذّر تحميل الويب هوك';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'حدث خطأ أثناء تحميل الويب هوك. حاول مرة أخرى.';

  @override
  String get guildSettingsWebhooksUpdated => 'تم تحديث الويب هوك';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'تعذّر تحديث الويب هوك';

  @override
  String get guildSettingsUnknownChannel => 'قناة غير معروفة';

  @override
  String get guildSettingsCopiedUrl => 'تم نسخ الرابط إلى الحافظة';

  @override
  String get guildSettingsDiscoveryDescription =>
      'أدرج مجتمعك في \"الاكتشاف\" ليتمكن الآخرون من العثور عليه والانضمام إليه.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'عدد الأعضاء غير كافٍ';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'يحتاج مجتمعك إلى ما لا يقل عن $count عضوًا قبل إدراجه في الاكتشاف.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'الحالة:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'معلّق';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'تمت الموافقة';

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
      'طلبك قيد المراجعة. لا يزال بإمكانك تحديث تفاصيل الإدراج أو سحب الطلب.';

  @override
  String get guildSettingsDiscoveryCategory => 'الفئة';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'اختر الفئة التي تصف مجتمعك بشكل أفضل. يمكنك تغيير هذا في أي وقت.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'اللغة الأساسية';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'اللغة التي يتحدثها معظم أفراد مجتمعك. تُستخدم لتصفية نتائج الاكتشاف.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'الوصف';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder => 'صف موضوع مجتمعك';

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
  String get guildSettingsDiscoveryTags => 'وسوم مخصصة';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'يمكن لما يصل إلى $maxTags علامة مساعدة الأشخاص في العثور على مجتمعك. تظهر في بحث الاكتشاف.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'أضف وسمًا واضغط على Enter';

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
    return 'يجب أن يتراوح طول الوسوم بين 2 و$maxLength من الأحرف، وأن تحتوي على حروف وأرقام فقط.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'يمكنك إضافة ما يصل إلى $maxTags علامة فقط.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'تطبيق';

  @override
  String get guildSettingsDiscoverySave => 'حفظ';

  @override
  String get guildSettingsDiscoveryWithdraw => 'سحب الطلب';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'تم إرسال طلب الإدراج في الاكتشاف';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'تم تحديث الإدراج في الاكتشاف';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'تم سحب طلب الإدراج في الاكتشاف';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle => 'تعذر سحب الطلب';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'حاول مرة أخرى بعد قليل.';

  @override
  String get guildSettingsMembersSearchHint => 'البحث باسم المستخدم أو المعرف';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count عضوًا';
  }

  @override
  String get guildMembersRecentTitle => 'أحدث الأعضاء';

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
    return 'تاريخ الانضمام إلى $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'طريقة الانضمام';

  @override
  String get guildMembersColumnRoles => 'الأدوار';

  @override
  String get guildMembersFilterMemberSince => 'تصفية حسب تاريخ الانضمام';

  @override
  String get guildMembersFilterJoinedProduct => 'تصفية حسب تاريخ إنشاء الحساب';

  @override
  String get guildMembersFilterJoinMethod => 'تصفية حسب طريقة الانضمام';

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
  String get guildMembersDateAfter => 'بعد تاريخ';

  @override
  String get guildMembersDateBefore => 'قبل التاريخ';

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
  String get guildMembersJoinSourceVanityUrl => 'عنوان URL المخصص';

  @override
  String get guildMembersJoinSourceBotInvite => 'دعوة بوت';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'مسؤول المنصة';

  @override
  String get guildMembersJoinSourceDiscovery => 'الاكتشاف';

  @override
  String get guildMembersJoinMethodUnknown => 'غير معروف';

  @override
  String get guildMembersCommunityOwner => 'مالك المجتمع';

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
  String get guildMembersChannelListLabel => 'الأعضاء';

  @override
  String get guildSettingsInvitesTitle => 'الدعوات';

  @override
  String get guildSettingsInvitesDescription =>
      'عرض جميع دعوات هذا المجتمع. لإنشاء دعوة جديدة، انتقل إلى قناة واستخدم زر الدعوة.';

  @override
  String get guildSettingsInvitesEmpty => 'لا توجد روابط دعوة';

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
  String get guildSettingsInvitesExpired => 'انتهت الصلاحية';

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
  String get guildSettingsBansDescription =>
      'عرض المستخدمين المحظورين وإدارتهم.';

  @override
  String get guildSettingsBansSearchHint => 'البحث في قائمة الحظر';

  @override
  String get guildSettingsBansEmpty => 'لا يوجد مستخدمون محظورون.';

  @override
  String get guildSettingsBanExpiresLabel => 'تاريخ الانتهاء';

  @override
  String get guildSettingsBansNoSearchResults =>
      'لم يتم العثور على عمليات حظر مطابقة لبحثك.';

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
  String get guildSettingsRevokeBanError => 'تعذر إلغاء الحظر. حاول مرة أخرى.';

  @override
  String get guildSettingsCommunitySettings => 'إعدادات المجتمع';

  @override
  String get guildSettingsDeleteCommunity => 'حذف المجتمع';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'هل أنت متأكد أنك تريد حذف هذا المجتمع؟ لا يمكن التراجع عن هذا الإجراء. سيتم حذف جميع القنوات والرسائل والإعدادات نهائيًا.';

  @override
  String get guildSettingsCommunityDeleted => 'تم حذف المجتمع';

  @override
  String get guildSettingsDeleteCommunityFailed => 'تعذر حذف هذا المجتمع';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewBrandingTitle => 'العلامة التجارية';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'تحديث الأيقونة والاسم والشعار وخلفية الدعوة';

  @override
  String get guildSettingsOverviewBannerUpload => 'تحميل لافتة';

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
      'يُفرض إعداد \"الإشارات فقط\" على المجتمعات التي يزيد عدد أعضائها على 250 شخصًا. نحتفظ بإعدادك الأصلي وسنعيده إذا انخفض عدد أعضاء المجتمع إلى أقل من 250.';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'السماح بأسماء قنوات نصية مرنة';

  @override
  String get guildSettingsOverviewHideOwnerCrown => 'إخفاء تاج مالك المجتمع';

  @override
  String get guildSettingsOverviewDetachedBanner => 'لافتة منفصلة';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'يعرض اللافتة في قسم خاص بها أسفل رأس المجتمع.';

  @override
  String get guildSettingsOverviewUploadIcon => 'تحميل أيقونة';

  @override
  String get guildSettingsOverviewRemoveImage => 'إزالة';

  @override
  String get guildSettingsOverviewSplashTitle => 'خلفية الدعوة';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'خلفية التضمين في الدردشة';

  @override
  String get guildSettingsOverviewUploadBackground => 'تحميل الخلفية';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'لا توجد لافتة للمجتمع';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'لا توجد خلفية دعوة';

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
  String get guildSettingsSplashAlignmentCenter => 'توسيط';

  @override
  String get guildSettingsSplashAlignmentLeft => 'يسار';

  @override
  String get guildSettingsSplashAlignmentRight => 'يمين';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'ينطبق على الشاشات العريضة فقط.';

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
      'تفعيل حد سجل الرسائل';

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
      'السماح بالأحرف الكبيرة والمسافات في أسماء القنوات النصية. عند الإيقاف تقتصر الأسماء على الأحرف الصغيرة مع الواصلات والشرطات السفلية.';

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
  String get guildSettingsAfkChannel => 'قناة الخمول (AFK)';

  @override
  String get guildSettingsAfkChannelHint =>
      'انقل الأعضاء إلى هذه القناة عندما يكونون غير نشطين.';

  @override
  String get guildSettingsNoAfkChannel => 'لا توجد قناة خمول';

  @override
  String get guildSettingsAfkTimeout => 'مهلة الخمول';

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
  String get guildSettingsNotificationsAll => 'كل الرسائل';

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
  String get guildSettingsModerationContentFilterTitle => 'فلترة المحتوى';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'فحص الرسائل تلقائيًا بحثًا عن المحتوى الصريح في القنوات غير المصنفة للبالغين.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'يُطلب من المجتمعات المدرجة في الاكتشاف فحص جميع الأعضاء. لا يمكن تغيير هذا الإعداد أثناء تمكين الاكتشاف.';

  @override
  String get guildSettingsContentFilterOff => 'إيقاف';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'ترك الإشراف للمجتمع نفسه';

  @override
  String get guildSettingsContentFilterNoRole =>
      'تصفية رسائل الأعضاء بدون أدوار';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'مقترح لمعظم المجتمعات';

  @override
  String get guildSettingsContentFilterAll => 'تصفية رسائل الجميع';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'أقصى حماية للمساحات الملائمة للعائلة';

  @override
  String get guildSettingsContentWarningToggle => 'إظهار تحذير محتوى';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'تبديل موجه الموافقة قبل دخول أي قناة.';

  @override
  String get guildSettingsContentWarningText => 'نص تحذير مخصص';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'يحتوي هذا على محتوى حساس.';

  @override
  String get guildSettingsModeration2faTitle => 'اشتراط المصادقة الثنائية';

  @override
  String get guildSettingsModeration2faDescription =>
      'طلب المصادقة الثنائية للمشرفين قبل أن يتمكنوا من حظر أو طرد أو تقييد الوقت أو إزالة الرسائل.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'اشتراط المصادقة الثنائية لإجراءات الإشراف';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'فعّل المصادقة الثنائية (2FA) على حسابك لتغيير هذا الإعداد';

  @override
  String get guildSettingsEmojiSearchHint => 'البحث عن الرموز التعبيرية';

  @override
  String get guildSettingsEmojiUploadTitle => 'تحميل رمز تعبيري';

  @override
  String get guildSettingsEmojiSlotsTitle => 'خانات الرموز التعبيرية';

  @override
  String get guildSettingsEmojiDropZone =>
      'اسحب ملفات الرموز التعبيرية وأفلتها هنا';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'تعذّر تحميل الرموز التعبيرية. حاول مرة أخرى لاحقًا.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'لم يتم العثور على أي رموز تعبيرية مطابقة لبحثك.';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'لقد وصلت إلى الحد الأقصى لعدد الرموز التعبيرية. احذف بعض الرموز التعبيرية الموجودة لإفساح المجال.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'يجب أن تتكون أسماء الرموز التعبيرية من حرفين على الأقل، ويمكن أن تحتوي على أحرف وأرقام وشرطات سفلية. يجب ألا يتجاوز حجم الرمز التعبيري $maxSize. يُغيَّر حجم الصور الثابتة إلى 128 × 128 بكسل وتُضغط تلقائيًا. يجب أن تكون الرموز التعبيرية المتحركة وملفات SVG ضمن الحد مسبقًا.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'تعذر إضافة بعض الرموز التعبيرية';

  @override
  String get guildSettingsEmojiRenameTitle => 'إعادة تسمية الرمز التعبيري';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 حرفًا أو رقمًا أو شرطة سفلية.';

  @override
  String get guildSettingsEmojiColumnName => 'الاسم';

  @override
  String get guildSettingsEmojiColumnUploader => 'تم التحميل بواسطة';

  @override
  String get guildSettingsEmojiDeleteTitle => 'حذف الرمز التعبيري';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'هل تريد حذف :$name:؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'حذف هذا الرمز التعبيري نهائيًا من التخزين وشبكة CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'يجب أن يتكون اسم الرمز التعبيري من حرفين على الأقل';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'يجب ألا يتجاوز اسم الرمز التعبيري 32 حرفًا';

  @override
  String get guildSettingsEmojiInvalidNameTitle =>
      'اسم الرمز التعبيري غير صالح';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'تعذّر تغيير اسم هذا الرمز التعبيري';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'تعذّر حذف هذا الرمز التعبيري';

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
  String get guildSettingsStickersSearchHint => 'البحث عن الملصقات';

  @override
  String get guildSettingsStickerSlotsTitle => 'خانات الملصقات';

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
  String get guildSettingsStickerSlotsFull =>
      'لقد وصلت إلى الحد الأقصى لعدد الملصقات. احذف بعض الملصقات الموجودة لإفساح المجال.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'تُحفظ الملصقات بدقة 320×320 بكسل ويجب أن يكون حجمها أقل من $maxSize. يُغيَّر حجم الصور الثابتة وتُضغط تلقائيًا. أما الملصقات المتحركة وملفات SVG فيجب أن تكون ضمن الحد مسبقًا.';
  }

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
  String get guildSettingsStickerDeleteTitle => 'حذف الملصق';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'هل تريد حذف \"$name\"؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'حذف هذا الملصق نهائيًا من التخزين وشبكة CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle => 'تعذر حذف هذا الملصق';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'لإنشاء خطاف ويب، افتح $channelSettingsPath. لا يزال بإمكانك تعديل وتنظيم جميع خطافات الويب الموجودة هنا.';
  }

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
  String get guildSettingsInvitesTableCreated => 'تم الإنشاء';

  @override
  String get guildSettingsInvitesTableExpires => 'تاريخ الانتهاء';

  @override
  String get guildSettingsAuditLogFilterUser => 'تصفية حسب المستخدم';

  @override
  String get guildSettingsAuditLogFilterAction => 'تصفية حسب الإجراء';

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
  String get createDmSearchFriends => 'البحث في الأصدقاء';

  @override
  String get createDmNoFriendsFound => 'لم يتم العثور على أصدقاء';

  @override
  String get createDmNoFriendsYet => 'ليس لديك أصدقاء بعد';

  @override
  String get createDmClaimToStartDms => 'طالب بحسابك لبدء رسائل مباشرة.';

  @override
  String get createDmVerifyToStartDms =>
      'تحقق من بريدك الإلكتروني لبدء الرسائل المباشرة.';

  @override
  String get createDmVerifyYourEmail => 'تحقق من بريدك الإلكتروني';

  @override
  String get createDmNewGroup => 'مجموعة جديدة';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'إنشاء مجموعة جديدة مع $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'تأكيد المحادثة الجماعية الجديدة';

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
      'لا يمكن إضافة الأشخاص التالين إلى هذه المحادثة الجماعية:';

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
      'لا يسمح بإضافته إلى المحادثات الجماعية';

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
  String get keybindSectionDragAndDrop => 'السحب والإفلات';

  @override
  String get keybindSectionChat => 'الدردشة';

  @override
  String get keybindSectionVoiceAndVideo => 'الصوت والفيديو';

  @override
  String get keybindSectionMisc => 'متفرقات';

  @override
  String get keybindActionShowShortcutsList =>
      'عرض قائمة اختصارات لوحة المفاتيح';

  @override
  String get keybindActionCopyText => 'نسخ النص';

  @override
  String get keybindActionMarkUnread => 'وضع علامة كغير مقروءة';

  @override
  String get keybindActionFocusTextarea => 'التركيز على مربع النص';

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
      'التنقل بين القنوات غير المقروءة التي تحتوي على إشارات';

  @override
  String get keybindActionJumpCurrentCall => 'الانتقال إلى المكالمة الحالية';

  @override
  String get keybindActionToggleLastGuildDms =>
      'التبديل بين آخر مجتمع والرسائل المباشرة';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'التبديل إلى المجتمع السابق أو الرسائل المباشرة';

  @override
  String get keybindActionNextCommunityOrDms =>
      'التبديل إلى المجتمع التالي أو الرسائل المباشرة';

  @override
  String get keybindActionGoToDms => 'الانتقال إلى الرسائل المباشرة';

  @override
  String get keybindActionGoToFirstCommunity => 'الانتقال إلى المجتمع الأول';

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
  String get keybindActionToggleQuickSwitcher =>
      'إظهار التبديل السريع أو إخفاؤه';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'إنشاء مجتمع أو الانضمام إليه';

  @override
  String get keybindActionStartDragAndDrop => 'بدء السحب والإفلات';

  @override
  String get keybindActionMove => 'نقل';

  @override
  String get keybindActionDropItem => 'إفلات العنصر';

  @override
  String get keybindActionCancel => 'إلغاء';

  @override
  String get keybindActionMarkCommunityRead => 'وضع علامة على المجتمع كمقروء';

  @override
  String get keybindActionMarkChannelRead => 'وضع علامة على القناة كمقروءة';

  @override
  String get keybindActionStartGroupDm => 'بدء محادثة جماعية';

  @override
  String get keybindActionTogglePinnedMessages => 'تبديل الرسائل المثبتة';

  @override
  String get keybindActionToggleInbox => 'تبديل صندوق الوارد';

  @override
  String get keybindActionMarkTopInboxRead =>
      'وضع علامة على أعلى قناة في صندوق الوارد كمقروءة';

  @override
  String get keybindActionMarkAllInboxRead =>
      'وضع علامة على كل قنوات صندوق الوارد كمقروءة';

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
  String get keybindActionScrollChatUp => 'تمرير الدردشة للأعلى';

  @override
  String get keybindActionScrollChatDown => 'تمرير الدردشة للأسفل';

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
  String get keybindActionStartDmCall =>
      'بدء مكالمة في رسالة مباشرة أو محادثة جماعية';

  @override
  String get keybindActionToggleSoundboard => 'تبديل لوحة الصوت';

  @override
  String get keybindActionToggleCompactCallView =>
      'توسيع أو طي عرض المكالمة المصغر';

  @override
  String get keybindActionPushToTalkPriority => 'اضغط للتحدث (أولوية)';

  @override
  String get keybindActionVoiceActivityPriority => 'أولوية النشاط الصوتي';

  @override
  String get keybindActionOpenHelp => 'فتح المساعدة';

  @override
  String get keybindActionSearchMessages => 'البحث في الرسائل';

  @override
  String get keybindActionOpenContextMenu => 'فتح قائمة السياق';

  @override
  String get keybindActionOpenSettings => 'فتح إعداداتك';

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

  @override
  String get assistantNeedsLogin => 'افتح Fluxer وسجّل الدخول أولاً.';

  @override
  String get assistantNotInVoice => 'أنت لست في مكالمة.';

  @override
  String get assistantNotFound => 'لم يتمكن Fluxer من العثور على ذلك.';

  @override
  String get assistantDmsDisabled => 'الرسائل المباشرة معطلة في هذا المثيل.';

  @override
  String get assistantFailed => 'تعذر على Fluxer إكمال ذلك.';

  @override
  String get assistantOkMuted => 'تم كتم الميكروفون.';

  @override
  String get assistantOkUnmuted => 'تم إلغاء كتم الميكروفون.';

  @override
  String get assistantOkLeftVoice => 'غادرت القناة الصوتية.';

  @override
  String get assistantOkJoinedVoice => 'جارٍ الانضمام إلى القناة الصوتية.';

  @override
  String get assistantOkStartedCall => 'جارٍ بدء المكالمة.';

  @override
  String assistantOkStatusSet(String status) {
    return 'تم تعيين الحالة إلى $status.';
  }

  @override
  String get assistantOkOpened => 'جارٍ فتح Fluxer.';

  @override
  String get assistantOkMessageSent => 'تم إرسال الرسالة.';

  @override
  String get assistantOkCustomStatusSet => 'تم تحديث الحالة المخصصة.';

  @override
  String get assistantOkCustomStatusCleared => 'تم مسح الحالة المخصصة.';

  @override
  String get guildNavbarAnnouncementChannel => 'قناة إعلانات';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'انشر التحديثات التي يمكن للمجتمعات الأخرى متابعتها في قنواتها الخاصة';

  @override
  String get channelDetailsAnnouncementChannel => 'قناة إعلانات';

  @override
  String get channelSettingsAnnouncementChannel => 'قناة إعلانات';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'يتيح لمجتمعات أخرى متابعة هذه القناة والحصول على نسخ مما تنشره.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'هل تريد إيقاف كونها قناة إعلانات؟';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count قناة تتابع هذه القناة. تحويلها إلى قناة نصية يزيل هذه المتابعات.',
      many:
          '$count قناة تتابع هذه القناة. تحويلها إلى قناة نصية يزيل هذه المتابعات.',
      few:
          '$count قنوات تتابع هذه القناة. تحويلها إلى قناة نصية يزيل هذه المتابعات.',
      two:
          'قناتان تتابعان هذه القناة. تحويلها إلى قناة نصية يزيل هاتين المتابعتين.',
      one:
          'قناة واحدة تتابع هذه القناة. تحويلها إلى قناة نصية يزيل هذه المتابعة.',
      zero: 'لا توجد قنوات تتابع هذه القناة.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'سيؤدي تحويل هذه القناة إلى قناة نصية إلى إلغاء متابعة كل القنوات التي تتابعها.';

  @override
  String get channelSettingsConvertChannel => 'تحويل';

  @override
  String get channelSettingsConvertFailed => 'تعذر تحويل هذه القناة';

  @override
  String get channelSettingsChannelHasFollowers =>
      'لا تزال قنوات أخرى تتابع هذه القناة. أزل هذه المتابعات قبل تحويلها.';

  @override
  String get channelMenuFollow => 'متابعة القناة';

  @override
  String get channelFollowTitle => 'متابعة هذه القناة';

  @override
  String get channelFollowBody =>
      'اختر أين تذهب رسائلها المنشورة. يمكنك إلغاء المتابعة في أي وقت من إعدادات المجتمع ← الويب هوك.';

  @override
  String get channelFollowCommunity => 'المجتمع';

  @override
  String get channelFollowChannel => 'القناة';

  @override
  String get channelFollowAgeWarning =>
      'هذه قناة مقيدة بالعمر. لا يمكن إرسال التحديثات إلا إلى القنوات المقيدة بالعمر.';

  @override
  String get channelFollowContentWarning =>
      'هذه القناة لديها تحذير محتوى. يمكن إرسال التحديثات فقط إلى القنوات التي لديها تحذير محتوى أو تقييد عمري.';

  @override
  String get channelFollowHiddenHint =>
      'تم إخفاء المجتمعات والقنوات التي لا يمكنك إدارة الويب هوك فيها.';

  @override
  String get channelFollowEmpty =>
      'لا يمكنك إدارة الويب هوك في أي مجتمع. اطلب من المسؤول متابعة هذه القناة.';

  @override
  String get channelFollowSubmit => 'متابعة';

  @override
  String get channelFollowFailed => 'تعذر متابعة هذه القناة.';

  @override
  String get channelFollowSuccessTitle => 'التحديثات في طريقها!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'ستظهر الرسائل المنشورة في $sourceName في #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'تمام!';

  @override
  String get channelFollowBarrier =>
      'تابع هذه القناة لتلقي هذه الإعلانات في قناة من اختيارك.';

  @override
  String get channelHeaderFollow => 'متابعة القناة';

  @override
  String get chatMessagePublish => 'نشر';

  @override
  String get chatMessagePublished => 'تم النشر';

  @override
  String get chatMessagePublishConfirmTitle => 'نشر الرسالة؟';

  @override
  String get chatMessagePublishConfirmBody =>
      'سيؤدي هذا إلى إرسال نسخة إلى كل قناة تتابع هذه القناة.';

  @override
  String get chatMessagePublishedToast => 'تم نشر الرسالة';

  @override
  String get chatMessageAlreadyPublished => 'هذه الرسالة منشورة بالفعل.';

  @override
  String get chatMessagePublishFailedTitle => 'تعذر نشر هذه الرسالة';

  @override
  String get chatMessagePublishFailedBody =>
      'حدث خطأ ما. حاول مرة أخرى بعد قليل.';

  @override
  String get chatMessagePublishLimitTitle => 'تمهل';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'يمكنك النشر مرة أخرى خلال $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'أنت تنشر بسرعة كبيرة. حاول مرة أخرى بعد قليل.';

  @override
  String get chatMessageDeletePublished =>
      'سيؤدي هذا أيضًا إلى إزالة النسخ التي تم إرسالها إلى القنوات التي تتابع هذه القناة.';

  @override
  String get chatMessageEditPublishedTitle => 'تعديل الرسالة المنشورة؟';

  @override
  String get chatMessageEditPublishedBody =>
      'سيؤدي هذا إلى تحديث النسخ التي تم إرسالها إلى القنوات التي تتابع هذه القناة.';

  @override
  String get chatMessageEditPublishedSave => 'حفظ';

  @override
  String get chatMessageEditLimitTitle => 'تمهل';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'يمكنك تعديل هذه الرسالة المنشورة مرة أخرى في $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'أنت تعدّل هذه الرسالة المنشورة بسرعة كبيرة. حاول مرة أخرى بعد قليل.';

  @override
  String get chatMessageOriginalDeleted => '[تم حذف الرسالة الأصلية]';

  @override
  String get userTagCommunity => 'المجتمع';

  @override
  String systemFollowAdd(String username, String source) {
    return 'جعل $username هذه القناة تتابع $source. ستظهر هنا الرسائل المنشورة هناك.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return 'جعل $username هذه القناة تتابع $source.';
  }

  @override
  String get publishNudgeNotSent => 'لم يتم الإرسال إلى المتابعين بعد.';

  @override
  String get publishNudgeHideForever => 'عدم الإظهار مرة أخرى';

  @override
  String get publishNudgeDismiss => 'تجاهل';

  @override
  String get channelSettingsFollowedChannels => 'القنوات المتابَعة';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'قنوات الإعلانات التي تتابعها هذه القناة. ألغِ المتابعة لإيقاف تلقي النسخ.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'قنوات الإعلانات التي تتابعها القنوات في هذا المجتمع.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'من $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'تم إيقاف التحديثات مؤقتًا لأن القناة المصدر لم تعد متاحة.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'هل ترغب في إلغاء متابعة $name؟';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'ستتوقف هذه القناة عن تلقي نسخ من قناة الإعلانات تلك.';

  @override
  String get channelSettingsUnfollow => 'إلغاء المتابعة';

  @override
  String get crosspostCommunityTitle => 'المجتمع';

  @override
  String get crosspostGoToCommunity => 'الانتقال إلى المجتمع';

  @override
  String get crosspostJoinCommunity => 'انضم إلى المجتمع';

  @override
  String get crosspostSourceFailed =>
      'تعذر تحميل هذا المجتمع. حاول مرة أخرى بعد لحظة.';

  @override
  String crosspostMembers(int count) {
    return 'عدد الأعضاء: $count';
  }

  @override
  String crosspostOnline(int count) {
    return 'المتصلون: $count';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقيقة',
      many: '$count دقيقة',
      few: '$count دقائق',
      two: 'دقيقتان',
      one: 'دقيقة واحدة',
      zero: '$count دقيقة',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ثانية',
      many: '$count ثانية',
      few: '$count ثوانٍ',
      two: 'ثانيتان',
      one: 'ثانية واحدة',
      zero: '$count ثانية',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'نوع قناة غير مدعوم';

  @override
  String get channelUnsupportedBody =>
      'هذا الإصدار من التطبيق لا يدعم نوع القناة هذا.';

  @override
  String get channelDetailsUnsupportedChannel => 'قناة غير مدعومة';

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
