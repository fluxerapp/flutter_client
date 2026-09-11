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
      'Sistemoje kilo problemų.\nNetrukus turėtų būti ištaisyta!';

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
  String get nagbarLearnMore => 'Sužinoti daugiau';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Techninė priežiūra numatyta $localizedTime. Numatoma trukmė: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Vyksta techninė priežiūra. Numatoma trukmė: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Techninė priežiūra baigta.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Sveiki, $displayName, susikurkite paskyrą, kad neprarastumėte prieigos.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Sveiki, $displayName, patvirtinkite savo el. pašto adresą.';
  }

  @override
  String get nagbarOpenSettings => 'Atidaryti nustatymus';

  @override
  String get systemPermissionSettingsTitle => 'Įgalinti leidimą';

  @override
  String get systemPermissionSettingsOpenSettings => 'Atidaryti nustatymus';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName neturi prieigos prie jūsų mikrofono. Galite jį įjungti savo įrenginio privatumo nustatymuose.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName neturi prieigos prie jūsų kameros. Galite ją įjungti savo įrenginio privatumo nustatymuose.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName neturi prieigos prie jūsų nuotraukų bibliotekos. Galite ją įjungti įrenginio privatumo nustatymuose.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName neturi leidimo siųsti pranešimų. Galite jį įjungti savo įrenginio nustatymuose.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Jūsų prenumerata nebuvo atnaujinta, bet vis dar turite prieigą prie $productName privalumų iki $graceDate. Imkitės veiksmų dabar, kitaip prarasite visus privalumus.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Jūsų „$productName“ prenumerata baigėsi. Atnaujinkite dabar, kad išsaugotumėte privalumus.';
  }

  @override
  String get nagbarManageSubscription => 'Tvarkyti prenumeratą';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Sveiki atvykę į $productFullName. Naršykite savo $productName privalumus ir tvarkykite savo prenumeratą.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Peržiūrėkite „$productName“ funkcijas';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Jūsų dovanų saugykloje laukia naujas dovanos kodas.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Jūsų dovanų saugykloje laukia $count nauji dovanų kodai.';
  }

  @override
  String get nagbarViewGiftInventory => 'Peržiūrėti dovanų atsargas';

  @override
  String get nagbarVisionaryMfa =>
      'Įjunkite dviejų veiksnių autentifikavimą, kad apsaugotumėte savo „Visionary“ paskyrą.';

  @override
  String get nagbarEnableMfa => 'Įjungti 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Atnaujinome mūsų sąlygas. Peržiūrėkite jas ir sutikite, kad galėtumėte tęsti.';

  @override
  String get nagbarReviewTerms => 'Peržiūrėti terminus';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Prisijunkite prie „$communityName\", kad galėtumėte bendrauti su komanda ir gauti naujausią informaciją.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Prisijungti prie „$communityName\"';
  }

  @override
  String get nagbarPushNotification =>
      'Įjunkite pranešimus, kad nepraleistumėte žinučių ir paminėjimų.';

  @override
  String get nagbarEnableNotifications => 'Įjungti pranešimus';

  @override
  String get nagbarBillingPortalFailed =>
      'Nepavyko atidaryti atsiskaitymo portalo. Pabandykite dar kartą po akimirkos.';

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
  String get next => 'Kitas';

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
  String get registerPendingApproval =>
      'Jūsų paskyros užklausa laukia patvirtinimo. Prisijungti galėsite, kai administratorius ją patvirtins.';

  @override
  String get registerClosed =>
      'Registracija šiuo metu uždaryta. Norėdami sukurti paskyrą, naudokite administratoriaus suteiktą registracijos nuorodą.';

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
  String get errorServiceUnavailable =>
      'Ši instancija laikinai nepasiekiama. Pabandykite dar kartą po akimirkos.';

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
  String get embedInviteJoinGroup => 'Prisijungti prie grupės';

  @override
  String get embedInviteAlreadyJoined => 'Jau prisijungta';

  @override
  String get embedInviteDisabled => 'Kvietimai išjungti';

  @override
  String get embedInvitePaused => 'Kvietimai šiai bendruomenei pristabdyti.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName aptiko galimą ataką, todėl nauji vartotojai šiuo metu negali prisijungti.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Ši bendruomenė pristabdė kvietimus. Galite bandyti dar kartą vėliau.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName aptiko galimą ataką šioje bendruomenėje. Kvietimai pristabdyti, todėl nauji vartotojai šiuo metu negali prisijungti.';
  }

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
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (visam laikui $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dienų $productName',
      one: '1 diena $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count savaitės $productName',
      one: '1 savaitė $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mėnesių $productName',
      one: '1 mėnuo $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metai $productName',
      one: '1 metai $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Nuo $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Spustelėkite, kad atsiimtumėte dovaną!';

  @override
  String get embedGiftAlreadyRedeemed => 'Jau išpirkta';

  @override
  String get embedGiftClaimAccountHelp =>
      'Prisijunkite prie paskyros, kad atsiimtumėte šią dovaną.';

  @override
  String get embedGiftClaim => 'Atsiimti dovaną';

  @override
  String get embedGiftClaimed => 'Dovana atsiimta';

  @override
  String get embedGiftClaimAccount =>
      'Norėdami išpirkti, prisijunkite prie paskyros';

  @override
  String get embedGiftUnknownTitle => 'Nežinoma dovana';

  @override
  String get embedGiftUnknownSubtitle =>
      'Šis dovanos kodas neteisingas arba jau panaudotas.';

  @override
  String get embedGiftUnavailable => 'Dovana nepasiekiama';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Gaukite savo dovaną, kad suaktyvintumėte „$productName“ prenumeratą!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Ši dovana jau atsiimta.';

  @override
  String get giftAcceptMaybeLater => 'Galbūt vėliau';

  @override
  String get giftRedeemedToast => 'Dovana išpirkta!';

  @override
  String get giftRedeemInvalidTitle => 'Neteisingas dovanos kodas';

  @override
  String get giftRedeemInvalidMessage =>
      'Šis kodas neteisingas arba jau panaudotas.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Dovana jau išpirkta';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Šis kodas jau buvo panaudotas.';

  @override
  String get giftRedeemNotFoundTitle => 'Dovanos nerasta';

  @override
  String get giftRedeemNotFoundMessage => 'Šio kodo nėra.';

  @override
  String get giftRedeemFailedTitle => 'Nepavyko panaudoti dovanos';

  @override
  String get giftRedeemFailedMessage =>
      'Nepavyko išpirkti šios dovanos. Bandykite dar kartą.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Nepavyksta panaudoti šios dovanos';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      '„Visionary“ paskyros negali išpirkti „Plutonium“ dovanų. Vietoj to nukopijuokite nuorodą, kad pasidalintumėte ją su draugu.';

  @override
  String get giftCopyLink => 'Kopijuoti dovanos nuorodą';

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
  String get notificationUseCategoryDefault =>
      'Naudoti numatytuosius kategorijos nustatymus';

  @override
  String get notificationUseCommunityDefault =>
      'Naudoti bendruomenės numatytuosius nustatymus';

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
  String get dmDeleteMyMessagesTitle =>
      'Ištrinti jūsų žinutes šiame pokalbyje?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Tai visam laikui ištrins visas žinutes, kurias kada nors išsiuntėte šiame pokalbyje. Šio veiksmo anuliuoti negalima.';

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
  String get addFriendVerifyToSend =>
      'Prieš siųsdami draugystės užklausas, patvirtinkite savo el. pašto adresą.';

  @override
  String get addFriendFriendsListFull =>
      'Jūsų arba jų draugų sąrašas yra pilnas. Pašalinkite ką nors ir bandykite dar kartą.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'Tai numatytasis „$productName\" jaustukas.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Ši piktograma yra iš šios bendruomenės. Galite ja naudotis visur.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Tai bendruomenės sukurtas jaustukas.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Tai pasirinktinis jaustukas iš bendruomenės. Norėdami naudoti šį jaustuką, paprašykite autoriaus pakvietimo.';

  @override
  String get emojiInfoFromHeader => 'Ši piktograma yra iš';

  @override
  String get emojiInfoDiscoverableCommunity => 'Atrandama bendruomenė';

  @override
  String get emojiInfoPrivateCommunity => 'Privati bendruomenė';

  @override
  String get emojiInfoVerifiedCommunity => 'Patvirtinta bendruomenė';

  @override
  String get emojiInfoAddToFavorites => 'Pridėti prie mėgstamiausių';

  @override
  String get emojiInfoRemoveFromFavorites => 'Pašalinti iš mėgstamiausių';

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
  String get gifPickerFavoritesEmptyTitle => 'Kol kas nėra mėgstamų GIF';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Pažymėkite GIF, kad pamatytumėte jį čia.';

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
  String externalLinkWarningLeaving(String productName) {
    return 'Jūs ketinate išeiti iš $productName';
  }

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
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Pakeisti jūsų Vartotojo vardas';

  @override
  String get fluxerTagInputLabel => 'Vartotojo vardas';

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
  String get fluxerTagAlreadyTaken => 'Vartotojo vardas jau užimtas';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Vartotojo vardas $username#$discriminator jau užimtas. Tęsiant jūsų diskriminatorius bus automatiškai perskirstytas.';
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
      'Jei išsaugosite šį Vartotojo vardas, jūsų pasirinktinė 4 skaitmenų žyma grįš prie atsitiktinio numerio pasibaigus jūsų Plutonium prenumeratai. Jei jūsų prenumerata nebus atnaujinta, turėsite 3 dienų malonės periodą prieš žymos pakeitimą.';

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
  String get fluxerTagUpdated => 'Vartotojo vardas atnaujintas';

  @override
  String get fluxerTagUpdateFailed =>
      'Nepavyko atnaujinti Vartotojo vardas. Pabandykite dar kartą.';

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
      'Patvirtinkite savo paskyrą, kad pakeistumėte savo Vartotojo vardas';

  @override
  String get changeFluxerTag => 'Pakeisti Vartotojo vardas';

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
  String profilePreviewMemberSince(String productName) {
    return '$productName narys nuo';
  }

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'Tvarkykite el. pašto adresą, kurį naudojate prisijungdami prie $productName';
  }

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
      'Atsiųsime SMS kodą, kai jis bus pasiekiamas. Jūsų numeris nėra susietas su paskyra. Mes saugome tik užšifruotą žymę be vartotojo ID, kad leistume ne daugiau kaip 2 patvirtinimus maždaug per 30 dienų.';

  @override
  String get phoneAddSendCode => 'Siųsti kodą';

  @override
  String get phoneVerifyTitle => 'Patvirtinti telefono numerį';

  @override
  String get phoneVerifyDescription =>
      'Įveskite patvirtinimo kodą, išsiųstą jūsų telefono numeriu.';

  @override
  String get phoneAddSuccess => 'Telefono numeris patvirtintas';

  @override
  String get phoneCountryLabel => 'Šalis';

  @override
  String get phoneSearchCountries => 'Ieškoti šalių...';

  @override
  String get phoneNumberRequired => 'Reikalingas telefono numeris';

  @override
  String get phoneEnterValidNumber =>
      'Įveskite galiojantį mobiliojo telefono numerį.';

  @override
  String get phoneCannotBeUsed =>
      'Šio telefono numerio negalima naudoti. Bandykite kitą mobiliojo telefono numerį arba susisiekite su palaikymo komanda.';

  @override
  String get phoneAlreadyUsed =>
      'Šis telefono numeris jau buvo naudotas. Bandykite kitą numerį arba susisiekite su palaikymo komanda.';

  @override
  String get phoneCodeDidNotWork =>
      'Šis kodas netiko. Patikrinkite jį ir bandykite dar kartą.';

  @override
  String get phoneTooManyAttempts =>
      'Per daug bandymų. Šiek tiek palaukite ir bandykite dar kartą.';

  @override
  String get phoneSmsUnavailable =>
      'Šiuo metu SMS patvirtinimas nepasiekiamas. Bandykite dar kartą vėliau arba susisiekite su palaikymo komanda.';

  @override
  String get phoneNotEligible =>
      'Telefono numerio patvirtinimas šiai paskyrai negalimas. Naudokite kitą metodą arba susisiekite su palaikymo komanda.';

  @override
  String get phoneCaptchaRequired =>
      'Prieš patvirtinant telefono numerį, reikalingas naršyklės patikrinimas. Bandykite dar kartą prisijungimo puslapyje arba susisiekite su palaikymo komanda.';

  @override
  String get phoneSomethingWentWrong => 'Kažkas nepavyko. Bandykite dar kartą.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Siųsti SMS į šį telefono numerį yra per brangu, todėl prašome, kad Jūs atsiųstumėte mums SMS. Taip pat galite susisiekti su palaikymo tarnyba, kad šis reikalavimas būtų panaikintas Jūsų paskyroje.';

  @override
  String get phoneInboundDefaultDescription =>
      'Turime gauti jūsų SMS žinutę, kad patvirtintume jūsų telefono numerį.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Atidarykite telefono pranešimų programėlę ir sukurkite naują tekstinį pranešimą.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Siųskite kodą $code numeriu $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Palaukite, kol gausime jūsų žinutę. Tai gali užtrukti minutę.';

  @override
  String get phoneInboundGetNewCode => 'Gauti naują kodą';

  @override
  String get phoneInboundChallengeCodeLabel => 'Kodas, kurį reikia išsiųsti';

  @override
  String get phoneInboundOurNumberLabel => 'Siųsti į';

  @override
  String get requiredActionTitle => 'Reikalingas paskyros patvirtinimas';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Norėdami toliau naudotis \"$productName\", atlikite reikiamą patvirtinimą.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Prieš tęsiant, jūsų registracijai reikalingas papildomas apsaugos nuo brukalų patikrinimas.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Norėdami toliau naudotis \"$productName\", patvirtinkite savo el. paštą arba telefono numerį.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Kad galėtumėte toliau naudotis \"$productName\", atlikite toliau nurodytus el. pašto ir telefono patvirtinimo veiksmus.';
  }

  @override
  String get requiredActionChooseMethodTitle =>
      'Pasirinkite patvirtinimo metodą';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Norėdami toliau naudotis \"$productName\", atlikite vieną iš toliau nurodytų patvirtinimo veiksmų.';
  }

  @override
  String get requiredActionUseEmail => 'Naudoti el. paštą';

  @override
  String get requiredActionUsePhone => 'Naudoti telefoną';

  @override
  String get requiredActionCheckEmailTitle => 'Patikrinkite savo el. paštą';

  @override
  String get requiredActionCheckEmailDescription =>
      'Atsidarykite savo el. paštą ir spustelėkite gautą patvirtinimo nuorodą, kad tęstumėte.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Siųsti patvirtinimo el. laišką iš naujo';

  @override
  String get requiredActionVerificationEmailSent =>
      'Patvirtinimo el. laiškas išsiųstas. Patikrinkite gautuosius.';

  @override
  String get requiredActionSignOut => 'Atsijungti';

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
  String get networkErrorMessage =>
      'Panašu, kad kilo problemų. Pabandykite dar kartą.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prieš $count savaites',
      one: 'prieš 1 savaitę',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'po $count minučių',
      one: 'po 1 minutės',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'po $count valandų',
      one: 'po 1 valandos',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'po $count dienų',
      one: 'po 1 dienos',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'po $count savaičių',
      one: 'po savaitės',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'po $count mėnesių',
      one: 'po 1 mėnesio',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'po $count metų',
      one: 'po 1 metų',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'Ką tik';

  @override
  String get authorizedAppsTitle => 'Įgaliotos programos';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Šioms programoms buvo suteikta prieiga prie jūsų $productName paskyros.';
  }

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
  String get blockedUsersCopyTag => 'Kopijuoti Vartotojo vardas';

  @override
  String get blockedUsersCopyId => 'Kopijuoti vartotojo ID';

  @override
  String get userProfileLoadError => 'Nepavyko įkelti profilio';

  @override
  String get userProfileLoading => 'Įkeliamas profilis';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName personalas';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName bendruomenės komanda';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName partneris';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName Bug Hunter';
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
    return '$productName Plutonium prenumerata nuo $date';
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
    return '$productName Visionary nuo $date';
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
  String get userProfileRoles => 'Pareigos';

  @override
  String get memberRoleAdd => 'Pridėti vaidmenį';

  @override
  String memberRoleRemove(String roleName) {
    return 'Pašalinti vaidmenį \"$roleName\"';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Šis vartotojas neturi vaidmenų šioje bendruomenėje.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Dar nėra vaidmenų. Pridėkite vaidmenų čia: $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Nėra vaidmenų';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Šiuo metu šioje bendruomenėje nėra vaidmenų, kuriuos būtų galima priskirti, tačiau naują vaidmenį galite sukurti čia: $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Bendruomenės nustatymai';

  @override
  String get guildSettingsRolesTab => 'Rolės';

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
  String get iarReportGuildTitle => 'Pranešti apie bendruomenę';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Jei šis pranešimas yra apie konkretų pranešimą šioje bendruomenėje, praneškite apie tą pranešimą. Pranešimų ataskaitos suteikia mūsų saugos komandai aiškiausią kontekstą, o išsamesnės informacijos pridėjimas komentaruose gali padėti mums greičiau peržiūrėti. Tęskite pranešimą apie bendruomenę tik tuo atveju, jei pranešimas apie pranešimą neapimtų platesnės problemos.';

  @override
  String get iarContinueToReportCommunity => 'Tęsti bendruomenės pranešimą';

  @override
  String get iarPreviewCommunitySubtitle => 'Bendruomenė';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Priekabiavimas ar tikslinis piktnaudžiavimas';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Bendruomenė skatina užsipuldinėjimus arba tikslinį piktnaudžiavimą.';

  @override
  String get iarReasonHateGuildDescription =>
      'Skatina neapykantą saugomoms grupėms.';

  @override
  String get iarReasonTerrorismLabel =>
      'Terorizmas arba smurtinis ekstremizmas';

  @override
  String get iarReasonTerrorismDescription =>
      'Propaguoja, verbuoja ar koordinuoja smurtinį ekstremistinį aktyvumą.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Suaugusiesiems skirtas turinys arba nesaugus turinio filtravimas';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Brandus turinys be tinkamo filtravimo.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Kelia pavojų nepilnamečiams arba talpina vaikų išnaudojimo turinį.';

  @override
  String get iarReasonRaidLabel => 'Reidų koordinavimas';

  @override
  String get iarReasonRaidDescription =>
      'Koordinuoja reidus, brigadas ar priekabiavimą prieš asmenis ar bendruomenes.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Bendruomenė skirta platformai šiukšlinti, sukčiauti ar ja piktnaudžiauti.';

  @override
  String get iarReasonMalwareGuildLabel =>
      'Kenksmingos programinės įrangos platinimas';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Platina kenkėjiškas programas, kredencialų vagystes ar žalingus failus.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Privatumo pažeidimas arba asmens duomenų atskleidimas';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Bendrina asmeninę informaciją, persekioja naudotojus arba koordinuoja privatumo pažeidimus.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Skatina žalotis';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Skatina savižudybę, žalojimąsi ar valgymo sutrikimus.';

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
  String get slowmodeStatusEnabled => 'Lėtasis režimas įjungtas';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Lėtasis režimas aktyvus ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Nustatytas lėtasis režimas – $durationLabel, bet jūs jo nepaisote.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Nustatytas lėtasis režimas – $durationLabel. Palaukite prieš siųsdami kitą pranešimą.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Šiame kanale nustatytas lėtasis režimas – $durationLabel.';
  }

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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName viršija dydžio limitą ($fileSize)';
  }

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
      'Laikykite, kad įrašytumėte. Vilkite į šiukšlinę, kad ištrintumėte, slinkite aukštyn, kad užfiksuotumėte, arba atleiskite, kad išsiųstumėte.';

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
  String get voiceMessageSeekForward => 'Pirmyn';

  @override
  String get voiceMessageSeekBackward => 'Atšaukti';

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
  String get chatAttachmentDownloadedToast => 'Įrašyta į nuotraukas';

  @override
  String get chatAttachmentDownloadFailedToast => 'Nepavyko atsisiųsti priedo';

  @override
  String get chatAttachmentExpiredTooltip => 'Priedas pasibaigęs';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rodyti ($count eilutės)',
      one: 'Rodyti ($count eilutė)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Suskleisti ($count eilutės)',
      one: 'Suskleisti ($count eilutė)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rodyti ($count eilutės)',
      one: 'Rodyti ($count eilutė)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count eilutės',
      one: '$count eilutė',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (likusios $count eilutės)',
      one: '... (likusi $count eilutė)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (liko $count eilučių)',
      one: '... (liko $count eilutė)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Peržiūrėti visą failą';

  @override
  String get chatTextualPreviewChangeLanguage => 'Keisti kalbą';

  @override
  String get chatTextualPreviewSearchLanguage => 'Ieškoti kalbos…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Sintaksės paryškinimas';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Nieko nerasta';

  @override
  String get chatTextualPreviewMoreOptions => 'Daugiau parinkčių';

  @override
  String get chatTextualPreviewWrapText => 'Perkelti tekstą į kitą eilutę';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Failas per didelis, kad būtų rodoma peržiūra (limitas $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Nepavyko įkelti peržiūros.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Paprastas tekstas';

  @override
  String get chatTextualPreviewCopy => 'Kopijuoti';

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
  String connectionsDescription(String productName) {
    return 'Susiekite išorinius paskyras ir domenus su savo $productName profiliu. Patvirtinti ryšiai bus rodomi jūsų profilyje, kad kiti galėtų juos matyti.';
  }

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
  String get lookAndFeelHdrSectionTitle => 'Didelis dinaminis diapazonas';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Valdykite, kaip HDR vaizdai rodomi HDR palaikančiuose monitoriuose.';

  @override
  String get lookAndFeelHdrFullName => 'Visas dinaminis diapazonas';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Rodyti HDR vaizdus visu ryškumu ir spalvų diapazonu.';

  @override
  String get lookAndFeelHdrStandardName => 'Standartinis diapazonas';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Tonuoti HDR vaizdus į standartinį diapazoną, sumažinant didžiausią ryškumą.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Didelio dinaminio diapazono ekrano režimas';

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
  String get lookAndFeelChatFontScalingTitle => 'Pokalbių šrifto dydis';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Sureguliuokite šrifto dydį pokalbių srityje.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Pokalbių šrifto dydis';

  @override
  String get lookAndFeelAppZoomTitle => 'Programėlės mastelio lygis';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Koreguoti programėlės mastelio lygį.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Pokalbio fonas';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Pasirinkite pokalbio foną. Jis liks šiame įrenginyje.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Šis nustatymas lieka šiame įrenginyje';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Pokalbio fono paveikslėlis išsaugotas tik šiame įrenginyje ir nesinchronizuojamas su kitais įrenginiais.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Numatytasis';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Pasirinktinis vaizdas';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Spalva $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradientas $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Pritemdinti fono paveikslėlį';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Nepavyko nustatyti šio vaizdo kaip jūsų fono paveikslėlio.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Žinutės';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Pasirinkite, kaip pranešimai rodomi pokalbių kanaluose.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Tarpas tarp žinučių grupių';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Pranešimų rodymo režimas';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Patogus';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Erdvus išdėstymas su aiškiu vizualiniu atskyrimu tarp žinučių.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Tankus';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Padidina matomų pranešimų skaičių su minimaliais tarpais.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Slėpti naudotojų avatarus';

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
  String get communityTemporarilyUnavailable =>
      'Bendruomenė laikinai nepasiekiama';

  @override
  String get guildUnavailableDescription => 'Kažkas ne taip. Jau taisome.';

  @override
  String get guildNotFoundTitle => 'Tai ne ta bendruomenė, kurios ieškote.';

  @override
  String get guildNotFoundDescription =>
      'Ieškoma bendruomenė galėjo būti ištrinta arba neturite prieigos prie jos.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName šiuo metu prieinama tik $productName darbuotojams';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => '(laikinai nepasiekiama)';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Suskleisti DM į aplanką';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Kai įjungta, neskaityti DM bendruomenės šoninėje juostoje suskleidžiami į aplanką „$productName“ mygtuke. Spustelėkite „$productName“ mygtuką, kai esate DM puslapyje, kad išskleistumėte arba suskleistumėte aplanką.';
  }

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
  String get favoritesAddToSavedMedia => 'Įtraukti į išsaugotą mediją';

  @override
  String get favoritesRemoveFromSavedMedia => 'Paimkite iš išsaugotos medijos';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Pridėti prie URL GIF mėgstamiausių';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Pašalinti iš URL nuorodomis saugomų GIF failų sąrašo';

  @override
  String get savedMediaAddTitle => 'Įtraukti į išsaugotą mediją';

  @override
  String get savedMediaFormNameLabel => 'Pavadinimas';

  @override
  String get savedMediaFormNameHint => 'Mano nuostabi medija';

  @override
  String get savedMediaFormAltTextLabel => 'Alternatyvusis tekstas';

  @override
  String get savedMediaFormAltTextHint => 'Aprašykite mediją';

  @override
  String get savedMediaFormTagsLabel => 'Žymos';

  @override
  String get savedMediaFormTagsHint => 'juokinga, reakcija, darbas';

  @override
  String get savedMediaSaveError => 'Nepavyko atnaujinti išsaugotos medijos.';

  @override
  String get savedMediaNameRequired => 'Būtina nurodyti pavadinimą.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Kaip turėtume išsaugoti jūsų mėgstamus GIF?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Galite išsaugoti pažymėtus GIF kaip mėgstamiausius tik URL arba įkelti juos į išsaugotą mediją. Pasirinkite tai, kas tinka jūsų naudojimo būdui. Bet kada galite pakeisti tai skiltyje Nustatymai > Papildomi > Medija.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL tikri mėgstamiausi (numatytasis): sinchronizuojami visuose jūsų įrenginiuose, neįkeliami, neskaičiuojami į išsaugotą laikmeną. Originali laikmena gali dingti, jei jos priegloba ją pašalins.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Išsaugota medija: įkelta, galima žymėti, ieškoti ir nuolatinė, tačiau įskaitoma į jūsų išsaugotos medijos limitą.';

  @override
  String get gifFavoriteFirstTimeHint => 'Klausiame tik kartą.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Naudoti tik URL (rekomenduojama)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Naudoti išsaugotą mediją';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Kai įkeliami tiesiogiai į $productName';
  }

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
  String get messagesMediaCameraUploadsSectionTitle =>
      'Nuotraukų iš kameros įkėlimas';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Pasirinkite, ar nuotraukos ir vaizdo įrašai, padaryti naudojant programos kamerą, bus saugomi jūsų įrenginyje';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Įrašyti į įrenginį';

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
  String get accessibilityVisualGroupTitle => 'Vaizdas';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Visada pabraukti nuorodas';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Paryškinti perbrauktą tekstą';

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
  String get accessibilityScreenReaderGroupTitle => 'Ekrano skaitytuvas';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Valdykite, kaip $productName veikia su ekrano skaitytuvais.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Skelbti naujus pranešimus';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Leisti ekrano skaitytuvams pranešti apie naujas žinutes, kai jos gaunamos atidarytame kanale. Pranešimų garsai nepaveikiami.';

  @override
  String get accessibilityTtsGroupTitle => 'Tekstas į kalbą';

  @override
  String get accessibilityTtsGroupDescription =>
      'Pasirinkite greitį, kuriuo bus skaitomas tekstas.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Kalbos atkūrimo greitis';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Paleisti pavyzdį';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Tylos pavyzdys';

  @override
  String get accessibilityPreviewButtonLabel => 'Peržiūros mygtukas';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Taip atrodo nuorodų peržiūra: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Peržiūros vartotojas';

  @override
  String get accessibilityKeyboardGroupTitle => 'Klaviatūra';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Rodyti fokusavimo žiedą pokalbio teksto laukelyje';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'klavišas \"Esc\" išeina iš klaviatūros režimo';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Rodyti kontekstinio meniu nuorodas';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Patvirtinti prieš pradedant skambučius';

  @override
  String get accessibilityAnimationGroupTitle => 'Animacija';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Sumažintas judesys įjungtas, todėl turinio animacijos pagal numatytuosius nustatymus yra pristabdytos. Vis tiek galite jas vėl įjungti, kad jos būtų rodomos.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Leisti animuotus jaustukus';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'Automatiškai leisti GIF';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Automatiškai leisti GIF, kai \"$productName\" yra sufokusuotas';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Leidžiama, nepaisant sumažinto judesio.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pristabdyta dėl sumažinto judesio. Įjunkite, kad animuoti jaustukai būtų rodomi.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Pristabdyta dėl sumažinto judesio. Įjunkite, kad GIF failai būtų leidžiami.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Numatytoji reikšmė mobiliajame įrenginyje yra išjungta, siekiant taupyti baterijos energiją ir duomenų naudojimą.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Lipdukų animacijos';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Lipdukų animacijos nuostatos';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Visada animuoti';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Lipdukai visada bus animuoti';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animuoti sąveikaujant';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Lipdukai animuosis, kai juos paspausite';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Lipdukai animuosis, kai ant jų užvesite pelę arba su jais sąveikausite';

  @override
  String get accessibilityStickerNeverAnimateName => 'Niekada neanimuoti';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Lipdukai niekada nebus animuojami';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Visada animuojama, nepaisant sumažinto judesio.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Sumažintas judesys apriboja lipdukų animaciją iki sąveikos. Pasirinkite „visada animuoti“, kad nepaisytumėte.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Numatytoji nuostata – animuoti sąveikaujant mobiliajame įrenginyje, siekiant taupyti baterijos energiją.';

  @override
  String get accessibilityMotionGroupTitle => 'Judėjimas';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sinchronizuoti sumažinto judesio nustatymą su sistema';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Naudoti šio įrenginio sistemos sumažinto judesio nuostatą arba tinkinti ją toliau.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Sumažinti judesį';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Išjungti animacijas ir perėjimus. Šiuo metu valdoma jūsų sistemos nustatymų.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Išjungti animacijas ir perėjimus visoje programėlėje.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animuoti jaustukai, GIF ir lipdukai lieka jūsų valioje animacijos skirtuke.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Pradėti skambutį?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Ar tikrai norite pradėti šį skambutį?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Pradėti skambutį';

  @override
  String get accessibilityTtsSampleDescription =>
      'Išklausykite pavyzdinę eilutę pasirinktu greičiu.';

  @override
  String get accessibilityTtsSampleText =>
      'Daktare, aš iš ateities. Atkeliavau čia jūsų išrastu laiko aparatu. Dabar man reikia jūsų pagalbos, kad grįžčiau į 1985 metus.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Šiame įrenginyje kalbos sintezė neprieinama.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Nepavyko atkurti kalbos. Bandykite dar kartą arba patikrinkite, ar veikia garso išvestis.';

  @override
  String get ttsSubstitutionUnknownUser => 'nežinomas naudotojas';

  @override
  String get ttsSubstitutionUnknownRole => 'nežinomas vaidmuo';

  @override
  String get ttsSubstitutionUnknownChannel => 'nežinomas kanalas';

  @override
  String get ttsSubstitutionCodeBlock => 'kodo blokas';

  @override
  String get ttsSubstitutionSpoiler => 'spoileris';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'jaustukas \"$emojiName\"';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/ $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName pasakė: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Atsakant į $replyAuthorName žinutę, $authorName parašė: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'išsiuntė lipduką';

  @override
  String get ttsSentAttachment => 'išsiuntė priedą';

  @override
  String ttsSentAttachments(int count) {
    return 'atsiųsta $count priedų';
  }

  @override
  String get ttsSentEmbed => 'išsiuntė įterptąjį turinį';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author išsiuntė $summary';
  }

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
    return 'Atnaujinkite „$productName\", kad galėtumėte peržiūrėti šį pranešimą.';
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
  String get voiceJoinFailedTitle => 'Nepavyko prisijungti prie balso';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Nepavyko atjungti kitų jūsų įrenginių. Pabandykite dar kartą po akimirkos.';

  @override
  String get voiceChannelEmptyDescription =>
      'Tai balso kanalas. Prisijunkite, kad pradėtumėte kalbėti!';

  @override
  String get voiceChannelJoin => 'Prisijungti prie balso kanalo';

  @override
  String get voiceCallJoin => 'Prisijungti prie skambučio';

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
  String get voiceControlFlipCamera => 'Apversti kamerą';

  @override
  String get voiceControlScreenShare => 'Ekrano bendrinimas';

  @override
  String get voiceScreenShareNotificationText => 'Bendrinamas jūsų ekranas.';

  @override
  String get voiceControlMore => 'Daugiau';

  @override
  String get voiceControlDisconnect => 'Atjungti';

  @override
  String get voiceInChat => 'Balso pokalbyje';

  @override
  String get voiceConnectionFailed => 'Nepavyko prisijungti';

  @override
  String get voiceConnectionRetry => 'Bandyti dar kartą';

  @override
  String get voiceConnectionDismiss => 'Atsisakyti';

  @override
  String get voiceConnectionDisconnected => 'Atjungta';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Matuojamas delsos laikas...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Pereiti į \"$channelSourceLabel\"';
  }

  @override
  String get voiceConnectionTitle => 'Balso ryšys';

  @override
  String get voiceConnectionAdvancedStats => 'Išplėstiniai';

  @override
  String get voiceShowCallAvatars => 'Rodyti skambučio avatarus';

  @override
  String get voiceShowConnectionId => 'Rodyti ryšio ID';

  @override
  String get voiceAudioProcessing => 'Garso apdorojimas';

  @override
  String get voiceConnectionSessionSection => 'Seansas';

  @override
  String get voiceConnectionDurationLabel => 'Trukmė';

  @override
  String get voiceConnectionParticipantsLabel => 'Dalyviai';

  @override
  String get voiceConnectionNetworkSection => 'Tinklas';

  @override
  String get voiceConnectionPingLabel => 'Siųsti pranešimą';

  @override
  String get voiceConnectionJitterLabel => 'Virpėjimas';

  @override
  String get voiceConnectionSendLabel => 'Siųsti';

  @override
  String get voiceConnectionReceiveLabel => 'Gauti';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes m $seconds s';
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
  String get userAreaMuteMicrophone => 'Nutildyti mikrofoną';

  @override
  String get userAreaUnmuteMicrophone => 'Įjungti mikrofoną';

  @override
  String get userAreaUserSettings => 'Naudotojo nustatymai';

  @override
  String get voiceParticipantMenuViewProfile => 'Žiūrėti profilį';

  @override
  String get voiceParticipantMenuFocus => 'Sutelkti dėmesį į šį asmenį';

  @override
  String get voiceParticipantMenuUnfocus => 'Nebefokusuoti';

  @override
  String get voiceParticipantMenuCommunityMute => 'Nutildyti bendruomenėje';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Nutildyti bendruomenėje';

  @override
  String get voiceParticipantMenuUserVolume => 'Naudotojo garsumas';

  @override
  String get voiceParticipantMenuStreamVolume => 'Srauto garsumas';

  @override
  String get voiceParticipantMenuStopStreaming => 'Sustabdyti srautą';

  @override
  String get voiceParticipantModerationFailed =>
      'Nepavyko atnaujinti nario. Pabandykite dar kartą.';

  @override
  String get voiceControlChat => 'Pokalbis';

  @override
  String get voiceCallViewModeLabel => 'Žiūrėti';

  @override
  String get voiceCallViewModeGrid => 'Tinklelis';

  @override
  String get voiceCallViewModeFocus => 'Fokusas';

  @override
  String get voicePanelSettingsSectionTitle => 'Balso nustatymai';

  @override
  String get voicePanelUseEarpieceLabel => 'Naudoti ausinę';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Rodyti tik vaizdo įrašus';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Rodyti tik dalyvius, kurie įjungę kamerą.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Rodyti mano kamerą';

  @override
  String get voicePrioritizeSpeakersLabel => 'Prioritetas kalbantiesiems';

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
  String get privacyDashboardProfilePrivacySection => 'Profilio privatumas';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Draugai ir tiesioginės žinutės';

  @override
  String get privacyDashboardActivitySharingSection => 'Veiklos dalijimasis';

  @override
  String get privacyDashboardSensitiveContentSection => 'Jautrus turinys';

  @override
  String get privacyDashboardDataExportSection => 'Duomenų eksportavimas';

  @override
  String get privacyDashboardDataDeletionSection => 'Duomenų ištrynimas';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Kas gali matyti visą jūsų profilį';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Draugai ir visos bendruomenės';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Visas jūsų profilis matomas draugams ir visiems jūsų bendruomenių nariams';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Tik draugams ir mažoms bendruomenėms';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Visas jūsų profilis matomas draugams ir bendruomenių, turinčių 200 ar mažiau narių, nariams';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Tik draugai';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Visas jūsų profilis matomas tik jūsų draugams';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Draugų užklausos';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Visi';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Leisti visiems siųsti jums draugų užklausas';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'Draugų draugai';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Leisti draugų draugams siųsti jums užklausas';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Bendruomenės nariai';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Leisti bendruomenių nariams siųsti jums užklausas';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Tiesioginiai pranešimai';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Leisti tiesioginius pranešimus iš bendruomenės narių';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Leisti bendruomenių, kuriose esate, nariams siųsti jums tiesiogines žinutes';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Leisti tiesiogines žinutes iš bendruomenės robotų';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Leisti botams iš bendruomenių, kuriose esate, siųsti jums tiesioginius pranešimus';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Valdykite, kas gali siųsti jums draugų užklausas ir tiesiogines žinutes';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Valdykite, kas gali jums skambinti ir pridėti jus į grupės pokalbius';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Gaunamieji skambučiai';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Valdykite, kas gali jums skambinti';

  @override
  String get privacyDashboardAllowedCallers => 'Leistini skambinantysiais';

  @override
  String get privacyDashboardIncomingCallNobody => 'Niekas';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blokuoti visus gaunamus skambučius';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Tik draugams';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Leiskite skambinti tik draugams (rekomenduojama)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Draugai + Pasirinktinai';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Leisti draugams ir papildomoms grupėms, kurias pasirenkate';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Visi';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Leisti visiems skambinti jums, net nepažįstamiems žmonėms';

  @override
  String get privacyDashboardAdditionalGroups => 'Papildomos grupės';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Žmonės, kurie yra jūsų draugų draugai, gali jums skambinti';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Žmonės iš bendruomenių, kuriose esate abu, gali jums skambinti';

  @override
  String get privacyDashboardRingBehavior => 'Žiedo elgsena';

  @override
  String get privacyDashboardSilentCalls => 'Tylūs skambučiai iš visų';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Visi skambučiai bus tylūs, o ne skambės. Numatoma, kad skambučiai iš nepažįstamų žmonių visada bus tylūs.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Kas gali pridėti jus į grupės pokalbius';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Valdykite, kas gali pridėti jus į grupės pokalbius neprašydamas. Kiekvienas vis tiek galės atsiųsti jums kvietimo nuorodas, kad prisijungtumėte.';

  @override
  String get privacyDashboardAllowedInvites => 'Leistiniai kvietimai';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Niekas negali jūsų pridėti į grupės pokalbius be jūsų sutikimo';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Leisti tik draugams pridėti jus be prašymo (rekomenduojama)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Leisti draugams ir papildomoms grupėms jus pridėti';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Leisti bet kam pridėti jus į grupės pokalbius be prašymo';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Žmonės, kurie yra jūsų draugų draugai, gali pridėti jus prie grupės pokalbių';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Žmonės iš bendruomenių, kuriose esate abu, gali pridėti jus prie grupinių pokalbių';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Balso aktyvumas skiltyje „Aktyvus dabar\"';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Bendrinti balso aktyvumą su draugais';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Bendrinti balso aktyvumą su visais draugais?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Nebesidalinti balso aktyvumu su visais draugais?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Netrukus pradėsite bendrinti savo balso aktyvumą su visais savo draugais, įskaitant ir būsimus. Tai išsiųs atnaujinimą visiems ir vėl galės būti pakeista tik po 24 valandų.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Ketinate nustoti bendrinti savo balso aktyvumą su visais savo draugais, įskaitant būsimus. Apie tai bus pranešta visiems ir tai vėl galėsite pakeisti tik po 24 valandų.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Taip, bendrinti su visais draugais';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Taip, nebedalinti';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Vėl bus pasiekiama po $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Balso aktyvumo bendrinimas atnaujintas';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Nepavyko atnaujinti balso aktyvumo bendrinimo';

  @override
  String get privacyDashboardDataExportDesc =>
      'Sukursite atsisiunčiamą savo paskyros duomenų, įskaitant pranešimus ir priedų URL, archyvą. Dauguma žmonių nori visko, bet galite susiaurinti apimtį toliau.';

  @override
  String get privacyDashboardExportMyData => 'Eksportuoti mano duomenis';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Visam laikui pašalinkite išsiųstas žinutes iš tiesioginių pokalbių, grupinių tiesioginių pokalbių ir bendruomenių. Darbas vykdomas fone, o baigus gausite tiesioginę žinutę.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Ištrinti mano žinutes';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Leisti tiesioginius pranešimus iš bendruomenės narių?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Blokuoti tiesioginius pranešimus iš bendruomenės narių?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Leisti robotams siųsti jums tiesiogines žinutes?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blokuoti robotų siunčiamas tiesiogines žinutes?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Ar norite leisti tiesioginius pranešimus iš esamų bendruomenių narių?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Ar taip pat norite blokuoti tiesioginius pranešimus iš esamų bendruomenių narių?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Ar taip pat norite leisti robotams iš esamų bendruomenių siųsti jums tiesiogines žinutes?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Ar norite blokuoti robotus ir iš esamų bendruomenių?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Taip pat galite pakeisti šį nustatymą kiekvienai bendruomenei ilgai paspaudę bendruomenės pavadinimą ir pasirinkę „Privatumo nustatymai“.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Leisti visoms bendruomenėms';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Blokuoti visose bendruomenėse';

  @override
  String get privacyDashboardDmConfirmSkip => 'Praleisti šį veiksmą';

  @override
  String get privacyDashboardDataRequestGoBack => 'Grįžti atgal';

  @override
  String get privacyDashboardDataRequestExportTitle =>
      'Eksportuoti mano duomenis';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Ištrinti mano žinutes';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Apdorosime tai kuo greičiau. Gausite el. laišką, kai archyvas bus paruoštas.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Apdorosime tai kuo greičiau. Kai bus atlikta, gausite iš mūsų tiesioginę žinutę.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Ką įtraukti';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Viskas';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Eksportuoti visas kada nors išsiųstas žinutes, taip pat visus paskyros nustatymus, narystes ir metaduomenis.';

  @override
  String get privacyDashboardDataRequestExportCustom =>
      'Pasirinktinis pasirinkimas';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Pasirinkite, kokius pokalbių tipus, bendruomenes ir laikotarpį įtraukti į archyvą.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Pasirinkite, ką įtraukti';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Pasirinkite, kokius pokalbius išvalyti.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Tik vietos, kurių nebegaliu pasiekti';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Ištrinti pranešimus tik iš bendruomenių ir grupinių tiesioginių žinučių, iš kurių išėjote arba buvote pašalintas.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Kurie pokalbiai';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Nurodykite, kokius pokalbius norite įtraukti.';

  @override
  String get privacyDashboardDataRequestKindDms =>
      'Atidaryti tiesioginius pranešimus';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Uždaryti tiesioginiai pranešimai';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Grupės DM';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Bendruomenės';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle =>
      'Kurios bendruomenės';

  @override
  String get privacyDashboardDataRequestGuildFilterMode =>
      'Bendruomenės filtras';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Įtraukti visus, išskyrus pasirinktus';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Tik pasirinkti';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Šiuo metu nesate jokioje bendruomenėje.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Laikotarpis';

  @override
  String get privacyDashboardDataRequestDateMode => 'Laikotarpis';

  @override
  String get privacyDashboardDataRequestAllTime => 'Visas laikotarpis';

  @override
  String get privacyDashboardDataRequestCustomRange =>
      'Pasirinktinis diapazonas';

  @override
  String get privacyDashboardDataRequestStartDate => 'Pradžios data';

  @override
  String get privacyDashboardDataRequestEndDate => 'Pabaigos data';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Palikite bet kurį laukelį tuščią, kad lango pabaiga liktų neribota.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Pasirinkite bent vieną pokalbių tipą, kurį norite įtraukti.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Pradžios data turi būti ankstesnė už pabaigos datą.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Peržiūrėti ir patvirtinti';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Sukursime atsisiunčiamą archyvą su visais jūsų kada nors išsiųstais pranešimais ir atsiųsime jums el. laišką, kai jis bus paruoštas. Atsisiuntimo nuoroda tame el. laiške nustos galioti po 7 dienų.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Sukursime atsisiunčiamą archyvą, atitinkantį toliau nurodytus filtrus, ir atsiųsime jums el. laišką, kai jis bus paruoštas. Atsisiuntimo nuoroda tame el. laiške nustos galioti po 7 dienų.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Visam laikui ištrinti žinutes, atitinkančias toliau nurodytus filtrus. Šio veiksmo anuliuoti negalima.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Kai tik tai prasidės, atkurti nebebus įmanoma. Baigus procesą, atsiųsime jums tiesioginę žinutę.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Prašyti eksportuoti';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Ištrinti žinutes';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Aprėptis';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Pokalbiai';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Bendruomenės';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Laikotarpis';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Nėra';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Nuo $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Iki $end';
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
      other: '# bendruomenes',
      one: '# bendruomenę',
    );
    return 'Visos, išskyrus $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# bendruomenės',
      one: '# bendruomenė',
    );
    return 'Tik $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Atviri tiesioginiai pranešimai';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Uždaryti tiesioginiai pranešimai';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Tiesioginiai pranešimai (atidaryti ir uždaryti)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Grupės DM';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Bendruomenės';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# valandos',
      one: '# valanda',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutės',
      one: '# minutė',
    );
    return '$_temp0 ir $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# valandų',
      few: '# valandos',
      one: '# valanda',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
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
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# sekundžių',
      few: '# sekundės',
      one: '# sekundė',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'Nepavyko įkelti privatumo nuostatų';

  @override
  String get privacyDashboardRetry => 'Bandykite dar kartą';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Nepavyko įrašyti jautraus turinio nuostatų.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Nepavyko užbaigti užklausos.';

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
  String get forwardSendSlowmodeBlocked =>
      'Laukiama, kol pasibaigs lėtasis režimas viename ar keliuose pasirinktuose kanaluose.';

  @override
  String get slowmodeRateLimitedTitle => 'Lėtasis režimas aktyvus';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Įjungtas lėtasis režimas – prieš siųsdami kitą palaukite $duration.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Tiesioginis įkėlimas išjungtas lėtojo režimo metu.';

  @override
  String get shareMediaTitle => 'Bendrinti su';

  @override
  String get shareMediaMessageHint => 'Pridėkite pasirenkamą žinutę…';

  @override
  String get shareMediaSendButton => 'Siųsti';

  @override
  String get shareMediaSuccessToast => 'Medija bendrinama';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Bendrinta į $count paskirties vietas';
  }

  @override
  String get shareMediaFailedToast => 'Nepavyko bendrinti medijos';

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
  String get chatMessageCopyEmbedText => 'Nukopijuoti įterptojo teksto turinį';

  @override
  String get chatMessageTranslate => 'Versti';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Išversta iš $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Žiūrėti originalą';

  @override
  String get chatMessageSeeTranslation => 'Peržiūrėti vertimą';

  @override
  String get chatMessageTranslating => 'Verčiama…';

  @override
  String get chatMessageTranslateFailed => 'Nepavyko išversti šio pranešimo.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Vertimas nepasiekiamas šiame įrenginyje.';

  @override
  String get chatMessageSpeak => 'Perskaityti žinutę';

  @override
  String get chatMessageStopSpeaking => 'Nebekalbėti';

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
  String get chatMessageOpenLink => 'Atidaryti nuorodą';

  @override
  String get chatMessageCopyLink => 'Kopijuoti nuorodą';

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
  String get chatReactionAddFailed => 'Nepavyko pridėti reakcijos';

  @override
  String get chatReactionRemoveFailed => 'Nepavyko pašalinti reakcijos';

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
  String iarReasonOtherDescription(String productName) {
    return 'Naudokite tik jei akivaizdžiai pažeidžiamos $productName taisyklės ir tai netinka aukščiau.';
  }

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
  String get chatMessageDeleteAttachment => 'Panaikinti priedą';

  @override
  String get chatMessageEditAttachmentAltText =>
      'Redaguoti alternatyvųjį tekstą';

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
      other: '$count užblokuotos žinutės',
      one: '1 užblokuota žinutė',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count galimi šlamštininko pranešimai',
      one: '1 galimas šlamštininko pranešimas',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Atsakymas paslėptas, nes originalus autorius yra užblokuotas.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Atsakymas paslėptas, nes originalus autorius pažymėtas kaip šlamšto siuntėjas.';

  @override
  String get devMarkAsSpamLocally => 'Pažymėti kaip šlamštą (vietoje)';

  @override
  String get devIgnoreSpamFlag => 'Nepaisyti šlamšto žymės';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'Medijos parinktys';

  @override
  String get mediaViewerCopyLink => 'Kopijuoti nuorodą';

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
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Priedas $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Atsisakyti';

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
  String get composerAutocompleteSuggestions => 'Pasiūlymai';

  @override
  String get composerAutocompleteCommandsHeading => 'Komandos';

  @override
  String get composerAutocompleteChoicesHeading => 'Pasirinkimai';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Pasirenkami argumentai';

  @override
  String get composerAutocompleteChannelsHeading => 'Kanalai';

  @override
  String get composerAutocompleteMembersHeading => 'Nariai';

  @override
  String get composerAutocompleteUsersHeading => 'Vartotojai';

  @override
  String get composerAutocompleteMentionsHeading => 'Paminėjimai';

  @override
  String get composerAutocompleteRolesHeading => 'Rolės';

  @override
  String get composerAutocompleteMediaHeading => 'Medija';

  @override
  String get composerAutocompleteStickersHeading => 'Lipdukai';

  @override
  String get composerAutocompleteGifsHeading => 'GIF\'ai';

  @override
  String get composerAutocompleteNoGifs => 'Nepridedu GIF\'ų';

  @override
  String get composerCommandShrugDescription =>
      'Prideda ¯\\_(ツ)_/¯ prie jūsų žinutės.';

  @override
  String get composerCommandTableflipDescription =>
      'Prideda (╯°□°)╯︵ ┻━┻ prie jūsų žinutės.';

  @override
  String get composerCommandUnflipDescription =>
      'Prideda ┬─┬ ノ( ゜-゜ノ) prie jūsų žinutės.';

  @override
  String get composerCommandMeDescription =>
      'Siųsti veiksmo pranešimą (apgaubia kursyvu).';

  @override
  String get composerCommandSpoilerDescription =>
      'Siųsti pranešimą su paslėptu tekstu (įterpia paslėpto teksto žymes).';

  @override
  String get composerCommandTtsDescription =>
      'Siųsti teksto į kalbą pranešimą.';

  @override
  String get composerCommandNickDescription =>
      'Pakeiskite savo slapyvardį šioje bendruomenėje.';

  @override
  String get composerCommandKickDescription =>
      'Pašalinti narį iš šios bendruomenės.';

  @override
  String get composerCommandBanDescription =>
      'Užblokuoti narį šioje bendruomenėje.';

  @override
  String get composerCommandMsgDescription =>
      'Siųsti tiesioginę žinutę vartotojui.';

  @override
  String get composerCommandSavedDescription =>
      'Siųsti išsaugotą medijos elementą.';

  @override
  String get composerCommandStickerDescription => 'Siųsti lipduką.';

  @override
  String get composerCommandGifDescription => 'Ieškoti ir siųsti GIF.';

  @override
  String get composerCommandMemberOption => 'Narys, į kurį bus nukreipta.';

  @override
  String get composerCommandReasonOption => 'Priežastis (pasirenkama).';

  @override
  String get composerCommandMessageOption => 'Žinutė, kurią reikia išsiųsti.';

  @override
  String get composerCommandQueryOption => 'Ko ieškoti.';

  @override
  String get composerCommandNicknameOption =>
      'Jūsų naujas slapyvardis arba palikite tuščią, kad jį atstatytumėte.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Kiek nesenos nario žinučių istorijos ištrinti.';

  @override
  String get composerCommandDeleteMessagesNone => 'Neištrinti jokių';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Ankstesnių $count dienų';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Ankstesnės 24 valandos';

  @override
  String get composerCommandOptionRequired =>
      'Ši parinktis yra privaloma. Prašome pateikti reikšmę.';

  @override
  String get composerCommandClear => 'Panaikinti komandą';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Šioje bendruomenėje savo slapyvardį pakeitėte iš **$previousNickname** į **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Nežinomas naudotojas';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Nepavyko nusiųsti žinutės **$username**. Galbūt jie išjungė tiesioginius pranešimus arba jus užblokavo.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count daugiau';
  }

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
  String get addGuildCreateTitle => 'Sukurti bendruomenę';

  @override
  String get addGuildCreateDescription =>
      'Sukurkite bendruomenę, kurioje galėsite bendrauti su draugais.';

  @override
  String get addGuildCreateNameLabel => 'Bendruomenės pavadinimas';

  @override
  String get addGuildCreateSubmit => 'Kurti bendruomenę';

  @override
  String get addGuildCreateFailed =>
      'Nepavyko sukurti bendruomenės. Pabandykite dar kartą.';

  @override
  String get addGuildCreateClaimTitle => 'Pasiimkite paskyrą';

  @override
  String get addGuildCreateClaimDescription =>
      'Prieš kurdami bendruomenę turite patvirtinti savo paskyrą.';

  @override
  String get addGuildCreateVerifyTitle => 'Patvirtinkite savo el. paštą';

  @override
  String get addGuildCreateVerifyDescription =>
      'Prieš kurdami bendruomenę, turite patvirtinti savo el. pašto adresą.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animuotų piktogramų negalima naudoti kuriant naują bendruomenę. Naudokite statinę nuotrauką.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Kurdamas bendruomenę, sutinki laikytis ir palaikyti ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Bendruomenės „$productName“ gairės';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Ši instancija yra vienos bendruomenės, todėl papildomų bendruomenių sukurti negalima.';

  @override
  String get addGuildCreateChangeIcon => 'Keisti piktogramą';

  @override
  String get addGuildCreateIconLabel => 'Bendruomenės piktograma';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Daugiausia 10 MB. Rekomenduojama: 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Įklijuokite Discord šablono URL, kad importuotumėte jo struktūrą į naują bendruomenę.';

  @override
  String get addGuildImportUrlLabel => 'Šablono URL';

  @override
  String get addGuildImportUrlInvalid =>
      'Įveskite galiojantį „Discord“ šablono URL arba kodą.';

  @override
  String get addGuildImportFetchFailed =>
      'Nepavyko gauti bendruomenės šablono. Šablono gali nebūti arba išorinė tarnyba nepasiekiama.';

  @override
  String get addGuildImportInvalidResponse =>
      'Tai neatrodo kaip tinkamas šablono atsakymas.';

  @override
  String get addGuildImportTemplateLabel => 'Šablonas';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount teksto, $voiceChannelCount balso, $categoryCount kategorijų, $roleCount vaidmenų';
  }

  @override
  String get addGuildImportRemoveIcon => 'Pašalinti piktogramą';

  @override
  String get addGuildImportTemplateInvalid =>
      'Bendruomenės šablono duomenys neteisingi arba sugadinti.';

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
  String get channelDetailsFallbackTitle => 'Išsami informacija';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Grupės DM · $count nariai';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Uždaryti pokalbį su $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Palikti $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Kanalo nustatymai';

  @override
  String get channelDetailsGroupSettingsTitle => 'Grupės nustatymai';

  @override
  String get channelDetailsDmSettingsTitle => 'DM nustatymai';

  @override
  String get channelDetailsInvitePeople => 'Pakviesti žmones';

  @override
  String get channelDetailsCopyLink => 'Nukopijuoti nuorodą';

  @override
  String get channelMenuCopyChannelLink => 'Kopijuoti kanalo nuorodą';

  @override
  String get channelMenuCopyRedirectLink => 'Nukopijuoti perkėlimo nuorodą';

  @override
  String get channelDetailsAddFriendsToGroup => 'Pridėti draugų į grupę';

  @override
  String get channelDetailsGroupInvites => 'Grupės kvietimai';

  @override
  String get channelDetailsEditChannel => 'Redaguoti kanalą';

  @override
  String get channelDetailsDeleteChannel => 'Ištrinti kanalą';

  @override
  String get channelSettingsCategorySettingsTitle => 'Kategorijos nustatymai';

  @override
  String get channelSettingsEditCategory => 'Redaguoti kategoriją';

  @override
  String get channelSettingsTabOverview => 'Apžvalga';

  @override
  String get channelSettingsTabPermissions => 'Leidimai';

  @override
  String get channelSettingsTabInvites => 'Kvietimai';

  @override
  String get channelSettingsTabWebhooks => 'Webhookai';

  @override
  String get channelSettingsDeleteChannel => 'Ištrinti kanalą';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Ar tikrai norite ištrinti $channelName? Tai negalima atšaukti.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Ar tikrai norite ištrinti $categoryName? Tai negalima atšaukti.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Ištrinti kategoriją';

  @override
  String get channelSettingsChannelUpdated => 'Kanalas atnaujintas';

  @override
  String get channelSettingsChannelName => 'Kanalo pavadinimas';

  @override
  String get channelSettingsCategoryName => 'Kategorijos pavadinimas';

  @override
  String get channelSettingsMyCategory => 'Mano kategorija';

  @override
  String get categoryExpandCategory => 'Išskleisti kategoriją';

  @override
  String get categoryCollapseCategory => 'Sutraukti kategoriją';

  @override
  String get categoryExpandAllCategories => 'Išskleisti visas kategorijas';

  @override
  String get categoryCollapseAllCategories => 'Sutraukti visas kategorijas';

  @override
  String get categoryMuteCategory => 'Nutildyti kategoriją';

  @override
  String get categoryUnmuteCategory => 'Įjungti kategorijos garsą';

  @override
  String get categoryCopyCategoryId => 'Kopijuoti kategorijos ID';

  @override
  String get categoryIdCopied => 'Kategorijos ID nukopijuotas';

  @override
  String get channelSettingsChannelNamePlaceholder => 'bendra';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Tema';

  @override
  String get channelSettingsTopicPlaceholder => 'Pridėti temą šiam kanalui';

  @override
  String get channelSettingsInsertEmoji => 'Įterpti jaustuką';

  @override
  String get channelSettingsTopicTooLongTitle => 'Kanalo tema per ilga.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Sutrumpinkite temą ir bandykite dar kartą.';

  @override
  String get channelSettingsSlowmode => 'Lėtasis režimas';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Laikas tarp pranešimų. „$bypassSlowmodePermissionLabel“ gali jį apeiti.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Išjungta';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds sekundžių';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minutės';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours val.';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minutė';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour valanda';
  }

  @override
  String get channelSettingsVoiceQuality => 'Balso kokybė';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Didels bitreitas = geresnė kokybė ir didesnis pralaidumo naudojimas.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Dalyvių skaičiaus limitas';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Didžiausias narių skaičius, galintis prisijungti vienu metu. 0 reiškia neribotą.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dalyviai',
      one: '1 dalyvis',
      zero: '∞ Joks apribojimas',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Prisijungimų limitas';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Didžiausias aktyvių ryšių, kuriuos vienas narys gali palaikyti šiame kanale.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ryšių',
      one: '1 ryšys',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Balso regionas';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Pasirinkite šiam kanalui balso regioną. Automatinis naudoja artimiausią regioną.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatinis';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Nepavyko įkelti balso regionų';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Bandyti dar kartą po akimirkos.';

  @override
  String get channelSettingsResetSlider =>
      'Grąžinti slankiklį į numatytąją reikšmę';

  @override
  String get channelSettingsAdvanced => 'Išplėstiniai';

  @override
  String get channelSettingsMatureContentOverride =>
      'Brandos turinio nepaisymas';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Perrašyti šiam kanalui nustatytą $scopeLevel lygio parametrą. Brandus turinys bus rodomas už užtvaros prieš įeinant.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Paveldėti';

  @override
  String get channelSettingsMatureContentOn => 'Įjungta';

  @override
  String get channelSettingsMatureContentOff => 'Išjungta';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Žymi šį kanalą kaip skirtą suaugusiems.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Palikite šį kanalą atvirą brandžiam turiniui.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Paveldėta iš $inheritedSourceLabel: įjungta';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Paveldėta iš $inheritedSourceLabel: išjungta';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'kategorija';

  @override
  String get channelSettingsMatureContentCommunitySource => 'bendruomenės';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategorija';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Bendruomenė';

  @override
  String get channelSettingsContentWarningToggle =>
      'Rodyti įspėjimą apie turinį šiame kanale';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Įjungia sutikimo raginimą prieš įeinant į šį kanalą.';

  @override
  String get channelSettingsContentWarningText =>
      'Pasirinktinis įspėjimo tekstas';

  @override
  String get channelSettingsContentWarningDefault =>
      'Čia yra jautraus turinio.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Norėdami redaguoti šiuos leidimus, turite turėti leidimą \"$manageChannelsPermissionLabel\".';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Norėdami redaguoti šiuos leidimus, turite turėti leidimą \"$manageRolesPermissionLabel\".';
  }

  @override
  String get channelSettingsUnknownRole => 'Nežinomas vaidmuo';

  @override
  String get channelSettingsUnknownUser => 'Nežinomas naudotojas';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'Prieigos perrašymai';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Redaguoti prieigą $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Grįžti prie perrašymų';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Konfigūruoti pagrindinę prieigą šiam kanalui';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Konfigūruoti šio vaidmens perrašymus';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Konfigūruoti šio nario perrašymus';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Ieškoti leidimų…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Kanalo prieiga atnaujinta';

  @override
  String get channelSettingsPermissionsTitle => 'Valdyti prieigą';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Šis kanalas sinchronizuotas su pagrindine kategorija ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Šis kanalas nesinchronizuojamas su pagrindine kategorija ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Sinchronizuoti su kategorija';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanalas sinchronizuotas su pagrindine kategorija';

  @override
  String get channelSettingsPermissionsAddOverride => 'Pridėti perrašymą';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Ieškoti vaidmenų ar narių…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Vaidmenys ir nariai';

  @override
  String get channelSettingsDeleteInvite => 'Ištrinti kvietimą';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Ištrinti šį kvietimą? Atšaukti nebus galima.';

  @override
  String get channelSettingsCopyInviteCode => 'Kopijuoti kvietimo kodą';

  @override
  String get channelSettingsCopyInviteUrl => 'Kopijuoti kvietimo nuorodą';

  @override
  String get channelSettingsWebhookCreated => 'Žiniatinklio kablys sukurtas';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Nepavyko sukurti \"webhook\"';

  @override
  String get channelSettingsCreateWebhook => 'Sukurti \"webhook\"';

  @override
  String get channelSettingsInvitesDescription =>
      'Tvarkykite šio kanalo kvietimo nuorodas.';

  @override
  String get channelSettingsInvitesCreate => 'Kurti kvietimą';

  @override
  String get channelSettingsInvitesEmpty => 'Nėra kvietimo nuorodų';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Šis kanalas dar neturi jokių pakvietimo nuorodų. Sukurkite vieną, kad pakviestumėte žmones į šį kanalą.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Įkeliant šio kanalo kvietimo nuorodas įvyko klaida. Bandykite dar kartą.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Tvarkykite gaunamus \"webhook\'us\", kurie gali skelbti pranešimus šiame kanale.';

  @override
  String get channelSettingsWebhooksEmpty => 'Nėra \"webhook\" nuorodų';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Šiam kanalui nėra sukonfigūruotų \"webhook\" nuorodų. Sukurkite \"webhook\" nuorodą, kad išorinės programos galėtų skelbti pranešimus.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Šis kanalas nepalaiko \"webhook\" integravimo.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Norint peržiūrėti ir redaguoti šio kanalo webhookus, jums reikia „$permission“ leidimo.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Nepavyko įkelti \"webhook\" nuorodų';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Įkeliant šio kanalo žiniatinklio kabliukus įvyko klaida. Bandykite dar kartą.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Sukurta $creator $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Nežinomas naudotojas';

  @override
  String get channelSettingsWebhooksAvatar => 'Avataras';

  @override
  String get channelSettingsWebhooksUploadImage => 'Įkelti nuotrauką';

  @override
  String get channelSettingsWebhooksRemove => 'Pašalinti';

  @override
  String get channelSettingsWebhooksName => 'Pavadinimas';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook pavadinimas';

  @override
  String get channelSettingsWebhooksChannel => 'Kanalas';

  @override
  String get channelSettingsWebhooksUrl => 'Žiniatinklio kablio URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopijuoti \"webhook\" URL';

  @override
  String get channelSettingsWebhooksDelete => 'Ištrinti \"webhook\"';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Nepavyko ištrinti šios žiniatinklio jungties';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Ištrinti šį webhook? Negalima atšaukti.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Bandyti dar kartą po akimirkos.';

  @override
  String get channelMenuOpenChat => 'Atidaryti pokalbį';

  @override
  String get channelMenuDuplicateChannel => 'Dublikuoti kanalą';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Iš naujo nustatyti sutikimo su brandaus turinio taisyklėmis būseną';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Ištrinti savo žinutes šiame kanale?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Tai visam laikui ištrins visas žinutes, kurias kada nors išsiuntėte šiame kanale. Šio veiksmo anuliuoti negalima.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Ištrinti mano žinutes';

  @override
  String get channelMenuDeletedYourMessages => 'Ištrynei savo žinutes';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Nepavyko ištrinti jūsų žinučių';

  @override
  String get channelDetailsSystemMessage => 'Sisteminė žinutė';

  @override
  String get channelDetailsTextChannel => 'Teksto kanalas';

  @override
  String get channelDetailsVoiceChannel => 'Balso kanalas';

  @override
  String get channelDetailsCategory => 'Kategorija';

  @override
  String get channelDetailsLinkChannel => 'Susieti kanalą';

  @override
  String get channelDetailsGenericChannel => 'Kanalas';

  @override
  String get channelDetailsMutedConversation => 'Nutildytas pokalbis';

  @override
  String get channelDetailsUnmutedConversation => 'Pokalbis įjungtas';

  @override
  String get channelDetailsMutedChannel => 'Nutildytas kanalas';

  @override
  String get channelDetailsUnmutedChannel => 'Kanalas nutildytas';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Pranešimų nuostatos atnaujintos';

  @override
  String get channelDetailsTabMembers => 'Nariai';

  @override
  String get channelDetailsTabPins => 'Prisegti pranešimai';

  @override
  String get channelDetailsActionMute => 'Nutildyti';

  @override
  String get channelDetailsActionUnmute => 'Įjungti garsą';

  @override
  String get channelDetailsActionSearch => 'Ieškoti';

  @override
  String get channelDetailsActionMore => 'Daugiau';

  @override
  String get channelDetailsMembersEmptyTitle =>
      'Nėra narių, kuriuos būtų galima rodyti';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Nariai čia pasirodys, kai bus įkelti bendruomenės duomenys.';

  @override
  String get memberListPermissionDeniedTitle => 'Negalite peržiūrėti narių';

  @override
  String get memberListPermissionDeniedBody =>
      'Šioje bendruomenėje negalite peržiūrėti šio kanalo narių';

  @override
  String get memberListUnavailableTitle => 'Narių sąrašas nepasiekiamas';

  @override
  String get memberListUnavailableBody =>
      'Šiuo metu bendruomenės narių sąrašai nepasiekiami';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Nepavyko įkelti prisegtų žinučių';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Nariai, turintys leidimą „Smeigti pranešimus“, gali smeigti pranešimus, kad juos matytų visi.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Galite prisegti žinutes šiame pokalbyje, kad jas matytų visi.';

  @override
  String get channelDetailsPinsEndReached => 'Pasiekėte pabaigą';

  @override
  String get channelHeaderOpenDetails => 'Atidaryti kanalo informaciją';

  @override
  String get channelHeaderPinnedMessages => 'Prisegti pranešimai';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Smeigtos žinutės, neskaitytos';

  @override
  String get channelHeaderMemberList => 'Narių sąrašas';

  @override
  String get channelHeaderInbox => 'Gauta';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Pranešimų nustatymai, nutildyta';

  @override
  String get channelDetailsSearchTitle => 'Ieškoti';

  @override
  String get channelDetailsSearchHint => 'Ieškoti žinučių';

  @override
  String get channelDetailsSearchFilterFrom => 'Nuo';

  @override
  String get channelDetailsSearchFilterHas => 'Turi';

  @override
  String get channelDetailsSearchFilterIn => 'Kanale';

  @override
  String get channelDetailsSearchFilterMentions => 'Paminėjimai';

  @override
  String get channelDetailsSearchFilterMore => 'Daugiau';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktyvus';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kanalai';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count naudotojai';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Vartotojas';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'robotas';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Žiniatinklio kabliukas';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtruoti pagal kanalą';

  @override
  String get channelDetailsSearchChannelsHint => 'Ieškoti kanalų';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Kanalų nerasta';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Prikabinti';

  @override
  String get channelDetailsSearchPinnedTrue => 'Tik prisegti';

  @override
  String get channelDetailsSearchPinnedFalse => 'Nepaisyti prisegtų';

  @override
  String get channelDetailsSearchClearFilter => 'Valyti';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Autoriaus tipas';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Data';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Data režimas';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Pasirinkite datą';

  @override
  String get channelDetailsSearchMoreFiltersLink =>
      'Nuorodos pagrindinis domenas';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Failo pavadinimas yra';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Failo plėtinys';

  @override
  String get channelDetailsSearchContentPoll => 'Apklausa';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Žinutės su apklausa';

  @override
  String get channelDetailsSearchContentForward => 'Persiųsti';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Persiųsti pranešimai';

  @override
  String get channelDetailsSearchFilterSort => 'Rūšiuoti';

  @override
  String get channelHeaderSearchFiltersTitle => 'Ieškoti filtrų';

  @override
  String get channelHeaderSearchRecentTitle => 'Neseniai ieškota';

  @override
  String get channelHeaderSearchUsersTitle => 'Vartotojai';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanalai';

  @override
  String get channelHeaderSearchValuesTitle => 'Reikšmės';

  @override
  String get channelHeaderSearchDatesTitle => 'Datos';

  @override
  String get channelHeaderSearchDefaultBadge => 'Numatytasis';

  @override
  String get channelHeaderSearchClearHistory => 'Valyti';

  @override
  String get channelHeaderSearchFilterDescFrom => 'naudotojas';

  @override
  String get channelHeaderSearchFilterDescMentions => 'naudotojas';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'nuoroda, įterpinys, vaizdas, vaizdo įrašas, garsas, failas, lipdukas, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'data arba datų intervalas';

  @override
  String get channelHeaderSearchFilterDescOn => 'data arba datų intervalas';

  @override
  String get channelHeaderSearchFilterDescDuring => 'data arba datų intervalas';

  @override
  String get channelHeaderSearchFilterDescAfter => 'data arba datų intervalas';

  @override
  String get channelHeaderSearchFilterDescIn => 'kanalas';

  @override
  String get channelHeaderSearchFilterDescPinned => 'taip arba ne';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'naudotojas, robotas arba \"webhook\"';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'kompiuterio pavadinimas, pvz., example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'priedo failo pavadinimo dalis';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'failo plėtinys, pvz., png';

  @override
  String get channelHeaderSearchFilterDescSort => 'laikas arba tinkamumas';

  @override
  String get channelHeaderSearchFilterDescOrder => 'did. arba mažėj';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString rezultatai',
      one: '1 rezultatas',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtruoti pagal naudotoją';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtruoti pagal turinį';

  @override
  String get channelDetailsSearchSortBy => 'Rūšiuoti rezultatus pagal';

  @override
  String get channelDetailsSearchIn => 'Ieškoti kanale';

  @override
  String get channelDetailsSearchEmptyTitle => 'Ieškoti šioje pokalbyje';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Įveskite tekstą, autorių arba turinio filtrą, kad rastumėte žinutes.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Pranešimai yra indeksuojami';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Pabandykite dar kartą netrukus, kai bus baigta indeksuoti šią sritį.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Nėra rezultatų';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Pabandykite kitų paieškos terminų arba filtrų.';

  @override
  String get channelDetailsMembersOnline => 'Prisijungęs';

  @override
  String get channelDetailsMembersOffline => 'Neprisijungęs';

  @override
  String get channelDetailsMemberYou => 'Jūs';

  @override
  String get channelDetailsSearchUsersHint => 'Ieškoti naudotojų';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Rašykite, kad ieškoti narių';

  @override
  String get channelDetailsSearchUsersEmpty => 'Vartotojų nerasta';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'Nėra naudotojų';

  @override
  String get channelDetailsDone => 'Atlikta';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Rodyti pranešimus, kuriuose yra:';

  @override
  String get channelDetailsRetry => 'Bandykite dar kartą';

  @override
  String get channelDetailsPinnedMessageTitle => 'Prisegtas pranešimas';

  @override
  String get channelDetailsSearchResultTitle => 'Paieškos rezultatas';

  @override
  String get channelDetailsJumpToMessage => 'Pereiti prie žinutės';

  @override
  String get channelDetailsUnpinMessage => 'Atsegti žinutę';

  @override
  String get channelDetailsCopyMessageLink => 'Nukopijuoti žinutės nuorodą';

  @override
  String get channelDetailsCopyMessageId => 'Nukopijuoti žinutės ID';

  @override
  String get channelDetailsMessageUnpinned => 'Žinutė atsegta';

  @override
  String get channelDetailsSearchScopeCurrentCommunity =>
      'Dabartinė bendruomenė';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Šis pokalbis';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Visos bendruomenės';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Tiktai DM';

  @override
  String get channelDetailsSearchScopeAllDms => 'Visi tiesioginiai pranešimai';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Tik atvirieji DM';

  @override
  String get channelDetailsSearchScopeOpenDms =>
      'Atidaryti tiesioginius pranešimus';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Visi DM + Bendruomenės';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Atviri PM ir bendruomenės';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Ieškoti tik dabartinėje bendruomenėje';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Ieškoti tik šiame tiesioginiame pranešime';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Visose bendruomenėse, kuriose esate dabar';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Tik visuose DM, kuriuose kada nors buvote';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Visuose DM, kuriuose kada nors dalyvavote';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Visuose jūsų šiuo metu atidarytuose DM tik';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Visuose jūsų šiuo metu atidarytuose DM';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Visuose jūsų kada nors buvusiuose tiesioginiuose pranešimuose + visose bendruomenėse, kuriose šiuo metu esate';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Visuose jūsų atidarytuose DM + visose bendruomenėse, kuriose esate dabar';

  @override
  String get channelDetailsSearchSortNewest => 'Naujausi pirmiausia';

  @override
  String get channelDetailsSearchSortOldest => 'Seniausi pirma';

  @override
  String get channelDetailsSearchSortRelevance => 'Labiausiai aktualūs';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Rodyti naujausius pranešimus pirmiausia';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Rodyti seniausias žinutes pirmiausia';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Pirmiausia rodyti tinkamiausius pranešimus';

  @override
  String get channelDetailsSearchContentImage => 'Vaizdo įkėlimas';

  @override
  String get channelDetailsSearchContentVideo => 'Vaizdo įkėlimas';

  @override
  String get channelDetailsSearchContentAudio => 'Garso įkėlimas';

  @override
  String get channelDetailsSearchContentFile => 'Failo įkėlimas';

  @override
  String get channelDetailsSearchContentLink => 'Nuoroda';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Nuorodos peržiūra arba įterpimas';

  @override
  String get channelDetailsSearchContentSticker => 'Lipdukas';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Tik įkelti paveikslėliai';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Tik įkelti vaizdo įrašai';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Tik įkelti garso failai';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Bet koks įkeltas priedas';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Įvestas URL pranešimo tekste';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Išspręstos peržiūros ir išplėstiniai įterptiniai elementai, ne įkėlimai';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Prie žinutės pridėtas lipdukas';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count tipai';
  }

  @override
  String get personalNotesTitle => 'Asmeninės pastabos';

  @override
  String get personalNotesSubtitle =>
      'Jūsų privati erdvė mintims ir priminimams';

  @override
  String groupDmWelcome(String displayName) {
    return 'Sveiki, $displayName. Pakvieskite draugų, kad pradėtumėte pokalbį.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Redaguoti grupę';

  @override
  String get groupDmWelcomeAddFriends => 'Pridėti draugų į grupę';

  @override
  String get dmGroupInvites => 'Kvietimai';

  @override
  String get groupDmEditTitle => 'Redaguoti grupę';

  @override
  String get groupDmEditDetailsTooltip => 'Redaguoti grupės informaciją';

  @override
  String get groupDmGroupName => 'Grupės pavadinimas';

  @override
  String get groupDmMyGroup => 'Mano grupė';

  @override
  String get groupDmGroupNameMaxLength =>
      'Grupės pavadinimas negali viršyti 100 simbolių';

  @override
  String get groupDmGroupIcon => 'Grupės piktograma';

  @override
  String get groupDmUploadIcon => 'Įkelti piktogramą';

  @override
  String get groupDmChangeIcon => 'Keisti piktogramą';

  @override
  String get groupDmRemoveIcon => 'Pašalinti piktogramą';

  @override
  String get groupDmUpdated => 'Grupė atnaujinta';

  @override
  String get groupDmUpdateFailed =>
      'Nepavyko atnaujinti grupės. Pabandykite dar kartą.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animuotų piktogramų nepalaikoma. Naudokite statinę nuotrauką.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animuoti paveikslėliai nepalaikomi';

  @override
  String get groupDmIconFileTooLargeTitle => 'Piktogramos failas per didelis';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Piktogramos failas yra per didelis. Pasirinkite failą, mažesnį nei $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat =>
      'Nepalaikomas piktogramos formatas';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Nepalaikomas failo tipas.';

  @override
  String get groupDmCouldntProcessImage => 'Nepavyko apdoroti nuotraukos';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Nepavyko apdoroti apkarpyto vaizdo. Bandykite dar kartą.';

  @override
  String get groupDmInvalidImage => 'Netinkamas paveikslėlis';

  @override
  String get groupDmInvalidImageBody =>
      'Šis paveikslėlis netinkamas. Pabandykite kitą.';

  @override
  String get groupDmAddFriends => 'Pridėti';

  @override
  String get groupDmOrSendInvite => 'arba išsiųskite pakvietimą draugui:';

  @override
  String get groupDmGenerateInviteLink => 'Generuoti kvietimo nuorodą';

  @override
  String get groupDmCreateInvite => 'Kurti';

  @override
  String get groupDmInviteExpires24Hours =>
      'Jūsų kvietimas baigs galioti po 24 val';

  @override
  String get groupDmAddFriendFailed =>
      'Nepavyko pridėti šio draugo į grupę. Bandykite dar kartą.';

  @override
  String get groupDmAddFailed => 'Nepavyko pridėti prie grupės';

  @override
  String get groupDmGroupFull =>
      'Ši grupė pilna. Pašalinkite ką nors prieš pridėdami daugiau žmonių.';

  @override
  String get groupDmRateLimited =>
      'Jūs per greitai. Palaukite ir bandykite dar kartą.';

  @override
  String get groupDmCreateInviteFailed => 'Nepavyko sukurti kvietimo nuorodos';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Nepavyko sugeneruoti kvietimo nuorodos. Bandykite dar kartą.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Nepavyko sukurti kvietimo nuorodos. Pabandykite dar kartą.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Neturite leidimo kurti kvietimo šiame kanale.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Ši bendruomenė pasiekė kvietimų limitą.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Svečių kvietimų kūrimas šiai bendruomenei laikinai išjungtas.';

  @override
  String get groupDmCopyInviteFailed =>
      'Nepavyko nukopijuoti kvietimo nuorodos';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Tik grupės savininkas gali tvarkyti kvietimus.';

  @override
  String get groupDmNoInvitesCreated => 'Nėra sukurtų pakvietimų';

  @override
  String get groupDmLoadingInvites => 'Įkeliami kvietimai...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Nepavyko įkelti kvietimų. Bandykite dar kartą.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Atšaukti šį kvietimą? Veiksmo anuliuoti nebus galima.';

  @override
  String get groupDmInviteRevoked => 'Kvietimas atšauktas';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Sukurta $name. Baigiasi po $time.';
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
  String get composerOpenExpressionPicker =>
      'Atidaryti jaustukų ir medijos pasirinktuvę';

  @override
  String get composerShowKeyboard => 'Rodyti klaviatūrą';

  @override
  String get composerCloseAttachmentPanel => 'Uždaryti priedų pasirinkiklį';

  @override
  String get chatAttachmentPanelPhotos => 'Nuotraukos';

  @override
  String get chatAttachmentPanelFiles => 'Failai';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Reikalinga prieiga prie nuotraukų bibliotekos';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Leiskite prieigą prie nuotraukų bibliotekos, kad galėtumėte peržiūrėti ir pridėti naujausias nuotraukas bei vaizdo įrašus.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Atidaryti nustatymus';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', siunčiama';

  @override
  String get messageAccessibilityFailedSuffix => ', nepavyko nusiųsti';

  @override
  String get messageAccessibilityAttachmentSummary => 'priedas';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count priedai';
  }

  @override
  String get messageAccessibilityImageSummary => 'paveikslėlis';

  @override
  String get messageAccessibilityVideoSummary => 'vaizdo įrašas';

  @override
  String get messageAccessibilityAudioSummary => 'garso failas';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'lipdukas $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'failas $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'paslėptas priedas';

  @override
  String get messageAccessibilityEmbedSummary => 'įterptasis elementas';

  @override
  String get messageAccessibilityEmptySummary => 'žinutė';

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
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Ieškoti nustatymų...';

  @override
  String get userSettingsSearchFieldLabel => 'Ieškoti nustatymų';

  @override
  String get userSettingsSearchClear => 'Išvalyti paiešką';

  @override
  String get userSettingsSearchNoResults => 'Nustatymų nerasta';

  @override
  String get userSettingsNavProfile => 'Profilis';

  @override
  String get userSettingsNavSecurityLogin => 'Sauga ir prisijungimas';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Dovanos';

  @override
  String get giftSettingsClaimAccountTitle => 'Pasiimkite paskyrą';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Susiekite savo paskyrą, kad galėtumėte išpirkti arba tvarkyti „Plutonium“ dovanų kodus.';

  @override
  String get giftSettingsRedeemTitle => 'Išpirkti dovaną';

  @override
  String get giftSettingsRedeemDescription =>
      'Įveskite dovanos kodą, kad aktyvuotumėte „Plutonium“ savo paskyroje.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Įveskite dovanos kodą…';

  @override
  String get giftSettingsRedeemButton => 'Išpirkti';

  @override
  String get giftSettingsRedeemSuccess =>
      'Dovaną pavyko panaudoti. Mėgaukitės „Plutonium“.';

  @override
  String get giftSettingsPurchasedTitle => 'Įsigytos dovanos';

  @override
  String get giftSettingsPurchasedDescription =>
      'Tvarkykite įsigytus „Plutonium“ dovanų kodus. Pasidalinkite dovanos URL su ypatingu žmogumi arba išpirkite jį sau!';

  @override
  String get giftSettingsEmptyTitle => 'Dar nėra dovanų';

  @override
  String get giftSettingsEmptyDescription =>
      'Pirkite „Plutonium“ dovaną iš „Plutonium“ skirtuko, kad pasidalintumėte su draugais.';

  @override
  String get giftSettingsGoToPlutonium => 'Eiti į Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Nepavyko įkelti dovanų inventoriaus';

  @override
  String get giftSettingsLoadFailedDescription => 'Bandyti dar kartą vėliau.';

  @override
  String get giftSettingsTryAgain => 'Bandyti dar kartą';

  @override
  String get giftSettingsGiftUrl => 'Dovanos URL';

  @override
  String get giftSettingsCopy => 'Kopijuoti';

  @override
  String get giftSettingsCopied => 'Nukopijuota';

  @override
  String get giftSettingsGiftUrlCopied =>
      'Dovanos URL nukopijuotas į iškarpinę!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Nepavyko nukopijuoti dovanos URL';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Įsigyta $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Panaudota $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Panaudojo $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Ši dovana jau panaudota';

  @override
  String get giftSettingsRedeemForYourself => 'Išpirkti sau';

  @override
  String get giftSettingsShareWithFriend => 'Dalintis su draugu';

  @override
  String get premiumPlutoniumTagline =>
      'Atraskite didesnius limitus ir išskirtines funkcijas, kartu palaikydami nepriklausomą komunikacijos platformą.';

  @override
  String get premiumPurchaseMode => 'Pirkimo režimas';

  @override
  String get premiumForMe => 'Man';

  @override
  String get premiumAsAGift => 'Kaip dovaną';

  @override
  String get premiumMonthly => 'Mėnesinis';

  @override
  String get premiumYearly => 'Metinis';

  @override
  String get premiumPerMonth => 'per mėnesį';

  @override
  String get premiumPerYear => 'per metus';

  @override
  String get premiumOneTimePurchase => 'vienkartinis pirkinys';

  @override
  String get premiumSave17 => 'Sutaupykite 17 %';

  @override
  String get premiumUpgradeNow => 'Atnaujinti dabar';

  @override
  String get premiumBuyGift => 'Pirkti dovaną';

  @override
  String get premiumOneYearGift => '1 metų dovana';

  @override
  String get premiumOneMonthGift => '1 mėnesio dovana';

  @override
  String get premiumMostPopular => 'Populiariausias';

  @override
  String get premiumScrollPrompt =>
      'Slinkite žemyn, kad pamatytumėte visas „Plutonium“ teikiamas privilegijas';

  @override
  String get premiumFreeVsPlutonium => 'Nemokama ir Plutonium';

  @override
  String get premiumFreeColumn => 'Nemokama';

  @override
  String get premiumGiftSectionTitle => 'Padovanok Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Pasidalykite „Plutonium“ patirtimi su draugais, įsigydami dovanų prenumeratą.';

  @override
  String get premiumGiftBannerOne => 'Jūsų laukia naujas dovanų kodas!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Jūs turite $count naujų dovanų kodų!';
  }

  @override
  String get premiumViewGifts => 'Peržiūrėti dovanas';

  @override
  String get premiumReadyToUpgrade => 'Pasiruošę atnaujinti?';

  @override
  String get premiumReadyToBuyGift => 'Pasiruošę pirkti dovaną?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Mėnesinis $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Metinis $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 metai $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 mėn. $price';
  }

  @override
  String get premiumManageSubscription => 'Tvarkyti prenumeratą';

  @override
  String get premiumRedeemGiftCode => 'Išpirkti dovanos kodą';

  @override
  String get premiumGiftBadge => 'Dovana';

  @override
  String get premiumCancelSubscriptionTitle => 'Atšaukti prenumeratą?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Privalumai galios iki kito atnaujinimo datos, o tada turėsite 3 dienų pereinamąjį laikotarpį, kad vėl užsiprenumeruotumėte ir išsaugotumėte prenumeratos istoriją.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Atšaukti prenumeratą';

  @override
  String get premiumKeepSubscription => 'Palikti prenumeratą';

  @override
  String get premiumPurchaseHistoryTitle => 'Pirkimų istorija';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Jūsų naujausios sąskaitos faktūros. Norėdami pakeisti savo prenumeratos mokėjimo būdą, pridėkite arba pasirinkite jį atsiskaitymo portale ir nustatykite kaip numatytąjį.';

  @override
  String get premiumManagePaymentMethods => 'Mokėjimo metodų tvarkymas';

  @override
  String get premiumBillingHistory => 'Atsiskaitymų istorija';

  @override
  String get premiumSelfServeRefundTitle => 'Grąžinimas savitarnos būdu';

  @override
  String get premiumSelfServeRefundButton => 'Grąžinti naujausią pirkinį';

  @override
  String get premiumDisclaimerAgreementPrefix => 'Pirkdami sutinkate su mūsų ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Pirkdami sutikote su mūsų ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' ir ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktyvus iki $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Atšaukiama';

  @override
  String premiumCancelsOn(String date) {
    return 'Atsisakysite paslaugos $date. Privalumai liks aktyvūs iki tol.';
  }

  @override
  String get premiumReactivateSubscription => 'Suaktyvinti iš naujo';

  @override
  String premiumGiftedUntil(String date) {
    return 'Dovanota iki $date. Automatiškai nepratęsiama.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Funkcija';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Pirkdami sutinkate su mūsų $terms ir $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Pinigų grąžinimas savitarnos būdu galimas per 3 dienas nuo apmokėjimo, kartą per 30 dienų. Grąžinus pinigus už prenumeratą, ji atšaukiama. Pirkėjai iš ES / EEE atsisako 14 dienų atsisakymo teisės atsiskaitydami, kad galėtų nedelsiant pasiekti turinį. Naudokite pinigų grąžinimo mygtuką programėlėje, o ne atšaukimą. Atšaukimai gali visam laikui apriboti jūsų paskyrą. \"Stripe\" saugiai tvarko mokėjimus. Mes niekada nematome viso jūsų kortelės numerio.';

  @override
  String get premiumTermsOfService => 'Paslaugų teikimo sąlygos';

  @override
  String get premiumPrivacyPolicy => 'Privatumo politika';

  @override
  String get premiumCheckoutStartFailedTitle => 'Nepavyko pradėti atsiskaitymo';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Nepavyko pradėti atsiskaitymo. Bandykite dar kartą po kurio laiko.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Šiuo metu naudojatės dovanų prenumerata. Ji nebus atnaujinta. Galite išpirkti daugiau dovanų kodų, kad ją pratęstumėte. Pasibaigus dovanų prenumeratos laikotarpiui, galėsite pradėti pasikartojančias prenumeratas.';

  @override
  String get premiumPlanUnavailable =>
      'Šis planas nepasiekiamas. Susisiekite su palaikymo komanda.';

  @override
  String get premiumCompletePaymentTitle => 'Užbaigti mokėjimą';

  @override
  String get premiumCompletePaymentBody =>
      'Dabar būsite nukreipti į „Stripe“, kad užbaigtumėte mokėjimą. Grįžkite į „Fluxer“, kai baigsite.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Pasirinkite mokėjimo būdą';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Mokėkite „Pix automático“, kad tiesiogiai įgaliotumėte pasikartojančius mokesčius iš savo Brazilijos banko. Arba pasirinkite „naudoti kortelę“, kad kitame „Stripe“ ekrane įvestumėte kredito kortelę.';

  @override
  String get premiumUsePix => 'Naudoti „Pix“';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Mokėkite naudodami UPI, kad nustatytumėte Indijos banko RBI reikalavimus atitinkantį elektroninį įgaliojimą. Arba pasirinkite naudoti kortelę, kad kitame „Stripe“ ekrane įvestumėte kredito kortelės duomenis.';

  @override
  String get premiumUseUpi => 'Naudoti UPI';

  @override
  String get premiumUseCard => 'Naudoti kortelę';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Nepavyko atidaryti atsiskaitymo portalo';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Kažkas nutiko atidarant atsiskaitymo portalą. Bandykite dar kartą po kelių akimirkų.';

  @override
  String get premiumAlreadyVisionaryTitle =>
      'Jūs jau esate \"Visionary\" narys';

  @override
  String get premiumAlreadyVisionaryBody =>
      '\"Visionary\" jau apima nuolatinę prieigą, todėl pasikartojanti prenumerata nereikalinga. Vis tiek galite pirkti dovanų kitiems.';

  @override
  String get premiumExistingSubscriptionTitle => 'Prenumerata jau yra';

  @override
  String get premiumExistingSubscriptionBody =>
      'Jūsų paskyrai radome galiojančią „Fluxer Plutonium“ prenumeratą. Tvarkykite ją saugiame atsiskaitymo portale, kad atnaujintumėte mokėjimo duomenis arba patikrintumėte atnaujinimo būseną. Jei ką tik sumokėjote, palaukite minutę ir iš naujo atidarykite šį puslapį.';

  @override
  String get premiumPurchasesDisabledTitle => 'Pirkimai nepasiekiami';

  @override
  String get premiumPurchasesDisabledBody =>
      'Pirkimai šiai paskyrai yra išjungti. Jei manote, kad tai klaida, susisiekite su support@fluxer.app.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Prisijunkite prie savo paskyros, kad įsigytumėte Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Norėdami įsigyti „Fluxer Plutonium“, turite patvirtinti savo el. paštą.';

  @override
  String get premiumPerkCustomUsernameTag =>
      'Pasirinktinis naudotojo vardo žymuo';

  @override
  String get premiumPerkPerCommunityProfiles =>
      'Kiekvienos bendruomenės profiliai';

  @override
  String get premiumPerkMessageScheduling => 'Pranešimų planavimas';

  @override
  String get premiumPerkProfileBadge => 'Profilio ženklelis';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Pasirinktiniai vaizdo fonai';

  @override
  String get premiumPerkEntranceSounds => 'Įėjimo garsai';

  @override
  String get premiumPerkCommunities => 'Bendruomenės';

  @override
  String get premiumPerkMessageCharacterLimit => 'Žinučių simbolių limitas';

  @override
  String get premiumPerkBookmarkedMessages => 'Įsimintos žinutės';

  @override
  String get premiumPerkFileUploadSize => 'Įkeliamo failo dydis';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emotikonių ir lipdukų rinkiniai';

  @override
  String get premiumPerkSavedMedia => 'Išsaugota medija';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Naudoti animuotus jaustukus';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Prieiga prie jaustukų ir lipdukų visame pasaulyje';

  @override
  String get premiumPerkVideoQuality => 'Vaizdo kokybė';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animuoti avatarai ir profilio reklamjuostės';

  @override
  String get premiumPerkEarlyAccess => 'Ankstyvoji prieiga prie naujų funkcijų';

  @override
  String get premiumPerkCustomThemes => 'Tinkintos temos';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Iki 4K/60 kadr./s';

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
  String get userSettingsNavShortcuts => 'Spartieji klavišai';

  @override
  String get audioAndVideoAudioSectionTitle => 'Garsas';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Nustatykite mikrofoną, garsiakalbius ir balso apdorojimą.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Vaizdo įrašas';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Nustatykite savo kameros ir ekrano bendrinimo kokybę.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Elgesys skambučio metu';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Valdyti patvirtinimo raginimus balso ir vaizdo skambučiuose.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Įvesties įrenginys';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Išvesties įrenginys';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Numatytasis';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Naudoti garsiakalbį';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Kai išjungta, garsas bus leidžiamas per ausinę arba prijungtas ausines.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Įvesties garsumas';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Išvesties garsumas';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Balso apdorojimas';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Fokusuotas balsas';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Rekomenduojama. Išvalo mikrofoną, kad kalba būtų aiški.';

  @override
  String get audioAndVideoDirectInputLabel => 'Tiesioginė įvestis';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Siunčia jūsų garso įrašą nepakeistą. Geriausia, jei naudojate išorinę garso programinę įrangą.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Pasirinktinis';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Pritaikykite kiekvieną nustatymą patys: triukšmo slopinimą, aido panaikinimą ir stiprinimą.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Triukšmo slopinimas';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Patobulinta';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standartinis';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Nėra';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Aido slopinimas';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatinis stiprinimo valdymas';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Sulygina mikrofono garsumą. Išjungta, kai įjungtas patobulintas slopinimas.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mikrofono patikra';

  @override
  String get audioAndVideoMicTestStartLabel => 'Pradėti mikrofono testą';

  @override
  String get audioAndVideoMicTestStopLabel => 'Sustabdyti mikrofono testą';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '„$productName“ reikalinga prieiga prie mikrofono, kad būtų galima patikrinti jūsų garsą.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Atspindėti kamerą';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kameros kokybė';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Ekrano bendrinimo kokybė';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Kadrų dažnis';

  @override
  String get audioAndVideoFrameRate15Label => '15 kadrų per sekundę';

  @override
  String get audioAndVideoFrameRate30Label => '30 kadrų per sekundę';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p ir 60 FPS reikalauja $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Šis serveris šiuo metu leidžia bendrinti ekraną iki 720p raiška ir 30 kadrų per sekundę.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return 'Kad galėtų rodyti jūsų įrenginius, „$productName\" reikia prieigos prie mikrofono.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName reikia prieigos prie kameros, kad būtų galima parodyti jūsų įrenginius.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Neklausti, kai slėpsiu savo kamerą';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Neberodyti perspėjimo, kai slėpsiu savo ekrano bendrinimą';

  @override
  String get userSettingsNavNotifications => 'Pranešimai';

  @override
  String get notificationsGeneralSectionTitle => 'Pagrindiniai';

  @override
  String get notificationsEnableNotificationsLabel => 'Įjungti pranešimus';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Gaukite pranešimus, kai gaunate žinučių. Gali reikėti leisti \"$productName\" siųsti pranešimus įrenginio nustatymuose. Norėdami valdyti pranešimus pagal kanalą ar bendruomenę, atidarykite pranešimų nustatymus bendruomenės meniu.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Įjungti darbalaukio pranešimus';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Naudoja OS pranešimų centrą. Norėdami valdyti pranešimus pagal kanalą / bendruomenę, dešiniuoju pelės mygtuku spustelėkite bendruomenės piktogramą ir atidarykite pranešimų nustatymus.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Įjungti naršyklės pranešimus';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Gaukite pranešimus, kai gaunate žinučių. Gali reikėti leisti pranešimus naršyklės nustatymuose. Norėdami valdyti pranešimus pagal kanalą / bendruomenę, dešiniuoju pelės mygtuku spustelėkite bendruomenės piktogramą ir atidarykite pranešimų nustatymus.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Neaktyvių tiesioginių pranešimų skirtasis laikas';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '„$productName“ nesiunčia pranešimų į jūsų mobilųjį įrenginį, kai esate prie kompiuterio. Nustatykite, po kiek laiko neaktyvumo darbalaukyje turėtų būti pradėti siųsti pranešimai.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minutė';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minutės';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Paminėjimo nuostatos';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Atsakymo paminėjimo nuostatos';

  @override
  String get notificationsMentionNoPreferenceName => 'Nėra nuostatų';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Gerbti siuntėjo ketinimus, be įspėjimo, kai jis įjungia @ paminėjimą';

  @override
  String get notificationsMentionPreferMentionName =>
      'Pageidimas \"@paminėti\"';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Numatytasis atsakymas į @paminėjimą ir įspėjimas siuntėjui, jei jis tai išjungs';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Nenurodyti @paminėjimo';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Numatytieji atsakymai, kad būtų praleistas @paminėjimas ir įspėtas siuntėjas, jei jis jį įgalina';

  @override
  String get notificationsTtsSectionTitle => 'Teksto į balsą pranešimai';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Įjungti /tts kalbos atkūrimą';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Leisti /tts perskaityti jūsų žinutę balsu. Išjungus šį nustatymą, šios komandos liks kaip įprastas tekstas.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Koreguoti atkūrimo greitį čia ';

  @override
  String get notificationsTtsAccessibilityLinkLabel =>
      'Pritaikymas neįgaliesiems';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatinis pranešimų įgarsinimas';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Konvertuoja gaunamą turinį į kalbą, nepriklausomai nuo to, ar jis gautas iš /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Visi kanalai';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Tegul kiekviena gaunama žinutė yra perskaitoma, nepriklausomai nuo to, kuris kanalas atidarytas.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Tik aktyvus kanalas';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Įgarsina tik kanalą, kurį šiuo metu žiūrite. Įgarsinimas seka jus tarp kanalų.';

  @override
  String get notificationsTtsModeNeverName => 'Niekada automatiškai';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Tylėti, nebent kas nors rankiniu būdu paleidžia /tts.';

  @override
  String get notificationsTtsModeAriaLabel => 'Skaityti visas žinutes balsu';

  @override
  String get notificationsSoundsSectionTitle => 'Garsai';

  @override
  String get notificationsMasterVolumeLabel => 'Pagrindinis garsumas';

  @override
  String get notificationsMasterVolumeDescription =>
      'Nustato kiekvieno garso efekto lygį. Atskiri garso nustatymai nepaiso šio.';

  @override
  String get notificationsResetToDefaultVolume => 'Atkurti numatytąjį garsumą';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Išjungti visus pranešimų garsus';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Jūsų esami pranešimų garso nustatymai bus išsaugoti.';

  @override
  String get notificationsShowMoreSoundEffects => 'Rodyti daugiau garso efektų';

  @override
  String get notificationsShowFewerSoundEffects => 'Rodyti mažiau garso efektų';

  @override
  String get notificationsPreviewSound => 'Peržiūrėti garsą';

  @override
  String get notificationsPerSoundVolumeTitle => 'Garsumo lygis';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Nustatykite pasirinktinius atskirų garsų lygius. Garsams be individualių nustatymų bus taikomas pagrindinis garso lygis.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktyvūs pasirinktinio garso garsumo nustatymų pakeitimai: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Pagal pagrindinį • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Atkurti \"$label\" numatytąjį garsumą';
  }

  @override
  String get notificationsResetAllOverrides => 'Atkurti visus pakeitimus';

  @override
  String notificationsMuteSound(String label) {
    return 'Išjungti garsą $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Įjungti garsą $label';
  }

  @override
  String get notificationsSoundMessage => 'Bendruomenės žinučių pranešimai';

  @override
  String get notificationsSoundDirectMessage =>
      'Tiesioginių žinučių pranešimai';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Dabartinio kanalo pranešimai';

  @override
  String get notificationsSoundMute => 'Balso nutildymas';

  @override
  String get notificationsSoundUnmute => 'Įjungti balsą';

  @override
  String get notificationsSoundDeaf => 'Balso išjungimas';

  @override
  String get notificationsSoundUndeaf => 'Balso atitildymas';

  @override
  String get notificationsSoundUserJoin => 'Vartotojas prisijungia prie kanalo';

  @override
  String get notificationsSoundUserLeave => 'Vartotojas palieka kanalą';

  @override
  String get notificationsSoundUserMove => 'Vartotojas perkėlė kanalą';

  @override
  String get notificationsSoundViewerJoin =>
      'Žiūrintysis prisijungia prie srauto';

  @override
  String get notificationsSoundViewerLeave => 'Žiūrintysis palieka srautą';

  @override
  String get notificationsSoundVoiceDisconnect => 'Balso ryšys nutrūko';

  @override
  String get notificationsSoundIncomingRing => 'Gaunamas skambutis';

  @override
  String get notificationsSoundCameraOn => 'Kamera įjungta';

  @override
  String get notificationsSoundCameraOff => 'Kamera išjungta';

  @override
  String get notificationsSoundScreenShareStart => 'Ekrano bendrinimo pradžia';

  @override
  String get notificationsSoundScreenShareStop =>
      'Ekrano bendrinimo sustabdymas';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Nepavyko atnaujinti tiesioginių pranešimų laiko limito. Pabandykite dar kartą.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Nepavyko atnaujinti minimų nuostatų. Pabandykite dar kartą.';

  @override
  String get notificationsPermissionDeniedTitle => 'Pranešimai užblokuoti';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Nepavyko įjungti pranešimų. Norėdami tęsti, leiskite pranešimų leidimus.';

  @override
  String get userSettingsNavLanguageAndTime => 'Kalba ir laikas';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Sąsajos kalba';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Pasirinkite kalbą, naudojamą visoje programėlėje';

  @override
  String get languageAndTimeOpenLanguageSettings =>
      'Atidaryti kalbos nustatymus';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Laiko formatas';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Pasirinkite, kaip laikas rodomas programėlėje';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Laiko formato pasirinkimas';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automatinis';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 valandų';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 valandų';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Programos kalba: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Sistemos lokalė: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Naudoti sistemos lokalę laiko formatui';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Nepavyko atnaujinti laiko formato';

  @override
  String get userSettingsNavDefaultApps => 'Numatytosios programos';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Naršyklė';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Pasirinkite, kuris naršyklė atsidarys palietus nuorodą.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Jei svetainei yra įdiegta programa, nuorodos pirmiausia atsidarys toje programoje.';

  @override
  String get defaultAppsWebBrowserInApp => 'Naršyklė programoje';

  @override
  String get defaultAppsWebBrowserExternal => 'Išorinė naršyklė';

  @override
  String get userSettingsNavAdvanced => 'Išplėstiniai nustatymai';

  @override
  String get advancedPerformanceReportingTitle => 'Našumo ataskaitos';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Padėkite tobulinti $productName, bendrindami anoniminius duomenis apie gedimus ir našumą.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Siųsti ataskaitas apie gedimus ir našumą';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Visi pranešti duomenys yra anonimiški ir siunčiami tik į $productName nuosavą stebėjimo tarnybą – nenaudojami jokie trečiųjų šalių paslaugų teikėjai.';
  }

  @override
  String get advancedSettingsConfigure => 'Konfigūruoti';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privatumas';

  @override
  String get advancedSettingsCategoryAppearance => 'Išvaizda';

  @override
  String get advancedSettingsCategoryAccessibility =>
      'Pritaikymas neįgaliesiems';

  @override
  String get advancedSettingsCategoryChat => 'Pokalbis';

  @override
  String get advancedSettingsCategoryMedia => 'Medija';

  @override
  String get advancedSettingsCategoryVoice => 'Balsas';

  @override
  String get advancedSettingsCategoryDeveloper => 'Kūrėjas';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Įjungti teksto žymėjimą';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Leisti pasirinkti tekstą programoje';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Įjunkite vaizdo įrašų peržiūros miniatiūras';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatiūra arba tiesioginis kadras, kai peržiūrimas vaizdo įrašas';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptinis grįžtamasis ryšys';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibracijos grįžtamasis ryšys palietus ir atliekant veiksmus. Nesinchronizuojama tarp įrenginių.';

  @override
  String get advancedSettingShowNekoLabel => 'Rodyti Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko katė, kuri vejasi jūsų žymeklį';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Rodyti Neko jūsų pokalbio įvestyje';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animacijos mastelio keitimas';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Sumažinti logotipą, išeinant iš paleidimo ekrano';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Klaviatūros patarimai';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Rodyti klavišų kombinacijų patarimus iššokančiose informacijos priemonėse.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Įjungti parankinius';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Rodyti mėgstamiausius elementus visoje programoje';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Prisijungimo prie balso kanalo veiksena';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Patvirtinimas arba dvigubas paspaudimas, norint prisijungti prie bendruomenės balsinės sesijos.';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Reikalauti dukart spustelėti norint prisijungti prie balso kanalų';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Patvirtinti prieš prisijungiant prie balso kanalų';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Automatiškai siųsti pasirinktus GIF';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Automatiškai siųsti GIF iš parinkiklio be patvirtinimo';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Įrašyti GIF parankinius kaip išsaugotą mediją';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Pasirinkite, kaip saugomi pažymėti GIF parankiniai';

  @override
  String get advancedSettingMediaButtonsLabel => 'Medijos mygtukai';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Pritaikykite, kurie mygtukai ir indikatoriai bus rodomi ant multimedijos failų ir įterptinių elementų';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Įkelkite failus prieš siųsdami';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Pradėkite siųsti prisegtukus, kai tik jie bus įtraukti į pranešimo lauką';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Pašalinti sekimo parametrus iš URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automatiškai pašalinti sekimo parametrus iš URL nuorodų siunčiamose žinutėse';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Pasitikėti visomis išorinėmis nuorodomis';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Praleisti išorinių nuorodų įspėjimą visiems domenams';

  @override
  String get advancedSettingSearchEnginesLabel => 'Paieškos sistemos';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Konfigūruokite paieškos sistemas, naudojamas išrinktam tekstui';

  @override
  String get advancedSettingTranslatorsLabel => 'Vertėjai';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Konfigūruokite vertėjų paslaugas, naudojamas pasirinktam tekstui';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Atvirkštinė vaizdų paieška';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Atsuktinių vaizdų paieškos paslaugų teikėjai';

  @override
  String get advancedSettingMessageActionBarLabel => 'Pranešimo veiksmų juosta';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Tinkinti veiksmų juostą, kuri rodoma užvedus pelę ant pranešimų';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Išraiškų automatinis pildymas';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Pasirinkite, kas atvaizduojama įvedant dvitaškį žinutės lauke';

  @override
  String get advancedSettingInputButtonsLabel => 'Pranešimų įvesties mygtukai';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Pasirinkite, kurie mygtukai bus rodomi pranešimų įvedimo lauke';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Slinkti į apačią išsiunčiant žinutę';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Pasirinkite, kaip pokalbis turi vykti po to, kai išsiunčiate pranešimą';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Praleisti patvirtinimą \"Pažymėti visus kaip perskaitytus\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Pažymėti visus neskaitytus gautuosius kanalus kaip perskaitytus iškart, neklausiant patvirtinimo';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Slėpti nutildytus kanalus pagal numatytuosius nustatymus';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Slėpti nutildytus kanalus iš bendruomenės šoninių juostų';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Rodyti GIF indikatorių';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Rodyti priedo galiojimo pabaigos indikatorių';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Rodyti ištrynimo mygtuką';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Rodyti atsisiuntimo mygtuką';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Rodyti parankinių mygtuką';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Rodyti įdėtųjų elementų slopinimo mygtuką';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Rodyti pranešimo veiksmų juostą';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Rodyti tik mygtuką \"Daugiau\"';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Rodyti greitas reakcijas';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Įjungti \"Shift\", kad išplėstumėte';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Rodyti numatytąsias jaustukų išraiškas automatinio užbaigimo metu';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Rodyti pasirinktinius jaustukus išraiškų automatinio pildymo funkcijose';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Rodyti lipdukus išraiškų automatinio pildymo metu';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Rodyti išsaugotą mediją raiškos automatinio pildymo funkcijose';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Rodyti GIF mygtuką';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Rodyti medijos mygtuką';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Rodyti lipdukų mygtuką';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Rodyti jaustukų mygtuką';

  @override
  String get advancedSettingShowSendButtonLabel => 'Rodyti siuntimo mygtuką';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Rodyti naujų įrenginių įspėjimus';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Naujų garso įrenginių užklausa';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Ryšio garsumo valdikliai';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Rodyti dalyvių garsumo slankiklius balsiniuose meniu kiekvienam įrenginiui';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Ekrano dalijimosi peržiūros elgsena';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Peržiūrėti, atidaryti išskleistame lange ir srauto miniatiūros';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Ekrano bendrinimo kodekas';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Vaizdo kodekas ekrano dalijimuisi';

  @override
  String get advancedSettingScreenShareCodecAuto =>
      'Automatinis (rekomenduojama)';

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
      'Pristabdyti ekrano bendrinimo peržiūrą fone';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Slėpti mano srauto peržiūros miniatiūrą';

  @override
  String get advancedSettingDeveloperModeLabel => 'Įjungti kūrėjo režimą';

  @override
  String get advancedSettingDeveloperModeDescription => 'Įjungti kūrėjo režimą';

  @override
  String get advancedSettingSearchEngineGoogle => 'Google';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'Bing';

  @override
  String get advancedSettingSearchEngineGoogleLens => '„Google Lens“';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => '„Google“ vertimas';

  @override
  String get advancedSettingTranslatorDeepL => '„DeepL“';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Numatytoji paieškos sistema';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Pasirinkite, kuri paieškos sistema bus naudojama pagal numatytuosius nustatymus ieškant pasirinkto teksto.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Integruotos paieškos sistemos';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Įjunkite arba išjunkite integruotas paieškos sistemas. Įjungtos sistemos rodomos pranešimo kontekstiniame meniu, kai pasirenkamas tekstas.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Pasirinktinės paieškos sistemos';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Pridėkite savo paieškos variklius su pasirinktiniu URL šablonu. Naudokite „$query“ kaip paieškos teksto vietos ženklą.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Pridėti paieškos variklį';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Įjunkite bent vieną paieškos variklį.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Pašalinti paieškos variklį';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Numatytasis vertėjas';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Pasirinkite, kuris vertėjas bus naudojamas pagal numatytuosius nustatymus verčiant pasirinktą tekstą.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Integruoti vertėjai';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Įjungti arba išjungti integruotus vertėjus. Įjungti vertėjai rodomi pranešimo kontekstiniame meniu, kai pasirenkamas tekstas.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Pasirinktiniai vertėjai';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Pridėkite savo vertėjus naudodami pasirinktinį URL modelį. Naudokite \'$query\' kaip teksto, kurį reikia išversti, vietos ženklą.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Pridėti vertėją';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Įjunkite bent vieną vertėją.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Pašalinti vertėją';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Numatytoji atvirkštinė vaizdų paieška';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Pasirinkite, kuri atvirkštinės vaizdų paieškos paslauga bus naudojama pagal numatytuosius nustatymus ieškant vaizdo.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Integruota atvirkštinė vaizdų paieška';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Įjunkite arba išjunkite integruotas atvirkštinės vaizdų paieškos paslaugas. Įjungtos paslaugos rodomos kontekstiniame paveikslėlių, avatarų, reklamjuosčių, lipdukų ir jaustukų meniu.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Pasirinktinė atvirkštinė vaizdų paieška';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Pridėkite savo atvirkštinės vaizdo paieškos paslaugų teikėjus su pasirinktiniu URL šablonu. Naudokite \'$url\' kaip vaizdo URL vietos rezervavimo simbolį.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Pridėti atvirkštinę vaizdų paiešką';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Įjunkite bent vieną atvirkštinės vaizdų paieškos teikėją.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Pašalinti atvirkštinę vaizdų paiešką';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Pridėti paieškos variklį';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Redaguoti paieškos variklį';

  @override
  String get advancedSettingAddTranslatorTitle => 'Pridėti vertimo teikėją';

  @override
  String get advancedSettingEditTranslatorTitle => 'Redaguoti vertimo teikėją';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Pridėti atvirkštinės vaizdų paieškos variklį';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Redaguoti atvirkštinės vaizdų paieškos variklį';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Pavadinimas';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL šablonas';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Mano paieškos variklis';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Mano vertėjas';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Mano atvirkštinė vaizdų paieška';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Naudokite \'$query\', kur turėtų būti įterptas paieškos tekstas.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Naudokite \'$query\', kur turėtų būti įterptas tekstas, kurį norite išversti.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Naudokite \'$url\', kur turėtų būti įterptas vaizdo URL.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Būtina nurodyti pavadinimą.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Reikalingas URL šablonas.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL modelis privalo turėti vietą „$query“.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL modelis turi turėti vietą „$url“.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL šablonas turi būti galiojantis URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Pridėti';

  @override
  String get advancedSettingEditSearchProviderAction => 'Redaguoti';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Pašalinti';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Ar tikrai norite pašalinti $engineName?';
  }

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
  String get userSettingsJoinFluxerLabs => 'Prisijunkite prie „Fluxer Labs“';

  @override
  String get userSettingsNavAppLicenses => 'Programos licencijos';

  @override
  String get userSettingsAppLicensesDescription =>
      'Atidaromas atvirasis kodas, naudojamas šioje programoje. Ši programa sukurta naudojant Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Nepavyko įkelti programos licencijų.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licencijų',
      one: '1 licencija',
    );
    return '$_temp0';
  }

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
  String get savedMessagesEmptyTitle => 'Nėra žymių';

  @override
  String get savedMessagesEmptyBody =>
      'Žinutes, kurias norite išsaugoti vėlesniam laikui, pažymėkite.';

  @override
  String get savedMessagesEndBody => 'Čia daugiau nieko nėra.';

  @override
  String get savedMessagesRemoveTooltip => 'Pašalinti žymę';

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
  String get uiSearch => 'Ieškoti';

  @override
  String get uiStartCall => 'Pradėti skambutį';

  @override
  String get uiStartVideoCall => 'Pradėti vaizdo skambutį';

  @override
  String get uiPlay => 'Groti';

  @override
  String get uiPause => 'Pauzė';

  @override
  String get uiDownload => 'Atsisiųsti';

  @override
  String get uiMoreActions => 'Daugiau veiksmų';

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
    return 'Tai praneš apie $count narius, turinčius $roleName vaidmenį. Tęsti?';
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
  String get guildNavbarGuildSelected => 'pasirinkta';

  @override
  String get guildNavbarGuildUnread => 'neskaityta';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paminėjimų',
      one: '1 paminėjimas',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'nutildyta';

  @override
  String get authShowPassword => 'Rodyti slaptažodį';

  @override
  String get authHidePassword => 'Slėpti slaptažodį';

  @override
  String get chatLoadingMessages => 'Įkeliamos žinutės';

  @override
  String get friendsMessageFriend => 'Žinutė';

  @override
  String get friendsFriendActions => 'Veiksmai su draugu';

  @override
  String get friendsAcceptRequest => 'Priimti draugo užklausą';

  @override
  String get friendsDeclineRequest => 'Atmesti draugystės prašymą';

  @override
  String get friendsCancelRequest => 'Atšaukti draugo užklausą';

  @override
  String get friendsOpenInbox => 'Gauta';

  @override
  String get profileRemoveFriend => 'Pašalinti draugą';

  @override
  String get profileUnblockUser => 'Atblokuoti naudotoją';

  @override
  String get profileAcceptFriendRequest => 'Priimti draugo užklausą';

  @override
  String get profileCancelFriendRequest => 'Atšaukti draugo užklausą';

  @override
  String get profileSendFriendRequest => 'Pridėti draugą';

  @override
  String get accountOverflowMenu => 'Paskyros parinktys';

  @override
  String get navHome => 'Pagrindinis';

  @override
  String get navNotifications => 'Pranešimai';

  @override
  String get navYou => 'Jūs';

  @override
  String get guildFolderSettingsTitle => 'Aplanko nustatymai';

  @override
  String get guildFolderNameLabel => 'Aplanko pavadinimas';

  @override
  String get guildFolderColorLabel => 'Aplanko spalva';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Rodyti piktogramą sutraukus';

  @override
  String get guildFolderIconLabel => 'Aplanko piktograma';

  @override
  String get guildFolderDelete => 'Ištrinti aplanką';

  @override
  String get guildFolderIconFolder => 'Aplankas';

  @override
  String get guildFolderIconStar => 'Žvaigždutė';

  @override
  String get guildFolderIconHeart => 'Širdelė';

  @override
  String get guildFolderIconBookmark => 'Žymė';

  @override
  String get guildFolderIconGameController => 'Žaidimų pultelis';

  @override
  String get guildFolderIconShield => 'Skydas';

  @override
  String get guildFolderIconMusicNote => 'Muzikos nata';

  @override
  String get guildFolderMarkAsRead => 'Pažymėti aplanką kaip perskaitytą';

  @override
  String get guildBulkMuteCommunities => 'Nutildyti bendruomenes';

  @override
  String get guildBulkUnmuteCommunities => 'Įjungti bendruomenių garsą';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Bendruomenės pranešimų nustatymai';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Bendruomenės privatumo nustatymai';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Leisti @everyone ir @here';

  @override
  String get guildBulkAllowRoleMentions => 'Leisti paminėti vaidmenį';

  @override
  String get guildBulkEnableMobilePush =>
      'Įjungti mobiliuosius tiesioginius pranešimus';

  @override
  String get guildBulkDisableMobilePush =>
      'Išjungti mobiliuosius tiesioginius pranešimus';

  @override
  String get guildBulkAllowDirectMessages => 'Leisti tiesioginius pranešimus';

  @override
  String get guildBulkBlockDirectMessages => 'Blokuoti tiesioginius pranešimus';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Leisti tiesiogines roboto žinutes';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Blokuoti roboto tiesioginius pranešimus';

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
  String get guildNavbarChannelTypeSelection => 'Kanalo tipo pasirinkimas';

  @override
  String get guildNavbarCreateCategory => 'Kurti kategoriją';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Pasiekiama tik $productName darbuotojams';
  }

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
  String get guildMenuSettingsEmoji => 'Jaustukai';

  @override
  String get guildMenuSettingsStickers => 'Lipdukai';

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
  String get guildMenuSettingsInviteLinks => 'Kvietimai';

  @override
  String get guildMenuSettingsBans => 'Uždrausti nariai';

  @override
  String get guildMenuSettingsChannels => 'Kanalai';

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
  String get guildSettingsCreateRole => 'Kurti vaidmenį';

  @override
  String get guildSettingsRolesListTitle => 'Vaidmenys';

  @override
  String get guildSettingsRolesNewRole => 'Naujas vaidmuo';

  @override
  String get guildSettingsRolesDeleteRole => 'Ištrinti vaidmenį';

  @override
  String get guildSettingsRolesBackToRoles => 'Atgal į vaidmenis';

  @override
  String get guildSettingsBackToSettings => 'Grįžti į nustatymus';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Redaguoti \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Konfigūruoti vaidmens nustatymus ir leidimus';

  @override
  String get guildSettingsRolesDisplaySection => 'Rodymas';

  @override
  String get guildSettingsRolesRoleName => 'Vaidmens pavadinimas';

  @override
  String get guildSettingsRolesRoleColor => 'Rolės spalva';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Įveskite spalvą (šešioliktainis, rgb(), hsl() arba pavadinimas) arba naudokite parinkiklį.';

  @override
  String get guildSettingsRolesShowSeparately => 'Rodyti šį vaidmenį atskirai';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Narių sąraše rodo narius, turinčius šį vaidmenį, atskirame skyriuje.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Leisti paminėjimus šiam vaidmeniui';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Nariai, turintys „$permission“ leidimą, visada gali paminėti vaidmenis, nepaisant šio nustatymo.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Naudokite šį mygtuką, kad greitai išvalytumėte visus leidimus.';

  @override
  String get guildSettingsRolesClearPermissions => 'Išvalyti leidimus';

  @override
  String get guildSettingsRolesPermissionsSection => 'Leidimai';

  @override
  String get guildSettingsRolesSearchPermissions => 'Ieškoti leidimų';

  @override
  String get guildSettingsRolesDenseLayout => 'Tankus išdėstymas';

  @override
  String get guildSettingsRolesComfyLayout => 'Patogus išdėstymas';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Perjungti į tankų išdėstymą';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Perjungti į patogų išdėstymą';

  @override
  String get guildSettingsRolesSingleColumn => 'Vienas stulpelis';

  @override
  String get guildSettingsRolesTwoColumns => 'Du stulpeliai';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Perjungti į vieną stulpelį';

  @override
  String get guildSettingsRolesSwitchToTwoColumns =>
      'Perjungti į du stulpelius';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Nėra leidimų';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Pasirinktinė iškėlimo tvarka';

  @override
  String get guildSettingsRolesHoistOrder => 'Rikiavimo tvarka';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Atkurti numatytuosius';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Vilkite vaidmenis, kad pakeistumėte jų rodymo tvarką narių sąraše.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Nėra iškeltų vaidmenų. Įjunkite \"Rodyti šį vaidmenį atskirai\" prie vaidmens, kad jį čia matytumėte.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Negalite redaguoti šio vaidmens, nes tai yra jūsų aukščiausias vaidmuo arba jis yra aukščiau už jus';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Norint redaguoti šiuos leidimus, reikia turėti „$permission“ leidimą';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Negalite redaguoti vaidmens, kuris yra tokio pat lygio arba aukštesnis už jūsų aukščiausią vaidmenį';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Negalite suteikti leidimo, kurio neturite';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Negalite pašalinti šio leidimo, nes jis būtų pašalintas iš jūsų paties';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Vaidmenys sėkmingai atnaujinti';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Vaidmuo sėkmingai sukurtas';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Vaidmuo sėkmingai ištrintas';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Rikiavimo tvarka atkurta į numatytąją';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'Reikalingas vaidmens pavadinimas';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Prieš išsaugant, suteikite vaidmeniui pavadinimą.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Nepavyko sukurti vaidmens';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Nepavyko atnaujinti vaidmenų';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Nepavyko ištrinti vaidmens';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'Nepavyko ištrinti \"$name\". Pabandykite dar kartą.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Nepavyko atkurti iškėlimo tvarkos';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Bandyti dar kartą po akimirkos.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Ar tikrai norite ištrinti $name vaidmenį? Visi nariai, turintys šį vaidmenį, jo neturės.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Visa bendruomenė';

  @override
  String get permissionCategoryMessagesMedia => 'Žinutės ir medija';

  @override
  String get permissionCategoryModeration => 'Moderavimas';

  @override
  String get permissionCategoryChannelAccess => 'Prieiga prie kanalo';

  @override
  String get permissionCategoryChannelManagement => 'Kanalų valdymas';

  @override
  String get permissionCategoryAudioVideo => 'Garsas ir vaizdas';

  @override
  String get permissionUnknown => 'Nežinomas leidimas';

  @override
  String get permissionAdministrator => 'Administratorius';

  @override
  String get permissionAdministratorDescription =>
      'Suteikia visus leidimus ir apeina kanalo apribojimus. Labai jautru.';

  @override
  String get permissionViewActivityLog => 'Peržiūrėti veiklos žurnalą';

  @override
  String get permissionViewActivityLogDescription =>
      'Skaityti bendruomenės veiklos žurnalą apie pakeitimus ir moderavimo veiksmus.';

  @override
  String get permissionManageCommunity => 'Tvarkyti bendruomenę';

  @override
  String get permissionManageCommunityDescription =>
      'Redaguoti bendruosius nustatymus, pvz., pavadinimą, aprašą ir piktogramą.';

  @override
  String get permissionManageRoles => 'Tvarkyti vaidmenis';

  @override
  String get permissionManageRolesDescription =>
      'Kurkite, redaguokite arba ištrinkite vaidmenis, esančius žemiau jūsų aukščiausio vaidmens. Taip pat leidžia redaguoti kanalo leidimų perrašymus.';

  @override
  String get permissionManageChannels => 'Tvarkyti kanalus';

  @override
  String get permissionManageChannel => 'Tvarkyti kanalą';

  @override
  String get permissionManageChannelDescription =>
      'Pervardyti ir redaguoti šio kanalo nustatymus.';

  @override
  String get permissionManagePermissions => 'Tvarkyti leidimus';

  @override
  String get permissionManagePermissionsDescription =>
      'Redaguoti šio kanalo vaidmenų ir narių perrašymus.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Kurkite, redaguokite arba ištrinkite šio kanalo \"webhook\" nuorodas.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Peržiūrėti šio kanalo narių sąrašą.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Tvarkykite šio kanalo kvietimo nuorodas.';

  @override
  String get permissionOverwriteDeny => 'Atmesti';

  @override
  String get permissionOverwriteInherit => 'Neutralus (paveldėti)';

  @override
  String get permissionOverwriteAllow => 'Leisti';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Šiais mygtukais galite greitai nustatyti visus leidimus.';

  @override
  String get permissionManageChannelsDescription =>
      'Kurti, redaguoti arba ištrinti kanalus ir kategorijas.';

  @override
  String get permissionKickMembers => 'Pašalinti narius';

  @override
  String get permissionBanMembers => 'Uždrausti nariams';

  @override
  String get permissionCreateInviteLinks => 'Kurti kvietimo nuorodas';

  @override
  String get permissionChangeOwnNickname => 'Keisti savo slapyvardį';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Atnaujinkite savo slapyvardį.';

  @override
  String get permissionManageNicknames => 'Tvarkyti slapyvardžius';

  @override
  String get permissionManageNicknamesDescription =>
      'Keisti kitų narių slapyvardžius.';

  @override
  String get permissionCreateEmojiStickers => 'Kurti jaustukus ir lipdukus';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Įkelkite naujų jaustukų ir lipdukų bei tvarkykite savo kūrinius.';

  @override
  String get permissionManageEmojiStickers => 'Tvarkyti jaustukus ir lipdukus';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Redaguoti arba ištrinti kitų narių sukurtus jaustukus ir lipdukus.';

  @override
  String get permissionManageWebhooks => 'Tvarkyti žiniatinklio kablius';

  @override
  String get permissionManageWebhooksDescription =>
      'Kurti, redaguoti arba šalinti \"webhook\" nuorodas.';

  @override
  String get permissionSendMessages => 'Siųsti žinutes';

  @override
  String get permissionSendTtsMessages => 'Siųsti TTS žinutes';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Siųsti tekstinius pranešimus balsu.';

  @override
  String get permissionManageMessages => 'Tvarkyti pranešimus';

  @override
  String get permissionManageMessagesDescription =>
      'Ištrinti kitų narių žinutes. Prisegimas valdomas atskirai.';

  @override
  String get permissionPinMessages => 'Prisegti žinutes';

  @override
  String get permissionEmbedLinks => 'Įterpti nuorodas';

  @override
  String get permissionAttachFiles => 'Pridėti failus';

  @override
  String get permissionMentionEveryone => 'Naudokite @everyone/@here ir @role';

  @override
  String get permissionMentionEveryoneDescription =>
      'Paminėti visus arba bet kurį vaidmenį (net jei vaidmens nustatymai neleidžia jo minėti).';

  @override
  String get permissionUseExternalEmoji => 'Naudoti išorinius jaustukus';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Naudoti jaustukus iš kitų bendruomenių.';

  @override
  String get permissionUseExternalStickers => 'Naudoti išorinius lipdukus';

  @override
  String get permissionAddReactions => 'Pridėti reakcijas';

  @override
  String get permissionAddReactionsDescription =>
      'Pridėti naujų reakcijų į žinutes.';

  @override
  String get permissionBypassSlowmode => 'Nepaisyti lėtojo režimo';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Nepaisyti pranešimų siuntimo apribojimų kanale.';

  @override
  String get permissionTimeOutMembers => 'Laikinai apriboti narius';

  @override
  String get permissionTimeOutMembersDescription =>
      'Neleisti nariams siųsti žinučių, reaguoti ir prisijungti prie balso pokalbių tam tikrą laiką.';

  @override
  String get permissionViewChannel => 'Peržiūrėti kanalą';

  @override
  String get permissionViewChannelMembers => 'Peržiūrėti kanalo narius';

  @override
  String get permissionViewChannelMembersDescription =>
      'Peržiūrėti šios bendruomenės kanalų narių sąrašą.';

  @override
  String get permissionConnect => 'Prijungti';

  @override
  String get permissionSpeak => 'Kalbėti';

  @override
  String get permissionStreamVideo => 'Transliuoti vaizdą';

  @override
  String get permissionUseVoiceActivity => 'Naudoti balso aktyvavimą';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Be šio leidimo reikalingas \"paspausk ir kalbėk\".';

  @override
  String get permissionPrioritySpeaker => 'Prioritetinis kalbėtojas';

  @override
  String get permissionMuteMembers => 'Nutildyti narius';

  @override
  String get permissionDeafenMembers => 'Nutildyti narius';

  @override
  String get permissionMoveMembers => 'Perkelti narius';

  @override
  String get permissionMoveMembersDescription =>
      'Vilkite narius tarp kanalų, į kuriuos jie gali patekti.';

  @override
  String get permissionSetVoiceRegion => 'Nustatyti balso regioną';

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
      'Peržiūrėkite ir tvarkykite visas savo bendruomenėje sukonfigūruotas žiniatinklio jungtis.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nėra \"webhook\" nuorodų';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Šioje bendruomenėje dar nėra jokių „webhooks“. Eikite į $channelSettingsPath, kad sukurtumėte vieną.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Norint peržiūrėti ir redaguoti šios bendruomenės webhookus, jums reikia „$permission“ leidimo.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Nepavyko įkelti \"webhook\" nuorodų';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Įkeliant žiniatinklio kablius įvyko klaida. Bandykite dar kartą.';

  @override
  String get guildSettingsWebhooksUpdated =>
      'Tinklalapio apdorojimo programos atnaujintos';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Nepavyko atnaujinti \"webhook\" nuorodų';

  @override
  String get guildSettingsUnknownChannel => 'Nežinomas kanalas';

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
      'Įtraukite savo bendruomenę į \"Atraskite\", kad kiti galėtų ją rasti ir prisijungti.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'Nepakanka narių';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Jūsų bendruomenei reikia bent $count narių, kad ji galėtų būti įtraukta į „Discovery“.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Būsena:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Laukiama';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Patvirtinta';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Atmestas';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Pašalinta';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Priežastis: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Jūsų bendruomenė yra įtraukta į \"Atradimą\". Galite atnaujinti savo įrašo detales žemiau arba atšaukti, kad jį pašalintumėte.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Jūsų paraiška laukia peržiūros. Vis dar galite atnaujinti savo įrašo detales arba atšaukti paraišką.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorija';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Pasirinkite kategoriją, kuri geriausiai apibūdina jūsų bendruomenę. Ją galite pakeisti bet kada.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Pagrindinė kalba';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Kalba, kuria kalba didžioji jūsų bendruomenės dalis. Naudojama filtravimui \"Atraskite\" rezultatuose.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Aprašymas';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Apibūdinkite, apie ką yra jūsų bendruomenė';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Aprašas yra privalomas.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Aprašas turi būti bent $minLength simbolių.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Aprašas negali būti ilgesnis nei $maxLength simbolių.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Pasirinktinės žymės';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Iki $maxTags žymų padeda žmonėms rasti jūsų bendruomenę. Jos rodomos „Discovery“ paieškoje.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Pridėkite žymę ir paspauskite \"Enter\"';

  @override
  String get guildSettingsDiscoveryAddTag => 'Pridėti';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Pašalinti žymę \"$tag\"';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Nepavyko pridėti žymos';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Žymos turi būti nuo 2 iki $maxLength simbolių ilgio ir sudarytos iš raidžių bei skaičių.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Galite pridėti ne daugiau kaip $maxTags žymų.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Taikyti';

  @override
  String get guildSettingsDiscoverySave => 'Išsaugoti';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Atšaukti';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Atrankos paraiška išsiųsta';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Atrankos sąrašas atnaujintas';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Atrankos paraiška atšaukta';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Nepavyko atšaukti paraiškos';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Bandyti dar kartą po akimirkos.';

  @override
  String get guildSettingsMembersDescription =>
      'Ieškokite ir tvarkykite serverio narius.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Ieškoti pagal vartotojo vardą arba ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count narių';
  }

  @override
  String get guildMembersRecentTitle => 'Naujausi nariai';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Rodoma $displayedCount iš $totalCount visų narių';
  }

  @override
  String get guildMembersSort => 'Rūšiuoti';

  @override
  String get guildSettingsMembersSortNewest => 'Naujausi pirmiausia';

  @override
  String get guildMembersSortOldest => 'Pirmiausia seniausi';

  @override
  String get guildMembersColumnName => 'Pavadinimas';

  @override
  String get guildMembersColumnMemberSince => 'Narys nuo';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Prisijungė prie „$productName\"';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Prisijungimo būdas';

  @override
  String get guildMembersColumnRoles => 'Rolės';

  @override
  String get guildMembersColumnActions => 'Veiksmai';

  @override
  String get guildMembersFilterMemberSince => 'Filtruoti pagal narystės datą';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtruoti pagal paskyros sukūrimo datą';

  @override
  String get guildMembersFilterJoinMethod =>
      'Filtruoti pagal prisijungimo būdą';

  @override
  String get guildMembersFilterRoles => 'Filtruoti pagal vaidmenis';

  @override
  String get guildMembersFilterAll => 'Visi';

  @override
  String get guildMembersFilterPast1Hour => 'Paskutinė valanda';

  @override
  String get guildMembersFilterPast24Hours => 'Per pastarąsias 24 valandas';

  @override
  String get guildMembersFilterPast7Days => 'Paskutinės 7 dienos';

  @override
  String get guildMembersFilterPast2Weeks => 'Per pastarąsias 2 savaites';

  @override
  String get guildMembersFilterPast3Weeks => 'Paskutinės 3 savaitės';

  @override
  String get guildMembersFilterPast4Weeks => 'Per pastarąsias 4 savaites';

  @override
  String get guildMembersFilterPast3Months => 'Paskutiniai 3 mėnesiai';

  @override
  String get guildMembersFilterCustomRange => 'Pasirinktinis diapazonas...';

  @override
  String get guildMembersDateRangeTitle => 'Pasirinktinis datos intervalas';

  @override
  String get guildMembersDateAfter => 'Po datos';

  @override
  String get guildMembersDateBefore => 'Iki datos';

  @override
  String get guildMembersClearAll => 'Išvalyti viską';

  @override
  String get guildMembersRowsPerPage => 'Eilutės puslapyje';

  @override
  String get guildMembersEmptySearch => 'Niekas neatitinka paieškos.';

  @override
  String get guildMembersLoadError =>
      'Įkeliant narius įvyko klaida. Bandykite dar kartą vėliau.';

  @override
  String get guildMembersIndexing => 'Narių indeksavimas…';

  @override
  String get guildMembersGoToPage => 'Eiti į puslapį';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Eiti į puslapį \"$page\"';
  }

  @override
  String get guildMembersJumpToPage => 'Pereiti į puslapį';

  @override
  String get guildMembersJoinSourceCreator => 'Bendruomenės kūrėjas';

  @override
  String get guildMembersJoinSourceInvite => 'Kviesti';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Kvietimas ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Pakvietė $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Nuoroda';

  @override
  String get guildMembersJoinSourceBotInvite => 'Kviesti botą';

  @override
  String get guildMembersJoinSourcePlatformAdmin =>
      'Platformos administratorius';

  @override
  String get guildMembersJoinSourceDiscovery => 'Atradimas';

  @override
  String get guildMembersJoinMethodUnknown => 'Nežinoma';

  @override
  String get guildMembersCommunityOwner => 'Bendruomenės savininkas';

  @override
  String get guildMembersViewAllRoles => 'Peržiūrėti visus vaidmenis';

  @override
  String get guildMembersJoinedJustNow => 'Ką tik';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prieš $count minučių',
      one: 'prieš 1 minutę',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prieš $count valandų',
      one: 'prieš 1 valandą',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prieš # dienų',
      one: 'prieš 1 dieną',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Nariai';

  @override
  String get guildMembersChannelListSelected => 'Pasirinkti nariai';

  @override
  String get guildSettingsInvitesTitle => 'Kvietimai';

  @override
  String get guildSettingsInvitesDescription =>
      'Peržiūrėkite visus šios bendruomenės kvietimus. Norėdami sukurti naują kvietimą, eikite į kanalą ir naudokite kvietimo mygtuką.';

  @override
  String get guildSettingsInvitesEmpty => 'Nėra kvietimo nuorodų';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Ši bendruomenė dar neturi jokių pakvietimo nuorodų. Eikite į kanalą ir sukurkite pakvietimą, kad pakviestumėte žmones.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Nepavyko įkelti pakvietimų';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Įkeliant pakvietimus įvyko klaida. Bandykite dar kartą.';

  @override
  String get guildSettingsInvitesTryAgain => 'Bandyti dar kartą';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Rodyti sukūrimo, o ne galiojimo datą';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pristabdyti kvietimus';

  @override
  String get guildSettingsInvitesEnableInvites => 'Įjungti kvietimus';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pristabdyti kvietimus į šią bendruomenę';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Įjungti kvietimus šiai bendruomenei';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pristabdyti kvietimus? Nauji naudotojai negalės prisijungti per kvietimo nuorodas, kol vėl jų neįjungsite. Esamiems nariams tai neturės įtakos.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Įjungti kvietimus? Vartotojai vėl galės prisijungti prie šios bendruomenės naudodami kvietimo nuorodas.';

  @override
  String get guildSettingsInvitesPause => 'Pauzė';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Kvietimai šiai bendruomenei pristabdyti.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Kvietimai pristabdyti, nes „$productName\" aptiko galimą ataką. Nauji vartotojai šiuo metu negali prisijungti.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Pakvietė:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanalas:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kodas:';

  @override
  String get guildSettingsInvitesLabelUses => 'Naudoja:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Sukurta:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Baigiasi:';

  @override
  String get guildSettingsInvitesUnknown => 'Nežinoma';

  @override
  String get guildSettingsInvitesNoCategory => 'Be kategorijos';

  @override
  String get guildSettingsInvitesExpired => 'Baigėsi';

  @override
  String get guildSettingsInvitesNever => 'Niekada';

  @override
  String get guildSettingsInvitesCopyLink => 'Kopijuoti kvietimo nuorodą';

  @override
  String get guildSettingsInvitesRevoke => 'Atšaukti kvietimą';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Nepavyko atšaukti kvietimo';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Nuoroda gali vis dar veikti. Bandykite dar kartą po kurio laiko.';

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
  String get guildSettingsEmojiSlotsTitle => 'Jaustukų vietos';

  @override
  String get guildSettingsEmojiDropZone => 'Nuvilkite jaustukų failus čia';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Nepavyko įkelti jaustukų. Bandykite dar kartą vėliau.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nerasta jaustukų, atitinkančių jūsų paiešką.';

  @override
  String get guildSettingsEmojiNoSlots => 'Nėra laisvų jaustukų vietų';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Pasiekėte didžiausią jaustukų skaičių. Ištrinkite kai kuriuos esamus jaustukus, kad atlaisvintumėte vietos.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emblemos pavadinimai turi būti bent 2 simboliai ir gali naudoti raides, skaičius bei pabraukimus. Emblemos dydis neturi viršyti $maxSize. Statiniai vaizdai automatiškai keičiami į 128x128 pikselių dydį ir suspaudžiami. Animuoti paveikslėliai ir SVG turi jau atitikti nurodytą dydį.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Įkeliami jaustukai';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# jaustukai',
      one: '# jaustukas',
    );
    return 'Įkeliama $_temp0. Tai gali užtrukti.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Nepavyko įkelti jaustukų. Bandykite dar kartą.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Kai kurių jaustukų nepavyko pridėti';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Peržiūrėkite šiuos failus ir bandykite dar kartą su mažesniais ar paprastesniais vaizdais.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Pervadinti jaustuką';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 simboliai, raidės, skaičiai, pabraukimai.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Jaustukai';

  @override
  String get guildSettingsEmojiColumnName => 'Pavadinimas';

  @override
  String get guildSettingsEmojiColumnUploader => 'Įkėlė';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Nežinoma';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Ištrinti jaustuką';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Ištrinti :$name:? Negalima atšaukti.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Išvalyti šį jaustuką iš saugyklos ir CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Jaustuko pavadinimas turi būti bent 2 simbolių ilgio';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Jaustuko pavadinimas turi būti ne ilgesnis nei 32 simboliai';

  @override
  String get guildSettingsEmojiInvalidNameTitle =>
      'Neteisingas jaustuko pavadinimas';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Nepavyko pervadinti šio jaustuko';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Pavadinimas grąžintas į buvusį. Bandykite dar kartą po akimirkos.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Šis jaustukas nebeegzistuoja';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Gali būti, kad jis buvo ištrintas. Pavadinimas grąžintas į buvusį.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Negalite pervadinti šio jaustuko';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Neturite leidimo pervadinti šio jaustuko. Pavadinimas buvo grąžintas į ankstesnį.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Per greitai';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Palaukite ir bandykite pervadinti dar kartą.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Nepavyko ištrinti šio jaustuko';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Negalite ištrinti šio jaustuko';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Leisti kitiems klonuoti jūsų jaustukus';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Kai įjungta, kitų bendruomenių nariai gali naudoti programėlės \"Klonuoti\" nuorodą vienu spustelėjimu jūsų pasirinktiniams jaustukams. Tai netrukdo jiems išsaugoti paveikslėlio ir įkelti jį patiems.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Leisti kitiems klonuoti jūsų lipdukus';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Kai įjungta, kitų bendruomenių nariai gali naudoti programėlės \"Klonuoti\" nuorodą vienu paspaudimu jūsų pasirinktiniams lipdukams. Tai netrukdo jiems išsaugoti paveikslėlio ir įkelti jį patiems.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Šią nuostatą gali pakeisti tik nariai, turintys „$permission“ leidimą.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Nepavyko atnaujinti jaustukų klonavimo';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Nepavyko atnaujinti lipdukų klonavimo';

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
  String get guildSettingsStickerSlotsTitle => 'Lipdukų vietos';

  @override
  String get guildSettingsStickerUploadTitle => 'Įkelti lipduką';

  @override
  String get guildSettingsStickerDropZone =>
      'Nuvilkite lipduko failą čia (po vieną)';

  @override
  String get guildSettingsStickerDensity => 'Lipdukų tankis';

  @override
  String get guildSettingsStickerDensityCozy => 'Jauku';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompaktiškas';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'Nepavyko įkelti lipdukų';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Įkeliant lipdukus įvyko klaida. Bandykite dar kartą.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nerasta lipdukų, atitinkančių jūsų paiešką.';

  @override
  String get guildSettingsStickersEmptySearch => 'Lipdukų nerasta';

  @override
  String get guildSettingsStickerNoSlots => 'Nėra laisvų lipdukų vietų';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Pasiekėte didžiausią lipdukų skaičių. Ištrinkite esamus lipdukus, kad atlaisvintumėte vietos.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Lipdukai išsaugomi 320x320 pikselių dydžiu ir turi būti ne didesni nei $maxSize. Statiniai vaizdai automatiškai keičiami į reikiamą dydį ir suspaudžiami. Animuoti lipdukai ir SVG jau turi atitikti nurodytą dydį.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Nepalaikomas lipduko failas';

  @override
  String get guildSettingsStickerAddTitle => 'Pridėti lipduką';

  @override
  String get guildSettingsStickerEditTitle => 'Redaguoti lipduką';

  @override
  String get guildSettingsStickerNameLabel => 'Pavadinimas';

  @override
  String get guildSettingsStickerNameHint => 'Mano nuostabus lipdukas';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Aprašymas';

  @override
  String get guildSettingsStickerDescriptionHint => 'Apibūdinkite lipduką';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Žymos ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Pridėti žymę';

  @override
  String get guildSettingsStickerTagAdd => 'Pridėti';

  @override
  String get guildSettingsStickerNameRequired => 'Būtina nurodyti pavadinimą';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Pavadinimas turi būti bent 2 simbolių ilgio';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Pavadinimas turi būti ne ilgesnis nei 30 simbolių';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Aprašymas turi būti ne ilgesnis nei 500 simbolių';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Nepavyko sukurti šio lipduko';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Lipdukas per didelis';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Lipduko nepavyko pakankamai suglaudinti';

  @override
  String get guildSettingsStickerDeleteTitle => 'Ištrinti lipduką';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Ištrinti „$name“? Negalima atšaukti.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Išvalyti šį lipduką iš saugyklos ir CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Nepavyko ištrinti šios etiketės';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Jūs negalite ištrinti šios etiketės';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Norėdami sukurti webhook, atidarykite $channelSettingsPath. Čia vis tiek galėsite redaguoti ir tvarkyti visus esamus webhook.';
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
  String get guildSettingsInvitesTableExpires => 'Baigiasi';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtruoti pagal vartotoją';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtruoti pagal veiksmą';

  @override
  String get createDm => 'Kurti tiesioginį pranešimą';

  @override
  String get createGroupDm => 'Kurti grupės tiesioginį pranešimą';

  @override
  String get createDmNewMessage => 'Nauja žinutė';

  @override
  String get createDmSelectFriends => 'Pasirinkite draugus';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Pasirinkite draugus, kuriems norite parašyti.';

  @override
  String get createDmSearchFriends => 'Ieškoti draugų';

  @override
  String get createDmNoFriendsFound => 'Draugų nerasta';

  @override
  String get createDmNoFriendsYet => 'Dar neturite draugų';

  @override
  String get createDmClaimToStartDms =>
      'Norėdami pradėti tiesioginius pranešimus, prisijunkite prie savo paskyros.';

  @override
  String get createDmVerifyToStartDms =>
      'Patvirtinkite el. paštą, kad galėtumėte pradėti tiesioginius pranešimus.';

  @override
  String get createDmVerifyYourEmail => 'Patvirtinkite savo el. paštą';

  @override
  String get createDmNewGroup => 'Nauja grupė';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Sukurti naują grupę su „$userName\"';
  }

  @override
  String get createDmConfirmNewGroup => 'Patvirtinti naują grupę';

  @override
  String get createDmCreateNewGroup => 'Kurti naują grupę';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Pašalinti \"$displayName\"';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Jau turite grupę su šiais naudotojais. Ar tikrai norite sukurti naują? Tai irgi gerai!';

  @override
  String get createDmNoActivityYet => 'Dar nėra veiklos';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Kai kurių naudotojų negalima pridėti';

  @override
  String get createDmCreateWithoutThem => 'Kurti be jų';

  @override
  String get createDmUnaddableIntro =>
      'Šių žmonių negalima pridėti prie šios grupės DM:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Sukurti grupės DM su likusiaisiais $count adresatais ir praleisti kitus?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Nebėra gavėjų, su kuriais būtų galima sukurti grupės tiesioginį pranešimą.';

  @override
  String get createDmUnaddableUserNotFound => 'Vartotojas nerastas';

  @override
  String get createDmUnaddableBlocked =>
      'Negalite siųsti žinučių šiam naudotojui';

  @override
  String get createDmUnaddableNotFriends => 'Nėra jūsų draugų sąraše';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Negalima pridėti prie grupinių tiesioginių žinučių';

  @override
  String get createDmFailed =>
      'Nepavyko sukurti pokalbio. Pabandykite dar kartą.';

  @override
  String get dmListMessagesTitle => 'Žinutės';

  @override
  String get dmListDirectMessagesTitle => 'Tiesioginės žinutės';

  @override
  String get keybindsSearchShortcuts => 'Ieškoti nuorodų';

  @override
  String get keybindSectionDefaults => 'Numatyta';

  @override
  String get keybindSectionMessages => 'Žinutės';

  @override
  String get keybindSectionNavigation => 'Naršymas';

  @override
  String get keybindSectionDragAndDrop => 'Vilkite ir numeskite';

  @override
  String get keybindSectionChat => 'Pokalbis';

  @override
  String get keybindSectionVoiceAndVideo => 'Balso ir vaizdo skambučiai';

  @override
  String get keybindSectionMisc => 'Įvairūs';

  @override
  String get keybindActionShowShortcutsList =>
      'Rodyti sparčiųjų klavišų sąrašą';

  @override
  String get keybindActionCopyText => 'Kopijuoti tekstą';

  @override
  String get keybindActionMarkUnread => 'Pažymėti kaip neperskaitytą';

  @override
  String get keybindActionFocusTextarea => 'Sutelkti teksto sritį';

  @override
  String get keybindActionSwitchCommunities => 'Perjungti bendruomenes';

  @override
  String get keybindActionSwitchChannels => 'Perjungti kanalus';

  @override
  String get keybindActionHistoryBack =>
      'Grįžti atgal per peržiūrėtą kanalų istoriją';

  @override
  String get keybindActionHistoryForward =>
      'Judėti pirmyn per peržiūrėtą kanalo istoriją';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Peršokti tarp neskaitytų kanalų';

  @override
  String get keybindActionJumpMentionChannels =>
      'Pereiti tarp neskaitytų kanalų su paminėjimais';

  @override
  String get keybindActionJumpCurrentCall =>
      'Pereiti prie dabartinio skambučio';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Perjungti tarp paskutinės bendruomenės ir tiesioginių žinučių';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Perjungti į ankstesnę bendruomenę arba tiesioginius pranešimus';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Perjungti į kitą bendruomenę arba tiesioginius pranešimus';

  @override
  String get keybindActionGoToDms => 'Eiti į tiesioginius pranešimus';

  @override
  String get keybindActionGoToFirstCommunity => 'Eiti į pirmą bendruomenę';

  @override
  String get keybindActionGoToSecondCommunity => 'Eiti į antrą bendruomenę';

  @override
  String get keybindActionGoToThirdCommunity => 'Eiti į trečią bendruomenę';

  @override
  String get keybindActionGoToFourthCommunity => 'Eiti į ketvirtą bendruomenę';

  @override
  String get keybindActionGoToFifthCommunity => 'Eiti į penktą bendruomenę';

  @override
  String get keybindActionGoToSixthCommunity => 'Eiti į šeštą bendruomenę';

  @override
  String get keybindActionGoToSeventhCommunity => 'Eiti į septintą bendruomenę';

  @override
  String get keybindActionGoToEighthCommunity => 'Eiti į aštuntą bendruomenę';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Perjungti greitąjį perjungiklį';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Sukurti arba prisijungti prie bendruomenės';

  @override
  String get keybindActionStartDragAndDrop => 'Pradėti vilkti ir mesti';

  @override
  String get keybindActionMove => 'Perkelti';

  @override
  String get keybindActionDropItem => 'Mesti elementą';

  @override
  String get keybindActionCancel => 'Atšaukti';

  @override
  String get keybindActionMarkCommunityRead =>
      'Pažymėti bendruomenę kaip perskaitytą';

  @override
  String get keybindActionMarkChannelRead => 'Pažymėti kanalą kaip perskaitytą';

  @override
  String get keybindActionStartGroupDm => 'Pradėti grupės tiesioginį pranešimą';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Perjungti prisegtus pranešimus';

  @override
  String get keybindActionToggleInbox => 'Perjungti gautuosius';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Pažymėti viršutinį gautųjų kanalą kaip perskaitytą';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Pažymėti visus gautuosius kanalus kaip perskaitytus';

  @override
  String get keybindActionToggleMemberList =>
      'Perjungti narių sąrašą arba balso pokalbį';

  @override
  String get keybindActionToggleEmojiPicker =>
      'Įjungti / išjungti jaustukų parinkiklį';

  @override
  String get keybindActionToggleGifPicker => 'Perjungti GIF parinkiklį';

  @override
  String get keybindActionToggleStickerPicker => 'Perjungti lipdukų parinkiklį';

  @override
  String get keybindActionScrollChatUp => 'Slinkti pokalbį aukštyn';

  @override
  String get keybindActionScrollChatDown => 'Slinkti pokalbį žemyn';

  @override
  String get keybindActionJumpOldestUnread =>
      'Pereiti prie seniausios neperskaitytos žinutės';

  @override
  String get keybindActionFocusComposer => 'Sutelkti teksto lauką';

  @override
  String get keybindActionUploadFile => 'Įkelti failą';

  @override
  String get keybindActionCopyChannelLink => 'Kopijuoti kanalo nuorodą';

  @override
  String get keybindActionToggleSavedMedia => 'Perjungti išsaugotą mediją';

  @override
  String get keybindActionSendVoiceMessage => 'Siųsti balso pranešimą';

  @override
  String get keybindActionAnswerCall => 'Atsiliepti į gaunamą skambutį';

  @override
  String get keybindActionDeclineCall => 'Atmesti gaunamą skambutį';

  @override
  String get keybindActionStartDmCall =>
      'Pradėti skambutį tiesioginiame pokalbyje arba grupėje';

  @override
  String get keybindActionToggleSoundboard =>
      'Įjungti / išjungti garso plokštę';

  @override
  String get keybindActionToggleCompactCallView =>
      'Išskleisti arba sutraukti kompaktišką skambučio rodinį';

  @override
  String get keybindActionPushToTalkPriority =>
      'Kalbėti paspaudus (prioritetinis)';

  @override
  String get keybindActionVoiceActivityPriority => 'Balso aktyvumo prioritetas';

  @override
  String get keybindActionOpenHelp => 'Atidaryti žinyną';

  @override
  String get keybindActionSearchMessages => 'Ieškoti žinučių';

  @override
  String get keybindActionOpenContextMenu => 'Atidaryti kontekstinį meniu';

  @override
  String get keybindActionOpenSettings => 'Atidaryti nustatymus';

  @override
  String get keybindActionOpenThemeStudio =>
      'Atidaryti temos studijos iššokantįjį langą';

  @override
  String get keybindActionZoomIn => 'Didinti';

  @override
  String get keybindActionZoomOut => 'Mažinti';

  @override
  String get keybindActionZoomReset => 'Atstatyti mastelį';

  @override
  String get clipboardPasteFailed =>
      'Nepavyko įklijuoti. Iš leistukės nieko neišėjo nukopijuoti arba ji buvo užblokuota šiai programai.';

  @override
  String get homeQuickActionDms => 'Tiesioginiai pranešimai';
}
