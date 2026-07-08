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
  String get changeYourFluxerTag => 'Endre din FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

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
  String get fluxerTagAlreadyTaken => 'FluxerTag er allerede tatt';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTaggen $username#$discriminator er allerede tatt. Fortsetter du, vil diskriminatoren din bli rullet om automatisk.';
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
      'Hvis du lagrer denne FluxerTaggen, vil din egendefinerte 4-sifrede tag gå tilbake til et tilfeldig nummer når Plutonium-abonnementet ditt avsluttes. Hvis abonnementet ditt ikke fornyes, har du en 3-dagers grace-periode før taggen endres.';

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
  String get fluxerTagUpdated => 'FluxerTag oppdatert';

  @override
  String get fluxerTagUpdateFailed =>
      'Kunne ikke oppdatere FluxerTag. Prøv igjen.';

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
      'Bekreft kontoen din for å endre FluxerTag';

  @override
  String get changeFluxerTag => 'Endre FluxerTag';

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
  String get blockedUsersCopyTag => 'Kopier FluxerTag';

  @override
  String get blockedUsersCopyId => 'Kopier bruker-ID';

  @override
  String get userProfileLoadError => 'Kunne ikke laste profil';

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
  String get chatAttachmentExpiredTooltip => 'Vedlegg utløpt';

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
  String get accessibilityUnreadGroupTitle => 'Ulest indikator';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Kontroller hvordan uleste meldingsindikatorer vises.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Vis falmet ulest indikator i dempede kanaler';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Vis en dempet ulest indikator ved siden av dempede direkte meldinger og kanaler, slik at du fortsatt kan se med et øyekast når det er aktivitet.';

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
  String get voiceChannelEmptyDescription =>
      'Dette er en stemmekanal. Koble til for å begynne å snakke!';

  @override
  String get voiceChannelJoin => 'Bli med i stemmekanalen';

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
  String get voiceControlChat => 'Chat';

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
  String get channelDetailsAddFriendsToGroup => 'Add Friends to Group';

  @override
  String get channelDetailsGroupInvites => 'Group Invites';

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
  String get userSettingsNavExpressionPacks => 'Uttrykkespakker';

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
  String get userSettingsNavMessagesAndMedia => 'Meldinger og medier';

  @override
  String get userSettingsNavAudioAndVideo => 'Lyd og video';

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
  String get userSettingsNavSoundsAndAlerts => 'Lyder og varsler';

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
  String get betaWarningTitle => 'Betaprogramvare';

  @override
  String get betaWarningMessage =>
      'Dette er betaprogramvare. Ikke alt er ferdig eller lagt til ennå.';

  @override
  String get betaWarningReportIssues =>
      'Vennligst rapporter eventuelle problemer du finner til Fluxer Mobile-fellesskapet (du må ha Plutonium for å kunne bli med i fellesskapet for øyeblikket).';

  @override
  String get betaWarningRepoLink => 'Se kildekode på GitHub';

  @override
  String get betaWarningGotIt => 'Forstått';

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
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Krever minst $count medlemmer for å søke.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Søknad';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Status';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategori';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beskrivelse';

  @override
  String get guildSettingsDiscoveryTags => 'Emneknagger';

  @override
  String get guildSettingsDiscoveryTagsHint => 'spill, kunst, musikk';

  @override
  String get guildSettingsDiscoveryApply => 'Send søknad';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Trekk tilbake';

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
  String get guildSettingsWebhooksInfo =>
      'Opprett webhooks fra Kanalinnstillinger. Rediger dem her.';

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
  String get guildSettingsMembersSortNewest => 'Nyeste først';

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
}
