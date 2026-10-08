// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class FluxerLocalizationsNl extends FluxerLocalizations {
  FluxerLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get reconnectingTitle => 'We hebben een fout gemaakt!';

  @override
  String get reconnectingBody =>
      'Er is iets mis met de instantie.\nHet zou zo opgelost moeten zijn!';

  @override
  String get gatewayReconnectingToast => 'Opnieuw verbinden…';

  @override
  String get gatewayConnectedToast => 'Verbonden';

  @override
  String get sessionExpiredToast =>
      'Je sessie is verlopen. Meld je opnieuw aan.';

  @override
  String splashStartupFailed(String error) {
    return 'Kon niet starten: $error';
  }

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get splashConnectionLost => 'Verbinding verbroken';

  @override
  String get splashViewOnStatusPage => 'Bekijk op statuspagina';

  @override
  String get splashConnectionIssuesPrompt => 'Verbindingsproblemen?';

  @override
  String get splashStatusPageLink => 'Statuspagina';

  @override
  String get splashReadIncident => 'Incident lezen';

  @override
  String get splashIncidentHistory => 'Geschiedenis van incidenten';

  @override
  String get nagbarLearnMore => 'Meer informatie';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Onderhoud gepland voor $localizedTime. Verwachte duur: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Er wordt onderhoud uitgevoerd. Verwachte duur: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Onderhoud is voltooid.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hé $displayName, voltooi de registratie van je account om te voorkomen dat je de toegang verliest.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hé $displayName, verifieer je e-mailadres.';
  }

  @override
  String get nagbarOpenSettings => 'Instellingen openen';

  @override
  String get systemPermissionSettingsTitle => 'Schakel toestemming in';

  @override
  String get systemPermissionSettingsOpenSettings => 'Instellingen openen';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName heeft geen toegang tot je microfoon. Je kunt dit inschakelen in de privacyinstellingen van je apparaat.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName heeft geen toegang tot je camera. Je kunt dit inschakelen in de privacyinstellingen van je apparaat.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName heeft geen toegang tot je fotoalbum. Je kunt dit inschakelen in de privacyinstellingen van je apparaat.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName heeft geen toestemming om meldingen te sturen. Je kunt dit inschakelen in je apparaatinstellingen.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Je abonnement kon niet worden verlengd, maar je hebt nog steeds toegang tot de voordelen van $productName tot $graceDate. Neem nu actie, anders verlies je alle voordelen.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Uw $productName-abonnement is verlopen. Vernieuw nu om uw voordelen te behouden.';
  }

  @override
  String get nagbarManageSubscription => 'Abonnement beheren';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Welkom bij $productFullName. Ontdek je $productName-voordelen en beheer je abonnement.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Bekijk de functies van $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Je hebt een nieuwe cadeaubon die klaar ligt in je cadeaulijst.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Je hebt $count nieuwe cadeaucodes die wachten in je cadeaulijst.';
  }

  @override
  String get nagbarViewGiftInventory => 'Cadeau-inventaris bekijken';

  @override
  String get nagbarVisionaryMfa =>
      'Schakel tweefactorauthenticatie in om uw Visionary-account te beschermen.';

  @override
  String get nagbarEnableMfa => 'Schakel 2FA in';

  @override
  String get nagbarTermsAcceptance =>
      'We hebben onze voorwaarden bijgewerkt. Lees ze door en ga akkoord om verder te gaan.';

  @override
  String get nagbarReviewTerms => 'Bekijk de voorwaarden';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Word lid van $communityName om met het team te chatten en op de hoogte te blijven.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Word lid van $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Schakel meldingen in, zodat je geen berichten en vermeldingen mist.';

  @override
  String get nagbarEnableNotifications => 'Meldingen inschakelen';

  @override
  String get nagbarBillingPortalFailed =>
      'Kon de facturatieportal niet openen. Probeer het later opnieuw.';

  @override
  String get welcomeBack => 'Welkom terug';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'Voer een geldig e-mailadres in.';

  @override
  String get password => 'Wachtwoord';

  @override
  String get forgotPassword => 'Wachtwoord vergeten?';

  @override
  String get logIn => 'Inloggen';

  @override
  String get logInWithPasskey => 'Log in met een wachtleutel';

  @override
  String continueWithSso(String provider) {
    return 'Doorgaan met $provider';
  }

  @override
  String get organizationSsoProvider =>
      'Log in via de aanbieder van eenmalige aanmelding van je organisatie.';

  @override
  String get failedToStartSso => 'Kan SSO niet starten';

  @override
  String get ssoCancelled => 'SSO-login is geannuleerd';

  @override
  String preferSso(String provider) {
    return 'Liever inloggen met SSO? Ga verder met $provider.';
  }

  @override
  String get needAccountPrompt => 'Account nodig? ';

  @override
  String get register => 'Registreren';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => 'Annuleren';

  @override
  String get ipAuthCheckEmail => 'Controleer je e-mail';

  @override
  String ipAuthDescription(String email) {
    return 'We hebben een link gestuurd om deze login te autoriseren. Open je inbox voor $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Verbinding verbroken';

  @override
  String get ipAuthConnectionLostDescription =>
      'We hebben de verbinding verloren tijdens het wachten op autorisatie. Probeer het opnieuw.';

  @override
  String get ipAuthLinkExpired => 'Inloglink verlopen';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Deze autorisatielink is verlopen. Meld u opnieuw aan.';

  @override
  String get ipAuthResendEmail => 'E-mail opnieuw verzenden';

  @override
  String get ipAuthResent => 'Opnieuw verzonden';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Terug';

  @override
  String get next => 'Volgende';

  @override
  String get mfaTitle => 'Tweefactorauthenticatie';

  @override
  String get mfaChooseMethod => 'Kies een verificatiemethode';

  @override
  String get mfaMethodTotp => 'Authenticatie-app';

  @override
  String get mfaMethodWebauthn => 'Beveiligingssleutel / passkey';

  @override
  String get mfaTotpDescription =>
      'Voer de 6-cijferige code in van je authenticatie-app of een van je back-upcodes.';

  @override
  String get mfaCodeLabel => 'Code';

  @override
  String get mfaTryAnotherMethod => 'Probeer een andere methode';

  @override
  String get mfaUseSecurityKey => 'Beveiligingssleutel/passkey gebruiken';

  @override
  String get accountSelectorTitle => 'Kies een account';

  @override
  String get accountSelectorDescription =>
      'Selecteer een account om door te gaan, of voeg een ander account toe.';

  @override
  String get accountAdd => 'Account toevoegen';

  @override
  String get accountRemoveDescription =>
      'Hiermee wordt de opgeslagen sessie voor dit account verwijderd.';

  @override
  String get accountExpired => 'Verlopen';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sessie verlopen voor $identifier. Log alstublieft opnieuw in.';
  }

  @override
  String get accountManageTitle => 'Accounts beheren';

  @override
  String get accountSwitchFailed =>
      'Kon niet van account wisselen. Probeer het opnieuw.';

  @override
  String get profileTabMenuSwitchAccounts => 'Van account wisselen';

  @override
  String get statusChangeSheetTitle => 'Status instellen';

  @override
  String get statusOnlineStatusSection => 'Onlinestatus';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Inactief';

  @override
  String get statusDnd => 'Niet storen';

  @override
  String get statusInvisible => 'Onzichtbaar';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Tot ik het wijzig';

  @override
  String get statusDontClear => 'Niet wissen';

  @override
  String get statusFor10Seconds => 'Voor 10 seconden';

  @override
  String get statusClearAfter10Seconds => '10 seconden';

  @override
  String get statusClearAfter15Minutes => '15 minuten';

  @override
  String get statusClearAfter30Minutes => '30 minuten';

  @override
  String get statusClearAfter1Hour => '1 uur';

  @override
  String get statusClearAfter3Hours => '3 uur';

  @override
  String get statusClearAfter4Hours => '4 uur';

  @override
  String get statusClearAfter8Hours => '8 uur';

  @override
  String get statusClearAfter24Hours => '24 uur';

  @override
  String get statusClearAfter3Days => '3 dagen';

  @override
  String get statusDndDescription =>
      'Je ontvangt geen meldingen op je computer';

  @override
  String get statusInvisibleDescription => 'Je verschijnt als offline';

  @override
  String get customStatusSetTitle => 'Aangepaste status instellen';

  @override
  String get customStatusCurrentHint => 'Aangepaste status';

  @override
  String get customStatusClear => 'Aangepaste status wissen';

  @override
  String get customStatusPlaceholder => 'Wat is er aan de hand?';

  @override
  String get customStatusChooseEmoji => 'Kies een emoji';

  @override
  String get customStatusClearAfter => 'Wissen na';

  @override
  String get customStatusSave => 'Opslaan';

  @override
  String get accountActive => 'Actief account';

  @override
  String get signOut => 'Uitloggen';

  @override
  String get suspendedPermanentTitle => 'Account permanent geschorst';

  @override
  String get suspendedTemporaryTitle => 'Account tijdelijk geschorst';

  @override
  String get suspendedPermanentDescription =>
      'Uw account is permanent geschorst wegens schending van onze Servicevoorwaarden.';

  @override
  String get suspendedTemporaryDescription =>
      'Uw account is tijdelijk geschorst. U krijgt weer toegang tot uw account zodra de schorsingsperiode is beëindigd.';

  @override
  String get suspendedIssuedAt => 'Uitgegeven';

  @override
  String get suspendedEndsAt => 'Eindigt';

  @override
  String get suspendedDuration => 'Duur';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Reden';

  @override
  String get suspendedAppealDeadline => 'Uiterste datum voor beroep';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Uw account is gepland voor verwijdering op $date.';
  }

  @override
  String get suspendedRecheck => 'Controleren op updates';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Opnieuw controleren over ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Terug naar login';

  @override
  String get suspendedAppealTitle => 'Beroep';

  @override
  String get suspendedAppealHint =>
      'Leg uit waarom je schorsing heroverwogen moet worden (minimaal 50 tekens)...';

  @override
  String get suspendedAppealSubmit => 'Verstuur beroep';

  @override
  String get suspendedAppealPending => 'In behandeling';

  @override
  String get suspendedAppealAccepted => 'Beroep geaccepteerd';

  @override
  String get suspendedAppealRejected => 'Beroep afgewezen';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Je beroep is geaccepteerd en je account is hersteld.';

  @override
  String get suspendedSignIn => 'Meld je aan bij je account';

  @override
  String get forgotPasswordTitle => 'Wachtwoord vergeten?';

  @override
  String get forgotPasswordDescription =>
      'Voer je e-mailadres in en we sturen je een link om je wachtwoord opnieuw in te stellen.';

  @override
  String get forgotPasswordSubmit => 'Herstelkoppeling verzenden';

  @override
  String get forgotPasswordSentTitle => 'Controleer je e-mail';

  @override
  String get forgotPasswordSentDescription =>
      'We hebben instructies voor het opnieuw instellen van je wachtwoord naar je e-mailadres gestuurd. Controleer je inbox en volg de link om je wachtwoord opnieuw in te stellen.';

  @override
  String get forgotPasswordBackToLogin => 'Terug naar login';

  @override
  String get resetPasswordTitle => 'Nieuw wachtwoord instellen';

  @override
  String get resetPasswordDescription =>
      'Voer hieronder je nieuwe wachtwoord in om het resetproces te voltooien.';

  @override
  String get resetPasswordNewPassword => 'Nieuw wachtwoord';

  @override
  String get resetPasswordConfirm => 'Bevestig nieuw wachtwoord';

  @override
  String get resetPasswordSubmit => 'Wachtwoord opnieuw instellen';

  @override
  String get resetPasswordMismatch => 'Wachtwoorden komen niet overeen.';

  @override
  String get recoverAccountTitle => 'Herstel je account';

  @override
  String get recoverAccountDescription =>
      'Voer uw gebruikersnaam en de herstelsleutel uit uw herstelkit in, kies dan een nieuw wachtwoord.';

  @override
  String get recoverAccountNoKit =>
      'Geen herstelkit? Vraag een beheerder van dit exemplaar om een link om je wachtwoord opnieuw in te stellen.';

  @override
  String get recoveryKitTitle => 'Je herstelkit';

  @override
  String get recoveryKitCreatedDescription =>
      'Als je je wachtwoord vergeet, is deze kit de enige manier om weer toegang te krijgen tot je account. Bewaar hem ergens veilig, zoals in een wachtwoordmanager of een afgedrukte kopie.';

  @override
  String get recoveryKitReplacedDescription =>
      'Je oude herstelkit werkt niet meer. Bewaar deze nieuwe ergens veilig.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Je wachtwoord is gereset. Je oude herstelkit werkt niet meer. Bewaar deze nieuwe ergens veilig.';

  @override
  String get recoveryKitWarning =>
      'Iedereen met deze sleutel kan je wachtwoord opnieuw instellen. Deel deze nooit.';

  @override
  String get recoveryKitKeyLabel => 'Herstelcode';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return '$productName herstelkit';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Bewaar deze pagina ergens veilig. Als je je wachtwoord vergeet, kun je het gebruiken om weer toegang te krijgen tot je account. Iedereen met deze herstelsleutel kan je wachtwoord opnieuw instellen, dus deel hem nooit.';

  @override
  String get recoveryKitInstanceLabel => 'Instantie';

  @override
  String get recoveryKitCreatedAtLabel => 'Aangemaakt';

  @override
  String get recoveryKitQrCaption =>
      'Scan om de herstelpagina te openen met uw gegevens ingevuld.';

  @override
  String get recoveryKitStepsTitle => 'Hoe u uw account herstelt';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Ga naar $recoverUrl of scan de QR-code.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Voer je gebruikersnaam en deze herstelsleutel in.';

  @override
  String get recoveryKitStepPassword =>
      'Kies een nieuw wachtwoord. Je krijgt een nieuwe herstelkit en deze werkt dan niet meer.';

  @override
  String get recoveryKitBackupCodesTitle => 'Back-upcodes voor twee stappen';

  @override
  String get recoveryKitBackupCodesNote =>
      'Elke code werkt één keer in plaats van je authenticatie-app.';

  @override
  String get recoveryKitBackupCodesFailed => 'Kon uw back-upcodes niet laden.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Mijn back-upcodes voor tweestapsverificatie opnemen in de opgeslagen afbeelding';

  @override
  String get recoveryKitCopy => 'Kopiëren';

  @override
  String get recoveryKitCopied => 'Herstelsleutel gekopieerd';

  @override
  String get recoveryKitSaveImage => 'Afbeelding opslaan';

  @override
  String get recoveryKitSaved => 'Herstelkit opgeslagen';

  @override
  String get recoveryKitSavedToPhotos => 'Herstelkit opgeslagen in Foto\'s';

  @override
  String get recoveryKitSaveFailed =>
      'Kan de herstelkit niet opslaan. Probeer het opnieuw of kopieer de sleutel.';

  @override
  String get recoveryKitAcknowledge =>
      'Ik heb mijn herstelkit ergens veilig opgeslagen';

  @override
  String get recoveryKitCreateFailed =>
      'Kon uw herstelkit niet aanmaken. U kunt er later een aanmaken in uw accountinstellingen.';

  @override
  String get recoveryKitSectionTitle => 'Herstelkit';

  @override
  String get recoveryKitSectionDescription =>
      'Hiermee kun je je wachtwoord opnieuw instellen als je het vergeet.';

  @override
  String get recoveryKitNone => 'Je hebt nog geen herstelkit';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Gemaakt $time';
  }

  @override
  String get recoveryKitCreate => 'Maak herstelkit';

  @override
  String get recoveryKitCreateNew => 'Maak een nieuwe kit';

  @override
  String get recoveryKitReplaceTitle => 'Nieuwe herstelkit aanmaken?';

  @override
  String get recoveryKitReplaceDescription =>
      'Je huidige kit werkt niet meer zodra de nieuwe is aangemaakt.';

  @override
  String get recoveryKitReminderTitle => 'Bewaar een herstelkit';

  @override
  String get recoveryKitReminderBody =>
      'Uw account heeft geen e-mailadres. Als u uw wachtwoord vergeet, is een herstelkit de enige manier om weer toegang te krijgen. Het duurt maar een minuut.';

  @override
  String get registerUsernameSignInHint =>
      'Je meldt je aan met deze gebruikersnaam. Kies er een die je onthoudt.';

  @override
  String get registerUsernameTaken => 'Deze gebruikersnaam is al in gebruik';

  @override
  String get registerUsernameAvailable => 'Deze gebruikersnaam is beschikbaar';

  @override
  String get claimAccountUsernameDescription =>
      'Claim je account door een gebruikersnaam en wachtwoord te kiezen. Je meldt je hiermee aan, dus kies er een die je kunt onthouden.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Je account is nog niet geclaimd. Zonder gebruikersnaam en wachtwoord kun je niet inloggen vanaf andere apparaten en kun je de toegang tot je account verliezen. Claim je account nu om het te beveiligen.';

  @override
  String get addFriendUsernameOnlyHint => 'Gebruikersnaam';

  @override
  String get registerTitle => 'Account aanmaken';

  @override
  String get registerDisplayName => 'Weergavenaam (optioneel)';

  @override
  String get registerDisplayNameHint => 'Hoe moeten mensen je noemen?';

  @override
  String get registerUsername => 'Gebruikersnaam (optioneel)';

  @override
  String get registerUsernameHint =>
      'Laat leeg voor een willekeurige gebruikersnaam';

  @override
  String get registerUsernameTagHint =>
      'Er wordt automatisch een 4-cijferige tag toegevoegd om uniciteit te garanderen';

  @override
  String get registerDateOfBirth => 'Geboortedatum';

  @override
  String get registerMonth => 'Maand';

  @override
  String get registerDay => 'Dag';

  @override
  String get registerYear => 'Jaar';

  @override
  String get registerConsentPrefix => 'Ik ga akkoord met de ';

  @override
  String get registerConsentTerms => 'Gebruiksvoorwaarden';

  @override
  String get registerConsentAnd => ' en ';

  @override
  String get registerConsentPrivacy => 'Privacybeleid';

  @override
  String get registerConfirmPassword => 'Wachtwoord bevestigen';

  @override
  String get registerSubmit => 'Account aanmaken';

  @override
  String get registerHaveAccount => 'Heb je al een account? ';

  @override
  String get registerPendingApproval =>
      'Je accountaanvraag wacht op goedkeuring. Je kunt inloggen nadat een beheerder deze heeft goedgekeurd.';

  @override
  String get registerClosed =>
      'Registratie is momenteel gesloten. Gebruik een registratielink van een beheerder om een account aan te maken.';

  @override
  String get passkeyNoCredentials =>
      'Geen toegangssleutels gevonden voor deze app. Log in in plaats daarvan met e-mail en wachtwoord.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys worden niet ondersteund op dit apparaat.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys zijn niet geconfigureerd voor deze app. Log in met e-mail en wachtwoord in plaats daarvan.';

  @override
  String get passkeyTimeout =>
      'Authenticatie met de passkey is verlopen. Probeer het opnieuw.';

  @override
  String get passkeyFailed =>
      'Authenticatie met de passkey is mislukt. Probeer het opnieuw.';

  @override
  String get errorUnableToCreateAccount =>
      'Kon account niet aanmaken. Probeer het opnieuw.';

  @override
  String get errorUnableToSignIn =>
      'Kan nu niet aanmelden. Probeer het opnieuw.';

  @override
  String get errorServiceUnavailable =>
      'Dit exemplaar is tijdelijk niet beschikbaar. Probeer het over een moment opnieuw.';

  @override
  String get errorInvalidEmailOrPassword => 'Ongeldige e-mail of wachtwoord.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Ongeldige gebruikersnaam of wachtwoord.';

  @override
  String get errorUnableToSendResetLink =>
      'Kon het reset-e-mailadres niet verzenden. Probeer het opnieuw.';

  @override
  String get errorUnableToResetPassword =>
      'Kan wachtwoord niet opnieuw instellen. Probeer het opnieuw.';

  @override
  String get embedInviteJoin => 'Word lid van community';

  @override
  String get embedInviteGoTo => 'Ga naar community';

  @override
  String embedInviteOnline(String count) {
    return '$count online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count leden';
  }

  @override
  String get embedInviteUnknownTitle => 'Onbekende uitnodiging';

  @override
  String get embedInviteUnknownSubtitle =>
      'Probeer een nieuwe uitnodiging aan te vragen.';

  @override
  String get embedInviteUnavailable => 'Uitnodiging niet beschikbaar';

  @override
  String get embedInviteJoinGroup => 'Word lid van groep';

  @override
  String get embedInviteAlreadyJoined => 'Al lid';

  @override
  String get embedInviteDisabled => 'Uitnodigingen uitgeschakeld';

  @override
  String get embedInvitePaused =>
      'Uitnodigingen zijn gepauzeerd voor deze community.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName heeft een mogelijke raid gedetecteerd, dus nieuwe gebruikers kunnen nu niet deelnemen.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Deze community heeft uitnodigingen gepauzeerd. Je kunt het later opnieuw proberen.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName heeft een mogelijke raid gedetecteerd in deze community. Uitnodigingen zijn gepauzeerd, dus nieuwe gebruikers kunnen nu niet deelnemen.';
  }

  @override
  String get inviteAcceptTitle => 'Je bent uitgenodigd om deel te nemen';

  @override
  String get inviteAcceptJoinButton => 'Word lid van community';

  @override
  String get inviteAcceptGoToButton => 'Ga naar community';

  @override
  String get inviteAcceptInvitesPaused => 'Uitnodigingen gepauzeerd';

  @override
  String get inviteAcceptNotFoundTitle => 'Uitnodiging ongeldig';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Deze uitnodiging is mogelijk verlopen of ongeldig.';

  @override
  String get invalidDeepLinkTitle => 'Link kon niet worden geopend';

  @override
  String get invalidDeepLinkDescription =>
      'Deze link is mogelijk ongeldig, alleen beschikbaar op het web, of je hebt er geen toegang toe. Controleer de link en probeer het opnieuw.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Ga naar startpagina';

  @override
  String get inviteAcceptJoinGroupButton => 'Word lid van groep';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Je bent uitgenodigd voor een groeps-DM door $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'iemand';

  @override
  String get mentionUnknownChannel => 'onbekend-kanaal';

  @override
  String get channelAccessDeniedTitle => 'Toegang tot kanaal geweigerd';

  @override
  String get channelAccessDeniedDescription =>
      'Je hebt geen toegang tot het kanaal waar dit bericht is verzonden.';

  @override
  String get messageJumpLinkNoAccess => 'Geen toegang';

  @override
  String get okay => 'Oké';

  @override
  String get embedThemeTitle => 'Gedeeld thema';

  @override
  String get embedThemeWebOnly =>
      'Je kunt thema\'s alleen op het web of de desktop importeren.';

  @override
  String get embedThemeImport => 'Thema importeren';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionair (lifetime $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen $productName',
      one: '1 dag $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weken $productName',
      one: '1 week $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count maanden $productName',
      one: '1 maand $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jaar $productName',
      one: '1 jaar $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Van $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Klik om je cadeau in te wisselen!';

  @override
  String get embedGiftAlreadyRedeemed => 'Al ingewisseld';

  @override
  String get embedGiftClaimAccountHelp =>
      'Voltooi de registratie van je account om dit cadeau in te wisselen.';

  @override
  String get embedGiftClaim => 'Cadeau inwisselen';

  @override
  String get embedGiftClaimed => 'Cadeau ingewisseld';

  @override
  String get embedGiftClaimAccount => 'Registratie voltooien om in te wisselen';

  @override
  String get embedGiftUnknownTitle => 'Onbekend cadeau';

  @override
  String get embedGiftUnknownSubtitle =>
      'Deze cadeaucode is ongeldig of al ingewisseld.';

  @override
  String get embedGiftUnavailable => 'Cadeau niet beschikbaar';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Claim je cadeau om je $productName-abonnement te activeren!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Dit cadeau is al ingewisseld.';

  @override
  String get giftAcceptMaybeLater => 'Misschien later';

  @override
  String get giftRedeemedToast => 'Cadeau ingewisseld!';

  @override
  String get giftRedeemInvalidTitle => 'Ongeldige cadeaucode';

  @override
  String get giftRedeemInvalidMessage =>
      'Deze code is ongeldig of al gebruikt.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Cadeau al ingewisseld';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Deze code is al ingewisseld.';

  @override
  String get giftRedeemNotFoundTitle => 'Cadeau niet gevonden';

  @override
  String get giftRedeemNotFoundMessage => 'Deze code bestaat niet.';

  @override
  String get giftRedeemFailedTitle => 'Inwisselen van cadeau mislukt';

  @override
  String get giftRedeemFailedMessage =>
      'Dit cadeau kon niet worden ingewisseld. Probeer het opnieuw.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Dit cadeau kan niet worden ingewisseld';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary-accounts kunnen geen Plutonium-cadeaus inwisselen. Kopieer de link om deze in plaats daarvan met een vriend te delen.';

  @override
  String get giftCopyLink => 'Cadeaulink kopiëren';

  @override
  String get privacySettings => 'Privacyinstellingen';

  @override
  String get privacyDirectMessages => 'Directe berichten';

  @override
  String get privacyDirectMessagesDescription =>
      'Directe berichten van andere leden in deze community toestaan';

  @override
  String get privacyBotDirectMessages => 'Directe berichten van bots';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Sta bots uit deze community toe om je directe berichten te sturen';

  @override
  String get privacyMutualDmsDisabled =>
      'De communitybeheerders hebben het ontvangen van directe berichten uitsluitend van wederzijdse leden in deze community uitgeschakeld.';

  @override
  String get communityDebug => 'Community debuggen';

  @override
  String get copiedToClipboard => 'Gekopieerd naar klembord';

  @override
  String get notificationSettings => 'Meldingsinstellingen';

  @override
  String notificationMuteGuild(String guildName) {
    return '$guildName dempen';
  }

  @override
  String get notificationMuteDescription =>
      'Door een community te dempen, voorkom je dat er ongelezen-indicatoren en meldingen verschijnen, tenzij je wordt vermeld';

  @override
  String get notificationCommunitySettings => 'Meldingsinstellingen community';

  @override
  String get notificationAllMessages => 'Alle berichten';

  @override
  String get notificationOnlyMentions => 'Alleen @vermeldingen';

  @override
  String get notificationNothing => 'Niets';

  @override
  String get notificationSuppressEveryone => 'Onderdruk @everyone en @here';

  @override
  String get notificationSuppressRoles => 'Alle rolvermeldingen onderdrukken';

  @override
  String get notificationMobilePush => 'Mobiele pushmeldingen';

  @override
  String get notificationOverrides => 'Afwijkende meldingsinstellingen';

  @override
  String get notificationSelectChannel => 'Kies een kanaal of categorie';

  @override
  String get notificationOnlyAtMentions => 'Alleen @vermeldingen';

  @override
  String get notificationMuteChannel => 'Kanaal dempen';

  @override
  String get notificationUnmuteChannel => 'Dempen van kanaal opheffen';

  @override
  String get notificationUseCategoryDefault =>
      'Standaardinstelling categorie gebruiken';

  @override
  String get notificationUseCommunityDefault =>
      'Gebruik standaard van community';

  @override
  String get notificationNoCategory => 'Geen categorie';

  @override
  String get dmMarkAsRead => 'Markeren als gelezen';

  @override
  String get dmMuteConversation => 'DM dempen';

  @override
  String get dmUnmuteConversation => 'Dempen van DM opheffen';

  @override
  String get dmPinDm => 'DM vastzetten';

  @override
  String get dmUnpinDm => 'DM losmaken';

  @override
  String get dmAlwaysShowInSidebar => 'Altijd weergeven in zijbalk';

  @override
  String get dmRemoveFromAlwaysShown => 'Verwijderen uit Altijd weergeven';

  @override
  String get dmCloseDm => 'DM sluiten';

  @override
  String get dmCloseDmConfirmTitle => 'DM sluiten';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Weet je zeker dat je je DM met $username wilt sluiten? Je kunt deze altijd later weer openen.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Je berichten in dit gesprek verwijderen?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Hiermee worden alle berichten die je ooit in dit gesprek hebt verzonden permanent verwijderd. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get dmCopyChannelId => 'Kanaal-ID kopiëren';

  @override
  String get dmChannelIdCopied => 'Kanaal-ID gekopieerd';

  @override
  String get dmCopyUserId => 'Gebruikers-ID kopiëren';

  @override
  String get dmUserIdCopied => 'Gebruikers-ID gekopieerd';

  @override
  String get dmViewProfile => 'Profiel bekijken';

  @override
  String get dmVoiceCall => 'Start spraakoproep';

  @override
  String get incomingVoiceCallTitle => 'Inkomende spraakoproep';

  @override
  String get incomingVoiceCallAccept => 'Accepteren';

  @override
  String get incomingVoiceCallDecline => 'Weigeren';

  @override
  String get incomingVoiceCallLabel => 'Inkomende oproep';

  @override
  String get incomingVoiceCallIgnore => 'Negeren';

  @override
  String get directVoiceCallNotEligible =>
      'Dit gesprek kan nu niet gestart worden. Probeer het zo meteen opnieuw.';

  @override
  String get voiceJoinCallFailed =>
      'Kon geen verbinding maken met dit gesprek. Controleer je verbinding en probeer het opnieuw.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Kon deze oproep niet joinen. Controleer je verbinding en probeer het opnieuw.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Kon de server niet informeren over dit gesprek. Controleer je verbinding en probeer het opnieuw.';

  @override
  String get dmAddNote => 'Notitie toevoegen';

  @override
  String get dmEditGroup => 'Groep bewerken';

  @override
  String get dmInviteToCommunity => 'Uitnodigen voor community';

  @override
  String get dmBlock => 'Blokkeren';

  @override
  String get dmLeaveGroup => 'Groep verlaten';

  @override
  String dmInviteSentFor(String communityName) {
    return 'Uitnodiging voor $communityName verzonden';
  }

  @override
  String get dmInviteSendFailed =>
      'Kon uitnodiging niet versturen. Probeer opnieuw.';

  @override
  String dmGroupMemberCount(int count) {
    return '$count leden';
  }

  @override
  String get dmMuteFor15Min => 'Voor 15 minuten';

  @override
  String get dmMuteFor30Min => 'Voor 30 minuten';

  @override
  String get dmMuteFor1Hour => 'Voor 1 uur';

  @override
  String get dmMuteFor3Hours => 'Voor 3 uur';

  @override
  String get dmMuteFor4Hours => 'Voor 4 uur';

  @override
  String get dmMuteFor8Hours => 'Voor 8 uur';

  @override
  String get dmMuteFor24Hours => 'Voor 24 uur';

  @override
  String get dmMuteFor3Days => 'Voor 3 dagen';

  @override
  String get dmMuteForever => 'Tot ik het weer aanzet';

  @override
  String get dmPinGroupDm => 'Groeps-DM vastzetten';

  @override
  String get dmUnpinGroupDm => 'Groeps-DM losmaken';

  @override
  String get dmUnnamedGroup => 'Naamloze groep';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Groep van $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'DM toevoegen aan favorieten';

  @override
  String get dmUnfavoriteDm => 'DM uit favorieten verwijderen';

  @override
  String get dmFavoriteGroupDm => 'Groeps-DM toevoegen aan favorieten';

  @override
  String get dmUnfavoriteGroupDm => 'Groeps-DM uit favorieten verwijderen';

  @override
  String get dmChangeFriendNickname => 'Bijnaam van vriend wijzigen';

  @override
  String get dmRemoveFriend => 'Vriend verwijderen';

  @override
  String get dmAddFriend => 'Vriend toevoegen';

  @override
  String get dmAcceptFriendRequest => 'Vriendschapsverzoek accepteren';

  @override
  String get dmIgnoreFriendRequest => 'Vriendschapsverzoek negeren';

  @override
  String get dmFriendRequestSent => 'Vriendschapsverzoek verzonden';

  @override
  String get dmUnblock => 'Deblokkeren';

  @override
  String get dmDebugUser => 'Gebruiker debuggen';

  @override
  String get dmDebugChannel => 'Kanaal debuggen';

  @override
  String get dmDebugCategory => 'Debug categorie';

  @override
  String get dmPinned => 'Vastgezet DM-gesprek';

  @override
  String get dmUnpinned => 'DM losgemaakt';

  @override
  String get dmMuted => 'Gedempte DM';

  @override
  String get dmUnmuted => 'DM gedempt';

  @override
  String get dmRemoveFriendConfirmTitle => 'Vriend verwijderen';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Weet je zeker dat je $username als vriend wilt verwijderen?';
  }

  @override
  String get dmBlockConfirmTitle => 'Gebruiker blokkeren';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Weet je zeker dat je $username wilt blokkeren? Diegene kan je geen berichten meer sturen of vriendschapsverzoeken doen.';
  }

  @override
  String get dmFriendRequestSentToast => 'Vriendschapsverzoek verzonden';

  @override
  String get dmFriendRequestFailed => 'Kon geen vriendschapsverzoek verzenden';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Kon vriendschapsverzoek niet accepteren';

  @override
  String get dmRemoveFriendFailed => 'Kon vriend niet verwijderen';

  @override
  String get dmBlockFailed => 'Blokkeren van gebruiker mislukt';

  @override
  String get dmUnblockFailed => 'Kon gebruiker niet deblokkeren';

  @override
  String get dmIgnoreFriendRequestFailed => 'Kon vriendenverzoek niet negeren';

  @override
  String get dmAddFriends => 'Vrienden toevoegen';

  @override
  String get addFriendSheetTitle => 'Vriend toevoegen';

  @override
  String get addFriendUsernameHint => 'Gebruikersnaam#0000';

  @override
  String get addFriendUsernameLabel => 'Gebruikersnaam van vriend';

  @override
  String get addFriendSendRequest => 'Verzoek verzenden';

  @override
  String get addFriendNoUserFound =>
      'Geen gebruiker gevonden met die gebruikersnaam.';

  @override
  String get addFriendInvalidUsername =>
      'Voer een geldige gebruikersnaam in (Gebruikersnaam#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Vriendschapsverzoek verzonden';

  @override
  String get addFriendClaimTitle => 'Voltooi de registratie van je account';

  @override
  String get addFriendClaimDescription =>
      'Voltooi de registratie van je account om vriendschapsverzoeken te versturen.';

  @override
  String get addFriendVerifyTitle => 'Verifieer je e-mailadres';

  @override
  String get addFriendVerifyDescription =>
      'Je moet je e-mailadres verifiëren voordat je vriendschapsverzoeken kunt versturen.';

  @override
  String get addFriendVerifyEmail => 'E-mailadres verifiëren';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Binnenkomende vriendschapsverzoeken ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Uitgaande vriendschapsverzoeken ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Inkomend vriendschapsverzoek';

  @override
  String get addFriendOutgoingStatus => 'Vriendschapsverzoek verzonden';

  @override
  String get addFriendViewProfile => 'Profiel bekijken';

  @override
  String get addFriendAccept => 'Accepteren';

  @override
  String get addFriendIgnore => 'Negeren';

  @override
  String get addFriendAcceptTitle => 'Vriendschapsverzoek accepteren';

  @override
  String get addFriendIgnoreTitle => 'Vriendschapsverzoek negeren';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Vriendschapsverzoek van $userName accepteren?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Vriendschapsverzoek van $displayName negeren?';
  }

  @override
  String get addFriendCancelRequest => 'Verzoek annuleren';

  @override
  String get addFriendCancelRequestFailed =>
      'Vriendschapsverzoek kon niet worden geannuleerd. Probeer het opnieuw.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Deze gebruiker accepteert momenteel geen vriendschapsverzoeken.';

  @override
  String get addFriendUnblockFirst =>
      'Deblokkeer diegene eerst om een vriendschapsverzoek te sturen.';

  @override
  String get addFriendCannotSendToSelf =>
      'Je kunt jezelf geen vriendschapsverzoek sturen.';

  @override
  String get addFriendAlreadyFriends =>
      'Je bent al vrienden met deze gebruiker.';

  @override
  String get addFriendClaimToSend =>
      'Voltooi je registratie om vriendschapsverzoeken te versturen.';

  @override
  String get addFriendVerifyToSend =>
      'Verifieer je e-mailadres voordat je vriendschapsverzoeken verstuurt.';

  @override
  String get addFriendFriendsListFull =>
      'Je vriendenlijst is vol, of die van de ander. Verwijder iemand en probeer het opnieuw.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Systeem';

  @override
  String get emojiSearchPlaceholder => 'Vind de emoji van je dromen';

  @override
  String get emojiSearchEmpty =>
      'Geen emoji\'s komen overeen met je zoekopdracht';

  @override
  String get emojiAutocompleteDefaultLabel => 'Standaardemoji';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Dit is een standaardemoji op $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Deze emoji komt uit deze community. Je kunt hem overal gebruiken.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Dit is een aangepaste emoji uit een community.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Dit is een aangepaste emoji uit een community. Vraag de auteur om een uitnodiging om deze emoji te gebruiken.';

  @override
  String get emojiInfoFromHeader => 'Deze emoji is van';

  @override
  String get emojiInfoDiscoverableCommunity => 'Vindbare community';

  @override
  String get emojiInfoPrivateCommunity => 'Privécommunity';

  @override
  String get emojiInfoVerifiedCommunity => 'Geverifieerde community';

  @override
  String get emojiInfoAddToFavorites => 'Toevoegen aan favorieten';

  @override
  String get emojiInfoRemoveFromFavorites => 'Verwijderen uit favorieten';

  @override
  String get emojiFrequentlyUsed => 'Veelgebruikt';

  @override
  String get emojiTabGifs => 'GIF\'s';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Stickers';

  @override
  String get emojiTabEmojis => 'Emoji\'s';

  @override
  String get gifPickerSearch => 'Zoek GIF\'s';

  @override
  String get gifPickerSearchKlipy => 'Zoek KLIPY';

  @override
  String get gifPickerSearchTenor => 'Zoek op Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favorieten';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Nog geen favoriete GIF\'s';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Ster een GIF om hem hier te zien.';

  @override
  String get gifPickerTrending => 'Trending GIF\'s';

  @override
  String get gifPickerNoResultsTitle => 'Geen zoekresultaten';

  @override
  String get gifPickerNoResultsDescription => 'Probeer een andere zoekterm';

  @override
  String get gifPickerLoadFailedTitle => 'GIF\'s konden niet worden geladen';

  @override
  String get gifPickerLoadFailedBody =>
      'Controleer je verbinding en probeer het opnieuw.';

  @override
  String get emojiCategoryPeople => 'Mensen';

  @override
  String get emojiCategoryNature => 'Natuur';

  @override
  String get emojiCategoryFood => 'Eten en drinken';

  @override
  String get emojiCategoryActivity => 'Activiteiten';

  @override
  String get emojiCategoryTravel => 'Reizen en plaatsen';

  @override
  String get emojiCategoryObjects => 'Objecten';

  @override
  String get emojiCategorySymbols => 'Symbolen';

  @override
  String get emojiCategoryFlags => 'Vlaggen';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Ontgrendel $emojiCount uit $communityCount met Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellDismiss => 'Niet meer tonen';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aangepaste emoji\'s',
      one: '1 aangepaste emoji',
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
  String get externalLinkWarningTitle => 'Waarschuwing externe link';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Je staat op het punt om $productName te verlaten';
  }

  @override
  String get externalLinkWarningDescription =>
      'Externe links kunnen gevaarlijk zijn. Wees voorzichtig.';

  @override
  String get externalLinkWarningDestinationUrl => 'Bestemmings-URL:';

  @override
  String get externalLinksSectionTitle => 'Externe links';

  @override
  String get externalLinksSectionDescription =>
      'Configureer hoe waarschuwingen voor externe links worden afgehandeld.';

  @override
  String get externalLinkWarningTrustPrefix => 'Vertrouw altijd ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — sla deze waarschuwing de volgende keer over';

  @override
  String get externalLinkVisitSite => 'Site bezoeken';

  @override
  String get externalLinkTrustAllLabel => 'Alle externe links vertrouwen';

  @override
  String get externalLinkStripTrackingLabel =>
      'Trackingparameters uit URL\'s verwijderen';

  @override
  String get externalLinkStripTrackingDescription =>
      'Verwijder automatisch trackingparameters (zoals utm_source, fbclid, gclid) uit URL\'s in berichten die je verzendt. De link wordt opgeschoond voordat deze iemand anders bereikt.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Alle externe links vertrouwen?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Hiermee worden alle externe links vertrouwd en wordt de waarschuwing voor elk domein overgeslagen. Je bestaande vertrouwde domeinen worden vervangen. Dit is minder veilig.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Alles vertrouwen';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Alle links niet meer vertrouwen?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Waarschuwingen voor externe links worden opnieuw weergegeven. Je moet vertrouwde domeinen afzonderlijk toevoegen.';

  @override
  String get externalLinkStopTrustingAllAction =>
      '\"Alles vertrouwen\" uitschakelen';

  @override
  String get externalLinkTrustedAllDescription =>
      'Alle externe links worden vertrouwd. Er worden geen waarschuwingen getoond.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Je hebt $count vertrouwde domein(en). Voeg meer toe door het vakje aan te vinken wanneer je externe links bezoekt.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Wanneer ingeschakeld, worden er geen waarschuwingen voor externe links getoond. Dit is minder veilig.';

  @override
  String get imageFileTooLarge =>
      'Bestand te groot. Kies een bestand van minder dan 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Geanimeerde avatars vereisen Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Geanimeerde banners vereisen Plutonium';

  @override
  String get animatedAvifNotSupported => 'Geanimeerde AVIF niet ondersteund';

  @override
  String get animatedAvifNotSupportedBody =>
      'Het bijsnijden en roteren van geanimeerde AVIF-bestanden wordt nog niet ondersteund. Als je doorgaat, wordt het bestand in de originele vorm geüpload.';

  @override
  String get uploadAsIs => 'Uploaden zoals het is';

  @override
  String get croppingAnimatedNotSupported =>
      'Het bijsnijden van geanimeerde afbeeldingen wordt nog niet ondersteund. De originele upload wordt gebruikt.';

  @override
  String get cropAvatar => 'Avatar bijsnijden';

  @override
  String get cropBanner => 'Banner bijsnijden';

  @override
  String get skip => 'Overslaan';

  @override
  String get crop => 'Bijsnijden';

  @override
  String get cropTouchHint => 'Knijp om te zoomen, sleep om te verplaatsen';

  @override
  String get cropMouseHint =>
      'Sleep de hoeken om te vergroten of te verkleinen, sleep binnen het kader om te verplaatsen';

  @override
  String get changeYourFluxerTag => 'Gebruikersnaam wijzigen';

  @override
  String get fluxerTagDescriptionBase =>
      'Gebruikersnamen mogen alleen letters (a-z, A-Z), cijfers (0-9) en underscores bevatten. Gebruikersnamen zijn niet hoofdlettergevoelig.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Gebruikersnamen mogen alleen letters (a-z, A-Z), cijfers (0-9) en underscores bevatten. Gebruikersnamen zijn hoofdletterongevoelig. Je kunt elke beschikbare 4-cijferige tag kiezen van #0000 tot #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Gebruikersnamen mogen alleen letters (a-z, A-Z), cijfers (0-9) en underscores bevatten. Gebruikersnamen zijn hoofdletterongevoelig. Je kunt elke beschikbare 4-cijferige tag kiezen van #0001 tot #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Tussen $min en $max tekens';
  }

  @override
  String get validationAllowedChars =>
      'Alleen letters (a-z, A-Z), cijfers (0-9) en underscores (_)';

  @override
  String get fluxerTagAlreadyTaken => 'Gebruikersnaam is al in gebruik';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'De gebruikersnaam $username#$discriminator is al in gebruik. Als je doorgaat, wordt je discriminator automatisch opnieuw gegenereerd.';
  }

  @override
  String get customTagIsTemporary => 'Aangepaste tag is tijdelijk';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Je aangepaste 4-cijferige tag is alleen beschikbaar zolang je Plutonium-abonnement actief is. Wanneer je abonnement afloopt op $date, wordt je tag na een respijtperiode van 3 dagen teruggezet naar een willekeurig toegewezen nummer.';
  }

  @override
  String get customTagTemporaryBody =>
      'Je aangepaste 4-cijferige tag is alleen beschikbaar zolang je Plutonium-abonnement actief is. Wanneer je abonnement verloopt, wordt je tag na een respijtperiode van 3 dagen teruggezet naar een willekeurig toegewezen nummer.';

  @override
  String get iUnderstandContinue => 'Ik begrijp het, ga door';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Als je deze gebruikersnaam opslaat, wordt je aangepaste 4-cijferige tag een willekeurig nummer wanneer je Plutonium-abonnement eindigt. Als je abonnement niet wordt verlengd, heb je een respijtperiode van 3 dagen voordat de tag verandert.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Je aangepaste 4-cijferige tag (#$discriminator) is actief zolang je Plutonium-abonnement actief is. Als je abonnement eindigt of na een respijtperiode van 3 dagen niet wordt verlengd, wordt je tag teruggezet naar een willekeurig nummer.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Pas je 4-cijferige tag aan of behoud deze bij het wijzigen van je gebruikersnaam';

  @override
  String get fluxerTagUpdated => 'Gebruikersnaam bijgewerkt';

  @override
  String get fluxerTagUpdateFailed =>
      'Kon gebruikersnaam niet bijwerken. Probeer het opnieuw.';

  @override
  String get continueAction => 'Doorgaan';

  @override
  String get profileCustomizationTitle => 'Profiel aanpassen';

  @override
  String get profileCustomizationDescription =>
      'Bewerk je profielweergave en zie een live voorbeeld';

  @override
  String get usernameLabel => 'Gebruikersnaam';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Voltooi de registratie van je account om je gebruikersnaam te wijzigen';

  @override
  String get changeFluxerTag => 'Gebruikersnaam wijzigen';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Pas je 4-cijferige tag (#$discriminator) naar wens aan met Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Wijzig je gebruikersnaam en 4-cijferige tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Je aangepaste tag (#$discriminator) is gekoppeld aan je Plutonium-abonnement en wordt een willekeurige tag als deze verloopt.';
  }

  @override
  String get displayNameLabel => 'Weergavenaam';

  @override
  String get pronounsLabel => 'Voornaamwoorden';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Avatar wijzigen';

  @override
  String get removeAvatar => 'Avatar verwijderen';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max. 10 MB. Aanbevolen: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Banner wijzigen';

  @override
  String get removeBanner => 'Banner verwijderen';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max. 10 MB. Minimaal: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Accentkleur';

  @override
  String get accentColorDescription =>
      'Hiermee pas je de kleur van de rand en de banner op je profiel aan';

  @override
  String get aboutMeLabel => 'Over mij';

  @override
  String get aboutMeHelperText => 'Je kunt links, emoji en Markdown gebruiken.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium-badgeprivacy';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Bepaal hoe je Plutonium-badge wordt weergegeven aan anderen';

  @override
  String get hidePlutoniumBadgeLabel => 'Verberg Plutonium-badge volledig';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Verberg je Plutonium-badge volledig voor andere gebruikers';

  @override
  String get hidePlutoniumPurchaseDate => 'Verberg Plutonium-aankoopdatum';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Verberg Plutonium-aankoopdatum ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Verwijder wanneer je Plutonium voor het eerst hebt gekocht uit je badge';

  @override
  String get maskVisionaryAsSubscription =>
      'Visionary weergeven als abonnement';

  @override
  String get maskVisionaryDescription =>
      'Toon je Visionary als een normaal abonnement';

  @override
  String get hideVisionaryIdBadge => 'Visionary ID-badge verbergen';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Verberg Visionary ID-badge (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Verwijder je Visionary ID-badge';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max. 10 MB. Aanbevolen: 512×512px. Geanimeerde avatars (GIF) vereisen Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Pas je profiel aan met een statische of geanimeerde banner om het te laten opvallen.';

  @override
  String get getPlutonium => 'Plutonium ophalen';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'In-app aankopen zijn nog niet beschikbaar op dit platform. Houd ons in de gaten — binnenkort beschikbaar!';

  @override
  String get profilePreviewLabel => 'Voorbeeld';

  @override
  String get profilePreviewMessage => 'Bericht';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Lid van $productName sinds';
  }

  @override
  String get unclaimedAccountTitle => 'Account met onvoltooide registratie';

  @override
  String get unclaimedAccountDescription =>
      'Uw account is nog niet geclaimd. Zonder e-mailadres en wachtwoord kunt u de toegang verliezen. Claim uw account nu om het te beveiligen.';

  @override
  String get claimAccount => 'Registratie voltooien';

  @override
  String get profileTypeLabel => 'Profieltype';

  @override
  String get profileTypeGlobal => 'Algemeen profiel';

  @override
  String get profileTypeGuildDescription =>
      'Je bewerkt je profiel voor deze community. Dit profiel is alleen zichtbaar in deze community en overschrijft je algemene profiel.';

  @override
  String get communityNicknameLabel => 'Communitybijnaam';

  @override
  String get perGuildPremiumUpsellText =>
      'Het aanpassen van je avatar, banner, accentkleur en bio voor individuele communities vereist Plutonium. Community-bijnaam en voornaamwoorden zijn gratis voor iedereen.';

  @override
  String get avatarModeInherit => 'Algemeen profiel gebruiken';

  @override
  String get avatarModeCustom => 'Aangepaste afbeelding gebruiken';

  @override
  String get avatarModeUnset => 'Niet tonen';

  @override
  String get profileSavedToast => 'Profiel bijgewerkt';

  @override
  String get sudoTitle => 'Verifieer je identiteit';

  @override
  String get sudoDescription =>
      'Deze actie vereist verificatie om door te gaan.';

  @override
  String get sudoAuthenticatorCode => 'Code uit authenticator-app';

  @override
  String get sudoMethodPassword => 'Wachtwoord';

  @override
  String get sudoMethodTotp => 'Authenticator';

  @override
  String get sudoVerificationFailed =>
      'Verificatie mislukt. Probeer het opnieuw.';

  @override
  String get securityAccountTitle => 'Account';

  @override
  String get securityAccountDescription =>
      'Beheer je e-mailadres, wachtwoord en accountinstellingen';

  @override
  String get securitySectionTitle => 'Beveiliging';

  @override
  String get securitySectionDescription =>
      'Beveilig je account met tweefactorauthenticatie en passkeys';

  @override
  String get securityLoginEmailSectionTitle => 'E-mailinstellingen';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Beheer het e-mailadres waarmee je inlogt op $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'E-mailadres';

  @override
  String get securityLoginNoEmailSet => 'Geen e-mailadres ingesteld';

  @override
  String get securityLoginChangeEmail => 'E-mailadres wijzigen';

  @override
  String get securityLoginAddEmail => 'E-mailadres toevoegen';

  @override
  String get securityLoginReveal => 'Tonen';

  @override
  String get securityLoginHide => 'Verbergen';

  @override
  String get securityLoginPasswordSectionTitle => 'Wachtwoord';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Wijzig je wachtwoord om je account veilig te houden';

  @override
  String get securityLoginCurrentPasswordLabel => 'Huidig wachtwoord';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Laatst gewijzigd: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Laatst gewijzigd: Nooit';

  @override
  String get securityLoginNoPasswordSet => 'Geen wachtwoord ingesteld';

  @override
  String get securityLoginChangePassword => 'Wachtwoord wijzigen';

  @override
  String get securityLoginSetPassword => 'Wachtwoord instellen';

  @override
  String get passwordChangeTitle => 'Wachtwoord wijzigen';

  @override
  String get passwordChangeIntroDescription =>
      'We sturen een verificatiecode naar je e-mailadres om je identiteit te bevestigen voordat je je wachtwoord wijzigt.';

  @override
  String get passwordChangeStart => 'Starten';

  @override
  String get passwordChangeVerifyTitle => 'Verifieer je e-mailadres';

  @override
  String get passwordChangeVerifyDescription =>
      'Voer de verificatiecode in die naar je e-mailadres is verzonden.';

  @override
  String get passwordChangeVerificationCode => 'Verificatiecode';

  @override
  String get passwordChangeVerify => 'Verifiëren';

  @override
  String get passwordChangeNewPasswordTitle => 'Nieuw wachtwoord instellen';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Voer hieronder je nieuwe wachtwoord in.';

  @override
  String get passwordChangeNewPassword => 'Nieuw wachtwoord';

  @override
  String get passwordChangeConfirmPassword => 'Bevestig nieuw wachtwoord';

  @override
  String get passwordChangeSubmit => 'Wachtwoord wijzigen';

  @override
  String get passwordChangeSuccess => 'Wachtwoord gewijzigd';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Wachtwoorden komen niet overeen';

  @override
  String get passwordChangeInvalidCode => 'Ongeldige of verlopen code';

  @override
  String get emailChangeTitle => 'E-mailadres wijzigen';

  @override
  String get emailChangeIntroDescription =>
      'We sturen verificatiecodes om je identiteit te verifiëren voordat we je e-mailadres wijzigen.';

  @override
  String get emailChangeStart => 'Starten';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verifieer huidige e-mailadres';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Voer de verificatiecode in die naar uw huidige e-mailadres is verzonden.';

  @override
  String get emailChangeNewEmailTitle => 'Nieuw e-mailadres invoeren';

  @override
  String get emailChangeNewEmailDescription =>
      'Voer het nieuwe e-mailadres in dat je wilt gebruiken.';

  @override
  String get emailChangeNewEmailLabel => 'Nieuw e-mailadres';

  @override
  String get emailChangeNewEmailSubmit => 'Verificatiecode verzenden';

  @override
  String get emailChangeVerifyNewTitle => 'Verifieer nieuw e-mailadres';

  @override
  String get emailChangeVerifyNewDescription =>
      'Voer de verificatiecode in die naar je nieuwe e-mailadres is verzonden.';

  @override
  String get emailChangeSuccess => 'E-mailadres gewijzigd';

  @override
  String get emailChangeInvalidCode => 'Ongeldige of verlopen code';

  @override
  String get resend => 'Opnieuw verzenden';

  @override
  String resendCountdown(int seconds) {
    return 'Opnieuw verzenden (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verificatiecode';

  @override
  String get verify => 'Verifiëren';

  @override
  String get enable => 'Inschakelen';

  @override
  String get disable => 'Uitschakelen';

  @override
  String get delete => 'Verwijderen';

  @override
  String get save => 'Opslaan';

  @override
  String get securityTfaSectionTitle => 'Tweefactorauthenticatie';

  @override
  String get securityTfaSectionDescription =>
      'Voeg een extra beveiligingslaag toe aan je account';

  @override
  String get securityTfaAuthenticatorApp => 'Authenticatie-app';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Tweefactorauthenticatie is ingeschakeld';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Gebruik een authenticator-app om codes te genereren voor tweefactorauthenticatie';

  @override
  String get securityTfaBackupCodes => 'Back-upcodes';

  @override
  String get securityTfaBackupCodesDescription =>
      'Bekijk en beheer je back-upcodes voor accountherstel';

  @override
  String get securityTfaViewCodes => 'Codes bekijken';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Gebruik passkeys voor wachtwoordloos inloggen en twee-factor-authenticatie';

  @override
  String get securityPasskeysRegistered => 'Geregistreerde passkeys';

  @override
  String get securityPasskeysNone => 'Geen passkeys geregistreerd';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'wachtwoordcodes',
      one: 'wachtwoordcode',
    );
    return '$count $_temp0 geregistreerd (max. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Passkey toevoegen';

  @override
  String securityPasskeysAdded(String date) {
    return 'Toegevoegd: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Laatst gebruikt: $date';
  }

  @override
  String get securityPasskeysRename => 'Naam wijzigen';

  @override
  String get securityPasskeysDeleteTitle => 'Passkey verwijderen';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Weet je zeker dat je de beveiligingssleutel \"$name\" wilt verwijderen?';
  }

  @override
  String get securityPasskeyNameTitle => 'Passkey een naam geven';

  @override
  String get securityPasskeyNameLabel => 'Naam van passkey';

  @override
  String get securityPasskeyNameHint => 'bijv. YubiKey, iPhone, werkcomputer';

  @override
  String get securityClaimTitle => 'Beveiligingsfuncties';

  @override
  String get securityClaimDescription =>
      'Voltooi de registratie van je account om toegang te krijgen tot beveiligingsfuncties zoals tweestapsverificatie en passkeys.';

  @override
  String get securityVerifyEmailRequired =>
      'Je moet je e-mailadres verifiëren voordat je tweefactorauthenticatie of wachtwoorden kunt instellen.';

  @override
  String get totpEnableTitle => 'Authenticator-app instellen';

  @override
  String get totpEnableDescription =>
      'Scan de QR-code met je authenticatie-app om codes te genereren voor tweefactorauthenticatie.';

  @override
  String get totpEnableCodeLabel => 'Code';

  @override
  String get totpEnableCodeHint =>
      'Voer de 6-cijferige code uit je verificatie-app in';

  @override
  String get totpEnableSuccess => 'Twee-factorauthenticatie is ingeschakeld';

  @override
  String get totpDisableTitle => 'Authenticator-app verwijderen';

  @override
  String get totpDisableDescription =>
      'Voer de 6-cijferige code van je authenticatie-app in om tweefactorauthenticatie uit te schakelen.';

  @override
  String get totpDisableSuccess => 'Tweefactorauthenticatie uitgeschakeld';

  @override
  String get backupCodesTitle => 'Back-upcodes';

  @override
  String get backupCodesWarning =>
      'Als je de toegang tot je authenticatie-app verliest en deze codes niet hebt, wordt je account permanent vergrendeld. Download of kopieer ze nu en bewaar ze ergens veilig.';

  @override
  String get backupCodesCopy => 'Kopiëren';

  @override
  String get backupCodesCopied => 'Back-upcodes gekopieerd naar klembord';

  @override
  String get backupCodesAcknowledge =>
      'Ik heb mijn back-upcodes gedownload of gekopieerd en op een veilige plek bewaard.';

  @override
  String get backupCodesDone => 'Klaar';

  @override
  String get dangerZoneSectionTitle => 'Gevarenzone';

  @override
  String get dangerZoneSectionDescription =>
      'Onomkeerbare en destructieve acties';

  @override
  String get dangerZoneDisableTitle => 'Account uitschakelen';

  @override
  String get dangerZoneDisableDescription =>
      'Je account tijdelijk uitschakelen. Je kunt het later opnieuw activeren door weer in te loggen.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Uw account uitschakelen logt u uit bij alle sessies. U kunt uw account op elk moment opnieuw inschakelen door opnieuw in te loggen.';

  @override
  String get dangerZoneDeleteTitle => 'Account verwijderen';

  @override
  String get dangerZoneDeleteDescription =>
      'Verwijder je account en alle bijbehorende gegevens permanent. Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Annuleer je actieve Plutonium-abonnement in de Plutonium-instellingen voordat je je account verwijdert.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Account kan niet worden verwijderd';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Je kunt je account niet verwijderen zolang je eigenaar bent van communities. Draag eerst het eigendom over van de volgende communities:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'en $count meer';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Om het eigendom over te dragen, ga naar $settingsPath en gebruik de optie \'eigendom overdragen\'.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Weet je zeker dat je je account wilt verwijderen? Hiermee wordt de definitieve verwijdering van je account ingepland.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Je kunt het verwijderingsproces binnen 14 dagen annuleren';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Na 14 dagen wordt je account permanent verwijderd';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Zodra de verwijdering is verwerkt, kun je geen toegang meer krijgen tot je account';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Verzonden berichten kunnen niet meer worden verwijderd nadat je account is verwijderd';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Als je je gegevens wilt exporteren of je berichten eerst wilt verwijderen, ga dan naar de sectie Privacy Dashboard in Gebruikersinstellingen voordat je verdergaat.';

  @override
  String get claimAccountTitle => 'Voltooi de registratie van je account';

  @override
  String get claimAccountDescription =>
      'Voltooi de registratie van je account door een e-mailadres en wachtwoord toe te voegen. We sturen een verificatiecode om je e-mailadres te bevestigen voordat de registratie wordt afgerond.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Wachtwoord';

  @override
  String get claimAccountSendCode => 'Code verzenden';

  @override
  String get claimAccountVerifyDescription =>
      'Voer de code in die we naar je e-mailadres hebben gestuurd om het te verifiëren. Je wachtwoord wordt ingesteld zodra de code is bevestigd.';

  @override
  String get claimAccountSuccess => 'Registratie van account voltooid';

  @override
  String get importantInformation => 'Belangrijke informatie:';

  @override
  String get genericError => 'Er is een fout opgetreden';

  @override
  String get networkErrorMessage => 'Er ging iets mis. Probeer het opnieuw.';

  @override
  String get invalidCode => 'Ongeldige code';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jaar geleden',
      one: '1 jaar geleden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count maanden geleden',
      one: '1 maand geleden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen geleden',
      one: '1 dag geleden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uur geleden',
      one: '1 uur geleden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuten geleden',
      one: '1 minuut geleden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weken geleden',
      one: '1 week geleden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'over $count minuten',
      one: 'over 1 minuut',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'over $count uur',
      one: 'over een uur',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'over $count dagen',
      one: 'over 1 dag',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'over $count weken',
      one: 'over 1 week',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'over $count maanden',
      one: 'over 1 maand',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'over $count jaar',
      one: 'over 1 jaar',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'net nu';

  @override
  String get authorizedAppsTitle => 'Geautoriseerde apps';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Deze applicaties hebben toegang gekregen tot je $productName-account.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Geen geautoriseerde apps';

  @override
  String get authorizedAppsEmptyDescription =>
      'Je hebt nog geen apps gemachtigd om toegang te krijgen tot je account.';

  @override
  String get authorizedAppsLoadError => 'Laden van geautoriseerde apps mislukt';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Geautoriseerd op $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Verleende machtigingen';

  @override
  String get authorizedAppsRevoke => 'Intrekken';

  @override
  String get authorizedAppsRevokeTitle => 'Toegang tot app intrekken';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Weet je zeker dat je de toegang voor $appName wilt intrekken? Deze applicatie heeft dan geen toegang meer tot je account.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Toegang tot je basisprofielinformatie (gebruikersnaam, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'Je e-mailadres bekijken';

  @override
  String get authorizedAppsScopeGuilds =>
      'Bekijk de communities waarvan je lid bent';

  @override
  String get authorizedAppsScopeConnections => 'Bekijk je gekoppelde accounts';

  @override
  String get authorizedAppsScopeBot =>
      'Voeg een bot toe aan een community met de gevraagde machtigingen';

  @override
  String get authorizedAppsScopeAdmin =>
      'Toegang tot administratieve eindpunten';

  @override
  String get applicationsTitle => 'Applicaties';

  @override
  String get applicationsCreate => 'Applicatie aanmaken';

  @override
  String get applicationsCreateSubmit => 'Maken';

  @override
  String get applicationsCreateClaimTooltip =>
      'Voltooi de registratie van je account om applicaties aan te maken.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Lees de documentatie ($domain)';
  }

  @override
  String get applicationsLoadError => 'Kan apps niet laden';

  @override
  String get applicationsLoadErrorDescription =>
      'Controleer je verbinding en probeer het opnieuw.';

  @override
  String get applicationsEmptyTitle => 'Nog geen apps';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Maak je eerste applicatie aan om aan de slag te gaan met de $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Gemaakt op $date';
  }

  @override
  String get applicationsName => 'Naam van de applicatie';

  @override
  String get applicationsNameHint => 'Mijn app';

  @override
  String get applicationsNameRequired => 'Applicatienaam is vereist';

  @override
  String get applicationsBackToList => 'Terug naar lijst';

  @override
  String get applicationsDetailLoadError =>
      'Deze applicatie kon niet worden geladen';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Probeer het opnieuw of ga terug naar de lijst met apps.';

  @override
  String get applicationsId => 'Applicatie-ID';

  @override
  String get applicationsCopyId => 'ID kopiëren';

  @override
  String get applicationsSecretsTitle => 'Geheimen en tokens';

  @override
  String get applicationsSecretsDescription =>
      'Bewaar deze goed. Als je ze opnieuw genereert, werken bestaande integraties niet meer.';

  @override
  String get applicationsClientSecret => 'Clientgeheim';

  @override
  String get applicationsBotToken => 'Bottoken';

  @override
  String get applicationsRegenerate => 'Opnieuw genereren';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Clientgeheim opnieuw genereren?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Bottoken opnieuw genereren?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Als je een nieuw clientgeheim genereert, wordt het huidige ongeldig. Werk alle code bij die de oude waarde gebruikt.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Als je dit opnieuw genereert, wordt de huidige token ongeldig. Werk alle code bij die de oude waarde gebruikt.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Clientgeheim opnieuw gegenereerd. Werk alle code bij die het oude geheim gebruikt.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Bottoken opnieuw gegenereerd. Werk alle code bij die het oude token gebruikt.';

  @override
  String get applicationsRegenerateFailed =>
      'Geheim kon niet opnieuw worden gegenereerd';

  @override
  String get applicationsInfoTitle => 'Appinformatie';

  @override
  String get applicationsInfoDescription =>
      'Basisinstellingen en toegestane omleidings-URI\'s.';

  @override
  String get applicationsPublicBot => 'Openbare bot';

  @override
  String get applicationsPublicBotDescription =>
      'Sta iedereen toe om deze bot voor eigen communities uit te nodigen.';

  @override
  String get applicationsRequireCodeGrant => 'OAuth2-codetoekenning vereisen';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Vereist een omleidings-URI en een autorisatiecode bij het uitnodigen van deze bot.';

  @override
  String get applicationsRedirectUris => 'Omleidings-URI\'s';

  @override
  String get applicationsAddRedirect => 'Omleiding toevoegen';

  @override
  String get applicationsDeleteRedirect => 'Omleidings-URI verwijderen';

  @override
  String get applicationsBotProfileTitle => 'Botprofiel';

  @override
  String get applicationsBotProfileDescription =>
      'Avatar, tag en uitgebreide profielgegevens voor je bot.';

  @override
  String get applicationsBotAvatar => 'Botavatar';

  @override
  String get applicationsUsernameRequired => 'Gebruikersnaam is vereist';

  @override
  String get applicationsUsernameTooLong =>
      'Gebruikersnaam mag maximaal 32 tekens lang zijn';

  @override
  String get applicationsUsernameInvalid =>
      'Gebruikersnaam mag alleen letters, cijfers en underscores bevatten';

  @override
  String get applicationsBotUsername => 'Botgebruikersnaam';

  @override
  String get applicationsDiscriminator => 'Discriminator';

  @override
  String get applicationsBotBio => 'Botbio';

  @override
  String get applicationsBotBioHint =>
      'Een behulpzame bot die geweldige dingen doet!';

  @override
  String get applicationsNoBotBanner => 'Geen botbanner';

  @override
  String get applicationsFriendlyBot => 'Vriendelijke bot';

  @override
  String get applicationsFriendlyBotDescription =>
      'Gebruikers toestaan om vriendschapsverzoeken naar deze bot te sturen voor handmatige goedkeuring.';

  @override
  String get applicationsManualFriendApproval =>
      'Handmatige goedkeuring van vriendschapsverzoeken vereisen';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Vriendschapsverzoeken aan deze bot moeten handmatig worden goedgekeurd.';

  @override
  String get applicationsOauthBuilderTitle => 'OAuth2-URL-bouwer';

  @override
  String get applicationsOauthBuilderDescription =>
      'Stel een autorisatie-URL samen met scopes en machtigingen.';

  @override
  String get applicationsScopes => 'Machtigingsbereiken';

  @override
  String get applicationsRedirectUri => 'Omleidings-URI';

  @override
  String get applicationsSelectRedirectUri => 'Selecteer een omleidings-URI';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'Om deze bot te gebruiken, is een omleidings-URI vereist voor de OAuth2-codetoekenning.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'Een omleidings-URI is vereist als je niet uitsluitend het machtigingsbereik bot gebruikt.';

  @override
  String get applicationsBotPermissions => 'Botmachtigingen';

  @override
  String get applicationsAuthorizeUrl => 'Autorisatie-URL';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Selecteer machtigingsbereiken (en een omleidings-URI indien vereist)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Autorisatie-URL kopiëren';

  @override
  String get applicationsCopiedUrl => 'URL gekopieerd naar klembord';

  @override
  String get applicationsDangerTitle => 'Gevarenzone';

  @override
  String get applicationsDangerSubtitle =>
      'Dit kan niet ongedaan worden gemaakt. Als je de app verwijdert, wordt ook de bijbehorende bot verwijderd.';

  @override
  String get applicationsDangerHelper =>
      'Na verwijdering zijn de app en de bijbehorende toegangsgegevens definitief gewist.';

  @override
  String get applicationsDelete => 'App verwijderen';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Weet je zeker dat je $name wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt. Alle bijbehorende gegevens, inclusief de botgebruiker, worden permanent verwijderd.';
  }

  @override
  String get applicationsDeleteFailed =>
      'Applicatie kon niet worden verwijderd';

  @override
  String get applicationsUpdated => 'App bijgewerkt';

  @override
  String get applicationsNoChanges => 'Geen wijzigingen om op te slaan';

  @override
  String get applicationsSearchBots => 'Apps en bots';

  @override
  String get applicationsSearchBotsDescription =>
      'Applicaties en bots voor je account maken en beheren';

  @override
  String get applicationsSearchInfoDescription =>
      'Basisinstellingen en omleidings-URI\'s van de app bewerken';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Bewerk de avatar, tag, bio en banner van de bot en hoe deze met vriendschapsverzoeken omgaat';

  @override
  String get applicationsSearchOauthDescription =>
      'Maak een autorisatie-URL met machtigingsbereiken, omleidingen en botmachtigingen';

  @override
  String get applicationsSearchSecretsDescription =>
      'Clientgeheimen en bottokens bekijken en opnieuw genereren';

  @override
  String get applicationsSearchBotsKeyword => 'Bots';

  @override
  String get applicationsSearchDocumentation => 'Documentatie';

  @override
  String get blockedUsersTitle => 'Geblokkeerde gebruikers';

  @override
  String get blockedUsersDescription =>
      'Geblokkeerde gebruikers kunnen je geen vriendschapsverzoeken sturen of je direct berichten sturen.';

  @override
  String get blockedUsersEmptyTitle => 'Geen geblokkeerde gebruikers';

  @override
  String get blockedUsersEmptyDescription => 'Je hebt nog niemand geblokkeerd.';

  @override
  String get blockedUsersLoadError =>
      'Blokkeeracties konden niet worden geladen';

  @override
  String get blockedUsersUnblock => 'Deblokkeren';

  @override
  String get blockedUsersUnblockTitle => 'Deblokkeer gebruiker';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Weet je zeker dat je $username wilt deblokkeren?';
  }

  @override
  String get blockedUsersCopyTag => 'Gebruikersnaam kopiëren';

  @override
  String get blockedUsersCopyId => 'Gebruikers-ID kopiëren';

  @override
  String get userProfileLoadError => 'Profiel kon niet worden geladen';

  @override
  String get userProfileLoading => 'Profiel laden';

  @override
  String get userProfileRetry => 'Opnieuw proberen';

  @override
  String get userProfileMessage => 'Bericht';

  @override
  String get userProfileVoiceCall => 'Spraakoproep';

  @override
  String get userProfileVideoCall => 'Videogesprek';

  @override
  String get userProfileEditProfile => 'Profiel bewerken';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName-medewerker';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Communityteam van $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName-partner';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName-bugjager';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return 'Plutonium van $productName';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Plutonium-abonnee sinds $date';
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
    return '$productName Visionair sinds $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionair-ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Gedeelde vrienden ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Gedeelde communities ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Gedeelde vrienden';

  @override
  String get userProfileMutualCommunitiesTitle => 'Gedeelde communities';

  @override
  String get userProfileNoMutualFriends => 'Geen gedeelde vrienden gevonden.';

  @override
  String get userProfileNoMutualCommunities =>
      'Geen gedeelde communities gevonden.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Bijnaam: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'DM openen';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Je hebt $username geblokkeerd. Je kunt geen berichten sturen, tenzij je ze deblokkeert.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Deblokkeren';

  @override
  String get userProfileOpenDm => 'DM openen';

  @override
  String get userProfileNoteTitle => 'Notitie';

  @override
  String get userProfileNoteVisibility => '(alleen voor jou zichtbaar)';

  @override
  String get userProfileNoteSave => 'Opslaan';

  @override
  String get userProfileNoteDelete => 'Verwijderen';

  @override
  String get userProfileMemberSince => 'Lid sinds';

  @override
  String get userProfileAboutMe => 'Over mij';

  @override
  String get userProfileRoles => 'Rollen';

  @override
  String get memberRoleAdd => 'Rol toevoegen';

  @override
  String memberRoleRemove(String roleName) {
    return 'Rol $roleName verwijderen';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Deze gebruiker heeft geen rollen in deze community.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Nog geen rollen. Voeg rollen toe via $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Geen rollen beschikbaar';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Er zijn op dit moment geen rollen om toe te wijzen in deze community, maar je kunt een nieuwe rol aanmaken in $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Community-instellingen';

  @override
  String get guildSettingsRolesTab => 'Rollen';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Lokale tijd';

  @override
  String get profileLocalTimeSettingsTitle => 'Lokale tijd in profiel';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Stel je tijdzone één keer in zodat $productName je tijdsverschil met UTC kan bijwerken bij het ingaan of eindigen van de zomertijd. Anderen kunnen alleen je tijdsverschil met UTC zien, niet de exacte identificatiecode van je tijdzone.';
  }

  @override
  String get profileLocalTimeEditButton => 'Lokale tijd profiel bewerken';

  @override
  String get profileLocalTimeTimezoneLabel => 'Tijdzone';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Kies de tijdzone die $productName gebruikt om je UTC-offset te berekenen voor de lokale tijd in je profiel.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Tijdzones zoeken';

  @override
  String get profileLocalTimeNotSet => 'Niet ingesteld';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Anderen kunnen alleen je huidige tijdsverschil met UTC zien als je ervoor kiest je lokale tijd op je profiel te delen. Ze zien niet de exacte identificatiecode van je tijdzone, zoals $timezoneIdentifierExample. $productName slaat die code alleen op om het tijdsverschil automatisch te kunnen bijwerken bij het ingaan of eindigen van de zomertijd.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Iedereen';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Sta iedereen die je volledige profiel kan bekijken toe om je lokale tijd te zien';

  @override
  String get profileLocalTimePrivacyFriends => 'Vrienden';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Sta je vrienden toe om je lokale tijd te zien';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Communityleden';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Sta leden van communities waar je lid van bent toe om je lokale tijd te zien';

  @override
  String get userProfileSameTimeAsYou => 'Zelfde lokale tijd als jij';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'Loopt $duration op je voor';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'Loopt $duration op je achter';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours uur',
      one: '1 uur',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuten',
      one: '1 minuut',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours uur',
      one: '1 uur',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuten',
      one: '1 minuut',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Gebruikersnaam kopiëren';

  @override
  String get userProfileCopyUserId => 'Gebruikers-ID kopiëren';

  @override
  String get userProfileViewMainProfile => 'Hoofdprofiel bekijken';

  @override
  String get userProfileViewCommunityProfile => 'Communityprofiel bekijken';

  @override
  String get userProfileBlockUser => 'Gebruiker blokkeren';

  @override
  String get userProfileUnblockUser => 'Deblokkeer gebruiker';

  @override
  String get userProfileRemoveFriend => 'Vriend verwijderen';

  @override
  String get userProfileBlockConfirmTitle => 'Gebruiker blokkeren';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Weet je zeker dat je $username wilt blokkeren?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Deblokkeer gebruiker';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Weet je zeker dat je $username wilt deblokkeren?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Vriend verwijderen';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Weet je zeker dat je $username als vriend wilt verwijderen?';
  }

  @override
  String get userProfileFailedOpenDm => 'DM kon niet worden geopend';

  @override
  String get userProfileFailedSaveNote => 'Notitie opslaan mislukt';

  @override
  String get userProfileActionFailed => 'Actie mislukt, probeer het opnieuw';

  @override
  String get userProfileChangeNickname => 'Bijnaam wijzigen';

  @override
  String get userProfileKick => 'Uit community verwijderen';

  @override
  String get userProfileBan => 'Verbannen';

  @override
  String get userProfileTimeout => 'Time-out';

  @override
  String get userProfileRemoveTimeout => 'Time-out opheffen';

  @override
  String get userProfileTransferOwnership => 'Eigendom overdragen';

  @override
  String get userProfileReportMessage => 'Bericht melden';

  @override
  String get userProfileReportUserProfile => 'Profiel melden';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Lid $username verwijderen?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Weet je zeker dat je $username wilt verwijderen? Diegene kan opnieuw deelnemen met een nieuwe uitnodiging.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Tijdslimiet verwijderen?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Het verwijderen van de time-out staat $username weer toe om berichten te sturen, te reageren en spraakkanalen te betreden.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Eigendom overdragen?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Eigendom van deze community overdragen aan $username? Dit is onomkeerbaar en je verliest alle beheerdersrechten.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '$username verbannen';
  }

  @override
  String get userProfileBanDurationLabel => 'Duur van verbanning';

  @override
  String get userProfileBanCustomSecondsLabel => 'Aangepaste duur (seconden)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Elke waarde van $min tot $max seconden';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Berichtgeschiedenis verwijderen';

  @override
  String get userProfileBanDeleteNone => 'Geen berichten verwijderen';

  @override
  String get userProfileBanDelete24h => 'Afgelopen 24 uur';

  @override
  String get userProfileBanDelete7d => 'Afgelopen 7 dagen';

  @override
  String get userProfileBanReasonLabel => 'Reden (optioneel)';

  @override
  String get userProfileBanReasonHint => 'Geef een reden op voor de verbanning';

  @override
  String get userProfileBanSubmit => 'Lid verbannen';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Tijdelijk blokkeren $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Duur van time-out';

  @override
  String get userProfileTimeoutSubmit => 'Lid uitsluiten';

  @override
  String get userProfileNicknameLabel => 'Bijnaam';

  @override
  String get userProfileNicknameHint => 'Voer een bijnaam in';

  @override
  String get userProfileNicknameSave => 'Opslaan';

  @override
  String userProfileKickSuccess(String username) {
    return '$username is verwijderd';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username is verbannen';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Gebruiker $username is verwijderd.';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Tijdelijke blokkering van $username verwijderd';
  }

  @override
  String get userProfileNicknameSuccess => 'Bijnaam bijgewerkt';

  @override
  String get userProfileTransferSuccess => 'Eigendom overgedragen';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 seconden';

  @override
  String get duration5Minutes => '5 minuten';

  @override
  String get duration10Minutes => '10 minuten';

  @override
  String get duration1Hour => '1 uur';

  @override
  String get duration12Hours => '12 uur';

  @override
  String get duration1Day => '1 dag';

  @override
  String get duration3Days => '3 dagen';

  @override
  String get duration5Days => '5 dagen';

  @override
  String get duration1Week => '1 week';

  @override
  String get duration2Weeks => '2 weken';

  @override
  String get duration1Month => '1 maand';

  @override
  String get durationCustom => 'Aangepast…';

  @override
  String typingIndicatorOne(String name) {
    return '$name typt...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 en $name2 typen...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 en $name3 typen...';
  }

  @override
  String get typingIndicatorMultiple => 'Verschillende mensen typen...';

  @override
  String get typingIndicatorHandful =>
      'Een paar toetsenbordridders zijn zich aan het verzamelen...';

  @override
  String get typingIndicatorSymphony => 'Iemand is aan het typen...';

  @override
  String get typingIndicatorFiesta => 'Er wordt hier volop getypt';

  @override
  String get typingIndicatorApocalypse => 'Wow, wat een typfestijn';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Fijn dat je er bent, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Welkom, $username! Maak het je gemakkelijk.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hallo, $username! Leuk dat je er bent.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hallo, $username! Je kunt meedoen wanneer je wilt.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hoi $username, leuk je hier te zien!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hoi $username! Veel plezier hier.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hoi, $username, welkom!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Fijn dat je er bent, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Welkom, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Welkom, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Welkom, $username! Fijn dat je er bent.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Welkom, $username! We hopen dat je het hier naar je zin hebt.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Welkom, $username! Je volgende gesprek begint hier.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Welkom, $username. Fijn dat je er bent.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Leuk je te zien, $username! Welkom.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Je bent er, $username! Fijn dat je erbij bent.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Je bent er, $username! Laten we beginnen.';
  }

  @override
  String get relativeTimeShortNow => 'nu';

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
      other: '${count}u',
      one: '1u',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen',
      one: '1 dag',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mnd',
      one: '1 mnd',
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
  String get linkedDevicesTitle => 'Mijn apparaten';

  @override
  String get linkedDevicesDescription =>
      'Bekijk alle apparaten die momenteel zijn ingelogd op je account. Verbreek alle sessies die je niet herkent.';

  @override
  String get linkedDevicesCurrentDevice => 'Huidig apparaat';

  @override
  String get linkedDevicesOtherDevices => 'Andere apparaten';

  @override
  String get linkedDevicesEnterSelection => 'Selectiemodus starten';

  @override
  String get linkedDevicesExitSelection => 'Verlaat selectiemodus';

  @override
  String get linkedDevicesSelectAll => 'Alles selecteren';

  @override
  String get linkedDevicesClearSelection => 'Selectie wissen';

  @override
  String get linkedDevicesRevokeTooltip => 'Toegang van apparaat intrekken';

  @override
  String get linkedDevicesSignOutAll => 'Afmelden op alle andere apparaten';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Meld $count apparaten af',
      one: 'Meld 1 apparaat af',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Meld $count apparaten af',
      one: 'Meld 1 apparaat af',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Afmelden op alle andere apparaten';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Dit logt de geselecteerde apparaten uit je account. Je moet op die apparaten opnieuw inloggen.',
      one:
          'Dit logt het geselecteerde apparaat uit je account. Je moet op dat apparaat opnieuw inloggen.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Hiermee meld je de geselecteerde apparaten af van je account. Je moet op die apparaten opnieuw inloggen.';

  @override
  String get linkedDevicesSignOutConfirm => 'Doorgaan';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Je moet op alle uitgelogde apparaten opnieuw inloggen';

  @override
  String get linkedDevicesLoadErrorTitle => 'Netwerkfout';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Het spijt ons, we hebben moeite om verbinding te maken met het ruimte-tijd-continuüm. Controleer je verbinding en probeer het opnieuw.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Apparaten ingetrokken',
      one: 'Apparaat ingetrokken',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Kon niet afmelden. Probeer het opnieuw.';

  @override
  String get linkedDevicesUnknownOs => 'Onbekend besturingssysteem';

  @override
  String get linkedDevicesUnknownPlatform => 'Onbekend platform';

  @override
  String get linkedDevicesViewDetails => 'Details bekijken';

  @override
  String get linkedDevicesDetailsTitle => 'Apparaatgegevens';

  @override
  String get linkedDevicesDetailsDevice => 'Apparaat';

  @override
  String get linkedDevicesDetailsClient => 'Client';

  @override
  String get linkedDevicesDetailsLocation => 'Locatie';

  @override
  String get linkedDevicesDetailsIp => 'IP-adres';

  @override
  String get linkedDevicesDetailsLastUsed => 'Laatst gebruikt';

  @override
  String get linkedDevicesCurrentSession => 'Huidige sessie';

  @override
  String get linkedDevicesUnknown => 'Onbekend';

  @override
  String slowmodeLabel(String duration) {
    return '$duration langzaam';
  }

  @override
  String get slowmodeTooltipActive =>
      'Je zit in slowmode. Wacht even voordat je weer een bericht stuurt.';

  @override
  String get slowmodeTooltipImmune =>
      'Slowmode is ingeschakeld, maar jij bent immuun.';

  @override
  String get slowmodeStatusEnabled => 'Slowmodus is ingeschakeld';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Slowmodus is actief ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Slowmodus is ingesteld op $durationLabel, maar je bent vrijgesteld.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Slowmodus is ingesteld op $durationLabel. Wacht voordat je nog een bericht verzendt.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Slowmodus is ingesteld op $durationLabel voor dit kanaal.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Je kunt geen berichten verzenden in dit kanaal.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Systeemaankondigingen van $productName-medewerkers. Je kunt hier niet antwoorden.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Het versturen van berichten is tijdelijk gepauzeerd in deze community.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Je hebt een time-out. Berichten, reacties en spraak zijn gepauzeerd totdat de time-out verloopt.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Je moet de registratie van je account voltooien om berichten in deze community te kunnen versturen.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Je moet je e-mailadres verifiëren om berichten te kunnen versturen in deze community.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Je account is te nieuw om berichten te versturen in deze community.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Je bent nog niet lang genoeg lid van deze community om berichten te kunnen versturen.';

  @override
  String get channelComposerBarrierVerifyEmail => 'E-mailadres verifiëren';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Te veel bijlagen (max $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName overschrijdt de limiet van $fileSize';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Die bestanden zijn te groot om samen te versturen';

  @override
  String get chatAttachmentDropToUpload => 'Zet bestanden neer om te uploaden';

  @override
  String get chatAttachmentDropToSend =>
      'Laat bestanden vallen om nu te verzenden';

  @override
  String get voiceMessageTitle => 'Spraakbericht';

  @override
  String get voiceMessageHoldHint =>
      'Houd ingedrukt om op te nemen. Sleep naar de prullenbak om te verwijderen, schuif omhoog om te vergrendelen of laat los om te verzenden.';

  @override
  String get voiceMessageDiscard => 'Spraakbericht weggooien';

  @override
  String get voiceMessageSend => 'Spraakbericht verzenden';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Kan opname niet starten. Geef microfoontoegang.';

  @override
  String get voiceMessageMicInUse =>
      'Verlaat het videogesprek om een spraakbericht op te nemen.';

  @override
  String get voiceMessageRecordingFailed =>
      'Opname mislukt. Probeer het opnieuw.';

  @override
  String get voiceMessageSendFailed =>
      'Spraakbericht kan niet worden verzonden. Probeer het opnieuw.';

  @override
  String get voiceMessagePlay => 'Afspelen';

  @override
  String get voiceMessagePause => 'Pauzeren';

  @override
  String get voiceMessageSeekForward => 'Spoel vooruit';

  @override
  String get voiceMessageSeekBackward => 'Terugspoelen';

  @override
  String get chatAttachmentEditTitle => 'Bijlage bewerken';

  @override
  String get chatAttachmentFilenameLabel => 'Bestandsnaam';

  @override
  String get chatAttachmentDescriptionLabel => 'Beschrijving';

  @override
  String get chatAttachmentDescriptionHint => 'Optionele alternatieve tekst';

  @override
  String get chatAttachmentSpoilerLabel => 'Markeren als spoiler';

  @override
  String get chatAttachmentRemove => 'Bijlage verwijderen';

  @override
  String get chatAttachmentDownload => 'Downloaden';

  @override
  String get chatAttachmentDownloadedToast => 'Opgeslagen in foto\'s';

  @override
  String get chatAttachmentDownloadFailedToast => 'Kon bijlage niet downloaden';

  @override
  String get chatAttachmentExpiredTooltip => 'Bijlage verlopen';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Uitvouwen ($count regels)',
      one: 'Uitvouwen ($count regel)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count regels verbergen',
      one: '$count regel verbergen',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Uitvouwen ($count rijen)',
      one: 'Uitvouwen ($count rij)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alles inklappen ($count rijen)',
      one: 'Alles inklappen ($count rij)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count regels over)',
      one: '... ($count regel over)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rijen over)',
      one: '... ($count rij over)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Bekijk hele bestand';

  @override
  String get chatTextualPreviewChangeLanguage => 'Taal wijzigen';

  @override
  String get chatTextualPreviewSearchLanguage => 'Taal zoeken…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntaxiskleuring';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Geen resultaten gevonden';

  @override
  String get chatTextualPreviewMoreOptions => 'Meer opties';

  @override
  String get chatTextualPreviewWrapText => 'Tekstterugloop';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Bestand is te groot voor inline voorbeeld (limiet $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Kan voorbeeld niet laden.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Platte tekst';

  @override
  String get chatTextualPreviewCopy => 'Kopiëren';

  @override
  String get chatAttachmentSourceGallery => 'Galerij';

  @override
  String get chatAttachmentSourceCamera => 'Camera';

  @override
  String get chatAttachmentSourceBrowse => 'Bestanden doorzoeken';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Spoiler weergeven';

  @override
  String get matureMediaRevealButton => 'Tonen';

  @override
  String get matureMediaRevealHint => 'Klik om te tonen';

  @override
  String get matureContentTitle => 'Inhoud voor volwassenen';

  @override
  String get matureCommunityTitle => 'Community voor volwassenen';

  @override
  String get matureCategoryTitle => 'Categorie voor volwassenen';

  @override
  String get matureChannelTitle => 'Kanaal voor volwassenen';

  @override
  String get communityContentWarningTitle =>
      'Waarschuwing over community-inhoud';

  @override
  String get categoryContentWarningTitle =>
      'Waarschuwing over categorie-inhoud';

  @override
  String get channelContentWarningTitle => 'Waarschuwing over kanaalinhoud';

  @override
  String get defaultContentWarningBody => 'Dit bevat gevoelige inhoud.';

  @override
  String get matureCommunityBody =>
      'Deze community is gemarkeerd voor inhoud voor volwassenen en kan materiaal bevatten dat ongeschikt is voor sommige gebruikers.';

  @override
  String get matureCategoryBody =>
      'Deze categorie is gemarkeerd voor inhoud voor volwassenen en kan materiaal bevatten dat ongeschikt is voor sommige gebruikers.';

  @override
  String get matureChannelBody =>
      'Dit kanaal is gemarkeerd voor inhoud voor volwassenen en kan materiaal bevatten dat ongeschikt is voor sommige gebruikers.';

  @override
  String get matureVoiceChannelBody =>
      'Dit spraakkanaal is gemarkeerd voor inhoud voor volwassenen en kan materiaal bevatten dat ongeschikt is voor sommige gebruikers.';

  @override
  String get matureLinkChannelBody =>
      'Dit linkkanaal is gemarkeerd voor inhoud voor volwassenen en kan materiaal openen dat ongeschikt is voor sommige gebruikers.';

  @override
  String get matureCommunityUnavailableBody =>
      'Deze community voor volwassenen is niet beschikbaar voor je account.';

  @override
  String get matureCategoryUnavailableBody =>
      'Deze categorie voor volwassenen is niet beschikbaar voor je account.';

  @override
  String get matureChannelUnavailableBody =>
      'Dit kanaal voor volwassenen is niet beschikbaar voor je account.';

  @override
  String get matureContentProceedButton => 'Doorgaan';

  @override
  String get matureContentUnderstandButton => 'Ik begrijp het';

  @override
  String get matureContentOpenLinkButton => 'Link openen';

  @override
  String get sensitiveContentFriendDmLabel => 'Directe berichten van vrienden';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Directe berichten van anderen';

  @override
  String get sensitiveContentGuildLabel => 'Berichten in communitykanalen';

  @override
  String get sensitiveContentFilterShow => 'Tonen';

  @override
  String get sensitiveContentFilterBlur => 'Vervagen';

  @override
  String get sensitiveContentFilterBlock => 'Blokkeren';

  @override
  String get sensitiveContentResetButton => 'Opnieuw instellen';

  @override
  String get sensitiveContentSaveButton => 'Opslaan';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bestanden',
      one: '1 bestand',
    );
    return 'Uploaden $_temp0';
  }

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Verloopt op $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Vervalt tussen $start en $end';
  }

  @override
  String get connectionsTitle => 'Verbindingen';

  @override
  String connectionsDescription(String productName) {
    return 'Koppel externe accounts en domeinen aan je $productName-profiel. Geverifieerde koppelingen worden op je profiel weergegeven zodat anderen ze kunnen zien.';
  }

  @override
  String get connectionsEmptyTitle => 'Nog geen verbindingen';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Koppel je Bluesky-account of verifieer domeineigendom om ze op je profiel weer te geven.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifieer domeineigendom om het op je profiel weer te geven.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domein';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Bluesky-verbinding toevoegen';

  @override
  String get connectionsAddDomainAriaLabel => 'Domeinverbinding toevoegen';

  @override
  String get connectionEdit => 'Bewerken';

  @override
  String get connectionRemove => 'Verwijderen';

  @override
  String get connectionVerifiedLabel => 'Deze verbinding is geverifieerd.';

  @override
  String get connectionUnverifiedLabel =>
      'Deze verbinding is niet geverifieerd.';

  @override
  String get connectionAddTitle => 'Verbinding toevoegen';

  @override
  String get connectionTypeLabel => 'Verbindingstype';

  @override
  String get connectionHandleLabel => 'Gebruikersnaam';

  @override
  String get connectionDomainLabel => 'Domein';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Je hebt deze verbinding al.';

  @override
  String get connectionConnectBluesky => 'Verbind met Bluesky';

  @override
  String get connectionContinue => 'Doorgaan';

  @override
  String get connectionVerifyTitle => 'Verbinding verifiëren';

  @override
  String get connectionVerifyInstructions =>
      'Gebruik het onderstaande record om eigendom van het domein te bewijzen.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT-record';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Waarde';

  @override
  String get connectionCopyHost => 'Host kopiëren';

  @override
  String get connectionCopyValue => 'Waarde kopiëren';

  @override
  String get connectionCopied => 'Gekopieerd!';

  @override
  String get connectionTokenFileTitle => 'Tokenbestand aanbieden';

  @override
  String get connectionTokenFileDescription =>
      'Download **fluxer-verification** en plaats dit in je **.well-known** map zodat we het domein kunnen valideren.';

  @override
  String get connectionTokenFileDownload => 'fluxer-verification downloaden';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Het bestand bevat de verificatietoken die we ophalen van **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Fluxer-verificatie opslaan';

  @override
  String get connectionVerifyButton => 'Verifiëren';

  @override
  String get connectionBack => 'Terug';

  @override
  String get connectionEditTitle => 'Verbinding bewerken';

  @override
  String get connectionEditDescription =>
      'Kies wie deze verbinding op je profiel kan zien.';

  @override
  String get connectionVisibilityEveryone => 'Iedereen';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Sta iedereen toe deze verbinding op je profiel te zien';

  @override
  String get connectionVisibilityFriends => 'Vrienden';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Sta je vrienden toe deze verbinding te zien';

  @override
  String get connectionVisibilityCommunityMembers => 'Communityleden';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Sta leden van communities waar je lid van bent toe om deze verbinding te zien';

  @override
  String get connectionRemoveTitle => 'Verbinding verwijderen';

  @override
  String get connectionRemoveDescription =>
      'Weet je zeker dat je deze verbinding wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get connectionRemoveConfirm => 'Verwijderen';

  @override
  String get connectionsLoadError => 'Verbindingen konden niet worden geladen';

  @override
  String get connectionsReorderError => 'Volgorde bijwerken mislukt';

  @override
  String get connectionInitiateFailed =>
      'Kon de verificatie niet starten. Probeer het opnieuw.';

  @override
  String get connectionVerifyFailed =>
      'Kon niet verifiëren. Controleer uw DNS-record en probeer het opnieuw.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Kon de Bluesky-autorisatie niet starten.';

  @override
  String get connectionUpdateFailed => 'Kon de verbinding niet bijwerken';

  @override
  String get connectionRemoveFailed => 'Verbinding kon niet worden verwijderd';

  @override
  String get connectionTokenSavedToast => 'Fluxer-verificatie opgeslagen';

  @override
  String get connectionTokenSaveFailedToast => 'Kon het bestand niet opslaan';

  @override
  String get connectionEnterHandle => 'Voer een Bluesky-handle in.';

  @override
  String get connectionEnterDomain => 'Voer een domein in.';

  @override
  String get lookAndFeelThemeSectionTitle => 'Thema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Kies tussen een donker, steenkool of licht uiterlijk.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Hoog dynamisch bereik';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Bepaal hoe HDR-afbeeldingen worden weergegeven op HDR-compatibele schermen.';

  @override
  String get lookAndFeelHdrFullName => 'Volledig dynamisch bereik';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Toon HDR-afbeeldingen met volledige helderheid en kleurbereik.';

  @override
  String get lookAndFeelHdrStandardName => 'Standaardbereik';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'HDR-afbeeldingen omzetten naar standaardbereik, waardoor de piekhelderheid wordt verminderd.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Weergavemodus met hoog dynamisch bereik';

  @override
  String get lookAndFeelThemeDark => 'Donker thema';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Donker thema (oud)';

  @override
  String get lookAndFeelThemeCoal => 'Kolenzwart thema';

  @override
  String get lookAndFeelThemeLight => 'Licht thema';

  @override
  String get lookAndFeelThemeSystem => 'Systeemthema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Thema synchroniseren op al je apparaten';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Wanneer ingeschakeld, worden themawijzigingen gesynchroniseerd met al je apparaten. Wanneer uitgeschakeld, gebruikt dit apparaat zijn eigen thema-instelling.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Systeemthema schakelt synchronisatie automatisch uit om de voorkeur van uw systeem op dit apparaat te volgen.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Kon de thema-instellingen niet synchroniseren met je account. Probeer het opnieuw.';

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
  String get lookAndFeelChatFontSizeLabel => 'Lettergrootte chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Zoomniveau van app';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Pas het zoomniveau van de app aan.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Chatachtergrond';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Kies een achtergrond voor je chat. Deze blijft op dit apparaat.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Deze instelling blijft op dit apparaat';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Chatachtergrond wordt alleen op dit apparaat opgeslagen en synchroniseert niet met andere apparaten.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Standaard';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Aangepaste afbeelding';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Sterrenveld';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Kleur $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Verloop $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Achtergrond dimmen';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Kon deze afbeelding niet als achtergrond instellen.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Berichten';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Kies hoe berichten worden weergegeven in chatkanalen.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Ruimte tussen berichtengroepen';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Weergavemodus berichten';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Comfortabel';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Ruime lay-out met duidelijke visuele scheiding tussen berichten.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Compact';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Toont zo veel mogelijk berichten met minimale tussenruimte.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Gebruikersavatars verbergen';

  @override
  String get lookAndFeelInterfaceTitle => 'Interface';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Pas interface-elementen en -gedrag aan.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Typindicatoren in de kanalenlijst';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Kies hoe type-indicatoren worden weergegeven in de kanaallijst wanneer iemand in een kanaal typt.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Typindicator + avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Typindicator met gebruikersavatars tonen in de kanaallijst';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'Alleen typindicator';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Toon alleen de typindicator zonder avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Verborgen';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Typindicatoren niet tonen in de kanalenlijst';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Typen in geselecteerd kanaal tonen';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Wanneer uitgeschakeld (standaard), verschijnen typindicatoren niet in het kanaal dat je momenteel bekijkt.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'algemeen';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Toetsenbordtips';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Bepaal of sneltoetstips in de pop-ups worden weergegeven.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Verberg toetsenbordhints in tooltips';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Wanneer ingeschakeld, worden snelkoppelingbadges verborgen in tooltip-pop-ups.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Zijbalk van de community';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Configure hoe de zijbalk van de community directe berichten weergeeft.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count communities zijn tijdelijk niet beschikbaar vanwege een flux-condensatorstoring.',
      one:
          '1 community is tijdelijk niet beschikbaar vanwege een flux-condensatorstoring.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Community tijdelijk niet beschikbaar';

  @override
  String get guildUnavailableDescription =>
      'Er is iets misgegaan. We werken eraan.';

  @override
  String get guildNotFoundTitle => 'Dit is niet de community die je zoekt.';

  @override
  String get guildNotFoundDescription =>
      'De community die je zoekt is mogelijk verwijderd of je hebt er geen toegang toe.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName is momenteel alleen toegankelijk voor medewerkers van $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'tijdelijk niet beschikbaar';

  @override
  String get lookAndFeelCollapseDMsLabel => 'DMs samenvouwen in map';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Wanneer ingeschakeld, worden ongelezen DM\'s in de zijbalk van de community samengeklapt in een map op de $productName-knop. Klik op de $productName-knop terwijl je op de DM-pagina bent om de map uit te vouwen of in te klappen.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanalenlijst';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Bepaal hoe ongelezen berichten in gedempte kanalen worden aangegeven in kanalenlijsten.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Ongelezenindicator tonen op gedempte kanalen';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Wanneer ingeschakeld, tonen gedempte kanalen een vervaagde indicator voor ongelezen berichten aan de linkerkant. Vermeldingen verschijnen nog steeds, ongeacht deze instelling.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Nu actief';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Bepaal hoe \'Nu actief\' in de app wordt weergegeven.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Nu actief op het startscherm tonen';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Toon Nu actief op het startscherm om vrienden te zien die actief zijn in spraakkanalen. Je ziet een voorbeeld, het kanaal, wie er al is en een snelle manier om deel te nemen.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favorieten';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Beheer de zichtbaarheid van favorieten in de hele app.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Favorieten inschakelen';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Wanneer ingeschakeld, kun je kanalen favoriet maken en verschijnen ze in de sectie Favorieten. Wanneer uitgeschakeld, worden alle favorietgerelateerde UI-elementen (knoppen, menu-items) verborgen. Je bestaande favorieten blijven behouden.';

  @override
  String get favoritesTitle => 'Favorieten';

  @override
  String get favoritesEmptyTitle => 'Nog geen favorieten';

  @override
  String get favoritesEmptyDescription =>
      'Sterkanalen vanuit de chatkop om ze hier te bewaren.';

  @override
  String get favoritesWelcomeTitle => 'Welkom bij favorieten';

  @override
  String get favoritesWelcomeDescription =>
      'Jouw persoonlijke plek voor snelle toegang tot kanalen, DM\'s en groepen die je belangrijk vindt. Tik op de ster bij een kanaal om het hier toe te voegen.';

  @override
  String get favoritesWelcomeTip =>
      'Niet voor jou? Je kunt het altijd uitschakelen.';

  @override
  String get favoritesDisableButton => 'Favorieten uitschakelen';

  @override
  String get favoritesAddedToast => 'Toegevoegd aan favorieten';

  @override
  String get favoritesRemovedToast => 'Verwijderd uit favorieten';

  @override
  String get favoritesHiddenToast => 'Favorieten verborgen';

  @override
  String get favoritesMute => 'Favorieten dempen';

  @override
  String get favoritesUnmute => 'Dempen van favorieten opheffen';

  @override
  String get favoritesHeaderMenu => 'Favorietenmenu';

  @override
  String get favoritesCreateCategory => 'Categorie aanmaken';

  @override
  String get favoritesCategoryNameLabel => 'Categorienaam';

  @override
  String get favoritesHideMutedChannels => 'Gedempte kanalen verbergen';

  @override
  String get favoritesShowMutedChannels => 'Gedempte kanalen tonen';

  @override
  String get favoritesSetNickname => 'Nickname instellen';

  @override
  String get favoritesNicknameLabel => 'Bijnaam';

  @override
  String get favoritesSaveNickname => 'Nickname opslaan';

  @override
  String get favoritesMoveToCategory => 'Verplaatsen naar categorie';

  @override
  String get favoritesUncategorized => 'Ongecategoriseerd';

  @override
  String get favoritesOtherCategory => 'Overig';

  @override
  String get favoritesRemoveFromFavorites => 'Verwijderen uit favorieten';

  @override
  String get favoritesAddToFavorites => 'Toevoegen aan favorieten';

  @override
  String get favoritesAddToSavedMedia => 'Toevoegen aan opgeslagen media';

  @override
  String get favoritesRemoveFromSavedMedia =>
      'Verwijderen uit opgeslagen media';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Toevoegen aan GIF-favorieten (alleen URL’s)';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Verwijderen uit URL-gebaseerde GIF-favorieten';

  @override
  String get savedMediaAddTitle => 'Toevoegen aan opgeslagen media';

  @override
  String get savedMediaFormNameLabel => 'Naam';

  @override
  String get savedMediaFormNameHint => 'Mijn geweldige media';

  @override
  String get savedMediaFormAltTextLabel => 'Alternatieve tekst';

  @override
  String get savedMediaFormAltTextHint => 'Beschrijf het media-item';

  @override
  String get savedMediaFormTagsLabel => 'Tags';

  @override
  String get savedMediaFormTagsHint => 'grappig, reactie, werk';

  @override
  String get savedMediaSaveError => 'Kon opgeslagen media niet bijwerken.';

  @override
  String get savedMediaNameRequired => 'Naam is vereist.';

  @override
  String get gifFavoriteFirstTimeTitle => 'Hoe slaan we je GIF-favorieten op?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Je kunt favoriete GIF\'s opslaan als alleen-URL favorieten of ze uploaden naar je opgeslagen media. Kies de optie die het beste bij jouw gebruik past. Je kunt dit op elk moment wijzigen in Instellingen > Geavanceerd > Media.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-only favorieten (standaard): gesynchroniseerd op al je apparaten, geen upload, telt niet mee voor opgeslagen media. De originele media kunnen verdwijnen als de host ze verwijdert.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Opgeslagen media: geüpload, tagbaar, doorzoekbaar en persistent, maar telt mee voor je limiet aan opgeslagen media.';

  @override
  String get gifFavoriteFirstTimeHint => 'We vragen het maar één keer.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Gebruik alleen URL (aanbevolen)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Gebruik opgeslagen media';

  @override
  String get favoritesHideConfirmTitle => 'Favorieten verbergen';

  @override
  String get favoritesHideConfirmDescription =>
      'Dit verbergt alle favorieten-gerelateerde UI-elementen, inclusief knoppen en menu-items. Je bestaande favorieten blijven behouden en kunnen op elk moment opnieuw worden ingeschakeld via Instellingen > Geavanceerd > Uiterlijk.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direct bericht';

  @override
  String get messagesMediaDisplayGroupTitle => 'Weergave';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Bepaal hoe berichten, media en andere inhoud worden weergegeven.';

  @override
  String get messagesMediaMediaGroupTitle => 'Media';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Pas mediagroottevoorkeuren en knoppen aan.';

  @override
  String get messagesMediaInputGroupTitle => 'Invoer';

  @override
  String get messagesMediaInputGroupDescription =>
      'Pas de instellingen voor het invoeren van berichten aan.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Zijbalk';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Configureer hoe de community-zijbalk wordt weergegeven.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Gedempte kanalen standaard verbergen';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Verberg gedempte kanalen automatisch in de zijbalk wanneer je nieuwe communities toevoegt';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Gedempte kanalen standaard verbergen?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'In nieuwe communities waar je lid van wordt, worden gedempte kanalen automatisch verborgen. Wil je deze instelling ook toepassen op al je bestaande communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Gedempte kanalen niet meer standaard verbergen?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'In nieuwe communities waar je lid van wordt, worden gedempte kanalen niet meer automatisch verborgen. Wil je gedempte kanalen ook weergeven in al je bestaande communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Toepassen op alle communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'In alle communities weergeven';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Alleen nieuwe communities';

  @override
  String get messagesMediaDisplaySectionTitle => 'Mediaweergave';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Bepaal hoe afbeeldingen, video\'s en andere media worden weergegeven. Alle media worden verkleind en geconverteerd. Extreem grote bestanden die niet tot een voorbeeld kunnen worden gecomprimeerd, worden ongeacht deze instellingen niet ingesloten.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Wanneer als links in chats geplaatst';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Wanneer rechtstreeks geüpload naar $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Linkvoorbeelden';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Bepaal hoe websitekoppelingen worden voorvertonen in chats';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Ingesloten inhoud en voorbeelden van weblinks tonen';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reacties';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Emoji-reacties op berichten instellen';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Toon emojireacties op berichten';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoilerinhoud';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Bepaal hoe spoilerinhoud wordt weergegeven';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Toon spoilerinhoud';

  @override
  String get messagesMediaSpoilersOnClickName => 'Bij klikken';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Toon spoilerinhoud na klikken';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'In kanalen die ik modereer';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Altijd spoilerinhoud tonen in kanalen waar je de machtiging \"Berichten beheren\" hebt';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Altijd';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Spoilerinhoud altijd tonen';

  @override
  String get messagesMediaSizeSectionTitle => 'Voorkeuren voor mediagrootte';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Pas de maximale weergavegrootte aan voor ingesloten en bijgevoegde media. Kleinere formaten nemen minder schermruimte in beslag, terwijl grotere formaten meer details tonen.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Media van links (embeds)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Geüploade bijlagen';

  @override
  String get messagesMediaSizeCompactName => 'Compact (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Kleinere mediagrootte';

  @override
  String get messagesMediaSizeComfortableName => 'Comfortabel (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Grotere mediagrootte met meer details';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF-gedrag';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Bepaal hoe GIF\'s in de chat worden ingevoegd';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'GIF\'s automatisch verzenden zodra je ze selecteert';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Camera-uploads';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Kies of foto\'s en video\'s die met de camera in de app zijn gemaakt, op je apparaat worden bewaard';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Opslaan op apparaat';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Automatisch aanvullen van expressies (dubbele punt-aanvulling)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Bepaal wat er wordt weergegeven in de expressie-autocomplete wanneer je een dubbele punt typt. Pas de suggesties aan om aan je voorkeuren te voldoen.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Standaardemoji\'s tonen in suggesties voor expressies';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Aangepaste emoji\'s tonen in suggesties voor expressies';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Toon stickers in suggesties voor expressies';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Opgeslagen media tonen in suggesties voor expressies';

  @override
  String get accessibilitySaturationTitle => 'Verzadiging';

  @override
  String get accessibilityVisualGroupTitle => 'Weergave';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Links altijd onderstrepen';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Alternatieve tekst op afbeeldingen weergeven';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Toon alternatieve tekst onder afbeeldingen wanneer deze beschikbaar is.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Doorgestreepte tekst dimmen';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Voorbeelden van DM-berichten';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Voorbeeldmodus DM-berichten';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Alle berichten';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Toon berichtvoorbeelden voor alle DM-gesprekken';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Alleen ongelezen DM\'s';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Toon alleen berichtvoorbeelden voor DM\'s met ongelezen berichten';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Geen';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Geen berichtvoorbeelden tonen in de DM-lijst';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Schermlezer';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Configureer hoe $productName werkt met schermlezers.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Nieuwe berichten aankondigen';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Laat schermlezers nieuwe berichten aankondigen zodra ze binnenkomen in het open kanaal. Meldingsgeluiden worden niet beïnvloed.';

  @override
  String get accessibilityTtsGroupTitle => 'Tekst naar spraak';

  @override
  String get accessibilityTtsGroupDescription =>
      'Kies een snelheid voor gesproken tekst.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Afspeelsnelheid spraak';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Voorbeeld afspelen';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Voorbeeld stoppen';

  @override
  String get accessibilityPreviewButtonLabel => 'Voorbeeldknop';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Dit is hoe links worden weergegeven: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Voorbeeldgebruiker';

  @override
  String get accessibilityKeyboardGroupTitle => 'Toetsenbord';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Focusring tonen op chattekstgebied';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Esc-toets sluit toetsenbordmodus af';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Sneltoetsen voor contextmenu weergeven';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Bevestigen voor het starten van oproepen';

  @override
  String get accessibilityAnimationGroupTitle => 'Animatie';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Verminderde beweging is ingeschakeld, dus animaties van content zijn standaard gepauzeerd. Je kunt ze nog steeds inschakelen om ze af te spelen.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Geanimeerde emoji\'s afspelen';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'GIF\'s automatisch afspelen';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'GIF\'s automatisch afspelen wanneer het venster van $productName actief is';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Wordt afgespeeld ondanks verminderde beweging.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Gepauzeerd door verminderde beweging. Schakel in om geanimeerde emoji\'s af te blijven spelen.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Gepauzeerd door verminderde beweging. Schakel in om GIF\'s af te spelen.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Stickeranimaties';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Voorkeur voor stickeranimatie';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Altijd animeren';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Stickers worden altijd geanimeerd';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animatie bij interactie';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Stickers animeren als je erop tikt';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Stickers animeren wanneer je ze aanwijst of ermee interacteert';

  @override
  String get accessibilityStickerNeverAnimateName => 'Nooit animeren';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Stickers worden nooit geanimeerd';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Altijd animeren ondanks verminderde beweging.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Beperkte beweging zorgt ervoor dat stickers alleen bij interactie animeren. Kies \'altijd animeren\' om dit te overschrijven.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Standaard geanimeerd bij interactie op mobiel om de batterij te sparen.';

  @override
  String get accessibilityMotionGroupTitle => 'Beweging';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Instelling voor minder beweging synchroniseren met het systeem';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Gebruik de voorkeur voor verminderde beweging van dit apparaat, of pas deze hieronder aan.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Beweging verminderen';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Schakel animaties en overgangen uit. Dit wordt momenteel beheerd via je systeeminstellingen.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Schakel animaties en overgangen in de hele app uit.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Op het tabblad Animatie bepaal je zelf hoe geanimeerde emoji\'s, GIF\'s en stickers worden afgespeeld.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Gesprek starten?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Weet je zeker dat je dit gesprek wilt starten?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Oproep starten';

  @override
  String get accessibilityTtsSampleDescription =>
      'Hoor de voorbeeldzin uitgesproken met de gekozen snelheid.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, ik kom uit de toekomst. Ik ben hierheen gekomen met een tijdmachine die jij hebt uitgevonden. Nu heb ik je hulp nodig om terug te gaan naar het jaar 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Spraaksynthese is niet beschikbaar op dit apparaat.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Spraakweergave mislukt. Probeer het opnieuw of controleer of de audio-uitvoer werkt.';

  @override
  String get ttsSubstitutionUnknownUser => 'onbekende gebruiker';

  @override
  String get ttsSubstitutionUnknownRole => 'onbekende rol';

  @override
  String get ttsSubstitutionUnknownChannel => 'onbekend kanaal';

  @override
  String get ttsSubstitutionCodeBlock => 'codeblok';

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
    return '$authorName zei: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Antwoord op $replyAuthorName: $authorName zei: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'stuurde een sticker';

  @override
  String get ttsSentAttachment => 'heeft een bijlage verzonden';

  @override
  String ttsSentAttachments(int count) {
    return '$count bijlagen verzonden';
  }

  @override
  String get ttsSentEmbed => 'heeft een embed verstuurd';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author heeft $summary verzonden';
  }

  @override
  String get dmListSentAnAttachment => 'Heeft een bijlage verstuurd';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username heeft een bericht vastgezet in dit kanaal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username heeft $userName toegevoegd aan de groep.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username heeft iemand aan de groep toegevoegd.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username heeft de groep verlaten.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username heeft $userName uit de groep verwijderd.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username heeft iemand uit de groep verwijderd.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username heeft de kanaalnaam gewijzigd naar $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username heeft de kanaalnaam gewijzigd.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username heeft het kanaalpictogram gewijzigd.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username is een gesprek gestart.';
  }

  @override
  String get systemCallJoinTheCall => 'Deelnemen aan gesprek';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username is een gesprek gestart dat $duration duurde.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Je hebt een oproep van $username gemist die $duration duurde.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Je hebt een oproep gemist van $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'een paar seconden';

  @override
  String get systemCallDurationMinute => 'een minuut';

  @override
  String get systemCallDurationOneYear => '1 jaar';

  @override
  String get systemCallDurationOneMonth => '1 maand';

  @override
  String get systemCallDurationOneWeek => '1 week';

  @override
  String get systemCallDurationOneDay => '1 dag';

  @override
  String get systemCallDurationOneHour => '1 uur';

  @override
  String systemCallDurationYears(int count) {
    return '$count jaar';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count maanden';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count weken';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count dagen';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count uur';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minuten';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Update $productName om dit bericht te bekijken.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Bevestiging spraakverbinding';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Je bent al verbonden met dit spraakkanaal vanaf $count andere apparaten. Wat wil je doen?',
      one:
          'Je bent al verbonden met dit spraakkanaal vanaf 1 ander apparaat. Wat wil je doen?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Overschakelen naar dit apparaat';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Deelnemen (andere verbindingen behouden)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Niks doen, ik wil niet deelnemen';

  @override
  String get voiceJoinFailedTitle => 'Kon geen spraakverbinding maken';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Kon uw andere apparaten niet verbreken. Probeer het later opnieuw.';

  @override
  String get voiceChannelJoin => 'Deelnemen aan spraakkanaal';

  @override
  String get voiceCallJoin => 'Deelnemen aan gesprek';

  @override
  String get voiceChannelJoinConnect => 'Verbinden met spraakchat';

  @override
  String get voiceChannelNoConnectPermission =>
      'Je hebt geen toestemming om deel te nemen aan dit spraakkanaal';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Audio van je microfoon, camerabeelden en gedeelde scherminhoud zijn van begin tot eind versleuteld.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Audio van je microfoon, camerabeelden en gedeelde scherminhoud zijn van begin tot eind versleuteld.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end-versleuteling is niet beschikbaar omdat een deelnemer in dit spraakkanaal deze niet ondersteunt.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end-versleuteling is niet beschikbaar omdat een deelnemer in dit gesprek deze niet ondersteunt.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Deze client moet worden bijgewerkt voordat u deelneemt aan dit versleutelde gesprek.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Je microfoon kon niet worden gestart. Je bent nog steeds in het gesprek.';

  @override
  String get voiceChannelStatusConnecting => 'Verbinden…';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobiel apparaat';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Desktopapparaat';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Door community gedempt';

  @override
  String get voiceParticipantTooltipMuted => 'Gedempt';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Door de community gedempt';

  @override
  String get voiceParticipantTooltipDeafened => 'Geluid uitgeschakeld';

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
  String get voiceChannelLeave => 'Verlaten';

  @override
  String get voiceControlMute => 'Dempen';

  @override
  String get voiceControlUnmute => 'Dempen opheffen';

  @override
  String get voiceControlDeafen => 'Geluid uitschakelen';

  @override
  String get voiceControlUndeafen => 'Geluid inschakelen';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Camera omdraaien';

  @override
  String get voiceControlScreenShare => 'Scherm delen';

  @override
  String get voiceScreenShareNotificationText => 'Uw scherm wordt gedeeld.';

  @override
  String get voiceControlDisconnect => 'Verbinding verbreken';

  @override
  String get voiceInChat => 'In spraakchat';

  @override
  String get voiceConnectionFailed => 'Verbinding mislukt';

  @override
  String get voiceConnectionRetry => 'Opnieuw proberen';

  @override
  String get voiceConnectionDismiss => 'Sluiten';

  @override
  String get voiceConnectionDisconnected => 'Verbinding verbroken';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Latentie meten...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Ga naar $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Spraakverbinding';

  @override
  String get voiceConnectionAdvancedStats => 'Geavanceerd';

  @override
  String get voiceShowCallAvatars => 'Avatars in gesprekken tonen';

  @override
  String get voiceShowConnectionId => 'Verbindings-ID tonen';

  @override
  String get voiceAudioProcessing => 'Audioverwerking';

  @override
  String get voiceConnectionSessionSection => 'Sessie';

  @override
  String get voiceConnectionDurationLabel => 'Duur';

  @override
  String get voiceConnectionParticipantsLabel => 'Deelnemers';

  @override
  String get voiceConnectionNetworkSection => 'Netwerk';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Verzenden';

  @override
  String get voiceConnectionReceiveLabel => 'Ontvangen';

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
  String get userAreaMuteMicrophone => 'Microfoon dempen';

  @override
  String get userAreaUnmuteMicrophone => 'Microfoon inschakelen';

  @override
  String get userAreaUserSettings => 'Gebruikersinstellingen';

  @override
  String get voiceParticipantMenuViewProfile => 'Profiel bekijken';

  @override
  String get voiceParticipantMenuFocus => 'Focus op deze persoon';

  @override
  String get voiceParticipantMenuUnfocus => 'Focus opheffen';

  @override
  String get voiceParticipantMenuCommunityMute =>
      'Microfoon dempen in community';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Geluid uitschakelen in community';

  @override
  String get voiceParticipantMenuUserVolume => 'Volume van gebruiker';

  @override
  String get voiceParticipantMenuStreamVolume => 'Streamvolume';

  @override
  String get voiceParticipantMenuStopStreaming => 'Stoppen met streamen';

  @override
  String get voiceParticipantModerationFailed =>
      'Kon dat lid niet bijwerken. Probeer het opnieuw.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Bekijken';

  @override
  String get voiceCallViewModeGrid => 'Raster';

  @override
  String get voiceCallViewModeFocus => 'Focus';

  @override
  String get voicePanelSettingsSectionTitle => 'Spraakinstellingen';

  @override
  String get voicePanelUseEarpieceLabel => 'Gebruik oortelefoon';

  @override
  String get voiceOutputRouteSpeaker => 'Luidspreker';

  @override
  String get voiceOutputRouteEarpiece => 'Oortelefoon';

  @override
  String get voiceOutputRouteHeadset => 'Koptelefoon';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Alleen video\'s tonen';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Toon alleen deelnemers die hun camera aan hebben staan.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Mijn camera tonen';

  @override
  String get voicePrioritizeSpeakersLabel => 'Sprekers voorrang geven';

  @override
  String get voiceTextChatShow => 'Chat weergeven';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ongelezen berichten',
      one: '# ongelezen bericht',
    );
    return 'Toon chat met $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Cameratoestemming is vereist voor video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Kon het delen van het scherm niet starten. Probeer het opnieuw.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Scherm delen is geweigerd.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Scherm delen is niet beschikbaar op dit apparaat.';

  @override
  String get voiceWatchStream => 'Stream bekijken';

  @override
  String get voiceStopWatching => 'Stoppen met kijken';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Stop met het bekijken van de huidige stream';

  @override
  String get voiceOwnScreenShareTitle => 'Je zendt uit';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Je stream is live voor deelnemers.';

  @override
  String get voiceLiveBadge => 'Live';

  @override
  String get dmVoiceViewCall => 'Oproep bekijken';

  @override
  String get dmVoiceCallFullScreen => 'Volledig scherm';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Volledig scherm';

  @override
  String get dmVoiceStripStatusConnecting => 'Verbinden…';

  @override
  String get dmVoiceStripStatusInCall => 'In gesprek';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Spraakoproep';

  @override
  String get dmVoiceCallBarConnecting => 'Verbinden…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direct gesprek';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Groepsgesprek';

  @override
  String get dmVoiceCallBarIssueFallback => 'Probleem met spraak';

  @override
  String get dmVoiceFullscreenTitle => 'Spraak';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Stem verbonden';

  @override
  String get notificationsPageTitle => 'Meldingen';

  @override
  String get notificationsFilterUnreads => 'Ongelezen';

  @override
  String get notificationsFilterMentions => 'Vermeldingen';

  @override
  String get notificationsBookmarksTooltip => 'Opgeslagen berichten';

  @override
  String get notificationsMentionFilterTooltip => 'Vermeldingen filteren';

  @override
  String get notificationsMentionFiltersTitle => 'Vermeldingsfilters';

  @override
  String get notificationsMentionIncludeEveryone =>
      '@everyone- en @here-vermeldingen opnemen';

  @override
  String get notificationsMentionIncludeRoles => 'Neem rolvermeldingen op';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Alle vermeldingen van de community opnemen';

  @override
  String get notificationsNoUnreadTitle => 'Geen ongelezen berichten';

  @override
  String get notificationsNoUnreadBody => 'Je bent helemaal bij.';

  @override
  String get notificationsNoMentionsTitle => 'Geen recente vermeldingen';

  @override
  String get notificationsNoMentionsBody =>
      'Al je @vermeldingen verschijnen hier 7 dagen lang.';

  @override
  String get notificationsMentionsEndTitle => 'Je hebt het einde bereikt';

  @override
  String get notificationsMentionsEndBody =>
      'Je hebt al je recente vermeldingen gezien. Geen zorgen, er komen er snel meer bij.';

  @override
  String get notificationsJump => 'Ga naar';

  @override
  String get notificationsRemoveMentionTooltip => 'Vermelding verwijderen';

  @override
  String get notificationsViewAllUnread => 'Alle ongelezen bekijken';

  @override
  String get notificationsMarkAsRead => 'Markeren als gelezen';

  @override
  String get notificationsExpand => 'Uitvouwen';

  @override
  String get notificationsCollapse => 'Inklappen';

  @override
  String get notificationsMessageUnavailable =>
      'Dit bericht kon niet worden geladen.';

  @override
  String characterCounterRemaining(int remaining) {
    return 'Nog $remaining tekens over';
  }

  @override
  String get characterCounterTooLong => 'Bericht is te lang';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return 'Nog $remaining tekens over. Krijg $productName om tot $premiumMaxLength tekens te schrijven.';
  }

  @override
  String get chatMessageFailedToSend => 'Bericht kon niet worden verzonden';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Je bericht kon niet worden bezorgd. Dit komt meestal doordat je geen community deelt met de ontvanger of omdat de ontvanger alleen directe berichten van vrienden accepteert. Mogelijk moet je ook je eigen privacy-instellingen voor directe berichten aanpassen in $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Je bericht kon niet worden bezorgd. Je moet de registratie van je account voltooien om privéberichten te kunnen versturen.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Je bericht kon niet worden bezorgd. Je moet de registratie van je account voltooien om berichten te kunnen versturen.';

  @override
  String get chatSendFailureContentBlocked =>
      'Je bericht kon niet worden bezorgd omdat het is gemarkeerd door onze veiligheidssystemen. Als je denkt dat dit een fout is, neem dan contact op met de ondersteuning.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'Je bericht kon niet worden bezorgd omdat het is gemarkeerd door onze veiligheidssystemen. Als je denkt dat dit een fout is, neem dan contact op met de beheerders van deze instantie.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Je bericht kon niet worden bezorgd omdat het volwassen emoji of stickers bevat die in deze context niet zijn toegestaan.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Alleen jij kunt dit bericht zien.';

  @override
  String get chatClientSystemDismiss => 'Sluiten';

  @override
  String get privacyDashboardCommunicationSection => 'Communicatie';

  @override
  String get privacyDashboardProfilePrivacySection => 'Profielprivacy';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Vrienden en directe berichten';

  @override
  String get privacyDashboardActivitySharingSection => 'Activiteit delen';

  @override
  String get privacyDashboardSensitiveContentSection => 'Gevoelige inhoud';

  @override
  String get privacyDashboardDataExportSection => 'Gegevensexport';

  @override
  String get privacyDashboardDataDeletionSection => 'Gegevens verwijderen';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Wie je volledige profiel kan zien';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Vrienden en alle communities';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Je volledige profiel is zichtbaar voor vrienden en iedereen in je communities';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Alleen vrienden en kleine communities';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Je volledige profiel is zichtbaar voor vrienden en leden van je communities met 200 of minder leden';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Alleen vrienden';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Je volledige profiel is alleen zichtbaar voor je vrienden';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Vriendschapsverzoeken';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Iedereen';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Vrienden van vrienden';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers => 'Communityleden';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Directe berichten';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Directe berichten van communityleden toestaan';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Directe berichten van communitybots toestaan';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Inkomende oproepen';

  @override
  String get privacyDashboardAllowedCallers => 'Toegestane bellers';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blokkeer alle inkomende oproepen';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Sta alleen toe dat vrienden je bellen (aanbevolen)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Sta vrienden toe plus extra groepen die je kiest';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Sta iedereen toe om je te bellen, zelfs onbekenden';

  @override
  String get privacyDashboardAdditionalGroups => 'Extra groepen';

  @override
  String get privacyDashboardRingBehavior => 'Belgedrag';

  @override
  String get privacyDashboardSilentCalls => 'Stille oproepen van iedereen';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Wie jou kan toevoegen aan groepschats';

  @override
  String get privacyDashboardAllowedInvites => 'Toegestane uitnodigingen';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Niemand mag je zonder toestemming toevoegen aan groepschats';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Sta alleen vrienden toe om je toe te voegen zonder te vragen (aanbevolen)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Sta vrienden plus extra groepen toe om je toe te voegen';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Iedereen toestaan je toe te voegen aan groepschats zonder toestemming';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Spraakactiviteit in Nu actief';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Deel je spraakactiviteit met vrienden';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Spraakactiviteit delen met alle vrienden?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Spraakactiviteit niet meer delen met alle vrienden?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Je staat op het punt je spraakactiviteit te delen met al je vrienden, inclusief toekomstige vrienden. Dit verstuurt een update naar hen allemaal. Je kunt dit pas over 24 uur weer wijzigen.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Je staat op het punt je spraakactiviteit niet meer te delen met al je vrienden, inclusief toekomstige vrienden. Dit verstuurt een update naar hen allemaal. Je kunt dit pas over 24 uur weer wijzigen.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Ja, delen met alle vrienden';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Ja, stoppen met delen';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Weer beschikbaar over $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Delen van spraakactiviteit bijgewerkt';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Het delen van spraakchatactiviteit kon nu niet worden bijgewerkt';

  @override
  String get privacyDashboardDataExportDesc =>
      'Maak een downloadbaar archief van je accountgegevens, inclusief berichten en URL\'s van bijlagen. De meeste mensen willen alles, maar je kunt hieronder kiezen welke gegevens je wilt opnemen.';

  @override
  String get privacyDashboardExportMyData => 'Mijn gegevens exporteren';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Verwijder permanent de berichten die je hebt verzonden in DM\'s, groeps-DM\'s en communities. Dit proces wordt op de achtergrond uitgevoerd en je ontvangt een DM wanneer het is voltooid.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Mijn berichten verwijderen';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Directe berichten van communityleden toestaan?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Directe berichten van communityleden blokkeren?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Bots toestaan om je directe berichten te sturen?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Voorkomen dat bots je directe berichten sturen?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Wil je ook directe berichten toestaan van leden van je bestaande communities?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Wil je ook directe berichten van leden van je bestaande communities blokkeren?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Wil je ook toestaan dat bots uit je bestaande communities je directe berichten sturen?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Wil je ook bots uit je bestaande community\'s blokkeren?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Je kunt deze instelling ook per community wijzigen door de communitynaam lang ingedrukt te houden en \'Privacy-instellingen\' te selecteren.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Toestaan voor alle communities';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Blokkeren voor alle communities';

  @override
  String get privacyDashboardDmConfirmSkip => 'Deze stap overslaan';

  @override
  String get privacyDashboardDataRequestGoBack => 'Terug';

  @override
  String get privacyDashboardDataRequestExportTitle =>
      'Mijn gegevens exporteren';

  @override
  String get privacyDashboardDataRequestDeleteTitle =>
      'Mijn berichten verwijderen';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'We verwerken dit zo snel mogelijk. Je ontvangt een e-mail wanneer je archief klaar is.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'We verwerken dit zo snel mogelijk. Je ontvangt een DM van ons wanneer het klaar is.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Wat opnemen';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Alles';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exporteer elk bericht dat je ooit hebt verzonden, plus al je accountinstellingen, lidmaatschappen en metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Aangepaste selectie';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Kies welke soorten gesprekken, communities en tijdsperiode je wilt opnemen in het archief.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Kies wat je wilt opnemen';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Kies welke soorten gesprekken je wilt opschonen.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Alleen plaatsen waar ik geen toegang meer toe heb';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Verwijder alleen berichten uit communities en groeps-DM\'s die je hebt verlaten of waaruit je bent verwijderd.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Welke gesprekken';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Schakel de soorten gesprekken in die je wilt opnemen.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Geopende DM\'s';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Gesloten DM\'s';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Groeps-DM\'s';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Welke communities';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Communityfilter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Alles behalve geselecteerde opnemen';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Alleen de geselecteerde';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Je zit momenteel in geen enkele community.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Periode';

  @override
  String get privacyDashboardDataRequestDateMode => 'Periode';

  @override
  String get privacyDashboardDataRequestAllTime => 'Gehele periode';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Aangepast bereik';

  @override
  String get privacyDashboardDataRequestStartDate => 'Startdatum';

  @override
  String get privacyDashboardDataRequestEndDate => 'Einddatum';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Laat een veld leeg om geen begin- of eindgrens aan de periode te stellen.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Kies ten minste één type gesprek om op te nemen.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Startdatum moet vóór einddatum liggen.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Controleren en bevestigen';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'We maken een downloadbaar archief van elk bericht dat je ooit hebt verzonden en sturen je een e-mail wanneer het klaar is. De downloadlink in die e-mail verloopt na 7 dagen.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'We maken een downloadbaar archief aan dat overeenkomt met de onderstaande filters en sturen je een e-mail wanneer het klaar is. De downloadlink in die e-mail verloopt na 7 dagen.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Verwijder permanent de berichten die overeenkomen met de onderstaande filters. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Er is geen herstel mogelijk als dit eenmaal is gestart. We sturen je een DM wanneer het klaar is.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Export aanvragen';

  @override
  String get privacyDashboardDataRequestDeleteMessages =>
      'Berichten verwijderen';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Bereik';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Gesprekken';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Periode';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Geen';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Vanaf $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Tot $end';
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
    return 'Allemaal behalve $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communities',
      one: '# community',
    );
    return 'Alleen $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Geopende directe berichten';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Gesloten DM-gesprekken';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'DM-gesprekken (open en gesloten)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Groeps-DM\'s';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Communities';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# uur',
      one: '# uur',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuten',
      one: '# minuut',
    );
    return '$_temp0 en $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# uur',
      one: '# uur',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuten',
      one: '# minuut',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# seconden',
      one: '# seconde',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Privacyinstellingen konden niet worden geladen';

  @override
  String get privacyDashboardRetry => 'Opnieuw proberen';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Instellingen voor gevoelige inhoud konden niet worden opgeslagen.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Kon de aanvraag niet voltooien.';

  @override
  String get chatMessageDeleteFailed => 'Verwijder mislukt bericht';

  @override
  String get chatMessageAddReaction => 'Reactie toevoegen';

  @override
  String get doubleTapReactionHint => 'Dubbeltik op een bericht om';

  @override
  String get doubleTapReactionEdit => 'Bewerken';

  @override
  String get doubleTapReactionEditTitle => 'Standaard bewerken';

  @override
  String get doubleTapReactionEditSubtitle => 'Kies dubbeltik-emoji';

  @override
  String get chatMessageEdit => 'Bericht bewerken';

  @override
  String get chatMessageReply => 'Antwoorden';

  @override
  String get notificationReplyPlaceholder => 'Bericht';

  @override
  String get notificationReplyFailed => 'Antwoord kon niet worden verzonden';

  @override
  String get chatMessageForward => 'Doorsturen';

  @override
  String get forwardMessageTitle => 'Bericht doorsturen';

  @override
  String get forwardSearchHint => 'Zoek kanalen of privéberichten';

  @override
  String get forwardDirectMessagesSection => 'Directe berichten';

  @override
  String get forwardCommentHint => 'Opmerking toevoegen (optioneel)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Verzenden ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Geen kanalen gevonden';

  @override
  String get forwardSuccessToast => 'Bericht doorgestuurd';

  @override
  String get forwardFailed => 'Bericht doorsturen mislukt';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Opmerkingen zijn niet beschikbaar omdat een geselecteerd kanaal slowmode heeft ingeschakeld.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Wachten tot de slowmodus in een of meer geselecteerde kanalen is verlopen.';

  @override
  String get slowmodeRateLimitedTitle => 'Slowmodus actief';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Slowmodus is ingeschakeld — wacht $duration voordat je nog een bericht verzendt.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Direct upload is uitgeschakeld tijdens slowmode.';

  @override
  String get shareMediaTitle => 'Delen met';

  @override
  String get shareMediaMessageHint => 'Voeg een optioneel bericht toe…';

  @override
  String get shareMediaSendButton => 'Verzenden';

  @override
  String get shareMediaSuccessToast => 'Media gedeeld';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Gedeeld met $count bestemmingen';
  }

  @override
  String get shareMediaFailedToast => 'Media delen mislukt';

  @override
  String get forwardDestinationNoSendPermission =>
      'Je kunt hier geen berichten sturen';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Je kunt hier geen links insluiten';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Je kunt hier geen bestanden bijvoegen';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Berichten versturen is uitgeschakeld in deze community';

  @override
  String get forwardDestinationTimedOut =>
      'Je hebt een timeout in deze community';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Slowmode - wacht $remaining';
  }

  @override
  String get chatMessageCopyText => 'Bericht kopiëren';

  @override
  String get chatMessageCopyEmbedText => 'Kopieer ingesloten tekst';

  @override
  String get chatMessageTranslate => 'Vertalen';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Vertaald vanuit $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Bekijk origineel';

  @override
  String get chatMessageSeeTranslation => 'Zie vertaling';

  @override
  String get chatMessageTranslating => 'Vertalen…';

  @override
  String get chatMessageTranslateFailed => 'Kon dit bericht niet vertalen.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Vertalen is niet beschikbaar op dit apparaat.';

  @override
  String get chatMessageSpeak => 'Bericht voorlezen';

  @override
  String get chatMessageStopSpeaking => 'Voorlezen stoppen';

  @override
  String get chatMessagePin => 'Bericht vastzetten';

  @override
  String get chatMessageUnpin => 'Bericht losmaken';

  @override
  String get chatMessageUnpinIt => 'Losmaken';

  @override
  String get chatMessageBookmark => 'Bericht opslaan';

  @override
  String get chatMessageRemoveBookmark =>
      'Verwijderen uit opgeslagen berichten';

  @override
  String get chatMessageMarkAsUnread => 'Markeren als ongelezen';

  @override
  String get chatMessageCopyMessageLink => 'Link van bericht kopiëren';

  @override
  String get chatMessageOpenLink => 'Link openen';

  @override
  String get chatMessageCopyLink => 'Link kopiëren';

  @override
  String get chatMessageCopyMessageId => 'Bericht-ID kopiëren';

  @override
  String get chatMessageViewReactions => 'Reacties bekijken';

  @override
  String get chatMessageRemoveAllReactions => 'Alle reacties verwijderen';

  @override
  String get chatMessageDebug => 'Bericht debuggen';

  @override
  String get chatMessageDebugSheetTitle => 'Bericht debuggen';

  @override
  String get chatMessageDebugCopyJson => 'Kopieer JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Bericht-JSON gekopieerd naar klembord';

  @override
  String get chatReactionsSheetTitle => 'Reacties';

  @override
  String get chatReactionsSheetEmpty => 'Nog niemand heeft hiermee gereageerd.';

  @override
  String get chatReactionAddFailed => 'Reactie toevoegen mislukt';

  @override
  String get chatReactionRemoveFailed => 'Reactie verwijderen mislukt';

  @override
  String get chatMessageReport => 'Bericht melden';

  @override
  String get reportFlowTitleMessage => 'Bericht melden';

  @override
  String get reportFlowTitleUserProfile => 'Profiel melden';

  @override
  String get reportFlowSummaryTitle => 'Controleer je melding';

  @override
  String get reportFlowSummarySubtitle =>
      'Controleer of dit klopt voordat je het verstuurt.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Meld alleen iets waarvan je oprecht denkt dat het de regels overtreedt. Misbruik van meldingen gaat in tegen onze $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'communityrichtlijnen';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Meld alleen iets waarvan je oprecht denkt dat het de regels overtreedt, en stuur niet twee keer dezelfde melding.';

  @override
  String get reportFlowSelectedMessage => 'Bericht dat je meldt';

  @override
  String get reportFlowSelectedUser => 'Profiel dat je meldt';

  @override
  String get reportFlowReportCategory => 'Je antwoorden';

  @override
  String get reportFlowSubmit => 'Melding verzenden';

  @override
  String get reportFlowBack => 'Terug';

  @override
  String get reportFlowNext => 'Volgende';

  @override
  String get reportFlowDone => 'Klaar';

  @override
  String get reportFlowThankYouTitle => 'Melding verzonden';

  @override
  String get reportFlowThankYouNoReportTitle => 'Bedankt dat je dit aankaart';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'Het veiligheidsteam van $productName bekijkt je melding. We maken niet bekend dat de melding van jou komt.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Bedankt dat je het ons laat weten. Dit is op zichzelf geen overtreding van onze regels, dus we hebben geen melding verstuurd. Als het op iemand gericht is of scheldwoorden bevat, meld het dan opnieuw en kies “Beledigende of schadelijke inhoud”.';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Bedankt dat je het ons laat weten. Dit is op zichzelf geen overtreding van onze regels, dus we hebben geen melding verstuurd.';

  @override
  String get reportFlowMoreYouCanDo => 'Je opties';

  @override
  String reportFlowBlockName(String name) {
    return '$name blokkeren';
  }

  @override
  String get reportFlowBlockDescription =>
      'Verbergt de berichten van deze persoon en voorkomt dat diegene je berichten stuurt';

  @override
  String get reportFlowBlockButton => 'Blokkeren';

  @override
  String get reportFlowBlockedButton => 'Geblokkeerd';

  @override
  String get reportFlowUrgentBanner =>
      'Als iemand in direct gevaar is, neem dan eerst contact op met de lokale hulpdiensten.';

  @override
  String get reportFlowLoadFailed => 'Kon het meldingsformulier niet laden.';

  @override
  String get reportFlowTryAgain => 'Opnieuw proberen';

  @override
  String get reportFlowOutdated =>
      'Het meldingsformulier is gewijzigd. Begin opnieuw.';

  @override
  String get reportFlowAlreadyReported => 'Je hebt dit bericht al gemeld.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Je hebt dit profiel vandaag al gemeld.';

  @override
  String get reportFlowRateLimited =>
      'Je stuurt te snel meldingen. Probeer het later opnieuw.';

  @override
  String get reportFlowSubmitFailed =>
      'Je melding is niet verzonden. Probeer het opnieuw.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Voltooi de registratie van je account en verifieer je e-mailadres om meldingen te versturen.';

  @override
  String get chatMessageSuppressEmbeds => 'Ingesloten inhoud verbergen';

  @override
  String get chatMessageUnsuppressEmbeds => 'Ingesloten inhoud weergeven';

  @override
  String get chatMessageDelete => 'Bericht verwijderen';

  @override
  String get chatMessageDeleteConfirmTitle => 'Bericht verwijderen';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Weet je zeker dat je dit bericht wilt verwijderen?';

  @override
  String get chatMessageDeleteAttachment => 'Bijlage verwijderen';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText => 'Alternatieve tekst bewerken';

  @override
  String get chatMessageMore => 'Meer';

  @override
  String get chatEditingMessage => 'Bericht bewerken';

  @override
  String get chatReplyOriginalDeleted => 'Oorspronkelijk bericht is verwijderd';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Oorspronkelijk bericht kon niet worden geladen';

  @override
  String get chatReplyAttachedMedia => 'Bericht bevat bijgevoegde media';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count geblokkeerde berichten',
      one: '1 geblokkeerd bericht',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potentiële spammer-berichten',
      one: '1 potentiële spammer-bericht',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Antwoord verborgen omdat de oorspronkelijke auteur is geblokkeerd.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Antwoord verborgen omdat de oorspronkelijke auteur is gemarkeerd als spammer.';

  @override
  String get devMarkAsSpamLocally => 'Lokaal als spam markeren';

  @override
  String get devIgnoreSpamFlag => 'Spammarkering negeren';

  @override
  String get chatMessagesLoadError => 'Berichten konden niet worden geladen.';

  @override
  String get chatReplyMentionOverrideTitle => 'Vermeldingsvoorkeur aanpassen?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname wil graag een @vermelding ontvangen bij antwoorden. Toch verzenden zonder vermelding?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname geeft de voorkeur aan antwoorden zonder @vermelding. Toch verzenden met vermelding?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Voorkeur negeren';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klik om het pingen van de gebruiker op wie je reageert uit te schakelen.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klik om het pingen van de gebruiker op wie je reageert in te schakelen.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Genoemde gebruiker heeft gereageerd';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Antwoord annuleren';

  @override
  String get chatEditMessageHint => 'Bericht bewerken';

  @override
  String get chatEditNoChanges => 'Geen wijzigingen om op te slaan';

  @override
  String get chatChannelNotReady =>
      'Dit kanaal is nog niet gereed. Probeer het later opnieuw.';

  @override
  String get chatMessageEdited => '(bewerkt)';

  @override
  String get chatMessageSilent => 'Dit was een @silent-bericht.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Vandaag om $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Gisteren om $time';
  }

  @override
  String get mediaViewerImagePreview => 'Afbeeldingsvoorbeeld';

  @override
  String get mediaViewerClose => 'Mediaviewer sluiten';

  @override
  String get mediaViewerOpenInBrowser => 'Openen in browser';

  @override
  String get mediaViewerOptions => 'Mediaopties';

  @override
  String get mediaViewerCopyLink => 'Link kopiëren';

  @override
  String get mediaViewerForward => 'Doorsturen';

  @override
  String get mediaViewerZoomIn => 'Inzoomen';

  @override
  String get mediaViewerZoomOut => 'Uitzoomen';

  @override
  String get mediaViewerPreviousAttachment => 'Vorige bijlage';

  @override
  String get mediaViewerNextAttachment => 'Volgende bijlage';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Bijlage $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Sluiten';

  @override
  String get chatAttachmentVideoToggleControls =>
      'Videobedieningselementen in-/uitschakelen';

  @override
  String get chatAttachmentVideoMute => 'Video dempen';

  @override
  String get chatAttachmentVideoUnmute => 'Video dempen opheffen';

  @override
  String get chatAttachmentVideoPlay => 'Video afspelen';

  @override
  String get chatAttachmentVideoPause => 'Video pauzeren';

  @override
  String get chatAttachmentVideoProgress => 'Videovoortgang';

  @override
  String get chatVideoPlaybackFailed =>
      'Deze video kon niet worden afgespeeld.';

  @override
  String get chatImageCouldNotLoad =>
      'Deze afbeelding kon niet worden geladen.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Breng gebruikers met deze rol die toestemming hebben om dit kanaal te bekijken op de hoogte.';

  @override
  String get composerAutocompleteSuggestions => 'Suggesties';

  @override
  String get composerAutocompleteCommandsHeading => 'Opdrachten';

  @override
  String get composerAutocompleteChoicesHeading => 'Keuzes';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Optionele argumenten';

  @override
  String get composerAutocompleteMediaHeading => 'Media';

  @override
  String get composerAutocompleteStickersHeading => 'Stickers';

  @override
  String get composerAutocompleteGifsHeading => 'GIF\'s';

  @override
  String get composerAutocompleteNoGifs => 'Geen GIF\'s gevonden';

  @override
  String get composerCommandShrugDescription =>
      'Voegt ¯\\_(ツ)_/¯ toe aan je bericht.';

  @override
  String get composerCommandTableflipDescription =>
      'Voegt (╯°□°)╯︵ ┻━┻ toe aan je bericht.';

  @override
  String get composerCommandUnflipDescription =>
      'Voegt ┬─┬ ノ( ゜-゜ノ) toe aan je bericht.';

  @override
  String get composerCommandMeDescription =>
      'Stuur een actiebericht (wordt cursief weergegeven).';

  @override
  String get composerCommandSpoilerDescription =>
      'Verstuur een spoilerbericht (plaatst de tekst tussen spoilertags).';

  @override
  String get composerCommandTtsDescription =>
      'Stuur een tekst-naar-spraakbericht.';

  @override
  String get composerCommandNickDescription =>
      'Wijzig je bijnaam in deze community.';

  @override
  String get composerCommandKickDescription =>
      'Verwijder een lid uit deze community.';

  @override
  String get composerCommandBanDescription =>
      'Verban een lid uit deze community.';

  @override
  String get composerCommandMsgDescription =>
      'Stuur een direct bericht naar een gebruiker.';

  @override
  String get composerCommandSavedDescription =>
      'Stuur een opgeslagen media-item.';

  @override
  String get composerCommandStickerDescription => 'Sticker verzenden.';

  @override
  String get composerCommandGifDescription => 'Zoek en verstuur een GIF.';

  @override
  String get composerCommandMemberOption =>
      'Het lid waarop de actie wordt uitgevoerd.';

  @override
  String get composerCommandReasonOption => 'Reden (optioneel).';

  @override
  String get composerCommandMessageOption => 'Het bericht om te verzenden.';

  @override
  String get composerCommandQueryOption => 'Waar je naar wilt zoeken.';

  @override
  String get composerCommandNicknameOption =>
      'Je nieuwe bijnaam, of laat leeg om deze te resetten.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Hoeveel van de recente berichtgeschiedenis van het lid moet worden verwijderd.';

  @override
  String get composerCommandDeleteMessagesNone => 'Geen berichten verwijderen';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Vorige $count dagen';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Afgelopen 24 uur';

  @override
  String get composerCommandOptionRequired =>
      'Deze optie is vereist. Geef een waarde op.';

  @override
  String get composerCommandClear => 'Opdracht wissen';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Je hebt je bijnaam in deze community gewijzigd van **$previousNickname** naar **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Onbekende gebruiker';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Bericht naar **$username** kon niet worden verzonden. Mogelijk hebben ze DM\'s uitgeschakeld of ben je geblokkeerd.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count meer';
  }

  @override
  String get addGuildModalTitle => 'Community toevoegen';

  @override
  String get addGuildModalLandingDescription =>
      'Maak een nieuwe community of word lid van een bestaande.';

  @override
  String get addGuildCreateCommunity => 'Community aanmaken';

  @override
  String get addGuildJoinCommunity => 'Word lid van community';

  @override
  String get addGuildImportDiscordTemplate => 'Discord-sjabloon importeren';

  @override
  String get addGuildJoinTitle => 'Word lid van een community';

  @override
  String get addGuildJoinDescription =>
      'Voer de uitnodigingslink in om deel te nemen aan een community.';

  @override
  String get addGuildInviteLinkLabel => 'Uitnodigingslink';

  @override
  String get addGuildJoinSubmit => 'Word lid van community';

  @override
  String get addGuildInviteInvalid =>
      'Deze uitnodiging is ongeldig of verlopen.';

  @override
  String get addGuildJoinFailed =>
      'Kon de community niet joinen. Probeer het opnieuw.';

  @override
  String get addGuildCreateTitle => 'Community aanmaken';

  @override
  String get addGuildCreateDescription =>
      'Maak een community om met je vrienden te chatten.';

  @override
  String get addGuildCreateNameLabel => 'Naam community';

  @override
  String get addGuildCreateSubmit => 'Community aanmaken';

  @override
  String get addGuildCreateFailed =>
      'Community kon niet worden aangemaakt. Probeer het opnieuw.';

  @override
  String get addGuildCreateClaimTitle =>
      'Voltooi de registratie van je account';

  @override
  String get addGuildCreateClaimDescription =>
      'Je moet de registratie van je account voltooien voordat je een community kunt aanmaken.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifieer je e-mailadres';

  @override
  String get addGuildCreateVerifyDescription =>
      'Je moet je e-mailadres verifiëren voordat je een community kunt aanmaken.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Geanimeerde pictogrammen worden niet ondersteund bij het maken van een nieuwe community. Gebruik een statische afbeelding.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Door een community aan te maken, ga je akkoord met het volgen en naleven van de ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Communityrichtlijnen van $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Dit exemplaar is een enkele community, dus er kunnen geen extra communities worden aangemaakt.';

  @override
  String get addGuildCreateChangeIcon => 'Pictogram wijzigen';

  @override
  String get addGuildCreateIconLabel => 'Communitypictogram';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Max. 10 MB. Aanbevolen: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Plak een Discord-sjablon URL om de structuur ervan te importeren in een nieuwe community.';

  @override
  String get addGuildImportUrlLabel => 'Sjabloon-URL';

  @override
  String get addGuildImportUrlInvalid =>
      'Voer een geldige Discord-sjablon URL of code in.';

  @override
  String get addGuildImportFetchFailed =>
      'Kon de communitysjabloon niet ophalen. Het sjabloon bestaat mogelijk niet of de externe service is onbereikbaar.';

  @override
  String get addGuildImportInvalidResponse =>
      'Dit lijkt geen geldige sjabloonreactie te zijn.';

  @override
  String get addGuildImportTemplateLabel => 'Sjabloon';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount tekst, $voiceChannelCount spraak, $categoryCount categorieën, $roleCount rollen';
  }

  @override
  String get addGuildImportRemoveIcon => 'Pictogram verwijderen';

  @override
  String get addGuildImportTemplateInvalid =>
      'De community-sjabloongegevens zijn ongeldig of onjuist geformatteerd.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Alle reacties verwijderen';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Weet je zeker dat je alle reacties van dit bericht wilt verwijderen?';

  @override
  String get chatMessagePinConfirm => 'Vastzetten';

  @override
  String get chatMessagePinConfirmDescription =>
      'Zet dit bericht vast in het kanaal zodat iedereen het kan zien.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Bericht losmaken';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Deze pin terug in de tijd sturen?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username heeft $messageLink vastgepind in dit kanaal. Bekijk $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'een bericht';

  @override
  String get systemPinMessageAllPinsLink => 'al je vastgezette berichten';

  @override
  String get channelPinsEmptyTitle => 'Geen vastgezette berichten';

  @override
  String get channelPinsEmptyDescription =>
      'Vastgezette berichten verschijnen hier.';

  @override
  String get channelDetailsFallbackTitle => 'Details';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Groeps-DM · $count leden';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Gesprek met $name sluiten?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Groep verlaten $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Kanaalinstellingen';

  @override
  String get channelDetailsGroupSettingsTitle => 'Groepsinstellingen';

  @override
  String get channelDetailsDmSettingsTitle => 'DM-instellingen';

  @override
  String get channelDetailsInvitePeople => 'Mensen uitnodigen';

  @override
  String get channelDetailsCopyLink => 'Link kopiëren';

  @override
  String get channelMenuCopyChannelLink => 'Kanaallink kopiëren';

  @override
  String get channelMenuCopyRedirectLink => 'Kopieer doorstuurlink';

  @override
  String get channelDetailsAddFriendsToGroup => 'Vrienden toevoegen aan groep';

  @override
  String get channelDetailsGroupInvites => 'Groepsuitnodigingen';

  @override
  String get channelDetailsEditChannel => 'Kanaal bewerken';

  @override
  String get channelDetailsDeleteChannel => 'Kanaal verwijderen';

  @override
  String get channelSettingsEditCategory => 'Categorie bewerken';

  @override
  String get channelSettingsTabOverview => 'Overzicht';

  @override
  String get channelSettingsTabPermissions => 'Machtigingen';

  @override
  String get channelSettingsTabInvites => 'Uitnodigingen';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Kanaal verwijderen';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Weet je zeker dat je $channelName wilt verwijderen? Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Weet je zeker dat je $categoryName wilt verwijderen? Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Categorie verwijderen';

  @override
  String get channelSettingsChannelUpdated => 'Kanaal bijgewerkt';

  @override
  String get channelSettingsChannelName => 'Kanaalnaam';

  @override
  String get channelSettingsCategoryName => 'Categorienaam';

  @override
  String get channelSettingsMyCategory => 'Mijn categorie';

  @override
  String get categoryExpandCategory => 'Categorie uitvouwen';

  @override
  String get categoryCollapseCategory => 'Categorie inklappen';

  @override
  String get categoryExpandAllCategories => 'Alle categorieën uitvouwen';

  @override
  String get categoryCollapseAllCategories => 'Alle categorieën inklappen';

  @override
  String get categoryMuteCategory => 'Categorie dempen';

  @override
  String get categoryUnmuteCategory => 'Dempen van categorie opheffen';

  @override
  String get categoryCopyCategoryId => 'Categorie-ID kopiëren';

  @override
  String get categoryIdCopied => 'Categorie-ID gekopieerd';

  @override
  String get channelSettingsChannelNamePlaceholder => 'algemeen';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Onderwerp';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Voeg een onderwerp toe aan dit kanaal';

  @override
  String get channelSettingsInsertEmoji => 'Emoji invoegen';

  @override
  String get channelSettingsTopicTooLongTitle => 'Kanaalonderwerp is te lang.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Kort het onderwerp in en probeer het opnieuw.';

  @override
  String get channelSettingsSlowmode => 'Slowmodus';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Wachttijd tussen berichten. \"$bypassSlowmodePermissionLabel\" kan dit omzeilen.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Uit';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds seconden';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minuten';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours uur';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minuut';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour uur';
  }

  @override
  String get channelSettingsVoiceQuality => 'Spraakkwaliteit';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Hogere bitrate = betere kwaliteit en hoger bandbreedtegebruik.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Deelnemerslimiet';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maximum leden dat tegelijk kan deelnemen. 0 betekent onbeperkt.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deelnemers',
      one: '1 deelnemer',
      zero: '∞ Geen limiet',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Verbindingslimiet';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maximum aantal actieve verbindingen dat een lid in dit kanaal kan hebben.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count verbindingen',
      one: '1 verbinding',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Spraakregio';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Selecteer een spraakregio voor dit kanaal. Automatisch gebruikt de dichtstbijzijnde regio.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatisch';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Spraakregio\'s konden niet worden geladen';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Probeer het over een ogenblik opnieuw.';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Overschrijf de instelling van het $scopeLevel-niveau voor dit kanaal. Inhoud voor volwassenen wordt achter een poort getoond voordat je toegang krijgt.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Overnemen';

  @override
  String get channelSettingsMatureContentOn => 'Aan';

  @override
  String get channelSettingsMatureContentOff => 'Uit';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Markeer dit kanaal voor volwassen content.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Laat dit kanaal onbeperkt toe voor volwassen content.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Overgenomen van $inheritedSourceLabel: aan';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Overgenomen van $inheritedSourceLabel: uit';
  }

  @override
  String get channelSettingsMatureContentCategoryScope => 'Categorie';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Community';

  @override
  String get channelSettingsContentWarningToggle =>
      'Toon een inhoudswaarschuwing in dit kanaal';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Toont een toestemmingsprompt voordat deze kanaal wordt betreden.';

  @override
  String get channelSettingsContentWarningText =>
      'Aangepaste waarschuwingstekst';

  @override
  String get channelSettingsContentWarningDefault =>
      'Dit bevat gevoelige inhoud.';

  @override
  String get channelSettingsUnknownRole => 'Onbekende rol';

  @override
  String get channelSettingsUnknownUser => 'Onbekende gebruiker';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Aangepaste toegangsrechten';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Toegang bewerken voor $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Terug naar aangepaste toegangsrechten';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Basisrechten voor dit kanaal configureren';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Aangepaste toegangsrechten voor deze rol configureren';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Aangepaste toegangsrechten voor dit lid configureren';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Machtigingen zoeken…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Kanaaltoegang bijgewerkt';

  @override
  String get channelSettingsPermissionsTitle => 'Toegangscontrole';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Dit kanaal is gesynchroniseerd met de bovenliggende categorie ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Dit kanaal is niet gesynchroniseerd met de bovenliggende categorie ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Synchroniseren met categorie';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanaal gesynchroniseerd met bovenliggende categorie';

  @override
  String get channelSettingsPermissionsAddOverride =>
      'Aangepaste toegangsrechten toevoegen';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Zoek rollen of leden…';

  @override
  String get channelSettingsDeleteInvite => 'Uitnodiging verwijderen';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Deze uitnodiging verwijderen? Kan niet ongedaan worden gemaakt.';

  @override
  String get channelSettingsCopyInviteCode => 'Uitnodigingscode kopiëren';

  @override
  String get channelSettingsCopyInviteUrl => 'Uitnodigings-URL kopiëren';

  @override
  String get channelSettingsWebhookCreated => 'Webhook aangemaakt';

  @override
  String get channelSettingsWebhookCreateFailed => 'Webhook maken mislukt';

  @override
  String get channelSettingsCreateWebhook => 'Webhook maken';

  @override
  String get channelSettingsInvitesDescription =>
      'Beheer uitnodigingslinks voor dit kanaal.';

  @override
  String get channelSettingsInvitesCreate => 'Uitnodiging maken';

  @override
  String get channelSettingsInvitesEmpty => 'Geen uitnodigingslinks';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Dit kanaal heeft nog geen uitnodigingslinks. Maak er een aan om mensen uit te nodigen voor dit kanaal.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Er is een fout opgetreden bij het laden van de uitnodigingslinks voor dit kanaal. Probeer het opnieuw.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Beheer inkomende webhooks die berichten in dit kanaal kunnen plaatsen.';

  @override
  String get channelSettingsWebhooksEmpty => 'Geen webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Er zijn geen webhooks ingesteld voor dit kanaal. Maak een webhook aan om externe apps berichten te laten plaatsen.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Dit kanaal ondersteunt geen webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Je hebt de \"$permission\"-permissie nodig om webhooks voor dit kanaal te bekijken en te bewerken.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => 'Webhooks laden mislukt';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Er is een fout opgetreden bij het laden van de webhooks voor dit kanaal. Probeer het opnieuw.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Gemaakt door $creator op $date';
  }

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Afbeelding uploaden';

  @override
  String get channelSettingsWebhooksRemove => 'Verwijderen';

  @override
  String get channelSettingsWebhooksName => 'Naam';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Naam webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Kanaal';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook-URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Webhook-URL kopiëren';

  @override
  String get channelSettingsWebhooksDelete => 'Webhook verwijderen';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Webhook kon niet worden verwijderd';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Webhook verwijderen? Dit kan niet ongedaan worden gemaakt.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Probeer het over een ogenblik opnieuw.';

  @override
  String get channelMenuOpenChat => 'Chat openen';

  @override
  String get channelMenuDuplicateChannel => 'Kanaal dupliceren';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Status van akkoord voor inhoud voor volwassenen resetten';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Je berichten in dit kanaal verwijderen?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Hiermee worden alle berichten die je ooit in dit kanaal hebt verzonden, permanent verwijderd. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Mijn berichten verwijderen';

  @override
  String get channelMenuDeletedYourMessages => 'Je berichten zijn verwijderd';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Je berichten konden niet worden verwijderd';

  @override
  String get channelDetailsSystemMessage => 'Systeembericht';

  @override
  String get channelDetailsTextChannel => 'Tekstkanaal';

  @override
  String get channelDetailsVoiceChannel => 'Spraakkanaal';

  @override
  String get channelDetailsCategory => 'Categorie';

  @override
  String get channelDetailsLinkChannel => 'Kanaal koppelen';

  @override
  String get channelDetailsGenericChannel => 'Kanaal';

  @override
  String get channelDetailsMutedConversation => 'Gesprek gedempt';

  @override
  String get channelDetailsUnmutedConversation => 'Gesprek gedempt';

  @override
  String get channelDetailsMutedChannel => 'Kanaal gedempt';

  @override
  String get channelDetailsUnmutedChannel => 'Kanaal gedempt';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Meldingsinstellingen bijgewerkt';

  @override
  String get channelDetailsTabMembers => 'Leden';

  @override
  String get channelDetailsTabPins => 'Vastgezet';

  @override
  String get channelDetailsActionMute => 'Dempen';

  @override
  String get channelDetailsActionUnmute => 'Dempen opheffen';

  @override
  String get channelDetailsActionSearch => 'Zoeken';

  @override
  String get channelDetailsActionMore => 'Meer';

  @override
  String get channelDetailsMembersEmptyTitle => 'Geen leden om te tonen';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Leden verschijnen hier zodra de communitygegevens zijn geladen.';

  @override
  String get memberListPermissionDeniedTitle =>
      'Je kunt de leden niet bekijken';

  @override
  String get memberListPermissionDeniedBody =>
      'Je kunt de leden van dit kanaal in deze community niet bekijken';

  @override
  String get memberListUnavailableTitle => 'Ledenlijst niet beschikbaar';

  @override
  String get memberListUnavailableBody =>
      'Ledenlijsten zijn tijdelijk niet beschikbaar in deze community';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Pins konden niet worden geladen';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Leden met de machtiging \"Berichten vastmaken\" kunnen berichten vastmaken zodat iedereen ze kan zien.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Je kunt berichten in dit gesprek vastmaken zodat iedereen ze kan zien.';

  @override
  String get channelDetailsPinsEndReached => 'Je hebt het einde bereikt';

  @override
  String get channelHeaderPinnedMessages => 'Vastgezette berichten';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Vastgezette berichten, ongelezen';

  @override
  String get channelHeaderMemberList => 'Ledenlijst';

  @override
  String get channelHeaderInbox => 'Inbox';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Meldingsinstellingen, gedempt';

  @override
  String get channelDetailsSearchTitle => 'Zoeken';

  @override
  String get channelDetailsSearchHint => 'Berichten zoeken';

  @override
  String get channelDetailsSearchFilterFrom => 'Van';

  @override
  String get channelDetailsSearchFilterHas => 'Heeft';

  @override
  String get channelDetailsSearchFilterIn => 'In';

  @override
  String get channelDetailsSearchFilterMentions => 'Vermeldingen';

  @override
  String get channelDetailsSearchFilterMore => 'Meer';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Actief';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kanalen';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count gebruikers';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Gebruiker';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filteren op kanaal';

  @override
  String get channelDetailsSearchChannelsHint => 'Kanalen zoeken';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Geen kanalen gevonden';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Vastgezet';

  @override
  String get channelDetailsSearchPinnedTrue => 'Alleen vastgepind';

  @override
  String get channelDetailsSearchPinnedFalse => 'Exclusief vastgepind';

  @override
  String get channelDetailsSearchClearFilter => 'Wissen';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Auteurstype';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Datum';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Datummodus';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Kies een datum';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link hostnaam';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Bestandsnaam bevat';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Bestandsextensie';

  @override
  String get channelDetailsSearchContentPoll => 'Poll';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Berichten met een peiling';

  @override
  String get channelDetailsSearchContentForward => 'Doorsturen';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Doorgestuurde berichten';

  @override
  String get channelDetailsSearchFilterSort => 'Sorteren';

  @override
  String get channelHeaderSearchFiltersTitle => 'Zoekfilters';

  @override
  String get channelHeaderSearchRecentTitle => 'Recente zoekopdrachten';

  @override
  String get channelHeaderSearchUsersTitle => 'Gebruikers';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanalen';

  @override
  String get channelHeaderSearchValuesTitle => 'Waarden';

  @override
  String get channelHeaderSearchDatesTitle => 'Datums';

  @override
  String get channelHeaderSearchDefaultBadge => 'Standaard';

  @override
  String get channelHeaderSearchClearHistory => 'Wissen';

  @override
  String get channelHeaderSearchFilterDescFrom => 'een gebruiker';

  @override
  String get channelHeaderSearchFilterDescMentions => 'een gebruiker';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, embed, afbeelding, video, geluid, bestand, sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'een datum of datumbereik';

  @override
  String get channelHeaderSearchFilterDescOn => 'een datum of datumbereik';

  @override
  String get channelHeaderSearchFilterDescDuring => 'een datum of datumbereik';

  @override
  String get channelHeaderSearchFilterDescAfter => 'een datum of datumbereik';

  @override
  String get channelHeaderSearchFilterDescIn => 'een kanaal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'waar of niet waar';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'gebruiker, bot of webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'een hostnaam, bijv. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'onderdeel van een bestandsnaam van een bijlage';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'een bestandsextensie, bijv. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'tijdstempel of relevantie';

  @override
  String get channelHeaderSearchFilterDescOrder => 'oplopend of aflopend';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString resultaten',
      one: '1 result',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filteren op gebruiker';

  @override
  String get channelDetailsSearchFilterByContent => 'Filteren op inhoud';

  @override
  String get channelDetailsSearchSortBy => 'Resultaten sorteren op';

  @override
  String get channelDetailsSearchIn => 'Zoeken in';

  @override
  String get channelDetailsSearchEmptyTitle => 'Zoek in dit gesprek';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Voer tekst, een auteur of een filter in om berichten te zoeken.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'Berichten worden geïndexeerd';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Probeer het later opnieuw zodra de zoekfunctie klaar is met het indexeren van dit bereik.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Geen resultaten';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Probeer andere zoektermen of filters.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

  @override
  String get channelDetailsMemberYou => 'Jij';

  @override
  String get channelDetailsSearchUsersHint => 'Gebruikers zoeken';

  @override
  String get channelDetailsSearchUsersTypeToSearch => 'Typ om leden te zoeken';

  @override
  String get channelDetailsSearchUsersEmpty => 'Geen gebruikers gevonden';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Geen gebruikers beschikbaar';

  @override
  String get channelDetailsDone => 'Klaar';

  @override
  String get channelDetailsHasFilterPrompt => 'Toon berichten die bevatten:';

  @override
  String get channelDetailsRetry => 'Opnieuw proberen';

  @override
  String get channelDetailsPinnedMessageTitle => 'Vastgezet bericht';

  @override
  String get channelDetailsSearchResultTitle => 'Zoekresultaat';

  @override
  String get channelDetailsJumpToMessage => 'Ga naar bericht';

  @override
  String get channelDetailsUnpinMessage => 'Bericht losmaken';

  @override
  String get channelDetailsCopyMessageLink => 'Link van bericht kopiëren';

  @override
  String get channelDetailsCopyMessageId => 'Bericht-ID kopiëren';

  @override
  String get channelDetailsMessageUnpinned => 'Bericht niet meer vastgezet';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Huidige community';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Huidige DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Alle communities';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Alleen alle DM\'s';

  @override
  String get channelDetailsSearchScopeAllDms => 'Alle DM\'s';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Alleen geopende DM\'s';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Geopende DM\'s';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Alle DM\'s + communities';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Geopende DM\'s + communities';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Alleen zoeken in deze community';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Alleen zoeken in dit gesprek';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'In alle communities waar je lid van bent';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Alleen in alle DM\'s waar je ooit in hebt gezeten';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'In alle DM\'s waar je ooit in hebt gezeten';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'In al je openstaande privéberichten';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'In al je openstaande persoonlijke chats';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'In al je privéchats en alle communities waar je nu lid van bent';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'In al je openstaande privéberichten + alle communities waar je lid van bent';

  @override
  String get channelDetailsSearchSortNewest => 'Nieuwste eerst';

  @override
  String get channelDetailsSearchSortOldest => 'Oudste eerst';

  @override
  String get channelDetailsSearchSortRelevance => 'Meest relevant';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Toon nieuwste berichten eerst';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Toon oudste berichten eerst';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Toon meest relevante berichten eerst';

  @override
  String get channelDetailsSearchContentImage => 'Afbeelding uploaden';

  @override
  String get channelDetailsSearchContentVideo => 'Video uploaden';

  @override
  String get channelDetailsSearchContentAudio => 'Audio uploaden';

  @override
  String get channelDetailsSearchContentFile => 'Bestand uploaden';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Linkvoorbeeld of ingesloten inhoud';

  @override
  String get channelDetailsSearchContentSticker => 'Sticker';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Alleen geüploade afbeeldingsbestanden';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Alleen geüploade videobestanden';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Alleen geüploade audiobestanden';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Elke geüploade bijlage';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Getypte URL in het bericht';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Opgehaalde voorbeelden en ingesloten inhoud, geen uploads';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker aan het bericht toegevoegd';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count typen';
  }

  @override
  String get personalNotesTitle => 'Persoonlijke notities';

  @override
  String get personalNotesSubtitle =>
      'Jouw privéruimte voor gedachten en herinneringen';

  @override
  String groupDmWelcome(String displayName) {
    return 'Welkom bij $displayName. Voeg vrienden toe om de groep op gang te brengen.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Groep bewerken';

  @override
  String get groupDmWelcomeAddFriends => 'Vrienden toevoegen aan groep';

  @override
  String get dmGroupInvites => 'Uitnodigingen';

  @override
  String get groupDmEditTitle => 'Groep bewerken';

  @override
  String get groupDmGroupName => 'Groepsnaam';

  @override
  String get groupDmMyGroup => 'Mijn groep';

  @override
  String get groupDmGroupNameMaxLength =>
      'Groepsnaam mag niet langer zijn dan 100 tekens';

  @override
  String get groupDmGroupIcon => 'Groepspictogram';

  @override
  String get groupDmUploadIcon => 'Pictogram uploaden';

  @override
  String get groupDmChangeIcon => 'Pictogram wijzigen';

  @override
  String get groupDmRemoveIcon => 'Pictogram verwijderen';

  @override
  String get groupDmUpdated => 'Groep bijgewerkt';

  @override
  String get groupDmUpdateFailed =>
      'Kon de groep niet bijwerken. Probeer het opnieuw.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Geanimeerde pictogrammen worden niet ondersteund. Gebruik een statische afbeelding.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Geanimeerde pictogrammen worden niet ondersteund';

  @override
  String get groupDmIconFileTooLargeTitle => 'Pictogrambestand is te groot';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Het pictogrambestand is te groot. Kies een bestand dat kleiner is dan $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat =>
      'Niet-ondersteund pictogramformaat';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Niet-ondersteund bestandstype.';

  @override
  String get groupDmInvalidImage => 'Ongeldige afbeelding';

  @override
  String get groupDmInvalidImageBody =>
      'Deze afbeelding is ongeldig. Probeer een andere.';

  @override
  String get groupDmAddFriends => 'Toevoegen';

  @override
  String get groupDmOrSendInvite => 'of stuur een uitnodiging naar een vriend:';

  @override
  String get groupDmGenerateInviteLink => 'Uitnodigingslink genereren';

  @override
  String get groupDmCreateInvite => 'Maken';

  @override
  String get groupDmInviteExpires24Hours =>
      'Je uitnodiging verloopt over 24 uur';

  @override
  String get groupDmAddFriendFailed =>
      'Deze vriend kon niet aan de groep worden toegevoegd. Probeer het opnieuw.';

  @override
  String get groupDmGroupFull =>
      'Deze groep is vol. Verwijder iemand voordat je meer mensen toevoegt.';

  @override
  String get groupDmRateLimited =>
      'Je gaat te snel. Wacht even en probeer het opnieuw.';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Kon geen uitnodigingslink genereren. Probeer het opnieuw.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Kon geen uitnodigingslink maken. Probeer het opnieuw.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Je hebt geen toestemming om een uitnodiging aan te maken in dit kanaal.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Deze community heeft de maximale hoeveelheid uitnodigingen bereikt.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Het aanmaken van uitnodigingen is tijdelijk uitgeschakeld voor deze community.';

  @override
  String get groupDmCopyInviteFailed => 'Uitnodigingslink kopiëren mislukt';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Alleen de groepseigenaar kan uitnodigingen beheren.';

  @override
  String get groupDmNoInvitesCreated => 'Nog geen uitnodigingen aangemaakt';

  @override
  String get groupDmLoadingInvites => 'Uitnodigingen laden...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Uitnodigingen laden mislukt. Probeer het opnieuw.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Deze uitnodiging intrekken? Kan niet ongedaan worden gemaakt.';

  @override
  String get groupDmInviteRevoked => 'Uitnodiging ingetrokken';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Gemaakt door $name. Vervalt over $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Welkom bij $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'In het begin was er niets. Toen was er $channelName. En het was goed.';
  }

  @override
  String get personalNotesComposerHint => 'Stuur jezelf een bericht';

  @override
  String channelComposerHint(String channelName) {
    return 'Bericht naar #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Bericht aan @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Bericht naar $groupName';
  }

  @override
  String get groupDmComposerHint => 'Berichtengroep';

  @override
  String get composerHint => 'Bericht';

  @override
  String get composerOpenExpressionPicker => 'Open expressiekiezer';

  @override
  String get composerShowKeyboard => 'Toetsenbord tonen';

  @override
  String get composerCloseAttachmentPanel => 'Sluit bijlagekiezer';

  @override
  String get chatAttachmentPanelPhotos => 'Foto\'s';

  @override
  String get chatAttachmentPanelFiles => 'Bestanden';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Toegang tot fotobibliotheek nodig';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Sta toegang tot de fotobibliotheek toe om recente foto\'s en video\'s te bekijken en bij te voegen.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Instellingen openen';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', verzenden';

  @override
  String get messageAccessibilityFailedSuffix => ', kon niet worden verzonden';

  @override
  String get messageAccessibilityAttachmentSummary => 'een bijlage';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count bijlagen';
  }

  @override
  String get messageAccessibilityImageSummary => 'een afbeelding';

  @override
  String get messageAccessibilityVideoSummary => 'een video';

  @override
  String get messageAccessibilityAudioSummary => 'een audiobestand';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'bestand $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'een spoilerbijlage';

  @override
  String get messageAccessibilityEmbedSummary => 'een embed';

  @override
  String get messageAccessibilityEmptySummary => 'een bericht';

  @override
  String get personalNotesPrivateSpace => 'Jouw privéruimte';

  @override
  String get purgePersonalNotes => 'Persoonlijke notities opschonen';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Dit verwijdert permanent alle berichten en bijlagen in je persoonlijke notities. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get purgePersonalNotesConfirmButton => 'Leegmaken';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count berichten uit persoonlijke notities verwijderd';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Persoonlijke notities waren al leeg';

  @override
  String get purgePersonalNotesFailed =>
      'Persoonlijke notities konden niet worden gewist';

  @override
  String get userSettingsGroupYourAccount => 'JE ACCOUNT';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Instellingen doorzoeken...';

  @override
  String get userSettingsSearchClear => 'Zoekopdracht wissen';

  @override
  String get userSettingsSearchNoResults => 'Geen instellingen gevonden';

  @override
  String get userSettingsNavProfile => 'Profiel';

  @override
  String get userSettingsNavSecurityLogin => 'Beveiliging en aanmelding';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Cadeaus';

  @override
  String get giftSettingsClaimAccountTitle =>
      'Voltooi de registratie van je account';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Claim je account om Plutonium-cadeaucodes in te wisselen of te beheren.';

  @override
  String get giftSettingsRedeemTitle => 'Cadeau inwisselen';

  @override
  String get giftSettingsRedeemDescription =>
      'Voer een cadeauboncode in om Plutonium voor je account te verzilveren.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Cadeaucode invoeren…';

  @override
  String get giftSettingsRedeemButton => 'Inwisselen';

  @override
  String get giftSettingsRedeemSuccess =>
      'Cadeau succesvol ingewisseld. Veel plezier met je Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Gekochte cadeaus';

  @override
  String get giftSettingsPurchasedDescription =>
      'Beheer je gekochte Plutonium-cadeaucodes. Deel de cadeaulink met iemand speciaal of wissel hem zelf in!';

  @override
  String get giftSettingsEmptyTitle => 'Nog geen cadeaus';

  @override
  String get giftSettingsEmptyDescription =>
      'Koop een Plutonium-cadeau vanuit het tabblad Plutonium om te delen met vrienden.';

  @override
  String get giftSettingsGoToPlutonium => 'Ga naar Plutonium';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Laden van cadeau-inventaris mislukt';

  @override
  String get giftSettingsLoadFailedDescription => 'Probeer het later opnieuw.';

  @override
  String get giftSettingsTryAgain => 'Opnieuw proberen';

  @override
  String get giftSettingsGiftUrl => 'Cadeau-URL';

  @override
  String get giftSettingsCopy => 'Kopiëren';

  @override
  String get giftSettingsCopied => 'Gekopieerd';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Gekocht op $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Ingelost $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Inwisseld door $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Dit cadeau is al ingewisseld';

  @override
  String get giftSettingsRedeemForYourself => 'Voor jezelf inwisselen';

  @override
  String get giftSettingsShareWithFriend => 'Delen met een vriend';

  @override
  String get premiumPlutoniumTagline =>
      'Ontgrendel hogere limieten en exclusieve functies, en steun tegelijkertijd een onafhankelijk communicatieplatform.';

  @override
  String get premiumPurchaseMode => 'Aankoopmodus';

  @override
  String get premiumForMe => 'Voor mij';

  @override
  String get premiumAsAGift => 'Als cadeau';

  @override
  String get premiumMonthly => 'Maandelijks';

  @override
  String get premiumYearly => 'Jaarlijks';

  @override
  String get premiumPerMonth => 'per maand';

  @override
  String get premiumPerYear => 'per jaar';

  @override
  String get premiumOneTimePurchase => 'eenmalige aankoop';

  @override
  String get premiumSave17 => 'Bespaar 17%';

  @override
  String get premiumUpgradeNow => 'Nu upgraden';

  @override
  String get premiumBuyGift => 'Cadeau kopen';

  @override
  String get premiumOneYearGift => 'Cadeau voor 1 jaar';

  @override
  String get premiumOneMonthGift => 'Cadeau van 1 maand';

  @override
  String get premiumScrollPrompt =>
      'Scroll omlaag om alle voordelen van Plutonium te bekijken';

  @override
  String get premiumFreeVsPlutonium => 'Gratis versus Plutonium';

  @override
  String get premiumFreeColumn => 'Gratis';

  @override
  String get premiumGiftSectionTitle => 'Plutonium cadeau geven';

  @override
  String get premiumGiftSectionDescription =>
      'Deel de Plutonium-ervaring met je vrienden door een cadeauabonnement te kopen.';

  @override
  String get premiumGiftBannerOne =>
      'Je hebt een nieuwe cadeaubon die op je wacht!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Je hebt $count nieuwe cadeaucodes die op je wachten!';
  }

  @override
  String get premiumViewGifts => 'Cadeaus bekijken';

  @override
  String get premiumReadyToUpgrade => 'Klaar om te upgraden?';

  @override
  String get premiumReadyToBuyGift => 'Cadeau kopen?';

  @override
  String get premiumManageSubscription => 'Abonnement beheren';

  @override
  String get premiumRedeemGiftCode => 'Cadeaucode inwisselen';

  @override
  String get premiumGiftBadge => 'Cadeau';

  @override
  String get premiumCancelSubscriptionTitle => 'Abonnement opzeggen?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Je behoudt je voordelen tot je volgende verlengingsdatum, daarna heb je een respijtperiode van 3 dagen om je opnieuw te abonneren en je abonnementsgeschiedenis te behouden.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Abonnement opzeggen';

  @override
  String get premiumPurchaseHistoryTitle => 'Aankoopgeschiedenis';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Je recente facturen. Om de betaalmethode voor je abonnement te wijzigen, voeg je er een toe of kies je er een in de facturatieportal en stel je deze in als standaard.';

  @override
  String get premiumManagePaymentMethods => 'Betaalmethoden beheren';

  @override
  String get premiumSelfServeRefundButton => 'Laatste aankoop terugbetalen';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Door te kopen, ga je akkoord met onze ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Door te kopen, ging u akkoord met onze ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' en ';

  @override
  String premiumActiveUntil(String date) {
    return 'Actief tot $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Opzegging gepland';

  @override
  String premiumCancelsOn(String date) {
    return 'Annuleringen op $date. Voordelen blijven actief tot dan.';
  }

  @override
  String get premiumReactivateSubscription => 'Opnieuw activeren';

  @override
  String premiumGiftedUntil(String date) {
    return 'Cadeau tot $date. Wordt niet automatisch verlengd.';
  }

  @override
  String get premiumGiftGraceEnded =>
      'Je cadeautijd is verlopen. Abonneer je om Plutonium te behouden.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Je wordt nu gefactureerd. Je resterende cadeautijd wordt toegevoegd na je betaalde periode, zodat je niets verliest.';

  @override
  String get premiumComparisonFeatureColumn => 'Functie';

  @override
  String get premiumDisclaimerRefund =>
      'Je kunt binnen 3 dagen na betaling zelf een terugbetaling aanvragen, maximaal eens per 30 dagen. Een terugbetaling van een abonnement beëindigt dat abonnement. Kopers uit de EU/EER doen bij het afrekenen afstand van het herroepingsrecht van 14 dagen om direct toegang te krijgen tot de inhoud. Gebruik de terugbetalingsknop in de app in plaats van een chargeback. Chargebacks kunnen tot permanente beperkingen van je account leiden. Stripe verwerkt betalingen veilig. Wij zien nooit je volledige kaartnummer.';

  @override
  String get premiumTermsOfService => 'Gebruiksvoorwaarden';

  @override
  String get premiumPrivacyPolicy => 'Privacybeleid';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Afrekenen kon niet worden gestart';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Er is iets misgegaan bij het starten van de betaling. Probeer het over een ogenblik opnieuw.';

  @override
  String get premiumPlanUnavailable =>
      'Dit abonnement is niet beschikbaar. Neem contact op met de ondersteuning.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Dit abonnement is niet beschikbaar. Neem contact op met de beheerders van deze instantie.';

  @override
  String get premiumCompletePaymentTitle => 'Betaling afronden';

  @override
  String get premiumCompletePaymentBody =>
      'Je wordt nu doorgestuurd naar Stripe om de betaling te voltooien. Keer terug naar Fluxer zodra je dit hebt gedaan.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Kies betaalmethode';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Betaal met automatische Pix om terugkerende kosten rechtstreeks vanaf uw Braziliaanse bank te autoriseren. Of kies \'kaart gebruiken\' om een creditcard in te voeren op het volgende scherm van Stripe.';

  @override
  String get premiumUsePix => 'Gebruik Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Betaal met UPI om een RBI-conform e-mandaat van uw Indiase bank in te stellen. Of kies kaart gebruiken om een creditcard in te voeren op het volgende scherm van Stripe.';

  @override
  String get premiumUseUpi => 'Gebruik UPI';

  @override
  String get premiumUseCard => 'Kaart gebruiken';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Het factureringsportaal kon niet worden geopend';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Er is iets misgegaan bij het openen van het factureringsportaal. Probeer het zo meteen opnieuw.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Je bent al Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary bevat al permanente toegang, dus een terugkerend abonnement is niet nodig. Je kunt nog steeds cadeaus kopen voor anderen.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abonnement bestaat al';

  @override
  String get premiumExistingSubscriptionBody =>
      'We hebben een bestaand Fluxer Plutonium-abonnement voor dit account gevonden. Beheer het in het beveiligde factureringsportaal om betalingsgegevens bij te werken of de verlengingsstatus te controleren. Als je net hebt betaald, wacht dan een minuut en open deze pagina opnieuw.';

  @override
  String get premiumPurchasesDisabledTitle => 'Aankopen niet beschikbaar';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'Aankopen zijn uitgeschakeld voor dit account. Neem contact op met $supportEmail als dit onjuist lijkt.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'Aankopen zijn uitgeschakeld voor dit account. Neem contact op met de beheerders van deze instantie als dit onjuist lijkt.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Claim je account om Fluxer Plutonium te kopen.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Je moet je e-mailadres verifiëren voordat je Fluxer Plutonium kunt kopen.';

  @override
  String get premiumPerkCommunities => 'Communities';

  @override
  String get premiumPerkMessageCharacterLimit => 'Tekenlimiet voor berichten';

  @override
  String get premiumPerkBookmarkedMessages => 'Opgeslagen berichten';

  @override
  String get premiumPerkFileUploadSize => 'Grootte van bestandsupload';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Geanimeerde emoji\'s gebruiken';

  @override
  String get premiumPerkVideoQuality => 'Videokwaliteit';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Geanimeerde avatars en profielbanners';

  @override
  String get premiumPerkEarlyAccess => 'Vroege toegang tot nieuwe functies';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Tot 4K/60 FPS';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly of $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/mnd';

  @override
  String get storePlutoniumYearSuffix => '/jr';

  @override
  String get storePlutoniumPriceOr => 'of';

  @override
  String get storePlutoniumEmojiTitle => 'Jouw emoji\'s, overal';

  @override
  String get storePlutoniumEmojiBody =>
      'Gebruik aangepaste emoji\'s en stickers van al je communities in elke chat en community waar je lid van bent.';

  @override
  String get storePlutoniumProfileTitle => 'Een profiel dat opvalt';

  @override
  String get storePlutoniumProfileBody =>
      'Krijg een geanimeerde avatar en banner, een abonneebadge, de viercijferige tag die je wilt achter je gebruikersnaam*, en een apart profiel voor elke community.';

  @override
  String get storePlutoniumFilesTitle => 'Verstuur bestanden tot 500 MB';

  @override
  String get storePlutoniumFilesBody =>
      'Deel video\'s van volledige lengte en grote bestanden zonder ze eerst te verkleinen. Gratis accounts kunnen tot 25 MB verzenden.';

  @override
  String get storePlutoniumCompareTitle => 'Vergelijk Gratis en Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Niet al deze functies zijn beschikbaar in de mobiele app. Sommige zijn alleen beschikbaar op desktop.';

  @override
  String get storePlutoniumNotAvailable => 'Niet beschikbaar';

  @override
  String get storePlutoniumAvailable => 'Beschikbaar';

  @override
  String get storePlutoniumCompareTag =>
      'Kies het 4-cijferige nummer na je gebruikersnaam*';

  @override
  String get storePlutoniumCompareProfile =>
      'Een apart profiel voor elke community';

  @override
  String get storePlutoniumCompareBadge => 'Abonnee-badge op je profiel';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Achtergronden voor videogesprekken die je kunt opslaan';

  @override
  String get storePlutoniumCompareCommunities =>
      'Communities waar je lid van kunt worden';

  @override
  String get storePlutoniumCompareCharacters => 'Tekens in één bericht';

  @override
  String get storePlutoniumCompareBookmarks => 'Berichten die je kunt opslaan';

  @override
  String get storePlutoniumCompareUpload =>
      'Grootste bestand dat je kunt uploaden';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Media die je kunt bewaren voor later';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Gebruik geanimeerde emoji\'s in berichten';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Gebruik aangepaste emoji\'s en stickers in elke community';

  @override
  String get storePlutoniumCompareVideo =>
      'Kwaliteit videogesprek en scherm delen';

  @override
  String get storePlutoniumCompareAvatar =>
      'Geanimeerde avatar en profielbanner';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Vroege toegang tot nieuwe functies';

  @override
  String get storePlutoniumCompareThemes => 'Aangepaste thema\'s voor de app';

  @override
  String get storePlutoniumVideoFree => 'Tot 720p bij 30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => 'Tot 4K bij 60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      'Je kunt alleen een tag kiezen die niemand anders met dezelfde gebruikersnaam al heeft. Gebruikersnamen zijn niet hoofdlettergevoelig, dus Mina#4821 en mina#4821 tellen als hetzelfde. De #0000-tag is gereserveerd voor Fluxer Visionary-leden.';

  @override
  String get storePlutoniumLearnVisionary => 'Meer informatie over Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Wil je de open-sourceontwikkeling van Fluxer gewoon steunen? ';

  @override
  String get storePlutoniumDonateLink => 'Doneer in plaats daarvan.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Een abonnement financiert Fluxer en ontgrendelt';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Aangepaste emoji en stickers in elke chat';

  @override
  String get storePlutoniumHighlightProfile =>
      'Geanimeerd profiel, badge en aangepast 4-cijferig nummer';

  @override
  String get storePlutoniumHighlightFiles => 'Uploads tot 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'Verzend berichten tot 4.000 tekens';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Een apart profiel voor elke community';

  @override
  String get storePlutoniumHighlightsMore => 'En meer';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Wordt automatisch verlengd via Google Play totdat je opzegt.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Wordt automatisch verlengd via de App Store totdat je opzegt.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Je hebt al een Fluxer Plutonium-abonnement.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Bespaar $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'Aankoop ontvangen. Plutonium verschijnt hier zodra het is geactiveerd.';

  @override
  String get storePlutoniumUnavailable =>
      'Abonnementen in de app zijn nog niet beschikbaar op dit apparaat.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary omvat al permanente toegang, dus een terugkerend abonnement is niet nodig.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Privacy Dashboard';

  @override
  String get userSettingsNavAuthorizedApps => 'Geautoriseerde apps';

  @override
  String get userSettingsNavBlockedUsers => 'Geblokkeerde gebruikers';

  @override
  String get userSettingsNavLinkedDevices => 'Gekoppelde apparaten';

  @override
  String get userSettingsNavConnections => 'Verbindingen';

  @override
  String get userSettingsNavLookAndFeel => 'Uiterlijk';

  @override
  String get userSettingsNavAccessibility => 'Toegankelijkheid';

  @override
  String get userSettingsNavChat => 'Chat';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio en video';

  @override
  String get userSettingsNavShortcuts => 'Sneltoetsen';

  @override
  String get audioAndVideoAudioSectionTitle => 'Audio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Configureer je microfoon, luidsprekers en stemverwerking.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Configureer de kwaliteit van je camera en scherm delen.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'Gedrag in gesprek';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Bevestigingsprompts tijdens spraak- en videogesprekken.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Invoerapparaat';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Uitvoerapparaat';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Standaard';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Gebruik luidspreker';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Als het uit staat, wordt audio afgespeeld via de oortelefoon of aangesloten koptelefoon.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Invoervolume';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Uitvoervolume';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Spraakverwerking';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Stemfocus';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Aanbevolen. Verbetert je microfoongeluid voor duidelijke spraak.';

  @override
  String get audioAndVideoDirectInputLabel => 'Directe invoer';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Verstuurt je audio onbewerkt. Het beste als je externe audiosoftware gebruikt.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Aangepast';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Pas elke instelling zelf aan: ruisonderdrukking, echo-onderdrukking en versterking.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Ruisonderdrukking';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Verbeterd';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standaard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Geen';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Echo-onderdrukking';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatische versterkingsregeling';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Regelt het microfoonvolume. Uitgeschakeld wanneer verbeterde onderdrukking is ingeschakeld.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Microfoontest';

  @override
  String get audioAndVideoMicTestStartLabel => 'Microfoontest starten';

  @override
  String get audioAndVideoMicTestStopLabel => 'Microfoontest stoppen';

  @override
  String get audioAndVideoCameraLabel => 'Camera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Camera spiegelen';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Camerakwaliteit';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Kwaliteit scherm delen';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Beeldsnelheid';

  @override
  String get audioAndVideoFrameRate15Label => '15 beelden/sec';

  @override
  String get audioAndVideoFrameRate30Label => '30 fps';

  @override
  String get audioAndVideoFrameRate60Label => '60 fps';

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Dit exemplaar staat momenteel scherm delen toe tot 720p met 30 FPS.';

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Niet vragen als ik mijn camera verberg';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Niet vragen bij het verbergen van mijn schermdeling';

  @override
  String get userSettingsNavNotifications => 'Meldingen';

  @override
  String get notificationsGeneralSectionTitle => 'Algemeen';

  @override
  String get notificationsEnableNotificationsLabel => 'Meldingen inschakelen';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Ontvang meldingen wanneer je berichten ontvangt. Mogelijk moet je meldingen voor $productName toestaan in de instellingen van je apparaat. Voor meldingen per kanaal/community open je de meldingsinstellingen via het menu van een community.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Desktopmeldingen inschakelen';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Gebruikt het meldingencentrum van het besturingssysteem. Klik voor instellingen per kanaal of community met de rechtermuisknop op een communitypictogram en open de meldingsinstellingen.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Time-out voor pushmeldingen (inactief)';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName stuurt geen pushmeldingen naar je mobiele apparaten zolang je actief bent op je computer. Kies hoelang je op je computer inactief moet zijn voordat je pushmeldingen ontvangt.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minuut';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minuten';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Vermeldingsvoorkeur';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Voorkeur voor vermeldingen in antwoorden';

  @override
  String get notificationsMentionNoPreferenceName => 'Geen voorkeur';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respecteer de intentie van de afzender, zonder waarschuwing wanneer die de @-vermelding aan- of uitzet';

  @override
  String get notificationsMentionPreferMentionName =>
      'Voorkeur voor @vermeldingen';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Je standaard @vermelden in antwoorden en de afzender waarschuwen als die dit uitschakelt';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Voorkeur voor geen @vermelding';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'De @vermelding standaard weglaten uit antwoorden en de afzender waarschuwen als die deze inschakelt';

  @override
  String get notificationsTtsSectionTitle => 'Tekst-naar-spraakmeldingen';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Spraakweergave inschakelen voor /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Laat /tts je bericht voorlezen. Als je de instelling uitschakelt, blijven deze commando\'s als normale tekst zichtbaar.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Pas afspeelsnelheid aan in ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Toegankelijkheid';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Berichten automatisch voorlezen';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Zet binnenkomende inhoud om in spraak, ongeacht of deze met /tts is verstuurd.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Elk kanaal';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Laat elk binnenkomend bericht voorlezen, ongeacht welk kanaal je hebt geopend.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Alleen actief kanaal';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Leest alleen het kanaal voor dat je bekijkt. De voorleesfunctie volgt je tussen kanalen.';

  @override
  String get notificationsTtsModeNeverName => 'Nooit automatisch';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Blijf stil, tenzij iemand handmatig /tts uitvoert.';

  @override
  String get notificationsTtsModeAriaLabel => 'Alle berichten hardop voorlezen';

  @override
  String get notificationsSoundsSectionTitle => 'Geluiden';

  @override
  String get notificationsMasterVolumeLabel => 'Hoofdvolume';

  @override
  String get notificationsMasterVolumeDescription =>
      'Stelt het volume in voor elk geluidseffect. Individuele geluidsinstellingen negeren dit.';

  @override
  String get notificationsResetToDefaultVolume => 'Standaardvolume herstellen';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Alle meldingsgeluiden uitschakelen';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Je bestaande instellingen voor meldingsgeluiden blijven behouden.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Meer geluidseffecten weergeven';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Minder geluidseffecten weergeven';

  @override
  String get notificationsPreviewSound => 'Geluid beluisteren';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volume per geluid';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Stel aangepaste volumes in voor individuele geluiden. Geluiden zonder een eigen volume volgen het hoofdvolume.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Actieve aangepaste geluidsvolume-instellingen: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Volgen van hoofd • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Stel $label opnieuw in op hoofdvolume';
  }

  @override
  String get notificationsResetAllOverrides => 'Alle aangepaste waarden wissen';

  @override
  String notificationsMuteSound(String label) {
    return '$label dempen';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Dempen opheffen voor $label';
  }

  @override
  String get notificationsSoundMessage => 'Meldingen voor communityberichten';

  @override
  String get notificationsSoundDirectMessage =>
      'Meldingen voor directe berichten';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Meldingen voor berichten in dit kanaal';

  @override
  String get notificationsSoundMute => 'Microfoon dempen';

  @override
  String get notificationsSoundUnmute => 'Microfoon inschakelen';

  @override
  String get notificationsSoundDeaf => 'Geluid uitschakelen';

  @override
  String get notificationsSoundUndeaf => 'Geluid inschakelen';

  @override
  String get notificationsSoundUserJoin => 'Gebruiker betreedt kanaal';

  @override
  String get notificationsSoundUserLeave => 'Gebruiker verlaat kanaal';

  @override
  String get notificationsSoundUserMove => 'Gebruiker heeft kanaal verplaatst';

  @override
  String get notificationsSoundViewerJoin => 'Kijker is bij de stream gekomen';

  @override
  String get notificationsSoundViewerLeave => 'Kijker verlaat stream';

  @override
  String get notificationsSoundVoiceDisconnect => 'Spraakverbinding verbroken';

  @override
  String get notificationsSoundIncomingRing => 'Inkomende oproep';

  @override
  String get notificationsSoundCameraOn => 'Camera aan';

  @override
  String get notificationsSoundCameraOff => 'Camera uit';

  @override
  String get notificationsSoundScreenShareStart => 'Scherm delen starten';

  @override
  String get notificationsSoundScreenShareStop => 'Scherm delen stoppen';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Kon pushmelding-time-out niet bijwerken. Probeer het opnieuw.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Kon voorkeursinstellingen voor vermeldingen niet bijwerken. Probeer het opnieuw.';

  @override
  String get notificationsPermissionDeniedTitle => 'Meldingen geblokkeerd';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Meldingen inschakelen mislukt. Sta meldingen toe om door te gaan.';

  @override
  String get notificationsPushRelaySectionTitle => 'Relay voor pushmeldingen';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider levert pushmeldingen alleen via de eigen dienst, dus meldingen voor dit apparaat gaan via de Fluxer-relay.';
  }

  @override
  String get notificationsPushRelayConsentLabel => 'Fluxer-pushrelay gebruiken';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Als je dit uitschakelt, wordt de pushregistratie van dit apparaat verwijderd en ontvangt het geen pushmeldingen meer.';

  @override
  String get pushRelayConsentTitle => 'Relay voor pushmeldingen';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider levert pushmeldingen alleen via de eigen dienst, dus meldingen voor dit apparaat gaan via de Fluxer-relay.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Ga akkoord met de ';

  @override
  String get pushRelayConsentNoticeLink =>
      'privacyverklaring voor de pushrelay';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' om pushmeldingen op dit apparaat in te schakelen. Je hoeft maar één keer per apparaat akkoord te gaan.';

  @override
  String get pushRelayConsentAgree => 'Akkoord en doorgaan';

  @override
  String get pushRelayConsentDecline => 'Niet nu';

  @override
  String get userSettingsNavLanguageAndTime => 'Taal en tijd';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Interfacetaal';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Kies de taal die in de app wordt gebruikt';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Tijdnotatie';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Kies hoe tijden worden weergegeven in de app';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Tijdnotatie selecteren';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automatisch';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-uurs';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-uurs';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Tijdnotatie van de apptaal: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Tijdnotatie van het systeem: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Systeeminstellingen gebruiken voor tijdnotatie';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Kon de tijdnotatie niet bijwerken';

  @override
  String get userSettingsNavDefaultApps => 'Standaard-apps';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Webbrowser';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Kies welke browser wordt geopend als je op een link tikt.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Als een app voor een site is geïnstalleerd, worden koppelingen eerst in die app geopend.';

  @override
  String get defaultAppsWebBrowserInApp => 'In-app browser';

  @override
  String get defaultAppsWebBrowserExternal => 'Externe browser';

  @override
  String get userSettingsNavAppIcon => 'App-pictogram';

  @override
  String get appIconSectionTitle => 'App-pictogram';

  @override
  String get appIconSectionDescription =>
      'Kies welk pictogram op je beginscherm verschijnt.';

  @override
  String get appIconOptionDefault => 'Standaard';

  @override
  String get appIconOptionStarfield => 'Sterrenveld';

  @override
  String get appIconOptionSweden => 'Zweden';

  @override
  String get appIconUnsupported =>
      'Het wijzigen van het app-icoon is niet beschikbaar op dit apparaat.';

  @override
  String get userSettingsNavAdvanced => 'Geavanceerd';

  @override
  String get advancedPerformanceReportingTitle => 'Prestatierapportage';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Help $productName verbeteren door anonieme crash- en prestatiestatistieken te delen.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Verstuur crash- en prestatierapporten';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Alle gerapporteerde gegevens zijn anoniem en worden alleen naar de eigen monitoringdienst van $productName gestuurd — er worden geen externe providers gebruikt.';
  }

  @override
  String get advancedSettingsConfigure => 'Configureren';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacy';

  @override
  String get advancedSettingsCategoryAppearance => 'Uiterlijk';

  @override
  String get advancedSettingsCategoryAccessibility => 'Toegankelijkheid';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Spraak';

  @override
  String get advancedSettingsCategoryDeveloper => 'Ontwikkelaar';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Tekstselectie inschakelen';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Sta tekstselectie in de app toe';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Miniatuurvoorbeelden op de videotijdlijn inschakelen';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatuur of actueel beeld tijdens het spoelen door video';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptische feedback';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Trillingsfeedback voor tikken en acties. Wordt niet gesynchroniseerd met andere apparaten.';

  @override
  String get advancedSettingShowNekoLabel => 'Neko weergeven';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko-kat die je cursor achterna zit';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Neko tonen in je chatinvoer';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Splash zoom-animatie';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Zoom het logo uit bij het verlaten van het welkomstscherm';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Toetsenbordtips';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Sneltoetshints in tooltips';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Favorieten inschakelen';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Toon favorieten in de hele app';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Gedrag bij deelnemen aan spraakkanaal';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Bevestiging of dubbelklik bij deelname aan spraakkanalen in communities';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Dubbelklikken vereist om spraakkanalen te betreden';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Bevestigen voordat je deelneemt aan spraakkanalen';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'GIF\'s automatisch verzenden zodra je ze selecteert';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'GIF\'s automatisch verzenden vanuit de kiezer zonder bevestiging';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'GIF-favorieten opslaan als opgeslagen media';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Kies hoe GIF\'s die je met een ster als favoriet markeert worden opgeslagen';

  @override
  String get advancedSettingMediaButtonsLabel => 'Mediaknoppen';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Pas aan welke knoppen en indicatoren op mediabijlagen en ingesloten inhoud worden weergegeven';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Upload bestanden voordat je ze verzendt';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Begin direct na het toevoegen van bijlagen aan het invoerveld met het uploaden ervan';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Trackingparameters uit URL\'s verwijderen';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Trackingparameters automatisch verwijderen uit URL\'s in berichten die je verstuurt';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Alle externe links vertrouwen';

  @override
  String get advancedSettingSearchEnginesLabel => 'Zoekmachines';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configureer de zoekmachines die worden gebruikt voor geselecteerde tekst';

  @override
  String get advancedSettingTranslatorsLabel => 'Vertalers';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configureer de vertaalproviders die worden gebruikt voor geselecteerde tekst';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Omgekeerd zoeken op afbeeldingen';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Aanbieders van omgekeerd zoeken naar afbeeldingen';

  @override
  String get advancedSettingMessageActionBarLabel => 'Actiebalk voor berichten';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Pas de actiebalk aan die verschijnt wanneer je de muis over berichten beweegt';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Suggesties voor expressies';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Kies wat er verschijnt wanneer je een dubbele punt typt in het tekstvak';

  @override
  String get advancedSettingInputButtonsLabel => 'Knoppen voor berichtinvoer';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Kies welke knoppen er in het invoerveld voor berichten worden weergegeven';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Naar beneden scrollen bij het verzenden van een bericht';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Kies hoe de chat scrolt nadat je een bericht hebt verzonden';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Bevestiging voor \"Alles als gelezen markeren\" overslaan';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Markeer alle ongelezen inboxkanalen direct als gelezen, zonder om bevestiging te vragen';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Gedempte kanalen standaard verbergen';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Verberg kanalen die je hebt gedempt in communityzijbalken';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'GIF-indicator tonen';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Vervaldatum bijlagen tonen';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Verwijderknop tonen';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Downloadknop tonen';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Favorietknop tonen';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Knop voor het verbergen van ingesloten inhoud tonen';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Toon berichtenactiebalk';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Alleen meer-knop weergeven';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Snelle reacties tonen';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Uitvouwen met Shift inschakelen';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Standaardemoji\'s tonen in suggesties voor expressies';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Aangepaste emoji\'s tonen in suggesties voor expressies';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Toon stickers in suggesties voor expressies';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Opgeslagen media tonen in suggesties voor expressies';

  @override
  String get advancedSettingShowGifsButtonLabel => 'GIF-knop weergeven';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Mediaknop weergeven';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Stickerknop weergeven';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Toon emoji-knop';

  @override
  String get advancedSettingShowSendButtonLabel => 'Verzendknop tonen';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Meldingen over nieuwe apparaten tonen';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Om bevestiging vragen bij nieuwe audioapparaten';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Volumeregeling voor verbindingen';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Volumeregelaars voor deelnemers per apparaat tonen in spraakmenu’s';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Gedrag van voorbeelden bij schermdelen';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Gedrag van voorbeelden, aparte vensters en streamminiaturen';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Codec voor scherm delen';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Videocodec voor scherm delen';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatisch (aanbevolen)';

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
      'Voorbeeld van mijn gedeelde scherm op de achtergrond pauzeren';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Miniatuur van mijn streamvoorbeeld verbergen';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Ontwikkelaarsmodus inschakelen';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Ontwikkelaarsmodus inschakelen';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Standaard zoekmachine';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Kies welke zoekmachine standaard wordt gebruikt bij het zoeken naar geselecteerde tekst.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Ingebouwde zoekmachines';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Schakel ingebouwde zoekmachines in of uit. Ingeschakelde zoekmachines verschijnen in het contextmenu van berichten wanneer tekst is geselecteerd.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Aangepaste zoekmachines';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Voeg je eigen zoekmachines toe met een aangepast URL-patroon. Gebruik \'$query\' als placeholder voor de zoektekst.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Zoekmachine toevoegen';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Schakel hieronder ten minste één zoekmachine in.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Zoekmachine verwijderen';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Standaard vertaler';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Kies welke vertaler standaard wordt gebruikt bij het vertalen van geselecteerde tekst.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Ingebouwde vertalers';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Schakel ingebouwde vertalers in of uit. Ingeschakelde vertalers verschijnen in het contextmenu van berichten wanneer tekst is geselecteerd.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Aangepaste vertalers';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Voeg je eigen vertalers toe met een aangepast URL-patroon. Gebruik \'$query\' als placeholder voor de te vertalen tekst.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Vertaler toevoegen';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Schakel hieronder ten minste één vertaler in.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Vertaler verwijderen';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Standaard omgekeerd zoeken naar afbeeldingen';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Kies welke zoekmachine voor omgekeerd zoeken standaard wordt gebruikt bij het zoeken naar een afbeelding.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Ingebouwd omgekeerd zoeken naar afbeeldingen';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Schakel ingebouwde providers voor omgekeerd zoeken naar afbeeldingen in of uit. Ingeschakelde providers verschijnen in het contextmenu van afbeeldingen, avatars, banners, stickers en emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Aangepast omgekeerd zoeken naar afbeeldingen';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Voeg je eigen providers voor omgekeerd zoeken op afbeeldingen toe met een aangepast URL-patroon. Gebruik \'$url\' als placeholder voor de afbeeldings-URL.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Omgekeerd zoeken naar afbeeldingen toevoegen';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Schakel hieronder ten minste één provider voor omgekeerd zoeken naar afbeeldingen in.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Omgekeerd zoeken naar afbeeldingen verwijderen';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Zoekmachine toevoegen';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Zoekmachine bewerken';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Vertalingsprovider toevoegen';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Vertalingsprovider bewerken';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Zoekmachine voor omgekeerd zoeken toevoegen';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Zoekmachine voor omgekeerd zoeken bewerken';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Naam';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL-patroon';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Mijn zoekmachine';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Mijn vertaler';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Mijn omgekeerde afbeeldingszoekopdracht';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Gebruik \'$query\' waar de zoektekst moet worden ingevoegd.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Gebruik \'$query\' waar de te vertalen tekst moet worden ingevoegd.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Gebruik \'$url\' waar de afbeeldings-URL moet worden ingevoegd.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Naam is vereist.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'URL-patroon is vereist.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL-patroon moet \'$query\' bevatten.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL-patroon moet \'$url\' bevatten.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL-patroon moet een geldige URL zijn.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Toevoegen';

  @override
  String get advancedSettingEditSearchProviderAction => 'Bewerken';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Verwijderen';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Weet je zeker dat je $engineName wilt verwijderen?';
  }

  @override
  String get userSettingsNavApplications => 'Applicaties';

  @override
  String get userSettingsNavAppLogs => 'App-logboeken';

  @override
  String get userSettingsNavDeveloperTools => 'Ontwikkelaarstools';

  @override
  String get userSettingsNavLimitsConfig => 'Limieten config';

  @override
  String get userSettingsNavFeatureFlags => 'Functievlaggen';

  @override
  String get userSettingsNavWhatsNew => 'Nieuw';

  @override
  String get userSettingsJoinFluxerLabs => 'Word lid van Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'App-licenties';

  @override
  String get userSettingsAppLicensesDescription =>
      'Open-source software dat door deze app wordt gebruikt. Deze app is gebouwd met Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Kon de app-licenties niet laden.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenties',
      one: '1 licentie',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Uitloggen';

  @override
  String get userSettingsLogOutConfirmTitle => 'Uitloggen?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Je kunt op elk moment weer inloggen.';

  @override
  String get quickSwitcherTabSearch => 'Zoeken';

  @override
  String get quickSwitcherTabFriends => 'Vrienden';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Zoek naar kanalen, mensen of communities';

  @override
  String get quickSwitcherSearchFriends => 'Vrienden zoeken';

  @override
  String get quickSwitcherNoMatchesFound => 'Geen resultaten gevonden';

  @override
  String get quickSwitcherEmptyHint =>
      'Probeer een andere naam of gebruik de voorvoegsels @ / # / ! / * om resultaten te filteren.';

  @override
  String get quickSwitcherSectionPeople => 'Mensen';

  @override
  String get quickSwitcherSectionGroupMessages => 'Groepsberichten';

  @override
  String get quickSwitcherSectionTextChannels => 'Tekstkanalen';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Spraakkanalen';

  @override
  String get quickSwitcherSectionCommunities => 'Communities';

  @override
  String get quickSwitcherSectionSettings => 'Instellingen';

  @override
  String get quickSwitcherHomeLabel => 'Start';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Directe berichten';

  @override
  String get quickSwitcherFavoritesLabel => 'Favorieten';

  @override
  String get quickSwitcherUserSettingsLabel => 'Gebruikersinstellingen';

  @override
  String get quickSwitcherNotificationsLabel => 'Meldingen';

  @override
  String get quickSwitcherBookmarksLabel => 'Opgeslagen berichten';

  @override
  String get savedMessagesEmptyTitle => 'Geen opgeslagen berichten';

  @override
  String get savedMessagesEmptyBody =>
      'Sla berichten op om ze later terug te vinden.';

  @override
  String get savedMessagesEndBody => 'Hier is niets meer te zien.';

  @override
  String get savedMessagesRemoveTooltip =>
      'Verwijderen uit opgeslagen berichten';

  @override
  String get savedMessagesAddedToast => 'Toegevoegd aan opgeslagen berichten';

  @override
  String get savedMessagesRemovedToast => 'Verwijderd uit opgeslagen berichten';

  @override
  String get quickSwitcherMentionsLabel => 'Vermeldingen';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Nog geen vrienden';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Voeg een vriend toe om te beginnen.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Geen vrienden gevonden die overeenkomen met de zoekopdracht';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Probeer een andere naam.';

  @override
  String get quickSwitcherSearchAliasUser => 'Gebruiker';

  @override
  String get quickSwitcherSearchAliasYou => 'Jij';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Direct messages';

  @override
  String get quickSwitcherSearchAliasMessages => 'Berichten';

  @override
  String get quickSwitcherSearchAliasFav => 'Favorieten';

  @override
  String get quickSwitcherSearchAliasStarred => 'Favorieten';

  @override
  String get quickSwitcherSearchAliasInbox => 'Inbox';

  @override
  String get quickSwitcherSearchAliasSaved => 'Opgeslagen';

  @override
  String get uiClose => 'Sluiten';

  @override
  String get chatJumpToBottom => 'Spring naar onderen';

  @override
  String get uiConfirm => 'Bevestigen';

  @override
  String get uiLoading => 'Laden';

  @override
  String get uiSearch => 'Zoeken';

  @override
  String get uiStartCall => 'Oproep starten';

  @override
  String get uiStartVideoCall => 'Start videogesprek';

  @override
  String get uiPlay => 'Afspelen';

  @override
  String get uiPause => 'Pauzeren';

  @override
  String get uiDownload => 'Downloaden';

  @override
  String get uiMoreActions => 'Meer opties';

  @override
  String get uiUnsavedChanges => 'Niet-opgeslagen wijzigingen';

  @override
  String get uiReset => 'Opnieuw instellen';

  @override
  String get uiOpenColorPicker => 'Kleurenkiezer openen';

  @override
  String get uiSelectPlaceholder => 'Selecteren';

  @override
  String get uiSearchPlaceholder => 'Zoeken';

  @override
  String get uiNoOptionsFound => 'Geen opties gevonden';

  @override
  String get uiDismissNotification => 'Melding sluiten';

  @override
  String get uiColorPickerTitle => 'Kleurkiezer';

  @override
  String get mentionConfirmTitle => 'Iedereen vermelden?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Dit zal $count leden op de hoogte stellen. Doorgaan?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Dit zal $count online leden op de hoogte stellen. Doorgaan?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Dit zal $count leden met de rol $roleName op de hoogte stellen. Doorgaan?';
  }

  @override
  String get mentionConfirmButton => 'Vermelden';

  @override
  String get composerEmojiUnavailable =>
      'Je kunt die emoji hier niet gebruiken.';

  @override
  String get instanceUrlLabel => 'URL van instantie';

  @override
  String get instanceUrlPlaceholder =>
      'Voer instantie-URL in (bijv. fluxer.app)';

  @override
  String get instanceUrlHelper =>
      'Gebruik fluxer.app voor de officiële instantie, of de exacte URL van een zelf-gehoste instantie.';

  @override
  String get resetToDefaultInstance => 'Terugzetten naar Fluxer';

  @override
  String get instanceConnect => 'Verbinden';

  @override
  String get instanceConnecting => 'Verbinden…';

  @override
  String get instanceConnectFailed => 'Kon geen verbinding maken met instantie';

  @override
  String get recentInstances => 'Recente instanties';

  @override
  String removeRecentInstance(String domain) {
    return 'Verwijder $domain uit recente instanties';
  }

  @override
  String get instanceSheetTitle => 'Verbinden met instantie';

  @override
  String get changeInstance => 'Wijzigen';

  @override
  String get instanceConnectionRequired =>
      'Verbind met het exemplaar om u aan te melden';

  @override
  String get comingSoon => 'Binnenkort beschikbaar';

  @override
  String get guildNavbarDirectMessages => 'Directe berichten';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Ontdek vindbare communities';

  @override
  String get discoveryExplore => 'Ontdekken';

  @override
  String get discoveryExplorePublicCommunities => 'Ontdek openbare communities';

  @override
  String get discoveryListingSubheading =>
      'Wil je je community hier vermelden? Vraag dit aan als je voldoet aan de vereisten in de instellingen van je community > Ontdekking.';

  @override
  String get discoverySearchCommunities => 'Communities zoeken';

  @override
  String get discoveryFilterByLanguage => 'Filteren op taal';

  @override
  String get discoveryAllLanguages => 'Alle talen';

  @override
  String get discoveryAllCategories => 'Alles';

  @override
  String get discoveryCategoryGaming => 'Gaming';

  @override
  String get discoveryCategoryMusic => 'Muziek';

  @override
  String get discoveryCategoryEntertainment => 'Amusement';

  @override
  String get discoveryCategoryEducation => 'Onderwijs';

  @override
  String get discoveryCategoryScienceAndTechnology =>
      'Wetenschap en technologie';

  @override
  String get discoveryCategoryContentCreator => 'Contentmaker';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime en manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Films en tv';

  @override
  String get discoveryCategoryOther => 'Overig';

  @override
  String get discoveryNoCommunitiesMatch => 'Geen communities gevonden.';

  @override
  String get discoveryJoinCommunity => 'Word lid van community';

  @override
  String get discoveryJoined => 'Lid';

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
      other: '$countString leden',
      one: '1 lid',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Geen beschrijving.';

  @override
  String get discoveryCommunities => 'Communities';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Kon geen lid worden van deze community';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Er is iets misgegaan. Probeer het over een ogenblik opnieuw.';

  @override
  String get discoveryJoinErrorFullTitle => 'Deze community is vol';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Deze community heeft de ledengrens bereikt, dus je kunt nu niet deelnemen.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Je hebt de communitylimiet bereikt';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Je bent lid van het maximale aantal communities. Verlaat er een en probeer het opnieuw.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Je kunt niet deelnemen aan deze community';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Je bent verbannen uit deze community.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Deze community is niet meer beschikbaar';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'De community is mogelijk niet meer opgenomen in Ontdekken of accepteert geen nieuwe leden meer. Vernieuw de pagina en je ziet deze niet meer.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Je gaat te snel';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Wacht even en probeer het opnieuw.';

  @override
  String get guildNavbarAddCommunity => 'Community toevoegen';

  @override
  String get guildNavbarHelp => 'Help';

  @override
  String get scrollIndicatorNew => 'NIEUW';

  @override
  String get scrollIndicatorNewMessage => 'NIEUW BERICHT';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Map $folderName inklappen';
  }

  @override
  String get guildNavbarGuildSelected => 'geselecteerd';

  @override
  String get guildNavbarGuildUnread => 'ongelezen';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vermeldingen',
      one: '1 vermelding',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'gedempt';

  @override
  String get authShowPassword => 'Wachtwoord tonen';

  @override
  String get authHidePassword => 'Wachtwoord verbergen';

  @override
  String get authCheckStillWorking => 'Nog bezig…';

  @override
  String get authVerificationFailed =>
      'Verificatie mislukt. Probeer het opnieuw.';

  @override
  String get chatLoadingMessages => 'Berichten laden';

  @override
  String get friendsMessageFriend => 'Bericht';

  @override
  String get friendsFriendActions => 'Acties voor vrienden';

  @override
  String get friendsAcceptRequest => 'Vriendschapsverzoek accepteren';

  @override
  String get friendsDeclineRequest => 'Vriendschapsverzoek weigeren';

  @override
  String get friendsCancelRequest => 'Vriendschapsverzoek annuleren';

  @override
  String get friendsOpenInbox => 'Inbox';

  @override
  String get profileRemoveFriend => 'Vriend verwijderen';

  @override
  String get profileUnblockUser => 'Deblokkeer gebruiker';

  @override
  String get profileAcceptFriendRequest => 'Vriendschapsverzoek accepteren';

  @override
  String get profileCancelFriendRequest => 'Vriendschapsverzoek annuleren';

  @override
  String get profileSendFriendRequest => 'Vriend toevoegen';

  @override
  String get accountOverflowMenu => 'Accountopties';

  @override
  String get navHome => 'Start';

  @override
  String get navNotifications => 'Meldingen';

  @override
  String get navYou => 'Jij';

  @override
  String get guildFolderSettingsTitle => 'Mapinstellingen';

  @override
  String get guildFolderNameLabel => 'Mapnaam';

  @override
  String get guildFolderColorLabel => 'Mapkleur';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Pictogram tonen wanneer ingeklapt';

  @override
  String get guildFolderIconLabel => 'Mappictogram';

  @override
  String get guildFolderDelete => 'Map verwijderen';

  @override
  String get guildFolderIconFolder => 'Map';

  @override
  String get guildFolderIconStar => 'Ster';

  @override
  String get guildFolderIconHeart => 'Hart';

  @override
  String get guildFolderIconBookmark => 'Bladwijzer';

  @override
  String get guildFolderIconGameController => 'Gamecontroller';

  @override
  String get guildFolderIconShield => 'Afscherming';

  @override
  String get guildFolderIconMusicNote => 'Muzieknoot';

  @override
  String get guildFolderMarkAsRead => 'Map als gelezen markeren';

  @override
  String get guildBulkMuteCommunities => 'Communities dempen';

  @override
  String get guildBulkUnmuteCommunities => 'Dempen van communities opheffen';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Meldingsinstellingen community';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Privacyinstellingen community';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Sta @everyone en @here toe';

  @override
  String get guildBulkAllowRoleMentions => 'Rolvermeldingen toestaan';

  @override
  String get guildBulkEnableMobilePush => 'Mobiele pushmeldingen inschakelen';

  @override
  String get guildBulkDisableMobilePush => 'Mobiele pushmeldingen uitschakelen';

  @override
  String get guildBulkAllowDirectMessages => 'Directe berichten toestaan';

  @override
  String get guildBulkBlockDirectMessages => 'Blokkeer directe berichten';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Directe berichten van bots toestaan';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Directe berichten van bots blokkeren';

  @override
  String get guildNavbarGroupDm => 'Groeps-DM';

  @override
  String get guildNavbarCreateChannel => 'Kanaal aanmaken';

  @override
  String get guildNavbarChannelType => 'Kanaaltype';

  @override
  String get guildNavbarTextChannel => 'Tekstkanaal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Berichten, afbeeldingen, GIF\'s en emoji\'s verzenden';

  @override
  String get guildNavbarVoiceChannel => 'Spraakkanaal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Kom samen tot rust met spraak, video en scherm delen';

  @override
  String get guildNavbarLinkChannel => 'Kanaal koppelen';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Snelle toegang tot een externe website of bron';

  @override
  String get guildNavbarNameLabel => 'Naam';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Kanaaltype selecteren';

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
  String get guildNavbarCreateCategory => 'Categorie aanmaken';

  @override
  String get guildNavbarNewCategoryHint => 'Nieuwe categorie';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Nodig vrienden uit voor $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Ontvangers gaan naar #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Vrienden zoeken';

  @override
  String get guildNavbarNoFriendsYet => 'Nog geen vrienden';

  @override
  String get guildNavbarNoResults => 'Geen resultaten';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Of stuur een uitnodigingslink naar een vriend:';

  @override
  String get guildNavbarInviteLink => 'Uitnodigingslink';

  @override
  String get guildNavbarCopy => 'Kopiëren';

  @override
  String get guildNavbarCopied => 'Gekopieerd!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Je uitnodigingslink verloopt over 7 dagen.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Deze uitnodigingslink verloopt nooit.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Uw uitnodigingslink verloopt over $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Uitnodigingslink bewerken';

  @override
  String get guildNavbarInviteLinkSettings => 'Instellingen uitnodigingslink';

  @override
  String get guildNavbarExpireAfter => 'Verloopt na';

  @override
  String get guildNavbarMaxUses => 'Maximaal aantal keer te gebruiken';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Tijdelijk lidmaatschap verlenen';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Leden worden verwijderd wanneer ze offline gaan, tenzij er een rol is toegewezen';

  @override
  String get guildNavbarCreateNewLink => 'Nieuwe link aanmaken';

  @override
  String get guildNavbarSent => 'Verzonden';

  @override
  String get guildNavbarInvite => 'Uitnodigen';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Community verlaten';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Weet je zeker dat je deze community wilt verlaten? Je kunt dan geen berichten meer zien.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Community verlaten';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Je berichten in deze community verwijderen?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Verwijder permanent alle berichten die je hier hebt verzonden, in elk kanaal. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Mijn berichten verwijderen';

  @override
  String get guildNavbarDeletedYourMessages => 'Je berichten zijn verwijderd';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Je berichten konden niet worden verwijderd';

  @override
  String get guildNavbarRemoveOverride => 'Aangepaste instelling verwijderen';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Gedempt tot $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Alleen toegankelijk voor $productName medewerkers';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Uitnodigingen zijn momenteel gepauzeerd in deze community';

  @override
  String get guildNavbarDurationNever => 'nooit';

  @override
  String get guildNavbarDuration30Minutes => '30 minuten';

  @override
  String get guildNavbarDuration1Hour => '1 uur';

  @override
  String get guildNavbarDuration6Hours => '6 uur';

  @override
  String get guildNavbarDuration12Hours => '12 uur';

  @override
  String get guildNavbarDuration1Day => '1 dag';

  @override
  String get guildNavbarDuration7Days => '7 dagen';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count seconden';
  }

  @override
  String get guildNavbarNever => 'Nooit';

  @override
  String get guildNavbarNoLimit => 'Geen limiet';

  @override
  String get guildNavbarOneUse => '1 keer';

  @override
  String guildNavbarUses(int count) {
    return '$count keer';
  }

  @override
  String get guildMenuMarkAsRead => 'Markeren als gelezen';

  @override
  String get guildPeekMoreOptions => 'Meer opties';

  @override
  String get guildMenuInviteMembers => 'Leden uitnodigen';

  @override
  String get guildMenuCommunitySettings => 'Community-instellingen';

  @override
  String get guildMenuEditCommunityProfile => 'Communityprofiel bewerken';

  @override
  String get guildMenuUnmuteCommunity => 'Dempen van community opheffen';

  @override
  String get guildMenuMuteCommunity => 'Community dempen';

  @override
  String get guildMenuHideMutedChannels => 'Gedempte kanalen verbergen';

  @override
  String get guildMenuDebugCommunity => 'Community debuggen';

  @override
  String get guildMenuCopyCommunityId => 'Community-ID kopiëren';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Tot $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Algemeen';

  @override
  String get guildMenuSettingsRoles => 'Rollen en permissies';

  @override
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Stickers';

  @override
  String get guildMenuSettingsSafetyModeration => 'Veiligheid en moderatie';

  @override
  String get guildMenuSettingsActivityLog => 'Activiteitenlogboek';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsDiscovery => 'Ontdekken';

  @override
  String get guildMenuSettingsMembers => 'Leden';

  @override
  String get guildMenuSettingsInviteLinks => 'Uitnodigingen';

  @override
  String get guildMenuSettingsBans => 'Verbanningen';

  @override
  String get guildMenuSettingsChannels => 'Kanalen';

  @override
  String get guildSettingsNoPermission =>
      'Je hebt geen toestemming om dit instellingentabblad te bekijken.';

  @override
  String get guildSettingsOverviewIconTitle => 'Pictogram';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewNameTitle => 'Naam';

  @override
  String get guildSettingsOverviewNameHint => 'Mijn geweldige community';

  @override
  String get guildSettingsCreateRole => 'Rol aanmaken';

  @override
  String get guildSettingsRolesListTitle => 'Rollen';

  @override
  String get guildSettingsRolesNewRole => 'Nieuwe rol';

  @override
  String get guildSettingsRolesDeleteRole => 'Rol verwijderen';

  @override
  String get guildSettingsRolesBackToRoles => 'Terug naar rollen';

  @override
  String get guildSettingsBackToSettings => 'Terug naar instellingen';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Bewerken \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Rolinstellingen en -machtigingen configureren';

  @override
  String get guildSettingsRolesDisplaySection => 'Weergave';

  @override
  String get guildSettingsRolesRoleName => 'Rolnaam';

  @override
  String get guildSettingsRolesRoleColor => 'Rolkleur';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Typ een kleur (hex, rgb(), hsl() of naam) of gebruik de kiezer.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Deze rol afzonderlijk weergeven';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Toont leden met deze rol in een eigen sectie in de ledenlijst.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Vermeldingen voor deze rol toestaan';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Leden met de \"$permission\"-permissie kunnen rollen altijd vermelden, ongeacht deze instelling.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Gebruik deze knop om snel alle machtigingen te wissen.';

  @override
  String get guildSettingsRolesClearPermissions => 'Machtigingen wissen';

  @override
  String get guildSettingsRolesPermissionsSection => 'Machtigingen';

  @override
  String get guildSettingsRolesSearchPermissions => 'Machtigingen zoeken';

  @override
  String get guildSettingsRolesDenseLayout => 'Compacte weergave';

  @override
  String get guildSettingsRolesComfyLayout => 'Comfortabele lay-out';

  @override
  String get guildSettingsRolesSingleColumn => 'Enkele kolom';

  @override
  String get guildSettingsRolesTwoColumns => 'Twee kolommen';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Geen machtigingen gevonden';

  @override
  String get guildSettingsRolesHoistOrder =>
      'Volgorde van apart weergegeven rollen';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Terugzetten naar standaard';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Versleep rollen om de volgorde aan te passen waarin ze in de ledenlijst verschijnen.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Geen afzonderlijk weergegeven rollen. Schakel \"Deze rol afzonderlijk weergeven\" in bij een rol om deze hier te zien.';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Je hebt de \"$permission\"-permissie nodig om deze permissies te bewerken';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Je kunt geen rol bewerken die gelijk is aan of hoger is dan je hoogste rol';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Je kunt geen machtiging toekennen die je zelf niet hebt';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Je kunt deze toestemming niet verwijderen omdat je deze dan ook voor jezelf verwijdert';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Rollen succesvol bijgewerkt';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rol succesvol aangemaakt';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rol succesvol verwijderd';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Volgorde van apart weergegeven rollen teruggezet naar standaard';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Rolnaam is vereist';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Geef de rol een naam voordat je opslaat.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Rol kon niet worden aangemaakt';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Rollen konden niet worden bijgewerkt';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Rol kon niet worden verwijderd';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" kon niet worden verwijderd. Probeer het opnieuw.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Volgorde van apart weergegeven rollen kon niet worden hersteld';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Probeer het over een ogenblik opnieuw.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Weet je zeker dat je de rol $name wilt verwijderen? Leden met deze rol zullen deze niet langer hebben.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Hele community';

  @override
  String get permissionCategoryMessagesMedia => 'Berichten en media';

  @override
  String get permissionCategoryModeration => 'Moderatie';

  @override
  String get permissionCategoryChannelAccess => 'Kanaaltoegang';

  @override
  String get permissionCategoryChannelManagement => 'Kanaalbeheer';

  @override
  String get permissionCategoryAudioVideo => 'Audio en video';

  @override
  String get permissionAdministrator => 'Beheerder';

  @override
  String get permissionAdministratorDescription =>
      'Verleent alle rechten en omzeilt kanaalbeperkingen. Zeer gevoelig.';

  @override
  String get permissionViewActivityLog => 'Activiteitenlogboek bekijken';

  @override
  String get permissionViewActivityLogDescription =>
      'Lees het activiteitenlogboek van de community met wijzigingen en moderatieacties.';

  @override
  String get permissionManageCommunity => 'Community beheren';

  @override
  String get permissionManageCommunityDescription =>
      'Bewerk algemene instellingen zoals naam, beschrijving en pictogram.';

  @override
  String get permissionManageRoles => 'Rollen beheren';

  @override
  String get permissionManageRolesDescription =>
      'Rollen onder je hoogste rol maken, bewerken of verwijderen. Hiermee kun je ook aangepaste toegangsrechten voor kanalen bewerken.';

  @override
  String get permissionManageChannels => 'Kanalen beheren';

  @override
  String get permissionManageChannel => 'Kanaal beheren';

  @override
  String get permissionManageChannelDescription =>
      'Wijzig de naam en instellingen van dit kanaal.';

  @override
  String get permissionManagePermissions => 'Machtigingen beheren';

  @override
  String get permissionManagePermissionsDescription =>
      'Aangepaste toegangsrechten voor rollen en leden in dit kanaal bewerken.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Webhooks voor dit kanaal maken, bewerken of verwijderen.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Bekijk de ledenlijst van dit kanaal.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Beheer uitnodigingslinks voor dit kanaal.';

  @override
  String get permissionOverwriteDeny => 'Weigeren';

  @override
  String get permissionOverwriteInherit => 'Neutraal (overnemen)';

  @override
  String get permissionOverwriteAllow => 'Toestaan';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Gebruik deze knoppen om snel alle machtigingen in te stellen.';

  @override
  String get permissionManageChannelsDescription =>
      'Kanalen en categorieën maken, bewerken of verwijderen.';

  @override
  String get permissionKickMembers => 'Leden uit community verwijderen';

  @override
  String get permissionBanMembers => 'Leden verbannen';

  @override
  String get permissionCreateInviteLinks => 'Uitnodigingslinks aanmaken';

  @override
  String get permissionChangeOwnNickname => 'Eigen bijnaam wijzigen';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Je eigen bijnaam bijwerken.';

  @override
  String get permissionManageNicknames => 'Bijnamen beheren';

  @override
  String get permissionManageNicknamesDescription =>
      'Bijnamen van andere leden wijzigen.';

  @override
  String get permissionCreateEmojiStickers => 'Emoji en stickers maken';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Nieuwe emoji en stickers uploaden en je eigen creaties beheren.';

  @override
  String get permissionManageEmojiStickers => 'Emoji en stickers beheren';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Emoji en stickers bewerken of verwijderen die door andere leden zijn gemaakt.';

  @override
  String get permissionManageWebhooks => 'Webhooks beheren';

  @override
  String get permissionManageWebhooksDescription =>
      'Webhooks maken, bewerken of verwijderen.';

  @override
  String get permissionSendMessages => 'Berichten verzenden';

  @override
  String get permissionSendTtsMessages => 'TTS-berichten verzenden';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Stuur tekst-naar-spraakberichten.';

  @override
  String get permissionManageMessages => 'Berichten beheren';

  @override
  String get permissionManageMessagesDescription =>
      'Berichten van andere leden verwijderen. Vastzetten wordt afzonderlijk beheerd.';

  @override
  String get permissionPinMessages => 'Berichten vastzetten';

  @override
  String get permissionEmbedLinks => 'Links insluiten';

  @override
  String get permissionAttachFiles => 'Bestanden bijvoegen';

  @override
  String get permissionMentionEveryone => '@everyone/@here en @rol gebruiken';

  @override
  String get permissionMentionEveryoneDescription =>
      'Vermeld iedereen of een rol (zelfs als de rol niet is ingesteld als vermeldbaar).';

  @override
  String get permissionUseExternalEmoji => 'Externe emoji gebruiken';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Emoji gebruiken van andere communities.';

  @override
  String get permissionUseExternalStickers => 'Externe stickers gebruiken';

  @override
  String get permissionAddReactions => 'Reacties toevoegen';

  @override
  String get permissionAddReactionsDescription =>
      'Nieuwe reacties toevoegen aan berichten.';

  @override
  String get permissionBypassSlowmode => 'Slowmodus omzeilen';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Negeer de limieten voor hoe snel je berichten in een kanaal kunt versturen.';

  @override
  String get permissionTimeOutMembers => 'Leden een time-out geven';

  @override
  String get permissionTimeOutMembersDescription =>
      'Voorkom gedurende een bepaalde tijd dat leden berichten versturen, reageren en deelnemen aan spraakkanalen.';

  @override
  String get permissionViewChannel => 'Kanaal bekijken';

  @override
  String get permissionViewChannelMembers => 'Kanaalleden bekijken';

  @override
  String get permissionViewChannelMembersDescription =>
      'Bekijk de ledenlijst voor kanalen in deze community.';

  @override
  String get permissionConnect => 'Verbinden';

  @override
  String get permissionSpeak => 'Spreken';

  @override
  String get permissionStreamVideo => 'Video streamen';

  @override
  String get permissionUseVoiceActivity => 'Spraakactiviteit gebruiken';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Zonder deze machtiging is push-to-talk vereist.';

  @override
  String get permissionPrioritySpeaker => 'Prioriteitsspreker';

  @override
  String get permissionMuteMembers => 'Leden dempen';

  @override
  String get permissionDeafenMembers => 'Geluid voor leden uitschakelen';

  @override
  String get permissionMoveMembers => 'Leden verplaatsen';

  @override
  String get permissionMoveMembersDescription =>
      'Sleep leden tussen kanalen waartoe ze toegang hebben.';

  @override
  String get permissionSetVoiceRegion => 'Spraakregio instellen';

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
  String get guildSettingsEmojiEmpty => 'Nog geen aangepaste emoji.';

  @override
  String get guildSettingsStickersEmpty => 'Nog geen aangepaste stickers.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Ledenverificatie';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Kies waaraan leden moeten voldoen voordat ze berichten kunnen plaatsen of communityleden een DM kunnen sturen.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Leden met rollen kunnen deze controles omzeilen. Voor openbare ruimtes raden we aan verificatie in te schakelen.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Community\'s die in Ontdekken worden vermeld, vereisen minimaal een geverifieerd e-mailadres. Geen kan niet worden geselecteerd zolang Ontdekken is ingeschakeld.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Inhoud voor volwassenen en inhoudswaarschuwingen';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Configureer de labeling van volwassen inhoud en optionele inhoudswaarschuwingen voor leden.';

  @override
  String get guildSettingsModerationMatureToggle => 'Inhoud voor volwassenen';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Markeer deze community als inhoud voor volwassenen.';

  @override
  String get guildSettingsVerificationNone => 'Geen';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Geen verificatie vereist.';

  @override
  String get guildSettingsVerificationLow => 'Laag';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Vereist een geverifieerd e-mailadres.';

  @override
  String get guildSettingsVerificationMedium => 'Gemiddeld';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Vereist een geverifieerd e-mailadres en een account dat minstens 5 minuten oud is.';

  @override
  String get guildSettingsVerificationHigh => 'Hoog';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Vereist alles van het niveau Gemiddeld, plus dat je minimaal 10 minuten lid bent van de community.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Houd moderatoracties bij in de hele community.';

  @override
  String get guildSettingsAuditLogEmpty => 'Nog geen logboeken';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderatieacties en communitywijzigingen verschijnen hier.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Alle gebruikers';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Alle acties';

  @override
  String get guildSettingsAuditLogNoReason => 'Geen reden opgegeven.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Onbekende gebruiker';

  @override
  String get guildSettingsAuditLogReason => 'Reden';

  @override
  String get guildSettingsAuditLogSomeone => 'iemand';

  @override
  String get guildSettingsAuditLogSomething => 'iets';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'onbekende entiteit';

  @override
  String get guildSettingsAuditLogNothing => 'niets';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Onbekend doel';

  @override
  String get auditLogActionGuildUpdate => 'Community bijgewerkt';

  @override
  String get auditLogActionChannelCreate => 'Kanaal aangemaakt';

  @override
  String get auditLogActionChannelUpdate => 'Kanaal bijgewerkt';

  @override
  String get auditLogActionChannelDelete => 'Kanaal verwijderd';

  @override
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanaaloverheersing toegevoegd';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanaaloverheersing bijgewerkt';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanaaloverheersing verwijderd';

  @override
  String get auditLogActionMemberKick => 'Lid verwijderd';

  @override
  String get auditLogActionMemberPrune => 'Leden opgeschoond';

  @override
  String get auditLogActionMemberBanAdd => 'Lid verbannen';

  @override
  String get auditLogActionMemberBanRemove => 'Verbanning van lid opgeheven';

  @override
  String get auditLogActionMemberUpdate => 'Lid bijgewerkt';

  @override
  String get auditLogActionMemberRoleUpdate => 'Rollen van lid bijgewerkt';

  @override
  String get auditLogActionMemberMove => 'Lid verplaatst';

  @override
  String get auditLogActionMemberDisconnect => 'Verbinding van lid verbroken';

  @override
  String get auditLogActionBotAdd => 'Bot toegevoegd';

  @override
  String get auditLogActionRoleCreate => 'Rol aangemaakt';

  @override
  String get auditLogActionRoleUpdate => 'Rol bijgewerkt';

  @override
  String get auditLogActionRoleDelete => 'Rol verwijderd';

  @override
  String get auditLogActionInviteCreate => 'Uitnodiging aangemaakt';

  @override
  String get auditLogActionInviteUpdate => 'Uitnodiging bijgewerkt';

  @override
  String get auditLogActionInviteDelete => 'Uitnodiging verwijderd';

  @override
  String get auditLogActionWebhookCreate => 'Webhook aangemaakt';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook bijgewerkt';

  @override
  String get auditLogActionWebhookDelete => 'Webhook verwijderd';

  @override
  String get auditLogActionEmojiCreate => 'Emoji aangemaakt';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji bijgewerkt';

  @override
  String get auditLogActionEmojiDelete => 'Emoji verwijderd';

  @override
  String get auditLogActionStickerCreate => 'Sticker gemaakt';

  @override
  String get auditLogActionStickerUpdate => 'Sticker bijgewerkt';

  @override
  String get auditLogActionStickerDelete => 'Sticker verwijderd';

  @override
  String get auditLogActionMessageDelete => 'Bericht verwijderd';

  @override
  String get auditLogActionMessageBulkDelete => 'Berichten verwijderd';

  @override
  String get auditLogActionMessagePin => 'Bericht vastgezet';

  @override
  String get auditLogActionMessageUnpin => 'Bericht niet meer vastgezet';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor heeft de community-instellingen bijgewerkt.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor heeft het kanaal $target aangemaakt.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor heeft het kanaal $target bijgewerkt.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor heeft het kanaal $target verwijderd.';
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
    return '$actor heeft kanaaltoestemmingen toegevoegd voor $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor heeft kanaaltoestemmingen toegevoegd voor $target in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor heeft kanaaltoestemmingen bijgewerkt voor $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor heeft kanaaltoestemmingen voor $target bijgewerkt in $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor heeft kanaaltoestemmingen voor $target verwijderd.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor heeft kanaaltoestemmingen voor $target verwijderd in $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor heeft $target verwijderd.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor heeft $target verbannen.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor heeft $target gedeblokkeerd.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor heeft $target bijgewerkt.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor heeft rollen bijgewerkt voor $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor heeft inactieve leden verwijderd.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor heeft leden die $days dagen inactief waren, verwijderd.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor heeft $target naar een ander spraakkanaal verplaatst.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor heeft $target naar $channel verplaatst.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor heeft $target verwijderd uit spraak.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor heeft de bot $target toegevoegd.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor heeft de rol $target aangemaakt.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor heeft de rol $target bijgewerkt.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor heeft de rol $target verwijderd.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor heeft de uitnodiging $target aangemaakt.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor heeft de uitnodiging $target aangemaakt voor $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor heeft de uitnodiging $target bijgewerkt.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor heeft de uitnodiging $target voor $channel bijgewerkt.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor heeft de uitnodiging $target verwijderd.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor heeft de uitnodiging $target voor $channel verwijderd.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor heeft de webhook $target aangemaakt.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor heeft de webhook $target bijgewerkt.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor heeft de webhook $target verwijderd.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor heeft de emoji $target toegevoegd.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor heeft de emoji $target bijgewerkt.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor heeft de emoji $target verwijderd.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor heeft de sticker $target toegevoegd.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor heeft de sticker $target bijgewerkt.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor heeft de sticker $target verwijderd.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor heeft een bericht verwijderd.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor heeft een bericht verwijderd in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor heeft meerdere berichten verwijderd.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor heeft $count berichten verwijderd.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor heeft meerdere berichten verwijderd in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor heeft $count berichten verwijderd in $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor heeft een bericht vastgepind.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor heeft een bericht vastgepind in $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor heeft een bericht losgemaakt.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor heeft een bericht verwijderd uit $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor heeft een auditactie uitgevoerd op $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '$field gewijzigd van $oldValue naar $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Stel $field in op $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '$field gewist (was $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Bijgewerkt $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'De community is hernoemd naar $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'De community-afbeelding is bijgewerkt.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'De kanaalnaam is gewijzigd naar $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Heeft het onderwerp gewist.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Het onderwerp is gewijzigd naar $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Volwassen inhoud ingeschakeld.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Maturity-inhoud uitgeschakeld.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Nickname ingesteld op $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Nickname $nickname verwijderd.';
  }

  @override
  String get auditLogChangeMutedMember => 'Het lid gedempt.';

  @override
  String get auditLogChangeUnmutedMember => 'Het lid gedempt.';

  @override
  String get auditLogChangeDeafenedMember => 'Het lid gedempt.';

  @override
  String get auditLogChangeUndeafenedMember => 'Het lid weer toegelaten.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Toegevoegd $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Verwijderde $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanaal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Bericht: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Uitgenodigd door $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# berichten verwijderd.',
      one: '# bericht verwijderd.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# leden verwijderd.',
      one: '# lid verwijderd.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Deze uitnodiging verloopt nooit.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Verleent tijdelijk lidmaatschap.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Verleent permanent lidmaatschap.';

  @override
  String get guildSettingsWebhooksDescription =>
      'Bekijk en beheer elke webhook die is ingesteld voor je community.';

  @override
  String get guildSettingsWebhooksEmpty => 'Geen webhooks';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Deze community heeft nog geen webhooks. Ga naar $channelSettingsPath om er een te maken.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Je hebt de \"$permission\"-permissie nodig om webhooks voor deze community te bekijken en te bewerken.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'Webhooks laden mislukt';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Er is een fout opgetreden bij het laden van de webhooks. Probeer het opnieuw.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks bijgewerkt';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'Webhooks bijwerken mislukt';

  @override
  String get guildSettingsUnknownChannel => 'Onbekend kanaal';

  @override
  String get guildSettingsCopiedUrl => 'URL gekopieerd naar klembord';

  @override
  String get guildSettingsDiscoveryDescription =>
      'Zet je community in Ontdekken, zodat anderen deze kunnen vinden en lid kunnen worden.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'Niet genoeg leden';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Je community moet minimaal $count leden hebben voordat deze in Ontdekking kan worden opgenomen.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'In behandeling';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Goedgekeurd';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Geweigerd';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Verwijderd';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Reden: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Je community staat in Ontdekken. Je kunt je vermelding hieronder bijwerken of intrekken om deze te verwijderen.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Je aanvraag wacht op beoordeling. Je kunt de gegevens van je vermelding nog bijwerken of de aanvraag intrekken.';

  @override
  String get guildSettingsDiscoveryCategory => 'Categorie';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Kies de categorie die het beste bij je community past. Je kunt dit op elk moment wijzigen.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Hoofdtaal';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'De taal die de meeste mensen in je community spreken. Wordt gebruikt om de resultaten in Ontdekken te filteren.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beschrijving';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Beschrijf waar je community over gaat';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Een beschrijving is vereist.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Beschrijving moet minimaal $minLength tekens lang zijn.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Beschrijving mag niet langer zijn dan $maxLength tekens.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Aangepaste tags';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Maximaal $maxTags tags helpen mensen je community te vinden. Ze verschijnen in de Discovery-zoekfunctie.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Voeg een tag toe en druk op Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Toevoegen';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Tag $tag verwijderen';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Tag kon niet worden toegevoegd';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Tags moeten 2 tot $maxLength alfanumerieke tekens lang zijn.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Je kunt maximaal $maxTags tags toevoegen.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Toepassen';

  @override
  String get guildSettingsDiscoverySave => 'Opslaan';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Intrekken';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Aanvraag voor Ontdekken verzonden';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Vermelding in Ontdekken bijgewerkt';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Aanvraag voor Ontdekken ingetrokken';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Aanvraag kon niet worden ingetrokken';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Probeer het over een ogenblik opnieuw.';

  @override
  String get guildSettingsMembersSearchHint => 'Zoeken op gebruikersnaam of ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count leden';
  }

  @override
  String get guildMembersRecentTitle => 'Nieuwe leden';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Toont $displayedCount van $totalCount leden';
  }

  @override
  String get guildMembersSort => 'Sorteren';

  @override
  String get guildSettingsMembersSortNewest => 'Nieuwste eerst';

  @override
  String get guildMembersSortOldest => 'Oudste eerst';

  @override
  String get guildMembersColumnName => 'Naam';

  @override
  String get guildMembersColumnMemberSince => 'Lid sinds';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Lid geworden van $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Manier van lid worden';

  @override
  String get guildMembersColumnRoles => 'Rollen';

  @override
  String get guildMembersFilterMemberSince =>
      'Filteren op datum van lid worden';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filteren op aanmaakdatum account';

  @override
  String get guildMembersFilterJoinMethod =>
      'Filteren op manier van lid worden';

  @override
  String get guildMembersFilterRoles => 'Filteren op rollen';

  @override
  String get guildMembersFilterAll => 'Alles';

  @override
  String get guildMembersFilterPast1Hour => 'Afgelopen uur';

  @override
  String get guildMembersFilterPast24Hours => 'Afgelopen 24 uur';

  @override
  String get guildMembersFilterPast7Days => 'Afgelopen 7 dagen';

  @override
  String get guildMembersFilterPast2Weeks => 'Afgelopen 2 weken';

  @override
  String get guildMembersFilterPast3Weeks => 'Afgelopen 3 weken';

  @override
  String get guildMembersFilterPast4Weeks => 'Afgelopen 4 weken';

  @override
  String get guildMembersFilterPast3Months => 'Afgelopen 3 maanden';

  @override
  String get guildMembersFilterCustomRange => 'Aangepast bereik...';

  @override
  String get guildMembersDateRangeTitle => 'Aangepast datumbereik';

  @override
  String get guildMembersDateAfter => 'Na datum';

  @override
  String get guildMembersDateBefore => 'Vóór datum';

  @override
  String get guildMembersClearAll => 'Alles wissen';

  @override
  String get guildMembersRowsPerPage => 'Rijen per pagina';

  @override
  String get guildMembersEmptySearch =>
      'Niemand komt overeen met deze zoekopdracht.';

  @override
  String get guildMembersLoadError =>
      'Er is iets misgegaan bij het laden van de leden. Probeer het later opnieuw.';

  @override
  String get guildMembersIndexing => 'Leden indexeren…';

  @override
  String get guildMembersJoinSourceCreator => 'Communitymaker';

  @override
  String get guildMembersJoinSourceInvite => 'Uitnodigen';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Uitnodiging ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Uitgenodigd door $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Aangepaste URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Botuitnodiging';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Platformbeheerder';

  @override
  String get guildMembersJoinSourceDiscovery => 'Ontdekken';

  @override
  String get guildMembersJoinMethodUnknown => 'Onbekend';

  @override
  String get guildMembersCommunityOwner => 'Community-eigenaar';

  @override
  String get guildMembersViewAllRoles => 'Alle rollen bekijken';

  @override
  String get guildMembersJoinedJustNow => 'Zojuist';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuten geleden',
      one: '1 minuut geleden',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uur geleden',
      one: '1 uur geleden',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Leden';

  @override
  String get guildSettingsInvitesTitle => 'Uitnodigingen';

  @override
  String get guildSettingsInvitesDescription =>
      'Bekijk alle uitnodigingen voor deze community. Om een nieuwe uitnodiging te maken, ga naar een kanaal en gebruik de uitnodigingsknop.';

  @override
  String get guildSettingsInvitesEmpty => 'Geen uitnodigingslinks';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Deze community heeft nog geen uitnodigingslinks. Ga naar een kanaal en maak een uitnodiging aan om mensen uit te nodigen.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Uitnodigingen laden mislukt';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Er is een fout opgetreden bij het laden van de uitnodigingen. Probeer het opnieuw.';

  @override
  String get guildSettingsInvitesTryAgain => 'Opnieuw proberen';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Toon aanmaakdatum in plaats van vervaldatum';

  @override
  String get guildSettingsInvitesPauseInvites => 'Uitnodigingen pauzeren';

  @override
  String get guildSettingsInvitesEnableInvites => 'Uitnodigingen inschakelen';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Uitnodigingen voor deze community pauzeren';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Uitnodigingen voor deze community inschakelen';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Uitnodigingen pauzeren? Nieuwe gebruikers kunnen niet deelnemen via uitnodigingslinks totdat je ze opnieuw inschakelt. Bestaande leden worden niet beïnvloed.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Uitnodigingen inschakelen? Gebruikers kunnen dan weer via uitnodigingslinks lid worden van deze community.';

  @override
  String get guildSettingsInvitesPause => 'Pauzeren';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Uitnodigingen zijn gepauzeerd voor deze community.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Uitnodigingen zijn gepauzeerd omdat $productName een mogelijke raid heeft gedetecteerd. Nieuwe gebruikers kunnen nu niet deelnemen.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Uitnodiger:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanaal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Code:';

  @override
  String get guildSettingsInvitesLabelUses => 'Aantal keren gebruikt:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Gemaakt:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Verloopt:';

  @override
  String get guildSettingsInvitesUnknown => 'Onbekend';

  @override
  String get guildSettingsInvitesNoCategory => 'Geen categorie';

  @override
  String get guildSettingsInvitesExpired => 'Verlopen';

  @override
  String get guildSettingsInvitesNever => 'Nooit';

  @override
  String get guildSettingsInvitesCopyLink => 'Uitnodigingslink kopiëren';

  @override
  String get guildSettingsInvitesRevoke => 'Uitnodiging intrekken';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Uitnodiging kon niet worden ingetrokken';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'De link werkt mogelijk nog steeds. Probeer het over een ogenblik opnieuw.';

  @override
  String get guildSettingsBansDescription =>
      'Verbannen gebruikers bekijken en beheren.';

  @override
  String get guildSettingsBansSearchHint => 'Verbanningen zoeken';

  @override
  String get guildSettingsBansEmpty => 'Geen geblokkeerde gebruikers.';

  @override
  String get guildSettingsBanExpiresLabel => 'Verloopt';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Geen verbanningen gevonden die overeenkomen met je zoekopdracht.';

  @override
  String get guildSettingsBanDetailsTitle => 'Details van verbanning';

  @override
  String get guildSettingsBanViewDetails => 'Details bekijken';

  @override
  String get guildSettingsBannedOn => 'Verbannen op';

  @override
  String get guildSettingsBannedBy => 'Verbannen door';

  @override
  String get guildSettingsRevokeBanTitle => 'Verbanning opheffen';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Weet je zeker dat je de ban van $displayName wilt intrekken? Diegene kan dan weer lid worden van de community.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Ban van $displayName ingetrokken';
  }

  @override
  String get guildSettingsRevokeBanError =>
      'Kon ban niet intrekken. Probeer het opnieuw.';

  @override
  String get guildSettingsCommunitySettings => 'Community-instellingen';

  @override
  String get guildSettingsDeleteCommunity => 'Community verwijderen';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Weet je zeker dat je deze community wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt. Alle kanalen, berichten en instellingen worden permanent verwijderd.';

  @override
  String get guildSettingsCommunityDeleted => 'Community verwijderd';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Deze community kon niet worden verwijderd';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Huisstijl';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Werk je pictogram, naam, banner en achtergrond voor uitnodigingen bij';

  @override
  String get guildSettingsOverviewBannerUpload => 'Banner uploaden';

  @override
  String get guildSettingsOverviewIdleTitle => 'Inactiviteitsinstellingen';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Configureer de AFK-kanaal en time-out';

  @override
  String get guildSettingsOverviewSystemTitle => 'Systeem en welkom';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Kies bestemming voor systeem- en welkomstberichten';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Standaardmeldingen';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Bij communities met meer dan 250 leden wordt de instelling \"Alleen vermeldingen\" afgedwongen. Je oorspronkelijke instelling blijft behouden en wordt hersteld als de community minder dan 250 leden heeft.';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Flexibele tekstkanaalnamen toestaan';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Kroon van community-eigenaar verbergen';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Losgekoppelde banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Toont de banner in een eigen sectie onder de communityheader.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Pictogram uploaden';

  @override
  String get guildSettingsOverviewRemoveImage => 'Verwijderen';

  @override
  String get guildSettingsOverviewSplashTitle => 'Achtergrond van uitnodiging';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Achtergrond chat-embed';

  @override
  String get guildSettingsOverviewUploadBackground => 'Achtergrond uploaden';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Geen communitybanner';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Geen uitnodigingsachtergrond';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Voorbeeld';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Bekijk hoe je uitnodiging eruitziet voor bezoekers.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Namen van tekstkanalen';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Kroon van community-eigenaar';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Configureer of het kroon-icoon naast de community-eigenaar wordt weergegeven';

  @override
  String get guildSettingsSplashCardAlignment => 'Uitlijning kaart';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centreren';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Links';

  @override
  String get guildSettingsSplashAlignmentRight => 'Rechts';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Alleen van toepassing op brede schermen.';

  @override
  String get permissionReadMessageHistory => 'Berichtgeschiedenis lezen';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Wijzig wat gebruikers zonder \"$permission\" kunnen zien';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Gebruik een speciaal venster om een datum voor de berichtengeschiedenis in te stellen voor leden die niet de $permission machtiging hebben.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Drempel voor berichtgeschiedenis openen';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Drempel voor berichtgeschiedenis';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Drempel voor berichtgeschiedenis inschakelen';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Drempeldatum';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Leden zonder leesgeschiedenis kunnen berichten bekijken die na deze datum zijn verzonden.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Drempel voor berichtgeschiedenis bijgewerkt';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Sta hoofdletters en spaties toe in tekstkanaalnamen. Als dit is uitgeschakeld, zijn namen beperkt tot kleine letters met koppeltekens en underscores.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Verbergt het kroon-icoon naast de community-eigenaar op alle weergaven.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Geanimeerde pictogrammen vereisen de communityfunctie Geanimeerde pictogrammen.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Geanimeerde banners vereisen de communityfunctie Geanimeerde banners.';

  @override
  String get guildSettingsAfkChannel => 'AFK-kanaal voor inactieve leden';

  @override
  String get guildSettingsAfkChannelHint =>
      'Verplaats leden naar dit kanaal als ze AFK zijn.';

  @override
  String get guildSettingsNoAfkChannel => 'Geen AFK-kanaal';

  @override
  String get guildSettingsAfkTimeout => 'AFK-time-out';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minuut';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minuten';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minuten';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minuten';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 uur';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds seconden';
  }

  @override
  String get guildSettingsSystemChannel => 'Bestemmingskanaal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Welkomst- en systeemberichten verschijnen hier.';

  @override
  String get guildSettingsNoSystemChannel => 'Geen systeemkanaal';

  @override
  String get guildSettingsHideJoinMessages =>
      'Berichten over nieuwe leden verbergen';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Onderdrukt join-berichten in het doelkanaal.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Standaardmeldingsinstellingen';

  @override
  String get guildSettingsNotificationsAll => 'Alle berichten';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Meld me aan voor alle berichten';

  @override
  String get guildSettingsNotificationsMentions => 'Alleen vermeldingen';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Meld alleen bij vermeldingen';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max. 10 MB. Minimaal: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max. 10 MB. Minimaal: 960×540px (16:9). Wordt weergegeven in uitnodigings-embeds in chat.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Inhoud filteren';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Berichten automatisch controleren op seksueel expliciete inhoud in kanalen die niet zijn gemarkeerd voor inhoud voor volwassenen.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Communities die in Ontdekken worden vermeld, moeten alle leden scannen. Deze instelling kan niet worden gewijzigd zolang Ontdekken is ingeschakeld.';

  @override
  String get guildSettingsContentFilterOff => 'Uit';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Laat de community zelf modereren';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Berichten van leden zonder rollen filteren';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Aanbevolen voor de meeste communities';

  @override
  String get guildSettingsContentFilterAll => 'Berichten van iedereen filteren';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximale bescherming voor gezinsvriendelijke ruimtes';

  @override
  String get guildSettingsContentWarningToggle =>
      'Toon een inhoudswaarschuwing';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Schakelt een toestemmingsprompt in voordat een kanaal wordt geopend.';

  @override
  String get guildSettingsContentWarningText => 'Aangepaste waarschuwingstekst';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Dit bevat gevoelige inhoud.';

  @override
  String get guildSettingsModeration2faTitle => '2FA-vereiste';

  @override
  String get guildSettingsModeration2faDescription =>
      'Vereis tweefactorauthenticatie voor moderators voordat ze gebruikers kunnen bannen, kicken, time-outen of berichten kunnen verwijderen.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      '2FA vereisen voor moderatieacties';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Schakel 2FA in voor je account om deze instelling te wijzigen';

  @override
  String get guildSettingsEmojiSearchHint => 'Emoji zoeken';

  @override
  String get guildSettingsEmojiUploadTitle => 'Emoji uploaden';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Emojiplaatsen';

  @override
  String get guildSettingsEmojiDropZone => 'Sleep emoji-bestanden hierheen';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Emoji\'s laden mislukt. Probeer het later opnieuw.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Geen emoji\'s gevonden die overeenkomen met je zoekopdracht.';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Je hebt het maximale aantal emoji\'s bereikt. Verwijder bestaande emoji\'s om ruimte te maken.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Namen van emoji\'s moeten minimaal 2 tekens bevatten en mogen letters, cijfers en underscores gebruiken. Emoji\'s moeten kleiner zijn dan $maxSize. Statische afbeeldingen worden automatisch aangepast naar 128x128 pixels en gecomprimeerd. Geanimeerde emoji\'s en SVG\'s moeten al aan de limiet voldoen.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Sommige emoji\'s konden niet worden toegevoegd';

  @override
  String get guildSettingsEmojiRenameTitle => 'Emoji hernoemen';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 tekens, letters, cijfers, underscores.';

  @override
  String get guildSettingsEmojiColumnName => 'Naam';

  @override
  String get guildSettingsEmojiColumnUploader => 'Geüpload door';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Emoji verwijderen';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Verwijder :$name:? Dit kan niet ongedaan gemaakt worden.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Deze emoji verwijderen uit opslag en CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'De naam van de emoji moet minstens 2 tekens lang zijn';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'De emojinaam mag maximaal 32 tekens lang zijn';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Ongeldige emojinaam';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Deze emoji kon niet worden hernoemd';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Deze emoji kon niet worden verwijderd';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Anderen toestaan je emoji\'s te klonen';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Als dit is ingeschakeld, kunnen leden van andere community\'s de in-app \'Klonen\'-snelkoppeling met één klik gebruiken voor je aangepaste emoji\'s. Dit voorkomt niet dat ze de afbeelding opslaan en zelf uploaden.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Anderen toestaan je stickers te klonen';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Als dit is ingeschakeld, kunnen leden van andere communities de in-app \'Klonen\'-snelkoppeling gebruiken voor je aangepaste stickers. Dit voorkomt niet dat ze de afbeelding opslaan en zelf uploaden.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Alleen leden met de \"$permission\"-permissie kunnen dit wijzigen.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Klonen van emoji\'s kon niet worden bijgewerkt';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Klonen van stickers kon niet worden bijgewerkt';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Niet-geanimeerde emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Geanimeerde emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Stickers zoeken';

  @override
  String get guildSettingsStickerSlotsTitle => 'Stickerplaatsen';

  @override
  String get guildSettingsStickerUploadTitle => 'Sticker uploaden';

  @override
  String get guildSettingsStickerDropZone =>
      'Sleep hier een stickerbestand naartoe (één tegelijk)';

  @override
  String get guildSettingsStickerDensity => 'Dichtheid van stickerweergave';

  @override
  String get guildSettingsStickerDensityCozy => 'Ruim';

  @override
  String get guildSettingsStickerDensityCompact => 'Compact';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'Stickers laden mislukt';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Er is een fout opgetreden bij het laden van de stickers. Probeer het opnieuw.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Geen stickers gevonden die overeenkomen met je zoekopdracht.';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Je hebt het maximale aantal stickers bereikt. Verwijder enkele bestaande stickers om ruimte te maken.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Stickers worden opgeslagen in 320x320 pixels en mogen maximaal $maxSize zijn. Statische afbeeldingen worden automatisch verkleind en gecomprimeerd. Geanimeerde stickers en SVG\'s moeten al aan de limiet voldoen.';
  }

  @override
  String get guildSettingsStickerAddTitle => 'Sticker toevoegen';

  @override
  String get guildSettingsStickerEditTitle => 'Sticker bewerken';

  @override
  String get guildSettingsStickerNameLabel => 'Naam';

  @override
  String get guildSettingsStickerNameHint => 'Mijn geweldige sticker';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Beschrijving';

  @override
  String get guildSettingsStickerDescriptionHint => 'Beschrijf de sticker';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tags ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Tag toevoegen';

  @override
  String get guildSettingsStickerTagAdd => 'Toevoegen';

  @override
  String get guildSettingsStickerNameRequired => 'Naam is vereist';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Naam moet minimaal 2 tekens lang zijn';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Naam mag maximaal 30 tekens lang zijn';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Beschrijving mag maximaal 500 tekens bevatten';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Sticker kon niet worden gemaakt';

  @override
  String get guildSettingsStickerDeleteTitle => 'Sticker verwijderen';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Verwijder \"$name\"? Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Sticker uit opslag en CDN verwijderen';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Deze sticker kon niet worden verwijderd';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Om een webhook te maken, open je $channelSettingsPath. Je kunt hier nog steeds alle bestaande webhooks bewerken en organiseren.';
  }

  @override
  String get guildSettingsBannedUsersTitle => 'Verbannen gebruikers';

  @override
  String get guildSettingsInvitesTableInviter => 'Uitnodiger';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanaal';

  @override
  String get guildSettingsInvitesTableCode => 'Code';

  @override
  String get guildSettingsInvitesTableUses => 'Aantal keren gebruikt';

  @override
  String get guildSettingsInvitesTableCreated => 'Aangemaakt';

  @override
  String get guildSettingsInvitesTableExpires => 'Verloopt';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filteren op gebruiker';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filteren op actie';

  @override
  String get createDm => 'Nieuw DM-gesprek';

  @override
  String get createGroupDm => 'Groeps-DM maken';

  @override
  String get createDmNewMessage => 'Nieuw bericht';

  @override
  String get createDmSelectFriends => 'Vrienden selecteren';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Kies vrienden aan wie je een bericht wilt sturen.';

  @override
  String get createDmSearchFriends => 'Vrienden zoeken';

  @override
  String get createDmNoFriendsFound => 'Geen vrienden gevonden';

  @override
  String get createDmNoFriendsYet => 'Je hebt nog geen vrienden';

  @override
  String get createDmClaimToStartDms =>
      'Voltooi de registratie van je account om DM-gesprekken te starten.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifieer je e-mailadres om DM\'s te starten.';

  @override
  String get createDmVerifyYourEmail => 'Verifieer je e-mailadres';

  @override
  String get createDmNewGroup => 'Nieuwe groep';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Nieuwe groep maken met $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Nieuwe groep bevestigen';

  @override
  String get createDmCreateNewGroup => 'Nieuwe groep aanmaken';

  @override
  String createDmRemoveFriend(String displayName) {
    return '$displayName verwijderen';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Je hebt al een groep met deze gebruikers. Wil je echt een nieuwe aanmaken? Dat is ook prima!';

  @override
  String get createDmNoActivityYet => 'Nog geen activiteit';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Sommige gebruikers kunnen niet worden toegevoegd';

  @override
  String get createDmCreateWithoutThem => 'Aanmaken zonder hen';

  @override
  String get createDmUnaddableIntro =>
      'De volgende personen kunnen niet aan deze groeps-DM worden toegevoegd:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Groeps-DM maken met de overige $count ontvanger(s) en de anderen overslaan?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Geen ontvangers meer om een groeps-DM mee te starten.';

  @override
  String get createDmUnaddableUserNotFound => 'Gebruiker niet gevonden';

  @override
  String get createDmUnaddableBlocked =>
      'Je kunt deze gebruiker geen bericht sturen';

  @override
  String get createDmUnaddableNotFriends => 'Niet in je vriendenlijst';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Staat toevoegen aan groeps-DM\'s niet toe';

  @override
  String get createDmFailed =>
      'Kon het gesprek niet aanmaken. Probeer het opnieuw.';

  @override
  String get dmListMessagesTitle => 'Berichten';

  @override
  String get dmListDirectMessagesTitle => 'Directe berichten';

  @override
  String get keybindsSearchShortcuts => 'Zoek sneltoetsen';

  @override
  String get keybindSectionDefaults => 'Standaard';

  @override
  String get keybindSectionMessages => 'Berichten';

  @override
  String get keybindSectionNavigation => 'Navigatie';

  @override
  String get keybindSectionDragAndDrop => 'Slepen en neerzetten';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Spraak en video';

  @override
  String get keybindSectionMisc => 'Overig';

  @override
  String get keybindActionShowShortcutsList =>
      'Toon lijst met toetscombinaties';

  @override
  String get keybindActionCopyText => 'Tekst kopiëren';

  @override
  String get keybindActionMarkUnread => 'Markeren als ongelezen';

  @override
  String get keybindActionFocusTextarea => 'Tekstveld selecteren';

  @override
  String get keybindActionSwitchCommunities => 'Wissel tussen communities';

  @override
  String get keybindActionSwitchChannels => 'Wissel tussen kanalen';

  @override
  String get keybindActionHistoryBack =>
      'Teruggaan door eerder bekeken kanalen';

  @override
  String get keybindActionHistoryForward =>
      'Vooruitgaan door eerder bekeken kanalen';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Navigeer tussen ongelezen kanalen';

  @override
  String get keybindActionJumpMentionChannels =>
      'Navigeer tussen ongelezen kanalen met vermeldingen';

  @override
  String get keybindActionJumpCurrentCall => 'Ga naar het huidige gesprek';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Wissel tussen laatste community en DM\'s';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Schakel over naar vorige community of DM\'s';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Ga naar volgende community of DM\'s';

  @override
  String get keybindActionGoToDms => 'Ga naar directe berichten';

  @override
  String get keybindActionGoToFirstCommunity => 'Ga naar de eerste community';

  @override
  String get keybindActionGoToSecondCommunity => 'Ga naar de tweede community';

  @override
  String get keybindActionGoToThirdCommunity => 'Ga naar de derde community';

  @override
  String get keybindActionGoToFourthCommunity => 'Ga naar de vierde community';

  @override
  String get keybindActionGoToFifthCommunity => 'Ga naar de vijfde community';

  @override
  String get keybindActionGoToSixthCommunity => 'Ga naar de zesde community';

  @override
  String get keybindActionGoToSeventhCommunity =>
      'Ga naar de zevende community';

  @override
  String get keybindActionGoToEighthCommunity => 'Ga naar de achtste community';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Snelle wisselaar tonen/verbergen';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Community maken of eraan deelnemen';

  @override
  String get keybindActionStartDragAndDrop => 'Slepen en neerzetten starten';

  @override
  String get keybindActionMove => 'Verplaatsen';

  @override
  String get keybindActionDropItem => 'Item neerzetten';

  @override
  String get keybindActionCancel => 'Annuleren';

  @override
  String get keybindActionMarkCommunityRead => 'Markeer community als gelezen';

  @override
  String get keybindActionMarkChannelRead => 'Markeer kanaal als gelezen';

  @override
  String get keybindActionStartGroupDm => 'Groeps-DM starten';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Vastgezette berichten tonen/verbergen';

  @override
  String get keybindActionToggleInbox => 'Inbox tonen of verbergen';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Markeer bovenste inboxkanaal als gelezen';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Markeer alle inboxkanalen als gelezen';

  @override
  String get keybindActionToggleMemberList =>
      'Ledenlijst of spraakchat in-/uitschakelen';

  @override
  String get keybindActionToggleEmojiPicker => 'Emoji-kiezer openen/sluiten';

  @override
  String get keybindActionToggleGifPicker => 'GIF-kiezer tonen/verbergen';

  @override
  String get keybindActionToggleStickerPicker => 'Stickerkiezer openen/sluiten';

  @override
  String get keybindActionScrollChatUp => 'Omhoog scrollen in chat';

  @override
  String get keybindActionScrollChatDown => 'Scroll chat omlaag';

  @override
  String get keybindActionJumpOldestUnread =>
      'Ga naar het oudste ongelezen bericht';

  @override
  String get keybindActionFocusComposer => 'Focus op het tekstveld';

  @override
  String get keybindActionUploadFile => 'Bestand uploaden';

  @override
  String get keybindActionCopyChannelLink => 'Kanaallink kopiëren';

  @override
  String get keybindActionToggleSavedMedia =>
      'Opgeslagen media tonen of verbergen';

  @override
  String get keybindActionSendVoiceMessage => 'Spraakbericht verzenden';

  @override
  String get keybindActionAnswerCall => 'Inkomende oproep beantwoorden';

  @override
  String get keybindActionDeclineCall => 'Inkomende oproep weigeren';

  @override
  String get keybindActionStartDmCall => 'Start een gesprek in een DM of groep';

  @override
  String get keybindActionToggleSoundboard => 'Soundboard tonen of verbergen';

  @override
  String get keybindActionToggleCompactCallView =>
      'Compacte gespreksweergave uitvouwen of inklappen';

  @override
  String get keybindActionPushToTalkPriority =>
      'Indrukken om te spreken (prioriteit)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioriteit voor spraakactiviteit';

  @override
  String get keybindActionOpenHelp => 'Help openen';

  @override
  String get keybindActionSearchMessages => 'Berichten zoeken';

  @override
  String get keybindActionOpenContextMenu => 'Open het contextmenu';

  @override
  String get keybindActionOpenSettings => 'Open je instellingen';

  @override
  String get keybindActionOpenThemeStudio =>
      'Themastudio in apart venster openen';

  @override
  String get keybindActionZoomIn => 'Inzoomen';

  @override
  String get keybindActionZoomOut => 'Uitzoomen';

  @override
  String get keybindActionZoomReset => 'Zoom opnieuw instellen';

  @override
  String get clipboardPasteFailed =>
      'Kon niet plakken. Het klembord was leeg of geblokkeerd voor deze app.';

  @override
  String get homeQuickActionDms => 'DM\'s';

  @override
  String get assistantNeedsLogin => 'Open Fluxer en log eerst in.';

  @override
  String get assistantNotInVoice => 'Je zit niet in een gesprek.';

  @override
  String get assistantNotFound => 'Fluxer kan dat niet vinden.';

  @override
  String get assistantDmsDisabled =>
      'Directe berichten zijn uitgeschakeld op deze instance.';

  @override
  String get assistantFailed => 'Fluxer kon dat niet voltooien.';

  @override
  String get assistantOkMuted => 'Microfoon gedempt.';

  @override
  String get assistantOkUnmuted => 'Microfoon niet meer gedempt.';

  @override
  String get assistantOkLeftVoice => 'Spraakkanaal verlaten.';

  @override
  String get assistantOkJoinedVoice => 'Spraakkanaal wordt betreden.';

  @override
  String get assistantOkStartedCall => 'Gesprek wordt gestart.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Status ingesteld op $status.';
  }

  @override
  String get assistantOkOpened => 'Fluxer wordt geopend.';

  @override
  String get assistantOkMessageSent => 'Bericht verzonden.';

  @override
  String get assistantOkCustomStatusSet => 'Aangepaste status bijgewerkt.';

  @override
  String get assistantOkCustomStatusCleared => 'Aangepaste status gewist.';

  @override
  String get guildNavbarAnnouncementChannel => 'Aankondigingskanaal';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Plaats updates die andere communities in hun eigen kanalen kunnen volgen';

  @override
  String get channelDetailsAnnouncementChannel => 'Aankondigingskanaal';

  @override
  String get channelSettingsAnnouncementChannel => 'Aankondigingskanaal';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Laat andere communities dit kanaal volgen en kopieën ontvangen van wat je publiceert.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Stoppen als aankondigingskanaal?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count kanalen volgen dit kanaal. Als je het omzet naar een tekstkanaal, volgen die kanalen het niet meer.',
      one:
          '1 kanaal volgt dit kanaal. Als je het omzet naar een tekstkanaal, volgt dat kanaal het niet meer.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Als je dit kanaal omzet naar een tekstkanaal, volgt geen enkel kanaal het nog.';

  @override
  String get channelSettingsConvertChannel => 'Omzetten';

  @override
  String get channelSettingsConvertFailed =>
      'Dit kanaal kon niet worden omgezet';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Andere kanalen volgen dit kanaal nog. Verwijder die eerst voordat je het omzet.';

  @override
  String get channelMenuFollow => 'Kanaal volgen';

  @override
  String get channelFollowTitle => 'Volg dit kanaal';

  @override
  String get channelFollowBody =>
      'Kies waar de gepubliceerde berichten naartoe moeten. Je kunt op elk moment stoppen met volgen via Community-instellingen → Webhooks.';

  @override
  String get channelFollowCommunity => 'Community';

  @override
  String get channelFollowChannel => 'Kanaal';

  @override
  String get channelFollowAgeWarning =>
      'Dit is een kanaal met leeftijdsbeperking. Updates kunnen alleen naar kanalen met leeftijdsbeperking gaan.';

  @override
  String get channelFollowContentWarning =>
      'Dit kanaal heeft een inhoudswaarschuwing. Updates kunnen alleen naar kanalen met een inhoudswaarschuwing of leeftijdsbeperking gaan.';

  @override
  String get channelFollowHiddenHint =>
      'Communities en kanalen waar je geen webhooks kunt beheren, worden verborgen.';

  @override
  String get channelFollowEmpty =>
      'Je kunt in geen enkele community webhooks beheren. Vraag een beheerder om dit kanaal te volgen.';

  @override
  String get channelFollowSubmit => 'Volgen';

  @override
  String get channelFollowFailed => 'Dit kanaal kon niet worden gevolgd.';

  @override
  String get channelFollowSuccessTitle => 'Updates zijn onderweg!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'Berichten die zijn gepubliceerd in $sourceName worden weergegeven in #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Oké!';

  @override
  String get channelFollowBarrier =>
      'Volg dit kanaal om deze aankondigingen in een kanaal naar keuze te ontvangen.';

  @override
  String get channelHeaderFollow => 'Kanaal volgen';

  @override
  String get chatMessagePublish => 'Publiceren';

  @override
  String get chatMessagePublished => 'Gepubliceerd';

  @override
  String get chatMessagePublishConfirmTitle => 'Bericht publiceren?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Dit stuurt een kopie naar elk kanaal dat dit kanaal volgt.';

  @override
  String get chatMessagePublishedToast => 'Bericht gepubliceerd';

  @override
  String get chatMessageAlreadyPublished => 'Dit bericht is al gepubliceerd.';

  @override
  String get chatMessagePublishFailedTitle =>
      'Dit bericht kon niet worden gepubliceerd';

  @override
  String get chatMessagePublishFailedBody =>
      'Er is iets misgegaan. Probeer het over een ogenblik opnieuw.';

  @override
  String get chatMessagePublishLimitTitle => 'Rustig aan';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Je kunt weer publiceren over $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Je publiceert te snel. Probeer het over een ogenblik opnieuw.';

  @override
  String get chatMessageDeletePublished =>
      'Dit verwijdert ook de kopieën die zijn verzonden naar kanalen die dit kanaal volgen.';

  @override
  String get chatMessageEditPublishedTitle => 'Gepubliceerd bericht bewerken?';

  @override
  String get chatMessageEditPublishedBody =>
      'Dit werkt de kopieën bij die naar de kanalen zijn verzonden die dit kanaal volgen.';

  @override
  String get chatMessageEditPublishedSave => 'Opslaan';

  @override
  String get chatMessageEditLimitTitle => 'Rustig aan';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Je kunt dit gepubliceerde bericht over $duration opnieuw bewerken.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Je bewerkt dit gepubliceerde bericht te snel. Probeer het over een ogenblik opnieuw.';

  @override
  String get chatMessageOriginalDeleted => '[Origineel bericht verwijderd]';

  @override
  String get userTagCommunity => 'Community';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username laat dit kanaal nu $source volgen. Berichten die daar worden gepubliceerd, verschijnen hier.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username laat dit kanaal nu $source volgen.';
  }

  @override
  String get publishNudgeNotSent => 'Nog niet naar volgers verzonden.';

  @override
  String get publishNudgeHideForever => 'Niet meer weergeven';

  @override
  String get publishNudgeDismiss => 'Sluiten';

  @override
  String get channelSettingsFollowedChannels => 'Gevolgde kanalen';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Aankondigingskanalen die dit kanaal volgt. Ontvolg ze om geen kopieën meer te ontvangen.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Aankondigingskanalen die door kanalen in deze community worden gevolgd.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'Van $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Updates zijn gepauzeerd omdat het bronkanaal niet langer beschikbaar is.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return '$name niet meer volgen?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Dit kanaal ontvangt dan geen kopieën meer van dat aankondigingskanaal.';

  @override
  String get channelSettingsUnfollow => 'Ontvolgen';

  @override
  String get crosspostCommunityTitle => 'Community';

  @override
  String get crosspostGoToCommunity => 'Ga naar community';

  @override
  String get crosspostJoinCommunity => 'Lid worden van community';

  @override
  String get crosspostSourceFailed =>
      'Kon deze community niet laden. Probeer het later opnieuw.';

  @override
  String crosspostMembers(int count) {
    return '$count leden';
  }

  @override
  String crosspostOnline(int count) {
    return '$count online';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuten',
      one: '1 minuut',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconden',
      one: '1 seconde',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Niet-ondersteund kanaaltype';

  @override
  String get channelUnsupportedBody =>
      'Deze versie van de app ondersteunt dit kanaaltype niet.';

  @override
  String get channelDetailsUnsupportedChannel => 'Niet-ondersteund kanaal';

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
