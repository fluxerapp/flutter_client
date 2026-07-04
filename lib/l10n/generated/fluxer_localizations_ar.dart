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
  String get changeYourFluxerTag => 'تغيير FluxerTag الخاص بك';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

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
  String get fluxerTagAlreadyTaken => 'FluxerTag مأخوذ بالفعل';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'علامة FluxerTag $username#$discriminator مأخوذة بالفعل. المتابعة ستعيد تعيين رقمك المميز تلقائيًا.';
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
      'إذا قمت بحفظ علامة FluxerTag هذه، فستعود علامتك المكونة من 4 أرقام إلى رقم عشوائي عند انتهاء اشتراك Plutonium الخاص بك. إذا فشل اشتراكك في التجديد، فستحصل على فترة سماح مدتها 3 أيام قبل تغيير العلامة.';

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
  String get fluxerTagUpdated => 'تم تحديث FluxerTag';

  @override
  String get fluxerTagUpdateFailed =>
      'فشل تحديث FluxerTag. يرجى المحاولة مرة أخرى.';

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
      'طالب بحسابك لتغيير FluxerTag الخاص بك';

  @override
  String get changeFluxerTag => 'تغيير FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'خصص علامة FluxerTag المكونة من 4 أرقام ($discriminator) كما تريد باستخدام Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'تغيير اسم المستخدم وعلامة FluxerTag المكونة من 4 أرقام';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'علامة FluxerTag المخصصة الخاصة بك ($discriminator) مرتبطة باشتراك Plutonium الخاص بك وستعود إلى علامة عشوائية إذا انتهت صلاحيتها.';
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
  String get blockedUsersCopyTag => 'نسخ FluxerTag';

  @override
  String get blockedUsersCopyId => 'نسخ معرف المستخدم';

  @override
  String get userProfileLoadError => 'تعذر تحميل الملف الشخصي';

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
  String get chatAttachmentExpiredTooltip => 'انتهت صلاحية المرفق';

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
  String get accessibilityUnreadGroupTitle => 'مؤشرات غير مقروءة';

  @override
  String get accessibilityUnreadGroupDescription =>
      'تحكم في كيفية عرض مؤشرات الرسائل غير المقروءة.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'عرض مؤشر غير مقروء باهت في القنوات المكتومة';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'عرض مؤشر غير مقروء باهت بجوار الرسائل المباشرة والقنوات المكتومة حتى تتمكن من رؤية النشاط بسرعة.';

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
  String get voiceChannelEmptyDescription =>
      'هذه قناة صوتية. اتصل لبدء التحدث!';

  @override
  String get voiceChannelJoin => 'الانضمام إلى القناة الصوتية';

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
  String get voiceControlScreenShare => 'مشاركة الشاشة';

  @override
  String get voiceScreenShareNotificationText => 'جارٍ مشاركة شاشتك.';

  @override
  String get voiceControlMore => 'المزيد';

  @override
  String get voiceControlDisconnect => 'قطع الاتصال';

  @override
  String get voiceControlChat => 'الدردشة';

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
  String get personalNotesTitle => 'ملاحظات شخصية';

  @override
  String get personalNotesSubtitle => 'مساحتك الخاصة للأفكار والتذكيرات';

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
  String get userSettingsNavExpressionPacks => 'حزم التعبيرات';

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
  String get userSettingsNavMessagesAndMedia => 'الرسائل والوسائط';

  @override
  String get userSettingsNavAudioAndVideo => 'الصوت والفيديو';

  @override
  String get userSettingsNavSoundsAndAlerts => 'الأصوات والتنبيهات';

  @override
  String get userSettingsNavLanguageAndTime => 'اللغة والوقت';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Time format';

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
  String get betaWarningTitle => 'برنامج تجريبي';

  @override
  String get betaWarningMessage =>
      'هذا برنامج تجريبي. لم يكتمل كل شيء أو تتم إضافته بعد.';

  @override
  String get betaWarningReportIssues =>
      'يرجى الإبلاغ عن أي مشاكل تجدها لمجتمع Fluxer Mobile (يجب أن يكون لديك Plutonium لتتمكن من الانضمام إلى المجتمع حاليًا).';

  @override
  String get betaWarningRepoLink => 'عرض المصدر على GitHub';

  @override
  String get betaWarningGotIt => 'فهمت';

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
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'يتطلب ما لا يقل عن $count عضوًا للتقديم.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'طلب';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'الحالة';

  @override
  String get guildSettingsDiscoveryCategory => 'الفئة';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'الوصف';

  @override
  String get guildSettingsDiscoveryTags => 'العلامات';

  @override
  String get guildSettingsDiscoveryTagsHint => 'ألعاب، فن، موسيقى';

  @override
  String get guildSettingsDiscoveryApply => 'إرسال الطلب';

  @override
  String get guildSettingsDiscoveryWithdraw => 'سحب';

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
  String get guildSettingsInvitesDescription =>
      'عرض روابط الدعوة النشطة وإلغاؤها.';

  @override
  String get guildSettingsInvitesEmpty => 'لا توجد دعوات نشطة.';

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
  String get guildSettingsWebhooksInfo =>
      'إنشاء خطافات الويب من إعدادات القناة. قم بتحريرها هنا.';

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
  String get guildSettingsMembersSortNewest => 'الأحدث أولاً';

  @override
  String get guildSettingsAuditLogFilterUser => 'التصفية حسب المستخدم';

  @override
  String get guildSettingsAuditLogFilterAction => 'التصفية حسب الإجراء';
}
