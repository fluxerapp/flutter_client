// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class FluxerLocalizationsRo extends FluxerLocalizations {
  FluxerLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get reconnectingTitle => 'Am dat-o în bară!';

  @override
  String get reconnectingBody =>
      'Ceva nu este în regulă cu instanța.\nAr trebui să se rezolve într-o secundă!';

  @override
  String get gatewayReconnectingToast => 'Se reconectează…';

  @override
  String get gatewayConnectedToast => 'Conectat';

  @override
  String get sessionExpiredToast =>
      'Sesiunea ta a expirat. Te rugăm să te autentifici din nou.';

  @override
  String splashStartupFailed(String error) {
    return 'Eroare la pornire: $error';
  }

  @override
  String get retry => 'Reîncearcă';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Conexiune pierdută';

  @override
  String get splashViewOnStatusPage => 'Vezi pe pagina de stare';

  @override
  String get splashConnectionIssuesPrompt => 'Probleme de conexiune?';

  @override
  String get splashStatusPageLink => 'Pagină de stare';

  @override
  String get splashReadIncident => 'Citește incidentul';

  @override
  String get splashIncidentHistory => 'Istoric incidente';

  @override
  String get nagbarLearnMore => 'Află mai multe';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Mentenanță programată pentru $localizedTime. Durata estimată: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Se efectuează operațiuni de mentenanță. Durata estimată: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Mentenanța s-a încheiat.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Salut, $displayName, revendică-ți contul pentru a nu pierde accesul.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Salut, $displayName, te rugăm să-ți verifici adresa de e-mail.';
  }

  @override
  String get nagbarOpenSettings => 'Deschide setările';

  @override
  String get systemPermissionSettingsTitle => 'Activare permisiune';

  @override
  String get systemPermissionSettingsOpenSettings => 'Deschide setările';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName nu are acces la microfonul tău. Îl poți activa în setările de confidențialitate ale dispozitivului.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName nu are acces la camera ta. Poți activa accesul în setările de confidențialitate ale dispozitivului.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName nu are acces la biblioteca foto. Poți activa accesul în setările de confidențialitate ale dispozitivului.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName nu are permisiunea de a trimite notificări. O poți activa în setările dispozitivului tău.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Abonamentul tău nu a putut fi reînnoit, dar încă ai acces la beneficiile $productName până pe $graceDate. Acționează acum sau vei pierde toate beneficiile.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Abonamentul tău $productName a expirat. Reînnoiește acum pentru a păstra beneficiile.';
  }

  @override
  String get nagbarManageSubscription => 'Gestionează abonamentul';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Bine ai venit pe $productFullName. Explorează beneficiile $productName și gestionează-ți abonamentul.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Vezi funcționalitățile $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Ai un nou cod cadou care te așteaptă în inventarul de cadouri.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Ai $count coduri cadou noi care te așteaptă în inventarul de cadouri.';
  }

  @override
  String get nagbarViewGiftInventory => 'Vezi inventarul de cadouri';

  @override
  String get nagbarVisionaryMfa =>
      'Activează autentificarea în doi pași pentru a-ți proteja contul Visionary.';

  @override
  String get nagbarEnableMfa => 'Activează autentificarea în doi pași';

  @override
  String get nagbarTermsAcceptance =>
      'Am actualizat termenii. Te rugăm să îi revizuiești și să îi accepți pentru a continua.';

  @override
  String get nagbarReviewTerms => 'Revizuiește termenii';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Alătură-te $communityName pentru a discuta cu echipa și a fi la curent cu noutățile.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Alătură-te $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Activează notificările ca să nu ratezi mesaje și mențiuni.';

  @override
  String get nagbarEnableNotifications => 'Activează notificările';

  @override
  String get nagbarBillingPortalFailed =>
      'Nu am putut deschide portalul de facturare. Te rugăm să încerci din nou peste un moment.';

  @override
  String get welcomeBack => 'Bun venit înapoi';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'Te rugăm să introduci o adresă de email validă.';

  @override
  String get password => 'Parolă';

  @override
  String get forgotPassword => 'Ai uitat parola?';

  @override
  String get logIn => 'Autentificare';

  @override
  String get logInWithPasskey => 'Autentificare cu o cheie de acces';

  @override
  String continueWithSso(String provider) {
    return 'Continuă cu $provider';
  }

  @override
  String get ssoRequired =>
      'Este necesar SSO pentru a accesa această instanță.';

  @override
  String get organizationSsoProvider =>
      'Conectați-vă cu furnizorul de autentificare unică al organizației.';

  @override
  String get failedToStartSso => 'Autentificarea unică nu a putut fi inițiată';

  @override
  String get ssoCancelled => 'Autentificarea SSO a fost anulată';

  @override
  String preferSso(String provider) {
    return 'Preferi să folosești SSO? Continuă cu $provider.';
  }

  @override
  String get logInViaBrowser => 'Autentificare prin browser';

  @override
  String get needAccountPrompt => 'Ai nevoie de un cont? ';

  @override
  String get register => 'Înregistrare';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Verifică dacă ești om';

  @override
  String get captchaDescription =>
      'Trebuie să ne asigurăm că nu ești un robot. Te rugăm să finalizezi verificarea de mai jos.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Întâmpini probleme? Încearcă hCaptcha în schimb';

  @override
  String get captchaSwitchToTurnstile => 'Încearcă Turnstile în schimb';

  @override
  String get cancel => 'Anulează';

  @override
  String get ipAuthCheckEmail => 'Verifică-ți emailul';

  @override
  String ipAuthDescription(String email) {
    return 'Am trimis un link pe email pentru a autoriza această autentificare. Deschide-ți inboxul la $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Conexiune pierdută';

  @override
  String get ipAuthConnectionLostDescription =>
      'Am pierdut conexiunea în timp ce așteptam autorizarea. Te rugăm să încerci din nou.';

  @override
  String get ipAuthLinkExpired => 'Linkul de conectare a expirat';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Acest link de autorizare a expirat. Te rugăm să te autentifici din nou.';

  @override
  String get ipAuthResendEmail => 'Retrimite e-mailul';

  @override
  String get ipAuthResent => 'Retrimis';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Înapoi';

  @override
  String get next => 'Înainte';

  @override
  String get mfaTitle => 'Autentificare în doi pași';

  @override
  String get mfaChooseMethod => 'Alege o metodă de verificare';

  @override
  String get mfaMethodTotp => 'Aplicație de autentificare';

  @override
  String get mfaMethodWebauthn => 'Cheie de securitate / Parolă';

  @override
  String get mfaTotpDescription =>
      'Introdu codul de 6 cifre din aplicația de autentificare sau unul dintre codurile de rezervă.';

  @override
  String get mfaCodeLabel => 'Cod';

  @override
  String get mfaTryAnotherMethod => 'Încearcă altă metodă';

  @override
  String get mfaUseSecurityKey =>
      'Încearcă în schimb o cheie de securitate/passkey';

  @override
  String get accountSelectorTitle => 'Alege un cont';

  @override
  String get accountSelectorDescription =>
      'Selectează un cont pentru a continua sau adaugă altul.';

  @override
  String get accountAdd => 'Adaugă un cont';

  @override
  String get accountRemove => 'Elimină';

  @override
  String accountRemoveTitle(String username) {
    return 'Elimină $username';
  }

  @override
  String get accountRemoveDescription =>
      'Aceasta va elimina sesiunea salvată pentru acest cont.';

  @override
  String get accountRemoveOnlyDescription =>
      'Aceasta va elimina singurul cont salvat pe acest dispozitiv.';

  @override
  String get accountExpired => 'Expirat';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sesiunea a expirat pentru $identifier. Te rugăm să te autentifici din nou.';
  }

  @override
  String get accountManageTitle => 'Gestionează conturile';

  @override
  String get accountSwitchFailed =>
      'Nu s-a putut schimba contul. Încearcă din nou.';

  @override
  String get profileTabMenuSwitchAccounts => 'Schimbă conturile';

  @override
  String get statusChangeSheetTitle => 'Setează statusul';

  @override
  String get statusOnlineStatusSection => 'Status online';

  @override
  String get statusOnline => 'Conectat';

  @override
  String get statusIdle => 'Inactiv';

  @override
  String get statusDnd => 'Nu deranjați';

  @override
  String get statusInvisible => 'Invizibil';

  @override
  String get statusOffline => 'Deconectat';

  @override
  String get statusUntilIChangeIt => 'Până o modific eu';

  @override
  String get statusDontClear => 'Nu șterge';

  @override
  String get statusFor10Seconds => 'Pentru 10 secunde';

  @override
  String get statusClearAfter10Seconds => '10 secunde';

  @override
  String get statusClearAfter15Minutes => '15 minute';

  @override
  String get statusClearAfter30Minutes => '30 de minute';

  @override
  String get statusClearAfter1Hour => '1 oră';

  @override
  String get statusClearAfter3Hours => '3 ore';

  @override
  String get statusClearAfter4Hours => '4 ore';

  @override
  String get statusClearAfter8Hours => '8 ore';

  @override
  String get statusClearAfter24Hours => '24 de ore';

  @override
  String get statusClearAfter3Days => '3 zile';

  @override
  String get statusDndDescription => 'Nu vei primi notificări pe desktop';

  @override
  String get statusInvisibleDescription => 'Vei apărea offline';

  @override
  String get customStatusSetTitle => 'Setează status personalizat';

  @override
  String get customStatusCurrentHint => 'Status personalizat';

  @override
  String get customStatusClear => 'Șterge starea personalizată';

  @override
  String get customStatusPlaceholder => 'Ce se întâmplă?';

  @override
  String get customStatusChooseEmoji => 'Alege un emoji';

  @override
  String get customStatusClearAfter => 'Șterge după';

  @override
  String get customStatusSave => 'Salvează';

  @override
  String get accountActive => 'Cont activ';

  @override
  String get signOut => 'Deconectare';

  @override
  String get suspendedPermanentTitle => 'Cont suspendat permanent';

  @override
  String get suspendedTemporaryTitle => 'Cont suspendat';

  @override
  String get suspendedPermanentDescription =>
      'Contul tău a fost suspendat permanent pentru încălcarea Termenilor și Condițiilor noastre.';

  @override
  String get suspendedTemporaryDescription =>
      'Contul tău a fost suspendat temporar. Vei putea accesa contul după ce perioada de suspendare se încheie.';

  @override
  String get suspendedIssuedAt => 'Efectuat';

  @override
  String get suspendedEndsAt => 'Sfârșit';

  @override
  String get suspendedDuration => 'Durată';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Motiv';

  @override
  String get suspendedAppealDeadline => 'Termen limită pentru apel';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Contul tău este programat pentru ștergere pe $date.';
  }

  @override
  String get suspendedRecheck => 'Verifică actualizări';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Verifică din nou în ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Înapoi la autentificare';

  @override
  String get suspendedAppealTitle => 'Apel';

  @override
  String get suspendedAppealHint =>
      'Explică de ce suspendarea ta ar trebui reanalizată (minimum 50 de caractere)...';

  @override
  String get suspendedAppealSubmit => 'Trimite apel';

  @override
  String get suspendedAppealPending => 'În așteptarea revizuirii';

  @override
  String get suspendedAppealAccepted => 'Apel acceptat';

  @override
  String get suspendedAppealRejected => 'Apel respins';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Apelul tău a fost acceptat și contul tău a fost reactivat.';

  @override
  String get suspendedSignIn => 'Autentifică-te în contul tău';

  @override
  String get forgotPasswordTitle => 'Ai uitat parola?';

  @override
  String get forgotPasswordDescription =>
      'Introdu adresa ta de e-mail și îți vom trimite un link pentru a-ți reseta parola.';

  @override
  String get forgotPasswordSubmit => 'Trimite link de resetare';

  @override
  String get forgotPasswordSentTitle => 'Verifică-ți emailul';

  @override
  String get forgotPasswordSentDescription =>
      'Am trimis instrucțiuni de resetare a parolei la adresa ta de e-mail. Verifică inboxul și urmează linkul pentru a-ți reseta parola.';

  @override
  String get forgotPasswordBackToLogin => 'Înapoi la autentificare';

  @override
  String get resetPasswordTitle => 'Setează o parolă nouă';

  @override
  String get resetPasswordDescription =>
      'Introdu noua parolă mai jos pentru a finaliza procesul de resetare.';

  @override
  String get resetPasswordNewPassword => 'Parolă nouă';

  @override
  String get resetPasswordConfirm => 'Confirmă parola nouă';

  @override
  String get resetPasswordSubmit => 'Resetare parolă';

  @override
  String get resetPasswordMismatch => 'Parolele nu se potrivesc.';

  @override
  String get registerTitle => 'Creează un cont';

  @override
  String get registerDisplayName => 'Nume afișat (Opțional)';

  @override
  String get registerDisplayNameHint => 'Cum ar trebui să te strige lumea?';

  @override
  String get registerUsername => 'Nume de utilizator (Opțional)';

  @override
  String get registerUsernameHint =>
      'Lasă necompletat pentru un nume de utilizator aleatoriu';

  @override
  String get registerUsernameTagHint =>
      'Se va adăuga automat o etichetă de 4 cifre pentru a asigura unicitatea';

  @override
  String get registerDateOfBirth => 'Data nașterii';

  @override
  String get registerMonth => 'Lună';

  @override
  String get registerDay => 'Ziua';

  @override
  String get registerYear => 'An';

  @override
  String get registerConsent =>
      'Sunt de acord cu Termenii de Serviciu și Politica de Confidențialitate';

  @override
  String get registerConsentPrefix => 'Sunt de acord cu ';

  @override
  String get registerConsentTerms => 'Termeni și condiții';

  @override
  String get registerConsentAnd => ' și ';

  @override
  String get registerConsentPrivacy => 'Politica de confidențialitate';

  @override
  String get registerConfirmPassword => 'Confirmă parola';

  @override
  String get registerSubmit => 'Creează cont';

  @override
  String get registerHaveAccount => 'Ai deja un cont? ';

  @override
  String get registerPendingApproval =>
      'Solicitarea ta de cont așteaptă aprobare. Te poți conecta după ce un administrator o aprobă.';

  @override
  String get registerClosed =>
      'Înregistrarea este închisă momentan. Folosește un link de înregistrare de la un administrator pentru a crea un cont.';

  @override
  String get passkeyNoCredentials =>
      'Nu au fost găsite chei de acces pentru această aplicație. Conectați-vă în schimb cu e-mail și parolă.';

  @override
  String get passkeyDeviceNotSupported =>
      'Cheile de acces nu sunt acceptate pe acest dispozitiv.';

  @override
  String get passkeyDomainNotAssociated =>
      'Cheile de acces nu sunt configurate pentru această aplicație. Conectați-vă în schimb cu e-mail și parolă.';

  @override
  String get passkeyTimeout =>
      'Autentificarea cu cheia de acces a expirat. Te rugăm să încerci din nou.';

  @override
  String get passkeyNotAvailable =>
      'Passkey-urile nu sunt disponibile pentru această aplicație. Conectează-te în schimb cu e-mail și parolă.';

  @override
  String get passkeyFailed =>
      'Autentificarea cu cheia de acces a eșuat. Te rugăm să încerci din nou.';

  @override
  String get errorUnableToCreateAccount =>
      'Nu am putut crea contul. Te rugăm să încerci din nou.';

  @override
  String get errorUnableToSignIn =>
      'Nu te putem conecta acum. Te rugăm să încerci din nou.';

  @override
  String get errorServiceUnavailable =>
      'Instanța aceasta este indisponibilă temporar. Încearcă din nou peste o clipă.';

  @override
  String get errorInvalidEmailOrPassword => 'Email sau parolă invalidă.';

  @override
  String get errorUnableToSendResetLink =>
      'Nu am putut trimite linkul de resetare. Te rugăm să încerci din nou.';

  @override
  String get errorUnableToResetPassword =>
      'Nu am putut reseta parola. Te rugăm să încerci din nou.';

  @override
  String get embedInviteJoin => 'Alătură-te comunității';

  @override
  String get embedInviteGoTo => 'Mergi la comunitate';

  @override
  String embedInviteOnline(String count) {
    return '$count online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count membri';
  }

  @override
  String get embedInviteUnknownTitle => 'Invitație necunoscută';

  @override
  String get embedInviteUnknownSubtitle => 'Încearcă să ceri o nouă invitație.';

  @override
  String get embedInviteUnavailable => 'Invitație indisponibilă';

  @override
  String get embedInviteJoinGroup => 'Alătură-te grupului';

  @override
  String get embedInviteAlreadyJoined => 'Deja înscris';

  @override
  String get embedInviteDisabled => 'Invitațiile sunt dezactivate';

  @override
  String get embedInvitePaused =>
      'Invitațiile sunt întrerupte pentru această comunitate.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName a detectat un potențial raid, așa că utilizatorii noi nu se pot alătura momentan.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Această comunitate a întrerupt invitațiile. Poți încerca din nou mai târziu.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName a detectat un potențial raid în această comunitate. Invitațiile sunt întrerupte, așa că utilizatorii noi nu se pot alătura momentan.';
  }

  @override
  String get inviteAcceptTitle => 'Ai fost invitat să te alături';

  @override
  String get inviteAcceptJoinButton => 'Alătură-te comunității';

  @override
  String get inviteAcceptGoToButton => 'Mergi la comunitate';

  @override
  String get inviteAcceptInvitesPaused => 'Invitații în pauză';

  @override
  String get inviteAcceptNotFoundTitle => 'Invitație invalidă';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Este posibil ca această invitație să fi expirat sau să fie invalidă.';

  @override
  String get invalidDeepLinkTitle => 'Linkul nu a putut fi deschis';

  @override
  String get invalidDeepLinkDescription =>
      'Acest link ar putea fi greșit, disponibil doar pe web sau s-ar putea să nu ai acces. Verifică linkul și încearcă din nou.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Mergi la pagina principală';

  @override
  String get inviteAcceptJoinGroupButton => 'Alătură-te grupului';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Ai fost invitat(ă) să te alături la un mesaj privat de grup de către $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'cineva';

  @override
  String get inviteAcceptEmojiPack => 'Pachet de emojiuri';

  @override
  String get inviteAcceptStickerPack => 'Pachet de stickere';

  @override
  String get inviteAcceptInstallEmojiPack => 'Instalează pachetul de emoji';

  @override
  String get inviteAcceptInstallStickerPack =>
      'Instalează pachetul de stickere';

  @override
  String get inviteAcceptPackInstallNote =>
      'Acceptarea acestei invitații va instala pachetul automat.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Acces la canal refuzat';

  @override
  String get channelAccessDeniedDescription =>
      'Nu ai acces la canalul unde a fost trimis acest mesaj.';

  @override
  String get messageJumpLinkNoAccess => 'Fără acces';

  @override
  String get okay => 'OK';

  @override
  String get embedThemeTitle => 'Temă partajată';

  @override
  String get embedThemeSubtitle =>
      'Acest client nu acceptă teme personalizate.';

  @override
  String get embedThemeUnavailableButton => 'Teme indisponibile';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Vizionar (pe viață $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zile de $productName',
      one: '1 zi de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count săptămâni de $productName',
      one: '1 săptămână de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count luni de $productName',
      one: '1 lună de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ani de $productName',
      one: '1 an de $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'De la $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Atinge pentru a revendica cadoul!';

  @override
  String get embedGiftAlreadyRedeemed => 'Deja revendicat';

  @override
  String get embedGiftClaimAccountHelp =>
      'Revendică-ți contul pentru a valorifica acest cadou.';

  @override
  String get embedGiftClaim => 'Revendică cadoul';

  @override
  String get embedGiftClaimed => 'Cadou revendicat';

  @override
  String get embedGiftClaimAccount => 'Revendică contul pentru a valorifica';

  @override
  String get embedGiftUnknownTitle => 'Cadou necunoscut';

  @override
  String get embedGiftUnknownSubtitle =>
      'Acest cod cadou este nevalid sau a fost deja revendicat.';

  @override
  String get embedGiftUnavailable => 'Cadou indisponibil';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Revendică-ți cadoul pentru a-ți activa abonamentul la $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Acest cadou a fost deja revendicat.';

  @override
  String get giftAcceptMaybeLater => 'Poate mai târziu';

  @override
  String get giftRedeemedToast => 'Cadou valorificat!';

  @override
  String get giftRedeemInvalidTitle => 'Cod cadou nevalid';

  @override
  String get giftRedeemInvalidMessage =>
      'Acest cod este nevalid sau a fost deja utilizat.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Cadoul a fost deja revendicat';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Acest cod a fost deja valorificat.';

  @override
  String get giftRedeemNotFoundTitle => 'Cadoul nu a fost găsit';

  @override
  String get giftRedeemNotFoundMessage => 'Acest cod nu există.';

  @override
  String get giftRedeemFailedTitle => 'Nu s-a putut răscumpăra cadoul';

  @override
  String get giftRedeemFailedMessage =>
      'Acest cadou nu a putut fi revendicat. Încearcă din nou.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Nu poți revendica acest cadou';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Conturile Visionary nu pot revendica cadouri Plutonium. Copiază linkul pentru a-l trimite unui prieten.';

  @override
  String get giftCopyLink => 'Copiază linkul cadoului';

  @override
  String get privacySettings => 'Setări de confidențialitate';

  @override
  String get privacyDirectMessages => 'Mesaje directe';

  @override
  String get privacyDirectMessagesDescription =>
      'Permite mesaje directe de la alți membri din această comunitate';

  @override
  String get privacyBotDirectMessages => 'Mesaje directe de la bot';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Permite roboților din această comunitate să-ți trimită mesaje directe';

  @override
  String get privacyMutualDmsDisabled =>
      'Administratorii comunității au dezactivat primirea mesajelor directe doar de la membrii comuni în această comunitate.';

  @override
  String get communityDebug => 'Debugare comunitate';

  @override
  String get copiedToClipboard => 'Copiat în clipboard';

  @override
  String get notificationSettings => 'Setări notificări';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Dezactivează notificările pentru $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Dezactivarea sunetului unei comunități împiedică apariția indicatorilor de necitit și a notificărilor, cu excepția cazului în care ești menționat';

  @override
  String get notificationCommunitySettings => 'Setări notificări comunitate';

  @override
  String get notificationAllMessages => 'Toate mesajele';

  @override
  String get notificationOnlyMentions => 'Doar mențiuni';

  @override
  String get notificationNothing => 'Nimic';

  @override
  String get notificationSuppressEveryone => 'Suprimă @everyone și @here';

  @override
  String get notificationSuppressRoles => 'Suprimă toate mențiunile de rol';

  @override
  String get notificationMobilePush => 'Notificări push mobile';

  @override
  String get notificationOverrides => 'Preferințe notificări';

  @override
  String get notificationSelectChannel => 'Selectează un canal sau o categorie';

  @override
  String get notificationOnlyAtMentions => 'Doar @mențiuni';

  @override
  String get notificationMuteChannel => 'Dezactivează sunetul canalului';

  @override
  String get notificationUnmuteChannel => 'Dezactivează notificările canalului';

  @override
  String get notificationUseCategoryDefault => 'Folosește implicit categoria';

  @override
  String get notificationUseCommunityDefault => 'Folosește implicit comunitar';

  @override
  String get notificationNoCategory => 'Nicio categorie';

  @override
  String get dmMarkAsRead => 'Marchează ca citit';

  @override
  String get dmMuteConversation => 'Dezactivează notificările conversației';

  @override
  String get dmUnmuteConversation => 'Activează sunetul conversației';

  @override
  String get dmPinDm => 'Fixează mesajul direct';

  @override
  String get dmUnpinDm => 'Anulează fixarea conversației';

  @override
  String get dmAlwaysShowInSidebar => 'Afișează mereu în bara laterală';

  @override
  String get dmRemoveFromAlwaysShown => 'Eliminare din Afișare permanentă';

  @override
  String get dmCloseDm => 'Închide conversația';

  @override
  String get dmCloseDmConfirmTitle => 'Închide conversația';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Ești sigur că vrei să închizi conversația privată cu $username? O poți redeschide oricând.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Ștergeți mesajele dvs. din această conversație?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Aceasta va șterge definitiv toate mesajele pe care le-ați trimis vreodată în această conversație. Această acțiune nu poate fi anulată.';

  @override
  String get dmCopyChannelId => 'Copiază ID-ul canalului';

  @override
  String get dmChannelIdCopied => 'ID canal copiat';

  @override
  String get dmCopyUserId => 'Copiază ID-ul utilizatorului';

  @override
  String get dmUserIdCopied => 'ID utilizator copiat';

  @override
  String get dmViewProfile => 'Vizualizați profilul';

  @override
  String get dmVoiceCall => 'Pornește apel vocal';

  @override
  String get incomingVoiceCallTitle => 'Apel vocal primit';

  @override
  String get incomingVoiceCallAccept => 'Acceptă';

  @override
  String get incomingVoiceCallDecline => 'Refuză';

  @override
  String get incomingVoiceCallLabel => 'Apel primit';

  @override
  String get incomingVoiceCallIgnore => 'Ignoră';

  @override
  String get directVoiceCallNotEligible =>
      'Apelul nu poate fi inițiat acum. Încearcă din nou peste o clipă.';

  @override
  String get voiceJoinCallFailed =>
      'Nu am putut să mă conectez la acest apel. Verifică-ți conexiunea și încearcă din nou.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Nu am putut să te alături la acest apel. Verifică-ți conexiunea și încearcă din nou.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Nu am putut actualiza acest apel pe server. Verifică-ți conexiunea și încearcă din nou.';

  @override
  String get dmAddNote => 'Adaugă notă';

  @override
  String get dmEditGroup => 'Editează grupul';

  @override
  String get dmInviteToCommunity => 'Invită în comunitate';

  @override
  String get dmBlock => 'Blochează';

  @override
  String get dmLeaveGroup => 'Părăsește grupul';

  @override
  String get dmNoCommunitiesAvailable => 'Nicio comunitate disponibilă';

  @override
  String dmGroupMemberCount(int count) {
    return '$count membri';
  }

  @override
  String get dmMuteFor15Min => 'Pentru 15 minute';

  @override
  String get dmMuteFor30Min => 'Pentru 30 de minute';

  @override
  String get dmMuteFor1Hour => 'Pentru 1 oră';

  @override
  String get dmMuteFor3Hours => 'Pentru 3 ore';

  @override
  String get dmMuteFor4Hours => 'Pentru 4 ore';

  @override
  String get dmMuteFor8Hours => 'Pentru 8 ore';

  @override
  String get dmMuteFor24Hours => 'Pentru 24 de ore';

  @override
  String get dmMuteFor3Days => 'Pentru 3 zile';

  @override
  String get dmMuteForever => 'Până o repornesc eu';

  @override
  String get dmPinGroupDm => 'Fixează conversația de grup';

  @override
  String get dmUnpinGroupDm => 'Eliminare fixare conversație de grup';

  @override
  String get dmUnnamedGroup => 'Grup fără nume';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grupul lui $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'DM favorit';

  @override
  String get dmUnfavoriteDm => 'Elimină de la favorite';

  @override
  String get dmFavoriteGroupDm => 'Favoritează conversația de grup';

  @override
  String get dmUnfavoriteGroupDm => 'Elimină din favorite conversația de grup';

  @override
  String get dmChangeFriendNickname => 'Schimbă porecla prietenului';

  @override
  String get dmRemoveFriend => 'Elimină prietenul';

  @override
  String get dmAddFriend => 'Adaugă prieten';

  @override
  String get dmAcceptFriendRequest => 'Acceptă cererea de prietenie';

  @override
  String get dmIgnoreFriendRequest => 'Ignoră cererea de prietenie';

  @override
  String get dmFriendRequestSent => 'Cerere de prietenie trimisă';

  @override
  String get dmUnblock => 'Deblochează';

  @override
  String get dmDebugUser => 'Depanează utilizatorul';

  @override
  String get dmDebugChannel => 'Depanează canalul';

  @override
  String get dmDebugCategory => 'Depanează categoria';

  @override
  String get dmPinned => 'Mesaj fixat';

  @override
  String get dmUnpinned => 'Mesaj direct anulat';

  @override
  String get dmMuted => 'Mesaj privat dezactivat';

  @override
  String get dmUnmuted => 'DM deblocat';

  @override
  String get dmRemoveFriendConfirmTitle => 'Elimină prietenul';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Ești sigur că vrei să-l elimini pe $username din lista de prieteni?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blochează utilizatorul';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Ești sigur că vrei să blochezi $username? Nu te vor mai putea contacta sau trimite cereri de prietenie.';
  }

  @override
  String get dmFriendRequestSentToast => 'Cerere de prietenie trimisă';

  @override
  String get dmFriendRequestFailed =>
      'Nu s-a putut trimite cererea de prietenie';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Nu am putut accepta cererea de prietenie';

  @override
  String get dmRemoveFriendFailed => 'Nu s-a putut elimina prietenul';

  @override
  String get dmBlockFailed => 'Nu s-a putut bloca utilizatorul';

  @override
  String get dmUnblockFailed => 'Nu s-a putut debloca utilizatorul';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Nu s-a putut ignora cererea de prietenie';

  @override
  String get dmAddFriends => 'Adaugă prieteni';

  @override
  String get addFriendSheetTitle => 'Adaugă prieten';

  @override
  String get addFriendUsernameHint => 'Nume de utilizator#0000';

  @override
  String get addFriendUsernameLabel => 'Numele de utilizator al prietenului';

  @override
  String get addFriendSendRequest => 'Trimite cererea';

  @override
  String get addFriendNoUserFound =>
      'Nu s-a găsit niciun utilizator cu acest nume.';

  @override
  String get addFriendInvalidUsername =>
      'Introdu un nume de utilizator valid (NumeUtilizator#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Cerere de prietenie trimisă';

  @override
  String get addFriendClaimTitle => 'Revendică-ți contul';

  @override
  String get addFriendClaimDescription =>
      'Revendică-ți contul pentru a trimite cereri de prietenie.';

  @override
  String get addFriendVerifyTitle => 'Verifică-ți adresa de e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Trebuie să-ți verifici adresa de e-mail înainte de a putea trimite cereri de prietenie.';

  @override
  String get addFriendVerifyEmail => 'Verifică adresa de e-mail';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Solicitări de prietenie primite ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Solicitări de prietenie trimise ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Cerere de prietenie primită';

  @override
  String get addFriendOutgoingStatus => 'Cerere de prietenie trimisă';

  @override
  String get addFriendViewProfile => 'Vezi profilul';

  @override
  String get addFriendAccept => 'Acceptă';

  @override
  String get addFriendIgnore => 'Ignoră';

  @override
  String get addFriendAcceptTitle => 'Acceptă cererea de prietenie';

  @override
  String get addFriendIgnoreTitle => 'Ignoră cererea de prietenie';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Accepți cererea de prietenie de la $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignori cererea de prietenie de la $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Anulează cererea';

  @override
  String get addFriendCancelRequestFailed =>
      'Nu s-a putut anula cererea de prietenie. Încearcă din nou.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Nu acceptă cereri de prietenie momentan.';

  @override
  String get addFriendUnblockFirst =>
      'Deblochează-l mai întâi pentru a-i trimite o cerere de prietenie.';

  @override
  String get addFriendCannotSendToSelf =>
      'Nu-ți poți trimite o cerere de prietenie ție însuți.';

  @override
  String get addFriendAlreadyFriends =>
      'Ești deja prieten cu acest utilizator.';

  @override
  String get addFriendClaimToSend =>
      'Finalizează înregistrarea pentru a trimite cereri de prietenie.';

  @override
  String get addFriendVerifyToSend =>
      'Verifică-ți adresa de e-mail înainte de a trimite cereri de prietenie.';

  @override
  String get addFriendFriendsListFull =>
      'Lista ta de prieteni este plină, sau a lor. Elimină pe cineva și încearcă din nou.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistem';

  @override
  String get emojiSearchPlaceholder => 'Găsește emoji-ul visurilor tale';

  @override
  String get emojiSearchEmpty => 'Niciun emoji nu corespunde căutării tale';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji implicit';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Acesta este un emoji implicit pe $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Acest emoji provine din această comunitate. Îl poți folosi oriunde.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Acesta este un emoji personalizat dintr-o comunitate.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Acesta este un emoji personalizat dintr-o comunitate. Roagă autorul să te invite să folosești acest emoji.';

  @override
  String get emojiInfoFromHeader => 'Acest emoji este de la';

  @override
  String get emojiInfoDiscoverableCommunity => 'Comunitate vizibilă';

  @override
  String get emojiInfoPrivateCommunity => 'Comunitate privată';

  @override
  String get emojiInfoVerifiedCommunity => 'Comunitate verificată';

  @override
  String get emojiInfoAddToFavorites => 'Adaugă la favorite';

  @override
  String get emojiInfoRemoveFromFavorites => 'Eliminare din favorite';

  @override
  String get emojiFrequentlyUsed => 'Utilizate frecvent';

  @override
  String get emojiTabGifs => 'GIF-uri';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Stickere';

  @override
  String get emojiTabEmojis => 'Emoji';

  @override
  String get gifPickerSearch => 'Caută GIF-uri';

  @override
  String get gifPickerSearchKlipy => 'Caută în KLIPY';

  @override
  String get gifPickerSearchTenor => 'Caută pe Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favorite';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Încă nu ai GIF-uri favorite';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Salvează un GIF pentru a-l vedea aici.';

  @override
  String get gifPickerTrending => 'GIF-uri populare';

  @override
  String get gifPickerNoResultsTitle => 'Niciun rezultat pentru căutare';

  @override
  String get gifPickerNoResultsDescription => 'Încearcă alt termen de căutare';

  @override
  String get gifPickerLoadFailedTitle => 'Nu s-au putut încărca GIF-urile';

  @override
  String get gifPickerLoadFailedBody =>
      'Verifică-ți conexiunea și încearcă din nou.';

  @override
  String get emojiCategoryPeople => 'Persoane';

  @override
  String get emojiCategoryNature => 'Natură';

  @override
  String get emojiCategoryFood => 'Mâncare și băutură';

  @override
  String get emojiCategoryActivity => 'Activități';

  @override
  String get emojiCategoryTravel => 'Călătorii și locuri';

  @override
  String get emojiCategoryObjects => 'Obiecte';

  @override
  String get emojiCategorySymbols => 'Simboluri';

  @override
  String get emojiCategoryFlags => 'Steaguri';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Deblochează $emojiCount din $communityCount cu Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Obține Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Nu mai afișa asta';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emoji personalizate',
      one: '1 emoji personalizat',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comunități',
      one: '1 comunitate',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Avertisment link extern';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Ești pe cale să părăsești $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Linkurile externe pot fi periculoase. Te rugăm să fii atent.';

  @override
  String get externalLinkWarningDestinationUrl => 'Adresă URL destinație:';

  @override
  String get externalLinksSectionTitle => 'Linkuri externe';

  @override
  String get externalLinksSectionDescription =>
      'Configure cum sunt gestionate avertismentele pentru linkurile externe.';

  @override
  String get externalLinkWarningTrustPrefix => 'Încredere permanentă ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — omite acest avertisment data viitoare';

  @override
  String get externalLinkVisitSite => 'Vizitează site-ul';

  @override
  String get externalLinkTrustAllLabel =>
      'Am încredere în toate linkurile externe';

  @override
  String get externalLinkStripTrackingLabel =>
      'Elimină parametrii de urmărire din URL-uri';

  @override
  String get externalLinkStripTrackingDescription =>
      'Elimină automat parametrii de urmărire (precum utm_source, fbclid, gclid) din URL-urile mesajelor pe care le trimiți. Curăță linkul înainte ca acesta să ajungă la altcineva.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Ai încredere în toate linkurile externe?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Aceasta va acorda încredere tuturor linkurilor externe și va omite avertismentul pentru fiecare domeniu. Domeniile tale de încredere existente vor fi înlocuite. Această opțiune este mai puțin sigură.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Încredere totală';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Nu mai ai încredere în toate linkurile?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Avertismentele pentru linkurile externe vor fi afișate din nou. Va trebui să adaugi individual domeniile de încredere.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Dezactivează încrederea în toate';

  @override
  String get externalLinkTrustedAllDescription =>
      'Toate linkurile externe sunt de încredere. Nu se vor afișa avertismente.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Ai $count domeniu(i) de încredere. Adaugă mai multe bifând căsuța atunci când vizitezi linkuri externe.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Când este activată, nu vor fi afișate avertismente pentru linkurile externe. Acest lucru este mai puțin sigur.';

  @override
  String get imageFileTooLarge =>
      'Fișierul imagine este prea mare. Alege un fișier mai mic de 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Avatarurile animate necesită Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Banner-ele animate necesită Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF animat nu este acceptat';

  @override
  String get animatedAvifNotSupportedBody =>
      'Decuparea și rotirea fișierelor AVIF animate nu este încă acceptată. Dacă vei continua, fișierul va fi încărcat în forma sa originală.';

  @override
  String get uploadAsIs => 'Încarcă ca atare';

  @override
  String get croppingAnimatedNotSupported =>
      'Decuparea imaginilor animate nu este încă acceptată. Se va folosi încărcarea originală.';

  @override
  String get cropAvatar => 'Decupează avatarul';

  @override
  String get cropBanner => 'Decupează bannerul';

  @override
  String get skip => 'Omitere';

  @override
  String get crop => 'Decupează';

  @override
  String get cropTouchHint =>
      'Atinge pentru a mări, trage pentru a repoziționa';

  @override
  String get cropMouseHint =>
      'Trage de colțuri pentru a redimensiona, trage în interior pentru a muta';

  @override
  String get changeYourFluxerTag => 'Schimbă-ți numele de utilizator';

  @override
  String get fluxerTagInputLabel => 'Nume de utilizator';

  @override
  String get fluxerTagDescriptionBase =>
      'Numele de utilizator pot conține doar litere (a-z, A-Z), cifre (0-9) și cratime. Numele de utilizator nu țin cont de majuscule/minuscule.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Numele de utilizator pot conține doar litere (a-z, A-Z), numere (0-9) și underscore (_). Numele de utilizator nu fac distincție între majuscule și minuscule. Poți alege orice etichetă disponibilă de 4 cifre de la #0000 la #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Numele de utilizator pot conține doar litere (a-z, A-Z), numere (0-9) și underscore (_). Numele de utilizator nu fac distincție între majuscule și minuscule. Poți alege orice etichetă disponibilă de 4 cifre de la #0001 la #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Între $min și $max caractere';
  }

  @override
  String get validationAllowedChars =>
      'Doar litere (a-z, A-Z), cifre (0-9) și cratime de jos (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Obține Plutonium pentru a-ți personaliza eticheta sau păstreaz-o când schimbi numele de utilizator';

  @override
  String get fluxerTagAlreadyTaken => 'Numele de utilizator este deja ocupat';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Numele de utilizator $username#$discriminator este deja ocupat. Continuarea va genera automat un nou discriminator.';
  }

  @override
  String get customTagIsTemporary => 'Etichetă personalizată este temporară';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Eticheta personalizată de 4 cifre este disponibilă doar cât timp abonamentul tău Plutonium este activ. Când abonamentul tău expiră pe $date, eticheta ta va reveni la un număr atribuit aleatoriu, după o perioadă de grație de 3 zile.';
  }

  @override
  String get customTagTemporaryBody =>
      'Eticheta ta personalizată de 4 cifre este disponibilă doar cât timp abonamentul tău Plutonium este activ. Când abonamentul tău expiră, eticheta ta va reveni la un număr atribuit aleatoriu după o perioadă de grație de 3 zile.';

  @override
  String get iUnderstandContinue => 'Am înțeles, continuă';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Dacă salvezi acest nume de utilizator, eticheta ta personalizată de 4 cifre va reveni la un număr aleatoriu când abonamentul tău Plutonium se va încheia. Dacă abonamentul tău nu se reînnoiește, vei avea o perioadă de grație de 3 zile înainte ca eticheta să se schimbe.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Eticheta ta personalizată de 4 cifre (#$discriminator) este activă cât timp abonamentul tău Plutonium este activ. Dacă abonamentul tău se încheie sau nu se reînnoiește după o perioadă de grație de 3 zile, eticheta ta va reveni la un număr aleatoriu.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Personalizează-ți eticheta de 4 cifre sau păstreaz-o când îți schimbi numele de utilizator';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Încercarea ta Plutonium expiră pe $date. Fă upgrade pentru a păstra eticheta personalizată și pentru a câștiga o insignă pe profilul tău.';
  }

  @override
  String get premiumTrialActive =>
      'Ești la un trial Plutonium. Fă upgrade pentru a păstra eticheta personalizată și a câștiga o insignă pe profilul tău.';

  @override
  String get fluxerTagUpdated => 'Nume de utilizator actualizat';

  @override
  String get fluxerTagUpdateFailed =>
      'Nu s-a putut actualiza numele de utilizator. Te rugăm să încerci din nou.';

  @override
  String get continueAction => 'Continuă';

  @override
  String get profileCustomizationTitle => 'Personalizare profil';

  @override
  String get profileCustomizationDescription =>
      'Editează-ți aspectul profilului și vezi o previzualizare live';

  @override
  String get usernameLabel => 'Nume de utilizator';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Revendică-ți contul pentru a-ți schimba numele de utilizator';

  @override
  String get changeFluxerTag => 'Schimbă numele de utilizator';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Personalizează-ți eticheta cu 4 cifre (#$discriminator) după bunul plac cu Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Schimbă-ți numele de utilizator și eticheta de 4 cifre';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Eticheta ta personalizată (#$discriminator) este legată de abonamentul tău Plutonium și va reveni la o etichetă aleatorie dacă expiră.';
  }

  @override
  String get displayNameLabel => 'Nume afișat';

  @override
  String get pronounsLabel => 'Pronume';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Schimbă avatarul';

  @override
  String get removeAvatar => 'Eliminare avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10 MB. Recomandat: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Schimbă bannerul';

  @override
  String get removeBanner => 'Elimină bannerul';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maxim 10 MB. Minim: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Culoare accent';

  @override
  String get accentColorDescription =>
      'Personalizează culoarea chenarului și a bannerului din profilul tău';

  @override
  String get aboutMeLabel => 'Despre mine';

  @override
  String get aboutMeHelperText => 'Poți folosi linkuri, emoji și Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle =>
      'Confidențialitate insignă Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Controlează cum este afișată insigna ta Plutonium altora';

  @override
  String get hidePlutoniumBadgeLabel => 'Ascunde complet insigna Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Ascunde complet insigna ta Plutonium de alți utilizatori';

  @override
  String get hidePlutoniumPurchaseDate => 'Ascunde data achiziției Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Ascunde data achiziției Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Elimină data primei achiziții de Plutonium de pe ecusonul tău';

  @override
  String get maskVisionaryAsSubscription => 'Maschează Visionary ca abonament';

  @override
  String get maskVisionaryDescription =>
      'Afișează-ți abonamentul Visionary ca un abonament obișnuit';

  @override
  String get hideVisionaryIdBadge => 'Ascunde insigna ID vizionar';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ascunde insigna ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Elimină-ți insigna de Visionar';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Ești la un trial Plutonium — abonamentul tău începe pe $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Abonamentul tău va începe automat când se va termina perioada de probă. Nu este necesară nicio acțiune.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Ești la un trial Plutonium care expiră pe $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Ești în perioada de probă Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maxim 10 MB. Recomandat: 512×512 px. Avatarele animate (GIF) necesită Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Personalizează-ți profilul cu o imagine statică sau animată pentru banner, ca să iasă în evidență.';

  @override
  String get getPlutonium => 'Obține Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Achizițiile în aplicație nu sunt încă disponibile pe această platformă. Rămâi pe fază — în curând!';

  @override
  String get profilePreviewLabel => 'Previzualizare';

  @override
  String get profilePreviewMessage => 'Trimite mesaj';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Membru din $productName';
  }

  @override
  String get unclaimedAccountTitle => 'Cont ne revendicat';

  @override
  String get unclaimedAccountDescription =>
      'Contul tău nu a fost încă revendicat. Fără o adresă de e-mail și o parolă, ai putea pierde accesul. Revendică-ți contul acum pentru a-l securiza.';

  @override
  String get claimAccount => 'Revendică contul';

  @override
  String get profileTypeLabel => 'Tip profil';

  @override
  String get profileTypeGlobal => 'Profil global';

  @override
  String get profileTypeGuildDescription =>
      'Editezi profilul tău pentru această comunitate. Acesta va fi vizibil doar aici și va înlocui profilul tău global.';

  @override
  String get communityNicknameLabel => 'Poreclă în comunitate';

  @override
  String get perGuildPremiumUpsellText =>
      'Personalizarea avatarului, bannerului, culorii de accent și a biografiei pentru comunități individuale necesită Plutonium. Porecla și pronumele comunității sunt gratuite pentru toată lumea.';

  @override
  String get avatarModeInherit => 'Folosește profilul global';

  @override
  String get avatarModeCustom => 'Folosește imagine personalizată';

  @override
  String get avatarModeUnset => 'Nu afișa';

  @override
  String get profileSavedToast => 'Profil actualizat';

  @override
  String get profileEditButton => 'Editare profil';

  @override
  String get profileNoteLabel => 'Notă';

  @override
  String get profileNoteVisibility => '(vizibil doar pentru tine)';

  @override
  String get profileNoteEmpty => 'Nicio notă încă.';

  @override
  String get sudoTitle => 'Verifică-ți identitatea';

  @override
  String get sudoDescription =>
      'Această acțiune necesită verificare pentru a continua.';

  @override
  String get sudoAuthenticatorCode => 'Cod de autentificare';

  @override
  String get sudoMethodPassword => 'Parolă';

  @override
  String get sudoMethodTotp => 'Autentificator';

  @override
  String get sudoVerificationFailed =>
      'Verificarea a eșuat. Te rugăm să încerci din nou.';

  @override
  String get securityAccountTitle => 'Cont';

  @override
  String get securityAccountDescription =>
      'Gestionează-ți e-mailul, parola și setările contului';

  @override
  String get securitySectionTitle => 'Securitate';

  @override
  String get securitySectionDescription =>
      'Protejează-ți contul cu autentificare în doi pași și chei de acces';

  @override
  String get securityLoginEmailSectionTitle => 'Setări e-mail';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Gestionează adresa de e-mail pe care o folosești pentru a te conecta la $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Adresa de e-mail';

  @override
  String get securityLoginNoEmailSet => 'Nicio adresă de e-mail setată';

  @override
  String get securityLoginChangeEmail => 'Schimbă emailul';

  @override
  String get securityLoginAddEmail => 'Adaugă email';

  @override
  String get securityLoginReveal => 'Arată';

  @override
  String get securityLoginHide => 'Ascunde';

  @override
  String get securityLoginPasswordSectionTitle => 'Parolă';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Schimbă-ți parola pentru a-ți securiza contul';

  @override
  String get securityLoginCurrentPasswordLabel => 'Parola curentă';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Ultima modificare: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Ultima modificare: Niciodată';

  @override
  String get securityLoginNoPasswordSet => 'Nicio parolă setată';

  @override
  String get securityLoginChangePassword => 'Schimbă parola';

  @override
  String get securityLoginSetPassword => 'Setare parolă';

  @override
  String get passwordChangeTitle => 'Schimbă parola';

  @override
  String get passwordChangeIntroDescription =>
      'Vom trimite un cod de verificare la adresa ta de e-mail pentru a-ți confirma identitatea înainte de a schimba parola.';

  @override
  String get passwordChangeStart => 'Începeți';

  @override
  String get passwordChangeVerifyTitle => 'Verifică-ți emailul';

  @override
  String get passwordChangeVerifyDescription =>
      'Introdu codul de verificare trimis pe adresa ta de e-mail.';

  @override
  String get passwordChangeVerificationCode => 'Cod de verificare';

  @override
  String get passwordChangeVerify => 'Verifică';

  @override
  String get passwordChangeNewPasswordTitle => 'Setare parolă nouă';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Introdu parola nouă mai jos.';

  @override
  String get passwordChangeNewPassword => 'Parolă nouă';

  @override
  String get passwordChangeConfirmPassword => 'Confirmă noua parolă';

  @override
  String get passwordChangeSubmit => 'Schimbă parola';

  @override
  String get passwordChangeSuccess => 'Parola a fost schimbată';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Parolele nu corespund';

  @override
  String get passwordChangeInvalidCode => 'Cod invalid sau expirat';

  @override
  String get emailChangeTitle => 'Schimbă adresa de e-mail';

  @override
  String get emailChangeIntroDescription =>
      'Vom trimite coduri de verificare pentru a vă confirma identitatea înainte de a vă schimba adresa de e-mail.';

  @override
  String get emailChangeStart => 'Începeți';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verifică emailul curent';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Introdu codul de verificare trimis la adresa ta de email curentă.';

  @override
  String get emailChangeNewEmailTitle => 'Introdu noua adresă de e-mail';

  @override
  String get emailChangeNewEmailDescription =>
      'Introdu noua adresă de e-mail pe care dorești să o folosești.';

  @override
  String get emailChangeNewEmailLabel => 'Email nou';

  @override
  String get emailChangeNewEmailSubmit => 'Trimite codul de verificare';

  @override
  String get emailChangeVerifyNewTitle => 'Verifică noul e-mail';

  @override
  String get emailChangeVerifyNewDescription =>
      'Introdu codul de verificare trimis la noua adresă de e-mail.';

  @override
  String get emailChangeSuccess => 'E-mail modificat';

  @override
  String get emailChangeInvalidCode => 'Cod invalid sau expirat';

  @override
  String get resend => 'Retrimite';

  @override
  String resendCountdown(int seconds) {
    return 'Retrimite (${seconds}s)';
  }

  @override
  String get verificationCode => 'Cod de verificare';

  @override
  String get verify => 'Verifică';

  @override
  String get enable => 'Activează';

  @override
  String get disable => 'Dezactivează';

  @override
  String get delete => 'Șterge';

  @override
  String get save => 'Salvează';

  @override
  String get securityTfaSectionTitle => 'Autentificare în doi pași';

  @override
  String get securityTfaSectionDescription =>
      'Adaugă un nivel suplimentar de securitate contului tău';

  @override
  String get securityTfaAuthenticatorApp => 'Aplicație de autentificare';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Autentificarea în doi pași este activată';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Folosește o aplicație de autentificare pentru a genera coduri pentru autentificarea în doi pași';

  @override
  String get securityTfaBackupCodes => 'Coduri de rezervă';

  @override
  String get securityTfaBackupCodesDescription =>
      'Vizualizează și gestionează codurile de rezervă pentru recuperarea contului';

  @override
  String get securityTfaViewCodes => 'Vizualizați codurile';

  @override
  String get securityPasskeysSectionTitle => 'Chei de acces';

  @override
  String get securityPasskeysSectionDescription =>
      'Folosește cheile de acces pentru conectare fără parolă și autentificare în doi pași';

  @override
  String get securityPasskeysRegistered => 'Chei de securitate înregistrate';

  @override
  String get securityPasskeysNone => 'Nu sunt înregistrate chei de acces';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'chei de acces',
      one: 'cheie de acces',
    );
    return '$count $_temp0 înregistrate (max. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Adaugă cheie de acces';

  @override
  String securityPasskeysAdded(String date) {
    return 'Adăugat: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Ultima utilizare: $date';
  }

  @override
  String get securityPasskeysRename => 'Redenumește';

  @override
  String get securityPasskeysDeleteTitle => 'Șterge cheia de acces';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Ești sigur că vrei să ștergi cheia de acces „$name”?';
  }

  @override
  String get securityPasskeyNameTitle => 'Denumește cheia de acces';

  @override
  String get securityPasskeyNameLabel => 'Nume cheie de acces';

  @override
  String get securityPasskeyNameHint =>
      'de ex. YubiKey, iPhone, Computer de serviciu';

  @override
  String get securityPhoneSectionTitle => 'Număr de telefon';

  @override
  String get securityPhoneSectionDescription =>
      'Gestionează-ți numărul de telefon.';

  @override
  String get securityPhoneLabel => 'Număr de telefon';

  @override
  String get securityPhoneNone => 'Nu este adăugat niciun număr de telefon.';

  @override
  String get securityPhoneAdd => 'Adaugă număr de telefon';

  @override
  String get securityPhoneRemove => 'Elimină';

  @override
  String get securityPhoneRemoveTitle => 'Elimină numărul de telefon';

  @override
  String get securityPhoneRemoveDescription =>
      'Ești sigur că vrei să-ți ștergi numărul de telefon?';

  @override
  String get securityPhoneRemoved => 'Număr de telefon eliminat';

  @override
  String get securityClaimTitle => 'Funcționalități de securitate';

  @override
  String get securityClaimDescription =>
      'Revendică-ți contul pentru a accesa funcții de securitate precum autentificarea în doi pași și cheile de acces.';

  @override
  String get securityVerifyEmailRequired =>
      'Trebuie să îți verifici adresa de e-mail înainte de a putea configura autentificarea în doi pași, cheile de acces sau verificarea prin SMS.';

  @override
  String get totpEnableTitle => 'Configurare aplicație de autentificare';

  @override
  String get totpEnableDescription =>
      'Scanează codul QR cu aplicația ta de autentificare pentru a genera coduri pentru autentificare în doi pași.';

  @override
  String get totpEnableCodeLabel => 'Cod';

  @override
  String get totpEnableCodeHint =>
      'Introdu codul de 6 cifre din aplicația de autentificare';

  @override
  String get totpEnableSuccess =>
      'Autentificarea cu doi factori a fost activată';

  @override
  String get totpDisableTitle => 'Eliminare aplicație de autentificare';

  @override
  String get totpDisableDescription =>
      'Introdu codul de 6 cifre din aplicația de autentificare pentru a dezactiva autentificarea în doi pași.';

  @override
  String get totpDisableSuccess =>
      'Autentificarea în doi pași a fost dezactivată';

  @override
  String get backupCodesTitle => 'Coduri de rezervă';

  @override
  String get backupCodesWarning =>
      'Dacă pierzi accesul la aplicația de autentificare și nu ai aceste coduri, vei fi blocat permanent din contul tău. Descarcă-le sau copiază-le acum și păstrează-le într-un loc sigur.';

  @override
  String get backupCodesDownload => 'Descarcă';

  @override
  String get backupCodesCopy => 'Copiază';

  @override
  String get backupCodesCopied =>
      'Codurile de rezervă au fost copiate în clipboard';

  @override
  String get backupCodesAcknowledge =>
      'Am descărcat sau copiat codurile de rezervă și le-am stocat într-un loc sigur.';

  @override
  String get backupCodesDone => 'Gata';

  @override
  String get backupCodesViewTitle => 'Vizualizați codurile de rezervă';

  @override
  String get backupCodesViewDescription =>
      'Este posibil să fie necesară verificarea înainte de a vizualiza codurile de rezervă.';

  @override
  String get phoneAddTitle => 'Adaugă număr de telefon';

  @override
  String get phoneAddLabel => 'Număr de telefon';

  @override
  String get phoneAddHint => 'Introduceți numărul de telefon';

  @override
  String get phoneAddFooter =>
      'Vom trimite un cod SMS când va fi disponibil. Numărul tău nu este legat de contul tău. Păstrăm doar un marcator criptat, fără ID de utilizator, pentru a permite maximum 2 verificări în aproximativ 30 de zile.';

  @override
  String get phoneAddSendCode => 'Trimite cod';

  @override
  String get phoneVerifyTitle => 'Verifică numărul de telefon';

  @override
  String get phoneVerifyDescription =>
      'Introdu codul de verificare trimis la numărul tău de telefon.';

  @override
  String get phoneAddSuccess => 'Număr de telefon verificat';

  @override
  String get phoneCountryLabel => 'Țara';

  @override
  String get phoneSearchCountries => 'Căutați țări...';

  @override
  String get phoneNumberRequired => 'Numărul de telefon este obligatoriu';

  @override
  String get phoneEnterValidNumber =>
      'Introduceți un număr de telefon mobil valid.';

  @override
  String get phoneCannotBeUsed =>
      'Acest număr de telefon nu poate fi utilizat. Încearcă un alt număr de mobil sau contactează asistența.';

  @override
  String get phoneAlreadyUsed =>
      'Acest număr de telefon a fost deja utilizat. Încearcă un alt număr sau contactează asistența.';

  @override
  String get phoneCodeDidNotWork =>
      'Codul nu a funcționat. Verifică-l și încearcă din nou.';

  @override
  String get phoneTooManyAttempts =>
      'Prea multe încercări. Așteaptă puțin, apoi încearcă din nou.';

  @override
  String get phoneSmsUnavailable =>
      'Verificarea prin SMS nu este disponibilă momentan. Încearcă din nou mai târziu sau contactează asistența.';

  @override
  String get phoneNotEligible =>
      'Verificarea telefonică nu este disponibilă pentru acest cont. Folosește o altă metodă sau contactează asistența.';

  @override
  String get phoneCaptchaRequired =>
      'Este necesară o verificare în browser înainte de verificarea telefonică. Încearcă din nou de pe pagina de conectare sau contactează asistența.';

  @override
  String get phoneSomethingWentWrong =>
      'Ceva nu a mers bine. Încearcă din nou.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Trimiterea unui SMS la acest număr de telefon este prea scumpă, așa că trebuie să ne trimiți un SMS în schimb. Poți contacta, de asemenea, suportul pentru a elimina această cerință din contul tău.';

  @override
  String get phoneInboundDefaultDescription =>
      'Trebuie să ne trimiți un SMS pentru a-ți verifica numărul de telefon.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Deschide aplicația de mesagerie a telefonului și creează un mesaj text nou.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Trimite codul $code la $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Așteaptă să primim mesajul tău. Poate dura un minut.';

  @override
  String get phoneInboundGetNewCode => 'Trimite cod nou';

  @override
  String get phoneInboundChallengeCodeLabel => 'Cod de trimis';

  @override
  String get phoneInboundOurNumberLabel => 'Trimite la';

  @override
  String get requiredActionTitle => 'Verificarea contului este necesară';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Finalizează verificarea necesară pentru a continua să utilizezi $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Înregistrarea ta necesită o verificare anti-spam suplimentară înainte de a putea continua.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Verifică-ți adresa de e-mail sau numărul de telefon pentru a continua să folosești $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Finalizați pașii de verificare a adresei de e-mail și a numărului de telefon de mai jos pentru a continua să utilizați $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Alege o metodă de verificare';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Finalizați una dintre căile de verificare de mai jos pentru a continua să utilizați $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Folosește e-mailul';

  @override
  String get requiredActionUsePhone => 'Folosește telefonul';

  @override
  String get requiredActionCheckEmailTitle => 'Verifică-ți emailul';

  @override
  String get requiredActionCheckEmailDescription =>
      'Am trimis un link de verificare la adresa ta de e-mail. Deschide-l pentru a continua.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Retrimite emailul de verificare';

  @override
  String get requiredActionVerificationEmailSent =>
      'E-mailul de verificare a fost trimis. Verifică-ți căsuța de e-mail.';

  @override
  String get requiredActionSignOut => 'Deconectare';

  @override
  String get dangerZoneSectionTitle => 'Zonă de pericol';

  @override
  String get dangerZoneSectionDescription =>
      'Acțiuni ireversibile și distructive';

  @override
  String get dangerZoneDisableTitle => 'Dezactivare cont';

  @override
  String get dangerZoneDisableDescription =>
      'Dezactivează-ți temporar contul. Îl poți reactiva mai târziu, conectându-te din nou.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Dezactivarea contului te va deconecta din toate sesiunile. Îți poți reactiva contul oricând, reconectându-te.';

  @override
  String get dangerZoneDeleteTitle => 'Șterge contul';

  @override
  String get dangerZoneDeleteDescription =>
      'Șterge definitiv contul și toate datele asociate. Această acțiune nu poate fi anulată.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Anulează abonamentul tău activ Plutonium din setările Plutonium înainte de a-ți șterge contul.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Nu se poate șterge contul';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Nu poți șterge contul cât timp deții comunități. Transferă mai întâi proprietatea următoarelor comunități:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'și încă $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Pentru a transfera proprietatea, accesează $settingsPath și folosește opțiunea de transferare a proprietății.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Sigur dorești să-ți ștergi contul? Această acțiune va programa contul tău pentru ștergere permanentă.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Poți anula procesul de ștergere în decurs de 14 zile';

  @override
  String get dangerZoneDeleteBullet2 =>
      'După 14 zile, contul tău va fi șters definitiv';

  @override
  String get dangerZoneDeleteBullet3 =>
      'După procesarea ștergerii, nu vei mai putea recupera accesul la contul tău';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Nu vei putea șterge mesajele trimise după ce îți ștergi contul';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Dacă dorești să-ți exporti datele sau să-ți ștergi mesajele mai întâi, te rugăm să vizitezi secțiunea Panoul de confidențialitate din Setările utilizatorului înainte de a continua.';

  @override
  String get claimAccountTitle => 'Revendică-ți contul';

  @override
  String get claimAccountDescription =>
      'Revendică-ți contul adăugând o adresă de e-mail și o parolă. Îți vom trimite un cod de verificare pentru a-ți confirma e-mailul înainte de finalizare.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Parolă';

  @override
  String get claimAccountSendCode => 'Trimite codul';

  @override
  String get claimAccountVerifyDescription =>
      'Introdu codul pe care l-am trimis pe email pentru a-l verifica. Parola ta va fi setată după confirmarea codului.';

  @override
  String get claimAccountSuccess => 'Cont revendicat cu succes';

  @override
  String get importantInformation => 'Informații importante:';

  @override
  String get genericError => 'A apărut o eroare';

  @override
  String get networkErrorMessage =>
      'A apărut o eroare. Te rugăm să încerci din nou.';

  @override
  String get invalidCode => 'Cod invalid';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum # ani',
      one: 'acum 1 an',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum # luni',
      one: 'acum 1 lună',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum $count zile',
      one: 'acum 1 zi',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum $count ore',
      one: 'acum 1 oră',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum $count minute',
      one: 'acum 1 minut',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum # săptămâni',
      one: 'acum 1 săptămână',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'peste $count minute',
      one: 'peste 1 minut',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'peste $count ore',
      one: 'peste o oră',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'peste $count zile',
      one: 'peste o zi',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'peste $count săptămâni',
      one: 'peste o săptămână',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'peste $count luni',
      one: 'peste o lună',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'peste $count ani',
      one: 'peste 1 an',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'chiar acum';

  @override
  String get authorizedAppsTitle => 'Aplicații autorizate';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Aceste aplicații au primit acces la contul tău $productName.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Nicio aplicație autorizată';

  @override
  String get authorizedAppsEmptyDescription =>
      'Nu ai autorizat nicio aplicație să-ți acceseze contul.';

  @override
  String get authorizedAppsLoadError =>
      'Nu s-au putut încărca aplicațiile autorizate';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizat pe $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Permisiuni acordate';

  @override
  String get authorizedAppsRevoke => 'Revocare';

  @override
  String get authorizedAppsRevokeTitle => 'Revocare acces aplicație';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Ești sigur că vrei să revoce accesul pentru $appName? Această aplicație nu va mai avea acces la contul tău.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Accesează-ți informațiile de bază ale profilului (nume de utilizator, avatar etc.)';

  @override
  String get authorizedAppsScopeEmail => 'Vezi-ți adresa de e-mail';

  @override
  String get authorizedAppsScopeGuilds =>
      'Vezi comunitățile din care faci parte';

  @override
  String get authorizedAppsScopeConnections => 'Vezi conturile conectate';

  @override
  String get authorizedAppsScopeBot =>
      'Adaugă un bot într-o comunitate cu permisiunile solicitate';

  @override
  String get authorizedAppsScopeAdmin =>
      'Accesează punctele finale administrative';

  @override
  String get privacyPendingDeletionTitle => 'Ștergere în așteptare';

  @override
  String get blockedUsersTitle => 'Utilizatori blocați';

  @override
  String get blockedUsersDescription =>
      'Utilizatorii blocați nu-ți pot trimite cereri de prietenie sau mesaje directe.';

  @override
  String get blockedUsersEmptyTitle => 'Niciun utilizator blocat';

  @override
  String get blockedUsersEmptyDescription => 'Nu ai blocat încă pe nimeni.';

  @override
  String get blockedUsersLoadError =>
      'Nu s-au putut încărca utilizatorii blocați';

  @override
  String get blockedUsersUnblock => 'Deblochează';

  @override
  String get blockedUsersUnblockTitle => 'Deblocare utilizator';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Ești sigur că vrei să deblochezi $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copiază numele de utilizator';

  @override
  String get blockedUsersCopyId => 'Copiază ID-ul utilizatorului';

  @override
  String get userProfileLoadError => 'Nu am putut încărca profilul';

  @override
  String get userProfileLoading => 'Se încarcă profilul';

  @override
  String get userProfileRetry => 'Reîncercați';

  @override
  String get userProfileMessage => 'Trimite mesaj';

  @override
  String get userProfileVoiceCall => 'Apel vocal';

  @override
  String get userProfileVideoCall => 'Apel video';

  @override
  String get userProfileEditProfile => 'Editare profil';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Personal $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Echipa Comunității $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Partener $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Vânător de buguri $productName';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return 'Plutonium $productName';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Plutonium abonat de la $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return 'Vizionar $productName';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Vizionar din $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID vizionar #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Prietenii comuni ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Comunități comune ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Prietenii comuni';

  @override
  String get userProfileMutualCommunitiesTitle => 'Comunități comune';

  @override
  String get userProfileNoMutualFriends => 'Nu s-au găsit prieteni comuni.';

  @override
  String get userProfileNoMutualCommunities =>
      'Nu s-au găsit comunități comune.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Poreclă: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Deschide conversația';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'L-ai blocat pe $username. Nu vei putea trimite mesaje decât dacă îl deblochezi.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Deblochează';

  @override
  String get userProfileOpenDm => 'Deschide conversația';

  @override
  String get userProfileNoteTitle => 'Notă';

  @override
  String get userProfileNoteVisibility => '(vizibil doar pentru tine)';

  @override
  String get userProfileNoteSave => 'Salvează';

  @override
  String get userProfileNoteDelete => 'Șterge';

  @override
  String get userProfileNoteEmpty => 'Atinge pentru a adăuga o notă';

  @override
  String get userProfileMemberSince => 'Membru din';

  @override
  String get userProfileAboutMe => 'Despre mine';

  @override
  String get userProfileRoles => 'Roluri';

  @override
  String get memberRoleAdd => 'Adaugă rol';

  @override
  String memberRoleRemove(String roleName) {
    return 'Elimină rolul $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Acest utilizator nu are roluri în această comunitate.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Încă nu sunt roluri. Adaugă roluri în $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Niciun rol disponibil';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'În acest moment, nu există roluri de atribuit în această comunitate, dar poți crea un rol nou în $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Setări comunitate';

  @override
  String get guildSettingsRolesTab => 'Roluri';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Ora locală';

  @override
  String get userProfileSameTimeAsYou => 'Același fus orar ca al tău';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'cu $duration înaintea ta';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'cu $duration în urma ta';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ore',
      one: '1 oră',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minute',
      one: '1 minut',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ore',
      one: '1 oră',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minute',
      one: '1 minut',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Copiază numele de utilizator';

  @override
  String get userProfileCopyUserId => 'Copiază ID-ul utilizatorului';

  @override
  String get userProfileViewMainProfile => 'Vizualizați profilul principal';

  @override
  String get userProfileViewCommunityProfile =>
      'Vizualizați profilul comunității';

  @override
  String get userProfileBlockUser => 'Blochează utilizatorul';

  @override
  String get userProfileUnblockUser => 'Deblochează utilizatorul';

  @override
  String get userProfileRemoveFriend => 'Elimină prietenul';

  @override
  String get userProfileBlockConfirmTitle => 'Blochează utilizatorul';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Ești sigur că vrei să blochezi $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Deblochează utilizatorul';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Ești sigur că vrei să deblochezi $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Elimină prietenul';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Ești sigur că vrei să-l/s-o elimini pe $username din lista de prieteni?';
  }

  @override
  String get userProfileFailedOpenDm => 'Nu s-a putut deschide mesajul direct';

  @override
  String get userProfileFailedSaveNote => 'Nu am reușit să salvez nota';

  @override
  String get userProfileActionFailed =>
      'Acțiunea a eșuat, te rugăm să încerci din nou';

  @override
  String get userProfileChangeNickname => 'Schimbă porecla';

  @override
  String get userProfileKick => 'Elimină';

  @override
  String get userProfileBan => 'Interzice';

  @override
  String get userProfileTimeout => 'Pauză';

  @override
  String get userProfileRemoveTimeout => 'Elimină pauza';

  @override
  String get userProfileTransferOwnership => 'Transferă proprietatea';

  @override
  String get userProfileReportUser => 'Raportează utilizatorul';

  @override
  String get userProfileReportMessage => 'Raportează mesajul';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Elimină-l pe $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Ești sigur că vrei să-l dai afară pe $username? Se poate alătura din nou cu o invitație nouă.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Elimini temporizarea?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Eliminarea temporizării îi va permite lui $username să trimită din nou mesaje, să reacționeze și să se alăture canalelor vocale.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transferi proprietatea?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Transferiți proprietatea acestei comunități către $username? Acest lucru este ireversibil și veți pierde toate privilegiile de proprietar.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Interzice $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Durată interdicție';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Durată personalizată (secunde)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Orice valoare de la $min la $max secunde';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Șterge istoricul mesajelor';

  @override
  String get userProfileBanDeleteNone => 'Nu șterge niciuna';

  @override
  String get userProfileBanDelete24h => 'Ultimele 24 de ore';

  @override
  String get userProfileBanDelete7d => 'Ultimele 7 zile';

  @override
  String get userProfileBanReasonLabel => 'Motiv (opțional)';

  @override
  String get userProfileBanReasonHint => 'Introdu un motiv pentru interdicție';

  @override
  String get userProfileBanSubmit => 'Banează membrul';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Excludere temporară $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Durată timeout';

  @override
  String get userProfileTimeoutSubmit => 'Elimină membru din comunitate';

  @override
  String get userProfileNicknameLabel => 'Pseudonim';

  @override
  String get userProfileNicknameHint => 'Introdu un pseudonim';

  @override
  String get userProfileNicknameSave => 'Salvează';

  @override
  String userProfileKickSuccess(String username) {
    return 'L-ai eliminat pe $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'L-ai banat pe $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'L-ai eliminat temporar pe $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Ați eliminat temporizarea pentru $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Pseudonim actualizat';

  @override
  String get userProfileTransferSuccess => 'Proprietate transferată';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 de secunde';

  @override
  String get duration5Minutes => '5 minute';

  @override
  String get duration10Minutes => '10 minute';

  @override
  String get duration1Hour => '1 oră';

  @override
  String get duration12Hours => '12 ore';

  @override
  String get duration1Day => '1 zi';

  @override
  String get duration3Days => '3 zile';

  @override
  String get duration5Days => '5 zile';

  @override
  String get duration1Week => '1 săptămână';

  @override
  String get duration2Weeks => '2 săptămâni';

  @override
  String get duration1Month => '1 lună';

  @override
  String get durationCustom => 'Personalizat…';

  @override
  String get iarReportUserTitle => 'Raportează utilizatorul';

  @override
  String get iarReportGuildTitle => 'Raportează comunitatea';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Dacă acest raport se referă la un anumit mesaj din această comunitate, raportează mai degrabă mesajul respectiv. Rapoartele de mesaje oferă echipei noastre de siguranță cel mai clar context, iar adăugarea detaliilor în comentarii ne poate ajuta să le examinăm mai rapid. Continuă să raportezi comunitatea în ansamblu doar dacă raportarea unui mesaj nu ar surprinde problema mai amplă.';

  @override
  String get iarContinueToReportCommunity =>
      'Continuă să raportezi comunitatea';

  @override
  String get iarPreviewCommunitySubtitle => 'Comunitate';

  @override
  String get iarReasonHarassmentGuildLabel => 'Hărțuire sau abuz direcționat';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Comunitatea facilitează atacurile în grup sau abuzurile direcționate.';

  @override
  String get iarReasonHateGuildDescription =>
      'Promovează ura împotriva grupurilor protejate.';

  @override
  String get iarReasonTerrorismLabel => 'Terorism sau extremism violent';

  @override
  String get iarReasonTerrorismDescription =>
      'Promovează, recrutează sau coordonează activități extremiste violente.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Conținut matur sau restricții de siguranță';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Conținut matur fără restricții adecvate.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Pune în pericol minori sau găzduiește conținut de exploatare a copiilor.';

  @override
  String get iarReasonRaidLabel => 'Coordonare raid';

  @override
  String get iarReasonRaidDescription =>
      'Coordonează raiduri, acțiuni de brigadă sau hărțuire împotriva unor persoane sau comunități.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Comunitatea există pentru a trimite spam, a înșela sau a abuza de platformă.';

  @override
  String get iarReasonMalwareGuildLabel => 'Distribuire de malware';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distribuie malware, fură date de conectare sau fișiere dăunătoare.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Încălcare a confidențialității sau doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Partajează informații personale, urmărește utilizatori sau coordonează abuzuri de confidențialitate.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Încurajează auto-vătămarea';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Încurajează sinuciderea, auto-vătămarea sau tulburările de alimentație.';

  @override
  String get iarReasonInappropriateProfile => 'Profil neadecvat';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Profilul acestui utilizator conține conținut necorespunzător';

  @override
  String typingIndicatorOne(String name) {
    return '$name scrie...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 și $name2 scriu...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 și $name3 scriu...';
  }

  @override
  String get typingIndicatorMultiple => 'Mai multe persoane scriu...';

  @override
  String get typingIndicatorHandful =>
      'Câțiva luptători de tastatură se adună...';

  @override
  String get typingIndicatorSymphony => 'Se tastează...';

  @override
  String get typingIndicatorFiesta => 'E o nebunie de tastat aici';

  @override
  String get typingIndicatorApocalypse => 'Uau, e o apocalipsă a tastatului';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Ne bucurăm că ești aici, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Bun venit, $username! Fă-te comod.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Salut, $username! Mă bucur să te avem alături.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Salut, $username! Intră în conversație oricând ești gata.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Salut, $username, mă bucur să te văd aici!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Salut, $username! Sperăm să-ți placă șederea.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Salut, $username, bine ai venit!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Mă bucur că ai ajuns, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Bun venit, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Bun venit, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Bun venit, $username! Ne bucurăm că ești alături de noi.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Bun venit, $username! Sperăm să te simți bine aici.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Bun venit, $username! Următoarea ta conversație începe aici.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Bun venit, $username. Ne bucurăm să te avem alături.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Mă bucur să te văd, $username! Bine ai venit.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Ești aici, $username! Bine că ești cu noi.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Ai ajuns, $username! Să începem.';
  }

  @override
  String get relativeTimeShortNow => 'acum';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min',
      one: '1 min',
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
      other: '${count}z',
      one: '1 zi',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count luni',
      one: '1 lună',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ani',
      one: '1 an',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Dispozitivele mele';

  @override
  String get linkedDevicesDescription =>
      'Vezi toate dispozitivele conectate la contul tău. Revocare sesiunile pe care nu le recunoști.';

  @override
  String get linkedDevicesCurrentDevice => 'Dispozitiv curent';

  @override
  String get linkedDevicesOtherDevices => 'Alte dispozitive';

  @override
  String get linkedDevicesEnterSelection => 'Intră în modul de selecție';

  @override
  String get linkedDevicesExitSelection => 'Ieși din modul de selecție';

  @override
  String get linkedDevicesSelectAll => 'Selectează tot';

  @override
  String get linkedDevicesClearSelection => 'Anulare selecție';

  @override
  String get linkedDevicesRevokeTooltip => 'Revocați dispozitivul';

  @override
  String get linkedDevicesSignOutAll =>
      'Deconectează-te de pe toate celelalte dispozitive';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deconectează $count dispozitive',
      one: 'Deconectează 1 dispozitiv',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deconectează $count dispozitive',
      one: 'Deconectează 1 dispozitiv',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Deconectează-te de pe toate celelalte dispozitive';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Aceasta va deconecta dispozitivele selectate din contul tău. Va trebui să te conectezi din nou pe acele dispozitive.',
      one:
          'Aceasta va deconecta dispozitivul selectat din contul tău. Va trebui să te conectezi din nou pe acel dispozitiv.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Aceasta va deconecta dispozitivele selectate din contul tău. Va trebui să te autentifici din nou pe acele dispozitive.';

  @override
  String get linkedDevicesSignOutConfirm => 'Continuă';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Va trebui să vă autentificați din nou pe toate dispozitivele pe care ați fost deconectat';

  @override
  String get linkedDevicesLoadErrorTitle => 'Eroare de rețea';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Întâmpinăm probleme la conectarea la continuumul spațiu-timp. Verifică-ți conexiunea și încearcă din nou.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dispozitive revocate',
      one: 'Dispozitiv revocat',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Nu am putut să te deconectezi. Încearcă din nou.';

  @override
  String get linkedDevicesUnknownOs => 'Sistem de operare necunoscut';

  @override
  String get linkedDevicesUnknownPlatform => 'Platform necunoscută';

  @override
  String slowmodeLabel(String duration) {
    return '$duration mod lent';
  }

  @override
  String get slowmodeTooltipActive =>
      'Ești în modul lent. Te rugăm să aștepți înainte de a trimite alt mesaj.';

  @override
  String get slowmodeTooltipImmune => 'Modul lent este activat, dar ești imun.';

  @override
  String get slowmodeStatusEnabled => 'Modul lent este activat';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Modul lent este activ ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Modul lent este setat la $durationLabel, dar ești exceptat.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Modul lent este setat la $durationLabel. Așteaptă înainte de a trimite un alt mesaj.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Modul lent este setat la $durationLabel pentru acest canal.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Nu poți trimite mesaje pe acest canal.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Anunțuri de sistem de la personalul $productName. Nu poți răspunde aici.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Mesageria este întreruptă temporar în această comunitate.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Ai fost temporar oprit. Mesageria, reacțiile și vocea sunt întrerupte până la expirarea timpului de pauză.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Trebuie să-ți revendici contul pentru a trimite mesaje în această comunitate.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Trebuie să-ți verifici adresa de e-mail pentru a trimite mesaje în această comunitate.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Contul tău este prea nou pentru a trimite mesaje în această comunitate.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Nu ești membru al acestei comunități de suficient timp pentru a trimite mesaje.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Trebuie să-ți verifici numărul de telefon pentru a trimite mesaje în această comunitate.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verifică adresa de e-mail';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verifică numărul de telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Prea multe atașamente (maxim $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName depășește limita de dimensiune ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Fișierele sunt prea mari pentru a fi trimise împreună';

  @override
  String get chatAttachmentDropToUpload =>
      'Eliberează fișierele pentru a le încărca';

  @override
  String get chatAttachmentDropToSend =>
      'Eliberează fișierele pentru a le trimite acum';

  @override
  String get chatAttachmentSendVoiceMessage => 'Trimite mesaj vocal';

  @override
  String get voiceMessageTitle => 'Mesaj vocal';

  @override
  String get voiceMessageHoldHint =>
      'Ține apăsat pentru a înregistra. Trage spre coș pentru a șterge, glisează în sus pentru a bloca sau eliberează pentru a trimite.';

  @override
  String get voiceMessageDiscard => 'Renunță la mesajul vocal';

  @override
  String get voiceMessageSend => 'Trimite mesaj vocal';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nu se poate începe înregistrarea. Permite accesul la microfon.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Înregistrarea vocală nu este acceptată pe acest dispozitiv.';

  @override
  String get voiceMessageMicInUse =>
      'Părăsește apelul vocal pentru a înregistra un mesaj vocal.';

  @override
  String get voiceMessageRecordingFailed =>
      'Înregistrarea a eșuat. Încearcă din nou.';

  @override
  String get voiceMessageSendFailed =>
      'Nu s-a putut trimite mesajul vocal. Încearcă din nou.';

  @override
  String get voiceMessageRecordingHint =>
      'Vorbește acum. Apasă Oprește când ai terminat — poți edita ulterior.';

  @override
  String get voiceMessageReviewHint =>
      'Trageți de mânere pentru a decupa, apoi apăsați Trimiteți.';

  @override
  String get voiceMessageStop => 'Oprește';

  @override
  String get voiceMessageStartRecording => 'Începe înregistrarea';

  @override
  String get voiceMessageRerecord => 'Reînregistrează';

  @override
  String get voiceMessagePlay => 'Redă';

  @override
  String get voiceMessagePause => 'Pauză';

  @override
  String get voiceMessageSeekForward => 'Derulează înainte';

  @override
  String get voiceMessageSeekBackward => 'Derulează înapoi';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Selecția trebuie să aibă cel puțin ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Editează atașamentul';

  @override
  String get chatAttachmentFilenameLabel => 'Nume fișier';

  @override
  String get chatAttachmentDescriptionLabel => 'Descriere';

  @override
  String get chatAttachmentDescriptionHint => 'Text alternativ opțional';

  @override
  String get chatAttachmentSpoilerLabel => 'Marchează ca spoiler';

  @override
  String get chatAttachmentRemove => 'Elimină atașamentul';

  @override
  String get chatAttachmentDownload => 'Descarcă';

  @override
  String get chatAttachmentDownloadedToast => 'Salvat în fotografii';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Nu s-a putut descărca atașamentul';

  @override
  String get chatAttachmentExpiredTooltip => 'Atașament expirat';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Extinde ($count rânduri)',
      one: 'Extinde ($count rând)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Restrânge ($count rânduri)',
      one: 'Restrânge ($count rând)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Extinde ($count rânduri)',
      one: 'Extinde ($count rând)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Restrânge ($count rânduri)',
      one: 'Restrânge ($count rând)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count linii rămase)',
      one: '... ($count linie rămasă)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rânduri rămase)',
      one: '... ($count rând rămas)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Vezi fișierul complet';

  @override
  String get chatTextualPreviewChangeLanguage => 'Schimbă limba';

  @override
  String get chatTextualPreviewSearchLanguage => 'Caută limbă…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Evidențiere sintaxă';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Nu s-au găsit rezultate';

  @override
  String get chatTextualPreviewMoreOptions => 'Mai multe opțiuni';

  @override
  String get chatTextualPreviewWrapText => 'Încadrează textul';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Fișierul este prea mare pentru previzualizare (limită $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Nu se poate încărca previzualizarea.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Text simplu';

  @override
  String get chatTextualPreviewCopy => 'Copiază';

  @override
  String get chatAttachmentSourceGallery => 'Galerie';

  @override
  String get chatAttachmentSourceCamera => 'Cameră';

  @override
  String get chatAttachmentSourceBrowse => 'Răsfoiește fișiere';

  @override
  String get chatAttachmentPasteTooltip => 'Lipește fișierul din clipboard';

  @override
  String get chatAttachmentSpoiler => 'Ascuns';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Dezvăluie spoilerul';

  @override
  String get matureMediaRevealButton => 'Arată';

  @override
  String get matureMediaRevealHint => 'Atingeți pentru a afișa';

  @override
  String get matureContentTitle => 'Conținut explicit';

  @override
  String get matureCommunityTitle => 'Comunitate pentru adulți';

  @override
  String get matureCategoryTitle => 'Categorie matură';

  @override
  String get matureChannelTitle => 'Canal cu conținut matur';

  @override
  String get communityContentWarningTitle => 'Avertisment conținut comunitate';

  @override
  String get categoryContentWarningTitle => 'Avertisment conținut categorie';

  @override
  String get channelContentWarningTitle => 'Avertisment conținut canal';

  @override
  String get defaultContentWarningBody => 'Acest conținut este sensibil.';

  @override
  String get matureCommunityBody =>
      'Această comunitate este marcată pentru conținut matur și poate conține materiale care ar putea fi nepotrivite pentru unii utilizatori.';

  @override
  String get matureCategoryBody =>
      'Această categorie este marcată pentru conținut matur și poate conține materiale care ar putea fi nepotrivite pentru unii utilizatori.';

  @override
  String get matureChannelBody =>
      'Acest canal este marcat pentru conținut matur și poate conține materiale care ar putea fi nepotrivite pentru unii utilizatori.';

  @override
  String get matureVoiceChannelBody =>
      'Acest canal vocal este marcat ca având conținut matur și poate conține materiale nepotrivite pentru unii utilizatori.';

  @override
  String get matureLinkChannelBody =>
      'Acest canal de linkuri este marcat ca având conținut matur și poate deschide materiale care ar putea fi nepotrivite pentru unii utilizatori.';

  @override
  String get matureCommunityUnavailableBody =>
      'Această comunitate matură nu este disponibilă pentru contul tău.';

  @override
  String get matureCategoryUnavailableBody =>
      'Această categorie matură nu este disponibilă pentru contul tău.';

  @override
  String get matureChannelUnavailableBody =>
      'Acest canal pentru adulți nu este disponibil pentru contul tău.';

  @override
  String get matureContentProceedButton => 'Continuă';

  @override
  String get matureContentUnderstandButton => 'Am înțeles';

  @override
  String get matureContentOpenLinkButton => 'Deschide linkul';

  @override
  String get sensitiveContentSectionTitle => 'Conținut sensibil';

  @override
  String get sensitiveContentSectionDescription =>
      'Controlează cum sunt filtrate mediile mature sau sensibile în diferite contexte';

  @override
  String get sensitiveContentFriendDmLabel => 'Mesaje directe de la prieteni';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Mesaje directe de la alții';

  @override
  String get sensitiveContentGuildLabel => 'Mesaje în canalele comunității';

  @override
  String get sensitiveContentFilterShow => 'Afișează';

  @override
  String get sensitiveContentFilterBlur => 'Estompare';

  @override
  String get sensitiveContentFilterBlock => 'Blochează';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Estompează media până la finalizarea scanării de siguranță';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Când este activată, imaginile și videoclipurile vor fi estompate până la finalizarea scanării de siguranță a conținutului.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Această setare este mereu activată pentru contul tău.';

  @override
  String get sensitiveContentResetButton => 'Resetare';

  @override
  String get sensitiveContentSaveButton => 'Salvează';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fișiere',
      one: '1 fișier',
    );
    return 'Se încarcă $_temp0';
  }

  @override
  String get chatCancelUpload => 'Anulează încărcarea';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Expiră la $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Expiră între $start și $end';
  }

  @override
  String get connectionsTitle => 'Conexiuni';

  @override
  String connectionsDescription(String productName) {
    return 'Conectează conturi și domenii externe la profilul tău $productName. Conexiunile verificate vor fi afișate pe profilul tău pentru ca alții să le vadă.';
  }

  @override
  String get connectionsEmptyTitle => 'Nicio conexiune încă';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Conectează-ți contul Bluesky sau verifică proprietatea domeniului pentru a le afișa pe profilul tău.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifică proprietatea domeniului pentru a-l afișa pe profilul tău.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domeniu';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Adaugă conexiune Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Adaugă conexiune domeniu';

  @override
  String get connectionEdit => 'Editează';

  @override
  String get connectionRemove => 'Elimină';

  @override
  String get connectionVerifiedLabel => 'Această conexiune a fost verificată.';

  @override
  String get connectionUnverifiedLabel =>
      'Această conexiune nu a fost verificată.';

  @override
  String get connectionAddTitle => 'Adaugă conexiune';

  @override
  String get connectionTypeLabel => 'Tip conexiune';

  @override
  String get connectionHandleLabel => 'Pseudonim';

  @override
  String get connectionDomainLabel => 'Domeniu';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Ai deja această conexiune.';

  @override
  String get connectionConnectBluesky => 'Conectează-te cu Bluesky';

  @override
  String get connectionContinue => 'Continuă';

  @override
  String get connectionVerifyTitle => 'Verifică conexiunea';

  @override
  String get connectionVerifyInstructions =>
      'Folosește înregistrarea de mai jos pentru a dovedi proprietatea asupra domeniului.';

  @override
  String get connectionDnsRecordTitle => 'Înregistrare DNS TXT';

  @override
  String get connectionDnsHostLabel => 'Gazdă';

  @override
  String get connectionDnsValueLabel => 'Valoare';

  @override
  String get connectionCopyHost => 'Copiază gazda';

  @override
  String get connectionCopyValue => 'Copiază valoarea';

  @override
  String get connectionCopied => 'Copiat!';

  @override
  String get connectionTokenFileTitle => 'Trimite fișierul token';

  @override
  String get connectionTokenFileDescription =>
      'Descarcă **fluxer-verification** și plasează-l în folderul **.well-known** pentru a valida domeniul.';

  @override
  String get connectionTokenFileDownload => 'Descarcă fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Fișierul conține tokenul de verificare pe care îl vom prelua de la **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Salvează fluxer-verificare';

  @override
  String get connectionVerifyButton => 'Verifică';

  @override
  String get connectionBack => 'Înapoi';

  @override
  String get connectionEditTitle => 'Editează conexiunea';

  @override
  String get connectionEditDescription =>
      'Alege cine poate vedea această conexiune pe profilul tău.';

  @override
  String get connectionVisibilityEveryone => 'Toată lumea';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Permite oricui să vadă această conexiune pe profilul tău';

  @override
  String get connectionVisibilityFriends => 'Prieteni';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Permite-le prietenilor să vadă această conexiune';

  @override
  String get connectionVisibilityCommunityMembers => 'Membrii comunității';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Permite membrilor din comunitățile în care ești să vadă această conexiune';

  @override
  String get connectionRemoveTitle => 'Eliminare conexiune';

  @override
  String get connectionRemoveDescription =>
      'Ești sigur că vrei să elimini această conexiune? Această acțiune nu poate fi anulată.';

  @override
  String get connectionRemoveConfirm => 'Elimină';

  @override
  String get connectionsLoadError => 'Nu s-au putut încărca conexiunile';

  @override
  String get connectionsReorderError => 'Nu s-a putut actualiza ordinea';

  @override
  String get connectionInitiateFailed =>
      'Nu am putut începe verificarea. Încearcă din nou.';

  @override
  String get connectionVerifyFailed =>
      'Nu am putut verifica. Verifică înregistrarea DNS și încearcă din nou.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Nu am putut începe autorizarea Bluesky.';

  @override
  String get connectionUpdateFailed => 'Nu s-a putut actualiza conexiunea';

  @override
  String get connectionRemoveFailed => 'Nu am putut elimina conexiunea';

  @override
  String get connectionTokenSavedToast => 'Fluxer-verification salvat';

  @override
  String get connectionTokenSaveFailedToast => 'Nu am putut salva fișierul';

  @override
  String get connectionEnterHandle => 'Introdu un nume de utilizator Bluesky.';

  @override
  String get connectionEnterDomain => 'Introdu un domeniu.';

  @override
  String get lookAndFeelTitle => 'Aspect și aspect';

  @override
  String get lookAndFeelThemeSectionTitle => 'Temă';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Alege între aspectul întunecat, cărbune sau luminos.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Gamă dinamică înaltă';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Controlează cum sunt afișate imaginile HDR pe monitoarele compatibile HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Gamă dinamică completă';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Afișează imaginile HDR la luminozitate și gamă cromatică complete.';

  @override
  String get lookAndFeelHdrStandardName => 'Gamă standard';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Mapează imaginile HDR la un interval standard, reducând luminozitatea maximă.';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'Mod de afișare HDR';

  @override
  String get lookAndFeelThemeDark => 'Temă întunecată';

  @override
  String get lookAndFeelThemeCoal => 'Tema Cărbune';

  @override
  String get lookAndFeelThemeLight => 'Temă deschisă';

  @override
  String get lookAndFeelThemeSystem => 'Temă sistem';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sincronizează tema pe toate dispozitivele';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Când este activată, modificările temei se vor sincroniza pe toate dispozitivele tale. Când este dezactivată, acest dispozitiv va folosi propria setare de temă.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Tema sistemului dezactivează automat sincronizarea pentru a urmări preferința sistemului tău pe acest dispozitiv.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Nu am putut sincroniza tema în contul tău. Te rugăm să încerci din nou.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Scalare font chat';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Ajustează dimensiunea fontului în zona de chat.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Dimensiune font chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Nivel de zoom al aplicației';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Ajustează nivelul de zoom al aplicației.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Fundal chat';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Alege un fundal pentru conversație. Acesta va rămâne pe acest dispozitiv.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Această setare rămâne pe acest dispozitiv';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Imaginea de fundal a conversației este salvată doar pe acest dispozitiv și nu se sincronizează cu alte dispozitive.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Implicit';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Imagine personalizată';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Culoare $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradient $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Estompare fundal';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Nu am putut seta acea imagine ca fundal.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Mesaje';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Alege cum sunt afișate mesajele în canalele de chat.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Spațiu între grupuri de mesaje';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Mod de afișare a mesajelor';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Confortabil';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Aspect spațios, cu o separare vizuală clară între mesaje.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Dens';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximizează mesajele vizibile cu spațiere minimă.';

  @override
  String get lookAndFeelHideUserAvatarsLabel =>
      'Ascunde avatarele utilizatorilor';

  @override
  String get lookAndFeelInterfaceTitle => 'Interfață';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Personalizează elementele și comportamentele interfeței.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indicatori de tastare în lista de canale';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Alege cum apar indicatorii de tastare în lista de canale atunci când cineva tastează într-un canal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indicator de scriere + Avatare';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Afișează indicatorul de tastare cu avatare de utilizator în lista de canale';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Doar indicator de scriere';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Afișează doar indicatorul de tastare, fără avatare';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Ascuns';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Nu afișa indicatorii de tastare în lista de canale';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Afișează tastarea în canalul selectat';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Când este dezactivat (implicit), indicatorii de tastare nu vor apărea în canalul pe care îl vizualizezi în prezent.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'general';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Sugestii tastatură';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Controlează dacă indiciile pentru scurtăturile de la tastatură apar în sfaturile de instrumente.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Ascunde indiciile tastaturii în sfaturi';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Când este activată, insignele de scurtătură sunt ascunse în ferestrele pop-up de ajutor.';

  @override
  String get lookAndFeelNekoTitle => 'Diverse';

  @override
  String get lookAndFeelNekoDescription => 'Opțiuni diverse de interfață.';

  @override
  String get lookAndFeelShowNekoLabel => 'Afișează Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Când este activat, Neko apare lângă bara de introducere a mesajului.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Comportamentul la alăturarea la canalul vocal';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Controlează cum te alături canalelor vocale în comunități.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Solicită dublu clic pentru a te alătura canalelor vocale';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Când este activată, va trebui să dai dublu clic pe canalele vocale pentru a te alătura. Când este dezactivată (implicit), un singur clic te va alătura imediat canalului.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Vulpea rapidă maro sare peste câinele leneș.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Bară laterală a comunității';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configurează cum afișează bara laterală a comunității mesajele directe.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count comunități sunt temporar indisponibile din cauza unei defecțiuni a condensatorului de flux.',
      one:
          '1 comunitate este temporar indisponibilă din cauza unei defecțiuni a condensatorului de flux.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Comunitatea este temporar indisponibilă';

  @override
  String get guildUnavailableDescription =>
      'Ceva nu a mers bine. Lucrăm la remedierea problemei.';

  @override
  String get guildNotFoundTitle =>
      'Aceasta nu este comunitatea pe care o cauți.';

  @override
  String get guildNotFoundDescription =>
      'Comunitatea pe care o cauți ar fi putut fi ștearsă sau este posibil să nu ai acces la ea.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName este accesibilă momentan doar membrilor personalului $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'indisponibil temporar';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Restrânge DM-urile în dosar';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Când este activată, mesajele directe necitite din bara laterală a serverului sunt restrânse într-un folder pe butonul $productName. Apăsați butonul $productName când sunteți pe pagina Mesaje directe pentru a extinde sau restrânge folderul.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Lista de canale';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Controlează comportamentul indicatorului de mesaje necitite pentru canalele dezactivate din listele de canale.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Afișează indicatorul de mesaje necitite pe canalele dezactivate';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Când este activat, canalele dezactivate afișează un indicator estompat pentru mesajele necitite în partea stângă. Mențiunile apar în continuare, indiferent de această setare.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Activ acum';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Controlează cum apare „Activ acum” în aplicație.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Afișează activ acum pe ecranul principal';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Afișează „Activ acum” pe ecranul principal pentru a vedea prietenii activi în voce. Vei vedea o previzualizare, contextul canalului, cine este deja acolo și o modalitate rapidă de a te alătura.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favorite';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Controlează vizibilitatea elementelor favorite în întreaga aplicație.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Activare favorite';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Când este activată, poți marca canalele ca favorite și acestea vor apărea în secțiunea Favorite. Când este dezactivată, toate elementele UI legate de favorite (butoane, elemente de meniu) vor fi ascunse. Favoritele tale existente vor fi păstrate.';

  @override
  String get favoritesTitle => 'Favorite';

  @override
  String get favoritesEmptyTitle => 'Nicio favorită încă';

  @override
  String get favoritesEmptyDescription =>
      'Marchează canalele din antetul conversației pentru a le păstra aici.';

  @override
  String get favoritesWelcomeTitle => 'Bun venit la favorite';

  @override
  String get favoritesWelcomeDescription =>
      'Spațiul tău personal pentru acces rapid la canale, mesaje directe și grupuri preferate. Apasă pe steluța de lângă orice canal pentru a-l adăuga aici.';

  @override
  String get favoritesWelcomeTip =>
      'Nu e pentru tine? O poți dezactiva oricând.';

  @override
  String get favoritesDisableButton => 'Dezactivează favoritele';

  @override
  String get favoritesAddedToast => 'Adăugat la favorite';

  @override
  String get favoritesRemovedToast => 'Eliminat din favorite';

  @override
  String get favoritesHiddenToast => 'Favoritele au fost ascunse';

  @override
  String get favoritesMute => 'Dezactivează sunetul la favorite';

  @override
  String get favoritesUnmute => 'Anulează silențiozarea favoritelo';

  @override
  String get favoritesHeaderMenu => 'Meniu favorite';

  @override
  String get favoritesCreateCategory => 'Creează categorie';

  @override
  String get favoritesCategoryNameLabel => 'Numele categoriei';

  @override
  String get favoritesHideMutedChannels => 'Ascunde canalele dezactivate';

  @override
  String get favoritesShowMutedChannels => 'Afișează canalele dezactivate';

  @override
  String get favoritesSetNickname => 'Setare poreclă';

  @override
  String get favoritesNicknameLabel => 'Pseudonim';

  @override
  String get favoritesSaveNickname => 'Salvează porecla';

  @override
  String get favoritesMoveToCategory => 'Mută în categorie';

  @override
  String get favoritesUncategorized => 'Necategorizat';

  @override
  String get favoritesOtherCategory => 'Altele';

  @override
  String get favoritesRemoveFromFavorites => 'Eliminare din favorite';

  @override
  String get favoritesAddToFavorites => 'Adaugă la favorite';

  @override
  String get favoritesAddToSavedMedia => 'Adaugă la media salvată';

  @override
  String get favoritesRemoveFromSavedMedia => 'Elimină din media salvată';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Adăugare la favoritele GIF accesibile prin URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Elimină GIF-ul preferat salvat după URL';

  @override
  String get savedMediaAddTitle => 'Adaugă la media salvată';

  @override
  String get savedMediaFormNameLabel => 'Nume';

  @override
  String get savedMediaFormNameHint => 'Media mea grozavă';

  @override
  String get savedMediaFormAltTextLabel => 'Text alternativ';

  @override
  String get savedMediaFormAltTextHint => 'Descrieți media';

  @override
  String get savedMediaFormTagsLabel => 'Etichete';

  @override
  String get savedMediaFormTagsHint => 'amuzant, reacție, muncă';

  @override
  String get savedMediaSaveError => 'Nu am putut actualiza media salvată.';

  @override
  String get savedMediaNameRequired => 'Numele este obligatoriu.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Cum să salvăm GIF-urile tale favorite?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Poți salva GIF-urile marcate ca favorite doar cu URL sau le poți încărca în media salvată. Alege opțiunea care se potrivește modului în care le folosești. O poți schimba oricând în Setări > Avansat > Media.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Favorite doar cu URL (implicit): sincronizate pe toate dispozitivele tale, fără încărcare, nu se contorizează la spațiul de stocare media. Media originală poate dispărea dacă gazda o elimină.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Media salvate: încărcate, etichetabile, căutabile și persistente, dar se contorizează la limita de media salvată.';

  @override
  String get gifFavoriteFirstTimeHint => 'Vom întreba o singură dată.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Folosește doar URL (recomandat)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Folosește media salvată';

  @override
  String get favoritesHideConfirmTitle => 'Ascunde favoritele';

  @override
  String get favoritesHideConfirmDescription =>
      'Aceasta va ascunde toate elementele UI legate de favorite, inclusiv butoanele și elementele de meniu. Favoritele tale existente vor fi păstrate și pot fi reactivate oricând din Setări > Avansat > Aspect.';

  @override
  String get favoritesDirectMessageSubtitle => 'Mesaj direct';

  @override
  String get messagesMediaDisplayGroupTitle => 'Afișare';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Controlează cum sunt afișate mesajele, mediile și alt conținut.';

  @override
  String get messagesMediaMediaGroupTitle => 'Media';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Personalizează preferințele pentru dimensiunea media și butoanele.';

  @override
  String get messagesMediaInputGroupTitle => 'Introducere';

  @override
  String get messagesMediaInputGroupDescription =>
      'Personalizează setările de introducere a mesajelor.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Bară laterală';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configurează cum este afișată bara laterală a comunității.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Ascunde canalele dezactivate în mod implicit';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Ascunde automat canalele dezactivate în bara laterală când te alături unor comunități noi';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Ascunzi canalele dezactivate în mod implicit?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Canalele comunităților noi la care te alături vor fi ascunse automat. Vrei să aplici această setare și comunităților tale existente?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Nu mai ascunzi canalele dezactivate în mod implicit?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Comunitățile noi la care te alături nu vor mai avea canalele dezactivate ascunse automat. Vrei să afișezi canalele dezactivate și în toate comunitățile tale existente?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Aplică tuturor comunităților';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Afișează în toate comunitățile';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Doar comunități noi';

  @override
  String get messagesMediaDisplaySectionTitle => 'Afișaj media';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Controlează cum sunt afișate imaginile, videoclipurile și alte fișiere media. Toate fișierele media sunt redimensionate și convertite. Fișierele extrem de mari care nu pot fi comprimate într-o previzualizare nu vor fi încorporate indiferent de aceste setări.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Când sunt postate ca linkuri în chat';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Când este încărcat direct în $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Previzualizări link';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Controlează cum sunt previzualizate linkurile către site-uri web în chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Afișează încorporări și previzualizări pentru linkuri web';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reacții';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Configurează reacțiile emoji la mesaje';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Afișează reacțiile emoji la mesaje';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Conținut spoiler';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Controlează cum este afișat conținutul spoiler';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Afișează conținutul spoiler';

  @override
  String get messagesMediaSpoilersOnClickName => 'La atingere';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Afișează conținutul spoiler la atingere';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'În canalele pe care le moderez';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Afișează întotdeauna conținutul spoiler în canalele unde ai permisiunea „Gestionare mesaje”';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Întotdeauna';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Afișează întotdeauna conținutul spoiler';

  @override
  String get messagesMediaSizeSectionTitle => 'Preferințe dimensiune media';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Personalizează dimensiunea maximă de afișare pentru conținutul media încorporat și atașat. Dimensiunile mai mici folosesc mai puțin spațiu pe ecran, în timp ce dimensiunile mai mari arată mai multe detalii.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Media din linkuri (încorporări)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Fișiere atașate încărcate';

  @override
  String get messagesMediaSizeCompactName => 'Compact (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Dimensiune media mai mică';

  @override
  String get messagesMediaSizeComfortableName => 'Confortabil (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Dimensiune media mai mare, cu mai multe detalii';

  @override
  String get messagesMediaGifsSectionTitle => 'Comportament GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Controlează cum sunt inserate GIF-urile în chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Trimite automat GIF-urile când sunt selectate';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Încărcări cameră';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Alege dacă fotografiile și videoclipurile realizate cu camera din aplicație sunt păstrate pe dispozitivul tău';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Salvează pe dispozitiv';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autocompletare expresii (autocompletare cu două puncte)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Controlează ce apare în completarea automată a expresiilor când tastezi două puncte. Personalizează ce sugestii apar pentru a se potrivi preferințelor tale.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Afișează emoji implicite în completarea automată a expresiilor';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Afișează emojiuri personalizate în completarea automată a expresiilor';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Afișează stickere în completarea automată a expresiilor';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Afișează media salvată în completarea automată a expresiilor';

  @override
  String get messagesMediaEditingSectionTitle => 'Editare mesaj';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Controlează ce se întâmplă cu schița ta de editare când anulezi.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Păstrează schița modificărilor la anulare';

  @override
  String get accessibilitySaturationTitle => 'Saturație';

  @override
  String get accessibilitySaturationDescription =>
      'Ajustează cât de vii apar culorile temei în aplicație.';

  @override
  String get accessibilityVisualGroupTitle => 'Vizual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Subliniază mereu linkurile';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Estompează textul tăiat';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Previzualizări mesaje DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Controlează când sunt afișate previzualizări ale mesajelor în lista de mesaje directe.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Mod de previzualizare mesaje DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Toate mesajele';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Afișează previzualizări mesaje pentru toate conversațiile DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Doar mesaje directe necitite';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Afișează previzualizările mesajelor doar pentru DM-urile cu mesaje necitite';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Niciunul';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Nu afișa previzualizări ale mesajelor în lista de DM-uri';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Cititor de ecran';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Controlează cum funcționează $productName cu cititoarele de ecran.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Anunță mesajele noi';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Permite cititoarelor de ecran să anunțe mesajele noi pe măsură ce sosesc pe canalul deschis. Sunetele de notificare nu sunt afectate.';

  @override
  String get accessibilityTtsGroupTitle => 'Text în vorbire';

  @override
  String get accessibilityTtsGroupDescription =>
      'Alege o viteză pentru textul citit cu voce tare.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Viteză redare vorbire';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Redă exemplu';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Exemplu de silențiozitate';

  @override
  String get accessibilityPreviewButtonLabel => 'Buton de previzualizare';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Așa arată previzualizarea linkurilor: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Utilizator previzualizare';

  @override
  String get accessibilityKeyboardGroupTitle => 'Tastatură';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Afișează inelul de focalizare pe zona de text a conversației';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Tasta Esc iese din modul tastatură';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Afișează scurtăturile meniului contextual';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirmă înainte de a iniția apeluri';

  @override
  String get accessibilityAnimationGroupTitle => 'Animație';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Mișcarea redusă este activată, așa că animațiile de conținut sunt întrerupte în mod implicit. Le poți activa în continuare pe oricare dintre ele pentru a le menține în redare.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'Redă emoji animate';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'Redă automat GIF-urile';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Redă automat GIF-urile când $productName este în prim-plan';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Se redă în ciuda mișcării reduse.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pauzat de mișcarea redusă. Activează pentru a menține emoji-urile animate în redare.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Pauzat din cauza mișcării reduse. Activează pentru a menține GIF-urile în redare.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Dezactivat implicit pe mobil pentru a economisi bateria și datele mobile.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animații stickere';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Preferință animație stickere';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Animați întotdeauna';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Stickerele vor fi întotdeauna animate';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animație la interacțiune';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Stickerele se vor anima când le apeși';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Stickerele se vor anima când treci cu mouse-ul peste ele sau interacționezi cu ele';

  @override
  String get accessibilityStickerNeverAnimateName => 'Nu anima niciodată';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Stickerele nu vor fi niciodată animate';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Se animă întotdeauna, în ciuda mișcării reduse.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Mișcarea redusă limitează animarea autocolantelor la interacțiune. Alegeți „Animați întotdeauna” pentru a anula.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Implicit, se animă la interacțiune pe mobil pentru a conserva bateria.';

  @override
  String get accessibilityMotionGroupTitle => 'Mișcare';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sincronizează setarea de reducere a mișcării cu sistemul';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Utilizează preferința de reducere a mișcării a sistemului acestui dispozitiv sau personalizeaz-o mai jos.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reducere mișcare';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Dezactivează animațiile și tranzițiile. Controlate în prezent de setările sistemului tău.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Dezactivează animațiile și tranzițiile în toată aplicația.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Emoji-urile animate, GIF-urile și stickerele rămân sub controlul tău în fila Animație.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Începe apelul?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Ești sigur că vrei să începi acest apel?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Inițiază apelul';

  @override
  String get accessibilityTtsSampleDescription =>
      'Ascultă un exemplu de propoziție rostită cu viteza aleasă.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, sunt din viitor. Am venit aici într-o mașină a timpului pe care ai inventat-o. Acum, am nevoie de ajutorul tău ca să mă întorc în anul 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Sinteza vocală nu este disponibilă pe acest dispozitiv.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Redarea vocală a eșuat. Încearcă din nou sau verifică dacă funcționează ieșirea audio.';

  @override
  String get ttsSubstitutionUnknownUser => 'utilizator necunoscut';

  @override
  String get ttsSubstitutionUnknownRole => 'rol necunoscut';

  @override
  String get ttsSubstitutionUnknownChannel => 'canal necunoscut';

  @override
  String get ttsSubstitutionCodeBlock => 'bloc de cod';

  @override
  String get ttsSubstitutionSpoiler => 'conținut ascuns';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'bară $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName a spus: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Răspunzând lui $replyAuthorName, $authorName a spus: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'a trimis un sticker';

  @override
  String get ttsSentAttachment => 'a trimis un atașament';

  @override
  String ttsSentAttachments(int count) {
    return 'trimis $count atașamente';
  }

  @override
  String get ttsSentEmbed => 'a trimis un conținut încorporat';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author a trimis $summary';
  }

  @override
  String get dmListSentAnAttachment => 'A trimis o anexă';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username a fixat un mesaj pe acest canal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username a adăugat pe $userName în grup.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username a adăugat pe cineva în grup.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username a părăsit grupul.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username l-a eliminat pe $userName din grup.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username a eliminat pe cineva din grup.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username a schimbat numele canalului în $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username a schimbat numele canalului.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username a schimbat pictograma canalului.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username a inițiat un apel.';
  }

  @override
  String get systemCallJoinTheCall => 'Alătură-te apelului';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username a început un apel care a durat $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Ai ratat un apel de la $username care a durat $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Ai ratat un apel de la $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'câteva secunde';

  @override
  String get systemCallDurationMinute => 'un minut';

  @override
  String get systemCallDurationOneYear => '1 an';

  @override
  String get systemCallDurationOneMonth => '1 lună';

  @override
  String get systemCallDurationOneWeek => '1 săptămână';

  @override
  String get systemCallDurationOneDay => '1 zi';

  @override
  String get systemCallDurationOneHour => '1 oră';

  @override
  String systemCallDurationYears(int count) {
    return '$count ani';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count luni';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count săptămâni';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count zile';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count ore';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minute';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Actualizează $productName pentru a vedea acest mesaj.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Confirmare conexiune vocală';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Te-ai conectat deja la acest canal vocal de pe $count alte dispozitive. Ce dorești să faci?',
      one:
          'Te-ai conectat deja la acest canal vocal de pe 1 alt dispozitiv. Ce dorești să faci?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Comută pe acest dispozitiv';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Alătură-te acum (păstrează celelalte conexiuni)';

  @override
  String get voiceConnectionConfirmDoNothing => 'Nu mă alătura';

  @override
  String get voiceJoinFailedTitle => 'Nu am putut să te alături la voce';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Nu am putut deconecta celelalte dispozitive. Încearcă din nou peste o clipă.';

  @override
  String get voiceChannelEmptyDescription =>
      'Acesta este un canal vocal. Conectează-te pentru a începe să vorbești!';

  @override
  String get voiceChannelJoin => 'Alătură-te canalului vocal';

  @override
  String get voiceCallJoin => 'Alătură-te apelului';

  @override
  String get voiceChannelJoinConnect => 'Conectare la voce';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nu ai permisiunea de a te alătura acestui canal vocal';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Conținutul microfonului, al camerei și al partajării ecranului este criptat de la un capăt la altul.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Conținutul microfonului, al camerei și al partajării ecranului este criptat de la un capăt la altul.';

  @override
  String get voiceChannelE2eeBroken =>
      'Criptarea end-to-end nu este disponibilă, deoarece un participant neacceptat se află pe acest canal vocal.';

  @override
  String get voiceCallE2eeBroken =>
      'Criptarea end-to-end nu este disponibilă deoarece un participant neacceptat este în acest apel.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Acest client trebuie actualizat înainte de a vă alătura apelului criptat.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nu am putut porni microfonul. Rămâi în apel.';

  @override
  String get voiceChannelStatusConnecting => 'Se conectează…';

  @override
  String get voiceChannelStatusConnected => 'Conectat';

  @override
  String get voiceChannelStatusError => 'Eroare';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Dispozitiv mobil';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Dispozitiv desktop';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Comunitatea a dezactivat sunetul';

  @override
  String get voiceParticipantTooltipMuted => 'Dezactivat';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Comunitatea a dezactivat microfonul';

  @override
  String get voiceParticipantTooltipDeafened => 'Surd';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Conexiune: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participanți',
      one: '1 participant',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Părăsește';

  @override
  String get voiceControlMute => 'Dezactivează sunetul';

  @override
  String get voiceControlUnmute => 'Anulează mutarea';

  @override
  String get voiceControlDeafen => 'Dezactivează sunetul';

  @override
  String get voiceControlUndeafen => 'Anulează dezactivarea sunetului';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Inversează camera';

  @override
  String get voiceControlScreenShare => 'Partajare ecran';

  @override
  String get voiceScreenShareNotificationText => 'Se partajează ecranul.';

  @override
  String get voiceControlMore => 'Mai multe';

  @override
  String get voiceControlDisconnect => 'Deconectare';

  @override
  String get voiceInChat => 'În chatul vocal';

  @override
  String get voiceConnectionFailed => 'Conexiune eșuată';

  @override
  String get voiceConnectionRetry => 'Încearcă din nou';

  @override
  String get voiceConnectionDismiss => 'Închide';

  @override
  String get voiceConnectionDisconnected => 'Deconectat';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Se măsoară latența...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Salt la $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Conexiune voce';

  @override
  String get voiceConnectionAdvancedStats => 'Avansat';

  @override
  String get voiceShowCallAvatars => 'Afișează avatarele apelului';

  @override
  String get voiceShowConnectionId => 'Afișează ID-ul conexiunii';

  @override
  String get voiceAudioProcessing => 'Procesare audio';

  @override
  String get voiceConnectionSessionSection => 'Sesiune';

  @override
  String get voiceConnectionDurationLabel => 'Durată';

  @override
  String get voiceConnectionParticipantsLabel => 'Participanți';

  @override
  String get voiceConnectionNetworkSection => 'Rețea';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Fluctuație de latență';

  @override
  String get voiceConnectionSendLabel => 'Trimite';

  @override
  String get voiceConnectionReceiveLabel => 'Primit';

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
  String get userAreaMuteMicrophone => 'Dezactivează microfonul';

  @override
  String get userAreaUnmuteMicrophone => 'Activează microfonul';

  @override
  String get userAreaUserSettings => 'Setări utilizator';

  @override
  String get voiceParticipantMenuViewProfile => 'Vezi profilul';

  @override
  String get voiceParticipantMenuFocus => 'Focalizează această persoană';

  @override
  String get voiceParticipantMenuUnfocus => 'Anulează focalizarea';

  @override
  String get voiceParticipantMenuCommunityMute =>
      'Dezactivare sunet comunitate';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Dezactivare sunet comunitate';

  @override
  String get voiceParticipantMenuUserVolume => 'Volum utilizator';

  @override
  String get voiceParticipantMenuStreamVolume => 'Volum stream';

  @override
  String get voiceParticipantMenuStopStreaming => 'Oprire streaming';

  @override
  String get voiceParticipantModerationFailed =>
      'Nu am putut actualiza membrul. Te rugăm să încerci din nou.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Vizualizați';

  @override
  String get voiceCallViewModeGrid => 'Grilă';

  @override
  String get voiceCallViewModeFocus => 'Concentrare';

  @override
  String get voicePanelSettingsSectionTitle => 'Setări voce';

  @override
  String get voicePanelUseEarpieceLabel => 'Folosește receptorul';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Afișează doar videoclipuri';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Afișează doar participanții care au camera pornită.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Afișează-mi propria cameră';

  @override
  String get voicePrioritizeSpeakersLabel => 'Prioritizează vorbitorii';

  @override
  String get voiceTextChatShow => 'Afișează chatul';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mesaje necitite',
      one: '# mesaj necitit',
    );
    return 'Afișează chatul cu $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Este necesară permisiunea camerei pentru video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nu am putut porni partajarea ecranului. Te rugăm să încerci din nou.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Permisiunea de partajare a ecranului a fost refuzată.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Partajarea ecranului nu este disponibilă pe acest dispozitiv.';

  @override
  String get voiceWatchStream => 'Urmărește fluxul';

  @override
  String get voiceStopWatching => 'Nu mai urmări';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Nu mai urmări fluxul curent';

  @override
  String get voiceOwnScreenShareTitle => 'Transmiteți';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Streamul tău este live pentru participanți.';

  @override
  String get voiceLiveBadge => 'În direct';

  @override
  String get dmVoiceViewCall => 'Vezi apelul';

  @override
  String get dmVoiceCallFullScreen => 'Ecran complet';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Deschide apelul pe tot ecranul';

  @override
  String get dmVoiceStripStatusConnecting => 'Se conectează…';

  @override
  String get dmVoiceStripStatusInCall => 'În apel';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Apel vocal';

  @override
  String get dmVoiceCallBarConnecting => 'Se conectează…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Apel direct';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Apel de grup';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problem vocal';

  @override
  String get dmVoiceFullscreenTitle => 'Vocal';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Conectat la apel';

  @override
  String get notificationsPageTitle => 'Notificări';

  @override
  String get notificationsFilterUnreads => 'Nemesaje citite';

  @override
  String get notificationsFilterMentions => 'Mențiuni';

  @override
  String get notificationsBookmarksTooltip => 'Mesaje salvate';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrează mențiunile';

  @override
  String get notificationsMentionFiltersTitle => 'Filtre pentru mențiuni';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Include mențiunile @everyone și @here';

  @override
  String get notificationsMentionIncludeRoles => 'Include mențiunile rolurilor';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Include toate mențiunile din comunitate';

  @override
  String get notificationsNoUnreadTitle => 'Nicio mesaj nescris';

  @override
  String get notificationsNoUnreadBody => 'Ești la zi.';

  @override
  String get notificationsNoMentionsTitle => 'Nicio mențiune recentă';

  @override
  String get notificationsNoMentionsBody =>
      'Toate @mențiunile tale vor apărea aici timp de 7 zile.';

  @override
  String get notificationsMentionsEndTitle => 'Ați ajuns la final';

  @override
  String get notificationsMentionsEndBody =>
      'Ai văzut toate mențiunile tale recente. Nu-ți face griji, vor apărea mai multe aici curând.';

  @override
  String get notificationsJump => 'Salt la';

  @override
  String get notificationsRemoveMentionTooltip => 'Elimină mențiunea';

  @override
  String get notificationsViewAllUnread => 'Vezi toate mesajele necitite';

  @override
  String get notificationsMarkAsRead => 'Marchează ca citit';

  @override
  String get notificationsExpand => 'Extindeți';

  @override
  String get notificationsCollapse => 'Restrângeți';

  @override
  String get notificationsMessageUnavailable =>
      'Acest mesaj nu a putut fi încărcat.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining caractere rămase';
  }

  @override
  String get characterCounterTooLong => 'Mesajul este prea lung';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining caractere rămase. Obține $productName pentru a scrie până la $premiumMaxLength caractere.';
  }

  @override
  String get chatMessageFailedToSend => 'Mesaj netrimis';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Mesajul tău nu a putut fi livrat. Acest lucru se întâmplă de obicei deoarece nu împărtășiți o comunitate cu destinatarul sau destinatarul acceptă mesaje directe doar de la prieteni. De asemenea, este posibil să fie necesar să ajustezi propriile setări de confidențialitate pentru mesajele directe în $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Mesajul tău nu a putut fi trimis. Trebuie să-ți revendici contul pentru a trimite mesaje directe.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Mesajul tău nu a putut fi trimis. Trebuie să-ți revendici contul pentru a trimite mesaje.';

  @override
  String get chatSendFailureContentBlocked =>
      'Mesajul tău nu a putut fi livrat deoarece a fost semnalat de sistemele noastre de siguranță. Dacă crezi că este o greșeală, te rugăm să contactezi asistența.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Mesajul tău nu a putut fi livrat deoarece conține emoji sau stickere mature, care nu sunt permise în acest context.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Doar tu poți vedea acest mesaj.';

  @override
  String get chatClientSystemDismiss => 'Închide';

  @override
  String get privacyDashboardCommunicationSection => 'Comunicare';

  @override
  String get privacyDashboardProfilePrivacySection =>
      'Confidențialitatea profilului';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Prietenii și mesajele directe';

  @override
  String get privacyDashboardActivitySharingSection => 'Partajarea activității';

  @override
  String get privacyDashboardSensitiveContentSection => 'Conținut sensibil';

  @override
  String get privacyDashboardDataExportSection => 'Export date';

  @override
  String get privacyDashboardDataDeletionSection => 'Ștergerea datelor';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Cine îți poate vedea profilul complet';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Prieteni și toate comunitățile';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Profilul tău complet este vizibil prietenilor și oricui din comunitățile tale';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Doar prietenii și comunitățile mici';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Profilul tău complet este vizibil pentru prieteni și membrii comunităților tale cu 200 sau mai puțini membri';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Doar prietenii';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Profilul tău complet este vizibil doar pentru prietenii tăi';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Solicitări de prietenie';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Toată lumea';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Permite oricui să-ți trimită cereri de prietenie';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Prietenii prietenilor';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Permite prietenilor prietenilor tăi să-ți trimită cereri';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Membrii comunității';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Permite membrilor din comunitățile tale să-ți trimită cereri';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Mesaje directe';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Permite mesaje directe de la membrii comunității';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Permite membrilor din comunitățile tale să-ți trimită mesaje directe';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Permite mesaje directe de la boții comunității';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Permite roboților din comunitățile tale să-ți trimită mesaje directe';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Controlează cine îți poate trimite cereri de prietenie și mesaje directe';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Controlează cine te poate suna și cine te poate adăuga în conversații de grup';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Apeluri primite';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Controlează cine te poate suna';

  @override
  String get privacyDashboardAllowedCallers => 'Apeluri permise';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nimeni';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blocați toate apelurile primite';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Doar prietenii';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Permite doar prietenilor să te sune (recomandat)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Prietenii + Personalizat';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Permite prietenilor plus grupuri suplimentare pe care le alegi';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Toată lumea';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Permite oricui să te sune, chiar și străinilor';

  @override
  String get privacyDashboardAdditionalGroups => 'Grupuri suplimentare';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Persoanele care sunt prietene cu prietenii tăi te pot suna';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Persoanele din comunitățile în care vă aflați amândoi vă pot suna';

  @override
  String get privacyDashboardRingBehavior => 'Comportament inel';

  @override
  String get privacyDashboardSilentCalls =>
      'Apeluri silențioase de la toată lumea';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Toate apelurile vor notifica silențios în loc să sune. Implicit, apelurile de la persoane necunoscute sunt întotdeauna silențioase.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Cine te poate adăuga în conversații de grup';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Controlează cine te poate adăuga în conversații de grup fără să ceară permisiunea. Oricine îți poate trimite în continuare linkuri de invitație pentru a te alătura.';

  @override
  String get privacyDashboardAllowedInvites => 'Invitări permise';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Nu lăsa pe nimeni să te adauge în conversații de grup fără să întrebe';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Permite doar prietenilor să te adauge fără confirmare (recomandat)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Permite prietenilor și grupurilor suplimentare să te adauge';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Permite oricui să te adauge în conversații de grup fără să ceară permisiunea';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Persoanele care sunt prietene cu prietenii tăi te pot adăuga în conversații de grup';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Persoanele din comunitățile în care vă aflați amândoi vă pot adăuga în conversații de grup';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Activitate vocală în „Activ acum\"';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Partajează activitatea vocală cu prietenii';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Partajați activitatea vocală cu toți prietenii?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Oprești partajarea activității vocale cu toți prietenii?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Ești pe cale să începi să partajezi activitatea ta vocală cu toți prietenii tăi, inclusiv cu cei viitori. Aceasta trimite o actualizare tuturor și poate fi modificată din nou abia peste 24 de ore.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Ești pe cale să nu mai partajezi activitatea vocală cu toți prietenii tăi, inclusiv cu cei viitori. Aceasta trimite o actualizare tuturor și poate fi modificată din nou abia peste 24 de ore.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Da, partajează cu toți prietenii';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Da, nu mai partaja';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Disponibil din nou în $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Partajarea activității vocale a fost actualizată';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Nu s-a putut actualiza acum partajarea activității vocale';

  @override
  String get privacyDashboardDataExportDesc =>
      'Creează o arhivă descărcabilă a datelor contului tău, inclusiv mesaje și adrese URL ale atașamentelor. Majoritatea oamenilor doresc totul, dar poți restrânge domeniul de aplicare mai jos.';

  @override
  String get privacyDashboardExportMyData => 'Exportă-mi datele';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Șterge definitiv mesajele pe care le-ai trimis în mesaje directe, mesaje directe de grup și comunități. Procesul rulează în fundal și vei primi un mesaj direct când se finalizează.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Șterge-mi mesajele';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Permiți mesaje directe de la membrii comunității?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Blochezi mesajele directe de la membrii comunității?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Permiți roboților să-ți trimită mesaje directe?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blochezi roboții să-ți trimită mesaje directe?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Permiți și mesaje directe de la membrii comunităților tale existente?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Vrei să blochezi și mesajele directe de la membrii comunităților tale existente?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Dorești să permiți roboților din comunitățile tale existente să-ți trimită mesaje directe?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Vrei să blochezi roboții și din comunitățile tale existente?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Poți schimba și această setare per-comunitate apăsând lung pe numele comunității și selectând Setări de confidențialitate.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Permite pentru toate comunitățile';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Blochează pentru toate comunitățile';

  @override
  String get privacyDashboardDmConfirmSkip => 'Omite acest pas';

  @override
  String get privacyDashboardDataRequestGoBack => 'Înapoi';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Exportă-mi datele';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Șterge-mi mesajele';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Vom procesa acest lucru cât mai curând posibil. Vei primi un e-mail când arhiva ta este gata.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Vom procesa asta cât mai curând posibil. Vei primi un mesaj direct de la noi când e gata.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Ce să includă';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Totul';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exportă fiecare mesaj pe care l-ai trimis vreodată, plus toate setările contului tău, abonamentele și metadatele.';

  @override
  String get privacyDashboardDataRequestExportCustom =>
      'Selecție personalizată';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Alege ce tipuri de conversații, comunități și interval de timp să incluzi în arhivă.';

  @override
  String get privacyDashboardDataRequestDeleteSelected => 'Alege ce să incluzi';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Alege ce tipuri de conversații să ștergi.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Doar locurile la care nu mai am acces';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Șterge doar mesajele din comunitățile și conversațiile de grup pe care le-ai părăsit sau din care ai fost eliminat.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Ce conversații';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Activează tipurile de conversații pe care vrei să le incluzi.';

  @override
  String get privacyDashboardDataRequestKindDms => 'DM-uri deschise';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'DM-uri închise';

  @override
  String get privacyDashboardDataRequestKindGroupDms =>
      'Mesaje directe de grup';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Comunități';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Ce comunități';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Filtru comunitate';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Include tot, cu excepția celor selectate';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Doar cele selectate';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Nu ești în nicio comunitate în acest moment.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Interval de timp';

  @override
  String get privacyDashboardDataRequestDateMode => 'Interval de timp';

  @override
  String get privacyDashboardDataRequestAllTime => 'Oricând';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Interval personalizat';

  @override
  String get privacyDashboardDataRequestStartDate => 'Data de început';

  @override
  String get privacyDashboardDataRequestEndDate => 'Data de încheiere';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Lasă oricare câmp necompletat pentru a lăsa capătul intervalului nelimitat.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Alege cel puțin un tip de conversație de inclus.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Data de început trebuie să fie anterioară datei de sfârșit.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Revizuiește și confirmă';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Vom crea o arhivă descărcabilă cu toate mesajele pe care le-ai trimis vreodată și te vom anunța prin e-mail când este gata. Linkul de descărcare din acel e-mail expiră după 7 zile.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Vom crea o arhivă descărcabilă care corespunde filtrelor de mai jos și îți vom trimite un e-mail când este gata. Linkul de descărcare din acel e-mail expiră după 7 zile.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Șterge definitiv mesajele care corespund filtrelor de mai jos. Această acțiune nu poate fi anulată.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Nu există recuperare odată ce începe. Te vom notifica prin mesaj direct când se termină.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Solicită exportul';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Șterge mesajele';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Domeniu';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Conversații';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Comunități';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Interval de timp';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Niciunul';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'De la $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Până la $end';
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
      other: '# comunități',
      one: '# comunitate',
    );
    return 'Toate, cu excepția $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# comunități',
      one: '# comunitate',
    );
    return 'Doar $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Mesaje directe deschise';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Mesaje directe închise';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Mesaje directe (deschise și închise)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms =>
      'Mesaje directe de grup';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Comunități';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ore',
      one: '# oră',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minute',
      one: '# minut',
    );
    return '$_temp0 și $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ore',
      one: '# oră',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minute',
      one: '# minut',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# secunde',
      one: '# secundă',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Nu s-au putut încărca setările de confidențialitate';

  @override
  String get privacyDashboardRetry => 'Reîncercați';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Nu am putut salva setările pentru conținut sensibil.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Solicitarea nu a putut fi finalizată.';

  @override
  String get chatMessageDeleteFailed => 'Șterge mesajul eșuat';

  @override
  String get chatMessageAddReaction => 'Adaugă reacție';

  @override
  String get chatMessageEdit => 'Editează mesajul';

  @override
  String get chatMessageReply => 'Răspunde';

  @override
  String get chatMessageForward => 'Redirecționează';

  @override
  String get forwardMessageTitle => 'Redirecționează mesajul';

  @override
  String get forwardSearchHint => 'Căutați canale sau mesaje directe';

  @override
  String get forwardDirectMessagesSection => 'Mesaje directe';

  @override
  String get forwardCommentHint => 'Adaugă un comentariu (opțional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Trimite ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Nu s-au găsit canale';

  @override
  String get forwardSuccessToast => 'Mesaj trimis';

  @override
  String get forwardFailed => 'Nu s-a putut trimite mesajul';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Comentariile nu sunt disponibile, deoarece un canal selectat are activată funcția de încetinire.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Se așteaptă expirarea modului lent în unul sau mai multe canale selectate.';

  @override
  String get slowmodeRateLimitedTitle => 'Modul lent activ';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Modul lent este activat — așteaptă $duration înainte de a trimite un alt mesaj.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Încărcarea directă este dezactivată în timpul modului lent.';

  @override
  String get shareMediaTitle => 'Trimite către';

  @override
  String get shareMediaMessageHint => 'Adaugă un mesaj opțional…';

  @override
  String get shareMediaSendButton => 'Trimite';

  @override
  String get shareMediaSuccessToast => 'Media distribuită';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Partajat către $count destinații';
  }

  @override
  String get shareMediaFailedToast => 'Nu s-a putut partaja media';

  @override
  String get forwardDestinationNoSendPermission =>
      'Nu poți trimite mesaje aici';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Nu poți încorpora linkuri aici';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Nu poți atașa fișiere aici';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Trimiterea mesajelor este dezactivată în această comunitate';

  @override
  String get forwardDestinationTimedOut =>
      'Ai primit o penalizare în această comunitate';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Slowmode - așteaptă $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copiază mesajul';

  @override
  String get chatMessageCopyEmbedText => 'Copiază textul încorporat';

  @override
  String get chatMessageTranslate => 'Traduceți';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Tradus din $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Vezi originalul';

  @override
  String get chatMessageSeeTranslation => 'Vezi traducerea';

  @override
  String get chatMessageTranslating => 'Se traduce…';

  @override
  String get chatMessageTranslateFailed => 'Nu am putut traduce acest mesaj.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Traducerea nu este disponibilă pe acest dispozitiv.';

  @override
  String get chatMessageSpeak => 'Citește mesajul';

  @override
  String get chatMessageStopSpeaking => 'Oprește vorbirea';

  @override
  String get chatMessagePin => 'Fixare mesaj';

  @override
  String get chatMessageUnpin => 'Anulează fixarea mesajului';

  @override
  String get chatMessageUnpinIt => 'Anulează fixarea';

  @override
  String get chatMessageBookmark => 'Marchează mesajul';

  @override
  String get chatMessageRemoveBookmark => 'Eliminare marcaj';

  @override
  String get chatMessageMarkAsUnread => 'Marchează ca necitit';

  @override
  String get chatMessageCopyMessageLink => 'Copiază linkul mesajului';

  @override
  String get chatMessageOpenLink => 'Deschide linkul';

  @override
  String get chatMessageCopyLink => 'Copiază linkul';

  @override
  String get chatMessageCopyMessageId => 'Copiază ID-ul mesajului';

  @override
  String get chatMessageViewReactions => 'Vezi reacțiile';

  @override
  String get chatMessageRemoveAllReactions => 'Elimină toate reacțiile';

  @override
  String get chatMessageDebug => 'Mesaj de depanare';

  @override
  String get chatMessageDebugSheetTitle => 'Mesaj de depanare';

  @override
  String get chatMessageDebugCopyJson => 'Copiază JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON-ul mesajului a fost copiat în clipboard';

  @override
  String get chatReactionsSheetTitle => 'Reacții';

  @override
  String get chatReactionsSheetEmpty => 'Nimeni nu a reacționat încă la asta.';

  @override
  String get chatReactionAddFailed => 'Nu am putut adăuga reacția';

  @override
  String get chatReactionRemoveFailed => 'Nu am putut elimina reacția';

  @override
  String get chatMessageReport => 'Raportează mesajul';

  @override
  String get iarReportMessageTitle => 'Raportează mesajul';

  @override
  String get iarThisUserFallback => 'acest utilizator';

  @override
  String get iarModalDescription =>
      'Raportează o încălcare a regulilor sau găsește instrumente pentru a-ți gestiona contactele și preferințele.';

  @override
  String get iarPathStepAriaLabel => 'De ce ai nevoie?';

  @override
  String get iarCategoryStepTitle => 'Ce fel de regulă a fost încălcată?';

  @override
  String get iarReasonStepTitle => 'Ce regulă a fost încălcată?';

  @override
  String get iarReasonSelectHint => 'Selectează un motiv';

  @override
  String get iarPickAnOptionToast => 'Alege o opțiune pentru a continua.';

  @override
  String get iarPickARuleToast => 'Alege regula care a fost încălcată.';

  @override
  String get iarPathPlatform => 'Raportează o încălcare a regulilor platformei';

  @override
  String get iarPathCommunity => 'Raportează moderatorilor acestei comunități';

  @override
  String get iarPathPreferenceMessage => 'Nu-mi place acest conținut';

  @override
  String get iarCategoryTargetedHarmLabel =>
      'Amenințări, hărțuire sau vătămare';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Hărțuire, amenințări, ură, violență, raiduri sau conținut care încurajează autovătămarea.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Siguranța copiilor sau conținut matur';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Minori în pericol, conținut matur în locuri nepotrivite sau comportament nedorit.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Confidențialitate sau uzurpare de identitate';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, hărțuire, uzurpare de identitate sau un profil neadecvat.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Înșelătorii, malware sau dezinformare';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, fraudă, linkuri malițioase sau afirmații false care pot provoca daune în lumea reală.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Activitate ilegală sau altceva';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Vânzări ilegale, facilitarea infracțiunilor sau o încălcare clară a regulilor care nu se încadrează în categoriile de mai sus.';

  @override
  String get iarReasonHarassmentLabel => 'Hărțuire sau amenințări';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Hărțuire, contact nedorit repetat, urmărire sau abuz țintit.';

  @override
  String get iarReasonHateLabel => 'Discurs instigator la ură';

  @override
  String get iarReasonHateMessageDescription =>
      'Jigniri, limbaj dezumanizant sau atacuri la adresa grupurilor protejate.';

  @override
  String get iarReasonViolenceLabel => 'Violență sau amenințări violente';

  @override
  String get iarReasonViolenceDescription =>
      'Amenințări credibile, violență explicită sau glorificarea violenței.';

  @override
  String get iarReasonMatureContentLabel => 'Conținut matur sau hărțuire';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Comportament nedorit sau conținut matur într-un loc nepotrivit.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Siguranța copiilor sau exploatarea minorilor';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Conținut de grooming sau exploatare a copiilor.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Dezinformare dăunătoare';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Afirmații false care pot provoca daune în lumea reală.';

  @override
  String get iarReasonSpamLabel => 'Spam, înșelătorii sau phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam în masă, fraudă, concursuri false sau abuz de cont.';

  @override
  String get iarReasonMalwareLabel =>
      'Software rău intenționat sau linkuri periculoase';

  @override
  String get iarReasonMalwareDescription =>
      'Programe malware, furt de date de conectare sau fișiere dăunătoare.';

  @override
  String get iarReasonPrivacyLabel => 'Încălcare a confidențialității';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, expunerea de informații private sau hărțuirea.';

  @override
  String get iarReasonImpersonationLabel =>
      'Impersonare sau conținut media înșelător';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Se dă drept altcineva, inclusiv conținut înșelător generat de AI.';

  @override
  String get iarReasonIllegalLabel => 'Activitate ilegală';

  @override
  String get iarReasonIllegalDescription =>
      'Vânzări ilegale, facilitarea infracțiunilor sau activități ilicite.';

  @override
  String get iarReasonSelfHarmLabel => 'Auto-vătămare sau sinucidere';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promovarea sau instrucțiunile care încurajează autovătămarea sau tulburările de alimentație.';

  @override
  String get iarReasonOtherLabel => 'Încălcare clară a regulilor';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Folosește doar dacă încalcă în mod clar regulile $productName și nu se încadrează în categoriile de mai sus.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Dacă este implicat un minor, folosește în schimb \"$childSafetyReason\".';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Dacă implică CSAM sau exploatarea unui minor, trimite acum și nu redistribui materialul.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Dacă cineva este în pericol imediat, contactează serviciile de urgență locale, dacă o poți face în siguranță.';

  @override
  String get iarSafetyNoteViolence =>
      'Dacă aceasta este o amenințare credibilă și iminentă, contactează și serviciile locale de urgență.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Dacă aceasta este o amenințare teroristă iminentă, contactează și serviciile locale de urgență.';

  @override
  String get iarActionBlockUserTitle => 'Blochează acest utilizator';

  @override
  String get iarActionBlockUserDescription =>
      'Oprește mesajele și cererile de prietenie.';

  @override
  String get iarActionBlockUserButton => 'Blochează';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copiază linkul mesajului';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Trimite moderatorilor comunității.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copiază';

  @override
  String get iarActionCloseDmTitle => 'Închide acest mesaj direct';

  @override
  String get iarActionCloseDmDescription =>
      'Nu blochează. Poți redeschide mai târziu.';

  @override
  String get iarActionCloseDmButton => 'Închide conversația';

  @override
  String get iarActionLeaveCommunityTitle => 'Părăsește comunitatea';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Nu vei mai vedea conținutul și membrii săi.';

  @override
  String get iarActionLeaveCommunityButton => 'Părăsește';

  @override
  String get iarActionDmSettingsTitle => 'Setări DM și cereri de prietenie';

  @override
  String get iarActionDmSettingsDescription =>
      'Schimbă cine te poate contacta.';

  @override
  String get iarActionCallSettingsTitle => 'Setări apeluri și chat de grup';

  @override
  String get iarActionCallSettingsDescription =>
      'Schimbă cine te poate apela sau adăuga.';

  @override
  String get iarActionOpenButton => 'Deschideți';

  @override
  String get iarActionDeleteMessageTitle => 'Șterge acest mesaj';

  @override
  String get iarActionDeleteMessageDescription =>
      'Elimină-l de pe canal pentru toată lumea.';

  @override
  String get iarActionDeleteMessageButton => 'Șterge';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Șters';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Acest mesaj a fost deja șters.';

  @override
  String get iarActionBanUserTitle => 'Banează acest utilizator';

  @override
  String get iarActionBanUserDescription =>
      'Deschide dialogul de interzicere pentru această comunitate.';

  @override
  String get iarActionBanUserButton => 'Interzice';

  @override
  String get iarActionBanUserBannedButton => 'Interzis';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Acest utilizator este deja interzis din comunitate.';

  @override
  String get iarCloseDmConfirmTitle => 'Închide conversația';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Închide conversația ta curentă cu $name. Acest lucru nu îi va bloca; o poți redeschide mai târziu.';
  }

  @override
  String get iarSuccessTitle => 'Raport trimis';

  @override
  String get iarSuccessBody =>
      'Echipa noastră de siguranță examinează raportul. Îți vom trimite un mesaj direct și un e-mail după ce vom ajunge la un verdict.';

  @override
  String get iarAlreadyReportedTitle => 'Raportat deja';

  @override
  String get iarAlreadyReportedBody =>
      'Ai raportat deja acest mesaj. Echipa noastră de siguranță îl analizează.';

  @override
  String get iarBackButton => 'Înapoi';

  @override
  String get iarContinueButton => 'Continuă';

  @override
  String get iarSendReportButton => 'Trimite raportul';

  @override
  String get iarDoneButton => 'Gata';

  @override
  String get iarCouldntSendToast =>
      'Nu am putut trimite raportul. Te rugăm să încerci din nou.';

  @override
  String get iarRateLimitedToast =>
      'Raportezi prea repede. Te rugăm să aștepți o clipă și să încerci din nou.';

  @override
  String get iarReportSentToast =>
      'Raport trimis. Echipa noastră de siguranță îl va analiza.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Blochezi pe $name? Nu te vor putea contacta sau trimite cereri de prietenie. Îi poți debloca mai târziu.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Nu am putut bloca acest utilizator. Te rugăm să încerci din nou.';

  @override
  String get iarCloseDmSuccessToast => 'Mesaj privat închis.';

  @override
  String get iarCloseDmFailedToast =>
      'Nu am putut închide acest mesaj direct. Te rugăm să încerci din nou.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Nu am putut părăsi acest grup. Te rugăm să încerci din nou.';

  @override
  String get chatMessageSuppressEmbeds => 'Suprimă previzualizările';

  @override
  String get chatMessageUnsuppressEmbeds => 'Afișează previzualizările';

  @override
  String get chatMessageDelete => 'Șterge mesajul';

  @override
  String get chatMessageDeleteConfirmTitle => 'Șterge mesajul';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Ești sigur că vrei să ștergi acest mesaj?';

  @override
  String get chatMessageDeleteAttachment => 'Șterge atașamentul';

  @override
  String get chatMessageEditAttachmentAltText => 'Editează textul alternativ';

  @override
  String get chatMessageMore => 'Mai multe';

  @override
  String get chatEditingMessage => 'Se editează mesajul';

  @override
  String get chatReplyOriginalDeleted => 'Mesajul original a fost șters';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Mesajul original nu a putut fi încărcat';

  @override
  String get chatReplyAttachedMedia => 'Mesajul conține fișiere media atașate';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesaje blocate',
      one: '1 mesaj blocat',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesaje potențiale de spammer',
      one: '1 mesaj potențial de spammer',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Răspunsul este ascuns deoarece autorul original este blocat.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Răspuns ascuns deoarece autorul original este marcat ca spammer.';

  @override
  String get devMarkAsSpamLocally => 'Marchează ca spam local';

  @override
  String get devIgnoreSpamFlag => 'Ignoră semnalarea ca spam';

  @override
  String get chatMessagesLoadError => 'Nu am putut încărca mesajele.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Suprascrii preferința de menționare?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname preferă să fie menționat(ă) în răspunsuri. Trimite oricum, fără mențiune?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname preferă răspunsurile fără o mențiune @. Trimite oricum cu mențiunea?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignoră preferința';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Atingeți pentru a dezactiva notificările pentru utilizatorul căruia îi răspunzi.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Atingeți pentru a activa notificările pentru utilizatorul căruia îi răspunzi.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Menționează utilizatorul care a răspuns';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Anulează răspunsul';

  @override
  String get chatEditMessageHint => 'Editează mesajul';

  @override
  String get chatEditNoChanges => 'Nicio modificare de salvat';

  @override
  String get chatChannelNotReady =>
      'Acest canal nu este gata încă. Încearcă din nou peste o clipă.';

  @override
  String get chatMessageEdited => '(editat)';

  @override
  String get chatMessageSilent => 'Aceasta a fost un mesaj @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Azi la $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Ieri la $time';
  }

  @override
  String get mediaViewerImagePreview => 'Previzualizare imagine';

  @override
  String get mediaViewerClose => 'Închide vizualizatorul media';

  @override
  String get mediaViewerOpenInBrowser => 'Deschide în browser';

  @override
  String get mediaViewerOptions => 'Opțiuni media';

  @override
  String get mediaViewerCopyLink => 'Copiază linkul';

  @override
  String get mediaViewerForward => 'Redirecționează';

  @override
  String get mediaViewerZoomIn => 'Mărire';

  @override
  String get mediaViewerZoomOut => 'Micșorare';

  @override
  String get mediaViewerPreviousAttachment => 'Atașamentul anterior';

  @override
  String get mediaViewerNextAttachment => 'Următoarea anexă';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Fișier atașat $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Închide';

  @override
  String get chatAttachmentVideoToggleControls =>
      'Afișează/ascunde controalele video';

  @override
  String get chatAttachmentVideoMute => 'Dezactivează sunetul videoclipului';

  @override
  String get chatAttachmentVideoUnmute => 'Dezactivează sunetul videoclipului';

  @override
  String get chatAttachmentVideoPlay => 'Redă videoclipul';

  @override
  String get chatAttachmentVideoPause => 'Oprește videoclipul';

  @override
  String get chatAttachmentVideoProgress => 'Progres video';

  @override
  String get chatVideoPlaybackFailed => 'Nu s-a putut reda acest videoclip.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Notifică utilizatorii cu acest rol care au permisiunea de a vedea acest canal.';

  @override
  String get composerAutocompleteSuggestions => 'Sugestii';

  @override
  String get composerAutocompleteCommandsHeading => 'Comenzi';

  @override
  String get composerAutocompleteChoicesHeading => 'Opțiuni';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Argumente opționale';

  @override
  String get composerAutocompleteChannelsHeading => 'Canale';

  @override
  String get composerAutocompleteMembersHeading => 'Membri';

  @override
  String get composerAutocompleteUsersHeading => 'Utilizatori';

  @override
  String get composerAutocompleteMentionsHeading => 'Mențiuni';

  @override
  String get composerAutocompleteRolesHeading => 'Roluri';

  @override
  String get composerAutocompleteMediaHeading => 'Media';

  @override
  String get composerAutocompleteStickersHeading => 'Autocolante';

  @override
  String get composerAutocompleteGifsHeading => 'GIF-uri';

  @override
  String get composerAutocompleteNoGifs => 'Nu s-au găsit GIF-uri';

  @override
  String get composerCommandShrugDescription =>
      'Adaugă ¯\\_(ツ)_/¯ la mesajul tău.';

  @override
  String get composerCommandTableflipDescription =>
      'Adaugă (╯°□°)╯︵ ┻━┻ la mesajul tău.';

  @override
  String get composerCommandUnflipDescription =>
      'Adaugă ┬─┬ ノ( ゜-゜ノ) la mesajul tău.';

  @override
  String get composerCommandMeDescription =>
      'Trimite un mesaj de acțiune (se afișează în italic).';

  @override
  String get composerCommandSpoilerDescription =>
      'Trimite un mesaj spoiler (îl încadrează în etichete spoiler).';

  @override
  String get composerCommandTtsDescription =>
      'Trimite un mesaj text-to-speech.';

  @override
  String get composerCommandNickDescription =>
      'Schimbă-ți porecla în această comunitate.';

  @override
  String get composerCommandKickDescription =>
      'Elimină un membru din această comunitate.';

  @override
  String get composerCommandBanDescription =>
      'Banează un membru din această comunitate.';

  @override
  String get composerCommandMsgDescription =>
      'Trimite un mesaj direct unui utilizator.';

  @override
  String get composerCommandSavedDescription =>
      'Trimite un element media salvat.';

  @override
  String get composerCommandStickerDescription => 'Trimite un sticker.';

  @override
  String get composerCommandGifDescription => 'Căutați și trimiteți un GIF.';

  @override
  String get composerCommandMemberOption => 'Membru vizat.';

  @override
  String get composerCommandReasonOption => 'Motiv (opțional).';

  @override
  String get composerCommandMessageOption => 'Mesajul de trimis.';

  @override
  String get composerCommandQueryOption => 'Ce să cauți.';

  @override
  String get composerCommandNicknameOption =>
      'Noul tău poreclă sau lasă liber pentru a o reseta.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Cât din istoricul mesajelor recente ale membrului să fie șters.';

  @override
  String get composerCommandDeleteMessagesNone => 'Nu șterge niciuna';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Ultimele $count zile';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Ultimele 24 de ore';

  @override
  String get composerCommandOptionRequired =>
      'Această opțiune este obligatorie. Vă rugăm să furnizați o valoare.';

  @override
  String get composerCommandClear => 'Șterge comanda';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Ți-ai schimbat porecla în această comunitate din **$previousNickname** în **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Utilizator necunoscut';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Nu am putut trimite un mesaj către **$username**. Este posibil ca persoana respectivă să aibă dezactivate mesajele directe sau să fiți blocat.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+ $count mai multe';
  }

  @override
  String get addGuildModalTitle => 'Adaugă o comunitate';

  @override
  String get addGuildModalLandingDescription =>
      'Creează o comunitate nouă sau alătură-te uneia existente.';

  @override
  String get addGuildCreateCommunity => 'Creează o comunitate';

  @override
  String get addGuildJoinCommunity => 'Alătură-te comunității';

  @override
  String get addGuildImportDiscordTemplate => 'Importă șablon Discord';

  @override
  String get addGuildJoinTitle => 'Alătură-te unei comunități';

  @override
  String get addGuildJoinDescription =>
      'Introdu linkul de invitație pentru a te alătura unei comunități.';

  @override
  String get addGuildInviteLinkLabel => 'Link de invitație';

  @override
  String get addGuildJoinSubmit => 'Alătură-te comunității';

  @override
  String get addGuildInviteInvalid =>
      'Acest link de invitație este invalid sau a expirat.';

  @override
  String get addGuildJoinFailed =>
      'Nu am putut să te alături comunității. Te rugăm să încerci din nou.';

  @override
  String get addGuildCreateTitle => 'Creează o comunitate';

  @override
  String get addGuildCreateDescription =>
      'Creează o comunitate pentru tine și prietenii tăi, unde puteți discuta.';

  @override
  String get addGuildCreateNameLabel => 'Numele comunității';

  @override
  String get addGuildCreateSubmit => 'Creează o comunitate';

  @override
  String get addGuildCreateFailed =>
      'Nu s-a putut crea comunitatea. Te rugăm să încerci din nou.';

  @override
  String get addGuildCreateClaimTitle => 'Revendică-ți contul';

  @override
  String get addGuildCreateClaimDescription =>
      'Trebuie să-ți revendici contul înainte de a putea crea o comunitate.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifică-ți adresa de e-mail';

  @override
  String get addGuildCreateVerifyDescription =>
      'Trebuie să-ți verifici adresa de e-mail înainte de a putea crea o comunitate.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Nu se acceptă pictograme animate la crearea unei noi comunități. Folosește o imagine statică.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Prin crearea unei comunități, ești de acord să respecți și să susții ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Ghidul comunității $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Instanța este o singură comunitate, deci nu pot fi create comunități suplimentare.';

  @override
  String get addGuildCreateChangeIcon => 'Schimbă pictograma';

  @override
  String get addGuildCreateIconLabel => 'Pictogramă comunitate';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Maxim 10 MB. Recomandat: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Lipește un URL de șablon Discord pentru a-i importa structura într-o comunitate nouă.';

  @override
  String get addGuildImportUrlLabel => 'URL șablon';

  @override
  String get addGuildImportUrlInvalid =>
      'Introdu o adresă URL sau un cod de șablon Discord valid.';

  @override
  String get addGuildImportFetchFailed =>
      'Nu am putut prelua șablonul comunității. Este posibil ca șablonul să nu existe sau serviciul extern să fie indisponibil.';

  @override
  String get addGuildImportInvalidResponse =>
      'Acesta nu pare a fi un răspuns de șablon valid.';

  @override
  String get addGuildImportTemplateLabel => 'Șablon';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount text, $voiceChannelCount voce, $categoryCount categorii, $roleCount roluri';
  }

  @override
  String get addGuildImportRemoveIcon => 'Elimină pictograma';

  @override
  String get addGuildImportTemplateInvalid =>
      'Datele șablonului comunității sunt invalide sau incorecte.';

  @override
  String get addGuildPackInstalled => 'Pachetul a fost instalat cu succes.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Elimină toate reacțiile';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Ești sigur că vrei să elimini toate reacțiile de la acest mesaj?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Anulează fixarea mesajului';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Trimiți acest mesaj fixat înapoi în timp?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username a afișat $messageLink în acest canal. Vezi $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'un mesaj';

  @override
  String get systemPinMessageAllPinsLink => 'toate mesajele fixate';

  @override
  String get channelPinsEmptyTitle => 'Niciun mesaj fixat';

  @override
  String get channelPinsEmptyDescription => 'Mesajele fixate apar aici.';

  @override
  String get channelDetailsFallbackTitle => 'Detalii';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Grup privat · $count membri';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Închizi conversația cu $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Părăsești $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Setări canal';

  @override
  String get channelDetailsGroupSettingsTitle => 'Setări grup';

  @override
  String get channelDetailsDmSettingsTitle => 'Setări mesaj direct';

  @override
  String get channelDetailsInvitePeople => 'Invită persoane';

  @override
  String get channelDetailsCopyLink => 'Copiază linkul';

  @override
  String get channelMenuCopyChannelLink => 'Copiază linkul canalului';

  @override
  String get channelMenuCopyRedirectLink => 'Copiază linkul de redirecționare';

  @override
  String get channelDetailsAddFriendsToGroup => 'Adaugă prieteni în grup';

  @override
  String get channelDetailsGroupInvites => 'Invitații de grup';

  @override
  String get channelDetailsEditChannel => 'Editează canalul';

  @override
  String get channelDetailsDeleteChannel => 'Șterge canalul';

  @override
  String get channelSettingsCategorySettingsTitle => 'Setări categorie';

  @override
  String get channelSettingsEditCategory => 'Editează categoria';

  @override
  String get channelSettingsTabOverview => 'Prezentare generală';

  @override
  String get channelSettingsTabPermissions => 'Permisiuni';

  @override
  String get channelSettingsTabInvites => 'Invitații';

  @override
  String get channelSettingsTabWebhooks => 'Webhook-uri';

  @override
  String get channelSettingsDeleteChannel => 'Șterge canalul';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Ești sigur că vrei să ștergi $channelName? Această acțiune nu poate fi anulată.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Ești sigur că vrei să ștergi $categoryName? Această acțiune nu poate fi anulată.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Șterge categoria';

  @override
  String get channelSettingsChannelUpdated => 'Canal actualizat';

  @override
  String get channelSettingsChannelName => 'Numele canalului';

  @override
  String get channelSettingsCategoryName => 'Numele categoriei';

  @override
  String get channelSettingsMyCategory => 'Categoria mea';

  @override
  String get categoryExpandCategory => 'Extinde categoria';

  @override
  String get categoryCollapseCategory => 'Restrânge categoria';

  @override
  String get categoryExpandAllCategories => 'Extinde toate categoriile';

  @override
  String get categoryCollapseAllCategories => 'Restrânge toate categoriile';

  @override
  String get categoryMuteCategory => 'Dezactivează notificările categoriei';

  @override
  String get categoryUnmuteCategory => 'Activează sunetul categoriei';

  @override
  String get categoryCopyCategoryId => 'Copiază ID-ul categoriei';

  @override
  String get categoryIdCopied => 'ID categorie copiat';

  @override
  String get channelSettingsChannelNamePlaceholder => 'general';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Subiect';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Adaugă un subiect acestui canal';

  @override
  String get channelSettingsInsertEmoji => 'Inserează emoji';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'Subiectul canalului este prea lung.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Scurtează subiectul și încearcă din nou.';

  @override
  String get channelSettingsSlowmode => 'Mod lent';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Așteaptă între mesaje. „$bypassSlowmodePermissionLabel” poate să ocolească această limită.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Dezactivat';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds secunde';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minute';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours ore';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minut';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour oră';
  }

  @override
  String get channelSettingsVoiceQuality => 'Calitatea vocii';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'O rată de biți mai mare = calitate mai bună și utilizare mai mare a lățimii de bandă.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Limită participanți';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Numărul maxim de membri care se pot alătura simultan. 0 înseamnă nelimitat.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participanți',
      one: '1 participant',
      zero: '∞ Fără limită',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Limită conexiuni';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Numărul maxim de conexiuni active pe care un membru le poate menține în acest canal.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conexiuni',
      one: '1 conexiune',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Regiune vocală';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Selectează o regiune vocală pentru acest canal. Automată folosește cea mai apropiată regiune.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automat';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Nu s-au putut încărca regiunile vocale';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Încearcă din nou mai târziu.';

  @override
  String get channelSettingsResetSlider =>
      'Resetați glisorul la valoarea implicită';

  @override
  String get channelSettingsAdvanced => 'Avansat';

  @override
  String get channelSettingsMatureContentOverride =>
      'Suprascriere conținut matur';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Înlocuiește setarea de nivel $scopeLevel pentru acest canal. Conținutul matur este afișat în spatele unui filtru înainte de intrare.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Moștenește';

  @override
  String get channelSettingsMatureContentOn => 'Activat';

  @override
  String get channelSettingsMatureContentOff => 'Dezactivat';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Marchează acest canal pentru conținut pentru adulți.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Părăsește acest canal neblocat pentru conținut matur.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Moștenit de la $inheritedSourceLabel: activat';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Moștenit de la $inheritedSourceLabel: dezactivat';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'categorie';

  @override
  String get channelSettingsMatureContentCommunitySource => 'comunitate';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Categorie';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Comunitate';

  @override
  String get channelSettingsContentWarningToggle =>
      'Afișează un avertisment de conținut în acest canal';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Afișează o solicitare de consimțământ înainte de a intra în acest canal.';

  @override
  String get channelSettingsContentWarningText =>
      'Text de avertizare personalizat';

  @override
  String get channelSettingsContentWarningDefault =>
      'Acest conținut este sensibil.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Ai nevoie de permisiunea \"$manageChannelsPermissionLabel\" pentru a edita aceste permisiuni.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Ai nevoie de permisiunea \"$manageRolesPermissionLabel\" pentru a edita aceste permisiuni.';
  }

  @override
  String get channelSettingsUnknownRole => 'Rol necunoscut';

  @override
  String get channelSettingsUnknownUser => 'Utilizator necunoscut';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'Suprascrieri acces';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Editează accesul pentru $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Înapoi la suprascrieri';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Configurează accesul de bază pentru acest canal';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Configurează suprascrieri pentru acest rol';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Configurează excepții pentru acest membru';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Căutați permisiuni…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Accesul la canal a fost actualizat';

  @override
  String get channelSettingsPermissionsTitle => 'Controlul accesului';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Acest canal este sincronizat cu categoria părinte ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Acest canal nu este sincronizat cu categoria părinte ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Sincronizare cu categoria';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Canal sincronizat cu categoria părinte';

  @override
  String get channelSettingsPermissionsAddOverride =>
      'Adaugă permisiune personalizată';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Căutați roluri sau membri…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Roluri și membri';

  @override
  String get channelSettingsDeleteInvite => 'Șterge invitația';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Ștergi această invitație? Acțiunea nu poate fi anulată.';

  @override
  String get channelSettingsCopyInviteCode => 'Copiază codul de invitație';

  @override
  String get channelSettingsCopyInviteUrl => 'Copiază linkul de invitație';

  @override
  String get channelSettingsWebhookCreated => 'Webhook creat';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Crearea webhook-ului a eșuat';

  @override
  String get channelSettingsCreateWebhook => 'Creează webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Gestionează link-urile de invitație pentru acest canal.';

  @override
  String get channelSettingsInvitesCreate => 'Creează invitație';

  @override
  String get channelSettingsInvitesEmpty => 'Nu există linkuri de invitație';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Acest canal nu are încă linkuri de invitație. Creează unul pentru a invita persoane pe acest canal.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'A apărut o eroare la încărcarea linkurilor de invitație pentru acest canal. Încearcă din nou.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Gestionează webhook-urile de intrare care pot posta mesaje pe acest canal.';

  @override
  String get channelSettingsWebhooksEmpty => 'Niciun webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Nu există webhook-uri configurate pentru acest canal. Creează un webhook pentru a permite aplicațiilor externe să posteze mesaje.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Acest canal nu acceptă webhook-uri.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Ai nevoie de permisiunea „$permission” pentru a vizualiza și edita webhook-urile pentru acest canal.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Nu s-au putut încărca webhook-urile';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'A apărut o eroare la încărcarea webhook-urilor pentru acest canal. Încearcă din nou.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Creat de $creator pe $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Utilizator necunoscut';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Încarcă imaginea';

  @override
  String get channelSettingsWebhooksRemove => 'Elimină';

  @override
  String get channelSettingsWebhooksName => 'Nume';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Nume webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Canal';

  @override
  String get channelSettingsWebhooksUrl => 'URL webhook';

  @override
  String get channelSettingsWebhooksCopyUrl =>
      'Copiază adresa URL a webhook-ului';

  @override
  String get channelSettingsWebhooksDelete => 'Șterge webhook-ul';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Nu s-a putut șterge acest webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Ștergi acest webhook? Nu poate fi anulat.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Încearcă din nou mai târziu.';

  @override
  String get channelMenuOpenChat => 'Deschide chatul';

  @override
  String get channelMenuDuplicateChannel => 'Duplică canalul';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Resetați starea acordului privind conținutul matur';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Ștergi mesajele tale din acest canal?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Aceasta va șterge definitiv toate mesajele pe care le-ați trimis vreodată pe acest canal. Acțiunea nu poate fi anulată.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Șterge mesajele mele';

  @override
  String get channelMenuDeletedYourMessages => 'Mesajele tale au fost șterse';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Nu s-au putut șterge mesajele tale';

  @override
  String get channelDetailsSystemMessage => 'Mesaj de sistem';

  @override
  String get channelDetailsTextChannel => 'Canal text';

  @override
  String get channelDetailsVoiceChannel => 'Canal vocal';

  @override
  String get channelDetailsCategory => 'Categorie';

  @override
  String get channelDetailsLinkChannel => 'Conectează canalul';

  @override
  String get channelDetailsGenericChannel => 'Canal';

  @override
  String get channelDetailsMutedConversation => 'Conversație dezactivată';

  @override
  String get channelDetailsUnmutedConversation => 'Conversație demutedă';

  @override
  String get channelDetailsMutedChannel => 'Canal dezactivat';

  @override
  String get channelDetailsUnmutedChannel => 'Canalul a fost dezactivat';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Setări de notificări actualizate';

  @override
  String get channelDetailsTabMembers => 'Membri';

  @override
  String get channelDetailsTabPins => 'Mesaje fixate';

  @override
  String get channelDetailsActionMute => 'Dezactivează sunetul';

  @override
  String get channelDetailsActionUnmute => 'Reactivați';

  @override
  String get channelDetailsActionSearch => 'Căutare';

  @override
  String get channelDetailsActionMore => 'Mai multe';

  @override
  String get channelDetailsMembersEmptyTitle => 'Nu există membri de afișat';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Membrii vor apărea aici odată ce datele comunității vor fi încărcate.';

  @override
  String get memberListPermissionDeniedTitle => 'Nu poți vedea membrii';

  @override
  String get memberListPermissionDeniedBody =>
      'Nu poți vedea membrii acestui canal în această comunitate';

  @override
  String get memberListUnavailableTitle =>
      'Lista de membri nu este disponibilă';

  @override
  String get memberListUnavailableBody =>
      'Listele de membri sunt temporar indisponibile în această comunitate';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'Nu s-au putut încărca pinii';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Membrii cu permisiunea „Fixează mesaje” pot fixa mesaje pentru ca toată lumea să le vadă.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Poți fixa mesaje în această conversație pentru ca toată lumea să le vadă.';

  @override
  String get channelDetailsPinsEndReached => 'Ați ajuns la final';

  @override
  String get channelHeaderOpenDetails => 'Deschide detaliile canalului';

  @override
  String get channelHeaderPinnedMessages => 'Mesaje fixate';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Mesaje fixate, necitite';

  @override
  String get channelHeaderMemberList => 'Listă membri';

  @override
  String get channelHeaderInbox => 'Mesaje';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Setări notificări, dezactivat';

  @override
  String get channelDetailsSearchTitle => 'Căutare';

  @override
  String get channelDetailsSearchHint => 'Caută mesaje';

  @override
  String get channelDetailsSearchFilterFrom => 'De la';

  @override
  String get channelDetailsSearchFilterHas => 'Are';

  @override
  String get channelDetailsSearchFilterIn => 'În';

  @override
  String get channelDetailsSearchFilterMentions => 'Mențiuni';

  @override
  String get channelDetailsSearchFilterMore => 'Mai multe';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Activ';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count canale';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count utilizatori';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Utilizator';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtrați după canal';

  @override
  String get channelDetailsSearchChannelsHint => 'Căutați canale';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Nu s-au găsit canale';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Fixate';

  @override
  String get channelDetailsSearchPinnedTrue => 'Doar fixate';

  @override
  String get channelDetailsSearchPinnedFalse => 'Exclude de la fixate';

  @override
  String get channelDetailsSearchClearFilter => 'Șterge';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Tip autor';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Dată';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Mod dată';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Alege o dată';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Nume gazdă link';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'Numele fișierului conține';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Extensie fișier';

  @override
  String get channelDetailsSearchContentPoll => 'Sondaj';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Mesaje cu un sondaj';

  @override
  String get channelDetailsSearchContentForward => 'Redirecționează';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Mesaje redirecționate';

  @override
  String get channelDetailsSearchFilterSort => 'Sortare';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filtre de căutare';

  @override
  String get channelHeaderSearchRecentTitle => 'Căutări recente';

  @override
  String get channelHeaderSearchUsersTitle => 'Utilizatori';

  @override
  String get channelHeaderSearchChannelsTitle => 'Canale';

  @override
  String get channelHeaderSearchValuesTitle => 'Valori';

  @override
  String get channelHeaderSearchDatesTitle => 'Date';

  @override
  String get channelHeaderSearchDefaultBadge => 'Implicit';

  @override
  String get channelHeaderSearchClearHistory => 'Șterge';

  @override
  String get channelHeaderSearchFilterDescFrom => 'un utilizator';

  @override
  String get channelHeaderSearchFilterDescMentions => 'un utilizator';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, embed, imagine, video, sunet, fișier, sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'o dată sau un interval de date';

  @override
  String get channelHeaderSearchFilterDescOn =>
      'o dată sau un interval de date';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'o dată sau un interval de date';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'o dată sau un interval de date';

  @override
  String get channelHeaderSearchFilterDescIn => 'un canal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'adevărat sau fals';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'utilizator, bot sau webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'un nume de gazdă, de ex. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'parte dintr-un nume de fișier atașat';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'o extensie de fișier, de ex. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'dată sau relevanță';

  @override
  String get channelHeaderSearchFilterDescOrder => 'asc sau desc';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString rezultate',
      one: '1 rezultat',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtrează după utilizator';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtrați după conținut';

  @override
  String get channelDetailsSearchSortBy => 'Sortează rezultatele după';

  @override
  String get channelDetailsSearchIn => 'Caută în';

  @override
  String get channelDetailsSearchEmptyTitle => 'Caută în această conversație';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Introdu text, un autor sau un filtru de conținut pentru a găsi mesaje.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Mesajele sunt indexate';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Încearcă din nou în scurt timp, după ce căutarea termină de indexat acest domeniu.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Niciun rezultat';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Încearcă alți termeni de căutare sau filtre.';

  @override
  String get channelDetailsMembersOnline => 'Conectat';

  @override
  String get channelDetailsMembersOffline => 'Deconectat';

  @override
  String get channelDetailsMemberYou => 'Tu';

  @override
  String get channelDetailsSearchUsersHint => 'Căutați utilizatori';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Scrie pentru a căuta membri';

  @override
  String get channelDetailsSearchUsersEmpty => 'Nu s-au găsit utilizatori';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Niciun utilizator disponibil';

  @override
  String get channelDetailsDone => 'Gata';

  @override
  String get channelDetailsHasFilterPrompt => 'Afișează mesajele care conțin:';

  @override
  String get channelDetailsRetry => 'Reîncercați';

  @override
  String get channelDetailsPinnedMessageTitle => 'Mesaj fixat';

  @override
  String get channelDetailsSearchResultTitle => 'Rezultat căutare';

  @override
  String get channelDetailsJumpToMessage => 'Mergi la mesaj';

  @override
  String get channelDetailsUnpinMessage => 'Eliminare mesaj din agrafă';

  @override
  String get channelDetailsCopyMessageLink => 'Copiază linkul mesajului';

  @override
  String get channelDetailsCopyMessageId => 'Copiază ID-ul mesajului';

  @override
  String get channelDetailsMessageUnpinned => 'Mesaj desprins';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Comunitatea curentă';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Conversația curentă';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Toate comunitățile';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Doar toate mesajele directe';

  @override
  String get channelDetailsSearchScopeAllDms => 'Toate mesajele directe';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Doar DM-uri deschise';

  @override
  String get channelDetailsSearchScopeOpenDms => 'DM-uri deschise';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Toate mesajele directe + Comunități';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Mesaje directe și comunități deschise';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Caută doar în comunitatea curentă';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Căutați doar în conversația curentă';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'În toate comunitățile în care te afli în prezent';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Doar în toate conversațiile private în care ai fost vreodată';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'În toate conversațiile private în care ai fost vreodată';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'În toate conversațiile tale private deschise acum';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'În toate conversațiile tale private deschise';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'În toate conversațiile directe în care ai fost vreodată + toate comunitățile în care ești în prezent';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'În toate conversațiile tale directe deschise + toate comunitățile din care faci parte';

  @override
  String get channelDetailsSearchSortNewest => 'Cele mai noi întâi';

  @override
  String get channelDetailsSearchSortOldest => 'Cele mai vechi mai întâi';

  @override
  String get channelDetailsSearchSortRelevance => 'Cele mai relevante';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Afișează mai întâi cele mai recente mesaje';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Afișează mai întâi cele mai vechi mesaje';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Afișează mai întâi cele mai relevante mesaje';

  @override
  String get channelDetailsSearchContentImage => 'Încărcare imagine';

  @override
  String get channelDetailsSearchContentVideo => 'Încărcare video';

  @override
  String get channelDetailsSearchContentAudio => 'Încărcare audio';

  @override
  String get channelDetailsSearchContentFile => 'Încărcare fișier';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Previzualizare sau încorporare link';

  @override
  String get channelDetailsSearchContentSticker => 'Autocolant';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Doar imagini încărcate';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Doar fișiere video încărcate';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Doar fișiere audio încărcate';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Orice atașament încărcat';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL tastat în textul mesajului';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Previzualizări și încorporări îmbogățite rezolvate, nu încărcări';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker atașat mesajului';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count tipuri';
  }

  @override
  String get personalNotesTitle => 'Note personale';

  @override
  String get personalNotesSubtitle =>
      'Spațiul tău privat pentru gânduri și memento-uri';

  @override
  String groupDmWelcome(String displayName) {
    return 'Bun venit pe $displayName. Adaugă prieteni pentru a porni conversația.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Editează grupul';

  @override
  String get groupDmWelcomeAddFriends => 'Adaugă prieteni în grup';

  @override
  String get dmGroupInvites => 'Invitații';

  @override
  String get groupDmEditTitle => 'Editează grupul';

  @override
  String get groupDmEditDetailsTooltip => 'Editează detaliile grupului';

  @override
  String get groupDmGroupName => 'Numele grupului';

  @override
  String get groupDmMyGroup => 'Grupul meu';

  @override
  String get groupDmGroupNameMaxLength =>
      'Numele grupului nu poate depăși 100 de caractere';

  @override
  String get groupDmGroupIcon => 'Pictogramă grup';

  @override
  String get groupDmUploadIcon => 'Încarcă pictogramă';

  @override
  String get groupDmChangeIcon => 'Schimbă pictograma';

  @override
  String get groupDmRemoveIcon => 'Elimină pictograma';

  @override
  String get groupDmUpdated => 'Grup actualizat';

  @override
  String get groupDmUpdateFailed =>
      'Nu am putut actualiza grupul. Încearcă din nou.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Pictogramele animate nu sunt acceptate. Folosește o imagine statică.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Pictogramele animate nu sunt acceptate';

  @override
  String get groupDmIconFileTooLargeTitle =>
      'Fișierul pictogramei este prea mare';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Fișierul pictogramei este prea mare. Alege un fișier mai mic de $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Format pictogramă neacceptat';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Tip de fișier neacceptat.';

  @override
  String get groupDmCouldntProcessImage => 'Nu s-a putut procesa imaginea';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Procesarea imaginii decupate a eșuat. Încearcă din nou.';

  @override
  String get groupDmInvalidImage => 'Imagine nevalidă';

  @override
  String get groupDmInvalidImageBody =>
      'Această imagine este nevalidă. Încearcă alta.';

  @override
  String get groupDmAddFriends => 'Adaugă';

  @override
  String get groupDmOrSendInvite => 'sau trimite o invitație unui prieten:';

  @override
  String get groupDmGenerateInviteLink => 'Generează link de invitație';

  @override
  String get groupDmCreateInvite => 'Creează';

  @override
  String get groupDmInviteExpires24Hours => 'Invitația ta expiră în 24 de ore';

  @override
  String get groupDmAddFriendFailed =>
      'Nu s-a putut adăuga acest prieten în grup. Te rugăm să încerci din nou.';

  @override
  String get groupDmAddFailed => 'Nu s-a putut adăuga în grup';

  @override
  String get groupDmGroupFull =>
      'Acest grup este plin. Elimină pe cineva înainte de a adăuga mai multe persoane.';

  @override
  String get groupDmRateLimited =>
      'Mergi prea repede. Așteaptă un moment și încearcă din nou.';

  @override
  String get groupDmCreateInviteFailed =>
      'Nu s-a putut crea linkul de invitație';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Nu s-a putut genera un link de invitație. Te rugăm să încerci din nou.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Nu am putut crea un link de invitație. Te rugăm să încerci din nou.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Nu ai permisiunea de a crea o invitație în acest canal.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Comunitatea a atins limita de invitații.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Crearea invitațiilor este dezactivată temporar pentru această comunitate.';

  @override
  String get groupDmCopyInviteFailed =>
      'Nu s-a putut copia linkul de invitație';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Doar proprietarul grupului poate gestiona invitațiile.';

  @override
  String get groupDmNoInvitesCreated => 'Nu au fost create invitații';

  @override
  String get groupDmLoadingInvites => 'Se încarcă invitațiile...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Nu s-au putut încărca invitațiile. Încearcă din nou.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Revocați această invitație? Acțiunea nu poate fi anulată.';

  @override
  String get groupDmInviteRevoked => 'Invitație revocată';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Creat de $name. Expiră în $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Bun venit în $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'La început, nu era nimic. Apoi, a apărut $channelName. Și a fost bine.';
  }

  @override
  String get personalNotesComposerHint => 'Trimite-ți un mesaj';

  @override
  String channelComposerHint(String channelName) {
    return 'Mesaj #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Trimite mesaj lui @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Mesaj $groupName';
  }

  @override
  String get groupDmComposerHint => 'Grup de mesaje';

  @override
  String get composerHint => 'Trimite mesaj';

  @override
  String get composerOpenExpressionPicker => 'Deschide selectorul de expresii';

  @override
  String get composerShowKeyboard => 'Afișează tastatura';

  @override
  String get composerCloseAttachmentPanel => 'Închide selectorul de atașamente';

  @override
  String get chatAttachmentPanelPhotos => 'Fotografii';

  @override
  String get chatAttachmentPanelFiles => 'Fișiere';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Acces la biblioteca foto necesar';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Permite accesul la biblioteca foto pentru a răsfoi și atașa fotografii și videoclipuri recente.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Deschide setările';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', trimițând';

  @override
  String get messageAccessibilityFailedSuffix => ', a eșuat trimiterea';

  @override
  String get messageAccessibilityAttachmentSummary => 'un atașament';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count atașamente';
  }

  @override
  String get messageAccessibilityImageSummary => 'o imagine';

  @override
  String get messageAccessibilityVideoSummary => 'un videoclip';

  @override
  String get messageAccessibilityAudioSummary => 'un fișier audio';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'fișierul $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'un atașament spoiler';

  @override
  String get messageAccessibilityEmbedSummary => 'o încorporare';

  @override
  String get messageAccessibilityEmptySummary => 'un mesaj';

  @override
  String get personalNotesPrivateSpace => 'Spațiul tău privat';

  @override
  String get purgePersonalNotes => 'Șterge notițele personale';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Aceasta va șterge permanent fiecare mesaj și atașament din notele tale personale. Această acțiune nu poate fi anulată.';

  @override
  String get purgePersonalNotesConfirmButton => 'Șterge';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Au fost șterse $count mesaje din notele personale';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Notele personale erau deja goale';

  @override
  String get purgePersonalNotesFailed =>
      'Nu s-au putut șterge notele personale';

  @override
  String get userSettingsGroupYourAccount => 'CONTUL TĂU';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Caută setări...';

  @override
  String get userSettingsSearchFieldLabel => 'Caută în setări';

  @override
  String get userSettingsSearchClear => 'Șterge căutarea';

  @override
  String get userSettingsSearchNoResults => 'Nu s-au găsit setări';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Securitate și autentificare';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Cadouri';

  @override
  String get giftSettingsClaimAccountTitle => 'Revendică-ți contul';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Revendică-ți contul pentru a răscumpăra sau gestiona codurile cadou Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Revendică un cadou';

  @override
  String get giftSettingsRedeemDescription =>
      'Introdu un cod cadou pentru a răscumpăra Plutonium pentru contul tău.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Introdu codul cadou…';

  @override
  String get giftSettingsRedeemButton => 'Revendică';

  @override
  String get giftSettingsRedeemSuccess =>
      'Cadou răscumpărat cu succes. Bucură-te de Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Cadouri cumpărate';

  @override
  String get giftSettingsPurchasedDescription =>
      'Gestionează codurile cadou Plutonium pe care le-ai achiziționat. Distribuie URL-ul cadoului cu cineva drag sau valorifică-l pentru tine!';

  @override
  String get giftSettingsEmptyTitle => 'Niciun cadou încă';

  @override
  String get giftSettingsEmptyDescription =>
      'Cumpără un cadou Plutonium din fila Plutonium pentru a-l împărtăși cu prietenii.';

  @override
  String get giftSettingsGoToPlutonium => 'Mergi la Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Nu s-a putut încărca inventarul de cadouri';

  @override
  String get giftSettingsLoadFailedDescription =>
      'Încearcă din nou mai târziu.';

  @override
  String get giftSettingsTryAgain => 'Încearcă din nou';

  @override
  String get giftSettingsGiftUrl => 'URL cadou';

  @override
  String get giftSettingsCopy => 'Copiază';

  @override
  String get giftSettingsCopied => 'Copiat';

  @override
  String get giftSettingsGiftUrlCopied =>
      'Adresa URL a cadoului a fost copiată în clipboard!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Nu s-a putut copia URL-ul cadoului';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Cumpărat $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Reținut $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Răscumpărat de $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Acest cadou a fost revendicat';

  @override
  String get giftSettingsRedeemForYourself => 'Revendică pentru tine';

  @override
  String get giftSettingsShareWithFriend => 'Trimite unui prieten';

  @override
  String get premiumPlutoniumTagline =>
      'Deblochează limite mai mari și funcții exclusive, susținând în același timp o platformă de comunicare independentă.';

  @override
  String get premiumPurchaseMode => 'Mod de achiziție';

  @override
  String get premiumForMe => 'Pentru mine';

  @override
  String get premiumAsAGift => 'Ca un cadou';

  @override
  String get premiumMonthly => 'Lunar';

  @override
  String get premiumYearly => 'Anual';

  @override
  String get premiumPerMonth => 'pe lună';

  @override
  String get premiumPerYear => 'pe an';

  @override
  String get premiumOneTimePurchase => 'achiziție unică';

  @override
  String get premiumSave17 => 'Economisește 17%';

  @override
  String get premiumUpgradeNow => 'Actualizează acum';

  @override
  String get premiumBuyGift => 'Cumpără cadou';

  @override
  String get premiumOneYearGift => 'Cadou 1 an';

  @override
  String get premiumOneMonthGift => 'Cadou 1 lună';

  @override
  String get premiumMostPopular => 'Cel mai popular';

  @override
  String get premiumScrollPrompt =>
      'Derulează în jos pentru a vedea toate beneficiile incluse cu Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Gratuit vs Plutonium';

  @override
  String get premiumFreeColumn => 'Gratuit';

  @override
  String get premiumGiftSectionTitle => 'Oferă Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Oferă-le prietenilor tăi experiența Plutonium cumpărând un abonament cadou.';

  @override
  String get premiumGiftBannerOne => 'Ai un nou cod cadou care te așteaptă!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Ai $count coduri cadou noi care te așteaptă!';
  }

  @override
  String get premiumViewGifts => 'Vezi cadourile';

  @override
  String get premiumReadyToUpgrade => 'Ești gata să faci upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Ești gata să cumperi un cadou?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Lunar $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Anual $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 an $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 lună $price';
  }

  @override
  String get premiumManageSubscription => 'Gestionează abonamentul';

  @override
  String get premiumRedeemGiftCode => 'Valorifică codul cadou';

  @override
  String get premiumGiftBadge => 'Cadou';

  @override
  String get premiumCancelSubscriptionTitle => 'Anulezi abonamentul?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Îți păstrezi beneficiile până la următoarea dată de reînnoire, apoi ai o perioadă de grație de 3 zile pentru a te reabona și a-ți păstra istoricul de abonat.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Anulează abonamentul';

  @override
  String get premiumKeepSubscription => 'Păstrează abonamentul';

  @override
  String get premiumPurchaseHistoryTitle => 'Istoric achiziții';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Facturile tale recente. Pentru a schimba metoda de plată pentru abonamentul tău, adaugă sau alege una în portalul de facturare și seteaz-o ca implicită.';

  @override
  String get premiumManagePaymentMethods => 'Gestionează metodele de plată';

  @override
  String get premiumBillingHistory => 'Istoricul plăților';

  @override
  String get premiumSelfServeRefundTitle => 'Rambursare automată';

  @override
  String get premiumSelfServeRefundButton => 'Restituie ultima achiziție';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Prin achiziționare, ești de acord cu termenii noștri ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Prin achiziționare, ați fost de acord cu ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' și ';

  @override
  String premiumActiveUntil(String date) {
    return 'Activ până la $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Se anulează';

  @override
  String premiumCancelsOn(String date) {
    return 'Se anulează pe $date. Avantajele rămân active până atunci.';
  }

  @override
  String get premiumReactivateSubscription => 'Reactivează';

  @override
  String premiumGiftedUntil(String date) {
    return 'Cadou până la $date. Nu se reînnoiește automat.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Funcționalitate';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Prin achiziție, ai acceptat $terms și $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Rambursări self-service disponibile în 3 zile de la plată, o dată la 30 de zile. Rambursarea unui abonament îl anulează. Cumpărătorii din UE/SEE renunță la dreptul de retragere de 14 zile la finalizarea comenzii pentru a accesa conținutul imediat. Folosește butonul de rambursare din aplicație în loc de o anulare a plății. Anulările plăților pot restricționa permanent contul tău. Stripe gestionează plățile în siguranță. Nu vedem niciodată numărul complet al cardului tău.';

  @override
  String get premiumTermsOfService => 'Termeni și condiții';

  @override
  String get premiumPrivacyPolicy => 'Politica de confidențialitate';

  @override
  String get premiumCheckoutStartFailedTitle => 'Nu s-a putut iniția plata';

  @override
  String get premiumCheckoutStartFailedBody =>
      'A apărut o eroare la inițierea plății. Te rugăm să încerci din nou mai târziu.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Ești în prezent la un abonament cadou. Acesta nu se va reînnoi. Poți valorifica mai multe coduri cadou pentru a-l prelungi. Abonamentele recurente pot fi începute după ce se termină perioada cadou.';

  @override
  String get premiumPlanUnavailable =>
      'Acest plan nu este disponibil. Contactează asistența.';

  @override
  String get premiumCompletePaymentTitle => 'Finalizează plata';

  @override
  String get premiumCompletePaymentBody =>
      'Acum vei fi redirecționat către Stripe pentru a finaliza plata. Revino la Fluxer după ce ai terminat.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Alege metoda de plată';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Plătește cu Pix automat pentru a autoriza direct de pe banca ta braziliană taxele recurente. Sau alege să folosești cardul pentru a introduce un card de credit pe ecranul următor al Stripe.';

  @override
  String get premiumUsePix => 'Folosește Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Plătește cu UPI pentru a configura un e-mandat conform RBI de la banca ta indiană. Sau alege să folosești cardul pentru a introduce un card de credit pe ecranul următor al Stripe.';

  @override
  String get premiumUseUpi => 'Folosește UPI';

  @override
  String get premiumUseCard => 'Folosește cardul';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Nu s-a putut deschide portalul de facturare';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'A apărut o eroare la deschiderea portalului de facturare. Te rugăm să încerci din nou mai târziu.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Ești deja Vizionar';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary include deja acces permanent, deci nu este necesar un abonament recurent. Poți cumpăra în continuare cadouri pentru alții.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abonamentul există deja';

  @override
  String get premiumExistingSubscriptionBody =>
      'Am găsit un abonament Fluxer Plutonium existent pentru acest cont. Gestionați-l în portalul de facturare securizat pentru a actualiza detaliile de plată sau pentru a verifica starea reînnoirii. Dacă tocmai ați plătit, așteptați un minut și redeschideți această pagină.';

  @override
  String get premiumPurchasesDisabledTitle => 'Achizițiile nu sunt disponibile';

  @override
  String get premiumPurchasesDisabledBody =>
      'Achizițiile sunt dezactivate pentru acest cont. Contactați support@fluxer.app dacă credeți că este o greșeală.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Revendică-ți contul pentru a cumpăra Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Trebuie să îți verifici emailul înainte de a putea achiziționa Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag =>
      'Etichetă de utilizator personalizată';

  @override
  String get premiumPerkPerCommunityProfiles =>
      'Profiluri pentru fiecare comunitate';

  @override
  String get premiumPerkMessageScheduling => 'Programare mesaje';

  @override
  String get premiumPerkProfileBadge => 'Insignă de profil';

  @override
  String get premiumPerkCustomVideoBackgrounds =>
      'Fundaluri video personalizate';

  @override
  String get premiumPerkEntranceSounds => 'Sunete de intrare';

  @override
  String get premiumPerkCommunities => 'Comunități';

  @override
  String get premiumPerkMessageCharacterLimit => 'Limită de caractere mesaj';

  @override
  String get premiumPerkBookmarkedMessages => 'Mesaje salvate';

  @override
  String get premiumPerkFileUploadSize => 'Dimensiune fișier încărcat';

  @override
  String get premiumPerkEmojiStickerPacks => 'Pachete de emoji și stickere';

  @override
  String get premiumPerkSavedMedia => 'Elemente media salvate';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Folosește emoji animate';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Acces global la emoji și stickere';

  @override
  String get premiumPerkVideoQuality => 'Calitatea video';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Avatare animate și bannere de profil';

  @override
  String get premiumPerkEarlyAccess => 'Acces timpuriu la funcții noi';

  @override
  String get premiumPerkCustomThemes => 'Teme personalizate';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Până la 4K/60fps';

  @override
  String get userSettingsNavPrivacyDashboard => 'Panou de confidențialitate';

  @override
  String get userSettingsNavAuthorizedApps => 'Aplicații autorizate';

  @override
  String get userSettingsNavBlockedUsers => 'Utilizatori blocați';

  @override
  String get userSettingsNavLinkedDevices => 'Dispozitive conectate';

  @override
  String get userSettingsNavConnections => 'Conexiuni';

  @override
  String get userSettingsNavLookAndFeel => 'Aspect';

  @override
  String get userSettingsNavAccessibility => 'Accesibilitate';

  @override
  String get userSettingsNavChat => 'Conversație';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio și video';

  @override
  String get userSettingsNavShortcuts => 'Comenzi rapide';

  @override
  String get audioAndVideoAudioSectionTitle => 'Audio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Configurează microfonul, difuzoarele și procesarea vocii.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Configurează calitatea camerei tale și a partajării ecranului.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'Comportament în apel';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Controlează solicitările de confirmare în timpul apelurilor vocale și video.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Dispozitiv de intrare';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Dispozitiv de ieșire';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Implicit';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Folosește difuzorul';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Când este dezactivat, sunetul se redă prin receptor sau prin căștile conectate.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Volum intrare';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Volum ieșire';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Procesare voce';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Voce focalizată';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Recomandat. Îți curăță microfonul pentru o vorbire clară.';

  @override
  String get audioAndVideoDirectInputLabel => 'Intrare directă';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Trimite sunetul tău nemodificat. Cel mai bine dacă folosești software audio extern.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Personalizat';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Ajustează fiecare setare: suprimarea zgomotului, anularea ecoului și amplificarea.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Suprimare zgomot';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Îmbunătățit';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Niciuna';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Anulare ecou';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Control automat al amplificării';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Echilibrează volumul microfonului. Dezactivat când suprimarea îmbunătățită este activată.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Test microfon';

  @override
  String get audioAndVideoMicTestStartLabel => 'Pornește testul microfonului';

  @override
  String get audioAndVideoMicTestStopLabel => 'Oprește testul microfonului';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName are nevoie de acces la microfon pentru a testa intrarea audio.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Cameră';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Oglindire cameră';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Calitatea camerei';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Calitatea partajării ecranului';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Frecvență cadre';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p și 60 FPS necesită $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Instanța curentă permite partajarea ecranului până la 720p la 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName are nevoie de acces la microfon pentru a-ți afișa dispozitivele.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName are nevoie de acces la cameră pentru a-ți afișa dispozitivele.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Nu mă mai întreba când îmi ascund camera';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Nu mă mai întreba când îmi ascund partajarea ecranului';

  @override
  String get userSettingsNavNotifications => 'Notificări';

  @override
  String get notificationsGeneralSectionTitle => 'General';

  @override
  String get notificationsEnableNotificationsLabel => 'Activează notificările';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Primești notificări când primești mesaje. S-ar putea să fie nevoie să permiți notificările pentru $productName în setările dispozitivului tău. Pentru controlul notificărilor pe canal/comunitate, deschide setările de notificări din meniul unei comunități.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Activează notificările pe desktop';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Folosește centrul de notificări al sistemului de operare. Pentru control la nivel de canal/comunitate, dă clic dreapta pe o pictogramă de comunitate și deschide setările de notificare.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Activează notificările în browser';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Primești notificări când primești mesaje. S-ar putea să fie nevoie să activezi notificările din setările browserului. Pentru control per canal/comunitate, dă clic dreapta pe o pictogramă de comunitate și deschide setările de notificare.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Timp de expirare notificare push inactivă';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName evită trimiterea de notificări push către dispozitivele tale mobile când ești la calculator. Alege cât timp trebuie să fii inactiv pe desktop înainte de a primi notificări push.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minut';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minute';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Preferințe mențiuni';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Preferință menționare răspuns';

  @override
  String get notificationsMentionNoPreferenceName => 'Fără preferință';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respectă intenția expeditorului, fără avertisment când activează mențiunea @';

  @override
  String get notificationsMentionPreferMentionName => 'Preferință @mențiune';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Răspunsurile implicite te menționează și avertizează expeditorul dacă dezactivează această opțiune';

  @override
  String get notificationsMentionPreferNoMentionName => 'Fără menționări';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Răspunsurile implicite omit menționarea, iar expeditorul este avertizat dacă o activează';

  @override
  String get notificationsTtsSectionTitle => 'Notificări text-în-vorbire';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Activează redarea vocală /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Permite ca /tts să-ți citească mesajul cu voce tare. Dezactivarea setării păstrează aceste comenzi ca text obișnuit.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Ajustează viteza de redare în ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accesibilitate';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Nararea automată a mesajelor';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Convertește conținutul primit în vorbire, indiferent dacă provine de la /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Fiecare canal';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Fiecare mesaj primit va fi citit, indiferent de canalul deschis.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Doar canalul activ';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narează doar canalul pe care îl vizualizezi. Narațiunea te urmărește între canale.';

  @override
  String get notificationsTtsModeNeverName => 'Niciodată automat';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Rămâi silențios, cu excepția cazului în care cineva rulează /tts manual.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Citește toate mesajele cu voce tare';

  @override
  String get notificationsSoundsSectionTitle => 'Sunete';

  @override
  String get notificationsMasterVolumeLabel => 'Volum principal';

  @override
  String get notificationsMasterVolumeDescription =>
      'Setează nivelul pentru fiecare efect sonor. Suprascrierile individuale ale sunetelor ignoră această setare.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Resetați volumul la valoarea implicită';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Dezactivează toate sunetele de notificare';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Setările tale existente pentru sunetul notificărilor vor fi păstrate.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Afișează mai multe efecte sonore';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Afișează mai puține efecte sonore';

  @override
  String get notificationsPreviewSound => 'Previzualizează sunetul';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volum pentru fiecare sunet';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Setează volume personalizate pentru sunete individuale. Sunetele fără o setare personalizată vor urma volumul principal.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Numărul de setări personalizate pentru volumul sunetelor active: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Urmărește master • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Resetați $label la volumul principal';
  }

  @override
  String get notificationsResetAllOverrides => 'Resetați toate excepțiile';

  @override
  String notificationsMuteSound(String label) {
    return 'Dezactivează sunetul pentru $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Activează sunetul pentru $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Notificări pentru mesajele comunității';

  @override
  String get notificationsSoundDirectMessage =>
      'Notificări pentru mesaje directe';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Notificări mesaje canal curent';

  @override
  String get notificationsSoundMute => 'Fără sunet (apel vocal)';

  @override
  String get notificationsSoundUnmute => 'Anulare dezactivare sunet voce';

  @override
  String get notificationsSoundDeaf => 'Dezactivare sunet voce';

  @override
  String get notificationsSoundUndeaf => 'Anulare dezactivare sunet voce';

  @override
  String get notificationsSoundUserJoin => 'Utilizatorul intră pe canal';

  @override
  String get notificationsSoundUserLeave => 'Utilizatorul părăsește canalul';

  @override
  String get notificationsSoundUserMove => 'Utilizatorul a mutat canalul';

  @override
  String get notificationsSoundViewerJoin =>
      'Spectatorul se alătură transmisiunii';

  @override
  String get notificationsSoundViewerLeave =>
      'Spectatorul părăsește transmisiunea';

  @override
  String get notificationsSoundVoiceDisconnect => 'Apel vocal deconectat';

  @override
  String get notificationsSoundIncomingRing => 'Apel primit';

  @override
  String get notificationsSoundCameraOn => 'Cameră activată';

  @override
  String get notificationsSoundCameraOff => 'Cameră oprită';

  @override
  String get notificationsSoundScreenShareStart => 'Pornire partajare ecran';

  @override
  String get notificationsSoundScreenShareStop => 'Oprire partajare ecran';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Nu am putut actualiza timpul de expirare al notificărilor push. Încearcă din nou.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Nu am putut actualiza preferința pentru mențiuni. Încearcă din nou.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notificări blocate';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Nu am putut activa notificările. Permite permisiunea de notificare pentru a continua.';

  @override
  String get userSettingsNavLanguageAndTime => 'Limbă și timp';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Limba interfeței';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Alege limba folosită în aplicație';

  @override
  String get languageAndTimeOpenLanguageSettings =>
      'Deschide setările de limbă';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Format oră';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Alege cum sunt afișate orele în aplicație';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Selectare format oră';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automat';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 ore';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 ore';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Limba aplicației: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Regiune sistem: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Folosește setările de limbă ale sistemului pentru formatul orei';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Nu s-a putut actualiza formatul orei';

  @override
  String get userSettingsNavDefaultApps => 'Aplicații implicite';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Browser web';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Alege ce browser se deschide când apeși pe un link.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Dacă o aplicație este instalată pentru un site, linkurile se vor deschide mai întâi în acea aplicație.';

  @override
  String get defaultAppsWebBrowserInApp => 'Browser în aplicație';

  @override
  String get defaultAppsWebBrowserExternal => 'Browser extern';

  @override
  String get userSettingsNavAdvanced => 'Avansat';

  @override
  String get advancedPerformanceReportingTitle => 'Raportare performanță';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Ajută la îmbunătățirea $productName prin partajarea datelor anonime despre blocări și performanță.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Trimite rapoarte de blocare și performanță';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Toate datele raportate sunt anonime și sunt trimise doar către propriul serviciu de monitorizare al $productName — nu sunt utilizați furnizori terți.';
  }

  @override
  String get advancedSettingsConfigure => 'Configurează';

  @override
  String get advancedSettingsCategoryPrivacy => 'Confidențialitate';

  @override
  String get advancedSettingsCategoryAppearance => 'Aspect';

  @override
  String get advancedSettingsCategoryAccessibility => 'Accesibilitate';

  @override
  String get advancedSettingsCategoryChat => 'Conversație';

  @override
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Vocal';

  @override
  String get advancedSettingsCategoryDeveloper => 'Dezvoltator';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Activează selectarea textului';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Permite selectarea textului în aplicație';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Activează miniaturile pentru navigarea în videoclipuri';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatură sau cadru live în timpul derulării video';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Feedback haptic';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Feedback de vibrații pentru atingeri și acțiuni. Nu se va sincroniza pe alte dispozitive.';

  @override
  String get advancedSettingShowNekoLabel => 'Afișează Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Pisica Neko care îți urmărește cursorul';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Afișează Neko la intrarea de chat';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animație de zoom la pornire';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Micșorează logo-ul la ieșirea din ecranul de pornire';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Sugestii tastatură';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Indicații pentru comenzile rapide de la tastatură în tooltip-uri.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Activează favoritele';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Afișează favoritele în toată aplicația';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Comportamentul la alăturarea la canalul vocal';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmare sau dublu clic pentru a te alătura unui canal vocal.';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Solicită dublu clic pentru a te alătura canalelor vocale';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Confirmă înainte de a te alătura canalelor vocale';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Trimite automat GIF-urile când sunt selectate';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Trimite automat GIF-uri din selector, fără confirmare';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Salvează GIF-urile favorite ca media salvată';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Alege cum sunt stocate GIF-urile favorite cu stea';

  @override
  String get advancedSettingMediaButtonsLabel => 'Butoane media';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Personalizați ce butoane și indicatori apar pe atașamentele și încorporările multimedia';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Încarcă atașamente înainte de a trimite';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Începe încărcarea atașamentelor imediat ce sunt adăugate în câmpul de mesaj';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Elimină parametrii de urmărire din URL-uri';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Elimină automat parametrii de urmărire din URL-urile mesajelor pe care le trimiți';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Am încredere în toate linkurile externe';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Omitere avertisment link extern pentru toate domeniile';

  @override
  String get advancedSettingSearchEnginesLabel => 'Motoare de căutare';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configurează motoarele de căutare utilizate pentru textul selectat';

  @override
  String get advancedSettingTranslatorsLabel => 'Traducători';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configurează furnizorii de traducere utilizați pentru textul selectat';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Căutare imagine inversă';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Furnizori pentru căutarea inversă a imaginilor';

  @override
  String get advancedSettingMessageActionBarLabel => 'Bară de acțiuni mesaje';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Personalizează bara de acțiuni care apare la trecerea cu mouse-ul peste mesaje';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Completare automată expresii';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Alege ce apare când tastezi două puncte în câmpul de mesaj';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Butoane de introducere a mesajului';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Alegeți ce butoane să apară în câmpul de introducere a mesajelor';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Derulează în jos la trimiterea unui mesaj';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Alege cum să se deplaseze conversația după ce trimiți un mesaj';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Omitere confirmare \"Marchează tot ca citit\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Marchează imediat toate canalele necitite din inbox ca fiind citite, fără a cere confirmare';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Ascunde canalele dezactivate în mod implicit';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Ascunde canalele dezactivate din barele laterale ale comunității';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Afișează indicatorul GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Afișează indicatorul de expirare a atașamentelor';

  @override
  String get advancedSettingShowMediaDeleteLabel =>
      'Afișează butonul de ștergere';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Afișează butonul de descărcare';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Afișează butonul de favorite';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Afișează butonul de suprimare a încorporărilor';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Afișează bara de acțiuni a mesajelor';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Afișează doar butonul \"Mai multe\"';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Afișează reacții rapide';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Activează Shift pentru a extinde';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Afișează emoji implicite în completarea automată a expresiilor';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Afișează emojiuri personalizate în completarea automată a expresiilor';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Afișează stickere în completarea automată a expresiilor';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Afișează media salvată în completarea automată a expresiilor';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Afișează butonul GIF-uri';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Afișează butonul media';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Afișează butonul de stickere';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Afișează butonul de emoji';

  @override
  String get advancedSettingShowSendButtonLabel =>
      'Afișează butonul de trimitere';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Afișează alerte pentru dispozitive noi';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Solicită dispozitive audio noi';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Controale volum conexiune';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Afișează glisoare de volum pentru participanți pe dispozitiv în meniurile vocale';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Previzualizare comportament partajare ecran';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Previzualizare, comportament pentru ferestre separate și miniaturi de fluxuri';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Codec partajare ecran';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Codec video pentru partajarea ecranului';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automat (recomandat)';

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
      'Întrerupe previzualizarea partajării ecranului în fundal';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Ascunde miniatura previzualizării streamului meu';

  @override
  String get advancedSettingDeveloperModeLabel => 'Activează modul dezvoltator';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Activează modul dezvoltator';

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
  String get advancedSettingTranslatorGoogle => 'Traducere Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Motor de căutare implicit';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Alege motorul de căutare folosit implicit la căutarea textului selectat.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Motoare de căutare încorporate';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Activează sau dezactivează motoarele de căutare încorporate. Motoarele activate apar în meniul contextual al mesajelor atunci când este selectat text.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Motoare de căutare personalizate';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Adaugă propriile motoare de căutare cu un model URL personalizat. Folosește „$query” ca placeholder pentru textul căutării.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Adaugă motor de căutare';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Activează cel puțin un motor de căutare de mai jos.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Elimină motorul de căutare';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Traducător implicit';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Alege ce traducător este folosit în mod implicit la traducerea textului selectat.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel =>
      'Traducători încorporați';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Activează sau dezactivează traductoarele încorporate. Traductoarele activate apar în meniul contextual al mesajului când este selectat text.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Traducători personalizați';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Adaugă propriile traducătoare cu un model URL personalizat. Folosește „$query” ca placeholder pentru textul de tradus.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Adaugă traducător';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Activează cel puțin un traducător de mai jos.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Elimină traducătorul';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Căutare inversă implicită a imaginii';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Alege serviciul de căutare inversă a imaginilor folosit implicit la căutarea unei imagini.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Căutare inversă a imaginii încorporată';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Activează sau dezactivează furnizorii încorporați de căutare inversă a imaginilor. Furnizorii activați apar în meniul contextual al imaginilor, avatarurilor, bannerelor, stickere-lor și emoji-urilor.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Căutare inversă personalizată a imaginii';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Adaugă propriii furnizori de căutare inversă de imagini cu un model URL personalizat. Folosește \'$url\' ca placeholder pentru URL-ul imaginii.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Adaugă căutare inversă a imaginii';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Activează cel puțin un furnizor de căutare inversă a imaginii de mai jos.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Eliminați căutarea inversă a imaginii';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Adaugă motor de căutare';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Editează motorul de căutare';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Adaugă furnizor de traduceri';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Editează furnizorul de traduceri';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Adaugă motor de căutare inversă a imaginii';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Editează motorul de căutare inversă a imaginii';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nume';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Model URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Motorul meu de căutare';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Traducătorul meu';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Căutarea mea inversă de imagini';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Folosește \'$query\' unde ar trebui inserat textul căutării.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Folosește \'$query\' unde ar trebui inserat textul de tradus.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Folosește \'$url\' unde ar trebui inserat URL-ul imaginii.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Numele este obligatoriu.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Este necesar un model de URL.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Modelul URL trebuie să conțină placeholder-ul „$query”.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Modelul URL trebuie să conțină placeholder-ul „$url”.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Modelul de URL trebuie să fie un URL valid.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Adaugă';

  @override
  String get advancedSettingEditSearchProviderAction => 'Editează';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Elimină';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Ești sigur că vrei să elimini $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Aplicații';

  @override
  String get userSettingsNavAppLogs => 'Jurnale aplicație';

  @override
  String get userSettingsNavDeveloperTools => 'Unelte pentru dezvoltatori';

  @override
  String get userSettingsNavLimitsConfig => 'Config. limite';

  @override
  String get userSettingsNavFeatureFlags => 'Drapele funcționalități';

  @override
  String get userSettingsNavWhatsNew => 'Ce e nou';

  @override
  String get userSettingsJoinFluxerLabs => 'Alătură-te Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Licențe aplicație';

  @override
  String get userSettingsAppLicensesDescription =>
      'Software open-source utilizat de această aplicație. Această aplicație este construită cu Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Nu am putut încărca licențele aplicației.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licențe',
      one: '1 licență',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Deconectare';

  @override
  String get quickSwitcherTabSearch => 'Căutare';

  @override
  String get quickSwitcherTabFriends => 'Prieteni';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Căutați canale, persoane sau comunități';

  @override
  String get quickSwitcherSearchFriends => 'Caută prieteni';

  @override
  String get quickSwitcherNoMatchesFound => 'Niciun rezultat găsit';

  @override
  String get quickSwitcherEmptyHint =>
      'Încearcă un alt nume sau folosește prefixele @ / # / ! / * pentru a filtra rezultatele.';

  @override
  String get quickSwitcherSectionPeople => 'Persoane';

  @override
  String get quickSwitcherSectionGroupMessages => 'Mesaje de grup';

  @override
  String get quickSwitcherSectionTextChannels => 'Canale de chat';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Canale vocale';

  @override
  String get quickSwitcherSectionCommunities => 'Comunități';

  @override
  String get quickSwitcherSectionSettings => 'Setări';

  @override
  String get quickSwitcherHomeLabel => 'Acasă';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Mesaje directe';

  @override
  String get quickSwitcherFavoritesLabel => 'Favorite';

  @override
  String get quickSwitcherUserSettingsLabel => 'Setări utilizator';

  @override
  String get quickSwitcherNotificationsLabel => 'Notificări';

  @override
  String get quickSwitcherBookmarksLabel => 'Mesaje salvate';

  @override
  String get savedMessagesEmptyTitle => 'Fără marcaje';

  @override
  String get savedMessagesEmptyBody =>
      'Marchează mesajele pentru a le salva pentru mai târziu.';

  @override
  String get savedMessagesEndBody => 'Nu mai sunt alte elemente de afișat.';

  @override
  String get savedMessagesRemoveTooltip => 'Elimină din mesaje salvate';

  @override
  String get quickSwitcherMentionsLabel => 'Mențiuni';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Încă nu ai prieteni';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Adaugă un prieten pentru a începe.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Niciun prieten nu corespunde căutării';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Încearcă un alt nume.';

  @override
  String get quickSwitcherSearchAliasUser => 'Utilizator';

  @override
  String get quickSwitcherSearchAliasYou => 'Tu';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Conversații';

  @override
  String get quickSwitcherSearchAliasMessages => 'Mesaje';

  @override
  String get quickSwitcherSearchAliasFav => 'Favorite';

  @override
  String get quickSwitcherSearchAliasStarred => 'Favorite';

  @override
  String get quickSwitcherSearchAliasInbox => 'Mesaje';

  @override
  String get quickSwitcherSearchAliasSaved => 'Salvat';

  @override
  String get uiClose => 'Închide';

  @override
  String get chatJumpToBottom => 'Mergi la ultimul mesaj';

  @override
  String get uiConfirm => 'Confirmă';

  @override
  String get uiLoading => 'Se încarcă';

  @override
  String get uiSearch => 'Căutare';

  @override
  String get uiStartCall => 'Inițiază apelul';

  @override
  String get uiStartVideoCall => 'Începe apel video';

  @override
  String get uiPlay => 'Redă';

  @override
  String get uiPause => 'Pauză';

  @override
  String get uiDownload => 'Descarcă';

  @override
  String get uiMoreActions => 'Mai multe acțiuni';

  @override
  String get uiUnsavedChanges => 'Modificări nesalvate';

  @override
  String get uiReset => 'Resetare';

  @override
  String get uiOpenColorPicker => 'Deschide selectorul de culori';

  @override
  String get uiSelectPlaceholder => 'Selectează';

  @override
  String get uiSearchPlaceholder => 'Căutare';

  @override
  String get uiNoOptionsFound => 'Nu s-au găsit opțiuni';

  @override
  String get uiDismissNotification => 'Închide notificarea';

  @override
  String get uiColorPickerTitle => 'Selector de culori';

  @override
  String get mentionConfirmTitle => 'Menționezi pe toată lumea?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Aceasta va notifica $count membri. Continuați?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Aceasta va notifica $count membri online. Continuare?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Aceasta va notifica $count membri cu rolul $roleName. Continuați?';
  }

  @override
  String get mentionConfirmButton => 'Menționează';

  @override
  String get composerEmojiUnavailable => 'Nu poți folosi acel emoji aici.';

  @override
  String get instanceUrlLabel => 'URL instanță';

  @override
  String get instanceUrlPlaceholder =>
      'Introdu adresa URL a instanței (ex. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Resetează la Fluxer';

  @override
  String get instanceConnect => 'Conectare';

  @override
  String get instanceConnecting => 'Se conectează…';

  @override
  String get instanceConnectFailed => 'Nu s-a putut conecta la instanță';

  @override
  String get recentInstances => 'Instanțe recente';

  @override
  String removeRecentInstance(String domain) {
    return 'Elimină $domain din instanțele recente';
  }

  @override
  String get instanceSheetTitle => 'Conectare la instanță';

  @override
  String get connectToDifferentInstance => 'Conectează-te la o altă instanță';

  @override
  String get changeInstance => 'Schimbă';

  @override
  String get instanceConnectionRequired =>
      'Conectează-te la instanță pentru a te autentifica';

  @override
  String get comingSoon => 'În curând';

  @override
  String get guildNavbarDirectMessages => 'Mesaje directe';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Explore Comunități Descoperibile';

  @override
  String get discoveryExplore => 'Explorează';

  @override
  String get discoveryExplorePublicCommunities => 'Explore comunități publice';

  @override
  String get discoveryListingSubheading =>
      'Vrei să-ți listezi comunitatea aici? Aplică dacă îndeplinești cerințele din setările comunității tale > Descoperire.';

  @override
  String get discoverySearchCommunities => 'Caută comunități';

  @override
  String get discoveryFilterByLanguage => 'Filtrați după limbă';

  @override
  String get discoveryAllLanguages => 'Toate limbile';

  @override
  String get discoveryAllCategories => 'Toate';

  @override
  String get discoveryCategoryGaming => 'Jocuri';

  @override
  String get discoveryCategoryMusic => 'Muzică';

  @override
  String get discoveryCategoryEntertainment => 'Divertisment';

  @override
  String get discoveryCategoryEducation => 'Educație';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Știință și tehnologie';

  @override
  String get discoveryCategoryContentCreator => 'Creator de conținut';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime și Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filme și TV';

  @override
  String get discoveryCategoryOther => 'Altele';

  @override
  String get discoveryNoCommunitiesMatch =>
      'Nicio comunitate nu se potrivește.';

  @override
  String get discoveryJoinCommunity => 'Alătură-te comunității';

  @override
  String get discoveryJoined => 'Alăturat';

  @override
  String discoveryOnlineCount(String count) {
    return '$count online';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString membri',
      one: '1 membru',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Fără descriere.';

  @override
  String get discoveryCommunities => 'Comunități';

  @override
  String get discoveryApps => 'Aplicații';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Nu s-a putut alătura acestei comunități';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Ceva nu a mers bine. Te rugăm să încerci din nou mai târziu.';

  @override
  String get discoveryJoinErrorFullTitle => 'Această comunitate este plină';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Această comunitate a atins limita de membri, așa că nu te poți alătura acum.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Ați atins limita de comunități';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Ești în numărul maxim de comunități. Părăsește una și încearcă din nou.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Nu te poți alătura acestei comunități';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Ai fost interzis din această comunitate.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Această comunitate nu mai este disponibilă';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Este posibil să fi părăsit descoperirea sau să fi dezactivat înscrierile noi. Reîmprospătează pagina și nu o vei mai vedea.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Te miști prea repede';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Te rugăm să aștepți un moment și să încerci din nou.';

  @override
  String get guildNavbarAddCommunity => 'Adaugă o comunitate';

  @override
  String get guildNavbarHelp => 'Ajutor';

  @override
  String get scrollIndicatorNew => 'NOU';

  @override
  String get scrollIndicatorNewMessage => 'MESAJ NOU';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Restrângeți $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'selectat';

  @override
  String get guildNavbarGuildUnread => 'necitite';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mențiuni',
      one: '1 mențiune',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'dezactivat';

  @override
  String get authShowPassword => 'Afișează parola';

  @override
  String get authHidePassword => 'Ascunde parola';

  @override
  String get chatLoadingMessages => 'Se încarcă mesajele';

  @override
  String get friendsMessageFriend => 'Trimite mesaj';

  @override
  String get friendsFriendActions => 'Acțiuni prieten';

  @override
  String get friendsAcceptRequest => 'Acceptă cererea de prietenie';

  @override
  String get friendsDeclineRequest => 'Respinge cererea de prietenie';

  @override
  String get friendsCancelRequest => 'Anulează cererea de prietenie';

  @override
  String get friendsOpenInbox => 'Mesaje';

  @override
  String get profileRemoveFriend => 'Elimină prietenul';

  @override
  String get profileUnblockUser => 'Deblochează utilizatorul';

  @override
  String get profileAcceptFriendRequest => 'Acceptă cererea de prietenie';

  @override
  String get profileCancelFriendRequest => 'Anulează cererea de prietenie';

  @override
  String get profileSendFriendRequest => 'Adaugă prieten';

  @override
  String get accountOverflowMenu => 'Opțiuni cont';

  @override
  String get navHome => 'Acasă';

  @override
  String get navNotifications => 'Notificări';

  @override
  String get navYou => 'Tu';

  @override
  String get guildFolderSettingsTitle => 'Setări dosar';

  @override
  String get guildFolderNameLabel => 'Numele dosarului';

  @override
  String get guildFolderColorLabel => 'Culoare dosar';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Afișează pictograma când este restrâns';

  @override
  String get guildFolderIconLabel => 'Pictogramă dosar';

  @override
  String get guildFolderDelete => 'Șterge dosarul';

  @override
  String get guildFolderIconFolder => 'Dosar';

  @override
  String get guildFolderIconStar => 'Cu stea';

  @override
  String get guildFolderIconHeart => 'Inimă';

  @override
  String get guildFolderIconBookmark => 'Marchează';

  @override
  String get guildFolderIconGameController => 'Controler de joc';

  @override
  String get guildFolderIconShield => 'Scut';

  @override
  String get guildFolderIconMusicNote => 'Notă muzicală';

  @override
  String get guildFolderMarkAsRead => 'Marchează dosarul ca citit';

  @override
  String get guildBulkMuteCommunities =>
      'Dezactivează notificările comunităților';

  @override
  String get guildBulkUnmuteCommunities => 'Activează sunetul comunităților';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Setări notificări comunitate';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Setări de confidențialitate pentru comunitate';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Permite @everyone și @here';

  @override
  String get guildBulkAllowRoleMentions => 'Permite menționarea rolurilor';

  @override
  String get guildBulkEnableMobilePush =>
      'Activează notificările push pe mobil';

  @override
  String get guildBulkDisableMobilePush =>
      'Dezactivează notificările push pe mobil';

  @override
  String get guildBulkAllowDirectMessages => 'Permite mesaje directe';

  @override
  String get guildBulkBlockDirectMessages => 'Blochează mesajele directe';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Permite mesaje directe de la boți';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Blochează mesajele directe de la boți';

  @override
  String get guildNavbarGroupDm => 'Grup DM';

  @override
  String get guildNavbarCreateChannel => 'Creează canal';

  @override
  String get guildNavbarChannelType => 'Tip canal';

  @override
  String get guildNavbarTextChannel => 'Canal de text';

  @override
  String get guildNavbarTextChannelDescription =>
      'Trimite mesaje, imagini, GIF-uri și emoji';

  @override
  String get guildNavbarVoiceChannel => 'Canal vocal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Petreceți timp împreună cu voce, video și partajare de ecran';

  @override
  String get guildNavbarLinkChannel => 'Canal legat';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Acces rapid la un site web sau o resursă externă';

  @override
  String get guildNavbarNameLabel => 'Nume';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Selectare tip canal';

  @override
  String get guildNavbarCreateCategory => 'Creează categorie';

  @override
  String get guildNavbarNewCategoryHint => 'Categorie nouă';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Invită prieteni în $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Destinatarii vor fi direcționați către #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Caută prieteni';

  @override
  String get guildNavbarNoFriendsYet => 'Încă nu ai prieteni';

  @override
  String get guildNavbarNoResults => 'Niciun rezultat';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Sau trimite un link de invitație unui prieten:';

  @override
  String get guildNavbarInviteLink => 'Link de invitație';

  @override
  String get guildNavbarCopy => 'Copiază';

  @override
  String get guildNavbarCopied => 'Copiat!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Linkul tău de invitație expiră în 7 zile.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Acest link de invitație nu expiră niciodată.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Linkul tău de invitație expiră în $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Editează linkul de invitație';

  @override
  String get guildNavbarInviteLinkSettings => 'Setări link de invitație';

  @override
  String get guildNavbarExpireAfter => 'Expiră după';

  @override
  String get guildNavbarMaxUses => 'Număr maxim de utilizări';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Acordă apartenență temporară';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Membrii vor fi eliminați când devin offline, cu excepția cazului în care li se atribuie un rol';

  @override
  String get guildNavbarCreateNewLink => 'Creează un link nou';

  @override
  String get guildNavbarSent => 'Trimis';

  @override
  String get guildNavbarInvite => 'Invită';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Părăsește comunitatea';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Ești sigur că vrei să părăsești această comunitate? Nu vei mai putea vedea niciun mesaj.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Părăsește comunitatea';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Ștergi mesajele tale din această comunitate?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Șterge permanent toate mesajele pe care le-ai trimis aici, în toate canalele. Nu poate fi anulat.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Șterge mesajele mele';

  @override
  String get guildNavbarDeletedYourMessages => 'Ai șters mesajele tale';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Nu s-au putut șterge mesajele tale';

  @override
  String get guildNavbarRemoveOverride => 'Elimină suprascrierea';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Dezactivat până la $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Accesibil doar personalului $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Invitațiile sunt momentan întrerupte în această comunitate';

  @override
  String get guildNavbarDurationNever => 'niciodată';

  @override
  String get guildNavbarDuration30Minutes => '30 de minute';

  @override
  String get guildNavbarDuration1Hour => '1 oră';

  @override
  String get guildNavbarDuration6Hours => '6 ore';

  @override
  String get guildNavbarDuration12Hours => '12 ore';

  @override
  String get guildNavbarDuration1Day => '1 zi';

  @override
  String get guildNavbarDuration7Days => '7 zile';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count secunde';
  }

  @override
  String get guildNavbarNever => 'Niciodată';

  @override
  String get guildNavbarNoLimit => 'Fără limită';

  @override
  String get guildNavbarOneUse => '1 utilizare';

  @override
  String guildNavbarUses(int count) {
    return '$count utilizări';
  }

  @override
  String get guildMenuMarkAsRead => 'Marchează ca citite';

  @override
  String get guildPeekMoreOptions => 'Mai multe opțiuni';

  @override
  String get guildMenuInviteMembers => 'Invită membri';

  @override
  String get guildMenuCommunitySettings => 'Setări comunitate';

  @override
  String get guildMenuEditCommunityProfile => 'Editează profilul comunității';

  @override
  String get guildMenuUnmuteCommunity => 'Reactivează sunetul comunității';

  @override
  String get guildMenuMuteCommunity => 'Dezactivează sunetul comunității';

  @override
  String get guildMenuHideMutedChannels => 'Ascunde canalele dezactivate';

  @override
  String get guildMenuReportCommunity => 'Raportează comunitatea';

  @override
  String get guildMenuDebugCommunity => 'Depanează comunitatea';

  @override
  String get guildMenuCopyCommunityId => 'Copiază ID-ul comunității';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Până la $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'General';

  @override
  String get guildMenuSettingsRoles => 'Roluri și permisiuni';

  @override
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Autocolante';

  @override
  String get guildMenuSettingsSafetyModeration => 'Siguranță și moderare';

  @override
  String get guildMenuSettingsActivityLog => 'Jurnal de activitate';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook-uri';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'URL de invitație personalizată';

  @override
  String get guildMenuSettingsDiscovery => 'Descoperire';

  @override
  String get guildMenuSettingsMembers => 'Membri';

  @override
  String get guildMenuSettingsInviteLinks => 'Invitații';

  @override
  String get guildMenuSettingsBans => 'Interdicții';

  @override
  String get guildMenuSettingsChannels => 'Canale';

  @override
  String get guildSettingsNoPermission =>
      'Nu ai permisiunea de a vizualiza această filă de setări.';

  @override
  String get guildSettingsOverviewIconTitle => 'Pictogramă';

  @override
  String get guildSettingsUploadImage => 'Încarcă imagine';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Încarcă un banner pentru serverul tău.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nume';

  @override
  String get guildSettingsOverviewNameHint => 'Comunitatea mea minunată';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistici';

  @override
  String get guildSettingsOverviewMembers => 'Membri';

  @override
  String get guildSettingsOverviewOnline => 'Conectat';

  @override
  String get guildSettingsRolesDescription =>
      'Folosește roluri pentru a grupa membrii și a le atribui permisiuni.';

  @override
  String get guildSettingsCreateRole => 'Creează rol';

  @override
  String get guildSettingsRolesListTitle => 'Roluri';

  @override
  String get guildSettingsRolesNewRole => 'Rol nou';

  @override
  String get guildSettingsRolesDeleteRole => 'Șterge rolul';

  @override
  String get guildSettingsRolesBackToRoles => 'Înapoi la roluri';

  @override
  String get guildSettingsBackToSettings => 'Înapoi la setări';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Editează \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configurează setările și permisiunile rolului';

  @override
  String get guildSettingsRolesDisplaySection => 'Afișare';

  @override
  String get guildSettingsRolesRoleName => 'Nume rol';

  @override
  String get guildSettingsRolesRoleColor => 'Culoarea rolului';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Introduceți o culoare (hex, rgb(), hsl() sau nume) sau folosiți selectorul.';

  @override
  String get guildSettingsRolesShowSeparately => 'Afișează acest rol separat';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Listează membrii cu acest rol în propria secțiune din lista de membri.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Permite menționări pentru acest rol';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Membrii cu permisiunea „$permission” pot menționa întotdeauna roluri, indiferent de această setare.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Folosește acest buton pentru a șterge rapid toate permisiunile.';

  @override
  String get guildSettingsRolesClearPermissions => 'Șterge permisiunile';

  @override
  String get guildSettingsRolesPermissionsSection => 'Permisiuni';

  @override
  String get guildSettingsRolesSearchPermissions => 'Căutați permisiuni';

  @override
  String get guildSettingsRolesDenseLayout => 'Aspect compact';

  @override
  String get guildSettingsRolesComfyLayout => 'Aspect confortabil';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Comută la aspectul compact';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Treci la aspectul confortabil';

  @override
  String get guildSettingsRolesSingleColumn => 'O singură coloană';

  @override
  String get guildSettingsRolesTwoColumns => 'Două coloane';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Treci la o singură coloană';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Treci la două coloane';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Nu s-au găsit permisiuni';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Ordine personalizată de afișare';

  @override
  String get guildSettingsRolesHoistOrder => 'Ordine de afișare';

  @override
  String get guildSettingsRolesResetHoistOrder =>
      'Resetare la valorile implicite';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Trage rolurile pentru a personaliza ordinea în care apar în lista de membri.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Nu există roluri afișate separat. Activează \"Afișează acest rol separat\" pentru un rol ca să-l vezi aici.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Nu poți edita acest rol, deoarece este rolul tău cel mai înalt sau este deasupra ta';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Ai nevoie de permisiunea „$permission” pentru a edita aceste permisiuni';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Nu poți edita un rol egal sau superior celui mai înalt rol al tău';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Nu poți acorda o permisiune pe care nu o ai';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Nu poți elimina această permisiune, deoarece te-ar elimina și pe tine';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Roluri actualizate cu succes';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rol creat cu succes';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rol șters cu succes';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Ordinea de afișare a fost resetată la cea implicită';

  @override
  String get guildSettingsRolesNameRequiredTitle =>
      'Numele rolului este obligatoriu';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Dă un nume rolului înainte de a salva.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Rolul nu a putut fi creat';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Rolurile nu au putut fi actualizate';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Rolul nu a putut fi șters';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '„$name” nu a putut fi șters. Încearcă din nou.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Nu s-a putut reseta ordinea de afișare';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Încearcă din nou mai târziu.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Ești sigur că vrei să ștergi rolul $name? Membrii care au acest rol nu îl vor mai avea.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Întreaga comunitate';

  @override
  String get permissionCategoryMessagesMedia => 'Mesaje și media';

  @override
  String get permissionCategoryModeration => 'Moderare';

  @override
  String get permissionCategoryChannelAccess => 'Acces la canal';

  @override
  String get permissionCategoryChannelManagement => 'Gestionare canale';

  @override
  String get permissionCategoryAudioVideo => 'Audio și video';

  @override
  String get permissionUnknown => 'Permisiune necunoscută';

  @override
  String get permissionAdministrator => 'Administrator';

  @override
  String get permissionAdministratorDescription =>
      'Acordă toate permisiunile și ocolește restricțiile canalului. Foarte sensibil.';

  @override
  String get permissionViewActivityLog => 'Vizualizați jurnalul de activitate';

  @override
  String get permissionViewActivityLogDescription =>
      'Citește jurnalul de activitate al comunității, cu modificări și acțiuni de moderare.';

  @override
  String get permissionManageCommunity => 'Gestionează comunitatea';

  @override
  String get permissionManageCommunityDescription =>
      'Editează setările globale, cum ar fi numele, descrierea și pictograma.';

  @override
  String get permissionManageRoles => 'Gestionare roluri';

  @override
  String get permissionManageRolesDescription =>
      'Creează, editează sau șterge roluri sub rolul tău cel mai înalt. Permite, de asemenea, editarea suprascrierilor permisiunilor canalului.';

  @override
  String get permissionManageChannels => 'Gestionează canalele';

  @override
  String get permissionManageChannel => 'Gestionează canalul';

  @override
  String get permissionManageChannelDescription =>
      'Redenumește și editează setările acestui canal.';

  @override
  String get permissionManagePermissions => 'Gestionează permisiunile';

  @override
  String get permissionManagePermissionsDescription =>
      'Editează suprascrierile pentru roluri și membri în acest canal.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Creează, editează sau șterge webhook-uri pentru acest canal.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Vezi lista de membri a acestui canal.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Gestionează link-urile de invitație pentru acest canal.';

  @override
  String get permissionOverwriteDeny => 'Refuză';

  @override
  String get permissionOverwriteInherit => 'Neutru (moștenit)';

  @override
  String get permissionOverwriteAllow => 'Permite';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Folosește aceste butoane pentru a seta rapid toate permisiunile.';

  @override
  String get permissionManageChannelsDescription =>
      'Creați, editați sau ștergeți canale și categorii.';

  @override
  String get permissionKickMembers => 'Elimină membri';

  @override
  String get permissionBanMembers => 'Banare membri';

  @override
  String get permissionCreateInviteLinks => 'Creează linkuri de invitație';

  @override
  String get permissionChangeOwnNickname => 'Schimbă-ți propriul pseudonim';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Actualizează-ți propria poreclă.';

  @override
  String get permissionManageNicknames => 'Gestionează poreclele';

  @override
  String get permissionManageNicknamesDescription =>
      'Schimbă poreclele altor membri.';

  @override
  String get permissionCreateEmojiStickers => 'Creează emoji și stickere';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Încarcă emoji și stickere noi și gestionează-ți propriile creații.';

  @override
  String get permissionManageEmojiStickers => 'Gestionează emoji și stickere';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Editează sau șterge emoji și stickere create de alți membri.';

  @override
  String get permissionManageWebhooks => 'Gestionează webhook-uri';

  @override
  String get permissionManageWebhooksDescription =>
      'Creați, editați sau ștergeți webhook-uri.';

  @override
  String get permissionSendMessages => 'Trimite mesaje';

  @override
  String get permissionSendTtsMessages => 'Trimite mesaje TTS';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Trimite mesaje text-to-speech.';

  @override
  String get permissionManageMessages => 'Gestionează mesajele';

  @override
  String get permissionManageMessagesDescription =>
      'Șterge mesajele altor membri. Fixarea este controlată separat.';

  @override
  String get permissionPinMessages => 'Fixare mesaje';

  @override
  String get permissionEmbedLinks => 'Încorporare linkuri';

  @override
  String get permissionAttachFiles => 'Atașează fișiere';

  @override
  String get permissionMentionEveryone => 'Folosește @everyone/@here și @rol';

  @override
  String get permissionMentionEveryoneDescription =>
      'Menționează pe toată lumea sau orice rol (chiar dacă rolul nu este setat ca menționabil).';

  @override
  String get permissionUseExternalEmoji => 'Folosește emoji externe';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Folosește emoji din alte comunități.';

  @override
  String get permissionUseExternalStickers => 'Folosește stickere externe';

  @override
  String get permissionAddReactions => 'Adaugă reacții';

  @override
  String get permissionAddReactionsDescription =>
      'Adaugă reacții noi la mesaje.';

  @override
  String get permissionBypassSlowmode => 'Ocolire mod lent';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorați limitele de frecvență a mesajelor pe canal.';

  @override
  String get permissionTimeOutMembers => 'Restricționează temporar membrii';

  @override
  String get permissionTimeOutMembersDescription =>
      'Împiedică membrii să trimită mesaje, să reacționeze și să participe la conversații vocale pentru o anumită perioadă.';

  @override
  String get permissionViewChannel => 'Vizualizare canal';

  @override
  String get permissionViewChannelMembers => 'Vizualizează membrii canalului';

  @override
  String get permissionViewChannelMembersDescription =>
      'Vezi lista de membri pentru canalele din această comunitate.';

  @override
  String get permissionConnect => 'Conectare';

  @override
  String get permissionSpeak => 'Vorbește';

  @override
  String get permissionStreamVideo => 'Transmite video';

  @override
  String get permissionUseVoiceActivity => 'Utilizează activitatea vocală';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Fără această permisiune, este necesară funcția \"apăsați pentru a vorbi\".';

  @override
  String get permissionPrioritySpeaker => 'Vorbitor prioritar';

  @override
  String get permissionMuteMembers => 'Dezactivează sunetul membrilor';

  @override
  String get permissionDeafenMembers => 'Dezactivează sunetul membrilor';

  @override
  String get permissionMoveMembers => 'Mută membri';

  @override
  String get permissionMoveMembersDescription =>
      'Mută membrii între canalele la care au acces.';

  @override
  String get permissionSetVoiceRegion => 'Setează regiunea vocală';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount emoji statice, $animatedCount emoji animate folosite';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Încă nu există emoji personalizate.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count stickere încărcate';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Încă nu există stickere personalizate.';

  @override
  String get guildSettingsModerationVerificationTitle =>
      'Verificarea membrilor';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Alege ce trebuie să aibă membrii înainte de a putea posta sau trimite mesaje private membrilor comunității.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Membrii cu roluri pot ocoli aceste verificări. Pentru spațiile publice, recomandăm activarea verificării.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Comunitățile listate în Discovery necesită cel puțin un e-mail verificat. Niciuna nu poate fi selectată cât timp Discovery este activat.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Conținut matur și avertismente de conținut';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configurează etichetarea conținutului matur și avertismentele opționale de conținut pentru membri.';

  @override
  String get guildSettingsModerationMatureToggle => 'Conținut explicit';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marchează această comunitate ca având conținut pentru adulți.';

  @override
  String get guildSettingsVerificationNone => 'Niciunul';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nu este necesară verificarea.';

  @override
  String get guildSettingsVerificationLow => 'Scăzut';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Necesită o adresă de e-mail verificată.';

  @override
  String get guildSettingsVerificationMedium => 'Mediu';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Necesită o adresă de e-mail verificată și un cont vechi de cel puțin 5 minute.';

  @override
  String get guildSettingsVerificationHigh => 'Ridicat';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Necesită totul la nivel mediu, plus să fii membru al comunității de cel puțin 10 minute.';

  @override
  String get guildSettingsVerificationHighest => 'Foarte ridicat';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Necesită un număr de telefon verificat.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Urmărește acțiunile moderatorilor în comunitate.';

  @override
  String get guildSettingsAuditLogEmpty => 'Încă nu există jurnale';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Acțiunile de moderare și modificările comunității vor apărea aici.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Toți utilizatorii';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Toate acțiunile';

  @override
  String get guildSettingsAuditLogNoReason =>
      'Nu a fost furnizat niciun motiv.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Utilizator necunoscut';

  @override
  String get guildSettingsAuditLogLoadError =>
      'A apărut o eroare la încărcarea jurnalului de activitate.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Nu se pot încărca jurnalele de activitate';

  @override
  String get guildSettingsAuditLogReason => 'Motiv';

  @override
  String get guildSettingsAuditLogSomeone => 'cineva';

  @override
  String get guildSettingsAuditLogSomething => 'ceva';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'entitate necunoscută';

  @override
  String get guildSettingsAuditLogNothing => 'nimic';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Țintă necunoscută';

  @override
  String get auditLogActionGuildUpdate => 'Comunitate actualizată';

  @override
  String get auditLogActionChannelCreate => 'Canal creat';

  @override
  String get auditLogActionChannelUpdate => 'Canal actualizat';

  @override
  String get auditLogActionChannelDelete => 'Canal șters';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Suprascriere canal adăugată';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Permisiunile canalului au fost actualizate';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Suprascrierea canalului a fost eliminată';

  @override
  String get auditLogActionMemberKick => 'Membru eliminat';

  @override
  String get auditLogActionMemberPrune => 'Membri eliminați';

  @override
  String get auditLogActionMemberBanAdd => 'Membru blocat';

  @override
  String get auditLogActionMemberBanRemove => 'Membru deblocat';

  @override
  String get auditLogActionMemberUpdate => 'Membru actualizat';

  @override
  String get auditLogActionMemberRoleUpdate =>
      'Rolurile membrilor au fost actualizate';

  @override
  String get auditLogActionMemberMove => 'Membru mutat';

  @override
  String get auditLogActionMemberDisconnect => 'Membru deconectat';

  @override
  String get auditLogActionBotAdd => 'Bot adăugat';

  @override
  String get auditLogActionRoleCreate => 'Rol creat';

  @override
  String get auditLogActionRoleUpdate => 'Rol actualizat';

  @override
  String get auditLogActionRoleDelete => 'Rol șters';

  @override
  String get auditLogActionInviteCreate => 'Invitație creată';

  @override
  String get auditLogActionInviteUpdate => 'Invitație actualizată';

  @override
  String get auditLogActionInviteDelete => 'Invitație ștearsă';

  @override
  String get auditLogActionWebhookCreate => 'Webhook creat';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook actualizat';

  @override
  String get auditLogActionWebhookDelete => 'Webhook șters';

  @override
  String get auditLogActionEmojiCreate => 'Emoji creat';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji actualizat';

  @override
  String get auditLogActionEmojiDelete => 'Emoji șters';

  @override
  String get auditLogActionStickerCreate => 'Sticker creat';

  @override
  String get auditLogActionStickerUpdate => 'Autocolant actualizat';

  @override
  String get auditLogActionStickerDelete => 'Sticker șters';

  @override
  String get auditLogActionMessageDelete => 'Mesaj șters';

  @override
  String get auditLogActionMessageBulkDelete => 'Mesaje șterse';

  @override
  String get auditLogActionMessagePin => 'Mesaj fixat';

  @override
  String get auditLogActionMessageUnpin => 'Mesaj desprins';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor a actualizat setările comunității.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor a creat canalul $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor a actualizat canalul $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor a șters canalul $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor a adăugat permisiuni pentru canalul $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a adăugat permisiuni pentru canal pentru $target în $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor a actualizat permisiunile canalului pentru $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a actualizat permisiunile canalului pentru $target în $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor a eliminat permisiunile canalului pentru $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a eliminat permisiunile canalului pentru $target în $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor a eliminat $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor a banat $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor a deblocat $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor a actualizat $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor a actualizat rolurile pentru $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor a eliminat membrii inactivi.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor a eliminat membrii inactivi de peste $days zile.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor a mutat $target într-un alt canal vocal.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a mutat $target în $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor a deconectat $target de la voce.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor a adăugat botul $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor a creat rolul $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor a actualizat rolul $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor a șters rolul $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor a creat invitația $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a creat invitația $target pentru $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor a actualizat invitația $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a actualizat invitația $target pentru $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor a șters invitația $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a șters invitația $target pentru $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor a creat webhook-ul $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor a actualizat webhook-ul $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor a șters webhook-ul $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor a adăugat emoji-ul $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor a actualizat emoji-ul $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor a șters emoji-ul $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor a adăugat stickerul $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor a actualizat pachetul de stickere $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor a șters stickerul $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor a șters un mesaj.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor a șters un mesaj în $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor a șters mai multe mesaje.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor a șters $count mesaje.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor a șters mai multe mesaje din $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor a șters $count mesaje din $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor a afișat o postare.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor a afișat un mesaj în $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor a demontat un mesaj.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor a demontat un mesaj în $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor a efectuat o acțiune de audit asupra lui $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Ați actualizat $field de la $oldValue la $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Set $field la $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Ați șters $field (era $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Ați actualizat $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Am redenumit comunitatea în $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'A actualizat pictograma comunității.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'A redenumit canalul în $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'A șters subiectul.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Am actualizat subiectul la $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Conținut matur activat.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Conținut matur dezactivat.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'A set porecla la $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'A eliminat porecla $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Ați dezactivat sunetul membrului.';

  @override
  String get auditLogChangeUnmutedMember => 'A dezactivat sunetul membrului.';

  @override
  String get auditLogChangeDeafenedMember =>
      'Ați dezactivat sunetul membrului.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'A dezactivat sunetul membrului.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'A adăugat $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'A eliminat $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Canal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Mesaj: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Invitat de $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Au șters # mesaje.',
      one: 'A șters # mesaj.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Au fost eliminați # membri.',
      one: 'A eliminat # membru.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Această invitație nu expiră niciodată.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Acordă calitatea de membru temporar.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Acordă calitatea de membru permanent.';

  @override
  String get guildSettingsLoadMore => 'Încarcă mai multe';

  @override
  String get guildSettingsLoadingMore => 'Se încarcă...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Vezi și gestionează fiecare webhook configurat în comunitatea ta.';

  @override
  String get guildSettingsWebhooksEmpty => 'Niciun webhook';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Comunitatea nu are încă nicio integrare webhook. Accesează $channelSettingsPath pentru a crea una.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Ai nevoie de permisiunea „$permission” pentru a vizualiza și edita webhook-urile acestei comunități.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Nu s-au putut încărca webhook-urile';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'A apărut o eroare la încărcarea webhook-urilor. Încearcă din nou.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhookuri actualizate';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Nu s-au putut actualiza webhook-urile';

  @override
  String get guildSettingsUnknownChannel => 'Canal necunoscut';

  @override
  String get guildSettingsCopyUrl => 'Copiază URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copiat în clipboard';

  @override
  String get guildSettingsDeleteWebhook => 'Șterge webhook-ul';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Setează un link de invitație personalizat pentru serverul tău.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Salvează';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Utilizare';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count utilizări';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Listează-ți comunitatea în Descoperire, pentru ca alții să o poată găsi și să se alăture.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Nu sunt suficienți membri';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Comunitatea ta are nevoie de cel puțin $count membri înainte de a putea fi listată în Descoperire.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Stare:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'În așteptare';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Aprobat';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Respins';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Eliminat';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Motiv: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Comunitatea ta este listată în Descoperire. Poți actualiza detaliile listării mai jos sau o poți retrage pentru a o elimina.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Aplicația ta este în curs de examinare. Poți să actualizezi în continuare detaliile anunțului sau să retragi aplicația.';

  @override
  String get guildSettingsDiscoveryCategory => 'Categorie';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Alege categoria care descrie cel mai bine comunitatea ta. O poți schimba oricând.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Limba principală';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Limba vorbită de majoritatea membrilor comunității tale. Folosită pentru a filtra rezultatele Descoperire.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Descriere';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Descrie despre ce este comunitatea ta';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Este necesară o descriere.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Descrierea trebuie să aibă cel puțin $minLength caractere.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Descrierea nu poate depăși $maxLength de caractere.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Etichete personalizate';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Până la $maxTags etichete ajută oamenii să-ți găsească comunitatea. Ele apar în căutarea din Descoperire.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Adaugă o etichetă și apasă Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Adaugă';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Elimină eticheta $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Eticheta nu a putut fi adăugată';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Etichetele trebuie să aibă între 2 și $maxLength caractere și să fie alfanumerice.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Poți adăuga maximum $maxTags etichete.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Aplică';

  @override
  String get guildSettingsDiscoverySave => 'Salvează';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Retragere';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Cerere de descoperire trimisă';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Listarea Discovery a fost actualizată';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Cererea de descoperire a fost retrasă';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Nu s-a putut retrage cererea';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Încearcă din nou mai târziu.';

  @override
  String get guildSettingsMembersDescription =>
      'Caută și gestionează membrii serverului.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Căutați după nume de utilizator sau ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count membri';
  }

  @override
  String get guildMembersRecentTitle => 'Membri recenți';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Se afișează $displayedCount din $totalCount membri în total';
  }

  @override
  String get guildMembersSort => 'Sortare';

  @override
  String get guildSettingsMembersSortNewest => 'Cele mai noi primele';

  @override
  String get guildMembersSortOldest => 'Cele mai vechi primele';

  @override
  String get guildMembersColumnName => 'Nume';

  @override
  String get guildMembersColumnMemberSince => 'Membru din';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'S-a alăturat pe $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Metodă de alăturare';

  @override
  String get guildMembersColumnRoles => 'Roluri';

  @override
  String get guildMembersColumnActions => 'Acțiuni';

  @override
  String get guildMembersFilterMemberSince => 'Filtrează după membru din';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrează după data creării contului';

  @override
  String get guildMembersFilterJoinMethod =>
      'Filtrează după metoda de înscriere';

  @override
  String get guildMembersFilterRoles => 'Filtrează după roluri';

  @override
  String get guildMembersFilterAll => 'Toate';

  @override
  String get guildMembersFilterPast1Hour => 'Ultima oră';

  @override
  String get guildMembersFilterPast24Hours => 'Ultimele 24 de ore';

  @override
  String get guildMembersFilterPast7Days => 'Ultimele 7 zile';

  @override
  String get guildMembersFilterPast2Weeks => 'Ultimele 2 săptămâni';

  @override
  String get guildMembersFilterPast3Weeks => 'Ultimele 3 săptămâni';

  @override
  String get guildMembersFilterPast4Weeks => 'Ultimele 4 săptămâni';

  @override
  String get guildMembersFilterPast3Months => 'Ultimele 3 luni';

  @override
  String get guildMembersFilterCustomRange => 'Interval personalizat...';

  @override
  String get guildMembersDateRangeTitle => 'Interval de date personalizat';

  @override
  String get guildMembersDateAfter => 'După data de';

  @override
  String get guildMembersDateBefore => 'Înainte de data';

  @override
  String get guildMembersClearAll => 'Șterge tot';

  @override
  String get guildMembersRowsPerPage => 'Rânduri pe pagină';

  @override
  String get guildMembersEmptySearch => 'Nimeni nu corespunde căutării.';

  @override
  String get guildMembersLoadError =>
      'A apărut o eroare la încărcarea membrilor. Încearcă din nou mai târziu.';

  @override
  String get guildMembersIndexing => 'Se indexează membrii…';

  @override
  String get guildMembersGoToPage => 'Mergi la pagină';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Mergi la pagina $page';
  }

  @override
  String get guildMembersJumpToPage => 'Salt la pagină';

  @override
  String get guildMembersJoinSourceCreator => 'Creatorul comunității';

  @override
  String get guildMembersJoinSourceInvite => 'Invită';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Invitație ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Invitat de $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL personalizat';

  @override
  String get guildMembersJoinSourceBotInvite => 'Invitare bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Administrator platformă';

  @override
  String get guildMembersJoinSourceDiscovery => 'Descoperire';

  @override
  String get guildMembersJoinMethodUnknown => 'Necunoscut';

  @override
  String get guildMembersCommunityOwner => 'Proprietar comunitate';

  @override
  String get guildMembersViewAllRoles => 'Vezi toate rolurile';

  @override
  String get guildMembersJoinedJustNow => 'Chiar acum';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum # minute',
      one: 'acum 1 minut',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Acum $count ore',
      one: 'Acum 1 oră',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'acum # zile',
      one: 'acum 1 zi',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Membri';

  @override
  String get guildMembersChannelListSelected => 'Membri, selectați';

  @override
  String get guildSettingsInvitesTitle => 'Invitații';

  @override
  String get guildSettingsInvitesDescription =>
      'Vezi toate invitațiile pentru această comunitate. Pentru a crea o invitație nouă, accesează un canal și folosește butonul de invitare.';

  @override
  String get guildSettingsInvitesEmpty => 'Nu există linkuri de invitație';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Această comunitate nu are încă linkuri de invitație. Accesează un canal și creează o invitație pentru a invita persoane.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Nu s-au putut încărca invitațiile';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'A apărut o eroare la încărcarea invitațiilor. Încearcă din nou.';

  @override
  String get guildSettingsInvitesTryAgain => 'Încearcă din nou';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Afișează data creării în loc de data expirării';

  @override
  String get guildSettingsInvitesPauseInvites => 'Întrerupe invitațiile';

  @override
  String get guildSettingsInvitesEnableInvites => 'Activează invitațiile';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Întrerupe invitațiile pentru această comunitate';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Activează invitațiile pentru această comunitate';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pauzezi invitațiile? Utilizatorii noi nu se vor putea alătura prin linkuri de invitație până nu le reactivezi. Membrii existenți nu vor fi afectați.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Activezi invitațiile? Utilizatorii se vor putea alătura din nou acestei comunități prin linkuri de invitație.';

  @override
  String get guildSettingsInvitesPause => 'Pauză';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Invitațiile sunt întrerupte pentru această comunitate.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Invitațiile sunt întrerupte deoarece $productName a detectat un potențial raid. Utilizatorii noi nu se pot alătura acum.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Invitator:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Canal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Cod:';

  @override
  String get guildSettingsInvitesLabelUses => 'Utilizări:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Creat:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Expiră:';

  @override
  String get guildSettingsInvitesUnknown => 'Necunoscut';

  @override
  String get guildSettingsInvitesNoCategory => 'Fără categorie';

  @override
  String get guildSettingsInvitesExpired => 'Expirat';

  @override
  String get guildSettingsInvitesNever => 'Niciodată';

  @override
  String get guildSettingsInvitesCopyLink => 'Copiază linkul de invitație';

  @override
  String get guildSettingsInvitesRevoke => 'Revocă invitația';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Invitația nu a putut fi revocată';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Linkul ar putea fi încă activ. Încearcă din nou mai târziu.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses utilizări';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Expiră $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Vizualizează și gestionează utilizatorii blocați.';

  @override
  String get guildSettingsBansSearchHint => 'Căutați interdicții';

  @override
  String get guildSettingsBansEmpty => 'Niciun utilizator blocat.';

  @override
  String get guildSettingsBanPermanent => 'Interdicție permanentă';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Expiră la $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Expiră';

  @override
  String get guildSettingsUnban => 'Eliminare interdicție';

  @override
  String get guildSettingsBansLoading => 'Se încarcă utilizatorii blocați';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nu s-au găsit interdicții care să corespundă căutării tale.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detalii interdicție';

  @override
  String get guildSettingsBanViewDetails => 'Vezi detalii';

  @override
  String get guildSettingsBannedOn => 'Interzis pe';

  @override
  String get guildSettingsBannedBy => 'Interzis de';

  @override
  String get guildSettingsRevokeBanTitle => 'Anulează interdicția';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Ești sigur că vrei să anulezi banarea pentru $displayName? Va putea să se alăture din nou comunității.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'A anulat interdicția pentru $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Nu am putut încărca interdicțiile. Încearcă din nou.';

  @override
  String get guildSettingsRevokeBanError =>
      'Nu am putut revoca interdicția. Încearcă din nou.';

  @override
  String get guildSettingsCommunitySettings => 'Setări comunitate';

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
      'Gestionează profilul, canalele și setările implicite ale comunității tale.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Brand';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Actualizează-ți pictograma, numele, bannerul și fundalul invitației';

  @override
  String get guildSettingsOverviewBannerUpload => 'Încarcă bannerul';

  @override
  String get guildSettingsOverviewIdleTitle => 'Setări inactivitate';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configurează canalul AFK și timpul de inactivitate';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistem și bun venit';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Alege destinația pentru mesajele de sistem și de bun venit';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Notificări implicite';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Comunitățile cu peste 250 de persoane sunt forțate să utilizeze setarea \"doar mențiuni\". Setarea ta inițială este păstrată și va fi restabilită dacă numărul membrilor comunității scade sub 250.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avansat';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Permite nume flexibile pentru canalele de chat';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Ascunde coroana proprietarului comunității';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Banner detașat';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Afișează bannerul în propria secțiune, sub antetul comunității.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Încarcă pictogramă';

  @override
  String get guildSettingsOverviewRemoveImage => 'Elimină';

  @override
  String get guildSettingsOverviewSplashTitle => 'Imagine de fundal invitație';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Fundal încorporat pentru chat';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Afișat în invitatiile trimise în chat.';

  @override
  String get guildSettingsOverviewUploadBackground =>
      'Încarcă imaginea de fundal';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Fără banner de comunitate';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Fără fundal de invitație';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Previzualizare';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Vezi cum arată invitația ta pentru vizitatori.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Numele canalelor text';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Coroana proprietarului comunității';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configurează dacă pictograma coroană este afișată lângă proprietarul comunității';

  @override
  String get guildSettingsSplashCardAlignment => 'Aliniere card';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centru';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Stânga';

  @override
  String get guildSettingsSplashAlignmentRight => 'Dreapta';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Se aplică doar pe ecrane late.';

  @override
  String get permissionReadMessageHistory => 'Citește istoricul mesajelor';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Modifică ce pot vedea utilizatorii fără $permission';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Folosește o fereastră dedicată pentru a seta o dată limită pentru istoricul mesajelor membrilor care nu au permisiunea $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Deschide pragul istoricului mesajelor';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'Prag istoric mesaje';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Activează pragul istoric al mesajelor';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Data limită';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Membrii fără Istoric mesaje citite pot vedea mesajele trimise după această dată.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Pragul istoricului mesajelor a fost actualizat';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Permite litere mari și spații în numele canalelor de chat. Dezactivarea restricționează numele la litere mici, cu cratime și subliniere.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Ascunde pictograma coroanei de lângă proprietarul comunității pe toate suprafețele.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Antipodele animate necesită funcționalitatea comunității Antipode Animate.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Banner-ele animate necesită funcționalitatea de comunitate Banner animat.';

  @override
  String get guildSettingsAfkChannel => 'Canal AFK / inactiv';

  @override
  String get guildSettingsAfkChannelHint =>
      'Mută membrii în acest canal când sunt inactivi.';

  @override
  String get guildSettingsNoAfkChannel => 'Fără canal AFK';

  @override
  String get guildSettingsAfkTimeout => 'Timp de inactivitate';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minut';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minute';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minute';

  @override
  String get guildSettingsAfkTimeout30Min => '30 de minute';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 oră';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds secunde';
  }

  @override
  String get guildSettingsSystemChannel => 'Canal de destinație';

  @override
  String get guildSettingsSystemChannelHint =>
      'Mesajele de bun venit și de sistem vor apărea aici.';

  @override
  String get guildSettingsNoSystemChannel => 'Fără canal de sistem';

  @override
  String get guildSettingsHideJoinMessages => 'Ascunde mesajele de alăturare';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Suprimă mesajele de intrare în canalul de destinație.';

  @override
  String get guildSettingsDefaultNotifications => 'Setări notificare implicite';

  @override
  String get guildSettingsNotificationsAll => 'Toate mesajele';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notifică la toate mesajele';

  @override
  String get guildSettingsNotificationsMentions => 'Doar mențiuni';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notifică doar la mențiuni';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maxim 10 MB. Minim: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max. 10 MB. Minim: 960×540px (16:9). Afișat în previzualizările invitațiilor în chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Configure verificarea, filtrarea conținutului și setările pentru conținut explicit.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Comunitățile listate la Descoperire au opțiuni de moderare restricționate.';

  @override
  String get guildSettingsModerationContentFilterTitle =>
      'Filtrarea conținutului';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Filtrează automat mesajele cu conținut explicit în canalele care nu sunt marcate pentru conținut matur.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Comunitățile listate în Descoperire trebuie să scaneze toți membrii. Această setare nu poate fi modificată cât timp Descoperirea este activată.';

  @override
  String get guildSettingsContentFilterOff => 'Dezactivat';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Permite comunității să se automodereze';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Filtrează membrii fără roluri';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Sugerat pentru majoritatea comunităților';

  @override
  String get guildSettingsContentFilterAll => 'Filtrează pe toată lumea';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Protecție maximă pentru spațiile de familie';

  @override
  String get guildSettingsModerationMatureOff => 'Dezactivat';

  @override
  String get guildSettingsModerationMatureOn => 'Activat';

  @override
  String get guildSettingsContentWarningToggle =>
      'Afișează un avertisment de conținut';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Activează o solicitare de consimțământ înainte de a intra în orice canal.';

  @override
  String get guildSettingsContentWarningText =>
      'Text de avertizare personalizat';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Acest conținut este sensibil.';

  @override
  String get guildSettingsModeration2faTitle => 'Cerință 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Solicită autentificarea în doi pași pentru moderatori înainte ca aceștia să poată bana, elimina, suspenda sau șterge mesaje.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Solicită 2FA pentru acțiunile de moderare';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Doar proprietarul comunității poate schimba această setare';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Activează autentificarea în 2 pași pentru a schimba această setare';

  @override
  String get guildSettingsEmojiSearchHint => 'Căutați emojiuri';

  @override
  String get guildSettingsEmojiUploadTitle => 'Încarcă emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Sloturi emoji';

  @override
  String get guildSettingsEmojiDropZone =>
      'Trageți și plasați fișierele emoji aici';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Nu s-au putut încărca emoji-urile. Încearcă din nou mai târziu.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nu s-au găsit emojiuri care să corespundă căutării tale.';

  @override
  String get guildSettingsEmojiNoSlots =>
      'Nu sunt sloturi disponibile pentru emojiuri';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Ați atins numărul maxim de emojiuri. Ștergeți câteva emojiuri existente pentru a face loc.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Numele emoji-urilor trebuie să aibă cel puțin 2 caractere și pot conține litere, numere și linii inferioare. Emoji-urile trebuie să aibă mai puțin de $maxSize. Imaginile statice sunt redimensionate automat la 128x128 pixeli și sunt comprimate. Emoji-urile animate și SVG-urile trebuie să respecte deja limita.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Se încarcă emojiuri';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojiuri',
      one: '# emoji',
    );
    return 'Se încarcă $_temp0. Acest proces poate dura puțin.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Nu s-au putut încărca emoji-urile. Încearcă din nou.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Unele emojiuri nu au putut fi adăugate';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Revizuiește aceste fișiere și încearcă din nou cu imagini mai mici sau mai simple.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Redenumește emoji-ul';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 caractere, litere, cifre, cratime de subliniere.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Nume';

  @override
  String get guildSettingsEmojiColumnUploader => 'Încărcat de';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Necunoscut';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Șterge emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Ștergi :$name:? Nu poate fi anulat.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Șterge acest emoji din stocare și CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Numele emojiului trebuie să aibă cel puțin 2 caractere';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Numele emojiului trebuie să aibă maximum 32 de caractere';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Nume emoji nevalid';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Nu s-a putut redenumi acest emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Numele a revenit la cel anterior. Te rugăm să încerci din nou mai târziu.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Acest emoji nu mai există';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Este posibil să fi fost șters. Numele a revenit la cel inițial.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Nu poți redenumi acest emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Nu ai permisiunea de a redenumi acest emoji. Numele a revenit la cel anterior.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Te miști prea repede';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Te rugăm să aștepți un moment și să încerci să redenumești din nou.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Nu s-a putut șterge acest emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Nu poți șterge acest emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Permite altora să-ți cloneze emoji-urile';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Când este activată, membrii altor comunități pot folosi scurtătura \"Clonare\" cu un singur clic din aplicație pentru emoji-urile tale personalizate. Acest lucru nu îi împiedică să salveze imaginea și să o încarce ei înșiși.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Permite altora să-ți cloneze stickerele';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Când este activată, membrii altor comunități pot folosi scurtătura \"Clonare\" cu un singur clic din aplicație pentru stickerele tale personalizate. Acest lucru nu îi împiedică să salveze imaginea și să o încarce ei înșiși.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Doar membrii cu permisiunea „$permission” pot modifica acest lucru.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Nu s-a putut actualiza clonarea emoji-urilor';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Nu s-a putut actualiza clonarea autocolantelor';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji non-animate ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animate ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Căutați stickere';

  @override
  String get guildSettingsStickerSlotsTitle => 'Sloturi pentru stickere';

  @override
  String get guildSettingsStickerUploadTitle => 'Încarcă un sticker';

  @override
  String get guildSettingsStickerDropZone =>
      'Trageți și plasați un fișier sticker aici (unul pe rând)';

  @override
  String get guildSettingsStickerDensity => 'Densitate stickere';

  @override
  String get guildSettingsStickerDensityCozy => 'Confortabil';

  @override
  String get guildSettingsStickerDensityCompact => 'Compact';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Nu s-au putut încărca stickerele';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'A apărut o eroare la încărcarea stickere-lor. Încearcă din nou.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nu s-au găsit stickere care să se potrivească căutării tale.';

  @override
  String get guildSettingsStickersEmptySearch => 'Nu s-au găsit stickere';

  @override
  String get guildSettingsStickerNoSlots =>
      'Nu sunt sloturi disponibile pentru stickere';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Ați atins numărul maxim de stickere. Ștergeți stickere existente pentru a face loc altora.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Autocolantele sunt salvate la 320x320 pixeli și trebuie să aibă mai puțin de $maxSize. Imaginile statice sunt redimensionate și comprimate automat. Autocolantele animate și SVG-urile trebuie să respecte deja limita.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Fișier autocolant neacceptat';

  @override
  String get guildSettingsStickerAddTitle => 'Adaugă sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Editează stickerul';

  @override
  String get guildSettingsStickerNameLabel => 'Nume';

  @override
  String get guildSettingsStickerNameHint => 'Autocolantul meu minunat';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Descriere';

  @override
  String get guildSettingsStickerDescriptionHint => 'Descrie stickerul';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Etichete ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Adaugă o etichetă';

  @override
  String get guildSettingsStickerTagAdd => 'Adaugă';

  @override
  String get guildSettingsStickerNameRequired => 'Numele este obligatoriu';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Numele trebuie să aibă cel puțin 2 caractere';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Numele trebuie să aibă maximum 30 de caractere';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Descrierea trebuie să aibă maximum 500 de caractere';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Nu s-a putut crea acest autocolant';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Autocolantul este prea mare';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Stickerul nu a putut fi comprimat suficient';

  @override
  String get guildSettingsStickerDeleteTitle => 'Șterge stickerul';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Ștergi „$name”? Nu poate fi anulat.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Ștergeți acest autocolant din stocare și CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Nu s-a putut șterge acest sticker';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Nu poți șterge acest sticker';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Pentru a crea un webhook, deschide $channelSettingsPath. Poți edita și organiza în continuare toți webhook-urile existente aici.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'URL-ul tău personalizat nu va funcționa decât dacă cel puțin un canal este vizibil pentru toată lumea.';

  @override
  String get guildSettingsVanityUrlRemove => 'Elimină';

  @override
  String get guildSettingsBannedUsersTitle => 'Utilizatori blocați';

  @override
  String get guildSettingsInvitesTableInviter => 'Invitație de la';

  @override
  String get guildSettingsInvitesTableChannel => 'Canal';

  @override
  String get guildSettingsInvitesTableCode => 'Cod';

  @override
  String get guildSettingsInvitesTableUses => 'Utilizări';

  @override
  String get guildSettingsInvitesTableCreated => 'Creat';

  @override
  String get guildSettingsInvitesTableExpires => 'Expiră';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrează după utilizator';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrează după acțiune';

  @override
  String get createDm => 'Creează un mesaj direct';

  @override
  String get createGroupDm => 'Creează un grup de mesaje directe';

  @override
  String get createDmNewMessage => 'Mesaj nou';

  @override
  String get createDmSelectFriends => 'Selectează prieteni';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Alege prieteni cărora să le trimiți mesaje.';

  @override
  String get createDmSearchFriends => 'Caută prieteni';

  @override
  String get createDmNoFriendsFound => 'Niciun prieten găsit';

  @override
  String get createDmNoFriendsYet => 'Nu ai încă prieteni';

  @override
  String get createDmClaimToStartDms =>
      'Revendică-ți contul pentru a începe conversații private.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifică-ți adresa de e-mail pentru a începe conversații private.';

  @override
  String get createDmVerifyYourEmail => 'Verifică-ți adresa de e-mail';

  @override
  String get createDmNewGroup => 'Grup nou';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Creează un grup nou cu $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Confirmă grup nou';

  @override
  String get createDmCreateNewGroup => 'Creează un grup nou';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Elimină $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Ai deja un grup cu acești utilizatori. Vrei să creezi unul nou? E în regulă și așa!';

  @override
  String get createDmNoActivityYet => 'Fără activitate încă';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Unii utilizatori nu pot fi adăugați';

  @override
  String get createDmCreateWithoutThem => 'Creează fără ei';

  @override
  String get createDmUnaddableIntro =>
      'Următoarele persoane nu pot fi adăugate la acest grup de mesaje directe:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Creezi grupul de mesaje directe cu ceilalți $count participanți și îi sari pe ceilalți?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Nu mai sunt destinatari pentru a crea un grup de mesaje directe.';

  @override
  String get createDmUnaddableUserNotFound => 'Utilizatorul nu a fost găsit';

  @override
  String get createDmUnaddableBlocked =>
      'Nu poți trimite mesaje acestui utilizator';

  @override
  String get createDmUnaddableNotFriends => 'Nu e în lista ta de prieteni';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Nu permite adăugarea la conversații de grup';

  @override
  String get createDmFailed =>
      'Nu am putut crea conversația. Încearcă din nou.';

  @override
  String get dmListMessagesTitle => 'Mesaje';

  @override
  String get dmListDirectMessagesTitle => 'Mesaje directe';

  @override
  String get keybindsSearchShortcuts => 'Căutați scurtături';

  @override
  String get keybindSectionDefaults => 'Implicit';

  @override
  String get keybindSectionMessages => 'Mesaje';

  @override
  String get keybindSectionNavigation => 'Navigare';

  @override
  String get keybindSectionDragAndDrop => 'Trage și plasează';

  @override
  String get keybindSectionChat => 'Conversație';

  @override
  String get keybindSectionVoiceAndVideo => 'Apeluri voce și video';

  @override
  String get keybindSectionMisc => 'Diverse';

  @override
  String get keybindActionShowShortcutsList =>
      'Afișează lista de scurtături de la tastatură';

  @override
  String get keybindActionCopyText => 'Copiază textul';

  @override
  String get keybindActionMarkUnread => 'Marchează ca necitit';

  @override
  String get keybindActionFocusTextarea => 'Focalizează zona de text';

  @override
  String get keybindActionSwitchCommunities => 'Comută între comunități';

  @override
  String get keybindActionSwitchChannels => 'Comută între canale';

  @override
  String get keybindActionHistoryBack =>
      'Navigați înapoi în istoricul canalelor vizualizate';

  @override
  String get keybindActionHistoryForward =>
      'Parcurgeți înainte istoricul canalelor vizualizate';

  @override
  String get keybindActionJumpUnreadChannels => 'Salt între canalele necitite';

  @override
  String get keybindActionJumpMentionChannels =>
      'Salt între canalele necitite cu mențiuni';

  @override
  String get keybindActionJumpCurrentCall => 'Salt la apelul curent';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Comută între ultima comunitate și mesaje directe';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Comută la comunitatea sau conversațiile anterioare';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Comută la următoarea comunitate sau la mesaje directe';

  @override
  String get keybindActionGoToDms => 'Mergi la mesaje directe';

  @override
  String get keybindActionGoToFirstCommunity => 'Mergi la prima comunitate';

  @override
  String get keybindActionGoToSecondCommunity => 'Mergi la a doua comunitate';

  @override
  String get keybindActionGoToThirdCommunity => 'Mergi la a treia comunitate';

  @override
  String get keybindActionGoToFourthCommunity => 'Mergi la a patra comunitate';

  @override
  String get keybindActionGoToFifthCommunity => 'Mergi la a cincea comunitate';

  @override
  String get keybindActionGoToSixthCommunity => 'Mergi la a șasea comunitate';

  @override
  String get keybindActionGoToSeventhCommunity =>
      'Mergi la a șaptea comunitate';

  @override
  String get keybindActionGoToEighthCommunity => 'Mergi la a opta comunitate';

  @override
  String get keybindActionToggleQuickSwitcher => 'Comută comutatorul rapid';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Creează sau alătură-te unei comunități';

  @override
  String get keybindActionStartDragAndDrop => 'Începe glisarea și fixarea';

  @override
  String get keybindActionMove => 'Mută';

  @override
  String get keybindActionDropItem => 'Aruncă elementul';

  @override
  String get keybindActionCancel => 'Anulează';

  @override
  String get keybindActionMarkCommunityRead =>
      'Marchează comunitatea ca citită';

  @override
  String get keybindActionMarkChannelRead => 'Marchează canalul ca citit';

  @override
  String get keybindActionStartGroupDm => 'Porniți un DM de grup';

  @override
  String get keybindActionTogglePinnedMessages => 'Comută mesajele fixate';

  @override
  String get keybindActionToggleInbox => 'Comută la mesaje';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Marchează drept citit canalul principal din inbox';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Marchează toate canalele din inbox ca citite';

  @override
  String get keybindActionToggleMemberList =>
      'Comută lista de membri sau chatul vocal';

  @override
  String get keybindActionToggleEmojiPicker => 'Comută selectorul de emoji';

  @override
  String get keybindActionToggleGifPicker => 'Comută selectorul de GIF-uri';

  @override
  String get keybindActionToggleStickerPicker =>
      'Comută selectorul de stickere';

  @override
  String get keybindActionScrollChatUp => 'Derulează conversația în sus';

  @override
  String get keybindActionScrollChatDown => 'Derulează chatul în jos';

  @override
  String get keybindActionJumpOldestUnread =>
      'Salt la cel mai vechi mesaj necitit';

  @override
  String get keybindActionFocusComposer => 'Focalizează zona de text';

  @override
  String get keybindActionUploadFile => 'Încarcă un fișier';

  @override
  String get keybindActionCopyChannelLink => 'Copiază linkul canalului';

  @override
  String get keybindActionToggleSavedMedia => 'Comută media salvată';

  @override
  String get keybindActionSendVoiceMessage => 'Trimite mesaj vocal';

  @override
  String get keybindActionAnswerCall => 'Răspunde la apelul primit';

  @override
  String get keybindActionDeclineCall => 'Refuză apelul primit';

  @override
  String get keybindActionStartDmCall =>
      'Inițiază un apel într-un mesaj direct sau grup';

  @override
  String get keybindActionToggleSoundboard => 'Comută panoul de sunet';

  @override
  String get keybindActionToggleCompactCallView =>
      'Extindeți sau restrângeți vizualizarea compactă a apelului';

  @override
  String get keybindActionPushToTalkPriority =>
      'Apăsați pentru a vorbi (prioritate)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioritate activitate vocală';

  @override
  String get keybindActionOpenHelp => 'Deschide Ajutor';

  @override
  String get keybindActionSearchMessages => 'Căutați mesaje';

  @override
  String get keybindActionOpenContextMenu => 'Deschide meniul contextual';

  @override
  String get keybindActionOpenSettings => 'Deschide setările';

  @override
  String get keybindActionOpenThemeStudio =>
      'Deschide fereastra pop-out a studioului de teme';

  @override
  String get keybindActionZoomIn => 'Mărire';

  @override
  String get keybindActionZoomOut => 'Micșorare';

  @override
  String get keybindActionZoomReset => 'Resetați zoomul';

  @override
  String get clipboardPasteFailed =>
      'Nu am putut lipi. Clipboardul era gol sau blocat pentru această aplicație.';

  @override
  String get homeQuickActionDms => 'Mesaje directe';
}
