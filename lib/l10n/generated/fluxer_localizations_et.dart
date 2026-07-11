// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class FluxerLocalizationsEt extends FluxerLocalizations {
  FluxerLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get reconnectingTitle => 'Meil läks nihu!';

  @override
  String get reconnectingBody =>
      'Serverites on midagi valesti.\nPüüame seda kohe parandada!';

  @override
  String get gatewayReconnectingToast => 'Uuesti ühendamine…';

  @override
  String get gatewayConnectedToast => 'Ühendatud';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Käivitamine ebaõnnestus: $error';
  }

  @override
  String get retry => 'Proovi uuesti';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Ühendus katkes';

  @override
  String get splashViewOnStatusPage => 'Vaata oleku lehel';

  @override
  String get splashConnectionIssuesPrompt => 'Ühendusprobleemid?';

  @override
  String get splashStatusPageLink => 'Oleku leht';

  @override
  String get splashReadIncident => 'Loe intsidenti';

  @override
  String get splashIncidentHistory => 'Intsidentide ajalugu';

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
  String get welcomeBack => 'Tere tulemast tagasi';

  @override
  String get email => 'E-post';

  @override
  String get emailInvalid => 'Palun sisesta kehtiv e-posti aadress.';

  @override
  String get password => 'Parool';

  @override
  String get forgotPassword => 'Unustasid parooli?';

  @override
  String get logIn => 'Logi sisse';

  @override
  String get logInWithPasskey => 'Logi sisse võtmega';

  @override
  String continueWithSso(String provider) {
    return 'Jätka $provider kaudu';
  }

  @override
  String get ssoRequired => 'Sellele instansile juurdepääsuks on SSO nõutav.';

  @override
  String get organizationSsoProvider =>
      'Logi sisse oma organisatsiooni ühtse sisselogimise pakkujaga.';

  @override
  String get failedToStartSso => 'SSO käivitamine ebaõnnestus';

  @override
  String get ssoCancelled => 'SSO sisselogimine tühistati';

  @override
  String preferSso(String provider) {
    return 'Eelistad kasutada SSO-d? Jätka $provider kaudu.';
  }

  @override
  String get logInViaBrowser => 'Logi sisse brauseri kaudu';

  @override
  String get needAccountPrompt => 'Pole kontot? ';

  @override
  String get register => 'Registreeru';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Kinnita, et oled inimene';

  @override
  String get captchaDescription =>
      'Peame veenduma, et sa pole bot. Palun täida allolev kinnitus.';

  @override
  String get captchaSwitchToHcaptcha => 'Probleemid? Proovi hoopis hCaptcha-t';

  @override
  String get captchaSwitchToTurnstile => 'Proovi hoopis Turnstile\'i';

  @override
  String get cancel => 'Tühista';

  @override
  String get ipAuthCheckEmail => 'Kontrolli oma e-posti';

  @override
  String ipAuthDescription(String email) {
    return 'Saatsime e-kirja lingiga selle sisselogimise volitamiseks. Palun ava oma postkast aadressil $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Ühendus katkes';

  @override
  String get ipAuthConnectionLostDescription =>
      'Kaotasime ühenduse volituse ootamise ajal. Palun proovi uuesti.';

  @override
  String get ipAuthLinkExpired => 'Sisselogimise link aegus';

  @override
  String get ipAuthLinkExpiredDescription =>
      'See volituslink aegus. Palun logi uuesti sisse.';

  @override
  String get ipAuthResendEmail => 'Saada e-kiri uuesti';

  @override
  String get ipAuthResent => 'Saadeti uuesti';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Tagasi';

  @override
  String get mfaTitle => 'Kahefaktoriline autentimine';

  @override
  String get mfaChooseMethod => 'Vali kinnitusmeetod';

  @override
  String get mfaMethodTotp => 'Autentimisrakendus';

  @override
  String get mfaMethodWebauthn => 'Turvavõti / Võti';

  @override
  String get mfaTotpDescription =>
      'Sisesta 6-kohaline kood oma autentimisrakendusest või üks sinu varukoodidest.';

  @override
  String get mfaCodeLabel => 'Kood';

  @override
  String get mfaTryAnotherMethod => 'Proovi teist meetodit';

  @override
  String get mfaUseSecurityKey => 'Proovi turvavõtit / pääsukoodi asemel';

  @override
  String get accountSelectorTitle => 'Vali konto';

  @override
  String get accountSelectorDescription =>
      'Vali jätkamiseks konto või lisa teine.';

  @override
  String get accountAdd => 'Lisa konto';

  @override
  String get accountRemove => 'Eemalda';

  @override
  String accountRemoveTitle(String username) {
    return 'Eemalda $username';
  }

  @override
  String get accountRemoveDescription =>
      'See eemaldab selle konto salvestatud seansi.';

  @override
  String get accountRemoveOnlyDescription =>
      'See eemaldab ainsa salvestatud konto sellelt seadmelt.';

  @override
  String get accountExpired => 'Aegunud';

  @override
  String accountSessionExpired(String identifier) {
    return 'Seansi aegumine $identifier. Palun logi uuesti sisse.';
  }

  @override
  String get accountManageTitle => 'Hallake kontosid';

  @override
  String get accountSwitchFailed =>
      'Kontode vahetamine ebaõnnestus. Proovi uuesti.';

  @override
  String get profileTabMenuSwitchAccounts => 'Vaheta kontosid';

  @override
  String get statusChangeSheetTitle => 'Määra olek';

  @override
  String get statusOnlineStatusSection => 'Veebi olek';

  @override
  String get statusOnline => 'Veebis';

  @override
  String get statusIdle => 'Töötu';

  @override
  String get statusDnd => 'Ära sega';

  @override
  String get statusInvisible => 'Nähtamatu';

  @override
  String get statusOffline => 'Võrguühenduseta';

  @override
  String get statusUntilIChangeIt => 'Kuni ma seda muudan';

  @override
  String get statusDontClear => 'Ära tühista';

  @override
  String get statusFor10Seconds => '10 sekundiks';

  @override
  String get statusClearAfter10Seconds => '10 sekundit';

  @override
  String get statusClearAfter15Minutes => '15 minutit';

  @override
  String get statusClearAfter30Minutes => '30 minutit';

  @override
  String get statusClearAfter1Hour => '1 tund';

  @override
  String get statusClearAfter3Hours => '3 tundi';

  @override
  String get statusClearAfter4Hours => '4 tundi';

  @override
  String get statusClearAfter8Hours => '8 tundi';

  @override
  String get statusClearAfter24Hours => '24 tundi';

  @override
  String get statusClearAfter3Days => '3 päeva';

  @override
  String get statusDndDescription => 'Sa ei saa töölaual teateid';

  @override
  String get statusInvisibleDescription => 'Sa näid võrguühenduseta';

  @override
  String get customStatusSetTitle => 'Määra kohandatud olek';

  @override
  String get customStatusCurrentHint => 'Kohandatud olek';

  @override
  String get customStatusClear => 'Tühjenda kohandatud olek';

  @override
  String get customStatusPlaceholder => 'Mis toimub?';

  @override
  String get customStatusChooseEmoji => 'Vali emotikon';

  @override
  String get customStatusClearAfter => 'Tühjenda pärast';

  @override
  String get customStatusSave => 'Salvesta';

  @override
  String get accountActive => 'Aktiivne konto';

  @override
  String get signOut => 'Logi välja';

  @override
  String get suspendedPermanentTitle => 'Konto on jäädavalt peatatud';

  @override
  String get suspendedTemporaryTitle => 'Konto on peatatud';

  @override
  String get suspendedPermanentDescription =>
      'Teie konto on jäädavalt peatatud meie teenusetingimuste rikkumise tõttu.';

  @override
  String get suspendedTemporaryDescription =>
      'Teie konto on ajutiselt peatatud. Saate oma kontole juurde pääseda, kui peatuse periood lõpeb.';

  @override
  String get suspendedIssuedAt => 'Välja antud';

  @override
  String get suspendedEndsAt => 'Lõpeb';

  @override
  String get suspendedDuration => 'Kestus';

  @override
  String get suspendedPermanent => 'Püsiv';

  @override
  String get suspendedReason => 'Põhjus';

  @override
  String get suspendedAppealDeadline => 'Apellatsiooni tähtaeg';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Teie konto kustutamine on kavandatud $date.';
  }

  @override
  String get suspendedRecheck => 'Kontrolli värskendusi';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Proovi uuesti ${seconds}s pärast';
  }

  @override
  String get suspendedBackToLogin => 'Tagasi sisselogimisse';

  @override
  String get suspendedAppealTitle => 'Apellatsioon';

  @override
  String get suspendedAppealHint =>
      'Selgitage, miks teie peatust tuleks uuesti kaaluda (vähemalt 50 tähemärki)...';

  @override
  String get suspendedAppealSubmit => 'Esita apellatsioon';

  @override
  String get suspendedAppealPending => 'Ootel ülevaatamiseks';

  @override
  String get suspendedAppealAccepted => 'Apellatsioon vastu võetud';

  @override
  String get suspendedAppealRejected => 'Apellatsioon tagasi lükatud';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Teie apellatsioon on vastu võetud ja teie konto on taastatud.';

  @override
  String get suspendedSignIn => 'Logi oma kontole sisse';

  @override
  String get forgotPasswordTitle => 'Unustasite parooli?';

  @override
  String get forgotPasswordDescription =>
      'Sisestage oma e-posti aadress ja saadame teile lingi parooli lähtestamiseks.';

  @override
  String get forgotPasswordSubmit => 'Saada lähtestamise link';

  @override
  String get forgotPasswordSentTitle => 'Kontrollige oma e-posti';

  @override
  String get forgotPasswordSentDescription =>
      'Oleme saatnud teie e-posti aadressile juhised parooli lähtestamiseks. Palun kontrollige oma postkasti ja järgige parooli lähtestamiseks linki.';

  @override
  String get forgotPasswordBackToLogin => 'Tagasi sisselogimisse';

  @override
  String get resetPasswordTitle => 'Määra uus parool';

  @override
  String get resetPasswordDescription =>
      'Parooli lähtestamise protsessi lõpuleviimiseks sisestage allpool oma uus parool.';

  @override
  String get resetPasswordNewPassword => 'Uus parool';

  @override
  String get resetPasswordConfirm => 'Kinnita uus parool';

  @override
  String get resetPasswordSubmit => 'Lähtesta parool';

  @override
  String get resetPasswordMismatch => 'Paroolid ei ühti.';

  @override
  String get registerTitle => 'Loo konto';

  @override
  String get registerDisplayName => 'Kuvatav nimi (valikuline)';

  @override
  String get registerDisplayNameHint => 'Kuidas peaksid inimesed teid kutsuma?';

  @override
  String get registerUsername => 'Kasutajanimi (valikuline)';

  @override
  String get registerUsernameHint =>
      'Jätke tühjaks juhusliku kasutajanime saamiseks';

  @override
  String get registerUsernameTagHint =>
      'Unikaalsuse tagamiseks lisatakse automaatselt 4-kohaline silt';

  @override
  String get registerDateOfBirth => 'Sünniaeg';

  @override
  String get registerMonth => 'Kuu';

  @override
  String get registerDay => 'Päev';

  @override
  String get registerYear => 'Aasta';

  @override
  String get registerConsent =>
      'Olen nõus teenusetingimuste ja privaatsuspoliitikaga';

  @override
  String get registerConsentPrefix => 'Olen nõus ';

  @override
  String get registerConsentTerms => 'teenusetingimustega';

  @override
  String get registerConsentAnd => ' ja ';

  @override
  String get registerConsentPrivacy => 'privaatsuspoliitikaga';

  @override
  String get registerConfirmPassword => 'Kinnita parool';

  @override
  String get registerSubmit => 'Loo konto';

  @override
  String get registerHaveAccount => 'Kas teil on juba konto? ';

  @override
  String get passkeyNoCredentials =>
      'Selle rakenduse jaoks pole võtmeid leitud. Logige sisse hoopis e-posti ja parooliga.';

  @override
  String get passkeyDeviceNotSupported => 'Seda seadet ei toetata.';

  @override
  String get passkeyDomainNotAssociated =>
      'Selle rakenduse jaoks pole võtmeid konfigureeritud. Logige sisse hoopis e-posti ja parooliga.';

  @override
  String get passkeyTimeout =>
      'Võtme autentimine aegus. Palun proovige uuesti.';

  @override
  String get passkeyNotAvailable =>
      'Selle rakenduse jaoks pole võtmeid saadaval. Logige sisse hoopis e-posti ja parooliga.';

  @override
  String get passkeyFailed => 'Passkey autentimine nurjus. Proovige uuesti.';

  @override
  String get errorUnableToCreateAccount =>
      'Konto loomine ebaõnnestus. Proovige uuesti.';

  @override
  String get errorUnableToSignIn =>
      'Sisselogimine pole praegu võimalik. Proovige uuesti.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Vigane e-posti aadress või parool.';

  @override
  String get errorUnableToSendResetLink =>
      'Lähtestamislingi saatmine ebaõnnestus. Proovige uuesti.';

  @override
  String get errorUnableToResetPassword =>
      'Parooli lähtestamine ebaõnnestus. Proovige uuesti.';

  @override
  String get embedInviteJoin => 'Liitu kogukonnaga';

  @override
  String get embedInviteGoTo => 'Mine kogukonda';

  @override
  String embedInviteOnline(String count) {
    return '$count võrgus';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count liiget';
  }

  @override
  String get embedInviteUnknownTitle => 'Tundmatu kutse';

  @override
  String get embedInviteUnknownSubtitle => 'Proovige küsida uut kutset.';

  @override
  String get embedInviteUnavailable => 'Kutse pole saadaval';

  @override
  String get inviteAcceptTitle => 'Oled kutsutud liituma';

  @override
  String get inviteAcceptJoinButton => 'Liitu kogukonnaga';

  @override
  String get inviteAcceptGoToButton => 'Mine kogukonda';

  @override
  String get inviteAcceptInvitesPaused => 'Kutsed on peatatud';

  @override
  String get inviteAcceptNotFoundTitle => 'Kutse on vigane';

  @override
  String get inviteAcceptNotFoundDescription =>
      'See kutse võib olla aegunud või vigane.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Liitu grupiga';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Oled kutsutud grupivestlusse $inviterName poolt';
  }

  @override
  String get inviteAcceptSomeone => 'keegi';

  @override
  String get inviteAcceptEmojiPack => 'Emotikonide pakett';

  @override
  String get inviteAcceptStickerPack => 'Kleebisepakett';

  @override
  String get inviteAcceptInstallEmojiPack => 'Installi emotikonide pakett';

  @override
  String get inviteAcceptInstallStickerPack => 'Installi kleebisepakett';

  @override
  String get inviteAcceptPackInstallNote =>
      'Selle kutse vastuvõtmine installib paketi automaatselt.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Kanalile ligipääs keelatud';

  @override
  String get channelAccessDeniedDescription =>
      'Teil puudub juurdepääs kanalile, kus see sõnum saadeti.';

  @override
  String get messageJumpLinkNoAccess => 'Pole ligipääsu';

  @override
  String get okay => 'Olgu';

  @override
  String get embedThemeTitle => 'Jagatud teema';

  @override
  String get embedThemeSubtitle => 'See klient ei toeta kohandatud teemasid.';

  @override
  String get embedThemeUnavailableButton => 'Teemad pole saadaval';

  @override
  String get privacySettings => 'Privaatsussätted';

  @override
  String get privacyDirectMessages => 'Otsesõnumid';

  @override
  String get privacyDirectMessagesDescription =>
      'Luba selle kogukonna teistelt liikmetelt otsesõnumeid';

  @override
  String get privacyBotDirectMessages => 'Boti otsesõnumid';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Luba selle kogukonna botidel teile otsesõnumeid saata';

  @override
  String get privacyMutualDmsDisabled =>
      'Kogukonna administraatorid on keelanud otsesõnumite saamise ainult selle kogukonna vastastikustelt liikmetelt.';

  @override
  String get communityDebug => 'Kogukonna silumine';

  @override
  String get copiedToClipboard => 'Kopeeritud lõikelauale';

  @override
  String get notificationSettings => 'Teavitussätted';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Vaigista $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Kogukonna vaigistamine takistab mitmepunktinäitajate ja teavituste kuvamist, välja arvatud juhul, kui teid mainitakse';

  @override
  String get notificationCommunitySettings => 'Kogukonna teavitussätted';

  @override
  String get notificationAllMessages => 'Kõik sõnumid';

  @override
  String get notificationOnlyMentions => 'Ainult mainimised';

  @override
  String get notificationNothing => 'Mitte midagi';

  @override
  String get notificationSuppressEveryone =>
      'Sellelt @everyone ja @here mainimised';

  @override
  String get notificationSuppressRoles => 'Summuta kõik rolli @mainimised';

  @override
  String get notificationMobilePush => 'Mobiilsed tõuketeated';

  @override
  String get notificationOverrides => 'Teavituste üleskatted';

  @override
  String get notificationSelectChannel => 'Vali kanal või kategooria';

  @override
  String get notificationOnlyAtMentions => 'Ainult @mainimised';

  @override
  String get notificationMuteChannel => 'Vaigista kanal';

  @override
  String get notificationUnmuteChannel => 'Vabasta kanal vaigistusest';

  @override
  String get notificationNoCategory => 'Pole kategooriat';

  @override
  String get dmMarkAsRead => 'Märgi loetuks';

  @override
  String get dmMuteConversation => 'Vaigista DM';

  @override
  String get dmUnmuteConversation => 'Vabasta DM vaigistusest';

  @override
  String get dmPinDm => 'Kinnita DM';

  @override
  String get dmUnpinDm => 'Eemalda DM kinnitustest';

  @override
  String get dmAlwaysShowInSidebar => 'Näita alati külgribal';

  @override
  String get dmRemoveFromAlwaysShown => 'Eemalda alati näidatud loendist';

  @override
  String get dmCloseDm => 'Sule DM';

  @override
  String get dmCloseDmConfirmTitle => 'Sule DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Kas olete kindel, et soovite oma DM-i kasutajaga $username sulgeda? Saate selle hiljem uuesti avada.';
  }

  @override
  String get dmCopyChannelId => 'Kopeeri kanali ID';

  @override
  String get dmChannelIdCopied => 'Kanali ID kopeeritud';

  @override
  String get dmCopyUserId => 'Kopeeri kasutaja ID';

  @override
  String get dmUserIdCopied => 'Kasutaja ID kopeeritud';

  @override
  String get dmViewProfile => 'Vaata profiili';

  @override
  String get dmVoiceCall => 'Alusta häälkõnet';

  @override
  String get incomingVoiceCallTitle => 'Saabuv häälkõne';

  @override
  String get incomingVoiceCallAccept => 'Vasta';

  @override
  String get incomingVoiceCallDecline => 'Keeldu';

  @override
  String get incomingVoiceCallLabel => 'Saabuv kõne';

  @override
  String get incomingVoiceCallIgnore => 'Ignoreeri';

  @override
  String get directVoiceCallNotEligible =>
      'Seda kõnet ei saa praegu alustada. Proovige mõne aja pärast uuesti.';

  @override
  String get voiceJoinCallFailed =>
      'Ei õnnestunud selle kõnega ühendust saada. Kontrollige oma ühendust ja proovige uuesti.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Ei õnnestunud selle kõnega ühendust saada. Kontrollige oma ühendust ja proovige uuesti.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Ei õnnestunud seda kõnet serveris värskendada. Kontrollige oma ühendust ja proovige uuesti.';

  @override
  String get dmAddNote => 'Lisa märge';

  @override
  String get dmEditGroup => 'Muuda gruppi';

  @override
  String get dmInviteToCommunity => 'Kutsu kogukonda';

  @override
  String get dmBlock => 'Blokeeri';

  @override
  String get dmLeaveGroup => 'Lahku grupist';

  @override
  String get dmNoCommunitiesAvailable => 'Kogukondi pole saadaval';

  @override
  String dmGroupMemberCount(int count) {
    return '$count liiget';
  }

  @override
  String get dmMuteFor15Min => '15 minutiks';

  @override
  String get dmMuteFor30Min => '30 minutiks';

  @override
  String get dmMuteFor1Hour => '1 tunniks';

  @override
  String get dmMuteFor3Hours => '3 tunniks';

  @override
  String get dmMuteFor4Hours => '4 tunniks';

  @override
  String get dmMuteFor8Hours => '8 tunniks';

  @override
  String get dmMuteFor24Hours => '24 tunniks';

  @override
  String get dmMuteFor3Days => '3 päevaks';

  @override
  String get dmMuteForever => 'Kuni taastamiseni';

  @override
  String get dmPinGroupDm => 'Kinnita grupivestlus';

  @override
  String get dmUnpinGroupDm => 'Eemalda grupivestluse kinnitus';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Lisa vestlus lemmikutesse';

  @override
  String get dmUnfavoriteDm => 'Eemalda vestlus lemmikutest';

  @override
  String get dmFavoriteGroupDm => 'Lisa grupivestlus lemmikutesse';

  @override
  String get dmUnfavoriteGroupDm => 'Eemalda grupivestlus lemmikutest';

  @override
  String get dmChangeFriendNickname => 'Muuda sõbra hüüdnime';

  @override
  String get dmRemoveFriend => 'Eemalda sõber';

  @override
  String get dmAddFriend => 'Lisa sõber';

  @override
  String get dmAcceptFriendRequest => 'Võta sõbrakutse vastu';

  @override
  String get dmIgnoreFriendRequest => 'Ignoreeri sõbrakutset';

  @override
  String get dmFriendRequestSent => 'Sõbrakutse saadetud';

  @override
  String get dmUnblock => 'Tühista blokeering';

  @override
  String get dmDebugUser => 'Debugi kasutajat';

  @override
  String get dmDebugChannel => 'Debugi kanalit';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Kinnitatud vestlus';

  @override
  String get dmUnpinned => 'Eemaldatud kinnitus vestluselt';

  @override
  String get dmMuted => 'Vaikne vestlus';

  @override
  String get dmUnmuted => 'Vestlus ei ole enam vaigistatud';

  @override
  String get dmRemoveFriendConfirmTitle => 'Eemalda sõber';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Kas olete kindel, et soovite eemaldada $username sõprade seast?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blokeeri kasutaja';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Kas olete kindel, et soovite blokeerida $username? Nad ei saa teile sõnumeid saata ega sõbrakutseid saata.';
  }

  @override
  String get dmFriendRequestSentToast => 'Sõbrakutse saadetud';

  @override
  String get dmFriendRequestFailed => 'Sõbrakutse saatmine ebaõnnestus';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Sõbrakutse vastuvõtmine ebaõnnestus';

  @override
  String get dmRemoveFriendFailed => 'Sõbra eemaldamine ebaõnnestus';

  @override
  String get dmBlockFailed => 'Kasutaja blokeerimine ebaõnnestus';

  @override
  String get dmUnblockFailed => 'Kasutaja blokeeringu tühistamine ebaõnnestus';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Sõbrakutse ignoreerimine ebaõnnestus';

  @override
  String get dmAddFriends => 'Lisa sõpru';

  @override
  String get addFriendSheetTitle => 'Lisa sõber';

  @override
  String get addFriendUsernameHint => 'Kasutajanimi#0000';

  @override
  String get addFriendUsernameLabel => 'Sõbra kasutajanimi';

  @override
  String get addFriendSendRequest => 'Saada kutse';

  @override
  String get addFriendNoUserFound =>
      'Sellise kasutajanimaga kasutajat ei leitud.';

  @override
  String get addFriendInvalidUsername =>
      'Sisestage kehtiv kasutajanimi (Kasutajanimi#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Sõbrakutse saadetud';

  @override
  String get addFriendClaimTitle => 'Väida oma konto';

  @override
  String get addFriendClaimDescription =>
      'Väida oma konto, et saata sõbrakutseid.';

  @override
  String get addFriendVerifyTitle => 'Kinnita oma e-post';

  @override
  String get addFriendVerifyDescription =>
      'Peate oma e-posti aadressi kinnitama, enne kui saate sõbrakutseid saata.';

  @override
  String get addFriendVerifyEmail => 'Kinnita e-post';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Saabunud sõbrakutsed ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Saadetud sõbrakutsed ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Saabunud sõbrakutse';

  @override
  String get addFriendOutgoingStatus => 'Sõbrakutse saadetud';

  @override
  String get addFriendViewProfile => 'Vaata profiili';

  @override
  String get addFriendAccept => 'Võta vastu';

  @override
  String get addFriendIgnore => 'Ignoreeri';

  @override
  String get addFriendAcceptTitle => 'Võta sõbrakutse vastu';

  @override
  String get addFriendIgnoreTitle => 'Ignoreeri sõbrakutse';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Kas aktsepteerida sõbrakutse kasutajalt $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Kas ignoreerida sõbrakutse kasutajalt $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Tühista kutse';

  @override
  String get addFriendCancelRequestFailed =>
      'Sõbrakutset ei õnnestunud tühistada. Proovi uuesti.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Nad ei aktsepteeri praegu sõbrakutseid.';

  @override
  String get addFriendUnblockFirst =>
      'Vabasta nad esmalt blokeeringust, et saata sõbrakutse.';

  @override
  String get addFriendCannotSendToSelf => 'Sa ei saa endale sõbrakutset saata.';

  @override
  String get addFriendAlreadyFriends => 'Te olete juba sõbrad.';

  @override
  String get addFriendClaimToSend =>
      'Lõpeta registreerumine, et saata sõbrakutseid.';

  @override
  String get addFriendSendFailedGeneric =>
      'Sõbrakutset ei õnnestunud saata. Proovi uuesti.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Süsteem';

  @override
  String get emojiSearchPlaceholder => 'Leia oma unistuste emotikon';

  @override
  String get emojiSearchEmpty => 'Emotikonid ei vasta sinu otsingule';

  @override
  String get emojiAutocompleteDefaultLabel => 'Vaikimisi emotikon';

  @override
  String get emojiFrequentlyUsed => 'Sagedasti kasutatud';

  @override
  String get emojiTabGifs => 'GIF-id';

  @override
  String get emojiTabMedia => 'Meedia';

  @override
  String get emojiTabStickers => 'Kleepsud';

  @override
  String get emojiTabEmojis => 'Emotikonid';

  @override
  String get gifPickerSearch => 'Otsi GIF-e';

  @override
  String get gifPickerSearchKlipy => 'Otsi KLIPY-t';

  @override
  String get gifPickerSearchTenor => 'Otsi Tenorit';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Lemmikud';

  @override
  String get gifPickerTrending => 'Populaarsed GIF-id';

  @override
  String get gifPickerNoResultsTitle => 'No Search Results';

  @override
  String get gifPickerNoResultsDescription => 'Try another search term';

  @override
  String get gifPickerLoadFailedTitle => 'Couldn\'t load GIFs';

  @override
  String get gifPickerLoadFailedBody => 'Check your connection and try again.';

  @override
  String get emojiCategoryPeople => 'Inimesed';

  @override
  String get emojiCategoryNature => 'Loodus';

  @override
  String get emojiCategoryFood => 'Toit ja jook';

  @override
  String get emojiCategoryActivity => 'Tegevused';

  @override
  String get emojiCategoryTravel => 'Reisimine ja kohad';

  @override
  String get emojiCategoryObjects => 'Esemed';

  @override
  String get emojiCategorySymbols => 'Sümbolid';

  @override
  String get emojiCategoryFlags => 'Lipud';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Ava $emojiCount ${communityCount}st Plutoniumiga.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Hangi Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Ära näita seda uuesti';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kohandatud emotikoni',
      one: '1 kohandatud emotikon',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kogukonda',
      one: '1 kogukond',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Välislingi hoiatus';

  @override
  String get externalLinkWarningLeaving => 'Olete lahkumas Fluxerist';

  @override
  String get externalLinkWarningDescription =>
      'Välislingid võivad olla ohtlikud. Palun olge ettevaatlik.';

  @override
  String get externalLinkWarningDestinationUrl => 'Sihtkoha URL:';

  @override
  String get externalLinksSectionTitle => 'Välislingid';

  @override
  String get externalLinksSectionDescription =>
      'Konfigureerige, kuidas välislinkide hoiatusi käsitletakse.';

  @override
  String get externalLinkWarningTrustPrefix => 'Usalda alati ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — jäta see hoiatus järgmisel korral vahele';

  @override
  String get externalLinkVisitSite => 'Külasta saiti';

  @override
  String get externalLinkTrustAllLabel => 'Usalda kõiki välislinke';

  @override
  String get externalLinkStripTrackingLabel =>
      'Eemalda URL-idest jälgimisparameetrid';

  @override
  String get externalLinkStripTrackingDescription =>
      'Eemaldab automaatselt jälgimisparameetrid (nagu utm_source, fbclid, gclid) sinu saadetavate linkide URL-idest. Puhastab lingi enne, kui see kellegi teiseni jõuab.';

  @override
  String get externalLinkTrustAllConfirmTitle => 'Usalda kõiki välislinke?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'See usaldab kõiki välislinke ja jätab iga domeeni hoiatused vahele. Sinu olemasolevad usaldatud domeenid asendatakse. See on vähem turvaline.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Usalda kõiki';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Lõpeta kõigi linkide usaldamine?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Välislinkide hoiatused kuvatakse uuesti. Peate usaldusväärsed domeenid lisama individuaalselt.';

  @override
  String get externalLinkStopTrustingAllAction => 'Keela usaldamine';

  @override
  String get externalLinkTrustedAllDescription =>
      'Kõiki välislinke usaldatakse. Hoiatusi ei kuvata.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Sul on $count usaldatud domeen(i). Lisa rohkem, märkides ruudu välislinke külastades.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Kui see on lubatud, ei kuvata ühtegi välislinkide hoiatusi. See on vähem turvaline.';

  @override
  String get imageFileTooLarge =>
      'Pildifail on liiga suur. Valige fail, mis on väiksem kui 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animeeritud avatari jaoks on vaja Plutoniumi';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animeeritud bannerite jaoks on vaja Plutoniumi';

  @override
  String get animatedAvifNotSupported => 'Animeeritud AVIF ei toeta';

  @override
  String get animatedAvifNotSupportedBody =>
      'Animeeritud AVIF-failide kärpimine ja pööramine pole veel toetatud. Kui jätkate, laaditakse see üles algsel kujul.';

  @override
  String get uploadAsIs => 'Laadi üles nagu on';

  @override
  String get croppingAnimatedNotSupported =>
      'Animeeritud piltide kärpimine pole veel toetatud. Kasutatakse algset üleslaadimist.';

  @override
  String get cropAvatar => 'Kärbi avatari';

  @override
  String get cropBanner => 'Kärbi bannerit';

  @override
  String get skip => 'Jäta vahele';

  @override
  String get crop => 'Kärbi';

  @override
  String get changeYourFluxerTag => 'Muuda oma FluxerTagi';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Kasutajanimed võivad sisaldada ainult tähti (a-z, A-Z), numbreid (0-9) ja allkriipse. Kasutajanimed ei ole tõstutundlikud.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Kasutajanimed võivad sisaldada ainult tähti (a-z, A-Z), numbreid (0-9) ja allkriipse. Kasutajanimed ei ole tõstutundlikud. Saate valida mis tahes saadaoleva 4-kohalise sildi vahemikus #0000 kuni #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Kasutajanimed võivad sisaldada ainult tähti (a-z, A-Z), numbreid (0-9) ja allkriipse. Kasutajanimed ei ole tõstutundlikud. Saate valida mis tahes saadaoleva 4-kohalise sildi vahemikus #0001 kuni #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Vahemikus $min kuni $max tähemärki';
  }

  @override
  String get validationAllowedChars =>
      'Ainult tähed (a-z, A-Z), numbrid (0-9) ja allkriipsud (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Hankige Plutonium, et kohandada oma silti või säilitada see kasutajanime muutmisel';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag on juba võetud';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminator on juba võetud. Jätkamisel teie number juhitakse automaatselt uuesti.';
  }

  @override
  String get customTagIsTemporary => 'Kohandatud silt on ajutine';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Teie kohandatud 4-kohaline silt on saadaval ainult teie Plutoniumi tellimuse kehtivuse ajal. Kui teie tellimus aegub $date, naaseb teie silt 3-päevase armuaja järel juhuslikult määratud numbrile.';
  }

  @override
  String get customTagTemporaryBody =>
      'Teie kohandatud 4-kohaline silt on saadaval ainult teie Plutoniumi tellimuse kehtivuse ajal. Kui teie tellimus aegub, naaseb teie silt 3-päevase armuaja järel juhuslikult määratud numbrile.';

  @override
  String get iUnderstandContinue => 'Saan aru, jätka';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Kui salvestate selle FluxerTagi, naaseb teie kohandatud 4-kohaline silt juhuslikule numbrile, kui teie Plutoniumi tellimus lõpeb. Kui teie tellimus ei uuene, on teil enne sildi muutumist 3-päevane armuaeg.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Teie kohandatud 4-kohaline silt (#$discriminator) on aktiivne teie Plutoniumi tellimuse kehtivuse ajal. Kui teie tellimus lõpeb või ei uuene pärast 3-päevast armuaega, naaseb teie silt juhuslikule numbrile.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Kohandage oma 4-kohalist silti või säilitage see kasutajanime muutmisel';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Teie Plutoniumi prooviversioon aegub $date. Uuendage, et säilitada oma kohandatud silt ja teenida oma profiilil märguanne.';
  }

  @override
  String get premiumTrialActive =>
      'Olete Plutoniumi prooviversioonil. Uuendage, et säilitada oma kohandatud silt ja teenida oma profiilil märguanne.';

  @override
  String get fluxerTagUpdated => 'FluxerTagi värskendati';

  @override
  String get fluxerTagUpdateFailed =>
      'FluxerTagi värskendamine ebaõnnestus. Proovige uuesti.';

  @override
  String get continueAction => 'Jätka';

  @override
  String get profileCustomizationTitle => 'Profiili kohandamine';

  @override
  String get profileCustomizationDescription =>
      'Muutke oma profiili välimust ja vaadake otse-eetris eelvaadet';

  @override
  String get usernameLabel => 'Kasutajanimi';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Kinnitage oma konto, et muuta oma FluxerTagi';

  @override
  String get changeFluxerTag => 'Muuda FluxerTagi';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Kohanda oma 4-kohaline tag (#$discriminator) Plutoniumiga oma maitse järgi';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Muuda oma kasutajanime ja 4-kohalist tagi';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Sinu kohandatud tag (#$discriminator) on seotud sinu Plutoniumi tellimusega ja muutub juhuslikuks tagiks, kui see aegub.';
  }

  @override
  String get displayNameLabel => 'Kuvatav nimi';

  @override
  String get pronounsLabel => 'Pronomid';

  @override
  String get avatarLabel => 'Avatari';

  @override
  String get changeAvatar => 'Muuda avatari';

  @override
  String get removeAvatar => 'Eemalda avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Soovitatav: 512×512px';

  @override
  String get bannerLabel => 'Bänner';

  @override
  String get changeBanner => 'Muuda bännerit';

  @override
  String get removeBanner => 'Eemalda bänner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Miinimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Aksentvärv';

  @override
  String get accentColorDescription =>
      'Kohandab sinu profiili piiri ja bänneri värvi';

  @override
  String get aboutMeLabel => 'Minust';

  @override
  String get aboutMeHelperText =>
      'Võid kasutada linke, emotikone ja Markdowni.';

  @override
  String get emojiPickerTitle => 'Emotikonid';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutoniumi märgi privaatsus';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Kontrolli, kuidas sinu Plutoniumi märki teistele kuvatakse';

  @override
  String get hidePlutoniumBadgeLabel => 'Peida Plutoniumi märgi täielikult';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Peida oma Plutoniumi märgi täielikult teistelt kasutajatelt';

  @override
  String get hidePlutoniumPurchaseDate => 'Peida Plutoniumi ostukuupäev';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Peida Plutoniumi ostukuupäev ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Eemalda oma Plutoniumi ostukuupäev oma märgilt';

  @override
  String get maskVisionaryAsSubscription => 'Maskeeri Visionary tellimusena';

  @override
  String get maskVisionaryDescription =>
      'Kuvatakse sinu Visionary tavalise tellimusena';

  @override
  String get hideVisionaryIdBadge => 'Peida Visionary ID märgi';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Peida Visionary ID märgi (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Eemalda oma Visionary ID märgi';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Oled Plutoniumi prooviversioonil — sinu tellimus algab $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Sinu tellimus algab automaatselt, kui sinu prooviversioon lõpeb. Midagi pole vaja teha.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Oled Plutoniumi prooviversioonil, mis aegub $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Oled Plutoniumi prooviversioonil';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10MB. Soovitatav: 512×512px. Animeeritud avatarid (GIF) nõuavad Plutoniumi.';

  @override
  String get bannerPlutoniumUpsell =>
      'Kohanda oma profiili staatilise või animeeritud bänneriga, et see silma paistaks.';

  @override
  String get getPlutonium => 'Hangi Plutoniumi';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Rakendusesisesed ostud pole sellel platvormil veel saadaval. Hoia silma peal — varsti tulemas!';

  @override
  String get profilePreviewLabel => 'Eelvaade';

  @override
  String get profilePreviewMessage => 'Sõnum';

  @override
  String get profilePreviewMemberSince => 'Fluxeri liige alates';

  @override
  String get unclaimedAccountTitle => 'Nõudmata konto';

  @override
  String get unclaimedAccountDescription =>
      'Sinu kontot pole veel nõutud. Ilma e-posti ja paroolita võid kaotada ligipääsu. Nõua oma konto kohe, et seda kaitsta.';

  @override
  String get claimAccount => 'Nõua konto';

  @override
  String get profileTypeLabel => 'Profiili tüüp';

  @override
  String get profileTypeGlobal => 'Globaalne profiil';

  @override
  String get profileTypeGuildDescription =>
      'Redigeerid oma kogukonnapõhist profiili. See profiil on nähtav ainult selles kogukonnas ja asendab sinu globaalse profiili.';

  @override
  String get communityNicknameLabel => 'Kogukonna hüüdnimi';

  @override
  String get perGuildPremiumUpsellText =>
      'Üksikute kogukondade jaoks avatari, riba, aktsentvärvi ja bio kohandamine nõuab Plutooniumit. Kogukonna hüüdnimi ja asesõnad on kõigile tasuta.';

  @override
  String get avatarModeInherit => 'Kasuta globaalset profiili';

  @override
  String get avatarModeCustom => 'Kasuta kohandatud pilti';

  @override
  String get avatarModeUnset => 'Ära näita';

  @override
  String get profileSavedToast => 'Profiil värskendatud';

  @override
  String get profileEditButton => 'Redigeeri profiili';

  @override
  String get profileNoteLabel => 'Märkus';

  @override
  String get profileNoteVisibility => '(nähtav ainult teile)';

  @override
  String get profileNoteEmpty => 'Märget pole veel.';

  @override
  String get sudoTitle => 'Kinnita oma isik';

  @override
  String get sudoDescription => 'See toiming nõuab jätkamiseks kinnitust.';

  @override
  String get sudoAuthenticatorCode => 'Autentimiskood';

  @override
  String get sudoMethodPassword => 'Parool';

  @override
  String get sudoMethodTotp => 'Autentija';

  @override
  String get sudoVerificationFailed =>
      'Kinnitamine ebaõnnestus. Palun proovige uuesti.';

  @override
  String get securityAccountTitle => 'Konto';

  @override
  String get securityAccountDescription =>
      'Hallake oma e-posti, parooli ja konto sätteid';

  @override
  String get securitySectionTitle => 'Turvalisus';

  @override
  String get securitySectionDescription =>
      'Kaitske oma kontot kahefaktorilise autentimise ja pääsukoodidega';

  @override
  String get securityLoginEmailSectionTitle => 'E-posti sätted';

  @override
  String get securityLoginEmailSectionDescription =>
      'Hallake e-posti aadressi, mida kasutate Fluxerisse sisselogimiseks';

  @override
  String get securityLoginEmailAddressLabel => 'E-posti aadress';

  @override
  String get securityLoginNoEmailSet => 'E-posti aadressi pole määratud';

  @override
  String get securityLoginChangeEmail => 'Muuda e-posti';

  @override
  String get securityLoginAddEmail => 'Lisa e-post';

  @override
  String get securityLoginReveal => 'Näita';

  @override
  String get securityLoginHide => 'Peida';

  @override
  String get securityLoginPasswordSectionTitle => 'Parool';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Muutke oma parooli, et hoida oma konto turvalisena';

  @override
  String get securityLoginCurrentPasswordLabel => 'Praegune parool';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Viimati muudetud: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Viimati muudetud: Mitte kunagi';

  @override
  String get securityLoginNoPasswordSet => 'Parooli pole määratud';

  @override
  String get securityLoginChangePassword => 'Muuda parooli';

  @override
  String get securityLoginSetPassword => 'Määra parool';

  @override
  String get passwordChangeTitle => 'Muuda parooli';

  @override
  String get passwordChangeIntroDescription =>
      'Saadame teie e-posti aadressile kinnituskoodi, et teie isikut enne parooli muutmist kinnitada.';

  @override
  String get passwordChangeStart => 'Alusta';

  @override
  String get passwordChangeVerifyTitle => 'Kinnita oma e-post';

  @override
  String get passwordChangeVerifyDescription =>
      'Sisestage oma e-posti aadressile saadetud kinnituskood.';

  @override
  String get passwordChangeVerificationCode => 'Kinnituskood';

  @override
  String get passwordChangeVerify => 'Kinnita';

  @override
  String get passwordChangeNewPasswordTitle => 'Määra uus parool';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Sisestage allpool oma uus parool.';

  @override
  String get passwordChangeNewPassword => 'Uus parool';

  @override
  String get passwordChangeConfirmPassword => 'Kinnita uus parool';

  @override
  String get passwordChangeSubmit => 'Muuda parooli';

  @override
  String get passwordChangeSuccess => 'Parool muudetud';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Paroolid ei ühti';

  @override
  String get passwordChangeInvalidCode => 'Kehtetu või aegunud kood';

  @override
  String get emailChangeTitle => 'Muuda meiliaadressi';

  @override
  String get emailChangeIntroDescription =>
      'Enne meiliaadressi muutmist saadame teie tuvastamiseks kinnituskoodid.';

  @override
  String get emailChangeStart => 'Alusta';

  @override
  String get emailChangeVerifyOriginalTitle => 'Kinnita praegune meiliaadress';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Sisestage oma praegusesse meiliaadressile saadetud kinnituskood.';

  @override
  String get emailChangeNewEmailTitle => 'Sisesta uus meiliaadress';

  @override
  String get emailChangeNewEmailDescription =>
      'Sisestage uus meiliaadress, mida soovite kasutada.';

  @override
  String get emailChangeNewEmailLabel => 'Uus meiliaadress';

  @override
  String get emailChangeNewEmailSubmit => 'Saada kinnituskood';

  @override
  String get emailChangeVerifyNewTitle => 'Kinnita uus meiliaadress';

  @override
  String get emailChangeVerifyNewDescription =>
      'Sisestage oma uuele meiliaadressile saadetud kinnituskood.';

  @override
  String get emailChangeSuccess => 'Meiliaadress muudetud';

  @override
  String get emailChangeInvalidCode => 'Kehtetu või aegunud kood';

  @override
  String get resend => 'Saada uuesti';

  @override
  String resendCountdown(int seconds) {
    return 'Saada uuesti (${seconds}s)';
  }

  @override
  String get verificationCode => 'Kinnitus kood';

  @override
  String get verify => 'Kinnita';

  @override
  String get enable => 'Luba';

  @override
  String get disable => 'Keela';

  @override
  String get delete => 'Kustuta';

  @override
  String get save => 'Salvesta';

  @override
  String get securityTfaSectionTitle => 'Kaheastmeline autentimine';

  @override
  String get securityTfaSectionDescription =>
      'Lisage oma kontole täiendav turvakiht';

  @override
  String get securityTfaAuthenticatorApp => 'Autentimisrakendus';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Kaheastmeline autentimine on lubatud';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Kasutage kaheastmeliseks autentimiseks koodide genereerimiseks autentimisrakendust';

  @override
  String get securityTfaBackupCodes => 'Varukoopiakoodid';

  @override
  String get securityTfaBackupCodesDescription =>
      'Vaadake ja hallake oma varukoopiakoode konto taastamiseks';

  @override
  String get securityTfaViewCodes => 'Vaata koode';

  @override
  String get securityPasskeysSectionTitle => 'Passiklahvid';

  @override
  String get securityPasskeysSectionDescription =>
      'Kasutage paroolivaba sisselogimise ja kaheastmelise autentimise jaoks passiklahve';

  @override
  String get securityPasskeysRegistered => 'Registreeritud passiklahvid';

  @override
  String get securityPasskeysNone => 'Passiklahve pole registreeritud';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passiklahvi',
      one: 'passiklahv',
    );
    return '$count $_temp0 registreeritud (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Lisa passiklahv';

  @override
  String securityPasskeysAdded(String date) {
    return 'Lisatud: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Viimati kasutatud: $date';
  }

  @override
  String get securityPasskeysRename => 'Nimeta ümber';

  @override
  String get securityPasskeysDeleteTitle => 'Kustuta passiklahv';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Kas olete kindel, et soovite passiklahvi „$name“ kustutada?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nimetage passiklahv';

  @override
  String get securityPasskeyNameLabel => 'Passiklahvi nimi';

  @override
  String get securityPasskeyNameHint => 'nt. YubiKey, iPhone, tööarvuti';

  @override
  String get securityPhoneSectionTitle => 'Telefoninumber';

  @override
  String get securityPhoneSectionDescription => 'Hallake oma telefoninumbrit';

  @override
  String get securityPhoneLabel => 'Telefoninumber';

  @override
  String get securityPhoneNone => 'Telefoninumbrit pole lisatud.';

  @override
  String get securityPhoneAdd => 'Lisa telefon';

  @override
  String get securityPhoneRemove => 'Eemalda';

  @override
  String get securityPhoneRemoveTitle => 'Eemalda telefoninumber';

  @override
  String get securityPhoneRemoveDescription =>
      'Kas olete kindel, et soovite oma telefoninumbri eemaldada?';

  @override
  String get securityPhoneRemoved => 'Telefoninumber eemaldatud';

  @override
  String get securityClaimTitle => 'Turvafunktsioonid';

  @override
  String get securityClaimDescription =>
      'Väitke oma konto, et pääseda juurde turvafunktsioonidele, nagu kahefaktoriline autentimine ja pääsukoodid.';

  @override
  String get securityVerifyEmailRequired =>
      'Peate oma e-posti aadressi kinnitama, enne kui saate seadistada kahefaktorilise autentimise, pääsukoodid või SMS-i kinnituse.';

  @override
  String get totpEnableTitle => 'Autentimisrakenduse seadistamine';

  @override
  String get totpEnableDescription =>
      'Skannige QR-kood oma autentimisrakendusega, et luua kahefaktorilise autentimise koodid.';

  @override
  String get totpEnableCodeLabel => 'Kood';

  @override
  String get totpEnableCodeHint =>
      'Sisestage 6-kohaline kood oma autentimisrakendusest';

  @override
  String get totpEnableSuccess => 'Kahefaktoriline autentimine on lubatud';

  @override
  String get totpDisableTitle => 'Autentimisrakenduse eemaldamine';

  @override
  String get totpDisableDescription =>
      'Sisestage 6-kohaline kood oma autentimisrakendusest, et keelata kahefaktoriline autentimine.';

  @override
  String get totpDisableSuccess => 'Kahefaktoriline autentimine keelatud';

  @override
  String get backupCodesTitle => 'Varukoodid';

  @override
  String get backupCodesWarning =>
      'Kui kaotate juurdepääsu oma autentimisrakendusele ja teil pole neid koode, lukustatakse teie konto jäädavalt välja. Laadige need alla või kopeerige need kohe ja salvestage need turvalisse kohta.';

  @override
  String get backupCodesDownload => 'Laadi alla';

  @override
  String get backupCodesCopy => 'Kopeeri';

  @override
  String get backupCodesCopied => 'Varukoodid kopeeritud lõikelauale';

  @override
  String get backupCodesAcknowledge =>
      'Olen oma varukoodid alla laadinud või kopeerinud ja salvestanud need turvalisse kohta.';

  @override
  String get backupCodesDone => 'Valmis';

  @override
  String get backupCodesViewTitle => 'Vaata varukoode';

  @override
  String get backupCodesViewDescription =>
      'Varukoodide vaatamiseks võib olla vajalik kinnitus.';

  @override
  String get phoneAddTitle => 'Lisa telefoninumber';

  @override
  String get phoneAddLabel => 'Telefoninumber';

  @override
  String get phoneAddHint => 'Sisestage oma telefoninumber';

  @override
  String get phoneAddFooter =>
      'Sisestage oma telefoninumber. Saadame teile SMS-iga kinnituskoodi.';

  @override
  String get phoneAddSendCode => 'Saada kood';

  @override
  String get phoneVerifyTitle => 'Kinnita telefoninumber';

  @override
  String get phoneVerifyDescription =>
      'Sisestage oma telefoninumbrile saadetud kinnituskood.';

  @override
  String get phoneAddSuccess => 'Telefoninumber lisatud';

  @override
  String get dangerZoneSectionTitle => 'Ohtlik tsoon';

  @override
  String get dangerZoneSectionDescription =>
      'Pöördumatud ja hävitavad toimingud';

  @override
  String get dangerZoneDisableTitle => 'Keela konto';

  @override
  String get dangerZoneDisableDescription =>
      'Keelake oma konto ajutiselt. Saate selle hiljem uuesti aktiveerida, logides uuesti sisse.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Konto keelamine logib teid kõigist seanssidest välja. Saate oma konto uuesti aktiveerida igal ajal uuesti sisse logides.';

  @override
  String get dangerZoneDeleteTitle => 'Kustuta konto';

  @override
  String get dangerZoneDeleteDescription =>
      'Kustutage oma konto ja kõik sellega seotud andmed jäädavalt. Seda toimingut ei saa tagasi võtta.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Enne konto kustutamist tühistage oma aktiivne Plutoniumi tellimus Plutoniumi seadetes.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Konto kustutamine pole võimalik';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Te ei saa oma kontot kustutada, kui omate kogukondi. Enne seda peate üle andma järgmiste kogukondade omandiõiguse:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'ja veel $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Omandiõiguse üleandmiseks minge aadressile $settingsPath ja kasutage valikut „Edasta omandiõigus”.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Kas olete kindel, et soovite oma konto kustutada? See toiming ajastab teie konto jäädavaks kustutamiseks.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Kustutamisprotsessi saate tühistada 14 päeva jooksul';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Pärast 14 päeva möödumist kustutatakse teie konto jäädavalt';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Pärast kustutamise töötlemist ei saa te oma kontole enam juurde pääseda';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Pärast konto kustutamist ei saa te oma saadetud sõnumeid kustutada';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Kui soovite oma andmeid eksportida või sõnumeid enne kustutamist kustutada, külastage enne jätkamist jaotist Privaatsusjuhtpaneel kasutajaseadetes.';

  @override
  String get claimAccountTitle => 'Väitke oma konto';

  @override
  String get claimAccountDescription =>
      'Väitke oma konto, lisades e-posti ja parooli. Enne lõpetamist saadame teie e-posti kinnitamiseks kinnituskoodi.';

  @override
  String get claimAccountEmailLabel => 'E-postiaadress';

  @override
  String get claimAccountPasswordLabel => 'Parool';

  @override
  String get claimAccountSendCode => 'Saada kood';

  @override
  String get claimAccountVerifyDescription =>
      'Sisesta oma e-posti aadressi kinnitamiseks saadetud kood. Parool määratakse pärast koodi kinnitamist.';

  @override
  String get claimAccountSuccess => 'Konto edukalt vormistatud';

  @override
  String get importantInformation => 'Tähtis teave:';

  @override
  String get genericError => 'Ilmnes tõrge';

  @override
  String get invalidCode => 'Kehtetu kood';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aastat tagasi',
      one: '1 aasta tagasi',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuud tagasi',
      one: '1 kuu tagasi',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count päeva tagasi',
      one: '1 päev tagasi',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tundi tagasi',
      one: '1 tund tagasi',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutit tagasi',
      one: '1 minut tagasi',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'vaid hetk tagasi';

  @override
  String get authorizedAppsTitle => 'Volitatud rakendused';

  @override
  String get authorizedAppsDescription =>
      'Nendel rakendustel on lubatud teie Fluxeri kontole juurde pääseda.';

  @override
  String get authorizedAppsEmptyTitle => 'Volitatud rakendusi pole';

  @override
  String get authorizedAppsEmptyDescription =>
      'Te pole ühtegi rakendust oma konto juurde pääsemiseks volitanud.';

  @override
  String get authorizedAppsLoadError =>
      'Volitatud rakenduste laadimine ebaõnnestus';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Volitatud $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Antud load';

  @override
  String get authorizedAppsRevoke => 'Tühista';

  @override
  String get authorizedAppsRevokeTitle => 'Tühista rakenduse juurdepääs';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Kas olete kindel, et soovite tühistada $appName juurdepääsu? Sellel rakendusel pole enam teie kontole juurdepääsu.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Juurdepääs teie põhilisele profiiliteabele (kasutajanimi, avatar jne)';

  @override
  String get authorizedAppsScopeEmail => 'Vaadake oma e-posti aadressi';

  @override
  String get authorizedAppsScopeGuilds =>
      'Vaadake kogukondi, mille liikmed te olete';

  @override
  String get authorizedAppsScopeConnections => 'Vaadake oma ühendatud kontosid';

  @override
  String get authorizedAppsScopeBot =>
      'Lisage bot kogukonda koos nõutud lubadega';

  @override
  String get authorizedAppsScopeAdmin => 'Juurdepääs halduslõpp-punktidele';

  @override
  String get privacyPendingDeletionTitle => 'Ootel kustutamine';

  @override
  String get blockedUsersTitle => 'Blokeeritud kasutajad';

  @override
  String get blockedUsersDescription =>
      'Blokeeritud kasutajad ei saa teile sõbrakutseid saata ega teile otse sõnumeid saata.';

  @override
  String get blockedUsersEmptyTitle => 'Blokeeritud kasutajaid pole';

  @override
  String get blockedUsersEmptyDescription => 'Te pole veel kedagi blokeerinud.';

  @override
  String get blockedUsersLoadError =>
      'Blokeeritud kasutajate laadimine ebaõnnestus';

  @override
  String get blockedUsersUnblock => 'Tühista blokeering';

  @override
  String get blockedUsersUnblockTitle => 'Tühista kasutaja blokeering';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Kas olete kindel, et soovite $username blokeeringu tühistada?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopeeri Fluxeri silt';

  @override
  String get blockedUsersCopyId => 'Kopeeri kasutaja ID';

  @override
  String get userProfileLoadError => 'Profiili ei saanud laadida';

  @override
  String get userProfileRetry => 'Proovi uuesti';

  @override
  String get userProfileMessage => 'Sõnum';

  @override
  String get userProfileVoiceCall => 'Häälkõne';

  @override
  String get userProfileVideoCall => 'Videokõne';

  @override
  String get userProfileEditProfile => 'Muuda profiili';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxeri personal';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxeri kogukonnatiim';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxeri partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxeri veehiilaja';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxeri Plutoonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxeri Plutooniumi liige alates $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxeri visionäär';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxeri visionäär alates $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionääri ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Ühised sõbrad ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Ühised kogukonnad ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Ühised sõbrad';

  @override
  String get userProfileMutualCommunitiesTitle => 'Ühised kogukonnad';

  @override
  String get userProfileNoMutualFriends => 'Ühiseid sõpru ei leitud.';

  @override
  String get userProfileNoMutualCommunities => 'Ühiseid kogukondi ei leitud.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Hüüdnimi: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Ava DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Blokeerisite $username. Te ei saa sõnumeid saata, kui te ei vabasta teda blokeeringust.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Vabasta blokeeringust';

  @override
  String get userProfileOpenDm => 'Ava DM';

  @override
  String get userProfileNoteTitle => 'Märkus';

  @override
  String get userProfileNoteVisibility => '(nähtav ainult teile)';

  @override
  String get userProfileNoteSave => 'Salvesta';

  @override
  String get userProfileNoteDelete => 'Kustuta';

  @override
  String get userProfileNoteEmpty => 'Puuduta, et lisada märkus';

  @override
  String get userProfileMemberSince => 'Liige alates';

  @override
  String get userProfileAboutMe => 'Minust';

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
  String get userProfileCopyUsername => 'Kopeeri kasutajanimi';

  @override
  String get userProfileCopyUserId => 'Kopeeri kasutaja ID';

  @override
  String get userProfileViewMainProfile => 'Vaata põhiprofiili';

  @override
  String get userProfileViewCommunityProfile => 'Vaata kogukonna profiili';

  @override
  String get userProfileBlockUser => 'Blokeeri kasutaja';

  @override
  String get userProfileUnblockUser => 'Vabasta kasutaja blokeeringust';

  @override
  String get userProfileRemoveFriend => 'Eemalda sõber';

  @override
  String get userProfileBlockConfirmTitle => 'Blokeeri kasutaja';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Kas olete kindel, et soovite $username blokeerida?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Vabasta kasutaja blokeeringust';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Kas olete kindel, et soovite $username blokeeringust vabastada?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Eemalda sõber';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Kas olete kindel, et soovite $username sõbraks eemaldada?';
  }

  @override
  String get userProfileFailedOpenDm => 'DM-i avamine ebaõnnestus';

  @override
  String get userProfileFailedSaveNote => 'Märkuse salvestamine ebaõnnestus';

  @override
  String get userProfileActionFailed => 'Toiming ebaõnnestus, proovige uuesti';

  @override
  String get userProfileChangeNickname => 'Muuda hüüdnime';

  @override
  String get userProfileKick => 'Eemalda';

  @override
  String get userProfileBan => 'Keela';

  @override
  String get userProfileTimeout => 'Määra ajaline piirang';

  @override
  String get userProfileRemoveTimeout => 'Eemalda ajaline piirang';

  @override
  String get userProfileTransferOwnership => 'Edasta omandiõigus';

  @override
  String get userProfileReportUser => 'Teata kasutajast';

  @override
  String get userProfileReportMessage => 'Teata sõnumist';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Eemalda $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Kas olete kindel, et soovite $username eemaldada? Nad saavad uue kutsungiga uuesti liituda.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Eemalda aegumine?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Aegumise eemaldamine lubab $username uuesti sõnumeid saata, reaktsioone lisada ja häälkanalitesse liituda.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Edasi anda omand?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Edasi anda selle kogukonna omand $username-ile? See on pöördumatu ja te kaotate kõik omaniku õigused.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Keela $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Keelu kestus';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Kohandatud kestus (sekundites)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Iga väärtus $min ja $max sekundi vahel';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Kustuta sõnumite ajalugu';

  @override
  String get userProfileBanDeleteNone => 'Ära kustuta midagi';

  @override
  String get userProfileBanDelete24h => 'Eelmised 24 tundi';

  @override
  String get userProfileBanDelete7d => 'Eelmised 7 päeva';

  @override
  String get userProfileBanReasonLabel => 'Põhjus (valikuline)';

  @override
  String get userProfileBanReasonHint => 'Sisesta keelu põhjus';

  @override
  String get userProfileBanSubmit => 'Keela liige';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Aegumisse $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Aegumise kestus';

  @override
  String get userProfileTimeoutSubmit => 'Aegumisse liige';

  @override
  String get userProfileNicknameLabel => 'Hüüdnimi';

  @override
  String get userProfileNicknameHint => 'Sisesta hüüdnimi';

  @override
  String get userProfileNicknameSave => 'Salvesta';

  @override
  String userProfileKickSuccess(String username) {
    return 'Viskasime $username välja';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Keelasime $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Aegusime $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Eemaldasime $username-i aegumise';
  }

  @override
  String get userProfileNicknameSuccess => 'Hüüdnimi värskendatud';

  @override
  String get userProfileTransferSuccess => 'Omand edasi antud';

  @override
  String get durationPermanent => 'Püsiv';

  @override
  String get duration60Seconds => '60 sekundit';

  @override
  String get duration5Minutes => '5 minutit';

  @override
  String get duration10Minutes => '10 minutit';

  @override
  String get duration1Hour => '1 tund';

  @override
  String get duration12Hours => '12 tundi';

  @override
  String get duration1Day => '1 päev';

  @override
  String get duration3Days => '3 päeva';

  @override
  String get duration5Days => '5 päeva';

  @override
  String get duration1Week => '1 nädal';

  @override
  String get duration2Weeks => '2 nädalat';

  @override
  String get duration1Month => '1 kuu';

  @override
  String get durationCustom => 'Kohandatud…';

  @override
  String get iarReportUserTitle => 'Teata kasutajast';

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
  String get iarReasonInappropriateProfile => 'Sobimatu profiil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Sellel kasutajal on sobimatu profiil';

  @override
  String typingIndicatorOne(String name) {
    return '$name kirjutab...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 ja $name2 kirjutavad...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 ja $name3 kirjutavad...';
  }

  @override
  String get typingIndicatorMultiple => 'Mitu inimest kirjutab...';

  @override
  String get typingIndicatorHandful => 'Kogub käputäis klaviatuurisõdalasi...';

  @override
  String get typingIndicatorSymphony =>
      'Klahvide koputamise sümfoonia on käimas...';

  @override
  String get typingIndicatorFiesta => 'Siin käib täielik kirjutamisfiesta';

  @override
  String get typingIndicatorApocalypse => 'Whoa, it\'s a typing apocalypse';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Glad you\'re here, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Welcome, $username! Make yourself at home.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hello, $username! Nice to have you here.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hello, $username! Jump in whenever you\'re ready.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hey $username, great to see you here!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hey there, $username! Hope you enjoy your stay.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hey, $username, welcome aboard!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Glad you made it, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Welcome in, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Welcome, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Welcome, $username! We\'re glad you\'re here.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Welcome, $username! Hope you enjoy your time here.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Welcome, $username! Your next conversation starts here.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Welcome, $username. We\'re happy to have you here.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Great to see you, $username! Welcome in.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'You\'re here, $username! Good to have you with us.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'You\'ve arrived, $username! Let\'s get started.';
  }

  @override
  String get relativeTimeShortNow => 'nüüd';

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
      other: '${count}k',
      one: '1k',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}a',
      one: '1a',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Minu seadmed';

  @override
  String get linkedDevicesDescription =>
      'Vaadake kõiki seadmeid, mis on praegu teie kontole sisse logitud. Tühistage kõik tundmatud seansid.';

  @override
  String get linkedDevicesCurrentDevice => 'Praegune seade';

  @override
  String get linkedDevicesOtherDevices => 'Muud seadmed';

  @override
  String get linkedDevicesEnterSelection => 'Sisene valimisrežiimi';

  @override
  String get linkedDevicesExitSelection => 'Välju valimisrežiimist';

  @override
  String get linkedDevicesSelectAll => 'Vali kõik';

  @override
  String get linkedDevicesClearSelection => 'Tühjenda valik';

  @override
  String get linkedDevicesRevokeTooltip => 'Tühista seade';

  @override
  String get linkedDevicesSignOutAll =>
      'Logi välja kõikidest teistest seadmetest';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Logi välja $count seadmest',
      one: 'Logi välja 1 seadmest',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Logi välja $count seadmest',
      one: 'Logi välja 1 seadmest',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Logi välja kõikidest teistest seadmetest';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'See logib valitud seadmed teie kontolt välja. Peate neil seadmetel uuesti sisse logima.',
      one:
          'See logib valitud seadme teie kontolt välja. Peate sellel seadmel uuesti sisse logima.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'See logib valitud seadmed teie kontolt välja. Peate neil seadmetel uuesti sisse logima.';

  @override
  String get linkedDevicesSignOutConfirm => 'Jätka';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Peate kõigist välja logitud seadmetest uuesti sisse logima';

  @override
  String get linkedDevicesLoadErrorTitle => 'Võrgu viga';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Meil on probleeme ühenduse loomisega aegruumi pidevusega. Palun kontrollige oma ühendust ja proovige uuesti.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Seadmed tühistatud',
      one: 'Seade tühistatud',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Välja logimine ebaõnnestus. Proovige uuesti.';

  @override
  String get linkedDevicesUnknownOs => 'Tundmatu OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Tundmatu platvorm';

  @override
  String slowmodeLabel(String duration) {
    return '$duration aeglustusrežiim';
  }

  @override
  String get slowmodeTooltipActive =>
      'Olete aeglustusrežiimis. Palun oodake enne järgmise sõnumi saatmist.';

  @override
  String get slowmodeTooltipImmune =>
      'Aeglustusrežiim on lubatud, kuid teil on immuunsus.';

  @override
  String get channelNoSendPermissionHint =>
      'Selles kanalis ei saa sõnumeid saata.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Süsteemiteated $productName personalilt. Siia ei saa vastata.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Selles kogukonnas on sõnumite saatmine ajutiselt peatatud.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Teie ajaline piirang on möödas. Sõnumite saatmine, reaktsioonid ja häälsuhtlus on peatatud kuni ajapiirangu lõppemiseni.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Selles kogukonnas sõnumite saatmiseks peate oma konto esmalt esindama.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Selles kogukonnas sõnumite saatmiseks peate oma e-posti aadressi kinnitama.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Teie konto on selles kogukonnas sõnumite saatmiseks liiga uus.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Te pole selles kogukonnas piisavalt kaua olnud, et sõnumeid saata.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Selles kogukonnas sõnumite saatmiseks peate kinnitama telefoninumbri.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Kinnita e-post';

  @override
  String get channelComposerBarrierVerifyPhone => 'Kinnita telefoninumber';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Liiga palju manuseid (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Üks või mitu faili ületavad suuruse piirangu';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Need failid on koos liiga suured saatmiseks';

  @override
  String get chatAttachmentDropToUpload => 'Lohistage failid üleslaadimiseks';

  @override
  String get chatAttachmentDropToSend => 'Lohistage failid kohe saatmiseks';

  @override
  String get chatAttachmentSendVoiceMessage => 'Saada häälteade';

  @override
  String get voiceMessageTitle => 'Häälteade';

  @override
  String get voiceMessageHoldHint =>
      'Hoidke all salvestamiseks. Lohistage üles lukustamiseks või vabastage saatmiseks.';

  @override
  String get voiceMessageDiscard => 'Häälteate tühista';

  @override
  String get voiceMessageSend => 'Saada häälteade';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Salvestamist ei saa alustada. Lubage mikrofoni juurdepääs.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Häälte salvestamine pole selles seadmes toetatud.';

  @override
  String get voiceMessageMicInUse =>
      'Häälteate salvestamiseks lahkuge häälkõnest.';

  @override
  String get voiceMessageRecordingFailed =>
      'Salvestamine nurjus. Proovige uuesti.';

  @override
  String get voiceMessageSendFailed =>
      'Häälteate saatmine nurjus. Proovige uuesti.';

  @override
  String get voiceMessageRecordingHint =>
      'Rääkige nüüd. Vajutage Stopp, kui olete lõpetanud – hiljem saate kärpida.';

  @override
  String get voiceMessageReviewHint =>
      'Kärpimiseks lohistage käepidemeid, seejärel vajutage Saada.';

  @override
  String get voiceMessageStop => 'Stopp';

  @override
  String get voiceMessageStartRecording => 'Alusta salvestamist';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Esita';

  @override
  String get voiceMessagePause => 'Paus';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Valik peab olema vähemalt ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Muuda manust';

  @override
  String get chatAttachmentFilenameLabel => 'Failinimi';

  @override
  String get chatAttachmentDescriptionLabel => 'Kirjeldus';

  @override
  String get chatAttachmentDescriptionHint => 'Valikuline alternatiivtekst';

  @override
  String get chatAttachmentSpoilerLabel => 'Märgi spoileriks';

  @override
  String get chatAttachmentRemove => 'Eemalda manustus';

  @override
  String get chatAttachmentDownload => 'Laadi alla';

  @override
  String get chatAttachmentExpiredTooltip => 'Manus aegunud';

  @override
  String get chatAttachmentSourceGallery => 'Galerii';

  @override
  String get chatAttachmentSourceCamera => 'Kaamera';

  @override
  String get chatAttachmentSourceBrowse => 'Sirvi faile';

  @override
  String get chatAttachmentPasteTooltip => 'Kleepige pilt lõikelaualt';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Näita spoilerit';

  @override
  String get matureMediaRevealButton => 'Näita';

  @override
  String get matureMediaRevealHint => 'Klõpsake näitamiseks';

  @override
  String get matureContentTitle => 'Küpsem sisu';

  @override
  String get matureCommunityTitle => 'Kogenud kogukond';

  @override
  String get matureCategoryTitle => 'Kogenud kategooria';

  @override
  String get matureChannelTitle => 'Kogenud kanal';

  @override
  String get communityContentWarningTitle => 'Kogukonna sisuhoiatus';

  @override
  String get categoryContentWarningTitle => 'Kategooria sisuhoiatus';

  @override
  String get channelContentWarningTitle => 'Kanalisisu hoiatus';

  @override
  String get defaultContentWarningBody => 'See sisaldab tundlikku sisu.';

  @override
  String get matureCommunityBody =>
      'See kogukond on märgistatud täiskasvanute sisuga ja võib sisaldada materjali, mis ei pruugi sobida kõigile kasutajatele.';

  @override
  String get matureCategoryBody =>
      'See kategooria on märgistatud täiskasvanute sisuga ja võib sisaldada materjali, mis ei pruugi sobida kõigile kasutajatele.';

  @override
  String get matureChannelBody =>
      'See kanal on märgistatud täiskasvanute sisuga ja võib sisaldada materjali, mis ei pruugi sobida kõigile kasutajatele.';

  @override
  String get matureVoiceChannelBody =>
      'See häälkanal on märgistatud täiskasvanute sisuga ja võib sisaldada materjali, mis ei pruugi sobida kõigile kasutajatele.';

  @override
  String get matureLinkChannelBody =>
      'See link-kanal on märgistatud täiskasvanute sisuga ja võib avada materjali, mis ei pruugi sobida kõigile kasutajatele.';

  @override
  String get matureCommunityUnavailableBody =>
      'See kogenud kogukond pole teie kontole saadaval.';

  @override
  String get matureCategoryUnavailableBody =>
      'See kogenud kategooria pole teie kontole saadaval.';

  @override
  String get matureChannelUnavailableBody =>
      'See kogenud kanal pole teie kontole saadaval.';

  @override
  String get matureContentProceedButton => 'Jätka';

  @override
  String get matureContentUnderstandButton => 'Ma mõistan';

  @override
  String get matureContentOpenLinkButton => 'Ava link';

  @override
  String get sensitiveContentSectionTitle => 'Tundlik sisu';

  @override
  String get sensitiveContentSectionDescription =>
      'Kontrollige, kuidas täiskasvanute või tundlikku meediat erinevates kontekstides filtreeritakse';

  @override
  String get sensitiveContentFriendDmLabel => 'Otsesõnumid sõpradelt';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Otsesõnumid teistelt';

  @override
  String get sensitiveContentGuildLabel => 'Sõnumid kogukonna kanalites';

  @override
  String get sensitiveContentFilterShow => 'Näita';

  @override
  String get sensitiveContentFilterBlur => 'Hägusta';

  @override
  String get sensitiveContentFilterBlock => 'Blokeeri';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Hägusta meediat kuni turvakontrolli lõpuni';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Kui see on lubatud, hägustatakse pilte ja videoid seni, kuni sisu turvakontroll lõpeb.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'See säte on teie kontol alati sees.';

  @override
  String get sensitiveContentResetButton => 'Lähtesta';

  @override
  String get sensitiveContentSaveButton => 'Salvesta';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count faili',
      one: '1 fail',
    );
    return 'Üleslaadimine $_temp0';
  }

  @override
  String get chatCancelUpload => 'Tühista üleslaadimine';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Aegub $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Aegub vahemikus $start kuni $end';
  }

  @override
  String get connectionsTitle => 'Ühendused';

  @override
  String get connectionsDescription =>
      'Linkige välised kontod ja domeenid oma Fluxeri profiiliga. Verifitseeritud ühendused kuvatakse teie profiilil.';

  @override
  String get connectionsEmptyTitle => 'Ühendusi pole veel';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Linkige oma Bluesky konto või verifitseerige domeeni omandiõigus, et neid oma profiilil kuvada.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifitseerige domeeni omandiõigus, et seda oma profiilil kuvada.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domeen';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Lisa Bluesky ühendus';

  @override
  String get connectionsAddDomainAriaLabel => 'Lisa domeeni ühendus';

  @override
  String get connectionEdit => 'Redigeeri';

  @override
  String get connectionRemove => 'Eemalda';

  @override
  String get connectionVerifiedLabel => 'See ühendus on verifitseeritud.';

  @override
  String get connectionUnverifiedLabel => 'See ühendus pole verifitseeritud.';

  @override
  String get connectionAddTitle => 'Lisa ühendus';

  @override
  String get connectionTypeLabel => 'Ühenduse tüüp';

  @override
  String get connectionHandleLabel => 'Kasutajanimi';

  @override
  String get connectionDomainLabel => 'Domeen';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'See ühendus on teil juba olemas.';

  @override
  String get connectionConnectBluesky => 'Ühenda teenusega Bluesky';

  @override
  String get connectionContinue => 'Jätka';

  @override
  String get connectionVerifyTitle => 'Kinnita ühendus';

  @override
  String get connectionVerifyInstructions =>
      'Kasutage allolevat kirjet domeeni omandi tõestamiseks.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT kirje';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Väärtus';

  @override
  String get connectionCopyHost => 'Kopeeri host';

  @override
  String get connectionCopyValue => 'Kopeeri väärtus';

  @override
  String get connectionCopied => 'Kopeeritud!';

  @override
  String get connectionTokenFileTitle => 'Esitage token-fail';

  @override
  String get connectionTokenFileDescription =>
      'Laadige alla **fluxer-verification** ja asetage see oma **.well-known** kausta, et saaksime domeeni valideerida.';

  @override
  String get connectionTokenFileDownload => 'Laadi alla fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Fail sisaldab verifitseerimistokenit, mille me võtame **$dnsUrl**-st.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Salvesta fluxer-verification';

  @override
  String get connectionVerifyButton => 'Kinnita';

  @override
  String get connectionBack => 'Tagasi';

  @override
  String get connectionEditTitle => 'Muuda ühendust';

  @override
  String get connectionEditDescription =>
      'Valige, kes seda ühendust teie profiilis näha saab.';

  @override
  String get connectionVisibilityEveryone => 'Kõik';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Luba kõigil seda ühendust teie profiilis näha';

  @override
  String get connectionVisibilityFriends => 'Sõbrad';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Luba oma sõpradel seda ühendust näha';

  @override
  String get connectionVisibilityCommunityMembers => 'Kogukonna liikmed';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Luba kogukondade liikmetel, kus te osalete, seda ühendust näha';

  @override
  String get connectionRemoveTitle => 'Eemalda ühendus';

  @override
  String get connectionRemoveDescription =>
      'Kas olete kindel, et soovite selle ühenduse eemaldada? Seda toimingut ei saa tühistada.';

  @override
  String get connectionRemoveConfirm => 'Eemalda';

  @override
  String get connectionsLoadError => 'Ühenduste laadimine ebaõnnestus';

  @override
  String get connectionsReorderError => 'Järjestuse värskendamine ebaõnnestus';

  @override
  String get connectionInitiateFailed =>
      'Verifitseerimise alustamine ebaõnnestus. Proovige uuesti.';

  @override
  String get connectionVerifyFailed =>
      'Verifitseerimine ebaõnnestus. Kontrollige oma DNS-kirjet ja proovige uuesti.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Bluesky autoriseerimine ebaõnnestus.';

  @override
  String get connectionUpdateFailed => 'Ühenduse värskendamine ebaõnnestus';

  @override
  String get connectionRemoveFailed => 'Ühenduse eemaldamine ebaõnnestus';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification salvestatud';

  @override
  String get connectionTokenSaveFailedToast => 'Faili ei saanud salvestada';

  @override
  String get connectionEnterHandle => 'Sisestage Bluesky kasutajanimi.';

  @override
  String get connectionEnterDomain => 'Sisestage domeen.';

  @override
  String get lookAndFeelTitle => 'Välimus ja tunnetus';

  @override
  String get lookAndFeelThemeSectionTitle => 'Teema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Valige tumeda, söe või heleda kujunduse vahel.';

  @override
  String get lookAndFeelThemeDark => 'Tume teema';

  @override
  String get lookAndFeelThemeCoal => 'Söeteema';

  @override
  String get lookAndFeelThemeLight => 'Hele teema';

  @override
  String get lookAndFeelThemeSystem => 'Süsteemi teema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sünkroniseeri teema kõigi seadmete vahel';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Kui see on lubatud, sünkroonitakse teemamuudatused kõigi teie seadmetega. Kui see on keelatud, kasutab see seade oma teemaseadet.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Süsteemi teema keelab automaatselt sünkroonimise, et jälgida teie süsteemi eelistusi selles seadmes.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Teema sünkroonimine teie kontoga ebaõnnestus. Proovige uuesti.';

  @override
  String get lookAndFeelChatFontScalingTitle =>
      'Vestluse fondi suuruse muutmine';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Reguleerige fondi suurust vestluse piirkonnas.';

  @override
  String get lookAndFeelInterfaceTitle => 'Liides';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Kohandage liidese elemente ja käitumist.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Kanali loendi kirjutamise indikaatorid';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Valige, kuidas kirjutamise indikaatorid kuvatakse kanali loendis, kui keegi kanalil kirjutab.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Kirjutamise indikaator + avatari';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Kuvage kanali loendis kirjutamise indikaator koos kasutaja avataridega';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Ainult kirjutamise indikaator';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Kuvage ainult kirjutamise indikaator ilma avatarideta';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Peidetud';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ärge kuvage kanali loendis kirjutamise indikaatoreid';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Kuvage kirjutamine valitud kanalil';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Kui see on keelatud (vaikimisi), ei kuvata kirjutamise indikaatoreid kanalil, mida te parajasti vaatate.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'üldine';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Klaviatuuri vihjed';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Juhtige, kas klaviatuuri otsetee vihjed kuvatakse tööriistavihjetes.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Peida klaviatuuri vihjed tööriistavihjetes';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Kui see on lubatud, peidetakse otsetee märgid tööriistavihjete hüpikakendes.';

  @override
  String get lookAndFeelNekoTitle => 'Muu';

  @override
  String get lookAndFeelNekoDescription => 'Muud liidese valikud.';

  @override
  String get lookAndFeelShowNekoLabel => 'Kuvage Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Kui see on lubatud, ilmub Neko vestluse sisestusriba lähedale.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Häälkanaliga liitumise käitumine';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Juhtige, kuidas te kogukondades häälkanalitega liitute.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Häälkanalitega liitumiseks nõua topeltklõpsu';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Kui see on lubatud, peate häälkanalitega liitumiseks topeltklõpsama. Kui see on keelatud (vaikimisi), liitute kanaliga ühe klõpsuga.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Kiire pruun rebane hüppab üle laisa koera.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Serveri külgriba';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigureerige, kuidas serveri külgriba kuvab otsesõnumeid.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count kogukonda on ajutiselt kättesaamatud flux capacitor rikke tõttu.',
      one: '1 kogukond on ajutiselt kättesaamatu flux capacitor rikke tõttu.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Paki DM-id kausta';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Kui see on lubatud, pakitakse serveri külgribal olevad lugemata DM-id kausta Fluxeri nupu alla. Kausta laiendamiseks või kokku pakkimiseks klõpsake DM-ide lehel olles Fluxeri nuppu.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanali loend';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Juhtige vaigistatud kanalite lugemata indikaatori käitumist kanalite loendites.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Kuvage vaigistatud kanalitel lugemata indikaatorit';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Kui see on lubatud, kuvatakse vaigistatud kanalitel vasakul pool tuhmi lugemata indikaatorit. Mainimised ilmuvad endiselt olenemata sellest sättest.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktiivsed nüüd';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Juhtige, kuidas „Aktiivsed nüüd“ rakenduses kuvatakse.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Kuvage kodulehel „Aktiivsed nüüd“';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Kuvage kodulehel „Aktiivsed nüüd“, et näidata häälkanalites aktiivseid sõpru. Näete eelvaadet, kanali konteksti, kes on juba kohal ja kiiret viisi liitumiseks.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Lemmikud';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Juhtige lemmikute nähtavust kogu rakenduses.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Luba lemmikud';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Kui see on lubatud, saate kanaleid lemmikuteks märkida ja need ilmuvad jaotises Lemmikud. Kui see on keelatud, peidetakse kõik lemmikutega seotud kasutajaliidese elemendid (nupud, menüüelemendid). Teie olemasolevad lemmikud säilitatakse.';

  @override
  String get favoritesTitle => 'Lemmikud';

  @override
  String get favoritesEmptyTitle => 'Veel pole lemmikuid';

  @override
  String get favoritesEmptyDescription =>
      'Tähtedega kanalite lisamiseks vestluse päisest lisage need siia.';

  @override
  String get favoritesWelcomeTitle => 'Tere tulemast lemmikutesse';

  @override
  String get favoritesWelcomeDescription =>
      'Teie isiklik ruum kiireks juurdepääsuks kanalitele, DM-idele ja gruppidele, mida armastate. Vajutage tähte mis tahes kanalil, et see siia lisada.';

  @override
  String get favoritesWelcomeTip =>
      'Pole teie jaoks? Lülitage see igal ajal välja.';

  @override
  String get favoritesDisableButton => 'Keela lemmikud';

  @override
  String get favoritesAddedToast => 'Lisatud lemmikutesse';

  @override
  String get favoritesRemovedToast => 'Eemaldatud lemmikutest';

  @override
  String get favoritesHiddenToast => 'Lemmikud peidetud';

  @override
  String get favoritesMute => 'Vaigista lemmikud';

  @override
  String get favoritesUnmute => 'Tühista lemmikute vaigistus';

  @override
  String get favoritesHeaderMenu => 'Lemmikute menüü';

  @override
  String get favoritesCreateCategory => 'Loo kategooria';

  @override
  String get favoritesCategoryNameLabel => 'Kategooria nimi';

  @override
  String get favoritesHideMutedChannels => 'Peida vaigistatud kanalid';

  @override
  String get favoritesShowMutedChannels => 'Näita vaigistatud kanaleid';

  @override
  String get favoritesSetNickname => 'Määra hüüdnimi';

  @override
  String get favoritesNicknameLabel => 'Hüüdnimi';

  @override
  String get favoritesSaveNickname => 'Salvesta hüüdnimi';

  @override
  String get favoritesMoveToCategory => 'Liiguta kategooriasse';

  @override
  String get favoritesUncategorized => 'Kategooriateta';

  @override
  String get favoritesOtherCategory => 'Muu';

  @override
  String get favoritesRemoveFromFavorites => 'Eemalda lemmikutest';

  @override
  String get favoritesAddToFavorites => 'Lisa lemmikutesse';

  @override
  String get favoritesHideConfirmTitle => 'Peida lemmikud';

  @override
  String get favoritesHideConfirmDescription =>
      'See peidab kõik lemmikutega seotud kasutajaliidese elemendid, sealhulgas nupud ja menüüvalikud. Teie olemasolevad lemmikud säilitatakse ja neid saab igal ajal uuesti lubada jaotises Seaded > Täpsemad > Välimus.';

  @override
  String get favoritesDirectMessageSubtitle => 'Otsene sõnum';

  @override
  String get messagesMediaDisplayGroupTitle => 'Kuvamine';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Kontrollige, kuidas sõnumeid, meediat ja muud sisu kuvatakse.';

  @override
  String get messagesMediaMediaGroupTitle => 'Meedia';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Kohandage meedia suuruse eelistusi ja nuppe.';

  @override
  String get messagesMediaInputGroupTitle => 'Sisend';

  @override
  String get messagesMediaInputGroupDescription =>
      'Kohandage sõnumisisestuse sätteid.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Külgriba';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigureerige, kuidas kogukonna külgriba kuvatakse.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Peida vaigistatud kanalid vaikimisi';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Peida automaatselt vaigistatud kanalid külgribal, kui liitute uute kogukondadega';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Kas peita vaigistatud kanalid vaikimisi?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Uutesse kogukondadesse, millega liitute, peidetakse vaigistatud kanalid automaatselt. Kas soovite seda sätet rakendada ka kõigile teie olemasolevatele kogukondadele?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Kas lõpetada vaigistatud kanalite vaikimisi peitmine?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Uutesse kogukondadesse, millega liitute, ei peideta vaigistatud kanaleid enam automaatselt. Kas soovite vaigistatud kanaleid näidata ka kõigis teie olemasolevates kogukondades?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Rakenda kõigile kogukondadele';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Näita kõigis kogukondades';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Ainult uued kogukonnad';

  @override
  String get messagesMediaDisplaySectionTitle => 'Meedia kuvamine';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Kontrollige, kuidas pilte, videoid ja muud meediat kuvatakse. Kogu meedia suurust muudetakse ja teisendatakse. Äärmiselt suured failid, mida ei saa eelvaateks tihendada, ei manustata olenemata nendest sätetest.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Kui postitatakse linkidena vestlusesse';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Kui laaditakse otse Fluxerisse üles';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Lingi eelvaated';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Kontrollige, kuidas veebisaidi linke vestluses eelvaadatakse';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Näita manuseid ja eelvaate veebisaidi linke';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaktsioonid';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Seadista emotikonide reaktsioonid sõnumitele';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Näita emotikonide reaktsioone sõnumitel';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoilerisisu';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Kontrolli, kuidas spoilerisisu kuvatakse';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Näita spoilerisisu';

  @override
  String get messagesMediaSpoilersOnClickName => 'Klõpsamisel';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Näita spoilerisisu klõpsamisel';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Kanalites, mida modereerin';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Näita alati spoilerisisu kanalites, kus sul on õigus „Hallake sõnumeid“';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Alati';

  @override
  String get messagesMediaSpoilersAlwaysDescription => 'Näita alati spoilereid';

  @override
  String get messagesMediaSizeSectionTitle => 'Meedia suuruse eelistused';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Kohanda manustatud ja lisatud meedia maksimaalset kuvatavat suurust. Väiksemad suurused kasutavad vähem ekraanipinda, suuremad aga näitavad rohkem detaile.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Meedia linkidelt (manused)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Üles laaditud manused';

  @override
  String get messagesMediaSizeCompactName => 'Kompaktne (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Väiksem meedia suurus';

  @override
  String get messagesMediaSizeComfortableName => 'Mugav (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Suurem meedia suurus rohkemate detailidega';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF-ide käitumine';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Kontrolli, kuidas GIF-e vestlusesse lisatakse';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Saada valitud GIF-id automaatselt';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Väljendite automaatne täitmine (kooloniga täitmine)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Kontrolli, mis kuvatakse väljendite automaatse täitmise ajal, kui sisestad kooloni. Kohanda, millised ettepanekud kuvatakse, et need vastaksid sinu eelistustele.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Näita vaikimisi emotikone väljendite automaatse täitmise ajal';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Näita kohandatud emotikone väljendite automaatse täitmise ajal';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Näita kleebiseid väljendite automaatse täitmise ajal';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Näita salvestatud meediat väljendite automaatse täitmise ajal';

  @override
  String get messagesMediaEditingSectionTitle => 'Sõnumi redigeerimine';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Kontrolli, mis juhtub sinu redigeerimisversiooniga, kui tühistad.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Säilita redigeerimisversioon tühistamisel';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Lugemata indikaatorid';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Kontrolli, kuidas lugemata sõnumite indikaatoreid kuvatakse.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Näita tuhmi lugemata indikaatorit vaigistatud kanalites';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Kuvab vaigistatud privaatsõnumite ja kanalite kõrval tuhmi lugemata indikaatori, et saaksid tegevust kiiresti näha.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Privaatsõnumite eelvaated';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Kontrolli, millal privaatsõnumite loendis kuvatakse sõnumite eelvaateid.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Privaatsõnumite eelvaate režiim';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Kõik sõnumid';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Näita sõnumite eelvaateid kõigi privaatsõnumite vestluste jaoks';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Ainult lugemata privaatsõnumid';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Näita sõnumite eelvaateid ainult privaatsõnumites, kus on lugemata sõnumeid';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Puudub';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ära näita sõnumite eelvaateid privaatsõnumite loendis';

  @override
  String get dmListSentAnAttachment => 'Saatis manuse';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username kinnitas sõnumi sellesse kanalisse.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username lisas $userName gruppi.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username lisas gruppi kellegi.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username lahkus grupist.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username eemaldas $userName grupist.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username eemaldas grupist kellegi.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username muutis kanali nimeks $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username muutis kanali nime.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username muutis kanali ikooni.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username alustas kõnet.';
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
  String get voiceConnectionConfirmTitle => 'Häälkõne ühenduse kinnitus';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Olete juba ühendatud selle häälkanaliga $count teisest seadmest. Mida soovite teha?',
      one:
          'Olete juba ühendatud selle häälkanaliga ühest teisest seadmest. Mida soovite teha?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Lülitu sellele seadmele';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Liitu lihtsalt (hoia teised ühendused)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ära tee midagi, ma ei taha liituda';

  @override
  String get voiceChannelEmptyDescription =>
      'See on häälkanal. Ühendu, et alustada rääkimist!';

  @override
  String get voiceChannelJoin => 'Liitu häälkanaliga';

  @override
  String get voiceChannelJoinConnect => 'Ühendu häälega';

  @override
  String get voiceChannelNoConnectPermission =>
      'Sul pole luba selle häälkanaliga liitumiseks';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofoni, kaamera ja ekraani jagamise sisu on otsast otsani krüpteeritud.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofoni, kaamera ja ekraani jagamise sisu on otsast otsani krüpteeritud.';

  @override
  String get voiceChannelE2eeBroken =>
      'Otsast otsani krüpteerimine pole saadaval, kuna selles häälkanalil on toetamata osaleja.';

  @override
  String get voiceCallE2eeBroken =>
      'Otsast otsani krüpteerimine pole saadaval, kuna selles kõnes on toetamata osaleja.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Seda klienti tuleb enne krüpteeritud kõnega liitumist värskendada.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Ei õnnestunud teie mikrofoni käivitada. Olete endiselt kõnes.';

  @override
  String get voiceChannelStatusConnecting => 'Ühendub…';

  @override
  String get voiceChannelStatusConnected => 'Ühendatud';

  @override
  String get voiceChannelStatusError => 'Viga';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobiilseade';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Lauaarvuti seade';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Kogukond vaigistas';

  @override
  String get voiceParticipantTooltipMuted => 'Vaigistatud';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Kogukond kurtis';

  @override
  String get voiceParticipantTooltipDeafened => 'Kurt';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Ühendus: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count osalejat',
      one: '1 osaleja',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Lahku';

  @override
  String get voiceControlMute => 'Vaigista';

  @override
  String get voiceControlUnmute => 'Võta vaigistus maha';

  @override
  String get voiceControlDeafen => 'Kurt';

  @override
  String get voiceControlUndeafen => 'Võta kurtus maha';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Ekraani jagamine';

  @override
  String get voiceScreenShareNotificationText => 'Ekraani jagamine.';

  @override
  String get voiceControlMore => 'Rohkem';

  @override
  String get voiceControlDisconnect => 'Katkesta ühendus';

  @override
  String get voiceControlChat => 'Vestlus';

  @override
  String get voiceTextChatShow => 'Näita vestlust';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# lugemata sõnumit',
      one: '# lugemata sõnum',
    );
    return 'Näita vestlust $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Video jaoks on vaja kaamera luba.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Ei õnnestunud ekraani jagamist alustada. Proovige uuesti.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Ekraani jagamise luba keelati.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Ekraani jagamine pole sellel seadmel saadaval.';

  @override
  String get voiceWatchStream => 'Vaata voogu';

  @override
  String get voiceStopWatching => 'Lõpeta vaatamine';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Lõpeta praeguse striimi vaatamine';

  @override
  String get voiceOwnScreenShareTitle => 'Sa edastad';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Sinu striim on osalejatele otse-eetris.';

  @override
  String get voiceLiveBadge => 'OTSE';

  @override
  String get dmVoiceViewCall => 'Vaata kõnet';

  @override
  String get dmVoiceCallFullScreen => 'Täisekraan';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Ava kõne täisekraanil';

  @override
  String get dmVoiceStripStatusConnecting => 'Ühendub…';

  @override
  String get dmVoiceStripStatusInCall => 'Kõnes';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Häälkõne';

  @override
  String get dmVoiceCallBarConnecting => 'Ühendub…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Otsene kõne';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Grupikõne';

  @override
  String get dmVoiceCallBarIssueFallback => 'Häälkõne probleem';

  @override
  String get dmVoiceFullscreenTitle => 'Hääl';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Häälühendus loodud';

  @override
  String get notificationsPageTitle => 'Teavitused';

  @override
  String get notificationsFilterUnreads => 'Lugemata';

  @override
  String get notificationsFilterMentions => 'Mainimised';

  @override
  String get notificationsBookmarksTooltip => 'Järjehoidjad';

  @override
  String get notificationsMentionFilterTooltip => 'Filtreeri mainimisi';

  @override
  String get notificationsMentionFiltersTitle => 'Mainimiste filtrid';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Kaasa @everyone ja @here mainimised';

  @override
  String get notificationsMentionIncludeRoles => 'Kaasa rolli mainimised';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Kaasa kõik kogukonna mainimised';

  @override
  String get notificationsNoUnreadTitle => 'Ühtegi lugemata sõnumit';

  @override
  String get notificationsNoUnreadBody => 'Oled kõigega kursis.';

  @override
  String get notificationsNoMentionsTitle => 'Ühtegi hiljutist mainimist';

  @override
  String get notificationsNoMentionsBody =>
      'Kõik sinu @mainimised ilmuvad siia 7 päevaks.';

  @override
  String get notificationsMentionsEndTitle => 'Oled jõudnud lõppu';

  @override
  String get notificationsMentionsEndBody =>
      'Oled näinud kõiki oma hiljutisi mainimisi. Ära muretse, peagi ilmuvad siia uued.';

  @override
  String get notificationsJump => 'Hüppa';

  @override
  String get notificationsRemoveMentionTooltip => 'Eemalda mainimine';

  @override
  String get notificationsViewAllUnread => 'Vaata kõiki lugemata';

  @override
  String get notificationsMarkAsRead => 'Märgi loetuks';

  @override
  String get notificationsExpand => 'Laienda';

  @override
  String get notificationsCollapse => 'Ahenda';

  @override
  String get notificationsMessageUnavailable =>
      'Seda sõnumit ei õnnestunud laadida.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining tähemärki jäänud';
  }

  @override
  String get characterCounterTooLong => 'Sõnum on liiga pikk';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining tähemärki jäänud. Hankige $productName, et kirjutada kuni $premiumMaxLength tähemärki.';
  }

  @override
  String get chatMessageFailedToSend => 'Sõnumi saatmine ebaõnnestus';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Sinu sõnumit ei saanud edastada. Tavaliselt on see nii, et sul ei ole adressaadiga ühist kogukonda või adressaat aktsepteerib otsesõnumeid ainult sõpradelt. Võib-olla peate oma otsesõnumite privaatsusseadeid muutma jaotises $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Sinu sõnumit ei saanud edastada. Otsesõnumite saatmiseks peate oma konto kinnitama.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Sõnumit ei saanud edastada. Sõnumite saatmiseks peate oma konto kinnitama.';

  @override
  String get chatSendFailureContentBlocked =>
      'Sinu sõnumit ei saanud edastada, kuna see märgiti meie turvasüsteemide poolt. Kui arvate, et see on viga, võtke ühendust tugiteenusega.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Sinu sõnumit ei saanud edastada, kuna see sisaldab täiskasvanutele mõeldud emotikone või kleebiseid, mida selles kontekstis ei lubata.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Ainult sina saad seda sõnumit näha.';

  @override
  String get chatClientSystemDismiss => 'Sulge';

  @override
  String get privacyDashboardCommunicationSection => 'Suhtlus';

  @override
  String get chatMessageDeleteFailed => 'Kustutamine ebaõnnestus';

  @override
  String get chatMessageAddReaction => 'Lisa reaktsioon';

  @override
  String get chatMessageEdit => 'Muuda sõnumit';

  @override
  String get chatMessageReply => 'Vasta';

  @override
  String get chatMessageForward => 'Edasta';

  @override
  String get forwardMessageTitle => 'Edasta sõnum';

  @override
  String get forwardSearchHint => 'Otsi kanaleid või DM-e';

  @override
  String get forwardDirectMessagesSection => 'Otsesõnumid';

  @override
  String get forwardCommentHint => 'Lisa kommentaar (valikuline)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Saada ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Kanaleid ei leitud';

  @override
  String get forwardSuccessToast => 'Sõnum edastatud';

  @override
  String get forwardFailed => 'Sõnumi edastamine ebaõnnestus';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Kommentaarid pole saadaval, kuna valitud kanalil on aegrežiim lubatud.';

  @override
  String get forwardDestinationNoSendPermission => 'Siia ei saa sõnumeid saata';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Siia ei saa linke manustada';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Siia ei saa faile manustada';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Sõnumite saatmine on selles kogukonnas keelatud';

  @override
  String get forwardDestinationTimedOut =>
      'Oled selles kogukonnas ajutiselt blokeeritud';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Aegrežiim – oota $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopeeri sõnum';

  @override
  String get chatMessagePin => 'Pinni sõnum';

  @override
  String get chatMessageUnpin => 'Eemalda pin';

  @override
  String get chatMessageUnpinIt => 'Eemalda pin';

  @override
  String get chatMessageBookmark => 'Järjehoidja';

  @override
  String get chatMessageRemoveBookmark => 'Eemalda järjehoidja';

  @override
  String get chatMessageMarkAsUnread => 'Märgi lugemata';

  @override
  String get chatMessageCopyMessageLink => 'Kopeeri sõnumi link';

  @override
  String get chatMessageCopyMessageId => 'Kopeeri sõnumi ID';

  @override
  String get chatMessageViewReactions => 'Vaata reaktsioone';

  @override
  String get chatMessageRemoveAllReactions => 'Eemalda kõik reaktsioonid';

  @override
  String get chatMessageDebug => 'Sõnumi silumine';

  @override
  String get chatMessageDebugSheetTitle => 'Sõnumi silumine';

  @override
  String get chatMessageDebugCopyJson => 'Kopeeri JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Sõnumi JSON kopeeritud lõikelauale';

  @override
  String get chatReactionsSheetTitle => 'Reaktsioonid';

  @override
  String get chatReactionsSheetEmpty => 'Keegi pole veel reageerinud.';

  @override
  String get chatMessageReport => 'Raporteeri sõnum';

  @override
  String get iarReportMessageTitle => 'Raporteeri sõnum';

  @override
  String get iarThisUserFallback => 'see kasutaja';

  @override
  String get iarModalDescription =>
      'Raporteeri reeglite rikkumine või leia tööriistu kontakti ja eelistuste haldamiseks.';

  @override
  String get iarPathStepAriaLabel => 'Mida sa vajad?';

  @override
  String get iarCategoryStepTitle => 'Millist reeglit rikuti?';

  @override
  String get iarReasonStepTitle => 'Millist reeglit rikuti?';

  @override
  String get iarReasonSelectHint => 'Vali põhjus';

  @override
  String get iarPickAnOptionToast => 'Vali jätkamiseks valik.';

  @override
  String get iarPickARuleToast => 'Vali rikutud reegel.';

  @override
  String get iarPathPlatform => 'Raporteeri platvormi reeglite rikkumine';

  @override
  String get iarPathCommunity => 'Raporteeri selle kogukonna moderaatoritele';

  @override
  String get iarPathPreferenceMessage => 'Ma ei taha seda sisu näha';

  @override
  String get iarCategoryTargetedHarmLabel => 'Vihahoos, ahistamine või kahju';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Kiirustamine, ähvardused, vihakõne, vägivald, reidid või enesevigastamist propageeriv sisu.';

  @override
  String get iarCategorySafetyMinorsLabel => 'Laste turvalisus või küps sisu';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Alad on ohus, küps sisu vales kohas või soovimatu käitumine.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Privaatsus või jäljendamine';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, jälitamine, kellegi teise pähe esinemine või sobimatu profiil.';

  @override
  String get iarCategoryDeceptionLabel => 'Pettused, pahavara või valeinfo';

  @override
  String get iarCategoryDeceptionDescription =>
      'Andmepüügi-, pettuse-, pahatahtlikud lingid või valeväited, mis võivad põhjustada reaalset kahju.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Ebaseaduslik tegevus või midagi muud';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Ebaseaduslikud müügid, kuritegevuse soodustamine või selge reeglite rikkumine, mis ei sobi ülaltooduga.';

  @override
  String get iarReasonHarassmentLabel => 'Ahistamine või ähvardused';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Kiirustamine, korduv soovimatu kontakt, jälitamine või sihipärane ahistamine.';

  @override
  String get iarReasonHateLabel => 'Vihakõne';

  @override
  String get iarReasonHateMessageDescription =>
      'Sõimu, dehumaniseeriv keel või rünnakud kaitstud rühmade vastu.';

  @override
  String get iarReasonViolenceLabel => 'Vägivald või vägivallaähvardused';

  @override
  String get iarReasonViolenceDescription =>
      'Uskutavad ähvardused, graafiline vägivald või vägivalla ülistamine.';

  @override
  String get iarReasonMatureContentLabel => 'Küps sisu või ahistamine';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Soovimatu käitumine või küps sisu vales kohas.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Laste turvalisus või alaealiste ärakasutamine';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming või alaealiste ärakasutamise sisu.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Kahjulik valeinfo';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Valeväited, mis võivad põhjustada reaalset kahju.';

  @override
  String get iarReasonSpamLabel => 'Rämpspost, pettused või andmepüük';

  @override
  String get iarReasonSpamMessageDescription =>
      'Massiline rämpspost, pettus, võltsid auhinnad või konto kuritarvitamine.';

  @override
  String get iarReasonMalwareLabel => 'Pahavara või ohtlikud lingid';

  @override
  String get iarReasonMalwareDescription =>
      'Pahavara, mandaatide vargus või kahjulikud failid.';

  @override
  String get iarReasonPrivacyLabel => 'Privaatsuse rikkumine';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, avalikustatud privaatne teave või jälitamine.';

  @override
  String get iarReasonImpersonationLabel => 'Jäljendamine või petlik meedia';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Kellegi teise pähe esinemine, sealhulgas petlikud tehisintellekti loodud sisud.';

  @override
  String get iarReasonIllegalLabel => 'Ebaseaduslik tegevus';

  @override
  String get iarReasonIllegalDescription =>
      'Ebaseaduslikud müügid, kuritegevuse soodustamine või ebaseaduslik tegevus.';

  @override
  String get iarReasonSelfHarmLabel => 'Enesevigastamine või enesetapp';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Enesevigastamist või söömishäireid propageeriv või juhendav sisu.';

  @override
  String get iarReasonOtherLabel => 'Muu selge reeglite rikkumine';

  @override
  String get iarReasonOtherDescription =>
      'Kasutage ainult siis, kui see rikub selgelt Fluxeri reegleid ja ei sobi ülaltooduga.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Kui laps on kaasatud, kasutage selle asemel \"$childSafetyReason\".';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Kui see puudutab CSAM-i või alaealise ärakasutamist, saatke see kohe ja ärge jagage materjali uuesti.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Kui keegi võib olla otseses ohus, võtke ühendust kohalike hädaabiteenistustega, kui saate seda ohutult teha.';

  @override
  String get iarSafetyNoteViolence =>
      'Kui tegemist on usutava vahetu ohuga, võtke samuti ühendust kohalike hädaabiteenistustega.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Kui tegemist on vahetu terrorismiohuga, võtke samuti ühendust kohalike hädaabiteenistustega.';

  @override
  String get iarActionBlockUserTitle => 'Blokeeri see kasutaja';

  @override
  String get iarActionBlockUserDescription =>
      'Lõpetage sõnumid ja sõbrakutsed.';

  @override
  String get iarActionBlockUserButton => 'Blokeeri';

  @override
  String get iarActionCopyMessageLinkTitle => 'Kopeeri sõnumi link';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Jaga kogukonna moderaatoritega.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopeeri';

  @override
  String get iarActionCloseDmTitle => 'Sule see DM';

  @override
  String get iarActionCloseDmDescription =>
      'Ei blokeeri. Saate hiljem uuesti avada.';

  @override
  String get iarActionCloseDmButton => 'Sulge DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Lahku kogukonnast';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Lõpeta selle sisu ja liikmete nägemine.';

  @override
  String get iarActionLeaveCommunityButton => 'Lahku';

  @override
  String get iarActionDmSettingsTitle => 'DM-i ja sõbrakutse sätted';

  @override
  String get iarActionDmSettingsDescription =>
      'Muuda, kes saab sinuga ühendust võtta.';

  @override
  String get iarActionCallSettingsTitle => 'Kõne- ja grupivestluse sätted';

  @override
  String get iarActionCallSettingsDescription =>
      'Muuda, kes saab sulle helistada või sind lisada.';

  @override
  String get iarActionOpenButton => 'Ava';

  @override
  String get iarActionDeleteMessageTitle => 'Kustuta see sõnum';

  @override
  String get iarActionDeleteMessageDescription =>
      'Eemalda see kanalist kõigi jaoks.';

  @override
  String get iarActionDeleteMessageButton => 'Kustuta';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Kustutatud';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'See sõnum on juba kustutatud.';

  @override
  String get iarActionBanUserTitle => 'Keela see kasutaja';

  @override
  String get iarActionBanUserDescription =>
      'Ava kogukonnast väljaheitmise dialoog selle kasutaja jaoks.';

  @override
  String get iarActionBanUserButton => 'Keela';

  @override
  String get iarActionBanUserBannedButton => 'Keelatud';

  @override
  String get iarActionBanUserBannedTooltip =>
      'See kasutaja on kogukonnast juba keelatud.';

  @override
  String get iarCloseDmConfirmTitle => 'Sulge DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Sulge oma praegune DM kasutajaga $name. See ei blokeeri neid; saate hiljem uuesti avada.';
  }

  @override
  String get iarSuccessTitle => 'Teade saadetud';

  @override
  String get iarSuccessBody =>
      'Meie turvatiim vaatab selle üle. Saadame teile DM-i ja e-kirja, kui oleme otsuse teinud.';

  @override
  String get iarAlreadyReportedTitle => 'Juba teatatud';

  @override
  String get iarAlreadyReportedBody =>
      'Olete sellest sõnumist juba teatanud. Meie turvatiim vaatab selle üle.';

  @override
  String get iarBackButton => 'Tagasi';

  @override
  String get iarContinueButton => 'Jätka';

  @override
  String get iarSendReportButton => 'Saada teade';

  @override
  String get iarDoneButton => 'Valmis';

  @override
  String get iarCouldntSendToast =>
      'Teadet ei saanud saata. Palun proovige uuesti.';

  @override
  String get iarRateLimitedToast =>
      'Teatate liiga kiiresti. Palun oodake hetk ja proovige uuesti.';

  @override
  String get iarReportSentToast =>
      'Teade saadetud. Meie turvatiim vaatab selle üle.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Blokeerida $name? Nad ei saa teile sõnumeid saata ega sõbrakutseid esitada. Saate nad hiljem blokeeringust vabastada.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Selle kasutaja blokeerimine ebaõnnestus. Palun proovige uuesti.';

  @override
  String get iarCloseDmSuccessToast => 'DM suletud.';

  @override
  String get iarCloseDmFailedToast =>
      'Selle DM-i sulgemine ebaõnnestus. Palun proovige uuesti.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Kogukonnast lahkumine ebaõnnestus. Palun proovige uuesti.';

  @override
  String get chatMessageSuppressEmbeds => 'Peida lingieelvaated';

  @override
  String get chatMessageUnsuppressEmbeds => 'Näita lingieelvaateid';

  @override
  String get chatMessageDelete => 'Kustuta sõnum';

  @override
  String get chatMessageDeleteConfirmTitle => 'Kustuta sõnum';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Kas olete kindel, et soovite selle sõnumi kustutada?';

  @override
  String get chatMessageMore => 'Rohkem';

  @override
  String get chatEditingMessage => 'Sõnumi redigeerimine';

  @override
  String get chatReplyOriginalDeleted => 'Originaalsõnum kustutati';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Originaalsõnumit ei õnnestunud laadida';

  @override
  String get chatReplyAttachedMedia => 'Sõnum sisaldab manustatud meediat';

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
  String get chatMessagesLoadError => 'Sõnumeid ei saanud laadida.';

  @override
  String get chatReplyMentionOverrideTitle => 'Tühistada mainimise eelistus?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname eelistab vastustes @mainimist. Kas saata ikkagi ilma mainimiseta?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname eelistab vastuseid ilma @mainimiseta. Kas saata mainimisega ikkagi?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Eelista ignoreerida';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klõpsake, et keelata vastatava kasutaja märguanne.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klõpsake, et lubada vastatava kasutaja märguanne.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Vasta kasutaja märguanne';

  @override
  String get chatReplyMentionOn => 'Sees';

  @override
  String get chatReplyMentionOff => 'Väljas';

  @override
  String get chatReplyCancel => 'Tühista vastus';

  @override
  String get chatEditMessageHint => 'Muuda sõnumit';

  @override
  String get chatEditNoChanges => 'Salvestamiseks pole muudatusi';

  @override
  String get chatChannelNotReady =>
      'See kanal pole veel valmis. Proovige mõne aja pärast uuesti.';

  @override
  String get chatMessageEdited => '(muudetud)';

  @override
  String get chatMessageSilent => 'See oli @silent sõnum.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Täna kell $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Eile kell $time';
  }

  @override
  String get mediaViewerImagePreview => 'Pildi eelvaade';

  @override
  String get mediaViewerClose => 'Sule meediumivaatur';

  @override
  String get mediaViewerOpenInBrowser => 'Ava brauseris';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Edasi';

  @override
  String get mediaViewerZoomIn => 'Suurenda';

  @override
  String get mediaViewerZoomOut => 'Vähenda';

  @override
  String get mediaViewerPreviousAttachment => 'Eelmine manustis';

  @override
  String get mediaViewerNextAttachment => 'Järgmine manustis';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Lülita video juhtelemente';

  @override
  String get chatAttachmentVideoMute => 'Vaigista video';

  @override
  String get chatAttachmentVideoUnmute => 'Tühista video vaigistus';

  @override
  String get chatAttachmentVideoPlay => 'Esita videot';

  @override
  String get chatAttachmentVideoPause => 'Pausi videot';

  @override
  String get chatAttachmentVideoProgress => 'Video edenemine';

  @override
  String get chatVideoPlaybackFailed => 'Seda videot ei saanud esitada.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Teavitage selle rolliga kasutajaid, kellel on selle kanali vaatamise luba.';

  @override
  String get addGuildModalTitle => 'Lisa kogukond';

  @override
  String get addGuildModalLandingDescription =>
      'Loo uus kogukond või liitu olemasolevaga.';

  @override
  String get addGuildCreateCommunity => 'Loo kogukond';

  @override
  String get addGuildJoinCommunity => 'Liitu kogukonnaga';

  @override
  String get addGuildImportDiscordTemplate => 'Impordi Discordi mall';

  @override
  String get addGuildJoinTitle => 'Liitu kogukonnaga';

  @override
  String get addGuildJoinDescription =>
      'Sisestage kutselink kogukonnaga liitumiseks.';

  @override
  String get addGuildInviteLinkLabel => 'Kutselink';

  @override
  String get addGuildJoinSubmit => 'Liitu kogukonnaga';

  @override
  String get addGuildInviteInvalid => 'See kutse on kehtetu või aegunud.';

  @override
  String get addGuildJoinFailed =>
      'Kogukonnaga ei saanud liituda. Palun proovige uuesti.';

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
  String get addGuildPackInstalled => 'Pakett installitud edukalt.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Eemalda kõik reaktsioonid';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Kas olete kindel, et soovite sellelt sõnumilt kõik reaktsioonid eemaldada?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Eemalda kinnitus';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Kas soovite selle kinnituse ajas tagasi saata?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username kinnitas selle kanali külge $messageLink. Vaata $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'sõnumi';

  @override
  String get systemPinMessageAllPinsLink => 'kõik kinnitatud sõnumid';

  @override
  String get channelPinsEmptyTitle => 'Pole kinnitatud sõnumeid';

  @override
  String get channelPinsEmptyDescription =>
      'Kinnitatud sõnumid kuvatakse siin.';

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
  String get channelDetailsChannelSettingsTitle => 'Channel Settings';

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
  String get channelDetailsEditChannel => 'Edit Channel';

  @override
  String get channelDetailsDeleteChannel => 'Delete Channel';

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
  String get personalNotesTitle => 'Isiklikud märkmed';

  @override
  String get personalNotesSubtitle =>
      'Teie privaatne ruum mõtete ja meeldetuletuste jaoks';

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
    return 'Tere tulemast kanalis $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Alguses ei olnud midagi. Siis oli $channelName. Ja see oli hea.';
  }

  @override
  String get personalNotesComposerHint => 'Saada endale sõnum';

  @override
  String get personalNotesPrivateSpace => 'Teie privaatne ruum';

  @override
  String get purgePersonalNotes => 'Kustuta isiklikud märkmed';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'See kustutab jäädavalt iga sõnumi ja manuse teie isiklikest märkmetest. Seda ei saa tagasi võtta.';

  @override
  String get purgePersonalNotesConfirmButton => 'Kustuta';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Kustutati $count sõnumit isiklikest märkmetest';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Isiklikud märkmed olid juba tühjad';

  @override
  String get purgePersonalNotesFailed =>
      'Isiklikke märkmeid ei saanud tühjendada';

  @override
  String get userSettingsGroupYourAccount => 'TEIE KONTO';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profiil';

  @override
  String get userSettingsNavSecurityLogin => 'Turvalisus ja sisselogimine';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Kingitused ja koodid';

  @override
  String get userSettingsNavExpressionPacks => 'Emotsioonipaketid';

  @override
  String get userSettingsNavPrivacyDashboard => 'Privaatsusjuhtpaneel';

  @override
  String get userSettingsNavAuthorizedApps => 'Volitatud rakendused';

  @override
  String get userSettingsNavBlockedUsers => 'Blokeeritud kasutajad';

  @override
  String get userSettingsNavLinkedDevices => 'Lingitud seadmed';

  @override
  String get userSettingsNavConnections => 'Ühendused';

  @override
  String get userSettingsNavLookAndFeel => 'Välimus';

  @override
  String get userSettingsNavAccessibility => 'Ligipääsetavus';

  @override
  String get userSettingsNavMessagesAndMedia => 'Sõnumid ja meedia';

  @override
  String get userSettingsNavAudioAndVideo => 'Heli ja video';

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
  String get userSettingsNavSoundsAndAlerts => 'Helid ja teavitused';

  @override
  String get userSettingsNavLanguageAndTime => 'Keel ja aeg';

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
  String get userSettingsNavAdvanced => 'Täpsemalt';

  @override
  String get advancedPerformanceReportingTitle => 'Toimivuse aruandlus';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Aidake Fluxerit parandada, jagades anonüümseid krahhi- ja toimivusandmeid.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Saada krahhi- ja toimivuse aruandeid';

  @override
  String get advancedPerformanceReportingDescription =>
      'Kõik aruandluses olevad andmed on anonüümsed ja saadetakse ainult Fluxeri enda jälgimisteenusesse – kolmandate osapoolte pakkujaid ei kasutata.';

  @override
  String get userSettingsNavApplications => 'Rakendused';

  @override
  String get userSettingsNavAppLogs => 'Rakenduse logid';

  @override
  String get userSettingsNavDeveloperTools => 'Arendaja tööriistad';

  @override
  String get userSettingsNavLimitsConfig => 'Piirangute konfiguratsioon';

  @override
  String get userSettingsNavFeatureFlags => 'Funktsioonide lipud';

  @override
  String get userSettingsNavWhatsNew => 'Mis on uut';

  @override
  String get userSettingsNavLogOut => 'Logi välja';

  @override
  String get betaWarningTitle => 'Beetatarkvara';

  @override
  String get betaWarningMessage =>
      'See on beetatarkvara. Mitte kõik pole veel valmis ega lisatud.';

  @override
  String get betaWarningReportIssues =>
      'Palun teatage kõigist leitud probleemidest Fluxeri mobiili kogukonnale (praegu saate kogukonnaga liitumiseks vajalik Plutonium).';

  @override
  String get betaWarningRepoLink => 'Vaata lähtekoodi GitHubis';

  @override
  String get betaWarningGotIt => 'Sain aru';

  @override
  String get quickSwitcherTabSearch => 'Otsing';

  @override
  String get quickSwitcherTabFriends => 'Sõbrad';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Otsi kanaleid, inimesi või kogukondi';

  @override
  String get quickSwitcherSearchFriends => 'Otsi sõpru';

  @override
  String get quickSwitcherNoMatchesFound => 'Tulemusi ei leitud';

  @override
  String get quickSwitcherEmptyHint =>
      'Proovi teist nime või kasuta tulemuste filtreerimiseks eesliiteid @ / # / ! / *.';

  @override
  String get quickSwitcherSectionPeople => 'Inimesed';

  @override
  String get quickSwitcherSectionGroupMessages => 'Grupisõnumid';

  @override
  String get quickSwitcherSectionTextChannels => 'Tekstikanalid';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Häälkanalid';

  @override
  String get quickSwitcherSectionCommunities => 'Kogukonnad';

  @override
  String get quickSwitcherSectionSettings => 'Sätted';

  @override
  String get quickSwitcherHomeLabel => 'Kodu';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Otsesõnumid';

  @override
  String get quickSwitcherFavoritesLabel => 'Lemmikud';

  @override
  String get quickSwitcherUserSettingsLabel => 'Kasutaja sätted';

  @override
  String get quickSwitcherNotificationsLabel => 'Teavitused';

  @override
  String get quickSwitcherBookmarksLabel => 'Järjehoidjad';

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
  String get quickSwitcherMentionsLabel => 'Mainimised';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Pole veel sõpru';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Lisa sõber, et alustada.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Ühtegi sõpra ei vasta otsingule';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Proovi teist nime.';

  @override
  String get quickSwitcherSearchAliasUser => 'Kasutaja';

  @override
  String get quickSwitcherSearchAliasYou => 'Sina';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM-id';

  @override
  String get quickSwitcherSearchAliasMessages => 'Sõnumid';

  @override
  String get quickSwitcherSearchAliasFav => 'Lemmik';

  @override
  String get quickSwitcherSearchAliasStarred => 'Tärniga';

  @override
  String get quickSwitcherSearchAliasInbox => 'Postkast';

  @override
  String get quickSwitcherSearchAliasSaved => 'Salvestatud';

  @override
  String get uiClose => 'Sulge';

  @override
  String get chatJumpToBottom => 'Hüppa alla';

  @override
  String get uiConfirm => 'Kinnita';

  @override
  String get uiLoading => 'Laeb';

  @override
  String get uiUnsavedChanges => 'Salvestamata muudatused';

  @override
  String get uiReset => 'Lähtesta';

  @override
  String get uiOpenColorPicker => 'Ava värvivalija';

  @override
  String get uiSelectPlaceholder => 'Vali';

  @override
  String get uiSearchPlaceholder => 'Otsi';

  @override
  String get uiNoOptionsFound => 'Valikuid ei leitud';

  @override
  String get uiDismissNotification => 'Sulge teavitus';

  @override
  String get uiColorPickerTitle => 'Värvivalija';

  @override
  String get mentionConfirmTitle => 'Mainida kõiki?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'See teavitab $count liiget. Jätkata?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'See teavitab $count võrgus olevat liiget. Jätkata?';
  }

  @override
  String get mentionConfirmButton => 'Maini';

  @override
  String get composerEmojiUnavailable =>
      'Sa ei saa seda emotikoni siin kasutada.';

  @override
  String get instanceUrlLabel => 'Eksemplari URL';

  @override
  String get instanceUrlPlaceholder => 'Sisesta eksemplari URL (nt fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Lähtesta Fluxerile';

  @override
  String get instanceConnect => 'Ühenda';

  @override
  String get instanceConnecting => 'Ühendub…';

  @override
  String get instanceConnectFailed => 'Ühendus instansiga nurjus';

  @override
  String get recentInstances => 'Hiljutised instansid';

  @override
  String removeRecentInstance(String domain) {
    return 'Eemalda $domain hiljutistest instansidest';
  }

  @override
  String get instanceSheetTitle => 'Ühenda instansiga';

  @override
  String get connectToDifferentInstance => 'Ühendu teise instansiga';

  @override
  String get changeInstance => 'Muuda';

  @override
  String get instanceConnectionRequired => 'Logimiseks ühendu instansiga';

  @override
  String get comingSoon => 'Varsti saadaval';

  @override
  String get guildNavbarDirectMessages => 'Otsesõnumid';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Sirvi avastatavaid kogukondi';

  @override
  String get discoveryExplore => 'Sirvi';

  @override
  String get discoveryExplorePublicCommunities => 'Sirvi avalikke kogukondi';

  @override
  String get discoveryListingSubheading =>
      'Soovid oma kogukonda siia lisada? Kandideeri, kui vastad nõuetele oma kogukonna seadetes > Avastamine.';

  @override
  String get discoverySearchCommunities => 'Otsi kogukondi';

  @override
  String get discoveryFilterByLanguage => 'Filtreeri keele järgi';

  @override
  String get discoveryAllLanguages => 'Kõik keeled';

  @override
  String get discoveryAllCategories => 'Kõik';

  @override
  String get discoveryCategoryGaming => 'Mängud';

  @override
  String get discoveryCategoryMusic => 'Muusika';

  @override
  String get discoveryCategoryEntertainment => 'Meelelahutus';

  @override
  String get discoveryCategoryEducation => 'Haridus';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Teadus ja tehnoloogia';

  @override
  String get discoveryCategoryContentCreator => 'Sisuloojad';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime ja manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmid ja TV';

  @override
  String get discoveryCategoryOther => 'Muu';

  @override
  String get discoveryNoCommunitiesMatch => 'Ühtegi kogukonda ei leitud.';

  @override
  String get discoveryJoinCommunity => 'Liitu kogukonnaga';

  @override
  String get discoveryJoined => 'Liitunud';

  @override
  String discoveryOnlineCount(String count) {
    return '$count võrgus';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString liiget',
      one: '1 liige',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Kirjeldust pole.';

  @override
  String get discoveryCommunities => 'Kogukonnad';

  @override
  String get discoveryApps => 'Rakendused';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Kogukonnaga ei õnnestunud liituda';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Midagi läks valesti. Proovi mõne hetke pärast uuesti.';

  @override
  String get discoveryJoinErrorFullTitle => 'See kogukond on täis';

  @override
  String get discoveryJoinErrorFullMessage =>
      'See kogukond on oma liikmete piirangu saavutanud, seega ei saa sa praegu liituda.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Oled jõudnud kogukondade piirini';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Oled maksimaalses kogukondade arvus. Lahku ühest ja proovi uuesti.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Sa ei saa selle kogukonnaga liituda';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Sind on sellest kogukonnast eemaldatud.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'See kogukond pole enam saadaval';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'See on võib-olla avastamisest lahkunud või uued liitumised välja lülitanud. Värskenda lehte ja sa ei näe seda enam.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Liiga kiiresti tegutsed';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Oota hetk ja proovi uuesti.';

  @override
  String get guildNavbarAddCommunity => 'Lisa kogukond';

  @override
  String get guildNavbarHelp => 'Abi';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'UUS SÕNUM';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Voldi $folderName kokku';
  }

  @override
  String get guildNavbarGroupDm => 'Grupivestlus';

  @override
  String get guildNavbarCreateChannel => 'Loo kanal';

  @override
  String get guildNavbarChannelType => 'Kanali tüüp';

  @override
  String get guildNavbarTextChannel => 'Tekstikanal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Saada sõnumeid, pilte, GIF-e ja emotikone';

  @override
  String get guildNavbarVoiceChannel => 'Häälkanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Veetke koos aega hääle, video ja ekraanijagamisega';

  @override
  String get guildNavbarLinkChannel => 'Lingikanal';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Kiire juurdepääs välisele veebisaidile või ressursile';

  @override
  String get guildNavbarNameLabel => 'Nimi';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Loo kategooria';

  @override
  String get guildNavbarNewCategoryHint => 'Uus kategooria';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Kutsu sõpru $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Saajad suunatakse #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Otsi sõpru';

  @override
  String get guildNavbarNoFriendsYet => 'Pole veel sõpru';

  @override
  String get guildNavbarNoResults => 'Tulemusi pole';

  @override
  String get guildNavbarInviteLinkPrompt => 'Või saada kutselink sõbrale:';

  @override
  String get guildNavbarInviteLink => 'Kutselink';

  @override
  String get guildNavbarCopy => 'Kopeeri';

  @override
  String get guildNavbarCopied => 'Kopeeritud!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Sinu kutselink aegub 7 päeva pärast.';

  @override
  String get guildNavbarInviteNeverExpires => 'See kutselink ei aegu kunagi.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Sinu kutselink aegub $duration pärast.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Muuda kutselinki';

  @override
  String get guildNavbarInviteLinkSettings => 'Kutselingi sätted';

  @override
  String get guildNavbarExpireAfter => 'Aegub pärast';

  @override
  String get guildNavbarMaxUses => 'Maksimaalne kasutuskorra arv';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Anna ajutine liikmelisus';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Liikmed eemaldatakse, kui nad lähevad võrguühenduseta, välja arvatud juhul, kui roll on määratud';

  @override
  String get guildNavbarCreateNewLink => 'Loo uus link';

  @override
  String get guildNavbarSent => 'Saadetud';

  @override
  String get guildNavbarInvite => 'Kutsu';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Lahku kogukonnast';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Kas olete kindel, et soovite sellest kogukonnast lahkuda? Te ei saa enam ühtegi sõnumit näha.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Lahku kogukonnast';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Kustuta oma sõnumid selles kogukonnas?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Kustuta jäädavalt iga sõnum, mille olete siin igas kanalis saatnud. Seda ei saa tagasi võtta.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Kustuta minu sõnumid';

  @override
  String get guildNavbarDeletedYourMessages => 'Kustutasite oma sõnumid';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Ei õnnestunud teie sõnumeid kustutada';

  @override
  String get guildNavbarRemoveOverride => 'Eemalda ülekatte';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Vaigistatud kuni $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Ainult Fluxeri personali jaoks saadaval';

  @override
  String get guildNavbarInvitesPaused =>
      'Kutsed on selles kogukonnas praegu peatatud';

  @override
  String get guildNavbarDurationNever => 'mitte kunagi';

  @override
  String get guildNavbarDuration30Minutes => '30 minutit';

  @override
  String get guildNavbarDuration1Hour => '1 tund';

  @override
  String get guildNavbarDuration6Hours => '6 tundi';

  @override
  String get guildNavbarDuration12Hours => '12 tundi';

  @override
  String get guildNavbarDuration1Day => '1 päev';

  @override
  String get guildNavbarDuration7Days => '7 päeva';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekundit';
  }

  @override
  String get guildNavbarNever => 'Mitte kunagi';

  @override
  String get guildNavbarNoLimit => 'Piiramatu';

  @override
  String get guildNavbarOneUse => '1 kasutus';

  @override
  String guildNavbarUses(int count) {
    return '$count kasutus';
  }

  @override
  String get guildMenuMarkAsRead => 'Märgi loetuks';

  @override
  String get guildPeekMoreOptions => 'Rohkem valikuid';

  @override
  String get guildMenuInviteMembers => 'Kutsu liikmeid';

  @override
  String get guildMenuCommunitySettings => 'Kogukonna seaded';

  @override
  String get guildMenuEditCommunityProfile => 'Muuda kogukonna profiili';

  @override
  String get guildMenuUnmuteCommunity => 'Tühista kogukonna vaigistus';

  @override
  String get guildMenuMuteCommunity => 'Vaigista kogukond';

  @override
  String get guildMenuHideMutedChannels => 'Peida vaigistatud kanalid';

  @override
  String get guildMenuReportCommunity => 'Teata kogukonnast';

  @override
  String get guildMenuDebugCommunity => 'Kogukonna silumine';

  @override
  String get guildMenuCopyCommunityId => 'Kopeeri kogukonna ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Kuni $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Üldine';

  @override
  String get guildMenuSettingsRoles => 'Rollid ja õigused';

  @override
  String get guildMenuSettingsEmoji => 'Kohandatud emotikonid';

  @override
  String get guildMenuSettingsStickers => 'Kohandatud kleebised';

  @override
  String get guildMenuSettingsSafetyModeration => 'Turvalisus ja modereerimine';

  @override
  String get guildMenuSettingsActivityLog => 'Tegevuslogi';

  @override
  String get guildMenuSettingsWebhooks => 'Võrgukonksud';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Kohandatud kutse URL';

  @override
  String get guildMenuSettingsDiscovery => 'Avastamine';

  @override
  String get guildMenuSettingsMembers => 'Liikmed';

  @override
  String get guildMenuSettingsInviteLinks => 'Kutselingid';

  @override
  String get guildMenuSettingsBans => 'Keelud';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Sul pole luba seda seadete vahekaarti vaadata.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikoon';

  @override
  String get guildSettingsUploadImage => 'Laadi pilt üles';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Laadi üles oma serveri jaoks banner.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nimi';

  @override
  String get guildSettingsOverviewNameHint => 'Minu äge kogukond';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistika';

  @override
  String get guildSettingsOverviewMembers => 'Liikmed';

  @override
  String get guildSettingsOverviewOnline => 'Veebis';

  @override
  String get guildSettingsRolesDescription =>
      'Kasuta rolle liikmete grupeerimiseks ja õiguste määramiseks.';

  @override
  String get guildSettingsCreateRole => 'Loo roll';

  @override
  String get guildSettingsRolesListTitle => 'Rollid';

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
    return '$staticCount staatilist, $animatedCount animeeritud emotikonikohta kasutatud';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Veel pole kohandatud emotikone.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count kleebist üles laaditud';
  }

  @override
  String get guildSettingsStickersEmpty => 'Veel pole kohandatud kleebiseid.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Liikmete kinnitamine';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Valige, mida liikmed peavad omama, enne kui nad saavad kogukonna liikmetele postitada või saata otsesõnumeid.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Rollidega liikmed saavad neid kontrolle ignoreerida. Avalike ruumide puhul soovitame verifitseerimist lubada.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Discovery\'s loetletud kogukonnad nõuavad vähemalt kinnitatud e-posti aadressi. Kui Discovery on lubatud, ei saa valikut \"Puudub\" valida.';

  @override
  String get guildSettingsModerationMatureTitle => 'Küpsem sisu ja hoiatused';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigureerige küpse sisu märgistamine ja liikmete jaoks valikulised hoiatused.';

  @override
  String get guildSettingsModerationMatureToggle => 'Küpsem sisu';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Märkige see kogukond küpse sisuga.';

  @override
  String get guildSettingsVerificationNone => 'Puudub';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Verifitseerimine pole vajalik.';

  @override
  String get guildSettingsVerificationLow => 'Madal';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Nõuab kinnitatud e-posti aadressi.';

  @override
  String get guildSettingsVerificationMedium => 'Keskmine';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Nõuab kinnitatud e-posti aadressi ja konto, mis on vähemalt 5 minutit vana.';

  @override
  String get guildSettingsVerificationHigh => 'Kõrge';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Nõuab kõike keskmises tasemes, lisaks kogukonna liikmena olemist vähemalt 10 minutit.';

  @override
  String get guildSettingsVerificationHighest => 'Väga kõrge';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Nõuab kinnitatud telefoninumbrit.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Jälgige moderaatorite tegevusi kogu kogukonnas.';

  @override
  String get guildSettingsAuditLogEmpty => 'Ühtegi logi pole veel';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Modereerimistegevused ja kogukonna muudatused kuvatakse siin.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Kõik kasutajad';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Kõik tegevused';

  @override
  String get guildSettingsAuditLogNoReason => 'Põhjust ei esitatud.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Tundmatu kasutaja';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Midagi läks valesti aktiivsuslogi laadimisel.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Aktiivsuslogisid ei saa laadida';

  @override
  String get guildSettingsAuditLogReason => 'Põhjus';

  @override
  String get guildSettingsAuditLogSomeone => 'keegi';

  @override
  String get guildSettingsAuditLogSomething => 'midagi';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'tundmatu üksus';

  @override
  String get guildSettingsAuditLogNothing => 'mitte midagi';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Tundmatu sihtmärk';

  @override
  String get auditLogActionGuildUpdate => 'Kogukond värskendatud';

  @override
  String get auditLogActionChannelCreate => 'Kanal loodud';

  @override
  String get auditLogActionChannelUpdate => 'Kanal värskendatud';

  @override
  String get auditLogActionChannelDelete => 'Kanal kustutatud';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Kanalile lisati ülekatte';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanalile lisatud ülekatte värskendatud';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanalile lisatud ülekatte eemaldatud';

  @override
  String get auditLogActionMemberKick => 'Liige välja visatud';

  @override
  String get auditLogActionMemberPrune => 'Liikmeid kärbitud';

  @override
  String get auditLogActionMemberBanAdd => 'Liige keelatud';

  @override
  String get auditLogActionMemberBanRemove => 'Liige keelust vabastatud';

  @override
  String get auditLogActionMemberUpdate => 'Liige värskendatud';

  @override
  String get auditLogActionMemberRoleUpdate => 'Liikme rollid värskendatud';

  @override
  String get auditLogActionMemberMove => 'Liige liigutatud';

  @override
  String get auditLogActionMemberDisconnect => 'Liige lahti ühendatud';

  @override
  String get auditLogActionBotAdd => 'Bot lisatud';

  @override
  String get auditLogActionRoleCreate => 'Roll loodud';

  @override
  String get auditLogActionRoleUpdate => 'Roll värskendatud';

  @override
  String get auditLogActionRoleDelete => 'Roll kustutatud';

  @override
  String get auditLogActionInviteCreate => 'Kutse loodud';

  @override
  String get auditLogActionInviteUpdate => 'Kutse värskendatud';

  @override
  String get auditLogActionInviteDelete => 'Kutse kustutatud';

  @override
  String get auditLogActionWebhookCreate => 'Võrgukonks loodud';

  @override
  String get auditLogActionWebhookUpdate => 'Võrgukonks värskendatud';

  @override
  String get auditLogActionWebhookDelete => 'Võrgukonks kustutatud';

  @override
  String get auditLogActionEmojiCreate => 'Emotikon loodud';

  @override
  String get auditLogActionEmojiUpdate => 'Emotikon värskendatud';

  @override
  String get auditLogActionEmojiDelete => 'Emotikon kustutatud';

  @override
  String get auditLogActionStickerCreate => 'Kleebis loodud';

  @override
  String get auditLogActionStickerUpdate => 'Kleebis värskendatud';

  @override
  String get auditLogActionStickerDelete => 'Kleebis kustutatud';

  @override
  String get auditLogActionMessageDelete => 'Sõnum kustutatud';

  @override
  String get auditLogActionMessageBulkDelete => 'Sõnumid kustutatud';

  @override
  String get auditLogActionMessagePin => 'Sõnum kinnitatud';

  @override
  String get auditLogActionMessageUnpin => 'Sõnumi kinnitus eemaldatud';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor värskendas kogukonna sätteid.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor lõi kanali $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor värskendas kanalit $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor kustutas kanali $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor lisas kanali õigused $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor lisas kanali õigused $target kanalisse $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor värskendas kanali õigusi $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor värskendas kanali õigusi $target kanalisse $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor eemaldas kanali õigused $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor eemaldas kanali õigused $target kanalist $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor viskas välja $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor keelas $target juurdepääsu.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor lubas $target uuesti.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor värskendas $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor värskendas rolle $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor eemaldas passiivsed liikmed.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor eemaldas $days päeva jooksul passiivsed liikmed.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor viis $target teise häälkanalisse.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor viis $target kanalisse $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor lahutas $target häälest.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor lisas boti $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor lõi rolli $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor värskendas rolli $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor kustutas rolli $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor lõi kutse $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor lõi kutse $target kanalisse $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor värskendas kutset $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor värskendas kutset $target kanalisse $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor kustutas kutse $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor kustutas kutse $target kanalist $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor lõi võrgukonksu $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor värskendas võrgukonksu $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor kustutas võrgukonksu $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor lisas emotikoni $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor muutis emotikoni $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor kustutas emotikoni $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor lisas kleebise $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor muutis kleebise $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor kustutas kleebise $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor kustutas sõnumi.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor kustutas sõnumi kanalist $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor kustutas mitu sõnumit.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor kustutas $count sõnumit.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor kustutas mitu sõnumit kanalist $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor kustutas $count sõnumit kanalist $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor kinnitas sõnumi.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor kinnitas sõnumi kanalisse $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor vabastas sõnumi kinnitusest.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor vabastas sõnumi kinnitusest kanalist $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor teostas audititoimingu $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Muudeti $field $oldValue-lt $newValue-ks.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Määrati $field väärtuseks $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Tühjendati $field (oli $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Muudeti $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Muudeti kogukonna nimi $name-ks.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon => 'Muudeti kogukonna ikooni.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Muudeti kanali nimi $name-ks.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Tühjendati teema.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Muudeti teema $topic-ks.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Lubati küpsesisu.';

  @override
  String get auditLogChangeDisabledMatureContent => 'Keelati küpsesisu.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Määrati hüüdnimeks $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Eemaldati hüüdnimi $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Vaigistati liige.';

  @override
  String get auditLogChangeUnmutedMember => 'Vabastati liikme vaigistus.';

  @override
  String get auditLogChangeDeafenedMember => 'Keelati liikme heli.';

  @override
  String get auditLogChangeUndeafenedMember => 'Lubati liikme heli uuesti.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Lisati $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Eemaldati $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Sõnum: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Kutsus: $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kustutati # sõnumit.',
      one: 'Kustutati # sõnum.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eemaldati # liiget.',
      one: 'Eemaldati # liige.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'See kutse ei aegu kunagi.';

  @override
  String get auditLogOptionTemporaryMembership => 'Annab ajutise liikmelisuse.';

  @override
  String get auditLogOptionPermanentMembership => 'Annab alalise liikmelisuse.';

  @override
  String get guildSettingsLoadMore => 'Laadi rohkem';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Hallake veebikonksusid, mis postitavad sõnumeid kanalitesse.';

  @override
  String get guildSettingsWebhooksEmpty =>
      'Veebikonksusid pole konfigureeritud.';

  @override
  String get guildSettingsCopyUrl => 'Kopeeri URL';

  @override
  String get guildSettingsCopiedUrl => 'URL kopeeritud lõikelauale';

  @override
  String get guildSettingsDeleteWebhook => 'Kustuta veebikonks';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Määra oma serveri jaoks kohandatud kutselink.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Salvesta';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Kasutus';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count kasutuskorda';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Kandideeri, et saada serveri otsingusse kantud.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Kandideerimiseks on vaja vähemalt $count liiget.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Avaldus';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Olek';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategooria';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Kirjeldus';

  @override
  String get guildSettingsDiscoveryTags => 'Sildid';

  @override
  String get guildSettingsDiscoveryTagsHint => 'mängimine, kunst, muusika';

  @override
  String get guildSettingsDiscoveryApply => 'Esita avaldus';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Tühista';

  @override
  String get guildSettingsMembersDescription =>
      'Otsi ja hallake serveri liikmeid.';

  @override
  String get guildSettingsMembersSearchHint => 'Otsi liikmeid';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count liiget';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Vaata ja tühista aktiivseid kutselinke.';

  @override
  String get guildSettingsInvitesEmpty => 'Aktiivseid kutseid pole.';

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
    return '$uses / $maxUses kasutuskorda';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Aegub $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Vaata ja hallake keelatud kasutajaid.';

  @override
  String get guildSettingsBansSearchHint => 'Otsi keelde';

  @override
  String get guildSettingsBansEmpty => 'Keelatud kasutajaid pole.';

  @override
  String get guildSettingsBanPermanent => 'Püsikeeld';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Aegub $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Aegub';

  @override
  String get guildSettingsUnban => 'Tühista keeld';

  @override
  String get guildSettingsBansLoading => 'Keelatud kasutajaid laaditakse';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Sinu otsinguga ei leitud keelde.';

  @override
  String get guildSettingsBanDetailsTitle => 'Keelu üksikasjad';

  @override
  String get guildSettingsBanViewDetails => 'Vaata üksikasju';

  @override
  String get guildSettingsBannedOn => 'Keelatud';

  @override
  String get guildSettingsBannedBy => 'Keelas';

  @override
  String get guildSettingsRevokeBanTitle => 'Tühista keeld';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Kas olete kindel, et soovite tühistada $displayName keelu? Nad saavad kogukonda uuesti liituda.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return '$displayName keeld tühistatud';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Keelde ei õnnestunud laadida. Proovige uuesti.';

  @override
  String get guildSettingsRevokeBanError =>
      'Keelu tühistamine ebaõnnestus. Proovige uuesti.';

  @override
  String get guildSettingsCommunitySettings => 'Kogukonna seaded';

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
      'Hallake oma kogukonna profiili, kanaleid ja vaikesätteid.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Bränding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Värskendage oma ikooni, nime, bannerit ja kutse tausta';

  @override
  String get guildSettingsOverviewBannerUpload => 'Laadi banner üles';

  @override
  String get guildSettingsOverviewIdleTitle => 'Tühikäigu seaded';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfigureerige AFK-kanal ja aegumine';

  @override
  String get guildSettingsOverviewSystemTitle => 'Süsteem ja tervitus';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Valige süsteemi- ja tervitussõnumite sihtkoht';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Vaikesed teatised';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Üle 250 liikmega kogukonnad sunnitakse „ainult mainimiste“ seadistusele. Teie algne säte säilitatakse ja see taastatakse, kui kogukonna liikmete arv langeb alla 250.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Täpsemad seaded';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Luba paindlikke tekstikanali nimesid';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Peida kogukonna omaniku kroon';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Eraldiseisev bänner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Kuvab bänneri oma jaotises kogukonna päise all.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Laadi üles ikoon';

  @override
  String get guildSettingsOverviewRemoveImage => 'Eemalda';

  @override
  String get guildSettingsOverviewSplashTitle => 'Kutse taust';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Chati sisseehitatud taust';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Kuvatakse kutse sisseehitustes vestluses.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Laadi üles taust';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Pole kogukonna bännerit';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Pole kutse tausta';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Eelvaade';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Vaata, kuidas sinu kutse külastajatele välja näeb.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Tekstikanalite nimed';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Kogukonna omaniku kroon';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigureeri, kas krooniikooni kuvatakse kogukonna omaniku kõrval';

  @override
  String get guildSettingsSplashCardAlignment => 'Kaardi joondus';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Keskele';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Vasakule';

  @override
  String get guildSettingsSplashAlignmentRight => 'Paremale';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Kehtib ainult laiadel ekraanidel.';

  @override
  String get permissionReadMessageHistory => 'Loe sõnumite ajalugu';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Muuda seda, mida kasutajad ilma õiguseta \"$permission\" näevad';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Kasuta spetsiaalset modaali, et määrata sõnumite ajaloo piirangukuupäev liikmetele, kellel pole $permission õigust.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Ava sõnumite ajaloo piirang';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Sõnumite ajaloo piirang';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Luba sõnumite ajaloo piirang';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Piirangu kuupäev';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Liikmed, kellel puudub sõnumite ajaloo lugemise õigus, saavad vaadata pärast seda kuupäeva saadetud sõnumeid.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Sõnumite ajaloo piirang on värskendatud';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Luba tekstikanalite nimedes suurtähti ja tühikuid. Väljas piirab nimed väiketähtedega, sidekriipsu ja allkriipsu abil.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Peidab krooniikooni kogukonna omaniku kõrval kõikidel pindadel.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animeeritud ikoonid nõuavad animeeritud ikooni kogukonna funktsiooni.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animeeritud bännerid nõuavad animeeritud bänneri kogukonna funktsiooni.';

  @override
  String get guildSettingsAfkChannel => 'AFK / jõudeoleku kanal';

  @override
  String get guildSettingsAfkChannelHint =>
      'Liiguta liikmeid sellesse kanalisse, kui nad on AFK-s.';

  @override
  String get guildSettingsNoAfkChannel => 'Pole AFK kanalit';

  @override
  String get guildSettingsAfkTimeout => 'AFK aegumine';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minut';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minutit';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minutit';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minutit';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 tund';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekundit';
  }

  @override
  String get guildSettingsSystemChannel => 'Sihtkanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Tere tulemast ja süsteemisõnumid kuvatakse siin.';

  @override
  String get guildSettingsNoSystemChannel => 'Pole süsteemikanalit';

  @override
  String get guildSettingsHideJoinMessages => 'Peida liitumissõnumid';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Peidab liitumisteated sihtkanalist.';

  @override
  String get guildSettingsDefaultNotifications => 'Vaikimisi teavitusseaded';

  @override
  String get guildSettingsNotificationsAll => 'Kõik sõnumid';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Teavita kõigist sõnumitest';

  @override
  String get guildSettingsNotificationsMentions => 'Ainult mainimised';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Teavita ainult mainimistest';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Miinimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Miinimum: 960×540px (16:9). Kuvatakse kutse manustes vestluses.';

  @override
  String get guildSettingsModerationDescription =>
      'Konfigureerige kinnitamise, sisu filtreerimise ja küpse sisu seadeid.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Discovery\'s loetletud kogukondadel on piiratud modereerimisvalikud.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Sisu filtreerimine';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Ekraanige automaatselt sõnumeid otsese sisu osas kanalites, mis pole märgitud küpseks sisuks.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Discovery\'s loetletud kogukonnad peavad skannima kõiki liikmeid. Seda sätet ei saa muuta, kui Discovery on lubatud.';

  @override
  String get guildSettingsContentFilterOff => 'Väljas';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Laske kogukonnal end ise modereerida';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Filtreeri liikmeid ilma rollideta';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Soovitatav enamikule kogukondadele';

  @override
  String get guildSettingsContentFilterAll => 'Filtreeri kõiki';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maksimaalne kaitse peresõbralike ruumide jaoks';

  @override
  String get guildSettingsModerationMatureOff => 'Väljas';

  @override
  String get guildSettingsModerationMatureOn => 'Sees';

  @override
  String get guildSettingsContentWarningToggle => 'Näita sisutagasisidet';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Lülitab sisse nõusoleku hüpikakna enne mis tahes kanalisse sisenemist.';

  @override
  String get guildSettingsContentWarningText => 'Kohandatud hoiatuskiri';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'See sisaldab tundlikku sisu.';

  @override
  String get guildSettingsModeration2faTitle => '2FA nõue';

  @override
  String get guildSettingsModeration2faDescription =>
      'Nõua moderaatoritelt kahefaktorilist autentimist enne, kui nad saavad keelata, välja visata, ajatada või sõnumeid eemaldada.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Nõua 2FA modereerimistoiminguteks';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Ainult kogukonna omanik saab seda sätet muuta';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Luba oma kontol 2FA, et seda sätet muuta';

  @override
  String get guildSettingsEmojiSearchHint => 'Otsi emotikone';

  @override
  String get guildSettingsEmojiUploadTitle => 'Laadi emotikon üles';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Mitteanimeeritud emotikonid ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animeeritud emotikonid ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Otsi kleebiseid';

  @override
  String get guildSettingsWebhooksInfo =>
      'Looge webhooke kanali seadetest. Muutke neid siin.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Teie kohandatud URL ei tööta, välja arvatud juhul, kui vähemalt üks kanal on kõigile nähtav.';

  @override
  String get guildSettingsVanityUrlRemove => 'Eemalda';

  @override
  String get guildSettingsBannedUsersTitle => 'Keelatud kasutajad';

  @override
  String get guildSettingsInvitesTableInviter => 'Kutsuja';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Kood';

  @override
  String get guildSettingsInvitesTableUses => 'Kasutuskordi';

  @override
  String get guildSettingsInvitesTableCreated => 'Loodud';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Uusimad esimesena';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtreeri kasutaja järgi';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtreeri tegevuse järgi';

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
