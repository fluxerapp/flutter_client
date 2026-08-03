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
      'Något är fel med servrarna.\nBorde vara fixat om en sekund!';

  @override
  String get gatewayReconnectingToast => 'Ansluter igen…';

  @override
  String get gatewayConnectedToast => 'Ansluten';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

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
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

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
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

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
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
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
  String get dmDebugCategory => 'Debug Category';

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
  String get addFriendSendFailedGeneric =>
      'Kunde inte skicka vänförfrågan. Försök igen.';

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
  String get externalLinkWarningLeaving => 'Du är på väg att lämna Fluxer';

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
  String get profilePreviewMemberSince => 'Fluxer-medlem sedan';

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
  String get securityLoginEmailSectionDescription =>
      'Hantera e-postadressen du använder för att logga in på Fluxer';

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
      'Ange ditt telefonnummer. Vi skickar en verifieringskod via SMS.';

  @override
  String get phoneAddSendCode => 'Skicka kod';

  @override
  String get phoneVerifyTitle => 'Verifiera telefonnummer';

  @override
  String get phoneVerifyDescription =>
      'Ange verifieringskoden som skickats till ditt telefonnummer.';

  @override
  String get phoneAddSuccess => 'Telefonnummer tillagt';

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
  String get relativeTimeJustNow => 'nyss';

  @override
  String get authorizedAppsTitle => 'Auktoriserade program';

  @override
  String get authorizedAppsDescription =>
      'Dessa program har beviljats åtkomst till ditt Fluxer-konto.';

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
  String get userProfileStaffBadgeTooltip => 'Fluxer-personal';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Community Team';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium-prenumerant sedan $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary sedan $date';
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
  String get chatAttachmentFileTooLarge =>
      'En eller flera filer överskrider storleksgränsen';

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
      'Håll för att spela in. Dra upp för att låsa, eller släpp för att skicka.';

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
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Bilagan har gått ut';

  @override
  String get chatAttachmentSourceGallery => 'Galleri';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Bläddra bland filer';

  @override
  String get chatAttachmentPasteTooltip => 'Klistra in bild från urklipp';

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
  String get connectionsDescription =>
      'Länka externa konton och domäner till din Fluxer-profil. Verifierade anslutningar visas på din profil för andra att se.';

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
  String get lookAndFeelChatFontScalingTitle => 'Teckensnittsskalning i chatt';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Justera teckenstorleken i chattområdet.';

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
  String get lookAndFeelCollapseDMsLabel => 'Kollapsa DM till mapp';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'När det är aktiverat kollapsas olästa DM i serverlistan till en mapp på Fluxer-knappen. Klicka på Fluxer-knappen när du är på DM-sidan för att expandera eller kollapsa mappen.';

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
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'När de laddas upp direkt till Fluxer';

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
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle =>
      'Indikatorer för olästa meddelanden';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Styr hur indikatorer för olästa meddelanden visas.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Visa dämpad oläst-indikator i tystade kanaler';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Visa en nedtonad oläst-indikator bredvid tystade direktmeddelanden och kanaler så att du fortfarande kan se med en blick när det finns aktivitet.';

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
  String get accessibilityMediaButtonsGroupTitle => 'Media Buttons';

  @override
  String get accessibilityMediaButtonsGroupDescription =>
      'Customize which buttons appear on media attachments and embeds.';

  @override
  String get accessibilityShowMediaDeleteButtonLabel => 'Show delete button';

  @override
  String get accessibilityShowMediaDownloadButtonLabel =>
      'Show download button';

  @override
  String get accessibilityShowMediaFavoriteButtonLabel =>
      'Show favorite button';

  @override
  String get accessibilityShowSuppressEmbedsButtonLabel =>
      'Show suppress embeds button';

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
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Det här är en röstkanal. Anslut för att börja prata!';

  @override
  String get voiceChannelJoin => 'Anslut till röstkanal';

  @override
  String get voiceCallJoin => 'Join call';

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
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Skärmdelning';

  @override
  String get voiceScreenShareNotificationText => 'Delar din skärm.';

  @override
  String get voiceControlMore => 'Mer';

  @override
  String get voiceControlDisconnect => 'Koppla från';

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
  String get voiceParticipantMenuCommunityMute => 'Mute';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Deafen';

  @override
  String get voiceParticipantMenuUserVolume => 'User volume';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream volume';

  @override
  String get voiceParticipantModerationFailed =>
      'Couldn\'t update that member. Please try again.';

  @override
  String get voiceControlChat => 'Chatt';

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
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

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
  String get iarReasonOtherDescription =>
      'Använd endast om det tydligt bryter mot Fluxers regler och inte passar ovan.';

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
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

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
  String get chatReplyMentionOn => 'På';

  @override
  String get chatReplyMentionOff => 'Av';

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
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

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
  String get personalNotesTitle => 'Personliga anteckningar';

  @override
  String get personalNotesSubtitle =>
      'Ditt privata utrymme för tankar och påminnelser';

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
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Säkerhet och inloggning';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Gåvor och koder';

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
  String get userSettingsNavLanguageAndTime => 'Språk och tid';

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
  String get userSettingsNavAdvanced => 'Avancerat';

  @override
  String get advancedPerformanceReportingTitle => 'Prestandarapportering';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Hjälp till att förbättra Fluxer genom att dela anonyma krasch- och prestandadata.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Skicka krasch- och prestandarapporter';

  @override
  String get advancedPerformanceReportingDescription =>
      'All rapporterad data är anonym och skickas endast till Fluxers egen övervakningstjänst – inga tredjepartsleverantörer används.';

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
  String get advancedSettingSequentialFileSendLabel =>
      'Send file messages in order';

  @override
  String get advancedSettingSequentialFileSendDescription =>
      'Ensures file messages appear in the order you sent them';

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
  String get savedMessagesEmptyTitle => 'No bookmarks';

  @override
  String get savedMessagesEmptyBody =>
      'Bookmark messages to save them for later.';

  @override
  String get savedMessagesEndBody => 'There\'s nothing more to see here.';

  @override
  String get savedMessagesRemoveTooltip => 'Remove bookmark';

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
    return 'This will notify $count members with the $roleName role. Continue?';
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
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

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
  String get guildNavbarStaffOnlyAccessible =>
      'Endast tillgängligt för Fluxer-personal';

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
  String get guildMenuSettingsEmoji => 'Anpassade emojis';

  @override
  String get guildMenuSettingsStickers => 'Anpassade stickers';

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
  String get guildMenuSettingsInviteLinks => 'Inbjudningslänkar';

  @override
  String get guildMenuSettingsBans => 'Avstängningar';

  @override
  String get guildMenuSettingsChannels => 'Channels';

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
      'Hantera webbkrokar som skickar meddelanden till kanaler.';

  @override
  String get guildSettingsWebhooksEmpty => 'Inga webbkrokar konfigurerade.';

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
      'Ansök om att listas i serverutforskaren.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Kräver minst $count medlemmar för att ansöka.';
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
  String get guildSettingsDiscoveryDescriptionField => 'Beskrivning';

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
  String get guildSettingsDiscoveryTags => 'Taggar';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'spel, konst, musik';

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
  String get guildSettingsDiscoveryApply => 'Skicka ansökan';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Dra tillbaka';

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
      'Sök och hantera servermedlemmar.';

  @override
  String get guildSettingsMembersSearchHint => 'Sök medlemmar';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count medlemmar';
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
  String get guildSettingsMembersSortNewest => 'Nyaste först';

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
      'Visa och återkalla aktiva inbjudningslänkar.';

  @override
  String get guildSettingsInvitesEmpty => 'Inga aktiva inbjudningar.';

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
    return 'Icke-animerad emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animerad emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Sök klistermärken';

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
    return 'Skapa webhooks från kanalinställningar. Redigera dem här.';
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
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrera efter användare';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrera efter åtgärd';

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
