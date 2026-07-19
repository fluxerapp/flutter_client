// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class FluxerLocalizationsAf extends FluxerLocalizations {
  FluxerLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get reconnectingTitle => 'Ons het geflikker!';

  @override
  String get reconnectingBody =>
      'Iets is fout met die bedieners.\nMoet binne \'n sekonde reggestel word!';

  @override
  String get gatewayReconnectingToast => 'Herkoppel...';

  @override
  String get gatewayConnectedToast => 'Gekoppel';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Kon nie begin nie: $error';
  }

  @override
  String get retry => 'Probeer weer';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Verbinding verloor';

  @override
  String get splashViewOnStatusPage => 'Bekyk op statusbladsy';

  @override
  String get splashConnectionIssuesPrompt => 'Verbindingsprobleme?';

  @override
  String get splashStatusPageLink => 'Statusbladsy';

  @override
  String get splashReadIncident => 'Lees voorval';

  @override
  String get splashIncidentHistory => 'Voorvalgeskiedenis';

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
  String get welcomeBack => 'Welkom terug';

  @override
  String get email => 'E-pos';

  @override
  String get emailInvalid => 'Voer asseblief \'n geldige e-posadres in.';

  @override
  String get password => 'Wagwoord';

  @override
  String get forgotPassword => 'Wagwoord vergeet?';

  @override
  String get logIn => 'Meld aan';

  @override
  String get logInWithPasskey => 'Meld aan met \'n passleutel';

  @override
  String continueWithSso(String provider) {
    return 'Gaan voort met $provider';
  }

  @override
  String get ssoRequired => 'SSO word vereis om hierdie instansie te betree.';

  @override
  String get organizationSsoProvider =>
      'Meld aan met jou organisasie se enkelteken-op-verskaffer.';

  @override
  String get failedToStartSso => 'Kon nie SSO begin nie';

  @override
  String get ssoCancelled => 'SSO-aanmelding is gekanselleer';

  @override
  String preferSso(String provider) {
    return 'Verkies jy om SSO te gebruik? Gaan voort met $provider.';
  }

  @override
  String get logInViaBrowser => 'Meld aan via blaaier';

  @override
  String get needAccountPrompt => 'Benodig \'n rekening? ';

  @override
  String get register => 'Registreer';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Verifieer dat jy menslik is';

  @override
  String get captchaDescription =>
      'Ons moet seker maak jy is nie \'n robot nie. Voltooi asseblief die verifikasie hieronder.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Probleme? Probeer hCaptcha in plaas daarvan';

  @override
  String get captchaSwitchToTurnstile => 'Probeer Turnstile in plaas daarvan';

  @override
  String get cancel => 'Kanselleer';

  @override
  String get ipAuthCheckEmail => 'Gaan jou e-pos na';

  @override
  String ipAuthDescription(String email) {
    return 'Ons het \'n skakel na jou e-pos gestuur om hierdie aanmelding te magtig. Maak asseblief jou inkassie oop vir $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Verbinding verloor';

  @override
  String get ipAuthConnectionLostDescription =>
      'Ons het die verbinding verloor terwyl ons vir magtiging gewag het. Probeer asseblief weer.';

  @override
  String get ipAuthLinkExpired => 'Aanmeldskakel het verval';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Hierdie magtigingskakel het verval. Meld asseblief weer aan.';

  @override
  String get ipAuthResendEmail => 'Stuur e-pos weer';

  @override
  String get ipAuthResent => 'Oorgestuur';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Terug';

  @override
  String get mfaTitle => 'Twee-faktor-verifikasie';

  @override
  String get mfaChooseMethod => 'Kies \'n verifikasiemetode';

  @override
  String get mfaMethodTotp => 'Verifikasie-toepassing';

  @override
  String get mfaMethodWebauthn => 'Sekuriteitsleutel / Passleutel';

  @override
  String get mfaTotpDescription =>
      'Voer die 6-syferkode van jou verifikasie-toepassing of een van jou rugsteunkodes in.';

  @override
  String get mfaCodeLabel => 'Kode';

  @override
  String get mfaTryAnotherMethod => 'Probeer \'n ander metode';

  @override
  String get mfaUseSecurityKey =>
      'Probeer sekuriteitsleutel / wagwoordfrase in plaas daarvan';

  @override
  String get accountSelectorTitle => 'Kies \'n rekening';

  @override
  String get accountSelectorDescription =>
      'Kies \'n rekening om voort te gaan, of voeg \'n ander by.';

  @override
  String get accountAdd => 'Voeg \'n rekening by';

  @override
  String get accountRemove => 'Verwyder';

  @override
  String accountRemoveTitle(String username) {
    return 'Verwyder $username';
  }

  @override
  String get accountRemoveDescription =>
      'Dit sal die gestoorde sessie vir hierdie rekening verwyder.';

  @override
  String get accountRemoveOnlyDescription =>
      'Dit sal die enigste gestoorde rekening op hierdie toestel verwyder.';

  @override
  String get accountExpired => 'Verval';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sessie het verval vir $identifier. Meld asseblief weer aan.';
  }

  @override
  String get accountManageTitle => 'Bestuur rekeninge';

  @override
  String get accountSwitchFailed =>
      'Kon nie rekeninge wissel nie. Probeer weer.';

  @override
  String get profileTabMenuSwitchAccounts => 'Wissel rekeninge';

  @override
  String get statusChangeSheetTitle => 'Stel status';

  @override
  String get statusOnlineStatusSection => 'Aanlyn status';

  @override
  String get statusOnline => 'Aanlyn';

  @override
  String get statusIdle => 'Ledig';

  @override
  String get statusDnd => 'Moenie steur nie';

  @override
  String get statusInvisible => 'Onsigbaar';

  @override
  String get statusOffline => 'Vanlyn';

  @override
  String get statusUntilIChangeIt => 'Tot ek dit verander';

  @override
  String get statusDontClear => 'Moenie uitvee nie';

  @override
  String get statusFor10Seconds => 'Vir 10 sekondes';

  @override
  String get statusClearAfter10Seconds => '10 sekondes';

  @override
  String get statusClearAfter15Minutes => '15 minute';

  @override
  String get statusClearAfter30Minutes => '30 minute';

  @override
  String get statusClearAfter1Hour => '1 uur';

  @override
  String get statusClearAfter3Hours => '3 ure';

  @override
  String get statusClearAfter4Hours => '4 ure';

  @override
  String get statusClearAfter8Hours => '8 ure';

  @override
  String get statusClearAfter24Hours => '24 ure';

  @override
  String get statusClearAfter3Days => '3 dae';

  @override
  String get statusDndDescription =>
      'Jy sal nie kennisgewings op rekenaar ontvang nie';

  @override
  String get statusInvisibleDescription => 'Jy sal vanlyn verskyn';

  @override
  String get customStatusSetTitle => 'Stel pasgemaakte status';

  @override
  String get customStatusCurrentHint => 'Huidige pasgemaakte status';

  @override
  String get customStatusClear => 'Vee pasgemaakte status uit';

  @override
  String get customStatusPlaceholder => 'Wat gebeur?';

  @override
  String get customStatusChooseEmoji => 'Kies \'n emoji';

  @override
  String get customStatusClearAfter => 'Vee uit na';

  @override
  String get customStatusSave => 'Stoor';

  @override
  String get accountActive => 'Aktiewe rekening';

  @override
  String get signOut => 'Teken uit';

  @override
  String get suspendedPermanentTitle => 'Rekening permanent opgeskort';

  @override
  String get suspendedTemporaryTitle => 'Rekening opgeskort';

  @override
  String get suspendedPermanentDescription =>
      'Jou rekening is permanent opgeskort vir die oortreding van ons Diensvoorwaardes.';

  @override
  String get suspendedTemporaryDescription =>
      'Jou rekening is tydelik opgeskort. Jy sal toegang tot jou rekening hê sodra die opskortingstydperk eindig.';

  @override
  String get suspendedIssuedAt => 'Uitgereik';

  @override
  String get suspendedEndsAt => 'Eindig';

  @override
  String get suspendedDuration => 'Duur';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Rede';

  @override
  String get suspendedAppealDeadline => 'Appèl Sperdatum';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Jou rekening is geskeduleer vir uitvee op $date.';
  }

  @override
  String get suspendedRecheck => 'Kontroleer vir Opdaterings';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Probeer weer oor ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Terug na Intekening';

  @override
  String get suspendedAppealTitle => 'Appèl';

  @override
  String get suspendedAppealHint =>
      'Verduidelik hoekom jou skorsing verwerp moet word (minimum 50 karakters)...';

  @override
  String get suspendedAppealSubmit => 'Dien Appèl in';

  @override
  String get suspendedAppealPending => 'Hangende Hersiening';

  @override
  String get suspendedAppealAccepted => 'Appèl Aanvaar';

  @override
  String get suspendedAppealRejected => 'Appèl Verwerp';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Jou appèl is aanvaar en jou rekening is herstel.';

  @override
  String get suspendedSignIn => 'Teken In op Jou Rekening';

  @override
  String get forgotPasswordTitle => 'Wagwoord Vergeet?';

  @override
  String get forgotPasswordDescription =>
      'Voer jou e-posadres in en ons sal vir jou \'n skakel stuur om jou wagwoord terug te stel.';

  @override
  String get forgotPasswordSubmit => 'Stuur terugstel skakel';

  @override
  String get forgotPasswordSentTitle => 'Gaan jou e-pos na';

  @override
  String get forgotPasswordSentDescription =>
      'Ons het wagwoordterugstel-instruksies na jou e-posadres gestuur. Gaan asseblief jou inkassie na en volg die skakel om jou wagwoord terug te stel.';

  @override
  String get forgotPasswordBackToLogin => 'Terug na intekening';

  @override
  String get resetPasswordTitle => 'Stel nuwe wagwoord';

  @override
  String get resetPasswordDescription =>
      'Voer jou nuwe wagwoord hieronder in om die terugstelproses te voltooi.';

  @override
  String get resetPasswordNewPassword => 'Nuwe wagwoord';

  @override
  String get resetPasswordConfirm => 'Bevestig nuwe wagwoord';

  @override
  String get resetPasswordSubmit => 'Stel wagwoord terug';

  @override
  String get resetPasswordMismatch => 'Wagwoorde stem nie ooreen nie.';

  @override
  String get registerTitle => 'Skep \'n rekening';

  @override
  String get registerDisplayName => 'Vertoonnaam (Opsioneel)';

  @override
  String get registerDisplayNameHint => 'Wat moet mense jou noem?';

  @override
  String get registerUsername => 'Gebruikersnaam (Opsioneel)';

  @override
  String get registerUsernameHint =>
      'Los leeg vir \'n ewekansige gebruikersnaam';

  @override
  String get registerUsernameTagHint =>
      ' \'n 4-syfer-tag sal outomaties bygevoeg word om uniekheid te verseker';

  @override
  String get registerDateOfBirth => 'Geboortedatum';

  @override
  String get registerMonth => 'Maand';

  @override
  String get registerDay => 'Dag';

  @override
  String get registerYear => 'Jaar';

  @override
  String get registerConsent =>
      'Ek stem in tot die Diensbepalings en Privaatheidsbeleid';

  @override
  String get registerConsentPrefix => 'Ek stem in tot die ';

  @override
  String get registerConsentTerms => 'Diensbepalings';

  @override
  String get registerConsentAnd => ' en ';

  @override
  String get registerConsentPrivacy => 'Privaatheidsbeleid';

  @override
  String get registerConfirmPassword => 'Bevestig wagwoord';

  @override
  String get registerSubmit => 'Skep rekening';

  @override
  String get registerHaveAccount => 'Het jy reeds \'n rekening? ';

  @override
  String get passkeyNoCredentials =>
      'Geen passkeys vir hierdie program gevind nie. Meld aan met e-pos en wagwoord in plaas daarvan.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys word nie op hierdie toestel ondersteun nie.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys is nie vir hierdie program gekonfigureer nie. Meld aan met e-pos en wagwoord in plaas daarvan.';

  @override
  String get passkeyTimeout =>
      'Passkey-verifikasie het uit tyd geloop. Probeer asseblief weer.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys is nie vir hierdie program beskikbaar nie. Meld aan met e-pos en wagwoord in plaas daarvan.';

  @override
  String get passkeyFailed =>
      'Lypasswoord-verifikasie het misluk. Probeer asseblief weer.';

  @override
  String get errorUnableToCreateAccount =>
      'Kon nie rekening skep nie. Probeer asseblief weer.';

  @override
  String get errorUnableToSignIn =>
      'Kon nie nou aanmeld nie. Probeer asseblief weer.';

  @override
  String get errorInvalidEmailOrPassword => 'Ongeldige e-pos of wagwoord.';

  @override
  String get errorUnableToSendResetLink =>
      'Kon nie terugstel-skakel stuur nie. Probeer asseblief weer.';

  @override
  String get errorUnableToResetPassword =>
      'Kon nie wagwoord terugstel nie. Probeer asseblief weer.';

  @override
  String get embedInviteJoin => 'Sluit aan by Gemeenskap';

  @override
  String get embedInviteGoTo => 'Gaan na Gemeenskap';

  @override
  String embedInviteOnline(String count) {
    return '$count Aanlyn';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Lede';
  }

  @override
  String get embedInviteUnknownTitle => 'Onbekende Uitnodiging';

  @override
  String get embedInviteUnknownSubtitle =>
      'Probeer om \'n nuwe uitnodiging te vra.';

  @override
  String get embedInviteUnavailable => 'Uitnodiging Nie Beskikbaar Nie';

  @override
  String get inviteAcceptTitle => 'Jy is uitgenooi om aan te sluit';

  @override
  String get inviteAcceptJoinButton => 'Sluit aan by Gemeenskap';

  @override
  String get inviteAcceptGoToButton => 'Gaan na Gemeenskap';

  @override
  String get inviteAcceptInvitesPaused => 'Uitnodigings Gepous';

  @override
  String get inviteAcceptNotFoundTitle => 'Uitnodiging Ongeldig';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Hierdie uitnodiging mag verval het of ongeldig wees.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Sluit aan by groep';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Jy is uitgenooi om by \'n groep-DM aan te sluit deur $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'iemand';

  @override
  String get inviteAcceptEmojiPack => 'Emoji-pakket';

  @override
  String get inviteAcceptStickerPack => 'Plakkerpakket';

  @override
  String get inviteAcceptInstallEmojiPack => 'Installeer emoji-pakket';

  @override
  String get inviteAcceptInstallStickerPack => 'Installeer plakkerpakket';

  @override
  String get inviteAcceptPackInstallNote =>
      'Deur hierdie uitnodiging te aanvaar, sal die pakket outomaties geïnstalleer word.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Kanaaltoegang Ontken';

  @override
  String get channelAccessDeniedDescription =>
      'Jy het nie toegang tot die kanaal waar hierdie boodskap gestuur is nie.';

  @override
  String get messageJumpLinkNoAccess => 'Geen toegang';

  @override
  String get okay => 'OK';

  @override
  String get embedThemeTitle => 'Gedeelde tema';

  @override
  String get embedThemeSubtitle =>
      'Hierdie kliënt ondersteun nie pasgemaakte temas nie.';

  @override
  String get embedThemeUnavailableButton => 'Temas nie beskikbaar nie';

  @override
  String get privacySettings => 'Privaatheidinstellings';

  @override
  String get privacyDirectMessages => 'Direkte boodskappe';

  @override
  String get privacyDirectMessagesDescription =>
      'Laat direkte boodskappe van ander lede in hierdie gemeenskap toe';

  @override
  String get privacyBotDirectMessages => 'Bot Direkte Boodskappe';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Laat bots van hierdie gemeenskap toe om jou direkte boodskappe te stuur';

  @override
  String get privacyMutualDmsDisabled =>
      'Die gemeenskapsadministrateurs het die ontvangs van direkte boodskappe slegs van wedersydse lede in hierdie gemeenskap gedeaktiveer.';

  @override
  String get communityDebug => 'Gemeenskapsontfouting';

  @override
  String get copiedToClipboard => 'Gekopieer na knipbord';

  @override
  String get notificationSettings => 'Kennisgewinginstellings';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Dem $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Om \'n gemeenskap te dem, verhoed dat ongelees-aanwysers en kennisgewings verskyn, tensy jy genoem word';

  @override
  String get notificationCommunitySettings =>
      'Gemeenskaps Kennisgewinginstellings';

  @override
  String get notificationAllMessages => 'Alle Boodskappe';

  @override
  String get notificationOnlyMentions => 'Slegs Vermeldings';

  @override
  String get notificationNothing => 'Niks';

  @override
  String get notificationSuppressEveryone => 'Onderdruk @almal en @hier';

  @override
  String get notificationSuppressRoles => 'Onderdruk Alle Rol @vermeldings';

  @override
  String get notificationMobilePush => 'Mobiele Stootkennisgewings';

  @override
  String get notificationOverrides => 'Kennisgewing Oorskrywings';

  @override
  String get notificationSelectChannel => 'Kies \'n kanaal of kategorie';

  @override
  String get notificationOnlyAtMentions => 'Slegs @vermeldings';

  @override
  String get notificationMuteChannel => 'Dem \'n kanaal';

  @override
  String get notificationUnmuteChannel => 'Hef dem van kanaal op';

  @override
  String get notificationNoCategory => 'Geen Kategorie';

  @override
  String get dmMarkAsRead => 'Merk as gelees';

  @override
  String get dmMuteConversation => 'Dem DM';

  @override
  String get dmUnmuteConversation => 'Hef DM-dem op';

  @override
  String get dmPinDm => 'Speld DM vas';

  @override
  String get dmUnpinDm => 'Verwyder DM-vaspenning';

  @override
  String get dmAlwaysShowInSidebar => 'Wys Altyd in Sybalk';

  @override
  String get dmRemoveFromAlwaysShown => 'Verwyder van Altyd Gewys';

  @override
  String get dmCloseDm => 'Sluit DM';

  @override
  String get dmCloseDmConfirmTitle => 'Sluit DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Is jy seker jy wil jou DM met $username sluit? Jy kan dit altyd later weer oopmaak.';
  }

  @override
  String get dmCopyChannelId => 'Kopieer Kanaal ID';

  @override
  String get dmChannelIdCopied => 'Kanaal ID gekopieer';

  @override
  String get dmCopyUserId => 'Kopieer Gebruiker ID';

  @override
  String get dmUserIdCopied => 'Gebruiker ID gekopieer';

  @override
  String get dmViewProfile => 'Bekyk Profiel';

  @override
  String get dmVoiceCall => 'Begin Stemoproep';

  @override
  String get incomingVoiceCallTitle => 'Inkomende stemoproep';

  @override
  String get incomingVoiceCallAccept => 'Aanvaar';

  @override
  String get incomingVoiceCallDecline => 'Verwerp';

  @override
  String get incomingVoiceCallLabel => 'Inkomende oproep';

  @override
  String get incomingVoiceCallIgnore => 'Ignoreer';

  @override
  String get directVoiceCallNotEligible =>
      'Hierdie oproep kan nie nou begin word nie. Probeer weer binne \'n oomblik.';

  @override
  String get voiceJoinCallFailed =>
      'Kon nie met hierdie oproep verbind nie. Kontroleer jou verbinding en probeer weer.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Kon nie hierdie oproep aansluit nie. Kontroleer jou verbinding en probeer weer.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Kon nie hierdie oproep op die bediener opdateer nie. Kontroleer jou verbinding en probeer weer.';

  @override
  String get dmAddNote => 'Voeg Nota by';

  @override
  String get dmEditGroup => 'Wysig Groep';

  @override
  String get dmInviteToCommunity => 'Nooi na Gemeenskap';

  @override
  String get dmBlock => 'Blokkeer';

  @override
  String get dmLeaveGroup => 'Verlaat Groep';

  @override
  String get dmNoCommunitiesAvailable => 'Geen gemeenskappe beskikbaar nie';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Lede';
  }

  @override
  String get dmMuteFor15Min => 'Vir 15 minute';

  @override
  String get dmMuteFor30Min => 'Vir 30 minute';

  @override
  String get dmMuteFor1Hour => 'Vir 1 uur';

  @override
  String get dmMuteFor3Hours => 'Vir 3 ure';

  @override
  String get dmMuteFor4Hours => 'Vir 4 ure';

  @override
  String get dmMuteFor8Hours => 'Vir 8 ure';

  @override
  String get dmMuteFor24Hours => 'Vir 24 ure';

  @override
  String get dmMuteFor3Days => 'Vir 3 dae';

  @override
  String get dmMuteForever => 'Tot ek dit weer aanskakel';

  @override
  String get dmPinGroupDm => 'Speld Groep DM vas';

  @override
  String get dmUnpinGroupDm => 'Gaan Groep DM uitpen';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Gunsteling DM';

  @override
  String get dmUnfavoriteDm => 'Verwyder gunsteling DM';

  @override
  String get dmFavoriteGroupDm => 'Gunsteling Groep DM';

  @override
  String get dmUnfavoriteGroupDm => 'Verwyder gunsteling Groep DM';

  @override
  String get dmChangeFriendNickname => 'Verander Vriend se Niggie';

  @override
  String get dmRemoveFriend => 'Verwyder Vriend';

  @override
  String get dmAddFriend => 'Voeg Vriend by';

  @override
  String get dmAcceptFriendRequest => 'Aanvaar Vriendversoek';

  @override
  String get dmIgnoreFriendRequest => 'Ignoreer Vriendversoek';

  @override
  String get dmFriendRequestSent => 'Vriendversoek Gestuur';

  @override
  String get dmUnblock => 'Ontblokkeer';

  @override
  String get dmDebugUser => 'Debug Gebruiker';

  @override
  String get dmDebugChannel => 'Debug Kanaal';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'DP Gepen';

  @override
  String get dmUnpinned => 'DP Uitgepen';

  @override
  String get dmMuted => 'DP Gedemp';

  @override
  String get dmUnmuted => 'DP Ontdemp';

  @override
  String get dmRemoveFriendConfirmTitle => 'Verwyder Vriend';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Is jy seker jy wil $username as \'n vriend verwyder?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blokkeer Gebruiker';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Is jy seker jy wil $username blokkeer? Hulle sal jou nie kan boodskap stuur of vriendversoeke stuur nie.';
  }

  @override
  String get dmFriendRequestSentToast => 'Vriendversoek gestuur';

  @override
  String get dmFriendRequestFailed => 'Kon nie vriendversoek stuur nie';

  @override
  String get dmAcceptFriendRequestFailed => 'Kon nie vriendversoek aanvaar nie';

  @override
  String get dmRemoveFriendFailed => 'Kon nie vriend verwyder nie';

  @override
  String get dmBlockFailed => 'Kon nie gebruiker blokkeer nie';

  @override
  String get dmUnblockFailed => 'Kon nie gebruiker debblokkeer nie';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Kon nie vriendversoek ignoreer nie';

  @override
  String get dmAddFriends => 'Voeg vriende by';

  @override
  String get addFriendSheetTitle => 'Voeg vriend by';

  @override
  String get addFriendUsernameHint => 'Gebruikersnaam#0000';

  @override
  String get addFriendUsernameLabel => 'Vriend se gebruikersnaam';

  @override
  String get addFriendSendRequest => 'Stuur versoek';

  @override
  String get addFriendNoUserFound =>
      'Geen gebruiker gevind met daardie gebruikersnaam nie.';

  @override
  String get addFriendInvalidUsername =>
      'Voer \'n geldige gebruikersnaam in (Gebruikersnaam#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Vriendversoek gestuur';

  @override
  String get addFriendClaimTitle => 'Eis jou rekening op';

  @override
  String get addFriendClaimDescription =>
      'Eis jou rekening op om vriendversoeke te stuur.';

  @override
  String get addFriendVerifyTitle => 'Verifieer jou e-pos';

  @override
  String get addFriendVerifyDescription =>
      'Jy moet jou e-posadres verifieer voordat jy vriendversoeke kan stuur.';

  @override
  String get addFriendVerifyEmail => 'Verifieer e-pos';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Inkomende vriendversoeke ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Uitgaande vriendversoeke ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Inkomende vriendversoek';

  @override
  String get addFriendOutgoingStatus => 'Vriendversoek gestuur';

  @override
  String get addFriendViewProfile => 'Bekyk profiel';

  @override
  String get addFriendAccept => 'Aanvaar';

  @override
  String get addFriendIgnore => 'Ignoreer';

  @override
  String get addFriendAcceptTitle => 'Aanvaar vriendversoek';

  @override
  String get addFriendIgnoreTitle => 'Ignore friend request';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Accept the friend request from $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignore the friend request from $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cancel request';

  @override
  String get addFriendCancelRequestFailed =>
      'Couldn\'t cancel the friend request. Try again.';

  @override
  String get addFriendNotAcceptingRequests =>
      'They\'re not accepting friend requests right now.';

  @override
  String get addFriendUnblockFirst =>
      'Unblock them first to send a friend request.';

  @override
  String get addFriendCannotSendToSelf =>
      'You can\'t send a friend request to yourself.';

  @override
  String get addFriendAlreadyFriends =>
      'You\'re already friends with this user.';

  @override
  String get addFriendClaimToSend =>
      'Finish signing up to send friend requests.';

  @override
  String get addFriendSendFailedGeneric =>
      'Couldn\'t send the friend request. Try again.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Stelsel';

  @override
  String get emojiSearchPlaceholder => 'Find the emoji of your dreams';

  @override
  String get emojiSearchEmpty => 'No emojis match your search';

  @override
  String get emojiAutocompleteDefaultLabel => 'Default emoji';

  @override
  String get emojiFrequentlyUsed => 'Frequently Used';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Stickers';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Search GIFs';

  @override
  String get gifPickerSearchKlipy => 'Search KLIPY';

  @override
  String get gifPickerSearchTenor => 'Search Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favorites';

  @override
  String get gifPickerTrending => 'Trending GIFs';

  @override
  String get gifPickerNoResultsTitle => 'No Search Results';

  @override
  String get gifPickerNoResultsDescription => 'Try another search term';

  @override
  String get gifPickerLoadFailedTitle => 'Couldn\'t load GIFs';

  @override
  String get gifPickerLoadFailedBody => 'Check your connection and try again.';

  @override
  String get emojiCategoryPeople => 'People';

  @override
  String get emojiCategoryNature => 'Nature';

  @override
  String get emojiCategoryFood => 'Food & Drink';

  @override
  String get emojiCategoryActivity => 'Activities';

  @override
  String get emojiCategoryTravel => 'Travel & Places';

  @override
  String get emojiCategoryObjects => 'Objects';

  @override
  String get emojiCategorySymbols => 'Symbols';

  @override
  String get emojiCategoryFlags => 'Flags';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Unlock $emojiCount from $communityCount with Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Get Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Don\'t show this again';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count custom emojis',
      one: '1 custom emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count communities',
      one: '1 community',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'External Link Warning';

  @override
  String get externalLinkWarningLeaving => 'You are about to leave Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'External links can be dangerous. Please be careful.';

  @override
  String get externalLinkWarningDestinationUrl => 'Destination URL:';

  @override
  String get externalLinksSectionTitle => 'External Links';

  @override
  String get externalLinksSectionDescription =>
      'Configure how external link warnings are handled.';

  @override
  String get externalLinkWarningTrustPrefix => 'Always trust ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — slaan hierdie waarskuwing die volgende keer oor';

  @override
  String get externalLinkVisitSite => 'Besoek Werf';

  @override
  String get externalLinkTrustAllLabel => 'Vertrou alle eksterne skakels';

  @override
  String get externalLinkStripTrackingLabel =>
      'Verwyder opsporingsparameters van URL\'s';

  @override
  String get externalLinkStripTrackingDescription =>
      'Verwyder outomaties opsporingsparameters (soos utm_source, fbclid, gclid) uit URL\'s in boodskappe wat jy stuur. Maak die skakel skoon voordat dit iemand anders bereik.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Vertrou alle eksterne skakels?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Dit sal alle eksterne skakels vertrou en die waarskuwing vir elke domein oorslaan. Jou bestaande vertroude domeine sal vervang word. Dit is minder veilig.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Vertrou Alles';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Hou op om alle skakels te vertrou?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Eksterne skakelwaarskuwings sal weer vertoon word. Jy sal domeine individueel moet byvoeg.';

  @override
  String get externalLinkStopTrustingAllAction => 'Deaktiveer Vertrou Alles';

  @override
  String get externalLinkTrustedAllDescription =>
      'Alle eksterne skakels word vertrou. Waarskuwings sal nie vertoon word nie.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Jy het $count vertroude domein(e). Voeg meer by deur die blokkie te merk wanneer jy eksterne skakels besoek.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Wanneer dit geaktiveer is, sal geen eksterne skakelwaarskuwings vertoon word nie. Dit is minder veilig.';

  @override
  String get imageFileTooLarge =>
      'Beeldlêer is te groot. Kies asseblief \'n lêer kleiner as 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Geanimeerde avatars vereis Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Geanimeerde baniere vereis Plutonium';

  @override
  String get animatedAvifNotSupported =>
      'Geanimeerde AVIF word nie ondersteun nie';

  @override
  String get animatedAvifNotSupportedBody =>
      'Om geanimeerde AVIF-lêers te sny en te draai word nog nie ondersteun nie. Indien jy voortgaan, sal dit in sy oorspronklike vorm opgelaai word.';

  @override
  String get uploadAsIs => 'Laai soos dit is op';

  @override
  String get croppingAnimatedNotSupported =>
      'Om geanimeerde beelde te sny word nog nie ondersteun nie. Die oorspronklike oplaai sal gebruik word.';

  @override
  String get cropAvatar => 'Sny Avatar';

  @override
  String get cropBanner => 'Sny Banier';

  @override
  String get skip => 'Slaan oor';

  @override
  String get crop => 'Sny';

  @override
  String get changeYourFluxerTag => 'Verander Jou FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Gebruikersname mag slegs letters (a-z, A-Z), nommers (0-9) en onderstreepies bevat. Gebruikersname is nie hoofletter-sensitief nie.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Gebruikersname mag slegs letters (a-z, A-Z), nommers (0-9) en onderstreepies bevat. Gebruikersname is nie hoofletter-sensitief nie. Jy kan enige beskikbare 4-syfer tag van #0000 tot #9999 kies.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Gebruikersname mag slegs letters (a-z, A-Z), nommers (0-9) en onderstreepies bevat. Gebruikersname is nie hoofletter-sensitief nie. Jy kan enige beskikbare 4-syfer tag van #0001 tot #9999 kies.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Tussen $min en $max karakters';
  }

  @override
  String get validationAllowedChars =>
      'Slegs letters (a-z, A-Z), nommers (0-9) en onderstreepies (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Kry Plutonium om jou tag aan te pas of behou dit wanneer jy jou gebruikersnaam verander';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag reeds geneem';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Die FluxerTag $username#$discriminator is reeds geneem. Indien jy voortgaan, sal jou discriminator outomaties weer gerol word.';
  }

  @override
  String get customTagIsTemporary => 'Pasgemaakte Tag is Tydelik';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Jou pasgemaakte 4-syfer tag is slegs beskikbaar solank jou Plutonium-intekening aktief is. Wanneer jou intekening op $date verval, sal jou tag na \'n ewekansig-toegewysde nommer terugkeer na \'n genadeperiode van 3 dae.';
  }

  @override
  String get customTagTemporaryBody =>
      'Jou pasgemaakte 4-syfer tag is slegs beskikbaar solank jou Plutonium-intekening aktief is. Wanneer jou intekening verval, sal jou tag na \'n ewekansig-toegewysde nommer terugkeer na \'n genadeperiode van 3 dae.';

  @override
  String get iUnderstandContinue => 'Ek Verstaan, Gaan Voort';

  @override
  String get premiumWarningPendingDiscriminator =>
      'As jy hierdie FluxerTag stoor, sal jou pasgemaakte 4-syfer tag na \'n ewekansige nommer terugkeer wanneer jou Plutonium-intekening eindig. Indien jou intekening nie hernu word nie, sal jy \'n genadeperiode van 3 dae hê voordat die tag verander.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Jou pasgemaakte 4-syfer tag (#$discriminator) is aktief solank jou Plutonium-intekening aktief is. Indien jou intekening eindig of nie hernu word na \'n genadeperiode van 3 dae nie, sal jou tag na \'n ewekansige nommer terugkeer.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Pas jou 4-syfer tag aan of behou dit wanneer jy jou gebruikersnaam verander';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Jou Plutonium-proeftydperk verval op $date. Gradeer op om jou pasgemaakte tag te behou en \'n kenteken op jou profiel te verdien.';
  }

  @override
  String get premiumTrialActive =>
      'Jy is op \'n Plutonium-proeftydperk. Gradeer op om jou pasgemaakte tag te behou en \'n kenteken op jou profiel te verdien.';

  @override
  String get fluxerTagUpdated => 'FluxerTag opgedateer';

  @override
  String get fluxerTagUpdateFailed =>
      'Kon nie FluxerTag opdateer nie. Probeer asseblief weer.';

  @override
  String get continueAction => 'Gaan Voort';

  @override
  String get profileCustomizationTitle => 'Profielaanpassing';

  @override
  String get profileCustomizationDescription =>
      'Wysig jou profielvoorkoms en sien \'n regstreekse voorskou';

  @override
  String get usernameLabel => 'Gebruikersnaam';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Eis jou rekening om jou FluxerTag te verander';

  @override
  String get changeFluxerTag => 'Verander FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Pas jou 4-syfer tag (#$discriminator) na wense aan met Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Verander jou gebruikersnaam en 4-syfer tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Jou pasgemaakte tag (#$discriminator) is gekoppel aan jou Plutonium-intekening en sal teruggkeer na \'n ewekansige tag indien dit verval.';
  }

  @override
  String get displayNameLabel => 'Vertoonnaam';

  @override
  String get pronounsLabel => 'Voornaamwoorde';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Verander Avatar';

  @override
  String get removeAvatar => 'Verwyder Avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maks 10MB. Aanbeveel: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Verander Banner';

  @override
  String get removeBanner => 'Verwyder Banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maks 10MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Aksentkleur';

  @override
  String get accentColorDescription =>
      'Pas die rand- en bannierkleur op jou profiel aan';

  @override
  String get aboutMeLabel => 'Oor My';

  @override
  String get aboutMeHelperText => 'Jy kan skakels, emoji en Markdown gebruik.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium-kentekenprivaatheid';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Beheer hoe jou Plutonium-kenteken aan ander vertoon word';

  @override
  String get hidePlutoniumBadgeLabel => 'Versteek Plutonium-kenteken heeltemal';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Versteek jou Plutonium-kenteken heeltemal vir ander gebruikers';

  @override
  String get hidePlutoniumPurchaseDate => 'Versteek Plutonium-aankoopdatum';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Versteek Plutonium-aankoopdatum ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Verwyder die datum waarop jy Plutonium eerste gekoop het van jou kenteken';

  @override
  String get maskVisionaryAsSubscription => 'Masker Visionary as intekening';

  @override
  String get maskVisionaryDescription =>
      'Wys jou Visionary as \'n gewone intekening';

  @override
  String get hideVisionaryIdBadge => 'Versteek Visionary ID-kenteken';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Versteek Visionary ID-kenteken (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Verwyder jou Visionary ID-kenteken';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Jy is op \'n Plutonium-proeflopie — jou intekening begin op $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Jou intekening sal outomaties begin wanneer jou proeflopie eindig. Geen aksie nodig nie.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Jy is op \'n Plutonium-proeflopie wat verval op $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Jy is op \'n Plutonium-proeflopie';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maks 10MB. Aanbeveel: 512×512px. Geanimeerde avatars (GIF) vereis Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Pas jou profiel aan met \'n statiese of geanimeerde bannierbeeld om dit te laat uitstaan.';

  @override
  String get getPlutonium => 'Kry Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Inprogram-aankope is nog nie op hierdie platform beskikbaar nie. Bly ingeskakel — kom binnekort!';

  @override
  String get profilePreviewLabel => 'Voorskou';

  @override
  String get profilePreviewMessage => 'Boodskap';

  @override
  String get profilePreviewMemberSince => 'Fluxer Lid Sedert';

  @override
  String get unclaimedAccountTitle => 'Ongeëisde rekening';

  @override
  String get unclaimedAccountDescription =>
      'Jou rekening is nog nie geëis nie. Sonder \'n e-pos en wagwoord, kan jy toegang verloor. Eis jou rekening nou om dit te beveilig.';

  @override
  String get claimAccount => 'Eis rekening';

  @override
  String get profileTypeLabel => 'Profieltipe';

  @override
  String get profileTypeGlobal => 'Globale Profiel';

  @override
  String get profileTypeGuildDescription =>
      'Jy wysig jou per-gemeenskap profiel. Hierdie profiel sal slegs in hierdie gemeenskap sigbaar wees en sal jou globale profiel oorskryf.';

  @override
  String get communityNicknameLabel => 'Gemeenskapsbynaam';

  @override
  String get perGuildPremiumUpsellText =>
      'Die aanpassing van jou avatar, banier, aksentkleur en biografie vir individuele gemeenskappe vereis Plutonium. Gemeenskapsbynaam en voornaamwoorde is gratis vir almal.';

  @override
  String get avatarModeInherit => 'Gebruik Globale Profiel';

  @override
  String get avatarModeCustom => 'Gebruik Pasgemaakte Prent';

  @override
  String get avatarModeUnset => 'Moenie Wys nie';

  @override
  String get profileSavedToast => 'Profiel opgedateer';

  @override
  String get profileEditButton => 'Wysig Profiel';

  @override
  String get profileNoteLabel => 'Nota';

  @override
  String get profileNoteVisibility => '(slegs vir jou sigbaar)';

  @override
  String get profileNoteEmpty => 'Nog geen nota nie.';

  @override
  String get sudoTitle => 'Verifieer Jou Identiteit';

  @override
  String get sudoDescription =>
      'Hierdie aksie vereis verifikasie om voort te gaan.';

  @override
  String get sudoAuthenticatorCode => 'Verifikasiekode';

  @override
  String get sudoMethodPassword => 'Wagwoord';

  @override
  String get sudoMethodTotp => 'Authenticator';

  @override
  String get sudoVerificationFailed =>
      'Verifikasie het misluk. Probeer asseblief weer.';

  @override
  String get securityAccountTitle => 'Rekening';

  @override
  String get securityAccountDescription =>
      'Bestuur jou e-pos, wagwoord en rekeninginstellings';

  @override
  String get securitySectionTitle => 'Sekuriteit';

  @override
  String get securitySectionDescription =>
      'Beskerm jou rekening met tweefaktor-verifikasie en passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'E-pos Instellings';

  @override
  String get securityLoginEmailSectionDescription =>
      'Bestuur die e-posadres wat jy gebruik om by Fluxer aan te meld';

  @override
  String get securityLoginEmailAddressLabel => 'E-posadres';

  @override
  String get securityLoginNoEmailSet => 'Geen e-posadres gestel nie';

  @override
  String get securityLoginChangeEmail => 'Verander E-pos';

  @override
  String get securityLoginAddEmail => 'Voeg E-pos by';

  @override
  String get securityLoginReveal => 'Wys';

  @override
  String get securityLoginHide => 'Versteek';

  @override
  String get securityLoginPasswordSectionTitle => 'Wagwoord';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Verander jou wagwoord om jou rekening veilig te hou';

  @override
  String get securityLoginCurrentPasswordLabel => 'Huidige Wagwoord';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Laas verander: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Laas verander: Nooit';

  @override
  String get securityLoginNoPasswordSet => 'Geen wagwoord gestel nie';

  @override
  String get securityLoginChangePassword => 'Verander Wagwoord';

  @override
  String get securityLoginSetPassword => 'Stel Wagwoord';

  @override
  String get passwordChangeTitle => 'Verander Wagwoord';

  @override
  String get passwordChangeIntroDescription =>
      'Ons sal \'n verifikasiekode na jou e-posadres stuur om jou identiteit te bevestig voordat jy jou wagwoord verander.';

  @override
  String get passwordChangeStart => 'Begin';

  @override
  String get passwordChangeVerifyTitle => 'Verifieer Jou E-pos';

  @override
  String get passwordChangeVerifyDescription =>
      'Voer die verifikasiekode in wat na jou e-posadres gestuur is.';

  @override
  String get passwordChangeVerificationCode => 'Verifikasiekode';

  @override
  String get passwordChangeVerify => 'Verifieer';

  @override
  String get passwordChangeNewPasswordTitle => 'Stel Nuwe Wagwoord';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Voer jou nuwe wagwoord hieronder in.';

  @override
  String get passwordChangeNewPassword => 'Nuwe Wagwoord';

  @override
  String get passwordChangeConfirmPassword => 'Bevestig Nuwe Wagwoord';

  @override
  String get passwordChangeSubmit => 'Verander Wagwoord';

  @override
  String get passwordChangeSuccess => 'Wagwoord verander';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Wagwoorde stem nie ooreen nie';

  @override
  String get passwordChangeInvalidCode => 'Ongeldige of vervalde kode';

  @override
  String get emailChangeTitle => 'Verander E-pos';

  @override
  String get emailChangeIntroDescription =>
      'Ons sal verifikasiekodes stuur om jou identiteit te verifieer voordat ons jou e-posadres verander.';

  @override
  String get emailChangeStart => 'Begin';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verifieer Huidige E-pos';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Voer die verifikasiekode in wat na jou huidige e-posadres gestuur is.';

  @override
  String get emailChangeNewEmailTitle => 'Voer Nuwe E-pos in';

  @override
  String get emailChangeNewEmailDescription =>
      'Voer die nuwe e-posadres in wat jy wil gebruik.';

  @override
  String get emailChangeNewEmailLabel => 'Nuwe E-pos';

  @override
  String get emailChangeNewEmailSubmit => 'Stuur Verifikasiekode';

  @override
  String get emailChangeVerifyNewTitle => 'Verifieer Nuwe E-pos';

  @override
  String get emailChangeVerifyNewDescription =>
      'Voer die verifikasiekode in wat na jou nuwe e-posadres gestuur is.';

  @override
  String get emailChangeSuccess => 'E-pos verander';

  @override
  String get emailChangeInvalidCode => 'Ongeldige of vervalde kode';

  @override
  String get resend => 'Resend';

  @override
  String resendCountdown(int seconds) {
    return 'Resend (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verifikasiekode';

  @override
  String get verify => 'Verifieer';

  @override
  String get enable => 'Aktiveer';

  @override
  String get disable => 'Deaktiveer';

  @override
  String get delete => 'Vee uit';

  @override
  String get save => 'Stoor';

  @override
  String get securityTfaSectionTitle => 'Twee-faktor-verifikasie';

  @override
  String get securityTfaSectionDescription =>
      'Voeg \'n ekstra vlak van sekuriteit by jou rekening';

  @override
  String get securityTfaAuthenticatorApp => 'Authenticator-toepassing';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Twee-faktor-verifikasie is geaktiveer';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Gebruik \'n authenticator-toepassing om kodes vir twee-faktor-verifikasie te genereer';

  @override
  String get securityTfaBackupCodes => 'Rugsteunkodes';

  @override
  String get securityTfaBackupCodesDescription =>
      'Bekyk en bestuur jou rugsteunkodes vir rekeningherstel';

  @override
  String get securityTfaViewCodes => 'Bekyk Kodes';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Gebruik passkeys vir wagwoordlose aanmelding en twee-faktor-verifikasie';

  @override
  String get securityPasskeysRegistered => 'Geregistreerde Passkeys';

  @override
  String get securityPasskeysNone => 'Geen passkeys geregistreer nie';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$count $_temp0 geregistreer (maks 10)';
  }

  @override
  String get securityPasskeysAdd => 'Voeg Passkey by';

  @override
  String securityPasskeysAdded(String date) {
    return 'Bygevoeg: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Laas gebruik: $date';
  }

  @override
  String get securityPasskeysRename => 'Hernoem';

  @override
  String get securityPasskeysDeleteTitle => 'Vee Passkey uit';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Is jy seker jy wil die passkey \"$name\" uitvee?';
  }

  @override
  String get securityPasskeyNameTitle => 'Noem Passkey';

  @override
  String get securityPasskeyNameLabel => 'Passkey Naam';

  @override
  String get securityPasskeyNameHint => 'bv. YubiKey, iPhone, Werkrekenaar';

  @override
  String get securityPhoneSectionTitle => 'Telefoonnommer';

  @override
  String get securityPhoneSectionDescription => 'Bestuur jou telefoonnommer.';

  @override
  String get securityPhoneLabel => 'Telefoonnommer';

  @override
  String get securityPhoneNone => 'Geen telefoonnommer bygevoeg nie.';

  @override
  String get securityPhoneAdd => 'Voegfoon by';

  @override
  String get securityPhoneRemove => 'Verwyder';

  @override
  String get securityPhoneRemoveTitle => 'Verwyder telefoonnommer';

  @override
  String get securityPhoneRemoveDescription =>
      'Is jy seker jy wil jou telefoonnommer verwyder?';

  @override
  String get securityPhoneRemoved => 'Telefoonnommer verwyder';

  @override
  String get securityClaimTitle => 'Veiligheidskenmerke';

  @override
  String get securityClaimDescription =>
      'Eis jou rekening op om toegang tot veiligheidskenmerke soos tweefaktor-verifikasie en wagwoord-sleutels te verkry.';

  @override
  String get securityVerifyEmailRequired =>
      'Jy moet jou e-posadres verifieer voordat jy tweefaktor-verifikasie, wagwoord-sleutels, of SMS-verifikasie kan opstel.';

  @override
  String get totpEnableTitle => 'Stel Verifikasie-app op';

  @override
  String get totpEnableDescription =>
      'Skandeer die QR-kode met jou verifikasie-app om kodes vir tweefaktor-verifikasie te genereer.';

  @override
  String get totpEnableCodeLabel => 'Kode';

  @override
  String get totpEnableCodeHint =>
      'Voer die 6-syferkode van jou verifikasie-app in';

  @override
  String get totpEnableSuccess => 'Tweefaktor-verifikasie is geaktiveer';

  @override
  String get totpDisableTitle => 'Verwyder Verifikasie-app';

  @override
  String get totpDisableDescription =>
      'Voer die 6-syferkode van jou verifikasie-app in om tweefaktor-verifikasie te deaktiveer.';

  @override
  String get totpDisableSuccess => 'Tweefaktor-verifikasie gedeaktiveer';

  @override
  String get backupCodesTitle => 'Rugsteunkodes';

  @override
  String get backupCodesWarning =>
      'As jy toegang tot jou verifikasie-app verloor en hierdie kodes nie het nie, sal jy permanent uit jou rekening gesluit word. Laai dit af of kopieer dit nou en stoor dit iewers veilig.';

  @override
  String get backupCodesDownload => 'Laai af';

  @override
  String get backupCodesCopy => 'Kopieer';

  @override
  String get backupCodesCopied => 'Rugsteunkodes na knipbord gekopieer';

  @override
  String get backupCodesAcknowledge =>
      'Ek het my rugsteunkodes afgelaai of gekopieer en dit op \'n veilige plek gebêre.';

  @override
  String get backupCodesDone => 'Klaar';

  @override
  String get backupCodesViewTitle => 'Bekyk Rugsteunkodes';

  @override
  String get backupCodesViewDescription =>
      'Verifikasie mag vereis word voordat u u rugsteunkodes bekyk.';

  @override
  String get phoneAddTitle => 'Voeg Telefoonnommer by';

  @override
  String get phoneAddLabel => 'Telefoonnommer';

  @override
  String get phoneAddHint => 'Voer jou telefoonnommer in';

  @override
  String get phoneAddFooter =>
      'Voer jou telefoonnommer in. Ons sal vir jou \'n verifikasiekode per SMS stuur.';

  @override
  String get phoneAddSendCode => 'Stuur Kode';

  @override
  String get phoneVerifyTitle => 'Verifieer Telefoonnommer';

  @override
  String get phoneVerifyDescription =>
      'Voer die verifikasiekode in wat na jou telefoonnommer gestuur is.';

  @override
  String get phoneAddSuccess => 'Telefoonnommer bygevoeg';

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
  String get dangerZoneSectionTitle => 'Gevaarsone';

  @override
  String get dangerZoneSectionDescription =>
      'Onherroeplike en vernietigende aksies';

  @override
  String get dangerZoneDisableTitle => 'Deaktiveer rekening';

  @override
  String get dangerZoneDisableDescription =>
      'Deaktiveer jou rekening tydelik. Jy kan dit later weer aktiveer deur weer aan te meld.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Om jou rekening te deaktiveer, sal jy uit alle sessies uitgemeld word. Jy kan jou rekening enige tyd weer aktiveer deur weer aan te meld.';

  @override
  String get dangerZoneDeleteTitle => 'Vee rekening uit';

  @override
  String get dangerZoneDeleteDescription =>
      'Vee jou rekening en alle geassosieerde data permanent uit. Hierdie aksie kan nie ongedaan gemaak word nie.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Kanselleer jou aktiewe Plutonium-intekening in Plutonium-instellings voordat jy jou rekening uitvee.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Kan nie rekening uitvee nie';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Jy kan nie jou rekening uitvee terwyl jy gemeenskappe besit nie. Dra eers eienaarskap van die volgende gemeenskappe oor:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'en $count meer';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Om eienaarskap oor te dra, gaan na $settingsPath en gebruik die opsie om eienaarskap oor te dra.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Is jy seker jy wil jou rekening uitvee? Hierdie aksie sal jou rekening vir permanente uitvee skeduleer.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Jy kan die vee-proses binne 14 dae kanselleer';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Na 14 dae sal jou rekening permanent uitgevee word';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Sodra die vee-proses voltooi is, kan jy nie toegang tot jou rekening herstel nie';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Jy sal nie jou gestuurde boodskappe kan uitvee nadat jou rekening uitgevee is nie';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'As jy jou data wil uitvoer of eers jou boodskappe wil uitvee, besoek asseblief die Privaatheids Kontroleskerm-afdeling in Gebruikersinstellings voordat jy voortgaan.';

  @override
  String get claimAccountTitle => 'Eis Jou Rekening';

  @override
  String get claimAccountDescription =>
      'Eis jou rekening deur \'n e-pos en wagwoord by te voeg. Ons sal \'n verifikasiekode stuur om jou e-pos te bevestig voordat ons klaarmaak.';

  @override
  String get claimAccountEmailLabel => 'E-pos';

  @override
  String get claimAccountPasswordLabel => 'Wagwoord';

  @override
  String get claimAccountSendCode => 'Stuur Kode';

  @override
  String get claimAccountVerifyDescription =>
      'Voer die kode in wat ons na jou e-pos gestuur het om dit te verifieer. Jou wagwoord sal gestel word sodra die kode bevestig is.';

  @override
  String get claimAccountSuccess => 'Rekening suksesvol geëis';

  @override
  String get importantInformation => 'Belangrike inligting:';

  @override
  String get genericError => '\'n Fout het voorgekom';

  @override
  String get invalidCode => 'Ongeldige kode';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jaar gelede',
      one: '1 jaar gelede',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count maande gelede',
      one: '1 maand gelede',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dae gelede',
      one: '1 dag gelede',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ure gelede',
      one: '1 uur gelede',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minute gelede',
      one: '1 minuut gelede',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'netnou';

  @override
  String get authorizedAppsTitle => 'Gemagtigde Toepassings';

  @override
  String get authorizedAppsDescription =>
      'Hierdie toepassings het toegang tot jou Fluxer-rekening verkry.';

  @override
  String get authorizedAppsEmptyTitle => 'Geen Gemagtigde Toepassings Nie';

  @override
  String get authorizedAppsEmptyDescription =>
      'Jy het nog geen toepassings gemagtig om toegang tot jou rekening te verkry nie.';

  @override
  String get authorizedAppsLoadError =>
      'Kon nie Gemagtigde Toepassings Laai Nie';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Gemagtig op $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Toestemmings verleen';

  @override
  String get authorizedAppsRevoke => 'Herroep';

  @override
  String get authorizedAppsRevokeTitle => 'Herroep toepassingstoegang';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Is jy seker jy wil toegang vir $appName herroep? Hierdie toepassing sal nie meer toegang tot jou rekening hê nie.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Toegang tot jou basiese profielinligting (gebruikersnaam, avatar, ens.)';

  @override
  String get authorizedAppsScopeEmail => 'Bekyk jou e-posadres';

  @override
  String get authorizedAppsScopeGuilds =>
      'Bekyk die gemeenskappe waarvan jy \'n lid is';

  @override
  String get authorizedAppsScopeConnections => 'Bekyk jou gekoppelde rekeninge';

  @override
  String get authorizedAppsScopeBot =>
      'Voeg \'n bot by \'n gemeenskap met gevraagde toestemmings';

  @override
  String get authorizedAppsScopeAdmin =>
      'Toegang tot administratiewe eindpunte';

  @override
  String get privacyPendingDeletionTitle => 'Hangende Vee';

  @override
  String get blockedUsersTitle => 'Geblokkeerde Gebruikers';

  @override
  String get blockedUsersDescription =>
      'Geblokkeerde gebruikers kan jou nie vriendskapsversoeke stuur of jou direk boodskap nie.';

  @override
  String get blockedUsersEmptyTitle => 'Geen Geblokkeerde Gebruikers Nie';

  @override
  String get blockedUsersEmptyDescription =>
      'Jy het nog niemand geblokkeer nie.';

  @override
  String get blockedUsersLoadError =>
      'Kon nie Geblokkeerde Gebruikers Laai Nie';

  @override
  String get blockedUsersUnblock => 'Deblokkeer';

  @override
  String get blockedUsersUnblockTitle => 'Deblokkeer Gebruiker';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Is jy seker jy wil $username deblokkeer?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopieer FluxerTag';

  @override
  String get blockedUsersCopyId => 'Kopieer Gebruikers-ID';

  @override
  String get userProfileLoadError => 'Kon nie profiel laai nie';

  @override
  String get userProfileRetry => 'Probeer weer';

  @override
  String get userProfileMessage => 'Boodskap';

  @override
  String get userProfileVoiceCall => 'Stemboodskap';

  @override
  String get userProfileVideoCall => 'Video-oproep';

  @override
  String get userProfileEditProfile => 'Wysig Profiel';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer Personeel';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Gemeenskapsspan';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Vennoot';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bugjagter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium-intekenaar sedert $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visioenêr';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visioenêr sedert $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visioenêr ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Goeie Vriende ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Goeie Gemeenskappe ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Goeie Vriende';

  @override
  String get userProfileMutualCommunitiesTitle => 'Goeie Gemeenskappe';

  @override
  String get userProfileNoMutualFriends => 'Geen goeie vriende gevind nie.';

  @override
  String get userProfileNoMutualCommunities =>
      'Geen goeie gemeenskappe gevind nie.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Bynaam: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Maak DM oop';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Jy het $username geblokkeer. Jy sal nie boodskappe kan stuur nie, tensy jy hulle ontblokkeer.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Ontblokkeer';

  @override
  String get userProfileOpenDm => 'Maak DM oop';

  @override
  String get userProfileNoteTitle => 'Nota';

  @override
  String get userProfileNoteVisibility => '(slegs vir jou sigbaar)';

  @override
  String get userProfileNoteSave => 'Stoor';

  @override
  String get userProfileNoteDelete => 'Vee uit';

  @override
  String get userProfileNoteEmpty => 'Klik om \'n nota by te voeg';

  @override
  String get userProfileMemberSince => 'Lid Sedert';

  @override
  String get userProfileAboutMe => 'Oor My';

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
  String get userProfileCopyUsername => 'Kopieer Gebruikersnaam';

  @override
  String get userProfileCopyUserId => 'Kopieer Gebruikers-ID';

  @override
  String get userProfileViewMainProfile => 'Bekyk Hoofprofiel';

  @override
  String get userProfileViewCommunityProfile => 'Bekyk Gemeenskapsprofiel';

  @override
  String get userProfileBlockUser => 'Blokkeer Gebruiker';

  @override
  String get userProfileUnblockUser => 'Ontblokkeer Gebruiker';

  @override
  String get userProfileRemoveFriend => 'Verwyder Vriend';

  @override
  String get userProfileBlockConfirmTitle => 'Blokkeer Gebruiker';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Is jy seker jy wil $username blokkeer?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Ontblokkeer Gebruiker';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Is jy seker jy wil $username ontblokkeer?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Verwyder Vriend';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Is jy seker jy wil $username as \'n vriend verwyder?';
  }

  @override
  String get userProfileFailedOpenDm => 'Kon nie DM oopmaak nie';

  @override
  String get userProfileFailedSaveNote => 'Kon nie nota stoor nie';

  @override
  String get userProfileActionFailed =>
      'Aksie het misluk, probeer asseblief weer';

  @override
  String get userProfileChangeNickname => 'Verander bynaam';

  @override
  String get userProfileKick => 'Skoop uit';

  @override
  String get userProfileBan => 'Bann';

  @override
  String get userProfileTimeout => 'Tydelike opskorting';

  @override
  String get userProfileRemoveTimeout => 'Verwyder tydelike opskorting';

  @override
  String get userProfileTransferOwnership => 'Dra eienaarskap oor';

  @override
  String get userProfileReportUser => 'Rapporteer gebruiker';

  @override
  String get userProfileReportMessage => 'Rapporteer boodskap';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Skoop $username uit?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Is jy seker jy wil $username uitskop? Hulle kan weer aansluit met \'n nuwe uitnodiging.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle =>
      'Verwyder tydelike opskorting?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Die verwydering van die tydelike opskorting sal $username toelaat om weer boodskappe te stuur, te reageer en stemkanale te betree.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Dra eienaarskap oor?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Dra eienaarskap van hierdie gemeenskap oor na $username? Dit is onomkeerbaar en jy sal alle eienaarvoorregte verloor.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Bann $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Bann-duur';

  @override
  String get userProfileBanCustomSecondsLabel => 'Pasgemaakte duur (sekondes)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Enige waarde van $min tot $max sekondes';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Vee boodskapgeskiedenis uit';

  @override
  String get userProfileBanDeleteNone => 'Vee niks uit nie';

  @override
  String get userProfileBanDelete24h => 'Vorige 24 uur';

  @override
  String get userProfileBanDelete7d => 'Vorige 7 dae';

  @override
  String get userProfileBanReasonLabel => 'Rede (opsioneel)';

  @override
  String get userProfileBanReasonHint => 'Voer \'n rede vir die bann in';

  @override
  String get userProfileBanSubmit => 'Ban lid';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Tydelike opskorting vir $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Tydelike opskorting duur';

  @override
  String get userProfileTimeoutSubmit => 'Skort lid tydelik op';

  @override
  String get userProfileNicknameLabel => 'Bynaam';

  @override
  String get userProfileNicknameHint => 'Voer \'n bynaam in';

  @override
  String get userProfileNicknameSave => 'Stoor';

  @override
  String userProfileKickSuccess(String username) {
    return '$username is uitgeskop';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username is geban';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username is tydelik opgeskort';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Tydelike opskorting vir $username verwyder';
  }

  @override
  String get userProfileNicknameSuccess => 'Bynaam opgedateer';

  @override
  String get userProfileTransferSuccess => 'Eienaarskap oorgedra';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 sekondes';

  @override
  String get duration5Minutes => '5 minute';

  @override
  String get duration10Minutes => '10 minute';

  @override
  String get duration1Hour => '1 uur';

  @override
  String get duration12Hours => '12 ure';

  @override
  String get duration1Day => '1 dag';

  @override
  String get duration3Days => '3 dae';

  @override
  String get duration5Days => '5 dae';

  @override
  String get duration1Week => '1 week';

  @override
  String get duration2Weeks => '2 weke';

  @override
  String get duration1Month => '1 maand';

  @override
  String get durationCustom => 'Pasgemaak...';

  @override
  String get iarReportUserTitle => 'Rapporteer gebruiker';

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
  String get iarReasonInappropriateProfile => 'Ongepaste profiel';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Hierdie gebruiker se profiel bevat ongepaste inhoud';

  @override
  String typingIndicatorOne(String name) {
    return '$name is besig om te tik...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 en $name2 is besig om te tik...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 en $name3 is besig om te tik...';
  }

  @override
  String get typingIndicatorMultiple => 'Verskeie mense is besig om te tik...';

  @override
  String get typingIndicatorHandful =>
      '\'n Handvol sleutelbordkrygers maak gereed...';

  @override
  String get typingIndicatorSymphony =>
      '\'n Simfonie van sleutelbordgetik is aan die gang...';

  @override
  String get typingIndicatorFiesta => 'Dit is \'n volskaalse tik-fiësta hier';

  @override
  String get typingIndicatorApocalypse => 'Sjoe, dit is \'n tik-apokalips';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Bly om jou hier te hê, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Welkom, $username! Maak jouself tuis.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hallo, $username! Bly om jou hier te hê.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hallo, $username! Spring in wanneer jy gereed is.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Haai $username, bly om jou hier te sien!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Haai daar, $username! Hoop jy geniet jou verblyf.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Haai, $username, welkom aan boord!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Bly om jou hier te hê, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Welkom in, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Welkom, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Welkom, $username! Ons is bly jy is hier.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Welkom, $username! Hoop jy geniet jou tyd hier.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Welkom, $username! Jou volgende gesprek begin hier.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Welkom, $username. Ons is bly om jou hier te hê.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Bly om jou te sien, $username! Welkom in.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Jy is hier, $username! Goed om jou by ons te hê.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Jy het aangekom, $username! Kom ons begin.';
  }

  @override
  String get relativeTimeShortNow => 'nou';

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
      other: '${count}j',
      one: '1j',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'My toestelle';

  @override
  String get linkedDevicesDescription =>
      'Sien alle toestelle wat tans by jou rekening aangemeld is. Herroep enige sessies wat jy nie herken nie.';

  @override
  String get linkedDevicesCurrentDevice => 'Huidige toestel';

  @override
  String get linkedDevicesOtherDevices => 'Ander toestelle';

  @override
  String get linkedDevicesEnterSelection => 'Gaan keuringsmodus binne';

  @override
  String get linkedDevicesExitSelection => 'Verlaat keuringsmodus';

  @override
  String get linkedDevicesSelectAll => 'Kies alles';

  @override
  String get linkedDevicesClearSelection => 'Maak keuring skoon';

  @override
  String get linkedDevicesRevokeTooltip => 'Herroep toestel';

  @override
  String get linkedDevicesSignOutAll => 'Teken uit by alle ander toestelle';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Teken $count toestelle uit',
      one: 'Teken 1 toestel uit',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Teken $count toestelle uit',
      one: 'Teken 1 toestel uit',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Teken uit by alle ander toestelle';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Dit sal die geselekteerde toestelle uit jou rekening teken. Jy sal weer op daardie toestelle moet aanmeld.',
      one:
          'Dit sal die geselekteerde toestel uit jou rekening teken. Jy sal weer op daardie toestel moet aanmeld.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Dit sal die geselekteerde toestelle uit jou rekening teken. Jy sal weer op daardie toestelle moet aanmeld.';

  @override
  String get linkedDevicesSignOutConfirm => 'Gaan voort';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Jy sal weer moet aanmeld op alle toestelle wat uitgeteken is';

  @override
  String get linkedDevicesLoadErrorTitle => 'Netwerkfout';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Ons ondervind probleme om met die ruimte-tyd kontinuum te skakel. Gaan asseblief jou verbinding na en probeer weer.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Toestelle herroep',
      one: 'Toestel herroep',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Kon nie uitmeld nie. Probeer weer.';

  @override
  String get linkedDevicesUnknownOs => 'Onbekende OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Onbekende platform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration stadige modus';
  }

  @override
  String get slowmodeTooltipActive =>
      'Jy is in stadige modus. Wag asseblief voordat jy nog \'n boodskap stuur.';

  @override
  String get slowmodeTooltipImmune =>
      'Stadige modus is geaktiveer, maar jy is immuun.';

  @override
  String get channelNoSendPermissionHint =>
      'Jy kan nie boodskappe in hierdie kanaal stuur nie.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Stelselaankondigings van $productName personeel. Jy kan nie hier antwoord nie.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Boodskappe is tydelik onderbreek in hierdie gemeenskap.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Jy is tyd uit. Boodskappe, reaksies en stem is onderbreek totdat die tyd uit verstryk.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Jy moet jou rekening eis om boodskappe in hierdie gemeenskap te stuur.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Jy moet jou e-pos verifieer om boodskappe in hierdie gemeenskap te stuur.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Jou rekening is te nuut om boodskappe in hierdie gemeenskap te stuur.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Jy is nog nie lank genoeg \'n lid van hierdie gemeenskap om boodskappe te stuur nie.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Jy moet \'n telefoonnommer verifieer om boodskappe in hierdie gemeenskap te stuur.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verifieer e-pos';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verifieer telefoon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Te veel aanhangsels (maks $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Een of meer lêers oorskry die grootte limiet';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Daardie lêers is te groot om saam te stuur';

  @override
  String get chatAttachmentDropToUpload => 'Los lêers om op te laai';

  @override
  String get chatAttachmentDropToSend => 'Los lêers om nou te stuur';

  @override
  String get chatAttachmentSendVoiceMessage => 'Stuur stemmemo';

  @override
  String get voiceMessageTitle => 'Stemmemo';

  @override
  String get voiceMessageHoldHint =>
      'Hou om op te neem. Sleep op om te sluit, of laat los om te stuur.';

  @override
  String get voiceMessageDiscard => 'Gooi stemmemo weg';

  @override
  String get voiceMessageSend => 'Stuur stemmemo';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Kon nie opname begin nie. Toestaan mikrofoon toegang.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Stemopname word nie op hierdie toestel ondersteun nie.';

  @override
  String get voiceMessageMicInUse =>
      'Verlaat die stemoproep om \'n stemmemo op te neem.';

  @override
  String get voiceMessageRecordingFailed => 'Opname het misluk. Probeer weer.';

  @override
  String get voiceMessageSendFailed =>
      'Kon nie stemmemo stuur nie. Probeer weer.';

  @override
  String get voiceMessageRecordingHint =>
      'Praat nou. Druk Stop wanneer jy klaar is — jy kan daarna sny.';

  @override
  String get voiceMessageReviewHint =>
      'Sleep die handvatsels om te sny, druk dan Stuur.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Begin opname';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Speel';

  @override
  String get voiceMessagePause => 'Pouse';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Keuse moet minstens ${secondsString}s wees.';
  }

  @override
  String get chatAttachmentEditTitle => 'Wysig aanhangsel';

  @override
  String get chatAttachmentFilenameLabel => 'Lêernaam';

  @override
  String get chatAttachmentDescriptionLabel => 'Beskrywing';

  @override
  String get chatAttachmentDescriptionHint => 'Opsionele alternatiewe teks';

  @override
  String get chatAttachmentSpoilerLabel => 'Merk as spoiler';

  @override
  String get chatAttachmentRemove => 'Verwyder aanhangsel';

  @override
  String get chatAttachmentDownload => 'Laai af';

  @override
  String get chatAttachmentExpiredTooltip => 'Aanhangsel het verval';

  @override
  String get chatAttachmentSourceGallery => 'Galery';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Blaai deur lêers';

  @override
  String get chatAttachmentPasteTooltip => 'Plak prent vanaf knipbord';

  @override
  String get chatAttachmentSpoiler => 'Vervalser';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Wys vervalser';

  @override
  String get matureMediaRevealButton => 'Wys';

  @override
  String get matureMediaRevealHint => 'Klik om te wys';

  @override
  String get matureContentTitle => 'Volwasse inhoud';

  @override
  String get matureCommunityTitle => 'Volwasse gemeenskap';

  @override
  String get matureCategoryTitle => 'Volwasse kategorie';

  @override
  String get matureChannelTitle => 'Volwasse kanaal';

  @override
  String get communityContentWarningTitle => 'Gemeenskapsinhoudwaarskuwing';

  @override
  String get categoryContentWarningTitle => 'Kategorie-inhoudwaarskuwing';

  @override
  String get channelContentWarningTitle => 'Kanaal-inhoudwaarskuwing';

  @override
  String get defaultContentWarningBody => 'Dit bevat sensitiewe inhoud.';

  @override
  String get matureCommunityBody =>
      'Hierdie gemeenskap is gemerk vir volwasse inhoud en mag materiaal bevat wat vir sommige gebruikers onvanpas mag wees.';

  @override
  String get matureCategoryBody =>
      'Hierdie kategorie is gemerk vir volwasse inhoud en mag materiaal bevat wat vir sommige gebruikers onvanpas mag wees.';

  @override
  String get matureChannelBody =>
      'Hierdie kanaal is gemerk vir volwasse inhoud en mag materiaal bevat wat vir sommige gebruikers onvanpas mag wees.';

  @override
  String get matureVoiceChannelBody =>
      'Hierdie stemkanaal is gemerk vir volwasse inhoud en mag materiaal bevat wat vir sommige gebruikers onvanpas mag wees.';

  @override
  String get matureLinkChannelBody =>
      'Hierdie skakel-kanaal is gemerk vir volwasse inhoud en mag materiaal oopmaak wat vir sommige gebruikers onvanpas mag wees.';

  @override
  String get matureCommunityUnavailableBody =>
      'Hierdie volwasse gemeenskap is nie vir jou rekening beskikbaar nie.';

  @override
  String get matureCategoryUnavailableBody =>
      'Hierdie volwasse kategorie is nie vir jou rekening beskikbaar nie.';

  @override
  String get matureChannelUnavailableBody =>
      'Hierdie volwasse kanaal is nie vir jou rekening beskikbaar nie.';

  @override
  String get matureContentProceedButton => 'Gaan voort';

  @override
  String get matureContentUnderstandButton => 'Ek verstaan';

  @override
  String get matureContentOpenLinkButton => 'Maak skakel oop';

  @override
  String get sensitiveContentSectionTitle => 'Sensitiewe inhoud';

  @override
  String get sensitiveContentSectionDescription =>
      'Beheer hoe volwasse of sensitiewe media in verskillende kontekste gefiltreer word';

  @override
  String get sensitiveContentFriendDmLabel => 'Direkte boodskappe van vriende';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Direkte boodskappe van ander';

  @override
  String get sensitiveContentGuildLabel => 'Boodskappe in gemeenskaps-kanale';

  @override
  String get sensitiveContentFilterShow => 'Wys';

  @override
  String get sensitiveContentFilterBlur => 'Vervaging';

  @override
  String get sensitiveContentFilterBlock => 'Blokkeer';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Vervaging media totdat veiligheidsskandering voltooi is';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Wanneer geaktiveer, word beelde en video\'s vervaag totdat die inhoudveiligheidsskandering voltooi is.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Hierdie instelling is altyd aan vir jou rekening.';

  @override
  String get sensitiveContentResetButton => 'Herstel';

  @override
  String get sensitiveContentSaveButton => 'Stoor';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lêers',
      one: '1 lêer',
    );
    return 'Besig om $_temp0 op te laai';
  }

  @override
  String get chatCancelUpload => 'Kanselleer oplaai';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Verval op $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Verval tussen $start en $end';
  }

  @override
  String get connectionsTitle => 'Verbindings';

  @override
  String get connectionsDescription =>
      'Koppel eksterne rekeninge en domeine aan jou Fluxer-profiel. Geverifieerde verbindings sal op jou profiel vertoon word sodat ander dit kan sien.';

  @override
  String get connectionsEmptyTitle => 'Nog geen verbindings nie';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Koppel jou Bluesky-rekening of verifieer domeinbesit om dit op jou profiel te vertoon.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifieer domeinbesit om dit op jou profiel te vertoon.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domein';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Voeg Bluesky-verbinding by';

  @override
  String get connectionsAddDomainAriaLabel => 'Voeg domeinverbinding by';

  @override
  String get connectionEdit => 'Wysig';

  @override
  String get connectionRemove => 'Verwyder';

  @override
  String get connectionVerifiedLabel => 'Hierdie verbinding is geverifieer.';

  @override
  String get connectionUnverifiedLabel =>
      'Hierdie verbinding is nie geverifieer nie.';

  @override
  String get connectionAddTitle => 'Voeg Verbinding by';

  @override
  String get connectionTypeLabel => 'Verbindingstipe';

  @override
  String get connectionHandleLabel => 'Hanteerder';

  @override
  String get connectionDomainLabel => 'Domein';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Jy het reeds hierdie verbinding.';

  @override
  String get connectionConnectBluesky => 'Verbind met Bluesky';

  @override
  String get connectionContinue => 'Gaan voort';

  @override
  String get connectionVerifyTitle => 'Verifieer Verbinding';

  @override
  String get connectionVerifyInstructions =>
      'Gebruik die rekord hieronder om domeineienaarskap te bewys.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT-rekord';

  @override
  String get connectionDnsHostLabel => 'Gasheer';

  @override
  String get connectionDnsValueLabel => 'Waarde';

  @override
  String get connectionCopyHost => 'Kopieer gasheer';

  @override
  String get connectionCopyValue => 'Kopieer waarde';

  @override
  String get connectionCopied => 'Gekopieer!';

  @override
  String get connectionTokenFileTitle => 'Bediener die token-lêer';

  @override
  String get connectionTokenFileDescription =>
      'Laai **fluxer-verification** af en plaas dit in jou **.well-known** gids sodat ons die domein kan valideer.';

  @override
  String get connectionTokenFileDownload => 'Laai fluxer-verification af';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Die lêer bevat die verifikasietoken wat ons vanaf **$dnsUrl** sal haal.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Stoor fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verifieer';

  @override
  String get connectionBack => 'Terug';

  @override
  String get connectionEditTitle => 'Wysig Verbinding';

  @override
  String get connectionEditDescription =>
      'Kies wie hierdie verbinding op jou profiel kan sien.';

  @override
  String get connectionVisibilityEveryone => 'Almal';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Laat enigiemand toe om hierdie verbinding op jou profiel te sien';

  @override
  String get connectionVisibilityFriends => 'Vriende';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Laat jou vriende toe om hierdie verbinding te sien';

  @override
  String get connectionVisibilityCommunityMembers => 'Gemeenskapslede';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Laat lede van gemeenskappe waaraan jy behoort toe om hierdie verbinding te sien';

  @override
  String get connectionRemoveTitle => 'Verwyder Verbinding';

  @override
  String get connectionRemoveDescription =>
      'Is jy seker jy wil hierdie verbinding verwyder? Hierdie aksie kan nie ongedaan gemaak word nie.';

  @override
  String get connectionRemoveConfirm => 'Verwyder';

  @override
  String get connectionsLoadError => 'Kon nie verbindings laai nie';

  @override
  String get connectionsReorderError => 'Kon nie volgorde opdateer nie';

  @override
  String get connectionInitiateFailed =>
      'Kon nie verifikasie begin nie. Probeer weer.';

  @override
  String get connectionVerifyFailed =>
      'Kon nie verifieer nie. Kontroleer jou DNS-rekord en probeer weer.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Kon nie Bluesky-magtiging begin nie.';

  @override
  String get connectionUpdateFailed => 'Kon nie verbinding opdateer nie';

  @override
  String get connectionRemoveFailed => 'Kon nie verbinding verwyder nie';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification gestoor';

  @override
  String get connectionTokenSaveFailedToast => 'Kon nie lêer stoor nie';

  @override
  String get connectionEnterHandle => 'Voer \'n Bluesky-hanteerder in.';

  @override
  String get connectionEnterDomain => 'Voer \'n domein in.';

  @override
  String get lookAndFeelTitle => 'Voorkoms en Styl';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Kies tussen donker, steenkool of ligte voorkoms.';

  @override
  String get lookAndFeelThemeDark => 'Donker Tema';

  @override
  String get lookAndFeelThemeCoal => 'Steenkool Tema';

  @override
  String get lookAndFeelThemeLight => 'Ligte Tema';

  @override
  String get lookAndFeelThemeSystem => 'Stelsel Tema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sinkroniseer tema oor toestelle';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Wanneer geaktiveer, sal tema-veranderinge na al jou toestelle sinkroniseer. Wanneer gedeaktiveer, sal hierdie toestel sy eie tema-instelling gebruik.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Stelsel tema deaktiveer outomaties sinkronisering om jou stelsel se voorkeur op hierdie toestel op te volg.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Kon nie tema na jou rekening sinkroniseer nie. Probeer asseblief weer.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Kletslettertipe Skaal';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Pas die lettertipegrootte in die kletsarea aan.';

  @override
  String get lookAndFeelInterfaceTitle => 'Koepel';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Pas koppelvlak-elemente en gedrag aan.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Kanaallys tik-aanwysers';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Kies hoe tik-aanwysers in die kanaallys verskyn wanneer iemand in \'n kanaal tik.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Tik-aanwyser + Avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Wys tik-aanwyser met gebruikersavatars in die kanaallys';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'Slegs Tik-aanwyser';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Wys slegs die tik-aanwyser sonder avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Versteek';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Moenie tik-aanwysers in die kanaallys wys nie';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Wys tik op geselekteerde kanaal';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Wanneer gedeaktiveer (verstek), sal tik-aanwysers nie verskyn op die kanaal wat jy tans bekyk nie.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'algemeen';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Sleutelbord Wenke';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Beheer of sleutelbordkortpad wenke binne gereedskapwenke verskyn.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Versteek sleutelbordwenke in gereedskapwenke';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Wanneer geaktiveer, word kortpad kentekens versteek in gereedskapwenk pop-ups.';

  @override
  String get lookAndFeelNekoTitle => 'Diverse';

  @override
  String get lookAndFeelNekoDescription => 'Diverse koppelvlak-opsies.';

  @override
  String get lookAndFeelShowNekoLabel => 'Wys Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Wanneer geaktiveer, verskyn Neko naby die kletsinvoerveld.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Stemkanaal aansluitingsgedrag';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Beheer hoe jy stemkanale in gemeenskappe aansluit.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Vereis dubbelklik om stemkanale aan te sluit';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Wanneer geaktiveer, sal jy twee keer op stemkanale moet klik om aan te sluit. Wanneer gedeaktiveer (verstek), sal \'n enkele klik die kanaal onmiddellik aansluit.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Die vinnige bruin jakkals spring oor die lui hond.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Groepsy-balk';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigureer hoe die groepsy-balk direkte boodskappe vertoon.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count gemeenskappe is tydelik onbeskikbaar weens \'n flukskapasitor wanfunksie.',
      one:
          '1 gemeenskap is tydelik onbeskikbaar weens \'n flukskapasitor wanfunksie.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Vou DM\'s in \'n Gids saam';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Wanneer geaktiveer, word ongeleesde DM\'s in die groepsy-balk in \'n gids op die Fluxer-knoppie saamgevou. Klik die Fluxer-knoppie terwyl jy op die DM\'s-bladsy is om die gids oop te vou of toe te vou.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanaallys';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Beheer ongeleesde aanwysergedrag vir gedempte kanale in kanaallyste.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Wys ongeleesde aanwyser op gedempte kanale';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Wanneer geaktiveer, wys gedempte kanale \'n vervaagde ongeleesde aanwyser aan die linkerkant. Vermeldings verskyn steeds ongeag hierdie instelling.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Nou Aktief';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Beheer hoe Nou Aktief regdeur die toepassing verskyn.';

  @override
  String get lookAndFeelShowActiveNowLabel => 'Wys Nou Aktief op die tuisskerm';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Wys \'Aktief nou\' op die tuisskerm om vriende wat aktief is in stemkanale te wys. Jy sal \'n voorskou sien, die kanaalkonteks, wie reeds daar is, en \'n vinnige manier om aan te sluit.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Gunstelinge';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Beheer die sigbaarheid van gunstelinge regdeur die toepassing.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Aktiveer gunstelinge';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Wanneer geaktiveer, kan jy kanale as gunsteling merk en hulle sal in die Gunstelinge-afdeling verskyn. Wanneer gedeaktiveer, sal alle gunsteling-verwante UI-elemente (knoppies, kieslys-items) versteek word. Jou bestaande gunstelinge sal behoue bly.';

  @override
  String get favoritesTitle => 'Gunstelinge';

  @override
  String get favoritesEmptyTitle => 'Nog geen gunstelinge nie';

  @override
  String get favoritesEmptyDescription =>
      'Merk kanale vanaf die kletskop om hulle hier te hou.';

  @override
  String get favoritesWelcomeTitle => 'Welkom by gunstelinge';

  @override
  String get favoritesWelcomeDescription =>
      'Jou persoonlike spasie vir vinnige toegang tot kanale, DM\'s en groepe waarvan jy hou. Druk die ster op enige kanaal om dit hier by te voeg.';

  @override
  String get favoritesWelcomeTip => 'Nie vir jou nie? Skakel dit enige tyd af.';

  @override
  String get favoritesDisableButton => 'Deaktiveer gunstelinge';

  @override
  String get favoritesAddedToast => 'By gunstelinge gevoeg';

  @override
  String get favoritesRemovedToast => 'Verwyder uit gunstelinge';

  @override
  String get favoritesHiddenToast => 'Gunstelinge versteek';

  @override
  String get favoritesMute => 'Dem gunstelinge';

  @override
  String get favoritesUnmute => 'Gedem gunstelinge';

  @override
  String get favoritesHeaderMenu => 'Gunstelinge-kieslys';

  @override
  String get favoritesCreateCategory => 'Skep kategorie';

  @override
  String get favoritesCategoryNameLabel => 'Kategorie naam';

  @override
  String get favoritesHideMutedChannels => 'Versteek gedempte kanale';

  @override
  String get favoritesShowMutedChannels => 'Wys gedempte kanale';

  @override
  String get favoritesSetNickname => 'Stel bynaam';

  @override
  String get favoritesNicknameLabel => 'Bynaam';

  @override
  String get favoritesSaveNickname => 'Stoor bynaam';

  @override
  String get favoritesMoveToCategory => 'Skuif na kategorie';

  @override
  String get favoritesUncategorized => 'Ongeklassifiseerd';

  @override
  String get favoritesOtherCategory => 'Ander';

  @override
  String get favoritesRemoveFromFavorites => 'Verwyder uit gunstelinge';

  @override
  String get favoritesAddToFavorites => 'Voeg by gunstelinge';

  @override
  String get favoritesHideConfirmTitle => 'Versteek gunstelinge';

  @override
  String get favoritesHideConfirmDescription =>
      'Dit sal alle gunsteling-verwante UI-elemente versteek, insluitend knoppies en kieslys-items. Jou bestaande gunstelinge sal behoue bly en kan enige tyd weer geaktiveer word vanaf Instellings > Gevorderd > Voorkoms.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direkte boodskap';

  @override
  String get messagesMediaDisplayGroupTitle => 'Vertoon';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Beheer hoe boodskappe, media en ander inhoud vertoon word.';

  @override
  String get messagesMediaMediaGroupTitle => 'Media';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Pas media-grootte voorkeure en knoppies aan.';

  @override
  String get messagesMediaInputGroupTitle => 'Invoer';

  @override
  String get messagesMediaInputGroupDescription =>
      'Pas boodskap-invoer instellings aan.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Kieslys';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Stel hoe die gemeenskaps-kieslys vertoon word.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Versteek gedempte kanale by verstek';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Versteek outomaties gedempte kanale in die kieslys wanneer jy nuwe gemeenskappe aansluit';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Versteek gedempte kanale by verstek?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Nuwe gemeenskappe wat jy aansluit sal outomaties gedempte kanale versteek. Wil jy ook hierdie instelling op al jou bestaande gemeenskappe toepas?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Hou op om gedempte kanale by verstek te versteek?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Nuwe gemeenskappe wat jy aansluit sal nie meer gedempte kanale outomaties versteek nie. Wil jy ook gedempte kanale in al jou bestaande gemeenskappe wys?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Pas toe op alle gemeenskappe';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Wys in alle gemeenskappe';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Slegs nuwe gemeenskappe';

  @override
  String get messagesMediaDisplaySectionTitle => 'Media Vertooning';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Beheer hoe beelde, video\'s en ander media vertoon word. Alle media word geskaal en omgeskakel. Uiters groot lêers wat nie in \'n voorskou saamgepers kan word nie, sal ongeag hierdie instellings nie ingebed word nie.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Wanneer as skakels na klets geplaas';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Wanneer direk na Fluxer opgelaai';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Skakel Voorskoue';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Beheer hoe webwerfskakels in klets voorskou word';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Wys ingebedde en voorskou webwerfskakels';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaksies';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Stel emoji-reaksies op boodskappe in';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Wys emoji-reaksies op boodskappe';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Verborge Inhoud';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Beheer hoe verborge inhoud vertoon word';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Wys verborge inhoud';

  @override
  String get messagesMediaSpoilersOnClickName => 'By klik';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Wys verborge inhoud wanneer geklik word';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'In kanale wat ek modereer';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Wys altyd verborge inhoud in kanale waar jy die \"Bestuur Boodskappe\"-toestemming het';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Altyd';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Wys verborge inhoud altyd';

  @override
  String get messagesMediaSizeSectionTitle => 'Media Grootte Voorkeure';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Pas die maksimum vertoon grootte vir ingebedde en aangehegte media aan. Kleiner groottes gebruik minder skermspasie, terwyl groter groottes meer detail wys.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Media vanaf skakels (ingebed)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Opgelaaide aanhangsels';

  @override
  String get messagesMediaSizeCompactName => 'Kompak (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Kleiner media grootte';

  @override
  String get messagesMediaSizeComfortableName => 'Gerieflik (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Groter media grootte met meer detail';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF Gedrag';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Beheer hoe GIF\'s in klets ingevoeg word';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Stuur GIF\'s outomaties wanneer gekies';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Uitdrukking outo-aanvul (dubbelpunt outo-aanvul)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Beheer wat in die uitdrukking outo-aanvul verskyn wanneer jy \'n dubbelpunt tik. Pas aan watter voorstelle verskyn om by jou voorkeure te pas.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Wys verstek emoji\'s in uitdrukking outo-aanvul';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Wys pasgemaakte emoji\'s in uitdrukking outo-aanvul';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Wys plakkers in uitdrukking outo-aanvul';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Wys gestoorde media in uitdrukking outo-aanvul';

  @override
  String get messagesMediaEditingSectionTitle => 'Boodskap Redigering';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Beheer wat gebeur met jou konsep wanneer jy kanselleer.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Behou konsep by kansellasie';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Ongelees aanwysers';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Beheer hoe ongelees boodskap aanwysers vertoon word.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Wys vervaagde ongelees aanwyser op gedempte kanale';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Vertoont \'n dowwe ongelees aanwyser langs gedempte direkte boodskappe en kanale sodat jy steeds met \'n oogopslag kan sien wanneer daar aktiwiteit is.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM boodskap voorskoue';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Beheer wanneer boodskap voorskoue in die DM lys vertoon word.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM boodskap voorskou modus';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Alle boodskappe';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Wys boodskap voorskoue vir alle DM gesprekke';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Slegs ongelees DM\'s';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Wys slegs boodskap voorskoue vir DM\'s met ongelees boodskappe';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Geen';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Moenie boodskapvoorskoue in die DM-lys wys nie';

  @override
  String get dmListSentAnAttachment => 'Het \'n aanhangsel gestuur';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username het \'n boodskap in hierdie kanaal vasgespeld.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username het $userName by die groep gevoeg.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username het iemand by die groep gevoeg.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username het die groep verlaat.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username het $userName uit die groep verwyder.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username het iemand uit die groep verwyder.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username het die kanaalnaam na $newName verander.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username het die kanaalnaam verander.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username het die kanaal-ikoon verander.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username het \'n oproep begin.';
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
  String get voiceConnectionConfirmTitle => 'Stemverbinding Bevestiging';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Jy is reeds vanaf $count ander toestelle aan hierdie stemkanaal gekoppel. Wat wil jy doen?',
      one:
          'Jy is reeds vanaf 1 ander toestel aan hierdie stemkanaal gekoppel. Wat wil jy doen?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Wissel na Hierdie Toestel';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Net Saamvoeg (Behou Ander Verbindings)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Moenie iets doen nie, ek wil nie aansluit nie';

  @override
  String get voiceChannelEmptyDescription =>
      'Dit is \'n stemkanaal. Koppel om te begin praat!';

  @override
  String get voiceChannelJoin => 'Sluit aan by Stemkanaal';

  @override
  String get voiceChannelJoinConnect => 'Koppel aan Stem';

  @override
  String get voiceChannelNoConnectPermission =>
      'Jy het nie toestemming om by hierdie stemkanaal aan te sluit nie';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofoon-, kamera- en skermdeelinhoud is end-tot-end geïnkripteer.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofoon-, kamera- en skermdeelinhoud is end-tot-end geïnkripteer.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-tot-end-enkripsie is nie beskikbaar nie omdat \'n onondersteunde deelnemer in hierdie stemkanaal is.';

  @override
  String get voiceCallE2eeBroken =>
      'End-tot-end-enkripsie is nie beskikbaar nie omdat \'n onondersteunde deelnemer in hierdie oproep is.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Hierdie kliënt moet opgedateer word voordat hierdie geïnkripteerde oproep aangesluit word.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Kon nie jou mikrofoon begin nie. Jy is steeds in die oproep.';

  @override
  String get voiceChannelStatusConnecting => 'Besig om te koppel...';

  @override
  String get voiceChannelStatusConnected => 'Gekoppel';

  @override
  String get voiceChannelStatusError => 'Fout';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobiele toestel';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Desktop toestel';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Gemeenskapsgedemp';

  @override
  String get voiceParticipantTooltipMuted => 'Gedemp';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Gemeenskapsdofgemaak';

  @override
  String get voiceParticipantTooltipDeafened => 'Dofgemaak';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Verbinding: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deelnemers',
      one: '1 deelnemer',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Verlaat';

  @override
  String get voiceControlMute => 'Gedemp';

  @override
  String get voiceControlUnmute => 'Gedemp ophef';

  @override
  String get voiceControlDeafen => 'Dofmaak';

  @override
  String get voiceControlUndeafen => 'Dofmaak ophef';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Skermdeel';

  @override
  String get voiceScreenShareNotificationText => 'Deel jou skerm.';

  @override
  String get voiceControlMore => 'Meer';

  @override
  String get voiceControlDisconnect => 'Ontkoppel';

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
  String get voiceControlChat => 'Klets';

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
  String get voiceTextChatShow => 'Wys klets';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ongeleesde boodskappe',
      one: '# ongeleesde boodskap',
    );
    return 'Wys klets met $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Kamera-toestemming word benodig vir video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Kon nie skermdeling begin nie. Probeer asseblief weer.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Skermdeel-toestemming is geweier.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Skermdeling is nie beskikbaar op hierdie toestel nie.';

  @override
  String get voiceWatchStream => 'Kyk Stroom';

  @override
  String get voiceStopWatching => 'Hou op Kyk';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Hou op om die huidige stroom te kyk';

  @override
  String get voiceOwnScreenShareTitle => 'Jy is besig om uit te saai';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Jou stroom is regstreeks vir deelnemers.';

  @override
  String get voiceLiveBadge => 'REGSTREEKS';

  @override
  String get dmVoiceViewCall => 'Bekyk oproep';

  @override
  String get dmVoiceCallFullScreen => 'Volskerm';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Maak oproep volskerm oop';

  @override
  String get dmVoiceStripStatusConnecting => 'Verbind...';

  @override
  String get dmVoiceStripStatusInCall => 'In oproep';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Stemoproep';

  @override
  String get dmVoiceCallBarConnecting => 'Verbind...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direkte oproep';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Groepoproep';

  @override
  String get dmVoiceCallBarIssueFallback => 'Stemprobleem';

  @override
  String get dmVoiceFullscreenTitle => 'Stem';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Stem verbind';

  @override
  String get notificationsPageTitle => 'Kennisgewings';

  @override
  String get notificationsFilterUnreads => 'Ongeleesdes';

  @override
  String get notificationsFilterMentions => 'Vermelding';

  @override
  String get notificationsBookmarksTooltip => 'Boekmerke';

  @override
  String get notificationsMentionFilterTooltip => 'Filtreer vermelding';

  @override
  String get notificationsMentionFiltersTitle => 'Vermelding filters';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Sluit @almal en @hier vermelding in';

  @override
  String get notificationsMentionIncludeRoles => 'Sluit rolvermelding in';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Sluit alle gemeenskapsvermelding in';

  @override
  String get notificationsNoUnreadTitle => 'Geen Ongeleesde Boodskappe';

  @override
  String get notificationsNoUnreadBody => 'Jy is op datum.';

  @override
  String get notificationsNoMentionsTitle => 'Geen Onlangse Vermelding';

  @override
  String get notificationsNoMentionsBody =>
      'Alle @vermelding van jou sal hier vir 7 dae verskyn.';

  @override
  String get notificationsMentionsEndTitle => 'Jy het die einde bereik';

  @override
  String get notificationsMentionsEndBody =>
      'Jy het al jou onlangse vermelding gesien. Moenie bekommer nie, meer sal binnekort hier verskyn.';

  @override
  String get notificationsJump => 'Spring';

  @override
  String get notificationsRemoveMentionTooltip => 'Verwyder vermelding';

  @override
  String get notificationsViewAllUnread => 'Bekyk alle ongeleesdes';

  @override
  String get notificationsMarkAsRead => 'Merk as gelees';

  @override
  String get notificationsExpand => 'Brei uit';

  @override
  String get notificationsCollapse => 'Vou saam';

  @override
  String get notificationsMessageUnavailable =>
      'Hierdie boodskap kon nie gelaai word nie.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining karakters oor';
  }

  @override
  String get characterCounterTooLong => 'Boodskap is te lank';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining karakters oor. Kry $productName om tot $premiumMaxLength karakters te skryf.';
  }

  @override
  String get chatMessageFailedToSend => 'Kon nie boodskap stuur nie';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Jou boodskap kon nie afgelewer word nie. Dit is gewoonlik omdat jy nie \'n gemeenskap met die ontvanger deel nie of die ontvanger slegs direkte boodskappe van vriende aanvaar nie. Jy moet dalk ook jou eie direkte boodskap-privaatheidinstellings in $settingsPath aanpas.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Jou boodskap kon nie afgelewer word nie. Jy moet jou rekening eis om direkte boodskappe te stuur.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Jou boodskap kon nie afgelewer word nie. Jy moet jou rekening eis om boodskappe te stuur.';

  @override
  String get chatSendFailureContentBlocked =>
      'Jou boodskap kon nie afgelewer word nie omdat dit deur ons veiligheidstelsels gemerk is. As jy glo dit is \'n fout, kontak asseblief ondersteuning.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Jou boodskap kon nie afgelewer word nie omdat dit volwasse emoji of plakkers bevat wat nie in hierdie konteks toegelaat word nie.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Slegs jy kan hierdie boodskap sien.';

  @override
  String get chatClientSystemDismiss => 'Verwerp';

  @override
  String get privacyDashboardCommunicationSection => 'Kommunikasie';

  @override
  String get chatMessageDeleteFailed => 'Mislukte Boodskap Uitvee';

  @override
  String get chatMessageAddReaction => 'Voeg Reaksie By';

  @override
  String get chatMessageEdit => 'Wysig Boodskap';

  @override
  String get chatMessageReply => 'Antwoord';

  @override
  String get chatMessageForward => 'Stuur Deur';

  @override
  String get forwardMessageTitle => 'Stuur boodskap deur';

  @override
  String get forwardSearchHint => 'Soek kanale of DM\'s';

  @override
  String get forwardDirectMessagesSection => 'Direkte Boodskappe';

  @override
  String get forwardCommentHint => 'Voeg \'n opmerking by (opsioneel)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Stuur ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Geen kanale gevind nie';

  @override
  String get forwardSuccessToast => 'Boodskap doorgestuur';

  @override
  String get forwardFailed => 'Kon nie boodskap deurstuur nie';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Opmerkings is nie beskikbaar nie omdat \'n geselekteerde kanaal stadige modus aangeskakel het.';

  @override
  String get forwardDestinationNoSendPermission =>
      'Jy kan nie boodskappe hier stuur nie';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Jy kan nie skakels hier insluit nie';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Jy kan nie lêers hier aanheg nie';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Boodskappe stuur is gedeaktiveer in hierdie gemeenskap';

  @override
  String get forwardDestinationTimedOut =>
      'Jy is op \'n tydsbeperking in hierdie gemeenskap';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Stilmodus - wag $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopieer Boodskap';

  @override
  String get chatMessagePin => 'Speld boodskap vas';

  @override
  String get chatMessageUnpin => 'Verwyder speld van boodskap';

  @override
  String get chatMessageUnpinIt => 'Verwyder speld';

  @override
  String get chatMessageBookmark => 'Boekmerk Boodskap';

  @override
  String get chatMessageRemoveBookmark => 'Verwyder Boekmerk';

  @override
  String get chatMessageMarkAsUnread => 'Merk as Ongelees';

  @override
  String get chatMessageCopyMessageLink => 'Kopieer Boodskapskakel';

  @override
  String get chatMessageCopyMessageId => 'Kopieer Boodskap-ID';

  @override
  String get chatMessageViewReactions => 'Bekyk reaksies';

  @override
  String get chatMessageRemoveAllReactions => 'Verwyder alle reaksies';

  @override
  String get chatMessageDebug => 'Debug Boodskap';

  @override
  String get chatMessageDebugSheetTitle => 'Debug boodskap';

  @override
  String get chatMessageDebugCopyJson => 'Kopieer JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Boodskap JSON na knipbord gekopieer';

  @override
  String get chatReactionsSheetTitle => 'Reaksies';

  @override
  String get chatReactionsSheetEmpty =>
      'Niemand het nog hiermee gereageer nie.';

  @override
  String get chatMessageReport => 'Rapporteer Boodskap';

  @override
  String get iarReportMessageTitle => 'Rapporteer boodskap';

  @override
  String get iarThisUserFallback => 'hierdie gebruiker';

  @override
  String get iarModalDescription =>
      'Rapporteer \'n reëlbreuk, of vind gereedskap om kontakte en voorkeure te bestuur.';

  @override
  String get iarPathStepAriaLabel => 'Wat benodig jy?';

  @override
  String get iarCategoryStepTitle => 'Watter soort reël is oortree?';

  @override
  String get iarReasonStepTitle => 'Watter reël is oortree?';

  @override
  String get iarReasonSelectHint => 'Kies \'n rede';

  @override
  String get iarPickAnOptionToast => 'Kies \'n opsie om voort te gaan.';

  @override
  String get iarPickARuleToast => 'Kies die reël wat oortree is.';

  @override
  String get iarPathPlatform => 'Rapporteer \'n platformreël-oortreding';

  @override
  String get iarPathCommunity =>
      'Rapporteer aan die moderators van hierdie gemeenskap';

  @override
  String get iarPathPreferenceMessage => 'Ek hou nie van hierdie inhoud nie';

  @override
  String get iarCategoryTargetedHarmLabel => 'Bedreigings, teistering of skade';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Boelies, dreigemente, haat, geweld, strooptogte, of inhoud wat selfskade aanmoedig.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Kinderveiligheid of volwasse inhoud';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Kinders in gevaar, volwasse inhoud op die verkeerde plek, of ongewenste gedrag.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Privaatheid of nabootsing';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, stalking, voorgee om iemand te wees, of \'n onvanpaste profiel.';

  @override
  String get iarCategoryDeceptionLabel => 'Scams, wanware, of waninligting';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, bedrog, kwaadwillige skakels, of vals bewerings wat waarskynlik werklike skade sal veroorsaak.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Onwettige aktiwiteit of iets anders';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Onwettige verkope, fasilitering van misdaad, of \'n duidelike reëlbreuk wat nie hierbo pas nie.';

  @override
  String get iarReasonHarassmentLabel => 'Teistering of dreigemente';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Boelies, herhaalde ongewenste kontak, stalking, of geteikende misbruik.';

  @override
  String get iarReasonHateLabel => 'Haatspraak';

  @override
  String get iarReasonHateMessageDescription =>
      'Smaad, ontmenslikende taal, of aanvalle op beskermde groepe.';

  @override
  String get iarReasonViolenceLabel => 'Geweld of gewelddadige dreigemente';

  @override
  String get iarReasonViolenceDescription =>
      'Geloofwaardige dreigemente, grafiese geweld, of verheerliking van geweld.';

  @override
  String get iarReasonMatureContentLabel => 'Volwasse inhoud of teistering';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Ongewenste gedrag of volwasse inhoud op die verkeerde plek.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Kinderveiligheid of uitbuiting van minderjariges';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Teistering of inhoud wat minderjariges uitbuit.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Skadelike waninligting';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Vals bewerings wat waarskynlik werklike skade sal veroorsaak.';

  @override
  String get iarReasonSpamLabel => 'Spam, scams, of phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Massa spam, bedrog, vals geskenke, of profielmisbruik.';

  @override
  String get iarReasonMalwareLabel => 'Wanware of gevaarlike skakels';

  @override
  String get iarReasonMalwareDescription =>
      'Wanware, diefstal van geloofsbriewe, of skadelike lêers.';

  @override
  String get iarReasonPrivacyLabel => 'Privaatheidskending';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, blootgestelde privaat inligting, of stalking.';

  @override
  String get iarReasonImpersonationLabel => 'Nabootsing of misleidende media';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Voorgee om iemand anders te wees, insluitend misleidende KI-gegenereerde inhoud.';

  @override
  String get iarReasonIllegalLabel => 'Onwettige aktiwiteit';

  @override
  String get iarReasonIllegalDescription =>
      'Onwettige verkope, fasilitering van misdaad, of onwettige aktiwiteit.';

  @override
  String get iarReasonSelfHarmLabel => 'Selfskade of selfmoord';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Bevordering of instruksies wat selfskade of eetversteurings aanmoedig.';

  @override
  String get iarReasonOtherLabel => '\'n Ander duidelike reëlbreuk';

  @override
  String get iarReasonOtherDescription =>
      'Gebruik slegs indien dit duidelik Fluxer se reëls breek en nie hierbo pas nie.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'As \'n minderjarige betrokke is, gebruik eerder \"$childSafetyReason\".';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'As dit CSAM of uitbuiting van \'n minderjarige behels, stuur dit nou en deel nie die materiaal weer nie.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'As iemand in onmiddellike gevaar mag wees, kontak plaaslike nooddienste indien jy dit veilig kan doen.';

  @override
  String get iarSafetyNoteViolence =>
      'As dit \'n geloofwaardige onmiddellike dreigement is, kontak ook plaaslike nooddienste.';

  @override
  String get iarSafetyNoteTerrorism =>
      'As dit \'n onmiddellike terroristiese dreigement is, kontak ook plaaslike nooddienste.';

  @override
  String get iarActionBlockUserTitle => 'Blokkeer hierdie gebruiker';

  @override
  String get iarActionBlockUserDescription =>
      'Stop messages and friend requests.';

  @override
  String get iarActionBlockUserButton => 'Block';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copy message link';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Share with community mods.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copy';

  @override
  String get iarActionCloseDmTitle => 'Close this DM';

  @override
  String get iarActionCloseDmDescription =>
      'Doesn\'t block. You can reopen later.';

  @override
  String get iarActionCloseDmButton => 'Close DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Leave the community';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Stop seeing its content and members.';

  @override
  String get iarActionLeaveCommunityButton => 'Leave';

  @override
  String get iarActionDmSettingsTitle => 'DM & friend request settings';

  @override
  String get iarActionDmSettingsDescription => 'Change who can reach you.';

  @override
  String get iarActionCallSettingsTitle => 'Call & group chat settings';

  @override
  String get iarActionCallSettingsDescription =>
      'Change who can call or add you.';

  @override
  String get iarActionOpenButton => 'Open';

  @override
  String get iarActionDeleteMessageTitle => 'Delete this message';

  @override
  String get iarActionDeleteMessageDescription =>
      'Remove it from the channel for everyone.';

  @override
  String get iarActionDeleteMessageButton => 'Delete';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Deleted';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'This message has already been deleted.';

  @override
  String get iarActionBanUserTitle => 'Ban this user';

  @override
  String get iarActionBanUserDescription =>
      'Open the ban dialog for this community.';

  @override
  String get iarActionBanUserButton => 'Ban';

  @override
  String get iarActionBanUserBannedButton => 'Banned';

  @override
  String get iarActionBanUserBannedTooltip =>
      'This user is already banned from the community.';

  @override
  String get iarCloseDmConfirmTitle => 'Close DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Close your current DM with $name. This doesn\'t block them; you can reopen later.';
  }

  @override
  String get iarSuccessTitle => 'Report sent';

  @override
  String get iarSuccessBody =>
      'Our safety team is reviewing it. We\'ll send you a DM and email once we\'ve reached a verdict.';

  @override
  String get iarAlreadyReportedTitle => 'Already reported';

  @override
  String get iarAlreadyReportedBody =>
      'You\'ve already reported this message. Our safety team is reviewing it.';

  @override
  String get iarBackButton => 'Back';

  @override
  String get iarContinueButton => 'Continue';

  @override
  String get iarSendReportButton => 'Send report';

  @override
  String get iarDoneButton => 'Done';

  @override
  String get iarCouldntSendToast =>
      'Couldn\'t send the report. Please try again.';

  @override
  String get iarRateLimitedToast =>
      'You\'re reporting too quickly. Please wait a moment and try again.';

  @override
  String get iarReportSentToast =>
      'Report sent. Our safety team will review it.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Block $name? They won\'t be able to message you or send you friend requests. You can unblock them later.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Couldn\'t block this user. Please try again.';

  @override
  String get iarCloseDmSuccessToast => 'DM closed.';

  @override
  String get iarCloseDmFailedToast =>
      'Couldn\'t close this DM. Please try again.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Couldn\'t leave this community. Please try again.';

  @override
  String get chatMessageSuppressEmbeds => 'Suppress Embeds';

  @override
  String get chatMessageUnsuppressEmbeds => 'Unsuppress Embeds';

  @override
  String get chatMessageDelete => 'Delete Message';

  @override
  String get chatMessageDeleteConfirmTitle => 'Delete Message';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Are you sure you want to delete this message?';

  @override
  String get chatMessageMore => 'More';

  @override
  String get chatEditingMessage => 'Boodskap word geredigeer';

  @override
  String get chatReplyOriginalDeleted => 'Oorspronklike boodskap is uitgevee';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Oorspronklike boodskap kon nie gelaai word nie';

  @override
  String get chatReplyAttachedMedia => 'Boodskap bevat aangehegte media';

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
  String get chatMessagesLoadError => 'Kon nie boodskappe laai nie.';

  @override
  String get chatReplyMentionOverrideTitle => 'Oorskryf vermeldingvoorkeur?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname verkies om op antwoorde @genoem te word. Stuur sonder die vermelding nogtans?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname verkies antwoorde sonder \'n @vermelding. Stuur met die vermelding nogtans?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignoreer voorkeur';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klik om die gebruiker aan wie jy antwoord te ping af te skakel.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klik om die gebruiker aan wie jy antwoord te ping aan te skakel.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Noem gebruiker aan wie geantwoord word';

  @override
  String get chatReplyMentionOn => 'Aan';

  @override
  String get chatReplyMentionOff => 'Af';

  @override
  String get chatReplyCancel => 'Kanselleer antwoord';

  @override
  String get chatEditMessageHint => 'Redigeer boodskap';

  @override
  String get chatEditNoChanges => 'Geen veranderinge om te stoor nie';

  @override
  String get chatChannelNotReady =>
      'Hierdie kanaal is nog nie gereed nie. Probeer weer in \'n oomblik.';

  @override
  String get chatMessageEdited => '(geredigeer)';

  @override
  String get chatMessageSilent => 'Dit was \'n @silent boodskap.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Vandag om $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Gister om $time';
  }

  @override
  String get mediaViewerImagePreview => 'Voorskou van prent';

  @override
  String get mediaViewerClose => 'Sluit media-kyker';

  @override
  String get mediaViewerOpenInBrowser => 'Maak oop in blaaier';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Stuur aan';

  @override
  String get mediaViewerZoomIn => 'Zoom in';

  @override
  String get mediaViewerZoomOut => 'Zoom uit';

  @override
  String get mediaViewerPreviousAttachment => 'Vorige aanhangsel';

  @override
  String get mediaViewerNextAttachment => 'Volgende aanhangsel';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Wissel video-kontroles';

  @override
  String get chatAttachmentVideoMute => 'Dem demp video';

  @override
  String get chatAttachmentVideoUnmute => 'Ontdemp video';

  @override
  String get chatAttachmentVideoPlay => 'Speel video';

  @override
  String get chatAttachmentVideoPause => 'Pouse video';

  @override
  String get chatAttachmentVideoProgress => 'Video vordering';

  @override
  String get chatVideoPlaybackFailed => 'Kon nie hierdie video speel nie.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Stel gebruikers met hierdie rol wat toestemming het om hierdie kanaal te sien in kennis.';

  @override
  String get addGuildModalTitle => 'Voeg \'n gemeenskap by';

  @override
  String get addGuildModalLandingDescription =>
      'Skep \'n nuwe gemeenskap of sluit by \'n bestaande een aan.';

  @override
  String get addGuildCreateCommunity => 'Skep gemeenskap';

  @override
  String get addGuildJoinCommunity => 'Sluit by gemeenskap aan';

  @override
  String get addGuildImportDiscordTemplate => 'Voer Discord-sjabloon in';

  @override
  String get addGuildJoinTitle => 'Sluit by \'n gemeenskap aan';

  @override
  String get addGuildJoinDescription =>
      'Voer die uitnodigingskakel in om by \'n gemeenskap aan te sluit.';

  @override
  String get addGuildInviteLinkLabel => 'Uitnodigingskakel';

  @override
  String get addGuildJoinSubmit => 'Sluit by gemeenskap aan';

  @override
  String get addGuildInviteInvalid =>
      'Hierdie uitnodiging is ongeldig of het verval.';

  @override
  String get addGuildJoinFailed =>
      'Kon nie by gemeenskap aansluit nie. Probeer asseblief weer.';

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
  String get addGuildPackInstalled => 'Pakket suksesvol geïnstalleer.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Verwyder alle reaksies';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Is jy seker jy wil alle reaksies van hierdie boodskap verwyder?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Verwyder boodskap vas';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Stuur hierdie vasgemaakte boodskap terug in tyd?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username het $messageLink hieraan toegespan. Sien $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'n boodskap';

  @override
  String get systemPinMessageAllPinsLink => 'alle vasgemaakte boodskappe';

  @override
  String get channelPinsEmptyTitle => 'Geen vasgemaakte boodskappe';

  @override
  String get channelPinsEmptyDescription =>
      'Vasgemaakte boodskappe sal hier verskyn.';

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
  String get personalNotesTitle => 'Persoonlike notas';

  @override
  String get personalNotesSubtitle =>
      'Jou privaat spasie vir gedagtes en herinneringe';

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
    return 'Welkom by $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Aan die begin was daar niks. Toe was daar $channelName. En dit was goed.';
  }

  @override
  String get personalNotesComposerHint => 'Stuur vir jouself \'n boodskap';

  @override
  String get personalNotesPrivateSpace => 'Jou privaat spasie';

  @override
  String get purgePersonalNotes => 'Maak persoonlike notas skoon';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Dit sal elke boodskap en aanhangsel in jou persoonlike notas permanent uitvee. Dit kan nie ongedaan gemaak word nie.';

  @override
  String get purgePersonalNotesConfirmButton => 'Maak skoon';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count boodskappe uit persoonlike notas skoongemaak';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Persoonlike notas was reeds leeg';

  @override
  String get purgePersonalNotesFailed => 'Kon nie persoonlike notas uitvee nie';

  @override
  String get userSettingsGroupYourAccount => 'JOU REKENING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profiel';

  @override
  String get userSettingsNavSecurityLogin => 'Sekuriteit & Intekening';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Geskenke & Kodes';

  @override
  String get userSettingsNavPrivacyDashboard => 'Privaatheids Kontroleskerm';

  @override
  String get userSettingsNavAuthorizedApps => 'Gemagtigde Toepassings';

  @override
  String get userSettingsNavBlockedUsers => 'Geblokkeerde Gebruikers';

  @override
  String get userSettingsNavLinkedDevices => 'Gekoppelde Toestelle';

  @override
  String get userSettingsNavConnections => 'Konneksies';

  @override
  String get userSettingsNavLookAndFeel => 'Voorkoms & Gevoel';

  @override
  String get userSettingsNavAccessibility => 'Toeganklikheid';

  @override
  String get userSettingsNavChat => 'Boodskappe & Media';

  @override
  String get userSettingsNavAudioAndVideo => 'Klank & Video';

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
  String get userSettingsNavLanguageAndTime => 'Taal & Tyd';

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
  String get userSettingsNavAdvanced => 'Gevorderd';

  @override
  String get advancedPerformanceReportingTitle => 'Prestasieverslagdoening';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Help om Fluxer te verbeter deur anonieme fout- en prestasiedata te deel.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Stuur fout- en prestasieverslae';

  @override
  String get advancedPerformanceReportingDescription =>
      'Alle gerapporteerde data is anoniem en word slegs na Fluxer se eie monitordienste gestuur — geen derdeparty-verskaffers word gebruik nie.';

  @override
  String get userSettingsNavApplications => 'Toepassings';

  @override
  String get userSettingsNavAppLogs => 'Toepassingslogboeke';

  @override
  String get userSettingsNavDeveloperTools => 'Ontwikkelaarsnutsgoed';

  @override
  String get userSettingsNavLimitsConfig => 'Limiete Konfigurasie';

  @override
  String get userSettingsNavFeatureFlags => 'Kenmerk Vlagte';

  @override
  String get userSettingsNavWhatsNew => 'Wat is Nuut';

  @override
  String get userSettingsNavLogOut => 'Teken Uit';

  @override
  String get betaWarningTitle => 'Beta-sagteware';

  @override
  String get betaWarningMessage =>
      'Dit is beta-sagteware. Nie alles is klaar of bygevoeg nie.';

  @override
  String get betaWarningReportIssues =>
      'Rapporteer asseblief enige probleme wat jy vind aan die Fluxer Mobile-gemeenskap (jy moet tans Plutonium hê om by die gemeenskap aan te sluit).';

  @override
  String get betaWarningRepoLink => 'Bekyk bronkode op GitHub';

  @override
  String get betaWarningGotIt => 'Ek verstaan';

  @override
  String get quickSwitcherTabSearch => 'Soek';

  @override
  String get quickSwitcherTabFriends => 'Vriende';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Soek vir kanale, mense, of gemeenskappe';

  @override
  String get quickSwitcherSearchFriends => 'Soek vriende';

  @override
  String get quickSwitcherNoMatchesFound => 'Geen resultate gevind nie';

  @override
  String get quickSwitcherEmptyHint =>
      'Probeer \'n ander naam of gebruik @ / # / ! / * voorvoegsels om resultate te filter.';

  @override
  String get quickSwitcherSectionPeople => 'Mense';

  @override
  String get quickSwitcherSectionGroupMessages => 'Groepboodskappe';

  @override
  String get quickSwitcherSectionTextChannels => 'Teks-kanale';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Stemkanale';

  @override
  String get quickSwitcherSectionCommunities => 'Gemeenskappe';

  @override
  String get quickSwitcherSectionSettings => 'Instellings';

  @override
  String get quickSwitcherHomeLabel => 'Tuis';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direkte boodskappe';

  @override
  String get quickSwitcherFavoritesLabel => 'Gunstelinge';

  @override
  String get quickSwitcherUserSettingsLabel => 'Gebruikersinstellings';

  @override
  String get quickSwitcherNotificationsLabel => 'Kennisgewings';

  @override
  String get quickSwitcherBookmarksLabel => 'Boekmerke';

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
  String get quickSwitcherMentionsLabel => 'Vermeldings';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Nog geen vriende nie';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Voeg \'n vriend by om te begin.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Geen vriende pas by daardie soektog nie';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Probeer \'n ander naam.';

  @override
  String get quickSwitcherSearchAliasUser => 'Gebruiker';

  @override
  String get quickSwitcherSearchAliasYou => 'Jy';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM\'s';

  @override
  String get quickSwitcherSearchAliasMessages => 'Boodskappe';

  @override
  String get quickSwitcherSearchAliasFav => 'Gunsteling';

  @override
  String get quickSwitcherSearchAliasStarred => 'Gester';

  @override
  String get quickSwitcherSearchAliasInbox => 'Posbus';

  @override
  String get quickSwitcherSearchAliasSaved => 'Gestoor';

  @override
  String get uiClose => 'Sluit';

  @override
  String get chatJumpToBottom => 'Spring na onder';

  @override
  String get uiConfirm => 'Bevestig';

  @override
  String get uiLoading => 'Laai';

  @override
  String get uiUnsavedChanges => 'Ongestoorde veranderinge';

  @override
  String get uiReset => 'Herstel';

  @override
  String get uiOpenColorPicker => 'Maak kleurkieser oop';

  @override
  String get uiSelectPlaceholder => 'Kies';

  @override
  String get uiSearchPlaceholder => 'Soek';

  @override
  String get uiNoOptionsFound => 'Geen opsies gevind nie';

  @override
  String get uiDismissNotification => 'Verwerp kennisgewing';

  @override
  String get uiColorPickerTitle => 'Kleurkieser';

  @override
  String get mentionConfirmTitle => 'Nooi almal uit?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Dit sal $count lede in kennis stel. Gaan voort?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Dit sal $count aanlyn lede in kennis stel. Gaan voort?';
  }

  @override
  String get mentionConfirmButton => 'Noem';

  @override
  String get composerEmojiUnavailable =>
      'Jy kan nie daardie emoji hier gebruik nie.';

  @override
  String get instanceUrlLabel => 'Instansie URL';

  @override
  String get instanceUrlPlaceholder => 'Voer instansie URL in (bv. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Stel terug na Fluxer';

  @override
  String get instanceConnect => 'Koppel';

  @override
  String get instanceConnecting => 'Koppel...';

  @override
  String get instanceConnectFailed => 'Kon nie aan instansie koppel nie';

  @override
  String get recentInstances => 'Onlangse instansies';

  @override
  String removeRecentInstance(String domain) {
    return 'Verwyder $domain uit onlangse instansies';
  }

  @override
  String get instanceSheetTitle => 'Koppel aan instansie';

  @override
  String get connectToDifferentInstance => 'Koppel aan \'n ander instansie';

  @override
  String get changeInstance => 'Verander';

  @override
  String get instanceConnectionRequired =>
      'Koppel aan die instansie om aan te meld';

  @override
  String get comingSoon => 'Kom binnekort';

  @override
  String get guildNavbarDirectMessages => 'Direkte boodskappe';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Verken ontdekbare gemeenskappe';

  @override
  String get discoveryExplore => 'Verken';

  @override
  String get discoveryExplorePublicCommunities =>
      'Verken publieke gemeenskappe';

  @override
  String get discoveryListingSubheading =>
      'Wil jy jou gemeenskap hier lys? Pas toe as jy aan die vereistes voldoen in jou gemeenskap se instellings > Ontdekking.';

  @override
  String get discoverySearchCommunities => 'Soek gemeenskappe';

  @override
  String get discoveryFilterByLanguage => 'Filtreer volgens taal';

  @override
  String get discoveryAllLanguages => 'Alle tale';

  @override
  String get discoveryAllCategories => 'Alles';

  @override
  String get discoveryCategoryGaming => 'Speletjies';

  @override
  String get discoveryCategoryMusic => 'Musiek';

  @override
  String get discoveryCategoryEntertainment => 'Vermaak';

  @override
  String get discoveryCategoryEducation => 'Onderwys';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Wetenskap & Tegnologie';

  @override
  String get discoveryCategoryContentCreator => 'Inhoudskepper';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Flieks & TV';

  @override
  String get discoveryCategoryOther => 'Ander';

  @override
  String get discoveryNoCommunitiesMatch => 'Geen gemeenskappe pas nie.';

  @override
  String get discoveryJoinCommunity => 'Sluit aan by gemeenskap';

  @override
  String get discoveryJoined => 'Aangesluit';

  @override
  String discoveryOnlineCount(String count) {
    return '$count aanlyn';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString lede',
      one: '1 lid',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Geen beskrywing nie.';

  @override
  String get discoveryCommunities => 'Gemeenskappe';

  @override
  String get discoveryApps => 'Toepassings';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Kon nie by hierdie gemeenskap aansluit nie';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Iets het verkeerd geloop. Probeer asseblief weer binne \'n oomblik.';

  @override
  String get discoveryJoinErrorFullTitle => 'Hierdie gemeenskap is vol';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Hierdie gemeenskap het sy lidmaattal bereik, so jy kan nie nou aansluit nie.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Jy het die gemeenskapslimiet bereik';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Jy is in die maksimum aantal gemeenskappe. Verlaat een en probeer weer.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Jy kan nie by hierdie gemeenskap aansluit nie';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Jy is uit hierdie gemeenskap verban.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Hierdie gemeenskap is nie meer beskikbaar nie';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Dit mag wees dat dit uit ontdekking verwyder is of nuwe aansluitings afgeskakel het. Verfris die bladsy en jy sal dit nie weer sien nie.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Jy gaan te vinnig';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Wag asseblief \'n oomblik en probeer weer.';

  @override
  String get guildNavbarAddCommunity => 'Voeg \'n Gemeenskap by';

  @override
  String get guildNavbarHelp => 'Hulp';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NUWE BOODSKAP';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Vou $folderName toe';
  }

  @override
  String get guildNavbarGroupDm => 'Groep DM';

  @override
  String get guildNavbarCreateChannel => 'Skep Kanaal';

  @override
  String get guildNavbarChannelType => 'Kanaaltipe';

  @override
  String get guildNavbarTextChannel => 'Teks Kanaal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Stuur boodskappe, beelde, GIF\'s en emoji\'s';

  @override
  String get guildNavbarVoiceChannel => 'Stemkanaal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Hang saam uit met stem, video en skermdeling';

  @override
  String get guildNavbarLinkChannel => 'Skakel Kanaal';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Vinnige toegang tot \'n eksterne webwerf of hulpbron';

  @override
  String get guildNavbarNameLabel => 'Naam';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Skep Kategorie';

  @override
  String get guildNavbarNewCategoryHint => 'Nuwe Kategorie';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Nooi vriende na $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Ontvangers sal na #$channelName geneem word';
  }

  @override
  String get guildNavbarSearchFriends => 'Soek vriende';

  @override
  String get guildNavbarNoFriendsYet => 'Nog geen vriende nie';

  @override
  String get guildNavbarNoResults => 'Geen resultate nie';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Of, stuur \'n uitnodigingskakel aan \'n vriend:';

  @override
  String get guildNavbarInviteLink => 'Uitnodigingskakel';

  @override
  String get guildNavbarCopy => 'Kopieer';

  @override
  String get guildNavbarCopied => 'Gekopieer!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Jou uitnodigingskakel verval oor 7 dae.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Hierdie uitnodigingskakel verval nooit.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Jou uitnodigingskakel verval oor $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Wysig uitnodigingskakel';

  @override
  String get guildNavbarInviteLinkSettings => 'Uitnodigingskakel instellings';

  @override
  String get guildNavbarExpireAfter => 'Verval Na';

  @override
  String get guildNavbarMaxUses => 'Maksimum Aantal Gebruike';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Ken Tydelike Lidmaatskap Toe';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Lede sal verwyder word wanneer hulle vanlyn gaan, tensy \'n rol toegeken word';

  @override
  String get guildNavbarCreateNewLink => 'Skep Nuwe Skakel';

  @override
  String get guildNavbarSent => 'Gestuur';

  @override
  String get guildNavbarInvite => 'Nooi';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Verlaat Gemeenskap';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Is jy seker jy wil hierdie gemeenskap verlaat? Jy sal nie meer enige boodskappe kan sien nie.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Verlaat Gemeenskap';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Verwyder jou boodskappe in hierdie gemeenskap?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Verwyder permanent elke boodskap wat jy hier gestuur het, oor elke kanaal. Kan nie ongedaan gemaak word nie.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Verwyder My Boodskappe';

  @override
  String get guildNavbarDeletedYourMessages => 'Jou boodskappe is verwyder';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Kon nie jou boodskappe verwyder nie';

  @override
  String get guildNavbarRemoveOverride => 'Verwyder oorheersing';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Gemit tot $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Slegs toeganklik vir Fluxer-personeel';

  @override
  String get guildNavbarInvitesPaused =>
      'Uitnodigings is tans in hierdie gemeenskap onderbreek';

  @override
  String get guildNavbarDurationNever => 'nooit';

  @override
  String get guildNavbarDuration30Minutes => '30 minute';

  @override
  String get guildNavbarDuration1Hour => '1 uur';

  @override
  String get guildNavbarDuration6Hours => '6 ure';

  @override
  String get guildNavbarDuration12Hours => '12 ure';

  @override
  String get guildNavbarDuration1Day => '1 dag';

  @override
  String get guildNavbarDuration7Days => '7 dae';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekondes';
  }

  @override
  String get guildNavbarNever => 'Nooit';

  @override
  String get guildNavbarNoLimit => 'Geen limiet';

  @override
  String get guildNavbarOneUse => '1 gebruik';

  @override
  String guildNavbarUses(int count) {
    return '$count gebruike';
  }

  @override
  String get guildMenuMarkAsRead => 'Merk as gelees';

  @override
  String get guildPeekMoreOptions => 'Meer Opsies';

  @override
  String get guildMenuInviteMembers => 'Nooi Lede';

  @override
  String get guildMenuCommunitySettings => 'Gemeenskapsinstellings';

  @override
  String get guildMenuEditCommunityProfile => 'Wysig Gemeenskapsprofiel';

  @override
  String get guildMenuUnmuteCommunity => 'Genooi Gemeenskap';

  @override
  String get guildMenuMuteCommunity => 'Gemi Gemeenskap';

  @override
  String get guildMenuHideMutedChannels => 'Versteek Gemitkanale';

  @override
  String get guildMenuReportCommunity => 'Rapporteer Gemeenskap';

  @override
  String get guildMenuDebugCommunity => 'Debug Gemeenskap';

  @override
  String get guildMenuCopyCommunityId => 'Kopieer Gemeenskaps-ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Tot $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Algemeen';

  @override
  String get guildMenuSettingsRoles => 'Rolle & Toestemmings';

  @override
  String get guildMenuSettingsEmoji => 'Pasgemaakte Emoji';

  @override
  String get guildMenuSettingsStickers => 'Pasgemaakte Plakkers';

  @override
  String get guildMenuSettingsSafetyModeration => 'Veiligheid & Moderering';

  @override
  String get guildMenuSettingsActivityLog => 'Activity Log';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Pasgemaakte Uitnodigings-URL';

  @override
  String get guildMenuSettingsDiscovery => 'Ontdekking';

  @override
  String get guildMenuSettingsMembers => 'Lede';

  @override
  String get guildMenuSettingsInviteLinks => 'Uitnodigingsskakels';

  @override
  String get guildMenuSettingsBans => 'Verbannings';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Jy het nie toestemming om hierdie instellingsblad te sien nie.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikoon';

  @override
  String get guildSettingsUploadImage => 'Laai Beeld op';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banier';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Laai \'n banier vir jou bediener op.';

  @override
  String get guildSettingsOverviewNameTitle => 'Naam';

  @override
  String get guildSettingsOverviewNameHint => 'My wonderlike gemeenskap';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistieke';

  @override
  String get guildSettingsOverviewMembers => 'Lede';

  @override
  String get guildSettingsOverviewOnline => 'Aanlyn';

  @override
  String get guildSettingsRolesDescription =>
      'Gebruik rolle om lede te groepeer en toestemmings toe te ken.';

  @override
  String get guildSettingsCreateRole => 'Skep Rol';

  @override
  String get guildSettingsRolesListTitle => 'Rolle';

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
    return '$staticCount statiese, $animatedCount geanimeerde emoji-gleuwe gebruik';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Nog geen pasgemaakte emoji\'s nie.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count plakkers opgelaai';
  }

  @override
  String get guildSettingsStickersEmpty => 'Nog geen pasgemaakte plakkers nie.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Lidverifikasie';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Kies wat lede moet hê voordat hulle gemeenskapslede kan pos of DM.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Lede met rolle kan hierdie kontroles omseil. Vir publieke ruimtes, beveel ons aan om verifikasie te aktiveer.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Gemeenskappe wat in Ontdekking gelys word, vereis ten minste \'n geverifieerde e-pos. Geen kan nie gekies word terwyl Ontdekking geaktiveer is nie.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Volwasse inhoud en inhoudwaarskuwings';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Stel volwasse inhoud-etikettering en opsionele inhoudwaarskuwings vir lede op.';

  @override
  String get guildSettingsModerationMatureToggle => 'Volwasse inhoud';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Merk hierdie gemeenskap as synde volwasse inhoud.';

  @override
  String get guildSettingsVerificationNone => 'Geen';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Geen verifikasie word vereis nie.';

  @override
  String get guildSettingsVerificationLow => 'Laag';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Vereis \'n geverifieerde e-posadres.';

  @override
  String get guildSettingsVerificationMedium => 'Medium';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Vereis \'n geverifieerde e-posadres, en \'n rekening wat minstens 5 minute oud is.';

  @override
  String get guildSettingsVerificationHigh => 'Hoog';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Vereis alles in medium, plus om \'n lid van die gemeenskap vir minstens 10 minute te wees.';

  @override
  String get guildSettingsVerificationHighest => 'Baie hoog';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Vereis \'n geverifieerde telefoonnommer.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Volg moderator-aksies regoor die gemeenskap.';

  @override
  String get guildSettingsAuditLogEmpty => 'Nog geen logs nie';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderator-aksies en gemeenskapsveranderinge sal hier verskyn.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Alle gebruikers';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Alle aksies';

  @override
  String get guildSettingsAuditLogNoReason => 'Geen rede is verskaf nie.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Onbekende gebruiker';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Iets het verkeerd geloop terwyl die aktiwiteitslog gelaai is.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Kon nie aktiwiteitslogs laai nie';

  @override
  String get guildSettingsAuditLogReason => 'Rede';

  @override
  String get guildSettingsAuditLogSomeone => 'iemand';

  @override
  String get guildSettingsAuditLogSomething => 'iets';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'onbekende entiteit';

  @override
  String get guildSettingsAuditLogNothing => 'niks';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Onbekende teiken';

  @override
  String get auditLogActionGuildUpdate => 'Gemeenskap opgedateer';

  @override
  String get auditLogActionChannelCreate => 'Kanaal geskep';

  @override
  String get auditLogActionChannelUpdate => 'Kanaal opgedateer';

  @override
  String get auditLogActionChannelDelete => 'Kanaal uitgevee';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanaal-oorskrywing bygevoeg';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanaal-oorskrywing opgedateer';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanaal-oorskrywing verwyder';

  @override
  String get auditLogActionMemberKick => 'Lid uitgeskop';

  @override
  String get auditLogActionMemberPrune => 'Lede gesnoei';

  @override
  String get auditLogActionMemberBanAdd => 'Lid verban';

  @override
  String get auditLogActionMemberBanRemove => 'Lid ontban';

  @override
  String get auditLogActionMemberUpdate => 'Lid opgedateer';

  @override
  String get auditLogActionMemberRoleUpdate => 'Lidrolle opgedateer';

  @override
  String get auditLogActionMemberMove => 'Lid verskuif';

  @override
  String get auditLogActionMemberDisconnect => 'Lid ontkoppel';

  @override
  String get auditLogActionBotAdd => 'Bot bygevoeg';

  @override
  String get auditLogActionRoleCreate => 'Rol geskep';

  @override
  String get auditLogActionRoleUpdate => 'Rol opgedateer';

  @override
  String get auditLogActionRoleDelete => 'Rol uitgevee';

  @override
  String get auditLogActionInviteCreate => 'Uitnodiging geskep';

  @override
  String get auditLogActionInviteUpdate => 'Uitnodiging opgedateer';

  @override
  String get auditLogActionInviteDelete => 'Uitnodiging uitgevee';

  @override
  String get auditLogActionWebhookCreate => 'Webhook geskep';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook opgedateer';

  @override
  String get auditLogActionWebhookDelete => 'Webhook uitgevee';

  @override
  String get auditLogActionEmojiCreate => 'Emoji geskep';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji opgedateer';

  @override
  String get auditLogActionEmojiDelete => 'Emoji uitgevee';

  @override
  String get auditLogActionStickerCreate => 'Plakker geskep';

  @override
  String get auditLogActionStickerUpdate => 'Plakker opgedateer';

  @override
  String get auditLogActionStickerDelete => 'Plakker uitgevee';

  @override
  String get auditLogActionMessageDelete => 'Boodskap uitgevee';

  @override
  String get auditLogActionMessageBulkDelete => 'Boodskappe uitgevee';

  @override
  String get auditLogActionMessagePin => 'Boodskap vasgespyker';

  @override
  String get auditLogActionMessageUnpin => 'Boodskap losgespyker';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor het die gemeenskapsinstellings opgedateer.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor het die kanaal $target geskep.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor het die kanaal $target opgedateer.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor het die kanaal $target uitgevee.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor het kanaaltoestemmings vir $target bygevoeg.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor het kanaaltoestemmings vir $target in $channel bygevoeg.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor het kanaaltoestemmings vir $target opgedateer.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor het kanaaltoestemmings vir $target in $channel opgedateer.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor het kanaaltoestemmings vir $target verwyder.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor het kanaaltoestemmings vir $target in $channel verwyder.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor het $target uitgeskop.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor het $target verbied.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor het $target se verbod opgehef.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor het $target opgedateer.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor het rolle vir $target opgedateer.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor het onaktiewe lede gesnoei.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor het lede gesnoei wat $days dae lank onaktief was.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor het $target na \'n ander stemkanaal verskuif.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor het $target na $channel verskuif.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor het $target van stem ontkoppel.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor het die bot $target bygevoeg.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor het die rol $target geskep.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor het die rol $target opgedateer.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor het die rol $target uitgevee.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor het die uitnodiging $target geskep.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor het die uitnodiging $target vir $channel geskep.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor het die uitnodiging $target opgedateer.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor het die uitnodiging $target vir $channel opgedateer.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor het die uitnodiging $target uitgevee.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor het die uitnodiging $target vir $channel uitgevee.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor het die webhook $target geskep.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor het die webhook $target opgedateer.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor het die webhook $target uitgevee.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor het die emoji $target bygevoeg.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor het die emoji $target opgedateer.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor het die emoji $target uitgevee.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor het die plakker $target bygevoeg.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor het die plakker $target opgedateer.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor het die plakker $target uitgevee.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor het \'n boodskap uitgevee.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor het \'n boodskap in $channel uitgevee.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor het veelvuldige boodskappe uitgevee.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor het $count boodskappe uitgevee.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor het veelvuldige boodskappe in $channel uitgevee.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor het $count boodskappe in $channel uitgevee.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor het \'n boodskap vasgespeld.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor het \'n boodskap in $channel vasgespeld.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor het \'n boodskap losgespeld.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor het \'n boodskap in $channel losgespeld.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor het \'n ouditaksie op $target uitgevoer.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Het $field van $oldValue na $newValue opgedateer.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Het $field na $newValue gestel.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Het $field skoongemaak (was $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Het $field opgedateer.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Het die gemeenskap hernoem na $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Het die gemeenskap-ikoon opgedateer.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Het die kanaal hernoem na $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Het die onderwerp skoongemaak.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Het die onderwerp na $topic opgedateer.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Het volwasse inhoud geaktiveer.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Het volwasse inhoud gedeaktiveer.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Het bynaam na $nickname gestel.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Het bynaam $nickname verwyder.';
  }

  @override
  String get auditLogChangeMutedMember => 'Het die lid gedemp.';

  @override
  String get auditLogChangeUnmutedMember => 'Het die lid ontdemp.';

  @override
  String get auditLogChangeDeafenedMember => 'Het die lid doof gemaak.';

  @override
  String get auditLogChangeUndeafenedMember => 'Het die lid ontdoof gemaak.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Het $roles bygevoeg.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Het $roles verwyder.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanaal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Boodskap: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Genooi deur $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# boodskappe uitgevee.',
      one: '1 boodskap uitgevee.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# lede verwyder.',
      one: '1 lid verwyder.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Hierdie uitnodiging verval nooit.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Ken tydelike lidmaatskap toe.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Ken permanente lidmaatskap toe.';

  @override
  String get guildSettingsLoadMore => 'Laai meer';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Bestuur webhooks wat boodskappe na kanale plaas.';

  @override
  String get guildSettingsWebhooksEmpty => 'Geen webhooks gekonfigureer nie.';

  @override
  String get guildSettingsCopyUrl => 'Kopieer URL';

  @override
  String get guildSettingsCopiedUrl => 'URL na knipbord gekopieer';

  @override
  String get guildSettingsDeleteWebhook => 'Vee webhook uit';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Stel \'n pasgemaakte uitnodigingskakel vir jou bediener in.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Stoor';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Gebruik';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count gebruike';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Aansoek doen om in bedienerontdekking gelys te word.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Vereis minstens $count lede om aansoek te doen.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Aansoek';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Status';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorie';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beskrywing';

  @override
  String get guildSettingsDiscoveryTags => 'Etikette';

  @override
  String get guildSettingsDiscoveryTagsHint => 'speletjies, kuns, musiek';

  @override
  String get guildSettingsDiscoveryApply => 'Dien aansoek in';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Terugtrek';

  @override
  String get guildSettingsMembersDescription => 'Soek en bestuur bedienerlede.';

  @override
  String get guildSettingsMembersSearchHint => 'Soek lede';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count lede';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Bekyk en herroep aktiewe uitnodigingskakels.';

  @override
  String get guildSettingsInvitesEmpty => 'Geen aktiewe uitnodigings nie.';

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
    return '$uses / $maxUses gebruike';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Verval $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Bekyk en bestuur verbode gebruikers.';

  @override
  String get guildSettingsBansSearchHint => 'Soek verbode gebruikers';

  @override
  String get guildSettingsBansEmpty => 'Geen verbode gebruikers nie.';

  @override
  String get guildSettingsBanPermanent => 'Permanente verbanning';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Verval $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Verval';

  @override
  String get guildSettingsUnban => 'Hef verbanning op';

  @override
  String get guildSettingsBansLoading => 'Laai verbode gebruikers';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Geen verbode gebruikers gevind wat ooreenstem met jou soektog nie.';

  @override
  String get guildSettingsBanDetailsTitle => 'Verbanningsbesonderhede';

  @override
  String get guildSettingsBanViewDetails => 'Bekyk besonderhede';

  @override
  String get guildSettingsBannedOn => 'Verban op';

  @override
  String get guildSettingsBannedBy => 'Verban deur';

  @override
  String get guildSettingsRevokeBanTitle => 'Herroep verbanning';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Is jy seker jy wil die verbanning vir $displayName herroep? Hulle sal weer by die gemeenskap kan aansluit.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Verbanning vir $displayName herroep';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Kon nie verbode gebruikers laai nie. Probeer weer.';

  @override
  String get guildSettingsRevokeBanError =>
      'Kon nie verbanning herroep nie. Probeer weer.';

  @override
  String get guildSettingsCommunitySettings => 'Gemeenskapsinstellings';

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
      'Bestuur jou gemeenskap se profiel, kanale en verstekinstellings.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Handelsmerk';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Werk jou ikoon, naam, banier en uitnodigingsagtergrond op';

  @override
  String get guildSettingsOverviewBannerUpload => 'Laai banier op';

  @override
  String get guildSettingsOverviewIdleTitle => 'Afslapingsinstellings';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Stel AFK-kanaal en tydsduur in';

  @override
  String get guildSettingsOverviewSystemTitle => 'Stelsel & welkom';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Kies bestemming vir stelsel- en welkomsboodskappe';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Standaardkennisgewings';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Gemeenskappe met meer as 250 lede word gedwing na die \"slegs vermelding\"-instelling. Jou oorspronklike instelling word bewaar en sal herstel word indien die gemeenskap onder 250 lede daal.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Gevorderd';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Laat buigsame tekskanaalname toe';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Versteek gemeenskapseienaarkroon';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Losgemaakte banier';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Wys die banier in sy eie afdeling onder die gemeenskapsopskrif.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Laai ikoon op';

  @override
  String get guildSettingsOverviewRemoveImage => 'Verwyder';

  @override
  String get guildSettingsOverviewSplashTitle => 'Uitnodigingsagtergrond';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Klets-embed-agtergrond';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Wys in uitnodigings-embeds in klets.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Laai agtergrond op';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Geen gemeenskapsbanier nie';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Geen uitnodigingsagtergrond nie';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Voorskou';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Sien hoe jou uitnodiging vir besoekers lyk.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Teks kanaalname';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Gemeenskapseienaarkroon';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Stel in of die kroonikoon langs die gemeenskapseienaar gewys word';

  @override
  String get guildSettingsSplashCardAlignment => 'Kaartbelyning';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Middel';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Links';

  @override
  String get guildSettingsSplashAlignmentRight => 'Regs';

  @override
  String get guildSettingsSplashAlignmentHint => 'Geld slegs op wye skerms.';

  @override
  String get permissionReadMessageHistory => 'Lees boodskapgeskiedenis';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Verander wat gebruikers sonder \"$permission\" kan sien';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Gebruik \'n toegewyde modale venster om \'n boodskapgeskiedenis drempeldatum in te stel vir lede wat nie die $permission toestemming het nie.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Open boodskapgeskiedenis drempel';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Boodskapgeskiedenis drempel';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Aktiveer boodskapgeskiedenis drempel';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Drempeldatum';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Lede sonder Lees Boodskapgeskiedenis kan boodskappe sien wat na hierdie datum gestuur is.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Boodskapgeskiedenis drempel opgedateer';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Laat hoofletters en spasies toe in tekskanaalname. Af beperk name tot kleinletters met koppeltekens en onderstreepteken.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Versteek die kroon-ikoon langs die gemeenskaps-eienaar oor alle oppervlakke.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Geanimeerde ikone vereis die Geanimeerde Ikoon gemeenskapsfunksie.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Geanimeerde baniere vereis die Geanimeerde Banier gemeenskapsfunksie.';

  @override
  String get guildSettingsAfkChannel => 'AFK / ledige kanaal';

  @override
  String get guildSettingsAfkChannelHint =>
      'Skuif lede na hierdie kanaal wanneer hulle AFK is.';

  @override
  String get guildSettingsNoAfkChannel => 'Geen AFK-kanaal nie';

  @override
  String get guildSettingsAfkTimeout => 'AFK-tydperk';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minuut';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minute';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minute';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minute';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 uur';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekondes';
  }

  @override
  String get guildSettingsSystemChannel => 'Gaan kanaal toe';

  @override
  String get guildSettingsSystemChannelHint =>
      'Welkom- en stelselboodskappe sal hier verskyn.';

  @override
  String get guildSettingsNoSystemChannel => 'Geen stelselkanaal nie';

  @override
  String get guildSettingsHideJoinMessages => 'Versteek aansluitboodskappe';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Onderdruk aansluitboodskappe in die bestemmingskanaal.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Verstek kennisgewinginstellings';

  @override
  String get guildSettingsNotificationsAll => 'Alle boodskappe';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Stel kennis van alle boodskappe';

  @override
  String get guildSettingsNotificationsMentions => 'Slegs noemings';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Stel kennis slegs van noemings';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks 10MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks 10MB. Minimum: 960×540px (16:9). Word vertoon in uitnodigings-embeds in klets.';

  @override
  String get guildSettingsModerationDescription =>
      'Stel verifikasie-, inhoudfiltrering- en volwasse inhoudinstellings op.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Gemeenskappe wat in Ontdekking gelys is, het beperkte modereringsopsies.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Inhoudfiltrering';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Sif boodskappe outomaties vir eksplisiete inhoud in kanale wat nie vir volwasse inhoud gemerk is nie.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Gemeenskappe wat in Ontdekking gelys is, moet alle lede skandeer. Hierdie instelling kan nie verander word terwyl Ontdekking geaktiveer is nie.';

  @override
  String get guildSettingsContentFilterOff => 'Af';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Laat die gemeenskap self-modereer';

  @override
  String get guildSettingsContentFilterNoRole => 'Filter lede sonder rolle';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Voorgestel vir die meeste gemeenskappe';

  @override
  String get guildSettingsContentFilterAll => 'Filter almal';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maksimum beskerming vir gesinsvriendelike ruimtes';

  @override
  String get guildSettingsModerationMatureOff => 'Af';

  @override
  String get guildSettingsModerationMatureOn => 'Aan';

  @override
  String get guildSettingsContentWarningToggle => 'Wys \'n inhoudwaarskuwing';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Skakel \'n toestemmingsprompt voordat enige kanaal betree word.';

  @override
  String get guildSettingsContentWarningText => 'Pasgemaakte waarskuwingsteks';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Dit bevat sensitiewe inhoud.';

  @override
  String get guildSettingsModeration2faTitle => '2FA-vereiste';

  @override
  String get guildSettingsModeration2faDescription =>
      'Vereis tweefaktor-verifikasie vir moderators voordat hulle boodskappe kan verbied, uitgooi, tydelik opskort of verwyder.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Vereis 2FA vir modereringsaksies';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Slegs die gemeenskapseienaar kan hierdie instelling verander';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Aktiveer 2FA op jou rekening om hierdie instelling te verander';

  @override
  String get guildSettingsEmojiSearchHint => 'Soek emoji\'s';

  @override
  String get guildSettingsEmojiUploadTitle => 'Laai Emoji op';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Nie-geanimeerde emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Geanimeerde emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Soek plakkers';

  @override
  String get guildSettingsWebhooksInfo =>
      'Skep webhooks vanaf Kanaalinstellings. Wysig dit hier.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Jou persoonlike URL sal nie werk nie, tensy ten minste een kanaal vir almal sigbaar is.';

  @override
  String get guildSettingsVanityUrlRemove => 'Verwyder';

  @override
  String get guildSettingsBannedUsersTitle => 'Banned gebruikers';

  @override
  String get guildSettingsInvitesTableInviter => 'Uitnodiger';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanaal';

  @override
  String get guildSettingsInvitesTableCode => 'Kode';

  @override
  String get guildSettingsInvitesTableUses => 'Gebruike';

  @override
  String get guildSettingsInvitesTableCreated => 'Geskep';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Nuutste eerste';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filter volgens gebruiker';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filter volgens aksie';

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
