// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class FluxerLocalizationsHe extends FluxerLocalizations {
  FluxerLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get reconnectingTitle => 'הסתבכנו!';

  @override
  String get reconnectingBody =>
      'משהו השתבש עם המופע.\nזה אמור להסתדר תוך שנייה!';

  @override
  String get gatewayReconnectingToast => 'מתחבר מחדש…';

  @override
  String get gatewayConnectedToast => 'מחובר';

  @override
  String get sessionExpiredToast => 'פג תוקף ההפעלה שלך. אנא היכנס שוב.';

  @override
  String splashStartupFailed(String error) {
    return 'נכשל בהפעלה: $error';
  }

  @override
  String get retry => 'נסה שוב';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'החיבור אבד';

  @override
  String get splashViewOnStatusPage => 'הצג בדף הסטטוס';

  @override
  String get splashConnectionIssuesPrompt => 'בעיות חיבור?';

  @override
  String get splashStatusPageLink => 'דף סטטוס';

  @override
  String get splashReadIncident => 'קרא את התקרית';

  @override
  String get splashIncidentHistory => 'היסטוריית תקלות';

  @override
  String get nagbarLearnMore => 'מידע נוסף';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'תחזוקה מתוכננת ל־$localizedTime. משך זמן צפוי: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'מתבצעת תחזוקה. משך זמן צפוי: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'התחזוקה הושלמה.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'היי $displayName, תבעו בעלות על החשבון שלכם כדי למנוע אובדן גישה.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'היי $displayName, אנא אמת את כתובת הדוא\"ל שלך.';
  }

  @override
  String get nagbarOpenSettings => 'פתח הגדרות';

  @override
  String get systemPermissionSettingsTitle => 'אפשר הרשאה';

  @override
  String get systemPermissionSettingsOpenSettings => 'פתח הגדרות';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return 'ל-`$productName` אין גישה למיקרופון שלך. ניתן להפעיל אותה בהגדרות הפרטיות של המכשיר שלך.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return 'ל-`$productName` אין גישה למצלמה שלך. ניתן להפעיל אותה בהגדרות הפרטיות של המכשיר.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return 'ל-`$productName` אין גישה לספריית התמונות שלך. ניתן להפעיל אותה בהגדרות הפרטיות של המכשיר שלך.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return 'ל-$productName אין הרשאה לשלוח התראות. ניתן להפעיל אותה בהגדרות המכשיר שלך.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'המנוי שלך לא חודש, אך עדיין יש לך גישה להטבות של $productName עד $graceDate. פעל כעת או שתאבד את כל ההטבות.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'מנוי ה-$productName שלך פג. חדש עכשיו כדי לשמור על ההטבות שלך.';
  }

  @override
  String get nagbarManageSubscription => 'ניהול מינוי';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'ברוכים הבאים ל-$productFullName. גלו את ההטבות שלכם ב-$productName ונהלו את המנוי שלכם.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'הצג את התכונות של $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'יש לך קוד מתנה חדש שמחכה במלאי המתנות שלך.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'יש לך $count קודי מתנה חדשים שמחכים במלאי המתנות שלך.';
  }

  @override
  String get nagbarViewGiftInventory => 'הצגת מלאי המתנות';

  @override
  String get nagbarVisionaryMfa =>
      'הפעל אימות דו-שלבי כדי להגן על חשבון ה-Visionary שלך.';

  @override
  String get nagbarEnableMfa => 'הפעל אימות דו-שלבי';

  @override
  String get nagbarTermsAcceptance =>
      'עדכנו את התנאים שלנו. אנא עיין וקבל אותם כדי להמשיך.';

  @override
  String get nagbarReviewTerms => 'בדוק תנאים';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'הצטרפו ל-$communityName כדי לשוחח עם הצוות ולהישאר מעודכנים.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'הצטרף/הצטרפי ל-$communityName';
  }

  @override
  String get nagbarPushNotification =>
      'אפשר התראות כדי שלא תפספס הודעות ואזכורים.';

  @override
  String get nagbarEnableNotifications => 'הפעלת התראות';

  @override
  String get nagbarBillingPortalFailed =>
      'לא ניתן היה לפתוח את פורטל החיובים. אנא נסה שוב בעוד רגע.';

  @override
  String get welcomeBack => 'ברוך/ברוכה השב/ה';

  @override
  String get email => 'אימייל';

  @override
  String get emailInvalid => 'הזן כתובת אימייל תקינה.';

  @override
  String get password => 'סיסמה';

  @override
  String get forgotPassword => 'שכחת את הסיסמה?';

  @override
  String get logIn => 'כניסה';

  @override
  String get logInWithPasskey => 'התחבר באמצעות מפתח גישה';

  @override
  String continueWithSso(String provider) {
    return 'המשך עם $provider';
  }

  @override
  String get ssoRequired => 'נדרש SSO כדי לגשת למופע זה.';

  @override
  String get organizationSsoProvider =>
      'התחבר באמצעות ספק ה-SSO של הארגון שלך.';

  @override
  String get failedToStartSso => 'ההתחברות באמצעות SSO נכשלה';

  @override
  String get ssoCancelled => 'כניסת SSO בוטלה';

  @override
  String preferSso(String provider) {
    return 'להעדיף שימוש ב-SSO? המשך עם $provider.';
  }

  @override
  String get logInViaBrowser => 'התחבר דרך הדפדפן';

  @override
  String get needAccountPrompt => 'צריכים חשבון? ';

  @override
  String get register => 'הרשמה';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'יש לוודא שאתה אנושי';

  @override
  String get captchaDescription =>
      'אנחנו צריכים לוודא שאתה לא רובוט. אנא השלם את האימות למטה.';

  @override
  String get captchaSwitchToHcaptcha =>
      'נתקלת בבעיות? נסה/נסי את hCaptcha במקום';

  @override
  String get captchaSwitchToTurnstile => 'נסה את Turnstile במקום';

  @override
  String get cancel => 'ביטול';

  @override
  String get ipAuthCheckEmail => 'בדוק את האימייל שלך';

  @override
  String ipAuthDescription(String email) {
    return 'שלחנו קישור לאישור הכניסה הזו. אנא פתח את תיבת הדואר הנכנס שלך בכתובת $email.';
  }

  @override
  String get ipAuthConnectionLost => 'החיבור אבד';

  @override
  String get ipAuthConnectionLostDescription =>
      'איבדנו את החיבור בזמן ההמתנה לאישור. נסה שוב.';

  @override
  String get ipAuthLinkExpired => 'קישור הכניסה פג';

  @override
  String get ipAuthLinkExpiredDescription =>
      'קישור האישור הזה פג. אנא היכנס שוב.';

  @override
  String get ipAuthResendEmail => 'שלח אימייל שוב';

  @override
  String get ipAuthResent => 'נשלח שוב';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds שניות';
  }

  @override
  String get back => 'חזרה';

  @override
  String get next => 'הבא';

  @override
  String get mfaTitle => 'אימות דו-שלבי';

  @override
  String get mfaChooseMethod => 'בחר שיטת אימות';

  @override
  String get mfaMethodTotp => 'אפליקציית אימות';

  @override
  String get mfaMethodWebauthn => 'מפתח אבטחה / Passkey';

  @override
  String get mfaTotpDescription =>
      'הזן את הקוד בן 6 הספרות מאפליקציית האימות שלך או אחד מקודי הגיבוי שלך.';

  @override
  String get mfaCodeLabel => 'קוד';

  @override
  String get mfaTryAnotherMethod => 'נסה שיטה אחרת';

  @override
  String get mfaUseSecurityKey => 'נסה/י במקום זאת מפתח אבטחה / Passkey';

  @override
  String get accountSelectorTitle => 'בחר חשבון';

  @override
  String get accountSelectorDescription =>
      'בחר חשבון כדי להמשיך, או הוסף חשבון אחר.';

  @override
  String get accountAdd => 'הוספת חשבון';

  @override
  String get accountRemove => 'הסר';

  @override
  String accountRemoveTitle(String username) {
    return 'הסר את $username';
  }

  @override
  String get accountRemoveDescription =>
      'פעולה זו תסיר את הסשן השמור עבור חשבון זה.';

  @override
  String get accountRemoveOnlyDescription =>
      'פעולה זו תסיר את החשבון היחיד השמור במכשיר זה.';

  @override
  String get accountExpired => 'פג תוקף';

  @override
  String accountSessionExpired(String identifier) {
    return 'התוקף של הפעלת המשתמש עבור $identifier פג. אנא התחבר מחדש.';
  }

  @override
  String get accountManageTitle => 'ניהול חשבונות';

  @override
  String get accountSwitchFailed => 'לא ניתן היה להחליף חשבונות. נסה/נסי שוב.';

  @override
  String get profileTabMenuSwitchAccounts => 'החלף חשבונות';

  @override
  String get statusChangeSheetTitle => 'הגדר סטטוס';

  @override
  String get statusOnlineStatusSection => 'סטטוס נוכחות';

  @override
  String get statusOnline => 'מחובר';

  @override
  String get statusIdle => 'לא פעיל';

  @override
  String get statusDnd => 'נא לא להפריע';

  @override
  String get statusInvisible => 'בלתי נראה';

  @override
  String get statusOffline => 'לא מחובר';

  @override
  String get statusUntilIChangeIt => 'עד שאשנה זאת';

  @override
  String get statusDontClear => 'אל תנקה';

  @override
  String get statusFor10Seconds => 'ל-10 שניות';

  @override
  String get statusClearAfter10Seconds => '10 שניות';

  @override
  String get statusClearAfter15Minutes => '15 דקות';

  @override
  String get statusClearAfter30Minutes => '30 דקות';

  @override
  String get statusClearAfter1Hour => 'שעה אחת';

  @override
  String get statusClearAfter3Hours => '3 שעות';

  @override
  String get statusClearAfter4Hours => '4 שעות';

  @override
  String get statusClearAfter8Hours => '8 שעות';

  @override
  String get statusClearAfter24Hours => '24 שעות';

  @override
  String get statusClearAfter3Days => '3 ימים';

  @override
  String get statusDndDescription => 'לא תקבל התראות בשולחן העבודה';

  @override
  String get statusInvisibleDescription => 'תופיע/י במצב לא מקוון';

  @override
  String get customStatusSetTitle => 'הגדר סטטוס מותאם אישית';

  @override
  String get customStatusCurrentHint => 'סטטוס מותאם אישית';

  @override
  String get customStatusClear => 'נקה סטטוס מותאם אישית';

  @override
  String get customStatusPlaceholder => 'מה קורה?';

  @override
  String get customStatusChooseEmoji => 'בחרו אימוג\'י';

  @override
  String get customStatusClearAfter => 'נקה אחרי';

  @override
  String get customStatusSave => 'שמירה';

  @override
  String get accountActive => 'חשבון פעיל';

  @override
  String get signOut => 'התנתקות';

  @override
  String get suspendedPermanentTitle => 'החשבון הושעה לצמיתות';

  @override
  String get suspendedTemporaryTitle => 'החשבון הושעה';

  @override
  String get suspendedPermanentDescription =>
      'החשבון שלך הושעה לצמיתות עקב הפרת תנאי השירות שלנו.';

  @override
  String get suspendedTemporaryDescription =>
      'החשבון שלך הושעה זמנית. תוכל לגשת לחשבונך בתום תקופת ההשעיה.';

  @override
  String get suspendedIssuedAt => 'הונפק';

  @override
  String get suspendedEndsAt => 'נגמר';

  @override
  String get suspendedDuration => 'משך';

  @override
  String get suspendedPermanent => 'קבוע';

  @override
  String get suspendedReason => 'סיבה';

  @override
  String get suspendedAppealDeadline => 'מועד הגשת ערעור';

  @override
  String suspendedDeletionWarning(String date) {
    return 'החשבון שלך מיועד למחיקה בתאריך $date.';
  }

  @override
  String get suspendedRecheck => 'בדוק עדכונים';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'בדוק שוב בעוד $seconds שניות';
  }

  @override
  String get suspendedBackToLogin => 'חזרה לכניסה';

  @override
  String get suspendedAppealTitle => 'ערעור';

  @override
  String get suspendedAppealHint =>
      'הסבירו מדוע יש לשקול מחדש את ההשעיה שלכם (לפחות 50 תווים)...';

  @override
  String get suspendedAppealSubmit => 'שלח ערעור';

  @override
  String get suspendedAppealPending => 'ממתין לבדיקה';

  @override
  String get suspendedAppealAccepted => 'הערעור התקבל';

  @override
  String get suspendedAppealRejected => 'הערעור נדחה';

  @override
  String get suspendedAppealAcceptedDescription =>
      'הערעור שלך התקבל והחשבון שלך הוחזר לפעילות.';

  @override
  String get suspendedSignIn => 'התחבר לחשבונך';

  @override
  String get forgotPasswordTitle => 'שכחת את הסיסמה?';

  @override
  String get forgotPasswordDescription =>
      'הזן את כתובת האימייל שלך ונשלח לך קישור לאיפוס הסיסמה.';

  @override
  String get forgotPasswordSubmit => 'שלח קישור איפוס';

  @override
  String get forgotPasswordSentTitle => 'בדוק את האימייל שלך';

  @override
  String get forgotPasswordSentDescription =>
      'שלחנו הוראות לאיפוס סיסמה לכתובת האימייל שלך. אנא בדוק את תיבת הדואר הנכנס שלך ופעל לפי הקישור כדי לאפס את הסיסמה.';

  @override
  String get forgotPasswordBackToLogin => 'חזור לכניסה';

  @override
  String get resetPasswordTitle => 'הגדרת סיסמה חדשה';

  @override
  String get resetPasswordDescription =>
      'הזן את הסיסמה החדשה שלך למטה כדי להשלים את תהליך האיפוס.';

  @override
  String get resetPasswordNewPassword => 'סיסמה חדשה';

  @override
  String get resetPasswordConfirm => 'אישור סיסמה חדשה';

  @override
  String get resetPasswordSubmit => 'איפוס סיסמה';

  @override
  String get resetPasswordMismatch => 'הסיסמאות אינן תואמות.';

  @override
  String get registerTitle => 'צור חשבון';

  @override
  String get registerDisplayName => 'שם לתצוגה (אופציונלי)';

  @override
  String get registerDisplayNameHint => 'איך כדאי לאנשים לקרוא לך?';

  @override
  String get registerUsername => 'שם משתמש (אופציונלי)';

  @override
  String get registerUsernameHint => 'השאר ריק לשם משתמש אקראי';

  @override
  String get registerUsernameTagHint =>
      'תווית בת 4 ספרות תתווסף אוטומטית כדי להבטיח ייחודיות';

  @override
  String get registerDateOfBirth => 'תאריך לידה';

  @override
  String get registerMonth => 'חודש';

  @override
  String get registerDay => 'יום';

  @override
  String get registerYear => 'שנה';

  @override
  String get registerConsent => 'אני מסכים/ה לתנאי השירות ולהצהרת הפרטיות';

  @override
  String get registerConsentPrefix => 'אני מסכים/ה ל- ';

  @override
  String get registerConsentTerms => 'תנאי השירות';

  @override
  String get registerConsentAnd => ' וגם ';

  @override
  String get registerConsentPrivacy => 'מדיניות פרטיות';

  @override
  String get registerConfirmPassword => 'אשר סיסמה';

  @override
  String get registerSubmit => 'יצירת חשבון';

  @override
  String get registerHaveAccount => 'כבר יש לך חשבון? ';

  @override
  String get registerPendingApproval =>
      'בקשת החשבון שלך ממתינה לאישור. אפשר להתחבר לאחר שמנהל יאשר אותה.';

  @override
  String get registerClosed =>
      'ההרשמה סגורה כרגע. יש להשתמש בקישור הרשמה ממנהל כדי ליצור חשבון.';

  @override
  String get passkeyNoCredentials =>
      'לא נמצאו מפתחות גישה עבור אפליקציה זו. התחבר/י באמצעות דוא\"ל וסיסמה במקום זאת.';

  @override
  String get passkeyDeviceNotSupported => 'ה-Passkeys אינם נתמכים במכשיר זה.';

  @override
  String get passkeyDomainNotAssociated =>
      'לא הוגדרו מפתחות מעבר עבור אפליקציה זו. התחבר באמצעות דוא\"ל וסיסמה במקום זאת.';

  @override
  String get passkeyTimeout => 'אימות מפתח הכניסה פג. נסה שוב.';

  @override
  String get passkeyNotAvailable =>
      'סיסמאות גישה אינן זמינות עבור אפליקציה זו. התחבר באמצעות דוא\"ל וסיסמה במקום זאת.';

  @override
  String get passkeyFailed => 'אימות מפתח כניסה נכשל. אנא נסה שוב.';

  @override
  String get errorUnableToCreateAccount => 'לא ניתן ליצור חשבון. אנא נסה שוב.';

  @override
  String get errorUnableToSignIn => 'לא ניתן להיכנס כרגע. נסה שוב.';

  @override
  String get errorServiceUnavailable =>
      'המופע הזה אינו זמין באופן זמני. נסה שוב בעוד רגע.';

  @override
  String get errorInvalidEmailOrPassword => 'כתובת אימייל או סיסמה שגויים.';

  @override
  String get errorUnableToSendResetLink =>
      'לא ניתן לשלוח קישור לאיפוס. אנא נסה שוב.';

  @override
  String get errorUnableToResetPassword =>
      'לא ניתן לאפס את הסיסמה. אנא נסה שוב.';

  @override
  String get embedInviteJoin => 'הצטרף לקהילה';

  @override
  String get embedInviteGoTo => 'עבור לקהילה';

  @override
  String embedInviteOnline(String count) {
    return '$count מחוברים';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count חברים';
  }

  @override
  String get embedInviteUnknownTitle => 'הזמנה לא ידועה';

  @override
  String get embedInviteUnknownSubtitle => 'נסה לבקש הזמנה חדשה.';

  @override
  String get embedInviteUnavailable => 'ההזמנה אינה זמינה';

  @override
  String get embedInviteJoinGroup => 'הצטרף לקבוצה';

  @override
  String get embedInviteAlreadyJoined => 'כבר הצטרפת';

  @override
  String get embedInviteDisabled => 'ההזמנות מושבתות';

  @override
  String get embedInvitePaused => 'ההזמנות מושהות לקהילה זו.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName זיהה פשיטה אפשרית, ולכן משתמשים חדשים לא יכולים להצטרף כרגע.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'הקהילה הזו השהתה הזמנות. אפשר לנסות שוב מאוחר יותר.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName זיהה פשיטה אפשרית בקהילה זו. ההזמנות מושהות, כך שמשתמשים חדשים אינם יכולים להצטרף כרגע.';
  }

  @override
  String get inviteAcceptTitle => 'הוזמנת להצטרף אל';

  @override
  String get inviteAcceptJoinButton => 'הצטרף לקהילה';

  @override
  String get inviteAcceptGoToButton => 'עבור לקהילה';

  @override
  String get inviteAcceptInvitesPaused => 'הזמנות מושהות';

  @override
  String get inviteAcceptNotFoundTitle => 'ההזמנה לא חוקית';

  @override
  String get inviteAcceptNotFoundDescription =>
      'ההזמנה הזו אולי פגה או לא תקינה.';

  @override
  String get invalidDeepLinkTitle => 'הקישור לא נפתח';

  @override
  String get invalidDeepLinkDescription =>
      'הקישור הזה עלול להיות שבור, זמין רק באינטרנט, או שאין לך גישה אליו. בדוק את הקישור ונסה שוב.';

  @override
  String get invalidDeepLinkGoHomeButton => 'עבור לדף הבית';

  @override
  String get inviteAcceptJoinGroupButton => 'הצטרף לקבוצה';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'הוזמנת להצטרף לשיחת קבוצה על ידי $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'מישהו';

  @override
  String get inviteAcceptEmojiPack => 'חבילת אימוג\'י';

  @override
  String get inviteAcceptStickerPack => 'חבילת מדבקות';

  @override
  String get inviteAcceptInstallEmojiPack => 'התקן חבילת אימוג\'י';

  @override
  String get inviteAcceptInstallStickerPack => 'התקן חבילת מדבקות';

  @override
  String get inviteAcceptPackInstallNote =>
      'קבלת הזמנה זו תתקין את החבילה באופן אוטומטי.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'גישה לערוץ נדחתה';

  @override
  String get channelAccessDeniedDescription =>
      'אין לך גישה לערוץ שבו נשלחה ההודעה הזו.';

  @override
  String get messageJumpLinkNoAccess => 'אין גישה';

  @override
  String get okay => 'אישור';

  @override
  String get embedThemeTitle => 'עיצוב משותף';

  @override
  String get embedThemeSubtitle =>
      'לקוח זה אינו תומך ערכות נושא מותאמות אישית.';

  @override
  String get embedThemeUnavailableButton => 'ערכות נושא אינן זמינות';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (לכל החיים עם $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ימים של $productName',
      one: 'יום אחד של $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count שבועות של $productName',
      one: 'שבוע אחד של $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חודשים של $productName',
      one: 'חודש אחד של $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count שנים של $productName',
      one: 'שנה אחת של $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'מאת $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'יש ללחוץ כדי לממש את המתנה!';

  @override
  String get embedGiftAlreadyRedeemed => 'כבר מומש';

  @override
  String get embedGiftClaimAccountHelp =>
      'כדי לממש את המתנה הזו, עליך לתבוע בעלות על החשבון שלך.';

  @override
  String get embedGiftClaim => 'קבלו את המתנה';

  @override
  String get embedGiftClaimed => 'המתנה נתבעה';

  @override
  String get embedGiftClaimAccount => 'יש לתבוע את החשבון כדי לממש';

  @override
  String get embedGiftUnknownTitle => 'מתנה לא ידועה';

  @override
  String get embedGiftUnknownSubtitle =>
      'קוד המתנה הזה אינו חוקי או שכבר נתבע.';

  @override
  String get embedGiftUnavailable => 'המתנה אינה זמינה';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'קבל את המתנה שלך כדי להפעיל את המנוי שלך ל-$productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'מתנה זו כבר נתבעה.';

  @override
  String get giftAcceptMaybeLater => 'אולי אחר כך';

  @override
  String get giftRedeemedToast => 'המתנה מומשה!';

  @override
  String get giftRedeemInvalidTitle => 'קוד מתנה לא חוקי';

  @override
  String get giftRedeemInvalidMessage =>
      'קוד זה אינו חוקי או שכבר נעשה בו שימוש.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'המתנה כבר מומשה';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'קוד זה כבר מומש.';

  @override
  String get giftRedeemNotFoundTitle => 'המתנה לא נמצאה';

  @override
  String get giftRedeemNotFoundMessage => 'הקוד הזה לא קיים.';

  @override
  String get giftRedeemFailedTitle => 'נכשל בעת מימוש המתנה';

  @override
  String get giftRedeemFailedMessage =>
      'לא ניתן לממש את המתנה הזו. נסה/נסי שוב.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'לא ניתן לממש את המתנה הזו';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'חשבונות Visionary אינם יכולים לממש מתנות Plutonium. העתק את הקישור כדי לשתף אותו עם חבר במקום זאת.';

  @override
  String get giftCopyLink => 'העתקת קישור למתנה';

  @override
  String get privacySettings => 'הגדרות פרטיות';

  @override
  String get privacyDirectMessages => 'הודעות ישירות';

  @override
  String get privacyDirectMessagesDescription =>
      'אפשר הודעות ישירות מחברי קהילה אחרים בקהילה זו';

  @override
  String get privacyBotDirectMessages => 'הודעות ישירות מהבוט';

  @override
  String get privacyBotDirectMessagesDescription =>
      'אפשר לבקש מבוטים מהקהילה הזו לשלוח לך הודעות ישירות';

  @override
  String get privacyMutualDmsDisabled =>
      'מנהלי הקהילה השביתו את האפשרות לקבל הודעות פרטיות מחברים משותפים בלבד בקהילה זו.';

  @override
  String get communityDebug => 'ניפוי באגים בקהילה';

  @override
  String get copiedToClipboard => 'הועתק ללוח הגזירים';

  @override
  String get notificationSettings => 'הגדרות התראות';

  @override
  String notificationMuteGuild(String guildName) {
    return 'להשתיק את $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'השתקת קהילה תמנע הופעת אינדיקטורים של הודעות שלא נקראו והתראות, אלא אם כן הוזכרת';

  @override
  String get notificationCommunitySettings => 'הגדרות התראות קהילה';

  @override
  String get notificationAllMessages => 'כל ההודעות';

  @override
  String get notificationOnlyMentions => 'רק אזכורים';

  @override
  String get notificationNothing => 'כלום';

  @override
  String get notificationSuppressEveryone => 'השתק @everyone ו-@here';

  @override
  String get notificationSuppressRoles => 'השתק כל אזכורי התפקידים';

  @override
  String get notificationMobilePush => 'התראות בדחיפה לנייד';

  @override
  String get notificationOverrides => 'הגדרות התראות';

  @override
  String get notificationSelectChannel => 'בחרו ערוץ או קטגוריה';

  @override
  String get notificationOnlyAtMentions => 'רק @אזכורים';

  @override
  String get notificationMuteChannel => 'השתק ערוץ';

  @override
  String get notificationUnmuteChannel => 'בטל השתקת ערוץ';

  @override
  String get notificationUseCategoryDefault => 'השתמש בברירת מחדל של הקטגוריה';

  @override
  String get notificationUseCommunityDefault =>
      'השתמש בהגדרות ברירת המחדל של הקהילה';

  @override
  String get notificationNoCategory => 'אין קטגוריה';

  @override
  String get dmMarkAsRead => 'סמן כנקרא';

  @override
  String get dmMuteConversation => 'השתקת הודעה פרטית';

  @override
  String get dmUnmuteConversation => 'בטל השתקה של ההתכתבות';

  @override
  String get dmPinDm => 'הצמד הודעה פרטית';

  @override
  String get dmUnpinDm => 'הסר הצמדה מהודעה פרטית';

  @override
  String get dmAlwaysShowInSidebar => 'הצג תמיד בסרגל הצד';

  @override
  String get dmRemoveFromAlwaysShown => 'הסר מהמוצגים תמיד';

  @override
  String get dmCloseDm => 'סגירת צ\'אט';

  @override
  String get dmCloseDmConfirmTitle => 'סגירת צ\'אט';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'האם אתה בטוח שברצונך לסגור את ההודעה הישירה עם $username? תמיד תוכל לפתוח אותה מחדש מאוחר יותר.';
  }

  @override
  String get dmDeleteMyMessagesTitle => 'למחוק את ההודעות שלך בשיחה זו?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'פעולה זו תמחק לצמיתות כל הודעה ששלחת אי פעם בשיחה זו. לא ניתן לבטל פעולה זו.';

  @override
  String get dmCopyChannelId => 'העתק את מזהה הערוץ';

  @override
  String get dmChannelIdCopied => 'מזהה הערוץ הועתק';

  @override
  String get dmCopyUserId => 'העתק מזהה משתמש';

  @override
  String get dmUserIdCopied => 'מזהה משתמש הועתק';

  @override
  String get dmViewProfile => 'הצג פרופיל';

  @override
  String get dmVoiceCall => 'התחל שיחת קול';

  @override
  String get incomingVoiceCallTitle => 'שיחת קול נכנסת';

  @override
  String get incomingVoiceCallAccept => 'קבל';

  @override
  String get incomingVoiceCallDecline => 'דחה';

  @override
  String get incomingVoiceCallLabel => 'שיחה נכנסת';

  @override
  String get incomingVoiceCallIgnore => 'התעלם';

  @override
  String get directVoiceCallNotEligible =>
      'לא ניתן להתחיל שיחה זו כעת. נסה שוב בעוד רגע.';

  @override
  String get voiceJoinCallFailed =>
      'לא הצלחנו להתחבר לשיחה זו. בדוק את החיבור שלך ונסה שוב.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'לא ניתן היה להצטרף לשיחה זו. בדוק את החיבור שלך ונסה שוב.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'לא ניתן לעדכן שיחה זו בשרת. בדוק את החיבור שלך ונסה שוב.';

  @override
  String get dmAddNote => 'הוסף הערה';

  @override
  String get dmEditGroup => 'עריכת קבוצה';

  @override
  String get dmInviteToCommunity => 'הזמן לקהילה';

  @override
  String get dmBlock => 'חסימה';

  @override
  String get dmLeaveGroup => 'עזוב קבוצה';

  @override
  String get dmNoCommunitiesAvailable => 'לא נמצאו קהילות זמינות';

  @override
  String dmGroupMemberCount(int count) {
    return '$count חברים';
  }

  @override
  String get dmMuteFor15Min => 'ל-15 דקות';

  @override
  String get dmMuteFor30Min => 'ל-30 דקות';

  @override
  String get dmMuteFor1Hour => 'לשעה';

  @override
  String get dmMuteFor3Hours => 'ל-3 שעות';

  @override
  String get dmMuteFor4Hours => 'ל-4 שעות';

  @override
  String get dmMuteFor8Hours => 'ל-8 שעות';

  @override
  String get dmMuteFor24Hours => 'ל-24 שעות';

  @override
  String get dmMuteFor3Days => 'ל-3 ימים';

  @override
  String get dmMuteForever => 'עד שאפעיל מחדש';

  @override
  String get dmPinGroupDm => 'נעץ שיחת קבוצה';

  @override
  String get dmUnpinGroupDm => 'בטל הצמדת שיחת קבוצה';

  @override
  String get dmUnnamedGroup => 'קבוצה ללא שם';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'הקבוצה של $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'סימון צ\'אט כמועדף';

  @override
  String get dmUnfavoriteDm => 'הסר ממועדפים';

  @override
  String get dmFavoriteGroupDm => 'סימון שיחת קבוצה מועדפת';

  @override
  String get dmUnfavoriteGroupDm => 'הסר מועדפים מהודעה קבוצתית';

  @override
  String get dmChangeFriendNickname => 'שנה כינוי לחבר';

  @override
  String get dmRemoveFriend => 'הסר חבר';

  @override
  String get dmAddFriend => 'הוסף חבר';

  @override
  String get dmAcceptFriendRequest => 'קבל בקשת חבר';

  @override
  String get dmIgnoreFriendRequest => 'התעלם מבקשת חבר';

  @override
  String get dmFriendRequestSent => 'בקשת חבר נשלחה';

  @override
  String get dmUnblock => 'בטל חסימה';

  @override
  String get dmDebugUser => 'בדוק משתמש';

  @override
  String get dmDebugChannel => 'בדוק ערוץ';

  @override
  String get dmDebugCategory => 'דיבאג קטגוריה';

  @override
  String get dmPinned => 'הודעה אישית מוצמדת';

  @override
  String get dmUnpinned => 'הודעה פרטית לא מוצמדת';

  @override
  String get dmMuted => 'הודעה מושתקת';

  @override
  String get dmUnmuted => 'העברת ההתראות מחדש';

  @override
  String get dmRemoveFriendConfirmTitle => 'הסר חבר';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'האם אתה בטוח שברצונך להסיר את $username מחבריך?';
  }

  @override
  String get dmBlockConfirmTitle => 'חסום משתמש';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'האם אתה בטוח שברצונך לחסום את $username? הם לא יוכלו לשלוח לך הודעות או בקשות חבר.';
  }

  @override
  String get dmFriendRequestSentToast => 'בקשת חברות נשלחה';

  @override
  String get dmFriendRequestFailed => 'נכשל שליחת בקשת חבר';

  @override
  String get dmAcceptFriendRequestFailed => 'נכשלת קבלת בקשת חבר';

  @override
  String get dmRemoveFriendFailed => 'נכשל בהסרת חבר';

  @override
  String get dmBlockFailed => 'נכשל חסימת משתמש';

  @override
  String get dmUnblockFailed => 'נכשל חסימת המשתמש';

  @override
  String get dmIgnoreFriendRequestFailed => 'נכשל בהתעלמות בקשת חבר';

  @override
  String get dmAddFriends => 'הוספת חברים';

  @override
  String get addFriendSheetTitle => 'הוסף חבר';

  @override
  String get addFriendUsernameHint => 'שם משתמש#0000';

  @override
  String get addFriendUsernameLabel => 'שם המשתמש של החבר/ה';

  @override
  String get addFriendSendRequest => 'שלח/י בקשה';

  @override
  String get addFriendNoUserFound => 'לא נמצא משתמש עם שם המשתמש הזה.';

  @override
  String get addFriendInvalidUsername => 'הזן שם משתמש תקין (שם משתמש#0000).';

  @override
  String get addFriendOutgoingSuccess => 'בקשת חברות נשלחה';

  @override
  String get addFriendClaimTitle => 'תבעו את החשבון שלכם';

  @override
  String get addFriendClaimDescription =>
      'תבעו בעלות על החשבון שלכם כדי לשלוח בקשות חברות.';

  @override
  String get addFriendVerifyTitle => 'אמתו את כתובת האימייל שלכם';

  @override
  String get addFriendVerifyDescription =>
      'עליך לאמת את כתובת האימייל שלך לפני שתוכל לשלוח בקשות חברות.';

  @override
  String get addFriendVerifyEmail => 'אימות אימייל';

  @override
  String addFriendIncomingRequests(int count) {
    return 'בקשות חברות נכנסות ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'בקשות חברות יוצאות ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'בקשת חברות נכנסת';

  @override
  String get addFriendOutgoingStatus => 'בקשת חברות נשלחה';

  @override
  String get addFriendViewProfile => 'הצגת פרופיל';

  @override
  String get addFriendAccept => 'קבל';

  @override
  String get addFriendIgnore => 'התעלם';

  @override
  String get addFriendAcceptTitle => 'אישור בקשת חברות';

  @override
  String get addFriendIgnoreTitle => 'התעלם מבקשת חברות';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'לאשר את בקשת החברות מ$userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'להתעלם מבקשת החברות מ- $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'ביטול הבקשה';

  @override
  String get addFriendCancelRequestFailed =>
      'לא ניתן לבטל את בקשת החברות. יש לנסות שוב.';

  @override
  String get addFriendNotAcceptingRequests => 'הם לא מקבלים בקשות חברות כרגע.';

  @override
  String get addFriendUnblockFirst =>
      'בטל את החסימה שלהם קודם כדי לשלוח בקשת חברות.';

  @override
  String get addFriendCannotSendToSelf => 'אינך יכול/ה לשלוח לעצמך בקשת חברות.';

  @override
  String get addFriendAlreadyFriends => 'אתם כבר חברים.';

  @override
  String get addFriendClaimToSend =>
      'יש לסיים את ההרשמה כדי לשלוח בקשות חברות.';

  @override
  String get addFriendVerifyToSend =>
      'יש לאמת את כתובת האימייל שלך לפני שליחת בקשות חברות.';

  @override
  String get addFriendFriendsListFull =>
      'רשימת החברים שלך מלאה, או שלהם מלאה. הסר מישהו ונסה שוב.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'מערכת';

  @override
  String get emojiSearchPlaceholder => 'מצאו את האימוג\'י המושלם';

  @override
  String get emojiSearchEmpty => 'לא נמצאו אימוג\'ים התואמים לחיפוש שלך';

  @override
  String get emojiAutocompleteDefaultLabel => 'אמוג\'י ברירת מחדל';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'זהו אימוג\'י ברירת מחדל ב- $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'האימוג\'י הזה מגיע מהקהילה הזו. אפשר להשתמש בו בכל מקום.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'זהו אימוג\'י מותאם אישית מקהילה.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'זהו אימוג\'י מותאם אישית מקהילה. בקש/י מהיוצר/ת הזמנה כדי להשתמש באימוג\'י זה.';

  @override
  String get emojiInfoFromHeader => 'האימוג\'י הזה מתוך';

  @override
  String get emojiInfoDiscoverableCommunity => 'קהילה ניתנת לגילוי';

  @override
  String get emojiInfoPrivateCommunity => 'קהילה פרטית';

  @override
  String get emojiInfoVerifiedCommunity => 'קהילה מאומתת';

  @override
  String get emojiInfoAddToFavorites => 'הוסף למועדפים';

  @override
  String get emojiInfoRemoveFromFavorites => 'הסר ממועדפים';

  @override
  String get emojiFrequentlyUsed => 'נפוצים';

  @override
  String get emojiTabGifs => 'קובצי GIF';

  @override
  String get emojiTabMedia => 'מדיה';

  @override
  String get emojiTabStickers => 'מדבקות';

  @override
  String get emojiTabEmojis => 'אמוג\'יז';

  @override
  String get gifPickerSearch => 'חפש GIFים';

  @override
  String get gifPickerSearchKlipy => 'חפש ב-KLIPY';

  @override
  String get gifPickerSearchTenor => 'חפש ב-Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'מועדפים';

  @override
  String get gifPickerFavoritesEmptyTitle => 'אין עדיין קובצי GIF מועדפים';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'סמנו GIF בכוכב כדי לראות אותו כאן.';

  @override
  String get gifPickerTrending => 'קובצי GIF פופולריים';

  @override
  String get gifPickerNoResultsTitle => 'אין תוצאות חיפוש';

  @override
  String get gifPickerNoResultsDescription => 'נסה מונח חיפוש אחר';

  @override
  String get gifPickerLoadFailedTitle => 'לא ניתן היה לטעון GIFים';

  @override
  String get gifPickerLoadFailedBody => 'בדקו את החיבור ונסו שוב.';

  @override
  String get emojiCategoryPeople => 'אנשים';

  @override
  String get emojiCategoryNature => 'טבע';

  @override
  String get emojiCategoryFood => 'אוכל ושתייה';

  @override
  String get emojiCategoryActivity => 'פעילויות';

  @override
  String get emojiCategoryTravel => 'נסיעות ומקומות';

  @override
  String get emojiCategoryObjects => 'אובייקטים';

  @override
  String get emojiCategorySymbols => 'סמלים';

  @override
  String get emojiCategoryFlags => 'דגלים';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'פתח $emojiCount מתוך $communityCount עם Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'קבל Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'אל תציג זאת שוב';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count אימוג\'ים מותאמים אישית',
      one: 'אימוג\'י מותאם אישית אחד',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קהילות',
      one: 'קהילה אחת',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'אזהרת קישור חיצוני';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'אתה עומד לעזוב את $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'קישורים חיצוניים עלולים להיות מסוכנים. אנא היזהר.';

  @override
  String get externalLinkWarningDestinationUrl => 'כתובת היעד:';

  @override
  String get externalLinksSectionTitle => 'קישורים חיצוניים';

  @override
  String get externalLinksSectionDescription =>
      'הגדר כיצד יטופלו אזהרות לגבי קישורים חיצוניים.';

  @override
  String get externalLinkWarningTrustPrefix => 'תמיד לסמוך על ';

  @override
  String get externalLinkWarningTrustSuffix => ' — דלג על אזהרה זו בפעם הבאה';

  @override
  String get externalLinkVisitSite => 'בקר באתר';

  @override
  String get externalLinkTrustAllLabel => 'אפשר את כל הקישורים החיצוניים';

  @override
  String get externalLinkStripTrackingLabel => 'הסרת פרמטרי מעקב מכתובות URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'הסרה אוטומטית של פרמטרי מעקב (כמו utm_source,‏ fbclid,‏ gclid) מכתובות URL בהודעות שאתם שולחים. הקישור מנוקה לפני שהוא מגיע למישהו אחר.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'לאשר את כל הקישורים החיצוניים?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'פעולה זו תאפשר אמון בכל הקישורים החיצוניים ותדלג על האזהרה עבור כל דומיין. הדומיינים המהימנים הקיימים שלך יוחלפו. אפשרות זו פחות מאובטחת.';

  @override
  String get externalLinkTrustAllConfirmAction => 'אמון בכל';

  @override
  String get externalLinkStopTrustingAllTitle => 'להפסיק לבטוח בכל הקישורים?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'אזהרות על קישורים חיצוניים יוצגו שוב. יהיה עליך להוסיף דומיינים מהימנים באופן פרטני.';

  @override
  String get externalLinkStopTrustingAllAction => 'בטל אמון בכל';

  @override
  String get externalLinkTrustedAllDescription =>
      'כל הקישורים החיצוניים מהימנים. אזהרות לא יוצגו.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'יש לך $count דומיין(ים) מהימנים. הוסף עוד על ידי סימון התיבה בעת ביקור בקישורים חיצוניים.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'כאשר מופעל, לא יוצגו אזהרות לגבי קישורים חיצוניים. זה פחות מאובטח.';

  @override
  String get imageFileTooLarge =>
      'קובץ התמונה גדול מדי. בחר קובץ שגודלו קטן מ-10MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'אווטארים מונפשים דורשים Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'באנרים מונפשים דורשים Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF מונפש אינו נתמך';

  @override
  String get animatedAvifNotSupportedBody =>
      'עדיין לא ניתן לחתוך או לסובב קבצי AVIF מונפשים. אם תמשיך, הקובץ יועלה בצורתו המקורית.';

  @override
  String get uploadAsIs => 'העלאה כפי שהיא';

  @override
  String get croppingAnimatedNotSupported =>
      'לא ניתן לחתוך תמונות מונפשות כרגע. נעשה שימוש בהעלאה המקורית.';

  @override
  String get cropAvatar => 'חתוך תמונה';

  @override
  String get cropBanner => 'חתוך באנר';

  @override
  String get skip => 'דלג';

  @override
  String get crop => 'חתוך';

  @override
  String get cropTouchHint => 'צבוט כדי להגדיל, גרור כדי למקם מחדש';

  @override
  String get cropMouseHint => 'גרור פינות לשינוי גודל, גרור בפנים להזזה';

  @override
  String get changeYourFluxerTag => 'שינוי שם המשתמש שלך';

  @override
  String get fluxerTagInputLabel => 'שם משתמש';

  @override
  String get fluxerTagDescriptionBase =>
      'שמות משתמש יכולים להכיל רק אותיות (a-z, A-Z), מספרים (0-9) וקווים תחתונים. שמות משתמש אינם תלויי רישיות.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'שמות משתמש יכולים להכיל רק אותיות (a-z, A-Z), מספרים (0-9) וקווים תחתונים. שמות משתמש אינם תלויי רישיות. ניתן לבחור כל תג זמין בן 4 ספרות מ-#0000 עד #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'שמות משתמש יכולים להכיל רק אותיות (a-z, A-Z), מספרים (0-9) וקווים תחתונים. שמות משתמש אינם תלויים באותיות רישיות. ניתן לבחור כל תג זמין בן 4 ספרות מ-#0001 עד #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'בין $min ל-$max תווים';
  }

  @override
  String get validationAllowedChars =>
      'אותיות (a-z, A-Z), מספרים (0-9) וקווים תחתונים (_) בלבד';

  @override
  String get discriminatorPremiumTooltip =>
      'קבלו Plutonium כדי להתאים אישית את התג שלכם או שמרו אותו בעת שינוי שם המשתמש שלכם';

  @override
  String get fluxerTagAlreadyTaken => 'השם כבר תפוס';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'שם המשתמש $username#$discriminator כבר תפוס. המשך יגלגל מחדש את הדיסקרימינטור שלך באופן אוטומטי.';
  }

  @override
  String get customTagIsTemporary => 'התגיה מותאמת אישית זמנית';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'התג המותאם אישית בן 4 ספרות שלך זמין רק כל עוד המנוי שלך ל-Plutonium פעיל. כאשר המנוי שלך יפוג בתאריך $date, התג שלך יוחזר למספר אקראי לאחר תקופת חסד של 3 ימים.';
  }

  @override
  String get customTagTemporaryBody =>
      'התג המותאם אישית שלך בן 4 ספרות זמין רק כל עוד המנוי שלך ל-Plutonium פעיל. כאשר המנוי שלך יפוג, התג שלך יוחזר למספר שמוקצה באופן אקראי לאחר תקופת חסד של 3 ימים.';

  @override
  String get iUnderstandContinue => 'אני מבין/ה, המשך';

  @override
  String get premiumWarningPendingDiscriminator =>
      'אם תשמור שם משתמש זה, התגית המותאמת אישית שלך בת 4 ספרות תחזור למספר אקראי כשיסתיים המנוי שלך ל־Plutonium. אם המנוי שלך לא יתחדש, יהיו לך 3 ימי חסד לפני שהתגית תשתנה.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'התג המותאם אישית שלך בן 4 ספרות (#$discriminator) פעיל כל עוד המנוי שלך ל-Plutonium פעיל. אם המנוי שלך יסתיים או לא יחודש לאחר תקופת חסד של 3 ימים, התג שלך יוחזר למספר אקראי.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'התאם אישית את התג שלך בן 4 ספרות או שמור אותו בעת שינוי שם המשתמש שלך';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'תקופת הניסיון שלך ב-Plutonium תפוג בתאריך $date. שדרג כדי לשמור על התג המותאם אישית שלך ולהרוויח תג בפרופיל שלך.';
  }

  @override
  String get premiumTrialActive =>
      'אתה משתמש בניסיון Plutonium. שדרג כדי לשמור על התג המותאם אישית שלך ולהרוויח תג בפרופיל שלך.';

  @override
  String get fluxerTagUpdated => 'שם המשתמש עודכן';

  @override
  String get fluxerTagUpdateFailed => 'נכשל עדכון שם המשתמש. אנא נסה שוב.';

  @override
  String get continueAction => 'המשך';

  @override
  String get profileCustomizationTitle => 'התאמה אישית של פרופיל';

  @override
  String get profileCustomizationDescription =>
      'ערוך את מראה הפרופיל שלך וראה תצוגה מקדימה';

  @override
  String get usernameLabel => 'שם משתמש';

  @override
  String get claimAccountToChangeFluxerTag =>
      'יש לאמת את החשבון כדי לשנות את שם המשתמש';

  @override
  String get changeFluxerTag => 'שינוי שם משתמש';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'התאם אישית את תג ה-4 ספרות שלך (#$discriminator) כרצונך עם Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'שנה את שם המשתמש והתג בן 4 הספרות שלך';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'התג המותאם אישית שלך (#$discriminator) קשור למנוי ה-Plutonium שלך ויוחזר לתג אקראי אם יפוג.';
  }

  @override
  String get displayNameLabel => 'שם לתצוגה';

  @override
  String get pronounsLabel => 'כינויי גוף';

  @override
  String get avatarLabel => 'תמונת פרופיל';

  @override
  String get changeAvatar => 'שנה תמונת פרופיל';

  @override
  String get removeAvatar => 'הסר תמונת פרופיל';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. מקסימום 10MB. מומלץ: 512×512px';

  @override
  String get bannerLabel => 'באנר';

  @override
  String get changeBanner => 'שנה תמונת נושא';

  @override
  String get removeBanner => 'הסר באנר';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. מקסימום 10MB. מינימום: 960×540px (יחס 16:9)';

  @override
  String get accentColorLabel => 'צבע הדגשה';

  @override
  String get accentColorDescription =>
      'התאמה אישית של צבע המסגרת והבאנר בפרופיל שלך';

  @override
  String get aboutMeLabel => 'אודותיי';

  @override
  String get aboutMeHelperText => 'אפשר להשתמש בקישורים, אימוג\'י ו-Markdown.';

  @override
  String get emojiPickerTitle => 'אימוג\'י';

  @override
  String get plutoniumBadgePrivacyTitle => 'פרטיות תג ה-Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'קבע כיצד תג ה-Plutonium שלך יוצג לאחרים';

  @override
  String get hidePlutoniumBadgeLabel => 'הסתר את תגית Plutonium לחלוטין';

  @override
  String get hidePlutoniumBadgeDescription =>
      'הסתר את תג ה-Plutonium שלך לחלוטין ממשתמשים אחרים';

  @override
  String get hidePlutoniumPurchaseDate => 'הסתר תאריך רכישת Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'הסתר תאריך רכישת Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'הסר מתי קנית לראשונה Plutonium מהתג שלך';

  @override
  String get maskVisionaryAsSubscription => 'הסתרת Visionary כמנוי';

  @override
  String get maskVisionaryDescription =>
      'הצג את Visionary כמנוי רגיל במקום זאת';

  @override
  String get hideVisionaryIdBadge => 'הסתר תג Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'הסתר תג מזהה Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'הסר את תג ה-Visionary ID שלך';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'אתם במנוי ניסיון של Plutonium — המנוי שלכם יתחיל בתאריך $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'המנוי שלך יתחיל אוטומטית כשתסתיים תקופת הניסיון. אין צורך בפעולה כלשהי.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'אתם משתמשים בגרסת ניסיון של Plutonium שתפוג בתאריך $date';
  }

  @override
  String get premiumTrialActiveProfile => 'אתה בשירות Plutonium ללא תשלום';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. מקסימום 10MB. מומלץ: 512×512px. אווטארים מונפשים (GIF) דורשים Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'התאם אישית את הפרופיל שלך עם תמונת באנר סטטית או מונפשת כדי לגרום לו לבלוט.';

  @override
  String get getPlutonium => 'קבל Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'רכישות מתוך האפליקציה עדיין אינן זמינות בפלטפורמה זו. הישארו מעודכנים — בקרוב!';

  @override
  String get profilePreviewLabel => 'תצוגה מקדימה';

  @override
  String get profilePreviewMessage => 'הודעה';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'חבר ב-$productName מאז';
  }

  @override
  String get unclaimedAccountTitle => 'חשבון לא מאושר';

  @override
  String get unclaimedAccountDescription =>
      'החשבון שלך עדיין לא נתבע. ללא כתובת אימייל וסיסמה, אתה עלול לאבד גישה. תבע את החשבון שלך כעת כדי לאבטח אותו.';

  @override
  String get claimAccount => 'קח בעלות על החשבון';

  @override
  String get profileTypeLabel => 'סוג פרופיל';

  @override
  String get profileTypeGlobal => 'פרופיל גלובלי';

  @override
  String get profileTypeGuildDescription =>
      'אתה עורך את הפרופיל שלך עבור הקהילה הזו. פרופיל זה יהיה גלוי רק בקהילה זו וידרוס את הפרופיל הגלובלי שלך.';

  @override
  String get communityNicknameLabel => 'כינוי בקהילה';

  @override
  String get perGuildPremiumUpsellText =>
      'התאמה אישית של האווטאר, הבאנר, צבע ההדגשה והביוגרפיה שלך עבור קהילות בודדות דורשת Plutonium. כינוי קהילה וכינויי גוף זמינים בחינם לכולם.';

  @override
  String get avatarModeInherit => 'השתמש בפרופיל הגלובלי';

  @override
  String get avatarModeCustom => 'השתמש בתמונה מותאמת אישית';

  @override
  String get avatarModeUnset => 'אל תציג';

  @override
  String get profileSavedToast => 'הפרופיל עודכן';

  @override
  String get profileEditButton => 'ערוך פרופיל';

  @override
  String get profileNoteLabel => 'הערה';

  @override
  String get profileNoteVisibility => '(גלוי לך בלבד)';

  @override
  String get profileNoteEmpty => 'עדיין אין הערה.';

  @override
  String get sudoTitle => 'אמת את זהותך';

  @override
  String get sudoDescription => 'פעולה זו דורשת אימות כדי להמשיך.';

  @override
  String get sudoAuthenticatorCode => 'קוד אימות דו-שלבי';

  @override
  String get sudoMethodPassword => 'סיסמה';

  @override
  String get sudoMethodTotp => 'אימות דו-שלבי';

  @override
  String get sudoVerificationFailed => 'האימות נכשל. אנא נסה שוב.';

  @override
  String get securityAccountTitle => 'חשבון';

  @override
  String get securityAccountDescription =>
      'נהל את האימייל, הסיסמה והגדרות החשבון שלך';

  @override
  String get securitySectionTitle => 'אבטחה';

  @override
  String get securitySectionDescription =>
      'אבטח את החשבון שלך באמצעות אימות דו-שלבי ומפתחות גישה';

  @override
  String get securityLoginEmailSectionTitle => 'הגדרות אימייל';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'נהל את כתובת האימייל שבה אתה משתמש כדי להיכנס ל-$productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'כתובת דוא\"ל';

  @override
  String get securityLoginNoEmailSet => 'לא הוגדרה כתובת אימייל';

  @override
  String get securityLoginChangeEmail => 'שנה אימייל';

  @override
  String get securityLoginAddEmail => 'הוסף אימייל';

  @override
  String get securityLoginReveal => 'הצגה';

  @override
  String get securityLoginHide => 'הסתר';

  @override
  String get securityLoginPasswordSectionTitle => 'סיסמה';

  @override
  String get securityLoginPasswordSectionDescription =>
      'שנה את הסיסמה שלך כדי לשמור על אבטחת החשבון שלך';

  @override
  String get securityLoginCurrentPasswordLabel => 'הסיסמה הנוכחית';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'שונה לאחרונה: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'שונה לאחרונה: מעולם לא';

  @override
  String get securityLoginNoPasswordSet => 'לא הוגדרה סיסמה';

  @override
  String get securityLoginChangePassword => 'שנה סיסמה';

  @override
  String get securityLoginSetPassword => 'הגדר סיסמה';

  @override
  String get passwordChangeTitle => 'שנה סיסמה';

  @override
  String get passwordChangeIntroDescription =>
      'נשלח קוד אימות לכתובת הדוא\"ל שלך כדי לאשר את זהותך לפני שינוי הסיסמה.';

  @override
  String get passwordChangeStart => 'התחלה';

  @override
  String get passwordChangeVerifyTitle => 'אמת את הדוא\"ל שלך';

  @override
  String get passwordChangeVerifyDescription =>
      'הזן את קוד האימות שנשלח לכתובת הדוא\"ל שלך.';

  @override
  String get passwordChangeVerificationCode => 'קוד אימות';

  @override
  String get passwordChangeVerify => 'אימות';

  @override
  String get passwordChangeNewPasswordTitle => 'הגדר סיסמה חדשה';

  @override
  String get passwordChangeNewPasswordDescription =>
      'הזן את הסיסמה החדשה שלך למטה.';

  @override
  String get passwordChangeNewPassword => 'סיסמה חדשה';

  @override
  String get passwordChangeConfirmPassword => 'אשר סיסמה חדשה';

  @override
  String get passwordChangeSubmit => 'שנה סיסמה';

  @override
  String get passwordChangeSuccess => 'הסיסמה שונתה';

  @override
  String get passwordChangePasswordsDoNotMatch => 'הסיסמאות אינן תואמות';

  @override
  String get passwordChangeInvalidCode => 'קוד לא חוקי או שפג תוקפו';

  @override
  String get emailChangeTitle => 'שנה אימייל';

  @override
  String get emailChangeIntroDescription =>
      'נשלח קודי אימות כדי לוודא את זהותך לפני שינוי כתובת הדוא\"ל שלך.';

  @override
  String get emailChangeStart => 'התחלה';

  @override
  String get emailChangeVerifyOriginalTitle => 'אמת את כתובת הדוא\"ל הנוכחית';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'הזן את קוד האימות שנשלח לכתובת הדוא\"ל הנוכחית שלך.';

  @override
  String get emailChangeNewEmailTitle => 'הזן דוא\"ל חדש';

  @override
  String get emailChangeNewEmailDescription =>
      'הזן את כתובת הדוא\"ל החדשה שבה תרצה להשתמש.';

  @override
  String get emailChangeNewEmailLabel => 'דוא״ל חדש';

  @override
  String get emailChangeNewEmailSubmit => 'שלח קוד אימות';

  @override
  String get emailChangeVerifyNewTitle => 'אמת אימייל חדש';

  @override
  String get emailChangeVerifyNewDescription =>
      'הזן את קוד האימות שנשלח לכתובת הדוא\"ל החדשה שלך.';

  @override
  String get emailChangeSuccess => 'האימייל שונה';

  @override
  String get emailChangeInvalidCode => 'קוד לא חוקי או שפג תוקפו';

  @override
  String get resend => 'שלח שוב';

  @override
  String resendCountdown(int seconds) {
    return 'שלח שוב ($seconds שניות)';
  }

  @override
  String get verificationCode => 'קוד אימות';

  @override
  String get verify => 'אימות';

  @override
  String get enable => 'הפעלה';

  @override
  String get disable => 'ביטול';

  @override
  String get delete => 'מחק';

  @override
  String get save => 'שמירה';

  @override
  String get securityTfaSectionTitle => 'אימות דו-שלבי';

  @override
  String get securityTfaSectionDescription => 'הוסף שכבת אבטחה נוספת לחשבונך';

  @override
  String get securityTfaAuthenticatorApp => 'אפליקציית אימות';

  @override
  String get securityTfaAuthenticatorEnabled => 'אימות דו-שלבי מופעל';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'השתמש/י באפליקציית אימות כדי ליצור קודים לאימות דו-שלבי';

  @override
  String get securityTfaBackupCodes => 'קודי גיבוי';

  @override
  String get securityTfaBackupCodesDescription =>
      'הצגה וניהול של קודי הגיבוי שלך לשחזור החשבון';

  @override
  String get securityTfaViewCodes => 'הצג קודים';

  @override
  String get securityPasskeysSectionTitle => 'מפתחות גישה';

  @override
  String get securityPasskeysSectionDescription =>
      'השתמשו במפתחות גישה לכניסה ללא סיסמה ולאימות דו-שלבי';

  @override
  String get securityPasskeysRegistered => 'מפתחות גישה רשומים';

  @override
  String get securityPasskeysNone => 'לא נרשמו מפתחות גישה';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'מפתחות כניסה',
      one: 'מפתח כניסה',
    );
    return '$count $_temp0 רשומים (מקסימום 10)';
  }

  @override
  String get securityPasskeysAdd => 'הוסף מפתח גישה';

  @override
  String securityPasskeysAdded(String date) {
    return 'נוסף: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'בשימוש אחרון: $date';
  }

  @override
  String get securityPasskeysRename => 'שנה שם';

  @override
  String get securityPasskeysDeleteTitle => 'מחק מפתח גישה';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'האם אתה בטוח שברצונך למחוק את מפתח הגישה \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'שם למפתח גישה';

  @override
  String get securityPasskeyNameLabel => 'שם מפתח הגישה';

  @override
  String get securityPasskeyNameHint => 'לדוגמה, YubiKey, iPhone, מחשב עבודה';

  @override
  String get securityPhoneSectionTitle => 'מספר טלפון';

  @override
  String get securityPhoneSectionDescription => 'נהל את מספר הטלפון שלך.';

  @override
  String get securityPhoneLabel => 'מספר טלפון';

  @override
  String get securityPhoneNone => 'לא הוספת מספר טלפון.';

  @override
  String get securityPhoneAdd => 'הוסף טלפון';

  @override
  String get securityPhoneRemove => 'הסר';

  @override
  String get securityPhoneRemoveTitle => 'הסרת מספר טלפון';

  @override
  String get securityPhoneRemoveDescription =>
      'האם אתה בטוח שברצונך להסיר את מספר הטלפון שלך?';

  @override
  String get securityPhoneRemoved => 'מספר הטלפון הוסר';

  @override
  String get securityClaimTitle => 'תכונות אבטחה';

  @override
  String get securityClaimDescription =>
      'תבעו בעלות על החשבון שלכם כדי לגשת לתכונות אבטחה כמו אימות דו-שלבי ומפתחות גישה.';

  @override
  String get securityVerifyEmailRequired =>
      'עליך לאמת את כתובת הדוא\"ל שלך לפני שתוכל להגדיר אימות דו-שלבי, מפתחות גישה או אימות SMS.';

  @override
  String get totpEnableTitle => 'הגדרת אפליקציית אימות';

  @override
  String get totpEnableDescription =>
      'סרוק את קוד ה-QR באמצעות אפליקציית האימות שלך כדי ליצור קודים לאימות דו-שלבי.';

  @override
  String get totpEnableCodeLabel => 'קוד';

  @override
  String get totpEnableCodeHint =>
      'הזן את הקוד בן 6 הספרות מאפליקציית האימות שלך';

  @override
  String get totpEnableSuccess => 'אימות דו-שלבי הופעל';

  @override
  String get totpDisableTitle => 'הסרת אפליקציית אימות';

  @override
  String get totpDisableDescription =>
      'הזן את הקוד בן 6 הספרות מאפליקציית האימות שלך כדי לבטל את האימות הדו-שלבי.';

  @override
  String get totpDisableSuccess => 'אימות דו-שלבי מושבת';

  @override
  String get backupCodesTitle => 'קודי גיבוי';

  @override
  String get backupCodesWarning =>
      'אם תאבד גישה לאפליקציית האימות שלך ולא יהיו לך הקודים האלה, תינעל לצמיתות מחוץ לחשבונך. הורד או העתק אותם כעת ואחסן אותם במקום בטוח.';

  @override
  String get backupCodesDownload => 'הורדה';

  @override
  String get backupCodesCopy => 'העתקה';

  @override
  String get backupCodesCopied => 'קודי הגיבוי הועתקו ללוח';

  @override
  String get backupCodesAcknowledge =>
      'הורדתי או העתקתי את קודי הגיבוי שלי ושמרתי אותם במקום בטוח.';

  @override
  String get backupCodesDone => 'בוצע';

  @override
  String get backupCodesViewTitle => 'הצג קודי גיבוי';

  @override
  String get backupCodesViewDescription =>
      'ייתכן שתידרש אימות לפני הצגת קודי הגיבוי שלך.';

  @override
  String get phoneAddTitle => 'הוספת מספר טלפון';

  @override
  String get phoneAddLabel => 'מספר טלפון';

  @override
  String get phoneAddHint => 'הזן את מספר הטלפון שלך';

  @override
  String get phoneAddFooter =>
      'נשלח קוד SMS כשיגיע. המספר שלך לא מקושר לחשבון שלך. אנו שומרים רק סימון מוצפן, ללא מזהה משתמש, כדי לאפשר לכל היותר 2 אימותים בתוך כ-30 יום.';

  @override
  String get phoneAddSendCode => 'שלח קוד';

  @override
  String get phoneVerifyTitle => 'אמת את מספר הטלפון';

  @override
  String get phoneVerifyDescription =>
      'הזן את קוד האימות שנשלח למספר הטלפון שלך.';

  @override
  String get phoneAddSuccess => 'מספר הטלפון אומת';

  @override
  String get phoneCountryLabel => 'מדינה';

  @override
  String get phoneSearchCountries => 'חיפוש מדינות...';

  @override
  String get phoneNumberRequired => 'נדרש מספר טלפון';

  @override
  String get phoneEnterValidNumber => 'יש להזין מספר טלפון נייד חוקי.';

  @override
  String get phoneCannotBeUsed =>
      'אי אפשר להשתמש במספר הטלפון הזה. יש לנסות מספר נייד אחר או ליצור קשר עם התמיכה.';

  @override
  String get phoneAlreadyUsed =>
      'מספר הטלפון הזה כבר נמצא בשימוש. נסה מספר אחר או צור קשר עם התמיכה.';

  @override
  String get phoneCodeDidNotWork =>
      'הקוד הזה לא עבד. יש לבדוק אותו ולנסות שוב.';

  @override
  String get phoneTooManyAttempts => 'ניסית יותר מדי פעמים. המתן מעט ונסה שוב.';

  @override
  String get phoneSmsUnavailable =>
      'אימות ה-SMS אינו זמין כרגע. נסה שוב מאוחר יותר או צור קשר עם התמיכה.';

  @override
  String get phoneNotEligible =>
      'אימות טלפוני אינו זמין עבור חשבון זה. השתמש/י בשיטה אחרת או צור/צרי קשר עם התמיכה.';

  @override
  String get phoneCaptchaRequired =>
      'נדרשת בדיקת דפדפן לפני אימות הטלפון. יש לנסות שוב מדף ההתחברות או ליצור קשר עם התמיכה.';

  @override
  String get phoneSomethingWentWrong => 'משהו השתבש. יש לנסות שוב.';

  @override
  String get phoneInboundExpensiveDescription =>
      'שליחת SMS למספר טלפון זה יקרה מדי, לכן אנו מבקשים שתשלח לנו SMS במקום. ניתן גם ליצור קשר עם התמיכה כדי שנבטל דרישה זו מחשבונך.';

  @override
  String get phoneInboundDefaultDescription =>
      'עלינו לשלוח לך SMS כדי לאמת את מספר הטלפון שלך.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'פתחו את אפליקציית ההודעות בטלפון וצרו הודעת טקסט חדשה.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'שלח את הקוד $code אל $number.';
  }

  @override
  String get phoneInboundStepWait => 'המתן לקבלת ההודעה שלך. זה עשוי לקחת דקה.';

  @override
  String get phoneInboundGetNewCode => 'קבל קוד חדש';

  @override
  String get phoneInboundChallengeCodeLabel => 'קוד לשליחה';

  @override
  String get phoneInboundOurNumberLabel => 'שלח אל';

  @override
  String get requiredActionTitle => 'נדרש אימות חשבון';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'יש להשלים את האימות הנדרש כדי להמשיך להשתמש ב- $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'ההרשמה שלך דורשת בדיקה נוספת למניעת ספאם לפני שתוכל להמשיך.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'יש לאמת את כתובת האימייל או מספר הטלפון שלך כדי להמשיך להשתמש ב- $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'כדי להמשיך להשתמש ב- $productName, יש להשלים את שלבי אימות האימייל והטלפון הנדרשים.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'בחר שיטת אימות';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'יש להשלים אחד מנתיבי האימות הבאים כדי להמשיך להשתמש ב- $productName.';
  }

  @override
  String get requiredActionUseEmail => 'שימוש באימייל';

  @override
  String get requiredActionUsePhone => 'שימוש בטלפון';

  @override
  String get requiredActionCheckEmailTitle => 'בדוק את האימייל שלך';

  @override
  String get requiredActionCheckEmailDescription =>
      'שלחנו קישור לאימות לכתובת הדוא\"ל שלך. פתח אותו כדי להמשיך.';

  @override
  String get requiredActionResendVerificationEmail =>
      'שלח שוב את אימייל האימות';

  @override
  String get requiredActionVerificationEmailSent =>
      'נשלחה הודעת אימות. יש לבדוק את תיבת הדואר הנכנס.';

  @override
  String get requiredActionSignOut => 'התנתקות';

  @override
  String get dangerZoneSectionTitle => 'אזור הסכנה';

  @override
  String get dangerZoneSectionDescription => 'פעולות בלתי הפיכות והרסניות';

  @override
  String get dangerZoneDisableTitle => 'בטל חשבון';

  @override
  String get dangerZoneDisableDescription =>
      'השבתה זמנית של החשבון. תוכל/י להפעיל אותו מחדש מאוחר יותר על ידי התחברות.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'השבתת החשבון שלך תנתק אותך מכל הפעלות. תוכל להפעיל מחדש את החשבון שלך בכל עת על ידי כניסה מחדש.';

  @override
  String get dangerZoneDeleteTitle => 'מחק חשבון';

  @override
  String get dangerZoneDeleteDescription =>
      'מחיקה לצמיתות של החשבון וכל הנתונים המשויכים אליו. לא ניתן לבטל פעולה זו.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'בטל את מנוי ה-Plutonium הפעיל שלך בהגדרות ה-Plutonium לפני מחיקת חשבונך.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'לא ניתן למחוק את החשבון';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'אינך יכול למחוק את חשבונך כל עוד אתה הבעלים של קהילות. העבר בעלות על הקהילות הבאות תחילה:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'וגם $count נוספים';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'כדי להעביר בעלות, עבור אל $settingsPath והשתמש באפשרות העברת בעלות.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'האם למחוק את החשבון שלך? פעולה זו תגרום למחיקה לצמיתות של החשבון.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'באפשרותך לבטל את תהליך המחיקה בתוך 14 יום';

  @override
  String get dangerZoneDeleteBullet2 => 'לאחר 14 יום, החשבון שלך יימחק לצמיתות';

  @override
  String get dangerZoneDeleteBullet3 =>
      'לאחר השלמת המחיקה, לא תוכל/י לשחזר את הגישה לחשבונך';

  @override
  String get dangerZoneDeleteBullet4 =>
      'לא תוכל/י למחוק את ההודעות ששלחת לאחר מחיקת החשבון שלך';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'אם ברצונך לייצא את הנתונים שלך או למחוק את ההודעות שלך תחילה, אנא בקר בקטע לוח הבקרה של פרטיות בהגדרות המשתמש לפני שתמשיך.';

  @override
  String get claimAccountTitle => 'קבל את החשבון שלך';

  @override
  String get claimAccountDescription =>
      'תבעו את חשבונכם על ידי הוספת אימייל וסיסמה. נשלח קוד אימות כדי לאשר את האימייל שלכם לפני השלמת התהליך.';

  @override
  String get claimAccountEmailLabel => 'אימייל';

  @override
  String get claimAccountPasswordLabel => 'סיסמה';

  @override
  String get claimAccountSendCode => 'שלח קוד';

  @override
  String get claimAccountVerifyDescription =>
      'הזן את הקוד ששלחנו למייל שלך כדי לאמת אותו. הסיסמה שלך תוגדר לאחר אישור הקוד.';

  @override
  String get claimAccountSuccess => 'החשבון נתבע בהצלחה';

  @override
  String get importantInformation => 'מידע חשוב:';

  @override
  String get genericError => 'אירעה שגיאה';

  @override
  String get networkErrorMessage => 'אירעה שגיאה. אנא נסה שוב.';

  @override
  String get invalidCode => 'קוד שגוי';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לפני $count שנים',
      one: 'לפני שנה',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לפני $count חודשים',
      one: 'לפני חודש',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לפני $count ימים',
      one: 'לפני יום אחד',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לפני $count שעות',
      one: 'לפני שעה',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לפני $count דקות',
      one: 'לפני דקה',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לפני $count שבועות',
      one: 'לפני שבוע',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'בעוד $count דקות',
      one: 'בעוד דקה',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'בעוד $count שעות',
      one: 'בעוד שעה',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ימים',
      one: 'יום אחד',
    );
    return 'בעוד $_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'בעוד $count שבועות',
      one: 'בעוד שבוע',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'בעוד $count חודשים',
      one: 'בעוד חודש',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'בעוד $count שנים',
      one: 'בעוד שנה',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'ממש עכשיו';

  @override
  String get authorizedAppsTitle => 'אפליקציות מאושרות';

  @override
  String authorizedAppsDescription(String productName) {
    return 'האפליקציות הבאות קיבלו גישה לחשבון ה-$productName שלך.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'אין אפליקציות מורשות';

  @override
  String get authorizedAppsEmptyDescription =>
      'לא אישרת לאף יישום לגשת לחשבון שלך.';

  @override
  String get authorizedAppsLoadError => 'נכשל טעינת יישומים מורשים';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'אושר בתאריך $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'ההרשאות שהוענקו';

  @override
  String get authorizedAppsRevoke => 'ביטול';

  @override
  String get authorizedAppsRevokeTitle => 'בטל גישת אפליקציה';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'האם אתה בטוח שברצונך לבטל את הגישה עבור $appName? יישום זה לא יוכל יותר לגשת לחשבונך.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'גישה לפרטי הפרופיל הבסיסיים שלך (שם משתמש, תמונת פרופיל וכו׳)';

  @override
  String get authorizedAppsScopeEmail => 'הצגת כתובת האימייל שלך';

  @override
  String get authorizedAppsScopeGuilds => 'הצגת הקהילות שבהן אתה חבר';

  @override
  String get authorizedAppsScopeConnections => 'הצגת החשבונות המחוברים שלך';

  @override
  String get authorizedAppsScopeBot => 'הוספת בוט לקהילה עם הרשאות נדרשות';

  @override
  String get authorizedAppsScopeAdmin => 'גישה לנקודות קצה ניהוליות';

  @override
  String get privacyPendingDeletionTitle => 'ממתין למחיקה';

  @override
  String get blockedUsersTitle => 'משתמשים חסומים';

  @override
  String get blockedUsersDescription =>
      'משתמשים חסומים לא יכולים לשלוח לך בקשות חברות או הודעות ישירות.';

  @override
  String get blockedUsersEmptyTitle => 'אין משתמשים חסומים';

  @override
  String get blockedUsersEmptyDescription => 'עוד לא חסמת אף אחד.';

  @override
  String get blockedUsersLoadError => 'נכשל טעינת משתמשים חסומים';

  @override
  String get blockedUsersUnblock => 'בטל חסימה';

  @override
  String get blockedUsersUnblockTitle => 'בטל חסימה של משתמש';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'האם אתה בטוח שברצונך לבטל חסימה של $username?';
  }

  @override
  String get blockedUsersCopyTag => 'העתקת שם משתמש';

  @override
  String get blockedUsersCopyId => 'העתק מזהה משתמש';

  @override
  String get userProfileLoadError => 'לא ניתן לטעון את הפרופיל';

  @override
  String get userProfileLoading => 'טוען פרופיל';

  @override
  String get userProfileRetry => 'נסה שוב';

  @override
  String get userProfileMessage => 'הודעה';

  @override
  String get userProfileVoiceCall => 'שיחת קול';

  @override
  String get userProfileVideoCall => 'שיחת וידאו';

  @override
  String get userProfileEditProfile => 'עריכת פרופיל';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'צוות $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'צוות הקהילה של $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'שותף ב-$productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'צייד באגים של $productName';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return 'Plutonium של $productName';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Plutonium מנוי מאז $date';
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
    return '$productName Visionary מאז $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'מזהה Visionary #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'חברים משותפים ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'קהילות משותפות ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'חברים משותפים';

  @override
  String get userProfileMutualCommunitiesTitle => 'קהילות משותפות';

  @override
  String get userProfileNoMutualFriends => 'לא נמצאו חברים משותפים.';

  @override
  String get userProfileNoMutualCommunities => 'לא נמצאו קהילות משותפות.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'כינוי: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'פתח צ\'אט';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'חסמת את $username. לא תוכל לשלוח הודעות אלא אם תבטל את החסימה.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'בטל חסימה';

  @override
  String get userProfileOpenDm => 'פתח צ\'אט';

  @override
  String get userProfileNoteTitle => 'הערה';

  @override
  String get userProfileNoteVisibility => '(גלוי לך בלבד)';

  @override
  String get userProfileNoteSave => 'שמירה';

  @override
  String get userProfileNoteDelete => 'מחק';

  @override
  String get userProfileNoteEmpty => 'הקש כדי להוסיף הערה';

  @override
  String get userProfileMemberSince => 'חבר מאז';

  @override
  String get userProfileAboutMe => 'אודותיי';

  @override
  String get userProfileRoles => 'תפקידים';

  @override
  String get memberRoleAdd => 'הוספת תפקיד';

  @override
  String memberRoleRemove(String roleName) {
    return 'הסר את התפקיד $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'למשתמש זה אין תפקידים בקהילה זו.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'אין עדיין תפקידים. הוסף תפקידים ב-‎$rolesSettingsPath‎';
  }

  @override
  String get memberRolesNoRolesAvailable => 'אין תפקידים זמינים';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'בקהילה זו אין כרגע תפקידים להקצאה, אך ניתן ליצור תפקיד חדש ב- $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'הגדרות קהילה';

  @override
  String get guildSettingsRolesTab => 'תפקידים';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'שעה מקומית';

  @override
  String get userProfileSameTimeAsYou => 'אותה שעה כמו שלך';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration לפניך';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration אחריך';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours שעות',
      one: 'שעה אחת',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes דקות',
      one: 'דקה אחת',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours שעות',
      one: 'שעה אחת',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes דקות',
      one: 'דקה אחת',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'העתק שם משתמש';

  @override
  String get userProfileCopyUserId => 'העתק מזהה משתמש';

  @override
  String get userProfileViewMainProfile => 'הצג פרופיל ראשי';

  @override
  String get userProfileViewCommunityProfile => 'הצג פרופיל קהילה';

  @override
  String get userProfileBlockUser => 'חסום משתמש';

  @override
  String get userProfileUnblockUser => 'בטל חסימת משתמש';

  @override
  String get userProfileRemoveFriend => 'הסר חבר';

  @override
  String get userProfileBlockConfirmTitle => 'חסום משתמש';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'האם אתה בטוח שברצונך לחסום את $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'בטל חסימת משתמש';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'האם אתה בטוח שברצונך לבטל את החסימה של $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'הסר חבר';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'האם אתה בטוח שברצונך להסיר את $username מחבריך?';
  }

  @override
  String get userProfileFailedOpenDm => 'נכשל פתיחת הודעה פרטית';

  @override
  String get userProfileFailedSaveNote => 'נכשל בשמירת ההערה';

  @override
  String get userProfileActionFailed => 'הפעולה נכשלה, נסה שוב';

  @override
  String get userProfileChangeNickname => 'שינוי כינוי';

  @override
  String get userProfileKick => 'להוציא';

  @override
  String get userProfileBan => 'חסימה';

  @override
  String get userProfileTimeout => 'השהיה';

  @override
  String get userProfileRemoveTimeout => 'הסר השהיה';

  @override
  String get userProfileTransferOwnership => 'העברת בעלות';

  @override
  String get userProfileReportUser => 'דיווח על משתמש';

  @override
  String get userProfileReportMessage => 'דיווח על הודעה';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'להעיף את $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'האם אתה בטוח שברצונך להסיר את $username? הוא יוכל להצטרף מחדש עם הזמנה חדשה.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'הסרת השהייה?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'הסרת ההשעיה תאפשר ל-$username לשלוח הודעות, להגיב ולהצטרף לערוצי קול שוב.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'העברת בעלות?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'העברת הבעלות על קהילה זו אל $username? פעולה זו אינה הפיכה ותאבד את כל הרשאות הבעלים.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'חסום את $username';
  }

  @override
  String get userProfileBanDurationLabel => 'משך חסימה';

  @override
  String get userProfileBanCustomSecondsLabel => 'משך מותאם אישית (שניות)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'כל ערך בין $min ל-$max שניות';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'מחיקת היסטוריית הודעות';

  @override
  String get userProfileBanDeleteNone => 'אל תמחק אף הודעה';

  @override
  String get userProfileBanDelete24h => '24 השעות האחרונות';

  @override
  String get userProfileBanDelete7d => '7 הימים האחרונים';

  @override
  String get userProfileBanReasonLabel => 'סיבה (אופציונלי)';

  @override
  String get userProfileBanReasonHint => 'הזן סיבה לחסימה';

  @override
  String get userProfileBanSubmit => 'השעיית משתמש';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'השבתה זמנית של $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'משך ההשתקה';

  @override
  String get userProfileTimeoutSubmit => 'הוצאת חבר מהשיחה';

  @override
  String get userProfileNicknameLabel => 'כינוי';

  @override
  String get userProfileNicknameHint => 'הזן כינוי';

  @override
  String get userProfileNicknameSave => 'שמירה';

  @override
  String userProfileKickSuccess(String username) {
    return 'הוצאת את $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'חסמת את $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'הוצאת את $username מחוץ לשיחה';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'הוסר ההשעיה מ-$username';
  }

  @override
  String get userProfileNicknameSuccess => 'הכינוי עודכן';

  @override
  String get userProfileTransferSuccess => 'הבעלות הועברה';

  @override
  String get durationPermanent => 'קבוע';

  @override
  String get duration60Seconds => '60 שניות';

  @override
  String get duration5Minutes => '5 דקות';

  @override
  String get duration10Minutes => '10 דקות';

  @override
  String get duration1Hour => 'שעה אחת';

  @override
  String get duration12Hours => '12 שעות';

  @override
  String get duration1Day => 'יום אחד';

  @override
  String get duration3Days => '3 ימים';

  @override
  String get duration5Days => '5 ימים';

  @override
  String get duration1Week => 'שבוע אחד';

  @override
  String get duration2Weeks => 'שבועיים';

  @override
  String get duration1Month => 'חודש אחד';

  @override
  String get durationCustom => 'מותאם אישית…';

  @override
  String get iarReportUserTitle => 'דיווח על משתמש';

  @override
  String get iarReportGuildTitle => 'דיווח על קהילה';

  @override
  String get iarReportGuildPreconfirmBody =>
      'אם הדיווח הזה נוגע להודעה ספציפית בקהילה הזו, דווחו על ההודעה הזו במקום. דיווחי הודעות מספקים לצוות הבטיחות שלנו את ההקשר הברור ביותר, והוספת פרטים בתגובות יכולה לעזור לנו לבדוק את הדיווח מהר יותר. המשיכו לדווח על הקהילה כולה רק אם דיווח על הודעה לא יתאר את הבעיה הרחבה יותר.';

  @override
  String get iarContinueToReportCommunity => 'המשך לדווח על הקהילה';

  @override
  String get iarPreviewCommunitySubtitle => 'קהילה';

  @override
  String get iarReasonHarassmentGuildLabel => 'הטרדה או התעללות ממוקדת';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'קהילה מאפשרת הצקות המוניות או התעללות ממוקדת.';

  @override
  String get iarReasonHateGuildDescription => 'מקדם שנאה כלפי קבוצות מוגנות.';

  @override
  String get iarReasonTerrorismLabel => 'טרור או קיצוניות אלימה';

  @override
  String get iarReasonTerrorismDescription =>
      'מקדם, מגייס או מתאם פעילות אלימה קיצונית.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'תוכן למבוגרים או חסימה לא בטוחה';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'תוכן למבוגרים ללא חסימה מתאימה.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'מסכן קטינים או מכיל תוכן של ניצול ילדים.';

  @override
  String get iarReasonRaidLabel => 'תיאום פשיטה';

  @override
  String get iarReasonRaidDescription =>
      'מתאם פשיטות, התארגנויות או הטרדות נגד אנשים או קהילות.';

  @override
  String get iarReasonSpamGuildDescription =>
      'הקהילה קיימת כדי לשלוח ספאם, להונות או לנצל לרעה את הפלטפורמה.';

  @override
  String get iarReasonMalwareGuildLabel => 'הפצת תוכנות זדוניות';

  @override
  String get iarReasonMalwareGuildDescription =>
      'מפיץ תוכנות זדוניות, גניבת פרטי התחברות או קבצים מזיקים.';

  @override
  String get iarReasonPrivacyGuildLabel => 'הפרת פרטיות או דוקסינג';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'משתף מידע אישי, עוקב אחרי משתמשים או מתאם פגיעה בפרטיות.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'מעודד פגיעה עצמית';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'מעודד התאבדות, פגיעה עצמית או הפרעות אכילה.';

  @override
  String get iarReasonInappropriateProfile => 'פרופיל לא הולם';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'הפרופיל של המשתמש הזה מכיל תוכן לא הולם';

  @override
  String typingIndicatorOne(String name) {
    return '$name מקליד/ה...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 וגם $name2 מקלידים...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 ו-$name3 מקלידים...';
  }

  @override
  String get typingIndicatorMultiple => 'כמה אנשים מקלידים...';

  @override
  String get typingIndicatorHandful => 'קומץ לוחמי מקלדת מתאספים...';

  @override
  String get typingIndicatorSymphony => 'מקלדת רועשת בפעולה...';

  @override
  String get typingIndicatorFiesta => 'מסיבת הקלדה מטורפת פה';

  @override
  String get typingIndicatorApocalypse => 'וואו, כולם מקלידים בבת אחת';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'כיף שאת/ה כאן, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'ברוך הבא, $username! תרגיש בבית.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'שלום, $username! כיף שבאת.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'היי, $username! קפוץ פנימה מתי שתרצה.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'היי $username, כיף לראות אותך כאן!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'היי, $username! מקווים שתיהנו מהשהות שלכם.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'היי, $username, ברוך הבא/ה!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'כיף שהצטרפת, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'ברוך הבא, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'ברוך הבא, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'ברוך/ברוכה הבא/ה, $username! שמחים שבאת.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'ברוך הבא, $username! מקווים שתיהנה/תיהני כאן.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'ברוך הבא, $username! השיחה הבאה שלך מתחילה כאן.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'ברוך/ברוכה הבא/ה, $username. אנחנו שמחים/שמחות שבאת/באתן.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'כיף לראות אותך, $username! ברוך/ברוכה הבא/ה.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'היי, $username! כיף שבאת.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'הגעת, $username! בוא/י נתחיל/נתחיל.';
  }

  @override
  String get relativeTimeShortNow => 'עכשיו';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count דקות',
      one: 'דקה',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count שעות',
      one: 'שעה',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ימים',
      one: 'יום 1',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חודשים',
      one: 'חודש',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count שנים',
      one: 'שנה',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'המכשירים שלי';

  @override
  String get linkedDevicesDescription =>
      'הצג את כל המכשירים המחוברים כעת לחשבונך. בטל כל הפעלה שאינך מזהה.';

  @override
  String get linkedDevicesCurrentDevice => 'המכשיר הנוכחי';

  @override
  String get linkedDevicesOtherDevices => 'מכשירים אחרים';

  @override
  String get linkedDevicesEnterSelection => 'כניסה למצב בחירה';

  @override
  String get linkedDevicesExitSelection => 'יציאה ממצב בחירה';

  @override
  String get linkedDevicesSelectAll => 'בחר הכל';

  @override
  String get linkedDevicesClearSelection => 'נקה בחירה';

  @override
  String get linkedDevicesRevokeTooltip => 'ביטול הרשאת מכשיר';

  @override
  String get linkedDevicesSignOutAll => 'יציאה מכל המכשירים האחרים';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'התנתק מ- $count מכשירים',
      one: 'התנתק ממכשיר 1',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'התנתק מ- $count מכשירים',
      one: 'התנתק ממכשיר 1',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'יציאה מכל המכשירים האחרים';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'פעולה זו תנתק את המכשירים הנבחרים מהחשבון שלך. תצטרך להתחבר שוב במכשירים אלו.',
      one:
          'פעולה זו תנתק את המכשיר הנבחר מהחשבון שלך. תצטרך להתחבר שוב במכשיר זה.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'פעולה זו תנתק את המכשירים שנבחרו מהחשבון שלך. תצטרך להתחבר מחדש במכשירים אלה.';

  @override
  String get linkedDevicesSignOutConfirm => 'המשך';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'תצטרך להתחבר מחדש בכל המכשירים שבהם יצאת מהחשבון';

  @override
  String get linkedDevicesLoadErrorTitle => 'שגיאת רשת';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'אנחנו מתקשים להתחבר למרחב-זמן. אנא בדוק את החיבור שלך ונסה שוב.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'התקנים בוטלו',
      one: 'התקן בוטל',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'לא הצלחנו להתנתק. נסה שוב.';

  @override
  String get linkedDevicesUnknownOs => 'מערכת הפעלה לא ידועה';

  @override
  String get linkedDevicesUnknownPlatform => 'פלטפורמה לא ידועה';

  @override
  String slowmodeLabel(String duration) {
    return 'מצב איטי למשך $duration';
  }

  @override
  String get slowmodeTooltipActive =>
      'אתה במצב השהיה. אנא המתן לפני שליחת הודעה נוספת.';

  @override
  String get slowmodeTooltipImmune => 'מצב איטי מופעל, אך אתה חסין.';

  @override
  String get slowmodeStatusEnabled => 'מצב איטי מופעל';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'מצב איטי פעיל ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'מצב איטי מוגדר ל-$durationLabel, אך אתה פטור.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'מצב איטי מוגדר ל-$durationLabel. המתן לפני שליחת הודעה נוספת.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'מצב איטי מוגדר ל-$durationLabel עבור ערוץ זה.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'אינך יכול/ה לשלוח הודעות בערוץ זה.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'הודעות מערכת מצוות $productName. לא ניתן להשיב כאן.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'ההודעות מושהות זמנית בקהילה זו.';

  @override
  String get channelComposerBarrierTimedOut =>
      'הושתקת. שליחת הודעות, ריאקציות וקול מושהים עד שתוקף ההשתקה יפוג.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'עליך לאמת את חשבונך כדי לשלוח הודעות בקהילה זו.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'עליך לאמת את כתובת האימייל שלך כדי לשלוח הודעות בקהילה זו.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'החשבון שלך חדש מדי כדי לשלוח הודעות בקהילה זו.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'אינך חבר בקהילה זו מספיק זמן כדי לשלוח הודעות.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'עליך לאמת מספר טלפון כדי לשלוח הודעות בקהילה זו.';

  @override
  String get channelComposerBarrierVerifyEmail => 'אימות אימייל';

  @override
  String get channelComposerBarrierVerifyPhone => 'אימות מספר טלפון';

  @override
  String chatAttachmentTooMany(int max) {
    return 'יותר מדי קבצים מצורפים (מקסימום $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName חורג ממגבלת הגודל ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'הקבצים האלה גדולים מדי לשליחה יחד';

  @override
  String get chatAttachmentDropToUpload => 'גרור קבצים להעלאה';

  @override
  String get chatAttachmentDropToSend => 'גרור קבצים לשליחה עכשיו';

  @override
  String get chatAttachmentSendVoiceMessage => 'שלח הודעה קולית';

  @override
  String get voiceMessageTitle => 'הודעה קולית';

  @override
  String get voiceMessageHoldHint =>
      'החזק להקלטה. גרור לפח למחיקה, החלק למעלה לנעילה, או שחרר לשליחה.';

  @override
  String get voiceMessageDiscard => 'מחיקת ההודעה הקולית';

  @override
  String get voiceMessageSend => 'שלח הודעה קולית';

  @override
  String get voiceMessageMicPermissionDenied =>
      'לא ניתן להתחיל הקלטה. אשר גישה למיקרופון.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'הקלטת הודעות קול אינה נתמכת במכשיר זה.';

  @override
  String get voiceMessageMicInUse =>
      'עזוב את שיחת הווידאו כדי להקליט הודעת קול.';

  @override
  String get voiceMessageRecordingFailed => 'ההקלטה נכשלה. יש לנסות שוב.';

  @override
  String get voiceMessageSendFailed =>
      'לא ניתן לשלוח הודעה קולית. יש לנסות שוב.';

  @override
  String get voiceMessageRecordingHint =>
      'דברו עכשיו. לחצו על ״עצור״ כשתסיימו — תוכלו לחתוך אחר כך.';

  @override
  String get voiceMessageReviewHint => 'גרור את הידיות כדי לחתוך, ואז הקש שלח.';

  @override
  String get voiceMessageStop => 'עצור';

  @override
  String get voiceMessageStartRecording => 'התחל להקליט';

  @override
  String get voiceMessageRerecord => 'הקלטה מחדש';

  @override
  String get voiceMessagePlay => 'הפעל';

  @override
  String get voiceMessagePause => 'השהה';

  @override
  String get voiceMessageSeekForward => 'קדם';

  @override
  String get voiceMessageSeekBackward => 'חזור אחורה';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'הבחירה חייבת להיות לפחות $secondsString שניות.';
  }

  @override
  String get chatAttachmentEditTitle => 'עריכת קובץ מצורף';

  @override
  String get chatAttachmentFilenameLabel => 'שם קובץ';

  @override
  String get chatAttachmentDescriptionLabel => 'תיאור';

  @override
  String get chatAttachmentDescriptionHint => 'טקסט חלופי (אופציונלי)';

  @override
  String get chatAttachmentSpoilerLabel => 'סמן כספוילר';

  @override
  String get chatAttachmentRemove => 'הסר קובץ מצורף';

  @override
  String get chatAttachmentDownload => 'הורדה';

  @override
  String get chatAttachmentDownloadedToast => 'נשמר בתמונות';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'לא ניתן היה להוריד את הקובץ המצורף';

  @override
  String get chatAttachmentExpiredTooltip => 'הקובץ המצורף פג תוקף';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'הרחב ($count שורות)',
      one: 'הרחב ($count שורה)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'כווץ ($count שורות)',
      one: 'כווץ ($count שורה)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'הצג ($count שורות)',
      one: 'הצג ($count שורה)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'כווץ ($count שורות)',
      one: 'כווץ ($count שורה)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count שורות נותרו)',
      one: '... ($count שורה נותרה)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count שורות נותרו)',
      one: '... ($count שורה נותרה)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'הצג קובץ מלא';

  @override
  String get chatTextualPreviewChangeLanguage => 'שנה שפה';

  @override
  String get chatTextualPreviewSearchLanguage => 'חפש שפה…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'הדגשת תחביר';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'לא נמצאו תוצאות';

  @override
  String get chatTextualPreviewMoreOptions => 'אפשרויות נוספות';

  @override
  String get chatTextualPreviewWrapText => 'גלישת טקסט';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'הקובץ גדול מדי לצפייה מקדימה מוטבעת (מגבלה של $previewLimitKb ק\"ב).';
  }

  @override
  String get chatTextualPreviewLoadError => 'לא ניתן לטעון תצוגה מקדימה.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'טקסט רגיל';

  @override
  String get chatTextualPreviewCopy => 'העתקה';

  @override
  String get chatAttachmentSourceGallery => 'גלריה';

  @override
  String get chatAttachmentSourceCamera => 'מצלמה';

  @override
  String get chatAttachmentSourceBrowse => 'דפדוף בקבצים';

  @override
  String get chatAttachmentPasteTooltip => 'הדבק קובץ מהלוח';

  @override
  String get chatAttachmentSpoiler => 'ספוילר';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'הצג ספוילר';

  @override
  String get matureMediaRevealButton => 'הצגה';

  @override
  String get matureMediaRevealHint => 'יש ללחוץ כדי להציג';

  @override
  String get matureContentTitle => 'תוכן למבוגרים';

  @override
  String get matureCommunityTitle => 'קהילה למבוגרים בלבד';

  @override
  String get matureCategoryTitle => 'קטגוריית תוכן למבוגרים';

  @override
  String get matureChannelTitle => 'ערוץ למבוגרים בלבד';

  @override
  String get communityContentWarningTitle => 'אזהרת תוכן קהילתי';

  @override
  String get categoryContentWarningTitle => 'אזהרת תוכן בקטגוריה';

  @override
  String get channelContentWarningTitle => 'אזהרת תוכן בערוץ';

  @override
  String get defaultContentWarningBody => 'הודעה זו מכילה תוכן רגיש.';

  @override
  String get matureCommunityBody =>
      'הקהילה הזו מסומנת כבעלת תוכן למבוגרים ועשויה להכיל חומר שאינו הולם עבור משתמשים מסוימים.';

  @override
  String get matureCategoryBody =>
      'קטגוריה זו מסומנת כבעלת תוכן למבוגרים ועשויה להכיל חומר שאינו הולם עבור חלק מהמשתמשים.';

  @override
  String get matureChannelBody =>
      'הערוץ הזה מסומן כבעל תוכן למבוגרים ועשוי להכיל חומר שאינו הולם עבור חלק מהמשתמשים.';

  @override
  String get matureVoiceChannelBody =>
      'ערוץ קולי זה מסומן כבעל תוכן למבוגרים ועשוי להכיל חומר שאינו הולם עבור משתמשים מסוימים.';

  @override
  String get matureLinkChannelBody =>
      'ערוץ קישור זה מסומן ככולל תוכן למבוגרים ועשוי להכיל חומר שאינו הולם עבור חלק מהמשתמשים.';

  @override
  String get matureCommunityUnavailableBody =>
      'הקהילה הבוגרת הזו אינה זמינה לחשבונך.';

  @override
  String get matureCategoryUnavailableBody =>
      'קטגוריה בוגרת זו אינה זמינה לחשבונך.';

  @override
  String get matureChannelUnavailableBody =>
      'הערוץ הבוגר הזה אינו זמין לחשבונך.';

  @override
  String get matureContentProceedButton => 'המשך';

  @override
  String get matureContentUnderstandButton => 'אני מבין/ה';

  @override
  String get matureContentOpenLinkButton => 'פתח קישור';

  @override
  String get sensitiveContentSectionTitle => 'תוכן רגיש';

  @override
  String get sensitiveContentSectionDescription =>
      'נהל סינון של מדיה בוגרת או רגישה בהקשרים שונים';

  @override
  String get sensitiveContentFriendDmLabel => 'הודעות ישירות מחברים';

  @override
  String get sensitiveContentNonFriendDmLabel => 'הודעות פרטיות מאחרים';

  @override
  String get sensitiveContentGuildLabel => 'הודעות בערוצי קהילה';

  @override
  String get sensitiveContentFilterShow => 'הצג';

  @override
  String get sensitiveContentFilterBlur => 'טשטוש';

  @override
  String get sensitiveContentFilterBlock => 'חסימה';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'טשטש מדיה עד לסיום סריקת הבטיחות';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'כשתפעיל/י אפשרות זו, תמונות וסרטונים יטושטשו עד שתסתיים סריקת בטיחות התוכן.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'הגדרה זו מופעלת תמיד עבור החשבון שלך.';

  @override
  String get sensitiveContentResetButton => 'איפוס';

  @override
  String get sensitiveContentSaveButton => 'שמירה';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קבצים',
      one: 'קובץ אחד',
    );
    return 'מעלה $_temp0';
  }

  @override
  String get chatCancelUpload => 'ביטול העלאה';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'תוקף: $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'פג תוקף בין $start ל- $end';
  }

  @override
  String get connectionsTitle => 'חיבורים';

  @override
  String connectionsDescription(String productName) {
    return 'קשרו חשבונות ודומיינים חיצוניים לפרופיל ה-$productName שלכם. חיבורים מאומתים יוצגו בפרופיל שלכם כדי שאחרים יוכלו לראות.';
  }

  @override
  String get connectionsEmptyTitle => 'אין חיבורים עדיין';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'קשרו את חשבון ה-Bluesky שלכם או אמת את בעלות הדומיין כדי להציג אותם בפרופיל שלכם.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'אמת בעלות על הדומיין כדי להציג אותו בפרופיל שלך.';

  @override
  String get connectionsAddBluesky => 'בלוסקיי';

  @override
  String get connectionsAddDomain => 'דומיין';

  @override
  String get connectionsAddBlueskyAriaLabel => 'הוסף חיבור ל-Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'הוספת חיבור דומיין';

  @override
  String get connectionEdit => 'עריכה';

  @override
  String get connectionRemove => 'הסר';

  @override
  String get connectionVerifiedLabel => 'החיבור אומת.';

  @override
  String get connectionUnverifiedLabel => 'החיבור הזה לא אומת.';

  @override
  String get connectionAddTitle => 'הוספת חיבור';

  @override
  String get connectionTypeLabel => 'סוג חיבור';

  @override
  String get connectionHandleLabel => 'כינוי';

  @override
  String get connectionDomainLabel => 'דומיין';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'חיבור זה כבר קיים אצלך.';

  @override
  String get connectionConnectBluesky => 'התחבר עם Bluesky';

  @override
  String get connectionContinue => 'המשך';

  @override
  String get connectionVerifyTitle => 'אמת חיבור';

  @override
  String get connectionVerifyInstructions =>
      'השתמשו ברשומה שלמטה כדי להוכיח בעלות על הדומיין.';

  @override
  String get connectionDnsRecordTitle => 'רשומת DNS TXT';

  @override
  String get connectionDnsHostLabel => 'מארח';

  @override
  String get connectionDnsValueLabel => 'ערך';

  @override
  String get connectionCopyHost => 'העתק מארח';

  @override
  String get connectionCopyValue => 'העתק ערך';

  @override
  String get connectionCopied => 'הועתק!';

  @override
  String get connectionTokenFileTitle => 'הגשת קובץ האסימון';

  @override
  String get connectionTokenFileDescription =>
      'הורד את **fluxer-verification** והצב אותו בתיקיית **.well-known** שלך כדי שנוכל לאמת את הדומיין.';

  @override
  String get connectionTokenFileDownload => 'הורד את fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'הקובץ מכיל את אסימון האימות שניגש אליו מ-**$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'שמור אימות Fluxer';

  @override
  String get connectionVerifyButton => 'אימות';

  @override
  String get connectionBack => 'חזרה';

  @override
  String get connectionEditTitle => 'עריכת חיבור';

  @override
  String get connectionEditDescription =>
      'בחר מי יכול לראות את החיבור הזה בפרופיל שלך.';

  @override
  String get connectionVisibilityEveryone => 'כולם';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'אפשר לכל אחד לראות את החיבור הזה בפרופיל שלך';

  @override
  String get connectionVisibilityFriends => 'חברים';

  @override
  String get connectionVisibilityFriendsDesc =>
      'אפשר לחברים שלך לראות את החיבור הזה';

  @override
  String get connectionVisibilityCommunityMembers => 'חברי קהילה';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'אפשר לחברים מקהילות שבהן אתה חבר לראות את החיבור הזה';

  @override
  String get connectionRemoveTitle => 'הסרת חיבור';

  @override
  String get connectionRemoveDescription =>
      'האם אתה בטוח שברצונך להסיר חיבור זה? לא ניתן לבטל פעולה זו.';

  @override
  String get connectionRemoveConfirm => 'הסר';

  @override
  String get connectionsLoadError => 'נכשל טעינת החיבורים';

  @override
  String get connectionsReorderError => 'שגיאה בעדכון הסדר';

  @override
  String get connectionInitiateFailed =>
      'לא ניתן היה להתחיל את האימות. נסה שוב.';

  @override
  String get connectionVerifyFailed =>
      'לא ניתן היה לאמת. בדוק את רשומת ה-DNS שלך ונסה שוב.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'לא ניתן היה להתחיל את אימות ה-Bluesky.';

  @override
  String get connectionUpdateFailed => 'לא ניתן לעדכן את החיבור';

  @override
  String get connectionRemoveFailed => 'לא ניתן היה להסיר את החיבור';

  @override
  String get connectionTokenSavedToast => 'אימות Fluxer נשמר';

  @override
  String get connectionTokenSaveFailedToast => 'לא ניתן היה לשמור את הקובץ';

  @override
  String get connectionEnterHandle => 'הזן/י שם משתמש ב-Bluesky.';

  @override
  String get connectionEnterDomain => 'הזן דומיין.';

  @override
  String get lookAndFeelTitle => 'מראה ותחושה';

  @override
  String get lookAndFeelThemeSectionTitle => 'עיצוב';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'בחר בין מראה כהה, פחם או בהיר.';

  @override
  String get lookAndFeelHdrSectionTitle => 'טווח דינמי רחב';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'שליטה על אופן הצגת תמונות HDR במסכים תומכי HDR.';

  @override
  String get lookAndFeelHdrFullName => 'טווח דינמי מלא';

  @override
  String get lookAndFeelHdrFullDescription =>
      'הצגת תמונות HDR בבהירות ובטווח צבעים מלאים.';

  @override
  String get lookAndFeelHdrStandardName => 'טווח רגיל';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'ממפה תמונות HDR לטווח רגיל, מפחית את בהירות השיא.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'מצב תצוגה בטווח דינמי רחב (HDR)';

  @override
  String get lookAndFeelThemeDark => 'ערכת נושא כהה';

  @override
  String get lookAndFeelThemeCoal => 'ערכת נושא פחם';

  @override
  String get lookAndFeelThemeLight => 'ערכת נושא בהירה';

  @override
  String get lookAndFeelThemeSystem => 'ערכת נושא של המערכת';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'סנכרן ערכת נושא בין מכשירים';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'כאשר מופעל, שינויי ערכות נושא יסונכרנו לכל המכשירים שלך. כאשר מושבת, מכשיר זה ישתמש בהגדרת ערכת הנושא שלו.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'ערכת נושא של המערכת משביתה באופן אוטומטי את הסנכרון כדי לעקוב אחר העדפות המערכת שלך במכשיר זה.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'לא הצלחנו לסנכרן את הערכה לחשבונך. נסה שוב.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'קנה מידה של גופן הצ׳אט';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'התאם את גודל הגופן באזור הצ\'אט.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'גודל גופן בצ\'אט';

  @override
  String get lookAndFeelAppZoomTitle => 'רמת זום של האפליקציה';

  @override
  String get lookAndFeelAppZoomDescription => 'התאם את רמת הזום של היישום.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'טפט צ\'אט';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'בחר רקע לצ\'אט. הוא יישאר במכשיר זה.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'הגדרה זו נשארת במכשיר זה';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'טפט הצ\'אט נשמר במכשיר זה בלבד ואינו מסונכרן למכשירים אחרים.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'ברירת מחדל';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'תמונה מותאמת אישית';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'צבע $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'מעבר צבעים $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'עמעם טפט';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'לא ניתן להגדיר את התמונה הזו כטפט שלך.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'הודעות';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'בחרו כיצד יוצגו ההודעות בערוצי הצ׳אט.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel => 'רווח בין קבוצות הודעות';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'מצב תצוגת הודעות';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'נוח';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'פריסה מרווחת עם הפרדה ויזואלית ברורה בין ההודעות.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'צפוף';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'ממקסם את כמות ההודעות הגלויות עם רווח מינימלי.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'הסתר אווטרים של משתמשים';

  @override
  String get lookAndFeelInterfaceTitle => 'ממשק';

  @override
  String get lookAndFeelInterfaceDescription =>
      'התאמה אישית של רכיבי הממשק וההתנהגויות.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'מחווני הקלדה ברשימת הערוצים';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'בחר כיצד יופיעו מחווני הקלדה ברשימת הערוצים כאשר מישהו מקליד בערוץ.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'מחוון הקלדה + תמונות פרופיל';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'הצג חיווי הקלדה עם תמונות פרופיל של משתמשים ברשימת הערוצים';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'מחוון הקלדה בלבד';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'הצג רק את חיווי ההקלדה ללא אווטארים';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'מוסתר';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'אל תציג חיווי הקלדה ברשימת הערוצים';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'הצג הקלדה בערוץ שנבחר';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'כשהוא מושבת (ברירת מחדל), מחווני הקלדה לא יופיעו בערוץ שאתה צופה בו כרגע.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'כללי';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'רמזי מקלדת';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'קבע אם רמזי קיצורי מקלדת יופיעו בתוך הצעות.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel => 'הסתר רמזי מקלדת בטיפים';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'כאשר מופעל, תגי קיצורי דרך מוסתרים בחלונות קופצים של טיפים.';

  @override
  String get lookAndFeelNekoTitle => 'שונות';

  @override
  String get lookAndFeelNekoDescription => 'אפשרויות ממשק שונות.';

  @override
  String get lookAndFeelShowNekoLabel => 'הצג נקו';

  @override
  String get lookAndFeelShowNekoDescription =>
      'כאשר מופעל, ניקו יופיע ליד שורת הקלט של הצ\'אט.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => 'התנהגות הצטרפות לערוץ קולי';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'קבע כיצד אתה מצטרף לערוצי קול בקהילות.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'דרושה לחיצה כפולה כדי להצטרף לערוצי קוליים';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'כשתפעיל את האפשרות, תצטרך ללחוץ פעמיים על ערוצי קול כדי להצטרף אליהם. כשהיא כבויה (ברירת מחדל), לחיצה אחת תצטרף לערוץ מיד.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'השועל החום המהיר קפץ מעל הכלב העצלן.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'סרגל צד של קהילה';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'הגדר כיצד סרגל הצד של הקהילה מציג הודעות ישירות.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count קהילות אינן זמינות באופן זמני עקב תקלה בקבל הפלוקס.',
      one: 'קהילה אחת אינה זמינה באופן זמני עקב תקלה בקבל הפלוקס.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable => 'הקהילה אינה זמינה באופן זמני';

  @override
  String get guildUnavailableDescription => 'משהו השתבש. אנחנו עובדים על זה.';

  @override
  String get guildNotFoundTitle => 'זו לא הקהילה שחיפשת.';

  @override
  String get guildNotFoundDescription =>
      'ייתכן שהקהילה שאתם מחפשים נמחקה, או שאין לכם גישה אליה.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName נגישה כרגע רק לחברי צוות של $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => '(לא זמין באופן זמני)';

  @override
  String get lookAndFeelCollapseDMsLabel => 'כווץ הודעות ישירות לתיקיה';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'כאשר מופעל, הודעות ישירות שלא נקראו בסרגל הצד של השרת מתקפלות לתיקייה בכפתור ה-$productName. לחץ על כפתור ה-$productName כשאתה בדף ההודעות הישירות כדי לפתוח או לקפל את התיקייה.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'רשימת ערוצים';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'שליטה על התנהגות מחוון ההודעות שלא נקראו בערוצים מושתקים ברשימות ערוצים.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'הצגת חיווי הודעות שלא נקראו בערוצים מושתקים';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'כאשר מופעל, ערוצים מושתקים יציגו מחוון קריאה שלא נקראה בצד שמאל. אזכורים עדיין יופיעו ללא קשר להגדרה זו.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'פעילים עכשיו';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'נהל כיצד \"פעיל כעת\" מוצג באפליקציה.';

  @override
  String get lookAndFeelShowActiveNowLabel => 'הצג פעילים עכשיו במסך הבית';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'הצג \"פעילים עכשיו\" במסך הבית כדי להציג חברים פעילים בשיחות קוליות. תראה תצוגה מקדימה, את הקשר הערוץ, מי כבר שם, ודרך מהירה להצטרף.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'מועדפים';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'נהלו את הנראות של המועדפים בכל האפליקציה.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'הפעל מועדפים';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'כאשר מופעל, תוכל לסמן ערוצים כמועדפים והם יופיעו בקטע המועדפים. כאשר מושבת, כל רכיבי הממשק הקשורים למועדפים (לחצנים, פריטי תפריט) יוסתרו. המועדפים הקיימים שלך יישמרו.';

  @override
  String get favoritesTitle => 'מועדפים';

  @override
  String get favoritesEmptyTitle => 'עדיין אין מועדפים';

  @override
  String get favoritesEmptyDescription =>
      'כוכב ערוצים מכותרת הצ\'אט כדי לשמור אותם כאן.';

  @override
  String get favoritesWelcomeTitle => 'ברוכים הבאים למועדפים';

  @override
  String get favoritesWelcomeDescription =>
      'המרחב האישי שלך לגישה מהירה לערוצים, להודעות פרטיות ולקבוצות שאתה אוהב. לחץ על הכוכב בכל ערוץ כדי להוסיף אותו לכאן.';

  @override
  String get favoritesWelcomeTip => 'לא בשבילך? כבה את זה מתי שתרצה.';

  @override
  String get favoritesDisableButton => 'השבתת מועדפים';

  @override
  String get favoritesAddedToast => 'נוסף למועדפים';

  @override
  String get favoritesRemovedToast => 'הוסר מהמועדפים';

  @override
  String get favoritesHiddenToast => 'המועדפים הוסתרו';

  @override
  String get favoritesMute => 'השתק מועדפים';

  @override
  String get favoritesUnmute => 'בטל השתקה של מועדפים';

  @override
  String get favoritesHeaderMenu => 'תפריט מועדפים';

  @override
  String get favoritesCreateCategory => 'יצירת קטגוריה';

  @override
  String get favoritesCategoryNameLabel => 'שם הקטגוריה';

  @override
  String get favoritesHideMutedChannels => 'הסתר ערוצים מושתקים';

  @override
  String get favoritesShowMutedChannels => 'הצגת ערוצים מושתקים';

  @override
  String get favoritesSetNickname => 'הגדר כינוי';

  @override
  String get favoritesNicknameLabel => 'כינוי';

  @override
  String get favoritesSaveNickname => 'שמור כינוי';

  @override
  String get favoritesMoveToCategory => 'העברה לקטגוריה';

  @override
  String get favoritesUncategorized => 'ללא קטגוריה';

  @override
  String get favoritesOtherCategory => 'אחר';

  @override
  String get favoritesRemoveFromFavorites => 'הסר מהמועדפים';

  @override
  String get favoritesAddToFavorites => 'הוסף למועדפים';

  @override
  String get favoritesAddToSavedMedia => 'הוספה למדיה השמורה';

  @override
  String get favoritesRemoveFromSavedMedia => 'הסרה מהתקשורת השמורה';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'הוסף למועדפים של GIF לפי כתובת URL בלבד';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'הסרה מרשימת ה-GIF המועדפים שנשמרו לפי כתובת URL';

  @override
  String get savedMediaAddTitle => 'הוספה למדיה השמורה';

  @override
  String get savedMediaFormNameLabel => 'שם';

  @override
  String get savedMediaFormNameHint => 'המדיה המדהימה שלי';

  @override
  String get savedMediaFormAltTextLabel => 'טקסט חלופי';

  @override
  String get savedMediaFormAltTextHint => 'תאר/י את המדיה';

  @override
  String get savedMediaFormTagsLabel => 'תגיות';

  @override
  String get savedMediaFormTagsHint => 'מצחיק, תגובה, עבודה';

  @override
  String get savedMediaSaveError => 'לא ניתן לעדכן מדיה שמורה.';

  @override
  String get savedMediaNameRequired => 'נדרש שם.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'איך נרצה לשמור את ה-GIFים המועדפים שלך?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'אפשר לשמור GIFים שסימנת כאהובים כמועדפים עם כתובת URL בלבד, או להעלות אותם למדיה השמורה שלך. בחר את האפשרות שמתאימה לך. תוכל לשנות זאת בכל עת בהגדרות > מתקדם > מדיה.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'מועדפים בלבד (ברירת מחדל): מסונכרנים בין המכשירים שלך, ללא העלאה, לא נספרים במדיה שמורה. המדיה המקורית עלולה להיעלם אם המארח שלה יסיר אותה.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'מדיה שמורה: הועלתה, ניתנת לתיוג, לחיפוש וקבועה, אך נספרת במגבלת המדיה השמורה שלך.';

  @override
  String get gifFavoriteFirstTimeHint => 'נשאל רק פעם אחת.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'השתמש רק בכתובת URL (מומלץ)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'השתמש במדיה שמורה';

  @override
  String get favoritesHideConfirmTitle => 'הסתרת מועדפים';

  @override
  String get favoritesHideConfirmDescription =>
      'זה יסתיר את כל רכיבי הממשק הקשורים למועדפים, כולל כפתורים ופריטי תפריט. המועדפים הקיימים שלך יישמרו וניתן יהיה להפעיל אותם מחדש בכל עת מתוך הגדרות > מתקדם > מראה.';

  @override
  String get favoritesDirectMessageSubtitle => 'הודעה פרטית';

  @override
  String get messagesMediaDisplayGroupTitle => 'תצוגה';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'שליטה על אופן הצגת הודעות, מדיה ותוכן אחר.';

  @override
  String get messagesMediaMediaGroupTitle => 'מדיה';

  @override
  String get messagesMediaMediaGroupDescription =>
      'התאם אישית העדפות גודל מדיה וכפתורים.';

  @override
  String get messagesMediaInputGroupTitle => 'קלט';

  @override
  String get messagesMediaInputGroupDescription =>
      'התאם אישית את הגדרות קלט ההודעות.';

  @override
  String get messagesMediaSidebarGroupTitle => 'סרגל צד';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'הגדר כיצד יוצג סרגל הצד של הקהילה.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'להסתיר ערוצים מושתקים כברירת מחדל';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'הסתר ערוצים מושתקים בסרגל הצד באופן אוטומטי כשאתה מצטרף לקהילות חדשות';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'להסתיר ערוצים מושתקים כברירת מחדל?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'קהילות חדשות שתצטרף אליהן יסתירו אוטומטית ערוצים מושתקים. האם תרצה להחיל הגדרה זו גם על כל הקהילות הקיימות שלך?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'להפסיק להסתיר ערוצים מושתקים כברירת מחדל?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'ערוצים מושתקים בקהילות חדשות שאליהן תצטרף לא יוסתרו יותר באופן אוטומטי. האם ברצונך להציג ערוצים מושתקים גם בכל הקהילות הקיימות שלך?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'החל על כל הקהילות';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'הצג בכל הקהילות';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'קהילות חדשות בלבד';

  @override
  String get messagesMediaDisplaySectionTitle => 'תצוגת מדיה';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'נהל כיצד תמונות, סרטונים ומדיה אחרת מוצגים. כל המדיה עוברת שינוי גודל והמרה. קבצים גדולים במיוחד שלא ניתן לדחוס לתצוגה מקדימה לא יוטמעו ללא קשר להגדרות אלו.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel => 'כשמפורסם כקישורים בצ\'אט';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'כאשר מועלה ישירות ל־$productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'תצוגמות מקדימות של קישורים';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'קבע כיצד תצוגמות מקדימות של קישורי אתרים יוצגו בצ\'אט';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'הצג הטמעות ותצוגה מקדימה של קישורי אתרים';

  @override
  String get messagesMediaReactionsSectionTitle => 'תגובות';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'הגדר תגובות אימוג\'י להודעות';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'הצגת תגובות אימוג\'י בהודעות';

  @override
  String get messagesMediaSpoilersSectionTitle => 'תוכן מוסתר';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'שליטה כיצד תוכן מוסתר מוצג';

  @override
  String get messagesMediaSpoilersRadioLabel => 'הצג תוכן מוסתר';

  @override
  String get messagesMediaSpoilersOnClickName => 'בלחיצה';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'הצג תוכן ספוילר בלחיצה';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'בערוצים שאני מנהל/ת';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'הצג תמיד תוכן מוסתר בערוצים שבהם יש לך הרשאת \"נהל הודעות\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'תמיד';

  @override
  String get messagesMediaSpoilersAlwaysDescription => 'הצג תמיד תוכן ספוילר';

  @override
  String get messagesMediaSizeSectionTitle => 'העדפות גודל מדיה';

  @override
  String get messagesMediaSizeSectionDescription =>
      'התאם אישית את גודל התצוגה המרבי עבור מדיה מוטמעת ומצורפת. גדלים קטנים יותר משתמשים בפחות שטח מסך, בעוד שגדלים גדולים יותר מציגים יותר פרטים.';

  @override
  String get messagesMediaSizeEmbedLabel => 'מדיה מקישורים (הטמעות)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'קבצים מצורפים שהועלו';

  @override
  String get messagesMediaSizeCompactName => 'קטן (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'גודל מדיה קטן יותר';

  @override
  String get messagesMediaSizeComfortableName => 'נוח (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'גודל מדיה גדול יותר עם יותר פרטים';

  @override
  String get messagesMediaGifsSectionTitle => 'התנהגות GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'קבע כיצד קובצי GIF יוכנסו לצ\'אט';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'שליחה אוטומטית של קובצי GIF עם הבחירה';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'העלאות מצלמה';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'בחר אם לשמור תמונות וסרטונים שצולמו במצלמת האפליקציה במכשיר שלך';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'שמור במכשיר';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'השלמה אוטומטית של ביטויים (השלמה אוטומטית באמצעות נקודתיים)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'קבע אילו פריטים יופיעו בהשלמה האוטומטית של ביטויים כשאתה מקליד נקודתיים. התאם אישית אילו הצעות יופיעו כדי להתאים להעדפותיך.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'הצגת אימוג\'י ברירת מחדל בהשלמה אוטומטית של ביטויים';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'הצגת אימוג\'י מותאמים אישית בהשלמה אוטומטית של ביטויים';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'הצגת מדבקות בהשלמה אוטומטית של הבעות';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'הצגת מדיה שמורה בהשלמה אוטומטית של ביטויים';

  @override
  String get messagesMediaEditingSectionTitle => 'עריכת הודעות';

  @override
  String get messagesMediaEditingSectionDescription =>
      'קבע מה יקרה לטיוטת העריכה שלך כשתבטל.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'שמור טיוטת עריכה בביטול';

  @override
  String get accessibilitySaturationTitle => 'רוויה';

  @override
  String get accessibilitySaturationDescription =>
      'שנה את מידת הרוויה של צבעי ערכת הנושא בכל האפליקציה.';

  @override
  String get accessibilityVisualGroupTitle => 'תצוגה';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'תמיד להדגיש קווים תחתונים בקישורים';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'עמעום טקסט עם קו חוצה';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'תצוגה מקדימה של הודעות בצ\'אט פרטי';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'קבע מתי תצוגות מקדימות של הודעות יוצגו ברשימת ההודעות הישירות.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'מצב תצוגה מקדימה של הודעות פרטיות';

  @override
  String get accessibilityDmMessagePreviewAllName => 'כל ההודעות';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'הצג תצוגה מקדימה של הודעות עבור כל השיחות הפרטיות';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'הודעות שלא נקראו בלבד';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'הצג תצוגה מקדימה של הודעות רק בצ\'אטים פרטיים עם הודעות שלא נקראו';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'ללא';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'אל תציג תצוגות מקדימות של הודעות ברשימת ההודעות הפרטיות';

  @override
  String get accessibilityScreenReaderGroupTitle => 'קורא מסך';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'שליטה באופן שבו $productName פועל עם קוראי מסך.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'הכרזה על הודעות חדשות';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'אפשרו לקוראי מסך להכריז על הודעות חדשות כשהן מגיעות לערוץ הפתוח. צלילי התראות לא יושפעו.';

  @override
  String get accessibilityTtsGroupTitle => 'טקסט לדיבור';

  @override
  String get accessibilityTtsGroupDescription => 'בחר מהירות עבור טקסט מדובר.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => 'מהירות השמעת דיבור';

  @override
  String get accessibilityTtsPlaySampleLabel => 'הפעל דוגמה';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'השתקת דוגמה';

  @override
  String get accessibilityPreviewButtonLabel => 'לחצן תצוגה מקדימה';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'כך נראות תצוגות מקדימות של קישורים: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'משתמש בתצוגה מקדימה';

  @override
  String get accessibilityKeyboardGroupTitle => 'מקלדת';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'הצגת טבעת מיקוד בשדה הטקסט של הצ׳אט';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'מקש Escape יוצא ממצב מקלדת';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'הצגת קיצורי דרך של תפריט ההקשר';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'אישור לפני התחלת שיחות';

  @override
  String get accessibilityAnimationGroupTitle => 'אנימציה';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'תנועה מופחתת מופעלת, ולכן אנימציות תוכן מושהות כברירת מחדל. עדיין ניתן להפעיל כל אחת מהן בחזרה כדי להמשיך את ההפעלה.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'הפעלת אימוג\'י מונפשים';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'הפעלת GIF-ים אוטומטית';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'הפעל אוטומטית קובצי GIF כש־$productName ממוקד';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'מופעל למרות תנועה מופחתת.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'מושהה עקב תנועה מופחתת. הפעל כדי להמשיך להציג אימוג\'י מונפשים.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'מושהה עקב תנועה מופחתת. הפעל כדי להמשיך להציג קובצי GIF.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'ברירת המחדל היא כבוי בנייד כדי לשמור על חיי סוללה ושימוש בנתונים.';

  @override
  String get accessibilityStickerAnimationsTitle => 'אנימציות של מדבקות';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'העדפת אנימציית מדבקה';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'הנפשה תמיד';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'סטיקרים תמיד יונפשו';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'הנפשה באינטראקציה';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'סטיקרים יונפשו כשלוחצים עליהם';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'סטיקרים יונפשו כשתרחף מעליהם או תקיים איתם אינטראקציה';

  @override
  String get accessibilityStickerNeverAnimateName => 'לעולם אל תנפש';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'סטיקרים לעולם לא יונפשו';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'תמיד מונפש למרות תנועה מופחתת.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'הפחתת תנועה מגבילה מדבקות להנפשה בעת אינטראקציה. בחר באפשרות \"הנפש תמיד\" כדי לעקוף.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'ברירת המחדל היא אנימציה בעת אינטראקציה בנייד כדי לשמר את חיי הסוללה.';

  @override
  String get accessibilityMotionGroupTitle => 'תנועה';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'סנכרן את הגדרת הפחתת התנועה עם המערכת';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'השתמש בהעדפת התנועה המופחתת של המערכת במכשיר זה, או התאם אותה אישית למטה.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'הפחתת תנועה';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'השבתת אנימציות ומעברים. נשלט כרגע על ידי הגדרות המערכת שלך.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'השבתת אנימציות ומעברים בכל האפליקציה.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'אמוג\'י, קובצי GIF ומדבקות מונפשים נשארים בשליטתך בלשונית \'אנימציה\'.';

  @override
  String get accessibilityConfirmStartCallTitle => 'להתחיל שיחה?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'האם אתה בטוח שברצונך להתחיל את השיחה הזו?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'התחלת שיחה';

  @override
  String get accessibilityTtsSampleDescription =>
      'האזן לשורת הדוגמה המוקראת במהירות שבחרת.';

  @override
  String get accessibilityTtsSampleText =>
      'דוק, אני מהעתיד. הגעתי לכאן במכונת זמן שאתה המצאת. עכשיו, אני צריך את עזרתך כדי לחזור לשנת 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'סינתזת דיבור אינה זמינה במכשיר זה.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'הפעלת הדיבור נכשלה. יש לנסות שוב, או לבדוק שפלט השמע פועל.';

  @override
  String get ttsSubstitutionUnknownUser => 'משתמש לא ידוע';

  @override
  String get ttsSubstitutionUnknownRole => 'תפקיד לא ידוע';

  @override
  String get ttsSubstitutionUnknownChannel => 'ערוץ לא ידוע';

  @override
  String get ttsSubstitutionCodeBlock => 'בלוק קוד';

  @override
  String get ttsSubstitutionSpoiler => 'ספוילר';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'אמוג\'י $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'קו נטוי $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName אמר/ה: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'בתגובה ל$replyAuthorName, $authorName אמר/ה: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'שלח/ה מדבקה';

  @override
  String get ttsSentAttachment => 'שלח/ה קובץ מצורף';

  @override
  String ttsSentAttachments(int count) {
    return 'נשלחו $count קבצים מצורפים';
  }

  @override
  String get ttsSentEmbed => 'שלח/ה הטמעה';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author שלח/ה את $summary';
  }

  @override
  String get dmListSentAnAttachment => 'שלח/ה קובץ מצורף';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username הצמיד/ה הודעה לערוץ זה.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username הוסיף/ה את $userName לקבוצה.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username הוסיף/ה מישהו/מישהי לקבוצה.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username עזב.ה את הקבוצה.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username הסיר/ה את $userName מהקבוצה.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username הוציא/ה מישהו/י מהקבוצה.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username שינה/שינתה את שם הערוץ ל-$newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username שינה את שם הערוץ.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username שינה/שינתה את אייקון הערוץ.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username התחיל/ה שיחה.';
  }

  @override
  String get systemCallJoinTheCall => 'הצטרף/ה לשיחה';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username התחיל שיחה שנמשכה $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'פספסת שיחה מ-$username שנמשכה $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'פספסת שיחה מ-$username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'לפני שניות אחדות';

  @override
  String get systemCallDurationMinute => 'דקה';

  @override
  String get systemCallDurationOneYear => 'שנה אחת';

  @override
  String get systemCallDurationOneMonth => 'חודש אחד';

  @override
  String get systemCallDurationOneWeek => 'שבוע אחד';

  @override
  String get systemCallDurationOneDay => 'יום אחד';

  @override
  String get systemCallDurationOneHour => 'שעה אחת';

  @override
  String systemCallDurationYears(int count) {
    return '$count שנים';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count חודשים';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count שבועות';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count ימים';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count שעות';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count דקות';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'עדכנו את $productName כדי להציג את ההודעה הזו.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'אישור חיבור קולי';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'אתה כבר מחובר לערוץ הקולי הזה מ-$count מכשירים אחרים. מה תרצה לעשות?',
      one: 'אתה כבר מחובר לערוץ הקולי הזה ממכשיר אחר. מה תרצה לעשות?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'עבור למכשיר זה';

  @override
  String get voiceConnectionConfirmJustJoin => 'הצטרף כעת (השאר חיבורים אחרים)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'אל תעשה כלום, אני לא רוצה להצטרף';

  @override
  String get voiceJoinFailedTitle => 'לא ניתן היה להצטרף לשיחה';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'לא הצלחנו לנתק את המכשירים האחרים שלך. נסה שוב בעוד רגע.';

  @override
  String get voiceChannelEmptyDescription =>
      'זהו ערוץ קולי. התחבר כדי להתחיל לדבר!';

  @override
  String get voiceChannelJoin => 'הצטרף/הצטרפי לערוץ הקולי';

  @override
  String get voiceCallJoin => 'הצטרף לשיחה';

  @override
  String get voiceChannelJoinConnect => 'התחבר לשיחת קול';

  @override
  String get voiceChannelNoConnectPermission =>
      'אין לך הרשאה להצטרף לערוץ הקולי הזה';

  @override
  String get voiceChannelE2eeEncrypted =>
      'המיקרופון, המצלמה ותוכן שיתוף המסך מוצפנים מקצה לקצה.';

  @override
  String get voiceCallE2eeEncrypted =>
      'המיקרופון, המצלמה ותוכן שיתוף המסך מוצפנים מקצה לקצה.';

  @override
  String get voiceChannelE2eeBroken =>
      'הצפנה מקצה לקצה אינה זמינה מכיוון שמשתתף לא נתמך נמצא בערוץ הקולי הזה.';

  @override
  String get voiceCallE2eeBroken =>
      'הצפנה מקצה לקצה אינה זמינה מכיוון שמשתתף לא נתמך נמצא בשיחה זו.';

  @override
  String get voiceE2eeUpdateRequired =>
      'יש לעדכן את הלקוח הזה לפני הצטרפות לשיחה מוצפנת זו.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'לא הצלחנו להפעיל את המיקרופון שלך. אתה עדיין בשיחה.';

  @override
  String get voiceChannelStatusConnecting => 'מתחבר…';

  @override
  String get voiceChannelStatusConnected => 'מחובר';

  @override
  String get voiceChannelStatusError => 'שגיאה';

  @override
  String get voiceParticipantTooltipMobileDevice => 'מכשיר נייד';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'מכשיר דסקטופ';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'הקהילה השתיקה';

  @override
  String get voiceParticipantTooltipMuted => 'מושתק';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'הקהילה השתיקה';

  @override
  String get voiceParticipantTooltipDeafened => 'מושתק (לא שומע)';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'חיבור: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count משתתפים',
      one: 'משתתף אחד',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'יציאה';

  @override
  String get voiceControlMute => 'השתק';

  @override
  String get voiceControlUnmute => 'בטל השתקה';

  @override
  String get voiceControlDeafen => 'השתק שמע';

  @override
  String get voiceControlUndeafen => 'בטל השתקה (אוזניות)';

  @override
  String get voiceControlVideo => 'וידאו';

  @override
  String get voiceControlFlipCamera => 'החלף מצלמה';

  @override
  String get voiceControlScreenShare => 'שיתוף מסך';

  @override
  String get voiceScreenShareNotificationText => 'משתף את המסך שלך.';

  @override
  String get voiceControlMore => 'עוד';

  @override
  String get voiceControlDisconnect => 'התנתק';

  @override
  String get voiceInChat => 'בצ\'אט קולי';

  @override
  String get voiceConnectionFailed => 'החיבור נכשל';

  @override
  String get voiceConnectionRetry => 'נסה שוב';

  @override
  String get voiceConnectionDismiss => 'בטל';

  @override
  String get voiceConnectionDisconnected => 'מנותק';

  @override
  String voicePingMs(int currentLatency) {
    return 'פינג: ${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => 'מודד השהיה...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'קפוץ אל $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'חיבור קולי';

  @override
  String get voiceConnectionAdvancedStats => 'מתקדם';

  @override
  String get voiceShowCallAvatars => 'הצג אווטרים של שיחה';

  @override
  String get voiceShowConnectionId => 'הצגת מזהה חיבור';

  @override
  String get voiceAudioProcessing => 'עיבוד שמע';

  @override
  String get voiceConnectionSessionSection => 'הפעלה';

  @override
  String get voiceConnectionDurationLabel => 'משך';

  @override
  String get voiceConnectionParticipantsLabel => 'משתתפים';

  @override
  String get voiceConnectionNetworkSection => 'רשת';

  @override
  String get voiceConnectionPingLabel => 'פינג';

  @override
  String get voiceConnectionJitterLabel => 'ריצוד';

  @override
  String get voiceConnectionSendLabel => 'שליחה';

  @override
  String get voiceConnectionReceiveLabel => 'קבל';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes דקות $seconds שניות';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency אלפיות השנייה';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter אלפיות השנייה';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth קילו-ביט לשנייה';
  }

  @override
  String get userAreaMuteMicrophone => 'השתקת מיקרופון';

  @override
  String get userAreaUnmuteMicrophone => 'בטל השתקת מיקרופון';

  @override
  String get userAreaUserSettings => 'הגדרות משתמש';

  @override
  String get voiceParticipantMenuViewProfile => 'הצגת פרופיל';

  @override
  String get voiceParticipantMenuFocus => 'התמקד באדם זה';

  @override
  String get voiceParticipantMenuUnfocus => 'הסר מיקוד';

  @override
  String get voiceParticipantMenuCommunityMute => 'השתקה בקהילה';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'השתקה בשיחה קולית';

  @override
  String get voiceParticipantMenuUserVolume => 'עוצמת שמע של משתמש';

  @override
  String get voiceParticipantMenuStreamVolume => 'עוצמת שידור';

  @override
  String get voiceParticipantMenuStopStreaming => 'הפסק הזרמה';

  @override
  String get voiceParticipantModerationFailed =>
      'לא ניתן היה לעדכן את החבר. אנא נסה שוב.';

  @override
  String get voiceControlChat => 'צ\'אט';

  @override
  String get voiceCallViewModeLabel => 'הצגה';

  @override
  String get voiceCallViewModeGrid => 'תצוגת רשת';

  @override
  String get voiceCallViewModeFocus => 'פוקוס';

  @override
  String get voicePanelSettingsSectionTitle => 'הגדרות קוליות';

  @override
  String get voicePanelUseEarpieceLabel => 'השתמש בשפופרת';

  @override
  String get voicePanelOnlyShowVideosLabel => 'הצג רק סרטונים';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'הצג רק משתתפים שמצלמתם פועלת.';

  @override
  String get voicePanelShowOwnCameraLabel => 'הצגת המצלמה שלי';

  @override
  String get voicePrioritizeSpeakersLabel => 'תעדוף דוברים';

  @override
  String get voiceTextChatShow => 'הצגת צ\'אט';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# הודעות שלא נקראו',
      one: '# הודעה שלא נקראה',
    );
    return 'הצג צ\'אט עם $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired => 'נדרשת הרשאת מצלמה עבור וידאו.';

  @override
  String get voiceErrorScreenShareToggle =>
      'לא ניתן היה להתחיל שיתוף מסך. נסה שוב.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'ההרשאה לשיתוף מסך נדחתה.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'שיתוף מסך אינו זמין במכשיר זה.';

  @override
  String get voiceWatchStream => 'צפה בשידור';

  @override
  String get voiceStopWatching => 'הפסק לעקוב';

  @override
  String get voiceStopWatchingCurrentStreamTooltip => 'הפסק לצפות בזרם הנוכחי';

  @override
  String get voiceOwnScreenShareTitle => 'אתה משדר';

  @override
  String get voiceOwnScreenShareSubtitle => 'השידור שלך בשידור חי למשתתפים.';

  @override
  String get voiceLiveBadge => 'בשידור חי';

  @override
  String get dmVoiceViewCall => 'הצגת שיחה';

  @override
  String get dmVoiceCallFullScreen => 'מסך מלא';

  @override
  String get dmVoiceCallFullScreenTooltip => 'פתח שיחה במסך מלא';

  @override
  String get dmVoiceStripStatusConnecting => 'מתחבר…';

  @override
  String get dmVoiceStripStatusInCall => 'בשיחה';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'שיחת קול';

  @override
  String get dmVoiceCallBarConnecting => 'מתחבר…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'שיחת ישירה';

  @override
  String get dmVoiceCallBarGroupPrimary => 'שיחת קבוצה';

  @override
  String get dmVoiceCallBarIssueFallback => 'בעיית קול';

  @override
  String get dmVoiceFullscreenTitle => 'קולי';

  @override
  String get voiceCallBarGuildConnectedFallback => 'מחובר לשיחה קולית';

  @override
  String get notificationsPageTitle => 'התראות';

  @override
  String get notificationsFilterUnreads => 'הודעות שלא נקראו';

  @override
  String get notificationsFilterMentions => 'אזכורים';

  @override
  String get notificationsBookmarksTooltip => 'סימניות';

  @override
  String get notificationsMentionFilterTooltip => 'סינון אזכורים';

  @override
  String get notificationsMentionFiltersTitle => 'סינוני התראות';

  @override
  String get notificationsMentionIncludeEveryone =>
      'כלול אזכורי @everyone ו-@here';

  @override
  String get notificationsMentionIncludeRoles => 'כלול אזכורי תפקידים';

  @override
  String get notificationsMentionIncludeGuilds => 'כלול את כל האזכורים בקהילה';

  @override
  String get notificationsNoUnreadTitle => 'אין הודעות שלא נקראו';

  @override
  String get notificationsNoUnreadBody => 'הכול סודר.';

  @override
  String get notificationsNoMentionsTitle => 'אין אזכורים אחרונים';

  @override
  String get notificationsNoMentionsBody =>
      'כל ה-@אזכורים שלך יופיעו כאן למשך 7 ימים.';

  @override
  String get notificationsMentionsEndTitle => 'הגעת לקצה';

  @override
  String get notificationsMentionsEndBody =>
      'ראית את כל ההזכרות האחרונות שלך. אל דאגה, עוד יופיעו כאן בקרוב.';

  @override
  String get notificationsJump => 'קפיצה';

  @override
  String get notificationsRemoveMentionTooltip => 'הסר/י אזכור';

  @override
  String get notificationsViewAllUnread => 'הצג את כל ההודעות שלא נקראו';

  @override
  String get notificationsMarkAsRead => 'סמן כנקרא';

  @override
  String get notificationsExpand => 'הרחבה';

  @override
  String get notificationsCollapse => 'כיווץ';

  @override
  String get notificationsMessageUnavailable => 'הודעה זו לא נטענה.';

  @override
  String characterCounterRemaining(int remaining) {
    return 'נותרו $remaining תווים';
  }

  @override
  String get characterCounterTooLong => 'ההודעה ארוכה מדי';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining תווים נותרו. קבלו את $productName כדי לכתוב עד $premiumMaxLength תווים.';
  }

  @override
  String get chatMessageFailedToSend => 'הודעה נכשלה בשליחה';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'ההודעה שלך לא נמסרה. בדרך כלל זה קורה מכיוון שאתה לא חולק קהילה עם הנמען או שהנמען מקבל הודעות ישירות רק מחברים. ייתכן שתצטרך גם להתאים את הגדרות הפרטיות שלך להודעות ישירות ב- $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'ההודעה שלך לא נשלחה. עליך לאמת את חשבונך כדי לשלוח הודעות פרטיות.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'ההודעה שלך לא נשלחה. עליך לתבוע בעלות על החשבון שלך כדי לשלוח הודעות.';

  @override
  String get chatSendFailureContentBlocked =>
      'ההודעה שלך לא נמסרה כי היא סומנה על ידי מערכות הבטיחות שלנו. אם לדעתך זו טעות, אנא פנה/י לתמיכה.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'ההודעה שלך לא נמסרה מכיוון שהיא מכילה אימוג\'י או מדבקות בוגרים שאסורים בהקשר זה.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'רק אתה יכול לראות את ההודעה הזו.';

  @override
  String get chatClientSystemDismiss => 'בטל';

  @override
  String get privacyDashboardCommunicationSection => 'תקשורת';

  @override
  String get privacyDashboardProfilePrivacySection => 'פרטיות הפרופיל';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'חברים והודעות ישירות';

  @override
  String get privacyDashboardActivitySharingSection => 'שיתוף פעילות';

  @override
  String get privacyDashboardSensitiveContentSection => 'תוכן רגיש';

  @override
  String get privacyDashboardDataExportSection => 'ייצוא נתונים';

  @override
  String get privacyDashboardDataDeletionSection => 'מחיקת נתונים';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'מי יכול לראות את הפרופיל המלא שלך';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'חברים וכל הקהילות';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'הפרופיל המלא שלך גלוי לחברים ולכל מי שבקהילות שלך';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'חברים וקהילות קטנות בלבד';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'הפרופיל המלא שלך גלוי לחברים ולחברי קהילות עם 200 חברים או פחות';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'חברים בלבד';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'הפרופיל המלא שלך גלוי רק לחברים שלך';

  @override
  String get privacyDashboardFriendRequestsTitle => 'בקשות חברות';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'כולם';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'אפשר לכל אחד לשלוח לך בקשות חברות';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'חברים של חברים';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'אפשר לחברים של החברים שלך לשלוח לך בקשות';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers => 'חברי קהילה';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'אפשר לחברים מקהילות שאתה חבר בהן לשלוח לך בקשות';

  @override
  String get privacyDashboardDirectMessagesTitle => 'הודעות ישירות';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'אפשר הודעות ישירות מחברי קהילה';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'אפשר לחברי קהילות שאתה חבר בהן לשלוח לך הודעות ישירות';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'אפשר הודעות ישירות מבוטים קהילתיים';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'אפשר לבוטים מקהילות שאתה חבר בהן לשלוח לך הודעות ישירות';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'קבע מי יכול לשלוח לך בקשות חבר והודעות ישירות';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'קבע מי יכול להתקשר אליך ולהוסיף אותך לקבוצות';

  @override
  String get privacyDashboardIncomingCallsTitle => 'שיחות נכנסות';

  @override
  String get privacyDashboardIncomingCallsDesc => 'קבע מי יכול להתקשר אליך';

  @override
  String get privacyDashboardAllowedCallers => 'מתקשרים מורשים';

  @override
  String get privacyDashboardIncomingCallNobody => 'אף אחד';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'חסום את כל השיחות הנכנסות';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'רק חברים';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'אפשר לחברים בלבד להתקשר אליך (מומלץ)';

  @override
  String get privacyDashboardIncomingCallCustom => 'חברים + מותאם אישית';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'אפשר לחברים ולקבוצות נוספות שתבחרו';

  @override
  String get privacyDashboardIncomingCallEveryone => 'כולם';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'אפשר לכל אחד להתקשר אליך, גם זרים';

  @override
  String get privacyDashboardAdditionalGroups => 'קבוצות נוספות';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'אנשים שחברים של החברים שלך יכולים להתקשר אליך';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'אנשים מקהילות שאתם חברים בהן יכולים להתקשר אליך';

  @override
  String get privacyDashboardRingBehavior => 'התנהגות טבעת';

  @override
  String get privacyDashboardSilentCalls => 'שיחות שקטות מכולם';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'כל השיחות יתקשרו בשקט במקום לצלצל. כברירת מחדל, שיחות מאנשים שאינם חברים תמיד שקטות.';

  @override
  String get privacyDashboardGroupDmTitle => 'מי יכול להוסיף אותך לקבוצות';

  @override
  String get privacyDashboardGroupDmDesc =>
      'קבע מי יכול להוסיף אותך לקבוצות ללא אישור. כל אחד עדיין יכול לשלוח לך קישורי הזמנה להצטרפות.';

  @override
  String get privacyDashboardAllowedInvites => 'הזמנות מותרות';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'אל תאפשר לאף אחד להוסיף אותך לקבוצות צ\'אט בלי לשאול';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'אפשר לחברים בלבד להוסיף אותך ללא אישור (מומלץ)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'אפשר לחברים ולקבוצות נוספות להוסיף אותך';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'אפשר לכל אחד להוסיף אותך לקבוצות צ\'אט בלי לבקש';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'אנשים שהם חברים של החברים שלך יכולים להוסיף אותך לצ\'אטים קבוצתיים';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'אנשים מקהילות שאתם חברים בהן יכולים להוסיף אתכם לצ\'אטים קבוצתיים';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'פעילות קולית ב\'פעיל עכשיו\'';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'שתף את פעילותך הקולית עם חברים';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'לשתף פעילות קולית עם כל החברים?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'להפסיק לשתף פעילות קולית עם כל החברים?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'אתה עומד להתחיל לשתף את פעילותך הקולית עם כל החברים שלך, כולל חברים עתידיים. פעולה זו שולחת עדכון לכולם וניתן לשנות אותה שוב רק בעוד 24 שעות.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'אתה עומד להפסיק לשתף את פעילותך הקולית עם כל החברים שלך, כולל חברים עתידיים. פעולה זו שולחת עדכון לכולם וניתן לשנות אותה שוב רק בעוד 24 שעות.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'כן, שתף עם כל החברים';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'כן, הפסק לשתף';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'זמין שוב בעוד $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'שיתוף הפעילות הקולית עודכן';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'לא ניתן היה לעדכן את שיתוף הפעילות הקולית כעת';

  @override
  String get privacyDashboardDataExportDesc =>
      'אפשר ליצור ארכיון להורדה של נתוני החשבון שלך, כולל הודעות וכתובות URL של קבצים מצורפים. רוב האנשים רוצים הכל, אבל אפשר לצמצם את ההיקף למטה.';

  @override
  String get privacyDashboardExportMyData => 'ייצוא הנתונים שלי';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'הסר לצמיתות הודעות ששלחת בצ\'אטים פרטיים, צ\'אטים קבוצתיים וקהילות. הפעולה תתבצע ברקע, ותקבל הודעה פרטית כשתסתיים.';

  @override
  String get privacyDashboardDeleteMyMessages => 'מחיקת ההודעות שלי';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'לאפשר הודעות ישירות מחברי קהילה?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'לחסום הודעות פרטיות מחברי קהילה?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'לאפשר לבוטים לשלוח לך הודעות פרטיות?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'לחסום בוטים מלשלוח לך הודעות פרטיות?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'האם ברצונך לאפשר גם הודעות ישירות מחברים בקהילות הקיימות שלך?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'האם ברצונך לחסום גם הודעות ישירות מחברים בקהילות הקיימות שלך?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'האם ברצונך לאפשר גם לבוטים מהקהילות הקיימות שלך לשלוח לך הודעות ישירות?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'האם ברצונך לחסום בוטים גם מהקהילות הקיימות שלך?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'אפשר גם לשנות את ההגדרה הזו לפי קהילה על ידי לחיצה ארוכה על שם הקהילה ובחירה ב\"הגדרות פרטיות\".';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'אפשר לכל הקהילות';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'חסימה מכל הקהילות';

  @override
  String get privacyDashboardDmConfirmSkip => 'דלג על שלב זה';

  @override
  String get privacyDashboardDataRequestGoBack => 'חזרה';

  @override
  String get privacyDashboardDataRequestExportTitle => 'ייצוא הנתונים שלי';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'מחיקת ההודעות שלי';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'נעבד זאת בהקדם האפשרי. תקבל אימייל כשהארכיון שלך יהיה מוכן.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'נעבד זאת בהקדם האפשרי. תקבל/י מאיתנו הודעה פרטית כשזה יסתיים.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'מה לכלול';

  @override
  String get privacyDashboardDataRequestExportEverything => 'הכל';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'ייצא את כל ההודעות ששלחת אי פעם, בתוספת כל הגדרות החשבון, החברויות והמטא-נתונים שלך.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'בחירה מותאמת אישית';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'בחר אילו סוגי שיחות, קהילות וחלון זמן לכלול בארכיון.';

  @override
  String get privacyDashboardDataRequestDeleteSelected => 'בחר מה לכלול';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'בחר אילו סוגי שיחות לנקות.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'רק מקומות שאין לי גישה אליהם יותר';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'מחיקת הודעות רק מקהילות וצ\'אטים קבוצתיים שעזבת או שהוסרת מהם.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'אילו שיחות';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'החלף את סוגי השיחות שברצונך לכלול.';

  @override
  String get privacyDashboardDataRequestKindDms => 'הודעות פרטיות פתוחות';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'הודעות פרטיות סגורות';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'הודעות קבוצתיות';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'קהילות';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'אילו קהילות';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'סינון קהילות';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'כלול הכל מלבד הנבחרים';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'רק הנבחרים';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'אינך חבר/ה באף קהילה כרגע.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'טווח זמן';

  @override
  String get privacyDashboardDataRequestDateMode => 'טווח זמן';

  @override
  String get privacyDashboardDataRequestAllTime => 'כל הזמן';

  @override
  String get privacyDashboardDataRequestCustomRange => 'טווח מותאם אישית';

  @override
  String get privacyDashboardDataRequestStartDate => 'תאריך התחלה';

  @override
  String get privacyDashboardDataRequestEndDate => 'תאריך סיום';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'השאר/י אחד מהשדות ריק כדי להשאיר את הקצה הזה של החלון ללא הגבלה.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'יש לבחור סוג שיחה אחד לפחות לכלול.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'תאריך ההתחלה חייב להיות מוקדם יותר מתאריך הסיום.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'בדיקה ואישור';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'ניצור ארכיון להורדה של כל ההודעות ששלחת אי פעם ונשלח לך אימייל כשהוא יהיה מוכן. קישור ההורדה באימייל יפוג לאחר 7 ימים.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'ניצור ארכיון להורדה שתואם את המסננים שבהמשך ונשלח לך אימייל כשהוא יהיה מוכן. קישור ההורדה באימייל יפוג לאחר 7 ימים.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'מחיקה לצמיתות של ההודעות התואמות למסננים הבאים. לא ניתן לבטל פעולה זו.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'לא ניתן לשחזר את הנתונים לאחר שהתהליך יתחיל. נשלח לך הודעה פרטית כשהוא יסתיים.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'בקשת ייצוא';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'מחיקת הודעות';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'היקף חיפוש';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'שיחות';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'קהילות';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'טווח זמן';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'ללא';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'מ־$start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'עד $end';
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
      other: '# קהילות',
      one: '# קהילה',
    );
    return 'הכול למעט $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# קהילות',
      one: '# קהילה',
    );
    return 'רק $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'הודעות פרטיות פתוחות';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'הודעות פרטיות סגורות';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'הודעות פרטיות (פתוחות וסגורות)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'הודעות קבוצתיות';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded => 'קהילות';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# שעות',
      one: '# שעה',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# דקות',
      one: '# דקה',
    );
    return '$_temp0 ו-$_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# שעות',
      one: '# שעה',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# דקות',
      one: '# דקה',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# שניות',
      one: '# שנייה',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'שגיאה בטעינת הגדרות הפרטיות';

  @override
  String get privacyDashboardRetry => 'נסה שוב';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'נכשל שמירת הגדרות תוכן רגיש.';

  @override
  String get privacyDashboardDataRequestFailed => 'הבקשה נכשלה.';

  @override
  String get chatMessageDeleteFailed => 'מחיקת הודעה נכשלה';

  @override
  String get chatMessageAddReaction => 'הוסף תגובה';

  @override
  String get chatMessageEdit => 'עריכת הודעה';

  @override
  String get chatMessageReply => 'השב/השיבי';

  @override
  String get chatMessageForward => 'העברה';

  @override
  String get forwardMessageTitle => 'העברת הודעה';

  @override
  String get forwardSearchHint => 'חיפוש ערוצים או צ\'אטים פרטיים';

  @override
  String get forwardDirectMessagesSection => 'הודעות ישירות';

  @override
  String get forwardCommentHint => 'הוסף תגובה (אופציונלי)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'שלח ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'לא נמצאו ערוצים';

  @override
  String get forwardSuccessToast => 'ההודעה הועברה';

  @override
  String get forwardFailed => 'ההודעה לא נשלחה';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'הערות אינן זמינות מכיוון שערוץ נבחר מפעיל מצב איטי.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'ממתין שתקופת ההגבלה (slowmode) באחד או יותר מהערוצים שנבחרו תסתיים.';

  @override
  String get slowmodeRateLimitedTitle => 'מצב איטי פעיל';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'מצב איטי מופעל – המתן $duration לפני שליחת הודעה נוספת.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'העלאה ישירה מושבתת במצב איטי.';

  @override
  String get shareMediaTitle => 'שתף אל';

  @override
  String get shareMediaMessageHint => 'הוסף הודעה אופציונלית…';

  @override
  String get shareMediaSendButton => 'שליחה';

  @override
  String get shareMediaSuccessToast => 'מדיה שותפה';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'שותף ל-$count יעדים';
  }

  @override
  String get shareMediaFailedToast => 'נכשל שיתוף המדיה';

  @override
  String get forwardDestinationNoSendPermission =>
      'אינך יכול לשלוח הודעות לכאן';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'אי אפשר להטמיע קישורים כאן';

  @override
  String get forwardDestinationNoAttachPermission => 'לא ניתן לצרף קבצים לכאן';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'שליחת הודעות מושבתת בקהילה זו';

  @override
  String get forwardDestinationTimedOut => 'אתה בהשעיה בקהילה זו';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'השהיה - המתן $remaining';
  }

  @override
  String get chatMessageCopyText => 'העתק הודעה';

  @override
  String get chatMessageCopyEmbedText => 'העתק טקסט הטמעה';

  @override
  String get chatMessageTranslate => 'תרגום';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'מתורגם מ- $language';
  }

  @override
  String get chatMessageSeeOriginal => 'הצג מקורי';

  @override
  String get chatMessageSeeTranslation => 'הצג תרגום';

  @override
  String get chatMessageTranslating => 'מתרגם…';

  @override
  String get chatMessageTranslateFailed => 'לא ניתן היה לתרגם הודעה זו.';

  @override
  String get chatMessageTranslateUnavailable => 'התרגום אינו זמין במכשיר זה.';

  @override
  String get chatMessageSpeak => 'השמעת ההודעה';

  @override
  String get chatMessageStopSpeaking => 'הפסק לדבר';

  @override
  String get chatMessagePin => 'הצמד הודעה';

  @override
  String get chatMessageUnpin => 'בטל הצמדת הודעה';

  @override
  String get chatMessageUnpinIt => 'לבטל את ההצמדה';

  @override
  String get chatMessageBookmark => 'שמור הודעה בסימניות';

  @override
  String get chatMessageRemoveBookmark => 'הסר סימניה';

  @override
  String get chatMessageMarkAsUnread => 'סמן כלא נקרא';

  @override
  String get chatMessageCopyMessageLink => 'העתק קישור להודעה';

  @override
  String get chatMessageOpenLink => 'פתח קישור';

  @override
  String get chatMessageCopyLink => 'העתקת קישור';

  @override
  String get chatMessageCopyMessageId => 'העתק את מזהה ההודעה';

  @override
  String get chatMessageViewReactions => 'הצגת תגובות';

  @override
  String get chatMessageRemoveAllReactions => 'הסר את כל התגובות';

  @override
  String get chatMessageDebug => 'הודעת דיבאג';

  @override
  String get chatMessageDebugSheetTitle => 'ניפוי באגים בהודעה';

  @override
  String get chatMessageDebugCopyJson => 'העתק JSON';

  @override
  String get chatMessageDebugJsonCopiedToast => 'ה-JSON של ההודעה הועתק ללוח';

  @override
  String get chatReactionsSheetTitle => 'תגובות';

  @override
  String get chatReactionsSheetEmpty => 'אף אחד עדיין לא הגיב עם זה.';

  @override
  String get chatReactionAddFailed => 'נכשל הוספת תגובה';

  @override
  String get chatReactionRemoveFailed => 'הסרת התגובה נכשלה';

  @override
  String get chatMessageReport => 'דווח על הודעה';

  @override
  String get iarReportMessageTitle => 'דיווח על הודעה';

  @override
  String get iarThisUserFallback => 'המשתמש הזה';

  @override
  String get iarModalDescription =>
      'דווח על הפרת כלל, או מצא כלים לניהול אנשי קשר והעדפות.';

  @override
  String get iarPathStepAriaLabel => 'במה תרצו לעזור?';

  @override
  String get iarCategoryStepTitle => 'איזה כלל הופר?';

  @override
  String get iarReasonStepTitle => 'איזה כלל הופר?';

  @override
  String get iarReasonSelectHint => 'בחר סיבה';

  @override
  String get iarPickAnOptionToast => 'בחר אפשרות כדי להמשיך.';

  @override
  String get iarPickARuleToast => 'בחר את הכלל שהופר.';

  @override
  String get iarPathPlatform => 'דווח על הפרת כלל הפלטפורמה';

  @override
  String get iarPathCommunity => 'דווח למנהלי הקהילה הזו';

  @override
  String get iarPathPreferenceMessage => 'אני לא אוהב את התוכן הזה';

  @override
  String get iarCategoryTargetedHarmLabel => 'איומים, הטרדה או פגיעה';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'בריונות, איומים, שנאה, אלימות, פשיטות או תוכן שדוחף לפגיעה עצמית.';

  @override
  String get iarCategorySafetyMinorsLabel => 'בטיחות ילדים או תוכן למבוגרים';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'קטינים בסיכון, תוכן למבוגרים במקום הלא נכון או התנהגות לא רצויה.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'פרטיות או התחזות';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'דוקסינג, מעקב, התחזות או פרופיל לא הולם.';

  @override
  String get iarCategoryDeceptionLabel => 'הונאות, תוכנות זדוניות או מידע שגוי';

  @override
  String get iarCategoryDeceptionDescription =>
      'דיוג, הונאה, קישורים זדוניים או טענות שקריות שעלולות לגרום נזק בעולם האמיתי.';

  @override
  String get iarCategoryIllegalOtherLabel => 'פעילות בלתי חוקית או משהו אחר';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'מכירות לא חוקיות, סיוע לפעילות פלילית או הפרת כלל ברורה שאינה מתאימה לקטגוריות שלעיל.';

  @override
  String get iarReasonHarassmentLabel => 'הטרדה או איומים';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'בריונות, יצירת קשר חוזרת ובלתי רצויה, מעקב או התעללות ממוקדת.';

  @override
  String get iarReasonHateLabel => 'דברי שטנה';

  @override
  String get iarReasonHateMessageDescription =>
      'השמצות, שפה מבזה או תקיפות נגד קבוצות מוגנות.';

  @override
  String get iarReasonViolenceLabel => 'אלימות או איומים באלימות';

  @override
  String get iarReasonViolenceDescription =>
      'איומים אמינים, אלימות גרפית או האדרת אלימות.';

  @override
  String get iarReasonMatureContentLabel => 'תוכן למבוגרים או הטרדה';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'התנהגות לא רצויה או תוכן למבוגרים במקום הלא נכון.';

  @override
  String get iarReasonChildSafetyLabel => 'בטיחות ילדים או ניצול קטינים';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'תוכן של פיתוי קטינים או ניצול ילדים.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'מידע שגוי מזיק';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'טענות שקריות שעלולות לגרום נזק בעולם האמיתי.';

  @override
  String get iarReasonSpamLabel => 'ספאם, הונאות או פישינג';

  @override
  String get iarReasonSpamMessageDescription =>
      'ספאם המוני, הונאה, הגרלות מזויפות או שימוש לרעה בחשבון.';

  @override
  String get iarReasonMalwareLabel => 'תוכנה זדונית או קישורים מסוכנים';

  @override
  String get iarReasonMalwareDescription =>
      'תוכנות זדוניות, גניבת פרטי כניסה או קבצים מזיקים.';

  @override
  String get iarReasonPrivacyLabel => 'הפרת פרטיות';

  @override
  String get iarReasonPrivacyDescription =>
      'חשיפת מידע אישי (Doxxing), חשיפת מידע פרטי או מעקב אובססיבי (סטוקינג).';

  @override
  String get iarReasonImpersonationLabel => 'התחזות או מדיה מטעה';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'התחזות לאדם אחר, כולל תוכן מטעה שנוצר על ידי AI.';

  @override
  String get iarReasonIllegalLabel => 'פעילות בלתי חוקית';

  @override
  String get iarReasonIllegalDescription =>
      'מכירות לא חוקיות, סיוע לפשיעה או פעילות בלתי חוקית.';

  @override
  String get iarReasonSelfHarmLabel => 'פגיעה עצמית או התאבדות';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'קידום או הנחיות המעודדים פגיעה עצמית או הפרעות אכילה.';

  @override
  String get iarReasonOtherLabel => 'הפרה ברורה נוספת של הכללים';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'יש להשתמש רק אם זה מפר באופן ברור את הכללים של $productName ולא מתאים לאף אחת מהאפשרויות שלעיל.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'אם מעורב קטין, השתמש ב-\"$childSafetyReason\" במקום זאת.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'אם זה כולל חומר פגיעה מינית בילדים (CSAM) או ניצול קטינים, שלח זאת עכשיו ואל תשתף את החומר מחדש.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'אם מישהו נמצא בסכנה מיידית, צור קשר עם שירותי החירום המקומיים אם אתה יכול לעשות זאת בבטחה.';

  @override
  String get iarSafetyNoteViolence =>
      'אם זהו איום ממשי ואמין, צור קשר גם עם שירותי החירום המקומיים.';

  @override
  String get iarSafetyNoteTerrorism =>
      'אם זהו איום טרור מיידי, צור קשר גם עם שירותי החירום המקומיים.';

  @override
  String get iarActionBlockUserTitle => 'לחסום משתמש זה';

  @override
  String get iarActionBlockUserDescription => 'הפסקת הודעות ובקשות חברות.';

  @override
  String get iarActionBlockUserButton => 'חסימה';

  @override
  String get iarActionCopyMessageLinkTitle => 'העתקת קישור להודעה';

  @override
  String get iarActionCopyMessageLinkDescription => 'שתף עם מנהלי קהילה.';

  @override
  String get iarActionCopyMessageLinkButton => 'העתקה';

  @override
  String get iarActionCloseDmTitle => 'סגור את ההתכתבות הזו';

  @override
  String get iarActionCloseDmDescription =>
      'לא חוסם. אפשר לפתוח שוב מאוחר יותר.';

  @override
  String get iarActionCloseDmButton => 'סגירת צ\'אט';

  @override
  String get iarActionLeaveCommunityTitle => 'יציאה מהקהילה';

  @override
  String get iarActionLeaveCommunityDescription =>
      'להפסיק לראות את התוכן והחברים שלה.';

  @override
  String get iarActionLeaveCommunityButton => 'יציאה';

  @override
  String get iarActionDmSettingsTitle => 'הגדרות הודעות פרטיות ובקשות חברות';

  @override
  String get iarActionDmSettingsDescription => 'שנה מי יכול להגיע אליך.';

  @override
  String get iarActionCallSettingsTitle => 'הגדרות שיחות וצ׳אטים קבוצתיים';

  @override
  String get iarActionCallSettingsDescription =>
      'שנה מי יכול להתקשר אליך או להוסיף אותך.';

  @override
  String get iarActionOpenButton => 'פתח';

  @override
  String get iarActionDeleteMessageTitle => 'מחיקת ההודעה הזו';

  @override
  String get iarActionDeleteMessageDescription => 'הסר אותה מהערוץ עבור כולם.';

  @override
  String get iarActionDeleteMessageButton => 'מחק';

  @override
  String get iarActionDeleteMessageDeletedButton => 'נמחק';

  @override
  String get iarActionDeleteMessageDeletedTooltip => 'ההודעה הזו כבר נמחקה.';

  @override
  String get iarActionBanUserTitle => 'חסום משתמש זה';

  @override
  String get iarActionBanUserDescription => 'פתיחת דו־שיח חסימה עבור קהילה זו.';

  @override
  String get iarActionBanUserButton => 'חסימה';

  @override
  String get iarActionBanUserBannedButton => 'נחסם';

  @override
  String get iarActionBanUserBannedTooltip => 'משתמש זה כבר נחסם מהקהילה.';

  @override
  String get iarCloseDmConfirmTitle => 'סגירת צ\'אט';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'סגור את ההודעה הישירה הנוכחית שלך עם $name. פעולה זו לא תחסום אותם; תוכל לפתוח אותה מחדש מאוחר יותר.';
  }

  @override
  String get iarSuccessTitle => 'הדיווח נשלח';

  @override
  String get iarSuccessBody =>
      'צוות הבטיחות שלנו בודק את הדיווח. נשלח לך הודעה פרטית ואימייל ברגע שנגיע להחלטה.';

  @override
  String get iarAlreadyReportedTitle => 'דווח כבר';

  @override
  String get iarAlreadyReportedBody =>
      'כבר דיווחת על ההודעה הזו. צוות הבטיחות שלנו בוחן אותה.';

  @override
  String get iarBackButton => 'חזרה';

  @override
  String get iarContinueButton => 'המשך';

  @override
  String get iarSendReportButton => 'שליחת דיווח';

  @override
  String get iarDoneButton => 'בוצע';

  @override
  String get iarCouldntSendToast => 'לא ניתן היה לשלוח את הדיווח. נסה שוב.';

  @override
  String get iarRateLimitedToast =>
      'אתה שולח דיווחים מהר מדי. אנא המתן רגע ונסה שוב.';

  @override
  String get iarReportSentToast => 'הדיווח נשלח. צוות הבטיחות שלנו יבדוק אותו.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'לחסום את $name? הם לא יוכלו לשלוח לך הודעות או בקשות חברות. תוכל לבטל את החסימה שלהם מאוחר יותר.';
  }

  @override
  String get iarBlockUserFailedToast => 'לא ניתן לחסום משתמש זה. נסה שוב.';

  @override
  String get iarCloseDmSuccessToast => 'ההודעה הישירה נסגרה.';

  @override
  String get iarCloseDmFailedToast =>
      'לא ניתן היה לסגור את ההודעה הישירה הזו. אנא נסה שוב.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'לא ניתן היה לעזוב קהילה זו. אנא נסה שוב.';

  @override
  String get chatMessageSuppressEmbeds => 'הסתר הטמעות';

  @override
  String get chatMessageUnsuppressEmbeds => 'הצג שוב קישורים מקדימים';

  @override
  String get chatMessageDelete => 'מחק הודעה';

  @override
  String get chatMessageDeleteConfirmTitle => 'מחק הודעה';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'האם אתה בטוח שברצונך למחוק הודעה זו?';

  @override
  String get chatMessageDeleteAttachment => 'מחק קובץ מצורף';

  @override
  String get chatMessageEditAttachmentAltText => 'ערוך טקסט חלופי';

  @override
  String get chatMessageMore => 'עוד';

  @override
  String get chatEditingMessage => 'עריכת הודעה';

  @override
  String get chatReplyOriginalDeleted => 'ההודעה המקורית נמחקה';

  @override
  String get chatReplyOriginalFailedToLoad => 'ההודעה המקורית לא נטענה';

  @override
  String get chatReplyAttachedMedia => 'ההודעה כוללת מדיה מצורפת';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count הודעות חסומות',
      one: 'הודעה חסומה אחת',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count הודעות ספאם פוטנציאליות',
      one: 'הודעה אחת של ספאם פוטנציאלי',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'התגובה מוסתרת כי הכותב המקורי חסום.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'התגובה מוסתרת כי המחבר המקורי סומן כספאם.';

  @override
  String get devMarkAsSpamLocally => 'סמן כספאם מקומי';

  @override
  String get devIgnoreSpamFlag => 'התעלם מסימון ספאם';

  @override
  String get chatMessagesLoadError => 'לא ניתן היה לטעון הודעות.';

  @override
  String get chatReplyMentionOverrideTitle => 'לשנות את העדפת התיוג?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname מעדיף/ה שיזכירו אותו/ה בתגובות. לשלוח בלי התיוג בכל זאת?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname מעדיף/ה תגובות בלי תיוג. לשלוח עם התיוג בכל זאת?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'התעלם מההעדפה';

  @override
  String get chatReplyMentionDisableTooltip =>
      'יש ללחוץ כדי לבטל תיוג של המשתמש/ת שאליו/ה אתם משיבים.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'יש ללחוץ כדי לאפשר תיוג של המשתמש שאליו משיבים.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'הזכר את המשתמש שהגיב';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'ביטול תגובה';

  @override
  String get chatEditMessageHint => 'עריכת הודעה';

  @override
  String get chatEditNoChanges => 'אין שינויים לשמירה';

  @override
  String get chatChannelNotReady =>
      'הערוץ הזה עדיין לא מוכן. נסה שוב בעוד רגע.';

  @override
  String get chatMessageEdited => '(נערך)';

  @override
  String get chatMessageSilent => 'זו הייתה הודעת @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'היום ב־$time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'אתמול ב־$time';
  }

  @override
  String get mediaViewerImagePreview => 'תצוגה מקדימה של תמונה';

  @override
  String get mediaViewerClose => 'סגור את מציג המדיה';

  @override
  String get mediaViewerOpenInBrowser => 'פתיחה בדפדפן';

  @override
  String get mediaViewerOptions => 'אפשרויות מדיה';

  @override
  String get mediaViewerCopyLink => 'העתקת קישור';

  @override
  String get mediaViewerForward => 'העברה';

  @override
  String get mediaViewerZoomIn => 'התקרבות';

  @override
  String get mediaViewerZoomOut => 'הקטן תצוגה';

  @override
  String get mediaViewerPreviousAttachment => 'קובץ מצורף קודם';

  @override
  String get mediaViewerNextAttachment => 'הקובץ המצורף הבא';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'קובץ מצורף $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'סגור';

  @override
  String get chatAttachmentVideoToggleControls => 'הצג/הסתר פקדי וידאו';

  @override
  String get chatAttachmentVideoMute => 'השתק וידאו';

  @override
  String get chatAttachmentVideoUnmute => 'השתק וידאו';

  @override
  String get chatAttachmentVideoPlay => 'הפעל סרטון';

  @override
  String get chatAttachmentVideoPause => 'השהה סרטון';

  @override
  String get chatAttachmentVideoProgress => 'התקדמות הסרטון';

  @override
  String get chatVideoPlaybackFailed => 'לא ניתן להפעיל את הסרטון הזה.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'הודעה למשתמשים עם תפקיד זה שיש להם הרשאה לצפות בערוץ זה.';

  @override
  String get composerAutocompleteSuggestions => 'הצעות';

  @override
  String get composerAutocompleteCommandsHeading => 'פקודות';

  @override
  String get composerAutocompleteChoicesHeading => 'אפשרויות';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'ארגומנטים אופציונליים';

  @override
  String get composerAutocompleteChannelsHeading => 'ערוצים';

  @override
  String get composerAutocompleteMembersHeading => 'חברים';

  @override
  String get composerAutocompleteUsersHeading => 'משתמשים';

  @override
  String get composerAutocompleteMentionsHeading => 'אזכורים';

  @override
  String get composerAutocompleteRolesHeading => 'תפקידים';

  @override
  String get composerAutocompleteMediaHeading => 'מדיה';

  @override
  String get composerAutocompleteStickersHeading => 'מדבקות';

  @override
  String get composerAutocompleteGifsHeading => 'קובצי GIF';

  @override
  String get composerAutocompleteNoGifs => 'לא נמצאו גיפים';

  @override
  String get composerCommandShrugDescription => 'מצרף ¯\\_(ツ)_/¯ להודעה שלך.';

  @override
  String get composerCommandTableflipDescription =>
      'מצרף (╯°□°)╯︵ ┻━┻ להודעה שלך.';

  @override
  String get composerCommandUnflipDescription =>
      'מצרף ┬─┬ ノ( ゜-゜ノ) להודעה שלך.';

  @override
  String get composerCommandMeDescription =>
      'שליחת הודעת פעולה (מוצגת בכתב נטוי).';

  @override
  String get composerCommandSpoilerDescription =>
      'שלח הודעת ספוילר (עוטף בתגי ספוילר).';

  @override
  String get composerCommandTtsDescription => 'שלח הודעת טקסט לדיבור.';

  @override
  String get composerCommandNickDescription => 'שנה את הכינוי שלך בקהילה זו.';

  @override
  String get composerCommandKickDescription => 'להוציא משתמש מהקהילה הזו.';

  @override
  String get composerCommandBanDescription => 'להרחיק משתמש מהקהילה הזו.';

  @override
  String get composerCommandMsgDescription => 'שלח/י הודעה פרטית למשתמש/ת.';

  @override
  String get composerCommandSavedDescription => 'שליחת פריט מדיה שמור.';

  @override
  String get composerCommandStickerDescription => 'שלח מדבקה.';

  @override
  String get composerCommandGifDescription => 'חיפוש ושליחת GIF.';

  @override
  String get composerCommandMemberOption => 'החבר שאליו יש לפנות.';

  @override
  String get composerCommandReasonOption => 'סיבה (אופציונלי).';

  @override
  String get composerCommandMessageOption => 'ההודעה לשליחה.';

  @override
  String get composerCommandQueryOption => 'מה לחפש.';

  @override
  String get composerCommandNicknameOption =>
      'הכינוי החדש שלך, או השאר ריק כדי לאפס אותו.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'כמה מההודעות האחרונות של החבר יימחקו.';

  @override
  String get composerCommandDeleteMessagesNone => 'אל תמחק כלום';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'הימים הקודמים $count';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '24 השעות האחרונות';

  @override
  String get composerCommandOptionRequired => 'נדרשת אפשרות זו. אנא ספק ערך.';

  @override
  String get composerCommandClear => 'נקה פקודה';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'שינית את הכינוי שלך בקהילה זו מ-**$previousNickname** ל-**$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'משתמש לא ידוע';

  @override
  String composerCommandMsgFailed(String username) {
    return 'נכשל שליחת הודעה אל **$username**. ייתכן שהם השביתו הודעות פרטיות או שחסמו אותך.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count נוספים';
  }

  @override
  String get addGuildModalTitle => 'הוספת קהילה';

  @override
  String get addGuildModalLandingDescription =>
      'ליצור קהילה חדשה או להצטרף לקיימת.';

  @override
  String get addGuildCreateCommunity => 'יצירת קהילה';

  @override
  String get addGuildJoinCommunity => 'הצטרפות לקהילה';

  @override
  String get addGuildImportDiscordTemplate => 'ייבוא תבנית Discord';

  @override
  String get addGuildJoinTitle => 'הצטרפות לקהילה';

  @override
  String get addGuildJoinDescription =>
      'הזן את קישור ההזמנה כדי להצטרף לקהילה.';

  @override
  String get addGuildInviteLinkLabel => 'קישור להזמנה';

  @override
  String get addGuildJoinSubmit => 'הצטרפות לקהילה';

  @override
  String get addGuildInviteInvalid => 'ההזמנה הזו אינה חוקית או פגה תוקף.';

  @override
  String get addGuildJoinFailed => 'לא ניתן להצטרף לקהילה. נסה שוב.';

  @override
  String get addGuildCreateTitle => 'יצירת קהילה';

  @override
  String get addGuildCreateDescription =>
      'צרו קהילה בשבילכם ובשביל החברים שלכם כדי לשוחח.';

  @override
  String get addGuildCreateNameLabel => 'שם קהילה';

  @override
  String get addGuildCreateSubmit => 'יצירת קהילה';

  @override
  String get addGuildCreateFailed => 'לא ניתן ליצור קהילה. נסה שוב.';

  @override
  String get addGuildCreateClaimTitle => 'תבעו את החשבון שלכם';

  @override
  String get addGuildCreateClaimDescription =>
      'עליך לאמת את חשבונך לפני שתוכל ליצור קהילה.';

  @override
  String get addGuildCreateVerifyTitle => 'אמתו את כתובת האימייל שלכם';

  @override
  String get addGuildCreateVerifyDescription =>
      'יש לאמת את כתובת האימייל שלך לפני שתוכל ליצור קהילה.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'לא ניתן להשתמש בסמלים מונפשים בעת יצירת קהילה חדשה. השתמש בתמונה סטטית.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'ביצירת קהילה, אתה מסכים לעקוב אחר ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'הנחיות קהילה של $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'השרת הזה הוא קהילה אחת בלבד, ולכן לא ניתן ליצור קהילות נוספות.';

  @override
  String get addGuildCreateChangeIcon => 'שינוי אייקון';

  @override
  String get addGuildCreateIconLabel => 'אייקון קהילה';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. מקסימום 10MB. מומלץ: 512×512px';

  @override
  String get addGuildImportDescription =>
      'הדביקו כתובת URL של תבנית Discord כדי לייבא את המבנה שלה לקהילה חדשה.';

  @override
  String get addGuildImportUrlLabel => 'כתובת אתר של תבנית';

  @override
  String get addGuildImportUrlInvalid =>
      'הזן כתובת URL או קוד תבנית Discord חוקיים.';

  @override
  String get addGuildImportFetchFailed =>
      'שגיאה באחזור תבנית הקהילה. ייתכן שהתבנית אינה קיימת או שהשירות החיצוני אינו זמין.';

  @override
  String get addGuildImportInvalidResponse =>
      'זה לא נראה כמו תגובת תבנית תקינה.';

  @override
  String get addGuildImportTemplateLabel => 'תבנית';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount טקסט, $voiceChannelCount קולי, $categoryCount קטגוריות, $roleCount תפקידים';
  }

  @override
  String get addGuildImportRemoveIcon => 'הסר אייקון';

  @override
  String get addGuildImportTemplateInvalid =>
      'נתוני תבנית הקהילה אינם חוקיים או פגומים.';

  @override
  String get addGuildPackInstalled => 'החבילה הותקנה בהצלחה.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'הסר את כל התגובות';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'האם אתה בטוח שברצונך להסיר את כל התגובות מההודעה הזו?';

  @override
  String get chatMessageUnpinConfirmTitle => 'בטל הצמדת הודעה';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'לשלוח את ההצמדה הזו אחורה בזמן?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username סיפח/ה את $messageLink לערוץ זה. ראה את $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'הודעה';

  @override
  String get systemPinMessageAllPinsLink => 'כל ההודעות המוצמדות';

  @override
  String get channelPinsEmptyTitle => 'אין הודעות מוצמדות';

  @override
  String get channelPinsEmptyDescription => 'הודעות מוצמדות יופיעו כאן.';

  @override
  String get channelDetailsFallbackTitle => 'פרטים';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'הודעה קבוצתית · $count חברים';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'לסגור את השיחה עם $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'לעזוב את $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'הגדרות ערוץ';

  @override
  String get channelDetailsGroupSettingsTitle => 'הגדרות קבוצה';

  @override
  String get channelDetailsDmSettingsTitle => 'הגדרות הודעה ישירה';

  @override
  String get channelDetailsInvitePeople => 'הזמן אנשים';

  @override
  String get channelDetailsCopyLink => 'העתק קישור';

  @override
  String get channelMenuCopyChannelLink => 'העתקת קישור לערוץ';

  @override
  String get channelMenuCopyRedirectLink => 'העתק קישור הפניה';

  @override
  String get channelDetailsAddFriendsToGroup => 'הוספת חברים לקבוצה';

  @override
  String get channelDetailsGroupInvites => 'הזמנות לקבוצה';

  @override
  String get channelDetailsEditChannel => 'עריכת ערוץ';

  @override
  String get channelDetailsDeleteChannel => 'מחיקת ערוץ';

  @override
  String get channelSettingsCategorySettingsTitle => 'הגדרות קטגוריה';

  @override
  String get channelSettingsEditCategory => 'עריכת קטגוריה';

  @override
  String get channelSettingsTabOverview => 'סקירה כללית';

  @override
  String get channelSettingsTabPermissions => 'הרשאות';

  @override
  String get channelSettingsTabInvites => 'הזמנות';

  @override
  String get channelSettingsTabWebhooks => 'ווב-הוקס';

  @override
  String get channelSettingsDeleteChannel => 'מחיקת ערוץ';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'האם אתה בטוח שברצונך למחוק את $channelName? לא ניתן לבטל פעולה זו.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'האם אתה בטוח שברצונך למחוק את $categoryName? לא ניתן לבטל פעולה זו.';
  }

  @override
  String get channelSettingsDeleteCategory => 'מחיקת קטגוריה';

  @override
  String get channelSettingsChannelUpdated => 'הערוץ עודכן';

  @override
  String get channelSettingsChannelName => 'שם הערוץ';

  @override
  String get channelSettingsCategoryName => 'שם הקטגוריה';

  @override
  String get channelSettingsMyCategory => 'הקטגוריה שלי';

  @override
  String get categoryExpandCategory => 'הרחבת קטגוריה';

  @override
  String get categoryCollapseCategory => 'כיווץ קטגוריה';

  @override
  String get categoryExpandAllCategories => 'הרחבת כל הקטגוריות';

  @override
  String get categoryCollapseAllCategories => 'כיווץ כל הקטגוריות';

  @override
  String get categoryMuteCategory => 'השתקת קטגוריה';

  @override
  String get categoryUnmuteCategory => 'בטל השתקה של קטגוריה';

  @override
  String get categoryCopyCategoryId => 'העתקת מזהה קטגוריה';

  @override
  String get categoryIdCopied => 'מזהה הקטגוריה הועתק';

  @override
  String get channelSettingsChannelNamePlaceholder => 'כללי';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'נושא';

  @override
  String get channelSettingsTopicPlaceholder => 'הוסף נושא לערוץ זה';

  @override
  String get channelSettingsInsertEmoji => 'הוספת אימוג\'י';

  @override
  String get channelSettingsTopicTooLongTitle => 'נושא הערוץ ארוך מדי.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'יש לקצר את הנושא ולנסות שוב.';

  @override
  String get channelSettingsSlowmode => 'מצב איטי';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'המתנה בין הודעות. \"$bypassSlowmodePermissionLabel\" יכול לעקוף זאת.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'כבוי';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds שניות';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes דקות';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours שעות';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute דקה';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour שעה';
  }

  @override
  String get channelSettingsVoiceQuality => 'איכות קול';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'סיביות גבוהה יותר = איכות טובה יותר ושימוש גבוה יותר ברוחב פס.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits קילו-ביט/שנייה';
  }

  @override
  String get channelSettingsParticipantLimit => 'מגבלת משתתפים';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'מקסימום חברים שיכולים להצטרף בבת אחת. 0 פירושו ללא הגבלה.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count משתתפים',
      one: 'משתתף אחד',
      zero: '∞ ללא הגבלה',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'מגבלת חיבורים';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'מספר החיבורים הפעילים המקסימלי שחבר אחד יכול להשאיר בערוץ זה.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count חיבורים',
      one: 'חיבור אחד',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'אזור קולי';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'בחר אזור קול עבור ערוץ זה. אוטומטי משתמש באזור הקרוב ביותר.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'אוטומטי';

  @override
  String get channelSettingsVoiceRegionsLoadFailed => 'לא ניתן לטעון אזורי קול';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'נסו שוב בעוד רגע.';

  @override
  String get channelSettingsResetSlider => 'איפוס המחוון לערך ברירת המחדל';

  @override
  String get channelSettingsAdvanced => 'מתקדם';

  @override
  String get channelSettingsMatureContentOverride => 'עקיפת תוכן בוגר';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'שנה את ההגדרה ברמת $scopeLevel עבור ערוץ זה. תוכן למבוגרים מוצג מאחורי שער לפני הכניסה.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'הורשה';

  @override
  String get channelSettingsMatureContentOn => 'מופעל';

  @override
  String get channelSettingsMatureContentOff => 'כבוי';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'מסמן ערוץ זה לתוכן למבוגרים.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'השאר ערוץ זה פתוח לתוכן למבוגרים.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'ירושה מ-$inheritedSourceLabel: מופעל';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'בירושה מ-$inheritedSourceLabel: כבוי';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'קטגוריה';

  @override
  String get channelSettingsMatureContentCommunitySource => 'קהילה';

  @override
  String get channelSettingsMatureContentCategoryScope => 'קטגוריה';

  @override
  String get channelSettingsMatureContentCommunityScope => 'קהילה';

  @override
  String get channelSettingsContentWarningToggle => 'הצג אזהרת תוכן בערוץ זה';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'מפעיל הנחיה להסכמה לפני הכניסה לערוץ זה.';

  @override
  String get channelSettingsContentWarningText => 'טקסט אזהרה מותאם אישית';

  @override
  String get channelSettingsContentWarningDefault =>
      'הודעה זו מכילה תוכן רגיש.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'עליך להחזיק בהרשאת \"$manageChannelsPermissionLabel\" כדי לערוך הרשאות אלה.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'אתה צריך את ההרשאה \"$manageRolesPermissionLabel\" כדי לערוך הרשאות אלה.';
  }

  @override
  String get channelSettingsUnknownRole => 'תפקיד לא ידוע';

  @override
  String get channelSettingsUnknownUser => 'משתמש לא ידוע';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'עקיפות גישה';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'עריכת גישה עבור $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => 'חזרה לדריסות';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'הגדר גישת בסיס לערוץ זה';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'הגדר עקיפות עבור תפקיד זה';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'הגדרת הרשאות מיוחדות לחבר זה';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'חיפוש הרשאות…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'גישת הערוץ עודכנה';

  @override
  String get channelSettingsPermissionsTitle => 'בקרת גישה';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'הערוץ הזה מסונכרן עם הקטגוריה הראשית ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'הערוץ הזה לא מסונכרן עם הקטגוריה הראשית ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => 'סנכרן עם קטגוריה';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'הערוץ סונכרן עם קטגוריית האב';

  @override
  String get channelSettingsPermissionsAddOverride => 'הוספת דריסה';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'חיפוש תפקידים או חברים…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'תפקידים וחברים';

  @override
  String get channelSettingsDeleteInvite => 'מחיקת הזמנה';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'למחוק את ההזמנה הזו? לא ניתן לבטל פעולה זו.';

  @override
  String get channelSettingsCopyInviteCode => 'העתקת קוד הזמנה';

  @override
  String get channelSettingsCopyInviteUrl => 'העתקת קישור הזמנה';

  @override
  String get channelSettingsWebhookCreated => 'Webhook נוצר';

  @override
  String get channelSettingsWebhookCreateFailed => 'יצירת ה-webhook נכשלה';

  @override
  String get channelSettingsCreateWebhook => 'יצירת ווב-הוק';

  @override
  String get channelSettingsInvitesDescription =>
      'נהל קישורי הזמנה עבור ערוץ זה.';

  @override
  String get channelSettingsInvitesCreate => 'יצירת הזמנה';

  @override
  String get channelSettingsInvitesEmpty => 'אין קישורי הזמנה';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'לערוץ הזה אין עדיין קישורי הזמנה. צור קישור כדי להזמין אנשים לערוץ.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'אירעה שגיאה בטעינת קישורי ההזמנה לערוץ זה. יש לנסות שוב.';

  @override
  String get channelSettingsWebhooksDescription =>
      'ניהול Webhooks נכנסים שיכולים לפרסם הודעות בערוץ זה.';

  @override
  String get channelSettingsWebhooksEmpty => 'אין Webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'אין Webhooks מוגדרים לערוץ זה. צור Webhook כדי לאפשר לאפליקציות חיצוניות לפרסם הודעות.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'ערוץ זה אינו תומך ב־webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'את/ה זקוק/ה להרשאת \"$permission\" כדי להציג ולערוך Webhooks עבור ערוץ זה.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => 'טעינת ה־Webhooks נכשלה';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'אירעה שגיאה בטעינת ה־webhooks עבור ערוץ זה. יש לנסות שוב.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'נוצר על ידי $creator בתאריך $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'משתמש לא ידוע';

  @override
  String get channelSettingsWebhooksAvatar => 'תמונת פרופיל';

  @override
  String get channelSettingsWebhooksUploadImage => 'העלאת תמונה';

  @override
  String get channelSettingsWebhooksRemove => 'הסר';

  @override
  String get channelSettingsWebhooksName => 'שם';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'שם ה־Webhook';

  @override
  String get channelSettingsWebhooksChannel => 'ערוץ';

  @override
  String get channelSettingsWebhooksUrl => 'כתובת אתר של Webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'העתקת כתובת ה-URL של הוובהוק';

  @override
  String get channelSettingsWebhooksDelete => 'מחיקת ווב-הוק';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'לא ניתן היה למחוק את ה-webhook הזה';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'למחוק את הווב-הוק הזה? לא ניתן לבטל.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment => 'נסו שוב בעוד רגע.';

  @override
  String get channelMenuOpenChat => 'פתח צ\'אט';

  @override
  String get channelMenuDuplicateChannel => 'שכפול ערוץ';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'איפוס מצב הסכמה לתוכן למבוגרים';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'למחוק את ההודעות שלך בערוץ זה?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'פעולה זו תמחק לצמיתות כל הודעה ששלחת אי פעם בערוץ זה. לא ניתן לבטל פעולה זו.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'מחק את ההודעות שלי';

  @override
  String get channelMenuDeletedYourMessages => 'ההודעות שלך נמחקו';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'לא ניתן היה למחוק את ההודעות שלך';

  @override
  String get channelDetailsSystemMessage => 'הודעת מערכת';

  @override
  String get channelDetailsTextChannel => 'ערוץ טקסט';

  @override
  String get channelDetailsVoiceChannel => 'ערוץ קולי';

  @override
  String get channelDetailsCategory => 'קטגוריה';

  @override
  String get channelDetailsLinkChannel => 'קישור לערוץ';

  @override
  String get channelDetailsGenericChannel => 'ערוץ';

  @override
  String get channelDetailsMutedConversation => 'שיחה מושתקת';

  @override
  String get channelDetailsUnmutedConversation => 'השיחה לא מושתקת';

  @override
  String get channelDetailsMutedChannel => 'ערוץ מושתק';

  @override
  String get channelDetailsUnmutedChannel => 'הערוץ הושקט';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'הגדרות ההתראות עודכנו';

  @override
  String get channelDetailsTabMembers => 'חברים';

  @override
  String get channelDetailsTabPins => 'הודעות נעוצות';

  @override
  String get channelDetailsActionMute => 'השתק';

  @override
  String get channelDetailsActionUnmute => 'בטל השתקה';

  @override
  String get channelDetailsActionSearch => 'חיפוש';

  @override
  String get channelDetailsActionMore => 'עוד';

  @override
  String get channelDetailsMembersEmptyTitle => 'אין חברים להצגה';

  @override
  String get channelDetailsMembersEmptyBody =>
      'חברים יופיעו כאן ברגע שנתוני הקהילה ייטענו.';

  @override
  String get memberListPermissionDeniedTitle => 'אינך יכול/ה לצפות בחברים';

  @override
  String get memberListPermissionDeniedBody =>
      'אינך יכול/ה להציג את חברי הערוץ הזה בקהילה זו';

  @override
  String get memberListUnavailableTitle => 'רשימת החברים אינה זמינה';

  @override
  String get memberListUnavailableBody =>
      'רשימות החברים אינן זמינות זמנית בקהילה זו';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'לא ניתן היה לטעון את הפינים';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'חברים עם ההרשאה \"נעץ הודעות\" יכולים לנעוץ הודעות שכולם יוכלו לראות.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'אפשר להצמיד הודעות בשיחה זו כדי שכולם יוכלו לראות.';

  @override
  String get channelDetailsPinsEndReached => 'הגעת לקצה';

  @override
  String get channelHeaderOpenDetails => 'פתח פרטי ערוץ';

  @override
  String get channelHeaderPinnedMessages => 'הודעות מוצמדות';

  @override
  String get channelHeaderPinnedMessagesUnread => 'הודעות מוצמדות, שלא נקראו';

  @override
  String get channelHeaderMemberList => 'רשימת חברים';

  @override
  String get channelHeaderInbox => 'תיבת דואר נכנס';

  @override
  String get channelHeaderNotificationSettingsMuted => 'הגדרות התראות, מושתק';

  @override
  String get channelDetailsSearchTitle => 'חיפוש';

  @override
  String get channelDetailsSearchHint => 'חפש הודעות';

  @override
  String get channelDetailsSearchFilterFrom => 'מאת';

  @override
  String get channelDetailsSearchFilterHas => 'יש';

  @override
  String get channelDetailsSearchFilterIn => 'בתוך';

  @override
  String get channelDetailsSearchFilterMentions => 'אזכורים';

  @override
  String get channelDetailsSearchFilterMore => 'עוד';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'פעיל';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count ערוצים';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count משתמשים';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'משתמש';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'בוט';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'ווב-הוק';

  @override
  String get channelDetailsSearchFilterByChannel => 'סינון לפי ערוץ';

  @override
  String get channelDetailsSearchChannelsHint => 'חיפוש ערוצים';

  @override
  String get channelDetailsSearchChannelsEmpty => 'לא נמצאו ערוצים';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'נעוץ';

  @override
  String get channelDetailsSearchPinnedTrue => 'רק מוצמדים';

  @override
  String get channelDetailsSearchPinnedFalse => 'החרג סיכות';

  @override
  String get channelDetailsSearchClearFilter => 'נקה';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'סוג מחבר';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'תאריך';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'מצב תאריך';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'בחר תאריך';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'קישור לשם המתחם';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'שם הקובץ מכיל';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'סוג קובץ';

  @override
  String get channelDetailsSearchContentPoll => 'סקר';

  @override
  String get channelDetailsSearchContentPollDescription => 'הודעות עם סקר';

  @override
  String get channelDetailsSearchContentForward => 'העברה';

  @override
  String get channelDetailsSearchContentForwardDescription => 'הודעות שהועברו';

  @override
  String get channelDetailsSearchFilterSort => 'מיין';

  @override
  String get channelHeaderSearchFiltersTitle => 'סינוני חיפוש';

  @override
  String get channelHeaderSearchRecentTitle => 'חיפושים אחרונים';

  @override
  String get channelHeaderSearchUsersTitle => 'משתמשים';

  @override
  String get channelHeaderSearchChannelsTitle => 'ערוצים';

  @override
  String get channelHeaderSearchValuesTitle => 'ערכים';

  @override
  String get channelHeaderSearchDatesTitle => 'תאריכים';

  @override
  String get channelHeaderSearchDefaultBadge => 'ברירת מחדל';

  @override
  String get channelHeaderSearchClearHistory => 'נקה';

  @override
  String get channelHeaderSearchFilterDescFrom => 'משתמש';

  @override
  String get channelHeaderSearchFilterDescMentions => 'משתמש';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'קישור, הטמעה, תמונה, וידאו, צליל, קובץ, מדבקה, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'תאריך או טווח תאריכים';

  @override
  String get channelHeaderSearchFilterDescOn => 'תאריך או טווח תאריכים';

  @override
  String get channelHeaderSearchFilterDescDuring => 'תאריך או טווח תאריכים';

  @override
  String get channelHeaderSearchFilterDescAfter => 'תאריך או טווח תאריכים';

  @override
  String get channelHeaderSearchFilterDescIn => 'ערוץ';

  @override
  String get channelHeaderSearchFilterDescPinned => 'אמת או שקר';

  @override
  String get channelHeaderSearchFilterDescAuthorType => 'משתמש, בוט או ווב-הוק';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'שם מארח, לדוגמה example.com';

  @override
  String get channelHeaderSearchFilterDescFileName => 'חלק משם קובץ מצורף';

  @override
  String get channelHeaderSearchFilterDescFileType => 'סיומת קובץ, לדוגמה png';

  @override
  String get channelHeaderSearchFilterDescSort => 'חותמת זמן או רלוונטיות';

  @override
  String get channelHeaderSearchFilterDescOrder => 'עולה או יורד';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString תוצאות',
      one: 'תוצאה אחת',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'סינון לפי משתמש';

  @override
  String get channelDetailsSearchFilterByContent => 'סינון לפי תוכן';

  @override
  String get channelDetailsSearchSortBy => 'מיין תוצאות לפי';

  @override
  String get channelDetailsSearchIn => 'חפש ב';

  @override
  String get channelDetailsSearchEmptyTitle => 'חפש בשיחה זו';

  @override
  String get channelDetailsSearchEmptyBody =>
      'הקלד טקסט, שם מחבר או מסנן תוכן כדי למצוא הודעות.';

  @override
  String get channelDetailsSearchIndexingTitle => 'ההודעות באינדקס';

  @override
  String get channelDetailsSearchIndexingBody =>
      'נסה שוב בעוד זמן קצר לאחר שהחיפוש יסיים לאנדקס את ההיקף הזה.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'אין תוצאות';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'נסה מונחי חיפוש או מסננים אחרים.';

  @override
  String get channelDetailsMembersOnline => 'מחובר';

  @override
  String get channelDetailsMembersOffline => 'לא מחובר';

  @override
  String get channelDetailsMemberYou => 'אתה/את';

  @override
  String get channelDetailsSearchUsersHint => 'חיפוש משתמשים';

  @override
  String get channelDetailsSearchUsersTypeToSearch => 'הקלד כדי לחפש חברים';

  @override
  String get channelDetailsSearchUsersEmpty => 'לא נמצאו משתמשים';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'אין משתמשים זמינים';

  @override
  String get channelDetailsDone => 'בוצע';

  @override
  String get channelDetailsHasFilterPrompt => 'הצג הודעות שמכילות:';

  @override
  String get channelDetailsRetry => 'נסה שוב';

  @override
  String get channelDetailsPinnedMessageTitle => 'הודעה נעוצה';

  @override
  String get channelDetailsSearchResultTitle => 'תוצאת חיפוש';

  @override
  String get channelDetailsJumpToMessage => 'קפוץ להודעה';

  @override
  String get channelDetailsUnpinMessage => 'הסר הצמדה להודעה';

  @override
  String get channelDetailsCopyMessageLink => 'העתק קישור להודעה';

  @override
  String get channelDetailsCopyMessageId => 'העתק מזהה הודעה';

  @override
  String get channelDetailsMessageUnpinned => 'הצמדת ההודעה בוטלה';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'הקהילה הנוכחית';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'ההתכתבות הנוכחית';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'כל הקהילות';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'כל ההודעות הישירות בלבד';

  @override
  String get channelDetailsSearchScopeAllDms => 'כל ההודעות הישירות';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'הודעות ישירות פתוחות בלבד';

  @override
  String get channelDetailsSearchScopeOpenDms => 'הודעות פרטיות פתוחות';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'כל ההודעות האישיות + קהילות';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'הודעות ישירות וקהילות';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'חפש רק בקהילה הנוכחית';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'חפש רק בצ\'אט הנוכחי';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'בכל הקהילות שבהן אתה חבר';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'רק בכל ההודעות הפרטיות שבהן היית אי פעם';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'בכל ההתכתבויות שבהן השתתפת אי פעם';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'בכל ההודעות הישירות הפתוחות שלך בלבד';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'בכל ההודעות הישירות הפתוחות שלך';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'בכל ההודעות הישירות שהיית בהן + בכל הקהילות שאתה חבר בהן כעת';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'בכל ההודעות הישירות הפתוחות שלך + בכל הקהילות שבהן אתה חבר';

  @override
  String get channelDetailsSearchSortNewest => 'החדשים ביותר תחילה';

  @override
  String get channelDetailsSearchSortOldest => 'מהישן לחדש';

  @override
  String get channelDetailsSearchSortRelevance => 'הכי רלוונטי';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'הצג את ההודעות החדשות ביותר קודם';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'הצג הודעות ישנות קודם';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'הצג את ההודעות הרלוונטיות ביותר תחילה';

  @override
  String get channelDetailsSearchContentImage => 'העלאת תמונה';

  @override
  String get channelDetailsSearchContentVideo => 'העלאת וידאו';

  @override
  String get channelDetailsSearchContentAudio => 'העלאת שמע';

  @override
  String get channelDetailsSearchContentFile => 'העלאת קובץ';

  @override
  String get channelDetailsSearchContentLink => 'קישור';

  @override
  String get channelDetailsSearchContentEmbed =>
      'תצוגמה מקדימה של קישור או הטמעה';

  @override
  String get channelDetailsSearchContentSticker => 'סטיקר';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'קבצי תמונה שהועלו בלבד';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'קבצי וידאו שהועלו בלבד';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'קבצי שמע שהועלו בלבד';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'כל קובץ מצורף שהועלה';

  @override
  String get channelDetailsSearchContentLinkDescription => 'כתובת אתר בהודעה';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'תצוגות מקדימות והטמעות עשירות שנפתרו, לא העלאות';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'מדבקה מצורפת להודעה';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count סוגים';
  }

  @override
  String get personalNotesTitle => 'הערות אישיות';

  @override
  String get personalNotesSubtitle => 'המרחב הפרטי שלך למחשבות ותזכורות';

  @override
  String groupDmWelcome(String displayName) {
    return 'ברוכים הבאים ל-$displayName. הוסיפו חברים כדי להפעיל את הקבוצה.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'עריכת קבוצה';

  @override
  String get groupDmWelcomeAddFriends => 'הוספת חברים לקבוצה';

  @override
  String get dmGroupInvites => 'הזמנות';

  @override
  String get groupDmEditTitle => 'עריכת קבוצה';

  @override
  String get groupDmEditDetailsTooltip => 'עריכת פרטי קבוצה';

  @override
  String get groupDmGroupName => 'שם הקבוצה';

  @override
  String get groupDmMyGroup => 'הקבוצה שלי';

  @override
  String get groupDmGroupNameMaxLength =>
      'שם הקבוצה לא יכול לעלות על 100 תווים';

  @override
  String get groupDmGroupIcon => 'אייקון הקבוצה';

  @override
  String get groupDmUploadIcon => 'העלאת אייקון';

  @override
  String get groupDmChangeIcon => 'שינוי אייקון';

  @override
  String get groupDmRemoveIcon => 'הסר אייקון';

  @override
  String get groupDmUpdated => 'הקבוצה עודכנה';

  @override
  String get groupDmUpdateFailed => 'לא ניתן לעדכן את הקבוצה. נסה שוב.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'לא נתמכים סמלים מונפשים. השתמש בתמונה סטטית.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'אייקונים מונפשים אינם נתמכים';

  @override
  String get groupDmIconFileTooLargeTitle => 'קובץ הסמל גדול מדי';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'קובץ הסמל גדול מדי. בחר קובץ שגודלו קטן מ- $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'פורמט אייקון לא נתמך';

  @override
  String get groupDmUnsupportedIconFormatBody => 'סוג קובץ לא נתמך.';

  @override
  String get groupDmCouldntProcessImage => 'לא ניתן לעבד את התמונה';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'עיבוד התמונה החתוכה נכשל. יש לנסות שוב.';

  @override
  String get groupDmInvalidImage => 'תמונה לא חוקית';

  @override
  String get groupDmInvalidImageBody =>
      'התמונה הזו לא חוקית. נסה/נסי תמונה אחרת.';

  @override
  String get groupDmAddFriends => 'הוספה';

  @override
  String get groupDmOrSendInvite => 'או שלחו הזמנה לחבר:';

  @override
  String get groupDmGenerateInviteLink => 'יצירת קישור להזמנה';

  @override
  String get groupDmCreateInvite => 'יצירה';

  @override
  String get groupDmInviteExpires24Hours => 'ההזמנה שלך תפוג בעוד 24 שעות';

  @override
  String get groupDmAddFriendFailed =>
      'לא ניתן היה להוסיף את החבר הזה לקבוצה. יש לנסות שוב.';

  @override
  String get groupDmAddFailed => 'לא ניתן להוסיף לקבוצה';

  @override
  String get groupDmGroupFull =>
      'הקבוצה הזו מלאה. הסר מישהו לפני הוספת אנשים נוספים.';

  @override
  String get groupDmRateLimited => 'אתה מהיר מדי. המתן רגע ונסה שוב.';

  @override
  String get groupDmCreateInviteFailed => 'לא ניתן ליצור קישור הזמנה';

  @override
  String get groupDmCreateInviteFailedBody =>
      'לא ניתן ליצור קישור הזמנה. יש לנסות שוב.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'לא ניתן היה ליצור קישור הזמנה. נסה שוב.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'אין לך הרשאה ליצור הזמנה בערוץ זה.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'הקהילה הגיעה למגבלת ההזמנות שלה.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'יצירת הזמנות מושבתת זמנית עבור קהילה זו.';

  @override
  String get groupDmCopyInviteFailed => 'העתקת קישור ההזמנה נכשלה';

  @override
  String get groupDmInvitesOwnerOnly => 'רק בעל הקבוצה יכול לנהל הזמנות.';

  @override
  String get groupDmNoInvitesCreated => 'לא נוצרו הזמנות';

  @override
  String get groupDmLoadingInvites => 'טוען הזמנות...';

  @override
  String get groupDmInvitesLoadFailed => 'טעינת ההזמנות נכשלה. יש לנסות שוב.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'לבטל את ההזמנה הזו? לא ניתן לבטל פעולה זו.';

  @override
  String get groupDmInviteRevoked => 'ההזמנה בוטלה';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'נוצר על ידי $name. פג תוקף בעוד $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'ברוכים הבאים ל-$channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'בראשית, לא היה דבר. ואז, היה $channelName. וזה היה טוב.';
  }

  @override
  String get personalNotesComposerHint => 'שלח לעצמך הודעה';

  @override
  String channelComposerHint(String channelName) {
    return 'הודעה #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'הודעה ל-@$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'הודעה $groupName';
  }

  @override
  String get groupDmComposerHint => 'קבוצת הודעות';

  @override
  String get composerHint => 'הודעה';

  @override
  String get composerOpenExpressionPicker => 'פתח את בורר ההבעות';

  @override
  String get composerShowKeyboard => 'הצג מקלדת';

  @override
  String get composerCloseAttachmentPanel => 'סגור את בורר הקבצים המצורפים';

  @override
  String get chatAttachmentPanelPhotos => 'תמונות';

  @override
  String get chatAttachmentPanelFiles => 'קבצים';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'נדרשת גישה לספריית התמונות';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'אפשר גישה לספריית התמונות כדי לעיין ולצרף תמונות וסרטונים אחרונים.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'פתח הגדרות';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', בשליחה';

  @override
  String get messageAccessibilityFailedSuffix => ', נשלח נכשל';

  @override
  String get messageAccessibilityAttachmentSummary => 'קובץ מצורף';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count קבצים מצורפים';
  }

  @override
  String get messageAccessibilityImageSummary => 'תמונה';

  @override
  String get messageAccessibilityVideoSummary => 'סרטון';

  @override
  String get messageAccessibilityAudioSummary => 'קובץ שמע';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'מדבקה $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'קובץ $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => 'קובץ מצורף מוסתר';

  @override
  String get messageAccessibilityEmbedSummary => 'הטמעה';

  @override
  String get messageAccessibilityEmptySummary => 'הודעה';

  @override
  String get personalNotesPrivateSpace => 'המרחב הפרטי שלך';

  @override
  String get purgePersonalNotes => 'מחיקת פתקים אישיים';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'פעולה זו תמחק לצמיתות כל הודעה וקובץ מצורף בהערות האישיות שלך. לא ניתן יהיה לבטל פעולה זו.';

  @override
  String get purgePersonalNotesConfirmButton => 'מחיקה';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'הודעות נמחקו מהערות אישיות: $count';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => 'ההערות האישיות כבר היו ריקות';

  @override
  String get purgePersonalNotesFailed => 'לא ניתן היה לנקות את ההערות האישיות';

  @override
  String get userSettingsGroupYourAccount => 'החשבון שלך';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'חפש הגדרות...';

  @override
  String get userSettingsSearchFieldLabel => 'חיפוש הגדרות';

  @override
  String get userSettingsSearchClear => 'נקה חיפוש';

  @override
  String get userSettingsSearchNoResults => 'לא נמצאו הגדרות';

  @override
  String get userSettingsNavProfile => 'פרופיל';

  @override
  String get userSettingsNavSecurityLogin => 'אבטחה וכניסה';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'מתנות';

  @override
  String get giftSettingsClaimAccountTitle => 'תבעו את החשבון שלכם';

  @override
  String get giftSettingsClaimAccountDescription =>
      'אמת את חשבונך כדי לממש או לנהל קודי מתנה של Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'מימוש מתנה';

  @override
  String get giftSettingsRedeemDescription =>
      'הזן קוד מתנה כדי לממש Plutonium לחשבונך.';

  @override
  String get giftSettingsRedeemPlaceholder => 'הזן קוד מתנה…';

  @override
  String get giftSettingsRedeemButton => 'מימוש';

  @override
  String get giftSettingsRedeemSuccess =>
      'המתנה מומשה בהצלחה. תהנה מה-Plutonium שלך.';

  @override
  String get giftSettingsPurchasedTitle => 'מתנות שנרכשו';

  @override
  String get giftSettingsPurchasedDescription =>
      'נהל את קודי המתנה של Plutonium שרכשת. שתף את כתובת ה-URL של המתנה עם מישהו מיוחד או פדה אותה לעצמך!';

  @override
  String get giftSettingsEmptyTitle => 'אין עדיין מתנות';

  @override
  String get giftSettingsEmptyDescription =>
      'קנו מתנת Plutonium מטאב Plutonium כדי לשתף עם חברים.';

  @override
  String get giftSettingsGoToPlutonium => 'עבור אל Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'טעינת מלאי המתנות נכשלה';

  @override
  String get giftSettingsLoadFailedDescription => 'נסו שוב מאוחר יותר.';

  @override
  String get giftSettingsTryAgain => 'נסה שוב';

  @override
  String get giftSettingsGiftUrl => 'כתובת אתר למתנה';

  @override
  String get giftSettingsCopy => 'העתקה';

  @override
  String get giftSettingsCopied => 'הועתק';

  @override
  String get giftSettingsGiftUrlCopied =>
      'כתובת ה-URL של המתנה הועתקה ללוח הגזירים!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'לא ניתן היה להעתיק את כתובת ה-URL של המתנה';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'נרכש ב-$date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'התקבל בתאריך $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'התקבל על ידי $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'המתנה הזו כבר מומשה';

  @override
  String get giftSettingsRedeemForYourself => 'ממש לעצמך';

  @override
  String get giftSettingsShareWithFriend => 'שתף עם חבר';

  @override
  String get premiumPlutoniumTagline =>
      'קבלו גישה למגבלות גבוהות יותר ולתכונות בלעדיות, ותמכו בפלטפורמת תקשורת עצמאית.';

  @override
  String get premiumPurchaseMode => 'מצב רכישה';

  @override
  String get premiumForMe => 'בשבילי';

  @override
  String get premiumAsAGift => 'כמתנה';

  @override
  String get premiumMonthly => 'חודשי';

  @override
  String get premiumYearly => 'שנתי';

  @override
  String get premiumPerMonth => 'לחודש';

  @override
  String get premiumPerYear => 'לשנה';

  @override
  String get premiumOneTimePurchase => 'רכישה חד-פעמית';

  @override
  String get premiumSave17 => 'חסכו 17%';

  @override
  String get premiumUpgradeNow => 'שדרגו עכשיו';

  @override
  String get premiumBuyGift => 'קניית מתנה';

  @override
  String get premiumOneYearGift => 'מתנה לשנה';

  @override
  String get premiumOneMonthGift => 'מתנה לחודש אחד';

  @override
  String get premiumMostPopular => 'הפופולרי ביותר';

  @override
  String get premiumScrollPrompt =>
      'גלול למטה כדי לראות את כל ההטבות הכלולות ב-Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'חינם לעומת Plutonium';

  @override
  String get premiumFreeColumn => 'חינם';

  @override
  String get premiumGiftSectionTitle => 'הענק Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'שתף את חווית ה-Plutonium עם חבריך על ידי רכישת מנוי מתנה.';

  @override
  String get premiumGiftBannerOne => 'יש לך קוד מתנה חדש שמחכה לך!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'יש לך $count קודי מתנה חדשים שמחכים לך!';
  }

  @override
  String get premiumViewGifts => 'הצגת מתנות';

  @override
  String get premiumReadyToUpgrade => 'מוכנים לשדרג?';

  @override
  String get premiumReadyToBuyGift => 'מוכנים לקנות מתנה?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'חודשי $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'שנתי $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return 'שנה אחת ב- $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return 'חודש 1 $price';
  }

  @override
  String get premiumManageSubscription => 'ניהול מינוי';

  @override
  String get premiumRedeemGiftCode => 'מימוש קוד מתנה';

  @override
  String get premiumGiftBadge => 'מתנה';

  @override
  String get premiumCancelSubscriptionTitle => 'לבטל את המינוי?';

  @override
  String get premiumCancelSubscriptionBody =>
      'ההטבות שלך יישמרו עד לתאריך החידוש הבא שלך, ולאחר מכן תהיה לך תקופת חסד של 3 ימים כדי להירשם מחדש ולשמור את היסטוריית המנוי שלך.';

  @override
  String get premiumCancelSubscriptionConfirm => 'ביטול מינוי';

  @override
  String get premiumKeepSubscription => 'השארת המנוי';

  @override
  String get premiumPurchaseHistoryTitle => 'היסטוריית רכישות';

  @override
  String get premiumPurchaseHistoryDescription =>
      'החשבוניות האחרונות שלך. כדי לשנות את אמצעי התשלום עבור המנוי שלך, הוסף או בחר אחד בפורטל החיוב והפוך אותו לברירת מחדל.';

  @override
  String get premiumManagePaymentMethods => 'ניהול אמצעי תשלום';

  @override
  String get premiumBillingHistory => 'היסטוריית חיובים';

  @override
  String get premiumSelfServeRefundTitle => 'החזר כספי בשירות עצמי';

  @override
  String get premiumSelfServeRefundButton => 'החזר רכישה אחרונה';

  @override
  String get premiumDisclaimerAgreementPrefix => 'במסירת רכישה, אתה מסכים ל ';

  @override
  String get premiumDisclaimerAgreementPastPrefix => 'במסירת רכישה, הסכמת ל ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' וגם ';

  @override
  String premiumActiveUntil(String date) {
    return 'פעיל עד $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'מבטל/ת';

  @override
  String premiumCancelsOn(String date) {
    return 'הביטול יתבצע בתאריך $date. ההטבות יישארו פעילות עד אז.';
  }

  @override
  String get premiumReactivateSubscription => 'הפעל מחדש';

  @override
  String premiumGiftedUntil(String date) {
    return 'מתנה עד $date. לא מתחדש אוטומטית.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'תכונה';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'ברכישה, אישרת את ה$terms ואת ה$privacy שלנו.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'החזרים בשירות עצמי זמינים תוך 3 ימים מהתשלום, פעם ב-30 יום. החזר כספי על מנוי מבטל אותו. רוכשים באיחוד האירופי/אזור הכלכלי האירופי מוותרים על זכות הביטול תוך 14 יום בקופה כדי לגשת לתוכן באופן מיידי. השתמשו בלחצן ההחזר הכספי בתוך האפליקציה במקום בביטול עסקה. ביטולי עסקה עלולים להגביל לצמיתות את חשבונכם. Stripe מטפלת בתשלום באופן מאובטח. אנחנו לעולם לא רואים את מספר הכרטיס המלא שלכם.';

  @override
  String get premiumTermsOfService => 'תנאי שירות';

  @override
  String get premiumPrivacyPolicy => 'מדיניות פרטיות';

  @override
  String get premiumCheckoutStartFailedTitle => 'לא ניתן להתחיל את התשלום';

  @override
  String get premiumCheckoutStartFailedBody =>
      'משהו השתבש במהלך התחלת התשלום. יש לנסות שוב בעוד רגע.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'כרגע יש לך מנוי מתנה. הוא לא יתחדש. באפשרותך לממש קודי מתנה נוספים כדי להאריך אותו. ניתן להתחיל מנויים חוזרים לאחר שתקופת המתנה שלך תסתיים.';

  @override
  String get premiumPlanUnavailable =>
      'התוכנית הזו אינה זמינה. יש ליצור קשר עם התמיכה.';

  @override
  String get premiumCompletePaymentTitle => 'השלם תשלום';

  @override
  String get premiumCompletePaymentBody =>
      'אתה מועבר כעת ל-Stripe להשלמת התשלום. חזור ל-Fluxer לאחר שתסיים.';

  @override
  String get premiumChoosePaymentMethodTitle => 'בחירת אמצעי תשלום';

  @override
  String get premiumPixPaymentPromptDescription =>
      'שלם באמצעות Pix אוטומטי כדי לאשר חיובים חוזרים ישירות מהבנק הברזילאי שלך. לחלופין, בחר להשתמש בכרטיס כדי להזין פרטי כרטיס אשראי במסך הבא של Stripe.';

  @override
  String get premiumUsePix => 'השתמש בפיקס';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'שלם באמצעות UPI כדי להגדיר הוראת קבע תואמת RBI מבנק הודי. לחלופין, בחר השתמש בכרטיס כדי להזין פרטי כרטיס אשראי במסך הבא של Stripe.';

  @override
  String get premiumUseUpi => 'השתמש ב-UPI';

  @override
  String get premiumUseCard => 'שימוש בכרטיס';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'לא ניתן לפתוח את פורטל החיוב';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'משהו השתבש בעת פתיחת פורטל החיוב. יש לנסות שוב בעוד רגע.';

  @override
  String get premiumAlreadyVisionaryTitle => 'אתה כבר Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'ל-Visionary כבר יש גישה קבועה, כך שאין צורך במנוי חוזר. עדיין אפשר לקנות מתנות לאחרים.';

  @override
  String get premiumExistingSubscriptionTitle => 'המינוי כבר קיים';

  @override
  String get premiumExistingSubscriptionBody =>
      'מצאנו מנוי קיים של Fluxer Plutonium עבור חשבון זה. נהלו אותו בפורטל החיוב המאובטח כדי לעדכן פרטי תשלום או לבדוק את סטטוס החידוש. אם שילמתם זה עתה, המתינו דקה ופתחו מחדש את הדף הזה.';

  @override
  String get premiumPurchasesDisabledTitle => 'רכישות אינן זמינות';

  @override
  String get premiumPurchasesDisabledBody =>
      'הרכישות מושבתות עבור חשבון זה. צור קשר עם support@fluxer.app אם זה נראה שגוי.';

  @override
  String get premiumClaimAccountToPurchase =>
      'אמת את חשבונך כדי לרכוש Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'עליך לאמת את כתובת הדוא\"ל שלך לפני שתוכל לרכוש Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'תגית שם משתמש מותאמת אישית';

  @override
  String get premiumPerkPerCommunityProfiles => 'פרופילים לכל קהילה';

  @override
  String get premiumPerkMessageScheduling => 'תזמון הודעות';

  @override
  String get premiumPerkProfileBadge => 'תג פרופיל';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'רקעים מותאמים אישית לווידאו';

  @override
  String get premiumPerkEntranceSounds => 'צלילי כניסה';

  @override
  String get premiumPerkCommunities => 'קהילות';

  @override
  String get premiumPerkMessageCharacterLimit => 'מגבלת תווים בהודעה';

  @override
  String get premiumPerkBookmarkedMessages => 'הודעות שמורות';

  @override
  String get premiumPerkFileUploadSize => 'גודל קובץ להעלאה';

  @override
  String get premiumPerkEmojiStickerPacks => 'חבילות אימוג\'י ומדבקות';

  @override
  String get premiumPerkSavedMedia => 'מדיה שמורה';

  @override
  String get premiumPerkUseAnimatedEmojis => 'שימוש באימוג\'י מונפשים';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'גישה גלובלית לאמוג\'י ומדבקות';

  @override
  String get premiumPerkVideoQuality => 'איכות וידאו';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'אווטרים מונפשים ובאנרים לפרופיל';

  @override
  String get premiumPerkEarlyAccess => 'גישה מוקדמת לתכונות חדשות';

  @override
  String get premiumPerkCustomThemes => 'עיצובים מותאמים אישית';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'עד 4K/60fps';

  @override
  String get userSettingsNavPrivacyDashboard => 'לוח הבקרה של פרטיות';

  @override
  String get userSettingsNavAuthorizedApps => 'אפליקציות מורשות';

  @override
  String get userSettingsNavBlockedUsers => 'משתמשים חסומים';

  @override
  String get userSettingsNavLinkedDevices => 'מכשירים מקושרים';

  @override
  String get userSettingsNavConnections => 'חיבורים';

  @override
  String get userSettingsNavLookAndFeel => 'מראה ותחושה';

  @override
  String get userSettingsNavAccessibility => 'נגישות';

  @override
  String get userSettingsNavChat => 'צ\'אט';

  @override
  String get userSettingsNavAudioAndVideo => 'אודיו ווידאו';

  @override
  String get userSettingsNavShortcuts => 'קיצורי דרך';

  @override
  String get audioAndVideoAudioSectionTitle => 'שמע';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'הגדר את המיקרופון, הרמקולים ועיבוד הקול שלך.';

  @override
  String get audioAndVideoVideoSectionTitle => 'וידאו';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'הגדר את איכות המצלמה ושיתוף המסך שלך.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'התנהגות בשיחה';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'שליטה בהנחיות אישור במהלך שיחות קול ווידאו.';

  @override
  String get audioAndVideoInputDeviceLabel => 'התקן קלט';

  @override
  String get audioAndVideoOutputDeviceLabel => 'התקן פלט';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'ברירת מחדל';

  @override
  String get audioAndVideoUseSpeakerLabel => 'השתמש ברמקול';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'כשהאפשרות כבויה, השמע יופעל דרך השפופרת או אוזניות מחוברות.';

  @override
  String get audioAndVideoInputVolumeLabel => 'עוצמת קלט';

  @override
  String get audioAndVideoOutputVolumeLabel => 'עוצמת שמע של פלט';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'עיבוד קולי';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'קול ממוקד';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'מומלץ. מנקה את המיקרופון שלך לדיבור ברור.';

  @override
  String get audioAndVideoDirectInputLabel => 'קלט ישיר';

  @override
  String get audioAndVideoDirectInputDescription =>
      'שולח את האודיו שלך ללא שינוי. מומלץ אם אתה משתמש בתוכנת אודיו חיצונית.';

  @override
  String get audioAndVideoCustomProfileLabel => 'מותאם אישית';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'התאם כל הגדרה בעצמך: דיכוי רעשים, ביטול הד והגברה.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'דיכוי רעשים';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'משופר';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'רגיל';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'ללא';

  @override
  String get audioAndVideoEchoCancellationLabel => 'ביטול הד';

  @override
  String get audioAndVideoAutomaticGainControlLabel => 'בקרת הגברה אוטומטית';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'מיישר את עוצמת הקול של המיקרופון שלך. כבוי כאשר דיכוי משופר מופעל.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'בדיקת מיקרופון';

  @override
  String get audioAndVideoMicTestStartLabel => 'התחל בדיקת מיקרופון';

  @override
  String get audioAndVideoMicTestStopLabel => 'עצור בדיקת מיקרופון';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName דורש גישת מיקרופון כדי לבדוק את הקלט שלך.';
  }

  @override
  String get audioAndVideoCameraLabel => 'מצלמה';

  @override
  String get audioAndVideoMirrorCameraLabel => 'שיקוף מצלמה';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'איכות מצלמה';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle => 'איכות שיתוף מסך';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'קצב פריימים';

  @override
  String get audioAndVideoFrameRate15Label => '15 פריימים לשנייה';

  @override
  String get audioAndVideoFrameRate30Label => '30 פריימים לשנייה';

  @override
  String get audioAndVideoFrameRate60Label => '60 פריימים לשנייה';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p ו-60 FPS דורשים את $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'השרת הנוכחי מאפשר שיתוף מסך עד 720p ב-30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName זקוק לגישה למיקרופון כדי להציג את המכשירים שלך.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return 'ל־$productName דרושה גישה למצלמה כדי להציג את המכשירים שלך.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'אל תשאל כשמסתיר/ה את המצלמה שלי';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'אל תשאל כשאני מסתיר את שיתוף המסך שלי';

  @override
  String get userSettingsNavNotifications => 'התראות';

  @override
  String get notificationsGeneralSectionTitle => 'כללי';

  @override
  String get notificationsEnableNotificationsLabel => 'הפעלת התראות';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'קבל התראות כשאתה מקבל הודעות. ייתכן שתצטרך לאפשר התראות עבור $productName בהגדרות המכשיר שלך. לבקרת התראות לפי ערוץ/קהילה, פתח את הגדרות ההתראות מתפריט הקהילה.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'הפעלת התראות בשולחן העבודה';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'משתמש במרכז ההתראות של מערכת ההפעלה. לבקרת התראות לפי ערוץ/קהילה, לחצו לחיצה ימנית על סמל קהילה ופתחו את הגדרות ההתראות.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'הפעלת התראות בדפדפן';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'קבלו התראות כשאתם מקבלים הודעות. ייתכן שתצטרכו לאפשר התראות בהגדרות הדפדפן שלכם. כדי לשלוט בהתראות עבור ערוץ/קהילה ספציפיים, לחצו לחיצה ימנית על סמל קהילה ופתחו את הגדרות ההתראות.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'זמן קצוב לאי-פעילות של התראות דחיפה';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '‏‎$productName מונע משלוח התראות דחיפה למכשירים הניידים שלך כשאתה ליד המחשב. בחר כמה זמן אתה צריך להיות לא פעיל במחשב לפני שתתחיל לקבל התראות דחיפה.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute דקה';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes דקות';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'העדפות תיוג';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'העדפת אזכור בתגובה';

  @override
  String get notificationsMentionNoPreferenceName => 'ללא העדפה';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'יש לכבד את כוונת השולח, ללא אזהרה כשהוא מחליף את אזכור ה-@';

  @override
  String get notificationsMentionPreferMentionName => 'העדפת אזכור ב-@';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'ברירת מחדל משיבה ל-@mention שלך, ומתריעה לשולח אם הוא משבית זאת';

  @override
  String get notificationsMentionPreferNoMentionName => 'העדף ללא @תיוג';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'ברירות מחדל למענה הן השמטת התיוג, והתראה לשולח אם הוא מפעיל אותו';

  @override
  String get notificationsTtsSectionTitle => 'התראות טקסט לדיבור';

  @override
  String get notificationsTtsEnableCommandLabel => 'הפעלת השמעת דיבור /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'אפשר ל-/tts להקריא את ההודעה שלך בקול. השבתת ההגדרה משאירה את הפקודות האלה כטקסט רגיל.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'התאם את מהירות ההשמעה ב ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'נגישות';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => 'הקראת הודעות אוטומטית';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'ממיר תוכן נכנס לדיבור, בלי קשר אם הוא הגיע מ-/tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'כל הערוצים';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'הקראת כל הודעה נכנסת, ללא קשר לערוץ הפתוח.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'ערוץ פעיל בלבד';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'מקריא רק את הערוץ שבו אתם צופים. הקריינות עוקבת אחריכם בין ערוצים.';

  @override
  String get notificationsTtsModeNeverName => 'אף פעם אוטומטית';

  @override
  String get notificationsTtsModeNeverDescription =>
      'הישאר שקט אלא אם מישהו מפעיל /tts באופן ידני.';

  @override
  String get notificationsTtsModeAriaLabel => 'הקראת כל ההודעות בקול רם';

  @override
  String get notificationsSoundsSectionTitle => 'צלילים';

  @override
  String get notificationsMasterVolumeLabel => 'עוצמת קול ראשית';

  @override
  String get notificationsMasterVolumeDescription =>
      'קובע את העוצמה לכל אפקט קולי. הגדרות ספציפיות לצלילים בודדים יתעלמו מהגדרה זו.';

  @override
  String get notificationsResetToDefaultVolume => 'איפוס לעוצמת ברירת המחדל';

  @override
  String get notificationsDisableAllSoundsLabel => 'השבתת כל צלילי ההתראות';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'הגדרות צלילי ההתראות הקיימות שלך יישמרו.';

  @override
  String get notificationsShowMoreSoundEffects => 'הצג יותר אפקטים קוליים';

  @override
  String get notificationsShowFewerSoundEffects => 'הצג פחות אפקטים קוליים';

  @override
  String get notificationsPreviewSound => 'השמעת צליל';

  @override
  String get notificationsPerSoundVolumeTitle => 'עוצמת שמע לכל צליל';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'הגדירו עוצמת קול מותאמת אישית לצלילים ספציפיים. צלילים ללא הגדרה מיוחדת יפעלו לפי עוצמת הקול הכללית.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'הגדרות עוצמת קול מותאמות אישית פעילות: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'בהתאם להגדרות הראשיות • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'איפוס $label לעוצמת קול ראשית';
  }

  @override
  String get notificationsResetAllOverrides =>
      'איפוס כל ההגדרות המותאמות אישית';

  @override
  String notificationsMuteSound(String label) {
    return 'השתק $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'בטל השתקה של $label';
  }

  @override
  String get notificationsSoundMessage => 'התראות על הודעות קהילה';

  @override
  String get notificationsSoundDirectMessage => 'התראות על הודעות ישירות';

  @override
  String get notificationsSoundSameChannelMessage =>
      'התראות על הודעות מהערוץ הנוכחי';

  @override
  String get notificationsSoundMute => 'השתקת קול';

  @override
  String get notificationsSoundUnmute => 'השתקת קול בוטלה';

  @override
  String get notificationsSoundDeaf => 'השתקת שמע';

  @override
  String get notificationsSoundUndeaf => 'הסרת השתקה קולית';

  @override
  String get notificationsSoundUserJoin => 'משתמש הצטרף לערוץ';

  @override
  String get notificationsSoundUserLeave => 'משתמש עוזב ערוץ';

  @override
  String get notificationsSoundUserMove => 'המשתמש העביר את הערוץ';

  @override
  String get notificationsSoundViewerJoin => 'צופה הצטרף לשידור';

  @override
  String get notificationsSoundViewerLeave => 'הצופה עזב את השידור';

  @override
  String get notificationsSoundVoiceDisconnect => 'השיחה הקולית נותקה';

  @override
  String get notificationsSoundIncomingRing => 'שיחה נכנסת';

  @override
  String get notificationsSoundCameraOn => 'מצלמה פועלת';

  @override
  String get notificationsSoundCameraOff => 'מצלמה כבויה';

  @override
  String get notificationsSoundScreenShareStart => 'שיתוף מסך התחיל';

  @override
  String get notificationsSoundScreenShareStop => 'שיתוף מסך הופסק';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'לא ניתן לעדכן את פסק הזמן של התראות דחיפה. נסה שוב.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'לא ניתן לעדכן את העדפת האזכור. נסה שוב.';

  @override
  String get notificationsPermissionDeniedTitle => 'ההתראות חסומות';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'לא ניתן היה להפעיל התראות. אפשר הרשאת התראות כדי להמשיך.';

  @override
  String get userSettingsNavLanguageAndTime => 'שפה ושעה';

  @override
  String get languageAndTimeLanguageSectionTitle => 'שפת ממשק';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'בחר את השפה שתשמש בכל האפליקציה';

  @override
  String get languageAndTimeOpenLanguageSettings => 'פתח הגדרות שפה';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'פורמט שעה';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'בחר כיצד יוצג הזמן ברחבי האפליקציה';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'בחירת פורמט שעה';

  @override
  String get languageAndTimeTimeFormatAuto => 'אוטומטי';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 שעות';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 שעות';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'שפת האפליקציה: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'שפת מערכת: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'השתמש/י בהגדרות המערכת עבור פורמט השעה';

  @override
  String get languageAndTimeTimeFormatSyncFailed => 'שגיאה בעדכון פורמט השעה';

  @override
  String get userSettingsNavDefaultApps => 'אפליקציות ברירת מחדל';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'דפדפן אינטרנט';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'בחר באיזה דפדפן להשתמש כשאתה מקיש על קישור.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'אם אפליקציה מותקנת עבור אתר, קישורים ייפתחו באפליקציה זו תחילה.';

  @override
  String get defaultAppsWebBrowserInApp => 'דפדפן מובנה';

  @override
  String get defaultAppsWebBrowserExternal => 'דפדפן חיצוני';

  @override
  String get userSettingsNavAdvanced => 'מתקדם';

  @override
  String get advancedPerformanceReportingTitle => 'דיווח ביצועים';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'עזרו לשפר את $productName על ידי שיתוף נתוני קריסות וביצועים אנונימיים.';
  }

  @override
  String get advancedPerformanceReportingLabel => 'שלח דוחות קריסה וביצועים';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'כל הנתונים המדווחים אנונימיים ונשלחים רק לשירות הניטור של $productName — לא נעשה שימוש בספקי צד שלישי.';
  }

  @override
  String get advancedSettingsConfigure => 'הגדרות מתקדמות';

  @override
  String get advancedSettingsCategoryPrivacy => 'פרטיות';

  @override
  String get advancedSettingsCategoryAppearance => 'מראה';

  @override
  String get advancedSettingsCategoryAccessibility => 'נגישות';

  @override
  String get advancedSettingsCategoryChat => 'צ\'אט';

  @override
  String get advancedSettingsCategoryMedia => 'מדיה';

  @override
  String get advancedSettingsCategoryVoice => 'קולי';

  @override
  String get advancedSettingsCategoryDeveloper => 'מפתח';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'הפעלת בחירת טקסט';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'אפשר לבחור טקסט באפליקציה';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'הפעל תמונות ממוזערות לניווט בסרטון';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'תמונה מצומצמת או פריים חי בזמן גלילה בסרטון.';

  @override
  String get advancedSettingHapticFeedbackLabel => 'משוב הפטי';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'משוב רטט להקשות ופעולות. לא יסונכרן בין מכשירים.';

  @override
  String get advancedSettingShowNekoLabel => 'הצג נקו';

  @override
  String get advancedSettingShowNekoDescription =>
      'חתול ניקו שרודף אחרי הסמן שלך';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'הצג את ניקו בשדה הקלט של הצ\'אט שלך';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'אנימציית זום בהפעלה';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'כווץ את הלוגו החוצה בעת יציאה ממסך הפתיחה';

  @override
  String get advancedSettingKeyboardHintsLabel => 'רמזי מקלדת';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'רמזים לקיצורי מקלדת בכלי טיפים';

  @override
  String get advancedSettingEnableFavoritesLabel => 'הפעלת מועדפים';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'הצג מועדפים בכל האפליקציה.';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'התנהגות הצטרפות לערוץ קולי';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'אישור או לחיצה כפולה להצטרפות לערוץ קולי בקהילה';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'דרושה לחיצה כפולה כדי להצטרף לערוצי קוליים';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'אישור לפני הצטרפות לערוצי קול';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'שליחה אוטומטית של קובצי GIF עם הבחירה';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'שליחה אוטומטית של קובצי GIF מהבורר ללא אישור';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'שמירת גיפים מועדפים כמדיה שמורה';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'בחרו כיצד לשמור את קובצי ה-GIF המועדפים המסומנים בכוכב';

  @override
  String get advancedSettingMediaButtonsLabel => 'לחצני מדיה';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'התאם אישית אילו כפתורים ואינדיקטורים יופיעו על גבי קבצי מדיה מצורפים והטמעות';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'העלה קבצים מצורפים לפני השליחה';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'התחל בהעלאת קבצים מצורפים ברגע שהם נוספו לשדה ההודעה';

  @override
  String get advancedSettingStripTrackingLabel =>
      'הסרת פרמטרי מעקב מכתובות URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'הסרה אוטומטית של פרמטרי מעקב מכתובות URL בהודעות שאתה שולח';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'אפשר את כל הקישורים החיצוניים';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'דלג על אזהרת הקישור החיצוני עבור כל הדומיינים';

  @override
  String get advancedSettingSearchEnginesLabel => 'מנועי חיפוש';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'הגדר מנועי חיפוש שישמשו בעת בחירת טקסט';

  @override
  String get advancedSettingTranslatorsLabel => 'מתרגמים';

  @override
  String get advancedSettingTranslatorsDescription =>
      'הגדר ספקי תרגום המשמשים לתרגום טקסט שנבחר';

  @override
  String get advancedSettingReverseImageSearchLabel => 'חיפוש תמונה הפוך';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'ספקי חיפוש תמונות הפוך.';

  @override
  String get advancedSettingMessageActionBarLabel => 'שורת פעולות להודעה';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'התאמה אישית של סרגל הפעולות שמופיע כשמרחפים מעל הודעות';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'השלמה אוטומטית של ביטויים';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'בחר מה יופיע כשאתה מקליד נקודתיים בשדה ההודעות';

  @override
  String get advancedSettingInputButtonsLabel => 'לחצני קלט הודעה';

  @override
  String get advancedSettingInputButtonsDescription =>
      'בחר אילו כפתורים יוצגו בשורת ההודעות';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'גלול לתחתית בעת שליחת הודעה';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'בחר כיצד הצ\'אט יתקדם לאחר שליחת הודעה';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'דלג על אישור \"סמן הכל כנקרא\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'סמן את כל ערוצי תיבת הדואר הנכנס שלא נקראו כנקראו באופן מיידי, ללא בקשת אישור';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'להסתיר ערוצים מושתקים כברירת מחדל';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'הסתר ערוצים שהשתקת מסרגלי הצד של הקהילה';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'הצג חיווי GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'הצגת חיווי תפוגת קובץ מצורף';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'הצגת כפתור המחיקה';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'הצג כפתור הורדה';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'הצגת כפתור מועדפים';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'הצגת כפתור השתקת הטמעות';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'הצגת סרגל פעולות ההודעה';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'הצג רק את כפתור \'עוד\'';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'הצגת תגובות מהירות';

  @override
  String get advancedSettingEnableShiftToExpandLabel => 'הפעל Shift כדי להרחיב';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'הצגת אימוג\'י ברירת מחדל בהשלמה אוטומטית של ביטויים';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'הצגת אימוג\'י מותאמים אישית בהשלמה אוטומטית של ביטויים';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'הצגת מדבקות בהשלמה אוטומטית של הבעות';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'הצגת מדיה שמורה בהשלמה אוטומטית של ביטויים';

  @override
  String get advancedSettingShowGifsButtonLabel => 'הצגת כפתור ה-GIF-ים';

  @override
  String get advancedSettingShowMediaButtonLabel => 'הצגת כפתור המדיה';

  @override
  String get advancedSettingShowStickersButtonLabel => 'הצגת כפתור המדבקות';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'הצגת לחצן אימוג\'י';

  @override
  String get advancedSettingShowSendButtonLabel => 'הצגת כפתור השליחה';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'הצגת התראות על מכשירים חדשים';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'בקשה להתקנים חדשים של אודיו.';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'בקרות עוצמת קול חיבור';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'הצג פקדי עוצמת קול למשתתפים לפי מכשיר בתפריטי קול';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'התנהגות תצוגה מקדימה של שיתוף מסך';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'תצוגה מקדימה, פתיחה בחלון נפרד והתנהגות של תמונת מצב עבור סטרימינג.';

  @override
  String get advancedSettingScreenShareCodecLabel => 'קודק שיתוף מסך';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'קודק וידאו לשיתוף מסך.';

  @override
  String get advancedSettingScreenShareCodecAuto => 'אוטומטי (מומלץ)';

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
      'השהה את התצוגה המקדימה של שיתוף המסך שלי ברקע';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'הסתר את התמונה הממוזערת של תצוגה מקדימה של הזרם שלי';

  @override
  String get advancedSettingDeveloperModeLabel => 'הפעל מצב מפתחים';

  @override
  String get advancedSettingDeveloperModeDescription => 'הפעל מצב מפתחים';

  @override
  String get advancedSettingSearchEngineGoogle => 'גוגל';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'בינג';

  @override
  String get advancedSettingSearchEngineGoogleLens => 'Google Lens';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => 'תרגום Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'מנוע חיפוש ברירת מחדל';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'בחר באיזה מנוע חיפוש להשתמש כברירת מחדל בעת חיפוש טקסט נבחר.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => 'מנועי חיפוש מובנים';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'הפעלה או השבתה של מנועי חיפוש מובנים. מנועי חיפוש מופעלים יופיעו בתפריט ההקשר של ההודעה בעת בחירת טקסט.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'מנועי חיפוש מותאמים אישית';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'הוסף מנועי חיפוש משלך עם תבנית כתובת URL מותאמת אישית. השתמש ב-$query כמציין מיקום לטקסט החיפוש.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'הוספת מנוע חיפוש';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'יש להפעיל מנוע חיפוש אחד לפחות מהרשימה מטה.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'הסר מנוע חיפוש';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'מתרגם ברירת מחדל';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'בחרו באיזה מתרגם להשתמש כברירת מחדל כשמתרגמים טקסט נבחר.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'תרגומים מובנים';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'הפעלה או השבתה של מתרגמים מובנים. מתרגמים מופעלים יופיעו בתפריט ההקשר של ההודעה בעת בחירת טקסט.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'מתרגמים מותאמים אישית';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'הוסף מתרגמים משלך עם תבנית כתובת URL מותאמת אישית. השתמש ב-\'$query\' כמציין מיקום לטקסט לתרגום.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'הוספת מתרגם';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'יש להפעיל לפחות מתרגם אחד למטה.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'הסר מתרגם';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'חיפוש תמונה הפוך כברירת מחדל';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'בחר באיזה שירות חיפוש תמונות הפוך להשתמש כברירת מחדל בעת חיפוש תמונה.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'חיפוש תמונות הפוך מובנה';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'הפעלה או השבתה של ספקי חיפוש תמונה הפוך מובנים. ספקים מופעלים יופיעו בתפריט ההקשר של תמונות, אווטארים, באנרים, מדבקות ואימוג\'י.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'חיפוש תמונה הפוך מותאם אישית';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'הוסף ספקי חיפוש תמונה הפוך משלך עם תבנית URL מותאמת אישית. השתמש ב-\'$url\' כמחליף לכתובת ה-URL של התמונה.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'הוספת חיפוש תמונה הפוך';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'יש להפעיל לפחות ספק אחד לחיפוש תמונות הפוך למטה.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'הסר חיפוש תמונה הפוך';

  @override
  String get advancedSettingAddSearchEngineTitle => 'הוספת מנוע חיפוש';

  @override
  String get advancedSettingEditSearchEngineTitle => 'עריכת מנוע חיפוש';

  @override
  String get advancedSettingAddTranslatorTitle => 'הוספת ספק תרגום';

  @override
  String get advancedSettingEditTranslatorTitle => 'עריכת ספק תרגום';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'הוספת מנוע חיפוש תמונות הפוך';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'עריכת מנוע חיפוש תמונה הפוך';

  @override
  String get advancedSettingSearchProviderNameLabel => 'שם';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'תבנית כתובת אתר (URL)';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'מנוע החיפוש שלי';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'המתרגם שלי';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'החיפוש ההפוך שלי לתמונות';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'השתמש ב-\'$query\' היכן שהטקסט לחיפוש אמור להיות מוכנס.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'השתמש ב-\'$query\' היכן שהטקסט לתרגום אמור להיות מוכנס.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'השתמש ב-\'$url\' היכן שכתובת ה-URL של התמונה אמורה להיות מוכנסת.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'נדרש שם.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'דפוס כתובת האתר נדרש.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'תבנית ה-URL חייבת להכיל את המקום להחזקת הפריט \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'תבנית הכתובת חייבת להכיל את המקום להחזקת הפריט \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'תבנית ה-URL חייבת להיות כתובת URL חוקית.';

  @override
  String get advancedSettingAddSearchProviderAction => 'הוספה';

  @override
  String get advancedSettingEditSearchProviderAction => 'עריכה';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'הסר';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'האם אתה בטוח שברצונך להסיר את $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'אפליקציות';

  @override
  String get userSettingsNavAppLogs => 'יומני אפליקציה';

  @override
  String get userSettingsNavDeveloperTools => 'כלי מפתחים';

  @override
  String get userSettingsNavLimitsConfig => 'הגדרות מגבלות';

  @override
  String get userSettingsNavFeatureFlags => 'דגלי תכונות';

  @override
  String get userSettingsNavWhatsNew => 'מה חדש';

  @override
  String get userSettingsJoinFluxerLabs => 'הצטרפו ל-Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'רישיונות אפליקציה';

  @override
  String get userSettingsAppLicensesDescription =>
      'תוכנות קוד פתוח בהן נעשה שימוש באפליקציה זו. האפליקציה בנויה באמצעות Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'לא ניתן היה לטעון את רישיונות האפליקציה.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count רישיונות',
      one: 'רישיון אחד',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'יציאה';

  @override
  String get quickSwitcherTabSearch => 'חיפוש';

  @override
  String get quickSwitcherTabFriends => 'חברים';

  @override
  String get quickSwitcherSearchPlaceholder => 'חיפוש ערוצים, אנשים או קהילות';

  @override
  String get quickSwitcherSearchFriends => 'חיפוש חברים';

  @override
  String get quickSwitcherNoMatchesFound => 'לא נמצאו התאמות';

  @override
  String get quickSwitcherEmptyHint =>
      'נסה שם אחר או השתמש בקידומות @ / # / ! / * כדי לסנן תוצאות.';

  @override
  String get quickSwitcherSectionPeople => 'אנשים';

  @override
  String get quickSwitcherSectionGroupMessages => 'הודעות קבוצתיות';

  @override
  String get quickSwitcherSectionTextChannels => 'ערוצי טקסט';

  @override
  String get quickSwitcherSectionVoiceChannels => 'ערוצי קול';

  @override
  String get quickSwitcherSectionCommunities => 'קהילות';

  @override
  String get quickSwitcherSectionSettings => 'הגדרות';

  @override
  String get quickSwitcherHomeLabel => 'בית';

  @override
  String get quickSwitcherDirectMessagesLabel => 'הודעות ישירות';

  @override
  String get quickSwitcherFavoritesLabel => 'מועדפים';

  @override
  String get quickSwitcherUserSettingsLabel => 'הגדרות משתמש';

  @override
  String get quickSwitcherNotificationsLabel => 'התראות';

  @override
  String get quickSwitcherBookmarksLabel => 'סימניות';

  @override
  String get savedMessagesEmptyTitle => 'אין סימניות';

  @override
  String get savedMessagesEmptyBody =>
      'סמנו הודעות בסימנייה כדי לשמור אותן לאחר מכן.';

  @override
  String get savedMessagesEndBody => 'אין עוד מה לראות כאן.';

  @override
  String get savedMessagesRemoveTooltip => 'הסר סימנייה';

  @override
  String get quickSwitcherMentionsLabel => 'אזכורים';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'אין חברים עדיין';

  @override
  String get quickSwitcherFriendsEmptyHint => 'הוסף חבר כדי להתחיל.';

  @override
  String get quickSwitcherFriendsNoMatchTitle => 'אין חברים שתואמים לחיפוש זה';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'נסו שם אחר.';

  @override
  String get quickSwitcherSearchAliasUser => 'משתמש';

  @override
  String get quickSwitcherSearchAliasYou => 'אתה/את';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'הודעות ישירות';

  @override
  String get quickSwitcherSearchAliasMessages => 'הודעות';

  @override
  String get quickSwitcherSearchAliasFav => 'מועדפים';

  @override
  String get quickSwitcherSearchAliasStarred => 'מועדפים';

  @override
  String get quickSwitcherSearchAliasInbox => 'תיבת דואר נכנס';

  @override
  String get quickSwitcherSearchAliasSaved => 'נשמר';

  @override
  String get uiClose => 'סגירה';

  @override
  String get chatJumpToBottom => 'קפוץ לתחתית';

  @override
  String get uiConfirm => 'אישור';

  @override
  String get uiLoading => 'טוען';

  @override
  String get uiSearch => 'חיפוש';

  @override
  String get uiStartCall => 'התחלת שיחה';

  @override
  String get uiStartVideoCall => 'התחלת שיחת וידאו';

  @override
  String get uiPlay => 'הפעל';

  @override
  String get uiPause => 'השהה';

  @override
  String get uiDownload => 'הורדה';

  @override
  String get uiMoreActions => 'פעולות נוספות';

  @override
  String get uiUnsavedChanges => 'שינויים שלא נשמרו';

  @override
  String get uiReset => 'איפוס';

  @override
  String get uiOpenColorPicker => 'פתח/י בורר צבעים';

  @override
  String get uiSelectPlaceholder => 'בחר';

  @override
  String get uiSearchPlaceholder => 'חיפוש';

  @override
  String get uiNoOptionsFound => 'לא נמצאו אפשרויות';

  @override
  String get uiDismissNotification => 'סגור התראה';

  @override
  String get uiColorPickerTitle => 'בורר צבעים';

  @override
  String get mentionConfirmTitle => 'להזכיר את כולם?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'זה יתריע ל-$count חברים. להמשיך?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'הודעה זו תשלח ל-$count מחברי הקבוצה שנמצאים כעת ברשת. להמשיך?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'זה יתריע ל-$count חברים עם התפקיד $roleName. להמשיך?';
  }

  @override
  String get mentionConfirmButton => 'תיוג';

  @override
  String get composerEmojiUnavailable => 'אי אפשר להשתמש באימוג\'י הזה כאן.';

  @override
  String get instanceUrlLabel => 'כתובת ה-URL של המופע';

  @override
  String get instanceUrlPlaceholder =>
      'הזן כתובת URL של מופע (לדוגמה, fluxer.app)';

  @override
  String get resetToDefaultInstance => 'אפס ל-Fluxer';

  @override
  String get instanceConnect => 'התחבר';

  @override
  String get instanceConnecting => 'מתחבר…';

  @override
  String get instanceConnectFailed => 'נכשל החיבור למופע';

  @override
  String get recentInstances => 'מופעים אחרונים';

  @override
  String removeRecentInstance(String domain) {
    return 'הסר את $domain מהמופעים האחרונים';
  }

  @override
  String get instanceSheetTitle => 'התחבר למופע';

  @override
  String get connectToDifferentInstance => 'התחבר למופע אחר';

  @override
  String get changeInstance => 'שנה';

  @override
  String get instanceConnectionRequired => 'התחבר/י לשרת כדי להיכנס';

  @override
  String get comingSoon => 'בקרוב';

  @override
  String get guildNavbarDirectMessages => 'הודעות ישירות';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'גלה קהילות שניתן לגלות';

  @override
  String get discoveryExplore => 'גלו';

  @override
  String get discoveryExplorePublicCommunities => 'חקור קהילות ציבוריות';

  @override
  String get discoveryListingSubheading =>
      'רוצים לרשום את הקהילה שלכם כאן? הגישו בקשה אם אתם עומדים בדרישות בהגדרות הקהילה שלכם > גילוי.';

  @override
  String get discoverySearchCommunities => 'חיפוש קהילות';

  @override
  String get discoveryFilterByLanguage => 'סינון לפי שפה';

  @override
  String get discoveryAllLanguages => 'כל השפות';

  @override
  String get discoveryAllCategories => 'הכל';

  @override
  String get discoveryCategoryGaming => 'גיימינג';

  @override
  String get discoveryCategoryMusic => 'מוזיקה';

  @override
  String get discoveryCategoryEntertainment => 'בידור';

  @override
  String get discoveryCategoryEducation => 'השכלה';

  @override
  String get discoveryCategoryScienceAndTechnology => 'מדע וטכנולוגיה';

  @override
  String get discoveryCategoryContentCreator => 'יוצרי תוכן';

  @override
  String get discoveryCategoryAnimeAndManga => 'אנימה ומנגה';

  @override
  String get discoveryCategoryMoviesAndTv => 'סרטים וטלוויזיה';

  @override
  String get discoveryCategoryOther => 'אחר';

  @override
  String get discoveryNoCommunitiesMatch => 'אין קהילות תואמות.';

  @override
  String get discoveryJoinCommunity => 'הצטרפות לקהילה';

  @override
  String get discoveryJoined => 'הצטרפת';

  @override
  String discoveryOnlineCount(String count) {
    return '$count מחוברים';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString חברים',
      one: 'חבר אחד',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'אין תיאור.';

  @override
  String get discoveryCommunities => 'קהילות';

  @override
  String get discoveryApps => 'אפליקציות';

  @override
  String get discoveryJoinErrorGenericTitle => 'לא ניתן להצטרף לקהילה זו';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'משהו השתבש. יש לנסות שוב בעוד רגע.';

  @override
  String get discoveryJoinErrorFullTitle => 'הקהילה הזו מלאה';

  @override
  String get discoveryJoinErrorFullMessage =>
      'הקהילה הזו הגיעה למגבלת החברים שלה, כך שאינך יכול/ה להצטרף כרגע.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'הגעת למספר הקהילות המקסימלי';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'הגעת למספר הקהילות המקסימלי. עזוב קהילה אחת ונסה שוב.';

  @override
  String get discoveryJoinErrorBannedTitle => 'אינך יכול/ה להצטרף לקהילה זו';

  @override
  String get discoveryJoinErrorBannedMessage => 'נאסר עליך להשתמש בקהילה זו.';

  @override
  String get discoveryJoinErrorNotAvailableTitle => 'הקהילה הזו אינה זמינה עוד';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'ייתכן שהקהילה יצאה מגילוי או ביטלה הצטרפות של משתמשים חדשים. רענן את הדף ולא תראה אותה שוב.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'אתה מהיר מדי';

  @override
  String get discoveryJoinErrorRateLimitMessage => 'יש להמתין רגע ולנסות שוב.';

  @override
  String get guildNavbarAddCommunity => 'הוסף קהילה';

  @override
  String get guildNavbarHelp => 'עזרה';

  @override
  String get scrollIndicatorNew => 'חדש';

  @override
  String get scrollIndicatorNewMessage => 'הודעה חדשה';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'כיווץ $folderName';
  }

  @override
  String get guildNavbarGuildSelected => '(נבחר)';

  @override
  String get guildNavbarGuildUnread => 'שלא נקראו';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count התראות',
      one: 'התראה אחת',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'מושתק';

  @override
  String get authShowPassword => 'הצג סיסמה';

  @override
  String get authHidePassword => 'הסתר סיסמה';

  @override
  String get chatLoadingMessages => 'טוען הודעות';

  @override
  String get friendsMessageFriend => 'הודעה';

  @override
  String get friendsFriendActions => 'פעולות חבר';

  @override
  String get friendsAcceptRequest => 'אישור בקשת חברות';

  @override
  String get friendsDeclineRequest => 'דחה בקשת חברות';

  @override
  String get friendsCancelRequest => 'ביטול בקשת חברות';

  @override
  String get friendsOpenInbox => 'תיבת דואר נכנס';

  @override
  String get profileRemoveFriend => 'הסר חבר';

  @override
  String get profileUnblockUser => 'בטל חסימת משתמש';

  @override
  String get profileAcceptFriendRequest => 'אישור בקשת חברות';

  @override
  String get profileCancelFriendRequest => 'ביטול בקשת חברות';

  @override
  String get profileSendFriendRequest => 'הוסף חבר';

  @override
  String get accountOverflowMenu => 'אפשרויות חשבון';

  @override
  String get navHome => 'בית';

  @override
  String get navNotifications => 'התראות';

  @override
  String get navYou => 'אתה/את';

  @override
  String get guildFolderSettingsTitle => 'הגדרות תיקייה';

  @override
  String get guildFolderNameLabel => 'שם התיקייה';

  @override
  String get guildFolderColorLabel => 'צבע תיקייה';

  @override
  String get guildFolderShowIconWhenCollapsed => 'הצג סמל כשהתיקייה מקופלת';

  @override
  String get guildFolderIconLabel => 'סמל תיקייה';

  @override
  String get guildFolderDelete => 'מחיקת תיקייה';

  @override
  String get guildFolderIconFolder => 'תיקייה';

  @override
  String get guildFolderIconStar => 'כוכב';

  @override
  String get guildFolderIconHeart => 'לב';

  @override
  String get guildFolderIconBookmark => 'סימנייה';

  @override
  String get guildFolderIconGameController => 'בקר משחק';

  @override
  String get guildFolderIconShield => 'הגנה';

  @override
  String get guildFolderIconMusicNote => 'תו מוזיקה';

  @override
  String get guildFolderMarkAsRead => 'סימון תיקייה כנקראת';

  @override
  String get guildBulkMuteCommunities => 'השתקת קהילות';

  @override
  String get guildBulkUnmuteCommunities => 'בטל השתקה לקהילות';

  @override
  String get guildBulkCommunityNotificationSettings => 'הגדרות התראות קהילה';

  @override
  String get guildBulkCommunityPrivacySettings => 'הגדרות פרטיות של קהילה';

  @override
  String get guildBulkAllowEveryoneAndHere => 'אפשר @everyone ו-@here';

  @override
  String get guildBulkAllowRoleMentions => 'אפשר אזכורי תפקידים';

  @override
  String get guildBulkEnableMobilePush => 'הפעלת התראות דחיפה בנייד';

  @override
  String get guildBulkDisableMobilePush => 'השבתת התראות דחיפה בנייד';

  @override
  String get guildBulkAllowDirectMessages => 'אפשר הודעות ישירות';

  @override
  String get guildBulkBlockDirectMessages => 'חסימת הודעות פרטיות';

  @override
  String get guildBulkAllowBotDirectMessages => 'אפשר הודעות בוט ישירות';

  @override
  String get guildBulkBlockBotDirectMessages => 'חסימת הודעות בוט ישירות';

  @override
  String get guildNavbarGroupDm => 'קבוצת DM';

  @override
  String get guildNavbarCreateChannel => 'יצירת ערוץ';

  @override
  String get guildNavbarChannelType => 'סוג ערוץ';

  @override
  String get guildNavbarTextChannel => 'ערוץ טקסט';

  @override
  String get guildNavbarTextChannelDescription =>
      'שלח הודעות, תמונות, GIFים ואימוג\'י';

  @override
  String get guildNavbarVoiceChannel => 'ערוץ קולי';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'שוחחו יחד באמצעות שיחות קול, וידאו ושיתוף מסך';

  @override
  String get guildNavbarLinkChannel => 'קישור לערוץ';

  @override
  String get guildNavbarLinkChannelDescription =>
      'גישה מהירה לאתר או למשאב חיצוני';

  @override
  String get guildNavbarNameLabel => 'שם';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'בחירת סוג ערוץ';

  @override
  String get guildNavbarCreateCategory => 'יצירת קטגוריה';

  @override
  String get guildNavbarNewCategoryHint => 'קטגוריה חדשה';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'הזמן חברים אל $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'הנמענים יועברו אל #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'חיפוש חברים';

  @override
  String get guildNavbarNoFriendsYet => 'אין חברים עדיין';

  @override
  String get guildNavbarNoResults => 'אין תוצאות';

  @override
  String get guildNavbarInviteLinkPrompt => 'לחלופין, שלח קישור הזמנה לחבר:';

  @override
  String get guildNavbarInviteLink => 'קישור להזמנה';

  @override
  String get guildNavbarCopy => 'העתקה';

  @override
  String get guildNavbarCopied => 'הועתק!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'קישור ההזמנה שלך יפוג בעוד 7 ימים.';

  @override
  String get guildNavbarInviteNeverExpires => 'קישור ההזמנה הזה לעולם לא יפוג.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'קישור ההזמנה שלך יפוג בעוד $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'עריכת קישור הזמנה';

  @override
  String get guildNavbarInviteLinkSettings => 'הגדרות קישור הזמנה';

  @override
  String get guildNavbarExpireAfter => 'פג תוקף לאחר';

  @override
  String get guildNavbarMaxUses => 'מספר שימושים מקסימלי';

  @override
  String get guildNavbarGrantTemporaryMembership => 'הענק חברות זמנית';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'החברים יוסרו כשיעברו לאופליין, אלא אם יוקצה להם תפקיד';

  @override
  String get guildNavbarCreateNewLink => 'צור קישור חדש';

  @override
  String get guildNavbarSent => 'נשלח';

  @override
  String get guildNavbarInvite => 'הזמן';

  @override
  String get guildNavbarLeaveCommunityTitle => 'עזוב קהילה';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'האם אתה בטוח שברצונך לעזוב קהילה זו? לא תוכל לראות עוד הודעות.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'עזוב קהילה';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'למחוק את ההודעות שלך בקהילה זו?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'מחק לצמיתות את כל ההודעות ששלחת כאן, בכל הערוצים. לא ניתן לבטל פעולה זו.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'מחק את ההודעות שלי';

  @override
  String get guildNavbarDeletedYourMessages => 'ההודעות שלך נמחקו';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'לא ניתן היה למחוק את ההודעות שלך';

  @override
  String get guildNavbarRemoveOverride => 'הסר עקיפה';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'הושבת עד $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'נגיש רק לצוות של $productName';
  }

  @override
  String get guildNavbarInvitesPaused => 'ההזמנות מושהות כרגע בקהילה זו';

  @override
  String get guildNavbarDurationNever => 'לעולם לא';

  @override
  String get guildNavbarDuration30Minutes => '30 דקות';

  @override
  String get guildNavbarDuration1Hour => 'שעה אחת';

  @override
  String get guildNavbarDuration6Hours => '6 שעות';

  @override
  String get guildNavbarDuration12Hours => '12 שעות';

  @override
  String get guildNavbarDuration1Day => 'יום אחד';

  @override
  String get guildNavbarDuration7Days => '7 ימים';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count שניות';
  }

  @override
  String get guildNavbarNever => 'אף פעם';

  @override
  String get guildNavbarNoLimit => 'ללא הגבלה';

  @override
  String get guildNavbarOneUse => 'שימוש אחד';

  @override
  String guildNavbarUses(int count) {
    return '$count שימושים';
  }

  @override
  String get guildMenuMarkAsRead => 'סמן כנקרא';

  @override
  String get guildPeekMoreOptions => 'עוד אפשרויות';

  @override
  String get guildMenuInviteMembers => 'הזמן חברים';

  @override
  String get guildMenuCommunitySettings => 'הגדרות קהילה';

  @override
  String get guildMenuEditCommunityProfile => 'עריכת פרופיל הקהילה';

  @override
  String get guildMenuUnmuteCommunity => 'בטל השתקה של הקהילה';

  @override
  String get guildMenuMuteCommunity => 'השתק קהילה';

  @override
  String get guildMenuHideMutedChannels => 'הסתר ערוצים מושתקים';

  @override
  String get guildMenuReportCommunity => 'דווח על הקהילה';

  @override
  String get guildMenuDebugCommunity => 'מידע על קהילה לניפוי שגיאות';

  @override
  String get guildMenuCopyCommunityId => 'העתק את מזהה הקהילה';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'עד $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'כללי';

  @override
  String get guildMenuSettingsRoles => 'תפקידים והרשאות';

  @override
  String get guildMenuSettingsEmoji => 'אימוג\'י';

  @override
  String get guildMenuSettingsStickers => 'מדבקות';

  @override
  String get guildMenuSettingsSafetyModeration => 'בטיחות וניהול';

  @override
  String get guildMenuSettingsActivityLog => 'יומן פעולות';

  @override
  String get guildMenuSettingsWebhooks => 'ווב-הוקס';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'כתובת הזמנה מותאמת אישית';

  @override
  String get guildMenuSettingsDiscovery => 'גילוי';

  @override
  String get guildMenuSettingsMembers => 'חברים';

  @override
  String get guildMenuSettingsInviteLinks => 'הזמנות';

  @override
  String get guildMenuSettingsBans => 'חסימות';

  @override
  String get guildMenuSettingsChannels => 'ערוצים';

  @override
  String get guildSettingsNoPermission =>
      'אין לך הרשאה להציג את לשונית ההגדרות הזו.';

  @override
  String get guildSettingsOverviewIconTitle => 'אייקון';

  @override
  String get guildSettingsUploadImage => 'העלה תמונה';

  @override
  String get guildSettingsOverviewBannerTitle => 'באנר';

  @override
  String get guildSettingsOverviewBannerHint => 'העלה באנר לשרת שלך.';

  @override
  String get guildSettingsOverviewNameTitle => 'שם';

  @override
  String get guildSettingsOverviewNameHint => 'הקהילה המדהימה שלי';

  @override
  String get guildSettingsOverviewStatsTitle => 'סטטיסטיקה';

  @override
  String get guildSettingsOverviewMembers => 'חברים';

  @override
  String get guildSettingsOverviewOnline => 'מחובר';

  @override
  String get guildSettingsRolesDescription =>
      'השתמש בתפקידים כדי לקבץ חברים ולהקצות הרשאות.';

  @override
  String get guildSettingsCreateRole => 'יצירת תפקיד';

  @override
  String get guildSettingsRolesListTitle => 'תפקידים';

  @override
  String get guildSettingsRolesNewRole => 'תפקיד חדש';

  @override
  String get guildSettingsRolesDeleteRole => 'מחיקת תפקיד';

  @override
  String get guildSettingsRolesBackToRoles => 'חזרה לתפקידים';

  @override
  String get guildSettingsBackToSettings => 'חזרה להגדרות';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'ערוך את \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle => 'הגדרות הרשאות ותפקידים';

  @override
  String get guildSettingsRolesDisplaySection => 'תצוגה';

  @override
  String get guildSettingsRolesRoleName => 'שם התפקיד';

  @override
  String get guildSettingsRolesRoleColor => 'צבע תפקיד';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'הקלד צבע (hex, rgb(), hsl(), או שם) או השתמש בבורר.';

  @override
  String get guildSettingsRolesShowSeparately => 'הצג תפקיד זה בנפרד';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'מציג חברים עם תפקיד זה במקטע משלהם ברשימת החברים.';

  @override
  String get guildSettingsRolesAllowMentions => 'אפשר אזכורים לתפקיד זה';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'חברים עם ההרשאה \"$permission\" תמיד יוכלו להזכיר תפקידים, ללא קשר להגדרה זו.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'השתמשו בלחצן זה כדי לנקות במהירות את כל ההרשאות.';

  @override
  String get guildSettingsRolesClearPermissions => 'איפוס הרשאות';

  @override
  String get guildSettingsRolesPermissionsSection => 'הרשאות';

  @override
  String get guildSettingsRolesSearchPermissions => 'חיפוש הרשאות';

  @override
  String get guildSettingsRolesDenseLayout => 'פריסה דחוסה';

  @override
  String get guildSettingsRolesComfyLayout => 'פריסה נוחה';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => 'החלף לתצוגה דחוסה';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => 'החלף לתצוגה נוחה';

  @override
  String get guildSettingsRolesSingleColumn => 'עמודה בודדת';

  @override
  String get guildSettingsRolesTwoColumns => 'שתי עמודות';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'החלף לתצוגה בטור יחיד';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'הצג בשתי עמודות';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'לא נמצאו הרשאות';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'סדר הצגה מותאם אישית';

  @override
  String get guildSettingsRolesHoistOrder => 'סדר הצגה';

  @override
  String get guildSettingsRolesResetHoistOrder => 'איפוס לברירת מחדל';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'גרור תפקידים כדי להתאים אישית את סדר הופעתם ברשימת החברים.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'אין תפקידים מועדפים. הפעל/י את האפשרות \"הצג תפקיד זה בנפרד\" בתפקיד כדי לראות אותו כאן.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'אינך יכול/ה לערוך תפקיד זה מכיוון שהוא התפקיד הגבוה ביותר שלך או מעליך';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'אתה צריך את ההרשאה \"$permission\" כדי לערוך את ההרשאות האלה';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'אינך יכול/ה לערוך תפקיד שנמצא באותה רמה או מעל התפקיד הגבוה ביותר שלך';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'אינך יכול/ה להעניק הרשאה שאין לך';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'לא ניתן להסיר הרשאה זו מכיוון שהיא תסיר אותה גם ממך';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'התפקידים עודכנו בהצלחה';

  @override
  String get guildSettingsRolesCreatedSuccess => 'התפקיד נוצר בהצלחה';

  @override
  String get guildSettingsRolesDeletedSuccess => 'התפקיד נמחק בהצלחה';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'סדר ההצגה אופס לברירת מחדל';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'שם התפקיד נדרש';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'יש לתת שם לתפקיד לפני השמירה.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'לא ניתן ליצור תפקיד';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'לא ניתן היה לעדכן תפקידים';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'לא ניתן היה למחוק את התפקיד';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" לא נמחק. נסה שוב.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'לא ניתן לאפס את סדר ההצגה';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'נסו שוב בעוד רגע.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'האם אתה בטוח שברצונך למחוק את התפקיד $name? כל החברים עם תפקיד זה יאבדו אותו.';
  }

  @override
  String get permissionCategoryCommunityWide => 'כלל הקהילה';

  @override
  String get permissionCategoryMessagesMedia => 'הודעות ומדיה';

  @override
  String get permissionCategoryModeration => 'ניהול';

  @override
  String get permissionCategoryChannelAccess => 'גישה לערוץ';

  @override
  String get permissionCategoryChannelManagement => 'ניהול ערוצים';

  @override
  String get permissionCategoryAudioVideo => 'שמע ווידאו';

  @override
  String get permissionUnknown => 'הרשאה לא ידועה';

  @override
  String get permissionAdministrator => 'מנהל מערכת';

  @override
  String get permissionAdministratorDescription =>
      'מעניק את כל ההרשאות ועוקף הגבלות ערוץ. רגיש במיוחד.';

  @override
  String get permissionViewActivityLog => 'הצגת יומן פעילות';

  @override
  String get permissionViewActivityLogDescription =>
      'קריאת יומן הפעילות של הקהילה, כולל שינויים ופעולות ניהול.';

  @override
  String get permissionManageCommunity => 'ניהול קהילה';

  @override
  String get permissionManageCommunityDescription =>
      'עריכת הגדרות כלליות כמו שם, תיאור וסמל.';

  @override
  String get permissionManageRoles => 'ניהול תפקידים';

  @override
  String get permissionManageRolesDescription =>
      'יצירה, עריכה או מחיקה של תפקידים מתחת לתפקיד הגבוה ביותר שלך. מאפשר גם עריכת עקיפות הרשאות ערוץ.';

  @override
  String get permissionManageChannels => 'ניהול ערוצים';

  @override
  String get permissionManageChannel => 'ניהול ערוץ';

  @override
  String get permissionManageChannelDescription =>
      'שנה את שם הערוץ הזה וערוך את ההגדרות שלו.';

  @override
  String get permissionManagePermissions => 'ניהול הרשאות';

  @override
  String get permissionManagePermissionsDescription =>
      'ערוך עקיפות עבור תפקידים וחברים בערוץ זה.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'יצירה, עריכה או מחיקה של Webhooks עבור הערוץ הזה.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'הצגת רשימת החברים בערוץ זה.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'נהל קישורי הזמנה עבור ערוץ זה.';

  @override
  String get permissionOverwriteDeny => 'דחייה';

  @override
  String get permissionOverwriteInherit => 'ניטרלי (בירושה)';

  @override
  String get permissionOverwriteAllow => 'אפשר';

  @override
  String get permissionOverwriteSetAllHelp =>
      'השתמשו בלחצנים האלה כדי להגדיר במהירות את כל ההרשאות.';

  @override
  String get permissionManageChannelsDescription =>
      'יצירה, עריכה או מחיקה של ערוצים וקטגוריות.';

  @override
  String get permissionKickMembers => 'להרחיק חברים';

  @override
  String get permissionBanMembers => 'הרחקת חברים';

  @override
  String get permissionCreateInviteLinks => 'יצירת קישורי הזמנה';

  @override
  String get permissionChangeOwnNickname => 'שינוי כינוי משלך';

  @override
  String get permissionChangeOwnNicknameDescription => 'עדכן את הכינוי שלך.';

  @override
  String get permissionManageNicknames => 'ניהול כינויים';

  @override
  String get permissionManageNicknamesDescription =>
      'שינוי כינויים של חברים אחרים.';

  @override
  String get permissionCreateEmojiStickers => 'יצירת אימוג\'י ומדבקות';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'העלה אימוג\'י ומדבקות חדשים, ונהל את היצירות שלך.';

  @override
  String get permissionManageEmojiStickers => 'ניהול אימוג\'י ומדבקות';

  @override
  String get permissionManageEmojiStickersDescription =>
      'עריכה או מחיקה של אימוג\'י ומדבקות שנוצרו על ידי חברים אחרים.';

  @override
  String get permissionManageWebhooks => 'ניהול Webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'יצירה, עריכה או מחיקה של Webhooks.';

  @override
  String get permissionSendMessages => 'שליחת הודעות';

  @override
  String get permissionSendTtsMessages => 'שליחת הודעות טקסט לדיבור';

  @override
  String get permissionSendTtsMessagesDescription => 'שלח הודעות טקסט לדיבור.';

  @override
  String get permissionManageMessages => 'ניהול הודעות';

  @override
  String get permissionManageMessagesDescription =>
      'מחיקת הודעות של חברים אחרים. הצמדה נשלטת בנפרד.';

  @override
  String get permissionPinMessages => 'הצמדת הודעות';

  @override
  String get permissionEmbedLinks => 'הטמעת קישורים';

  @override
  String get permissionAttachFiles => 'צירוף קבצים';

  @override
  String get permissionMentionEveryone => 'השתמש ב-@everyone/@here ו-@role';

  @override
  String get permissionMentionEveryoneDescription =>
      'תייגו את כולם או כל תפקיד (גם אם התפקיד לא מוגדר כניתן לתיוג).';

  @override
  String get permissionUseExternalEmoji => 'שימוש באימוג\'י חיצוניים';

  @override
  String get permissionUseExternalEmojiDescription =>
      'השתמשו באימוג\'י מקהילות אחרות.';

  @override
  String get permissionUseExternalStickers => 'שימוש במדבקות חיצוניות';

  @override
  String get permissionAddReactions => 'הוספת ריאקציות';

  @override
  String get permissionAddReactionsDescription =>
      'הוספת ריאקציות חדשות להודעות.';

  @override
  String get permissionBypassSlowmode => 'עקיפת מצב איטי';

  @override
  String get permissionBypassSlowmodeDescription =>
      'התעלם ממגבלות קצב הודעות לכל ערוץ.';

  @override
  String get permissionTimeOutMembers => 'השתקת חברים זמנית';

  @override
  String get permissionTimeOutMembersDescription =>
      'מניעת חברים מלשלוח הודעות, להגיב ולהצטרף לשיחות קוליות למשך זמן מוגדר.';

  @override
  String get permissionViewChannel => 'הצגת ערוץ';

  @override
  String get permissionViewChannelMembers => 'הצגת חברי ערוץ';

  @override
  String get permissionViewChannelMembersDescription =>
      'הצגת רשימת החברים בערוצים בקהילה זו.';

  @override
  String get permissionConnect => 'חבר';

  @override
  String get permissionSpeak => 'דיבור';

  @override
  String get permissionStreamVideo => 'הזרמת וידאו';

  @override
  String get permissionUseVoiceActivity => 'השתמש בפעילות קולית';

  @override
  String get permissionUseVoiceActivityDescription =>
      'ללא הרשאה זו, נדרש לחיצה לדיבור.';

  @override
  String get permissionPrioritySpeaker => 'דובר בעדיפות';

  @override
  String get permissionMuteMembers => 'השתקת משתתפים';

  @override
  String get permissionDeafenMembers => 'להשתיק משתתפים';

  @override
  String get permissionMoveMembers => 'העברת חברים';

  @override
  String get permissionMoveMembersDescription =>
      'גרור חברים בין ערוצים שהם יכולים לגשת אליהם.';

  @override
  String get permissionSetVoiceRegion => 'הגדר אזור קולי';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount אימוג\'י סטטיים, $animatedCount אימוג\'י מונפשים בשימוש';
  }

  @override
  String get guildSettingsEmojiEmpty => 'עדיין אין אימוג\'י מותאם אישית.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count מדבקות שהועלו';
  }

  @override
  String get guildSettingsStickersEmpty => 'עדיין אין מדבקות מותאמות אישית.';

  @override
  String get guildSettingsModerationVerificationTitle => 'אימות חברים';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'בחר מה חברים חייבים שיהיה להם לפני שהם יכולים לפרסם או לשלוח הודעה פרטית לחברי קהילה.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'חברים עם תפקידים יכולים לעקוף את הבדיקות האלה. עבור מרחבים ציבוריים, אנו ממליצים להפעיל אימות.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'קהילות המופיעות ב\'גילוי\' דורשות אימייל מאומת לפחות. לא ניתן לבחור באפשרות \'ללא\' כש\'גילוי\' מופעל.';

  @override
  String get guildSettingsModerationMatureTitle => 'תוכן למבוגרים ואזהרות תוכן';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'הגדר תיוג תו בוגר ואזהרות תו אופציונליות לחברים.';

  @override
  String get guildSettingsModerationMatureToggle => 'תוכן למבוגרים';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'סמן קהילה זו כככילת תוכן למבוגרים.';

  @override
  String get guildSettingsVerificationNone => 'ללא';

  @override
  String get guildSettingsVerificationNoneDescription => 'אין צורך באימות.';

  @override
  String get guildSettingsVerificationLow => 'נמוכה';

  @override
  String get guildSettingsVerificationLowDescription =>
      'דורש כתובת אימייל מאומתת.';

  @override
  String get guildSettingsVerificationMedium => 'בינוני';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'דורש כתובת אימייל מאומתת וחשבון שגילו 5 דקות לפחות.';

  @override
  String get guildSettingsVerificationHigh => 'גבוהה';

  @override
  String get guildSettingsVerificationHighDescription =>
      'דורש את כל מה שקיים בבינוני, בתוספת חברות בקהילה למשך 10 דקות לפחות.';

  @override
  String get guildSettingsVerificationHighest => 'גבוה מאוד';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'דורש מספר טלפון מאומת.';

  @override
  String get guildSettingsAuditLogDescription =>
      'מעקב אחר פעולות מנהלים ברחבי הקהילה.';

  @override
  String get guildSettingsAuditLogEmpty => 'אין יומנים עדיין';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'פעולות ניהול ושינויים בקהילה יופיעו כאן.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'כל המשתמשים';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'כל הפעולות';

  @override
  String get guildSettingsAuditLogNoReason => 'לא ניתנה סיבה.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'משתמש לא ידוע';

  @override
  String get guildSettingsAuditLogLoadError =>
      'משהו השתבש בזמן טעינת יומן הפעילות.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'לא ניתן לטעון את יומני הפעילות';

  @override
  String get guildSettingsAuditLogReason => 'סיבה';

  @override
  String get guildSettingsAuditLogSomeone => 'מישהו';

  @override
  String get guildSettingsAuditLogSomething => 'משהו';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'ישות לא ידועה';

  @override
  String get guildSettingsAuditLogNothing => 'אין';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'יעד לא ידוע';

  @override
  String get auditLogActionGuildUpdate => 'הקהילה עודכנה';

  @override
  String get auditLogActionChannelCreate => 'ערוץ נוצר';

  @override
  String get auditLogActionChannelUpdate => 'הערוץ עודכן';

  @override
  String get auditLogActionChannelDelete => 'הערוץ נמחק';

  @override
  String get auditLogActionChannelOverwriteCreate => 'הרשאת ערוץ נוספה';

  @override
  String get auditLogActionChannelOverwriteUpdate => 'הרשאת ערוץ עודכנה';

  @override
  String get auditLogActionChannelOverwriteDelete => 'הרשאת ערוץ בוטלה';

  @override
  String get auditLogActionMemberKick => 'חבר/ה הוצא/ה';

  @override
  String get auditLogActionMemberPrune => 'חברים הוסרו';

  @override
  String get auditLogActionMemberBanAdd => 'חבר נחסם';

  @override
  String get auditLogActionMemberBanRemove => 'המשתמש הוסר מהחסימה';

  @override
  String get auditLogActionMemberUpdate => 'חבר/ה עודכן/עדכנה';

  @override
  String get auditLogActionMemberRoleUpdate => 'תפקידי חברים עודכנו';

  @override
  String get auditLogActionMemberMove => 'חבר הועבר';

  @override
  String get auditLogActionMemberDisconnect => 'חבר התנתק';

  @override
  String get auditLogActionBotAdd => 'הבוט נוסף';

  @override
  String get auditLogActionRoleCreate => 'תפקיד נוצר';

  @override
  String get auditLogActionRoleUpdate => 'התפקיד עודכן';

  @override
  String get auditLogActionRoleDelete => 'תפקיד נמחק';

  @override
  String get auditLogActionInviteCreate => 'הזמנה נוצרה';

  @override
  String get auditLogActionInviteUpdate => 'ההזמנה עודכנה';

  @override
  String get auditLogActionInviteDelete => 'ההזמנה נמחקה';

  @override
  String get auditLogActionWebhookCreate => 'Webhook נוצר';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook עודכן';

  @override
  String get auditLogActionWebhookDelete => 'Webhook נמחק';

  @override
  String get auditLogActionEmojiCreate => 'אמוג\'י נוצר';

  @override
  String get auditLogActionEmojiUpdate => 'האימוג\'י עודכן';

  @override
  String get auditLogActionEmojiDelete => 'אמוג\'י נמחק';

  @override
  String get auditLogActionStickerCreate => 'מדבקה נוצרה';

  @override
  String get auditLogActionStickerUpdate => 'המדבקה עודכנה';

  @override
  String get auditLogActionStickerDelete => 'סטיקר נמחק';

  @override
  String get auditLogActionMessageDelete => 'ההודעה נמחקה';

  @override
  String get auditLogActionMessageBulkDelete => 'הודעות נמחקו';

  @override
  String get auditLogActionMessagePin => 'הודעה הוצמדה';

  @override
  String get auditLogActionMessageUnpin => 'הצמדת ההודעה בוטלה';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor עדכן את הגדרות הקהילה.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor יצר את הערוץ $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor עדכן את הערוץ $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor מחק את הערוץ $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor הוסיף הרשאות ערוץ עבור $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor הוסיף הרשאות ערוץ עבור $target ב-$channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor עדכן הרשאות ערוץ עבור $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor עדכן הרשאות ערוץ עבור $target ב-$channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor הסיר הרשאות ערוץ עבור $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor הסיר הרשאות ערוץ עבור $target ב-$channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor הקיש את $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor חסם את $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor ביטל את חסימתו של $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor עדכן את $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor עדכן תפקידים עבור $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor הסיר/ה חברים לא פעילים.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor הסיר חברים לא פעילים למשך $days ימים.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor העביר את $target לערוץ קולי אחר.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor העביר את $target אל $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor ניתק את $target מהשיחה.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor הוסיף את הבוט $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor יצר את התפקיד $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor עדכן את התפקיד $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor מחק את התפקיד $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor יצר את ההזמנה $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor יצר את ההזמנה $target עבור $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor עדכן את ההזמנה $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor עדכן את ההזמנה $target עבור $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor מחק את ההזמנה $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor מחק את ההזמנה $target עבור $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor יצר את ה-webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor עדכן את הווּקְהוּק $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor מחק את ה-webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor הוסיף את האימוג\'י $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor עדכן את האימוג\'י $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor מחק את האימוג\'י $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor הוסיף את המדבקה $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor עדכן את המדבקה $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor מחק את המדבקה $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor מחק הודעה.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor מחק הודעה ב-$channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor מחק מספר הודעות.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor מחק $count הודעות.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor מחק מספר הודעות ב-$channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor מחק/ה $count הודעות ב-$channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor סימן הודעה.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor סימן הודעה ב-$channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor הסיר סיכה מהודעה.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor הסיר סיכה להודעה ב-$channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor ביצע פעולת ביקורת על $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'עודכן השדה $field מ-$oldValue ל-$newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'שינוי $field ל- $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'ניקיתי את השדה $field (היה $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'עודכן $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'שינוי שם הקהילה ל-$name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'עדכן/עדכנה את אייקון הקהילה.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'שינה את שם הערוץ ל-$name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'הנושא נוקה.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'עדכנתי את הנושא ל-$topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'הפעלת תוכן למבוגרים.';

  @override
  String get auditLogChangeDisabledMatureContent => 'תוכן למבוגרים הושבת.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'שינוי הכינוי ל-$nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'הוסר הכינוי $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'השתיקנו את החבר.';

  @override
  String get auditLogChangeUnmutedMember => 'הסרנו את ההשתקה מהחבר.';

  @override
  String get auditLogChangeDeafenedMember => 'הוא השתק את המשתמש.';

  @override
  String get auditLogChangeUndeafenedMember => 'הסרת השתקת המשתמש.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'הוספתי את $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'הוסרו $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'ערוץ: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'ההודעה: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'הוזמן/ה על ידי $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# הודעות נמחקו.',
      one: 'הודעה אחת נמחקה.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'הוסרו # חברים.',
      one: 'הוסר חבר אחד.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'ההזמנה הזו לעולם לא תפוג.';

  @override
  String get auditLogOptionTemporaryMembership => 'מעניק חברות זמנית.';

  @override
  String get auditLogOptionPermanentMembership => 'מעניק חברות קבועה.';

  @override
  String get guildSettingsLoadMore => 'טען עוד';

  @override
  String get guildSettingsLoadingMore => 'טוען...';

  @override
  String get guildSettingsWebhooksDescription =>
      'הצגה וניהול של כל ה־Webhooks שהוגדרו בקהילה שלך.';

  @override
  String get guildSettingsWebhooksEmpty => 'אין Webhooks';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'בקהילה הזו עדיין אין Webhooks. עבור אל $channelSettingsPath כדי ליצור אחד.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'כדי להציג ולערוך ווּבְּהוּקים (webhooks) עבור קהילה זו, נדרשת לך ההרשאה \"$permission\".';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'טעינת ה־Webhooks נכשלה';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'אירעה שגיאה בטעינת ה־Webhooks. יש לנסות שוב.';

  @override
  String get guildSettingsWebhooksUpdated => 'וובהוקים עודכנו';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'העדכון של הוובהוקים נכשל';

  @override
  String get guildSettingsUnknownChannel => 'ערוץ לא ידוע';

  @override
  String get guildSettingsCopyUrl => 'העתק כתובת URL';

  @override
  String get guildSettingsCopiedUrl => 'הקישור הועתק ללוח הגזירים';

  @override
  String get guildSettingsDeleteWebhook => 'מחיקת ווב-הוק';

  @override
  String get guildSettingsVanityUrlDescription =>
      'הגדר קישור הזמנה מותאם אישית לשרת שלך.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'שמירה';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'שימוש';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count שימושים';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'הצג את הקהילה שלך ב\'גילוי\' כדי שאחרים יוכלו למצוא אותה ולהצטרף אליה.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'אין מספיק חברים';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'הקהילה שלך צריכה לפחות $count חברים לפני שניתן יהיה לרשום אותה ב-Discovery.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'סטטוס:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'בהמתנה';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'אושר';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'נדחו';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'הוסר';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'סיבה: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'הקהילה שלך מופיעה ב\'גילוי\'. ניתן לעדכן את פרטי הרישום למטה או לבטל את הרישום כדי להסיר אותה.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'הבקשה שלך ממתינה לבדיקה. עדיין באפשרותך לעדכן את פרטי הרישום או לבטל את הבקשה.';

  @override
  String get guildSettingsDiscoveryCategory => 'קטגוריה';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'בחרו את הקטגוריה המתאימה ביותר לקהילה שלכם. תוכלו לשנות זאת בכל עת.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'שפה ראשית';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'השפה שרוב הקהילה שלך דוברת. משמש לסינון תוצאות גילוי.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'תיאור';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'תאר על מה הקהילה שלך';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'נדרש תיאור.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'התיאור חייב להיות באורך של לפחות $minLength תווים.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'התיאור חייב להיות באורך של עד $maxLength תווים.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'תגיות מותאמות אישית';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'עד $maxTags תגיות יעזרו לאנשים למצוא את הקהילה שלך. הן יופיעו בחיפוש ב-Discovery.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'הוסף תגית ולחץ על Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'הוספה';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'הסר תגית $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'לא ניתן היה להוסיף תגית';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'תגיות חייבות להיות באורך 2 עד $maxLength תווים, ולהכיל אותיות ומספרים בלבד.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'ניתן להוסיף עד $maxTags תגים בלבד.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'החל';

  @override
  String get guildSettingsDiscoverySave => 'שמירה';

  @override
  String get guildSettingsDiscoveryWithdraw => 'משיכה';

  @override
  String get guildSettingsDiscoveryApplicationSent => 'בקשת גילוי נשלחה';

  @override
  String get guildSettingsDiscoveryListingUpdated => 'רישום הגילויים עודכן';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn => 'בקשת גילוי נסיגה';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'לא ניתן לבטל את הבקשה';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'נסו שוב בעוד רגע.';

  @override
  String get guildSettingsMembersDescription => 'חפש ונהל חברי שרת.';

  @override
  String get guildSettingsMembersSearchHint => 'חיפוש לפי שם משתמש או מזהה';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count חברים';
  }

  @override
  String get guildMembersRecentTitle => 'חברים שנוספו לאחרונה';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'מציג $displayedCount מתוך $totalCount חברים בסך הכל';
  }

  @override
  String get guildMembersSort => 'מיין';

  @override
  String get guildSettingsMembersSortNewest => 'החדשים ביותר ראשונים';

  @override
  String get guildMembersSortOldest => 'הישנים קודם';

  @override
  String get guildMembersColumnName => 'שם';

  @override
  String get guildMembersColumnMemberSince => 'חבר/ה מ־';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'הצטרף/ה ל-$productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'שיטת הצטרפות';

  @override
  String get guildMembersColumnRoles => 'תפקידים';

  @override
  String get guildMembersColumnActions => 'פעולות';

  @override
  String get guildMembersFilterMemberSince => 'סינון לפי תאריך הצטרפות';

  @override
  String get guildMembersFilterJoinedProduct => 'סינון לפי תאריך יצירת החשבון';

  @override
  String get guildMembersFilterJoinMethod => 'סינון לפי שיטת הצטרפות';

  @override
  String get guildMembersFilterRoles => 'סינון לפי תפקידים';

  @override
  String get guildMembersFilterAll => 'הכל';

  @override
  String get guildMembersFilterPast1Hour => 'בשעה האחרונה';

  @override
  String get guildMembersFilterPast24Hours => 'ב-24 השעות האחרונות';

  @override
  String get guildMembersFilterPast7Days => 'ב-7 הימים האחרונים';

  @override
  String get guildMembersFilterPast2Weeks => 'השבועיים האחרונים';

  @override
  String get guildMembersFilterPast3Weeks => '3 השבועות האחרונים';

  @override
  String get guildMembersFilterPast4Weeks => 'ב-4 השבועות האחרונים';

  @override
  String get guildMembersFilterPast3Months => 'שלושת החודשים האחרונים';

  @override
  String get guildMembersFilterCustomRange => 'טווח מותאם אישית...';

  @override
  String get guildMembersDateRangeTitle => 'טווח תאריכים מותאם אישית';

  @override
  String get guildMembersDateAfter => 'אחרי תאריך';

  @override
  String get guildMembersDateBefore => 'לפני תאריך';

  @override
  String get guildMembersClearAll => 'נקה הכל';

  @override
  String get guildMembersRowsPerPage => 'שורות לעמוד';

  @override
  String get guildMembersEmptySearch => 'אף אחד לא תואם לחיפוש זה.';

  @override
  String get guildMembersLoadError =>
      'משהו השתבש בטעינת החברים. יש לנסות שוב מאוחר יותר.';

  @override
  String get guildMembersIndexing => 'מאנדקס חברים…';

  @override
  String get guildMembersGoToPage => 'עבור לדף';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'עבור לדף $page';
  }

  @override
  String get guildMembersJumpToPage => 'קפיצה לעמוד';

  @override
  String get guildMembersJoinSourceCreator => 'יוצר הקהילה';

  @override
  String get guildMembersJoinSourceInvite => 'הזמן';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'הזמנה ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'הוזמן/ה על ידי $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'כתובת URL מותאמת אישית';

  @override
  String get guildMembersJoinSourceBotInvite => 'הזמנת בוט';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'אדמין פלטפורמה';

  @override
  String get guildMembersJoinSourceDiscovery => 'גילוי';

  @override
  String get guildMembersJoinMethodUnknown => 'לא ידוע';

  @override
  String get guildMembersCommunityOwner => 'בעל קהילה';

  @override
  String get guildMembersViewAllRoles => 'הצגת כל התפקידים';

  @override
  String get guildMembersJoinedJustNow => 'זה עתה';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לפני $count דקות',
      one: 'לפני דקה אחת',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לפני $count שעות',
      one: 'לפני שעה אחת',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לפני $count ימים',
      one: 'לפני יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'חברים';

  @override
  String get guildMembersChannelListSelected => 'חברים, נבחרו';

  @override
  String get guildSettingsInvitesTitle => 'הזמנות';

  @override
  String get guildSettingsInvitesDescription =>
      'הצגת כל ההזמנות לקהילה זו. כדי ליצור הזמנה חדשה, עבור לערוץ והשתמש בלחצן ההזמנה.';

  @override
  String get guildSettingsInvitesEmpty => 'אין קישורי הזמנה';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'לקהילה הזו אין עדיין קישורי הזמנה. עבור/עברי לערוץ וצור/צרי הזמנה כדי להזמין אנשים.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'טעינת ההזמנות נכשלה';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'אירעה שגיאה בטעינת ההזמנות. יש לנסות שוב.';

  @override
  String get guildSettingsInvitesTryAgain => 'נסה שוב';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'הצג תאריך יצירה במקום תאריך תפוגה';

  @override
  String get guildSettingsInvitesPauseInvites => 'השהיית הזמנות';

  @override
  String get guildSettingsInvitesEnableInvites => 'הפעל הזמנות';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'השהיית הזמנות לקהילה זו';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'הפעלת הזמנות לקהילה זו';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'להשהות הזמנות? משתמשים חדשים לא יוכלו להצטרף דרך קישורי הזמנה עד שתפעילו אותם מחדש. חברים קיימים לא יושפעו.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'לאפשר הזמנות? משתמשים יוכלו להצטרף לקהילה הזו שוב דרך קישורי הזמנה.';

  @override
  String get guildSettingsInvitesPause => 'השהה';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'ההזמנות מושהות לקהילה זו.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'ההזמנות מושהות כי $productName זיהה פשיטה אפשרית. משתמשים חדשים לא יכולים להצטרף כרגע.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'מזמין:';

  @override
  String get guildSettingsInvitesLabelChannel => 'ערוץ:';

  @override
  String get guildSettingsInvitesLabelCode => 'קוד:';

  @override
  String get guildSettingsInvitesLabelUses => 'שימושים:';

  @override
  String get guildSettingsInvitesLabelCreated => 'נוצר:';

  @override
  String get guildSettingsInvitesLabelExpires => 'פג תוקף:';

  @override
  String get guildSettingsInvitesUnknown => 'לא ידוע';

  @override
  String get guildSettingsInvitesNoCategory => 'ללא קטגוריה';

  @override
  String get guildSettingsInvitesExpired => 'פג תוקף';

  @override
  String get guildSettingsInvitesNever => 'אף פעם';

  @override
  String get guildSettingsInvitesCopyLink => 'העתקת קישור להזמנה';

  @override
  String get guildSettingsInvitesRevoke => 'ביטול הזמנה';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => 'לא ניתן לבטל את ההזמנה';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'הקישור עדיין עשוי לפעול. נסה שוב בעוד רגע.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses שימושים';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'פג תוקף ב-$date';
  }

  @override
  String get guildSettingsBansDescription => 'הצגה וניהול של משתמשים חסומים.';

  @override
  String get guildSettingsBansSearchHint => 'חיפוש חסימות';

  @override
  String get guildSettingsBansEmpty => 'אין משתמשים חסומים.';

  @override
  String get guildSettingsBanPermanent => 'חסימה לצמיתות';

  @override
  String guildSettingsBanExpires(String date) {
    return 'פג תוקף ב- $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'תפוגה';

  @override
  String get guildSettingsUnban => 'בטל חסימה';

  @override
  String get guildSettingsBansLoading => 'טוען משתמשים חסומים';

  @override
  String get guildSettingsBansNoSearchResults =>
      'לא נמצאו חסימות התואמות את החיפוש שלך.';

  @override
  String get guildSettingsBanDetailsTitle => 'פרטי חסימה';

  @override
  String get guildSettingsBanViewDetails => 'הצגת פרטים';

  @override
  String get guildSettingsBannedOn => 'נחסם ב-';

  @override
  String get guildSettingsBannedBy => 'נחסם על ידי';

  @override
  String get guildSettingsRevokeBanTitle => 'בטל חסימה';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'האם אתה בטוח שברצונך לבטל את החסימה של $displayName? הם יוכלו להצטרף מחדש לקהילה.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'ביטלה את החסימה עבור $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'לא ניתן היה לטעון את ההרחקות. נסה שוב.';

  @override
  String get guildSettingsRevokeBanError =>
      'לא ניתן היה לבטל את החסימה. נסה שוב.';

  @override
  String get guildSettingsCommunitySettings => 'הגדרות קהילה';

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
      'נהל את הפרופיל, הערוצים וההגדרות המוגדרות כברירת מחדל של הקהילה שלך.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'מיתוג';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'עדכן את הסמל, השם, הבאנר ורקע ההזמנה שלך';

  @override
  String get guildSettingsOverviewBannerUpload => 'העלאת באנר';

  @override
  String get guildSettingsOverviewIdleTitle => 'הגדרות מצב לא פעיל';

  @override
  String get guildSettingsOverviewIdleDescription => 'הגדר ערוץ AFK וזמן קצוב';

  @override
  String get guildSettingsOverviewSystemTitle => 'מערכת וקבלת פנים';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'בחר יעד להודעות מערכת וברכה';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'התראות ברירת מחדל';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'קהילות עם יותר מ-250 אנשים מוגדרות אוטומטית למצב \"רק אזכורים\". ההגדרה המקורית שלך נשמרת ותשוחזר אם הקהילה תרד מתחת ל-250 חברים.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'מתקדם';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'אפשר שמות גמישים לערוצי טקסט';

  @override
  String get guildSettingsOverviewHideOwnerCrown => 'הסתר את כתר בעל הקהילה';

  @override
  String get guildSettingsOverviewDetachedBanner => 'באנר מנותק';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'מציג את הבאנר במקטע משלו מתחת לכותרת הקהילה.';

  @override
  String get guildSettingsOverviewUploadIcon => 'העלאת אייקון';

  @override
  String get guildSettingsOverviewRemoveImage => 'הסר';

  @override
  String get guildSettingsOverviewSplashTitle => 'רקע להזמנה';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'רקע הטמעת צ\'אט';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'מוצג בהטמעות הזמנה בצ\'אט.';

  @override
  String get guildSettingsOverviewUploadBackground => 'העלאת תמונת רקע';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'אין באנר לקהילה';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'אין תמונת רקע להזמנה';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'תצוגה מקדימה';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'כך נראית ההזמנה שלך למבקרים.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'שמות ערוצי טקסט';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'כתר בעל הקהילה';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'הגדר אם סמל הכתר יוצג לצד בעלי הקהילה';

  @override
  String get guildSettingsSplashCardAlignment => 'יישור כרטיס';

  @override
  String get guildSettingsSplashAlignmentCenter => 'מרכז';

  @override
  String get guildSettingsSplashAlignmentLeft => 'שמאל';

  @override
  String get guildSettingsSplashAlignmentRight => 'ימין';

  @override
  String get guildSettingsSplashAlignmentHint => 'חל רק על מסכים רחבים.';

  @override
  String get permissionReadMessageHistory => 'קריאת היסטוריית הודעות';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'שנה את מה שמשתמשים ללא \"$permission\" יכולים לראות';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'השתמש בחלון ייעודי כדי להגדיר תאריך סף להיסטוריית הודעות עבור חברים שאין להם את ההרשאה $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'סף פתיחת היסטוריית ההודעות';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'סף היסטוריית ההודעות';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'הפעל סף היסטוריית הודעות';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'תאריך סף';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'חברים ללא היסטוריית קריאת הודעות יכולים להציג הודעות שנשלחו לאחר תאריך זה.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'סף היסטוריית ההודעות עודכן';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'אפשר אותיות גדולות ורווחים בשמות ערוצי טקסט. כבוי מגביל שמות לאותיות קטנות עם מקפים וקווי תחתון.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'מסיר את סמל הכתר ליד הבעלים של הקהילה בכל המשטחים.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'אייקונים מונפשים דורשים את תכונת הקהילה \"אייקונים מונפשים\".';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'באנרים מונפשים דורשים את תכונת הקהילה \"באנר מונפש\".';

  @override
  String get guildSettingsAfkChannel => 'ערוץ AFK / לא פעיל';

  @override
  String get guildSettingsAfkChannelHint =>
      'העבר חברים לערוץ זה כשהם לא פעילים.';

  @override
  String get guildSettingsNoAfkChannel => 'אין ערוץ AFK';

  @override
  String get guildSettingsAfkTimeout => 'זמן קצוב לא פעיל';

  @override
  String get guildSettingsAfkTimeout1Min => 'דקה 1';

  @override
  String get guildSettingsAfkTimeout5Min => '5 דקות';

  @override
  String get guildSettingsAfkTimeout15Min => '15 דקות';

  @override
  String get guildSettingsAfkTimeout30Min => '30 דקות';

  @override
  String get guildSettingsAfkTimeout1Hour => 'שעה אחת';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds שניות';
  }

  @override
  String get guildSettingsSystemChannel => 'ערוץ יעד';

  @override
  String get guildSettingsSystemChannelHint =>
      'הודעות קבלת פנים ומערכת יופיעו כאן.';

  @override
  String get guildSettingsNoSystemChannel => 'אין ערוץ מערכת';

  @override
  String get guildSettingsHideJoinMessages => 'הסתרת הודעות הצטרפות';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'מסיר הודעות הצטרפות מהערוץ הנבחר.';

  @override
  String get guildSettingsDefaultNotifications => 'הגדרות ברירת מחדל להתראות';

  @override
  String get guildSettingsNotificationsAll => 'כל ההודעות';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'שלח התראות על כל ההודעות';

  @override
  String get guildSettingsNotificationsMentions => 'אזכורים בלבד';

  @override
  String get guildSettingsNotificationsMentionsDescription => 'הודע רק בהזכרות';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. מקסימום 10MB. מינימום: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. מקסימום 10MB. מינימום: 960×540px (יחס 16:9). מוצג בהזמנות בצ\'אט.';

  @override
  String get guildSettingsModerationDescription =>
      'הגדר אימות, סינון תוכן והגדרות תוכן למבוגרים.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'לקהילות שמופיעות ברשימת הגילוי יש אפשרויות ניהול מוגבלות.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'סינון תוכן';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'סינון אוטומטי של הודעות עם תוכן בוטה בערוצים שלא סומנו כבעלי תוכן למבוגרים.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'קהילות המופיעות ב\'גילוי\' נדרשות לסרוק את כל החברים. לא ניתן לשנות הגדרה זו כל עוד \'גילוי\' מופעל.';

  @override
  String get guildSettingsContentFilterOff => 'כבוי';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'אפשר לקהילה לנהל את עצמה';

  @override
  String get guildSettingsContentFilterNoRole => 'סינון חברים ללא תפקידים';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'מומלץ לרוב הקהילות';

  @override
  String get guildSettingsContentFilterAll => 'סינון כולם';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'הגנה מרבית למרחבים ידידותיים למשפחה';

  @override
  String get guildSettingsModerationMatureOff => 'כבוי';

  @override
  String get guildSettingsModerationMatureOn => 'מופעל';

  @override
  String get guildSettingsContentWarningToggle => 'הצגת אזהרת תוכן';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'מפעיל הנחיה להסכמה לפני הכניסה לכל ערוץ.';

  @override
  String get guildSettingsContentWarningText => 'טקסט אזהרה מותאם אישית';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'הודעה זו מכילה תוכן רגיש.';

  @override
  String get guildSettingsModeration2faTitle => 'דרישת אימות דו-שלבי';

  @override
  String get guildSettingsModeration2faDescription =>
      'דרוש אימות דו-שלבי למנהלים לפני שהם יכולים להשעות, לגרש, להגביל זמנית או למחוק הודעות.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'דרוש אימות דו-שלבי לפעולות ניהול';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'רק בעל הקהילה יכול לשנות הגדרה זו';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'יש להפעיל אימות דו-שלבי בחשבונך כדי לשנות הגדרה זו';

  @override
  String get guildSettingsEmojiSearchHint => 'חיפוש אימוג\'י';

  @override
  String get guildSettingsEmojiUploadTitle => 'העלאת אימוג\'י';

  @override
  String get guildSettingsEmojiSlotsTitle => 'מקומות לאמוג\'י';

  @override
  String get guildSettingsEmojiDropZone => 'גרור ושחרר קובצי אימוג\'י לכאן';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'טעינת האימוג\'י נכשלה. נסו שוב מאוחר יותר.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'לא נמצאו אימוג\'ים התואמים לחיפוש שלך.';

  @override
  String get guildSettingsEmojiNoSlots => 'אין מקום לאמוג\'י';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'הגעת למספר המרבי של אימוג\'י. מחק אימוג\'י קיימים כדי לפנות מקום.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'שמות אימוג\'י צריכים לכלול לפחות 2 תווים ויכולים להשתמש באותיות, מספרים וקו תחתון. גודל האימוג\'י לא יעלה על $maxSize. תמונות סטטיות יוקטנו לגודל של 128x128 פיקסלים ויידחסו באופן אוטומטי. אימוג\'ים מונפשים וקבצי SVG צריכים להתאים כבר למגבלה.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'מעלה אימוג\'יז';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# אימוג\'ים',
      one: '# אימוג\'י',
    );
    return 'מעלה $_temp0. זה עשוי לקחת קצת זמן.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'העלאת האימוג\'י נכשלה. יש לנסות שוב.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'לא ניתן היה להוסיף חלק מהאימוג\'י';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'יש לבדוק את הקבצים האלה ולנסות שוב עם תמונות קטנות או פשוטות יותר.';

  @override
  String get guildSettingsEmojiRenameTitle => 'שנה שם אימוג\'י';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 תווים, אותיות, מספרים, קווים תחתונים.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'אימוג\'י';

  @override
  String get guildSettingsEmojiColumnName => 'שם';

  @override
  String get guildSettingsEmojiColumnUploader => 'הועלה על ידי';

  @override
  String get guildSettingsEmojiUnknownUploader => 'לא ידוע';

  @override
  String get guildSettingsEmojiDeleteTitle => 'מחיקת אימוג\'י';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'למחוק את :$name:? לא ניתן לבטל.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel => 'מחק אימוג\'י זה מהאחסון ומה-CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'שם האימוג\'י חייב להיות באורך 2 תווים לפחות';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'שם האימוג\'י יכול להכיל עד 32 תווים';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'שם אימוג\'י לא חוקי';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'לא ניתן היה לשנות את שם האימוג\'י הזה';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'השם שוחזר למה שהיה קודם. יש לנסות שוב בעוד רגע.';

  @override
  String get guildSettingsEmojiGoneTitle => 'האימוג\'י הזה כבר לא קיים';

  @override
  String get guildSettingsEmojiGoneBody =>
      'ייתכן שהוא נמחק. השם שוחזר למצבו הקודם.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'אינך יכול/ה לשנות את שם האימוג\'י הזה';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'אין לך הרשאה לשנות את שם האימוג\'י הזה. השם שוחזר לשם הקודם.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'אתה מהיר מדי';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'יש להמתין רגע ולנסות לשנות את השם שוב.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'לא ניתן למחוק את האימוג\'י הזה';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'אינך יכול/ה למחוק את האימוג\'י הזה';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'אפשר לאחרים לשכפל את האימוג\'י שלך';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'כאשר מופעל, חברים מקהילות אחרות יכולים להשתמש בקיצור הדרך \"שכפול\" בלחיצה אחת בתוך האפליקציה על האימוג\'י המותאמים אישית שלך. זה לא מונע מהם לשמור את התמונה ולהעלות אותה בעצמם.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'אפשר לאחרים לשכפל את המדבקות שלך';

  @override
  String get guildSettingsCloneStickerDescription =>
      'כאשר מופעל, חברים מקהילות אחרות יכולים להשתמש בקיצור הדרך \"שכפול\" בלחיצה אחת בתוך האפליקציה על המדבקות המותאמות אישית שלך. זה לא מונע מהם לשמור את התמונה ולהעלות אותה בעצמם.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'רק חברים עם ההרשאה \"$permission\" יכולים לשנות זאת.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'לא ניתן לעדכן את שיבוט האימוג\'י';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'לא ניתן לעדכן את שיבוט המדבקות';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'אימוג\'י שאינם מונפשים ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'אימוג\'י מונפש ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'חיפוש מדבקות';

  @override
  String get guildSettingsStickerSlotsTitle => 'מקומות למדבקות';

  @override
  String get guildSettingsStickerUploadTitle => 'העלאת מדבקה';

  @override
  String get guildSettingsStickerDropZone =>
      'גרור ושחרר קובץ מדבקה לכאן (אחד בכל פעם)';

  @override
  String get guildSettingsStickerDensity => 'צפיפות מדבקות';

  @override
  String get guildSettingsStickerDensityCozy => 'נעים';

  @override
  String get guildSettingsStickerDensityCompact => 'קומפקטי';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'טעינת המדבקות נכשלה';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'אירעה שגיאה בטעינת המדבקות. יש לנסות שוב.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'לא נמצאו מדבקות התואמות לחיפוש שלך.';

  @override
  String get guildSettingsStickersEmptySearch => 'לא נמצאו מדבקות';

  @override
  String get guildSettingsStickerNoSlots => 'אין מקומות פנויים למדבקות';

  @override
  String get guildSettingsStickerSlotsFull =>
      'הגעת למספר המרבי של מדבקות. מחק מדבקות קיימות כדי לפנות מקום.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'מדבקות נשמרות ברזולוציה של 320x320 פיקסלים וצריכות להיות קטנות מ-$maxSize. תמונות סטטיות יוקטנו ויידחסו באופן אוטומטי. מדבקות מונפשות וקבצי SVG צריכים להתאים כבר למגבלה.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => 'קובץ מדבקה לא נתמך';

  @override
  String get guildSettingsStickerAddTitle => 'הוספת מדבקה';

  @override
  String get guildSettingsStickerEditTitle => 'עריכת מדבקה';

  @override
  String get guildSettingsStickerNameLabel => 'שם';

  @override
  String get guildSettingsStickerNameHint => 'המדבקה המהממת שלי';

  @override
  String get guildSettingsStickerDescriptionLabel => 'תיאור';

  @override
  String get guildSettingsStickerDescriptionHint => 'תאר/י את המדבקה';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'תגיות ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'הוספת תגית';

  @override
  String get guildSettingsStickerTagAdd => 'הוספה';

  @override
  String get guildSettingsStickerNameRequired => 'שם הוא שדה חובה';

  @override
  String get guildSettingsStickerNameTooShort => 'השם חייב להכיל לפחות 2 תווים';

  @override
  String get guildSettingsStickerNameTooLong =>
      'השם חייב להיות בן 30 תווים או פחות';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'התיאור חייב להיות בן 500 תווים או פחות';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'לא ניתן ליצור את המדבקה הזו';

  @override
  String get guildSettingsStickerTooLargeTitle => 'המדבקה גדולה מדי';

  @override
  String get guildSettingsStickerCompressFailedTitle => 'המדבקה לא נדחסה מספיק';

  @override
  String get guildSettingsStickerDeleteTitle => 'מחיקת מדבקה';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'למחוק את \"$name\"? לא ניתן לבטל.';
  }

  @override
  String get guildSettingsStickerPurgeLabel => 'מחק מדבקה זו מהאחסון ומה-CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'לא ניתן היה למחוק את המדבקה הזו';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'אינך יכול למחוק את המדבקה הזו';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'כדי ליצור webhook, פתח את $channelSettingsPath. עדיין ניתן לערוך ולארגן את כל ה-webhooks הקיימים כאן.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'כתובת ה-URL המותאמת אישית שלך לא תעבוד אלא אם כן ערוץ אחד לפחות גלוי לכולם.';

  @override
  String get guildSettingsVanityUrlRemove => 'הסר';

  @override
  String get guildSettingsBannedUsersTitle => 'משתמשים חסומים';

  @override
  String get guildSettingsInvitesTableInviter => 'מזמין';

  @override
  String get guildSettingsInvitesTableChannel => 'ערוץ';

  @override
  String get guildSettingsInvitesTableCode => 'קוד';

  @override
  String get guildSettingsInvitesTableUses => 'משתמש ב-';

  @override
  String get guildSettingsInvitesTableCreated => 'נוצר';

  @override
  String get guildSettingsInvitesTableExpires => 'תפוגה';

  @override
  String get guildSettingsAuditLogFilterUser => 'סינון לפי משתמש';

  @override
  String get guildSettingsAuditLogFilterAction => 'סינון לפי פעולה';

  @override
  String get createDm => 'יצירת הודעה פרטית';

  @override
  String get createGroupDm => 'יצירת צ\'אט קבוצתי';

  @override
  String get createDmNewMessage => 'הודעה חדשה';

  @override
  String get createDmSelectFriends => 'בחירת חברים';

  @override
  String get createDmChooseFriendsSubtitle => 'בחרו חברים לשלוח להם הודעה.';

  @override
  String get createDmSearchFriends => 'חיפוש חברים';

  @override
  String get createDmNoFriendsFound => 'לא נמצאו חברים';

  @override
  String get createDmNoFriendsYet => 'אין לך חברים עדיין';

  @override
  String get createDmClaimToStartDms =>
      'תבעו את החשבון שלכם כדי להתחיל הודעות פרטיות.';

  @override
  String get createDmVerifyToStartDms =>
      'יש לאמת את כתובת האימייל שלך כדי להתחיל בצ\'אטים פרטיים.';

  @override
  String get createDmVerifyYourEmail => 'אמתו את כתובת האימייל שלכם';

  @override
  String get createDmNewGroup => 'קבוצה חדשה';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'צור קבוצה חדשה עם $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'אישור קבוצה חדשה';

  @override
  String get createDmCreateNewGroup => 'יצירת קבוצה חדשה';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'הסר את $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'כבר יש לך קבוצה עם המשתמשים האלה. האם ברצונך ליצור קבוצה חדשה? גם זה בסדר!';

  @override
  String get createDmNoActivityYet => 'אין עדיין פעילות';

  @override
  String get createDmSomeUsersCantBeAdded => 'לא ניתן להוסיף חלק מהמשתמשים';

  @override
  String get createDmCreateWithoutThem => 'ליצור בלעדיהם';

  @override
  String get createDmUnaddableIntro =>
      'לא ניתן להוסיף את האנשים הבאים לצ׳אט הקבוצתי הזה:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'צור את ההודעה הקבוצתית עם יתרת $count הנמענים ודלג על האחרים?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'אין נמענים שנותרו כדי ליצור איתם קבוצת צ\'אט.';

  @override
  String get createDmUnaddableUserNotFound => 'משתמש לא נמצא';

  @override
  String get createDmUnaddableBlocked =>
      'אינך יכול/ה לשלוח הודעה למשתמש/ת זה/זו';

  @override
  String get createDmUnaddableNotFriends => 'לא ברשימת החברים שלך';

  @override
  String get createDmUnaddableGroupDisabled =>
      'לא מאפשר/ת הוספה לצ\'אטים קבוצתיים';

  @override
  String get createDmFailed => 'לא ניתן היה ליצור את השיחה. נסה שוב.';

  @override
  String get dmListMessagesTitle => 'הודעות';

  @override
  String get dmListDirectMessagesTitle => 'הודעות ישירות';

  @override
  String get keybindsSearchShortcuts => 'חיפוש קיצורי דרך';

  @override
  String get keybindSectionDefaults => 'ברירות מחדל';

  @override
  String get keybindSectionMessages => 'הודעות';

  @override
  String get keybindSectionNavigation => 'ניווט';

  @override
  String get keybindSectionDragAndDrop => 'גרור ושחרר';

  @override
  String get keybindSectionChat => 'צ\'אט';

  @override
  String get keybindSectionVoiceAndVideo => 'קול ווידאו';

  @override
  String get keybindSectionMisc => 'שונות';

  @override
  String get keybindActionShowShortcutsList => 'הצגת רשימת קיצורי המקשים';

  @override
  String get keybindActionCopyText => 'העתק טקסט';

  @override
  String get keybindActionMarkUnread => 'סמן כבלתי נקרא';

  @override
  String get keybindActionFocusTextarea => 'מיקוד שדה טקסט';

  @override
  String get keybindActionSwitchCommunities => 'החלפה בין קהילות';

  @override
  String get keybindActionSwitchChannels => 'החלפה בין ערוצים';

  @override
  String get keybindActionHistoryBack => 'מעבר אחורה בהיסטוריית הערוצים שנצפו';

  @override
  String get keybindActionHistoryForward =>
      'מעבר קדימה בהיסטוריית הערוצים שנצפו';

  @override
  String get keybindActionJumpUnreadChannels => 'דילוג בין ערוצים שלא נקראו';

  @override
  String get keybindActionJumpMentionChannels =>
      'קפיצה בין ערוצים שלא נקראו עם אזכורים';

  @override
  String get keybindActionJumpCurrentCall => 'קפיצה לשיחה הנוכחית';

  @override
  String get keybindActionToggleLastGuildDms =>
      'החלפה בין הקהילה האחרונה לצ\'אטים פרטיים';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'החלפה לקהילה או לצ\'אטים פרטיים קודמים';

  @override
  String get keybindActionNextCommunityOrDms =>
      'עבור לקהילה הבאה או לצ\'אטים פרטיים';

  @override
  String get keybindActionGoToDms => 'עבור להודעות פרטיות';

  @override
  String get keybindActionGoToFirstCommunity => 'עבור לקהילה הראשונה';

  @override
  String get keybindActionGoToSecondCommunity => 'עבור לקהילה השנייה';

  @override
  String get keybindActionGoToThirdCommunity => 'עבור לקהילה השלישית';

  @override
  String get keybindActionGoToFourthCommunity => 'עבור לקהילה הרביעית';

  @override
  String get keybindActionGoToFifthCommunity => 'עבור לקהילה החמישית';

  @override
  String get keybindActionGoToSixthCommunity => 'עבור לקהילה השישית';

  @override
  String get keybindActionGoToSeventhCommunity => 'עבור לקהילה השביעית';

  @override
  String get keybindActionGoToEighthCommunity => 'עבור לקהילה השמינית';

  @override
  String get keybindActionToggleQuickSwitcher => 'החלף מחליף מהיר';

  @override
  String get keybindActionCreateOrJoinCommunity => 'יצירה או הצטרפות לקהילה';

  @override
  String get keybindActionStartDragAndDrop => 'התחלת גרירה ושחרור';

  @override
  String get keybindActionMove => 'העברה';

  @override
  String get keybindActionDropItem => 'שחרר פריט';

  @override
  String get keybindActionCancel => 'ביטול';

  @override
  String get keybindActionMarkCommunityRead => 'סמן קהילה כנקראה';

  @override
  String get keybindActionMarkChannelRead => 'סמן ערוץ כנקרא';

  @override
  String get keybindActionStartGroupDm => 'התחלת צ\'אט קבוצתי';

  @override
  String get keybindActionTogglePinnedMessages => 'החלף הצמדת הודעות';

  @override
  String get keybindActionToggleInbox => 'החלף מצב תיבת דואר נכנס';

  @override
  String get keybindActionMarkTopInboxRead =>
      'סימון הערוץ העליון בתיבת הדואר הנכנס כנקרא';

  @override
  String get keybindActionMarkAllInboxRead =>
      'סמן את כל הערוצים בתיבת הדואר הנכנס כנקראו';

  @override
  String get keybindActionToggleMemberList =>
      'החלף בין רשימת החברים לבין הצ\'אט הקולי';

  @override
  String get keybindActionToggleEmojiPicker => 'הצגת/הסתרת בורר האימוג\'י';

  @override
  String get keybindActionToggleGifPicker => 'החלף/י מציג GIF';

  @override
  String get keybindActionToggleStickerPicker => 'החלף/י מציג מדבקות';

  @override
  String get keybindActionScrollChatUp => 'גלול את הצ\'אט למעלה';

  @override
  String get keybindActionScrollChatDown => 'גלול את הצ\'אט למטה';

  @override
  String get keybindActionJumpOldestUnread =>
      'קפיצה להודעה הישנה ביותר שלא נקראה';

  @override
  String get keybindActionFocusComposer => 'מיקוד שדה הטקסט';

  @override
  String get keybindActionUploadFile => 'העלאת קובץ';

  @override
  String get keybindActionCopyChannelLink => 'העתקת קישור לערוץ';

  @override
  String get keybindActionToggleSavedMedia => 'החלף מצב מדיה שמורה';

  @override
  String get keybindActionSendVoiceMessage => 'שלח הודעה קולית';

  @override
  String get keybindActionAnswerCall => 'לענות לשיחה הנכנסת';

  @override
  String get keybindActionDeclineCall => 'דחה את השיחה הנכנסת';

  @override
  String get keybindActionStartDmCall => 'התחילו שיחה בצ\'אט אישי או קבוצתי';

  @override
  String get keybindActionToggleSoundboard => 'החלף מצב סאונדבורד';

  @override
  String get keybindActionToggleCompactCallView =>
      'הרחבה או כיווץ של תצוגת שיחה מקוצרת';

  @override
  String get keybindActionPushToTalkPriority => 'דיבור בלחיצה (עדיפות)';

  @override
  String get keybindActionVoiceActivityPriority => 'עדיפות לפעילות קולית';

  @override
  String get keybindActionOpenHelp => 'פתח עזרה';

  @override
  String get keybindActionSearchMessages => 'חיפוש הודעות';

  @override
  String get keybindActionOpenContextMenu => 'פתח את תפריט ההקשר';

  @override
  String get keybindActionOpenSettings => 'פתח/פתחי את ההגדרות שלך';

  @override
  String get keybindActionOpenThemeStudio => 'פתיחת סטודיו העיצוב בחלון קופץ';

  @override
  String get keybindActionZoomIn => 'התקרבות';

  @override
  String get keybindActionZoomOut => 'הקטן תצוגה';

  @override
  String get keybindActionZoomReset => 'איפוס זום';

  @override
  String get clipboardPasteFailed =>
      'לא ניתן היה להדביק. הלוח היה ריק או חסום עבור אפליקציה זו.';

  @override
  String get homeQuickActionDms => 'הודעות ישירות';
}
