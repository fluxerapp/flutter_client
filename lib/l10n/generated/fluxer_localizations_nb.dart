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
      'Your session has expired. Please sign in again.';

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
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

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
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

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
    return 'Visionary (lifetime $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days of $productName',
      one: '1 day of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks of $productName',
      one: '1 week of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months of $productName',
      one: '1 month of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years of $productName',
      one: '1 year of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'From $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Click to claim your gift!';

  @override
  String get embedGiftAlreadyRedeemed => 'Already redeemed';

  @override
  String get embedGiftClaimAccountHelp =>
      'Claim your account to redeem this gift.';

  @override
  String get embedGiftClaim => 'Claim gift';

  @override
  String get embedGiftClaimed => 'Gift claimed';

  @override
  String get embedGiftClaimAccount => 'Claim account to redeem';

  @override
  String get embedGiftUnknownTitle => 'Unknown gift';

  @override
  String get embedGiftUnknownSubtitle =>
      'This gift code is invalid or already claimed.';

  @override
  String get embedGiftUnavailable => 'Gift unavailable';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Claim your gift to activate your $productName subscription!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'This gift has already been claimed.';

  @override
  String get giftAcceptMaybeLater => 'Maybe later';

  @override
  String get giftRedeemedToast => 'Gift redeemed!';

  @override
  String get giftRedeemInvalidTitle => 'Invalid gift code';

  @override
  String get giftRedeemInvalidMessage =>
      'This code is invalid or already used.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Gift already redeemed';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'This code was already redeemed.';

  @override
  String get giftRedeemNotFoundTitle => 'Gift not found';

  @override
  String get giftRedeemNotFoundMessage => 'This code doesn\'t exist.';

  @override
  String get giftRedeemFailedTitle => 'Failed to redeem gift';

  @override
  String get giftRedeemFailedMessage =>
      'Couldn\'t redeem this gift. Try again.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Can\'t redeem this gift';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary accounts can\'t redeem Plutonium gifts. Copy the link to share it with a friend instead.';

  @override
  String get giftCopyLink => 'Copy gift link';

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
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

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
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
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
  String get dmDebugCategory => 'Debug Category';

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
  String get addFriendSendFailedGeneric =>
      'Kunne ikke sende venneforespørselen. Prøv igjen.';

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
  String get externalLinkWarningLeaving => 'Du er i ferd med å forlate Fluxer';

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
  String get profilePreviewMemberSince => 'Fluxer-medlem siden';

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
  String get securityLoginEmailSectionDescription =>
      'Administrer e-postadressen du bruker for å logge inn på Fluxer';

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
  String get relativeTimeJustNow => 'akkurat nå';

  @override
  String get authorizedAppsTitle => 'Autoriserte applikasjoner';

  @override
  String get authorizedAppsDescription =>
      'Disse applikasjonene har fått tilgang til Fluxer-kontoen din.';

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
  String get userProfileLoading => 'Loading profile';

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
  String get userProfileStaffBadgeTooltip => 'Fluxer-ansatt';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer fellesskapsteam';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer-partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium-abonnent siden $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary siden $date';
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
  String get chatAttachmentFileTooLarge =>
      'Én eller flere filer overskrider størrelsesgrensen';

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
  String get voiceMessageSeekForward => 'Seek forward';

  @override
  String get voiceMessageSeekBackward => 'Seek backward';

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
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Vedlegg utløpt';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand ($count lines)',
      one: 'Expand ($count line)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Collapse ($count lines)',
      one: 'Collapse ($count line)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand ($count rows)',
      one: 'Expand ($count row)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Collapse ($count rows)',
      one: 'Collapse ($count row)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count lines left)',
      one: '... ($count line left)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rows left)',
      one: '... ($count row left)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'View whole file';

  @override
  String get chatTextualPreviewChangeLanguage => 'Change language';

  @override
  String get chatTextualPreviewSearchLanguage => 'Search language…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntax highlighting';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'No results found';

  @override
  String get chatTextualPreviewMoreOptions => 'More options';

  @override
  String get chatTextualPreviewWrapText => 'Wrap text';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'File is too large for inline preview (limit $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Unable to load preview.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Plain text';

  @override
  String get chatTextualPreviewCopy => 'Copy';

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
  String get connectionsDescription =>
      'Koble eksterne kontoer og domener til Fluxer-profilen din. Verifiserte tilkoblinger vil bli vist på profilen din for andre å se.';

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
  String get lookAndFeelCollapseDMsLabel => 'Kollaps DM-er til mappe';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Når aktivert, kollapses uleste DM-er i serverlisten til en mappe på Fluxer-knappen. Klikk på Fluxer-knappen mens du er på DM-siden for å utvide eller kollapse mappen.';

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
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Når lastet opp direkte til Fluxer';

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
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Always underline links';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Dim strikethrough text';

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
  String get accessibilityScreenReaderGroupTitle => 'Screen reader';

  @override
  String get accessibilityScreenReaderGroupDescription =>
      'Control how Fluxer works with screen readers.';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Announce new messages';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Let screen readers announce new messages as they arrive in the open channel. Notification sounds are unaffected.';

  @override
  String get accessibilityTtsGroupTitle => 'Text-to-speech';

  @override
  String get accessibilityTtsGroupDescription =>
      'Choose a speed for spoken text.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Speech playback speed';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Play sample';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Silence sample';

  @override
  String get accessibilityPreviewButtonLabel => 'Preview button';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'This shows how links appear: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Preview User';

  @override
  String get accessibilityKeyboardGroupTitle => 'Keyboard';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Show focus ring on chat textarea';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Escape key exits keyboard mode';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Show context menu shortcuts';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirm before starting calls';

  @override
  String get accessibilityAnimationGroupTitle => 'Animation';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Reduced motion is on, so content animations are paused by default. You can still turn any of these back on to keep it playing.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'Play animated emojis';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'Automatically play GIFs';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Automatically play GIFs when $productName is focused';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Playing despite reduced motion.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Paused by reduced motion. Turn on to keep animated emojis playing.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Paused by reduced motion. Turn on to keep GIFs playing.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Defaults to off on mobile to preserve battery life and data usage.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Sticker animations';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Sticker animation preference';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Always animate';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Stickers will always animate';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animate on interaction';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Stickers will animate when you press them';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Stickers will animate when you hover or interact with them';

  @override
  String get accessibilityStickerNeverAnimateName => 'Never animate';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Stickers will never animate';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Always animating despite reduced motion.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Reduced motion limits stickers to animate on interaction. Choose always animate to override.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Defaults to animate on interaction on mobile to preserve battery life.';

  @override
  String get accessibilityMotionGroupTitle => 'Motion';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sync reduced motion setting with system';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Use this device\'s system reduced motion preference, or customize it below.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reduce motion';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Disable animations and transitions. Currently controlled by your system setting.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Disable animations and transitions throughout the app.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animated emojis, GIFs and stickers stay under your control in the Animation tab.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Start call?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Are you sure you want to start this call?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Start call';

  @override
  String get accessibilityTtsSampleDescription =>
      'Hear the sample line spoken with your chosen speed.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, I\'m from the future. I came here in a time machine that you invented. Now, I need your help to get back to the year 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Speech synthesis is unavailable on this device.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Speech playback failed. Try again, or check that audio output is working.';

  @override
  String get ttsSubstitutionUnknownUser => 'unknown user';

  @override
  String get ttsSubstitutionUnknownRole => 'unknown role';

  @override
  String get ttsSubstitutionUnknownChannel => 'unknown channel';

  @override
  String get ttsSubstitutionCodeBlock => 'code block';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'slash $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName said: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Replying to $replyAuthorName, $authorName said: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'sent a sticker';

  @override
  String get ttsSentAttachment => 'sent an attachment';

  @override
  String ttsSentAttachments(int count) {
    return 'sent $count attachments';
  }

  @override
  String get ttsSentEmbed => 'sent an embed';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author sent $summary';
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
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Dette er en stemmekanal. Koble til for å begynne å snakke!';

  @override
  String get voiceChannelJoin => 'Bli med i stemmekanalen';

  @override
  String get voiceCallJoin => 'Join call';

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
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Skjermdeling';

  @override
  String get voiceScreenShareNotificationText => 'Deler skjermen din.';

  @override
  String get voiceControlMore => 'Mer';

  @override
  String get voiceControlDisconnect => 'Koble fra';

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
  String get voiceParticipantMenuCommunityMute => 'Community mute';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Community deafen';

  @override
  String get voiceParticipantMenuUserVolume => 'User volume';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream volume';

  @override
  String get voiceParticipantModerationFailed =>
      'Couldn\'t update that member. Please try again.';

  @override
  String get voiceControlChat => 'Chat';

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
  String get privacyDashboardProfilePrivacySection => 'Profile privacy';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Friends & direct messages';

  @override
  String get privacyDashboardActivitySharingSection => 'Activity sharing';

  @override
  String get privacyDashboardSensitiveContentSection => 'Sensitive content';

  @override
  String get privacyDashboardDataExportSection => 'Data export';

  @override
  String get privacyDashboardDataDeletionSection => 'Data deletion';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Who can see your full profile';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Friends and all communities';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Your full profile is visible to friends and to anyone in your communities';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Friends and small communities only';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Your full profile is visible to friends and members of your communities with 200 or fewer members';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Friends only';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Your full profile is only visible to your friends';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Friend requests';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Everyone';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Allow anyone to send you friend requests';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Friends of Friends';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Allow friends of your friends to send you requests';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Community Members';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Allow members from communities you\'re in to send you requests';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direct messages';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Allow direct messages from community members';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Allow members from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Allow direct messages from community bots';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Allow bots from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Control who can send you friend requests and direct messages';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Control who can call you and add you to group chats';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Incoming calls';

  @override
  String get privacyDashboardIncomingCallsDesc => 'Control who can call you';

  @override
  String get privacyDashboardAllowedCallers => 'Allowed callers';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nobody';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Block all incoming calls';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Friends Only';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Only allow friends to call you (recommended)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Friends + Custom';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Allow friends plus additional groups you choose';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Everyone';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Allow anyone to call you, even strangers';

  @override
  String get privacyDashboardAdditionalGroups => 'Additional Groups';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'People who are friends with your friends can call you';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'People from communities you\'re both in can call you';

  @override
  String get privacyDashboardRingBehavior => 'Ring Behavior';

  @override
  String get privacyDashboardSilentCalls => 'Silent calls from everyone';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'All calls will notify silently instead of ringing. By default, calls from non-friends are always silent.';

  @override
  String get privacyDashboardGroupDmTitle => 'Who Can Add You to Group Chats';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Control who can add you to group chats without asking. Anyone can still send you invite links to join.';

  @override
  String get privacyDashboardAllowedInvites => 'Allowed invites';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Don\'t let anyone add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Only allow friends to add you without asking (recommended)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Allow friends plus additional groups to add you';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Allow anyone to add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'People who are friends with your friends can add you to group chats';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'People from communities you\'re both in can add you to group chats';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Voice activity on active now';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Share your voice activity with friends';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Share voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Stop sharing voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'You\'re about to start sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'You\'re about to stop sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Yes, share with all friends';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Yes, stop sharing';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Available again in $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Voice activity sharing updated';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Couldn\'t update voice activity sharing right now';

  @override
  String get privacyDashboardDataExportDesc =>
      'Build a downloadable archive of your account data, including messages and attachment URLs. Most people want everything, but you can narrow the scope below.';

  @override
  String get privacyDashboardExportMyData => 'Export my data';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Permanently remove messages you have sent across DMs, group DMs, and communities. The work runs in the background, and you will get a DM when it finishes.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Delete my messages';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Allow direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Block direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Allow bots to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Block bots from sending you direct messages?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Do you also want to allow direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Do you also want to block direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Do you also want to allow bots from your existing communities to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Do you also want to block bots from your existing communities?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'You can also change this setting per-community by long-pressing the community name and selecting Privacy Settings.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Allow for all communities';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Block for all communities';

  @override
  String get privacyDashboardDmConfirmSkip => 'Skip this step';

  @override
  String get privacyDashboardDataRequestGoBack => 'Go back';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Export my data';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Delete my messages';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'We\'ll process this as soon as possible. You\'ll get an email when your archive is ready.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'We\'ll process this as soon as possible. You\'ll get a DM from us when it\'s done.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'What to include';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Everything';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Export every message you have ever sent, plus all of your account settings, memberships, and metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Custom selection';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Choose which conversation kinds, communities, and time window to include in the archive.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Choose what to include';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Pick which kinds of conversations to clean up.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Only places I can\'t access anymore';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Only delete messages from communities and group DMs you have left or been removed from.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Which conversations';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Toggle the kinds of conversations you want included.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Open DMs';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Closed DMs';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Which communities';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Community filter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Include all except selected';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Only the selected ones';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'You aren\'t in any communities right now.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Time range';

  @override
  String get privacyDashboardDataRequestDateMode => 'Time range';

  @override
  String get privacyDashboardDataRequestAllTime => 'All time';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Custom range';

  @override
  String get privacyDashboardDataRequestStartDate => 'Start date';

  @override
  String get privacyDashboardDataRequestEndDate => 'End date';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Leave either field blank to leave that end of the window unbounded.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Pick at least one kind of conversation to include.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Start date must be earlier than end date.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Review and confirm';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'We\'ll build a downloadable archive of every message you have ever sent and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'We\'ll build a downloadable archive that matches the filters below and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Permanently delete the messages that match the filters below. This cannot be undone.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'There is no recovery once this starts. We will DM you when it finishes.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Request export';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Delete messages';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Scope';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Conversations';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Time range';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'None';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'From $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Until $end';
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
      other: '# communities',
      one: '# community',
    );
    return 'All except $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communities',
      one: '# community',
    );
    return 'Only $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Open direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Closed direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Direct messages (open and closed)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Communities';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0 and $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# seconds',
      one: '# second',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'Failed to load privacy settings';

  @override
  String get privacyDashboardRetry => 'Retry';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Failed to save sensitive content settings.';

  @override
  String get privacyDashboardDataRequestFailed => 'Failed to complete request.';

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
      'Waiting for slowmode in one or more selected channels to expire.';

  @override
  String get slowmodeRateLimitedTitle => 'Slowmode active';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Slowmode is on — wait $duration before sending another.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Direct upload is disabled during slowmode.';

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
  String get chatMessageSpeak => 'Speak message';

  @override
  String get chatMessageStopSpeaking => 'Stop speaking';

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
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

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
  String get iarReasonOtherDescription =>
      'Bruk kun hvis det tydelig bryter Fluxers regler og ikke passer inn ovenfor.';

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
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

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
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

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
    return 'Attachment $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Dismiss';

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
  String get channelDetailsSearchFilterIn => 'In';

  @override
  String get channelDetailsSearchFilterMentions => 'Mentions';

  @override
  String get channelDetailsSearchFilterMore => 'More';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Active';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count channels';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count users';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'User';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filter by channel';

  @override
  String get channelDetailsSearchChannelsHint => 'Search channels';

  @override
  String get channelDetailsSearchChannelsEmpty => 'No channels found';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Pinned';

  @override
  String get channelDetailsSearchPinnedTrue => 'Pinned only';

  @override
  String get channelDetailsSearchPinnedFalse => 'Exclude pinned';

  @override
  String get channelDetailsSearchClearFilter => 'Clear';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Author type';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Date';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Date mode';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Pick a date';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link hostname';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Filename contains';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'File extension';

  @override
  String get channelDetailsSearchContentPoll => 'Poll';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Messages with a poll';

  @override
  String get channelDetailsSearchContentForward => 'Forward';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Forwarded messages';

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
  String get personalNotesTitle => 'Personlige notater';

  @override
  String get personalNotesSubtitle =>
      'Din private plass for tanker og påminnelser';

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
  String get composerOpenExpressionPicker => 'Open expression picker';

  @override
  String get composerShowKeyboard => 'Show keyboard';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', sending';

  @override
  String get messageAccessibilityFailedSuffix => ', failed to send';

  @override
  String get messageAccessibilityAttachmentSummary => 'an attachment';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count attachments';
  }

  @override
  String get messageAccessibilityImageSummary => 'an image';

  @override
  String get messageAccessibilityVideoSummary => 'a video';

  @override
  String get messageAccessibilityAudioSummary => 'an audio file';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'file $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'a spoiler attachment';

  @override
  String get messageAccessibilityEmbedSummary => 'an embed';

  @override
  String get messageAccessibilityEmptySummary => 'a message';

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
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sikkerhet og innlogging';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Gaver og koder';

  @override
  String get giftSettingsClaimAccountTitle => 'Claim your account';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Claim your account to redeem or manage Plutonium gift codes.';

  @override
  String get giftSettingsRedeemTitle => 'Redeem a gift';

  @override
  String get giftSettingsRedeemDescription =>
      'Enter a gift code to redeem Plutonium for your account.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Enter gift code…';

  @override
  String get giftSettingsRedeemButton => 'Redeem';

  @override
  String get giftSettingsRedeemSuccess =>
      'Gift redeemed successfully. Enjoy your Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Purchased gifts';

  @override
  String get giftSettingsPurchasedDescription =>
      'Manage your purchased Plutonium gift codes. Share the gift URL with someone special or redeem it for yourself!';

  @override
  String get giftSettingsEmptyTitle => 'No gifts yet';

  @override
  String get giftSettingsEmptyDescription =>
      'Buy a Plutonium gift from the Plutonium tab to share with friends.';

  @override
  String get giftSettingsGoToPlutonium => 'Go to Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'Failed to load gift inventory';

  @override
  String get giftSettingsLoadFailedDescription => 'Try again later.';

  @override
  String get giftSettingsTryAgain => 'Try again';

  @override
  String get giftSettingsGiftUrl => 'Gift URL';

  @override
  String get giftSettingsCopy => 'Copy';

  @override
  String get giftSettingsCopied => 'Copied';

  @override
  String get giftSettingsGiftUrlCopied => 'Gift URL copied to clipboard!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Couldn\'t copy gift URL';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Purchased $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Redeemed $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Redeemed by $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'This gift has been redeemed';

  @override
  String get giftSettingsRedeemForYourself => 'Redeem for yourself';

  @override
  String get giftSettingsShareWithFriend => 'Share with a friend';

  @override
  String get premiumPlutoniumTagline =>
      'Unlock higher limits and exclusive features while supporting an independent communication platform.';

  @override
  String get premiumPurchaseMode => 'Purchase mode';

  @override
  String get premiumForMe => 'For me';

  @override
  String get premiumAsAGift => 'As a gift';

  @override
  String get premiumMonthly => 'Monthly';

  @override
  String get premiumYearly => 'Yearly';

  @override
  String get premiumPerMonth => 'per month';

  @override
  String get premiumPerYear => 'per year';

  @override
  String get premiumOneTimePurchase => 'one-time purchase';

  @override
  String get premiumSave17 => 'Save 17%';

  @override
  String get premiumUpgradeNow => 'Upgrade now';

  @override
  String get premiumBuyGift => 'Buy gift';

  @override
  String get premiumOneYearGift => '1 year gift';

  @override
  String get premiumOneMonthGift => '1 month gift';

  @override
  String get premiumMostPopular => 'Most popular';

  @override
  String get premiumScrollPrompt =>
      'Scroll down to view all the perks included with Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Free vs Plutonium';

  @override
  String get premiumFreeColumn => 'Free';

  @override
  String get premiumGiftSectionTitle => 'Gift Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Share the Plutonium experience with your friends by purchasing a gift subscription.';

  @override
  String get premiumGiftBannerOne =>
      'You have a new gift code waiting for you!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'You have $count new gift codes waiting for you!';
  }

  @override
  String get premiumViewGifts => 'View gifts';

  @override
  String get premiumReadyToUpgrade => 'Ready to upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Ready to buy a gift?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Monthly $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Yearly $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 year $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 month $price';
  }

  @override
  String get premiumManageSubscription => 'Manage subscription';

  @override
  String get premiumRedeemGiftCode => 'Redeem gift code';

  @override
  String get premiumGiftBadge => 'Gift';

  @override
  String get premiumCancelSubscriptionTitle => 'Cancel subscription?';

  @override
  String get premiumCancelSubscriptionBody =>
      'You keep your perks until your next renewal date, then have a 3-day grace period to resubscribe and keep your subscriber history.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Cancel subscription';

  @override
  String get premiumKeepSubscription => 'Keep subscription';

  @override
  String get premiumPurchaseHistoryTitle => 'Purchase history';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Your recent invoices. To change the payment method for your subscription, add or choose one in the billing portal and make it the default.';

  @override
  String get premiumManagePaymentMethods => 'Manage payment methods';

  @override
  String get premiumBillingHistory => 'Billing history';

  @override
  String get premiumSelfServeRefundTitle => 'Self-serve refund';

  @override
  String get premiumSelfServeRefundButton => 'Refund latest purchase';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'By purchasing, you agree to our ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'By purchasing, you agreed to our ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' and ';

  @override
  String premiumActiveUntil(String date) {
    return 'Active until $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Canceling';

  @override
  String premiumCancelsOn(String date) {
    return 'Cancels on $date. Perks remain active until then.';
  }

  @override
  String get premiumReactivateSubscription => 'Reactivate';

  @override
  String premiumGiftedUntil(String date) {
    return 'Gifted until $date. Does not renew automatically.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Feature';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'By purchasing, you agreed to our $terms and $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Self-serve refunds available within 3 days of payment, once every 30 days. Refunding a subscription cancels it. EU/EEA buyers waive the 14-day right of withdrawal at checkout to access content immediately. Use the in-app refund button instead of a chargeback. Chargebacks can permanently restrict your account. Stripe handles payment securely. We never see your full card number.';

  @override
  String get premiumTermsOfService => 'Terms of service';

  @override
  String get premiumPrivacyPolicy => 'Privacy policy';

  @override
  String get premiumCheckoutStartFailedTitle => 'Couldn\'t start checkout';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Something went wrong while starting checkout. Please try again in a moment.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'You\'re currently on a gift subscription. It won\'t renew. You can redeem more gift codes to extend it. Recurring subscriptions can be started after your gift time ends.';

  @override
  String get premiumPlanUnavailable =>
      'This plan isn\'t available. Contact support.';

  @override
  String get premiumCompletePaymentTitle => 'Complete payment';

  @override
  String get premiumCompletePaymentBody =>
      'You are now navigating to Stripe to complete the payment. Return to Fluxer once you\'ve completed it.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Choose payment method';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Pay with Pix automático to authorize recurring charges directly from your Brazilian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUsePix => 'Use Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Pay with UPI to set up an RBI-compliant e-mandate from your Indian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUseUpi => 'Use UPI';

  @override
  String get premiumUseCard => 'Use card';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Couldn\'t open the billing portal';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Something went wrong while opening the billing portal. Please try again in a moment.';

  @override
  String get premiumAlreadyVisionaryTitle => 'You\'re already Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary already includes permanent access, so a recurring subscription isn\'t needed. You can still buy gifts for others.';

  @override
  String get premiumExistingSubscriptionTitle => 'Subscription already exists';

  @override
  String get premiumExistingSubscriptionBody =>
      'We found an existing Fluxer Plutonium subscription for this account. Manage it in the secure billing portal to update payment details or check renewal status. If you just paid, wait a minute and reopen this page.';

  @override
  String get premiumPurchasesDisabledTitle => 'Purchases unavailable';

  @override
  String get premiumPurchasesDisabledBody =>
      'Purchases are disabled for this account. Contact support@fluxer.app if this looks wrong.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Claim your account to purchase Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'You need to verify your email before you can purchase Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Custom username tag';

  @override
  String get premiumPerkPerCommunityProfiles => 'Per-community profiles';

  @override
  String get premiumPerkMessageScheduling => 'Message scheduling';

  @override
  String get premiumPerkProfileBadge => 'Profile badge';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Custom video backgrounds';

  @override
  String get premiumPerkEntranceSounds => 'Entrance sounds';

  @override
  String get premiumPerkCommunities => 'Communities';

  @override
  String get premiumPerkMessageCharacterLimit => 'Message character limit';

  @override
  String get premiumPerkBookmarkedMessages => 'Bookmarked messages';

  @override
  String get premiumPerkFileUploadSize => 'File upload size';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji & sticker packs';

  @override
  String get premiumPerkSavedMedia => 'Saved media';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Use animated emojis';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Global emoji & sticker access';

  @override
  String get premiumPerkVideoQuality => 'Video quality';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animated avatars & profile banners';

  @override
  String get premiumPerkEarlyAccess => 'Early access to new features';

  @override
  String get premiumPerkCustomThemes => 'Custom themes';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Up to 4K/60fps';

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
  String get userSettingsNavShortcuts => 'Shortcuts';

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
  String get notificationsTtsSectionTitle => 'Text-to-speech notifications';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Enable /tts speech playback';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Let /tts read your message aloud. Disabling the setting keeps those commands as regular text.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Adjust playback speed in ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accessibility';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatic message narration';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Converts incoming content to speech, regardless of whether it came from /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Every channel';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Let every incoming message be spoken, regardless of which channel is open.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Active channel only';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narrates only the channel you\'re viewing. Narration follows you between channels.';

  @override
  String get notificationsTtsModeNeverName => 'Never automatically';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Remain silent unless someone runs /tts manually.';

  @override
  String get notificationsTtsModeAriaLabel => 'Speak all messages out loud';

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
  String get userSettingsNavLanguageAndTime => 'Språk og tid';

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
  String get userSettingsNavDefaultApps => 'Default Apps';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Web Browser';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Choose which browser opens when you tap a link.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'If an app is installed for a site, links will open in that app first.';

  @override
  String get defaultAppsWebBrowserInApp => 'In-app browser';

  @override
  String get defaultAppsWebBrowserExternal => 'External browser';

  @override
  String get userSettingsNavAdvanced => 'Avansert';

  @override
  String get advancedPerformanceReportingTitle => 'Ytelsesrapportering';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Hjelp til å forbedre Fluxer ved å dele anonyme krasj- og ytelsesdata.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Send krasj- og ytelsesrapporter';

  @override
  String get advancedPerformanceReportingDescription =>
      'Alle rapporterte data er anonyme og sendes kun til Fluxers egen overvåkingstjeneste – ingen tredjepartsleverandører brukes.';

  @override
  String get advancedSettingsConfigure => 'Configure';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacy';

  @override
  String get advancedSettingsCategoryAppearance => 'Appearance';

  @override
  String get advancedSettingsCategoryAccessibility => 'Accessibility';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Voice';

  @override
  String get advancedSettingsCategoryDeveloper => 'Developer';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'Enable text selection';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Allow selecting text in the app';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Enable video seek thumbnails';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Thumbnail or live frame while scrubbing video';

  @override
  String get advancedSettingShowNekoLabel => 'Show Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko cat that chases your cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Show Neko on your chat input';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Keyboard hints';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Keyboard shortcut hints in tooltips';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Enable favorites';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Show favorites throughout the app';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Voice channel join behavior';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmation or double-click for community voice joins';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Require double-click to join voice channels';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Confirm before joining voice channels';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Automatically send GIFs when selected';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Automatically send GIFs from the picker without confirmation';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Save GIF favorites as saved media';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Choose how starred GIF favorites are stored';

  @override
  String get advancedSettingMediaButtonsLabel => 'Media buttons';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Customize which buttons and indicators appear on media attachments and embeds';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Upload attachments before sending';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Start uploading attachments as soon as they are added to the message input';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Strip tracking parameters from URLs';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automatically remove tracking parameters from URLs in messages you send';

  @override
  String get advancedSettingTrustAllLinksLabel => 'Trust all external links';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Skip the external link warning for all domains';

  @override
  String get advancedSettingSearchEnginesLabel => 'Search engines';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configure search engines used from selected text';

  @override
  String get advancedSettingTranslatorsLabel => 'Translators';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configure translator providers used from selected text';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Reverse image search';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Reverse image search providers';

  @override
  String get advancedSettingMessageActionBarLabel => 'Message action bar';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Customize the action bar that appears when hovering over messages';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Expression autocomplete';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Pick what appears when you type a colon in the message input';

  @override
  String get advancedSettingInputButtonsLabel => 'Message input buttons';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Pick which buttons show in the message input';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Scroll to bottom when sending a message';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Choose how chat moves after you send a message';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Skip \"Mark all as read\" confirmation';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Mark all unread inbox channels as read immediately, without asking to confirm';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Hide muted channels by default';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Hide channels you\'ve muted from community sidebars';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Show GIF indicator';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Show attachment expiry indicator';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Show delete button';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Show download button';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Show favorite button';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Show suppress embeds button';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Show message action bar';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'Show only more button';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Show quick reactions';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Enable Shift to expand';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Show default emojis in expression autocomplete';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Show custom emojis in expression autocomplete';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Show stickers in expression autocomplete';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Show saved media in expression autocomplete';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Show GIFs button';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Show media button';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Show stickers button';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Show emoji button';

  @override
  String get advancedSettingShowSendButtonLabel => 'Show send button';

  @override
  String get advancedSettingNewDeviceAlertsLabel => 'Show new device alerts';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Prompt for new audio devices';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Connection volume controls';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Show per-device participant volume sliders in voice menus';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Screen share preview behavior';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Preview, popout, and stream thumbnail behavior';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Screen share codec';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Video codec for screen sharing';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatic (recommended)';

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
      'Pause my screen share preview in the background';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Hide my stream preview thumbnail';

  @override
  String get advancedSettingDeveloperModeLabel => 'Enable developer mode';

  @override
  String get advancedSettingDeveloperModeDescription => 'Enable developer mode';

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
  String get advancedSettingTranslatorGoogle => 'Google Translate';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Default search engine';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Choose which search engine is used by default when searching selected text.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Built-in search engines';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Enable or disable built-in search engines. Enabled engines appear in the message context menu when text is selected.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Custom search engines';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Add your own search engines with a custom URL pattern. Use \'$query\' as a placeholder for the search text.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Add search engine';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Enable at least one search engine below.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Remove search engine';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Default translator';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Choose which translator is used by default when translating selected text.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Built-in translators';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Enable or disable built-in translators. Enabled translators appear in the message context menu when text is selected.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Custom translators';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Add your own translators with a custom URL pattern. Use \'$query\' as a placeholder for the text to translate.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Add translator';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Enable at least one translator below.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Remove translator';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Default reverse image search';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Choose which reverse image search service is used by default when searching an image.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Built-in reverse image search';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Enable or disable built-in reverse image search providers. Enabled providers appear in the context menu of images, avatars, banners, stickers, and emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Custom reverse image search';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Add your own reverse image search providers with a custom URL pattern. Use \'$url\' as a placeholder for the image URL.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Add reverse image search';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Enable at least one reverse image search provider below.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Remove reverse image search';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Add search engine';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Edit search engine';

  @override
  String get advancedSettingAddTranslatorTitle => 'Add translation provider';

  @override
  String get advancedSettingEditTranslatorTitle => 'Edit translation provider';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Add reverse image search engine';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Edit reverse image search engine';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Name';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL pattern';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'My search engine';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'My translator';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'My reverse image search';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Use \'$query\' where the search text should be inserted.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Use \'$query\' where the text to translate should be inserted.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Use \'$url\' where the image URL should be inserted.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Name is required.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'URL pattern is required.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL pattern must contain \'$query\' placeholder.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL pattern must contain \'$url\' placeholder.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL pattern must be a valid URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Add';

  @override
  String get advancedSettingEditSearchProviderAction => 'Edit';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Remove';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Are you sure you want to remove $engineName?';
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
  String get savedMessagesEmptyTitle => 'No bookmarks';

  @override
  String get savedMessagesEmptyBody =>
      'Bookmark messages to save them for later.';

  @override
  String get savedMessagesEndBody => 'There\'s nothing more to see here.';

  @override
  String get savedMessagesRemoveTooltip => 'Remove bookmark';

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
    return 'This will notify $count members with the $roleName role. Continue?';
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
  String get guildNavbarGuildSelected => 'selected';

  @override
  String get guildNavbarGuildUnread => 'unread';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mentions',
      one: '1 mention',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'muted';

  @override
  String get authShowPassword => 'Show password';

  @override
  String get authHidePassword => 'Hide password';

  @override
  String get chatLoadingMessages => 'Loading messages';

  @override
  String get friendsMessageFriend => 'Message';

  @override
  String get friendsFriendActions => 'Friend actions';

  @override
  String get friendsAcceptRequest => 'Accept friend request';

  @override
  String get friendsDeclineRequest => 'Decline friend request';

  @override
  String get friendsCancelRequest => 'Cancel friend request';

  @override
  String get friendsOpenInbox => 'Inbox';

  @override
  String get profileRemoveFriend => 'Remove friend';

  @override
  String get profileUnblockUser => 'Unblock user';

  @override
  String get profileAcceptFriendRequest => 'Accept friend request';

  @override
  String get profileCancelFriendRequest => 'Cancel friend request';

  @override
  String get profileSendFriendRequest => 'Add friend';

  @override
  String get accountOverflowMenu => 'Account options';

  @override
  String get navHome => 'Home';

  @override
  String get navNotifications => 'Notifications';

  @override
  String get navYou => 'You';

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
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

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
  String get guildNavbarStaffOnlyAccessible =>
      'Kun tilgjengelig for Fluxer-ansatte';

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
  String get guildMenuSettingsChannels => 'Channels';

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
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Krever minst $count medlemmer for å søke.';
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
  String get guildSettingsDiscoveryCategory => 'Kategori';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beskrivelse';

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
  String get guildSettingsDiscoveryTags => 'Emneknagger';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'spill, kunst, musikk';

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
  String get guildSettingsDiscoveryApply => 'Send søknad';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Trekk tilbake';

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
      'Søk og administrer servermedlemmer.';

  @override
  String get guildSettingsMembersSearchHint => 'Søk etter medlemmer';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count medlemmer';
  }

  @override
  String get guildMembersRecentTitle => 'Recent members';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Showing $displayedCount of $totalCount total members';
  }

  @override
  String get guildMembersSort => 'Sort';

  @override
  String get guildSettingsMembersSortNewest => 'Nyeste først';

  @override
  String get guildMembersSortOldest => 'Oldest first';

  @override
  String get guildMembersColumnName => 'Name';

  @override
  String get guildMembersColumnMemberSince => 'Member since';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Joined $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Join method';

  @override
  String get guildMembersColumnRoles => 'Roles';

  @override
  String get guildMembersColumnActions => 'Actions';

  @override
  String get guildMembersFilterMemberSince => 'Filter by member since';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filter by account creation date';

  @override
  String get guildMembersFilterJoinMethod => 'Filter by join method';

  @override
  String get guildMembersFilterRoles => 'Filter by roles';

  @override
  String get guildMembersFilterAll => 'All';

  @override
  String get guildMembersFilterPast1Hour => 'Past 1 hour';

  @override
  String get guildMembersFilterPast24Hours => 'Past 24 hours';

  @override
  String get guildMembersFilterPast7Days => 'Past 7 days';

  @override
  String get guildMembersFilterPast2Weeks => 'Past 2 weeks';

  @override
  String get guildMembersFilterPast3Weeks => 'Past 3 weeks';

  @override
  String get guildMembersFilterPast4Weeks => 'Past 4 weeks';

  @override
  String get guildMembersFilterPast3Months => 'Past 3 months';

  @override
  String get guildMembersFilterCustomRange => 'Custom range...';

  @override
  String get guildMembersDateRangeTitle => 'Custom date range';

  @override
  String get guildMembersDateAfter => 'After date';

  @override
  String get guildMembersDateBefore => 'Before date';

  @override
  String get guildMembersClearAll => 'Clear all';

  @override
  String get guildMembersRowsPerPage => 'Rows per page';

  @override
  String get guildMembersEmptySearch => 'Nobody matches that search.';

  @override
  String get guildMembersLoadError =>
      'Something went wrong loading members. Try again later.';

  @override
  String get guildMembersIndexing => 'Indexing members…';

  @override
  String get guildMembersGoToPage => 'Go to page';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Go to page $page';
  }

  @override
  String get guildMembersJumpToPage => 'Jump to page';

  @override
  String get guildMembersJoinSourceCreator => 'Community creator';

  @override
  String get guildMembersJoinSourceInvite => 'Invite';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Invite ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Invited by $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Vanity URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Bot invite';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Platform admin';

  @override
  String get guildMembersJoinSourceDiscovery => 'Discovery';

  @override
  String get guildMembersJoinMethodUnknown => 'Unknown';

  @override
  String get guildMembersCommunityOwner => 'Community owner';

  @override
  String get guildMembersViewAllRoles => 'View all roles';

  @override
  String get guildMembersJoinedJustNow => 'Just now';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Members';

  @override
  String get guildMembersChannelListSelected => 'Members, selected';

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Se og tilbakekall aktive invitasjonslenker.';

  @override
  String get guildSettingsInvitesEmpty => 'Ingen aktive invitasjoner.';

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
    return 'Animerte emojier ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animerte emojier ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Søk etter klistremerker';

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
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrer etter bruker';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrer etter handling';

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

  @override
  String get keybindsSearchShortcuts => 'Search shortcuts';

  @override
  String get keybindSectionDefaults => 'Defaults';

  @override
  String get keybindSectionMessages => 'Messages';

  @override
  String get keybindSectionNavigation => 'Navigation';

  @override
  String get keybindSectionDragAndDrop => 'Drag and drop';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Voice and video';

  @override
  String get keybindSectionMisc => 'Miscellaneous';

  @override
  String get keybindActionShowShortcutsList => 'Show keyboard shortcuts list';

  @override
  String get keybindActionCopyText => 'Copy text';

  @override
  String get keybindActionMarkUnread => 'Mark as unread';

  @override
  String get keybindActionFocusTextarea => 'Focus text area';

  @override
  String get keybindActionSwitchCommunities => 'Switch between communities';

  @override
  String get keybindActionSwitchChannels => 'Switch between channels';

  @override
  String get keybindActionHistoryBack =>
      'Move back through viewed channel history';

  @override
  String get keybindActionHistoryForward =>
      'Move forward through viewed channel history';

  @override
  String get keybindActionJumpUnreadChannels => 'Jump between unread channels';

  @override
  String get keybindActionJumpMentionChannels =>
      'Jump between unread channels with mentions';

  @override
  String get keybindActionJumpCurrentCall => 'Jump to the current call';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Toggle between last community and DMs';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Switch to previous community or DMs';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Switch to next community or DMs';

  @override
  String get keybindActionGoToDms => 'Go to Direct Messages';

  @override
  String get keybindActionGoToFirstCommunity => 'Go to first community';

  @override
  String get keybindActionGoToSecondCommunity => 'Go to second community';

  @override
  String get keybindActionGoToThirdCommunity => 'Go to third community';

  @override
  String get keybindActionGoToFourthCommunity => 'Go to fourth community';

  @override
  String get keybindActionGoToFifthCommunity => 'Go to fifth community';

  @override
  String get keybindActionGoToSixthCommunity => 'Go to sixth community';

  @override
  String get keybindActionGoToSeventhCommunity => 'Go to seventh community';

  @override
  String get keybindActionGoToEighthCommunity => 'Go to eighth community';

  @override
  String get keybindActionToggleQuickSwitcher => 'Toggle quick switcher';

  @override
  String get keybindActionCreateOrJoinCommunity => 'Create or join a community';

  @override
  String get keybindActionStartDragAndDrop => 'Start drag and drop';

  @override
  String get keybindActionMove => 'Move';

  @override
  String get keybindActionDropItem => 'Drop item';

  @override
  String get keybindActionCancel => 'Cancel';

  @override
  String get keybindActionMarkCommunityRead => 'Mark community as read';

  @override
  String get keybindActionMarkChannelRead => 'Mark channel as read';

  @override
  String get keybindActionStartGroupDm => 'Start a group DM';

  @override
  String get keybindActionTogglePinnedMessages => 'Toggle pinned messages';

  @override
  String get keybindActionToggleInbox => 'Toggle the inbox';

  @override
  String get keybindActionMarkTopInboxRead => 'Mark top inbox channel as read';

  @override
  String get keybindActionMarkAllInboxRead => 'Mark all inbox channels as read';

  @override
  String get keybindActionToggleMemberList =>
      'Toggle the member list or voice chat';

  @override
  String get keybindActionToggleEmojiPicker => 'Toggle the emoji picker';

  @override
  String get keybindActionToggleGifPicker => 'Toggle the GIF picker';

  @override
  String get keybindActionToggleStickerPicker => 'Toggle the sticker picker';

  @override
  String get keybindActionScrollChatUp => 'Scroll chat up';

  @override
  String get keybindActionScrollChatDown => 'Scroll chat down';

  @override
  String get keybindActionJumpOldestUnread =>
      'Jump to the oldest unread message';

  @override
  String get keybindActionFocusComposer => 'Focus the text area';

  @override
  String get keybindActionUploadFile => 'Upload a file';

  @override
  String get keybindActionCopyChannelLink => 'Copy channel link';

  @override
  String get keybindActionToggleSavedMedia => 'Toggle saved media';

  @override
  String get keybindActionSendVoiceMessage => 'Send voice message';

  @override
  String get keybindActionAnswerCall => 'Answer the incoming call';

  @override
  String get keybindActionDeclineCall => 'Decline the incoming call';

  @override
  String get keybindActionStartDmCall => 'Start a call in a DM or group';

  @override
  String get keybindActionToggleSoundboard => 'Toggle the soundboard';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expand or collapse compact call view';

  @override
  String get keybindActionOpenHelp => 'Open help';

  @override
  String get keybindActionSearchMessages => 'Search messages';

  @override
  String get keybindActionOpenContextMenu => 'Open the context menu';

  @override
  String get keybindActionOpenSettings => 'Open your settings';

  @override
  String get keybindActionOpenThemeStudio => 'Open theme studio popout';

  @override
  String get keybindActionZoomIn => 'Zoom in';

  @override
  String get keybindActionZoomOut => 'Zoom out';

  @override
  String get keybindActionZoomReset => 'Reset zoom';
}
