// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class FluxerLocalizationsSr extends FluxerLocalizations {
  FluxerLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get reconnectingTitle => 'Nešto smo zeznuli!';

  @override
  String get reconnectingBody =>
      'Nešto nije u redu sa serverima.\nTrebalo bi da se reši za trenutak!';

  @override
  String get gatewayReconnectingToast => 'Povezivanje…';

  @override
  String get gatewayConnectedToast => 'Povezano';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Pokretanje nije uspelo: $error';
  }

  @override
  String get retry => 'Pokušaj ponovo';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Veza je izgubljena';

  @override
  String get splashViewOnStatusPage => 'Pogledajte na stranici sa statusom';

  @override
  String get splashConnectionIssuesPrompt => 'Problemi sa vezom?';

  @override
  String get splashStatusPageLink => 'Stranica sa statusom';

  @override
  String get splashReadIncident => 'Pročitajte incident';

  @override
  String get splashIncidentHistory => 'Istorija incidenata';

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
  String get welcomeBack => 'Dobrodošli nazad';

  @override
  String get email => 'Imеjl';

  @override
  String get emailInvalid => 'Molimo unesite validnu imejl adresu.';

  @override
  String get password => 'Lozinka';

  @override
  String get forgotPassword => 'Zaboravili ste lozinku?';

  @override
  String get logIn => 'Prijavi se';

  @override
  String get logInWithPasskey => 'Prijavi se pomoću ključa za pristup';

  @override
  String continueWithSso(String provider) {
    return 'Nastavi sa $provider';
  }

  @override
  String get ssoRequired => 'Za pristup ovoj instanci potreban je SSO.';

  @override
  String get organizationSsoProvider =>
      'Prijavite se pomoću provajdera za jedinstveno prijavljivanje vaše organizacije.';

  @override
  String get failedToStartSso => 'Pokretanje SSO-a nije uspelo';

  @override
  String get ssoCancelled => 'SSO prijavljivanje je otkazano';

  @override
  String preferSso(String provider) {
    return 'Više volite da koristite SSO? Nastavite sa $provider.';
  }

  @override
  String get logInViaBrowser => 'Prijavi se preko pretraživača';

  @override
  String get needAccountPrompt => 'Nemate nalog? ';

  @override
  String get register => 'Registruj se';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Proverite da li ste čovek';

  @override
  String get captchaDescription =>
      'Moramo da se uverimo da niste bot. Molimo vas da završite verifikaciju ispod.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Imate problema? Pokušajte umesto toga hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Pokušajte umesto toga Turnstile';

  @override
  String get cancel => 'Otkaži';

  @override
  String get ipAuthCheckEmail => 'Proverite svoj imejl';

  @override
  String ipAuthDescription(String email) {
    return 'Poslali smo imejl sa linkom za autorizaciju ove prijave. Molimo otvorite inbox za $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Veza je izgubljena';

  @override
  String get ipAuthConnectionLostDescription =>
      'Izgubili smo vezu dok smo čekali autorizaciju. Molimo pokušajte ponovo.';

  @override
  String get ipAuthLinkExpired => 'Link za prijavljivanje je istekao';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Ovaj link za autorizaciju je istekao. Molimo vas da se ponovo prijavite.';

  @override
  String get ipAuthResendEmail => 'Pošalji imejl ponovo';

  @override
  String get ipAuthResent => 'Poslato ponovo';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Nazad';

  @override
  String get mfaTitle => 'Dvofaktorska autentifikacija';

  @override
  String get mfaChooseMethod => 'Izaberite metod verifikacije';

  @override
  String get mfaMethodTotp => 'Aplikacija za autentifikaciju';

  @override
  String get mfaMethodWebauthn => 'Bezbednosni ključ / Ključ za pristup';

  @override
  String get mfaTotpDescription =>
      'Unesite 6-cifreni kod iz vaše aplikacije za autentifikaciju ili jedan od vaših rezervnih kodova.';

  @override
  String get mfaCodeLabel => 'Kod';

  @override
  String get mfaTryAnotherMethod => 'Pokušajte drugi metod';

  @override
  String get mfaUseSecurityKey =>
      'Покушајте са безбедносним кључем / пролазним кључем уместо тога';

  @override
  String get accountSelectorTitle => 'Изаберите налог';

  @override
  String get accountSelectorDescription =>
      'Изаберите налог за наставак или додајте други.';

  @override
  String get accountAdd => 'Додај налог';

  @override
  String get accountRemove => 'Уклони';

  @override
  String accountRemoveTitle(String username) {
    return 'Уклони $username';
  }

  @override
  String get accountRemoveDescription =>
      'Ово ће уклонити сачувану сесију за овај налог.';

  @override
  String get accountRemoveOnlyDescription =>
      'Ово ће уклонити једини сачувани налог на овом уређају.';

  @override
  String get accountExpired => 'Истекло';

  @override
  String accountSessionExpired(String identifier) {
    return 'Сесија је истекла за $identifier. Молимо вас да се поново пријавите.';
  }

  @override
  String get accountManageTitle => 'Управљајте налозима';

  @override
  String get accountSwitchFailed =>
      'Није успело пребацивање налога. Покушајте поново.';

  @override
  String get profileTabMenuSwitchAccounts => 'Пребаци налоге';

  @override
  String get statusChangeSheetTitle => 'Постави статус';

  @override
  String get statusOnlineStatusSection => 'Онлајн статус';

  @override
  String get statusOnline => 'Онлајн';

  @override
  String get statusIdle => 'Неактиван';

  @override
  String get statusDnd => 'Не узнемиравај';

  @override
  String get statusInvisible => 'Невидљив';

  @override
  String get statusOffline => 'Није на мрежи';

  @override
  String get statusUntilIChangeIt => 'Док не променим';

  @override
  String get statusDontClear => 'Не бриши';

  @override
  String get statusFor10Seconds => 'На 10 секунди';

  @override
  String get statusClearAfter10Seconds => '10 секунди';

  @override
  String get statusClearAfter15Minutes => '15 минута';

  @override
  String get statusClearAfter30Minutes => '30 минута';

  @override
  String get statusClearAfter1Hour => '1 сат';

  @override
  String get statusClearAfter3Hours => '3 сата';

  @override
  String get statusClearAfter4Hours => '4 сата';

  @override
  String get statusClearAfter8Hours => '8 сати';

  @override
  String get statusClearAfter24Hours => '24 сата';

  @override
  String get statusClearAfter3Days => '3 дана';

  @override
  String get statusDndDescription =>
      'Нећете примати обавештења на радној површини';

  @override
  String get statusInvisibleDescription => 'Изгледаћете као да сте ван мреже';

  @override
  String get customStatusSetTitle => 'Постави прилагођени статус';

  @override
  String get customStatusCurrentHint => 'Прилагођени статус';

  @override
  String get customStatusClear => 'Обриши прилагођени статус';

  @override
  String get customStatusPlaceholder => 'Шта се дешава?';

  @override
  String get customStatusChooseEmoji => 'Изабери емоџи';

  @override
  String get customStatusClearAfter => 'Обриши након';

  @override
  String get customStatusSave => 'Сачувај';

  @override
  String get accountActive => 'Активни налог';

  @override
  String get signOut => 'Одјави се';

  @override
  String get suspendedPermanentTitle => 'Налог трајно суспендован';

  @override
  String get suspendedTemporaryTitle => 'Налог суспендован';

  @override
  String get suspendedPermanentDescription =>
      'Ваш налог је трајно суспендован због кршења наших Услова коришћења.';

  @override
  String get suspendedTemporaryDescription =>
      'Ваш налог је привремено суспендован. Моћи ћете да приступите свом налогу када период суспензије истекне.';

  @override
  String get suspendedIssuedAt => 'Издато';

  @override
  String get suspendedEndsAt => 'Завршава';

  @override
  String get suspendedDuration => 'Трајање';

  @override
  String get suspendedPermanent => 'Trajno';

  @override
  String get suspendedReason => 'Razlog';

  @override
  String get suspendedAppealDeadline => 'Rok za žalbu';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Vaš nalog je zakazan za brisanje $date.';
  }

  @override
  String get suspendedRecheck => 'Proveri ažuriranja';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Proveri ponovo za ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Nazad na prijavu';

  @override
  String get suspendedAppealTitle => 'Žalba';

  @override
  String get suspendedAppealHint =>
      'Objasnite zašto bi vaša suspenzija trebalo da bude ponovo razmotrena (minimum 50 karaktera)...';

  @override
  String get suspendedAppealSubmit => 'Pošalji žalbu';

  @override
  String get suspendedAppealPending => 'Čeka na pregled';

  @override
  String get suspendedAppealAccepted => 'Žalba prihvaćena';

  @override
  String get suspendedAppealRejected => 'Žalba odbijena';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Vaša žalba je prihvaćena i vaš nalog je vraćen.';

  @override
  String get suspendedSignIn => 'Prijavi se na svoj nalog';

  @override
  String get forgotPasswordTitle => 'Zaboravili ste lozinku?';

  @override
  String get forgotPasswordDescription =>
      'Unesite svoju e-mail adresu i poslaćemo vam link za resetovanje lozinke.';

  @override
  String get forgotPasswordSubmit => 'Pošalji link za resetovanje';

  @override
  String get forgotPasswordSentTitle => 'Proveri svoj e-mail';

  @override
  String get forgotPasswordSentDescription =>
      'Poslali smo uputstva za resetovanje lozinke na vašu e-mail adresu. Molimo proverite prijemno sanduče i pratite link da biste resetovali lozinku.';

  @override
  String get forgotPasswordBackToLogin => 'Vrati se na prijavu';

  @override
  String get resetPasswordTitle => 'Postavi novu lozinku';

  @override
  String get resetPasswordDescription =>
      'Unesite svoju novu lozinku ispod da biste dovršili proces resetovanja.';

  @override
  String get resetPasswordNewPassword => 'Nova lozinka';

  @override
  String get resetPasswordConfirm => 'Potvrdi novu lozinku';

  @override
  String get resetPasswordSubmit => 'Resetuj lozinku';

  @override
  String get resetPasswordMismatch => 'Lozinke se ne podudaraju.';

  @override
  String get registerTitle => 'Kreiraj nalog';

  @override
  String get registerDisplayName => 'Prikazano ime (opciono)';

  @override
  String get registerDisplayNameHint => 'Kako bi ljudi trebalo da te zovu?';

  @override
  String get registerUsername => 'Korisničko ime (opciono)';

  @override
  String get registerUsernameHint =>
      'Ostavite prazno za nasumično korisničko ime';

  @override
  String get registerUsernameTagHint =>
      'Tag od 4 cifre će biti automatski dodat kako bi se osigurala jedinstvenost';

  @override
  String get registerDateOfBirth => 'Datum rođenja';

  @override
  String get registerMonth => 'Mesec';

  @override
  String get registerDay => 'Dan';

  @override
  String get registerYear => 'Godina';

  @override
  String get registerConsent =>
      'Slažem se sa Uslovima korišćenja i Pravilima privatnosti';

  @override
  String get registerConsentPrefix => 'Slažem se sa ';

  @override
  String get registerConsentTerms => 'Uslovima korišćenja';

  @override
  String get registerConsentAnd => ' i ';

  @override
  String get registerConsentPrivacy => 'Pravilima privatnosti';

  @override
  String get registerConfirmPassword => 'Potvrdi lozinku';

  @override
  String get registerSubmit => 'Kreiraj nalog';

  @override
  String get registerHaveAccount => 'Već imate nalog? ';

  @override
  String get passkeyNoCredentials =>
      'Nema pronađenih passkey-ova za ovu aplikaciju. Prijavite se umesto toga e-poštom i lozinkom.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkey-ovi nisu podržani na ovom uređaju.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkey-ovi nisu konfigurisani za ovu aplikaciju. Prijavite se umesto toga e-poštom i lozinkom.';

  @override
  String get passkeyTimeout =>
      'Autentifikacija passkey-a je istekla. Molimo pokušajte ponovo.';

  @override
  String get passkeyNotAvailable =>
      'Passkey-ovi nisu dostupni za ovu aplikaciju. Prijavite se umesto toga e-poštom i lozinkom.';

  @override
  String get passkeyFailed =>
      'Autentifikacija putem pristupnog ključa nije uspela. Molimo pokušajte ponovo.';

  @override
  String get errorUnableToCreateAccount =>
      'Nije moguće kreirati nalog. Molimo pokušajte ponovo.';

  @override
  String get errorUnableToSignIn =>
      'Nije moguće prijaviti se trenutno. Molimo pokušajte ponovo.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Neispravna imejl adresa ili lozinka.';

  @override
  String get errorUnableToSendResetLink =>
      'Nije moguće poslati link za resetovanje. Molimo pokušajte ponovo.';

  @override
  String get errorUnableToResetPassword =>
      'Nije moguće resetovati lozinku. Molimo pokušajte ponovo.';

  @override
  String get embedInviteJoin => 'Pridruži se zajednici';

  @override
  String get embedInviteGoTo => 'Idi u zajednicu';

  @override
  String embedInviteOnline(String count) {
    return '$count na mreži';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count članova';
  }

  @override
  String get embedInviteUnknownTitle => 'Nepozvanica';

  @override
  String get embedInviteUnknownSubtitle =>
      'Pokušajte da zatražite novu pozivnicu.';

  @override
  String get embedInviteUnavailable => 'Pozivnica nedostupna';

  @override
  String get inviteAcceptTitle => 'Pozvani ste da se pridružite';

  @override
  String get inviteAcceptJoinButton => 'Pridruži se zajednici';

  @override
  String get inviteAcceptGoToButton => 'Idi u zajednicu';

  @override
  String get inviteAcceptInvitesPaused => 'Pozivnice na čekanju';

  @override
  String get inviteAcceptNotFoundTitle => 'Pozivnica nevažeća';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Ova pozivnica je možda istekla ili je nevažeća.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Pridruži se grupi';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Pozvani ste da se pridružite grupnom DM-u od strane $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'neko';

  @override
  String get inviteAcceptEmojiPack => 'Paket emotikona';

  @override
  String get inviteAcceptStickerPack => 'Paket nalepnica';

  @override
  String get inviteAcceptInstallEmojiPack => 'Instaliraj paket emotikona';

  @override
  String get inviteAcceptInstallStickerPack => 'Instaliraj paket nalepnica';

  @override
  String get inviteAcceptPackInstallNote =>
      'Prihvatanjem ove pozivnice paket će se automatski instalirati.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Pristup kanalu odbijen';

  @override
  String get channelAccessDeniedDescription =>
      'Nemate pristup kanalu na kojem je ova poruka poslata.';

  @override
  String get messageJumpLinkNoAccess => 'Nema pristupa';

  @override
  String get okay => 'U redu';

  @override
  String get embedThemeTitle => 'Deljena tema';

  @override
  String get embedThemeSubtitle => 'Ovaj klijent ne podržava prilagođene teme.';

  @override
  String get embedThemeUnavailableButton => 'Teme nedostupne';

  @override
  String get privacySettings => 'Podešavanja privatnosti';

  @override
  String get privacyDirectMessages => 'Direktne poruke';

  @override
  String get privacyDirectMessagesDescription =>
      'Dozvoli direktne poruke od drugih članova u ovoj zajednici';

  @override
  String get privacyBotDirectMessages => 'Direktne poruke od botova';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Dozvoli botovima iz ove zajednice da vam šalju direktne poruke';

  @override
  String get privacyMutualDmsDisabled =>
      'Administratore zajednice su onemogućili primanje direktnih poruka isključivo od međusobnih članova u ovoj zajednici.';

  @override
  String get communityDebug => 'Debug zajednice';

  @override
  String get copiedToClipboard => 'Kopirano u privremenu memoriju';

  @override
  String get notificationSettings => 'Podešavanja obaveštenja';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Isključi obaveštenja za $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Isključivanjem obaveštenja za zajednicu sprečavate pojavljivanje indikatora nepročitanih poruka i obaveštenja, osim ako niste pomenuti.';

  @override
  String get notificationCommunitySettings =>
      'Podešavanja obaveštenja zajednice';

  @override
  String get notificationAllMessages => 'Sve poruke';

  @override
  String get notificationOnlyMentions => 'Samo pomena';

  @override
  String get notificationNothing => 'Ništa';

  @override
  String get notificationSuppressEveryone => 'Potisni @everyone i @here';

  @override
  String get notificationSuppressRoles => 'Сузби све @помене улога';

  @override
  String get notificationMobilePush => 'Мобилне пуш обавештења';

  @override
  String get notificationOverrides => 'Заобилажења обавештења';

  @override
  String get notificationSelectChannel => 'Изабери канал или категорију';

  @override
  String get notificationOnlyAtMentions => 'Само @помене';

  @override
  String get notificationMuteChannel => 'Искључи звук канала';

  @override
  String get notificationUnmuteChannel => 'Укључи звук канала';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Без категорије';

  @override
  String get dmMarkAsRead => 'Означи као прочитано';

  @override
  String get dmMuteConversation => 'Искључи звук ДМ-а';

  @override
  String get dmUnmuteConversation => 'Укључи звук ДМ-а';

  @override
  String get dmPinDm => 'Закачи ДМ';

  @override
  String get dmUnpinDm => 'Откaчи ДМ';

  @override
  String get dmAlwaysShowInSidebar => 'Увек прикажи у бочној траци';

  @override
  String get dmRemoveFromAlwaysShown => 'Уклони из увек приказаних';

  @override
  String get dmCloseDm => 'Затвори ДМ';

  @override
  String get dmCloseDmConfirmTitle => 'Затвори ДМ';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Да ли сте сигурни да желите да затворите ваш ДМ са корисником $username? Можете га поново отворити касније.';
  }

  @override
  String get dmCopyChannelId => 'Копирај ИД канала';

  @override
  String get dmChannelIdCopied => 'ИД канала је копиран';

  @override
  String get dmCopyUserId => 'Копирај ИД корисника';

  @override
  String get dmUserIdCopied => 'ИД корисника је копиран';

  @override
  String get dmViewProfile => 'Прикажи профил';

  @override
  String get dmVoiceCall => 'Започни гласовни позив';

  @override
  String get incomingVoiceCallTitle => 'Долазни гласовни позив';

  @override
  String get incomingVoiceCallAccept => 'Прихвати';

  @override
  String get incomingVoiceCallDecline => 'Одбиј';

  @override
  String get incomingVoiceCallLabel => 'Долазни позив';

  @override
  String get incomingVoiceCallIgnore => 'Игнориши';

  @override
  String get directVoiceCallNotEligible =>
      'Овај позив се тренутно не може започети. Покушајте поново за тренутак.';

  @override
  String get voiceJoinCallFailed =>
      'Није успело повезивање са овим позивом. Проверите своју везу и покушајте поново.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Није успело придруживање овом позиву. Проверите своју везу и покушајте поново.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Није успело ажурирање овог позива на серверу. Проверите своју везу и покушајте поново.';

  @override
  String get dmAddNote => 'Додај напомену';

  @override
  String get dmEditGroup => 'Измени групу';

  @override
  String get dmInviteToCommunity => 'Позови у заједницу';

  @override
  String get dmBlock => 'Блокирај';

  @override
  String get dmLeaveGroup => 'Напусти групу';

  @override
  String get dmNoCommunitiesAvailable => 'Нема доступних заједница';

  @override
  String dmGroupMemberCount(int count) {
    return '$count чланова';
  }

  @override
  String get dmMuteFor15Min => 'На 15 минута';

  @override
  String get dmMuteFor30Min => 'На 30 минута';

  @override
  String get dmMuteFor1Hour => 'На 1 сат';

  @override
  String get dmMuteFor3Hours => 'На 3 сата';

  @override
  String get dmMuteFor4Hours => 'На 4 сата';

  @override
  String get dmMuteFor8Hours => 'На 8 сати';

  @override
  String get dmMuteFor24Hours => 'На 24 сата';

  @override
  String get dmMuteFor3Days => 'На 3 дана';

  @override
  String get dmMuteForever => 'Док не укључим поново';

  @override
  String get dmPinGroupDm => 'Закачи групни ДМ';

  @override
  String get dmUnpinGroupDm => 'Открени групни ДМ';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Омиљени ДМ';

  @override
  String get dmUnfavoriteDm => 'Уклони из омиљених ДМ';

  @override
  String get dmFavoriteGroupDm => 'Омиљени групни ДМ';

  @override
  String get dmUnfavoriteGroupDm => 'Уклони из омиљених групни ДМ';

  @override
  String get dmChangeFriendNickname => 'Промени надимак пријатеља';

  @override
  String get dmRemoveFriend => 'Уклони пријатеља';

  @override
  String get dmAddFriend => 'Додај пријатеља';

  @override
  String get dmAcceptFriendRequest => 'Прихвати захтев за пријатељство';

  @override
  String get dmIgnoreFriendRequest => 'Игнориши захтев за пријатељство';

  @override
  String get dmFriendRequestSent => 'Захтев за пријатељство послат';

  @override
  String get dmUnblock => 'Деблокирај';

  @override
  String get dmDebugUser => 'Дебаговање корисника';

  @override
  String get dmDebugChannel => 'Дебаговање канала';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Прикачен ДМ';

  @override
  String get dmUnpinned => 'Откренут ДМ';

  @override
  String get dmMuted => 'Заглушен ДМ';

  @override
  String get dmUnmuted => 'Оглушен ДМ';

  @override
  String get dmRemoveFriendConfirmTitle => 'Уклони пријатеља';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Да ли сте сигурни да желите да уклоните $username као пријатеља?';
  }

  @override
  String get dmBlockConfirmTitle => 'Блокирај корисника';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Да ли сте сигурни да желите да блокирате $username? Неће моћи да вам шаље поруке нити захтеве за пријатељство.';
  }

  @override
  String get dmFriendRequestSentToast => 'Захтев за пријатељство је послат';

  @override
  String get dmFriendRequestFailed =>
      'Слање захтева за пријатељство није успело';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Прихватање захтева за пријатељство није успело';

  @override
  String get dmRemoveFriendFailed => 'Уклањање пријатеља није успело';

  @override
  String get dmBlockFailed => 'Блокирање корисника није успело';

  @override
  String get dmUnblockFailed => 'Деблокирање корисника није успело';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Игнорисање захтева за пријатељство није успело';

  @override
  String get dmAddFriends => 'Додај пријатеље';

  @override
  String get addFriendSheetTitle => 'Додај пријатеља';

  @override
  String get addFriendUsernameHint => 'Корисничко име#0000';

  @override
  String get addFriendUsernameLabel => 'Корисничко име пријатеља';

  @override
  String get addFriendSendRequest => 'Пошаљи захтев';

  @override
  String get addFriendNoUserFound =>
      'Ниједан корисник није пронађен са тим корисничким именом.';

  @override
  String get addFriendInvalidUsername =>
      'Унесите важеће корисничко име (Корисничко име#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Захтев за пријатељство је послат';

  @override
  String get addFriendClaimTitle => 'Потражите свој налог';

  @override
  String get addFriendClaimDescription =>
      'Потражите свој налог да бисте слали захтеве за пријатељство.';

  @override
  String get addFriendVerifyTitle => 'Потврдите своју е-пошту';

  @override
  String get addFriendVerifyDescription =>
      'Морате да потврдите своју адресу е-поште пре него што можете да шаљете захтеве за пријатељство.';

  @override
  String get addFriendVerifyEmail => 'Потврди е-пошту';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Примљени захтеви за пријатељство ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Послати захтеви за пријатељство ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Примљен захтев за пријатељство';

  @override
  String get addFriendOutgoingStatus => 'Захтев за пријатељство је послат';

  @override
  String get addFriendViewProfile => 'Погледај профил';

  @override
  String get addFriendAccept => 'Прихвати';

  @override
  String get addFriendIgnore => 'Игнориши';

  @override
  String get addFriendAcceptTitle => 'Прихвати захтев за пријатељство';

  @override
  String get addFriendIgnoreTitle => 'Ignoriši zahtev za prijateljstvo';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Prihvatiti zahtev za prijateljstvo od $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorisati zahtev za prijateljstvo od $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Otkaži zahtev';

  @override
  String get addFriendCancelRequestFailed =>
      'Nije uspelo otkazivanje zahteva za prijateljstvo. Pokušajte ponovo.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Trenutno ne prihvataju zahteve za prijateljstvo.';

  @override
  String get addFriendUnblockFirst =>
      'Prvo deblokirajte korisnika da biste poslali zahtev za prijateljstvo.';

  @override
  String get addFriendCannotSendToSelf =>
      'Ne možete poslati zahtev za prijateljstvo sami sebi.';

  @override
  String get addFriendAlreadyFriends =>
      'Već ste prijatelji sa ovim korisnikom.';

  @override
  String get addFriendClaimToSend =>
      'Završite registraciju da biste slali zahteve za prijateljstvo.';

  @override
  String get addFriendSendFailedGeneric =>
      'Nije uspeo slanje zahteva za prijateljstvo. Pokušajte ponovo.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistem';

  @override
  String get emojiSearchPlaceholder => 'Pronađi emoji iz snova';

  @override
  String get emojiSearchEmpty => 'Nema emojija koji odgovaraju vašoj pretrazi';

  @override
  String get emojiAutocompleteDefaultLabel => 'Podrazumevani emoji';

  @override
  String get emojiFrequentlyUsed => 'Često korišćeno';

  @override
  String get emojiTabGifs => 'GIF-ovi';

  @override
  String get emojiTabMedia => 'Mediji';

  @override
  String get emojiTabStickers => 'Stikeri';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Pretraži GIF-ove';

  @override
  String get gifPickerSearchKlipy => 'Pretraži KLIPY';

  @override
  String get gifPickerSearchTenor => 'Pretraži Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Omiljeno';

  @override
  String get gifPickerTrending => 'Trend GIF-ovi';

  @override
  String get gifPickerNoResultsTitle => 'Nema rezultata pretrage';

  @override
  String get gifPickerNoResultsDescription =>
      'Pokušajte sa drugim terminom za pretragu';

  @override
  String get gifPickerLoadFailedTitle => 'Nije uspelo učitavanje GIF-ova';

  @override
  String get gifPickerLoadFailedBody =>
      'Proverite svoju vezu i pokušajte ponovo.';

  @override
  String get emojiCategoryPeople => 'Ljudi';

  @override
  String get emojiCategoryNature => 'Priroda';

  @override
  String get emojiCategoryFood => 'Hrana i piće';

  @override
  String get emojiCategoryActivity => 'Aktivnosti';

  @override
  String get emojiCategoryTravel => 'Putovanja i mesta';

  @override
  String get emojiCategoryObjects => 'Objekti';

  @override
  String get emojiCategorySymbols => 'Simboli';

  @override
  String get emojiCategoryFlags => 'Zastave';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Otključaj $emojiCount iz $communityCount uz Plutonijum.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Nabavi Plutonijum';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Ne prikazuj ovo ponovo';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prilagođenih emojija',
      one: '1 prilagođeni emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zajednice',
      one: '1 zajednica',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Upozorenje na eksterni link';

  @override
  String get externalLinkWarningLeaving => 'Napuštate Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Eksterni linkovi mogu biti opasni. Molimo budite oprezni.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL odredišta:';

  @override
  String get externalLinksSectionTitle => 'Eksterni linkovi';

  @override
  String get externalLinksSectionDescription =>
      'Konfigurišite kako se rukuje upozorenjima na eksterne linkove.';

  @override
  String get externalLinkWarningTrustPrefix => 'Uvek veruj ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — preskoči ovo upozorenje sledeći put';

  @override
  String get externalLinkVisitSite => 'Poseti sajt';

  @override
  String get externalLinkTrustAllLabel => 'Veruj svim spoljnim linkovima';

  @override
  String get externalLinkStripTrackingLabel =>
      'Ukloni parametre za praćenje sa URL-ova';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatski uklonite parametre za praćenje (kao što su utm_source, fbclid, gclid) iz URL-ova u porukama koje šaljete. Pročišćava link pre nego što stigne do nekog drugog.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Verovati svim spoljnim linkovima?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Ovo će poverovati svim spoljnim linkovima i preskočiti upozorenje za svaki domen. Vaši postojeći poverljivi domeni će biti zamenjeni. Ovo je manje bezbedno.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Veruj svima';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Prekinuti poverenje u sve linkove?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Upozorenja za spoljne linkove će se ponovo prikazivati. Morate dodati poverljive domene pojedinačno.';

  @override
  String get externalLinkStopTrustingAllAction => 'Onemogući poverenje u sve';

  @override
  String get externalLinkTrustedAllDescription =>
      'Svim spoljnim linkovima se veruje. Upozorenja se neće prikazivati.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Imate $count poverljivi domen(a). Dodajte još tako što ćete označiti polje prilikom posećivanja spoljnih linkova.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Kada je omogućeno, neće se prikazivati upozorenja za spoljne linkove. Ovo je manje bezbedno.';

  @override
  String get imageFileTooLarge =>
      'Slika je prevelika. Molimo izaberite datoteku manju od 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animirani avatari zahtevaju Plutonijum';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animirani baneri zahtevaju Plutonijum';

  @override
  String get animatedAvifNotSupported => 'Animirani AVIF nije podržan';

  @override
  String get animatedAvifNotSupportedBody =>
      'Isecanje i rotiranje animiranih AVIF datoteka još uvek nije podržano. Ako nastavite, biće učitan u originalnom obliku.';

  @override
  String get uploadAsIs => 'Učitaj kao jeste';

  @override
  String get croppingAnimatedNotSupported =>
      'Isecanje animiranih slika još uvek nije podržano. Koristiće se originalni upload.';

  @override
  String get cropAvatar => 'Iseci avatar';

  @override
  String get cropBanner => 'Iseci baner';

  @override
  String get skip => 'Preskoči';

  @override
  String get crop => 'Iseci';

  @override
  String get changeYourFluxerTag => 'Promeni svoj FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Korisnička imena mogu sadržati samo slova (a-z, A-Z), brojeve (0-9) i donje crte. Korisnička imena ne razlikuju velika i mala slova.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Korisnička imena mogu sadržati samo slova (a-z, A-Z), brojeve (0-9) i donje crte. Korisnička imena ne razlikuju velika i mala slova. Možete izabrati bilo koji dostupan 4-cifreni tag od #0000 do #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Korisnička imena mogu sadržati samo slova (a-z, A-Z), brojeve (0-9) i donje crte. Korisnička imena ne razlikuju velika i mala slova. Možete izabrati bilo koji dostupan 4-cifreni tag od #0001 do #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Između $min i $max karaktera';
  }

  @override
  String get validationAllowedChars =>
      'Samo slova (a-z, A-Z), brojevi (0-9) i donje crte (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Nabavite Plutonijum da biste prilagodili svoj tag ili ga zadržali prilikom promene korisničkog imena';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag je već zauzet';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminator je već zauzet. Nastavak će automatski ponovo dodeliti vaš diskriminator.';
  }

  @override
  String get customTagIsTemporary => 'Prilagođeni tag je privremen';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Vaš prilagođeni 4-cifreni tag je dostupan samo dok je vaša Plutonijum pretplata aktivna. Kada vaša pretplata istekne $date, vaš tag će se vratiti na nasumično dodeljen broj nakon 3-dnevnog perioda milosti.';
  }

  @override
  String get customTagTemporaryBody =>
      'Vaš prilagođeni 4-cifreni tag je dostupan samo dok je vaša Plutonijum pretplata aktivna. Kada vaša pretplata istekne, vaš tag će se vratiti na nasumično dodeljen broj nakon 3-dnevnog perioda milosti.';

  @override
  String get iUnderstandContinue => 'Razumem, nastavi';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Ako sačuvate ovaj FluxerTag, vaš prilagođeni 4-cifreni tag će se vratiti na nasumičan broj kada vaša Plutonijum pretplata istekne. Ako vaša pretplata ne bude obnovljena, imaćete 3-dnevni period milosti pre nego što se tag promeni.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Vaš prilagođeni 4-cifreni tag (#$discriminator) je aktivan dok je vaša Plutonijum pretplata aktivna. Ako vaša pretplata istekne ili ne bude obnovljena nakon 3-dnevnog perioda milosti, vaš tag će se vratiti na nasumičan broj.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Prilagodite svoj 4-cifreni tag ili ga zadržite prilikom promene korisničkog imena';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Vaša Plutonijum probna verzija ističe $date. Nadogradite da biste zadržali svoj prilagođeni tag i zaradili bedž na svom profilu.';
  }

  @override
  String get premiumTrialActive =>
      'Na probnoj ste Plutonijum verziji. Nadogradite da biste zadržali svoj prilagođeni tag i zaradili bedž na svom profilu.';

  @override
  String get fluxerTagUpdated => 'FluxerTag je ažuriran';

  @override
  String get fluxerTagUpdateFailed =>
      'Ažuriranje FluxerTag-a nije uspelo. Molimo pokušajte ponovo.';

  @override
  String get continueAction => 'Nastavi';

  @override
  String get profileCustomizationTitle => 'Prilagođavanje profila';

  @override
  String get profileCustomizationDescription =>
      'Uredite izgled svog profila i pogledajte pregled uživo';

  @override
  String get usernameLabel => 'Korisničko ime';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Potražite svoj nalog da biste promenili svoj FluxerTag';

  @override
  String get changeFluxerTag => 'Promeni FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Prilagodi svoj 4-cifreni tag (#$discriminator) po želji uz Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Promeni svoje korisničko ime i 4-cifreni tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Tvoj prilagođeni tag (#$discriminator) je vezan za tvoju Plutonium pretplatu i vratiće se na nasumični tag ako istekne.';
  }

  @override
  String get displayNameLabel => 'Prikazano ime';

  @override
  String get pronounsLabel => 'Zamenice';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Promeni avatar';

  @override
  String get removeAvatar => 'Ukloni avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maksimalno 10MB. Preporučeno: 512×512px';

  @override
  String get bannerLabel => 'Baner';

  @override
  String get changeBanner => 'Promeni baner';

  @override
  String get removeBanner => 'Ukloni baner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maksimalno 10MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Akcentna boja';

  @override
  String get accentColorDescription =>
      'Prilagođava boju ivice i banera na tvom profilu';

  @override
  String get aboutMeLabel => 'O meni';

  @override
  String get aboutMeHelperText =>
      'Možeš koristiti linkove, emotikone i Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Privatnost Plutonium bedža';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Kontroliši kako se tvoj Plutonium bedž prikazuje drugima';

  @override
  String get hidePlutoniumBadgeLabel => 'Potpuno sakrij Plutonium bedž';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Potpuno sakrij svoj Plutonium bedž od drugih korisnika';

  @override
  String get hidePlutoniumPurchaseDate => 'Sakrij datum kupovine Plutoniuma';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Sakrij datum kupovine Plutoniuma ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Ukloni datum kada si prvi put kupio Plutonium sa svog bedža';

  @override
  String get maskVisionaryAsSubscription => 'Sakrij Visionary kao pretplatu';

  @override
  String get maskVisionaryDescription =>
      'Prikaži svoj Visionary kao redovnu pretplatu';

  @override
  String get hideVisionaryIdBadge => 'Sakrij Visionary ID bedž';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Sakrij Visionary ID bedž (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Ukloni svoj Visionary ID bedž';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Na Plutonium probnom periodu — tvoja pretplata počinje $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Tvoja pretplata će automatski početi kada se probni period završi. Nije potrebno ništa da uradiš.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Na Plutonium probnom periodu koji ističe $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Na Plutonium probnom periodu';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maksimalno 10MB. Preporučeno: 512×512px. Animovani avatari (GIF) zahtevaju Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Prilagodi svoj profil statičnom ili animiranom baner slikom da bi se istakao.';

  @override
  String get getPlutonium => 'Nabavi Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Kupovine u aplikaciji još uvek nisu dostupne na ovoj platformi. Pratite nas — uskoro!';

  @override
  String get profilePreviewLabel => 'Pregled';

  @override
  String get profilePreviewMessage => 'Poruka';

  @override
  String get profilePreviewMemberSince => 'Član Fluxera od';

  @override
  String get unclaimedAccountTitle => 'Nezatražen nalog';

  @override
  String get unclaimedAccountDescription =>
      'Tvoj nalog još uvek nije zatražen. Bez imejla i lozinke, mogao bi da izgubiš pristup. Zatraži svoj nalog sada da bi ga obezbedio.';

  @override
  String get claimAccount => 'Zatraži nalog';

  @override
  String get profileTypeLabel => 'Tip profila';

  @override
  String get profileTypeGlobal => 'Globalni profil';

  @override
  String get profileTypeGuildDescription =>
      'Uređuješ svoj profil za zajednicu. Ovaj profil će biti vidljiv samo u ovoj zajednici i zameniće tvoj globalni profil.';

  @override
  String get communityNicknameLabel => 'Nadimak u zajednici';

  @override
  String get perGuildPremiumUpsellText =>
      'Prilagođavanje vašeg avatara, banera, akcentne boje i biografije za pojedinačne zajednice zahteva Plutonijum. Nadimci u zajednici i zamenice su besplatni za sve.';

  @override
  String get avatarModeInherit => 'Koristi globalni profil';

  @override
  String get avatarModeCustom => 'Koristi prilagođenu sliku';

  @override
  String get avatarModeUnset => 'Ne prikazuj';

  @override
  String get profileSavedToast => 'Profil je ažuriran';

  @override
  String get profileEditButton => 'Uredi profil';

  @override
  String get profileNoteLabel => 'Napomena';

  @override
  String get profileNoteVisibility => '(vidljivo samo vama)';

  @override
  String get profileNoteEmpty => 'Još nema napomene.';

  @override
  String get sudoTitle => 'Potvrdi svoj identitet';

  @override
  String get sudoDescription => 'Ova akcija zahteva verifikaciju za nastavak.';

  @override
  String get sudoAuthenticatorCode => 'Kod za autentifikaciju';

  @override
  String get sudoMethodPassword => 'Lozinka';

  @override
  String get sudoMethodTotp => 'Autentifikator';

  @override
  String get sudoVerificationFailed =>
      'Verifikacija nije uspela. Molimo pokušajte ponovo.';

  @override
  String get securityAccountTitle => 'Nalog';

  @override
  String get securityAccountDescription =>
      'Upravljajte svojom imejl adresom, lozinkom i podešavanjima naloga';

  @override
  String get securitySectionTitle => 'Bezbednost';

  @override
  String get securitySectionDescription =>
      'Zaštitite svoj nalog dvofaktorskom autentifikacijom i lozinkama';

  @override
  String get securityLoginEmailSectionTitle => 'Podešavanja imejla';

  @override
  String get securityLoginEmailSectionDescription =>
      'Upravljajte imejl adresom koju koristite za prijavljivanje na Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Imenl adrese';

  @override
  String get securityLoginNoEmailSet => 'Nije postavljena imejl adresa';

  @override
  String get securityLoginChangeEmail => 'Promeni imejl';

  @override
  String get securityLoginAddEmail => 'Dodaj imejl';

  @override
  String get securityLoginReveal => 'Otkrij';

  @override
  String get securityLoginHide => 'Sakrij';

  @override
  String get securityLoginPasswordSectionTitle => 'Lozinka';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Promenite svoju lozinku da biste zaštitili svoj nalog';

  @override
  String get securityLoginCurrentPasswordLabel => 'Trenutna lozinka';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Poslednja promena: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Poslednja promena: Nikada';

  @override
  String get securityLoginNoPasswordSet => 'Nije postavljena lozinka';

  @override
  String get securityLoginChangePassword => 'Promeni lozinku';

  @override
  String get securityLoginSetPassword => 'Postavi lozinku';

  @override
  String get passwordChangeTitle => 'Promeni lozinku';

  @override
  String get passwordChangeIntroDescription =>
      'Poslaćemo verifikacioni kod na vašu imejl adresu da bismo potvrdili vaš identitet pre promene lozinke.';

  @override
  String get passwordChangeStart => 'Počni';

  @override
  String get passwordChangeVerifyTitle => 'Potvrdi svoj imejl';

  @override
  String get passwordChangeVerifyDescription =>
      'Unesite verifikacioni kod poslat na vašu imejl adresu.';

  @override
  String get passwordChangeVerificationCode => 'Verifikacioni kod';

  @override
  String get passwordChangeVerify => 'Potvrdi';

  @override
  String get passwordChangeNewPasswordTitle => 'Postavi novu lozinku';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Unesite svoju novu lozinku ispod.';

  @override
  String get passwordChangeNewPassword => 'Nova lozinka';

  @override
  String get passwordChangeConfirmPassword => 'Potvrdi novu lozinku';

  @override
  String get passwordChangeSubmit => 'Promeni lozinku';

  @override
  String get passwordChangeSuccess => 'Lozinka je promenjena';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Lozinke se ne podudaraju';

  @override
  String get passwordChangeInvalidCode => 'Neispravan ili istekao kod';

  @override
  String get emailChangeTitle => 'Promeni mejl';

  @override
  String get emailChangeIntroDescription =>
      'Poslaćemo kodove za proveru da bismo potvrdili tvoj identitet pre promene mejl adrese.';

  @override
  String get emailChangeStart => 'Počni';

  @override
  String get emailChangeVerifyOriginalTitle => 'Proveri trenutni mejl';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Unesi kod za proveru poslat na tvoju trenutnu mejl adresu.';

  @override
  String get emailChangeNewEmailTitle => 'Unesi novi mejl';

  @override
  String get emailChangeNewEmailDescription =>
      'Unesi novu mejl adresu koju želiš da koristiš.';

  @override
  String get emailChangeNewEmailLabel => 'Novi mejl';

  @override
  String get emailChangeNewEmailSubmit => 'Pošalji kod za proveru';

  @override
  String get emailChangeVerifyNewTitle => 'Proveri novi mejl';

  @override
  String get emailChangeVerifyNewDescription =>
      'Unesi kod za proveru poslat na tvoju novu mejl adresu.';

  @override
  String get emailChangeSuccess => 'Mejl je promenjen';

  @override
  String get emailChangeInvalidCode => 'Neispravan ili istekao kod';

  @override
  String get resend => 'Pošalji ponovo';

  @override
  String resendCountdown(int seconds) {
    return 'Pošalji ponovo (${seconds}s)';
  }

  @override
  String get verificationCode => 'Kod za proveru';

  @override
  String get verify => 'Proveri';

  @override
  String get enable => 'Omogući';

  @override
  String get disable => 'Onemogući';

  @override
  String get delete => 'Obriši';

  @override
  String get save => 'Sačuvaj';

  @override
  String get securityTfaSectionTitle => 'Dvofaktorska autentifikacija';

  @override
  String get securityTfaSectionDescription =>
      'Dodaj dodatni sloj bezbednosti svom nalogu';

  @override
  String get securityTfaAuthenticatorApp => 'Aplikacija za autentifikaciju';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Dvofaktorska autentifikacija je omogućena';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Koristi aplikaciju za autentifikaciju za generisanje kodova za dvofaktorsku autentifikaciju';

  @override
  String get securityTfaBackupCodes => 'Rezervni kodovi';

  @override
  String get securityTfaBackupCodesDescription =>
      'Pregledaj i upravljaj svojim rezervnim kodovima za oporavak naloga';

  @override
  String get securityTfaViewCodes => 'Prikaži kodove';

  @override
  String get securityPasskeysSectionTitle => 'Provereni ključevi';

  @override
  String get securityPasskeysSectionDescription =>
      'Koristi proverene ključeve za prijavljivanje bez lozinke i dvofaktorsku autentifikaciju';

  @override
  String get securityPasskeysRegistered => 'Registrovani provereni ključevi';

  @override
  String get securityPasskeysNone => 'Nema registrovanih proverenih ključeva';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'proverena ključa',
      one: 'provereni ključ',
    );
    return '$count $_temp0 registrovano (maks. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Dodaj provereni ključ';

  @override
  String securityPasskeysAdded(String date) {
    return 'Dodato: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Poslednji put korišćeno: $date';
  }

  @override
  String get securityPasskeysRename => 'Preimenuj';

  @override
  String get securityPasskeysDeleteTitle => 'Obriši provereni ključ';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Da li ste sigurni da želite da obrišete provereni ključ „$name“?';
  }

  @override
  String get securityPasskeyNameTitle => 'Ime proverenog ključa';

  @override
  String get securityPasskeyNameLabel => 'Ime proverenog ključa';

  @override
  String get securityPasskeyNameHint => 'npr. YubiKey, iPhone, Radni računar';

  @override
  String get securityPhoneSectionTitle => 'Broj telefona';

  @override
  String get securityPhoneSectionDescription =>
      'Upravljaj svojim brojem telefona.';

  @override
  String get securityPhoneLabel => 'Broj telefona';

  @override
  String get securityPhoneNone => 'Nije dodat nijedan broj telefona.';

  @override
  String get securityPhoneAdd => 'Dodaj telefon';

  @override
  String get securityPhoneRemove => 'Ukloni';

  @override
  String get securityPhoneRemoveTitle => 'Ukloni broj telefona';

  @override
  String get securityPhoneRemoveDescription =>
      'Da li ste sigurni da želite da uklonite broj telefona?';

  @override
  String get securityPhoneRemoved => 'Broj telefona je uklonjen';

  @override
  String get securityClaimTitle => 'Bezbednosne funkcije';

  @override
  String get securityClaimDescription =>
      'Potražite svoj nalog da biste pristupili bezbednosnim funkcijama kao što su dvofaktorska autentifikacija i ključevi za pristup.';

  @override
  String get securityVerifyEmailRequired =>
      'Morate da potvrdite svoju adresu e-pošte pre nego što možete da podesite dvofaktorsku autentifikaciju, ključeve za pristup ili SMS verifikaciju.';

  @override
  String get totpEnableTitle => 'Podešavanje aplikacije za autentifikaciju';

  @override
  String get totpEnableDescription =>
      'Skenirajte QR kod svojom aplikacijom za autentifikaciju da biste generisali kodove za dvofaktorsku autentifikaciju.';

  @override
  String get totpEnableCodeLabel => 'Kod';

  @override
  String get totpEnableCodeHint =>
      'Unesite 6-cifreni kod iz vaše aplikacije za autentifikaciju';

  @override
  String get totpEnableSuccess => 'Dvofaktorska autentifikacija je omogućena';

  @override
  String get totpDisableTitle => 'Uklanjanje aplikacije za autentifikaciju';

  @override
  String get totpDisableDescription =>
      'Unesite 6-cifreni kod iz vaše aplikacije za autentifikaciju da biste onemogućili dvofaktorsku autentifikaciju.';

  @override
  String get totpDisableSuccess =>
      'Dvofaktorska autentifikacija je onemogućena';

  @override
  String get backupCodesTitle => 'Rezervni kodovi';

  @override
  String get backupCodesWarning =>
      'Ako izgubite pristup svojoj aplikaciji za autentifikaciju i nemate ove kodove, bićete trajno zaključani sa svog naloga. Preuzmite ih ili ih kopirajte sada i čuvajte ih na sigurnom mestu.';

  @override
  String get backupCodesDownload => 'Preuzmi';

  @override
  String get backupCodesCopy => 'Kopiraj';

  @override
  String get backupCodesCopied =>
      'Rezervni kodovi kopirani u privremenu memoriju';

  @override
  String get backupCodesAcknowledge =>
      'Preuzeo/la sam ili kopirao/la svoje rezervne kodove i sačuvao/la ih na sigurnom mestu.';

  @override
  String get backupCodesDone => 'Gotovo';

  @override
  String get backupCodesViewTitle => 'Prikaži rezervne kodove';

  @override
  String get backupCodesViewDescription =>
      'Verifikacija može biti potrebna pre prikazivanja vaših rezervnih kodova.';

  @override
  String get phoneAddTitle => 'Dodavanje broja telefona';

  @override
  String get phoneAddLabel => 'Broj telefona';

  @override
  String get phoneAddHint => 'Unesite broj telefona';

  @override
  String get phoneAddFooter =>
      'Unesite broj telefona. Poslaćemo vam verifikacioni kod putem SMS-a.';

  @override
  String get phoneAddSendCode => 'Pošalji kod';

  @override
  String get phoneVerifyTitle => 'Verifikacija broja telefona';

  @override
  String get phoneVerifyDescription =>
      'Unesite verifikacioni kod poslat na vaš broj telefona.';

  @override
  String get phoneAddSuccess => 'Broj telefona je dodat';

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
  String get dangerZoneSectionTitle => 'Zona opasnosti';

  @override
  String get dangerZoneSectionDescription => 'Nepovratne i destruktivne akcije';

  @override
  String get dangerZoneDisableTitle => 'Onemogućavanje naloga';

  @override
  String get dangerZoneDisableDescription =>
      'Privremeno onemogućite svoj nalog. Možete ga ponovo aktivirati kasnije tako što ćete se ponovo prijaviti.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Onemogućavanje vašeg naloga će vas odjaviti iz svih sesija. Možete ponovo omogućiti svoj nalog u bilo kom trenutku ponovnim prijavljivanjem.';

  @override
  String get dangerZoneDeleteTitle => 'Brisanje naloga';

  @override
  String get dangerZoneDeleteDescription =>
      'Trajno izbrišite svoj nalog i sve povezane podatke. Ova akcija se ne može poništiti.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Otkažite svoju aktivnu Plutonium pretplatu u podešavanjima Plutoniuma pre brisanja naloga.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Nije moguće izbrisati nalog';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Ne možete izbrisati svoj nalog dok posedujete zajednice. Prvo prenesite vlasništvo nad sledećim zajednicama:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'i još $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Da biste preneli vlasništvo, idite na $settingsPath i koristite opciju prenosa vlasništva.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Da li ste sigurni da želite da izbrišete svoj nalog? Ova akcija će zakazati vaš nalog za trajno brisanje.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Proces brisanja možete otkazati u roku od 14 dana';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Nakon 14 dana, vaš nalog će biti trajno izbrisan';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Jednom kada se brisanje obradi, nećete moći da povratite pristup svom nalogu';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Nećete moći da izbrišete svoje poslate poruke nakon što vaš nalog bude izbrisan';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Ako želite da izvezete svoje podatke ili prvo izbrišete svoje poruke, posetite odeljak Kontrolna tabla privatnosti u Podešavanjima korisnika pre nego što nastavite.';

  @override
  String get claimAccountTitle => 'Potražite svoj nalog';

  @override
  String get claimAccountDescription =>
      'Potražite svoj nalog dodavanjem e-pošte i lozinke. Poslaćemo vam verifikacioni kod da potvrdimo vašu e-poštu pre završetka.';

  @override
  String get claimAccountEmailLabel => 'E-pošta';

  @override
  String get claimAccountPasswordLabel => 'Lozinka';

  @override
  String get claimAccountSendCode => 'Pošalji kod';

  @override
  String get claimAccountVerifyDescription =>
      'Unesite kod koji smo vam poslali na e-poštu da biste ga potvrdili. Vaša lozinka će biti postavljena nakon potvrde koda.';

  @override
  String get claimAccountSuccess => 'Nalog je uspešno preuzet';

  @override
  String get importantInformation => 'Važne informacije:';

  @override
  String get genericError => 'Došlo je do greške';

  @override
  String get invalidCode => 'Neispravan kod';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count godine',
      one: 'pre 1 godine',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count meseca',
      one: 'pre 1 meseca',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count dana',
      one: 'pre 1 dana',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count sata',
      one: 'pre 1 sata',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count minuta',
      one: 'pre 1 minuta',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'upravo sada';

  @override
  String get authorizedAppsTitle => 'Autorizovane aplikacije';

  @override
  String get authorizedAppsDescription =>
      'Ovim aplikacijama je odobren pristup vašem Fluxer nalogu.';

  @override
  String get authorizedAppsEmptyTitle => 'Nema autorizovanih aplikacija';

  @override
  String get authorizedAppsEmptyDescription =>
      'Niste autorizovali nijednu aplikaciju za pristup vašem nalogu.';

  @override
  String get authorizedAppsLoadError =>
      'Nije uspelo učitavanje autorizovanih aplikacija';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizovano $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Dodijeljena ovlašćenja';

  @override
  String get authorizedAppsRevoke => 'Opozovi';

  @override
  String get authorizedAppsRevokeTitle => 'Opozovi pristup aplikaciji';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Da li ste sigurni da želite da opozovete pristup za $appName? Ova aplikacija više neće imati pristup vašem nalogu.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Pristupite osnovnim informacijama vašeg profila (korisničko ime, avatar, itd.)';

  @override
  String get authorizedAppsScopeEmail => 'Pogledajte vašu e-mail adresu';

  @override
  String get authorizedAppsScopeGuilds => 'Pogledajte zajednice čiji ste član';

  @override
  String get authorizedAppsScopeConnections =>
      'Pogledajte vaše povezane naloge';

  @override
  String get authorizedAppsScopeBot =>
      'Dodajte bota u zajednicu sa traženim ovlašćenjima';

  @override
  String get authorizedAppsScopeAdmin =>
      'Pristupite administrativnim krajnjim tačkama';

  @override
  String get privacyPendingDeletionTitle => 'Čeka brisanje';

  @override
  String get blockedUsersTitle => 'Blokirani korisnici';

  @override
  String get blockedUsersDescription =>
      'Blokirani korisnici vam ne mogu slati zahteve za prijateljstvo niti vam direktno slati poruke.';

  @override
  String get blockedUsersEmptyTitle => 'Nema blokiranih korisnika';

  @override
  String get blockedUsersEmptyDescription => 'Još uvek niste nikoga blokirali.';

  @override
  String get blockedUsersLoadError =>
      'Nije uspelo učitavanje blokiranih korisnika';

  @override
  String get blockedUsersUnblock => 'Odblokiraj';

  @override
  String get blockedUsersUnblockTitle => 'Odblokiraj korisnika';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Da li ste sigurni da želite da odblokirate $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopiraj FluxerTag';

  @override
  String get blockedUsersCopyId => 'Kopiraj ID korisnika';

  @override
  String get userProfileLoadError => 'Nije moguće učitati profil';

  @override
  String get userProfileRetry => 'Pokušaj ponovo';

  @override
  String get userProfileMessage => 'Poruka';

  @override
  String get userProfileVoiceCall => 'Glasovni poziv';

  @override
  String get userProfileVideoCall => 'Video poziv';

  @override
  String get userProfileEditProfile => 'Uredi profil';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer osoblje';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer tim zajednice';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Lovac na greške u Fluxeru';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonijum';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Pretplatnik Fluxer Plutonijuma od $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Vizionar';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Vizionar od $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Vizionar ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Заједнички пријатељи ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Заједнице ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Заједнички пријатељи';

  @override
  String get userProfileMutualCommunitiesTitle => 'Заједнице';

  @override
  String get userProfileNoMutualFriends =>
      'Нису пронађени заједнички пријатељи.';

  @override
  String get userProfileNoMutualCommunities => 'Нису пронађене заједнице.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Надимак: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Отвори ДМ';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Блокирали сте $username. Нећете моћи да шаљете поруке осим ако га не деблокирате.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Деблокирај';

  @override
  String get userProfileOpenDm => 'Отвори ДМ';

  @override
  String get userProfileNoteTitle => 'Напомена';

  @override
  String get userProfileNoteVisibility => '(видљиво само вама)';

  @override
  String get userProfileNoteSave => 'Сачувај';

  @override
  String get userProfileNoteDelete => 'Избриши';

  @override
  String get userProfileNoteEmpty => 'Кликните да бисте додали напомену';

  @override
  String get userProfileMemberSince => 'Члан од';

  @override
  String get userProfileAboutMe => 'О мени';

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
  String get userProfileCopyUsername => 'Копирај корисничко име';

  @override
  String get userProfileCopyUserId => 'Копирај кориснички ID';

  @override
  String get userProfileViewMainProfile => 'Прикажи главни профил';

  @override
  String get userProfileViewCommunityProfile => 'Прикажи профил заједнице';

  @override
  String get userProfileBlockUser => 'Блокирај корисника';

  @override
  String get userProfileUnblockUser => 'Деблокирај корисника';

  @override
  String get userProfileRemoveFriend => 'Уклони пријатеља';

  @override
  String get userProfileBlockConfirmTitle => 'Блокирај корисника';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Да ли сте сигурни да желите да блокирате $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Деблокирај корисника';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Да ли сте сигурни да желите да деблокирате $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Уклони пријатеља';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Да ли сте сигурни да желите да уклоните $username као пријатеља?';
  }

  @override
  String get userProfileFailedOpenDm => 'Неуспешно отварање ДМ-а';

  @override
  String get userProfileFailedSaveNote => 'Неуспешно чување напомене';

  @override
  String get userProfileActionFailed => 'Акција није успела, покушајте поново';

  @override
  String get userProfileChangeNickname => 'Промени надимак';

  @override
  String get userProfileKick => 'Избаци';

  @override
  String get userProfileBan => 'Забрани';

  @override
  String get userProfileTimeout => 'Временско ограничење';

  @override
  String get userProfileRemoveTimeout => 'Уклони временско ограничење';

  @override
  String get userProfileTransferOwnership => 'Пренеси власништво';

  @override
  String get userProfileReportUser => 'Пријави корисника';

  @override
  String get userProfileReportMessage => 'Пријави поруку';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Избаци $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Да ли сте сигурни да желите да избаците $username? Може се поново придружити уз нови позив.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Уклонити тајмаут?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Уклањањем тајмаута, $username ће поново моћи да шаље поруке, реагује и придружи се гласовним каналима.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Пренети власништво?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Пренети власништво над овом заједницом на $username? Ово је неповратно и изгубићете сва власничка овлашћења.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Забани $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Трајање забране';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Прилагођено трајање (секунде)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Било која вредност од $min до $max секунди';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Избриши историју порука';

  @override
  String get userProfileBanDeleteNone => 'Не бриши ниједну';

  @override
  String get userProfileBanDelete24h => 'Претходних 24 сата';

  @override
  String get userProfileBanDelete7d => 'Претходних 7 дана';

  @override
  String get userProfileBanReasonLabel => 'Разлог (опционо)';

  @override
  String get userProfileBanReasonHint => 'Унесите разлог за забрану';

  @override
  String get userProfileBanSubmit => 'Забани члана';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Тајмаут за $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Трајање тајмаута';

  @override
  String get userProfileTimeoutSubmit => 'Тајмаут члана';

  @override
  String get userProfileNicknameLabel => 'Надимак';

  @override
  String get userProfileNicknameHint => 'Унесите надимак';

  @override
  String get userProfileNicknameSave => 'Сачувај';

  @override
  String userProfileKickSuccess(String username) {
    return 'Избачен $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Забањен $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Тајмаут за $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Уклоњен тајмаут за $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Надимак ажуриран';

  @override
  String get userProfileTransferSuccess => 'Власништво пренето';

  @override
  String get durationPermanent => 'Трајно';

  @override
  String get duration60Seconds => '60 секунди';

  @override
  String get duration5Minutes => '5 минута';

  @override
  String get duration10Minutes => '10 минута';

  @override
  String get duration1Hour => '1 сат';

  @override
  String get duration12Hours => '12 сати';

  @override
  String get duration1Day => '1 дан';

  @override
  String get duration3Days => '3 дана';

  @override
  String get duration5Days => '5 дана';

  @override
  String get duration1Week => '1 недеља';

  @override
  String get duration2Weeks => '2 недеље';

  @override
  String get duration1Month => '1 месец';

  @override
  String get durationCustom => 'Прилагођено…';

  @override
  String get iarReportUserTitle => 'Пријави корисника';

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
  String get iarReasonInappropriateProfile => 'Неприкладан профил';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Профил овог корисника садржи неприкладан садржај';

  @override
  String typingIndicatorOne(String name) {
    return 'Корисник $name куца...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Корисници $name1 и $name2 куцају...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Корисници $name1, $name2 и $name3 куцају...';
  }

  @override
  String get typingIndicatorMultiple => 'Више људи куца...';

  @override
  String get typingIndicatorHandful => 'Окупља се шака ратника на тастатури...';

  @override
  String get typingIndicatorSymphony =>
      'Симфонија кликтања тастатуре је у току...';

  @override
  String get typingIndicatorFiesta => 'Овде је права фешта куцања';

  @override
  String get typingIndicatorApocalypse => 'Kakva apokalipsa kucanja';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Drago mi je što si ovde, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Dobrodošao, $username! Osećaj se kao kod kuće.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Zdravo, $username! Drago nam je što si ovde.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Zdravo, $username! Uključi se kad god budeš spreman.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hej $username, drago nam je što te vidimo ovde!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Ćao, $username! Nadam se da ćeš uživati u boravku.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hej, $username, dobrodošao!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Drago mi je što si stigao, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Dobrodošao, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Dobrodošao, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Dobrodošao, $username! Drago nam je što si ovde.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Dobrodošao, $username! Nadam se da ćeš uživati ovde.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Dobrodošao, $username! Tvoj sledeći razgovor počinje ovde.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Dobrodošao, $username. Srećni smo što si ovde.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Drago mi je što te vidim, $username! Dobrodošao.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Tu si, $username! Dobro je imati te sa nama.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Stigao si, $username! Hajde da počnemo.';
  }

  @override
  String get relativeTimeShortNow => 'sad';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}m',
      one: '1m',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}h',
      one: '1h',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}d',
      one: '1d',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}mo',
      one: '1mo',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}y',
      one: '1y',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Moji uređaji';

  @override
  String get linkedDevicesDescription =>
      'Pogledajte sve uređaje koji su trenutno prijavljeni na vaš nalog. Opozovite sve sesije koje ne prepoznajete.';

  @override
  String get linkedDevicesCurrentDevice => 'Trenutni uređaj';

  @override
  String get linkedDevicesOtherDevices => 'Ostali uređaji';

  @override
  String get linkedDevicesEnterSelection => 'Uđite u režim izbora';

  @override
  String get linkedDevicesExitSelection => 'Izađite iz režima izbora';

  @override
  String get linkedDevicesSelectAll => 'Izaberi sve';

  @override
  String get linkedDevicesClearSelection => 'Obriši izbor';

  @override
  String get linkedDevicesRevokeTooltip => 'Opozovi uređaj';

  @override
  String get linkedDevicesSignOutAll => 'Odjavite sve ostale uređaje';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odjavi $count uređaja',
      one: 'Odjavi 1 uređaj',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odjavi $count uređaja',
      one: 'Odjavi 1 uređaj',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Odjavite sve ostale uređaje';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ovo će odjaviti izabrane uređaje sa vašeg naloga. Moraćete ponovo da se prijavite na tim uređajima.',
      one:
          'Ovo će odjaviti izabrani uređaj sa vašeg naloga. Moraćete ponovo da se prijavite na tom uređaju.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Ovo će odjaviti izabrane uređaje sa vašeg naloga. Moraćete ponovo da se prijavite na tim uređajima.';

  @override
  String get linkedDevicesSignOutConfirm => 'Nastavi';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Moraćete ponovo da se prijavite na sve odjavljene uređaje';

  @override
  String get linkedDevicesLoadErrorTitle => 'Mrežna greška';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Imamo problema sa povezivanjem na prostor-vreme kontinuum. Proverite svoju vezu i pokušajte ponovo.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Uređaji opozvani',
      one: 'Uređaj opozvan',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Nije uspelo odjavljivanje. Pokušajte ponovo.';

  @override
  String get linkedDevicesUnknownOs => 'Nepoznat OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Nepoznata platforma';

  @override
  String slowmodeLabel(String duration) {
    return '$duration sporog režima';
  }

  @override
  String get slowmodeTooltipActive =>
      'U sporom ste režimu. Molimo vas sačekajte pre slanja nove poruke.';

  @override
  String get slowmodeTooltipImmune => 'Spori režim je omogućen, ali ste imuni.';

  @override
  String get channelNoSendPermissionHint =>
      'Ne možete slati poruke u ovom kanalu.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Sistemske najave od osoblja $productName. Ne možete odgovoriti ovde.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Slanje poruka je privremeno pauzirano u ovoj zajednici.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Isključeni ste. Slanje poruka, reakcije i glas su pauzirani dok ne istekne vreme isključenja.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Morate preuzeti svoj nalog da biste slali poruke u ovoj zajednici.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Morate potvrditi svoju e-poštu da biste slali poruke u ovoj zajednici.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Vaš nalog je previše nov za slanje poruka u ovoj zajednici.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Niste dovoljno dugo član ove zajednice da biste slali poruke.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Morate potvrditi broj telefona da biste slali poruke u ovoj zajednici.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Potvrdite e-poštu';

  @override
  String get channelComposerBarrierVerifyPhone => 'Potvrdite telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Previše priloga (maks. $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Jedna ili više datoteka premašuju ograničenje veličine';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Te datoteke su prevelike za slanje zajedno';

  @override
  String get chatAttachmentDropToUpload => 'Prevucite datoteke za otpremanje';

  @override
  String get chatAttachmentDropToSend => 'Prevucite datoteke za slanje odmah';

  @override
  String get chatAttachmentSendVoiceMessage => 'Pošalji glasovnu poruku';

  @override
  String get voiceMessageTitle => 'Glasovna poruka';

  @override
  String get voiceMessageHoldHint =>
      'Držite za snimanje. Prevucite nagore za zaključavanje ili otpustite za slanje.';

  @override
  String get voiceMessageDiscard => 'Odbaci glasovnu poruku';

  @override
  String get voiceMessageSend => 'Pošalji glasovnu poruku';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nije moguće započeti snimanje. Dozvolite pristup mikrofonu.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Snimanje glasa nije podržano na ovom uređaju.';

  @override
  String get voiceMessageMicInUse =>
      'Napustite glasovni poziv da biste snimili glasovnu poruku.';

  @override
  String get voiceMessageRecordingFailed =>
      'Snimanje nije uspelo. Pokušajte ponovo.';

  @override
  String get voiceMessageSendFailed =>
      'Nije moguće poslati glasovnu poruku. Pokušajte ponovo.';

  @override
  String get voiceMessageRecordingHint =>
      'Govorite sada. Pritisnite Stop kada završite — možete skratiti kasnije.';

  @override
  String get voiceMessageReviewHint =>
      'Prevucite drške za skraćivanje, a zatim pritisnite Pošalji.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Započni snimanje';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Pusti';

  @override
  String get voiceMessagePause => 'Pauziraj';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Izbor mora biti najmanje ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Uredi prilog';

  @override
  String get chatAttachmentFilenameLabel => 'Naziv datoteke';

  @override
  String get chatAttachmentDescriptionLabel => 'Opis';

  @override
  String get chatAttachmentDescriptionHint => 'Neobavezni alternativni tekst';

  @override
  String get chatAttachmentSpoilerLabel => 'Označi kao spojler';

  @override
  String get chatAttachmentRemove => 'Ukloni prilog';

  @override
  String get chatAttachmentDownload => 'Preuzmi';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Prilogu je istekao rok';

  @override
  String get chatAttachmentSourceGallery => 'Galerija';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Pretraži datoteke';

  @override
  String get chatAttachmentPasteTooltip => 'Nalepi sliku sa međuspremnika';

  @override
  String get chatAttachmentSpoiler => 'Spojler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Otkrij spojler';

  @override
  String get matureMediaRevealButton => 'Otkrij';

  @override
  String get matureMediaRevealHint => 'Kliknite da biste otkrili';

  @override
  String get matureContentTitle => 'Sadržaj za odrasle';

  @override
  String get matureCommunityTitle => 'Заједница за одрасле';

  @override
  String get matureCategoryTitle => 'Категорија за одрасле';

  @override
  String get matureChannelTitle => 'Канал за одрасле';

  @override
  String get communityContentWarningTitle => 'Упозорење на садржај заједнице';

  @override
  String get categoryContentWarningTitle => 'Упозорење на садржај категорије';

  @override
  String get channelContentWarningTitle => 'Упозорење на садржај канала';

  @override
  String get defaultContentWarningBody => 'Ово садржи осетљив садржај.';

  @override
  String get matureCommunityBody =>
      'Ова заједница је означена као садржај за одрасле и може да садржи материјал који можда није прикладан за неке кориснике.';

  @override
  String get matureCategoryBody =>
      'Ова категорија је означена као садржај за одрасле и може да садржи материјал који можда није прикладан за неке кориснике.';

  @override
  String get matureChannelBody =>
      'Овај канал је означен као садржај за одрасле и може да садржи материјал који можда није прикладан за неке кориснике.';

  @override
  String get matureVoiceChannelBody =>
      'Овај гласовни канал је означен као садржај за одрасле и може да садржи материјал који можда није прикладан за неке кориснике.';

  @override
  String get matureLinkChannelBody =>
      'Овај линк канал је означен као садржај за одрасле и може да отвори материјал који можда није прикладан за неке кориснике.';

  @override
  String get matureCommunityUnavailableBody =>
      'Ова заједница за одрасле није доступна вашем налогу.';

  @override
  String get matureCategoryUnavailableBody =>
      'Ова категорија за одрасле није доступна вашем налогу.';

  @override
  String get matureChannelUnavailableBody =>
      'Овај канал за одрасле није доступан вашем налогу.';

  @override
  String get matureContentProceedButton => 'Настави';

  @override
  String get matureContentUnderstandButton => 'Разумем';

  @override
  String get matureContentOpenLinkButton => 'Отвори линк';

  @override
  String get sensitiveContentSectionTitle => 'Осетљив садржај';

  @override
  String get sensitiveContentSectionDescription =>
      'Контролишите како се медијски садржај за одрасле или осетљив садржај филтрира у различитим контекстима';

  @override
  String get sensitiveContentFriendDmLabel => 'Директне поруке од пријатеља';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Директне поруке од других';

  @override
  String get sensitiveContentGuildLabel => 'Поруке у каналима заједнице';

  @override
  String get sensitiveContentFilterShow => 'Прикажи';

  @override
  String get sensitiveContentFilterBlur => 'Замути';

  @override
  String get sensitiveContentFilterBlock => 'Блокирај';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Замути медиј док се не заврши скенирање безбедности';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Када је омогућено, слике и видео снимци се замућују док се скенирање безбедности садржаја не заврши.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Ова поставка је увек укључена за ваш налог.';

  @override
  String get sensitiveContentResetButton => 'Ресетуј';

  @override
  String get sensitiveContentSaveButton => 'Сачувај';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count датотека',
      one: '1 датотеке',
    );
    return 'Отпремање $_temp0';
  }

  @override
  String get chatCancelUpload => 'Откажи отпремање';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Истиче $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Истиче између $start и $end';
  }

  @override
  String get connectionsTitle => 'Повезивања';

  @override
  String get connectionsDescription =>
      'Повежите спољне налоге и домене са својим Fluxer профилом. Потврђена повезивања ће бити приказана на вашем профилу да би их други видели.';

  @override
  String get connectionsEmptyTitle => 'Још увек нема повезивања';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Повежите свој Bluesky налог или верификујте власништво над доменом да бисте их приказали на свом профилу.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Верификујте власништво над доменом да бисте га приказали на свом профилу.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Домен';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Додај Bluesky повезивање';

  @override
  String get connectionsAddDomainAriaLabel => 'Додај повезивање домена';

  @override
  String get connectionEdit => 'Измени';

  @override
  String get connectionRemove => 'Уклони';

  @override
  String get connectionVerifiedLabel => 'Ово повезивање је верификовано.';

  @override
  String get connectionUnverifiedLabel => 'Ово повезивање није верификовано.';

  @override
  String get connectionAddTitle => 'Додај повезивање';

  @override
  String get connectionTypeLabel => 'Тип повезивања';

  @override
  String get connectionHandleLabel => 'Nalog';

  @override
  String get connectionDomainLabel => 'Domen';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Već imate ovu vezu.';

  @override
  String get connectionConnectBluesky => 'Poveži se sa Bluesky-jem';

  @override
  String get connectionContinue => 'Nastavi';

  @override
  String get connectionVerifyTitle => 'Potvrdi vezu';

  @override
  String get connectionVerifyInstructions =>
      'Koristite zapis ispod da biste dokazali vlasništvo nad domenom.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT zapis';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Vrednost';

  @override
  String get connectionCopyHost => 'Kopiraj host';

  @override
  String get connectionCopyValue => 'Kopiraj vrednost';

  @override
  String get connectionCopied => 'Kopirano!';

  @override
  String get connectionTokenFileTitle => 'Postavite token datoteku';

  @override
  String get connectionTokenFileDescription =>
      'Preuzmite **fluxer-verification** i postavite je u svoj **.well-known** folder kako bismo mogli da proverimo domen.';

  @override
  String get connectionTokenFileDownload => 'Preuzmi fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Datoteka sadrži token za verifikaciju koji ćemo preuzeti sa **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Sačuvaj fluxer-verification';

  @override
  String get connectionVerifyButton => 'Proveri';

  @override
  String get connectionBack => 'Nazad';

  @override
  String get connectionEditTitle => 'Uredi vezu';

  @override
  String get connectionEditDescription =>
      'Odaberite ko može da vidi ovu vezu na vašem profilu.';

  @override
  String get connectionVisibilityEveryone => 'Svi';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Dozvoli svima da vide ovu vezu na vašem profilu';

  @override
  String get connectionVisibilityFriends => 'Prijatelji';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Dozvoli prijateljima da vide ovu vezu';

  @override
  String get connectionVisibilityCommunityMembers => 'Članovi zajednice';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Dozvoli članovima zajednica u kojima ste da vide ovu vezu';

  @override
  String get connectionRemoveTitle => 'Ukloni vezu';

  @override
  String get connectionRemoveDescription =>
      'Da li ste sigurni da želite da uklonite ovu vezu? Ova akcija se ne može poništiti.';

  @override
  String get connectionRemoveConfirm => 'Ukloni';

  @override
  String get connectionsLoadError => 'Nije uspelo učitavanje veza';

  @override
  String get connectionsReorderError => 'Nije uspelo ažuriranje redosleda';

  @override
  String get connectionInitiateFailed =>
      'Nije moguće pokrenuti verifikaciju. Pokušajte ponovo.';

  @override
  String get connectionVerifyFailed =>
      'Nije moguće proveriti. Proverite svoj DNS zapis i pokušajte ponovo.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Nije moguće pokrenuti autorizaciju za Bluesky.';

  @override
  String get connectionUpdateFailed => 'Nije moguće ažurirati vezu';

  @override
  String get connectionRemoveFailed => 'Nije moguće ukloniti vezu';

  @override
  String get connectionTokenSavedToast => 'Sačuvano fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Nije moguće sačuvati datoteku';

  @override
  String get connectionEnterHandle => 'Unesite Bluesky nalog.';

  @override
  String get connectionEnterDomain => 'Unesite domen.';

  @override
  String get lookAndFeelTitle => 'Izgled i osećaj';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Birajte između tamnog, ugalj ili svetlog izgleda.';

  @override
  String get lookAndFeelThemeDark => 'Tamna tema';

  @override
  String get lookAndFeelThemeCoal => 'Tema ugalj';

  @override
  String get lookAndFeelThemeLight => 'Svetla tema';

  @override
  String get lookAndFeelThemeSystem => 'Sistemska tema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sinhronizuj temu na svim uređajima';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Kada je omogućeno, promene teme će se sinhronizovati na sve vaše uređaje. Kada je onemogućeno, ovaj uređaj će koristiti sopstveno podešavanje teme.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Sistemska tema automatski onemogućava sinhronizaciju kako bi pratila preferencije vašeg sistema na ovom uređaju.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Nismo uspeli da sinhronizujemo temu sa vašim nalogom. Molimo pokušajte ponovo.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Skaliranje fonta za ćaskanje';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Podesite veličinu fonta u oblasti za ćaskanje.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interfejs';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Prilagodite elemente i ponašanja interfejsa.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Pokazatelji kucanja u listi kanala';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Izaberite kako se pokazatelji kucanja prikazuju u listi kanala kada neko kuca u kanalu.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Pokazatelj kucanja + avatari';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Prikaži pokazatelj kucanja sa avatarima korisnika u listi kanala';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Samo pokazatelj kucanja';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Prikaži samo pokazatelj kucanja bez avatara';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Sakriveno';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Nemoj prikazivati pokazatelje kucanja u listi kanala';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Prikaži kucanje na izabranom kanalu';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Kada je onemogućeno (podrazumevano), pokazatelji kucanja se neće prikazivati na kanalu koji trenutno gledate.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Saveti za tastaturu';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Kontrolišite da li se saveti za prečice na tastaturi pojavljuju unutar alatki.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Sakrij savete za tastaturu u alatkama';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Kada je omogućeno, bedževi prečica se sakrivaju u iskačućim prozorima alatki.';

  @override
  String get lookAndFeelNekoTitle => 'Ostalo';

  @override
  String get lookAndFeelNekoDescription => 'Ostale opcije interfejsa.';

  @override
  String get lookAndFeelShowNekoLabel => 'Prikaži Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Kada je omogućeno, Neko se pojavljuje blizu trake za unos teksta u ćaskanju.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Ponašanje pri pridruživanju glasovnim kanalima';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Kontrolišite kako se pridružujete glasovnim kanalima u zajednicama.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Zahtevaj dvostruki klik za pridruživanje glasovnim kanalima';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Kada je omogućeno, moraćete dvostrukim klikom da se pridružite glasovnim kanalima. Kada je onemogućeno (podrazumevano), jednostruki klik će odmah pridružiti kanal.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Brzi smeđi pas skače preko lenjog psa.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Bočna traka zajednice';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigurišite kako bočna traka zajednice prikazuje direktne poruke.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count zajednica je privremeno nedostupno zbog kvara flux kondenzatora.',
      one: '1 zajednica je privremeno nedostupna zbog kvara flux kondenzatora.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Sažmi DM u fasciklu';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Kada je omogućeno, nepročitane DM poruke u bočnoj traci zajednice se sažimaju u fasciklu na dugmetu Fluxer. Kliknite na dugme Fluxer dok ste na stranici DM da biste proširili ili saželi fasciklu.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Lista kanala';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Kontrolišite ponašanje pokazatelja nepročitanih poruka za utišane kanale na listama kanala.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Prikaži pokazatelj nepročitanih poruka na utišanim kanalima';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Kada je omogućeno, utišani kanali prikazuju bled pokazatelj nepročitanih poruka sa leve strane. Pomenu će se i dalje pojavljivati bez obzira na ovo podešavanje.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktivni sada';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Kontrolišite kako se Aktivni sada prikazuje u aplikaciji.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Prikaži Aktivni sada na početnom ekranu';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Prikaži Aktivni sada na početnom ekranu da biste videli prijatelje aktivne u glasu. Videćete pregled, kontekst kanala, ko je već tamo i brz način da se pridružite.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Omiljeni';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Kontrolišite vidljivost omiljenih kanala širom aplikacije.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Omogući omiljene';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Kada je omogućeno, možete označiti kanale kao omiljene i oni će se pojaviti u odeljku Omiljeni. Kada je onemogućeno, svi elementi interfejsa povezani sa omiljenim (dugmad, stavke menija) biće sakriveni. Vaši postojeći omiljeni kanali će biti sačuvani.';

  @override
  String get favoritesTitle => 'Omiljeni';

  @override
  String get favoritesEmptyTitle => 'Još uvek nema omiljenih';

  @override
  String get favoritesEmptyDescription =>
      'Zvezdice kanala iz zaglavlja ćaskanja da biste ih zadržali ovde.';

  @override
  String get favoritesWelcomeTitle => 'Dobrodošli u omiljene';

  @override
  String get favoritesWelcomeDescription =>
      'Vaš lični prostor za brzi pristup kanalima, DM-ovima i grupama koje volite. Pritisnite zvezdicu na bilo kom kanalu da biste ga dodali ovde.';

  @override
  String get favoritesWelcomeTip =>
      'Nije za vas? Isključite ga kad god poželite.';

  @override
  String get favoritesDisableButton => 'Onemogući omiljene';

  @override
  String get favoritesAddedToast => 'Dodato u omiljene';

  @override
  String get favoritesRemovedToast => 'Uklonjeno iz omiljenih';

  @override
  String get favoritesHiddenToast => 'Omiljeni skriveni';

  @override
  String get favoritesMute => 'Isključi zvuk omiljenih';

  @override
  String get favoritesUnmute => 'Uključi zvuk omiljenih';

  @override
  String get favoritesHeaderMenu => 'Meni omiljenih';

  @override
  String get favoritesCreateCategory => 'Kreiraj kategoriju';

  @override
  String get favoritesCategoryNameLabel => 'Naziv kategorije';

  @override
  String get favoritesHideMutedChannels => 'Sakrij utišane kanale';

  @override
  String get favoritesShowMutedChannels => 'Prikaži utišane kanale';

  @override
  String get favoritesSetNickname => 'Postavi nadimak';

  @override
  String get favoritesNicknameLabel => 'Nadimak';

  @override
  String get favoritesSaveNickname => 'Sačuvaj nadimak';

  @override
  String get favoritesMoveToCategory => 'Premesti u kategoriju';

  @override
  String get favoritesUncategorized => 'Nekategorizovano';

  @override
  String get favoritesOtherCategory => 'Ostalo';

  @override
  String get favoritesRemoveFromFavorites => 'Ukloni iz omiljenih';

  @override
  String get favoritesAddToFavorites => 'Dodaj u omiljene';

  @override
  String get favoritesHideConfirmTitle => 'Sakrij omiljene';

  @override
  String get favoritesHideConfirmDescription =>
      'Ovo će sakriti sve elemente korisničkog interfejsa povezane sa omiljenima, uključujući dugmad i stavke menija. Vaši postojeći omiljeni će biti sačuvani i mogu se ponovo omogućiti u bilo kom trenutku iz Podešavanja > Napredno > Izgled.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direktna poruka';

  @override
  String get messagesMediaDisplayGroupTitle => 'Prikaz';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Kontrolišite kako se poruke, mediji i drugi sadržaj prikazuju.';

  @override
  String get messagesMediaMediaGroupTitle => 'Mediji';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Prilagodite postavke veličine medija i dugmad.';

  @override
  String get messagesMediaInputGroupTitle => 'Unos';

  @override
  String get messagesMediaInputGroupDescription =>
      'Prilagodite postavke unosa poruka.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Bočna traka';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigurišite kako se prikazuje bočna traka zajednice.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Sakrij utišane kanale podrazumevano';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automatski sakrij utišane kanale u bočnoj traci kada se pridružite novim zajednicama';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Podrazumevano sakriti utišane kanale?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Nove zajednice kojima se pridružite automatski će imati skrivene utišane kanale. Da li želite da primenite ovo podešavanje i na sve postojeće zajednice?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Prekinuti podrazumevano skrivanje utišanih kanala?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Nove zajednice kojima se pridružite više neće automatski skrivati utišane kanale. Da li želite da prikažete utišane kanale u svim postojećim zajednicama?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Primeni na sve zajednice';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Prikaži u svim zajednicama';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Samo nove zajednice';

  @override
  String get messagesMediaDisplaySectionTitle => 'Prikaz medija';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Kontrolišite kako se slike, video snimci i drugi mediji prikazuju. Svi mediji se preveličavaju i konvertuju. Izuzetno veliki fajlovi koji se ne mogu komprimovati u pregled neće biti ugrađeni bez obzira na ova podešavanja.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Kada se postavljaju kao linkovi u ćaskanje';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Kada se otpremaju direktno u Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Pregledi linkova';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Kontrolišite kako se linkovi veb-sajtova pregledaju u ćaskanju';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Prikaži ugrađene elemente i pregledaj linkove veb-sajtova';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakcije';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfiguriši emoji reakcije na poruke';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Prikaži emoji reakcije na poruke';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Sadržaj spojlera';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Kontroliši kako se prikazuje sadržaj spojlera';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Prikaži sadržaj spojlera';

  @override
  String get messagesMediaSpoilersOnClickName => 'Na klik';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Prikaži sadržaj spojlera kada se klikne';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'U kanalima kojima moderiram';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Uvek prikazuj sadržaj spojlera u kanalima gde imaš dozvolu „Upravljanje porukama“';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Uvek';

  @override
  String get messagesMediaSpoilersAlwaysDescription => 'Uvek prikazuj spojlere';

  @override
  String get messagesMediaSizeSectionTitle => 'Preferencije veličine medija';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Prilagodi maksimalnu veličinu prikaza za ugrađene i priložene medije. Manje veličine zauzimaju manje prostora, dok veće prikazuju više detalja.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Mediji sa linkova (ugrađeni)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Prilozi otpremljeni';

  @override
  String get messagesMediaSizeCompactName => 'Kompaktan (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Manja veličina medija';

  @override
  String get messagesMediaSizeComfortableName => 'Udoban (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Veća veličina medija sa više detalja';

  @override
  String get messagesMediaGifsSectionTitle => 'Ponašanje GIF-ova';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Kontroliši kako se GIF-ovi ubacuju u ćaskanje';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automatski šalji GIF-ove kada su izabrani';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Automatsko dovršavanje izraza (automatsko dovršavanje dvotačke)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Kontroliši šta se pojavljuje u automatskom dovršavanju izraza kada ukucaš dvotačku. Prilagodi koje se sugestije prikazuju da odgovaraju tvojim željama.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Prikaži podrazumevane emoji sličice u automatskom dovršavanju izraza';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Prikaži prilagođene emoji sličice u automatskom dovršavanju izraza';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Prikaži nalepnice u automatskom dovršavanju izraza';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Prikaži sačuvane medije u automatskom dovršavanju izraza';

  @override
  String get messagesMediaEditingSectionTitle => 'Uređivanje poruka';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Kontroliši šta se dešava sa nacrtom izmene kada otkažeš.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Sačuvaj nacrt izmene prilikom otkazivanja';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Pokazatelji nepročitanih';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Kontroliši kako se prikazuju pokazatelji nepročitanih poruka.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Prikaži izbledeli pokazatelj nepročitanih u utišanim kanalima';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Prikaži zatamnjeni pokazatelj nepročitanih pored utišanih direktnih poruka i kanala kako bi i dalje mogao na brzinu da vidiš kada postoji aktivnost.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'Pregledi DM poruka';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Kontroliši kada se pregledi poruka prikazuju na DM listi.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Režim pregleda DM poruka';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Sve poruke';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Prikaži preglede poruka za sve DM konverzacije';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Samo nepročitane DM poruke';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Prikaži preglede poruka samo za DM poruke sa nepročitanim porukama';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nijedno';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ne prikazuj preglede poruka na DM listi';

  @override
  String get accessibilityMediaButtonsGroupTitle => 'Media Buttons';

  @override
  String get accessibilityMediaButtonsGroupDescription =>
      'Customize which buttons appear on media attachments and embeds.';

  @override
  String get accessibilityShowMediaDeleteButtonLabel => 'Show delete button';

  @override
  String get accessibilityShowMediaDownloadButtonLabel =>
      'Show download button';

  @override
  String get accessibilityShowMediaFavoriteButtonLabel =>
      'Show favorite button';

  @override
  String get accessibilityShowSuppressEmbedsButtonLabel =>
      'Show suppress embeds button';

  @override
  String get dmListSentAnAttachment => 'Poslat je prilog';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username je prikovao poruku u ovaj kanal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username je dodao/la $userName u grupu.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username je nekoga dodao/la u grupu.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username je napustio/la grupu.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username je uklonio $userName iz grupe.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username je uklonio nekoga iz grupe.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username je promenio ime kanala u $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username je promenio ime kanala.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username je promenio ikonicu kanala.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username je započeo poziv.';
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
  String get voiceConnectionConfirmTitle => 'Potvrda glasovne veze';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Već ste povezani na ovaj glasovni kanal sa $count drugih uređaja. Šta želite da uradite?',
      one:
          'Već ste povezani na ovaj glasovni kanal sa 1 drugog uređaja. Šta želite da uradite?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Prebaci na ovaj uređaj';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Samo se pridruži (zadrži ostale veze)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ne radi ništa, ne želim da se pridružim';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Ovo je glasovni kanal. Povežite se da biste počeli da pričate!';

  @override
  String get voiceChannelJoin => 'Pridruži se glasovnom kanalu';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Poveži se na glasovni';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nemate dozvolu da se pridružite ovom glasovnom kanalu';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon, kamera i sadržaj deljenja ekrana su end-to-end enkriptovani.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon, kamera i sadržaj deljenja ekrana su end-to-end enkriptovani.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end enkripcija nije dostupna jer je nepodržani učesnik u ovom glasovnom kanalu.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end enkripcija nije dostupna jer je nepodržani učesnik u ovom pozivu.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Ovaj klijent mora biti ažuriran pre pridruživanja ovom enkriptovanom pozivu.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nismo mogli da pokrenemo vaš mikrofon. Ostajete u pozivu.';

  @override
  String get voiceChannelStatusConnecting => 'Povezivanje…';

  @override
  String get voiceChannelStatusConnected => 'Povezano';

  @override
  String get voiceChannelStatusError => 'Greška';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobilni uređaj';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Desktop uređaj';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Zajednica je utišala';

  @override
  String get voiceParticipantTooltipMuted => 'Utišano';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Zajednica je oglušila';

  @override
  String get voiceParticipantTooltipDeafened => 'Oglušen';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Veza: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count učesnika',
      one: '1 učesnik',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Napusti';

  @override
  String get voiceControlMute => 'Utišaj';

  @override
  String get voiceControlUnmute => 'Otišaj';

  @override
  String get voiceControlDeafen => 'Oglušaj';

  @override
  String get voiceControlUndeafen => 'Oglušaj';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Deli ekran';

  @override
  String get voiceScreenShareNotificationText => 'Deli se vaš ekran.';

  @override
  String get voiceControlMore => 'Više';

  @override
  String get voiceControlDisconnect => 'Prekini vezu';

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
  String get voiceControlChat => 'Ćaskanje';

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
  String get voiceTextChatShow => 'Prikaži ćaskanje';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# nepročitanih poruka',
      one: '# nepročitanom porukom',
    );
    return 'Prikaži ćaskanje sa $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Potrebna je dozvola za kameru za video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nismo mogli da pokrenemo deljenje ekrana. Molimo pokušajte ponovo.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Dozvola za deljenje ekrana je odbijena.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Deljenje ekrana nije dostupno na ovom uređaju.';

  @override
  String get voiceWatchStream => 'Gledaj strim';

  @override
  String get voiceStopWatching => 'Престани да гледаш';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Престани да гледаш тренутни стрим';

  @override
  String get voiceOwnScreenShareTitle => 'Емитујеш';

  @override
  String get voiceOwnScreenShareSubtitle => 'Твој стрим је уживо за учеснике.';

  @override
  String get voiceLiveBadge => 'УЖИВО';

  @override
  String get dmVoiceViewCall => 'Прикажи позив';

  @override
  String get dmVoiceCallFullScreen => 'Цео екран';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Отвори позив на целом екрану';

  @override
  String get dmVoiceStripStatusConnecting => 'Повезивање...';

  @override
  String get dmVoiceStripStatusInCall => 'На позиву';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Гласовни позив';

  @override
  String get dmVoiceCallBarConnecting => 'Повезивање...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Директан позив';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Групни позив';

  @override
  String get dmVoiceCallBarIssueFallback => 'Проблем са гласом';

  @override
  String get dmVoiceFullscreenTitle => 'Глас';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Глас повезан';

  @override
  String get notificationsPageTitle => 'Обавештења';

  @override
  String get notificationsFilterUnreads => 'Непрочитана';

  @override
  String get notificationsFilterMentions => 'Помињања';

  @override
  String get notificationsBookmarksTooltip => 'Ознаке';

  @override
  String get notificationsMentionFilterTooltip => 'Филтрирај помињања';

  @override
  String get notificationsMentionFiltersTitle => 'Филтери помињања';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Укључи помињања @everyone и @here';

  @override
  String get notificationsMentionIncludeRoles => 'Укључи помињања улога';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Укључи сва помињања заједнице';

  @override
  String get notificationsNoUnreadTitle => 'Нема непрочитаних порука';

  @override
  String get notificationsNoUnreadBody => 'Све сте прочитали.';

  @override
  String get notificationsNoMentionsTitle => 'Нема недавних помињања';

  @override
  String get notificationsNoMentionsBody =>
      'Сва помињања вас ће се појавити овде 7 дана.';

  @override
  String get notificationsMentionsEndTitle => 'Стигли сте до краја';

  @override
  String get notificationsMentionsEndBody =>
      'Видели сте сва своја недавна помињања. Не брините, ускоро ће се појавити још.';

  @override
  String get notificationsJump => 'Пређи';

  @override
  String get notificationsRemoveMentionTooltip => 'Уклони помињање';

  @override
  String get notificationsViewAllUnread => 'Прикажи сва непрочитана';

  @override
  String get notificationsMarkAsRead => 'Означи као прочитано';

  @override
  String get notificationsExpand => 'Прошири';

  @override
  String get notificationsCollapse => 'Склопи';

  @override
  String get notificationsMessageUnavailable =>
      'Ова порука није могла да се учита.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining знакова преостало';
  }

  @override
  String get characterCounterTooLong => 'Порука је предугачка';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining знакова преостало. Набавите $productName да бисте писали до $premiumMaxLength знакова.';
  }

  @override
  String get chatMessageFailedToSend => 'Порука није могла да се пошаље';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Ваша порука није могла бити достављена. Обично је то зато што не делите заједницу са примаоцем или прималац прима директне поруке само од пријатеља. Можда ћете такође морати да прилагодите сопствена подешавања приватности директних порука у оквиру $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Ваша порука није могла бити достављена. Морате да затражите свој налог да бисте слали директне поруке.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Ваша порука није могла бити достављена. Морате да затражите свој налог да бисте слали поруке.';

  @override
  String get chatSendFailureContentBlocked =>
      'Ваша порука није могла бити достављена јер ју је блокирао наш систем безбедности. Ако верујете да је ово грешка, контактирајте подршку.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Ваша порука није могла бити достављена јер садржи експлицитне емоџије или налепнице које нису дозвољене у овом контексту.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Само ви можете да видите ову поруку.';

  @override
  String get chatClientSystemDismiss => 'Одбаци';

  @override
  String get privacyDashboardCommunicationSection => 'Комуникација';

  @override
  String get chatMessageDeleteFailed => 'Неуспешно брисање';

  @override
  String get chatMessageAddReaction => 'Додај реакцију';

  @override
  String get chatMessageEdit => 'Измени поруку';

  @override
  String get chatMessageReply => 'Одговори';

  @override
  String get chatMessageForward => 'Проследи';

  @override
  String get forwardMessageTitle => 'Проследи поруку';

  @override
  String get forwardSearchHint => 'Претражи канале или директне поруке';

  @override
  String get forwardDirectMessagesSection => 'Директне поруке';

  @override
  String get forwardCommentHint => 'Додај коментар (опционо)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Пошаљи ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Ниједан канал није пронађен';

  @override
  String get forwardSuccessToast => 'Порука је прослеђена';

  @override
  String get forwardFailed => 'Није успело прослеђивање поруке';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Коментари нису доступни јер је успорен режим омогућен у изабраном каналу.';

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
  String get forwardDestinationNoSendPermission =>
      'Не можете слати поруке овде';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Не можете уграђивати везе овде';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Не можете приложити фајлове овде';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Слање порука је онемогућено у овој заједници';

  @override
  String get forwardDestinationTimedOut => 'На паузи сте у овој заједници';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Успорен режим - сачекајте $remaining';
  }

  @override
  String get chatMessageCopyText => 'Копирај поруку';

  @override
  String get chatMessagePin => 'Закачи поруку';

  @override
  String get chatMessageUnpin => 'Откaчи поруку';

  @override
  String get chatMessageUnpinIt => 'Откaчи је';

  @override
  String get chatMessageBookmark => 'Додај поруку у обележиваче';

  @override
  String get chatMessageRemoveBookmark => 'Уклони из обележивача';

  @override
  String get chatMessageMarkAsUnread => 'Означи као непрочитано';

  @override
  String get chatMessageCopyMessageLink => 'Копирај линк поруке';

  @override
  String get chatMessageCopyMessageId => 'Копирај ID поруке';

  @override
  String get chatMessageViewReactions => 'Прикажи реакције';

  @override
  String get chatMessageRemoveAllReactions => 'Уклони све реакције';

  @override
  String get chatMessageDebug => 'Дебаг поруке';

  @override
  String get chatMessageDebugSheetTitle => 'Дебаг поруке';

  @override
  String get chatMessageDebugCopyJson => 'Копирај JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON поруке је копиран у клипборд';

  @override
  String get chatReactionsSheetTitle => 'Реакције';

  @override
  String get chatReactionsSheetEmpty => 'Још увек се нико није реактовао.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Пријави поруку';

  @override
  String get iarReportMessageTitle => 'Пријави поруку';

  @override
  String get iarThisUserFallback => 'овог корисника';

  @override
  String get iarModalDescription =>
      'Пријави кршење правила или пронађи алате за управљање контактима и подешавањима.';

  @override
  String get iarPathStepAriaLabel => 'Шта вам је потребно?';

  @override
  String get iarCategoryStepTitle => 'Која врста правила је прекршена?';

  @override
  String get iarReasonStepTitle => 'Које правило је прекршено?';

  @override
  String get iarReasonSelectHint => 'Изабери разлог';

  @override
  String get iarPickAnOptionToast => 'Изабери опцију за наставак.';

  @override
  String get iarPickARuleToast => 'Изабери правило које је прекршено.';

  @override
  String get iarPathPlatform => 'Пријави кршење правила платформе';

  @override
  String get iarPathCommunity => 'Пријави модераторима ове заједнице';

  @override
  String get iarPathPreferenceMessage => 'Не ми се свиђа овај садржај';

  @override
  String get iarCategoryTargetedHarmLabel => 'Претње, узнемиравање или штета';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Насиље, претње, говор мржње, рације или садржај који подстиче самоповређивање.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Безбедност деце или садржај за одрасле';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Деца у опасности, садржај за одрасле на погрешном месту или непожељно понашање.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Приватност или имитација';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Објављивање личних података, праћење, представљање као неко други или неприкладан профил.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Преваре, злонамерни софтвер или дезинформације';

  @override
  String get iarCategoryDeceptionDescription =>
      'Фишинг, преваре, злонамерни линкови или лажне тврдње које могу проузроковати штету у стварном свету.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Незаконита активност или нешто друго';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Незаконита продаја, олакшавање криминала или јасно кршење правила које се не уклапа у горње категорије.';

  @override
  String get iarReasonHarassmentLabel => 'Узнемиравање или претње';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Задиркивање, понављано нежељено контактирање, праћење или циљано злостављање.';

  @override
  String get iarReasonHateLabel => 'Говор мржње';

  @override
  String get iarReasonHateMessageDescription =>
      'Увреде, дехуманизујући језик или напади на заштићене групе.';

  @override
  String get iarReasonViolenceLabel => 'Насиље или претње насиљем';

  @override
  String get iarReasonViolenceDescription =>
      'Кредибилне претње, графичко насиље или величање насиља.';

  @override
  String get iarReasonMatureContentLabel =>
      'Садржај за одрасле или узнемиравање';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Непожељно понашање или садржај за одрасле на погрешном месту.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Безбедност деце или експлоатација малолетника';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Садржај који се односи на педофилију или експлоатацију деце.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Штетне дезинформације';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Лажне тврдње које могу проузроковати штету у стварном свету.';

  @override
  String get iarReasonSpamLabel => 'Спам, преваре или фишинг';

  @override
  String get iarReasonSpamMessageDescription =>
      'Масовни спам, преваре, лажни поклони или злоупотреба налога.';

  @override
  String get iarReasonMalwareLabel => 'Злонамерни софтвер или опасни линкови';

  @override
  String get iarReasonMalwareDescription =>
      'Злонамерни софтвер, крађа акредитива или штетне датотеке.';

  @override
  String get iarReasonPrivacyLabel => 'Кршење приватности';

  @override
  String get iarReasonPrivacyDescription =>
      'Објављивање личних података, откривање приватних информација или праћење.';

  @override
  String get iarReasonImpersonationLabel => 'Имитација или обмањујући медији';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Представљање као неко други, укључујући обмањујући садржај генерисан од стране вештачке интелигенције.';

  @override
  String get iarReasonIllegalLabel => 'Незаконита активност';

  @override
  String get iarReasonIllegalDescription =>
      'Незаконита продаја, олакшавање криминала или незаконита активност.';

  @override
  String get iarReasonSelfHarmLabel => 'Самоповређивање или самоубиство';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Промоција или упутства која подстичу самоповређивање или поремећаје у исхрани.';

  @override
  String get iarReasonOtherLabel => 'Друго јасно кршење правила';

  @override
  String get iarReasonOtherDescription =>
      'Користите само ако јасно крши правила Fluxer-а и не уклапа се у горње категорије.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Ако је укључен малолетник, користите \"$childSafetyReason\" уместо тога.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Ако се ради о ЦСАМ-у или експлоатацији малолетника, пошаљите ово одмах и немојте поново делити материјал.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Ако је неко у непосредној опасности, контактирајте локалне хитне службе ако то можете безбедно да урадите.';

  @override
  String get iarSafetyNoteViolence =>
      'Ако се ради о кредибилној непосредној претњи, такође контактирајте локалне хитне службе.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Ако се ради о непосредној терористичкој претњи, такође контактирајте локалне хитне службе.';

  @override
  String get iarActionBlockUserTitle => 'Блокирај овог корисника';

  @override
  String get iarActionBlockUserDescription =>
      'Заустави поруке и захтеве за пријатељство.';

  @override
  String get iarActionBlockUserButton => 'Блокирај';

  @override
  String get iarActionCopyMessageLinkTitle => 'Копирај линк поруке';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Подели са модераторима заједнице.';

  @override
  String get iarActionCopyMessageLinkButton => 'Копирај';

  @override
  String get iarActionCloseDmTitle => 'Затвори овај директан разговор';

  @override
  String get iarActionCloseDmDescription =>
      'Не блокира. Можете поново отворити касније.';

  @override
  String get iarActionCloseDmButton => 'Затвори приватну поруку';

  @override
  String get iarActionLeaveCommunityTitle => 'Напусти заједницу';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Престани да видиш њен садржај и чланове.';

  @override
  String get iarActionLeaveCommunityButton => 'Напусти';

  @override
  String get iarActionDmSettingsTitle =>
      'Поставке приватних порука и захтева за пријатељство';

  @override
  String get iarActionDmSettingsDescription =>
      'Промени ко може да те контактира.';

  @override
  String get iarActionCallSettingsTitle =>
      'Поставке позива и групних разговора';

  @override
  String get iarActionCallSettingsDescription =>
      'Промени ко може да те позива или додаје.';

  @override
  String get iarActionOpenButton => 'Отвори';

  @override
  String get iarActionDeleteMessageTitle => 'Избриши ову поруку';

  @override
  String get iarActionDeleteMessageDescription => 'Уклони је из канала за све.';

  @override
  String get iarActionDeleteMessageButton => 'Избриши';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Избрисано';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Ова порука је већ избрисана.';

  @override
  String get iarActionBanUserTitle => 'Забрани овом кориснику приступ';

  @override
  String get iarActionBanUserDescription =>
      'Отвори дијалог за забрану приступа овој заједници.';

  @override
  String get iarActionBanUserButton => 'Забрани';

  @override
  String get iarActionBanUserBannedButton => 'Забрањен';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Овом кориснику је већ забрањен приступ заједници.';

  @override
  String get iarCloseDmConfirmTitle => 'Затвори приватну поруку';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Затвори тренутну приватну поруку са $name. Ово их неће блокирати; можете поново да је отворите касније.';
  }

  @override
  String get iarSuccessTitle => 'Пријава послата';

  @override
  String get iarSuccessBody =>
      'Наш безбедносни тим је прегледа га. Послаћемо вам приватну поруку и е-пошту када донесемо одлуку.';

  @override
  String get iarAlreadyReportedTitle => 'Већ пријављено';

  @override
  String get iarAlreadyReportedBody =>
      'Већ сте пријавили ову поруку. Наш безбедносни тим је прегледа га.';

  @override
  String get iarBackButton => 'Назад';

  @override
  String get iarContinueButton => 'Настави';

  @override
  String get iarSendReportButton => 'Пошаљи пријаву';

  @override
  String get iarDoneButton => 'Готово';

  @override
  String get iarCouldntSendToast =>
      'Није успело слање пријаве. Покушајте поново.';

  @override
  String get iarRateLimitedToast =>
      'Пребрзо пријављујете. Сачекајте тренутак и покушајте поново.';

  @override
  String get iarReportSentToast =>
      'Пријава послата. Наш безбедносни тим ће је прегледати.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Блокирати $name? Неће моћи да вам шаље поруке нити захтеве за пријатељство. Можете их деблокирати касније.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Није успело блокирање овог корисника. Покушајте поново.';

  @override
  String get iarCloseDmSuccessToast => 'Приватна порука затворена.';

  @override
  String get iarCloseDmFailedToast =>
      'Није успело затварање ове приватне поруке. Покушајте поново.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Није успело напуштање ове заједнице. Покушајте поново.';

  @override
  String get chatMessageSuppressEmbeds => 'Сузбиј уграђене елементе';

  @override
  String get chatMessageUnsuppressEmbeds => 'Омогући уграђене елементе';

  @override
  String get chatMessageDelete => 'Избриши поруку';

  @override
  String get chatMessageDeleteConfirmTitle => 'Избриши поруку';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Да ли сте сигурни да желите да избришете ову поруку?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Још';

  @override
  String get chatEditingMessage => 'Измена поруке';

  @override
  String get chatReplyOriginalDeleted => 'Оригинална порука је избрисана';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Оригинална порука није могла да се учита';

  @override
  String get chatReplyAttachedMedia => 'Порука садржи приложен медиј';

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
  String get chatMessagesLoadError => 'Није успело учитавање порука.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Прескочити подешавање обавештења?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'Корисник $authorNickname више воли да буде обавештен @помињањем у одговорима. Ипак послати без обавештења?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname preferuje odgovore bez pomena. Pošalji sa pomenom uprkos tome?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignoriši preferencu';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Kliknite da biste onemogućili obaveštavanje korisnika na koga odgovarate.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Kliknite da biste omogućili obaveštavanje korisnika na koga odgovarate.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Pomeni korisnika na koga odgovarate';

  @override
  String get chatReplyMentionOn => 'Uključeno';

  @override
  String get chatReplyMentionOff => 'Isključeno';

  @override
  String get chatReplyCancel => 'Otkaži odgovor';

  @override
  String get chatEditMessageHint => 'Uredi poruku';

  @override
  String get chatEditNoChanges => 'Nema promena za čuvanje';

  @override
  String get chatChannelNotReady =>
      'Ovaj kanal još uvek nije spreman. Pokušajte ponovo za trenutak.';

  @override
  String get chatMessageEdited => '(uređeno)';

  @override
  String get chatMessageSilent => 'Ovo je bila @silent poruka.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Danas u $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Juče u $time';
  }

  @override
  String get mediaViewerImagePreview => 'Pregled slike';

  @override
  String get mediaViewerClose => 'Zatvori pregledač medija';

  @override
  String get mediaViewerOpenInBrowser => 'Otvori u pregledaču';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Prosledi';

  @override
  String get mediaViewerZoomIn => 'Uvećaj';

  @override
  String get mediaViewerZoomOut => 'Umanji';

  @override
  String get mediaViewerPreviousAttachment => 'Prethodni prilog';

  @override
  String get mediaViewerNextAttachment => 'Sledeći prilog';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls =>
      'Prikaži/sakrij kontrole video snimka';

  @override
  String get chatAttachmentVideoMute => 'Isključi zvuk video snimka';

  @override
  String get chatAttachmentVideoUnmute => 'Uključi zvuk video snimka';

  @override
  String get chatAttachmentVideoPlay => 'Pusti video snimak';

  @override
  String get chatAttachmentVideoPause => 'Pauziraj video snimak';

  @override
  String get chatAttachmentVideoProgress => 'Napredak video snimka';

  @override
  String get chatVideoPlaybackFailed =>
      'Nije moguće reprodukovati ovaj video snimak.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Obavesti korisnike sa ovom ulogom koji imaju dozvolu da vide ovaj kanal.';

  @override
  String get addGuildModalTitle => 'Dodaj zajednicu';

  @override
  String get addGuildModalLandingDescription =>
      'Kreiraj novu zajednicu ili se pridruži postojećoj.';

  @override
  String get addGuildCreateCommunity => 'Kreiraj zajednicu';

  @override
  String get addGuildJoinCommunity => 'Pridruži se zajednici';

  @override
  String get addGuildImportDiscordTemplate => 'Uvezi Discord predložak';

  @override
  String get addGuildJoinTitle => 'Pridruži se zajednici';

  @override
  String get addGuildJoinDescription =>
      'Unesite link za poziv da biste se pridružili zajednici.';

  @override
  String get addGuildInviteLinkLabel => 'Link za poziv';

  @override
  String get addGuildJoinSubmit => 'Pridruži se zajednici';

  @override
  String get addGuildInviteInvalid => 'Ovaj poziv je nevažeći ili je istekao.';

  @override
  String get addGuildJoinFailed =>
      'Nije moguće pridružiti se zajednici. Pokušajte ponovo.';

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
  String get addGuildPackInstalled => 'Paket je uspešno instaliran.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'Ukloni sve reakcije';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Da li ste sigurni da želite da uklonite sve reakcije sa ove poruke?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Ukloni zakačenu poruku';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Da li želite da vratite ovu zakačenu poruku u prošlost?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username je zakačio $messageLink u ovaj kanal. Pogledajte $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'poruku';

  @override
  String get systemPinMessageAllPinsLink => 'sve zakačene poruke';

  @override
  String get channelPinsEmptyTitle => 'Nema prikačenih poruka';

  @override
  String get channelPinsEmptyDescription =>
      'Prikačene poruke se prikazuju ovde.';

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
  String get personalNotesTitle => 'Lične beleške';

  @override
  String get personalNotesSubtitle =>
      'Vaš privatni prostor za misli i podsetnike';

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
    return 'Dobrodošli u $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'U početku, nije bilo ničega. Zatim, postojao je $channelName. I bilo je dobro.';
  }

  @override
  String get personalNotesComposerHint => 'Pošaljite poruku sebi';

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
  String get personalNotesPrivateSpace => 'Vaš privatni prostor';

  @override
  String get purgePersonalNotes => 'Obriši lične beleške';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Ovo će trajno izbrisati svaku poruku i prilog u vašim ličnim beleškama. Ovo se ne može poništiti.';

  @override
  String get purgePersonalNotesConfirmButton => 'Obriši';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Obrisano $count poruka iz ličnih beleški';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Lične beleške su već bile prazne';

  @override
  String get purgePersonalNotesFailed => 'Nije moguće obrisati lične beleške';

  @override
  String get userSettingsGroupYourAccount => 'VAŠ NALOG';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Bezbednost i prijava';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Pokloni i kodovi';

  @override
  String get userSettingsNavPrivacyDashboard => 'Kontrolna tabla privatnosti';

  @override
  String get userSettingsNavAuthorizedApps => 'Autorizovane aplikacije';

  @override
  String get userSettingsNavBlockedUsers => 'Blokirani korisnici';

  @override
  String get userSettingsNavLinkedDevices => 'Povezani uređaji';

  @override
  String get userSettingsNavConnections => 'Konekcije';

  @override
  String get userSettingsNavLookAndFeel => 'Izgled';

  @override
  String get userSettingsNavAccessibility => 'Pristupačnost';

  @override
  String get userSettingsNavChat => 'Poruke i mediji';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio i video';

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
  String get userSettingsNavLanguageAndTime => 'Jezik i vreme';

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
  String get userSettingsNavAdvanced => 'Napredno';

  @override
  String get advancedPerformanceReportingTitle =>
      'Izveštavanje o performansama';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Pomozite poboljšanju Fluxera deljenjem anonimnih podataka o padovima i performansama.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Šalji izveštaje o padovima i performansama';

  @override
  String get advancedPerformanceReportingDescription =>
      'Svi prijavljeni podaci su anonimni i šalju se samo sopstvenoj servisnoj službi za nadzor Fluxera — ne koriste se provajderi trećih strana.';

  @override
  String get userSettingsNavApplications => 'Aplikacije';

  @override
  String get userSettingsNavAppLogs => 'Logovi aplikacije';

  @override
  String get userSettingsNavDeveloperTools => 'Alatke za razvojne programere';

  @override
  String get userSettingsNavLimitsConfig => 'Konfiguracija ograničenja';

  @override
  String get userSettingsNavFeatureFlags => 'Funkcijske zastavice';

  @override
  String get userSettingsNavWhatsNew => 'Šta je novo';

  @override
  String get userSettingsNavLogOut => 'Odjava';

  @override
  String get betaWarningTitle => 'Beta softver';

  @override
  String get betaWarningMessage =>
      'Ovo je beta softver. Nije sve završeno ili dodato.';

  @override
  String get betaWarningReportIssues =>
      'Molimo prijavite sve probleme koje pronađete zajednici Fluxer Mobile (morate imati Plutonium da biste trenutno mogli da se pridružite zajednici).';

  @override
  String get betaWarningRepoLink => 'Prikaži izvor na GitHub-u';

  @override
  String get betaWarningGotIt => 'Razumem';

  @override
  String get quickSwitcherTabSearch => 'Pretraga';

  @override
  String get quickSwitcherTabFriends => 'Prijatelji';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Pretraži kanale, ljude ili zajednice';

  @override
  String get quickSwitcherSearchFriends => 'Pretraži prijatelje';

  @override
  String get quickSwitcherNoMatchesFound => 'Nema rezultata';

  @override
  String get quickSwitcherEmptyHint =>
      'Probaj drugo ime ili koristi prefikse @ / # / ! / * za filtriranje rezultata.';

  @override
  String get quickSwitcherSectionPeople => 'Ljudi';

  @override
  String get quickSwitcherSectionGroupMessages => 'Grupne poruke';

  @override
  String get quickSwitcherSectionTextChannels => 'Tekstualni kanali';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Glasovni kanali';

  @override
  String get quickSwitcherSectionCommunities => 'Zajednice';

  @override
  String get quickSwitcherSectionSettings => 'Podešavanja';

  @override
  String get quickSwitcherHomeLabel => 'Početna';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direktne poruke';

  @override
  String get quickSwitcherFavoritesLabel => 'Omiljeno';

  @override
  String get quickSwitcherUserSettingsLabel => 'Korisnička podešavanja';

  @override
  String get quickSwitcherNotificationsLabel => 'Obaveštenja';

  @override
  String get quickSwitcherBookmarksLabel => 'Obeleživači';

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
  String get quickSwitcherMentionsLabel => 'Pomenuća';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Još nemaš prijatelje';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Dodaj prijatelja da počneš.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nijedan prijatelj ne odgovara pretrazi';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Probaj drugo ime.';

  @override
  String get quickSwitcherSearchAliasUser => 'Korisnik';

  @override
  String get quickSwitcherSearchAliasYou => 'Ti';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM-ovi';

  @override
  String get quickSwitcherSearchAliasMessages => 'Poruke';

  @override
  String get quickSwitcherSearchAliasFav => 'Omiljeni';

  @override
  String get quickSwitcherSearchAliasStarred => 'Obeleženo';

  @override
  String get quickSwitcherSearchAliasInbox => 'Inbox';

  @override
  String get quickSwitcherSearchAliasSaved => 'Sačuvano';

  @override
  String get uiClose => 'Zatvori';

  @override
  String get chatJumpToBottom => 'Skoči na dno';

  @override
  String get uiConfirm => 'Potvrdi';

  @override
  String get uiLoading => 'Učitavanje';

  @override
  String get uiUnsavedChanges => 'Neočuvane promene';

  @override
  String get uiReset => 'Poništi';

  @override
  String get uiOpenColorPicker => 'Otvori birač boja';

  @override
  String get uiSelectPlaceholder => 'Izaberi';

  @override
  String get uiSearchPlaceholder => 'Pretraži';

  @override
  String get uiNoOptionsFound => 'Nema opcija';

  @override
  String get uiDismissNotification => 'Odbaci obaveštenje';

  @override
  String get uiColorPickerTitle => 'Birač boja';

  @override
  String get mentionConfirmTitle => 'Svi da se pomenu?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Ovo će obavestiti $count članova. Nastaviti?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Ovo će obavestiti $count članova na mreži. Nastaviti?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Pomeni';

  @override
  String get composerEmojiUnavailable => 'Ne možeš koristiti taj emoji ovde.';

  @override
  String get instanceUrlLabel => 'URL instance';

  @override
  String get instanceUrlPlaceholder => 'Unesite URL instance (npr. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Vrati na Fluxer';

  @override
  String get instanceConnect => 'Poveži';

  @override
  String get instanceConnecting => 'Povezivanje…';

  @override
  String get instanceConnectFailed => 'Povezivanje sa instancom nije uspelo';

  @override
  String get recentInstances => 'Nedavne instance';

  @override
  String removeRecentInstance(String domain) {
    return 'Ukloni $domain sa liste nedavnih instanci';
  }

  @override
  String get instanceSheetTitle => 'Poveži se na instancu';

  @override
  String get connectToDifferentInstance => 'Poveži se na drugu instancu';

  @override
  String get changeInstance => 'Promeni';

  @override
  String get instanceConnectionRequired =>
      'Poveži se na instancu da bi se prijavio';

  @override
  String get comingSoon => 'Uskoro';

  @override
  String get guildNavbarDirectMessages => 'Direktne poruke';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Istraži zajednice koje mogu biti otkrivene';

  @override
  String get discoveryExplore => 'Istraži';

  @override
  String get discoveryExplorePublicCommunities => 'Istraži javne zajednice';

  @override
  String get discoveryListingSubheading =>
      'Želite da navedete svoju zajednicu ovde? Prijavite se ako ispunjavate zahteve u postavkama vaše zajednice > Otkrivanje.';

  @override
  String get discoverySearchCommunities => 'Pretraži zajednice';

  @override
  String get discoveryFilterByLanguage => 'Filtriraj po jeziku';

  @override
  String get discoveryAllLanguages => 'Svi jezici';

  @override
  String get discoveryAllCategories => 'Sve';

  @override
  String get discoveryCategoryGaming => 'Igre';

  @override
  String get discoveryCategoryMusic => 'Muzika';

  @override
  String get discoveryCategoryEntertainment => 'Zabava';

  @override
  String get discoveryCategoryEducation => 'Obrazovanje';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Nauka i tehnologija';

  @override
  String get discoveryCategoryContentCreator => 'Kreator sadržaja';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime i manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmovi i TV';

  @override
  String get discoveryCategoryOther => 'Ostalo';

  @override
  String get discoveryNoCommunitiesMatch => 'Nijedna zajednica se ne podudara.';

  @override
  String get discoveryJoinCommunity => 'Pridruži se zajednici';

  @override
  String get discoveryJoined => 'Pridružen/a';

  @override
  String discoveryOnlineCount(String count) {
    return '$count na mreži';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString članova',
      one: '1 član',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Nema opisa.';

  @override
  String get discoveryCommunities => 'Zajednice';

  @override
  String get discoveryApps => 'Aplikacije';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Nije moguće pridružiti se ovoj zajednici';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Nešto je pošlo naopako. Molimo pokušajte ponovo za trenutak.';

  @override
  String get discoveryJoinErrorFullTitle => 'Ova zajednica je puna';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Ova zajednica je dostigla svoj limit članova, tako da se trenutno ne možete pridružiti.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Dostigli ste limit zajednica';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'U maksimalnom ste broju zajednica. Napustite jednu i pokušajte ponovo.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Ne možete se pridružiti ovoj zajednici';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Zabranjeno vam je da učestvujete u ovoj zajednici.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Ova zajednica više nije dostupna';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Možda je napustila otkrivanje ili isključila nova pridruživanja. Osvežite stranicu i više je nećete videti.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Prebrzi ste';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Molimo sačekajte trenutak i pokušajte ponovo.';

  @override
  String get guildNavbarAddCommunity => 'Dodaj zajednicu';

  @override
  String get guildNavbarHelp => 'Pomoć';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NOVA PORUKA';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Sažmi $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Grupni DM';

  @override
  String get guildNavbarCreateChannel => 'Kreiraj kanal';

  @override
  String get guildNavbarChannelType => 'Tip kanala';

  @override
  String get guildNavbarTextChannel => 'Tekstualni kanal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Šalji poruke, slike, GIF-ove i emotikone';

  @override
  String get guildNavbarVoiceChannel => 'Glasovni kanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Družite se zajedno uz glas, video i deljenje ekrana';

  @override
  String get guildNavbarLinkChannel => 'Povezani kanal';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Brzi pristup spoljnom veb-sajtu ili resursu';

  @override
  String get guildNavbarNameLabel => 'Ime';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Kreiraj kategoriju';

  @override
  String get guildNavbarNewCategoryHint => 'Nova kategorija';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Pozovi prijatelje u $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Primaoci će biti preusmereni na #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Pretraži prijatelje';

  @override
  String get guildNavbarNoFriendsYet => 'Još nema prijatelja';

  @override
  String get guildNavbarNoResults => 'Nema rezultata';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Ili, pošalji link za poziv prijatelju:';

  @override
  String get guildNavbarInviteLink => 'Link za poziv';

  @override
  String get guildNavbarCopy => 'Kopiraj';

  @override
  String get guildNavbarCopied => 'Kopirano!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Tvoj link za poziv ističe za 7 dana.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Ovaj link za poziv nikada ne ističe.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Tvoj link za poziv ističe za $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Uredi link za poziv';

  @override
  String get guildNavbarInviteLinkSettings => 'Podešavanja linka za poziv';

  @override
  String get guildNavbarExpireAfter => 'Ističe nakon';

  @override
  String get guildNavbarMaxUses => 'Maksimalan broj korišćenja';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Dodeli privremeno članstvo';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Članovi će biti uklonjeni kada postanu nedostupni, osim ako im nije dodeljena uloga';

  @override
  String get guildNavbarCreateNewLink => 'Kreiraj novi link';

  @override
  String get guildNavbarSent => 'Poslato';

  @override
  String get guildNavbarInvite => 'Pozovi';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Napusti zajednicu';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Da li ste sigurni da želite da napustite ovu zajednicu? Više nećete moći da vidite nijednu poruku.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Napusti zajednicu';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Izbriši svoje poruke u ovoj zajednici?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Trajno izbriši svaku poruku koju ste poslali ovde, u svim kanalima. Ne može se poništiti.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Izbriši moje poruke';

  @override
  String get guildNavbarDeletedYourMessages => 'Izbrisane tvoje poruke';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Nije moguće izbrisati tvoje poruke';

  @override
  String get guildNavbarRemoveOverride => 'Ukloni prepisivanje';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Utišano do $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible => 'Dostupno samo Fluxer osoblju';

  @override
  String get guildNavbarInvitesPaused =>
      'Pozivi su trenutno pauzirani u ovoj zajednici';

  @override
  String get guildNavbarDurationNever => 'nikada';

  @override
  String get guildNavbarDuration30Minutes => '30 minuta';

  @override
  String get guildNavbarDuration1Hour => '1 sat';

  @override
  String get guildNavbarDuration6Hours => '6 sati';

  @override
  String get guildNavbarDuration12Hours => '12 sati';

  @override
  String get guildNavbarDuration1Day => '1 dan';

  @override
  String get guildNavbarDuration7Days => '7 dana';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekundi';
  }

  @override
  String get guildNavbarNever => 'Nikad';

  @override
  String get guildNavbarNoLimit => 'Bez ograničenja';

  @override
  String get guildNavbarOneUse => '1 upotreba';

  @override
  String guildNavbarUses(int count) {
    return '$count upotreba';
  }

  @override
  String get guildMenuMarkAsRead => 'Označi kao pročitano';

  @override
  String get guildPeekMoreOptions => 'Više opcija';

  @override
  String get guildMenuInviteMembers => 'Pozovi članove';

  @override
  String get guildMenuCommunitySettings => 'Podešavanja zajednice';

  @override
  String get guildMenuEditCommunityProfile => 'Uredi profil zajednice';

  @override
  String get guildMenuUnmuteCommunity => 'Uključi zvuk zajednice';

  @override
  String get guildMenuMuteCommunity => 'Isključi zvuk zajednice';

  @override
  String get guildMenuHideMutedChannels => 'Sakrij utišane kanale';

  @override
  String get guildMenuReportCommunity => 'Prijavi zajednicu';

  @override
  String get guildMenuDebugCommunity => 'Debuguj zajednicu';

  @override
  String get guildMenuCopyCommunityId => 'Kopiraj ID zajednice';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Do $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Opšte';

  @override
  String get guildMenuSettingsRoles => 'Uloge i dozvole';

  @override
  String get guildMenuSettingsEmoji => 'Prilagođeni emoji';

  @override
  String get guildMenuSettingsStickers => 'Prilagođene nalepnice';

  @override
  String get guildMenuSettingsSafetyModeration => 'Bezbednost i moderacija';

  @override
  String get guildMenuSettingsActivityLog => 'Dnevnik aktivnosti';

  @override
  String get guildMenuSettingsWebhooks => 'Vebkukovi';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Prilagođeni URL za pozivnicu';

  @override
  String get guildMenuSettingsDiscovery => 'Otkrivanje';

  @override
  String get guildMenuSettingsMembers => 'Članovi';

  @override
  String get guildMenuSettingsInviteLinks => 'Linkovi za pozivnice';

  @override
  String get guildMenuSettingsBans => 'Zabrane';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Nemate dozvolu da vidite ovaj tab sa podešavanjima.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikona';

  @override
  String get guildSettingsUploadImage => 'Postavi sliku';

  @override
  String get guildSettingsOverviewBannerTitle => 'Baner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Postavite baner za vaš server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Ime';

  @override
  String get guildSettingsOverviewNameHint => 'Moja sjajna zajednica';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistika';

  @override
  String get guildSettingsOverviewMembers => 'Članovi';

  @override
  String get guildSettingsOverviewOnline => 'Na mreži';

  @override
  String get guildSettingsRolesDescription =>
      'Koristite uloge za grupisanje članova i dodeljivanje dozvola.';

  @override
  String get guildSettingsCreateRole => 'Kreiraj ulogu';

  @override
  String get guildSettingsRolesListTitle => 'Uloge';

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
    return 'Iskorišćeno $staticCount statičkih, $animatedCount animiranih slotova za emoji';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Još uvek nema prilagođenih emojija.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return 'Postavljeno $count nalepnica';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Još uvek nema prilagođenih nalepnica.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Verifikacija članova';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Odaberite šta članovi moraju da imaju pre nego što mogu da objavljuju ili šalju privatne poruke članovima zajednice.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Članovi sa ulogama mogu da zaobiđu ove provere. Za javne prostore, preporučujemo omogućavanje verifikacije.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Zajednice navedene u Otkriću zahtevaju najmanje verifikovanu imejl adresu. Ne može se izabrati opcija „Nijedno“ dok je Otkriće omogućeno.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Sadržaj za odrasle i upozorenja o sadržaju';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigurišite označavanje sadržaja za odrasle i opciona upozorenja o sadržaju za članove.';

  @override
  String get guildSettingsModerationMatureToggle => 'Sadržaj za odrasle';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Obeležite ovu zajednicu kao sadržaj za odrasle.';

  @override
  String get guildSettingsVerificationNone => 'Nijedno';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nije potrebna verifikacija.';

  @override
  String get guildSettingsVerificationLow => 'Nisko';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Zahteva verifikovanu imejl adresu.';

  @override
  String get guildSettingsVerificationMedium => 'Srednje';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Zahteva verifikovanu imejl adresu i nalog star najmanje 5 minuta.';

  @override
  String get guildSettingsVerificationHigh => 'Visoko';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Zahteva sve iz srednjeg nivoa, plus članstvo u zajednici najmanje 10 minuta.';

  @override
  String get guildSettingsVerificationHighest => 'Veoma visoko';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Zahteva verifikovan broj telefona.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Pratite radnje moderatora u zajednici.';

  @override
  String get guildSettingsAuditLogEmpty => 'Nema još zapisa';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Radnje moderacije i promene u zajednici će se pojaviti ovde.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Svi korisnici';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Sve radnje';

  @override
  String get guildSettingsAuditLogNoReason => 'Nije naveden razlog.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Nepoznat korisnik';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Došlo je do greške prilikom učitavanja zapisnika aktivnosti.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Nije moguće učitati zapisnike aktivnosti';

  @override
  String get guildSettingsAuditLogReason => 'Razlog';

  @override
  String get guildSettingsAuditLogSomeone => 'neko';

  @override
  String get guildSettingsAuditLogSomething => 'nešto';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'nepoznata stavka';

  @override
  String get guildSettingsAuditLogNothing => 'ništa';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Nepoznata meta';

  @override
  String get auditLogActionGuildUpdate => 'Zajednica ažurirana';

  @override
  String get auditLogActionChannelCreate => 'Kanal kreiran';

  @override
  String get auditLogActionChannelUpdate => 'Kanal ažuriran';

  @override
  String get auditLogActionChannelDelete => 'Kanal izbrisan';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Dodato prepisivanje kanala';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Prekrivanje kanala ažurirano';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Prekrivanje kanala uklonjeno';

  @override
  String get auditLogActionMemberKick => 'Član izbačen';

  @override
  String get auditLogActionMemberPrune => 'Članovi obrisani';

  @override
  String get auditLogActionMemberBanAdd => 'Član zabranjen';

  @override
  String get auditLogActionMemberBanRemove => 'Član odblokiran';

  @override
  String get auditLogActionMemberUpdate => 'Član ažuriran';

  @override
  String get auditLogActionMemberRoleUpdate => 'Uloge člana ažurirane';

  @override
  String get auditLogActionMemberMove => 'Član premešten';

  @override
  String get auditLogActionMemberDisconnect => 'Član isključen';

  @override
  String get auditLogActionBotAdd => 'Bot dodat';

  @override
  String get auditLogActionRoleCreate => 'Uloga kreirana';

  @override
  String get auditLogActionRoleUpdate => 'Uloga ažurirana';

  @override
  String get auditLogActionRoleDelete => 'Рола је избрисана';

  @override
  String get auditLogActionInviteCreate => 'Позивница је креирана';

  @override
  String get auditLogActionInviteUpdate => 'Позивница је ажурирана';

  @override
  String get auditLogActionInviteDelete => 'Позивница је избрисана';

  @override
  String get auditLogActionWebhookCreate => 'Webhook је креиран';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook је ажуриран';

  @override
  String get auditLogActionWebhookDelete => 'Webhook је избрисан';

  @override
  String get auditLogActionEmojiCreate => 'Емоџи је креиран';

  @override
  String get auditLogActionEmojiUpdate => 'Емоџи је ажуриран';

  @override
  String get auditLogActionEmojiDelete => 'Емоџи је избрисан';

  @override
  String get auditLogActionStickerCreate => 'Стикер је креиран';

  @override
  String get auditLogActionStickerUpdate => 'Стикер је ажуриран';

  @override
  String get auditLogActionStickerDelete => 'Стикер је избрисан';

  @override
  String get auditLogActionMessageDelete => 'Порука је избрисана';

  @override
  String get auditLogActionMessageBulkDelete => 'Поруке су избрисане';

  @override
  String get auditLogActionMessagePin => 'Порука је закачена';

  @override
  String get auditLogActionMessageUnpin => 'Порука је откачењена';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor је ажурирао подешавања заједнице.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor је креирао канал $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor је ажурирао канал $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor је избрисао канал $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor је додао дозволе за канал за $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor је додао дозволе за канал за $target у каналу $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor је ажурирао дозволе за канал за $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor је ажурирао дозволе за канал за $target у каналу $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor је уклонио дозволе за канал за $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor је уклонио дозволе за канал за $target у каналу $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor је избацио $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor је забранио $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor је укинуо забрану $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor је ажурирао $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor је ажурирао улоге за $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor је очистио неактивне чланове.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor је очистио чланове неактивне $days дана.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor је преместио $target у други гласовни канал.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor је преместио $target у канал $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor је искључио $target са гласа.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor је додао бота $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor је креирао улогу $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor је ажурирао улогу $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor је избрисао улогу $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor је креирао позивницу $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor је креирао позивницу $target за канал $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor је ажурирао позивницу $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor је ажурирао позивницу $target за канал $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor је избрисао позивницу $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor је избрисао позивницу $target за канал $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor је креирао webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor је ажурирао webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor је избрисао webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor je dodao/la emotikon $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor je ažurirao/la emotikon $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor je izbrisao/la emotikon $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor je dodao/la nalepnicu $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor je ažurirao/la nalepnicu $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor je izbrisao/la nalepnicu $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor je izbrisao/la poruku.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor je izbrisao/la poruku u kanalu $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor je izbrisao/la više poruka.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor je izbrisao/la $count poruka.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor je izbrisao/la više poruka u kanalu $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor je izbrisao/la $count poruka u kanalu $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor je zakačio/la poruku.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor je zakačio/la poruku u kanalu $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor je otkačio/la poruku.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor je otkačio/la poruku u kanalu $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor je izvršio/la radnju nad $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Ažurirano polje $field sa $oldValue na $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Podešeno polje $field na $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Obrisano polje $field (bilo je $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Ažurirano polje $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Zajednica je preimenovana u $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Ikona zajednice je ažurirana.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Kanal je preimenovan u $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Tema je obrisana.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Tema je ažurirana na $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Omogućen je sadržaj za odrasle.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Onemogućen je sadržaj za odrasle.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Nadimak postavljen na $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Nadimak $nickname je uklonjen.';
  }

  @override
  String get auditLogChangeMutedMember => 'Član je utišan.';

  @override
  String get auditLogChangeUnmutedMember => 'Član je oduthan.';

  @override
  String get auditLogChangeDeafenedMember => 'Član je ogluvljen.';

  @override
  String get auditLogChangeUndeafenedMember => 'Član je odgluvljen.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Dodate su uloge $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Uklonjene su uloge $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Poruka: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Pozvao/la: $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbrisano # poruka.',
      one: 'Izbrisana # poruka.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Uklonjeno # članova.',
      one: 'Uklonjen # član.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'Ovaj poziv nikada ne ističe.';

  @override
  String get auditLogOptionTemporaryMembership => 'Daje privremeno članstvo.';

  @override
  String get auditLogOptionPermanentMembership => 'Daje trajno članstvo.';

  @override
  String get guildSettingsLoadMore => 'Učitaj još';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Upravljajte veb-kukama koje šalju poruke kanalima.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nema konfigurisane veb-kuke.';

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
  String get guildSettingsCopyUrl => 'Kopiraj URL';

  @override
  String get guildSettingsCopiedUrl => 'URL je kopiran u clipboard';

  @override
  String get guildSettingsDeleteWebhook => 'Izbriši veb-kuku';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Postavite prilagođenu vezu za pozivnice za vaš server.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Sačuvaj';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Upotreba';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count upotreba';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Prijavite se da biste bili navedeni u otkrivanju servera.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Potrebno je najmanje $count članova za prijavu.';
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
  String get guildSettingsDiscoveryCategory => 'Kategorija';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Opis';

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
  String get guildSettingsDiscoveryTags => 'Oznake';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'igranje, umetnost, muzika';

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
  String get guildSettingsDiscoveryApply => 'Pošalji prijavu';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Povuci';

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
      'Pretražite i upravljajte članovima servera.';

  @override
  String get guildSettingsMembersSearchHint => 'Pretraži članove';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count članova';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Pregledajte i opozovite aktivne veze za pozivnice.';

  @override
  String get guildSettingsInvitesEmpty => 'Nema aktivnih pozivnica.';

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
    return '$uses / $maxUses upotreba';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Ističe $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Pregledajte i upravljajte zabranjenim korisnicima.';

  @override
  String get guildSettingsBansSearchHint => 'Pretraži zabrane';

  @override
  String get guildSettingsBansEmpty => 'Nema zabranjenih korisnika.';

  @override
  String get guildSettingsBanPermanent => 'Trajna zabrana';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Ističe $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Ističe';

  @override
  String get guildSettingsUnban => 'Ukinite zabranu';

  @override
  String get guildSettingsBansLoading => 'Učitavanje zabranjenih korisnika';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nisu pronađene zabrane koje odgovaraju vašoj pretrazi.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detalji zabrane';

  @override
  String get guildSettingsBanViewDetails => 'Pogledaj detalje';

  @override
  String get guildSettingsBannedOn => 'Zabranjen dana';

  @override
  String get guildSettingsBannedBy => 'Zabranio';

  @override
  String get guildSettingsRevokeBanTitle => 'Opozovi zabranu';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Da li ste sigurni da želite da opozovete zabranu za $displayName? Moći će ponovo da se pridruži zajednici.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Opozvana zabrana za $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Nije moguće učitati zabrane. Pokušajte ponovo.';

  @override
  String get guildSettingsRevokeBanError =>
      'Nije moguće opozvati zabranu. Pokušajte ponovo.';

  @override
  String get guildSettingsCommunitySettings => 'Podešavanja zajednice';

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
      'Upravljajte profilom, kanalima i podrazumevanim postavkama vaše zajednice.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Brendiranje';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Ažurirajte svoju ikonicu, ime, baner i pozadinu za pozivnice';

  @override
  String get guildSettingsOverviewBannerUpload => 'Postavi baner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Podešavanja mirovanja';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfigurišite AFK kanal i vremensko ograničenje';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistem i dobrodošlica';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Odaberite odredište za sistemske poruke i poruke dobrodošlice';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Podrazumevana obaveštenja';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Zajednice sa preko 250 ljudi su primorane na podešavanje \"samo obaveštenja\". Vaše originalno podešavanje je sačuvano i biće vraćeno ako zajednica padne ispod 250 članova.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Napredno';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Dozvoli fleksibilna imena tekstualnih kanala';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Sakrij krunu vlasnika zajednice';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Izdvojeni baner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Prikazuje baner u sopstvenom odeljku ispod zaglavlja zajednice.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Postavi ikonicu';

  @override
  String get guildSettingsOverviewRemoveImage => 'Ukloni';

  @override
  String get guildSettingsOverviewSplashTitle => 'Pozadina pozivnice';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Pozadina embeda u ćaskanju';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Prikazuje se u embedima pozivnica u ćaskanju.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Postavi pozadinu';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Nema banera zajednice';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Nema pozadine pozivnice';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Pregled';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Pogledajte kako vaša pozivnica izgleda posetiocima.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Imena tekstualnih kanala';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Kruna vlasnika zajednice';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigurišite da li se ikonica krune prikazuje pored vlasnika zajednice';

  @override
  String get guildSettingsSplashCardAlignment => 'Poravnanje kartice';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centar';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Levo';

  @override
  String get guildSettingsSplashAlignmentRight => 'Desno';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Primjenjuje se samo na širokim ekranima.';

  @override
  String get permissionReadMessageHistory => 'Čitaj istoriju poruka';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Promeni šta korisnici bez \"$permission\" mogu da vide';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Koristite poseban modal za postavljanje datuma prekida istorije poruka za članove koji nemaju dozvolu $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Otvori prag istorije poruka';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Prag istorije poruka';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Omogući prag istorije poruka';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Datum praga';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Članovi bez dozvole Čitaj istoriju poruka mogu da vide poruke poslati posle ovog datuma.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Prag istorije poruka je ažuriran';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Dozvoli velika slova i razmake u imenima tekstualnih kanala. Isključeno ograničava imena na mala slova sa crticama i podvlakama.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Sakriva ikonicu krune pored vlasnika zajednice na svim mestima.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animirane ikonice zahtevaju funkciju zajednice Animiranih ikonika.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animirani baneri zahtevaju funkciju zajednice Animiranih banera.';

  @override
  String get guildSettingsAfkChannel => 'AFK / kanal u mirovanju';

  @override
  String get guildSettingsAfkChannelHint =>
      'Premeštaj članove u ovaj kanal kada su AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Nema AFK kanala';

  @override
  String get guildSettingsAfkTimeout => 'AFK istek';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minut';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minuta';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minuta';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minuta';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 sat';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekundi';
  }

  @override
  String get guildSettingsSystemChannel => 'Kanal odredišta';

  @override
  String get guildSettingsSystemChannelHint =>
      'Poruke dobrodošlice i sistemske poruke će se pojaviti ovde.';

  @override
  String get guildSettingsNoSystemChannel => 'Nema sistemskog kanala';

  @override
  String get guildSettingsHideJoinMessages => 'Sakrij poruke o pridruživanju';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Potiskuje poruke o pridruživanju u odredišnom kanalu.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Podrazumevana podešavanja obaveštenja';

  @override
  String get guildSettingsNotificationsAll => 'Sve poruke';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Obaveštavaj o svim porukama';

  @override
  String get guildSettingsNotificationsMentions => 'Samo pomene';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Obaveštavaj samo o pomenima';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maksimalno 10MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maksimalno 10MB. Minimum: 960×540px (16:9). Prikazuje se u ugrađenim pozivnicama u ćaskanju.';

  @override
  String get guildSettingsModerationDescription =>
      'Konfiguriši podešavanja verifikacije, filtriranja sadržaja i sadržaja za odrasle.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Zajednice navedene u Otkriću imaju ograničene opcije moderacije.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Filtriranje sadržaja';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automatski proveravaj poruke na eksplicitan sadržaj u kanalima koji nisu označeni kao sadržaj za odrasle.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Zajednice navedene u Otkriću moraju da skeniraju sve članove. Ovo podešavanje se ne može promeniti dok je Otkriće omogućeno.';

  @override
  String get guildSettingsContentFilterOff => 'Isključeno';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Prepusti zajednici samostalno moderiranje';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtriraj članove bez uloga';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Predloženo za većinu zajednica';

  @override
  String get guildSettingsContentFilterAll => 'Filtriraj sve';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maksimalna zaštita za prostore pogodne za celu porodicu';

  @override
  String get guildSettingsModerationMatureOff => 'Isključeno';

  @override
  String get guildSettingsModerationMatureOn => 'Uključeno';

  @override
  String get guildSettingsContentWarningToggle =>
      'Prikaži upozorenje o sadržaju';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Uključuje/isključuje upit za saglasnost pre ulaska u bilo koji kanal.';

  @override
  String get guildSettingsContentWarningText => 'Prilagođeni tekst upozorenja';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Ovo sadrži osetljiv sadržaj.';

  @override
  String get guildSettingsModeration2faTitle => 'Zahtev za 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Zahtevaj dvofaktorsku autentifikaciju za moderatore pre nego što mogu da zabrane, izbace, privremeno udalje ili uklone poruke.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Zahtevaj 2FA za moderatorske akcije';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Samo vlasnik zajednice može da promeni ovo podešavanje';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Omogući 2FA na svom nalogu da bi promenio ovo podešavanje';

  @override
  String get guildSettingsEmojiSearchHint => 'Pretraži emodžije';

  @override
  String get guildSettingsEmojiUploadTitle => 'Otpremi emodži';

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
    return 'Neanimirani emodži ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animirani emodži ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Pretraži nalepnice';

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
    return 'Kreiraj veb kuke iz podešavanja kanala. Uredi ih ovde.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Tvoj prilagođeni URL neće raditi osim ako bar jedan kanal nije vidljiv svima.';

  @override
  String get guildSettingsVanityUrlRemove => 'Ukloni';

  @override
  String get guildSettingsBannedUsersTitle => 'Zabranjeni korisnici';

  @override
  String get guildSettingsInvitesTableInviter => 'Pozivač';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Kod';

  @override
  String get guildSettingsInvitesTableUses => 'Korišćenja';

  @override
  String get guildSettingsInvitesTableCreated => 'Kreirano';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Najnoviji prvi';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtriraj po korisniku';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtriraj po akciji';

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
