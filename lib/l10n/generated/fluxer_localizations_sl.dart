// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class FluxerLocalizationsSl extends FluxerLocalizations {
  FluxerLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get reconnectingTitle => 'Nekaj smo zajebali!';

  @override
  String get reconnectingBody =>
      'Nekaj je narobe s strežniki.\nKmalu bo popravljeno!';

  @override
  String get gatewayReconnectingToast => 'Ponovno povezovanje…';

  @override
  String get gatewayConnectedToast => 'Povezano';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Zagon ni uspel: $error';
  }

  @override
  String get retry => 'Ponovi';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Povezava izgubljena';

  @override
  String get splashViewOnStatusPage => 'Ogled na strani s statusom';

  @override
  String get splashConnectionIssuesPrompt => 'Težave s povezavo?';

  @override
  String get splashStatusPageLink => 'Stran s statusom';

  @override
  String get splashReadIncident => 'Preberi incident';

  @override
  String get splashIncidentHistory => 'Zgodovina incidentov';

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
  String get welcomeBack => 'Dobrodošli nazaj';

  @override
  String get email => 'E-pošta';

  @override
  String get emailInvalid => 'Prosimo, vnesite veljaven e-poštni naslov.';

  @override
  String get password => 'Geslo';

  @override
  String get forgotPassword => 'Ste pozabili geslo?';

  @override
  String get logIn => 'Prijava';

  @override
  String get logInWithPasskey => 'Prijava s ključem za dostop';

  @override
  String continueWithSso(String provider) {
    return 'Nadaljuj z $provider';
  }

  @override
  String get ssoRequired => 'Za dostop do te instance je potreben SSO.';

  @override
  String get organizationSsoProvider =>
      'Prijavite se s ponudnikom enotne prijave vaše organizacije.';

  @override
  String get failedToStartSso => 'Začetek SSO ni uspel';

  @override
  String get ssoCancelled => 'Prijava SSO je bila preklicana';

  @override
  String preferSso(String provider) {
    return 'Raje uporabljate SSO? Nadaljujte z $provider.';
  }

  @override
  String get logInViaBrowser => 'Prijava prek brskalnika';

  @override
  String get needAccountPrompt => 'Potrebujete račun? ';

  @override
  String get register => 'Registracija';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Preverite, da ste človek';

  @override
  String get captchaDescription =>
      'Prepričati se moramo, da niste bot. Prosimo, dokončajte preverjanje spodaj.';

  @override
  String get captchaSwitchToHcaptcha => 'Težave? Poskusite raje hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Poskusite raje Turnstile';

  @override
  String get cancel => 'Prekliči';

  @override
  String get ipAuthCheckEmail => 'Preverite svojo e-pošto';

  @override
  String ipAuthDescription(String email) {
    return 'Poslali smo e-poštno sporočilo s povezavo za avtorizacijo te prijave. Prosimo, odprite nabiralnik za $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Povezava izgubljena';

  @override
  String get ipAuthConnectionLostDescription =>
      'Med čakanjem na avtorizacijo smo izgubili povezavo. Prosimo, poskusite znova.';

  @override
  String get ipAuthLinkExpired => 'Povezava za prijavo je potekla';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Ta povezava za avtorizacijo je potekla. Prosimo, prijavite se znova.';

  @override
  String get ipAuthResendEmail => 'Ponovno pošlji e-pošto';

  @override
  String get ipAuthResent => 'Ponovno poslano';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Nazaj';

  @override
  String get mfaTitle => 'Dvo-faktorska avtentikacija';

  @override
  String get mfaChooseMethod => 'Izberite način preverjanja';

  @override
  String get mfaMethodTotp => 'Aplikacija za avtentikacijo';

  @override
  String get mfaMethodWebauthn => 'Varnostni ključ / Ključ za dostop';

  @override
  String get mfaTotpDescription =>
      'Vnesite 6-mestno kodo iz svoje aplikacije za avtentikacijo ali eno od svojih varnostnih kod.';

  @override
  String get mfaCodeLabel => 'Koda';

  @override
  String get mfaTryAnotherMethod => 'Poskusite drug način';

  @override
  String get mfaUseSecurityKey =>
      'Preizkusite varnostni ključ / geslo namesto tega';

  @override
  String get accountSelectorTitle => 'Izberite račun';

  @override
  String get accountSelectorDescription =>
      'Izberite račun za nadaljevanje ali dodajte drugega.';

  @override
  String get accountAdd => 'Dodaj račun';

  @override
  String get accountRemove => 'Odstrani';

  @override
  String accountRemoveTitle(String username) {
    return 'Odstrani $username';
  }

  @override
  String get accountRemoveDescription =>
      'To bo odstranilo shranjeno seja za ta račun.';

  @override
  String get accountRemoveOnlyDescription =>
      'To bo odstranilo edini shranjeni račun na tej napravi.';

  @override
  String get accountExpired => 'Poteklo';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sesija je potekla za $identifier. Prijavite se ponovno.';
  }

  @override
  String get accountManageTitle => 'Upravljanje računov';

  @override
  String get accountSwitchFailed =>
      'Preklapljanje računov ni uspelo. Poskusite znova.';

  @override
  String get profileTabMenuSwitchAccounts => 'Preklopi račune';

  @override
  String get statusChangeSheetTitle => 'Nastavi status';

  @override
  String get statusOnlineStatusSection => 'Spletni status';

  @override
  String get statusOnline => 'Na spletu';

  @override
  String get statusIdle => 'Neaktivno';

  @override
  String get statusDnd => 'Ne moti';

  @override
  String get statusInvisible => 'Nevidno';

  @override
  String get statusOffline => 'Brez povezave';

  @override
  String get statusUntilIChangeIt => 'Dokler ga ne spremenim';

  @override
  String get statusDontClear => 'Ne počisti';

  @override
  String get statusFor10Seconds => 'Za 10 sekund';

  @override
  String get statusClearAfter10Seconds => '10 sekund';

  @override
  String get statusClearAfter15Minutes => '15 minut';

  @override
  String get statusClearAfter30Minutes => '30 minut';

  @override
  String get statusClearAfter1Hour => '1 uro';

  @override
  String get statusClearAfter3Hours => '3 ure';

  @override
  String get statusClearAfter4Hours => '4 ure';

  @override
  String get statusClearAfter8Hours => '8 ur';

  @override
  String get statusClearAfter24Hours => '24 ur';

  @override
  String get statusClearAfter3Days => '3 dni';

  @override
  String get statusDndDescription => 'Ne boste prejemali obvestil na namizju';

  @override
  String get statusInvisibleDescription =>
      'Prikazovali se boste kot brez povezave';

  @override
  String get customStatusSetTitle => 'Nastavi status po meri';

  @override
  String get customStatusCurrentHint => 'Status po meri';

  @override
  String get customStatusClear => 'Počisti status po meri';

  @override
  String get customStatusPlaceholder => 'Kaj se dogaja?';

  @override
  String get customStatusChooseEmoji => 'Izberi emodži';

  @override
  String get customStatusClearAfter => 'Počisti po';

  @override
  String get customStatusSave => 'Shrani';

  @override
  String get accountActive => 'Aktivni račun';

  @override
  String get signOut => 'Odjava';

  @override
  String get suspendedPermanentTitle => 'Račun trajno ustavljen';

  @override
  String get suspendedTemporaryTitle => 'Račun ustavljen';

  @override
  String get suspendedPermanentDescription =>
      'Vaš račun je bil trajno ustavljen zaradi kršitve naših Pogojev storitve.';

  @override
  String get suspendedTemporaryDescription =>
      'Vaš račun je bil začasno ustavljen. Do računa boste lahko dostopali, ko se obdobje ustavitve konča.';

  @override
  String get suspendedIssuedAt => 'Izdano';

  @override
  String get suspendedEndsAt => 'Konča se';

  @override
  String get suspendedDuration => 'Trajanje';

  @override
  String get suspendedPermanent => 'Trajno';

  @override
  String get suspendedReason => 'Razlog';

  @override
  String get suspendedAppealDeadline => 'Rok za pritožbo';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Vaš račun je predviden za brisanje $date.';
  }

  @override
  String get suspendedRecheck => 'Preveri posodobitve';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Poskusi ponovno čez ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Nazaj na prijavo';

  @override
  String get suspendedAppealTitle => 'Pritožba';

  @override
  String get suspendedAppealHint =>
      'Pojasnite, zakaj bi morali ponovno razmisliti o vaši prepovedi (vsaj 50 znakov)...';

  @override
  String get suspendedAppealSubmit => 'Oddaj pritožbo';

  @override
  String get suspendedAppealPending => 'Čaka na pregled';

  @override
  String get suspendedAppealAccepted => 'Pritožba sprejeta';

  @override
  String get suspendedAppealRejected => 'Pritožba zavrnjena';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Vaša pritožba je bila sprejeta in vaš račun je bil ponovno vzpostavljen.';

  @override
  String get suspendedSignIn => 'Prijavi se v svoj račun';

  @override
  String get forgotPasswordTitle => 'Ste pozabili geslo?';

  @override
  String get forgotPasswordDescription =>
      'Vnesite svoj e-poštni naslov in poslali vam bomo povezavo za ponastavitev gesla.';

  @override
  String get forgotPasswordSubmit => 'Pošlji povezavo za ponastavitev';

  @override
  String get forgotPasswordSentTitle => 'Preveri svoj e-poštni predal';

  @override
  String get forgotPasswordSentDescription =>
      'Poslali smo vam navodila za ponastavitev gesla na vaš e-poštni naslov. Preverite mapo »Prejeto« in sledite povezavi za ponastavitev gesla.';

  @override
  String get forgotPasswordBackToLogin => 'Vrni se na prijavo';

  @override
  String get resetPasswordTitle => 'Nastavi novo geslo';

  @override
  String get resetPasswordDescription =>
      'Vnesite novo geslo spodaj, da dokončate postopek ponastavitve.';

  @override
  String get resetPasswordNewPassword => 'Novo geslo';

  @override
  String get resetPasswordConfirm => 'Potrdi novo geslo';

  @override
  String get resetPasswordSubmit => 'Ponastavi geslo';

  @override
  String get resetPasswordMismatch => 'Gesli se ne ujemata.';

  @override
  String get registerTitle => 'Ustvari račun';

  @override
  String get registerDisplayName => 'Prikazno ime (neobvezno)';

  @override
  String get registerDisplayNameHint => 'Kako naj te ljudje kličejo?';

  @override
  String get registerUsername => 'Uporabniško ime (neobvezno)';

  @override
  String get registerUsernameHint =>
      'Pusti prazno za naključno uporabniško ime';

  @override
  String get registerUsernameTagHint =>
      'Samodejno bo dodan 4-mestni označevalnik za zagotovitev edinstvenosti';

  @override
  String get registerDateOfBirth => 'Datum rojstva';

  @override
  String get registerMonth => 'Mesec';

  @override
  String get registerDay => 'Dan';

  @override
  String get registerYear => 'Leto';

  @override
  String get registerConsent =>
      'Strinjam se s Pogoji storitve in Pravilnikom o zasebnosti';

  @override
  String get registerConsentPrefix => 'Strinjam se s ';

  @override
  String get registerConsentTerms => 'Pogoji storitve';

  @override
  String get registerConsentAnd => ' in ';

  @override
  String get registerConsentPrivacy => 'Pravilnikom o zasebnosti';

  @override
  String get registerConfirmPassword => 'Potrdi geslo';

  @override
  String get registerSubmit => 'Ustvari račun';

  @override
  String get registerHaveAccount => 'Že imaš račun? ';

  @override
  String get passkeyNoCredentials =>
      'Za to aplikacijo niso najdeni nobeni geselski ključi. Namesto tega se prijavi z e-poštnim naslovom in geslom.';

  @override
  String get passkeyDeviceNotSupported =>
      'Geselski ključi niso podprti na tej napravi.';

  @override
  String get passkeyDomainNotAssociated =>
      'Geselski ključi niso konfigurirani za to aplikacijo. Namesto tega se prijavi z e-poštnim naslovom in geslom.';

  @override
  String get passkeyTimeout =>
      'Avtentikacija z geselskim ključem je potekla. Prosimo, poskusite znova.';

  @override
  String get passkeyNotAvailable =>
      'Geselski ključi niso na voljo za to aplikacijo. Namesto tega se prijavi z e-poštnim naslovom in geslom.';

  @override
  String get passkeyFailed =>
      'Avtentikacija s passkey je spodletela. Prosimo, poskusite znova.';

  @override
  String get errorUnableToCreateAccount =>
      'Računa ni mogoče ustvariti. Prosimo, poskusite znova.';

  @override
  String get errorUnableToSignIn =>
      'Trenutno se ne morete prijaviti. Prosimo, poskusite znova.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Neveljaven e-poštni naslov ali geslo.';

  @override
  String get errorUnableToSendResetLink =>
      'Povezave za ponastavitev ni mogoče poslati. Prosimo, poskusite znova.';

  @override
  String get errorUnableToResetPassword =>
      'Gesla ni mogoče ponastaviti. Prosimo, poskusite znova.';

  @override
  String get embedInviteJoin => 'Pridruži se skupnosti';

  @override
  String get embedInviteGoTo => 'Pojdi v skupnost';

  @override
  String embedInviteOnline(String count) {
    return '$count na spletu';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count članov';
  }

  @override
  String get embedInviteUnknownTitle => 'Neveljavno povabilo';

  @override
  String get embedInviteUnknownSubtitle => 'Poskusite zahtevati novo povabilo.';

  @override
  String get embedInviteUnavailable => 'Povabilo ni na voljo';

  @override
  String get inviteAcceptTitle => 'Vabljeni ste k pridružitvi';

  @override
  String get inviteAcceptJoinButton => 'Pridruži se skupnosti';

  @override
  String get inviteAcceptGoToButton => 'Pojdi v skupnost';

  @override
  String get inviteAcceptInvitesPaused => 'Povabila so začasno ustavljena';

  @override
  String get inviteAcceptNotFoundTitle => 'Povabilo je neveljavno';

  @override
  String get inviteAcceptNotFoundDescription =>
      'To povabilo je morda poteklo ali je neveljavno.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Pridruži se skupini';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'V skupinski neposredni sporočilo vas je povabil $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'nekdo';

  @override
  String get inviteAcceptEmojiPack => 'Paket emojijev';

  @override
  String get inviteAcceptStickerPack => 'Paket nalepk';

  @override
  String get inviteAcceptInstallEmojiPack => 'Namesti paket emojijev';

  @override
  String get inviteAcceptInstallStickerPack => 'Namesti paket nalepk';

  @override
  String get inviteAcceptPackInstallNote =>
      'Z nadaljevanjem boste samodejno namestili paket.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Dostop do kanala zavrnjen';

  @override
  String get channelAccessDeniedDescription =>
      'Nimate dostopa do kanala, kjer je bilo poslano to sporočilo.';

  @override
  String get messageJumpLinkNoAccess => 'Ni dostopa';

  @override
  String get okay => 'V redu';

  @override
  String get embedThemeTitle => 'Deljena tema';

  @override
  String get embedThemeSubtitle => 'Ta odjemalec ne podpira tem po meri.';

  @override
  String get embedThemeUnavailableButton => 'Teme niso na voljo';

  @override
  String get privacySettings => 'Nastavitve zasebnosti';

  @override
  String get privacyDirectMessages => 'Neposredna sporočila';

  @override
  String get privacyDirectMessagesDescription =>
      'Dovoli neposredna sporočila drugih članov v tej skupnosti';

  @override
  String get privacyBotDirectMessages => 'Neposredna sporočila botov';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Dovoli botom iz te skupnosti, da vam pošiljajo neposredna sporočila';

  @override
  String get privacyMutualDmsDisabled =>
      'Skrbniki skupnosti so onemogočili prejemanje neposrednih sporočil samo od vzajemnih članov v tej skupnosti.';

  @override
  String get communityDebug => 'Odpravljanje napak v skupnosti';

  @override
  String get copiedToClipboard => 'Kopirano v odložišče';

  @override
  String get notificationSettings => 'Nastavitve obvestil';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Utili $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Mute skupnosti preprečuje prikaz neprebranih indikatorjev in obvestil, razen če ste omenjeni.';

  @override
  String get notificationCommunitySettings => 'Nastavitve obvestil skupnosti';

  @override
  String get notificationAllMessages => 'Vsa sporočila';

  @override
  String get notificationOnlyMentions => 'Samo omembe';

  @override
  String get notificationNothing => 'Nič';

  @override
  String get notificationSuppressEveryone =>
      'Zatiranje omemb @everyone in @here';

  @override
  String get notificationSuppressRoles => 'Ne upoštevaj vseh omenjenih vlog';

  @override
  String get notificationMobilePush => 'Potisna obvestila za mobilne naprave';

  @override
  String get notificationOverrides => 'Preglasi obvestil';

  @override
  String get notificationSelectChannel => 'Izberi kanal ali kategorijo';

  @override
  String get notificationOnlyAtMentions => 'Samo ob omenitvah';

  @override
  String get notificationMuteChannel => 'Utili kanal';

  @override
  String get notificationUnmuteChannel => 'Vklopi zvok kanala';

  @override
  String get notificationNoCategory => 'Ni kategorije';

  @override
  String get dmMarkAsRead => 'Označi kot prebrano';

  @override
  String get dmMuteConversation => 'Utili neposredno sporočilo';

  @override
  String get dmUnmuteConversation => 'Vklopi zvok neposrednega sporočila';

  @override
  String get dmPinDm => 'Pripni neposredno sporočilo';

  @override
  String get dmUnpinDm => 'Odstrani priponko neposrednega sporočila';

  @override
  String get dmAlwaysShowInSidebar => 'Vedno prikaži v stranski vrstici';

  @override
  String get dmRemoveFromAlwaysShown => 'Odstrani iz »Vedno prikaži«';

  @override
  String get dmCloseDm => 'Zapri neposredno sporočilo';

  @override
  String get dmCloseDmConfirmTitle => 'Zapri neposredno sporočilo';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Ali ste prepričani, da želite zapreti neposredno sporočilo z uporabnikom $username? Lahko ga ponovno odprete pozneje.';
  }

  @override
  String get dmCopyChannelId => 'Kopiraj ID kanala';

  @override
  String get dmChannelIdCopied => 'ID kanala kopiran';

  @override
  String get dmCopyUserId => 'Kopiraj ID uporabnika';

  @override
  String get dmUserIdCopied => 'ID uporabnika kopiran';

  @override
  String get dmViewProfile => 'Ogled profila';

  @override
  String get dmVoiceCall => 'Začni glasovni klic';

  @override
  String get incomingVoiceCallTitle => 'Dohodni glasovni klic';

  @override
  String get incomingVoiceCallAccept => 'Sprejmi';

  @override
  String get incomingVoiceCallDecline => 'Zavrni';

  @override
  String get incomingVoiceCallLabel => 'Dohodni klic';

  @override
  String get incomingVoiceCallIgnore => 'Prezri';

  @override
  String get directVoiceCallNotEligible =>
      'Tega klica trenutno ni mogoče začeti. Poskusite znova čez trenutek.';

  @override
  String get voiceJoinCallFailed =>
      'Povezava s tem klicem ni uspela. Preverite svojo povezavo in poskusite znova.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Klicu se ni mogoče pridružiti. Preverite svojo povezavo in poskusite znova.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Posodabljanje tega klica na strežniku ni uspelo. Preverite svojo povezavo in poskusite znova.';

  @override
  String get dmAddNote => 'Dodaj opombo';

  @override
  String get dmEditGroup => 'Uredi skupino';

  @override
  String get dmInviteToCommunity => 'Povabi v skupnost';

  @override
  String get dmBlock => 'Blokiraj';

  @override
  String get dmLeaveGroup => 'Zapusti skupino';

  @override
  String get dmNoCommunitiesAvailable => 'Ni na voljo skupnosti';

  @override
  String dmGroupMemberCount(int count) {
    return '$count članov';
  }

  @override
  String get dmMuteFor15Min => 'Za 15 minut';

  @override
  String get dmMuteFor30Min => 'Za 30 minut';

  @override
  String get dmMuteFor1Hour => 'Za 1 uro';

  @override
  String get dmMuteFor3Hours => 'Za 3 ure';

  @override
  String get dmMuteFor4Hours => 'Za 4 ure';

  @override
  String get dmMuteFor8Hours => 'Za 8 ur';

  @override
  String get dmMuteFor24Hours => 'Za 24 ur';

  @override
  String get dmMuteFor3Days => 'Za 3 dni';

  @override
  String get dmMuteForever => 'Dokler ne vklopim ponovno';

  @override
  String get dmPinGroupDm => 'Pripni skupinsko neposredno sporočilo';

  @override
  String get dmUnpinGroupDm => 'Odstrani priponko skupinskega sporočila';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Dodaj sporočilo med priljubljene';

  @override
  String get dmUnfavoriteDm => 'Odstrani sporočilo iz priljubljenih';

  @override
  String get dmFavoriteGroupDm => 'Dodaj skupinsko sporočilo med priljubljene';

  @override
  String get dmUnfavoriteGroupDm =>
      'Odstrani skupinsko sporočilo iz priljubljenih';

  @override
  String get dmChangeFriendNickname => 'Spremeni vzdevek prijatelja';

  @override
  String get dmRemoveFriend => 'Odstrani prijatelja';

  @override
  String get dmAddFriend => 'Dodaj prijatelja';

  @override
  String get dmAcceptFriendRequest => 'Sprejmi prošnjo za prijateljstvo';

  @override
  String get dmIgnoreFriendRequest => 'Zavrni prošnjo za prijateljstvo';

  @override
  String get dmFriendRequestSent => 'Poslana prošnja za prijateljstvo';

  @override
  String get dmUnblock => 'Odblokiraj';

  @override
  String get dmDebugUser => 'Odstrani napake uporabnika';

  @override
  String get dmDebugChannel => 'Odstrani napake kanala';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Priponka sporočila';

  @override
  String get dmUnpinned => 'Odstranjena priponka sporočila';

  @override
  String get dmMuted => 'Utisnjeno sporočilo';

  @override
  String get dmUnmuted => 'Vklopljen zvok sporočila';

  @override
  String get dmRemoveFriendConfirmTitle => 'Odstrani prijatelja';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Ali ste prepričani, da želite $username odstraniti kot prijatelja?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blokiraj uporabnika';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Ali ste prepričani, da želite blokirati $username? Ne bo vam mogel/mogla pošiljati sporočil ali prošenj za prijateljstvo.';
  }

  @override
  String get dmFriendRequestSentToast => 'Poslana prošnja za prijateljstvo';

  @override
  String get dmFriendRequestFailed =>
      'Ni uspelo poslati prošnje za prijateljstvo';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Ni uspelo sprejeti prošnje za prijateljstvo';

  @override
  String get dmRemoveFriendFailed => 'Ni uspelo odstraniti prijatelja';

  @override
  String get dmBlockFailed => 'Ni uspelo blokirati uporabnika';

  @override
  String get dmUnblockFailed => 'Ni uspelo odblokirati uporabnika';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Ni uspelo zavrniti prošnje za prijateljstvo';

  @override
  String get dmAddFriends => 'Dodaj prijatelje';

  @override
  String get addFriendSheetTitle => 'Dodaj prijatelja';

  @override
  String get addFriendUsernameHint => 'Uporabniško ime#0000';

  @override
  String get addFriendUsernameLabel => 'Uporabniško ime prijatelja';

  @override
  String get addFriendSendRequest => 'Pošlji prošnjo';

  @override
  String get addFriendNoUserFound =>
      'Ni najden uporabnik s tem uporabniškim imenom.';

  @override
  String get addFriendInvalidUsername =>
      'Vnesite veljavno uporabniško ime (Uporabniško ime#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Poslana prošnja za prijateljstvo';

  @override
  String get addFriendClaimTitle => 'Zahtevajte svoj račun';

  @override
  String get addFriendClaimDescription =>
      'Zahtevajte svoj račun, da lahko pošiljate prošnje za prijateljstvo.';

  @override
  String get addFriendVerifyTitle => 'Preverite svoj e-poštni naslov';

  @override
  String get addFriendVerifyDescription =>
      'Preden lahko pošljete prošnje za prijateljstvo, morate preveriti svoj e-poštni naslov.';

  @override
  String get addFriendVerifyEmail => 'Preveri e-pošto';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Dohodne prošnje za prijateljstvo ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Odhodne prošnje za prijateljstvo ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Dohodna prošnja za prijateljstvo';

  @override
  String get addFriendOutgoingStatus => 'Poslana prošnja za prijateljstvo';

  @override
  String get addFriendViewProfile => 'Ogled profila';

  @override
  String get addFriendAccept => 'Sprejmi';

  @override
  String get addFriendIgnore => 'Zavrni';

  @override
  String get addFriendAcceptTitle => 'Sprejmi prošnjo za prijateljstvo';

  @override
  String get addFriendIgnoreTitle => 'Prezri zahtevo za prijateljstvo';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Sprejmeš zahtevo za prijateljstvo od $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Prezreš zahtevo za prijateljstvo od $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Prekliči zahtevo';

  @override
  String get addFriendCancelRequestFailed =>
      'Zahteve za prijateljstvo ni bilo mogoče preklicati. Poskusi znova.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Trenutno ne sprejemajo prošenj za prijateljstvo.';

  @override
  String get addFriendUnblockFirst =>
      'Najprej jih odblokiraj, da pošlješ zahtevo za prijateljstvo.';

  @override
  String get addFriendCannotSendToSelf =>
      'Ne moreš poslati zahteve za prijateljstvo samemu sebi.';

  @override
  String get addFriendAlreadyFriends => 'Že sta prijatelja s tem uporabnikom.';

  @override
  String get addFriendClaimToSend =>
      'Dokončaj prijavo, da pošlješ zahteve za prijateljstvo.';

  @override
  String get addFriendSendFailedGeneric =>
      'Zahteve za prijateljstvo ni bilo mogoče poslati. Poskusi znova.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistem';

  @override
  String get emojiSearchPlaceholder => 'Poišči emoji svojih sanj';

  @override
  String get emojiSearchEmpty => 'Ni emojijev, ki bi ustrezali tvojemu iskanju';

  @override
  String get emojiAutocompleteDefaultLabel => 'Privzeti emoji';

  @override
  String get emojiFrequentlyUsed => 'Pogosto uporabljeno';

  @override
  String get emojiTabGifs => 'GIF-i';

  @override
  String get emojiTabMedia => 'Mediji';

  @override
  String get emojiTabStickers => 'Nalepke';

  @override
  String get emojiTabEmojis => 'Emoji';

  @override
  String get gifPickerSearch => 'Išči GIF-e';

  @override
  String get gifPickerSearchKlipy => 'Išči KLIPY';

  @override
  String get gifPickerSearchTenor => 'Išči Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Priljubljeno';

  @override
  String get gifPickerTrending => 'Priljubljeni GIF-i';

  @override
  String get gifPickerNoResultsTitle => 'Ni rezultatov iskanja';

  @override
  String get gifPickerNoResultsDescription =>
      'Poskusite z drugim iskalnim izrazom';

  @override
  String get gifPickerLoadFailedTitle => 'Ni bilo mogoče naložiti GIF-ov';

  @override
  String get gifPickerLoadFailedBody =>
      'Preverite svojo povezavo in poskusite znova.';

  @override
  String get emojiCategoryPeople => 'Ljudje';

  @override
  String get emojiCategoryNature => 'Narava';

  @override
  String get emojiCategoryFood => 'Hrana in pijača';

  @override
  String get emojiCategoryActivity => 'Dejavnosti';

  @override
  String get emojiCategoryTravel => 'Potovanja in kraji';

  @override
  String get emojiCategoryObjects => 'Predmeti';

  @override
  String get emojiCategorySymbols => 'Simboli';

  @override
  String get emojiCategoryFlags => 'Zastave';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Odklenite $emojiCount od $communityCount s Plutonijem.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Pridobi Plutonij';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Ne prikazuj več';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emodžijev po meri',
      one: '1 emodži po meri',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skupnosti',
      one: '1 skupnost',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Opozorilo o zunanji povezavi';

  @override
  String get externalLinkWarningLeaving => 'Namenjate zapustiti Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Zunanje povezave so lahko nevarne. Bodite previdni.';

  @override
  String get externalLinkWarningDestinationUrl => 'Ciljni URL:';

  @override
  String get externalLinksSectionTitle => 'Zunanje povezave';

  @override
  String get externalLinksSectionDescription =>
      'Konfigurirajte, kako se obravnavajo opozorila o zunanjih povezavah.';

  @override
  String get externalLinkWarningTrustPrefix => 'Vedno zaupaj ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — preskoči to opozorilo naslednjič';

  @override
  String get externalLinkVisitSite => 'Obišči spletno mesto';

  @override
  String get externalLinkTrustAllLabel => 'Zaupaj vsem zunanjim povezavam';

  @override
  String get externalLinkStripTrackingLabel =>
      'Odstrani parametre za sledenje iz URL-jev';

  @override
  String get externalLinkStripTrackingDescription =>
      'Samodejno odstrani parametre za sledenje (kot so utm_source, fbclid, gclid) iz URL-jev v sporočilih, ki jih pošiljate. Povezavo očisti, preden doseže kogar koli drugega.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Zaupaš vsem zunanjim povezavam?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'To bo zaupalo vsem zunanjim povezavam in preskočilo opozorilo za vsako domeno. Vaše obstoječe zaupane domene bodo zamenjane. To je manj varno.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Zaupaj vsem';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Prenehati zaupati vsem povezavam?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Opozorila o zunanjih povezavah se bodo ponovno prikazala. Zaupane domene boste morali dodati posamezno.';

  @override
  String get externalLinkStopTrustingAllAction => 'Onemogoči zaupanje vsem';

  @override
  String get externalLinkTrustedAllDescription =>
      'Vsem zunanjim povezavam je zaupano. Opozorila se ne bodo prikazala.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Imate $count zaupanih domen. Več dodajte s potrditvijo polja ob obisku zunanjih povezav.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Ko je omogočeno, se ne bodo prikazala opozorila o zunanjih povezavah. To je manj varno.';

  @override
  String get imageFileTooLarge =>
      'Datoteka slike je prevelika. Izberite datoteko, manjšo od 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animirani avatarji zahtevajo Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animirani pasice zahtevajo Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animirani AVIF ni podprt';

  @override
  String get animatedAvifNotSupportedBody =>
      'Obrezovanje in vrtenje animiranih datotek AVIF še ni podprto. Če nadaljujete, bo naložena v svoji prvotni obliki.';

  @override
  String get uploadAsIs => 'Naloži kot je';

  @override
  String get croppingAnimatedNotSupported =>
      'Obrezovanje animiranih slik še ni podprto. Uporabljena bo prvotna datoteka.';

  @override
  String get cropAvatar => 'Obreži avatar';

  @override
  String get cropBanner => 'Obreži pasico';

  @override
  String get skip => 'Preskoči';

  @override
  String get crop => 'Obreži';

  @override
  String get changeYourFluxerTag => 'Spremeni svojo FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Uporabniška imena lahko vsebujejo samo črke (a-z, A-Z), številke (0-9) in podčrtaje. Uporabniška imena niso občutljiva na velikost črk.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Uporabniška imena lahko vsebujejo samo črke (a-z, A-Z), številke (0-9) in podčrtaje. Uporabniška imena niso občutljiva na velikost črk. Izberete lahko katero koli razpoložljivo 4-mestno oznako od #0000 do #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Uporabniška imena lahko vsebujejo samo črke (a-z, A-Z), številke (0-9) in podčrtaje. Uporabniška imena niso občutljiva na velikost črk. Izberete lahko katero koli razpoložljivo 4-mestno oznako od #0001 do #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Med $min in $max znaki';
  }

  @override
  String get validationAllowedChars =>
      'Samo črke (a-z, A-Z), številke (0-9) in podčrtaji (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Pridobite Plutonium za prilagajanje svoje oznake ali jo obdržite ob spreminjanju uporabniškega imena';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag je že zaseden';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminator je že zaseden. Nadaljevanje bo samodejno ponovno izžrebalo vašo oznako.';
  }

  @override
  String get customTagIsTemporary => 'Osebna oznaka je začasna';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Vaša osebna 4-mestna oznaka je na voljo samo, dokler je vaša naročnina na Plutonium aktivna. Ko vaša naročnina poteče $date, se bo vaša oznaka po 3-dnevnem obdobju usmiljenja vrnila na naključno dodeljeno številko.';
  }

  @override
  String get customTagTemporaryBody =>
      'Vaša osebna 4-mestna oznaka je na voljo samo, dokler je vaša naročnina na Plutonium aktivna. Ko vaša naročnina poteče, se bo vaša oznaka po 3-dnevnem obdobju usmiljenja vrnila na naključno dodeljeno številko.';

  @override
  String get iUnderstandContinue => 'Razumem, nadaljuj';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Če shranite to FluxerTag, se bo vaša osebna 4-mestna oznaka po koncu naročnine na Plutonium vrnila na naključno številko. Če se vaša naročnina ne obnovi, boste imeli 3-dnevno obdobje usmiljenja, preden se oznaka spremeni.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Vaša osebna 4-mestna oznaka (#$discriminator) je aktivna, dokler je vaša naročnina na Plutonium aktivna. Če vaša naročnina poteče ali se ne obnovi po 3-dnevnem obdobju usmiljenja, se bo vaša oznaka vrnila na naključno številko.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Prilagodite svojo 4-mestno oznako ali jo obdržite ob spreminjanju uporabniškega imena';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Vaša preizkusna naročnina na Plutonium poteče $date. Nadgradite, da obdržite svojo osebno oznako in si prislužite značko na svojem profilu.';
  }

  @override
  String get premiumTrialActive =>
      'Trenutno ste na preizkusni naročnini na Plutonium. Nadgradite, da obdržite svojo osebno oznako in si prislužite značko na svojem profilu.';

  @override
  String get fluxerTagUpdated => 'FluxerTag posodobljen';

  @override
  String get fluxerTagUpdateFailed =>
      'Posodobitev FluxerTag ni uspela. Poskusite znova.';

  @override
  String get continueAction => 'Nadaljuj';

  @override
  String get profileCustomizationTitle => 'Prilagajanje profila';

  @override
  String get profileCustomizationDescription =>
      'Uredite videz svojega profila in si oglejte predogled v živo';

  @override
  String get usernameLabel => 'Uporabniško ime';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Zahtevajte svoj račun, da spremenite svojo FluxerTag';

  @override
  String get changeFluxerTag => 'Spremeni FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Prilagodite svojo 4-mestno oznako (#$discriminator) po želji s Plutoniumom';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Spremeni svoje uporabniško ime in 4-mestno oznako';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Vaša oznaka po meri (#$discriminator) je povezana z vašo naročnino na Plutonium in se bo vrnila na naključno oznako, če poteče.';
  }

  @override
  String get displayNameLabel => 'Prikazno ime';

  @override
  String get pronounsLabel => 'Zaimki';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Spremeni avatar';

  @override
  String get removeAvatar => 'Odstrani avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Največ 10 MB. Priporočeno: 512×512px';

  @override
  String get bannerLabel => 'Pasica';

  @override
  String get changeBanner => 'Spremeni pasico';

  @override
  String get removeBanner => 'Odstrani pasico';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Največ 10 MB. Najmanj: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Barva poudarka';

  @override
  String get accentColorDescription =>
      'Prilagodi barvo obrobe in pasice na vašem profilu';

  @override
  String get aboutMeLabel => 'O meni';

  @override
  String get aboutMeHelperText =>
      'Lahko uporabljate povezave, emojije in Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Zasebnost znaka Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Nadzorujte, kako je vaš znak Plutonium prikazan drugim';

  @override
  String get hidePlutoniumBadgeLabel => 'Popolnoma skrij znak Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Popolnoma skrijte svoj znak Plutonium pred drugimi uporabniki';

  @override
  String get hidePlutoniumPurchaseDate => 'Skrij datum nakupa Plutoniuma';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Skrij datum nakupa Plutoniuma ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Odstrani datum prvega nakupa Plutoniuma s svojega znaka';

  @override
  String get maskVisionaryAsSubscription => 'Prikaži Visionary kot naročnino';

  @override
  String get maskVisionaryDescription =>
      'Prikaži svoj Visionary kot običajno naročnino';

  @override
  String get hideVisionaryIdBadge => 'Skrij znak ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Skrij znak ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Odstrani svoj znak ID Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Trenutno ste v preizkusni dobi Plutoniuma – vaša naročnina se začne $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Vaša naročnina se bo samodejno začela, ko se vaša preizkusna doba izteče. Ni potrebno ukrepanje.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Trenutno ste v preizkusni dobi Plutoniuma, ki se izteče $date';
  }

  @override
  String get premiumTrialActiveProfile =>
      'Trenutno ste v preizkusni dobi Plutoniuma';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Največ 10 MB. Priporočeno: 512×512px. Animiran avatar (GIF) zahteva Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Prilagodite svoj profil s statično ali animirano sliko pasice, da bo izstopal.';

  @override
  String get getPlutonium => 'Pridobi Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Nakupi v aplikaciji na tej platformi še niso na voljo. Bodite pozorni – kmalu prihaja!';

  @override
  String get profilePreviewLabel => 'Predogled';

  @override
  String get profilePreviewMessage => 'Sporočilo';

  @override
  String get profilePreviewMemberSince => 'Član Fluxerja od';

  @override
  String get unclaimedAccountTitle => 'Nezahtevan račun';

  @override
  String get unclaimedAccountDescription =>
      'Vaš račun še ni bil potrjen. Brez e-pošte in gesla lahko izgubite dostop. Potrdite svoj račun zdaj, da ga zavarujete.';

  @override
  String get claimAccount => 'Potrdi račun';

  @override
  String get profileTypeLabel => 'Vrsta profila';

  @override
  String get profileTypeGlobal => 'Globalni profil';

  @override
  String get profileTypeGuildDescription =>
      'Urejate svoj profil za posamezno skupnost. Ta profil bo viden samo v tej skupnosti in bo nadomestil vaš globalni profil.';

  @override
  String get communityNicknameLabel => 'Vzdevek skupnosti';

  @override
  String get perGuildPremiumUpsellText =>
      'Prilagajanje vašega avatarja, pasice, barve poudarka in biografije za posamezne skupnosti zahteva Plutonij. Vzdevek skupnosti in zaimki so brezplačni za vse.';

  @override
  String get avatarModeInherit => 'Uporabi globalni profil';

  @override
  String get avatarModeCustom => 'Uporabi sliko po meri';

  @override
  String get avatarModeUnset => 'Ne prikaži';

  @override
  String get profileSavedToast => 'Profil posodobljen';

  @override
  String get profileEditButton => 'Uredi profil';

  @override
  String get profileNoteLabel => 'Opomba';

  @override
  String get profileNoteVisibility => '(vidno samo vam)';

  @override
  String get profileNoteEmpty => 'Še ni opombe.';

  @override
  String get sudoTitle => 'Preveri svojo identiteto';

  @override
  String get sudoDescription =>
      'To dejanje zahteva preverjanje za nadaljevanje.';

  @override
  String get sudoAuthenticatorCode => 'Koda avtentikatorja';

  @override
  String get sudoMethodPassword => 'Geslo';

  @override
  String get sudoMethodTotp => 'Avtentikator';

  @override
  String get sudoVerificationFailed =>
      'Preverjanje ni uspelo. Poskusite znova.';

  @override
  String get securityAccountTitle => 'Račun';

  @override
  String get securityAccountDescription =>
      'Upravljajte svoj e-poštni naslov, geslo in nastavitve računa';

  @override
  String get securitySectionTitle => 'Varnost';

  @override
  String get securitySectionDescription =>
      'Zaščitite svoj račun z dvofaktorsko avtentikacijo in gesli';

  @override
  String get securityLoginEmailSectionTitle => 'Nastavitve e-pošte';

  @override
  String get securityLoginEmailSectionDescription =>
      'Upravljajte e-poštni naslov, ki ga uporabljate za prijavo v Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'E-poštni naslov';

  @override
  String get securityLoginNoEmailSet => 'Ni nastavljenega e-poštnega naslova';

  @override
  String get securityLoginChangeEmail => 'Spremeni e-pošto';

  @override
  String get securityLoginAddEmail => 'Dodaj e-pošto';

  @override
  String get securityLoginReveal => 'Razkrij';

  @override
  String get securityLoginHide => 'Skrij';

  @override
  String get securityLoginPasswordSectionTitle => 'Geslo';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Spremenite svoje geslo, da bo vaš račun varen';

  @override
  String get securityLoginCurrentPasswordLabel => 'Trenutno geslo';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Zadnja sprememba: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Zadnja sprememba: Nikoli';

  @override
  String get securityLoginNoPasswordSet => 'Ni nastavljenega gesla';

  @override
  String get securityLoginChangePassword => 'Spremeni geslo';

  @override
  String get securityLoginSetPassword => 'Nastavi geslo';

  @override
  String get passwordChangeTitle => 'Spremeni geslo';

  @override
  String get passwordChangeIntroDescription =>
      'Poslali vam bomo potrditveno kodo na vaš e-poštni naslov, da potrdimo vašo identiteto, preden spremenite geslo.';

  @override
  String get passwordChangeStart => 'Začni';

  @override
  String get passwordChangeVerifyTitle => 'Preveri svoj e-poštni naslov';

  @override
  String get passwordChangeVerifyDescription =>
      'Vnesite potrditveno kodo, poslano na vaš e-poštni naslov.';

  @override
  String get passwordChangeVerificationCode => 'Potrditvena koda';

  @override
  String get passwordChangeVerify => 'Preveri';

  @override
  String get passwordChangeNewPasswordTitle => 'Nastavi novo geslo';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Spodaj vnesite novo geslo.';

  @override
  String get passwordChangeNewPassword => 'Novo geslo';

  @override
  String get passwordChangeConfirmPassword => 'Potrdi novo geslo';

  @override
  String get passwordChangeSubmit => 'Spremeni geslo';

  @override
  String get passwordChangeSuccess => 'Geslo spremenjeno';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Gesli se ne ujemata';

  @override
  String get passwordChangeInvalidCode => 'Neveljavna ali potekla koda';

  @override
  String get emailChangeTitle => 'Spremeni e-pošto';

  @override
  String get emailChangeIntroDescription =>
      'Preden spremenite svoj e-poštni naslov, vam bomo poslali kode za preverjanje vaše identitete.';

  @override
  String get emailChangeStart => 'Začni';

  @override
  String get emailChangeVerifyOriginalTitle => 'Preveri trenutno e-pošto';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Vnesite kodo za preverjanje, poslano na vaš trenutni e-poštni naslov.';

  @override
  String get emailChangeNewEmailTitle => 'Vnesi nov e-poštni naslov';

  @override
  String get emailChangeNewEmailDescription =>
      'Vnesite nov e-poštni naslov, ki ga želite uporabiti.';

  @override
  String get emailChangeNewEmailLabel => 'Nov e-poštni naslov';

  @override
  String get emailChangeNewEmailSubmit => 'Pošlji kodo za preverjanje';

  @override
  String get emailChangeVerifyNewTitle => 'Preveri nov e-poštni naslov';

  @override
  String get emailChangeVerifyNewDescription =>
      'Vnesite kodo za preverjanje, poslano na vaš nov e-poštni naslov.';

  @override
  String get emailChangeSuccess => 'E-pošta spremenjena';

  @override
  String get emailChangeInvalidCode => 'Neveljavna ali potekla koda';

  @override
  String get resend => 'Ponovno pošlji';

  @override
  String resendCountdown(int seconds) {
    return 'Ponovno pošlji (${seconds}s)';
  }

  @override
  String get verificationCode => 'Koda za preverjanje';

  @override
  String get verify => 'Preveri';

  @override
  String get enable => 'Omogoči';

  @override
  String get disable => 'Onemogoči';

  @override
  String get delete => 'Izbriši';

  @override
  String get save => 'Shrani';

  @override
  String get securityTfaSectionTitle => 'Dvo-faktorska avtentikacija';

  @override
  String get securityTfaSectionDescription =>
      'Dodajte dodatno plast varnosti svojemu računu';

  @override
  String get securityTfaAuthenticatorApp => 'Aplikacija za avtentikacijo';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Dvo-faktorska avtentikacija je omogočena';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Uporabite aplikacijo za avtentikacijo za ustvarjanje kod za dvo-faktorsko avtentikacijo';

  @override
  String get securityTfaBackupCodes => 'Rezervne kode';

  @override
  String get securityTfaBackupCodesDescription =>
      'Ogled in upravljanje vaših rezervnih kod za obnovitev računa';

  @override
  String get securityTfaViewCodes => 'Ogled kod';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Uporabite passkeys za prijavo brez gesla in dvo-faktorsko avtentikacijo';

  @override
  String get securityPasskeysRegistered => 'Registrirani passkeys';

  @override
  String get securityPasskeysNone => 'Ni registriranih passkeys';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$count $_temp0 registriranih (največ 10)';
  }

  @override
  String get securityPasskeysAdd => 'Dodaj passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'Dodano: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Zadnja uporaba: $date';
  }

  @override
  String get securityPasskeysRename => 'Preimenuj';

  @override
  String get securityPasskeysDeleteTitle => 'Izbriši passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Ali ste prepričani, da želite izbrisati passkey \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Ime passkey-a';

  @override
  String get securityPasskeyNameLabel => 'Ime passkey-a';

  @override
  String get securityPasskeyNameHint =>
      'npr. YubiKey, iPhone, delovni računalnik';

  @override
  String get securityPhoneSectionTitle => 'Telefonska številka';

  @override
  String get securityPhoneSectionDescription =>
      'Upravljajte svojo telefonsko številko.';

  @override
  String get securityPhoneLabel => 'Telefonska številka';

  @override
  String get securityPhoneNone => 'Ni dodane telefonske številke.';

  @override
  String get securityPhoneAdd => 'Dodaj telefon';

  @override
  String get securityPhoneRemove => 'Odstrani';

  @override
  String get securityPhoneRemoveTitle => 'Odstrani telefonsko številko';

  @override
  String get securityPhoneRemoveDescription =>
      'Ali ste prepričani, da želite odstraniti svojo telefonsko številko?';

  @override
  String get securityPhoneRemoved => 'Telefonska številka odstranjena';

  @override
  String get securityClaimTitle => 'Varnostne funkcije';

  @override
  String get securityClaimDescription =>
      'Zahtevajte svoj račun, da dostopate do varnostnih funkcij, kot sta dvofaktorska avtentikacija in gesla.';

  @override
  String get securityVerifyEmailRequired =>
      'Preden lahko nastavite dvofaktorsko avtentikacijo, gesla ali SMS-preverjanje, morate potrditi svoj e-poštni naslov.';

  @override
  String get totpEnableTitle => 'Nastavitev aplikacije za avtentikacijo';

  @override
  String get totpEnableDescription =>
      'Skenirajte kodo QR z aplikacijo za avtentikacijo, da ustvarite kode za dvofaktorsko avtentikacijo.';

  @override
  String get totpEnableCodeLabel => 'Koda';

  @override
  String get totpEnableCodeHint =>
      'Vnesite 6-mestno kodo iz svoje aplikacije za avtentikacijo';

  @override
  String get totpEnableSuccess => 'Dvofaktorska avtentikacija je omogočena';

  @override
  String get totpDisableTitle => 'Odstrani aplikacijo za avtentikacijo';

  @override
  String get totpDisableDescription =>
      'Vnesite 6-mestno kodo iz svoje aplikacije za avtentikacijo, da onemogočite dvofaktorsko avtentikacijo.';

  @override
  String get totpDisableSuccess => 'Dvofaktorska avtentikacija onemogočena';

  @override
  String get backupCodesTitle => 'Rezervne kode';

  @override
  String get backupCodesWarning =>
      'Če izgubite dostop do svoje aplikacije za avtentikacijo in nimate teh kod, boste trajno izgubili dostop do svojega računa. Prenesite ali kopirajte jih zdaj in jih shranite na varno mesto.';

  @override
  String get backupCodesDownload => 'Prenesi';

  @override
  String get backupCodesCopy => 'Kopiraj';

  @override
  String get backupCodesCopied => 'Rezervne kode kopirane v odložišče';

  @override
  String get backupCodesAcknowledge =>
      'Prenesel/a sem ali kopiral/a svoje rezervne kode in jih shranil/a na varno mesto.';

  @override
  String get backupCodesDone => 'Končano';

  @override
  String get backupCodesViewTitle => 'Prikaži rezervne kode';

  @override
  String get backupCodesViewDescription =>
      'Preden si lahko ogledate svoje rezervne kode, bo morda potrebno preverjanje.';

  @override
  String get phoneAddTitle => 'Dodaj telefonsko številko';

  @override
  String get phoneAddLabel => 'Telefonska številka';

  @override
  String get phoneAddHint => 'Vnesite svojo telefonsko številko';

  @override
  String get phoneAddFooter =>
      'Vnesite svojo telefonsko številko. Poslali vam bomo potrditveno kodo preko SMS-a.';

  @override
  String get phoneAddSendCode => 'Pošlji kodo';

  @override
  String get phoneVerifyTitle => 'Preveri telefonsko številko';

  @override
  String get phoneVerifyDescription =>
      'Vnesite potrditveno kodo, poslano na vašo telefonsko številko.';

  @override
  String get phoneAddSuccess => 'Telefonska številka dodana';

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
  String get dangerZoneSectionTitle => 'Nevarna cona';

  @override
  String get dangerZoneSectionDescription => 'Nepovratna in uničujoča dejanja';

  @override
  String get dangerZoneDisableTitle => 'Onemogoči račun';

  @override
  String get dangerZoneDisableDescription =>
      'Začasno onemogočite svoj račun. Lahko ga ponovno aktivirate pozneje s ponovno prijavo.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Onemogočanje vašega računa vas bo odjavilo iz vseh sej. Svoj račun lahko kadar koli ponovno omogočite s ponovno prijavo.';

  @override
  String get dangerZoneDeleteTitle => 'Izbriši račun';

  @override
  String get dangerZoneDeleteDescription =>
      'Trajno izbrišite svoj račun in vse povezane podatke. Tega dejanja ni mogoče razveljaviti.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Pred brisanjem računa prekličite svojo aktivno naročnino na Plutonium v nastavitvah Plutoniuma.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Ne morem izbrisati računa';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Ne morete izbrisati svojega računa, medtem ko ste lastnik skupnosti. Najprej prenesite lastništvo naslednjih skupnosti:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'in še $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Če želite prenesti lastništvo, pojdite na $settingsPath in uporabite možnost prenosa lastništva.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Ali ste prepričani, da želite izbrisati svoj račun? To dejanje bo načrtovalo trajno brisanje vašega računa.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Postopek brisanja lahko prekličete v 14 dneh';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Po 14 dneh bo vaš račun trajno izbrisan';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Ko je brisanje obdelano, ne boste mogli več povrniti dostopa do svojega računa';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Po izbrisu računa ne boste mogli izbrisati svojih poslanih sporočil';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Če želite izvoziti svoje podatke ali najprej izbrisati svoja sporočila, obiščite razdelek Nadzorna plošča za zasebnost v Nastavitvah uporabnika, preden nadaljujete.';

  @override
  String get claimAccountTitle => 'Zahtevaj svoj račun';

  @override
  String get claimAccountDescription =>
      'Zahtevajte svoj račun z dodajanjem e-pošte in gesla. Pred dokončanjem vam bomo poslali potrditveno kodo za potrditev vaše e-pošte.';

  @override
  String get claimAccountEmailLabel => 'E-pošta';

  @override
  String get claimAccountPasswordLabel => 'Geslo';

  @override
  String get claimAccountSendCode => 'Pošlji kodo';

  @override
  String get claimAccountVerifyDescription =>
      'Vnesite kodo, ki smo vam jo poslali na vaš e-poštni naslov, da jo potrdite. Vaše geslo bo nastavljeno, ko bo koda potrjena.';

  @override
  String get claimAccountSuccess => 'Račun uspešno prevzet';

  @override
  String get importantInformation => 'Pomembne informacije:';

  @override
  String get genericError => 'Prišlo je do napake';

  @override
  String get invalidCode => 'Neveljavna koda';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count leti',
      one: 'pred 1 letom',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count meseci',
      one: 'pred 1 mesecem',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count dnevi',
      one: 'pred 1 dnevom',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count urami',
      one: 'pred 1 uro',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count minutami',
      one: 'pred 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'pravkar';

  @override
  String get authorizedAppsTitle => 'Pooblaščene aplikacije';

  @override
  String get authorizedAppsDescription =>
      'Tem aplikacijam je bil odobren dostop do vašega računa Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Ni pooblaščenih aplikacij';

  @override
  String get authorizedAppsEmptyDescription =>
      'Niste pooblastili nobene aplikacije za dostop do vašega računa.';

  @override
  String get authorizedAppsLoadError =>
      'Napaka pri nalaganju pooblaščenih aplikacij';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Pooblaščeno ob $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Dodeljena dovoljenja';

  @override
  String get authorizedAppsRevoke => 'Prekliči';

  @override
  String get authorizedAppsRevokeTitle => 'Prekliči dostop aplikacije';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Ali ste prepričani, da želite preklicati dostop za $appName? Ta aplikacija ne bo več imela dostopa do vašega računa.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Dostop do vaših osnovnih podatkov profila (uporabniško ime, avatar itd.)';

  @override
  String get authorizedAppsScopeEmail => 'Ogled vašega e-poštnega naslova';

  @override
  String get authorizedAppsScopeGuilds => 'Ogled skupnosti, katerih član ste';

  @override
  String get authorizedAppsScopeConnections => 'Ogled vaših povezanih računov';

  @override
  String get authorizedAppsScopeBot =>
      'Dodaj bota v skupnost z zahtevanimi dovoljenji';

  @override
  String get authorizedAppsScopeAdmin => 'Dostop do skrbniških končnih točk';

  @override
  String get privacyPendingDeletionTitle => 'Čaka na brisanje';

  @override
  String get blockedUsersTitle => 'Blokirani uporabniki';

  @override
  String get blockedUsersDescription =>
      'Blokirani uporabniki vam ne morejo pošiljati prošenj za prijateljstvo ali vas neposredno sporočati.';

  @override
  String get blockedUsersEmptyTitle => 'Ni blokiranih uporabnikov';

  @override
  String get blockedUsersEmptyDescription => 'Še niste nikogar blokirali.';

  @override
  String get blockedUsersLoadError =>
      'Napaka pri nalaganju blokiranih uporabnikov';

  @override
  String get blockedUsersUnblock => 'Odblokiraj';

  @override
  String get blockedUsersUnblockTitle => 'Odblokiraj uporabnika';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Ali ste prepričani, da želite odblokirati $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopiraj FluxerTag';

  @override
  String get blockedUsersCopyId => 'Kopiraj ID uporabnika';

  @override
  String get userProfileLoadError => 'Profila ni bilo mogoče naložiti';

  @override
  String get userProfileRetry => 'Ponovi';

  @override
  String get userProfileMessage => 'Sporočilo';

  @override
  String get userProfileVoiceCall => 'Glasovni klic';

  @override
  String get userProfileVideoCall => 'Video klic';

  @override
  String get userProfileEditProfile => 'Uredi profil';

  @override
  String get userProfileStaffBadgeTooltip => 'Osebje Fluxerja';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Community Team';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Lovilec hroščev Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Naročnik Fluxer Plutonium od $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Vizionar Fluxer';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Vizionar Fluxer od $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID vizionarja #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Skupni prijatelji ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Skupne skupnosti ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Skupni prijatelji';

  @override
  String get userProfileMutualCommunitiesTitle => 'Skupne skupnosti';

  @override
  String get userProfileNoMutualFriends => 'Ni najdenih skupnih prijateljev.';

  @override
  String get userProfileNoMutualCommunities => 'Ni najdenih skupnih skupnosti.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Vzdevek: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Odpri DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Blokirali ste $username. Ne boste mogli pošiljati sporočil, dokler jih ne odblokirate.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Odblokiraj';

  @override
  String get userProfileOpenDm => 'Odpri DM';

  @override
  String get userProfileNoteTitle => 'Opomba';

  @override
  String get userProfileNoteVisibility => '(vidno samo vam)';

  @override
  String get userProfileNoteSave => 'Shrani';

  @override
  String get userProfileNoteDelete => 'Izbriši';

  @override
  String get userProfileNoteEmpty => 'Kliknite za dodajanje opombe';

  @override
  String get userProfileMemberSince => 'Član od';

  @override
  String get userProfileAboutMe => 'O meni';

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
  String get userProfileCopyUsername => 'Kopiraj uporabniško ime';

  @override
  String get userProfileCopyUserId => 'Kopiraj ID uporabnika';

  @override
  String get userProfileViewMainProfile => 'Prikaži glavni profil';

  @override
  String get userProfileViewCommunityProfile => 'Prikaži profil skupnosti';

  @override
  String get userProfileBlockUser => 'Blokiraj uporabnika';

  @override
  String get userProfileUnblockUser => 'Odblokiraj uporabnika';

  @override
  String get userProfileRemoveFriend => 'Odstrani prijatelja';

  @override
  String get userProfileBlockConfirmTitle => 'Blokiraj uporabnika';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Ali ste prepričani, da želite blokirati $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Odblokiraj uporabnika';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Ali ste prepričani, da želite odblokirati $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Odstrani prijatelja';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Ali ste prepričani, da želite odstraniti $username kot prijatelja?';
  }

  @override
  String get userProfileFailedOpenDm => 'DM se ni uspel odpreti';

  @override
  String get userProfileFailedSaveNote => 'Opombe ni bilo mogoče shraniti';

  @override
  String get userProfileActionFailed => 'Dejanje ni uspelo, poskusite znova';

  @override
  String get userProfileChangeNickname => 'Spremeni vzdevek';

  @override
  String get userProfileKick => 'Odstrani';

  @override
  String get userProfileBan => 'Prepovej';

  @override
  String get userProfileTimeout => 'Časovni izklop';

  @override
  String get userProfileRemoveTimeout => 'Odstrani časovni izklop';

  @override
  String get userProfileTransferOwnership => 'Prenesi lastništvo';

  @override
  String get userProfileReportUser => 'Prijavi uporabnika';

  @override
  String get userProfileReportMessage => 'Prijavi sporočilo';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Odstrani $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Ali ste prepričani, da želite odstraniti $username? Lahko se ponovno pridruži z novim povabilom.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle =>
      'Odstraniš časovno omejitev?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Odstranitev časovne omejitve bo $username omogočila ponovno pošiljanje sporočil, reagiranje in pridruževanje glasovnim kanalom.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Preneseš lastništvo?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Preneseš lastništvo te skupnosti na $username? To je nepovratno in izgubil/a boš vse lastniške pravice.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Prepovej $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Trajanje prepovedi';

  @override
  String get userProfileBanCustomSecondsLabel => 'Obdobje po meri (sekunde)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Katera koli vrednost od $min do $max sekund';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Izbriši zgodovino sporočil';

  @override
  String get userProfileBanDeleteNone => 'Ne izbriši ničesar';

  @override
  String get userProfileBanDelete24h => 'Preteklih 24 ur';

  @override
  String get userProfileBanDelete7d => 'Preteklih 7 dni';

  @override
  String get userProfileBanReasonLabel => 'Razlog (neobvezno)';

  @override
  String get userProfileBanReasonHint => 'Vnesi razlog za prepoved';

  @override
  String get userProfileBanSubmit => 'Prepovej člana';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Časovni omejitvi za $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Trajanje časovne omejitve';

  @override
  String get userProfileTimeoutSubmit => 'Časovni omejitvi člana';

  @override
  String get userProfileNicknameLabel => 'Vzdevek';

  @override
  String get userProfileNicknameHint => 'Vnesi vzdevek';

  @override
  String get userProfileNicknameSave => 'Shrani';

  @override
  String userProfileKickSuccess(String username) {
    return 'Izvrgel/a si $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Prepovedal/a si $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Časovni omejitvi za $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Odstranjena časovna omejitev za $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Vzdevek posodobljen';

  @override
  String get userProfileTransferSuccess => 'Lastništvo preneseno';

  @override
  String get durationPermanent => 'Trajno';

  @override
  String get duration60Seconds => '60 sekund';

  @override
  String get duration5Minutes => '5 minut';

  @override
  String get duration10Minutes => '10 minut';

  @override
  String get duration1Hour => '1 ura';

  @override
  String get duration12Hours => '12 ur';

  @override
  String get duration1Day => '1 dan';

  @override
  String get duration3Days => '3 dni';

  @override
  String get duration5Days => '5 dni';

  @override
  String get duration1Week => '1 teden';

  @override
  String get duration2Weeks => '2 tedna';

  @override
  String get duration1Month => '1 mesec';

  @override
  String get durationCustom => 'Po meri…';

  @override
  String get iarReportUserTitle => 'Prijavi uporabnika';

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
  String get iarReasonInappropriateProfile => 'Neprimeren profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Ta uporabniški profil vsebuje neprimerno vsebino';

  @override
  String typingIndicatorOne(String name) {
    return 'Uporabnik $name piše...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Uporabnika $name1 in $name2 pišeta...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Uporabniki $name1, $name2 in $name3 pišejo...';
  }

  @override
  String get typingIndicatorMultiple => 'Več oseb piše...';

  @override
  String get typingIndicatorHandful =>
      'Zbrala se je peščica pisalnih navdušencev...';

  @override
  String get typingIndicatorSymphony => 'V teku je simfonija klikanja tipk...';

  @override
  String get typingIndicatorFiesta => 'Tu poteka prava pisalna fiesta';

  @override
  String get typingIndicatorApocalypse => 'Norih, to je apokalipsa tipkanja';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Veseli smo, da si tukaj, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Dobrodošel, $username! Počuti se kot doma.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Zdravo, $username! Veseli smo, da si tukaj.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Zdravo, $username! Pridruži se, ko boš pripravljen.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hej $username, veseli smo, da te vidimo tukaj!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hej, $username! Upamo, da boš užival/a v bivanju.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hej, $username, dobrodošel/šla na krov!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Veseli, da si prispel/a, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Dobrodošel/šla, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Dobrodošel, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Dobrodošel, $username! Veseli smo, da si tukaj.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Dobrodošel, $username! Upamo, da boš užival/a v času tukaj.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Dobrodošel, $username! Tvoj naslednji pogovor se začne tukaj.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Dobrodošel, $username. Veseli smo, da si z nami.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Lepo te je videti, $username! Dobrodošel/šla.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Tukaj si, $username! Lepo, da si z nami.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Pravkar si prispel/a, $username! Začnimo.';
  }

  @override
  String get relativeTimeShortNow => 'zdaj';

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
      other: '${count}m',
      one: '1m',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}l',
      one: '1l',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Moje naprave';

  @override
  String get linkedDevicesDescription =>
      'Ogledate si lahko vse naprave, ki so trenutno prijavljene v vaš račun. Prekličite vse seje, ki jih ne prepoznate.';

  @override
  String get linkedDevicesCurrentDevice => 'Trenutna naprava';

  @override
  String get linkedDevicesOtherDevices => 'Druge naprave';

  @override
  String get linkedDevicesEnterSelection => 'Vstopi v način izbire';

  @override
  String get linkedDevicesExitSelection => 'Izhod iz načina izbire';

  @override
  String get linkedDevicesSelectAll => 'Izberi vse';

  @override
  String get linkedDevicesClearSelection => 'Počisti izbiro';

  @override
  String get linkedDevicesRevokeTooltip => 'Prekliči napravo';

  @override
  String get linkedDevicesSignOutAll => 'Odjavi vse druge naprave';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odjavi $count naprav',
      one: 'Odjavi 1 napravo',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odjavi $count naprav',
      one: 'Odjavi 1 napravo',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Odjavi vse druge naprave';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'To bo odjavilo izbrane naprave iz vašega računa. Na teh napravah se boste morali ponovno prijaviti.',
      one:
          'To bo odjavilo izbrano napravo iz vašega računa. Na tej napravi se boste morali ponovno prijaviti.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'To odjaviti izbrane naprave iz vašega računa. Na teh napravah se boste morali ponovno prijaviti.';

  @override
  String get linkedDevicesSignOutConfirm => 'Nadaljuj';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Na vseh odjavljenih napravah se boste morali ponovno prijaviti';

  @override
  String get linkedDevicesLoadErrorTitle => 'Omrežna napaka';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Imamo težave s povezovanjem s prostorom in časom. Preverite svojo povezavo in poskusite znova.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Naprave odjavljene',
      one: 'Naprava odjavljena',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Ni se mogoče odjaviti. Poskusite znova.';

  @override
  String get linkedDevicesUnknownOs => 'Neznan OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Neznana platforma';

  @override
  String slowmodeLabel(String duration) {
    return 'Počasni način $duration';
  }

  @override
  String get slowmodeTooltipActive =>
      'Ste v počasnem načinu. Počakajte, preden pošljete drugo sporočilo.';

  @override
  String get slowmodeTooltipImmune =>
      'Počasni način je omogočen, vendar ste izvzeti.';

  @override
  String get channelNoSendPermissionHint =>
      'V tem kanalu ne morete pošiljati sporočil.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Sistemske objave osebja $productName. Tukaj ne morete odgovoriti.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Pošiljanje sporočil je začasno ustavljeno v tej skupnosti.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Časovna omejitev je potekla. Pošiljanje sporočil, reakcije in glas so ustavljeni do izteka časovne omejitve.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Morate prevzeti svoj račun, da lahko pošiljate sporočila v tej skupnosti.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Morate potrditi svoj e-poštni naslov, da lahko pošiljate sporočila v tej skupnosti.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Vaš račun je pre nov za pošiljanje sporočil v tej skupnosti.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Niste dovolj dolgo član te skupnosti, da bi lahko pošiljali sporočila.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Morate potrditi telefonsko številko, da lahko pošiljate sporočila v tej skupnosti.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Potrdi e-pošto';

  @override
  String get channelComposerBarrierVerifyPhone => 'Potrdi telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Preveč prilog (največ $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Ena ali več datotek presega velikostno omejitev';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Te datoteke so prevelike za skupno pošiljanje';

  @override
  String get chatAttachmentDropToUpload => 'Spustite datoteke za nalaganje';

  @override
  String get chatAttachmentDropToSend =>
      'Spustite datoteke za takojšnje pošiljanje';

  @override
  String get chatAttachmentSendVoiceMessage => 'Pošlji glasovno sporočilo';

  @override
  String get voiceMessageTitle => 'Glasovno sporočilo';

  @override
  String get voiceMessageHoldHint =>
      'Držite za snemanje. Povlecite navzgor za zaklepanje ali spustite za pošiljanje.';

  @override
  String get voiceMessageDiscard => 'Zavrzi glasovno sporočilo';

  @override
  String get voiceMessageSend => 'Pošlji glasovno sporočilo';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Snemanje ni mogoče začeti. Dovolite dostop do mikrofona.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Snemanje glasu ni podprto na tej napravi.';

  @override
  String get voiceMessageMicInUse =>
      'Zapustite glasovni klic, da posnamete glasovno sporočilo.';

  @override
  String get voiceMessageRecordingFailed =>
      'Snemanje je spodletelo. Poskusite znova.';

  @override
  String get voiceMessageSendFailed =>
      'Glasovno sporočilo ni mogoče poslati. Poskusite znova.';

  @override
  String get voiceMessageRecordingHint =>
      'Govorite zdaj. Ko končate, pritisnite Stop – pozneje lahko obrežete.';

  @override
  String get voiceMessageReviewHint =>
      'Povlecite ročice za obrezovanje, nato pritisnite Pošlji.';

  @override
  String get voiceMessageStop => 'Ustavi';

  @override
  String get voiceMessageStartRecording => 'Začni snemanje';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Predvajaj';

  @override
  String get voiceMessagePause => 'Zaustavi';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Izbor mora biti dolg vsaj ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Uredi prilogo';

  @override
  String get chatAttachmentFilenameLabel => 'Ime datoteke';

  @override
  String get chatAttachmentDescriptionLabel => 'Opis';

  @override
  String get chatAttachmentDescriptionHint => 'Neobvezno nadomestno besedilo';

  @override
  String get chatAttachmentSpoilerLabel => 'Označite kot spojler';

  @override
  String get chatAttachmentRemove => 'Odstrani prilogo';

  @override
  String get chatAttachmentDownload => 'Prenesi';

  @override
  String get chatAttachmentExpiredTooltip => 'Priloga je potekla';

  @override
  String get chatAttachmentSourceGallery => 'Galerija';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Prebrskaj datoteke';

  @override
  String get chatAttachmentPasteTooltip => 'Prilepi sliko iz odložišča';

  @override
  String get chatAttachmentSpoiler => 'Spojler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Razkrij spojler';

  @override
  String get matureMediaRevealButton => 'Razkrij';

  @override
  String get matureMediaRevealHint => 'Kliknite za razkritje';

  @override
  String get matureContentTitle => 'Vsebina za odrasle';

  @override
  String get matureCommunityTitle => 'Zrela skupnost';

  @override
  String get matureCategoryTitle => 'Zrela kategorija';

  @override
  String get matureChannelTitle => 'Zrelo sporočilo';

  @override
  String get communityContentWarningTitle => 'Opozorilo na vsebino skupnosti';

  @override
  String get categoryContentWarningTitle => 'Opozorilo na vsebino kategorije';

  @override
  String get channelContentWarningTitle => 'Opozorilo na vsebino sporočila';

  @override
  String get defaultContentWarningBody => 'To vsebuje občutljivo vsebino.';

  @override
  String get matureCommunityBody =>
      'Ta skupnost je označena kot primerna za odrasle in lahko vsebuje gradivo, ki morda ni primerno za nekatere uporabnike.';

  @override
  String get matureCategoryBody =>
      'Ta kategorija je označena kot primerna za odrasle in lahko vsebuje gradivo, ki morda ni primerno za nekatere uporabnike.';

  @override
  String get matureChannelBody =>
      'To sporočilo je označeno kot primerno za odrasle in lahko vsebuje gradivo, ki morda ni primerno za nekatere uporabnike.';

  @override
  String get matureVoiceChannelBody =>
      'Ta glasovno sporočilo je označeno kot primerno za odrasle in lahko vsebuje gradivo, ki morda ni primerno za nekatere uporabnike.';

  @override
  String get matureLinkChannelBody =>
      'To povezovalno sporočilo je označeno kot primerno za odrasle in lahko odpira gradivo, ki morda ni primerno za nekatere uporabnike.';

  @override
  String get matureCommunityUnavailableBody =>
      'Ta zrela skupnost ni na voljo vašemu računu.';

  @override
  String get matureCategoryUnavailableBody =>
      'Ta zrela kategorija ni na voljo vašemu računu.';

  @override
  String get matureChannelUnavailableBody =>
      'To zrelo sporočilo ni na voljo vašemu računu.';

  @override
  String get matureContentProceedButton => 'Nadaljuj';

  @override
  String get matureContentUnderstandButton => 'Razumem';

  @override
  String get matureContentOpenLinkButton => 'Odpri povezavo';

  @override
  String get sensitiveContentSectionTitle => 'Občutljiva vsebina';

  @override
  String get sensitiveContentSectionDescription =>
      'Nadzorujte, kako se zrešnja ali občutljiva predstavnost filtrira v različnih kontekstih';

  @override
  String get sensitiveContentFriendDmLabel =>
      'Neposredna sporočila od prijateljev';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Neposredna sporočila od drugih';

  @override
  String get sensitiveContentGuildLabel => 'Sporočila v kanalih skupnosti';

  @override
  String get sensitiveContentFilterShow => 'Prikaži';

  @override
  String get sensitiveContentFilterBlur => 'Zamegli';

  @override
  String get sensitiveContentFilterBlock => 'Blokiraj';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Zamegli predstavnost do zaključka varnostnega skeniranja';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Ko je omogočeno, se slike in videoposnetki zameglijo, dokler se ne konča skeniranje varnosti vsebine.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Ta nastavitev je za vaš račun vedno vklopljena.';

  @override
  String get sensitiveContentResetButton => 'Ponastavi';

  @override
  String get sensitiveContentSaveButton => 'Shrani';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count datotek',
      one: '1 datoteke',
    );
    return 'Nalaganje $_temp0';
  }

  @override
  String get chatCancelUpload => 'Prekliči nalaganje';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Poteče $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Poteče med $start in $end';
  }

  @override
  String get connectionsTitle => 'Povezave';

  @override
  String get connectionsDescription =>
      'Povežite zunanje račune in domene z vašim profilom Fluxer. Preverjene povezave bodo prikazane v vašem profilu, da jih bodo drugi videli.';

  @override
  String get connectionsEmptyTitle => 'Še ni povezav';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Povežite svoj račun Bluesky ali preverite lastništvo domene, da jih prikažete v svojem profilu.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Preverite lastništvo domene, da jo prikažete v svojem profilu.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domena';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Dodaj povezavo Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Dodaj povezavo domene';

  @override
  String get connectionEdit => 'Uredi';

  @override
  String get connectionRemove => 'Odstrani';

  @override
  String get connectionVerifiedLabel => 'Ta povezava je bila preverjena.';

  @override
  String get connectionUnverifiedLabel => 'Ta povezava ni bila preverjena.';

  @override
  String get connectionAddTitle => 'Dodaj povezavo';

  @override
  String get connectionTypeLabel => 'Vrsta povezave';

  @override
  String get connectionHandleLabel => 'Ročaj';

  @override
  String get connectionDomainLabel => 'Domena';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'To povezavo že imate.';

  @override
  String get connectionConnectBluesky => 'Poveži z Bluesky';

  @override
  String get connectionContinue => 'Nadaljuj';

  @override
  String get connectionVerifyTitle => 'Preveri povezavo';

  @override
  String get connectionVerifyInstructions =>
      'Uporabite zapis spodaj, da dokažete lastništvo domene.';

  @override
  String get connectionDnsRecordTitle => 'DNS zapis TXT';

  @override
  String get connectionDnsHostLabel => 'Gostitelj';

  @override
  String get connectionDnsValueLabel => 'Vrednost';

  @override
  String get connectionCopyHost => 'Kopiraj gostitelja';

  @override
  String get connectionCopyValue => 'Kopiraj vrednost';

  @override
  String get connectionCopied => 'Kopirano!';

  @override
  String get connectionTokenFileTitle => 'Postrezi datoteko s potrdilom';

  @override
  String get connectionTokenFileDescription =>
      'Prenesite **fluxer-verification** in jo postavite v mapo **.well-known**, da bomo lahko potrdili domeno.';

  @override
  String get connectionTokenFileDownload => 'Prenesi fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Datoteka vsebuje potrdilo, ki ga bomo pridobili iz **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Shrani fluxer-verification';

  @override
  String get connectionVerifyButton => 'Preveri';

  @override
  String get connectionBack => 'Nazaj';

  @override
  String get connectionEditTitle => 'Uredi povezavo';

  @override
  String get connectionEditDescription =>
      'Izberite, kdo lahko vidi to povezavo na vašem profilu.';

  @override
  String get connectionVisibilityEveryone => 'Vsi';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Dovoli vsem, da vidijo to povezavo na vašem profilu';

  @override
  String get connectionVisibilityFriends => 'Prijatelji';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Dovoli vašim prijateljem, da vidijo to povezavo';

  @override
  String get connectionVisibilityCommunityMembers => 'Člani skupnosti';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Dovoli članom skupnosti, v katerih ste, da vidijo to povezavo';

  @override
  String get connectionRemoveTitle => 'Odstrani povezavo';

  @override
  String get connectionRemoveDescription =>
      'Ali ste prepričani, da želite odstraniti to povezavo? Tega dejanja ni mogoče razveljaviti.';

  @override
  String get connectionRemoveConfirm => 'Odstrani';

  @override
  String get connectionsLoadError => 'Povezav ni bilo mogoče naložiti';

  @override
  String get connectionsReorderError => 'Naročila ni bilo mogoče posodobiti';

  @override
  String get connectionInitiateFailed =>
      'Preverjanja ni bilo mogoče začeti. Poskusite znova.';

  @override
  String get connectionVerifyFailed =>
      'Preverjanje ni uspelo. Preverite svoj DNS zapis in poskusite znova.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Avtorizacije Bluesky ni bilo mogoče začeti.';

  @override
  String get connectionUpdateFailed => 'Povezave ni bilo mogoče posodobiti';

  @override
  String get connectionRemoveFailed => 'Povezave ni bilo mogoče odstraniti';

  @override
  String get connectionTokenSavedToast => 'Fluxer-verification shranjen';

  @override
  String get connectionTokenSaveFailedToast =>
      'Datoteke ni bilo mogoče shraniti';

  @override
  String get connectionEnterHandle => 'Vnesite ročaj Bluesky.';

  @override
  String get connectionEnterDomain => 'Vnesite domeno.';

  @override
  String get lookAndFeelTitle => 'Videz in občutek';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Izberite med temnim, premogovim ali svetlim videzom.';

  @override
  String get lookAndFeelThemeDark => 'Temna tema';

  @override
  String get lookAndFeelThemeCoal => 'Premogova tema';

  @override
  String get lookAndFeelThemeLight => 'Svetla tema';

  @override
  String get lookAndFeelThemeSystem => 'Sistemska tema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sinhroniziraj temo med napravami';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Ko je omogočeno, se spremembe teme sinhronizirajo z vsemi vašimi napravami. Ko je onemogočeno, bo ta naprava uporabljala svojo nastavitev teme.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Sistemska tema samodejno onemogoči sinhronizacijo, da sledi željam vašega sistema na tej napravi.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Temo vašega računa ni bilo mogoče sinhronizirati. Poskusite znova.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Prilagajanje pisave v klepetu';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Prilagodite velikost pisave v območju klepeta.';

  @override
  String get lookAndFeelInterfaceTitle => 'Vmesnik';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Prilagodite elemente in vedenja vmesnika.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indikatorji tipkanja v seznamu kanalov';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Izberite, kako se indikatorji tipkanja pojavijo v seznamu kanalov, ko nekdo tipka v kanalu.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indikator tipkanja + Avatarji';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Prikaži indikator tipkanja z avatarji uporabnikov v seznamu kanalov';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Samo indikator tipkanja';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Prikaži samo indikator tipkanja brez avatarjev';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Skrito';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ne prikazuj indikatorjev tipkanja v seznamu kanalov';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Prikaži tipkanje v izbranem kanalu';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Ko je onemogočeno (privzeto), se indikatorji tipkanja ne bodo prikazali v kanalu, ki si ga trenutno ogledujete.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'splošno';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Namigi za tipkovnico';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Nadzorujte, ali se namigi za bližnjice na tipkovnici pojavijo v orodnih namigih.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Skrij namige tipkovnice v orodnih namigih';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Ko je omogočeno, so značke bližnjic skrite v pojavnih oknih orodnih namigov.';

  @override
  String get lookAndFeelNekoTitle => 'Razno';

  @override
  String get lookAndFeelNekoDescription => 'Različne možnosti vmesnika.';

  @override
  String get lookAndFeelShowNekoLabel => 'Prikaži Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Ko je omogočeno, se Neko prikaže blizu vrstice za vnos v klepet.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Vedenje pri pridruževanju glasovnim kanalom';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Nadzorujte, kako se pridružujete glasovnim kanalom v skupnostih.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Zahtevaj dvoklik za pridružitev glasovnim kanalom';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Ko je omogočeno, boste morali dvakrat klikniti na glasovne kanale, da se jim pridružite. Ko je onemogočeno (privzeto), bo en sam klik takoj pridružil kanal.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Hitra rjava lisica skoči čez lenega psa.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Stranska vrstica skupnosti';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigurirajte, kako stranska vrstica skupnosti prikazuje neposredna sporočila.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count skupnosti so začasno nedostopne zaradi napake pretvornika pretoka.',
      one:
          '1 skupnost je začasno nedostopna zaradi napake pretvornika pretoka.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Strni DM v mapo';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Ko je omogočeno, se neprebrani DM-ji v stranski vrstici skupnosti strnejo v mapo na gumbu Fluxer. Kliknite gumb Fluxer, ko ste na strani DM-jev, da razširite ali strnete mapo.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Seznam kanalov';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Nadzorujte vedenje indikatorja neprebranih za utišane kanale v seznamih kanalov.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Prikaži indikator neprebranih na utišanih kanalih';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Ko je omogočeno, utišani kanali prikažejo zbledel indikator neprebranih na levi strani. Omenitve se še vedno prikažejo ne glede na to nastavitev.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktivni zdaj';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Nadzorujte, kako se Aktivni zdaj prikažejo po aplikaciji.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Prikaži Aktivne zdaj na domačem zaslonu';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Prikaži Aktivne zdaj na domačem zaslonu, da prikažeš prijatelje, ki so aktivni v glasovnem klepetu. Videli boste predogled, kontekst kanala, kdo je že tam, in hiter način, da se pridružite.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Priljubljene';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Nadzorujte vidnost priljubljenih po vsej aplikaciji.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Omogoči priljubljene';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Ko je omogočeno, lahko kanale dodate med priljubljene in se bodo prikazali v razdelku Priljubljene. Ko je onemogočeno, bodo vsi elementi vmesnika, povezani s priljubljenimi (gumbi, menijske postavke), skriti. Vaše obstoječe priljubljene bodo ohranjene.';

  @override
  String get favoritesTitle => 'Priljubljene';

  @override
  String get favoritesEmptyTitle => 'Še ni priljubljenih';

  @override
  String get favoritesEmptyDescription =>
      'Zvezdico ob channels iz glave chata, da jih shraniš tukaj.';

  @override
  String get favoritesWelcomeTitle => 'Dobrodošli v priljubljene';

  @override
  String get favoritesWelcomeDescription =>
      'Vaš osebni prostor za hiter dostop do channels, DM-jev in skupin, ki jih imate radi. Pritisnite zvezdico na katerem koli channel, da ga dodate sem.';

  @override
  String get favoritesWelcomeTip => 'Ni za vas? Kadar koli ga izklopite.';

  @override
  String get favoritesDisableButton => 'Onemogoči priljubljene';

  @override
  String get favoritesAddedToast => 'Dodano med priljubljene';

  @override
  String get favoritesRemovedToast => 'Odstranjeno iz priljubljenih';

  @override
  String get favoritesHiddenToast => 'Priljubljene skrite';

  @override
  String get favoritesMute => 'Utili priljubljene';

  @override
  String get favoritesUnmute => 'Odumili priljubljene';

  @override
  String get favoritesHeaderMenu => 'Meni priljubljenih';

  @override
  String get favoritesCreateCategory => 'Ustvari kategorijo';

  @override
  String get favoritesCategoryNameLabel => 'Ime kategorije';

  @override
  String get favoritesHideMutedChannels => 'Skrij utišane channels';

  @override
  String get favoritesShowMutedChannels => 'Pokaži utišane channels';

  @override
  String get favoritesSetNickname => 'Nastavi vzdevek';

  @override
  String get favoritesNicknameLabel => 'Vzdevek';

  @override
  String get favoritesSaveNickname => 'Shrani vzdevek';

  @override
  String get favoritesMoveToCategory => 'Premakni v kategorijo';

  @override
  String get favoritesUncategorized => 'Neuvrščeno';

  @override
  String get favoritesOtherCategory => 'Drugo';

  @override
  String get favoritesRemoveFromFavorites => 'Odstrani iz priljubljenih';

  @override
  String get favoritesAddToFavorites => 'Dodaj med priljubljene';

  @override
  String get favoritesHideConfirmTitle => 'Skrij priljubljene';

  @override
  String get favoritesHideConfirmDescription =>
      'To bo skrilo vse elemente vmesnika, povezane s priljubljenimi, vključno z gumbi in menijskimi postavkami. Vaše obstoječe priljubljene bodo ohranjene in jih lahko kadar koli ponovno omogočite v Nastavitve > Napredno > Videz.';

  @override
  String get favoritesDirectMessageSubtitle => 'Neposredno sporočilo';

  @override
  String get messagesMediaDisplayGroupTitle => 'Prikaz';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Nadzorujte, kako se prikazujejo sporočila, predstavnost in druga vsebina.';

  @override
  String get messagesMediaMediaGroupTitle => 'Predstavnost';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Prilagodite nastavitve velikosti predstavnosti in gumbe.';

  @override
  String get messagesMediaInputGroupTitle => 'Vnos';

  @override
  String get messagesMediaInputGroupDescription =>
      'Prilagodite nastavitve vnosa sporočil.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Stranska vrstica';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigurirajte, kako je prikazana stranska vrstica skupnosti.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Privzeto skrij utišane channels';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Samodejno skrij utišane channels v stranski vrstici, ko se pridružiš novim skupnostim';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Privzeto skrij utišane channels?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Nove skupnosti, ki se jim pridružiš, bodo samodejno skrile utišane channels. Ali želite to nastavitev uporabiti tudi za vse svoje obstoječe skupnosti?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Nehaj privzeto skrivati utišane channels?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Nove skupnosti, ki se jim pridružiš, ne bodo več samodejno skrile utišanih channels. Ali želite prikazati utišane channels tudi v vseh svojih obstoječih skupnostih?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Uporabi za vse skupnosti';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Pokaži v vseh skupnostih';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Samo nove skupnosti';

  @override
  String get messagesMediaDisplaySectionTitle => 'Prikaz predstavnosti';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Nadzorujte, kako se prikazujejo slike, videoposnetki in druga predstavnost. Vsa predstavnost je ponovno prilagojena in pretvorjena. Izjemno veliki datoteki, ki ju ni mogoče stisniti v predogled, se ne bosta vdelala ne glede na te nastavitve.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Ko so objavljeni kot povezave do chata';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Ko so naloženi neposredno v Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Predogledi povezav';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Nadzorujte, kako se povezave do spletnih mest predogledajo v chatu';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Pokaži vdelave in predoglede povezav do spletnih mest';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakcije';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfiguriraj emoji reakcije na sporočila';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Prikaži emoji reakcije na sporočila';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Vsebina z opozorilom';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Nadzoruj, kako je prikazana vsebina z opozorilom';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Prikaži vsebino z opozorilom';

  @override
  String get messagesMediaSpoilersOnClickName => 'Ob dotiku';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Prikaži vsebino z opozorilom ob dotiku';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'V kanalih, ki jih moderiram';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Vedno prikaži vsebino z opozorilom v kanalih, kjer imaš dovoljenje \"Upravljanje sporočil\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Vedno';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Vedno prikaži vsebino z opozorilom';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Nastavitve velikosti predstavnosti';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Prilagodi največjo velikost prikaza za vdelano in priloženo predstavnost. Manjše velikosti zavzamejo manj prostora na zaslonu, večje pa prikažejo več podrobnosti.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Predstavnost iz povezav (vstavki)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Priložene datoteke';

  @override
  String get messagesMediaSizeCompactName => 'Kompaktno (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'Manjša velikost predstavnosti';

  @override
  String get messagesMediaSizeComfortableName => 'Udobno (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Večja velikost predstavnosti z več podrobnostmi';

  @override
  String get messagesMediaGifsSectionTitle => 'Obnašanje GIF-ov';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Nadzoruj, kako se GIF-i vstavljajo v klepet';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Samodejno pošlji GIF-e ob izbiri';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Samodejno dopolnjevanje izrazov (dopolnjevanje z dvopičjem)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Nadzoruj, kaj se prikaže v samodejnem dopolnjevanju izrazov, ko vtipkaš dvopičje. Prilagodi, kateri predlogi se prikažejo, da ustrezajo tvojim željam.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Prikaži privzete emojije v samodejnem dopolnjevanju izrazov';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Prikaži prilagojene emojije v samodejnem dopolnjevanju izrazov';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Prikaži nalepke v samodejnem dopolnjevanju izrazov';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Prikaži shranjeno predstavnost v samodejnem dopolnjevanju izrazov';

  @override
  String get messagesMediaEditingSectionTitle => 'Urejanje sporočil';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Nadzoruj, kaj se zgodi z osnutkom urejanja, ko ga prekličeš.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Ohrani osnutek urejanja ob preklicu';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle =>
      'Indikatorji neprebranih sporočil';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Nadzoruj, kako so prikazani indikatorji neprebranih sporočil.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Prikaži zbledele indikatorje neprebranih sporočil v utišanih kanalih';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Prikaži zatemnjen indikator neprebranih sporočil ob neposrednih sporočilih in kanalih, ki so utišani, tako da lahko še vedno na prvi pogled vidiš, ali je prišlo do dejavnosti.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Predogledi sporočil v neposrednih sporočilih';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Nadzoruj, kdaj so predogledi sporočil prikazani na seznamu neposrednih sporočil.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Način predogleda sporočil v neposrednih sporočilih';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Vsa sporočila';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Prikaži predoglede sporočil za vse pogovore v neposrednih sporočilih';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Samo neprebrana neposredna sporočila';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Prikaži predoglede sporočil samo za neposredna sporočila z neprebranimi sporočili';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Brez';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ne prikazuj predogledov sporočil na seznamu neposrednih sporočil';

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
  String get dmListSentAnAttachment => 'Poslano je bilo priloženo gradivo';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username je pripel sporočilo v ta kanal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username je dodal $userName v skupino.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username je dodal nekoga v skupino.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username je zapustil skupino.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username je odstranil uporabnika $userName iz skupine.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username je odstranil nekoga iz skupine.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username je spremenil ime kanala v $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username je spremenil ime kanala.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username je spremenil ikono kanala.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username je začel klic.';
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
  String get voiceConnectionConfirmTitle => 'Potrditev glasovne povezave';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ta glasovni kanal že uporabljate na $count drugih napravah. Kaj želite storiti?',
      one:
          'Ta glasovni kanal že uporabljate na 1 drugi napravi. Kaj želite storiti?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Preklopi na to napravo';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Samo pridruži se (obdrži druge povezave)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ne naredi nič, ne želim se pridružiti';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'To je glasovni kanal. Povežite se, da začnete govoriti!';

  @override
  String get voiceChannelJoin => 'Pridruži se glasovnemu kanalu';

  @override
  String get voiceChannelJoinConnect => 'Poveži se na glas';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nimate dovoljenja za pridružitev temu glasovnemu kanalu';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon, kamera in deljenje zaslona so šifrirani od konca do konca.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon, kamera in deljenje zaslona so šifrirani od konca do konca.';

  @override
  String get voiceChannelE2eeBroken =>
      'Šifriranje od konca do konca ni na voljo, ker je v tem glasovnem kanalu nezdružljiv udeleženec.';

  @override
  String get voiceCallE2eeBroken =>
      'Šifriranje od konca do konca ni na voljo, ker je v tem klicu nezdružljiv udeleženec.';

  @override
  String get voiceE2eeUpdateRequired =>
      'To odjemalsko programsko opremo je treba posodobiti pred pridružitvijo temu šifriranemu klicu.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nismo mogli zagnati vašega mikrofona. Še vedno ste v klicu.';

  @override
  String get voiceChannelStatusConnecting => 'Povezovanje…';

  @override
  String get voiceChannelStatusConnected => 'Povezano';

  @override
  String get voiceChannelStatusError => 'Napaka';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobilna naprava';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Namizna naprava';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Skupnost utišana';

  @override
  String get voiceParticipantTooltipMuted => 'Utišano';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Skupnost oglušena';

  @override
  String get voiceParticipantTooltipDeafened => 'Oglušen';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Povezava: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count udeležencev',
      one: '1 udeleženec',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Zapusti';

  @override
  String get voiceControlMute => 'Utišaj';

  @override
  String get voiceControlUnmute => 'Vklopi zvok';

  @override
  String get voiceControlDeafen => 'Oglušitev';

  @override
  String get voiceControlUndeafen => 'Odglušitev';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Deli zaslon';

  @override
  String get voiceScreenShareNotificationText => 'Delite svoj zaslon.';

  @override
  String get voiceControlMore => 'Več';

  @override
  String get voiceControlDisconnect => 'Prekini povezavo';

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
  String get voiceControlChat => 'Klepet';

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
  String get voiceTextChatShow => 'Pokaži klepet';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# neprebranimi sporočili',
      one: '# neprebranim sporočilom',
    );
    return 'Pokaži klepet z $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Dovoljenje za kamero je potrebno za video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nismo mogli začeti deljenja zaslona. Poskusite znova.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Dovoljenje za deljenje zaslona je bilo zavrnjeno.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Deljenje zaslona ni na voljo na tej napravi.';

  @override
  String get voiceWatchStream => 'Ogled pretoka';

  @override
  String get voiceStopWatching => 'Prenehaj gledati';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Prenehaj gledati trenutni tok';

  @override
  String get voiceOwnScreenShareTitle => 'Oddajaš';

  @override
  String get voiceOwnScreenShareSubtitle => 'Vaš tok je v živo za udeležence.';

  @override
  String get voiceLiveBadge => 'V ŽIVO';

  @override
  String get dmVoiceViewCall => 'Ogled klica';

  @override
  String get dmVoiceCallFullScreen => 'Celozaslonski način';

  @override
  String get dmVoiceCallFullScreenTooltip =>
      'Odpri klic v celozaslonskem načinu';

  @override
  String get dmVoiceStripStatusConnecting => 'Povezovanje…';

  @override
  String get dmVoiceStripStatusInCall => 'V klicu';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Glasovni klic';

  @override
  String get dmVoiceCallBarConnecting => 'Povezovanje…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Neposredni klic';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Skupinski klic';

  @override
  String get dmVoiceCallBarIssueFallback => 'Težava z glasom';

  @override
  String get dmVoiceFullscreenTitle => 'Glas';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Glas povezan';

  @override
  String get notificationsPageTitle => 'Obvestila';

  @override
  String get notificationsFilterUnreads => 'Neprebrana';

  @override
  String get notificationsFilterMentions => 'Omenitve';

  @override
  String get notificationsBookmarksTooltip => 'Zaznamki';

  @override
  String get notificationsMentionFilterTooltip => 'Filtriraj omembe';

  @override
  String get notificationsMentionFiltersTitle => 'Filtri omemb';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Vključi omembe @everyone in @here';

  @override
  String get notificationsMentionIncludeRoles => 'Vključi omembe vlog';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Vključi vse omembe skupnosti';

  @override
  String get notificationsNoUnreadTitle => 'Ni neprebranih sporočil';

  @override
  String get notificationsNoUnreadBody => 'Vse ste prebrali.';

  @override
  String get notificationsNoMentionsTitle => 'Ni nedavnih omemb';

  @override
  String get notificationsNoMentionsBody =>
      'Vse omembe vas se bodo prikazale tukaj 7 dni.';

  @override
  String get notificationsMentionsEndTitle => 'Dosegli ste konec';

  @override
  String get notificationsMentionsEndBody =>
      'Videli ste vse svoje nedavne omembe. Brez skrbi, kmalu se jih bo prikazalo več.';

  @override
  String get notificationsJump => 'Skoči';

  @override
  String get notificationsRemoveMentionTooltip => 'Odstrani omembo';

  @override
  String get notificationsViewAllUnread => 'Ogled vseh neprebranih';

  @override
  String get notificationsMarkAsRead => 'Označi kot prebrano';

  @override
  String get notificationsExpand => 'Razširi';

  @override
  String get notificationsCollapse => 'Strni';

  @override
  String get notificationsMessageUnavailable =>
      'Tega sporočila ni bilo mogoče naložiti.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining znakov preostalo';
  }

  @override
  String get characterCounterTooLong => 'Sporočilo je predolgo';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining znakov preostalo. Pridobite $productName, da pišete do $premiumMaxLength znakov.';
  }

  @override
  String get chatMessageFailedToSend => 'Sporočila ni bilo mogoče poslati';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Vašega sporočila ni bilo mogoče dostaviti. To je običajno zato, ker ne delite skupnosti s prejemnikom ali pa prejemnik sprejema samo neposredna sporočila od prijateljev. Morda boste morali prilagoditi tudi lastne nastavitve zasebnosti neposrednih sporočil v $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Vašega sporočila ni bilo mogoče dostaviti. Za pošiljanje neposrednih sporočil morate zahtevati svoj račun.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Vašega sporočila ni bilo mogoče dostaviti. Za pošiljanje sporočil morate zahtevati svoj račun.';

  @override
  String get chatSendFailureContentBlocked =>
      'Vašega sporočila ni bilo mogoče dostaviti, ker so ga označili naši varnostni sistemi. Če menite, da je to napaka, se obrnite na podporo.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Vašega sporočila ni bilo mogoče dostaviti, ker vsebuje odrasle emojije ali nalepke, ki niso dovoljeni v tem kontekstu.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'To sporočilo vidite samo vi.';

  @override
  String get chatClientSystemDismiss => 'Zavrzi';

  @override
  String get privacyDashboardCommunicationSection => 'Komunikacija';

  @override
  String get chatMessageDeleteFailed => 'Brisanje sporočila ni uspelo';

  @override
  String get chatMessageAddReaction => 'Dodaj reakcijo';

  @override
  String get chatMessageEdit => 'Uredi sporočilo';

  @override
  String get chatMessageReply => 'Odgovori';

  @override
  String get chatMessageForward => 'Posreduj';

  @override
  String get forwardMessageTitle => 'Posreduj sporočilo';

  @override
  String get forwardSearchHint => 'Išči kanale ali neposredna sporočila';

  @override
  String get forwardDirectMessagesSection => 'Neposredna sporočila';

  @override
  String get forwardCommentHint => 'Dodaj komentar (neobvezno)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Pošlji ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Ni najdenih kanalov';

  @override
  String get forwardSuccessToast => 'Sporočilo posredovano';

  @override
  String get forwardFailed => 'Sporočila ni bilo mogoče posredovati';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Komentarji niso na voljo, ker je v izbranem kanalu omogočen počasni način.';

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
      'Tukaj ne moreš pošiljati sporočil';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Tukaj ne moreš vstavljati povezav';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Tukaj ne moreš prilagati datotek';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Pošiljanje sporočil je v tej skupnosti onemogočeno';

  @override
  String get forwardDestinationTimedOut =>
      'V tej skupnosti si na časovni omejitvi';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Počasni način - počakaj $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopiraj sporočilo';

  @override
  String get chatMessagePin => 'Pripni sporočilo';

  @override
  String get chatMessageUnpin => 'Odstrani pripenjanje sporočila';

  @override
  String get chatMessageUnpinIt => 'Odstrani pripenjanje';

  @override
  String get chatMessageBookmark => 'Dodaj sporočilo med zaznamke';

  @override
  String get chatMessageRemoveBookmark => 'Odstrani zaznamek sporočila';

  @override
  String get chatMessageMarkAsUnread => 'Označi kot neprebrano';

  @override
  String get chatMessageCopyMessageLink => 'Kopiraj povezavo do sporočila';

  @override
  String get chatMessageCopyMessageId => 'Kopiraj ID sporočila';

  @override
  String get chatMessageViewReactions => 'Ogled reakcij';

  @override
  String get chatMessageRemoveAllReactions => 'Odstrani vse reakcije';

  @override
  String get chatMessageDebug => 'Razhrošči sporočilo';

  @override
  String get chatMessageDebugSheetTitle => 'Razhrošči sporočilo';

  @override
  String get chatMessageDebugCopyJson => 'Kopiraj JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON sporočila kopiran v odložišče';

  @override
  String get chatReactionsSheetTitle => 'Reakcije';

  @override
  String get chatReactionsSheetEmpty => 'Še nihče ni reagiral na to.';

  @override
  String get chatMessageReport => 'Prijavi sporočilo';

  @override
  String get iarReportMessageTitle => 'Prijavi sporočilo';

  @override
  String get iarThisUserFallback => 'tega uporabnika';

  @override
  String get iarModalDescription =>
      'Prijavi kršitev pravil ali najdi orodja za upravljanje stikov in nastavitev.';

  @override
  String get iarPathStepAriaLabel => 'Kaj potrebuješ?';

  @override
  String get iarCategoryStepTitle => 'Kakšno pravilo je bilo kršeno?';

  @override
  String get iarReasonStepTitle => 'Katero pravilo je bilo kršeno?';

  @override
  String get iarReasonSelectHint => 'Izberi razlog';

  @override
  String get iarPickAnOptionToast => 'Izberi možnost za nadaljevanje.';

  @override
  String get iarPickARuleToast => 'Izberi pravilo, ki je bilo kršeno.';

  @override
  String get iarPathPlatform => 'Prijavi kršitev pravil platforme';

  @override
  String get iarPathCommunity => 'Prijavi moderatorjem te skupnosti';

  @override
  String get iarPathPreferenceMessage => 'Ne maram te vsebine';

  @override
  String get iarCategoryTargetedHarmLabel => 'Grožnje, nadlegovanje ali škoda';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Drsnost, grožnje, sovraštvo, nasilje, napadi ali vsebina, ki spodbuja samopoškodovanje.';

  @override
  String get iarCategorySafetyMinorsLabel => 'Varnost otrok ali zrele vsebine';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Otroci v nevarnosti, zrele vsebine na napačnem mestu ali neželeno vedenje.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Zasebnost ali posredovanje identitete';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, sledenje, pretvarjanje, da si nekdo drug, ali neprimerna profilna slika.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Prevare, zlonamerna programska oprema ali dezinformacije';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, goljufija, zlonamerne povezave ali lažne trditve, ki lahko povzročijo škodo v resničnem svetu.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Nelegalna dejavnost ali nekaj drugega';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Nelegalna prodaja, olajševanje kaznivih dejanj ali očitna kršitev pravil, ki se ne prilega zgornjim kategorijam.';

  @override
  String get iarReasonHarassmentLabel => 'Nadlegovanje ali grožnje';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Drsnost, ponavljajoči se neželeni stiki, sledenje ali ciljno usmerjeno nadlegovanje.';

  @override
  String get iarReasonHateLabel => 'Sovražni govor';

  @override
  String get iarReasonHateMessageDescription =>
      'Sprotniki, dehumanizirajoč jezik ali napadi na zaščitene skupine.';

  @override
  String get iarReasonViolenceLabel => 'Nasilje ali nasilne grožnje';

  @override
  String get iarReasonViolenceDescription =>
      'Verodostojne grožnje, grafično nasilje ali poveličevanje nasilja.';

  @override
  String get iarReasonMatureContentLabel => 'Zrele vsebine ali nadlegovanje';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Neželeno vedenje ali zrele vsebine na napačnem mestu.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Varnost otrok ali izkoriščanje mladoletnikov';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Vsebina, povezana z groomingom ali izkoriščanjem otrok.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Škodljive dezinformacije';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Lažne trditve, ki lahko povzročijo škodo v resničnem svetu.';

  @override
  String get iarReasonSpamLabel => 'Nezaželena pošta, prevare ali phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Masovna neželena pošta, goljufija, lažni nagradni boni ali zloraba računa.';

  @override
  String get iarReasonMalwareLabel =>
      'Zlonamerna programska oprema ali nevarne povezave';

  @override
  String get iarReasonMalwareDescription =>
      'Zlonamerna programska oprema, kraja poverilnic ali škodljive datoteke.';

  @override
  String get iarReasonPrivacyLabel => 'Kršitev zasebnosti';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, razkritje zasebnih podatkov ali sledenje.';

  @override
  String get iarReasonImpersonationLabel =>
      'Posredovanje identitete ali zavajajoči mediji';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Pretvarjanje, da si nekdo drug, vključno z zavajajočimi vsebinami, ustvarjenimi z umetno inteligenco.';

  @override
  String get iarReasonIllegalLabel => 'Nelegalna dejavnost';

  @override
  String get iarReasonIllegalDescription =>
      'Nelegalna prodaja, olajševanje kaznivih dejanj ali nezakonita dejavnost.';

  @override
  String get iarReasonSelfHarmLabel => 'Samopoškodovanje ali samomor';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Spodbujanje ali navodila za samopoškodovanje ali motnje hranjenja.';

  @override
  String get iarReasonOtherLabel => 'Druga očitna kršitev pravil';

  @override
  String get iarReasonOtherDescription =>
      'Uporabite samo, če jasno krši pravila Fluxerja in se ne prilega zgornjim kategorijam.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Če je vpleten mladoletnik, namesto tega uporabite \"$childSafetyReason\".';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Če gre za CSAM ali izkoriščanje mladoletnika, to pošljite zdaj in gradiva ne posredujte ponovno.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Če je nekdo v neposredni nevarnosti, se po svojih najboljših močeh obrnite na lokalne reševalne službe.';

  @override
  String get iarSafetyNoteViolence =>
      'Če gre za verodostojno neposredno grožnjo, se obrnite tudi na lokalne reševalne službe.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Če gre za neposredno teroristično grožnjo, se obrnite tudi na lokalne reševalne službe.';

  @override
  String get iarActionBlockUserTitle => 'Blokiraj tega uporabnika';

  @override
  String get iarActionBlockUserDescription =>
      'Ustavite sporočila in zahteve za prijateljstvo.';

  @override
  String get iarActionBlockUserButton => 'Blokiraj';

  @override
  String get iarActionCopyMessageLinkTitle => 'Kopiraj povezavo do sporočila';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Deli z moderatorji skupnosti.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopiraj';

  @override
  String get iarActionCloseDmTitle => 'Zapri ta neposredni pogovor';

  @override
  String get iarActionCloseDmDescription =>
      'Ne blokira. Lahko ponovno odprete pozneje.';

  @override
  String get iarActionCloseDmButton => 'Zapri DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Zapusti skupnost';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Nehaj videti njeno vsebino in člane.';

  @override
  String get iarActionLeaveCommunityButton => 'Zapusti';

  @override
  String get iarActionDmSettingsTitle =>
      'Nastavitve DM-ja in prošenj za prijateljstvo';

  @override
  String get iarActionDmSettingsDescription =>
      'Spremeni, kdo te lahko kontaktira.';

  @override
  String get iarActionCallSettingsTitle =>
      'Nastavitve klicev in skupinskih klepetov';

  @override
  String get iarActionCallSettingsDescription =>
      'Spremeni, kdo te lahko pokliče ali doda.';

  @override
  String get iarActionOpenButton => 'Odpri';

  @override
  String get iarActionDeleteMessageTitle => 'Izbriši to sporočilo';

  @override
  String get iarActionDeleteMessageDescription =>
      'Odstrani ga iz kanala za vse.';

  @override
  String get iarActionDeleteMessageButton => 'Izbriši';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Izbrisano';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'To sporočilo je bilo že izbrisano.';

  @override
  String get iarActionBanUserTitle => 'Prepovej temu uporabniku';

  @override
  String get iarActionBanUserDescription =>
      'Odprli smo okno za prepoved v tej skupnosti.';

  @override
  String get iarActionBanUserButton => 'Prepovej';

  @override
  String get iarActionBanUserBannedButton => 'Prepovedan';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Temu uporabniku je že prepovedan vstop v skupnost.';

  @override
  String get iarCloseDmConfirmTitle => 'Zapri DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Zapri svoj trenutni DM z uporabnikom $name. To jih ne bo blokiralo; lahko ga ponovno odpreš pozneje.';
  }

  @override
  String get iarSuccessTitle => 'Prijavi poslano';

  @override
  String get iarSuccessBody =>
      'Naša varnostna ekipa ga pregledava. Poslali vam bomo DM in e-pošto, ko bomo sprejeli odločitev.';

  @override
  String get iarAlreadyReportedTitle => 'Že prijavljeno';

  @override
  String get iarAlreadyReportedBody =>
      'To sporočilo ste že prijavili. Naša varnostna ekipa ga pregledava.';

  @override
  String get iarBackButton => 'Nazaj';

  @override
  String get iarContinueButton => 'Nadaljuj';

  @override
  String get iarSendReportButton => 'Pošlji prijavo';

  @override
  String get iarDoneButton => 'Končano';

  @override
  String get iarCouldntSendToast =>
      'Prijave ni bilo mogoče poslati. Poskusite znova.';

  @override
  String get iarRateLimitedToast =>
      'Prehitro prijavljate. Počakajte trenutek in poskusite znova.';

  @override
  String get iarReportSentToast =>
      'Prijava poslana. Naša varnostna ekipa jo bo pregledala.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Blokiraj $name? Ne bodo vam mogli pošiljati sporočil ali prošenj za prijateljstvo. Lahko jih pozneje odblokirate.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Uporabnika ni bilo mogoče blokirati. Poskusite znova.';

  @override
  String get iarCloseDmSuccessToast => 'DM zaprt.';

  @override
  String get iarCloseDmFailedToast =>
      'DM-ja ni bilo mogoče zapreti. Poskusite znova.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Skupnosti ni bilo mogoče zapustiti. Poskusite znova.';

  @override
  String get chatMessageSuppressEmbeds => 'Skrij predoglede povezav';

  @override
  String get chatMessageUnsuppressEmbeds => 'Pokaži predoglede povezav';

  @override
  String get chatMessageDelete => 'Izbriši sporočilo';

  @override
  String get chatMessageDeleteConfirmTitle => 'Izbriši sporočilo';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Ali ste prepričani, da želite izbrisati to sporočilo?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Več';

  @override
  String get chatEditingMessage => 'Urejanje sporočila';

  @override
  String get chatReplyOriginalDeleted => 'Izvirno sporočilo je bilo izbrisano';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Izvirnega sporočila ni bilo mogoče naložiti';

  @override
  String get chatReplyAttachedMedia => 'Sporočilo vsebuje priložene medije';

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
  String get chatMessagesLoadError => 'Sporočil ni bilo mogoče naložiti.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Preglasiti nastavitve omenjanja?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname raje prejema omenjanja v odgovorih. Vendarle želite poslati brez omenjanja?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname raje odgovarja brez omembe. Pošlji z omembo vseeno?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Prezri nastavitev';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Kliknite, da onemogočite obveščanje uporabnika, na katerega odgovarjate.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Kliknite, da omogočite obveščanje uporabnika, na katerega odgovarjate.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Omeni uporabnika, na katerega odgovarjate';

  @override
  String get chatReplyMentionOn => 'Vklopljeno';

  @override
  String get chatReplyMentionOff => 'Izklopljeno';

  @override
  String get chatReplyCancel => 'Prekliči odgovor';

  @override
  String get chatEditMessageHint => 'Uredi sporočilo';

  @override
  String get chatEditNoChanges => 'Ni sprememb za shranjevanje';

  @override
  String get chatChannelNotReady =>
      'Ta kanal še ni pripravljen. Poskusite znova čez trenutek.';

  @override
  String get chatMessageEdited => '(urejeno)';

  @override
  String get chatMessageSilent => 'To je bilo @silent sporočilo.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Danes ob $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Včeraj ob $time';
  }

  @override
  String get mediaViewerImagePreview => 'Predogled slike';

  @override
  String get mediaViewerClose => 'Zapri predogled medijev';

  @override
  String get mediaViewerOpenInBrowser => 'Odpri v brskalniku';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Posreduj';

  @override
  String get mediaViewerZoomIn => 'Povečaj';

  @override
  String get mediaViewerZoomOut => 'Pomanjšaj';

  @override
  String get mediaViewerPreviousAttachment => 'Prejšnja priloga';

  @override
  String get mediaViewerNextAttachment => 'Naslednja priloga';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Preklopi kontrolnike videa';

  @override
  String get chatAttachmentVideoMute => 'Utili video';

  @override
  String get chatAttachmentVideoUnmute => 'Vklopi zvok videa';

  @override
  String get chatAttachmentVideoPlay => 'Predvajaj video';

  @override
  String get chatAttachmentVideoPause => 'Zaustavi video';

  @override
  String get chatAttachmentVideoProgress => 'Napredek videa';

  @override
  String get chatVideoPlaybackFailed => 'Videa ni bilo mogoče predvajati.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Obvesti uporabnike s to vlogo, ki imajo dovoljenje za ogled tega kanala.';

  @override
  String get addGuildModalTitle => 'Dodaj skupnost';

  @override
  String get addGuildModalLandingDescription =>
      'Ustvari novo skupnost ali se pridruži obstoječi.';

  @override
  String get addGuildCreateCommunity => 'Ustvari skupnost';

  @override
  String get addGuildJoinCommunity => 'Pridruži se skupnosti';

  @override
  String get addGuildImportDiscordTemplate => 'Uvozi predlogo Discord';

  @override
  String get addGuildJoinTitle => 'Pridruži se skupnosti';

  @override
  String get addGuildJoinDescription =>
      'Vnesi povezavo za povabilo, da se pridružiš skupnosti.';

  @override
  String get addGuildInviteLinkLabel => 'Povezava za povabilo';

  @override
  String get addGuildJoinSubmit => 'Pridruži se skupnosti';

  @override
  String get addGuildInviteInvalid =>
      'To povabilo je neveljavno ali je poteklo.';

  @override
  String get addGuildJoinFailed =>
      'Skupnosti se ni bilo mogoče pridružiti. Poskusite znova.';

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
  String get addGuildPackInstalled => 'Paket je bil uspešno nameščen.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Odstrani vse reakcije';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Ali ste prepričani, da želite odstraniti vse reakcije iz tega sporočila?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Odstrani pripenjanje sporočila';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Ali želite to pripenjanje poslati nazaj v preteklost?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username je pripenel $messageLink v ta kanal. Oglejte si $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'sporočilo';

  @override
  String get systemPinMessageAllPinsLink => 'vsa pripeta sporočila';

  @override
  String get channelPinsEmptyTitle => 'Ni pripetih sporočil';

  @override
  String get channelPinsEmptyDescription =>
      'Tukaj se bodo prikazala pripeta sporočila.';

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
  String get personalNotesTitle => 'Osebne opombe';

  @override
  String get personalNotesSubtitle =>
      'Vaš zasebni prostor za misli in opomnike';

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
    return 'Dobrodošli v $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Na začetku ni bilo ničesar. Potem pa je prišel $channelName. In bilo je dobro.';
  }

  @override
  String get personalNotesComposerHint => 'Pošlji sporočilo sebi';

  @override
  String get personalNotesPrivateSpace => 'Vaš zasebni prostor';

  @override
  String get purgePersonalNotes => 'Počisti osebne opombe';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'To bo trajno izbrisalo vsako sporočilo in prilogo v vaših osebnih opombah. Tega ni mogoče razveljaviti.';

  @override
  String get purgePersonalNotesConfirmButton => 'Počisti';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Počiščenih $count sporočil iz osebnih opomb';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Osebne opombe so bile že prazne';

  @override
  String get purgePersonalNotesFailed =>
      'Osebnih opomb ni bilo mogoče počistiti';

  @override
  String get userSettingsGroupYourAccount => 'VAŠ RAČUN';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Varnost in prijava';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Darila in kode';

  @override
  String get userSettingsNavPrivacyDashboard => 'Nadzorna plošča za zasebnost';

  @override
  String get userSettingsNavAuthorizedApps => 'Pooblaščene aplikacije';

  @override
  String get userSettingsNavBlockedUsers => 'Blokirani uporabniki';

  @override
  String get userSettingsNavLinkedDevices => 'Povezane naprave';

  @override
  String get userSettingsNavConnections => 'Povezave';

  @override
  String get userSettingsNavLookAndFeel => 'Videz';

  @override
  String get userSettingsNavAccessibility => 'Dostopnost';

  @override
  String get userSettingsNavChat => 'Sporočila in predstavnost';

  @override
  String get userSettingsNavAudioAndVideo => 'Zvok in video';

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
  String get userSettingsNavLanguageAndTime => 'Jezik in čas';

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
  String get advancedPerformanceReportingTitle => 'Poročanje o uspešnosti';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Pomagajte izboljšati Fluxer z deljenjem anonimnih podatkov o zrušitvah in uspešnosti.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Pošlji poročila o zrušitvah in uspešnosti';

  @override
  String get advancedPerformanceReportingDescription =>
      'Vsi prijavljeni podatki so anonimni in se pošiljajo samo v Fluxerjevo lastno storitev za spremljanje – ne uporabljajo se ponudniki tretjih oseb.';

  @override
  String get userSettingsNavApplications => 'Aplikacije';

  @override
  String get userSettingsNavAppLogs => 'Dnevniki aplikacij';

  @override
  String get userSettingsNavDeveloperTools => 'Razvojna orodja';

  @override
  String get userSettingsNavLimitsConfig => 'Konfiguracija omejitev';

  @override
  String get userSettingsNavFeatureFlags => 'Zastavice funkcij';

  @override
  String get userSettingsNavWhatsNew => 'Kaj je novega';

  @override
  String get userSettingsNavLogOut => 'Odjava';

  @override
  String get betaWarningTitle => 'Beta programska oprema';

  @override
  String get betaWarningMessage =>
      'To je beta programska oprema. Še ni vse dokončano ali dodano.';

  @override
  String get betaWarningReportIssues =>
      'Prosimo, prijavite vse težave, ki jih najdete, skupnosti Fluxer Mobile (trenutno se lahko pridružite skupnosti samo, če imate Plutonium).';

  @override
  String get betaWarningRepoLink => 'Ogled izvorne kode na GitHubu';

  @override
  String get betaWarningGotIt => 'Razumem';

  @override
  String get quickSwitcherTabSearch => 'Iskanje';

  @override
  String get quickSwitcherTabFriends => 'Prijatelji';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Iskanje kanalov, oseb ali skupnosti';

  @override
  String get quickSwitcherSearchFriends => 'Iskanje prijateljev';

  @override
  String get quickSwitcherNoMatchesFound => 'Ni zadetkov';

  @override
  String get quickSwitcherEmptyHint =>
      'Poskusite drugo ime ali uporabite predpone @ / # / ! / * za filtriranje rezultatov.';

  @override
  String get quickSwitcherSectionPeople => 'Osebe';

  @override
  String get quickSwitcherSectionGroupMessages => 'Skupinska sporočila';

  @override
  String get quickSwitcherSectionTextChannels => 'Besedilni kanali';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Glasovni kanali';

  @override
  String get quickSwitcherSectionCommunities => 'Skupnosti';

  @override
  String get quickSwitcherSectionSettings => 'Nastavitve';

  @override
  String get quickSwitcherHomeLabel => 'Domov';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Neposredna sporočila';

  @override
  String get quickSwitcherFavoritesLabel => 'Priljubljene';

  @override
  String get quickSwitcherUserSettingsLabel => 'Nastavitve uporabnika';

  @override
  String get quickSwitcherNotificationsLabel => 'Obvestila';

  @override
  String get quickSwitcherBookmarksLabel => 'Zaznamki';

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
  String get quickSwitcherMentionsLabel => 'Omenitve';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Še nimate prijateljev';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Dodajte prijatelja, da začnete.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Ni prijateljev, ki bi ustrezali iskanju';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Poskusite drugo ime.';

  @override
  String get quickSwitcherSearchAliasUser => 'Uporabnik';

  @override
  String get quickSwitcherSearchAliasYou => 'Vi';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Neposredna sporočila';

  @override
  String get quickSwitcherSearchAliasMessages => 'Sporočila';

  @override
  String get quickSwitcherSearchAliasFav => 'Priljubljene';

  @override
  String get quickSwitcherSearchAliasStarred => 'Označenih';

  @override
  String get quickSwitcherSearchAliasInbox => 'Prejeto';

  @override
  String get quickSwitcherSearchAliasSaved => 'Shranjenih';

  @override
  String get uiClose => 'Zapri';

  @override
  String get chatJumpToBottom => 'Skoči na dno';

  @override
  String get uiConfirm => 'Potrdi';

  @override
  String get uiLoading => 'Nalaganje';

  @override
  String get uiUnsavedChanges => 'Nesehranjene spremembe';

  @override
  String get uiReset => 'Ponastavi';

  @override
  String get uiOpenColorPicker => 'Odpri izbirnik barv';

  @override
  String get uiSelectPlaceholder => 'Izberi';

  @override
  String get uiSearchPlaceholder => 'Išči';

  @override
  String get uiNoOptionsFound => 'Ni možnosti';

  @override
  String get uiDismissNotification => 'Zavrzi obvestilo';

  @override
  String get uiColorPickerTitle => 'Izbirnik barv';

  @override
  String get mentionConfirmTitle => 'Omeniti vse?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'To bo obvestilo $count članov. Nadaljujete?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'To bo obvestilo $count članov na spletu. Nadaljujete?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Omeniti';

  @override
  String get composerEmojiUnavailable =>
      'Tukaj ne morete uporabiti tega emojija.';

  @override
  String get instanceUrlLabel => 'URL primerka';

  @override
  String get instanceUrlPlaceholder => 'Vnesite URL primerka (npr. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Ponastavi na Fluxer';

  @override
  String get instanceConnect => 'Poveži';

  @override
  String get instanceConnecting => 'Povezovanje…';

  @override
  String get instanceConnectFailed => 'Povezava z instanco ni uspela';

  @override
  String get recentInstances => 'Nedavne instance';

  @override
  String removeRecentInstance(String domain) {
    return 'Odstrani $domain z nedavnih instanc';
  }

  @override
  String get instanceSheetTitle => 'Poveži se z instanco';

  @override
  String get connectToDifferentInstance => 'Poveži se z drugo instanco';

  @override
  String get changeInstance => 'Spremeni';

  @override
  String get instanceConnectionRequired => 'Za prijavo se poveži z instanco';

  @override
  String get comingSoon => 'Kmalu';

  @override
  String get guildNavbarDirectMessages => 'Neposredna sporočila';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Razišči odkrite skupnosti';

  @override
  String get discoveryExplore => 'Razišči';

  @override
  String get discoveryExplorePublicCommunities => 'Razišči javne skupnosti';

  @override
  String get discoveryListingSubheading =>
      'Želite svojo skupnost uvrstiti sem? Prijavite se, če izpolnjujete zahteve v nastavitvah vaše skupnosti > Odkrivanje.';

  @override
  String get discoverySearchCommunities => 'Išči skupnosti';

  @override
  String get discoveryFilterByLanguage => 'Filtriraj po jeziku';

  @override
  String get discoveryAllLanguages => 'Vsi jeziki';

  @override
  String get discoveryAllCategories => 'Vse';

  @override
  String get discoveryCategoryGaming => 'Igre';

  @override
  String get discoveryCategoryMusic => 'Glasba';

  @override
  String get discoveryCategoryEntertainment => 'Zabava';

  @override
  String get discoveryCategoryEducation => 'Izobraževanje';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Znanost in tehnologija';

  @override
  String get discoveryCategoryContentCreator => 'Ustvarjalec vsebine';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime in manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmi in TV';

  @override
  String get discoveryCategoryOther => 'Drugo';

  @override
  String get discoveryNoCommunitiesMatch => 'Nobena skupnost se ne ujema.';

  @override
  String get discoveryJoinCommunity => 'Pridruži se skupnosti';

  @override
  String get discoveryJoined => 'Pridruženo';

  @override
  String discoveryOnlineCount(String count) {
    return '$count na spletu';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString članov',
      one: '1 član',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Ni opisa.';

  @override
  String get discoveryCommunities => 'Skupnosti';

  @override
  String get discoveryApps => 'Aplikacije';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Ni se mogoče pridružiti tej skupnosti';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Nekaj je šlo narobe. Poskusite znova čez trenutek.';

  @override
  String get discoveryJoinErrorFullTitle => 'Ta skupnost je polna';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Ta skupnost je dosegla svojo mejo članov, zato se trenutno ne morete pridružiti.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Dosegli ste mejo skupnosti';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Vključeni ste v največje število skupnosti. Zapustite eno in poskusite znova.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Ne morete se pridružiti tej skupnosti';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Bili ste izključeni iz te skupnosti.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Ta skupnost ni več na voljo';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Morda je zapustila odkrivanje ali izklopila nove prijave. Osvežite stran in je ne boste videli več.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Prehitri ste';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Počakajte trenutek in poskusite znova.';

  @override
  String get guildNavbarAddCommunity => 'Dodaj skupnost';

  @override
  String get guildNavbarHelp => 'Pomoč';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NOVO SPOROČILO';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Zapri mapo $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Skupinski ZS';

  @override
  String get guildNavbarCreateChannel => 'Ustvari kanal';

  @override
  String get guildNavbarChannelType => 'Vrsta kanala';

  @override
  String get guildNavbarTextChannel => 'Besedilni kanal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Pošiljaj sporočila, slike, GIF-e in emojije';

  @override
  String get guildNavbarVoiceChannel => 'Glasovni kanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Družite se skupaj z glasom, videom in deljenjem zaslona';

  @override
  String get guildNavbarLinkChannel => 'Povezani kanal';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Hiter dostop do zunanje spletne strani ali vira';

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
  String get guildNavbarCreateCategory => 'Ustvari kategorijo';

  @override
  String get guildNavbarNewCategoryHint => 'Nova kategorija';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Povabi prijatelje v $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Prejemniki bodo preusmerjeni na #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Išči prijatelje';

  @override
  String get guildNavbarNoFriendsYet => 'Še nimate prijateljev';

  @override
  String get guildNavbarNoResults => 'Ni rezultatov';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Ali pa pošlji povabilno povezavo prijatelju:';

  @override
  String get guildNavbarInviteLink => 'Povabilna povezava';

  @override
  String get guildNavbarCopy => 'Kopiraj';

  @override
  String get guildNavbarCopied => 'Kopirano!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Vaša povabilna povezava poteče čez 7 dni.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Ta povabilna povezava nikoli ne poteče.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Vaša povabilna povezava poteče čez $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Uredi povabilno povezavo';

  @override
  String get guildNavbarInviteLinkSettings => 'Nastavitve povabilne povezave';

  @override
  String get guildNavbarExpireAfter => 'Poteče po';

  @override
  String get guildNavbarMaxUses => 'Največje število uporabe';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Podeli začasno članstvo';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Člani bodo odstranjeni, ko bodo brez povezave, razen če je dodeljena vloga';

  @override
  String get guildNavbarCreateNewLink => 'Ustvari novo povezavo';

  @override
  String get guildNavbarSent => 'Poslano';

  @override
  String get guildNavbarInvite => 'Povabi';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Zapusti skupnost';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Ali ste prepričani, da želite zapustiti to skupnost? Ne boste več mogli videti nobenih sporočil.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Zapusti skupnost';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Izbriši svoja sporočila v tej skupnosti?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Trajno izbriši vsako sporočilo, ki ste ga poslali tukaj, v vseh kanalih. Ne morete razveljaviti.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Izbriši moja sporočila';

  @override
  String get guildNavbarDeletedYourMessages => 'Izbrisali ste svoja sporočila';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Sporočil ni bilo mogoče izbrisati';

  @override
  String get guildNavbarRemoveOverride => 'Odstrani preglasitev';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Utihnjeno do $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible => 'Dostopno samo osebju Fluxerja';

  @override
  String get guildNavbarInvitesPaused =>
      'Vabila so trenutno ustavljena v tej skupnosti';

  @override
  String get guildNavbarDurationNever => 'nikoli';

  @override
  String get guildNavbarDuration30Minutes => '30 minut';

  @override
  String get guildNavbarDuration1Hour => '1 ura';

  @override
  String get guildNavbarDuration6Hours => '6 ur';

  @override
  String get guildNavbarDuration12Hours => '12 ur';

  @override
  String get guildNavbarDuration1Day => '1 dan';

  @override
  String get guildNavbarDuration7Days => '7 dni';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekund';
  }

  @override
  String get guildNavbarNever => 'Nikoli';

  @override
  String get guildNavbarNoLimit => 'Neomejeno';

  @override
  String get guildNavbarOneUse => '1 uporaba';

  @override
  String guildNavbarUses(int count) {
    return '$count uporab';
  }

  @override
  String get guildMenuMarkAsRead => 'Označi kot prebrano';

  @override
  String get guildPeekMoreOptions => 'Več možnosti';

  @override
  String get guildMenuInviteMembers => 'Povabi člane';

  @override
  String get guildMenuCommunitySettings => 'Nastavitve skupnosti';

  @override
  String get guildMenuEditCommunityProfile => 'Uredi profil skupnosti';

  @override
  String get guildMenuUnmuteCommunity => 'Prekini utišanje skupnosti';

  @override
  String get guildMenuMuteCommunity => 'Utišaj skupnost';

  @override
  String get guildMenuHideMutedChannels => 'Skrij utišane kanale';

  @override
  String get guildMenuReportCommunity => 'Prijavi skupnost';

  @override
  String get guildMenuDebugCommunity => 'Odstrani napake v skupnosti';

  @override
  String get guildMenuCopyCommunityId => 'Kopiraj ID skupnosti';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Do $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Splošno';

  @override
  String get guildMenuSettingsRoles => 'Vloge in dovoljenja';

  @override
  String get guildMenuSettingsEmoji => 'Emodžiji po meri';

  @override
  String get guildMenuSettingsStickers => 'Nalepke po meri';

  @override
  String get guildMenuSettingsSafetyModeration => 'Varnost in moderiranje';

  @override
  String get guildMenuSettingsActivityLog => 'Dnevnik dejavnosti';

  @override
  String get guildMenuSettingsWebhooks => 'Spletni kljuki';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'URL-ji po meri za povabila';

  @override
  String get guildMenuSettingsDiscovery => 'Odkrivanje';

  @override
  String get guildMenuSettingsMembers => 'Člani';

  @override
  String get guildMenuSettingsInviteLinks => 'Povezave za povabila';

  @override
  String get guildMenuSettingsBans => 'Prepovedi';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Nimate dovoljenja za ogled tega zavihka z nastavitvami.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikona';

  @override
  String get guildSettingsUploadImage => 'Naloži sliko';

  @override
  String get guildSettingsOverviewBannerTitle => 'Pasica';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Naložite pasico za svoj strežnik.';

  @override
  String get guildSettingsOverviewNameTitle => 'Ime';

  @override
  String get guildSettingsOverviewNameHint => 'Moja odlična skupnost';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistika';

  @override
  String get guildSettingsOverviewMembers => 'Člani';

  @override
  String get guildSettingsOverviewOnline => 'Na spletu';

  @override
  String get guildSettingsRolesDescription =>
      'Uporabite vloge za združevanje članov in dodeljevanje dovoljenj.';

  @override
  String get guildSettingsCreateRole => 'Ustvari vlogo';

  @override
  String get guildSettingsRolesListTitle => 'Vloge';

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
    return '$staticCount statičnih, $animatedCount animiranih mest za emodžije zasedenih';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Še ni emodžijev po meri.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count nalepk naloženih';
  }

  @override
  String get guildSettingsStickersEmpty => 'Še ni nalepk po meri.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Preverjanje članov';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Izberite, kaj morajo člani imeti, preden lahko objavljajo ali pošiljajo neposredna sporočila članom skupnosti.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Člani z vlogami lahko zaobidejo te preglede. Za javne prostore priporočamo omogočanje preverjanja.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Skupnosti, navedene v Odkrivanju, zahtevajo vsaj potrjen e-poštni naslov. Nobenega ne morete izbrati, medtem ko je Odkrivanje omogočeno.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Vsebina za odrasle in opozorila o vsebini';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigurirajte označevanje vsebine za odrasle in neobvezna opozorila o vsebini za člane.';

  @override
  String get guildSettingsModerationMatureToggle => 'Vsebina za odrasle';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Označite to skupnost kot vsebujočo vsebino za odrasle.';

  @override
  String get guildSettingsVerificationNone => 'Brez';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Preverjanje ni potrebno.';

  @override
  String get guildSettingsVerificationLow => 'Nizko';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Zahteva potrjen e-poštni naslov.';

  @override
  String get guildSettingsVerificationMedium => 'Srednje';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Zahteva potrjen e-poštni naslov in račun, star vsaj 5 minut.';

  @override
  String get guildSettingsVerificationHigh => 'Visoko';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Zahteva vse iz srednje ravni, plus članstvo v skupnosti vsaj 10 minut.';

  @override
  String get guildSettingsVerificationHighest => 'Zelo visoko';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Zahteva potrjeno telefonsko številko.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Sledite dejanjem moderatorjev v skupnosti.';

  @override
  String get guildSettingsAuditLogEmpty => 'Še ni dnevnikov';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Dejanja moderiranja in spremembe skupnosti se bodo prikazale tukaj.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Vsi uporabniki';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Vsa dejanja';

  @override
  String get guildSettingsAuditLogNoReason => 'Ni bil podan razlog.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Neznan uporabnik';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Pri nalaganju dnevnika dejavnosti je prišlo do napake.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Ne morem naložiti dnevnikov dejavnosti';

  @override
  String get guildSettingsAuditLogReason => 'Razlog';

  @override
  String get guildSettingsAuditLogSomeone => 'nekdo';

  @override
  String get guildSettingsAuditLogSomething => 'nekaj';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'neznana entiteta';

  @override
  String get guildSettingsAuditLogNothing => 'nič';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Neznan cilj';

  @override
  String get auditLogActionGuildUpdate => 'Skupnost posodobljena';

  @override
  String get auditLogActionChannelCreate => 'Kanal ustvarjen';

  @override
  String get auditLogActionChannelUpdate => 'Kanal posodobljen';

  @override
  String get auditLogActionChannelDelete => 'Kanal izbrisan';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Nadrejenost kanala dodana';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Nadrejenost kanala posodobljena';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Nadrejenost kanala odstranjena';

  @override
  String get auditLogActionMemberKick => 'Član izključen';

  @override
  String get auditLogActionMemberPrune => 'Člani odstranjeni';

  @override
  String get auditLogActionMemberBanAdd => 'Član prepovedan';

  @override
  String get auditLogActionMemberBanRemove => 'Član odvezan prepovedi';

  @override
  String get auditLogActionMemberUpdate => 'Član posodobljen';

  @override
  String get auditLogActionMemberRoleUpdate => 'Vloge članov posodobljene';

  @override
  String get auditLogActionMemberMove => 'Član premaknjen';

  @override
  String get auditLogActionMemberDisconnect => 'Član odklopljen';

  @override
  String get auditLogActionBotAdd => 'Bot dodan';

  @override
  String get auditLogActionRoleCreate => 'Vloga ustvarjena';

  @override
  String get auditLogActionRoleUpdate => 'Vloga posodobljena';

  @override
  String get auditLogActionRoleDelete => 'Vloga izbrisana';

  @override
  String get auditLogActionInviteCreate => 'Povabilo ustvarjeno';

  @override
  String get auditLogActionInviteUpdate => 'Povabilo posodobljeno';

  @override
  String get auditLogActionInviteDelete => 'Povabilo izbrisano';

  @override
  String get auditLogActionWebhookCreate => 'Spletni kavelj ustvarjen';

  @override
  String get auditLogActionWebhookUpdate => 'Spletni kavelj posodobljen';

  @override
  String get auditLogActionWebhookDelete => 'Spletni kavelj izbrisan';

  @override
  String get auditLogActionEmojiCreate => 'Emodži ustvarjen';

  @override
  String get auditLogActionEmojiUpdate => 'Emodži posodobljen';

  @override
  String get auditLogActionEmojiDelete => 'Emodži izbrisan';

  @override
  String get auditLogActionStickerCreate => 'Nalepka ustvarjena';

  @override
  String get auditLogActionStickerUpdate => 'Nalepka posodobljena';

  @override
  String get auditLogActionStickerDelete => 'Nalepka izbrisana';

  @override
  String get auditLogActionMessageDelete => 'Sporočilo izbrisano';

  @override
  String get auditLogActionMessageBulkDelete => 'Sporočila izbrisana';

  @override
  String get auditLogActionMessagePin => 'Sporočilo pripeto';

  @override
  String get auditLogActionMessageUnpin => 'Sporočilo odpeto';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor je posodobil nastavitve skupnosti.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor je ustvaril kanal $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor je posodobil kanal $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor je izbrisal kanal $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor je dodal dovoljenja za kanal za $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je dodal dovoljenja za kanal za $target v kanalu $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor je posodobil dovoljenja za kanal za $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je posodobil dovoljenja za kanal za $target v kanalu $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor je odstranil dovoljenja za kanal za $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je odstranil dovoljenja za kanal za $target v kanalu $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor je izključil $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor je prepovedal $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor je preklical prepoved $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor je posodobil $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor je posodobil vloge za $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor je odstranil neaktivne člane.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor je odstranil člane, neaktivne $days dni.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor je premaknil $target v drug glasovni kanal.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je premaknil $target v $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor je odklopil $target iz glasovnega pogovora.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor je dodal bota $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor je ustvaril vlogo $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor je posodobil vlogo $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor je izbrisal vlogo $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor je ustvaril povabilo $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je ustvaril povabilo $target za kanal $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor je posodobil povabilo $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je posodobil povabilo $target za kanal $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor je izbrisal povabilo $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je izbrisal povabilo $target za kanal $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor je ustvaril spletni kavelj $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor je posodobil spletni kavelj $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor je izbrisal spletni kavelj $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor je dodal emojija $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor je posodobil emojija $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor je izbrisal emojija $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor je dodal nalepko $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor je posodobil nalepko $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor je izbrisal nalepko $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor je izbrisal sporočilo.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor je izbrisal sporočilo v kanalu $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor je izbrisal več sporočil.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor je izbrisal $count sporočil.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor je izbrisal več sporočil v kanalu $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor je izbrisal $count sporočil v kanalu $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor je pripenil sporočilo.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor je pripenil sporočilo v kanalu $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor je odpenil sporočilo.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor je odpenil sporočilo v kanalu $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor je izvedel dejanje nadzora nad $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Posodobljeno polje $field iz $oldValue v $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Nastavljeno polje $field na $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Počiščeno polje $field (je bilo $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Posodobljeno polje $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Skupnost preimenovana v $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Posodobljena ikona skupnosti.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Kanal preimenovan v $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Počiščena tema.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Tema posodobljena na $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Omogočena vsebina za odrasle.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Onemogočena vsebina za odrasle.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Vzdevek nastavljen na $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Vzdevek $nickname odstranjen.';
  }

  @override
  String get auditLogChangeMutedMember => 'Član utišan.';

  @override
  String get auditLogChangeUnmutedMember => 'Član odzvojen.';

  @override
  String get auditLogChangeDeafenedMember => 'Član ogljušen.';

  @override
  String get auditLogChangeUndeafenedMember => 'Član odglušnjen.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Dodani $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Odstranjeni $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Sporočilo: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Povabil: $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Izbrisanih # sporočil.',
      one: 'Izbrisano # sporočilo.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odstranjenih # članov.',
      one: 'Odstranjen # član.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'To povabilo nikoli ne poteče.';

  @override
  String get auditLogOptionTemporaryMembership => 'Podeljuje začasno članstvo.';

  @override
  String get auditLogOptionPermanentMembership => 'Podeljuje trajno članstvo.';

  @override
  String get guildSettingsLoadMore => 'Naloži več';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Upravljajte spletne kljuke, ki objavljajo sporočila v kanale.';

  @override
  String get guildSettingsWebhooksEmpty => 'Konfiguriranih ni spletnih kljuk.';

  @override
  String get guildSettingsCopyUrl => 'Kopiraj URL';

  @override
  String get guildSettingsCopiedUrl => 'URL kopiran v odložišče';

  @override
  String get guildSettingsDeleteWebhook => 'Izbriši spletno kljuko';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Nastavite povezavo za povabila po meri za vaš strežnik.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Shrani';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Uporaba';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count uporab';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Prijavite se, da boste uvrščeni v odkritje strežnikov.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Za prijavo potrebujete vsaj $count članov.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Prijava';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Status';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorija';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Opis';

  @override
  String get guildSettingsDiscoveryTags => 'Oznake';

  @override
  String get guildSettingsDiscoveryTagsHint => 'igre, umetnost, glasba';

  @override
  String get guildSettingsDiscoveryApply => 'Pošlji prijavo';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Prekliči';

  @override
  String get guildSettingsMembersDescription =>
      'Iskanje in upravljanje članov strežnika.';

  @override
  String get guildSettingsMembersSearchHint => 'Išči člane';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count članov';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Ogled in preklic aktivnih povezav za povabila.';

  @override
  String get guildSettingsInvitesEmpty => 'Ni aktivnih povabil.';

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
    return '$uses / $maxUses uporab';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Poteče $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Ogled in upravljanje prepovedanih uporabnikov.';

  @override
  String get guildSettingsBansSearchHint => 'Išči prepovedi';

  @override
  String get guildSettingsBansEmpty => 'Ni prepovedanih uporabnikov.';

  @override
  String get guildSettingsBanPermanent => 'Trajna prepoved';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Poteče $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Poteče';

  @override
  String get guildSettingsUnban => 'Odstrani prepoved';

  @override
  String get guildSettingsBansLoading => 'Nalaganje prepovedanih uporabnikov';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Ni prepovedi, ki bi ustrezale vašemu iskanju.';

  @override
  String get guildSettingsBanDetailsTitle => 'Podrobnosti prepovedi';

  @override
  String get guildSettingsBanViewDetails => 'Ogled podrobnosti';

  @override
  String get guildSettingsBannedOn => 'Prepovedano ob';

  @override
  String get guildSettingsBannedBy => 'Prepovedal';

  @override
  String get guildSettingsRevokeBanTitle => 'Prekliči prepoved';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Ali ste prepričani, da želite preklicati prepoved za $displayName? Ponovno se bo lahko pridružil skupnosti.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Preklicana prepoved za $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Prepoved ni bilo mogoče naložiti. Poskusite znova.';

  @override
  String get guildSettingsRevokeBanError =>
      'Prepovedi ni bilo mogoče preklicati. Poskusite znova.';

  @override
  String get guildSettingsCommunitySettings => 'Nastavitve skupnosti';

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
      'Upravljajte profil, kanale in privzete nastavitve vaše skupnosti.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Blagovna znamka';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Posodobite ikono, ime, pasico in ozadje povabila';

  @override
  String get guildSettingsOverviewBannerUpload => 'Naloži pasico';

  @override
  String get guildSettingsOverviewIdleTitle => 'Nastavitve nedejavnosti';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfigurirajte AFK kanal in časovno omejitev';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistem in dobrodošlica';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Izberite cilj za sistemska in pozdravna sporočila';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Privzete obvestila';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Skupnosti z več kot 250 člani so prisiljene na nastavitev »samo omenitve«. Vaša prvotna nastavitev je ohranjena in bo obnovljena, če bo skupnost padla pod 250 članov.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Napredno';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Dovoli prožno poimenovanje besedilnih kanalov';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Skrij krono lastnika skupnosti';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Ločena pasica';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Prikaže pasico v ločenem razdelku pod glavo skupnosti.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Naloži ikono';

  @override
  String get guildSettingsOverviewRemoveImage => 'Odstrani';

  @override
  String get guildSettingsOverviewSplashTitle => 'Ozadje povabila';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Ozadje za vdelavo v klepet';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Prikaže se v povabilih v klepetu.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Naloži ozadje';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Ni pasice skupnosti';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Ni ozadja povabila';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Predogled';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Oglejte si, kako vaše povabilo izgleda obiskovalcem.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Imena besedilnih kanalov';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Kronica lastnika skupnosti';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigurirajte, ali je ikona kronice prikazana ob lastniku skupnosti';

  @override
  String get guildSettingsSplashCardAlignment => 'Poravnava kartice';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Sredina';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Levo';

  @override
  String get guildSettingsSplashAlignmentRight => 'Desno';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Velja samo na širokih zaslonih.';

  @override
  String get permissionReadMessageHistory => 'Preberi zgodovino sporočil';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Spremeni, kaj lahko vidijo uporabniki brez \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Uporabite namenski modal za nastavitev datuma mejnika zgodovine sporočil za člane, ki nimajo dovoljenja $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Odpri mejnik zgodovine sporočil';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Mejnik zgodovine sporočil';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Omogoči mejnik zgodovine sporočil';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Datum mejnika';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Člani brez dovoljenja Preberi zgodovino sporočil si lahko ogledajo sporočila, poslana po tem datumu.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Mejnik zgodovine sporočil posodobljen';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Dovoli velike črke in presledke v imenih besedilnih kanalov. Izklopljeno omeji imena na male črke s pomišljicami in podčrtaji.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Skrije ikono kronice ob lastniku skupnosti na vseh mestih.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animirane ikone zahtevajo funkcijo skupnosti Animiranih ikon.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animirane pasice zahtevajo funkcijo skupnosti Animiranih pasic.';

  @override
  String get guildSettingsAfkChannel => 'AFK / kanal v mirovanju';

  @override
  String get guildSettingsAfkChannelHint =>
      'Premakni člane v ta kanal, ko so AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Ni AFK kanala';

  @override
  String get guildSettingsAfkTimeout => 'AFK časovna omejitev';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minuta';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minut';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minut';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minut';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 ura';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekund';
  }

  @override
  String get guildSettingsSystemChannel => 'Ciljni kanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Sporočila dobrodošlice in sistemska sporočila se bodo prikazala tukaj.';

  @override
  String get guildSettingsNoSystemChannel => 'Ni sistemskega kanala';

  @override
  String get guildSettingsHideJoinMessages => 'Skrij sporočila o pridružitvi';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Skrije sporočila o pridružitvi v ciljnem kanalu.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Privstavne nastavitve obvestil';

  @override
  String get guildSettingsNotificationsAll => 'Vsa sporočila';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Obvesti o vseh sporočilih';

  @override
  String get guildSettingsNotificationsMentions => 'Samo omembe';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Obvesti samo ob omembah';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Največ 10 MB. Najmanj: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Največ 10 MB. Najmanj: 960×540px (16:9). Prikazano v vabljenih vdelavah v klepetu.';

  @override
  String get guildSettingsModerationDescription =>
      'Konfigurirajte nastavitve preverjanja, filtriranja vsebine in zrele vsebine.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Skupnostim, navedenim v Odkrivanju, so omejene možnosti moderiranja.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Filtriranje vsebine';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Samodejno pregledujte sporočila glede eksplicitne vsebine v kanalih, ki niso označeni kot zrela vsebina.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Skupnosti, navedene v Odkrivanju, morajo pregledovati vse člane. Te nastavitve ni mogoče spremeniti, ko je Odkrivanje omogočeno.';

  @override
  String get guildSettingsContentFilterOff => 'Izklopljeno';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Pustite skupnosti, da se sama moderira';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtriraj člane brez vlog';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Priporočeno za večino skupnosti';

  @override
  String get guildSettingsContentFilterAll => 'Filtriraj vse';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Največja zaščita za družinam prijazne prostore';

  @override
  String get guildSettingsModerationMatureOff => 'Izklopljeno';

  @override
  String get guildSettingsModerationMatureOn => 'Vklopljeno';

  @override
  String get guildSettingsContentWarningToggle => 'Prikaži opozorilo o vsebini';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Preklopi poziv k privolitvi pred vstopom v kateri koli kanal.';

  @override
  String get guildSettingsContentWarningText => 'Besedilo opozorila po meri';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'To vsebuje občutljivo vsebino.';

  @override
  String get guildSettingsModeration2faTitle => 'Zahteva za 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Zahtevajte dvofaktorsko overjanje za moderatorje, preden lahko prepovedo, izključijo, začasno izključijo ali odstranijo sporočila.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Zahtevaj 2FA za moderatorska dejanja';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'To nastavitev lahko spremeni samo lastnik skupnosti';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Omogočite 2FA v svojem računu, da spremenite to nastavitev';

  @override
  String get guildSettingsEmojiSearchHint => 'Išči emojije';

  @override
  String get guildSettingsEmojiUploadTitle => 'Naloži emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Neanimirani emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animirani emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Išči nalepke';

  @override
  String get guildSettingsWebhooksInfo =>
      'Ustvari spletne kljuke iz nastavitev kanala. Uredi jih tukaj.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Vaš URL po meri ne bo deloval, razen če je vsaj en kanal viden vsem.';

  @override
  String get guildSettingsVanityUrlRemove => 'Odstrani';

  @override
  String get guildSettingsBannedUsersTitle => 'Prepovedani uporabniki';

  @override
  String get guildSettingsInvitesTableInviter => 'Vabilec';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Koda';

  @override
  String get guildSettingsInvitesTableUses => 'Uporabe';

  @override
  String get guildSettingsInvitesTableCreated => 'Ustvarjeno';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Najnovejši prvi';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtriraj po uporabniku';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtriraj po dejanju';

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
