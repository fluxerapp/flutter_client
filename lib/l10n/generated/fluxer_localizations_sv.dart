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
  String get reconnectingBody =>
      'Något är fel med instansen.\nBör vara fixat om en sekund!';

  @override
  String get gatewayReconnectingToast => 'Ansluter igen…';

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
  String get connectingCaps => 'CONNECTING';

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
    return 'Hej $displayName, gör anspråk på ditt konto för att inte förlora åtkomsten.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hej $displayName, vänligen verifiera din e-postadress.';
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
  String get nagbarManageSubscription => 'Hantera prenumeration';

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
  String get nagbarEnableNotifications => 'Aktivera notiser';

  @override
  String get nagbarBillingPortalFailed =>
      'Kunde inte öppna faktureringsportalen. Försök igen om en stund.';

  @override
  String get welcomeBack => 'Välkommen tillbaka';

  @override
  String get email => 'E-postadress';

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
  String get ssoRequired => 'SSO krävs för att komma åt den här instansen.';

  @override
  String get organizationSsoProvider =>
      'Logga in med din organisations leverantör för enkel inloggning.';

  @override
  String get failedToStartSso => 'Kunde inte starta SSO';

  @override
  String get ssoCancelled => 'SSO-inloggning avbröts';

  @override
  String preferSso(String provider) {
    return 'Föredrar du att använda SSO? Fortsätt med $provider.';
  }

  @override
  String get logInViaBrowser => 'Logga in via webbläsare';

  @override
  String get needAccountPrompt => 'Behöver du ett konto? ';

  @override
  String get register => 'Registrera';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Verifiera att du är människa';

  @override
  String get captchaDescription =>
      'Vi måste se till att du inte är en bot. Vänligen slutför verifieringen nedan.';

  @override
  String get captchaSwitchToHcaptcha => 'Problem? Prova hCaptcha istället';

  @override
  String get captchaSwitchToTurnstile => 'Prova Turnstile istället';

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
  String get ipAuthResent => 'Skickades igen';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Tillbaka';

  @override
  String get next => 'Nästa';

  @override
  String get mfaTitle => 'Tvåfaktorsautentisering';

  @override
  String get mfaChooseMethod => 'Välj en verifieringsmetod';

  @override
  String get mfaMethodTotp => 'Autentiseringsapp';

  @override
  String get mfaMethodWebauthn => 'Säkerhetsnyckel / Säkerhetskod';

  @override
  String get mfaTotpDescription =>
      'Ange den 6-siffriga koden från din autentiseringsapp eller en av dina reservkoder.';

  @override
  String get mfaCodeLabel => 'Kod';

  @override
  String get mfaTryAnotherMethod => 'Prova en annan metod';

  @override
  String get mfaUseSecurityKey => 'Prova säkerhetsnyckel / passkey istället';

  @override
  String get accountSelectorTitle => 'Välj ett konto';

  @override
  String get accountSelectorDescription =>
      'Välj ett konto för att fortsätta, eller lägg till ett annat.';

  @override
  String get accountAdd => 'Lägg till ett konto';

  @override
  String get accountRemove => 'Ta bort';

  @override
  String accountRemoveTitle(String username) {
    return 'Ta bort $username';
  }

  @override
  String get accountRemoveDescription =>
      'Detta tar bort den sparade sessionen för detta konto.';

  @override
  String get accountRemoveOnlyDescription =>
      'Detta tar bort det enda sparade kontot på den här enheten.';

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
  String get statusOnlineStatusSection => 'Online-status';

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
  String get statusUntilIChangeIt => 'Tills jag ändrar det';

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
  String get statusDndDescription =>
      'Du kommer inte att få aviseringar på datorn';

  @override
  String get statusInvisibleDescription => 'Du kommer att framstå som offline';

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
  String get suspendedRecheck => 'Kontrollera uppdateringar';

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
  String get forgotPasswordSentTitle => 'Kontrollera din e-post';

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
  String get registerConsent =>
      'Jag godkänner användarvillkoren och integritetspolicyn';

  @override
  String get registerConsentPrefix => 'Jag godkänner ';

  @override
  String get registerConsentTerms => 'användarvillkoren';

  @override
  String get registerConsentAnd => ' och ';

  @override
  String get registerConsentPrivacy => 'integritetspolicyn';

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
  String get passkeyNotAvailable =>
      'Passkeys är inte tillgängliga för den här appen. Logga in med e-post och lösenord istället.';

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
  String get embedInviteUnknownSubtitle => 'Försök att be om en ny inbjudan.';

  @override
  String get embedInviteUnavailable => 'Inbjudan ej tillgänglig';

  @override
  String get embedInviteJoinGroup => 'Gå med i grupp';

  @override
  String get embedInviteAlreadyJoined => 'Redan medlem';

  @override
  String get embedInviteDisabled => 'Inbjudningar inaktiverade';

  @override
  String get embedInvitePaused =>
      'Inbjudningar är pausade för den här gruppen.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName upptäckte en potentiell räd, så nya användare kan inte gå med just nu.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Den här gruppen har pausat inbjudningar. Du kan försöka igen senare.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName upptäckte en potentiell räd i den här communityn. Inbjudningar är pausade, så nya användare kan inte gå med just nu.';
  }

  @override
  String get inviteAcceptTitle => 'Du har blivit inbjuden att gå med';

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
  String get inviteAcceptJoinGroupButton => 'Gå med i gruppen';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Du har blivit inbjuden att gå med i en gruppchatt av $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'någon';

  @override
  String get inviteAcceptEmojiPack => 'Emotipaket';

  @override
  String get inviteAcceptStickerPack => 'Klistermärkespaket';

  @override
  String get inviteAcceptInstallEmojiPack => 'Installera emotipaket';

  @override
  String get inviteAcceptInstallStickerPack => 'Installera klistermärkespaket';

  @override
  String get inviteAcceptPackInstallNote =>
      'Genom att acceptera denna inbjudan installeras paketet automatiskt.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Åtkomst till kanal nekad';

  @override
  String get channelAccessDeniedDescription =>
      'Du har inte åtkomst till kanalen där detta meddelande skickades.';

  @override
  String get messageJumpLinkNoAccess => 'Ingen åtkomst';

  @override
  String get okay => 'Okej';

  @override
  String get embedThemeTitle => 'Delat tema';

  @override
  String get embedThemeSubtitle =>
      'Den här klienten stöder inte anpassade teman.';

  @override
  String get embedThemeUnavailableButton => 'Teman ej tillgängliga';

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
  String get embedGiftClaimHelp => 'Klicka för att hämta din present!';

  @override
  String get embedGiftAlreadyRedeemed => 'Redan inlöst';

  @override
  String get embedGiftClaimAccountHelp =>
      'Gör anspråk på ditt konto för att lösa in presenten.';

  @override
  String get embedGiftClaim => 'Hämta present';

  @override
  String get embedGiftClaimed => 'Gåva hämtad';

  @override
  String get embedGiftClaimAccount => 'Logga in för att lösa in';

  @override
  String get embedGiftUnknownTitle => 'Okänd gåva';

  @override
  String get embedGiftUnknownSubtitle =>
      'Den här presentkoden är ogiltig eller har redan lösts in.';

  @override
  String get embedGiftUnavailable => 'Gåvan är inte tillgänglig';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Hämta din gåva för att aktivera din $productName-prenumeration!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Den här presenten har redan hämtats.';

  @override
  String get giftAcceptMaybeLater => 'Kanske senare';

  @override
  String get giftRedeemedToast => 'Presentkort inlöst!';

  @override
  String get giftRedeemInvalidTitle => 'Ogiltig presentkod';

  @override
  String get giftRedeemInvalidMessage =>
      'Koden är ogiltig eller har redan använts.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Gåvan är redan inlösen';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Den här koden har redan lösts in.';

  @override
  String get giftRedeemNotFoundTitle => 'Gåvan hittades inte';

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
  String get privacyBotDirectMessages => 'Direktmeddelanden från botar';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Tillåt botar från denna community att skicka direktmeddelanden till dig';

  @override
  String get privacyMutualDmsDisabled =>
      'Communityadministratörerna har inaktiverat mottagning av direktmeddelanden enbart från gemensamma medlemmar i denna community.';

  @override
  String get communityDebug => 'Community-felsökning';

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
      'Community-aviseringsinställningar';

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
  String get notificationMobilePush => 'Mobilaviseringar';

  @override
  String get notificationOverrides => 'Aviseringsinställningar';

  @override
  String get notificationSelectChannel => 'Välj en kanal eller kategori';

  @override
  String get notificationOnlyAtMentions => 'Endast @omnämnanden';

  @override
  String get notificationMuteChannel => 'Tysta kanal';

  @override
  String get notificationUnmuteChannel => 'Avtysta kanal';

  @override
  String get notificationUseCategoryDefault => 'Använd standard för kategori';

  @override
  String get notificationUseCommunityDefault => 'Använd communityns standard';

  @override
  String get notificationNoCategory => 'Ingen kategori';

  @override
  String get dmMarkAsRead => 'Markera som läst';

  @override
  String get dmMuteConversation => 'Tysta DM';

  @override
  String get dmUnmuteConversation => 'Avtysta DM';

  @override
  String get dmPinDm => 'Fäst DM';

  @override
  String get dmUnpinDm => 'Ta bort fästning från DM';

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
  String get dmNoCommunitiesAvailable => 'Inga communities tillgängliga';

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
  String get dmUnpinGroupDm => 'Avpinna gruppchatt';

  @override
  String get dmUnnamedGroup => 'Namnlös grupp';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grupp för $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Gör DM till favorit';

  @override
  String get dmUnfavoriteDm => 'Ta bort favorit från DM';

  @override
  String get dmFavoriteGroupDm => 'Gör gruppchatt till favorit';

  @override
  String get dmUnfavoriteGroupDm => 'Ta bort favorit från gruppchatt';

  @override
  String get dmChangeFriendNickname => 'Ändra smeknamn för vän';

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
  String get dmPinned => 'Fästad DM';

  @override
  String get dmUnpinned => 'Avfästad DM';

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
  String get dmFriendRequestFailed => 'Kunde inte skicka vänförfrågan';

  @override
  String get dmAcceptFriendRequestFailed => 'Kunde inte acceptera vänförfrågan';

  @override
  String get dmRemoveFriendFailed => 'Kunde inte ta bort vän';

  @override
  String get dmBlockFailed => 'Kunde inte blockera användare';

  @override
  String get dmUnblockFailed => 'Kunde inte avblockera användare';

  @override
  String get dmIgnoreFriendRequestFailed => 'Kunde inte ignorera vänförfrågan';

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
  String get addFriendClaimTitle => 'Hämta ditt konto';

  @override
  String get addFriendClaimDescription =>
      'Hämta ditt konto för att skicka vänförfrågningar.';

  @override
  String get addFriendVerifyTitle => 'Verifiera din e-postadress';

  @override
  String get addFriendVerifyDescription =>
      'Du måste verifiera din e-postadress innan du kan skicka vänförfrågningar.';

  @override
  String get addFriendVerifyEmail => 'Verifiera e-post';

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
      'De accepterar inte vänförfrågningar just nu.';

  @override
  String get addFriendUnblockFirst =>
      'Avblockera dem först för att skicka en vänförfrågan.';

  @override
  String get addFriendCannotSendToSelf =>
      'Du kan inte skicka en vänförfrågan till dig själv.';

  @override
  String get addFriendAlreadyFriends =>
      'Ni är redan vänner med den här användaren.';

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
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Hitta din drömemoji';

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
  String get emojiInfoFromHeader => 'Den här emojin kommer från';

  @override
  String get emojiInfoDiscoverableCommunity => 'Upptäckbar community';

  @override
  String get emojiInfoPrivateCommunity => 'Privat community';

  @override
  String get emojiInfoVerifiedCommunity => 'Verifierad community';

  @override
  String get emojiInfoAddToFavorites => 'Lägg till i favoriter';

  @override
  String get emojiInfoRemoveFromFavorites => 'Ta bort från favoriter';

  @override
  String get emojiFrequentlyUsed => 'Använda ofta';

  @override
  String get emojiTabGifs => 'GIF:ar';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Klistermärken';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Sök GIF:ar';

  @override
  String get gifPickerSearchKlipy => 'Sök KLIPY';

  @override
  String get gifPickerSearchTenor => 'Sök Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoriter';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Inga favorit-GIF:ar än';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Föredra en GIF för att se den här.';

  @override
  String get gifPickerTrending => 'Populära GIF:ar';

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
  String get emojiCategoryFood => 'Mat & dryck';

  @override
  String get emojiCategoryActivity => 'Aktiviteter';

  @override
  String get emojiCategoryTravel => 'Resor & platser';

  @override
  String get emojiCategoryObjects => 'Objekt';

  @override
  String get emojiCategorySymbols => 'Symboler';

  @override
  String get emojiCategoryFlags => 'Flaggor';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Lås upp $emojiCount från $communityCount med Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Skaffa Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Visa inte detta igen';

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
  String get externalLinkWarningDestinationUrl => 'Destination URL:';

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
  String get externalLinkVisitSite => 'Besök webbplats';

  @override
  String get externalLinkTrustAllLabel => 'Lita på alla externa länkar';

  @override
  String get externalLinkStripTrackingLabel =>
      'Ta bort spårningsparametrar från URL:er';

  @override
  String get externalLinkStripTrackingDescription =>
      'Ta automatiskt bort spårningsparametrar (som utm_source, fbclid, gclid) från URL:er i meddelanden du skickar. Rengör länken innan den når någon annan.';

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
  String get externalLinkStopTrustingAllAction => 'Inaktivera Lita på alla';

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
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Ändra din Användarnamn';

  @override
  String get fluxerTagInputLabel => 'Användarnamn';

  @override
  String get fluxerTagDescriptionBase =>
      'Användarnamn får endast innehålla bokstäver (a-z, A-Z), siffror (0-9) och understreck. Användarnamn är skiftlägesokänsliga.';

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
  String get discriminatorPremiumTooltip =>
      'Skaffa Plutonium för att anpassa din tagg eller behålla den när du ändrar ditt användarnamn';

  @override
  String get fluxerTagAlreadyTaken => 'Användarnamn är redan tagen';

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
  String premiumTrialExpiresOn(String date) {
    return 'Din Plutonium-prövoperiod löper ut den $date. Uppgradera för att behålla din anpassade tagg och få en badge på din profil.';
  }

  @override
  String get premiumTrialActive =>
      'Du är på en Plutonium-prövoperiod. Uppgradera för att behålla din anpassade tagg och få en badge på din profil.';

  @override
  String get fluxerTagUpdated => 'Användarnamn uppdaterad';

  @override
  String get fluxerTagUpdateFailed =>
      'Kunde inte uppdatera Användarnamn. Försök igen.';

  @override
  String get continueAction => 'Fortsätt';

  @override
  String get profileCustomizationTitle => 'Profilanpassning';

  @override
  String get profileCustomizationDescription =>
      'Redigera ditt profils utseende och se en förhandsgranskning i realtid';

  @override
  String get usernameLabel => 'Användarnamn';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Verifiera ditt konto för att ändra din Användarnamn';

  @override
  String get changeFluxerTag => 'Ändra Användarnamn';

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
  String get removeAvatar => 'Ta bort avatar';

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
      'PNG, JPEG, WebP, GIF. Max 10MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Accentfärg';

  @override
  String get accentColorDescription =>
      'Anpassar kantlinjen och bannerfärgen på din profil';

  @override
  String get aboutMeLabel => 'Om mig';

  @override
  String get aboutMeHelperText => 'Du kan använda länkar, emoji och Markdown.';

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
  String get maskVisionaryAsSubscription =>
      'Maskera Visionary som prenumeration';

  @override
  String get maskVisionaryDescription =>
      'Visa din Visionary som en vanlig prenumeration istället';

  @override
  String get hideVisionaryIdBadge => 'Dölj Visionary ID-märke';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Dölj Visionary ID-märke (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Ta bort ditt Visionary ID-märke';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Du har en Plutonium-prövperiod — din prenumeration startar $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Din prenumeration börjar automatiskt när din prövperiod slutar. Ingen åtgärd krävs.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Du har en Plutonium-prövperiod som löper ut $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Du har en Plutonium-prövperiod';

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
  String get profilePreviewLabel => 'Förhandsgranskning';

  @override
  String get profilePreviewMessage => 'Meddelande';

  @override
  String profilePreviewMemberSince(String productName) {
    return '$productName-medlem sedan';
  }

  @override
  String get unclaimedAccountTitle => 'Oinnehållet konto';

  @override
  String get unclaimedAccountDescription =>
      'Ditt konto är ännu inte innhållet. Utan e-postadress och lösenord kan du förlora åtkomsten. Innehåll ditt konto nu för att säkra det.';

  @override
  String get claimAccount => 'Innehåll konto';

  @override
  String get profileTypeLabel => 'Profiltyp';

  @override
  String get profileTypeGlobal => 'Global profil';

  @override
  String get profileTypeGuildDescription =>
      'Du redigerar din profil per community. Den här profilen kommer endast att vara synlig i den här communityn och kommer att åsidosätta din globala profil.';

  @override
  String get communityNicknameLabel => 'Community-smeknamn';

  @override
  String get perGuildPremiumUpsellText =>
      'Att anpassa din avatar, banner, accentfärg och biografi för enskilda communities kräver Plutonium. Smeknamn och pronomen i communityn är gratis för alla.';

  @override
  String get avatarModeInherit => 'Använd global profil';

  @override
  String get avatarModeCustom => 'Använd anpassad bild';

  @override
  String get avatarModeUnset => 'Visa inte';

  @override
  String get profileSavedToast => 'Profil uppdaterad';

  @override
  String get profileEditButton => 'Redigera profil';

  @override
  String get profileNoteLabel => 'Anteckning';

  @override
  String get profileNoteVisibility => '(endast synlig för dig)';

  @override
  String get profileNoteEmpty => 'Ingen anteckning ännu.';

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
  String get sudoMethodTotp => 'Autentisering';

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
  String get passwordChangeVerifyTitle => 'Verifiera din e-post';

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
  String get emailChangeSuccess => 'E-postadressen har ändrats';

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
  String get securityTfaBackupCodes => 'Säkerhetskopieringskoder';

  @override
  String get securityTfaBackupCodesDescription =>
      'Visa och hantera dina säkerhetskopieringskoder för kontohantering';

  @override
  String get securityTfaViewCodes => 'Visa koder';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Använd passkeys för inloggning utan lösenord och tvåfaktorsautentisering';

  @override
  String get securityPasskeysRegistered => 'Registrerade passkeys';

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
  String get securityPasskeysAdd => 'Lägg till passkey';

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
  String get securityPasskeysDeleteTitle => 'Ta bort passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Är du säker på att du vill ta bort passkey \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Namnge passkey';

  @override
  String get securityPasskeyNameLabel => 'Passkey-namn';

  @override
  String get securityPasskeyNameHint => 't.ex. YubiKey, iPhone, Jobbdator';

  @override
  String get securityPhoneSectionTitle => 'Telefonnummer';

  @override
  String get securityPhoneSectionDescription => 'Hantera ditt telefonnummer';

  @override
  String get securityPhoneLabel => 'Telefonnummer';

  @override
  String get securityPhoneNone => 'Inget telefonnummer tillagt.';

  @override
  String get securityPhoneAdd => 'Lägg till telefonnummer';

  @override
  String get securityPhoneRemove => 'Ta bort';

  @override
  String get securityPhoneRemoveTitle => 'Ta bort telefonnummer';

  @override
  String get securityPhoneRemoveDescription =>
      'Är du säker på att du vill ta bort ditt telefonnummer?';

  @override
  String get securityPhoneRemoved => 'Telefonnummer borttaget';

  @override
  String get securityClaimTitle => 'Säkerhetsfunktioner';

  @override
  String get securityClaimDescription =>
      'Hämta ditt konto för att få tillgång till säkerhetsfunktioner som tvåfaktorsautentisering och passkeys.';

  @override
  String get securityVerifyEmailRequired =>
      'Du måste verifiera din e-postadress innan du kan ställa in tvåfaktorsautentisering, passkeys eller SMS-verifiering.';

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
  String get backupCodesTitle => 'Säkerhetskopieringskoder';

  @override
  String get backupCodesWarning =>
      'Om du tappar bort åtkomsten till din autentiseringsapp och inte har dessa koder, kommer du att bli permanent utelåst från ditt konto. Ladda ner eller kopiera dem nu och förvara dem på en säker plats.';

  @override
  String get backupCodesDownload => 'Ladda ner';

  @override
  String get backupCodesCopy => 'Kopiera';

  @override
  String get backupCodesCopied =>
      'Säkerhetskopieringskoder kopierade till urklipp';

  @override
  String get backupCodesAcknowledge =>
      'Jag har laddat ner eller kopierat mina säkerhetskopieringskoder och förvarat dem på en säker plats.';

  @override
  String get backupCodesDone => 'Klart';

  @override
  String get backupCodesViewTitle => 'Visa säkerhetskopieringskoder';

  @override
  String get backupCodesViewDescription =>
      'Verifiering kan krävas innan du kan visa dina säkerhetskopieringskoder.';

  @override
  String get phoneAddTitle => 'Lägg till telefonnummer';

  @override
  String get phoneAddLabel => 'Telefonnummer';

  @override
  String get phoneAddHint => 'Ange ditt telefonnummer';

  @override
  String get phoneAddFooter =>
      'Vi skickar en SMS-kod när den är tillgänglig. Ditt nummer är inte kopplat till ditt konto. Vi behåller endast en krypterad markör, utan användar-ID, för att tillåta högst 2 verifieringar under cirka 30 dagar.';

  @override
  String get phoneAddSendCode => 'Skicka kod';

  @override
  String get phoneVerifyTitle => 'Verifiera telefonnummer';

  @override
  String get phoneVerifyDescription =>
      'Ange verifieringskoden som skickats till ditt telefonnummer.';

  @override
  String get phoneAddSuccess => 'Telefonnummer verifierat';

  @override
  String get phoneCountryLabel => 'Land';

  @override
  String get phoneSearchCountries => 'Sök länder...';

  @override
  String get phoneNumberRequired => 'Telefonnummer krävs';

  @override
  String get phoneEnterValidNumber => 'Ange ett giltigt mobilnummer.';

  @override
  String get phoneCannotBeUsed =>
      'Det här telefonnumret kan inte användas. Prova ett annat mobilnummer eller kontakta supporten.';

  @override
  String get phoneAlreadyUsed =>
      'Det här telefonnumret har redan använts. Prova ett annat nummer eller kontakta supporten.';

  @override
  String get phoneCodeDidNotWork =>
      'Koden fungerade inte. Kontrollera den och försök igen.';

  @override
  String get phoneTooManyAttempts =>
      'För många försök. Vänta en stund och försök igen.';

  @override
  String get phoneSmsUnavailable =>
      'Sms-verifiering är inte tillgänglig just nu. Försök igen senare eller kontakta supporten.';

  @override
  String get phoneNotEligible =>
      'Telefonverifiering är inte tillgänglig för det här kontot. Använd en annan metod eller kontakta support.';

  @override
  String get phoneCaptchaRequired =>
      'En webbläsarkontroll krävs innan telefonverifiering. Försök igen från inloggningssidan eller kontakta supporten.';

  @override
  String get phoneSomethingWentWrong => 'Något gick fel. Försök igen.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Att skicka ett SMS till det här numret är för dyrt, så vi behöver att du skickar ett SMS till oss istället. Du kan också kontakta support för att få kravet borttaget från ditt konto.';

  @override
  String get phoneInboundDefaultDescription =>
      'Vi behöver att du skickar ett SMS till oss för att verifiera ditt telefonnummer.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Öppna telefonens meddelandeapp och skapa ett nytt textmeddelande.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Skicka koden $code till $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Vänta tills vi har tagit emot ditt meddelande. Det kan ta en minut.';

  @override
  String get phoneInboundGetNewCode => 'Hämta ny kod';

  @override
  String get phoneInboundChallengeCodeLabel => 'Kod att skicka';

  @override
  String get phoneInboundOurNumberLabel => 'Skicka till';

  @override
  String get requiredActionTitle => 'Kontoverifiering krävs';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Slutför den obligatoriska verifieringen för att fortsätta använda $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Din registrering behöver en extra antispamkontroll innan du kan fortsätta.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Verifiera din e-postadress eller ditt telefonnummer för att fortsätta använda $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Slutför de obligatoriska stegen för e-post- och telefonverifiering nedan för att fortsätta använda $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Välj en verifieringsmetod';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Slutför en av verifieringsvägarna nedan för att fortsätta använda $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Använd e-post';

  @override
  String get requiredActionUsePhone => 'Använd telefon';

  @override
  String get requiredActionCheckEmailTitle => 'Kolla din e-post';

  @override
  String get requiredActionCheckEmailDescription =>
      'Vi skickade en verifieringslänk till din e-postadress. Öppna den för att fortsätta.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Skicka verifieringsmejl igen';

  @override
  String get requiredActionVerificationEmailSent =>
      'Verifieringsmejl skickat. Kolla din inkorg.';

  @override
  String get requiredActionSignOut => 'Logga ut';

  @override
  String get dangerZoneSectionTitle => 'Farlig zon';

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
      'Ta permanent bort ditt konto och all associerad data. Denna åtgärd kan inte ångras.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Avbryt din aktiva Plutonium-prenumeration i Plutonium-inställningarna innan du tar bort ditt konto.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Kan inte ta bort konto';

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
      'Är du säker på att du vill ta bort ditt konto? Denna åtgärd kommer att schemalägga ditt konto för permanent borttagning.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Du kan avbryta borttagningsprocessen inom 14 dagar';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Efter 14 dagar kommer ditt konto att tas bort permanent';

  @override
  String get dangerZoneDeleteBullet3 =>
      'När borttagningen har behandlats kan du inte återfå åtkomst till ditt konto';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Du kommer inte att kunna ta bort dina skickade meddelanden efter att ditt konto har tagits bort';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Om du vill exportera din data eller ta bort dina meddelanden först, besök avsnittet Sekretessinstrumentpanel i Användarinställningar innan du fortsätter.';

  @override
  String get claimAccountTitle => 'Hämta ditt konto';

  @override
  String get claimAccountDescription =>
      'Hämta ditt konto genom att lägga till en e-postadress och ett lösenord. Vi skickar en verifieringskod för att bekräfta din e-postadress innan vi är klara.';

  @override
  String get claimAccountEmailLabel => 'E-postadress';

  @override
  String get claimAccountPasswordLabel => 'Lösenord';

  @override
  String get claimAccountSendCode => 'Skicka kod';

  @override
  String get claimAccountVerifyDescription =>
      'Ange koden vi skickade till din e-postadress för att verifiera den. Ditt lösenord kommer att ställas in när koden har bekräftats.';

  @override
  String get claimAccountSuccess => 'Konto säkrat framgångsrikt';

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
  String get authorizedAppsTitle => 'Auktoriserade program';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Dessa program har beviljats åtkomst till ditt $productName-konto.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Inga auktoriserade program';

  @override
  String get authorizedAppsEmptyDescription =>
      'Du har inte auktoriserat några program för att komma åt ditt konto.';

  @override
  String get authorizedAppsLoadError =>
      'Kunde inte ladda auktoriserade program';

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
      'Åtkomst till din grundläggande profilinformation (användarnamn, avatar, etc.)';

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
  String get privacyPendingDeletionTitle => 'Väntar på radering';

  @override
  String get blockedUsersTitle => 'Blockerade användare';

  @override
  String get blockedUsersDescription =>
      'Blockerade användare kan inte skicka vänförfrågningar eller meddelanden till dig direkt.';

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
  String get blockedUsersCopyTag => 'Kopiera Användarnamn';

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
    return '$productName Community Team';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName Partner';
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
    return '$productName Plutonium-prenumerant sedan $date';
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
  String get userProfileNoteVisibility => '(endast synlig för dig)';

  @override
  String get userProfileNoteSave => 'Spara';

  @override
  String get userProfileNoteDelete => 'Ta bort';

  @override
  String get userProfileNoteEmpty => 'Klicka för att lägga till en anteckning';

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
      'Den här användaren har inga roller i den här gruppen.';

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
  String get userProfileFailedOpenDm => 'Det gick inte att öppna DM';

  @override
  String get userProfileFailedSaveNote =>
      'Det gick inte att spara anteckningen';

  @override
  String get userProfileActionFailed => 'Åtgärden misslyckades, försök igen';

  @override
  String get userProfileChangeNickname => 'Ändra smeknamn';

  @override
  String get userProfileKick => 'Spark';

  @override
  String get userProfileBan => 'Banna';

  @override
  String get userProfileTimeout => 'Tidsbegränsa';

  @override
  String get userProfileRemoveTimeout => 'Ta bort tidsbegränsning';

  @override
  String get userProfileTransferOwnership => 'Överför ägarskap';

  @override
  String get userProfileReportUser => 'Anmäl användare';

  @override
  String get userProfileReportMessage => 'Anmäl meddelande';

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
  String get userProfileBanDurationLabel => 'Blockeringstid';

  @override
  String get userProfileBanCustomSecondsLabel => 'Anpassad tid (sekunder)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Valfritt värde från $min till $max sekunder';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Ta bort meddelandehistorik';

  @override
  String get userProfileBanDeleteNone => 'Ta inte bort något';

  @override
  String get userProfileBanDelete24h => 'Föregående 24 timmar';

  @override
  String get userProfileBanDelete7d => 'Föregående 7 dagar';

  @override
  String get userProfileBanReasonLabel => 'Anledning (valfritt)';

  @override
  String get userProfileBanReasonHint => 'Ange en anledning till blockeringen';

  @override
  String get userProfileBanSubmit => 'Blockera medlem';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Stäng av $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Avstängningstid';

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
  String get durationCustom => 'Anpassad...';

  @override
  String get iarReportUserTitle => 'Anmäl användare';

  @override
  String get iarReportGuildTitle => 'Anmäl community';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Om den här anmälan gäller ett specifikt meddelande i den här gruppen, anmäl det meddelandet istället. Meddelandeanmälningar ger vårt säkerhetsteam tydligast sammanhang, och att lägga till detaljer i kommentarerna kan hjälpa oss att granska det snabbare. Fortsätt bara med att anmäla hela gruppen om en meddelandeanmälan inte skulle fånga upp det bredare problemet.';

  @override
  String get iarContinueToReportCommunity => 'Fortsätt att anmäla communityt';

  @override
  String get iarPreviewCommunitySubtitle => 'Community';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Trakasserier eller riktade övergrepp';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Gemenskapen underlättar påhopp eller riktade trakasserier.';

  @override
  String get iarReasonHateGuildDescription =>
      'Främjar hat mot skyddade grupper.';

  @override
  String get iarReasonTerrorismLabel =>
      'Terrorism eller våldsbejakande extremism';

  @override
  String get iarReasonTerrorismDescription =>
      'Främjar, rekryterar för eller samordnar våldsbejakande extremistisk verksamhet.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Vuxet innehåll eller osäker åtkomstkontroll';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Vuxeninnehåll utan korrekt spärr.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Utsätter minderåriga för fara eller innehåller barnexploaterande innehåll.';

  @override
  String get iarReasonRaidLabel => 'Raidkoordinering';

  @override
  String get iarReasonRaidDescription =>
      'Koordinerar räder, brigader eller trakasserier mot personer eller grupper.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Gruppen finns för att spamma, lura eller missbruka plattformen.';

  @override
  String get iarReasonMalwareGuildLabel =>
      'Distribution av skadlig programvara';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Sprider skadlig programvara, stjäl inloggningsuppgifter eller skadliga filer.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Integritetsbrott eller doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Delar personlig information, förföljer användare eller samordnar integritetsbrott.';

  @override
  String get iarReasonSelfHarmGuildLabel =>
      'Uppmuntrar till självskadebeteende';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Uppmuntrar till självmord, självskadebeteende eller ätstörningar.';

  @override
  String get iarReasonInappropriateProfile => 'Olämplig profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Den här användarens profil innehåller olämpligt innehåll';

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
    return 'Hej, $username! Kul att ha dig här.';
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
    return 'Hej där, $username! Hoppas du trivs.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hej, $username, välkommen ombord!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Kul att du kom, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Välkommen in, $username!';
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
    return 'Välkommen, $username! Hoppas du trivs här.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Välkommen, $username! Din nästa konversation börjar här.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Välkommen, $username. Vi är glada att ha dig här.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Kul att se dig, $username! Välkommen in.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Du är här, $username! Kul att ha dig med oss.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Du har kommit fram, $username! Nu kör vi.';
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
  String get linkedDevicesCurrentDevice => 'Aktuell enhet';

  @override
  String get linkedDevicesOtherDevices => 'Andra enheter';

  @override
  String get linkedDevicesEnterSelection => 'Aktivera urvals­läge';

  @override
  String get linkedDevicesExitSelection => 'Avsluta urvals­läge';

  @override
  String get linkedDevicesSelectAll => 'Markera alla';

  @override
  String get linkedDevicesClearSelection => 'Rensa urval';

  @override
  String get linkedDevicesRevokeTooltip => 'Återkalla enhet';

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
      'Meddelanden är tillfälligt pausade i det här communityt.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Du har blivit avstängd. Meddelanden, reaktioner och röstsamtal är pausade tills avstängningen löper ut.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Du måste hämta ditt konto för att skicka meddelanden i det här communityt.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Du måste verifiera din e-postadress för att skicka meddelanden i det här communityt.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Ditt konto är för nytt för att skicka meddelanden i det här communityt.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Du har inte varit medlem i det här communityt tillräckligt länge för att skicka meddelanden.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Du måste verifiera ett telefonnummer för att skicka meddelanden i det här communityt.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verifiera e-post';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verifiera telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'För många bilagor (max $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName överskrider storleksgränsen ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Dessa filer är för stora för att skickas tillsammans';

  @override
  String get chatAttachmentDropToUpload => 'Släpp filer för att ladda upp';

  @override
  String get chatAttachmentDropToSend => 'Släpp filer för att skicka nu';

  @override
  String get chatAttachmentSendVoiceMessage => 'Skicka röstmeddelande';

  @override
  String get voiceMessageTitle => 'Röstmeddelande';

  @override
  String get voiceMessageHoldHint =>
      'Håll för att spela in. Dra till papperskorgen för att ta bort, skjut upp för att låsa eller släpp för att skicka.';

  @override
  String get voiceMessageDiscard => 'Kassera röstmeddelande';

  @override
  String get voiceMessageSend => 'Skicka röstmeddelande';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Kan inte starta inspelning. Tillåt mikrofonåtkomst.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Röstinspelning stöds inte på den här enheten.';

  @override
  String get voiceMessageMicInUse =>
      'Lämna röstsamtalet för att spela in ett röstmeddelande.';

  @override
  String get voiceMessageRecordingFailed =>
      'Inspelningen misslyckades. Försök igen.';

  @override
  String get voiceMessageSendFailed =>
      'Kan inte skicka röstmeddelande. Försök igen.';

  @override
  String get voiceMessageRecordingHint =>
      'Tala nu. Tryck på Stopp när du är klar – du kan trimma efteråt.';

  @override
  String get voiceMessageReviewHint =>
      'Dra i handtagen för att trimma, tryck sedan på Skicka.';

  @override
  String get voiceMessageStop => 'Stopp';

  @override
  String get voiceMessageStartRecording => 'Starta inspelning';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Spela upp';

  @override
  String get voiceMessagePause => 'Pausa';

  @override
  String get voiceMessageSeekForward => 'Spola framåt';

  @override
  String get voiceMessageSeekBackward => 'Spola tillbaka';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Urvalet måste vara minst ${secondsString}s.';
  }

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
  String get chatAttachmentPasteTooltip => 'Klistra in fil från urklipp';

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
  String get matureContentTitle => 'Moget innehåll';

  @override
  String get matureCommunityTitle => 'Mogen community';

  @override
  String get matureCategoryTitle => 'Mogen kategori';

  @override
  String get matureChannelTitle => 'Mogen kanal';

  @override
  String get communityContentWarningTitle => 'Varning för communityinnehåll';

  @override
  String get categoryContentWarningTitle => 'Varning för kategorinnehåll';

  @override
  String get channelContentWarningTitle => 'Varning för kanalinnehåll';

  @override
  String get defaultContentWarningBody =>
      'Det här innehåller känsligt innehåll.';

  @override
  String get matureCommunityBody =>
      'Den här communityn är markerad för moget innehåll och kan innehålla material som kan vara olämpligt för vissa användare.';

  @override
  String get matureCategoryBody =>
      'Den här kategorin är markerad för moget innehåll och kan innehålla material som kan vara olämpligt för vissa användare.';

  @override
  String get matureChannelBody =>
      'Den här kanalen är markerad för moget innehåll och kan innehålla material som kan vara olämpligt för vissa användare.';

  @override
  String get matureVoiceChannelBody =>
      'Den här röstkanalen är markerad för moget innehåll och kan innehålla material som kan vara olämpligt för vissa användare.';

  @override
  String get matureLinkChannelBody =>
      'Den här länkkanaen är markerad för moget innehåll och kan öppna material som kan vara olämpligt för vissa användare.';

  @override
  String get matureCommunityUnavailableBody =>
      'Den här mogna communityn är inte tillgänglig för ditt konto.';

  @override
  String get matureCategoryUnavailableBody =>
      'Den här mogna kategorin är inte tillgänglig för ditt konto.';

  @override
  String get matureChannelUnavailableBody =>
      'Den här mogna kanalen är inte tillgänglig för ditt konto.';

  @override
  String get matureContentProceedButton => 'Fortsätt';

  @override
  String get matureContentUnderstandButton => 'Jag förstår';

  @override
  String get matureContentOpenLinkButton => 'Öppna länk';

  @override
  String get sensitiveContentSectionTitle => 'Känsligt innehåll';

  @override
  String get sensitiveContentSectionDescription =>
      'Styr hur moget eller känsligt media filtreras i olika sammanhang';

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
  String get sensitiveContentBlurUnscannedLabel =>
      'Dölj media tills säkerhetsskanningen är klar';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'När det är aktiverat döljs bilder och videor tills säkerhetsskanningen av innehållet är klar.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Den här inställningen är alltid på för ditt konto.';

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
  String get chatCancelUpload => 'Avbryt uppladdning';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Går ut $date';
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
  String get connectionsEmptyTitle => 'Inga anslutningar ännu';

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
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

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
  String get connectionDnsRecordTitle => 'DNS TXT-post';

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
  String get connectionTokenFileTitle => 'Servera tokenfilen';

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
      'Tillåt dina vänner att se den här anslutningen';

  @override
  String get connectionVisibilityCommunityMembers => 'Community-medlemmar';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Tillåt medlemmar från communities du är med i att se den här anslutningen';

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
  String get lookAndFeelTitle => 'Utseende';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Välj mellan mörkt, kolsvart eller ljust utseende.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Högt dynamiskt omfång';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Kontrollera hur HDR-bilder visas på HDR-kompatibla skärmar.';

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
  String get lookAndFeelThemeCoal => 'Kolsvart tema';

  @override
  String get lookAndFeelThemeLight => 'Ljust tema';

  @override
  String get lookAndFeelThemeSystem => 'Systemtema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synkronisera tema mellan enheter';

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
  String get lookAndFeelChatFontScalingTitle => 'Skalning av chatt-typsnitt';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Justera teckenstorleken i chattområdet.';

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
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Färg $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradient $id';
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
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Visningsläge för meddelanden';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Bekväm';

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
      'Anpassa gränssnittselement och beteenden.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indikatorer för skrivande i kanallistan';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Välj hur skrivindikatorer visas i kanallistan när någon skriver i en kanal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Skrivindikator + avatarer';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Visa skrivindikator med användaravatarer i kanallistan';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Endast skrivindikator';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Visa bara skrivindikatorn utan avatarer';

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
  String get lookAndFeelKeyboardHintsTitle => 'Tangentbordsledtrådar';

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
  String get lookAndFeelNekoTitle => 'Diverse';

  @override
  String get lookAndFeelNekoDescription => 'Diverse gränssnittsinställningar.';

  @override
  String get lookAndFeelShowNekoLabel => 'Visa Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'När det är aktiverat visas Neko nära chattinmatningsfältet.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Anslutningsbeteende för röstkanaler';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Styr hur du ansluter till röstkanaler i communities.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Kräv dubbelklick för att ansluta till röstkanaler';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'När det är aktiverat måste du dubbelklicka på röstkanaler för att ansluta. När det är inaktiverat (standard) ansluter ett enda klick omedelbart.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Snabba den bruna räven hoppar över den lata hunden.';

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
  String get lookAndFeelChannelListSectionTitle => 'Kanallista';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Styr beteendet för olästa indikatorer för tystade kanaler i kanallistor.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Visa oläst indikator på tystade kanaler';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'När det är aktiverat visar tystade kanaler en blek oläst indikator på vänster sida. Omnämnanden visas fortfarande oavsett denna inställning.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktiv nu';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Styr hur Aktiv nu visas i appen.';

  @override
  String get lookAndFeelShowActiveNowLabel => 'Visa Aktiv nu på startsidan';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Visa Aktiv nu på startsidan för att visa vänner som är aktiva i röstchatt. Du ser en förhandsgranskning, kanalens sammanhang, vem som redan är där och ett snabbt sätt att ansluta.';

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
      'Ditt personliga utrymme för snabb åtkomst till kanaler, DM och grupper du gillar. Tryck på stjärnan på en kanal för att lägga till den här.';

  @override
  String get favoritesWelcomeTip => 'Inte för dig? Stäng av när som helst.';

  @override
  String get favoritesDisableButton => 'Inaktivera favoriter';

  @override
  String get favoritesAddedToast => 'Lades till i favoriter';

  @override
  String get favoritesRemovedToast => 'Togs bort från favoriter';

  @override
  String get favoritesHiddenToast => 'Favoriter dolda';

  @override
  String get favoritesMute => 'Tysta favoriter';

  @override
  String get favoritesUnmute => 'Avtysta favoriter';

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
  String get favoritesAddToSavedMedia => 'Lägg till i sparat media';

  @override
  String get favoritesRemoveFromSavedMedia => 'Ta bort från sparade media';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Lägg till i URL-baserade GIF-favoriter';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Ta bort från URL-baserade GIF-favoriter';

  @override
  String get savedMediaAddTitle => 'Lägg till i sparat media';

  @override
  String get savedMediaFormNameLabel => 'Namn';

  @override
  String get savedMediaFormNameHint => 'Min fantastiska media';

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
  String get messagesMediaMediaGroupTitle => 'Media';

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
      'Nya communities du går med i kommer automatiskt att ha tystade kanaler dolda. Vill du även tillämpa denna inställning på alla dina befintliga communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Sluta dölja tystade kanaler som standard?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Nya communities du går med i kommer inte längre att ha tystade kanaler dolda automatiskt. Vill du även visa tystade kanaler i alla dina befintliga communities?';

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
    return 'När de laddas upp direkt till $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Länkförhandsvisningar';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Styr hur webbplatslänkar förhandsgranskas i chatt';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Visa inbäddningar och förhandsgranska webbplatslänkar';

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
      'Visa spoilerinnehåll när du klickar';

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
      'Skicka automatiskt GIF-filer när de valts';

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
      'Visa standard-emojis i autokomplettering av uttryck';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Visa anpassade emojis i autokomplettering av uttryck';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Visa klistermärken i autokomplettering av uttryck';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Visa sparade medier i autokomplettering av uttryck';

  @override
  String get messagesMediaEditingSectionTitle => 'Redigering av meddelanden';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Styr vad som händer med ditt utkast när du avbryter.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Behåll utkast vid avbrytande';

  @override
  String get accessibilitySaturationTitle => 'Mättnad';

  @override
  String get accessibilitySaturationDescription =>
      'Justera hur livfulla temafärger visas i hela appen.';

  @override
  String get accessibilityVisualGroupTitle => 'Visuellt';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Alltid understrukna länkar';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Tona ned genomstruken text';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Förhandsgranskning av DM-meddelanden';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Styr när meddelandeförhandsgranskningar visas i DM-listan.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM-meddelandeförhandsgranskningsläge';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Alla meddelanden';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Visa meddelandeförhandsgranskningar för alla DM-konversationer';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Endast olästa DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Visa endast meddelandeförhandsgranskningar för DM med olästa meddelanden';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ingen';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Visa inga meddelandeförhandsgranskningar i DM-listan';

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
      'Låt skärmläsare meddela nya meddelanden när de kommer in i den öppna kanalen. Notifikationsljud påverkas inte.';

  @override
  String get accessibilityTtsGroupTitle => 'Text till tal';

  @override
  String get accessibilityTtsGroupDescription =>
      'Välj hastighet för talat text.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Uppspelningshastighet för tal';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Spela upp exempel';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Tysta exempel';

  @override
  String get accessibilityPreviewButtonLabel => 'Förhandsgranska-knapp';

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
  String get accessibilityGifDefaultsOffOnMobile =>
      'Standardinställningen är av på mobila enheter för att spara batteri och data.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animeringar för stickers';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Inställningar för animerade stickers';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Animera alltid';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Dekaler kommer alltid att animeras';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animera vid interaktion';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Klistermärken animeras när du trycker på dem';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Dekaler animeras när du håller muspekaren över dem eller interagerar med dem';

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
      'Animerade emojier, GIF:ar och dekaler är under din kontroll på fliken Animering.';

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
  String get ttsSubstitutionSpoiler => 'dold';

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
    return 'Svarar $replyAuthorName, $authorName sa: $formatted';
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
      'Gör ingenting, jag vill inte ansluta';

  @override
  String get voiceJoinFailedTitle => 'Kunde inte ansluta till röstsamtal';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Kunde inte koppla från dina andra enheter. Försök igen om en stund.';

  @override
  String get voiceChannelEmptyDescription =>
      'Det här är en röstkanal. Anslut för att börja prata!';

  @override
  String get voiceChannelJoin => 'Gå med i röstkanalen';

  @override
  String get voiceCallJoin => 'Gå med i samtalet';

  @override
  String get voiceChannelJoinConnect => 'Anslut till röst';

  @override
  String get voiceChannelNoConnectPermission =>
      'Du har inte behörighet att ansluta till den här röstkanalen';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon-, kamera- och skärmdelningsinnehåll är end-to-end-krypterat.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon-, kamera- och skärmdelningsinnehåll är end-to-end-krypterat.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end-kryptering är inte tillgänglig eftersom en inkompatibel deltagare finns i den här röstkanalen.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end-kryptering är inte tillgänglig eftersom en inkompatibel deltagare finns i det här samtalet.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Den här klienten måste uppdateras innan du ansluter till det här krypterade samtalet.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Kunde inte starta din mikrofon. Du är fortfarande med i samtalet.';

  @override
  String get voiceChannelStatusConnecting => 'Ansluter...';

  @override
  String get voiceChannelStatusConnected => 'Ansluten';

  @override
  String get voiceChannelStatusError => 'Fel';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobil enhet';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Datorenhet';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Tystad av communityn';

  @override
  String get voiceParticipantTooltipMuted => 'Tystad';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Döv av communityn';

  @override
  String get voiceParticipantTooltipDeafened => 'Döv';

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
  String get voiceControlDeafen => 'Gör döv';

  @override
  String get voiceControlUndeafen => 'Sluta göra döv';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Byt kamera';

  @override
  String get voiceControlScreenShare => 'Skärmdelning';

  @override
  String get voiceScreenShareNotificationText => 'Delar din skärm.';

  @override
  String get voiceControlMore => 'Mer';

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
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => 'Stäng av mikrofonen';

  @override
  String get userAreaUnmuteMicrophone => 'Slå på mikrofonljudet';

  @override
  String get userAreaUserSettings => 'Användarinställningar';

  @override
  String get voiceParticipantMenuViewProfile => 'Visa profil';

  @override
  String get voiceParticipantMenuFocus => 'Fokusera på den här personen';

  @override
  String get voiceParticipantMenuUnfocus => 'Avfokusera';

  @override
  String get voiceParticipantMenuCommunityMute => 'Stäng av i community';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Gör döv i community';

  @override
  String get voiceParticipantMenuUserVolume => 'Användarvolym';

  @override
  String get voiceParticipantMenuStreamVolume => 'Streamvolym';

  @override
  String get voiceParticipantMenuStopStreaming => 'Sluta streama';

  @override
  String get voiceParticipantModerationFailed =>
      'Kunde inte uppdatera medlemmen. Försök igen.';

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
      other: '# olästa meddelanden',
      one: '# oläst meddelande',
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
  String get voiceWatchStream => 'Titta på ström';

  @override
  String get voiceStopWatching => 'Sluta titta';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Sluta titta på den aktuella strömmen';

  @override
  String get voiceOwnScreenShareTitle => 'Du sänder';

  @override
  String get voiceOwnScreenShareSubtitle => 'Din ström är live för deltagarna.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Visa samtal';

  @override
  String get dmVoiceCallFullScreen => 'Helskärm';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Öppna samtalet i helskärm';

  @override
  String get dmVoiceStripStatusConnecting => 'Ansluter...';

  @override
  String get dmVoiceStripStatusInCall => 'I samtal';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Röstsamtal';

  @override
  String get dmVoiceCallBarConnecting => 'Ansluter...';

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
      'Inkludera alla community-omnämnden';

  @override
  String get notificationsNoUnreadTitle => 'Inga olästa meddelanden';

  @override
  String get notificationsNoUnreadBody => 'Du är ikapp.';

  @override
  String get notificationsNoMentionsTitle => 'Inga nyligen omnämnda';

  @override
  String get notificationsNoMentionsBody =>
      'Alla @omnämnden av dig visas här i 7 dagar.';

  @override
  String get notificationsMentionsEndTitle => 'Du har nått slutet';

  @override
  String get notificationsMentionsEndBody =>
      'Du har sett alla dina senaste omnämnanden. Oroa dig inte, fler kommer att dyka upp här snart.';

  @override
  String get notificationsJump => 'Hoppa';

  @override
  String get notificationsRemoveMentionTooltip => 'Ta bort omnämnande';

  @override
  String get notificationsViewAllUnread => 'Visa alla olästa';

  @override
  String get notificationsMarkAsRead => 'Markera som läst';

  @override
  String get notificationsExpand => 'Expandera';

  @override
  String get notificationsCollapse => 'Fäll ihop';

  @override
  String get notificationsMessageUnavailable =>
      'Detta meddelande kunde inte laddas.';

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
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Ditt meddelande kunde inte levereras. Detta beror oftast på att du inte delar en community med mottagaren eller att mottagaren endast accepterar direktmeddelanden från vänner. Du kan också behöva justera dina egna inställningar för direktmeddelanden i $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Ditt meddelande kunde inte levereras. Du måste göra anspråk på ditt konto för att skicka direktmeddelanden.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Ditt meddelande kunde inte levereras. Du måste göra anspråk på ditt konto för att skicka meddelanden.';

  @override
  String get chatSendFailureContentBlocked =>
      'Ditt meddelande kunde inte levereras eftersom det flaggades av våra säkerhetssystem. Om du tror att detta är ett misstag, vänligen kontakta support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Ditt meddelande kunde inte levereras eftersom det innehåller mogna emoji eller klistermärken som inte är tillåtna i detta sammanhang.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Endast du kan se detta meddelande.';

  @override
  String get chatClientSystemDismiss => 'Avfärda';

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
      'Vänner och alla communityn';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Din fullständiga profil är synlig för vänner och alla i dina communityn';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Endast vänner och små communityn';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Din fullständiga profil är synlig för vänner och medlemmar i dina communityn med 200 eller färre medlemmar';

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
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Tillåt vem som helst att skicka vänförfrågningar till dig';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Vänner till vänner';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Tillåt vänner till dina vänner att skicka dig förfrågningar';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Medlemmar i communityn';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Tillåt medlemmar från communities du är med i att skicka dig förfrågningar';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direktmeddelanden';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Tillåt direktmeddelanden från communitymedlemmar';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Tillåt medlemmar från grupper du är med i att skicka direktmeddelanden till dig';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Tillåt direktmeddelanden från community-botar';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Tillåt botar från communities du är med i att skicka direktmeddelanden till dig';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Kontrollera vem som kan skicka vänförfrågningar och direktmeddelanden till dig';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Styr vem som kan ringa dig och lägga till dig i gruppchattar';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Inkommande samtal';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Bestäm vem som kan ringa dig';

  @override
  String get privacyDashboardAllowedCallers => 'Tillåtna anropare';

  @override
  String get privacyDashboardIncomingCallNobody => 'Ingen';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blockera alla inkommande samtal';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Endast vänner';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Tillåt endast vänner att ringa dig (rekommenderas)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Vänner + Anpassad';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Tillåt vänner plus ytterligare grupper du väljer';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Alla';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Tillåt vem som helst att ringa dig, även främlingar';

  @override
  String get privacyDashboardAdditionalGroups => 'Ytterligare grupper';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Personer som är vänner med dina vänner kan ringa dig';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Personer från gemenskaper som ni båda är med i kan ringa dig';

  @override
  String get privacyDashboardRingBehavior => 'Ringbeteende';

  @override
  String get privacyDashboardSilentCalls => 'Tysta samtal från alla';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Alla samtal meddelar tyst istället för att ringa. Som standard är samtal från icke-vänner alltid tysta.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Vem kan lägga till dig i gruppchattar';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Bestäm vem som kan lägga till dig i gruppchattar utan att fråga. Vem som helst kan fortfarande skicka inbjudningslänkar till dig.';

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
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Personer som är vänner med dina vänner kan lägga till dig i gruppchattar';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Personer från gemenskaper ni båda är med i kan lägga till dig i gruppchattar';

  @override
  String get privacyDashboardVoiceActivityTitle => 'Röstaktivitet i aktiv nu';

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
      'Tar bort meddelanden du har skickat i direktmeddelanden, gruppdirektmeddelanden och communityn permanent. Arbetet körs i bakgrunden och du får ett direktmeddelande när det är klart.';

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
      'Vill du även tillåta direktmeddelanden från medlemmar i dina befintliga communityn?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Vill du även blockera direktmeddelanden från medlemmar i dina befintliga communityn?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Vill du även tillåta botar från dina befintliga communityn att skicka direktmeddelanden till dig?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Vill du även blockera botar från dina befintliga grupper?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Du kan också ändra den här inställningen per community genom att långtrycka på communitynamnet och välja Sekretessinställningar.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Tillåt för alla grupper';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Blockera för alla grupper';

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
      'Välj vilka konversationstyper, communityn och tidsramar som ska inkluderas i arkivet.';

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
      'Radera endast meddelanden från communityn och grupp-DM:ar som du har lämnat eller blivit borttagen från.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Vilka konversationer';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Välj vilka typer av konversationer du vill inkludera.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Öppna direktmeddelanden';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Stängda direktmeddelanden';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Grupp-DM';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Grupper';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Vilka communityn';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Communityfilter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Inkludera alla utom valda';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Endast de valda';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Du är inte med i några communityn just nu.';

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
      'Lämna något fält tomt för att lämna den änden av fönstret obegränsad.';

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
  String get privacyDashboardDataRequestSummaryCommunities => 'Grupper';

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
      other: '# communities',
      one: '# community',
    );
    return 'Alla utom $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communities',
      one: '# community',
    );
    return 'Endast $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Öppna direktmeddelanden';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Stängda direktmeddelanden';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Direktmeddelanden (öppna och stängda)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Grupp-DM';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded => 'Grupper';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# timmar',
      one: '# timme',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuter',
      one: '# minut',
    );
    return '$_temp0 och $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# timmar',
      one: '# timme',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuter',
      one: '# minut',
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
  String get chatMessageEdit => 'Redigera meddelande';

  @override
  String get chatMessageReply => 'Svara';

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
  String get forwardFailed => 'Kunde inte vidarebefordra meddelande';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Kommentarer är otillgängliga eftersom en vald kanal har långsamt läge aktiverat.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Väntar på att slowmode ska upphöra i en eller flera valda kanaler.';

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
      'Att skicka meddelanden är inaktiverat i denna community';

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
  String get chatMessageStopSpeaking => 'Sluta prata';

  @override
  String get chatMessagePin => 'Fäst meddelande';

  @override
  String get chatMessageUnpin => 'Ta bort fästning från meddelande';

  @override
  String get chatMessageUnpinIt => 'Ta bort fästning';

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
  String get chatReactionsSheetEmpty => 'Ingen har reagerat på detta än.';

  @override
  String get chatReactionAddFailed => 'Kunde inte lägga till reaktion';

  @override
  String get chatReactionRemoveFailed => 'Kunde inte ta bort reaktion';

  @override
  String get chatMessageReport => 'Anmäl meddelande';

  @override
  String get iarReportMessageTitle => 'Anmäl meddelande';

  @override
  String get iarThisUserFallback => 'denna användare';

  @override
  String get iarModalDescription =>
      'Anmäl ett regelbrott, eller hitta verktyg för att hantera kontakter och preferenser.';

  @override
  String get iarPathStepAriaLabel => 'Vad behöver du?';

  @override
  String get iarCategoryStepTitle => 'Vilken typ av regel bröts?';

  @override
  String get iarReasonStepTitle => 'Vilken regel bröts?';

  @override
  String get iarReasonSelectHint => 'Välj en anledning';

  @override
  String get iarPickAnOptionToast => 'Välj ett alternativ för att fortsätta.';

  @override
  String get iarPickARuleToast => 'Välj den regel som bröts.';

  @override
  String get iarPathPlatform => 'Anmäl ett brott mot plattformsregler';

  @override
  String get iarPathCommunity => 'Anmäl till moderatorerna i denna community';

  @override
  String get iarPathPreferenceMessage => 'Jag gillar inte det här innehållet';

  @override
  String get iarCategoryTargetedHarmLabel => 'Hot, trakasserier eller skada';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Mobbing, hot, hat, våld, räder eller innehåll som uppmuntrar till självskada.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Barnsäkerhet eller moget innehåll';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Minderåriga i riskzonen, moget innehåll på fel plats eller oönskat beteende.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Integritet eller utgivning för annan';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, stalking, utge sig för att vara någon annan eller en olämplig profil.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Bedrägerier, skadlig kod eller desinformation';

  @override
  String get iarCategoryDeceptionDescription =>
      'Nätfiske, bedrägeri, skadliga länkar eller falska påståenden som sannolikt orsakar verklig skada.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Olaglig aktivitet eller något annat';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Olaglig försäljning, underlättande av brott eller ett tydligt regelbrott som inte passar ovan.';

  @override
  String get iarReasonHarassmentLabel => 'Trakasserier eller hot';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Mobbing, upprepad oönskad kontakt, stalking eller riktade övergrepp.';

  @override
  String get iarReasonHateLabel => 'Hatpropaganda';

  @override
  String get iarReasonHateMessageDescription =>
      'Nedsättande ord, avhumaniserande språk eller attacker mot skyddade grupper.';

  @override
  String get iarReasonViolenceLabel => 'Våld eller våldsamma hot';

  @override
  String get iarReasonViolenceDescription =>
      'Trovärdiga hot, grafiskt våld eller glorifiering av våld.';

  @override
  String get iarReasonMatureContentLabel => 'Moget innehåll eller trakasserier';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Oönskat beteende eller moget innehåll på fel plats.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Barnsäkerhet eller utnyttjande av minderåriga';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Innehåll som rör grooming eller utnyttjande av barn.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Skadlig desinformation';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Falska påståenden som sannolikt orsakar verklig skada.';

  @override
  String get iarReasonSpamLabel => 'Spam, bedrägerier eller nätfiske';

  @override
  String get iarReasonSpamMessageDescription =>
      'Mass-spam, bedrägeri, falska utlottningar eller missbruk av konton.';

  @override
  String get iarReasonMalwareLabel => 'Skadlig kod eller farliga länkar';

  @override
  String get iarReasonMalwareDescription =>
      'Skadlig kod, stöld av inloggningsuppgifter eller skadliga filer.';

  @override
  String get iarReasonPrivacyLabel => 'Integritetsintrång';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, avslöjad privat information eller stalking.';

  @override
  String get iarReasonImpersonationLabel =>
      'Utgivning för annan eller vilseledande media';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Utge sig för att vara någon annan, inklusive vilseledande AI-genererat innehåll.';

  @override
  String get iarReasonIllegalLabel => 'Olaglig aktivitet';

  @override
  String get iarReasonIllegalDescription =>
      'Olaglig försäljning, underlättande av brott eller olaglig verksamhet.';

  @override
  String get iarReasonSelfHarmLabel => 'Självskada eller självmord';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Uppmuntran eller instruktioner som uppmuntrar till självskada eller ätstörningar.';

  @override
  String get iarReasonOtherLabel => 'Annat tydligt regelbrott';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Använd endast om det tydligt bryter mot $productName regler och inte passar ovan.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Om en minderårig är inblandad, använd \"$childSafetyReason\" istället.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Om detta involverar CSAM eller utnyttjande av en minderårig, skicka det nu och dela inte materialet igen.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Om någon kan vara i omedelbar fara, kontakta lokala räddningstjänster om du kan göra det säkert.';

  @override
  String get iarSafetyNoteViolence =>
      'Om detta är ett trovärdigt omedelbart hot, kontakta även lokala räddningstjänster.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Om detta är ett omedelbart terroristiskt hot, kontakta även lokala räddningstjänster.';

  @override
  String get iarActionBlockUserTitle => 'Blockera den här användaren';

  @override
  String get iarActionBlockUserDescription =>
      'Stoppa meddelanden och vänförfrågningar.';

  @override
  String get iarActionBlockUserButton => 'Blockera';

  @override
  String get iarActionCopyMessageLinkTitle => 'Kopiera meddelandelänk';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Dela med community-moderatorer.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopiera';

  @override
  String get iarActionCloseDmTitle => 'Stäng den här DM:en';

  @override
  String get iarActionCloseDmDescription =>
      'Blockerar inte. Du kan öppna igen senare.';

  @override
  String get iarActionCloseDmButton => 'Stäng DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Lämna communityn';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Sluta se dess innehåll och medlemmar.';

  @override
  String get iarActionLeaveCommunityButton => 'Lämna';

  @override
  String get iarActionDmSettingsTitle => 'DM- och vänförfrågningsinställningar';

  @override
  String get iarActionDmSettingsDescription =>
      'Ändra vem som kan kontakta dig.';

  @override
  String get iarActionCallSettingsTitle =>
      'Samtals- och gruppchattinställningar';

  @override
  String get iarActionCallSettingsDescription =>
      'Ändra vem som kan ringa eller lägga till dig.';

  @override
  String get iarActionOpenButton => 'Öppna';

  @override
  String get iarActionDeleteMessageTitle => 'Ta bort detta meddelande';

  @override
  String get iarActionDeleteMessageDescription =>
      'Ta bort det från kanalen för alla.';

  @override
  String get iarActionDeleteMessageButton => 'Ta bort';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Borttaget';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Det här meddelandet har redan tagits bort.';

  @override
  String get iarActionBanUserTitle => 'Blockera den här användaren';

  @override
  String get iarActionBanUserDescription =>
      'Öppna blockeringsdialogen för den här communityn.';

  @override
  String get iarActionBanUserButton => 'Blockera';

  @override
  String get iarActionBanUserBannedButton => 'Blockerad';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Den här användaren är redan blockerad från communityn.';

  @override
  String get iarCloseDmConfirmTitle => 'Stäng DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Stäng din nuvarande DM med $name. Detta blockerar dem inte; du kan öppna igen senare.';
  }

  @override
  String get iarSuccessTitle => 'Rapport skickad';

  @override
  String get iarSuccessBody =>
      'Vårt säkerhetsteam granskar den. Vi skickar dig en DM och ett e-postmeddelande när vi har nått en dom.';

  @override
  String get iarAlreadyReportedTitle => 'Redan rapporterad';

  @override
  String get iarAlreadyReportedBody =>
      'Du har redan rapporterat det här meddelandet. Vårt säkerhetsteam granskar det.';

  @override
  String get iarBackButton => 'Tillbaka';

  @override
  String get iarContinueButton => 'Fortsätt';

  @override
  String get iarSendReportButton => 'Skicka rapport';

  @override
  String get iarDoneButton => 'Klar';

  @override
  String get iarCouldntSendToast => 'Kunde inte skicka rapporten. Försök igen.';

  @override
  String get iarRateLimitedToast =>
      'Du rapporterar för snabbt. Vänligen vänta en stund och försök igen.';

  @override
  String get iarReportSentToast =>
      'Rapport skickad. Vårt säkerhetsteam kommer att granska den.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Blockera $name? De kommer inte att kunna skicka meddelanden till dig eller skicka vänförfrågningar. Du kan avblockera dem senare.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Kunde inte blockera den här användaren. Försök igen.';

  @override
  String get iarCloseDmSuccessToast => 'DM stängd.';

  @override
  String get iarCloseDmFailedToast =>
      'Kunde inte stänga den här DM:en. Försök igen.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Kunde inte lämna den här communityn. Försök igen.';

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
  String get chatMessageEditAttachmentAltText => 'Redigera alternativtext';

  @override
  String get chatMessageMore => 'Mer';

  @override
  String get chatEditingMessage => 'Redigerar meddelande';

  @override
  String get chatReplyOriginalDeleted => 'Originalmeddelandet raderades';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Originalmeddelandet kunde inte laddas';

  @override
  String get chatReplyAttachedMedia => 'Meddelandet innehåller bifogad media';

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
  String get chatReplyMentionOverrideTitle => 'Åsidosätt omnämnandepreferens?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname föredrar att bli @omnämnd vid svar. Skicka ändå utan omnämnande?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname föredrar svar utan @omnämnande. Skicka med omnämnande ändå?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorera preferens';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klicka för att inaktivera pingning av användaren du svarar på.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klicka för att aktivera pingning av användaren du svarar på.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Omnämn svarande användare';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Avbryt svar';

  @override
  String get chatEditMessageHint => 'Redigera meddelande';

  @override
  String get chatEditNoChanges => 'Inga ändringar att spara';

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
  String get mediaViewerClose => 'Stäng medievisare';

  @override
  String get mediaViewerOpenInBrowser => 'Öppna i webbläsare';

  @override
  String get mediaViewerOptions => 'Alternativ för media';

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
  String get chatAttachmentVideoProgress => 'Video-framsteg';

  @override
  String get chatVideoPlaybackFailed => 'Kunde inte spela upp den här videon.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Meddela användare med den här rollen som har behörighet att visa den här kanalen.';

  @override
  String get composerAutocompleteSuggestions => 'Förslag';

  @override
  String get composerAutocompleteCommandsHeading => 'Kommandon';

  @override
  String get composerAutocompleteChoicesHeading => 'Val';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => 'Valfria argument';

  @override
  String get composerAutocompleteChannelsHeading => 'Kanaler';

  @override
  String get composerAutocompleteMembersHeading => 'Medlemmar';

  @override
  String get composerAutocompleteUsersHeading => 'Användare';

  @override
  String get composerAutocompleteMentionsHeading => 'Omnämningar';

  @override
  String get composerAutocompleteRolesHeading => 'Roller';

  @override
  String get composerAutocompleteMediaHeading => 'Media';

  @override
  String get composerAutocompleteStickersHeading => 'Klistermärken';

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
      'Ändra ditt smeknamn i den här gruppen.';

  @override
  String get composerCommandKickDescription =>
      'Sparka en medlem från den här gruppen.';

  @override
  String get composerCommandBanDescription =>
      'Banna en medlem från den här gruppen.';

  @override
  String get composerCommandMsgDescription =>
      'Skicka ett direktmeddelande till en användare.';

  @override
  String get composerCommandSavedDescription => 'Skicka en sparad mediafil.';

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
  String get composerCommandDeleteMessagesNone => 'Ta bort inga';

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
  String get addGuildJoinCommunity => 'Gå med i community';

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
  String get addGuildJoinSubmit => 'Gå med i community';

  @override
  String get addGuildInviteInvalid =>
      'Den här inbjudan är ogiltig eller har gått ut.';

  @override
  String get addGuildJoinFailed =>
      'Kunde inte gå med i communityn. Försök igen.';

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
  String get addGuildCreateClaimTitle => 'Gör anspråk på ditt konto';

  @override
  String get addGuildCreateClaimDescription =>
      'Du måste bekräfta ditt konto innan du kan skapa en community.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifiera din e-postadress';

  @override
  String get addGuildCreateVerifyDescription =>
      'Du måste verifiera din e-postadress innan du kan skapa en community.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animerede ikoner stöds inte när du skapar ett nytt community. Använd en statisk bild.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Genom att skapa en community godkänner du att följa och upprätthålla ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName community guidelines';
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
  String get addGuildPackInstalled => 'Paketet installerades lyckat.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Ta bort alla reaktioner';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Är du säker på att du vill ta bort alla reaktioner från det här meddelandet?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Ta bort nål från meddelande';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Skicka tillbaka det här nålade meddelandet i tiden?';

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
  String get channelSettingsCategorySettingsTitle => 'Kategorinställningar';

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
  String get categoryExpandCategory => 'Utöka kategori';

  @override
  String get categoryCollapseCategory => 'Fäll ihop kategori';

  @override
  String get categoryExpandAllCategories => 'Visa alla kategorier';

  @override
  String get categoryCollapseAllCategories => 'Fäll ihop alla kategorier';

  @override
  String get categoryMuteCategory => 'Tysta kategori';

  @override
  String get categoryUnmuteCategory => 'Slå på ljud för kategori';

  @override
  String get categoryCopyCategoryId => 'Kopiera kategori-ID';

  @override
  String get categoryIdCopied => 'Kategori-ID kopierat';

  @override
  String get channelSettingsChannelNamePlaceholder => 'allmänt';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

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
  String get channelSettingsResetSlider =>
      'Återställ reglaget till standardvärdet';

  @override
  String get channelSettingsAdvanced => 'Avancerat';

  @override
  String get channelSettingsMatureContentOverride => 'Åsidosätt moget innehåll';

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
  String get channelSettingsMatureContentCategorySource => 'kategori';

  @override
  String get channelSettingsMatureContentCommunitySource => 'community';

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
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Du behöver behörigheten \"$manageChannelsPermissionLabel\" för att redigera dessa behörigheter.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Du behöver behörigheten \"$manageRolesPermissionLabel\" för att redigera dessa behörigheter.';
  }

  @override
  String get channelSettingsUnknownRole => 'Okänd roll';

  @override
  String get channelSettingsUnknownUser => 'Okänd användare';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Åtkomstinställningar';

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
  String get channelSettingsPermissionsRolesAndMembers =>
      'Roller och medlemmar';

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
  String get channelSettingsWebhooksUnknownUser => 'Okänd användare';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Ladda upp bild';

  @override
  String get channelSettingsWebhooksRemove => 'Ta bort';

  @override
  String get channelSettingsWebhooksName => 'Namn';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webbhooksnamn';

  @override
  String get channelSettingsWebhooksChannel => 'Kanal';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook-URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopiera webhooks-URL';

  @override
  String get channelSettingsWebhooksDelete => 'Ta bort webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Kunde inte ta bort den här webhooksändaren';

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
  String get channelMenuResetMatureContentAgreeState =>
      'Återställ överenskommelse om vuxeninnehåll';

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
      'Medlemslistor är tillfälligt otillgängliga i den här gruppen';

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
  String get channelHeaderOpenDetails => 'Öppna kanaldetaljer';

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
  String get channelDetailsSearchHint => 'Sök i meddelanden';

  @override
  String get channelDetailsSearchFilterFrom => 'Från';

  @override
  String get channelDetailsSearchFilterHas => 'Har';

  @override
  String get channelDetailsSearchFilterIn => 'I';

  @override
  String get channelDetailsSearchFilterMentions => 'Omnämningar';

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
  String get channelDetailsMembersOnline => 'Tillgänglig';

  @override
  String get channelDetailsMembersOffline => 'Inaktiv';

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
  String get channelDetailsJumpToMessage => 'Hoppa till meddelande';

  @override
  String get channelDetailsUnpinMessage => 'Ta bort nål från meddelande';

  @override
  String get channelDetailsCopyMessageLink => 'Kopiera länken till meddelandet';

  @override
  String get channelDetailsCopyMessageId => 'Kopiera meddelande-ID';

  @override
  String get channelDetailsMessageUnpinned =>
      'Meddelande borttaget från konversationen';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Nuvarande community';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Nuvarande DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Alla communities';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Endast DM';

  @override
  String get channelDetailsSearchScopeAllDms => 'Alla direktmeddelanden';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Endast öppna DM';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Öppna direktmeddelanden';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Alla DM + Communities';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Öppna direktmeddelanden + Communities';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Sök bara i den aktuella communityn';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Sök bara i den här chatten';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'I alla dina communities';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Endast i alla DMs du någonsin varit med i';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'I alla DM du någonsin har varit med i';

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
  String get channelDetailsSearchSortNewest => 'Nyaste först';

  @override
  String get channelDetailsSearchSortOldest => 'Äldst först';

  @override
  String get channelDetailsSearchSortRelevance => 'Mest relevanta';

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
  String get channelDetailsSearchContentVideo => 'Videoöverföring';

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
  String get channelDetailsSearchContentSticker => 'Dekal';

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
      'Alla uppladdade bilagor';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Skrev URL i meddelandetexten';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Lösta förhandsvisningar och rika inbäddningar, inte uppladdningar';

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
  String get groupDmEditDetailsTooltip => 'Redigera gruppinformation';

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
      'Animerede ikoner stöds inte. Använd en statisk bild.';

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
  String get groupDmCouldntProcessImage => 'Kunde inte bearbeta bilden';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Det gick inte att bearbeta den beskurna bilden. Försök igen.';

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
  String get groupDmAddFailed => 'Kunde inte lägga till i grupp';

  @override
  String get groupDmGroupFull =>
      'Den här gruppen är full. Ta bort någon innan du lägger till fler personer.';

  @override
  String get groupDmRateLimited =>
      'Du går för snabbt. Vänta ett ögonblick och försök igen.';

  @override
  String get groupDmCreateInviteFailed => 'Kunde inte skapa inbjudningslänk';

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
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Skapa av inbjudningar är tillfälligt inaktiverat för den här communityn.';

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
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Skapad av $name. Går ut om $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Välkommen till $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'I början fanns ingenting. Sedan kom $channelName. Och det var bra.';
  }

  @override
  String get personalNotesComposerHint =>
      'Skicka ett meddelande till dig själv';

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
  String get userSettingsGroupYourAccount => 'DITT KONTO';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Sök i inställningar...';

  @override
  String get userSettingsSearchFieldLabel => 'Sök inställningar';

  @override
  String get userSettingsSearchClear => 'Rensa sökning';

  @override
  String get userSettingsSearchNoResults => 'Inga inställningar hittades';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Säkerhet och inloggning';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Gåvor';

  @override
  String get giftSettingsClaimAccountTitle => 'Gör anspråk på ditt konto';

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
  String get giftSettingsGiftUrlCopied => 'Presentlänk kopierad till urklipp!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Kunde inte kopiera presentlänk';

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
  String get premiumMostPopular => 'Mest populär';

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
  String premiumMonthlyPrice(String price) {
    return 'Månadsvis $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Årligen $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 år $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 månad $price';
  }

  @override
  String get premiumManageSubscription => 'Hantera prenumeration';

  @override
  String get premiumRedeemGiftCode => 'Lös in presentkod';

  @override
  String get premiumGiftBadge => 'Gåva';

  @override
  String get premiumCancelSubscriptionTitle => 'Avbryta prenumerationen?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Du behåller dina förmåner fram till nästa förnyelsedatum och har sedan en respitperiod på 3 dagar för att återuppta din prenumeration och behålla din prenumerationshistorik.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Avbryt prenumeration';

  @override
  String get premiumKeepSubscription => 'Behåll prenumerationen';

  @override
  String get premiumPurchaseHistoryTitle => 'Köphistorik';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Dina senaste fakturor. För att ändra betalningsmetod för din prenumeration, lägg till eller välj en i faktureringsportalen och gör den till standard.';

  @override
  String get premiumManagePaymentMethods => 'Hantera betalningsmetoder';

  @override
  String get premiumBillingHistory => 'Faktureringshistorik';

  @override
  String get premiumSelfServeRefundTitle => 'Självbetjäningsåterbetalning';

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
  String get premiumComparisonFeatureColumn => 'Funktion';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Genom att köpa godkänner du våra $terms och $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Självbetjäningsåterbetalningar är tillgängliga inom 3 dagar efter betalning, en gång var 30:e dag. En återbetalning av en prenumeration avbryter den. Köpare inom EU/EES avsäger sig den 14-dagars ångerrätten vid utcheckning för att få omedelbar tillgång till innehållet. Använd återbetalningsknappen i appen istället för en chargeback. Chargebacks kan permanent begränsa ditt konto. Stripe hanterar betalningar säkert. Vi ser aldrig ditt fullständiga kortnummer.';

  @override
  String get premiumTermsOfService => 'Användarvillkor';

  @override
  String get premiumPrivacyPolicy => 'Integritetspolicy';

  @override
  String get premiumCheckoutStartFailedTitle => 'Kunde inte starta betalning';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Något gick fel när du försökte starta utcheckningen. Försök igen om en liten stund.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Du har för närvarande en presentprenumeration. Den förnyas inte. Du kan lösa in fler presentkoder för att förlänga den. Återkommande prenumerationer kan startas när din presenttid löper ut.';

  @override
  String get premiumPlanUnavailable =>
      'Den här planen är inte tillgänglig. Kontakta supporten.';

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
  String get premiumAlreadyVisionaryTitle => 'Du är redan Visionär';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary inkluderar redan permanent åtkomst, så en återkommande prenumeration behövs inte. Du kan fortfarande köpa presenter till andra.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abonnemanget finns redan';

  @override
  String get premiumExistingSubscriptionBody =>
      'Vi hittade en befintlig Fluxer Plutonium-prenumeration för det här kontot. Hantera den i den säkra faktureringsportalen för att uppdatera betalningsuppgifter eller kontrollera förnyelsestatus. Om du precis betalade, vänta en minut och öppna sidan igen.';

  @override
  String get premiumPurchasesDisabledTitle => 'Köp är inte tillgängliga';

  @override
  String get premiumPurchasesDisabledBody =>
      'Köp är inaktiverade för det här kontot. Kontakta support@fluxer.app om detta verkar fel.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Hämta ditt konto för att köpa Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Du behöver verifiera din e-postadress innan du kan köpa Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Anpassad användartagg';

  @override
  String get premiumPerkPerCommunityProfiles => 'Profiler per community';

  @override
  String get premiumPerkMessageScheduling => 'Schemalägg meddelande';

  @override
  String get premiumPerkProfileBadge => 'Profilmärke';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Anpassade videobakgrunder';

  @override
  String get premiumPerkEntranceSounds => 'Ljud vid inträde';

  @override
  String get premiumPerkCommunities => 'Grupper';

  @override
  String get premiumPerkMessageCharacterLimit => 'Teckengräns för meddelanden';

  @override
  String get premiumPerkBookmarkedMessages => 'Bokmärkta meddelanden';

  @override
  String get premiumPerkFileUploadSize => 'Filstorlek för uppladdning';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji- och paketklistermärken';

  @override
  String get premiumPerkSavedMedia => 'Sparad media';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Använd animerade emojier';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Global åtkomst till emoji och dekaler';

  @override
  String get premiumPerkVideoQuality => 'Videokvalitet';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animerade avatarer och profilbanners';

  @override
  String get premiumPerkEarlyAccess => 'Tidig tillgång till nya funktioner';

  @override
  String get premiumPerkCustomThemes => 'Anpassade teman';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Upp till 4K/60 fps';

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
  String get userSettingsNavChat => 'Meddelanden och media';

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
      'Rekommenderas. Rensar upp din mikrofon för tydligt tal.';

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
      'Automatisk förstärkningskontroll';

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
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName behöver mikrofonåtkomst för att testa din inmatning.';
  }

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
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p och 60 FPS kräver $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Den här instansen tillåter för närvarande skärmdelning upp till 720p vid 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName behöver mikrofonåtkomst för att visa dina enheter.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName behöver åtkomst till kameran för att visa dina enheter.';
  }

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
  String get notificationsEnableNotificationsLabel => 'Aktivera notiser';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Få aviseringar när du får meddelanden. Du kan behöva tillåta aviseringar för $productName i enhetens inställningar. För kontroll per kanal/community, öppna aviseringsinställningarna från en communitys meny.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Aktivera skrivbordsaviseringar';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Använder operativsystemets notiscenter. För inställningar per kanal/community, högerklicka på en community-ikon och öppna notisinställningarna.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Aktivera webbläsaraviseringar';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Få aviseringar när du får meddelanden. Du kan behöva tillåta aviseringar i webbläsarens inställningar. För aviseringar per kanal/community, högerklicka på en community-ikon och öppna aviseringsinställningarna.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Tidsgräns för inaktiva push-aviseringar';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName undviker att skicka pushnotiser till dina mobila enheter när du använder datorn. Välj hur länge du behöver vara inaktiv på datorn innan du börjar få pushnotiser igen.';
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
  String get notificationsMentionPreferMentionName => 'Föredra @omnämnande';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Standardinställningen är att svara på @omnämnanden och varna avsändaren om de inaktiverar det';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Föredra inga @omnämnanden';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Svar utelämnar som standard @omnämnandet och varnar avsändaren om de aktiverar det';

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
      'Berättar bara om kanalen du tittar på. Berättarrösten följer dig mellan kanaler.';

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
    return 'Aktiva anpassade ljudvolymsinställningar: $overrideCount.';
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
      'Notiser för meddelanden i aktuell kanal';

  @override
  String get notificationsSoundMute => 'Röst avstängd';

  @override
  String get notificationsSoundUnmute => 'Slå på mikrofonen';

  @override
  String get notificationsSoundDeaf => 'Röst avstängd';

  @override
  String get notificationsSoundUndeaf => 'Röst – avaktivera tyst läge';

  @override
  String get notificationsSoundUserJoin => 'Användare går med i kanalen';

  @override
  String get notificationsSoundUserLeave => 'Användaren lämnar kanalen';

  @override
  String get notificationsSoundUserMove => 'Användaren flyttade kanal';

  @override
  String get notificationsSoundViewerJoin => 'Tittare ansluter till stream';

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
  String get userSettingsNavLanguageAndTime => 'Språk och tid';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Gränssnittspråk';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Välj det språk som används i hela appen';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Öppna språkinställningar';

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
  String get languageAndTimeTimeFormat12Hour => '12-timmars';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-timmars';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Appspråk: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Systemets språk: $format';
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
  String get userSettingsNavAdvanced => 'Avancerat';

  @override
  String get advancedPerformanceReportingTitle => 'Prestandarapportering';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Hjälp till att förbättra $productName genom att dela anonyma krasch- och prestandadata.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Skicka krasch- och prestandarapporter';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'All rapporterad data är anonym och skickas endast till $productName egen övervakningstjänst – inga tredjepartsleverantörer används.';
  }

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
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Röst';

  @override
  String get advancedSettingsCategoryDeveloper => 'Utvecklare';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Aktivera textmarkering';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Tillåt val av text i appen';

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
      'Tangentbordsgenvägs-tips i verktygstips';

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
      'Bekräftelse eller dubbelklick för att ansluta till röstkanalen';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Kräv dubbelklick för att ansluta till röstkanaler';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Bekräfta innan du går med i röstkanaler';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Skicka GIF automatiskt när vald';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Skicka GIF:ar automatiskt från väljaren utan bekräftelse';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Spara GIF-favoriter som sparad media';

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
  String get advancedSettingTrustAllLinksDescription =>
      'Hoppa över varningen för externa länkar för alla domäner';

  @override
  String get advancedSettingSearchEnginesLabel => 'Sökmotorer';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Konfigurera sökmotorer som används från markerad text';

  @override
  String get advancedSettingTranslatorsLabel => 'Översättare';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Konfigurera de översättningsleverantörer som används för den valda texten';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Omvänd bildsökning';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Leverantörer för omvänd bildsökning';

  @override
  String get advancedSettingMessageActionBarLabel => 'Meddelandefält';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Anpassa åtgärdsfältet som visas när du håller muspekaren över meddelanden';

  @override
  String get advancedSettingExpressionAutocompleteLabel => 'Uttrycksifyllning';

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
      'Välj hur du vill att konversationen ska fortsätta efter att du har skickat ett meddelande';

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
      'Dölj kanaler du har tystat från sidopaneler i grupper';

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
      'Visa standard-emojis i förslag för uttryck';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Visa anpassade emojier i förslag för uttryck';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Visa stickers i förslag för uttryck';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Visa sparad media i autofyll för uttryck';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Visa GIF-knapp';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Visa medieknapp';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Visa sticker-knapp';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Visa emoji-knapp';

  @override
  String get advancedSettingShowSendButtonLabel => 'Visa skicka-knapp';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Visa aviseringar för nya enheter';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Prompt för nya ljudenheter';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Volymkontroller för anslutning';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Visa volymreglage för deltagare per enhet i röstmenyer';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Förhandsvisning av skärmdelning';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Förhandsvisning, popup och beteende för strömminiatyrer';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Skärmdelnings-codec';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Videokodarec för skärmdelning';

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
      'Dölj min förhandsgranskningsminiatyr för stream';

  @override
  String get advancedSettingDeveloperModeLabel => 'Aktivera utvecklarläge';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Aktivera utvecklarläge';

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
      'Aktivera eller inaktivera inbyggda leverantörer för omvänd bildsökning. Aktiverade leverantörer visas i snabbmenyn för bilder, avatarer, banderoller, dekaler och emoji.';

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
  String get userSettingsNavApplications => 'Applikationer';

  @override
  String get userSettingsNavAppLogs => 'Apploggar';

  @override
  String get userSettingsNavDeveloperTools => 'Utvecklarverktyg';

  @override
  String get userSettingsNavLimitsConfig => 'Gränser konfiguration';

  @override
  String get userSettingsNavFeatureFlags => 'Funktionsflaggor';

  @override
  String get userSettingsNavWhatsNew => 'Vad är nytt';

  @override
  String get userSettingsJoinFluxerLabs => 'Gå med i Fluxer Labs';

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
  String get quickSwitcherTabSearch => 'Sök';

  @override
  String get quickSwitcherTabFriends => 'Vänner';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Sök efter kanaler, personer eller communities';

  @override
  String get quickSwitcherSearchFriends => 'Sök bland vänner';

  @override
  String get quickSwitcherNoMatchesFound => 'Inga träffar hittades';

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
  String get quickSwitcherSearchAliasSaved => 'Sparade';

  @override
  String get uiClose => 'Stäng';

  @override
  String get chatJumpToBottom => 'Hoppa till botten';

  @override
  String get uiConfirm => 'Bekräfta';

  @override
  String get uiLoading => 'Läser in';

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
  String get uiOpenColorPicker => 'Öppna färgväljare';

  @override
  String get uiSelectPlaceholder => 'Välj';

  @override
  String get uiSearchPlaceholder => 'Sök';

  @override
  String get uiNoOptionsFound => 'Inga alternativ hittades';

  @override
  String get uiDismissNotification => 'Stäng avisering';

  @override
  String get uiColorPickerTitle => 'Färgval';

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
  String get instanceUrlPlaceholder => 'Ange instans-URL (t.ex. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Återställ till Fluxer';

  @override
  String get instanceConnect => 'Anslut';

  @override
  String get instanceConnecting => 'Ansluter…';

  @override
  String get instanceConnectFailed => 'Kunde inte ansluta till instansen';

  @override
  String get recentInstances => 'Senaste instanser';

  @override
  String removeRecentInstance(String domain) {
    return 'Ta bort $domain från senaste instanser';
  }

  @override
  String get instanceSheetTitle => 'Anslut till instans';

  @override
  String get connectToDifferentInstance => 'Anslut till en annan instans';

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
      'Utforska upptäckbara communities';

  @override
  String get discoveryExplore => 'Utforska';

  @override
  String get discoveryExplorePublicCommunities =>
      'Utforska offentliga communities';

  @override
  String get discoveryListingSubheading =>
      'Vill du lista din community här? Ansök om du uppfyller kraven i din communities inställningar > Upptäckt.';

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
  String get discoveryCategoryMoviesAndTv => 'Film och TV';

  @override
  String get discoveryCategoryOther => 'Annat';

  @override
  String get discoveryNoCommunitiesMatch => 'Inga communities matchar.';

  @override
  String get discoveryJoinCommunity => 'Gå med i community';

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
      'Kunde inte gå med i denna community';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Något gick fel. Försök igen om en stund.';

  @override
  String get discoveryJoinErrorFullTitle => 'Denna community är full';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Denna community har nått sitt medlemsgräns, så du kan inte gå med just nu.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Du har nått communitygränsen';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Du är med i det maximala antalet communities. Lämna en och försök igen.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Du kan inte gå med i denna community';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Du har blivit bannlyst från denna community.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Denna community är inte längre tillgänglig';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Den kan ha lämnat upptäckten eller stängt av nya medlemskap. Uppdatera sidan så ser du den inte igen.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Du går för fort';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Vänta en stund och försök igen.';

  @override
  String get guildNavbarAddCommunity => 'Lägg till en community';

  @override
  String get guildNavbarHelp => 'Hjälp';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NYTT MEDDELANDE';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Dölj $folderName';
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
  String get guildFolderShowIconWhenCollapsed => 'Visa ikon när komprimerad';

  @override
  String get guildFolderIconLabel => 'Mappikon';

  @override
  String get guildFolderDelete => 'Ta bort mapp';

  @override
  String get guildFolderIconFolder => 'Mapp';

  @override
  String get guildFolderIconStar => 'Stjärnmärk';

  @override
  String get guildFolderIconHeart => 'Hjärta';

  @override
  String get guildFolderIconBookmark => 'Bokmärk';

  @override
  String get guildFolderIconGameController => 'Spelkontroll';

  @override
  String get guildFolderIconShield => 'Skydda';

  @override
  String get guildFolderIconMusicNote => 'Musiknot';

  @override
  String get guildFolderMarkAsRead => 'Markera mapp som läst';

  @override
  String get guildBulkMuteCommunities => 'Stäng av notiser från grupper';

  @override
  String get guildBulkUnmuteCommunities => 'Sluta tysta grupper';

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
  String get guildBulkEnableMobilePush => 'Aktivera push-notiser i mobilen';

  @override
  String get guildBulkDisableMobilePush =>
      'Inaktivera push-aviseringar på mobilen';

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
  String get guildNavbarGroupDm => 'Gruppchatt';

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
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Välj kanaltyp';

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
  String get guildNavbarSearchFriends => 'Sök bland vänner';

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
      'Den här inbjudningslänken går aldrig ut.';

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
  String get guildNavbarExpireAfter => 'Går ut efter';

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
  String get guildNavbarLeaveCommunityTitle => 'Lämna communityn';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Är du säker på att du vill lämna den här communityn? Du kommer inte längre att kunna se några meddelanden.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Lämna communityn';

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
      'Kunde inte ta bort dina meddelanden';

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
  String get guildPeekMoreOptions => 'Fler alternativ';

  @override
  String get guildMenuInviteMembers => 'Bjud in medlemmar';

  @override
  String get guildMenuCommunitySettings => 'Community-inställningar';

  @override
  String get guildMenuEditCommunityProfile => 'Redigera community-profil';

  @override
  String get guildMenuUnmuteCommunity => 'Avstäng community';

  @override
  String get guildMenuMuteCommunity => 'Stäng av community';

  @override
  String get guildMenuHideMutedChannels => 'Dölj avstängda kanaler';

  @override
  String get guildMenuReportCommunity => 'Anmäl community';

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
  String get guildMenuSettingsCustomInviteUrl => 'Anpassad inbjudningslänk';

  @override
  String get guildMenuSettingsDiscovery => 'Upptäckt';

  @override
  String get guildMenuSettingsMembers => 'Medlemmar';

  @override
  String get guildMenuSettingsInviteLinks => 'Inbjudningar';

  @override
  String get guildMenuSettingsBans => 'Avstängningar';

  @override
  String get guildMenuSettingsChannels => 'Kanaler';

  @override
  String get guildSettingsNoPermission =>
      'Du har inte behörighet att visa den här inställningsfliken.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikon';

  @override
  String get guildSettingsUploadImage => 'Ladda upp bild';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Ladda upp en banner för din server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Namn';

  @override
  String get guildSettingsOverviewNameHint => 'Min fantastiska community';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistik';

  @override
  String get guildSettingsOverviewMembers => 'Medlemmar';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Använd roller för att gruppera medlemmar och tilldela behörigheter.';

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
  String get guildSettingsRolesComfyLayout => 'Bekväm layout';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Växla till kompakt layout';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => 'Byt till bekväm layout';

  @override
  String get guildSettingsRolesSingleColumn => 'En kolumn';

  @override
  String get guildSettingsRolesTwoColumns => 'Två kolumner';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'Växla till enkelkolumn';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Växla till två kolumner';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Inga behörigheter hittades';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'Anpassad visningsordning';

  @override
  String get guildSettingsRolesHoistOrder => 'Visningsordning';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Återställ till standard';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Dra roller för att anpassa ordningen de visas i medlemslistan.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Inga visade roller. Aktivera \"Visa den här rollen separat\" på en roll för att se den här.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Du kan inte redigera den här rollen eftersom den är din högsta roll eller högre än dig';

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
  String get permissionCategoryMessagesMedia => 'Meddelanden och media';

  @override
  String get permissionCategoryModeration => 'Moderering';

  @override
  String get permissionCategoryChannelAccess => 'Kanalåtkomst';

  @override
  String get permissionCategoryChannelManagement => 'Kanalhantering';

  @override
  String get permissionCategoryAudioVideo => 'Ljud och video';

  @override
  String get permissionUnknown => 'Okänd behörighet';

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
      'Skapa, redigera eller ta bort roller under din högsta roll. Tillåter även redigering av kanalbehörighetsåsidosättningar.';

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
  String get permissionKickMembers => 'Sparka medlemmar';

  @override
  String get permissionBanMembers => 'Banna medlemmar';

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
  String get permissionCreateEmojiStickers => 'Skapa emoji och dekaler';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Ladda upp nya emoji och stickers, och hantera dina egna skapelser.';

  @override
  String get permissionManageEmojiStickers => 'Hantera emoji och dekaler';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Redigera eller ta bort emoji och stickers som skapats av andra medlemmar.';

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
      'Ta bort andra medlemmars meddelanden. Fästning styrs separat.';

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
      'Använd emoji från andra grupper.';

  @override
  String get permissionUseExternalStickers => 'Använd externa dekaler';

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
  String get permissionTimeOutMembers => 'Pausa medlemmar';

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
  String get permissionStreamVideo => 'Streama video';

  @override
  String get permissionUseVoiceActivity => 'Använd röstaktivering';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Utan den här behörigheten krävs push-to-talk.';

  @override
  String get permissionPrioritySpeaker => 'Prioriterad talare';

  @override
  String get permissionMuteMembers => 'Stäng av medlemmar';

  @override
  String get permissionDeafenMembers => 'Stäng av medlemmars mikrofoner';

  @override
  String get permissionMoveMembers => 'Flytta medlemmar';

  @override
  String get permissionMoveMembersDescription =>
      'Dra medlemmar mellan kanaler de kan komma åt.';

  @override
  String get permissionSetVoiceRegion => 'Ange röstregion';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount statiska, $animatedCount animerade emojiplatser använda';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Inga anpassade emojis än.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count stickers uppladdade';
  }

  @override
  String get guildSettingsStickersEmpty => 'Inga anpassade stickers än.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Medlemsverifiering';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Välj vad medlemmar måste ha innan de kan skicka meddelanden eller skicka direktmeddelanden till communitymedlemmar.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Medlemmar med roller kan kringgå dessa kontroller. För offentliga utrymmen rekommenderar vi att aktivera verifiering.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Communities som listas i Upptäck måste ha minst verifierad e-post. Ingen kan väljas medan Upptäck är aktiverat.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Moget innehåll & innehållsvarningar';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigurera märkning av moget innehåll och valfria innehållsvarningar för medlemmar.';

  @override
  String get guildSettingsModerationMatureToggle => 'Moget innehåll';

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
  String get guildSettingsVerificationMedium => 'Medium';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Kräver en verifierad e-postadress och ett konto som är minst 5 minuter gammalt.';

  @override
  String get guildSettingsVerificationHigh => 'Hög';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Kräver allt i medium, plus att vara medlem i communityn i minst 10 minuter.';

  @override
  String get guildSettingsVerificationHighest => 'Mycket hög';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Kräver ett verifierat telefonnummer.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Spåra moderatoråtgärder i hela communityn.';

  @override
  String get guildSettingsAuditLogEmpty => 'Inga loggar ännu';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderatoråtgärder och communityändringar kommer att visas här.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Alla användare';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Alla åtgärder';

  @override
  String get guildSettingsAuditLogNoReason => 'Ingen anledning angavs.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Okänd användare';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Något gick fel vid laddning av aktivitetsloggen.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Kunde inte ladda aktivitetsloggar';

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
  String get auditLogActionGuildUpdate => 'Community uppdaterad';

  @override
  String get auditLogActionChannelCreate => 'Kanal skapad';

  @override
  String get auditLogActionChannelUpdate => 'Kanal uppdaterad';

  @override
  String get auditLogActionChannelDelete => 'Kanal raderad';

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
  String get auditLogActionMemberBanRemove => 'Medlem avbannad';

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
  String get auditLogActionRoleDelete => 'Rollen raderad';

  @override
  String get auditLogActionInviteCreate => 'Inbjudan skapad';

  @override
  String get auditLogActionInviteUpdate => 'Inbjudan uppdaterad';

  @override
  String get auditLogActionInviteDelete => 'Inbjudan raderad';

  @override
  String get auditLogActionWebhookCreate => 'Webhook skapad';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook uppdaterad';

  @override
  String get auditLogActionWebhookDelete => 'Webhook raderad';

  @override
  String get auditLogActionEmojiCreate => 'Emoji skapad';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji uppdaterad';

  @override
  String get auditLogActionEmojiDelete => 'Emoji raderad';

  @override
  String get auditLogActionStickerCreate => 'Klistermärke skapat';

  @override
  String get auditLogActionStickerUpdate => 'Klistermärke uppdaterat';

  @override
  String get auditLogActionStickerDelete => 'Klistermärke raderat';

  @override
  String get auditLogActionMessageDelete => 'Meddelande raderat';

  @override
  String get auditLogActionMessageBulkDelete => 'Meddelanden raderade';

  @override
  String get auditLogActionMessagePin => 'Meddelande fäst';

  @override
  String get auditLogActionMessageUnpin => 'Meddelande bortfäst';

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
      other: 'Tog bort # meddelanden.',
      one: 'Tog bort # meddelande.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tog bort # medlemmar.',
      one: 'Tog bort # medlem.',
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
  String get guildSettingsLoadMore => 'Läs in mer';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

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
  String get guildSettingsCopyUrl => 'Kopiera URL';

  @override
  String get guildSettingsCopiedUrl => 'URL kopierad till urklipp';

  @override
  String get guildSettingsDeleteWebhook => 'Ta bort webbkrok';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Ange en anpassad inbjudningslänk för din server.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Spara';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Användning';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count användningar';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Lista din community i Upptäck så att andra kan hitta och gå med.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Inte tillräckligt många medlemmar';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Din community behöver minst $count medlemmar innan den kan listas i Upptäck.';
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
      'Din community visas i Upptäck. Du kan uppdatera dina uppgifter nedan eller dra tillbaka för att ta bort den.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Din ansökan väntar på granskning. Du kan fortfarande uppdatera dina annonsuppgifter eller dra tillbaka ansökan.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategori';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Välj den kategori som bäst beskriver din community. Du kan ändra detta när som helst.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primärt språk';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Språket som de flesta i din community talar. Används för att filtrera upptäcktsresultat.';

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
    return 'Upp till $maxTags taggar hjälper folk att hitta din community. De visas i Discovery-sökningen.';
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
      'Ansökan om upptäckt skickad';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Upptäcktslista uppdaterad';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Ansökan om upptäckt återkallad';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Kunde inte dra tillbaka ansökan';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Försök igen om en liten stund.';

  @override
  String get guildSettingsMembersDescription =>
      'Sök och hantera servermedlemmar.';

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
  String get guildSettingsMembersSortNewest => 'Nyaste först';

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
  String get guildMembersColumnJoinMethod => 'Gå med-metod';

  @override
  String get guildMembersColumnRoles => 'Roller';

  @override
  String get guildMembersColumnActions => 'Åtgärder';

  @override
  String get guildMembersFilterMemberSince => 'Filtrera efter medlem sedan';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filtrera efter kontoskapandedatum';

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
  String get guildMembersGoToPage => 'Gå till sida';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Gå till sida $page';
  }

  @override
  String get guildMembersJumpToPage => 'Gå till sida';

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
  String get guildMembersJoinSourceDiscovery => 'Upptäck';

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
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagar sedan',
      one: '1 dag sedan',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Medlemmar';

  @override
  String get guildMembersChannelListSelected => 'Medlemmar, valda';

  @override
  String get guildSettingsInvitesTitle => 'Inbjudningar';

  @override
  String get guildSettingsInvitesDescription =>
      'Se alla inbjudningar för den här gruppen. För att skapa en ny inbjudan, gå till en kanal och använd inbjudningsknappen.';

  @override
  String get guildSettingsInvitesEmpty => 'Inga inbjudningslänkar';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Den här gruppen har inga inbjudningslänkar än. Gå till en kanal och skapa en inbjudan för att bjuda in folk.';

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
      'Pausa inbjudningar för den här gruppen';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Aktivera inbjudningar för den här gruppen';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pausa inbjudningar? Nya användare kan inte gå med via inbjudningslänkar förrän du aktiverar dem igen. Befintliga medlemmar påverkas inte.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Aktivera inbjudningar? Användare kommer att kunna gå med i den här gruppen via inbjudningslänkar igen.';

  @override
  String get guildSettingsInvitesPause => 'Pausa';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Inbjudningar är pausade för den här gruppen.';

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
  String get guildSettingsInvitesLabelUses => 'Använder:';

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
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses användningar';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Går ut $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Visa och hantera bannlysta användare.';

  @override
  String get guildSettingsBansSearchHint => 'Sök bannlysningar';

  @override
  String get guildSettingsBansEmpty => 'Inga bannlysta användare.';

  @override
  String get guildSettingsBanPermanent => 'Permanent bannlysning';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Går ut $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Går ut';

  @override
  String get guildSettingsUnban => 'Avbanna';

  @override
  String get guildSettingsBansLoading => 'Laddar bannlysta användare';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Inga bannlysningar hittades som matchar din sökning.';

  @override
  String get guildSettingsBanDetailsTitle => 'Bannlysningens detaljer';

  @override
  String get guildSettingsBanViewDetails => 'Visa detaljer';

  @override
  String get guildSettingsBannedOn => 'Bannlyst den';

  @override
  String get guildSettingsBannedBy => 'Bannlyst av';

  @override
  String get guildSettingsRevokeBanTitle => 'Återkalla bannlysning';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Är du säker på att du vill återkalla bannlysningen för $displayName? De kommer att kunna återansluta till communityn.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Återkallade bannlysningen för $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Kunde inte ladda bannlysningar. Försök igen.';

  @override
  String get guildSettingsRevokeBanError =>
      'Kunde inte återkalla bannlysning. Försök igen.';

  @override
  String get guildSettingsCommunitySettings => 'Communityinställningar';

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
      'Hantera din communitys profil, kanaler och standardinställningar.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Varumärke';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Uppdatera din ikon, namn, banner och inbjudningsbakgrund';

  @override
  String get guildSettingsOverviewBannerUpload => 'Ladda upp banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Inaktiva inställningar';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfigurera AFK-kanal och tidsgräns';

  @override
  String get guildSettingsOverviewSystemTitle => 'System & välkomstmeddelanden';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Välj destination för system- och välkomstmeddelanden';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Standardaviseringar';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Communities med över 250 personer tvingas till inställningen \"endast omnämnanden\". Din ursprungliga inställning bevaras och återställs om communityn sjunker under 250 medlemmar.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avancerat';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Tillåt flexibla namn på textkanaler';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Dölj communityägarens krona';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Frilagd banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Visar bannern i ett eget avsnitt under communityns rubrik.';

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
  String get guildSettingsOverviewEmbedSplashHint =>
      'Visas i inbjudningsinbäddningar i chatt.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Ladda upp bakgrund';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Ingen communitybanner';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Ingen inbjudningsbakgrund';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Förhandsgranskning';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Se hur din inbjudan ser ut för besökare.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Namn på textkanaler';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Communityägarens krona';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigurera om kronikonen visas bredvid communityägaren';

  @override
  String get guildSettingsSplashCardAlignment => 'Kortjustering';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Mitten';

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
      'Öppna inställningar för meddelandehistorikgräns';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Gräns för meddelandehistorik';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Aktivera gräns för meddelandehistorik';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Gränsdatum';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Medlemmar utan Läs meddelandehistorik kan se meddelanden som skickats efter detta datum.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Gräns för meddelandehistorik uppdaterad';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Tillåt stora bokstäver och mellanslag i namn på textkanaler. Avstängt begränsar namn till gemener med bindestreck och understreck.';

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
  String get guildSettingsAfkChannel => 'AFK / inaktiv kanal';

  @override
  String get guildSettingsAfkChannelHint =>
      'Flytta medlemmar till den här kanalen när de är AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Ingen AFK-kanal';

  @override
  String get guildSettingsAfkTimeout => 'AFK-tidsgräns';

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
  String get guildSettingsSystemChannel => 'Mottagningskanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Välkomst- och systemmeddelanden visas här.';

  @override
  String get guildSettingsNoSystemChannel => 'Ingen systemkanal';

  @override
  String get guildSettingsHideJoinMessages => 'Dölj anslutningsmeddelanden';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Döljer anslutningsmeddelanden i destinationskanalen.';

  @override
  String get guildSettingsDefaultNotifications => 'Standardaviseringar';

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
  String get guildSettingsModerationDescription =>
      'Konfigurera verifiering, innehållsfiltrering och inställningar för moget innehåll.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Listade communities i Discovery har begränsade modereringsalternativ.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Innehållsfiltrering';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Granska automatiskt meddelanden efter explicit innehåll i kanaler som inte är markerade för moget innehåll.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Communities som listas i Discovery måste skanna alla medlemmar. Den här inställningen kan inte ändras medan Discovery är aktiverat.';

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
      'Rekommenderas för de flesta communities';

  @override
  String get guildSettingsContentFilterAll => 'Filtrera alla';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximalt skydd för familjevänliga utrymmen';

  @override
  String get guildSettingsModerationMatureOff => 'Av';

  @override
  String get guildSettingsModerationMatureOn => 'På';

  @override
  String get guildSettingsContentWarningToggle => 'Visa en innehållsvarning';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Aktiverar en samtyckesprompt innan du går in i någon kanal.';

  @override
  String get guildSettingsContentWarningText => 'Anpassad varningstext';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Det här innehåller känsligt innehåll.';

  @override
  String get guildSettingsModeration2faTitle => '2FA är valfritt';

  @override
  String get guildSettingsModeration2faDescription =>
      'Moderatorer behöver inte tvåfaktorsautentisering för att bannlysa, sparka, tidsbegränsa eller ta bort meddelanden.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      '2FA är valfritt för modereringsåtgärder';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Endast communityägaren kan ändra den här inställningen';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      '2FA krävs inte för att ändra den här inställningen';

  @override
  String get guildSettingsEmojiSearchHint => 'Sök emojis';

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
      'Inga emojis hittades som matchar din sökning.';

  @override
  String get guildSettingsEmojiNoSlots => 'Inga emojislottar tillgängliga';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Du har nått det maximala antalet emojier. Ta bort några befintliga emojier för att göra plats.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emoji-namn måste innehålla minst 2 tecken och kan använda bokstäver, siffror och understreck. Emojis får inte överstiga $maxSize. Statiska bilder ändras storlek till 128x128 pixlar och komprimeras automatiskt. Animerade emojis och SVG-filer måste redan uppfylla gränsen.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Laddar upp emojier';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojis',
      one: '# emoji',
    );
    return 'Laddar upp $_temp0. Det kan ta en liten stund.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Det gick inte att ladda upp emojier. Försök igen.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Vissa emojier kunde inte läggas till';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Granska filerna och försök igen med mindre eller enklare bilder.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Byt namn på emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 tecken, bokstäver, siffror, understreck.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Namn';

  @override
  String get guildSettingsEmojiColumnUploader => 'Uppladdad av';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Okänt';

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
  String get guildSettingsEmojiRenameFailedBody =>
      'Namnet återställdes till det tidigare. Försök igen om en liten stund.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Den här emojin finns inte längre';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Den kan ha raderats. Namnet återställdes till vad det var tidigare.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Du kan inte byta namn på den här emojin';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Du har inte behörighet att byta namn på den här emojin. Namnet återställdes till det tidigare.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Du går för snabbt';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Vänta en stund och försök byta namn igen.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Kunde inte ta bort den här emojin';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Du kan inte ta bort den här emojin';

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
      'Kunde inte uppdatera kloning av dekaler';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Icke-animerad emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animerad emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Sök klistermärken';

  @override
  String get guildSettingsStickerSlotsTitle => 'Klistremärkesplatser';

  @override
  String get guildSettingsStickerUploadTitle => 'Ladda upp sticker';

  @override
  String get guildSettingsStickerDropZone =>
      'Dra och släpp en sticker-fil här (en i taget)';

  @override
  String get guildSettingsStickerDensity => 'Täthet för dekaler';

  @override
  String get guildSettingsStickerDensityCozy => 'Mysigt';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompakt';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Kunde inte läsa in dekaler';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Ett fel uppstod vid inläsning av klistermärkena. Försök igen.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Inga dekaler hittades som matchar din sökning.';

  @override
  String get guildSettingsStickersEmptySearch => 'Inga stickers hittades';

  @override
  String get guildSettingsStickerNoSlots => 'Inga lediga platser för dekaler';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Du har nått det maximala antalet dekaler. Radera några befintliga dekaler för att göra plats.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Stickers sparas i 320x320 pixlar och får inte överstiga $maxSize. Statiska bilder ändras storlek och komprimeras automatiskt. Animerade stickers och SVG-filer måste redan uppfylla gränsen.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Filformatet för dekalen stöds inte';

  @override
  String get guildSettingsStickerAddTitle => 'Lägg till dekal';

  @override
  String get guildSettingsStickerEditTitle => 'Redigera dekal';

  @override
  String get guildSettingsStickerNameLabel => 'Namn';

  @override
  String get guildSettingsStickerNameHint => 'Mitt snygga klistermärke';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Beskrivning';

  @override
  String get guildSettingsStickerDescriptionHint => 'Beskriv stickern';

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
  String get guildSettingsStickerTooLargeTitle => 'Bilden är för stor';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Kunde inte komprimera stickern tillräckligt';

  @override
  String get guildSettingsStickerDeleteTitle => 'Ta bort dekal';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Ta bort \"$name\"? Kan inte ångras.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Rensa bort det här märket från lagring och CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Kunde inte ta bort den här etiketten';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Du kan inte ta bort den här etiketten';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'För att skapa en webhook, öppna $channelSettingsPath. Du kan fortfarande redigera och organisera alla befintliga webhooks här.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Din anpassade URL fungerar inte om inte minst en kanal är synlig för alla.';

  @override
  String get guildSettingsVanityUrlRemove => 'Ta bort';

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
      'Gör anspråk på ditt konto för att starta direktmeddelanden.';

  @override
  String get createDmVerifyToStartDms =>
      'Verifiera din e-postadress för att starta direktmeddelanden.';

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
      'Följande personer kan inte läggas till i den här gruppkonversationen:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Skapa gruppmeddelandet med de återstående $count mottagarna och hoppa över resten?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Inga återstående mottagare att skapa en gruppchatt med.';

  @override
  String get createDmUnaddableUserNotFound => 'Användaren hittades inte';

  @override
  String get createDmUnaddableBlocked =>
      'Du kan inte skicka meddelanden till den här användaren';

  @override
  String get createDmUnaddableNotFriends => 'Inte på din vänlista';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Kan inte läggas till i grupp-DM';

  @override
  String get createDmFailed => 'Kunde inte skapa konversationen. Försök igen.';

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
  String get keybindSectionVoiceAndVideo => 'Röst och video';

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
  String get keybindActionSwitchCommunities => 'Växla mellan grupper';

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
  String get keybindActionGoToSixthCommunity => 'Gå till sjätte gruppen';

  @override
  String get keybindActionGoToSeventhCommunity => 'Gå till sjunde gruppen';

  @override
  String get keybindActionGoToEighthCommunity => 'Gå till åttonde communityn';

  @override
  String get keybindActionToggleQuickSwitcher => 'Växla snabbväxlare';

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
  String get keybindActionStartGroupDm => 'Starta en gruppkonversation';

  @override
  String get keybindActionTogglePinnedMessages => 'Växla fästa meddelanden';

  @override
  String get keybindActionToggleInbox => 'Växla inkorgen';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Markera översta inkorgskanalen som läst';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Markera alla inkorgskanaler som lästa';

  @override
  String get keybindActionToggleMemberList =>
      'Växla medlemslistan eller röstchatten';

  @override
  String get keybindActionToggleEmojiPicker => 'Växla emojiväljaren';

  @override
  String get keybindActionToggleGifPicker => 'Växla GIF-väljaren';

  @override
  String get keybindActionToggleStickerPicker => 'Växla klistermärkesväljaren';

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
  String get keybindActionToggleSavedMedia => 'Växla sparad media';

  @override
  String get keybindActionSendVoiceMessage => 'Skicka röstmeddelande';

  @override
  String get keybindActionAnswerCall => 'Svara på det inkommande samtalet';

  @override
  String get keybindActionDeclineCall => 'Avvisa inkommande samtal';

  @override
  String get keybindActionStartDmCall =>
      'Starta ett samtal i ett direktmeddelande eller en grupp';

  @override
  String get keybindActionToggleSoundboard => 'Växla ljudbordet';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expandera eller minimera kompakt samtalsvy';

  @override
  String get keybindActionPushToTalkPriority => 'Push-to-talk (prioritet)';

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
}
