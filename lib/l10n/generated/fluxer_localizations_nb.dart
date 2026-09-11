// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class FluxerLocalizationsNb extends FluxerLocalizations {
  FluxerLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get reconnectingTitle => 'Vi har klønet det til!';

  @override
  String get reconnectingBody =>
      'Noe er galt med serverne.\nSkulle vært fikset om et øyeblikk!';

  @override
  String get gatewayReconnectingToast => 'Kobler til på nytt…';

  @override
  String get gatewayConnectedToast => 'Tilkoblet';

  @override
  String get sessionExpiredToast =>
      'Sesjonen din er utløpt. Vennligst logg inn igjen.';

  @override
  String splashStartupFailed(String error) {
    return 'Kunne ikke starte: $error';
  }

  @override
  String get retry => 'Prøv igjen';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Tilkobling tapt';

  @override
  String get splashViewOnStatusPage => 'Se på statusiden';

  @override
  String get splashConnectionIssuesPrompt => 'Tilkoblingsproblemer?';

  @override
  String get splashStatusPageLink => 'Statuside';

  @override
  String get splashReadIncident => 'Les hendelse';

  @override
  String get splashIncidentHistory => 'Hendelseshistorikk';

  @override
  String get nagbarLearnMore => 'Les mer';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Vedlikehold er planlagt til $localizedTime. Forventet varighet: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Vedlikehold pågår. Forventet varighet: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Vedlikehold er fullført.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hei $displayName, gjør krav på kontoen din for å unngå å miste tilgangen.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hei $displayName, vennligst bekreft e-postadressen din.';
  }

  @override
  String get nagbarOpenSettings => 'Åpne innstillinger';

  @override
  String get systemPermissionSettingsTitle => 'Aktiver tillatelse';

  @override
  String get systemPermissionSettingsOpenSettings => 'Åpne innstillinger';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName har ikke tilgang til mikrofonen din. Du kan aktivere den i enhetsinnstillingene for personvern.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName har ikke tilgang til kameraet ditt. Du kan aktivere det i enhetsinnstillingene for personvern.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName har ikke tilgang til bildebiblioteket ditt. Du kan aktivere det i enhetsinnstillingene for personvern.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName har ikke tillatelse til å sende varsler. Du kan aktivere dette i enhetsinnstillingene dine.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Abonnementet ditt ble ikke fornyet, men du har fortsatt tilgang til $productName-fordeler frem til $graceDate. Gjør noe nå, ellers mister du alle fordeler.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Abonnementet ditt på $productName har utløpt. Forny nå for å beholde fordelene dine.';
  }

  @override
  String get nagbarManageSubscription => 'Administrer abonnement';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Velkommen til $productFullName. Utforsk dine $productName-fordeler og administrer abonnementet ditt.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Se $productName-funksjoner';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Du har en ny gavekode som venter i gavebeholdningen din.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Du har $count nye gavekoder som venter i gavebeholdningen din.';
  }

  @override
  String get nagbarViewGiftInventory => 'Se gavebeholdning';

  @override
  String get nagbarVisionaryMfa =>
      'Aktiver totrinnsautentisering for å beskytte din Visionary-konto.';

  @override
  String get nagbarEnableMfa => 'Aktiver totrinnsbekreftelse';

  @override
  String get nagbarTermsAcceptance =>
      'Vi har oppdatert vilkårene våre. Vennligst les og godta dem for å fortsette.';

  @override
  String get nagbarReviewTerms => 'Se gjennom vilkårene';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Bli med i $communityName for å chatte med teamet og holde deg oppdatert.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Bli med i $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Aktiver varsler slik at du ikke går glipp av meldinger og @omtaler.';

  @override
  String get nagbarEnableNotifications => 'Slå på varsler';

  @override
  String get nagbarBillingPortalFailed =>
      'Kunne ikke åpne faktureringsportalen. Prøv igjen om et øyeblikk.';

  @override
  String get welcomeBack => 'Velkommen tilbake';

  @override
  String get email => 'E-post';

  @override
  String get emailInvalid => 'Vennligst oppgi en gyldig e-postadresse.';

  @override
  String get password => 'Passord';

  @override
  String get forgotPassword => 'Glemt passordet ditt?';

  @override
  String get logIn => 'Logg inn';

  @override
  String get logInWithPasskey => 'Logg inn med en passnøkkel';

  @override
  String continueWithSso(String provider) {
    return 'Fortsett med $provider';
  }

  @override
  String get ssoRequired => 'SSO kreves for å få tilgang til denne instansen.';

  @override
  String get organizationSsoProvider =>
      'Logg inn med organisasjonens leverandør for enkeltpålogging.';

  @override
  String get failedToStartSso => 'Kunne ikke starte SSO';

  @override
  String get ssoCancelled => 'SSO-pålogging ble avbrutt';

  @override
  String preferSso(String provider) {
    return 'Foretrekker du å bruke SSO? Fortsett med $provider.';
  }

  @override
  String get logInViaBrowser => 'Logg inn via nettleser';

  @override
  String get needAccountPrompt => 'Trenger du en konto? ';

  @override
  String get register => 'Registrer';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Bekreft at du er et menneske';

  @override
  String get captchaDescription =>
      'Vi må forsikre oss om at du ikke er en bot. Vennligst fullfør bekreftelsen nedenfor.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Har du problemer? Prøv hCaptcha i stedet';

  @override
  String get captchaSwitchToTurnstile => 'Prøv Turnstile i stedet';

  @override
  String get cancel => 'Avbryt';

  @override
  String get ipAuthCheckEmail => 'Sjekk e-posten din';

  @override
  String ipAuthDescription(String email) {
    return 'Vi sendte en e-post med en lenke for å godkjenne denne påloggingen. Vennligst åpne innboksen din for $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Tilkobling tapt';

  @override
  String get ipAuthConnectionLostDescription =>
      'Vi mistet tilkoblingen mens vi ventet på godkjenning. Vennligst prøv igjen.';

  @override
  String get ipAuthLinkExpired => 'Påloggingslenke utløpt';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Denne godkjenningslenken utløp. Vennligst logg inn igjen.';

  @override
  String get ipAuthResendEmail => 'Send e-post på nytt';

  @override
  String get ipAuthResent => 'Sendt på nytt';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Tilbake';

  @override
  String get next => 'Neste';

  @override
  String get mfaTitle => 'Tofaktorautentisering';

  @override
  String get mfaChooseMethod => 'Velg en bekreftelsesmetode';

  @override
  String get mfaMethodTotp => 'Autentiseringsapp';

  @override
  String get mfaMethodWebauthn => 'Sikkerhetsnøkkel / Passnøkkel';

  @override
  String get mfaTotpDescription =>
      'Skriv inn 6-sifret kode fra autentiseringsappen din eller en av backupkodene dine.';

  @override
  String get mfaCodeLabel => 'Kode';

  @override
  String get mfaTryAnotherMethod => 'Prøv en annen metode';

  @override
  String get mfaUseSecurityKey =>
      'Prøv sikkerhetsnøkkel / passordnøkkel i stedet';

  @override
  String get accountSelectorTitle => 'Velg en konto';

  @override
  String get accountSelectorDescription =>
      'Velg en konto for å fortsette, eller legg til en annen.';

  @override
  String get accountAdd => 'Legg til konto';

  @override
  String get accountRemove => 'Fjern';

  @override
  String accountRemoveTitle(String username) {
    return 'Fjern $username';
  }

  @override
  String get accountRemoveDescription =>
      'Dette fjerner den lagrede økten for denne kontoen.';

  @override
  String get accountRemoveOnlyDescription =>
      'Dette fjerner den eneste lagrede kontoen på denne enheten.';

  @override
  String get accountExpired => 'Utløpt';

  @override
  String accountSessionExpired(String identifier) {
    return 'Økt utløpt for $identifier. Logg inn igjen.';
  }

  @override
  String get accountManageTitle => 'Administrer kontoer';

  @override
  String get accountSwitchFailed => 'Kunne ikke bytte konto. Prøv igjen.';

  @override
  String get profileTabMenuSwitchAccounts => 'Bytt konto';

  @override
  String get statusChangeSheetTitle => 'Angi status';

  @override
  String get statusOnlineStatusSection => 'Nettverksstatus';

  @override
  String get statusOnline => 'Pålogget';

  @override
  String get statusIdle => 'Inaktiv';

  @override
  String get statusDnd => 'Ikke forstyrr';

  @override
  String get statusInvisible => 'Usynlig';

  @override
  String get statusOffline => 'Frakoblet';

  @override
  String get statusUntilIChangeIt => 'Til jeg endrer det';

  @override
  String get statusDontClear => 'Ikke fjern';

  @override
  String get statusFor10Seconds => 'I 10 sekunder';

  @override
  String get statusClearAfter10Seconds => '10 sekunder';

  @override
  String get statusClearAfter15Minutes => '15 minutter';

  @override
  String get statusClearAfter30Minutes => '30 minutter';

  @override
  String get statusClearAfter1Hour => '1 time';

  @override
  String get statusClearAfter3Hours => '3 timer';

  @override
  String get statusClearAfter4Hours => '4 timer';

  @override
  String get statusClearAfter8Hours => '8 timer';

  @override
  String get statusClearAfter24Hours => '24 timer';

  @override
  String get statusClearAfter3Days => '3 dager';

  @override
  String get statusDndDescription =>
      'Du vil ikke motta varsler på skrivebordet';

  @override
  String get statusInvisibleDescription => 'Du vil vises som frakoblet';

  @override
  String get customStatusSetTitle => 'Angi egendefinert status';

  @override
  String get customStatusCurrentHint => 'Egendefinert status';

  @override
  String get customStatusClear => 'Fjern egendefinert status';

  @override
  String get customStatusPlaceholder => 'Hva skjer?';

  @override
  String get customStatusChooseEmoji => 'Velg en emoji';

  @override
  String get customStatusClearAfter => 'Fjern etter';

  @override
  String get customStatusSave => 'Lagre';

  @override
  String get accountActive => 'Aktiv konto';

  @override
  String get signOut => 'Logg ut';

  @override
  String get suspendedPermanentTitle => 'Konto permanent suspendert';

  @override
  String get suspendedTemporaryTitle => 'Konto suspendert';

  @override
  String get suspendedPermanentDescription =>
      'Kontoen din er permanent suspendert for brudd på våre tjenestevilkår.';

  @override
  String get suspendedTemporaryDescription =>
      'Kontoen din er midlertidig suspendert. Du vil kunne få tilgang til kontoen din når suspensjonsperioden er over.';

  @override
  String get suspendedIssuedAt => 'Utstedt';

  @override
  String get suspendedEndsAt => 'Avsluttes';

  @override
  String get suspendedDuration => 'Varighet';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Årsak';

  @override
  String get suspendedAppealDeadline => 'Ankefrist';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Kontoen din er planlagt slettet $date.';
  }

  @override
  String get suspendedRecheck => 'Sjekk for oppdateringer';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Prøv igjen om ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Tilbake til innlogging';

  @override
  String get suspendedAppealTitle => 'Anke';

  @override
  String get suspendedAppealHint =>
      'Forklar hvorfor suspensjonen din bør vurderes på nytt (minimum 50 tegn)...';

  @override
  String get suspendedAppealSubmit => 'Send anke';

  @override
  String get suspendedAppealPending => 'Venter på gjennomgang';

  @override
  String get suspendedAppealAccepted => 'Anke akseptert';

  @override
  String get suspendedAppealRejected => 'Anke avslått';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Anken din er akseptert og kontoen din er gjenopprettet.';

  @override
  String get suspendedSignIn => 'Logg inn på kontoen din';

  @override
  String get forgotPasswordTitle => 'Glemt passordet ditt?';

  @override
  String get forgotPasswordDescription =>
      'Skriv inn e-postadressen din, så sender vi deg en lenke for å tilbakestille passordet.';

  @override
  String get forgotPasswordSubmit => 'Send tilbakestillingslenke';

  @override
  String get forgotPasswordSentTitle => 'Sjekk e-posten din';

  @override
  String get forgotPasswordSentDescription =>
      'Vi har sendt instruksjoner for tilbakestilling av passord til e-postadressen din. Vennligst sjekk innboksen din og følg lenken for å tilbakestille passordet.';

  @override
  String get forgotPasswordBackToLogin => 'Tilbake til innlogging';

  @override
  String get resetPasswordTitle => 'Angi nytt passord';

  @override
  String get resetPasswordDescription =>
      'Skriv inn ditt nye passord nedenfor for å fullføre tilbakestillingsprosessen.';

  @override
  String get resetPasswordNewPassword => 'Nytt passord';

  @override
  String get resetPasswordConfirm => 'Bekreft nytt passord';

  @override
  String get resetPasswordSubmit => 'Tilbakestill passord';

  @override
  String get resetPasswordMismatch => 'Passordene stemmer ikke.';

  @override
  String get registerTitle => 'Opprett en konto';

  @override
  String get registerDisplayName => 'Visningsnavn (valgfritt)';

  @override
  String get registerDisplayNameHint => 'Hva skal folk kalle deg?';

  @override
  String get registerUsername => 'Brukernavn (valgfritt)';

  @override
  String get registerUsernameHint => 'La stå tomt for et tilfeldig brukernavn';

  @override
  String get registerUsernameTagHint =>
      'En 4-sifret kode vil bli lagt til automatisk for å sikre unikhet';

  @override
  String get registerDateOfBirth => 'Fødselsdato';

  @override
  String get registerMonth => 'Måned';

  @override
  String get registerDay => 'Dag';

  @override
  String get registerYear => 'År';

  @override
  String get registerConsent =>
      'Jeg godtar vilkårene for bruk og personvernpolicyen';

  @override
  String get registerConsentPrefix => 'Jeg godtar ';

  @override
  String get registerConsentTerms => 'vilkårene for bruk';

  @override
  String get registerConsentAnd => ' og ';

  @override
  String get registerConsentPrivacy => 'personvernpolicyen';

  @override
  String get registerConfirmPassword => 'Bekreft passord';

  @override
  String get registerSubmit => 'Opprett konto';

  @override
  String get registerHaveAccount => 'Har du allerede en konto? ';

  @override
  String get registerPendingApproval =>
      'Kontoforespørselen din venter på godkjenning. Du kan logge inn etter at en administrator har godkjent den.';

  @override
  String get registerClosed =>
      'Registrering er stengt for øyeblikket. Bruk en registreringslenke fra en administrator for å opprette en konto.';

  @override
  String get passkeyNoCredentials =>
      'Ingen passnøkler funnet for denne appen. Logg inn med e-post og passord i stedet.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passnøkler støttes ikke på denne enheten.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passnøkler er ikke konfigurert for denne appen. Logg inn med e-post og passord i stedet.';

  @override
  String get passkeyTimeout =>
      'Passnøkkelautentisering tok for lang tid. Prøv igjen.';

  @override
  String get passkeyNotAvailable =>
      'Passnøkler er ikke tilgjengelige for denne appen. Logg inn med e-post og passord i stedet.';

  @override
  String get passkeyFailed =>
      'Passordnøkkel-autentisering mislyktes. Prøv igjen.';

  @override
  String get errorUnableToCreateAccount =>
      'Kunne ikke opprette konto. Prøv igjen.';

  @override
  String get errorUnableToSignIn =>
      'Kunne ikke logge inn akkurat nå. Prøv igjen.';

  @override
  String get errorServiceUnavailable =>
      'Denne instansen er midlertidig utilgjengelig. Prøv igjen om et øyeblikk.';

  @override
  String get errorInvalidEmailOrPassword => 'Ugyldig e-post eller passord.';

  @override
  String get errorUnableToSendResetLink =>
      'Kunne ikke sende tilbakestillingslenke. Prøv igjen.';

  @override
  String get errorUnableToResetPassword =>
      'Kunne ikke tilbakestille passord. Prøv igjen.';

  @override
  String get embedInviteJoin => 'Bli med i fellesskapet';

  @override
  String get embedInviteGoTo => 'Gå til fellesskapet';

  @override
  String embedInviteOnline(String count) {
    return '$count pålogget';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count medlemmer';
  }

  @override
  String get embedInviteUnknownTitle => 'Ukjent invitasjon';

  @override
  String get embedInviteUnknownSubtitle => 'Prøv å be om en ny invitasjon.';

  @override
  String get embedInviteUnavailable => 'Invitasjon utilgjengelig';

  @override
  String get embedInviteJoinGroup => 'Bli med i gruppen';

  @override
  String get embedInviteAlreadyJoined => 'Allerede medlem';

  @override
  String get embedInviteDisabled => 'Invitasjoner deaktivert';

  @override
  String get embedInvitePaused =>
      'Invitasjoner er satt på pause for dette fellesskapet.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName oppdaget et potensielt raid, så nye brukere kan ikke bli med akkurat nå.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Dette fellesskapet har satt invitasjoner på pause. Du kan prøve igjen senere.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName oppdaget et potensielt raid i dette fellesskapet. Invitasjoner er satt på pause, så nye brukere kan ikke bli med akkurat nå.';
  }

  @override
  String get inviteAcceptTitle => 'Du har blitt invitert til å bli med';

  @override
  String get inviteAcceptJoinButton => 'Bli med i fellesskapet';

  @override
  String get inviteAcceptGoToButton => 'Gå til fellesskapet';

  @override
  String get inviteAcceptInvitesPaused => 'Invitasjoner satt på pause';

  @override
  String get inviteAcceptNotFoundTitle => 'Invitasjon ugyldig';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Denne invitasjonen kan være utløpt eller ugyldig.';

  @override
  String get invalidDeepLinkTitle => 'Koblingen kunne ikke åpnes';

  @override
  String get invalidDeepLinkDescription =>
      'Denne lenken kan være ødelagt, kun tilgjengelig på nettet, eller du har kanskje ikke tilgang. Sjekk lenken og prøv igjen.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Gå til hjem';

  @override
  String get inviteAcceptJoinGroupButton => 'Bli med i gruppen';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Du har blitt invitert til å bli med i en gruppechat av $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'noen';

  @override
  String get inviteAcceptEmojiPack => 'Emotipakk';

  @override
  String get inviteAcceptStickerPack => 'Klistremerkepakk';

  @override
  String get inviteAcceptInstallEmojiPack => 'Installer emotipakk';

  @override
  String get inviteAcceptInstallStickerPack => 'Installer klistremerkepakk';

  @override
  String get inviteAcceptPackInstallNote =>
      'Ved å godta denne invitasjonen installeres pakken automatisk.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Kanaladgang nektet';

  @override
  String get channelAccessDeniedDescription =>
      'Du har ikke tilgang til kanalen der denne meldingen ble sendt.';

  @override
  String get messageJumpLinkNoAccess => 'Ingen tilgang';

  @override
  String get okay => 'Ok';

  @override
  String get embedThemeTitle => 'Delt tema';

  @override
  String get embedThemeSubtitle =>
      'Denne klienten støtter ikke egendefinerte temaer.';

  @override
  String get embedThemeUnavailableButton => 'Temaer utilgjengelig';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionær (livstid $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dager med $productName',
      one: '1 dag med $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uker med $productName',
      one: '1 uke med $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count måneder med $productName',
      one: '1 måned med $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count år med $productName',
      one: '1 år med $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Fra $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Trykk for å hente gaven din!';

  @override
  String get embedGiftAlreadyRedeemed => 'Allerede innløst';

  @override
  String get embedGiftClaimAccountHelp =>
      'Krev kontoen din for å løse inn denne gaven.';

  @override
  String get embedGiftClaim => 'Hent gave';

  @override
  String get embedGiftClaimed => 'Gave hentet';

  @override
  String get embedGiftClaimAccount => 'Krev konto for å løse inn';

  @override
  String get embedGiftUnknownTitle => 'Ukjent gave';

  @override
  String get embedGiftUnknownSubtitle =>
      'Denne gavekoden er ugyldig eller allerede innløst.';

  @override
  String get embedGiftUnavailable => 'Gaven er ikke tilgjengelig';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Hent gaven din for å aktivere abonnementet ditt på $productName!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Denne gaven er allerede hentet.';

  @override
  String get giftAcceptMaybeLater => 'Kanskje senere';

  @override
  String get giftRedeemedToast => 'Gave innløst!';

  @override
  String get giftRedeemInvalidTitle => 'Ugyldig gavekode';

  @override
  String get giftRedeemInvalidMessage =>
      'Denne koden er ugyldig eller allerede brukt.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Gaven er allerede innløst';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Denne koden er allerede innløst.';

  @override
  String get giftRedeemNotFoundTitle => 'Gaven ble ikke funnet';

  @override
  String get giftRedeemNotFoundMessage => 'Denne koden finnes ikke.';

  @override
  String get giftRedeemFailedTitle => 'Kunne ikke løse inn gave';

  @override
  String get giftRedeemFailedMessage =>
      'Kunne ikke løse inn denne gaven. Prøv igjen.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Kan ikke løse inn denne gaven';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Kontoer med Visionary-status kan ikke løse inn Plutonium-gaver. Kopier heller lenken for å dele den med en venn.';

  @override
  String get giftCopyLink => 'Kopier gavelink';

  @override
  String get privacySettings => 'Personverninnstillinger';

  @override
  String get privacyDirectMessages => 'Direktemeldinger';

  @override
  String get privacyDirectMessagesDescription =>
      'Tillat direktemeldinger fra andre medlemmer i dette fellesskapet';

  @override
  String get privacyBotDirectMessages => 'Direktemeldinger fra boter';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Tillat boter fra dette fellesskapet å sende deg direktemeldinger';

  @override
  String get privacyMutualDmsDisabled =>
      'Fellesskapsadministratorene har deaktivert mottak av direktemeldinger kun fra gjensidige medlemmer i dette fellesskapet.';

  @override
  String get communityDebug => 'Fellesskapsfeilsøking';

  @override
  String get copiedToClipboard => 'Kopiert til utklippstavlen';

  @override
  String get notificationSettings => 'Varslingsinnstillinger';

  @override
  String notificationMuteGuild(String guildName) {
    return ' Demp $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Dempe et fellesskap forhindrer at uleste indikatorer og varsler vises, med mindre du blir nevnt';

  @override
  String get notificationCommunitySettings =>
      'Varslingsinnstillinger for fellesskap';

  @override
  String get notificationAllMessages => 'Alle meldinger';

  @override
  String get notificationOnlyMentions => 'Kun nevnelser';

  @override
  String get notificationNothing => 'Ingenting';

  @override
  String get notificationSuppressEveryone => 'Skjul @everyone og @here';

  @override
  String get notificationSuppressRoles => 'Skjul alle rolletags';

  @override
  String get notificationMobilePush => 'Mobilvarsler';

  @override
  String get notificationOverrides => 'Varslingsinnstillinger';

  @override
  String get notificationSelectChannel => 'Velg en kanal eller kategori';

  @override
  String get notificationOnlyAtMentions => 'Kun @omtaler';

  @override
  String get notificationMuteChannel => 'Dempe kanal';

  @override
  String get notificationUnmuteChannel => 'Aktiver varsler for kanal';

  @override
  String get notificationUseCategoryDefault => 'Bruk kategoriens standard';

  @override
  String get notificationUseCommunityDefault => 'Bruk fellesskapets standard';

  @override
  String get notificationNoCategory => 'Ingen kategori';

  @override
  String get dmMarkAsRead => 'Merk som lest';

  @override
  String get dmMuteConversation => 'Dempe direktemelding';

  @override
  String get dmUnmuteConversation => 'Aktiver varsler for direktemelding';

  @override
  String get dmPinDm => 'Fest direktemelding';

  @override
  String get dmUnpinDm => 'Løsne direktemelding';

  @override
  String get dmAlwaysShowInSidebar => 'Vis alltid i sidefeltet';

  @override
  String get dmRemoveFromAlwaysShown => 'Fjern fra «vis alltid»';

  @override
  String get dmCloseDm => 'Lukk direktemelding';

  @override
  String get dmCloseDmConfirmTitle => 'Lukk direktemelding';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Er du sikker på at du vil lukke direktemeldingen med $username? Du kan alltid åpne den igjen senere.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Slette meldingene dine i denne samtalen?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Dette vil slette alle meldingene du har sendt i denne samtalen permanent. Dette kan ikke angres.';

  @override
  String get dmCopyChannelId => 'Kopier kanal-ID';

  @override
  String get dmChannelIdCopied => 'Kanal-ID kopiert';

  @override
  String get dmCopyUserId => 'Kopier bruker-ID';

  @override
  String get dmUserIdCopied => 'Bruker-ID kopiert';

  @override
  String get dmViewProfile => 'Vis profil';

  @override
  String get dmVoiceCall => 'Start anrop';

  @override
  String get incomingVoiceCallTitle => 'Innkommende anrop';

  @override
  String get incomingVoiceCallAccept => 'Godta';

  @override
  String get incomingVoiceCallDecline => 'Avvis';

  @override
  String get incomingVoiceCallLabel => 'Innkommende anrop';

  @override
  String get incomingVoiceCallIgnore => 'Ignorer';

  @override
  String get directVoiceCallNotEligible =>
      'Dette anropet kan ikke startes akkurat nå. Prøv igjen om litt.';

  @override
  String get voiceJoinCallFailed =>
      'Kunne ikke koble til dette anropet. Sjekk tilkoblingen din og prøv igjen.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Kunne ikke bli med i dette anropet. Sjekk tilkoblingen din og prøv igjen.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Kunne ikke oppdatere dette anropet på serveren. Sjekk tilkoblingen din og prøv igjen.';

  @override
  String get dmAddNote => 'Legg til notat';

  @override
  String get dmEditGroup => 'Rediger gruppe';

  @override
  String get dmInviteToCommunity => 'Inviter til fellesskap';

  @override
  String get dmBlock => 'Blokker';

  @override
  String get dmLeaveGroup => 'Forlat gruppe';

  @override
  String get dmNoCommunitiesAvailable => 'Ingen fellesskap tilgjengelig';

  @override
  String dmGroupMemberCount(int count) {
    return '$count medlemmer';
  }

  @override
  String get dmMuteFor15Min => 'I 15 minutter';

  @override
  String get dmMuteFor30Min => 'I 30 minutter';

  @override
  String get dmMuteFor1Hour => 'I 1 time';

  @override
  String get dmMuteFor3Hours => 'I 3 timer';

  @override
  String get dmMuteFor4Hours => 'I 4 timer';

  @override
  String get dmMuteFor8Hours => 'I 8 timer';

  @override
  String get dmMuteFor24Hours => 'I 24 timer';

  @override
  String get dmMuteFor3Days => 'I 3 dager';

  @override
  String get dmMuteForever => 'Til jeg aktiverer det igjen';

  @override
  String get dmPinGroupDm => 'Fest gruppemelding';

  @override
  String get dmUnpinGroupDm => 'Fjern festing av gruppechat';

  @override
  String get dmUnnamedGroup => 'Navnløs gruppe';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '${resolvedName}s gruppe';
  }

  @override
  String get dmFavoriteDm => 'Gjør DM til favoritt';

  @override
  String get dmUnfavoriteDm => 'Fjern favoritt fra DM';

  @override
  String get dmFavoriteGroupDm => 'Gjør gruppechat til favoritt';

  @override
  String get dmUnfavoriteGroupDm => 'Fjern favoritt fra gruppechat';

  @override
  String get dmChangeFriendNickname => 'Endre vennens kallenavn';

  @override
  String get dmRemoveFriend => 'Fjern venn';

  @override
  String get dmAddFriend => 'Legg til venn';

  @override
  String get dmAcceptFriendRequest => 'Godta venneforespørsel';

  @override
  String get dmIgnoreFriendRequest => 'Ignorer venneforespørsel';

  @override
  String get dmFriendRequestSent => 'Venneforespørsel sendt';

  @override
  String get dmUnblock => 'Fjern blokkering';

  @override
  String get dmDebugUser => 'Feilsøk bruker';

  @override
  String get dmDebugChannel => 'Feilsøk kanal';

  @override
  String get dmDebugCategory => 'Feilsøk kategori';

  @override
  String get dmPinned => 'Festet DM';

  @override
  String get dmUnpinned => 'Fjernet festing fra DM';

  @override
  String get dmMuted => 'Dempet DM';

  @override
  String get dmUnmuted => 'Slått på lyd for DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Fjern venn';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Er du sikker på at du vil fjerne $username som venn?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blokker bruker';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Er du sikker på at du vil blokkere $username? De vil ikke kunne sende deg meldinger eller venneforespørsler.';
  }

  @override
  String get dmFriendRequestSentToast => 'Venneforespørsel sendt';

  @override
  String get dmFriendRequestFailed => 'Kunne ikke sende venneforespørsel';

  @override
  String get dmAcceptFriendRequestFailed => 'Kunne ikke godta venneforespørsel';

  @override
  String get dmRemoveFriendFailed => 'Kunne ikke fjerne venn';

  @override
  String get dmBlockFailed => 'Kunne ikke blokkere bruker';

  @override
  String get dmUnblockFailed => 'Kunne ikke fjerne blokkering av bruker';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Kunne ikke ignorere venneforespørsel';

  @override
  String get dmAddFriends => 'Legg til venner';

  @override
  String get addFriendSheetTitle => 'Legg til venn';

  @override
  String get addFriendUsernameHint => 'Brukernavn#0000';

  @override
  String get addFriendUsernameLabel => 'Vennens brukernavn';

  @override
  String get addFriendSendRequest => 'Send forespørsel';

  @override
  String get addFriendNoUserFound =>
      'Ingen bruker funnet med det brukernavnet.';

  @override
  String get addFriendInvalidUsername =>
      'Skriv inn et gyldig brukernavn (Brukernavn#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Venneforespørsel sendt';

  @override
  String get addFriendClaimTitle => 'Gjør krav på kontoen din';

  @override
  String get addFriendClaimDescription =>
      'Gjør krav på kontoen din for å sende venneforespørsler.';

  @override
  String get addFriendVerifyTitle => 'Bekreft e-posten din';

  @override
  String get addFriendVerifyDescription =>
      'Du må bekrefte e-postadressen din før du kan sende venneforespørsler.';

  @override
  String get addFriendVerifyEmail => 'Bekreft e-post';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Innkommende venneforespørsler ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Utgående venneforespørsler ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Innkommende venneforespørsel';

  @override
  String get addFriendOutgoingStatus => 'Venneforespørsel sendt';

  @override
  String get addFriendViewProfile => 'Vis profil';

  @override
  String get addFriendAccept => 'Godta';

  @override
  String get addFriendIgnore => 'Ignorer';

  @override
  String get addFriendAcceptTitle => 'Godta venneforespørsel';

  @override
  String get addFriendIgnoreTitle => 'Ignorer venneforespørsel';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Godta venneforespørselen fra $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorer venneforespørselen fra $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Avbryt forespørsel';

  @override
  String get addFriendCancelRequestFailed =>
      'Kunne ikke avbryte venneforespørselen. Prøv igjen.';

  @override
  String get addFriendNotAcceptingRequests =>
      'De godtar ikke venneforespørsler akkurat nå.';

  @override
  String get addFriendUnblockFirst =>
      'Fjern blokkeringen først for å sende en venneforespørsel.';

  @override
  String get addFriendCannotSendToSelf =>
      'Du kan ikke sende en venneforespørsel til deg selv.';

  @override
  String get addFriendAlreadyFriends =>
      'Dere er allerede venner med denne brukeren.';

  @override
  String get addFriendClaimToSend =>
      'Fullfør registreringen for å sende venneforespørsler.';

  @override
  String get addFriendVerifyToSend =>
      'Verifiser e-postadressen din før du sender venneforespørsler.';

  @override
  String get addFriendFriendsListFull =>
      'Vennelisten din er full, eller så er deres. Fjern noen og prøv igjen.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Finn drømme-emojien din';

  @override
  String get emojiSearchEmpty => 'Ingen emojier samsvarer med søket ditt';

  @override
  String get emojiAutocompleteDefaultLabel => 'Standard emoji';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Dette er en standard-emoji på $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Denne emojien er fra dette fellesskapet. Du kan bruke den overalt.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Dette er en egendefinert emoji fra et fellesskap.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Dette er en egendefinert emoji fra et fellesskap. Spør forfatteren om en invitasjon for å bruke denne emojien.';

  @override
  String get emojiInfoFromHeader => 'Denne emojien er fra';

  @override
  String get emojiInfoDiscoverableCommunity => 'Synlig fellesskap';

  @override
  String get emojiInfoPrivateCommunity => 'Privat fellesskap';

  @override
  String get emojiInfoVerifiedCommunity => 'Verifisert fellesskap';

  @override
  String get emojiInfoAddToFavorites => 'Legg til i favoritter';

  @override
  String get emojiInfoRemoveFromFavorites => 'Fjern fra favoritter';

  @override
  String get emojiFrequentlyUsed => 'Ofte brukt';

  @override
  String get emojiTabGifs => 'GIF-er';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Klistremerker';

  @override
  String get emojiTabEmojis => 'Emojier';

  @override
  String get gifPickerSearch => 'Søk etter GIF-er';

  @override
  String get gifPickerSearchKlipy => 'Søk i KLIPY';

  @override
  String get gifPickerSearchTenor => 'Søk i Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoritter';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Ingen favoritt-GIF-er ennå';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Stjern en GIF for å se den her.';

  @override
  String get gifPickerTrending => 'Populære GIF-er';

  @override
  String get gifPickerNoResultsTitle => 'Ingen søkeresultater';

  @override
  String get gifPickerNoResultsDescription => 'Prøv et annet søkeord';

  @override
  String get gifPickerLoadFailedTitle => 'Kunne ikke laste GIF-er';

  @override
  String get gifPickerLoadFailedBody => 'Sjekk tilkoblingen din og prøv igjen.';

  @override
  String get emojiCategoryPeople => 'Folk';

  @override
  String get emojiCategoryNature => 'Natur';

  @override
  String get emojiCategoryFood => 'Mat og drikke';

  @override
  String get emojiCategoryActivity => 'Aktiviteter';

  @override
  String get emojiCategoryTravel => 'Reise og steder';

  @override
  String get emojiCategoryObjects => 'Objekter';

  @override
  String get emojiCategorySymbols => 'Symboler';

  @override
  String get emojiCategoryFlags => 'Flagg';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Lås opp $emojiCount fra $communityCount med Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Skaff Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Ikke vis dette igjen';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count egendefinerte emojier',
      one: '1 egendefinert emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fellesskap',
      one: '1 fellesskap',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Advarsel om ekstern lenke';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Du er i ferd med å forlate $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Eksterne lenker kan være farlige. Vær forsiktig.';

  @override
  String get externalLinkWarningDestinationUrl => 'Destinasjons-URL:';

  @override
  String get externalLinksSectionTitle => 'Eksterne lenker';

  @override
  String get externalLinksSectionDescription =>
      'Konfigurer hvordan advarsler om eksterne lenker håndteres.';

  @override
  String get externalLinkWarningTrustPrefix => 'Stol alltid på ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — hopp over denne advarselen neste gang';

  @override
  String get externalLinkVisitSite => 'Besøk nettsted';

  @override
  String get externalLinkTrustAllLabel => 'Godta alle eksterne lenker';

  @override
  String get externalLinkStripTrackingLabel =>
      'Fjern sporingsparametere fra URL-er';

  @override
  String get externalLinkStripTrackingDescription =>
      'Fjern automatisk sporingsparametere (som utm_source, fbclid, gclid) fra URL-er i meldinger du sender. Rydder opp lenken før den når noen andre.';

  @override
  String get externalLinkTrustAllConfirmTitle => 'Godta alle eksterne lenker?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Dette vil godta alle eksterne lenker og hoppe over advarselen for hvert domene. Dine eksisterende klarerte domener vil bli erstattet. Dette er mindre sikkert.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Godta alle';

  @override
  String get externalLinkStopTrustingAllTitle => 'Slutt å godta alle lenker?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Eksterne lenkeadvarsler vil vises igjen. Du må legge til klarerte domener individuelt.';

  @override
  String get externalLinkStopTrustingAllAction => 'Deaktiver godta alle';

  @override
  String get externalLinkTrustedAllDescription =>
      'Alle eksterne lenker er klarert. Advarsler vil ikke vises.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Du har $count klarert domene(r). Legg til flere ved å krysse av boksen når du besøker eksterne lenker.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Når aktivert, vil ingen eksterne lenkeadvarsler vises. Dette er mindre sikkert.';

  @override
  String get imageFileTooLarge =>
      'Bildefilen er for stor. Velg en fil som er mindre enn 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animerte avatarer krever Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animerte bannere krever Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animerte AVIF-filer støttes ikke';

  @override
  String get animatedAvifNotSupportedBody =>
      'Beskjæring og rotering av animerte AVIF-filer støttes ennå ikke. Hvis du fortsetter, vil den bli lastet opp i sin opprinnelige form.';

  @override
  String get uploadAsIs => 'Last opp som den er';

  @override
  String get croppingAnimatedNotSupported =>
      'Beskjæring av animerte bilder støttes ennå ikke. Den opprinnelige opplastingen vil bli brukt.';

  @override
  String get cropAvatar => 'Beskjær avatar';

  @override
  String get cropBanner => 'Beskjær banner';

  @override
  String get skip => 'Hopp over';

  @override
  String get crop => 'Beskjær';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Endre din Brukernavn';

  @override
  String get fluxerTagInputLabel => 'Brukernavn';

  @override
  String get fluxerTagDescriptionBase =>
      'Brukernavn kan kun inneholde bokstaver (a-z, A-Z), tall (0-9) og understreker. Brukernavn er ikke sensitiv for store/små bokstaver.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Brukernavn kan kun inneholde bokstaver (a-z, A-Z), tall (0-9) og understreker. Brukernavn er ikke sensitiv for store/små bokstaver. Du kan velge en hvilken som helst tilgjengelig 4-sifret tag fra #0000 til #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Brukernavn kan kun inneholde bokstaver (a-z, A-Z), tall (0-9) og understreker. Brukernavn er ikke sensitiv for store/små bokstaver. Du kan velge en hvilken som helst tilgjengelig 4-sifret tag fra #0001 til #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Mellom $min og $max tegn';
  }

  @override
  String get validationAllowedChars =>
      'Kun bokstaver (a-z, A-Z), tall (0-9) og understreker (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Få Plutonium for å tilpasse taggen din eller behold den når du endrer brukernavnet ditt';

  @override
  String get fluxerTagAlreadyTaken => 'Brukernavn er allerede tatt';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Brukernavn $username#$discriminator er allerede tatt. Fortsetter du, vil diskriminatoren din bli rullet om automatisk.';
  }

  @override
  String get customTagIsTemporary => 'Egendefinert tag er midlertidig';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Din egendefinerte 4-sifrede tag er kun tilgjengelig mens Plutonium-abonnementet ditt er aktivt. Når abonnementet ditt utløper $date, vil taggen din gå tilbake til et tilfeldig tildelt nummer etter en 3-dagers grace-periode.';
  }

  @override
  String get customTagTemporaryBody =>
      'Din egendefinerte 4-sifrede tag er kun tilgjengelig mens Plutonium-abonnementet ditt er aktivt. Når abonnementet ditt utløper, vil taggen din gå tilbake til et tilfeldig tildelt nummer etter en 3-dagers grace-periode.';

  @override
  String get iUnderstandContinue => 'Jeg forstår, fortsett';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Hvis du lagrer denne Brukernavn, vil din egendefinerte 4-sifrede tag gå tilbake til et tilfeldig nummer når Plutonium-abonnementet ditt avsluttes. Hvis abonnementet ditt ikke fornyes, har du en 3-dagers grace-periode før taggen endres.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Din egendefinerte 4-sifrede tag (#$discriminator) er aktiv mens Plutonium-abonnementet ditt er aktivt. Hvis abonnementet ditt avsluttes eller ikke fornyes etter en 3-dagers grace-periode, vil taggen din gå tilbake til et tilfeldig nummer.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Tilpass din 4-sifrede tag eller behold den når du endrer brukernavnet ditt';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Din Plutonium-prøveperiode utløper $date. Oppgrader for å beholde din egendefinerte tag og tjene et merke på profilen din.';
  }

  @override
  String get premiumTrialActive =>
      'Du er på en Plutonium-prøveperiode. Oppgrader for å beholde din egendefinerte tag og tjene et merke på profilen din.';

  @override
  String get fluxerTagUpdated => 'Brukernavn oppdatert';

  @override
  String get fluxerTagUpdateFailed =>
      'Kunne ikke oppdatere Brukernavn. Prøv igjen.';

  @override
  String get continueAction => 'Fortsett';

  @override
  String get profileCustomizationTitle => 'Profiltilpasning';

  @override
  String get profileCustomizationDescription =>
      'Rediger profilutseendet ditt og se en forhåndsvisning i sanntid';

  @override
  String get usernameLabel => 'Brukernavn';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Bekreft kontoen din for å endre Brukernavn';

  @override
  String get changeFluxerTag => 'Endre Brukernavn';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Tilpass din 4-sifrede tag (#$discriminator) slik du vil med Plutonium';
  }

  @override
  String get changeUsernameAndTagHint => 'Endre brukernavn og 4-sifret tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Din egendefinerte tag (#$discriminator) er knyttet til Plutonium-abonnementet ditt og vil tilbakestilles til en tilfeldig tag hvis det utløper.';
  }

  @override
  String get displayNameLabel => 'Visningsnavn';

  @override
  String get pronounsLabel => 'Pronomen';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Endre avatar';

  @override
  String get removeAvatar => 'Fjern avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maks 10 MB. Anbefalt: 512×512 piksler';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Endre banner';

  @override
  String get removeBanner => 'Fjern banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maks 10 MB. Minimum: 960×540 piksler (16:9)';

  @override
  String get accentColorLabel => 'Aksentfarge';

  @override
  String get accentColorDescription =>
      'Tilpasser kantlinjen og bannerfargen på profilen din';

  @override
  String get aboutMeLabel => 'Om meg';

  @override
  String get aboutMeHelperText => 'Du kan bruke lenker, emoji og Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Personvern for Plutonium-merke';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Kontroller hvordan Plutonium-merket ditt vises for andre';

  @override
  String get hidePlutoniumBadgeLabel => 'Skjul Plutonium-merket helt';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Skjul Plutonium-merket ditt helt for andre brukere';

  @override
  String get hidePlutoniumPurchaseDate => 'Skjul kjøpsdato for Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Skjul kjøpsdato for Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Fjern datoen du først kjøpte Plutonium fra merket ditt';

  @override
  String get maskVisionaryAsSubscription => 'Masker Visionary som abonnement';

  @override
  String get maskVisionaryDescription =>
      'Vis Visionary som et vanlig abonnement i stedet';

  @override
  String get hideVisionaryIdBadge => 'Skjul Visionary ID-merke';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Skjul Visionary ID-merke (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Fjern Visionary ID-merket ditt';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Du er på en Plutonium-prøveperiode – abonnementet ditt starter $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Abonnementet ditt starter automatisk når prøveperioden avsluttes. Ingen handling er nødvendig.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Du er på en Plutonium-prøveperiode som utløper $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Du er på en Plutonium-prøveperiode';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maks 10 MB. Anbefalt: 512×512 piksler. Animerte avatarer (GIF) krever Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Tilpass profilen din med et statisk eller animert bannerbilde for å få den til å skille seg ut.';

  @override
  String get getPlutonium => 'Skaff Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Kjøp i appen er ennå ikke tilgjengelig på denne plattformen. Følg med – kommer snart!';

  @override
  String get profilePreviewLabel => 'Forhåndsvisning';

  @override
  String get profilePreviewMessage => 'Melding';

  @override
  String profilePreviewMemberSince(String productName) {
    return '$productName-medlem siden';
  }

  @override
  String get unclaimedAccountTitle => 'Uavhentet konto';

  @override
  String get unclaimedAccountDescription =>
      'Kontoen din er ennå ikke hentet. Uten e-post og passord kan du miste tilgangen. Hent kontoen din nå for å sikre den.';

  @override
  String get claimAccount => 'Hent konto';

  @override
  String get profileTypeLabel => 'Profiltype';

  @override
  String get profileTypeGlobal => 'Global profil';

  @override
  String get profileTypeGuildDescription =>
      'Du redigerer profilen din per fellesskap. Denne profilen vil kun være synlig i dette fellesskapet og vil overstyre den globale profilen din.';

  @override
  String get communityNicknameLabel => 'Kallenavn i fellesskapet';

  @override
  String get perGuildPremiumUpsellText =>
      'Tilpasning av din avatar, banner, aksentfarge og biografi for individuelle fellesskap krever Plutonium. Kallenavn og pronomen i fellesskap er gratis for alle.';

  @override
  String get avatarModeInherit => 'Bruk global profil';

  @override
  String get avatarModeCustom => 'Bruk egendefinert bilde';

  @override
  String get avatarModeUnset => 'Ikke vis';

  @override
  String get profileSavedToast => 'Profil oppdatert';

  @override
  String get profileEditButton => 'Rediger profil';

  @override
  String get profileNoteLabel => 'Notat';

  @override
  String get profileNoteVisibility => '(kun synlig for deg)';

  @override
  String get profileNoteEmpty => 'Ingen notat ennå.';

  @override
  String get sudoTitle => 'Bekreft identiteten din';

  @override
  String get sudoDescription =>
      'Denne handlingen krever bekreftelse for å fortsette.';

  @override
  String get sudoAuthenticatorCode => 'Autentiseringskode';

  @override
  String get sudoMethodPassword => 'Passord';

  @override
  String get sudoMethodTotp => 'Autentisering';

  @override
  String get sudoVerificationFailed => 'Bekreftelse mislyktes. Prøv igjen.';

  @override
  String get securityAccountTitle => 'Konto';

  @override
  String get securityAccountDescription =>
      'Administrer e-post, passord og kontoinnstillinger';

  @override
  String get securitySectionTitle => 'Sikkerhet';

  @override
  String get securitySectionDescription =>
      'Beskytt kontoen din med tofaktorautentisering og passnøkler';

  @override
  String get securityLoginEmailSectionTitle => 'E-postinnstillinger';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Administrer e-postadressen du bruker for å logge inn på $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'E-postadresse';

  @override
  String get securityLoginNoEmailSet => 'Ingen e-postadresse angitt';

  @override
  String get securityLoginChangeEmail => 'Endre e-post';

  @override
  String get securityLoginAddEmail => 'Legg til e-post';

  @override
  String get securityLoginReveal => 'Vis';

  @override
  String get securityLoginHide => 'Skjul';

  @override
  String get securityLoginPasswordSectionTitle => 'Passord';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Endre passordet ditt for å holde kontoen din sikker';

  @override
  String get securityLoginCurrentPasswordLabel => 'Nåværende passord';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Sist endret: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Sist endret: Aldri';

  @override
  String get securityLoginNoPasswordSet => 'Intet passord angitt';

  @override
  String get securityLoginChangePassword => 'Endre passord';

  @override
  String get securityLoginSetPassword => 'Angi passord';

  @override
  String get passwordChangeTitle => 'Endre passord';

  @override
  String get passwordChangeIntroDescription =>
      'Vi sender en bekreftelseskode til e-postadressen din for å bekrefte identiteten din før du endrer passord.';

  @override
  String get passwordChangeStart => 'Start';

  @override
  String get passwordChangeVerifyTitle => 'Bekreft e-posten din';

  @override
  String get passwordChangeVerifyDescription =>
      'Skriv inn bekreftelseskoden som ble sendt til e-postadressen din.';

  @override
  String get passwordChangeVerificationCode => 'Bekreftelseskode';

  @override
  String get passwordChangeVerify => 'Bekreft';

  @override
  String get passwordChangeNewPasswordTitle => 'Angi nytt passord';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Skriv inn ditt nye passord nedenfor.';

  @override
  String get passwordChangeNewPassword => 'Nytt passord';

  @override
  String get passwordChangeConfirmPassword => 'Bekreft nytt passord';

  @override
  String get passwordChangeSubmit => 'Endre passord';

  @override
  String get passwordChangeSuccess => 'Passord endret';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Passordene stemmer ikke overens';

  @override
  String get passwordChangeInvalidCode => 'Ugyldig eller utløpt kode';

  @override
  String get emailChangeTitle => 'Endre e-post';

  @override
  String get emailChangeIntroDescription =>
      'Vi sender verifiseringskoder for å bekrefte identiteten din før vi endrer e-postadressen din.';

  @override
  String get emailChangeStart => 'Start';

  @override
  String get emailChangeVerifyOriginalTitle => 'Bekreft gjeldende e-post';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Skriv inn verifiseringskoden som ble sendt til din gjeldende e-postadresse.';

  @override
  String get emailChangeNewEmailTitle => 'Skriv inn ny e-post';

  @override
  String get emailChangeNewEmailDescription =>
      'Skriv inn den nye e-postadressen du vil bruke.';

  @override
  String get emailChangeNewEmailLabel => 'Ny e-post';

  @override
  String get emailChangeNewEmailSubmit => 'Send verifiseringskode';

  @override
  String get emailChangeVerifyNewTitle => 'Bekreft ny e-post';

  @override
  String get emailChangeVerifyNewDescription =>
      'Skriv inn verifiseringskoden som ble sendt til din nye e-postadresse.';

  @override
  String get emailChangeSuccess => 'E-post endret';

  @override
  String get emailChangeInvalidCode => 'Ugyldig eller utløpt kode';

  @override
  String get resend => 'Send på nytt';

  @override
  String resendCountdown(int seconds) {
    return 'Send på nytt (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verifiseringskode';

  @override
  String get verify => 'Bekreft';

  @override
  String get enable => 'Aktiver';

  @override
  String get disable => 'Deaktiver';

  @override
  String get delete => 'Slett';

  @override
  String get save => 'Lagre';

  @override
  String get securityTfaSectionTitle => 'Tofaktorautentisering';

  @override
  String get securityTfaSectionDescription =>
      'Legg til et ekstra sikkerhetslag på kontoen din';

  @override
  String get securityTfaAuthenticatorApp => 'Autentiseringsapp';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Tofaktorautentisering er aktivert';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Bruk en autentiseringsapp for å generere koder for tofaktorautentisering';

  @override
  String get securityTfaBackupCodes => 'Sikkerhetskopikoder';

  @override
  String get securityTfaBackupCodesDescription =>
      'Vis og administrer sikkerhetskopikodene dine for kontogjenoppretting';

  @override
  String get securityTfaViewCodes => 'Vis koder';

  @override
  String get securityPasskeysSectionTitle => 'Passnøkler';

  @override
  String get securityPasskeysSectionDescription =>
      'Bruk passnøkler for innlogging uten passord og tofaktorautentisering';

  @override
  String get securityPasskeysRegistered => 'Registrerte passnøkler';

  @override
  String get securityPasskeysNone => 'Ingen passnøkler registrert';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passnøkler',
      one: 'passnøkkel',
    );
    return '$count $_temp0 registrert (maks 10)';
  }

  @override
  String get securityPasskeysAdd => 'Legg til passnøkkel';

  @override
  String securityPasskeysAdded(String date) {
    return 'Lagt til: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Sist brukt: $date';
  }

  @override
  String get securityPasskeysRename => 'Gi nytt navn';

  @override
  String get securityPasskeysDeleteTitle => 'Slett passnøkkel';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Er du sikker på at du vil slette passnøkkelen «$name»?';
  }

  @override
  String get securityPasskeyNameTitle => 'Navngi passnøkkel';

  @override
  String get securityPasskeyNameLabel => 'Passnøkkelnavn';

  @override
  String get securityPasskeyNameHint => 'f.eks. YubiKey, iPhone, Arbeids-PC';

  @override
  String get securityPhoneSectionTitle => 'Telefonnummer';

  @override
  String get securityPhoneSectionDescription =>
      'Administrer telefonnummeret ditt.';

  @override
  String get securityPhoneLabel => 'Telefonnummer';

  @override
  String get securityPhoneNone => 'Ingen telefonnummer lagt til.';

  @override
  String get securityPhoneAdd => 'Legg til telefon';

  @override
  String get securityPhoneRemove => 'Fjern';

  @override
  String get securityPhoneRemoveTitle => 'Fjern telefonnummer';

  @override
  String get securityPhoneRemoveDescription =>
      'Er du sikker på at du vil fjerne telefonnummeret ditt?';

  @override
  String get securityPhoneRemoved => 'Telefonnummer fjernet';

  @override
  String get securityClaimTitle => 'Sikkerhetsfunksjoner';

  @override
  String get securityClaimDescription =>
      'Krev kontoen din for å få tilgang til sikkerhetsfunksjoner som totrinnsbekreftelse og passnøkler.';

  @override
  String get securityVerifyEmailRequired =>
      'Du må bekrefte e-postadressen din før du kan sette opp totrinnsbekreftelse, passnøkler eller SMS-bekreftelse.';

  @override
  String get totpEnableTitle => 'Sett opp autentiseringsapp';

  @override
  String get totpEnableDescription =>
      'Skann QR-koden med autentiseringsappen din for å generere koder for totrinnsbekreftelse.';

  @override
  String get totpEnableCodeLabel => 'Kode';

  @override
  String get totpEnableCodeHint =>
      'Skriv inn 6-sifret kode fra autentiseringsappen din';

  @override
  String get totpEnableSuccess => 'Totrinnsbekreftelse er aktivert';

  @override
  String get totpDisableTitle => 'Fjern autentiseringsapp';

  @override
  String get totpDisableDescription =>
      'Skriv inn 6-sifret kode fra autentiseringsappen din for å deaktivere totrinnsbekreftelse.';

  @override
  String get totpDisableSuccess => 'Totrinnsbekreftelse deaktivert';

  @override
  String get backupCodesTitle => 'Sikkerhetskopikoder';

  @override
  String get backupCodesWarning =>
      'Hvis du mister tilgangen til autentiseringsappen din og ikke har disse kodene, vil du bli permanent utestengt fra kontoen din. Last ned eller kopier dem nå og lagre dem et trygt sted.';

  @override
  String get backupCodesDownload => 'Last ned';

  @override
  String get backupCodesCopy => 'Kopier';

  @override
  String get backupCodesCopied =>
      'Sikkerhetskopikoder kopiert til utklippstavlen';

  @override
  String get backupCodesAcknowledge =>
      'Jeg har lastet ned eller kopiert sikkerhetskopikodene mine og lagret dem på et trygt sted.';

  @override
  String get backupCodesDone => 'Ferdig';

  @override
  String get backupCodesViewTitle => 'Vis sikkerhetskopikoder';

  @override
  String get backupCodesViewDescription =>
      'Bekreftelse kan være nødvendig før visning av sikkerhetskopikodene dine.';

  @override
  String get phoneAddTitle => 'Legg til telefonnummer';

  @override
  String get phoneAddLabel => 'Telefonnummer';

  @override
  String get phoneAddHint => 'Skriv inn telefonnummeret ditt';

  @override
  String get phoneAddFooter =>
      'Skriv inn telefonnummeret ditt. Vi sender deg en bekreftelseskode via SMS.';

  @override
  String get phoneAddSendCode => 'Send kode';

  @override
  String get phoneVerifyTitle => 'Bekreft telefonnummer';

  @override
  String get phoneVerifyDescription =>
      'Skriv inn bekreftelseskoden som ble sendt til telefonnummeret ditt.';

  @override
  String get phoneAddSuccess => 'Telefonnummer lagt til';

  @override
  String get phoneCountryLabel => 'Land';

  @override
  String get phoneSearchCountries => 'Søk land ...';

  @override
  String get phoneNumberRequired => 'Telefonnummer er påkrevd';

  @override
  String get phoneEnterValidNumber => 'Skriv inn et gyldig mobilnummer.';

  @override
  String get phoneCannotBeUsed =>
      'Dette telefonnummeret kan ikke brukes. Prøv et annet mobilnummer eller kontakt kundestøtte.';

  @override
  String get phoneAlreadyUsed =>
      'Dette telefonnummeret er allerede i bruk. Prøv et annet nummer eller kontakt kundestøtte.';

  @override
  String get phoneCodeDidNotWork =>
      'Koden fungerte ikke. Sjekk den og prøv igjen.';

  @override
  String get phoneTooManyAttempts =>
      'For mange forsøk. Vent litt, og prøv igjen.';

  @override
  String get phoneSmsUnavailable =>
      'SMS-verifisering er utilgjengelig akkurat nå. Prøv igjen senere, eller kontakt kundestøtte.';

  @override
  String get phoneNotEligible =>
      'Telefonverifisering er ikke tilgjengelig for denne kontoen. Bruk en annen metode eller kontakt kundestøtte.';

  @override
  String get phoneCaptchaRequired =>
      'En nettlesersjekk kreves før telefonverifisering. Prøv igjen fra påloggingssiden eller kontakt kundestøtte.';

  @override
  String get phoneSomethingWentWrong => 'Noe gikk galt. Prøv igjen.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Å sende en SMS til dette telefonnummeret er for dyrt, så vi trenger at du sender oss en SMS i stedet. Du kan også kontakte kundestøtte for å få oss til å fjerne dette kravet fra kontoen din.';

  @override
  String get phoneInboundDefaultDescription =>
      'Vi trenger at du sender oss en SMS for å bekrefte telefonnummeret ditt.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Åpne telefonens meldingsapp og opprett en ny tekstmelding.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Send koden $code til $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Vent på at vi mottar meldingen din. Dette kan ta et minutt.';

  @override
  String get phoneInboundGetNewCode => 'Få ny kode';

  @override
  String get phoneInboundChallengeCodeLabel => 'Kode som skal sendes';

  @override
  String get phoneInboundOurNumberLabel => 'Send til';

  @override
  String get requiredActionTitle => 'Kontoverifisering kreves';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Fullfør den påkrevde bekreftelsen for å fortsette å bruke $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Registreringen din krever en ekstra antispam-sjekk før du kan fortsette.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Bekreft e-posten eller telefonnummeret ditt for å fortsette å bruke $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Fullfør de obligatoriske trinnene for e-post- og telefonverifisering nedenfor for å fortsette å bruke $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Velg en bekreftelsesmetode';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Fullfør en av bekreftelsesmetodene nedenfor for å fortsette å bruke $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Bruk e-post';

  @override
  String get requiredActionUsePhone => 'Bruk telefon';

  @override
  String get requiredActionCheckEmailTitle => 'Sjekk e-posten din';

  @override
  String get requiredActionCheckEmailDescription =>
      'Vi sendte en bekreftelseslenke til e-postadressen din. Åpne den for å fortsette.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Send verifiserings­e-post på nytt';

  @override
  String get requiredActionVerificationEmailSent =>
      'E-post for bekreftelse er sendt. Sjekk innboksen din.';

  @override
  String get requiredActionSignOut => 'Logg ut';

  @override
  String get dangerZoneSectionTitle => 'Fare-sone';

  @override
  String get dangerZoneSectionDescription =>
      'Uopprettelige og destruktive handlinger';

  @override
  String get dangerZoneDisableTitle => 'Deaktiver konto';

  @override
  String get dangerZoneDisableDescription =>
      'Deaktiver kontoen din midlertidig. Du kan reaktivere den senere ved å logge inn igjen.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Deaktivering av kontoen din vil logge deg ut av alle økter. Du kan reaktivere kontoen din når som helst ved å logge inn igjen.';

  @override
  String get dangerZoneDeleteTitle => 'Slett konto';

  @override
  String get dangerZoneDeleteDescription =>
      'Slett kontoen din og alle tilhørende data permanent. Denne handlingen kan ikke angres.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Avbryt ditt aktive Plutonium-abonnement i Plutonium-innstillingene før du sletter kontoen din.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Kan ikke slette konto';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Du kan ikke slette kontoen din mens du eier fellesskap. Overfør eierskap av følgende fellesskap først:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'og $count til';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'For å overføre eierskap, gå til $settingsPath og bruk alternativet for å overføre eierskap.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Er du sikker på at du vil slette kontoen din? Denne handlingen vil planlegge kontoen din for permanent sletting.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Du kan avbryte sletteprosessen innen 14 dager';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Etter 14 dager vil kontoen din bli slettet permanent';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Når slettingen er behandlet, kan du ikke gjenopprette tilgangen til kontoen din';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Du vil ikke kunne slette sendte meldinger etter at kontoen din er slettet';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Hvis du vil eksportere dataene dine eller slette meldingene dine først, vennligst besøk delen Personverndashbord i Brukerinnstillinger før du fortsetter.';

  @override
  String get claimAccountTitle => 'Krev kontoen din';

  @override
  String get claimAccountDescription =>
      'Krev kontoen din ved å legge til en e-postadresse og et passord. Vi sender en bekreftelseskode for å bekrefte e-postadressen din før vi fullfører.';

  @override
  String get claimAccountEmailLabel => 'E-post';

  @override
  String get claimAccountPasswordLabel => 'Passord';

  @override
  String get claimAccountSendCode => 'Send kode';

  @override
  String get claimAccountVerifyDescription =>
      'Skriv inn koden vi sendte til e-posten din for å verifisere den. Passordet ditt blir satt når koden er bekreftet.';

  @override
  String get claimAccountSuccess => 'Kontoen ble hevdet';

  @override
  String get importantInformation => 'Viktig informasjon:';

  @override
  String get genericError => 'En feil oppstod';

  @override
  String get networkErrorMessage => 'Noe gikk galt. Prøv igjen.';

  @override
  String get invalidCode => 'Ugyldig kode';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count år siden',
      one: '1 år siden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count måneder siden',
      one: '1 måned siden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dager siden',
      one: '1 dag siden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count timer siden',
      one: '1 time siden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutter siden',
      one: '1 minutt siden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uker siden',
      one: '1 uke siden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count minutter',
      one: 'om 1 minutt',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count timer',
      one: 'om 1 time',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count dager',
      one: 'om 1 dag',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count uker',
      one: 'om 1 uke',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count måneder',
      one: 'om 1 måned',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count år',
      one: 'om 1 år',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'akkurat nå';

  @override
  String get authorizedAppsTitle => 'Autoriserte applikasjoner';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Disse applikasjonene har fått tilgang til $productName-kontoen din.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Ingen autoriserte applikasjoner';

  @override
  String get authorizedAppsEmptyDescription =>
      'Du har ikke autorisert noen applikasjoner til å få tilgang til kontoen din.';

  @override
  String get authorizedAppsLoadError =>
      'Kunne ikke laste autoriserte applikasjoner';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorisert den $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Tillatelser gitt';

  @override
  String get authorizedAppsRevoke => 'Fjern';

  @override
  String get authorizedAppsRevokeTitle => 'Fjern applikasjonstilgang';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Er du sikker på at du vil fjerne tilgangen for $appName? Denne applikasjonen vil ikke lenger ha tilgang til kontoen din.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Få tilgang til grunnleggende profilinformasjon (brukernavn, avatar osv.)';

  @override
  String get authorizedAppsScopeEmail => 'Se e-postadressen din';

  @override
  String get authorizedAppsScopeGuilds => 'Se fellesskapene du er medlem av';

  @override
  String get authorizedAppsScopeConnections => 'Se dine tilkoblede kontoer';

  @override
  String get authorizedAppsScopeBot =>
      'Legg til en bot i et fellesskap med forespurte tillatelser';

  @override
  String get authorizedAppsScopeAdmin =>
      'Få tilgang til administrative endepunkter';

  @override
  String get privacyPendingDeletionTitle => 'Venter på sletting';

  @override
  String get blockedUsersTitle => 'Blokkerte brukere';

  @override
  String get blockedUsersDescription =>
      'Blokkerte brukere kan ikke sende deg venneforespørsler eller meldinger direkte.';

  @override
  String get blockedUsersEmptyTitle => 'Ingen blokkerte brukere';

  @override
  String get blockedUsersEmptyDescription => 'Du har ikke blokkert noen ennå.';

  @override
  String get blockedUsersLoadError => 'Kunne ikke laste blokkerte brukere';

  @override
  String get blockedUsersUnblock => 'Fjern blokkering';

  @override
  String get blockedUsersUnblockTitle => 'Fjern blokkering av bruker';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Er du sikker på at du vil fjerne blokkeringen av $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopier Brukernavn';

  @override
  String get blockedUsersCopyId => 'Kopier bruker-ID';

  @override
  String get userProfileLoadError => 'Kunne ikke laste profil';

  @override
  String get userProfileLoading => 'Laster inn profil';

  @override
  String get userProfileRetry => 'Prøv igjen';

  @override
  String get userProfileMessage => 'Melding';

  @override
  String get userProfileVoiceCall => 'Talepost';

  @override
  String get userProfileVideoCall => 'Videosamtale';

  @override
  String get userProfileEditProfile => 'Rediger profil';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName-ansatt';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName fellesskapsteam';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName-partner';
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
    return '$productName Plutonium-abonnent siden $date';
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
    return '$productName Visionary siden $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Felles venner ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Felles fellesskap ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Felles venner';

  @override
  String get userProfileMutualCommunitiesTitle => 'Felles fellesskap';

  @override
  String get userProfileNoMutualFriends => 'Ingen felles venner funnet.';

  @override
  String get userProfileNoMutualCommunities =>
      'Ingen felles fellesskap funnet.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Kallenavn: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Åpne DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Du blokkerte $username. Du kan ikke sende meldinger med mindre du fjerner blokkeringen.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Fjern blokkering';

  @override
  String get userProfileOpenDm => 'Åpne DM';

  @override
  String get userProfileNoteTitle => 'Notat';

  @override
  String get userProfileNoteVisibility => '(kun synlig for deg)';

  @override
  String get userProfileNoteSave => 'Lagre';

  @override
  String get userProfileNoteDelete => 'Slett';

  @override
  String get userProfileNoteEmpty => 'Klikk for å legge til et notat';

  @override
  String get userProfileMemberSince => 'Medlem siden';

  @override
  String get userProfileAboutMe => 'Om meg';

  @override
  String get userProfileRoles => 'Roller';

  @override
  String get memberRoleAdd => 'Legg til rolle';

  @override
  String memberRoleRemove(String roleName) {
    return 'Fjern rolle $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Denne brukeren har ingen roller i dette fellesskapet.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Ingen roller ennå. Legg til roller i $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Ingen roller tilgjengelig';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Det er ingen roller å tildele i dette fellesskapet for øyeblikket, men du kan opprette en ny rolle i $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Fellesskapsinnstillinger';

  @override
  String get guildSettingsRolesTab => 'Roller';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Lokal tid';

  @override
  String get userProfileSameTimeAsYou => 'Samme tidssone som deg';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration foran deg';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration bak deg';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours timer',
      one: '1 time',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutter',
      one: '1 minutt',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours timer',
      one: '1 time',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutter',
      one: '1 minutt',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Kopier brukernavn';

  @override
  String get userProfileCopyUserId => 'Kopier bruker-ID';

  @override
  String get userProfileViewMainProfile => 'Vis hovedprofil';

  @override
  String get userProfileViewCommunityProfile => 'Vis fellesskapsprofil';

  @override
  String get userProfileBlockUser => 'Blokker bruker';

  @override
  String get userProfileUnblockUser => 'Fjern blokkering av bruker';

  @override
  String get userProfileRemoveFriend => 'Fjern venn';

  @override
  String get userProfileBlockConfirmTitle => 'Blokker bruker';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Er du sikker på at du vil blokkere $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Fjern blokkering av bruker';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Er du sikker på at du vil fjerne blokkeringen av $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Fjern venn';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Er du sikker på at du vil fjerne $username som venn?';
  }

  @override
  String get userProfileFailedOpenDm => 'Kunne ikke åpne DM';

  @override
  String get userProfileFailedSaveNote => 'Kunne ikke lagre notat';

  @override
  String get userProfileActionFailed => 'Handlingen mislyktes, prøv igjen';

  @override
  String get userProfileChangeNickname => 'Endre kallenavn';

  @override
  String get userProfileKick => 'Kjenn ut';

  @override
  String get userProfileBan => 'Bannlys';

  @override
  String get userProfileTimeout => 'Tidsavbrudd';

  @override
  String get userProfileRemoveTimeout => 'Fjern tidsavbrudd';

  @override
  String get userProfileTransferOwnership => 'Overfør eierskap';

  @override
  String get userProfileReportUser => 'Rapporter bruker';

  @override
  String get userProfileReportMessage => 'Rapporter melding';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Kjenn ut $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Er du sikker på at du vil kjenne ut $username? De kan bli med igjen med en ny invitasjon.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Fjern tidsavbrudd?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Fjerning av tidsavbruddet vil tillate $username å sende meldinger, reagere og bli med i stemmekanaler igjen.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Overfør eierskap?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Overfør eierskap av dette fellesskapet til $username? Dette er ugjenkallelig, og du vil miste alle eierprivilegier.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Bannlys $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Varighet av bannlysning';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Egendefinert varighet (sekunder)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Alle verdier fra $min til $max sekunder';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Slett meldingshistorikk';

  @override
  String get userProfileBanDeleteNone => 'Ikke slett noen';

  @override
  String get userProfileBanDelete24h => 'Siste 24 timer';

  @override
  String get userProfileBanDelete7d => 'Siste 7 dager';

  @override
  String get userProfileBanReasonLabel => 'Årsak (valgfritt)';

  @override
  String get userProfileBanReasonHint => 'Skriv inn en årsak for bannlysningen';

  @override
  String get userProfileBanSubmit => 'Bannlys medlem';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Tidsavbrudd for $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Varighet av tidsavbrudd';

  @override
  String get userProfileTimeoutSubmit => 'Tidsavbrudd for medlem';

  @override
  String get userProfileNicknameLabel => 'Kallenavn';

  @override
  String get userProfileNicknameHint => 'Skriv inn et kallenavn';

  @override
  String get userProfileNicknameSave => 'Lagre';

  @override
  String userProfileKickSuccess(String username) {
    return 'Sparket $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Bannlyst $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Tidsavbrudd for $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Fjernet tidsavbrudd for $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Kallenavn oppdatert';

  @override
  String get userProfileTransferSuccess => 'Eierskap overført';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 sekunder';

  @override
  String get duration5Minutes => '5 minutter';

  @override
  String get duration10Minutes => '10 minutter';

  @override
  String get duration1Hour => '1 time';

  @override
  String get duration12Hours => '12 timer';

  @override
  String get duration1Day => '1 dag';

  @override
  String get duration3Days => '3 dager';

  @override
  String get duration5Days => '5 dager';

  @override
  String get duration1Week => '1 uke';

  @override
  String get duration2Weeks => '2 uker';

  @override
  String get duration1Month => '1 måned';

  @override
  String get durationCustom => 'Egendefinert…';

  @override
  String get iarReportUserTitle => 'Rapporter bruker';

  @override
  String get iarReportGuildTitle => 'Rapporter fellesskap';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Hvis denne rapporten gjelder en spesifikk melding i dette fellesskapet, rapporter heller den meldingen. Melderapporter gir sikkerhetsteamet vårt den tydeligste konteksten, og det å legge til detaljer i kommentarene kan hjelpe oss med å gjennomgå den raskere. Fortsett kun med å rapportere fellesskapet som helhet hvis rapportering av en melding ikke ville fange opp det bredere problemet.';

  @override
  String get iarContinueToReportCommunity => 'Fortsett å rapportere fellesskap';

  @override
  String get iarPreviewCommunitySubtitle => 'Fellesskap';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Trakassering eller målrettet misbruk';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Fellesskap legger til rette for hets eller målrettet misbruk.';

  @override
  String get iarReasonHateGuildDescription =>
      'Fremmer hat mot beskyttede grupper.';

  @override
  String get iarReasonTerrorismLabel => 'Terrorisme eller voldelig ekstremisme';

  @override
  String get iarReasonTerrorismDescription =>
      'Fremmer, rekrutterer til eller koordinerer voldelig ekstremistisk aktivitet.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Voksent innhold eller usikker portkontroll';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Voksent innhold uten riktig aldersgrense.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Setter mindreårige i fare eller inneholder innhold som utnytter barn.';

  @override
  String get iarReasonRaidLabel => 'Raidkoordinering';

  @override
  String get iarReasonRaidDescription =>
      'Koordinerer raid, brigading eller trakassering mot personer eller grupper.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Fellesskapet eksisterer for å spamme, svindle eller misbruke plattformen.';

  @override
  String get iarReasonMalwareGuildLabel =>
      'Distribusjon av skadelig programvare';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distribuerer skadelig programvare, stjeler innloggingsinformasjon eller skadelige filer.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Personvernbrudd eller doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Deler personlig informasjon, forfølger brukere eller koordinerer misbruk av personvern.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Oppmuntring til selvskading';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Oppmuntring til selvmord, selvskading eller spiseforstyrrelser.';

  @override
  String get iarReasonInappropriateProfile => 'Upassende profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Denne brukerens profil inneholder upassende innhold';

  @override
  String typingIndicatorOne(String name) {
    return '$name skriver...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 og $name2 skriver...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 og $name3 skriver...';
  }

  @override
  String get typingIndicatorMultiple => 'Flere skriver...';

  @override
  String get typingIndicatorHandful => 'En håndfull tastaturkrigere samles...';

  @override
  String get typingIndicatorSymphony => 'En symfoni av tastetrykk er i gang...';

  @override
  String get typingIndicatorFiesta =>
      'Det er en fullverdig skrivefiesta her inne';

  @override
  String get typingIndicatorApocalypse => 'Oi, det er en skrive-apokalypse';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Glad du er her, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Velkommen, $username! Føl deg som hjemme.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hei, $username! Hyggelig å ha deg her.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hei, $username! Hopp inn når du er klar.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hei $username, hyggelig å se deg her!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hei der, $username! Håper du liker oppholdet.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hei, $username, velkommen om bord!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Glad du kom deg hit, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Velkommen inn, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Velkommen, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Velkommen, $username! Vi er glade for at du er her.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Velkommen, $username! Håper du liker tiden din her.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Velkommen, $username! Din neste samtale starter her.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Velkommen, $username. Vi er glade for å ha deg her.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Hyggelig å se deg, $username! Velkommen inn.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Du er her, $username! Hyggelig å ha deg med oss.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Du har ankommet, $username! La oss komme i gang.';
  }

  @override
  String get relativeTimeShortNow => 'nå';

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
      other: '${count}t',
      one: '1t',
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
      other: '${count}mnd',
      one: '1mnd',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countå',
      one: '1å',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Mine enheter';

  @override
  String get linkedDevicesDescription =>
      'Se alle enheter som er logget inn på kontoen din. Trekk tilbake økter du ikke kjenner igjen.';

  @override
  String get linkedDevicesCurrentDevice => 'Nåværende enhet';

  @override
  String get linkedDevicesOtherDevices => 'Andre enheter';

  @override
  String get linkedDevicesEnterSelection => 'Gå inn i valgmodus';

  @override
  String get linkedDevicesExitSelection => 'Avslutt valgmodus';

  @override
  String get linkedDevicesSelectAll => 'Velg alle';

  @override
  String get linkedDevicesClearSelection => 'Fjern valg';

  @override
  String get linkedDevicesRevokeTooltip => 'Trekk tilbake enhet';

  @override
  String get linkedDevicesSignOutAll => 'Logg ut alle andre enheter';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Logg ut $count enheter',
      one: 'Logg ut 1 enhet',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Logg ut $count enheter',
      one: 'Logg ut 1 enhet',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Logg ut alle andre enheter';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Dette vil logge ut de valgte enhetene fra kontoen din. Du må logge inn igjen på disse enhetene.',
      one:
          'Dette vil logge ut den valgte enheten fra kontoen din. Du må logge inn igjen på den enheten.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Dette vil logge ut de valgte enhetene fra kontoen din. Du må logge inn igjen på disse enhetene.';

  @override
  String get linkedDevicesSignOutConfirm => 'Fortsett';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Du må logge inn igjen på alle utloggede enheter';

  @override
  String get linkedDevicesLoadErrorTitle => 'Nettverksfeil';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Vi har problemer med å koble til tid-rom-kontinuumet. Vennligst sjekk tilkoblingen din og prøv igjen.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Enheter trukket tilbake',
      one: 'Enhet trukket tilbake',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Kunne ikke logge ut. Prøv igjen.';

  @override
  String get linkedDevicesUnknownOs => 'Ukjent OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Ukjent plattform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration sakte-modus';
  }

  @override
  String get slowmodeTooltipActive =>
      'Du er i sakte-modus. Vennligst vent før du sender en ny melding.';

  @override
  String get slowmodeTooltipImmune =>
      'Sakte-modus er aktivert, men du er immun.';

  @override
  String get slowmodeStatusEnabled => 'Sakte modus er aktivert';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Sakte modus er aktiv ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Sakte modus er satt til $durationLabel, men du er unntatt.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Sakte modus er satt til $durationLabel. Vent før du sender en ny melding.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Sakte modus er satt til $durationLabel for denne kanalen.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Du kan ikke sende meldinger i denne kanalen.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Systemkunngjøringer fra $productName-ansatte. Du kan ikke svare her.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Meldinger er midlertidig satt på pause i dette fellesskapet.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Du er tidsavbrutt. Meldinger, reaksjoner og tale er satt på pause til tidsavbruddet utløper.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Du må gjøre krav på kontoen din for å sende meldinger i dette fellesskapet.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Du må bekrefte e-postadressen din for å sende meldinger i dette fellesskapet.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Kontoen din er for ny til å sende meldinger i dette fellesskapet.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Du har ikke vært medlem av dette fellesskapet lenge nok til å sende meldinger.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Du må bekrefte et telefonnummer for å sende meldinger i dette fellesskapet.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Bekreft e-post';

  @override
  String get channelComposerBarrierVerifyPhone => 'Bekreft telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'For mange vedlegg (maks $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName overskrider størrelsesgrensen ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Disse filene er for store til å sendes sammen';

  @override
  String get chatAttachmentDropToUpload => 'Slipp filer for å laste opp';

  @override
  String get chatAttachmentDropToSend => 'Slipp filer for å sende nå';

  @override
  String get chatAttachmentSendVoiceMessage => 'Send talemelding';

  @override
  String get voiceMessageTitle => 'Talemelding';

  @override
  String get voiceMessageHoldHint =>
      'Hold for å ta opp. Dra opp for å låse, eller slipp for å sende.';

  @override
  String get voiceMessageDiscard => 'Forkast talemelding';

  @override
  String get voiceMessageSend => 'Send talemelding';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Kan ikke starte opptak. Tillat tilgang til mikrofon.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Taleregistrering støttes ikke på denne enheten.';

  @override
  String get voiceMessageMicInUse =>
      'Forlat anropet for å ta opp en talemelding.';

  @override
  String get voiceMessageRecordingFailed => 'Opptak mislyktes. Prøv igjen.';

  @override
  String get voiceMessageSendFailed =>
      'Kan ikke sende talemelding. Prøv igjen.';

  @override
  String get voiceMessageRecordingHint =>
      'Snakk nå. Trykk Stopp når du er ferdig – du kan trimme etterpå.';

  @override
  String get voiceMessageReviewHint =>
      'Dra i håndtakene for å trimme, trykk deretter Send.';

  @override
  String get voiceMessageStop => 'Stopp';

  @override
  String get voiceMessageStartRecording => 'Start opptak';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Spill av';

  @override
  String get voiceMessagePause => 'Pause';

  @override
  String get voiceMessageSeekForward => 'Spol fremover';

  @override
  String get voiceMessageSeekBackward => 'Spol tilbake';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Valget må være minst ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Rediger vedlegg';

  @override
  String get chatAttachmentFilenameLabel => 'Filnavn';

  @override
  String get chatAttachmentDescriptionLabel => 'Beskrivelse';

  @override
  String get chatAttachmentDescriptionHint => 'Valgfri alt-tekst';

  @override
  String get chatAttachmentSpoilerLabel => 'Merk som spoiler';

  @override
  String get chatAttachmentRemove => 'Fjern vedlegg';

  @override
  String get chatAttachmentDownload => 'Last ned';

  @override
  String get chatAttachmentDownloadedToast => 'Lagret i bilder';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Kunne ikke laste ned vedlegg';

  @override
  String get chatAttachmentExpiredTooltip => 'Vedlegg utløpt';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vis ($count linjer)',
      one: 'Vis ($count linje)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skjul ($count linjer)',
      one: 'Skjul ($count linje)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vis ($count rader)',
      one: 'Vis ($count rad)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skjul ($count rader)',
      one: 'Skjul ($count rad)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count linjer igjen)',
      one: '... ($count linje igjen)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rader igjen)',
      one: '... ($count rad igjen)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Vis hele filen';

  @override
  String get chatTextualPreviewChangeLanguage => 'Endre språk';

  @override
  String get chatTextualPreviewSearchLanguage => 'Søk etter språk…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntaksutheving';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Ingen resultater funnet';

  @override
  String get chatTextualPreviewMoreOptions => 'Flere alternativer';

  @override
  String get chatTextualPreviewWrapText => 'Bryt tekst';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Filen er for stor for forhåndsvisning (grense $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Kan ikke laste inn forhåndsvisning.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Ren tekst';

  @override
  String get chatTextualPreviewCopy => 'Kopier';

  @override
  String get chatAttachmentSourceGallery => 'Galleri';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Bla gjennom filer';

  @override
  String get chatAttachmentPasteTooltip => 'Lim inn bilde fra utklippstavlen';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Vis spoiler';

  @override
  String get matureMediaRevealButton => 'Vis';

  @override
  String get matureMediaRevealHint => 'Klikk for å vise';

  @override
  String get matureContentTitle => 'Modent innhold';

  @override
  String get matureCommunityTitle => 'Moden fellesskap';

  @override
  String get matureCategoryTitle => 'Moden kategori';

  @override
  String get matureChannelTitle => 'Moden kanal';

  @override
  String get communityContentWarningTitle => 'Innholdsadvarsel for fellesskap';

  @override
  String get categoryContentWarningTitle => 'Innholdsadvarsel for kategori';

  @override
  String get channelContentWarningTitle => 'Innholdsadvarsel for kanal';

  @override
  String get defaultContentWarningBody => 'Dette inneholder sensitivt innhold.';

  @override
  String get matureCommunityBody =>
      'Dette fellesskapet er merket for modent innhold og kan inneholde materiale som kan være upassende for noen brukere.';

  @override
  String get matureCategoryBody =>
      'Denne kategorien er merket for modent innhold og kan inneholde materiale som kan være upassende for noen brukere.';

  @override
  String get matureChannelBody =>
      'Denne kanalen er merket for modent innhold og kan inneholde materiale som kan være upassende for noen brukere.';

  @override
  String get matureVoiceChannelBody =>
      'Denne stemmekanalen er merket for modent innhold og kan inneholde materiale som kan være upassende for noen brukere.';

  @override
  String get matureLinkChannelBody =>
      'Denne lenkekanalen er merket for modent innhold og kan åpne materiale som kan være upassende for noen brukere.';

  @override
  String get matureCommunityUnavailableBody =>
      'Dette modne fellesskapet er ikke tilgjengelig for kontoen din.';

  @override
  String get matureCategoryUnavailableBody =>
      'Denne modne kategorien er ikke tilgjengelig for kontoen din.';

  @override
  String get matureChannelUnavailableBody =>
      'Denne modne kanalen er ikke tilgjengelig for kontoen din.';

  @override
  String get matureContentProceedButton => 'Fortsett';

  @override
  String get matureContentUnderstandButton => 'Jeg forstår';

  @override
  String get matureContentOpenLinkButton => 'Åpne lenke';

  @override
  String get sensitiveContentSectionTitle => 'Sensitivt innhold';

  @override
  String get sensitiveContentSectionDescription =>
      'Kontroller hvordan modne eller sensitive medier filtreres i forskjellige sammenhenger';

  @override
  String get sensitiveContentFriendDmLabel => 'Direktemeldinger fra venner';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Direktemeldinger fra andre';

  @override
  String get sensitiveContentGuildLabel => 'Meldinger i fellesskapskanaler';

  @override
  String get sensitiveContentFilterShow => 'Vis';

  @override
  String get sensitiveContentFilterBlur => 'Uskarphet';

  @override
  String get sensitiveContentFilterBlock => 'Blokker';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Uskarphet medier til sikkerhetsskanning er fullført';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Når aktivert, blir bilder og videoer uskarpe til innholdssikkerhetsskanningen er ferdig.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Denne innstillingen er alltid på for kontoen din.';

  @override
  String get sensitiveContentResetButton => 'Tilbakestill';

  @override
  String get sensitiveContentSaveButton => 'Lagre';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
    );
    return 'Laster opp $_temp0';
  }

  @override
  String get chatCancelUpload => 'Avbryt opplasting';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Utløper $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Utløper mellom $start og $end';
  }

  @override
  String get connectionsTitle => 'Tilkoblinger';

  @override
  String connectionsDescription(String productName) {
    return 'Koble eksterne kontoer og domener til $productName-profilen din. Verifiserte tilkoblinger vil bli vist på profilen din for andre å se.';
  }

  @override
  String get connectionsEmptyTitle => 'Ingen tilkoblinger ennå';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Koble til Bluesky-kontoen din eller verifiser domene-eierskap for å vise dem på profilen din.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifiser domene-eierskap for å vise det på profilen din.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domene';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Legg til Bluesky-tilkobling';

  @override
  String get connectionsAddDomainAriaLabel => 'Legg til domenetilkobling';

  @override
  String get connectionEdit => 'Rediger';

  @override
  String get connectionRemove => 'Fjern';

  @override
  String get connectionVerifiedLabel => 'Denne tilkoblingen er verifisert.';

  @override
  String get connectionUnverifiedLabel =>
      'Denne tilkoblingen er ikke verifisert.';

  @override
  String get connectionAddTitle => 'Legg til tilkobling';

  @override
  String get connectionTypeLabel => 'Tilkoblingstype';

  @override
  String get connectionHandleLabel => 'Håndtak';

  @override
  String get connectionDomainLabel => 'Domene';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Du har allerede denne tilkoblingen.';

  @override
  String get connectionConnectBluesky => 'Koble til med Bluesky';

  @override
  String get connectionContinue => 'Fortsett';

  @override
  String get connectionVerifyTitle => 'Bekreft tilkobling';

  @override
  String get connectionVerifyInstructions =>
      'Bruk oppføringen nedenfor for å bevise domeneeierskap.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT-oppføring';

  @override
  String get connectionDnsHostLabel => 'Vert';

  @override
  String get connectionDnsValueLabel => 'Verdi';

  @override
  String get connectionCopyHost => 'Kopier vert';

  @override
  String get connectionCopyValue => 'Kopier verdi';

  @override
  String get connectionCopied => 'Kopiert!';

  @override
  String get connectionTokenFileTitle => 'Server token-filen';

  @override
  String get connectionTokenFileDescription =>
      'Last ned **fluxer-verification** og plasser den i **.well-known**-mappen din slik at vi kan validere domenet.';

  @override
  String get connectionTokenFileDownload => 'Last ned fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Filen inneholder verifikasjonstokenet vi vil hente fra **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Lagre fluxer-verification';

  @override
  String get connectionVerifyButton => 'Bekreft';

  @override
  String get connectionBack => 'Tilbake';

  @override
  String get connectionEditTitle => 'Rediger tilkobling';

  @override
  String get connectionEditDescription =>
      'Velg hvem som kan se denne tilkoblingen på profilen din.';

  @override
  String get connectionVisibilityEveryone => 'Alle';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Tillat at hvem som helst kan se denne tilkoblingen på profilen din';

  @override
  String get connectionVisibilityFriends => 'Venner';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Tillat vennene dine å se denne tilkoblingen';

  @override
  String get connectionVisibilityCommunityMembers => 'Fellesskapsmedlemmer';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Tillat medlemmer fra fellesskap du er med i å se denne tilkoblingen';

  @override
  String get connectionRemoveTitle => 'Fjern tilkobling';

  @override
  String get connectionRemoveDescription =>
      'Er du sikker på at du vil fjerne denne tilkoblingen? Denne handlingen kan ikke angres.';

  @override
  String get connectionRemoveConfirm => 'Fjern';

  @override
  String get connectionsLoadError => 'Kunne ikke laste tilkoblinger';

  @override
  String get connectionsReorderError => 'Kunne ikke oppdatere rekkefølge';

  @override
  String get connectionInitiateFailed =>
      'Kunne ikke starte verifisering. Prøv igjen.';

  @override
  String get connectionVerifyFailed =>
      'Kunne ikke verifisere. Sjekk DNS-oppføringen din og prøv igjen.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Kunne ikke starte Bluesky-autorisasjon.';

  @override
  String get connectionUpdateFailed => 'Kunne ikke oppdatere tilkobling';

  @override
  String get connectionRemoveFailed => 'Kunne ikke fjerne tilkobling';

  @override
  String get connectionTokenSavedToast => 'Lagret fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Kunne ikke lagre fil';

  @override
  String get connectionEnterHandle => 'Skriv inn et Bluesky-håndtak.';

  @override
  String get connectionEnterDomain => 'Skriv inn et domene.';

  @override
  String get lookAndFeelTitle => 'Utseende';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Velg mellom mørkt, kullsvart eller lyst utseende.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Høyt dynamisk område';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Kontroller hvordan HDR-bilder vises på HDR-kompatible skjermer.';

  @override
  String get lookAndFeelHdrFullName => 'Fullt dynamisk område';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Vis HDR-bilder med full lysstyrke og fargespekter.';

  @override
  String get lookAndFeelHdrStandardName => 'Standardområde';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Tonekartlegg HDR-bilder til standardområdet, noe som reduserer maksimal lysstyrke.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Visningsmodus for høyt dynamisk område';

  @override
  String get lookAndFeelThemeDark => 'Mørkt tema';

  @override
  String get lookAndFeelThemeCoal => 'Kullsvart tema';

  @override
  String get lookAndFeelThemeLight => 'Lyst tema';

  @override
  String get lookAndFeelThemeSystem => 'Systemtema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synkroniser tema på tvers av enheter';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Når aktivert, synkroniseres temainnstillinger til alle enhetene dine. Når deaktivert, vil denne enheten bruke sin egen temainnstilling.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Systemtema deaktiverer automatisk synkronisering for å spore systemets preferanser på denne enheten.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Kunne ikke synkronisere tema til kontoen din. Prøv igjen.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Skalering av chat-skrift';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Juster skriftstørrelsen i chat-området.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Skriftstørrelse for chat';

  @override
  String get lookAndFeelAppZoomTitle => 'App-zoomnivå';

  @override
  String get lookAndFeelAppZoomDescription => 'Juster appens zoomnivå.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Bakgrunnsbilde for samtale';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Velg en bakgrunn for chatten. Denne beholdes på denne enheten.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Denne innstillingen beholdes på denne enheten';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Chatbakgrunn lagres kun på denne enheten og synkroniseres ikke til andre enheter.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Standard';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Egendefinert bilde';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Farge $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradient $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Dempet bakgrunn';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Kunne ikke angi bildet som bakgrunn.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Meldinger';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Velg hvordan meldinger vises i chatkanaler.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Avstand mellom meldingsgrupper';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Meldingsvisning';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Komfortabel';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Romslig layout med tydelig visuell separasjon mellom meldinger.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Kompakt';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maksimerer synlige meldinger med minimal avstand.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Skjul brukeravatarer';

  @override
  String get lookAndFeelInterfaceTitle => 'Grensesnitt';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Tilpass grensesnittelementer og atferd.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Skriveindikatorer i kanallisten';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Velg hvordan skriveindikatorer vises i kanallisten når noen skriver i en kanal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Skriveindikator + avatarer';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Vis skriveindikator med brukeravatarer i kanallisten';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'Kun skriveindikator';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Vis kun skriveindikatoren uten avatarer';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Skjult';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ikke vis skriveindikatorer i kanallisten';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Vis skriving i valgt kanal';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Når deaktivert (standard), vises ikke skriveindikatorer i kanalen du ser på.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'generelt';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Tastaturhint';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Kontroller om hint for tastatursnarveier vises i verktøytips.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Skjul tastaturhint i verktøytips';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Når aktivert, skjules snarvei-ikoner i verktøytips.';

  @override
  String get lookAndFeelNekoTitle => 'Diverse';

  @override
  String get lookAndFeelNekoDescription => 'Diverse grensesnittvalg.';

  @override
  String get lookAndFeelShowNekoLabel => 'Vis Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Når aktivert, vises Neko nær chat-inndatolinjen.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Oppførsel ved tilkobling til stemmekanal';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Kontroller hvordan du kobler deg til stemmekanaler i fellesskap.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Krev dobbeltklikk for å bli med i stemmekanaler';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Når aktivert, må du dobbeltklikke på stemmekanaler for å bli med. Når deaktivert (standard), vil et enkeltklikk bli med i kanalen umiddelbart.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Den fort store reven hopper over den late hunden.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Serverliste';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigurer hvordan serverlisten viser direktemeldinger.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count fellesskap er midlertidig utilgjengelige på grunn av en feil med fluxkondensatoren.',
      one:
          '1 fellesskap er midlertidig utilgjengelig på grunn av en feil med fluxkondensatoren.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Fellesskapet er midlertidig utilgjengelig';

  @override
  String get guildUnavailableDescription =>
      'Noe gikk galt. Vi jobber med saken.';

  @override
  String get guildNotFoundTitle => 'Dette er ikke fellesskapet du leter etter.';

  @override
  String get guildNotFoundDescription =>
      'Fellesskapet du leter etter kan ha blitt slettet, eller du har kanskje ikke tilgang til det.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName er for øyeblikket kun tilgjengelig for ansatte i $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'midlertidig utilgjengelig';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Kollaps DM-er til mappe';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Når aktivert, kollapses uleste DM-er i serverlisten til en mappe på $productName-knappen. Klikk på $productName-knappen mens du er på DM-siden for å utvide eller kollapse mappen.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanalliste';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Kontroller oppførselen til uleste indikatorer for dempede kanaler i kanallister.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Vis ulest indikator på dempede kanaler';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Når aktivert, viser dempede kanaler en svak ulest indikator på venstre side. Nevnelser vises fortsatt uavhengig av denne innstillingen.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktiv nå';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Kontroller hvordan Aktiv nå vises i appen.';

  @override
  String get lookAndFeelShowActiveNowLabel => 'Vis Aktiv nå på startskjermen';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Vis Aktiv nå på startskjermen for å vise venner som er aktive i stemme. Du vil se en forhåndsvisning, kanalens kontekst, hvem som allerede er der, og en rask måte å bli med på.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoritter';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Kontroller synligheten av favoritter i hele appen.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Aktiver favoritter';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Når aktivert, kan du favorittmerke kanaler, og de vil vises i Favoritter-seksjonen. Når deaktivert, vil alle favorittrelaterte UI-elementer (knapper, menyelementer) være skjult. Dine eksisterende favoritter vil bli bevart.';

  @override
  String get favoritesTitle => 'Favoritter';

  @override
  String get favoritesEmptyTitle => 'Ingen favoritter ennå';

  @override
  String get favoritesEmptyDescription =>
      'Stjernemarker kanaler fra chattoppen for å ha dem her.';

  @override
  String get favoritesWelcomeTitle => 'Velkommen til favoritter';

  @override
  String get favoritesWelcomeDescription =>
      'Din personlige plass for rask tilgang til kanaler, direktemeldinger og grupper du liker. Trykk på stjernen på en hvilken som helst kanal for å legge den til her.';

  @override
  String get favoritesWelcomeTip => 'Ikke for deg? Skru det av når som helst.';

  @override
  String get favoritesDisableButton => 'Deaktiver favoritter';

  @override
  String get favoritesAddedToast => 'Lagt til i favoritter';

  @override
  String get favoritesRemovedToast => 'Fjernet fra favoritter';

  @override
  String get favoritesHiddenToast => 'Favoritter skjult';

  @override
  String get favoritesMute => 'Dempet favoritter';

  @override
  String get favoritesUnmute => 'Aktiver favoritter';

  @override
  String get favoritesHeaderMenu => 'Favorittmeny';

  @override
  String get favoritesCreateCategory => 'Opprett kategori';

  @override
  String get favoritesCategoryNameLabel => 'Kategorinavn';

  @override
  String get favoritesHideMutedChannels => 'Skjul dempede kanaler';

  @override
  String get favoritesShowMutedChannels => 'Vis dempede kanaler';

  @override
  String get favoritesSetNickname => 'Angi kallenavn';

  @override
  String get favoritesNicknameLabel => 'Kallenavn';

  @override
  String get favoritesSaveNickname => 'Lagre kallenavn';

  @override
  String get favoritesMoveToCategory => 'Flytt til kategori';

  @override
  String get favoritesUncategorized => 'Uten kategori';

  @override
  String get favoritesOtherCategory => 'Annet';

  @override
  String get favoritesRemoveFromFavorites => 'Fjern fra favoritter';

  @override
  String get favoritesAddToFavorites => 'Legg til i favoritter';

  @override
  String get favoritesAddToSavedMedia => 'Legg til i lagrede medier';

  @override
  String get favoritesRemoveFromSavedMedia => 'Fjern fra lagret media';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Legg til i URL-baserte GIF-favoritter';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Fjern fra URL-baserte GIF-favoritter';

  @override
  String get savedMediaAddTitle => 'Legg til i lagrede medier';

  @override
  String get savedMediaFormNameLabel => 'Navn';

  @override
  String get savedMediaFormNameHint => 'Mine flotte medier';

  @override
  String get savedMediaFormAltTextLabel => 'Alternativ tekst';

  @override
  String get savedMediaFormAltTextHint => 'Beskriv mediet';

  @override
  String get savedMediaFormTagsLabel => 'Etiketter';

  @override
  String get savedMediaFormTagsHint => 'morsomt, reaksjon, jobb';

  @override
  String get savedMediaSaveError => 'Kunne ikke oppdatere lagrede medier.';

  @override
  String get savedMediaNameRequired => 'Navn er påkrevd.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Hvordan skal vi lagre GIF-favorittene dine?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Du kan lagre stjernemerkede GIF-er som favoritter kun med URL, eller laste dem opp til dine lagrede medier. Velg det som passer best for hvordan du bruker dem. Du kan endre dette når som helst i Innstillinger > Avansert > Medier.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-kun favoritter (standard): synkronisert på tvers av enhetene dine, ingen opplasting, teller ikke mot lagret media. Originalmediet kan forsvinne hvis verten fjerner det.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Lagret media: opplastet, taggbart, søkbart og varig, men teller mot lagrings grensen din.';

  @override
  String get gifFavoriteFirstTimeHint => 'Vi spør bare én gang.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Bruk kun URL (anbefalt)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Bruk lagrede medier';

  @override
  String get favoritesHideConfirmTitle => 'Skjul favoritter';

  @override
  String get favoritesHideConfirmDescription =>
      'Dette vil skjule alle favorittrelaterte UI-elementer, inkludert knapper og menyelementer. Dine eksisterende favoritter vil bli bevart og kan aktiveres igjen når som helst fra Innstillinger > Avansert > Utseende.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direktemelding';

  @override
  String get messagesMediaDisplayGroupTitle => 'Visning';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Kontroller hvordan meldinger, medier og annet innhold vises.';

  @override
  String get messagesMediaMediaGroupTitle => 'Medier';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Tilpass innstillinger og knapper for mediestørrelse.';

  @override
  String get messagesMediaInputGroupTitle => 'Inndata';

  @override
  String get messagesMediaInputGroupDescription =>
      'Tilpass innstillinger for meldingsinndata.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Sidefelt';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigurer hvordan fellesskapets sidefelt vises.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Skjul dempede kanaler som standard';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Skjul automatisk dempede kanaler i sidefeltet når du blir med i nye fellesskap';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Skjul dempede kanaler som standard?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Nye fellesskap du blir med i, vil automatisk ha dempede kanaler skjult. Vil du også bruke denne innstillingen på alle dine eksisterende fellesskap?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Slutt å skjule dempede kanaler som standard?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Nye fellesskap du blir med i, vil ikke lenger ha dempede kanaler skjult automatisk. Vil du også vise dempede kanaler i alle dine eksisterende fellesskap?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Bruk på alle fellesskap';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Vis i alle fellesskap';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Kun nye fellesskap';

  @override
  String get messagesMediaDisplaySectionTitle => 'Medievisning';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Kontroller hvordan bilder, videoer og andre medier vises. Alle medier blir endret størrelse og konvertert. Ekstremt store filer som ikke kan komprimeres til en forhåndsvisning, vil ikke bli innebygd uavhengig av disse innstillingene.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Når postet som lenker til chat';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Når lastet opp direkte til $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle =>
      'Forhåndsvisning av lenker';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Kontroller hvordan nettstedslenker forhåndsvises i chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Vis innebygginger og forhåndsvis nettstedslenker';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaksjoner';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfigurer emojireaksjoner på meldinger';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Vis emojireaksjoner på meldinger';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoilerinnhold';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Kontroller hvordan spoilerinnhold vises';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Vis spoilerinnhold';

  @override
  String get messagesMediaSpoilersOnClickName => 'Ved klikk';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Vis spoilerinnhold når du klikker';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'I kanaler jeg modererer';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Vis alltid spoilerinnhold i kanaler der du har \"Administrer meldinger\"-tillatelsen';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Alltid';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Vis alltid spoilerinnhold';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Innstillinger for medienstørrelse';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Tilpass den maksimale visningsstørrelsen for innebygd og vedlagt media. Mindre størrelser bruker mindre skjermplass, mens større størrelser viser mer detaljer.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Media fra lenker (innebygginger)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Opplastede vedlegg';

  @override
  String get messagesMediaSizeCompactName => 'Kompakt (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Mindre medienstørrelse';

  @override
  String get messagesMediaSizeComfortableName => 'Komfortabel (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Større medienstørrelse med mer detaljer';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF-atferd';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Kontroller hvordan GIF-er settes inn i chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Send GIF-er automatisk når de er valgt';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Kameranedlastinger';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Velg om bilder og videoer tatt med kameraet i appen skal lagres på enheten din';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Lagre til enhet';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autofullføring av uttrykk (kolon-autofullføring)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Kontroller hva som vises i autofullføringen av uttrykk når du skriver kolon. Tilpass hvilke forslag som vises for å matche dine preferanser.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Vis standardemojier i autofullføring av uttrykk';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Vis egendefinerte emojier i autofullføring av uttrykk';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Vis klistremerker i autofullføring av uttrykk';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Vis lagret media i autofullføring av uttrykk';

  @override
  String get messagesMediaEditingSectionTitle => 'Meldingredigering';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Kontroller hva som skjer med utkastet ditt når du avbryter.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Behold utkast til redigering ved avbrytelse';

  @override
  String get accessibilitySaturationTitle => 'Metning';

  @override
  String get accessibilitySaturationDescription =>
      'Juster hvor livlige temafarger vises i hele appen.';

  @override
  String get accessibilityVisualGroupTitle => 'Visuelt';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Alltid understrek lenker';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Dempet gjennomstreket tekst';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'DM-meldingsforhåndsvisninger';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Kontroller når meldingsforhåndsvisninger vises i DM-listen.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM-meldingsforhåndsvisningsmodus';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Alle meldinger';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Vis meldingsforhåndsvisninger for alle DM-samtaler';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Kun uleste DM-er';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Vis kun meldingsforhåndsvisninger for DM-er med uleste meldinger';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ingen';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ikke vis meldingsforhåndsvisninger i DM-listen';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Skjermleser';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Kontroller hvordan $productName fungerer med skjermlesere.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Kunngjør nye meldinger';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'La skjermlesere kunngjøre nye meldinger når de kommer inn i den åpne kanalen. Varslingslyder påvirkes ikke.';

  @override
  String get accessibilityTtsGroupTitle => 'Tekst til tale';

  @override
  String get accessibilityTtsGroupDescription =>
      'Velg hastighet for taletekst.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Avspillingshastighet for tale';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Spill av eksempel';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Stillhetseksempel';

  @override
  String get accessibilityPreviewButtonLabel => 'Forhåndsvisningsknapp';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Slik vises forhåndsvisninger av lenker: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Forhåndsvisning av bruker';

  @override
  String get accessibilityKeyboardGroupTitle => 'Tastatur';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Vis fokusring på chattefeltet';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Escape-tasten avslutter tastaturmodus';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Vis snarveier for hurtigmeny';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Bekreft før anrop startes';

  @override
  String get accessibilityAnimationGroupTitle => 'Animasjon';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Redusert bevegelse er på, så animasjoner er som standard satt på pause. Du kan fortsatt slå på hvilken som helst av dem for å spille den av.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Spill av animerte emojier';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Spill av GIF-er automatisk';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Spill av GIF-er automatisk når $productName er i fokus';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Spiller av til tross for redusert bevegelse.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pauset på grunn av redusert bevegelse. Slå på for å fortsette å spille av animerte emojier.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Pauset på grunn av redusert bevegelse. Slå på for å fortsette å spille av GIF-er.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Standard er av på mobil for å spare batteri og data.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Klistremerkeanimasjoner';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Innstillinger for klistremerkeanimasjon';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Animer alltid';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Klistremerker vil alltid animeres';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animer ved interaksjon';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Klistremerker animeres når du trykker på dem';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Klistremerker animeres når du holder musepekeren over dem eller samhandler med dem';

  @override
  String get accessibilityStickerNeverAnimateName => 'Aldri animer';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Klistremerker vil aldri animeres';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Animerer alltid til tross for redusert bevegelse.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Redusert bevegelse begrenser klistremerker til å animere ved interaksjon. Velg «Animer alltid» for å overstyre.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Animeres som standard ved interaksjon på mobil for å spare batteri.';

  @override
  String get accessibilityMotionGroupTitle => 'Bevegelse';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Synkroniser innstilling for redusert bevegelse med systemet';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Bruk enhetens systeminnstilling for redusert bevegelse, eller tilpass den nedenfor.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reduser bevegelse';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Deaktiver animasjoner og overganger. Kontrolleres for øyeblikket av systeminnstillingene dine.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Deaktiver animasjoner og overganger i hele appen.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animerte emojier, GIF-er og klistremerker forblir under din kontroll i Animasjon-fanen.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Starte samtale?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Er du sikker på at du vil starte denne samtalen?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Start samtale';

  @override
  String get accessibilityTtsSampleDescription =>
      'Hør eksempelteksten lest opp med valgt hastighet.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, jeg er fra fremtiden. Jeg kom hit i en tidsmaskin du fant opp. Nå trenger jeg hjelpen din for å komme tilbake til 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Talelydsyntese er ikke tilgjengelig på denne enheten.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Avspilling av tale mislyktes. Prøv igjen, eller sjekk at lydutgangen fungerer.';

  @override
  String get ttsSubstitutionUnknownUser => 'ukjent bruker';

  @override
  String get ttsSubstitutionUnknownRole => 'ukjent rolle';

  @override
  String get ttsSubstitutionUnknownChannel => 'ukjent kanal';

  @override
  String get ttsSubstitutionCodeBlock => 'kodeblokk';

  @override
  String get ttsSubstitutionSpoiler => 'skjult';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'skråstrek $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName sa: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Svarer $replyAuthorName, sa $authorName: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'sendte et klistremerke';

  @override
  String get ttsSentAttachment => 'sendte et vedlegg';

  @override
  String ttsSentAttachments(int count) {
    return 'sendte $count vedlegg';
  }

  @override
  String get ttsSentEmbed => 'sendte et innebygd element';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author sendte $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Sendte et vedlegg';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username festet en melding til denne kanalen.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username la til $userName i gruppen.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username la til noen i gruppen.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username har forlatt gruppen.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username fjernet $userName fra gruppen.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username fjernet noen fra gruppen.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username endret kanalnavnet til $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username endret kanalnavnet.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username endret kanalikonet.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username startet en samtale.';
  }

  @override
  String get systemCallJoinTheCall => 'Bli med i samtalen';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username startet en samtale som varte i $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Du gikk glipp av en samtale fra $username som varte i $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Du gikk glipp av en samtale fra $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'noen sekunder';

  @override
  String get systemCallDurationMinute => 'ett minutt';

  @override
  String get systemCallDurationOneYear => '1 år';

  @override
  String get systemCallDurationOneMonth => '1 måned';

  @override
  String get systemCallDurationOneWeek => '1 uke';

  @override
  String get systemCallDurationOneDay => '1 dag';

  @override
  String get systemCallDurationOneHour => '1 time';

  @override
  String systemCallDurationYears(int count) {
    return '$count år';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count måneder';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count uker';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count dager';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count timer';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minutter';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Oppdater $productName for å se denne meldingen.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Bekreftelse av stemmetilkobling';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Du er allerede koblet til denne stemmekanalen fra $count andre enheter. Hva vil du gjøre?',
      one:
          'Du er allerede koblet til denne stemmekanalen fra én annen enhet. Hva vil du gjøre?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Bytt til denne enheten';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Bli med (behold andre tilkoblinger)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ikke gjør noe, jeg vil ikke bli med';

  @override
  String get voiceJoinFailedTitle => 'Kunne ikke bli med i tale';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Kunne ikke koble fra de andre enhetene dine. Prøv igjen om et øyeblikk.';

  @override
  String get voiceChannelEmptyDescription =>
      'Dette er en stemmekanal. Koble til for å begynne å snakke!';

  @override
  String get voiceChannelJoin => 'Bli med i stemmekanalen';

  @override
  String get voiceCallJoin => 'Bli med i samtalen';

  @override
  String get voiceChannelJoinConnect => 'Koble til stemme';

  @override
  String get voiceChannelNoConnectPermission =>
      'Du har ikke tillatelse til å bli med i denne stemmekanalen';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon-, kamera- og skjermdelingsinnhold er ende-til-ende-kryptert.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon-, kamera- og skjermdelingsinnhold er ende-til-ende-kryptert.';

  @override
  String get voiceChannelE2eeBroken =>
      'Ende-til-ende-kryptering er utilgjengelig fordi en upassende deltaker er i denne stemmekanalen.';

  @override
  String get voiceCallE2eeBroken =>
      'Ende-til-ende-kryptering er utilgjengelig fordi en upassende deltaker er i denne samtalen.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Denne klienten må oppdateres før du blir med i denne krypterte samtalen.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Kunne ikke starte mikrofonen din. Du er fortsatt i samtalen.';

  @override
  String get voiceChannelStatusConnecting => 'Kobler til...';

  @override
  String get voiceChannelStatusConnected => 'Tilkoblet';

  @override
  String get voiceChannelStatusError => 'Feil';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobil enhet';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Skrivebordsenhet';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Fellesskapet dempet';

  @override
  String get voiceParticipantTooltipMuted => 'Dempet';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Fellesskapet døvet';

  @override
  String get voiceParticipantTooltipDeafened => 'Døvet';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Tilkobling: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deltakere',
      one: '1 deltaker',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Forlat';

  @override
  String get voiceControlMute => 'Dempe';

  @override
  String get voiceControlUnmute => 'Slå på lyden';

  @override
  String get voiceControlDeafen => 'Døve';

  @override
  String get voiceControlUndeafen => 'Fjern døvhet';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Bytt kamera';

  @override
  String get voiceControlScreenShare => 'Skjermdeling';

  @override
  String get voiceScreenShareNotificationText => 'Deler skjermen din.';

  @override
  String get voiceControlMore => 'Mer';

  @override
  String get voiceControlDisconnect => 'Koble fra';

  @override
  String get voiceInChat => 'I talechat';

  @override
  String get voiceConnectionFailed => 'Tilkobling mislyktes';

  @override
  String get voiceConnectionRetry => 'Prøv igjen';

  @override
  String get voiceConnectionDismiss => 'Lukk';

  @override
  String get voiceConnectionDisconnected => 'Frakoblet';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Måler forsinkelse ...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Gå til $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Tilkobling til tale';

  @override
  String get voiceConnectionAdvancedStats => 'Avansert';

  @override
  String get voiceShowCallAvatars => 'Vis anropsavatarer';

  @override
  String get voiceShowConnectionId => 'Vis tilkoblings-ID';

  @override
  String get voiceAudioProcessing => 'Lydbehandling';

  @override
  String get voiceConnectionSessionSection => 'Økt';

  @override
  String get voiceConnectionDurationLabel => 'Varighet';

  @override
  String get voiceConnectionParticipantsLabel => 'Deltakere';

  @override
  String get voiceConnectionNetworkSection => 'Nettverk';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Send';

  @override
  String get voiceConnectionReceiveLabel => 'Motta';

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
  String get userAreaMuteMicrophone => 'Demp mikrofon';

  @override
  String get userAreaUnmuteMicrophone => 'Slå på mikrofon';

  @override
  String get userAreaUserSettings => 'Brukerinnstillinger';

  @override
  String get voiceParticipantMenuViewProfile => 'Vis profil';

  @override
  String get voiceParticipantMenuFocus => 'Fokuser på denne personen';

  @override
  String get voiceParticipantMenuUnfocus => 'Fjern fokus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Dempe i fellesskap';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Demp i fellesskap';

  @override
  String get voiceParticipantMenuUserVolume => 'Brukervolum';

  @override
  String get voiceParticipantMenuStreamVolume => 'Strømmevolum';

  @override
  String get voiceParticipantMenuStopStreaming => 'Stopp strømming';

  @override
  String get voiceParticipantModerationFailed =>
      'Kunne ikke oppdatere det medlemmet. Prøv igjen.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Vis';

  @override
  String get voiceCallViewModeGrid => 'Rutenett';

  @override
  String get voiceCallViewModeFocus => 'Fokus';

  @override
  String get voicePanelSettingsSectionTitle => 'Stemmeinnstillinger';

  @override
  String get voicePanelUseEarpieceLabel => 'Bruk øreplugg';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Vis kun video';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Vis kun deltakere som har kameraet på.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Vis mitt eget kamera';

  @override
  String get voicePrioritizeSpeakersLabel => 'Prioriter talere';

  @override
  String get voiceTextChatShow => 'Vis chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# uleste meldinger',
      one: 'én ulest melding',
    );
    return 'Vis chat med $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Kameratillatelse kreves for video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Kunne ikke starte skjermdeling. Prøv igjen.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Tillatelse til skjermdeling ble nektet.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Skjermdeling er ikke tilgjengelig på denne enheten.';

  @override
  String get voiceWatchStream => 'Se strøm';

  @override
  String get voiceStopWatching => 'Slutt å se';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Slutt å se på gjeldende strøm';

  @override
  String get voiceOwnScreenShareTitle => 'Du sender';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Strømmen din er live for deltakerne.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Se anrop';

  @override
  String get dmVoiceCallFullScreen => 'Fullskjerm';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Åpne anrop i fullskjerm';

  @override
  String get dmVoiceStripStatusConnecting => 'Kobler til…';

  @override
  String get dmVoiceStripStatusInCall => 'I anrop';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Talepost';

  @override
  String get dmVoiceCallBarConnecting => 'Kobler til…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direkteanrop';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Gruppekall';

  @override
  String get dmVoiceCallBarIssueFallback => 'Taleproblem';

  @override
  String get dmVoiceFullscreenTitle => 'Tale';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Tale tilkoblet';

  @override
  String get notificationsPageTitle => 'Varsler';

  @override
  String get notificationsFilterUnreads => 'Uleste';

  @override
  String get notificationsFilterMentions => 'Nevnelser';

  @override
  String get notificationsBookmarksTooltip => 'Bokmerker';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrer nevnelser';

  @override
  String get notificationsMentionFiltersTitle => 'Nevnelsesfiltre';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Inkluder @alle og @her nevnelser';

  @override
  String get notificationsMentionIncludeRoles =>
      'Inkluder rolletilbakemeldinger';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Inkluder alle fellesskapsnevnelser';

  @override
  String get notificationsNoUnreadTitle => 'Ingen uleste meldinger';

  @override
  String get notificationsNoUnreadBody => 'Du er ajour.';

  @override
  String get notificationsNoMentionsTitle => 'Ingen nylige nevnelser';

  @override
  String get notificationsNoMentionsBody =>
      'Alle @nevnelser av deg vil vises her i 7 dager.';

  @override
  String get notificationsMentionsEndTitle => 'Du har nådd slutten';

  @override
  String get notificationsMentionsEndBody =>
      'Du har sett alle dine nylige nevnelser. Ikke bekymre deg, flere vil dukke opp her snart.';

  @override
  String get notificationsJump => 'Hopp';

  @override
  String get notificationsRemoveMentionTooltip => 'Fjern nevnelser';

  @override
  String get notificationsViewAllUnread => 'Se alle uleste';

  @override
  String get notificationsMarkAsRead => 'Merk som lest';

  @override
  String get notificationsExpand => 'Utvid';

  @override
  String get notificationsCollapse => 'Skjul';

  @override
  String get notificationsMessageUnavailable =>
      'Denne meldingen kunne ikke lastes inn.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining tegn igjen';
  }

  @override
  String get characterCounterTooLong => 'Meldingen er for lang';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining tegn igjen. Skaff deg $productName for å skrive opptil $premiumMaxLength tegn.';
  }

  @override
  String get chatMessageFailedToSend => 'Kunne ikke sende melding';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Meldingen din kunne ikke leveres. Dette er vanligvis fordi du ikke deler et fellesskap med mottakeren, eller mottakeren bare godtar direkte meldinger fra venner. Du må kanskje også justere dine egne personverninnstillinger for direkte meldinger i $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Meldingen din kunne ikke leveres. Du må gjøre krav på kontoen din for å sende direkte meldinger.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Meldingen din kunne ikke leveres. Du må gjøre krav på kontoen din for å sende meldinger.';

  @override
  String get chatSendFailureContentBlocked =>
      'Meldingen din kunne ikke leveres fordi den ble flagget av våre sikkerhetssystemer. Hvis du mener dette er en feil, vennligst kontakt support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Meldingen din kunne ikke leveres fordi den inneholder modne emoji eller klistremerker som ikke er tillatt i denne konteksten.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Bare du kan se denne meldingen.';

  @override
  String get chatClientSystemDismiss => 'Lukk';

  @override
  String get privacyDashboardCommunicationSection => 'Kommunikasjon';

  @override
  String get privacyDashboardProfilePrivacySection => 'Profilsynlighet';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Venner og direktemeldinger';

  @override
  String get privacyDashboardActivitySharingSection => 'Aktivitetsdeling';

  @override
  String get privacyDashboardSensitiveContentSection => 'Sensitivt innhold';

  @override
  String get privacyDashboardDataExportSection => 'Dataeksport';

  @override
  String get privacyDashboardDataDeletionSection => 'Sletting av data';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Hvem kan se hele profilen din';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Venner og alle fellesskap';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Hele profilen din er synlig for venner og alle i fellesskapene dine';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Kun venner og små fellesskap';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Hele profilen din er synlig for venner og medlemmer av fellesskapene dine med 200 eller færre medlemmer';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Kun venner';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Hele profilen din er bare synlig for vennene dine';

  @override
  String get privacyDashboardFriendRequestsTitle => 'venneforespørsler';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Alle';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Tillat at hvem som helst kan sende deg venneforespørsler';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Venner av venner';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Tillat venner av vennene dine å sende deg forespørsler';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Medlemskap i fellesskapet';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Tillat medlemmer fra fellesskapene du er med i å sende deg forespørsler';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direktemeldinger';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Tillat direktemeldinger fra fellesskapsmedlemmer';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Tillat medlemmer fra fellesskap du er med i å sende deg direktemeldinger';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Tillat direktemeldinger fra fellesskapsroboter';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Tillat boter fra fellesskapene du er med i å sende deg direktemeldinger';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Kontroller hvem som kan sende deg venneforespørsler og direktemeldinger';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Kontroller hvem som kan ringe deg og legge deg til i gruppechatter';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Innkommende anrop';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Kontroller hvem som kan ringe deg';

  @override
  String get privacyDashboardAllowedCallers => 'Tillatte avsendere';

  @override
  String get privacyDashboardIncomingCallNobody => 'Ingen';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blokker alle innkommende samtaler';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Kun venner';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Tillat kun venner å ringe deg (anbefalt)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Venner + Egendefinert';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Tillat venner pluss andre grupper du velger';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Alle';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Tillat at hvem som helst kan ringe deg, selv fremmede';

  @override
  String get privacyDashboardAdditionalGroups => 'Ekstra grupper';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Personer som er venner med vennene dine kan ringe deg';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Folk fra felleskap dere begge er i, kan ringe deg';

  @override
  String get privacyDashboardRingBehavior => 'Ringatferd';

  @override
  String get privacyDashboardSilentCalls => 'Stille anrop fra alle';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Alle anrop vil varsle stille i stedet for å ringe. Som standard er anrop fra ikke-venner alltid stille.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Hvem kan legge deg til i gruppechatter';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Kontroller hvem som kan legge deg til i gruppechatter uten å spørre. Alle kan fortsatt sende deg invitasjonslenker for å bli med.';

  @override
  String get privacyDashboardAllowedInvites => 'Tillatte invitasjoner';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Ikke la noen legge deg til i gruppechatter uten å spørre';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Tillat kun venner å legge deg til uten å spørre (anbefalt)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Tillat venner pluss flere grupper å legge deg til';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Tillat at hvem som helst kan legge deg til i gruppechatter uten å spørre';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Folk som er venner med vennene dine kan legge deg til i gruppechatter';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Folk fra felles grupper kan legge deg til i gruppechatter';

  @override
  String get privacyDashboardVoiceActivityTitle => 'Stemmeaktivitet i aktiv nå';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Del stemmeaktiviteten din med venner';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Del stemmeaktivitet med alle venner?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Vil du slutte å dele stemmeaktivitet med alle venner?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Du er i ferd med å begynne å dele stemmeaktiviteten din med alle vennene dine, inkludert fremtidige venner. Dette sender en oppdatering til alle, og kan kun endres igjen om 24 timer.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Du er i ferd med å slutte å dele stemmeaktiviteten din med alle vennene dine, inkludert fremtidige venner. Dette sender en oppdatering til dem alle og kan bare endres igjen om 24 timer.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Ja, del med alle venner';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Ja, slutt å dele';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Tilgjengelig igjen om $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Deling av stemmeaktivitet oppdatert';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Kunne ikke oppdatere deling av taleaktivitet akkurat nå';

  @override
  String get privacyDashboardDataExportDesc =>
      'Bygg et nedlastbart arkiv av kontodataene dine, inkludert meldinger og vedleggs-URL-er. De fleste vil ha alt, men du kan begrense omfanget nedenfor.';

  @override
  String get privacyDashboardExportMyData => 'Eksporter dataene mine';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Fjern permanent meldinger du har sendt i direktemeldinger, gruppedirektemeldinger og fellesskap. Jobben kjører i bakgrunnen, og du får en direktemelding når den er ferdig.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Slett meldingene mine';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Tillat direktemeldinger fra fellesskapsmedlemmer?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Blokker direktemeldinger fra fellesskapsmedlemmer?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Tillat roboter å sende deg direktemeldinger?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blokkere roboter fra å sende deg direktemeldinger?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Vil du også tillate direktemeldinger fra medlemmer av dine eksisterende fellesskap?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Vil du også blokkere direktemeldinger fra medlemmer av dine eksisterende fellesskap?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Vil du også la roboter fra dine eksisterende fellesskap sende deg direktemeldinger?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Vil du også blokkere roboter fra dine eksisterende fellesskap?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Du kan også endre denne innstillingen per fellesskap ved å trykke lenge på fellesskapsnavnet og velge Personverninnstillinger.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Tillat for alle fellesskap';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Blokker for alle fellesskap';

  @override
  String get privacyDashboardDmConfirmSkip => 'Hopp over dette trinnet';

  @override
  String get privacyDashboardDataRequestGoBack => 'Gå tilbake';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Eksporter dataene mine';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Slett meldingene mine';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Vi behandler dette så snart som mulig. Du får en e-post når arkivet ditt er klart.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Vi behandler dette så snart som mulig. Du får en DM fra oss når det er ferdig.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Hva som skal inkluderes';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Alt';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Eksporter alle meldinger du har sendt, pluss alle kontoinnstillingene dine, medlemskap og metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Egendefinert utvalg';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Velg hvilke samtaletyper, fellesskap og tidsperiode som skal inkluderes i arkivet.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Velg hva som skal inkluderes';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Velg hvilke typer samtaler du vil rydde opp i.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Bare steder jeg ikke lenger har tilgang til';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Slett kun meldinger fra fellesskap og gruppechatter du har forlatt eller blitt fjernet fra.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Hvilke samtaler';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Velg hvilke typer samtaler du vil inkludere.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Åpne direktemeldinger';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Lukkede direktemeldinger';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Gruppechatter';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Fellesskap';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Hvilke fellesskap';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Fellesskapsfilter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Inkluder alle unntatt valgte';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Kun de valgte';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Du er ikke med i noen fellesskap for øyeblikket.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Tidsperiode';

  @override
  String get privacyDashboardDataRequestDateMode => 'Tidsperiode';

  @override
  String get privacyDashboardDataRequestAllTime => 'Hele perioden';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Egendefinert område';

  @override
  String get privacyDashboardDataRequestStartDate => 'Startdato';

  @override
  String get privacyDashboardDataRequestEndDate => 'Sluttdato';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'La ett av feltene stå tomt for å la den enden av vinduet være ubegrenset.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Velg minst én samtaletype som skal inkluderes.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Startdato må være tidligere enn sluttdato.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Se gjennom og bekreft';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Vi lager et nedlastbart arkiv med alle meldingene du har sendt, og sender deg en e-post når det er klart. Nedlastingslenken i e-posten utløper etter 7 dager.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Vi bygger et nedlastbart arkiv som samsvarer med filtrene nedenfor, og sender deg en e-post når det er klart. Nedlastingslenken i e-posten utløper etter 7 dager.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Slett meldingene som samsvarer med filtrene nedenfor, permanent. Dette kan ikke angres.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Det er ingen gjenoppretting når dette starter. Vi sender deg en direktemelding når det er ferdig.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Be om eksport';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Slett meldinger';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Omfang';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Samtaler';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Fellesskap';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Tidsperiode';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Ingen';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Fra $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Til $end';
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
      other: '# fellesskap',
      one: '# fellesskap',
    );
    return 'Alle unntatt $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# fellesskap',
      one: '# fellesskap',
    );
    return 'Kun $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Åpne direktemeldinger';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Lukkede direktemeldinger';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Direktemeldinger (åpne og lukkede)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Gruppechatter';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Fellesskap';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# timer',
      one: '# time',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutter',
      one: '# minutt',
    );
    return '$_temp0 og $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# timer',
      one: '# time',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutter',
      one: '# minutt',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# sekunder',
      one: '# sekund',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Kunne ikke laste personverninnstillinger';

  @override
  String get privacyDashboardRetry => 'Prøv igjen';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Kunne ikke lagre innstillinger for sensitivt innhold.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Kunne ikke fullføre forespørselen.';

  @override
  String get chatMessageDeleteFailed => 'Sletting mislyktes';

  @override
  String get chatMessageAddReaction => 'Legg til reaksjon';

  @override
  String get chatMessageEdit => 'Rediger melding';

  @override
  String get chatMessageReply => 'Svar';

  @override
  String get chatMessageForward => 'Videresend';

  @override
  String get forwardMessageTitle => 'Videresend melding';

  @override
  String get forwardSearchHint => 'Søk i kanaler eller direktemeldinger';

  @override
  String get forwardDirectMessagesSection => 'Direktemeldinger';

  @override
  String get forwardCommentHint => 'Legg til en kommentar (valgfritt)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Send ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Ingen kanaler funnet';

  @override
  String get forwardSuccessToast => 'Melding videresendt';

  @override
  String get forwardFailed => 'Kunne ikke videresende melding';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Kommentarer er utilgjengelige fordi en valgt kanal har sakte modus aktivert.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Venter på at \"slowmode\" skal utløpe i én eller flere valgte kanaler.';

  @override
  String get slowmodeRateLimitedTitle => 'Saktemodus aktiv';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Saktemodus er på – vent $duration før du sender en ny melding.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Direkte opplasting er deaktivert under sakte modus.';

  @override
  String get shareMediaTitle => 'Del til';

  @override
  String get shareMediaMessageHint => 'Legg til en valgfri melding…';

  @override
  String get shareMediaSendButton => 'Send';

  @override
  String get shareMediaSuccessToast => 'Medier delt';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Delt til $count destinasjoner';
  }

  @override
  String get shareMediaFailedToast => 'Kunne ikke dele media';

  @override
  String get forwardDestinationNoSendPermission =>
      'Du kan ikke sende meldinger her';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Du kan ikke legge inn lenker her';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Du kan ikke laste opp filer her';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Meldinger er deaktivert i dette fellesskapet';

  @override
  String get forwardDestinationTimedOut =>
      'Du er utestengt i dette fellesskapet';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Sakte modus – vent $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopier melding';

  @override
  String get chatMessageCopyEmbedText => 'Kopier innbyggingstekst';

  @override
  String get chatMessageTranslate => 'Oversett';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Oversatt fra $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Se original';

  @override
  String get chatMessageSeeTranslation => 'Se oversettelse';

  @override
  String get chatMessageTranslating => 'Oversetter…';

  @override
  String get chatMessageTranslateFailed =>
      'Kunne ikke oversette denne meldingen.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Oversettelse er ikke tilgjengelig på denne enheten.';

  @override
  String get chatMessageSpeak => 'Les melding';

  @override
  String get chatMessageStopSpeaking => 'Stopp tale';

  @override
  String get chatMessagePin => 'Fest melding';

  @override
  String get chatMessageUnpin => 'Løsne melding';

  @override
  String get chatMessageUnpinIt => 'Løsne den';

  @override
  String get chatMessageBookmark => 'Bokmerk melding';

  @override
  String get chatMessageRemoveBookmark => 'Fjern bokmerke';

  @override
  String get chatMessageMarkAsUnread => 'Marker som ulest';

  @override
  String get chatMessageCopyMessageLink => 'Kopier meldingslenke';

  @override
  String get chatMessageOpenLink => 'Åpne lenke';

  @override
  String get chatMessageCopyLink => 'Kopier lenke';

  @override
  String get chatMessageCopyMessageId => 'Kopier meldings-ID';

  @override
  String get chatMessageViewReactions => 'Vis reaksjoner';

  @override
  String get chatMessageRemoveAllReactions => 'Fjern alle reaksjoner';

  @override
  String get chatMessageDebug => 'Feilsøk melding';

  @override
  String get chatMessageDebugSheetTitle => 'Feilsøk melding';

  @override
  String get chatMessageDebugCopyJson => 'Kopier JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Meldingens JSON kopiert til utklippstavlen';

  @override
  String get chatReactionsSheetTitle => 'Reaksjoner';

  @override
  String get chatReactionsSheetEmpty => 'Ingen har reagert på denne ennå.';

  @override
  String get chatReactionAddFailed => 'Kunne ikke legge til reaksjon';

  @override
  String get chatReactionRemoveFailed => 'Kunne ikke fjerne reaksjon';

  @override
  String get chatMessageReport => 'Rapporter melding';

  @override
  String get iarReportMessageTitle => 'Rapporter melding';

  @override
  String get iarThisUserFallback => 'denne brukeren';

  @override
  String get iarModalDescription =>
      'Rapporter et brudd på reglene, eller finn verktøy for å administrere kontakter og preferanser.';

  @override
  String get iarPathStepAriaLabel => 'Hva trenger du?';

  @override
  String get iarCategoryStepTitle => 'Hvilken type regel ble brutt?';

  @override
  String get iarReasonStepTitle => 'Hvilken regel ble brutt?';

  @override
  String get iarReasonSelectHint => 'Velg en grunn';

  @override
  String get iarPickAnOptionToast => 'Velg et alternativ for å fortsette.';

  @override
  String get iarPickARuleToast => 'Velg regelen som ble brutt.';

  @override
  String get iarPathPlatform => 'Rapporter et brudd på plattformreglene';

  @override
  String get iarPathCommunity =>
      'Rapporter til moderatorer i dette fellesskapet';

  @override
  String get iarPathPreferenceMessage => 'Jeg liker ikke dette innholdet';

  @override
  String get iarCategoryTargetedHarmLabel =>
      'Trusler, trakassering eller skade';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Mobbing, trusler, hat, vold, raid eller innhold som oppfordrer til selvskading.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Barnetrygghet eller voksent innhold';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Mindreårige i fare, voksent innhold på feil sted, eller uønsket oppførsel.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Personvern eller utgi seg for å være noen andre';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxing, stalking, utgi seg for å være noen, eller en upassende profil.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Svindel, skadevare eller feilinformasjon';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, svindel, skadelige lenker eller falske påstander som sannsynligvis vil forårsake skade i den virkelige verden.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Ulovlig aktivitet eller noe annet';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Ulovlig salg, tilrettelegging for kriminelle handlinger, eller et klart brudd på reglene som ikke passer inn ovenfor.';

  @override
  String get iarReasonHarassmentLabel => 'Trakassering eller trusler';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Mobbing, gjentatt uønsket kontakt, stalking eller målrettet misbruk.';

  @override
  String get iarReasonHateLabel => 'Hatytringer';

  @override
  String get iarReasonHateMessageDescription =>
      'Slur, dehumaniserende språk eller angrep på beskyttede grupper.';

  @override
  String get iarReasonViolenceLabel => 'Vold eller voldstrusler';

  @override
  String get iarReasonViolenceDescription =>
      'Troverdige trusler, grafisk vold eller glorifisering av vold.';

  @override
  String get iarReasonMatureContentLabel =>
      'Voksent innhold eller trakassering';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Uønsket oppførsel eller voksent innhold på feil sted.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Barnetrygghet eller utnyttelse av mindreårige';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Innhold relatert til grooming eller utnyttelse av barn.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Skadelig feilinformasjon';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Falske påstander som sannsynligvis vil forårsake skade i den virkelige verden.';

  @override
  String get iarReasonSpamLabel => 'Spam, svindel eller phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Masse-spam, svindel, falske premier, eller misbruk av konto.';

  @override
  String get iarReasonMalwareLabel => 'Skadevare eller farlige lenker';

  @override
  String get iarReasonMalwareDescription =>
      'Skadevare, tyveri av innloggingsinformasjon eller skadelige filer.';

  @override
  String get iarReasonPrivacyLabel => 'Personvernbrudd';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxing, eksponert privat informasjon eller stalking.';

  @override
  String get iarReasonImpersonationLabel =>
      'Utgi seg for å være noen andre eller villedende media';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Utgir seg for å være noen andre, inkludert villedende AI-generert innhold.';

  @override
  String get iarReasonIllegalLabel => 'Ulovlig aktivitet';

  @override
  String get iarReasonIllegalDescription =>
      'Ulovlig salg, tilrettelegging for kriminelle handlinger eller ulovlig aktivitet.';

  @override
  String get iarReasonSelfHarmLabel => 'Selvskading eller selvmord';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Oppfordring til eller instruksjoner for selvskading eller spiseforstyrrelser.';

  @override
  String get iarReasonOtherLabel => 'Et annet klart brudd på reglene';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Bruk kun hvis det tydelig bryter $productName regler og ikke passer inn ovenfor.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Hvis en mindreårig er involvert, bruk \"$childSafetyReason\" i stedet.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Hvis dette involverer CSAM eller utnyttelse av en mindreårig, send det nå og ikke del materialet på nytt.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Hvis noen kan være i umiddelbar fare, kontakt lokale nødetater hvis du trygt kan gjøre det.';

  @override
  String get iarSafetyNoteViolence =>
      'Hvis dette er en troverdig umiddelbar trussel, kontakt også lokale nødetater.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Hvis dette er en umiddelbar terrorhandling, kontakt også lokale nødetater.';

  @override
  String get iarActionBlockUserTitle => 'Blokker denne brukeren';

  @override
  String get iarActionBlockUserDescription =>
      'Stopp meldinger og venneforespørsler.';

  @override
  String get iarActionBlockUserButton => 'Blokker';

  @override
  String get iarActionCopyMessageLinkTitle => 'Kopier meldingslenke';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Del med fellesskapsmoderatorer.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopier';

  @override
  String get iarActionCloseDmTitle => 'Lukk denne direktemeldingen';

  @override
  String get iarActionCloseDmDescription =>
      'Blokkerer ikke. Du kan åpne igjen senere.';

  @override
  String get iarActionCloseDmButton => 'Lukk DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Forlat fellesskapet';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Slutt å se innhold og medlemmer.';

  @override
  String get iarActionLeaveCommunityButton => 'Forlat';

  @override
  String get iarActionDmSettingsTitle =>
      'DM- og venneforespørselsinnstillinger';

  @override
  String get iarActionDmSettingsDescription =>
      'Endre hvem som kan kontakte deg.';

  @override
  String get iarActionCallSettingsTitle => 'Anrops- og gruppechatinnstillinger';

  @override
  String get iarActionCallSettingsDescription =>
      'Endre hvem som kan ringe deg eller legge deg til.';

  @override
  String get iarActionOpenButton => 'Åpne';

  @override
  String get iarActionDeleteMessageTitle => 'Slett denne meldingen';

  @override
  String get iarActionDeleteMessageDescription =>
      'Fjern den fra kanalen for alle.';

  @override
  String get iarActionDeleteMessageButton => 'Slett';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Slettet';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Denne meldingen er allerede slettet.';

  @override
  String get iarActionBanUserTitle => 'Bann denne brukeren';

  @override
  String get iarActionBanUserDescription =>
      'Åpne bann-dialogen for dette fellesskapet.';

  @override
  String get iarActionBanUserButton => 'Bann';

  @override
  String get iarActionBanUserBannedButton => 'Bannlyst';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Denne brukeren er allerede bannlyst fra fellesskapet.';

  @override
  String get iarCloseDmConfirmTitle => 'Lukk DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Lukk din nåværende DM med $name. Dette blokkerer dem ikke; du kan åpne den igjen senere.';
  }

  @override
  String get iarSuccessTitle => 'Rapport sendt';

  @override
  String get iarSuccessBody =>
      'Vårt sikkerhetsteam gjennomgår den. Vi sender deg en DM og e-post når vi har kommet til en avgjørelse.';

  @override
  String get iarAlreadyReportedTitle => 'Allerede rapportert';

  @override
  String get iarAlreadyReportedBody =>
      'Du har allerede rapportert denne meldingen. Vårt sikkerhetsteam gjennomgår den.';

  @override
  String get iarBackButton => 'Tilbake';

  @override
  String get iarContinueButton => 'Fortsett';

  @override
  String get iarSendReportButton => 'Send rapport';

  @override
  String get iarDoneButton => 'Ferdig';

  @override
  String get iarCouldntSendToast => 'Kunne ikke sende rapporten. Prøv igjen.';

  @override
  String get iarRateLimitedToast =>
      'Du rapporterer for fort. Vent et øyeblikk og prøv igjen.';

  @override
  String get iarReportSentToast =>
      'Rapport sendt. Vårt sikkerhetsteam vil gjennomgå den.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Blokker $name? De vil ikke kunne sende deg meldinger eller venneforespørsler. Du kan fjerne blokkeringen senere.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Kunne ikke blokkere denne brukeren. Prøv igjen.';

  @override
  String get iarCloseDmSuccessToast => 'DM lukket.';

  @override
  String get iarCloseDmFailedToast =>
      'Kunne ikke lukke denne DM-en. Prøv igjen.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Kunne ikke forlate dette fellesskapet. Prøv igjen.';

  @override
  String get chatMessageSuppressEmbeds => 'Skjul forhåndsvisninger';

  @override
  String get chatMessageUnsuppressEmbeds => 'Vis forhåndsvisninger';

  @override
  String get chatMessageDelete => 'Slett melding';

  @override
  String get chatMessageDeleteConfirmTitle => 'Slett melding';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Er du sikker på at du vil slette denne meldingen?';

  @override
  String get chatMessageDeleteAttachment => 'Slett vedlegg';

  @override
  String get chatMessageEditAttachmentAltText => 'Rediger alternativ tekst';

  @override
  String get chatMessageMore => 'Mer';

  @override
  String get chatEditingMessage => 'Redigerer melding';

  @override
  String get chatReplyOriginalDeleted => 'Opprinnelig melding ble slettet';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Opprinnelig melding kunne ikke lastes';

  @override
  String get chatReplyAttachedMedia => 'Meldingen inneholder vedlagt media';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blokkerte meldinger',
      one: '1 blokkert melding',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potensielle spam-meldinger',
      one: '1 potensiell spam-melding',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Svar skjult fordi den opprinnelige forfatteren er blokkert.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Svar skjult fordi den opprinnelige forfatteren er merket som spammer.';

  @override
  String get devMarkAsSpamLocally => 'Merk som søppel lokalt';

  @override
  String get devIgnoreSpamFlag => 'Ignorer spamflagg';

  @override
  String get chatMessagesLoadError => 'Kunne ikke laste meldinger.';

  @override
  String get chatReplyMentionOverrideTitle => 'Overstyre varslingspreferanse?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname foretrekker å bli @nevnt ved svar. Vil du sende uten varsel likevel?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname foretrekker svar uten @nevning. Send med nevning likevel?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorer preferanse';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klikk for å deaktivere varsling av brukeren du svarer på.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klikk for å aktivere varsling av brukeren du svarer på.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Nevn brukeren som svarer';

  @override
  String get chatReplyMentionOn => 'På';

  @override
  String get chatReplyMentionOff => 'Av';

  @override
  String get chatReplyCancel => 'Avbryt svar';

  @override
  String get chatEditMessageHint => 'Rediger melding';

  @override
  String get chatEditNoChanges => 'Ingen endringer å lagre';

  @override
  String get chatChannelNotReady =>
      'Denne kanalen er ikke klar ennå. Prøv igjen om et øyeblikk.';

  @override
  String get chatMessageEdited => '(redigert)';

  @override
  String get chatMessageSilent => 'Dette var en @silent-melding.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'I dag kl. $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'I går kl. $time';
  }

  @override
  String get mediaViewerImagePreview => 'Forhåndsvisning av bilde';

  @override
  String get mediaViewerClose => 'Lukk medievise';

  @override
  String get mediaViewerOpenInBrowser => 'Åpne i nettleser';

  @override
  String get mediaViewerOptions => 'Alternativer for medier';

  @override
  String get mediaViewerCopyLink => 'Kopier lenke';

  @override
  String get mediaViewerForward => 'Videresend';

  @override
  String get mediaViewerZoomIn => 'Zoom inn';

  @override
  String get mediaViewerZoomOut => 'Zoom ut';

  @override
  String get mediaViewerPreviousAttachment => 'Forrige vedlegg';

  @override
  String get mediaViewerNextAttachment => 'Neste vedlegg';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Vedlegg $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Lukk';

  @override
  String get chatAttachmentVideoToggleControls => 'Vis/skjul videokontroller';

  @override
  String get chatAttachmentVideoMute => ' Demp video';

  @override
  String get chatAttachmentVideoUnmute => 'Fjern demping av video';

  @override
  String get chatAttachmentVideoPlay => 'Spill av video';

  @override
  String get chatAttachmentVideoPause => 'Pause video';

  @override
  String get chatAttachmentVideoProgress => 'Videoens fremdrift';

  @override
  String get chatVideoPlaybackFailed => 'Kunne ikke spille av denne videoen.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Varsle brukere med denne rollen som har tillatelse til å se denne kanalen.';

  @override
  String get composerAutocompleteSuggestions => 'Forslag';

  @override
  String get composerAutocompleteCommandsHeading => 'Kommandoer';

  @override
  String get composerAutocompleteChoicesHeading => 'Valg';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Valgfrie argumenter';

  @override
  String get composerAutocompleteChannelsHeading => 'Kanaler';

  @override
  String get composerAutocompleteMembersHeading => 'Medlemmer';

  @override
  String get composerAutocompleteUsersHeading => 'Brukere';

  @override
  String get composerAutocompleteMentionsHeading => 'Nevninger';

  @override
  String get composerAutocompleteRolesHeading => 'Roller';

  @override
  String get composerAutocompleteMediaHeading => 'Medier';

  @override
  String get composerAutocompleteStickersHeading => 'Klistremerker';

  @override
  String get composerAutocompleteGifsHeading => 'GIF-er';

  @override
  String get composerAutocompleteNoGifs => 'Ingen GIF-er funnet';

  @override
  String get composerCommandShrugDescription =>
      'Legger til ¯\\_(ツ)_/¯ i meldingen din.';

  @override
  String get composerCommandTableflipDescription =>
      'Legger til (╯°□°)╯︵ ┻━┻ i meldingen din.';

  @override
  String get composerCommandUnflipDescription =>
      'Legger til ┬─┬ ノ( ゜-゜ノ) i meldingen din.';

  @override
  String get composerCommandMeDescription =>
      'Send en handlingsmelding (vises i kursiv).';

  @override
  String get composerCommandSpoilerDescription =>
      'Send en spoilermelding (pakkes inn i spoilertagger).';

  @override
  String get composerCommandTtsDescription => 'Send en tekst-til-tale-melding.';

  @override
  String get composerCommandNickDescription =>
      'Endre kallenavnet ditt i dette fellesskapet.';

  @override
  String get composerCommandKickDescription =>
      'Spark et medlem ut av dette fellesskapet.';

  @override
  String get composerCommandBanDescription =>
      'Utesteng et medlem fra dette fellesskapet.';

  @override
  String get composerCommandMsgDescription =>
      'Send en direktemelding til en bruker.';

  @override
  String get composerCommandSavedDescription => 'Send et lagret medieelement.';

  @override
  String get composerCommandStickerDescription => 'Send et klistremerke.';

  @override
  String get composerCommandGifDescription => 'Søk etter og send en GIF.';

  @override
  String get composerCommandMemberOption => 'Medlemmet som skal målrettes.';

  @override
  String get composerCommandReasonOption => 'Årsak (valgfritt).';

  @override
  String get composerCommandMessageOption => 'Meldingen som skal sendes.';

  @override
  String get composerCommandQueryOption => 'Hva du skal søke etter.';

  @override
  String get composerCommandNicknameOption =>
      'Ditt nye kallenavn, eller la stå tomt for å tilbakestille det.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Hvor mye av medlemmets nylige meldingshistorikk som skal slettes.';

  @override
  String get composerCommandDeleteMessagesNone => 'Ikke slett noen';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Forrige $count dager';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Siste 24 timer';

  @override
  String get composerCommandOptionRequired =>
      'Dette alternativet er påkrevd. Vennligst oppgi en verdi.';

  @override
  String get composerCommandClear => 'Fjern kommando';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Du endret kallenavnet ditt i dette fellesskapet fra **$previousNickname** til **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Ukjent bruker';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Kunne ikke sende melding til **$username**. Personen kan ha deaktivert direktemeldinger, eller du kan være blokkert.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count mer';
  }

  @override
  String get addGuildModalTitle => 'Legg til et fellesskap';

  @override
  String get addGuildModalLandingDescription =>
      'Opprett et nytt fellesskap eller bli med i et eksisterende.';

  @override
  String get addGuildCreateCommunity => 'Opprett fellesskap';

  @override
  String get addGuildJoinCommunity => 'Bli med i fellesskap';

  @override
  String get addGuildImportDiscordTemplate => 'Importer Discord-mal';

  @override
  String get addGuildJoinTitle => 'Bli med i et fellesskap';

  @override
  String get addGuildJoinDescription =>
      'Skriv inn invitasjonslenken for å bli med i et fellesskap.';

  @override
  String get addGuildInviteLinkLabel => 'Invitasjonslenke';

  @override
  String get addGuildJoinSubmit => 'Bli med i fellesskap';

  @override
  String get addGuildInviteInvalid =>
      'Denne invitasjonen er ugyldig eller har utløpt.';

  @override
  String get addGuildJoinFailed =>
      'Kunne ikke bli med i fellesskapet. Prøv igjen.';

  @override
  String get addGuildCreateTitle => 'Opprett et fellesskap';

  @override
  String get addGuildCreateDescription =>
      'Opprett et fellesskap der du og vennene dine kan chatte.';

  @override
  String get addGuildCreateNameLabel => 'Fellesskapsnavn';

  @override
  String get addGuildCreateSubmit => 'Opprett nettsamfunn';

  @override
  String get addGuildCreateFailed =>
      'Kunne ikke opprette fellesskap. Prøv igjen.';

  @override
  String get addGuildCreateClaimTitle => 'Gjør krav på kontoen din';

  @override
  String get addGuildCreateClaimDescription =>
      'Du må bekrefte kontoen din før du kan opprette et fellesskap.';

  @override
  String get addGuildCreateVerifyTitle => 'Bekreft e-posten din';

  @override
  String get addGuildCreateVerifyDescription =>
      'Du må bekrefte e-postadressen din før du kan opprette et fellesskap.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animerte ikoner støttes ikke når du oppretter et nytt fellesskap. Bruk et statisk bilde.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Ved å opprette et fellesskap godtar du å følge og opprettholde ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName retningslinjer for fellesskapet';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Denne instansen er et enkelt fellesskap, så ekstra fellesskap kan ikke opprettes.';

  @override
  String get addGuildCreateChangeIcon => 'Endre ikon';

  @override
  String get addGuildCreateIconLabel => 'Fellesskapsikon';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Maks 10 MB. Anbefalt: 512×512 piksler';

  @override
  String get addGuildImportDescription =>
      'Lim inn en Discord-mal-URL for å importere strukturen til et nytt fellesskap.';

  @override
  String get addGuildImportUrlLabel => 'Mal-URL';

  @override
  String get addGuildImportUrlInvalid =>
      'Skriv inn en gyldig Discord-mal-URL eller kode.';

  @override
  String get addGuildImportFetchFailed =>
      'Kunne ikke hente malen for fellesskapet. Malen finnes kanskje ikke, eller den eksterne tjenesten er utilgjengelig.';

  @override
  String get addGuildImportInvalidResponse =>
      'Dette ser ikke ut som et gyldig malrespons.';

  @override
  String get addGuildImportTemplateLabel => 'Mal';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount tekst, $voiceChannelCount tale, $categoryCount kategorier, $roleCount roller';
  }

  @override
  String get addGuildImportRemoveIcon => 'Fjern ikon';

  @override
  String get addGuildImportTemplateInvalid =>
      'Fellesskapmal-dataene er ugyldige eller feilformaterte.';

  @override
  String get addGuildPackInstalled => 'Pakke installert.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Fjern alle reaksjoner';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Er du sikker på at du vil fjerne alle reaksjoner fra denne meldingen?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Fjern festing av melding';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Send denne festingen tilbake i tid?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username festet $messageLink til denne kanalen. Se $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'en melding';

  @override
  String get systemPinMessageAllPinsLink => 'alle festede meldinger';

  @override
  String get channelPinsEmptyTitle => 'Ingen festede meldinger';

  @override
  String get channelPinsEmptyDescription => 'Festede meldinger vises her.';

  @override
  String get channelDetailsFallbackTitle => 'Detaljer';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Gruppedm · $count medlemmer';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Vil du avslutte samtalen med $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Forlat $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Kanalinnstillinger';

  @override
  String get channelDetailsGroupSettingsTitle => 'Gruppinnstillinger';

  @override
  String get channelDetailsDmSettingsTitle => 'DM-innstillinger';

  @override
  String get channelDetailsInvitePeople => 'Inviter folk';

  @override
  String get channelDetailsCopyLink => 'Kopier lenke';

  @override
  String get channelMenuCopyChannelLink => 'Kopier kanallenke';

  @override
  String get channelMenuCopyRedirectLink => 'Kopier videresendingslenke';

  @override
  String get channelDetailsAddFriendsToGroup => 'Legg til venner i gruppen';

  @override
  String get channelDetailsGroupInvites => 'Gruppeinvitasjoner';

  @override
  String get channelDetailsEditChannel => 'Rediger kanal';

  @override
  String get channelDetailsDeleteChannel => 'Slett kanal';

  @override
  String get channelSettingsCategorySettingsTitle => 'Kategoriinnstillinger';

  @override
  String get channelSettingsEditCategory => 'Rediger kategori';

  @override
  String get channelSettingsTabOverview => 'Oversikt';

  @override
  String get channelSettingsTabPermissions => 'Tillatelser';

  @override
  String get channelSettingsTabInvites => 'Invitasjoner';

  @override
  String get channelSettingsTabWebhooks => 'Webhooker';

  @override
  String get channelSettingsDeleteChannel => 'Slett kanal';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Er du sikker på at du vil slette $channelName? Dette kan ikke angres.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Er du sikker på at du vil slette $categoryName? Dette kan ikke angres.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Slett kategori';

  @override
  String get channelSettingsChannelUpdated => 'Kanalen er oppdatert';

  @override
  String get channelSettingsChannelName => 'Kanalnavn';

  @override
  String get channelSettingsCategoryName => 'Kategorinavn';

  @override
  String get channelSettingsMyCategory => 'Min kategori';

  @override
  String get categoryExpandCategory => 'Utvid kategori';

  @override
  String get categoryCollapseCategory => 'Skjul kategori';

  @override
  String get categoryExpandAllCategories => 'Vis alle kategorier';

  @override
  String get categoryCollapseAllCategories => 'Skjul alle kategorier';

  @override
  String get categoryMuteCategory => 'Demp kategori';

  @override
  String get categoryUnmuteCategory => 'Slå på lyd for kategori';

  @override
  String get categoryCopyCategoryId => 'Kopier kategori-ID';

  @override
  String get categoryIdCopied => 'Kategori-ID kopiert';

  @override
  String get channelSettingsChannelNamePlaceholder => 'generelt';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Emne';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Legg til et tema i denne kanalen';

  @override
  String get channelSettingsInsertEmoji => 'Sett inn emoji';

  @override
  String get channelSettingsTopicTooLongTitle => 'Kanalemnet er for langt.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Kort ned emnet og prøv igjen.';

  @override
  String get channelSettingsSlowmode => 'Sakte modus';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Ventetid mellom meldinger. «$bypassSlowmodePermissionLabel» kan omgå dette.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Av';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minutter';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours timer';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minutt';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour time';
  }

  @override
  String get channelSettingsVoiceQuality => 'Talekvalitet';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Høyere bithastighet = bedre kvalitet og høyere båndbreddebruk.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Antall deltakere';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maksimalt antall medlemmer som kan bli med samtidig. 0 betyr ubegrenset.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deltakere',
      one: '1 deltaker',
      zero: '∞ Ingen grense',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Tilkoblingsgrense';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maksimalt antall aktive tilkoblinger ett medlem kan ha i denne kanalen.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tilkoblinger',
      one: '1 tilkobling',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Taleregion';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Velg en stemmeregion for denne kanalen. Automatisk bruker nærmeste region.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatisk';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Kunne ikke laste inn stemmeregioner';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Prøv igjen om en liten stund.';

  @override
  String get channelSettingsResetSlider =>
      'Tilbakestill glidebryteren til standardverdi';

  @override
  String get channelSettingsAdvanced => 'Avansert';

  @override
  String get channelSettingsMatureContentOverride =>
      'Tilsidesettelse av voksent innhold';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Skriv over innstillingen for $scopeLevel-nivå for denne kanalen. Voksent innhold vises bak en port før inngang.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Arv';

  @override
  String get channelSettingsMatureContentOn => 'På';

  @override
  String get channelSettingsMatureContentOff => 'Av';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Merker denne kanalen for voksent innhold.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'La denne kanalen være uten aldersgrense for modent innhold.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Arvet fra $inheritedSourceLabel: på';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Arvet fra $inheritedSourceLabel: av';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'kategori';

  @override
  String get channelSettingsMatureContentCommunitySource => 'fellesskap';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategori';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Fellesskap';

  @override
  String get channelSettingsContentWarningToggle =>
      'Vis en innholdsadvarsel i denne kanalen';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Slår på en samtykkeprompt før du går inn i denne kanalen.';

  @override
  String get channelSettingsContentWarningText => 'Egendefinert advarselstekst';

  @override
  String get channelSettingsContentWarningDefault =>
      'Dette inneholder sensitivt innhold.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Du trenger tillatelsen \"$manageChannelsPermissionLabel\" for å redigere disse tillatelsene.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Du trenger tillatelsen \"$manageRolesPermissionLabel\" for å redigere disse tillatelsene.';
  }

  @override
  String get channelSettingsUnknownRole => 'Ukjent rolle';

  @override
  String get channelSettingsUnknownUser => 'Ukjent bruker';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Tilgangsoverstyringer';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Rediger tilgang for $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Tilbake til overstyringer';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Konfigurer grunntilgang for denne kanalen';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Konfigurer overstyringer for denne rollen';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Konfigurer overstyringer for dette medlemmet';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Søk i tillatelser …';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Kanaltilgang oppdatert';

  @override
  String get channelSettingsPermissionsTitle => 'Tilgangskontroll';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Denne kanalen er synkronisert med overordnet kategori ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Denne kanalen er ikke synkronisert med overordnet kategori ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Synkroniser med kategori';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanalen er synkronisert med overordnet kategori';

  @override
  String get channelSettingsPermissionsAddOverride => 'Legg til overstyring';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Søk etter roller eller medlemmer …';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Roller og medlemmer';

  @override
  String get channelSettingsDeleteInvite => 'Slett invitasjon';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Slette denne invitasjonen? Kan ikke angres.';

  @override
  String get channelSettingsCopyInviteCode => 'Kopier invitasjonskode';

  @override
  String get channelSettingsCopyInviteUrl => 'Kopier invitasjonslenke';

  @override
  String get channelSettingsWebhookCreated => 'Webhook opprettet';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Kunne ikke opprette webhook';

  @override
  String get channelSettingsCreateWebhook => 'Opprett webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Administrer invitasjonslenker for denne kanalen.';

  @override
  String get channelSettingsInvitesCreate => 'Opprett invitasjon';

  @override
  String get channelSettingsInvitesEmpty => 'Ingen invitasjonslenker';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Denne kanalen har ingen invitasjonslenker ennå. Opprett en for å invitere folk til denne kanalen.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Det oppsto en feil under lasting av invitasjonslenkene for denne kanalen. Prøv igjen.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Administrer innkommende webhooks som kan legge ut meldinger i denne kanalen.';

  @override
  String get channelSettingsWebhooksEmpty => 'Ingen webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Det er ingen webhooks konfigurert for denne kanalen. Opprett en webhook for å la eksterne apper legge ut meldinger.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Denne kanalen støtter ikke webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Du trenger tillatelsen «$permission» for å se og redigere webhooks for denne kanalen.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Kunne ikke laste inn webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Det oppsto en feil under lasting av webhooks for denne kanalen. Prøv igjen.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Opprettet av $creator den $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Ukjent bruker';

  @override
  String get channelSettingsWebhooksAvatar => 'Profilbilde';

  @override
  String get channelSettingsWebhooksUploadImage => 'Last opp bilde';

  @override
  String get channelSettingsWebhooksRemove => 'Fjern';

  @override
  String get channelSettingsWebhooksName => 'Navn';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook-navn';

  @override
  String get channelSettingsWebhooksChannel => 'Kanal';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook-URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopier webhook-URL';

  @override
  String get channelSettingsWebhooksDelete => 'Slett webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Kunne ikke slette denne webhooken';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Slett denne webhooken? Kan ikke angres.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Prøv igjen om en liten stund.';

  @override
  String get channelMenuOpenChat => 'Åpne chat';

  @override
  String get channelMenuDuplicateChannel => 'Dupliser kanal';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Tilbakestill avtale om voksent innhold';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Slette meldingene dine i denne kanalen?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Dette vil slette alle meldingene du har sendt i denne kanalen permanent. Dette kan ikke angres.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Slett meldingene mine';

  @override
  String get channelMenuDeletedYourMessages => 'Slettet meldingene dine';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Kunne ikke slette meldingene dine';

  @override
  String get channelDetailsSystemMessage => 'Systemmelding';

  @override
  String get channelDetailsTextChannel => 'Tekstkanal';

  @override
  String get channelDetailsVoiceChannel => 'Talekanal';

  @override
  String get channelDetailsCategory => 'Kategori';

  @override
  String get channelDetailsLinkChannel => 'Koble til kanal';

  @override
  String get channelDetailsGenericChannel => 'Kanal';

  @override
  String get channelDetailsMutedConversation => 'Dempet samtale';

  @override
  String get channelDetailsUnmutedConversation => 'Samtale demutet';

  @override
  String get channelDetailsMutedChannel => 'Kanal dempet';

  @override
  String get channelDetailsUnmutedChannel => 'Kanalen ble dempet';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Varslingsinnstillinger oppdatert';

  @override
  String get channelDetailsTabMembers => 'Medlemmer';

  @override
  String get channelDetailsTabPins => 'Festede meldinger';

  @override
  String get channelDetailsActionMute => 'Demp';

  @override
  String get channelDetailsActionUnmute => 'Slå på lyd';

  @override
  String get channelDetailsActionSearch => 'Søk';

  @override
  String get channelDetailsActionMore => 'Mer';

  @override
  String get channelDetailsMembersEmptyTitle => 'Ingen medlemmer å vise';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Medlemmer vil vises her når fellesskapsdataene er lastet.';

  @override
  String get memberListPermissionDeniedTitle => 'Du kan ikke se medlemmer';

  @override
  String get memberListPermissionDeniedBody =>
      'Du kan ikke se medlemmene av denne kanalen i dette fellesskapet';

  @override
  String get memberListUnavailableTitle => 'Medlemsliste utilgjengelig';

  @override
  String get memberListUnavailableBody =>
      'Medlemslister er midlertidig utilgjengelige i dette fellesskapet';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Kunne ikke laste inn festede meldinger';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Medlemmer med \"Fest meldinger\"-tillatelsen kan feste meldinger som alle kan se.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Du kan feste meldinger i denne samtalen som alle kan se.';

  @override
  String get channelDetailsPinsEndReached => 'Du har nådd slutten';

  @override
  String get channelHeaderOpenDetails => 'Åpne kanalinfo';

  @override
  String get channelHeaderPinnedMessages => 'Festede meldinger';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Festede meldinger, uleste';

  @override
  String get channelHeaderMemberList => 'Medlemsliste';

  @override
  String get channelHeaderInbox => 'Innboks';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Varslingsinnstillinger, dempet';

  @override
  String get channelDetailsSearchTitle => 'Søk';

  @override
  String get channelDetailsSearchHint => 'Søk i meldinger';

  @override
  String get channelDetailsSearchFilterFrom => 'Fra';

  @override
  String get channelDetailsSearchFilterHas => 'Har';

  @override
  String get channelDetailsSearchFilterIn => 'I';

  @override
  String get channelDetailsSearchFilterMentions => 'Nevninger';

  @override
  String get channelDetailsSearchFilterMore => 'Mer';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktiv';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kanaler';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count brukere';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Bruker';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtrer etter kanal';

  @override
  String get channelDetailsSearchChannelsHint => 'Søk i kanaler';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Ingen kanaler funnet';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Festet';

  @override
  String get channelDetailsSearchPinnedTrue => 'Kun festet';

  @override
  String get channelDetailsSearchPinnedFalse => 'Ekskluder festet';

  @override
  String get channelDetailsSearchClearFilter => 'Tøm';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Forfattertype';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Dato';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Datomodus';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Velg en dato';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link-vertsnavn';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Filnavn inneholder';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Filtype';

  @override
  String get channelDetailsSearchContentPoll => 'Avstemning';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Meldinger med en avstemning';

  @override
  String get channelDetailsSearchContentForward => 'Videresend';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Videresendte meldinger';

  @override
  String get channelDetailsSearchFilterSort => 'Sorter';

  @override
  String get channelHeaderSearchFiltersTitle => 'Søke filtre';

  @override
  String get channelHeaderSearchRecentTitle => 'Nylige søk';

  @override
  String get channelHeaderSearchUsersTitle => 'Brukere';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanaler';

  @override
  String get channelHeaderSearchValuesTitle => 'Verdier';

  @override
  String get channelHeaderSearchDatesTitle => 'Datoer';

  @override
  String get channelHeaderSearchDefaultBadge => 'Standard';

  @override
  String get channelHeaderSearchClearHistory => 'Tøm';

  @override
  String get channelHeaderSearchFilterDescFrom => 'en bruker';

  @override
  String get channelHeaderSearchFilterDescMentions => 'en bruker';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'lenke, innbygg, bilde, video, lyd, fil, klistremerke, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'en dato eller et datoområde';

  @override
  String get channelHeaderSearchFilterDescOn => 'en dato eller et datoområde';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'en dato eller et datoområde';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'en dato eller et datoområde';

  @override
  String get channelHeaderSearchFilterDescIn => 'en kanal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'sant eller usant';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'bruker, bot eller webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'et vertsnavn, f.eks. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'del av et vedleggs filnavn';

  @override
  String get channelHeaderSearchFilterDescFileType => 'en filtype, f.eks. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'tidsstempel eller relevans';

  @override
  String get channelHeaderSearchFilterDescOrder => 'stigende eller synkende';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString resultater',
      one: '1 resultat',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtrer etter bruker';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtrer etter innhold';

  @override
  String get channelDetailsSearchSortBy => 'Sorter resultater etter';

  @override
  String get channelDetailsSearchIn => 'Søk i';

  @override
  String get channelDetailsSearchEmptyTitle => 'Søk i denne samtalen';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Skriv inn tekst, en forfatter eller et innholdsfilter for å finne meldinger.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Meldinger indekseres';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Prøv igjen om litt når søket er ferdig med å indeksere dette omfanget.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Ingen resultater';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Prøv andre søkeord eller filtre.';

  @override
  String get channelDetailsMembersOnline => 'Pålogget';

  @override
  String get channelDetailsMembersOffline => 'Frakoblet';

  @override
  String get channelDetailsMemberYou => 'Deg';

  @override
  String get channelDetailsSearchUsersHint => 'Søk etter brukere';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Skriv for å søke etter medlemmer';

  @override
  String get channelDetailsSearchUsersEmpty => 'Ingen brukere funnet';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Ingen brukere tilgjengelig';

  @override
  String get channelDetailsDone => 'Ferdig';

  @override
  String get channelDetailsHasFilterPrompt => 'Vis meldinger som inneholder:';

  @override
  String get channelDetailsRetry => 'Prøv igjen';

  @override
  String get channelDetailsPinnedMessageTitle => 'Festet melding';

  @override
  String get channelDetailsSearchResultTitle => 'Søkeresultat';

  @override
  String get channelDetailsJumpToMessage => 'Hopp til melding';

  @override
  String get channelDetailsUnpinMessage => 'Fjern festing av melding';

  @override
  String get channelDetailsCopyMessageLink => 'Kopier meldingslenke';

  @override
  String get channelDetailsCopyMessageId => 'Kopier meldings-ID';

  @override
  String get channelDetailsMessageUnpinned => 'Melding løsnet';

  @override
  String get channelDetailsSearchScopeCurrentCommunity =>
      'Nåværende fellesskap';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Denne DM-en';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Alle fellesskap';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Kun alle direktemeldinger';

  @override
  String get channelDetailsSearchScopeAllDms => 'Alle direktemeldinger';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Kun åpne direktemeldinger';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Åpne direktemeldinger';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Alle direkte- og fellesskapsmeldinger';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Åpne direktemeldinger + fellesskap';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Søk kun i dette fellesskapet';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Søk kun i denne direktemeldingen';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'På tvers av alle fellesskap du er med i';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Kun i alle direktemeldinger du har vært med i';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'I alle direktemeldinger du har vært med i';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'I alle åpne direktemeldinger du har for øyeblikket';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'I alle åpne DM-er du har for øyeblikket';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'På tvers av alle direktemeldinger du noensinne har vært i + alle fellesskap du for øyeblikket er i';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'I alle direkte meldinger du har åpne + alle fellesskap du er medlem av';

  @override
  String get channelDetailsSearchSortNewest => 'Nyeste først';

  @override
  String get channelDetailsSearchSortOldest => 'Eldste først';

  @override
  String get channelDetailsSearchSortRelevance => 'Mest relevant';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Vis nyeste meldinger først';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Vis eldste meldinger først';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Vis de mest relevante meldingene først';

  @override
  String get channelDetailsSearchContentImage => 'Bildeopplasting';

  @override
  String get channelDetailsSearchContentVideo => 'Videoopplasting';

  @override
  String get channelDetailsSearchContentAudio => 'Lydopplasting';

  @override
  String get channelDetailsSearchContentFile => 'Filopplasting';

  @override
  String get channelDetailsSearchContentLink => 'Lenke';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Forhåndsvisning av lenke eller innhold';

  @override
  String get channelDetailsSearchContentSticker => 'Klistremerke';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Kun opplastede bildefiler';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Kun opplastede videofiler';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Kun opplastede lydfiler';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Alle opplastede vedlegg';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Skrev URL i meldingsteksten';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Forhåndsvisninger og rik tekst, ikke opplastinger';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Klistremerke lagt til meldingen';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count typer';
  }

  @override
  String get personalNotesTitle => 'Personlige notater';

  @override
  String get personalNotesSubtitle =>
      'Din private plass for tanker og påminnelser';

  @override
  String groupDmWelcome(String displayName) {
    return 'Velkommen til $displayName. Legg til venner for å få gruppen i gang.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Rediger gruppe';

  @override
  String get groupDmWelcomeAddFriends => 'Legg til venner i gruppen';

  @override
  String get dmGroupInvites => 'Invitasjoner';

  @override
  String get groupDmEditTitle => 'Rediger gruppe';

  @override
  String get groupDmEditDetailsTooltip => 'Rediger gruppeinformasjon';

  @override
  String get groupDmGroupName => 'Gruppenavn';

  @override
  String get groupDmMyGroup => 'Min gruppe';

  @override
  String get groupDmGroupNameMaxLength =>
      'Gruppenavnet kan ikke overstige 100 tegn';

  @override
  String get groupDmGroupIcon => 'Gruppeikon';

  @override
  String get groupDmUploadIcon => 'Last opp ikon';

  @override
  String get groupDmChangeIcon => 'Endre ikon';

  @override
  String get groupDmRemoveIcon => 'Fjern ikon';

  @override
  String get groupDmUpdated => 'Gruppe oppdatert';

  @override
  String get groupDmUpdateFailed => 'Kunne ikke oppdatere gruppen. Prøv igjen.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animerte ikoner støttes ikke. Bruk et statisk bilde.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animerte ikoner støttes ikke';

  @override
  String get groupDmIconFileTooLargeTitle => 'Ikonfilen er for stor';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Filen er for stor. Velg en fil som er mindre enn $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat =>
      'Filformatet for ikon støttes ikke';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Ugyldig filtype.';

  @override
  String get groupDmCouldntProcessImage => 'Kunne ikke behandle bildet';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Kunne ikke behandle det beskårede bildet. Prøv igjen.';

  @override
  String get groupDmInvalidImage => 'Ugyldig bilde';

  @override
  String get groupDmInvalidImageBody => 'Bildet er ugyldig. Prøv et annet.';

  @override
  String get groupDmAddFriends => 'Legg til';

  @override
  String get groupDmOrSendInvite => 'eller send en invitasjon til en venn:';

  @override
  String get groupDmGenerateInviteLink => 'Generer invitasjonslenke';

  @override
  String get groupDmCreateInvite => 'Opprett';

  @override
  String get groupDmInviteExpires24Hours =>
      'Invitasjonen din utløper om 24 timer';

  @override
  String get groupDmAddFriendFailed =>
      'Kunne ikke legge til denne vennen i gruppen. Prøv igjen.';

  @override
  String get groupDmAddFailed => 'Kunne ikke legge til i gruppe';

  @override
  String get groupDmGroupFull =>
      'Denne gruppen er full. Fjern noen før du legger til flere.';

  @override
  String get groupDmRateLimited =>
      'Du går for fort frem. Vent litt og prøv igjen.';

  @override
  String get groupDmCreateInviteFailed =>
      'Kunne ikke opprette invitasjonslenke';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Kunne ikke generere en invitasjonslenke. Prøv igjen.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Kunne ikke opprette en invitasjonslenke. Prøv igjen.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Du har ikke tillatelse til å opprette en invitasjon i denne kanalen.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Dette fellesskapet har nådd invitasjonsgrensen.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Invitasjonsoppretting er midlertidig deaktivert for dette fellesskapet.';

  @override
  String get groupDmCopyInviteFailed => 'Kunne ikke kopiere invitasjonslenke';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Bare gruppeeieren kan administrere invitasjoner.';

  @override
  String get groupDmNoInvitesCreated => 'Ingen invitasjoner opprettet';

  @override
  String get groupDmLoadingInvites => 'Laster inn invitasjoner …';

  @override
  String get groupDmInvitesLoadFailed =>
      'Kunne ikke laste inn invitasjoner. Prøv igjen.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Trekk tilbake denne invitasjonen? Kan ikke angres.';

  @override
  String get groupDmInviteRevoked => 'Invitasjon trukket tilbake';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Opprettet av $name. Utløper om $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Velkommen til $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'I begynnelsen var det ingenting. Så kom $channelName. Og det var bra.';
  }

  @override
  String get personalNotesComposerHint => 'Send deg selv en melding';

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
  String get composerOpenExpressionPicker => 'Åpne uttrykksvelger';

  @override
  String get composerShowKeyboard => 'Vis tastatur';

  @override
  String get composerCloseAttachmentPanel => 'Lukk vedleggsvelger';

  @override
  String get chatAttachmentPanelPhotos => 'Bilder';

  @override
  String get chatAttachmentPanelFiles => 'Filer';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Tilgang til bildebiblioteket kreves';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Tillat tilgang til bildebiblioteket for å bla gjennom og legge ved nylige bilder og videoer.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Åpne innstillinger';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', sender';

  @override
  String get messageAccessibilityFailedSuffix => ', sendt feil';

  @override
  String get messageAccessibilityAttachmentSummary => 'en vedlegg';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count vedlegg';
  }

  @override
  String get messageAccessibilityImageSummary => 'et bilde';

  @override
  String get messageAccessibilityVideoSummary => 'en video';

  @override
  String get messageAccessibilityAudioSummary => 'en lydfil';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'klistremerke $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'fil $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'en vedlegg med spoilere';

  @override
  String get messageAccessibilityEmbedSummary => 'en embedding';

  @override
  String get messageAccessibilityEmptySummary => 'en melding';

  @override
  String get personalNotesPrivateSpace => 'Din private plass';

  @override
  String get purgePersonalNotes => 'Slett personlige notater';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Dette vil permanent slette hver melding og vedlegg i dine personlige notater. Dette kan ikke angres.';

  @override
  String get purgePersonalNotesConfirmButton => 'Slett';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Slettet $count meldinger fra personlige notater';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Personlige notater var allerede tomme';

  @override
  String get purgePersonalNotesFailed => 'Kunne ikke tømme personlige notater';

  @override
  String get userSettingsGroupYourAccount => 'DIN KONTO';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Søk i innstillinger ...';

  @override
  String get userSettingsSearchFieldLabel => 'Søk i innstillinger';

  @override
  String get userSettingsSearchClear => 'Tøm søk';

  @override
  String get userSettingsSearchNoResults => 'Ingen innstillinger funnet';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sikkerhet og innlogging';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Gaver og koder';

  @override
  String get giftSettingsClaimAccountTitle => 'Gjør krav på kontoen din';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Gjør krav på kontoen din for å løse inn eller administrere Plutonium-gavekoder.';

  @override
  String get giftSettingsRedeemTitle => 'Løs inn en gave';

  @override
  String get giftSettingsRedeemDescription =>
      'Skriv inn en gavekode for å løse inn Plutonium for kontoen din.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Skriv inn gavekode…';

  @override
  String get giftSettingsRedeemButton => 'Løs inn';

  @override
  String get giftSettingsRedeemSuccess =>
      'Gaven ble løst inn. Nyt Plutoniumet ditt.';

  @override
  String get giftSettingsPurchasedTitle => 'Kjøpte gaver';

  @override
  String get giftSettingsPurchasedDescription =>
      'Administrer dine kjøpte Plutonium-gavekoder. Del gave-URL-en med noen spesiell, eller løs den inn selv!';

  @override
  String get giftSettingsEmptyTitle => 'Ingen gaver ennå';

  @override
  String get giftSettingsEmptyDescription =>
      'Kjøp en Plutonium-gave fra Plutonium-fanen for å dele med venner.';

  @override
  String get giftSettingsGoToPlutonium => 'Gå til Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Kunne ikke laste inn gavebeholdning';

  @override
  String get giftSettingsLoadFailedDescription => 'Prøv igjen senere.';

  @override
  String get giftSettingsTryAgain => 'Prøv igjen';

  @override
  String get giftSettingsGiftUrl => 'Gave-URL';

  @override
  String get giftSettingsCopy => 'Kopier';

  @override
  String get giftSettingsCopied => 'Kopiert';

  @override
  String get giftSettingsGiftUrlCopied =>
      'Gave-URL kopiert til utklippstavlen!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Kunne ikke kopiere gave-URL';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Kjøpt $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Innløst $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Løst inn av $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Denne gaven er innløst';

  @override
  String get giftSettingsRedeemForYourself => 'Løs inn selv';

  @override
  String get giftSettingsShareWithFriend => 'Del med en venn';

  @override
  String get premiumPlutoniumTagline =>
      'Lås opp høyere grenser og eksklusive funksjoner, samtidig som du støtter en uavhengig kommunikasjonsplattform.';

  @override
  String get premiumPurchaseMode => 'Kjøpsmodus';

  @override
  String get premiumForMe => 'For meg';

  @override
  String get premiumAsAGift => 'Som gave';

  @override
  String get premiumMonthly => 'Månedlig';

  @override
  String get premiumYearly => 'Årlig';

  @override
  String get premiumPerMonth => 'per måned';

  @override
  String get premiumPerYear => 'per år';

  @override
  String get premiumOneTimePurchase => 'engangskjøp';

  @override
  String get premiumSave17 => 'Spar 17 %';

  @override
  String get premiumUpgradeNow => 'Oppgrader nå';

  @override
  String get premiumBuyGift => 'Kjøp gave';

  @override
  String get premiumOneYearGift => '1 års gave';

  @override
  String get premiumOneMonthGift => '1 måneds gave';

  @override
  String get premiumMostPopular => 'Mest populær';

  @override
  String get premiumScrollPrompt =>
      'Rull ned for å se alle fordelene som følger med Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Gratis vs. Plutonium';

  @override
  String get premiumFreeColumn => 'Gratis';

  @override
  String get premiumGiftSectionTitle => 'Gi Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Del Plutonium-opplevelsen med vennene dine ved å kjøpe et gaveabonnement.';

  @override
  String get premiumGiftBannerOne => 'Du har en ny gavekode som venter på deg!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Du har $count nye gavekoder som venter på deg!';
  }

  @override
  String get premiumViewGifts => 'Se gaver';

  @override
  String get premiumReadyToUpgrade => 'Klar for å oppgradere?';

  @override
  String get premiumReadyToBuyGift => 'Klar til å kjøpe en gave?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Månedlig $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Årlig $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 år $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 måned $price';
  }

  @override
  String get premiumManageSubscription => 'Administrer abonnement';

  @override
  String get premiumRedeemGiftCode => 'Løs inn gavekode';

  @override
  String get premiumGiftBadge => 'Gave';

  @override
  String get premiumCancelSubscriptionTitle => 'Avbryte abonnementet?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Du beholder fordelene dine frem til neste fornyelsesdato, og har deretter en 3-dagers respittperiode for å fornye abonnementet og beholde abonnementshistorikken din.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Avbryt abonnement';

  @override
  String get premiumKeepSubscription => 'Behold abonnementet';

  @override
  String get premiumPurchaseHistoryTitle => 'Kjøpshistorikk';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Dine siste fakturaer. For å endre betalingsmåten for abonnementet ditt, legg til eller velg en i faktureringsportalen og sett den som standard.';

  @override
  String get premiumManagePaymentMethods => 'Administrer betalingsmåter';

  @override
  String get premiumBillingHistory => 'Fakturahistorikk';

  @override
  String get premiumSelfServeRefundTitle => 'Selvbetjent refusjon';

  @override
  String get premiumSelfServeRefundButton => 'Refunder siste kjøp';

  @override
  String get premiumDisclaimerAgreementPrefix => 'Ved å kjøpe godtar du våre ';

  @override
  String get premiumDisclaimerAgreementPastPrefix => 'Ved kjøp godtok du våre ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' og ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktiv til $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Avbryter';

  @override
  String premiumCancelsOn(String date) {
    return 'Avbestilles den $date. Fordelene forblir aktive frem til da.';
  }

  @override
  String get premiumReactivateSubscription => 'Reaktiver';

  @override
  String premiumGiftedUntil(String date) {
    return 'Gitt til $date. Fornyes ikke automatisk.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Funksjon';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Ved å kjøpe godtar du våre $terms og $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Selvbetjent refusjon er tilgjengelig innen 3 dager etter betaling, én gang hver 30. dag. Refusjon av et abonnement kansellerer det. Kjøpere i EU/EØS fraskriver seg den 14-dagers angreretten ved utsjekk for å få umiddelbar tilgang til innhold. Bruk refusjonsknappen i appen i stedet for en tilbakeføring. Tilbakeføringer kan permanent begrense kontoen din. Stripe håndterer betaling sikkert. Vi ser aldri hele kortnummeret ditt.';

  @override
  String get premiumTermsOfService => 'Vilkår for bruk';

  @override
  String get premiumPrivacyPolicy => 'Personvernregler';

  @override
  String get premiumCheckoutStartFailedTitle => 'Kunne ikke starte betaling';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Noe gikk galt under betalingsprosessen. Prøv igjen om en liten stund.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Du har et gaveabonnement. Det fornyes ikke. Du kan løse inn flere gavekoder for å forlenge det. Gjentakende abonnementer kan startes etter at gaveperioden din er over.';

  @override
  String get premiumPlanUnavailable =>
      'Denne planen er ikke tilgjengelig. Kontakt kundestøtte.';

  @override
  String get premiumCompletePaymentTitle => 'Fullfør betaling';

  @override
  String get premiumCompletePaymentBody =>
      'Du navigerer nå til Stripe for å fullføre betalingen. Gå tilbake til Fluxer når du er ferdig.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Velg betalingsmåte';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Betal med Pix automático for å godkjenne gjentakende belastninger direkte fra din brasilianske bank. Eller velg bruk kort for å legge inn et kredittkort på Stripes neste skjerm.';

  @override
  String get premiumUsePix => 'Bruk Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Betal med UPI for å sette opp en RBI-kompatibel e-mandat fra din indiske bank. Eller velg bruk kort for å legge inn et kredittkort på Stripes neste skjerm.';

  @override
  String get premiumUseUpi => 'Bruk UPI';

  @override
  String get premiumUseCard => 'Bruk kort';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Kunne ikke åpne faktureringsportalen';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Noe gikk galt under åpningen av faktureringsportalen. Prøv igjen om et øyeblikk.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Du er allerede Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary inkluderer allerede permanent tilgang, så et gjentakende abonnement er ikke nødvendig. Du kan fortsatt kjøpe gaver til andre.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abonnementet finnes allerede';

  @override
  String get premiumExistingSubscriptionBody =>
      'Vi fant et eksisterende Fluxer Plutonium-abonnement for denne kontoen. Administrer det i den sikre faktureringsportalen for å oppdatere betalingsdetaljer eller sjekke fornyelsesstatus. Hvis du nettopp betalte, vent et minutt og lukk denne siden på nytt.';

  @override
  String get premiumPurchasesDisabledTitle => 'Kjøp er ikke tilgjengelig';

  @override
  String get premiumPurchasesDisabledBody =>
      'Kjøp er deaktivert for denne kontoen. Kontakt support@fluxer.app hvis dette ser feil ut.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Gjør krav på kontoen din for å kjøpe Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Du må bekrefte e-posten din før du kan kjøpe Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Egendefinert brukernavn-tagg';

  @override
  String get premiumPerkPerCommunityProfiles => 'Profiler per fellesskap';

  @override
  String get premiumPerkMessageScheduling => 'Meldingstidsplanlegging';

  @override
  String get premiumPerkProfileBadge => 'Profilmerke';

  @override
  String get premiumPerkCustomVideoBackgrounds =>
      'Egendefinerte videobakgrunner';

  @override
  String get premiumPerkEntranceSounds => 'Lyd ved inngang';

  @override
  String get premiumPerkCommunities => 'Fellesskap';

  @override
  String get premiumPerkMessageCharacterLimit => 'Tegngrense for meldinger';

  @override
  String get premiumPerkBookmarkedMessages => 'Bokmerkede meldinger';

  @override
  String get premiumPerkFileUploadSize => 'Filopplastingsstørrelse';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emneknapper og klistremerker';

  @override
  String get premiumPerkSavedMedia => 'Lagrede medier';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Bruk animerte emojier';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Global tilgang til emojier og klistremerker';

  @override
  String get premiumPerkVideoQuality => 'Videokvalitet';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animerte avatarer og profilbannere';

  @override
  String get premiumPerkEarlyAccess => 'Tidlig tilgang til nye funksjoner';

  @override
  String get premiumPerkCustomThemes => 'Egendefinerte temaer';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Opptil 4K/60 bps';

  @override
  String get userSettingsNavPrivacyDashboard => 'Personverndashbord';

  @override
  String get userSettingsNavAuthorizedApps => 'Autoriserte apper';

  @override
  String get userSettingsNavBlockedUsers => 'Blokkerte brukere';

  @override
  String get userSettingsNavLinkedDevices => 'Tilkoblede enheter';

  @override
  String get userSettingsNavConnections => 'Tilkoblinger';

  @override
  String get userSettingsNavLookAndFeel => 'Utseende';

  @override
  String get userSettingsNavAccessibility => 'Tilgjengelighet';

  @override
  String get userSettingsNavChat => 'Meldinger og medier';

  @override
  String get userSettingsNavAudioAndVideo => 'Lyd og video';

  @override
  String get userSettingsNavShortcuts => 'Snarveier';

  @override
  String get audioAndVideoAudioSectionTitle => 'Lyd';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Konfigurer mikrofonen, høyttalerne og stemmebehandlingen din.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Konfigurer kameraet og skjermdelingskvaliteten din.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Oppførsel under samtale';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Vis bekreftelsesvarsler under tale- og videosamtaler.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Inndataenhet';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Utdataenhet';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Standard';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Bruk høyttaler';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Når den er av, spilles lyden av gjennom ørepluggen eller tilkoblede hodetelefoner.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Inndatavolum';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Utgangsvolum';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Stemmebehandling';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Fokusert stemme';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Anbefalt. Renser mikrofonen din for klar tale.';

  @override
  String get audioAndVideoDirectInputLabel => 'Direkte inndata';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Sender lyden din uendret. Best hvis du bruker ekstern lydprogramvare.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Tilpasset';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Juster hver innstilling selv: støydemping, ekkokansellering og forsterkning.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Støyreduksjon';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Forbedret';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Ingen';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Ekkodemping';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatisk forsterkningskontroll';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Jevner ut volumet på mikrofonen din. Av når forbedret undertrykking er på.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mikrofontest';

  @override
  String get audioAndVideoMicTestStartLabel => 'Start mikrofontest';

  @override
  String get audioAndVideoMicTestStopLabel => 'Stopp mikrofontest';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName trenger tilgang til mikrofonen for å teste lyden din.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Speil kamera';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kamerakvalitet';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Skjermdelingskvalitet';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Bildefrekvens';

  @override
  String get audioAndVideoFrameRate15Label => '15 bilder/sek';

  @override
  String get audioAndVideoFrameRate30Label => '30 bilder/sek';

  @override
  String get audioAndVideoFrameRate60Label => '60 bilder/sek';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p og 60 FPS krever $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Denne instansen tillater for øyeblikket skjermdeling opptil 720p ved 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName trenger mikrofontilgang for å vise enhetene dine.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName trenger tilgang til kameraet for å vise enhetene dine.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Ikke spør når jeg skjuler kameraet mitt';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Ikke spør når du skjuler skjermdelingen min';

  @override
  String get userSettingsNavNotifications => 'Varsler';

  @override
  String get notificationsGeneralSectionTitle => 'Generelt';

  @override
  String get notificationsEnableNotificationsLabel => 'Slå på varsler';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Få varsler når du mottar meldinger. Du må kanskje tillate varsler for $productName i enhetsinnstillingene dine. For varslingskontroller per kanal/per fellesskap, åpne varslingsinnstillingene fra et fellesskaps meny.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Aktiver skrivebordsvarsler';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Bruker operativsystemets varslingssenter. For varslingsinnstillinger per kanal/fellesskap, høyreklikk på et fellesskapsikon og åpne varslingsinnstillinger.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Aktiver nettleservarsler';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Få varsler når du mottar meldinger. Du må kanskje tillate varsler i nettleserinnstillingene dine. For varslingskontroller per kanal/fellesskap, høyreklikk på et fellesskapsikon og åpne varslingsinnstillingene.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Tidsavbrudd for inaktive push-varsler';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName unngår å sende varsler til mobilenhetene dine når du bruker datamaskinen. Velg hvor lenge du må være inaktiv på datamaskinen før du mottar varsler.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minutt';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minutter';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Innstillinger for omtale';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Innstillinger for omtale i svar';

  @override
  String get notificationsMentionNoPreferenceName => 'Ingen preferanse';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respekter avsenderens intensjon, uten advarsel når de slår av/på @-omtaler';

  @override
  String get notificationsMentionPreferMentionName => 'Foretrekk @omtale';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Standard svarer på @omtaler deg, og advarer avsenderen hvis de deaktiverer det';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Foretrekker ingen @omtaler';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Svar utelater @omtaler som standard, og advarer avsenderen hvis de aktiverer det';

  @override
  String get notificationsTtsSectionTitle => 'Tekst-til-tale-varsler';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Aktiver /tts taleavspilling';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'La /tts lese meldingen din høyt. Hvis du deaktiverer innstillingen, blir disse kommandoene vanlig tekst.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Juster avspillingshastighet i ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Tilgjengelighet';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatisk opplesing av meldinger';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Konverterer innkommende innhold til tale, uavhengig av om det kom fra /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Alle kanaler';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Få alle innkommende meldinger lest opp, uansett hvilken kanal som er åpen.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Kun aktiv kanal';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Forteller kun kanalen du ser på. Fortellingen følger deg mellom kanaler.';

  @override
  String get notificationsTtsModeNeverName => 'Aldri automatisk';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Forbli stille med mindre noen kjører /tts manuelt.';

  @override
  String get notificationsTtsModeAriaLabel => 'Les opp alle meldinger';

  @override
  String get notificationsSoundsSectionTitle => 'Lyder';

  @override
  String get notificationsMasterVolumeLabel => 'Hovedvolum';

  @override
  String get notificationsMasterVolumeDescription =>
      'Angir nivået for alle lydeffekter. Overstyringer per lyd ignorerer dette.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Tilbakestill til standardvolum';

  @override
  String get notificationsDisableAllSoundsLabel => 'Deaktiver alle varsellyder';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Dine eksisterende varsellydinnstillinger blir bevart.';

  @override
  String get notificationsShowMoreSoundEffects => 'Vis flere lydeffekter';

  @override
  String get notificationsShowFewerSoundEffects => 'Vis færre lydeffekter';

  @override
  String get notificationsPreviewSound => 'Forhåndsvis lyd';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volum per lyd';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Angi egendefinerte volumer for individuelle lyder. Lyder uten en overstyring følger hovedvolumet.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktive tilpassede voluminnstillinger for lyder: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Følger hovedinnstilling • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Tilbakestill $label til hovedvolum';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Tilbakestill alle overstyringer';

  @override
  String notificationsMuteSound(String label) {
    return 'Slå av lyd for $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Slå på lyden for $label';
  }

  @override
  String get notificationsSoundMessage => 'Varsler for fellesskapsmeldinger';

  @override
  String get notificationsSoundDirectMessage => 'Varsler for direktemeldinger';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Varsler om meldinger i nåværende kanal';

  @override
  String get notificationsSoundMute => 'Demp stemme';

  @override
  String get notificationsSoundUnmute => 'Slå på lyd for tale';

  @override
  String get notificationsSoundDeaf => 'Stemme deaktivert';

  @override
  String get notificationsSoundUndeaf => 'Tale – ikke lenger dempet';

  @override
  String get notificationsSoundUserJoin => 'Bruker blir med i kanalen';

  @override
  String get notificationsSoundUserLeave => 'Bruker forlater kanal';

  @override
  String get notificationsSoundUserMove => 'Bruker flyttet kanal';

  @override
  String get notificationsSoundViewerJoin => 'Seer blir med i strømmen';

  @override
  String get notificationsSoundViewerLeave => 'Seer forlater strømmen';

  @override
  String get notificationsSoundVoiceDisconnect => 'Taleanrop avsluttet';

  @override
  String get notificationsSoundIncomingRing => 'Innkommende anrop';

  @override
  String get notificationsSoundCameraOn => 'Kamera på';

  @override
  String get notificationsSoundCameraOff => 'Kamera av';

  @override
  String get notificationsSoundScreenShareStart => 'Skjermdeling starter';

  @override
  String get notificationsSoundScreenShareStop => 'Skjermdeling stoppet';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Kunne ikke oppdatere tidspunkt for push-varsler. Prøv igjen.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Kunne ikke oppdatere varslingsinnstilling. Prøv igjen.';

  @override
  String get notificationsPermissionDeniedTitle => 'Varsler blokkert';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Kunne ikke aktivere varsler. Tillat varslingstillatelse for å fortsette.';

  @override
  String get userSettingsNavLanguageAndTime => 'Språk og tid';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Grensesnittspråk';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Velg språket som brukes i hele appen';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Åpne språkinnstillinger';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Tidsformat';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Velg hvordan klokkeslett vises i appen';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Valg av tidsformat';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automatisk';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-timers';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-timers';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Appspråk: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Systemlokale: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Bruk systemets språkinnstillinger for tidsformat';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Kunne ikke oppdatere tidsformat';

  @override
  String get userSettingsNavDefaultApps => 'Standardapper';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Nettleser';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Velg hvilken nettleser som åpnes når du trykker på en lenke.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Hvis en app er installert for et nettsted, vil lenker åpnes i den appen først.';

  @override
  String get defaultAppsWebBrowserInApp => 'Nettleser i appen';

  @override
  String get defaultAppsWebBrowserExternal => 'Ekstern nettleser';

  @override
  String get userSettingsNavAdvanced => 'Avansert';

  @override
  String get advancedPerformanceReportingTitle => 'Ytelsesrapportering';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Hjelp til å forbedre $productName ved å dele anonyme krasj- og ytelsesdata.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Send krasj- og ytelsesrapporter';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Alle rapporterte data er anonyme og sendes kun til $productName egen overvåkingstjeneste – ingen tredjepartsleverandører brukes.';
  }

  @override
  String get advancedSettingsConfigure => 'Konfigurer';

  @override
  String get advancedSettingsCategoryPrivacy => 'Personvern';

  @override
  String get advancedSettingsCategoryAppearance => 'Utseende';

  @override
  String get advancedSettingsCategoryAccessibility => 'Tilgjengelighet';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Medier';

  @override
  String get advancedSettingsCategoryVoice => 'Tale';

  @override
  String get advancedSettingsCategoryDeveloper => 'Utvikler';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'Aktiver tekstvalg';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Tillat å velge tekst i appen';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Aktiver miniatyrbilder for videosøk';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatyrbilde eller live-bilde mens videoen spilles av';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptisk tilbakemelding';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibrasjonsfeedback for trykk og handlinger. Synkroniseres ikke på tvers av enheter.';

  @override
  String get advancedSettingShowNekoLabel => 'Vis Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko-katt som jager musepekeren din';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Vis Neko på chatteinndataen din';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Zoom-animasjon ved oppstart';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Skaler ut logoen når du forlater startskjermen';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Tastaturtips';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Vis tastatursnarveishjelp i verktøytips';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Aktiver favoritter';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Vis favoritter i hele appen';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Atferd ved deltakelse i talekanal';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Bekreftelse eller dobbeltklikk for å bli med i samtaler i fellesskapet';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Krev dobbeltklikk for å bli med i talekanaler';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Bekreft før du blir med i talekanaler';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Send GIF-er automatisk når de er valgt';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Send GIF-er automatisk fra velgeren uten bekreftelse';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Lagre GIF-favoritter som lagret media';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Velg hvordan favoritt-GIF-er med stjerne lagres';

  @override
  String get advancedSettingMediaButtonsLabel => 'Medieknapper';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Tilpass hvilke knapper og indikatorer som vises på medievedlegg og innebygde elementer';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Last opp vedlegg før du sender';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Begynn å laste opp vedlegg så snart de legges til i meldingsfeltet';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Fjern sporingsparametere fra URL-er';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Fjern automatisk sporingsparametere fra URL-er i meldinger du sender';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Stol på alle eksterne lenker';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Hopp over advarsel om ekstern lenke for alle domener';

  @override
  String get advancedSettingSearchEnginesLabel => 'Søkemotorer';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Konfigurer søkemotorer som brukes fra valgt tekst';

  @override
  String get advancedSettingTranslatorsLabel => 'Oversettere';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Konfigurer oversetterleverandører som brukes på valgt tekst';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Omvendt bildesøk';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Leverandører for omvendt bildesøk';

  @override
  String get advancedSettingMessageActionBarLabel => 'Meldingshandlingslinje';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Tilpass handlingsfeltet som vises når du holder musepekeren over meldinger';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Autofullfør uttrykk';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Velg hva som vises når du skriver et kolon i meldingsfeltet';

  @override
  String get advancedSettingInputButtonsLabel => 'Meldingsknapper';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Velg hvilke knapper som skal vises i meldingsfeltet';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Rull til bunnen når du sender en melding';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Velg hvordan du vil navigere i chatten etter at du har sendt en melding';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Hopp over bekreftelse for \"Merk alle som lest\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Merk alle uleste innbokskanaler som lest umiddelbart, uten å spørre om bekreftelse';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Skjul dempede kanaler som standard';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Skjul kanaler du har dempet fra fellesskapets sidepaneler';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Vis GIF-indikator';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Vis indikator for utløp av vedlegg';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Vis sletteknapp';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Vis nedlastingsknapp';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Vis favorittknapp';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Vis knapp for å skjule innebygd innhold';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Vis handlingslinje for meldinger';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'Vis kun mer-knappen';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Vis hurtigreaksjoner';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Aktiver Shift for å utvide';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Vis standard-emoji i forslag til uttrykk';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Vis egendefinerte emojier i autofullfør for uttrykk';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Vis klistremerker i autofullfør for uttrykk';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Vis lagrede medier i autofullfør-uttrykk';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Vis GIF-knapp';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Vis medieknapp';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Vis klistremerkeknapp';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Vis emoji-knapp';

  @override
  String get advancedSettingShowSendButtonLabel => 'Vis send-knapp';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Vis varsler om nye enheter';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Spør om nye lydenheter';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Volumkontroller for tilkobling';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Vis volumkontroller for deltakere per enhet i stemmemenyer';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Visning av skjermdeling';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Forhåndsvisning, popup og oppførsel for strømmeminiatyrbilder';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Skjermdelingskodek';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Videokodek for skjermdeling';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatisk (anbefalt)';

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
      'Sett forhåndsvisning av skjermdeling på pause i bakgrunnen';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Skjul forhåndsvisning av strømmen min';

  @override
  String get advancedSettingDeveloperModeLabel => 'Aktiver utviklermodus';

  @override
  String get advancedSettingDeveloperModeDescription => 'Aktiver utviklermodus';

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
  String get advancedSettingTranslatorGoogle => 'Google Oversett';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Standard søkemotor';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Velg hvilken søkemotor som skal brukes som standard når du søker etter markert tekst.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Innebygde søkemotorer';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Aktiver eller deaktiver innebygde søkemotorer. Aktiverte søkemotorer vises i kontekstmenyen for meldinger når tekst er valgt.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Tilpassede søkemotorer';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Legg til dine egne søkemotorer med et egendefinert URL-mønster. Bruk «$query» som plassholder for søketeksten.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Legg til søkemotor';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Aktiver minst én søkemotor nedenfor.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Fjern søkemotor';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Standard oversetter';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Velg hvilken oversetter som skal brukes som standard når du oversetter valgt tekst.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Innebygde oversettere';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Aktiver eller deaktiver innebygde oversettere. Aktiverte oversettere vises i kontekstmenyen for meldinger når tekst er valgt.';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'Egendefinerte oversettere';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Legg til dine egne oversettere med et egendefinert URL-mønster. Bruk «$query» som plassholder for teksten som skal oversettes.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Legg til oversetter';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Aktiver minst én oversetter nedenfor.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Fjern oversetter';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Standard omvendt bildesøk';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Velg hvilken tjeneste for omvendt bildesøk som skal brukes som standard når du søker etter et bilde.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Innebygd omvendt bildesøk';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Aktiver eller deaktiver innebygde leverandører for omvendt bildesøk. Aktiverte leverandører vises i kontekstmenyen for bilder, avatarer, bannere, klistremerker og emojier.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Egendefinert omvendt bildesøk';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Legg til dine egne leverandører for omvendt bildesøk med et egendefinert URL-mønster. Bruk «$url» som plassholder for bilde-URL-en.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Legg til omvendt bildesøk';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Aktiver minst én leverandør for omvendt bildesøk nedenfor.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Fjern omvendt bildesøk';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Legg til søkemotor';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Rediger søkemotor';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Legg til oversettelsesleverandør';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Rediger oversettelsesleverandør';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Legg til søkemotor for omvendt bildesøk';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Rediger søkemotor for omvendt bildesøk';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Navn';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL-mønster';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Min søkemotor';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Min oversetter';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Mitt omvendte bildesøk';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Bruk \'$query\' der søketeksten skal settes inn.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Bruk «$query» der teksten som skal oversettes skal settes inn.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Bruk \'$url\' der bilde-URL-en skal settes inn.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Navn er påkrevd.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'URL-mønster er påkrevd.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Mønster for URL må inneholde \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL-mønsteret må inneholde plassholderen «$url».';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Nettadressen må være en gyldig URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Legg til';

  @override
  String get advancedSettingEditSearchProviderAction => 'Rediger';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Fjern';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Er du sikker på at du vil fjerne $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Applikasjoner';

  @override
  String get userSettingsNavAppLogs => 'App-logger';

  @override
  String get userSettingsNavDeveloperTools => 'Utviklerverktøy';

  @override
  String get userSettingsNavLimitsConfig => 'Grensekonfigurasjon';

  @override
  String get userSettingsNavFeatureFlags => 'Funksjonsflagg';

  @override
  String get userSettingsNavWhatsNew => 'Hva er nytt';

  @override
  String get userSettingsJoinFluxerLabs => 'Bli med i Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'App-lisenser';

  @override
  String get userSettingsAppLicensesDescription =>
      'Åpen kildekode-programvare som brukes av denne appen. Denne appen er bygget med Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Kunne ikke laste inn app-lisenser.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lisenser',
      one: '1 lisens',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Logg ut';

  @override
  String get quickSwitcherTabSearch => 'Søk';

  @override
  String get quickSwitcherTabFriends => 'Venner';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Søk etter kanaler, personer eller fellesskap';

  @override
  String get quickSwitcherSearchFriends => 'Søk etter venner';

  @override
  String get quickSwitcherNoMatchesFound => 'Ingen treff funnet';

  @override
  String get quickSwitcherEmptyHint =>
      'Prøv et annet navn eller bruk @ / # / ! / * prefikser for å filtrere resultater.';

  @override
  String get quickSwitcherSectionPeople => 'Personer';

  @override
  String get quickSwitcherSectionGroupMessages => 'Gruppemeldinger';

  @override
  String get quickSwitcherSectionTextChannels => 'Tekstkanaler';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Talekanaler';

  @override
  String get quickSwitcherSectionCommunities => 'Fellesskap';

  @override
  String get quickSwitcherSectionSettings => 'Innstillinger';

  @override
  String get quickSwitcherHomeLabel => 'Hjem';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direktemeldinger';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoritter';

  @override
  String get quickSwitcherUserSettingsLabel => 'Brukerinnstillinger';

  @override
  String get quickSwitcherNotificationsLabel => 'Varsler';

  @override
  String get quickSwitcherBookmarksLabel => 'Bokmerker';

  @override
  String get savedMessagesEmptyTitle => 'Ingen bokmerker';

  @override
  String get savedMessagesEmptyBody =>
      'Bokmerk meldinger for å lagre dem til senere.';

  @override
  String get savedMessagesEndBody => 'Her er det ikke mer å se.';

  @override
  String get savedMessagesRemoveTooltip => 'Fjern bokmerke';

  @override
  String get quickSwitcherMentionsLabel => 'Nevnelser';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Ingen venner ennå';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Legg til en venn for å komme i gang.';

  @override
  String get quickSwitcherFriendsNoMatchTitle => 'Ingen venner matcher søket';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Prøv et annet navn.';

  @override
  String get quickSwitcherSearchAliasUser => 'Bruker';

  @override
  String get quickSwitcherSearchAliasYou => 'Deg';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM-er';

  @override
  String get quickSwitcherSearchAliasMessages => 'Meldinger';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Stjernemerkede';

  @override
  String get quickSwitcherSearchAliasInbox => 'Innboks';

  @override
  String get quickSwitcherSearchAliasSaved => 'Lagrede';

  @override
  String get uiClose => 'Lukk';

  @override
  String get chatJumpToBottom => 'Hopp til bunnen';

  @override
  String get uiConfirm => 'Bekreft';

  @override
  String get uiLoading => 'Laster inn';

  @override
  String get uiSearch => 'Søk';

  @override
  String get uiStartCall => 'Start samtale';

  @override
  String get uiStartVideoCall => 'Start videosamtale';

  @override
  String get uiPlay => 'Spill av';

  @override
  String get uiPause => 'Pause';

  @override
  String get uiDownload => 'Last ned';

  @override
  String get uiMoreActions => 'Flere handlinger';

  @override
  String get uiUnsavedChanges => 'Ulagrede endringer';

  @override
  String get uiReset => 'Tilbakestill';

  @override
  String get uiOpenColorPicker => 'Åpne fargevelger';

  @override
  String get uiSelectPlaceholder => 'Velg';

  @override
  String get uiSearchPlaceholder => 'Søk';

  @override
  String get uiNoOptionsFound => 'Ingen alternativer funnet';

  @override
  String get uiDismissNotification => 'Lukk varsel';

  @override
  String get uiColorPickerTitle => 'Fargevelger';

  @override
  String get mentionConfirmTitle => 'Nevne alle?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Dette vil varsle $count medlemmer. Fortsette?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Dette vil varsle $count online medlemmer. Fortsette?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Dette vil varsle $count medlemmer med rollen $roleName. Fortsette?';
  }

  @override
  String get mentionConfirmButton => 'Nevn';

  @override
  String get composerEmojiUnavailable => 'Du kan ikke bruke den emojien her.';

  @override
  String get instanceUrlLabel => 'Instans-URL';

  @override
  String get instanceUrlPlaceholder =>
      'Skriv inn instans-URL (f.eks. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Tilbakestill til Fluxer';

  @override
  String get instanceConnect => 'Koble til';

  @override
  String get instanceConnecting => 'Kobler til…';

  @override
  String get instanceConnectFailed => 'Kunne ikke koble til instans';

  @override
  String get recentInstances => 'Nylige instanser';

  @override
  String removeRecentInstance(String domain) {
    return 'Fjern $domain fra nylige instanser';
  }

  @override
  String get instanceSheetTitle => 'Koble til instans';

  @override
  String get connectToDifferentInstance => 'Koble til en annen instans';

  @override
  String get changeInstance => 'Endre';

  @override
  String get instanceConnectionRequired =>
      'Koble til instansen for å logge inn';

  @override
  String get comingSoon => 'Kommer snart';

  @override
  String get guildNavbarDirectMessages => 'Direktemeldinger';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Utforsk samfunn som kan oppdages';

  @override
  String get discoveryExplore => 'Utforsk';

  @override
  String get discoveryExplorePublicCommunities => 'Utforsk offentlige samfunn';

  @override
  String get discoveryListingSubheading =>
      'Vil du liste samfunnet ditt her? Søk hvis du oppfyller kravene i samfunnets innstillinger > Oppdagelse.';

  @override
  String get discoverySearchCommunities => 'Søk etter samfunn';

  @override
  String get discoveryFilterByLanguage => 'Filtrer etter språk';

  @override
  String get discoveryAllLanguages => 'Alle språk';

  @override
  String get discoveryAllCategories => 'Alle';

  @override
  String get discoveryCategoryGaming => 'Spill';

  @override
  String get discoveryCategoryMusic => 'Musikk';

  @override
  String get discoveryCategoryEntertainment => 'Underholdning';

  @override
  String get discoveryCategoryEducation => 'Utdanning';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Vitenskap og teknologi';

  @override
  String get discoveryCategoryContentCreator => 'Innholdsskaper';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime og manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Film og TV';

  @override
  String get discoveryCategoryOther => 'Annet';

  @override
  String get discoveryNoCommunitiesMatch => 'Ingen samfunn samsvarer.';

  @override
  String get discoveryJoinCommunity => 'Bli med i samfunn';

  @override
  String get discoveryJoined => 'Tilkoblet';

  @override
  String discoveryOnlineCount(String count) {
    return '$count pålogget';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString medlemmer',
      one: '1 medlem',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Ingen beskrivelse.';

  @override
  String get discoveryCommunities => 'Samfunn';

  @override
  String get discoveryApps => 'Apper';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Kunne ikke bli med i dette samfunnet';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Noe gikk galt. Prøv igjen om et øyeblikk.';

  @override
  String get discoveryJoinErrorFullTitle => 'Dette samfunnet er fullt';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Dette samfunnet har nådd medlemsgrensen, så du kan ikke bli med akkurat nå.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Du har nådd samfunnsgrensen';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Du er i det maksimale antallet samfunn. Forlat ett og prøv igjen.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Du kan ikke bli med i dette samfunnet';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Du har blitt utestengt fra dette samfunnet.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Dette samfunnet er ikke lenger tilgjengelig';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Det kan ha forlatt oppdagelsen eller slått av nye tilkoblinger. Oppdater siden, så ser du det ikke igjen.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Du går for fort';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Vennligst vent et øyeblikk og prøv igjen.';

  @override
  String get guildNavbarAddCommunity => 'Legg til et samfunn';

  @override
  String get guildNavbarHelp => 'Hjelp';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NY MELDING';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Lukk $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'valgt';

  @override
  String get guildNavbarGuildUnread => 'ulest';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count varsler',
      one: '1 varsel',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'dempet';

  @override
  String get authShowPassword => 'Vis passord';

  @override
  String get authHidePassword => 'Skjul passord';

  @override
  String get chatLoadingMessages => 'Laster meldinger';

  @override
  String get friendsMessageFriend => 'Melding';

  @override
  String get friendsFriendActions => 'Vennshandlinger';

  @override
  String get friendsAcceptRequest => 'Godta venneforespørsel';

  @override
  String get friendsDeclineRequest => 'Avslå venneforespørsel';

  @override
  String get friendsCancelRequest => 'Avbryt venneforespørsel';

  @override
  String get friendsOpenInbox => 'Innboks';

  @override
  String get profileRemoveFriend => 'Fjern venn';

  @override
  String get profileUnblockUser => 'Opphev blokkering av bruker';

  @override
  String get profileAcceptFriendRequest => 'Godta venneforespørsel';

  @override
  String get profileCancelFriendRequest => 'Avbryt venneforespørsel';

  @override
  String get profileSendFriendRequest => 'Legg til venn';

  @override
  String get accountOverflowMenu => 'Kontonalternativer';

  @override
  String get navHome => 'Hjem';

  @override
  String get navNotifications => 'Varsler';

  @override
  String get navYou => 'Deg';

  @override
  String get guildFolderSettingsTitle => 'Mappeinnstillinger';

  @override
  String get guildFolderNameLabel => 'Mappenavn';

  @override
  String get guildFolderColorLabel => 'Mappefarge';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Vis ikon når skjult';

  @override
  String get guildFolderIconLabel => 'Mappeikon';

  @override
  String get guildFolderDelete => 'Slett mappe';

  @override
  String get guildFolderIconFolder => 'Mappe';

  @override
  String get guildFolderIconStar => 'Stjerne';

  @override
  String get guildFolderIconHeart => 'Hjerte';

  @override
  String get guildFolderIconBookmark => 'Bokmerke';

  @override
  String get guildFolderIconGameController => 'Spillkontroller';

  @override
  String get guildFolderIconShield => 'Skjold';

  @override
  String get guildFolderIconMusicNote => 'Musikk';

  @override
  String get guildFolderMarkAsRead => 'Merk mappe som lest';

  @override
  String get guildBulkMuteCommunities => 'Demp fellesskap';

  @override
  String get guildBulkUnmuteCommunities => 'Slå på lyd for fellesskap';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Varslingsinnstillinger for fellesskap';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Personverninnstillinger for fellesskapet';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Tillat @everyone og @here';

  @override
  String get guildBulkAllowRoleMentions => 'Tillat rolletagging';

  @override
  String get guildBulkEnableMobilePush => 'Slå på push-varsler på mobil';

  @override
  String get guildBulkDisableMobilePush => 'Deaktiver push-varsler på mobil';

  @override
  String get guildBulkAllowDirectMessages => 'Tillat direktemeldinger';

  @override
  String get guildBulkBlockDirectMessages => 'Blokker direktemeldinger';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Tillat direkte meldinger fra bot';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Blokker direktemeldinger fra boter';

  @override
  String get guildNavbarGroupDm => 'Gruppechat';

  @override
  String get guildNavbarCreateChannel => 'Opprett kanal';

  @override
  String get guildNavbarChannelType => 'Kanaltype';

  @override
  String get guildNavbarTextChannel => 'Tekstkanal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Send meldinger, bilder, GIF-er og emojier';

  @override
  String get guildNavbarVoiceChannel => 'Talekanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Vær sammen med tale, video og skjermdeling';

  @override
  String get guildNavbarLinkChannel => 'Lenkekanal';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Rask tilgang til et eksternt nettsted eller en ressurs';

  @override
  String get guildNavbarNameLabel => 'Navn';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Velg kanastype';

  @override
  String get guildNavbarCreateCategory => 'Opprett kategori';

  @override
  String get guildNavbarNewCategoryHint => 'Ny kategori';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Inviter venner til $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Mottakerne vil bli sendt til #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Søk etter venner';

  @override
  String get guildNavbarNoFriendsYet => 'Ingen venner ennå';

  @override
  String get guildNavbarNoResults => 'Ingen resultater';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Eller send en invitasjonslenke til en venn:';

  @override
  String get guildNavbarInviteLink => 'Invitasjonslenke';

  @override
  String get guildNavbarCopy => 'Kopier';

  @override
  String get guildNavbarCopied => 'Kopiert!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Invitasjonslenken din utløper om 7 dager.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Denne invitasjonslenken utløper aldri.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Invitasjonslenken din utløper om $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Rediger invitasjonslenke';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Innstillinger for invitasjonslenke';

  @override
  String get guildNavbarExpireAfter => 'Utløper etter';

  @override
  String get guildNavbarMaxUses => 'Maks antall bruk';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Gi midlertidig medlemskap';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Medlemmer vil bli fjernet når de logger av, med mindre en rolle er tildelt';

  @override
  String get guildNavbarCreateNewLink => 'Opprett ny lenke';

  @override
  String get guildNavbarSent => 'Sendt';

  @override
  String get guildNavbarInvite => 'Inviter';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Forlat fellesskap';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Er du sikker på at du vil forlate dette fellesskapet? Du vil ikke lenger kunne se noen meldinger.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Forlat fellesskap';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Slett meldingene dine i dette fellesskapet?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Slett permanent alle meldinger du har sendt her, i alle kanaler. Kan ikke angres.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Slett meldingene mine';

  @override
  String get guildNavbarDeletedYourMessages => 'Slettet meldingene dine';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Kunne ikke slette meldingene dine';

  @override
  String get guildNavbarRemoveOverride => 'Fjern overstyring';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Dempet til $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Kun tilgjengelig for $productName-ansatte';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Invitasjoner er for øyeblikket satt på pause i dette fellesskapet';

  @override
  String get guildNavbarDurationNever => 'aldri';

  @override
  String get guildNavbarDuration30Minutes => '30 minutter';

  @override
  String get guildNavbarDuration1Hour => '1 time';

  @override
  String get guildNavbarDuration6Hours => '6 timer';

  @override
  String get guildNavbarDuration12Hours => '12 timer';

  @override
  String get guildNavbarDuration1Day => '1 dag';

  @override
  String get guildNavbarDuration7Days => '7 dager';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekunder';
  }

  @override
  String get guildNavbarNever => 'Aldri';

  @override
  String get guildNavbarNoLimit => 'Ingen grense';

  @override
  String get guildNavbarOneUse => '1 bruk';

  @override
  String guildNavbarUses(int count) {
    return '$count bruk';
  }

  @override
  String get guildMenuMarkAsRead => 'Merk som lest';

  @override
  String get guildPeekMoreOptions => 'Flere alternativer';

  @override
  String get guildMenuInviteMembers => 'Inviter medlemmer';

  @override
  String get guildMenuCommunitySettings => 'Fellesskapsinnstillinger';

  @override
  String get guildMenuEditCommunityProfile => 'Rediger fellesskapsprofil';

  @override
  String get guildMenuUnmuteCommunity => 'Fjern demping av fellesskap';

  @override
  String get guildMenuMuteCommunity => 'Dempet fellesskap';

  @override
  String get guildMenuHideMutedChannels => 'Skjul dempede kanaler';

  @override
  String get guildMenuReportCommunity => 'Rapporter fellesskap';

  @override
  String get guildMenuDebugCommunity => 'Feilsøk fellesskap';

  @override
  String get guildMenuCopyCommunityId => 'Kopier fellesskaps-ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Til $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Generelt';

  @override
  String get guildMenuSettingsRoles => 'Roller og tillatelser';

  @override
  String get guildMenuSettingsEmoji => 'Egendefinerte emojier';

  @override
  String get guildMenuSettingsStickers => 'Egendefinerte klistremerker';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sikkerhet og moderering';

  @override
  String get guildMenuSettingsActivityLog => 'Aktivitetslogg';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Egendefinert invitasjons-URL';

  @override
  String get guildMenuSettingsDiscovery => 'Oppdagelse';

  @override
  String get guildMenuSettingsMembers => 'Medlemmer';

  @override
  String get guildMenuSettingsInviteLinks => 'Invitasjonslenker';

  @override
  String get guildMenuSettingsBans => 'Utestengelser';

  @override
  String get guildMenuSettingsChannels => 'Kanaler';

  @override
  String get guildSettingsNoPermission =>
      'Du har ikke tillatelse til å se denne innstillingsfanen.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikon';

  @override
  String get guildSettingsUploadImage => 'Last opp bilde';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Last opp et banner for serveren din.';

  @override
  String get guildSettingsOverviewNameTitle => 'Navn';

  @override
  String get guildSettingsOverviewNameHint => 'Mitt fantastiske fellesskap';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistikk';

  @override
  String get guildSettingsOverviewMembers => 'Medlemmer';

  @override
  String get guildSettingsOverviewOnline => 'Pålogget';

  @override
  String get guildSettingsRolesDescription =>
      'Bruk roller til å gruppere medlemmer og tildele tillatelser.';

  @override
  String get guildSettingsCreateRole => 'Opprett rolle';

  @override
  String get guildSettingsRolesListTitle => 'Roller';

  @override
  String get guildSettingsRolesNewRole => 'Ny rolle';

  @override
  String get guildSettingsRolesDeleteRole => 'Slett rolle';

  @override
  String get guildSettingsRolesBackToRoles => 'Tilbake til roller';

  @override
  String get guildSettingsBackToSettings => 'Tilbake til innstillinger';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Rediger «$name»';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Konfigurer rolleinnstillinger og tillatelser';

  @override
  String get guildSettingsRolesDisplaySection => 'Visning';

  @override
  String get guildSettingsRolesRoleName => 'Rollenavn';

  @override
  String get guildSettingsRolesRoleColor => 'Rollefarge';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Skriv inn en farge (hex, rgb(), hsl() eller navn) eller bruk fargevelgeren.';

  @override
  String get guildSettingsRolesShowSeparately => 'Vis denne rollen separat';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Viser medlemmer med denne rollen i en egen seksjon i medlemslisten.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Tillat omtaler for denne rollen';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Brukere med tillatelsen «$permission» kan alltid nevne roller, uavhengig av denne innstillingen.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Bruk denne knappen for å raskt fjerne alle tillatelser.';

  @override
  String get guildSettingsRolesClearPermissions => 'Fjern tillatelser';

  @override
  String get guildSettingsRolesPermissionsSection => 'Tillatelser';

  @override
  String get guildSettingsRolesSearchPermissions => 'Søk i tillatelser';

  @override
  String get guildSettingsRolesDenseLayout => 'Kompakt visning';

  @override
  String get guildSettingsRolesComfyLayout => 'Komfortabelt oppsett';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Bytt til kompakt visning';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Bytt til komfortabelt oppsett';

  @override
  String get guildSettingsRolesSingleColumn => 'Enkel kolonne';

  @override
  String get guildSettingsRolesTwoColumns => 'To kolonner';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'Bytt til én kolonne';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Bytt til to kolonner';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Ingen tillatelser funnet';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Egendefinert heiserekkefølge';

  @override
  String get guildSettingsRolesHoistOrder => 'Heve-rekkefølge';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Tilbakestill til standard';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Dra roller for å tilpasse rekkefølgen de vises i på medlemslisten.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Ingen fremhevede roller. Aktiver \"Vis denne rollen separat\" for en rolle for å se den her.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Du kan ikke redigere denne rollen fordi den er din høyeste rolle eller over deg';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Du trenger tillatelsen «$permission» for å redigere disse tillatelsene';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Du kan ikke redigere en rolle som er på samme nivå eller høyere enn din høyeste rolle';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Du kan ikke gi en tillatelse du ikke har';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Du kan ikke fjerne denne tillatelsen fordi den da fjernes fra deg selv';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Roller er oppdatert';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rolle opprettet';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rollen er slettet';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Heise-rekkefølgen er tilbakestilt til standard';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Rollenavn er påkrevd';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Gi rollen et navn før du lagrer.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Kunne ikke opprette rolle';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Kunne ikke oppdatere roller';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Kunne ikke slette rolle';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '«$name» kunne ikke slettes. Prøv igjen.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Kunne ikke tilbakestille rekkefølgen';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Prøv igjen om en liten stund.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Er du sikker på at du vil slette $name-rollen? Alle medlemmer med denne rollen vil ikke lenger ha den.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Hele fellesskapet';

  @override
  String get permissionCategoryMessagesMedia => 'Meldinger og medier';

  @override
  String get permissionCategoryModeration => 'Moderering';

  @override
  String get permissionCategoryChannelAccess => 'Kanaltilgang';

  @override
  String get permissionCategoryChannelManagement => 'Kanaladministrasjon';

  @override
  String get permissionCategoryAudioVideo => 'Lyd og video';

  @override
  String get permissionUnknown => 'Ukjent tillatelse';

  @override
  String get permissionAdministrator => 'Administrator';

  @override
  String get permissionAdministratorDescription =>
      'Gir alle tillatelser og omgår kanalbegrensninger. Svært sensitivt.';

  @override
  String get permissionViewActivityLog => 'Vis aktivitetslogg';

  @override
  String get permissionViewActivityLogDescription =>
      'Les fellesskapets aktivitetslogg over endringer og moderatorhandlinger.';

  @override
  String get permissionManageCommunity => 'Administrer fellesskap';

  @override
  String get permissionManageCommunityDescription =>
      'Rediger globale innstillinger som navn, beskrivelse og ikon.';

  @override
  String get permissionManageRoles => 'Administrer roller';

  @override
  String get permissionManageRolesDescription =>
      'Opprett, rediger eller slett roller under din høyeste rolle. Tillater også redigering av overstyringer for kanaltillatelser.';

  @override
  String get permissionManageChannels => 'Administrer kanaler';

  @override
  String get permissionManageChannel => 'Administrer kanal';

  @override
  String get permissionManageChannelDescription =>
      'Gi nytt navn til og rediger innstillingene for denne kanalen.';

  @override
  String get permissionManagePermissions => 'Administrer tillatelser';

  @override
  String get permissionManagePermissionsDescription =>
      'Rediger overstyringer for roller og medlemmer i denne kanalen.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Opprett, rediger eller slett webhooks for denne kanalen.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Se medlemslisten for denne kanalen.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Administrer invitasjonslenker for denne kanalen.';

  @override
  String get permissionOverwriteDeny => 'Avvis';

  @override
  String get permissionOverwriteInherit => 'Nøytral (arv)';

  @override
  String get permissionOverwriteAllow => 'Tillat';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Bruk disse knappene for å raskt angi alle tillatelser.';

  @override
  String get permissionManageChannelsDescription =>
      'Opprett, rediger eller slett kanaler og kategorier.';

  @override
  String get permissionKickMembers => 'Fjern medlemmer';

  @override
  String get permissionBanMembers => 'Utesteng medlemmer';

  @override
  String get permissionCreateInviteLinks => 'Opprett invitasjonslenker';

  @override
  String get permissionChangeOwnNickname => 'Endre eget kallenavn';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Oppdater ditt eget kallenavn.';

  @override
  String get permissionManageNicknames => 'Administrer kallenavn';

  @override
  String get permissionManageNicknamesDescription =>
      'Endre andre medlemmers kallenavn.';

  @override
  String get permissionCreateEmojiStickers =>
      'Opprett emojier og klistremerker';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Last opp nye emojier og klistremerker, og administrer dine egne kreasjoner.';

  @override
  String get permissionManageEmojiStickers =>
      'Administrer emojier og klistremerker';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Rediger eller slett emojier og klistremerker som er laget av andre medlemmer.';

  @override
  String get permissionManageWebhooks => 'Administrer webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Opprett, rediger eller slett webhooks.';

  @override
  String get permissionSendMessages => 'Send meldinger';

  @override
  String get permissionSendTtsMessages => 'Send tekst-til-tale-meldinger';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Send tekst-til-tale-meldinger.';

  @override
  String get permissionManageMessages => 'Administrer meldinger';

  @override
  String get permissionManageMessagesDescription =>
      'Slett andre medlemmers meldinger. Festing kontrolleres separat.';

  @override
  String get permissionPinMessages => 'Fest meldinger';

  @override
  String get permissionEmbedLinks => 'Bygg inn lenker';

  @override
  String get permissionAttachFiles => 'Legg ved filer';

  @override
  String get permissionMentionEveryone => 'Bruk @everyone/@here og @rolle';

  @override
  String get permissionMentionEveryoneDescription =>
      'Nevn alle eller en hvilken som helst rolle (selv om rollen ikke er satt til å kunne nevnes).';

  @override
  String get permissionUseExternalEmoji => 'Bruk ekstern emoji';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Bruk emojier fra andre fellesskap.';

  @override
  String get permissionUseExternalStickers => 'Bruk eksterne klistremerker';

  @override
  String get permissionAddReactions => 'Legg til reaksjoner';

  @override
  String get permissionAddReactionsDescription =>
      'Legg til nye reaksjoner på meldinger.';

  @override
  String get permissionBypassSlowmode => 'Omgå sakte modus';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorer meldingsgrenser per kanal.';

  @override
  String get permissionTimeOutMembers => 'Midlertidig utesteng medlemmer';

  @override
  String get permissionTimeOutMembersDescription =>
      'Hindrer medlemmer fra å sende meldinger, reagere og bli med i tale i en viss periode.';

  @override
  String get permissionViewChannel => 'Se kanal';

  @override
  String get permissionViewChannelMembers => 'Se kanalmedlemmer';

  @override
  String get permissionViewChannelMembersDescription =>
      'Se medlemslisten for kanaler i dette fellesskapet.';

  @override
  String get permissionConnect => 'Koble til';

  @override
  String get permissionSpeak => 'Snakk';

  @override
  String get permissionStreamVideo => 'Strøm video';

  @override
  String get permissionUseVoiceActivity => 'Bruk stemmeaktivering';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Uten denne tillatelsen kreves trykk-og-snakk.';

  @override
  String get permissionPrioritySpeaker => 'Prioritert taler';

  @override
  String get permissionMuteMembers => 'Dempe medlemmer';

  @override
  String get permissionDeafenMembers => 'Dempe medlemmer';

  @override
  String get permissionMoveMembers => 'Flytt medlemmer';

  @override
  String get permissionMoveMembersDescription =>
      'Dra medlemmer mellom kanaler de har tilgang til.';

  @override
  String get permissionSetVoiceRegion => 'Angi stemmeregion';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount statiske, $animatedCount animerte emojier brukt';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Ingen egendefinerte emojier ennå.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count klistremerker lastet opp';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Ingen egendefinerte klistremerker ennå.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Medlemsverifisering';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Velg hva medlemmer må ha før de kan poste eller sende direktemeldinger til fellesskapsmedlemmer.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Medlemmer med roller kan omgå disse sjekkene. For offentlige rom anbefaler vi å aktivere verifisering.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Fellesskap som er oppført i Oppdagelse krever minst en bekreftet e-post. Ingen kan velges mens Oppdagelse er aktivert.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Modent innhold og innholdsadvarsler';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigurer merking av modent innhold og valgfrie innholdsadvarsler for medlemmer.';

  @override
  String get guildSettingsModerationMatureToggle => 'Modent innhold';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Merk dette fellesskapet som inneholdende modent innhold.';

  @override
  String get guildSettingsVerificationNone => 'Ingen';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Ingen verifisering er påkrevd.';

  @override
  String get guildSettingsVerificationLow => 'Lav';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Krever en bekreftet e-postadresse.';

  @override
  String get guildSettingsVerificationMedium => 'Middels';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Krever en bekreftet e-postadresse, og en konto som er minst 5 minutter gammel.';

  @override
  String get guildSettingsVerificationHigh => 'Høy';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Krever alt i middels, pluss å ha vært medlem av fellesskapet i minst 10 minutter.';

  @override
  String get guildSettingsVerificationHighest => 'Veldig høy';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Krever et bekreftet telefonnummer.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Spor moderatorhandlinger på tvers av fellesskapet.';

  @override
  String get guildSettingsAuditLogEmpty => 'Ingen logger ennå';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderasjonsaksjoner og fellesskapsendringer vil vises her.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Alle brukere';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Alle handlinger';

  @override
  String get guildSettingsAuditLogNoReason => 'Ingen grunn ble oppgitt.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Ukjent bruker';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Noe gikk galt under lasting av aktivitetsloggen.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Kunne ikke laste aktivitetslogger';

  @override
  String get guildSettingsAuditLogReason => 'Årsak';

  @override
  String get guildSettingsAuditLogSomeone => 'noen';

  @override
  String get guildSettingsAuditLogSomething => 'noe';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'ukjent enhet';

  @override
  String get guildSettingsAuditLogNothing => 'ingenting';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Ukjent mål';

  @override
  String get auditLogActionGuildUpdate => 'Fellesskap oppdatert';

  @override
  String get auditLogActionChannelCreate => 'Kanal opprettet';

  @override
  String get auditLogActionChannelUpdate => 'Kanal oppdatert';

  @override
  String get auditLogActionChannelDelete => 'Kanal slettet';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanaloverstyring lagt til';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanaloverstyring oppdatert';

  @override
  String get auditLogActionChannelOverwriteDelete => 'Kanaloverstyring fjernet';

  @override
  String get auditLogActionMemberKick => 'Medlem sparket';

  @override
  String get auditLogActionMemberPrune => 'Medlemmer fjernet';

  @override
  String get auditLogActionMemberBanAdd => 'Medlem utestengt';

  @override
  String get auditLogActionMemberBanRemove => 'Medlem utestengelse fjernet';

  @override
  String get auditLogActionMemberUpdate => 'Medlem oppdatert';

  @override
  String get auditLogActionMemberRoleUpdate => 'Medlemsroller oppdatert';

  @override
  String get auditLogActionMemberMove => 'Medlem flyttet';

  @override
  String get auditLogActionMemberDisconnect => 'Medlem frakoblet';

  @override
  String get auditLogActionBotAdd => 'Bot lagt til';

  @override
  String get auditLogActionRoleCreate => 'Rolle opprettet';

  @override
  String get auditLogActionRoleUpdate => 'Rolle oppdatert';

  @override
  String get auditLogActionRoleDelete => 'Rolle slettet';

  @override
  String get auditLogActionInviteCreate => 'Invitasjon opprettet';

  @override
  String get auditLogActionInviteUpdate => 'Invitasjon oppdatert';

  @override
  String get auditLogActionInviteDelete => 'Invitasjon slettet';

  @override
  String get auditLogActionWebhookCreate => 'Webhook opprettet';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook oppdatert';

  @override
  String get auditLogActionWebhookDelete => 'Webhook slettet';

  @override
  String get auditLogActionEmojiCreate => 'Emoji opprettet';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji oppdatert';

  @override
  String get auditLogActionEmojiDelete => 'Emoji slettet';

  @override
  String get auditLogActionStickerCreate => 'Klistremerke opprettet';

  @override
  String get auditLogActionStickerUpdate => 'Klistremerke oppdatert';

  @override
  String get auditLogActionStickerDelete => 'Klistremerke slettet';

  @override
  String get auditLogActionMessageDelete => 'Melding slettet';

  @override
  String get auditLogActionMessageBulkDelete => 'Meldinger slettet';

  @override
  String get auditLogActionMessagePin => 'Melding festet';

  @override
  String get auditLogActionMessageUnpin => 'Melding løsnet';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor oppdaterte fellesskapsinnstillingene.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor opprettet kanalen $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor oppdaterte kanalen $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor slettet kanalen $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor la til kanaltillatelser for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor la til kanaltillatelser for $target i $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor oppdaterte kanaltillatelser for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor oppdaterte kanaltillatelser for $target i $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor fjernet kanaltillatelser for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor fjernet kanaltillatelser for $target i $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor sparket $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor utestengte $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor opphevet utestengelsen av $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor oppdaterte $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor oppdaterte roller for $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor fjernet inaktive medlemmer.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor fjernet medlemmer inaktive i $days dager.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor flyttet $target til en annen talekanal.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor flyttet $target til $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor koblet $target fra tale.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor la til boten $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor opprettet rollen $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor oppdaterte rollen $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor slettet rollen $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor opprettet invitasjonen $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor opprettet invitasjonen $target for $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor oppdaterte invitasjonen $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor oppdaterte invitasjonen $target for $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor slettet invitasjonen $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor slettet invitasjonen $target for $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor opprettet webhooken $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor oppdaterte webhooken $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor slettet webhooken $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor la til emojien $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor oppdaterte emojien $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor slettet emojien $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor la til klistremerket $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor oppdaterte klistremerket $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor slettet klistremerket $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor slettet en melding.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor slettet en melding i $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor slettet flere meldinger.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor slettet $count meldinger.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor slettet flere meldinger i $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor slettet $count meldinger i $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor festet en melding.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor festet en melding i $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor løsnet en melding.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor løsnet en melding i $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor utførte en revisjonshandling på $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Oppdaterte $field fra $oldValue til $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Satte $field til $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Fjernet $field (var $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Oppdaterte $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Endret navnet på fellesskapet til $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Oppdaterte fellesskapsikonet.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Endret navnet på kanalen til $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Fjernet emnet.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Oppdaterte emnet til $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Aktiverte modent innhold.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Deaktiverte modent innhold.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Satte kallenavn til $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Fjernet kallenavn $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Dempet medlemmet.';

  @override
  String get auditLogChangeUnmutedMember => 'Opphevet demping av medlemmet.';

  @override
  String get auditLogChangeDeafenedMember => 'Deafened medlemmet.';

  @override
  String get auditLogChangeUndeafenedMember => 'Undeafened medlemmet.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'La til $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Fjernet $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Melding: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Inviterte av $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slettet # meldinger.',
      one: 'Slettet # melding.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fjernet # medlemmer.',
      one: 'Fjernet # medlem.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Denne invitasjonen utløper aldri.';

  @override
  String get auditLogOptionTemporaryMembership => 'Gir midlertidig medlemskap.';

  @override
  String get auditLogOptionPermanentMembership => 'Gir permanent medlemskap.';

  @override
  String get guildSettingsLoadMore => 'Last inn mer';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Administrer webhooks som sender meldinger til kanaler.';

  @override
  String get guildSettingsWebhooksEmpty => 'Ingen webhooks konfigurert.';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Dette fellesskapet har ingen webhooks ennå. Gå til $channelSettingsPath for å opprette en.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Du trenger tillatelsen «$permission» for å se og redigere webhooker for dette fellesskapet.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Kunne ikke laste inn webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Det oppsto en feil under lasting av webhooks. Prøv igjen.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooker oppdatert';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Kunne ikke oppdatere webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Ukjent kanal';

  @override
  String get guildSettingsCopyUrl => 'Kopier URL';

  @override
  String get guildSettingsCopiedUrl => 'URL kopiert til utklippstavlen';

  @override
  String get guildSettingsDeleteWebhook => 'Slett webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Angi en egendefinert invitasjonslenke for serveren din.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Lagre';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Bruk';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count bruksområder';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Søk om å bli listet i serveroppdagelse.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Ikke nok medlemmer';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Krever minst $count medlemmer for å søke.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Ventende';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Godkjent';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Avvist';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Fjernet';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Årsak: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Fellesskapet ditt er oppført i Oppdag. Du kan oppdatere oppføringsdetaljene dine nedenfor eller trekke det tilbake for å fjerne det.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Søknaden din venter på gjennomgang. Du kan fortsatt oppdatere annonsedetaljene dine eller trekke søknaden.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategori';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Velg kategorien som best beskriver fellesskapet ditt. Du kan endre dette når som helst.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Hovedspråk';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Språket de fleste i fellesskapet ditt snakker. Brukes til å filtrere oppdagelsesresultater.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beskrivelse';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Beskriv hva fellesskapet ditt handler om';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'En beskrivelse er påkrevd.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Beskrivelsen må være minst $minLength tegn.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Beskrivelsen kan ikke være lenger enn $maxLength tegn.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Emneknagger';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Opptil $maxTags tagger hjelper folk med å finne fellesskapet ditt. De vises i Discovery-søk.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'spill, kunst, musikk';

  @override
  String get guildSettingsDiscoveryAddTag => 'Legg til';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Fjern taggen $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Kunne ikke legge til tagg';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Tagger må være mellom 2 og $maxLength tegn og alfanumeriske.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Du kan bare legge til opptil $maxTags tagger.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Send søknad';

  @override
  String get guildSettingsDiscoverySave => 'Lagre';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Trekk tilbake';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Søknad om oppdagelse sendt';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Oppføring i oppdageren oppdatert';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Søknad om oppdagelse trukket tilbake';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Kunne ikke trekke tilbake søknaden';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Prøv igjen om en liten stund.';

  @override
  String get guildSettingsMembersDescription =>
      'Søk og administrer servermedlemmer.';

  @override
  String get guildSettingsMembersSearchHint => 'Søk etter medlemmer';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count medlemmer';
  }

  @override
  String get guildMembersRecentTitle => 'Nye medlemmer';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Viser $displayedCount av $totalCount medlemmer totalt';
  }

  @override
  String get guildMembersSort => 'Sorter';

  @override
  String get guildSettingsMembersSortNewest => 'Nyeste først';

  @override
  String get guildMembersSortOldest => 'Eldste først';

  @override
  String get guildMembersColumnName => 'Navn';

  @override
  String get guildMembersColumnMemberSince => 'Medlem siden';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Ble med i $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Bli med-metode';

  @override
  String get guildMembersColumnRoles => 'Roller';

  @override
  String get guildMembersColumnActions => 'Handlinger';

  @override
  String get guildMembersFilterMemberSince => 'Filtrer etter medlem siden';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrer etter dato for kontoopprettelse';

  @override
  String get guildMembersFilterJoinMethod => 'Filtrer etter innmeldingsmetode';

  @override
  String get guildMembersFilterRoles => 'Filtrer etter roller';

  @override
  String get guildMembersFilterAll => 'Alle';

  @override
  String get guildMembersFilterPast1Hour => 'Siste time';

  @override
  String get guildMembersFilterPast24Hours => 'Siste 24 timer';

  @override
  String get guildMembersFilterPast7Days => 'Siste 7 dager';

  @override
  String get guildMembersFilterPast2Weeks => 'Siste 2 uker';

  @override
  String get guildMembersFilterPast3Weeks => 'Siste 3 uker';

  @override
  String get guildMembersFilterPast4Weeks => 'Siste 4 uker';

  @override
  String get guildMembersFilterPast3Months => 'Siste 3 måneder';

  @override
  String get guildMembersFilterCustomRange => 'Egendefinert område …';

  @override
  String get guildMembersDateRangeTitle => 'Egendefinert datointervall';

  @override
  String get guildMembersDateAfter => 'Etter dato';

  @override
  String get guildMembersDateBefore => 'Før dato';

  @override
  String get guildMembersClearAll => 'Fjern alle';

  @override
  String get guildMembersRowsPerPage => 'Rader per side';

  @override
  String get guildMembersEmptySearch => 'Ingen samsvarer med søket.';

  @override
  String get guildMembersLoadError =>
      'Noe gikk galt under innlastingen av medlemmer. Prøv igjen senere.';

  @override
  String get guildMembersIndexing => 'Indekserer medlemmer…';

  @override
  String get guildMembersGoToPage => 'Gå til side';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Gå til side $page';
  }

  @override
  String get guildMembersJumpToPage => 'Gå til side';

  @override
  String get guildMembersJoinSourceCreator => 'Fellesskapets skaper';

  @override
  String get guildMembersJoinSourceInvite => 'Inviter';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Inviter ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Inviterte av $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Egendefinert URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Invitasjon til bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Plattformadministrator';

  @override
  String get guildMembersJoinSourceDiscovery => 'Oppdagelse';

  @override
  String get guildMembersJoinMethodUnknown => 'Ukjent';

  @override
  String get guildMembersCommunityOwner => 'Fellesskapets eier';

  @override
  String get guildMembersViewAllRoles => 'Se alle roller';

  @override
  String get guildMembersJoinedJustNow => 'Akkurat nå';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutter siden',
      one: '1 minutt siden',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ganger siden',
      one: '1 time siden',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dager siden',
      one: '1 dag siden',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Medlemmer';

  @override
  String get guildMembersChannelListSelected => 'Medlemmer, valgt';

  @override
  String get guildSettingsInvitesTitle => 'Invitasjoner';

  @override
  String get guildSettingsInvitesDescription =>
      'Se og tilbakekall aktive invitasjonslenker.';

  @override
  String get guildSettingsInvitesEmpty => 'Ingen aktive invitasjoner.';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Dette fellesskapet har ingen invitasjonslenker ennå. Gå til en kanal og opprett en invitasjon for å invitere folk.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Kunne ikke laste inn invitasjoner';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Det oppsto en feil under lasting av invitasjonene. Prøv igjen.';

  @override
  String get guildSettingsInvitesTryAgain => 'Prøv igjen';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Vis opprettelsesdato i stedet for utløpsdato';

  @override
  String get guildSettingsInvitesPauseInvites => 'Sett invitasjoner på pause';

  @override
  String get guildSettingsInvitesEnableInvites => 'Aktiver invitasjoner';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Sett invitasjoner for dette fellesskapet på pause';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Aktiver invitasjoner for dette fellesskapet';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Vil du sette invitasjoner på pause? Nye brukere kan ikke bli med via invitasjonslenker før du aktiverer dem igjen. Eksisterende medlemmer blir ikke påvirket.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Aktivere invitasjoner? Brukere kan bli med i dette fellesskapet via invitasjonslenker igjen.';

  @override
  String get guildSettingsInvitesPause => 'Pause';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Invitasjoner er satt på pause for dette fellesskapet.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Invitasjoner er satt på pause fordi $productName oppdaget et potensielt raid. Nye brukere kan ikke bli med akkurat nå.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Inviterte:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kode:';

  @override
  String get guildSettingsInvitesLabelUses => 'Bruker:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Opprettet:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Utløper:';

  @override
  String get guildSettingsInvitesUnknown => 'Ukjent';

  @override
  String get guildSettingsInvitesNoCategory => 'Ingen kategori';

  @override
  String get guildSettingsInvitesExpired => 'Utløpt';

  @override
  String get guildSettingsInvitesNever => 'Aldri';

  @override
  String get guildSettingsInvitesCopyLink => 'Kopier invitasjonslenke';

  @override
  String get guildSettingsInvitesRevoke => 'Trekk tilbake invitasjon';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Kunne ikke tilbakekalle invitasjon';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Lenken kan fortsatt fungere. Prøv igjen om et øyeblikk.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses bruksområder';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Utløper $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Se og administrer utestengte brukere.';

  @override
  String get guildSettingsBansSearchHint => 'Søk etter utestengelser';

  @override
  String get guildSettingsBansEmpty => 'Ingen utestengte brukere.';

  @override
  String get guildSettingsBanPermanent => 'Permanent utestengelse';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Utløper $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Utløper';

  @override
  String get guildSettingsUnban => 'Fjern utestengelse';

  @override
  String get guildSettingsBansLoading => 'Laster utestengte brukere';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Ingen utestengelser funnet som samsvarer med søket ditt.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detaljer om utestengelse';

  @override
  String get guildSettingsBanViewDetails => 'Vis detaljer';

  @override
  String get guildSettingsBannedOn => 'Utestengt den';

  @override
  String get guildSettingsBannedBy => 'Utestengt av';

  @override
  String get guildSettingsRevokeBanTitle => 'Fjern utestengelse';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Er du sikker på at du vil fjerne utestengelsen for $displayName? De vil kunne bli med i fellesskapet igjen.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Fjernet utestengelse for $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Kunne ikke laste utestengelser. Prøv igjen.';

  @override
  String get guildSettingsRevokeBanError =>
      'Kunne ikke fjerne utestengelse. Prøv igjen.';

  @override
  String get guildSettingsCommunitySettings => 'Fellesskapsinnstillinger';

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
      'Administrer fellesskapets profil, kanaler og standardinnstillinger.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Merkevarebygging';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Oppdater ikonet, navnet, banneret og invitasjonsbakgrunnen din';

  @override
  String get guildSettingsOverviewBannerUpload => 'Last opp banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Inaktivitetsinnstillinger';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfigurer AFK-kanal og tidsavbrudd';

  @override
  String get guildSettingsOverviewSystemTitle => 'System og velkomst';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Velg destinasjon for system- og velkomstmeldinger';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Standard varsler';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Fellesskap med over 250 personer tvinges til innstillingen \"kun varsler\". Din opprinnelige innstilling beholdes og vil bli gjenopprettet hvis fellesskapet faller under 250 medlemmer.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avansert';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Tillat fleksible tekstkanalnavn';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Skjul eierkrone for fellesskapet';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Frakoblet banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Viser banneret i sin egen seksjon under fellesskapets topptekst.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Last opp ikon';

  @override
  String get guildSettingsOverviewRemoveImage => 'Fjern';

  @override
  String get guildSettingsOverviewSplashTitle => 'Invitasjonsbakgrunn';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Chat-innebygd bakgrunn';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Vises i invitasjonsinnebygginger i chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Last opp bakgrunn';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Intet fellesskapsbanner';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Ingen invitasjonsbakgrunn';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Forhåndsvisning';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Se hvordan invitasjonen din ser ut for besøkende.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Tekstkanalnavn';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Eierkrone for fellesskapet';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigurer om kroneikonet vises ved siden av fellesskapets eier';

  @override
  String get guildSettingsSplashCardAlignment => 'Kortjustering';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Midtstill';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Venstre';

  @override
  String get guildSettingsSplashAlignmentRight => 'Høyre';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Gjelder kun på brede skjermer.';

  @override
  String get permissionReadMessageHistory => 'Les meldingshistorikk';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Endre hva brukere uten \"$permission\" kan se';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Bruk en dedikert modal for å angi en dato for meldingshistorikkgrense for medlemmer som ikke har $permission-tillatelsen.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Åpne innstillinger for meldingshistorikkgrense';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Meldingshistorikkgrense';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Aktiver meldingshistorikkgrense';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Grensedato';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Medlemmer uten Les meldingshistorikk kan se meldinger sendt etter denne datoen.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Meldingshistorikkgrense oppdatert';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Tillat store bokstaver og mellomrom i tekstkanalnavn. Av skrur på at navn kun er små bokstaver med bindestreker og understreker.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Skjuler kroneikonet ved siden av fellesskapets eier på alle flater.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animerte ikoner krever fellesskapsfunksjonen Animerte ikoner.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animerte bannere krever fellesskapsfunksjonen Animerte bannere.';

  @override
  String get guildSettingsAfkChannel => 'AFK / inaktiv kanal';

  @override
  String get guildSettingsAfkChannelHint =>
      'Flytt medlemmer til denne kanalen når de er AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Ingen AFK-kanal';

  @override
  String get guildSettingsAfkTimeout => 'AFK-tidsavbrudd';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minutt';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minutter';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minutter';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minutter';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 time';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String get guildSettingsSystemChannel => 'Destinasjonskanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Velkomst- og systemmeldinger vil vises her.';

  @override
  String get guildSettingsNoSystemChannel => 'Ingen systemkanal';

  @override
  String get guildSettingsHideJoinMessages => 'Skjul innmeldingsmeldinger';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Skjuler meldinger om at noen har blitt med i den valgte kanalen.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Standard varslingsinnstillinger';

  @override
  String get guildSettingsNotificationsAll => 'Alle meldinger';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Varsle om alle meldinger';

  @override
  String get guildSettingsNotificationsMentions => 'Kun nevnelser';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Varsle kun om nevnelser';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks 10 MB. Minimum: 960×540 piksler (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks 10 MB. Minimum: 960×540 piksler (16:9). Vises i invitasjons-embeds i chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Konfigurer verifisering, innholdsfiltrering og innstillinger for modent innhold.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Fellesskap som er listet i Discovery har begrensede modereringsalternativer.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Innholdsfiltrering';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Filtrer automatisk meldinger for eksplisitt innhold i kanaler som ikke er merket for modent innhold.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Fellesskap som er listet i Discovery er pålagt å skanne alle medlemmer. Denne innstillingen kan ikke endres mens Discovery er aktivert.';

  @override
  String get guildSettingsContentFilterOff => 'Av';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'La fellesskapet selv moderere';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Filtrer medlemmer uten roller';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Anbefalt for de fleste fellesskap';

  @override
  String get guildSettingsContentFilterAll => 'Filtrer alle';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maksimal beskyttelse for familievennlige områder';

  @override
  String get guildSettingsModerationMatureOff => 'Av';

  @override
  String get guildSettingsModerationMatureOn => 'På';

  @override
  String get guildSettingsContentWarningToggle => 'Vis en innholdsadvarsel';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Slår på en samtykkeprompt før du går inn i en kanal.';

  @override
  String get guildSettingsContentWarningText => 'Egendefinert advarselstekst';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Dette inneholder sensitivt innhold.';

  @override
  String get guildSettingsModeration2faTitle => 'Krav om totrinnsbekreftelse';

  @override
  String get guildSettingsModeration2faDescription =>
      'Krev totrinnsbekreftelse for moderatorer før de kan utestenge, sparke, sette i timeout eller fjerne meldinger.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Krev 2FA for modereringshandlinger';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Kun fellesskapets eier kan endre denne innstillingen';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Aktiver 2FA på kontoen din for å endre denne innstillingen';

  @override
  String get guildSettingsEmojiSearchHint => 'Søk etter emojier';

  @override
  String get guildSettingsEmojiUploadTitle => 'Last opp emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Emozji-plasser';

  @override
  String get guildSettingsEmojiDropZone => 'Dra og slipp emojifiler her';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Kunne ikke laste inn emojier. Prøv igjen senere.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Ingen emojier samsvarer med søket ditt.';

  @override
  String get guildSettingsEmojiNoSlots => 'Ingen emojisporene er tilgjengelige';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Du har nådd maksimalt antall emojier. Slett noen eksisterende emojier for å få plass.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Navn på emojier må ha minst 2 tegn og kan bruke bokstaver, tall og understreker. Emojier må være under $maxSize. Statiske bilder endres størrelse til 128x128 piksler og komprimeres automatisk. Animerte emojier og SVG-er må allerede passe inn i grensen.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Laster opp emojier';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojier',
      one: '# emoji',
    );
    return 'Laster opp $_temp0. Dette kan ta litt tid.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Kunne ikke laste opp emojier. Prøv igjen.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Noen emojier kunne ikke legges til';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Gå gjennom disse filene og prøv igjen med mindre eller enklere bilder.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Gi nytt navn til emojien';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 tegn, bokstaver, tall, understreker.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Navn';

  @override
  String get guildSettingsEmojiColumnUploader => 'Lastet opp av';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Ukjent';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Slett emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Slett :$name:? Kan ikke angres.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Slett denne emojien fra lagring og CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Emonavnet må være minst 2 tegn langt';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Emonavnet kan være maks 32 tegn langt';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Ugyldig emojinavn';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Kunne ikke gi nytt navn til denne emojien';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Navnet ble tilbakestilt til det det var før. Prøv igjen om en liten stund.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Denne emojien finnes ikke lenger';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Den kan ha blitt slettet. Navnet ble tilbakestilt til det det var før.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Du kan ikke gi denne emojien nytt navn';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Du har ikke tillatelse til å endre navn på denne emojien. Navnet ble tilbakestilt til det opprinnelige.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Du er for rask';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Vent litt, og prøv å endre navn på nytt.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Kunne ikke slette denne emojien';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Du kan ikke slette denne emojien';

  @override
  String get guildSettingsCloneEmojiTitle => 'Tillat andre å klone emojier';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Når aktivert, kan medlemmer av andre fellesskap bruke snarveien \"Klon\" med ett klikk i appen på dine egendefinerte emojier. Dette hindrer dem ikke i å lagre bildet og laste det opp selv.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Tillat andre å klone klistremerkene dine';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Når denne er aktivert, kan medlemmer av andre fellesskap bruke snarveien \"Klon\" med ett klikk i appen på dine egendefinerte klistremerker. Dette forhindrer dem ikke i å lagre bildet og laste det opp selv.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Kun medlemmer med $permission-tillatelsen kan endre dette.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Kunne ikke oppdatere emojikloning';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Kunne ikke oppdatere kloning av klistremerker';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Animerte emojier ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animerte emojier ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Søk etter klistremerker';

  @override
  String get guildSettingsStickerSlotsTitle => 'Klistremerkeplasser';

  @override
  String get guildSettingsStickerUploadTitle => 'Last opp klistremerke';

  @override
  String get guildSettingsStickerDropZone =>
      'Dra og slipp en klistremerkefil her (én om gangen)';

  @override
  String get guildSettingsStickerDensity => 'Klistremerketetthet';

  @override
  String get guildSettingsStickerDensityCozy => 'Koselig';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompakt';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Kunne ikke laste inn klistremerker';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Det oppsto en feil under lasting av klistremerkene. Prøv igjen.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Ingen klistremerker samsvarer med søket ditt.';

  @override
  String get guildSettingsStickersEmptySearch => 'Ingen klistremerker funnet';

  @override
  String get guildSettingsStickerNoSlots =>
      'Ingen klistremerkeplasser tilgjengelig';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Du har nådd maksimalt antall klistremerker. Slett noen eksisterende klistremerker for å få plass.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Klistremerker lagres i 320x320 piksler og må være under $maxSize. Statiske bilder endres størrelse og komprimeres automatisk. Animerte klistremerker og SVG-er må allerede passe inn i grensen.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Filtypen for klistremerket støttes ikke';

  @override
  String get guildSettingsStickerAddTitle => 'Legg til klistremerke';

  @override
  String get guildSettingsStickerEditTitle => 'Rediger klistremerke';

  @override
  String get guildSettingsStickerNameLabel => 'Navn';

  @override
  String get guildSettingsStickerNameHint => 'Mitt flotte klistremerke';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Beskrivelse';

  @override
  String get guildSettingsStickerDescriptionHint => 'Beskriv klistremerket';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Etiketter ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Legg til en tagg';

  @override
  String get guildSettingsStickerTagAdd => 'Legg til';

  @override
  String get guildSettingsStickerNameRequired => 'Navn er påkrevd';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Navnet må være på minst 2 tegn';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Navnet kan ikke være lenger enn 30 tegn';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Beskrivelsen må være på 500 tegn eller mindre';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Kunne ikke opprette dette klistremerket';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Klistremerket er for stort';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Klistremerket kunne ikke komprimeres nok';

  @override
  String get guildSettingsStickerDeleteTitle => 'Slett klistremerke';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Slett «$name»? Kan ikke angres.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Slett dette klistremerket fra lagring og CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Kunne ikke slette dette klistremerket';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Du kan ikke slette dette klistremerket';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Opprett webhooks fra Kanalinnstillinger. Rediger dem her.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Din egendefinerte URL vil ikke fungere med mindre minst én kanal er synlig for alle.';

  @override
  String get guildSettingsVanityUrlRemove => 'Fjern';

  @override
  String get guildSettingsBannedUsersTitle => 'Utestengte brukere';

  @override
  String get guildSettingsInvitesTableInviter => 'Inviterer';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Kode';

  @override
  String get guildSettingsInvitesTableUses => 'Bruk';

  @override
  String get guildSettingsInvitesTableCreated => 'Opprettet';

  @override
  String get guildSettingsInvitesTableExpires => 'Utløper';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrer etter bruker';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrer etter handling';

  @override
  String get createDm => 'Opprett DM';

  @override
  String get createGroupDm => 'Opprett gruppe-DM';

  @override
  String get createDmNewMessage => 'Ny melding';

  @override
  String get createDmSelectFriends => 'Velg venner';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Velg venner å sende melding til.';

  @override
  String get createDmSearchFriends => 'Søk venner';

  @override
  String get createDmNoFriendsFound => 'Ingen venner funnet';

  @override
  String get createDmNoFriendsYet => 'Du har ingen venner ennå';

  @override
  String get createDmClaimToStartDms =>
      'Gjør krav på kontoen din for å starte direktemeldinger.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifiser e-posten din for å starte direktemeldinger.';

  @override
  String get createDmVerifyYourEmail => 'Bekreft e-posten din';

  @override
  String get createDmNewGroup => 'Ny gruppe';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Opprett en ny gruppe med $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Bekreft ny gruppe';

  @override
  String get createDmCreateNewGroup => 'Opprett ny gruppe';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Fjern $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Du har allerede en gruppe med disse brukerne. Vil du virkelig opprette en ny? Det er også greit!';

  @override
  String get createDmNoActivityYet => 'Ingen aktivitet ennå';

  @override
  String get createDmSomeUsersCantBeAdded => 'Noen brukere kan ikke legges til';

  @override
  String get createDmCreateWithoutThem => 'Opprett uten dem';

  @override
  String get createDmUnaddableIntro =>
      'Disse personene kan ikke legges til i denne gruppe-DM-en:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Opprett gruppemeldingen med de resterende $count mottakerne og hopp over de andre?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Ingen gjenværende mottakere å opprette en gruppe-DM med.';

  @override
  String get createDmUnaddableUserNotFound => 'Brukeren ble ikke funnet';

  @override
  String get createDmUnaddableBlocked =>
      'Du kan ikke sende melding til denne brukeren';

  @override
  String get createDmUnaddableNotFriends => 'Ikke på vennelisten din';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Kan ikke legges til i gruppe-DM-er';

  @override
  String get createDmFailed => 'Kunne ikke opprette samtalen. Prøv igjen.';

  @override
  String get dmListMessagesTitle => 'Meldinger';

  @override
  String get dmListDirectMessagesTitle => 'Direktemeldinger';

  @override
  String get keybindsSearchShortcuts => 'Søk snarveier';

  @override
  String get keybindSectionDefaults => 'Standard';

  @override
  String get keybindSectionMessages => 'Meldinger';

  @override
  String get keybindSectionNavigation => 'Navigasjon';

  @override
  String get keybindSectionDragAndDrop => 'Dra og slipp';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Tale og video';

  @override
  String get keybindSectionMisc => 'Diverse';

  @override
  String get keybindActionShowShortcutsList =>
      'Vis liste over tastatursnarveier';

  @override
  String get keybindActionCopyText => 'Kopier tekst';

  @override
  String get keybindActionMarkUnread => 'Merk som ulest';

  @override
  String get keybindActionFocusTextarea => 'Fokuser tekstfelt';

  @override
  String get keybindActionSwitchCommunities => 'Bytt mellom fellesskap';

  @override
  String get keybindActionSwitchChannels => 'Bytt mellom kanaler';

  @override
  String get keybindActionHistoryBack => 'Gå tilbake i kanalhistorikken';

  @override
  String get keybindActionHistoryForward => 'Gå fremover i kanalhistorikken';

  @override
  String get keybindActionJumpUnreadChannels => 'Hopp mellom uleste kanaler';

  @override
  String get keybindActionJumpMentionChannels =>
      'Hopp mellom uleste kanaler med omtaler';

  @override
  String get keybindActionJumpCurrentCall => 'Gå til den pågående samtalen';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Veksle mellom siste fellesskap og direktemeldinger';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Bytt til forrige fellesskap eller DM-er';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Bytt til neste fellesskap eller direktemeldinger';

  @override
  String get keybindActionGoToDms => 'Gå til direktemeldinger';

  @override
  String get keybindActionGoToFirstCommunity => 'Gå til første fellesskap';

  @override
  String get keybindActionGoToSecondCommunity => 'Gå til andre fellesskap';

  @override
  String get keybindActionGoToThirdCommunity => 'Gå til tredje fellesskap';

  @override
  String get keybindActionGoToFourthCommunity => 'Gå til fjerde fellesskap';

  @override
  String get keybindActionGoToFifthCommunity => 'Gå til femte fellesskap';

  @override
  String get keybindActionGoToSixthCommunity => 'Gå til sjette fellesskap';

  @override
  String get keybindActionGoToSeventhCommunity => 'Gå til sjuende fellesskap';

  @override
  String get keybindActionGoToEighthCommunity => 'Gå til åttende fellesskap';

  @override
  String get keybindActionToggleQuickSwitcher => 'Vis/skjul hurtigbytter';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Opprett eller bli med i et fellesskap';

  @override
  String get keybindActionStartDragAndDrop => 'Start dra og slipp';

  @override
  String get keybindActionMove => 'Flytt';

  @override
  String get keybindActionDropItem => 'Slipp gjenstand';

  @override
  String get keybindActionCancel => 'Avbryt';

  @override
  String get keybindActionMarkCommunityRead => 'Merk fellesskap som lest';

  @override
  String get keybindActionMarkChannelRead => 'Merk kanal som lest';

  @override
  String get keybindActionStartGroupDm => 'Start en gruppe-DM';

  @override
  String get keybindActionTogglePinnedMessages => 'Vis/skjul festede meldinger';

  @override
  String get keybindActionToggleInbox => 'Vis/skjul innboksen';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Merk øverste innbokskanal som lest';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Merk alle innbokskanaler som lest';

  @override
  String get keybindActionToggleMemberList =>
      'Vis/skjul medlemsliste eller talechat';

  @override
  String get keybindActionToggleEmojiPicker => 'Vis/skjul emojivelgeren';

  @override
  String get keybindActionToggleGifPicker => 'Vis/skjul GIF-velgeren';

  @override
  String get keybindActionToggleStickerPicker =>
      'Vis/skjul klistremerkevelgeren';

  @override
  String get keybindActionScrollChatUp => 'Rull chat opp';

  @override
  String get keybindActionScrollChatDown => 'Rull ned i chatten';

  @override
  String get keybindActionJumpOldestUnread =>
      'Gå til den eldste uleste meldingen';

  @override
  String get keybindActionFocusComposer => 'Fokuser tekstfeltet';

  @override
  String get keybindActionUploadFile => 'Last opp en fil';

  @override
  String get keybindActionCopyChannelLink => 'Kopier kanallenke';

  @override
  String get keybindActionToggleSavedMedia => 'Vis/skjul lagrede medier';

  @override
  String get keybindActionSendVoiceMessage => 'Send talemelding';

  @override
  String get keybindActionAnswerCall => 'Svar på det innkommende anropet';

  @override
  String get keybindActionDeclineCall => 'Avslå innkommende anrop';

  @override
  String get keybindActionStartDmCall =>
      'Start en samtale i en DM eller gruppe';

  @override
  String get keybindActionToggleSoundboard => 'Slå av/på soundboardet';

  @override
  String get keybindActionToggleCompactCallView =>
      'Utvid eller skjul kompakt samtalevisning';

  @override
  String get keybindActionPushToTalkPriority =>
      'Trykk for å snakke (prioritet)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioritet for stemmeaktivitet';

  @override
  String get keybindActionOpenHelp => 'Åpne hjelp';

  @override
  String get keybindActionSearchMessages => 'Søk i meldinger';

  @override
  String get keybindActionOpenContextMenu => 'Åpne hurtigmenyen';

  @override
  String get keybindActionOpenSettings => 'Åpne innstillingene dine';

  @override
  String get keybindActionOpenThemeStudio => 'Åpne temastudio-popup';

  @override
  String get keybindActionZoomIn => 'Zoom inn';

  @override
  String get keybindActionZoomOut => 'Zoom ut';

  @override
  String get keybindActionZoomReset => 'Tilbakestill zoom';

  @override
  String get clipboardPasteFailed =>
      'Kunne ikke lime inn. Utklippstavlen var tom eller blokkert for denne appen.';

  @override
  String get homeQuickActionDms => 'Direktemeldinger';
}
