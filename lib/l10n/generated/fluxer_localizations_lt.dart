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
  String get gatewayReconnectingToast => 'Jungiamasi iš naujo…';

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
  String get splashConnectionLost => 'Ryšys nutrūko';

  @override
  String get splashViewOnStatusPage => 'Peržiūrėti būsenos puslapyje';

  @override
  String get splashConnectionIssuesPrompt => 'Ryšio problemos?';

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
    return 'Sveiki, $displayName, užregistruokite paskyrą, kad neprarastumėte prieigos.';
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
  String get nagbarViewGiftInventory => 'Peržiūrėti dovanų inventorių';

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
    return 'Prisijunkite prie „$communityName“, kad galėtumėte bendrauti su komanda ir gauti naujausią informaciją.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Prisijungti prie „$communityName“';
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
  String get welcomeBack => 'Sveiki sugrįžę';

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
  String get organizationSsoProvider =>
      'Prisijunkite naudodami savo organizacijos vieningo prisijungimo (SSO) teikėją.';

  @override
  String get failedToStartSso => 'Nepavyko paleisti SSO';

  @override
  String get ssoCancelled => 'SSO prisijungimas buvo atšauktas';

  @override
  String preferSso(String provider) {
    return 'Pageidaujate naudoti SSO? Tęskite su $provider.';
  }

  @override
  String get needAccountPrompt => 'Neturite paskyros? ';

  @override
  String get register => 'Registruotis';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => 'Atšaukti';

  @override
  String get ipAuthCheckEmail => 'Patikrinkite savo el. paštą';

  @override
  String ipAuthDescription(String email) {
    return 'Atsiųsime el. laišką šiam prisijungimui autorizuoti. Prašome atidaryti savo pašto dėžutę adresu $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Ryšys nutrūko';

  @override
  String get ipAuthConnectionLostDescription =>
      'Praradome ryšį laukdami autorizacijos. Prašome bandyti dar kartą.';

  @override
  String get ipAuthLinkExpired => 'Prisijungimo nuoroda baigėsi';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Ši autorizacijos nuoroda baigėsi. Prašome prisijungti dar kartą.';

  @override
  String get ipAuthResendEmail => 'Iš naujo siųsti el. laišką';

  @override
  String get ipAuthResent => 'Išsiųsta iš naujo';

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
  String get mfaMethodWebauthn => 'Saugos raktas / prieigos raktas';

  @override
  String get mfaTotpDescription =>
      'Įveskite 6 skaitmenų kodą iš savo autentifikavimo programėlės arba vieną iš atsarginių kodų.';

  @override
  String get mfaCodeLabel => 'Kodas';

  @override
  String get mfaTryAnotherMethod => 'Pabandykite kitą metodą';

  @override
  String get mfaUseSecurityKey =>
      'Vietoj to naudokite saugos raktą / prieigos raktą';

  @override
  String get accountSelectorTitle => 'Pasirinkite paskyrą';

  @override
  String get accountSelectorDescription =>
      'Pasirinkite paskyrą, kad tęstumėte, arba pridėkite kitą.';

  @override
  String get accountAdd => 'Pridėti paskyrą';

  @override
  String get accountRemoveDescription =>
      'Tai pašalins išsaugotą šios paskyros seansą.';

  @override
  String get accountExpired => 'Baigėsi';

  @override
  String accountSessionExpired(String identifier) {
    return 'Baigėsi $identifier seanso galiojimas. Prašome prisijungti iš naujo.';
  }

  @override
  String get accountManageTitle => 'Tvarkyti paskyras';

  @override
  String get accountSwitchFailed =>
      'Nepavyko perjungti paskyrų. Bandykite dar kartą.';

  @override
  String get profileTabMenuSwitchAccounts => 'Keisti paskyras';

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
  String get statusOffline => 'Neprisijungęs';

  @override
  String get statusUntilIChangeIt => 'Kol pats nepakeisiu';

  @override
  String get statusDontClear => 'Neišvalyti';

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
  String get statusDndDescription => 'Pranešimų darbalaukyje negausite';

  @override
  String get statusInvisibleDescription => 'Atrodysite neprisijungę';

  @override
  String get customStatusSetTitle => 'Nustatyti pasirinktinę būseną';

  @override
  String get customStatusCurrentHint => 'Pasirinktinė būsena';

  @override
  String get customStatusClear => 'Išvalyti pasirinktinę būseną';

  @override
  String get customStatusPlaceholder => 'Kas naujo?';

  @override
  String get customStatusChooseEmoji => 'Pasirinkite jaustuką';

  @override
  String get customStatusClearAfter => 'Išvalyti po';

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
  String get suspendedPermanent => 'Visam laikui';

  @override
  String get suspendedReason => 'Priežastis';

  @override
  String get suspendedAppealDeadline => 'Apeliacijos terminas';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Jūsų paskyra numatyta ištrinti $date d.';
  }

  @override
  String get suspendedRecheck => 'Tikrinti, ar yra naujinimų';

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
      'Įveskite savo el. pašto adresą ir atsiųsime jums nuorodą slaptažodžiui nustatyti iš naujo.';

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
  String get recoverAccountTitle => 'Atkurti paskyrą';

  @override
  String get recoverAccountDescription =>
      'Įveskite savo vartotojo vardą ir atkūrimo rinkinio atkūrimo raktą, tada pasirinkite naują slaptažodį.';

  @override
  String get recoverAccountNoKit =>
      'Nėra atkūrimo rinkinio? Paprašykite šio serverio administratoriaus slaptažodžio nustatymo iš naujo nuorodos.';

  @override
  String get recoveryKitTitle => 'Tavo atkūrimo rinkinys';

  @override
  String get recoveryKitCreatedDescription =>
      'Jei pamiršite slaptažodį, šis rinkinys yra vienintelis būdas grįžti į paskyrą. Laikykite jį saugioje vietoje, pavyzdžiui, slaptažodžių tvarkyklėje arba atspausdintą kopiją.';

  @override
  String get recoveryKitReplacedDescription =>
      'Jūsų senasis atkūrimo rinkinys nebeveikia. Šį naująjį laikykite saugioje vietoje.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Jūsų slaptažodis nustatytas iš naujo. Jūsų senasis atkūrimo rinkinys nebeveikia. Laikykite šį naująjį saugioje vietoje.';

  @override
  String get recoveryKitWarning =>
      'Kiekvienas, turintis šį raktą, gali atstatyti jūsų slaptažodį. Niekada juo nesidalinkite.';

  @override
  String get recoveryKitKeyLabel => 'Pagalbos raktas';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return '$productName atkūrimo rinkinys';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Laikykite šį puslapį saugioje vietoje. Jei pamiršite slaptažodį, galėsite jį naudoti, kad vėl prisijungtumėte prie savo paskyros. Bet kas, turintis šį atkūrimo raktą, gali pakeisti jūsų slaptažodį, todėl niekada juo nesidalinkite.';

  @override
  String get recoveryKitInstanceLabel => 'Instance';

  @override
  String get recoveryKitCreatedAtLabel => 'Sukurta';

  @override
  String get recoveryKitQrCaption =>
      'Nuskaitykite, kad atidarytumėte atkūrimo puslapį su užpildyta jūsų informacija.';

  @override
  String get recoveryKitStepsTitle => 'Kaip atkurti paskyrą';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Eikite į $recoverUrl arba nuskaitykite QR kodą.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Įveskite savo vartotojo vardą ir šį atkūrimo raktą.';

  @override
  String get recoveryKitStepPassword =>
      'Pasirinkite naują slaptažodį. Gausite naują atkūrimo rinkinį, o šis nustos veikti.';

  @override
  String get recoveryKitBackupCodesTitle =>
      'Dviejų veiksnių autentifikavimo atsarginiai kodai';

  @override
  String get recoveryKitBackupCodesNote =>
      'Kiekvienas kodas veikia vieną kartą, pakeisdamas jūsų autentifikavimo programėlę.';

  @override
  String get recoveryKitBackupCodesFailed => 'Nepavyko įkelti atsarginių kodų.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Įtraukti mano dviejų veiksnių autentifikavimo atsarginius kodus į išsaugotą vaizdą';

  @override
  String get recoveryKitCopy => 'Kopijuoti';

  @override
  String get recoveryKitCopied => 'Atkūrimo raktas nukopijuotas';

  @override
  String get recoveryKitSaveImage => 'Išsaugoti vaizdą';

  @override
  String get recoveryKitSaved => 'Atkūrimo rinkinys išsaugotas';

  @override
  String get recoveryKitSavedToPhotos =>
      'Atkūrimo rinkinys išsaugotas nuotraukose';

  @override
  String get recoveryKitSaveFailed =>
      'Nepavyko išsaugoti atkūrimo rinkinio. Bandyk dar kartą arba nukopijuok raktą.';

  @override
  String get recoveryKitAcknowledge =>
      'Atsidėjau savo atkūrimo rinkinį saugioje vietoje';

  @override
  String get recoveryKitCreateFailed =>
      'Nepavyko sukurti jūsų atkūrimo rinkinio. Vėliau galėsite jį sukurti paskyros nustatymuose.';

  @override
  String get recoveryKitSectionTitle => 'Atsarginių kopijų rinkinys';

  @override
  String get recoveryKitSectionDescription =>
      'Leidžia atkurti slaptažodį, jei jį pamiršite.';

  @override
  String get recoveryKitNone => 'Dar neturite atkūrimo rinkinio';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Sukurtas $time';
  }

  @override
  String get recoveryKitCreate => 'Sukurti atkūrimo rinkinį';

  @override
  String get recoveryKitCreateNew => 'Sukurti naują rinkinį';

  @override
  String get recoveryKitReplaceTitle => 'Sukurti naują atkūrimo rinkinį?';

  @override
  String get recoveryKitReplaceDescription =>
      'Jūsų dabartinis rinkinys nustos veikti, kai tik bus sukurtas naujas.';

  @override
  String get recoveryKitReminderTitle => 'Saugoti atkūrimo rinkinį';

  @override
  String get recoveryKitReminderBody =>
      'Jūsų paskyroje nėra el. pašto adreso. Jei pamiršite slaptažodį, atsigavimo rinkinys yra vienintelis būdas grįžti. Tai užtruks tik minutę.';

  @override
  String get registerUsernameSignInHint =>
      'Prisijunkite naudodami šį vartotojo vardą. Pasirinkite tokį, kurį atsiminsite.';

  @override
  String get registerUsernameTaken => 'Šis vartotojo vardas jau užimtas';

  @override
  String get registerUsernameAvailable => 'Šis vartotojo vardas yra laisvas';

  @override
  String get claimAccountUsernameDescription =>
      'Prisijunkite prie savo paskyros pasirinkdami vartotojo vardą ir slaptažodį. Jais prisijungsite, todėl pasirinkite tokius, kuriuos atsiminsite.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Jūsų paskyra dar nepaprašyta. Be vartotojo vardo ir slaptažodžio negalėsite prisijungti iš kitų įrenginių ir galite prarasti prieigą prie savo paskyros. Paprašykite savo paskyros dabar, kad ją apsaugotumėte.';

  @override
  String get addFriendUsernameOnlyHint => 'Naudotojo vardas';

  @override
  String get registerTitle => 'Sukurti paskyrą';

  @override
  String get registerDisplayName => 'Rodomasis vardas (pasirinktinai)';

  @override
  String get registerDisplayNameHint => 'Kaip jus vadinti?';

  @override
  String get registerUsername => 'Naudotojo vardas (pasirinktinai)';

  @override
  String get registerUsernameHint =>
      'Palikite tuščią, kad būtų sugeneruotas atsitiktinis naudotojo vardas';

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
  String get registerConsentPrefix => 'Sutinku su ';

  @override
  String get registerConsentTerms => 'Paslaugų teikimo sąlygos';

  @override
  String get registerConsentAnd => ' ir ';

  @override
  String get registerConsentPrivacy => 'Privatumo politika';

  @override
  String get registerConfirmPassword => 'Patvirtinti slaptažodį';

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
  String get errorInvalidUsernameOrPassword =>
      'Neteisingas naudotojo vardas arba slaptažodis.';

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
  String get embedInviteUnavailable => 'Kvietimas nepasiekiamas';

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
    return '$productName aptiko galimą ataką, todėl nauji naudotojai šiuo metu negali prisijungti.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Ši bendruomenė pristabdė kvietimus. Galite bandyti dar kartą vėliau.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName aptiko galimą ataką šioje bendruomenėje. Kvietimai pristabdyti, todėl nauji naudotojai šiuo metu negali prisijungti.';
  }

  @override
  String get inviteAcceptTitle => 'Jus pakvietė prisijungti';

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
  String get invalidDeepLinkGoHomeButton => 'Eiti į pradžią';

  @override
  String get inviteAcceptJoinGroupButton => 'Prisijungti prie grupės';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Jūs buvote pakviestas prisijungti prie grupės DM per $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'kažkas';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Prieiga prie kanalo uždrausta';

  @override
  String get channelAccessDeniedDescription =>
      'Neturite prieigos prie kanalo, kuriame buvo išsiųsta ši žinutė.';

  @override
  String get messageJumpLinkNoAccess => 'Nėra prieigos';

  @override
  String get okay => 'Gerai';

  @override
  String get embedThemeTitle => 'Bendrinama tema';

  @override
  String get embedThemeWebOnly =>
      'Temas galima importuoti tik žiniatinklyje arba kompiuteryje.';

  @override
  String get embedThemeImport => 'Importuoti temą';

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
      'Užregistruokite paskyrą, kad atsiimtumėte šią dovaną.';

  @override
  String get embedGiftClaim => 'Atsiimti dovaną';

  @override
  String get embedGiftClaimed => 'Dovana atsiimta';

  @override
  String get embedGiftClaimAccount =>
      'Norėdami išpirkti, užregistruokite paskyrą';

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
  String get privacyBotDirectMessages => 'Boto tiesioginės žinutės';

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
    return 'Nutildyti „$guildName“';
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
  String get notificationMobilePush => 'Mobiliųjų įrenginių pranešimai';

  @override
  String get notificationOverrides => 'Pranešimų perrašymai';

  @override
  String get notificationSelectChannel => 'Pasirinkite kanalą arba kategoriją';

  @override
  String get notificationOnlyAtMentions => 'Tik @paminėjimai';

  @override
  String get notificationMuteChannel => 'Nutildyti kanalą';

  @override
  String get notificationUnmuteChannel => 'Įjungti kanalo garsą';

  @override
  String get notificationUseCategoryDefault =>
      'Naudoti kategorijos numatytuosius nustatymus';

  @override
  String get notificationUseCommunityDefault =>
      'Naudoti bendruomenės numatytuosius nustatymus';

  @override
  String get notificationNoCategory => 'Be kategorijos';

  @override
  String get dmMarkAsRead => 'Pažymėti kaip perskaitytą';

  @override
  String get dmMuteConversation => 'Nutildyti DM pokalbį';

  @override
  String get dmUnmuteConversation => 'Įjungti DM pokalbio garsą';

  @override
  String get dmPinDm => 'Prisegti DM';

  @override
  String get dmUnpinDm => 'Atsegti DM';

  @override
  String get dmAlwaysShowInSidebar => 'Visada rodyti šoninėje juostoje';

  @override
  String get dmRemoveFromAlwaysShown => 'Pašalinti iš visada rodomų';

  @override
  String get dmCloseDm => 'Uždaryti tiesioginį pokalbį';

  @override
  String get dmCloseDmConfirmTitle => 'Uždaryti tiesioginį pokalbį';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Ar tikrai norite uždaryti savo DM su $username? Visada galėsite jį atidaryti vėliau.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Ištrinti savo žinutes šiame pokalbyje?';

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
  String get dmInviteToCommunity => 'Kviesti į bendruomenę';

  @override
  String get dmBlock => 'Blokuoti';

  @override
  String get dmLeaveGroup => 'Palikti grupę';

  @override
  String dmInviteSentFor(String communityName) {
    return 'Išsiųstas kvietimas prisijungti prie bendruomenės „$communityName“';
  }

  @override
  String get dmInviteSendFailed =>
      'Nepavyko išsiųsti kvietimo. Bandykite dar kartą.';

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
  String get dmPinGroupDm => 'Prisegti grupės DM';

  @override
  String get dmUnpinGroupDm => 'Atsegti grupės DM';

  @override
  String get dmUnnamedGroup => 'Grupė be pavadinimo';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName grupė';
  }

  @override
  String get dmFavoriteDm => 'Pridėti DM prie mėgstamiausių';

  @override
  String get dmUnfavoriteDm => 'Pašalinti DM iš mėgstamiausių';

  @override
  String get dmFavoriteGroupDm => 'Pridėti grupės DM prie mėgstamiausių';

  @override
  String get dmUnfavoriteGroupDm => 'Pašalinti grupės DM iš mėgstamiausių';

  @override
  String get dmChangeFriendNickname => 'Pakeisti draugo slapyvardį';

  @override
  String get dmRemoveFriend => 'Pašalinti draugą';

  @override
  String get dmAddFriend => 'Pridėti draugą';

  @override
  String get dmAcceptFriendRequest => 'Priimti draugystės užklausą';

  @override
  String get dmIgnoreFriendRequest => 'Nepaisyti draugystės užklausos';

  @override
  String get dmFriendRequestSent => 'Draugystės užklausa išsiųsta';

  @override
  String get dmUnblock => 'Atblokuoti';

  @override
  String get dmDebugUser => 'Derinti naudotoją';

  @override
  String get dmDebugChannel => 'Derinti kanalą';

  @override
  String get dmDebugCategory => 'Derinimo kategorija';

  @override
  String get dmPinned => 'Prisegtas DM';

  @override
  String get dmUnpinned => 'DM atsegtas';

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
  String get dmBlockConfirmTitle => 'Blokuoti naudotoją';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Ar tikrai norite blokuoti $username? Jis negalės jums rašyti žinučių ar siųsti draugystės užklausų.';
  }

  @override
  String get dmFriendRequestSentToast => 'Draugystės užklausa išsiųsta';

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
  String get addFriendUsernameLabel => 'Draugo naudotojo vardas';

  @override
  String get addFriendSendRequest => 'Siųsti užklausą';

  @override
  String get addFriendNoUserFound => 'Naudotojo tokiu vardu nerasta.';

  @override
  String get addFriendInvalidUsername =>
      'Įveskite galiojantį vartotojo vardą (Vartotojo vardas#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Draugystės užklausa išsiųsta';

  @override
  String get addFriendClaimTitle => 'Užregistruokite paskyrą';

  @override
  String get addFriendClaimDescription =>
      'Norėdami siųsti draugystės užklausas, užregistruokite paskyrą.';

  @override
  String get addFriendVerifyTitle => 'Patvirtinkite savo el. paštą';

  @override
  String get addFriendVerifyDescription =>
      'Prieš siųsdami draugystės užklausas turite patvirtinti savo el. pašto adresą.';

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
  String get addFriendIncomingStatus => 'Gauta draugystės užklausa';

  @override
  String get addFriendOutgoingStatus => 'Draugystės užklausa išsiųsta';

  @override
  String get addFriendViewProfile => 'Peržiūrėti profilį';

  @override
  String get addFriendAccept => 'Priimti';

  @override
  String get addFriendIgnore => 'Ignoruoti';

  @override
  String get addFriendAcceptTitle => 'Priimti draugystės užklausą';

  @override
  String get addFriendIgnoreTitle => 'Nepaisyti draugystės užklausos';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Priimti draugystės užklausą iš $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Nepaisyti $displayName draugystės užklausos?';
  }

  @override
  String get addFriendCancelRequest => 'Atšaukti užklausą';

  @override
  String get addFriendCancelRequestFailed =>
      'Nepavyko atšaukti draugystės užklausos. Bandykite dar kartą.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Šiuo metu jie nepriima draugystės užklausų.';

  @override
  String get addFriendUnblockFirst =>
      'Pirmiausia atblokuokite juos, kad galėtumėte išsiųsti draugystės užklausą.';

  @override
  String get addFriendCannotSendToSelf =>
      'Negalite siųsti draugystės užklausos sau.';

  @override
  String get addFriendAlreadyFriends =>
      'Jūs jau draugaujate su šiuo naudotoju.';

  @override
  String get addFriendClaimToSend =>
      'Užbaikite registraciją, kad galėtumėte siųsti draugystės užklausas.';

  @override
  String get addFriendVerifyToSend =>
      'Prieš siųsdami draugystės užklausas, patvirtinkite savo el. pašto adresą.';

  @override
  String get addFriendFriendsListFull =>
      'Jūsų arba to naudotojo draugų sąrašas pilnas. Pašalinkite ką nors ir bandykite dar kartą.';

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
      'Tai pasirinktinis jaustukas iš bendruomenės.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Tai pasirinktinis jaustukas iš bendruomenės. Norėdami naudoti šį jaustuką, paprašykite autoriaus pakvietimo.';

  @override
  String get emojiInfoFromHeader => 'Šią emodži paimta iš';

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
  String get emojiTabGifs => 'GIF\'ai';

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
  String get gifPickerFavoritesEmptyTitle => 'Kol kas nėra mėgstamiausių GIF';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Pažymėkite GIF, kad pamatytumėte jį čia.';

  @override
  String get gifPickerTrending => 'Populiarūs GIF';

  @override
  String get gifPickerNoResultsTitle => 'Nėra paieškos rezultatų';

  @override
  String get gifPickerNoResultsDescription => 'Bandyti kitą paieškos terminą';

  @override
  String get gifPickerLoadFailedTitle => 'Nepavyko įkelti GIF';

  @override
  String get gifPickerLoadFailedBody =>
      'Patikrinkite ryšį ir bandykite dar kartą.';

  @override
  String get emojiCategoryPeople => 'Žmonės';

  @override
  String get emojiCategoryNature => 'Gamta';

  @override
  String get emojiCategoryFood => 'Maistas ir gėrimai';

  @override
  String get emojiCategoryActivity => 'Veiklos';

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
  String get externalLinkWarningTitle => 'Įspėjimas apie išorinę nuorodą';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Ketinate palikti „$productName“';
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
  String get externalLinkVisitSite => 'Apsilankyti svetainėje';

  @override
  String get externalLinkTrustAllLabel =>
      'Pasitikėti visomis išorinėmis nuorodomis';

  @override
  String get externalLinkStripTrackingLabel =>
      'Pašalinti sekimo parametrus iš URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatiškai pašalinti sekimo parametrus (pvz., utm_source, fbclid, gclid) iš URL nuorodų jūsų siunčiamose žinutėse. Išvalo nuorodą prieš jai pasiekiant kitus.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Pasitikėti visomis išorinėmis nuorodomis?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Visos išorinės nuorodos bus laikomos patikimomis ir įspėjimas nebebus rodomas nė vienam domenui. Esami patikimi domenai bus pakeisti. Tai mažiau saugu.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Pasitikėti visais';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Nebepasitikėti visomis nuorodomis?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Išorinių nuorodų įspėjimai vėl bus rodomi. Patikimus domenus reikės pridėti atskirai.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Išjungti „Pasitikėti visais“';

  @override
  String get externalLinkTrustedAllDescription =>
      'Visos išorinės nuorodos yra patikimos. Įspėjimai nebus rodomi.';

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
  String get cropBanner => 'Apkarpyti reklamjuostę';

  @override
  String get skip => 'Praleisti';

  @override
  String get crop => 'Apkarpyti';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Pakeisti naudotojo vardą';

  @override
  String get fluxerTagDescriptionBase =>
      'Naudotojo vardą gali sudaryti tik raidės (a-z, A-Z), skaičiai (0-9) ir apatiniai brūkšniai. Naudotojų varduose didžiosios ir mažosios raidės neskiriamos.';

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
      'Tik raidės (a-z, A-Z), skaitmenys (0-9) ir apatiniai brūkšniai (_)';

  @override
  String get fluxerTagAlreadyTaken => 'Naudotojo vardas jau užimtas';

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
  String get fluxerTagUpdated => 'Naudotojo vardas atnaujintas';

  @override
  String get fluxerTagUpdateFailed =>
      'Nepavyko atnaujinti Vartotojo vardas. Pabandykite dar kartą.';

  @override
  String get continueAction => 'Tęsti';

  @override
  String get profileCustomizationTitle => 'Profilio tinkinimas';

  @override
  String get profileCustomizationDescription =>
      'Redaguokite profilio išvaizdą ir matykite tiesioginę peržiūrą';

  @override
  String get usernameLabel => 'Naudotojo vardas';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Užregistruokite paskyrą, kad galėtumėte pakeisti naudotojo vardą';

  @override
  String get changeFluxerTag => 'Keisti naudotojo vardą';

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
  String get displayNameLabel => 'Rodomasis vardas';

  @override
  String get pronounsLabel => 'Įvardžiai';

  @override
  String get avatarLabel => 'Avataras';

  @override
  String get changeAvatar => 'Keisti avatarą';

  @override
  String get removeAvatar => 'Pašalinti avatarą';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Daugiausiai 10MB. Rekomenduojama: 512×512px';

  @override
  String get bannerLabel => 'Reklamjuostė';

  @override
  String get changeBanner => 'Keisti reklamjuostę';

  @override
  String get removeBanner => 'Pašalinti reklamjuostę';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Daugiausiai 10MB. Minimalus: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Akcento spalva';

  @override
  String get accentColorDescription =>
      'Tinkina profilio kraštinės ir reklamjuostės spalvą';

  @override
  String get aboutMeLabel => 'Apie mane';

  @override
  String get aboutMeHelperText =>
      'Galite naudoti nuorodas, jaustukus ir „Markdown“ formatavimą.';

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
      'Rodyti „Visionary“ kaip prenumeratą';

  @override
  String get maskVisionaryDescription =>
      'Rodyti „Visionary“ kaip įprastą prenumeratą';

  @override
  String get hideVisionaryIdBadge => 'Slėpti Visionary ID ženklelį';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Paslėpti Visionary ID ženkliuką (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Pašalinti Visionary ID ženklelį';

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
  String get unclaimedAccountTitle => 'Neužregistruota paskyra';

  @override
  String get unclaimedAccountDescription =>
      'Jūsų paskyra dar nepareikalauta. Be el. pašto ir slaptažodžio galite prarasti prieigą. Pareikalaukite savo paskyros dabar, kad ją apsaugotumėte.';

  @override
  String get claimAccount => 'Užregistruoti paskyrą';

  @override
  String get profileTypeLabel => 'Profilio tipas';

  @override
  String get profileTypeGlobal => 'Visuotinis profilis';

  @override
  String get profileTypeGuildDescription =>
      'Redaguojate savo profilio nustatymus šiai bendruomenei. Šis profilis bus matomas tik šioje bendruomenėje ir pakeis jūsų visuotinį profilį.';

  @override
  String get communityNicknameLabel => 'Bendruomenės slapyvardis';

  @override
  String get perGuildPremiumUpsellText =>
      'Individualinių bendruomenių profilio, reklamjuostės, akcento spalvos ir biografijos tinkinimas reikalauja Plutonium. Bendruomenės slapyvardis ir įvardžiai yra nemokami visiems.';

  @override
  String get avatarModeInherit => 'Naudoti visuotinį profilį';

  @override
  String get avatarModeCustom => 'Naudoti pasirinktinį paveikslėlį';

  @override
  String get avatarModeUnset => 'Nerodyti';

  @override
  String get profileSavedToast => 'Profilis atnaujintas';

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
  String get securityLoginNoEmailSet => 'El. pašto adresas nenustatytas';

  @override
  String get securityLoginChangeEmail => 'Keisti el. paštą';

  @override
  String get securityLoginAddEmail => 'Pridėti el. paštą';

  @override
  String get securityLoginReveal => 'Atskleisti';

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
  String get securityLoginNoPasswordSet => 'Slaptažodis nenustatytas';

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
  String get passwordChangeConfirmPassword => 'Patvirtinkite naują slaptažodį';

  @override
  String get passwordChangeSubmit => 'Keisti slaptažodį';

  @override
  String get passwordChangeSuccess => 'Slaptažodis pakeistas';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Slaptažodžiai nesutampa';

  @override
  String get passwordChangeInvalidCode => 'Neteisingas arba pasibaigęs kodas';

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
  String get emailChangeNewEmailTitle => 'Įveskite naują el. pašto adresą';

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
  String get emailChangeInvalidCode => 'Neteisingas arba pasibaigęs kodas';

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
  String get securityTfaSectionTitle => 'Dviejų veiksnių autentifikavimas';

  @override
  String get securityTfaSectionDescription =>
      'Pridėkite papildomą saugumo lygį savo paskyrai';

  @override
  String get securityTfaAuthenticatorApp => 'Autentifikavimo programa';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Dviejų veiksnių autentifikavimas įjungtas';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Naudokite autentifikavimo programėlę dviejų veiksnių autentifikavimo kodams generuoti';

  @override
  String get securityTfaBackupCodes => 'Atsarginiai kodai';

  @override
  String get securityTfaBackupCodesDescription =>
      'Peržiūrėkite ir tvarkykite atsarginius paskyros atkūrimo kodus';

  @override
  String get securityTfaViewCodes => 'Peržiūrėti kodus';

  @override
  String get securityPasskeysSectionTitle => 'Prieigos raktai';

  @override
  String get securityPasskeysSectionDescription =>
      'Naudokite passkeys prisijungimui be slaptažodžio ir dviejų veiksnių autentifikacijai';

  @override
  String get securityPasskeysRegistered => 'Registruoti prieigos raktai';

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
  String get securityPasskeysAdd => 'Pridėti prieigos raktą';

  @override
  String securityPasskeysAdded(String date) {
    return 'Pridėta: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Paskutinį kartą naudota: $date';
  }

  @override
  String get securityPasskeysRename => 'Pervadinti';

  @override
  String get securityPasskeysDeleteTitle => 'Ištrinti prieigos raktą';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Ar tikrai norite panaikinti passkey „$name“?';
  }

  @override
  String get securityPasskeyNameTitle => 'Pavadinkite prieigos raktą';

  @override
  String get securityPasskeyNameLabel => 'Prieigos rakto pavadinimas';

  @override
  String get securityPasskeyNameHint =>
      'pvz., YubiKey, iPhone, darbinis kompiuteris';

  @override
  String get securityClaimTitle => 'Saugos funkcijos';

  @override
  String get securityClaimDescription =>
      'Užregistruokite paskyrą, kad galėtumėte naudotis saugos funkcijomis, pvz., dviejų veiksnių autentifikavimu ir prieigos raktais.';

  @override
  String get securityVerifyEmailRequired =>
      'Turite patvirtinti savo el. pašto adresą, kad galėtumėte nustatyti dviejų veiksnių autentifikavimą arba slaptažodžių raktus.';

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
  String get backupCodesCopy => 'Kopijuoti';

  @override
  String get backupCodesCopied => 'Atsarginiai kodai nukopijuoti į iškarpinę';

  @override
  String get backupCodesAcknowledge =>
      'Atsisiunčiau arba nukopijavau savo atsarginius kodus ir saugiai juos laikau.';

  @override
  String get backupCodesDone => 'Atlikta';

  @override
  String get dangerZoneSectionTitle => 'Pavojinga zona';

  @override
  String get dangerZoneSectionDescription =>
      'Neatšaukiami ir destruktyvūs veiksmai';

  @override
  String get dangerZoneDisableTitle => 'Išjungti paskyrą';

  @override
  String get dangerZoneDisableDescription =>
      'Laikinai išjungti paskyrą. Vėliau galėsite ją vėl suaktyvinti prisijungę.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Išjungus paskyrą, būsite atsijungę iš visų sesijų. Bet kuriuo metu galėsite vėl aktyvuoti paskyrą prisijungę.';

  @override
  String get dangerZoneDeleteTitle => 'Ištrinti paskyrą';

  @override
  String get dangerZoneDeleteDescription =>
      'Visam laikui ištrinkite savo paskyrą ir visus susijusius duomenis. Šio veiksmo anuliuoti negalima.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Prieš ištrindami paskyrą, atšaukite aktyvią Plutonium prenumeratą Plutonium nustatymuose.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Negalima ištrinti paskyros';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Negalite ištrinti paskyros, kol turite bendruomenių. Pirmiausia perleiskite nuosavybės teises šioms bendruomenėms:';

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
      'Ar tikrai norite ištrinti paskyrą? Atlikus šį veiksmą, bus suplanuotas negrįžtamas jūsų paskyros ištrynimas.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Galite atšaukti paskyros ištrynimą per 14 dienų';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Po 14 dienų jūsų paskyra bus visam laikui ištrinta';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Kai paskyra bus ištrinta, negalėsite atkurti prieigos prie jos';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Negalėsite ištrinti savo išsiųstų žinučių po to, kai jūsų paskyra bus ištrinta';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Jei norite eksportuoti savo duomenis arba pirmiausia ištrinti žinutes, prieš tęsdami apsilankykite „Privatumo informacijos suvestinė“ skiltyje „Vartotojo nustatymai“.';

  @override
  String get claimAccountTitle => 'Užregistruokite paskyrą';

  @override
  String get claimAccountDescription =>
      'Užregistruokite paskyrą pridėdami el. pašto adresą ir slaptažodį. Prieš baigiant atsiųsime patvirtinimo kodą jūsų el. pašto adresui patvirtinti.';

  @override
  String get claimAccountEmailLabel => 'El. paštas';

  @override
  String get claimAccountPasswordLabel => 'Slaptažodis';

  @override
  String get claimAccountSendCode => 'Siųsti kodą';

  @override
  String get claimAccountVerifyDescription =>
      'Įveskite kodą, kurį išsiuntėme jūsų el. paštu, kad jį patvirtintumėte. Jūsų slaptažodis bus nustatytas, kai kodas bus patvirtintas.';

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
  String get authorizedAppsTitle => 'Įgaliotosios programos';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Šioms programoms buvo suteikta prieiga prie jūsų $productName paskyros.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Nėra įgaliotųjų programų';

  @override
  String get authorizedAppsEmptyDescription =>
      'Dar nesuteikėte jokiai programai prieigos prie savo paskyros.';

  @override
  String get authorizedAppsLoadError => 'Nepavyko įkelti įgaliotųjų programų';

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
      'Pasiekti pagrindinę profilio informaciją (naudotojo vardą, avatarą ir kt.)';

  @override
  String get authorizedAppsScopeEmail => 'Peržiūrėti el. pašto adresą';

  @override
  String get authorizedAppsScopeGuilds =>
      'Peržiūrėkite bendruomenes, kurių esate narys';

  @override
  String get authorizedAppsScopeConnections => 'Peržiūrėti susietas paskyras';

  @override
  String get authorizedAppsScopeBot =>
      'Pridėti botą į bendruomenę su prašomais leidimais';

  @override
  String get authorizedAppsScopeAdmin =>
      'Pasiekti administracinius galinius taškus';

  @override
  String get applicationsTitle => 'Programos';

  @override
  String get applicationsCreate => 'Sukurti programą';

  @override
  String get applicationsCreateSubmit => 'Sukurti';

  @override
  String get applicationsCreateClaimTooltip =>
      'Norėdami kurti programas, užregistruokite paskyrą.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Skaityti dokumentaciją ($domain)';
  }

  @override
  String get applicationsLoadError => 'Nepavyko įkelti programų';

  @override
  String get applicationsLoadErrorDescription =>
      'Patikrinkite ryšį ir bandykite dar kartą.';

  @override
  String get applicationsEmptyTitle => 'Dar nėra programų';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Sukurkite pirmąją programą, kad pradėtumėte naudotis $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Sukurta $date';
  }

  @override
  String get applicationsName => 'Programos pavadinimas';

  @override
  String get applicationsNameHint => 'Mano programa';

  @override
  String get applicationsNameRequired => 'Reikalingas programos pavadinimas';

  @override
  String get applicationsBackToList => 'Grįžti į sąrašą';

  @override
  String get applicationsDetailLoadError => 'Nepavyko įkelti šios programos';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Bandyti dar kartą arba grįžti į programų sąrašą.';

  @override
  String get applicationsId => 'Programos ID';

  @override
  String get applicationsCopyId => 'Kopijuoti ID';

  @override
  String get applicationsSecretsTitle => 'Paslaptys ir prieigos raktai';

  @override
  String get applicationsSecretsDescription =>
      'Saugokite juos. Sugeneravus iš naujo, esamos integracijos nutrūks.';

  @override
  String get applicationsClientSecret => 'Kliento paslaptis';

  @override
  String get applicationsBotToken => 'Boto prieigos raktas';

  @override
  String get applicationsRegenerate => 'Generuoti iš naujo';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Iš naujo generuoti kliento paslaptį?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Iš naujo sugeneruoti boto prieigos raktą?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Sugeneravus iš naujo, dabartinė paslaptis taps negaliojanti. Atnaujinkite visą kodą, kuriame naudojama sena reikšmė.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Sugeneravus iš naujo, dabartinis prieigos raktas taps nebegaliojantis. Atnaujinkite visą kodą, kuriame naudojama sena reikšmė.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Kliento paslaptis sugeneruota iš naujo. Atnaujinkite visą kodą, kuriame naudojama senoji paslaptis.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Boto prieigos raktas iš naujo sugeneruotas. Atnaujinkite visą kodą, kuriame naudojamas senas raktas.';

  @override
  String get applicationsRegenerateFailed =>
      'Nepavyko iš naujo sugeneruoti paslapties';

  @override
  String get applicationsInfoTitle => 'Programos informacija';

  @override
  String get applicationsInfoDescription =>
      'Pagrindiniai nustatymai ir leidžiami nukreipimo URI.';

  @override
  String get applicationsPublicBot => 'Viešasis botas';

  @override
  String get applicationsPublicBotDescription =>
      'Leisti bet kam pakviesti šį botą į savo bendruomenes.';

  @override
  String get applicationsRequireCodeGrant =>
      'Reikalauti „OAuth2“ kodo suteikimo';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Kviečiant šį botą, reikalingas nukreipimo URI ir autorizacijos kodas.';

  @override
  String get applicationsRedirectUris => 'Nukreipimo URI';

  @override
  String get applicationsAddRedirect => 'Pridėti nukreipimą';

  @override
  String get applicationsDeleteRedirect => 'Ištrinti nukreipimo URI';

  @override
  String get applicationsBotProfileTitle => 'Boto profilis';

  @override
  String get applicationsBotProfileDescription =>
      'Jūsų boto avataras, žyma ir išsami profilio informacija.';

  @override
  String get applicationsBotAvatar => 'Boto avataras';

  @override
  String get applicationsUsernameRequired => 'Reikalingas naudotojo vardas';

  @override
  String get applicationsUsernameTooLong =>
      'Naudotojo vardas turi būti ne ilgesnis nei 32 simboliai';

  @override
  String get applicationsUsernameInvalid =>
      'Naudotojo vardą gali sudaryti tik raidės, skaičiai ir apatiniai brūkšniai';

  @override
  String get applicationsBotUsername => 'Boto naudotojo vardas';

  @override
  String get applicationsDiscriminator => 'Diskriminatorius';

  @override
  String get applicationsBotBio => 'Boto biografija';

  @override
  String get applicationsBotBioHint =>
      'Naudingas botas, kuris daro nuostabius dalykus!';

  @override
  String get applicationsNoBotBanner => 'Nėra boto reklamjuostės';

  @override
  String get applicationsFriendlyBot => 'Draugiškas botas';

  @override
  String get applicationsFriendlyBotDescription =>
      'Leisti naudotojams siųsti šiam botui draugystės užklausas, kurias reikės patvirtinti rankiniu būdu.';

  @override
  String get applicationsManualFriendApproval =>
      'Reikalauti rankinio draugystės patvirtinimo';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Šiam botui siunčiamos draugystės užklausos turi būti patvirtintos rankiniu būdu.';

  @override
  String get applicationsOauthBuilderTitle => 'OAuth2 URL kūrimo priemonė';

  @override
  String get applicationsOauthBuilderDescription =>
      'Sukurkite autorizavimo URL su sritimis ir leidimais.';

  @override
  String get applicationsScopes => 'Leidimų sritys';

  @override
  String get applicationsRedirectUri => 'Nukreipimo URI';

  @override
  String get applicationsSelectRedirectUri => 'Pasirinkite nukreipimo URI';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'Nukreipimo URI yra privalomas, nes šiam botui reikalingas OAuth2 kodo suteikimas.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'Nukreipimo URI būtinas, kai naudojama ne tik boto leidimų sritis.';

  @override
  String get applicationsBotPermissions => 'boto leidimai';

  @override
  String get applicationsAuthorizeUrl => 'Autorizavimo URL';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Pasirinkite leidimų sritis (ir nukreipimo URI, jei reikia)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Kopijuoti autorizavimo URL';

  @override
  String get applicationsCopiedUrl => 'URL nukopijuotas į iškarpinę';

  @override
  String get applicationsDangerTitle => 'Pavojinga zona';

  @override
  String get applicationsDangerSubtitle =>
      'To negalima anuliuoti. Pašalinus programą, taip pat ištrinamas ir jos botas.';

  @override
  String get applicationsDangerHelper =>
      'Ištrynus programą, ji ir jos prisijungimo duomenys bus visam laikui pašalinti.';

  @override
  String get applicationsDelete => 'Ištrinti programą';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Ar tikrai norite ištrinti $name? Šio veiksmo anuliuoti negalima. Visi susiję duomenys, įskaitant boto naudotoją, bus ištrinti visam laikui.';
  }

  @override
  String get applicationsDeleteFailed => 'Nepavyko ištrinti programos';

  @override
  String get applicationsUpdated => 'Programa sėkmingai atnaujinta';

  @override
  String get applicationsNoChanges => 'Nėra išsaugotinų pakeitimų';

  @override
  String get applicationsSearchBots => 'Programos ir botai';

  @override
  String get applicationsSearchBotsDescription =>
      'Kurkite ir tvarkykite savo paskyros programas ir botus';

  @override
  String get applicationsSearchInfoDescription =>
      'Redaguoti pagrindinius programos nustatymus ir nukreipimo URI';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Redaguoti boto avatarą, žymą, biografiją, reklamjuostę ir draugystės užklausų elgseną';

  @override
  String get applicationsSearchOauthDescription =>
      'Sukurti autorizavimo URL su aprėptimis, nukreipimais ir boto leidimais';

  @override
  String get applicationsSearchSecretsDescription =>
      'Peržiūrėti ir iš naujo sugeneruoti kliento paslaptis ir boto prieigos raktus';

  @override
  String get applicationsSearchBotsKeyword => 'Botai';

  @override
  String get applicationsSearchDocumentation => 'Dokumentacija';

  @override
  String get blockedUsersTitle => 'Užblokuoti naudotojai';

  @override
  String get blockedUsersDescription =>
      'Užblokuoti naudotojai negali siųsti jums draugystės užklausų ar tiesiogiai rašyti žinučių.';

  @override
  String get blockedUsersEmptyTitle => 'Nėra užblokuotų naudotojų';

  @override
  String get blockedUsersEmptyDescription => 'Dar nieko neužblokavote.';

  @override
  String get blockedUsersLoadError => 'Nepavyko įkelti užblokuotų vartotojų';

  @override
  String get blockedUsersUnblock => 'Atblokuoti';

  @override
  String get blockedUsersUnblockTitle => 'Atblokuoti naudotoją';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Ar tikrai norite atblokuoti $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopijuoti naudotojo vardą';

  @override
  String get blockedUsersCopyId => 'Kopijuoti naudotojo ID';

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
    return '$productName darbuotojas';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName bendruomenės komanda';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '„$productName“ partneris';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName klaidų medžiotojas';
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
    return '$productName vizionierius';
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
    return 'Bendros bendruomenės ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Bendri draugai';

  @override
  String get userProfileMutualCommunitiesTitle => 'Bendros bendruomenės';

  @override
  String get userProfileNoMutualFriends => 'Bendrų draugų nerasta.';

  @override
  String get userProfileNoMutualCommunities => 'Bendrų bendruomenių nerasta.';

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
  String get userProfileMemberSince => 'Narys nuo';

  @override
  String get userProfileAboutMe => 'Apie mane';

  @override
  String get userProfileRoles => 'Vaidmenys';

  @override
  String get memberRoleAdd => 'Pridėti vaidmenį';

  @override
  String memberRoleRemove(String roleName) {
    return 'Pašalinti vaidmenį „$roleName“';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Šis naudotojas neturi vaidmenų šioje bendruomenėje.';

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
  String get guildSettingsRolesTab => 'Vaidmenys';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Vietinis laikas';

  @override
  String get profileLocalTimeSettingsTitle => 'Profilio vietinis laikas';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Nustatykite laiko juostą vieną kartą, kad $productName galėtų atnaujinti jūsų UTC poslinkį pasikeitus vasaros laikui. Kiti žmonės mato tik jūsų UTC poslinkį, o ne tikslų laiko juostos identifikatorių.';
  }

  @override
  String get profileLocalTimeEditButton => 'Redaguoti profilio vietinį laiką';

  @override
  String get profileLocalTimeTimezoneLabel => 'Laiko juosta';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Pasirinkite laiko zoną, kurią $productName naudoja apskaičiuodama jūsų UTC poslinkį, kad būtų rodomas vietinis profilio laikas.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Ieškoti laiko juostų';

  @override
  String get profileLocalTimeNotSet => 'Nenustatyta';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Kiti žmonės mato tik jūsų dabartinį UTC poslinkį, kai nusprendžiate dalytis profilio vietiniu laiku. Jie nemato tikslaus jūsų laiko juostos identifikatoriaus, pavyzdžiui, $timezoneIdentifierExample. $productName šį identifikatorių saugo tik tam, kad poslinkis būtų automatiškai atnaujintas pasikeitus vasaros laikui.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Visi';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Leisti visiems, kurie gali matyti visą jūsų profilį, matyti jūsų vietos laiką';

  @override
  String get profileLocalTimePrivacyFriends => 'Draugai';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Leisti draugams matyti jūsų profilio vietinį laiką';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Bendruomenės nariai';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Leisti bendruomenių, kuriose esate, nariams matyti jūsų profilio vietinį laiką';

  @override
  String get userProfileSameTimeAsYou => 'Toks pat laikas kaip ir jūsų';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration vėliau nei pas jus';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration anksčiau nei pas jus';
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
  String get userProfileCopyUsername => 'Kopijuoti naudotojo vardą';

  @override
  String get userProfileCopyUserId => 'Kopijuoti naudotojo ID';

  @override
  String get userProfileViewMainProfile => 'Peržiūrėti pagrindinį profilį';

  @override
  String get userProfileViewCommunityProfile =>
      'Peržiūrėti bendruomenės profilį';

  @override
  String get userProfileBlockUser => 'Blokuoti naudotoją';

  @override
  String get userProfileUnblockUser => 'Atblokuoti naudotoją';

  @override
  String get userProfileRemoveFriend => 'Pašalinti draugą';

  @override
  String get userProfileBlockConfirmTitle => 'Blokuoti naudotoją';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Ar tikrai norite užblokuoti $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Atblokuoti naudotoją';

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
  String get userProfileChangeNickname => 'Keisti slapyvardį';

  @override
  String get userProfileKick => 'Išmesti';

  @override
  String get userProfileBan => 'Užblokuoti';

  @override
  String get userProfileTimeout => 'Laikinai apriboti';

  @override
  String get userProfileRemoveTimeout => 'Pašalinti laikinąjį apribojimą';

  @override
  String get userProfileTransferOwnership => 'Perduoti nuosavybę';

  @override
  String get userProfileReportMessage => 'Pranešti apie žinutę';

  @override
  String get userProfileReportUserProfile => 'Pranešti apie profilį';

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
  String get userProfileBanDurationLabel => 'Užblokavimo trukmė';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Pasirinktinė trukmė (sekundėmis)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Bet kokia reikšmė nuo $min iki $max sekundžių';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Ištrinti žinučių istoriją';

  @override
  String get userProfileBanDeleteNone => 'Neištrinti jokių';

  @override
  String get userProfileBanDelete24h => 'Paskutinės 24 valandos';

  @override
  String get userProfileBanDelete7d => 'Paskutinės 7 dienos';

  @override
  String get userProfileBanReasonLabel => 'Priežastis (pasirinktinai)';

  @override
  String get userProfileBanReasonHint => 'Įveskite užblokavimo priežastį';

  @override
  String get userProfileBanSubmit => 'Užblokuoti narį';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Apriboti $username pranešimų siuntimą';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Laikino apribojimo trukmė';

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
  String get userProfileTransferSuccess => 'Nuosavybė perduota';

  @override
  String get durationPermanent => 'Visam laikui';

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
  String get durationCustom => 'Pasirinktinis…';

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
    return 'Džiugu, kad esate čia, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Sveiki, $username! Jauskitės kaip namie.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Sveiki, $username! Malonu, kad prisijungėte.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Sveiki, $username! Prisijunkite, kai būsite pasiruošę.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Sveiki, $username, smagu jus čia matyti!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Sveiki, $username! Tikimės, kad jums patiks.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return '$username, sveiki prisijungę!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Džiugu, kad prisijungėte, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Sveiki atvykę, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Sveiki, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Sveiki, $username! Džiaugiamės, kad prisijungėte.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Sveiki, $username! Tikimės, kad jums čia patiks.';
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
    return 'Malonu matyti, $username! Sveiki atvykę.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Sveiki atvykę, $username! Smagu, kad esate su mumis.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Sveiki atvykę, $username! Pradėkime.';
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
  String get linkedDevicesCurrentDevice => 'Šis įrenginys';

  @override
  String get linkedDevicesOtherDevices => 'Kiti įrenginiai';

  @override
  String get linkedDevicesEnterSelection => 'Įjungti pasirinkimo režimą';

  @override
  String get linkedDevicesExitSelection => 'Išjungti pasirinkimo režimą';

  @override
  String get linkedDevicesSelectAll => 'Pažymėti viską';

  @override
  String get linkedDevicesClearSelection => 'Išvalyti pasirinkimą';

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
  String get linkedDevicesViewDetails => 'Peržiūrėti išsamią informaciją';

  @override
  String get linkedDevicesDetailsTitle => 'Įrenginio informacija';

  @override
  String get linkedDevicesDetailsDevice => 'Įrenginys';

  @override
  String get linkedDevicesDetailsClient => 'Klientas';

  @override
  String get linkedDevicesDetailsLocation => 'Vieta';

  @override
  String get linkedDevicesDetailsIp => 'IP adresas';

  @override
  String get linkedDevicesDetailsLastUsed => 'Paskutinį kartą naudotas';

  @override
  String get linkedDevicesCurrentSession => 'Dabartinis seansas';

  @override
  String get linkedDevicesUnknown => 'Nežinoma';

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
    return 'Nustatytas lėtasis režimas – $durationLabel, bet jums jis netaikomas.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Nustatytas lėtasis režimas – $durationLabel. Palaukite prieš siųsdami kitą žinutę.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Šiame kanale nustatytas lėtasis režimas – $durationLabel.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Negalite siųsti žinučių šiame kanale.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Sistemos pranešimai iš „$productName“ darbuotojų. Čia negalite atsakyti.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Šioje bendruomenėje žinučių siuntimas laikinai pristabdytas.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Jums taikomas laikinas apribojimas. Žinučių siuntimas, reakcijos ir balso funkcijos pristabdytos, kol apribojimas baigsis.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Kad galėtumėte siųsti žinutes šioje bendruomenėje, turite užregistruoti savo paskyrą.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Kad galėtumėte siųsti žinutes šioje bendruomenėje, turite patvirtinti savo el. pašto adresą.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Jūsų paskyra per nauja, kad galėtų siųsti žinutes šioje bendruomenėje.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Dar nepakankamai ilgai esate šios bendruomenės narys, kad galėtumėte siųsti žinutes.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Patvirtinti el. paštą';

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
  String get voiceMessageTitle => 'Balso žinutė';

  @override
  String get voiceMessageHoldHint =>
      'Laikykite, kad įrašytumėte. Vilkite į šiukšlinę, kad ištrintumėte, slinkite aukštyn, kad užfiksuotumėte, arba atleiskite, kad išsiųstumėte.';

  @override
  String get voiceMessageDiscard => 'Atmesti balso žinutę';

  @override
  String get voiceMessageSend => 'Siųsti balso žinutę';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nepavyko pradėti įrašymo. Leiskite prieigą prie mikrofono.';

  @override
  String get voiceMessageMicInUse =>
      'Išeikite iš balso skambučio, kad įrašytumėte balso pranešimą.';

  @override
  String get voiceMessageRecordingFailed =>
      'Įrašyti nepavyko. Bandykite dar kartą.';

  @override
  String get voiceMessageSendFailed =>
      'Nepavyko išsiųsti balso žinutės. Bandykite dar kartą.';

  @override
  String get voiceMessagePlay => 'Leisti';

  @override
  String get voiceMessagePause => 'Pristabdyti';

  @override
  String get voiceMessageSeekForward => 'Pirmyn';

  @override
  String get voiceMessageSeekBackward => 'Atšaukti';

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
  String get chatAttachmentExpiredTooltip => 'Priedo galiojimas baigėsi';

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
  String get matureCommunityTitle => 'Brandaus turinio bendruomenė';

  @override
  String get matureCategoryTitle => 'Brandaus turinio kategorija';

  @override
  String get matureChannelTitle => 'Brandaus turinio kanalas';

  @override
  String get communityContentWarningTitle => 'Bendruomenės turinio įspėjimas';

  @override
  String get categoryContentWarningTitle => 'Kategorijos turinio įspėjimas';

  @override
  String get channelContentWarningTitle => 'Kanalo turinio įspėjimas';

  @override
  String get defaultContentWarningBody => 'Čia yra jautraus turinio.';

  @override
  String get matureCommunityBody =>
      'Ši bendruomenė pažymėta kaip skirta brandžiam turiniui ir joje gali būti medžiagos, kuri kai kuriems naudotojams gali būti netinkama.';

  @override
  String get matureCategoryBody =>
      'Ši kategorija pažymėta kaip skirta brandžiam turiniui ir joje gali būti medžiagos, kuri kai kuriems naudotojams gali būti netinkama.';

  @override
  String get matureChannelBody =>
      'Šis kanalas pažymėtas kaip skirtas brandžiam turiniui ir jame gali būti medžiagos, kuri kai kuriems naudotojams gali būti netinkama.';

  @override
  String get matureVoiceChannelBody =>
      'Šis balso kanalas pažymėtas kaip skirtas suaugusiesiems ir jame gali būti turinio, kuris kai kuriems naudotojams gali būti netinkamas.';

  @override
  String get matureLinkChannelBody =>
      'Šis nuorodų kanalas pažymėtas kaip skirtas brandžiam turiniui ir gali atverti medžiagą, kuri kai kuriems naudotojams gali būti netinkama.';

  @override
  String get matureCommunityUnavailableBody =>
      'Ši brandaus turinio bendruomenė nepasiekiama jūsų paskyrai.';

  @override
  String get matureCategoryUnavailableBody =>
      'Ši brandaus turinio kategorija nepasiekiama jūsų paskyrai.';

  @override
  String get matureChannelUnavailableBody =>
      'Šis brandaus turinio kanalas nepasiekiamas jūsų paskyrai.';

  @override
  String get matureContentProceedButton => 'Tęsti';

  @override
  String get matureContentUnderstandButton => 'Supratau';

  @override
  String get matureContentOpenLinkButton => 'Atidaryti nuorodą';

  @override
  String get sensitiveContentFriendDmLabel => 'Tiesioginės žinutės iš draugų';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Tiesioginės žinutės iš kitų';

  @override
  String get sensitiveContentGuildLabel => 'Žinutės bendruomenės kanaluose';

  @override
  String get sensitiveContentFilterShow => 'Rodyti';

  @override
  String get sensitiveContentFilterBlur => 'Sulieti';

  @override
  String get sensitiveContentFilterBlock => 'Blokuoti';

  @override
  String get sensitiveContentResetButton => 'Atkurti';

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
  String get connectionsEmptyTitle => 'Kol kas nėra ryšių';

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
  String get connectionsAddDomainAriaLabel => 'Pridėti domeno ryšį';

  @override
  String get connectionEdit => 'Redaguoti';

  @override
  String get connectionRemove => 'Pašalinti';

  @override
  String get connectionVerifiedLabel => 'Šis ryšys patvirtintas.';

  @override
  String get connectionUnverifiedLabel => 'Šis ryšys nepatvirtintas.';

  @override
  String get connectionAddTitle => 'Pridėti ryšį';

  @override
  String get connectionTypeLabel => 'Ryšio tipas';

  @override
  String get connectionHandleLabel => 'Pseudonimas';

  @override
  String get connectionDomainLabel => 'Domenas';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Jau turite šį ryšį.';

  @override
  String get connectionConnectBluesky => 'Prisijungti su Bluesky';

  @override
  String get connectionContinue => 'Tęsti';

  @override
  String get connectionVerifyTitle => 'Patvirtinti ryšį';

  @override
  String get connectionVerifyInstructions =>
      'Naudokite žemiau pateiktą įrašą, kad įrodytumėte domeno nuosavybę.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT įrašas';

  @override
  String get connectionDnsHostLabel => 'Įrašo pavadinimas';

  @override
  String get connectionDnsValueLabel => 'Reikšmė';

  @override
  String get connectionCopyHost => 'Kopijuoti pagrindinį kompiuterį';

  @override
  String get connectionCopyValue => 'Kopijuoti reikšmę';

  @override
  String get connectionCopied => 'Nukopijuota!';

  @override
  String get connectionTokenFileTitle => 'Pateikti prieigos rakto failą';

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
  String get connectionEditTitle => 'Redaguoti ryšį';

  @override
  String get connectionEditDescription =>
      'Pasirinkite, kas gali matyti šį ryšį jūsų profilyje.';

  @override
  String get connectionVisibilityEveryone => 'Visi';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Leisti visiems matyti šį ryšį jūsų profilyje';

  @override
  String get connectionVisibilityFriends => 'Draugai';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Leisti draugams matyti šį ryšį';

  @override
  String get connectionVisibilityCommunityMembers => 'Bendruomenės nariai';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Leisti bendruomenių, kuriose esate, nariams matyti šį ryšį';

  @override
  String get connectionRemoveTitle => 'Pašalinti ryšį';

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
  String get lookAndFeelThemeDark => 'Tamsioji tema';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Tamsioji (sena) tema';

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
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Žvaigždžių laukas';

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
      'Pasirinkite, kaip žinutės rodomos pokalbių kanaluose.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Tarpas tarp žinučių grupių';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Žinučių rodymo režimas';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Patogus';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Erdvus išdėstymas, kuriame žinutės aiškiai atskirtos viena nuo kitos.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Tankus';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Padidina matomų žinučių skaičių paliekant minimalius tarpus.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Slėpti naudotojų avatarus';

  @override
  String get lookAndFeelInterfaceTitle => 'Sąsaja';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Tinkinti sąsajos elementus ir veikimą.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Kanalų sąrašo rašymo indikatoriai';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Pasirinkite, kaip rašymo indikatoriai rodomi kanalo sąraše, kai kas nors rašo kanale.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Rašymo indikatorius + avatarai';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Rodyti rašymo indikatorių su naudotojų avatarais kanalų sąraše';

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
      'Nerodyti rašymo indikatorių kanalų sąraše';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Rodyti rašymą pasirinktame kanale';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Kai išjungta (numatyta), rašymo indikatoriai nebus rodomi kanale, kurį šiuo metu žiūrite.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'bendras';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Klaviatūros patarimai';

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
  String get guildUnavailableDescription => 'Kažkas nepavyko. Jau taisome.';

  @override
  String get guildNotFoundTitle => 'Tai ne ta bendruomenė, kurios ieškote.';

  @override
  String get guildNotFoundDescription =>
      'Bendruomenė, kurios ieškote, galėjo būti ištrinta arba neturite prieigos prie jos.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName šiuo metu prieinama tik $productName darbuotojams';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'laikinai nepasiekiama';

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
      'Valdykite, kaip nutildytų kanalų neskaitytų pranešimų indikatorius veikia kanalų sąrašuose.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Rodyti neperskaitytų pranešimų indikatorių nutildytuose kanaluose';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Kai įjungta, nutildytuose kanaluose kairėje pusėje rodomas išblukęs neskaitytų pranešimų indikatorius. Paminėjimai vis tiek rodomi nepriklausomai nuo šio nustatymo.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktyvūs dabar';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Valdykite, kaip „Dabar aktyvūs“ rodomi visoje programėlėje.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Rodyti, kas dabar aktyvus, pagrindiniame ekrane';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Rodyti „Aktyvūs dabar“ pagrindiniame ekrane, kad matytumėte draugus, kurie aktyvūs balso pokalbiuose. Matysite peržiūrą, kanalo kontekstą, kas jau ten yra, ir greitą būdą prisijungti.';

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
  String get favoritesWelcomeTitle => 'Sveiki atvykę į mėgstamiausius';

  @override
  String get favoritesWelcomeDescription =>
      'Jūsų asmeninė erdvė, skirta greitai pasiekti mėgstamus kanalus, tiesiogines žinutes ir grupes. Paspauskite žvaigždutę prie bet kurio kanalo, kad jį čia pridėtumėte.';

  @override
  String get favoritesWelcomeTip => 'Netinka? Išjunkite bet kada.';

  @override
  String get favoritesDisableButton => 'Išjungti mėgstamiausius';

  @override
  String get favoritesAddedToast => 'Pridėta prie mėgstamiausių';

  @override
  String get favoritesRemovedToast => 'Pašalinta iš mėgstamiausių';

  @override
  String get favoritesHiddenToast => 'Parankiniai paslėpti';

  @override
  String get favoritesMute => 'Nutildyti mėgstamiausius';

  @override
  String get favoritesUnmute => 'Įjungti mėgstamiausių garsą';

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
  String get favoritesUncategorized => 'Nekategorizuota';

  @override
  String get favoritesOtherCategory => 'Kita';

  @override
  String get favoritesRemoveFromFavorites => 'Pašalinti iš mėgstamiausių';

  @override
  String get favoritesAddToFavorites => 'Pridėti prie mėgstamiausių';

  @override
  String get favoritesAddToSavedMedia => 'Įtraukti į išsaugotą mediją';

  @override
  String get favoritesRemoveFromSavedMedia => 'Pašalinti iš išsaugotos medijos';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Pridėti prie mėgstamiausių GIF (tik URL)';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Pašalinti iš mėgstamiausių GIF (tik URL)';

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
  String get favoritesHideConfirmTitle => 'Slėpti mėgstamiausius';

  @override
  String get favoritesHideConfirmDescription =>
      'Tai paslėps visus su parankiniais susijusius UI elementus, įskaitant mygtukus ir meniu elementus. Jūsų esami parankiniai bus išsaugoti ir bet kada galėsite juos vėl įjungti skiltyje Nustatymai > Išplėstiniai > Išvaizda.';

  @override
  String get favoritesDirectMessageSubtitle => 'Tiesioginė žinutė';

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
      'Slėpti nutildytus kanalus pagal numatytuosius nustatymus';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automatiškai slėpti nutildytus kanalus šoninėje juostoje, kai prisijungiate prie naujų bendruomenių';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Slėpti nutildytus kanalus pagal numatytuosius nustatymus?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Naujose bendruomenėse, prie kurių prisijungsite, nutildyti kanalai bus automatiškai paslėpti. Ar norėtumėte šį nustatymą pritaikyti ir visoms esamoms bendruomenėms?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Nebeslėpti nutildytų kanalų pagal numatytuosius nustatymus?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Naujose bendruomenėse, prie kurių prisijungsite, nutildyti kanalai nebebus automatiškai slepiami. Ar norėtumėte rodyti nutildytus kanalus ir visose esamose bendruomenėse?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Taikyti visoms bendruomenėms';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Rodyti visose bendruomenėse';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Tik naujos bendruomenės';

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
    return 'Kai įkeliama tiesiai į $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Nuorodų peržiūros';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Valdykite, kaip svetainių nuorodos yra peržiūrimos pokalbyje';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Rodyti įterptuosius elementus ir svetainių nuorodų peržiūras';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakcijos';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfigūruoti jaustukų reakcijas į žinutes';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Rodyti jaustukų reakcijas prie žinučių';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Paslėptas turinys';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Valdyti, kaip rodomas paskelbtas turinys';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Rodyti paskelbtą turinį';

  @override
  String get messagesMediaSpoilersOnClickName => 'Spustelėjus';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Rodyti paslėptą turinį paspaudus';

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
      'Visada rodyti paslėptą turinį';

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
      'Automatiškai siųsti pasirinktus GIF';

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
      'Rodyti numatytuosius jaustukus išraiškų automatiniame pildyme';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Rodyti pasirinktinius jaustukus išraiškų automatiniame pildyme';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Rodyti lipdukus išraiškų automatiniame pildyme';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Rodyti išsaugotą mediją išraiškų automatiniame pildyme';

  @override
  String get accessibilitySaturationTitle => 'Sodrumas';

  @override
  String get accessibilityVisualGroupTitle => 'Vaizdas';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Visada pabraukti nuorodas';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Rodyti alternatyvųjį tekstą prie paveikslėlių';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Rodyti alternatyvųjį tekstą po paveikslėliais, kai jis pasiekiamas.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Pritemdyti perbrauktą tekstą';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM žinučių peržiūros';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM žinučių peržiūros režimas';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Visos žinutės';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Rodyti žinučių peržiūras visuose DM pokalbiuose';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Tik neskaityti DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Rodyti žinučių peržiūras tik DM su neskaitytomis žinutėmis';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nėra';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Nerodyti žinučių peržiūrų DM sąraše';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Ekrano skaitytuvas';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Valdykite, kaip $productName veikia su ekrano skaitytuvais.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Skelbti naujas žinutes';

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
    return 'Taip atrodo nuorodos: $linkPreviewExampleUrl';
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
      'Klavišu Esc išeinama iš klaviatūros režimo';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Rodyti kontekstinio meniu sparčiuosius klavišus';

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
    return 'Automatiškai leisti GIF, kai $productName yra aktyvus';
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
      'Lipdukai bus animuojami, kai juos paspausite';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Lipdukai bus animuojami, kai ant jų užvesite pelę arba su jais sąveikausite';

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
  String get accessibilityMotionGroupTitle => 'Judesys';

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
    return 'jaustukas $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'pasvirasis brūkšnys $commandName';
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
  String get dmListSentAnAttachment => 'Išsiuntė priedą';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username prisegė žinutę prie šio kanalo.';
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
    return '$username pašalino narį iš grupės.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username pakeitė kanalo pavadinimą į „$newName“.';
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
  String get systemCallDurationFewSeconds => 'kelias sekundes';

  @override
  String get systemCallDurationMinute => 'minutę';

  @override
  String get systemCallDurationOneYear => '1 metus';

  @override
  String get systemCallDurationOneMonth => '1 mėnuo';

  @override
  String get systemCallDurationOneWeek => '1 savaitė';

  @override
  String get systemCallDurationOneDay => '1 diena';

  @override
  String get systemCallDurationOneHour => '1 valanda';

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
    return 'Atnaujinkite „$productName“, kad galėtumėte peržiūrėti šią žinutę.';
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
      'Tiesiog prisijungti (išlaikyti kitus ryšius)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Nieko nedaryti, nenoriu prisijungti';

  @override
  String get voiceJoinFailedTitle => 'Nepavyko prisijungti prie balso';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Nepavyko atjungti kitų jūsų įrenginių. Pabandykite dar kartą po akimirkos.';

  @override
  String get voiceChannelJoin => 'Prisijungti prie balso kanalo';

  @override
  String get voiceCallJoin => 'Prisijungti prie skambučio';

  @override
  String get voiceChannelJoinConnect => 'Prisijungti prie balso pokalbio';

  @override
  String get voiceChannelNoConnectPermission =>
      'Neturite leidimo prisijungti prie šio balso kanalo';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofonas, kamera ir bendrinamas ekrano turinys yra užšifruoti nuo galo iki galo.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofonas, kamera ir bendrinamas ekrano turinys yra užšifruoti nuo galo iki galo.';

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
  String get voiceChannelStatusConnecting => 'Jungiamasi…';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobilusis įrenginys';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Kompiuteris';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Bendruomenės nutildytas';

  @override
  String get voiceParticipantTooltipMuted => 'Nutildytas';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Bendruomenės apkurdintas';

  @override
  String get voiceParticipantTooltipDeafened => 'Garsas išjungtas';

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
  String get voiceChannelLeave => 'Palikti';

  @override
  String get voiceControlMute => 'Nutildyti';

  @override
  String get voiceControlUnmute => 'Įjungti garsą';

  @override
  String get voiceControlDeafen => 'Išjungti garsą';

  @override
  String get voiceControlUndeafen => 'Įjungti garsą';

  @override
  String get voiceControlVideo => 'Vaizdo įrašas';

  @override
  String get voiceControlFlipCamera => 'Apversti kamerą';

  @override
  String get voiceControlScreenShare => 'Ekrano bendrinimas';

  @override
  String get voiceScreenShareNotificationText => 'Bendrinamas jūsų ekranas.';

  @override
  String get voiceControlDisconnect => 'Atjungti';

  @override
  String get voiceInChat => 'Balso pokalbyje';

  @override
  String get voiceConnectionFailed => 'Nepavyko prisijungti';

  @override
  String get voiceConnectionRetry => 'Bandyti dar kartą';

  @override
  String get voiceConnectionDismiss => 'Atmesti';

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
    return 'Pereiti į „$channelSourceLabel“';
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
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Delsos svyravimas';

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
  String get voiceParticipantMenuViewProfile => 'Peržiūrėti profilį';

  @override
  String get voiceParticipantMenuFocus => 'Sutelkti dėmesį į šį asmenį';

  @override
  String get voiceParticipantMenuUnfocus => 'Nebefokusuoti';

  @override
  String get voiceParticipantMenuCommunityMute => 'Nutildyti bendruomenėje';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Išjungti garsą bendruomenėje';

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
  String get voiceCallViewModeLabel => 'Rodinys';

  @override
  String get voiceCallViewModeGrid => 'Tinklelis';

  @override
  String get voiceCallViewModeFocus => 'Fokusas';

  @override
  String get voicePanelSettingsSectionTitle => 'Balso nustatymai';

  @override
  String get voicePanelUseEarpieceLabel => 'Naudoti ausinę';

  @override
  String get voiceOutputRouteSpeaker => 'Garsiakalbis';

  @override
  String get voiceOutputRouteEarpiece => 'Ausinė';

  @override
  String get voiceOutputRouteHeadset => 'Ausinės';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Rodyti tik vaizdo įrašus';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Rodyti tik dalyvius, kurie įjungę kamerą.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Rodyti mano kamerą';

  @override
  String get voicePrioritizeSpeakersLabel => 'Teikti pirmenybę kalbantiesiems';

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
  String get voiceWatchStream => 'Žiūrėti transliaciją';

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
  String get voiceLiveBadge => 'Tiesiogiai';

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
  String get dmVoiceFullscreenTitle => 'Balsas';

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
  String get notificationsNoUnreadBody => 'Viskas peržiūrėta.';

  @override
  String get notificationsNoMentionsTitle => 'Nėra naujų paminėjimų';

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
  String get notificationsViewAllUnread => 'Rodyti visus neperskaitytus';

  @override
  String get notificationsMarkAsRead => 'Pažymėti kaip perskaitytą';

  @override
  String get notificationsExpand => 'Išskleisti';

  @override
  String get notificationsCollapse => 'Sutraukti';

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
      'Jūsų žinutės nepavyko pristatyti. Norėdami siųsti tiesiogines žinutes, turite užregistruoti savo paskyrą.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Jūsų žinutės nepavyko pristatyti. Norėdami siųsti žinutes, turite užregistruoti savo paskyrą.';

  @override
  String get chatSendFailureContentBlocked =>
      'Jūsų žinutė nebuvo pristatyta, nes ją pažymėjo mūsų saugos sistemos. Jei manote, kad tai klaida, susisiekite su palaikymo komanda.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'Jūsų žinutė nebuvo pristatyta, nes ją pažymėjo mūsų saugos sistemos. Jei manote, kad tai klaida, susisiekite su šios instancijos administratoriais.';

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
  String get privacyDashboardActivitySharingSection => 'Dalijimasis veikla';

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
      'Tik draugai ir mažos bendruomenės';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Visas jūsų profilis matomas draugams ir bendruomenių, turinčių 200 ar mažiau narių, nariams';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Tik draugai';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Visas jūsų profilis matomas tik jūsų draugams';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Draugystės užklausos';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Visi';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => 'Draugų draugai';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Bendruomenės nariai';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Tiesioginės žinutės';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Leisti tiesiogines žinutes iš bendruomenės narių';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Leisti tiesiogines žinutes iš bendruomenės botų';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Gaunamieji skambučiai';

  @override
  String get privacyDashboardAllowedCallers => 'Leidžiami skambintojai';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blokuoti visus gaunamus skambučius';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Leiskite skambinti tik draugams (rekomenduojama)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Leisti draugams ir papildomoms grupėms, kurias pasirenkate';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Leisti visiems skambinti jums, net nepažįstamiems žmonėms';

  @override
  String get privacyDashboardAdditionalGroups => 'Papildomos grupės';

  @override
  String get privacyDashboardRingBehavior => 'Skambučio elgsena';

  @override
  String get privacyDashboardSilentCalls => 'Tylūs skambučiai iš visų';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Kas gali jus pridėti prie grupinių pokalbių';

  @override
  String get privacyDashboardAllowedInvites => 'Leidžiami kvietimai';

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
  String get privacyDashboardVoiceActivityTitle =>
      'Balso aktyvumas skiltyje „Aktyvūs dabar“';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Bendrinti balso aktyvumą su draugais';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Bendrinti balso aktyvumą su visais draugais?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Nebesidalyti balso aktyvumu su visais draugais?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Netrukus pradėsite bendrinti savo balso aktyvumą su visais draugais, įskaitant būsimus. Apie tai bus pranešta visiems ir tai vėl galėsite pakeisti tik po 24 valandų.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Ketinate nustoti bendrinti savo balso aktyvumą su visais savo draugais, įskaitant būsimus. Apie tai bus pranešta visiems ir tai vėl galėsite pakeisti tik po 24 valandų.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Taip, bendrinti su visais draugais';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Taip, nebebendrinti';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Vėl bus pasiekiama po $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Balso aktyvumo bendrinimas atnaujintas';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Šiuo metu nepavyko atnaujinti balso aktyvumo bendrinimo';

  @override
  String get privacyDashboardDataExportDesc =>
      'Sukursite atsisiunčiamą savo paskyros duomenų archyvą, įskaitant žinutes ir priedų URL. Dauguma žmonių renkasi viską, bet toliau galite susiaurinti apimtį.';

  @override
  String get privacyDashboardExportMyData => 'Eksportuoti mano duomenis';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Visam laikui pašalinkite žinutes, kurias išsiuntėte DM, grupės DM ir bendruomenėse. Darbas vykdomas fone, o kai jis bus baigtas, gausite DM.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Ištrinti mano žinutes';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Leisti tiesiogines žinutes iš bendruomenės narių?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Blokuoti bendruomenės narių tiesiogines žinutes?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Leisti botams siųsti jums tiesiogines žinutes?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blokuoti botų siunčiamas tiesiogines žinutes?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Ar taip pat norite leisti tiesiogines žinutes iš esamų bendruomenių narių?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Ar taip pat norite blokuoti tiesiogines žinutes iš esamų bendruomenių narių?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Ar taip pat norite leisti botams iš esamų bendruomenių siųsti jums tiesiogines žinutes?';

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
  String get privacyDashboardDmConfirmSkip => 'Praleisti šį žingsnį';

  @override
  String get privacyDashboardDataRequestGoBack => 'Grįžti';

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
  String get privacyDashboardDataRequestExportCustom => 'Atskiras pasirinkimas';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Pasirinkite, kokius pokalbių tipus, bendruomenes ir laikotarpį įtraukti į archyvą.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Pasirinkite, ką įtraukti';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Pasirinkite, kokių tipų pokalbius išvalyti.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Tik vietos, kurių nebegaliu pasiekti';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Ištrinti žinutes tik iš bendruomenių ir grupės DM, iš kurių išėjote arba buvote pašalinti.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Kurie pokalbiai';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Nurodykite, kokius pokalbius norite įtraukti.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Atviri DM';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Uždaryti DM pokalbiai';

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
      'Pasirinktinis laikotarpis';

  @override
  String get privacyDashboardDataRequestStartDate => 'Pradžios data';

  @override
  String get privacyDashboardDataRequestEndDate => 'Pabaigos data';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Palikite bet kurį laukelį tuščią, kad ta laikotarpio riba liktų neribota.';

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
      'Sukursime atsisiunčiamą archyvą su visomis jūsų kada nors išsiųstomis žinutėmis ir atsiųsime jums el. laišką, kai jis bus paruoštas. Atsisiuntimo nuoroda tame el. laiške nustos galioti po 7 dienų.';

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
  String get privacyDashboardDataRequestRequestExport => 'Prašyti eksporto';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Ištrinti žinutes';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Sritis';

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
      'Atviros tiesioginės žinutės';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Uždarytos tiesioginės žinutės';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Tiesioginės žinutės (atidarytos ir uždarytos)';

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
  String get doubleTapReactionHint =>
      'Dukart bakstelėkite žinutę, kad sureaguotumėte';

  @override
  String get doubleTapReactionEdit => 'Redaguoti';

  @override
  String get doubleTapReactionEditTitle => 'Redaguoti numatytąjį';

  @override
  String get doubleTapReactionEditSubtitle =>
      'Pasirinkite dukart palietus siunčiamą jaustuką';

  @override
  String get chatMessageEdit => 'Redaguoti žinutę';

  @override
  String get chatMessageReply => 'Atsakyti';

  @override
  String get notificationReplyPlaceholder => 'Žinutė';

  @override
  String get notificationReplyFailed => 'Nepavyko išsiųsti atsakymo';

  @override
  String get chatMessageForward => 'Persiųsti';

  @override
  String get forwardMessageTitle => 'Persiųsti žinutę';

  @override
  String get forwardSearchHint => 'Ieškoti kanalų ar tiesioginių žinučių';

  @override
  String get forwardDirectMessagesSection => 'Tiesioginės žinutės';

  @override
  String get forwardCommentHint => 'Pridėti komentarą (pasirinktinai)';

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
      'Šioje bendruomenėje žinučių siuntimas išjungtas';

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
  String get chatMessageStopSpeaking => 'Nustoti skaityti';

  @override
  String get chatMessagePin => 'Prisegti žinutę';

  @override
  String get chatMessageUnpin => 'Atsegti žinutę';

  @override
  String get chatMessageUnpinIt => 'Atsegti';

  @override
  String get chatMessageBookmark => 'Pažymėti žinutę';

  @override
  String get chatMessageRemoveBookmark => 'Pašalinti žymę';

  @override
  String get chatMessageMarkAsUnread => 'Pažymėti kaip neperskaitytą';

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
  String get chatReactionsSheetEmpty => 'Dar niekas nepridėjo šios reakcijos.';

  @override
  String get chatReactionAddFailed => 'Nepavyko pridėti reakcijos';

  @override
  String get chatReactionRemoveFailed => 'Nepavyko pašalinti reakcijos';

  @override
  String get chatMessageReport => 'Pranešti apie žinutę';

  @override
  String get reportFlowTitleMessage => 'Pranešti apie žinutę';

  @override
  String get reportFlowTitleUserProfile => 'Pranešti apie profilį';

  @override
  String get reportFlowSummaryTitle => 'Peržiūrėkite savo pranešimą';

  @override
  String get reportFlowSummarySubtitle =>
      'Įsitikinkite, kad viskas atrodo gerai, prieš siųsdami.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Praneškite tik tai, ką sąžiningai laikote taisyklių pažeidimu. Piktnaudžiavimas pranešimais prieštarauja mūsų $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'bendruomenės gairių';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Praneškite tik tai, ką sąžiningai laikote taisyklių pažeidimu, ir prašome nesiųsti to paties pranešimo du kartus.';

  @override
  String get reportFlowSelectedMessage => 'Žinutė, apie kurią pranešate';

  @override
  String get reportFlowSelectedUser => 'Profilis, apie kurį pranešate';

  @override
  String get reportFlowReportCategory => 'Jūsų atsakymai';

  @override
  String get reportFlowSubmit => 'Siųsti pranešimą';

  @override
  String get reportFlowBack => 'Atgal';

  @override
  String get reportFlowNext => 'Kitas';

  @override
  String get reportFlowDone => 'Atlikta';

  @override
  String get reportFlowThankYouTitle => 'Pranešimas išsiųstas';

  @override
  String get reportFlowThankYouNoReportTitle =>
      'Ačiū, kad atkreipėte į tai dėmesį';

  @override
  String reportFlowThankYouBody(String productName) {
    return '„$productName“ saugos komanda peržiūrės jūsų pranešimą. Mes neatskleisime, kad jį pateikėte jūs.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Dėkojame, kad mums pranešėte. Tai savaime nepažeidžia mūsų taisyklių, todėl pranešimo nesiuntėme. Jei tai nukreipta prieš kokį nors asmenį arba vartojami įžeidžiantys epitetai, praneškite apie tai dar kartą ir pasirinkite „Įžeidžiantis ar žalingas turinys“.';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Dėkojame, kad mums pranešėte. Tai savaime nepažeidžia mūsų taisyklių, todėl pranešimo nesiuntėme.';

  @override
  String get reportFlowMoreYouCanDo => 'Jūsų galimybės';

  @override
  String reportFlowBlockName(String name) {
    return 'Blokuoti $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'Paslepia šio naudotojo žinutes ir neleidžia rašyti jums';

  @override
  String get reportFlowBlockButton => 'Blokuoti';

  @override
  String get reportFlowBlockedButton => 'Užblokuota';

  @override
  String get reportFlowUrgentBanner =>
      'Jei kam nors gresia tiesioginis pavojus, pirmiausia kreipkitės į vietines pagalbos tarnybas.';

  @override
  String get reportFlowLoadFailed => 'Nepavyko įkelti pranešimo formos.';

  @override
  String get reportFlowTryAgain => 'Bandyti dar kartą';

  @override
  String get reportFlowOutdated =>
      'Pranešimo forma pasikeitė. Pradėkite iš naujo.';

  @override
  String get reportFlowAlreadyReported => 'Jau pranešėte apie šią žinutę.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Jau šiandien pranešėte apie šį profilį.';

  @override
  String get reportFlowRateLimited =>
      'Siunčiate pranešimus per greitai. Bandykite vėliau.';

  @override
  String get reportFlowSubmitFailed =>
      'Nepavyko išsiųsti jūsų pranešimo. Bandykite dar kartą.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Norėdami siųsti pranešimus, užregistruokite paskyrą ir patvirtinkite el. pašto adresą.';

  @override
  String get chatMessageSuppressEmbeds => 'Slėpti įterptuosius elementus';

  @override
  String get chatMessageUnsuppressEmbeds => 'Rodyti įterptuosius elementus';

  @override
  String get chatMessageDelete => 'Ištrinti žinutę';

  @override
  String get chatMessageDeleteConfirmTitle => 'Ištrinti žinutę';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Ar tikrai norite ištrinti šią žinutę?';

  @override
  String get chatMessageDeleteAttachment => 'Ištrinti priedą';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

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
      'Atsakymas paslėptas, nes pradinės žinutės autorius užblokuotas.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Atsakymas paslėptas, nes pradinės žinutės autorius pažymėtas kaip šlamšto siuntėjas.';

  @override
  String get devMarkAsSpamLocally =>
      'Pažymėti kaip šlamštą (tik šiame įrenginyje)';

  @override
  String get devIgnoreSpamFlag => 'Nepaisyti šlamšto žymės';

  @override
  String get chatMessagesLoadError => 'Nepavyko įkelti žinučių.';

  @override
  String get chatReplyMentionOverrideTitle => 'Pakeisti paminėjimo nuostatą?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname pageidauja, kad atsakymai būtų siunčiami su @paminėjimu. Vis tiek siųsti be paminėjimo?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname pageidauja atsakymų be @paminėjimo. Vis tiek siųsti su paminėjimu?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Nepaisyti nuostatos';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Spustelėkite, kad nepaminėtumėte naudotojo, kuriam atsakote.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Spustelėkite, kad paminėtumėte naudotoją, kuriam atsakote.';

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
  String get chatEditNoChanges => 'Nėra išsaugotinų pakeitimų';

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
  String get mediaViewerZoomIn => 'Didinti';

  @override
  String get mediaViewerZoomOut => 'Mažinti';

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
  String get mediaViewerDismissBackdrop => 'Atmesti';

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
  String get chatImageCouldNotLoad => 'Nepavyko įkelti šio paveikslėlio.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Pranešti naudotojams, turintiems šį vaidmenį ir leidimą matyti šį kanalą.';

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
      'Siųsti veiksmo žinutę (apgaubia kursyvu).';

  @override
  String get composerCommandSpoilerDescription =>
      'Siųsti žinutę su paslėptu tekstu (įterpia paslėpto teksto žymas).';

  @override
  String get composerCommandTtsDescription => 'Siųsti teksto į kalbą žinutę.';

  @override
  String get composerCommandNickDescription =>
      'Pakeiskite savo slapyvardį šioje bendruomenėje.';

  @override
  String get composerCommandKickDescription =>
      'Išmesti narį iš šios bendruomenės.';

  @override
  String get composerCommandBanDescription =>
      'Užblokuoti narį šioje bendruomenėje.';

  @override
  String get composerCommandMsgDescription =>
      'Siųsti tiesioginę žinutę naudotojui.';

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
  String get composerCommandReasonOption => 'Priežastis (pasirinktinai).';

  @override
  String get composerCommandMessageOption => 'Žinutė, kurią reikia išsiųsti.';

  @override
  String get composerCommandQueryOption => 'Ko ieškoti.';

  @override
  String get composerCommandNicknameOption =>
      'Jūsų naujas slapyvardis arba palikite tuščią, kad jį atstatytumėte.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Kokią naujausios nario žinučių istorijos dalį ištrinti.';

  @override
  String get composerCommandDeleteMessagesNone => 'Neištrinti jokių';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Ankstesnių $count dienų';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Paskutinės 24 valandos';

  @override
  String get composerCommandOptionRequired =>
      'Ši parinktis privaloma. Įveskite reikšmę.';

  @override
  String get composerCommandClear => 'Išvalyti komandą';

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
      'Sukurti naują bendruomenę arba prisijungti prie esamos.';

  @override
  String get addGuildCreateCommunity => 'Kurti bendruomenę';

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
  String get addGuildCreateClaimTitle => 'Užregistruokite paskyrą';

  @override
  String get addGuildCreateClaimDescription =>
      'Prieš kurdami bendruomenę turite užregistruoti savo paskyrą.';

  @override
  String get addGuildCreateVerifyTitle => 'Patvirtinkite savo el. paštą';

  @override
  String get addGuildCreateVerifyDescription =>
      'Prieš kurdami bendruomenę, turite patvirtinti savo el. pašto adresą.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animuotų piktogramų negalima naudoti kuriant naują bendruomenę. Naudokite statinį paveikslėlį.';

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
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Pašalinti visas reakcijas';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Ar tikrai norite pašalinti visas reakcijas iš šios žinutės?';

  @override
  String get chatMessagePinConfirm => 'Prisegti';

  @override
  String get chatMessagePinConfirmDescription =>
      'Prisegti šią žinutę prie kanalo, kad visi matytų.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Atsegti žinutę';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Išsiųsti šį prisegimą atgal į praeitį?';

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
  String get channelPinsEmptyDescription => 'Prisegtos žinutės rodomos čia.';

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
  String get channelDetailsInvitePeople => 'Kviesti žmones';

  @override
  String get channelDetailsCopyLink => 'Kopijuoti nuorodą';

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
  String get channelSettingsConnectionLimit => 'Ryšių limitas';

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
  String get channelSettingsDeleteInvite => 'Ištrinti kvietimą';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Ištrinti šį kvietimą? Atšaukti nebus galima.';

  @override
  String get channelSettingsCopyInviteCode => 'Kopijuoti kvietimo kodą';

  @override
  String get channelSettingsCopyInviteUrl => 'Kopijuoti kvietimo URL';

  @override
  String get channelSettingsWebhookCreated => 'Webhookas sukurtas';

  @override
  String get channelSettingsWebhookCreateFailed => 'Nepavyko sukurti webhooko';

  @override
  String get channelSettingsCreateWebhook => 'Sukurti webhooką';

  @override
  String get channelSettingsInvitesDescription =>
      'Tvarkykite šio kanalo kvietimo nuorodas.';

  @override
  String get channelSettingsInvitesCreate => 'Kurti kvietimą';

  @override
  String get channelSettingsInvitesEmpty => 'Nėra kvietimo nuorodų';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Šis kanalas dar neturi jokių kvietimo nuorodų. Sukurkite ją, kad pakviestumėte žmones į šį kanalą.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Įkeliant šio kanalo kvietimo nuorodas įvyko klaida. Bandykite dar kartą.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Tvarkykite gaunamus webhookus, kurie gali skelbti žinutes šiame kanale.';

  @override
  String get channelSettingsWebhooksEmpty => 'Nėra webhookų';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Šiam kanalui nesukonfigūruota nė vieno webhooko. Sukurkite webhooką, kad išorinės programos galėtų skelbti žinutes.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Šis kanalas nepalaiko webhookų.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Norint peržiūrėti ir redaguoti šio kanalo webhookus, jums reikia „$permission“ leidimo.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Nepavyko įkelti webhookų';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Įkeliant šio kanalo webhookus įvyko klaida. Bandykite dar kartą.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Sukurta $creator $date';
  }

  @override
  String get channelSettingsWebhooksAvatar => 'Avataras';

  @override
  String get channelSettingsWebhooksUploadImage => 'Įkelti paveikslėlį';

  @override
  String get channelSettingsWebhooksRemove => 'Pašalinti';

  @override
  String get channelSettingsWebhooksName => 'Pavadinimas';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhooko pavadinimas';

  @override
  String get channelSettingsWebhooksChannel => 'Kanalas';

  @override
  String get channelSettingsWebhooksUrl => 'Webhooko URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopijuoti webhooko URL';

  @override
  String get channelSettingsWebhooksDelete => 'Ištrinti webhooką';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Nepavyko ištrinti šio webhooko';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Ištrinti šį webhook? Negalima atšaukti.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Bandyti dar kartą po akimirkos.';

  @override
  String get channelMenuOpenChat => 'Atidaryti pokalbį';

  @override
  String get channelMenuDuplicateChannel => 'Dubliuoti kanalą';

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
  String get channelDetailsTabPins => 'Prisegtos žinutės';

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
  String get channelHeaderPinnedMessages => 'Prisegtos žinutės';

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
  String get channelDetailsSearchAuthorTypeUser => 'Naudotojas';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Botas';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhookas';

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
  String get channelDetailsSearchClearFilter => 'Išvalyti';

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
  String get channelHeaderSearchFiltersTitle => 'Paieškos filtrai';

  @override
  String get channelHeaderSearchRecentTitle => 'Naujausios paieškos';

  @override
  String get channelHeaderSearchUsersTitle => 'Naudotojai';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanalai';

  @override
  String get channelHeaderSearchValuesTitle => 'Reikšmės';

  @override
  String get channelHeaderSearchDatesTitle => 'Datos';

  @override
  String get channelHeaderSearchDefaultBadge => 'Numatytasis';

  @override
  String get channelHeaderSearchClearHistory => 'Išvalyti';

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
  String get channelDetailsSearchIn => 'Kur ieškoti';

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
  String get channelDetailsSearchUsersEmpty => 'Naudotojų nerasta';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'Nėra naudotojų';

  @override
  String get channelDetailsDone => 'Atlikta';

  @override
  String get channelDetailsHasFilterPrompt => 'Rodyti žinutes, kuriose yra:';

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
  String get channelDetailsCopyMessageLink => 'Kopijuoti žinutės nuorodą';

  @override
  String get channelDetailsCopyMessageId => 'Kopijuoti žinutės ID';

  @override
  String get channelDetailsMessageUnpinned => 'Žinutė atsegta';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Ši bendruomenė';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Šis DM pokalbis';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Visos bendruomenės';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Tik visi DM';

  @override
  String get channelDetailsSearchScopeAllDms => 'Visi DM';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Tik atviri DM';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Atviri DM';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Visi DM + bendruomenės';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Atviri DM + bendruomenės';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Ieškoti tik šioje bendruomenėje';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Ieškoti tik šiame DM pokalbyje';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Visose bendruomenėse, kuriose esate dabar';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Tik visuose DM, kuriuose kada nors dalyvavote';

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
  String get channelDetailsSearchSortNewest => 'Pirmiausia naujausi';

  @override
  String get channelDetailsSearchSortOldest => 'Pirmiausia seniausi';

  @override
  String get channelDetailsSearchSortRelevance => 'Tinkamiausi';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Pirmiausia rodyti naujausias žinutes';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Pirmiausia rodyti seniausias žinutes';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Pirmiausia rodyti tinkamiausias žinutes';

  @override
  String get channelDetailsSearchContentImage => 'Vaizdo įkėlimas';

  @override
  String get channelDetailsSearchContentVideo => 'Vaizdo įrašo įkėlimas';

  @override
  String get channelDetailsSearchContentAudio => 'Garso įrašo įkėlimas';

  @override
  String get channelDetailsSearchContentFile => 'Failo įkėlimas';

  @override
  String get channelDetailsSearchContentLink => 'Nuoroda';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Nuorodos peržiūra arba įterptasis elementas';

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
      'Įvestas URL žinutės tekste';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Nuorodų peržiūros ir įterptieji elementai, ne įkelti failai';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Prie žinutės pridėtas lipdukas';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count tipai';
  }

  @override
  String get personalNotesTitle => 'Asmeniniai užrašai';

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
      'Animuotos piktogramos nepalaikomos. Naudokite statinį paveikslėlį.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animuotos piktogramos nepalaikomos';

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
  String get groupDmInvalidImage => 'Netinkamas paveikslėlis';

  @override
  String get groupDmInvalidImageBody =>
      'Šis paveikslėlis netinkamas. Pabandykite kitą.';

  @override
  String get groupDmAddFriends => 'Pridėti';

  @override
  String get groupDmOrSendInvite => 'arba išsiųskite kvietimą draugui:';

  @override
  String get groupDmGenerateInviteLink => 'Generuoti kvietimo nuorodą';

  @override
  String get groupDmCreateInvite => 'Sukurti';

  @override
  String get groupDmInviteExpires24Hours =>
      'Jūsų kvietimas baigs galioti po 24 valandų';

  @override
  String get groupDmAddFriendFailed =>
      'Nepavyko pridėti šio draugo į grupę. Bandykite dar kartą.';

  @override
  String get groupDmGroupFull =>
      'Ši grupė pilna. Pašalinkite ką nors prieš pridėdami daugiau žmonių.';

  @override
  String get groupDmRateLimited =>
      'Veikiate per greitai. Truputį palaukite ir bandykite dar kartą.';

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
  String get groupDmNoInvitesCreated => 'Nėra sukurtų kvietimų';

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
    return 'Rašyti kanale #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Rašyti @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Rašyti grupei $groupName';
  }

  @override
  String get groupDmComposerHint => 'Žinučių grupė';

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
  String get purgePersonalNotes => 'Išvalyti asmeninius užrašus';

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
      'Asmeniniai užrašai jau buvo tušti';

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
  String get giftSettingsClaimAccountTitle => 'Užregistruokite paskyrą';

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
  String get giftSettingsShareWithFriend => 'Bendrinti su draugu';

  @override
  String get premiumPlutoniumTagline =>
      'Atrakinkite didesnius limitus ir išskirtines funkcijas, kartu palaikydami nepriklausomą komunikacijos platformą.';

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
  String get premiumManageSubscription => 'Tvarkyti prenumeratą';

  @override
  String get premiumRedeemGiftCode => 'Išpirkti dovanos kodą';

  @override
  String get premiumGiftBadge => 'Dovana';

  @override
  String get premiumCancelSubscriptionTitle => 'Atšaukti prenumeratą?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Privilegijas išsaugosite iki kito atnaujinimo datos, o tada turėsite 3 dienų pereinamąjį laikotarpį, kad vėl užsiprenumeruotumėte ir išsaugotumėte prenumeratos istoriją.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Atšaukti prenumeratą';

  @override
  String get premiumPurchaseHistoryTitle => 'Pirkimų istorija';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Jūsų naujausios sąskaitos faktūros. Norėdami pakeisti savo prenumeratos mokėjimo būdą, pridėkite arba pasirinkite jį atsiskaitymo portale ir nustatykite kaip numatytąjį.';

  @override
  String get premiumManagePaymentMethods => 'Tvarkyti mokėjimo būdus';

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
  String get premiumGiftGraceEnded =>
      'Jūsų dovanos laikas baigėsi. Prenumeruokite, kad išsaugotumėte Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Jums bus apmokestinta dabar. Jūsų likęs dovanų laikas bus pridėtas po apmokėto laikotarpio, todėl niekas nebus prarasta.';

  @override
  String get premiumComparisonFeatureColumn => 'Funkcija';

  @override
  String get premiumDisclaimerRefund =>
      'Pinigų grąžinimas savitarnos būdu galimas per 3 dienas nuo apmokėjimo, kartą per 30 dienų. Grąžinus pinigus už prenumeratą, ji atšaukiama. Pirkėjai iš ES / EEE atsiskaitydami atsisako 14 dienų teisės atsisakyti sutarties, kad turinį galėtų pasiekti iš karto. Naudokite programėlės pinigų grąžinimo mygtuką, o ne mokėjimo ginčijimą banke. Ginčijimai banke gali visam laikui apriboti jūsų paskyrą. „Stripe“ saugiai tvarko mokėjimus. Mes niekada nematome viso jūsų kortelės numerio.';

  @override
  String get premiumTermsOfService => 'Paslaugų teikimo sąlygos';

  @override
  String get premiumPrivacyPolicy => 'Privatumo politika';

  @override
  String get premiumCheckoutStartFailedTitle => 'Nepavyko pradėti atsiskaitymo';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Nepavyko pradėti atsiskaitymo. Bandykite dar kartą po akimirkos.';

  @override
  String get premiumPlanUnavailable =>
      'Šis planas nepasiekiamas. Susisiekite su palaikymo komanda.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Šis planas nepasiekiamas. Susisiekite su šios instancijos administratoriais.';

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
      'Nepavyko atidaryti atsiskaitymo portalo. Bandykite dar kartą po akimirkos.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Jau esate Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      '„Visionary“ jau apima nuolatinę prieigą, todėl pasikartojanti prenumerata nereikalinga. Vis tiek galite pirkti dovanų kitiems.';

  @override
  String get premiumExistingSubscriptionTitle => 'Prenumerata jau yra';

  @override
  String get premiumExistingSubscriptionBody =>
      'Jūsų paskyrai radome galiojančią „Fluxer Plutonium“ prenumeratą. Tvarkykite ją saugiame atsiskaitymo portale, kad atnaujintumėte mokėjimo duomenis arba patikrintumėte atnaujinimo būseną. Jei ką tik sumokėjote, palaukite minutę ir iš naujo atidarykite šį puslapį.';

  @override
  String get premiumPurchasesDisabledTitle => 'Pirkimai negalimi';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'Pirkimai šiai paskyrai yra išjungti. Jei manote, kad tai klaida, susisiekite su $supportEmail.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'Pirkimai šiai paskyrai yra išjungti. Jei manote, kad tai klaida, susisiekite su šios instancijos administratoriais.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Prisijunkite prie savo paskyros, kad įsigytumėte Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Norėdami įsigyti „Fluxer Plutonium“, turite patvirtinti savo el. paštą.';

  @override
  String get premiumPerkCommunities => 'Bendruomenės';

  @override
  String get premiumPerkMessageCharacterLimit => 'Žinučių simbolių limitas';

  @override
  String get premiumPerkBookmarkedMessages => 'Pažymėtos žinutės';

  @override
  String get premiumPerkFileUploadSize => 'Įkeliamo failo dydis';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Naudoti animuotus jaustukus';

  @override
  String get premiumPerkVideoQuality => 'Vaizdo kokybė';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animuoti avatarai ir profilio reklamjuostės';

  @override
  String get premiumPerkEarlyAccess => 'Ankstyvoji prieiga prie naujų funkcijų';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Iki 4K/60 kadr./s';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly arba $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/mėn.';

  @override
  String get storePlutoniumYearSuffix => '/m.';

  @override
  String get storePlutoniumPriceOr => 'arba';

  @override
  String get storePlutoniumEmojiTitle => 'Jūsų jaustukai visur';

  @override
  String get storePlutoniumEmojiBody =>
      'Įkelkite pasirinktinius jaustukus ir lipdukus iš bet kurios bendruomenės į kiekvieną pokalbį ir bendruomenę, kurioje esate.';

  @override
  String get storePlutoniumProfileTitle => 'Profilis, kuris išsiskiria';

  @override
  String get storePlutoniumProfileBody =>
      'Gaukite animuotą avatarą ir reklamjuostę, prenumeratoriaus ženklelį, norimą keturių skaitmenų žymę po naudotojo vardo* ir atskirą profilį kiekvienai bendruomenei.';

  @override
  String get storePlutoniumFilesTitle => 'Siųskite iki 500 MB failus';

  @override
  String get storePlutoniumFilesBody =>
      'Bendrinkite viso ilgio vaizdo įrašus ir didelius failus jų nesumažinę. Nemokamos paskyros gali siųsti iki 25 MB.';

  @override
  String get storePlutoniumCompareTitle =>
      'Palyginkite nemokamą planą ir Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Ne visos šios funkcijos yra mobiliojoje programėlėje. Kai kurios pasiekiamos tik kompiuteryje.';

  @override
  String get storePlutoniumNotAvailable => 'Nepasiekiama';

  @override
  String get storePlutoniumAvailable => 'Pasiekiama';

  @override
  String get storePlutoniumCompareTag =>
      'Pasirinkite 4 skaitmenų numerį po savo naudotojo vardo*';

  @override
  String get storePlutoniumCompareProfile =>
      'Atskiras profilis kiekvienai bendruomenei';

  @override
  String get storePlutoniumCompareBadge =>
      'Prenumeratoriaus ženklelis jūsų profilyje';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Vaizdo skambučių fonai, kuriuos galite išsaugoti';

  @override
  String get storePlutoniumCompareCommunities =>
      'Bendruomenės, prie kurių galite prisijungti';

  @override
  String get storePlutoniumCompareCharacters => 'Simbolių vienoje žinutėje';

  @override
  String get storePlutoniumCompareBookmarks =>
      'Žinutės, kurias galite pažymėti';

  @override
  String get storePlutoniumCompareUpload =>
      'Didžiausias failas, kurį galite įkelti';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Medijos elementai, kuriuos galite išsaugoti vėliau';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Naudokite animuotus jaustukus žinutėse';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Naudokite pasirinktinius jaustukus ir lipdukus bet kurioje bendruomenėje';

  @override
  String get storePlutoniumCompareVideo =>
      'Vaizdo skambučių ir ekrano bendrinimo kokybė';

  @override
  String get storePlutoniumCompareAvatar =>
      'Animuotas avataras ir profilio reklamjuostė';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Ankstyvoji prieiga prie naujų funkcijų';

  @override
  String get storePlutoniumCompareThemes => 'Pasirinktinės temos programai';

  @override
  String get storePlutoniumVideoFree => 'Iki 720p esant 30 kadrų per sekundę';

  @override
  String get storePlutoniumVideoPlutonium =>
      'Iki 4K esant 60 kadrų per sekundę';

  @override
  String get storePlutoniumTagFootnote =>
      'Galite pasirinkti tik tokį žymeklį, kurio dar neturi joks kitas naudotojas su tokiu pat naudotojo vardu. Naudotojo vardai nėra jautrūs didžiosioms ir mažosioms raidėms, todėl Mina#4821 ir mina#4821 laikomi tokiais pačiais. Žymeklis #0000 yra skirtas Fluxer Visionary nariams.';

  @override
  String get storePlutoniumLearnVisionary =>
      'Sužinokite daugiau apie Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Tiesiog norite paremti atvirojo kodo Fluxer kūrimą? ';

  @override
  String get storePlutoniumDonateLink => 'Verčiau paaukoti.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Prenumeruodami finansuojate Fluxer ir atrakinate';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Pasirinktiniai jaustukai ir lipdukai bet kuriame pokalbyje';

  @override
  String get storePlutoniumHighlightProfile =>
      'Animuotas profilis, ženklelis ir pasirinktas 4 skaitmenų numeris';

  @override
  String get storePlutoniumHighlightFiles => 'Įkėlimai iki 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'Siųskite iki 4 000 simbolių ilgio žinutes';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Atskiras profilis kiekvienai bendruomenei';

  @override
  String get storePlutoniumHighlightsMore => 'Ir dar daugiau';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Automatiškai atnaujinama per Google Play, kol neatšauksite.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Automatiškai atnaujinama per App Store, kol neatšauksite.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Jau turite Fluxer Plutonium prenumeratą.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Sutaupykite $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'Pirkinys gautas. Plutonium čia atsiras, kai tik bus aktyvuotas.';

  @override
  String get storePlutoniumUnavailable =>
      'Prenumeratos programėlėje kol kas nepasiekiamos šiame įrenginyje.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary jau apima nuolatinę prieigą, todėl pasikartojanti prenumerata nereikalinga.';

  @override
  String get userSettingsNavPrivacyDashboard =>
      'Privatumo informacijos suvestinė';

  @override
  String get userSettingsNavAuthorizedApps => 'Įgaliotosios programos';

  @override
  String get userSettingsNavBlockedUsers => 'Užblokuoti naudotojai';

  @override
  String get userSettingsNavLinkedDevices => 'Susieti įrenginiai';

  @override
  String get userSettingsNavConnections => 'Ryšiai';

  @override
  String get userSettingsNavLookAndFeel => 'Išvaizda';

  @override
  String get userSettingsNavAccessibility => 'Pritaikymas neįgaliesiems';

  @override
  String get userSettingsNavChat => 'Pokalbis';

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
      'Siunčia jūsų garsą be pakeitimų. Geriausia, jei naudojate išorinę garso programinę įrangą.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Pasirinktinis';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Reguliuokite kiekvieną nustatymą patys: triukšmo slopinimą, aido slopinimą ir stiprinimą.';

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
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Veidrodinis kameros vaizdas';

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
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Šis serveris šiuo metu leidžia bendrinti ekraną iki 720p raiška ir 30 kadrų per sekundę.';

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
    return 'Gaukite pranešimus, kai gaunate žinučių. Gali reikėti leisti $productName siųsti pranešimus įrenginio nustatymuose. Norėdami valdyti pranešimus pagal kanalą ar bendruomenę, atidarykite pranešimų nustatymus bendruomenės meniu.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Įjungti darbalaukio pranešimus';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Naudoja OS pranešimų centrą. Norėdami valdyti pranešimus pagal kanalą / bendruomenę, dešiniuoju pelės mygtuku spustelėkite bendruomenės piktogramą ir atidarykite pranešimų nustatymus.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Neaktyvumo laikas iki pranešimų siuntimo';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '„$productName“ nesiunčia tiesioginių pranešimų į jūsų mobiliuosius įrenginius, kai esate prie kompiuterio. Nustatykite, po kiek laiko neaktyvumo darbalaukyje turėtų būti pradėti siųsti pranešimai.';
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
  String get notificationsMentionNoPreferenceName => 'Nesvarbu';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Gerbti siuntėjo ketinimus, be įspėjimo, kai jis įjungia @ paminėjimą';

  @override
  String get notificationsMentionPreferMentionName => 'Geriau su @paminėjimu';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Pagal numatymą atsakymai jus @pamini, o siuntėjas įspėjamas, jei jis tai išjungia';

  @override
  String get notificationsMentionPreferNoMentionName => 'Geriau be @paminėjimo';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Pagal numatymą atsakymai praleidžia @paminėjimą, o siuntėjas įspėjamas, jei jis tai įjungia';

  @override
  String get notificationsTtsSectionTitle => 'Teksto į kalbą pranešimai';

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
      'Automatinis žinučių įgarsinimas';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Konvertuoja gaunamą turinį į kalbą, nepriklausomai nuo to, ar jis gautas iš /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Visi kanalai';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Skaityti balsu kiekvieną gaunamą žinutę, nesvarbu, kuris kanalas atidarytas.';

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
      'Nustato visų garso efektų lygį. Atskirų garsų nustatymai šio nepaiso.';

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
  String get notificationsPreviewSound => 'Perklausyti garsą';

  @override
  String get notificationsPerSoundVolumeTitle => 'Garsumo lygis';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Nustatykite pasirinktinius atskirų garsų lygius. Garsams be individualių nustatymų bus taikomas pagrindinis garso lygis.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktyvūs pasirinktiniai garsumo pakeitimai: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Pagal pagrindinį • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Grąžinti „$label“ prie pagrindinio garsumo';
  }

  @override
  String get notificationsResetAllOverrides => 'Atkurti visus pakeitimus';

  @override
  String notificationsMuteSound(String label) {
    return 'Išjungti garsą „$label“';
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
      'Dabartinio kanalo žinučių pranešimai';

  @override
  String get notificationsSoundMute => 'Mikrofono nutildymas';

  @override
  String get notificationsSoundUnmute => 'Mikrofono įjungimas';

  @override
  String get notificationsSoundDeaf => 'Garso išjungimas';

  @override
  String get notificationsSoundUndeaf => 'Garso įjungimas';

  @override
  String get notificationsSoundUserJoin => 'Naudotojas prisijungia prie kanalo';

  @override
  String get notificationsSoundUserLeave => 'Naudotojas palieka kanalą';

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
  String get notificationsSoundScreenShareStop => 'Ekrano bendrinimo pabaiga';

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
  String get notificationsPushRelaySectionTitle =>
      'Tiesioginių pranešimų perdavimas';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider pristato tiesioginius pranešimus tik per savo paslaugą, todėl šio įrenginio pranešimai keliauja per Fluxer perdavimą.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'Naudoti Fluxer pranešimų perdavimą';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Išjungus tai, šio įrenginio pranešimų registracija pašalinama ir įrenginys nebegauna tiesioginių pranešimų.';

  @override
  String get pushRelayConsentTitle => 'Tiesioginių pranešimų perdavimas';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider pristato tiesioginius pranešimus tik per savo paslaugą, todėl šio įrenginio pranešimai keliauja per Fluxer perdavimą.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Sutik su ';

  @override
  String get pushRelayConsentNoticeLink =>
      'pranešimų perdavimo privatumo pranešimu';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ', kad įjungtum tiesioginius pranešimus šiame įrenginyje. Sutikti reikia tik kartą kiekviename įrenginyje.';

  @override
  String get pushRelayConsentAgree => 'Sutinku ir tęsti';

  @override
  String get pushRelayConsentDecline => 'Ne dabar';

  @override
  String get userSettingsNavLanguageAndTime => 'Kalba ir laikas';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Sąsajos kalba';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Pasirinkite kalbą, naudojamą visoje programėlėje';

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
    return 'Programos kalbos laiko formatas: $format';
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
  String get userSettingsNavAppIcon => 'Programėlės piktograma';

  @override
  String get appIconSectionTitle => 'Programėlės piktograma';

  @override
  String get appIconSectionDescription =>
      'Pasirinkite, kuri piktograma bus rodoma pagrindiniame ekrane.';

  @override
  String get appIconOptionDefault => 'Numatytasis';

  @override
  String get appIconOptionStarfield => 'Žvaigždžių laukas';

  @override
  String get appIconOptionSweden => 'Švedija';

  @override
  String get appIconUnsupported =>
      'Programėlės piktogramos keitimas šiame įrenginyje negalimas.';

  @override
  String get userSettingsNavAdvanced => 'Išplėstiniai';

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
      'Įjungti vaizdo įrašų peržiūros miniatiūras';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatiūra arba tiesioginis kadras slenkant vaizdo įrašą';

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
      'Sparčiųjų klavišų užuominos patarimuose';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Įjungti mėgstamiausius';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Rodyti mėgstamiausius elementus visoje programoje';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Prisijungimo prie balso kanalo veiksena';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Patvirtinimas arba dvigubas spustelėjimas prisijungiant prie bendruomenės balso kanalų';

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
      'Įrašyti mėgstamiausius GIF kaip išsaugotą mediją';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Pasirinkite, kaip saugomi žvaigždute pažymėti mėgstamiausi GIF';

  @override
  String get advancedSettingMediaButtonsLabel => 'Medijos mygtukai';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Tinkinti, kurie mygtukai ir indikatoriai rodomi medijos prieduose ir įterptuosiuose elementuose';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Įkelti priedus prieš siunčiant';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Priedai įkeliami iš karto, kai tik pridedami į žinutės lauką';

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
  String get advancedSettingSearchEnginesLabel => 'Paieškos sistemos';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Konfigūruoti paieškos sistemas, naudojamas pasirinktam tekstui';

  @override
  String get advancedSettingTranslatorsLabel => 'Vertėjai';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Konfigūruoti vertimo paslaugas, naudojamas pasirinktam tekstui';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Atvirkštinė vaizdų paieška';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Atvirkštinės vaizdų paieškos teikėjai';

  @override
  String get advancedSettingMessageActionBarLabel => 'Žinutės veiksmų juosta';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Tinkinti veiksmų juostą, kuri rodoma užvedus pelę ant žinučių';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Išraiškų automatinis pildymas';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Pasirinkite, kas rodoma įvedant dvitaškį žinutės įvesties lauke';

  @override
  String get advancedSettingInputButtonsLabel => 'Žinutės įvesties mygtukai';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Pasirinkite, kurie mygtukai rodomi žinutės įvesties lauke';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Slinkti į apačią išsiunčiant žinutę';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Pasirinkite, kaip pokalbis slenka išsiuntus žinutę';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Praleisti patvirtinimą „Pažymėti visus kaip perskaitytus“';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Pažymėti visus neskaitytus gautųjų kanalus kaip perskaitytus iškart, neklausiant patvirtinimo';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Slėpti nutildytus kanalus pagal numatytuosius nustatymus';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Slėpti nutildytus kanalus bendruomenių šoninėse juostose';

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
      'Rodyti mėgstamiausių mygtuką';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Rodyti mygtuką „Slėpti įterptąjį turinį“';

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
      'Įjungti išplėtimą laikant „Shift“';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Rodyti numatytuosius jaustukus išraiškų automatiniame pildyme';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Rodyti pasirinktinius jaustukus išraiškų automatiniame pildyme';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Rodyti lipdukus išraiškų automatiniame pildyme';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Rodyti išsaugotą mediją išraiškų automatiniame pildyme';

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
      'Klausti prijungus naują garso įrenginį';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Ryšio garsumo valdikliai';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Rodyti atskirų įrenginių dalyvių garsumo slankiklius balso meniu';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Ekrano bendrinimo peržiūros elgsena';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Peržiūros, iššokančio lango ir srauto miniatiūrų veikimas';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Ekrano bendrinimo kodekas';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Vaizdo kodekas ekrano bendrinimui';

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
      'Įjunkite arba išjunkite integruotas paieškos sistemas. Įjungtos sistemos rodomos žinutės kontekstiniame meniu, kai pažymimas tekstas.';

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
      'Įjunkite bent vieną toliau nurodytą paieškos variklį.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Pašalinti paieškos sistemą';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Numatytasis vertėjas';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Pasirinkite, kuris vertėjas bus naudojamas pagal numatytuosius nustatymus verčiant pasirinktą tekstą.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Integruoti vertėjai';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Įjunkite arba išjunkite integruotus vertėjus. Įjungti vertėjai rodomi žinutės kontekstiniame meniu, kai pažymimas tekstas.';

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
      'Įjunkite bent vieną toliau nurodytą vertėją.';

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
      'Įjunkite bent vieną toliau nurodytą atvirkštinės vaizdų paieškos teikėją.';

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
      'Mano paieškos sistema';

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
  String get userSettingsLogOutConfirmTitle => 'Atsijungti?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Prisijungti galėsite bet kada.';

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
  String get quickSwitcherNoMatchesFound => 'Nieko nerasta';

  @override
  String get quickSwitcherEmptyHint =>
      'Pabandykite kitą pavadinimą arba naudokite @ / # / ! / * priešdėlius rezultatams filtruoti.';

  @override
  String get quickSwitcherSectionPeople => 'Žmonės';

  @override
  String get quickSwitcherSectionGroupMessages => 'Grupės žinutės';

  @override
  String get quickSwitcherSectionTextChannels => 'Tekstiniai kanalai';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

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
  String get quickSwitcherUserSettingsLabel => 'Naudotojo nustatymai';

  @override
  String get quickSwitcherNotificationsLabel => 'Pranešimai';

  @override
  String get quickSwitcherBookmarksLabel => 'Žymės';

  @override
  String get savedMessagesEmptyTitle => 'Nėra žymių';

  @override
  String get savedMessagesEmptyBody =>
      'Pažymėkite žinutes, kad išsaugotumėte jas vėlesniam laikui.';

  @override
  String get savedMessagesEndBody => 'Čia daugiau nieko nėra.';

  @override
  String get savedMessagesRemoveTooltip => 'Pašalinti žymę';

  @override
  String get savedMessagesAddedToast => 'Pridėta prie žymių';

  @override
  String get savedMessagesRemovedToast => 'Pašalinta iš žymių';

  @override
  String get quickSwitcherMentionsLabel => 'Paminėjimai';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Dar nėra draugų';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Pridėkite draugą, kad pradėtumėte.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nėra draugų, atitinkančių paiešką';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Pabandykite kitą vardą.';

  @override
  String get quickSwitcherSearchAliasUser => 'Naudotojas';

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
  String get quickSwitcherSearchAliasSaved => 'Išsaugota';

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
  String get uiPlay => 'Leisti';

  @override
  String get uiPause => 'Pristabdyti';

  @override
  String get uiDownload => 'Atsisiųsti';

  @override
  String get uiMoreActions => 'Daugiau veiksmų';

  @override
  String get uiUnsavedChanges => 'Neišsaugoti pakeitimai';

  @override
  String get uiReset => 'Atkurti';

  @override
  String get uiOpenColorPicker => 'Atidaryti spalvų parinkiklį';

  @override
  String get uiSelectPlaceholder => 'Pasirinkti';

  @override
  String get uiSearchPlaceholder => 'Ieškoti';

  @override
  String get uiNoOptionsFound => 'Nėra parinkčių';

  @override
  String get uiDismissNotification => 'Atmesti pranešimą';

  @override
  String get uiColorPickerTitle => 'Spalvų parinkiklis';

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
  String get instanceUrlHelper =>
      'Naudokite fluxer.app oficialiam egzemplioriui arba tikslų savarankiškai priglobto egzemplioriaus URL.';

  @override
  String get resetToDefaultInstance => 'Atstatyti į Fluxer';

  @override
  String get instanceConnect => 'Prisijungti';

  @override
  String get instanceConnecting => 'Jungiamasi…';

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
  String get changeInstance => 'Keisti';

  @override
  String get instanceConnectionRequired =>
      'Norint prisijungti, reikia prisijungti prie serverio';

  @override
  String get comingSoon => 'Netrukus';

  @override
  String get guildNavbarDirectMessages => 'Tiesioginės žinutės';

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
  String get discoveryAllCategories => 'Visi';

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
  String get discoveryCategoryContentCreator => 'Turinio kūrėjas';

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
  String get discoveryNoDescription => 'Aprašo nėra.';

  @override
  String get discoveryCommunities => 'Bendruomenės';

  @override
  String get discoveryApps => 'Programos';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Nepavyko prisijungti prie šios bendruomenės';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Kažkas nepavyko. Bandykite dar kartą po akimirkos.';

  @override
  String get discoveryJoinErrorFullTitle => 'Ši bendruomenė pilna';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Ši bendruomenė pasiekė narių limitą, todėl dabar negalite prisijungti.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Pasiekėte bendruomenių limitą';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Pasiekėte didžiausią bendruomenių skaičių. Išeikite iš vienos ir bandykite dar kartą.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Negalite prisijungti prie šios bendruomenės';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Esate užblokuotas šioje bendruomenėje.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Ši bendruomenė nebepasiekiama';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Gali būti, kad ji pasitraukė iš Atradimo arba išjungė naujų narių prisijungimą. Atnaujinkite puslapį ir jos daugiau nebematysite.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Per greitai';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Palaukite ir bandykite dar kartą.';

  @override
  String get guildNavbarAddCommunity => 'Pridėti bendruomenę';

  @override
  String get guildNavbarHelp => 'Pagalba';

  @override
  String get scrollIndicatorNew => 'NAUJA';

  @override
  String get scrollIndicatorNewMessage => 'NAUJAS PRANEŠIMAS';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Sutraukti aplanką „$folderName“';
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
  String get authCheckStillWorking => 'Vis dar dirbama…';

  @override
  String get authVerificationFailed =>
      'Nepavyko užbaigti patvirtinimo. Bandykite dar kartą.';

  @override
  String get chatLoadingMessages => 'Įkeliamos žinutės';

  @override
  String get friendsMessageFriend => 'Žinutė';

  @override
  String get friendsFriendActions => 'Veiksmai su draugu';

  @override
  String get friendsAcceptRequest => 'Priimti draugystės užklausą';

  @override
  String get friendsDeclineRequest => 'Atmesti draugystės prašymą';

  @override
  String get friendsCancelRequest => 'Atšaukti draugystės užklausą';

  @override
  String get friendsOpenInbox => 'Gauta';

  @override
  String get profileRemoveFriend => 'Pašalinti draugą';

  @override
  String get profileUnblockUser => 'Atblokuoti naudotoją';

  @override
  String get profileAcceptFriendRequest => 'Priimti draugystės užklausą';

  @override
  String get profileCancelFriendRequest => 'Atšaukti draugystės užklausą';

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
      'Įjungti tiesioginius pranešimus mobiliajame įrenginyje';

  @override
  String get guildBulkDisableMobilePush =>
      'Išjungti mobiliųjų įrenginių pranešimus';

  @override
  String get guildBulkAllowDirectMessages => 'Leisti tiesiogines žinutes';

  @override
  String get guildBulkBlockDirectMessages => 'Blokuoti tiesiogines žinutes';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Leisti botų tiesiogines žinutes';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Blokuoti botų tiesiogines žinutes';

  @override
  String get guildNavbarGroupDm => 'Grupės DM';

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
  String get guildNavbarNameLabel => 'Pavadinimas';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Kanalo tipo pasirinkimas';

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
  String get guildNavbarNoFriendsYet => 'Dar nėra draugų';

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
      'Ši kvietimo nuoroda niekada nenustos galioti.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Jūsų kvietimo nuoroda baigsis po $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Redaguoti kvietimo nuorodą';

  @override
  String get guildNavbarInviteLinkSettings => 'Kvietimo nuorodos nustatymai';

  @override
  String get guildNavbarExpireAfter => 'Nustoja galioti po';

  @override
  String get guildNavbarMaxUses => 'Didžiausias naudojimo skaičius';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Suteikti laikino narystės';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Nariai bus pašalinti, kai išeis iš prisijungimo, nebent bus priskirtas vaidmuo';

  @override
  String get guildNavbarCreateNewLink => 'Kurti naują nuorodą';

  @override
  String get guildNavbarSent => 'Išsiųsta';

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
      'Ištrinti savo žinutes šioje bendruomenėje?';

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
  String get guildNavbarRemoveOverride => 'Pašalinti perrašymą';

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
      'Kvietimai šioje bendruomenėje šiuo metu pristabdyti';

  @override
  String get guildNavbarDurationNever => 'niekada';

  @override
  String get guildNavbarDuration30Minutes => '30 minučių';

  @override
  String get guildNavbarDuration1Hour => '1 valanda';

  @override
  String get guildNavbarDuration6Hours => '6 valandos';

  @override
  String get guildNavbarDuration12Hours => '12 valandų';

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
  String get guildNavbarNoLimit => 'Be apribojimų';

  @override
  String get guildNavbarOneUse => '1 naudojimas';

  @override
  String guildNavbarUses(int count) {
    return '$count panaudojimų';
  }

  @override
  String get guildMenuMarkAsRead => 'Pažymėti kaip perskaitytą';

  @override
  String get guildPeekMoreOptions => 'Daugiau parinkčių';

  @override
  String get guildMenuInviteMembers => 'Kviesti narius';

  @override
  String get guildMenuCommunitySettings => 'Bendruomenės nustatymai';

  @override
  String get guildMenuEditCommunityProfile => 'Redaguoti bendruomenės profilį';

  @override
  String get guildMenuUnmuteCommunity => 'Įjungti bendruomenės garsą';

  @override
  String get guildMenuMuteCommunity => 'Nutildyti bendruomenę';

  @override
  String get guildMenuHideMutedChannels => 'Slėpti nutildytus kanalus';

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
  String get guildMenuSettingsDiscovery => 'Atradimas';

  @override
  String get guildMenuSettingsMembers => 'Nariai';

  @override
  String get guildMenuSettingsInviteLinks => 'Kvietimai';

  @override
  String get guildMenuSettingsBans => 'Užblokuoti nariai';

  @override
  String get guildMenuSettingsChannels => 'Kanalai';

  @override
  String get guildSettingsNoPermission =>
      'Neturite leidimo peržiūrėti šio nustatymų skirtuko.';

  @override
  String get guildSettingsOverviewIconTitle => 'Piktograma';

  @override
  String get guildSettingsOverviewBannerTitle => 'Reklamjuostė';

  @override
  String get guildSettingsOverviewNameTitle => 'Pavadinimas';

  @override
  String get guildSettingsOverviewNameHint => 'Mano nuostabi bendruomenė';

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
  String get guildSettingsRolesRoleColor => 'Vaidmens spalva';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Įveskite spalvą (šešioliktainis, rgb(), hsl() arba pavadinimas) arba naudokite parinkiklį.';

  @override
  String get guildSettingsRolesShowSeparately => 'Rodyti šį vaidmenį atskirai';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Narių sąraše rodo narius, turinčius šį vaidmenį, atskirame skyriuje.';

  @override
  String get guildSettingsRolesAllowMentions => 'Leisti paminėti šį vaidmenį';

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
  String get guildSettingsRolesSingleColumn => 'Vienas stulpelis';

  @override
  String get guildSettingsRolesTwoColumns => 'Du stulpeliai';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Leidimų nerasta';

  @override
  String get guildSettingsRolesHoistOrder => 'Iškėlimo tvarka';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Atkurti numatytuosius';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Vilkite vaidmenis, kad pakeistumėte jų rodymo tvarką narių sąraše.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Nėra iškeltų vaidmenų. Vaidmens nustatymuose įjunkite „Rodyti šį vaidmenį atskirai“, kad jis būtų rodomas čia.';

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
      'Iškėlimo tvarka atkurta į numatytąją';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'Reikalingas vaidmens pavadinimas';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Prieš išsaugodami suteikite vaidmeniui pavadinimą.';

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
  String get permissionAdministrator => 'Administratorius';

  @override
  String get permissionAdministratorDescription =>
      'Suteikia visus leidimus ir apeina kanalo apribojimus. Labai jautrus leidimas.';

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
      'Kurti, redaguoti arba ištrinti vaidmenis, esančius žemiau jūsų aukščiausio vaidmens. Taip pat leidžia redaguoti kanalo leidimų perrašymus.';

  @override
  String get permissionManageChannels => 'Tvarkyti kanalus';

  @override
  String get permissionManageChannel => 'Tvarkyti kanalą';

  @override
  String get permissionManageChannelDescription =>
      'Pervadinti ir redaguoti šio kanalo nustatymus.';

  @override
  String get permissionManagePermissions => 'Tvarkyti leidimus';

  @override
  String get permissionManagePermissionsDescription =>
      'Redaguoti šio kanalo vaidmenų ir narių perrašymus.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Kurti, redaguoti arba ištrinti šio kanalo webhookus.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Peržiūrėti šio kanalo narių sąrašą.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Tvarkykite šio kanalo kvietimo nuorodas.';

  @override
  String get permissionOverwriteDeny => 'Neleisti';

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
  String get permissionKickMembers => 'Išmesti narius';

  @override
  String get permissionBanMembers => 'Užblokuoti narius';

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
  String get permissionManageWebhooks => 'Tvarkyti webhookus';

  @override
  String get permissionManageWebhooksDescription =>
      'Kurti, redaguoti arba ištrinti webhookus.';

  @override
  String get permissionSendMessages => 'Siųsti žinutes';

  @override
  String get permissionSendTtsMessages => 'Siųsti TTS žinutes';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Siųsti tekstinius pranešimus balsu.';

  @override
  String get permissionManageMessages => 'Tvarkyti žinutes';

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
      'Nepaisyti žinučių siuntimo dažnio apribojimų kanale.';

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
      'Be šio leidimo privaloma naudoti kalbėjimą paspaudus.';

  @override
  String get permissionPrioritySpeaker => 'Prioritetinis kalbėtojas';

  @override
  String get permissionMuteMembers => 'Nutildyti narius';

  @override
  String get permissionDeafenMembers => 'Išjungti narių garsą';

  @override
  String get permissionMoveMembers => 'Perkelti narius';

  @override
  String get permissionMoveMembersDescription =>
      'Vilkite narius tarp kanalų, į kuriuos jie gali patekti.';

  @override
  String get permissionSetVoiceRegion => 'Nustatyti balso regioną';

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
  String get guildSettingsEmojiEmpty => 'Dar nėra pasirinktinių jaustukų.';

  @override
  String get guildSettingsStickersEmpty => 'Dar nėra pasirinktinių lipdukų.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Narių patvirtinimas';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Pasirinkite, ką nariai turi turėti, kad galėtų rašyti žinutes ar siųsti tiesiogines žinutes bendruomenės nariams.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Nariai, turintys vaidmenis, gali apeiti šiuos patikrinimus. Viešosioms erdvėms rekomenduojame įjungti patvirtinimą.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Bendruomenės, įtrauktos į „Discovery“, reikalauja bent patvirtinto el. pašto. Negalima pasirinkti „None“, kai „Discovery“ yra įjungta.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Brandus turinys ir įspėjimai apie turinį';

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
      'Patvirtinimas nereikalingas.';

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
      'Reikalingi visi vidutinio lygio reikalavimai ir narystė bendruomenėje bent 10 minučių.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Stebėkite moderatorių veiksmus visoje bendruomenėje.';

  @override
  String get guildSettingsAuditLogEmpty => 'Kol kas nėra žurnalų';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Čia bus rodomi moderavimo veiksmai ir bendruomenės pakeitimai.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Visi naudotojai';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Visi veiksmai';

  @override
  String get guildSettingsAuditLogNoReason => 'Priežastis nenurodyta.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Nežinomas naudotojas';

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
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

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
  String get auditLogActionMemberKick => 'Narys išmestas';

  @override
  String get auditLogActionMemberPrune => 'Nariai pašalinti';

  @override
  String get auditLogActionMemberBanAdd => 'Narys užblokuotas';

  @override
  String get auditLogActionMemberBanRemove => 'Nario užblokavimas panaikintas';

  @override
  String get auditLogActionMemberUpdate => 'Narys atnaujintas';

  @override
  String get auditLogActionMemberRoleUpdate => 'Nario vaidmenys atnaujinti';

  @override
  String get auditLogActionMemberMove => 'Narys perkeltas';

  @override
  String get auditLogActionMemberDisconnect => 'Narys atsijungė';

  @override
  String get auditLogActionBotAdd => 'Botas pridėtas';

  @override
  String get auditLogActionRoleCreate => 'Sukurtas vaidmuo';

  @override
  String get auditLogActionRoleUpdate => 'Vaidmuo atnaujintas';

  @override
  String get auditLogActionRoleDelete => 'Vaidmuo ištrintas';

  @override
  String get auditLogActionInviteCreate => 'Kvietimas sukurtas';

  @override
  String get auditLogActionInviteUpdate => 'Kvietimas atnaujintas';

  @override
  String get auditLogActionInviteDelete => 'Kvietimas ištrintas';

  @override
  String get auditLogActionWebhookCreate => 'Webhookas sukurtas';

  @override
  String get auditLogActionWebhookUpdate => 'Webhookas atnaujintas';

  @override
  String get auditLogActionWebhookDelete => 'Webhookas ištrintas';

  @override
  String get auditLogActionEmojiCreate => 'Jaustukas sukurtas';

  @override
  String get auditLogActionEmojiUpdate => 'Jaustukas atnaujintas';

  @override
  String get auditLogActionEmojiDelete => 'Jaustukas ištrintas';

  @override
  String get auditLogActionStickerCreate => 'Lipdukas sukurtas';

  @override
  String get auditLogActionStickerUpdate => 'Lipdukas atnaujintas';

  @override
  String get auditLogActionStickerDelete => 'Lipdukas ištrintas';

  @override
  String get auditLogActionMessageDelete => 'Žinutė ištrinta';

  @override
  String get auditLogActionMessageBulkDelete => 'Žinutės ištrintos';

  @override
  String get auditLogActionMessagePin => 'Žinutė prisegta';

  @override
  String get auditLogActionMessageUnpin => 'Žinutė atsegta';

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
  String get guildSettingsWebhooksDescription =>
      'Peržiūrėkite ir tvarkykite visus savo bendruomenėje sukonfigūruotus webhookus.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nėra webhookų';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Šioje bendruomenėje dar nėra jokių „webhooks“. Eikite į $channelSettingsPath, kad sukurtumėte vieną.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Norint peržiūrėti ir redaguoti šios bendruomenės webhookus, jums reikia „$permission“ leidimo.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'Nepavyko įkelti webhookų';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Įkeliant webhookus įvyko klaida. Bandykite dar kartą.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhookai atnaujinti';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Nepavyko atnaujinti webhookų';

  @override
  String get guildSettingsUnknownChannel => 'Nežinomas kanalas';

  @override
  String get guildSettingsCopiedUrl => 'URL nukopijuotas į iškarpinę';

  @override
  String get guildSettingsDiscoveryDescription =>
      'Įtraukite savo bendruomenę į Atradimą, kad kiti galėtų ją rasti ir prie jos prisijungti.';

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
      'Jūsų bendruomenė įtraukta į Atradimą. Galite atnaujinti savo įrašo informaciją žemiau arba atšaukti, kad jį pašalintumėte.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Jūsų paraiška laukia peržiūros. Vis dar galite atnaujinti savo įrašo informaciją arba atšaukti paraišką.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorija';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Pasirinkite kategoriją, kuri geriausiai apibūdina jūsų bendruomenę. Ją galite pakeisti bet kada.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Pagrindinė kalba';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Kalba, kuria kalba didžioji jūsų bendruomenės dalis. Naudojama Atradimo rezultatams filtruoti.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Aprašymas';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Apibūdinkite, kam skirta jūsų bendruomenė';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Aprašymas yra privalomas.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Aprašas turi būti bent $minLength simbolių.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Aprašas negali būti ilgesnis nei $maxLength simbolių.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Pasirinktinės žymos';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Iki $maxTags žymų padeda žmonėms rasti jūsų bendruomenę. Jos rodomos „Discovery“ paieškoje.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Pridėkite žymą ir paspauskite Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Pridėti';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Pašalinti žymą „$tag“';
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
  String get guildSettingsDiscoveryWithdraw => 'Atsiimti';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Atradimo paraiška išsiųsta';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Atradimo įrašas atnaujintas';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Atradimo paraiška atšaukta';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Nepavyko atšaukti paraiškos';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Bandyti dar kartą po akimirkos.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Ieškoti pagal naudotojo vardą arba ID';

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
  String get guildSettingsMembersSortNewest => 'Pirmiausia naujausi';

  @override
  String get guildMembersSortOldest => 'Pirmiausia seniausi';

  @override
  String get guildMembersColumnName => 'Pavadinimas';

  @override
  String get guildMembersColumnMemberSince => 'Narys nuo';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Prisijungė prie „$productName“';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Prisijungimo būdas';

  @override
  String get guildMembersColumnRoles => 'Vaidmenys';

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
  String get guildMembersFilterPast1Hour => 'Per pastarąją valandą';

  @override
  String get guildMembersFilterPast24Hours => 'Paskutinės 24 valandos';

  @override
  String get guildMembersFilterPast7Days => 'Paskutinės 7 dienos';

  @override
  String get guildMembersFilterPast2Weeks => 'Per pastarąsias 2 savaites';

  @override
  String get guildMembersFilterPast3Weeks => 'Paskutinės 3 savaitės';

  @override
  String get guildMembersFilterPast4Weeks => 'Paskutinės 4 savaitės';

  @override
  String get guildMembersFilterPast3Months => 'Paskutiniai 3 mėnesiai';

  @override
  String get guildMembersFilterCustomRange => 'Pasirinktinis laikotarpis...';

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
  String get guildMembersJoinSourceVanityUrl => 'Pasirinktinis URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Boto kvietimas';

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
  String get guildMembersChannelListLabel => 'Nariai';

  @override
  String get guildSettingsInvitesTitle => 'Kvietimai';

  @override
  String get guildSettingsInvitesDescription =>
      'Peržiūrėkite visus šios bendruomenės kvietimus. Norėdami sukurti naują kvietimą, eikite į kanalą ir naudokite kvietimo mygtuką.';

  @override
  String get guildSettingsInvitesEmpty => 'Nėra kvietimo nuorodų';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Ši bendruomenė dar neturi jokių kvietimo nuorodų. Eikite į kanalą ir sukurkite kvietimą, kad pakviestumėte žmones.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'Nepavyko įkelti kvietimų';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Įkeliant kvietimus įvyko klaida. Bandykite dar kartą.';

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
      'Įjungti kvietimus? Naudotojai vėl galės prisijungti prie šios bendruomenės naudodami kvietimo nuorodas.';

  @override
  String get guildSettingsInvitesPause => 'Pristabdyti';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Kvietimai šiai bendruomenei pristabdyti.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Kvietimai pristabdyti, nes „$productName“ aptiko galimą reidą. Nauji naudotojai šiuo metu negali prisijungti.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Pakvietė:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanalas:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kodas:';

  @override
  String get guildSettingsInvitesLabelUses => 'Naudojimų skaičius:';

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
  String get guildSettingsBansDescription =>
      'Peržiūrėkite ir tvarkykite užblokuotus narius.';

  @override
  String get guildSettingsBansSearchHint => 'Ieškoti užblokuotų narių';

  @override
  String get guildSettingsBansEmpty => 'Nėra užblokuotų vartotojų.';

  @override
  String get guildSettingsBanExpiresLabel => 'Baigiasi';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nerasta užblokuotų narių, atitinkančių jūsų paiešką.';

  @override
  String get guildSettingsBanDetailsTitle => 'Užblokavimo informacija';

  @override
  String get guildSettingsBanViewDetails => 'Peržiūrėti išsamią informaciją';

  @override
  String get guildSettingsBannedOn => 'Užblokuota';

  @override
  String get guildSettingsBannedBy => 'Užblokavo';

  @override
  String get guildSettingsRevokeBanTitle => 'Panaikinti užblokavimą';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Ar tikrai norite atšaukti $displayName baną? Jis galės vėl prisijungti prie bendruomenės.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Atšauktas $displayName banas';
  }

  @override
  String get guildSettingsRevokeBanError =>
      'Nepavyko atšaukti baną. Pabandykite dar kartą.';

  @override
  String get guildSettingsCommunitySettings => 'Bendruomenės nustatymai';

  @override
  String get guildSettingsDeleteCommunity => 'Ištrinti bendruomenę';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Ar tikrai norite ištrinti šią bendruomenę? Šio veiksmo anuliuoti negalima. Visi kanalai, žinutės ir nustatymai bus visam laikui ištrinti.';

  @override
  String get guildSettingsCommunityDeleted => 'Bendruomenė ištrinta';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Nepavyko ištrinti šios bendruomenės';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

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
  String get guildSettingsOverviewSystemTitle => 'Sistema ir pasveikinimas';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Pasirinkite sistemos ir sveikinimo pranešimų paskirties vietą';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Numatytieji pranešimai';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Bendruomenėms, turinčioms daugiau nei 250 narių, priverstinai nustatomas „tik paminėjimai“ režimas. Jūsų originalus nustatymas išsaugomas ir bus atkurtas, jei bendruomenės narių skaičius nukris žemiau 250.';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Leisti lanksčius teksto kanalo pavadinimus';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Slėpti bendruomenės savininko karūną';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Atskirta reklamjuostė';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Reklamjuostė rodoma atskiroje skiltyje po bendruomenės antrašte.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Įkelti piktogramą';

  @override
  String get guildSettingsOverviewRemoveImage => 'Pašalinti';

  @override
  String get guildSettingsOverviewSplashTitle => 'Kvietimo fonas';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Pokalbio įterpties fonas';

  @override
  String get guildSettingsOverviewUploadBackground => 'Įkelti foną';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Nėra bendruomenės reklamjuostės';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Nėra kvietimo fono';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Peržiūra';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Peržiūrėkite, kaip jūsų kvietimas atrodo lankytojams.';

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
  String get guildSettingsSplashCardAlignment => 'Kortelės lygiavimas';

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
      'Atidaryti žinučių istorijos slenkstį';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Žinučių istorijos slenkstis';

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
      'Žinučių istorijos slenkstis atnaujintas';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Teksto kanalų pavadinimuose leisti didžiąsias raides ir tarpus. Išjungus pavadinimai bus tik mažosiomis raidėmis su brūkšneliais ir apatiniais brūkšniais.';

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
  String get guildSettingsAfkTimeout => 'AFK skirtasis laikas';

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
  String get guildSettingsHideJoinMessages => 'Slėpti prisijungimo pranešimus';

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
  String get guildSettingsModerationContentFilterTitle => 'Turinio filtravimas';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automatiškai tikrinti žinutes dėl nepadoraus turinio kanaluose, kurie nepažymėti kaip skirti brandžiam turiniui.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Bendruomenėms, įtrauktoms į „Discovery“, privaloma tikrinti visus narius. Šio nustatymo negalima pakeisti, kai įjungtas „Discovery“.';

  @override
  String get guildSettingsContentFilterOff => 'Išjungta';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Leisti bendruomenei moderuoti save';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtruoti narius be vaidmenų';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Rekomenduojama daugumai bendruomenių';

  @override
  String get guildSettingsContentFilterAll => 'Filtruoti visus';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Didžiausia apsauga šeimai tinkamoms erdvėms';

  @override
  String get guildSettingsContentWarningToggle => 'Rodyti įspėjimą apie turinį';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Įjungia sutikimo raginimą prieš įeinant į bet kurį kanalą.';

  @override
  String get guildSettingsContentWarningText =>
      'Pasirinktinis įspėjimo tekstas';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Čia yra jautraus turinio.';

  @override
  String get guildSettingsModeration2faTitle => '2FA reikalavimas';

  @override
  String get guildSettingsModeration2faDescription =>
      'Reikalauti dviejų veiksnių autentifikavimo iš moderatorių prieš jiems leidžiant blokuoti, šalinti, laikinai stabdyti ar naikinti žinutes.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Reikalauti 2FA moderavimo veiksmams';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Norėdami pakeisti šį nustatymą, įjunkite dviejų veiksnių autentifikavimą savo paskyroje';

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
  String get guildSettingsEmojiSlotsFull =>
      'Pasiekėte didžiausią jaustukų skaičių. Ištrinkite kai kuriuos esamus jaustukus, kad atlaisvintumėte vietos.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Jaustukų pavadinimai turi būti bent 2 simbolių ilgio, juose galima naudoti raides, skaičius ir pabraukimo brūkšnius. Jaustukai turi būti mažesni nei $maxSize. Statiniai vaizdai automatiškai sumažinami iki 128x128 pikselių ir suspaudžiami. Animuoti jaustukai ir SVG failai jau turi atitikti šią ribą.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Kai kurių jaustukų nepavyko pridėti';

  @override
  String get guildSettingsEmojiRenameTitle => 'Pervadinti jaustuką';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 simboliai, raidės, skaičiai, pabraukimai.';

  @override
  String get guildSettingsEmojiColumnName => 'Pavadinimas';

  @override
  String get guildSettingsEmojiColumnUploader => 'Įkėlė';

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
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Nepavyko ištrinti šio jaustuko';

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
  String get guildSettingsStickerDensityCozy => 'Jaukus';

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
  String get guildSettingsStickerSlotsFull =>
      'Pasiekėte didžiausią lipdukų skaičių. Ištrinkite esamus lipdukus, kad atlaisvintumėte vietos.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Lipdukai išsaugomi 320x320 pikselių dydžiu ir turi būti ne didesni nei $maxSize. Statiniai vaizdai automatiškai keičiami į reikiamą dydį ir suspaudžiami. Animuoti lipdukai ir SVG jau turi atitikti nurodytą dydį.';
  }

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
  String get guildSettingsStickerDescriptionHint => 'Aprašykite lipduką';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Žymos ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Pridėti žymą';

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
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Norėdami sukurti webhook, atidarykite $channelSettingsPath. Čia vis tiek galėsite redaguoti ir tvarkyti visus esamus webhook.';
  }

  @override
  String get guildSettingsBannedUsersTitle => 'Užblokuoti nariai';

  @override
  String get guildSettingsInvitesTableInviter => 'Pakvietė';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanalas';

  @override
  String get guildSettingsInvitesTableCode => 'Kodas';

  @override
  String get guildSettingsInvitesTableUses => 'Naudojimų skaičius';

  @override
  String get guildSettingsInvitesTableCreated => 'Sukurta';

  @override
  String get guildSettingsInvitesTableExpires => 'Baigiasi';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtruoti pagal naudotoją';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtruoti pagal veiksmą';

  @override
  String get createDm => 'Kurti DM';

  @override
  String get createGroupDm => 'Kurti grupės DM';

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
      'Norėdami rašyti tiesiogines žinutes, užregistruokite paskyrą.';

  @override
  String get createDmVerifyToStartDms =>
      'Patvirtinkite el. paštą, kad galėtumėte pradėti tiesioginius pokalbius.';

  @override
  String get createDmVerifyYourEmail => 'Patvirtinkite savo el. paštą';

  @override
  String get createDmNewGroup => 'Nauja grupė';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Sukurti naują grupę su „$userName“';
  }

  @override
  String get createDmConfirmNewGroup => 'Patvirtinti naują grupę';

  @override
  String get createDmCreateNewGroup => 'Kurti naują grupę';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Pašalinti „$displayName“';
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
      'Nebėra gavėjų, su kuriais būtų galima sukurti grupės DM.';

  @override
  String get createDmUnaddableUserNotFound => 'Naudotojas nerastas';

  @override
  String get createDmUnaddableBlocked =>
      'Negalite siųsti žinučių šiam naudotojui';

  @override
  String get createDmUnaddableNotFriends => 'Nėra jūsų draugų sąraše';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Neleidžia pridėti prie grupės DM';

  @override
  String get createDmFailed =>
      'Nepavyko sukurti pokalbio. Pabandykite dar kartą.';

  @override
  String get dmListMessagesTitle => 'Žinutės';

  @override
  String get dmListDirectMessagesTitle => 'Tiesioginės žinutės';

  @override
  String get keybindsSearchShortcuts => 'Ieškoti sparčiųjų klavišų';

  @override
  String get keybindSectionDefaults => 'Numatyta';

  @override
  String get keybindSectionMessages => 'Žinutės';

  @override
  String get keybindSectionNavigation => 'Naršymas';

  @override
  String get keybindSectionDragAndDrop => 'Vilkimas ir numetimas';

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
  String get keybindActionFocusTextarea => 'Fokusuoti teksto sritį';

  @override
  String get keybindActionSwitchCommunities => 'Perjungti bendruomenes';

  @override
  String get keybindActionSwitchChannels => 'Perjungti kanalus';

  @override
  String get keybindActionHistoryBack =>
      'Grįžti atgal peržiūrėtų kanalų istorijoje';

  @override
  String get keybindActionHistoryForward =>
      'Eiti pirmyn peržiūrėtų kanalų istorijoje';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Pereiti tarp neskaitytų kanalų';

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
      'Perjungti į ankstesnę bendruomenę arba tiesiogines žinutes';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Perjungti į kitą bendruomenę arba tiesiogines žinutes';

  @override
  String get keybindActionGoToDms => 'Eiti į tiesiogines žinutes';

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
      'Sukurti bendruomenę arba prie jos prisijungti';

  @override
  String get keybindActionStartDragAndDrop => 'Pradėti vilkti ir mesti';

  @override
  String get keybindActionMove => 'Perkelti';

  @override
  String get keybindActionDropItem => 'Numesti elementą';

  @override
  String get keybindActionCancel => 'Atšaukti';

  @override
  String get keybindActionMarkCommunityRead =>
      'Pažymėti bendruomenę kaip perskaitytą';

  @override
  String get keybindActionMarkChannelRead => 'Pažymėti kanalą kaip perskaitytą';

  @override
  String get keybindActionStartGroupDm => 'Pradėti grupės DM';

  @override
  String get keybindActionTogglePinnedMessages => 'Perjungti prisegtas žinutes';

  @override
  String get keybindActionToggleInbox => 'Perjungti gautuosius';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Pažymėti viršutinį gautųjų kanalą kaip perskaitytą';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Pažymėti visus gautųjų kanalus kaip perskaitytus';

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
  String get keybindActionFocusComposer => 'Fokusuoti teksto lauką';

  @override
  String get keybindActionUploadFile => 'Įkelti failą';

  @override
  String get keybindActionCopyChannelLink => 'Kopijuoti kanalo nuorodą';

  @override
  String get keybindActionToggleSavedMedia => 'Perjungti išsaugotą mediją';

  @override
  String get keybindActionSendVoiceMessage => 'Siųsti balso žinutę';

  @override
  String get keybindActionAnswerCall => 'Atsiliepti į gaunamą skambutį';

  @override
  String get keybindActionDeclineCall => 'Atmesti gaunamą skambutį';

  @override
  String get keybindActionStartDmCall =>
      'Pradėti skambutį tiesioginiame pokalbyje arba grupėje';

  @override
  String get keybindActionToggleSoundboard =>
      'Įjungti / išjungti garsų skydelį';

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
  String get keybindActionOpenSettings => 'Atidaryti savo nustatymus';

  @override
  String get keybindActionOpenThemeStudio =>
      'Atidaryti temų studijos iššokantįjį langą';

  @override
  String get keybindActionZoomIn => 'Didinti';

  @override
  String get keybindActionZoomOut => 'Mažinti';

  @override
  String get keybindActionZoomReset => 'Atkurti mastelį';

  @override
  String get clipboardPasteFailed =>
      'Nepavyko įklijuoti. Iš leistukės nieko neišėjo nukopijuoti arba ji buvo užblokuota šiai programai.';

  @override
  String get homeQuickActionDms => 'Tiesioginiai pranešimai';

  @override
  String get assistantNeedsLogin =>
      'Pirmiausia atidarykite Fluxer ir prisijunkite.';

  @override
  String get assistantNotInVoice => 'Jūs nedalyvaujate skambutyje.';

  @override
  String get assistantNotFound => 'Fluxer to nerado.';

  @override
  String get assistantDmsDisabled =>
      'Tiesioginės žinutės šiame egzemplioriuje išjungtos.';

  @override
  String get assistantFailed => 'Fluxer negalėjo to atlikti.';

  @override
  String get assistantOkMuted => 'Mikrofonas nutildytas.';

  @override
  String get assistantOkUnmuted => 'Mikrofonas įjungtas.';

  @override
  String get assistantOkLeftVoice => 'Palikote balso kanalą.';

  @override
  String get assistantOkJoinedVoice => 'Jungiamasi prie balso kanalo.';

  @override
  String get assistantOkStartedCall => 'Pradedamas skambutis.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Būsena nustatyta į „$status“.';
  }

  @override
  String get assistantOkOpened => 'Atidaromas Fluxer.';

  @override
  String get assistantOkMessageSent => 'Žinutė išsiųsta.';

  @override
  String get assistantOkCustomStatusSet => 'Pasirinktinė būsena atnaujinta.';

  @override
  String get assistantOkCustomStatusCleared => 'Pasirinktinė būsena išvalyta.';

  @override
  String get guildNavbarAnnouncementChannel => 'Skelbimų kanalas';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Skelbkite naujienas, kurias kitos bendruomenės gali sekti savo kanaluose';

  @override
  String get channelDetailsAnnouncementChannel => 'Skelbimų kanalas';

  @override
  String get channelSettingsAnnouncementChannel => 'Skelbimų kanalas';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Leidžia kitoms bendruomenėms sekti šį kanalą ir gauti jūsų skelbiamų įrašų kopijas.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Nebebūti skelbimų kanalu?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count kanalų seka šį kanalą. Pavertus jį teksto kanalu, šie sekimai bus pašalinti.',
      many:
          '$count kanalo seka šį kanalą. Pavertus jį teksto kanalu, šie sekimai bus pašalinti.',
      few:
          '$count kanalai seka šį kanalą. Pavertus jį teksto kanalu, šie sekimai bus pašalinti.',
      one:
          '$count kanalas seka šį kanalą. Pavertus jį teksto kanalu, šis sekimas bus pašalintas.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Pavertus šį kanalą teksto kanalu, visi jį sekantys kanalai nustos jį sekti.';

  @override
  String get channelSettingsConvertChannel => 'Konvertuoti';

  @override
  String get channelSettingsConvertFailed => 'Nepavyko konvertuoti šio kanalo';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Šį kanalą vis dar seka kiti kanalai. Prieš konvertuodami pašalinkite šiuos sekimus.';

  @override
  String get channelMenuFollow => 'Sekti kanalą';

  @override
  String get channelFollowTitle => 'Sekti šį kanalą';

  @override
  String get channelFollowBody =>
      'Pasirinkite, kur bus siunčiamos jo paskelbtos žinutės. Bet kada galite nustoti sekti skiltyje Bendruomenės nustatymai → Webhookai.';

  @override
  String get channelFollowCommunity => 'Bendruomenė';

  @override
  String get channelFollowChannel => 'Kanalas';

  @override
  String get channelFollowAgeWarning =>
      'Tai amžiaus apribojimų kanalas. Naujienos gali būti siunčiamos tik į amžiaus apribojimų kanalus.';

  @override
  String get channelFollowContentWarning =>
      'Šiame kanale yra turinio įspėjimas. Naujienos gali būti siunčiamos tik į kanalus su turinio įspėjimu arba amžiaus apribojimu.';

  @override
  String get channelFollowHiddenHint =>
      'Bendruomenės ir kanalai, kuriuose negalite tvarkyti webhookų, yra paslėpti.';

  @override
  String get channelFollowEmpty =>
      'Jokioje bendruomenėje negalite tvarkyti webhookų. Paprašykite administratoriaus sekti šį kanalą.';

  @override
  String get channelFollowSubmit => 'Sekti';

  @override
  String get channelFollowFailed => 'Nepavyko sekti šio kanalo.';

  @override
  String get channelFollowSuccessTitle => 'Atnaujinimai jau pakeliui!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'Žinutės, paskelbtos $sourceName, bus rodomos kanale #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Supratau!';

  @override
  String get channelFollowBarrier =>
      'Sekite šį kanalą, kad gautumėte šiuos skelbimus pasirinktame kanale.';

  @override
  String get channelHeaderFollow => 'Sekti kanalą';

  @override
  String get chatMessagePublish => 'Paskelbti';

  @override
  String get chatMessagePublished => 'Paskelbta';

  @override
  String get chatMessagePublishConfirmTitle => 'Paskelbti žinutę?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Tai nusiųs kopiją į kiekvieną kanalą, kuris seka šį.';

  @override
  String get chatMessagePublishedToast => 'Žinutė paskelbta';

  @override
  String get chatMessageAlreadyPublished => 'Ši žinutė jau paskelbta.';

  @override
  String get chatMessagePublishFailedTitle => 'Nepavyko paskelbti šios žinutės';

  @override
  String get chatMessagePublishFailedBody =>
      'Kažkas nepavyko. Bandykite dar kartą po akimirkos.';

  @override
  String get chatMessagePublishLimitTitle => 'Neskubėkite';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Vėl galėsite paskelbti po $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Per greitai skelbiate. Bandykite dar kartą po akimirkos.';

  @override
  String get chatMessageDeletePublished =>
      'Taip pat bus pašalintos kopijos, kurios buvo išsiųstos šį kanalą sekantiems kanalams.';

  @override
  String get chatMessageEditPublishedTitle => 'Redaguoti paskelbtą žinutę?';

  @override
  String get chatMessageEditPublishedBody =>
      'Tai atnaujins kopijas, kurios buvo išsiųstos šį kanalą sekantiems kanalams.';

  @override
  String get chatMessageEditPublishedSave => 'Išsaugoti';

  @override
  String get chatMessageEditLimitTitle => 'Neskubėkite';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Šią paskelbtą žinutę vėl galėsite redaguoti po $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Per greitai redaguojate šią paskelbtą žinutę. Bandykite dar kartą po akimirkos.';

  @override
  String get chatMessageOriginalDeleted => '[Originali žinutė ištrinta]';

  @override
  String get userTagCommunity => 'Bendruomenė';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username nustatė, kad šis kanalas sektų $source. Ten paskelbtos žinutės bus rodomos čia.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username nustatė, kad šis kanalas sektų $source.';
  }

  @override
  String get publishNudgeNotSent => 'Dar neišsiųsta sekėjams.';

  @override
  String get publishNudgeHideForever => 'Daugiau nerodyti';

  @override
  String get publishNudgeDismiss => 'Atmesti';

  @override
  String get channelSettingsFollowedChannels => 'Sekami kanalai';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Skelbimų kanalai, kuriuos seka šis kanalas. Nustokite sekti, kad nebegautumėte kopijų.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Skelbimų kanalai, kuriuos seka šios bendruomenės kanalai.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'Iš $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Naujinimai pristabdyti, nes šaltinio kanalas nebepasiekiamas.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Nustoti sekti $name?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Šis kanalas nebegaus kopijų iš to skelbimų kanalo.';

  @override
  String get channelSettingsUnfollow => 'Nustoti sekti';

  @override
  String get crosspostCommunityTitle => 'Bendruomenė';

  @override
  String get crosspostGoToCommunity => 'Eiti į bendruomenę';

  @override
  String get crosspostJoinCommunity => 'Prisijungti prie bendruomenės';

  @override
  String get crosspostSourceFailed =>
      'Nepavyko įkelti šios bendruomenės. Pabandykite dar kartą po akimirkos.';

  @override
  String crosspostMembers(int count) {
    return 'Narių: $count';
  }

  @override
  String crosspostOnline(int count) {
    return 'Prisijungę: $count';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minučių',
      many: '$count minutės',
      few: '$count minutės',
      one: '$count minutė',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sekundžių',
      many: '$count sekundės',
      few: '$count sekundės',
      one: '$count sekundė',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Nepalaikomas kanalo tipas';

  @override
  String get channelUnsupportedBody =>
      'Ši programos versija nepalaiko šio kanalo tipo.';

  @override
  String get channelDetailsUnsupportedChannel => 'Nepalaikomas kanalas';

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
