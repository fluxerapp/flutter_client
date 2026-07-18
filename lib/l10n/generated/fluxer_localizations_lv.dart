// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class FluxerLocalizationsLv extends FluxerLocalizations {
  FluxerLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get reconnectingTitle => 'Mums sanāca putra!';

  @override
  String get reconnectingBody =>
      'Kaut kas nav kārtībā ar serveriem.\nDrīzumā tiks salabots!';

  @override
  String get gatewayReconnectingToast => 'Tiek izveidots savienojums vēlreiz…';

  @override
  String get gatewayConnectedToast => 'Savienots';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Startēšana neizdevās: $error';
  }

  @override
  String get retry => 'Mēģināt vēlreiz';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Savienojums zaudēts';

  @override
  String get splashViewOnStatusPage => 'Skatīt statusa lapā';

  @override
  String get splashConnectionIssuesPrompt => 'Problēmas ar savienojumu?';

  @override
  String get splashStatusPageLink => 'Statusa lapa';

  @override
  String get splashReadIncident => 'Lasīt par incidentu';

  @override
  String get splashIncidentHistory => 'Incidentu vēsture';

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
  String get welcomeBack => 'Laipni lūgti atpakaļ';

  @override
  String get email => 'E-pasts';

  @override
  String get emailInvalid => 'Lūdzu, ievadiet derīgu e-pasta adresi.';

  @override
  String get password => 'Parole';

  @override
  String get forgotPassword => 'Aizmirsi paroli?';

  @override
  String get logIn => 'Ienākt';

  @override
  String get logInWithPasskey => 'Ienākt ar piekļuves atslēgu';

  @override
  String continueWithSso(String provider) {
    return 'Turpināt ar $provider';
  }

  @override
  String get ssoRequired => 'Lai piekļūtu šai instancei, ir nepieciešams SSO.';

  @override
  String get organizationSsoProvider =>
      'Ienākt, izmantojot jūsu organizācijas vienreizējās pieteikšanās nodrošinātāju.';

  @override
  String get failedToStartSso => 'SSO nevarēja sākties';

  @override
  String get ssoCancelled => 'SSO pieteikšanās tika atcelta';

  @override
  String preferSso(String provider) {
    return 'Vēlaties izmantot SSO? Turpiniet ar $provider.';
  }

  @override
  String get logInViaBrowser => 'Ienākt caur pārlūkprogrammu';

  @override
  String get needAccountPrompt => 'Nepieciešams konts? ';

  @override
  String get register => 'Reģistrēties';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Pārliecinieties, ka esat cilvēks';

  @override
  String get captchaDescription =>
      'Mums ir jāpārliecinās, ka neesat robots. Lūdzu, pabeidziet verificēšanu zemāk.';

  @override
  String get captchaSwitchToHcaptcha => 'Problēmas? Mēģiniet hCaptcha vietā';

  @override
  String get captchaSwitchToTurnstile => 'Mēģiniet Turnstile vietā';

  @override
  String get cancel => 'Atcelt';

  @override
  String get ipAuthCheckEmail => 'Pārbaudiet savu e-pastu';

  @override
  String ipAuthDescription(String email) {
    return 'Mēs nosūtījām e-pastā saiti, lai autorizētu šo pieteikšanos. Lūdzu, atveriet savu iesūtni $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Savienojums zaudēts';

  @override
  String get ipAuthConnectionLostDescription =>
      'Mēs zaudējām savienojumu, gaidot autorizāciju. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get ipAuthLinkExpired => 'Pieteikšanās saite ir nederīga';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Šī autorizācijas saite ir nederīga. Lūdzu, piesakieties vēlreiz.';

  @override
  String get ipAuthResendEmail => 'Nosūtīt e-pastu vēlreiz';

  @override
  String get ipAuthResent => 'Nosūtīts vēlreiz';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Atpakaļ';

  @override
  String get mfaTitle => 'Divu faktoru autentifikācija';

  @override
  String get mfaChooseMethod => 'Izvēlieties verifikācijas metodi';

  @override
  String get mfaMethodTotp => 'Autentifikatora lietotne';

  @override
  String get mfaMethodWebauthn => 'Drošības atslēga / Piekļuves atslēga';

  @override
  String get mfaTotpDescription =>
      'Ievadiet 6 ciparu kodu no savas autentifikatora lietotnes vai vienu no saviem rezerves kodiem.';

  @override
  String get mfaCodeLabel => 'Kods';

  @override
  String get mfaTryAnotherMethod => 'Mēģināt citu metodi';

  @override
  String get mfaUseSecurityKey =>
      'Mēģināt izmantot drošības atslēgu / piekļuves atslēgu';

  @override
  String get accountSelectorTitle => 'Izvēlieties kontu';

  @override
  String get accountSelectorDescription =>
      'Atlasiet kontu, lai turpinātu, vai pievienojiet citu.';

  @override
  String get accountAdd => 'Pievienot kontu';

  @override
  String get accountRemove => 'Noņemt';

  @override
  String accountRemoveTitle(String username) {
    return 'Noņemt $username';
  }

  @override
  String get accountRemoveDescription =>
      'Tiks noņemta šī konta saglabātā sesija.';

  @override
  String get accountRemoveOnlyDescription =>
      'Tiks noņemts vienīgais šajā ierīcē saglabātais konts.';

  @override
  String get accountExpired => 'Derīguma termiņš beidzies';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sesija beigusies priekš $identifier. Lūdzu, piesakieties vēlreiz.';
  }

  @override
  String get accountManageTitle => 'Pārvaldīt kontus';

  @override
  String get accountSwitchFailed =>
      'Neizdevās pārslēgt kontus. Mēģiniet vēlreiz.';

  @override
  String get profileTabMenuSwitchAccounts => 'Pārslēgt kontus';

  @override
  String get statusChangeSheetTitle => 'Iestatīt statusu';

  @override
  String get statusOnlineStatusSection => 'Tiešsaistes statuss';

  @override
  String get statusOnline => 'Tiešsaistē';

  @override
  String get statusIdle => 'Dīkstāvē';

  @override
  String get statusDnd => 'Netraucēt';

  @override
  String get statusInvisible => 'Neredzams';

  @override
  String get statusOffline => 'Bezsaistē';

  @override
  String get statusUntilIChangeIt => 'Līdz brīdim, kad to mainīšu';

  @override
  String get statusDontClear => 'Neatcelt';

  @override
  String get statusFor10Seconds => '10 sekundes';

  @override
  String get statusClearAfter10Seconds => '10 sekundes';

  @override
  String get statusClearAfter15Minutes => '15 minūtes';

  @override
  String get statusClearAfter30Minutes => '30 minūtes';

  @override
  String get statusClearAfter1Hour => '1 stunda';

  @override
  String get statusClearAfter3Hours => '3 stundas';

  @override
  String get statusClearAfter4Hours => '4 stundas';

  @override
  String get statusClearAfter8Hours => '8 stundas';

  @override
  String get statusClearAfter24Hours => '24 stundas';

  @override
  String get statusClearAfter3Days => '3 dienas';

  @override
  String get statusDndDescription => 'Jūs nesaņemsiet paziņojumus darbvirsmā';

  @override
  String get statusInvisibleDescription => 'Jūs parādīsities kā bezsaistē';

  @override
  String get customStatusSetTitle => 'Iestatīt pielāgoto statusu';

  @override
  String get customStatusCurrentHint => 'Pielāgotais statuss';

  @override
  String get customStatusClear => 'Notīrīt pielāgoto statusu';

  @override
  String get customStatusPlaceholder => 'Kas notiek?';

  @override
  String get customStatusChooseEmoji => 'Izvēlieties emocellīti';

  @override
  String get customStatusClearAfter => 'Notīrīt pēc';

  @override
  String get customStatusSave => 'Saglabāt';

  @override
  String get accountActive => 'Aktīvais konts';

  @override
  String get signOut => 'Izrakstīties';

  @override
  String get suspendedPermanentTitle => 'Konts pastāvīgi apturēts';

  @override
  String get suspendedTemporaryTitle => 'Konts apturēts';

  @override
  String get suspendedPermanentDescription =>
      'Jūsu konts ir pastāvīgi apturēts par mūsu pakalpojumu sniegšanas noteikumu pārkāpšanu.';

  @override
  String get suspendedTemporaryDescription =>
      'Jūsu konts ir īslaicīgi apturēts. Jūs varēsiet piekļūt savam kontam, kad beigsies apturēšanas periods.';

  @override
  String get suspendedIssuedAt => 'Izdots';

  @override
  String get suspendedEndsAt => 'Beidzas';

  @override
  String get suspendedDuration => 'Ilgums';

  @override
  String get suspendedPermanent => 'Pastāvēties';

  @override
  String get suspendedReason => 'Iemesls';

  @override
  String get suspendedAppealDeadline => 'Apelācijas termiņš';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Jūsu konts ir plānots dzēšanai $date';
  }

  @override
  String get suspendedRecheck => 'Pārbaudīt atjauninājumus';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Pārbaudīt vēl pēc ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Atpakaļ uz pieteikšanos';

  @override
  String get suspendedAppealTitle => 'Apelācija';

  @override
  String get suspendedAppealHint =>
      'Paskaidrojiet, kāpēc jūsu noraidījums būtu jāpārskata (vismaz 50 rakstzīmes)...';

  @override
  String get suspendedAppealSubmit => 'Iesniegt apelāciju';

  @override
  String get suspendedAppealPending => 'Gaida izskatīšanu';

  @override
  String get suspendedAppealAccepted => 'Apelācija pieņemta';

  @override
  String get suspendedAppealRejected => 'Apelācija noraidīta';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Jūsu apelācija ir pieņemta un jūsu konts ir atjaunots.';

  @override
  String get suspendedSignIn => 'Piesakieties savā kontā';

  @override
  String get forgotPasswordTitle => 'Aizmirsi paroli?';

  @override
  String get forgotPasswordDescription =>
      'Ievadiet savu e-pasta adresi, un mēs nosūtīsim jums saiti paroles atiestatīšanai.';

  @override
  String get forgotPasswordSubmit => 'Nosūtīt atiestatīšanas saiti';

  @override
  String get forgotPasswordSentTitle => 'Pārbaudiet savu e-pastu';

  @override
  String get forgotPasswordSentDescription =>
      'Mēs nosūtījām paroles atiestatīšanas norādījumus uz jūsu e-pasta adresi. Lūdzu, pārbaudiet savu iesūtni un sekojiet saitei, lai atiestatītu paroli.';

  @override
  String get forgotPasswordBackToLogin => 'Atgriezties uz pieteikšanos';

  @override
  String get resetPasswordTitle => 'Iestatīt jaunu paroli';

  @override
  String get resetPasswordDescription =>
      'Ievadiet savu jauno paroli zemāk, lai pabeigtu atiestatīšanas procesu.';

  @override
  String get resetPasswordNewPassword => 'Jauna parole';

  @override
  String get resetPasswordConfirm => 'Apstiprināt jauno paroli';

  @override
  String get resetPasswordSubmit => 'Atiestatīt paroli';

  @override
  String get resetPasswordMismatch => 'Paroles nesakrīt.';

  @override
  String get registerTitle => 'Izveidot kontu';

  @override
  String get registerDisplayName => 'Vārds (nav obligāts)';

  @override
  String get registerDisplayNameHint => 'Kā cilvēki jūs sauks?';

  @override
  String get registerUsername => 'Lietotājvārds (nav obligāts)';

  @override
  String get registerUsernameHint =>
      'Atstājiet tukšu, lai iegūtu nejaušu lietotājvārdu';

  @override
  String get registerUsernameTagHint =>
      'Lai nodrošinātu unikalitāti, automātiski tiks pievienots 4 ciparu tagad';

  @override
  String get registerDateOfBirth => 'Dzimšanas datums';

  @override
  String get registerMonth => 'Mēnesis';

  @override
  String get registerDay => 'Diena';

  @override
  String get registerYear => 'Gads';

  @override
  String get registerConsent =>
      'Es piekrītu pakalpojumu sniegšanas noteikumiem un privātuma politikai';

  @override
  String get registerConsentPrefix => 'Es piekrītu ';

  @override
  String get registerConsentTerms => 'pakalpojumu sniegšanas noteikumiem';

  @override
  String get registerConsentAnd => ' un ';

  @override
  String get registerConsentPrivacy => 'privātuma politikai';

  @override
  String get registerConfirmPassword => 'Apstiprināt paroli';

  @override
  String get registerSubmit => 'Izveidot kontu';

  @override
  String get registerHaveAccount => 'Jau ir konts? ';

  @override
  String get passkeyNoCredentials =>
      'Šai lietotnei nav atrasti atslēgu pāri. Piesakieties, izmantojot e-pastu un paroli.';

  @override
  String get passkeyDeviceNotSupported => 'Šī ierīce neatbalsta atslēgu pārus.';

  @override
  String get passkeyDomainNotAssociated =>
      'Atslēgu pāri nav konfigurēti šai lietotnei. Piesakieties, izmantojot e-pastu un paroli.';

  @override
  String get passkeyTimeout =>
      'Atslēgu pāru autentifikācija beidzās. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get passkeyNotAvailable =>
      'Atslēgu pāri nav pieejami šai lietotnei. Piesakieties, izmantojot e-pastu un paroli.';

  @override
  String get passkeyFailed =>
      'Neizdevās autentificēties ar piekļuves atslēgu. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get errorUnableToCreateAccount =>
      'Nevar izveidot kontu. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get errorUnableToSignIn =>
      'Pašlaik nevar pieteikties. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get errorInvalidEmailOrPassword => 'Nepareizs e-pasts vai parole.';

  @override
  String get errorUnableToSendResetLink =>
      'Nevar nosūtīt atiestatīšanas saiti. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get errorUnableToResetPassword =>
      'Nevar atiestatīt paroli. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get embedInviteJoin => 'Pievienoties kopienai';

  @override
  String get embedInviteGoTo => 'Doties uz kopienu';

  @override
  String embedInviteOnline(String count) {
    return '$count tiešsaistē';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count dalībnieki';
  }

  @override
  String get embedInviteUnknownTitle => 'Nezināms ielūgums';

  @override
  String get embedInviteUnknownSubtitle => 'Mēģiniet pieprasīt jaunu ielūgumu.';

  @override
  String get embedInviteUnavailable => 'Ielūgums nav pieejams';

  @override
  String get inviteAcceptTitle => 'Jūs esat uzaicināts pievienoties';

  @override
  String get inviteAcceptJoinButton => 'Pievienoties kopienai';

  @override
  String get inviteAcceptGoToButton => 'Doties uz kopienu';

  @override
  String get inviteAcceptInvitesPaused => 'Ielūgumi ir apturēti';

  @override
  String get inviteAcceptNotFoundTitle => 'Ielūgums nav derīgs';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Šis ielūgums var būt nederīgs vai beidzies tā derīguma termiņš.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Pievienoties grupai';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Jūs esat uzaicināts pievienoties grupas DM, ko veicis $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'kāds';

  @override
  String get inviteAcceptEmojiPack => 'Emociju komplekts';

  @override
  String get inviteAcceptStickerPack => 'Uzlīmju komplekts';

  @override
  String get inviteAcceptInstallEmojiPack => 'Instalēt emociju komplektu';

  @override
  String get inviteAcceptInstallStickerPack => 'Instalēt uzlīmju komplektu';

  @override
  String get inviteAcceptPackInstallNote =>
      'Šī ielūguma pieņemšana automātiski instalēs komplektu.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Nav piekļuves kanālam';

  @override
  String get channelAccessDeniedDescription =>
      'Jums nav piekļuves kanālam, kurā tika nosūtīta šī ziņa.';

  @override
  String get messageJumpLinkNoAccess => 'Nav piekļuves';

  @override
  String get okay => 'Labi';

  @override
  String get embedThemeTitle => 'Koplietota tēma';

  @override
  String get embedThemeSubtitle => 'Šis klients neatbalsta pielāgotas tēmas.';

  @override
  String get embedThemeUnavailableButton => 'Tēmas nav pieejamas';

  @override
  String get privacySettings => 'Privātuma iestatījumi';

  @override
  String get privacyDirectMessages => 'Privātās ziņas';

  @override
  String get privacyDirectMessagesDescription =>
      'Atļaut privātās ziņas no citiem šīs kopienas dalībniekiem';

  @override
  String get privacyBotDirectMessages => 'Botu privātās ziņas';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Atļaut botu no šīs kopienas sūtīt jums privātās ziņas';

  @override
  String get privacyMutualDmsDisabled =>
      'Kopienas administratori ir atspējojuši privāto ziņu saņemšanu tikai no savstarpējiem dalībniekiem šajā kopienā.';

  @override
  String get communityDebug => 'Kopienas atkļūdošana';

  @override
  String get copiedToClipboard => 'Nokopēts starpliktuvē';

  @override
  String get notificationSettings => 'Paziņojumu iestatījumi';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Izslēgt $guildName skaņu';
  }

  @override
  String get notificationMuteDescription =>
      'Kopienas izslēgšana novērš nelasītu indikatoru un paziņojumu parādīšanos, ja vien neesat pieminēts.';

  @override
  String get notificationCommunitySettings => 'Kopienas paziņojumu iestatījumi';

  @override
  String get notificationAllMessages => 'Visas ziņas';

  @override
  String get notificationOnlyMentions => 'Tikai pieminējumi';

  @override
  String get notificationNothing => 'Nekas';

  @override
  String get notificationSuppressEveryone => 'Atslēgt @everyone un @here';

  @override
  String get notificationSuppressRoles => 'Ignorēt visas @pieminētās lomas';

  @override
  String get notificationMobilePush => 'Mobilie informatīvie paziņojumi';

  @override
  String get notificationOverrides => 'Paziņojumu pārrakstīšanas iestatījumi';

  @override
  String get notificationSelectChannel => 'Izvēlieties kanālu vai kategoriju';

  @override
  String get notificationOnlyAtMentions => 'Tikai @pieminētie';

  @override
  String get notificationMuteChannel => 'Izslēgt kanālu';

  @override
  String get notificationUnmuteChannel => 'Ieslēgt kanālu';

  @override
  String get notificationNoCategory => 'Nav kategorijas';

  @override
  String get dmMarkAsRead => 'Atzīmēt kā izlasītu';

  @override
  String get dmMuteConversation => 'Izslēgt DM';

  @override
  String get dmUnmuteConversation => 'Ieslēgt DM';

  @override
  String get dmPinDm => 'Piespraust DM';

  @override
  String get dmUnpinDm => 'Atspraust DM';

  @override
  String get dmAlwaysShowInSidebar => 'Vienmēr rādīt sānu joslā';

  @override
  String get dmRemoveFromAlwaysShown => 'Noņemt no vienmēr rādītajiem';

  @override
  String get dmCloseDm => 'Aizvērt DM';

  @override
  String get dmCloseDmConfirmTitle => 'Aizvērt DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Vai tiešām vēlaties aizvērt savu DM ar $username? Jūs vienmēr varat to atvērt vēlāk.';
  }

  @override
  String get dmCopyChannelId => 'Kopēt kanāla ID';

  @override
  String get dmChannelIdCopied => 'Kanāla ID kopēts';

  @override
  String get dmCopyUserId => 'Kopēt lietotāja ID';

  @override
  String get dmUserIdCopied => 'Lietotāja ID kopēts';

  @override
  String get dmViewProfile => 'Skatīt profilu';

  @override
  String get dmVoiceCall => 'Sākt balss zvanu';

  @override
  String get incomingVoiceCallTitle => 'Ienākošais balss zvans';

  @override
  String get incomingVoiceCallAccept => 'Pieņemt';

  @override
  String get incomingVoiceCallDecline => 'Noraidīt';

  @override
  String get incomingVoiceCallLabel => 'Ienākošais zvans';

  @override
  String get incomingVoiceCallIgnore => 'Ignorēt';

  @override
  String get directVoiceCallNotEligible =>
      'Šo zvanu pašlaik nevar sākt. Mēģiniet vēlreiz pēc brīža.';

  @override
  String get voiceJoinCallFailed =>
      'Neizdevās savienoties ar šo zvanu. Pārbaudiet savu savienojumu un mēģiniet vēlreiz.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Neizdevās pievienoties šim zvanam. Pārbaudiet savu savienojumu un mēģiniet vēlreiz.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Neizdevās atjaunināt šo zvanu serverī. Pārbaudiet savu savienojumu un mēģiniet vēlreiz.';

  @override
  String get dmAddNote => 'Pievienot piezīmi';

  @override
  String get dmEditGroup => 'Rediģēt grupu';

  @override
  String get dmInviteToCommunity => 'Uzaicināt uz kopienu';

  @override
  String get dmBlock => 'Bloķēt';

  @override
  String get dmLeaveGroup => 'Pamest grupu';

  @override
  String get dmNoCommunitiesAvailable => 'Nav pieejamu kopienu';

  @override
  String dmGroupMemberCount(int count) {
    return '$count dalībnieki';
  }

  @override
  String get dmMuteFor15Min => 'Uz 15 minūtēm';

  @override
  String get dmMuteFor30Min => 'Uz 30 minūtēm';

  @override
  String get dmMuteFor1Hour => 'Uz 1 stundu';

  @override
  String get dmMuteFor3Hours => 'Uz 3 stundām';

  @override
  String get dmMuteFor4Hours => 'Uz 4 stundām';

  @override
  String get dmMuteFor8Hours => 'Uz 8 stundām';

  @override
  String get dmMuteFor24Hours => 'Uz 24 stundām';

  @override
  String get dmMuteFor3Days => 'Uz 3 dienām';

  @override
  String get dmMuteForever => 'Līdz brīdim, kad to atkal ieslēgšu';

  @override
  String get dmPinGroupDm => 'Piespraust grupas DM';

  @override
  String get dmUnpinGroupDm => 'Noņemt grupas DM no saraksta';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Iecienīt DM';

  @override
  String get dmUnfavoriteDm => 'Noņemt no iecienītākajiem DM';

  @override
  String get dmFavoriteGroupDm => 'Iecienīt grupas DM';

  @override
  String get dmUnfavoriteGroupDm => 'Noņemt grupas DM no iecienītākajiem';

  @override
  String get dmChangeFriendNickname => 'Mainīt drauga segvārdu';

  @override
  String get dmRemoveFriend => 'Noņemt draugu';

  @override
  String get dmAddFriend => 'Pievienot draugu';

  @override
  String get dmAcceptFriendRequest => 'Pieņemt drauga pieprasījumu';

  @override
  String get dmIgnoreFriendRequest => 'Ignorēt drauga pieprasījumu';

  @override
  String get dmFriendRequestSent => 'Draudzības pieprasījums nosūtīts';

  @override
  String get dmUnblock => 'Atbloķēt';

  @override
  String get dmDebugUser => 'Debugot lietotāju';

  @override
  String get dmDebugChannel => 'Debugot kanālu';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Piesprausts DM';

  @override
  String get dmUnpinned => 'DM noņemts no saraksta';

  @override
  String get dmMuted => 'Izslēgts DM';

  @override
  String get dmUnmuted => 'DM skaņa ieslēgta';

  @override
  String get dmRemoveFriendConfirmTitle => 'Noņemt draugu';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Vai tiešām vēlaties noņemt $username kā draugu?';
  }

  @override
  String get dmBlockConfirmTitle => 'Bloķēt lietotāju';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Vai tiešām vēlaties bloķēt $username? Viņš nevarēs jums rakstīt vai sūtīt drauga pieprasījumus.';
  }

  @override
  String get dmFriendRequestSentToast => 'Draudzības pieprasījums nosūtīts';

  @override
  String get dmFriendRequestFailed => 'Neizdevās nosūtīt drauga pieprasījumu';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Neizdevās pieņemt drauga pieprasījumu';

  @override
  String get dmRemoveFriendFailed => 'Neizdevās noņemt draugu';

  @override
  String get dmBlockFailed => 'Neizdevās bloķēt lietotāju';

  @override
  String get dmUnblockFailed => 'Neizdevās atbloķēt lietotāju';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Neizdevās ignorēt drauga pieprasījumu';

  @override
  String get dmAddFriends => 'Pievienot draugus';

  @override
  String get addFriendSheetTitle => 'Pievienot draugu';

  @override
  String get addFriendUsernameHint => 'Lietotājvārds#0000';

  @override
  String get addFriendUsernameLabel => 'Drauga lietotājvārds';

  @override
  String get addFriendSendRequest => 'Nosūtīt pieprasījumu';

  @override
  String get addFriendNoUserFound =>
      'Nav atrasts lietotājs ar šādu lietotājvārdu.';

  @override
  String get addFriendInvalidUsername =>
      'Ievadiet derīgu lietotājvārdu (Lietotājvārds#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Draudzības pieprasījums nosūtīts';

  @override
  String get addFriendClaimTitle => 'Pieprasiet savu kontu';

  @override
  String get addFriendClaimDescription =>
      'Pieprasiet savu kontu, lai nosūtītu drauga pieprasījumus.';

  @override
  String get addFriendVerifyTitle => 'Verificējiet savu e-pastu';

  @override
  String get addFriendVerifyDescription =>
      'Jums ir jāverificē sava e-pasta adrese, pirms varat nosūtīt drauga pieprasījumus.';

  @override
  String get addFriendVerifyEmail => 'Verificēt e-pastu';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Ienākošie drauga pieprasījumi ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Izsūtītie drauga pieprasījumi ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Ienākošais drauga pieprasījums';

  @override
  String get addFriendOutgoingStatus => 'Draudzības pieprasījums nosūtīts';

  @override
  String get addFriendViewProfile => 'Skatīt profilu';

  @override
  String get addFriendAccept => 'Pieņemt';

  @override
  String get addFriendIgnore => 'Ignorēt';

  @override
  String get addFriendAcceptTitle => 'Pieņemt drauga pieprasījumu';

  @override
  String get addFriendIgnoreTitle => 'Ignorēt drauga pieprasījumu';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Pieņemt drauga pieprasījumu no $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorēt drauga pieprasījumu no $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Atcelt pieprasījumu';

  @override
  String get addFriendCancelRequestFailed =>
      'Neizdevās atcelt drauga pieprasījumu. Mēģiniet vēlreiz.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Viņi pašlaik nepieņem draugu pieprasījumus.';

  @override
  String get addFriendUnblockFirst =>
      'Vispirms atbloķējiet viņu, lai nosūtītu drauga pieprasījumu.';

  @override
  String get addFriendCannotSendToSelf =>
      'Jūs nevarat nosūtīt drauga pieprasījumu sev.';

  @override
  String get addFriendAlreadyFriends => 'Jūs jau esat draugos ar šo lietotāju.';

  @override
  String get addFriendClaimToSend =>
      'Pabeidziet reģistrēšanos, lai nosūtītu drauga pieprasījumus.';

  @override
  String get addFriendSendFailedGeneric =>
      'Neizdevās nosūtīt drauga pieprasījumu. Mēģiniet vēlreiz.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistēma';

  @override
  String get emojiSearchPlaceholder => 'Atrodiet savu sapņu emocijzīmi';

  @override
  String get emojiSearchEmpty =>
      'Nav emocijzīmju, kas atbilstu jūsu meklēšanai';

  @override
  String get emojiAutocompleteDefaultLabel => 'Noklusējuma emocijzīme';

  @override
  String get emojiFrequentlyUsed => 'Bieži lietotās';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'Multivide';

  @override
  String get emojiTabStickers => 'Uzlīmes';

  @override
  String get emojiTabEmojis => 'Emocijzīmes';

  @override
  String get gifPickerSearch => 'Meklēt GIF';

  @override
  String get gifPickerSearchKlipy => 'Meklēt KLIPY';

  @override
  String get gifPickerSearchTenor => 'Meklēt Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Izlase';

  @override
  String get gifPickerTrending => 'Populāri GIF';

  @override
  String get gifPickerNoResultsTitle => 'Nav meklēšanas rezultātu';

  @override
  String get gifPickerNoResultsDescription =>
      'Mēģiniet citu meklēšanas termiņu';

  @override
  String get gifPickerLoadFailedTitle => 'Neizdevās ielādēt GIF';

  @override
  String get gifPickerLoadFailedBody =>
      'Pārbaudiet savu savienojumu un mēģiniet vēlreiz.';

  @override
  String get emojiCategoryPeople => 'Cilvēki';

  @override
  String get emojiCategoryNature => 'Daba';

  @override
  String get emojiCategoryFood => 'Pārtika un dzērieni';

  @override
  String get emojiCategoryActivity => 'Darbības';

  @override
  String get emojiCategoryTravel => 'Ceļojumi un vietas';

  @override
  String get emojiCategoryObjects => 'Objekti';

  @override
  String get emojiCategorySymbols => 'Simboli';

  @override
  String get emojiCategoryFlags => 'Karogi';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Atbloķējiet $emojiCount no $communityCount ar Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Iegūt Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Nekad vairs nerādīt';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pielāgotas emocijzīmes',
      one: '1 pielāgota emocijzīme',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kopienas',
      one: '1 kopiena',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Brīdinājums par ārējo saiti';

  @override
  String get externalLinkWarningLeaving => 'Jūs gatavojaties pamest Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Ārējās saites var būt bīstamas. Lūdzu, esiet uzmanīgi.';

  @override
  String get externalLinkWarningDestinationUrl => 'Galamērķa URL:';

  @override
  String get externalLinksSectionTitle => 'Ārējās saites';

  @override
  String get externalLinksSectionDescription =>
      'Konfigurējiet, kā tiek apstrādāti brīdinājumi par ārējām saitēm.';

  @override
  String get externalLinkWarningTrustPrefix => 'Vienmēr uzticēties';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — izlaist šo brīdinājumu nākamreiz';

  @override
  String get externalLinkVisitSite => 'Apmeklēt vietni';

  @override
  String get externalLinkTrustAllLabel => 'Uzticēt visām ārējām saitēm';

  @override
  String get externalLinkStripTrackingLabel =>
      'Noņemt izsekošanas parametrus no URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automātiski noņemiet izsekošanas parametrus (piemēram, utm_source, fbclid, gclid) no URL ziņojumos, ko sūtāt. Tīra saiti, pirms tā sasniedz kādu citu.';

  @override
  String get externalLinkTrustAllConfirmTitle => 'Uzticēt visām ārējām saitēm?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Tas uzticēs visām ārējām saitēm un izlaidīs brīdinājumu par katru domēnu. Jūsu esošie uzticamie domēni tiks aizstāti. Tas ir mazāk droši.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Uzticēt visām';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Pārtraukt uzticēšanos visām saitēm?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Ārējo saišu brīdinājumi tiks rādīti vēlreiz. Jums būs jāpievieno uzticami domēni atsevišķi.';

  @override
  String get externalLinkStopTrustingAllAction => 'Atspējot uzticēšanos visām';

  @override
  String get externalLinkTrustedAllDescription =>
      'Visām ārējām saitēm tiek uzticēts. Brīdinājumi netiks rādīti.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Jums ir $count uzticami domēni. Pievienojiet vairāk, atzīmējot izvēles rūtiņu, apmeklējot ārējas saites.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Kad tas ir iespējots, netiks rādīti brīdinājumi par ārējām saitēm. Tas ir mazāk droši.';

  @override
  String get imageFileTooLarge =>
      'Attēla fails ir pārāk liels. Lūdzu, izvēlieties failu, kas mazāks par 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animētiem avatariem nepieciešams Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animētiem baneriem nepieciešams Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animēts AVIF netiek atbalstīts';

  @override
  String get animatedAvifNotSupportedBody =>
      'Animētu AVIF failu apgriešana un pagriešana vēl netiek atbalstīta. Ja turpināsiet, tas tiks augšupielādēts oriģinālajā formā.';

  @override
  String get uploadAsIs => 'Augšupielādēt kā ir';

  @override
  String get croppingAnimatedNotSupported =>
      'Animētu attēlu apgriešana vēl netiek atbalstīta. Tiks izmantots sākotnējais augšupielādes attēls.';

  @override
  String get cropAvatar => 'Apgriezt avatāru';

  @override
  String get cropBanner => 'Apgriezt baneri';

  @override
  String get skip => 'Izlaist';

  @override
  String get crop => 'Apgriezt';

  @override
  String get changeYourFluxerTag => 'Mainīt savu FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Lietotājvārdi var saturēt tikai burtus (a-z, A-Z), ciparus (0-9) un pasvītrojumus. Lietotājvārdi nav reģistrjutīgi.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Lietotājvārdi var saturēt tikai burtus (a-z, A-Z), ciparus (0-9) un pasvītrojumus. Lietotājvārdi nav reģistrjutīgi. Jūs varat izvēlēties jebkuru pieejamo 4 ciparu tagu no #0000 līdz #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Lietotājvārdi var saturēt tikai burtus (a-z, A-Z), ciparus (0-9) un pasvītrojumus. Lietotājvārdi nav reģistrjutīgi. Jūs varat izvēlēties jebkuru pieejamo 4 ciparu tagu no #0001 līdz #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'No $min līdz $max rakstzīmēm';
  }

  @override
  String get validationAllowedChars =>
      'Tikai burti (a-z, A-Z), cipari (0-9) un pasvītrojumi (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Iegūstiet Plutonium, lai pielāgotu savu tagu vai saglabātu to, mainot lietotājvārdu';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag jau aizņemts';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminator jau ir aizņemts. Turpinot, jūsu diskriminators tiks automātiski pārrullēts.';
  }

  @override
  String get customTagIsTemporary => 'Pielāgotais tag ir pagaidu';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Jūsu pielāgotais 4 ciparu tag ir pieejams tikai tad, kamēr ir aktīva jūsu Plutonium abonements. Kad jūsu abonements beigsies $date, jūsu tag pēc 3 dienu žēlastības perioda atgriezīsies pie nejauši piešķirta numura.';
  }

  @override
  String get customTagTemporaryBody =>
      'Jūsu pielāgotais 4 ciparu tag ir pieejams tikai tad, kamēr ir aktīva jūsu Plutonium abonements. Kad jūsu abonements beigsies, jūsu tag pēc 3 dienu žēlastības perioda atgriezīsies pie nejauši piešķirta numura.';

  @override
  String get iUnderstandContinue => 'Saprotu, turpināt';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Ja saglabāsiet šo FluxerTag, jūsu pielāgotais 4 ciparu tag pēc Plutonium abonementa beigām atgriezīsies pie nejauša numura. Ja jūsu abonements netiks atjaunots, jums būs 3 dienu žēlastības periods pirms taga maiņas.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Jūsu pielāgotais 4 ciparu tag (#$discriminator) ir aktīvs, kamēr ir aktīvs jūsu Plutonium abonements. Ja jūsu abonements beigsies vai netiks atjaunots pēc 3 dienu žēlastības perioda, jūsu tag atgriezīsies pie nejauša numura.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Pielāgojiet savu 4 ciparu tagu vai saglabājiet to, mainot lietotājvārdu';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Jūsu Plutonium izmēģinājuma periods beidzas $date. Jauniniet, lai saglabātu savu pielāgoto tagu un iegūtu emblēmu savā profilā.';
  }

  @override
  String get premiumTrialActive =>
      'Jūs izmantojat Plutonium izmēģinājuma versiju. Jauniniet, lai saglabātu savu pielāgoto tagu un iegūtu emblēmu savā profilā.';

  @override
  String get fluxerTagUpdated => 'FluxerTag atjaunināts';

  @override
  String get fluxerTagUpdateFailed =>
      'Neizdevās atjaunināt FluxerTag. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get continueAction => 'Turpināt';

  @override
  String get profileCustomizationTitle => 'Profila pielāgošana';

  @override
  String get profileCustomizationDescription =>
      'Rediģējiet sava profila izskatu un skatiet tiešraides priekšskatījumu';

  @override
  String get usernameLabel => 'Lietotājvārds';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Pieprasiet savu kontu, lai mainītu savu FluxerTag';

  @override
  String get changeFluxerTag => 'Mainīt FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Pielāgojiet savu 4 ciparu tagu (#$discriminator) pēc savas gaumes ar Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Mainīt savu lietotājvārdu un 4 ciparu tagu';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Jūsu pielāgotais tag (#$discriminator) ir saistīts ar jūsu Plutonium abonementu un tiks atjaunots uz nejaušu tagu, ja tas beigsies.';
  }

  @override
  String get displayNameLabel => 'Vārds';

  @override
  String get pronounsLabel => 'Vietniekvārdi';

  @override
  String get avatarLabel => ' ietvars';

  @override
  String get changeAvatar => 'Mainīt ietvaru';

  @override
  String get removeAvatar => 'Noņemt ietvaru';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maksimālais izmērs 10 MB. Ieteicams: 512×512 pikseļi';

  @override
  String get bannerLabel => 'Baneris';

  @override
  String get changeBanner => 'Mainīt baneri';

  @override
  String get removeBanner => 'Noņemt baneri';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maksimālais izmērs 10 MB. Minimālais izmērs: 960×540 pikseļi (16:9)';

  @override
  String get accentColorLabel => 'Akcenta krāsa';

  @override
  String get accentColorDescription =>
      'Pielāgo jūsu profila apmali un banera krāsu';

  @override
  String get aboutMeLabel => 'Par mani';

  @override
  String get aboutMeHelperText =>
      'Varat izmantot saites, emocijzīmes un Markdown.';

  @override
  String get emojiPickerTitle => 'Emocijzīmes';

  @override
  String get plutoniumBadgePrivacyTitle =>
      'Plutonium nozīmītes konfidencialitāte';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Kontrolējiet, kā jūsu Plutonium nozīmīte tiek rādīta citiem';

  @override
  String get hidePlutoniumBadgeLabel => 'Pilnībā paslēpt Plutonium nozīmīti';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Pilnībā paslēpt savu Plutonium nozīmīti no citiem lietotājiem';

  @override
  String get hidePlutoniumPurchaseDate => 'Paslēpt Plutonium iegādes datumu';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Paslēpt Plutonium iegādes datumu ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Noņemiet no savas nozīmītes informāciju par Plutonium iegādi';

  @override
  String get maskVisionaryAsSubscription => 'Maskēt Visionary kā abonementu';

  @override
  String get maskVisionaryDescription =>
      'Rādīt jūsu Visionary kā parastu abonementu';

  @override
  String get hideVisionaryIdBadge => 'Paslēpt Visionary ID nozīmīti';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Paslēpt Visionary ID nozīmīti (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Noņemiet savu Visionary ID nozīmīti';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Jūs izmantojat Plutonium izmēģinājuma versiju — jūsu abonements sāksies $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Jūsu abonements automātiski sāksies, kad beigsies izmēģinājuma periods. Nav nepieciešamas darbības.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Jūs izmantojat Plutonium izmēģinājuma versiju, kas beidzas $date';
  }

  @override
  String get premiumTrialActiveProfile =>
      'Jūs izmantojat Plutonium izmēģinājuma versiju';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maksimālais izmērs 10 MB. Ieteicams: 512×512 pikseļi. Animētiem ietvariem (GIF) nepieciešams Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Pielāgojiet savu profilu ar statisku vai animētu banera attēlu, lai tas izceltos.';

  @override
  String get getPlutonium => 'Iegūt Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Pirkumi lietotnē vēl nav pieejami šajā platformā. Sekojiet līdzi — drīzumā!';

  @override
  String get profilePreviewLabel => 'Priekšskatījums';

  @override
  String get profilePreviewMessage => 'Ziņojums';

  @override
  String get profilePreviewMemberSince => 'Fluxer dalībnieks kopš';

  @override
  String get unclaimedAccountTitle => 'Nepieprasīts konts';

  @override
  String get unclaimedAccountDescription =>
      'Jūsu konts vēl nav pieprasīts. Bez e-pasta un paroles varat zaudēt piekļuvi. Pieprasiet savu kontu tūlīt, lai to nodrošinātu.';

  @override
  String get claimAccount => 'Pieprasīt kontu';

  @override
  String get profileTypeLabel => 'Profila veids';

  @override
  String get profileTypeGlobal => 'Globālais profils';

  @override
  String get profileTypeGuildDescription =>
      'Jūs rediģējat savu profila informāciju katrai kopienai. Šis profils būs redzams tikai šajā kopienā un aizstās jūsu globālo profilu.';

  @override
  String get communityNicknameLabel => 'Kopienas segvārds';

  @override
  String get perGuildPremiumUpsellText =>
      'Individuālu kopienu iestatījumu pielāgošana (avataram, banerim, akcenta krāsai un biogrāfijai) prasa Plutoniju. Kopienas segvārds un vietniekvārdi ir bez maksas visiem.';

  @override
  String get avatarModeInherit => 'Lietot globālo profilu';

  @override
  String get avatarModeCustom => 'Lietot pielāgotu attēlu';

  @override
  String get avatarModeUnset => 'Nekrāt';

  @override
  String get profileSavedToast => 'Profils atjaunināts';

  @override
  String get profileEditButton => 'Rediģēt profilu';

  @override
  String get profileNoteLabel => 'Piezīme';

  @override
  String get profileNoteVisibility => '(redzams tikai jums)';

  @override
  String get profileNoteEmpty => 'Vēl nav piezīmes.';

  @override
  String get sudoTitle => 'Verificējiet savu identitāti';

  @override
  String get sudoDescription => 'Šī darbība prasa verifikāciju, lai turpinātu.';

  @override
  String get sudoAuthenticatorCode => 'Autentifikatora kods';

  @override
  String get sudoMethodPassword => 'Parole';

  @override
  String get sudoMethodTotp => 'Autentifikators';

  @override
  String get sudoVerificationFailed =>
      'Verifikācija neizdevās. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get securityAccountTitle => 'Konts';

  @override
  String get securityAccountDescription =>
      'Pārvaldiet savu e-pastu, paroli un konta iestatījumus';

  @override
  String get securitySectionTitle => 'Drošība';

  @override
  String get securitySectionDescription =>
      'Aizsargājiet savu kontu ar divu faktoru autentifikāciju un piekļuves atslēgām';

  @override
  String get securityLoginEmailSectionTitle => 'E-pasta iestatījumi';

  @override
  String get securityLoginEmailSectionDescription =>
      'Pārvaldiet e-pasta adresi, ko izmantojat, lai pieteiktos Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'E-pasta adrese';

  @override
  String get securityLoginNoEmailSet => 'E-pasta adrese nav iestatīta';

  @override
  String get securityLoginChangeEmail => 'Mainīt e-pastu';

  @override
  String get securityLoginAddEmail => 'Pievienot e-pastu';

  @override
  String get securityLoginReveal => 'Rādīt';

  @override
  String get securityLoginHide => 'Slēpt';

  @override
  String get securityLoginPasswordSectionTitle => 'Parole';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Mainiet savu paroli, lai jūsu konts būtu drošībā';

  @override
  String get securityLoginCurrentPasswordLabel => 'Pašreizējā parole';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Pēdējo reizi mainīta: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Pēdējo reizi mainīta: Nekad';

  @override
  String get securityLoginNoPasswordSet => 'Parole nav iestatīta';

  @override
  String get securityLoginChangePassword => 'Mainīt paroli';

  @override
  String get securityLoginSetPassword => 'Iestatīt paroli';

  @override
  String get passwordChangeTitle => 'Mainīt paroli';

  @override
  String get passwordChangeIntroDescription =>
      'Mēs nosūtīsim verifikācijas kodu uz jūsu e-pasta adresi, lai apstiprinātu jūsu identitāti pirms paroles maiņas.';

  @override
  String get passwordChangeStart => 'Sākt';

  @override
  String get passwordChangeVerifyTitle => 'Verificējiet savu e-pastu';

  @override
  String get passwordChangeVerifyDescription =>
      'Ievadiet verifikācijas kodu, kas nosūtīts uz jūsu e-pasta adresi.';

  @override
  String get passwordChangeVerificationCode => 'Verifikācijas kods';

  @override
  String get passwordChangeVerify => 'Verificēt';

  @override
  String get passwordChangeNewPasswordTitle => 'Iestatīt jaunu paroli';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Ievadiet savu jauno paroli zemāk.';

  @override
  String get passwordChangeNewPassword => 'Jaunā parole';

  @override
  String get passwordChangeConfirmPassword => 'Apstiprināt jauno paroli';

  @override
  String get passwordChangeSubmit => 'Mainīt paroli';

  @override
  String get passwordChangeSuccess => 'Parole mainīta';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Paroles nesakrīt';

  @override
  String get passwordChangeInvalidCode => 'Nederīgs vai beidzies kods';

  @override
  String get emailChangeTitle => 'Mainīt e-pastu';

  @override
  String get emailChangeIntroDescription =>
      'Mēs nosūtīsim verifikācijas kodus, lai apstiprinātu jūsu identitāti pirms e-pasta adreses maiņas.';

  @override
  String get emailChangeStart => 'Sākt';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verificēt pašreizējo e-pastu';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Ievadiet verifikācijas kodu, kas nosūtīts uz jūsu pašreizējo e-pasta adresi.';

  @override
  String get emailChangeNewEmailTitle => 'Ievadiet jauno e-pastu';

  @override
  String get emailChangeNewEmailDescription =>
      'Ievadiet jauno e-pasta adresi, kuru vēlaties izmantot.';

  @override
  String get emailChangeNewEmailLabel => 'Jauns e-pasts';

  @override
  String get emailChangeNewEmailSubmit => 'Nosūtīt verifikācijas kodu';

  @override
  String get emailChangeVerifyNewTitle => 'Verificēt jauno e-pastu';

  @override
  String get emailChangeVerifyNewDescription =>
      'Ievadiet verifikācijas kodu, kas nosūtīts uz jūsu jauno e-pasta adresi.';

  @override
  String get emailChangeSuccess => 'E-pasts mainīts';

  @override
  String get emailChangeInvalidCode => 'Nederīgs vai beidzies kods';

  @override
  String get resend => 'Nosūtīt vēlreiz';

  @override
  String resendCountdown(int seconds) {
    return 'Nosūtīt vēlreiz (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verifikācijas kods';

  @override
  String get verify => 'Verificēt';

  @override
  String get enable => 'Iespējot';

  @override
  String get disable => 'Atspējot';

  @override
  String get delete => 'Dzēst';

  @override
  String get save => 'Saglabāt';

  @override
  String get securityTfaSectionTitle => 'Divu faktoru autentifikācija';

  @override
  String get securityTfaSectionDescription =>
      'Pievienojiet savam kontam papildu drošības slāni';

  @override
  String get securityTfaAuthenticatorApp => 'Autentifikatora lietotne';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Divu faktoru autentifikācija ir iespējota';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Izmantojiet autentifikatora lietotni, lai ģenerētu kodus divu faktoru autentifikācijai';

  @override
  String get securityTfaBackupCodes => 'Rezerves kodi';

  @override
  String get securityTfaBackupCodesDescription =>
      'Skatīt un pārvaldīt savus rezerves kodus konta atjaunošanai';

  @override
  String get securityTfaViewCodes => 'Skatīt kodus';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Izmantojiet passkeys pieteikšanos bez paroles un divu faktoru autentifikācijai';

  @override
  String get securityPasskeysRegistered => 'Reģistrēti Passkeys';

  @override
  String get securityPasskeysNone => 'Nav reģistrētu passkeys';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$count $_temp0 reģistrēti (maks. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Pievienot Passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'Pievienots: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Pēdējo reizi izmantots: $date';
  }

  @override
  String get securityPasskeysRename => 'Pārdēvēt';

  @override
  String get securityPasskeysDeleteTitle => 'Dzēst Passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Vai tiešām vēlaties dzēst passkey \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nosaukt Passkey';

  @override
  String get securityPasskeyNameLabel => 'Passkey nosaukums';

  @override
  String get securityPasskeyNameHint =>
      'piemēram, YubiKey, iPhone, darba dators';

  @override
  String get securityPhoneSectionTitle => 'Tālruņa numurs';

  @override
  String get securityPhoneSectionDescription =>
      'Pārvaldīt savu tālruņa numuru.';

  @override
  String get securityPhoneLabel => 'Tālruņa numurs';

  @override
  String get securityPhoneNone => 'Nav pievienots tālruņa numurs.';

  @override
  String get securityPhoneAdd => 'Pievienot tālruni';

  @override
  String get securityPhoneRemove => 'Noņemt';

  @override
  String get securityPhoneRemoveTitle => 'Noņemt tālruņa numuru';

  @override
  String get securityPhoneRemoveDescription =>
      'Vai tiešām vēlaties noņemt savu tālruņa numuru?';

  @override
  String get securityPhoneRemoved => 'Tālruņa numurs noņemts';

  @override
  String get securityClaimTitle => 'Drošības līdzekļi';

  @override
  String get securityClaimDescription =>
      'Pieprasiet savu kontu, lai piekļūtu drošības līdzekļiem, piemēram, divu faktoru autentifikācijai un piekļuves atslēgām.';

  @override
  String get securityVerifyEmailRequired =>
      'Jums ir jāapstiprina savs e-pasta adrese, pirms varat iestatīt divu faktoru autentifikāciju, piekļuves atslēgas vai SMS verifikāciju.';

  @override
  String get totpEnableTitle => 'Iestatīt autentifikatora lietotni';

  @override
  String get totpEnableDescription =>
      'Skenējiet QR kodu ar savu autentifikatora lietotni, lai ģenerētu kodus divu faktoru autentifikācijai.';

  @override
  String get totpEnableCodeLabel => 'Kods';

  @override
  String get totpEnableCodeHint =>
      'Ievadiet 6 ciparu kodu no savas autentifikatora lietotnes';

  @override
  String get totpEnableSuccess => 'Divu faktoru autentifikācija ir iespējota';

  @override
  String get totpDisableTitle => 'Noņemt autentifikatora lietotni';

  @override
  String get totpDisableDescription =>
      'Ievadiet 6 ciparu kodu no savas autentifikatora lietotnes, lai atspējotu divu faktoru autentifikāciju.';

  @override
  String get totpDisableSuccess => 'Divu faktoru autentifikācija atspējota';

  @override
  String get backupCodesTitle => 'Rezerves kodi';

  @override
  String get backupCodesWarning =>
      'Ja pazaudēsiet piekļuvi savai autentifikatora lietotnei un jums nebūs šo kodu, jūs neatgriezeniski zaudēsiet piekļuvi savam kontam. Lejupielādējiet vai kopējiet tos tagad un glabājiet drošā vietā.';

  @override
  String get backupCodesDownload => 'Lejupielādēt';

  @override
  String get backupCodesCopy => 'Kopēt';

  @override
  String get backupCodesCopied => 'Rezerves kodi kopēti starpliktuvē';

  @override
  String get backupCodesAcknowledge =>
      'Esmu lejupielādējis vai kopējis savus rezerves kodus un glabāju tos drošā vietā.';

  @override
  String get backupCodesDone => 'Gatavs';

  @override
  String get backupCodesViewTitle => 'Skatīt rezerves kodus';

  @override
  String get backupCodesViewDescription =>
      'Pirms rezerves kodu skatīšanas var būt nepieciešama verifikācija.';

  @override
  String get phoneAddTitle => 'Pievienot tālruņa numuru';

  @override
  String get phoneAddLabel => 'Tālruņa numurs';

  @override
  String get phoneAddHint => 'Ievadiet savu tālruņa numuru';

  @override
  String get phoneAddFooter =>
      'Ievadiet savu tālruņa numuru. Mēs nosūtīsim jums verifikācijas kodu SMS veidā.';

  @override
  String get phoneAddSendCode => 'Sūtīt kodu';

  @override
  String get phoneVerifyTitle => 'Verificēt tālruņa numuru';

  @override
  String get phoneVerifyDescription =>
      'Ievadiet verifikācijas kodu, kas nosūtīts uz jūsu tālruņa numuru.';

  @override
  String get phoneAddSuccess => 'Tālruņa numurs pievienots';

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
  String get dangerZoneSectionTitle => 'Bīstamā zona';

  @override
  String get dangerZoneSectionDescription =>
      'Neatgriezeniskas un destruktīvas darbības';

  @override
  String get dangerZoneDisableTitle => 'Atspējot kontu';

  @override
  String get dangerZoneDisableDescription =>
      'Īslaicīgi atspējojiet savu kontu. Varat to aktivizēt vēlāk, vēlreiz piesakoties.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Konta atspējošana izlogos jūs no visām sesijām. Jūs varat atkārtoti aktivizēt savu kontu jebkurā laikā, vēlreiz piesakoties.';

  @override
  String get dangerZoneDeleteTitle => 'Dzēst kontu';

  @override
  String get dangerZoneDeleteDescription =>
      'Neatgriezeniski dzēsiet savu kontu un visus saistītos datus. Šo darbību nevar atcelt.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Pirms konta dzēšanas atceliet savu aktīvo Plutonium abonementu Plutonium iestatījumos.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Nevar dzēst kontu';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Jūs nevarat dzēst savu kontu, kamēr jums pieder kopienas. Vispirms pārsūtiet īpašumtiesības uz šādām kopienām:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'un vēl $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Lai pārsūtītu īpašumtiesības, dodieties uz $settingsPath un izmantojiet opciju pārsūtīt īpašumtiesības.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Vai tiešām vēlaties dzēst savu kontu? Šī darbība ieplānos jūsu konta neatgriezenisku dzēšanu.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Dzēšanas procesu varat atcelt 14 dienu laikā';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Pēc 14 dienām jūsu konts tiks neatgriezeniski dzēsts';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Pēc dzēšanas apstrādes jūs nevarēsiet atgūt piekļuvi savam kontam';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Jūs nevarēsiet dzēst savus nosūtītos ziņojumus pēc sava konta dzēšanas';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Ja vēlaties eksportēt savus datus vai vispirms dzēst savus ziņojumus, pirms turpināt, lūdzu, apmeklējiet sadaļu Privātuma informācijas panelis lietotāja iestatījumos.';

  @override
  String get claimAccountTitle => 'Pieprasīt savu kontu';

  @override
  String get claimAccountDescription =>
      'Pieprasiet savu kontu, pievienojot e-pastu un paroli. Mēs nosūtīsim verifikācijas kodu, lai apstiprinātu jūsu e-pastu pirms pabeigšanas.';

  @override
  String get claimAccountEmailLabel => 'E-pasts';

  @override
  String get claimAccountPasswordLabel => 'Parole';

  @override
  String get claimAccountSendCode => 'Sūtīt kodu';

  @override
  String get claimAccountVerifyDescription =>
      'Ievadiet kodu, ko nosūtījām uz jūsu e-pastu, lai to verificētu. Jūsu parole tiks iestatīta pēc koda apstiprināšanas.';

  @override
  String get claimAccountSuccess => 'Konts veiksmīgi pieprasīts';

  @override
  String get importantInformation => 'Svarīga informācija:';

  @override
  String get genericError => 'Radās kļūda';

  @override
  String get invalidCode => 'Nederīgs kods';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pirms $count gadiem',
      one: 'pirms 1 gada',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pirms $count mēnešiem',
      one: 'pirms 1 mēneša',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pirms $count dienām',
      one: 'pirms 1 dienas',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pirms $count stundām',
      one: 'pirms 1 stundas',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pirms $count minūtēm',
      one: 'pirms 1 minūtes',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'tikko';

  @override
  String get authorizedAppsTitle => 'Autorizētās lietojumprogrammas';

  @override
  String get authorizedAppsDescription =>
      'Šīm lietojumprogrammām ir piešķirta piekļuve jūsu Fluxer kontam.';

  @override
  String get authorizedAppsEmptyTitle => 'Nav autorizētu lietojumprogrammu';

  @override
  String get authorizedAppsEmptyDescription =>
      'Jūs neesat autorizējis nevienu lietojumprogrammu piekļuvei savam kontam.';

  @override
  String get authorizedAppsLoadError =>
      'Neizdevās ielādēt autorizētās lietojumprogrammas';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizēts $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Piešķirtās atļaujas';

  @override
  String get authorizedAppsRevoke => 'Atcelt';

  @override
  String get authorizedAppsRevokeTitle => 'Atcelt lietojumprogrammas piekļuvi';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Vai tiešām vēlaties atcelt piekļuvi lietojumprogrammai $appName? Šai lietojumprogrammai vairs nebūs piekļuves jūsu kontam.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Piekļūt jūsu pamatinformācijai (lietotājvārds, avatar, utt.)';

  @override
  String get authorizedAppsScopeEmail => 'Skatīt jūsu e-pasta adresi';

  @override
  String get authorizedAppsScopeGuilds =>
      'Skatīt kopienas, kurās esat dalībnieks';

  @override
  String get authorizedAppsScopeConnections => 'Skatīt jūsu savienotos kontus';

  @override
  String get authorizedAppsScopeBot =>
      'Pievienot botu kopienai ar pieprasītajām atļaujām';

  @override
  String get authorizedAppsScopeAdmin =>
      'Piekļūt administratīvajiem galapunktiem';

  @override
  String get privacyPendingDeletionTitle => 'Gaida dzēšanu';

  @override
  String get blockedUsersTitle => 'Bloķētie lietotāji';

  @override
  String get blockedUsersDescription =>
      'Bloķētie lietotāji nevar jums sūtīt uzaicinājumus draudzēties vai tieši rakstīt.';

  @override
  String get blockedUsersEmptyTitle => 'Nav bloķētu lietotāju';

  @override
  String get blockedUsersEmptyDescription => 'Jūs vēl nevienu neesat bloķējis.';

  @override
  String get blockedUsersLoadError => 'Neizdevās ielādēt bloķētos lietotājus';

  @override
  String get blockedUsersUnblock => 'Atbloķēt';

  @override
  String get blockedUsersUnblockTitle => 'Atbloķēt lietotāju';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Vai tiešām vēlaties atbloķēt lietotāju $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopēt FluxerTag';

  @override
  String get blockedUsersCopyId => 'Kopēt lietotāja ID';

  @override
  String get userProfileLoadError => 'Nevarēja ielādēt profilu';

  @override
  String get userProfileRetry => 'Mēģināt vēlreiz';

  @override
  String get userProfileMessage => 'Sūtīt ziņojumu';

  @override
  String get userProfileVoiceCall => 'Balss zvans';

  @override
  String get userProfileVideoCall => 'Videozvans';

  @override
  String get userProfileEditProfile => 'Rediģēt profilu';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer personāls';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer kopienas komanda';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer partneris';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium abonents kopš $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary kopš $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Kopīgi draugi ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Kopienas ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Kopīgi draugi';

  @override
  String get userProfileMutualCommunitiesTitle => 'Kopienas';

  @override
  String get userProfileNoMutualFriends => 'Kopīgi draugi nav atrasti.';

  @override
  String get userProfileNoMutualCommunities => 'Kopienas nav atrastas.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Segvārds: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Atvērt DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Jūs bloķējāt $username. Jūs nevarēsiet sūtīt ziņojumus, kamēr neatbloķēsiet viņu.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Atbloķēt';

  @override
  String get userProfileOpenDm => 'Atvērt DM';

  @override
  String get userProfileNoteTitle => 'Piezīme';

  @override
  String get userProfileNoteVisibility => '(redzams tikai jums)';

  @override
  String get userProfileNoteSave => 'Saglabāt';

  @override
  String get userProfileNoteDelete => 'Dzēst';

  @override
  String get userProfileNoteEmpty => 'Noklikšķiniet, lai pievienotu piezīmi';

  @override
  String get userProfileMemberSince => 'Dalībnieks kopš';

  @override
  String get userProfileAboutMe => 'Par mani';

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
  String get userProfileCopyUsername => 'Kopēt lietotājvārdu';

  @override
  String get userProfileCopyUserId => 'Kopēt lietotāja ID';

  @override
  String get userProfileViewMainProfile => 'Skatīt galveno profilu';

  @override
  String get userProfileViewCommunityProfile => 'Skatīt kopienas profilu';

  @override
  String get userProfileBlockUser => 'Bloķēt lietotāju';

  @override
  String get userProfileUnblockUser => 'Atbloķēt lietotāju';

  @override
  String get userProfileRemoveFriend => 'Noņemt draugu';

  @override
  String get userProfileBlockConfirmTitle => 'Bloķēt lietotāju';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Vai tiešām vēlaties bloķēt $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Atbloķēt lietotāju';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Vai tiešām vēlaties atbloķēt $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Noņemt draugu';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Vai tiešām vēlaties noņemt $username kā draugu?';
  }

  @override
  String get userProfileFailedOpenDm => 'Neizdevās atvērt DM';

  @override
  String get userProfileFailedSaveNote => 'Neizdevās saglabāt piezīmi';

  @override
  String get userProfileActionFailed =>
      'Darbība neizdevās, lūdzu, mēģiniet vēlreiz';

  @override
  String get userProfileChangeNickname => 'Mainīt segvārdu';

  @override
  String get userProfileKick => 'Izmest';

  @override
  String get userProfileBan => 'Aizliegt';

  @override
  String get userProfileTimeout => 'Laika ierobežojums';

  @override
  String get userProfileRemoveTimeout => 'Noņemt laika ierobežojumu';

  @override
  String get userProfileTransferOwnership => 'Pārsūtīt īpašumtiesības';

  @override
  String get userProfileReportUser => 'Ziņot par lietotāju';

  @override
  String get userProfileReportMessage => 'Ziņot par ziņojumu';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Izmest $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Vai tiešām vēlaties izmest $username? Viņi var pievienoties atkārtoti ar jaunu ielūgumu.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle =>
      'Noņemt laika ierobežojumu?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Noņemot laika ierobežojumu, $username varēs atkal sūtīt ziņojumus, reaģēt un pievienoties balss kanāliem.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Pārsūtīt īpašumtiesības?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Pārsūtīt šīs kopienas īpašumtiesības uz $username? Tas ir neatgriezeniski, un jūs zaudēsiet visas īpašnieka privilēģijas.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Bloķēt $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Bloķēšanas ilgums';

  @override
  String get userProfileBanCustomSecondsLabel => 'Pielāgots ilgums (sekundēs)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Jebkura vērtība no $min līdz $max sekundēm';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Dzēst ziņojumu vēsturi';

  @override
  String get userProfileBanDeleteNone => 'Dzēst neko';

  @override
  String get userProfileBanDelete24h => 'Iepriekšējās 24 stundas';

  @override
  String get userProfileBanDelete7d => 'Iepriekšējās 7 dienas';

  @override
  String get userProfileBanReasonLabel => 'Iemesls (nav obligāts)';

  @override
  String get userProfileBanReasonHint => 'Ievadiet bloķēšanas iemeslu';

  @override
  String get userProfileBanSubmit => 'Bloķēt dalībnieku';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Ierobežot $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Ierobežojuma ilgums';

  @override
  String get userProfileTimeoutSubmit => 'Ierobežot dalībnieku';

  @override
  String get userProfileNicknameLabel => 'Segvārds';

  @override
  String get userProfileNicknameHint => 'Ievadiet segvārdu';

  @override
  String get userProfileNicknameSave => 'Saglabāt';

  @override
  String userProfileKickSuccess(String username) {
    return 'Dalībnieks $username izmests';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Dalībnieks $username bloķēts';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Dalībniekam $username noteikts laika ierobežojums';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Noņemts laika ierobežojums dalībniekam $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Segvārds atjaunināts';

  @override
  String get userProfileTransferSuccess => 'Īpašumtiesības pārsūtītas';

  @override
  String get durationPermanent => 'Pastāvīgi';

  @override
  String get duration60Seconds => '60 sekundes';

  @override
  String get duration5Minutes => '5 minūtes';

  @override
  String get duration10Minutes => '10 minūtes';

  @override
  String get duration1Hour => '1 stunda';

  @override
  String get duration12Hours => '12 stundas';

  @override
  String get duration1Day => '1 diena';

  @override
  String get duration3Days => '3 dienas';

  @override
  String get duration5Days => '5 dienas';

  @override
  String get duration1Week => '1 nedēļa';

  @override
  String get duration2Weeks => '2 nedēļas';

  @override
  String get duration1Month => '1 mēnesis';

  @override
  String get durationCustom => 'Pielāgots…';

  @override
  String get iarReportUserTitle => 'Ziņot par lietotāju';

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
  String get iarReasonInappropriateProfile => 'Nepiemērots profils';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Šī lietotāja profils satur nepiemērotu saturu';

  @override
  String typingIndicatorOne(String name) {
    return '$name raksta...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 un $name2 raksta...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 un $name3 raksta...';
  }

  @override
  String get typingIndicatorMultiple => 'Vairāki cilvēki raksta...';

  @override
  String get typingIndicatorHandful => 'Pulcējas dažādi tastatūras varoņi...';

  @override
  String get typingIndicatorSymphony =>
      'Notiek taustiņu klakšķināšanas simfonija...';

  @override
  String get typingIndicatorFiesta =>
      'Šeit notiek pilnvērtīga rakstīšanas fiesta';

  @override
  String get typingIndicatorApocalypse => 'Tā ir rakstīšanas apokalipse';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Prieks, ka esi šeit, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Laipni lūgts, $username! Jūties kā mājās.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Sveiks, $username! Prieks, ka esi šeit.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Sveiks, $username! Pieslēdzies, kad būsi gatavs.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Sveiks, $username, prieks tevi šeit redzēt!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Sveiks, $username! Ceru, ka tev patiks šeit uzturēties.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Sveiks, $username, laipni aicināts!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Prieks, ka nokļuvi, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Laipni lūgts, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Laipni lūgts, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Laipni lūgts, $username! Mēs priecājamies, ka esi šeit.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Laipni lūgts, $username! Ceru, ka tev patiks šeit pavadītais laiks.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Laipni lūgts, $username! Tava nākamā saruna sākas šeit.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Laipni lūgts, $username. Mēs priecājamies, ka esi šeit.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Prieks tevi redzēt, $username! Laipni lūgts.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Tu esi šeit, $username! Prieks, ka esi kopā ar mums.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Tu esi ieradies, $username! Sāksim.';
  }

  @override
  String get relativeTimeShortNow => 'tagad';

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
  String get linkedDevicesTitle => 'Manas ierīces';

  @override
  String get linkedDevicesDescription =>
      'Skatīt visas ierīces, kas pašlaik ir pieteiktas jūsu kontā. Atsaukt jebkuras sesijas, kuras neatpazīstat.';

  @override
  String get linkedDevicesCurrentDevice => 'Pašreizējā ierīce';

  @override
  String get linkedDevicesOtherDevices => 'Citas ierīces';

  @override
  String get linkedDevicesEnterSelection => 'Ienākt atlases režīmā';

  @override
  String get linkedDevicesExitSelection => 'Iziet no atlases režīma';

  @override
  String get linkedDevicesSelectAll => 'Atlasīt visu';

  @override
  String get linkedDevicesClearSelection => 'Notīrīt atlasi';

  @override
  String get linkedDevicesRevokeTooltip => 'Atsaukt ierīci';

  @override
  String get linkedDevicesSignOutAll => 'Izrakstīt visas pārējās ierīces';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izrakstīt $count ierīces',
      one: 'Izrakstīt 1 ierīci',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izrakstīt $count ierīces',
      one: 'Izrakstīt 1 ierīci',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Izrakstīt visas pārējās ierīces';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tas izrakstīs atlasītās ierīces no jūsu konta. Jums būs jāpiesakās vēlreiz tajās ierīcēs.',
      one:
          'Tas izrakstīs atlasīto ierīci no jūsu konta. Jums būs jāpiesakās vēlreiz tajā ierīcē.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Tas izrakstīs atlasītās ierīces no jūsu konta. Jums būs jāpiesakās vēlreiz tajās ierīcēs.';

  @override
  String get linkedDevicesSignOutConfirm => 'Turpināt';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Jums būs jāpiesakās vēlreiz visās izrakstītajās ierīcēs';

  @override
  String get linkedDevicesLoadErrorTitle => 'Tīkla kļūda';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Mums ir problēmas savienoties ar laika-telpas nepārtrauktību. Lūdzu, pārbaudiet savu savienojumu un mēģiniet vēlreiz.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ierīces atsaukta',
      one: 'Ierīce atsaukta',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Nevarēja izrakstīt. Mēģiniet vēlreiz.';

  @override
  String get linkedDevicesUnknownOs => 'Nezināma OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Nezināma platforma';

  @override
  String slowmodeLabel(String duration) {
    return '$duration lēnais režīms';
  }

  @override
  String get slowmodeTooltipActive =>
      'Jūs esat lēnajā režīmā. Lūdzu, uzgaidiet pirms nākamās ziņas nosūtīšanas.';

  @override
  String get slowmodeTooltipImmune =>
      'Lēnais režīms ir iespējots, bet jūs tam neesat pakļauts.';

  @override
  String get channelNoSendPermissionHint =>
      'Jūs nevarat sūtīt ziņojumus šajā kanālā.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Sistēmas paziņojumi no $productName personāla. Jūs nevarat atbildēt šeit.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Ziņojumapmaiņa šajā kopienā ir īslaicīgi apturēta.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Jums ir laika ierobežojums. Ziņojumapmaiņa, reakcijas un balss saziņa ir apturēta, līdz beidzas laika ierobežojums.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Jums ir jāpieprasa savs konts, lai sūtītu ziņojumus šajā kopienā.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Jums ir jāapstiprina savs e-pasts, lai sūtītu ziņojumus šajā kopienā.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Jūsu konts ir pārāk jauns, lai sūtītu ziņojumus šajā kopienā.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Jūs neesat bijis šīs kopienas dalībnieks pietiekami ilgi, lai sūtītu ziņojumus.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Jums ir jāapstiprina tālruņa numurs, lai sūtītu ziņojumus šajā kopienā.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Apstiprināt e-pastu';

  @override
  String get channelComposerBarrierVerifyPhone => 'Apstiprināt tālruni';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Pārāk daudz pielikumu (maks. $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Viens vai vairāki faili pārsniedz izmēra ierobežojumu';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Šie faili ir pārāk lieli, lai tos nosūtītu kopā';

  @override
  String get chatAttachmentDropToUpload => 'Velciet failus, lai augšupielādētu';

  @override
  String get chatAttachmentDropToSend => 'Velciet failus, lai nosūtītu tūlīt';

  @override
  String get chatAttachmentSendVoiceMessage => 'Sūtīt balss ziņojumu';

  @override
  String get voiceMessageTitle => 'Balss ziņojums';

  @override
  String get voiceMessageHoldHint =>
      'Piespiediet, lai ierakstītu. Velciet uz augšu, lai bloķētu, vai atlaidiet, lai nosūtītu.';

  @override
  String get voiceMessageDiscard => 'Dzēst balss ziņojumu';

  @override
  String get voiceMessageSend => 'Sūtīt balss ziņojumu';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nevar sākt ierakstīšanu. Atļaut piekļuvi mikrofonam.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Balss ierakstīšana netiek atbalstīta šajā ierīcē.';

  @override
  String get voiceMessageMicInUse =>
      'Atstājiet balss zvanu, lai ierakstītu balss ziņojumu.';

  @override
  String get voiceMessageRecordingFailed =>
      'Ierakstīšana neizdevās. Mēģiniet vēlreiz.';

  @override
  String get voiceMessageSendFailed =>
      'Nevar nosūtīt balss ziņojumu. Mēģiniet vēlreiz.';

  @override
  String get voiceMessageRecordingHint =>
      'Runājiet tagad. Nospiediet Apturēt, kad esat pabeidzis — pēc tam varat apgriezt.';

  @override
  String get voiceMessageReviewHint =>
      'Velciet rokturus, lai apgrieztu, pēc tam nospiediet Sūtīt.';

  @override
  String get voiceMessageStop => 'Apturēt';

  @override
  String get voiceMessageStartRecording => 'Sākt ierakstīšanu';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Atskaņot';

  @override
  String get voiceMessagePause => 'Pauze';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Atlasījumam jābūt vismaz ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Rediģēt pielikumu';

  @override
  String get chatAttachmentFilenameLabel => 'Faila nosaukums';

  @override
  String get chatAttachmentDescriptionLabel => 'Apraksts';

  @override
  String get chatAttachmentDescriptionHint => 'Neobligāts alternatīvais teksts';

  @override
  String get chatAttachmentSpoilerLabel => 'Atzīmēt kā spoileru';

  @override
  String get chatAttachmentRemove => 'Noņemt pielikumu';

  @override
  String get chatAttachmentDownload => 'Lejupielādēt';

  @override
  String get chatAttachmentExpiredTooltip => 'Pielikums ir zaudējis derīgumu';

  @override
  String get chatAttachmentSourceGallery => 'Galerija';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Pārlūkot failus';

  @override
  String get chatAttachmentPasteTooltip => 'Ievietot attēlu no starpliktuves';

  @override
  String get chatAttachmentSpoiler => 'Spoilers';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Atklāt spoileru';

  @override
  String get matureMediaRevealButton => 'Atklāt';

  @override
  String get matureMediaRevealHint => 'Noklikšķiniet, lai atklātu';

  @override
  String get matureContentTitle => 'Nepiedienīgs saturs';

  @override
  String get matureCommunityTitle => 'Kopiena pieaugušajiem';

  @override
  String get matureCategoryTitle => 'Kategorija pieaugušajiem';

  @override
  String get matureChannelTitle => 'Kanāls pieaugušajiem';

  @override
  String get communityContentWarningTitle => 'Brīdinājums par kopienas saturu';

  @override
  String get categoryContentWarningTitle =>
      'Brīdinājums par kategorijas saturu';

  @override
  String get channelContentWarningTitle => 'Brīdinājums par kanāla saturu';

  @override
  String get defaultContentWarningBody => 'Šis satur sensitīvu saturu.';

  @override
  String get matureCommunityBody =>
      'Šī kopiena ir atzīmēta kā saturs pieaugušajiem un var saturēt materiālu, kas var būt nepiemērots dažiem lietotājiem.';

  @override
  String get matureCategoryBody =>
      'Šī kategorija ir atzīmēta kā saturs pieaugušajiem un var saturēt materiālu, kas var būt nepiemērots dažiem lietotājiem.';

  @override
  String get matureChannelBody =>
      'Šis kanāls ir atzīmēts kā saturs pieaugušajiem un var saturēt materiālu, kas var būt nepiemērots dažiem lietotājiem.';

  @override
  String get matureVoiceChannelBody =>
      'Šis balss kanāls ir atzīmēts kā saturs pieaugušajiem un var saturēt materiālu, kas var būt nepiemērots dažiem lietotājiem.';

  @override
  String get matureLinkChannelBody =>
      'Šis saites kanāls ir atzīmēts kā saturs pieaugušajiem un var atvērt materiālu, kas var būt nepiemērots dažiem lietotājiem.';

  @override
  String get matureCommunityUnavailableBody =>
      'Šī pieaugušajiem paredzētā kopiena nav pieejama jūsu kontam.';

  @override
  String get matureCategoryUnavailableBody =>
      'Šī pieaugušajiem paredzētā kategorija nav pieejama jūsu kontam.';

  @override
  String get matureChannelUnavailableBody =>
      'Šis pieaugušajiem paredzētais kanāls nav pieejams jūsu kontam.';

  @override
  String get matureContentProceedButton => 'Turpināt';

  @override
  String get matureContentUnderstandButton => 'Es saprotu';

  @override
  String get matureContentOpenLinkButton => 'Atvērt saiti';

  @override
  String get sensitiveContentSectionTitle => 'Sensitīvs saturs';

  @override
  String get sensitiveContentSectionDescription =>
      'Kontrolējiet, kā tiek filtrēti pieaugušajiem vai sensitīvi mediji dažādos kontekstos';

  @override
  String get sensitiveContentFriendDmLabel => 'Tiešās ziņas no draugiem';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Tiešās ziņas no citiem';

  @override
  String get sensitiveContentGuildLabel => 'Ziņojumi kopienas kanālos';

  @override
  String get sensitiveContentFilterShow => 'Rādīt';

  @override
  String get sensitiveContentFilterBlur => 'Aizmiglot';

  @override
  String get sensitiveContentFilterBlock => 'Bloķēt';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Aizmiglot medijus līdz drošības skenēšanas pabeigšanai';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Ja iespējots, attēli un video tiek aizmigloti, līdz pabeigta satura drošības skenēšana.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Šis iestatījums vienmēr ir ieslēgts jūsu kontam.';

  @override
  String get sensitiveContentResetButton => 'Atiestatīt';

  @override
  String get sensitiveContentSaveButton => 'Saglabāt';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count failus',
      one: '1 failu',
    );
    return 'Augšupielādē $_temp0';
  }

  @override
  String get chatCancelUpload => 'Atcelt augšupielādi';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Derīgs līdz $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Derīgs starp $start un $end';
  }

  @override
  String get connectionsTitle => 'Savienojumi';

  @override
  String get connectionsDescription =>
      'Saistiet ārējos kontus un domēnus ar savu Fluxer profilu. Verificēti savienojumi tiks parādīti jūsu profilā, lai citi varētu tos redzēt.';

  @override
  String get connectionsEmptyTitle => 'Vēl nav savienojumu';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Saistiet savu Bluesky kontu vai verificējiet domēna īpašumtiesības, lai tos parādītu savā profilā.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verificējiet domēna īpašumtiesības, lai to parādītu savā profilā.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domēns';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Pievienot Bluesky savienojumu';

  @override
  String get connectionsAddDomainAriaLabel => 'Pievienot domēna savienojumu';

  @override
  String get connectionEdit => 'Rediģēt';

  @override
  String get connectionRemove => 'Noņemt';

  @override
  String get connectionVerifiedLabel => 'Šis savienojums ir verificēts.';

  @override
  String get connectionUnverifiedLabel => 'Šis savienojums nav verificēts.';

  @override
  String get connectionAddTitle => 'Pievienot savienojumu';

  @override
  String get connectionTypeLabel => 'Savienojuma veids';

  @override
  String get connectionHandleLabel => 'Rokturis';

  @override
  String get connectionDomainLabel => 'Domēns';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Jums jau ir šis savienojums.';

  @override
  String get connectionConnectBluesky => 'Savienot ar Bluesky';

  @override
  String get connectionContinue => 'Turpināt';

  @override
  String get connectionVerifyTitle => 'Verificēt savienojumu';

  @override
  String get connectionVerifyInstructions =>
      'Izmantojiet tālāk norādīto ierakstu, lai pierādītu domēna īpašumtiesības.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT ieraksts';

  @override
  String get connectionDnsHostLabel => 'Resursdators';

  @override
  String get connectionDnsValueLabel => 'Vērtība';

  @override
  String get connectionCopyHost => 'Kopēt resursdatoru';

  @override
  String get connectionCopyValue => 'Kopēt vērtību';

  @override
  String get connectionCopied => 'Nokopēts!';

  @override
  String get connectionTokenFileTitle => 'Apkalpot verifikācijas failu';

  @override
  String get connectionTokenFileDescription =>
      'Lejupielādējiet **fluxer-verification** un ievietojiet to savā **.well-known** mapē, lai mēs varētu apstiprināt domēnu.';

  @override
  String get connectionTokenFileDownload => 'Lejupielādēt fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Fails satur verifikācijas marķieri, ko mēs izgūsim no **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Saglabāt fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verificēt';

  @override
  String get connectionBack => 'Atpakaļ';

  @override
  String get connectionEditTitle => 'Rediģēt savienojumu';

  @override
  String get connectionEditDescription =>
      'Izvēlieties, kas var redzēt šo savienojumu jūsu profilā.';

  @override
  String get connectionVisibilityEveryone => 'Visi';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Atļaut ikvienam redzēt šo savienojumu jūsu profilā';

  @override
  String get connectionVisibilityFriends => 'Draugi';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Atļaut jūsu draugiem redzēt šo savienojumu';

  @override
  String get connectionVisibilityCommunityMembers => 'Kopienas dalībnieki';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Atļaut dalībniekiem no kopienām, kurās atrodaties, redzēt šo savienojumu';

  @override
  String get connectionRemoveTitle => 'Noņemt savienojumu';

  @override
  String get connectionRemoveDescription =>
      'Vai tiešām vēlaties noņemt šo savienojumu? Šo darbību nevar atsaukt.';

  @override
  String get connectionRemoveConfirm => 'Noņemt';

  @override
  String get connectionsLoadError => 'Neizdevās ielādēt savienojumus';

  @override
  String get connectionsReorderError => 'Neizdevās atjaunināt secību';

  @override
  String get connectionInitiateFailed =>
      'Nevarēja sākt verifikāciju. Mēģiniet vēlreiz.';

  @override
  String get connectionVerifyFailed =>
      'Nevarēja verificēt. Pārbaudiet savu DNS ierakstu un mēģiniet vēlreiz.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Nevarēja sākt Bluesky autorizāciju.';

  @override
  String get connectionUpdateFailed => 'Nevarēja atjaunināt savienojumu';

  @override
  String get connectionRemoveFailed => 'Nevarēja noņemt savienojumu';

  @override
  String get connectionTokenSavedToast => 'Fluxer-verification saglabāts';

  @override
  String get connectionTokenSaveFailedToast => 'Nevarēja saglabāt failu';

  @override
  String get connectionEnterHandle => 'Ievadiet Bluesky rokturi.';

  @override
  String get connectionEnterDomain => 'Ievadiet domēnu.';

  @override
  String get lookAndFeelTitle => 'Izskats un noformējums';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tēma';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Izvēlieties tumšu, ogles krāsas vai gaišu izskatu.';

  @override
  String get lookAndFeelThemeDark => 'Tumšā tēma';

  @override
  String get lookAndFeelThemeCoal => 'Ogles krāsas tēma';

  @override
  String get lookAndFeelThemeLight => 'Gaišā tēma';

  @override
  String get lookAndFeelThemeSystem => 'Sistēmas tēma';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sinhronizēt tēmu visās ierīcēs';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Ja iespējots, motīva izmaiņas tiks sinhronizētas visās jūsu ierīcēs. Ja tas ir atspējots, šī ierīce izmantos savus motīva iestatījumus.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Sistēmas motīvs automātiski atspējo sinhronizāciju, lai šajā ierīcē sekotu jūsu sistēmas izvēlei.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Neizdevās sinhronizēt motīvu ar jūsu kontu. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Tērzēšanas fonta mērogošana';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Pielāgojiet fonta lielumu tērzēšanas apgabalā.';

  @override
  String get lookAndFeelInterfaceTitle => 'Interfeiss';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Pielāgojiet interfeisa elementus un darbības.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Kanālu saraksta rakstīšanas indikatori';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Izvēlieties, kā rakstīšanas indikatori parādās kanālu sarakstā, kad kāds raksta kanālā.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Rakstīšanas indikators + Avatari';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Rādīt rakstīšanas indikatoru ar lietotāju avatariem kanālu sarakstā';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Tikai rakstīšanas indikators';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Rādīt tikai rakstīšanas indikatoru bez avatariem';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Paslēpts';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Nekad nerādīt rakstīšanas indikatorus kanālu sarakstā';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Rādīt rakstīšanu atlasītajā kanālā';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Ja tas ir atspējots (pēc noklusējuma), rakstīšanas indikatori neparādīsies kanālā, kuru pašlaik skatāt.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'vispārīgi';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Tastatūras uzvednes';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Kontrolējiet, vai tastatūras īsceļu uzvednes parādās rīku padomos.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Paslēpt tastatūras uzvednes rīku padomos';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Ja iespējots, īsceļu emblēmas ir paslēptas rīku padomu uznirstošajos logos.';

  @override
  String get lookAndFeelNekoTitle => 'Dažādi';

  @override
  String get lookAndFeelNekoDescription => 'Dažādas interfeisa opcijas.';

  @override
  String get lookAndFeelShowNekoLabel => 'Rādīt Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Ja iespējots, Neko parādās pie tērzēšanas ievades joslas.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Balss kanālu pievienošanās uzvedība';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Kontrolējiet, kā pievienojaties balss kanāliem kopienās.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Nepieciešama dubultklikšķināšana, lai pievienotos balss kanāliem';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Ja iespējots, jums būs nepieciešama dubultklikšķināšana uz balss kanāliem, lai tiem pievienotos. Ja tas ir atspējots (pēc noklusējuma), ar vienu klikšķināšanu kanāls tiks pievienots nekavējoties.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Ātrais brūnais lapsa lec pāri slinkajam sunim.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Servera sānu josla';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigurējiet, kā servera sānu josla parāda tiešos ziņojumus.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kopienas ir īslaicīgi nepieejamas kļūmes dēļ.',
      one: '1 kopiena ir īslaicīgi nepieejama kļūmes dēļ.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Sakļaut DM mapē';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Ja iespējots, nelasītie DM servera sānu joslā tiek sakļauti mapē zem Fluxer pogas. Noklikšķiniet uz Fluxer pogas, atrodoties DM lapā, lai atvērtu vai sakļautu mapi.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanālu saraksts';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Kontrolējiet nelasīto indikatoru uzvedību izslēgtajiem kanāliem kanālu sarakstos.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Rādīt nelasīto indikatoru izslēgtajos kanālos';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Ja iespējots, izslēgtajos kanālos kreisajā pusē parādās izbalējis nelasītais indikators. Atzīmes joprojām parādās neatkarīgi no šiem iestatījumiem.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Tagad aktīvi';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Kontrolējiet, kā “Tagad aktīvi” parādās visā lietotnē.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Rādīt “Tagad aktīvi” sākuma ekrānā';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Rādīt “Tagad aktīvi” sākuma ekrānā, lai parādītu draugus, kas ir aktīvi balsī. Jūs redzēsiet priekšskatījumu, kanāla kontekstu, kas jau ir tur, un ātru veidu, kā pievienoties.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Izlase';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Kontrolējiet izlases redzamību visā lietotnē.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Iespējot izlasi';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Ja iespējots, varat pievienot kanālus izlasei, un tie parādīsies sadaļā Izlase. Ja tas ir atspējots, visi ar izlasi saistītie UI elementi (pogas, izvēlnes vienumi) tiks paslēpti. Jūsu esošā izlase tiks saglabāta.';

  @override
  String get favoritesTitle => 'Izlase';

  @override
  String get favoritesEmptyTitle => 'Vēl nav izlases';

  @override
  String get favoritesEmptyDescription =>
      'Zvaigznes kanālus no tērzēšanas galvenes, lai saglabātu tos šeit.';

  @override
  String get favoritesWelcomeTitle => 'Laipni lūdzam izlasē';

  @override
  String get favoritesWelcomeDescription =>
      'Jūsu personīgā vieta ātrai piekļuvei kanāliem, DM un grupām, kas jums patīk. Nospiediet zvaigzni jebkurā kanālā, lai pievienotu to šeit.';

  @override
  String get favoritesWelcomeTip =>
      'Nav priekš jums? Jebkurā laikā varat to izslēgt.';

  @override
  String get favoritesDisableButton => 'Atspējot izlasi';

  @override
  String get favoritesAddedToast => 'Pievienots izlasei';

  @override
  String get favoritesRemovedToast => 'Noņemts no izlases';

  @override
  String get favoritesHiddenToast => 'Izlase paslēpta';

  @override
  String get favoritesMute => 'Izslēgt izlases skaņu';

  @override
  String get favoritesUnmute => 'Ieslēgt izlases skaņu';

  @override
  String get favoritesHeaderMenu => 'Izlases izvēlne';

  @override
  String get favoritesCreateCategory => 'Izveidot kategoriju';

  @override
  String get favoritesCategoryNameLabel => 'Kategorijas nosaukums';

  @override
  String get favoritesHideMutedChannels => 'Slēpt izslēgtos kanālus';

  @override
  String get favoritesShowMutedChannels => 'Rādīt izslēgtos kanālus';

  @override
  String get favoritesSetNickname => 'Iestatīt segvārdu';

  @override
  String get favoritesNicknameLabel => 'Segvārds';

  @override
  String get favoritesSaveNickname => 'Saglabāt segvārdu';

  @override
  String get favoritesMoveToCategory => 'Pārvietot uz kategoriju';

  @override
  String get favoritesUncategorized => 'Nekategorizēts';

  @override
  String get favoritesOtherCategory => 'Cits';

  @override
  String get favoritesRemoveFromFavorites => 'Noņemt no izlases';

  @override
  String get favoritesAddToFavorites => 'Pievienot izlasei';

  @override
  String get favoritesHideConfirmTitle => 'Paslēpt izlasi';

  @override
  String get favoritesHideConfirmDescription =>
      'Tas paslēps visus ar izlasi saistītos UI elementus, ieskaitot pogas un izvēlnes vienumus. Jūsu esošā izlase tiks saglabāta un to varēs atkārtoti iespējot jebkurā laikā sadaļā Iestatījumi > Papildu > Izskats.';

  @override
  String get favoritesDirectMessageSubtitle => 'Tiešais ziņojums';

  @override
  String get messagesMediaDisplayGroupTitle => 'Displejs';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Kontrolējiet, kā tiek rādīti ziņojumi, mediji un cits saturs.';

  @override
  String get messagesMediaMediaGroupTitle => 'Multivide';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Pielāgojiet multivides izmēra preferences un pogas.';

  @override
  String get messagesMediaInputGroupTitle => 'Ievade';

  @override
  String get messagesMediaInputGroupDescription =>
      'Pielāgojiet ziņojumu ievades iestatījumus.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Sānjosla';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigurējiet, kā tiek rādīta kopienas sānjosla.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Pēc noklusējuma slēpt izslēgtos kanālus';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automātiski slēpt izslēgtos kanālus sānjoslā, pievienojoties jaunām kopienām';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Vai pēc noklusējuma slēpt izslēgtos kanālus?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Jaunajām kopienām, kurām pievienosities, automātiski tiks paslēpti izslēgtie kanāli. Vai vēlaties šo iestatījumu piemērot arī visām jūsu esošajām kopienām?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Vai pārtraukt izslēgto kanālu slēpšanu pēc noklusējuma?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Jaunajām kopienām, kurām pievienosities, vairs netiks automātiski paslēpti izslēgtie kanāli. Vai vēlaties arī rādīt izslēgtos kanālus visās jūsu esošajās kopienās?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Piemērot visām kopienām';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Rādīt visās kopienās';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Tikai jaunajām kopienām';

  @override
  String get messagesMediaDisplaySectionTitle => 'Multivides displejs';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Kontrolējiet, kā tiek rādīti attēli, video un cita multivide. Visa multivide tiek mainīta izmēros un konvertēta. Īpaši lieli faili, kurus nevar saspiest priekšskatījumā, netiks iegulti neatkarīgi no šiem iestatījumiem.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Kad publicēts kā saites uz tērzēšanu';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Kad augšupielādēts tieši uz Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Saites priekšskatījumi';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Kontrolējiet, kā vietņu saites tiek priekšskatītas tērzēšanā';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Rādīt iegultnes un priekšskatīt vietņu saites';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakcijas';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfigurēt emocijikona reakcijas uz ziņojumiem';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Rādīt emocijikona reakcijas uz ziņojumiem';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Slepenais saturs';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Kontrolēt, kā tiek rādīts slepenais saturs';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Rādīt slepeno saturu';

  @override
  String get messagesMediaSpoilersOnClickName => 'Noklikšķinot';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Rādīt slepeno saturu, kad tiek uzklikšķināts';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'Kanālos, ko moderēju';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Vienmēr rādīt slepeno saturu kanālos, kuros jums ir atļauja \"Pārvaldīt ziņojumus\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Vienmēr';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Vienmēr rādīt slepeno saturu';

  @override
  String get messagesMediaSizeSectionTitle => 'Multivides izmēra preferences';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Pielāgojiet iegultās un pievienotās multivides maksimālo attēlojuma izmēru. Mazāki izmēri aizņem mazāk vietas, savukārt lielāki izmēri parāda vairāk detaļu.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Multivide no saitēm (iegultās)';

  @override
  String get messagesMediaSizeAttachmentLabel =>
      'Augšupielādētās pievienotās datnes';

  @override
  String get messagesMediaSizeCompactName => 'Kompakts (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Mazāks multivides izmērs';

  @override
  String get messagesMediaSizeComfortableName => 'Ērts (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Lielāks multivides izmērs ar vairāk detaļu';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF darbības';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Kontrolēt, kā GIF tiek ievietoti tērzēšanā';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automātiski sūtīt GIF, kad tie ir atlasīti';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Emociju automātiskā aizpildīšana (ar dubultpunktu)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Kontrolējiet, kas parādās emociju automātiskajā aizpildīšanā, kad rakstāt dubultpunktu. Pielāgojiet, kādi ieteikumi tiek rādīti, lai tie atbilstu jūsu vēlmēm.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Rādīt noklusējuma emocijzīmes automātiskajā izteiksmju papildināšanā';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Rādīt pielāgotās emocijzīmes automātiskajā izteiksmju papildināšanā';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Rādīt uzlīmes automātiskajā izteiksmju papildināšanā';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Rādīt saglabātos medijus automātiskajā izteiksmju papildināšanā';

  @override
  String get messagesMediaEditingSectionTitle => 'Ziņojumu rediģēšana';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Kontrolējiet, kas notiek ar jūsu rediģēšanas projektu, kad atceļat.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Saglabāt rediģēšanas projektu atcelšanas gadījumā';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Nelasītu indikatori';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Kontrolējiet, kā tiek rādīti nelasīto ziņojumu indikatori.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Rādīt pieklusinātu nelasītu indikatoru pieklusinātajos kanālos';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Rādīt pieklusinātu nelasītu indikatoru blakus pieklusinātajiem tiešajiem ziņojumiem un kanāliem, lai jūs joprojām varētu ātri redzēt, kad ir aktivitāte.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'DM ziņojumu priekšskatījumi';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Kontrolējiet, kad ziņojumu priekšskatījumi tiek rādīti DM sarakstā.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM ziņojumu priekšskatījuma režīms';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Visi ziņojumi';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Rādīt ziņojumu priekšskatījumus visām DM sarunām';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Tikai nelasītie DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Rādīt ziņojumu priekšskatījumus tikai DM ar nelasītiem ziņojumiem';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nav';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Neparādīt ziņojumu priekšskatījumus DM sarakstā';

  @override
  String get dmListSentAnAttachment => 'Nosūtīja pielikumu';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username piesprauda ziņojumu šim kanālam.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username pievienoja $userName grupai.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username pievienoja kādu grupai.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username ir izgājis no grupas.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username izslēdza $userName no grupas.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username izslēdza kādu no grupas.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username mainīja kanāla nosaukumu uz $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username mainīja kanāla nosaukumu.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username mainīja kanāla ikonu.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username sāka zvanu.';
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
  String systemCallDurationYears(String count) {
    return '$count years';
  }

  @override
  String systemCallDurationMonths(String count) {
    return '$count months';
  }

  @override
  String systemCallDurationWeeks(String count) {
    return '$count weeks';
  }

  @override
  String systemCallDurationDays(String count) {
    return '$count days';
  }

  @override
  String systemCallDurationHours(String count) {
    return '$count hours';
  }

  @override
  String systemCallDurationMinutes(String count) {
    return '$count minutes';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Update $productName to view this message.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Balss savienojuma apstiprinājums';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Jūs jau esat savienots ar šo balss kanālu no $count citām ierīcēm. Ko vēlaties darīt?',
      one:
          'Jūs jau esat savienots ar šo balss kanālu no 1 citas ierīces. Ko vēlaties darīt?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Pārslēgties uz šo ierīci';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Vienkārši pievienoties (saglabāt citus savienojumus)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Neko nedarīt, es nevēlos pievienoties';

  @override
  String get voiceChannelEmptyDescription =>
      'Šis ir balss kanāls. Savienojieties, lai sāktu runāt!';

  @override
  String get voiceChannelJoin => 'Pievienoties balss kanālam';

  @override
  String get voiceChannelJoinConnect => 'Savienoties ar balsi';

  @override
  String get voiceChannelNoConnectPermission =>
      'Jums nav atļaujas pievienoties šim balss kanālam';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofona, kameras un ekrāna kopīgošanas saturs ir šifrēts no gala līdz galam.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofona, kameras un ekrāna kopīgošanas saturs ir šifrēts no gala līdz galam.';

  @override
  String get voiceChannelE2eeBroken =>
      'Šifrēšana no gala līdz galam nav pieejama, jo šajā balss kanālā ir neatbalstīts dalībnieks.';

  @override
  String get voiceCallE2eeBroken =>
      'Šifrēšana no gala līdz galam nav pieejama, jo šajā zvanā ir neatbalstīts dalībnieks.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Šis klients ir jāatjaunina pirms pievienošanās šim šifrētajam zvanam.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nevarēja ieslēgt mikrofonu. Jūs joprojām esat zvanā.';

  @override
  String get voiceChannelStatusConnecting => 'Savienojas…';

  @override
  String get voiceChannelStatusConnected => 'Savienots';

  @override
  String get voiceChannelStatusError => 'Kļūda';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobilā ierīce';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Darbvirsmas ierīce';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Kopienas izslēgts';

  @override
  String get voiceParticipantTooltipMuted => 'Izslēgts';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Kopienas nedzirdīgs';

  @override
  String get voiceParticipantTooltipDeafened => 'Nedzirdīgs';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Savienojums: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dalībnieki',
      one: '1 dalībnieks',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Atstāt';

  @override
  String get voiceControlMute => 'Izslēgt mikrofonu';

  @override
  String get voiceControlUnmute => 'Ieslēgt mikrofonu';

  @override
  String get voiceControlDeafen => 'Izslēgt skaņu';

  @override
  String get voiceControlUndeafen => 'Ieslēgt skaņu';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Kopīgot ekrānu';

  @override
  String get voiceScreenShareNotificationText => 'Tiek kopīgots jūsu ekrāns.';

  @override
  String get voiceControlMore => 'Vairāk';

  @override
  String get voiceControlDisconnect => 'Atvienoties';

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
  String get voiceControlChat => 'Tērzēt';

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
  String get voiceTextChatShow => 'Rādīt tērzēšanu';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# nelasīti ziņojumi',
      one: '# nelasītu ziņojumu',
    );
    return 'Rādīt tērzēšanu ar $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Kameras atļauja ir nepieciešama video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nevarēja sākt ekrāna kopīgošanu. Lai mēģinātu vēlreiz.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Ekrāna kopīgošanas atļauja tika atteikta.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Ekrāna kopīgošana nav pieejama šajā ierīcē.';

  @override
  String get voiceWatchStream => 'Skatīties straumi';

  @override
  String get voiceStopWatching => 'Beigt skatīties';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Beigt skatīties pašreizējo straumi';

  @override
  String get voiceOwnScreenShareTitle => 'Jūs pārraidāt';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Jūsu straume ir tiešraidē dalībniekiem.';

  @override
  String get voiceLiveBadge => 'Tiešraide';

  @override
  String get dmVoiceViewCall => 'Skatīt zvanu';

  @override
  String get dmVoiceCallFullScreen => 'Pilnekrāna režīms';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Atvērt zvanu pilnekrāna režīmā';

  @override
  String get dmVoiceStripStatusConnecting => 'Notiek savienojums...';

  @override
  String get dmVoiceStripStatusInCall => 'Zvanā';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Balss zvans';

  @override
  String get dmVoiceCallBarConnecting => 'Notiek savienojums...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Tiešais zvans';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Grupas zvans';

  @override
  String get dmVoiceCallBarIssueFallback => 'Balss problēma';

  @override
  String get dmVoiceFullscreenTitle => 'Balss';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Balss savienots';

  @override
  String get notificationsPageTitle => 'Paziņojumi';

  @override
  String get notificationsFilterUnreads => 'Nelasītie';

  @override
  String get notificationsFilterMentions => 'Mijiedarbības';

  @override
  String get notificationsBookmarksTooltip => 'Grāmatzīmes';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrēt mijiedarbības';

  @override
  String get notificationsMentionFiltersTitle => 'Mijiedarbības filtri';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Iekļaut @everyone un @here mijiedarbības';

  @override
  String get notificationsMentionIncludeRoles => 'Iekļaut lomu mijiedarbības';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Iekļaut visas kopienas mijiedarbības';

  @override
  String get notificationsNoUnreadTitle => 'Nav nelasītu ziņojumu';

  @override
  String get notificationsNoUnreadBody => 'Jūs esat visu izlasījis.';

  @override
  String get notificationsNoMentionsTitle => 'Nav nesenu mijiedarbību';

  @override
  String get notificationsNoMentionsBody =>
      'Visas jūsu @mijiedarbības šeit parādīsies 7 dienas.';

  @override
  String get notificationsMentionsEndTitle => 'Jūs esat sasniedzis beigas';

  @override
  String get notificationsMentionsEndBody =>
      'Jūs esat redzējis visas savas nesenās mijiedarbības. Neuztraucieties, drīzumā šeit parādīsies jaunas.';

  @override
  String get notificationsJump => 'Lēkt';

  @override
  String get notificationsRemoveMentionTooltip => 'Noņemt mijiedarbību';

  @override
  String get notificationsViewAllUnread => 'Skatīt visus nelasītos';

  @override
  String get notificationsMarkAsRead => 'Atzīmēt kā izlasītu';

  @override
  String get notificationsExpand => 'Izvērst';

  @override
  String get notificationsCollapse => 'Sakļaut';

  @override
  String get notificationsMessageUnavailable => 'Šo ziņojumu nevarēja ielādēt.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining rakstzīmes atlikušas';
  }

  @override
  String get characterCounterTooLong => 'Ziņojums ir pārāk garš';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining rakstzīmes atlikušas. Iegūstiet $productName, lai rakstītu līdz $premiumMaxLength rakstzīmēm.';
  }

  @override
  String get chatMessageFailedToSend => 'Ziņojumu neizdevās nosūtīt';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Jūsu ziņojums netika piegādāts. Tas parasti notiek tāpēc, ka jums nav kopīgas kopienas ar saņēmēju vai saņēmējs pieņem tiešos ziņojumus tikai no draugiem. Iespējams, jums arī būs jāpielāgo savi tiešo ziņojumu privātuma iestatījumi sadaļā $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Jūsu ziņojums netika piegādāts. Lai nosūtītu tiešos ziņojumus, jums ir jāpieprasa savs konts.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Jūsu ziņojums netika piegādāts. Lai nosūtītu ziņojumus, jums ir jāpieprasa savs konts.';

  @override
  String get chatSendFailureContentBlocked =>
      'Jūsu ziņojums netika piegādāts, jo to atzīmēja mūsu drošības sistēmas. Ja uzskatāt, ka tā ir kļūda, lūdzu, sazinieties ar atbalsta dienestu.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Jūsu ziņojums netika piegādāts, jo tas satur saturiski neatbilstošus emocijzīmes vai uzlīmes, kas nav atļautas šajā kontekstā.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Šo ziņojumu var redzēt tikai jūs.';

  @override
  String get chatClientSystemDismiss => 'Noraidīt';

  @override
  String get privacyDashboardCommunicationSection => 'Komunikācija';

  @override
  String get chatMessageDeleteFailed => 'Dzēst neizdevās';

  @override
  String get chatMessageAddReaction => 'Pievienot reakciju';

  @override
  String get chatMessageEdit => 'Rediģēt ziņojumu';

  @override
  String get chatMessageReply => 'Atbildēt';

  @override
  String get chatMessageForward => 'Pārsūtīt';

  @override
  String get forwardMessageTitle => 'Pārsūtīt ziņojumu';

  @override
  String get forwardSearchHint => 'Meklēt kanālus vai DM';

  @override
  String get forwardDirectMessagesSection => 'Privātie ziņojumi';

  @override
  String get forwardCommentHint => 'Pievienot komentāru (nav obligāti)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Sūtīt ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Kanāli nav atrasti';

  @override
  String get forwardSuccessToast => 'Ziņojums pārsūtīts';

  @override
  String get forwardFailed => 'Neizdevās pārsūtīt ziņojumu';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Komentāri nav pieejami, jo atlasītajam kanālam ir ieslēgts lēnais režīms.';

  @override
  String get forwardDestinationNoSendPermission =>
      'Šeit nevarat sūtīt ziņojumus';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Šeit nevarat iegult saites';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Šeit nevarat pievienot failus';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Ziņojumu sūtīšana ir atspējota šajā kopienā';

  @override
  String get forwardDestinationTimedOut =>
      'Jums ir laika ierobežojums šajā kopienā';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Lēnais režīms — uzgaidiet $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopēt ziņojumu';

  @override
  String get chatMessagePin => 'Piespraust ziņojumu';

  @override
  String get chatMessageUnpin => 'Atspraust ziņojumu';

  @override
  String get chatMessageUnpinIt => 'Atspraust';

  @override
  String get chatMessageBookmark => 'Grāmatzīme ziņojumam';

  @override
  String get chatMessageRemoveBookmark => 'Noņemt grāmatzīmi';

  @override
  String get chatMessageMarkAsUnread => 'Atzīmēt kā nelasītu';

  @override
  String get chatMessageCopyMessageLink => 'Kopēt ziņojuma saiti';

  @override
  String get chatMessageCopyMessageId => 'Kopēt ziņojuma ID';

  @override
  String get chatMessageViewReactions => 'Skatīt reakcijas';

  @override
  String get chatMessageRemoveAllReactions => 'Noņemt visas reakcijas';

  @override
  String get chatMessageDebug => 'Debugot ziņojumu';

  @override
  String get chatMessageDebugSheetTitle => 'Debugot ziņojumu';

  @override
  String get chatMessageDebugCopyJson => 'Kopēt JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Ziņojuma JSON kopēts uz starpliktuvē';

  @override
  String get chatReactionsSheetTitle => 'Reakcijas';

  @override
  String get chatReactionsSheetEmpty => 'Neviens vēl nav reaģējis.';

  @override
  String get chatMessageReport => 'Ziņot par ziņojumu';

  @override
  String get iarReportMessageTitle => 'Ziņot par ziņojumu';

  @override
  String get iarThisUserFallback => 'šim lietotājam';

  @override
  String get iarModalDescription =>
      'Ziņot par noteikumu pārkāpumu vai atrast rīkus, lai pārvaldītu kontaktu un preferences.';

  @override
  String get iarPathStepAriaLabel => 'Kas jums nepieciešams?';

  @override
  String get iarCategoryStepTitle => 'Kāda veida noteikums tika pārkāpts?';

  @override
  String get iarReasonStepTitle => 'Kāds noteikums tika pārkāpts?';

  @override
  String get iarReasonSelectHint => 'Atlasiet iemeslu';

  @override
  String get iarPickAnOptionToast => 'Atlasiet opciju, lai turpinātu.';

  @override
  String get iarPickARuleToast => 'Atlasiet pārkāpto noteikumu.';

  @override
  String get iarPathPlatform => 'Ziņot par platformas noteikumu pārkāpumu';

  @override
  String get iarPathCommunity => 'Ziņot šīs kopienas moderatoriem';

  @override
  String get iarPathPreferenceMessage => 'Man nepatīk šis saturs';

  @override
  String get iarCategoryTargetedHarmLabel => 'Draudi, uzmākšanās vai kaitējums';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Apsaukāšana, draudi, naida runa, vardarbība, reidi vai pašnāvības veicināšanas saturs.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Bērnu drošība vai nepiedienīgs saturs';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Bērni apdraudējumā, nepiedienīgs saturs nepiemērotā vietā vai nevēlama uzvedība.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privātums vai identitātes zādzība';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Datu nopludināšana, izsekošana, izlikšanās par kādu citu vai neatbilstošs profils.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Krāpniecība, ļaunprogrammatūra vai dezinformācija';

  @override
  String get iarCategoryDeceptionDescription =>
      'Pikšķerēšana, krāpšana, ļaunprātīgi saiti vai nepatiesa informācija, kas var radīt reālu kaitējumu.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Nelegāla darbība vai kaut kas cits';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Nelegāla tirdzniecība, noziedzīgas darbības atbalstīšana vai skaidrs noteikumu pārkāpums, kas nav minēts iepriekš.';

  @override
  String get iarReasonHarassmentLabel => 'Uzmākšanās vai draudi';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Apsaukāšana, atkārtots nevēlams kontakts, izsekošana vai mērķtiecīga aizskaršana.';

  @override
  String get iarReasonHateLabel => 'Naida runa';

  @override
  String get iarReasonHateMessageDescription =>
      'Apsaukāšana, dehumanizējoša valoda vai uzbrukumi aizsargātām grupām.';

  @override
  String get iarReasonViolenceLabel => 'Vardarbība vai vardarbīgi draudi';

  @override
  String get iarReasonViolenceDescription =>
      'Ticami draudi, grafiska vardarbība vai vardarbības glorificēšana.';

  @override
  String get iarReasonMatureContentLabel =>
      'Nepiedienīgs saturs vai uzmākšanās';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Nevēlama uzvedība vai nepiedienīgs saturs nepiemērotā vietā.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Bērnu drošība vai nepilngadīgo izmantošana';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Satura veicināšana vai instrukcijas, kas mudina uz pašnāvību vai ēšanas traucējumiem.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Kaitīga dezinformācija';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Nepatiesas apgalvojumi, kas var radīt reālu kaitējumu.';

  @override
  String get iarReasonSpamLabel => 'Spams, krāpniecība vai pikšķerēšana';

  @override
  String get iarReasonSpamMessageDescription =>
      'Masveida spams, krāpšana, viltotas dāvanas vai konta ļaunprātīga izmantošana.';

  @override
  String get iarReasonMalwareLabel => 'Ļaunprogrammatūra vai bīstami saiti';

  @override
  String get iarReasonMalwareDescription =>
      'Ļaunprogrammatūra, paroles zādzība vai kaitīgi faili.';

  @override
  String get iarReasonPrivacyLabel => 'Privātuma pārkāpums';

  @override
  String get iarReasonPrivacyDescription =>
      'Datu nopludināšana, atklāta privāta informācija vai izsekošana.';

  @override
  String get iarReasonImpersonationLabel =>
      'Identitātes zādzība vai maldinoši mediji';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Izlikšanās par kādu citu, ieskaitot maldinošu AI ģenerētu saturu.';

  @override
  String get iarReasonIllegalLabel => 'Nelegāla darbība';

  @override
  String get iarReasonIllegalDescription =>
      'Nelegāla tirdzniecība, noziedzīgas darbības atbalstīšana vai nelikumīga darbība.';

  @override
  String get iarReasonSelfHarmLabel => 'Pašnāvība vai paškaitējums';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Pašnāvības vai ēšanas traucējumu veicināšana vai instrukcijas.';

  @override
  String get iarReasonOtherLabel => 'Cits skaidrs noteikumu pārkāpums';

  @override
  String get iarReasonOtherDescription =>
      'Izmantojiet tikai tad, ja tas skaidri pārkāpj Fluxer noteikumus un nav piemērots iepriekš.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Ja iesaistīts nepilngadīgais, izmantojiet \"$childSafetyReason\" vietā.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Ja tas ietver CSAM vai nepilngadīgā izmantošanu, nosūtiet to tagad un neatkārtojiet materiālu.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Ja kāds var būt tūlītējās briesmās, ja tas ir droši, sazinieties ar vietējiem neatliekamās palīdzības dienestiem.';

  @override
  String get iarSafetyNoteViolence =>
      'Ja tie ir ticami tūlītēji draudi, sazinieties arī ar vietējiem neatliekamās palīdzības dienestiem.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Ja tie ir tūlītēji terorisma draudi, sazinieties arī ar vietējiem neatliekamās palīdzības dienestiem.';

  @override
  String get iarActionBlockUserTitle => 'Bloķēt šo lietotāju';

  @override
  String get iarActionBlockUserDescription =>
      'Pārtraukt ziņojumus un draugu pieprasījumus.';

  @override
  String get iarActionBlockUserButton => 'Bloķēt';

  @override
  String get iarActionCopyMessageLinkTitle => 'Kopēt ziņojuma saiti';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Kopīgot ar kopienas moderatoriem.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopēt';

  @override
  String get iarActionCloseDmTitle => 'Aizvērt šo DM';

  @override
  String get iarActionCloseDmDescription =>
      'Neuzliek bloķēšanu. Varat atvērt vēlāk.';

  @override
  String get iarActionCloseDmButton => 'Aizvērt DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Pamest kopienu';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Pārtrauciet redzēt tās saturu un dalībniekus.';

  @override
  String get iarActionLeaveCommunityButton => 'Pamest';

  @override
  String get iarActionDmSettingsTitle =>
      'DM un uzaicinājumu uz draugiem iestatījumi';

  @override
  String get iarActionDmSettingsDescription =>
      'Mainiet, kas var ar jums sazināties.';

  @override
  String get iarActionCallSettingsTitle =>
      'Zvanu un grupas tērzēšanas iestatījumi';

  @override
  String get iarActionCallSettingsDescription =>
      'Mainiet, kas var jums zvanīt vai pievienot jūs.';

  @override
  String get iarActionOpenButton => 'Atvērt';

  @override
  String get iarActionDeleteMessageTitle => 'Dzēst šo ziņojumu';

  @override
  String get iarActionDeleteMessageDescription =>
      'Noņemiet to no kanāla visiem.';

  @override
  String get iarActionDeleteMessageButton => 'Dzēst';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Dzēsts';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Šis ziņojums jau ir izdzēsts.';

  @override
  String get iarActionBanUserTitle => 'Bloķēt šo lietotāju';

  @override
  String get iarActionBanUserDescription =>
      'Atveriet bloķēšanas dialogu šai kopienai.';

  @override
  String get iarActionBanUserButton => 'Bloķēt';

  @override
  String get iarActionBanUserBannedButton => 'Bloķēts';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Šis lietotājs jau ir bloķēts šajā kopienā.';

  @override
  String get iarCloseDmConfirmTitle => 'Aizvērt DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Aizveriet savu pašreizējo DM ar $name. Tas viņus nebloķēs; varat tos atvērt vēlāk.';
  }

  @override
  String get iarSuccessTitle => 'Ziņojums nosūtīts';

  @override
  String get iarSuccessBody =>
      'Mūsu drošības komanda to izskata. Mēs nosūtīsim jums DM un e-pastu, tiklīdz būsim pieņēmuši lēmumu.';

  @override
  String get iarAlreadyReportedTitle => 'Jau ziņots';

  @override
  String get iarAlreadyReportedBody =>
      'Jūs jau esat ziņojis par šo ziņojumu. Mūsu drošības komanda to izskata.';

  @override
  String get iarBackButton => 'Atpakaļ';

  @override
  String get iarContinueButton => 'Turpināt';

  @override
  String get iarSendReportButton => 'Nosūtīt ziņojumu';

  @override
  String get iarDoneButton => 'Gatavs';

  @override
  String get iarCouldntSendToast =>
      'Nevarēja nosūtīt ziņojumu. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get iarRateLimitedToast =>
      'Jūs ziņojat pārāk ātri. Lūdzu, pagaidiet brīdi un mēģiniet vēlreiz.';

  @override
  String get iarReportSentToast =>
      'Ziņojums nosūtīts. Mūsu drošības komanda to izskatīs.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Bloķēt $name? Viņi nevarēs jums sūtīt ziņojumus vai uzaicinājumus uz draugiem. Varat viņus atsbloķēt vēlāk.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Nevarēja bloķēt šo lietotāju. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get iarCloseDmSuccessToast => 'DM aizvērts.';

  @override
  String get iarCloseDmFailedToast =>
      'Nevarēja aizvērt šo DM. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Nevarēja pamest šo kopienu. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get chatMessageSuppressEmbeds => 'Slēpt iekļaujumus';

  @override
  String get chatMessageUnsuppressEmbeds => 'Rādīt iekļaujumus';

  @override
  String get chatMessageDelete => 'Dzēst ziņojumu';

  @override
  String get chatMessageDeleteConfirmTitle => 'Dzēst ziņojumu';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Vai tiešām vēlaties dzēst šo ziņojumu?';

  @override
  String get chatMessageMore => 'Vairāk';

  @override
  String get chatEditingMessage => 'Rediģē ziņojumu';

  @override
  String get chatReplyOriginalDeleted => 'Oriģinālais ziņojums tika dzēsts';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Oriģinālo ziņojumu neizdevās ielādēt';

  @override
  String get chatReplyAttachedMedia => 'Ziņojumā ir pievienotie mediji';

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
  String get chatMessagesLoadError => 'Nevarēja ielādēt ziņojumus.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Pārrakstīt pieminēšanas preferences?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname dod priekšroku @pieminēšanai atbildēs. Sūtīt bez pieminēšanas tomēr?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname dod priekšroku atbildēm bez @pieminēšanas. Vai tomēr nosūtīt ar pieminēšanu?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorēt preferenci';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Noklikšķiniet, lai atspējotu atbildētā lietotāja pingošanu.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Noklikšķiniet, lai iespējotu atbildētā lietotāja pingošanu.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Pieminēt atbildēto lietotāju';

  @override
  String get chatReplyMentionOn => 'Ieslēgts';

  @override
  String get chatReplyMentionOff => 'Izslēgts';

  @override
  String get chatReplyCancel => 'Atcelt atbildi';

  @override
  String get chatEditMessageHint => 'Rediģēt ziņojumu';

  @override
  String get chatEditNoChanges => 'Nav izmaiņu, ko saglabāt';

  @override
  String get chatChannelNotReady =>
      'Šis kanāls vēl nav gatavs. Pamēģiniet vēlreiz pēc brīža.';

  @override
  String get chatMessageEdited => '(rediģēts)';

  @override
  String get chatMessageSilent => 'Šis bija @silent ziņojums.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Šodien plkst. $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Vakar plkst. $time';
  }

  @override
  String get mediaViewerImagePreview => 'Attēla priekšskatījums';

  @override
  String get mediaViewerClose => 'Aizvērt mediju skatītāju';

  @override
  String get mediaViewerOpenInBrowser => 'Atvērt pārlūkprogrammā';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Pārsūtīt';

  @override
  String get mediaViewerZoomIn => 'Tuvināt';

  @override
  String get mediaViewerZoomOut => 'Tālināt';

  @override
  String get mediaViewerPreviousAttachment => 'Iepriekšējais pielikums';

  @override
  String get mediaViewerNextAttachment => 'Nākamais pielikums';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Pārslēgt video vadīklas';

  @override
  String get chatAttachmentVideoMute => 'Izslēgt video skaņu';

  @override
  String get chatAttachmentVideoUnmute => 'Ieslēgt video skaņu';

  @override
  String get chatAttachmentVideoPlay => 'Atskaņot video';

  @override
  String get chatAttachmentVideoPause => 'Pauze video';

  @override
  String get chatAttachmentVideoProgress => 'Video atskaņošanas gaita';

  @override
  String get chatVideoPlaybackFailed => 'Nevarēja atskaņot šo video.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Paziņot lietotājiem ar šo lomu, kuriem ir atļauja skatīt šo kanālu.';

  @override
  String get addGuildModalTitle => 'Pievienot kopienu';

  @override
  String get addGuildModalLandingDescription =>
      'Izveidojiet jaunu kopienu vai pievienojieties esošai.';

  @override
  String get addGuildCreateCommunity => 'Izveidot kopienu';

  @override
  String get addGuildJoinCommunity => 'Pievienoties kopienai';

  @override
  String get addGuildImportDiscordTemplate => 'Importēt Discord veidni';

  @override
  String get addGuildJoinTitle => 'Pievienoties kopienai';

  @override
  String get addGuildJoinDescription =>
      'Ievadiet ielūguma saiti, lai pievienotos kopienai.';

  @override
  String get addGuildInviteLinkLabel => 'Ielūguma saite';

  @override
  String get addGuildJoinSubmit => 'Pievienoties kopienai';

  @override
  String get addGuildInviteInvalid =>
      'Šis ielūgums ir nederīgs vai ir beidzies tā derīguma termiņš.';

  @override
  String get addGuildJoinFailed =>
      'Nevarēja pievienoties kopienai. Lūdzu, mēģiniet vēlreiz.';

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
  String get addGuildPackInstalled => 'Iepakojums veiksmīgi instalēts.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Noņemt visas reakcijas';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Vai tiešām vēlaties noņemt visas reakcijas no šī ziņojuma?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Noņemt ziņojuma piespraudi';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Vai vēlaties atsaukt šo piespraudi?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username piesprauda $messageLink šajā kanālā. Skatīt $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'ziņojumu';

  @override
  String get systemPinMessageAllPinsLink => 'visus piespraustos ziņojumus';

  @override
  String get channelPinsEmptyTitle => 'Nav piespraustu ziņojumu';

  @override
  String get channelPinsEmptyDescription =>
      'Šeit parādīsies piespraužamie ziņojumi.';

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
  String get personalNotesTitle => 'Personīgās piezīmes';

  @override
  String get personalNotesSubtitle =>
      'Jūsu privātā telpa domām un atgādinājumiem';

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
    return 'Laipni lūgti kanālā $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Sākumā nekas nebija. Tad parādījās $channelName. Un tas bija labi.';
  }

  @override
  String get personalNotesComposerHint => 'Sūtiet ziņojumu sev';

  @override
  String get personalNotesPrivateSpace => 'Jūsu privātā telpa';

  @override
  String get purgePersonalNotes => 'Dzēst personīgās piezīmes';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Tas neatgriezeniski izdzēsīs katru ziņojumu un pielikumu jūsu personīgajās piezīmēs. To nevarēs atsaukt.';

  @override
  String get purgePersonalNotesConfirmButton => 'Dzēst';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Dzēsti $count ziņojumi no personīgajām piezīmēm';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Personīgās piezīmes jau bija tukšas';

  @override
  String get purgePersonalNotesFailed => 'Nevarēja notīrīt personīgās piezīmes';

  @override
  String get userSettingsGroupYourAccount => 'JŪSU KONTS';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profils';

  @override
  String get userSettingsNavSecurityLogin => 'Drošība un pieteikšanās';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Dāvanas un kodi';

  @override
  String get userSettingsNavPrivacyDashboard =>
      'Privātuma informācijas panelis';

  @override
  String get userSettingsNavAuthorizedApps => 'Autorizētās lietotnes';

  @override
  String get userSettingsNavBlockedUsers => 'Bloķētie lietotāji';

  @override
  String get userSettingsNavLinkedDevices => 'Saistītās ierīces';

  @override
  String get userSettingsNavConnections => 'Savienojumi';

  @override
  String get userSettingsNavLookAndFeel => 'Izskats un stils';

  @override
  String get userSettingsNavAccessibility => 'Pieejamība';

  @override
  String get userSettingsNavChat => 'Ziņojumi un mediji';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio un video';

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
  String get userSettingsNavLanguageAndTime => 'Valoda un laiks';

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
  String get userSettingsNavAdvanced => 'Papildu iestatījumi';

  @override
  String get advancedPerformanceReportingTitle => 'Veiktspējas ziņošana';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Palīdziet uzlabot Fluxer, kopīgojot anonīmus datus par kļūmēm un veiktspēju.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Sūtīt ziņojumus par kļūmēm un veiktspēju';

  @override
  String get advancedPerformanceReportingDescription =>
      'Visi ziņotie dati ir anonīmi un tiek sūtīti tikai uz Fluxer pašu uzraudzības pakalpojumu — netiek izmantoti trešo pušu nodrošinātāji.';

  @override
  String get userSettingsNavApplications => 'Lietotnes';

  @override
  String get userSettingsNavAppLogs => 'Lietotnes žurnāli';

  @override
  String get userSettingsNavDeveloperTools => 'Izstrādātāju rīki';

  @override
  String get userSettingsNavLimitsConfig => 'Ierobežojumu konfigurācija';

  @override
  String get userSettingsNavFeatureFlags => 'Funkciju karodziņi';

  @override
  String get userSettingsNavWhatsNew => 'Kas jauns';

  @override
  String get userSettingsNavLogOut => 'Izrakstīties';

  @override
  String get betaWarningTitle => 'Beta programmatūra';

  @override
  String get betaWarningMessage =>
      'Šī ir beta programmatūra. Vēl ne viss ir pabeigts vai pievienots.';

  @override
  String get betaWarningReportIssues =>
      'Lūdzu, ziņojiet par visām problēmām, ko atradīsiet, Fluxer Mobile kopienai (pašlaik, lai pievienotos kopienai, ir nepieciešams Plutonium).';

  @override
  String get betaWarningRepoLink => 'Skatīt avota kodu GitHub';

  @override
  String get betaWarningGotIt => 'Skaidrs';

  @override
  String get quickSwitcherTabSearch => 'Meklēt';

  @override
  String get quickSwitcherTabFriends => 'Draugi';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Meklēt kanālus, cilvēkus vai kopienas';

  @override
  String get quickSwitcherSearchFriends => 'Meklēt draugus';

  @override
  String get quickSwitcherNoMatchesFound => 'Nav atrasts neviens atbilstošs';

  @override
  String get quickSwitcherEmptyHint =>
      'Mēģiniet citu vārdu vai izmantojiet prefiksus @ / # / ! / *, lai filtrētu rezultātus.';

  @override
  String get quickSwitcherSectionPeople => 'Cilvēki';

  @override
  String get quickSwitcherSectionGroupMessages => 'Grupas ziņojumi';

  @override
  String get quickSwitcherSectionTextChannels => 'Teksta kanāli';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Balss kanāli';

  @override
  String get quickSwitcherSectionCommunities => 'Kopienas';

  @override
  String get quickSwitcherSectionSettings => 'Iestatījumi';

  @override
  String get quickSwitcherHomeLabel => 'Sākums';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Privātie ziņojumi';

  @override
  String get quickSwitcherFavoritesLabel => 'Izlase';

  @override
  String get quickSwitcherUserSettingsLabel => 'Lietotāja iestatījumi';

  @override
  String get quickSwitcherNotificationsLabel => 'Paziņojumi';

  @override
  String get quickSwitcherBookmarksLabel => 'Grāmatzīmes';

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
  String get quickSwitcherMentionsLabel => 'Mijiedarbības';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Vēl nav draugu';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Pievienojiet draugu, lai sāktu.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nav draugu, kas atbilstu meklētajam';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Mēģiniet citu vārdu.';

  @override
  String get quickSwitcherSearchAliasUser => 'Lietotājs';

  @override
  String get quickSwitcherSearchAliasYou => 'Jūs';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Privātie ziņojumi';

  @override
  String get quickSwitcherSearchAliasMessages => 'Ziņojumi';

  @override
  String get quickSwitcherSearchAliasFav => 'Izlase';

  @override
  String get quickSwitcherSearchAliasStarred => 'Atzīmēti';

  @override
  String get quickSwitcherSearchAliasInbox => 'Saņemtie';

  @override
  String get quickSwitcherSearchAliasSaved => 'Saglabātie';

  @override
  String get uiClose => 'Aizvērt';

  @override
  String get chatJumpToBottom => 'Pāriet uz apakšu';

  @override
  String get uiConfirm => 'Apstiprināt';

  @override
  String get uiLoading => 'Notiek ielāde';

  @override
  String get uiUnsavedChanges => 'Nav saglabātas izmaiņas';

  @override
  String get uiReset => 'Atiestatīt';

  @override
  String get uiOpenColorPicker => 'Atvērt krāsu atlasītāju';

  @override
  String get uiSelectPlaceholder => 'Atlasīt';

  @override
  String get uiSearchPlaceholder => 'Meklēt';

  @override
  String get uiNoOptionsFound => 'Nav atrasts neviens variants';

  @override
  String get uiDismissNotification => 'Noraidīt paziņojumu';

  @override
  String get uiColorPickerTitle => 'Krāsu atlasītājs';

  @override
  String get mentionConfirmTitle => 'Paziņot visiem?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Tiks paziņoti $count dalībnieki. Turpināt?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Tiks paziņoti $count tiešsaistes dalībnieki. Turpināt?';
  }

  @override
  String get mentionConfirmButton => 'Paziņot';

  @override
  String get composerEmojiUnavailable => 'Šeit nevarat izmantot šo emocijzīmi.';

  @override
  String get instanceUrlLabel => 'Instancēšanas URL';

  @override
  String get instanceUrlPlaceholder =>
      'Ievadiet instancēšanas URL (piemēram, fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Atiestatīt uz Fluxer';

  @override
  String get instanceConnect => 'Savienot';

  @override
  String get instanceConnecting => 'Notiek savienošana…';

  @override
  String get instanceConnectFailed => 'Neizdevās savienot ar instanci';

  @override
  String get recentInstances => 'Nesenās instances';

  @override
  String removeRecentInstance(String domain) {
    return 'Noņemt $domain no nesenajām instancēm';
  }

  @override
  String get instanceSheetTitle => 'Savienot ar instanci';

  @override
  String get connectToDifferentInstance => 'Savienot ar citu instanci';

  @override
  String get changeInstance => 'Mainīt';

  @override
  String get instanceConnectionRequired =>
      'Lai pieteiktos, savienojieties ar instanci';

  @override
  String get comingSoon => 'Drīzumā';

  @override
  String get guildNavbarDirectMessages => 'Privātie ziņojumi';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Izpētīt atklājamās kopienas';

  @override
  String get discoveryExplore => 'Izpētīt';

  @override
  String get discoveryExplorePublicCommunities => 'Izpētīt publiskās kopienas';

  @override
  String get discoveryListingSubheading =>
      'Vai vēlaties iekļaut savu kopienu šeit? Piesakieties, ja atbilstat prasībām sadaļā Kopienas iestatījumi > Izpēte.';

  @override
  String get discoverySearchCommunities => 'Meklēt kopienas';

  @override
  String get discoveryFilterByLanguage => 'Filtrēt pēc valodas';

  @override
  String get discoveryAllLanguages => 'Visas valodas';

  @override
  String get discoveryAllCategories => 'Visas';

  @override
  String get discoveryCategoryGaming => 'Spēles';

  @override
  String get discoveryCategoryMusic => 'Mūzika';

  @override
  String get discoveryCategoryEntertainment => 'Izklaide';

  @override
  String get discoveryCategoryEducation => 'Izglītība';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Zinātne un tehnoloģijas';

  @override
  String get discoveryCategoryContentCreator => 'Satura veidotājs';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime un manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmas un TV';

  @override
  String get discoveryCategoryOther => 'Cits';

  @override
  String get discoveryNoCommunitiesMatch => 'Nav atbilstošu kopienu.';

  @override
  String get discoveryJoinCommunity => 'Pievienoties kopienai';

  @override
  String get discoveryJoined => 'Pievienots';

  @override
  String discoveryOnlineCount(String count) {
    return '$count tiešsaistē';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString dalībnieki',
      one: '1 dalībnieks',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Nav apraksta.';

  @override
  String get discoveryCommunities => 'Kopienas';

  @override
  String get discoveryApps => 'Lietotnes';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Neizdevās pievienoties šai kopienai';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Radās kļūda. Lūdzu, mēģiniet vēlreiz pēc brīža.';

  @override
  String get discoveryJoinErrorFullTitle => 'Šī kopiena ir pilna';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Šī kopiena ir sasniegusi dalībnieku skaita ierobežojumu, tāpēc pašlaik nevarat pievienoties.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Esat sasniedzis kopienu limitu';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Jūs esat maksimālajā kopienu skaitā. Pametiet vienu un mēģiniet vēlreiz.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Jūs nevarat pievienoties šai kopienai';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Jums ir liegta piekļuve šai kopienai.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Šī kopiena vairs nav pieejama';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Tā, iespējams, ir izņemta no izpētes vai ir izslēgta jaunu dalībnieku uzņemšana. Atsvaidziniet lapu, un jūs to vairs neredzēsiet.';

  @override
  String get discoveryJoinErrorRateLimitTitle =>
      'Jūs pārvietojaties pārāk ātri';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Lūdzu, uzgaidiet brīdi un mēģiniet vēlreiz.';

  @override
  String get guildNavbarAddCommunity => 'Pievienot kopienu';

  @override
  String get guildNavbarHelp => 'Palīdzība';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'JAUNA ZIŅA';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Sakļaut $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Grupas DM';

  @override
  String get guildNavbarCreateChannel => 'Izveidot kanālu';

  @override
  String get guildNavbarChannelType => 'Kanāla tips';

  @override
  String get guildNavbarTextChannel => 'Teksta kanāls';

  @override
  String get guildNavbarTextChannelDescription =>
      'Sūtiet ziņojumus, attēlus, GIF un emocijzīmes';

  @override
  String get guildNavbarVoiceChannel => 'Balss kanāls';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Pavadiet laiku kopā ar balsi, video un ekrāna kopīgošanu';

  @override
  String get guildNavbarLinkChannel => 'Saistītais kanāls';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Ātra piekļuve ārējai vietnei vai resursam';

  @override
  String get guildNavbarNameLabel => 'Nosaukums';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Izveidot kategoriju';

  @override
  String get guildNavbarNewCategoryHint => 'Jauna kategorija';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Uzaiciniet draugus uz $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Saņēmēji tiks novirzīti uz #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Meklēt draugus';

  @override
  String get guildNavbarNoFriendsYet => 'Vēl nav draugu';

  @override
  String get guildNavbarNoResults => 'Nav rezultātu';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Vai arī nosūtiet uzaicinājuma saiti draugam:';

  @override
  String get guildNavbarInviteLink => 'Uzaicinājuma saite';

  @override
  String get guildNavbarCopy => 'Kopēt';

  @override
  String get guildNavbarCopied => 'Nokopēts!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Jūsu uzaicinājuma saite beidzas pēc 7 dienām.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Šī uzaicinājuma saite nekad nebeidzas.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Jūsu uzaicinājuma saite beidzas pēc $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Rediģēt uzaicinājuma saiti';

  @override
  String get guildNavbarInviteLinkSettings => 'Uzaicinājuma saišu iestatījumi';

  @override
  String get guildNavbarExpireAfter => 'Beidzas pēc';

  @override
  String get guildNavbarMaxUses => 'Maksimālais lietojumu skaits';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Piešķirt pagaidu dalību';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Dalībnieki tiks noņemti, kad viņi kļūs bezsaistē, ja vien netiks piešķirta loma';

  @override
  String get guildNavbarCreateNewLink => 'Izveidot jaunu saiti';

  @override
  String get guildNavbarSent => 'Nosūtīts';

  @override
  String get guildNavbarInvite => 'Uzaicināt';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Pamest kopienu';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Vai tiešām vēlaties pamest šo kopienu? Jūs vairs nevarēsiet redzēt nevienu ziņojumu.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Pamest kopienu';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Dzēst savus ziņojumus šajā kopienā?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Pastāvīgi izdzēsiet katru ziņojumu, ko esat šeit nosūtījis, visos kanālos. Atcelt nevar.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Dzēst manus ziņojumus';

  @override
  String get guildNavbarDeletedYourMessages => 'Izdzēsti jūsu ziņojumi';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Nevarēja izdzēst jūsu ziņojumus';

  @override
  String get guildNavbarRemoveOverride => 'Noņemt pārrakstīšanu';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Skaņa izslēgta līdz $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Pieejams tikai Fluxer personālam';

  @override
  String get guildNavbarInvitesPaused =>
      'Uzaicinājumi šajā kopienā pašlaik ir apturēti';

  @override
  String get guildNavbarDurationNever => 'nekad';

  @override
  String get guildNavbarDuration30Minutes => '30 minūtes';

  @override
  String get guildNavbarDuration1Hour => '1 stunda';

  @override
  String get guildNavbarDuration6Hours => '6 stundas';

  @override
  String get guildNavbarDuration12Hours => '12 stundas';

  @override
  String get guildNavbarDuration1Day => '1 diena';

  @override
  String get guildNavbarDuration7Days => '7 dienas';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekundes';
  }

  @override
  String get guildNavbarNever => 'Nekad';

  @override
  String get guildNavbarNoLimit => 'Nav ierobežojumu';

  @override
  String get guildNavbarOneUse => '1 lietošanas reize';

  @override
  String guildNavbarUses(int count) {
    return '$count lietošanas reizes';
  }

  @override
  String get guildMenuMarkAsRead => 'Atzīmēt kā izlasītu';

  @override
  String get guildPeekMoreOptions => 'Vairāk opciju';

  @override
  String get guildMenuInviteMembers => 'Uzaicināt dalībniekus';

  @override
  String get guildMenuCommunitySettings => 'Kopienas iestatījumi';

  @override
  String get guildMenuEditCommunityProfile => 'Rediģēt kopienas profilu';

  @override
  String get guildMenuUnmuteCommunity => 'Atbloķēt kopienu';

  @override
  String get guildMenuMuteCommunity => 'Skaņas izslēgšana kopienai';

  @override
  String get guildMenuHideMutedChannels => 'Slēpt izslēgtos kanālus';

  @override
  String get guildMenuReportCommunity => 'Ziņot par kopienu';

  @override
  String get guildMenuDebugCommunity => 'Kopienas atkļūdošana';

  @override
  String get guildMenuCopyCommunityId => 'Kopēt kopienas ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Līdz $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Vispārīgi';

  @override
  String get guildMenuSettingsRoles => 'Lomas un atļaujas';

  @override
  String get guildMenuSettingsEmoji => 'Pielāgotas emocijzīmes';

  @override
  String get guildMenuSettingsStickers => 'Pielāgotās uzlīmes';

  @override
  String get guildMenuSettingsSafetyModeration => 'Drošība un moderācija';

  @override
  String get guildMenuSettingsActivityLog => 'Darbību žurnāls';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Pielāgota uzaicinājuma URL';

  @override
  String get guildMenuSettingsDiscovery => 'Atklāšana';

  @override
  String get guildMenuSettingsMembers => 'Dalībnieki';

  @override
  String get guildMenuSettingsInviteLinks => 'Uzaicinājuma saites';

  @override
  String get guildMenuSettingsBans => 'Aizliegumi';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Jums nav atļaujas skatīt šo iestatījumu cilni.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikona';

  @override
  String get guildSettingsUploadImage => 'Augšupielādēt attēlu';

  @override
  String get guildSettingsOverviewBannerTitle => 'Baneris';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Augšupielādējiet baneri savam serverim.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nosaukums';

  @override
  String get guildSettingsOverviewNameHint => 'Mana lieliskā kopiena';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistika';

  @override
  String get guildSettingsOverviewMembers => 'Dalībnieki';

  @override
  String get guildSettingsOverviewOnline => 'Tiešsaistē';

  @override
  String get guildSettingsRolesDescription =>
      'Izmantojiet lomas, lai grupētu dalībniekus un piešķirtu atļaujas.';

  @override
  String get guildSettingsCreateRole => 'Izveidot lomu';

  @override
  String get guildSettingsRolesListTitle => 'Lomas';

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
    return '$staticCount statiskās, $animatedCount animētās emocijzīmju vietas izmantotas';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Vēl nav pielāgotu emocijzīmju.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count uzlīmes augšupielādētas';
  }

  @override
  String get guildSettingsStickersEmpty => 'Vēl nav pielāgotu uzlīmju.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Dalībnieku verifikācija';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Izvēlieties, kas dalībniekiem jābūt, pirms viņi var publicēt vai sūtīt privātus ziņojumus kopienas dalībniekiem.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Dalībnieki ar lomām var apiet šīs pārbaudes. Publiskām telpām iesakām ieslēgt verifikāciju.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Kopienām, kas norādītas atklāšanā, ir nepieciešams vismaz verificēts e-pasts. Navigācija nav pieejama, ja atklāšana ir ieslēgta.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Nepiedienīgs saturs un satura brīdinājumi';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigurējiet nepiedienīga satura marķēšanu un izvēles brīdinājumus par saturu dalībniekiem.';

  @override
  String get guildSettingsModerationMatureToggle => 'Nepiedienīgs saturs';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Atzīmējiet šo kopienu kā saturošu nepiedienīgu saturu.';

  @override
  String get guildSettingsVerificationNone => 'Nav';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nav nepieciešama verifikācija.';

  @override
  String get guildSettingsVerificationLow => 'Zems';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Nepieciešama verificēta e-pasta adrese.';

  @override
  String get guildSettingsVerificationMedium => 'Vidējs';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Nepieciešama verificēta e-pasta adrese un konts, kas ir vismaz 5 minūtes vecs.';

  @override
  String get guildSettingsVerificationHigh => 'Augsts';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Nepieciešams viss no vidējā līmeņa, kā arī dalība kopienā vismaz 10 minūtes.';

  @override
  String get guildSettingsVerificationHighest => 'Ļoti augsts';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Nepieciešams verificēts tālruņa numurs.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Izsekojiet moderatoru darbības visā kopienā.';

  @override
  String get guildSettingsAuditLogEmpty => 'Vēl nav žurnālu';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderācijas darbības un kopienas izmaiņas parādīsies šeit.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Visi lietotāji';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Visas darbības';

  @override
  String get guildSettingsAuditLogNoReason => 'Iemesls netika norādīts.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Nezināms lietotājs';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Notika kļūda, ielādējot darbību žurnālu.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Nevar ielādēt darbību žurnālus';

  @override
  String get guildSettingsAuditLogReason => 'Iemesls';

  @override
  String get guildSettingsAuditLogSomeone => 'kāds';

  @override
  String get guildSettingsAuditLogSomething => 'kaut kas';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'nezināma vienība';

  @override
  String get guildSettingsAuditLogNothing => 'neko';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Nezināms mērķis';

  @override
  String get auditLogActionGuildUpdate => 'Kopiena atjaunināta';

  @override
  String get auditLogActionChannelCreate => 'Kanāls izveidots';

  @override
  String get auditLogActionChannelUpdate => 'Kanāls atjaunināts';

  @override
  String get auditLogActionChannelDelete => 'Kanāls dzēsts';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanāla atļauja pievienota';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanāla atļauja atjaunināta';

  @override
  String get auditLogActionChannelOverwriteDelete => 'Kanāla atļauja noņemta';

  @override
  String get auditLogActionMemberKick => 'Dalībnieks izmests';

  @override
  String get auditLogActionMemberPrune => 'Dalībnieki izdzēsti';

  @override
  String get auditLogActionMemberBanAdd => 'Dalībnieks bloķēts';

  @override
  String get auditLogActionMemberBanRemove => 'Dalībnieks atbloķēts';

  @override
  String get auditLogActionMemberUpdate => 'Dalībnieks atjaunināts';

  @override
  String get auditLogActionMemberRoleUpdate => 'Dalībnieka lomas atjauninātas';

  @override
  String get auditLogActionMemberMove => 'Dalībnieks pārvietots';

  @override
  String get auditLogActionMemberDisconnect => 'Dalībnieks atvienots';

  @override
  String get auditLogActionBotAdd => 'Bots pievienots';

  @override
  String get auditLogActionRoleCreate => 'Loma izveidota';

  @override
  String get auditLogActionRoleUpdate => 'Loma atjaunināta';

  @override
  String get auditLogActionRoleDelete => 'Lombarža dzēsta';

  @override
  String get auditLogActionInviteCreate => 'Ielūgums izveidots';

  @override
  String get auditLogActionInviteUpdate => 'Ielūgums atjaunināts';

  @override
  String get auditLogActionInviteDelete => 'Ielūgums dzēsts';

  @override
  String get auditLogActionWebhookCreate => 'Webhook izveidots';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook atjaunināts';

  @override
  String get auditLogActionWebhookDelete => 'Webhook dzēsts';

  @override
  String get auditLogActionEmojiCreate => 'Emocija izveidota';

  @override
  String get auditLogActionEmojiUpdate => 'Emocija atjaunināta';

  @override
  String get auditLogActionEmojiDelete => 'Emocija dzēsta';

  @override
  String get auditLogActionStickerCreate => 'Uzlīme izveidota';

  @override
  String get auditLogActionStickerUpdate => 'Uzlīme atjaunināta';

  @override
  String get auditLogActionStickerDelete => 'Uzlīme dzēsta';

  @override
  String get auditLogActionMessageDelete => 'Ziņojums dzēsts';

  @override
  String get auditLogActionMessageBulkDelete => 'Ziņojumi dzēsti';

  @override
  String get auditLogActionMessagePin => 'Ziņojums piesprausts';

  @override
  String get auditLogActionMessageUnpin => 'Ziņojums atsprausts';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor atjaunināja kopienas iestatījumus.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor izveidoja kanālu $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor atjaunināja kanālu $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor dzēsa kanālu $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor pievienoja kanāla atļaujas priekš $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor pievienoja kanāla atļaujas priekš $target kanālā $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor atjaunināja kanāla atļaujas priekš $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor atjaunināja kanāla atļaujas priekš $target kanālā $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor noņēma kanāla atļaujas priekš $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor noņēma kanāla atļaujas priekš $target kanālā $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor izmeta dalībnieku $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor bloķēja dalībnieku $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor atbloķēja dalībnieku $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor atjaunināja $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor atjaunināja lomas dalībniekam $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor izdzēsa neaktīvos dalībniekus.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor izdzēsa dalībniekus, kas bija neaktīvi $days dienas.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor pārvietoja dalībnieku $target uz citu balss kanālu.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor pārvietoja dalībnieku $target uz kanālu $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor atvienoja dalībnieku $target no balss.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor pievienoja botu $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor izveidoja lomu $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor atjaunināja lomu $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor dzēsa lomu $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor izveidoja ielūgumu $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor izveidoja ielūgumu $target kanālam $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor atjaunināja ielūgumu $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor atjaunināja ielūgumu $target kanālam $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor dzēsa ielūgumu $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor dzēsa ielūgumu $target kanālam $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor izveidoja webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor atjaunināja webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor dzēsa webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor pievienoja emocemozi $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor atjaunināja emocemozi $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor izdzēsa emocemozi $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor pievienoja uzlīmi $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor atjaunināja uzlīmi $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor izdzēsa uzlīmi $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor izdzēsa ziņojumu.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor izdzēsa ziņojumu kanālā $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor izdzēsa vairākus ziņojumus.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor izdzēsa $count ziņojumus.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor izdzēsa vairākus ziņojumus kanālā $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor izdzēsa $count ziņojumus kanālā $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor piesprauda ziņojumu.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor piesprauda ziņojumu kanālā $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor atsprauda ziņojumu.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor atsprauda ziņojumu kanālā $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor veica revīzijas darbību attiecībā uz $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Atjaunināts $field no $oldValue uz $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Iestatīts $field uz $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Notīrīts $field (bija $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Atjaunināts $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Kopiena pārdēvēta par $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Kopienas ikona atjaunināta.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Kanāls pārdēvēts par $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Tēma notīrīta.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Tēma atjaunināta uz $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Iespējots saturam pieaugušajiem.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Atspējots saturam pieaugušajiem.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Niks tika iestatīts uz $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Noņemts niks $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Dalībnieks izslēgts.';

  @override
  String get auditLogChangeUnmutedMember => 'Dalībnieks ieslēgts.';

  @override
  String get auditLogChangeDeafenedMember => 'Dalībnieks nedzirdīgs.';

  @override
  String get auditLogChangeUndeafenedMember => 'Dalībnieks dzirdīgs.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Pievienotas lomas $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Noņemtas lomas $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanāls: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Ziņojums: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Uzaicināja $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izdzēsti # ziņojumi.',
      one: 'Izdzēsts # ziņojums.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Noņemti # dalībnieki.',
      one: 'Noņemts # dalībnieks.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Šis uzaicinājums nekad nezaudē derīgumu.';

  @override
  String get auditLogOptionTemporaryMembership => 'Piešķir pagaidu dalību.';

  @override
  String get auditLogOptionPermanentMembership => 'Piešķir pastāvīgu dalību.';

  @override
  String get guildSettingsLoadMore => 'Ielādēt vairāk';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Pārvaldīt tīmekļa pārsteigumus, kas publicē ziņojumus kanālos.';

  @override
  String get guildSettingsWebhooksEmpty =>
      'Nav konfigurēti tīmekļa pārsteigumi.';

  @override
  String get guildSettingsCopyUrl => 'Kopēt URL';

  @override
  String get guildSettingsCopiedUrl => 'URL kopēts starpliktuvē';

  @override
  String get guildSettingsDeleteWebhook => 'Dzēst tīmekļa pārsteigumu';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Iestatiet pielāgotu uzaicinājuma saiti savam serverim.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Saglabāt';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Lietojums';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count lietošanas reizes';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Piesakieties, lai tiktu iekļauts servera atklāšanā.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Nepieciešami vismaz $count dalībnieki, lai pieteiktos.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Pieteikums';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Statuss';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorija';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Apraksts';

  @override
  String get guildSettingsDiscoveryTags => 'Tagi';

  @override
  String get guildSettingsDiscoveryTagsHint => 'spēles, māksla, mūzika';

  @override
  String get guildSettingsDiscoveryApply => 'Iesniegt pieteikumu';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Atcelt';

  @override
  String get guildSettingsMembersDescription =>
      'Meklējiet un pārvaldiet servera dalībniekus.';

  @override
  String get guildSettingsMembersSearchHint => 'Meklēt dalībniekus';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count dalībnieki';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Skatiet un atsauciet aktīvās uzaicinājumu saites.';

  @override
  String get guildSettingsInvitesEmpty => 'Nav aktīvu uzaicinājumu.';

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
    return '$uses / $maxUses lietošanas reizes';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Derīgs līdz $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Skatiet un pārvaldiet bloķētos lietotājus.';

  @override
  String get guildSettingsBansSearchHint => 'Meklēt bloķētos';

  @override
  String get guildSettingsBansEmpty => 'Nav bloķētu lietotāju.';

  @override
  String get guildSettingsBanPermanent => 'Pastāvīgs bloķējums';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Derīgs līdz $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Derīgs līdz';

  @override
  String get guildSettingsUnban => 'Atbloķēt';

  @override
  String get guildSettingsBansLoading => 'Notiek bloķēto lietotāju ielāde';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nav atrasti bloķējumi, kas atbilst jūsu meklēšanai.';

  @override
  String get guildSettingsBanDetailsTitle => 'Bloķēšanas detaļas';

  @override
  String get guildSettingsBanViewDetails => 'Skatīt detaļas';

  @override
  String get guildSettingsBannedOn => 'Bloķēts';

  @override
  String get guildSettingsBannedBy => 'Bloķējis';

  @override
  String get guildSettingsRevokeBanTitle => 'Atcelt bloķēšanu';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Vai tiešām vēlaties atcelt $displayName bloķēšanu? Viņi varēs atkal pievienoties kopienai.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Bloķēšana atcelta lietotājam $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Nevarēja ielādēt bloķētos lietotājus. Mēģiniet vēlreiz.';

  @override
  String get guildSettingsRevokeBanError =>
      'Nevarēja atcelt bloķēšanu. Mēģiniet vēlreiz.';

  @override
  String get guildSettingsCommunitySettings => 'Kopienas iestatījumi';

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
      'Pārvaldiet savas kopienas profilu, kanālus un noklusējuma iestatījumus.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Zīmols';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Atjaunojiet savu ikonu, nosaukumu, baneri un uzaicinājuma fona attēlu';

  @override
  String get guildSettingsOverviewBannerUpload => 'Augšupielādēt baneri';

  @override
  String get guildSettingsOverviewIdleTitle => 'Dīkstāves iestatījumi';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfigurējiet AFK kanālu un taimautu';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistēma un sveicieni';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Izvēlieties sistēmas un sveiciena ziņojumu galamērķi';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Noklusējuma paziņojumi';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Kopienām ar vairāk nekā 250 dalībniekiem tiek piespiedu kārtā iestatīts \"tikai pieminējumi\". Jūsu sākotnējais iestatījums tiek saglabāts un tiks atjaunots, ja kopiena nokritīsies zem 250 dalībniekiem.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Papildu iestatījumi';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Atļaut elastīgus teksta kanālu nosaukumus';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Paslēpt kopienas īpašnieka kroni';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Atsevišķs baneris';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Rāda baneri atsevišķā sadaļā zem kopienas galvenes.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Augšupielādēt ikonu';

  @override
  String get guildSettingsOverviewRemoveImage => 'Noņemt';

  @override
  String get guildSettingsOverviewSplashTitle => 'Ielūguma fons';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Tērzēšanas iegultais fons';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Rādīts ielūgumu ieguljumos tērzēšanā.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Augšupielādēt fonu';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Nav kopienas banera';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Nav ielūguma fona';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Priekšskatījums';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Skaties, kā tavs ielūgums izskatās apmeklētājiem.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Teksta kanālu nosaukumi';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Kopienas īpašnieka kronis';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigurējiet, vai kronis tiek rādīts blakus kopienas īpašniekam';

  @override
  String get guildSettingsSplashCardAlignment => 'Kartītes izlīdzinājums';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centrs';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Pa kreisi';

  @override
  String get guildSettingsSplashAlignmentRight => 'Pa labi';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Attiecas tikai uz platiem ekrāniem.';

  @override
  String get permissionReadMessageHistory => 'Lasīt ziņojumu vēsturi';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Mainīt, ko var redzēt lietotāji bez \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Izmantojiet īpašu logu, lai iestatītu ziņojumu vēstures atskaites datumu dalībniekiem, kuriem nav \"$permission\" atļaujas.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Atvērt ziņojumu vēstures atskaites punktu';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Ziņojumu vēstures atskaites punkts';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Iespējot ziņojumu vēstures atskaites punktu';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Atskaites datums';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Dalībnieki bez atļaujas Lasīt ziņojumu vēsturi varēs skatīt ziņojumus, kas nosūtīti pēc šī datuma.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Ziņojumu vēstures atskaites punkts atjaunināts';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Atļaut lielos burtus un atstarpes teksta kanālu nosaukumos. Izslēgts ierobežo nosaukumus līdz mazajiem burtiem ar domuzīmēm un pasvītrojumiem.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Paslēpj kroņa ikonu blakus kopienas īpašniekam visās vietās.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animētām ikonām nepieciešama kopienas funkcija \"Animētās ikonas\".';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animētiem baneriem nepieciešama kopienas funkcija \"Animētais baneris\".';

  @override
  String get guildSettingsAfkChannel => 'AFK / dīkstāves kanāls';

  @override
  String get guildSettingsAfkChannelHint =>
      'Pārvietot dalībniekus uz šo kanālu, kad viņi ir AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Nav AFK kanāla';

  @override
  String get guildSettingsAfkTimeout => 'AFK taimauts';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minūte';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minūtes';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minūtes';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minūtes';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 stunda';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekundes';
  }

  @override
  String get guildSettingsSystemChannel => 'Mērķa kanāls';

  @override
  String get guildSettingsSystemChannelHint =>
      'Sveiciena un sistēmas ziņojumi parādīsies šeit.';

  @override
  String get guildSettingsNoSystemChannel => 'Nav sistēmas kanāla';

  @override
  String get guildSettingsHideJoinMessages => 'Paslēpt pievienošanās ziņojumus';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Slēpj pievienošanās ziņojumus galamērķa kanālā.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Noklusējuma paziņojumu iestatījumi';

  @override
  String get guildSettingsNotificationsAll => 'Visas ziņojumapmaiņas';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Saņemt paziņojumus par visām ziņām';

  @override
  String get guildSettingsNotificationsMentions => 'Tikai pieminējumi';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Saņemt paziņojumus tikai par pieminējumiem';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maksimālais izmērs: 10 MB. Minimālais izmērs: 960×540 pikseļi (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maksimālais izmērs: 10 MB. Minimālais izmērs: 960×540 pikseļi (16:9). Tiek rādīts uzaicinājumu ieguljumos tērzēšanā.';

  @override
  String get guildSettingsModerationDescription =>
      'Konfigurējiet verifikācijas, satura filtrēšanas un saturam jutīgu iestatījumus.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Kopienām, kas ir iekļautas atklāšanā, ir ierobežotas moderācijas iespējas.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Satura filtrēšana';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automātiski pārbaudīt ziņojumus uz nepārprotamu saturu kanālos, kas nav atzīmēti kā saturam jutīgi.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Kopienām, kas ir iekļautas atklāšanā, ir jāpārbauda visi dalībnieki. Šo iestatījumu nevar mainīt, kamēr ir iespējota atklāšana.';

  @override
  String get guildSettingsContentFilterOff => 'Izslēgts';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Ļaujiet kopienai pašmoderēties';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Filtrēt dalībniekus bez lomām';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Ieteicams lielākajai daļai kopienu';

  @override
  String get guildSettingsContentFilterAll => 'Filtrēt visus';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maksimāla aizsardzība ģimenēm draudzīgām vietām';

  @override
  String get guildSettingsModerationMatureOff => 'Izslēgts';

  @override
  String get guildSettingsModerationMatureOn => 'Ieslēgts';

  @override
  String get guildSettingsContentWarningToggle =>
      'Rādīt brīdinājumu par saturu';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Ieslēdz piekrišanas uzvedni pirms jebkura kanāla atvēršanas.';

  @override
  String get guildSettingsContentWarningText => 'Pielāgots brīdinājuma teksts';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Šis satur sensitīvu saturu.';

  @override
  String get guildSettingsModeration2faTitle => '2FA prasība';

  @override
  String get guildSettingsModeration2faDescription =>
      'Pieprasīt divu faktoru autentifikāciju moderatoriem pirms viņi var aizliegt, izslēgt, laiktērpa vai dzēst ziņojumus.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Pieprasīt 2FA moderācijas darbībām';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Tikai kopienas īpašnieks var mainīt šo iestatījumu';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Iespējojiet 2FA savā kontā, lai mainītu šo iestatījumu';

  @override
  String get guildSettingsEmojiSearchHint => 'Meklēt emocijikonas';

  @override
  String get guildSettingsEmojiUploadTitle => 'Augšupielādēt emocijikonu';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Neanimētas emocijikonas ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animētas emocijikonas ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Meklēt uzlīmes';

  @override
  String get guildSettingsWebhooksInfo =>
      'Izveidojiet tīmekļa pārsteigumus no kanāla iestatījumiem. Rediģējiet tos šeit.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Jūsu pielāgotā URL nedarbosies, ja vien vismaz viens kanāls nebūs redzams visiem.';

  @override
  String get guildSettingsVanityUrlRemove => 'Noņemt';

  @override
  String get guildSettingsBannedUsersTitle => 'Aizliegtie lietotāji';

  @override
  String get guildSettingsInvitesTableInviter => 'Aicinātājs';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanāls';

  @override
  String get guildSettingsInvitesTableCode => 'Kods';

  @override
  String get guildSettingsInvitesTableUses => 'Lietojumi';

  @override
  String get guildSettingsInvitesTableCreated => 'Izveidots';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Jaunākie pirmie';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrēt pēc lietotāja';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrēt pēc darbības';

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
