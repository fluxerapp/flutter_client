// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class FluxerLocalizationsSv extends FluxerLocalizations {
  FluxerLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get reconnectingTitle => 'Vi har klantat till det!';

  @override
  String get chatJumpToPresent => 'Gå till de senaste meddelandena';

  @override
  String get chatViewingOlderMessages => 'Du visar äldre meddelanden';

  @override
  String get chatNewMessagesBarJumpToFirstUnread =>
      'Hoppa till det första olästa meddelandet';

  @override
  String get chatNewMessagesBarMarkAsRead => 'Markera som läst';

  @override
  String get chatNewMessagesBarMarkRead => 'Markera som läst';

  @override
  String chatNewMessagesBarNewMessagesSinceEstimated(
    int unreadCount,
    String compactTime,
  ) {
    final intl.NumberFormat unreadCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String unreadCountString = unreadCountNumberFormat.format(
      unreadCount,
    );

    return '$unreadCountString+ nya meddelanden sedan $compactTime';
  }

  @override
  String chatNewMessagesBarNewMessagesSince(
    int unreadCount,
    String compactTime,
  ) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount nya meddelanden',
      one: '$unreadCount nytt meddelande',
    );
    return '$_temp0 sedan $compactTime';
  }

  @override
  String chatNewMessagesBarNewSinceEstimated(
    int unreadCount,
    String shortTime,
  ) {
    final intl.NumberFormat unreadCountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String unreadCountString = unreadCountNumberFormat.format(
      unreadCount,
    );

    return '$unreadCountString+ nya sedan $shortTime';
  }

  @override
  String chatNewMessagesBarNewSince(int unreadCount, String shortTime) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount nya',
      one: '$unreadCount nytt',
    );
    return '$_temp0 sedan $shortTime';
  }

  @override
  String get reconnectingBody =>
      'Något är fel med instansen.\nBör vara fixat om en sekund!';

  @override
  String get gatewayReconnectingToast => 'Återansluter…';

  @override
  String get gatewayReconnectTryAgain => 'Försök igen';

  @override
  String get gatewayConnectedToast => 'Ansluten';

  @override
  String get sessionExpiredToast => 'Din session har gått ut. Logga in igen.';

  @override
  String splashStartupFailed(String error) {
    return 'Kunde inte starta: $error';
  }

  @override
  String get retry => 'Försök igen';

  @override
  String get splashConnectionLost => 'Anslutningen bröts';

  @override
  String get splashViewOnStatusPage => 'Visa på statusidan';

  @override
  String get splashConnectionIssuesPrompt => 'Anslutningsproblem?';

  @override
  String get splashStatusPageLink => 'Statusida';

  @override
  String get splashReadIncident => 'Läs incident';

  @override
  String get splashIncidentHistory => 'Incidenthistorik';

  @override
  String get nagbarLearnMore => 'Läs mer';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Underhåll är schemalagt till $localizedTime. Förväntad varaktighet: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Underhåll pågår. Förväntad varaktighet: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Underhållet är slutfört.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hej $displayName, säkra ditt konto så att du inte förlorar åtkomsten.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hej $displayName, verifiera din e-postadress.';
  }

  @override
  String get nagbarOpenSettings => 'Öppna inställningar';

  @override
  String get systemPermissionSettingsTitle => 'Aktivera behörighet';

  @override
  String get systemPermissionSettingsOpenSettings => 'Öppna inställningar';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName har inte åtkomst till din mikrofon. Du kan aktivera den i enhetens integritetsinställningar.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName har inte åtkomst till din kamera. Du kan aktivera den i enhetens sekretessinställningar.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName har inte åtkomst till ditt fotobibliotek. Du kan aktivera det i enhetens integritetsinställningar.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName har inte behörighet att skicka aviseringar. Du kan aktivera det i dina enhetsinställningar.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Din prenumeration kunde inte förnyas, men du har fortfarande tillgång till $productName-förmåner fram till $graceDate. Vidta åtgärder nu, annars förlorar du alla förmåner.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Din prenumeration på $productName har gått ut. Förnya nu för att behålla dina förmåner.';
  }

  @override
  String get nagbarManageSubscription => 'Hantera abonnemang';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Välkommen till $productFullName. Utforska dina $productName-förmåner och hantera din prenumeration.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Visa funktioner i $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Du har en ny gåvokod som väntar i ditt gåvobestånd.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Du har $count nya presentkoder som väntar i ditt presentförråd.';
  }

  @override
  String get nagbarViewGiftInventory => 'Visa presentlager';

  @override
  String get nagbarVisionaryMfa =>
      'Aktivera tvåfaktorsautentisering för att skydda ditt Visionary-konto.';

  @override
  String get nagbarEnableMfa => 'Aktivera 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Vi har uppdaterat våra villkor. Läs igenom och godkänn dem för att fortsätta.';

  @override
  String get nagbarReviewTerms => 'Granska villkoren';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Gå med i $communityName för att chatta med teamet och hålla dig uppdaterad.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Gå med i $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Aktivera notiser så att du inte missar meddelanden och omnämnanden.';

  @override
  String get nagbarEnableNotifications => 'Aktivera aviseringar';

  @override
  String get welcomeBack => 'Välkommen tillbaka';

  @override
  String get email => 'E-post';

  @override
  String get emailInvalid => 'Ange en giltig e-postadress.';

  @override
  String get password => 'Lösenord';

  @override
  String get forgotPassword => 'Glömt ditt lösenord?';

  @override
  String get logIn => 'Logga in';

  @override
  String get logInWithPasskey => 'Logga in med en säkerhetsnyckel';

  @override
  String continueWithSso(String provider) {
    return 'Fortsätt med $provider';
  }

  @override
  String get organizationSsoProvider =>
      'Logga in med din organisations SSO-leverantör.';

  @override
  String get failedToStartSso => 'Kunde inte starta SSO';

  @override
  String get ssoCancelled => 'SSO-inloggning avbröts';

  @override
  String preferSso(String provider) {
    return 'Föredrar du att använda SSO? Fortsätt med $provider.';
  }

  @override
  String get needAccountPrompt => 'Behöver du ett konto? ';

  @override
  String get register => 'Registrera dig';

  @override
  String get orDivider => 'ELLER';

  @override
  String get cancel => 'Avbryt';

  @override
  String get ipAuthCheckEmail => 'Kolla din e-post';

  @override
  String ipAuthDescription(String email) {
    return 'Vi skickade en länk för att auktorisera den här inloggningen. Öppna din inkorg för $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Anslutningen bröts';

  @override
  String get ipAuthConnectionLostDescription =>
      'Vi tappade anslutningen medan vi väntade på auktorisering. Försök igen.';

  @override
  String get ipAuthLinkExpired => 'Inloggningslänken har gått ut';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Den här auktoriseringslänken har gått ut. Logga in igen.';

  @override
  String get ipAuthResendEmail => 'Skicka e-post igen';

  @override
  String get ipAuthResent => 'Skickat igen';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Tillbaka';

  @override
  String get next => 'Nästa';

  @override
  String get create => 'Skapa';

  @override
  String get mfaTitle => 'Tvåfaktorsautentisering';

  @override
  String get mfaChooseMethod => 'Välj en verifieringsmetod';

  @override
  String get mfaMethodTotp => 'Autentiseringsapp';

  @override
  String get mfaMethodWebauthn => 'Säkerhetsnyckel/lösennyckel';

  @override
  String get mfaTotpDescription =>
      'Ange den 6-siffriga koden från din autentiseringsapp eller en av dina reservkoder.';

  @override
  String get mfaCodeLabel => 'Kod';

  @override
  String get mfaTryAnotherMethod => 'Prova en annan metod';

  @override
  String get mfaUseSecurityKey => 'Prova säkerhetsnyckel/lösennyckel i stället';

  @override
  String get accountSelectorTitle => 'Välj ett konto';

  @override
  String get accountSelectorDescription =>
      'Välj ett konto för att fortsätta, eller lägg till ett annat.';

  @override
  String get accountAdd => 'Lägg till ett konto';

  @override
  String get accountRemoveDescription =>
      'Detta tar bort den sparade sessionen för det här kontot.';

  @override
  String accountSignOutTitle(String identifier) {
    return 'Logga ut från $identifier?';
  }

  @override
  String get accountExpired => 'Utgånget';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sessionen har gått ut för $identifier. Logga in igen.';
  }

  @override
  String get accountManageTitle => 'Hantera konton';

  @override
  String get accountSwitchFailed => 'Kunde inte byta konto. Försök igen.';

  @override
  String get profileTabMenuSwitchAccounts => 'Byt konto';

  @override
  String get statusChangeSheetTitle => 'Ange status';

  @override
  String get statusOnlineStatusSection => 'Onlinestatus';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Inaktiv';

  @override
  String get statusDnd => 'Stör ej';

  @override
  String get statusInvisible => 'Osynlig';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Tills jag ändrar den';

  @override
  String get statusDontClear => 'Rensa inte';

  @override
  String get statusFor10Seconds => 'I 10 sekunder';

  @override
  String get statusClearAfter10Seconds => '10 sekunder';

  @override
  String get statusClearAfter15Minutes => '15 minuter';

  @override
  String get statusClearAfter30Minutes => '30 minuter';

  @override
  String get statusClearAfter1Hour => '1 timme';

  @override
  String get statusClearAfter3Hours => '3 timmar';

  @override
  String get statusClearAfter4Hours => '4 timmar';

  @override
  String get statusClearAfter8Hours => '8 timmar';

  @override
  String get statusClearAfter24Hours => '24 timmar';

  @override
  String get statusClearAfter3Days => '3 dagar';

  @override
  String get statusDndDescription => 'Du får inga aviseringar på datorn';

  @override
  String get statusInvisibleDescription => 'Du visas som offline';

  @override
  String get customStatusSetTitle => 'Ange anpassad status';

  @override
  String get customStatusCurrentHint => 'Anpassad status';

  @override
  String get customStatusClear => 'Rensa anpassad status';

  @override
  String get customStatusPlaceholder => 'Vad händer?';

  @override
  String get customStatusChooseEmoji => 'Välj en emoji';

  @override
  String get customStatusClearAfter => 'Rensa efter';

  @override
  String get customStatusSave => 'Spara';

  @override
  String get accountActive => 'Aktivt konto';

  @override
  String get signOut => 'Logga ut';

  @override
  String get suspendedPermanentTitle => 'Konto permanent avstängt';

  @override
  String get suspendedTemporaryTitle => 'Konto avstängt';

  @override
  String get suspendedPermanentDescription =>
      'Ditt konto har permanent avstängts för att du brutit mot våra användarvillkor.';

  @override
  String get suspendedTemporaryDescription =>
      'Ditt konto har tillfälligt avstängts. Du kommer att kunna komma åt ditt konto när avstängningsperioden löper ut.';

  @override
  String get suspendedIssuedAt => 'Utfärdat';

  @override
  String get suspendedEndsAt => 'Slutar';

  @override
  String get suspendedDuration => 'Varaktighet';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Anledning';

  @override
  String get suspendedAppealDeadline => 'Tidsfrist för överklagan';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Ditt konto är schemalagt för radering den $date.';
  }

  @override
  String get suspendedRecheck => 'Sök efter uppdateringar';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Försök igen om ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Tillbaka till inloggning';

  @override
  String get suspendedAppealTitle => 'Överklagan';

  @override
  String get suspendedAppealHint =>
      'Förklara varför din avstängning bör omprövas (minst 50 tecken)...';

  @override
  String get suspendedAppealSubmit => 'Skicka överklagan';

  @override
  String get suspendedAppealPending => 'Väntar på granskning';

  @override
  String get suspendedAppealAccepted => 'Överklagan godkänd';

  @override
  String get suspendedAppealRejected => 'Överklagan avvisad';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Din överklagan har godkänts och ditt konto har återställts.';

  @override
  String get suspendedSignIn => 'Logga in på ditt konto';

  @override
  String get forgotPasswordTitle => 'Glömt ditt lösenord?';

  @override
  String get forgotPasswordDescription =>
      'Ange din e-postadress så skickar vi en länk för att återställa ditt lösenord.';

  @override
  String get forgotPasswordSubmit => 'Skicka återställningslänk';

  @override
  String get forgotPasswordSentTitle => 'Kolla din e-post';

  @override
  String get forgotPasswordSentDescription =>
      'Vi har skickat instruktioner för lösenordsåterställning till din e-postadress. Kontrollera din inkorg och följ länken för att återställa ditt lösenord.';

  @override
  String get forgotPasswordBackToLogin => 'Tillbaka till inloggning';

  @override
  String get resetPasswordTitle => 'Ange nytt lösenord';

  @override
  String get resetPasswordDescription =>
      'Ange ditt nya lösenord nedan för att slutföra återställningsprocessen.';

  @override
  String get resetPasswordNewPassword => 'Nytt lösenord';

  @override
  String get resetPasswordConfirm => 'Bekräfta nytt lösenord';

  @override
  String get resetPasswordSubmit => 'Återställ lösenord';

  @override
  String get resetPasswordMismatch => 'Lösenorden matchar inte.';

  @override
  String get recoverAccountTitle => 'Återställ ditt konto';

  @override
  String get recoverAccountDescription =>
      'Ange ditt användarnamn och återställningsnyckeln från ditt återställningskit, välj sedan ett nytt lösenord.';

  @override
  String get recoverAccountNoKit =>
      'Inget återställningskit? Be en administratör för den här instansen om en länk för att återställa lösenordet.';

  @override
  String get recoveryKitTitle => 'Ditt återställningskit';

  @override
  String get recoveryKitCreatedDescription =>
      'Om du glömmer ditt lösenord är det här kitet det enda sättet att komma tillbaka till ditt konto. Spara det någonstans säkert, till exempel i en lösenordshanterare eller som en utskrift.';

  @override
  String get recoveryKitReplacedDescription =>
      'Din gamla återställningsnyckel fungerar inte längre. Förvara den nya på en säker plats.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Ditt lösenord har återställts. Ditt gamla återställningskit fungerar inte längre. Spara detta nya någonstans säkert.';

  @override
  String get recoveryKitWarning =>
      'Alla med den här nyckeln kan återställa ditt lösenord. Dela den aldrig.';

  @override
  String get recoveryKitKeyLabel => 'Återställningsnyckel';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return '$productName återställningskit';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Spara den här sidan på en säker plats. Om du glömmer ditt lösenord kan du använda den för att komma tillbaka till ditt konto. Vem som helst med den här återställningsnyckeln kan återställa ditt lösenord, så dela den aldrig.';

  @override
  String get recoveryKitInstanceLabel => 'Instans';

  @override
  String get recoveryKitCreatedAtLabel => 'Skapad';

  @override
  String get recoveryKitQrCaption =>
      'Skanna för att öppna återställningssidan med dina uppgifter ifyllda.';

  @override
  String get recoveryKitStepsTitle => 'Hur du återställer ditt konto';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Gå till $recoverUrl eller skanna QR-koden.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Ange ditt användarnamn och den här återställningsnyckeln.';

  @override
  String get recoveryKitStepPassword =>
      'Välj ett nytt lösenord. Du får ett nytt återställningskit och det här slutar fungera.';

  @override
  String get recoveryKitBackupCodesTitle =>
      'Säkerhetskoder för tvåfaktorsautentisering';

  @override
  String get recoveryKitBackupCodesNote =>
      'Varje kod fungerar en gång istället för din autentiseringsapp.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Kunde inte ladda dina säkerhetskopieringskoder.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Inkludera mina reservkoder för tvåfaktorsautentisering i den sparade bilden';

  @override
  String get recoveryKitCopy => 'Kopiera';

  @override
  String get recoveryKitCopied => 'Återställningsnyckeln har kopierats';

  @override
  String get recoveryKitSaveImage => 'Spara bild';

  @override
  String get recoveryKitSaved => 'Återställningspaketet har sparats';

  @override
  String get recoveryKitSavedToPhotos =>
      'Återställningspaketet har sparats i Bilder';

  @override
  String get recoveryKitSaveFailed =>
      'Det gick inte att spara återställningspaketet. Försök igen eller kopiera nyckeln i stället.';

  @override
  String get recoveryKitAcknowledge =>
      'Jag har sparat mitt återställningskit någonstans säkert';

  @override
  String get recoveryKitCreateFailed =>
      'Kunde inte skapa ditt återställningskit. Du kan skapa ett senare i dina kontoinställningar.';

  @override
  String get recoveryKitSectionTitle => 'Återställningskit';

  @override
  String get recoveryKitSectionDescription =>
      'Låter dig återställa ditt lösenord om du glömmer det.';

  @override
  String get recoveryKitNone => 'Du har ingen återställningskit än';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Skapad $time';
  }

  @override
  String get recoveryKitCreate => 'Skapa återställningskit';

  @override
  String get recoveryKitCreateNew => 'Skapa ett nytt kit';

  @override
  String get recoveryKitReplaceTitle => 'Skapa ett nytt återställningskit?';

  @override
  String get recoveryKitReplaceDescription =>
      'Ditt nuvarande kit slutar fungera så fort det nya skapas.';

  @override
  String get recoveryKitReminderTitle => 'Spara ett återställningskit';

  @override
  String get recoveryKitReminderBody =>
      'Ditt konto saknar e-postadress. Om du glömmer ditt lösenord är en återställningsnyckel det enda sättet att komma tillbaka. Det tar bara en minut.';

  @override
  String get registerUsernameSignInHint =>
      'Du loggar in med det här användarnamnet. Välj ett du kommer att komma ihåg.';

  @override
  String get registerUsernameTaken =>
      'Det här användarnamnet är redan upptaget';

  @override
  String get registerUsernameAvailable => 'Det här användarnamnet är ledigt';

  @override
  String get claimAccountUsernameDescription =>
      'Ange ett användarnamn och lösenord för ditt konto. Du loggar in med dem, så välj sådana du kommer att komma ihåg.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Ditt konto är inte anslutet än. Utan ett användarnamn och lösenord kan du inte logga in från andra enheter och du kan förlora åtkomsten till ditt konto. Anslut ditt konto nu för att säkra det.';

  @override
  String get addFriendUsernameOnlyHint => 'Användarnamn';

  @override
  String get registerTitle => 'Skapa ett konto';

  @override
  String get registerDisplayName => 'Visningsnamn (valfritt)';

  @override
  String get registerDisplayNameHint => 'Vad ska folk kalla dig?';

  @override
  String get registerUsername => 'Användarnamn (valfritt)';

  @override
  String get registerUsernameHint =>
      'Lämna tomt för ett slumpmässigt användarnamn';

  @override
  String get registerUsernameTagHint =>
      'En 4-siffrig tagg läggs automatiskt till för att säkerställa unikhet';

  @override
  String get registerDateOfBirth => 'Födelsedatum';

  @override
  String get registerMonth => 'Månad';

  @override
  String get registerDay => 'Dag';

  @override
  String get registerYear => 'År';

  @override
  String get registerConsentPrefix => 'Jag godkänner ';

  @override
  String get registerConsentTerms => 'Användarvillkor';

  @override
  String get registerConsentAnd => ' och ';

  @override
  String get registerConsentPrivacy => 'Integritetspolicy';

  @override
  String get registerConfirmPassword => 'Bekräfta lösenord';

  @override
  String get registerSubmit => 'Skapa konto';

  @override
  String get registerHaveAccount => 'Har du redan ett konto? ';

  @override
  String get registerPendingApproval =>
      'Din kontobegäran väntar på godkännande. Du kan logga in efter att en administratör har godkänt den.';

  @override
  String get registerClosed =>
      'Registreringen är för närvarande stängd. Använd en registreringslänk från en administratör för att skapa ett konto.';

  @override
  String get passkeyNoCredentials =>
      'Inga passkeys hittades för den här appen. Logga in med e-post och lösenord istället.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys stöds inte på den här enheten.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys är inte konfigurerade för den här appen. Logga in med e-post och lösenord istället.';

  @override
  String get passkeyTimeout =>
      'Passkey-autentiseringen tog för lång tid. Försök igen.';

  @override
  String get passkeyFailed =>
      'Autentisering med lösennyckel misslyckades. Försök igen.';

  @override
  String get errorUnableToCreateAccount =>
      'Kunde inte skapa konto. Försök igen.';

  @override
  String get errorUnableToSignIn => 'Kunde inte logga in just nu. Försök igen.';

  @override
  String get errorServiceUnavailable =>
      'Instansen är tillfälligt otillgänglig. Försök igen om en stund.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Ogiltig e-postadress eller lösenord.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Ogiltigt användarnamn eller lösenord.';

  @override
  String get errorUnableToSendResetLink =>
      'Kunde inte skicka återställningslänk. Försök igen.';

  @override
  String get errorUnableToResetPassword =>
      'Kunde inte återställa lösenord. Försök igen.';

  @override
  String get embedInviteJoin => 'Gå med i communityn';

  @override
  String get embedInviteGoTo => 'Gå till communityn';

  @override
  String embedInviteOnline(String count) {
    return '$count online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count medlemmar';
  }

  @override
  String get embedInviteUnknownTitle => 'Okänd inbjudan';

  @override
  String get embedInviteUnknownSubtitle => 'Testa att be om en ny inbjudan.';

  @override
  String get embedInviteUnavailable => 'Inbjudan är inte tillgänglig';

  @override
  String get embedInviteJoinGroup => 'Gå med i grupp';

  @override
  String get embedInviteAlreadyJoined => 'Redan medlem';

  @override
  String get embedInviteDisabled => 'Inbjudningar inaktiverade';

  @override
  String get embedInvitePaused =>
      'Inbjudningar är pausade för den här communityn.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName upptäckte en potentiell räd, så nya användare kan inte gå med just nu.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Den här communityn har pausat inbjudningar. Du kan försöka igen senare.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName upptäckte en potentiell räd i den här communityn. Inbjudningar är pausade, så nya användare kan inte gå med just nu.';
  }

  @override
  String get inviteAcceptTitle => 'Du har blivit inbjuden till';

  @override
  String get inviteAcceptJoinButton => 'Gå med i communityn';

  @override
  String get inviteAcceptGoToButton => 'Gå till communityn';

  @override
  String get inviteAcceptInvitesPaused => 'Inbjudningar pausade';

  @override
  String get inviteAcceptNotFoundTitle => 'Inbjudan ogiltig';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Den här inbjudan kan vara utgången eller ogiltig.';

  @override
  String get invalidDeepLinkTitle => 'Länken kunde inte öppnas';

  @override
  String get invalidDeepLinkDescription =>
      'Länken kan vara trasig, endast tillgänglig på webben, eller så kanske du inte har behörighet. Kontrollera länken och försök igen.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Gå till startsidan';

  @override
  String get inviteAcceptJoinGroupButton => 'Gå med i grupp';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Du har blivit inbjuden att gå med i en gruppchatt av $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'någon';

  @override
  String get mentionUnknownChannel => 'okänd-kanal';

  @override
  String get channelAccessDeniedTitle => 'Åtkomst till kanalen nekad';

  @override
  String get channelAccessDeniedDescription =>
      'Du har inte åtkomst till kanalen där meddelandet skickades.';

  @override
  String get messageJumpLinkNoAccess => 'Ingen åtkomst';

  @override
  String get okay => 'Okej';

  @override
  String get embedThemeTitle => 'Delat tema';

  @override
  String get embedThemeWebOnly =>
      'Du kan bara importera teman på webben eller datorn.';

  @override
  String get embedThemeImport => 'Importera tema';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (livstid $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagar med $productName',
      one: '1 dag med $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count veckor av $productName',
      one: '1 vecka av $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count månader av $productName',
      one: '1 månad av $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count år av $productName',
      one: '1 år av $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Från $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Klicka för att lösa in din present!';

  @override
  String get embedGiftAlreadyRedeemed => 'Redan inlöst';

  @override
  String get embedGiftClaimAccountHelp =>
      'Säkra ditt konto för att lösa in den här presenten.';

  @override
  String get embedGiftClaim => 'Lös in present';

  @override
  String get embedGiftClaimed => 'Presenten är inlöst';

  @override
  String get embedGiftClaimAccount => 'Säkra kontot för att lösa in';

  @override
  String get embedGiftUnknownTitle => 'Okänd present';

  @override
  String get embedGiftUnknownSubtitle =>
      'Den här presentkoden är ogiltig eller har redan lösts in.';

  @override
  String get embedGiftUnavailable => 'Presenten är inte tillgänglig';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Hämta din gåva för att aktivera din $productName-prenumeration!';
  }

  @override
  String get giftAcceptAlreadyClaimed =>
      'Den här presenten har redan lösts in.';

  @override
  String get giftAcceptMaybeLater => 'Kanske senare';

  @override
  String get giftRedeemedToast => 'Presenten är inlöst!';

  @override
  String get giftRedeemInvalidTitle => 'Ogiltig presentkod';

  @override
  String get giftRedeemInvalidMessage =>
      'Koden är ogiltig eller har redan använts.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Presenten är redan inlöst';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Den här koden har redan lösts in.';

  @override
  String get giftRedeemNotFoundTitle => 'Presenten hittades inte';

  @override
  String get giftRedeemNotFoundMessage => 'Koden finns inte.';

  @override
  String get giftRedeemFailedTitle => 'Kunde inte lösa in present';

  @override
  String get giftRedeemFailedMessage =>
      'Kunde inte lösa in presenten. Försök igen.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Kan inte lösa in den här gåvan';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Konton av typen Visionary kan inte lösa in Plutonium-gåvor. Kopiera länken för att dela den med en vän istället.';

  @override
  String get giftCopyLink => 'Kopiera presentlänk';

  @override
  String get privacySettings => 'Sekretessinställningar';

  @override
  String get privacyDirectMessages => 'Direktmeddelanden';

  @override
  String get privacyDirectMessagesDescription =>
      'Tillåt direktmeddelanden från andra medlemmar i denna community';

  @override
  String get privacyBotDirectMessages => 'Bot-direktmeddelanden';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Tillåt botar från denna community att skicka direktmeddelanden till dig';

  @override
  String get privacyMutualDmsDisabled =>
      'Communityadministratörerna har inaktiverat mottagning av direktmeddelanden enbart från gemensamma medlemmar i denna community.';

  @override
  String get communityDebug => 'Felsök community';

  @override
  String get copiedToClipboard => 'Kopierat till urklipp';

  @override
  String get notificationSettings => 'Aviseringsinställningar';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Tysta $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Att tysta en community förhindrar att olästa indikatorer och aviseringar visas om du inte blir omnämnd';

  @override
  String get notificationCommunitySettings =>
      'Inställningar för communityaviseringar';

  @override
  String get notificationAllMessages => 'Alla meddelanden';

  @override
  String get notificationOnlyMentions => 'Endast omnämnanden';

  @override
  String get notificationNothing => 'Inget';

  @override
  String get notificationSuppressEveryone => 'Undertryck @everyone och @here';

  @override
  String get notificationSuppressRoles => 'Tysta alla rollmeddelanden';

  @override
  String get notificationMobilePush => 'Pushaviseringar till mobilen';

  @override
  String get notificationOverrides => 'Åsidosättningar för aviseringar';

  @override
  String get notificationSelectChannel => 'Välj en kanal eller kategori';

  @override
  String get notificationOnlyAtMentions => 'Endast @omnämnanden';

  @override
  String get notificationMuteChannel => 'Tysta kanal';

  @override
  String get notificationUnmuteChannel => 'Sluta tysta kanalen';

  @override
  String get notificationUseCategoryDefault =>
      'Använd kategorins standardinställning';

  @override
  String get notificationUseCommunityDefault => 'Använd communityns standard';

  @override
  String get notificationNoCategory => 'Ingen kategori';

  @override
  String get dmMarkAsRead => 'Markera som läst';

  @override
  String get dmMuteConversation => 'Tysta DM';

  @override
  String get dmUnmuteConversation => 'Sluta tysta DM-konversationen';

  @override
  String get dmPinDm => 'Fäst DM';

  @override
  String get dmUnpinDm => 'Lossa DM-konversation';

  @override
  String get dmAlwaysShowInSidebar => 'Visa alltid i sidofältet';

  @override
  String get dmRemoveFromAlwaysShown => 'Ta bort från \"Visas alltid\"';

  @override
  String get dmCloseDm => 'Stäng DM';

  @override
  String get dmCloseDmConfirmTitle => 'Stäng DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Är du säker på att du vill stänga din DM med $username? Du kan alltid öppna den igen senare.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Ta bort dina meddelanden i den här konversationen?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Detta kommer att radera alla meddelanden du någonsin har skickat i den här konversationen permanent. Det går inte att ångra.';

  @override
  String get dmCopyChannelId => 'Kopiera kanal-ID';

  @override
  String get dmChannelIdCopied => 'Kanal-ID kopierat';

  @override
  String get dmCopyUserId => 'Kopiera användar-ID';

  @override
  String get dmUserIdCopied => 'Användar-ID kopierat';

  @override
  String get dmViewProfile => 'Visa profil';

  @override
  String get dmVoiceCall => 'Starta röstsamtal';

  @override
  String get incomingVoiceCallTitle => 'Inkommande röstsamtal';

  @override
  String get incomingVoiceCallAccept => 'Acceptera';

  @override
  String get incomingVoiceCallDecline => 'Avvisa';

  @override
  String get incomingVoiceCallLabel => 'Inkommande samtal';

  @override
  String get incomingVoiceCallIgnore => 'Ignorera';

  @override
  String get directVoiceCallNotEligible =>
      'Det går inte att starta det här samtalet just nu. Försök igen om en stund.';

  @override
  String get voiceJoinCallFailed =>
      'Kunde inte ansluta till samtalet. Kontrollera din anslutning och försök igen.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Kunde inte ansluta till samtalet. Kontrollera din anslutning och försök igen.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Kunde inte uppdatera samtalet på servern. Kontrollera din anslutning och försök igen.';

  @override
  String get dmAddNote => 'Lägg till anteckning';

  @override
  String get dmEditGroup => 'Redigera grupp';

  @override
  String get dmInviteToCommunity => 'Bjud in till community';

  @override
  String get dmBlock => 'Blockera';

  @override
  String get dmLeaveGroup => 'Lämna grupp';

  @override
  String dmInviteSentFor(String communityName) {
    return 'Inbjudan till $communityName skickad';
  }

  @override
  String get dmInviteSendFailed => 'Kunde inte skicka inbjudan. Försök igen.';

  @override
  String dmGroupMemberCount(int count) {
    return '$count medlemmar';
  }

  @override
  String get dmMuteFor15Min => 'I 15 minuter';

  @override
  String get dmMuteFor30Min => 'I 30 minuter';

  @override
  String get dmMuteFor1Hour => 'I 1 timme';

  @override
  String get dmMuteFor3Hours => 'I 3 timmar';

  @override
  String get dmMuteFor4Hours => 'I 4 timmar';

  @override
  String get dmMuteFor8Hours => 'I 8 timmar';

  @override
  String get dmMuteFor24Hours => 'I 24 timmar';

  @override
  String get dmMuteFor3Days => 'I 3 dagar';

  @override
  String get dmMuteForever => 'Tills jag slår på det igen';

  @override
  String get dmPinGroupDm => 'Fäst grupp-DM';

  @override
  String get dmUnpinGroupDm => 'Lossa grupp-DM-konversation';

  @override
  String get dmUnnamedGroup => 'Namnlös grupp';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grupp för $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Favoritmarkera DM';

  @override
  String get dmUnfavoriteDm => 'Ta bort DM från favoriter';

  @override
  String get dmFavoriteGroupDm => 'Favoritmarkera grupp-DM';

  @override
  String get dmUnfavoriteGroupDm => 'Ta bort grupp-DM från favoriter';

  @override
  String get dmChangeFriendNickname => 'Ändra väns smeknamn';

  @override
  String get dmRemoveFriend => 'Ta bort vän';

  @override
  String get dmAddFriend => 'Lägg till vän';

  @override
  String get dmAcceptFriendRequest => 'Acceptera vänförfrågan';

  @override
  String get dmIgnoreFriendRequest => 'Ignorera vänförfrågan';

  @override
  String get dmFriendRequestSent => 'Vänförfrågan skickad';

  @override
  String get dmUnblock => 'Avblockera';

  @override
  String get dmDebugUser => 'Felsök användare';

  @override
  String get dmDebugChannel => 'Felsök kanal';

  @override
  String get dmDebugCategory => 'Felsök kategori';

  @override
  String get dmPinned => 'Fäst DM';

  @override
  String get dmUnpinned => 'DM-konversationen lossad';

  @override
  String get dmMuted => 'Tystad DM';

  @override
  String get dmUnmuted => 'Avblockerad DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Ta bort vän';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Är du säker på att du vill ta bort $username som vän?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blockera användare';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Är du säker på att du vill blockera $username? De kommer inte att kunna skicka meddelanden till dig eller vänförfrågningar.';
  }

  @override
  String get dmFriendRequestSentToast => 'Vänförfrågan skickad';

  @override
  String get dmAddFriends => 'Lägg till vänner';

  @override
  String get addFriendSheetTitle => 'Lägg till vän';

  @override
  String get addFriendUsernameHint => 'Användarnamn#0000';

  @override
  String get addFriendUsernameLabel => 'Vännens användarnamn';

  @override
  String get addFriendSendRequest => 'Skicka förfrågan';

  @override
  String get addFriendNoUserFound =>
      'Ingen användare hittades med det användarnamnet.';

  @override
  String get addFriendInvalidUsername =>
      'Ange ett giltigt användarnamn (Användarnamn#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Vänförfrågan skickad';

  @override
  String get addFriendClaimTitle => 'Säkra ditt konto';

  @override
  String get addFriendClaimDescription =>
      'Säkra ditt konto för att skicka vänförfrågningar.';

  @override
  String get addFriendVerifyTitle => 'Verifiera din e-postadress';

  @override
  String get addFriendVerifyDescription =>
      'Du måste verifiera din e-postadress innan du kan skicka vänförfrågningar.';

  @override
  String get addFriendVerifyEmail => 'Verifiera e-postadress';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Inkommande vänförfrågningar ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Utgående vänförfrågningar ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Inkommande vänförfrågan';

  @override
  String get addFriendOutgoingStatus => 'Vänförfrågan skickad';

  @override
  String get addFriendViewProfile => 'Visa profil';

  @override
  String get addFriendAccept => 'Acceptera';

  @override
  String get addFriendIgnore => 'Ignorera';

  @override
  String get addFriendAcceptTitle => 'Acceptera vänförfrågan';

  @override
  String get addFriendIgnoreTitle => 'Ignorera vänförfrågan';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Acceptera vänförfrågan från $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorera vänförfrågan från $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Avbryt förfrågan';

  @override
  String get addFriendCancelRequestFailed =>
      'Kunde inte avbryta vänförfrågan. Försök igen.';

  @override
  String get addFriendNotAcceptingRequests =>
      'De tar inte emot vänförfrågningar just nu.';

  @override
  String get addFriendUnblockFirst =>
      'Avblockera dem först för att skicka en vänförfrågan.';

  @override
  String get addFriendCannotSendToSelf =>
      'Du kan inte skicka en vänförfrågan till dig själv.';

  @override
  String get addFriendAlreadyFriends =>
      'Du är redan vän med den här användaren.';

  @override
  String get addFriendClaimToSend =>
      'Slutför registreringen för att skicka vänförfrågningar.';

  @override
  String get addFriendVerifyToSend =>
      'Verifiera din e-postadress innan du skickar vänförfrågningar.';

  @override
  String get addFriendFriendsListFull =>
      'Din vänlista är full, eller så är deras det. Ta bort någon och försök igen.';

  @override
  String get addFriendSendFailedTitle => 'Kunde inte skicka vänförfrågan';

  @override
  String get addFriendSendFailedMessage =>
      'Kunde inte skicka vänförfrågan. Försök igen.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get userTagOp => 'TS';

  @override
  String get emojiSearchPlaceholder => 'Hitta emojin du drömmer om';

  @override
  String get emojiSearchEmpty => 'Inga emojis matchar din sökning';

  @override
  String get emojiAutocompleteDefaultLabel => 'Standardemoji';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Det här är en standardemoji i $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Den här emojin kommer från den här communityn. Du kan använda den överallt.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Det här är en anpassad emoji från en community.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Det här är en anpassad emoji från en community. Be upphovspersonen om en inbjudan för att använda den här emojin.';

  @override
  String get emojiInfoFromHeader => 'Den här emotikonen kommer från';

  @override
  String get emojiInfoDiscoverableCommunity => 'Listad i Utforska';

  @override
  String get emojiInfoPrivateCommunity => 'Privat community';

  @override
  String get emojiInfoVerifiedCommunity => 'Verifierad community';

  @override
  String get emojiInfoAddToFavorites => 'Lägg till i favoriter';

  @override
  String get emojiInfoRemoveFromFavorites => 'Ta bort från favoriter';

  @override
  String get emojiFrequentlyUsed => 'Ofta använda';

  @override
  String get emojiTabGifs => 'GIF:ar';

  @override
  String get emojiTabMedia => 'Medier';

  @override
  String get emojiTabStickers => 'Klistermärken';

  @override
  String get emojiTabEmojis => 'Emojier';

  @override
  String get gifPickerSearch => 'Sök GIF:ar';

  @override
  String get gifPickerSearchKlipy => 'Sök Klipy';

  @override
  String get gifPickerSearchTenor => 'Sök Tenor';

  @override
  String get gifPickerFavorites => 'Favoriter';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Inga favorit-GIF:ar än';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Föredra en GIF för att se den här.';

  @override
  String get gifPickerTrending => 'Trendande GIF:ar';

  @override
  String get gifPickerNoResultsTitle => 'Inga sökresultat';

  @override
  String get gifPickerNoResultsDescription => 'Prova en annan sökterm';

  @override
  String get gifPickerLoadFailedTitle => 'Kunde inte ladda GIF-bilder';

  @override
  String get gifPickerLoadFailedBody =>
      'Kontrollera din anslutning och försök igen.';

  @override
  String get emojiCategoryPeople => 'Personer';

  @override
  String get emojiCategoryNature => 'Natur';

  @override
  String get emojiCategoryFood => 'Mat och dryck';

  @override
  String get emojiCategoryActivity => 'Aktiviteter';

  @override
  String get emojiCategoryTravel => 'Resor och platser';

  @override
  String get emojiCategoryObjects => 'Föremål';

  @override
  String get emojiCategorySymbols => 'Symboler';

  @override
  String get emojiCategoryFlags => 'Flaggor';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Lås upp $emojiCount från $communityCount med Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellDismiss => 'Visa inte igen';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anpassade emojis',
      one: '1 anpassad emoji',
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
  String get externalLinkWarningTitle => 'Varning för extern länk';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Du är på väg att lämna $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Externa länkar kan vara farliga. Var försiktig.';

  @override
  String get externalLinkWarningDestinationUrl => 'Måladress:';

  @override
  String get externalLinksSectionTitle => 'Externa länkar';

  @override
  String get externalLinksSectionDescription =>
      'Konfigurera hur varningar för externa länkar hanteras.';

  @override
  String get externalLinkWarningTrustPrefix => 'Lita alltid på ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — hoppa över denna varning nästa gång';

  @override
  String get externalLinkVisitSite => 'Besök webbplatsen';

  @override
  String get externalLinkTrustAllLabel => 'Lita på alla externa länkar';

  @override
  String get externalLinkStripTrackingLabel =>
      'Ta bort spårningsparametrar från webbadresser';

  @override
  String get externalLinkStripTrackingDescription =>
      'Tar automatiskt bort spårningsparametrar (som utm_source, fbclid, gclid) från webbadresser i meddelanden du skickar. Rensar länken innan den når någon annan.';

  @override
  String get externalLinkTrustAllConfirmTitle => 'Lita på alla externa länkar?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Detta kommer att lita på alla externa länkar och hoppa över varningen för varje domän. Dina befintliga betrodda domäner kommer att ersättas. Detta är mindre säkert.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Lita på alla';

  @override
  String get externalLinkStopTrustingAllTitle => 'Sluta lita på alla länkar?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Varningar för externa länkar kommer att visas igen. Du måste lägga till betrodda domäner individuellt.';

  @override
  String get externalLinkStopTrustingAllAction => 'Inaktivera ”Lita på alla”';

  @override
  String get externalLinkTrustedAllDescription =>
      'Alla externa länkar är betrodda. Varningar kommer inte att visas.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Du har $count betrodd(e) domän(er). Lägg till fler genom att markera rutan när du besöker externa länkar.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'När detta är aktiverat visas inga varningar för externa länkar. Detta är mindre säkert.';

  @override
  String get imageFileTooLarge =>
      'Bildfilen är för stor. Välj en fil som är mindre än 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animerade avatarer kräver Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animerade banners kräver Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animerad AVIF stöds inte';

  @override
  String get animatedAvifNotSupportedBody =>
      'Beskärning och rotation av animerade AVIF-filer stöds inte ännu. Om du fortsätter laddas den upp i sitt ursprungliga format.';

  @override
  String get uploadAsIs => 'Ladda upp som den är';

  @override
  String get croppingAnimatedNotSupported =>
      'Beskärning av animerade bilder stöds inte ännu. Originaluppladdningen kommer att användas.';

  @override
  String get cropAvatar => 'Beskär avatar';

  @override
  String get cropBanner => 'Beskär banner';

  @override
  String get skip => 'Hoppa över';

  @override
  String get crop => 'Beskär';

  @override
  String get cropTouchHint => 'Nyp för att zooma, dra för att flytta';

  @override
  String get cropMouseHint =>
      'Dra i hörnen för att ändra storlek, dra inuti för att flytta';

  @override
  String get changeYourFluxerTag => 'Ändra ditt användarnamn';

  @override
  String get fluxerTagDescriptionBase =>
      'Användarnamn får bara innehålla bokstäver (a-z, A-Z), siffror (0-9) och understreck. Användarnamn är inte skiftlägeskänsliga.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Användarnamn får endast innehålla bokstäver (a-z, A-Z), siffror (0-9) och understreck. Användarnamn är skiftlägesokänsliga. Du kan välja vilken tillgänglig 4-siffrig tagg som helst från #0000 till #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Användarnamn får endast innehålla bokstäver (a-z, A-Z), siffror (0-9) och understreck. Användarnamn är skiftlägesokänsliga. Du kan välja vilken tillgänglig 4-siffrig tagg som helst från #0001 till #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Mellan $min och $max tecken';
  }

  @override
  String get validationAllowedChars =>
      'Endast bokstäver (a-z, A-Z), siffror (0-9) och understreck (_)';

  @override
  String get fluxerTagAlreadyTaken => 'Användarnamnet används redan';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Användarnamn $username#$discriminator är redan tagen. Om du fortsätter kommer din discriminator att rullas om automatiskt.';
  }

  @override
  String get customTagIsTemporary => 'Anpassad tagg är tillfällig';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Din anpassade 4-siffriga tagg är endast tillgänglig så länge din Plutonium-prenumeration är aktiv. När din prenumeration löper ut den $date återgår din tagg till ett slumpmässigt tilldelat nummer efter en 3-dagars respitperiod.';
  }

  @override
  String get customTagTemporaryBody =>
      'Din anpassade 4-siffriga tagg är endast tillgänglig så länge din Plutonium-prenumeration är aktiv. När din prenumeration löper ut återgår din tagg till ett slumpmässigt tilldelat nummer efter en 3-dagars respitperiod.';

  @override
  String get iUnderstandContinue => 'Jag förstår, fortsätt';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Om du sparar denna Användarnamn kommer din anpassade 4-siffriga tagg att återgå till ett slumpmässigt nummer när din Plutonium-prenumeration upphör. Om din prenumeration inte förnyas har du en 3-dagars respitperiod innan taggen ändras.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Din anpassade 4-siffriga tagg (#$discriminator) är aktiv så länge din Plutonium-prenumeration är aktiv. Om din prenumeration upphör eller inte förnyas efter en 3-dagars respitperiod, återgår din tagg till ett slumpmässigt nummer.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Anpassa din 4-siffriga tagg eller behåll den när du ändrar ditt användarnamn';

  @override
  String get fluxerTagUpdated => 'Användarnamnet uppdaterat';

  @override
  String get fluxerTagUpdateFailed =>
      'Kunde inte uppdatera Användarnamn. Försök igen.';

  @override
  String get continueAction => 'Fortsätt';

  @override
  String get profileCustomizationTitle => 'Anpassa profil';

  @override
  String get profileCustomizationDescription =>
      'Redigera profilens utseende och se en förhandsvisning direkt';

  @override
  String get usernameLabel => 'Användarnamn';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Säkra ditt konto för att ändra ditt användarnamn';

  @override
  String get changeFluxerTag => 'Ändra användarnamn';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Anpassa din 4-siffriga tagg (#$discriminator) som du vill med Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Ändra ditt användarnamn och din 4-siffriga tagg';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Din anpassade tagg (#$discriminator) är kopplad till din Plutonium-prenumeration och återgår till en slumpmässig tagg om den löper ut.';
  }

  @override
  String get displayNameLabel => 'Visningsnamn';

  @override
  String get pronounsLabel => 'Pronomen';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Ändra avatar';

  @override
  String get removeAvatar => 'Ta bort profilbild';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Rekommenderas: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Ändra banner';

  @override
  String get removeBanner => 'Ta bort banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10 MB. Minst: 960×540 px (16:9)';

  @override
  String get accentColorLabel => 'Accentfärg';

  @override
  String get accentColorDescription =>
      'Anpassar färgen på ramen och bannern i din profil';

  @override
  String get aboutMeLabel => 'Om mig';

  @override
  String get aboutMeHelperText =>
      'Du kan använda länkar, emojier och Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Sekretess för Plutonium-märke';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Styr hur ditt Plutonium-märke visas för andra';

  @override
  String get hidePlutoniumBadgeLabel => 'Dölj Plutonium-märket helt';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Dölj ditt Plutonium-märke helt för andra användare';

  @override
  String get hidePlutoniumPurchaseDate => 'Dölj Plutonium-köpdatum';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Dölj Plutonium-köpdatum ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Ta bort datumet då du först köpte Plutonium från ditt märke';

  @override
  String get maskVisionaryAsSubscription => 'Visa Visionary som ett abonnemang';

  @override
  String get maskVisionaryDescription =>
      'Visa ditt Visionary som ett vanligt abonnemang i stället';

  @override
  String get hideVisionaryIdBadge => 'Dölj märket för Visionary-ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Dölj Visionary ID-märke (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Ta bort ditt märke för Visionary-ID';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10MB. Rekommenderas: 512×512px. Animerade avatarer (GIF) kräver Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Anpassa din profil med en statisk eller animerad bannerbild för att få den att sticka ut.';

  @override
  String get getPlutonium => 'Skaffa Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Inköp i appen är ännu inte tillgängliga på den här plattformen. Håll utkik – kommer snart!';

  @override
  String get profilePreviewLabel => 'Förhandsgranska';

  @override
  String get profilePreviewMessage => 'Meddelande';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Medlem i $productName sedan';
  }

  @override
  String get unclaimedAccountTitle => 'Osäkrat konto';

  @override
  String get unclaimedAccountDescription =>
      'Ditt konto är ännu inte innhållet. Utan e-postadress och lösenord kan du förlora åtkomsten. Innehåll ditt konto nu för att säkra det.';

  @override
  String get claimAccount => 'Säkra kontot';

  @override
  String get profileTypeLabel => 'Profiltyp';

  @override
  String get profileTypeGlobal => 'Global profil';

  @override
  String get profileTypeGuildDescription =>
      'Du redigerar din profil för den här communityn. Den här profilen kommer bara att synas i den här communityn och kommer att åsidosätta din globala profil.';

  @override
  String get communityNicknameLabel => 'Smeknamn i communityn';

  @override
  String get perGuildPremiumUpsellText =>
      'Att anpassa din avatar, banner, accentfärg och biografi för enskilda communities kräver Plutonium. Smeknamn och pronomen i communityn är gratis för alla.';

  @override
  String get avatarModeInherit => 'Använd global profil';

  @override
  String get avatarModeCustom => 'Använd egen bild';

  @override
  String get avatarModeUnset => 'Visa inte';

  @override
  String get profileSavedToast => 'Profilen uppdaterad';

  @override
  String get sudoTitle => 'Verifiera din identitet';

  @override
  String get sudoDescription =>
      'Den här åtgärden kräver verifiering för att fortsätta.';

  @override
  String get sudoAuthenticatorCode => 'Autentiseringskod';

  @override
  String get sudoMethodPassword => 'Lösenord';

  @override
  String get sudoMethodTotp => 'Autentiserare';

  @override
  String get sudoVerificationFailed => 'Verifiering misslyckades. Försök igen.';

  @override
  String get securityAccountTitle => 'Konto';

  @override
  String get securityAccountDescription =>
      'Hantera din e-post, ditt lösenord och dina kontoinställningar';

  @override
  String get securitySectionTitle => 'Säkerhet';

  @override
  String get securitySectionDescription =>
      'Skydda ditt konto med tvåfaktorsautentisering och lösenordsnycklar';

  @override
  String get securityLoginEmailSectionTitle => 'E-postinställningar';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Hantera e-postadressen du använder för att logga in på $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'E-postadress';

  @override
  String get securityLoginNoEmailSet => 'Ingen e-postadress angiven';

  @override
  String get securityLoginChangeEmail => 'Ändra e-postadress';

  @override
  String get securityLoginAddEmail => 'Lägg till e-postadress';

  @override
  String get securityLoginReveal => 'Visa';

  @override
  String get securityLoginHide => 'Dölj';

  @override
  String get securityLoginPasswordSectionTitle => 'Lösenord';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Ändra ditt lösenord för att hålla ditt konto säkert';

  @override
  String get securityLoginCurrentPasswordLabel => 'Nuvarande lösenord';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Senast ändrat: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Senast ändrat: Aldrig';

  @override
  String get securityLoginNoPasswordSet => 'Inget lösenord angivet';

  @override
  String get securityLoginChangePassword => 'Ändra lösenord';

  @override
  String get securityLoginSetPassword => 'Ange lösenord';

  @override
  String get passwordChangeTitle => 'Ändra lösenord';

  @override
  String get passwordChangeIntroDescription =>
      'Vi skickar en verifieringskod till din e-postadress för att bekräfta din identitet innan du ändrar ditt lösenord.';

  @override
  String get passwordChangeStart => 'Starta';

  @override
  String get passwordChangeVerifyTitle => 'Verifiera din e-postadress';

  @override
  String get passwordChangeVerifyDescription =>
      'Ange verifieringskoden som skickades till din e-postadress.';

  @override
  String get passwordChangeVerificationCode => 'Verifieringskod';

  @override
  String get passwordChangeVerify => 'Verifiera';

  @override
  String get passwordChangeNewPasswordTitle => 'Ange nytt lösenord';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Ange ditt nya lösenord nedan.';

  @override
  String get passwordChangeNewPassword => 'Nytt lösenord';

  @override
  String get passwordChangeConfirmPassword => 'Bekräfta nytt lösenord';

  @override
  String get passwordChangeSubmit => 'Ändra lösenord';

  @override
  String get passwordChangeSuccess => 'Lösenord ändrat';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Lösenorden matchar inte';

  @override
  String get passwordChangeInvalidCode => 'Ogiltig eller utgången kod';

  @override
  String get emailChangeTitle => 'Ändra e-postadress';

  @override
  String get emailChangeIntroDescription =>
      'Vi skickar verifieringskoder för att bekräfta din identitet innan vi ändrar din e-postadress.';

  @override
  String get emailChangeStart => 'Starta';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'Verifiera nuvarande e-postadress';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Ange verifieringskoden som skickats till din nuvarande e-postadress.';

  @override
  String get emailChangeNewEmailTitle => 'Ange ny e-postadress';

  @override
  String get emailChangeNewEmailDescription =>
      'Ange den nya e-postadress du vill använda.';

  @override
  String get emailChangeNewEmailLabel => 'Ny e-postadress';

  @override
  String get emailChangeNewEmailSubmit => 'Skicka verifieringskod';

  @override
  String get emailChangeVerifyNewTitle => 'Verifiera ny e-postadress';

  @override
  String get emailChangeVerifyNewDescription =>
      'Ange verifieringskoden som skickats till din nya e-postadress.';

  @override
  String get emailChangeSuccess => 'E-postadress ändrad';

  @override
  String get emailChangeInvalidCode => 'Ogiltig eller utgången kod';

  @override
  String get resend => 'Skicka igen';

  @override
  String resendCountdown(int seconds) {
    return 'Skicka igen (${seconds}s)';
  }

  @override
  String get verificationCode => 'Verifieringskod';

  @override
  String get verify => 'Verifiera';

  @override
  String get enable => 'Aktivera';

  @override
  String get disable => 'Inaktivera';

  @override
  String get delete => 'Ta bort';

  @override
  String get save => 'Spara';

  @override
  String get securityTfaSectionTitle => 'Tvåfaktorsautentisering';

  @override
  String get securityTfaSectionDescription =>
      'Lägg till ett extra säkerhetslager till ditt konto';

  @override
  String get securityTfaAuthenticatorApp => 'Autentiseringsapp';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Tvåfaktorsautentisering är aktiverad';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Använd en autentiseringsapp för att generera koder för tvåfaktorsautentisering';

  @override
  String get securityTfaBackupCodes => 'Reservkoder';

  @override
  String get securityTfaBackupCodesDescription =>
      'Visa och hantera dina reservkoder för kontoåterställning';

  @override
  String get securityTfaViewCodes => 'Visa koder';

  @override
  String get securityPasskeysSectionTitle => 'Lösennycklar';

  @override
  String get securityPasskeysSectionDescription =>
      'Använd passkeys för inloggning utan lösenord och tvåfaktorsautentisering';

  @override
  String get securityPasskeysRegistered => 'Registrerade lösennycklar';

  @override
  String get securityPasskeysNone => 'Inga passkeys registrerade';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$count $_temp0 registrerade (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Lägg till lösennyckel';

  @override
  String securityPasskeysAdded(String date) {
    return 'Tillagd: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Senast använd: $date';
  }

  @override
  String get securityPasskeysRename => 'Byt namn';

  @override
  String get securityPasskeysDeleteTitle => 'Ta bort lösennyckel';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Är du säker på att du vill ta bort passkey \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Namnge lösennyckel';

  @override
  String get securityPasskeyNameLabel => 'Namn på lösennyckel';

  @override
  String get securityPasskeyNameHint => 't.ex. YubiKey, iPhone, jobbdator';

  @override
  String get securityClaimTitle => 'Säkerhetsfunktioner';

  @override
  String get securityClaimDescription =>
      'Säkra ditt konto för att använda säkerhetsfunktioner som tvåfaktorsautentisering och lösennycklar.';

  @override
  String get securityVerifyEmailRequired =>
      'Du måste verifiera din e-postadress innan du kan ställa in tvåfaktorsautentisering eller passkeys.';

  @override
  String get totpEnableTitle => 'Ställ in autentiseringsapp';

  @override
  String get totpEnableDescription =>
      'Skanna QR-koden med din autentiseringsapp för att generera koder för tvåfaktorsautentisering.';

  @override
  String get totpEnableCodeLabel => 'Kod';

  @override
  String get totpEnableCodeHint =>
      'Ange den 6-siffriga koden från din autentiseringsapp';

  @override
  String get totpEnableSuccess => 'Tvåfaktorsautentisering har aktiverats';

  @override
  String get totpDisableTitle => 'Ta bort autentiseringsapp';

  @override
  String get totpDisableDescription =>
      'Ange den 6-siffriga koden från din autentiseringsapp för att inaktivera tvåfaktorsautentisering.';

  @override
  String get totpDisableSuccess => 'Tvåfaktorsautentisering inaktiverad';

  @override
  String get backupCodesTitle => 'Reservkoder';

  @override
  String get backupCodesWarning =>
      'Om du tappar bort åtkomsten till din autentiseringsapp och inte har dessa koder, kommer du att bli permanent utelåst från ditt konto. Ladda ner eller kopiera dem nu och förvara dem på en säker plats.';

  @override
  String get backupCodesCopy => 'Kopiera';

  @override
  String get backupCodesCopied =>
      'Säkerhetskopieringskoder kopierade till urklipp';

  @override
  String get backupCodesAcknowledge =>
      'Jag har laddat ner eller kopierat mina säkerhetskopieringskoder och förvarat dem på en säker plats.';

  @override
  String get backupCodesDone => 'Klar';

  @override
  String get dangerZoneSectionTitle => 'Riskfyllda åtgärder';

  @override
  String get dangerZoneSectionDescription =>
      'Oåterkalleliga och destruktiva åtgärder';

  @override
  String get dangerZoneDisableTitle => 'Inaktivera konto';

  @override
  String get dangerZoneDisableDescription =>
      'Inaktivera ditt konto tillfälligt. Du kan återaktivera det senare genom att logga in igen.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Att inaktivera ditt konto kommer att logga ut dig från alla sessioner. Du kan återaktivera ditt konto när som helst genom att logga in igen.';

  @override
  String get dangerZoneDeleteTitle => 'Ta bort konto';

  @override
  String get dangerZoneDeleteDescription =>
      'Radera ditt konto och all tillhörande data permanent. Den här åtgärden kan inte ångras.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Kan inte radera konto';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Du kan inte ta bort ditt konto medan du äger communities. Överför ägarskapet för följande communities först:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'och $count till';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'För att överföra ägarskap, gå till $settingsPath och använd alternativet för att överföra ägarskap.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Är du säker på att du vill ta bort ditt konto? Detta kommer att schemalägga ditt konto för permanent radering.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Du kan avbryta raderingen inom 14 dagar';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Efter 14 dagar raderas ditt konto permanent';

  @override
  String get dangerZoneDeleteBullet3 =>
      'När borttagningen har behandlats kan du inte längre återfå åtkomst till ditt konto';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Du kommer inte att kunna ta bort dina skickade meddelanden efter att ditt konto har tagits bort';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Om du vill exportera din data eller ta bort dina meddelanden först, besök avsnittet Sekretessinstrumentpanel i Användarinställningar innan du fortsätter.';

  @override
  String get claimAccountTitle => 'Säkra ditt konto';

  @override
  String get claimAccountDescription =>
      'Säkra ditt konto genom att lägga till en e-postadress och ett lösenord. Vi skickar en verifieringskod för att bekräfta e-postadressen innan vi slutför processen.';

  @override
  String get claimAccountEmailLabel => 'E-post';

  @override
  String get claimAccountPasswordLabel => 'Lösenord';

  @override
  String get claimAccountSendCode => 'Skicka kod';

  @override
  String get claimAccountVerifyDescription =>
      'Ange koden vi skickade till din e-post för att verifiera den. Ditt lösenord ställs in när koden har bekräftats.';

  @override
  String get claimAccountSuccess => 'Kontot har säkrats';

  @override
  String get importantInformation => 'Viktig information:';

  @override
  String get genericError => 'Ett fel uppstod';

  @override
  String get networkErrorMessage => 'Något gick fel. Försök igen.';

  @override
  String get invalidCode => 'Ogiltig kod';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count år sedan',
      one: '1 år sedan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count månader sedan',
      one: '1 månad sedan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagar sedan',
      one: '1 dag sedan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count timmar sedan',
      one: '1 timme sedan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuter sedan',
      one: '1 minut sedan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count veckor sedan',
      one: '1 vecka sedan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count minuter',
      one: 'om 1 minut',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count timmar',
      one: 'om 1 timme',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count dagar',
      one: 'om 1 dag',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count veckor',
      one: 'om 1 vecka',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count månader',
      one: 'om 1 månad',
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
  String get relativeTimeJustNow => 'nyss';

  @override
  String get authorizedAppsTitle => 'Auktoriserade appar';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Dessa program har beviljats åtkomst till ditt $productName-konto.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Inga auktoriserade appar';

  @override
  String get authorizedAppsEmptyDescription =>
      'Du har inte auktoriserat några appar att komma åt ditt konto.';

  @override
  String get authorizedAppsLoadError =>
      'Kunde inte läsa in auktoriserade appar';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Auktoriserad $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Beviljade behörigheter';

  @override
  String get authorizedAppsRevoke => 'Återkalla';

  @override
  String get authorizedAppsRevokeTitle => 'Återkalla programåtkomst';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Är du säker på att du vill återkalla åtkomsten för $appName? Detta program kommer inte längre att ha åtkomst till ditt konto.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Få åtkomst till din grundläggande profilinformation (användarnamn, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'Visa din e-postadress';

  @override
  String get authorizedAppsScopeGuilds => 'Visa de communities du är medlem i';

  @override
  String get authorizedAppsScopeConnections => 'Visa dina anslutna konton';

  @override
  String get authorizedAppsScopeBot =>
      'Lägg till en bot i en community med begärda behörigheter';

  @override
  String get authorizedAppsScopeAdmin =>
      'Åtkomst till administrativa slutpunkter';

  @override
  String get applicationsTitle => 'Appar';

  @override
  String get applicationsCreate => 'Skapa applikation';

  @override
  String get applicationsCreateSubmit => 'Skapa';

  @override
  String get applicationsCreateClaimTooltip =>
      'Säkra ditt konto för att skapa appar.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Läs dokumentationen ($domain)';
  }

  @override
  String get applicationsLoadError => 'Det gick inte att läsa in applikationer';

  @override
  String get applicationsLoadErrorDescription =>
      'Kontrollera din anslutning och försök igen.';

  @override
  String get applicationsEmptyTitle => 'Inga appar än';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Skapa din första applikation för att komma igång med $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Skapad $date';
  }

  @override
  String get applicationsName => 'Appnamn';

  @override
  String get applicationsNameHint => 'Min applikation';

  @override
  String get applicationsNameRequired => 'Applikationsnamn krävs';

  @override
  String get applicationsBackToList => 'Tillbaka till listan';

  @override
  String get applicationsDetailLoadError =>
      'Det gick inte att läsa in den här applikationen';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Försök igen eller gå tillbaka till applistan.';

  @override
  String get applicationsId => 'Applikations-ID';

  @override
  String get applicationsCopyId => 'Kopiera ID';

  @override
  String get applicationsSecretsTitle => 'Hemligheter och token';

  @override
  String get applicationsSecretsDescription =>
      'Förvara dem säkert. Om du skapar nya slutar befintliga integrationer att fungera.';

  @override
  String get applicationsClientSecret => 'Klienthemlighet';

  @override
  String get applicationsBotToken => 'Bot-token';

  @override
  String get applicationsRegenerate => 'Generera nya';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Skapa en ny klienthemlighet?';

  @override
  String get applicationsRegenerateBotTokenTitle => 'Generera ny bot-token?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Om du skapar en ny hemlighet blir den nuvarande ogiltig. Uppdatera all kod som använder det gamla värdet.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Om du skapar en ny token blir den nuvarande ogiltig. Uppdatera all kod som använder det gamla värdet.';

  @override
  String get applicationsClientSecretRegenerated =>
      'En ny klienthemlighet har skapats. Uppdatera all kod som använder den gamla.';

  @override
  String get applicationsBotTokenRegenerated =>
      'En ny bot-token har skapats. Uppdatera all kod som använder den gamla.';

  @override
  String get applicationsRegenerateFailed => 'Kunde inte skapa en ny hemlighet';

  @override
  String get applicationsInfoTitle => 'Appinformation';

  @override
  String get applicationsInfoDescription =>
      'Grundläggande inställningar och tillåtna omdirigerings-URI:er.';

  @override
  String get applicationsPublicBot => 'Offentlig bot';

  @override
  String get applicationsPublicBotDescription =>
      'Tillåt vem som helst att bjuda in den här boten till sina communities.';

  @override
  String get applicationsRequireCodeGrant =>
      'Kräv auktoriseringskodflödet i OAuth2';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Kräver en omdirigerings-URI och en auktoriseringskod när denna bot bjuds in.';

  @override
  String get applicationsRedirectUris => 'Omdirigerings-URI:er';

  @override
  String get applicationsAddRedirect => 'Lägg till omdirigering';

  @override
  String get applicationsDeleteRedirect => 'Ta bort omdirigerings-URI';

  @override
  String get applicationsBotProfileTitle => 'Botprofil';

  @override
  String get applicationsBotProfileDescription =>
      'Avatar, tagg och utförlig profilinformation för din bot.';

  @override
  String get applicationsBotAvatar => 'Bot-avatar';

  @override
  String get applicationsUsernameRequired => 'Användarnamn krävs';

  @override
  String get applicationsUsernameTooLong =>
      'Användarnamnet får vara högst 32 tecken långt';

  @override
  String get applicationsUsernameInvalid =>
      'Användarnamnet får bara innehålla bokstäver, siffror och understreck';

  @override
  String get applicationsBotUsername => 'Botanvändarnamn';

  @override
  String get applicationsDiscriminator => 'Diskriminator';

  @override
  String get applicationsBotBio => 'Botpresentation';

  @override
  String get applicationsBotBioHint =>
      'En hjälpsam bot som gör fantastiska saker!';

  @override
  String get applicationsNoBotBanner => 'Ingen bot-banner';

  @override
  String get applicationsFriendlyBot => 'Vänlig bot';

  @override
  String get applicationsFriendlyBotDescription =>
      'Tillåt användare att skicka vänförfrågningar till den här boten för manuellt godkännande.';

  @override
  String get applicationsManualFriendApproval =>
      'Kräv manuellt godkännande av vänförfrågningar';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Vänförfrågningar till den här boten behöver godkännas manuellt.';

  @override
  String get applicationsOauthBuilderTitle => 'OAuth2-URL-byggare';

  @override
  String get applicationsOauthBuilderDescription =>
      'Skapa en auktoriserings-URL med scopes och behörigheter.';

  @override
  String get applicationsScopes => 'Behörighetsomfång';

  @override
  String get applicationsRedirectUri => 'Omdirigerings-URI';

  @override
  String get applicationsSelectRedirectUri => 'Välj en omdirigerings-URI';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'Omdirigerings-URI krävs eftersom den här boten behöver auktoriseringskodflödet i OAuth2.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'Omdirigerings-URI krävs när du använder andra behörighetsomfång än enbart bot.';

  @override
  String get applicationsBotPermissions => 'Botbehörigheter';

  @override
  String get applicationsAuthorizeUrl => 'Auktorisera URL';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Välj behörighetsomfång (och omdirigerings-URI om det behövs)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Kopiera auktoriserings-URL';

  @override
  String get applicationsCopiedUrl => 'URL kopierad till urklipp';

  @override
  String get applicationsDangerTitle => 'Riskfyllda åtgärder';

  @override
  String get applicationsDangerSubtitle =>
      'Detta kan inte ångras. Om du tar bort applikationen raderas även dess bot.';

  @override
  String get applicationsDangerHelper =>
      'När applikationen har raderats tas den och dess inloggningsuppgifter bort permanent.';

  @override
  String get applicationsDelete => 'Ta bort applikation';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Är du säker på att du vill ta bort $name? Det här kan inte ångras. All tillhörande data, inklusive botanvändaren, raderas permanent.';
  }

  @override
  String get applicationsDeleteFailed => 'Kunde inte ta bort applikationen';

  @override
  String get applicationsUpdated => 'Applikationen har uppdaterats';

  @override
  String get applicationsNoChanges => 'Inga ändringar att spara';

  @override
  String get applicationsSearchBots => 'Appar och botar';

  @override
  String get applicationsSearchBotsDescription =>
      'Skapa och hantera appar och botar för ditt konto';

  @override
  String get applicationsSearchInfoDescription =>
      'Redigera appens grundinställningar och omdirigerings-URI:er';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Redigera botens avatar, tagg, presentation, banner och beteende för vänförfrågningar';

  @override
  String get applicationsSearchOauthDescription =>
      'Skapa en auktoriserings-URL med behörighetsomfång, omdirigeringar och botbehörigheter';

  @override
  String get applicationsSearchSecretsDescription =>
      'Visa och skapa nya klienthemligheter och bot-token';

  @override
  String get applicationsSearchBotsKeyword => 'Botar';

  @override
  String get applicationsSearchDocumentation => 'Dokumentation';

  @override
  String get blockedUsersTitle => 'Blockerade användare';

  @override
  String get blockedUsersDescription =>
      'Blockerade användare kan inte skicka dig vänförfrågningar eller meddelanden direkt.';

  @override
  String get blockedUsersEmptyTitle => 'Inga blockerade användare';

  @override
  String get blockedUsersEmptyDescription => 'Du har inte blockerat någon än.';

  @override
  String get blockedUsersLoadError => 'Kunde inte ladda blockerade användare';

  @override
  String get blockedUsersUnblock => 'Avblockera';

  @override
  String get blockedUsersUnblockTitle => 'Avblockera användare';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Är du säker på att du vill avblockera $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopiera användarnamn';

  @override
  String get blockedUsersCopyId => 'Kopiera användar-ID';

  @override
  String get userProfileLoadError => 'Kunde inte ladda profil';

  @override
  String get userProfileLoading => 'Laddar profil';

  @override
  String get userProfileRetry => 'Försök igen';

  @override
  String get userProfileMessage => 'Meddelande';

  @override
  String get userProfileVoiceCall => 'Röstsamtal';

  @override
  String get userProfileVideoCall => 'Videosamtal';

  @override
  String get userProfileEditProfile => 'Redigera profil';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName-personal';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '${productName}s communityteam';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName-partner';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName-buggjägare';
  }

  @override
  String userProfilePremiumSubscriberSinceTooltip(
    String premiumProductFullName,
    String date,
  ) {
    return 'Abonnent på $premiumProductFullName sedan $date';
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
    return '$productName Visionary sedan $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary-ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Gemensamma vänner ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Gemensamma communities ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Gemensamma vänner';

  @override
  String get userProfileMutualCommunitiesTitle => 'Gemensamma communities';

  @override
  String get userProfileNoMutualFriends => 'Inga gemensamma vänner hittades.';

  @override
  String get userProfileNoMutualCommunities =>
      'Inga gemensamma communities hittades.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Smeknamn: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Öppna DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Du blockerade $username. Du kan inte skicka meddelanden om du inte avblockerar dem.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Avblockera';

  @override
  String get userProfileOpenDm => 'Öppna DM';

  @override
  String get userProfileNoteTitle => 'Anteckning';

  @override
  String get userProfileNoteVisibility => '(bara synligt för dig)';

  @override
  String get userProfileNoteSave => 'Spara';

  @override
  String get userProfileNoteDelete => 'Ta bort';

  @override
  String get userProfileMemberSince => 'Medlem sedan';

  @override
  String get userProfileAboutMe => 'Om mig';

  @override
  String get userProfileRoles => 'Roller';

  @override
  String get memberRoleAdd => 'Lägg till roll';

  @override
  String memberRoleRemove(String roleName) {
    return 'Ta bort rollen $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Den här användaren har inga roller i den här communityn.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Inga roller än. Lägg till roller i $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Inga roller tillgängliga';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Det finns inga roller att tilldela i den här communityn för tillfället, men du kan skapa en ny roll i $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Communityinställningar';

  @override
  String get guildSettingsRolesTab => 'Roller';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Lokal tid';

  @override
  String get profileLocalTimeSettingsTitle => 'Lokal tid på profilen';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Ställ in din tidszon så att $productName kan hålla din UTC-förskjutning aktuell när sommartiden ändras. Andra användare kan bara se din UTC-förskjutning, inte din exakta tidszonsidentifierare.';
  }

  @override
  String get profileLocalTimeEditButton => 'Redigera lokal tid för profil';

  @override
  String get profileLocalTimeTimezoneLabel => 'Tidszon';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Välj den tidszon som $productName använder för att beräkna din UTC-förskjutning och visa rätt tid i din profil.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Sök tidszoner';

  @override
  String get profileLocalTimeNotSet => 'Inte inställt';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'När du delar lokal tid i profilen kan andra bara se din aktuella UTC-förskjutning. De ser inte din exakta tidszonsidentifierare, till exempel $timezoneIdentifierExample. $productName lagrar identifieraren enbart för att förskjutningen ska kunna uppdateras automatiskt vid övergångar mellan sommar- och normaltid.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Alla';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Tillåt alla som kan se din fullständiga profil att se din lokala tid i profilen';

  @override
  String get profileLocalTimePrivacyFriends => 'Vänner';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Låt dina vänner se din lokala tid på profilen';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Communitymedlemmar';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Låt medlemmar i communities du är med i se din lokala tid';

  @override
  String get userProfileSameTimeAsYou => 'Samma tid som du';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration före dig';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration efter dig';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours timmar',
      one: '1 timme',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuter',
      one: '1 minut',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours timmar',
      one: '1 timme',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuter',
      one: '1 minut',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Kopiera användarnamn';

  @override
  String get userProfileCopyUserId => 'Kopiera användar-ID';

  @override
  String get userProfileViewMainProfile => 'Visa huvudprofil';

  @override
  String get userProfileViewCommunityProfile => 'Visa communityprofil';

  @override
  String get userProfileBlockUser => 'Blockera användare';

  @override
  String get userProfileUnblockUser => 'Avblockera användare';

  @override
  String get userProfileRemoveFriend => 'Ta bort vän';

  @override
  String get userProfileBlockConfirmTitle => 'Blockera användare';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Är du säker på att du vill blockera $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Avblockera användare';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Är du säker på att du vill avblockera $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Ta bort vän';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Är du säker på att du vill ta bort $username som vän?';
  }

  @override
  String get userProfileFailedSaveNote =>
      'Det gick inte att spara anteckningen';

  @override
  String get userProfileChangeNickname => 'Ändra smeknamn';

  @override
  String get userProfileKick => 'Sparka ut';

  @override
  String get userProfileBan => 'Bannlys';

  @override
  String get userProfileTimeout => 'Stäng av tillfälligt';

  @override
  String get userProfileRemoveTimeout => 'Ta bort timeout';

  @override
  String get userProfileTransferOwnership => 'Överför ägarskap';

  @override
  String get userProfileReportMessage => 'Anmäl meddelande';

  @override
  String get userProfileReportUserProfile => 'Anmäl profil';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Spark $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Är du säker på att du vill sparka $username? De kan återansluta med en ny inbjudan.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Ta bort avstängning?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Att ta bort avstängningen gör att $username kan skicka meddelanden, reagera och ansluta till röstkanaler igen.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Överför ägarskap?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Överför ägarskapet för den här communityn till $username? Detta är oåterkalleligt och du kommer att förlora alla ägarbehörigheter.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Blockera $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Bannlysningens längd';

  @override
  String get userProfileBanCustomSecondsLabel => 'Anpassad tid (sekunder)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Valfritt värde från $min till $max sekunder';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Ta bort meddelandehistorik';

  @override
  String get userProfileBanDeleteNone => 'Radera inget';

  @override
  String get userProfileBanDelete24h => 'Senaste 24 timmarna';

  @override
  String get userProfileBanDelete7d => 'Senaste 7 dagarna';

  @override
  String get userProfileBanReasonLabel => 'Anledning (valfritt)';

  @override
  String get userProfileBanReasonHint => 'Ange en anledning till bannlysningen';

  @override
  String get userProfileBanSubmit => 'Bannlys medlem';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Stäng av $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Timeoutens längd';

  @override
  String get userProfileTimeoutSubmit => 'Stäng av medlem';

  @override
  String get userProfileNicknameLabel => 'Smeknamn';

  @override
  String get userProfileNicknameHint => 'Ange ett smeknamn';

  @override
  String get userProfileNicknameSave => 'Spara';

  @override
  String userProfileKickSuccess(String username) {
    return 'Har sparkat $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Har blockerat $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Har stängt av $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Har tagit bort avstängning för $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Smeknamn uppdaterat';

  @override
  String get userProfileTransferSuccess => 'Ägarskap överfört';

  @override
  String get durationPermanent => 'Permanent';

  @override
  String get duration60Seconds => '60 sekunder';

  @override
  String get duration5Minutes => '5 minuter';

  @override
  String get duration10Minutes => '10 minuter';

  @override
  String get duration1Hour => '1 timme';

  @override
  String get duration12Hours => '12 timmar';

  @override
  String get duration1Day => '1 dag';

  @override
  String get duration3Days => '3 dagar';

  @override
  String get duration5Days => '5 dagar';

  @override
  String get duration1Week => '1 vecka';

  @override
  String get duration2Weeks => '2 veckor';

  @override
  String get duration1Month => '1 månad';

  @override
  String get durationCustom => 'Anpassad…';

  @override
  String typingIndicatorOne(String name) {
    return '$name skriver...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 och $name2 skriver...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 och $name3 skriver...';
  }

  @override
  String get typingIndicatorMultiple => 'Flera personer skriver...';

  @override
  String get typingIndicatorHandful =>
      'En handfull tangentbordskrigare samlas...';

  @override
  String get typingIndicatorSymphony =>
      'En symfoni av tangenttryckningar pågår...';

  @override
  String get typingIndicatorFiesta => 'Det är en fullständig skrivfest här';

  @override
  String get typingIndicatorApocalypse => 'Oj, det är en skrivapokalyps';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Kul att du är här, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Välkommen, $username! Känn dig som hemma.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hej, $username! Kul att du är här.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hej, $username! Hoppa in när du är redo.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hej $username, kul att se dig här!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hej $username! Hoppas du får en trevlig vistelse.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hej, $username, välkommen ombord!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Kul att du är här, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Välkommen, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Välkommen, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Välkommen, $username! Vi är glada att du är här.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Välkommen, $username! Hoppas du får en trevlig stund här.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Välkommen, $username! Din nästa konversation börjar här.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Välkommen, $username. Vi är glada att du är här.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Kul att se dig, $username! Välkommen hit.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Välkommen, $username! Kul att du är med oss.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Välkommen, $username! Nu kör vi.';
  }

  @override
  String get relativeTimeShortNow => 'nu';

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
      other: '$count tim',
      one: '1 tim',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count d',
      one: '1 d',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}mån',
      one: '1mån',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count år',
      one: '1 år',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Mina enheter';

  @override
  String get linkedDevicesDescription =>
      'Se alla enheter som för närvarande är inloggade på ditt konto. Återkalla alla sessioner som du inte känner igen.';

  @override
  String get linkedDevicesCurrentDevice => 'Den här enheten';

  @override
  String get linkedDevicesOtherDevices => 'Andra enheter';

  @override
  String get linkedDevicesEnterSelection => 'Aktivera urvals­läge';

  @override
  String get linkedDevicesExitSelection => 'Avsluta urvals­läge';

  @override
  String get linkedDevicesSelectAll => 'Markera allt';

  @override
  String get linkedDevicesClearSelection => 'Rensa markering';

  @override
  String get linkedDevicesRevokeTooltip => 'Återkalla enhetens åtkomst';

  @override
  String get linkedDevicesSignOutAll => 'Logga ut från alla andra enheter';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Logga ut $count enheter',
      one: 'Logga ut 1 enhet',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Logga ut $count enheter',
      one: 'Logga ut 1 enhet',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Logga ut från alla andra enheter';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Detta loggar ut de valda enheterna från ditt konto. Du måste logga in igen på dessa enheter.',
      one:
          'Detta loggar ut den valda enheten från ditt konto. Du måste logga in igen på den enheten.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Detta loggar ut de valda enheterna från ditt konto. Du måste logga in igen på dessa enheter.';

  @override
  String get linkedDevicesSignOutConfirm => 'Fortsätt';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Du måste logga in igen på alla utloggade enheter';

  @override
  String get linkedDevicesLoadErrorTitle => 'Nätverksfel';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Vi har problem med att ansluta till rumtiden. Kontrollera din anslutning och försök igen.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Enheter återkallade',
      one: 'Enhet återkallad',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Kunde inte logga ut. Försök igen.';

  @override
  String get linkedDevicesUnknownOs => 'Okänd OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Okänd plattform';

  @override
  String get linkedDevicesViewDetails => 'Visa detaljer';

  @override
  String get linkedDevicesDetailsTitle => 'Enhetsinformation';

  @override
  String get linkedDevicesDetailsDevice => 'Enhet';

  @override
  String get linkedDevicesDetailsClient => 'Klient';

  @override
  String get linkedDevicesDetailsLocation => 'Plats';

  @override
  String get linkedDevicesDetailsIp => 'IP-adress';

  @override
  String get linkedDevicesDetailsLastUsed => 'Senast använt';

  @override
  String get linkedDevicesCurrentSession => 'Nuvarande session';

  @override
  String get linkedDevicesUnknown => 'Okänt';

  @override
  String slowmodeLabel(String duration) {
    return '$duration långsamt läge';
  }

  @override
  String get slowmodeTooltipActive =>
      'Du är i långsamt läge. Vänligen vänta innan du skickar ett nytt meddelande.';

  @override
  String get slowmodeTooltipImmune =>
      'Långsamt läge är aktiverat, men du är immun.';

  @override
  String get slowmodeStatusEnabled => 'Långsamt läge är aktiverat';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Långsamt läge aktivt ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Långsamt läge är inställt på $durationLabel, men du är undantagen.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Långsamt läge är inställt på $durationLabel. Vänta innan du skickar ett nytt meddelande.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Långsamt läge är inställt på $durationLabel för den här kanalen.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Du kan inte skicka meddelanden i den här kanalen.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Systemmeddelanden från $productName-personal. Du kan inte svara här.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Det är tillfälligt pausat att skicka meddelanden i den här communityn.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Du har timeout. Du kan inte skicka meddelanden, reagera eller delta i röstchatt förrän timeouten löper ut.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Du måste säkra ditt konto för att skicka meddelanden i den här communityn.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Du måste verifiera din e-postadress för att skicka meddelanden i den här communityn.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Ditt konto är för nytt för att skicka meddelanden i den här communityn.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Du har inte varit medlem i den här communityn tillräckligt länge för att skicka meddelanden.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verifiera e-postadress';

  @override
  String get accountLimitedNotice =>
      'Meddelanden är pausade på ditt konto. Kolla din e-post så hittar du ett snabbt steg för att fortsätta.';

  @override
  String get messagingPausedTextDidNotGoThrough => 'Mitt sms gick inte fram';

  @override
  String messagingPausedHelpBody(String supportEmail) {
    return 'Mejla $supportEmail så tittar en person på ditt konto. Du kan också svara på mejlet vi skickade till dig.';
  }

  @override
  String get messagingPausedHelpCountryLabel => 'Land du befinner dig i';

  @override
  String get messagingPausedHelpCopyDetails => 'Kopiera uppgifter';

  @override
  String get messagingPausedHelpEmailSupport => 'Mejla supporten';

  @override
  String messagingPausedHelpAccountIdLine(String accountId) {
    return 'Konto-ID: $accountId';
  }

  @override
  String messagingPausedHelpUsernameLine(String username) {
    return 'Användarnamn: $username';
  }

  @override
  String messagingPausedHelpAccountCreatedLine(String createdAt) {
    return 'Konto skapat: $createdAt';
  }

  @override
  String messagingPausedHelpCountryLine(String country) {
    return 'Land: $country';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Dessa filer är för stora för att skickas tillsammans';

  @override
  String get chatAttachmentDropToUpload => 'Släpp filer för att ladda upp';

  @override
  String get chatAttachmentDropToSend => 'Släpp filer för att skicka nu';

  @override
  String get voiceMessageTitle => 'Röstmeddelande';

  @override
  String get voiceMessageHoldHint =>
      'Håll för att spela in. Dra till papperskorgen för att ta bort, skjut upp för att låsa eller släpp för att skicka.';

  @override
  String get voiceMessageDiscard => 'Kasta röstmeddelandet';

  @override
  String get voiceMessageSend => 'Skicka röstmeddelande';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Det går inte att starta inspelningen. Tillåt åtkomst till mikrofonen.';

  @override
  String get voiceMessageMicInUse =>
      'Lämna röstsamtalet för att spela in ett röstmeddelande.';

  @override
  String get voiceMessageRecordingFailed =>
      'Inspelningen misslyckades. Försök igen.';

  @override
  String get voiceMessageSendFailed =>
      'Det gick inte att skicka röstmeddelandet. Försök igen.';

  @override
  String get voiceMessagePlay => 'Spela upp';

  @override
  String get voiceMessagePause => 'Pausa';

  @override
  String get voiceMessageSeekForward => 'Spola framåt';

  @override
  String get voiceMessageSeekBackward => 'Spola tillbaka';

  @override
  String get chatAttachmentEditTitle => 'Redigera bilaga';

  @override
  String get chatAttachmentFilenameLabel => 'Filnamn';

  @override
  String get chatAttachmentDescriptionLabel => 'Beskrivning';

  @override
  String get chatAttachmentDescriptionHint => 'Valfri alternativ text';

  @override
  String get chatAttachmentSpoilerLabel => 'Markera som spoiler';

  @override
  String get chatAttachmentRemove => 'Ta bort bilaga';

  @override
  String get chatAttachmentDownload => 'Ladda ner';

  @override
  String get chatAttachmentDownloadedToast => 'Sparad i bilder';

  @override
  String get chatAttachmentDownloadFailedToast => 'Kunde inte ladda ner bilaga';

  @override
  String get chatAttachmentExpiredTooltip => 'Bilagan har gått ut';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Visa ($count rader)',
      one: 'Visa ($count rad)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dölj ($count rader)',
      one: 'Dölj ($count rad)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand ($count rader)',
      one: 'Expand ($count rad)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dölj ($count rader)',
      one: 'Dölj ($count rad)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rader kvar)',
      one: '... ($count rad kvar)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rader kvar)',
      one: '... ($count rad kvar)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Visa hela filen';

  @override
  String get chatTextualPreviewChangeLanguage => 'Ändra språk';

  @override
  String get chatTextualPreviewSearchLanguage => 'Sök språk…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntaxmarkering';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Inga resultat hittades';

  @override
  String get chatTextualPreviewMoreOptions => 'Fler alternativ';

  @override
  String get chatTextualPreviewWrapText => 'Radbryt text';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Filen är för stor för förhandsvisning (gräns $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Det gick inte att läsa in förhandsvisningen.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Vanlig text';

  @override
  String get chatTextualPreviewCopy => 'Kopiera';

  @override
  String get chatAttachmentSourceGallery => 'Galleri';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Bläddra bland filer';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Visa spoiler';

  @override
  String get matureMediaRevealButton => 'Visa';

  @override
  String get matureMediaRevealHint => 'Klicka för att visa';

  @override
  String get matureContentTitle => 'Vuxet innehåll';

  @override
  String get matureCommunityTitle => 'Community med vuxet innehåll';

  @override
  String get matureCategoryTitle => 'Kategori med vuxet innehåll';

  @override
  String get matureChannelTitle => 'Kanal med vuxet innehåll';

  @override
  String get communityContentWarningTitle =>
      'Varning för innehåll från communityn';

  @override
  String get categoryContentWarningTitle => 'Varning för innehåll i kategori';

  @override
  String get channelContentWarningTitle => 'Varning för kanalens innehåll';

  @override
  String get defaultContentWarningBody => 'Detta innehåller känsligt innehåll.';

  @override
  String get matureCommunityBody =>
      'Den här communityn är markerad för vuxet innehåll och kan innehålla material som är olämpligt för vissa användare.';

  @override
  String get matureCategoryBody =>
      'Den här kategorin är markerad för vuxet innehåll och kan innehålla material som kan vara olämpligt för vissa användare.';

  @override
  String get matureChannelBody =>
      'Den här kanalen är markerad för vuxet innehåll och kan innehålla material som kan vara olämpligt för vissa användare.';

  @override
  String get matureVoiceChannelBody =>
      'Den här röstkanalen är markerad för vuxet innehåll och kan innehålla material som är olämpligt för vissa användare.';

  @override
  String get matureLinkChannelBody =>
      'Den här länkkanalen är markerad för vuxet innehåll och kan öppna material som är olämpligt för vissa användare.';

  @override
  String get matureCommunityUnavailableBody =>
      'Den här communityn med vuxet innehåll är inte tillgänglig för ditt konto.';

  @override
  String get matureCategoryUnavailableBody =>
      'Den här kategorin med vuxet innehåll är inte tillgänglig för ditt konto.';

  @override
  String get matureChannelUnavailableBody =>
      'Den här kanalen med vuxet innehåll är inte tillgänglig för ditt konto.';

  @override
  String get matureContentProceedButton => 'Fortsätt';

  @override
  String get matureContentUnderstandButton => 'Jag förstår';

  @override
  String get matureContentOpenLinkButton => 'Öppna länk';

  @override
  String get sensitiveContentFriendDmLabel => 'Direktmeddelanden från vänner';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Direktmeddelanden från andra';

  @override
  String get sensitiveContentGuildLabel => 'Meddelanden i communitykanaler';

  @override
  String get sensitiveContentFilterShow => 'Visa';

  @override
  String get sensitiveContentFilterBlur => 'Dölj';

  @override
  String get sensitiveContentFilterBlock => 'Blockera';

  @override
  String get sensitiveContentResetButton => 'Återställ';

  @override
  String get sensitiveContentSaveButton => 'Spara';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
    );
    return 'Laddar upp $_temp0';
  }

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Går ut den $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Går ut mellan $start och $end';
  }

  @override
  String get connectionsTitle => 'Anslutningar';

  @override
  String connectionsDescription(String productName) {
    return 'Länka externa konton och domäner till din $productName-profil. Verifierade anslutningar visas på din profil för andra att se.';
  }

  @override
  String get connectionsEmptyTitle => 'Inga anslutningar än';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Länka ditt Bluesky-konto eller verifiera domänägande för att visa dem på din profil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifiera domänägande för att visa det på din profil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domän';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Lägg till Bluesky-anslutning';

  @override
  String get connectionsAddDomainAriaLabel => 'Lägg till domänanslutning';

  @override
  String get connectionEdit => 'Redigera';

  @override
  String get connectionRemove => 'Ta bort';

  @override
  String get connectionVerifiedLabel => 'Den här anslutningen har verifierats.';

  @override
  String get connectionUnverifiedLabel =>
      'Den här anslutningen har inte verifierats.';

  @override
  String get connectionAddTitle => 'Lägg till anslutning';

  @override
  String get connectionTypeLabel => 'Anslutningstyp';

  @override
  String get connectionHandleLabel => 'Användarnamn';

  @override
  String get connectionDomainLabel => 'Domän';

  @override
  String get connectionHandlePlaceholder => 'anvandarnamn.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'exempel.se';

  @override
  String get connectionAlreadyExists => 'Du har redan den här anslutningen.';

  @override
  String get connectionConnectBluesky => 'Anslut med Bluesky';

  @override
  String get connectionContinue => 'Fortsätt';

  @override
  String get connectionVerifyTitle => 'Verifiera anslutning';

  @override
  String get connectionVerifyInstructions =>
      'Använd posten nedan för att bevisa domänägande.';

  @override
  String get connectionDnsRecordTitle => 'TXT-post i DNS';

  @override
  String get connectionDnsHostLabel => 'Värd';

  @override
  String get connectionDnsValueLabel => 'Värde';

  @override
  String get connectionCopyHost => 'Kopiera värd';

  @override
  String get connectionCopyValue => 'Kopiera värde';

  @override
  String get connectionCopied => 'Kopierat!';

  @override
  String get connectionTokenFileTitle => 'Tillhandahåll tokenfilen';

  @override
  String get connectionTokenFileDescription =>
      'Ladda ner **fluxer-verification** och placera den i din **.well-known**-mapp så att vi kan validera domänen.';

  @override
  String get connectionTokenFileDownload => 'Ladda ner fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Filen innehåller verifieringstoken som vi kommer att hämta från **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Spara fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verifiera';

  @override
  String get connectionBack => 'Tillbaka';

  @override
  String get connectionEditTitle => 'Redigera anslutning';

  @override
  String get connectionEditDescription =>
      'Välj vem som kan se den här anslutningen på din profil.';

  @override
  String get connectionVisibilityEveryone => 'Alla';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Tillåt vem som helst att se den här anslutningen på din profil';

  @override
  String get connectionVisibilityFriends => 'Vänner';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Låt dina vänner se den här anslutningen';

  @override
  String get connectionVisibilityCommunityMembers => 'Communitymedlemmar';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Låt medlemmar i communities du är med i se den här anslutningen';

  @override
  String get connectionRemoveTitle => 'Ta bort anslutning';

  @override
  String get connectionRemoveDescription =>
      'Är du säker på att du vill ta bort den här anslutningen? Den här åtgärden kan inte ångras.';

  @override
  String get connectionRemoveConfirm => 'Ta bort';

  @override
  String get connectionsLoadError => 'Kunde inte ladda anslutningar';

  @override
  String get connectionsReorderError => 'Kunde inte uppdatera ordning';

  @override
  String get connectionInitiateFailed =>
      'Kunde inte starta verifiering. Försök igen.';

  @override
  String get connectionVerifyFailed =>
      'Kunde inte verifiera. Kontrollera din DNS-post och försök igen.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Kunde inte starta Bluesky-auktorisering.';

  @override
  String get connectionUpdateFailed => 'Kunde inte uppdatera anslutning';

  @override
  String get connectionRemoveFailed => 'Kunde inte ta bort anslutning';

  @override
  String get connectionTokenSavedToast => 'Sparade fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Kunde inte spara fil';

  @override
  String get connectionEnterHandle => 'Ange ett Bluesky-användarnamn.';

  @override
  String get connectionEnterDomain => 'Ange en domän.';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Välj mellan mörkt, kolsvart eller ljust utseende.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Högt dynamiskt omfång';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Styr hur HDR-bilder visas på skärmar med HDR-stöd.';

  @override
  String get lookAndFeelHdrFullName => 'Fullt dynamiskt omfång';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Visa HDR-bilder med full ljusstyrka och färgomfång.';

  @override
  String get lookAndFeelHdrStandardName => 'Standardintervall';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Tonmappa HDR-bilder till standardomfång, vilket minskar den högsta ljusstyrkan.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Visningsläge med högt dynamiskt omfång';

  @override
  String get lookAndFeelThemeDark => 'Mörkt tema';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Mörkt (äldre) tema';

  @override
  String get lookAndFeelThemeCoal => 'Koltema';

  @override
  String get lookAndFeelThemeLight => 'Ljust tema';

  @override
  String get lookAndFeelThemeSystem => 'Systemtema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synka tema mellan enheter';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'När det är aktiverat synkroniseras temainställningar till alla dina enheter. När det är inaktiverat använder den här enheten sin egen temainställning.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Systemtema inaktiverar automatiskt synkronisering för att följa systemets preferenser på den här enheten.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Kunde inte synkronisera temat till ditt konto. Försök igen.';

  @override
  String get lookAndFeelThemeColorsTitle => 'Temafärger';

  @override
  String get lookAndFeelThemeColorsConfigureDescription =>
      'Anpassa enskilda temafärger för den här enheten.';

  @override
  String lookAndFeelThemeColorsEditingMode(String mode) {
    return 'Redigerar $mode';
  }

  @override
  String get lookAndFeelThemeColorsSyncSectionTitle =>
      'Synkning med Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioLabel =>
      'Använd färger från Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioDescription =>
      'När detta är på används färgändringar från Theme Studio på datorn även på den här enheten. När det är av behåller den här enheten sina egna färger.';

  @override
  String get lookAndFeelThemeColorsSyncToStudioLabel =>
      'Skicka färgändringar till Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncToStudioDescription =>
      'När detta är på synkas färgerna du ändrar här till Theme Studio på dina andra enheter. När det är av behåller Theme Studio på datorn sina egna färger.';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioOffBanner =>
      'Färgändringar från Theme Studio på datorn används inte på den här enheten.';

  @override
  String get lookAndFeelThemeColorsEssentialSectionTitle =>
      'Grundläggande färger';

  @override
  String get lookAndFeelThemeColorsChatBackgroundWallpaperNote =>
      'Om du har en bakgrundsbild för chatten ser du inte den här färgen.';

  @override
  String lookAndFeelThemeColorsResetForMode(String mode) {
    return 'Återställ alla färger för $mode';
  }

  @override
  String get lookAndFeelThemeColorsResetConfirmTitle =>
      'Återställa temafärger?';

  @override
  String lookAndFeelThemeColorsResetConfirmBody(String mode) {
    return 'Detta tar bort dina anpassade färger för $mode på den här enheten.';
  }

  @override
  String get lookAndFeelThemeColorsGroupBrandButtons => 'Varumärke och knappar';

  @override
  String get lookAndFeelThemeColorsGroupChatSurfaces => 'Chatt och meddelanden';

  @override
  String get lookAndFeelThemeColorsGroupSidebars => 'Sidofält och navigering';

  @override
  String get lookAndFeelThemeColorsGroupText => 'Text';

  @override
  String get lookAndFeelThemeColorsGroupHeaders => 'Rubriker';

  @override
  String get lookAndFeelThemeColorsGroupStatus => 'Status';

  @override
  String get lookAndFeelThemeColorsGroupEmbedsMarkup =>
      'Inbäddningar och omnämnanden';

  @override
  String get lookAndFeelThemeColorsGroupAccentsAlerts =>
      'Accenter och varningar';

  @override
  String get lookAndFeelThemeColorsGroupControls => 'Ytor och kontroller';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Skalning av chattypsnitt';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Justera textstorleken i chattområdet.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Teckenstorlek i chatt';

  @override
  String get lookAndFeelAppZoomTitle => 'Appens zoomnivå';

  @override
  String get lookAndFeelAppZoomDescription => 'Justera appens zoomnivå.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Bakgrundsbild för chatt';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Välj en bakgrund för chattar. Den sparas på den här enheten.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Den här inställningen sparas på den här enheten';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Chatbakgrunden sparas bara på den här enheten och synkroniseras inte till andra enheter.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Standard';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Anpassad bild';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Stjärnfält';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Färg $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Toning $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Dämpa bakgrundsbild';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Kunde inte ställa in den bilden som din bakgrundsbild.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Meddelanden';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Välj hur meddelanden visas i chattkanaler.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Mellanrum mellan meddelandegrupper';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Visningsläge för meddelanden';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Rymlig';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Rymlig layout med tydlig visuell åtskillnad mellan meddelanden.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Kompakt';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximerar synliga meddelanden med minimalt avstånd.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Dölj användarprofilbilder';

  @override
  String get lookAndFeelInterfaceTitle => 'Gränssnitt';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Anpassa gränssnittets element och beteenden.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Skrivindikatorer i kanallistan';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Välj hur skrivindikatorer visas i kanallistan när någon skriver i en kanal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Skrivindikator + avatarer';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Visa att någon skriver med användarbilder i kanallistan';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Endast skrivindikator';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Visa endast indikatorn för att någon skriver, utan avatarer';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Dold';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Visa inte skrivindikatorer i kanallistan';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Visa skrivande i vald kanal';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'När det är inaktiverat (standard) visas inte skrivindikatorer i kanalen du tittar på.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'allmänt';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Tangentbordstips';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Styr om ledtrådar för kortkommandon visas i verktygstips.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Dölj tangentbordsledtrådar i verktygstips';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'När det är aktiverat döljs kortkommandon i popup-fönster för verktygstips.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Serverlistan';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigurera hur serverlistan visar direktmeddelanden.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count communities är tillfälligt otillgängliga på grund av ett fel i flödeskondensatorn.',
      one:
          '1 community är tillfälligt otillgänglig på grund av ett fel i flödeskondensatorn.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Communityn är tillfälligt otillgänglig';

  @override
  String get guildUnavailableDescription => 'Något gick fel. Vi jobbar på det.';

  @override
  String get guildNotFoundTitle => 'Det här är inte communityn du letar efter.';

  @override
  String get guildNotFoundDescription =>
      'Communityn du letar efter kan ha raderats eller så har du inte åtkomst till den.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName är för närvarande endast tillgänglig för $productName-personal';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'tillfälligt otillgänglig';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Kollapsa DM till mapp';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'När det är aktiverat kollapsas olästa DM i serverlistan till en mapp på $productName-knappen. Klicka på $productName-knappen när du är på DM-sidan för att expandera eller kollapsa mappen.';
  }

  @override
  String get lookAndFeelOpenCommunitiesToLastChannelLabel =>
      'Öppna communities i den senaste kanalen';

  @override
  String get lookAndFeelOpenCommunitiesToLastChannelDescription =>
      'När du trycker på en community kommer du direkt till den senaste kanalen du tittade på där. Svep åt höger för att se kanallistan.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanallista';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Styr hur indikatorn för olästa meddelanden fungerar för tystade kanaler i kanallistor.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Visa indikator för olästa meddelanden på tystade kanaler';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'När det är aktiverat visar tystade kanaler en blek oläst indikator på vänster sida. Omnämnanden visas fortfarande oavsett denna inställning.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktiva nu';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Styr hur Aktiv nu visas i appen.';

  @override
  String get lookAndFeelShowActiveNowLabel => 'Visa Aktiva nu på startskärmen';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Visa Aktiva nu på startskärmen för att se vänner som är aktiva i röstchatt. Du ser en förhandsvisning, kanalsammanhanget, vilka som redan är där och ett snabbt sätt att ansluta.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoriter';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Styr synligheten för favoriter i hela appen.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Aktivera favoriter';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'När det är aktiverat kan du favorisera kanaler och de visas i avsnittet Favoriter. När det är inaktiverat döljs alla favoritrelaterade gränssnittselement (knappar, menyalternativ). Dina befintliga favoriter bevaras.';

  @override
  String get favoritesTitle => 'Favoriter';

  @override
  String get favoritesEmptyTitle => 'Inga favoriter än';

  @override
  String get favoritesEmptyDescription =>
      'Stjärnmärk kanaler från chattens huvud för att ha dem här.';

  @override
  String get favoritesWelcomeTitle => 'Välkommen till favoriter';

  @override
  String get favoritesWelcomeDescription =>
      'Din personliga plats för snabb åtkomst till kanaler, direktmeddelanden och grupper du gillar. Tryck på stjärnan på valfri kanal för att lägga till den här.';

  @override
  String get favoritesWelcomeTip => 'Inte för dig? Stäng av när som helst.';

  @override
  String get favoritesDisableButton => 'Inaktivera favoriter';

  @override
  String get favoritesAddedToast => 'Tillagd i favoriter';

  @override
  String get favoritesRemovedToast => 'Borttagen från favoriter';

  @override
  String get favoritesHiddenToast => 'Favoriter dolda';

  @override
  String get favoritesMute => 'Tysta favoriter';

  @override
  String get favoritesUnmute => 'Sluta tysta favoriter';

  @override
  String get favoritesHeaderMenu => 'Meny för favoriter';

  @override
  String get favoritesCreateCategory => 'Skapa kategori';

  @override
  String get favoritesCategoryNameLabel => 'Kategorinamn';

  @override
  String get favoritesHideMutedChannels => 'Dölj tystade kanaler';

  @override
  String get favoritesShowMutedChannels => 'Visa tystade kanaler';

  @override
  String get favoritesSetNickname => 'Ange smeknamn';

  @override
  String get favoritesNicknameLabel => 'Smeknamn';

  @override
  String get favoritesSaveNickname => 'Spara smeknamn';

  @override
  String get favoritesMoveToCategory => 'Flytta till kategori';

  @override
  String get favoritesUncategorized => 'Okategoriserade';

  @override
  String get favoritesOtherCategory => 'Annat';

  @override
  String get favoritesRemoveFromFavorites => 'Ta bort från favoriter';

  @override
  String get favoritesAddToFavorites => 'Lägg till i favoriter';

  @override
  String get favoritesAddToSavedMedia => 'Lägg till i sparade medier';

  @override
  String get favoritesRemoveFromSavedMedia => 'Ta bort från sparade medier';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Lägg till i URL-baserade GIF-favoriter';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Ta bort från URL-baserade GIF-favoriter';

  @override
  String get savedMediaAddTitle => 'Lägg till i sparade medier';

  @override
  String get savedMediaFormNameLabel => 'Namn';

  @override
  String get savedMediaFormNameHint => 'Mitt fantastiska medieobjekt';

  @override
  String get savedMediaFormAltTextLabel => 'Alternativ text';

  @override
  String get savedMediaFormAltTextHint => 'Beskriv mediet';

  @override
  String get savedMediaFormTagsLabel => 'Taggar';

  @override
  String get savedMediaFormTagsHint => 'rolig, reaktion, jobb';

  @override
  String get savedMediaSaveError => 'Kunde inte uppdatera sparade medier.';

  @override
  String get savedMediaNameRequired => 'Namn krävs.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Hur ska vi spara dina GIF-favoriter?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Du kan spara stjärnmärkta GIF-bilder som favoriter endast med URL eller ladda upp dem till ditt sparade media. Välj det alternativ som passar hur du använder dem. Du kan ändra det när som helst i Inställningar > Avancerat > Media.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Endast URL-favoriter (standard): synkroniseras mellan dina enheter, ingen uppladdning, räknas inte mot sparad media. Originalmediet kan försvinna om värden tar bort det.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Sparade medier: uppladdade, taggbara, sökbara och beständiga, men de räknas mot din gräns för sparade medier.';

  @override
  String get gifFavoriteFirstTimeHint => 'Vi frågar bara en gång.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Använd endast URL (rekommenderas)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Använd sparade medier';

  @override
  String get favoritesHideConfirmTitle => 'Dölj favoriter';

  @override
  String get favoritesHideConfirmDescription =>
      'Detta döljer alla favoritrelaterade UI-element, inklusive knappar och menyalternativ. Dina befintliga favoriter kommer att bevaras och kan återaktiveras när som helst från Inställningar > Avancerat > Utseende.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direktmeddelande';

  @override
  String get messagesMediaDisplayGroupTitle => 'Visning';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Styr hur meddelanden, media och annat innehåll visas.';

  @override
  String get messagesMediaMediaGroupTitle => 'Medier';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Anpassa inställningar för mediestorlek och knappar.';

  @override
  String get messagesMediaInputGroupTitle => 'Inmatning';

  @override
  String get messagesMediaInputGroupDescription =>
      'Anpassa inställningar för meddelandeinmatning.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Sidofält';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigurera hur community-sidofältet visas.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Dölj tystade kanaler som standard';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Dölj automatiskt tystade kanaler i sidofältet när du går med i nya communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Dölj tystade kanaler som standard?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Tystade kanaler döljs automatiskt i nya communities du går med i. Vill du även tillämpa inställningen på alla dina befintliga communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Sluta dölja tystade kanaler som standard?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Tystade kanaler döljs inte längre automatiskt i nya communities du går med i. Vill du även visa tystade kanaler i alla dina befintliga communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Tillämpa på alla communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Visa i alla communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Endast nya communities';

  @override
  String get messagesMediaDisplaySectionTitle => 'Medievisning';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Styr hur bilder, videor och annan media visas. All media skalas om och konverteras. Extremt stora filer som inte kan komprimeras till en förhandsgranskning kommer inte att bäddas in oavsett dessa inställningar.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'När de publiceras som länkar till chatt';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'När den laddas upp direkt till $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Länkförhandsvisningar';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Styr hur webbplatslänkar förhandsgranskas i chatt';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Visa inbäddningar och förhandsgranska webblänkar';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaktioner';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfigurera emoji-reaktioner på meddelanden';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Visa emoji-reaktioner på meddelanden';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoilerinnehåll';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Styr hur spoilerinnehåll visas';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Visa spoilerinnehåll';

  @override
  String get messagesMediaSpoilersOnClickName => 'Vid klick';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Visa spoilerinnehåll vid klick';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'I kanaler jag modererar';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Visa alltid spoilerinnehåll i kanaler där du har behörigheten \"Hantera meddelanden\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Alltid';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Visa alltid spoilerinnehåll';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Inställningar för medieinnehållsstorlek';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Anpassa den maximala visningsstorleken för inbäddat och bifogat medieinnehåll. Mindre storlekar använder mindre skärmutrymme, medan större storlekar visar mer detaljer.';

  @override
  String get messagesMediaSizeEmbedLabel =>
      'Medieinnehåll från länkar (inbäddningar)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Uppladdade bilagor';

  @override
  String get messagesMediaSizeCompactName => 'Kompakt (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'Mindre medieinnehållsstorlek';

  @override
  String get messagesMediaSizeComfortableName => 'Bekväm (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Större medieinnehållsstorlek med mer detaljer';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF-beteende';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Styr hur GIF-filer infogas i chatt';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Skicka GIF:ar automatiskt när de väljs';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Kamerauppladdningar';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Välj om foton och videor som tas med kameran i appen ska sparas på din enhet';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Spara till enhet';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Autokomplettering av uttryck (kolon-autokomplettering)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Styr vad som visas i autokompletteringen av uttryck när du skriver kolon. Anpassa vilka förslag som visas för att matcha dina preferenser.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Visa standardemojier i förslag för uttryck';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Visa anpassade emojier i förslag för uttryck';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Visa klistermärken i förslag för uttryck';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Visa sparade medier i automatisk komplettering av uttryck';

  @override
  String get accessibilitySaturationTitle => 'Mättnad';

  @override
  String get accessibilityVisualGroupTitle => 'Visuellt';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Alltid understrukna länkar';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Visa alternativ text på bilder';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Visa alternativ text under bilder när den är tillgänglig.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Tona ned genomstruken text';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Förhandsvisningar av DM-meddelanden';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Läge för förhandsvisning av DM-meddelanden';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Alla meddelanden';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Visa förhandsvisningar av meddelanden för alla DM-konversationer';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Endast olästa DM-konversationer';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Visa bara meddelandeförhandsvisningar för DM-konversationer med olästa meddelanden';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ingen';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Visa inte meddelandeförhandsvisningar i DM-listan';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Skärmläsare';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Styr hur $productName fungerar med skärmläsare.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Meddela nya meddelanden';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Låt skärmläsare läsa upp nya meddelanden när de kommer in i den öppna kanalen. Aviseringsljud påverkas inte.';

  @override
  String get accessibilityTtsGroupTitle => 'Text till tal';

  @override
  String get accessibilityTtsGroupDescription =>
      'Välj hastighet för uppläst text.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Uppspelningshastighet för tal';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Spela upp exempel';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Tysta exempel';

  @override
  String get accessibilityPreviewButtonLabel => 'Förhandsvisningsknapp';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Så här visas länkar: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Förhandsgranskningsanvändare';

  @override
  String get accessibilityKeyboardGroupTitle => 'Tangentbord';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Visa fokusring på chattens textruta';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Esc-tangenten avslutar tangentbordsläget';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Visa genvägar för snabbmenyn';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Bekräfta innan samtal startas';

  @override
  String get accessibilityAnimationGroupTitle => 'Animering';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Minskad rörelse är aktiverad, så innehållsanimeringar pausas som standard. Du kan fortfarande aktivera dem igen för att spela upp dem.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Spela upp animerade emojier';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Spela upp GIF:ar automatiskt';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Spela upp GIF:ar automatiskt när $productName är i fokus';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Spelas trots minskad rörelse.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Pausad på grund av minskad rörelse. Aktivera för att fortsätta spela animerade emojier.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Pausad på grund av minskad rörelse. Aktivera för att spela upp GIF:ar.';

  @override
  String get accessibilityStickerAnimationsTitle =>
      'Animeringar för klistermärken';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Animeringsinställning för klistermärken';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Animera alltid';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Klistermärken animeras alltid';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animera vid interaktion';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Klistermärken animeras när du trycker på dem';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Klistermärken animeras när du håller muspekaren över dem eller interagerar med dem';

  @override
  String get accessibilityStickerNeverAnimateName =>
      'Spela aldrig upp animeringar';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Klistermärken kommer aldrig att animeras';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Animeras alltid trots minskad rörelse.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Begränsad rörelse gör att dekaler bara animeras vid interaktion. Välj ”animera alltid” för att åsidosätta detta.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Standardinställningen är att animera vid interaktion på mobilen för att spara batteri.';

  @override
  String get accessibilityMotionGroupTitle => 'Rörelse';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Synka inställning för minskad rörelse med systemet';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Använd enhetens systeminställning för minskad rörelse, eller anpassa den nedan.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Minska rörelse';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Inaktivera animeringar och övergångar. Styrs för närvarande av dina systeminställningar.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Inaktivera animeringar och övergångar i hela appen.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'På fliken Animering styr du hur animerade emojier, GIF:ar och klistermärken spelas upp.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Starta samtal?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Är du säker på att du vill starta det här samtalet?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Starta samtal';

  @override
  String get accessibilityTtsSampleDescription =>
      'Hör exempelfrasen uppläst med den valda hastigheten.';

  @override
  String get accessibilityTtsSampleText =>
      'Doktor, jag är från framtiden. Jag kom hit i en tidsmaskin som du uppfann. Nu behöver jag din hjälp för att komma tillbaka till år 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Taligenkänning är inte tillgänglig på den här enheten.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Det gick inte att spela upp talet. Försök igen eller kontrollera att ljudutgången fungerar.';

  @override
  String get ttsSubstitutionUnknownUser => 'okänd användare';

  @override
  String get ttsSubstitutionUnknownRole => 'okänd roll';

  @override
  String get ttsSubstitutionUnknownChannel => 'okänd kanal';

  @override
  String get ttsSubstitutionCodeBlock => 'kodblock';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'snedstreck $commandName';
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
    return 'Som svar till $replyAuthorName sa $authorName: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'skickade ett klistermärke';

  @override
  String get ttsSentAttachment => 'skickade en bilaga';

  @override
  String ttsSentAttachments(int count) {
    return 'skickade $count bilagor';
  }

  @override
  String get ttsSentEmbed => 'skickade en inbäddning';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author skickade $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Skickade en bilaga';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username fäste ett meddelande i den här kanalen.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username lade till $userName i gruppen.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username lade till någon i gruppen.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username har lämnat gruppen.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username tog bort $userName från gruppen.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username tog bort någon från gruppen.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username ändrade kanalnamnet till $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username ändrade kanalnamnet.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username ändrade kanalikonen.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username startade ett samtal.';
  }

  @override
  String get systemCallJoinTheCall => 'Gå med i samtalet';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username startade ett samtal som varade $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Du missade ett samtal från $username som varade $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Du missade ett samtal från $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'några sekunder';

  @override
  String get systemCallDurationMinute => 'en minut';

  @override
  String get systemCallDurationOneYear => '1 år';

  @override
  String get systemCallDurationOneMonth => '1 månad';

  @override
  String get systemCallDurationOneWeek => '1 vecka';

  @override
  String get systemCallDurationOneDay => '1 dag';

  @override
  String get systemCallDurationOneHour => '1 timme';

  @override
  String systemCallDurationYears(int count) {
    return '$count år';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count månader';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count veckor';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count dagar';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count timmar';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minuter';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Uppdatera $productName för att se det här meddelandet.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Bekräftelse av röstanslutning';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Du är redan ansluten till den här röstkanalen från $count andra enheter. Vad vill du göra?',
      one:
          'Du är redan ansluten till den här röstkanalen från 1 annan enhet. Vad vill du göra?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Byt till den här enheten';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Anslut bara (behåll andra anslutningar)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Gör inget, jag vill inte gå med';

  @override
  String get voiceJoinFailedTitle => 'Kunde inte ansluta till röstsamtal';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Kunde inte koppla från dina andra enheter. Försök igen om en stund.';

  @override
  String get voiceChannelJoin => 'Gå med i röstkanalen';

  @override
  String get voiceCallJoin => 'Gå med i samtalet';

  @override
  String get voiceChannelJoinConnect => 'Anslut till röstkanal';

  @override
  String get voiceChannelNoConnectPermission =>
      'Du har inte behörighet att gå med i den här röstkanalen';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Innehåll från mikrofon, kamera och skärmdelning är totalsträckskrypterat.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Innehåll från mikrofon, kamera och skärmdelning är totalsträckskrypterat.';

  @override
  String get voiceChannelE2eeBroken =>
      'Totalsträckskryptering är inte tillgänglig eftersom en deltagare i röstkanalen saknar stöd för den.';

  @override
  String get voiceCallE2eeBroken =>
      'Totalsträckskryptering är inte tillgänglig eftersom en deltagare i samtalet saknar stöd för den.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Den här klienten måste uppdateras innan du ansluter till det här krypterade samtalet.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Kunde inte starta din mikrofon. Du är fortfarande med i samtalet.';

  @override
  String get voiceChannelStatusConnecting => 'Ansluter…';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobil enhet';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Dator';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Tystad av communityn';

  @override
  String get voiceParticipantTooltipMuted => 'Tystad';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Döv av communityn';

  @override
  String get voiceParticipantTooltipDeafened => 'Ljudet avstängt';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Anslutning: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deltagare',
      one: '1 deltagare',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Lämna';

  @override
  String get voiceControlMute => 'Tysta';

  @override
  String get voiceControlUnmute => 'Sluta tysta';

  @override
  String get voiceControlDeafen => 'Stäng av ljudet';

  @override
  String get voiceControlUndeafen => 'Slå på ljudet';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Byt kamera';

  @override
  String get voiceControlScreenShare => 'Skärmdelning';

  @override
  String get voiceScreenShareNotificationText => 'Delar din skärm.';

  @override
  String get voiceControlDisconnect => 'Koppla från';

  @override
  String get voiceInChat => 'I röstchatt';

  @override
  String get voiceConnectionFailed => 'Anslutningen misslyckades';

  @override
  String get voiceConnectionRetry => 'Försök igen';

  @override
  String get voiceConnectionDismiss => 'Stäng';

  @override
  String get voiceConnectionDisconnected => 'Frånkopplad';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Mäter latens...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Gå till $channelSourceLabel';
  }

  @override
  String get shellResizeSidebar => 'Ändra storlek på sidofält';

  @override
  String get voiceConnectionTitle => 'Röstanslutning';

  @override
  String get voiceConnectionAdvancedStats => 'Avancerat';

  @override
  String get voiceShowCallAvatars => 'Visa samtalsavatarer';

  @override
  String get voiceShowConnectionId => 'Visa anslutnings-ID';

  @override
  String get voiceAudioProcessing => 'Ljudbehandling';

  @override
  String get voiceConnectionSessionSection => 'Session';

  @override
  String get voiceConnectionDurationLabel => 'Varaktighet';

  @override
  String get voiceConnectionParticipantsLabel => 'Deltagare';

  @override
  String get voiceConnectionNetworkSection => 'Nätverk';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Skicka';

  @override
  String get voiceConnectionReceiveLabel => 'Ta emot';

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
    return '$bandwidth kbit/s';
  }

  @override
  String get userAreaMuteMicrophone => 'Stäng av mikrofonen';

  @override
  String get userAreaUnmuteMicrophone => 'Slå på mikrofonen';

  @override
  String get userAreaUserSettings => 'Användarinställningar';

  @override
  String get voiceParticipantMenuViewProfile => 'Visa profil';

  @override
  String get voiceParticipantMenuFocus => 'Fokusera på den här personen';

  @override
  String get voiceParticipantMenuUnfocus => 'Avfokusera';

  @override
  String get voiceParticipantMenuCommunityMute =>
      'Tysta medlemmen i communityn';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Stäng av medlemmens ljud i communityn';

  @override
  String get voiceParticipantMenuUserVolume => 'Användarvolym';

  @override
  String get voiceParticipantMenuStreamVolume => 'Sändningsvolym';

  @override
  String get voiceParticipantMenuStopStreaming => 'Sluta sända';

  @override
  String get voiceControlChat => 'Chatt';

  @override
  String get voiceCallViewModeLabel => 'Visa';

  @override
  String get voiceCallViewModeGrid => 'Rutnät';

  @override
  String get voiceCallViewModeFocus => 'Fokus';

  @override
  String get voicePanelSettingsSectionTitle => 'Röstinställningar';

  @override
  String get voicePanelUseEarpieceLabel => 'Använd hörsnäcka';

  @override
  String get voiceOutputRouteSpeaker => 'Högtalare';

  @override
  String get voiceOutputRouteEarpiece => 'Hörsnäcka';

  @override
  String get voiceOutputRouteHeadset => 'Hörlurar';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Visa bara videor';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Visa bara deltagare som har kameran på.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Visa min egen kamera';

  @override
  String get voicePrioritizeSpeakersLabel => 'Prioritera talare';

  @override
  String get voiceTextChatShow => 'Visa chatt';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count olästa meddelanden',
      one: '$count oläst meddelande',
    );
    return 'Visa chatt med $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Kameratillstånd krävs för video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Kunde inte starta skärmdelning. Försök igen.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Behörighet för skärmdelning nekades.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Skärmdelning är inte tillgängligt på den här enheten.';

  @override
  String get voiceWatchStream => 'Titta på sändning';

  @override
  String get voiceStopWatching => 'Sluta titta';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Sluta titta på den aktuella strömmen';

  @override
  String get voiceScreenShareEnterFullscreenTooltip => 'Helskärm';

  @override
  String get voiceScreenShareExitFullscreenTooltip => 'Avsluta helskärm';

  @override
  String get voiceOwnScreenShareTitle => 'Du sänder';

  @override
  String get voiceOwnScreenShareSubtitle => 'Din ström är live för deltagarna.';

  @override
  String get voiceLiveBadge => 'Live';

  @override
  String get dmVoiceViewCall => 'Visa samtal';

  @override
  String get dmVoiceCallFullScreen => 'Helskärm';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Öppna samtalet i helskärm';

  @override
  String get dmVoiceStripStatusConnecting => 'Ansluter…';

  @override
  String get dmVoiceStripStatusInCall => 'I samtal';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Röstsamtal';

  @override
  String get dmVoiceCallBarConnecting => 'Ansluter…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direktsamtal';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Gruppsamtal';

  @override
  String get dmVoiceCallBarIssueFallback => 'Röstproblem';

  @override
  String get dmVoiceFullscreenTitle => 'Röst';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Röst ansluten';

  @override
  String get notificationsPageTitle => 'Aviseringar';

  @override
  String get notificationsFilterUnreads => 'Olästa';

  @override
  String get notificationsFilterMentions => 'Omnämnanden';

  @override
  String get notificationsBookmarksTooltip => 'Bokmärken';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrera omnämnanden';

  @override
  String get notificationsMentionFiltersTitle => 'Filter för omnämnanden';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Inkludera omnämnanden av @everyone och @here';

  @override
  String get notificationsMentionIncludeRoles =>
      'Inkludera omnämnanden av roller';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Inkludera alla omnämnanden i communityn';

  @override
  String get notificationsNoUnreadTitle => 'Inga olästa meddelanden';

  @override
  String get notificationsNoUnreadBody => 'Du är ajour.';

  @override
  String get notificationsNoMentionsTitle => 'Inga omnämnanden nyligen';

  @override
  String get notificationsNoMentionsBody =>
      'Alla @omnämnden av dig visas här i 7 dagar.';

  @override
  String get notificationsMentionsEndTitle => 'Du har nått slutet';

  @override
  String get notificationsMentionsEndBody =>
      'Du har sett alla dina senaste omnämnanden. Oroa dig inte, fler kommer att dyka upp här snart.';

  @override
  String get notificationsJump => 'Hoppa till';

  @override
  String get notificationsRemoveMentionTooltip => 'Ta bort omnämnande';

  @override
  String get notificationsViewAllUnread => 'Visa alla olästa';

  @override
  String get notificationsMarkAsRead => 'Markera som läst';

  @override
  String get notificationsExpand => 'Fäll ut';

  @override
  String get notificationsCollapse => 'Fäll ihop';

  @override
  String get notificationsMessageUnavailable =>
      'Detta meddelande kunde inte laddas.';

  @override
  String notificationsMentionedYouIn(String author, String place) {
    return '$author nämnde dig i $place:';
  }

  @override
  String notificationsRepliedToYouIn(String author, String place) {
    return '$author svarade dig i $place:';
  }

  @override
  String notificationsMentionedYou(String author) {
    return '$author nämnde dig:';
  }

  @override
  String notificationsRepliedToYou(String author) {
    return '$author svarade dig:';
  }

  @override
  String notificationsMentionPlace(String server, String channel) {
    return '$server – $channel';
  }

  @override
  String get notificationsSendReply => 'Skicka ett svar';

  @override
  String get notificationsRecentActivity => 'Senaste aktivitet';

  @override
  String get notificationsRemoveNotification => 'Ta bort avisering';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining tecken kvar';
  }

  @override
  String get characterCounterTooLong => 'Meddelandet är för långt';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining tecken kvar. Skaffa $productName för att skriva upp till $premiumMaxLength tecken.';
  }

  @override
  String get chatMessageFailedToSend => 'Kunde inte skicka meddelande';

  @override
  String get chatMessageFailedToSendTapForOptions =>
      'Kunde inte skicka meddelande. Tryck för alternativ.';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Ditt meddelande kunde inte levereras. Detta beror oftast på att du inte delar en community med mottagaren eller att mottagaren endast accepterar direktmeddelanden från vänner. Du kan också behöva justera dina egna inställningar för direktmeddelanden i $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Ditt meddelande kunde inte levereras. Du måste säkra ditt konto för att skicka direktmeddelanden.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Ditt meddelande kunde inte levereras. Du måste säkra ditt konto för att skicka meddelanden.';

  @override
  String get chatSendFailureContentBlocked =>
      'Ditt meddelande kunde inte levereras eftersom det flaggades av våra säkerhetssystem. Om du tror att detta är ett misstag, kontakta supporten.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'Ditt meddelande kunde inte levereras eftersom det flaggades av våra säkerhetssystem. Om du tror att detta är ett misstag, kontakta administratörerna för den här instansen.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Ditt meddelande kunde inte levereras eftersom det innehåller mogna emoji eller klistermärken som inte är tillåtna i detta sammanhang.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Endast du kan se detta meddelande.';

  @override
  String get chatClientSystemDismiss => 'Stäng';

  @override
  String get privacyDashboardCommunicationSection => 'Kommunikation';

  @override
  String get privacyDashboardProfilePrivacySection => 'Profilsekretess';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Vänner och direktmeddelanden';

  @override
  String get privacyDashboardActivitySharingSection => 'Delning av aktivitet';

  @override
  String get privacyDashboardSensitiveContentSection => 'Känsligt innehåll';

  @override
  String get privacyDashboardDataExportSection => 'Dataexport';

  @override
  String get privacyDashboardDataDeletionSection => 'Radering av data';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Vem kan se hela din profil';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Vänner och alla communities';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Hela din profil visas för vänner och alla i dina communities';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Endast vänner och små communities';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Hela din profil visas för vänner och medlemmar i dina communities med högst 200 medlemmar';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Endast vänner';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Din fullständiga profil visas bara för dina vänner';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Vänförfrågningar';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Alla';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Vänner till vänner';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Communitymedlemmar';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direktmeddelanden';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Tillåt direktmeddelanden från communitymedlemmar';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Tillåt direktmeddelanden från community-botar';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Inkommande samtal';

  @override
  String get privacyDashboardAllowedCallers => 'Personer som får ringa';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blockera alla inkommande samtal';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Tillåt endast vänner att ringa dig (rekommenderas)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Tillåt vänner plus ytterligare grupper du väljer';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Tillåt vem som helst att ringa dig, även främlingar';

  @override
  String get privacyDashboardAdditionalGroups => 'Ytterligare grupper';

  @override
  String get privacyDashboardRingBehavior => 'Samtalsbeteende';

  @override
  String get privacyDashboardSilentCalls => 'Tysta samtal från alla';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Vem kan lägga till dig i gruppchattar';

  @override
  String get privacyDashboardAllowedInvites => 'Tillåtna inbjudningar';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Låt ingen lägga till dig i gruppchattar utan att fråga';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Tillåt endast vänner att lägga till dig utan att fråga (rekommenderas)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Tillåt vänner plus ytterligare grupper att lägga till dig';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Tillåt vem som helst att lägga till dig i gruppchattar utan att fråga';

  @override
  String get privacyDashboardVoiceActivityTitle => 'Röstaktivitet i Aktiva nu';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Dela din röstaktivitet med vänner';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Dela röstaktivitet med alla vänner?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Sluta dela röstaktivitet med alla vänner?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Du är på väg att börja dela din röstaktivitet med alla dina vänner, inklusive framtida vänner. Detta skickar en uppdatering till dem alla och kan bara ändras igen om 24 timmar.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Du är på väg att sluta dela din röstaktivitet med alla dina vänner, inklusive framtida vänner. Detta skickar en uppdatering till dem alla och kan bara ändras igen om 24 timmar.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Ja, dela med alla vänner';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Ja, sluta dela';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Tillgänglig igen om $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Delning av röstaktivitet uppdaterad';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Kunde inte uppdatera delning av röstaktivitet just nu';

  @override
  String get privacyDashboardDataExportDesc =>
      'Skapa ett nedladdningsbart arkiv med dina kontodata, inklusive meddelanden och bilage-URL:er. De flesta vill ha allt, men du kan begränsa omfattningen nedan.';

  @override
  String get privacyDashboardExportMyData => 'Exportera mina data';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Radera permanent meddelanden du har skickat i DM-konversationer, grupp-DM-konversationer och communities. Arbetet körs i bakgrunden och du får ett DM när det är klart.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Ta bort mina meddelanden';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Tillåta direktmeddelanden från communitymedlemmar?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Blockera direktmeddelanden från communitymedlemmar?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Tillåt botar att skicka direktmeddelanden till dig?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blockera botar från att skicka dig direktmeddelanden?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Vill du även tillåta direktmeddelanden från medlemmar i dina befintliga communities?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Vill du även blockera direktmeddelanden från medlemmar i dina befintliga communities?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Vill du även tillåta botar från dina befintliga communities att skicka direktmeddelanden till dig?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Vill du även blockera botar från dina befintliga grupper?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Du kan också ändra den här inställningen per community genom att långtrycka på communitynamnet och välja Sekretessinställningar.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Tillåt för alla communities';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Blockera för alla communities';

  @override
  String get privacyDashboardDmConfirmSkip => 'Hoppa över det här steget';

  @override
  String get privacyDashboardDataRequestGoBack => 'Gå tillbaka';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Exportera mina data';

  @override
  String get privacyDashboardDataRequestDeleteTitle =>
      'Ta bort mina meddelanden';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Vi behandlar detta så snart som möjligt. Du får ett mejl när ditt arkiv är klart.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Vi behandlar detta så snart som möjligt. Du får ett DM från oss när det är klart.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Vad som ska inkluderas';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Allt';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exportera alla meddelanden du någonsin har skickat, plus alla dina kontoinställningar, medlemskap och metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Anpassat urval';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Välj vilka konversationstyper och communities samt vilken tidsperiod som ska ingå i arkivet.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Välj vad som ska inkluderas';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Välj vilka typer av konversationer som ska rensas.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Endast platser jag inte längre har åtkomst till';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Radera bara meddelanden från communities och grupp-DM-konversationer som du har lämnat eller blivit borttagen från.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Vilka konversationer';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Välj vilka typer av konversationer du vill inkludera.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Öppna direktmeddelanden';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Stängda DM-konversationer';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Grupp-DM';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Vilka communities';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Communityfilter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Inkludera alla utom valda';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Endast de valda';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Du är inte med i några communities just nu.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Tidsintervall';

  @override
  String get privacyDashboardDataRequestDateMode => 'Tidsintervall';

  @override
  String get privacyDashboardDataRequestAllTime => 'Alltid';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Anpassat intervall';

  @override
  String get privacyDashboardDataRequestStartDate => 'Startdatum';

  @override
  String get privacyDashboardDataRequestEndDate => 'Slutdatum';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Lämna ett fält tomt för att inte begränsa den delen av tidsintervallet.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Välj minst en typ av konversation att inkludera.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Startdatum måste vara tidigare än slutdatum.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Granska och bekräfta';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Vi skapar ett nedladdningsbart arkiv med alla meddelanden du någonsin har skickat och mejlar dig när det är klart. Nedladdningslänken i det mejlet upphör att gälla efter 7 dagar.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Vi skapar ett nedladdningsbart arkiv som matchar filtren nedan och mejlar dig när det är klart. Nedladdningslänken i mejlet upphör att gälla efter 7 dagar.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Ta bort meddelanden som matchar filtren nedan permanent. Detta kan inte ångras.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Det går inte att ångra när detta har startat. Vi skickar ett direktmeddelande till dig när det är klart.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Begär export';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Ta bort meddelanden';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Omfattning';

  @override
  String get privacyDashboardDataRequestSummaryConversations =>
      'Konversationer';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Tidsintervall';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Ingen';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Från $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Till $end';
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
      other: '$count communities',
      one: '$count community',
    );
    return 'Alla utom $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count communities',
      one: '$count community',
    );
    return 'Endast $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Öppna direktmeddelanden';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Stängda DM-konversationer';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'DM-konversationer (öppna och stängda)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Grupp-DM';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Communities';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours timmar',
      one: '$hours timme',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuter',
      one: '$minutes minut',
    );
    return '$_temp0 och $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours timmar',
      one: '$hours timme',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuter',
      one: '$minutes minut',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds sekunder',
      one: '$seconds sekund',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Kunde inte ladda sekretessinställningar';

  @override
  String get privacyDashboardRetry => 'Försök igen';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Kunde inte spara inställningar för känsligt innehåll.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Misslyckades med att slutföra begäran.';

  @override
  String get chatMessageDeleteFailed => 'Misslyckades att ta bort meddelande';

  @override
  String get chatMessageAddReaction => 'Lägg till reaktion';

  @override
  String get doubleTapReactionHint => 'Dubbeltryck på ett meddelande för att';

  @override
  String get doubleTapEditHint =>
      'Dubbeltryck på ditt eget meddelande för att redigera det';

  @override
  String get doubleTapReactionEdit => 'Redigera';

  @override
  String get doubleTapReactionEditTitle => 'Redigera standard';

  @override
  String get doubleTapReactionEditSubtitle => 'Välj emoji för dubbeltryck';

  @override
  String get messagesMediaGesturesSectionTitle => 'Gester';

  @override
  String get messagesMediaGesturesSectionDescription =>
      'Ställ in dubbeltryck och svep på meddelanden.';

  @override
  String get messagesMediaGesturesReactionLabel => 'Reaktionsemoji';

  @override
  String get messagesMediaGesturesReactionDescription =>
      'Används när dubbeltryck är inställt på att lägga till en reaktion.';

  @override
  String get messagesMediaGesturesDoubleTapActionLabel =>
      'Åtgärd vid dubbeltryck';

  @override
  String get messagesMediaGesturesDoubleTapActionReactName =>
      'Lägg till reaktion';

  @override
  String get messagesMediaGesturesDoubleTapActionReactDescription =>
      'Lägger till din standardemoji för dubbeltryck som reaktion.';

  @override
  String get messagesMediaGesturesDoubleTapActionEditName =>
      'Redigera meddelande';

  @override
  String get messagesMediaGesturesDoubleTapActionEditDescription =>
      'Öppnar redigeraren för meddelanden du har skickat. Andra meddelanden påverkas inte.';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneName => 'Inget';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneDescription =>
      'Dubbeltryck är avstängt.';

  @override
  String get messagesMediaGesturesSwipeRightToLeftLabel =>
      'Svep från höger till vänster';

  @override
  String get messagesMediaGesturesSwipeRightToLeftReplyName =>
      'Svep för att svara';

  @override
  String get messagesMediaGesturesSwipeRightToLeftReplyDescription =>
      'Svep på ett meddelande för att svara och håll in för att redigera dina egna meddelanden.';

  @override
  String get messagesMediaGesturesSwipeRightToLeftChannelDetailsName =>
      'Visa kanalinformation';

  @override
  String get messagesMediaGesturesSwipeRightToLeftChannelDetailsDescription =>
      'Svep på ett meddelande eller tryck på kanalrubriken för att öppna kanalinformationen i en sidopanel.';

  @override
  String get chatMessageEdit => 'Redigera meddelande';

  @override
  String get chatMessageReply => 'Svara';

  @override
  String get notificationReplyPlaceholder => 'Meddelande';

  @override
  String get notificationReplyFailed => 'Kunde inte skicka svar';

  @override
  String get chatMessageForward => 'Vidarebefordra';

  @override
  String get forwardMessageTitle => 'Vidarebefordra meddelande';

  @override
  String get forwardSearchHint => 'Sök kanaler eller DM';

  @override
  String get forwardDirectMessagesSection => 'Direktmeddelanden';

  @override
  String get forwardCommentHint => 'Lägg till en kommentar (valfritt)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Skicka ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Inga kanaler hittades';

  @override
  String get forwardSuccessToast => 'Meddelande vidarebefordrat';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Kommentarer är otillgängliga eftersom en vald kanal har långsamt läge aktiverat.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Väntar på att väntetiden för långsamt läge ska löpa ut i en eller flera valda kanaler.';

  @override
  String get slowmodeRateLimitedTitle => 'Långsamt läge aktivt';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Långsamt läge är aktiverat – vänta $duration innan du skickar ett nytt meddelande.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Direkt uppladdning är inaktiverad under långsamt läge.';

  @override
  String get shareMediaTitle => 'Dela till';

  @override
  String get shareMediaMessageHint => 'Lägg till ett valfritt meddelande…';

  @override
  String get shareMediaSendButton => 'Skicka';

  @override
  String get shareMediaSuccessToast => 'Media delad';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Delat till $count destinationer';
  }

  @override
  String get shareMediaFailedToast => 'Kunde inte dela media';

  @override
  String get forwardDestinationNoSendPermission =>
      'Du kan inte skicka meddelanden här';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Du kan inte bädda in länkar här';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Du kan inte bifoga filer här';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Det går inte att skicka meddelanden i den här communityn';

  @override
  String get forwardDestinationTimedOut => 'Du är avstängd i denna community';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Långsamt läge – vänta $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopiera meddelande';

  @override
  String get chatMessageCopyEmbedText => 'Kopiera inbäddad text';

  @override
  String get chatMessageTranslate => 'Översätt';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Översatt från $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Visa original';

  @override
  String get chatMessageSeeTranslation => 'Visa översättning';

  @override
  String get chatMessageTranslating => 'Översätter…';

  @override
  String get chatMessageTranslateFailed =>
      'Kunde inte översätta det här meddelandet.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Översättning är inte tillgänglig på den här enheten.';

  @override
  String get chatMessageSpeak => 'Läs upp meddelande';

  @override
  String get chatMessageStopSpeaking => 'Stoppa uppläsning';

  @override
  String get chatMessagePin => 'Fäst meddelande';

  @override
  String get chatMessageUnpin => 'Lossa meddelande';

  @override
  String get chatMessageUnpinIt => 'Lossa det';

  @override
  String get chatMessageBookmark => 'Bokmärk meddelande';

  @override
  String get chatMessageRemoveBookmark => 'Ta bort bokmärke';

  @override
  String get chatMessageMarkAsUnread => 'Markera som oläst';

  @override
  String get chatMessageCopyMessageLink => 'Kopiera meddelandelänk';

  @override
  String get chatMessageOpenLink => 'Öppna länk';

  @override
  String get chatMessageCopyLink => 'Kopiera länk';

  @override
  String get chatMessageCopyMessageId => 'Kopiera meddelande-ID';

  @override
  String get chatMessageViewReactions => 'Visa reaktioner';

  @override
  String get chatMessageRemoveAllReactions => 'Ta bort alla reaktioner';

  @override
  String get chatMessageDebug => 'Felsök meddelande';

  @override
  String get chatMessageDebugSheetTitle => 'Felsök meddelande';

  @override
  String get chatMessageDebugCopyJson => 'Kopiera JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Meddelande-JSON kopierat till urklipp';

  @override
  String get chatReactionsSheetTitle => 'Reaktioner';

  @override
  String get chatReactionsSheetEmpty => 'Ingen har reagerat med detta än.';

  @override
  String get chatReactionAddFailed => 'Kunde inte lägga till reaktion';

  @override
  String get chatReactionRemoveFailed => 'Kunde inte ta bort reaktion';

  @override
  String get chatMessageReport => 'Anmäl meddelande';

  @override
  String get reportFlowTitleMessage => 'Anmäl meddelande';

  @override
  String get reportFlowTitleUserProfile => 'Anmäl profil';

  @override
  String get reportFlowSummaryTitle => 'Granska din anmälan';

  @override
  String get reportFlowSummarySubtitle =>
      'Kontrollera att allt ser rätt ut innan du skickar.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Anmäl bara det du ärligt tror bryter mot reglerna. Att missbruka anmälningar går emot våra $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'communityriktlinjer';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Anmäl bara det du ärligt tror bryter mot reglerna, och skicka inte samma anmälan två gånger.';

  @override
  String get reportFlowSelectedMessage => 'Meddelandet du anmäler';

  @override
  String get reportFlowSelectedUser => 'Profilen du anmäler';

  @override
  String get reportFlowReportCategory => 'Dina svar';

  @override
  String get reportFlowSubmit => 'Skicka anmälan';

  @override
  String get reportFlowBack => 'Tillbaka';

  @override
  String get reportFlowNext => 'Nästa';

  @override
  String get reportFlowDone => 'Klar';

  @override
  String get reportFlowThankYouTitle => 'Anmälan skickad';

  @override
  String get reportFlowThankYouNoReportTitle =>
      'Tack för att du flaggade detta';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'Säkerhetsteamet på $productName granskar din anmälan. Vi avslöjar inte att den kommer från dig.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Tack för att du berättade. Det här bryter inte mot våra regler i sig, så vi skickade ingen anmälan. Om det riktar sig mot någon eller använder nedsättande ord, anmäl det igen och välj ”Kränkande eller skadligt innehåll”.';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Tack för att du berättade. Det här bryter inte mot våra regler i sig, så vi skickade ingen anmälan.';

  @override
  String get reportFlowMoreYouCanDo => 'Dina alternativ';

  @override
  String reportFlowBlockName(String name) {
    return 'Blockera $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'Döljer deras meddelanden och stoppar dem från att skicka meddelanden till dig';

  @override
  String get reportFlowBlockButton => 'Blockera';

  @override
  String get reportFlowBlockedButton => 'Blockerad';

  @override
  String get reportFlowUrgentBanner =>
      'Om någon är i omedelbar fara, kontakta först de lokala nödtjänsterna.';

  @override
  String get reportFlowLoadFailed => 'Kunde inte ladda formuläret för anmälan.';

  @override
  String get reportFlowTryAgain => 'Försök igen';

  @override
  String get reportFlowOutdated =>
      'Formuläret för anmälan har ändrats. Börja om.';

  @override
  String get reportFlowAlreadyReported =>
      'Du har redan anmält det här meddelandet.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Du har redan anmält den här profilen idag.';

  @override
  String get reportFlowRateLimited =>
      'Du skickar anmälningar för snabbt. Försök igen senare.';

  @override
  String get reportFlowSubmitFailed =>
      'Din anmälan gick inte igenom. Försök igen.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Säkra ditt konto och verifiera din e-postadress för att skicka anmälningar.';

  @override
  String get chatMessageSuppressEmbeds => 'Dölj inbäddningar';

  @override
  String get chatMessageUnsuppressEmbeds => 'Visa inbäddningar';

  @override
  String get chatMessageDelete => 'Ta bort meddelande';

  @override
  String get chatMessageDeleteConfirmTitle => 'Ta bort meddelande';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Är du säker på att du vill ta bort det här meddelandet?';

  @override
  String get chatMessageDeleteAttachment => 'Ta bort bilaga';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Är du säker på att du vill ta bort den här bilagan?';

  @override
  String get chatMessageEditAttachmentAltText => 'Redigera alt-text';

  @override
  String get chatMessageMore => 'Mer';

  @override
  String get chatEditingMessage => 'Redigerar meddelande';

  @override
  String get chatReplyOriginalDeleted => 'Originalmeddelandet raderades';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Det gick inte att ladda originalmeddelandet';

  @override
  String get chatReplyAttachedMedia => 'Meddelandet innehåller bifogade medier';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blockerade konversationer',
      one: '1 blockerad konversation',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potentiella spam-meddelanden',
      one: '1 potentiellt spam-meddelande',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Svar dolt eftersom den ursprungliga författaren är blockerad.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Svar dolt eftersom den ursprungliga författaren är markerad som spam.';

  @override
  String get devMarkAsSpamLocally => 'Markera som spam lokalt';

  @override
  String get devIgnoreSpamFlag => 'Ignorera spammarkering';

  @override
  String get chatMessagesLoadError => 'Kunde inte ladda meddelanden.';

  @override
  String get chatMessagesFailedToLoad => 'Det gick inte att ladda meddelanden';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Åsidosätta inställningen för omnämnanden?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname föredrar att bli @-omnämnd i svar. Skicka utan omnämnandet ändå?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname föredrar svar utan ett @-omnämnande. Skicka med omnämnandet ändå?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorera inställning';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klicka för att sluta pinga användaren du svarar.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klicka för att pinga användaren du svarar.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Omnämn svarande användare';

  @override
  String get chatReplyMentionOn => 'PÅ';

  @override
  String get chatReplyMentionOff => 'AV';

  @override
  String get chatReplyCancel => 'Avbryt svar';

  @override
  String get chatEditMessageHint => 'Redigera meddelande';

  @override
  String get chatEditNoChanges => 'Inga ändringar att spara';

  @override
  String get chatEditFailed => 'Ditt meddelande uppdaterades inte';

  @override
  String get chatEditFailedEditAgain => 'Redigera igen';

  @override
  String get chatChannelNotReady =>
      'Den här kanalen är inte redo än. Försök igen om en stund.';

  @override
  String get chatMessageEdited => '(redigerat)';

  @override
  String get chatMessageSilent => 'Det här var ett @silent-meddelande.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Idag kl. $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Igår kl. $time';
  }

  @override
  String get mediaViewerImagePreview => 'Bildförhandsvisning';

  @override
  String get mediaViewerClose => 'Stäng medievisaren';

  @override
  String get mediaViewerOpenInBrowser => 'Öppna i webbläsaren';

  @override
  String get mediaViewerOptions => 'Mediealternativ';

  @override
  String get mediaViewerCopyLink => 'Kopiera länk';

  @override
  String get mediaViewerForward => 'Vidarebefordra';

  @override
  String get mediaViewerZoomIn => 'Zooma in';

  @override
  String get mediaViewerZoomOut => 'Zooma ut';

  @override
  String get mediaViewerPreviousAttachment => 'Föregående bilaga';

  @override
  String get mediaViewerNextAttachment => 'Nästa bilaga';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Bilaga $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Stäng';

  @override
  String get chatAttachmentVideoToggleControls => 'Visa/dölj videokontroller';

  @override
  String get chatAttachmentVideoMute => 'Stäng av ljudet för video';

  @override
  String get chatAttachmentVideoUnmute => 'Slå på ljudet för video';

  @override
  String get chatAttachmentVideoPlay => 'Spela upp video';

  @override
  String get chatAttachmentVideoPause => 'Pausa video';

  @override
  String get chatAttachmentVideoProgress => 'Videoförlopp';

  @override
  String get chatVideoPlaybackFailed => 'Kunde inte spela upp den här videon.';

  @override
  String get chatImageCouldNotLoad => 'Kunde inte läsa in den här bilden.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Meddela användare med den här rollen som har behörighet att se den här kanalen.';

  @override
  String get composerAutocompleteSuggestions => 'Förslag';

  @override
  String get composerAutocompleteCommandsHeading => 'Kommandon';

  @override
  String get composerAutocompleteChoicesHeading => 'Val';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => 'Valfria argument';

  @override
  String get composerAutocompleteMediaHeading => 'Medier';

  @override
  String get composerAutocompleteStickersHeading => 'Klistermärken';

  @override
  String get composerAutocompleteEmojisHeading => 'Emojier';

  @override
  String get composerAutocompleteGifsHeading => 'GIF:ar';

  @override
  String get composerAutocompleteNoGifs => 'Inga GIF-ar hittades';

  @override
  String get composerCommandShrugDescription =>
      'Lägger till ¯\\_(ツ)_/¯ i ditt meddelande.';

  @override
  String get composerCommandTableflipDescription =>
      'Lägger till (╯°□°)╯︵ ┻━┻ i ditt meddelande.';

  @override
  String get composerCommandUnflipDescription =>
      'Lägger till ┬─┬ ノ( ゜-゜ノ) i ditt meddelande.';

  @override
  String get composerCommandMeDescription =>
      'Skicka ett åtgärdsmeddelande (visas i kursiv stil).';

  @override
  String get composerCommandSpoilerDescription =>
      'Skicka ett spoilermeddelande (slås in i spoilertaggar).';

  @override
  String get composerCommandTtsDescription =>
      'Skicka ett text-till-tal-meddelande.';

  @override
  String get composerCommandNickDescription =>
      'Ändra ditt smeknamn i den här communityn.';

  @override
  String get composerCommandKickDescription =>
      'Sparka ut en medlem ur den här communityn.';

  @override
  String get composerCommandBanDescription =>
      'Bannlys en medlem från den här communityn.';

  @override
  String get composerCommandMsgDescription =>
      'Skicka ett direktmeddelande till en användare.';

  @override
  String get composerCommandSavedDescription =>
      'Skicka ett sparat medieobjekt.';

  @override
  String get composerCommandStickerDescription => 'Skicka ett klistermärke.';

  @override
  String get composerCommandGifDescription => 'Sök och skicka en GIF.';

  @override
  String get composerCommandMemberOption => 'Medlemmen att rikta in sig på.';

  @override
  String get composerCommandReasonOption => 'Anledning (valfritt).';

  @override
  String get composerCommandMessageOption => 'Meddelandet att skicka.';

  @override
  String get composerCommandQueryOption => 'Vad du vill söka efter.';

  @override
  String get composerCommandNicknameOption =>
      'Ditt nya smeknamn, eller lämna tomt för att återställa det.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Hur mycket av medlemmens senaste meddelandehistorik som ska tas bort.';

  @override
  String get composerCommandDeleteMessagesNone => 'Radera inget';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Föregående $count dagar';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Senaste 24 timmarna';

  @override
  String get composerCommandOptionRequired =>
      'Det här alternativet krävs. Ange ett värde.';

  @override
  String get composerCommandClear => 'Rensa kommando';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Du ändrade ditt smeknamn i den här communityn från **$previousNickname** till **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Okänd användare';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Kunde inte skicka ett meddelande till **$username**. De kanske har inaktiverat direktmeddelanden, eller så kan du vara blockerad.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count till';
  }

  @override
  String get addGuildModalTitle => 'Lägg till en community';

  @override
  String get addGuildModalLandingDescription =>
      'Skapa en ny community eller gå med i en befintlig.';

  @override
  String get addGuildCreateCommunity => 'Skapa community';

  @override
  String get addGuildJoinCommunity => 'Gå med i communityn';

  @override
  String get addGuildImportDiscordTemplate => 'Importera Discord-mall';

  @override
  String get addGuildJoinTitle => 'Gå med i en community';

  @override
  String get addGuildJoinDescription =>
      'Ange inbjudningslänken för att gå med i en community.';

  @override
  String get addGuildInviteLinkLabel => 'Inbjudningslänk';

  @override
  String get addGuildJoinSubmit => 'Gå med i communityn';

  @override
  String get addGuildInviteInvalid =>
      'Den här inbjudan är ogiltig eller har gått ut.';

  @override
  String get addGuildCreateTitle => 'Skapa en community';

  @override
  String get addGuildCreateDescription =>
      'Skapa en community där du och dina vänner kan chatta.';

  @override
  String get addGuildCreateNameLabel => 'Namn på community';

  @override
  String get addGuildCreateSubmit => 'Skapa community';

  @override
  String get addGuildCreateFailed =>
      'Kunde inte skapa communityn. Försök igen.';

  @override
  String get addGuildCreateClaimTitle => 'Säkra ditt konto';

  @override
  String get addGuildCreateClaimDescription =>
      'Du måste säkra ditt konto innan du kan skapa en community.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifiera din e-postadress';

  @override
  String get addGuildCreateVerifyDescription =>
      'Du måste verifiera din e-postadress innan du kan skapa en community.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animerade ikoner stöds inte när du skapar en ny community. Använd en statisk bild.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Genom att skapa en community godkänner du att följa och upprätthålla ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '${productName}s communityriktlinjer';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Den här instansen är en enda community, så ytterligare communities kan inte skapas.';

  @override
  String get addGuildCreateChangeIcon => 'Ändra ikon';

  @override
  String get addGuildCreateIconLabel => 'Communityikon';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Max 10 MB. Rekommenderas: 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Klistra in en Discord-mall-URL för att importera dess struktur till en ny community.';

  @override
  String get addGuildImportUrlLabel => 'Mall-URL';

  @override
  String get addGuildImportUrlInvalid =>
      'Ange en giltig Discord-mall-URL eller kod.';

  @override
  String get addGuildImportFetchFailed =>
      'Kunde inte hämta community-mallen. Mallen kanske inte finns eller så är den externa tjänsten otillgänglig.';

  @override
  String get addGuildImportInvalidResponse =>
      'Det här ser inte ut som ett giltigt mall-svar.';

  @override
  String get addGuildImportTemplateLabel => 'Mall';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount text, $voiceChannelCount röst, $categoryCount kategorier, $roleCount roller';
  }

  @override
  String get addGuildImportRemoveIcon => 'Ta bort ikon';

  @override
  String get addGuildImportTemplateInvalid =>
      'Communitymallens data är ogiltig eller felaktigt formaterad.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Ta bort alla reaktioner';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Är du säker på att du vill ta bort alla reaktioner från det här meddelandet?';

  @override
  String get chatMessagePinConfirm => 'Fäst';

  @override
  String get chatMessagePinConfirmDescription =>
      'Fäst det här meddelandet i kanalen så att alla kan se det.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Lossa meddelande';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Ska den här fästade posten skickas tillbaka i tiden?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username nålade fast $messageLink i den här kanalen. Se $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'ett meddelande';

  @override
  String get systemPinMessageAllPinsLink => 'alla nålade meddelanden';

  @override
  String get channelPinsEmptyTitle => 'Inga fästa meddelanden';

  @override
  String get channelPinsEmptyDescription => 'Fästa meddelanden visas här.';

  @override
  String get channelDetailsFallbackTitle => 'Detaljer';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Gruppchatt · $count medlemmar';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Stäng din konversation med $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Lämna $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Kanalinställningar';

  @override
  String get channelDetailsGroupSettingsTitle => 'Gruppinställningar';

  @override
  String get channelDetailsDmSettingsTitle => 'DM-inställningar';

  @override
  String get channelDetailsInvitePeople => 'Bjud in personer';

  @override
  String get channelDetailsCopyLink => 'Kopiera länk';

  @override
  String get channelMenuCopyChannelLink => 'Kopiera kanallänk';

  @override
  String get channelMenuCopyRedirectLink => 'Kopiera omdirigeringslänk';

  @override
  String get channelDetailsAddFriendsToGroup => 'Lägg till vänner i gruppen';

  @override
  String get channelDetailsGroupInvites => 'Gruppinbjudningar';

  @override
  String get channelDetailsEditChannel => 'Redigera kanal';

  @override
  String get channelDetailsDeleteChannel => 'Ta bort kanal';

  @override
  String get channelSettingsEditCategory => 'Redigera kategori';

  @override
  String get channelSettingsTabOverview => 'Översikt';

  @override
  String get channelSettingsTabPermissions => 'Behörigheter';

  @override
  String get channelSettingsTabInvites => 'Inbjudningar';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Ta bort kanal';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Är du säker på att du vill radera $channelName? Detta kan inte ångras.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Är du säker på att du vill ta bort $categoryName? Detta går inte att ångra.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Ta bort kategori';

  @override
  String get channelSettingsChannelUpdated => 'Kanalen uppdaterades';

  @override
  String get channelSettingsChannelName => 'Kanalnamn';

  @override
  String get channelSettingsCategoryName => 'Kategorinamn';

  @override
  String get channelSettingsMyCategory => 'Min kategori';

  @override
  String get categoryExpandCategory => 'Fäll ut kategori';

  @override
  String get categoryCollapseCategory => 'Fäll ihop kategori';

  @override
  String get categoryExpandAllCategories => 'Fäll ut alla kategorier';

  @override
  String get categoryCollapseAllCategories => 'Fäll ihop alla kategorier';

  @override
  String get categoryMuteCategory => 'Tysta kategori';

  @override
  String get categoryUnmuteCategory => 'Sluta tysta kategorin';

  @override
  String get categoryCopyCategoryId => 'Kopiera kategori-ID';

  @override
  String get categoryIdCopied => 'Kategori-ID kopierat';

  @override
  String get channelSettingsChannelNamePlaceholder => 'allmänt';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://exempel.se';

  @override
  String get channelSettingsTopic => 'Ämne';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Lägg till ett ämne i den här kanalen';

  @override
  String get channelSettingsInsertEmoji => 'Infoga emoji';

  @override
  String get channelSettingsTopicTooLongTitle => 'Kanalämnet är för långt.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Korta ner ämnet och försök igen.';

  @override
  String get channelSettingsSlowmode => 'Långsamt läge';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Vänta mellan meddelanden. \"$bypassSlowmodePermissionLabel\" kan kringgå detta.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Av';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minuter';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours timmar';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minut';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour timme';
  }

  @override
  String get channelSettingsVoiceQuality => 'Röstkvalitet';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Högre bithastighet = bättre kvalitet och högre bandbreddsanvändning.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbit/s';
  }

  @override
  String get channelSettingsParticipantLimit => 'Deltagargräns';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maximalt antal medlemmar som kan ansluta samtidigt. 0 betyder obegränsat.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deltagare',
      one: '1 deltagare',
      zero: '∞ Ingen gräns',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Anslutningsgräns';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maximalt antal aktiva anslutningar en medlem kan ha i den här kanalen.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anslutningar',
      one: '1 anslutning',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Röstregion';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Välj en röstregion för den här kanalen. Automatisk använder den närmaste regionen.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatisk';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Kunde inte läsa in röstregioner';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Försök igen om en liten stund.';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Åsidosätt inställningen för $scopeLevel-nivå för den här kanalen. Mogen innehåll visas bakom en spärr före inträde.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Ärv';

  @override
  String get channelSettingsMatureContentOn => 'På';

  @override
  String get channelSettingsMatureContentOff => 'Av';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Markerar den här kanalen som innehåll för vuxna.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Låt den här kanalen vara öppen för moget innehåll.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Ärver från $inheritedSourceLabel: på';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Ärver från $inheritedSourceLabel: av';
  }

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategori';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Community';

  @override
  String get channelSettingsContentWarningToggle =>
      'Visa en innehållsvarning i den här kanalen';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Visar en begäran om samtycke innan du går in i den här kanalen.';

  @override
  String get channelSettingsContentWarningText => 'Anpassad varningstext';

  @override
  String get channelSettingsContentWarningDefault =>
      'Detta innehåller känsligt innehåll.';

  @override
  String get channelSettingsUnknownRole => 'Okänd roll';

  @override
  String get channelSettingsUnknownUser => 'Okänd användare';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'Åsidosatt åtkomst';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Ändra åtkomst för $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Tillbaka till åsidosättningar';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Konfigurera grundläggande åtkomst för den här kanalen';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Konfigurera åsidosättningar för den här rollen';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Konfigurera åsidosättningar för den här medlemmen';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Sök behörigheter…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Kanalåtkomst uppdaterad';

  @override
  String get channelSettingsPermissionsTitle => 'Åtkomstkontroll';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Den här kanalen är synkroniserad med den överordnade kategorin ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Den här kanalen är inte synkroniserad med den överordnade kategorin ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => 'Synka med kategori';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanalen är synkroniserad med den överordnade kategorin';

  @override
  String get channelSettingsPermissionsAddOverride => 'Lägg till åsidosättning';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Sök roller eller medlemmar…';

  @override
  String get channelSettingsDeleteInvite => 'Ta bort inbjudan';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Ta bort den här inbjudan? Det går inte att ångra.';

  @override
  String get channelSettingsCopyInviteCode => 'Kopiera inbjudningskod';

  @override
  String get channelSettingsCopyInviteUrl => 'Kopiera inbjudningslänk';

  @override
  String get channelSettingsWebhookCreated => 'Webhook skapad';

  @override
  String get channelSettingsWebhookCreateFailed => 'Kunde inte skapa webhook';

  @override
  String get channelSettingsCreateWebhook => 'Skapa webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Hantera inbjudningslänkar för den här kanalen.';

  @override
  String get channelSettingsInvitesCreate => 'Skapa inbjudan';

  @override
  String get channelSettingsInvitesEmpty => 'Inga inbjudningslänkar';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Den här kanalen har inga inbjudningslänkar än. Skapa en för att bjuda in folk till kanalen.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Det gick inte att läsa in inbjudningslänkarna för den här kanalen. Försök igen.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Hantera inkommande webhooks som kan publicera meddelanden i den här kanalen.';

  @override
  String get channelSettingsWebhooksEmpty => 'Inga webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Det finns inga webhooks konfigurerade för den här kanalen. Skapa en webhook för att tillåta externa appar att skicka meddelanden.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Den här kanalen har inte stöd för webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Du behöver behörigheten \"$permission\" för att visa och redigera webhooks för den här kanalen.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Det gick inte att läsa in webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Det gick inte att läsa in webhooks för den här kanalen. Försök igen.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Skapad av $creator den $date';
  }

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Ladda upp bild';

  @override
  String get channelSettingsWebhooksRemove => 'Ta bort';

  @override
  String get channelSettingsWebhooksName => 'Namn';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhooknamn';

  @override
  String get channelSettingsWebhooksChannel => 'Kanal';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook-URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopiera webhook-URL';

  @override
  String get channelSettingsWebhooksDelete => 'Ta bort webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Kunde inte ta bort den här webhooken';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Ta bort den här webhooken? Kan inte ångras.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Försök igen om en liten stund.';

  @override
  String get channelMenuOpenChat => 'Öppna chatt';

  @override
  String get channelMenuDuplicateChannel => 'Duplicera kanal';

  @override
  String channelDuplicateHelper(String channelName) {
    return 'Den nya kanalen får samma behörigheter som $channelName.';
  }

  @override
  String channelDuplicateVoiceHelper(String channelName) {
    return 'Den nya röstkanalen får samma behörigheter, användargräns och bithastighet som $channelName.';
  }

  @override
  String get channelMenuMoveToCategory => 'Flytta till kategori';

  @override
  String get channelMenuNoCategory => 'Ingen kategori';

  @override
  String get channelMoveCategoryFullTitle => 'Kategorin är full';

  @override
  String channelMoveCategoryFullMessage(int maxChannelsPerCategory) {
    return 'Den här kategorin innehåller redan det maximala antalet kanaler: $maxChannelsPerCategory.';
  }

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Återställ godkännandestatus för vuxet innehåll';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Vill du ta bort dina meddelanden i den här kanalen?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Detta kommer att radera alla meddelanden du någonsin har skickat i den här kanalen permanent. Detta kan inte ångras.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Ta bort mina meddelanden';

  @override
  String get channelMenuDeletedYourMessages =>
      'Dina meddelanden har tagits bort';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Kunde inte radera dina meddelanden';

  @override
  String get channelDetailsSystemMessage => 'Systemmeddelande';

  @override
  String get channelDetailsTextChannel => 'Textkanal';

  @override
  String get channelDetailsVoiceChannel => 'Röstkanal';

  @override
  String get channelDetailsCategory => 'Kategori';

  @override
  String get channelDetailsLinkChannel => 'Länka kanal';

  @override
  String get channelDetailsGenericChannel => 'Kanal';

  @override
  String get channelDetailsMutedConversation => 'Konversation stängd';

  @override
  String get channelDetailsUnmutedConversation =>
      'Konversationen har slagits på ljud';

  @override
  String get channelDetailsMutedChannel => 'Kanalen är stängd';

  @override
  String get channelDetailsUnmutedChannel => 'Kanalen har avstängts';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Aviseringsinställningar uppdaterade';

  @override
  String get channelDetailsTabMembers => 'Medlemmar';

  @override
  String get channelDetailsTabPins => 'Fästa meddelanden';

  @override
  String get channelDetailsActionMute => 'Tysta';

  @override
  String get channelDetailsActionUnmute => 'Slå på ljud';

  @override
  String get channelDetailsActionSearch => 'Sök';

  @override
  String get channelDetailsActionMore => 'Mer';

  @override
  String get channelDetailsMembersEmptyTitle => 'Inga medlemmar att visa';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Medlemmar visas här när community-data har laddats.';

  @override
  String get memberListPermissionDeniedTitle => 'Du kan inte se medlemmar';

  @override
  String get memberListPermissionDeniedBody =>
      'Du kan inte se medlemmarna i den här kanalen i den här communityn';

  @override
  String get memberListUnavailableTitle => 'Medlemslistan är inte tillgänglig';

  @override
  String get memberListUnavailableBody =>
      'Medlemslistor är tillfälligt otillgängliga i den här communityn';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Det gick inte att ladda fastnaggade meddelanden';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Medlemmar med behörigheten \"Fäst meddelanden\" kan fästa meddelanden som alla kan se.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Du kan fästa meddelanden i den här konversationen så att alla kan se dem.';

  @override
  String get channelDetailsPinsEndReached => 'Du har nått slutet';

  @override
  String get channelHeaderPinnedMessages => 'Fästa meddelanden';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Fästa meddelanden, olästa';

  @override
  String get channelHeaderMemberList => 'Medlemslista';

  @override
  String get channelHeaderInbox => 'Inkorg';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Aviseringsinställningar, avstängd';

  @override
  String get channelDetailsSearchTitle => 'Sök';

  @override
  String get channelDetailsSearchHint => 'Sök meddelanden';

  @override
  String get channelDetailsSearchFilterFrom => 'Från';

  @override
  String get channelDetailsSearchFilterHas => 'Har';

  @override
  String get channelDetailsSearchFilterIn => 'I';

  @override
  String get channelDetailsSearchFilterMentions => 'Omnämnanden';

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
    return '$count användare';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Användare';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtrera efter kanal';

  @override
  String get channelDetailsSearchChannelsHint => 'Sök kanaler';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Inga kanaler hittades';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Fästa';

  @override
  String get channelDetailsSearchPinnedTrue => 'Endast fästa';

  @override
  String get channelDetailsSearchPinnedFalse => 'Exkludera fästa';

  @override
  String get channelDetailsSearchClearFilter => 'Rensa';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Författartyp';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Datum';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Datumläge';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Välj ett datum';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Länkens värdnamn';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Filnamnet innehåller';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Filändelse';

  @override
  String get channelDetailsSearchContentPoll => 'Röstning';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Meddelanden med en omröstning';

  @override
  String get channelDetailsSearchContentForward => 'Vidarebefordra';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Videresända meddelanden';

  @override
  String get channelDetailsSearchFilterSort => 'Sortera';

  @override
  String get channelHeaderSearchFiltersTitle => 'Sökfilter';

  @override
  String get channelHeaderSearchRecentTitle => 'Senaste sökningar';

  @override
  String get channelHeaderSearchUsersTitle => 'Användare';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanaler';

  @override
  String get channelHeaderSearchValuesTitle => 'Värden';

  @override
  String get channelHeaderSearchDatesTitle => 'Datum';

  @override
  String get channelHeaderSearchDefaultBadge => 'Standard';

  @override
  String get channelHeaderSearchClearHistory => 'Rensa';

  @override
  String get channelSearchRemoveRecent => 'Ta bort från senaste sökningar';

  @override
  String get channelSearchFiltersButton => 'Filter';

  @override
  String get channelSearchFilterMenuTitle => 'Filtrera resultat';

  @override
  String get channelSearchFilterFromLabel => 'Från en viss person';

  @override
  String get channelSearchFilterMentionsLabel => 'Nämner en viss person';

  @override
  String get channelSearchFilterHasLabel => 'Har en länk, fil eller inbäddning';

  @override
  String get channelSearchFilterInLabel => 'I en viss kanal';

  @override
  String get channelSearchFilterDuringLabel => 'Skickat ett visst datum';

  @override
  String get channelSearchFilterBeforeLabel => 'Skickat före ett datum';

  @override
  String get channelSearchFilterAfterLabel => 'Skickat efter ett datum';

  @override
  String get channelSearchFilterPinnedLabel => 'Fäst eller inte fäst';

  @override
  String get channelSearchFilterAuthorTypeLabel => 'Efter typ av avsändare';

  @override
  String get channelSearchDateToday => 'Idag';

  @override
  String get channelSearchDateYesterday => 'Igår';

  @override
  String get channelSearchTabMessages => 'Meddelanden';

  @override
  String get channelSearchTabImages => 'Bilder';

  @override
  String get channelSearchTabPins => 'Fästa meddelanden';

  @override
  String get channelSearchTabLinks => 'Länkar';

  @override
  String get channelSearchTabFiles => 'Filer';

  @override
  String channelSearchTabCount(String label, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$label ($countString)';
  }

  @override
  String get channelHeaderSearchFilterDescFrom => 'en användare';

  @override
  String get channelHeaderSearchFilterDescMentions => 'en användare';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'länk, media, bild, video, ljud, fil, klistermärke, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'ett datum eller datumintervall';

  @override
  String get channelHeaderSearchFilterDescOn =>
      'ett datum eller datumintervall';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'ett datum eller datumintervall';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'ett datum eller datumintervall';

  @override
  String get channelHeaderSearchFilterDescIn => 'en kanal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'sant eller falskt';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'användare, bot eller webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'ett värdnamn, t.ex. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'del av ett filnamn för en bilaga';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'ett filnamnstillägg, t.ex. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'tidsstämpel eller relevans';

  @override
  String get channelHeaderSearchFilterDescOrder => 'stigande eller fallande';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString resultat',
      one: '1 resultat',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filtrera efter användare';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtrera efter innehåll';

  @override
  String get channelDetailsSearchSortBy => 'Sortera resultat efter';

  @override
  String get channelDetailsSearchIn => 'Sök i';

  @override
  String get channelDetailsSearchEmptyTitle => 'Sök i den här konversationen';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Ange text, en författare eller ett innehållsfilter för att hitta meddelanden.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Meddelanden indexeras';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Försök igen strax när sökningen har indexerat det här omfånget.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Inga resultat';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Prova andra söktermer eller filter.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

  @override
  String get channelDetailsMemberYou => 'Du';

  @override
  String get channelDetailsSearchUsersHint => 'Sök användare';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Skriv för att söka efter medlemmar';

  @override
  String get channelDetailsSearchUsersEmpty => 'Inga användare hittades';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Inga användare tillgängliga';

  @override
  String get channelDetailsDone => 'Klar';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Visa meddelanden som innehåller:';

  @override
  String get channelDetailsRetry => 'Försök igen';

  @override
  String get channelDetailsPinnedMessageTitle => 'Fäst meddelande';

  @override
  String get channelDetailsSearchResultTitle => 'Sökresultat';

  @override
  String get channelDetailsJumpToMessage => 'Gå till meddelande';

  @override
  String get channelDetailsUnpinMessage => 'Lossa meddelande';

  @override
  String get channelDetailsCopyMessageLink => 'Kopiera meddelandelänk';

  @override
  String get channelDetailsCopyMessageId => 'Kopiera meddelande-ID';

  @override
  String get channelDetailsMessageUnpinned => 'Meddelandet lossat';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Aktuell community';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Nuvarande DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Alla communities';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Endast alla DM-konversationer';

  @override
  String get channelDetailsSearchScopeAllDms => 'Alla DM-konversationer';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Endast öppna DM-konversationer';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Öppna direktmeddelanden';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Alla DM-konversationer och communities';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Öppna DM-konversationer och communities';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Sök bara i den aktuella communityn';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Sök bara i den aktuella DM-konversationen';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'I alla dina communities';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Endast i alla DM-konversationer du någonsin varit med i';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'I alla DM-konversationer du någonsin varit med i';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'I alla dina öppna direktmeddelanden';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'I alla dina öppna direktmeddelanden';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'I alla direktmeddelanden du någonsin varit i + alla communities du är med i just nu';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'I alla dina öppna direktmeddelanden + alla dina communities';

  @override
  String get channelDetailsSearchSortNewest => 'Nyast först';

  @override
  String get channelDetailsSearchSortOldest => 'Äldst först';

  @override
  String get channelDetailsSearchSortRelevance => 'Mest relevant';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Visa de senaste meddelandena först';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Visa äldsta meddelanden först';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Visa mest relevanta meddelanden först';

  @override
  String get channelDetailsSearchContentImage => 'Bilduppladdning';

  @override
  String get channelDetailsSearchContentVideo => 'Videouppladdning';

  @override
  String get channelDetailsSearchContentAudio => 'Ljuduppladdning';

  @override
  String get channelDetailsSearchContentFile => 'Filuppladdning';

  @override
  String get channelDetailsSearchContentLink => 'Länk';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Länkförhandsvisning eller inbäddning';

  @override
  String get channelDetailsSearchContentSticker => 'Klistermärke';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Endast uppladdade bildfiler';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Endast uppladdade videofiler';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Endast uppladdade ljudfiler';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Valfri uppladdad bilaga';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL skriven i meddelandetexten';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Hämtade förhandsvisningar och avancerade inbäddningar, inte uppladdningar';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Klistermärke bifogat med meddelandet';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count typer';
  }

  @override
  String get personalNotesTitle => 'Personliga anteckningar';

  @override
  String get personalNotesSubtitle =>
      'Ditt privata utrymme för tankar och påminnelser';

  @override
  String groupDmWelcome(String displayName) {
    return 'Välkommen till $displayName. Lägg till vänner för att få igång gruppen.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Redigera grupp';

  @override
  String get groupDmWelcomeAddFriends => 'Lägg till vänner i gruppen';

  @override
  String get dmGroupInvites => 'Inbjudningar';

  @override
  String get groupDmEditTitle => 'Redigera grupp';

  @override
  String get groupDmGroupName => 'Gruppnamn';

  @override
  String get groupDmMyGroup => 'Min grupp';

  @override
  String get groupDmGroupNameMaxLength =>
      'Gruppnamnet får inte vara längre än 100 tecken';

  @override
  String get groupDmGroupIcon => 'Gruppikon';

  @override
  String get groupDmUploadIcon => 'Ladda upp ikon';

  @override
  String get groupDmChangeIcon => 'Ändra ikon';

  @override
  String get groupDmRemoveIcon => 'Ta bort ikon';

  @override
  String get groupDmUpdated => 'Gruppen uppdaterad';

  @override
  String get groupDmUpdateFailed =>
      'Kunde inte uppdatera gruppen. Försök igen.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animerade ikoner stöds inte. Använd en statisk bild.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animerade ikoner stöds inte';

  @override
  String get groupDmIconFileTooLargeTitle => 'Ikonfilen är för stor';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Filen är för stor. Välj en fil som är mindre än $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat =>
      'Filformatet för ikonen stöds inte';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Filtypen stöds inte.';

  @override
  String get groupDmInvalidImage => 'Ogiltig bild';

  @override
  String get groupDmInvalidImageBody =>
      'Bilden är ogiltig. Försök med en annan.';

  @override
  String get groupDmAddFriends => 'Lägg till';

  @override
  String get groupDmOrSendInvite => 'eller skicka en inbjudan till en vän:';

  @override
  String get groupDmGenerateInviteLink => 'Generera inbjudningslänk';

  @override
  String get groupDmCreateInvite => 'Skapa';

  @override
  String get groupDmInviteExpires24Hours => 'Din inbjudan går ut om 24 timmar';

  @override
  String get groupDmAddFriendFailed =>
      'Kunde inte lägga till den här vännen i gruppen. Försök igen.';

  @override
  String get groupDmGroupFull =>
      'Den här gruppen är full. Ta bort någon innan du lägger till fler personer.';

  @override
  String get groupDmRateLimited =>
      'Du går för snabbt. Vänta ett ögonblick och försök igen.';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Kunde inte skapa en inbjudningslänk. Försök igen.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Kunde inte skapa en inbjudningslänk. Försök igen.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Du har inte behörighet att skapa en inbjudan i den här kanalen.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Den här communityn har nått sin gräns för inbjudningar.';

  @override
  String get groupDmCopyInviteFailed => 'Kunde inte kopiera inbjudningslänken';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Bara gruppens ägare kan hantera inbjudningar.';

  @override
  String get groupDmNoInvitesCreated => 'Inga inbjudningar skapade';

  @override
  String get groupDmLoadingInvites => 'Laddar inbjudningar...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Det gick inte att läsa in inbjudningar. Försök igen.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Återkalla den här inbjudan? Kan inte ångras.';

  @override
  String get groupDmInviteRevoked => 'Inbjudan återkallad';

  @override
  String get groupDmRemoveFromGroup => 'Ta bort från grupp';

  @override
  String groupDmRemoveFromGroupConfirm(String userName) {
    return 'Ta bort $userName från gruppen?';
  }

  @override
  String get groupDmRemoveFromGroupAction => 'Ta bort';

  @override
  String get groupDmRemovedFromGroup => 'Borttagen från grupp';

  @override
  String groupDmRemoveFromGroupFailed(String userName) {
    return '$userName är fortfarande kvar i gruppen. Försök igen om en stund.';
  }

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Skapad av $name. Går ut om $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Välkommen till $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Det här är början på $channelName.';
  }

  @override
  String get personalNotesComposerHint =>
      'Skicka ett meddelande till dig själv';

  @override
  String channelComposerHint(String channelName) {
    return 'Skicka meddelande i #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Skicka meddelande till @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Skicka meddelande i $groupName';
  }

  @override
  String get groupDmComposerHint => 'Meddelandegrupp';

  @override
  String get composerHint => 'Meddelande';

  @override
  String get composerOpenExpressionPicker => 'Öppna uttrycksväljaren';

  @override
  String get composerShowKeyboard => 'Visa tangentbord';

  @override
  String get composerCloseAttachmentPanel => 'Stäng bilageväljaren';

  @override
  String get chatAttachmentPanelPhotos => 'Bilder';

  @override
  String get chatAttachmentPanelFiles => 'Filer';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Åtkomst till fotobiblioteket krävs';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Tillåt åtkomst till fotobiblioteket för att bläddra och bifoga nya foton och videor.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Öppna inställningar';

  @override
  String get chatAttachmentLibraryLimitedBody =>
      'Här visas bara de foton och videor du har valt att dela.';

  @override
  String get chatAttachmentLibraryLimitedManage => 'Hantera';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => 'kvar, skickar';

  @override
  String get messageAccessibilityFailedSuffix => ', kunde inte skickas';

  @override
  String get messageAccessibilityAttachmentSummary => 'en bilaga';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count bilagor';
  }

  @override
  String get messageAccessibilityImageSummary => 'en bild';

  @override
  String get messageAccessibilityVideoSummary => 'en video';

  @override
  String get messageAccessibilityAudioSummary => 'en ljudfil';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'klistermärke $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'filen $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'en bifogad spoiler';

  @override
  String get messageAccessibilityEmbedSummary => 'en inbäddning';

  @override
  String get messageAccessibilityEmptySummary => 'ett meddelande';

  @override
  String get personalNotesPrivateSpace => 'Ditt privata utrymme';

  @override
  String get purgePersonalNotes => 'Rensa personliga anteckningar';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Detta kommer permanent att radera varje meddelande och bilaga i dina personliga anteckningar. Detta kan inte ångras.';

  @override
  String get purgePersonalNotesConfirmButton => 'Rensa';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Rensade $count meddelanden från personliga anteckningar';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Personliga anteckningar var redan tomma';

  @override
  String get purgePersonalNotesFailed =>
      'Kunde inte rensa personliga anteckningar';

  @override
  String get userSettingsGroupYourAccount => 'Ditt konto';

  @override
  String get userSettingsGroupBilling => 'Fakturering';

  @override
  String get userSettingsGroupApplication => 'Appen';

  @override
  String get userSettingsGroupDeveloper => 'Utvecklare';

  @override
  String get userSettingsGroupStaffOnly => 'Endast personal';

  @override
  String get userSettingsSearchPlaceholder => 'Sök i inställningar...';

  @override
  String get userSettingsSearchClear => 'Rensa sökning';

  @override
  String get userSettingsSearchNoResults => 'Inga inställningar hittades';

  @override
  String get userSettingsCopyLinkToSection => 'Kopiera länk till avsnittet';

  @override
  String get userSettingsCopyLinkToPage => 'Kopiera länk till sidan';

  @override
  String userSettingsJumpLinkPremiumPage(String productName) {
    return 'Sidan $productName';
  }

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Säkerhet och inloggning';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Presenter';

  @override
  String get giftSettingsClaimAccountTitle => 'Säkra ditt konto';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Hämta ditt konto för att lösa in eller hantera Plutonium-presentkoder.';

  @override
  String get giftSettingsRedeemTitle => 'Lös in en present';

  @override
  String get giftSettingsRedeemDescription =>
      'Ange en presentkod för att lösa in Plutonium för ditt konto.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Ange presentkod…';

  @override
  String get giftSettingsRedeemButton => 'Lös in';

  @override
  String get giftSettingsRedeemSuccess =>
      'Gåvan löstes in. Njut av ditt Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Köpta presenter';

  @override
  String get giftSettingsPurchasedDescription =>
      'Hantera dina köpta Plutonium-presentkoder. Dela present-URL:en med någon speciell eller lös in den själv!';

  @override
  String get giftSettingsEmptyTitle => 'Inga presenter än';

  @override
  String get giftSettingsEmptyDescription =>
      'Köp en Plutonium-present från Plutonium-fliken för att dela med vänner.';

  @override
  String get giftSettingsGoToPlutonium => 'Gå till Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'Kunde inte ladda presentlagret';

  @override
  String get giftSettingsLoadFailedDescription => 'Försök igen senare.';

  @override
  String get giftSettingsTryAgain => 'Försök igen';

  @override
  String get giftSettingsGiftUrl => 'Presentlänk';

  @override
  String get giftSettingsCopy => 'Kopiera';

  @override
  String get giftSettingsCopied => 'Kopierat';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Köpt $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Inlöst $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Inlöst av $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Den här presenten har lösts in';

  @override
  String get giftSettingsRedeemForYourself => 'Lös in själv';

  @override
  String get giftSettingsShareWithFriend => 'Dela med en vän';

  @override
  String get premiumPlutoniumTagline =>
      'Lås upp högre gränser och exklusiva funktioner samtidigt som du stöder en oberoende kommunikationsplattform.';

  @override
  String get premiumPurchaseMode => 'Köpläge';

  @override
  String get premiumForMe => 'För mig';

  @override
  String get premiumAsAGift => 'Som present';

  @override
  String get premiumMonthly => 'Månadsvis';

  @override
  String get premiumYearly => 'Årsvis';

  @override
  String get premiumPerMonth => 'per månad';

  @override
  String get premiumPerYear => 'per år';

  @override
  String get premiumOneTimePurchase => 'engångsköp';

  @override
  String get premiumSave17 => 'Spara 17 %';

  @override
  String get premiumUpgradeNow => 'Uppgradera nu';

  @override
  String get premiumBuyGift => 'Köp present';

  @override
  String get premiumOneYearGift => '1 års present';

  @override
  String get premiumOneMonthGift => '1 månads gåva';

  @override
  String get premiumScrollPrompt =>
      'Skrolla ner för att se alla förmåner som ingår i Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Gratis jämfört med Plutonium';

  @override
  String get premiumFreeColumn => 'Gratis';

  @override
  String get premiumGiftSectionTitle => 'Ge bort Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Dela Plutonium-upplevelsen med dina vänner genom att köpa en gåvoprenumeration.';

  @override
  String get premiumGiftBannerOne =>
      'Du har en ny presentkod som väntar på dig!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Du har $count nya presentkoder som väntar på dig!';
  }

  @override
  String get premiumViewGifts => 'Visa presenter';

  @override
  String get premiumReadyToUpgrade => 'Redo att uppgradera?';

  @override
  String get premiumReadyToBuyGift => 'Redo att köpa en present?';

  @override
  String get premiumManageSubscription => 'Hantera abonnemang';

  @override
  String get premiumRedeemGiftCode => 'Lös in presentkod';

  @override
  String get premiumGiftBadge => 'Present';

  @override
  String get premiumCancelSubscriptionTitle => 'Säga upp abonnemanget?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Du behåller dina förmåner till nästa förnyelsedatum och har sedan en respitperiod på 3 dagar för att teckna abonnemang igen och behålla din abonnemangshistorik.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Säg upp abonnemanget';

  @override
  String get premiumPurchaseHistoryTitle => 'Köphistorik';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Dina senaste fakturor. För att ändra betalningsmetod för din prenumeration, lägg till eller välj en i faktureringsportalen och gör den till standard.';

  @override
  String get premiumManagePaymentMethods => 'Hantera betalningsmetoder';

  @override
  String get premiumSelfServeRefundButton => 'Återbetala senaste köpet';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Genom att köpa godkänner du våra ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Genom att köpa godkände du våra ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' och ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktiv till $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Avbryter';

  @override
  String premiumCancelsOn(String date) {
    return 'Avbokas den $date. Förmånerna är aktiva fram till dess.';
  }

  @override
  String get premiumReactivateSubscription => 'Återaktivera';

  @override
  String premiumGiftedUntil(String date) {
    return 'Gåva till $date. Förnyas inte automatiskt.';
  }

  @override
  String get premiumGiftGraceEnded =>
      'Din gåvotid har tagit slut. Prenumerera för att behålla Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Du debiteras nu. Din återstående gåvotid läggs till efter din betalda period, så inget går förlorat.';

  @override
  String get premiumComparisonFeatureColumn => 'Funktion';

  @override
  String get premiumDisclaimerRefund =>
      'Du kan själv begära återbetalning inom 3 dagar efter betalning, en gång var 30:e dag. Återbetalning av ett abonnemang avslutar det. Köpare inom EU/EES avstår från ångerrätten på 14 dagar i kassan för att få tillgång till innehållet direkt. Använd återbetalningsknappen i appen i stället för att bestrida betalningen via banken. Kortreklamationer kan leda till permanenta begränsningar av ditt konto. Stripe hanterar betalningar säkert. Vi ser aldrig ditt fullständiga kortnummer.';

  @override
  String get premiumTermsOfService => 'Användarvillkor';

  @override
  String get premiumPrivacyPolicy => 'Integritetspolicy';

  @override
  String get premiumCheckoutStartFailedTitle => 'Kunde inte starta betalning';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Något gick fel när betalningen skulle startas. Försök igen om en stund.';

  @override
  String get premiumPlanUnavailable =>
      'Den här planen är inte tillgänglig. Kontakta supporten.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Den här planen är inte tillgänglig. Kontakta administratörerna för den här instansen.';

  @override
  String get premiumCompletePaymentTitle => 'Slutför betalning';

  @override
  String get premiumCompletePaymentBody =>
      'Du omdirigeras nu till Stripe för att slutföra betalningen. Återvänd till Fluxer när du är klar.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Välj betalningsmetod';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Betala med Pix automático för att godkänna återkommande debiteringar direkt från din brasilianska bank. Eller välj använd kort för att ange ett kreditkort på Stripes nästa skärm.';

  @override
  String get premiumUsePix => 'Använd Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Betala med UPI för att skapa ett RBI-kompatibelt e-mandat från din indiska bank. Eller välj använd kort för att ange ett kreditkort på Stripes nästa skärm.';

  @override
  String get premiumUseUpi => 'Använd UPI';

  @override
  String get premiumUseCard => 'Använd kort';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Kunde inte öppna faktureringsportalen';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Något gick fel när faktureringsportalen skulle öppnas. Försök igen om en liten stund.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Du är redan Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary ger redan permanent åtkomst, så ett återkommande abonnemang behövs inte. Du kan fortfarande köpa presenter till andra.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abonnemanget finns redan';

  @override
  String get premiumExistingSubscriptionBody =>
      'Vi hittade en befintlig Fluxer Plutonium-prenumeration för det här kontot. Hantera den i den säkra faktureringsportalen för att uppdatera betalningsuppgifter eller kontrollera förnyelsestatus. Om du precis betalade, vänta en minut och öppna sidan igen.';

  @override
  String get premiumPurchasesDisabledTitle => 'Köp är inte tillgängliga';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'Köp är inaktiverade för det här kontot. Kontakta $supportEmail om detta verkar fel.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'Köp är inaktiverade för det här kontot. Kontakta administratörerna för den här instansen om detta verkar fel.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Hämta ditt konto för att köpa Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Du behöver verifiera din e-postadress innan du kan köpa Fluxer Plutonium.';

  @override
  String get premiumPerkCommunities => 'Communities';

  @override
  String get premiumPerkMessageCharacterLimit => 'Teckengräns för meddelanden';

  @override
  String get premiumPerkBookmarkedMessages => 'Bokmärkta meddelanden';

  @override
  String get premiumPerkFileUploadSize => 'Filstorlek för uppladdning';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Använd animerade emojier';

  @override
  String get premiumPerkVideoQuality => 'Videokvalitet';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animerade avatarer och profilbanners';

  @override
  String get premiumPerkEarlyAccess => 'Tidig tillgång till nya funktioner';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Upp till 4K/60 fps';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly eller $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/mån';

  @override
  String get storePlutoniumYearSuffix => '/år';

  @override
  String get storePlutoniumPriceOr => 'eller';

  @override
  String get storePlutoniumEmojiTitle => 'Dina emojis, överallt';

  @override
  String get storePlutoniumEmojiBody =>
      'Ta med egna emojis och klistermärken från alla dina communities till varje chatt och community du är med i.';

  @override
  String get storePlutoniumProfileTitle => 'En profil som sticker ut';

  @override
  String get storePlutoniumProfileBody =>
      'Få en animerad avatar och banner, ett prenumerantmärke, den fyrsiffriga tagg du vill ha efter ditt användarnamn* och en separat profil för varje community.';

  @override
  String get storePlutoniumFilesTitle => 'Skicka filer upp till 500 MB';

  @override
  String get storePlutoniumFilesBody =>
      'Dela videor i full längd och stora filer utan att krympa dem först. Gratiskonton kan skicka upp till 25 MB.';

  @override
  String get storePlutoniumCompareTitle => 'Jämför Gratis och Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Alla dessa funktioner finns inte i mobilappen. Vissa är bara tillgängliga på datorn.';

  @override
  String get storePlutoniumNotAvailable => 'Inte tillgänglig';

  @override
  String get storePlutoniumAvailable => 'Tillgänglig';

  @override
  String get storePlutoniumCompareTag =>
      'Välj det fyrsiffriga numret efter ditt användarnamn*';

  @override
  String get storePlutoniumCompareProfile =>
      'En separat profil för varje community';

  @override
  String get storePlutoniumCompareBadge => 'Prenumerantmärke på din profil';

  @override
  String get storePlutoniumCompareBackgrounds => 'Videobakgrunder du kan spara';

  @override
  String get storePlutoniumCompareCommunities => 'Communities du kan gå med i';

  @override
  String get storePlutoniumCompareCharacters => 'Tecken i ett enda meddelande';

  @override
  String get storePlutoniumCompareBookmarks => 'Meddelanden du kan bokmärka';

  @override
  String get storePlutoniumCompareUpload => 'Största filen du kan ladda upp';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Medieobjekt du kan spara till senare';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Använd animerade emojis i meddelanden';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Använd egna emojis och klistermärken i alla communities';

  @override
  String get storePlutoniumCompareVideo =>
      'Kvalitet på videosamtal och skärmdelning';

  @override
  String get storePlutoniumCompareAvatar => 'Animerad avatar och profilbanner';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Tidig tillgång till nya funktioner';

  @override
  String get storePlutoniumCompareThemes => 'Anpassade teman för appen';

  @override
  String get storePlutoniumVideoFree => 'Upp till 720p i 30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => 'Upp till 4K i 60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      'Du kan bara välja en tagg som ingen annan med samma användarnamn redan har. Användarnamn är inte skiftlägeskänsliga, så Mina#4821 och mina#4821 räknas som samma. Taggen #0000 är reserverad för Fluxer Visionary-medlemmar.';

  @override
  String get storePlutoniumLearnVisionary => 'Läs mer om Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Vill du bara stödja Fluxers utveckling med öppen källkod? ';

  @override
  String get storePlutoniumDonateLink => 'Donera istället.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Genom att prenumerera finansierar du Fluxer och låser upp';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Anpassade emojis och klistermärken i alla chattar';

  @override
  String get storePlutoniumHighlightProfile =>
      'Animerad profil, märke och valfritt fyrsiffrigt nummer';

  @override
  String get storePlutoniumHighlightFiles => 'Uppladdningar upp till 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'Skicka meddelanden på upp till 4 000 tecken';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'En separat profil för varje community';

  @override
  String get storePlutoniumHighlightsMore => 'Och mer';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Förnyas automatiskt via Google Play tills du säger upp den.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Förnyas automatiskt via App Store tills du säger upp den.';

  @override
  String get storePlutoniumRestorePurchases => 'Återställ köp';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Du har redan en Fluxer Plutonium-prenumeration.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Spara $percent %';
  }

  @override
  String get storePlutoniumWaiting =>
      'Köpet har mottagits. Plutonium visas här när det har aktiverats.';

  @override
  String get storePlutoniumUnavailable =>
      'Prenumerationer i appen är inte tillgängliga på den här enheten än.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary ger redan permanent åtkomst, så en återkommande prenumeration behövs inte.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Sekretessinstrumentpanel';

  @override
  String get userSettingsNavAuthorizedApps => 'Auktoriserade appar';

  @override
  String get userSettingsNavBlockedUsers => 'Blockerade användare';

  @override
  String get userSettingsNavLinkedDevices => 'Länkade enheter';

  @override
  String get userSettingsNavConnections => 'Anslutningar';

  @override
  String get userSettingsNavLookAndFeel => 'Utseende';

  @override
  String get userSettingsNavAccessibility => 'Tillgänglighet';

  @override
  String get userSettingsNavChat => 'Chatt';

  @override
  String get userSettingsNavAudioAndVideo => 'Ljud och video';

  @override
  String get userSettingsNavShortcuts => 'Genvägar';

  @override
  String get audioAndVideoAudioSectionTitle => 'Ljud';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Konfigurera din mikrofon, högtalare och röstbehandling.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Konfigurera kvaliteten för din kamera och skärmdelning.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'Agerande i samtal';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Styr bekräftelsefrågor under röst- och videosamtal.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Indataenhet';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Utdataenhet';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Standard';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Använd högtalare';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'När den är avstängd spelas ljudet upp via öronsnäckan eller anslutna hörlurar.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Ingångsvolym';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Utvolym';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Röstbearbetning';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Fokuserat röstläge';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Rekommenderas. Rensar mikrofonsignalen för tydligt tal.';

  @override
  String get audioAndVideoDirectInputLabel => 'Direktinmatning';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Skickar ditt ljud oförändrat. Bäst om du använder extern ljudprogramvara.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Anpassad';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Justera varje inställning själv: brusreducering, ekoreducering och förstärkning.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Brusreducering';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Förbättrad';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Ingen';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Ekoeliminering';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatisk förstärkningsreglering';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Jämnar ut din mikrofonvolym. Avstängd när förbättrad brusreducering är på.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mikrofontest';

  @override
  String get audioAndVideoMicTestStartLabel => 'Starta mikrofontest';

  @override
  String get audioAndVideoMicTestStopLabel => 'Stoppa mikrofontest';

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Spegelvänd kamera';

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
      'Skärmdelningskvalitet';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Bildfrekvens';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 bildrutor/s';

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Den här instansen tillåter för närvarande skärmdelning upp till 720p vid 30 FPS.';

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Fråga inte när jag döljer min kamera';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Fråga inte när jag döljer min skärmdelning';

  @override
  String get userSettingsNavNotifications => 'Aviseringar';

  @override
  String get notificationsGeneralSectionTitle => 'Allmänt';

  @override
  String get notificationsEnableNotificationsLabel => 'Aktivera aviseringar';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Få aviseringar när du får meddelanden. Du kan behöva tillåta aviseringar för $productName i enhetens inställningar. För kontroll per kanal/community, öppna aviseringsinställningarna från en communitys meny.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Aktivera datoraviseringar';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Använder operativsystemets aviseringscenter. För inställningar per kanal eller community, högerklicka på en communityikon och öppna aviseringsinställningarna.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Tidsgräns för inaktivitet före pushaviseringar';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName undviker att skicka pushaviseringar till dina mobila enheter när du använder datorn. Välj hur länge du behöver vara inaktiv på datorn innan du får pushaviseringar.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minut';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minuter';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Inställningar för omnämnanden';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Inställningar för omnämnanden i svar';

  @override
  String get notificationsMentionNoPreferenceName => 'Ingen preferens';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respektera avsändarens avsikt, utan varning när de växlar @omnämnandet';

  @override
  String get notificationsMentionPreferMentionName => 'Föredra @-omnämnande';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Låt svar @-omnämna dig som standard och varna avsändaren om omnämnandet tas bort';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Föredra inget @-omnämnande';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Låt svar utelämna @-omnämnandet som standard och varna avsändaren om det läggs till';

  @override
  String get notificationsTtsSectionTitle => 'Text-till-tal-aviseringar';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Aktivera uppspelning av /tts-tal';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Låt /tts läsa upp ditt meddelande. Om du inaktiverar inställningen visas dessa kommandon som vanlig text.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Justera uppspelningshastighet i ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Tillgänglighet';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatisk uppläsning av meddelanden';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Konverterar inkommande innehåll till tal, oavsett om det kom från /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Alla kanaler';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Läs upp alla inkommande meddelanden, oavsett vilken kanal som är öppen.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Endast aktiv kanal';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Läser bara upp meddelanden i kanalen du tittar på. Uppläsningen följer dig mellan kanaler.';

  @override
  String get notificationsTtsModeNeverName => 'Aldrig automatiskt';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Förbli tyst om inte någon kör /tts manuellt.';

  @override
  String get notificationsTtsModeAriaLabel => 'Läs upp alla meddelanden';

  @override
  String get notificationsSoundsSectionTitle => 'Ljud';

  @override
  String get notificationsMasterVolumeLabel => 'Huvudvolym';

  @override
  String get notificationsMasterVolumeDescription =>
      'Ställer in nivån för alla ljudeffekter. Enskilda ljudinställningar åsidosätter detta.';

  @override
  String get notificationsResetToDefaultVolume => 'Återställ standardvolym';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Inaktivera alla aviseringsljud';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Dina befintliga inställningar för aviseringsljud kommer att behållas.';

  @override
  String get notificationsShowMoreSoundEffects => 'Visa fler ljudeffekter';

  @override
  String get notificationsShowFewerSoundEffects => 'Visa färre ljudeffekter';

  @override
  String get notificationsPreviewSound => 'Förhandsgranska ljud';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volym per ljud';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Ställ in anpassade volymer för enskilda ljud. Ljud utan en åsidosättning följer huvudvolymen.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktiva anpassningar av volymen för enskilda ljud: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Följer huvudinställning • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Återställ $label till huvudvolymen';
  }

  @override
  String get notificationsResetAllOverrides => 'Återställ alla åsidosättningar';

  @override
  String notificationsMuteSound(String label) {
    return 'Stäng av ljudet för $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Slå på ljudet för $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Aviseringar för communitymeddelanden';

  @override
  String get notificationsSoundDirectMessage =>
      'Aviseringar för direktmeddelanden';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Aviseringar för meddelanden i aktuell kanal';

  @override
  String get notificationsSoundMute => 'Stäng av mikrofonen';

  @override
  String get notificationsSoundUnmute => 'Slå på mikrofonen';

  @override
  String get notificationsSoundDeaf => 'Stäng av ljudet';

  @override
  String get notificationsSoundUndeaf => 'Slå på ljudet';

  @override
  String get notificationsSoundUserJoin => 'Användare går med i kanalen';

  @override
  String get notificationsSoundUserLeave => 'Användaren lämnar kanalen';

  @override
  String get notificationsSoundUserMove => 'Användaren flyttade kanal';

  @override
  String get notificationsSoundViewerJoin => 'Tittare ansluter till sändningen';

  @override
  String get notificationsSoundViewerLeave => 'Tittaren lämnar sändningen';

  @override
  String get notificationsSoundVoiceDisconnect => 'Röstsamtal avslutat';

  @override
  String get notificationsSoundIncomingRing => 'Inkommande samtal';

  @override
  String get notificationsSoundCameraOn => 'Kameran på';

  @override
  String get notificationsSoundCameraOff => 'Kameran avstängd';

  @override
  String get notificationsSoundScreenShareStart => 'Skärmdelning startar';

  @override
  String get notificationsSoundScreenShareStop => 'Skärmdelning stoppad';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Kunde inte uppdatera push-meddelandetidsgränsen. Försök igen.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Kunde inte uppdatera inställningen för omnämnanden. Försök igen.';

  @override
  String get notificationsPermissionDeniedTitle => 'Aviseringar blockerade';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Kunde inte aktivera aviseringar. Tillåt aviseringar för att fortsätta.';

  @override
  String get notificationsPushDeliveryProviderLabel => 'Pushleverantör';

  @override
  String get notificationsPushDeliveryDistributorLabel => 'Distributör';

  @override
  String get notificationsPushDeliveryDistributorNone => 'Inte vald';

  @override
  String get notificationsPushDeliveryDistributorSheetTitle =>
      'Välj distributör';

  @override
  String get notificationsPushDeliveryDistributorPickAccessibility =>
      'Byt pushdistributör';

  @override
  String get notificationsPushDeliveryGatewayLabel => 'Gateway';

  @override
  String get notificationsPushDeliveryRelayLabel => 'Fluxer Push-relä';

  @override
  String get notificationsPushDeliveryRelayInUse => 'Används';

  @override
  String get notificationsPushDeliveryRelayOff => 'Av';

  @override
  String get notificationsPushDeliveryRelayNotUsed => 'Används inte';

  @override
  String get notificationsPushRelaySectionTitle => 'Relä för pushaviseringar';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider levererar bara pushaviseringar via sin egen tjänst, så aviseringar till den här enheten går via Fluxers relä.';
  }

  @override
  String get notificationsPushRelayConsentLabel => 'Använd Fluxers pushrelä';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Om du stänger av det här tas enhetens pushregistrering bort, så enheten slutar ta emot pushaviseringar.';

  @override
  String get pushRelayConsentTitle => 'Relä för pushaviseringar';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider levererar bara pushaviseringar via sin egen tjänst, så aviseringar till den här enheten går via Fluxers relä.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Godkänn ';

  @override
  String get pushRelayConsentNoticeLink =>
      'integritetsmeddelandet för pushreläet';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' för att slå på pushaviseringar på den här enheten. Du behöver bara godkänna en gång per enhet.';

  @override
  String get pushRelayConsentAgree => 'Godkänn och fortsätt';

  @override
  String get pushRelayConsentDecline => 'Inte nu';

  @override
  String get userSettingsNavLanguageAndTime => 'Språk och tid';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Gränssnittspråk';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Välj det språk som används i hela appen';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Tidsformat';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Välj hur tider visas i appen';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Välj tidsformat';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automatisk';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-timmarsformat';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-timmarsformat';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Tidsformat för appens språk: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Systemets tidsformat: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Använd systemets språkinställning för tidsformat';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Kunde inte uppdatera tidsformat';

  @override
  String get userSettingsNavDefaultApps => 'Standardappar';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Webbläsare';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Välj vilken webbläsare som öppnas när du trycker på en länk.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Om en app är installerad för en webbplats öppnas länkar i den appen först.';

  @override
  String get defaultAppsWebBrowserInApp => 'Webbläsare i appen';

  @override
  String get defaultAppsWebBrowserExternal => 'Extern webbläsare';

  @override
  String get userSettingsNavAppIcon => 'Appikon';

  @override
  String get appIconSectionTitle => 'Appikon';

  @override
  String get appIconSectionDescription =>
      'Välj vilken ikon som visas på din hemskärm.';

  @override
  String get appIconSectionDescriptionAndroid =>
      'Välj vilken ikon som visas på hemskärmen. Appen startas om när du byter ikon.';

  @override
  String get appIconAndroidChangeTitle => 'Byta appikon?';

  @override
  String get appIconAndroidChangeDescription =>
      'Fluxer startas om för att använda den nya ikonen på hemskärmen.';

  @override
  String get appIconAndroidChangeConfirm => 'Ändra ikon';

  @override
  String get appIconOptionDefault => 'Standard';

  @override
  String get appIconOptionStarfield => 'Stjärnfält';

  @override
  String get appIconOptionSweden => 'Sverige';

  @override
  String get appIconOptionGreyscale => 'Gråskala';

  @override
  String get appIconOptionRainbow => 'Regnbåge';

  @override
  String get appIconOptionWaves => 'Vågor';

  @override
  String get appIconOptionChromaticAberration => 'Kromatisk aberration';

  @override
  String get appIconOptionDefaultBrutalist => 'Brutalistisk';

  @override
  String get appIconOptionGreyscaleBrutalist => 'Brutalistisk i gråskala';

  @override
  String get appIconUnsupported =>
      'Det går inte att ändra appikonen på den här enheten.';

  @override
  String get userSettingsNavAdvanced => 'Avancerat';

  @override
  String get advancedPerformanceReportingTitle => 'Prestandarapportering';

  @override
  String get advancedCrashReportingSectionDescription =>
      'Hjälp Fluxer att rätta buggar i appen genom att dela krasch- och prestandadata. Det här är avstängt som standard.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Skicka krasch- och prestandarapporter';

  @override
  String get advancedCrashReportingDescription =>
      'Rapporterna skickas till Fluxers felspårning, även när du är inloggad på en annan instans. De innehåller inga instansnamn, ID:n eller meddelandeinnehåll.';

  @override
  String get observabilityReportingConsentTitle =>
      'Hjälp oss att rätta krascher';

  @override
  String get observabilityReportingConsentSubtitle =>
      'Fluxer stängdes oväntat. Om du delar anonym krasch- och feldata kan vi rätta problem snabbare.';

  @override
  String get observabilityReportingConsentBody =>
      'Rapporterna innehåller kraschloggar, fel och grundläggande prestandadata. De delas inte med tredje part och du kan stänga av det här när som helst.';

  @override
  String observabilityReportingConsentEnableLater(String reportingToggle) {
    return 'Om du vill slå på det senare öppnar du Inställningar → Avancerat → $reportingToggle.';
  }

  @override
  String get observabilityReportingConsentAgree => 'Skicka kraschrapporter';

  @override
  String get observabilityReportingConsentDecline => 'Nej tack';

  @override
  String get advancedSettingsConfigure => 'Konfigurera';

  @override
  String get advancedSettingsCategoryPrivacy => 'Integritet';

  @override
  String get advancedSettingsCategoryAppearance => 'Utseende';

  @override
  String get advancedSettingsCategoryAccessibility => 'Tillgänglighet';

  @override
  String get advancedSettingsCategoryChat => 'Chatt';

  @override
  String get advancedSettingsCategoryMedia => 'Medier';

  @override
  String get advancedSettingsCategoryVoice => 'Röst';

  @override
  String get advancedSettingsCategoryDeveloper => 'Utvecklare';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Aktivera textmarkering';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Tillåt textmarkering i appen';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Aktivera videominiatyrbilder för snabbspolning';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatyrbild eller livevy medan videon spolas';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptisk feedback';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibrationsfeedback för tryckningar och åtgärder. Synkroniseras inte mellan enheter.';

  @override
  String get advancedSettingShowNekoLabel => 'Visa Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko-katt som jagar din muspekare';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Visa Neko vid din chattinmatning';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Splash-zoom-animation';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Zooma ut logotypen när du lämnar startsidan';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Tangentbordstips';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Visa kortkommandon i verktygstips';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Aktivera favoriter';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Visa favoriter i hela appen';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Beteende vid anslutning till röstkanal';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Bekräftelse eller dubbelklick för att ansluta till röstkanaler i communities';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Kräv dubbelklick för att ansluta till röstkanaler';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Bekräfta innan du går med i röstkanaler';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Skicka GIF:ar automatiskt när de väljs';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Skicka GIF:ar automatiskt från väljaren utan bekräftelse';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Spara GIF-favoriter i sparade medier';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Välj hur sparade GIF-favoriter lagras';

  @override
  String get advancedSettingMediaButtonsLabel => 'Medieknappar';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Anpassa vilka knappar och indikatorer som visas på mediebilagor och inbäddningar';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Ladda upp bilagor innan du skickar';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Börja ladda upp bilagor så snart de läggs till i meddelandefältet';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Ta bort spårningsparametrar från webbadresser';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Ta automatiskt bort spårningsparametrar från webbadresser i meddelanden du skickar';

  @override
  String get advancedSettingTrustAllLinksLabel => 'Lita på alla externa länkar';

  @override
  String get advancedSettingSearchEnginesLabel => 'Sökmotorer';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Konfigurera sökmotorer för markerad text';

  @override
  String get advancedSettingTranslatorsLabel => 'Översättare';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Konfigurera översättningsleverantörer för markerad text';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Omvänd bildsökning';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Leverantörer för omvänd bildsökning';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Åtgärdsfält för meddelanden';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Anpassa åtgärdsfältet som visas när du håller muspekaren över meddelanden';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Automatisk komplettering av uttryck';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Välj vad som visas när du skriver ett kolon i meddelandefältet';

  @override
  String get advancedSettingInputButtonsLabel =>
      'Knappar för meddelandeinmatning';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Välj vilka knappar som ska visas i meddelandeinmatningsfältet';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Skrolla till botten när ett meddelande skickas';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Välj hur chatten rullas när du skickar ett meddelande';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Hoppa över bekräftelse för \"Markera alla som lästa\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Markera alla olästa inkorgskanaler som lästa direkt, utan att fråga om bekräftelse';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Dölj tystade kanaler som standard';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Dölj kanaler du har tystat i sidofälten för communities';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Visa GIF-indikator';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Visa indikator för bilagors utgångsdatum';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Visa radera-knapp';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Visa nedladdningsknapp';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Visa favoritknapp';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Visa knapp för att dölja inbäddningar';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Visa åtgärdsfält för meddelanden';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'Visa bara mer-knappen';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Visa snabbreaktioner';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Aktivera Skift för att expandera';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Visa standardemojier i förslag för uttryck';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Visa anpassade emojier i förslag för uttryck';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Visa klistermärken i förslag för uttryck';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Visa sparade medier i automatisk komplettering av uttryck';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Visa GIF-knapp';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Visa medieknapp';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Visa klistermärkesknapp';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Visa emoji-knapp';

  @override
  String get advancedSettingShowSendButtonLabel => 'Visa skicka-knapp';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Visa aviseringar för nya enheter';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Fråga när nya ljudenheter upptäcks';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Volymkontroller för anslutning';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Visa volymreglage för deltagare per enhet i röstmenyer';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Beteende för skärmdelningsförhandsvisning';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Beteende för förhandsvisningar, fristående fönster och miniatyrbilder för sändningar';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Skärmdelnings-codec';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Videokodek för skärmdelning';

  @override
  String get advancedSettingScreenShareCodecAuto =>
      'Automatisk (rekommenderas)';

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
      'Pausa förhandsvisningen av min skärmdelning i bakgrunden';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Dölj förhandsvisningsbilden för min sändning';

  @override
  String get advancedSettingDeveloperModeLabel => 'Aktivera utvecklarläge';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Aktivera utvecklarläge';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Standardsökmotor';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Välj vilken sökmotor som ska användas som standard när du söker efter markerad text.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => 'Inbyggda sökmotorer';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Aktivera eller inaktivera inbyggda sökmotorer. Aktiverade sökmotorer visas i meddelandets snabbmeny när text är markerad.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Anpassade sökmotorer';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Lägg till egna sökmotorer med ett anpassat URL-mönster. Använd \'$query\' som platshållare för söktexten.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Lägg till sökmotor';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Aktivera minst en sökmotor nedan.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Ta bort sökmotor';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Standardöversättare';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Välj vilken översättare som ska användas som standard när du översätter markerad text.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Inbyggda översättare';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Aktivera eller inaktivera inbyggda översättare. Aktiverade översättare visas i meddelandets snabbmeny när text är markerad.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Anpassade översättare';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Lägg till egna översättare med ett anpassat URL-mönster. Använd \'$query\' som platshållare för texten som ska översättas.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Lägg till översättare';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Aktivera minst en översättare nedan.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Ta bort översättare';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Standard för omvänd bildsökning';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Välj vilken tjänst för omvänd bildsökning som ska användas som standard när du söker efter en bild.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Inbyggd omvänd bildsökning';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Aktivera eller inaktivera inbyggda leverantörer för omvänd bildsökning. Aktiverade leverantörer visas i snabbmenyn för bilder, avatarer, bannrar, klistermärken och emojier.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Anpassad omvänd bildsökning';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Lägg till egna leverantörer för omvänd bildsökning med ett anpassat URL-mönster. Använd \"$url\" som platshållare för bildens URL.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Lägg till omvänd bildsökning';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Aktivera minst en leverantör för omvänd bildsökning nedan.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Ta bort omvänd bildsökning';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Lägg till sökmotor';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Redigera sökmotor';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Lägg till översättningsleverantör';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Redigera översättningsleverantör';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Lägg till sökmotor för omvänd bildsökning';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Redigera sökmotor för omvänd bildsökning';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Namn';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL-mönster';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder => 'Min sökmotor';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Min översättare';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Min omvända bildsökning';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Använd \'$query\' där söktexten ska infogas.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Använd \'$query\' där texten som ska översättas ska infogas.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Använd \'$url\' där bildens URL ska infogas.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Namn krävs.';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'URL-mönster krävs.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL-mönstret måste innehålla platshållaren \"$query\".';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL-mönstret måste innehålla platshållaren \"$url\".';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL-mönstret måste vara en giltig URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Lägg till';

  @override
  String get advancedSettingEditSearchProviderAction => 'Redigera';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Ta bort';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Är du säker på att du vill ta bort $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Appar';

  @override
  String get userSettingsNavAppLogs => 'Apploggar';

  @override
  String get userSettingsNavDeveloperTools => 'Utvecklarverktyg';

  @override
  String get userSettingsNavLimitsConfig => 'Gränser konfiguration';

  @override
  String get userSettingsNavFeatureFlags => 'Funktionsflaggor';

  @override
  String get userSettingsNavWhatsNew => 'Nyheter';

  @override
  String get userSettingsJoinFluxerLabs => 'Gå med i Fluxer Labs';

  @override
  String get userSettingsGiveFeedback => 'Ge feedback';

  @override
  String get userSettingsNavAppLicenses => 'App-licenser';

  @override
  String get userSettingsAppLicensesDescription =>
      'Programvara med öppen källkod som används av den här appen. Den här appen är byggd med Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Kunde inte ladda applicenserna.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenser',
      one: '1 licens',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Logga ut';

  @override
  String get userSettingsLogOutConfirmTitle => 'Logga ut?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Du kan logga in igen när som helst.';

  @override
  String get quickSwitcherTabSearch => 'Sök';

  @override
  String get quickSwitcherTabFriends => 'Vänner';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Sök efter kanaler, personer eller communities';

  @override
  String get quickSwitcherSearchFriends => 'Sök vänner';

  @override
  String get quickSwitcherNoMatchesFound => 'Inga träffar';

  @override
  String get quickSwitcherEmptyHint =>
      'Prova ett annat namn eller använd prefixen @ / # / ! / * för att filtrera resultat.';

  @override
  String get quickSwitcherSectionPeople => 'Personer';

  @override
  String get quickSwitcherSectionGroupMessages => 'Gruppmeddelanden';

  @override
  String get quickSwitcherSectionTextChannels => 'Textkanaler';

  @override
  String get quickSwitcherSectionThreads => 'Trådar';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Röstkanaler';

  @override
  String get quickSwitcherSectionCommunities => 'Communities';

  @override
  String get quickSwitcherSectionSettings => 'Inställningar';

  @override
  String get quickSwitcherHomeLabel => 'Hem';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direktmeddelanden';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoriter';

  @override
  String get quickSwitcherUserSettingsLabel => 'Användarinställningar';

  @override
  String get quickSwitcherNotificationsLabel => 'Aviseringar';

  @override
  String get quickSwitcherBookmarksLabel => 'Bokmärken';

  @override
  String get savedMessagesEmptyTitle => 'Inga bokmärken';

  @override
  String get savedMessagesEmptyBody =>
      'Bokmärk meddelanden för att spara dem till senare.';

  @override
  String get savedMessagesEndBody => 'Här finns inget mer att se.';

  @override
  String get savedMessagesRemoveTooltip => 'Ta bort bokmärke';

  @override
  String get savedMessagesAddedToast => 'Tillagd i bokmärken';

  @override
  String get savedMessagesRemovedToast => 'Borttagen från bokmärken';

  @override
  String get quickSwitcherMentionsLabel => 'Omnämnanden';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Inga vänner än';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Lägg till en vän för att komma igång.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Inga vänner matchar sökningen';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Prova ett annat namn.';

  @override
  String get quickSwitcherSearchAliasUser => 'Användare';

  @override
  String get quickSwitcherSearchAliasYou => 'Du';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM';

  @override
  String get quickSwitcherSearchAliasMessages => 'Meddelanden';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Stjärnmärkta';

  @override
  String get quickSwitcherSearchAliasInbox => 'Inkorg';

  @override
  String get quickSwitcherSearchAliasSaved => 'Sparat';

  @override
  String get uiClose => 'Stäng';

  @override
  String get chatJumpToBottom => 'Hoppa till botten';

  @override
  String get chatUnreadDividerNew => 'Nytt';

  @override
  String get uiConfirm => 'Bekräfta';

  @override
  String get uiUnderstood => 'Jag förstår';

  @override
  String get uiLoading => 'Laddar';

  @override
  String get uiSearch => 'Sök';

  @override
  String get uiStartCall => 'Starta samtal';

  @override
  String get uiStartVideoCall => 'Starta videosamtal';

  @override
  String get uiPlay => 'Spela upp';

  @override
  String get uiPause => 'Pausa';

  @override
  String get uiDownload => 'Ladda ner';

  @override
  String get uiMoreActions => 'Fler åtgärder';

  @override
  String get uiUnsavedChanges => 'Osparade ändringar';

  @override
  String get uiReset => 'Återställ';

  @override
  String get uiOpenColorPicker => 'Öppna färgväljaren';

  @override
  String get uiSelectPlaceholder => 'Välj';

  @override
  String get uiSearchPlaceholder => 'Sök';

  @override
  String get uiNoOptionsFound => 'Inga alternativ hittades';

  @override
  String get uiDismissNotification => 'Stäng avisering';

  @override
  String get uiColorPickerTitle => 'Färgväljare';

  @override
  String get mentionConfirmTitle => 'Omnämna alla?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Detta kommer att meddela $count medlemmar. Fortsätt?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Detta kommer att meddela $count online-medlemmar. Fortsätt?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Detta kommer att meddela $count medlemmar med rollen $roleName. Fortsätta?';
  }

  @override
  String get mentionConfirmButton => 'Omnämn';

  @override
  String get composerEmojiUnavailable =>
      'Du kan inte använda den här emojin här.';

  @override
  String get instanceUrlLabel => 'Instans-URL';

  @override
  String get instanceUrlPlaceholder => 'Ange instans-URL (t.ex. fluxer.com)';

  @override
  String get instanceUrlHelper =>
      'Använd fluxer.com för den officiella instansen eller den exakta URL:en till en självhostad instans.';

  @override
  String get resetToDefaultInstance => 'Återställ till Fluxer';

  @override
  String get instanceConnect => 'Anslut';

  @override
  String get instanceConnecting => 'Ansluter…';

  @override
  String get instanceConnectFailed => 'Kunde inte ansluta till instansen';

  @override
  String instanceConnectFailedDomain(String domain) {
    return 'Kunde inte ansluta till $domain. Försök igen.';
  }

  @override
  String get instanceInvalidDiscoveryResponse =>
      'Det gick inte att läsa den här instansens konfiguration. Kontrollera adressen och försök igen.';

  @override
  String instanceOutdatedForClient(String domain) {
    return 'Den här instansen är för gammal för den här appen. Be den som driver $domain att uppdatera Fluxer.';
  }

  @override
  String instanceRequiresNewerClient(String domain) {
    return '$domain kör en nyare version av Fluxer än den här appen. Uppdatera appen och försök igen.';
  }

  @override
  String get instanceCompatibilityTitle =>
      'Den här instansen kan inte användas';

  @override
  String get instanceCompatibilityRetry => 'Försök igen';

  @override
  String get instanceCompatibilityUpdateApp => 'Uppdatera appen';

  @override
  String get instanceCompatibilityStatusPagePrompt =>
      'Se statussidan för uppdateringar.';

  @override
  String get instanceCompatibilityStatusPageLink => 'statussidan';

  @override
  String get recentInstances => 'Senaste instanser';

  @override
  String removeRecentInstance(String domain) {
    return 'Ta bort $domain från senaste instanser';
  }

  @override
  String get instanceSheetTitle => 'Anslut till instans';

  @override
  String get changeInstance => 'Ändra';

  @override
  String get instanceConnectionRequired =>
      'Anslut till instansen för att logga in';

  @override
  String get comingSoon => 'Kommer snart';

  @override
  String get guildNavbarDirectMessages => 'Direktmeddelanden';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Utforska communities';

  @override
  String get discoveryExplore => 'Utforska';

  @override
  String get discoveryExplorePublicCommunities =>
      'Utforska offentliga communities';

  @override
  String get discoveryListingSubheading =>
      'Vill du lista din community här? Ansök om du uppfyller kraven i din communitys inställningar > Utforska.';

  @override
  String get discoverySearchCommunities => 'Sök communities';

  @override
  String get discoveryFilterByLanguage => 'Filtrera efter språk';

  @override
  String get discoveryAllLanguages => 'Alla språk';

  @override
  String get discoveryAllCategories => 'Alla';

  @override
  String get discoveryCategoryGaming => 'Spel';

  @override
  String get discoveryCategoryMusic => 'Musik';

  @override
  String get discoveryCategoryEntertainment => 'Underhållning';

  @override
  String get discoveryCategoryEducation => 'Utbildning';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Vetenskap och teknik';

  @override
  String get discoveryCategoryContentCreator => 'Innehållsskapare';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime och manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmer och TV';

  @override
  String get discoveryCategoryOther => 'Annat';

  @override
  String get discoveryNoCommunitiesMatch => 'Inga communities matchar.';

  @override
  String get discoveryJoinCommunity => 'Gå med i communityn';

  @override
  String get discoveryJoined => 'Medlem';

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
      other: '$countString medlemmar',
      one: '1 medlem',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Ingen beskrivning.';

  @override
  String get discoveryCommunities => 'Communities';

  @override
  String get discoveryApps => 'Appar';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Kunde inte gå med i den här communityn';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Något gick fel. Försök igen om en liten stund.';

  @override
  String get discoveryJoinErrorFullTitle => 'Den här communityn är full';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Den här communityn har nått sin medlemsgräns, så du kan inte gå med just nu.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Du har nått gränsen för antal communities';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Du är med i maximalt antal communities. Lämna en och försök igen.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Du kan inte gå med i den här communityn';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Du har blivit bannlyst från den här communityn.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Den här communityn är inte längre tillgänglig';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Communityn kan ha lämnat Utforska eller slutat ta emot nya medlemmar. Uppdatera sidan så visas den inte längre.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Du går för snabbt';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Vänta en stund och försök igen.';

  @override
  String get guildNavbarAddCommunity => 'Lägg till en community';

  @override
  String get guildNavbarHelp => 'Hjälp';

  @override
  String get scrollIndicatorNew => 'Ny';

  @override
  String get scrollIndicatorNewMessages => 'Nya meddelanden';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Fäll ihop $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'vald';

  @override
  String get guildNavbarGuildUnread => 'oläst';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count notiser',
      one: '1 notis',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'tystad';

  @override
  String get authShowPassword => 'Visa lösenord';

  @override
  String get authHidePassword => 'Dölj lösenord';

  @override
  String get authCheckStillWorking => 'Fortfarande på gång…';

  @override
  String get authVerificationFailed =>
      'Kunde inte slutföra verifieringen. Försök igen.';

  @override
  String get chatLoadingMessages => 'Läser in meddelanden';

  @override
  String get friendsMessageFriend => 'Meddelande';

  @override
  String get friendsFriendActions => 'Vänåtgärder';

  @override
  String get friendsAcceptRequest => 'Acceptera vänförfrågan';

  @override
  String get friendsDeclineRequest => 'Neka vänförfrågan';

  @override
  String get friendsCancelRequest => 'Avbryt vänförfrågan';

  @override
  String get friendsOpenInbox => 'Inkorg';

  @override
  String get profileRemoveFriend => 'Ta bort vän';

  @override
  String get profileUnblockUser => 'Avblockera användare';

  @override
  String get profileAcceptFriendRequest => 'Acceptera vänförfrågan';

  @override
  String get profileCancelFriendRequest => 'Avbryt vänförfrågan';

  @override
  String get profileSendFriendRequest => 'Lägg till vän';

  @override
  String get accountOverflowMenu => 'Kontonalternativ';

  @override
  String get navHome => 'Hem';

  @override
  String get navNotifications => 'Aviseringar';

  @override
  String get navYou => 'Du';

  @override
  String get guildFolderSettingsTitle => 'Mappinställningar';

  @override
  String get guildFolderNameLabel => 'Mappnamn';

  @override
  String get guildFolderColorLabel => 'Mappfärg';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Visa ikon när listan är hopfälld';

  @override
  String get guildFolderIconLabel => 'Mappikon';

  @override
  String get guildFolderDelete => 'Ta bort mapp';

  @override
  String get guildFolderIconFolder => 'Mapp';

  @override
  String get guildFolderIconStar => 'Stjärna';

  @override
  String get guildFolderIconHeart => 'Hjärta';

  @override
  String get guildFolderIconBookmark => 'Bokmärk';

  @override
  String get guildFolderIconGameController => 'Spelkontroll';

  @override
  String get guildFolderIconShield => 'Sköld';

  @override
  String get guildFolderIconMusicNote => 'Musiknot';

  @override
  String get guildFolderMarkAsRead => 'Markera mapp som läst';

  @override
  String get guildBulkMuteCommunities => 'Tysta communities';

  @override
  String get guildBulkUnmuteCommunities => 'Sluta tysta communities';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Inställningar för communityaviseringar';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Sekretessinställningar för communityn';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Tillåt @everyone och @here';

  @override
  String get guildBulkAllowRoleMentions => 'Tillåt omnämnanden av roller';

  @override
  String get guildBulkEnableMobilePush => 'Aktivera pushaviseringar på mobilen';

  @override
  String get guildBulkDisableMobilePush =>
      'Inaktivera pushaviseringar på mobilen';

  @override
  String get guildBulkAllowDirectMessages => 'Tillåt direktmeddelanden';

  @override
  String get guildBulkBlockDirectMessages => 'Blockera direktmeddelanden';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Tillåt direktmeddelanden från botar';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Blockera direktmeddelanden från botar';

  @override
  String get guildNavbarGroupDm => 'Grupp-DM';

  @override
  String get guildNavbarCreateChannel => 'Skapa kanal';

  @override
  String get guildNavbarChannelType => 'Kanaltyp';

  @override
  String get guildNavbarTextChannel => 'Textkanal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Skicka meddelanden, bilder, GIF-ar och emojis';

  @override
  String get guildNavbarVoiceChannel => 'Röstkanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Häng med varandra med röst, video och skärmdelning';

  @override
  String get guildNavbarLinkChannel => 'Länkkanal';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Snabbåtkomst till en extern webbplats eller resurs';

  @override
  String get guildNavbarNameLabel => 'Namn';

  @override
  String get guildNavbarNewChannelHint => 'ny-kanal';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://exempel.se';

  @override
  String get guildNavbarChannelTypeSelection => 'Välj kanaltyp';

  @override
  String get guildNavbarPrivateChannel => 'Privat kanal';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Endast utvalda medlemmar och roller kommer att kunna se den här kanalen.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Lägg till medlemmar eller roller';

  @override
  String get guildNavbarAddMembersOrRolesHint =>
      'Sök efter medlemmar eller roller';

  @override
  String get guildNavbarCreateCategory => 'Skapa kategori';

  @override
  String get guildNavbarNewCategoryHint => 'Ny kategori';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Bjud in vänner till $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Mottagare kommer att tas till #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Sök vänner';

  @override
  String get guildNavbarNoFriendsYet => 'Inga vänner än';

  @override
  String get guildNavbarNoResults => 'Inga resultat';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Eller skicka en inbjudningslänk till en vän:';

  @override
  String get guildNavbarInviteLink => 'Inbjudningslänk';

  @override
  String get guildNavbarCopy => 'Kopiera';

  @override
  String get guildNavbarCopied => 'Kopierat!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Din inbjudningslänk går ut om 7 dagar.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Den här inbjudningslänken upphör aldrig att gälla.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Din inbjudningslänk går ut om $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Redigera inbjudningslänk';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Inställningar för inbjudningslänk';

  @override
  String get guildNavbarExpireAfter => 'Upphör efter';

  @override
  String get guildNavbarMaxUses => 'Max antal användningar';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Ge tillfälligt medlemskap';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Medlemmar tas bort när de blir inaktiva om inte en roll tilldelas';

  @override
  String get guildNavbarCreateNewLink => 'Skapa ny länk';

  @override
  String get guildNavbarSent => 'Skickat';

  @override
  String get guildNavbarInvite => 'Bjud in';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Lämna community';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Är du säker på att du vill lämna den här communityn? Du kommer inte längre att kunna se några meddelanden.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Lämna community';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Ta bort dina meddelanden i den här communityn?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Ta permanent bort alla meddelanden du har skickat här, i alla kanaler. Kan inte ångras.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Ta bort mina meddelanden';

  @override
  String get guildNavbarDeletedYourMessages =>
      'Dina meddelanden har tagits bort';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Kunde inte radera dina meddelanden';

  @override
  String get guildNavbarRemoveOverride => 'Ta bort åsidosättning';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Tystad till $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Endast tillgängligt för $productName-personal';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Inbjudningar är för närvarande pausade i den här communityn';

  @override
  String get guildNavbarDurationNever => 'aldrig';

  @override
  String get guildNavbarDuration30Minutes => '30 minuter';

  @override
  String get guildNavbarDuration1Hour => '1 timme';

  @override
  String get guildNavbarDuration6Hours => '6 timmar';

  @override
  String get guildNavbarDuration12Hours => '12 timmar';

  @override
  String get guildNavbarDuration1Day => '1 dag';

  @override
  String get guildNavbarDuration7Days => '7 dagar';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekunder';
  }

  @override
  String get guildNavbarNever => 'Aldrig';

  @override
  String get guildNavbarNoLimit => 'Ingen gräns';

  @override
  String get guildNavbarOneUse => '1 användning';

  @override
  String guildNavbarUses(int count) {
    return '$count användningar';
  }

  @override
  String get guildMenuMarkAsRead => 'Markera som läst';

  @override
  String get guildMenuInviteMembers => 'Bjud in medlemmar';

  @override
  String get guildMenuCommunitySettings => 'Communityinställningar';

  @override
  String get guildMenuEditCommunityProfile => 'Redigera communityprofil';

  @override
  String get guildMenuUnmuteCommunity => 'Sluta tysta communityn';

  @override
  String get guildMenuMuteCommunity => 'Tysta community';

  @override
  String get guildMenuHideMutedChannels => 'Dölj tystade kanaler';

  @override
  String get guildMenuDebugCommunity => 'Felsök community';

  @override
  String get guildMenuCopyCommunityId => 'Kopiera community-ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Till $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Allmänt';

  @override
  String get guildMenuSettingsRoles => 'Roller & behörigheter';

  @override
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Klistermärken';

  @override
  String get guildMenuSettingsSafetyModeration => 'Säkerhet & moderering';

  @override
  String get guildMenuSettingsActivityLog => 'Aktivitetslogg';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsDiscovery => 'Utforska';

  @override
  String get guildMenuSettingsMembers => 'Medlemmar';

  @override
  String get guildMenuSettingsInviteLinks => 'Inbjudningar';

  @override
  String get guildMenuSettingsBans => 'Bannlysningar';

  @override
  String get guildMenuSettingsChannels => 'Kanaler';

  @override
  String get guildSettingsNoPermission =>
      'Du har inte behörighet att visa den här inställningsfliken.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikon';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewNameTitle => 'Namn';

  @override
  String get guildSettingsOverviewNameHint => 'Min fantastiska community';

  @override
  String get guildSettingsCreateRole => 'Skapa roll';

  @override
  String get guildSettingsRolesListTitle => 'Roller';

  @override
  String get guildSettingsRolesNewRole => 'Ny roll';

  @override
  String get guildSettingsRolesDeleteRole => 'Ta bort roll';

  @override
  String get guildSettingsRolesBackToRoles => 'Tillbaka till roller';

  @override
  String get guildSettingsBackToSettings => 'Tillbaka till inställningar';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Redigera \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Konfigurera rollinställningar och behörigheter';

  @override
  String get guildSettingsRolesDisplaySection => 'Visa';

  @override
  String get guildSettingsRolesRoleName => 'Rollnamn';

  @override
  String get guildSettingsRolesRoleColor => 'Rollfärg';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Skriv en färg (hex, rgb(), hsl() eller namn) eller använd färgväljaren.';

  @override
  String get guildSettingsRolesShowSeparately => 'Visa den här rollen separat';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Visar medlemmar med den här rollen i ett eget avsnitt i medlemslistan.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Tillåt omnämnanden för den här rollen';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Med behörigheten \"$permission\" kan medlemmar alltid omnämna roller, oavsett den här inställningen.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Använd den här knappen för att snabbt rensa alla behörigheter.';

  @override
  String get guildSettingsRolesClearPermissions => 'Rensa behörigheter';

  @override
  String get guildSettingsRolesPermissionsSection => 'Behörigheter';

  @override
  String get guildSettingsRolesSearchPermissions => 'Sök behörigheter';

  @override
  String get guildSettingsRolesDenseLayout => 'Kompakt layout';

  @override
  String get guildSettingsRolesComfyLayout => 'Rymlig layout';

  @override
  String get guildSettingsRolesSingleColumn => 'En kolumn';

  @override
  String get guildSettingsRolesTwoColumns => 'Två kolumner';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Inga behörigheter hittades';

  @override
  String get guildSettingsRolesHoistOrder => 'Visningsordning';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Återställ till standard';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Dra roller för att anpassa ordningen de visas i medlemslistan.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Inga roller visas separat. Aktivera ”Visa den här rollen separat” för en roll för att se den här.';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Du behöver behörigheten \"$permission\" för att redigera dessa behörigheter';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Du kan inte redigera en roll som är på samma nivå eller högre än din egen högsta roll';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Du kan inte ge en behörighet du inte har';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Du kan inte ta bort den här behörigheten eftersom du då skulle ta bort den från dig själv';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Roller uppdaterade';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Roll skapad';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rollen har tagits bort';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Visningsordningen har återställts till standard';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Rollnamn krävs';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Ge rollen ett namn innan du sparar.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Kunde inte skapa roll';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Kunde inte uppdatera roller';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Kunde inte ta bort rollen';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '”$name” kunde inte tas bort. Försök igen.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Kunde inte återställa visningsordningen';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Försök igen om en liten stund.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Är du säker på att du vill ta bort rollen $name? Alla medlemmar som har den här rollen kommer inte längre att ha den.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Hela communityn';

  @override
  String get permissionCategoryMessagesMedia => 'Meddelanden och medier';

  @override
  String get permissionCategoryModeration => 'Moderering';

  @override
  String get permissionCategoryChannelAccess => 'Kanalåtkomst';

  @override
  String get permissionCategoryChannelManagement => 'Kanalhantering';

  @override
  String get permissionCategoryAudioVideo => 'Ljud och video';

  @override
  String get permissionAdministrator => 'Administratör';

  @override
  String get permissionAdministratorDescription =>
      'Ger alla behörigheter och kringgår kanalbegränsningar. Mycket känsligt.';

  @override
  String get permissionViewActivityLog => 'Visa aktivitetslogg';

  @override
  String get permissionViewActivityLogDescription =>
      'Läs communityns aktivitetslogg med ändringar och modereringsåtgärder.';

  @override
  String get permissionManageCommunity => 'Hantera community';

  @override
  String get permissionManageCommunityDescription =>
      'Redigera globala inställningar som namn, beskrivning och ikon.';

  @override
  String get permissionManageRoles => 'Hantera roller';

  @override
  String get permissionManageRolesDescription =>
      'Skapa, redigera eller ta bort roller under din högsta roll. Tillåter även ändringar som åsidosätter kanalbehörigheter.';

  @override
  String get permissionManageChannels => 'Hantera kanaler';

  @override
  String get permissionManageChannel => 'Hantera kanal';

  @override
  String get permissionManageChannelDescription =>
      'Byt namn på och redigera kanalens inställningar.';

  @override
  String get permissionManagePermissions => 'Hantera behörigheter';

  @override
  String get permissionManagePermissionsDescription =>
      'Redigera åsidosättningar för roller och medlemmar i den här kanalen.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Skapa, redigera eller ta bort webhooks för den här kanalen.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Se medlemslistan för den här kanalen.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Hantera inbjudningslänkar för den här kanalen.';

  @override
  String get permissionOverwriteDeny => 'Neka';

  @override
  String get permissionOverwriteInherit => 'Neutral (ärver)';

  @override
  String get permissionOverwriteAllow => 'Tillåt';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Använd de här knapparna för att snabbt ställa in alla behörigheter.';

  @override
  String get permissionManageChannelsDescription =>
      'Skapa, redigera eller ta bort kanaler och kategorier.';

  @override
  String get permissionKickMembers => 'Sparka ut medlemmar';

  @override
  String get permissionBanMembers => 'Bannlys medlemmar';

  @override
  String get permissionCreateInviteLinks => 'Skapa inbjudningslänkar';

  @override
  String get permissionChangeOwnNickname => 'Ändra eget smeknamn';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Uppdatera ditt eget smeknamn.';

  @override
  String get permissionManageNicknames => 'Hantera smeknamn';

  @override
  String get permissionManageNicknamesDescription =>
      'Ändra andra medlemmars smeknamn.';

  @override
  String get permissionCreateEmojiStickers => 'Skapa emojier och klistermärken';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Ladda upp nya emojier och klistermärken och hantera dina egna skapelser.';

  @override
  String get permissionManageEmojiStickers =>
      'Hantera emojier och klistermärken';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Redigera eller ta bort emojier och klistermärken som skapats av andra medlemmar.';

  @override
  String get permissionManageWebhooks => 'Hantera webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Skapa, redigera eller ta bort webhooks.';

  @override
  String get permissionSendMessages => 'Skicka meddelanden';

  @override
  String get permissionSendTtsMessages => 'Skicka TTS-meddelanden';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Skicka meddelanden med text till tal.';

  @override
  String get permissionManageMessages => 'Hantera meddelanden';

  @override
  String get permissionManageMessagesDescription =>
      'Ta bort andra medlemmars meddelanden. Behörigheten att fästa meddelanden styrs separat.';

  @override
  String get permissionPinMessages => 'Fäst meddelanden';

  @override
  String get permissionEmbedLinks => 'Bädda in länkar';

  @override
  String get permissionAttachFiles => 'Bifoga filer';

  @override
  String get permissionMentionEveryone => 'Använd @everyone/@here och @roll';

  @override
  String get permissionMentionEveryoneDescription =>
      'Nämn alla eller en roll (även om rollen inte är inställd som nämnbar).';

  @override
  String get permissionUseExternalEmoji => 'Använd externa emojier';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Använd emojier från andra communities.';

  @override
  String get permissionUseExternalStickers => 'Använd externa klistermärken';

  @override
  String get permissionAddReactions => 'Lägg till reaktioner';

  @override
  String get permissionAddReactionsDescription =>
      'Lägg till nya reaktioner på meddelanden.';

  @override
  String get permissionBypassSlowmode => 'Kringgå långsamt läge';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorera meddelandebegränsningar per kanal.';

  @override
  String get permissionTimeOutMembers => 'Ge medlemmar timeout';

  @override
  String get permissionTimeOutMembersDescription =>
      'Hindrar medlemmar från att skicka meddelanden, reagera och delta i röstsamtal under en viss tid.';

  @override
  String get permissionViewChannel => 'Visa kanal';

  @override
  String get permissionViewChannelMembers => 'Visa kanalmedlemmar';

  @override
  String get permissionViewChannelMembersDescription =>
      'Se medlemslistan för kanaler i den här communityn.';

  @override
  String get permissionConnect => 'Anslut';

  @override
  String get permissionSpeak => 'Tala';

  @override
  String get permissionStreamVideo => 'Sänd video';

  @override
  String get permissionUseVoiceActivity => 'Använd röstaktivering';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Utan den här behörigheten krävs tryck för att prata.';

  @override
  String get permissionPrioritySpeaker => 'Prioriterad talare';

  @override
  String get permissionMuteMembers => 'Tysta medlemmar';

  @override
  String get permissionDeafenMembers => 'Stäng av medlemmars ljud';

  @override
  String get permissionMoveMembers => 'Flytta medlemmar';

  @override
  String get permissionMoveMembersDescription =>
      'Dra medlemmar mellan kanaler de kan komma åt.';

  @override
  String get permissionSetVoiceRegion => 'Ange röstregion';

  @override
  String get permissionManageThreads => 'Hantera trådar';

  @override
  String get permissionManageThreadsDescription =>
      'Byt namn på, arkivera, lås och ta bort trådar, ställ in långsamt läge för dem och se privata trådar.';

  @override
  String get permissionCreatePublicThreads => 'Skapa offentliga trådar';

  @override
  String get permissionCreatePublicThreadsDescription =>
      'Starta trådar som alla som kan se kanalen kan se.';

  @override
  String get permissionCreatePrivateThreads => 'Skapa privata trådar';

  @override
  String get permissionCreatePrivateThreadsDescription =>
      'Starta trådar som bara inbjudna kan gå med i.';

  @override
  String get permissionSendMessagesInThreads => 'Skicka meddelanden i trådar';

  @override
  String get permissionSendMessagesInThreadsDescription =>
      'Skicka meddelanden i trådar och foruminlägg.';

  @override
  String get threadErrorArchived => 'Den här tråden är arkiverad.';

  @override
  String get threadErrorLocked =>
      'Den här tråden är låst. Bara moderatorer kan skriva i den eller öppna den igen.';

  @override
  String get threadErrorAlreadyCreated =>
      'Det finns redan en tråd för det här meddelandet.';

  @override
  String get threadErrorMaxActiveThreads =>
      'Den här communityn har nått sin gräns för aktiva trådar.';

  @override
  String get threadErrorMaxMembers =>
      'Den här tråden har nått sin medlemsgräns.';

  @override
  String get threadErrorMaxPinnedPosts =>
      'Bara ett inlägg kan fästas i det här forumet.';

  @override
  String get threadErrorMaxForumTags => 'Ett forum kan ha högst 20 taggar.';

  @override
  String get threadErrorTagNamesUnique => 'Taggnamn måste vara unika.';

  @override
  String get threadErrorNoTagsForEveryone =>
      'Lägg till en tagg som alla kan använda innan du kräver taggar.';

  @override
  String get threadErrorTagRequired =>
      'Välj minst en tagg för det här inlägget.';

  @override
  String get threadErrorUnknownTag =>
      'En av de valda taggarna finns inte längre.';

  @override
  String get threadErrorInvalidNotificationSettings =>
      'De aviseringsinställningarna är inte giltiga för en tråd.';

  @override
  String get threadErrorSearchIndexNotReady =>
      'Inläggen indexeras fortfarande. Försök igen om en stund.';

  @override
  String get threadErrorInvalidChannelType =>
      'Den här åtgärden är inte tillgänglig i den här kanalen.';

  @override
  String get threadCreate => 'Skapa tråd';

  @override
  String get threadName => 'Trådnamn';

  @override
  String get threadNameRequired => 'Ge tråden ett namn.';

  @override
  String get threadNewThreadPlaceholder => 'Ny tråd';

  @override
  String get threadPrivate => 'Privat tråd';

  @override
  String get threadPrivateDescription =>
      'Endast personer du bjuder in och moderatorer kan se den här tråden.';

  @override
  String get threadStarterMessage => 'Meddelande';

  @override
  String get threadStarterMessagePlaceholder =>
      'Skriv ett meddelande för att starta konversationen!';

  @override
  String threadCreateCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Du kan starta en ny tråd om $seconds sekunder.',
      one: 'Du kan starta en ny tråd om 1 sekund.',
    );
    return '$_temp0';
  }

  @override
  String threadCreateFailed(String detail) {
    return 'Kunde inte starta tråden: $detail';
  }

  @override
  String get threadBrowserTitle => 'Trådar';

  @override
  String get threadBrowserActive => 'Aktiva';

  @override
  String get threadBrowserArchived => 'Stängda';

  @override
  String get threadBrowserJoined => 'Gått med';

  @override
  String get threadBrowserOtherActive => 'Andra aktiva trådar';

  @override
  String get threadBrowserPublic => 'Offentliga trådar';

  @override
  String get threadBrowserPrivate => 'Privata trådar';

  @override
  String get threadBrowserEmpty =>
      'Det finns inga trådar. Håll fokus på en konversation med en tråd, en tillfällig textkanal.';

  @override
  String get threadBrowserArchivedEmpty => 'Det finns inga stängda trådar.';

  @override
  String get threadBrowserLoadMore => 'Ladda fler';

  @override
  String get threadBrowserSearch => 'Sök i trådar';

  @override
  String get threadBrowserSearchEmpty => 'Inga trådar matchar';

  @override
  String get threadBrowserSearchEmptyHint =>
      'Prova ett annat namn eller kolla den andra fliken.';

  @override
  String get threadBrowserSearchFailed =>
      'Kunde inte söka i trådar. Försök igen senare.';

  @override
  String get threadBrowserSearchIndexing =>
      'Sökningen förbereds för den här communityn. Försöker igen strax…';

  @override
  String threadMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count meddelanden',
      one: '1 meddelande',
    );
    return '$_temp0';
  }

  @override
  String get threadFailedToMentionSomeRoles =>
      'Vissa nämnda roller lades inte till i den här tråden.';

  @override
  String get threadMembers => 'Trådens medlemmar';

  @override
  String threadMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medlemmar',
      one: '1 medlem',
    );
    return '$_temp0';
  }

  @override
  String get threadMembersEmpty => 'Ingen har gått med i den här tråden än.';

  @override
  String threadRemoveMember(String name) {
    return 'Ta bort $name från tråden';
  }

  @override
  String get threadJoin => 'Gå med i tråden';

  @override
  String get threadLeave => 'Lämna tråden';

  @override
  String get threadJoinNotice =>
      'Gå med i den här tråden för att följa den i din kanallista och få aviseringar.';

  @override
  String get threadArchivedNotice =>
      'Den här tråden är stängd. Om du skickar ett meddelande öppnas den igen.';

  @override
  String get threadLockedNotice =>
      'Den här tråden är låst. Endast moderatorer kan skicka meddelanden.';

  @override
  String get threadArchive => 'Stäng tråd';

  @override
  String get threadUnarchive => 'Öppna tråden igen';

  @override
  String get threadLock => 'Lås tråd';

  @override
  String get threadUnlock => 'Lås upp tråd';

  @override
  String get threadDelete => 'Ta bort tråd';

  @override
  String threadDeleteConfirm(String threadName) {
    return 'Är du säker på att du vill ta bort $threadName? Det går inte att ångra.';
  }

  @override
  String get threadDeleted => 'Tråd borttagen';

  @override
  String get threadMarkAsRead => 'Markera som läst';

  @override
  String get threadMute => 'Tysta tråden';

  @override
  String get threadUnmute => 'Sluta tysta tråden';

  @override
  String get threadMuted => 'Tråden tystad';

  @override
  String get threadUnmuted => 'Tråden är inte längre tystad';

  @override
  String get threadNotificationSettings => 'Aviseringsinställningar';

  @override
  String get threadNotificationParentDefault => 'Använd kanalens standard';

  @override
  String get threadCopyLink => 'Kopiera länk';

  @override
  String get threadCopyId => 'Kopiera trådens ID';

  @override
  String get threadMoreOptions => 'Fler alternativ';

  @override
  String get threadSettings => 'Trådinställningar';

  @override
  String get threadSettingsSaved => 'Trådinställningarna har sparats';

  @override
  String get threadAutoArchive => 'Dölj efter inaktivitet';

  @override
  String get threadAutoArchiveDescription =>
      'Tråden slutar visas i kanallistan efter så här lång tid utan aktivitet.';

  @override
  String get threadDefaultAutoArchive => 'Dölj efter inaktivitet (standard)';

  @override
  String get threadDefaultAutoArchiveDescription =>
      'Nya trådar slutar visas i kanallistan efter så här lång tid utan aktivitet.';

  @override
  String get threadDefaultSlowmode => 'Standard för långsamt läge i trådar';

  @override
  String get threadAutoArchiveOneHour => '1 timme';

  @override
  String get threadAutoArchiveOneDay => '24 timmar';

  @override
  String get threadAutoArchiveThreeDays => '3 dagar';

  @override
  String get threadAutoArchiveOneWeek => '1 vecka';

  @override
  String get threadInvitable => 'Tillåt vem som helst att bjuda in';

  @override
  String get threadInvitableDescription =>
      'Medlemmar i den här privata tråden kan lägga till andra personer.';

  @override
  String threadStartedBy(String name) {
    return 'Startad av $name';
  }

  @override
  String get threadStarterDeleted =>
      'Det ursprungliga meddelandet har tagits bort.';

  @override
  String systemThreadCreated(
    String username,
    String threadLink,
    String allThreadsLink,
  ) {
    return '$username startade en tråd: $threadLink. Se $allThreadsLink.';
  }

  @override
  String get systemThreadCreatedAllThreadsLink => 'alla trådar';

  @override
  String get systemThreadCreatedThreadFallback => 'en tråd';

  @override
  String systemPreviewThreadCreated(String username) {
    return '$username startade en tråd.';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Inga anpassade emojis än.';

  @override
  String get guildSettingsStickersEmpty => 'Inga anpassade stickers än.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Medlemsverifiering';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Välj vad medlemmar måste ha innan de kan skriva inlägg eller skicka direktmeddelanden till communitymedlemmar.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Medlemmar med roller kan kringgå dessa kontroller. För offentliga utrymmen rekommenderar vi att du aktiverar verifiering.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Communities som listas i Utforska måste kräva minst e-postverifiering. Du kan inte välja ”Ingen” medan din community listas i Utforska.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Vuxet innehåll och innehållsvarningar';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigurera märkning av moget innehåll och valfria innehållsvarningar för medlemmar.';

  @override
  String get guildSettingsModerationMatureToggle => 'Vuxet innehåll';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Markera denna community som innehållande moget innehåll.';

  @override
  String get guildSettingsVerificationNone => 'Ingen';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Ingen verifiering krävs.';

  @override
  String get guildSettingsVerificationLow => 'Låg';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Kräver en verifierad e-postadress.';

  @override
  String get guildSettingsVerificationMedium => 'Medel';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Kräver en verifierad e-postadress och ett konto som är minst 5 minuter gammalt.';

  @override
  String get guildSettingsVerificationHigh => 'Hög';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Kräver allt på nivån ”Medel” samt att du har varit medlem i communityn i minst 10 minuter.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Spåra moderatoråtgärder i hela communityn.';

  @override
  String get guildSettingsAuditLogEmpty => 'Inga loggar än';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderatoråtgärder och ändringar i communityn visas här.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Alla användare';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Alla åtgärder';

  @override
  String get guildSettingsAuditLogNoReason => 'Ingen anledning angavs.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Okänd användare';

  @override
  String get guildSettingsAuditLogReason => 'Anledning';

  @override
  String get guildSettingsAuditLogSomeone => 'någon';

  @override
  String get guildSettingsAuditLogSomething => 'något';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'okänd enhet';

  @override
  String get guildSettingsAuditLogNothing => 'ingenting';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Okänd måltavla';

  @override
  String get auditLogActionGuildUpdate => 'Communityn uppdaterad';

  @override
  String get auditLogActionChannelCreate => 'Kanal skapad';

  @override
  String get auditLogActionChannelUpdate => 'Kanalen uppdaterades';

  @override
  String get auditLogActionChannelDelete => 'Kanalen raderad';

  @override
  String get auditLogActionThreadCreate => 'Tråd skapad';

  @override
  String get auditLogActionThreadUpdate => 'Tråd uppdaterad';

  @override
  String get auditLogActionThreadDelete => 'Tråd borttagen';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Kanalbehörighet tillagd';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanalbehörighet uppdaterad';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanalbehörighet borttagen';

  @override
  String get auditLogActionMemberKick => 'Medlem utsparkad';

  @override
  String get auditLogActionMemberPrune => 'Medlemmar rensade';

  @override
  String get auditLogActionMemberBanAdd => 'Medlem bannlyst';

  @override
  String get auditLogActionMemberBanRemove => 'Medlemmens bannlysning hävd';

  @override
  String get auditLogActionMemberUpdate => 'Medlem uppdaterad';

  @override
  String get auditLogActionMemberRoleUpdate => 'Medlemsroller uppdaterade';

  @override
  String get auditLogActionMemberMove => 'Medlem flyttad';

  @override
  String get auditLogActionMemberDisconnect => 'Medlem frånkopplad';

  @override
  String get auditLogActionBotAdd => 'Bot tillagd';

  @override
  String get auditLogActionRoleCreate => 'Roll skapad';

  @override
  String get auditLogActionRoleUpdate => 'Roll uppdaterad';

  @override
  String get auditLogActionRoleDelete => 'Roll borttagen';

  @override
  String get auditLogActionInviteCreate => 'Inbjudan skapad';

  @override
  String get auditLogActionInviteUpdate => 'Inbjudan uppdaterad';

  @override
  String get auditLogActionInviteDelete => 'Inbjudan borttagen';

  @override
  String get auditLogActionWebhookCreate => 'Webhook skapad';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook uppdaterad';

  @override
  String get auditLogActionWebhookDelete => 'Webhook borttagen';

  @override
  String get auditLogActionEmojiCreate => 'Emoji skapad';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji uppdaterad';

  @override
  String get auditLogActionEmojiDelete => 'Emoji borttagen';

  @override
  String get auditLogActionStickerCreate => 'Klistermärke skapat';

  @override
  String get auditLogActionStickerUpdate => 'Klistermärke uppdaterat';

  @override
  String get auditLogActionStickerDelete => 'Klistermärke borttaget';

  @override
  String get auditLogActionMessageDelete => 'Meddelande borttaget';

  @override
  String get auditLogActionMessageBulkDelete => 'Meddelanden raderade';

  @override
  String get auditLogActionMessagePin => 'Meddelande fäst';

  @override
  String get auditLogActionMessageUnpin => 'Meddelandet lossat';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor uppdaterade community-inställningarna.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor skapade kanalen $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor uppdaterade kanalen $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor raderade kanalen $target.';
  }

  @override
  String auditLogSummaryThreadCreate(String actor, String target) {
    return '$actor startade tråden $target.';
  }

  @override
  String auditLogSummaryThreadUpdate(String actor, String target) {
    return '$actor uppdaterade tråden $target.';
  }

  @override
  String auditLogSummaryThreadDelete(String actor, String target) {
    return '$actor tog bort tråden $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor lade till kanalbehörigheter för $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor lade till kanalbehörigheter för $target i $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor uppdaterade kanalbehörigheter för $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor uppdaterade kanalbehörigheter för $target i $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor tog bort kanalbehörigheter för $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor tog bort kanalbehörigheter för $target i $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor sparkade $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor bannlyste $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor avbannlyste $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor uppdaterade $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor uppdaterade roller för $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor rensade inaktiva medlemmar.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor rensade medlemmar inaktiva i $days dagar.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor flyttade $target till en annan röstkanal.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor flyttade $target till $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor kopplade bort $target från röst.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor lade till boten $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor skapade rollen $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor uppdaterade rollen $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor raderade rollen $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor skapade inbjudan $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor skapade inbjudan $target för $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor uppdaterade inbjudan $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor uppdaterade inbjudan $target för $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor raderade inbjudan $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor raderade inbjudan $target för $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor skapade webhooken $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor uppdaterade webhooken $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor raderade webhooken $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor lade till emojin $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor uppdaterade emojin $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor tog bort emojin $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor lade till klistermärket $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor uppdaterade klistermärket $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor tog bort klistermärket $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor tog bort ett meddelande.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor tog bort ett meddelande i $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor tog bort flera meddelanden.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor tog bort $count meddelanden.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor tog bort flera meddelanden i $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor tog bort $count meddelanden i $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor fäste ett meddelande.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor fäste ett meddelande i $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor tog bort fästningen från ett meddelande.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor tog bort fästningen från ett meddelande i $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor utförde en granskningsåtgärd på $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Uppdaterade $field från $oldValue till $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Ställde in $field till $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Rensade $field (var $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Uppdaterade $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Bytte namn på communityn till $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Uppdaterade communityikonen.';

  @override
  String get auditLogChangePausedInvites => 'Pausade inbjudningar.';

  @override
  String get auditLogChangeResumedInvites => 'Återupptog inbjudningar.';

  @override
  String get auditLogChangeTurnedOnDetachedBanner =>
      'Aktiverade den fristående bannern.';

  @override
  String get auditLogChangeTurnedOffDetachedBanner =>
      'Inaktiverade den fristående bannern.';

  @override
  String get auditLogChangeAllowedFlexibleChannelNames =>
      'Tillät flexibla textkanalnamn.';

  @override
  String get auditLogChangeDisallowedFlexibleChannelNames =>
      'Slutade tillåta flexibla textkanalnamn.';

  @override
  String get auditLogChangeHidOwnerCrown => 'Dolde communityägarens krona.';

  @override
  String get auditLogChangeShowedOwnerCrown =>
      'Slutade dölja communityägarens krona.';

  @override
  String get auditLogChangeAllowedEmojiCloning =>
      'Tillät andra att klona den här communityns emojier.';

  @override
  String get auditLogChangeStoppedEmojiCloning =>
      'Slutade tillåta andra att klona den här communityns emojier.';

  @override
  String get auditLogChangeAllowedStickerCloning =>
      'Tillät andra att klona den här communityns klistermärken.';

  @override
  String get auditLogChangeStoppedStickerCloning =>
      'Slutade tillåta andra att klona den här communityns klistermärken.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Bytte namn på kanalen till $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Rensade ämnet.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Uppdaterade ämnet till $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Aktiverade moget innehåll.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Inaktiverade moget innehåll.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Ställde in smeknamn till $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Tog bort smeknamnet $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Tystade medlemmen.';

  @override
  String get auditLogChangeUnmutedMember =>
      'Avslutade tystnaden för medlemmen.';

  @override
  String get auditLogChangeDeafenedMember => 'Stängde av ljudet för medlemmen.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Återställde ljudet för medlemmen.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Lade till $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Tog bort $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Meddelande: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Inbjuden av $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tog bort $count meddelanden.',
      one: 'Tog bort $count meddelande.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tog bort $count medlemmar.',
      one: 'Tog bort $count medlem.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Den här inbjudan går aldrig ut.';

  @override
  String get auditLogOptionTemporaryMembership => 'Ger temporärt medlemskap.';

  @override
  String get auditLogOptionPermanentMembership => 'Ger permanent medlemskap.';

  @override
  String get guildSettingsWebhooksDescription =>
      'Visa och hantera alla webhooks som konfigurerats för din community.';

  @override
  String get guildSettingsWebhooksEmpty => 'Inga webhooks';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Den här communityn har inga webhooks än. Gå till $channelSettingsPath för att skapa en.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Du behöver behörigheten \"$permission\" för att se och redigera webhooks för den här communityn.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Det gick inte att läsa in webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Ett fel uppstod vid inläsning av webhooks. Försök igen.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks uppdaterade';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Kunde inte uppdatera webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Okänd kanal';

  @override
  String get guildSettingsCopiedUrl => 'URL kopierad till urklipp';

  @override
  String get guildSettingsDiscoveryDescription =>
      'Lista din community i Utforska så att andra kan hitta och gå med.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Inte tillräckligt många medlemmar';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count medlemmar',
      one: '$count medlem',
    );
    return 'Din community behöver minst $_temp0 innan den kan listas i Utforska.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Väntande';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Godkänd';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Avvisad';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Borttagen';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Anledning: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Din community listas i Utforska. Du kan uppdatera listningens uppgifter nedan eller dra tillbaka den för att ta bort listningen.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Din ansökan väntar på granskning. Du kan fortfarande uppdatera listningens uppgifter eller dra tillbaka ansökan.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategori';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Välj den kategori som bäst beskriver din community. Du kan ändra detta när som helst.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primärt språk';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Språket som de flesta i din community talar. Det används för att filtrera resultat i Utforska.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beskrivning';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Beskriv vad din community handlar om';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'En beskrivning krävs.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Beskrivningen måste vara minst $minLength tecken.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Beskrivningen får vara högst $maxLength tecken.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Anpassade taggar';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Upp till $maxTags taggar hjälper andra att hitta din community. De visas när någon söker i Utforska.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Lägg till en tagg och tryck på Retur';

  @override
  String get guildSettingsDiscoveryAddTag => 'Lägg till';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Ta bort taggen $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Kunde inte lägga till tagg';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Taggar måste vara 2 till $maxLength tecken långa och alfanumeriska.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Du kan bara lägga till upp till $maxTags taggar.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Tillämpa';

  @override
  String get guildSettingsDiscoverySave => 'Spara';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Dra tillbaka';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Ansökan till Utforska skickad';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Listningen i Utforska uppdaterad';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Ansökan till Utforska återkallad';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Kunde inte dra tillbaka ansökan';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Försök igen om en liten stund.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Sök efter användarnamn eller ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count medlemmar';
  }

  @override
  String get guildMembersRecentTitle => 'Nya medlemmar';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Visar $displayedCount av $totalCount medlemmar totalt';
  }

  @override
  String get guildMembersSort => 'Sortera';

  @override
  String get guildSettingsMembersSortNewest => 'Nyast först';

  @override
  String get guildMembersSortOldest => 'Äldst först';

  @override
  String get guildMembersColumnName => 'Namn';

  @override
  String get guildMembersColumnMemberSince => 'Medlem sedan';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Gick med i $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Anslutningsmetod';

  @override
  String get guildMembersColumnRoles => 'Roller';

  @override
  String get guildMembersFilterMemberSince =>
      'Filtrera efter när medlemmen gick med';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrera efter när kontot skapades';

  @override
  String get guildMembersFilterJoinMethod => 'Filtrera efter hur de gick med';

  @override
  String get guildMembersFilterRoles => 'Filtrera efter roller';

  @override
  String get guildMembersFilterAll => 'Alla';

  @override
  String get guildMembersFilterPast1Hour => 'Senaste timmen';

  @override
  String get guildMembersFilterPast24Hours => 'Senaste 24 timmarna';

  @override
  String get guildMembersFilterPast7Days => 'Senaste 7 dagarna';

  @override
  String get guildMembersFilterPast2Weeks => 'Senaste 2 veckorna';

  @override
  String get guildMembersFilterPast3Weeks => 'Senaste 3 veckorna';

  @override
  String get guildMembersFilterPast4Weeks => 'Senaste 4 veckorna';

  @override
  String get guildMembersFilterPast3Months => 'Senaste 3 månaderna';

  @override
  String get guildMembersFilterCustomRange => 'Anpassat intervall...';

  @override
  String get guildMembersDateRangeTitle => 'Anpassat datumintervall';

  @override
  String get guildMembersDateAfter => 'Efter datum';

  @override
  String get guildMembersDateBefore => 'Före datum';

  @override
  String get guildMembersClearAll => 'Rensa alla';

  @override
  String get guildMembersRowsPerPage => 'Rader per sida';

  @override
  String get guildMembersEmptySearch => 'Ingen matchar sökningen.';

  @override
  String get guildMembersLoadError =>
      'Något gick fel när medlemmarna skulle laddas. Försök igen senare.';

  @override
  String get guildMembersIndexing => 'Indexerar medlemmar…';

  @override
  String get guildMembersJoinSourceCreator => 'Skapare av communityn';

  @override
  String get guildMembersJoinSourceInvite => 'Bjud in';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Bjud in ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Bjuden av $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Anpassad URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Bjud in bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Plattformsadministratör';

  @override
  String get guildMembersJoinSourceDiscovery => 'Utforska';

  @override
  String get guildMembersJoinMethodUnknown => 'Okänt';

  @override
  String get guildMembersCommunityOwner => 'Communityägare';

  @override
  String get guildMembersViewAllRoles => 'Visa alla roller';

  @override
  String get guildMembersJoinedJustNow => 'Nyss';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuter sedan',
      one: '1 minut sedan',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count timmar sedan',
      one: '1 timme sedan',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Medlemmar';

  @override
  String get guildSettingsInvitesTitle => 'Inbjudningar';

  @override
  String get guildSettingsInvitesDescription =>
      'Visa alla inbjudningar för den här communityn. Gå till en kanal och använd inbjudningsknappen för att skapa en ny inbjudan.';

  @override
  String get guildSettingsInvitesEmpty => 'Inga inbjudningslänkar';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Den här communityn har inga inbjudningslänkar än. Gå till en kanal och skapa en inbjudan för att bjuda in personer.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Kunde inte läsa in inbjudningar';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Det gick inte att läsa in inbjudningarna. Försök igen.';

  @override
  String get guildSettingsInvitesTryAgain => 'Försök igen';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Visa skapandedatum istället för utgångsdatum';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pausa inbjudningar';

  @override
  String get guildSettingsInvitesEnableInvites => 'Aktivera inbjudningar';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pausa inbjudningar för den här communityn';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Aktivera inbjudningar för den här communityn';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pausa inbjudningar? Nya användare kan inte gå med via inbjudningslänkar förrän du aktiverar dem igen. Befintliga medlemmar påverkas inte.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Aktivera inbjudningar? Användare kan då gå med i den här communityn via inbjudningslänkar igen.';

  @override
  String get guildSettingsInvitesPause => 'Pausa';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Inbjudningar är pausade för den här communityn.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Inbjudningar är pausade eftersom $productName upptäckte en potentiell räd. Nya användare kan inte gå med just nu.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Inbjudare:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kod:';

  @override
  String get guildSettingsInvitesLabelUses => 'Användningar:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Skapad:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Upphör:';

  @override
  String get guildSettingsInvitesUnknown => 'Okänt';

  @override
  String get guildSettingsInvitesNoCategory => 'Ingen kategori';

  @override
  String get guildSettingsInvitesExpired => 'Utgånget';

  @override
  String get guildSettingsInvitesNever => 'Aldrig';

  @override
  String get guildSettingsInvitesCopyLink => 'Kopiera inbjudningslänk';

  @override
  String get guildSettingsInvitesRevoke => 'Återkalla inbjudan';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Kunde inte återkalla inbjudan';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Länken kan fortfarande fungera. Försök igen om en liten stund.';

  @override
  String get guildSettingsBansDescription =>
      'Visa och hantera bannlysta användare.';

  @override
  String get guildSettingsBansSearchHint => 'Sök bland bannlysningar';

  @override
  String get guildSettingsBansEmpty => 'Inga bannlysta användare.';

  @override
  String get guildSettingsBanExpiresLabel => 'Upphör';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Inga bannlysningar matchar din sökning.';

  @override
  String get guildSettingsBanDetailsTitle => 'Information om bannlysningen';

  @override
  String get guildSettingsBanViewDetails => 'Visa detaljer';

  @override
  String get guildSettingsBannedOn => 'Bannlyst den';

  @override
  String get guildSettingsBannedBy => 'Bannlyst av';

  @override
  String get guildSettingsRevokeBanTitle => 'Häv bannlysning';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Är du säker på att du vill återkalla bannlysningen för $displayName? De kommer att kunna återansluta till communityn.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Återkallade bannlysningen för $displayName';
  }

  @override
  String get guildSettingsCommunitySettings => 'Communityinställningar';

  @override
  String get guildSettingsDeleteCommunity => 'Ta bort community';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Är du säker på att du vill ta bort den här communityn? Det går inte att ångra. Alla kanaler, meddelanden och inställningar tas bort permanent.';

  @override
  String get guildSettingsCommunityDeleted => 'Communityn har tagits bort';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Det gick inte att ta bort den här communityn';

  @override
  String get guildSettingsCategoryExpressions => 'Uttryck';

  @override
  String get guildSettingsCategoryCommunity => 'Community';

  @override
  String get guildSettingsCategoryIntegrations => 'Integrationer';

  @override
  String get guildSettingsCategoryPeople => 'Personer';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Varumärke';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Uppdatera din ikon, namn, banner och inbjudningsbakgrund';

  @override
  String get guildSettingsOverviewBannerUpload => 'Ladda upp banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Inställningar för inaktivitet';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfigurera AFK-kanal och tidsgräns';

  @override
  String get guildSettingsOverviewSystemTitle =>
      'System och välkomstmeddelande';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Välj destination för system- och välkomstmeddelanden';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Standardaviseringar';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Communities med fler än 250 personer måste använda inställningen ”endast omnämnanden”. Din ursprungliga inställning sparas och återställs om communityn får färre än 250 medlemmar.';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Tillåt flexibla textkanalnamn';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Dölj communityägarens krona';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Fristående banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Visar bannern i ett eget avsnitt under communityns sidhuvud.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Ladda upp ikon';

  @override
  String get guildSettingsOverviewRemoveImage => 'Ta bort';

  @override
  String get guildSettingsOverviewSplashTitle => 'Inbjudningsbakgrund';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Bakgrund för chattinbäddningar';

  @override
  String get guildSettingsOverviewUploadBackground => 'Ladda upp bakgrund';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Ingen communitybanner';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Ingen inbjudningsbakgrund';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Förhandsgranska';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Se hur din inbjudan ser ut för besökare.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Textkanalnamn';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Communityägarkrona';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigurera om kronikonen visas bredvid communityägaren';

  @override
  String get guildSettingsSplashCardAlignment => 'Kortjustering';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centrera';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Vänster';

  @override
  String get guildSettingsSplashAlignmentRight => 'Höger';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Gäller endast på breda skärmar.';

  @override
  String get permissionReadMessageHistory => 'Läs meddelandehistorik';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Ändra vad användare utan \"$permission\" kan se';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Använd en dedikerad modal för att ställa in ett datum för meddelandehistorikgränsen för medlemmar som inte har behörigheten $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Öppna inställningen för meddelandehistorikens gränsdatum';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Gränsdatum för meddelandehistorik';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Aktivera gränsdatum för meddelandehistorik';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Gränsdatum';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Medlemmar utan Läs meddelandehistorik kan se meddelanden som skickats efter detta datum.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Gränsdatumet för meddelandehistorik uppdaterat';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Tillåt stora bokstäver och mellanslag i textkanalnamn. När inställningen är avstängd tillåts bara små bokstäver, bindestreck och understreck.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Döljer kronikonen bredvid communityägaren på alla ytor.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animerade ikoner kräver communityfunktionen Animerad ikon.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animerade banners kräver communityfunktionen Animerad banner.';

  @override
  String get guildSettingsAfkChannel => 'AFK-/inaktivitetskanal';

  @override
  String get guildSettingsAfkChannelHint =>
      'Flytta medlemmar till den här kanalen när de är AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Ingen AFK-kanal';

  @override
  String get guildSettingsAfkTimeout => 'AFK-timeout';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minut';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minuter';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minuter';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minuter';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 timme';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekunder';
  }

  @override
  String get guildSettingsSystemChannel => 'Målkanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Välkomst- och systemmeddelanden visas här.';

  @override
  String get guildSettingsNoSystemChannel => 'Ingen systemkanal';

  @override
  String get guildSettingsHideJoinMessages =>
      'Dölj meddelanden om att någon har gått med';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Döljer anslutningsmeddelanden i destinationskanalen.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Standardinställningar för aviseringar';

  @override
  String get guildSettingsNotificationsAll => 'Alla meddelanden';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Meddela om alla meddelanden';

  @override
  String get guildSettingsNotificationsMentions => 'Endast omnämnanden';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Meddela endast om omnämnanden';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Minimum: 960×540px (16:9). Visas i inbjudningsinbäddningar i chatt.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Innehållsfiltrering';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Granska automatiskt meddelanden efter sexuellt explicit innehåll i kanaler som inte är markerade för vuxet innehåll.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Communities som listas i Utforska måste granska meddelanden från alla medlemmar. Du kan inte ändra den här inställningen medan din community listas i Utforska.';

  @override
  String get guildSettingsContentFilterOff => 'Av';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Låt communityn självmoderera';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Filtrera medlemmar utan roller';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Föreslås för de flesta communities';

  @override
  String get guildSettingsContentFilterAll => 'Filtrera alla';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximalt skydd för familjevänliga utrymmen';

  @override
  String get guildSettingsContentWarningToggle => 'Visa en innehållsvarning';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Aktiverar en samtyckesprompt innan du går in i någon kanal.';

  @override
  String get guildSettingsContentWarningText => 'Anpassad varningstext';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Detta innehåller känsligt innehåll.';

  @override
  String get guildSettingsModeration2faTitle => 'Krav på 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Moderatorer behöver inte tvåfaktorsautentisering för att bannlysa, sparka, tidsbegränsa eller ta bort meddelanden.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Kräv 2FA för moderatoråtgärder';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Aktivera 2FA på ditt konto för att ändra den här inställningen';

  @override
  String get guildSettingsEmojiSearchHint => 'Sök bland emojier';

  @override
  String get guildSettingsEmojiUploadTitle => 'Ladda upp emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Emojiplatser';

  @override
  String get guildSettingsEmojiDropZone => 'Dra och släpp emoji-filer här';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Det gick inte att läsa in emojier. Försök igen senare.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Inga emojier matchar din sökning.';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Du har nått det maximala antalet emojier. Ta bort några befintliga emojier för att göra plats.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emojinamn måste innehålla minst 2 tecken och får innehålla bokstäver, siffror och understreck. Emojier måste vara mindre än $maxSize. Statiska bilder skalas till 128x128 pixlar och komprimeras automatiskt. Animerade emojier och SVG-filer måste redan vara inom gränsen.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Vissa emojier kunde inte läggas till';

  @override
  String get guildSettingsEmojiRenameTitle => 'Byt namn på emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 tecken, bokstäver, siffror, understreck.';

  @override
  String get guildSettingsEmojiColumnName => 'Namn';

  @override
  String get guildSettingsEmojiColumnUploader => 'Uppladdad av';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Ta bort emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Ta bort :$name:? Kan inte ångras.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Rensa bort den här emojin från lagring och CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Emojinamnet måste vara minst 2 tecken långt';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Emojinamnet får vara högst 32 tecken långt';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Ogiltigt emojinamn';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Kunde inte byta namn på den här emojin';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Kunde inte ta bort den här emojin';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Tillåt andra att klona dina emojier';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'När den är aktiverad kan medlemmar i andra communityn använda genvägen \"Klona\" med ett klick i appen för dina anpassade emojier. Detta hindrar dem inte från att spara bilden och ladda upp den själva.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Tillåt andra att klona dina dekaler';

  @override
  String get guildSettingsCloneStickerDescription =>
      'När den är aktiverad kan medlemmar i andra communityn använda genvägen \"Klona\" med ett klick i appen för dina anpassade dekaler. Detta hindrar dem inte från att spara bilden och ladda upp den själva.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Endast medlemmar med behörigheten \"$permission\" kan ändra detta.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Kunde inte uppdatera kloning av emoji';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Kunde inte uppdatera kloning av klistermärken';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Icke-animerad emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animerad emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Sök bland klistermärken';

  @override
  String get guildSettingsStickerSlotsTitle => 'Klistermärkesplatser';

  @override
  String get guildSettingsStickerUploadTitle => 'Ladda upp klistermärke';

  @override
  String get guildSettingsStickerDropZone =>
      'Dra och släpp en klistermärkesfil här (en i taget)';

  @override
  String get guildSettingsStickerDensity => 'Täthet för klistermärken';

  @override
  String get guildSettingsStickerDensityCozy => 'Mysigt';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompakt';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Kunde inte läsa in klistermärken';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Ett fel uppstod vid inläsning av klistermärkena. Försök igen.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Inga klistermärken matchar din sökning.';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Du har nått det maximala antalet klistermärken. Ta bort några befintliga klistermärken för att göra plats.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Klistermärken sparas i 320x320 pixlar och måste vara mindre än $maxSize. Statiska bilder skalas och komprimeras automatiskt. Animerade klistermärken och SVG-filer måste redan vara inom gränsen.';
  }

  @override
  String get guildSettingsStickerAddTitle => 'Lägg till klistermärke';

  @override
  String get guildSettingsStickerEditTitle => 'Redigera klistermärke';

  @override
  String get guildSettingsStickerNameLabel => 'Namn';

  @override
  String get guildSettingsStickerNameHint => 'Mitt snygga klistermärke';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Beskrivning';

  @override
  String get guildSettingsStickerDescriptionHint => 'Beskriv klistermärket';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Taggar ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Lägg till en tagg';

  @override
  String get guildSettingsStickerTagAdd => 'Lägg till';

  @override
  String get guildSettingsStickerNameRequired => 'Namn krävs';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Namnet måste vara minst 2 tecken långt';

  @override
  String get guildSettingsStickerNameTooLong => 'Namnet får vara max 30 tecken';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Beskrivningen får vara max 500 tecken';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Kunde inte skapa det här klistermärket';

  @override
  String get guildSettingsStickerDeleteTitle => 'Ta bort klistermärke';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Ta bort \"$name\"? Kan inte ångras.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Rensa bort det här klistermärket från lagring och CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Kunde inte ta bort den här etiketten';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'För att skapa en webhook, öppna $channelSettingsPath. Du kan fortfarande redigera och organisera alla befintliga webhooks här.';
  }

  @override
  String get guildSettingsBannedUsersTitle => 'Bannlysta användare';

  @override
  String get guildSettingsInvitesTableInviter => 'Inbjudare';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Kod';

  @override
  String get guildSettingsInvitesTableUses => 'Användningar';

  @override
  String get guildSettingsInvitesTableCreated => 'Skapad';

  @override
  String get guildSettingsInvitesTableExpires => 'Upphör';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrera efter användare';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrera efter åtgärd';

  @override
  String get createDm => 'Skapa DM';

  @override
  String get createGroupDm => 'Skapa grupp-DM';

  @override
  String get createDmNewMessage => 'Nytt meddelande';

  @override
  String get createDmSelectFriends => 'Välj vänner';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Välj vänner att skicka meddelanden till.';

  @override
  String get createDmSearchFriends => 'Sök vänner';

  @override
  String get createDmNoFriendsFound => 'Inga vänner hittades';

  @override
  String get createDmNoFriendsYet => 'Du har inga vänner än';

  @override
  String get createDmClaimToStartDms =>
      'Säkra ditt konto för att starta DM-konversationer.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifiera din e-postadress för att starta DM-konversationer.';

  @override
  String get createDmVerifyYourEmail => 'Verifiera din e-postadress';

  @override
  String get createDmNewGroup => 'Ny grupp';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Skapa en ny grupp med $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Bekräfta ny grupp';

  @override
  String get createDmCreateNewGroup => 'Skapa ny grupp';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Ta bort $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Du har redan en grupp med de här användarna. Vill du verkligen skapa en ny? Det går också bra!';

  @override
  String get createDmNoActivityYet => 'Ingen aktivitet än';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Vissa användare kan inte läggas till';

  @override
  String get createDmCreateWithoutThem => 'Skapa utan dem';

  @override
  String get createDmUnaddableIntro =>
      'Följande personer kan inte läggas till i den här grupp-DM-konversationen:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Skapa gruppmeddelandet med de återstående $count mottagarna och hoppa över resten?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Inga återstående mottagare att skapa en grupp-DM-konversation med.';

  @override
  String get createDmUnaddableUserNotFound => 'Användaren hittades inte';

  @override
  String get createDmUnaddableBlocked =>
      'Du kan inte skicka meddelanden till den här användaren';

  @override
  String get createDmUnaddableNotFriends => 'Inte på din vänlista';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Tillåter inte att läggas till i grupp-DM';

  @override
  String get dmListMessagesTitle => 'Meddelanden';

  @override
  String get dmListDirectMessagesTitle => 'Direktmeddelanden';

  @override
  String get keybindsSearchShortcuts => 'Sök genvägar';

  @override
  String get keybindSectionDefaults => 'Standard';

  @override
  String get keybindSectionMessages => 'Meddelanden';

  @override
  String get keybindSectionNavigation => 'Navigering';

  @override
  String get keybindSectionDragAndDrop => 'Dra och släpp';

  @override
  String get keybindSectionChat => 'Chatt';

  @override
  String get keybindSectionVoiceAndVideo => 'Ljud och video';

  @override
  String get keybindSectionMisc => 'Diverse';

  @override
  String get keybindActionShowShortcutsList => 'Visa lista över kortkommandon';

  @override
  String get keybindActionCopyText => 'Kopiera text';

  @override
  String get keybindActionMarkUnread => 'Markera som oläst';

  @override
  String get keybindActionFocusTextarea => 'Fokusera textfält';

  @override
  String get keybindActionSwitchCommunities => 'Växla mellan communities';

  @override
  String get keybindActionSwitchChannels => 'Växla mellan kanaler';

  @override
  String get keybindActionHistoryBack => 'Gå bakåt i kanalhistoriken';

  @override
  String get keybindActionHistoryForward => 'Gå framåt i kanalhistoriken';

  @override
  String get keybindActionJumpUnreadChannels => 'Hoppa mellan olästa kanaler';

  @override
  String get keybindActionJumpMentionChannels =>
      'Hoppa mellan olästa kanaler med omnämnanden';

  @override
  String get keybindActionJumpCurrentCall => 'Gå till det aktuella samtalet';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Växla mellan senaste community och DM';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Växla till föregående community eller DM';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Växla till nästa community eller DM';

  @override
  String get keybindActionGoToDms => 'Gå till direktmeddelanden';

  @override
  String get keybindActionGoToFirstCommunity => 'Gå till första communityn';

  @override
  String get keybindActionGoToSecondCommunity => 'Gå till andra communityn';

  @override
  String get keybindActionGoToThirdCommunity => 'Gå till tredje communityn';

  @override
  String get keybindActionGoToFourthCommunity => 'Gå till fjärde communityn';

  @override
  String get keybindActionGoToFifthCommunity => 'Gå till femte communityn';

  @override
  String get keybindActionGoToSixthCommunity => 'Gå till sjätte communityn';

  @override
  String get keybindActionGoToSeventhCommunity => 'Gå till sjunde communityn';

  @override
  String get keybindActionGoToEighthCommunity => 'Gå till åttonde communityn';

  @override
  String get keybindActionToggleQuickSwitcher =>
      'Visa eller dölj snabbväxlaren';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Skapa eller gå med i en community';

  @override
  String get keybindActionStartDragAndDrop => 'Börja dra och släpp';

  @override
  String get keybindActionMove => 'Flytta';

  @override
  String get keybindActionDropItem => 'Släpp objekt';

  @override
  String get keybindActionCancel => 'Avbryt';

  @override
  String get keybindActionMarkCommunityRead => 'Markera community som läst';

  @override
  String get keybindActionMarkChannelRead => 'Markera kanal som läst';

  @override
  String get keybindActionStartGroupDm => 'Starta en grupp-DM-konversation';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Visa eller dölj fästa meddelanden';

  @override
  String get keybindActionToggleInbox => 'Visa eller dölj inkorgen';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Markera översta inkorgskanalen som läst';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Markera alla inkorgskanaler som lästa';

  @override
  String get keybindActionToggleMemberList =>
      'Visa eller dölj medlemslistan eller röstchatten';

  @override
  String get keybindActionToggleEmojiPicker => 'Visa eller dölj emojiväljaren';

  @override
  String get keybindActionToggleGifPicker => 'Visa eller dölj GIF-väljaren';

  @override
  String get keybindActionToggleStickerPicker =>
      'Visa eller dölj klistermärkesväljaren';

  @override
  String get keybindActionScrollChatUp => 'Skrolla upp i chatten';

  @override
  String get keybindActionScrollChatDown => 'Skrolla ned i chatten';

  @override
  String get keybindActionJumpOldestUnread =>
      'Gå till äldsta olästa meddelandet';

  @override
  String get keybindActionFocusComposer => 'Fokusera textfältet';

  @override
  String get keybindActionUploadFile => 'Ladda upp en fil';

  @override
  String get keybindActionCopyChannelLink => 'Kopiera kanallänk';

  @override
  String get keybindActionToggleSavedMedia => 'Visa eller dölj sparade medier';

  @override
  String get keybindActionSendVoiceMessage => 'Skicka röstmeddelande';

  @override
  String get keybindActionAnswerCall => 'Svara på det inkommande samtalet';

  @override
  String get keybindActionDeclineCall => 'Avvisa inkommande samtal';

  @override
  String get keybindActionStartDmCall =>
      'Starta ett samtal i en DM-konversation eller grupp';

  @override
  String get keybindActionToggleSoundboard => 'Visa eller dölj ljudpanelen';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expandera eller minimera kompakt samtalsvy';

  @override
  String get keybindActionPushToTalkPriority =>
      'Tryck för att prata (prioritet)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioritet för röstaktivitet';

  @override
  String get keybindActionOpenHelp => 'Öppna hjälp';

  @override
  String get keybindActionSearchMessages => 'Sök meddelanden';

  @override
  String get keybindActionOpenContextMenu => 'Öppna snabbmenyn';

  @override
  String get keybindActionOpenSettings => 'Öppna dina inställningar';

  @override
  String get keybindActionOpenThemeStudio => 'Öppna temastudion i eget fönster';

  @override
  String get keybindActionZoomIn => 'Zooma in';

  @override
  String get keybindActionZoomOut => 'Zooma ut';

  @override
  String get keybindActionZoomReset => 'Återställ zoom';

  @override
  String get clipboardPasteFailed =>
      'Kunde inte klistra in. Urklippet var tomt eller blockerat för den här appen.';

  @override
  String get homeQuickActionDms => 'Direktmeddelanden';

  @override
  String get assistantNeedsLogin => 'Öppna Fluxer och logga in först.';

  @override
  String get assistantNotInVoice => 'Du är inte i ett samtal.';

  @override
  String get assistantNotFound => 'Fluxer kunde inte hitta det.';

  @override
  String get assistantDmsDisabled =>
      'Direktmeddelanden är inaktiverade på den här instansen.';

  @override
  String get assistantFailed => 'Fluxer kunde inte slutföra det.';

  @override
  String get assistantOkMuted => 'Mikrofonen är avstängd.';

  @override
  String get assistantOkUnmuted => 'Mikrofonen är på.';

  @override
  String get assistantOkLeftVoice => 'Lämnade röstkanalen.';

  @override
  String get assistantOkJoinedVoice => 'Ansluter till röstkanalen.';

  @override
  String get assistantOkStartedCall => 'Startar samtalet.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Status satt till $status.';
  }

  @override
  String get assistantOkOpened => 'Öppnar Fluxer.';

  @override
  String get assistantOkMessageSent => 'Meddelande skickat.';

  @override
  String get assistantOkCustomStatusSet => 'Anpassad status uppdaterad.';

  @override
  String get assistantOkCustomStatusCleared => 'Anpassad status rensad.';

  @override
  String get guildNavbarAnnouncementChannel => 'Meddelandekanal';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Publicera uppdateringar som andra communities kan följa i sina egna kanaler';

  @override
  String get channelDetailsAnnouncementChannel => 'Meddelandekanal';

  @override
  String get channelSettingsAnnouncementChannel => 'Meddelandekanal';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Låter andra communityn följa den här kanalen och få kopior av det du publicerar.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Sluta vara en meddelandekanal?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count kanaler följer den här kanalen. Om du konverterar den till en textkanal slutar de kanalerna att följa.',
      one:
          '1 kanal följer den här kanalen. Om du konverterar den till en textkanal slutar den kanalen att följa.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Om du konverterar den här kanalen till en textkanal slutar alla kanaler som följer den att följa den.';

  @override
  String get channelSettingsConvertChannel => 'Konvertera';

  @override
  String get channelSettingsConvertFailed =>
      'Kunde inte konvertera den här kanalen';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Andra kanaler följer fortfarande den här kanalen. Ta bort dem innan du konverterar den.';

  @override
  String get channelMenuFollow => 'Följ kanal';

  @override
  String get channelFollowTitle => 'Följ den här kanalen';

  @override
  String get channelFollowBody =>
      'Välj vart dess publicerade meddelanden ska skickas. Du kan sluta följa när som helst i Communityinställningar → Webhooks.';

  @override
  String get channelFollowCommunity => 'Community';

  @override
  String get channelFollowChannel => 'Kanal';

  @override
  String get channelFollowAgeWarning =>
      'Det här är en åldersbegränsad kanal. Uppdateringar kan bara skickas till åldersbegränsade kanaler.';

  @override
  String get channelFollowContentWarning =>
      'Den här kanalen har en innehållsvarning. Uppdateringar kan bara skickas till kanaler med en innehållsvarning eller en åldersbegränsning.';

  @override
  String get channelFollowHiddenHint =>
      'Communities och kanaler där du inte kan hantera webhooks är dolda.';

  @override
  String get channelFollowEmpty =>
      'Du kan inte hantera webhooks i någon community. Be en administratör att följa den här kanalen.';

  @override
  String get channelFollowSubmit => 'Följ';

  @override
  String get channelFollowFailed => 'Kunde inte följa kanalen.';

  @override
  String get channelFollowSuccessTitle => 'Uppdateringar är på väg!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'Meddelanden som publiceras i $sourceName kommer att visas i #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Uppfattat!';

  @override
  String get channelFollowBarrier =>
      'Följ den här kanalen för att få de här uppdateringarna i en kanal du väljer.';

  @override
  String get channelHeaderFollow => 'Följ kanal';

  @override
  String get chatMessagePublish => 'Publicera';

  @override
  String get chatMessagePublished => 'Publicerad';

  @override
  String get chatMessagePublishConfirmTitle => 'Publicera meddelande?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Detta skickar en kopia till varje kanal som följer den här.';

  @override
  String get chatMessagePublishedToast => 'Meddelande publicerat';

  @override
  String get chatMessageAlreadyPublished =>
      'Det här meddelandet är redan publicerat.';

  @override
  String get chatMessagePublishFailedTitle =>
      'Kunde inte publicera det här meddelandet';

  @override
  String get chatMessagePublishFailedBody =>
      'Något gick fel. Försök igen om en liten stund.';

  @override
  String get chatMessagePublishLimitTitle => 'Sakta ner';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Du kan publicera igen om $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Du publicerar för snabbt. Försök igen om en liten stund.';

  @override
  String get chatMessageDeletePublished =>
      'Detta tar även bort kopiorna som skickades till kanaler som följer den här.';

  @override
  String get chatMessageEditPublishedTitle => 'Redigera publicerat meddelande?';

  @override
  String get chatMessageEditPublishedBody =>
      'Detta uppdaterar kopiorna som skickades till kanaler som följer den här.';

  @override
  String get chatMessageEditPublishedSave => 'Spara';

  @override
  String get chatMessageEditLimitTitle => 'Sakta ner';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Du kan redigera det här publicerade meddelandet igen om $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Du redigerar det här publicerade meddelandet för snabbt. Försök igen om en liten stund.';

  @override
  String get chatMessageOriginalDeleted =>
      '[Ursprungligt meddelande borttaget]';

  @override
  String get userTagCommunity => 'Community';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username lät den här kanalen följa $source. Meddelanden som publiceras där visas här.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username lät den här kanalen följa $source.';
  }

  @override
  String get publishNudgeNotSent => 'Inte skickat till följare än.';

  @override
  String get publishNudgeHideForever => 'Visa inte igen';

  @override
  String get publishNudgeDismiss => 'Stäng';

  @override
  String get channelSettingsFollowedChannels => 'Följda kanaler';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Meddelandekanaler som den här kanalen följer. Sluta följa för att sluta ta emot kopior.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Meddelandekanaler som följs av kanaler i den här communityn.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'Från $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Uppdateringar är pausade eftersom källkanalen inte längre är tillgänglig.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Sluta följa $name?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Den här kanalen kommer att sluta ta emot kopior från den meddelandekanalen.';

  @override
  String get channelSettingsUnfollow => 'Sluta följa';

  @override
  String get crosspostCommunityTitle => 'Community';

  @override
  String get crosspostGoToCommunity => 'Gå till communityn';

  @override
  String get crosspostJoinCommunity => 'Gå med i communityn';

  @override
  String get crosspostSourceFailed =>
      'Det gick inte att läsa in den här communityn. Försök igen om en liten stund.';

  @override
  String crosspostMembers(int count) {
    return '$count medlemmar';
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
      other: '$count minuter',
      one: '1 minut',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sekunder',
      one: '1 sekund',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Kanaltyp stöds inte';

  @override
  String get channelUnsupportedBody =>
      'Den här versionen av appen stöder inte den här kanaltypen.';

  @override
  String get channelDetailsUnsupportedChannel => 'Kanal som inte stöds';

  @override
  String get forumChannelTypeForum => 'Forum';

  @override
  String get forumChannelTypeForumDescription =>
      'Inlägg organiserade efter ämne och taggar';

  @override
  String get forumChannelTypeMedia => 'Medier';

  @override
  String get forumChannelTypeMediaDescription =>
      'Inlägg som bygger på bilder och videor';

  @override
  String get forumNewPost => 'Nytt inlägg';

  @override
  String get forumNewMediaPost => 'Nytt mediainlägg';

  @override
  String get forumSearchPosts => 'Sök i inlägg';

  @override
  String get forumViewOptions => 'Sortering och vy';

  @override
  String get forumSearchIndexing =>
      'Sökningen förbereds fortfarande för den här communityn. Inläggen visas här så snart den är klar.';

  @override
  String get forumNoPosts => 'Inga inlägg har gjorts än';

  @override
  String get forumNoPostsHint =>
      'Bli först med att starta en konversation här.';

  @override
  String get forumNoSearchResults => 'Inga inlägg matchar din sökning';

  @override
  String get forumNoSearchResultsHint =>
      'Prova andra ord eller rensa taggfiltret.';

  @override
  String get forumCreateFirstPost => 'Skapa det första inlägget';

  @override
  String get forumOlderPosts => 'Äldre inlägg';

  @override
  String get forumPostsLoadFailed => 'Inläggen kunde inte läsas in.';

  @override
  String get forumRetry => 'Försök igen';

  @override
  String get forumPostPinned => 'Fäst';

  @override
  String get forumPostLocked => 'Låst';

  @override
  String get forumPostArchived => 'Arkiverat';

  @override
  String get forumPostNewBadge => 'Nytt';

  @override
  String get forumPostStarterDeleted =>
      'Det ursprungliga meddelandet har tagits bort.';

  @override
  String forumPostSnippet(String author, String content) {
    return '$author: $content';
  }

  @override
  String forumPostNewMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nya meddelanden',
      one: '$count nytt meddelande',
    );
    return '$_temp0';
  }

  @override
  String get forumPostReact => 'Lägg till standardreaktionen';

  @override
  String get forumOpenPost => 'Öppna inlägg';

  @override
  String get forumEditTags => 'Redigera taggar';

  @override
  String get forumSaveTags => 'Spara taggar';

  @override
  String forumTagsLimitHint(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Välj upp till $count taggar.',
      one: 'Välj upp till 1 tagg.',
    );
    return '$_temp0';
  }

  @override
  String get forumPinPost => 'Fäst inlägg';

  @override
  String get forumUnpinPost => 'Lossa inlägg';

  @override
  String get forumMarkPostRead => 'Markera som läst';

  @override
  String get forumCopyPostLink => 'Kopiera länk';

  @override
  String get forumPostGuidelines => 'Riktlinjer för inlägg';

  @override
  String get forumGuidelinesPlaceholder =>
      'Berätta vad folk ska publicera här och hur de ska göra det.';

  @override
  String get forumPostTitle => 'Titel';

  @override
  String get forumPostMessage => 'Meddelande';

  @override
  String get forumPostMessagePlaceholder =>
      'Skriv det första meddelandet i ditt inlägg';

  @override
  String get forumPostMediaPlaceholder => 'Lägg till en bildtext';

  @override
  String get forumPostTags => 'Taggar';

  @override
  String get forumPostTagsRequired => 'Taggar (obligatoriskt)';

  @override
  String get forumPostAddMedia => 'Lägg till media';

  @override
  String get forumPostAddFile => 'Lägg till fil';

  @override
  String get forumPostRemoveAttachment => 'Ta bort bilaga';

  @override
  String get forumPostSubmit => 'Publicera';

  @override
  String get forumPostTitleRequired => 'Ge ditt inlägg en titel.';

  @override
  String get forumPostMediaRequired =>
      'Lägg till minst en bild eller video för att publicera här.';

  @override
  String get forumPostContentRequired =>
      'Skriv ett meddelande eller lägg till en fil.';

  @override
  String get forumSortLatestActivity => 'Senast aktiva';

  @override
  String get forumSortCreationTime => 'Publiceringsdatum';

  @override
  String get forumLayoutList => 'Listvy';

  @override
  String get forumLayoutGallery => 'Gallerivy';

  @override
  String get forumNewPostsUnread => 'Visa nya inlägg som olästa';

  @override
  String get forumNewPostsUnreadDescription =>
      'Markera den här kanalen som oläst när någon skapar ett inlägg.';

  @override
  String get forumPostSlowmode => 'Långsamt läge för inlägg';

  @override
  String forumPostSlowmodeDescription(String bypassSlowmodePermissionLabel) {
    return 'Väntetid mellan nya inlägg. \"$bypassSlowmodePermissionLabel\" kan kringgå den.';
  }

  @override
  String get forumMessageSlowmode => 'Långsamt läge för meddelanden i inlägg';

  @override
  String get forumMessageSlowmodeDescription =>
      'Långsamt läge som tillämpas på meddelanden i nya inlägg.';

  @override
  String get forumDefaultAutoArchive => 'Dölj efter inaktivitet';

  @override
  String get forumDefaultAutoArchiveDescription =>
      'Nya inlägg arkiveras efter så här lång tid utan aktivitet.';

  @override
  String get forumDefaultReaction => 'Standardreaktion';

  @override
  String get forumSetDefaultReaction => 'Välj en emoji';

  @override
  String get forumChangeDefaultReaction => 'Ändra';

  @override
  String get forumRemoveDefaultReaction => 'Ta bort';

  @override
  String get forumDefaultSortOrder => 'Standardsortering';

  @override
  String get forumDefaultLayout => 'Standardlayout';

  @override
  String get forumTagMatchSetting => 'Taggfilter';

  @override
  String get forumTagMatchSome => 'Matcha någon av de valda taggarna';

  @override
  String get forumTagMatchAll => 'Matcha alla valda taggar';

  @override
  String get forumRequireTag => 'Kräv taggar';

  @override
  String get forumRequireTagDescription =>
      'Användare måste välja minst en tagg när de skapar ett inlägg.';

  @override
  String get forumHideMediaDownloads =>
      'Dölj nedladdningsalternativ för medier';

  @override
  String get forumHideMediaDownloadsDescription =>
      'Dölj nedladdning, öppna i webbläsare och kopiera länk för bilder och videor i inlägg.';

  @override
  String forumTagsTitle(int count, int max) {
    return 'Taggar ($count/$max)';
  }

  @override
  String get forumTagsDescription =>
      'Taggar hjälper folk att hitta och filtrera inlägg. Endast moderatorer kan använda modererade taggar.';

  @override
  String get forumCreateTag => 'Skapa tagg';

  @override
  String get forumEditTag => 'Redigera tagg';

  @override
  String get forumSaveTag => 'Spara tagg';

  @override
  String get forumDeleteTag => 'Ta bort tagg';

  @override
  String get forumTagName => 'Taggnamn';

  @override
  String get forumTagEmoji => 'Emoji';

  @override
  String get forumTagRemoveEmoji => 'Ta bort emoji';

  @override
  String get forumTagModerated => 'Endast moderatorer kan använda';

  @override
  String get forumTagModeratedDescription =>
      'Endast medlemmar som kan hantera trådar kan lägga till eller ta bort den här taggen.';

  @override
  String get forumTagModeratedBadge => 'Modererad';

  @override
  String forumPostCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'Du kan publicera igen om $seconds sekunder.',
      one: 'Du kan publicera igen om 1 sekund.',
    );
    return '$_temp0';
  }

  @override
  String get voiceP2pStartTitle => 'Starta i P2P-läge?';

  @override
  String voiceP2pStartDescription(int maxParticipants) {
    return 'Ljud och video går direkt mellan deltagarna, med lägre fördröjning. Andra deltagare kan se din IP-adress. Upp till $maxParticipants personer kan delta. Den som inte kan ansluta direkt kan inte delta förrän någon byter till ett vanligt samtal.';
  }

  @override
  String get voiceP2pStartConfirm => 'Starta i P2P-läge';

  @override
  String get voiceP2pStartStandard => 'Starta vanligt samtal';

  @override
  String get voiceP2pJoinTitle => 'Gå med i ett P2P-samtal?';

  @override
  String voiceP2pJoinDescription(int maxParticipants) {
    return 'Det här samtalet ansluter deltagarna direkt. Andra deltagare kan se din IP-adress. Upp till $maxParticipants personer kan delta. Om du inte kan ansluta direkt kan du inte delta förrän någon byter till ett vanligt samtal.';
  }

  @override
  String voiceP2pPinnedJoinDescription(int maxParticipants) {
    return 'Den här kanalen tillåter bara P2P-samtal. Deltagarna ansluter direkt och kan se din IP-adress. Upp till $maxParticipants personer kan delta. Om du inte kan ansluta direkt kan du inte delta.';
  }

  @override
  String get voiceP2pJoinConfirm => 'Gå med';

  @override
  String get voiceP2pAlwaysAgreeLabel => 'Fråga inte igen, godkänn alltid';

  @override
  String get voiceP2pAlwaysAgreeSettingLabel =>
      'Godkänn alltid att gå med i P2P-samtal';

  @override
  String get voiceP2pAlwaysAgreeSettingDescription =>
      'Gå med i P2P-samtal utan att bli tillfrågad. Andra deltagare kan se din IP-adress.';

  @override
  String get voiceP2pIndicatorLabel => 'P2P';

  @override
  String get voiceP2pIndicatorDescription =>
      'Direkt anslutning. Medier krypteras mellan deltagarna.';

  @override
  String get voiceP2pSwitchToStandard => 'Byt till vanligt samtal';

  @override
  String get voiceP2pSwitchToStandardDescription =>
      'Alla i samtalet flyttas till ett vanligt samtal via servern.';

  @override
  String get voiceP2pPeerFailedDescription =>
      'Det gick inte att upprätta en direktanslutning. Lämna samtalet eller flytta alla till ett vanligt samtal.';

  @override
  String get voiceP2pUnavailableError =>
      'P2P-samtal är inte tillgängliga just nu.';

  @override
  String get voiceP2pConsentRequiredError =>
      'Det här samtalet är P2P och kräver ditt godkännande för att gå med.';

  @override
  String get voiceChannelFullError => 'Det här samtalet är fullt.';

  @override
  String get voiceP2pScreenShareUnavailable =>
      'Skärmdelning från den här enheten är inte tillgänglig i P2P-samtal.';

  @override
  String get channelMenuJoinP2p => 'Starta P2P-samtal';

  @override
  String get channelSettingsRtcP2pLabel => 'Endast P2P-samtal';

  @override
  String channelSettingsRtcP2pDescription(int maxParticipants) {
    return 'Deltagarna ansluter direkt och kan se varandras IP-adresser. Alla måste godkänna innan de går med. Upp till $maxParticipants personer kan delta.';
  }

  @override
  String voiceP2pPeerFailedTitle(String name) {
    return 'Kan inte ansluta direkt till $name';
  }

  @override
  String get favoritesRenameCategory => 'Byt namn på kategori';

  @override
  String get friendAcceptFailedTitle => 'Kunde inte acceptera vänförfrågan';

  @override
  String get friendAcceptUnavailable =>
      'Den vänförfrågan är inte längre tillgänglig. Uppdatera och försök igen.';

  @override
  String get friendAcceptClaimToAccept =>
      'Slutför registreringen för att acceptera vänförfrågningar.';

  @override
  String get friendAcceptFailedMessage =>
      'Kunde inte acceptera vänförfrågan. Försök igen.';

  @override
  String get friendCancelFailedTitle => 'Kunde inte avbryta vänförfrågan';

  @override
  String get friendIgnoreFailedTitle => 'Kunde inte ignorera vänförfrågan';

  @override
  String get friendIgnoreFailedMessage =>
      'Kunde inte ignorera vänförfrågan. Försök igen.';

  @override
  String get friendRemoveFailedTitle => 'Kunde inte ta bort vän';

  @override
  String get friendRemoveFailedMessage =>
      'Kunde inte ta bort den här vännen. Försök igen.';

  @override
  String get userBlockFailedTitle => 'Kunde inte blockera användare';

  @override
  String get userBlockSystemAccount => 'Det här kontot kan inte blockeras.';

  @override
  String get userBlockFailedMessage =>
      'Kunde inte blockera den här användaren. Försök igen.';

  @override
  String get userUnblockFailedTitle => 'Kunde inte avblockera användaren';

  @override
  String get userUnblockFailedMessage =>
      'Kunde inte avblockera den här användaren. Försök igen.';

  @override
  String friendCancelRequestConfirmDescription(String userName) {
    return 'Avbryta din vänförfrågan till $userName?';
  }

  @override
  String get errorSomethingWentWrongTitle => 'Något gick fel';

  @override
  String get errorUnexpectedTryAgain => 'Ett oväntat fel uppstod. Försök igen.';

  @override
  String get errorMessagingPausedTitle => 'Meddelanden är pausade';

  @override
  String get errorMessagingPausedMessage =>
      'Meddelanden är pausade på ditt konto. Kolla din e-post så hittar du ett snabbt steg för att fortsätta.';

  @override
  String get errorFeatureDisabledTitle =>
      'Funktionen är tillfälligt inaktiverad';

  @override
  String get errorFeatureDisabledMessage =>
      'Den här funktionen är pausad. Försök igen senare.';

  @override
  String get dmErrorStartConversationTitle =>
      'Kunde inte starta den här konversationen';

  @override
  String get dmErrorCannotMessageMessage =>
      'Personen kanske inte tar emot meddelanden från dig, eller så har ni inte längre någon gemensam community.';

  @override
  String get dmErrorUnknownUserMessage =>
      'Användaren finns inte längre. Uppdatera och försök igen.';

  @override
  String get dmErrorClaimMessage =>
      'Du måste säkra ditt konto innan du kan starta en DM-konversation.';

  @override
  String get dmErrorVerifyEmailMessage =>
      'Du måste verifiera din e-postadress innan du kan starta en DM-konversation.';

  @override
  String get dmErrorTooManyRecipientsTitle =>
      'Den här gruppen har för många medlemmar';

  @override
  String get dmErrorTooManyRecipientsMessage =>
      'Du har lagt till fler personer än vad en grupp-DM tillåter. Ta bort några och försök igen.';

  @override
  String get dmErrorMaxGroupDmsTitle => 'Du har nått gränsen för grupp-DM';

  @override
  String get dmErrorMaxGroupDmsMessage =>
      'Du eller någon du lägger till har redan det maximala antalet grupp-DM öppna. Lämna en och försök igen.';

  @override
  String get groupDmAddFailedTitle => 'Kunde inte lägga till i grupp';

  @override
  String get groupDmInviteFailedTitle => 'Kunde inte skapa inbjudningslänk';

  @override
  String get dmCloseFailedTitle => 'Kunde inte stänga DM-konversationen';

  @override
  String get groupDmLeaveFailedTitle => 'Kunde inte lämna gruppen';

  @override
  String get inviteJoinFailedTitle => 'Kunde inte gå med i communityn';

  @override
  String get inviteErrorPausedMessage =>
      'Administratörerna har pausat inbjudningar – du kan inte gå med just nu.';

  @override
  String get inviteErrorAtCapacityTitle => 'Communityn är full';

  @override
  String get inviteErrorAtCapacityMessage =>
      'Den här communityn har nått sin medlemsgräns och tar inte emot nya medlemmar just nu.';

  @override
  String get inviteErrorPresenceTitle => 'Gateway-anslutning krävs';

  @override
  String get inviteErrorPresenceMessage =>
      'Tillfälliga inbjudningar kräver en aktiv anslutning. Kontrollera din anslutning och försök igen.';

  @override
  String get inviteErrorBannedTitle => 'Du är bannlyst';

  @override
  String get inviteErrorBannedMessage =>
      'Du är bannlyst från den här communityn och kan inte gå med.';

  @override
  String get inviteErrorIpBannedTitle => 'Din IP-adress är bannlyst';

  @override
  String get inviteErrorIpBannedMessage =>
      'Din IP-adress är bannlyst från den här communityn och du kan inte gå med.';

  @override
  String get inviteErrorClaimTitle => 'Kontoverifiering krävs';

  @override
  String get inviteErrorClaimMessage =>
      'Lägg till en e-postadress och ett lösenord till ditt konto först.';

  @override
  String get leaveCommunityFailedTitle => 'Kunde inte lämna communityn';

  @override
  String get leaveCommunityFailedMessage =>
      'Kunde inte lämna just nu. Försök igen om en liten stund.';

  @override
  String get chatSendFailedTitle => 'Ditt meddelande skickades inte';

  @override
  String get chatSendFailedMessage => 'Försök skicka meddelandet igen.';

  @override
  String get chatSendTooQuickTitle => 'Du skickar meddelanden för snabbt';

  @override
  String get chatRateLimitedMessage =>
      'Sakta ner – vänta ett ögonblick innan du försöker igen.';

  @override
  String get chatMatureContentTitle => 'Vuxet innehåll är inte tillåtet';

  @override
  String get chatMatureContentGuildMessage =>
      'Den här kanalen är inte markerad för vuxet innehåll. Vuxet innehåll kan endast skickas i kanaler som är markerade för vuxet innehåll. Be en moderator att uppdatera kanalen om det är lämpligt.';

  @override
  String chatMatureContentDmMessage(String settingsPath) {
    return 'Du eller personen du chattar med har valt att blockera känsligt medieinnehåll i direktmeddelanden. Ni kan båda ändra detta i $settingsPath.';
  }

  @override
  String get chatMatureContentGroupDmMessage =>
      'Den här gruppen är inte markerad för vuxet innehåll. Gruppägaren kan aktivera vuxet innehåll i gruppinställningarna om alla i gruppen är 18 år eller äldre.';

  @override
  String get chatFileTooLargeTitle => 'Filstorleken är för stor';

  @override
  String chatFileTooLargeMessage(String maxSize) {
    return 'En eller flera filer du försöker ladda upp överskrider den maximala storleksgränsen på $maxSize per fil.';
  }

  @override
  String get chatHeavyTitle => 'Oj, det här var tungt';

  @override
  String get chatReactionsHeavyMessage =>
      'Det här är ett tungt meddelande. Några reaktioner måste tas bort innan du kan lägga till fler.';

  @override
  String get chatReactionTimedOut =>
      'Du kan inte lägga till nya reaktioner när du har timeout.';

  @override
  String chatTooManyAttachmentsMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '$count fil',
    );
    return 'Du kan bara ladda upp $_temp0 åt gången. Försök igen med färre filer.';
  }

  @override
  String get chatEditTooQuickTitle => 'Du redigerar meddelanden för snabbt';

  @override
  String get chatEditFailedMessage => 'Försök redigera meddelandet igen.';

  @override
  String get chatDeleteTooQuickTitle => 'Du raderar meddelanden för snabbt';

  @override
  String get chatDeleteTooQuickMessage =>
      'Vänta en stund innan du tar bort fler meddelanden.';

  @override
  String get chatDeleteFailedTitle => 'Det gick inte att radera meddelandet';

  @override
  String get chatDeleteFailedMessage => 'Försök att radera meddelandet igen.';

  @override
  String get chatAttachmentDeleteFailedTitle => 'Kunde inte ta bort bilagan';

  @override
  String get chatAttachmentDeleteFailedMessage =>
      'Försök ta bort bilagan igen.';

  @override
  String get chatAltTextFailedTitle => 'Kunde inte uppdatera alt-text';

  @override
  String get chatAltTextUnknownMessage =>
      'Det här meddelandet finns inte längre.';

  @override
  String get chatAltTextNoPermission =>
      'Du kan inte redigera det här meddelandet.';

  @override
  String get chatAltTextUnavailable =>
      'Redigering är tillfälligt otillgänglig. Försök igen senare.';

  @override
  String get chatAltTextFailedMessage =>
      'Kunde inte uppdatera alt-texten. Försök igen.';

  @override
  String get chatPinFailedTitle => 'Kunde inte fästa meddelandet';

  @override
  String get chatUnpinFailedTitle => 'Kunde inte lossa meddelandet';

  @override
  String get chatPinFailedMessage => 'Något gick fel. Försök igen senare.';

  @override
  String get chatPinBlockedMessage =>
      'Du kan inte interagera med den här användaren just nu.';

  @override
  String get bookmarkLimitTitle => 'Bokmärkesgränsen har nåtts';

  @override
  String bookmarkLimitMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bokmärken',
      one: '$count bokmärke',
    );
    return 'Du har $_temp0. Ta bort ett för att lägga till ett nytt.';
  }

  @override
  String get savedMediaLimitTitle => 'Gränsen för sparade medier har nåtts';

  @override
  String savedMediaLimitMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sparade medieobjekt',
      one: '$count sparat medieobjekt',
    );
    return 'Du har nått gränsen på $_temp0. Ta bort ett för att lägga till ett nytt.';
  }

  @override
  String get errorContentBlockedTitle => 'Innehåll blockerat';

  @override
  String get errorContentBlockedMessage =>
      'Din åtgärd kunde inte slutföras eftersom den flaggades av våra säkerhetssystem. Om du tror att det är ett misstag kan du kontakta supporten.';

  @override
  String get errorContentBlockedSelfHostedMessage =>
      'Din åtgärd kunde inte slutföras eftersom den flaggades av våra säkerhetssystem. Om du tror att det är ett misstag kan du kontakta administratörerna för den här instansen.';

  @override
  String get channelDeletedToast => 'Kanal borttagen';

  @override
  String get categoryDeletedToast => 'Kategori borttagen';

  @override
  String get channelDeleteNoPermissionTitle => 'Du kan inte ta bort det här';

  @override
  String get channelDeleteNoPermissionChannel =>
      'Du har inte behörighet att ta bort den här kanalen.';

  @override
  String get channelDeleteNoPermissionCategory =>
      'Du har inte behörighet att ta bort den här kategorin.';

  @override
  String get channelDeleteAlreadyDeletedTitle => 'Redan borttagen';

  @override
  String get channelDeleteAlreadyDeletedChannel =>
      'Den här kanalen finns inte längre. Den kan ha raderats.';

  @override
  String get channelDeleteAlreadyDeletedCategory =>
      'Den här kategorin finns inte längre. Den kan ha raderats.';

  @override
  String get channelDeleteFailedChannelTitle =>
      'Kunde inte radera den här kanalen';

  @override
  String get channelDeleteFailedCategoryTitle =>
      'Kunde inte ta bort den här kategorin';

  @override
  String get channelPermissionsUpdateFailedTitle =>
      'Kunde inte uppdatera kanalbehörigheter';

  @override
  String get channelSettingsSaveFailedTitle =>
      'Kunde inte spara kanalinställningar';

  @override
  String get emojiSlotsFullTitle => 'Inga emojiplatser är tillgängliga';

  @override
  String get stickerSlotsFullTitle =>
      'Inga klistermärkesplatser är tillgängliga';

  @override
  String get emojiSomeFailedMessage =>
      'Granska filerna och försök igen med mindre eller enklare bilder.';

  @override
  String get emojiNameInvalidCharacters =>
      'Emojinamn får bara innehålla bokstäver, siffror och understreck.';

  @override
  String get emojiErrorGoneTitle => 'Den här emojin finns inte längre';

  @override
  String get emojiRenameGoneMessage =>
      'Den kan ha raderats. Namnet återställdes till vad det var tidigare.';

  @override
  String get emojiRenameNoPermissionTitle =>
      'Du kan inte byta namn på den här emojin';

  @override
  String get emojiRenameNoPermissionMessage =>
      'Du har inte behörighet att byta namn på den här emojin. Namnet återställdes till det tidigare.';

  @override
  String get emojiRenameRateLimitedMessage =>
      'Vänta en stund och försök byta namn igen.';

  @override
  String get emojiRenameFailedMessage =>
      'Namnet återställdes till det tidigare. Försök igen om en liten stund.';

  @override
  String get emojiDeleteGoneMessage =>
      'Det verkar som att den redan har raderats.';

  @override
  String get emojiDeleteNoPermissionTitle =>
      'Du kan inte ta bort den här emojin';

  @override
  String get emojiDeleteNoPermissionMessage =>
      'Du har inte behörighet att ta bort den här emojin.';

  @override
  String get emojiDeleteRateLimitedMessage =>
      'Vänta en stund och försök radera igen.';

  @override
  String get stickerTooLargeTitle => 'Klistermärket är för stort';

  @override
  String stickerTooLargeMessage(String maxSize) {
    return 'Uppladdningstjänsten avvisade klistermärket eftersom det är större än $maxSize. Prova en mindre fil, en enklare bild eller en kortare animering.';
  }

  @override
  String get stickerCreateFailedMessage =>
      'Något gick fel när klistermärket skulle förberedas. Prova en annan fil eller försök igen om en stund.';

  @override
  String get stickerUpdateFailedTitle => 'Kunde inte uppdatera klistermärket';

  @override
  String get moderationTimeoutFailed =>
      'Kunde inte ge medlemmen en timeout. Försök igen.';

  @override
  String get moderationRemoveTimeoutFailed =>
      'Kunde inte ta bort timeouten. Försök igen.';

  @override
  String get moderationKickFailed =>
      'Kunde inte sparka ut medlemmen. Försök igen.';

  @override
  String get moderationBanFailed =>
      'Kunde inte bannlysa medlemmen. Försök igen.';

  @override
  String get transferOwnershipFailedTitle => 'Kunde inte överföra ägarskap';

  @override
  String transferOwnershipFailedMessage(String username) {
    return 'Ägarskapet kunde inte överföras till $username just nu.';
  }

  @override
  String get revokeBanFailedTitle => 'Kunde inte häva bannlysningen';

  @override
  String get voiceModerationNoPermissionTitle => 'Du kan inte göra det';

  @override
  String get voiceModerationNoPermissionMessage =>
      'Du har inte behörighet att göra detta med den här medlemmen.';

  @override
  String get voiceModerationLeftTitle => 'Medlemmen har lämnat samtalet';

  @override
  String get voiceModerationLeftMessage =>
      'Den här medlemmen är inte längre ansluten till röstkanalen.';

  @override
  String get voiceModerationUnknownMemberTitle => 'Medlemmen hittades inte';

  @override
  String get voiceModerationUnknownMemberMessage =>
      'Den här medlemmen är inte längre med i communityn. Uppdatera och försök igen.';

  @override
  String get voiceJoinTimedOut => 'Du kan inte gå med när du har timeout.';

  @override
  String get voiceJoinClaimAccount =>
      'Säkra ditt konto för att gå med i den här röstkanalen.';

  @override
  String get voiceJoinClaimAccountDirectCall =>
      'Säkra ditt konto för att starta eller gå med i enskilda samtal.';

  @override
  String get voiceJoinUserLimit =>
      'Den här röstkanalen har nått sin användargräns. Försök igen senare eller gå med i en annan kanal.';

  @override
  String get voiceJoinConnectionLimit =>
      'Du har nått röstkanalens anslutningsgräns.';

  @override
  String get voiceJoinChannelUnavailable =>
      'Röstkanalen är inte längre tillgänglig.';

  @override
  String get avatarUploadFailedTitle => 'Kunde inte ladda upp avatar';

  @override
  String get bannerUploadFailedTitle => 'Kunde inte ladda upp bannern';

  @override
  String get animatedImageUseStatic => 'Ladda upp en statisk bild i stället.';

  @override
  String get passkeyDeleteFailedTitle => 'Kunde inte ta bort passkey';

  @override
  String get premiumPaymentsUnavailableTitle =>
      'Betalningar är inte tillgängliga';

  @override
  String get premiumPaymentsUnavailableMessage =>
      'Betalningar är tillfälligt otillgängliga. Försök igen om en liten stund.';

  @override
  String get premiumNoSubscriptionTitle => 'Inget aktivt abonnemang';

  @override
  String get premiumNoSubscriptionMessage =>
      'Vi hittade inget aktivt abonnemang på det här kontot. Uppdatera och försök igen.';

  @override
  String get premiumAlreadyCancelingTitle => 'Uppsägning redan planerad';

  @override
  String get premiumAlreadyCancelingMessage =>
      'Ditt abonnemang är redan planerat att avslutas vid faktureringsperiodens slut.';

  @override
  String get premiumNotCancelingTitle =>
      'Abonnemanget är inte planerat att avslutas';

  @override
  String get premiumNotCancelingMessage =>
      'Ditt abonnemang är inte planerat att avslutas, så det finns inget att återaktivera.';

  @override
  String get premiumCancelFailedTitle => 'Kunde inte säga upp ditt abonnemang';

  @override
  String get premiumCancelFailedMessage =>
      'Något gick fel när ditt abonnemang skulle sägas upp. Försök igen om en stund.';

  @override
  String get premiumReactivateFailedTitle =>
      'Kunde inte återaktivera ditt abonnemang';

  @override
  String get premiumReactivateFailedMessage =>
      'Något gick fel när ditt abonnemang skulle återaktiveras. Försök igen om en stund.';

  @override
  String get premiumRefundConfirmTitle => 'Återbetala ditt senaste köp?';

  @override
  String get premiumRefundConfirmBody =>
      'Detta återbetalar din senaste faktura och avslutar eventuella tillhörande abonnemang. Du kan inte själv begära en ny återbetalning under de närmaste 30 dagarna.';

  @override
  String get premiumRefundConfirm => 'Återbetala köp';

  @override
  String get premiumRefundIssuedToast =>
      'Återbetalning utfärdad. Det kan ta några arbetsdagar innan den syns.';

  @override
  String get premiumRefundOutsideWindowTitle =>
      'Utanför återbetalningsperioden';

  @override
  String get premiumRefundOutsideWindowMessage =>
      'Ditt senaste köp ligger inte längre inom återbetalningsperioden. Kontakta supporten om du har problem med faktureringen.';

  @override
  String get premiumRefundCooldownTitle =>
      'Du har nyligen fått en återbetalning';

  @override
  String get premiumRefundCooldownMessage =>
      'Du har nyligen begärt återbetalning via självbetjäning. Du kan begära en ny när väntetiden är slut.';

  @override
  String get premiumRefundNothingTitle => 'Inget att återbetala';

  @override
  String get premiumRefundNothingMessage =>
      'Vi kunde inte hitta något nyligt köp att återbetala på det här kontot.';

  @override
  String get premiumRefundFailedTitle => 'Kunde inte återbetala det här köpet';

  @override
  String get premiumRefundFailedMessage =>
      'Något gick fel när vi skulle utfärda din återbetalning. Kontakta supporten om detta fortsätter att hända.';

  @override
  String get premiumVerifyEmailTitle => 'Verifiera din e-postadress först';

  @override
  String premiumVerifyEmailBody(String productName) {
    return 'Du måste verifiera din e-postadress innan du kan köpa $productName.';
  }

  @override
  String get premiumCheckoutBlockedTitle => 'Kassan är inte tillgänglig';

  @override
  String premiumCheckoutBlockedBody(String supportEmail) {
    return 'Kassan är blockerad för det här kontot. Kontakta $supportEmail om du behöver hjälp.';
  }

  @override
  String get premiumCheckoutBlockedBodySelfHosted =>
      'Kassan är blockerad för det här kontot.';
}
