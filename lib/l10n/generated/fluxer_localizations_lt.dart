// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class FluxerLocalizationsLt extends FluxerLocalizations {
  FluxerLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get reconnectingTitle => 'Pataisysime!';

  @override
  String get reconnectingBody =>
      'Kažkas negerai su serveriais.\nNetrukus turėtų pasitaisyti!';

  @override
  String get gatewayReconnectingToast => 'Jungiama iš naujo…';

  @override
  String get gatewayConnectedToast => 'Prijungta';

  @override
  String get sessionExpiredToast =>
      'Sesijos laikas pasibaigė. Prašome prisijungti iš naujo.';

  @override
  String splashStartupFailed(String error) {
    return 'Nepavyko paleisti: $error';
  }

  @override
  String get retry => 'Bandykite dar kartą';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Ryšys prarastas';

  @override
  String get splashViewOnStatusPage => 'Peržiūrėti būsenos puslapyje';

  @override
  String get splashConnectionIssuesPrompt => 'Ryšio problemų?';

  @override
  String get splashStatusPageLink => 'Būsenos puslapis';

  @override
  String get splashReadIncident => 'Skaityti apie incidentą';

  @override
  String get splashIncidentHistory => 'Incidentų istorija';

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
  String get welcomeBack => 'Sveiki grįžę';

  @override
  String get email => 'El. paštas';

  @override
  String get emailInvalid => 'Įveskite tinkamą el. pašto adresą.';

  @override
  String get password => 'Slaptažodis';

  @override
  String get forgotPassword => 'Pamiršote slaptažodį?';

  @override
  String get logIn => 'Prisijungti';

  @override
  String get logInWithPasskey => 'Prisijungti naudojant slaptažidinį';

  @override
  String continueWithSso(String provider) {
    return 'Tęsti su $provider';
  }

  @override
  String get ssoRequired => 'Norint pasiekti šią instanciją, būtinas SSO.';

  @override
  String get organizationSsoProvider =>
      'Prisijunkite naudodami savo organizacijos vieno prisijungimo paslaugų teikėją.';

  @override
  String get failedToStartSso => 'Nepavyko pradėti SSO';

  @override
  String get ssoCancelled => 'SSO prisijungimas buvo atšauktas';

  @override
  String preferSso(String provider) {
    return 'Pageidaujate naudoti SSO? Tęskite su $provider.';
  }

  @override
  String get logInViaBrowser => 'Prisijungti per naršyklę';

  @override
  String get needAccountPrompt => 'Reikia paskyros? ';

  @override
  String get register => 'Registruotis';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Patvirtinkite, kad esate žmogus';

  @override
  String get captchaDescription =>
      'Turime įsitikinti, kad nesate robotas. Prašome užpildyti žemiau esantį patvirtinimą.';

  @override
  String get captchaSwitchToHcaptcha => 'Turite problemų? Pabandykite hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Pabandykite Turnstile';

  @override
  String get cancel => 'Atšaukti';

  @override
  String get ipAuthCheckEmail => 'Patikrinkite savo el. paštą';

  @override
  String ipAuthDescription(String email) {
    return 'Atsiųsime el. laišką šiam prisijungimui autorizuoti. Prašome atidaryti savo pašto dėžutę adresu $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Ryšys prarastas';

  @override
  String get ipAuthConnectionLostDescription =>
      'Praradome ryšį laukdami autorizacijos. Prašome bandyti dar kartą.';

  @override
  String get ipAuthLinkExpired => 'Prisijungimo nuoroda baigėsi';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Ši autorizacijos nuoroda baigėsi. Prašome prisijungti dar kartą.';

  @override
  String get ipAuthResendEmail => 'Siųsti el. laišką iš naujo';

  @override
  String get ipAuthResent => 'Nusiųsta iš naujo';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Atgal';

  @override
  String get mfaTitle => 'Dviejų veiksnių autentifikavimas';

  @override
  String get mfaChooseMethod => 'Pasirinkite patvirtinimo metodą';

  @override
  String get mfaMethodTotp => 'Autentifikavimo programėlė';

  @override
  String get mfaMethodWebauthn => 'Saugos raktas / Slaptažidinis';

  @override
  String get mfaTotpDescription =>
      'Įveskite 6 skaitmenų kodą iš savo autentifikavimo programėlės arba vieną iš atsarginių kodų.';

  @override
  String get mfaCodeLabel => 'Kodas';

  @override
  String get mfaTryAnotherMethod => 'Pabandykite kitą metodą';

  @override
  String get mfaUseSecurityKey =>
      'Pabandykite naudoti saugos raktą / slaptažodį';

  @override
  String get accountSelectorTitle => 'Pasirinkite paskyrą';

  @override
  String get accountSelectorDescription =>
      'Pasirinkite paskyrą, kad tęstumėte, arba pridėkite kitą.';

  @override
  String get accountAdd => 'Pridėti paskyrą';

  @override
  String get accountRemove => 'Pašalinti';

  @override
  String accountRemoveTitle(String username) {
    return 'Pašalinti $username';
  }

  @override
  String get accountRemoveDescription =>
      'Tai pašalins išsaugotą šios paskyros seansą.';

  @override
  String get accountRemoveOnlyDescription =>
      'Tai pašalins vienintelę šioje įrenginyje išsaugotą paskyrą.';

  @override
  String get accountExpired => 'Baigėsi galiojimas';

  @override
  String accountSessionExpired(String identifier) {
    return 'Baigėsi $identifier seanso galiojimas. Prašome prisijungti iš naujo.';
  }

  @override
  String get accountManageTitle => 'Tvarkyti paskyras';

  @override
  String get accountSwitchFailed =>
      'Nepavyko perjungti paskyrų. Pabandykite dar kartą.';

  @override
  String get profileTabMenuSwitchAccounts => 'Perjungti paskyras';

  @override
  String get statusChangeSheetTitle => 'Nustatyti būseną';

  @override
  String get statusOnlineStatusSection => 'Prisijungimo būsena';

  @override
  String get statusOnline => 'Prisijungęs';

  @override
  String get statusIdle => 'Neaktyvus';

  @override
  String get statusDnd => 'Netrukdyti';

  @override
  String get statusInvisible => 'Nematomas';

  @override
  String get statusOffline => 'Atsijungęs';

  @override
  String get statusUntilIChangeIt => 'Kol nepakeisiu';

  @override
  String get statusDontClear => 'Neištrinti';

  @override
  String get statusFor10Seconds => '10 sekundžių';

  @override
  String get statusClearAfter10Seconds => '10 sekundžių';

  @override
  String get statusClearAfter15Minutes => '15 minučių';

  @override
  String get statusClearAfter30Minutes => '30 minučių';

  @override
  String get statusClearAfter1Hour => '1 valanda';

  @override
  String get statusClearAfter3Hours => '3 valandos';

  @override
  String get statusClearAfter4Hours => '4 valandos';

  @override
  String get statusClearAfter8Hours => '8 valandos';

  @override
  String get statusClearAfter24Hours => '24 valandos';

  @override
  String get statusClearAfter3Days => '3 dienos';

  @override
  String get statusDndDescription => 'Negausite pranešimų darbalaukyje';

  @override
  String get statusInvisibleDescription => 'Atrodysite neprisijungę';

  @override
  String get customStatusSetTitle => 'Nustatyti pasirinktinę būseną';

  @override
  String get customStatusCurrentHint => 'Pasirinktinė būsena';

  @override
  String get customStatusClear => 'Ištrinti pasirinktinę būseną';

  @override
  String get customStatusPlaceholder => 'Kas vyksta?';

  @override
  String get customStatusChooseEmoji => 'Pasirinkite jaustuką';

  @override
  String get customStatusClearAfter => 'Ištrinti po';

  @override
  String get customStatusSave => 'Išsaugoti';

  @override
  String get accountActive => 'Aktyvi paskyra';

  @override
  String get signOut => 'Atsijungti';

  @override
  String get suspendedPermanentTitle => 'Paskyra visam laikui sustabdyta';

  @override
  String get suspendedTemporaryTitle => 'Paskyra sustabdyta';

  @override
  String get suspendedPermanentDescription =>
      'Jūsų paskyra buvo visam laikui sustabdyta dėl mūsų paslaugų teikimo sąlygų pažeidimo.';

  @override
  String get suspendedTemporaryDescription =>
      'Jūsų paskyra buvo laikinai sustabdyta. Galėsite pasiekti savo paskyrą pasibaigus sustabdymo laikotarpiui.';

  @override
  String get suspendedIssuedAt => 'Išduota';

  @override
  String get suspendedEndsAt => 'Baigiasi';

  @override
  String get suspendedDuration => 'Trukmė';

  @override
  String get suspendedPermanent => 'Nuolatinis';

  @override
  String get suspendedReason => 'Priežastis';

  @override
  String get suspendedAppealDeadline => 'Apeliacijos terminas';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Jūsų paskyra numatyta ištrinti $date d.';
  }

  @override
  String get suspendedRecheck => 'Patikrinti, ar yra naujinių';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Patikrinti dar po ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Atgal į prisijungimą';

  @override
  String get suspendedAppealTitle => 'Apeliacija';

  @override
  String get suspendedAppealHint =>
      'Paaiškinkite, kodėl jūsų suspendavimas turėtų būti persvarstytas (mažiausiai 50 simbolių)...';

  @override
  String get suspendedAppealSubmit => 'Pateikti apeliaciją';

  @override
  String get suspendedAppealPending => 'Laukiama peržiūros';

  @override
  String get suspendedAppealAccepted => 'Apeliacija priimta';

  @override
  String get suspendedAppealRejected => 'Apeliacija atmesta';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Jūsų apeliacija buvo priimta ir jūsų paskyra atkurta.';

  @override
  String get suspendedSignIn => 'Prisijunkite prie savo paskyros';

  @override
  String get forgotPasswordTitle => 'Pamiršote slaptažodį?';

  @override
  String get forgotPasswordDescription =>
      'Įveskite savo el. pašto adresą ir mes atsiųsime nuorodą slaptažodžiui atkurti.';

  @override
  String get forgotPasswordSubmit => 'Siųsti atkūrimo nuorodą';

  @override
  String get forgotPasswordSentTitle => 'Patikrinkite savo el. paštą';

  @override
  String get forgotPasswordSentDescription =>
      'Atsiųsime slaptažodžio atkūrimo instrukcijas jūsų el. pašto adresu. Patikrinkite gautuosius ir sekite nuorodą, kad atkurtumėte slaptažodį.';

  @override
  String get forgotPasswordBackToLogin => 'Grįžti į prisijungimą';

  @override
  String get resetPasswordTitle => 'Nustatyti naują slaptažodį';

  @override
  String get resetPasswordDescription =>
      'Įveskite savo naują slaptažodį žemiau, kad užbaigtumėte atkūrimo procesą.';

  @override
  String get resetPasswordNewPassword => 'Naujas slaptažodis';

  @override
  String get resetPasswordConfirm => 'Patvirtinkite naują slaptažodį';

  @override
  String get resetPasswordSubmit => 'Atkurti slaptažodį';

  @override
  String get resetPasswordMismatch => 'Slaptažodžiai nesutampa.';

  @override
  String get registerTitle => 'Sukurti paskyrą';

  @override
  String get registerDisplayName => 'Vardas (Pasirenkama)';

  @override
  String get registerDisplayNameHint => 'Kaip žmonės turėtų jus vadinti?';

  @override
  String get registerUsername => 'Vartotojo vardas (Pasirenkama)';

  @override
  String get registerUsernameHint =>
      'Palikite tuščią, kad gautumėte atsitiktinį vartotojo vardą';

  @override
  String get registerUsernameTagHint =>
      'Bus automatiškai pridėtas 4 skaitmenų žyma, kad būtų užtikrintas unikalumas';

  @override
  String get registerDateOfBirth => 'Gimimo data';

  @override
  String get registerMonth => 'Mėnuo';

  @override
  String get registerDay => 'Diena';

  @override
  String get registerYear => 'Metai';

  @override
  String get registerConsent =>
      'Sutinku su Paslaugų teikimo sąlygomis ir Privatumo politika';

  @override
  String get registerConsentPrefix => 'Sutinku su ';

  @override
  String get registerConsentTerms => 'Paslaugų teikimo sąlygomis';

  @override
  String get registerConsentAnd => ' ir ';

  @override
  String get registerConsentPrivacy => 'Privatumo politika';

  @override
  String get registerConfirmPassword => 'Patvirtinkite slaptažodį';

  @override
  String get registerSubmit => 'Sukurti paskyrą';

  @override
  String get registerHaveAccount => 'Jau turite paskyrą? ';

  @override
  String get passkeyNoCredentials =>
      'Nerasta jokių „passkey“ šiai programai. Vietoj to prisijunkite el. paštu ir slaptažodžiu.';

  @override
  String get passkeyDeviceNotSupported => 'Šis įrenginys nepalaiko „passkey“.';

  @override
  String get passkeyDomainNotAssociated =>
      '„Passkey“ nėra sukonfigūruoti šiai programai. Vietoj to prisijunkite el. paštu ir slaptažodžiu.';

  @override
  String get passkeyTimeout =>
      '„Passkey“ autentifikavimas baigėsi. Prašome bandyti dar kartą.';

  @override
  String get passkeyNotAvailable =>
      '„Passkey“ šiai programai neprieinami. Vietoj to prisijunkite el. paštu ir slaptažodžiu.';

  @override
  String get passkeyFailed =>
      'Nepavyko autentifikuoti naudojant slaptafaktą. Pabandykite dar kartą.';

  @override
  String get errorUnableToCreateAccount =>
      'Nepavyksta sukurti paskyros. Pabandykite dar kartą.';

  @override
  String get errorUnableToSignIn =>
      'Šiuo metu nepavyksta prisijungti. Pabandykite dar kartą.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Neteisingas el. paštas arba slaptažodis.';

  @override
  String get errorUnableToSendResetLink =>
      'Nepavyksta išsiųsti atstatymo nuorodos. Pabandykite dar kartą.';

  @override
  String get errorUnableToResetPassword =>
      'Nepavyksta atstatyti slaptažodžio. Pabandykite dar kartą.';

  @override
  String get embedInviteJoin => 'Prisijungti prie bendruomenės';

  @override
  String get embedInviteGoTo => 'Eiti į bendruomenę';

  @override
  String embedInviteOnline(String count) {
    return '$count prisijungę';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count narių';
  }

  @override
  String get embedInviteUnknownTitle => 'Nežinomas kvietimas';

  @override
  String get embedInviteUnknownSubtitle =>
      'Pabandykite paprašyti naujo kvietimo.';

  @override
  String get embedInviteUnavailable => 'Kvietimas negalimas';

  @override
  String get inviteAcceptTitle => 'Jūs buvote pakviestas prisijungti';

  @override
  String get inviteAcceptJoinButton => 'Prisijungti prie bendruomenės';

  @override
  String get inviteAcceptGoToButton => 'Eiti į bendruomenę';

  @override
  String get inviteAcceptInvitesPaused => 'Kvietimai pristabdyti';

  @override
  String get inviteAcceptNotFoundTitle => 'Kvietimas negalioja';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Šis kvietimas gali būti pasibaigęs arba negaliojantis.';

  @override
  String get invalidDeepLinkTitle => 'Nepavyko atidaryti nuorodos';

  @override
  String get invalidDeepLinkDescription =>
      'Ši nuoroda gali būti neveikianti, prieinama tik naršyklėje arba jūs galite neturėti prieigos prie jos. Patikrinkite nuorodą ir bandykite dar kartą.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Pagrindinis';

  @override
  String get inviteAcceptJoinGroupButton => 'Prisijungti prie grupės';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Jūs buvote pakviestas prisijungti prie grupės DM per $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'kažkas';

  @override
  String get inviteAcceptEmojiPack => 'Emocijų rinkinys';

  @override
  String get inviteAcceptStickerPack => 'Lipdukų rinkinys';

  @override
  String get inviteAcceptInstallEmojiPack => 'Įdiegti emocijų rinkinį';

  @override
  String get inviteAcceptInstallStickerPack => 'Įdiegti lipdukų rinkinį';

  @override
  String get inviteAcceptPackInstallNote =>
      'Priėmus šį kvietimą rinkinys bus įdiegtas automatiškai.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Prieiga prie kanalo atmesta';

  @override
  String get channelAccessDeniedDescription =>
      'Jūs neturite prieigos prie kanalo, kuriame buvo išsiųsta ši žinutė.';

  @override
  String get messageJumpLinkNoAccess => 'Nėra prieigos';

  @override
  String get okay => 'Gerai';

  @override
  String get embedThemeTitle => 'Bendrinama tema';

  @override
  String get embedThemeSubtitle => 'Šis klientas nepalaiko pasirinktinių temų.';

  @override
  String get embedThemeUnavailableButton => 'Temos neprieinamos';

  @override
  String get privacySettings => 'Privatumo nustatymai';

  @override
  String get privacyDirectMessages => 'Tiesioginės žinutės';

  @override
  String get privacyDirectMessagesDescription =>
      'Leisti tiesiogines žinutes iš kitų šios bendruomenės narių';

  @override
  String get privacyBotDirectMessages => 'Tiesioginės žinutės iš botų';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Leisti botams iš šios bendruomenės siųsti jums tiesiogines žinutes';

  @override
  String get privacyMutualDmsDisabled =>
      'Bendruomenės administratoriai išjungė tiesioginių žinučių gavimą tik iš abipusių narių šioje bendruomenėje.';

  @override
  String get communityDebug => 'Bendruomenės derinimas';

  @override
  String get copiedToClipboard => 'Nukopijuota į iškarpinę';

  @override
  String get notificationSettings => 'Pranešimų nustatymai';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Nutildyti $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Bendruomenės nutildymas neleidžia rodyti neskaitytų indikatorių ir pranešimų, nebent esate paminėtas';

  @override
  String get notificationCommunitySettings =>
      'Bendruomenės pranešimų nustatymai';

  @override
  String get notificationAllMessages => 'Visos žinutės';

  @override
  String get notificationOnlyMentions => 'Tik paminėjimai';

  @override
  String get notificationNothing => 'Nieko';

  @override
  String get notificationSuppressEveryone =>
      'Slėpti @everyone ir @here paminėjimus';

  @override
  String get notificationSuppressRoles =>
      'Slopinti visus vaidmenų @paminėjimus';

  @override
  String get notificationMobilePush => 'Mobilieji tiesioginiai pranešimai';

  @override
  String get notificationOverrides => 'Pranešimų pakeitimai';

  @override
  String get notificationSelectChannel => 'Pasirinkite kanalą arba kategoriją';

  @override
  String get notificationOnlyAtMentions => 'Tik @paminėjimai';

  @override
  String get notificationMuteChannel => 'Nutildyti kanalą';

  @override
  String get notificationUnmuteChannel => 'Atšaukti kanalo nutildymą';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Nėra kategorijos';

  @override
  String get dmMarkAsRead => 'Pažymėti kaip perskaityta';

  @override
  String get dmMuteConversation => 'Nutildyti DM';

  @override
  String get dmUnmuteConversation => 'Atšaukti DM nutildymą';

  @override
  String get dmPinDm => 'Smeigti DM';

  @override
  String get dmUnpinDm => 'Atsegti DM';

  @override
  String get dmAlwaysShowInSidebar => 'Visada rodyti šoninėje juostoje';

  @override
  String get dmRemoveFromAlwaysShown => 'Pašalinti iš visada rodomų';

  @override
  String get dmCloseDm => 'Uždaryti DM';

  @override
  String get dmCloseDmConfirmTitle => 'Uždaryti DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Ar tikrai norite uždaryti savo DM su $username? Visada galėsite jį atidaryti vėliau.';
  }

  @override
  String get dmCopyChannelId => 'Kopijuoti kanalo ID';

  @override
  String get dmChannelIdCopied => 'Kanalo ID nukopijuotas';

  @override
  String get dmCopyUserId => 'Kopijuoti naudotojo ID';

  @override
  String get dmUserIdCopied => 'Naudotojo ID nukopijuotas';

  @override
  String get dmViewProfile => 'Peržiūrėti profilį';

  @override
  String get dmVoiceCall => 'Pradėti balso skambutį';

  @override
  String get incomingVoiceCallTitle => 'Gaunamas balso skambutis';

  @override
  String get incomingVoiceCallAccept => 'Priimti';

  @override
  String get incomingVoiceCallDecline => 'Atmesti';

  @override
  String get incomingVoiceCallLabel => 'Gaunamas skambutis';

  @override
  String get incomingVoiceCallIgnore => 'Ignoruoti';

  @override
  String get directVoiceCallNotEligible =>
      'Šio skambučio šiuo metu negalima pradėti. Pabandykite dar kartą po akimirkos.';

  @override
  String get voiceJoinCallFailed =>
      'Nepavyko prisijungti prie šio skambučio. Patikrinkite ryšį ir bandykite dar kartą.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Nepavyko prisijungti prie šio skambučio. Patikrinkite ryšį ir bandykite dar kartą.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Nepavyko atnaujinti šio skambučio serveryje. Patikrinkite ryšį ir bandykite dar kartą.';

  @override
  String get dmAddNote => 'Pridėti pastabą';

  @override
  String get dmEditGroup => 'Redaguoti grupę';

  @override
  String get dmInviteToCommunity => 'Pakviesti į bendruomenę';

  @override
  String get dmBlock => 'Blokuoti';

  @override
  String get dmLeaveGroup => 'Palikti grupę';

  @override
  String get dmNoCommunitiesAvailable => 'Nėra bendruomenių';

  @override
  String dmGroupMemberCount(int count) {
    return '$count nariai';
  }

  @override
  String get dmMuteFor15Min => '15 minučių';

  @override
  String get dmMuteFor30Min => '30 minučių';

  @override
  String get dmMuteFor1Hour => '1 valandą';

  @override
  String get dmMuteFor3Hours => '3 valandas';

  @override
  String get dmMuteFor4Hours => '4 valandas';

  @override
  String get dmMuteFor8Hours => '8 valandas';

  @override
  String get dmMuteFor24Hours => '24 valandas';

  @override
  String get dmMuteFor3Days => '3 dienas';

  @override
  String get dmMuteForever => 'Kol vėl įjungsiu';

  @override
  String get dmPinGroupDm => 'Smeigti grupės DM';

  @override
  String get dmUnpinGroupDm => 'Atsegti grupės DM';

  @override
  String get dmUnnamedGroup => 'Nepavadinta grupė';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName grupė';
  }

  @override
  String get dmFavoriteDm => 'Pažymėti DM';

  @override
  String get dmUnfavoriteDm => 'Atžymėti DM';

  @override
  String get dmFavoriteGroupDm => 'Pažymėti grupės DM';

  @override
  String get dmUnfavoriteGroupDm => 'Atžymėti grupės DM';

  @override
  String get dmChangeFriendNickname => 'Pakeisti draugo slapyvardį';

  @override
  String get dmRemoveFriend => 'Pašalinti draugą';

  @override
  String get dmAddFriend => 'Pridėti draugą';

  @override
  String get dmAcceptFriendRequest => 'Priimti draugo užklausą';

  @override
  String get dmIgnoreFriendRequest => 'Ignoruoti draugo užklausą';

  @override
  String get dmFriendRequestSent => 'Draugo užklausa išsiųsta';

  @override
  String get dmUnblock => 'Atblokuoti';

  @override
  String get dmDebugUser => 'Derinti vartotoją';

  @override
  String get dmDebugChannel => 'Derinti kanalą';

  @override
  String get dmDebugCategory => 'Derinimo kategorija';

  @override
  String get dmPinned => 'Prisegtas DM';

  @override
  String get dmUnpinned => 'Atsegti DM';

  @override
  String get dmMuted => 'Nutildytas DM';

  @override
  String get dmUnmuted => 'Nutilimas DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Pašalinti draugą';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Ar tikrai norite pašalinti $username kaip draugą?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blokuoti vartotoją';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Ar tikrai norite blokuoti $username? Jis negalės jums rašyti žinučių ar siųsti draugystės užklausų.';
  }

  @override
  String get dmFriendRequestSentToast => 'Draugo užklausa išsiųsta';

  @override
  String get dmFriendRequestFailed => 'Nepavyko išsiųsti draugo užklausos';

  @override
  String get dmAcceptFriendRequestFailed => 'Nepavyko priimti draugo užklausos';

  @override
  String get dmRemoveFriendFailed => 'Nepavyko pašalinti draugo';

  @override
  String get dmBlockFailed => 'Nepavyko blokuoti vartotojo';

  @override
  String get dmUnblockFailed => 'Nepavyko atblokuoti vartotojo';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Nepavyko ignoruoti draugo užklausos';

  @override
  String get dmAddFriends => 'Pridėti draugų';

  @override
  String get addFriendSheetTitle => 'Pridėti draugą';

  @override
  String get addFriendUsernameHint => 'Vartotojo vardas#0000';

  @override
  String get addFriendUsernameLabel => 'Draugo vartotojo vardas';

  @override
  String get addFriendSendRequest => 'Siųsti užklausą';

  @override
  String get addFriendNoUserFound => 'Toks vartotojo vardas nerastas.';

  @override
  String get addFriendInvalidUsername =>
      'Įveskite galiojantį vartotojo vardą (Vartotojo vardas#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Draugo užklausa išsiųsta';

  @override
  String get addFriendClaimTitle => 'Patvirtinkite savo paskyrą';

  @override
  String get addFriendClaimDescription =>
      'Patvirtinkite savo paskyrą, kad galėtumėte siųsti draugystės užklausas.';

  @override
  String get addFriendVerifyTitle => 'Patvirtinkite savo el. paštą';

  @override
  String get addFriendVerifyDescription =>
      'Turite patvirtinti savo el. pašto adresą, kad galėtumėte siųsti draugystės užklausas.';

  @override
  String get addFriendVerifyEmail => 'Patvirtinti el. paštą';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Gaunamos draugystės užklausos ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Išsiųstos draugystės užklausos ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Gaunama draugystės užklausa';

  @override
  String get addFriendOutgoingStatus => 'Draugo užklausa išsiųsta';

  @override
  String get addFriendViewProfile => 'Peržiūrėti profilį';

  @override
  String get addFriendAccept => 'Priimti';

  @override
  String get addFriendIgnore => 'Ignoruoti';

  @override
  String get addFriendAcceptTitle => 'Priimti draugo užklausą';

  @override
  String get addFriendIgnoreTitle => 'Ignoruoti draugystės prašymą';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Priimti $userName draugystės prašymą?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignoruoti $displayName draugystės prašymą?';
  }

  @override
  String get addFriendCancelRequest => 'Atšaukti prašymą';

  @override
  String get addFriendCancelRequestFailed =>
      'Nepavyko atšaukti draugystės prašymo. Pabandykite dar kartą.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Šiuo metu jie nepriima draugystės prašymų.';

  @override
  String get addFriendUnblockFirst =>
      'Pirmiausia atblokuokite juos, kad galėtumėte išsiųsti draugystės prašymą.';

  @override
  String get addFriendCannotSendToSelf =>
      'Negalite siųsti draugystės prašymo patys sau.';

  @override
  String get addFriendAlreadyFriends =>
      'Jūs jau esate draugai su šiuo vartotoju.';

  @override
  String get addFriendClaimToSend =>
      'Užbaikite registraciją, kad galėtumėte siųsti draugystės prašymus.';

  @override
  String get addFriendSendFailedGeneric =>
      'Nepavyko išsiųsti draugystės prašymo. Pabandykite dar kartą.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistema';

  @override
  String get emojiSearchPlaceholder => 'Raskite savo svajonių jaustuką';

  @override
  String get emojiSearchEmpty => 'Nėra jaustukų, atitinkančių jūsų paiešką';

  @override
  String get emojiAutocompleteDefaultLabel => 'Numatytasis jaustukas';

  @override
  String get emojiFrequentlyUsed => 'Dažnai naudojami';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'Medija';

  @override
  String get emojiTabStickers => 'Lipdukai';

  @override
  String get emojiTabEmojis => 'Jaustukai';

  @override
  String get gifPickerSearch => 'Ieškoti GIF';

  @override
  String get gifPickerSearchKlipy => 'Ieškoti KLIPY';

  @override
  String get gifPickerSearchTenor => 'Ieškoti Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Mėgstamiausi';

  @override
  String get gifPickerTrending => 'Populiarūs GIF';

  @override
  String get gifPickerNoResultsTitle => 'Nėra paieškos rezultatų';

  @override
  String get gifPickerNoResultsDescription =>
      'Pabandykite kitą paieškos terminą';

  @override
  String get gifPickerLoadFailedTitle => 'Nepavyko įkelti GIF';

  @override
  String get gifPickerLoadFailedBody =>
      'Patikrinkite savo ryšį ir pabandykite dar kartą.';

  @override
  String get emojiCategoryPeople => 'Žmonės';

  @override
  String get emojiCategoryNature => 'Gamta';

  @override
  String get emojiCategoryFood => 'Maistas ir gėrimai';

  @override
  String get emojiCategoryActivity => 'Veikla';

  @override
  String get emojiCategoryTravel => 'Kelionės ir vietos';

  @override
  String get emojiCategoryObjects => 'Objektai';

  @override
  String get emojiCategorySymbols => 'Simboliai';

  @override
  String get emojiCategoryFlags => 'Vėliavos';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Atrakinkite $emojiCount iš $communityCount su Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Gauti Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Daugiau nerodyti';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pasirinktiniai jaustukai',
      one: '1 pasirinktinis jaustukas',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bendruomenės',
      one: '1 bendruomenė',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Įspėjimas apie išorinį saitą';

  @override
  String get externalLinkWarningLeaving => 'Jūs ketinate išeiti iš Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Išoriniai saitai gali būti pavojingi. Būkite atsargūs.';

  @override
  String get externalLinkWarningDestinationUrl => 'Paskirties URL:';

  @override
  String get externalLinksSectionTitle => 'Išoriniai saitai';

  @override
  String get externalLinksSectionDescription =>
      'Konfigūruokite, kaip elgtis su išorinių saitų įspėjimais.';

  @override
  String get externalLinkWarningTrustPrefix => 'Visada pasitikėti ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — kitą kartą praleisti šį įspėjimą';

  @override
  String get externalLinkVisitSite => 'Aplankyti svetainę';

  @override
  String get externalLinkTrustAllLabel =>
      'Pasitikėti visomis išorinėmis nuorodomis';

  @override
  String get externalLinkStripTrackingLabel =>
      'Pašalinti sekimo parametrus iš URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatiškai pašalinkite sekimo parametrus (pvz., utm_source, fbclid, gclid) iš nuorodų pranešimuose, kuriuos siunčiate. Nuoroda bus sutvarkyta prieš pasiekiant kitus.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Pasitikėti visomis išorinėmis nuorodomis?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Tai leis pasitikėti visomis išorinėmis nuorodomis ir praleisti įspėjimą apie kiekvieną domeną. Jūsų esami patikimi domenai bus pakeisti. Tai mažiau saugu.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Pasitikėti visomis';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Nustoti pasitikėti visomis nuorodomis?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Išorinių nuorodų įspėjimai vėl bus rodomi. Turėsite pridėti patikimus domenus individualiai.';

  @override
  String get externalLinkStopTrustingAllAction => 'Nustoti pasitikėti visomis';

  @override
  String get externalLinkTrustedAllDescription =>
      'Visomis išorinėmis nuorodomis pasitikima. Įspėjimai nebus rodomi.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Jūs turite $count patikimų domenų. Pridėkite daugiau pažymėdami langelį lankydamiesi išorinėse nuorodose.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Kai įjungta, nebus rodomi jokie išorinių nuorodų įspėjimai. Tai mažiau saugu.';

  @override
  String get imageFileTooLarge =>
      'Vaizdo failas yra per didelis. Pasirinkite failą, mažesnį nei 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animuoti avatarai reikalauja Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animuoti baneriai reikalauja Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animuoti AVIF nepalaikomi';

  @override
  String get animatedAvifNotSupportedBody =>
      'Animuotų AVIF failų karpymas ir sukimas dar nepalaikomas. Jei tęsite, jis bus įkeltas originalo forma.';

  @override
  String get uploadAsIs => 'Įkelti kaip yra';

  @override
  String get croppingAnimatedNotSupported =>
      'Animuotų vaizdų karpymas dar nepalaikomas. Bus naudojamas originalus įkeltas failas.';

  @override
  String get cropAvatar => 'Apkarpyti avatarą';

  @override
  String get cropBanner => 'Apkarpyti banerį';

  @override
  String get skip => 'Praleisti';

  @override
  String get crop => 'Apkarpyti';

  @override
  String get changeYourFluxerTag => 'Pakeisti jūsų FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Vartotojo varduose gali būti tik raidės (a-z, A-Z), skaičiai (0-9) ir apatiniai brūkšneliai. Vartotojo vardai neatmeta didžiųjų ir mažųjų raidžių skirtumo.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Vartotojo varduose gali būti tik raidės (a-z, A-Z), skaičiai (0-9) ir apatiniai brūkšneliai. Vartotojo vardai neatmeta didžiųjų ir mažųjų raidžių skirtumo. Galite pasirinkti bet kurį galimą 4 skaitmenų žymą nuo #0000 iki #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Vartotojo varduose gali būti tik raidės (a-z, A-Z), skaičiai (0-9) ir apatiniai brūkšneliai. Vartotojo vardai neatmeta didžiųjų ir mažųjų raidžių skirtumo. Galite pasirinkti bet kurį galimą 4 skaitmenų žymą nuo #0001 iki #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Nuo $min iki $max simbolių';
  }

  @override
  String get validationAllowedChars =>
      'Tik raidės (a-z, A-Z), skaičiai (0-9) ir apatiniai brūkšneliai (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Gaukite Plutonium, kad pritaikytumėte savo žymą arba išlaikytumėte ją keisdami vartotojo vardą';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag jau užimtas';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminator jau užimtas. Tęsiant jūsų diskriminatorius bus automatiškai perskirstytas.';
  }

  @override
  String get customTagIsTemporary => 'Pasirinktinė žyma yra laikina';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Jūsų pasirinktinė 4 skaitmenų žyma yra prieinama tik tol, kol aktyvi jūsų Plutonium prenumerata. Kai jūsų prenumerata baigsis $date, jūsų žyma po 3 dienų malonės periodo grįš prie atsitiktinai priskirto numerio.';
  }

  @override
  String get customTagTemporaryBody =>
      'Jūsų pasirinktinė 4 skaitmenų žyma yra prieinama tik tol, kol aktyvi jūsų Plutonium prenumerata. Kai jūsų prenumerata baigsis, jūsų žyma po 3 dienų malonės periodo grįš prie atsitiktinai priskirto numerio.';

  @override
  String get iUnderstandContinue => 'Suprantu, tęsti';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Jei išsaugosite šį FluxerTag, jūsų pasirinktinė 4 skaitmenų žyma grįš prie atsitiktinio numerio pasibaigus jūsų Plutonium prenumeratai. Jei jūsų prenumerata nebus atnaujinta, turėsite 3 dienų malonės periodą prieš žymos pakeitimą.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Jūsų pasirinktinė 4 skaitmenų žyma (#$discriminator) yra aktyvi, kol aktyvi jūsų Plutonium prenumerata. Jei jūsų prenumerata baigsis arba nebus atnaujinta po 3 dienų malonės periodo, jūsų žyma grįš prie atsitiktinio numerio.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Pritaikykite savo 4 skaitmenų žymą arba išlaikykite ją keisdami vartotojo vardą';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Jūsų Plutonium bandomasis laikotarpis baigiasi $date. Atnaujinkite, kad išlaikytumėte savo pasirinktinę žymą ir gautumėte ženklelį savo profilyje.';
  }

  @override
  String get premiumTrialActive =>
      'Jūs naudojate Plutonium bandomąją versiją. Atnaujinkite, kad išlaikytumėte savo pasirinktinę žymą ir gautumėte ženklelį savo profilyje.';

  @override
  String get fluxerTagUpdated => 'FluxerTag atnaujintas';

  @override
  String get fluxerTagUpdateFailed =>
      'Nepavyko atnaujinti FluxerTag. Pabandykite dar kartą.';

  @override
  String get continueAction => 'Tęsti';

  @override
  String get profileCustomizationTitle => 'Profilio pritaikymas';

  @override
  String get profileCustomizationDescription =>
      'Redaguokite savo profilio išvaizdą ir pamatykite tiesioginę peržiūrą';

  @override
  String get usernameLabel => 'Vartotojo vardas';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Patvirtinkite savo paskyrą, kad pakeistumėte savo FluxerTag';

  @override
  String get changeFluxerTag => 'Pakeisti FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Tinkinkite savo 4 skaitmenų žymą (#$discriminator) su Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Pakeiskite savo vartotojo vardą ir 4 skaitmenų žymą';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Jūsų pasirinktinė žyma (#$discriminator) yra susieta su jūsų Plutonium prenumerata ir grįš prie atsitiktinės žymos, jei ji baigsis.';
  }

  @override
  String get displayNameLabel => 'Rodyti vardą';

  @override
  String get pronounsLabel => 'Įvardžiai';

  @override
  String get avatarLabel => 'Avataro';

  @override
  String get changeAvatar => 'Pakeisti avatarą';

  @override
  String get removeAvatar => 'Pašalinti avatarą';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Daugiausiai 10MB. Rekomenduojama: 512×512px';

  @override
  String get bannerLabel => 'Baneris';

  @override
  String get changeBanner => 'Pakeisti banerį';

  @override
  String get removeBanner => 'Pašalinti banerį';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Daugiausiai 10MB. Minimalus: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Pagrindinė spalva';

  @override
  String get accentColorDescription =>
      'Tinkina jūsų profilio kraštinę ir banerio spalvą';

  @override
  String get aboutMeLabel => 'Apie mane';

  @override
  String get aboutMeHelperText =>
      'Galite naudoti nuorodas, jaustukus ir Markdown.';

  @override
  String get emojiPickerTitle => 'Jaustukai';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium ženkliuko privatumas';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Valdykite, kaip jūsų Plutonium ženkliukas rodomas kitiems';

  @override
  String get hidePlutoniumBadgeLabel => 'Visai paslėpti Plutonium ženkliuką';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Visiškai paslėpkite savo Plutonium ženkliuką nuo kitų vartotojų';

  @override
  String get hidePlutoniumPurchaseDate => 'Paslėpti Plutonium pirkimo datą';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Paslėpti Plutonium pirkimo datą ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Pašalinkite savo Plutonium pirkimo datą iš ženkliuko';

  @override
  String get maskVisionaryAsSubscription =>
      'Kaukėti Visionary kaip prenumeratą';

  @override
  String get maskVisionaryDescription =>
      'Rodyti jūsų Visionary kaip įprastą prenumeratą';

  @override
  String get hideVisionaryIdBadge => 'Paslėpti Visionary ID ženkliuką';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Paslėpti Visionary ID ženkliuką (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Pašalinkite savo Visionary ID ženkliuką';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Jūs naudojate Plutonium bandomąją versiją – jūsų prenumerata prasidės $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Jūsų prenumerata automatiškai prasidės pasibaigus bandomajai versijai. Jokių veiksmų nereikia.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Jūs naudojate Plutonium bandomąją versiją, kuri baigiasi $date';
  }

  @override
  String get premiumTrialActiveProfile =>
      'Jūs naudojate Plutonium bandomąją versiją';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Daugiausiai 10MB. Rekomenduojama: 512×512px. Animaciniams avatarams (GIF) reikia Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Tinkinkite savo profilį su statiniu arba animuotu banerio paveikslėliu, kad jis išsiskirtų.';

  @override
  String get getPlutonium => 'Gauti Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Pirkimai programėlėje dar nepasiekiami šioje platformoje. Sekite naujienas – netrukus!';

  @override
  String get profilePreviewLabel => 'Peržiūra';

  @override
  String get profilePreviewMessage => 'Žinutė';

  @override
  String get profilePreviewMemberSince => 'Fluxer narys nuo';

  @override
  String get unclaimedAccountTitle => 'Nepareikalautas paskyra';

  @override
  String get unclaimedAccountDescription =>
      'Jūsų paskyra dar nepareikalauta. Be el. pašto ir slaptažodžio galite prarasti prieigą. Pareikalaukite savo paskyros dabar, kad ją apsaugotumėte.';

  @override
  String get claimAccount => 'Pareikalauti paskyros';

  @override
  String get profileTypeLabel => 'Profilio tipas';

  @override
  String get profileTypeGlobal => 'Visuotinis profilis';

  @override
  String get profileTypeGuildDescription =>
      'Redaguojate savo profilį kiekvienai bendruomenei. Šis profilis bus matomas tik šioje bendruomenėje ir pakeis jūsų visuotinį profilį.';

  @override
  String get communityNicknameLabel => 'Bendruomenės slapyvardis';

  @override
  String get perGuildPremiumUpsellText =>
      'Individualinių bendruomenių profilio, reklamjuostės, akcento spalvos ir biografijos tinkinimas reikalauja Plutonium. Bendruomenės slapyvardis ir įvardžiai yra nemokami visiems.';

  @override
  String get avatarModeInherit => 'Naudoti globalų profilį';

  @override
  String get avatarModeCustom => 'Naudoti pasirinktinį vaizdą';

  @override
  String get avatarModeUnset => 'Nėra';

  @override
  String get profileSavedToast => 'Profilis atnaujintas';

  @override
  String get profileEditButton => 'Redaguoti profilį';

  @override
  String get profileNoteLabel => 'Pastaba';

  @override
  String get profileNoteVisibility => '(matoma tik jums)';

  @override
  String get profileNoteEmpty => 'Dar nėra pastabos.';

  @override
  String get sudoTitle => 'Patvirtinkite savo tapatybę';

  @override
  String get sudoDescription =>
      'Šis veiksmas reikalauja patvirtinimo, kad būtų galima tęsti.';

  @override
  String get sudoAuthenticatorCode => 'Autentifikatoriaus kodas';

  @override
  String get sudoMethodPassword => 'Slaptažodis';

  @override
  String get sudoMethodTotp => 'Autentifikatorius';

  @override
  String get sudoVerificationFailed =>
      'Patvirtinimas nepavyko. Bandykite dar kartą.';

  @override
  String get securityAccountTitle => 'Paskyra';

  @override
  String get securityAccountDescription =>
      'Tvarkykite savo el. paštą, slaptažodį ir paskyros nustatymus';

  @override
  String get securitySectionTitle => 'Sauga';

  @override
  String get securitySectionDescription =>
      'Apsaugokite savo paskyrą dviejų veiksnių autentifikavimu ir slaptažodžių tvarkytuvais';

  @override
  String get securityLoginEmailSectionTitle => 'El. pašto nustatymai';

  @override
  String get securityLoginEmailSectionDescription =>
      'Tvarkykite el. pašto adresą, kurį naudojate prisijungdami prie Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'El. pašto adresas';

  @override
  String get securityLoginNoEmailSet => 'Nenustatytas el. pašto adresas';

  @override
  String get securityLoginChangeEmail => 'Keisti el. paštą';

  @override
  String get securityLoginAddEmail => 'Pridėti el. paštą';

  @override
  String get securityLoginReveal => 'Rodyti';

  @override
  String get securityLoginHide => 'Slėpti';

  @override
  String get securityLoginPasswordSectionTitle => 'Slaptažodis';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Pakeiskite savo slaptažodį, kad jūsų paskyra būtų saugi';

  @override
  String get securityLoginCurrentPasswordLabel => 'Dabartinis slaptažodis';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Paskutinį kartą pakeista: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Paskutinį kartą pakeista: Niekada';

  @override
  String get securityLoginNoPasswordSet => 'Nenustatytas slaptažodis';

  @override
  String get securityLoginChangePassword => 'Keisti slaptažodį';

  @override
  String get securityLoginSetPassword => 'Nustatyti slaptažodį';

  @override
  String get passwordChangeTitle => 'Keisti slaptažodį';

  @override
  String get passwordChangeIntroDescription =>
      'Prieš keičiant slaptažodį, atsiųsime patvirtinimo kodą į jūsų el. pašto adresą, kad patvirtintume jūsų tapatybę.';

  @override
  String get passwordChangeStart => 'Pradėti';

  @override
  String get passwordChangeVerifyTitle => 'Patvirtinkite savo el. paštą';

  @override
  String get passwordChangeVerifyDescription =>
      'Įveskite patvirtinimo kodą, išsiųstą į jūsų el. pašto adresą.';

  @override
  String get passwordChangeVerificationCode => 'Patvirtinimo kodas';

  @override
  String get passwordChangeVerify => 'Patvirtinti';

  @override
  String get passwordChangeNewPasswordTitle => 'Nustatyti naują slaptažodį';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Įveskite savo naują slaptažodį žemiau.';

  @override
  String get passwordChangeNewPassword => 'Naujas slaptažodis';

  @override
  String get passwordChangeConfirmPassword => 'Patvirtinti naują slaptažodį';

  @override
  String get passwordChangeSubmit => 'Keisti slaptažodį';

  @override
  String get passwordChangeSuccess => 'Slaptažodis pakeistas';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Slaptažodžiai nesutampa';

  @override
  String get passwordChangeInvalidCode => 'Netinkamas arba pasibaigęs kodas';

  @override
  String get emailChangeTitle => 'Keisti el. paštą';

  @override
  String get emailChangeIntroDescription =>
      'Prieš keičiant el. pašto adresą, atsiųsime patvirtinimo kodus jūsų tapatybei patikrinti.';

  @override
  String get emailChangeStart => 'Pradėti';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'Patvirtinti dabartinį el. paštą';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Įveskite patvirtinimo kodą, išsiųstą į jūsų dabartinį el. pašto adresą.';

  @override
  String get emailChangeNewEmailTitle => 'Įvesti naują el. paštą';

  @override
  String get emailChangeNewEmailDescription =>
      'Įveskite naują el. pašto adresą, kurį norėtumėte naudoti.';

  @override
  String get emailChangeNewEmailLabel => 'Naujas el. paštas';

  @override
  String get emailChangeNewEmailSubmit => 'Siųsti patvirtinimo kodą';

  @override
  String get emailChangeVerifyNewTitle => 'Patvirtinti naują el. paštą';

  @override
  String get emailChangeVerifyNewDescription =>
      'Įveskite patvirtinimo kodą, išsiųstą į jūsų naują el. pašto adresą.';

  @override
  String get emailChangeSuccess => 'El. paštas pakeistas';

  @override
  String get emailChangeInvalidCode => 'Netinkamas arba pasibaigęs kodas';

  @override
  String get resend => 'Siųsti iš naujo';

  @override
  String resendCountdown(int seconds) {
    return 'Siųsti iš naujo (${seconds}s)';
  }

  @override
  String get verificationCode => 'Patvirtinimo kodas';

  @override
  String get verify => 'Patvirtinti';

  @override
  String get enable => 'Įjungti';

  @override
  String get disable => 'Išjungti';

  @override
  String get delete => 'Panaikinti';

  @override
  String get save => 'Išsaugoti';

  @override
  String get securityTfaSectionTitle => 'Dviejų veiksnių autentifikacija';

  @override
  String get securityTfaSectionDescription =>
      'Pridėkite papildomą saugos sluoksnį prie savo paskyros';

  @override
  String get securityTfaAuthenticatorApp => 'Autentifikavimo programa';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Dviejų veiksnių autentifikacija įjungta';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Naudokite autentifikavimo programą kodams generuoti dviejų veiksnių autentifikacijai';

  @override
  String get securityTfaBackupCodes => 'Atsarginiai kodai';

  @override
  String get securityTfaBackupCodesDescription =>
      'Peržiūrėkite ir tvarkykite savo atsarginius kodus paskyros atkūrimui';

  @override
  String get securityTfaViewCodes => 'Peržiūrėti kodus';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Naudokite passkeys prisijungimui be slaptažodžio ir dviejų veiksnių autentifikacijai';

  @override
  String get securityPasskeysRegistered => 'Užregistruoti Passkeys';

  @override
  String get securityPasskeysNone => 'Nėra užregistruotų passkeys';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$_temp0 užregistruota ($count) (daugiausia 10)';
  }

  @override
  String get securityPasskeysAdd => 'Pridėti Passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'Pridėta: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Paskutinį kartą naudota: $date';
  }

  @override
  String get securityPasskeysRename => 'Pervardyti';

  @override
  String get securityPasskeysDeleteTitle => 'Panaikinti Passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Ar tikrai norite panaikinti passkey „$name“?';
  }

  @override
  String get securityPasskeyNameTitle => 'Pavadinti Passkey';

  @override
  String get securityPasskeyNameLabel => 'Passkey pavadinimas';

  @override
  String get securityPasskeyNameHint =>
      'pvz., YubiKey, iPhone, Darbo kompiuteris';

  @override
  String get securityPhoneSectionTitle => 'Telefono numeris';

  @override
  String get securityPhoneSectionDescription =>
      'Tvarkykite savo telefono numerį.';

  @override
  String get securityPhoneLabel => 'Telefono numeris';

  @override
  String get securityPhoneNone => 'Nėra pridėto telefono numerio.';

  @override
  String get securityPhoneAdd => 'Pridėti telefoną';

  @override
  String get securityPhoneRemove => 'Panaikinti';

  @override
  String get securityPhoneRemoveTitle => 'Panaikinti telefono numerį';

  @override
  String get securityPhoneRemoveDescription =>
      'Ar tikrai norite pašalinti savo telefono numerį?';

  @override
  String get securityPhoneRemoved => 'Telefono numeris pašalintas';

  @override
  String get securityClaimTitle => 'Saugos funkcijos';

  @override
  String get securityClaimDescription =>
      'Prisijunkite prie savo paskyros, kad pasiektumėte saugos funkcijas, pvz., dviejų veiksnių autentifikavimą ir slaptažodžių raktus.';

  @override
  String get securityVerifyEmailRequired =>
      'Turite patvirtinti savo el. pašto adresą, kad galėtumėte nustatyti dviejų veiksnių autentifikavimą, slaptažodžių raktus arba SMS patvirtinimą.';

  @override
  String get totpEnableTitle => 'Nustatyti autentifikavimo programėlę';

  @override
  String get totpEnableDescription =>
      'Nuskaitykite QR kodą savo autentifikavimo programėle, kad sukurtumėte kodus dviejų veiksnių autentifikavimui.';

  @override
  String get totpEnableCodeLabel => 'Kodas';

  @override
  String get totpEnableCodeHint =>
      'Įveskite 6 skaitmenų kodą iš savo autentifikavimo programėlės';

  @override
  String get totpEnableSuccess => 'Dviejų veiksnių autentifikavimas įjungtas';

  @override
  String get totpDisableTitle => 'Pašalinti autentifikavimo programėlę';

  @override
  String get totpDisableDescription =>
      'Įveskite 6 skaitmenų kodą iš savo autentifikavimo programėlės, kad išjungtumėte dviejų veiksnių autentifikavimą.';

  @override
  String get totpDisableSuccess => 'Dviejų veiksnių autentifikavimas išjungtas';

  @override
  String get backupCodesTitle => 'Atsarginiai kodai';

  @override
  String get backupCodesWarning =>
      'Jei prarasite prieigą prie savo autentifikavimo programėlės ir neturėsite šių kodų, jūsų paskyra bus visam laikui užblokuota. Atsisiųskite arba nukopijuokite juos dabar ir saugiai laikykite.';

  @override
  String get backupCodesDownload => 'Atsisiųsti';

  @override
  String get backupCodesCopy => 'Kopijuoti';

  @override
  String get backupCodesCopied => 'Atsarginiai kodai nukopijuoti į iškarpinę';

  @override
  String get backupCodesAcknowledge =>
      'Atsisiunčiau arba nukopijavau savo atsarginius kodus ir saugiai juos laikau.';

  @override
  String get backupCodesDone => 'Atlikta';

  @override
  String get backupCodesViewTitle => 'Peržiūrėti atsarginius kodus';

  @override
  String get backupCodesViewDescription =>
      'Norint peržiūrėti atsarginius kodus, gali prireikti patvirtinimo.';

  @override
  String get phoneAddTitle => 'Pridėti telefono numerį';

  @override
  String get phoneAddLabel => 'Telefono numeris';

  @override
  String get phoneAddHint => 'Įveskite savo telefono numerį';

  @override
  String get phoneAddFooter =>
      'Įveskite savo telefono numerį. Atsiųsime SMS su patvirtinimo kodu.';

  @override
  String get phoneAddSendCode => 'Siųsti kodą';

  @override
  String get phoneVerifyTitle => 'Patvirtinti telefono numerį';

  @override
  String get phoneVerifyDescription =>
      'Įveskite patvirtinimo kodą, išsiųstą jūsų telefono numeriu.';

  @override
  String get phoneAddSuccess => 'Telefono numeris pridėtas';

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
  String get dangerZoneSectionTitle => 'Pavojinga zona';

  @override
  String get dangerZoneSectionDescription =>
      'Neatšaukiami ir destruktyvūs veiksmai';

  @override
  String get dangerZoneDisableTitle => 'Išjungti paskyrą';

  @override
  String get dangerZoneDisableDescription =>
      'Laikinai išjunkite savo paskyrą. Vėliau galėsite ją vėl aktyvuoti prisijungę.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Išjungus paskyrą, būsite atsijungę iš visų sesijų. Bet kuriuo metu galėsite vėl aktyvuoti paskyrą prisijungę.';

  @override
  String get dangerZoneDeleteTitle => 'Ištrinti paskyrą';

  @override
  String get dangerZoneDeleteDescription =>
      'Visam laikui ištrinkite savo paskyrą ir visus susijusius duomenis. Šio veiksmo negalima atšaukti.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Prieš ištrindami paskyrą, atšaukite aktyvią Plutonium prenumeratą Plutonium nustatymuose.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Nepavyksta ištrinti paskyros';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Negalite ištrinti savo paskyros, kol esate bendruomenių savininkas. Pirmiausia perkelkite nuosavybę į šias bendruomenes:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'ir dar $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Norėdami perleisti nuosavybę, eikite į $settingsPath ir naudokite parinktį „Perleisti nuosavybę“.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Ar tikrai norite ištrinti savo paskyrą? Šis veiksmas suplanuos jūsų paskyros visam laikui ištrynimą.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Ištrynimo procesą galite atšaukti per 14 dienų';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Po 14 dienų jūsų paskyra bus visam laikui ištrinta';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Kai ištrynimas bus apdorotas, negalėsite atkurti prieigos prie savo paskyros';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Negalėsite ištrinti savo išsiųstų žinučių po to, kai jūsų paskyra bus ištrinta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Jei norite eksportuoti savo duomenis arba pirmiausia ištrinti žinutes, prieš tęsdami apsilankykite „Privatumo informacijos suvestinė“ skiltyje „Vartotojo nustatymai“.';

  @override
  String get claimAccountTitle => 'Prisijunkite prie savo paskyros';

  @override
  String get claimAccountDescription =>
      'Prisijunkite prie savo paskyros pridėdami el. paštą ir slaptažodį. Prieš baigdami, atsiųsime patvirtinimo kodą, kad patvirtintume jūsų el. paštą.';

  @override
  String get claimAccountEmailLabel => 'El. paštas';

  @override
  String get claimAccountPasswordLabel => 'Slaptažodis';

  @override
  String get claimAccountSendCode => 'Siųsti kodą';

  @override
  String get claimAccountVerifyDescription =>
      'Įveskite kodą, kurį išsiuntėme jūsų el. paštu, kad jį patvirtintumėte. Jūsų slaptažodis bus nustatytas patvirtinus kodą.';

  @override
  String get claimAccountSuccess => 'Paskyra sėkmingai užregistruota';

  @override
  String get importantInformation => 'Svarbi informacija:';

  @override
  String get genericError => 'Įvyko klaida';

  @override
  String get invalidCode => 'Neteisingas kodas';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prieš $count metus',
      one: 'prieš 1 metus',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prieš $count mėnesius',
      one: 'prieš 1 mėnesį',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prieš $count dienas',
      one: 'prieš 1 dieną',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prieš $count valandas',
      one: 'prieš 1 valandą',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prieš $count minutes',
      one: 'prieš 1 minutę',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'Ką tik';

  @override
  String get authorizedAppsTitle => 'Įgaliotos programos';

  @override
  String get authorizedAppsDescription =>
      'Šioms programoms buvo suteikta prieiga prie jūsų Fluxer paskyros.';

  @override
  String get authorizedAppsEmptyTitle => 'Nėra įgaliotų programų';

  @override
  String get authorizedAppsEmptyDescription =>
      'Nė vienai programai nesuteikėte prieigos prie savo paskyros.';

  @override
  String get authorizedAppsLoadError => 'Nepavyko įkelti įgaliotų programų';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Įgaliota $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Suteikti leidimai';

  @override
  String get authorizedAppsRevoke => 'Atšaukti';

  @override
  String get authorizedAppsRevokeTitle => 'Atšaukti programos prieigą';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Ar tikrai norite atšaukti $appName prieigą? Ši programa nebeturės prieigos prie jūsų paskyros.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Pasiekti jūsų pagrindinę profilio informaciją (vartotojo vardas, avataras ir kt.)';

  @override
  String get authorizedAppsScopeEmail => 'Peržiūrėti jūsų el. pašto adresą';

  @override
  String get authorizedAppsScopeGuilds =>
      'Peržiūrėti bendruomenes, kuriose esate narys';

  @override
  String get authorizedAppsScopeConnections =>
      'Peržiūrėti jūsų prijungtas paskyras';

  @override
  String get authorizedAppsScopeBot =>
      'Pridėti robotą į bendruomenę su prašomais leidimais';

  @override
  String get authorizedAppsScopeAdmin =>
      'Pasiekti administracinius galinius taškus';

  @override
  String get privacyPendingDeletionTitle => 'Laukiama ištrynimo';

  @override
  String get blockedUsersTitle => 'Užblokuoti vartotojai';

  @override
  String get blockedUsersDescription =>
      'Užblokuoti vartotojai negali siųsti jums draugystės užklausų ar tiesiogiai rašyti žinučių.';

  @override
  String get blockedUsersEmptyTitle => 'Nėra užblokuotų vartotojų';

  @override
  String get blockedUsersEmptyDescription => 'Dar nieko neužblokavote.';

  @override
  String get blockedUsersLoadError => 'Nepavyko įkelti užblokuotų vartotojų';

  @override
  String get blockedUsersUnblock => 'Atblokuoti';

  @override
  String get blockedUsersUnblockTitle => 'Atblokuoti vartotoją';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Ar tikrai norite atblokuoti $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopijuoti FluxerTag';

  @override
  String get blockedUsersCopyId => 'Kopijuoti vartotojo ID';

  @override
  String get userProfileLoadError => 'Nepavyko įkelti profilio';

  @override
  String get userProfileRetry => 'Bandyti dar kartą';

  @override
  String get userProfileMessage => 'Žinutė';

  @override
  String get userProfileVoiceCall => 'Balso skambutis';

  @override
  String get userProfileVideoCall => 'Vaizdo skambutis';

  @override
  String get userProfileEditProfile => 'Redaguoti profilį';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer personalas';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer bendruomenės komanda';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer partneris';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium prenumerata nuo $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary nuo $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Bendri draugai ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Bendrijos ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Bendri draugai';

  @override
  String get userProfileMutualCommunitiesTitle => 'Bendrijos';

  @override
  String get userProfileNoMutualFriends => 'Bendrų draugų nerasta.';

  @override
  String get userProfileNoMutualCommunities => 'Bendrų bendrijų nerasta.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Slapyvardis: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Atidaryti DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Jūs užblokavote $username. Negalėsite siųsti žinučių, nebent juos atblokuosite.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Atblokuoti';

  @override
  String get userProfileOpenDm => 'Atidaryti DM';

  @override
  String get userProfileNoteTitle => 'Pastaba';

  @override
  String get userProfileNoteVisibility => '(matoma tik jums)';

  @override
  String get userProfileNoteSave => 'Išsaugoti';

  @override
  String get userProfileNoteDelete => 'Ištrinti';

  @override
  String get userProfileNoteEmpty => 'Spustelėkite, kad pridėtumėte pastabą';

  @override
  String get userProfileMemberSince => 'Nuo narystės';

  @override
  String get userProfileAboutMe => 'Apie mane';

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
  String get userProfileLocalTime => 'Lokalus laikas';

  @override
  String get userProfileSameTimeAsYou => 'Toks pat laikas kaip jūsų';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration anksčiau nei jūs';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration vėliau nei jūs';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours valandos',
      one: '1 valanda',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutės',
      one: '1 minutė',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours valandų',
      one: '1 valanda',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minučių',
      few: '# minutės',
      one: '# minutė',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Kopijuoti vartotojo vardą';

  @override
  String get userProfileCopyUserId => 'Kopijuoti vartotojo ID';

  @override
  String get userProfileViewMainProfile => 'Peržiūrėti pagrindinį profilį';

  @override
  String get userProfileViewCommunityProfile => 'Peržiūrėti bendrijos profilį';

  @override
  String get userProfileBlockUser => 'Užblokuoti vartotoją';

  @override
  String get userProfileUnblockUser => 'Atblokuoti vartotoją';

  @override
  String get userProfileRemoveFriend => 'Pašalinti draugą';

  @override
  String get userProfileBlockConfirmTitle => 'Užblokuoti vartotoją';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Ar tikrai norite užblokuoti $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Atblokuoti vartotoją';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Ar tikrai norite atblokuoti $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Pašalinti draugą';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Ar tikrai norite pašalinti $username iš draugų?';
  }

  @override
  String get userProfileFailedOpenDm => 'Nepavyko atidaryti DM';

  @override
  String get userProfileFailedSaveNote => 'Nepavyko išsaugoti pastabos';

  @override
  String get userProfileActionFailed =>
      'Veiksmas nepavyko, bandykite dar kartą';

  @override
  String get userProfileChangeNickname => 'Pakeisti slapyvardį';

  @override
  String get userProfileKick => 'Išmesti';

  @override
  String get userProfileBan => 'Uždrausti';

  @override
  String get userProfileTimeout => 'Nutildyti';

  @override
  String get userProfileRemoveTimeout => 'Panaikinti nutildymą';

  @override
  String get userProfileTransferOwnership => 'Perduoti nuosavybę';

  @override
  String get userProfileReportUser => 'Pranešti apie vartotoją';

  @override
  String get userProfileReportMessage => 'Pranešti apie žinutę';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Išmesti $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Ar tikrai norite išmesti $username? Jie gali prisijungti iš naujo su nauju kvietimu.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle =>
      'Panaikinti pranešimų siuntimo apribojimą?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Panaikinus pranešimų siuntimo apribojimą, $username vėl galės siųsti žinutes, reaguoti ir prisijungti prie balso kanalų.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Perleisti nuosavybę?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Perleisti šios bendruomenės nuosavybę $username? Tai negrįžtama ir jūs prarasite visus savininko privilegijas.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Uždrausti $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Uždraudimo trukmė';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Pasirinktinė trukmė (sekundėmis)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Bet kokia reikšmė nuo $min iki $max sekundžių';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Ištrinti pranešimų istoriją';

  @override
  String get userProfileBanDeleteNone => 'Neištrinti jokių';

  @override
  String get userProfileBanDelete24h => 'Paskutinės 24 valandos';

  @override
  String get userProfileBanDelete7d => 'Paskutinės 7 dienos';

  @override
  String get userProfileBanReasonLabel => 'Priežastis (pasirenkama)';

  @override
  String get userProfileBanReasonHint => 'Įveskite uždraudimo priežastį';

  @override
  String get userProfileBanSubmit => 'Uždrausti narį';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Apriboti $username pranešimų siuntimą';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Apribojimo trukmė';

  @override
  String get userProfileTimeoutSubmit => 'Apriboti nario pranešimų siuntimą';

  @override
  String get userProfileNicknameLabel => 'Slapyvardis';

  @override
  String get userProfileNicknameHint => 'Įveskite slapyvardį';

  @override
  String get userProfileNicknameSave => 'Išsaugoti';

  @override
  String userProfileKickSuccess(String username) {
    return 'Pašalintas $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Uždraustas $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Apribotas $username pranešimų siuntimas';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Panaikintas apribojimas $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Slapyvardis atnaujintas';

  @override
  String get userProfileTransferSuccess => 'Nuosavybė perleista';

  @override
  String get durationPermanent => 'Nuolat';

  @override
  String get duration60Seconds => '60 sekundžių';

  @override
  String get duration5Minutes => '5 minutės';

  @override
  String get duration10Minutes => '10 minučių';

  @override
  String get duration1Hour => '1 valanda';

  @override
  String get duration12Hours => '12 valandų';

  @override
  String get duration1Day => '1 diena';

  @override
  String get duration3Days => '3 dienos';

  @override
  String get duration5Days => '5 dienos';

  @override
  String get duration1Week => '1 savaitė';

  @override
  String get duration2Weeks => '2 savaitės';

  @override
  String get duration1Month => '1 mėnuo';

  @override
  String get durationCustom => 'Pasirinktinai…';

  @override
  String get iarReportUserTitle => 'Pranešti apie vartotoją';

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
  String get iarReasonInappropriateProfile => 'Netinkamas profilis';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Šio vartotojo profilyje yra netinkamo turinio';

  @override
  String typingIndicatorOne(String name) {
    return 'Rašo $name...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Rašo $name1 ir $name2...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Rašo $name1, $name2 ir $name3...';
  }

  @override
  String get typingIndicatorMultiple => 'Keli žmonės rašo...';

  @override
  String get typingIndicatorHandful =>
      'Keletas entuziastingų rašytojų ruošiasi...';

  @override
  String get typingIndicatorSymphony =>
      'Prasidėjo klavišų daužymo simfonija...';

  @override
  String get typingIndicatorFiesta => 'Čia vyksta tikra rašymo fiesta!';

  @override
  String get typingIndicatorApocalypse => 'Oho, rašymo apokalipsė';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Džiaugiamės, kad esi čia, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Sveiki, $username! Jauskis kaip namie.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Sveiki, $username! Smagu, kad esate čia.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Sveiki, $username! Prisijunkite, kai būsite pasiruošę.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Sveiki, $username, smagu matyti tave čia!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Sveiki, $username! Tikimės, kad jums patiks jūsų viešnagė.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Sveiki, $username, sveiki atvykę!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Džiaugiamės, kad atvykai, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Sveiki, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Sveiki, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Sveiki, $username! Džiaugiamės, kad esate čia.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Sveiki, $username! Tikimės, kad jums patiks jūsų laikas čia.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Sveiki, $username! Jūsų kitas pokalbis prasideda čia.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Sveiki, $username. Džiaugiamės, kad esate čia.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Smagu matyti, $username! Sveiki atvykę.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Jūs čia, $username! Smagu, kad esate su mumis.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Jūs atvykai, $username! Pradėkime.';
  }

  @override
  String get relativeTimeShortNow => 'dabar';

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
      other: '$count mėn.',
      one: '1 mėn.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}m',
      one: '1m',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Mano įrenginiai';

  @override
  String get linkedDevicesDescription =>
      'Peržiūrėkite visus įrenginius, kurie šiuo metu yra prisijungę prie jūsų paskyros. Atšaukite visus seansus, kurių neatpažįstate.';

  @override
  String get linkedDevicesCurrentDevice => 'Dabartinis įrenginys';

  @override
  String get linkedDevicesOtherDevices => 'Kiti įrenginiai';

  @override
  String get linkedDevicesEnterSelection => 'Įjungti pasirinkimo režimą';

  @override
  String get linkedDevicesExitSelection => 'Išjungti pasirinkimo režimą';

  @override
  String get linkedDevicesSelectAll => 'Pasirinkti viską';

  @override
  String get linkedDevicesClearSelection => 'Atšaukti pasirinkimą';

  @override
  String get linkedDevicesRevokeTooltip => 'Atšaukti įrenginio prieigą';

  @override
  String get linkedDevicesSignOutAll => 'Atsijungti nuo visų kitų įrenginių';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Atsijungti nuo $count įrenginių',
      one: 'Atsijungti nuo 1 įrenginio',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Atsijungti nuo $count įrenginių',
      one: 'Atsijungti nuo 1 įrenginio',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Atsijungti nuo visų kitų įrenginių';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tai atjungtų pasirinktus įrenginius nuo jūsų paskyros. Jums reikės vėl prisijungti prie tų įrenginių.',
      one:
          'Tai atjungtų pasirinktą įrenginį nuo jūsų paskyros. Jums reikės vėl prisijungti prie to įrenginio.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Tai atjungtų pasirinktus įrenginius nuo jūsų paskyros. Jums reikės vėl prisijungti prie tų įrenginių.';

  @override
  String get linkedDevicesSignOutConfirm => 'Tęsti';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Jums reikės vėl prisijungti prie visų atjungtų įrenginių';

  @override
  String get linkedDevicesLoadErrorTitle => 'Tinklo klaida';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Kyla problemų jungiantis prie laiko-erdvės kontinuumo. Patikrinkite savo ryšį ir bandykite dar kartą.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Įrenginiai atjungti',
      one: 'Įrenginys atjungtas',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Nepavyko atsijungti. Bandykite dar kartą.';

  @override
  String get linkedDevicesUnknownOs => 'Nežinoma OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Nežinoma platforma';

  @override
  String slowmodeLabel(String duration) {
    return '$duration lėtasis režimas';
  }

  @override
  String get slowmodeTooltipActive =>
      'Esate lėtajame režime. Prašome palaukti prieš siunčiant kitą žinutę.';

  @override
  String get slowmodeTooltipImmune =>
      'Lėtasis režimas įjungtas, bet esate nuo jo apsaugotas.';

  @override
  String get channelNoSendPermissionHint =>
      'Jūs negalite siųsti žinučių šiame kanale.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Sistemos pranešimai iš „$productName“ darbuotojų. Čia negalite atsakyti.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Žinučių siuntimas šioje bendruomenėje laikinai sustabdytas.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Jums taikomas laiko apribojimas. Žinučių siuntimas, reakcijos ir balsas bus sustabdyti, kol pasibaigs apribojimas.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Turite susikurti paskyrą, kad galėtumėte siųsti žinutes šioje bendruomenėje.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Turite patvirtinti savo el. paštą, kad galėtumėte siųsti žinutes šioje bendruomenėje.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Jūsų paskyra per nauja, kad galėtumėte siųsti žinutes šioje bendruomenėje.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Jūs dar nepakankamai ilgai esate šios bendruomenės narys, kad galėtumėte siųsti žinutes.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Turite patvirtinti telefono numerį, kad galėtumėte siųsti žinutes šioje bendruomenėje.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Patvirtinti el. paštą';

  @override
  String get channelComposerBarrierVerifyPhone => 'Patvirtinti telefoną';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Pernelyg daug priedų (daugiausia $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Vienas ar daugiau failų viršija dydžio limitą';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Šie failai yra per dideli, kad juos būtų galima išsiųsti kartu';

  @override
  String get chatAttachmentDropToUpload => 'Nukreipkite failus, kad įkeltumėte';

  @override
  String get chatAttachmentDropToSend =>
      'Nukreipkite failus, kad išsiųstumėte dabar';

  @override
  String get chatAttachmentSendVoiceMessage => 'Siųsti balso pranešimą';

  @override
  String get voiceMessageTitle => 'Balso pranešimas';

  @override
  String get voiceMessageHoldHint =>
      'Palaikykite, kad įrašytumėte. Vilkite aukštyn, kad užfiksuotumėte, arba atleiskite, kad išsiųstumėte.';

  @override
  String get voiceMessageDiscard => 'Panaikinti balso pranešimą';

  @override
  String get voiceMessageSend => 'Siųsti balso pranešimą';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nepavyksta pradėti įrašymo. Leiskite prieigą prie mikrofono.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Balso įrašymas nepalaikomas šiame įrenginyje.';

  @override
  String get voiceMessageMicInUse =>
      'Išeikite iš balso skambučio, kad įrašytumėte balso pranešimą.';

  @override
  String get voiceMessageRecordingFailed =>
      'Įrašymas nepavyko. Pabandykite dar kartą.';

  @override
  String get voiceMessageSendFailed =>
      'Nepavyksta išsiųsti balso pranešimo. Pabandykite dar kartą.';

  @override
  String get voiceMessageRecordingHint =>
      'Kalbėkite dabar. Paspauskite Stop, kai baigsite – vėliau galėsite apkarpyti.';

  @override
  String get voiceMessageReviewHint =>
      'Vilkite rankenėles, kad apkarpytumėte, tada paspauskite Siųsti.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Pradėti įrašymą';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Leisti';

  @override
  String get voiceMessagePause => 'Pristabdyti';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Pasirinkimas turi būti bent ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Redaguoti priedą';

  @override
  String get chatAttachmentFilenameLabel => 'Failo pavadinimas';

  @override
  String get chatAttachmentDescriptionLabel => 'Aprašymas';

  @override
  String get chatAttachmentDescriptionHint =>
      'Pasirenkamas alternatyvus tekstas';

  @override
  String get chatAttachmentSpoilerLabel => 'Pažymėti kaip spoilerį';

  @override
  String get chatAttachmentRemove => 'Pašalinti priedą';

  @override
  String get chatAttachmentDownload => 'Atsisiųsti';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Priedas pasibaigęs';

  @override
  String get chatAttachmentSourceGallery => 'Galerija';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Naršyti failus';

  @override
  String get chatAttachmentPasteTooltip => 'Įklijuoti failą iš mainų srities';

  @override
  String get chatAttachmentSpoiler => 'Spoileris';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Atskleisti spoilerį';

  @override
  String get matureMediaRevealButton => 'Atskleisti';

  @override
  String get matureMediaRevealHint => 'Spustelėkite, kad atskleistumėte';

  @override
  String get matureContentTitle => 'Brandus turinys';

  @override
  String get matureCommunityTitle => 'Bendruomenė suaugusiems';

  @override
  String get matureCategoryTitle => 'Kategorija suaugusiems';

  @override
  String get matureChannelTitle => 'Kanalas suaugusiems';

  @override
  String get communityContentWarningTitle =>
      'Įspėjimas apie bendruomenės turinį';

  @override
  String get categoryContentWarningTitle => 'Įspėjimas apie kategorijos turinį';

  @override
  String get channelContentWarningTitle => 'Įspėjimas apie kanalo turinį';

  @override
  String get defaultContentWarningBody => 'Čia yra neskelbtino turinio.';

  @override
  String get matureCommunityBody =>
      'Ši bendruomenė pažymėta kaip turinti suaugusiems skirtą turinį ir gali būti netinkama kai kuriems naudotojams.';

  @override
  String get matureCategoryBody =>
      'Ši kategorija pažymėta kaip turinti suaugusiems skirtą turinį ir gali būti netinkama kai kuriems naudotojams.';

  @override
  String get matureChannelBody =>
      'Šis kanalas pažymėtas kaip turintis suaugusiems skirtą turinį ir gali būti netinkamas kai kuriems naudotojams.';

  @override
  String get matureVoiceChannelBody =>
      'Šis balsinis kanalas pažymėtas kaip turintis suaugusiems skirtą turinį ir gali būti netinkamas kai kuriems naudotojams.';

  @override
  String get matureLinkChannelBody =>
      'Šis nuorodų kanalas pažymėtas kaip turintis suaugusiems skirtą turinį ir gali atverti netinkamą turinį.';

  @override
  String get matureCommunityUnavailableBody =>
      'Ši suaugusiems skirta bendruomenė nepasiekiama jūsų paskyrai.';

  @override
  String get matureCategoryUnavailableBody =>
      'Ši suaugusiems skirta kategorija nepasiekiama jūsų paskyrai.';

  @override
  String get matureChannelUnavailableBody =>
      'Šis suaugusiems skirtas kanalas nepasiekiamas jūsų paskyrai.';

  @override
  String get matureContentProceedButton => 'Tęsti';

  @override
  String get matureContentUnderstandButton => 'Suprantu';

  @override
  String get matureContentOpenLinkButton => 'Atverti nuorodą';

  @override
  String get sensitiveContentSectionTitle => 'Neskelbtinas turinys';

  @override
  String get sensitiveContentSectionDescription =>
      'Valdykite, kaip neskelbtini ar suaugusiems skirti medijos failai filtruojami skirtinguose kontekstuose';

  @override
  String get sensitiveContentFriendDmLabel =>
      'Tiesioginiai pranešimai iš draugų';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Tiesioginiai pranešimai iš kitų';

  @override
  String get sensitiveContentGuildLabel => 'Pranešimai bendruomenės kanaluose';

  @override
  String get sensitiveContentFilterShow => 'Rodyti';

  @override
  String get sensitiveContentFilterBlur => 'Užtušuoti';

  @override
  String get sensitiveContentFilterBlock => 'Blokuoti';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Užtušuoti mediją iki saugos patikrinimo pabaigos';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Kai įjungta, vaizdai ir vaizdo įrašai bus užtušuoti, kol baigsis turinio saugos patikrinimas.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Šis nustatymas visada įjungtas jūsų paskyrai.';

  @override
  String get sensitiveContentResetButton => 'Atstatyti';

  @override
  String get sensitiveContentSaveButton => 'Išsaugoti';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count failai',
      one: '1 failas',
    );
    return 'Įkeliama $_temp0';
  }

  @override
  String get chatCancelUpload => 'Atšaukti įkėlimą';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Baigiasi $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Baigiasi tarp $start ir $end';
  }

  @override
  String get connectionsTitle => 'Ryšiai';

  @override
  String get connectionsDescription =>
      'Susiekite išorinius paskyras ir domenus su savo Fluxer profiliu. Patvirtinti ryšiai bus rodomi jūsų profilyje, kad kiti galėtų juos matyti.';

  @override
  String get connectionsEmptyTitle => 'Dar nėra ryšių';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Susiekite savo „Bluesky“ paskyrą arba patvirtinkite domenų nuosavybę, kad juos rodytumėte savo profilyje.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Patvirtinkite domenų nuosavybę, kad juos rodytumėte savo profilyje.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domenas';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Pridėti „Bluesky“ ryšį';

  @override
  String get connectionsAddDomainAriaLabel => 'Pridėti domenų ryšį';

  @override
  String get connectionEdit => 'Redaguoti';

  @override
  String get connectionRemove => 'Pašalinti';

  @override
  String get connectionVerifiedLabel => 'Šis ryšys buvo patvirtintas.';

  @override
  String get connectionUnverifiedLabel => 'Šis ryšys nebuvo patvirtintas.';

  @override
  String get connectionAddTitle => 'Pridėti ryšį';

  @override
  String get connectionTypeLabel => 'Ryšio tipas';

  @override
  String get connectionHandleLabel => 'Vardas';

  @override
  String get connectionDomainLabel => 'Domenas';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Jūs jau turite šią jungtį.';

  @override
  String get connectionConnectBluesky => 'Prisijungti su Bluesky';

  @override
  String get connectionContinue => 'Tęsti';

  @override
  String get connectionVerifyTitle => 'Patvirtinti jungtį';

  @override
  String get connectionVerifyInstructions =>
      'Naudokite žemiau pateiktą įrašą, kad įrodytumėte domeno nuosavybę.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT įrašas';

  @override
  String get connectionDnsHostLabel => 'Priimančioji';

  @override
  String get connectionDnsValueLabel => 'Reikšmė';

  @override
  String get connectionCopyHost => 'Kopijuoti priimančiąją';

  @override
  String get connectionCopyValue => 'Kopijuoti reikšmę';

  @override
  String get connectionCopied => 'Nukopijuota!';

  @override
  String get connectionTokenFileTitle => 'Pateikti žetonų failą';

  @override
  String get connectionTokenFileDescription =>
      'Atsisiųskite **fluxer-verification** ir įdėkite jį į savo **.well-known** aplanką, kad galėtume patvirtinti domeną.';

  @override
  String get connectionTokenFileDownload => 'Atsisiųsti fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Failas turi patvirtinimo žetoną, kurį mes gausime iš **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Įrašyti fluxer-verification';

  @override
  String get connectionVerifyButton => 'Patvirtinti';

  @override
  String get connectionBack => 'Atgal';

  @override
  String get connectionEditTitle => 'Redaguoti jungtį';

  @override
  String get connectionEditDescription =>
      'Pasirinkite, kas gali matyti šią jungtį jūsų profilyje.';

  @override
  String get connectionVisibilityEveryone => 'Visi';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Leisti visiems matyti šią jungtį jūsų profilyje';

  @override
  String get connectionVisibilityFriends => 'Draugai';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Leisti draugams matyti šią jungtį';

  @override
  String get connectionVisibilityCommunityMembers => 'Bendruomenės nariai';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Leisti bendruomenių, kuriose esate, nariams matyti šią jungtį';

  @override
  String get connectionRemoveTitle => 'Pašalinti jungtį';

  @override
  String get connectionRemoveDescription =>
      'Ar tikrai norite pašalinti šią jungtį? Šio veiksmo negalima atšaukti.';

  @override
  String get connectionRemoveConfirm => 'Pašalinti';

  @override
  String get connectionsLoadError => 'Nepavyko įkelti jungčių';

  @override
  String get connectionsReorderError => 'Nepavyko atnaujinti tvarkos';

  @override
  String get connectionInitiateFailed =>
      'Nepavyko pradėti patvirtinimo. Pabandykite dar kartą.';

  @override
  String get connectionVerifyFailed =>
      'Nepavyko patvirtinti. Patikrinkite savo DNS įrašą ir pabandykite dar kartą.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Nepavyko pradėti Bluesky autorizacijos.';

  @override
  String get connectionUpdateFailed => 'Nepavyko atnaujinti jungties';

  @override
  String get connectionRemoveFailed => 'Nepavyko pašalinti jungties';

  @override
  String get connectionTokenSavedToast => 'Fluxer-verification įrašytas';

  @override
  String get connectionTokenSaveFailedToast => 'Nepavyko įrašyti failo';

  @override
  String get connectionEnterHandle => 'Įveskite „Bluesky“ vardą.';

  @override
  String get connectionEnterDomain => 'Įveskite domeną.';

  @override
  String get lookAndFeelTitle => 'Išvaizda';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Pasirinkite tamsią, anglies arba šviesią išvaizdą.';

  @override
  String get lookAndFeelThemeDark => 'Tamsi tema';

  @override
  String get lookAndFeelThemeCoal => 'Anglies tema';

  @override
  String get lookAndFeelThemeLight => 'Šviesi tema';

  @override
  String get lookAndFeelThemeSystem => 'Sistemos tema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sinchronizuoti temą visuose įrenginiuose';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Kai įjungta, temos pakeitimai bus sinchronizuojami su visais jūsų įrenginiais. Kai išjungta, šis įrenginys naudos savo temos nustatymą.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Sistemos tema automatiškai išjungia sinchronizavimą, kad būtų galima stebėti jūsų sistemos nuostatas šiame įrenginyje.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Nepavyko sinchronizuoti temos su jūsų paskyra. Pabandykite dar kartą.';

  @override
  String get lookAndFeelChatFontScalingTitle =>
      'Pokalbių šrifto dydžio keitimas';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Sureguliuokite šrifto dydį pokalbių srityje.';

  @override
  String get lookAndFeelInterfaceTitle => 'Sąsaja';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Tinkinkite sąsajos elementus ir elgseną.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Kanalų sąrašo rašymo indikatoriai';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Pasirinkite, kaip rašymo indikatoriai rodomi kanalo sąraše, kai kas nors rašo kanale.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Rašymo indikatorius + Avatarai';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Rodyti rašymo indikatorių su vartotojų avataromis kanalo sąraše';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Tik rašymo indikatorius';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Rodyti tik rašymo indikatorių be avatarų';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Paslėpta';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Nerodyti rašymo indikatorių kanalo sąraše';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Rodyti rašymą pasirinktame kanale';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Kai išjungta (numatyta), rašymo indikatoriai nebus rodomi kanale, kurį šiuo metu žiūrite.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'bendras';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Klaviatūros užuominos';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Valdykite, ar klaviatūros sparčiųjų klavišų užuominos rodomos įrankių patarimuose.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Slėpti klaviatūros užuominas įrankių patarimuose';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Kai įjungta, sparčiųjų klavišų ženkleliai paslėpti įrankių patarimų iššokančiuose languose.';

  @override
  String get lookAndFeelNekoTitle => 'Kita';

  @override
  String get lookAndFeelNekoDescription => 'Įvairūs sąsajos nustatymai.';

  @override
  String get lookAndFeelShowNekoLabel => 'Rodyti Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Kai įjungta, Neko pasirodo šalia pokalbių įvesties laukelio.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Balso kanalo prisijungimo elgsena';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Valdykite, kaip prisijungiate prie balso kanalų bendruomenėse.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Reikalauti dvigubo paspaudimo, norint prisijungti prie balso kanalų';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Kai įjungta, turėsite dukart spustelėti balso kanalus, kad prisijungtumėte prie jų. Kai išjungta (numatyta), vienas spustelėjimas iškart prisijungs prie kanalo.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Gudrusis lapinas peršoko tingų šunį.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Bendruomenės šoninė juosta';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigūruokite, kaip bendruomenės šoninė juosta rodo tiesioginius pranešimus.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count bendruomenės laikinai nepasiekiamos dėl srauto kondensatoriaus gedimo.',
      one:
          '1 bendruomenė laikinai nepasiekiama dėl srauto kondensatoriaus gedimo.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Suskleisti DM į aplanką';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Kai įjungta, neskaityti DM bendruomenės šoninėje juostoje suskleidžiami į aplanką „Fluxer“ mygtuke. Spustelėkite „Fluxer“ mygtuką, kai esate DM puslapyje, kad išskleistumėte arba suskleistumėte aplanką.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanalų sąrašas';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Valdykite neskaitytų pranešimų indikatorių elgseną nutildytuose kanaluose kanalų sąrašuose.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Rodyti neskaitytų pranešimų indikatorių nutildytuose kanaluose';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Kai įjungta, nutildytuose kanaluose kairėje pusėje rodomas išblukęs neskaitytų pranešimų indikatorius. Paminėjimai vis tiek rodomi nepriklausomai nuo šio nustatymo.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Dabar aktyvūs';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Valdykite, kaip „Dabar aktyvūs“ rodomi visoje programėlėje.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Rodyti „Dabar aktyvūs“ pagrindiniame puslapyje';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Rodyti „Dabar aktyvūs“ pagrindiniame puslapyje, kad būtų galima rasti draugus, aktyvius balso kanaluose. Pamatysite peržiūrą, kanalo kontekstą, kas jau yra, ir greitą būdą prisijungti.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Mėgstamiausi';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Valdykite mėgstamiausių matomumą visoje programėlėje.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Įjungti mėgstamiausius';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Kai įjungta, galite pažymėti kanalus kaip mėgstamiausius ir jie bus rodomi „Mėgstamiausių“ skiltyje. Kai išjungta, visi su mėgstamiausiais susiję UI elementai (mygtukai, meniu elementai) bus paslėpti. Jūsų esami mėgstamiausi bus išsaugoti.';

  @override
  String get favoritesTitle => 'Mėgstamiausi';

  @override
  String get favoritesEmptyTitle => 'Dar nėra mėgstamiausių';

  @override
  String get favoritesEmptyDescription =>
      'Pažymėkite kanalus iš pokalbių antraštės, kad jie būtų čia.';

  @override
  String get favoritesWelcomeTitle => 'Sveiki atvykę į parankinius';

  @override
  String get favoritesWelcomeDescription =>
      'Jūsų asmeninė erdvė greitai pasiekti mėgstamus kanalus, tiesioginius pranešimus ir grupes. Paspauskite žvaigždutę bet kuriame kanale, kad pridėtumėte jį čia.';

  @override
  String get favoritesWelcomeTip => 'Nereikia? Bet kada išjunkite.';

  @override
  String get favoritesDisableButton => 'Išjungti parankinius';

  @override
  String get favoritesAddedToast => 'Pridėta prie parankinių';

  @override
  String get favoritesRemovedToast => 'Pašalinta iš parankinių';

  @override
  String get favoritesHiddenToast => 'Parankiniai paslėpti';

  @override
  String get favoritesMute => 'Nutildyti parankinius';

  @override
  String get favoritesUnmute => 'Įjungti parankinių garsą';

  @override
  String get favoritesHeaderMenu => 'Parankinių meniu';

  @override
  String get favoritesCreateCategory => 'Sukurti kategoriją';

  @override
  String get favoritesCategoryNameLabel => 'Kategorijos pavadinimas';

  @override
  String get favoritesHideMutedChannels => 'Slėpti nutildytus kanalus';

  @override
  String get favoritesShowMutedChannels => 'Rodyti nutildytus kanalus';

  @override
  String get favoritesSetNickname => 'Nustatyti slapyvardį';

  @override
  String get favoritesNicknameLabel => 'Slapyvardis';

  @override
  String get favoritesSaveNickname => 'Išsaugoti slapyvardį';

  @override
  String get favoritesMoveToCategory => 'Perkelti į kategoriją';

  @override
  String get favoritesUncategorized => 'Nekategorizuoti';

  @override
  String get favoritesOtherCategory => 'Kita';

  @override
  String get favoritesRemoveFromFavorites => 'Pašalinti iš parankinių';

  @override
  String get favoritesAddToFavorites => 'Pridėti prie parankinių';

  @override
  String get favoritesHideConfirmTitle => 'Slėpti parankinius';

  @override
  String get favoritesHideConfirmDescription =>
      'Tai paslėps visus su parankiniais susijusius UI elementus, įskaitant mygtukus ir meniu elementus. Jūsų esami parankiniai bus išsaugoti ir bet kada galėsite juos vėl įjungti skiltyje Nustatymai > Išplėstiniai > Išvaizda.';

  @override
  String get favoritesDirectMessageSubtitle => 'Tiesioginis pranešimas';

  @override
  String get messagesMediaDisplayGroupTitle => 'Rodymas';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Valdykite, kaip rodomi pranešimai, medija ir kitas turinys.';

  @override
  String get messagesMediaMediaGroupTitle => 'Medija';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Tinkinkite medijos dydžio nuostatas ir mygtukus.';

  @override
  String get messagesMediaInputGroupTitle => 'Įvestis';

  @override
  String get messagesMediaInputGroupDescription =>
      'Tinkinkite pranešimų įvesties nuostatas.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Šoninė juosta';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigūruokite, kaip rodoma bendruomenės šoninė juosta.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Pagal numatytuosius nustatymus slėpti nutildytus kanalus';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automatiškai slėpti nutildytus kanalus šoninėje juostoje, kai prisijungiate prie naujų bendruomenių';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Pagal numatytuosius nustatymus slėpti nutildytus kanalus?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Naujose bendruomenėse, prie kurių prisijungsite, nutildyti kanalai bus automatiškai paslėpti. Ar norėtumėte taikyti šią nuostatą visoms esamoms bendruomenėms?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Nustoti slėpti nutildytus kanalus pagal numatytuosius nustatymus?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Naujose bendruomenėse, prie kurių prisijungsite, nutildyti kanalai nebebus automatiškai paslėpti. Ar norėtumėte rodyti nutildytus kanalus visose esamose bendruomenėse?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Taikyti visoms bendruomenėms';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Rodyti visose bendruomenėse';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Tik naujoms bendruomenėms';

  @override
  String get messagesMediaDisplaySectionTitle => 'Medijos rodymas';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Valdykite, kaip rodomi vaizdai, vaizdo įrašai ir kita medija. Visa medija yra pakeisto dydžio ir konvertuojama. Ypač dideli failai, kurių negalima suspausti į peržiūrą, nebus įterpti, nepaisant šių nuostatų.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Kai skelbiami kaip nuorodos į pokalbį';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Kai įkeliami tiesiogiai į Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Nuorodų peržiūros';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Valdykite, kaip svetainių nuorodos yra peržiūrimos pokalbyje';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Rodyti įterpinius ir peržiūrėti svetainių nuorodas';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakcijos';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfigūruoti jaustukų reakcijas į žinutes';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Rodyti jaustukų reakcijas į žinutes';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Paskelbtas turinys';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Valdyti, kaip rodomas paskelbtas turinys';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Rodyti paskelbtą turinį';

  @override
  String get messagesMediaSpoilersOnClickName => 'Spustelėjus';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Rodyti paskelbtą turinį spustelėjus';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Kanaluose, kuriuos moderuoju';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Visada rodyti paskelbtą turinį kanaluose, kuriuose turite leidimą „Tvarkyti žinutes“';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Visada';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Visada rodyti paskelbtą turinį';

  @override
  String get messagesMediaSizeSectionTitle => 'Medijos dydžio nuostatos';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Tinkinti didžiausią įterptos ir pridėtos medijos rodymo dydį. Mažesni dydžiai naudoja mažiau ekrano vietos, o didesni rodo daugiau detalių.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Medija iš nuorodų (įterptiniai)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Įkeltos pridėtinės';

  @override
  String get messagesMediaSizeCompactName => 'Kompaktiškas (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Mažesnis medijos dydis';

  @override
  String get messagesMediaSizeComfortableName => 'Patogus (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Didesnis medijos dydis su daugiau detalių';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF elgsena';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Valdyti, kaip GIF failai įterpiami į pokalbį';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automatiškai siųsti GIF failus pasirinkus';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Išraiškos automatinis užbaigimas (dvitaškio automatinis užbaigimas)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Valdykite, kas rodoma išraiškos automatinio užbaigimo laukelyje, kai rašote dvitaškį. Tinkinkite, kokie pasiūlymai rodomi, kad atitiktų jūsų nuostatas.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Rodyti numatytuosius jaustukus išraiškos automatinio užbaigimo laukelyje';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Rodyti pasirinktinius jaustukus išraiškos automatinio užbaigimo laukelyje';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Rodyti lipdukus išraiškos automatinio užbaigimo laukelyje';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Rodyti išsaugotą mediją išraiškos automatinio užbaigimo laukelyje';

  @override
  String get messagesMediaEditingSectionTitle => 'Žinučių redagavimas';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Valdykite, kas nutinka jūsų redagavimo juodraščiui, kai atšaukiate.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Išsaugoti redagavimo juodraštį atšaukus';

  @override
  String get accessibilitySaturationTitle => 'Spalvų sodrumas';

  @override
  String get accessibilitySaturationDescription =>
      'Reguliuokite programėlės temos spalvų sodrumą.';

  @override
  String get accessibilityUnreadGroupTitle => 'Neskaitytų indikatoriai';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Valdykite, kaip rodomi neskaitytų žinučių indikatoriai.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Rodyti išblukusį neskaityto indikatorių nutildytuose kanaluose';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Rodyti pritemdytą neskaityto indikatorių šalia nutildytų tiesioginių žinučių ir kanalų, kad vis tiek galėtumėte iš pirmo žvilgsnio matyti, ar yra aktyvumo.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Tiesioginių žinučių peržiūros';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Valdykite, kada tiesioginių žinučių sąraše rodomos žinučių peržiūros.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Tiesioginių žinučių peržiūros režimas';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Visos žinutės';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Rodyti žinučių peržiūras visoms tiesioginių žinučių pokalbiams';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Tik neskaitytos tiesioginės žinutės';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Rodyti žinučių peržiūras tik tiesioginėms žinutėms su neskaitytomis žinutėmis';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nėra';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Nėra žinučių peržiūrų tiesioginių žinučių sąraše';

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
  String get dmListSentAnAttachment => 'Nusiuntė priedą';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username prisegė žinutę šiame kanale.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username pridėjo $userName į grupę.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username pridėjo ką nors į grupę.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username paliko grupę.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username pašalino $userName iš grupės.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username pašalino ką nors iš grupės.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username pakeitė kanalo pavadinimą į $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username pakeitė kanalo pavadinimą.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username pakeitė kanalo piktogramą.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username pradėjo skambutį.';
  }

  @override
  String get systemCallJoinTheCall => 'Prisijungti prie skambučio';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username pradėjo skambutį, kuris truko $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Praleidote $username skambutį, kuris truko $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Praleistas $username skambutis.';
  }

  @override
  String get systemCallDurationFewSeconds => 'kelios sekundės';

  @override
  String get systemCallDurationMinute => 'minute';

  @override
  String get systemCallDurationOneYear => 'metus';

  @override
  String get systemCallDurationOneMonth => 'mėnesį';

  @override
  String get systemCallDurationOneWeek => 'savaitę';

  @override
  String get systemCallDurationOneDay => 'dieną';

  @override
  String get systemCallDurationOneHour => 'valandą';

  @override
  String systemCallDurationYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# metų',
      few: '# metus',
      one: '# metus',
    );
    return '$_temp0';
  }

  @override
  String systemCallDurationMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mėnesių',
      few: '# mėnesius',
      one: '# mėnesį',
    );
    return '$_temp0';
  }

  @override
  String systemCallDurationWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# savaičių',
      few: '# savaites',
      one: '# savaitę',
    );
    return '$_temp0';
  }

  @override
  String systemCallDurationDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# dienų',
      few: '# dienas',
      one: '# dieną',
    );
    return '$_temp0';
  }

  @override
  String systemCallDurationHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# valandų',
      few: '# valandas',
      one: '# valandą',
    );
    return '$_temp0';
  }

  @override
  String systemCallDurationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# minučių',
      few: '# minutes',
      one: '# minutę',
    );
    return '$_temp0';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Update $productName to view this message.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Balso ryšio patvirtinimas';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Jūs jau esate prisijungę prie šio balso kanalo iš $count kitų įrenginių. Ką norėtumėte daryti?',
      one:
          'Jūs jau esate prisijungę prie šio balso kanalo iš 1 kito įrenginio. Ką norėtumėte daryti?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Perjungti į šį įrenginį';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Tiesiog prisijungti (palikti kitus ryšius)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Nepadaryti nieko, nenoriu prisijungti';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Tai balso kanalas. Prisijunkite, kad pradėtumėte kalbėti!';

  @override
  String get voiceChannelJoin => 'Prisijungti prie balso kanalo';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Prisijungti prie balso';

  @override
  String get voiceChannelNoConnectPermission =>
      'Jūs neturite leidimo prisijungti prie šio balso kanalo';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofonas, kamera ir ekrano bendrinimo turinys yra šifruojami nuo galo iki galo.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofonas, kamera ir ekrano bendrinimo turinys yra šifruojami nuo galo iki galo.';

  @override
  String get voiceChannelE2eeBroken =>
      'Šifravimas nuo galo iki galo nepasiekiamas, nes šiame balso kanale yra nepalaikomas dalyvis.';

  @override
  String get voiceCallE2eeBroken =>
      'Šifravimas nuo galo iki galo nepasiekiamas, nes šiame skambutyje yra nepalaikomas dalyvis.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Šis klientas turi būti atnaujintas prieš prisijungiant prie šio šifruoto skambučio.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nepavyko paleisti mikrofono. Jūs vis dar esate skambutyje.';

  @override
  String get voiceChannelStatusConnecting => 'Jungiamasi...';

  @override
  String get voiceChannelStatusConnected => 'Prisijungta';

  @override
  String get voiceChannelStatusError => 'Klaida';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobilusis įrenginys';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Stalinis įrenginys';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Bendruomenės nutildytas';

  @override
  String get voiceParticipantTooltipMuted => 'Nutildytas';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Bendruomenės apkurdintas';

  @override
  String get voiceParticipantTooltipDeafened => 'Apkurdintas';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Ryšys: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dalyviai',
      one: '1 dalyvis',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Išeiti';

  @override
  String get voiceControlMute => 'Nutildyti';

  @override
  String get voiceControlUnmute => 'Įjungti garsą';

  @override
  String get voiceControlDeafen => 'Apkurdinti';

  @override
  String get voiceControlUndeafen => 'Atkurdinti';

  @override
  String get voiceControlVideo => 'Vaizdo įrašas';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Ekrano bendrinimas';

  @override
  String get voiceScreenShareNotificationText => 'Bendrinamas jūsų ekranas.';

  @override
  String get voiceControlMore => 'Daugiau';

  @override
  String get voiceControlDisconnect => 'Atjungti';

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
  String get voiceControlChat => 'Pokalbis';

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
  String get voiceTextChatShow => 'Rodyti pokalbį';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# neskaitytos žinutės',
      one: '# neskaityta žinutė',
    );
    return 'Rodyti pokalbį su $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Vaizdo įrašui reikalingas kameros leidimas.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nepavyko pradėti ekrano bendrinimo. Pabandykite dar kartą.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Ekrano bendrinimo leidimas buvo atmestas.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Ekrano bendrinimas nepasiekiamas šiame įrenginyje.';

  @override
  String get voiceWatchStream => 'Žiūrėti srautą';

  @override
  String get voiceStopWatching => 'Nustoti žiūrėti';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Nustoti žiūrėti dabartinį srautą';

  @override
  String get voiceOwnScreenShareTitle => 'Transliuojate';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Jūsų srautas dalyviams yra tiesiogiai.';

  @override
  String get voiceLiveBadge => 'TIESIOGIAI';

  @override
  String get dmVoiceViewCall => 'Peržiūrėti skambutį';

  @override
  String get dmVoiceCallFullScreen => 'Visas ekranas';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Atidaryti skambutį visame ekrane';

  @override
  String get dmVoiceStripStatusConnecting => 'Jungiamasi…';

  @override
  String get dmVoiceStripStatusInCall => 'Skambinama';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Balso skambutis';

  @override
  String get dmVoiceCallBarConnecting => 'Jungiamasi…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Tiesioginis skambutis';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Grupės skambutis';

  @override
  String get dmVoiceCallBarIssueFallback => 'Balso problema';

  @override
  String get dmVoiceFullscreenTitle => 'Garsas';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Balsas prijungtas';

  @override
  String get notificationsPageTitle => 'Pranešimai';

  @override
  String get notificationsFilterUnreads => 'Neskaityti';

  @override
  String get notificationsFilterMentions => 'Paminėjimai';

  @override
  String get notificationsBookmarksTooltip => 'Žymės';

  @override
  String get notificationsMentionFilterTooltip => 'Filtruoti paminėjimus';

  @override
  String get notificationsMentionFiltersTitle => 'Paminėjimų filtrai';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Įtraukti @everyone ir @here paminėjimus';

  @override
  String get notificationsMentionIncludeRoles =>
      'Įtraukti vaidmenų paminėjimus';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Įtraukti visus bendruomenės paminėjimus';

  @override
  String get notificationsNoUnreadTitle => 'Nėra neskaitytų žinučių';

  @override
  String get notificationsNoUnreadBody => 'Viską perskaitėte.';

  @override
  String get notificationsNoMentionsTitle => 'Nėra naujausių paminėjimų';

  @override
  String get notificationsNoMentionsBody =>
      'Visi jūsų paminėjimai čia bus rodomi 7 dienas.';

  @override
  String get notificationsMentionsEndTitle => 'Pasiekėte pabaigą';

  @override
  String get notificationsMentionsEndBody =>
      'Matėte visus naujausius paminėjimus. Nesijaudinkite, netrukus čia atsiras daugiau.';

  @override
  String get notificationsJump => 'Pereiti';

  @override
  String get notificationsRemoveMentionTooltip => 'Pašalinti paminėjimą';

  @override
  String get notificationsViewAllUnread => 'Peržiūrėti visus neskaitytus';

  @override
  String get notificationsMarkAsRead => 'Pažymėti kaip skaitytus';

  @override
  String get notificationsExpand => 'Plėsti';

  @override
  String get notificationsCollapse => 'Suskleisti';

  @override
  String get notificationsMessageUnavailable => 'Šios žinutės nepavyko įkelti.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining simbolių liko';
  }

  @override
  String get characterCounterTooLong => 'Žinutė per ilga';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining simbolių liko. Gaukite „$productName“, kad galėtumėte rašyti iki $premiumMaxLength simbolių.';
  }

  @override
  String get chatMessageFailedToSend => 'Nepavyko išsiųsti žinutės';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Jūsų žinutė negalėjo būti pristatyta. Paprastai taip nutinka, jei nesidalinate bendruomene su gavėju arba gavėjas priima tiesioginius pranešimus tik iš draugų. Taip pat gali tekti pakoreguoti savo tiesioginių pranešimų privatumo nustatymus skiltyje $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Jūsų žinutė negalėjo būti pristatyta. Turite susikurti paskyrą, kad galėtumėte siųsti tiesioginius pranešimus.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Jūsų žinutė negalėjo būti pristatyta. Turite susikurti paskyrą, kad galėtumėte siųsti žinutes.';

  @override
  String get chatSendFailureContentBlocked =>
      'Jūsų žinutė negalėjo būti pristatyta, nes ją aptiko mūsų saugos sistemos. Jei manote, kad tai klaida, susisiekite su palaikymo tarnyba.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Jūsų žinutė negalėjo būti pristatyta, nes joje yra suaugusiems skirtų jaustukų ar lipdukų, kurie neleidžiami šiame kontekste.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Šią žinutę matote tik jūs.';

  @override
  String get chatClientSystemDismiss => 'Atmesti';

  @override
  String get privacyDashboardCommunicationSection => 'Bendravimas';

  @override
  String get chatMessageDeleteFailed => 'Nepavyko ištrinti';

  @override
  String get chatMessageAddReaction => 'Pridėti reakciją';

  @override
  String get chatMessageEdit => 'Redaguoti žinutę';

  @override
  String get chatMessageReply => 'Atsakyti';

  @override
  String get chatMessageForward => 'Persiųsti';

  @override
  String get forwardMessageTitle => 'Persiųsti žinutę';

  @override
  String get forwardSearchHint => 'Ieškoti kanalų ar tiesioginių žinučių';

  @override
  String get forwardDirectMessagesSection => 'Tiesioginės žinutės';

  @override
  String get forwardCommentHint => 'Pridėti komentarą (pasirenkama)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Siųsti ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Kanalų nerasta';

  @override
  String get forwardSuccessToast => 'Žinutė persiųsta';

  @override
  String get forwardFailed => 'Nepavyko persiųsti žinutės';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Komentarai nepasiekiami, nes pasirinktame kanale įjungtas lėtasis režimas.';

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
      'Negalite čia siųsti žinučių';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Negalite čia įterpti nuorodų';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Negalite čia pridėti failų';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Žinučių siuntimas išjungtas šioje bendruomenėje';

  @override
  String get forwardDestinationTimedOut =>
      'Jums taikomas laiko apribojimas šioje bendruomenėje';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Lėtasis režimas – palaukite $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopijuoti žinutę';

  @override
  String get chatMessagePin => 'Smeigti žinutę';

  @override
  String get chatMessageUnpin => 'Atsegtį žinutę';

  @override
  String get chatMessageUnpinIt => 'Atsegtį';

  @override
  String get chatMessageBookmark => 'Pridėti žinutę į žymes';

  @override
  String get chatMessageRemoveBookmark => 'Pašalinti žymę';

  @override
  String get chatMessageMarkAsUnread => 'Pažymėti kaip neskaitytą';

  @override
  String get chatMessageCopyMessageLink => 'Kopijuoti žinutės nuorodą';

  @override
  String get chatMessageCopyMessageId => 'Kopijuoti žinutės ID';

  @override
  String get chatMessageViewReactions => 'Peržiūrėti reakcijas';

  @override
  String get chatMessageRemoveAllReactions => 'Pašalinti visas reakcijas';

  @override
  String get chatMessageDebug => 'Derinti žinutę';

  @override
  String get chatMessageDebugSheetTitle => 'Derinti žinutę';

  @override
  String get chatMessageDebugCopyJson => 'Kopijuoti JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Žinutės JSON nukopijuota į iškarpinę';

  @override
  String get chatReactionsSheetTitle => 'Reakcijos';

  @override
  String get chatReactionsSheetEmpty => 'Dar niekas nereagavo.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Pranešti apie žinutę';

  @override
  String get iarReportMessageTitle => 'Pranešti apie žinutę';

  @override
  String get iarThisUserFallback => 'šiam vartotojui';

  @override
  String get iarModalDescription =>
      'Pranešti apie taisyklių pažeidimą arba rasti įrankius, kaip tvarkyti kontaktus ir nuostatas.';

  @override
  String get iarPathStepAriaLabel => 'Ko jums reikia?';

  @override
  String get iarCategoryStepTitle => 'Kokios taisyklės buvo pažeistos?';

  @override
  String get iarReasonStepTitle => 'Kuri taisyklė buvo pažeista?';

  @override
  String get iarReasonSelectHint => 'Pasirinkite priežastį';

  @override
  String get iarPickAnOptionToast => 'Pasirinkite parinktį, kad tęstumėte.';

  @override
  String get iarPickARuleToast => 'Pasirinkite pažeistą taisyklę.';

  @override
  String get iarPathPlatform => 'Pranešti apie platformos taisyklių pažeidimą';

  @override
  String get iarPathCommunity => 'Pranešti šios bendruomenės moderatoriems';

  @override
  String get iarPathPreferenceMessage => 'Nepatinka šis turinys';

  @override
  String get iarCategoryTargetedHarmLabel => 'Grėsmės, priekabiavimas ar žala';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Prietabravimas, grasinimai, neapykanta, smurtas, reidai ar savęs žalojimo turinys.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Vaikų sauga ar suaugusiųjų turinys';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Vaiko saugai gresia pavojus, suaugusiųjų turinys netinkamoje vietoje ar nepageidaujamas elgesys.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privatumas ar tapatybės vagystė';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Asmens duomenų viešinimas, persekiojimas, apsimetinėjimas kažkuo ar netinkamas profilis.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Apgavystės, kenkėjiškos programos ar dezinformacija';

  @override
  String get iarCategoryDeceptionDescription =>
      'Fizinė apgavystė, sukčiavimas, kenkėjiškos nuorodos ar melagingi teiginiai, galintys sukelti realią žalą.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Neteisėta veikla ar kažkas kita';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Neteisėtas pardavimas, nusikaltimų palengvinimas ar akivaizdus taisyklių pažeidimas, netelpantis į ankstesnes kategorijas.';

  @override
  String get iarReasonHarassmentLabel => 'Priekabiavimas ar grasinimai';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Prietabravimas, nuolatinis nepageidaujamas kontaktas, persekiojimas ar tikslinė prievarta.';

  @override
  String get iarReasonHateLabel => 'Nekalbos';

  @override
  String get iarReasonHateMessageDescription =>
      'Įžeidimai, dehumanizuojanti kalba ar išpuoliai prieš saugomas grupes.';

  @override
  String get iarReasonViolenceLabel => 'Smurtas ar grasinimai smurtu';

  @override
  String get iarReasonViolenceDescription =>
      'Tikėtini grasinimai, grafinis smurtas ar smurto šlovinimas.';

  @override
  String get iarReasonMatureContentLabel =>
      'Suaugusiųjų turinys ar priekabiavimas';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Nepageidaujamas elgesys ar suaugusiųjų turinys netinkamoje vietoje.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Vaikų sauga ar nepilnamečių išnaudojimas';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Turinys, susijęs su vaikų viliojimu ar išnaudojimu.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Žalinga dezinformacija';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Melagingi teiginiai, galintys sukelti realią žalą.';

  @override
  String get iarReasonSpamLabel => 'Šlamštas, apgavystės ar sukčiavimas';

  @override
  String get iarReasonSpamMessageDescription =>
      'Masinis šlamštas, sukčiavimas, netikri dovanų dalijimai ar paskyros piktnaudžiavimas.';

  @override
  String get iarReasonMalwareLabel => 'Virusai arba pavojingos nuorodos';

  @override
  String get iarReasonMalwareDescription =>
      'Virusai, kredencialų vagystė arba kenkėjiški failai.';

  @override
  String get iarReasonPrivacyLabel => 'Privatumo pažeidimas';

  @override
  String get iarReasonPrivacyDescription =>
      'Asmens duomenų viešinimas, privačios informacijos atskleidimas arba persekiojimas.';

  @override
  String get iarReasonImpersonationLabel =>
      'Tapatybės vagystė arba apgaulinga medija';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Apsimetinėjimas esant kitu asmeniu, įskaitant apgaulingą dirbtinio intelekto sukurtą turinį.';

  @override
  String get iarReasonIllegalLabel => 'Neteisėta veikla';

  @override
  String get iarReasonIllegalDescription =>
      'Neteisėta prekyba, nusikaltimų palengvinimas arba neteisėta veikla.';

  @override
  String get iarReasonSelfHarmLabel => 'Savęs žalojimas arba savižudybė';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Savęs žalojimo ar mitybos sutrikimų skatinimas arba instrukcijos.';

  @override
  String get iarReasonOtherLabel => 'Kitas akivaizdus taisyklių pažeidimas';

  @override
  String get iarReasonOtherDescription =>
      'Naudokite tik jei akivaizdžiai pažeidžiamos Fluxer taisyklės ir tai netinka aukščiau.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Jei įtrauktas nepilnametis, vietoj to naudokite „$childSafetyReason“.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Jei tai susiję su CSAM arba nepilnamečio išnaudojimu, nedelsdami nusiųskite ir neatkurkite medžiagos.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Jei kas nors gali būti tiesioginiame pavojuje, jei galite saugiai, susisiekite su vietinėmis greitosios pagalbos tarnybomis.';

  @override
  String get iarSafetyNoteViolence =>
      'Jei tai yra patikimas neišvengiamas grasinimas, taip pat susisiekite su vietinėmis greitosios pagalbos tarnybomis.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Jei tai yra neišvengiamas teroristinis grasinimas, taip pat susisiekite su vietinėmis greitosios pagalbos tarnybomis.';

  @override
  String get iarActionBlockUserTitle => 'Blokuoti šį naudotoją';

  @override
  String get iarActionBlockUserDescription =>
      'Sustabdyti žinutes ir draugų užklausas.';

  @override
  String get iarActionBlockUserButton => 'Blokuoti';

  @override
  String get iarActionCopyMessageLinkTitle => 'Nukopijuoti žinutės nuorodą';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Bendrinti su bendruomenės moderatoriais.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopijuoti';

  @override
  String get iarActionCloseDmTitle => 'Uždaryti šį DM';

  @override
  String get iarActionCloseDmDescription =>
      'Neužblokuos. Galėsite atidaryti vėliau.';

  @override
  String get iarActionCloseDmButton => 'Uždaryti DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Palikti bendruomenę';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Nustokite matyti jos turinį ir narius.';

  @override
  String get iarActionLeaveCommunityButton => 'Palikti';

  @override
  String get iarActionDmSettingsTitle => 'DM ir draugų prašymų nustatymai';

  @override
  String get iarActionDmSettingsDescription =>
      'Pakeiskite, kas gali su jumis susisiekti.';

  @override
  String get iarActionCallSettingsTitle =>
      'Skambučių ir grupinių pokalbių nustatymai';

  @override
  String get iarActionCallSettingsDescription =>
      'Pakeiskite, kas gali jums skambinti arba pridėti jus.';

  @override
  String get iarActionOpenButton => 'Atidaryti';

  @override
  String get iarActionDeleteMessageTitle => 'Ištrinti šią žinutę';

  @override
  String get iarActionDeleteMessageDescription =>
      'Pašalinti ją iš kanalo visiems.';

  @override
  String get iarActionDeleteMessageButton => 'Ištrinti';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Ištrinta';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Ši žinutė jau buvo ištrinta.';

  @override
  String get iarActionBanUserTitle => 'Uždrausti šį vartotoją';

  @override
  String get iarActionBanUserDescription =>
      'Atidarykite draudimo dialogą šiai bendruomenei.';

  @override
  String get iarActionBanUserButton => 'Uždrausti';

  @override
  String get iarActionBanUserBannedButton => 'Uždraustas';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Šis vartotojas jau yra uždraustas šioje bendruomenėje.';

  @override
  String get iarCloseDmConfirmTitle => 'Uždaryti DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Uždarykite dabartinį DM su $name. Tai neužblokuos jo; galėsite atidaryti vėliau.';
  }

  @override
  String get iarSuccessTitle => 'Pranešimas išsiųstas';

  @override
  String get iarSuccessBody =>
      'Mūsų saugos komanda jį peržiūri. Kai tik priimsime sprendimą, atsiųsime jums DM ir el. laišką.';

  @override
  String get iarAlreadyReportedTitle => 'Jau pranešta';

  @override
  String get iarAlreadyReportedBody =>
      'Jūs jau pranešėte apie šią žinutę. Mūsų saugos komanda ją peržiūri.';

  @override
  String get iarBackButton => 'Atgal';

  @override
  String get iarContinueButton => 'Tęsti';

  @override
  String get iarSendReportButton => 'Siųsti pranešimą';

  @override
  String get iarDoneButton => 'Atlikta';

  @override
  String get iarCouldntSendToast =>
      'Nepavyko išsiųsti pranešimo. Pabandykite dar kartą.';

  @override
  String get iarRateLimitedToast =>
      'Siunčiate pranešimus per greitai. Palaukite akimirką ir pabandykite dar kartą.';

  @override
  String get iarReportSentToast =>
      'Pranešimas išsiųstas. Mūsų saugos komanda jį peržiūrės.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Užblokuoti $name? Jis negalės jums rašyti žinučių ar siųsti draugų prašymų. Vėliau galėsite jį atblokuoti.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Nepavyko užblokuoti šio vartotojo. Pabandykite dar kartą.';

  @override
  String get iarCloseDmSuccessToast => 'DM uždarytas.';

  @override
  String get iarCloseDmFailedToast =>
      'Nepavyko uždaryti šio DM. Pabandykite dar kartą.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Nepavyko palikti šios bendruomenės. Pabandykite dar kartą.';

  @override
  String get chatMessageSuppressEmbeds => 'Slėpti įterpinius';

  @override
  String get chatMessageUnsuppressEmbeds => 'Rodyti įterpinius';

  @override
  String get chatMessageDelete => 'Ištrinti žinutę';

  @override
  String get chatMessageDeleteConfirmTitle => 'Ištrinti žinutę';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Ar tikrai norite ištrinti šią žinutę?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Daugiau';

  @override
  String get chatEditingMessage => 'Redaguojama žinutė';

  @override
  String get chatReplyOriginalDeleted => 'Originali žinutė buvo ištrinta';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Nepavyko įkelti originalios žinutės';

  @override
  String get chatReplyAttachedMedia => 'Žinutėje yra pridėta medija';

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
  String get chatMessagesLoadError => 'Nepavyko įkelti žinučių.';

  @override
  String get chatReplyMentionOverrideTitle => 'Perrašyti paminėjimo nuostatą?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname pageidauja būti @paminėtas atsakymuose. Siųsti be paminėjimo vis tiek?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname pageidžia atsakymus be @paminėjimo. Siųsti su paminėjimu vis tiek?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignoruoti nuostatą';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Spustelėkite, kad išjungtumėte atsakomo asmens pinginimą.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Spustelėkite, kad įjungtumėte atsakomo asmens pinginimą.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Paminėti atsakytą vartotoją';

  @override
  String get chatReplyMentionOn => 'Įjungta';

  @override
  String get chatReplyMentionOff => 'Išjungta';

  @override
  String get chatReplyCancel => 'Atšaukti atsakymą';

  @override
  String get chatEditMessageHint => 'Redaguoti žinutę';

  @override
  String get chatEditNoChanges => 'Nėra pakeitimų, kuriuos reikia išsaugoti';

  @override
  String get chatChannelNotReady =>
      'Šis kanalas dar neparuoštas. Pabandykite dar kartą po akimirkos.';

  @override
  String get chatMessageEdited => '(redaguota)';

  @override
  String get chatMessageSilent => 'Tai buvo @silent žinutė.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Šiandien $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Vakar $time';
  }

  @override
  String get mediaViewerImagePreview => 'Vaizdo peržiūra';

  @override
  String get mediaViewerClose => 'Uždaryti medijos peržiūrą';

  @override
  String get mediaViewerOpenInBrowser => 'Atidaryti naršyklėje';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Persiųsti';

  @override
  String get mediaViewerZoomIn => 'Sumažinti vaizdą';

  @override
  String get mediaViewerZoomOut => 'Padidinti vaizdą';

  @override
  String get mediaViewerPreviousAttachment => 'Ankstesnis priedas';

  @override
  String get mediaViewerNextAttachment => 'Kitas priedas';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Perjungti vaizdo valdiklius';

  @override
  String get chatAttachmentVideoMute => 'Nutildyti vaizdo įrašą';

  @override
  String get chatAttachmentVideoUnmute => 'Įjungti vaizdo įrašo garsą';

  @override
  String get chatAttachmentVideoPlay => 'Leisti vaizdo įrašą';

  @override
  String get chatAttachmentVideoPause => 'Pristabdyti vaizdo įrašą';

  @override
  String get chatAttachmentVideoProgress => 'Vaizdo įrašo eiga';

  @override
  String get chatVideoPlaybackFailed => 'Nepavyko paleisti šio vaizdo įrašo.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Pranešti vartotojams su šiuo vaidmeniu, kurie turi leidimą peržiūrėti šį kanalą.';

  @override
  String get addGuildModalTitle => 'Pridėti bendruomenę';

  @override
  String get addGuildModalLandingDescription =>
      'Sukurkite naują bendruomenę arba prisijunkite prie esamos.';

  @override
  String get addGuildCreateCommunity => 'Sukurti bendruomenę';

  @override
  String get addGuildJoinCommunity => 'Prisijungti prie bendruomenės';

  @override
  String get addGuildImportDiscordTemplate => 'Importuoti Discord šabloną';

  @override
  String get addGuildJoinTitle => 'Prisijungti prie bendruomenės';

  @override
  String get addGuildJoinDescription =>
      'Įveskite kvietimo nuorodą, kad prisijungtumėte prie bendruomenės.';

  @override
  String get addGuildInviteLinkLabel => 'Kvietimo nuoroda';

  @override
  String get addGuildJoinSubmit => 'Prisijungti prie bendruomenės';

  @override
  String get addGuildInviteInvalid =>
      'Šis kvietimas negalioja arba baigėsi jo galiojimo laikas.';

  @override
  String get addGuildJoinFailed =>
      'Nepavyko prisijungti prie bendruomenės. Pabandykite dar kartą.';

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
  String get addGuildPackInstalled => 'Pakuotė sėkmingai įdiegta.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Pašalinti visas reakcijas';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Ar tikrai norite pašalinti visas reakcijas iš šios žinutės?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Atsegti žinutę';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Siųsti šią segtuką atgal į praeitį?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username prisegė $messageLink šiame kanale. Žr. $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'žinutę';

  @override
  String get systemPinMessageAllPinsLink => 'visas prisegtas žinutes';

  @override
  String get channelPinsEmptyTitle => 'Nėra prisegtų žinučių';

  @override
  String get channelPinsEmptyDescription =>
      'Prisegtos žinutės bus rodomos čia.';

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
  String get personalNotesTitle => 'Asmeninės pastabos';

  @override
  String get personalNotesSubtitle =>
      'Jūsų privati erdvė mintims ir priminimams';

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
    return 'Sveiki atvykę į $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Iš pradžių nebuvo nieko. Tada atsirado $channelName. Ir tai buvo gerai.';
  }

  @override
  String get personalNotesComposerHint => 'Rašykite sau';

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
  String get personalNotesPrivateSpace => 'Jūsų privati erdvė';

  @override
  String get purgePersonalNotes => 'Išvalyti asmenines pastabas';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Tai visam laikui ištrins kiekvieną žinutę ir priedą jūsų asmeninėse pastabose. To negalima atšaukti.';

  @override
  String get purgePersonalNotesConfirmButton => 'Išvalyti';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Iš jūsų asmeninių pastabų ištrinta $count žinučių';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Asmeninės pastabos jau buvo tuščios';

  @override
  String get purgePersonalNotesFailed => 'Nepavyko išvalyti asmeninių pastabų';

  @override
  String get userSettingsGroupYourAccount => 'JŪSŲ SĄSKAITA';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profilis';

  @override
  String get userSettingsNavSecurityLogin => 'Sauga ir prisijungimas';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Dovanos ir kodai';

  @override
  String get userSettingsNavPrivacyDashboard =>
      'Privatumo informacijos suvestinė';

  @override
  String get userSettingsNavAuthorizedApps => 'Įgaliotos programos';

  @override
  String get userSettingsNavBlockedUsers => 'Blokuoti vartotojai';

  @override
  String get userSettingsNavLinkedDevices => 'Susieti įrenginiai';

  @override
  String get userSettingsNavConnections => 'Prijungimai';

  @override
  String get userSettingsNavLookAndFeel => 'Išvaizda';

  @override
  String get userSettingsNavAccessibility => 'Prieinamumas';

  @override
  String get userSettingsNavChat => 'Žinutės ir medija';

  @override
  String get userSettingsNavAudioAndVideo => 'Garsas ir vaizdas';

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
  String get userSettingsNavLanguageAndTime => 'Kalba ir laikas';

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
  String get userSettingsNavAdvanced => 'Išplėstiniai nustatymai';

  @override
  String get advancedPerformanceReportingTitle => 'Našumo ataskaitos';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Padėkite tobulinti Fluxer, bendrindami anoniminius duomenis apie gedimus ir našumą.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Siųsti ataskaitas apie gedimus ir našumą';

  @override
  String get advancedPerformanceReportingDescription =>
      'Visi pranešti duomenys yra anonimiški ir siunčiami tik į Fluxer nuosavą stebėjimo tarnybą – nenaudojami jokie trečiųjų šalių paslaugų teikėjai.';

  @override
  String get userSettingsNavApplications => 'Programos';

  @override
  String get userSettingsNavAppLogs => 'Programos žurnalai';

  @override
  String get userSettingsNavDeveloperTools => 'Kūrėjo įrankiai';

  @override
  String get userSettingsNavLimitsConfig => 'Ribų konfigūracija';

  @override
  String get userSettingsNavFeatureFlags => 'Funkcijų vėliavėlės';

  @override
  String get userSettingsNavWhatsNew => 'Kas naujo';

  @override
  String get userSettingsNavLogOut => 'Atsijungti';

  @override
  String get quickSwitcherTabSearch => 'Ieškoti';

  @override
  String get quickSwitcherTabFriends => 'Draugai';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Ieškoti kanalų, žmonių ar bendruomenių';

  @override
  String get quickSwitcherSearchFriends => 'Ieškoti draugų';

  @override
  String get quickSwitcherNoMatchesFound => 'Nėra rezultatų';

  @override
  String get quickSwitcherEmptyHint =>
      'Pabandykite kitą pavadinimą arba naudokite prefiksus @ / # / ! / *, kad filtruotumėte rezultatus.';

  @override
  String get quickSwitcherSectionPeople => 'Žmonės';

  @override
  String get quickSwitcherSectionGroupMessages => 'Grupės žinutės';

  @override
  String get quickSwitcherSectionTextChannels => 'Teksto kanalai';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Balso kanalai';

  @override
  String get quickSwitcherSectionCommunities => 'Bendruomenės';

  @override
  String get quickSwitcherSectionSettings => 'Nustatymai';

  @override
  String get quickSwitcherHomeLabel => 'Pagrindinis';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Tiesioginės žinutės';

  @override
  String get quickSwitcherFavoritesLabel => 'Mėgstamiausi';

  @override
  String get quickSwitcherUserSettingsLabel => 'Vartotojo nustatymai';

  @override
  String get quickSwitcherNotificationsLabel => 'Pranešimai';

  @override
  String get quickSwitcherBookmarksLabel => 'Žymės';

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
  String get quickSwitcherMentionsLabel => 'Paminėjimai';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Dar neturi draugų';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Pridėkite draugą, kad pradėtumėte.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nėra draugų, atitinkančių paiešką';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Pabandykite kitą vardą.';

  @override
  String get quickSwitcherSearchAliasUser => 'Vartotojas';

  @override
  String get quickSwitcherSearchAliasYou => 'Jūs';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Žinutės';

  @override
  String get quickSwitcherSearchAliasFav => 'Mėgstamiausi';

  @override
  String get quickSwitcherSearchAliasStarred => 'Pažymėti';

  @override
  String get quickSwitcherSearchAliasInbox => 'Gauta';

  @override
  String get quickSwitcherSearchAliasSaved => 'Išsaugoti';

  @override
  String get uiClose => 'Uždaryti';

  @override
  String get chatJumpToBottom => 'Pereiti į apačią';

  @override
  String get uiConfirm => 'Patvirtinti';

  @override
  String get uiLoading => 'Įkeliama';

  @override
  String get uiUnsavedChanges => 'Neišsaugoti pakeitimai';

  @override
  String get uiReset => 'Atstatyti';

  @override
  String get uiOpenColorPicker => 'Atidaryti spalvų parinktuvę';

  @override
  String get uiSelectPlaceholder => 'Pasirinkti';

  @override
  String get uiSearchPlaceholder => 'Ieškoti';

  @override
  String get uiNoOptionsFound => 'Nėra parinkčių';

  @override
  String get uiDismissNotification => 'Atmesti pranešimą';

  @override
  String get uiColorPickerTitle => 'Spalvų parinktuvė';

  @override
  String get mentionConfirmTitle => 'Paminėti visus?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Tai praneš $count nariams. Tęsti?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Tai praneš $count prisijungusiems nariams. Tęsti?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Paminėti';

  @override
  String get composerEmojiUnavailable =>
      'Jūs negalite naudoti šio jaustuko čia.';

  @override
  String get instanceUrlLabel => 'Instance URL';

  @override
  String get instanceUrlPlaceholder =>
      'Įveskite instance URL (pvz., fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Atstatyti į Fluxer';

  @override
  String get instanceConnect => 'Prisijungti';

  @override
  String get instanceConnecting => 'Bandoma prisijungti…';

  @override
  String get instanceConnectFailed => 'Nepavyko prisijungti prie serverio';

  @override
  String get recentInstances => 'Neseniai naudoti serveriai';

  @override
  String removeRecentInstance(String domain) {
    return 'Pašalinti $domain iš neseniai naudotų serverių';
  }

  @override
  String get instanceSheetTitle => 'Prisijungti prie serverio';

  @override
  String get connectToDifferentInstance => 'Prisijungti prie kito serverio';

  @override
  String get changeInstance => 'Keisti';

  @override
  String get instanceConnectionRequired =>
      'Norint prisijungti, reikia prisijungti prie serverio';

  @override
  String get comingSoon => 'Netrukus';

  @override
  String get guildNavbarDirectMessages => 'Tiesioginiai pranešimai';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Naršyti bendruomenes';

  @override
  String get discoveryExplore => 'Naršyti';

  @override
  String get discoveryExplorePublicCommunities => 'Naršyti viešas bendruomenes';

  @override
  String get discoveryListingSubheading =>
      'Norite, kad jūsų bendruomenė būtų čia? Pateikite paraišką, jei atitinkate reikalavimus jūsų bendruomenės nustatymuose > Naršymas.';

  @override
  String get discoverySearchCommunities => 'Ieškoti bendruomenių';

  @override
  String get discoveryFilterByLanguage => 'Filtruoti pagal kalbą';

  @override
  String get discoveryAllLanguages => 'Visos kalbos';

  @override
  String get discoveryAllCategories => 'Visos';

  @override
  String get discoveryCategoryGaming => 'Žaidimai';

  @override
  String get discoveryCategoryMusic => 'Muzika';

  @override
  String get discoveryCategoryEntertainment => 'Pramogos';

  @override
  String get discoveryCategoryEducation => 'Švietimas';

  @override
  String get discoveryCategoryScienceAndTechnology =>
      'Mokslas ir technologijos';

  @override
  String get discoveryCategoryContentCreator => 'Turinio kūrėjai';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime ir manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmai ir TV';

  @override
  String get discoveryCategoryOther => 'Kita';

  @override
  String get discoveryNoCommunitiesMatch => 'Nėra atitinkančių bendruomenių.';

  @override
  String get discoveryJoinCommunity => 'Prisijungti prie bendruomenės';

  @override
  String get discoveryJoined => 'Prisijungta';

  @override
  String discoveryOnlineCount(String count) {
    return '$count prisijungę';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString narių',
      one: '1 narys',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Nėra aprašymo.';

  @override
  String get discoveryCommunities => 'Bendruomenės';

  @override
  String get discoveryApps => 'Programėlės';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Nepavyko prisijungti prie šios bendruomenės';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Įvyko klaida. Pabandykite dar kartą po akimirkos.';

  @override
  String get discoveryJoinErrorFullTitle => 'Ši bendruomenė pilna';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Ši bendruomenė pasiekė narių limitą, todėl šiuo metu negalite prisijungti.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Pasiekėte bendruomenių limitą';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Jūs esate maksimaliame bendruomenių skaičiuje. Palikite vieną ir bandykite dar kartą.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Negalite prisijungti prie šios bendruomenės';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Jums uždrausta dalyvauti šioje bendruomenėje.';

  @override
  String get discoveryJoinErrorNotAvailableTitle => 'Šios bendruomenės nebėra';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Ji galėjo išeiti iš naršymo arba išjungti naujus prisijungimus. Atnaujinkite puslapį ir daugiau jos nematysite.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Per greitai';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Palaukite akimirką ir bandykite dar kartą.';

  @override
  String get guildNavbarAddCommunity => 'Pridėti bendruomenę';

  @override
  String get guildNavbarHelp => 'Pagalba';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NAUJAS PRANEŠIMAS';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Suskleisti aplanką $folderName';
  }

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
  String get guildNavbarGroupDm => 'Grupinis DM';

  @override
  String get guildNavbarCreateChannel => 'Sukurti kanalą';

  @override
  String get guildNavbarChannelType => 'Kanalo tipas';

  @override
  String get guildNavbarTextChannel => 'Teksto kanalas';

  @override
  String get guildNavbarTextChannelDescription =>
      'Siųskite žinutes, vaizdus, GIF ir jaustukus';

  @override
  String get guildNavbarVoiceChannel => 'Balso kanalas';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Bendraukite balsu, vaizdo įrašais ir bendrinkite ekraną';

  @override
  String get guildNavbarLinkChannel => 'Nuorodos kanalas';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Greita prieiga prie išorinės svetainės ar išteklių';

  @override
  String get guildNavbarNameLabel => 'Vardas';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Sukurti kategoriją';

  @override
  String get guildNavbarNewCategoryHint => 'Nauja kategorija';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Pakviesti draugus į $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Gavėjai pateks į #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Ieškoti draugų';

  @override
  String get guildNavbarNoFriendsYet => 'Dar neturi draugų';

  @override
  String get guildNavbarNoResults => 'Nėra rezultatų';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Arba nusiųskite kvietimo nuorodą draugui:';

  @override
  String get guildNavbarInviteLink => 'Kvietimo nuoroda';

  @override
  String get guildNavbarCopy => 'Kopijuoti';

  @override
  String get guildNavbarCopied => 'Nukopijuota!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Jūsų kvietimo nuoroda baigiasi po 7 dienų.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Ši kvietimo nuoroda niekada nesibaigs.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Jūsų kvietimo nuoroda baigsis po $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Redaguoti kvietimo nuorodą';

  @override
  String get guildNavbarInviteLinkSettings => 'Kvietimo nuorodos nustatymai';

  @override
  String get guildNavbarExpireAfter => 'Baigiasi po';

  @override
  String get guildNavbarMaxUses => 'Maksimalus naudojimo skaičius';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Suteikti laikino narystės';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Nariai bus pašalinti, kai išeis iš prisijungimo, nebent bus priskirtas vaidmuo';

  @override
  String get guildNavbarCreateNewLink => 'Sukurti naują nuorodą';

  @override
  String get guildNavbarSent => 'Nusiųsta';

  @override
  String get guildNavbarInvite => 'Kviesti';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Palikti bendruomenę';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Ar tikrai norite palikti šią bendruomenę? Jūs nebegalėsite matyti jokių žinučių.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Palikti bendruomenę';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Ištrinti jūsų žinutes šioje bendruomenėje?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Visam laikui ištrinkite kiekvieną jūsų čia išsiųstą žinutę, visuose kanaluose. Negalima atšaukti.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Ištrinti mano žinutes';

  @override
  String get guildNavbarDeletedYourMessages => 'Ištrynėte jūsų žinutes';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Nepavyko ištrinti jūsų žinučių';

  @override
  String get guildNavbarRemoveOverride => 'Pašalinti pakeitimą';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Nutildyta iki $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Pasiekiama tik Fluxer darbuotojams';

  @override
  String get guildNavbarInvitesPaused =>
      'Kvietimai šiuo metu šioje bendruomenėje sustabdyti';

  @override
  String get guildNavbarDurationNever => 'niekada';

  @override
  String get guildNavbarDuration30Minutes => '30 minučių';

  @override
  String get guildNavbarDuration1Hour => '1 valanda';

  @override
  String get guildNavbarDuration6Hours => '6 valandos';

  @override
  String get guildNavbarDuration12Hours => '12 valandos';

  @override
  String get guildNavbarDuration1Day => '1 diena';

  @override
  String get guildNavbarDuration7Days => '7 dienos';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekundžių';
  }

  @override
  String get guildNavbarNever => 'Niekada';

  @override
  String get guildNavbarNoLimit => 'Nėra limito';

  @override
  String get guildNavbarOneUse => '1 panaudojimas';

  @override
  String guildNavbarUses(int count) {
    return '$count panaudojimų';
  }

  @override
  String get guildMenuMarkAsRead => 'Pažymėti kaip perskaitytus';

  @override
  String get guildPeekMoreOptions => 'Daugiau parinkčių';

  @override
  String get guildMenuInviteMembers => 'Pakviesti narius';

  @override
  String get guildMenuCommunitySettings => 'Bendruomenės nustatymai';

  @override
  String get guildMenuEditCommunityProfile => 'Redaguoti bendruomenės profilį';

  @override
  String get guildMenuUnmuteCommunity => 'Atšaukti bendruomenės nutildymą';

  @override
  String get guildMenuMuteCommunity => 'Nutildyti bendruomenę';

  @override
  String get guildMenuHideMutedChannels => 'Slėpti nutildytus kanalus';

  @override
  String get guildMenuReportCommunity => 'Pranešti apie bendruomenę';

  @override
  String get guildMenuDebugCommunity => 'Derinti bendruomenę';

  @override
  String get guildMenuCopyCommunityId => 'Kopijuoti bendruomenės ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Iki $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Pagrindiniai';

  @override
  String get guildMenuSettingsRoles => 'Vaidmenys ir leidimai';

  @override
  String get guildMenuSettingsEmoji => 'Pasirinktiniai jaustukai';

  @override
  String get guildMenuSettingsStickers => 'Pasirinktinės lipdukės';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sauga ir moderavimas';

  @override
  String get guildMenuSettingsActivityLog => 'Veiklos žurnalas';

  @override
  String get guildMenuSettingsWebhooks => 'Webhookai';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'Pasirinktinė kvietimo nuoroda';

  @override
  String get guildMenuSettingsDiscovery => 'Atradimas';

  @override
  String get guildMenuSettingsMembers => 'Nariai';

  @override
  String get guildMenuSettingsInviteLinks => 'Kvietimo nuorodos';

  @override
  String get guildMenuSettingsBans => 'Uždrausti nariai';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Neturite leidimo peržiūrėti šio nustatymų skirtuko.';

  @override
  String get guildSettingsOverviewIconTitle => 'Piktograma';

  @override
  String get guildSettingsUploadImage => 'Įkelti vaizdą';

  @override
  String get guildSettingsOverviewBannerTitle => 'Baneris';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Įkelkite banerį savo serveriui.';

  @override
  String get guildSettingsOverviewNameTitle => 'Pavadinimas';

  @override
  String get guildSettingsOverviewNameHint => 'Mano šauni bendruomenė';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistika';

  @override
  String get guildSettingsOverviewMembers => 'Nariai';

  @override
  String get guildSettingsOverviewOnline => 'Prisijungę';

  @override
  String get guildSettingsRolesDescription =>
      'Naudokite vaidmenis nariams grupuoti ir priskirti leidimus.';

  @override
  String get guildSettingsCreateRole => 'Sukurti vaidmenį';

  @override
  String get guildSettingsRolesListTitle => 'Vaidmenys';

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
    return 'Naudoti $staticCount statinių, $animatedCount animuotų jaustukų lizdai';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Dar nėra pasirinktinių jaustukų.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return 'Įkelta $count lipdukės';
  }

  @override
  String get guildSettingsStickersEmpty => 'Dar nėra pasirinktinių lipdukų.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Nario patvirtinimas';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Pasirinkite, ką nariai turi turėti prieš galėdami skelbti arba siųsti tiesioginius pranešimus bendruomenės nariams.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Nariai su vaidmenimis gali apeiti šiuos patikrinimus. Viešose erdvėse rekomenduojame įjungti patikrinimą.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Bendruomenės, įtrauktos į „Discovery“, reikalauja bent patvirtinto el. pašto. Negalima pasirinkti „None“, kai „Discovery“ yra įjungta.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Brandus turinys ir turinio įspėjimai';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigūruokite brandaus turinio žymėjimą ir pasirenkamus turinio įspėjimus nariams.';

  @override
  String get guildSettingsModerationMatureToggle => 'Brandus turinys';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Pažymėkite šią bendruomenę kaip turinčią brandaus turinio.';

  @override
  String get guildSettingsVerificationNone => 'Nėra';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nėra reikalingas joks patikrinimas.';

  @override
  String get guildSettingsVerificationLow => 'Žemas';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Reikalingas patvirtintas el. pašto adresas.';

  @override
  String get guildSettingsVerificationMedium => 'Vidutinis';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Reikalingas patvirtintas el. pašto adresas ir paskyra, kuri yra bent 5 minučių senumo.';

  @override
  String get guildSettingsVerificationHigh => 'Aukštas';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Reikalingas viskas, kas yra vidutiniame lygyje, plius buvimas bendruomenės nariu bent 10 minučių.';

  @override
  String get guildSettingsVerificationHighest => 'Labai aukštas';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Reikalingas patvirtintas telefono numeris.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Stebėkite moderatorių veiksmus visoje bendruomenėje.';

  @override
  String get guildSettingsAuditLogEmpty => 'Dar nėra žurnalų';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Čia bus rodomi moderavimo veiksmai ir bendruomenės pakeitimai.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Visi vartotojai';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Visi veiksmai';

  @override
  String get guildSettingsAuditLogNoReason => 'Priežastis nenurodyta.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Nežinomas vartotojas';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Įkeliant veiklos žurnalą įvyko klaida.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Nepavyko įkelti veiklos žurnalų';

  @override
  String get guildSettingsAuditLogReason => 'Priežastis';

  @override
  String get guildSettingsAuditLogSomeone => 'kažkas';

  @override
  String get guildSettingsAuditLogSomething => 'kažkas';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'nežinomas subjektas';

  @override
  String get guildSettingsAuditLogNothing => 'nieko';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Nežinomas tikslas';

  @override
  String get auditLogActionGuildUpdate => 'Bendruomenė atnaujinta';

  @override
  String get auditLogActionChannelCreate => 'Kanalas sukurtas';

  @override
  String get auditLogActionChannelUpdate => 'Kanalas atnaujintas';

  @override
  String get auditLogActionChannelDelete => 'Kanalas ištrintas';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanalo perrašymas pridėtas';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanalo perrašymas atnaujintas';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanalo perrašymas pašalintas';

  @override
  String get auditLogActionMemberKick => 'Narys pašalintas';

  @override
  String get auditLogActionMemberPrune => 'Nariai pašalinti';

  @override
  String get auditLogActionMemberBanAdd => 'Narys užblokuotas';

  @override
  String get auditLogActionMemberBanRemove => 'Narys atblokuotas';

  @override
  String get auditLogActionMemberUpdate => 'Narys atnaujintas';

  @override
  String get auditLogActionMemberRoleUpdate => 'Nario vaidmenys atnaujinti';

  @override
  String get auditLogActionMemberMove => 'Narys perkeltas';

  @override
  String get auditLogActionMemberDisconnect => 'Narys atjungtas';

  @override
  String get auditLogActionBotAdd => 'Botas pridėtas';

  @override
  String get auditLogActionRoleCreate => 'Vaidmuo sukurtas';

  @override
  String get auditLogActionRoleUpdate => 'Vaidmuo atnaujintas';

  @override
  String get auditLogActionRoleDelete => 'Rolė ištrinta';

  @override
  String get auditLogActionInviteCreate => 'Kvietimas sukurtas';

  @override
  String get auditLogActionInviteUpdate => 'Kvietimas atnaujintas';

  @override
  String get auditLogActionInviteDelete => 'Kvietimas ištrintas';

  @override
  String get auditLogActionWebhookCreate => 'Webhook sukurtas';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook atnaujintas';

  @override
  String get auditLogActionWebhookDelete => 'Webhook ištrintas';

  @override
  String get auditLogActionEmojiCreate => 'Emoji sukurtas';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji atnaujintas';

  @override
  String get auditLogActionEmojiDelete => 'Emoji ištrintas';

  @override
  String get auditLogActionStickerCreate => 'Lipdukas sukurtas';

  @override
  String get auditLogActionStickerUpdate => 'Lipdukas atnaujintas';

  @override
  String get auditLogActionStickerDelete => 'Lipdukas ištrintas';

  @override
  String get auditLogActionMessageDelete => 'Pranešimas ištrintas';

  @override
  String get auditLogActionMessageBulkDelete => 'Pranešimai ištrinti';

  @override
  String get auditLogActionMessagePin => 'Pranešimas prisegtas';

  @override
  String get auditLogActionMessageUnpin => 'Pranešimas atsegta';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor atnaujino bendruomenės nustatymus.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor sukūrė kanalą $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor atnaujino kanalą $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor ištrynė kanalą $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor pridėjo kanalo leidimus $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor pridėjo kanalo leidimus $target kanale $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor atnaujino kanalo leidimus $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor atnaujino kanalo leidimus $target kanale $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor pašalino kanalo leidimus $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor pašalino kanalo leidimus $target kanale $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor išmetė $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor uždraudė $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor panaikino draudimą $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor atnaujino $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor atnaujino vaidmenis $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor pašalino neaktyvius narius.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor pašalino narius, neaktyvius $days dienas.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor perkėlė $target į kitą balso kanalą.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor perkėlė $target į $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor atjungė $target nuo balso.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor pridėjo botą $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor sukūrė vaidmenį $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor atnaujino vaidmenį $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor ištrynė vaidmenį $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor sukūrė kvietimą $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor sukūrė kvietimą $target kanalui $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor atnaujino kvietimą $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor atnaujino kvietimą $target kanalui $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor ištrynė kvietimą $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ištrynė kvietimą $target kanalui $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor sukūrė webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor atnaujino webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor ištrynė webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor pridėjo jaustuką $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor atnaujino jaustuką $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor ištrynė jaustuką $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor pridėjo lipduką $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor atnaujino lipduką $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor ištrynė lipduką $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor ištrynė žinutę.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor ištrynė žinutę kanale $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor ištrynė kelias žinutes.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor ištrynė $count žinutes.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor ištrynė kelias žinutes kanale $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor ištrynė $count žinutes kanale $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor prisegė žinutę.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor prisegė žinutę kanale $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor atsegė žinutę.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor atsegė žinutę kanale $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor atliko auditą $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Atnaujinta $field iš $oldValue į $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Nustatyta $field į $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Panaikinta $field (buvo $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Atnaujinta $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Bendruomenė pervadinta į $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Bendruomenės piktograma atnaujinta.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Kanalas pervadintas į $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Tema panaikinta.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Tema atnaujinta į $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Suaugusiųjų turinys įjungtas.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Suaugusiųjų turinys išjungtas.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Nustatytas slapyvardis $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Slapyvardis $nickname pašalintas.';
  }

  @override
  String get auditLogChangeMutedMember => 'Narys nutildytas.';

  @override
  String get auditLogChangeUnmutedMember => 'Narys atnutildytas.';

  @override
  String get auditLogChangeDeafenedMember => 'Narys apkurdintas.';

  @override
  String get auditLogChangeUndeafenedMember => 'Narys neatkurdintas.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Pridėta $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Pašalinta $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanalas: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Žinutė: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Pakvietė $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ištrinta # žinučių.',
      one: 'Ištrinta # žinutė.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pašalinti # nariai.',
      one: 'Pašalintas # narys.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Šis kvietimas niekada nepasibaigs.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Suteikia laikinus narystės teises.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Suteikia nuolatinius narystės teises.';

  @override
  String get guildSettingsLoadMore => 'Įkelti daugiau';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Tvarkykite webhookus, kurie siunčia žinutes į kanalus.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nėra sukonfigūruotų webhookų.';

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
  String get guildSettingsCopyUrl => 'Kopijuoti URL';

  @override
  String get guildSettingsCopiedUrl => 'URL nukopijuotas į iškarpinę';

  @override
  String get guildSettingsDeleteWebhook => 'Ištrinti webhooką';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Nustatykite pasirinktinę kvietimo nuorodą savo serveriui.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Įrašyti';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Naudojimas';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count naudojimo kartų';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Taikykitės, kad būtumėte įtraukti į serverių paiešką.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Norint taikytis, reikia bent $count narių.';
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
  String get guildSettingsDiscoveryDescriptionField => 'Aprašymas';

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
  String get guildSettingsDiscoveryTags => 'Žymos';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'žaidimai, menas, muzika';

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
  String get guildSettingsDiscoveryApply => 'Pateikti paraišką';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Atšaukti';

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
      'Ieškokite ir tvarkykite serverio narius.';

  @override
  String get guildSettingsMembersSearchHint => 'Ieškoti narių';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count narių';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Peržiūrėkite ir atšaukite aktyvias kvietimo nuorodas.';

  @override
  String get guildSettingsInvitesEmpty => 'Nėra aktyvių kvietimų.';

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
    return '$uses / $maxUses naudojimo kartų';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Baigiasi $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Peržiūrėkite ir tvarkykite užblokuotus vartotojus.';

  @override
  String get guildSettingsBansSearchHint => 'Ieškoti banų';

  @override
  String get guildSettingsBansEmpty => 'Nėra užblokuotų vartotojų.';

  @override
  String get guildSettingsBanPermanent => 'Nuolatinis banas';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Baigiasi $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Baigiasi';

  @override
  String get guildSettingsUnban => 'Atblokuoti';

  @override
  String get guildSettingsBansLoading => 'Įkeliami užblokuoti vartotojai';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Pagal jūsų paiešką banų nerasta.';

  @override
  String get guildSettingsBanDetailsTitle => 'Banų detalės';

  @override
  String get guildSettingsBanViewDetails => 'Peržiūrėti detales';

  @override
  String get guildSettingsBannedOn => 'Užblokuota';

  @override
  String get guildSettingsBannedBy => 'Užblokavo';

  @override
  String get guildSettingsRevokeBanTitle => 'Atšaukti baną';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Ar tikrai norite atšaukti $displayName baną? Jis galės vėl prisijungti prie bendruomenės.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Atšauktas $displayName banas';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Nepavyko įkelti banų. Pabandykite dar kartą.';

  @override
  String get guildSettingsRevokeBanError =>
      'Nepavyko atšaukti baną. Pabandykite dar kartą.';

  @override
  String get guildSettingsCommunitySettings => 'Bendruomenės nustatymai';

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
      'Tvarkykite savo bendruomenės profilį, kanalus ir numatytuosius nustatymus.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Prekės ženklas';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Atnaujinkite savo piktogramą, pavadinimą, reklamjuostę ir kvietimo foną';

  @override
  String get guildSettingsOverviewBannerUpload => 'Įkelti reklamjuostę';

  @override
  String get guildSettingsOverviewIdleTitle => 'Neaktyvumo nustatymai';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfigūruokite AFK kanalą ir laiko intervalą';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistema ir sveikinimas';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Pasirinkite sistemos ir sveikinimo pranešimų paskirties vietą';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Numatytieji pranešimai';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Bendruomenėse, turinčiose daugiau nei 250 žmonių, priverstinai nustatoma parinktis „tik paminėjimai“. Jūsų originalus nustatymas išlieka ir bus atkurtas, jei bendruomenės narių skaičius sumažės iki 250.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Išplėstiniai nustatymai';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Leisti lanksčius teksto kanalų pavadinimus';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Slėpti bendruomenės savininko karūną';

  @override
  String get guildSettingsOverviewDetachedBanner =>
      'Atskirtas reklaminis skydelis';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Rodo reklaminį skydelį atskirame skyriuje po bendruomenės antrašte.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Įkelti piktogramą';

  @override
  String get guildSettingsOverviewRemoveImage => 'Pašalinti';

  @override
  String get guildSettingsOverviewSplashTitle => 'Kvietimo fonas';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Pokalbio įterpimo fonas';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Rodo įterpimuose pokalbiuose.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Įkelti foną';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Nėra bendruomenės reklaminio skydelio';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Nėra kvietimo fono';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Peržiūra';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Pažiūrėkite, kaip jūsų kvietimas atrodo lankytojams.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Teksto kanalų pavadinimai';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Bendruomenės savininko karūna';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Nustatykite, ar šalia bendruomenės savininko bus rodoma karūnos piktograma';

  @override
  String get guildSettingsSplashCardAlignment => 'Kortelės lygiuotė';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centras';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Kairė';

  @override
  String get guildSettingsSplashAlignmentRight => 'Dešinė';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Taikoma tik plačiuose ekranuose.';

  @override
  String get permissionReadMessageHistory => 'Skaityti žinučių istoriją';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Pakeisti, ką gali matyti vartotojai be \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Naudokite skirtą modalo langą, kad nustatytumėte žinučių istorijos ribos datą nariams, neturintiems $permission leidimo.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Atidaryti žinučių istorijos ribą';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Žinučių istorijos riba';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Įjungti žinučių istorijos ribą';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Ribinė data';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Nariai be leidimo Skaityti žinučių istoriją gali matyti po šios datos siųstas žinutes.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Žinučių istorijos riba atnaujinta';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Leisti didžiąsias raides ir tarpus teksto kanalų pavadinimuose. Išjungus, pavadinimai apribojami mažosiomis raidėmis su brūkšneliais ir pabraukimais.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Savininko karūnos piktograma bus paslėpta visose vietose.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animuotoms piktogramoms reikia „Animated Icon“ bendruomenės funkcijos.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animuotiems reklaminiams skydeliams reikia „Animated Banner“ bendruomenės funkcijos.';

  @override
  String get guildSettingsAfkChannel => 'AFK / neaktyvus kanalas';

  @override
  String get guildSettingsAfkChannelHint =>
      'Perkelti narius į šį kanalą, kai jie yra AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Nėra AFK kanalo';

  @override
  String get guildSettingsAfkTimeout => 'AFK laikas';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minutė';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minutės';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minučių';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minučių';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 valanda';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekundžių';
  }

  @override
  String get guildSettingsSystemChannel => 'Paskirties kanalas';

  @override
  String get guildSettingsSystemChannelHint =>
      'Sveikinimo ir sistemos žinutės bus rodomos čia.';

  @override
  String get guildSettingsNoSystemChannel => 'Nėra sistemos kanalo';

  @override
  String get guildSettingsHideJoinMessages => 'Slėpti prisijungimo žinutes';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Sutrikdo prisijungimo žinutes tiksliniame kanale.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Numatytieji pranešimų nustatymai';

  @override
  String get guildSettingsNotificationsAll => 'Visos žinutės';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Gauti pranešimus apie visas žinutes';

  @override
  String get guildSettingsNotificationsMentions => 'Tik paminėjimai';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Gauti pranešimus tik apie paminėjimus';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks. 10 MB. Minimalus: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks. 10 MB. Minimalus: 960×540px (16:9). Rodyti kvietimų įterpimuose pokalbiuose.';

  @override
  String get guildSettingsModerationDescription =>
      'Konfigūruokite patvirtinimo, turinio filtravimo ir suaugusiųjų turinio nustatymus.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Bendruomenėms, įtrauktoms į „Discovery“, taikomi apriboti moderavimo nustatymai.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Turinio filtravimas';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automatiškai tikrinti žinutes dėl nepageidaujamo turinio kanaluose, nepažymėtuose kaip skirti suaugusiems.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Bendruomenėms, įtrauktoms į „Discovery“, privaloma tikrinti visus narius. Šio nustatymo negalima pakeisti, kai įjungtas „Discovery“.';

  @override
  String get guildSettingsContentFilterOff => 'Išjungta';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Leisti bendruomenei savarankiškai moderuoti';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtruoti narius be vaidmenų';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Rekomenduojama daugumai bendruomenių';

  @override
  String get guildSettingsContentFilterAll => 'Filtruoti visus';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Didžiausia apsauga šeimai draugiškose erdvėse';

  @override
  String get guildSettingsModerationMatureOff => 'Išjungta';

  @override
  String get guildSettingsModerationMatureOn => 'Įjungta';

  @override
  String get guildSettingsContentWarningToggle => 'Rodyti turinio įspėjimą';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Įjungia sutikimo raginimą prieš įeinant į bet kurį kanalą.';

  @override
  String get guildSettingsContentWarningText =>
      'Pasirinktinis įspėjimo tekstas';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Čia yra neskelbtino turinio.';

  @override
  String get guildSettingsModeration2faTitle => '2FA reikalavimas';

  @override
  String get guildSettingsModeration2faDescription =>
      'Reikalauti dviejų veiksnių autentifikavimo iš moderatorių prieš jiems leidžiant blokuoti, šalinti, laikinai stabdyti ar naikinti žinutes.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Reikalauti 2FA moderavimo veiksmams';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Tik bendruomenės savininkas gali pakeisti šį nustatymą';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Įjunkite 2FA savo paskyroje, kad pakeistumėte šį nustatymą';

  @override
  String get guildSettingsEmojiSearchHint => 'Ieškoti jaustukų';

  @override
  String get guildSettingsEmojiUploadTitle => 'Įkelti jaustuką';

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
    return 'Neanimuoti jaustukai ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animuoti jaustukai ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Ieškoti lipdukų';

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
    return 'Kurkite webhookus iš kanalo nustatymų. Redaguokite juos čia.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Jūsų pasirinktinis URL neveiks, nebent bent vienas kanalas bus matomas visiems.';

  @override
  String get guildSettingsVanityUrlRemove => 'Pašalinti';

  @override
  String get guildSettingsBannedUsersTitle => 'Užblokuoti vartotojai';

  @override
  String get guildSettingsInvitesTableInviter => 'Kvietėjas';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanalas';

  @override
  String get guildSettingsInvitesTableCode => 'Kodas';

  @override
  String get guildSettingsInvitesTableUses => 'Naudojimai';

  @override
  String get guildSettingsInvitesTableCreated => 'Sukurta';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Naujausi pirmiausia';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtruoti pagal vartotoją';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtruoti pagal veiksmą';

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
