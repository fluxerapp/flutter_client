// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class FluxerLocalizationsHr extends FluxerLocalizations {
  FluxerLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get reconnectingTitle => 'Došlo je do greške!';

  @override
  String get reconnectingBody =>
      'Nešto nije u redu s instancom.\nPopravit će se za sekundu!';

  @override
  String get gatewayReconnectingToast => 'Ponovno povezivanje…';

  @override
  String get gatewayConnectedToast => 'Povezano';

  @override
  String get sessionExpiredToast =>
      'Sesija vam je istekla. Molimo vas da se ponovno prijavite.';

  @override
  String splashStartupFailed(String error) {
    return 'Nije uspjelo pokretanje: $error';
  }

  @override
  String get retry => 'Ponovi';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Veza prekinuta';

  @override
  String get splashViewOnStatusPage => 'Prikaži na stranici statusa';

  @override
  String get splashConnectionIssuesPrompt => 'Problemi s vezom?';

  @override
  String get splashStatusPageLink => 'Stranica sa statusom';

  @override
  String get splashReadIncident => 'Pročitaj incident';

  @override
  String get splashIncidentHistory => 'Povijest incidenata';

  @override
  String get nagbarLearnMore => 'Saznajte više';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Održavanje je zakazano za $localizedTime. Očekivano trajanje: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Održavanje je u tijeku. Očekivano trajanje: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Održavanje je dovršeno.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hej $displayName, preuzmite svoj račun kako ne biste izgubili pristup.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hej $displayName, molimo potvrdite svoju adresu e-pošte.';
  }

  @override
  String get nagbarOpenSettings => 'Otvori postavke';

  @override
  String get systemPermissionSettingsTitle => 'Omogući dopuštenje';

  @override
  String get systemPermissionSettingsOpenSettings => 'Otvori postavke';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName nema pristup vašem mikrofonu. Možete ga omogućiti u postavkama privatnosti vašeg uređaja.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName nema pristup vašoj kameri. Možete ga omogućiti u postavkama privatnosti vašeg uređaja.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName nema pristup vašoj biblioteci fotografija. Možete ga omogućiti u postavkama privatnosti vašeg uređaja.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName nema dopuštenje za slanje obavijesti. Možete ga omogućiti u postavkama uređaja.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Pretplata vam nije obnovljena, ali i dalje imate pristup pogodnostima $productName do $graceDate. Poduzmite nešto sada ili ćete izgubiti sve pogodnosti.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Pretplata na vaš $productName je istekla. Obnovite je sada kako biste zadržali svoje pogodnosti.';
  }

  @override
  String get nagbarManageSubscription => 'Upravljanje pretplatom';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Dobrodošli u $productFullName. Istražite svoje pogodnosti za $productName i upravljajte svojom pretplatom.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Pogledaj $productName značajke';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Nova vam je ulaznica za poklone u inventaru poklona.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Imate $count novih kodova za poklone u inventaru poklona.';
  }

  @override
  String get nagbarViewGiftInventory => 'Prikaži inventar poklona';

  @override
  String get nagbarVisionaryMfa =>
      'Omogući dvofaktorsku provjeru autentičnosti kako bi zaštitio/la svoj Visionary račun.';

  @override
  String get nagbarEnableMfa => 'Omogući 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Ažurirali smo naše uvjete. Pregledajte ih i prihvatite kako biste nastavili.';

  @override
  String get nagbarReviewTerms => 'Pregledaj uvjete';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Pridružite se zajednici $communityName kako biste razgovarali s timom i bili u tijeku.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Pridružite se $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Omogući obavijesti kako ne bi propustio/la poruke i spominjanja.';

  @override
  String get nagbarEnableNotifications => 'Omogući obavijesti';

  @override
  String get nagbarBillingPortalFailed =>
      'Nismo mogli otvoriti portal za naplatu. Molimo pokušajte ponovno za trenutak.';

  @override
  String get welcomeBack => 'Dobro došli natrag';

  @override
  String get email => 'E-pošta';

  @override
  String get emailInvalid => 'Molimo unesite valjanu adresu e-pošte.';

  @override
  String get password => 'Lozinka';

  @override
  String get forgotPassword => 'Zaboravili ste lozinku?';

  @override
  String get logIn => 'Prijava';

  @override
  String get logInWithPasskey => 'Prijava pomoću sigurnosnog ključa';

  @override
  String continueWithSso(String provider) {
    return 'Nastavi s $provider';
  }

  @override
  String get ssoRequired =>
      'Za pristup ovom serveru potrebna je prijava putem SSO-a.';

  @override
  String get organizationSsoProvider =>
      'Prijavite se putem davatelja jedinstvene prijave vaše organizacije.';

  @override
  String get failedToStartSso => 'Pokretanje SSO-a nije uspjelo';

  @override
  String get ssoCancelled => 'Prijava putem SSO-a je otkazana';

  @override
  String preferSso(String provider) {
    return 'Radije koristiti SSO? Nastavite s $provider.';
  }

  @override
  String get logInViaBrowser => 'Prijavi se putem preglednika';

  @override
  String get needAccountPrompt => 'Trebate račun? ';

  @override
  String get register => 'Registracija';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => 'Odustani';

  @override
  String get ipAuthCheckEmail => 'Provjerite e-poštu';

  @override
  String ipAuthDescription(String email) {
    return 'Poslali smo poveznicu za autorizaciju ove prijave na vašu e-poštu. Otvorite pristiglu poštu za $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Veza prekinuta';

  @override
  String get ipAuthConnectionLostDescription =>
      'Izgubili smo vezu dok smo čekali autorizaciju. Molimo pokušajte ponovno.';

  @override
  String get ipAuthLinkExpired => 'Link za prijavu je istekao';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Ova poveznica za autorizaciju istekla je. Molimo vas da se ponovno prijavite.';

  @override
  String get ipAuthResendEmail => 'Ponovno pošalji e-poštu';

  @override
  String get ipAuthResent => 'Ponovno poslano';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Natrag';

  @override
  String get next => 'Dalje';

  @override
  String get mfaTitle => 'Dvostruka provjera autentičnosti';

  @override
  String get mfaChooseMethod => 'Odaberite metodu provjere';

  @override
  String get mfaMethodTotp => 'Aplikacija za provjeru autentičnosti';

  @override
  String get mfaMethodWebauthn => 'Sigurnosni ključ / pristupni ključ';

  @override
  String get mfaTotpDescription =>
      'Unesite 6-znamenkasti kod iz svoje aplikacije za provjeru autentičnosti ili jedan od svojih rezervnih kodova.';

  @override
  String get mfaCodeLabel => 'Kod';

  @override
  String get mfaTryAnotherMethod => 'Isprobaj drugu metodu';

  @override
  String get mfaUseSecurityKey =>
      'Pokušajte sa sigurnosnim ključem / pristupnim ključem';

  @override
  String get accountSelectorTitle => 'Odaberite račun';

  @override
  String get accountSelectorDescription =>
      'Odaberite račun za nastavak ili dodajte drugi.';

  @override
  String get accountAdd => 'Dodaj račun';

  @override
  String get accountRemove => 'Ukloni';

  @override
  String accountRemoveTitle(String username) {
    return 'Izbriši $username';
  }

  @override
  String get accountRemoveDescription =>
      'Ovo će ukloniti spremljenu sesiju za ovaj račun.';

  @override
  String get accountRemoveOnlyDescription =>
      'Ovo će ukloniti jedini spremljeni račun na ovom uređaju.';

  @override
  String get accountExpired => 'Isteklo';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sesija za $identifier je istekla. Molimo vas ponovno se prijavite.';
  }

  @override
  String get accountManageTitle => 'Upravljaj računima';

  @override
  String get accountSwitchFailed =>
      'Nije moguće promijeniti račun. Pokušajte ponovno.';

  @override
  String get profileTabMenuSwitchAccounts => 'Promijeni račun';

  @override
  String get statusChangeSheetTitle => 'Postavi status';

  @override
  String get statusOnlineStatusSection => 'Status na mreži';

  @override
  String get statusOnline => 'Na mreži';

  @override
  String get statusIdle => 'Neaktivan';

  @override
  String get statusDnd => 'Ne uznemiravaj';

  @override
  String get statusInvisible => 'Nevidljiv';

  @override
  String get statusOffline => 'Izvan mreže';

  @override
  String get statusUntilIChangeIt => 'Dok ne promijenim';

  @override
  String get statusDontClear => 'Ne briši';

  @override
  String get statusFor10Seconds => 'Na 10 sekundi';

  @override
  String get statusClearAfter10Seconds => '10 sekundi';

  @override
  String get statusClearAfter15Minutes => '15 minuta';

  @override
  String get statusClearAfter30Minutes => '30 minuta';

  @override
  String get statusClearAfter1Hour => '1 sat';

  @override
  String get statusClearAfter3Hours => '3 sata';

  @override
  String get statusClearAfter4Hours => '4 sata';

  @override
  String get statusClearAfter8Hours => '8 sati';

  @override
  String get statusClearAfter24Hours => '24 sata';

  @override
  String get statusClearAfter3Days => '3 dana';

  @override
  String get statusDndDescription => 'Nećete primati obavijesti na računalu';

  @override
  String get statusInvisibleDescription => 'Prikazivat ćete se izvan mreže';

  @override
  String get customStatusSetTitle => 'Postavi prilagođeni status';

  @override
  String get customStatusCurrentHint => 'Prilagođeni status';

  @override
  String get customStatusClear => 'Obriši prilagođeni status';

  @override
  String get customStatusPlaceholder => 'Što se događa?';

  @override
  String get customStatusChooseEmoji => 'Odaberite emoji';

  @override
  String get customStatusClearAfter => 'Očisti nakon';

  @override
  String get customStatusSave => 'Spremi';

  @override
  String get accountActive => 'Aktivan račun';

  @override
  String get signOut => 'Odjava';

  @override
  String get suspendedPermanentTitle => 'Račun trajno suspendiran';

  @override
  String get suspendedTemporaryTitle => 'Račun suspendiran';

  @override
  String get suspendedPermanentDescription =>
      'Vaš je račun trajno suspendiran zbog kršenja naših Uvjeta pružanja usluge.';

  @override
  String get suspendedTemporaryDescription =>
      'Vaš je račun privremeno suspendiran. Moći ćete pristupiti svom računu nakon što razdoblje suspenzije završi.';

  @override
  String get suspendedIssuedAt => 'Izdano';

  @override
  String get suspendedEndsAt => 'Završava';

  @override
  String get suspendedDuration => 'Trajanje';

  @override
  String get suspendedPermanent => 'Trajno';

  @override
  String get suspendedReason => 'Razlog';

  @override
  String get suspendedAppealDeadline => 'Rok za žalbu';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Vaš je račun zakazan za brisanje $date.';
  }

  @override
  String get suspendedRecheck => 'Provjeri ažuriranja';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Ponovno provjeri za ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Natrag na prijavu';

  @override
  String get suspendedAppealTitle => 'Žalba';

  @override
  String get suspendedAppealHint =>
      'Objasnite zašto bi vaša suspenzija trebala biti ponovno razmotrena (najmanje 50 znakova)...';

  @override
  String get suspendedAppealSubmit => 'Pošalji žalbu';

  @override
  String get suspendedAppealPending => 'Na čekanju za pregled';

  @override
  String get suspendedAppealAccepted => 'Žalba prihvaćena';

  @override
  String get suspendedAppealRejected => 'Odbijena žalba';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Vaš zahtjev je prihvaćen i vaš račun je ponovno aktiviran.';

  @override
  String get suspendedSignIn => 'Prijavi se na svoj račun';

  @override
  String get forgotPasswordTitle => 'Zaboravili ste lozinku?';

  @override
  String get forgotPasswordDescription =>
      'Unesite svoju e-adresu i poslat ćemo vam poveznicu za poništavanje lozinke.';

  @override
  String get forgotPasswordSubmit =>
      'Pošalji poveznicu za ponovno postavljanje';

  @override
  String get forgotPasswordSentTitle => 'Provjerite e-poštu';

  @override
  String get forgotPasswordSentDescription =>
      'Poslali smo upute za poništavanje lozinke na vašu e-adresu. Provjerite svoju pristiglu poštu i slijedite poveznicu za poništavanje lozinke.';

  @override
  String get forgotPasswordBackToLogin => 'Vrati se na prijavu';

  @override
  String get resetPasswordTitle => 'Postavi novu lozinku';

  @override
  String get resetPasswordDescription =>
      'Unesite svoju novu lozinku ispod kako biste dovršili postupak poništavanja.';

  @override
  String get resetPasswordNewPassword => 'Nova lozinka';

  @override
  String get resetPasswordConfirm => 'Potvrdite novu lozinku';

  @override
  String get resetPasswordSubmit => 'Poništi lozinku';

  @override
  String get resetPasswordMismatch => 'Lozinke se ne podudaraju.';

  @override
  String get recoverAccountTitle => 'Vratite pristup svojem računu';

  @override
  String get recoverAccountDescription =>
      'Unesite svoje korisničko ime i ključ za oporavak iz svog kompleta za oporavak, a zatim odaberite novu lozinku.';

  @override
  String get recoverAccountNoKit =>
      'Nemaš komplet za oporavak? Zatraži od administratora ove instance poveznicu za poništavanje lozinke.';

  @override
  String get recoveryKitTitle => 'Vaš komplet za oporavak';

  @override
  String get recoveryKitCreatedDescription =>
      'Ako zaboravite lozinku, ovaj komplet je jedini način da se vratite na svoj račun. Pohranite ga na sigurno mjesto, poput upravitelja lozinki ili ispisane kopije.';

  @override
  String get recoveryKitReplacedDescription =>
      'Vaš stari komplet za oporavak više ne radi. Novi komplet pohranite na sigurno mjesto.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Lozinka vam je poništena. Vaš stari komplet za oporavak više ne radi. Pohranite ovaj novi komplet na sigurno mjesto.';

  @override
  String get recoveryKitWarning =>
      'Svatko s ovim ključem može poništiti tvoju lozinku. Nikada ga ne dijeli.';

  @override
  String get recoveryKitKeyLabel => 'Kljuc za oporavak';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return '$productName komplet za oporavak';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Ovu stranicu čuvajte na sigurnom mjestu. Ako zaboravite lozinku, možete je upotrijebiti za ponovni pristup svojem računu. Svatko tko posjeduje ovaj ključ za oporavak može poništiti vašu lozinku, stoga ga nikada nemojte dijeliti.';

  @override
  String get recoveryKitInstanceLabel => 'Instanca';

  @override
  String get recoveryKitCreatedAtLabel => 'Stvoreno';

  @override
  String get recoveryKitQrCaption =>
      'Skeniraj za otvaranje stranice za oporavak s ispunjenim podacima.';

  @override
  String get recoveryKitStepsTitle => 'Kako oporaviti svoj račun';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Idi na $recoverUrl ili skeniraj QR kod.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Unesite svoje korisničko ime i ovaj ključ za oporavak.';

  @override
  String get recoveryKitStepPassword =>
      'Odaberite novu zaporku. Dobit ćete novi komplet za oporavak i ovaj više neće raditi.';

  @override
  String get recoveryKitBackupCodesTitle =>
      'Sigurnosni kodovi za dvofaktorsku provjeru';

  @override
  String get recoveryKitBackupCodesNote =>
      'Svaki kôd radi jednom umjesto vaše aplikacije za provjeru autentičnosti.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Nismo mogli učitati vaše sigurnosne kodove.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Uključi moje rezervne kodove za dvofaktorsku autentifikaciju u spremljenu sliku';

  @override
  String get recoveryKitCopy => 'Kopiraj';

  @override
  String get recoveryKitCopied => 'Ključ za oporavak kopiran';

  @override
  String get recoveryKitSaveImage => 'Spremi sliku';

  @override
  String get recoveryKitSaved => 'Paket za oporavak spremljen';

  @override
  String get recoveryKitSavedToPhotos =>
      'Paket za oporavak spremljen u fotografije';

  @override
  String get recoveryKitSaveFailed =>
      'Paket za oporavak nije moguće spremiti. Pokušaj ponovno ili umjesto toga kopiraj ključ.';

  @override
  String get recoveryKitAcknowledge =>
      'Spremljen/a sam komplet za oporavak na sigurno mjesto';

  @override
  String get recoveryKitCreateFailed =>
      'Nismo mogli stvoriti vaš komplet za oporavak. Možete ga izraditi kasnije u postavkama računa.';

  @override
  String get recoveryKitSectionTitle => 'Komplet za oporavak';

  @override
  String get recoveryKitSectionDescription =>
      'Omogućuje vam poništavanje lozinke ako je zaboravite.';

  @override
  String get recoveryKitNone => 'Još nemate komplet za oporavak';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Stvoreno $time';
  }

  @override
  String get recoveryKitCreate => 'Stvori komplet za oporavak';

  @override
  String get recoveryKitCreateNew => 'Stvori novi komplet';

  @override
  String get recoveryKitReplaceTitle => 'Izraditi novi komplet za oporavak?';

  @override
  String get recoveryKitReplaceDescription =>
      'Vaš postojeći komplet prestaje raditi čim se izradi novi.';

  @override
  String get recoveryKitReminderTitle => 'Spremi komplet za oporavak';

  @override
  String get recoveryKitReminderBody =>
      'Tvoj račun nema pridruženu e-adresu. Ako zaboraviš lozinku, komplet za oporavak jedini je način da se vratiš. Potrebna je samo minuta.';

  @override
  String get registerUsernameSignInHint =>
      'Prijavljuješ se ovim korisničkim imenom. Odaberi ono kojeg ćeš se sjetiti.';

  @override
  String get registerUsernameTaken => 'Ovo korisničko ime je već zauzeto';

  @override
  String get registerUsernameAvailable => 'Ovo je korisničko ime dostupno';

  @override
  String get claimAccountUsernameDescription =>
      'Zatražite svoj račun odabirom korisničkog imena i lozinke. Prijavljujete se s njima, stoga odaberite one kojih ćete se sjećati.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Tvoj račun još nije preuzet. Bez korisničkog imena i lozinke nećeš se moći prijaviti s drugih uređaja i mogao bi izgubiti pristup svom računu. Preuzmi svoj račun sada kako bi ga osigurao.';

  @override
  String get addFriendUsernameOnlyHint => 'Korisničko ime';

  @override
  String get registerTitle => 'Izradi račun';

  @override
  String get registerDisplayName => 'Ime za prikaz (neobavezno)';

  @override
  String get registerDisplayNameHint => 'Kako da vas ljudi zovu?';

  @override
  String get registerUsername => 'Korisničko ime (neobavezno)';

  @override
  String get registerUsernameHint =>
      'Ostavite prazno za nasumično korisničko ime';

  @override
  String get registerUsernameTagHint =>
      'Automatski će se dodati 4-znamenkasti tag kako bi se osigurala jedinstvenost';

  @override
  String get registerDateOfBirth => 'Datum rođenja';

  @override
  String get registerMonth => 'Mjesec';

  @override
  String get registerDay => 'Dan';

  @override
  String get registerYear => 'Godina';

  @override
  String get registerConsent =>
      'Slažem se s Uvjetima pružanja usluge i Pravilima o privatnosti';

  @override
  String get registerConsentPrefix => 'Slažem se s ';

  @override
  String get registerConsentTerms => 'Uvjeti pružanja usluge';

  @override
  String get registerConsentAnd => ' i ';

  @override
  String get registerConsentPrivacy => 'Pravila privatnosti';

  @override
  String get registerConfirmPassword => 'Potvrdite lozinku';

  @override
  String get registerSubmit => 'Izradi račun';

  @override
  String get registerHaveAccount => 'Već imate račun? ';

  @override
  String get registerPendingApproval =>
      'Vaš zahtjev za račun čeka odobrenje. Možete se prijaviti nakon što ga administrator odobri.';

  @override
  String get registerClosed =>
      'Registracija je trenutačno zatvorena. Za izradu računa upotrijebi registracijsku poveznicu od administratora.';

  @override
  String get passkeyNoCredentials =>
      'Nema spremljenih prolaznih ključeva za ovu aplikaciju. Prijavite se umjesto toga e-poštom i lozinkom.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys nisu podržane na ovom uređaju.';

  @override
  String get passkeyDomainNotAssociated =>
      'Sigurnosni ključevi nisu konfigurirani za ovu aplikaciju. Prijavite se umjesto toga e-poštom i lozinkom.';

  @override
  String get passkeyTimeout =>
      'Isteklo je vrijeme za provjeru autentičnosti putem sigurnosnog ključa. Molimo pokušajte ponovno.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys nisu dostupne za ovu aplikaciju. Umjesto toga, prijavite se e-poštom i lozinkom.';

  @override
  String get passkeyFailed =>
      'Autentifikacija putem sigurnosnog ključa nije uspjela. Molimo pokušajte ponovno.';

  @override
  String get errorUnableToCreateAccount =>
      'Ne možemo stvoriti račun. Molimo pokušajte ponovno.';

  @override
  String get errorUnableToSignIn =>
      'Ne možemo se prijaviti trenutačno. Molimo pokušajte ponovno.';

  @override
  String get errorServiceUnavailable =>
      'Ova je instanca privremeno nedostupna. Pokušajte ponovno za trenutak.';

  @override
  String get errorInvalidEmailOrPassword => 'Neispravna e-pošta ili zaporka.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Neispravno korisničko ime ili lozinka.';

  @override
  String get errorUnableToSendResetLink =>
      'Ne možemo poslati poveznicu za poništavanje. Molimo pokušajte ponovno.';

  @override
  String get errorUnableToResetPassword =>
      'Ne možemo poništiti lozinku. Molimo pokušajte ponovno.';

  @override
  String get embedInviteJoin => 'Pridruži se zajednici';

  @override
  String get embedInviteGoTo => 'Idi na zajednicu';

  @override
  String embedInviteOnline(String count) {
    return '$count na mreži';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count članova';
  }

  @override
  String get embedInviteUnknownTitle => 'Nepoznata pozivnica';

  @override
  String get embedInviteUnknownSubtitle =>
      'Pokušajte zatražiti novu pozivnicu.';

  @override
  String get embedInviteUnavailable => 'Pozivnica nedostupna';

  @override
  String get embedInviteJoinGroup => 'Pridruži se grupi';

  @override
  String get embedInviteAlreadyJoined => 'Već ste se pridružili';

  @override
  String get embedInviteDisabled => 'Pozivnice onemogućene';

  @override
  String get embedInvitePaused => 'Pozivnice su pauzirane za ovu zajednicu.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName je otkrio potencijalni napad, pa se novi korisnici trenutačno ne mogu pridružiti.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Ova je zajednica pauzirala pozivnice. Možete pokušati ponovno kasnije.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName je otkrio potencijalni napad u ovoj zajednici. Pozivnice su pauzirane, tako da se novi korisnici trenutačno ne mogu pridružiti.';
  }

  @override
  String get inviteAcceptTitle => 'Pozvani ste da se pridružite';

  @override
  String get inviteAcceptJoinButton => 'Pridruži se zajednici';

  @override
  String get inviteAcceptGoToButton => 'Idi na zajednicu';

  @override
  String get inviteAcceptInvitesPaused => 'Pozivnice pauzirane';

  @override
  String get inviteAcceptNotFoundTitle => 'Neispravan poziv';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Ova pozivnica je možda istekla ili je nevažeća.';

  @override
  String get invalidDeepLinkTitle => 'Veza se nije mogla otvoriti';

  @override
  String get invalidDeepLinkDescription =>
      'Ova poveznica možda nije ispravna, dostupna je samo na webu ili joj možda nemate pristup. Provjerite poveznicu i pokušajte ponovno.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Idi na početnu';

  @override
  String get inviteAcceptJoinGroupButton => 'Pridruži se grupi';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Pozvan/a si u grupni DM od strane $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'netko';

  @override
  String get inviteAcceptEmojiPack => 'Paket emojija';

  @override
  String get inviteAcceptStickerPack => 'Paket naljepnica';

  @override
  String get inviteAcceptInstallEmojiPack => 'Instaliraj paket emojija';

  @override
  String get inviteAcceptInstallStickerPack => 'Instaliraj paket naljepnica';

  @override
  String get inviteAcceptPackInstallNote =>
      'Prihvaćanjem ovog poziva paket će se automatski instalirati.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Pristup kanalu odbijen';

  @override
  String get channelAccessDeniedDescription =>
      'Nemate pristup kanalu u kojem je poslana ova poruka.';

  @override
  String get messageJumpLinkNoAccess => 'Nema pristupa';

  @override
  String get okay => 'U redu';

  @override
  String get embedThemeTitle => 'Dijeljena tema';

  @override
  String get embedThemeHelp => 'Imate CSS!';

  @override
  String get embedThemeImport => 'Uvezi temu';

  @override
  String get embedThemeUnavailableTitle => 'Tema nije dostupna';

  @override
  String get embedThemeUnavailableDescription => 'Ova tema više nije dostupna.';

  @override
  String get embedThemeImportUnavailable => 'Uvoz nedostupan';

  @override
  String get themeImportTitle => 'Uvezi temu';

  @override
  String get themeImportDescription =>
      'Ovo će zamijeniti vašu trenutačnu prilagođenu temu.';

  @override
  String get themeImportReadFailed =>
      'Nismo mogli učitati ovu temu. Možda je oštećena ili nevažeća.';

  @override
  String get themeImportApply => 'Primijeni';

  @override
  String get themeImportApplied => 'Tema je uspješno primijenjena.';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Vizionar (doživotni $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dana $productName',
      one: '1 dan $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tjedana $productName',
      one: '1 tjedan $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mjeseci $productName',
      one: '1 mjesec $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count godina $productName',
      one: '1 godina $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Od $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Kliknite za preuzimanje poklona!';

  @override
  String get embedGiftAlreadyRedeemed => 'Već iskorišteno';

  @override
  String get embedGiftClaimAccountHelp =>
      'Preuzmite svoj račun kako biste iskoristili ovaj poklon.';

  @override
  String get embedGiftClaim => 'Preuzmi poklon';

  @override
  String get embedGiftClaimed => 'Poklon preuzet';

  @override
  String get embedGiftClaimAccount => 'Preuzmite račun za iskorištavanje';

  @override
  String get embedGiftUnknownTitle => 'Nepoznat poklon';

  @override
  String get embedGiftUnknownSubtitle =>
      'Ovaj kôd poklona nije važeći ili je već iskorišten.';

  @override
  String get embedGiftUnavailable => 'Poklon nije dostupan';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Aktiviraj svoju $productName pretplatu preuzimanjem svog poklona!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Ovaj je poklon već preuzet.';

  @override
  String get giftAcceptMaybeLater => 'Možda kasnije';

  @override
  String get giftRedeemedToast => 'Poklon iskorišten!';

  @override
  String get giftRedeemInvalidTitle => 'Nevažeći kôd poklona';

  @override
  String get giftRedeemInvalidMessage =>
      'Ovaj je kôd nevažeći ili je već iskorišten.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Poklon je već iskorišten';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Ovaj je kôd već iskorišten.';

  @override
  String get giftRedeemNotFoundTitle => 'Poklon nije pronađen';

  @override
  String get giftRedeemNotFoundMessage => 'Ovaj kôd ne postoji.';

  @override
  String get giftRedeemFailedTitle => 'Neuspješno iskorištavanje poklona';

  @override
  String get giftRedeemFailedMessage =>
      'Nije moguće iskoristiti ovaj poklon. Pokušajte ponovno.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Ne možeš iskoristiti ovaj poklon';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary računi ne mogu iskoristiti Plutonium poklone. Umjesto toga, kopirajte poveznicu kako biste je podijelili s prijateljem.';

  @override
  String get giftCopyLink => 'Kopiraj poveznicu za poklon';

  @override
  String get privacySettings => 'Postavke privatnosti';

  @override
  String get privacyDirectMessages => 'Izravne poruke';

  @override
  String get privacyDirectMessagesDescription =>
      'Dopusti izravne poruke od drugih članova u ovoj zajednici';

  @override
  String get privacyBotDirectMessages => 'Izravne poruke botova';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Dopusti botovima iz ove zajednice da ti šalju izravne poruke';

  @override
  String get privacyMutualDmsDisabled =>
      'Administratori zajednice onemogućili su primanje izravnih poruka isključivo od zajedničkih članova u ovoj zajednici.';

  @override
  String get communityDebug => 'Otklanjanje pogrešaka zajednice';

  @override
  String get copiedToClipboard => 'Kopirano u međuspremnik';

  @override
  String get notificationSettings => 'Postavke obavijesti';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Isključi obavijesti za $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Mute zajednice sprječava pojavljivanje nepročitanih pokazatelja i obavijesti, osim ako niste spomenuti';

  @override
  String get notificationCommunitySettings => 'Postavke obavijesti zajednice';

  @override
  String get notificationAllMessages => 'Sve poruke';

  @override
  String get notificationOnlyMentions => 'Samo spominjanja';

  @override
  String get notificationNothing => 'Ništa';

  @override
  String get notificationSuppressEveryone => 'Potisni @everyone i @here';

  @override
  String get notificationSuppressRoles => 'Zatvori sve spomenute uloge';

  @override
  String get notificationMobilePush => 'Mobilne push obavijesti';

  @override
  String get notificationOverrides => 'Prilagodba obavijesti';

  @override
  String get notificationSelectChannel => 'Odaberite kanal ili kategoriju';

  @override
  String get notificationOnlyAtMentions => 'Samo @spominjanja';

  @override
  String get notificationMuteChannel => 'Isključi obavijesti za kanal';

  @override
  String get notificationUnmuteChannel => 'Uključi obavijesti za kanal';

  @override
  String get notificationUseCategoryDefault => 'Koristi zadano za kategoriju';

  @override
  String get notificationUseCommunityDefault => 'Koristi zadano za zajednicu';

  @override
  String get notificationNoCategory => 'Bez kategorije';

  @override
  String get dmMarkAsRead => 'Označi kao pročitano';

  @override
  String get dmMuteConversation => 'Isključi obavijesti za izravnu poruku';

  @override
  String get dmUnmuteConversation => 'Uključi obavijesti za izravnu poruku';

  @override
  String get dmPinDm => 'Prikvači izravnu poruku';

  @override
  String get dmUnpinDm => 'Otkvači izravnu poruku';

  @override
  String get dmAlwaysShowInSidebar => 'Uvijek prikaži u bočnoj traci';

  @override
  String get dmRemoveFromAlwaysShown => 'Ukloni iz Uvijek prikazano';

  @override
  String get dmCloseDm => 'Zatvori izravnu poruku';

  @override
  String get dmCloseDmConfirmTitle => 'Zatvori izravnu poruku';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Jeste li sigurni da želite zatvoriti izravnu poruku s korisnikom $username? Uvijek je možete ponovno otvoriti kasnije.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Izbrisati vaše poruke u ovom razgovoru?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Ovo će trajno izbrisati svaku poruku koju ste ikada poslali u ovom razgovoru. Ova se radnja ne može poništiti.';

  @override
  String get dmCopyChannelId => 'Kopiraj ID kanala';

  @override
  String get dmChannelIdCopied => 'ID kanala kopiran';

  @override
  String get dmCopyUserId => 'Kopiraj korisnički ID';

  @override
  String get dmUserIdCopied => 'Korisnički ID kopiran';

  @override
  String get dmViewProfile => 'Prikaži profil';

  @override
  String get dmVoiceCall => 'Započni glasovni poziv';

  @override
  String get incomingVoiceCallTitle => 'Dolazni glasovni poziv';

  @override
  String get incomingVoiceCallAccept => 'Prihvati';

  @override
  String get incomingVoiceCallDecline => 'Odbij';

  @override
  String get incomingVoiceCallLabel => 'Dolazni poziv';

  @override
  String get incomingVoiceCallIgnore => 'Zanemari';

  @override
  String get directVoiceCallNotEligible =>
      'Ovaj poziv se trenutačno ne može pokrenuti. Pokušajte ponovno za trenutak.';

  @override
  String get voiceJoinCallFailed =>
      'Nismo se mogli povezati s ovim pozivom. Provjerite svoju vezu i pokušajte ponovno.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Nismo se mogli pridružiti ovom pozivu. Provjerite svoju vezu i pokušajte ponovno.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Nije moguće ažurirati ovaj poziv na poslužitelju. Provjerite svoju vezu i pokušajte ponovno.';

  @override
  String get dmAddNote => 'Dodaj bilješku';

  @override
  String get dmEditGroup => 'Uredi grupu';

  @override
  String get dmInviteToCommunity => 'Pozovi u zajednicu';

  @override
  String get dmBlock => 'Blokiraj';

  @override
  String get dmLeaveGroup => 'Napusti grupu';

  @override
  String dmInviteSentFor(String communityName) {
    return 'Pozivnica za $communityName poslana';
  }

  @override
  String get dmInviteSendFailed =>
      'Nije moguće poslati pozivnicu. Pokušajte ponovno.';

  @override
  String dmGroupMemberCount(int count) {
    return '$count člana';
  }

  @override
  String get dmMuteFor15Min => 'Na 15 minuta';

  @override
  String get dmMuteFor30Min => 'Na 30 minuta';

  @override
  String get dmMuteFor1Hour => 'Na 1 sat';

  @override
  String get dmMuteFor3Hours => 'Na 3 sata';

  @override
  String get dmMuteFor4Hours => 'Na 4 sata';

  @override
  String get dmMuteFor8Hours => 'Na 8 sati';

  @override
  String get dmMuteFor24Hours => 'Na 24 sata';

  @override
  String get dmMuteFor3Days => 'Na 3 dana';

  @override
  String get dmMuteForever => 'Dok ga ponovno ne uključim';

  @override
  String get dmPinGroupDm => 'Prikvači grupnu izravnu poruku';

  @override
  String get dmUnpinGroupDm => 'Otkvači grupnu izravnu poruku';

  @override
  String get dmUnnamedGroup => 'Neimenovana grupa';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grupa $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Dodaj izravnu poruku u favorite';

  @override
  String get dmUnfavoriteDm => 'Ukloni izravnu poruku iz favorita';

  @override
  String get dmFavoriteGroupDm => 'Dodaj grupnu izravnu poruku u favorite';

  @override
  String get dmUnfavoriteGroupDm => 'Ukloni grupnu izravnu poruku iz favorita';

  @override
  String get dmChangeFriendNickname => 'Promijeni nadimak prijatelja';

  @override
  String get dmRemoveFriend => 'Ukloni prijatelja';

  @override
  String get dmAddFriend => 'Dodaj prijatelja';

  @override
  String get dmAcceptFriendRequest => 'Prihvati zahtjev za prijateljstvo';

  @override
  String get dmIgnoreFriendRequest => 'Zanemari zahtjev za prijateljstvo';

  @override
  String get dmFriendRequestSent => 'Zahtjev za prijateljstvo poslan';

  @override
  String get dmUnblock => 'Deblokiraj';

  @override
  String get dmDebugUser => 'Otklanjanje pogrešaka korisnika';

  @override
  String get dmDebugChannel => 'Otklanjanje pogrešaka kanala';

  @override
  String get dmDebugCategory => 'Debugiraj kategoriju';

  @override
  String get dmPinned => 'Prikvačena izravna poruka';

  @override
  String get dmUnpinned => 'Izravna poruka je otkvačena';

  @override
  String get dmMuted => 'Nečujni DM';

  @override
  String get dmUnmuted => 'DM je uključen';

  @override
  String get dmRemoveFriendConfirmTitle => 'Ukloni prijatelja';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Jesi li siguran da želiš ukloniti $username kao prijatelja?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blokiraj korisnika';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Jesi li siguran/sigurna da želiš blokirati korisnika $username? Neće ti moći slati poruke niti slati zahtjeve za prijateljstvo.';
  }

  @override
  String get dmFriendRequestSentToast => 'Zahtjev za prijateljstvo poslan';

  @override
  String get dmFriendRequestFailed =>
      'Neuspješno slanje zahtjeva za prijateljstvo';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Neuspješno prihvaćanje zahtjeva za prijateljstvo';

  @override
  String get dmRemoveFriendFailed => 'Nije uspjelo uklanjanje prijatelja';

  @override
  String get dmBlockFailed => 'Nije uspjelo blokiranje korisnika';

  @override
  String get dmUnblockFailed => 'Neuspješno deblokiranje korisnika';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Neuspješno odbijanje zahtjeva za prijateljstvo';

  @override
  String get dmAddFriends => 'Dodaj prijatelje';

  @override
  String get addFriendSheetTitle => 'Dodaj prijatelja';

  @override
  String get addFriendUsernameHint => 'Korisničko ime#0000';

  @override
  String get addFriendUsernameLabel => 'Korisničko ime prijatelja';

  @override
  String get addFriendSendRequest => 'Pošalji zahtjev';

  @override
  String get addFriendNoUserFound =>
      'Nije pronađen korisnik s tim korisničkim imenom.';

  @override
  String get addFriendInvalidUsername =>
      'Unesite valjano korisničko ime (KorisničkoIme#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Zahtjev za prijateljstvo poslan';

  @override
  String get addFriendClaimTitle => 'Preuzmite svoj račun';

  @override
  String get addFriendClaimDescription =>
      'Preuzmite svoj račun za slanje zahtjeva za prijateljstvo.';

  @override
  String get addFriendVerifyTitle => 'Potvrdite svoju e-poštu';

  @override
  String get addFriendVerifyDescription =>
      'Morate potvrditi svoju adresu e-pošte prije nego što možete slati zahtjeve za prijateljstvo.';

  @override
  String get addFriendVerifyEmail => 'Potvrdite e-poštu';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Dolazni zahtjevi za prijateljstvo ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Odjavni zahtjevi za prijateljstvo ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Dolazni zahtjev za prijateljstvo';

  @override
  String get addFriendOutgoingStatus => 'Zahtjev za prijateljstvo poslan';

  @override
  String get addFriendViewProfile => 'Prikaži profil';

  @override
  String get addFriendAccept => 'Prihvati';

  @override
  String get addFriendIgnore => 'Zanemari';

  @override
  String get addFriendAcceptTitle => 'Prihvati zahtjev za prijateljstvo';

  @override
  String get addFriendIgnoreTitle => 'Zanemari zahtjev za prijateljstvo';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Prihvatiti zahtjev za prijateljstvo od korisnika $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Zanemariti zahtjev za prijateljstvo od $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Poništi zahtjev';

  @override
  String get addFriendCancelRequestFailed =>
      'Nije moguće otkazati zahtjev za prijateljstvo. Pokušajte ponovno.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Trenutačno ne prihvaćaju zahtjeve za prijateljstvo.';

  @override
  String get addFriendUnblockFirst =>
      'Prvo ih deblokirajte da biste poslali zahtjev za prijateljstvo.';

  @override
  String get addFriendCannotSendToSelf =>
      'Ne možete poslati zahtjev za prijateljstvo samome sebi.';

  @override
  String get addFriendAlreadyFriends => 'Već ste prijatelji s ovim korisnikom.';

  @override
  String get addFriendClaimToSend =>
      'Dovršite registraciju za slanje zahtjeva za prijateljstvo.';

  @override
  String get addFriendVerifyToSend =>
      'Potvrdite svoju e-poštu prije slanja zahtjeva za prijateljstvo.';

  @override
  String get addFriendFriendsListFull =>
      'Vaš ili njihov popis prijatelja je pun. Uklonite nekoga i pokušajte ponovno.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sustav';

  @override
  String get emojiSearchPlaceholder => 'Pronađite emoji iz snova';

  @override
  String get emojiSearchEmpty => 'Nijedna emotikona ne odgovara vašoj pretrazi';

  @override
  String get emojiAutocompleteDefaultLabel => 'Zadani emoji';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Ovo je zadani emoji na $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Ova emoji sličica dolazi iz ove zajednice. Možeš je koristiti posvuda.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Ovo je prilagođeni emoji iz zajednice.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Ovo je prilagođeni emoji iz zajednice. Zatražite od autora pozivnicu za korištenje ovog emojija.';

  @override
  String get emojiInfoFromHeader => 'Ovaj emoji je iz';

  @override
  String get emojiInfoDiscoverableCommunity => 'Zajednica u Otkrivanju';

  @override
  String get emojiInfoPrivateCommunity => 'Privatna zajednica';

  @override
  String get emojiInfoVerifiedCommunity => 'Provjerena zajednica';

  @override
  String get emojiInfoAddToFavorites => 'Dodaj u favorite';

  @override
  String get emojiInfoRemoveFromFavorites => 'Ukloni iz favorita';

  @override
  String get emojiFrequentlyUsed => 'Često korišteno';

  @override
  String get emojiTabGifs => 'GIF-ovi';

  @override
  String get emojiTabMedia => 'Mediji';

  @override
  String get emojiTabStickers => 'Naljepnice';

  @override
  String get emojiTabEmojis => 'Emojiji';

  @override
  String get gifPickerSearch => 'Pretraži GIF-ove';

  @override
  String get gifPickerSearchKlipy => 'Pretraži KLIPY';

  @override
  String get gifPickerSearchTenor => 'Pretraži Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoriti';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Još nema omiljenih GIF-ova';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Dodajte GIF u favorite da biste ga vidjeli ovdje.';

  @override
  String get gifPickerTrending => 'GIF-ovi u trendu';

  @override
  String get gifPickerNoResultsTitle => 'Nema rezultata pretraživanja';

  @override
  String get gifPickerNoResultsDescription =>
      'Pokušajte s drugim pojmom za pretraživanje';

  @override
  String get gifPickerLoadFailedTitle => 'Nije moguće učitati GIF-ove';

  @override
  String get gifPickerLoadFailedBody => 'Provjerite vezu i pokušajte ponovno.';

  @override
  String get emojiCategoryPeople => 'Osobe';

  @override
  String get emojiCategoryNature => 'Priroda';

  @override
  String get emojiCategoryFood => 'Hrana i piće';

  @override
  String get emojiCategoryActivity => 'Aktivnosti';

  @override
  String get emojiCategoryTravel => 'Putovanja i mjesta';

  @override
  String get emojiCategoryObjects => 'Predmeti';

  @override
  String get emojiCategorySymbols => 'Simboli';

  @override
  String get emojiCategoryFlags => 'Zastave';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Otključaj $emojiCount iz $communityCount uz Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Nabavi Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Ne prikazuj ovo ponovno';

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
      other: '$count zajednica',
      one: '1 zajednica',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Upozorenje za vanjsku poveznicu';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Napuštate $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Vanjske poveznice mogu biti opasne. Molimo budite oprezni.';

  @override
  String get externalLinkWarningDestinationUrl => 'Odredišni URL:';

  @override
  String get externalLinksSectionTitle => 'Vanjske poveznice';

  @override
  String get externalLinksSectionDescription =>
      'Konfigurirajte kako se rukuje upozorenjima za vanjske poveznice.';

  @override
  String get externalLinkWarningTrustPrefix => 'Uvijek vjeruj ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — preskoči ovo upozorenje sljedeći put';

  @override
  String get externalLinkVisitSite => 'Posjeti stranicu';

  @override
  String get externalLinkTrustAllLabel => 'Vjeruj svim vanjskim poveznicama';

  @override
  String get externalLinkStripTrackingLabel =>
      'Ukloni parametre praćenja iz URL-ova';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatski uklanja parametre za praćenje (poput utm_source, fbclid, gclid) iz URL-ova u porukama koje šaljete. Poveznica se čisti prije nego što dođe do bilo koga drugog.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Vjerovati svim vanjskim poveznicama?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Time ćete vjerovati svim vanjskim poveznicama i preskočiti upozorenje za svaku domenu. Vaše postojeće pouzdane domene bit će zamijenjene. Ovo je manje sigurno.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Vjeruj svima';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Prestati vjerovati svim poveznicama?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Upozorenja za vanjske poveznice ponovno će se prikazati. Pouzdane domene morat ćete dodati pojedinačno.';

  @override
  String get externalLinkStopTrustingAllAction => 'Prestani vjerovati svima';

  @override
  String get externalLinkTrustedAllDescription =>
      'Sve vanjske poveznice su pouzdane. Upozorenja se neće prikazivati.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Imate $count pouzdanu domenu. Dodajte više označavanjem okvira prilikom posjeta vanjskim poveznicama.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Kad je omogućeno, neće se prikazivati upozorenja za vanjske poveznice. Ovo je manje sigurno.';

  @override
  String get imageFileTooLarge =>
      'Datoteka slike je prevelika. Odaberite datoteku manju od 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animirani avatari zahtijevaju Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animirani natpisi zahtijevaju Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animirani AVIF nije podržan';

  @override
  String get animatedAvifNotSupportedBody =>
      'Orezivanje i rotiranje animiranih AVIF datoteka još nije podržano. Ako nastavite, bit će učitana u izvornom obliku.';

  @override
  String get uploadAsIs => 'Učitaj kakav jest';

  @override
  String get croppingAnimatedNotSupported =>
      'Animiranih slika se još ne može obrezivati. Upotrijebit će se originalna datoteka.';

  @override
  String get cropAvatar => 'Obreži avatar';

  @override
  String get cropBanner => 'Obreži naslovnu sliku';

  @override
  String get skip => 'Preskoči';

  @override
  String get crop => 'Obreži';

  @override
  String get cropTouchHint =>
      'Pomiči prstima za zumiranje, povuci za premještanje';

  @override
  String get cropMouseHint =>
      'Povucite kutove za promjenu veličine, povucite unutra za premještanje';

  @override
  String get changeYourFluxerTag => 'Promijenite svoje korisničko ime';

  @override
  String get fluxerTagInputLabel => 'Korisničko ime';

  @override
  String get fluxerTagDescriptionBase =>
      'Korisnička imena mogu sadržavati samo slova (a-z, A-Z), brojeve (0-9) i podvlake. Kod korisničkih imena ne razlikuju se velika i mala slova.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Korisnička imena mogu sadržavati samo slova (a-z, A-Z), brojeve (0-9) i donje crtice. Korisnička imena ne razlikuju velika i mala slova. Možete odabrati bilo koji dostupni 4-znamenkasti tag od #0000 do #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Korisnička imena mogu sadržavati samo slova (a-z, A-Z), brojeve (0-9) i donje crtice. Korisnička imena ne razlikuju velika i mala slova. Možete odabrati bilo koji dostupan 4-znamenkasti tag od #0001 do #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Između $min i $max znakova';
  }

  @override
  String get validationAllowedChars =>
      'Samo slova (a-z, A-Z), brojevi (0-9) i podvlake (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Nabavite Plutonium za prilagodbu svoje oznake ili je zadržite prilikom promjene korisničkog imena';

  @override
  String get fluxerTagAlreadyTaken => 'Korisničko ime je već zauzeto';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Korisničko ime $username#$discriminator je već zauzeto. Nastavkom će se automatski ponovno odabrati vaš diskriminator.';
  }

  @override
  String get customTagIsTemporary => 'Privremena oznaka';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Vaša prilagođena 4-znamenkasta oznaka dostupna je samo dok je vaša Plutonium pretplata aktivna. Kada vaša pretplata istekne $date, vaša će se oznaka nakon 3-dnevnog razdoblja odgode vratiti na slučajno dodijeljeni broj.';
  }

  @override
  String get customTagTemporaryBody =>
      'Vaš prilagođeni 4-znamenkasti tag dostupan je samo dok je vaša Plutonium pretplata aktivna. Kada pretplata istekne, vaš će se tag nakon 3 dana prijelaznog razdoblja vratiti na slučajno dodijeljeni broj.';

  @override
  String get iUnderstandContinue => 'Razumijem, nastavi';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Ako spremite ovaj korisnički naziv, vaš prilagođeni 4-znamenkasti tag vratit će se na nasumični broj kada vaša Plutonium pretplata završi. Ako se vaša pretplata ne obnovi, imat ćete 3 dana prijelaznog roka prije nego što se tag promijeni.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Vaša prilagođena 4-znamenkasta oznaka (#$discriminator) aktivna je dok je vaša Plutonium pretplata aktivna. Ako vaša pretplata završi ili ne uspije obnoviti nakon 3-dnevnog razdoblja počeka, vaša će se oznaka vratiti na nasumični broj.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Prilagodi svoju 4-znamenkastu oznaku ili je zadrži prilikom promjene korisničkog imena';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Tvoja Plutonium proba istječe $date. Nadogradi kako bi zadržao svoj prilagođeni tag i zaradio značku na svom profilu.';
  }

  @override
  String get premiumTrialActive =>
      'Na Plutonium ste probnoj verziji. Nadogradite kako biste zadržali svoj prilagođeni tag i zaradili značku na svom profilu.';

  @override
  String get fluxerTagUpdated => 'Korisničko ime ažurirano';

  @override
  String get fluxerTagUpdateFailed =>
      'Neuspješno ažuriranje korisničkog imena. Molimo pokušajte ponovno.';

  @override
  String get continueAction => 'Nastavi';

  @override
  String get profileCustomizationTitle => 'Prilagodba profila';

  @override
  String get profileCustomizationDescription =>
      'Uredite izgled profila i pogledajte pregled uživo';

  @override
  String get usernameLabel => 'Korisničko ime';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Preuzmite svoj račun da biste promijenili korisničko ime';

  @override
  String get changeFluxerTag => 'Promijeni korisničko ime';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Prilagodi svoju četveroznamenkastu oznaku (#$discriminator) po želji uz Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Promijeni svoje korisničko ime i četveroznamenkasti tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Vaša prilagođena oznaka (#$discriminator) povezana je s vašom Plutonium pretplatom i vratit će se na nasumičnu oznaku ako istekne.';
  }

  @override
  String get displayNameLabel => 'Ime za prikaz';

  @override
  String get pronounsLabel => 'Zamjenice';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Promijeni avatar';

  @override
  String get removeAvatar => 'Ukloni avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maksimalno 10 MB. Preporučeno: 512×512 px';

  @override
  String get bannerLabel => 'Naslovna slika';

  @override
  String get changeBanner => 'Promijeni naslovnu sliku';

  @override
  String get removeBanner => 'Ukloni naslovnu sliku';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maksimalno 10 MB. Minimalno: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Boja naglaska';

  @override
  String get accentColorDescription =>
      'Prilagođava boju obruba i naslovne slike na vašem profilu';

  @override
  String get aboutMeLabel => 'O meni';

  @override
  String get aboutMeHelperText =>
      'Možete koristiti poveznice, emojije i Markdown.';

  @override
  String get emojiPickerTitle => 'Emojii';

  @override
  String get plutoniumBadgePrivacyTitle => 'Privatnost Plutonium značke';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Upravljajte prikazom svoje Plutonium značke drugima';

  @override
  String get hidePlutoniumBadgeLabel => 'Potpuno sakrij Plutonium bedž';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Potpuno sakrij svoju Plutonium značku od drugih korisnika';

  @override
  String get hidePlutoniumPurchaseDate => 'Sakrij datum kupnje Plutoniuma';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Sakrij datum kupnje Plutoniuma ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Uklonite datum prve kupnje Plutoniuma s vaše značke';

  @override
  String get maskVisionaryAsSubscription => 'Maskiraj Visionary kao pretplatu';

  @override
  String get maskVisionaryDescription =>
      'Prikaži svoj Visionary kao običnu pretplatu';

  @override
  String get hideVisionaryIdBadge => 'Sakrij značku Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Sakrij Visionary ID bedž (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Uklonite svoju značku Visionary ID';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Na Plutonium ste pretplati — vaša pretplata počinje $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Vaša pretplata automatski započinje kada završi besplatno probno razdoblje. Nije potrebna nikakva radnja.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Na Plutonium pretplati ste na probno razdoblje koje istječe $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Na Plutonium ste pretplati';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maksimalno 10 MB. Preporučeno: 512×512 px. Animiranih avatara (GIF) zahtijeva Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Prilagodite svoj profil statičnom ili animiranom slikom natpisa kako biste ga istaknuli.';

  @override
  String get getPlutonium => 'Nabavi Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Kupnje unutar aplikacije još nisu dostupne na ovoj platformi. Pratite nas — uskoro!';

  @override
  String get profilePreviewLabel => 'Pretpregled';

  @override
  String get profilePreviewMessage => 'Poruka';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Član ${productName}a od';
  }

  @override
  String get unclaimedAccountTitle => 'Nepreuzet račun';

  @override
  String get unclaimedAccountDescription =>
      'Račun još nije preuzet. Bez e-pošte i lozinke mogli biste izgubiti pristup. Preuzmite svoj račun sada kako biste ga osigurali.';

  @override
  String get claimAccount => 'Preuzmi račun';

  @override
  String get profileTypeLabel => 'Vrsta profila';

  @override
  String get profileTypeGlobal => 'Globalni profil';

  @override
  String get profileTypeGuildDescription =>
      'Uređujete svoj profil za ovu zajednicu. Ovaj će profil biti vidljiv samo u ovoj zajednici i nadjačat će vaš globalni profil.';

  @override
  String get communityNicknameLabel => 'Nadimak u zajednici';

  @override
  String get perGuildPremiumUpsellText =>
      'Prilagođavanje vašeg avatara, banera, naglasne boje i biografije za pojedinačne zajednice zahtijeva Plutonium. Nadimak i zamjenice zajednice besplatni su za sve.';

  @override
  String get avatarModeInherit => 'Koristi globalni profil';

  @override
  String get avatarModeCustom => 'Koristi prilagođenu sliku';

  @override
  String get avatarModeUnset => 'Ne prikazuj';

  @override
  String get profileSavedToast => 'Profil ažuriran';

  @override
  String get profileEditButton => 'Uredi profil';

  @override
  String get profileNoteLabel => 'Bilješka';

  @override
  String get profileNoteVisibility => '(vidljivo samo vama)';

  @override
  String get profileNoteEmpty => 'Još nema bilješke.';

  @override
  String get sudoTitle => 'Potvrdi svoj identitet';

  @override
  String get sudoDescription =>
      'Ova radnja zahtijeva provjeru da biste nastavili.';

  @override
  String get sudoAuthenticatorCode => 'Kôd za autentifikaciju';

  @override
  String get sudoMethodPassword => 'Lozinka';

  @override
  String get sudoMethodTotp => 'Autentifikator';

  @override
  String get sudoVerificationFailed =>
      'Provjera nije uspjela. Molimo pokušajte ponovno.';

  @override
  String get securityAccountTitle => 'Račun';

  @override
  String get securityAccountDescription =>
      'Upravljajte svojom e-poštom, lozinkom i postavkama računa';

  @override
  String get securitySectionTitle => 'Sigurnost';

  @override
  String get securitySectionDescription =>
      'Zaštitite svoj račun dvofaktorskom provjerom i passkeyevima';

  @override
  String get securityLoginEmailSectionTitle => 'Postavke e-pošte';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Upravljajte adresom e-pošte koju koristite za prijavu na $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Adresa e-pošte';

  @override
  String get securityLoginNoEmailSet => 'Adresa e-pošte nije postavljena';

  @override
  String get securityLoginChangeEmail => 'Promijeni e-poštu';

  @override
  String get securityLoginAddEmail => 'Dodaj e-poštu';

  @override
  String get securityLoginReveal => 'Otkrij';

  @override
  String get securityLoginHide => 'Sakrij';

  @override
  String get securityLoginPasswordSectionTitle => 'Lozinka';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Promijenite svoju lozinku kako biste zaštitili svoj račun';

  @override
  String get securityLoginCurrentPasswordLabel => 'Trenutna lozinka';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Zadnja promjena: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Zadnja promjena: Nikad';

  @override
  String get securityLoginNoPasswordSet => 'Lozinka nije postavljena';

  @override
  String get securityLoginChangePassword => 'Promijeni lozinku';

  @override
  String get securityLoginSetPassword => 'Postavi lozinku';

  @override
  String get passwordChangeTitle => 'Promijeni lozinku';

  @override
  String get passwordChangeIntroDescription =>
      'Poslat ćemo vam kod za provjeru na vašu e-adresu kako bismo potvrdili vaš identitet prije promjene lozinke.';

  @override
  String get passwordChangeStart => 'Pokreni';

  @override
  String get passwordChangeVerifyTitle => 'Potvrdite svoju e-poštu';

  @override
  String get passwordChangeVerifyDescription =>
      'Unesite verifikacijski kod poslan na vašu e-poštu.';

  @override
  String get passwordChangeVerificationCode => 'Kod za provjeru';

  @override
  String get passwordChangeVerify => 'Potvrdi';

  @override
  String get passwordChangeNewPasswordTitle => 'Postavi novu lozinku';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Unesite svoju novu zaporku u nastavku.';

  @override
  String get passwordChangeNewPassword => 'Nova lozinka';

  @override
  String get passwordChangeConfirmPassword => 'Potvrdite novu lozinku';

  @override
  String get passwordChangeSubmit => 'Promijeni lozinku';

  @override
  String get passwordChangeSuccess => 'Lozinka promijenjena';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Lozinke se ne podudaraju';

  @override
  String get passwordChangeInvalidCode => 'Nevažeći ili istekli kod';

  @override
  String get emailChangeTitle => 'Promijeni e-poštu';

  @override
  String get emailChangeIntroDescription =>
      'Poslat ćemo kodove za provjeru kako bismo potvrdili vaš identitet prije promjene adrese e-pošte.';

  @override
  String get emailChangeStart => 'Pokreni';

  @override
  String get emailChangeVerifyOriginalTitle => 'Potvrdi trenutnu e-poštu';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Unesite verifikacijski kod poslan na vašu trenutnu e-adresu.';

  @override
  String get emailChangeNewEmailTitle => 'Unesite novu e-adresu';

  @override
  String get emailChangeNewEmailDescription =>
      'Unesite novu e-adresu koju želite koristiti.';

  @override
  String get emailChangeNewEmailLabel => 'Nova e-pošta';

  @override
  String get emailChangeNewEmailSubmit => 'Pošalji kod za provjeru';

  @override
  String get emailChangeVerifyNewTitle => 'Potvrdi novu e-poštu';

  @override
  String get emailChangeVerifyNewDescription =>
      'Unesite verifikacijski kod poslan na vašu novu e-adresu.';

  @override
  String get emailChangeSuccess => 'E-pošta promijenjena';

  @override
  String get emailChangeInvalidCode => 'Nevažeći ili istekli kod';

  @override
  String get resend => 'Ponovno pošalji';

  @override
  String resendCountdown(int seconds) {
    return 'Ponovno pošalji (${seconds}s)';
  }

  @override
  String get verificationCode => 'Kod za provjeru';

  @override
  String get verify => 'Potvrdi';

  @override
  String get enable => 'Omogući';

  @override
  String get disable => 'Onemogući';

  @override
  String get delete => 'Izbriši';

  @override
  String get save => 'Spremi';

  @override
  String get securityTfaSectionTitle => 'Dvostruka provjera autentičnosti';

  @override
  String get securityTfaSectionDescription =>
      'Dodajte još jedan sloj sigurnosti svom računu';

  @override
  String get securityTfaAuthenticatorApp =>
      'Aplikacija za provjeru autentičnosti';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Dvostruka provjera autentičnosti je omogućena';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Upotrijebite aplikaciju za autentifikaciju koja generira kodove za dvostruku provjeru autentičnosti';

  @override
  String get securityTfaBackupCodes => 'Rezervni kodovi';

  @override
  String get securityTfaBackupCodesDescription =>
      'Pregledajte svoje rezervne kodove za oporavak računa i upravljajte njima';

  @override
  String get securityTfaViewCodes => 'Prikaži kodove';

  @override
  String get securityPasskeysSectionTitle => 'Pristupni ključevi';

  @override
  String get securityPasskeysSectionDescription =>
      'Koristite pristupne ključeve za prijavu bez lozinke i dvostruku provjeru autentičnosti';

  @override
  String get securityPasskeysRegistered => 'Registrirani pristupni ključevi';

  @override
  String get securityPasskeysNone => 'Nema registriranih prolaznih ključeva';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sigurnosna ključa',
      one: 'sigurnosni ključ',
    );
    return '$count $_temp0 registrirano (maks. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Dodaj pristupni ključ';

  @override
  String securityPasskeysAdded(String date) {
    return 'Dodano: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Zadnji put korišteno: $date';
  }

  @override
  String get securityPasskeysRename => 'Preimenuj';

  @override
  String get securityPasskeysDeleteTitle => 'Izbriši pristupni ključ';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Jeste li sigurni da želite izbrisati pristupni ključ \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Imenujte pristupni ključ';

  @override
  String get securityPasskeyNameLabel => 'Naziv pristupnog ključa';

  @override
  String get securityPasskeyNameHint =>
      'npr. YubiKey, iPhone, poslovno računalo';

  @override
  String get securityPhoneSectionTitle => 'Broj telefona';

  @override
  String get securityPhoneSectionDescription =>
      'Upravljajte svojim telefonskim brojem.';

  @override
  String get securityPhoneLabel => 'Broj telefona';

  @override
  String get securityPhoneNone => 'Nije dodan broj telefona.';

  @override
  String get securityPhoneAdd => 'Dodaj telefon';

  @override
  String get securityPhoneRemove => 'Ukloni';

  @override
  String get securityPhoneRemoveTitle => 'Ukloni broj telefona';

  @override
  String get securityPhoneRemoveDescription =>
      'Jeste li sigurni da želite ukloniti svoj broj telefona?';

  @override
  String get securityPhoneRemoved => 'Broj telefona uklonjen';

  @override
  String get securityClaimTitle => 'Sigurnosne značajke';

  @override
  String get securityClaimDescription =>
      'Preuzmite svoj račun za pristup sigurnosnim značajkama kao što su dvostruka provjera autentičnosti i pristupni ključevi.';

  @override
  String get securityVerifyEmailRequired =>
      'Morate potvrditi svoju e-adresu prije nego što možete postaviti dvofaktorsku provjeru autentičnosti ili pristupne ključeve.';

  @override
  String get totpEnableTitle =>
      'Postavite aplikaciju za provjeru autentičnosti';

  @override
  String get totpEnableDescription =>
      'Skenirajte QR kôd svojom aplikacijom za provjeru autentičnosti kako biste generirali kodove za dvofaktorsku provjeru autentičnosti.';

  @override
  String get totpEnableCodeLabel => 'Kod';

  @override
  String get totpEnableCodeHint =>
      'Unesite 6-znamenkasti kod iz svoje aplikacije za provjeru autentičnosti';

  @override
  String get totpEnableSuccess => 'Dvoslojna autentifikacija je omogućena';

  @override
  String get totpDisableTitle => 'Ukloni aplikaciju za provjeru autentičnosti';

  @override
  String get totpDisableDescription =>
      'Unesite 6-znamenkasti kod iz svoje aplikacije za provjeru autentičnosti da biste onemogućili dvofaktorsku provjeru autentičnosti.';

  @override
  String get totpDisableSuccess =>
      'Dvostruka provjera autentičnosti onemogućena';

  @override
  String get backupCodesTitle => 'Rezervni kodovi';

  @override
  String get backupCodesWarning =>
      'Ako izgubite pristup svojoj aplikaciji za provjeru autentičnosti i nemate ove kodove, trajno ćete biti zaključani iz svog računa. Preuzmite ih ili ih kopirajte sada i pohranite ih na sigurno mjesto.';

  @override
  String get backupCodesDownload => 'Preuzmi';

  @override
  String get backupCodesCopy => 'Kopiraj';

  @override
  String get backupCodesCopied => 'Sigurnosni kodovi kopirani u međuspremnik';

  @override
  String get backupCodesAcknowledge =>
      'Preuzeo/la sam ili kopirao/la svoje sigurnosne kodove i pohranio/la ih na sigurno mjesto.';

  @override
  String get backupCodesDone => 'Gotovo';

  @override
  String get backupCodesViewTitle => 'Prikaži rezervne kodove';

  @override
  String get backupCodesViewDescription =>
      'Možda će biti potrebna provjera prije pregledavanja sigurnosnih kodova.';

  @override
  String get phoneAddTitle => 'Dodaj broj telefona';

  @override
  String get phoneAddLabel => 'Broj telefona';

  @override
  String get phoneAddHint => 'Unesite svoj telefonski broj';

  @override
  String get phoneAddFooter =>
      'Poslat ćemo SMS kod kada bude dostupan. Vaš broj nije povezan s vašim računom. Zadržavamo samo enkriptiranu oznaku, bez korisničkog ID-a, kako bismo omogućili najviše 2 provjere u otprilike 30 dana.';

  @override
  String get phoneAddSendCode => 'Pošalji kod';

  @override
  String get phoneVerifyTitle => 'Potvrdite telefonski broj';

  @override
  String get phoneVerifyDescription =>
      'Unesite verifikacijski kod poslan na vaš broj telefona.';

  @override
  String get phoneAddSuccess => 'Broj telefona potvrđen';

  @override
  String get phoneCountryLabel => 'Država';

  @override
  String get phoneSearchCountries => 'Pretražite države...';

  @override
  String get phoneNumberRequired => 'Broj telefona je obavezan';

  @override
  String get phoneEnterValidNumber => 'Unesite valjani broj mobilnog telefona.';

  @override
  String get phoneCannotBeUsed =>
      'Ovaj telefonski broj ne može se koristiti. Pokušajte s drugim brojem mobitela ili se obratite podršci.';

  @override
  String get phoneAlreadyUsed =>
      'Ovaj je telefonski broj već korišten. Pokušajte s drugim brojem ili se obratite podršci.';

  @override
  String get phoneCodeDidNotWork =>
      'Taj kôd ne radi. Provjerite ga i pokušajte ponovno.';

  @override
  String get phoneTooManyAttempts =>
      'Previše pokušaja. Pričekajte malo, pa pokušajte ponovno.';

  @override
  String get phoneSmsUnavailable =>
      'SMS provjera trenutačno nije dostupna. Pokušajte ponovno kasnije ili se obratite podršci.';

  @override
  String get phoneNotEligible =>
      'Telefonska provjera nije dostupna za ovaj račun. Upotrijebite drugu metodu ili se obratite podršci.';

  @override
  String get phoneSomethingWentWrong =>
      'Nešto je pošlo po zlu. Pokušajte ponovno.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Slanje SMS-a na ovaj broj telefona je preskupo, stoga nam ga morate poslati vi. Također se možete obratiti podršci kako bismo uklonili ovaj zahtjev s vašeg računa.';

  @override
  String get phoneInboundDefaultDescription =>
      'Morate nam poslati SMS kako biste potvrdili svoj telefonski broj.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Otvorite aplikaciju za poruke na svom telefonu i stvorite novu tekstualnu poruku.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Pošalji kod $code na $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Pričekajte da primimo vašu poruku. Ovo može potrajati minutu.';

  @override
  String get phoneInboundGetNewCode => 'Zatraži novi kôd';

  @override
  String get phoneInboundChallengeCodeLabel => 'Kod za slanje';

  @override
  String get phoneInboundOurNumberLabel => 'Pošalji na';

  @override
  String get requiredActionTitle => 'Potrebna je provjera računa';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Dovršite potrebnu provjeru da biste nastavili koristiti $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Vaša registracija zahtijeva dodatnu provjeru radi zaštite od neželjene pošte prije nego što možete nastaviti.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Potvrdite svoju e-poštu ili telefon kako biste nastavili koristiti $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Dovršite potrebne korake za potvrdu e-pošte i telefona u nastavku kako biste nastavili koristiti $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Odaberite metodu provjere';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Dovršite jedan od načina provjere u nastavku kako biste nastavili koristiti $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Koristi e-poštu';

  @override
  String get requiredActionUsePhone => 'Koristi telefon';

  @override
  String get requiredActionCheckEmailTitle => 'Provjerite e-poštu';

  @override
  String get requiredActionCheckEmailDescription =>
      'Poslali smo poveznicu za provjeru na vašu e-adresu. Otvorite je za nastavak.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Ponovno pošalji e-poruku za potvrdu';

  @override
  String get requiredActionVerificationEmailSent =>
      'E-pošta za potvrdu poslana. Provjerite svoju pristiglu poštu.';

  @override
  String get requiredActionSignOut => 'Odjava';

  @override
  String get dangerZoneSectionTitle => 'Opasna zona';

  @override
  String get dangerZoneSectionDescription => 'Nepovratne i destruktivne radnje';

  @override
  String get dangerZoneDisableTitle => 'Deaktiviraj račun';

  @override
  String get dangerZoneDisableDescription =>
      'Privremeno deaktivirajte svoj račun. Možete ga kasnije ponovno aktivirati prijavom.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Onemogućavanje vašeg računa odjavit će vas sa svih sesija. Račun možete ponovno omogućiti u bilo kojem trenutku ponovnom prijavom.';

  @override
  String get dangerZoneDeleteTitle => 'Izbriši račun';

  @override
  String get dangerZoneDeleteDescription =>
      'Trajno izbrišite svoj račun i sve povezane podatke. Ova se radnja ne može poništiti.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Otkažite svoju aktivnu Plutonium pretplatu u postavkama Plutoniuma prije brisanja računa.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Nije moguće izbrisati račun';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Ne možete izbrisati svoj račun dok ste vlasnik zajednica. Prvo prenesite vlasništvo nad sljedećim zajednicama:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'i još $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Za prijenos vlasništva, idite na $settingsPath i upotrijebite opciju prijenosa vlasništva.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Jeste li sigurni da želite izbrisati svoj račun? Ovom radnjom vaš će račun biti zakazan za trajno brisanje.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Brisanje možete otkazati u roku od 14 dana';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Nakon 14 dana vaš će račun biti trajno izbrisan';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Nakon obrade brisanja nećete moći vratiti pristup svom računu';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Nećete moći izbrisati poslane poruke nakon što izbrišete račun';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Ako želite izvesti svoje podatke ili izbrisati svoje poruke, molimo posjetite odjeljak Nadzorna ploča za privatnost u Korisničkim postavkama prije nastavka.';

  @override
  String get claimAccountTitle => 'Preuzmite svoj račun';

  @override
  String get claimAccountDescription =>
      'Preuzmite svoj račun dodavanjem e-pošte i lozinke. Poslat ćemo vam kod za provjeru kako bismo potvrdili vašu e-poštu prije dovršetka.';

  @override
  String get claimAccountEmailLabel => 'E-pošta';

  @override
  String get claimAccountPasswordLabel => 'Lozinka';

  @override
  String get claimAccountSendCode => 'Pošalji kod';

  @override
  String get claimAccountVerifyDescription =>
      'Unesite kod koji smo vam poslali e-poštom da biste je potvrdili. Vaša će lozinka biti postavljena nakon što se kod potvrdi.';

  @override
  String get claimAccountSuccess => 'Račun uspješno preuzet';

  @override
  String get importantInformation => 'Važne informacije:';

  @override
  String get genericError => 'Dogodila se pogreška';

  @override
  String get networkErrorMessage =>
      'Nešto je pošlo po zlu. Molimo pokušajte ponovno.';

  @override
  String get invalidCode => 'Neispravan kod';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count godine',
      one: 'prije 1 godine',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije # mjeseci',
      one: 'prije 1 mjeseca',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count dana',
      one: 'prije 1 dan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count sata',
      one: 'prije 1 sata',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count minute',
      one: 'prije 1 minute',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count tjedna',
      one: 'prije tjedan dana',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count minuta',
      one: 'za 1 minutu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count sata',
      one: 'za 1 sat',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count dana',
      one: 'za 1 dan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count tjedna',
      one: 'za 1 tjedan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count mjeseci',
      one: 'za 1 mjesec',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'za $count godina',
      one: 'za 1 godinu',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'upravo sada';

  @override
  String get authorizedAppsTitle => 'Autorizirane aplikacije';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Ovim su aplikacijama odobren pristup vašem $productName računu.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Nema autoriziranih aplikacija';

  @override
  String get authorizedAppsEmptyDescription =>
      'Niste ovlastili nijednu aplikaciju za pristup svojem računu.';

  @override
  String get authorizedAppsLoadError =>
      'Učitavanje autoriziranih aplikacija nije uspjelo';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizirano $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Dopuštenja odobrena';

  @override
  String get authorizedAppsRevoke => 'Opozovi';

  @override
  String get authorizedAppsRevokeTitle => 'Oduzmi pristup aplikaciji';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Jeste li sigurni da želite opozvati pristup za $appName? Ova aplikacija više neće imati pristup vašem računu.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Pristupite osnovnim informacijama profila (korisničko ime, avatar itd.)';

  @override
  String get authorizedAppsScopeEmail => 'Prikaži svoju adresu e-pošte';

  @override
  String get authorizedAppsScopeGuilds => 'Pregledajte zajednice čiji ste član';

  @override
  String get authorizedAppsScopeConnections => 'Pregled povezanih računa';

  @override
  String get authorizedAppsScopeBot =>
      'Dodajte bota zajednici s traženim dopuštenjima';

  @override
  String get authorizedAppsScopeAdmin => 'Pristupite administrativnim točkama';

  @override
  String get applicationsTitle => 'Aplikacije';

  @override
  String get applicationsCreate => 'Stvori aplikaciju';

  @override
  String get applicationsCreateSubmit => 'Stvori';

  @override
  String get applicationsCreateClaimTooltip =>
      'Preuzmite svoj račun za izradu aplikacija.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Pročitajte dokumentaciju ($domain)';
  }

  @override
  String get applicationsLoadError => 'Nije moguće učitati aplikacije';

  @override
  String get applicationsLoadErrorDescription =>
      'Provjerite vezu i pokušajte ponovno.';

  @override
  String get applicationsEmptyTitle => 'Još nema aplikacija';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Izradite svoju prvu aplikaciju kako biste počeli koristiti $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Stvoreno $date';
  }

  @override
  String get applicationsName => 'Naziv aplikacije';

  @override
  String get applicationsNameHint => 'Moja aplikacija';

  @override
  String get applicationsNameRequired => 'Naziv aplikacije je obavezan';

  @override
  String get applicationsBackToList => 'Natrag na popis';

  @override
  String get applicationsDetailLoadError =>
      'Nije moguće učitati ovu aplikaciju';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Pokušajte ponovno ili se vratite na popis aplikacija.';

  @override
  String get applicationsId => 'ID aplikacije';

  @override
  String get applicationsCopyId => 'Kopiraj ID';

  @override
  String get applicationsSecretsTitle => 'Tajne i tokeni';

  @override
  String get applicationsSecretsDescription =>
      'Čuvajte ih na sigurnom. Ponovno generiranje prekinut će postojeće integracije.';

  @override
  String get applicationsClientSecret => 'Klijentska tajna';

  @override
  String get applicationsBotToken => 'Token bota';

  @override
  String get applicationsRegenerate => 'Ponovno generiraj';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Ponovno generirati klijentsku tajnu?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Ponovno generirati token bota?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Ponovno generiranje poništit će trenutačnu tajnu. Ažurirajte sav kôd koji koristi staru vrijednost.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Ponovno generiranje poništit će trenutačni token. Ažurirajte sav kôd koji koristi staru vrijednost.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Klijentska tajna je ponovno generirana. Ažurirajte sav kod koji koristi staru tajnu.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Token bota je ponovno generiran. Ažurirajte sav kod koji koristi stari token.';

  @override
  String get applicationsRegenerateFailed =>
      'Nije moguće ponovno generirati tajnu';

  @override
  String get applicationsInfoTitle => 'Informacije o aplikaciji';

  @override
  String get applicationsInfoDescription =>
      'Osnovne postavke i dopušteni URI-ji za preusmjeravanje.';

  @override
  String get applicationsPublicBot => 'Javni bot';

  @override
  String get applicationsPublicBotDescription =>
      'Dopusti bilo kome da pozove ovog bota u svoje zajednice.';

  @override
  String get applicationsRequireCodeGrant => 'Zahtijevaj OAuth2 dodjelu koda';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Zahtijeva URI za preusmjeravanje i autorizacijski kod prilikom pozivanja ovog bota.';

  @override
  String get applicationsRedirectUris => 'URI-ji za preusmjeravanje';

  @override
  String get applicationsAddRedirect => 'Dodaj preusmjeravanje';

  @override
  String get applicationsDeleteRedirect => 'Izbriši URI za preusmjeravanje';

  @override
  String get applicationsBotProfileTitle => 'Profil bota';

  @override
  String get applicationsBotProfileDescription =>
      'Avatar, oznaka i detalji bogatog profila za vašeg bota.';

  @override
  String get applicationsBotAvatar => 'Avatar bota';

  @override
  String get applicationsUsernameRequired => 'Korisničko ime je obavezno';

  @override
  String get applicationsUsernameTooLong =>
      'Korisničko ime mora imati najviše 32 znaka';

  @override
  String get applicationsUsernameInvalid =>
      'Korisničko ime može sadržavati samo slova, brojeve i podvlake';

  @override
  String get applicationsBotUsername => 'Korisničko ime bota';

  @override
  String get applicationsDiscriminator => 'Diskriminator';

  @override
  String get applicationsBotBio => 'Opis bota';

  @override
  String get applicationsBotBioHint =>
      'Koristan bot koji radi nevjerojatne stvari!';

  @override
  String get applicationsNoBotBanner => 'Nema naslovne slike bota';

  @override
  String get applicationsFriendlyBot => 'Prijateljski bot';

  @override
  String get applicationsFriendlyBotDescription =>
      'Dopusti korisnicima slanje zahtjeva za prijateljstvo ovom botu radi ručnog odobrenja.';

  @override
  String get applicationsManualFriendApproval =>
      'Zahtijevaj ručno odobravanje zahtjeva za prijateljstvo';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Zahtjevi za prijateljstvo ovom botu zahtijevaju ručno odobrenje.';

  @override
  String get applicationsOauthBuilderTitle => 'OAuth2 alat za izradu URL-ova';

  @override
  String get applicationsOauthBuilderDescription =>
      'Izradite URL za autorizaciju s opsezima i dopuštenjima.';

  @override
  String get applicationsScopes => 'Opsezi';

  @override
  String get applicationsRedirectUri => 'URI za preusmjeravanje';

  @override
  String get applicationsSelectRedirectUri =>
      'Odaberite URI za preusmjeravanje';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'URI za preusmjeravanje je obavezan jer ovaj bot zahtijeva OAuth2 dodjelu koda.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'URI za preusmjeravanje je obavezan kada se ne koristi samo opseg bota.';

  @override
  String get applicationsBotPermissions => 'Dopuštenja bota';

  @override
  String get applicationsAuthorizeUrl => 'URL za autorizaciju';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Odaberite opsege (i URI za preusmjeravanje ako je potrebno)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Kopiraj URL za autorizaciju';

  @override
  String get applicationsCopiedUrl => 'URL kopiran u međuspremnik';

  @override
  String get applicationsDangerTitle => 'Opasna zona';

  @override
  String get applicationsDangerSubtitle =>
      'Ovo se ne može poništiti. Uklanjanjem aplikacije briše se i njezin bot.';

  @override
  String get applicationsDangerHelper =>
      'Nakon brisanja, aplikacija i njezine vjerodajnice trajno se uklanjaju.';

  @override
  String get applicationsDelete => 'Izbriši aplikaciju';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Jeste li sigurni da želite izbrisati $name? Ova se radnja ne može poništiti. Svi povezani podaci, uključujući korisnika bota, bit će trajno izbrisani.';
  }

  @override
  String get applicationsDeleteFailed => 'Nije moguće izbrisati aplikaciju';

  @override
  String get applicationsUpdated => 'Aplikacija je uspješno ažurirana';

  @override
  String get applicationsNoChanges => 'Nema promjena za spremanje';

  @override
  String get applicationsSearchBots => 'Aplikacije i botovi';

  @override
  String get applicationsSearchBotsDescription =>
      'Stvarajte aplikacije i botove za svoj račun i upravljajte njima';

  @override
  String get applicationsSearchInfoDescription =>
      'Uredite osnove aplikacije i URI-je za preusmjeravanje';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Uredite botov avatar, oznaku, opis, natpis i ponašanje zahtjeva za prijateljstvo';

  @override
  String get applicationsSearchOauthDescription =>
      'Izradite URL za autorizaciju s opsezima, preusmjeravanjima i dopuštenjima bota';

  @override
  String get applicationsSearchSecretsDescription =>
      'Pregledajte i ponovno generirajte tajne klijenta i tokene botova';

  @override
  String get applicationsSearchBotsKeyword => 'Botovi';

  @override
  String get applicationsSearchDocumentation => 'Dokumentacija';

  @override
  String get privacyPendingDeletionTitle => 'Čeka brisanje';

  @override
  String get blockedUsersTitle => 'Blokirani korisnici';

  @override
  String get blockedUsersDescription =>
      'Blokirani korisnici ne mogu vam slati zahtjeve za prijateljstvo niti vam izravno slati poruke.';

  @override
  String get blockedUsersEmptyTitle => 'Nema blokiranih korisnika';

  @override
  String get blockedUsersEmptyDescription => 'Još nikoga niste blokirali.';

  @override
  String get blockedUsersLoadError =>
      'Nije uspjelo učitavanje blokiranih korisnika';

  @override
  String get blockedUsersUnblock => 'Deblokiraj';

  @override
  String get blockedUsersUnblockTitle => 'Deblokiraj korisnika';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Jeste li sigurni da želite deblokirati $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopiraj korisničko ime';

  @override
  String get blockedUsersCopyId => 'Kopiraj korisnički ID';

  @override
  String get userProfileLoadError => 'Nije moguće učitati profil';

  @override
  String get userProfileLoading => 'Učitavanje profila';

  @override
  String get userProfileRetry => 'Pokušaj ponovno';

  @override
  String get userProfileMessage => 'Poruka';

  @override
  String get userProfileVoiceCall => 'Glasovni poziv';

  @override
  String get userProfileVideoCall => 'Videopoziv';

  @override
  String get userProfileEditProfile => 'Uredi profil';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Osoblje ${productName}a';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Tim zajednice $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Partner ${productName}a';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Lovac na bugove ${productName}a';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return 'Plutonium od $productName';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Plutonium pretplatnik od $date';
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
    return '$productName Vizionar od $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID vizionara #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Zajednički prijatelji ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Zajedničke zajednice ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Zajednički prijatelji';

  @override
  String get userProfileMutualCommunitiesTitle => 'Zajedničke zajednice';

  @override
  String get userProfileNoMutualFriends => 'Nema zajedničkih prijatelja.';

  @override
  String get userProfileNoMutualCommunities => 'Nema zajedničkih zajednica.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Nadimak: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Otvori izravnu poruku';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Blokirali ste korisnika $username. Nećete moći slati poruke dok ga ne deblokirate.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Deblokiraj';

  @override
  String get userProfileOpenDm => 'Otvori izravnu poruku';

  @override
  String get userProfileNoteTitle => 'Bilješka';

  @override
  String get userProfileNoteVisibility => '(vidljivo samo vama)';

  @override
  String get userProfileNoteSave => 'Spremi';

  @override
  String get userProfileNoteDelete => 'Izbriši';

  @override
  String get userProfileNoteEmpty => 'Kliknite za dodavanje bilješke';

  @override
  String get userProfileMemberSince => 'Član od';

  @override
  String get userProfileAboutMe => 'O meni';

  @override
  String get userProfileRoles => 'Uloge';

  @override
  String get memberRoleAdd => 'Dodaj ulogu';

  @override
  String memberRoleRemove(String roleName) {
    return 'Ukloni ulogu $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Ovaj korisnik nema uloge u ovoj zajednici.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Još nema uloga. Dodajte uloge u $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Nema dostupnih uloga';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'U ovoj zajednici trenutno nema uloga za dodjelu, ali možete stvoriti novu ulogu u $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Postavke zajednice';

  @override
  String get guildSettingsRolesTab => 'Uloge';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Lokalno vrijeme';

  @override
  String get profileLocalTimeSettingsTitle => 'Lokalno vrijeme profila';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Postavite svoju vremensku zonu jednom kako bi $productName mogao ažurno pratiti vaš UTC pomak kada se mijenja ljetno računanje vremena. Ostali korisnici mogu vidjeti samo vaš UTC pomak, a ne točan identifikator vaše vremenske zone.';
  }

  @override
  String get profileLocalTimeEditButton => 'Uredi lokalno vrijeme profila';

  @override
  String get profileLocalTimeTimezoneLabel => 'Vremenska zona';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Odaberite vremensku zonu koju $productName koristi za izračun vaše UTC razlike kako bi se prikazalo lokalno vrijeme u vašem profilu.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Pretražite vremenske zone';

  @override
  String get profileLocalTimeNotSet => 'Nije postavljeno';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Ostali korisnici mogu vidjeti samo vaš trenutni UTC pomak kada odaberete da dijelite lokalno vrijeme profila. Oni ne vide vaš točan identifikator vremenske zone, kao što je $timezoneIdentifierExample. $productName pohranjuje taj identifikator samo kako bi se pomak automatski ažurirao kada dođe do promjene ljetnog vremena.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Svi';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Dopusti svima koji mogu vidjeti vaš cijeli profil da vide vaše lokalno vrijeme';

  @override
  String get profileLocalTimePrivacyFriends => 'Prijatelji';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Dopusti prijateljima da vide vaše lokalno vrijeme';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Članovi zajednice';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Dopusti članovima zajednica u kojima ste da vide vaše lokalno vrijeme';

  @override
  String get userProfileSameTimeAsYou => 'Isto vrijeme kao i vi';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration ispred vas';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration iza vas';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours sata',
      one: '1 sat',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minute',
      one: '1 minuta',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours sata',
      one: '1 sat',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minute',
      one: '1 minutu',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Kopiraj korisničko ime';

  @override
  String get userProfileCopyUserId => 'Kopiraj korisnički ID';

  @override
  String get userProfileViewMainProfile => 'Prikaži glavni profil';

  @override
  String get userProfileViewCommunityProfile => 'Prikaži profil zajednice';

  @override
  String get userProfileBlockUser => 'Blokiraj korisnika';

  @override
  String get userProfileUnblockUser => 'Deblokiraj korisnika';

  @override
  String get userProfileRemoveFriend => 'Ukloni prijatelja';

  @override
  String get userProfileBlockConfirmTitle => 'Blokiraj korisnika';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Jesi li siguran da želiš blokirati korisnika $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Deblokiraj korisnika';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Jesi li siguran da želiš deblokirati $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Ukloni prijatelja';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Jesi li siguran da želiš ukloniti $username kao prijatelja?';
  }

  @override
  String get userProfileFailedOpenDm => 'Neuspješno otvaranje izravne poruke';

  @override
  String get userProfileFailedSaveNote => 'Neuspješno spremanje bilješke';

  @override
  String get userProfileActionFailed =>
      'Radnja nije uspjela, pokušajte ponovno';

  @override
  String get userProfileChangeNickname => 'Promijeni nadimak';

  @override
  String get userProfileKick => 'Izbaci';

  @override
  String get userProfileBan => 'Zabrani';

  @override
  String get userProfileTimeout => 'Vremensko ograničenje';

  @override
  String get userProfileRemoveTimeout => 'Ukloni vremensko ograničenje';

  @override
  String get userProfileTransferOwnership => 'Prijenos vlasništva';

  @override
  String get userProfileReportMessage => 'Prijavi poruku';

  @override
  String get userProfileReportUserProfile => 'Prijavi profil';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Izbaciti $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Jesi li siguran da želiš izbaciti $username? Mogu se ponovno pridružiti s novim pozivom.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle =>
      'Ukloniti vremensko ograničenje?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Uklanjanje vremenskog ograničenja omogućit će $username ponovno slanje poruka, reagiranje i pridruživanje glasovnim kanalima.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Prenijeti vlasništvo?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Želite prenijeti vlasništvo nad ovom zajednicom na $username? Ovo je nepovratno i izgubit ćete sve vlasničke privilegije.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Zabrani $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Trajanje zabrane';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Prilagođeno trajanje (sekunde)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Bilo koja vrijednost od $min do $max sekundi';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Izbriši povijest poruka';

  @override
  String get userProfileBanDeleteNone => 'Ne briši ništa';

  @override
  String get userProfileBanDelete24h => 'Prethodna 24 sata';

  @override
  String get userProfileBanDelete7d => 'Prethodnih 7 dana';

  @override
  String get userProfileBanReasonLabel => 'Razlog (neobavezno)';

  @override
  String get userProfileBanReasonHint => 'Unesite razlog zabrane';

  @override
  String get userProfileBanSubmit => 'Zabrani pristup članu';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Istekni $username';
  }

  @override
  String get userProfileTimeoutDurationLabel =>
      'Trajanje vremenskog ograničenja';

  @override
  String get userProfileTimeoutSubmit => 'Ograniči člana';

  @override
  String get userProfileNicknameLabel => 'Nadimak';

  @override
  String get userProfileNicknameHint => 'Unesite nadimak';

  @override
  String get userProfileNicknameSave => 'Spremi';

  @override
  String userProfileKickSuccess(String username) {
    return 'Izbacili smo $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Zabranili smo korisniku $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Uklonili smo $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Uklonjen je vremenski rok za $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Nadimak ažuriran';

  @override
  String get userProfileTransferSuccess => 'Vlasništvo preneseno';

  @override
  String get durationPermanent => 'Trajno';

  @override
  String get duration60Seconds => '60 sekundi';

  @override
  String get duration5Minutes => '5 minuta';

  @override
  String get duration10Minutes => '10 minuta';

  @override
  String get duration1Hour => '1 sat';

  @override
  String get duration12Hours => '12 sati';

  @override
  String get duration1Day => '1 dan';

  @override
  String get duration3Days => '3 dana';

  @override
  String get duration5Days => '5 dana';

  @override
  String get duration1Week => '1 tjedan';

  @override
  String get duration2Weeks => '2 tjedna';

  @override
  String get duration1Month => '1 mjesec';

  @override
  String get durationCustom => 'Prilagođeno…';

  @override
  String typingIndicatorOne(String name) {
    return '$name piše...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 i $name2 tipkaju...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 i $name3 tipkaju...';
  }

  @override
  String get typingIndicatorMultiple => 'Nekoliko ljudi piše...';

  @override
  String get typingIndicatorHandful => 'Nekoliko tipkača se okuplja...';

  @override
  String get typingIndicatorSymphony => 'Simfonija tipkanja je u tijeku...';

  @override
  String get typingIndicatorFiesta => 'Ovdje je prava tipkačka fešta';

  @override
  String get typingIndicatorApocalypse => 'Uf, tipka se kao ludo';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Drago nam je što si ovdje, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Dobro došli, $username! Osjećajte se kao kod kuće.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Pozdrav, $username! Lijepo je što ste s nama.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Pozdrav, $username! Pridruži se kad god budeš spreman.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hej $username, drago nam je što te vidimo!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Bok, $username! Nadamo se da ćeš uživati.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hej, $username, dobrodošao/la!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Super što si tu, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Dobro nam došli, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Dobro došli, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Dobro došli, $username! Drago nam je što ste ovdje.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Dobro došli, $username! Nadamo se da ćete uživati ovdje.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Dobro došli, $username! Vaš sljedeći razgovor počinje ovdje.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Dobro došli, $username. Drago nam je što ste nam se pridružili.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Lijepo te vidjeti, $username! Slobodno uđi.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Tu ste, $username! Drago nam je što ste s nama.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Stigli ste, $username! Počnimo.';
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
      other: '$count mj.',
      one: '1 mj.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count g.',
      one: '1 g.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Moji uređaji';

  @override
  String get linkedDevicesDescription =>
      'Pogledajte sve uređaje na kojima je trenutno prijavljen vaš račun. Opozovite sve sesije koje ne prepoznajete.';

  @override
  String get linkedDevicesCurrentDevice => 'Trenutni uređaj';

  @override
  String get linkedDevicesOtherDevices => 'Ostali uređaji';

  @override
  String get linkedDevicesEnterSelection => 'Uđi u način odabira';

  @override
  String get linkedDevicesExitSelection => 'Izađi iz načina odabira';

  @override
  String get linkedDevicesSelectAll => 'Odaberi sve';

  @override
  String get linkedDevicesClearSelection => 'Poništi odabir';

  @override
  String get linkedDevicesRevokeTooltip => 'Opozovi uređaj';

  @override
  String get linkedDevicesSignOutAll => 'Odjavi sve ostale uređaje';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odjavi # uređaja',
      one: 'Odjavi 1 uređaj',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uređaja',
      one: '1 uređaja',
    );
    return 'Odjava s $_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Odjavi sve ostale uređaje';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ovo će odjaviti odabrane uređaje s vašeg računa. Morat ćete se ponovno prijaviti na tim uređajima.',
      one:
          'Ovo će odjaviti odabrani uređaj s vašeg računa. Morat ćete se ponovno prijaviti na tom uređaju.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Ovo će odjaviti odabrane uređaje s vašeg računa. Na tim uređajima morat ćete se ponovno prijaviti.';

  @override
  String get linkedDevicesSignOutConfirm => 'Nastavi';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Morat ćete se ponovno prijaviti na svim odjavljenim uređajima';

  @override
  String get linkedDevicesLoadErrorTitle => 'Mrežna pogreška';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Imamo problema s povezivanjem s kontinuumom prostor-vrijeme. Provjerite svoju vezu i pokušajte ponovno.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Uređaji su opozvani',
      one: 'Uređaj je opozvan',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Nismo se mogli odjaviti. Pokušajte ponovno.';

  @override
  String get linkedDevicesUnknownOs => 'Nepoznat OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Nepoznata platforma';

  @override
  String get linkedDevicesViewDetails => 'Prikaži detalje';

  @override
  String get linkedDevicesDetailsTitle => 'Detalji uređaja';

  @override
  String get linkedDevicesDetailsDevice => 'Uređaj';

  @override
  String get linkedDevicesDetailsClient => 'Klijent';

  @override
  String get linkedDevicesDetailsLocation => 'Lokacija';

  @override
  String get linkedDevicesDetailsIp => 'IP adresa';

  @override
  String get linkedDevicesDetailsLastUsed => 'Posljednja upotreba';

  @override
  String get linkedDevicesCurrentSession => 'Trenutna sesija';

  @override
  String get linkedDevicesUnknown => 'Nepoznato';

  @override
  String slowmodeLabel(String duration) {
    return '$duration spora poruka';
  }

  @override
  String get slowmodeTooltipActive =>
      'Usporen je način rada. Pričekajte prije slanja nove poruke.';

  @override
  String get slowmodeTooltipImmune =>
      'Usporeni način rada je omogućen, ali ste imuni.';

  @override
  String get slowmodeStatusEnabled => 'Usporeni način rada je omogućen';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Usporeni način rada je aktivan ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Usporeni način rada je postavljen na $durationLabel, ali ste izuzeti.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Usporeni način rada je postavljen na $durationLabel. Pričekajte prije nego što pošaljete drugu poruku.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Usporeni način rada je postavljen na $durationLabel za ovaj kanal.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Ne možete slati poruke u ovom kanalu.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Sustavne obavijesti osoblja ${productName}a. Ovdje ne možete odgovoriti.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Slanje poruka privremeno je pauzirano u ovoj zajednici.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Imate vremensko ograničenje. Slanje poruka, reagiranje i pridruživanje glasovnim kanalima pauzirani su dok vremensko ograničenje ne istekne.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Morate preuzeti svoj račun da biste slali poruke u ovoj zajednici.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Morate potvrditi svoju e-poštu da biste slali poruke u ovoj zajednici.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Vaš je račun prenov da biste slali poruke u ovoj zajednici.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Niste dovoljno dugo član ove zajednice da biste slali poruke.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Morate potvrditi telefonski broj da biste slali poruke u ovoj zajednici.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Potvrdite e-poštu';

  @override
  String get channelComposerBarrierVerifyPhone => 'Potvrdite telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Previše privitaka (max $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName premašuje ograničenje veličine ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Te datoteke su prevelike za slanje zajedno';

  @override
  String get chatAttachmentDropToUpload => 'Ispusti datoteke za prijenos';

  @override
  String get chatAttachmentDropToSend => 'Ispusti datoteke za slanje';

  @override
  String get chatAttachmentSendVoiceMessage => 'Pošalji glasovnu poruku';

  @override
  String get voiceMessageTitle => 'Glasovna poruka';

  @override
  String get voiceMessageHoldHint =>
      'Drži za snimanje. Povuci u smeće za brisanje, klizni prema gore za zaključavanje ili pusti za slanje.';

  @override
  String get voiceMessageDiscard => 'Odbaci glasovnu poruku';

  @override
  String get voiceMessageSend => 'Pošalji glasovnu poruku';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nije moguće započeti snimanje. Omogućite pristup mikrofonu.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Snimanje glasovnih poruka nije podržano na ovom uređaju.';

  @override
  String get voiceMessageMicInUse =>
      'Napusti glasovni poziv da snimiš glasovnu poruku.';

  @override
  String get voiceMessageRecordingFailed =>
      'Snimanje nije uspjelo. Pokušajte ponovno.';

  @override
  String get voiceMessageSendFailed =>
      'Slanje glasovne poruke nije uspjelo. Pokušajte ponovno.';

  @override
  String get voiceMessageRecordingHint =>
      'Govorite sada. Pritisnite Zaustavi kada završite — snimku možete obrezati kasnije.';

  @override
  String get voiceMessageReviewHint =>
      'Povucite ručice za obrezivanje, zatim pritisnite Pošalji.';

  @override
  String get voiceMessageStop => 'Zaustavi';

  @override
  String get voiceMessageStartRecording => 'Započni snimanje';

  @override
  String get voiceMessageRerecord => 'Snimi ponovno';

  @override
  String get voiceMessagePlay => 'Reproduciraj';

  @override
  String get voiceMessagePause => 'Pauziraj';

  @override
  String get voiceMessageSeekForward => 'Pomakni unaprijed';

  @override
  String get voiceMessageSeekBackward => 'Pomakni unatrag';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Odabir mora trajati najmanje $secondsString s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Uredi privitak';

  @override
  String get chatAttachmentFilenameLabel => 'Naziv datoteke';

  @override
  String get chatAttachmentDescriptionLabel => 'Opis';

  @override
  String get chatAttachmentDescriptionHint => 'Neobavezni alt tekst';

  @override
  String get chatAttachmentSpoilerLabel => 'Označi kao spojler';

  @override
  String get chatAttachmentRemove => 'Ukloni privitak';

  @override
  String get chatAttachmentDownload => 'Preuzmi';

  @override
  String get chatAttachmentDownloadedToast => 'Spremljeno u fotografije';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Nije moguće preuzeti privitak';

  @override
  String get chatAttachmentExpiredTooltip => 'Privitak je istekao';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Prikaži ($count redaka)',
      one: 'Prikaži ($count redak)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Saži ($count redaka)',
      one: 'Saži ($count redak)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Prikaži ($count redaka)',
      one: 'Prikaži ($count redak)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Saži ($count redaka)',
      one: 'Saži ($count redak)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (preostalo $count linija)',
      one: '... (preostala $count linija)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (preostalo je $count redaka)',
      one: '... (preostao je $count redak)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Prikaži cijelu datoteku';

  @override
  String get chatTextualPreviewChangeLanguage => 'Promijeni jezik';

  @override
  String get chatTextualPreviewSearchLanguage => 'Pretraži jezik…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Isticanje sintakse';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Nema rezultata';

  @override
  String get chatTextualPreviewMoreOptions => 'Više opcija';

  @override
  String get chatTextualPreviewWrapText => 'Prelomi tekst';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Datoteka je prevelika za pretpregled (ograničenje $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Nije moguće učitati pretpregled.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Običan tekst';

  @override
  String get chatTextualPreviewCopy => 'Kopiraj';

  @override
  String get chatAttachmentSourceGallery => 'Galerija';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Pregledaj datoteke';

  @override
  String get chatAttachmentPasteTooltip => 'Zalijepi datoteku s međuspremnika';

  @override
  String get chatAttachmentSpoiler => 'Spojler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Otkrij spojler';

  @override
  String get matureMediaRevealButton => 'Otkrij';

  @override
  String get matureMediaRevealHint => 'Kliknite za prikaz';

  @override
  String get matureContentTitle => 'Sadržaj za odrasle';

  @override
  String get matureCommunityTitle => 'Zajednica za odrasle';

  @override
  String get matureCategoryTitle => 'Kategorija za odrasle';

  @override
  String get matureChannelTitle => 'Kanal za odrasle';

  @override
  String get communityContentWarningTitle => 'Upozorenje o sadržaju zajednice';

  @override
  String get categoryContentWarningTitle => 'Upozorenje o sadržaju kategorije';

  @override
  String get channelContentWarningTitle => 'Upozorenje o sadržaju kanala';

  @override
  String get defaultContentWarningBody => 'Ovo sadrži osjetljiv sadržaj.';

  @override
  String get matureCommunityBody =>
      'Ova je zajednica označena kao sadržaj za odrasle i može sadržavati materijal koji možda nije prikladan za neke korisnike.';

  @override
  String get matureCategoryBody =>
      'Ova je kategorija označena kao sadržaj za odrasle i može sadržavati materijal koji možda nije prikladan za neke korisnike.';

  @override
  String get matureChannelBody =>
      'Ovaj je kanal označen kao sadržaj za odrasle i može sadržavati materijal koji možda nije prikladan za neke korisnike.';

  @override
  String get matureVoiceChannelBody =>
      'Ovaj je glasovni kanal označen kao sadržaj za odrasle i može sadržavati materijal koji možda nije prikladan za neke korisnike.';

  @override
  String get matureLinkChannelBody =>
      'Ovaj kanal s poveznicama označen je kao sadržaj za odrasle i može otvoriti materijal koji možda nije prikladan za neke korisnike.';

  @override
  String get matureCommunityUnavailableBody =>
      'Ova zajednica za odrasle nije dostupna vašem računu.';

  @override
  String get matureCategoryUnavailableBody =>
      'Ova kategorija za odrasle nije dostupna vašem računu.';

  @override
  String get matureChannelUnavailableBody =>
      'Ovaj kanal za odrasle nije dostupan vašem računu.';

  @override
  String get matureContentProceedButton => 'Nastavi';

  @override
  String get matureContentUnderstandButton => 'Razumijem';

  @override
  String get matureContentOpenLinkButton => 'Otvori poveznicu';

  @override
  String get sensitiveContentSectionTitle => 'Osjetljivi sadržaj';

  @override
  String get sensitiveContentSectionDescription =>
      'Upravljajte kako se filtriraju zreli ili osjetljivi mediji u različitim kontekstima';

  @override
  String get sensitiveContentFriendDmLabel => 'Izravne poruke od prijatelja';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Izravne poruke od drugih';

  @override
  String get sensitiveContentGuildLabel => 'Poruke u kanalima zajednice';

  @override
  String get sensitiveContentFilterShow => 'Prikaži';

  @override
  String get sensitiveContentFilterBlur => 'Zamućenje';

  @override
  String get sensitiveContentFilterBlock => 'Blokiraj';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Zamućivanje medija do završetka skeniranja sigurnosti';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Kada je omogućeno, slike i videozapisi bit će zamagljeni dok se skeniranje sigurnosti sadržaja ne završi.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Ova je postavka uvijek uključena za vaš račun.';

  @override
  String get sensitiveContentResetButton => 'Poništi';

  @override
  String get sensitiveContentSaveButton => 'Spremi';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count datoteka',
      one: '1 datoteka',
    );
    return 'Prenosi se $_temp0';
  }

  @override
  String get chatCancelUpload => 'Odustani od prijenosa';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Istječe $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Istječe između $start i $end';
  }

  @override
  String get connectionsTitle => 'Povezani računi';

  @override
  String connectionsDescription(String productName) {
    return 'Povežite vanjske račune i domene s profilom vašeg $productName. Potvrđene veze prikazat će se na vašem profilu kako bi ih drugi mogli vidjeti.';
  }

  @override
  String get connectionsEmptyTitle => 'Još nema povezanih računa';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Povežite svoj Bluesky račun ili potvrdite vlasništvo nad domenom da biste ih prikazali na svom profilu.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Potvrdite vlasništvo nad domenom da biste je prikazali na svom profilu.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domena';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Dodaj Bluesky vezu';

  @override
  String get connectionsAddDomainAriaLabel => 'Dodaj vezu domene';

  @override
  String get connectionEdit => 'Uredi';

  @override
  String get connectionRemove => 'Ukloni';

  @override
  String get connectionVerifiedLabel => 'Ova je veza potvrđena.';

  @override
  String get connectionUnverifiedLabel => 'Ova veza nije potvrđena.';

  @override
  String get connectionAddTitle => 'Dodaj vezu';

  @override
  String get connectionTypeLabel => 'Vrsta veze';

  @override
  String get connectionHandleLabel => 'Korisničko ime';

  @override
  String get connectionDomainLabel => 'Domena';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Već imate ovu vezu.';

  @override
  String get connectionConnectBluesky => 'Poveži s Blueskyjem';

  @override
  String get connectionContinue => 'Nastavi';

  @override
  String get connectionVerifyTitle => 'Potvrdi vezu';

  @override
  String get connectionVerifyInstructions =>
      'Upotrijebite zapis u nastavku kako biste dokazali vlasništvo nad domenom.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT zapis';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Vrijednost';

  @override
  String get connectionCopyHost => 'Kopiraj host';

  @override
  String get connectionCopyValue => 'Kopiraj vrijednost';

  @override
  String get connectionCopied => 'Kopirano!';

  @override
  String get connectionTokenFileTitle => 'Posluži datoteku tokena';

  @override
  String get connectionTokenFileDescription =>
      'Preuzmite **fluxer-verification** i stavite ga u svoju mapu **.well-known** kako bismo mogli potvrditi domenu.';

  @override
  String get connectionTokenFileDownload => 'Preuzmi fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Datoteka sadrži token za provjeru koji ćemo preuzeti s **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Spremi fluxer-verifikaciju';

  @override
  String get connectionVerifyButton => 'Potvrdi';

  @override
  String get connectionBack => 'Natrag';

  @override
  String get connectionEditTitle => 'Uredi vezu';

  @override
  String get connectionEditDescription =>
      'Odaberite tko može vidjeti ovu vezu na vašem profilu.';

  @override
  String get connectionVisibilityEveryone => 'Svi';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Dopusti svima da vide ovu vezu na vašem profilu';

  @override
  String get connectionVisibilityFriends => 'Prijatelji';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Dopusti prijateljima da vide ovu vezu';

  @override
  String get connectionVisibilityCommunityMembers => 'Članovi zajednice';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Dopusti članovima zajednica u kojima ste da vide ovu vezu';

  @override
  String get connectionRemoveTitle => 'Ukloni vezu';

  @override
  String get connectionRemoveDescription =>
      'Jeste li sigurni da želite ukloniti ovu vezu? Ova se radnja ne može poništiti.';

  @override
  String get connectionRemoveConfirm => 'Ukloni';

  @override
  String get connectionsLoadError => 'Nije uspjelo učitavanje veza';

  @override
  String get connectionsReorderError => 'Nije uspjelo ažuriranje redoslijeda';

  @override
  String get connectionInitiateFailed =>
      'Nismo mogli pokrenuti provjeru. Pokušajte ponovno.';

  @override
  String get connectionVerifyFailed =>
      'Nismo mogli potvrditi. Provjerite svoj DNS zapis i pokušajte ponovno.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Nismo mogli pokrenuti autorizaciju za Bluesky.';

  @override
  String get connectionUpdateFailed => 'Nije moguće ažurirati vezu';

  @override
  String get connectionRemoveFailed => 'Nije moguće ukloniti vezu';

  @override
  String get connectionTokenSavedToast => 'Fluxer-verifikacija spremljena';

  @override
  String get connectionTokenSaveFailedToast =>
      'Datoteka se nije mogla spremiti';

  @override
  String get connectionEnterHandle => 'Unesite Bluesky korisničko ime.';

  @override
  String get connectionEnterDomain => 'Unesite domenu.';

  @override
  String get lookAndFeelTitle => 'Izgled i dojam';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Odaberite između tamnog, ugljenog ili svijetlog izgleda.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Visoki dinamički raspon';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Kontrolirajte kako se HDR slike prikazuju na monitorima koji podržavaju HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Puni dinamički raspon';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Prikaz HDR slika uz punu svjetlinu i raspon boja.';

  @override
  String get lookAndFeelHdrStandardName => 'Standardni raspon';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Preslikavanje HDR slika na standardni raspon, smanjujući vršnu svjetlinu.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Način prikaza visokog dinamičkog raspona';

  @override
  String get lookAndFeelThemeDark => 'Tamna tema';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Tamna (naslijeđena) tema';

  @override
  String get lookAndFeelThemeCoal => 'Ugljena tema';

  @override
  String get lookAndFeelThemeLight => 'Svijetla tema';

  @override
  String get lookAndFeelThemeSystem => 'Tema sustava';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sinkroniziraj temu na svim uređajima';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Kada je omogućeno, promjene teme sinkronizirat će se na sve vaše uređaje. Kada je onemogućeno, ovaj uređaj će koristiti vlastitu postavku teme.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Sistemska tema automatski onemogućuje sinkronizaciju kako bi pratila preferencije vašeg sustava na ovom uređaju.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Nismo uspjeli sinkronizirati temu s vašim računom. Molimo pokušajte ponovno.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Skaliranje fonta za chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Prilagodite veličinu fonta u području čavrljanja.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Veličina fonta za chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Razina zumiranja aplikacije';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Podesite razinu zumiranja aplikacije.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Pozadina chata';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Odaberite pozadinu za chat. Ona ostaje na ovom uređaju.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Ova postavka ostaje na ovom uređaju';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Pozadina chata spremljena je samo na ovom uređaju i ne sinkronizira se s drugim uređajima.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Zadano';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Prilagođena slika';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Zvjezdano polje';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Boja $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradijent $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Zatamni pozadinu';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Nije moguće postaviti tu sliku kao pozadinu.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Poruke';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Odaberite kako će se poruke prikazivati u kanalima za chat.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Razmak između grupa poruka';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Način prikaza poruka';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Ugodno';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Prostran izgled s jasnim vizualnim razdvajanjem poruka.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Zbijeno';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maksimizira vidljive poruke uz minimalni razmak.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Sakrij avatare korisnika';

  @override
  String get lookAndFeelInterfaceTitle => 'Sučelje';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Prilagodite elemente i ponašanje sučelja.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indikatori tipkanja na popisu kanala';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Odaberite kako se pokazatelji tipkanja prikazuju na popisu kanala kada netko tipka u kanalu.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indikator tipkanja + avatari';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Prikaži indikator tipkanja s korisničkim avatarima na popisu kanala';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Samo indikator tipkanja';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Prikaži samo indikator tipkanja bez avatara';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Skriveno';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ne prikazuj indikatore pisanja na popisu kanala';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Prikaži tipkanje na odabranom kanalu';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Kada je onemogućeno (zadano), pokazatelji tipkanja neće se prikazivati u kanalu koji trenutno pregledavate.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'općenito';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Savjeti za tipkovnicu';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Upravljajte prikazom savjeta za prečace tipkovnice unutar opisnih okvira.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Sakrij savjete za tipkovnicu u opisima';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Kad je omogućeno, značke prečaca skrivene su u skočnim prozorima s opisima.';

  @override
  String get lookAndFeelNekoTitle => 'Razno';

  @override
  String get lookAndFeelNekoDescription => 'Razne opcije sučelja.';

  @override
  String get lookAndFeelShowNekoLabel => 'Prikaži Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Kad je omogućeno, Neko se pojavljuje blizu trake za unos chata.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Ponašanje pri pridruživanju glasovnom kanalu';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Upravljajte načinom na koji se pridružujete glasovnim kanalima u zajednicama.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Za pridruživanje glasovnim kanalima potreban je dvostruki klik';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Kad je omogućeno, morat ćete dvaput kliknuti na glasovne kanale da biste im se pridružili. Kad je onemogućeno (zadano), jednim klikom odmah ćete se pridružiti kanalu.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Brza smeđa lisica skače preko lijenog psa.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Bočna traka zajednice';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigurirajte kako se izravne poruke prikazuju u bočnoj traci zajednice.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count zajednica je privremeno nedostupno zbog kvara fluks-kondenzatora.',
      one:
          '1 zajednica je privremeno nedostupna zbog kvara fluks-kondenzatora.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Zajednica privremeno nedostupna';

  @override
  String get guildUnavailableDescription =>
      'Nešto je pošlo po zlu. Radimo na tome.';

  @override
  String get guildNotFoundTitle => 'Ovo nije zajednica koju tražite.';

  @override
  String get guildNotFoundDescription =>
      'Zajednica koju tražite možda je izbrisana ili joj možda nemate pristup.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Zajednica $communityName trenutačno je dostupna samo članovima osoblja $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'privremeno nedostupno';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Sažmi DM-ove u mapu';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Kada je omogućeno, nepričuvane izravne poruke u bočnoj traci poslužitelja bit će sažete u mapu na gumbu $productName. Kliknite gumb $productName dok ste na stranici izravnih poruka da biste proširili ili saželi mapu.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Popis kanala';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Kontrolirajte ponašanje indikatora nepročitanih poruka za utišane kanale na popisima kanala.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Prikaži indikator nepročitanih poruka na utišanim kanalima';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Kad je omogućeno, utišani kanali prikazuju blijedu indikaciju nepročitanih poruka s lijeve strane. Spominjanja se i dalje prikazuju bez obzira na ovu postavku.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktivno sada';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Upravljajte prikazom aktivnosti \"Aktivni sada\" u cijeloj aplikaciji.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Prikaži \"Aktivno sada\" na početnom zaslonu';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Prikažite \"Aktivno sada\" na početnom zaslonu kako biste vidjeli prijatelje koji su aktivni u glasovnom chatu. Vidjet ćete pretpregled, kontekst kanala, tko je već tamo i brz način za pridruživanje.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoriti';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Upravljajte vidljivošću favorita u cijeloj aplikaciji.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Omogući favorite';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Kada je omogućeno, možete označiti kanale kao omiljene i oni će se pojaviti u odjeljku Omiljeni. Kada je onemogućeno, svi elementi korisničkog sučelja povezani s omiljenima (gumbi, stavke izbornika) bit će skriveni. Vaši postojeći omiljeni kanali bit će sačuvani.';

  @override
  String get favoritesTitle => 'Favoriti';

  @override
  String get favoritesEmptyTitle => 'Još nema omiljenih';

  @override
  String get favoritesEmptyDescription =>
      'Zvijezdama označi kanale iz zaglavlja chata kako bi ih zadržao ovdje.';

  @override
  String get favoritesWelcomeTitle => 'Dobro došli u favorite';

  @override
  String get favoritesWelcomeDescription =>
      'Vaš osobni prostor za brzi pristup omiljenim kanalima, izravnim porukama i grupama. Pritisnite zvjezdicu na bilo kojem kanalu da biste ga dodali ovdje.';

  @override
  String get favoritesWelcomeTip => 'Nije za vas? Isključite ih bilo kada.';

  @override
  String get favoritesDisableButton => 'Onemogući favorite';

  @override
  String get favoritesAddedToast => 'Dodano u favorite';

  @override
  String get favoritesRemovedToast => 'Uklonjeno iz favorita';

  @override
  String get favoritesHiddenToast => 'Omiljene su skrivene';

  @override
  String get favoritesMute => 'Isključi obavijesti za favorite';

  @override
  String get favoritesUnmute => 'Uključi obavijesti za favorite';

  @override
  String get favoritesHeaderMenu => 'Meni favorita';

  @override
  String get favoritesCreateCategory => 'Stvori kategoriju';

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
  String get favoritesSaveNickname => 'Spremi nadimak';

  @override
  String get favoritesMoveToCategory => 'Premjesti u kategoriju';

  @override
  String get favoritesUncategorized => 'Nekategorizirano';

  @override
  String get favoritesOtherCategory => 'Ostalo';

  @override
  String get favoritesRemoveFromFavorites => 'Ukloni iz favorita';

  @override
  String get favoritesAddToFavorites => 'Dodaj u favorite';

  @override
  String get favoritesAddToSavedMedia => 'Dodaj u spremljene medije';

  @override
  String get favoritesRemoveFromSavedMedia => 'Ukloni iz spremljenih medija';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Dodaj u favorite GIF-ova pohranjenih putem URL-a';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Ukloni iz favorita GIF-ova pohranjenih putem URL-a';

  @override
  String get savedMediaAddTitle => 'Dodaj u spremljene medije';

  @override
  String get savedMediaFormNameLabel => 'Naziv';

  @override
  String get savedMediaFormNameHint => 'Moji super mediji';

  @override
  String get savedMediaFormAltTextLabel => 'Alternativni tekst';

  @override
  String get savedMediaFormAltTextHint => 'Opišite medij';

  @override
  String get savedMediaFormTagsLabel => 'Oznake';

  @override
  String get savedMediaFormTagsHint => 'smiješno, reakcija, posao';

  @override
  String get savedMediaSaveError => 'Nije moguće ažurirati spremljene medije.';

  @override
  String get savedMediaNameRequired => 'Naziv je obavezan.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Kako da spremimo vaše omiljene GIF-ove?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Svoje omiljene GIF-ove možete pohraniti kao favorite samo s URL-om ili ih prenijeti u spremljene medije. Odaberite opciju koja vam najviše odgovara. Uvijek je možete promijeniti u Postavke > Napredno > Mediji.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-omiljeni (zadano): sinkronizirano na svim vašim uređajima, bez prijenosa, ne računa se u spremljene medije. Izvorni medij može nestati ako ga njegov domaćin ukloni.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Spremljeni mediji: učitani, mogu se označiti, pretraživati i trajni su, ali se računaju u vaše ograničenje spremljenih medija.';

  @override
  String get gifFavoriteFirstTimeHint => 'Pitamo samo jednom.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Upotrijebi samo URL (preporučeno)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia =>
      'Upotrijebi spremljene medije';

  @override
  String get favoritesHideConfirmTitle => 'Sakrij favorite';

  @override
  String get favoritesHideConfirmDescription =>
      'Ovo će sakriti sve elemente korisničkog sučelja povezane s omiljenima, uključujući gumbe i stavke izbornika. Vaši postojeći omiljeni sadržaji ostat će sačuvani i mogu se ponovno omogućiti u bilo kojem trenutku u Postavke > Napredno > Izgled.';

  @override
  String get favoritesDirectMessageSubtitle => 'Izravna poruka';

  @override
  String get messagesMediaDisplayGroupTitle => 'Prikaz';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Upravljajte prikazom poruka, medija i ostalog sadržaja.';

  @override
  String get messagesMediaMediaGroupTitle => 'Mediji';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Prilagodite postavke veličine medija i gumbe.';

  @override
  String get messagesMediaInputGroupTitle => 'Unos';

  @override
  String get messagesMediaInputGroupDescription =>
      'Prilagodite postavke unosa poruka.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Bočna traka';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigurirajte kako se prikazuje bočna traka zajednice.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Sakrij utišane kanale po zadanim postavkama';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automatski sakrij utišane kanale u bočnoj traci kada se pridružiš novim zajednicama';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Sakriti utišane kanale po zadanim postavkama?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'U novim zajednicama kojima se pridružite utišani kanali bit će automatski skriveni. Želite li primijeniti ovu postavku i na sve postojeće zajednice?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Prestati skrivati utišane kanale po zadanim postavkama?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'U novim zajednicama kojima se pridružite utišani kanali više neće biti automatski skriveni. Želite li prikazati utišane kanale i u svim postojećim zajednicama?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Primijeni na sve zajednice';

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
      'Upravljajte prikazom slika, videozapisa i drugog sadržaja. Sav se sadržaj prilagođava veličini i pretvara. Izuzetno velike datoteke koje se ne mogu komprimirati u pretpregled neće se ugraditi bez obzira na ove postavke.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Kada se objavi kao poveznica u čavrljanju';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Kada se izravno prenese na $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Pregledi poveznica';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Upravljajte pretpregledima veza na web-mjesta u chatu';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Prikaži ugrađeni sadržaj i pretpreglede poveznica na web-stranice';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakcije';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfiguriraj emoji reakcije na poruke';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Prikaži reakcije emojijima na porukama';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Sadržaj spojlera';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Upravljajte prikazom spojler sadržaja';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Prikaži sadržaj spojlera';

  @override
  String get messagesMediaSpoilersOnClickName => 'Pri kliku';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Prikaži sadržaj spojlera kad se klikne';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'U kanalima koje moderiram';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Uvijek prikazuj skriveni sadržaj u kanalima u kojima imaš dopuštenje \"Upravljanje porukama\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Uvijek';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Uvijek prikaži sadržaj spojlera';

  @override
  String get messagesMediaSizeSectionTitle => 'Postavke veličine medija';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Prilagodite maksimalnu veličinu prikaza za ugrađene i priložene medije. Manje veličine zauzimaju manje prostora na zaslonu, dok veće prikazuju više detalja.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Mediji iz poveznica (ugrađeni)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Preneseni privitci';

  @override
  String get messagesMediaSizeCompactName => 'Kompaktno (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Manja veličina medija';

  @override
  String get messagesMediaSizeComfortableName => 'Udobno (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Veća veličina medija s više detalja';

  @override
  String get messagesMediaGifsSectionTitle => 'Ponašanje GIF-ova';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Upravljajte načinom umetanja GIF-ova u chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automatski pošalji GIF-ove kad su odabrani';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Prijenosi s kamere';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Odaberite hoće li se fotografije i videozapisi snimljeni kamerom u aplikaciji zadržati na vašem uređaju';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Spremi na uređaj';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Automatsko dovršavanje izraza (automatsko dovršavanje dvotočkom)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Upravljajte onime što se pojavljuje u automatskom dovršavanju izraza kada upišete dvotočku. Prilagodite koje se sugestije prikazuju kako bi odgovarale vašim željama.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Prikaži zadane emojije u automatskom dovršavanju izraza';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Prikaži prilagođene emojije u automatskom dovršavanju izraza';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Prikaži naljepnice u automatskom dovršavanju izraza';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Prikaži spremljene medije u automatskom dovršavanju izraza';

  @override
  String get messagesMediaEditingSectionTitle => 'Uređivanje poruka';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Upravljajte što se događa s nacrtom izmjene kada ga otkažete.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Zadrži nacrt izmjena pri otkazivanju';

  @override
  String get accessibilitySaturationTitle => 'Zasićenost';

  @override
  String get accessibilitySaturationDescription =>
      'Prilagodi živost boja teme u cijeloj aplikaciji.';

  @override
  String get accessibilityVisualGroupTitle => 'Vizualno';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Uvijek podcrtaj poveznice';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Prikaži zamjenski tekst na slikama';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Prikaži zamjenski tekst ispod slika kada je dostupan.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Priguši precrtani tekst';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Pretpregledi izravnih poruka';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Upravljajte kada se pretpregledi poruka prikazuju na popisu izravnih poruka.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Način pretpregleda izravnih poruka';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Sve poruke';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Prikaži pretpreglede poruka za sve razgovore u izravnim porukama';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Samo nepročitane izravne poruke';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Prikazuj pretpreglede poruka samo za izravne poruke s nepročitanim porukama';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ništa';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ne prikazuj pretpreglede poruka na popisu izravnih poruka';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Čitač zaslona';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Upravljajte kako $productName radi sa čitačima zaslona.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Najavi nove poruke';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Neka čitači zaslona objavljuju nove poruke čim stignu u otvoreni kanal. Zvukovi obavijesti ostaju nepromijenjeni.';

  @override
  String get accessibilityTtsGroupTitle => 'Tekst u govor';

  @override
  String get accessibilityTtsGroupDescription =>
      'Odaberite brzinu za izgovaranje teksta.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Brzina reprodukcije govora';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Reproduciraj uzorak';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Zaustavi uzorak';

  @override
  String get accessibilityPreviewButtonLabel => 'Gumb za pretpregled';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Ovako izgledaju poveznice: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Pretpregled korisnika';

  @override
  String get accessibilityKeyboardGroupTitle => 'Tipkovnica';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Prikaži prsten fokusa na tekstualnom polju za chat';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Tipka Esc izlazi iz načina rada tipkovnice';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Prikaži prečace kontekstnog izbornika';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Potvrdi prije pokretanja poziva';

  @override
  String get accessibilityAnimationGroupTitle => 'Animacija';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Smanjeno kretanje je uključeno, tako da su animacije sadržaja pauzirane prema zadanim postavkama. I dalje možete uključiti bilo koju od njih kako bi se nastavila reproducirati.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Reproduciraj animirane emojije';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Automatska reprodukcija GIF-ova';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Automatska reprodukcija GIF-ova kada je $productName u fokusu';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Reproducira se unatoč smanjenom kretanju.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pauzirano zbog smanjenog kretanja. Uključite za nastavak reprodukcije animiranih emojija.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Pauzirano zbog smanjenog kretanja. Uključite za nastavak reprodukcije GIF-ova.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Na mobilnim uređajima je zadano isključeno radi očuvanja baterije i uštede podataka.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animacije naljepnica';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Postavke animacije naljepnica';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Uvijek animiraj';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Naljepnice će se uvijek animirati';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animiraj pri interakciji';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Naljepnice će se animirati kada ih pritisnete';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Naljepnice će se animirati kada prijeđete mišem preko njih ili stupite u interakciju s njima';

  @override
  String get accessibilityStickerNeverAnimateName => 'Nikad ne animiraj';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Naljepnice se nikad neće animirati';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Uvijek animirano unatoč smanjenom kretanju.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Smanjeno kretanje ograničava animaciju naljepnica na interakciju. Odaberite „uvijek animiraj” za nadjačavanje.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Zadano je animiranje pri interakciji na mobilnom uređaju radi očuvanja trajanja baterije.';

  @override
  String get accessibilityMotionGroupTitle => 'Kretanje';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sinkroniziraj postavku smanjenog kretanja sa sustavom';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Koristite postavku sustava ovog uređaja za smanjeno kretanje ili je prilagodite u nastavku.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Smanji kretanje';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Onemogućite animacije i prijelaze. Trenutačno kontrolirano postavkama sustava.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Onemogućite animacije i prijelaze u cijeloj aplikaciji.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animirani emojiji, GIF-ovi i naljepnice ostaju pod vašom kontrolom na kartici Animacija.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Započeti poziv?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Jeste li sigurni da želite započeti ovaj poziv?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Započni poziv';

  @override
  String get accessibilityTtsSampleDescription =>
      'Poslušajte oglednu rečenicu izgovorenu odabranom brzinom.';

  @override
  String get accessibilityTtsSampleText =>
      'Doktore, ja sam iz budućnosti. Došao sam ovamo vremenskim strojem koji ste vi izumili. Sada mi treba vaša pomoć da se vratim u 1985. godinu.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Sinteza govora nije dostupna na ovom uređaju.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Reprodukcija govora nije uspjela. Pokušajte ponovno ili provjerite radi li audio izlaz.';

  @override
  String get ttsSubstitutionUnknownUser => 'nepoznat korisnik';

  @override
  String get ttsSubstitutionUnknownRole => 'nepoznata uloga';

  @override
  String get ttsSubstitutionUnknownChannel => 'nepoznat kanal';

  @override
  String get ttsSubstitutionCodeBlock => 'blok koda';

  @override
  String get ttsSubstitutionSpoiler => 'spojler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'kosa crta $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName kaže: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Odgovarajući korisniku $replyAuthorName, $authorName kaže: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'poslao je naljepnicu';

  @override
  String get ttsSentAttachment => 'poslao privitak';

  @override
  String ttsSentAttachments(int count) {
    return 'poslano $count privitaka';
  }

  @override
  String get ttsSentEmbed => 'poslao je ugrađeni sadržaj';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author je poslao $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Poslao/la privitak';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username je prikvačio/la poruku na ovaj kanal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username je dodao/la $userName u grupu.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username je dodao/la nekoga u grupu.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username je napustio/la grupu.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username je uklonio/la $userName iz grupe.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username je uklonio/la nekoga iz grupe.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username je promijenio/la naziv kanala u $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username je promijenio/la naziv kanala.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username je promijenio/la ikonu kanala.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username je započeo/la poziv.';
  }

  @override
  String get systemCallJoinTheCall => 'Pridruži se pozivu';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username je započeo poziv koji je trajao $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Propustili ste poziv od $username koji je trajao $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Propustili ste poziv od $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'nekoliko sekundi';

  @override
  String get systemCallDurationMinute => 'minutu';

  @override
  String get systemCallDurationOneYear => '1 godinu';

  @override
  String get systemCallDurationOneMonth => '1 mjesec';

  @override
  String get systemCallDurationOneWeek => '1 tjedan';

  @override
  String get systemCallDurationOneDay => '1 dan';

  @override
  String get systemCallDurationOneHour => '1 sat';

  @override
  String systemCallDurationYears(int count) {
    return '$count godine';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count mjeseci';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count tjedna';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count dana';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count sati';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minute';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Ažurirajte $productName da biste vidjeli ovu poruku.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Potvrda glasovne veze';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Već ste povezani na ovaj glasovni kanal s $count drugih uređaja. Što želite učiniti?',
      one:
          'Već ste povezani na ovaj glasovni kanal s 1 drugog uređaja. Što želite učiniti?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Prebaci se na ovaj uređaj';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Samo se pridruži (zadrži ostale veze)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ne radi ništa, ne želim se pridružiti';

  @override
  String get voiceJoinFailedTitle => 'Nismo se mogli pridružiti pozivu';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Nismo mogli odspojiti tvoje druge uređaje. Pokušaj ponovno za trenutak.';

  @override
  String get voiceChannelEmptyDescription =>
      'Ovo je glasovni kanal. Povežite se da biste počeli razgovarati!';

  @override
  String get voiceChannelJoin => 'Pridruži se glasovnom kanalu';

  @override
  String get voiceCallJoin => 'Pridruži se pozivu';

  @override
  String get voiceChannelJoinConnect => 'Povezivanje na glasovni kanal';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nemate dopuštenje za pridruživanje ovom glasovnom kanalu';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon, kamera i sadržaj dijeljenja zaslona šifrirani su od kraja do kraja.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon, kamera i sadržaj dijeljenja zaslona šifrirani su od kraja do kraja.';

  @override
  String get voiceChannelE2eeBroken =>
      'Šifriranje od kraja do kraja nije dostupno jer se u ovom glasovnom kanalu nalazi sudionik koji nije podržan.';

  @override
  String get voiceCallE2eeBroken =>
      'Šifriranje od kraja do kraja nije dostupno jer je u pozivu sudionik koji nije podržan.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Ovu aplikaciju je potrebno ažurirati prije pridruživanja ovom šifriranom pozivu.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nismo mogli pokrenuti vaš mikrofon. Još ste u pozivu.';

  @override
  String get voiceChannelStatusConnecting => 'Povezivanje…';

  @override
  String get voiceChannelStatusConnected => 'Povezano';

  @override
  String get voiceChannelStatusError => 'Pogreška';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobilni uređaj';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Stolno računalo';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Zajednica je utišala';

  @override
  String get voiceParticipantTooltipMuted => 'Utišano';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Zajednica utišala';

  @override
  String get voiceParticipantTooltipDeafened => 'Bez zvuka';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Veza: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sudionika',
      one: '1 sudionik',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Napusti';

  @override
  String get voiceControlMute => 'Utišaj';

  @override
  String get voiceControlUnmute => 'Uključi zvuk';

  @override
  String get voiceControlDeafen => 'Isključi zvuk';

  @override
  String get voiceControlUndeafen => 'Uključi zvuk';

  @override
  String get voiceControlVideo => 'Videozapis';

  @override
  String get voiceControlFlipCamera => 'Promijeni kameru';

  @override
  String get voiceControlScreenShare => 'Dijeljenje zaslona';

  @override
  String get voiceScreenShareNotificationText => 'Dijelim zaslon.';

  @override
  String get voiceControlMore => 'Više';

  @override
  String get voiceControlDisconnect => 'Prekini vezu';

  @override
  String get voiceInChat => 'U glasovnom razgovoru';

  @override
  String get voiceConnectionFailed => 'Veza nije uspjela';

  @override
  String get voiceConnectionRetry => 'Pokušaj ponovno';

  @override
  String get voiceConnectionDismiss => 'Odbaci';

  @override
  String get voiceConnectionDisconnected => 'Prekinuta veza';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Mjerenje latencije...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Skoči na $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Glasovna veza';

  @override
  String get voiceConnectionAdvancedStats => 'Napredno';

  @override
  String get voiceShowCallAvatars => 'Prikaži avatare u pozivu';

  @override
  String get voiceShowConnectionId => 'Prikaži ID veze';

  @override
  String get voiceAudioProcessing => 'Obrada zvuka';

  @override
  String get voiceConnectionSessionSection => 'Sesija';

  @override
  String get voiceConnectionDurationLabel => 'Trajanje';

  @override
  String get voiceConnectionParticipantsLabel => 'Sudionici';

  @override
  String get voiceConnectionNetworkSection => 'Mreža';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Podrhtavanje';

  @override
  String get voiceConnectionSendLabel => 'Pošalji';

  @override
  String get voiceConnectionReceiveLabel => 'Primljeno';

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
  String get userAreaMuteMicrophone => 'Isključi mikrofon';

  @override
  String get userAreaUnmuteMicrophone => 'Uključi mikrofon';

  @override
  String get userAreaUserSettings => 'Korisničke postavke';

  @override
  String get voiceParticipantMenuViewProfile => 'Prikaži profil';

  @override
  String get voiceParticipantMenuFocus => 'Fokusiraj ovu osobu';

  @override
  String get voiceParticipantMenuUnfocus => 'Ukloni fokus';

  @override
  String get voiceParticipantMenuCommunityMute =>
      'Isključi mikrofon u zajednici';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Isključi zvuk u zajednici';

  @override
  String get voiceParticipantMenuUserVolume => 'Glasnoća korisnika';

  @override
  String get voiceParticipantMenuStreamVolume => 'Glasnoća prijenosa';

  @override
  String get voiceParticipantMenuStopStreaming => 'Zaustavi dijeljenje';

  @override
  String get voiceParticipantModerationFailed =>
      'Nije moguće ažurirati tog člana. Molimo pokušajte ponovno.';

  @override
  String get voiceControlChat => 'Čavrljanje';

  @override
  String get voiceCallViewModeLabel => 'Prikaz';

  @override
  String get voiceCallViewModeGrid => 'Rešetka';

  @override
  String get voiceCallViewModeFocus => 'Fokus';

  @override
  String get voicePanelSettingsSectionTitle => 'Postavke glasa';

  @override
  String get voicePanelUseEarpieceLabel => 'Upotrijebi slušalicu';

  @override
  String get voiceOutputRouteSpeaker => 'Zvučnik';

  @override
  String get voiceOutputRouteEarpiece => 'Slušalica';

  @override
  String get voiceOutputRouteHeadset => 'Slušalice';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Prikaži samo videozapise';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Prikaži samo sudionike koji imaju uključenu kameru.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Prikaži moju kameru';

  @override
  String get voicePrioritizeSpeakersLabel => 'Daj prednost govornicima';

  @override
  String get voiceTextChatShow => 'Prikaži chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# nepročitanih poruka',
      one: '# nepročitanom porukom',
    );
    return 'Prikaži chat s $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Potrebna je dozvola za kameru za video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nismo mogli pokrenuti dijeljenje zaslona. Molimo pokušajte ponovno.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Odbijena je dozvola za dijeljenje zaslona.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Dijeljenje zaslona nije dostupno na ovom uređaju.';

  @override
  String get voiceWatchStream => 'Gledaj prijenos';

  @override
  String get voiceStopWatching => 'Zaustavi gledanje';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Prekini gledanje trenutačnog streama';

  @override
  String get voiceOwnScreenShareTitle => 'Emitirate';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Vaš je prijenos uživo za sudionike.';

  @override
  String get voiceLiveBadge => 'Uživo';

  @override
  String get dmVoiceViewCall => 'Prikaži poziv';

  @override
  String get dmVoiceCallFullScreen => 'Puni zaslon';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Otvori poziv na cijeli zaslon';

  @override
  String get dmVoiceStripStatusConnecting => 'Povezivanje…';

  @override
  String get dmVoiceStripStatusInCall => 'U pozivu';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Glasovni poziv';

  @override
  String get dmVoiceCallBarConnecting => 'Povezivanje…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Izravni poziv';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Grupni poziv';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problem s pozivom';

  @override
  String get dmVoiceFullscreenTitle => 'Glas';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Glas povezan';

  @override
  String get notificationsPageTitle => 'Obavijesti';

  @override
  String get notificationsFilterUnreads => 'Nepročitano';

  @override
  String get notificationsFilterMentions => 'Spominjanja';

  @override
  String get notificationsBookmarksTooltip => 'Oznake';

  @override
  String get notificationsMentionFilterTooltip => 'Filtriraj spominjanja';

  @override
  String get notificationsMentionFiltersTitle => 'Filtri za spominjanja';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Uključi spominjanja @everyone i @here';

  @override
  String get notificationsMentionIncludeRoles => 'Uključi spominjanja uloga';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Uključi sva spominjanja zajednice';

  @override
  String get notificationsNoUnreadTitle => 'Nema nepročitanih poruka';

  @override
  String get notificationsNoUnreadBody => 'Sve ste pročitali.';

  @override
  String get notificationsNoMentionsTitle => 'Nema nedavnih spominjanja';

  @override
  String get notificationsNoMentionsBody =>
      'Sve @spominjanja vas će se pojaviti ovdje 7 dana.';

  @override
  String get notificationsMentionsEndTitle => 'Došli ste do kraja';

  @override
  String get notificationsMentionsEndBody =>
      'Vidjeli ste sve svoje nedavne spominjanja. Ne brinite, uskoro će se pojaviti još.';

  @override
  String get notificationsJump => 'Skoči';

  @override
  String get notificationsRemoveMentionTooltip => 'Ukloni spominjanje';

  @override
  String get notificationsViewAllUnread => 'Prikaži sve nepročitano';

  @override
  String get notificationsMarkAsRead => 'Označi kao pročitano';

  @override
  String get notificationsExpand => 'Proširi';

  @override
  String get notificationsCollapse => 'Sažmi';

  @override
  String get notificationsMessageUnavailable =>
      'Ovu poruku nije moguće učitati.';

  @override
  String characterCounterRemaining(int remaining) {
    return 'Preostalo još $remaining znakova';
  }

  @override
  String get characterCounterTooLong => 'Poruka je predugačka';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining znakova preostalo. Nabavite $productName za pisanje do $premiumMaxLength znakova.';
  }

  @override
  String get chatMessageFailedToSend => 'Poruka nije poslana';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Vaša poruka nije mogla biti isporučena. To je obično zato što ne dijelite zajednicu s primateljem ili primatelj prihvaća izravne poruke samo od prijatelja. Možda ćete također morati prilagoditi vlastite postavke privatnosti izravnih poruka u $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Vaša poruka nije mogla biti isporučena. Morate preuzeti svoj račun da biste slali izravne poruke.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Vaša poruka nije mogla biti isporučena. Morate preuzeti svoj račun da biste slali poruke.';

  @override
  String get chatSendFailureContentBlocked =>
      'Vaša poruka nije mogla biti isporučena jer ju je naš sigurnosni sustav označio. Ako mislite da je ovo pogreška, obratite se podršci.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'Vaša poruka nije mogla biti isporučena jer ju je naš sigurnosni sustav označio. Ako mislite da je ovo pogreška, obratite se administratorima ove instance.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Tvoja poruka nije mogla biti dostavljena jer sadrži neprikladne emotikone ili naljepnice koje nisu dopuštene u ovom kontekstu.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Ovu poruku možeš vidjeti samo ti.';

  @override
  String get chatClientSystemDismiss => 'Odbaci';

  @override
  String get privacyDashboardCommunicationSection => 'Komunikacija';

  @override
  String get privacyDashboardProfilePrivacySection => 'Privatnost profila';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Prijatelji i izravne poruke';

  @override
  String get privacyDashboardActivitySharingSection => 'Dijeljenje aktivnosti';

  @override
  String get privacyDashboardSensitiveContentSection => 'Osjetljivi sadržaj';

  @override
  String get privacyDashboardDataExportSection => 'Izvoz podataka';

  @override
  String get privacyDashboardDataDeletionSection => 'Brisanje podataka';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Tko može vidjeti vaš cijeli profil';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Prijatelji i sve zajednice';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Vaš je cijeli profil vidljiv prijateljima i svima u vašim zajednicama';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Samo prijatelji i male zajednice';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Vaš je cijeli profil vidljiv prijateljima i članovima vaših zajednica s 200 ili manje članova';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Samo prijatelji';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Vaš je cijeli profil vidljiv samo vašim prijateljima';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Zahtjevi za prijateljstvo';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Svi';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Dopusti svima da ti šalju zahtjeve za prijateljstvo';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Prijatelji prijatelja';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Dopusti prijateljima tvojih prijatelja da ti šalju zahtjeve';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Članovi zajednice';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Dopusti članovima zajednica u kojima se nalaziš da ti šalju zahtjeve';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Izravne poruke';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Dopusti izravne poruke od članova zajednice';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Dopusti članovima zajednica u kojima se nalaziš da ti šalju izravne poruke';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Dopusti izravne poruke od botova zajednice';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Dopusti botovima iz zajednica u kojima se nalaziš da ti šalju izravne poruke';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Upravljajte tko vam može slati zahtjeve za prijateljstvo i izravne poruke';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Upravljajte tko vas može nazvati i dodati u grupne razgovore';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Dolazni pozivi';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Upravljajte tko vas može nazvati';

  @override
  String get privacyDashboardAllowedCallers => 'Dopušteni pozivatelji';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nitko';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blokiraj sve dolazne pozive';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Samo prijatelji';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Dopusti samo prijateljima da te zovu (preporučeno)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Prijatelji + Prilagođeno';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Dopusti prijateljima i dodatnim grupama koje odabereš';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Svi';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Dopusti svima da te zovu, čak i strancima';

  @override
  String get privacyDashboardAdditionalGroups => 'Dodatne grupe';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Ljudi koji su prijatelji vaših prijatelja mogu vas nazvati';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Ljudi iz zajednica u kojima ste oboje članovi mogu vas zvati';

  @override
  String get privacyDashboardRingBehavior => 'Ponašanje zvona';

  @override
  String get privacyDashboardSilentCalls => 'Tihi pozivi od svih';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Svi će pozivi biti tihi umjesto da zvone. Prema zadanim postavkama, pozivi od nepoznatih osoba uvijek su tihi.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Tko vas može dodati u grupne razgovore';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Upravljajte tko vas može dodati u grupne razgovore bez pitanja. Svatko vam i dalje može poslati poveznicu za pozivnicu za pridruživanje.';

  @override
  String get privacyDashboardAllowedInvites => 'Dopuštena pozivanja';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Nitko te ne može dodati u grupne razgovore bez dopuštenja';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Dopusti samo prijateljima da te dodaju bez pitanja (preporučeno)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Dopusti prijateljima i dodatnim grupama da te dodaju';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Dopusti svima da te dodaju u grupne razgovore bez pitanja';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Ljudi koji su prijatelji vaših prijatelja mogu vas dodati u grupne razgovore';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Osobe iz zajednica u kojima ste oboje članovi mogu vas dodati u grupne razgovore';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Glasovna aktivnost u odjeljku „Aktivno sada”';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Dijelite svoju glasovnu aktivnost s prijateljima';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Podijeliti glasovnu aktivnost sa svim prijateljima?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Zaustaviti dijeljenje glasovne aktivnosti sa svim prijateljima?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Uskoro ćete početi dijeliti svoju glasovnu aktivnost sa svim svojim prijateljima, uključujući i buduće. Ovo šalje obavijest svima njima i može se ponovno promijeniti tek za 24 sata.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Prestat ćete dijeliti svoju glasovnu aktivnost sa svim svojim prijateljima, uključujući i buduće. Ovo šalje obavijest svima njima i može se ponovno promijeniti tek za 24 sata.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Da, podijeli sa svim prijateljima';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Da, prestani dijeliti';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Ponovno dostupno za $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Dijeljenje glasovne aktivnosti ažurirano';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Trenutačno nije moguće ažurirati dijeljenje glasovne aktivnosti';

  @override
  String get privacyDashboardDataExportDesc =>
      'Izradite arhivu podataka svog računa za preuzimanje, uključujući poruke i URL-ove privitaka. Većina ljudi želi sve, ali u nastavku možete suziti opseg.';

  @override
  String get privacyDashboardExportMyData => 'Izvezi moje podatke';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Trajno uklonite poruke koje ste poslali u izravnim porukama, grupnim izravnim porukama i zajednicama. Postupak se odvija u pozadini, a kada završi primit ćete izravnu poruku.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Izbriši moje poruke';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Dopustiti izravne poruke od članova zajednice?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Blokirati izravne poruke članova zajednice?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Dopustiti botovima da vam šalju izravne poruke?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blokirati botove da vam šalju izravne poruke?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Želite li dopustiti i izravne poruke od članova postojećih zajednica?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Želite li blokirati i izravne poruke od članova postojećih zajednica?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Želite li dopustiti i botovima iz postojećih zajednica da vam šalju izravne poruke?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Želite li blokirati botove i iz postojećih zajednica?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Ovu postavku također možete promijeniti po zajednici dugim pritiskom na naziv zajednice i odabirom Postavke privatnosti.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Dopusti za sve zajednice';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Blokiraj za sve zajednice';

  @override
  String get privacyDashboardDmConfirmSkip => 'Preskoči ovaj korak';

  @override
  String get privacyDashboardDataRequestGoBack => 'Natrag';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Izvezi moje podatke';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Izbriši moje poruke';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Obradit ćemo ovo što je prije moguće. Primit ćete e-poštu kada vaša arhiva bude spremna.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Obradit ćemo ovo što je prije moguće. Poslat ćemo vam izravnu poruku kada bude gotovo.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Što uključiti';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Sve';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Izvezite svaku poruku koju ste ikada poslali te sve postavke računa, članstva i metapodatke.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Prilagođeni odabir';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Odaberite vrste razgovora, zajednice i vremenski okvir koje želite uključiti u arhivu.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Odaberite što želite uključiti';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Odaberite koje vrste razgovora želite očistiti.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Samo mjesta kojima više ne mogu pristupiti';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Izbriši poruke samo iz zajednica i grupnih izravnih poruka koje ste napustili ili iz kojih ste uklonjeni.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Koje razgovore';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Odaberite vrste razgovora koje želite uključiti.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Otvorene izravne poruke';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Zatvorene izravne poruke';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Grupne izravne poruke';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Zajednice';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Koje zajednice';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Filtar zajednice';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Uključi sve osim odabranih';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Samo odabrane';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Trenutno niste ni u jednoj zajednici.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Vremenski raspon';

  @override
  String get privacyDashboardDataRequestDateMode => 'Vremenski raspon';

  @override
  String get privacyDashboardDataRequestAllTime => 'Cijelo razdoblje';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Prilagođeni raspon';

  @override
  String get privacyDashboardDataRequestStartDate => 'Datum početka';

  @override
  String get privacyDashboardDataRequestEndDate => 'Datum završetka';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Ostavite bilo koje polje prazno da taj kraj vremenskog okvira ostane neograničen.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Odaberite barem jednu vrstu razgovora za uključivanje.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Datum početka mora biti prije datuma završetka.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Pregledajte i potvrdite';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Izradit ćemo arhivu za preuzimanje svih poruka koje ste ikada poslali i poslat ćemo vam e-poštu kada bude spremna. Veza za preuzimanje u toj e-pošti istječe nakon 7 dana.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Izradit ćemo arhivu za preuzimanje koja odgovara donjim filtrima i poslat ćemo vam e-poštu kada bude spremna. Veza za preuzimanje u toj e-pošti istječe nakon 7 dana.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Trajno izbrišite poruke koje odgovaraju filtrima u nastavku. Ovo se ne može poništiti.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Nakon što ovo započne, povratka nema. Poslat ćemo vam izravnu poruku kada završi.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Zatraži izvoz';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Izbriši poruke';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Opseg';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Razgovori';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Zajednice';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Vremenski raspon';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Ništa';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Od $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Do $end';
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
      other: '# zajednica',
      one: '# zajednice',
    );
    return 'Sve osim $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# zajednice',
      one: '# zajednica',
    );
    return 'Samo $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Otvorene izravne poruke';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Zatvorene izravne poruke';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Izravne poruke (otvorene i zatvorene)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms =>
      'Grupne izravne poruke';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Zajednice';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# sati',
      one: '# sat',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minute',
      one: '# minuta',
    );
    return '$_temp0 i $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# sati',
      one: '# sat',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuta',
      few: '# minute',
      one: '# minuta',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      few: '# sekunde',
      other: '# sekunde',
      one: '# sekunda',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Nije moguće učitati postavke privatnosti';

  @override
  String get privacyDashboardRetry => 'Ponovi';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Nije moguće spremiti postavke za osjetljivi sadržaj.';

  @override
  String get privacyDashboardDataRequestFailed => 'Zahtjev nije dovršen.';

  @override
  String get chatMessageDeleteFailed => 'Izbriši neuspjelu poruku';

  @override
  String get chatMessageAddReaction => 'Dodaj reakciju';

  @override
  String get doubleTapReactionHint => 'Dvaput dodirnite poruku za reakciju';

  @override
  String get doubleTapReactionEdit => 'Uredi';

  @override
  String get doubleTapReactionEditTitle => 'Uredi zadano';

  @override
  String get doubleTapReactionEditSubtitle =>
      'Odaberite emoji za dvostruki dodir';

  @override
  String get chatMessageEdit => 'Uredi poruku';

  @override
  String get chatMessageReply => 'Odgovori';

  @override
  String get notificationReplyPlaceholder => 'Poruka';

  @override
  String get notificationReplyFailed => 'Nije moguće poslati odgovor';

  @override
  String get chatMessageForward => 'Proslijedi';

  @override
  String get forwardMessageTitle => 'Proslijedi poruku';

  @override
  String get forwardSearchHint => 'Pretražite kanale ili izravne poruke';

  @override
  String get forwardDirectMessagesSection => 'Izravne poruke';

  @override
  String get forwardCommentHint => 'Dodaj komentar (neobavezno)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Pošalji ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Nema pronađenih kanala';

  @override
  String get forwardSuccessToast => 'Poruka proslijeđena';

  @override
  String get forwardFailed => 'Prosljeđivanje poruke nije uspjelo';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Komentari nisu dostupni jer odabrani kanal ima omogućen usporeni način rada.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Čeka se istek usporenog načina rada u jednom ili više odabranih kanala.';

  @override
  String get slowmodeRateLimitedTitle => 'Usporeni način rada aktivan';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Usporeni način rada je uključen — pričekajte $duration prije nego što pošaljete drugu poruku.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Izravno učitavanje onemogućeno je tijekom usporenog načina rada.';

  @override
  String get shareMediaTitle => 'Podijeli na';

  @override
  String get shareMediaMessageHint => 'Dodaj poruku…';

  @override
  String get shareMediaSendButton => 'Pošalji';

  @override
  String get shareMediaSuccessToast => 'Medij podijeljen';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Poslano na $count odredišta';
  }

  @override
  String get shareMediaFailedToast => 'Medij nije uspješno podijeljen';

  @override
  String get forwardDestinationNoSendPermission =>
      'Ne možeš slati poruke ovdje';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Ovdje ne možeš umetati poveznice';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Ovdje ne možete priložiti datoteke';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Slanje poruka onemogućeno je u ovoj zajednici';

  @override
  String get forwardDestinationTimedOut => 'Na hlađenju ste u ovoj zajednici';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Spora aktivnost - pričekajte $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopiraj poruku';

  @override
  String get chatMessageCopyEmbedText => 'Kopiraj tekst ugrađenog sadržaja';

  @override
  String get chatMessageTranslate => 'Prevedi';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Prevedeno s $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Vidi izvornik';

  @override
  String get chatMessageSeeTranslation => 'Vidi prijevod';

  @override
  String get chatMessageTranslating => 'Prevođenje…';

  @override
  String get chatMessageTranslateFailed => 'Nismo mogli prevesti ovu poruku.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Prijevod nije dostupan na ovom uređaju.';

  @override
  String get chatMessageSpeak => 'Pročitaj poruku';

  @override
  String get chatMessageStopSpeaking => 'Zaustavi čitanje';

  @override
  String get chatMessagePin => 'Prikvači poruku';

  @override
  String get chatMessageUnpin => 'Otkvači poruku';

  @override
  String get chatMessageUnpinIt => 'Otkvači';

  @override
  String get chatMessageBookmark => 'Označi poruku';

  @override
  String get chatMessageRemoveBookmark => 'Ukloni oznaku';

  @override
  String get chatMessageMarkAsUnread => 'Označi kao nepročitano';

  @override
  String get chatMessageCopyMessageLink => 'Kopiraj poveznicu poruke';

  @override
  String get chatMessageOpenLink => 'Otvori poveznicu';

  @override
  String get chatMessageCopyLink => 'Kopiraj poveznicu';

  @override
  String get chatMessageCopyMessageId => 'Kopiraj ID poruke';

  @override
  String get chatMessageViewReactions => 'Pogledaj reakcije';

  @override
  String get chatMessageRemoveAllReactions => 'Ukloni sve reakcije';

  @override
  String get chatMessageDebug => 'Otklanjanje pogrešaka poruke';

  @override
  String get chatMessageDebugSheetTitle => 'Otklanjanje pogrešaka poruke';

  @override
  String get chatMessageDebugCopyJson => 'Kopiraj JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON poruke kopiran u međuspremnik';

  @override
  String get chatReactionsSheetTitle => 'Reakcije';

  @override
  String get chatReactionsSheetEmpty =>
      'Nitko još nije reagirao ovim emojijem.';

  @override
  String get chatReactionAddFailed => 'Neuspješno dodavanje reakcije';

  @override
  String get chatReactionRemoveFailed => 'Neuspješno uklanjanje reakcije';

  @override
  String get chatMessageReport => 'Prijavi poruku';

  @override
  String get reportFlowTitleMessage => 'Prijavi poruku';

  @override
  String get reportFlowTitleUserProfile => 'Prijavi profil';

  @override
  String get reportFlowSummaryTitle => 'Provjerite svoju prijavu';

  @override
  String get reportFlowSummarySubtitle =>
      'Provjerite je li sve u redu prije slanja.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Prijavite samo ono za što iskreno vjerujete da krši pravila. Zlouporaba prijava protivi se našim $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'smjernice zajednice';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Prijavite samo ono za što iskreno vjerujete da krši pravila i, molimo vas, ne šaljite istu prijavu dvaput.';

  @override
  String get reportFlowSelectedMessage => 'Poruka koju prijavljujete';

  @override
  String get reportFlowSelectedUser => 'Profil koji prijavljujete';

  @override
  String get reportFlowReportCategory => 'Vaši odgovori';

  @override
  String get reportFlowSubmit => 'Pošalji prijavu';

  @override
  String get reportFlowBack => 'Natrag';

  @override
  String get reportFlowNext => 'Dalje';

  @override
  String get reportFlowDone => 'Gotovo';

  @override
  String get reportFlowThankYouTitle => 'Prijava poslana';

  @override
  String get reportFlowThankYouNoReportTitle =>
      'Hvala što ste nas upozorili na ovo';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'Sigurnosni tim $productName pregledat će vašu prijavu. Nećemo otkriti da je došla od vas.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Hvala što ste nam javili. Ovo samo po sebi ne krši naša pravila, stoga nismo poslali prijavu. Ako je usmjereno na nekoga ili koristi pogrdne izraze, prijavite to ponovno i odaberite „Zlostavljajući ili štetan sadržaj“.';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Hvala što ste nam javili. Ovo samo po sebi ne krši naša pravila, stoga nismo poslali prijavu.';

  @override
  String get reportFlowMoreYouCanDo => 'Vaše mogućnosti';

  @override
  String reportFlowBlockName(String name) {
    return 'Blokiraj korisnika $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'Skriva poruke te osobe i onemogućuje joj da vam šalje poruke';

  @override
  String get reportFlowBlockButton => 'Blokiraj';

  @override
  String get reportFlowBlockedButton => 'Blokirano';

  @override
  String get reportFlowUrgentBanner =>
      'Ako je netko u neposrednoj opasnosti, prvo kontaktirajte lokalne hitne službe.';

  @override
  String get reportFlowLoadFailed => 'Nismo mogli učitati obrazac za prijavu.';

  @override
  String get reportFlowTryAgain => 'Pokušaj ponovno';

  @override
  String get reportFlowOutdated =>
      'Obrazac prijave se promijenio. Molimo započnite ponovno.';

  @override
  String get reportFlowAlreadyReported => 'Već ste prijavili ovu poruku.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Već ste prijavili ovaj profil danas.';

  @override
  String get reportFlowRateLimited =>
      'Prebrzo šaljete prijave. Pokušajte ponovno kasnije.';

  @override
  String get reportFlowSubmitFailed =>
      'Vaša prijava nije prošla. Pokušajte ponovno.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Preuzmite svoj račun i potvrdite e-poštu kako biste mogli slati prijave.';

  @override
  String get chatMessageSuppressEmbeds => 'Sakrij ugrađeni sadržaj';

  @override
  String get chatMessageUnsuppressEmbeds => 'Prikaži pretpreglede';

  @override
  String get chatMessageDelete => 'Izbriši poruku';

  @override
  String get chatMessageDeleteConfirmTitle => 'Izbriši poruku';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Jeste li sigurni da želite izbrisati ovu poruku?';

  @override
  String get chatMessageDeleteAttachment => 'Izbriši privitak';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText => 'Uredi zamjenski tekst';

  @override
  String get chatMessageMore => 'Više';

  @override
  String get chatEditingMessage => 'Uređivanje poruke';

  @override
  String get chatReplyOriginalDeleted => 'Izvorna poruka je izbrisana';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Učitavanje izvorne poruke nije uspjelo';

  @override
  String get chatReplyAttachedMedia => 'Poruka sadrži priložene medije';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blokiranih poruka',
      one: '1 blokirana poruka',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potencijalnih poruka spamera',
      one: '1 potencijalna poruka spamera',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Odgovor je skriven jer je izvorni autor blokiran.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Odgovor je skriven jer je izvorni autor označen kao spamer.';

  @override
  String get devMarkAsSpamLocally => 'Lokalno označi kao neželjeno';

  @override
  String get devIgnoreSpamFlag => 'Zanemari oznaku neželjene pošte';

  @override
  String get chatMessagesLoadError => 'Nije moguće učitati poruke.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Želite li nadjačati postavke spominjanja?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname želi @spominjanje u odgovorima. Želite li svejedno poslati bez spominjanja?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname ne želi @spominjanje u odgovorima. Želite li svejedno poslati sa spominjanjem?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Zanemari postavku';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Kliknite za isključivanje obavijesti korisniku kojem odgovarate.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Kliknite za omogućavanje obavijesti korisniku kojem odgovarate.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Spomeni korisnika koji je odgovorio';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Poništi odgovor';

  @override
  String get chatEditMessageHint => 'Uredi poruku';

  @override
  String get chatEditNoChanges => 'Nema promjena za spremanje';

  @override
  String get chatChannelNotReady =>
      'Ovaj kanal još nije spreman. Pokušajte ponovno za trenutak.';

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
    return 'Jučer u $time';
  }

  @override
  String get mediaViewerImagePreview => 'Pregled slike';

  @override
  String get mediaViewerClose => 'Zatvori preglednik medija';

  @override
  String get mediaViewerOpenInBrowser => 'Otvori u pregledniku';

  @override
  String get mediaViewerOptions => 'Opcije medija';

  @override
  String get mediaViewerCopyLink => 'Kopiraj poveznicu';

  @override
  String get mediaViewerForward => 'Proslijedi';

  @override
  String get mediaViewerZoomIn => 'Povećaj prikaz';

  @override
  String get mediaViewerZoomOut => 'Smanji prikaz';

  @override
  String get mediaViewerPreviousAttachment => 'Prethodni privitak';

  @override
  String get mediaViewerNextAttachment => 'Sljedeći privitak';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Privitak $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Odbaci';

  @override
  String get chatAttachmentVideoToggleControls =>
      'Prikaži/sakrij kontrole videozapisa';

  @override
  String get chatAttachmentVideoMute => 'Utišaj videozapis';

  @override
  String get chatAttachmentVideoUnmute => 'Uključi zvuk videa';

  @override
  String get chatAttachmentVideoPlay => 'Reproduciraj videozapis';

  @override
  String get chatAttachmentVideoPause => 'Pauziraj video';

  @override
  String get chatAttachmentVideoProgress => 'Napredak videozapisa';

  @override
  String get chatVideoPlaybackFailed =>
      'Ne možemo reproducirati ovaj videozapis.';

  @override
  String get chatImageCouldNotLoad => 'Nije moguće učitati ovu sliku.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Obavijesti korisnike s ovom ulogom koji imaju dopuštenje za pregled ovog kanala.';

  @override
  String get composerAutocompleteSuggestions => 'Prijedlozi';

  @override
  String get composerAutocompleteCommandsHeading => 'Naredbe';

  @override
  String get composerAutocompleteChoicesHeading => 'Odabiri';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Neobavezni argumenti';

  @override
  String get composerAutocompleteChannelsHeading => 'Kanali';

  @override
  String get composerAutocompleteMembersHeading => 'Članovi';

  @override
  String get composerAutocompleteUsersHeading => 'Korisnici';

  @override
  String get composerAutocompleteMentionsHeading => 'Spominjanja';

  @override
  String get composerAutocompleteRolesHeading => 'Uloge';

  @override
  String get composerAutocompleteMediaHeading => 'Mediji';

  @override
  String get composerAutocompleteStickersHeading => 'Naljepnice';

  @override
  String get composerAutocompleteGifsHeading => 'GIF-ovi';

  @override
  String get composerAutocompleteNoGifs => 'Nema GIF-ova';

  @override
  String get composerCommandShrugDescription =>
      'Dodaje ¯\\_(ツ)_/¯ vašoj poruci.';

  @override
  String get composerCommandTableflipDescription =>
      'Dodaje (╯°□°)╯︵ ┻━┻ vašoj poruci.';

  @override
  String get composerCommandUnflipDescription =>
      'Dodaje ┬─┬ ノ( ゜-゜ノ) vašoj poruci.';

  @override
  String get composerCommandMeDescription =>
      'Pošalji poruku radnje (prikazuje se kurzivom).';

  @override
  String get composerCommandSpoilerDescription =>
      'Pošalji poruku sa spojlerom (omata je u oznake za spojler).';

  @override
  String get composerCommandTtsDescription =>
      'Pošalji poruku pretvaranjem teksta u govor.';

  @override
  String get composerCommandNickDescription =>
      'Promijenite nadimak u ovoj zajednici.';

  @override
  String get composerCommandKickDescription => 'Izbaci člana iz ove zajednice.';

  @override
  String get composerCommandBanDescription =>
      'Zabrani članu pristup ovoj zajednici.';

  @override
  String get composerCommandMsgDescription =>
      'Pošalji izravnu poruku korisniku.';

  @override
  String get composerCommandSavedDescription =>
      'Pošalji spremljenu medijsku stavku.';

  @override
  String get composerCommandStickerDescription => 'Pošalji naljepnicu.';

  @override
  String get composerCommandGifDescription => 'Pretražite i pošaljite GIF.';

  @override
  String get composerCommandMemberOption => 'Član na kojeg se radnja odnosi.';

  @override
  String get composerCommandReasonOption => 'Razlog (neobavezno).';

  @override
  String get composerCommandMessageOption => 'Poruka za slanje.';

  @override
  String get composerCommandQueryOption => 'Što tražiti.';

  @override
  String get composerCommandNicknameOption =>
      'Vaš novi nadimak ili ostavite prazno za poništavanje.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Koji dio nedavne povijesti poruka člana izbrisati.';

  @override
  String get composerCommandDeleteMessagesNone => 'Ne briši ništa';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Prethodnih $count dana';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Prethodna 24 sata';

  @override
  String get composerCommandOptionRequired =>
      'Ova je opcija obavezna. Molimo unesite vrijednost.';

  @override
  String get composerCommandClear => 'Očisti naredbu';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Promijenili ste nadimak u ovoj zajednici iz **$previousNickname** u **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Nepoznat korisnik';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Neuspješno slanje poruke **$username**. Možda su isključili izravne poruke ili ste blokirani.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count više';
  }

  @override
  String get addGuildModalTitle => 'Dodaj zajednicu';

  @override
  String get addGuildModalLandingDescription =>
      'Stvorite novu zajednicu ili se pridružite postojećoj.';

  @override
  String get addGuildCreateCommunity => 'Stvori zajednicu';

  @override
  String get addGuildJoinCommunity => 'Pridruži se zajednici';

  @override
  String get addGuildImportDiscordTemplate => 'Uvezi Discord predložak';

  @override
  String get addGuildJoinTitle => 'Pridružite se zajednici';

  @override
  String get addGuildJoinDescription =>
      'Unesite poveznicu za pozivnicu kako biste se pridružili zajednici.';

  @override
  String get addGuildInviteLinkLabel => 'Poveznica za pozivnicu';

  @override
  String get addGuildJoinSubmit => 'Pridruži se zajednici';

  @override
  String get addGuildInviteInvalid => 'Ovaj poziv je nevažeći ili je istekao.';

  @override
  String get addGuildJoinFailed =>
      'Nije se moguće pridružiti zajednici. Molimo pokušajte ponovno.';

  @override
  String get addGuildCreateTitle => 'Stvori zajednicu';

  @override
  String get addGuildCreateDescription =>
      'Stvorite zajednicu za dopisivanje s prijateljima.';

  @override
  String get addGuildCreateNameLabel => 'Naziv zajednice';

  @override
  String get addGuildCreateSubmit => 'Stvori zajednicu';

  @override
  String get addGuildCreateFailed =>
      'Nije moguće stvoriti zajednicu. Molimo pokušajte ponovno.';

  @override
  String get addGuildCreateClaimTitle => 'Preuzmite svoj račun';

  @override
  String get addGuildCreateClaimDescription =>
      'Morate preuzeti svoj račun prije nego što možete stvoriti zajednicu.';

  @override
  String get addGuildCreateVerifyTitle => 'Potvrdite svoju e-poštu';

  @override
  String get addGuildCreateVerifyDescription =>
      'Morate potvrditi svoju adresu e-pošte prije nego što možete stvoriti zajednicu.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animirane ikone nisu podržane prilikom stvaranja nove zajednice. Koristite statičnu sliku.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Stvaranjem zajednice prihvaćate da ćete slijediti i pridržavati se ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Smjernice zajednice za $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Ovo je instanca s jednom zajednicom, stoga se ne mogu stvarati dodatne zajednice.';

  @override
  String get addGuildCreateChangeIcon => 'Promijeni ikonu';

  @override
  String get addGuildCreateIconLabel => 'Ikona zajednice';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Maks. 10 MB. Preporučeno: 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Zalijepite URL predloška s Discorda kako biste uvezli njegovu strukturu u novu zajednicu.';

  @override
  String get addGuildImportUrlLabel => 'URL predloška';

  @override
  String get addGuildImportUrlInvalid =>
      'Unesite važeći Discord URL predloška ili kod.';

  @override
  String get addGuildImportFetchFailed =>
      'Nije uspjelo preuzimanje predloška zajednice. Predložak možda ne postoji ili vanjska usluga nije dostupna.';

  @override
  String get addGuildImportInvalidResponse =>
      'Ovo ne izgleda kao odgovor predloška.';

  @override
  String get addGuildImportTemplateLabel => 'Predložak';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount tekstualnih, $voiceChannelCount glasovnih, $categoryCount kategorija, $roleCount uloga';
  }

  @override
  String get addGuildImportRemoveIcon => 'Ukloni ikonu';

  @override
  String get addGuildImportTemplateInvalid =>
      'Podaci predloška zajednice su nevažeći ili neispravni.';

  @override
  String get addGuildPackInstalled => 'Paket je uspješno instaliran.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'Ukloni sve reakcije';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Jeste li sigurni da želite ukloniti sve reakcije iz ove poruke?';

  @override
  String get chatMessagePinConfirm => 'Prikvači';

  @override
  String get chatMessagePinConfirmDescription =>
      'Prikvačite ovu poruku na kanal kako bi je svi vidjeli.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Otkvači poruku';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Vratiti ovu prikvačenu poruku u prošlost?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username je prikvačio $messageLink u ovaj kanal. Pogledajte $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'poruka';

  @override
  String get systemPinMessageAllPinsLink => 'sve prikvačene poruke';

  @override
  String get channelPinsEmptyTitle => 'Nema prikvačenih poruka';

  @override
  String get channelPinsEmptyDescription =>
      'Prikvačene poruke prikazuju se ovdje.';

  @override
  String get channelDetailsFallbackTitle => 'Detalji';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Grupni DM · $count člana';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Želite li zatvoriti razgovor s korisnikom $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Napusti $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Postavke kanala';

  @override
  String get channelDetailsGroupSettingsTitle => 'Postavke grupe';

  @override
  String get channelDetailsDmSettingsTitle => 'Postavke izravne poruke';

  @override
  String get channelDetailsInvitePeople => 'Pozovi ljude';

  @override
  String get channelDetailsCopyLink => 'Kopiraj poveznicu';

  @override
  String get channelMenuCopyChannelLink => 'Kopiraj poveznicu kanala';

  @override
  String get channelMenuCopyRedirectLink =>
      'Kopiraj poveznicu za preusmjeravanje';

  @override
  String get channelDetailsAddFriendsToGroup => 'Dodaj prijatelje u grupu';

  @override
  String get channelDetailsGroupInvites => 'Pozivnice za grupu';

  @override
  String get channelDetailsEditChannel => 'Uredi kanal';

  @override
  String get channelDetailsDeleteChannel => 'Izbriši kanal';

  @override
  String get channelSettingsCategorySettingsTitle => 'Postavke kategorije';

  @override
  String get channelSettingsEditCategory => 'Uredi kategoriju';

  @override
  String get channelSettingsTabOverview => 'Pregled';

  @override
  String get channelSettingsTabPermissions => 'Dopuštenja';

  @override
  String get channelSettingsTabInvites => 'Pozivnice';

  @override
  String get channelSettingsTabWebhooks => 'Webhookovi';

  @override
  String get channelSettingsDeleteChannel => 'Izbriši kanal';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Jesi li siguran da želiš izbrisati $channelName? Ovo se ne može poništiti.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Jeste li sigurni da želite izbrisati $categoryName? Ovo se ne može poništiti.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Izbriši kategoriju';

  @override
  String get channelSettingsChannelUpdated => 'Kanal ažuriran';

  @override
  String get channelSettingsChannelName => 'Naziv kanala';

  @override
  String get channelSettingsCategoryName => 'Naziv kategorije';

  @override
  String get channelSettingsMyCategory => 'Moja kategorija';

  @override
  String get categoryExpandCategory => 'Proširi kategoriju';

  @override
  String get categoryCollapseCategory => 'Sažmi kategoriju';

  @override
  String get categoryExpandAllCategories => 'Proširi sve kategorije';

  @override
  String get categoryCollapseAllCategories => 'Sažmi sve kategorije';

  @override
  String get categoryMuteCategory => 'Isključi obavijesti za kategoriju';

  @override
  String get categoryUnmuteCategory => 'Uključi obavijesti za kategoriju';

  @override
  String get categoryCopyCategoryId => 'Kopiraj ID kategorije';

  @override
  String get categoryIdCopied => 'ID kategorije kopiran';

  @override
  String get channelSettingsChannelNamePlaceholder => 'općenito';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Tema kanala';

  @override
  String get channelSettingsTopicPlaceholder => 'Dodajte temu ovom kanalu';

  @override
  String get channelSettingsInsertEmoji => 'Umetni emoji';

  @override
  String get channelSettingsTopicTooLongTitle => 'Tema kanala je predugačka.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Skratite temu i pokušajte ponovno.';

  @override
  String get channelSettingsSlowmode => 'Usporeni način rada';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Vrijeme čekanja između poruka. \"$bypassSlowmodePermissionLabel\" može ga zaobići.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Isključeno';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds sekundi';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minuta';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours sati';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minuta';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour sat';
  }

  @override
  String get channelSettingsVoiceQuality => 'Kvaliteta glasa';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Veća brzina prijenosa = bolja kvaliteta i veća upotreba propusnosti.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Ograničenje broja sudionika';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Najviše članova koji se mogu pridružiti odjednom. 0 znači neograničeno.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sudionika',
      one: '1 sudionik',
      zero: '∞ Bez ograničenja',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Ograničenje broja veza';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maksimalan broj aktivnih veza koje jedan član može održavati u ovom kanalu.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count veza',
      one: '1 veza',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Glasovna regija';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Odaberi glasovnu regiju za ovaj kanal. Automatski koristi najbližu regiju.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatski';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Nije moguće učitati glasovne regije';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Pokušajte ponovno za trenutak.';

  @override
  String get channelSettingsResetSlider => 'Vrati klizač na zadanu vrijednost';

  @override
  String get channelSettingsAdvanced => 'Napredno';

  @override
  String get channelSettingsMatureContentOverride =>
      'Nadjačavanje postavke sadržaja za odrasle';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Zameni postavku razine $scopeLevel za ovaj kanal. Sadržaj za odrasle prikazuje se iza zaštite prije ulaska.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Naslijedi';

  @override
  String get channelSettingsMatureContentOn => 'Uključeno';

  @override
  String get channelSettingsMatureContentOff => 'Isključeno';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Označi ovaj kanal kao sadržaj za odrasle.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Ostavite ovaj kanal otvorenim za sadržaj za odrasle.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Naslijeđeno iz $inheritedSourceLabel: uključeno';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Naslijeđeno od $inheritedSourceLabel: isključeno';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'kategorija';

  @override
  String get channelSettingsMatureContentCommunitySource => 'zajednice';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategorija';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Zajednica';

  @override
  String get channelSettingsContentWarningToggle =>
      'Prikaži upozorenje o sadržaju u ovom kanalu';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Prikazuje upit za pristanak prije ulaska u ovaj kanal.';

  @override
  String get channelSettingsContentWarningText =>
      'Prilagođeni tekst upozorenja';

  @override
  String get channelSettingsContentWarningDefault =>
      'Ovo sadrži osjetljiv sadržaj.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Potrebno vam je dopuštenje \"$manageChannelsPermissionLabel\" za uređivanje ovih dopuštenja.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Potrebno vam je dopuštenje \"$manageRolesPermissionLabel\" za uređivanje ovih dopuštenja.';
  }

  @override
  String get channelSettingsUnknownRole => 'Nepoznata uloga';

  @override
  String get channelSettingsUnknownUser => 'Nepoznat korisnik';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Nadjačavanja pristupa';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Uredi pristup za $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Natrag na nadjačavanja';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Konfigurirajte osnovni pristup za ovaj kanal';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Konfigurirajte iznimke za ovu ulogu';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Konfigurirajte iznimke za ovog člana';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Pretražite dopuštenja…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Pristup kanalu ažuriran';

  @override
  String get channelSettingsPermissionsTitle => 'Kontrola pristupa';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Ovaj kanal je usklađen s nadređenom kategorijom ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Ovaj kanal nije usklađen s nadređenom kategorijom ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Sinkroniziraj s kategorijom';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanal sinkroniziran s nadređenom kategorijom';

  @override
  String get channelSettingsPermissionsAddOverride => 'Dodaj nadjačavanje';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Pretražite uloge ili članove…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Uloge i članovi';

  @override
  String get channelSettingsDeleteInvite => 'Izbriši pozivnicu';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Izbrisati ovu pozivnicu? Ne može se poništiti.';

  @override
  String get channelSettingsCopyInviteCode => 'Kopiraj kod pozivnice';

  @override
  String get channelSettingsCopyInviteUrl => 'Kopiraj URL pozivnice';

  @override
  String get channelSettingsWebhookCreated => 'Webhook izrađen';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Stvaranje webhooka nije uspjelo';

  @override
  String get channelSettingsCreateWebhook => 'Stvori webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Upravljajte poveznicama za pozivnice na ovom kanalu.';

  @override
  String get channelSettingsInvitesCreate => 'Stvori pozivnicu';

  @override
  String get channelSettingsInvitesEmpty => 'Nema poveznica za pozivnice';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Ovaj kanal još nema poveznica za pozivnice. Stvorite jednu kako biste pozvali ljude u ovaj kanal.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Došlo je do pogreške prilikom učitavanja poveznica za pozivnice za ovaj kanal. Pokušajte ponovno.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Upravljajte dolaznim webhookovima koji mogu objavljivati poruke u ovom kanalu.';

  @override
  String get channelSettingsWebhooksEmpty => 'Nema webhookova';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Nema konfiguriranih webhookova za ovaj kanal. Stvorite webhook kako biste vanjskim aplikacijama omogućili objavljivanje poruka.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Ovaj kanal ne podržava webhookove.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Za pregled i uređivanje webhookova za ovaj kanal potrebna vam je dozvola \"$permission\".';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Učitavanje webhookova nije uspjelo';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Došlo je do pogreške prilikom učitavanja webhookova za ovaj kanal. Pokušajte ponovno.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Stvorio/la $creator $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Nepoznat korisnik';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Učitaj sliku';

  @override
  String get channelSettingsWebhooksRemove => 'Ukloni';

  @override
  String get channelSettingsWebhooksName => 'Naziv';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Naziv webhooka';

  @override
  String get channelSettingsWebhooksChannel => 'Kanal';

  @override
  String get channelSettingsWebhooksUrl => 'URL webhooka';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopiraj URL webhooka';

  @override
  String get channelSettingsWebhooksDelete => 'Izbriši webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Nije moguće izbrisati ovaj webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Izbrisati ovaj webhook? Ne može se poništiti.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Pokušajte ponovno za trenutak.';

  @override
  String get channelMenuOpenChat => 'Otvori čavrljanje';

  @override
  String get channelMenuDuplicateChannel => 'Dupliciraj kanal';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Poništi stanje sporazuma o zrelom sadržaju';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Izbrisati vaše poruke u ovom kanalu?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Ovo će trajno izbrisati svaku poruku koju ste ikada poslali u ovom kanalu. Ovo se ne može poništiti.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Izbriši moje poruke';

  @override
  String get channelMenuDeletedYourMessages => 'Izbrisali ste svoje poruke';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Nije moguće izbrisati vaše poruke';

  @override
  String get channelDetailsSystemMessage => 'Sistemska poruka';

  @override
  String get channelDetailsTextChannel => 'Tekstualni kanal';

  @override
  String get channelDetailsVoiceChannel => 'Glasovni kanal';

  @override
  String get channelDetailsCategory => 'Kategorija';

  @override
  String get channelDetailsLinkChannel => 'Poveži kanal';

  @override
  String get channelDetailsGenericChannel => 'Kanal';

  @override
  String get channelDetailsMutedConversation => 'Razgovor utišan';

  @override
  String get channelDetailsUnmutedConversation =>
      'Razgovor je uključio obavijesti';

  @override
  String get channelDetailsMutedChannel => 'Utišani kanal';

  @override
  String get channelDetailsUnmutedChannel => 'Kanal je odzvučen';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Postavke obavijesti ažurirane';

  @override
  String get channelDetailsTabMembers => 'Članovi';

  @override
  String get channelDetailsTabPins => 'Prikvačene poruke';

  @override
  String get channelDetailsActionMute => 'Isključi zvuk';

  @override
  String get channelDetailsActionUnmute => 'Odglumi';

  @override
  String get channelDetailsActionSearch => 'Pretraživanje';

  @override
  String get channelDetailsActionMore => 'Više';

  @override
  String get channelDetailsMembersEmptyTitle => 'Nema članova za prikaz';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Članovi će se pojaviti ovdje nakon što se učitaju podaci zajednice.';

  @override
  String get memberListPermissionDeniedTitle => 'Ne možete vidjeti članove';

  @override
  String get memberListPermissionDeniedBody =>
      'Ne možete vidjeti članove ovog kanala u ovoj zajednici';

  @override
  String get memberListUnavailableTitle => 'Popis članova nedostupan';

  @override
  String get memberListUnavailableBody =>
      'Popisi članova privremeno su nedostupni u ovoj zajednici';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Pribadače se nije moglo učitati';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Članovi s dopuštenjem \"Prikači poruke\" mogu prikvačiti poruke koje će svi vidjeti.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Poruke u ovom chatu može prikvačiti svatko kako bi ih svi vidjeli.';

  @override
  String get channelDetailsPinsEndReached => 'Došli ste do kraja';

  @override
  String get channelHeaderOpenDetails => 'Otvori detalje kanala';

  @override
  String get channelHeaderPinnedMessages => 'Prikvačene poruke';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Priznačene poruke, nepročitane';

  @override
  String get channelHeaderMemberList => 'Popis članova';

  @override
  String get channelHeaderInbox => 'Pristigla pošta';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Postavke obavijesti, utišano';

  @override
  String get channelDetailsSearchTitle => 'Pretraživanje';

  @override
  String get channelDetailsSearchHint => 'Pretraži poruke';

  @override
  String get channelDetailsSearchFilterFrom => 'Od';

  @override
  String get channelDetailsSearchFilterHas => 'Sadrži';

  @override
  String get channelDetailsSearchFilterIn => 'U';

  @override
  String get channelDetailsSearchFilterMentions => 'Spominjanja';

  @override
  String get channelDetailsSearchFilterMore => 'Više';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktivno';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kanala';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count korisnika';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Korisnik';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtriraj po kanalu';

  @override
  String get channelDetailsSearchChannelsHint => 'Pretražite kanale';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Nema pronađenih kanala';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Prikačeno';

  @override
  String get channelDetailsSearchPinnedTrue => 'Samo prikvačeno';

  @override
  String get channelDetailsSearchPinnedFalse => 'Isključi prikvačene';

  @override
  String get channelDetailsSearchClearFilter => 'Očisti';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Vrsta autora';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Datum';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Način datuma';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Odaberi datum';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Poveži naziv hosta';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Naziv datoteke sadrži';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Datotečni nastavak';

  @override
  String get channelDetailsSearchContentPoll => 'Anketa';

  @override
  String get channelDetailsSearchContentPollDescription => 'Poruke s anketom';

  @override
  String get channelDetailsSearchContentForward => 'Proslijedi';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Proslijeđene poruke';

  @override
  String get channelDetailsSearchFilterSort => 'Sortiranje';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filtri pretraživanja';

  @override
  String get channelHeaderSearchRecentTitle => 'Nedavna pretraživanja';

  @override
  String get channelHeaderSearchUsersTitle => 'Korisnici';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanali';

  @override
  String get channelHeaderSearchValuesTitle => 'Vrijednosti';

  @override
  String get channelHeaderSearchDatesTitle => 'Datumi';

  @override
  String get channelHeaderSearchDefaultBadge => 'Zadano';

  @override
  String get channelHeaderSearchClearHistory => 'Očisti';

  @override
  String get channelHeaderSearchFilterDescFrom => 'korisnik';

  @override
  String get channelHeaderSearchFilterDescMentions => 'korisnik';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, unos, slika, video, zvuk, datoteka, naljepnica, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'datum ili raspon datuma';

  @override
  String get channelHeaderSearchFilterDescOn => 'datum ili raspon datuma';

  @override
  String get channelHeaderSearchFilterDescDuring => 'datum ili raspon datuma';

  @override
  String get channelHeaderSearchFilterDescAfter => 'datum ili raspon datuma';

  @override
  String get channelHeaderSearchFilterDescIn => 'kanal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'točno ili netočno';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'korisnik, bot ili webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'naziv hosta, npr. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName => 'dio naziva privitka';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'nastavak datoteke, npr. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'vrijeme ili relevantnost';

  @override
  String get channelHeaderSearchFilterDescOrder => 'uzlazno ili silazno';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString rezultata',
      one: '1 rezultat',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtriraj po korisniku';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtriraj po sadržaju';

  @override
  String get channelDetailsSearchSortBy => 'Sortiraj rezultate po';

  @override
  String get channelDetailsSearchIn => 'Pretraži u';

  @override
  String get channelDetailsSearchEmptyTitle => 'Pretraži ovaj razgovor';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Unesite tekst, autora ili filtar sadržaja za pretraživanje poruka.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Poruke se indeksiraju';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Pokušajte ponovno uskoro nakon što pretraživanje završi indeksiranje ovog opsega.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Nema rezultata';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Isprobajte drugačije pojmove za pretraživanje ili filtre.';

  @override
  String get channelDetailsMembersOnline => 'Na mreži';

  @override
  String get channelDetailsMembersOffline => 'Izvan mreže';

  @override
  String get channelDetailsMemberYou => 'Vi';

  @override
  String get channelDetailsSearchUsersHint => 'Pretražite korisnike';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Upišite za pretraživanje članova';

  @override
  String get channelDetailsSearchUsersEmpty => 'Nema pronađenih korisnika';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'Nema dostupnih korisnika';

  @override
  String get channelDetailsDone => 'Gotovo';

  @override
  String get channelDetailsHasFilterPrompt => 'Prikaži poruke koje sadrže:';

  @override
  String get channelDetailsRetry => 'Ponovi';

  @override
  String get channelDetailsPinnedMessageTitle => 'Priznata poruka';

  @override
  String get channelDetailsSearchResultTitle => 'Rezultat pretraživanja';

  @override
  String get channelDetailsJumpToMessage => 'Skoči na poruku';

  @override
  String get channelDetailsUnpinMessage => 'Otkvači poruku';

  @override
  String get channelDetailsCopyMessageLink => 'Kopiraj poveznicu poruke';

  @override
  String get channelDetailsCopyMessageId => 'Kopiraj ID poruke';

  @override
  String get channelDetailsMessageUnpinned => 'Poruka otkvačena';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Trenutna zajednica';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Trenutačna izravna poruka';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Sve zajednice';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Samo sve izravne poruke';

  @override
  String get channelDetailsSearchScopeAllDms => 'Sve izravne poruke';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Samo otvorene izravne poruke';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Otvorene izravne poruke';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Sve izravne poruke + zajednice';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Otvorene izravne poruke + zajednice';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Pretraživanje samo u trenutačnoj zajednici';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Pretraživanje samo u trenutačnoj izravnoj poruci';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'U svim zajednicama u kojima se trenutno nalazite';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Samo u svim izravnim porukama u kojima ste ikada bili';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'U svim izravnim porukama u kojima ste ikada bili';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'U svim izravnim porukama koje trenutno imate otvorene';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'U svim otvorenim izravnim porukama';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'U svim izravnim porukama u kojima ste ikada bili + svim zajednicama u kojima ste trenutno';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'U svim izravnim porukama koje trenutno imate otvorene + svim zajednicama u kojima ste trenutno član';

  @override
  String get channelDetailsSearchSortNewest => 'Prvo najnovije';

  @override
  String get channelDetailsSearchSortOldest => 'Prvo najstarije';

  @override
  String get channelDetailsSearchSortRelevance => 'Najrelevantnije';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Prikaži prvo najnovije poruke';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Prikaži prvo najstarije poruke';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Prikaži prvo najrelevantnije poruke';

  @override
  String get channelDetailsSearchContentImage => 'Prijenos slike';

  @override
  String get channelDetailsSearchContentVideo => 'Prijenos videozapisa';

  @override
  String get channelDetailsSearchContentAudio => 'Prijenos zvuka';

  @override
  String get channelDetailsSearchContentFile => 'Prijenos datoteke';

  @override
  String get channelDetailsSearchContentLink => 'Poveznica';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Pregled poveznice ili ugrađeni sadržaj';

  @override
  String get channelDetailsSearchContentSticker => 'Naljepnica';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Samo prenesene slikovne datoteke';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Samo prenesene videodatoteke';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Samo prenesene audiodatoteke';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Bilo koji preneseni privitak';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Upisani URL u tekstu poruke';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Dohvaćeni pretpregledi i obogaćeni ugrađeni sadržaj, ne prijenosi';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Naljepnica priložena poruci';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count vrste';
  }

  @override
  String get personalNotesTitle => 'Osobne bilješke';

  @override
  String get personalNotesSubtitle =>
      'Vaš privatni prostor za misli i podsjetnike';

  @override
  String groupDmWelcome(String displayName) {
    return 'Dobrodošli u $displayName. Dodajte prijatelje kako biste pokrenuli grupu.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Uredi grupu';

  @override
  String get groupDmWelcomeAddFriends => 'Dodaj prijatelje u grupu';

  @override
  String get dmGroupInvites => 'Pozivnice';

  @override
  String get groupDmEditTitle => 'Uredi grupu';

  @override
  String get groupDmEditDetailsTooltip => 'Uredi detalje grupe';

  @override
  String get groupDmGroupName => 'Naziv grupe';

  @override
  String get groupDmMyGroup => 'Moja grupa';

  @override
  String get groupDmGroupNameMaxLength =>
      'Naziv grupe ne smije prelaziti 100 znakova';

  @override
  String get groupDmGroupIcon => 'Ikona grupe';

  @override
  String get groupDmUploadIcon => 'Učitaj ikonu';

  @override
  String get groupDmChangeIcon => 'Promijeni ikonu';

  @override
  String get groupDmRemoveIcon => 'Ukloni ikonu';

  @override
  String get groupDmUpdated => 'Grupa ažurirana';

  @override
  String get groupDmUpdateFailed =>
      'Nije moguće ažurirati grupu. Pokušajte ponovno.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animirane ikone nisu podržane. Koristite statičnu sliku.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animirane ikone nisu podržane';

  @override
  String get groupDmIconFileTooLargeTitle => 'Datoteka ikone je prevelika';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Datoteka ikone je prevelika. Odaberite datoteku manju od $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Nepodržan format ikone';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Nepodržana vrsta datoteke.';

  @override
  String get groupDmCouldntProcessImage => 'Nije moguće obraditi sliku';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Obrada obrezane slike nije uspjela. Pokušajte ponovno.';

  @override
  String get groupDmInvalidImage => 'Nevažeća slika';

  @override
  String get groupDmInvalidImageBody =>
      'Slika nije važeća. Pokušajte s drugom.';

  @override
  String get groupDmAddFriends => 'Dodaj';

  @override
  String get groupDmOrSendInvite => 'ili pošaljite pozivnicu prijatelju:';

  @override
  String get groupDmGenerateInviteLink => 'Generiraj poveznicu za pozivnicu';

  @override
  String get groupDmCreateInvite => 'Stvori';

  @override
  String get groupDmInviteExpires24Hours => 'Vaša pozivnica istječe za 24 sata';

  @override
  String get groupDmAddFriendFailed =>
      'Nije moguće dodati ovog prijatelja u grupu. Pokušajte ponovno.';

  @override
  String get groupDmAddFailed => 'Nije moguće dodati u grupu';

  @override
  String get groupDmGroupFull =>
      'Ova je grupa puna. Uklonite nekoga prije dodavanja novih osoba.';

  @override
  String get groupDmRateLimited =>
      'Usporite malo. Pričekajte trenutak pa pokušajte ponovno.';

  @override
  String get groupDmCreateInviteFailed =>
      'Nije moguće stvoriti poveznicu za pozivnicu';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Nije moguće generirati poveznicu za pozivnicu. Pokušajte ponovno.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Nismo mogli stvoriti poveznicu za pozivnicu. Molimo pokušajte ponovno.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Nemaš dopuštenje za stvaranje pozivnice u ovom kanalu.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Ova zajednica je dosegla svoje ograničenje pozivnica.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Stvaranje pozivnica za ovu zajednicu privremeno je onemogućeno.';

  @override
  String get groupDmCopyInviteFailed =>
      'Kopiranje poveznice za pozivnicu nije uspjelo';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Samo vlasnik grupe može upravljati pozivnicama.';

  @override
  String get groupDmNoInvitesCreated => 'Nema izrađenih pozivnica';

  @override
  String get groupDmLoadingInvites => 'Učitavanje pozivnica...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Učitavanje pozivnica nije uspjelo. Pokušajte ponovno.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Opozvati ovu pozivnicu? Ne može se poništiti.';

  @override
  String get groupDmInviteRevoked => 'Pozivnica opozvana';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Stvorio/la $name. Istječe za $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Dobrodošli u $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'U početku nije bilo ničega. Zatim je došao $channelName. I bilo je dobro.';
  }

  @override
  String get personalNotesComposerHint => 'Poruči sam/a sebi';

  @override
  String channelComposerHint(String channelName) {
    return 'Poruka u #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Poruka @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Poruka za $groupName';
  }

  @override
  String get groupDmComposerHint => 'Grupa poruka';

  @override
  String get composerHint => 'Poruka';

  @override
  String get composerOpenExpressionPicker => 'Otvori birač emotikona';

  @override
  String get composerShowKeyboard => 'Prikaži tipkovnicu';

  @override
  String get composerCloseAttachmentPanel => 'Zatvori odabir privitaka';

  @override
  String get chatAttachmentPanelPhotos => 'Fotografije';

  @override
  String get chatAttachmentPanelFiles => 'Datoteke';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Potreban pristup fotogaleriji';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Dopusti pristup fotogaleriji za pregledavanje i dodavanje nedavnih fotografija i videozapisa.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Otvori postavke';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', šalje se';

  @override
  String get messageAccessibilityFailedSuffix => ', nije poslano';

  @override
  String get messageAccessibilityAttachmentSummary => 'privitak';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count privitaka';
  }

  @override
  String get messageAccessibilityImageSummary => 'slika';

  @override
  String get messageAccessibilityVideoSummary => 'videozapis';

  @override
  String get messageAccessibilityAudioSummary => 'audio datoteka';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'naljepnica $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'datoteka $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'attachment sa spojlerom';

  @override
  String get messageAccessibilityEmbedSummary => 'ugrađeni sadržaj';

  @override
  String get messageAccessibilityEmptySummary => 'poruka';

  @override
  String get personalNotesPrivateSpace => 'Vaš privatni prostor';

  @override
  String get purgePersonalNotes => 'Izbriši osobne bilješke';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Ovo će trajno izbrisati svaku poruku i privitak u vašim osobnim bilješkama. Ovo se ne može poništiti.';

  @override
  String get purgePersonalNotesConfirmButton => 'Izbriši';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Izbrisano $count poruka iz osobnih bilješki';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Osobne bilješke već su bile prazne';

  @override
  String get purgePersonalNotesFailed => 'Nije moguće obrisati osobne bilješke';

  @override
  String get userSettingsGroupYourAccount => 'VAŠ RAČUN';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Pretraži postavke...';

  @override
  String get userSettingsSearchFieldLabel => 'Pretražite postavke';

  @override
  String get userSettingsSearchClear => 'Očisti pretragu';

  @override
  String get userSettingsSearchNoResults => 'Nema pronađenih postavki';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sigurnost i prijava';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Pokloni';

  @override
  String get giftSettingsClaimAccountTitle => 'Preuzmite svoj račun';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Preuzmite svoj račun za iskorištavanje ili upravljanje Plutonium kodovima za poklone.';

  @override
  String get giftSettingsRedeemTitle => 'Iskoristi poklon';

  @override
  String get giftSettingsRedeemDescription =>
      'Unesite poklon-kod za iskorištavanje Plutoniuma za svoj račun.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Unesite kod poklona…';

  @override
  String get giftSettingsRedeemButton => 'Iskoristi';

  @override
  String get giftSettingsRedeemSuccess =>
      'Poklon uspješno iskorišten. Uživajte u Plutoniumu.';

  @override
  String get giftSettingsPurchasedTitle => 'Kupljeni pokloni';

  @override
  String get giftSettingsPurchasedDescription =>
      'Upravljajte svojim kupljenim Plutonium kodovima za poklone. Podijelite URL poklona s nekim posebnim ili ga iskoristite za sebe!';

  @override
  String get giftSettingsEmptyTitle => 'Još nema poklona';

  @override
  String get giftSettingsEmptyDescription =>
      'Kupite Plutonium poklon s kartice Plutonium i podijelite ga s prijateljima.';

  @override
  String get giftSettingsGoToPlutonium => 'Idi na Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Učitavanje inventara poklona nije uspjelo';

  @override
  String get giftSettingsLoadFailedDescription => 'Pokušajte ponovno kasnije.';

  @override
  String get giftSettingsTryAgain => 'Pokušaj ponovno';

  @override
  String get giftSettingsGiftUrl => 'URL poklona';

  @override
  String get giftSettingsCopy => 'Kopiraj';

  @override
  String get giftSettingsCopied => 'Kopirano';

  @override
  String get giftSettingsGiftUrlCopied => 'URL poklona kopiran u međuspremnik!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Nije moguće kopirati URL poklona';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Kupljeno $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Iskorišteno $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Iskoristio/la $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Ovaj je poklon iskorišten';

  @override
  String get giftSettingsRedeemForYourself => 'Iskoristi za sebe';

  @override
  String get giftSettingsShareWithFriend => 'Podijeli s prijateljem';

  @override
  String get premiumPlutoniumTagline =>
      'Otključajte veća ograničenja i ekskluzivne značajke, a istovremeno podržite neovisnu komunikacijsku platformu.';

  @override
  String get premiumPurchaseMode => 'Način kupnje';

  @override
  String get premiumForMe => 'Za mene';

  @override
  String get premiumAsAGift => 'Kao poklon';

  @override
  String get premiumMonthly => 'Mjesečno';

  @override
  String get premiumYearly => 'Godišnje';

  @override
  String get premiumPerMonth => 'mjesečno';

  @override
  String get premiumPerYear => 'godišnje';

  @override
  String get premiumOneTimePurchase => 'jednokratna kupnja';

  @override
  String get premiumSave17 => 'Uštedite 17 %';

  @override
  String get premiumUpgradeNow => 'Nadogradi sada';

  @override
  String get premiumBuyGift => 'Kupi poklon';

  @override
  String get premiumOneYearGift => 'Poklon za 1 godinu';

  @override
  String get premiumOneMonthGift => 'Poklon za 1 mjesec';

  @override
  String get premiumMostPopular => 'Najpopularnije';

  @override
  String get premiumScrollPrompt =>
      'Pomaknite se prema dolje da biste vidjeli sve pogodnosti uključene u Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Besplatno ili Plutonium';

  @override
  String get premiumFreeColumn => 'Besplatno';

  @override
  String get premiumGiftSectionTitle => 'Poklonite Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Podijelite Plutonium iskustvo s prijateljima kupnjom poklon pretplate.';

  @override
  String get premiumGiftBannerOne => 'Čeka te novi kod za poklon!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Čeka vas $count novih kodova za poklon!';
  }

  @override
  String get premiumViewGifts => 'Prikaži poklone';

  @override
  String get premiumReadyToUpgrade => 'Spremni za nadogradnju?';

  @override
  String get premiumReadyToBuyGift => 'Želite kupiti poklon?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Mjesečno $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Godišnje $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 godina $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 mjesec $price';
  }

  @override
  String get premiumManageSubscription => 'Upravljanje pretplatom';

  @override
  String get premiumRedeemGiftCode => 'Iskoristi kôd poklona';

  @override
  String get premiumGiftBadge => 'Poklon';

  @override
  String get premiumCancelSubscriptionTitle => 'Otkaži pretplatu?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Zadržavate svoje pogodnosti do sljedećeg datuma obnove, a zatim imate razdoblje od 3 dana za ponovnu pretplatu i zadržavanje povijesti pretplate.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Otkaži pretplatu';

  @override
  String get premiumKeepSubscription => 'Zadrži pretplatu';

  @override
  String get premiumPurchaseHistoryTitle => 'Povijest kupnje';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Vaši nedavni računi. Da biste promijenili način plaćanja pretplate, dodajte ili odaberite jedan u portalu za naplatu i postavite ga kao zadani.';

  @override
  String get premiumManagePaymentMethods => 'Upravljanje načinima plaćanja';

  @override
  String get premiumBillingHistory => 'Povijest naplate';

  @override
  String get premiumSelfServeRefundTitle => 'Samostalni povrat';

  @override
  String get premiumSelfServeRefundButton => 'Vrati zadnju kupnju';

  @override
  String get premiumDisclaimerAgreementPrefix => 'Kupnjom prihvaćate naše ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Kupnjom ste prihvatili naše ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' i ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktivno do $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Otkazivanje';

  @override
  String premiumCancelsOn(String date) {
    return 'Poništava se $date. Pogodnosti ostaju aktivne do tada.';
  }

  @override
  String get premiumReactivateSubscription => 'Ponovno aktiviraj';

  @override
  String premiumGiftedUntil(String date) {
    return 'Poklonjeno do $date. Ne obnavlja se automatski.';
  }

  @override
  String get premiumGiftGraceEnded =>
      'Vrijeme poklona je isteklo. Pretplatite se kako biste zadržali Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Naplatit ćemo vam odmah. Preostalo poklon vrijeme dodaje se nakon plaćenog razdoblja, tako da se ništa neće izgubiti.';

  @override
  String get premiumComparisonFeatureColumn => 'Značajka';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Kupnjom ste prihvatili naše $terms i $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Samoposlužni povrat novca dostupan je unutar 3 dana od plaćanja, jednom svakih 30 dana. Povratom novca za pretplatu, pretplata se otkazuje. Kupci iz EU/EGP-a odriču se prava na odustajanje od kupnje u roku od 14 dana prilikom naplate kako bi odmah pristupili sadržaju. Koristite gumb za povrat novca u aplikaciji umjesto povrata putem banke. Povrati putem banke mogu trajno ograničiti vaš račun. Stripe sigurno obrađuje plaćanje. Nikada ne vidimo cijeli broj vaše kartice.';

  @override
  String get premiumTermsOfService => 'Uvjeti pružanja usluge';

  @override
  String get premiumPrivacyPolicy => 'Pravila privatnosti';

  @override
  String get premiumCheckoutStartFailedTitle => 'Nije moguće pokrenuti naplatu';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Nešto je pošlo po zlu prilikom pokretanja naplate. Pokušajte ponovno za nekoliko trenutaka.';

  @override
  String get premiumPlanUnavailable =>
      'Ovaj plan nije dostupan. Obratite se podršci.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Ovaj plan nije dostupan. Obratite se administratorima ove instance.';

  @override
  String get premiumCompletePaymentTitle => 'Dovrši plaćanje';

  @override
  String get premiumCompletePaymentBody =>
      'Sada prelazite na Stripe kako biste dovršili plaćanje. Vratite se u Fluxer nakon što završite.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Odaberite način plaćanja';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Platite automatskim Pixom za autorizaciju ponavljajućih naplata izravno s vašeg brazilskog bankovnog računa. Ili odaberite \"upotrijebi karticu\" za unos kreditne kartice na sljedećem zaslonu Stripe.';

  @override
  String get premiumUsePix => 'Upotrijebi Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Platite putem UPI-ja za postavljanje e-naloga usklađenog s RBI-jem iz vaše indijske banke. Ili odaberite upotrebu kartice za unos kreditne kartice na sljedećem zaslonu Stripe.';

  @override
  String get premiumUseUpi => 'Upotrijebi UPI';

  @override
  String get premiumUseCard => 'Koristi karticu';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Nije moguće otvoriti portal za naplatu';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Nešto je pošlo po zlu prilikom otvaranja portala za naplatu. Pokušajte ponovno za nekoliko trenutaka.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Već ste Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary već uključuje trajni pristup, pa ponavljajuća pretplata nije potrebna. I dalje možete kupovati poklone za druge.';

  @override
  String get premiumExistingSubscriptionTitle => 'Pretplata već postoji';

  @override
  String get premiumExistingSubscriptionBody =>
      'Pronašli smo postojeću pretplatu na Fluxer Plutonium za ovaj račun. Upravljajte njome u sigurnosnom portalu za naplatu kako biste ažurirali podatke o plaćanju ili provjerili status obnove. Ako ste upravo platili, pričekajte minutu i ponovno otvorite ovu stranicu.';

  @override
  String get premiumPurchasesDisabledTitle => 'Kupnja nije dostupna';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'Kupnje su onemogućene za ovaj račun. Obratite se na $supportEmail ako ovo izgleda pogrešno.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'Kupnje su onemogućene za ovaj račun. Obratite se administratorima ove instance ako ovo izgleda pogrešno.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Preuzmite svoj račun za kupnju Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Potrebno je potvrditi svoju e-poštu prije nego što možete kupiti Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Prilagođena korisnička oznaka';

  @override
  String get premiumPerkPerCommunityProfiles => 'Profili po zajednicama';

  @override
  String get premiumPerkMessageScheduling => 'Raspoređivanje poruka';

  @override
  String get premiumPerkProfileBadge => 'Značka profila';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Prilagođene video pozadine';

  @override
  String get premiumPerkEntranceSounds => 'Zvukovi ulaska';

  @override
  String get premiumPerkCommunities => 'Zajednice';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Ograničenje broja znakova u poruci';

  @override
  String get premiumPerkBookmarkedMessages => 'Označene poruke';

  @override
  String get premiumPerkFileUploadSize => 'Veličina datoteke za prijenos';

  @override
  String get premiumPerkEmojiStickerPacks => 'Paketi emotikona i naljepnica';

  @override
  String get premiumPerkSavedMedia => 'Spremljeni mediji';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Korištenje animiranih emojija';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Globalni pristup emojijima i naljepnicama';

  @override
  String get premiumPerkVideoQuality => 'Kvaliteta videa';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animirani avatari i naslovne slike profila';

  @override
  String get premiumPerkEarlyAccess => 'Rani pristup novim značajkama';

  @override
  String get premiumPerkCustomThemes => 'Prilagođene teme';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Do 4K/60fps';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly ili $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/mj.';

  @override
  String get storePlutoniumYearSuffix => '/god.';

  @override
  String get storePlutoniumPriceOr => 'ili';

  @override
  String get storePlutoniumEmojiTitle => 'Vaši emojiji posvuda';

  @override
  String get storePlutoniumEmojiBody =>
      'Koristite prilagođene emojije i naljepnice iz bilo koje svoje zajednice u svakom chatu i zajednici u kojoj se nalazite.';

  @override
  String get storePlutoniumProfileTitle => 'Profil koji se ističe';

  @override
  String get storePlutoniumProfileBody =>
      'Nabavite animirani avatar i naslovnu sliku, značku pretplatnika, željenu četveroznamenkastu oznaku nakon korisničkog imena* i zaseban profil za svaku zajednicu.';

  @override
  String get storePlutoniumFilesTitle => 'Šaljite datoteke do 500 MB';

  @override
  String get storePlutoniumFilesBody =>
      'Dijelite videozapise pune duljine i velike datoteke bez prethodnog smanjivanja. Besplatni računi mogu slati do 25 MB.';

  @override
  String get storePlutoniumCompareTitle =>
      'Usporedite besplatni plan i Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Nisu sve ove značajke dostupne u mobilnoj aplikaciji. Neke su dostupne samo na stolnom računalu.';

  @override
  String get storePlutoniumNotAvailable => 'Nije dostupno';

  @override
  String get storePlutoniumAvailable => 'Dostupno';

  @override
  String get storePlutoniumCompareTag =>
      'Odaberite četveroznamenkasti broj nakon vašeg korisničkog imena*';

  @override
  String get storePlutoniumCompareProfile =>
      'Zaseban profil za svaku zajednicu';

  @override
  String get storePlutoniumCompareBadge =>
      'Značka pretplatnika na vašem profilu';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Pozadine videopoziva koje možete spremiti';

  @override
  String get storePlutoniumCompareCommunities =>
      'Zajednice kojima se možete pridružiti';

  @override
  String get storePlutoniumCompareCharacters => 'Znakova u jednoj poruci';

  @override
  String get storePlutoniumCompareBookmarks => 'Poruke koje možete označiti';

  @override
  String get storePlutoniumCompareUpload =>
      'Najveća datoteka koju možete prenijeti';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Medijske stavke koje možete spremiti za kasnije';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Koristite animirane emojije u porukama';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Koristite prilagođene emojije i naljepnice u bilo kojoj zajednici';

  @override
  String get storePlutoniumCompareVideo =>
      'Kvaliteta videopoziva i dijeljenja zaslona';

  @override
  String get storePlutoniumCompareAvatar =>
      'Animirani avatar i naslovna slika profila';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Rani pristup novim značajkama';

  @override
  String get storePlutoniumCompareThemes => 'Prilagođene teme za aplikaciju';

  @override
  String get storePlutoniumVideoFree => 'Do 720p pri 30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => 'Do 4K pri 60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      'Možete odabrati samo oznaku koju nitko drugi s istim korisničkim imenom već nema. Korisnička imena ne razlikuju velika i mala slova, tako da se Mina#4821 i mina#4821 smatraju istima. Oznaka #0000 rezervirana je za članove Fluxer Visionary.';

  @override
  String get storePlutoniumLearnVisionary =>
      'Saznajte više o programu Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Želite li samo podržati razvoj Fluxera otvorenog koda? ';

  @override
  String get storePlutoniumDonateLink => 'Donirajte umjesto toga.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Pretplatom financirate Fluxer i otključavate';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Prilagođeni emojiji i naljepnice u bilo kojem chatu';

  @override
  String get storePlutoniumHighlightProfile =>
      'Animirani profil, značka i odabrani četveroznamenkasti broj';

  @override
  String get storePlutoniumHighlightFiles => 'Prijenosi do 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'Šaljite poruke do 4000 znakova';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Zaseban profil za svaku zajednicu';

  @override
  String get storePlutoniumHighlightsMore => 'I više';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Automatski se obnavlja putem Google Playa dok ne otkažete.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Automatski se obnavlja putem App Storea dok ne otkažete.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Već imate pretplatu na Fluxer Plutonium.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Uštedite $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'Primili smo kupnju. Plutonium će se prikazati ovdje nakon aktivacije.';

  @override
  String get storePlutoniumUnavailable =>
      'Pretplate u aplikaciji još nisu dostupne na ovom uređaju.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary već uključuje trajni pristup, tako da ponavljajuća pretplata nije potrebna.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Nadzorna ploča privatnosti';

  @override
  String get userSettingsNavAuthorizedApps => 'Autorizirane aplikacije';

  @override
  String get userSettingsNavBlockedUsers => 'Blokirani korisnici';

  @override
  String get userSettingsNavLinkedDevices => 'Povezani uređaji';

  @override
  String get userSettingsNavConnections => 'Povezani računi';

  @override
  String get userSettingsNavLookAndFeel => 'Izgled i dojam';

  @override
  String get userSettingsNavAccessibility => 'Pristupačnost';

  @override
  String get userSettingsNavChat => 'Čavrljanje';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio i video';

  @override
  String get userSettingsNavShortcuts => 'Prečaci';

  @override
  String get audioAndVideoAudioSectionTitle => 'Zvuk';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Konfigurirajte mikrofon, zvučnike i obradu glasa.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Videozapis';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Prilagodite kvalitetu kamere i dijeljenja zaslona.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Ponašanje tijekom poziva';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Upravljajte upitima za potvrdu tijekom glasovnih i videopoziva.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Ulazni uređaj';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Izlazni uređaj';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Zadano';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Upotrijebi zvučnik';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Kad je isključeno, zvuk se reproducira putem slušalice ili povezanih slušalica.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Glasnoća ulaza';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Glasnoća izlaza';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Obrada glasa';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Fokusirani glas';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Preporučeno. Pročišćava mikrofon za jasan govor.';

  @override
  String get audioAndVideoDirectInputLabel => 'Izravan unos';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Šalje vaš zvuk netaknut. Najbolje ako koristite vanjski audio softver.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Prilagođeno';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Sami prilagodite svaku postavku: potiskivanje buke, poništavanje jeke i pojačanje.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Suzbijanje buke';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Poboljšano';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standardno';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Ništa';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Poništavanje jeke';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatska kontrola pojačanja';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Ujednačava glasnoću mikrofona. Isključeno kada je uključeno pojačano suzbijanje.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Test mikrofona';

  @override
  String get audioAndVideoMicTestStartLabel => 'Pokreni test mikrofona';

  @override
  String get audioAndVideoMicTestStopLabel => 'Zaustavi test mikrofona';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName treba pristup mikrofonu za testiranje vašeg unosa.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Zrcali kameru';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kvaliteta kamere';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Kvaliteta dijeljenja zaslona';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Broj sličica u sekundi';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p i 60 FPS zahtijevaju $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Ovo trenutno dopušta dijeljenje zaslona do 720p pri 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return 'Aplikacija $productName treba pristup mikrofonu za prikaz vaših uređaja.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return 'Aplikacija $productName treba pristup kameri za prikaz vaših uređaja.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Ne pitaj kad skrivam svoju kameru';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Nemoj pitati kad skrivam dijeljenje zaslona';

  @override
  String get userSettingsNavNotifications => 'Obavijesti';

  @override
  String get notificationsGeneralSectionTitle => 'Općenito';

  @override
  String get notificationsEnableNotificationsLabel => 'Omogući obavijesti';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Primajte obavijesti kada dobijete poruke. Možda ćete morati dopustiti obavijesti za $productName u postavkama uređaja. Za kontrole po kanalu/zajednici otvorite postavke obavijesti iz izbornika zajednice.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Omogući obavijesti na radnoj površini';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Koristi centar za obavijesti OS-a. Za kontrole po kanalu/zajednici, desnom tipkom miša kliknite ikonu zajednice i otvorite postavke obavijesti.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Omogući obavijesti preglednika';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Primajte obavijesti kada dobijete poruke. Možda ćete morati dopustiti obavijesti u postavkama preglednika. Za kontrole po kanalu/zajednici desnom tipkom miša kliknite ikonu zajednice i otvorite postavke obavijesti.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Istek vremena neaktivnosti push obavijesti';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName izbjegava slanje push obavijesti na vaše mobilne uređaje dok ste za računalom. Odaberite koliko dugo morate biti neaktivni na računalu prije nego što počnete primati push obavijesti.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minuta';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minuta';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Postavke spominjanja';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Postavke spominjanja u odgovorima';

  @override
  String get notificationsMentionNoPreferenceName => 'Bez preferencija';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Poštujte namjeru pošiljatelja, bez upozorenja kada uključi/isključi spominjanje s @';

  @override
  String get notificationsMentionPreferMentionName => 'Uz @spominjanje';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Zadani odgovori uključuju spominjanje s @, a pošiljatelja se upozorava ako ga isključi';

  @override
  String get notificationsMentionPreferNoMentionName => 'Bez @spominjanja';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Zadani odgovori izostavljaju spominjanje s @, a pošiljatelja se upozorava ako ga omogući';

  @override
  String get notificationsTtsSectionTitle => 'Obavijesti putem govora';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Omogući reprodukciju govora /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Neka /tts pročita vašu poruku naglas. Onemogućavanjem ove postavke te se naredbe zadržavaju kao običan tekst.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Prilagodi brzinu reprodukcije u ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Pristupačnost';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => 'Automatsko čitanje poruka';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Pretvara dolazni sadržaj u govor, bez obzira na to je li došao iz /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Svi kanali';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Neka se svaka dolazna poruka pročita naglas, bez obzira na to koji je kanal otvoren.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Samo aktivni kanal';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Čita samo kanal koji gledate. Naracija vas prati između kanala.';

  @override
  String get notificationsTtsModeNeverName => 'Nikad automatski';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Ne čita ništa naglas osim ako netko ručno ne pokrene /tts.';

  @override
  String get notificationsTtsModeAriaLabel => 'Čitaj sve poruke naglas';

  @override
  String get notificationsSoundsSectionTitle => 'Zvukovi';

  @override
  String get notificationsMasterVolumeLabel => 'Glavna glasnoća';

  @override
  String get notificationsMasterVolumeDescription =>
      'Postavlja razinu za svaki zvučni efekt. Nadjačavanja za pojedine zvukove zanemaruju ovu postavku.';

  @override
  String get notificationsResetToDefaultVolume => 'Vrati na zadanu glasnoću';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Isključi sve zvukove obavijesti';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Vaše postojeće postavke zvuka obavijesti bit će zadržane.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Prikaži više zvučnih efekata';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Prikaži manje zvučnih efekata';

  @override
  String get notificationsPreviewSound => 'Pretpregled zvuka';

  @override
  String get notificationsPerSoundVolumeTitle => 'Glasnoća pojedinog zvuka';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Postavite prilagođene glasnoće za pojedinačne zvukove. Zvukovi bez nadjačavanja prate glavnu glasnoću.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktivne prilagodbe glasnoće za vlastite zvukove: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Slijedi glavno • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Vrati $label na glavnu glasnoću';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Poništi sve prilagodbe glasnoće';

  @override
  String notificationsMuteSound(String label) {
    return 'Isključi zvuk za $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Uključi zvuk za $label';
  }

  @override
  String get notificationsSoundMessage => 'Obavijesti o porukama u zajednici';

  @override
  String get notificationsSoundDirectMessage =>
      'Obavijesti o izravnim porukama';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Obavijesti o porukama trenutačnog kanala';

  @override
  String get notificationsSoundMute => 'Isključivanje mikrofona';

  @override
  String get notificationsSoundUnmute => 'Uključivanje mikrofona';

  @override
  String get notificationsSoundDeaf => 'Isključivanje zvuka';

  @override
  String get notificationsSoundUndeaf => 'Uključivanje zvuka';

  @override
  String get notificationsSoundUserJoin => 'Korisnik se pridružuje kanalu';

  @override
  String get notificationsSoundUserLeave => 'Korisnik napušta kanal';

  @override
  String get notificationsSoundUserMove => 'Korisnik je premjestio kanal';

  @override
  String get notificationsSoundViewerJoin =>
      'Gledatelj se pridružuje prijenosu';

  @override
  String get notificationsSoundViewerLeave => 'Gledatelj napušta prijenos';

  @override
  String get notificationsSoundVoiceDisconnect => 'Glasovna veza prekinuta';

  @override
  String get notificationsSoundIncomingRing => 'Dolazni poziv';

  @override
  String get notificationsSoundCameraOn => 'Kamera uključena';

  @override
  String get notificationsSoundCameraOff => 'Kamera isključena';

  @override
  String get notificationsSoundScreenShareStart => 'Početak dijeljenja zaslona';

  @override
  String get notificationsSoundScreenShareStop =>
      'Završetak dijeljenja zaslona';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Nije moguće ažurirati vremensko ograničenje push obavijesti. Pokušajte ponovno.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Nije moguće ažurirati preferencu za spominjanje. Pokušajte ponovno.';

  @override
  String get notificationsPermissionDeniedTitle => 'Obavijesti blokirane';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Nismo mogli omogućiti obavijesti. Dopustite dopuštenje za obavijesti da biste nastavili.';

  @override
  String get notificationsPushRelaySectionTitle =>
      'Prijenosnik push obavijesti';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider isporučuje push obavijesti samo preko vlastite usluge, pa obavijesti za ovaj uređaj idu kroz Fluxerov prijenosnik.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'Koristi Fluxerov push prijenosnik';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Ako ovo isključiš, push registracija ovog uređaja se uklanja i uređaj prestaje primati push obavijesti.';

  @override
  String get pushRelayConsentTitle => 'Prijenosnik push obavijesti';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider isporučuje push obavijesti samo preko vlastite usluge, pa obavijesti za ovaj uređaj idu kroz Fluxerov prijenosnik.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Prihvati ';

  @override
  String get pushRelayConsentNoticeLink =>
      'obavijest o privatnosti push prijenosnika';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' kako bi uključio push obavijesti na ovom uređaju. Dovoljno je prihvatiti jednom po uređaju.';

  @override
  String get pushRelayConsentAgree => 'Prihvati i nastavi';

  @override
  String get pushRelayConsentDecline => 'Ne sada';

  @override
  String get userSettingsNavLanguageAndTime => 'Jezik i vrijeme';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Jezik sučelja';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Odaberite jezik koji će se koristiti u cijeloj aplikaciji';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Otvori postavke jezika';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Format vremena';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Odaberite kako će se prikazivati vrijeme u aplikaciji';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Odabir formata vremena';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automatski';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-satni';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-satni';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Format vremena prema jeziku aplikacije: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Format vremena sustava: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Koristi regionalne postavke sustava za format vremena';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Nije uspjelo ažuriranje formata vremena';

  @override
  String get userSettingsNavDefaultApps => 'Zadane aplikacije';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Web-preglednik';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Odaberite koji će preglednik otvoriti kada dodirnete poveznicu.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Ako je aplikacija instalirana za neku web-lokaciju, poveznice će se prvo otvoriti u toj aplikaciji.';

  @override
  String get defaultAppsWebBrowserInApp => 'Ugrađeni preglednik';

  @override
  String get defaultAppsWebBrowserExternal => 'Vanjski preglednik';

  @override
  String get userSettingsNavAppIcon => 'Ikona aplikacije';

  @override
  String get appIconSectionTitle => 'Ikona aplikacije';

  @override
  String get appIconSectionDescription =>
      'Odaberite ikonu koja će se prikazati na početnom zaslonu.';

  @override
  String get appIconOptionDefault => 'Zadano';

  @override
  String get appIconOptionStarfield => 'Zvjezdano polje';

  @override
  String get appIconOptionSweden => 'Švedska';

  @override
  String get appIconUnsupported =>
      'Promjena ikone aplikacije nije dostupna na ovom uređaju.';

  @override
  String get userSettingsNavAdvanced => 'Napredno';

  @override
  String get advancedPerformanceReportingTitle =>
      'Izvješćivanje o performansama';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Pomozite poboljšati $productName dijeljenjem anonimnih podataka o rušenjima i performansama.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Šalji izvješća o rušenju i performansama';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Svi prijavljeni podaci su anonimni i šalju se samo na vlastitu servis za nadzor od strane $productName — ne koriste se pružatelji usluga trećih strana.';
  }

  @override
  String get advancedSettingsConfigure => 'Konfiguriraj';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privatnost';

  @override
  String get advancedSettingsCategoryAppearance => 'Izgled';

  @override
  String get advancedSettingsCategoryAccessibility => 'Pristupačnost';

  @override
  String get advancedSettingsCategoryChat => 'Čavrljanje';

  @override
  String get advancedSettingsCategoryMedia => 'Mediji';

  @override
  String get advancedSettingsCategoryVoice => 'Glas';

  @override
  String get advancedSettingsCategoryDeveloper => 'Za programere';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'Omogući odabir teksta';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Dopusti odabir teksta u aplikaciji';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Omogući sličice za brzu navigaciju kroz videozapis';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Sličica ili kadar uživo tijekom pomicanja videozapisa';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptička povratna veza';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Povratne vibracije za dodire i radnje. Neće se sinkronizirati na drugim uređajima.';

  @override
  String get advancedSettingShowNekoLabel => 'Prikaži Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Mačka Neko koja juri za vašim pokazivačem';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Prikaži Neko u polju za unos chata';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animacija zumiranja pri pokretanju';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Smanji logotip pri izlasku sa početnog zaslona';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Savjeti za tipkovnicu';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Savjeti za tipkovne prečace u opisima alata';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Omogući favorite';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Prikaži favorite u cijeloj aplikaciji';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Ponašanje pri pridruživanju glasovnom kanalu';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Potvrda ili dvostruki klik za pridruživanje glasovnim kanalima zajednice';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Za pridruživanje glasovnim kanalima potreban je dvostruki klik';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Potvrdi prije pridruživanja glasovnim kanalima';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Automatski pošalji GIF-ove kad su odabrani';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Automatski šalji GIF-ove iz birača bez potvrde';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Spremi GIF favorite kao spremljene medije';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Odaberite kako se pohranjuju omiljeni GIF-ovi sa zvjezdicom';

  @override
  String get advancedSettingMediaButtonsLabel => 'Gumbi za medije';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Prilagodite koje se tipke i indikatori prikazuju na multimedijskim prilozima i ugrađenim sadržajima';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Prenesi privitke prije slanja';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Počnite s prijenosom privitaka čim se dodaju u polje za unos poruke';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Ukloni parametre praćenja iz URL-ova';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automatski uklanja parametre za praćenje iz URL-ova u porukama koje šaljete';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Vjeruj svim vanjskim poveznicama';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Preskoči upozorenje o vanjskim poveznicama za sve domene';

  @override
  String get advancedSettingSearchEnginesLabel => 'Tražilice';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Konfigurirajte pretraživače koji se koriste za odabrani tekst';

  @override
  String get advancedSettingTranslatorsLabel => 'Prevoditelji';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Konfigurirajte pružatelje prijevoda koji se koriste za odabrani tekst';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Obrnuto pretraživanje slika';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Davatelji usluga obrnutog pretraživanja slika';

  @override
  String get advancedSettingMessageActionBarLabel => 'Traka radnji poruke';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Prilagodite traku radnji koja se prikazuje kada prijeđete mišem preko poruka';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Automatsko dovršavanje izraza';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Odaberite što se prikazuje kada upišete dvotočku u polje za unos poruke';

  @override
  String get advancedSettingInputButtonsLabel => 'Gumbi za unos poruke';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Odaberite koje se tipke prikazuju u polju za unos poruka';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Pomakni se na dno prilikom slanja poruke';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Odaberite kako se razgovor nastavlja nakon što pošaljete poruku';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Preskoči potvrdu za \"Označi sve kao pročitano\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Odmah označi sve nepročitane kanale pristigle pošte kao pročitane, bez traženja potvrde';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Sakrij utišane kanale po zadanim postavkama';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Sakrij kanale koje ste utišali iz bočnih traka zajednica';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Prikaži indikator GIF-a';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Prikaži indikator isteka privitka';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Prikaži gumb za brisanje';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Prikaži gumb za preuzimanje';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Prikaži gumb za favorite';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Prikaži gumb za skrivanje ugrađenog sadržaja';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Prikaži traku radnji poruke';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'Prikaži samo gumb Više';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Prikaži brze reakcije';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Omogući Shift za proširivanje';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Prikaži zadane emojije u automatskom dovršavanju izraza';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Prikaži prilagođene emojije u automatskom dovršavanju izraza';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Prikaži naljepnice u automatskom dovršavanju izraza';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Prikaži spremljene medije u automatskom dovršavanju izraza';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Prikaži gumb za GIF-ove';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Prikaži gumb za medije';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Prikaži gumb za naljepnice';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Prikaži gumb za emoji';

  @override
  String get advancedSettingShowSendButtonLabel => 'Prikaži gumb za slanje';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Prikaži upozorenja za novi uređaj';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Upit pri povezivanju novih audio uređaja';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Kontrole glasnoće veze';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Prikaži klizače glasnoće sudionika za svaki uređaj u glasovnim izbornicima';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Ponašanje pregleda dijeljenja zaslona';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Ponašanje pretpregleda, skočnog prozora i sličice streama';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'Kodek za dijeljenje zaslona';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Video kodek za dijeljenje zaslona';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatski (preporučeno)';

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
      'Pauziraj pretpregled mog dijeljenja zaslona u pozadini';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Sakrij sličicu pretpregleda mog streama';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Omogući način rada za razvojne programere';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Omogući način rada za razvojne programere';

  @override
  String get advancedSettingSearchEngineGoogle => 'Google';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'Bing';

  @override
  String get advancedSettingSearchEngineGoogleLens => 'Google Lens';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => 'Google prevoditelj';

  @override
  String get advancedSettingTranslatorDeepL => 'Duboko';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Zadana tražilica';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Odaberite koja će se tražilica koristiti prema zadanim postavkama prilikom pretraživanja odabranog teksta.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => 'Ugrađene tražilice';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Omogućite ili onemogućite ugrađene tražilice. Omogućene tražilice prikazuju se u kontekstnom izborniku poruke kada je tekst odabran.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Prilagođene tražilice';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Dodajte vlastite tražilice s prilagođenim uzorkom URL-a. Upotrijebite \'$query\' kao zamjenu za tekst pretraživanja.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Dodaj tražilicu';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Omogućite barem jednu tražilicu u nastavku.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Ukloni tražilicu';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Zadani prevoditelj';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Odaberite koji će se prevoditelj koristiti prema zadanim postavkama prilikom prevođenja odabranog teksta.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Ugrađeni prevoditelji';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Omogućite ili onemogućite ugrađene prevoditelje. Omogućeni prevoditelji pojavljuju se u kontekstnom izborniku poruke kada je tekst odabran.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Prilagođeni prevoditelji';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Dodajte vlastite prevoditelje s prilagođenim uzorkom URL-a. Upotrijebite \'$query\' kao zamjenu za tekst koji treba prevesti.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Dodaj prevoditelja';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Omogućite barem jednog prevoditelja u nastavku.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Ukloni prevoditelja';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Zadana obrnuta pretraga slika';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Odaberite koju uslugu obrnutog pretraživanja slika želite koristiti kao zadanu pri pretraživanju slike.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Ugrađena obrnuta pretraga slika';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Omogućite ili onemogućite ugrađene pružatelje usluga obrnutog pretraživanja slika. Omogućeni pružatelji pojavljuju se u kontekstnom izborniku slika, avatara, natpisa, naljepnica i emojija.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Prilagođena obrnuta pretraga slika';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Dodajte vlastite pružatelje pretraživanja slika unazad s prilagođenim uzorkom URL-a. Upotrijebite \'$url\' kao zamjenu za URL slike.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Dodaj obrnuto pretraživanje slika';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Omogućite barem jednog pružatelja obrnutog pretraživanja slika u nastavku.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Ukloni obrnuto pretraživanje slika';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Dodaj tražilicu';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Uredi tražilicu';

  @override
  String get advancedSettingAddTranslatorTitle => 'Dodaj pružatelja prijevoda';

  @override
  String get advancedSettingEditTranslatorTitle => 'Uredi pružatelja prijevoda';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Dodaj tražilicu za obrnuto pretraživanje slika';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Uredi tražilicu za obrnuto pretraživanje slika';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Naziv';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Uzorak URL-a';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Moja tražilica';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Moj prevoditelj';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Moja obrnuta pretraga slika';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Upotrijebite \'$query\' gdje treba umetnuti tekst za pretraživanje.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Upotrijebi \'$query\' tamo gdje bi se trebao umetnuti tekst za prijevod.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Upotrijebite \'$url\' gdje treba umetnuti URL slike.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Naziv je obavezan.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Uzorak URL-a je obavezan.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL uzorak mora sadržavati zamjenu za \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL uzorak mora sadržavati placeholder \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Uzorak URL-a mora biti važeći URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Dodaj';

  @override
  String get advancedSettingEditSearchProviderAction => 'Uredi';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Ukloni';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Jeste li sigurni da želite ukloniti $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Aplikacije';

  @override
  String get userSettingsNavAppLogs => 'Dnevnici aplikacije';

  @override
  String get userSettingsNavDeveloperTools => 'Alati za razvojne programere';

  @override
  String get userSettingsNavLimitsConfig => 'Konfiguracija ograničenja';

  @override
  String get userSettingsNavFeatureFlags => 'Zastavice značajki';

  @override
  String get userSettingsNavWhatsNew => 'Novosti';

  @override
  String get userSettingsJoinFluxerLabs => 'Pridruži se Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Licence aplikacije';

  @override
  String get userSettingsAppLicensesDescription =>
      'Otvoreni izvorni softver koji koristi ova aplikacija. Ova je aplikacija izgrađena pomoću Fluttera.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Nije moguće učitati licence aplikacije.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenci',
      one: '1 licenca',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Odjava';

  @override
  String get userSettingsLogOutConfirmTitle => 'Želite li se odjaviti?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Možete se ponovno prijaviti bilo kada.';

  @override
  String get quickSwitcherTabSearch => 'Pretraživanje';

  @override
  String get quickSwitcherTabFriends => 'Prijatelji';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Pretražite kanale, osobe ili zajednice';

  @override
  String get quickSwitcherSearchFriends => 'Pretražite prijatelje';

  @override
  String get quickSwitcherNoMatchesFound => 'Nema rezultata';

  @override
  String get quickSwitcherEmptyHint =>
      'Pokušajte s drugim imenom ili upotrijebite prefikse @ / # / ! / * za filtriranje rezultata.';

  @override
  String get quickSwitcherSectionPeople => 'Osobe';

  @override
  String get quickSwitcherSectionGroupMessages => 'Grupne poruke';

  @override
  String get quickSwitcherSectionTextChannels => 'Tekstualni kanali';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Glasovni kanali';

  @override
  String get quickSwitcherSectionCommunities => 'Zajednice';

  @override
  String get quickSwitcherSectionSettings => 'Postavke';

  @override
  String get quickSwitcherHomeLabel => 'Početna';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Izravne poruke';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoriti';

  @override
  String get quickSwitcherUserSettingsLabel => 'Korisničke postavke';

  @override
  String get quickSwitcherNotificationsLabel => 'Obavijesti';

  @override
  String get quickSwitcherBookmarksLabel => 'Oznake';

  @override
  String get savedMessagesEmptyTitle => 'Nema oznaka';

  @override
  String get savedMessagesEmptyBody =>
      'Označite poruke kako biste ih spremili za kasnije.';

  @override
  String get savedMessagesEndBody => 'Ovdje više nema ničega za vidjeti.';

  @override
  String get savedMessagesRemoveTooltip => 'Ukloni oznaku';

  @override
  String get savedMessagesAddedToast => 'Dodano u oznake';

  @override
  String get savedMessagesRemovedToast => 'Uklonjeno iz oznaka';

  @override
  String get quickSwitcherMentionsLabel => 'Spominjanja';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Još nema prijatelja';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Dodajte prijatelja za početak.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nijedan prijatelj ne odgovara pretrazi';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Pokušajte s drugim imenom.';

  @override
  String get quickSwitcherSearchAliasUser => 'Korisnik';

  @override
  String get quickSwitcherSearchAliasYou => 'Vi';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Privatne poruke';

  @override
  String get quickSwitcherSearchAliasMessages => 'Poruke';

  @override
  String get quickSwitcherSearchAliasFav => 'Omiljeni';

  @override
  String get quickSwitcherSearchAliasStarred => 'Označenim';

  @override
  String get quickSwitcherSearchAliasInbox => 'Pristigla pošta';

  @override
  String get quickSwitcherSearchAliasSaved => 'Spremljeno';

  @override
  String get uiClose => 'Zatvori';

  @override
  String get chatJumpToBottom => 'Skoči na dno';

  @override
  String get uiConfirm => 'Potvrdi';

  @override
  String get uiLoading => 'Učitavanje';

  @override
  String get uiSearch => 'Pretraživanje';

  @override
  String get uiStartCall => 'Započni poziv';

  @override
  String get uiStartVideoCall => 'Započni videopoziv';

  @override
  String get uiPlay => 'Reproduciraj';

  @override
  String get uiPause => 'Pauziraj';

  @override
  String get uiDownload => 'Preuzmi';

  @override
  String get uiMoreActions => 'Više radnji';

  @override
  String get uiUnsavedChanges => 'Nespremljene promjene';

  @override
  String get uiReset => 'Poništi';

  @override
  String get uiOpenColorPicker => 'Otvori birač boja';

  @override
  String get uiSelectPlaceholder => 'Odaberi';

  @override
  String get uiSearchPlaceholder => 'Pretraživanje';

  @override
  String get uiNoOptionsFound => 'Nema rezultata';

  @override
  String get uiDismissNotification => 'Odbaci obavijest';

  @override
  String get uiColorPickerTitle => 'Birač boje';

  @override
  String get mentionConfirmTitle => 'Spomenuti sve?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Ovo će obavijestiti $count članova. Nastaviti?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Ovo će obavijestiti $count članova na mreži. Nastaviti?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Ovo će obavijestiti $count članova s ulogom $roleName. Nastaviti?';
  }

  @override
  String get mentionConfirmButton => 'Spomeni';

  @override
  String get composerEmojiUnavailable => 'Ne možeš koristiti taj emoji ovdje.';

  @override
  String get instanceUrlLabel => 'URL instancea';

  @override
  String get instanceUrlPlaceholder => 'Unesite URL instance (npr. fluxer.app)';

  @override
  String get instanceUrlHelper =>
      'Koristite fluxer.app za službenu instancu ili točan URL samostalno hostirane instance.';

  @override
  String get resetToDefaultInstance => 'Vrati na Fluxer';

  @override
  String get instanceConnect => 'Poveži';

  @override
  String get instanceConnecting => 'Povezivanje…';

  @override
  String get instanceConnectFailed => 'Nije se moguće povezati s instancom';

  @override
  String get recentInstances => 'Nedavne instance';

  @override
  String removeRecentInstance(String domain) {
    return 'Ukloni $domain s nedavnih instanci';
  }

  @override
  String get instanceSheetTitle => 'Poveži se na instancu';

  @override
  String get changeInstance => 'Promijeni';

  @override
  String get instanceConnectionRequired => 'Poveži se s instancom za prijavu';

  @override
  String get comingSoon => 'Uskoro';

  @override
  String get guildNavbarDirectMessages => 'Izravne poruke';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Istraži zajednice koje se mogu otkriti';

  @override
  String get discoveryExplore => 'Istraži';

  @override
  String get discoveryExplorePublicCommunities => 'Istraži javne zajednice';

  @override
  String get discoveryListingSubheading =>
      'Želite staviti svoju zajednicu ovdje? Prijavite se ako ispunjavate uvjete u postavkama vaše zajednice > Otkrivanje.';

  @override
  String get discoverySearchCommunities => 'Pretražite zajednice';

  @override
  String get discoveryFilterByLanguage => 'Filtriraj po jeziku';

  @override
  String get discoveryAllLanguages => 'Svi jezici';

  @override
  String get discoveryAllCategories => 'Sve';

  @override
  String get discoveryCategoryGaming => 'Igranje';

  @override
  String get discoveryCategoryMusic => 'Glazba';

  @override
  String get discoveryCategoryEntertainment => 'Zabava';

  @override
  String get discoveryCategoryEducation => 'Obrazovanje';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Znanost i tehnologija';

  @override
  String get discoveryCategoryContentCreator => 'Kreator sadržaja';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime i manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmovi i TV';

  @override
  String get discoveryCategoryOther => 'Ostalo';

  @override
  String get discoveryNoCommunitiesMatch => 'Nema podudarnih zajednica.';

  @override
  String get discoveryJoinCommunity => 'Pridruži se zajednici';

  @override
  String get discoveryJoined => 'Pridruženi';

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
      other: '$countString člana',
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
      'Nešto je pošlo po zlu. Pokušajte ponovno za nekoliko trenutaka.';

  @override
  String get discoveryJoinErrorFullTitle => 'Ova je zajednica puna';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Ova je zajednica dosegla ograničenje broja članova, tako da joj se trenutačno ne možete pridružiti.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Dosegli ste ograničenje broja zajednica';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Dosegli ste najveći dopušteni broj zajednica. Napustite jednu i pokušajte ponovno.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Ne možete se pridružiti ovoj zajednici';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Zabranjen vam je pristup ovoj zajednici.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Ova zajednica više nije dostupna';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Moguće je da je napustila Otkrivanje ili isključila nova pridruživanja. Osvježite stranicu i više je nećete vidjeti.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Usporite malo';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Pričekajte trenutak pa pokušajte ponovno.';

  @override
  String get guildNavbarAddCommunity => 'Dodaj zajednicu';

  @override
  String get guildNavbarHelp => 'Pomoć';

  @override
  String get scrollIndicatorNew => 'NOVO';

  @override
  String get scrollIndicatorNewMessage => 'NOVA PORUKA';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Sažmi $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'odabrano';

  @override
  String get guildNavbarGuildUnread => 'nepročitano';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obavijesti',
      one: '1 obavijest',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'utišano';

  @override
  String get authShowPassword => 'Prikaži lozinku';

  @override
  String get authHidePassword => 'Sakrij lozinku';

  @override
  String get authCheckStillWorking => 'Još radimo na tome…';

  @override
  String get authVerificationFailed =>
      'Nije moguće dovršiti provjeru. Pokušajte ponovno.';

  @override
  String get chatLoadingMessages => 'Učitavanje poruka';

  @override
  String get friendsMessageFriend => 'Poruka';

  @override
  String get friendsFriendActions => 'Radnje prijatelja';

  @override
  String get friendsAcceptRequest => 'Prihvati zahtjev za prijateljstvo';

  @override
  String get friendsDeclineRequest => 'Odbij zahtjev za prijateljstvo';

  @override
  String get friendsCancelRequest => 'Poništi zahtjev za prijateljstvo';

  @override
  String get friendsOpenInbox => 'Pristigla pošta';

  @override
  String get profileRemoveFriend => 'Ukloni prijatelja';

  @override
  String get profileUnblockUser => 'Deblokiraj korisnika';

  @override
  String get profileAcceptFriendRequest => 'Prihvati zahtjev za prijateljstvo';

  @override
  String get profileCancelFriendRequest => 'Poništi zahtjev za prijateljstvo';

  @override
  String get profileSendFriendRequest => 'Dodaj prijatelja';

  @override
  String get accountOverflowMenu => 'Opcije računa';

  @override
  String get navHome => 'Početna';

  @override
  String get navNotifications => 'Obavijesti';

  @override
  String get navYou => 'Vi';

  @override
  String get guildFolderSettingsTitle => 'Postavke mape';

  @override
  String get guildFolderNameLabel => 'Naziv mape';

  @override
  String get guildFolderColorLabel => 'Boja mape';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Prikaži ikonu kada je sažeto';

  @override
  String get guildFolderIconLabel => 'Ikona mape';

  @override
  String get guildFolderDelete => 'Izbriši mapu';

  @override
  String get guildFolderIconFolder => 'Mapa';

  @override
  String get guildFolderIconStar => 'Zvijezda';

  @override
  String get guildFolderIconHeart => 'Srce';

  @override
  String get guildFolderIconBookmark => 'Oznaka';

  @override
  String get guildFolderIconGameController => 'Kontroler za igre';

  @override
  String get guildFolderIconShield => 'Štit';

  @override
  String get guildFolderIconMusicNote => 'Glazbena nota';

  @override
  String get guildFolderMarkAsRead => 'Označi mapu kao pročitanu';

  @override
  String get guildBulkMuteCommunities => 'Isključi obavijesti za zajednice';

  @override
  String get guildBulkUnmuteCommunities => 'Uključi obavijesti za zajednice';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Postavke obavijesti zajednice';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Postavke privatnosti zajednice';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Dopusti @everyone i @here';

  @override
  String get guildBulkAllowRoleMentions => 'Dopusti spominjanje uloge';

  @override
  String get guildBulkEnableMobilePush => 'Omogući mobilne push obavijesti';

  @override
  String get guildBulkDisableMobilePush => 'Isključi mobilne push obavijesti';

  @override
  String get guildBulkAllowDirectMessages => 'Dopusti izravne poruke';

  @override
  String get guildBulkBlockDirectMessages => 'Blokiraj izravne poruke';

  @override
  String get guildBulkAllowBotDirectMessages => 'Dopusti izravne poruke botova';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Blokiraj izravne poruke botova';

  @override
  String get guildNavbarGroupDm => 'Grupna izravna poruka';

  @override
  String get guildNavbarCreateChannel => 'Stvori kanal';

  @override
  String get guildNavbarChannelType => 'Vrsta kanala';

  @override
  String get guildNavbarTextChannel => 'Tekstualni kanal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Šaljite poruke, slike, GIF-ove i emotikone';

  @override
  String get guildNavbarVoiceChannel => 'Glasovni kanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Zajedno se družite uz glas, video i dijeljenje zaslona';

  @override
  String get guildNavbarLinkChannel => 'Poveži kanal';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Brzi pristup vanjskoj web-lokaciji ili resursu';

  @override
  String get guildNavbarNameLabel => 'Naziv';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Odabir vrste kanala';

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
  String get guildNavbarCreateCategory => 'Stvori kategoriju';

  @override
  String get guildNavbarNewCategoryHint => 'Nova kategorija';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Pozovi prijatelje u $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Primatelji će biti odvedeni u #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Pretražite prijatelje';

  @override
  String get guildNavbarNoFriendsYet => 'Još nema prijatelja';

  @override
  String get guildNavbarNoResults => 'Nema rezultata';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Ili pošaljite poveznicu za pozivnicu prijatelju:';

  @override
  String get guildNavbarInviteLink => 'Poveznica za pozivnicu';

  @override
  String get guildNavbarCopy => 'Kopiraj';

  @override
  String get guildNavbarCopied => 'Kopirano!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Vaša poveznica za pozivnicu istječe za 7 dana.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Ova poveznica za pozivnicu nikad ne istječe.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Vaša poveznica za pozivnicu istječe za $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Uredi poveznicu za pozivnicu';

  @override
  String get guildNavbarInviteLinkSettings => 'Postavke poveznice za pozivnicu';

  @override
  String get guildNavbarExpireAfter => 'Istječe nakon';

  @override
  String get guildNavbarMaxUses => 'Maksimalan broj korištenja';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Dodijeli privremeno članstvo';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Članovi će biti uklonjeni kada postanu offline, osim ako im se ne dodijeli uloga';

  @override
  String get guildNavbarCreateNewLink => 'Stvori novu poveznicu';

  @override
  String get guildNavbarSent => 'Poslano';

  @override
  String get guildNavbarInvite => 'Pozovi';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Napusti zajednicu';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Jeste li sigurni da želite napustiti ovu zajednicu? Više nećete moći vidjeti poruke.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Napusti zajednicu';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Izbrisati vaše poruke u ovoj zajednici?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Trajno izbriši svaku poruku koju si ovdje poslao, u svim kanalima. Ne može se poništiti.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Izbriši moje poruke';

  @override
  String get guildNavbarDeletedYourMessages => 'Izbrisali ste svoje poruke';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Nije moguće izbrisati vaše poruke';

  @override
  String get guildNavbarRemoveOverride => 'Ukloni nadjačavanje';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Iskljuceno do $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Samo za osoblje $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Pozivnice su trenutačno pauzirane u ovoj zajednici';

  @override
  String get guildNavbarDurationNever => 'nikad';

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
  String get guildNavbarOneUse => '1 korištenje';

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
  String get guildMenuCommunitySettings => 'Postavke zajednice';

  @override
  String get guildMenuEditCommunityProfile => 'Uredi profil zajednice';

  @override
  String get guildMenuUnmuteCommunity => 'Uključi obavijesti za zajednicu';

  @override
  String get guildMenuMuteCommunity => 'Isključi obavijesti za zajednicu';

  @override
  String get guildMenuHideMutedChannels => 'Sakrij utišane kanale';

  @override
  String get guildMenuDebugCommunity => 'Otklanjanje pogrešaka zajednice';

  @override
  String get guildMenuCopyCommunityId => 'Kopiraj ID zajednice';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Do $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Općenito';

  @override
  String get guildMenuSettingsRoles => 'Uloge i dopuštenja';

  @override
  String get guildMenuSettingsEmoji => 'Emojii';

  @override
  String get guildMenuSettingsStickers => 'Naljepnice';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sigurnost i moderiranje';

  @override
  String get guildMenuSettingsActivityLog => 'Evidencija aktivnosti';

  @override
  String get guildMenuSettingsWebhooks => 'Webhookovi';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'Prilagođena URL adresa pozivnice';

  @override
  String get guildMenuSettingsDiscovery => 'Otkrivanje';

  @override
  String get guildMenuSettingsMembers => 'Članovi';

  @override
  String get guildMenuSettingsInviteLinks => 'Pozivnice';

  @override
  String get guildMenuSettingsBans => 'Zabrane';

  @override
  String get guildMenuSettingsChannels => 'Kanali';

  @override
  String get guildSettingsNoPermission =>
      'Nemate dopuštenje za pregled ove kartice postavki.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikona';

  @override
  String get guildSettingsUploadImage => 'Učitaj sliku';

  @override
  String get guildSettingsOverviewBannerTitle => 'Naslovna slika';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Prenesite banner za svoj server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Naziv';

  @override
  String get guildSettingsOverviewNameHint => 'Moja super zajednica';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistika';

  @override
  String get guildSettingsOverviewMembers => 'Članovi';

  @override
  String get guildSettingsOverviewOnline => 'Na mreži';

  @override
  String get guildSettingsRolesDescription =>
      'Upotrijebi uloge za grupiranje članova i dodjeljivanje dopuštenja.';

  @override
  String get guildSettingsCreateRole => 'Stvori ulogu';

  @override
  String get guildSettingsRolesListTitle => 'Uloge';

  @override
  String get guildSettingsRolesNewRole => 'Nova uloga';

  @override
  String get guildSettingsRolesDeleteRole => 'Izbriši ulogu';

  @override
  String get guildSettingsRolesBackToRoles => 'Natrag na uloge';

  @override
  String get guildSettingsBackToSettings => 'Natrag na postavke';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Uredi \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Konfigurirajte postavke i dopuštenja uloge';

  @override
  String get guildSettingsRolesDisplaySection => 'Prikaz';

  @override
  String get guildSettingsRolesRoleName => 'Naziv uloge';

  @override
  String get guildSettingsRolesRoleColor => 'Boja uloge';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Upišite boju (hex, rgb(), hsl() ili naziv) ili upotrijebite birač.';

  @override
  String get guildSettingsRolesShowSeparately => 'Prikaži ovu ulogu zasebno';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Prikazuje članove s ovom ulogom u zasebnom odjeljku na popisu članova.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Dopusti spominjanje za ovu ulogu';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Članovi s dopuštenjem \"$permission\" uvijek mogu spomenuti uloge, bez obzira na ovu postavku.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Koristite ovaj gumb za brzo brisanje svih dopuštenja.';

  @override
  String get guildSettingsRolesClearPermissions => 'Obriši dopuštenja';

  @override
  String get guildSettingsRolesPermissionsSection => 'Dopuštenja';

  @override
  String get guildSettingsRolesSearchPermissions => 'Pretražite dopuštenja';

  @override
  String get guildSettingsRolesDenseLayout => 'Zgusnuti izgled';

  @override
  String get guildSettingsRolesComfyLayout => 'Ugodan izgled';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Prebaci na zgusnuti izgled';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Prebaci na ugodan izgled';

  @override
  String get guildSettingsRolesSingleColumn => 'Jedan stupac';

  @override
  String get guildSettingsRolesTwoColumns => 'Dva stupca';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Prebaci na jedan stupac';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Prebaci na dva stupca';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Nema pronađenih dopuštenja';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Prilagođeni redoslijed isticanja';

  @override
  String get guildSettingsRolesHoistOrder => 'Redoslijed isticanja';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Vrati na zadano';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Povucite uloge da biste prilagodili redoslijed kojim se prikazuju na popisu članova.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Nema istaknutih uloga. Omogućite opciju \"Prikaži ovu ulogu zasebno\" za ulogu da biste je vidjeli ovdje.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Ne možete urediti ovu ulogu jer je to vaša najviša uloga ili je iznad vas';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Potrebna ti je dozvola \"$permission\" za uređivanje ovih dozvola';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Ne možete urediti ulogu koja je na istoj razini ili iznad vaše najviše uloge';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Ne možete dodijeliti dopuštenje koje nemate';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Ne možete ukloniti ovo dopuštenje jer biste ga uklonili sami sebi';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Uloge su uspješno ažurirane';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Uloga je uspješno stvorena';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Uloga je uspješno izbrisana';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Redoslijed isticanja vraćen na zadano';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Naziv uloge je obavezan';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Dajte ulozi naziv prije spremanja.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Nije moguće stvoriti ulogu';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Nije moguće ažurirati uloge';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Nije moguće izbrisati ulogu';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" se ne može izbrisati. Pokušajte ponovno.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Nije moguće poništiti redoslijed isticanja';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Pokušajte ponovno za trenutak.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Jeste li sigurni da želite izbrisati ulogu $name? Članovi s ovom ulogom više je neće imati.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Cijela zajednica';

  @override
  String get permissionCategoryMessagesMedia => 'Poruke i mediji';

  @override
  String get permissionCategoryModeration => 'Moderiranje';

  @override
  String get permissionCategoryChannelAccess => 'Pristup kanalu';

  @override
  String get permissionCategoryChannelManagement => 'Upravljanje kanalima';

  @override
  String get permissionCategoryAudioVideo => 'Audio i video';

  @override
  String get permissionUnknown => 'Nepoznato dopuštenje';

  @override
  String get permissionAdministrator => 'Administrator';

  @override
  String get permissionAdministratorDescription =>
      'Daje sva dopuštenja i zaobilazi ograničenja kanala. Vrlo osjetljivo.';

  @override
  String get permissionViewActivityLog => 'Prikaz evidencije aktivnosti';

  @override
  String get permissionViewActivityLogDescription =>
      'Čitanje evidencije aktivnosti zajednice o promjenama i radnjama moderiranja.';

  @override
  String get permissionManageCommunity => 'Upravljanje zajednicom';

  @override
  String get permissionManageCommunityDescription =>
      'Uredite globalne postavke poput imena, opisa i ikone.';

  @override
  String get permissionManageRoles => 'Upravljanje ulogama';

  @override
  String get permissionManageRolesDescription =>
      'Stvaranje, uređivanje ili brisanje uloga ispod vaše najviše uloge. Omogućuje i uređivanje nadjačavanja dopuštenja kanala.';

  @override
  String get permissionManageChannels => 'Upravljanje kanalima';

  @override
  String get permissionManageChannel => 'Upravljanje kanalom';

  @override
  String get permissionManageChannelDescription =>
      'Preimenujte i uredite postavke ovog kanala.';

  @override
  String get permissionManagePermissions => 'Upravljanje dopuštenjima';

  @override
  String get permissionManagePermissionsDescription =>
      'Uredite nadjačavanja za uloge i članove u ovom kanalu.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Stvaranje, uređivanje ili brisanje webhookova za ovaj kanal.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Pogledajte popis članova ovog kanala.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Upravljajte poveznicama za pozivnice na ovom kanalu.';

  @override
  String get permissionOverwriteDeny => 'Odbij';

  @override
  String get permissionOverwriteInherit => 'Neutralno (naslijeđeno)';

  @override
  String get permissionOverwriteAllow => 'Dopusti';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Koristite ove gumbe za brzo postavljanje svih dopuštenja.';

  @override
  String get permissionManageChannelsDescription =>
      'Stvaranje, uređivanje ili brisanje kanala i kategorija.';

  @override
  String get permissionKickMembers => 'Izbaci članove';

  @override
  String get permissionBanMembers => 'Zabrani pristup članovima';

  @override
  String get permissionCreateInviteLinks => 'Stvaranje poveznica za pozivnice';

  @override
  String get permissionChangeOwnNickname => 'Promjena vlastitog nadimka';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Ažurirajte vlastiti nadimak.';

  @override
  String get permissionManageNicknames => 'Upravljanje nadimcima';

  @override
  String get permissionManageNicknamesDescription =>
      'Promijenite nadimke drugih članova.';

  @override
  String get permissionCreateEmojiStickers => 'Stvaranje emojija i naljepnica';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Prenesite nove emojije i naljepnice te upravljajte vlastitim kreacijama.';

  @override
  String get permissionManageEmojiStickers =>
      'Upravljanje emojijima i naljepnicama';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Uređivanje ili brisanje emojija i naljepnica koje su izradili drugi članovi.';

  @override
  String get permissionManageWebhooks => 'Upravljanje webhookovima';

  @override
  String get permissionManageWebhooksDescription =>
      'Stvaranje, uređivanje ili brisanje webhookova.';

  @override
  String get permissionSendMessages => 'Slanje poruka';

  @override
  String get permissionSendTtsMessages => 'Slanje TTS poruka';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Šalji poruke pretvorene iz teksta u govor.';

  @override
  String get permissionManageMessages => 'Upravljanje porukama';

  @override
  String get permissionManageMessagesDescription =>
      'Brisanje poruka drugih članova. Prikvačivanje se kontrolira zasebno.';

  @override
  String get permissionPinMessages => 'Prikvači poruke';

  @override
  String get permissionEmbedLinks => 'Ugrađivanje poveznica';

  @override
  String get permissionAttachFiles => 'Priloži datoteke';

  @override
  String get permissionMentionEveryone => 'Koristi @everyone/@here i @role';

  @override
  String get permissionMentionEveryoneDescription =>
      'Spomeni sve ili bilo koju ulogu (čak i ako za ulogu nije dopušteno spominjanje).';

  @override
  String get permissionUseExternalEmoji => 'Koristi vanjske emojije';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Upotrebljavaj emojije iz drugih zajednica.';

  @override
  String get permissionUseExternalStickers => 'Koristi vanjske naljepnice';

  @override
  String get permissionAddReactions => 'Dodavanje reakcija';

  @override
  String get permissionAddReactionsDescription =>
      'Dodaj nove reakcije na poruke.';

  @override
  String get permissionBypassSlowmode => 'Zaobiđi usporeni način rada';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Zanemari ograničenja broja poruka po kanalu.';

  @override
  String get permissionTimeOutMembers =>
      'Postavi vremensko ograničenje članovima';

  @override
  String get permissionTimeOutMembersDescription =>
      'Spriječite članove da šalju poruke, reagiraju i pridružuju se glasovnim kanalima na određeno vrijeme.';

  @override
  String get permissionViewChannel => 'Prikaz kanala';

  @override
  String get permissionViewChannelMembers => 'Prikaz članova kanala';

  @override
  String get permissionViewChannelMembersDescription =>
      'Pogledajte popis članova kanala u ovoj zajednici.';

  @override
  String get permissionConnect => 'Poveži';

  @override
  String get permissionSpeak => 'Govor';

  @override
  String get permissionStreamVideo => 'Prijenos videozapisa';

  @override
  String get permissionUseVoiceActivity => 'Koristi glasovnu aktivnost';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Bez ovog dopuštenja obavezna je značajka pritisni za govor.';

  @override
  String get permissionPrioritySpeaker => 'Prioritetni govornik';

  @override
  String get permissionMuteMembers => 'Utišaj članove';

  @override
  String get permissionDeafenMembers => 'Isključi zvuk članovima';

  @override
  String get permissionMoveMembers => 'Premještanje članova';

  @override
  String get permissionMoveMembersDescription =>
      'Povucite članove između kanala kojima mogu pristupiti.';

  @override
  String get permissionSetVoiceRegion => 'Postavi glasovnu regiju';

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
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return 'Iskorišteno je $staticCount statičnih, $animatedCount animiranih mjesta za emotikone';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Još nema prilagođenih emotikona.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return 'Preneseno $count naljepnica';
  }

  @override
  String get guildSettingsStickersEmpty => 'Još nema prilagođenih naljepnica.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Provjera članova';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Odaberite što članovi moraju imati prije nego što mogu objavljivati ili slati izravne poruke članovima zajednice.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Članovi s ulogama mogu zaobići ove provjere. Za javne prostore preporučujemo omogućavanje provjere.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Zajednice navedene u Otkrivanju zahtijevaju barem potvrđenu e-poštu. Opcija \"Ništa\" ne može se odabrati dok je Otkrivanje omogućeno.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Sadržaj za odrasle i upozorenja o sadržaju';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigurirajte označavanje sadržaja za odrasle i neobavezne upozorenja o sadržaju za članove.';

  @override
  String get guildSettingsModerationMatureToggle => 'Sadržaj za odrasle';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Označi ovu zajednicu kao onu koja sadrži sadržaj za odrasle.';

  @override
  String get guildSettingsVerificationNone => 'Ništa';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Provjera nije potrebna.';

  @override
  String get guildSettingsVerificationLow => 'Niska';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Zahtijeva potvrđenu adresu e-pošte.';

  @override
  String get guildSettingsVerificationMedium => 'Srednje';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Zahtijeva potvrđenu adresu e-pošte i račun star najmanje 5 minuta.';

  @override
  String get guildSettingsVerificationHigh => 'Visoka';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Zahtijeva sve što i srednja razina te članstvo u zajednici od najmanje 10 minuta.';

  @override
  String get guildSettingsVerificationHighest => 'Vrlo visoka';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Zahtijeva potvrđeni broj telefona.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Pratite radnje moderatora u cijeloj zajednici.';

  @override
  String get guildSettingsAuditLogEmpty => 'Još nema zapisa';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Ovdje će se prikazivati radnje moderiranja i promjene zajednice.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Svi korisnici';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Sve radnje';

  @override
  String get guildSettingsAuditLogNoReason => 'Razlog nije naveden.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Nepoznat korisnik';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Došlo je do pogreške pri učitavanju evidencije aktivnosti.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Nije moguće učitati evidenciju aktivnosti';

  @override
  String get guildSettingsAuditLogReason => 'Razlog';

  @override
  String get guildSettingsAuditLogSomeone => 'netko';

  @override
  String get guildSettingsAuditLogSomething => 'nešto';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'nepoznat entitet';

  @override
  String get guildSettingsAuditLogNothing => 'ništa';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Nepoznata meta';

  @override
  String get auditLogActionGuildUpdate => 'Zajednica ažurirana';

  @override
  String get auditLogActionChannelCreate => 'Kanal izrađen';

  @override
  String get auditLogActionChannelUpdate => 'Kanal ažuriran';

  @override
  String get auditLogActionChannelDelete => 'Kanal izbrisan';

  @override
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Dozvola kanala dodana';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Prebrisivanje kanala ažurirano';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Prebrisana dopuštenja kanala';

  @override
  String get auditLogActionMemberKick => 'Član izbačen';

  @override
  String get auditLogActionMemberPrune => 'Članovi uklonjeni';

  @override
  String get auditLogActionMemberBanAdd => 'Članu zabranjen pristup';

  @override
  String get auditLogActionMemberBanRemove => 'Članu ukinuta zabrana';

  @override
  String get auditLogActionMemberUpdate => 'Član ažuriran';

  @override
  String get auditLogActionMemberRoleUpdate => 'Uloge člana ažurirane';

  @override
  String get auditLogActionMemberMove => 'Član premješten';

  @override
  String get auditLogActionMemberDisconnect => 'Član odspojen';

  @override
  String get auditLogActionBotAdd => 'Bot dodan';

  @override
  String get auditLogActionRoleCreate => 'Uloga stvorena';

  @override
  String get auditLogActionRoleUpdate => 'Uloga ažurirana';

  @override
  String get auditLogActionRoleDelete => 'Uloga izbrisana';

  @override
  String get auditLogActionInviteCreate => 'Pozivnica izrađena';

  @override
  String get auditLogActionInviteUpdate => 'Pozivnica ažurirana';

  @override
  String get auditLogActionInviteDelete => 'Pozivnica izbrisana';

  @override
  String get auditLogActionWebhookCreate => 'Webhook izrađen';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook ažuriran';

  @override
  String get auditLogActionWebhookDelete => 'Webhook izbrisan';

  @override
  String get auditLogActionEmojiCreate => 'Emoji izrađen';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji ažuriran';

  @override
  String get auditLogActionEmojiDelete => 'Emoji izbrisan';

  @override
  String get auditLogActionStickerCreate => 'Naljepnica izrađena';

  @override
  String get auditLogActionStickerUpdate => 'Naljepnica ažurirana';

  @override
  String get auditLogActionStickerDelete => 'Naljepnica izbrisana';

  @override
  String get auditLogActionMessageDelete => 'Poruka izbrisana';

  @override
  String get auditLogActionMessageBulkDelete => 'Poruke izbrisane';

  @override
  String get auditLogActionMessagePin => 'Poruka prikvačena';

  @override
  String get auditLogActionMessageUnpin => 'Poruka otkvačena';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor je ažurirao postavke zajednice.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor je stvorio kanal $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor je ažurirao kanal $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor je izbrisao kanal $target.';
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
    return '$actor je dodao dopuštenja kanala za $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je dodao dopuštenja kanala za $target u $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor je ažurirao dopuštenja kanala za $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je ažurirao dopuštenja kanala za $target u kanalu $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor je uklonio dopuštenja kanala za $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je uklonio dopuštenja kanala za $target u $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor je izbacio $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor je zabranio $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor je vratio ban $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor je ažurirao $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor je ažurirao uloge za $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor je uklonio neaktivne članove.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor je uklonio članove neaktivne $days dana.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor je premjestio $target u drugi glasovni kanal.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je premjestio $target u kanal $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor je isključio $target iz glasovnog poziva.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor je dodao bota $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor je stvorio ulogu $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor je promijenio ulogu $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor je izbrisao ulogu $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor je stvorio pozivnicu $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je stvorio pozivnicu $target za $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor je ažurirao pozivnicu $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je ažurirao pozivnicu $target za kanal $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor je izbrisao pozivnicu $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor je izbrisao pozivnicu $target za kanal $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor je stvorio webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor je ažurirao webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor je izbrisao webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor je dodao/dodala emotikon $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor je ažurirao/la emotikon $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor je izbrisao/izbrisala emotikon $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor je dodao naljepnicu $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor je ažurirao naljepnicu $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor je izbrisao naljepnicu $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor je izbrisao poruku.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor je izbrisao poruku u $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor je izbrisao više poruka.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor je izbrisao $count poruka.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor je izbrisao više poruka u $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor je izbrisao $count poruka u kanalu $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor je prikvačio poruku.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor je prikvačio poruku u $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor je odspio poruku.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor je uklonio/uklonila poruku iz kanala $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor je izvršio reviziju na $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Ažurirano polje $field s $oldValue na $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Postavi $field na $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Izbrisano polje $field (bilo je $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Ažurirano $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Preimenovali smo zajednicu u $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Ažurirana je ikona zajednice.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Preimenovali smo kanal u $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Očišćena tema.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Ažurirana je tema na $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Omogućen je sadržaj za odrasle.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Onemogućen sadržaj za odrasle.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Postavi nadimak na $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Uklonjen nadimak $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Član je utišan.';

  @override
  String get auditLogChangeUnmutedMember => 'Član je odobren.';

  @override
  String get auditLogChangeDeafenedMember => 'Član je utišan.';

  @override
  String get auditLogChangeUndeafenedMember => 'Vratio/la je zvuk članu.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Dodao/la $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Uklonjene su $roles.';
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
    return 'Pozvao/la $value.';
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
  String get auditLogOptionInviteNeverExpires =>
      'Ova pozivnica nikad ne istječe.';

  @override
  String get auditLogOptionTemporaryMembership => 'Daje privremenu članarinu.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Dodjeljuje trajnu članarinu.';

  @override
  String get guildSettingsLoadMore => 'Učitaj više';

  @override
  String get guildSettingsLoadingMore => 'Učitavanje...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Pregledajte sve webhookove konfigurirane u vašoj zajednici i upravljajte njima.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nema webhookova';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Ova zajednica još nema nijedan webhook. Idite na $channelSettingsPath da biste ga stvorili.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Potrebna ti je dozvola \"$permission\" za pregled i uređivanje webhookova za ovu zajednicu.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Učitavanje webhookova nije uspjelo';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Došlo je do pogreške prilikom učitavanja webhookova. Pokušajte ponovno.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhookovi ažurirani';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Ažuriranje webhookova nije uspjelo';

  @override
  String get guildSettingsUnknownChannel => 'Nepoznat kanal';

  @override
  String get guildSettingsCopyUrl => 'Kopiraj URL';

  @override
  String get guildSettingsCopiedUrl => 'URL kopiran u međuspremnik';

  @override
  String get guildSettingsDeleteWebhook => 'Izbriši webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Postavite prilagođenu poveznicu za pozivnicu za svoj poslužitelj.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Spremi';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Upotreba';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count upotreba';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Uvrstite svoju zajednicu u Otkrivanje kako bi je drugi mogli pronaći i pridružiti joj se.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Nema dovoljno članova';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Vaša zajednica treba imati najmanje $count članova prije nego što se može navesti u Otkriću.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Na čekanju';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Odobreno';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Odbijeno';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Uklonjeno';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Razlog: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Vaša je zajednica navedena u Otkrivanju. Pojedinosti unosa možete ažurirati u nastavku ili ga povući da biste ga uklonili.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Vaša prijava čeka pregled. I dalje možete ažurirati pojedinosti unosa ili povući prijavu.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategorija';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Odaberite kategoriju koja najbolje opisuje vašu zajednicu. Možete je promijeniti bilo kada.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primarni jezik';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Jezik kojim govori većina vaše zajednice. Koristi se za filtriranje rezultata Otkrivanja.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Opis';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Opišite o čemu se radi u vašoj zajednici';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'Opis je obavezan.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Opis mora imati najmanje $minLength znakova.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Opis ne smije biti duži od $maxLength znakova.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Prilagođene oznake';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Do $maxTags oznaka pomaže ljudima pronaći tvoju zajednicu. Prikazuju se u pretraživanju Otkrića.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Dodajte oznaku i pritisnite Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Dodaj';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Ukloni oznaku $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Nije moguće dodati oznaku';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Oznake moraju imati od 2 do $maxLength alfanumeričkih znakova.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Možete dodati najviše $maxTags oznaka.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Primijeni';

  @override
  String get guildSettingsDiscoverySave => 'Spremi';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Povuci';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Prijava za Otkrivanje poslana';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Unos u Otkrivanju ažuriran';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Prijava za Otkrivanje povučena';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Nije moguće povući prijavu';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Pokušajte ponovno za trenutak.';

  @override
  String get guildSettingsMembersDescription =>
      'Pretražite i upravljajte članovima poslužitelja.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Pretražite po korisničkom imenu ili ID-u';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count članova';
  }

  @override
  String get guildMembersRecentTitle => 'Nedavni članovi';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Prikazano $displayedCount od ukupno $totalCount članova';
  }

  @override
  String get guildMembersSort => 'Sortiranje';

  @override
  String get guildSettingsMembersSortNewest => 'Prvo najnovije';

  @override
  String get guildMembersSortOldest => 'Prvo najstarije';

  @override
  String get guildMembersColumnName => 'Naziv';

  @override
  String get guildMembersColumnMemberSince => 'Član od';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Pridružio/la se ${productName}u';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Način pridruživanja';

  @override
  String get guildMembersColumnRoles => 'Uloge';

  @override
  String get guildMembersColumnActions => 'Radnje';

  @override
  String get guildMembersFilterMemberSince => 'Filtriraj po datumu učlanjenja';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtriraj po datumu stvaranja računa';

  @override
  String get guildMembersFilterJoinMethod =>
      'Filtriraj po načinu pridruživanja';

  @override
  String get guildMembersFilterRoles => 'Filtriraj po ulogama';

  @override
  String get guildMembersFilterAll => 'Sve';

  @override
  String get guildMembersFilterPast1Hour => 'Zadnjih sat vremena';

  @override
  String get guildMembersFilterPast24Hours => 'Zadnja 24 sata';

  @override
  String get guildMembersFilterPast7Days => 'Zadnjih 7 dana';

  @override
  String get guildMembersFilterPast2Weeks => 'Zadnja 2 tjedna';

  @override
  String get guildMembersFilterPast3Weeks => 'Zadnja 3 tjedna';

  @override
  String get guildMembersFilterPast4Weeks => 'Zadnja 4 tjedna';

  @override
  String get guildMembersFilterPast3Months => 'Zadnja 3 mjeseca';

  @override
  String get guildMembersFilterCustomRange => 'Prilagođeni raspon...';

  @override
  String get guildMembersDateRangeTitle => 'Prilagođeni raspon datuma';

  @override
  String get guildMembersDateAfter => 'Nakon datuma';

  @override
  String get guildMembersDateBefore => 'Prije datuma';

  @override
  String get guildMembersClearAll => 'Očisti sve';

  @override
  String get guildMembersRowsPerPage => 'Redaka po stranici';

  @override
  String get guildMembersEmptySearch => 'Nitko ne odgovara tom pretraživanju.';

  @override
  String get guildMembersLoadError =>
      'Došlo je do pogreške prilikom učitavanja članova. Pokušajte ponovno kasnije.';

  @override
  String get guildMembersIndexing => 'Indeksiranje članova…';

  @override
  String get guildMembersGoToPage => 'Idi na stranicu';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Idi na stranicu $page';
  }

  @override
  String get guildMembersJumpToPage => 'Skoči na stranicu';

  @override
  String get guildMembersJoinSourceCreator => 'Osnivač zajednice';

  @override
  String get guildMembersJoinSourceInvite => 'Pozovi';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Pozivnica ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Pozvao/la $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Prilagođeni URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Pozivnica za bota';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Administrator platforme';

  @override
  String get guildMembersJoinSourceDiscovery => 'Otkrivanje';

  @override
  String get guildMembersJoinMethodUnknown => 'Nepoznato';

  @override
  String get guildMembersCommunityOwner => 'Vlasnik zajednice';

  @override
  String get guildMembersViewAllRoles => 'Prikaži sve uloge';

  @override
  String get guildMembersJoinedJustNow => 'Upravo sada';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count minute',
      one: 'prije 1 minute',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count sata',
      one: 'prije 1 sat',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije # dana',
      one: 'prije 1 dan',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Članovi';

  @override
  String get guildMembersChannelListSelected => 'Članovi, odabrano';

  @override
  String get guildSettingsInvitesTitle => 'Pozivnice';

  @override
  String get guildSettingsInvitesDescription =>
      'Pregledajte sve pozivnice za ovu zajednicu. Za stvaranje nove pozivnice idite na kanal i upotrijebite gumb za pozivanje.';

  @override
  String get guildSettingsInvitesEmpty => 'Nema poveznica za pozivnice';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Ova zajednica još nema poveznica za pozivnice. Idite na kanal i izradite pozivnicu kako biste pozvali ljude.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Učitavanje pozivnica nije uspjelo';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Došlo je do pogreške prilikom učitavanja pozivnica. Pokušajte ponovno.';

  @override
  String get guildSettingsInvitesTryAgain => 'Pokušaj ponovno';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Prikaži datum stvaranja umjesto datuma isteka';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pauziraj pozivnice';

  @override
  String get guildSettingsInvitesEnableInvites => 'Omogući pozivnice';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pauziraj pozivnice za ovu zajednicu';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Omogući pozivnice za ovu zajednicu';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pauzirati pozivnice? Novi se korisnici neće moći pridružiti putem poveznica za pozivnice dok ih ponovno ne omogućite. To neće utjecati na postojeće članove.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Omogućiti pozivnice? Korisnici će se ponovno moći pridružiti ovoj zajednici putem poveznica za pozivnice.';

  @override
  String get guildSettingsInvitesPause => 'Pauziraj';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Pozivnice su pauzirane za ovu zajednicu.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Pozivnice su pauzirane jer je $productName otkrio potencijalni napad. Novi se korisnici trenutačno ne mogu pridružiti.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Pozivatelj:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kod:';

  @override
  String get guildSettingsInvitesLabelUses => 'Broj korištenja:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Stvoreno:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Istječe:';

  @override
  String get guildSettingsInvitesUnknown => 'Nepoznato';

  @override
  String get guildSettingsInvitesNoCategory => 'Bez kategorije';

  @override
  String get guildSettingsInvitesExpired => 'Isteklo';

  @override
  String get guildSettingsInvitesNever => 'Nikad';

  @override
  String get guildSettingsInvitesCopyLink => 'Kopiraj poveznicu za pozivnicu';

  @override
  String get guildSettingsInvitesRevoke => 'Opozovi pozivnicu';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Nije moguće opozvati pozivnicu';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Poveznica možda i dalje radi. Pokušajte ponovno za trenutak.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses upotreba';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Istječe $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Pregledajte zabranjene korisnike i upravljajte njima.';

  @override
  String get guildSettingsBansSearchHint => 'Pretražite zabrane';

  @override
  String get guildSettingsBansEmpty => 'Nema zabranjenih korisnika.';

  @override
  String get guildSettingsBanPermanent => 'Trajna zabrana';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Istječe $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Istječe';

  @override
  String get guildSettingsUnban => 'Vrati zabranu';

  @override
  String get guildSettingsBansLoading => 'Učitavanje zabranjenih korisnika';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nema zabrana koje odgovaraju vašoj pretrazi.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detalji zabrane';

  @override
  String get guildSettingsBanViewDetails => 'Prikaži detalje';

  @override
  String get guildSettingsBannedOn => 'Datum zabrane';

  @override
  String get guildSettingsBannedBy => 'Zabranu izdao';

  @override
  String get guildSettingsRevokeBanTitle => 'Opozovi zabranu';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Jeste li sigurni da želite opozvati zabranu za $displayName? Moći će se ponovno pridružiti zajednici.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Opozvan/a je zabrana za $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Nismo mogli učitati zabrane. Pokušajte ponovno.';

  @override
  String get guildSettingsRevokeBanError =>
      'Nije moguće opozvati zabranu. Pokušajte ponovno.';

  @override
  String get guildSettingsCommunitySettings => 'Postavke zajednice';

  @override
  String get guildSettingsDeleteCommunity => 'Izbriši zajednicu';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Jeste li sigurni da želite izbrisati ovu zajednicu? Ova se radnja ne može poništiti. Svi kanali, poruke i postavke bit će trajno izbrisani.';

  @override
  String get guildSettingsCommunityDeleted => 'Zajednica izbrisana';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Nije bilo moguće izbrisati ovu zajednicu';

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
      'Upravljajte profilom svoje zajednice, kanalima i zadanim postavkama.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Brendiranje';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Ažurirajte svoju ikonu, naziv, banner i pozadinu pozivnice';

  @override
  String get guildSettingsOverviewBannerUpload => 'Učitaj naslovnu sliku';

  @override
  String get guildSettingsOverviewIdleTitle => 'Postavke neaktivnosti';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfiguriraj AFK kanal i vremensko ograničenje';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sustav i dobrodošlica';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Odaberite odredište za sistemske i pozdravne poruke';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Zadane obavijesti';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Zajednice s više od 250 ljudi prisilno se prebacuju na postavku \"samo spominjanja\". Vaša je izvorna postavka sačuvana i bit će vraćena ako zajednica padne ispod 250 članova.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Napredno';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Dopusti fleksibilne nazive tekstualnih kanala';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Sakrij krunu vlasnika zajednice';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Odvojeni natpis';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Prikazuje naslovnu sliku u vlastitom odjeljku ispod zaglavlja zajednice.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Učitaj ikonu';

  @override
  String get guildSettingsOverviewRemoveImage => 'Ukloni';

  @override
  String get guildSettingsOverviewSplashTitle => 'Pozadinska slika pozivnice';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Pozadina ugrađenog chata';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Prikazuje se u pozivnicama u chatu.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Učitaj pozadinu';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Nema naslovne slike zajednice';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Nema pozadine pozivnice';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Pretpregled';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Pogledajte kako vaša pozivnica izgleda posjetiteljima.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Nazivi tekstualnih kanala';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Kruna vlasnika zajednice';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigurirajte prikazuje li se ikona krune pored vlasnika zajednice';

  @override
  String get guildSettingsSplashCardAlignment => 'Poravnanje kartice';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Sredina';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Lijevo';

  @override
  String get guildSettingsSplashAlignmentRight => 'Desno';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Primjenjuje se samo na širokim zaslonima.';

  @override
  String get permissionReadMessageHistory => 'Čitanje povijesti poruka';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Promijeni što korisnici bez dozvole \"$permission\" mogu vidjeti';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Upotrijebi namjenski prozor za postavljanje datuma početka povijesti poruka za članove koji nemaju dozvolu $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Otvori prag povijesti poruka';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Prag povijesti poruka';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Omogući prag povijesti poruka';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Granični datum';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Članovi bez povijesti čitanja poruka mogu vidjeti poruke poslane nakon ovog datuma.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Prag povijesti poruka ažuriran';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Dopusti velika slova i razmake u nazivima tekstualnih kanala. Isključeno ograničava nazive na mala slova s crticama i podvlakama.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Skriva ikonu krune pored vlasnika zajednice na svim prikazima.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animirane ikone zahtijevaju značajku zajednice Animiranih ikona.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animirani baneri zahtijevaju zajednicu s značajkom animiranih banera.';

  @override
  String get guildSettingsAfkChannel => 'AFK / kanal za neaktivne';

  @override
  String get guildSettingsAfkChannelHint =>
      'Premjesti članove u ovaj kanal kad su neaktivni.';

  @override
  String get guildSettingsNoAfkChannel => 'Nema AFK kanala';

  @override
  String get guildSettingsAfkTimeout => 'Vrijeme neaktivnosti';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minuta';

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
  String get guildSettingsSystemChannel => 'Odredišni kanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Poruke dobrodošlice i sustava pojavit će se ovdje.';

  @override
  String get guildSettingsNoSystemChannel => 'Nema sistemskog kanala';

  @override
  String get guildSettingsHideJoinMessages => 'Sakrij poruke o pridruživanju';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Sakriva poruke o pridruživanju u odredišnom kanalu.';

  @override
  String get guildSettingsDefaultNotifications => 'Zadane postavke obavijesti';

  @override
  String get guildSettingsNotificationsAll => 'Sve poruke';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Obavijesti o svim porukama';

  @override
  String get guildSettingsNotificationsMentions => 'Samo spominjanja';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Obavijesti samo o spominjanjima';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks. 10 MB. Min. 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maksimalno 10 MB. Minimum: 960×540px (16:9). Prikazuje se u pozivnicama u chatu.';

  @override
  String get guildSettingsModerationDescription =>
      'Konfigurirajte postavke provjere, filtriranja sadržaja i sadržaja za odrasle.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Zajednicama na popisu za otkrivanje dostupne su ograničene opcije moderiranja.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Filtriranje sadržaja';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Poruke se automatski provjeravaju radi otkrivanja eksplicitnog sadržaja u kanalima koji nisu označeni za sadržaj za odrasle.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Zajednice navedene u Otkrivanju moraju skenirati sve članove. Ova se postavka ne može promijeniti dok je Otkrivanje omogućeno.';

  @override
  String get guildSettingsContentFilterOff => 'Isključeno';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Neka se zajednica sama moderira';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtriraj članove bez uloga';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Preporučeno za većinu zajednica';

  @override
  String get guildSettingsContentFilterAll => 'Filtriraj sve članove';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maksimalna zaštita za prostore prikladne za obitelj';

  @override
  String get guildSettingsModerationMatureOff => 'Isključeno';

  @override
  String get guildSettingsModerationMatureOn => 'Uključeno';

  @override
  String get guildSettingsContentWarningToggle =>
      'Prikaži upozorenje o sadržaju';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Uključuje upit za pristanak prije ulaska u bilo koji kanal.';

  @override
  String get guildSettingsContentWarningText => 'Prilagođeni tekst upozorenja';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Ovo sadrži osjetljiv sadržaj.';

  @override
  String get guildSettingsModeration2faTitle => 'Obvezna 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Zahtijevajte dvostruku autentifikaciju za moderatore prije nego što mogu zabraniti, izbaciti, privremeno isključiti ili ukloniti poruke.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Zahtijevaj 2FA za radnje moderiranja';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Samo vlasnik zajednice može promijeniti ovu postavku';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Omogućite 2FA na svom računu da biste promijenili ovu postavku';

  @override
  String get guildSettingsEmojiSearchHint => 'Pretražite emojije';

  @override
  String get guildSettingsEmojiUploadTitle => 'Učitaj emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Mjesta za emojije';

  @override
  String get guildSettingsEmojiDropZone =>
      'Povucite i ispustite datoteke emojija ovdje';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Učitavanje emojija nije uspjelo. Pokušajte ponovno kasnije.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nema emojija koji odgovaraju vašoj pretrazi.';

  @override
  String get guildSettingsEmojiNoSlots => 'Nema dostupnih mjesta za emojije';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Dosegli ste maksimalan broj emojija. Izbrišite neke postojeće emojije kako biste oslobodili prostor.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Nazivi emojija moraju imati najmanje 2 znaka i mogu sadržavati slova, brojeve i podvlake. Emojiji moraju biti manji od $maxSize. Statične slike automatski se smanjuju na 128x128 piksela i komprimiraju. Animirani emojiji i SVG-ovi moraju već zadovoljavati ograničenje.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Učitavanje emojija';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emotikona',
      one: '# emotikon',
    );
    return 'Preneseno $_temp0. Ovo može potrajati malo.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Prijenos emojija nije uspio. Pokušajte ponovno.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Neki emojiji nisu mogli biti dodani';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Pregledajte ove datoteke i pokušajte ponovno s manjim ili jednostavnijim slikama.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Preimenuj emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2 – 32 znaka, slova, brojevi, podvlake.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emojii';

  @override
  String get guildSettingsEmojiColumnName => 'Naziv';

  @override
  String get guildSettingsEmojiColumnUploader => 'Učitao/la';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Nepoznato';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Izbriši emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Izbrisati :$name:? Ne može se poništiti.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Izbriši ovaj emoji iz pohrane i CDN-a';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Naziv emojija mora imati najmanje 2 znaka';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Naziv emojija mora imati najviše 32 znaka';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Nevažeći naziv emojija';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Nije moguće preimenovati ovaj emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Naziv je vraćen na prethodno stanje. Pokušajte ponovno za trenutak.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Ovaj emoji više ne postoji';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Možda je izbrisan. Naziv je vraćen na prethodno stanje.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Ne možete preimenovati ovaj emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Nemate dopuštenje za preimenovanje ovog emojija. Naziv je vraćen na prethodni.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Usporite malo';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Pričekajte trenutak pa pokušajte ponovno preimenovati.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Nije moguće izbrisati ovaj emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Ne možete izbrisati ovaj emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Dopusti drugima kloniranje tvojih emojija';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Kada je omogućeno, članovi drugih zajednica mogu koristiti prečac \"Kloniraj\" unutar aplikacije za vaše prilagođene emojije. To ih ne sprječava da sami spreme sliku i prenesu je.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Dopusti drugima kloniranje tvojih naljepnica';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Kada je omogućeno, članovi drugih zajednica mogu koristiti prečac \"Kloniraj\" unutar aplikacije jednim klikom za vaše prilagođene naljepnice. To ih ne sprječava da sami spremaju sliku i prenose je.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Samo članovi s \"$permission\" dopuštenjem mogu ovo promijeniti.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Nije moguće ažurirati kloniranje emojija';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Nije moguće ažurirati kloniranje naljepnica';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Neeanimirani emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animacije ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Pretražite naljepnice';

  @override
  String get guildSettingsStickerSlotsTitle => 'Mjesta za naljepnice';

  @override
  String get guildSettingsStickerUploadTitle => 'Učitaj naljepnicu';

  @override
  String get guildSettingsStickerDropZone =>
      'Ovdje povucite i ispustite datoteku naljepnice (jednu po jednu)';

  @override
  String get guildSettingsStickerDensity => 'Gustoća naljepnica';

  @override
  String get guildSettingsStickerDensityCozy => 'Ugodno';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompaktno';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Učitavanje naljepnica nije uspjelo';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Došlo je do pogreške prilikom učitavanja naljepnica. Pokušajte ponovno.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nema naljepnica koje odgovaraju vašoj pretrazi.';

  @override
  String get guildSettingsStickersEmptySearch => 'Nema pronađenih naljepnica';

  @override
  String get guildSettingsStickerNoSlots =>
      'Nema dostupnih mjesta za naljepnice';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Dosegli ste maksimalan broj naljepnica. Izbrišite neke postojeće naljepnice kako biste oslobodili prostor.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Naljepnice se spremaju u veličini 320x320 piksela i moraju biti manje od $maxSize. Statične slike automatski se smanjuju i komprimiraju. Animirane naljepnice i SVG-ovi već moraju biti unutar ograničenja.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Nepodržana datoteka naljepnice';

  @override
  String get guildSettingsStickerAddTitle => 'Dodaj naljepnicu';

  @override
  String get guildSettingsStickerEditTitle => 'Uredi naljepnicu';

  @override
  String get guildSettingsStickerNameLabel => 'Naziv';

  @override
  String get guildSettingsStickerNameHint => 'Moja super naljepnica';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Opis';

  @override
  String get guildSettingsStickerDescriptionHint => 'Opišite naljepnicu';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Oznake ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Dodaj oznaku';

  @override
  String get guildSettingsStickerTagAdd => 'Dodaj';

  @override
  String get guildSettingsStickerNameRequired => 'Naziv je obavezan';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Naziv mora imati najmanje 2 znaka';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Naziv mora imati najviše 30 znakova';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Opis mora imati najviše 500 znakova';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Nije moguće stvoriti ovu naljepnicu';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Naljepnica je prevelika';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Naljepnica se nije mogla dovoljno komprimirati';

  @override
  String get guildSettingsStickerDeleteTitle => 'Izbriši naljepnicu';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Izbrisati \"$name\"? Ne može se poništiti.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Izbriši ovu naljepnicu iz pohrane i CDN-a';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Nije moguće izbrisati ovu naljepnicu';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Ne možeš izbrisati ovu naljepnicu';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Da biste stvorili webhook, otvorite $channelSettingsPath. Još uvijek možete uređivati i organizirati sve postojeće webhookove ovdje.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Vaša prilagođena URL adresa neće raditi ako barem jedan kanal nije vidljiv svima.';

  @override
  String get guildSettingsVanityUrlRemove => 'Ukloni';

  @override
  String get guildSettingsBannedUsersTitle => 'Zabranjeni korisnici';

  @override
  String get guildSettingsInvitesTableInviter => 'Pozivatelj';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Kod';

  @override
  String get guildSettingsInvitesTableUses => 'Broj korištenja';

  @override
  String get guildSettingsInvitesTableCreated => 'Stvoreno';

  @override
  String get guildSettingsInvitesTableExpires => 'Istječe';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtriraj po korisniku';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtriraj po radnji';

  @override
  String get createDm => 'Stvori izravnu poruku';

  @override
  String get createGroupDm => 'Stvori grupnu izravnu poruku';

  @override
  String get createDmNewMessage => 'Nova poruka';

  @override
  String get createDmSelectFriends => 'Odaberi prijatelje';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Odaberite prijatelje za slanje poruke.';

  @override
  String get createDmSearchFriends => 'Pretražite prijatelje';

  @override
  String get createDmNoFriendsFound => 'Nema pronađenih prijatelja';

  @override
  String get createDmNoFriendsYet => 'Još nemate prijatelja';

  @override
  String get createDmClaimToStartDms =>
      'Preuzmite svoj račun za pokretanje izravnih poruka.';

  @override
  String get createDmVerifyToStartDms =>
      'Potvrdite svoju e-poštu za početak izravnih poruka.';

  @override
  String get createDmVerifyYourEmail => 'Potvrdite svoju e-poštu';

  @override
  String get createDmNewGroup => 'Nova grupa';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Stvori novu grupu s korisnikom $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Potvrdi novu grupu';

  @override
  String get createDmCreateNewGroup => 'Stvori novu grupu';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Ukloni $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Već imate grupu s ovim korisnicima. Želite li stvarno stvoriti novu? I to je u redu!';

  @override
  String get createDmNoActivityYet => 'Još nema aktivnosti';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Neke korisnike nije moguće dodati';

  @override
  String get createDmCreateWithoutThem => 'Stvori bez njih';

  @override
  String get createDmUnaddableIntro =>
      'Sljedeće osobe nije moguće dodati u ovu grupnu izravnu poruku:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Stvoriti grupni DM s preostalim primateljem/primateljima ($count) i preskočiti ostale?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Nema preostalih primatelja za stvaranje grupne izravne poruke.';

  @override
  String get createDmUnaddableUserNotFound => 'Korisnik nije pronađen';

  @override
  String get createDmUnaddableBlocked =>
      'Ne možete poslati poruku ovom korisniku';

  @override
  String get createDmUnaddableNotFriends => 'Nije na popisu prijatelja';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Ne dopušta dodavanje u grupne izravne poruke';

  @override
  String get createDmFailed =>
      'Nije moguće stvoriti razgovor. Pokušajte ponovno.';

  @override
  String get dmListMessagesTitle => 'Poruke';

  @override
  String get dmListDirectMessagesTitle => 'Izravne poruke';

  @override
  String get keybindsSearchShortcuts => 'Pretražite prečace';

  @override
  String get keybindSectionDefaults => 'Zadano';

  @override
  String get keybindSectionMessages => 'Poruke';

  @override
  String get keybindSectionNavigation => 'Navigacija';

  @override
  String get keybindSectionDragAndDrop => 'Povuci i ispusti';

  @override
  String get keybindSectionChat => 'Čavrljanje';

  @override
  String get keybindSectionVoiceAndVideo => 'Glasovni i video pozivi';

  @override
  String get keybindSectionMisc => 'Razno';

  @override
  String get keybindActionShowShortcutsList =>
      'Prikaži popis tipkovničkih prečaca';

  @override
  String get keybindActionCopyText => 'Kopiraj tekst';

  @override
  String get keybindActionMarkUnread => 'Označi kao nepročitano';

  @override
  String get keybindActionFocusTextarea => 'Fokusiraj tekstualno polje';

  @override
  String get keybindActionSwitchCommunities => 'Prebacivanje između zajednica';

  @override
  String get keybindActionSwitchChannels => 'Prebacivanje između kanala';

  @override
  String get keybindActionHistoryBack =>
      'Kretanje unatrag kroz povijest pregledanih kanala';

  @override
  String get keybindActionHistoryForward =>
      'Kretanje naprijed kroz povijest pregledanih kanala';

  @override
  String get keybindActionJumpUnreadChannels => 'Skoči na nepročitane kanale';

  @override
  String get keybindActionJumpMentionChannels =>
      'Skoči na nepročitane kanale sa spominjanjima';

  @override
  String get keybindActionJumpCurrentCall => 'Skoči na trenutačni poziv';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Prebaci se između posljednje zajednice i izravnih poruka';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Prebaci na prethodnu zajednicu ili izravne poruke';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Prebaci na sljedeću zajednicu ili izravne poruke';

  @override
  String get keybindActionGoToDms => 'Idi na izravne poruke';

  @override
  String get keybindActionGoToFirstCommunity => 'Idi na prvu zajednicu';

  @override
  String get keybindActionGoToSecondCommunity => 'Idi na drugu zajednicu';

  @override
  String get keybindActionGoToThirdCommunity => 'Idi na treću zajednicu';

  @override
  String get keybindActionGoToFourthCommunity => 'Idi na četvrtu zajednicu';

  @override
  String get keybindActionGoToFifthCommunity => 'Idi na petu zajednicu';

  @override
  String get keybindActionGoToSixthCommunity => 'Idi na šestu zajednicu';

  @override
  String get keybindActionGoToSeventhCommunity => 'Idi na sedmu zajednicu';

  @override
  String get keybindActionGoToEighthCommunity => 'Idi na osmu zajednicu';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Uključi/isključi brzi preklopnik';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Stvori zajednicu ili joj se pridruži';

  @override
  String get keybindActionStartDragAndDrop => 'Pokreni povlačenje i ispuštanje';

  @override
  String get keybindActionMove => 'Premjesti';

  @override
  String get keybindActionDropItem => 'Ispusti stavku';

  @override
  String get keybindActionCancel => 'Odustani';

  @override
  String get keybindActionMarkCommunityRead => 'Označi zajednicu kao pročitanu';

  @override
  String get keybindActionMarkChannelRead => 'Označi kanal kao pročitan';

  @override
  String get keybindActionStartGroupDm => 'Započni grupnu izravnu poruku';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Uključi/isključi prikvačene poruke';

  @override
  String get keybindActionToggleInbox => 'Uključi/isključi pristiglu poštu';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Označi gornji kanal pristigle pošte kao pročitan';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Označi sve kanale pristigle pošte kao pročitane';

  @override
  String get keybindActionToggleMemberList =>
      'Uključi/isključi popis članova ili glasovni razgovor';

  @override
  String get keybindActionToggleEmojiPicker => 'Uključi/isključi birač emojija';

  @override
  String get keybindActionToggleGifPicker => 'Uključi/isključi birač GIF-ova';

  @override
  String get keybindActionToggleStickerPicker =>
      'Uključi/isključi birač naljepnica';

  @override
  String get keybindActionScrollChatUp => 'Pomakni chat prema gore';

  @override
  String get keybindActionScrollChatDown => 'Pomakni chat prema dolje';

  @override
  String get keybindActionJumpOldestUnread =>
      'Skoči na najstariju nepročitanu poruku';

  @override
  String get keybindActionFocusComposer => 'Fokusiraj tekstualno polje';

  @override
  String get keybindActionUploadFile => 'Učitaj datoteku';

  @override
  String get keybindActionCopyChannelLink => 'Kopiraj poveznicu kanala';

  @override
  String get keybindActionToggleSavedMedia =>
      'Uključi/isključi spremljene medije';

  @override
  String get keybindActionSendVoiceMessage => 'Pošalji glasovnu poruku';

  @override
  String get keybindActionAnswerCall => 'Javi se na dolazni poziv';

  @override
  String get keybindActionDeclineCall => 'Odbij dolazni poziv';

  @override
  String get keybindActionStartDmCall =>
      'Započni poziv u izravnoj poruci ili grupi';

  @override
  String get keybindActionToggleSoundboard => 'Uključi/isključi zvučnu ploču';

  @override
  String get keybindActionToggleCompactCallView =>
      'Proširi ili sažmi kompaktni prikaz poziva';

  @override
  String get keybindActionPushToTalkPriority =>
      'Pritisni za govor (prioritetno)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioritet glasovne aktivnosti';

  @override
  String get keybindActionOpenHelp => 'Otvori pomoć';

  @override
  String get keybindActionSearchMessages => 'Pretraži poruke';

  @override
  String get keybindActionOpenContextMenu => 'Otvori kontekstni izbornik';

  @override
  String get keybindActionOpenSettings => 'Otvori postavke';

  @override
  String get keybindActionOpenThemeStudio =>
      'Otvori skočni prozor studija tema';

  @override
  String get keybindActionZoomIn => 'Povećaj prikaz';

  @override
  String get keybindActionZoomOut => 'Smanji prikaz';

  @override
  String get keybindActionZoomReset => 'Poništi zumiranje';

  @override
  String get clipboardPasteFailed =>
      'Nismo mogli zalijepiti. Međuspremnik je bio prazan ili blokiran za ovu aplikaciju.';

  @override
  String get homeQuickActionDms => 'Privatne poruke';

  @override
  String get assistantNeedsLogin => 'Prvo otvorite Fluxer i prijavite se.';

  @override
  String get assistantNotInVoice => 'Niste u pozivu.';

  @override
  String get assistantNotFound => 'Fluxer to nije mogao pronaći.';

  @override
  String get assistantDmsDisabled =>
      'Izravne poruke su onemogućene na ovoj instanci.';

  @override
  String get assistantFailed => 'Fluxer to nije mogao dovršiti.';

  @override
  String get assistantOkMuted => 'Mikrofon utišan.';

  @override
  String get assistantOkUnmuted => 'Mikrofon uključen.';

  @override
  String get assistantOkLeftVoice => 'Napustili ste glasovni kanal.';

  @override
  String get assistantOkJoinedVoice => 'Pridružujem se glasovnom kanalu.';

  @override
  String get assistantOkStartedCall => 'Pokrećem poziv.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Status postavljen na $status.';
  }

  @override
  String get assistantOkOpened => 'Otvaram Fluxer.';

  @override
  String get assistantOkMessageSent => 'Poruka poslana.';

  @override
  String get assistantOkCustomStatusSet => 'Prilagođeni status ažuriran.';

  @override
  String get assistantOkCustomStatusCleared => 'Prilagođeni status obrisan.';

  @override
  String get guildNavbarAnnouncementChannel => 'Kanal s obavijestima';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Objavljujte ažuriranja koja druge zajednice mogu pratiti na svojim kanalima';

  @override
  String get channelDetailsAnnouncementChannel => 'Kanal s obavijestima';

  @override
  String get channelSettingsAnnouncementChannel => 'Kanal s obavijestima';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Omogućuje drugim zajednicama da prate ovaj kanal i primaju kopije onoga što objavite.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Prestati biti kanal s obavijestima?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count kanala prati ovaj kanal. Pretvaranjem u tekstualni kanal ta se praćenja uklanjaju.',
      few:
          '$count kanala prate ovaj kanal. Pretvaranjem u tekstualni kanal ta se praćenja uklanjaju.',
      one:
          '$count kanal prati ovaj kanal. Pretvaranjem u tekstualni kanal to se praćenje uklanja.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Pretvaranjem ovog kanala u tekstualni kanal uklanjaju se praćenja svih kanala koji ga prate.';

  @override
  String get channelSettingsConvertChannel => 'Pretvori';

  @override
  String get channelSettingsConvertFailed =>
      'Nije moguće pretvoriti ovaj kanal';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Ovaj kanal i dalje prate drugi kanali. Uklonite ta praćenja prije pretvaranja.';

  @override
  String get channelMenuFollow => 'Prati kanal';

  @override
  String get channelFollowTitle => 'Prati ovaj kanal';

  @override
  String get channelFollowBody =>
      'Odaberite gdje će se objavljivati poruke. Praćenje možete prekinuti bilo kada u Postavkama zajednice → Webhookovi.';

  @override
  String get channelFollowCommunity => 'Zajednica';

  @override
  String get channelFollowChannel => 'Kanal';

  @override
  String get channelFollowSelectCommunity => 'Select a community';

  @override
  String get channelFollowSelectChannel => 'Select a channel';

  @override
  String get channelFollowAgeWarning =>
      'Ovo je kanal s dobnim ograničenjem. Ažuriranja mogu ići samo na kanale s dobnim ograničenjem.';

  @override
  String get channelFollowContentWarning =>
      'Ovaj kanal ima upozorenje o sadržaju. Ažuriranja mogu ići samo na kanale s upozorenjem o sadržaju ili dobnim ograničenjem.';

  @override
  String get channelFollowHiddenHint =>
      'Zajednice i kanali kojima ne možete upravljati webhookovima skriveni su.';

  @override
  String get channelFollowEmpty =>
      'Ne možete upravljati webhookovima ni u jednoj zajednici. Zamolite administratora da prati ovaj kanal.';

  @override
  String get channelFollowSubmit => 'Prati';

  @override
  String get channelFollowFailed => 'Nije moguće pratiti ovaj kanal.';

  @override
  String get channelFollowSuccessTitle => 'Stižu ažuriranja!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'Poruke objavljene u $sourceName prikazivat će se u #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'U redu!';

  @override
  String get channelFollowBarrier =>
      'Pratite ovaj kanal kako biste primali ove objave na kanalu po svom izboru.';

  @override
  String get channelHeaderFollow => 'Prati kanal';

  @override
  String get chatMessagePublish => 'Objavi';

  @override
  String get chatMessagePublished => 'Objavljeno';

  @override
  String get chatMessagePublishConfirmTitle => 'Objaviti poruku?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Ovo šalje kopiju svakom kanalu koji prati ovaj.';

  @override
  String get chatMessagePublishedToast => 'Poruka objavljena';

  @override
  String get chatMessageAlreadyPublished => 'Ova je poruka već objavljena.';

  @override
  String get chatMessagePublishFailedTitle => 'Nije moguće objaviti ovu poruku';

  @override
  String get chatMessagePublishFailedBody =>
      'Nešto je pošlo po zlu. Pokušajte ponovno za trenutak.';

  @override
  String get chatMessagePublishLimitTitle => 'Usporite';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Možete ponovno objaviti za $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Prebrzo objavljujete. Pokušajte ponovno za trenutak.';

  @override
  String get chatMessageDeletePublished =>
      'Ovo također uklanja kopije koje su poslane kanalima koji prate ovaj.';

  @override
  String get chatMessageEditPublishedTitle => 'Uredi objavljenu poruku?';

  @override
  String get chatMessageEditPublishedBody =>
      'Ovo ažurira kopije koje su poslane kanalima koji prate ovaj kanal.';

  @override
  String get chatMessageEditPublishedSave => 'Spremi';

  @override
  String get chatMessageEditLimitTitle => 'Usporite';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Ovu objavljenu poruku možete ponovno urediti za $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Prebrzo uređujete ovu objavljenu poruku. Pokušajte ponovno za trenutak.';

  @override
  String get chatMessageOriginalDeleted => '[Izvorna poruka izbrisana]';

  @override
  String get userTagCommunity => 'Zajednica';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username je postavio/la ovaj kanal da prati $source. Poruke objavljene tamo pojavit će se ovdje.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username je postavio/la ovaj kanal da prati $source.';
  }

  @override
  String get publishNudgeNotSent => 'Još nije poslano pratiteljima.';

  @override
  String get publishNudgeHideForever => 'Ne prikazuj ponovno';

  @override
  String get publishNudgeDismiss => 'Odbaci';

  @override
  String get channelSettingsFollowedChannels => 'Praćeni kanali';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Kanali s obavijestima koje ovaj kanal prati. Prekinite praćenje kako biste prestali primati kopije.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Kanali s obavijestima koje prate kanali u ovoj zajednici.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'Iz $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Ažuriranja su pauzirana jer izvorni kanal više nije dostupan.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Prekinuti praćenje $name?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Ovaj kanal prestat će primati kopije s tog kanala s obavijestima.';

  @override
  String get channelSettingsUnfollow => 'Prekini praćenje';

  @override
  String get channelSettingsUnfollowFailed =>
      'Couldn\'t unfollow this channel.';

  @override
  String channelSettingsDeliveredTo(String channelName) {
    return 'Delivered to #$channelName';
  }

  @override
  String get crosspostCommunityTitle => 'Zajednica';

  @override
  String get crosspostGoToCommunity => 'Idi na zajednicu';

  @override
  String get crosspostJoinCommunity => 'Pridruži se zajednici';

  @override
  String get crosspostSourceFailed =>
      'Nismo mogli učitati ovu zajednicu. Pokušajte ponovno za trenutak.';

  @override
  String get crosspostSourceUnavailable =>
      'This community is no longer available';

  @override
  String crosspostMembers(int count) {
    return '$count članova';
  }

  @override
  String crosspostOnline(int count) {
    return '$count na mreži';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuta',
      few: '$count minute',
      one: '$count minuta',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sekundi',
      few: '$count sekunde',
      one: '$count sekunda',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Nepodržana vrsta kanala';

  @override
  String get channelUnsupportedBody =>
      'Ova verzija aplikacije ne podržava ovu vrstu kanala.';

  @override
  String get channelDetailsUnsupportedChannel => 'Nepodržani kanal';

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
