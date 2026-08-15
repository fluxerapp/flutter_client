// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class FluxerLocalizationsDa extends FluxerLocalizations {
  FluxerLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get reconnectingTitle => 'Vi er gået galt!';

  @override
  String get reconnectingBody =>
      'Der er noget galt med serverne.\nDet burde være fikset om et øjeblik!';

  @override
  String get gatewayReconnectingToast => 'Genopretter forbindelse…';

  @override
  String get gatewayConnectedToast => 'Forbundet';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Kunne ikke starte: $error';
  }

  @override
  String get retry => 'Prøv igen';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Forbindelse mistet';

  @override
  String get splashViewOnStatusPage => 'Se på status-siden';

  @override
  String get splashConnectionIssuesPrompt => 'Forbindelsesproblemer?';

  @override
  String get splashStatusPageLink => 'Status-side';

  @override
  String get splashReadIncident => 'Læs hændelse';

  @override
  String get splashIncidentHistory => 'Hændelseshistorik';

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
  String get welcomeBack => 'Velkommen tilbage';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'Indtast venligst en gyldig e-mailadresse.';

  @override
  String get password => 'Adgangskode';

  @override
  String get forgotPassword => 'Glemt din adgangskode?';

  @override
  String get logIn => 'Log ind';

  @override
  String get logInWithPasskey => 'Log ind med en adgangsnøgle';

  @override
  String continueWithSso(String provider) {
    return 'Fortsæt med $provider';
  }

  @override
  String get ssoRequired => 'SSO kræves for at få adgang til denne instans.';

  @override
  String get organizationSsoProvider =>
      'Log ind med din organisations single sign-on-udbyder.';

  @override
  String get failedToStartSso => 'Kunne ikke starte SSO';

  @override
  String get ssoCancelled => 'SSO-login blev annulleret';

  @override
  String preferSso(String provider) {
    return 'Foretrækker du at bruge SSO? Fortsæt med $provider.';
  }

  @override
  String get logInViaBrowser => 'Log ind via browser';

  @override
  String get needAccountPrompt => 'Har du brug for en konto? ';

  @override
  String get register => 'Registrer';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Bekræft, at du er et menneske';

  @override
  String get captchaDescription =>
      'Vi skal sikre os, at du ikke er en bot. Udfør venligst bekræftelsen herunder.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Har du problemer? Prøv hCaptcha i stedet';

  @override
  String get captchaSwitchToTurnstile => 'Prøv Turnstile i stedet';

  @override
  String get cancel => 'Annuller';

  @override
  String get ipAuthCheckEmail => 'Tjek din e-mail';

  @override
  String ipAuthDescription(String email) {
    return 'Vi har sendt et link til din e-mail for at godkende dette login. Åbn venligst din indbakke for $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Forbindelse mistet';

  @override
  String get ipAuthConnectionLostDescription =>
      'Vi mistede forbindelsen, mens vi ventede på godkendelse. Prøv igen.';

  @override
  String get ipAuthLinkExpired => 'Login-link udløbet';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Dette godkendelseslink er udløbet. Log venligst ind igen.';

  @override
  String get ipAuthResendEmail => 'Send e-mail igen';

  @override
  String get ipAuthResent => 'Sendt igen';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Tilbage';

  @override
  String get mfaTitle => 'To-faktor-godkendelse';

  @override
  String get mfaChooseMethod => 'Vælg en bekræftelsesmetode';

  @override
  String get mfaMethodTotp => 'Godkendelsesapp';

  @override
  String get mfaMethodWebauthn => 'Sikkerhedsnøgle / Adgangsnøgle';

  @override
  String get mfaTotpDescription =>
      'Indtast den 6-cifrede kode fra din godkendelsesapp eller en af dine backupkoder.';

  @override
  String get mfaCodeLabel => 'Kode';

  @override
  String get mfaTryAnotherMethod => 'Prøv en anden metode';

  @override
  String get mfaUseSecurityKey => 'Prøv sikkerhedsnøgle / adgangskode i stedet';

  @override
  String get accountSelectorTitle => 'Vælg en konto';

  @override
  String get accountSelectorDescription =>
      'Vælg en konto for at fortsætte, eller tilføj en anden.';

  @override
  String get accountAdd => 'Tilføj en konto';

  @override
  String get accountRemove => 'Fjern';

  @override
  String accountRemoveTitle(String username) {
    return 'Fjern $username';
  }

  @override
  String get accountRemoveDescription =>
      'Dette fjerner den gemte session for denne konto.';

  @override
  String get accountRemoveOnlyDescription =>
      'Dette fjerner den eneste gemte konto på denne enhed.';

  @override
  String get accountExpired => 'Udløbet';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sessionen er udløbet for $identifier. Log venligst ind igen.';
  }

  @override
  String get accountManageTitle => 'Administrer konti';

  @override
  String get accountSwitchFailed => 'Kunne ikke skifte konto. Prøv igen.';

  @override
  String get profileTabMenuSwitchAccounts => 'Skift konti';

  @override
  String get statusChangeSheetTitle => 'Indstil status';

  @override
  String get statusOnlineStatusSection => 'Online-status';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Inaktiv';

  @override
  String get statusDnd => 'Forstyr ikke';

  @override
  String get statusInvisible => 'Usynlig';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Indtil jeg ændrer det';

  @override
  String get statusDontClear => 'Ryd ikke';

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
  String get statusClearAfter3Days => '3 dage';

  @override
  String get statusDndDescription =>
      'Du modtager ingen notifikationer på computeren';

  @override
  String get statusInvisibleDescription => 'Du vil fremstå offline';

  @override
  String get customStatusSetTitle => 'Indstil brugerdefineret status';

  @override
  String get customStatusCurrentHint => 'Brugerdefineret status';

  @override
  String get customStatusClear => 'Fjern brugerdefineret status';

  @override
  String get customStatusPlaceholder => 'Hvad sker der?';

  @override
  String get customStatusChooseEmoji => 'Vælg en emoji';

  @override
  String get customStatusClearAfter => 'Fjern efter';

  @override
  String get customStatusSave => 'Gem';

  @override
  String get accountActive => 'Aktiv konto';

  @override
  String get signOut => 'Log af';

  @override
  String get suspendedPermanentTitle => 'Konto permanent suspenderet';

  @override
  String get suspendedTemporaryTitle => 'Konto suspenderet';

  @override
  String get suspendedPermanentDescription =>
      'Din konto er permanent suspenderet for overtrædelse af vores servicevilkår.';

  @override
  String get suspendedTemporaryDescription =>
      'Din konto er midlertidigt suspenderet. Du vil kunne tilgå din konto, når suspensionsperioden er ovre.';

  @override
  String get suspendedIssuedAt => 'Udstedt';

  @override
  String get suspendedEndsAt => 'Slutter';

  @override
  String get suspendedDuration => 'Varighed';

  @override
  String get suspendedPermanent => 'Permanent';

  @override
  String get suspendedReason => 'Årsag';

  @override
  String get suspendedAppealDeadline => 'Appelfrist';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Din konto er planlagt til sletning den $date.';
  }

  @override
  String get suspendedRecheck => 'Tjek for opdateringer';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Tjek igen om ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Tilbage til login';

  @override
  String get suspendedAppealTitle => 'Appel';

  @override
  String get suspendedAppealHint =>
      'Forklar hvorfor din suspension bør genovervejes (minimum 50 tegn)...';

  @override
  String get suspendedAppealSubmit => 'Send appel';

  @override
  String get suspendedAppealPending => 'Afventer gennemgang';

  @override
  String get suspendedAppealAccepted => 'Appel accepteret';

  @override
  String get suspendedAppealRejected => 'Appel afvist';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Din appel er blevet accepteret, og din konto er blevet genoprettet.';

  @override
  String get suspendedSignIn => 'Log ind på din konto';

  @override
  String get forgotPasswordTitle => 'Glemt din adgangskode?';

  @override
  String get forgotPasswordDescription =>
      'Indtast din e-mailadresse, og vi sender dig et link til at nulstille din adgangskode.';

  @override
  String get forgotPasswordSubmit => 'Send nulstillingslink';

  @override
  String get forgotPasswordSentTitle => 'Tjek din e-mail';

  @override
  String get forgotPasswordSentDescription =>
      'Vi har sendt instruktioner til nulstilling af adgangskode til din e-mailadresse. Tjek venligst din indbakke og følg linket for at nulstille din adgangskode.';

  @override
  String get forgotPasswordBackToLogin => 'Tilbage til login';

  @override
  String get resetPasswordTitle => 'Indstil ny adgangskode';

  @override
  String get resetPasswordDescription =>
      'Indtast din nye adgangskode nedenfor for at fuldføre nulstillingsprocessen.';

  @override
  String get resetPasswordNewPassword => 'Ny adgangskode';

  @override
  String get resetPasswordConfirm => 'Bekræft ny adgangskode';

  @override
  String get resetPasswordSubmit => 'Nulstil adgangskode';

  @override
  String get resetPasswordMismatch => 'Adgangskoder stemmer ikke overens.';

  @override
  String get registerTitle => 'Opret en konto';

  @override
  String get registerDisplayName => 'Visningsnavn (valgfrit)';

  @override
  String get registerDisplayNameHint => 'Hvad skal folk kalde dig?';

  @override
  String get registerUsername => 'Brugernavn (valgfrit)';

  @override
  String get registerUsernameHint =>
      'Lad stå tomt for et tilfældigt brugernavn';

  @override
  String get registerUsernameTagHint =>
      'Et 4-cifret tag vil blive tilføjet automatisk for at sikre unikhed';

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
      'Jeg accepterer servicevilkårene og privatlivspolitikken';

  @override
  String get registerConsentPrefix => 'Jeg accepterer ';

  @override
  String get registerConsentTerms => 'servicevilkårene';

  @override
  String get registerConsentAnd => ' og ';

  @override
  String get registerConsentPrivacy => 'privatlivspolitikken';

  @override
  String get registerConfirmPassword => 'Bekræft adgangskode';

  @override
  String get registerSubmit => 'Opret konto';

  @override
  String get registerHaveAccount => 'Har du allerede en konto? ';

  @override
  String get passkeyNoCredentials =>
      'Ingen passkeys fundet til denne app. Log ind med e-mail og adgangskode i stedet.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys understøttes ikke på denne enhed.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys er ikke konfigureret til denne app. Log ind med e-mail og adgangskode i stedet.';

  @override
  String get passkeyTimeout => 'Passkey-godkendelse udløb. Prøv igen.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys er ikke tilgængelige for denne app. Log ind med e-mail og adgangskode i stedet.';

  @override
  String get passkeyFailed =>
      'Adgangskoden-godkendelse mislykkedes. Prøv igen.';

  @override
  String get errorUnableToCreateAccount =>
      'Kunne ikke oprette konto. Prøv igen.';

  @override
  String get errorUnableToSignIn => 'Kunne ikke logge ind lige nu. Prøv igen.';

  @override
  String get errorInvalidEmailOrPassword => 'Ugyldig e-mail eller adgangskode.';

  @override
  String get errorUnableToSendResetLink =>
      'Kunne ikke sende nulstillingslink. Prøv igen.';

  @override
  String get errorUnableToResetPassword =>
      'Kunne ikke nulstille adgangskode. Prøv igen.';

  @override
  String get embedInviteJoin => 'Deltag i fællesskab';

  @override
  String get embedInviteGoTo => 'Gå til fællesskab';

  @override
  String embedInviteOnline(String count) {
    return '$count online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count medlemmer';
  }

  @override
  String get embedInviteUnknownTitle => 'Ukendt invitation';

  @override
  String get embedInviteUnknownSubtitle => 'Prøv at bede om en ny invitation.';

  @override
  String get embedInviteUnavailable => 'Invitation utilgængelig';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => 'Du er blevet inviteret til at deltage';

  @override
  String get inviteAcceptJoinButton => 'Deltag i fællesskab';

  @override
  String get inviteAcceptGoToButton => 'Gå til fællesskab';

  @override
  String get inviteAcceptInvitesPaused => 'Invitationer sat på pause';

  @override
  String get inviteAcceptNotFoundTitle => 'Invitation ugyldig';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Denne invitation kan være udløbet eller ugyldig.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Deltag i gruppe';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Du er blevet inviteret til at deltage i en gruppe-DM af $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'en';

  @override
  String get inviteAcceptEmojiPack => 'Emoji-pakke';

  @override
  String get inviteAcceptStickerPack => 'Klistermærkepakke';

  @override
  String get inviteAcceptInstallEmojiPack => 'Installer emoji-pakke';

  @override
  String get inviteAcceptInstallStickerPack => 'Installer klistermærkepakke';

  @override
  String get inviteAcceptPackInstallNote =>
      'Ved at acceptere denne invitation installeres pakken automatisk.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Adgang til kanal nægtet';

  @override
  String get channelAccessDeniedDescription =>
      'Du har ikke adgang til den kanal, hvor denne besked blev sendt.';

  @override
  String get messageJumpLinkNoAccess => 'Ingen adgang';

  @override
  String get okay => 'Okay';

  @override
  String get embedThemeTitle => 'Delt tema';

  @override
  String get embedThemeSubtitle =>
      'Denne klient understøtter ikke brugerdefinerede temaer.';

  @override
  String get embedThemeUnavailableButton => 'Temaer utilgængelige';

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
  String get privacySettings => 'Privatlivsindstillinger';

  @override
  String get privacyDirectMessages => 'Direkte beskeder';

  @override
  String get privacyDirectMessagesDescription =>
      'Tillad direkte beskeder fra andre medlemmer i dette fællesskab';

  @override
  String get privacyBotDirectMessages => 'Bot-direkte beskeder';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Tillad bots fra dette fællesskab at sende dig direkte beskeder';

  @override
  String get privacyMutualDmsDisabled =>
      'Fællesskabets administratorer har deaktiveret modtagelse af direkte beskeder udelukkende fra gensidige medlemmer i dette fællesskab.';

  @override
  String get communityDebug => 'Fællesskabsfejlfinding';

  @override
  String get copiedToClipboard => 'Kopieret til udklipsholder';

  @override
  String get notificationSettings => 'Notifikationsindstillinger';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Slå lydstyrken fra for $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'At slå lydstyrken fra for et fællesskab forhindrer ulæste indikatorer og notifikationer i at blive vist, medmindre du er nævnt';

  @override
  String get notificationCommunitySettings =>
      'Fællesskabsnotifikationsindstillinger';

  @override
  String get notificationAllMessages => 'Alle beskeder';

  @override
  String get notificationOnlyMentions => 'Kun omtaler';

  @override
  String get notificationNothing => 'Intet';

  @override
  String get notificationSuppressEveryone => 'Undertryk @everyone og @here';

  @override
  String get notificationSuppressRoles => 'Undertryk alle rolmention';

  @override
  String get notificationMobilePush => 'Push-notifikationer på mobilen';

  @override
  String get notificationOverrides => 'Notifikations-overstyringer';

  @override
  String get notificationSelectChannel => 'Vælg en kanal eller kategori';

  @override
  String get notificationOnlyAtMentions => 'Kun @mention';

  @override
  String get notificationMuteChannel => 'Slå kanal fra';

  @override
  String get notificationUnmuteChannel => 'Slå kanal til';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Ingen kategori';

  @override
  String get dmMarkAsRead => 'Marker som læst';

  @override
  String get dmMuteConversation => 'Slå DM fra';

  @override
  String get dmUnmuteConversation => 'Slå DM til';

  @override
  String get dmPinDm => 'Fastgør DM';

  @override
  String get dmUnpinDm => 'Fjern DM fra fastgjorte';

  @override
  String get dmAlwaysShowInSidebar => 'Vis altid i sidebjælken';

  @override
  String get dmRemoveFromAlwaysShown => 'Fjern fra \'Vis altid\'';

  @override
  String get dmCloseDm => 'Luk DM';

  @override
  String get dmCloseDmConfirmTitle => 'Luk DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Er du sikker på, at du vil lukke din DM med $username? Du kan altid genåbne den senere.';
  }

  @override
  String get dmCopyChannelId => 'Kopiér kanal-ID';

  @override
  String get dmChannelIdCopied => 'Kanal-ID kopieret';

  @override
  String get dmCopyUserId => 'Kopiér bruger-ID';

  @override
  String get dmUserIdCopied => 'Bruger-ID kopieret';

  @override
  String get dmViewProfile => 'Vis profil';

  @override
  String get dmVoiceCall => 'Start taleopkald';

  @override
  String get incomingVoiceCallTitle => 'Indgående taleopkald';

  @override
  String get incomingVoiceCallAccept => 'Accepter';

  @override
  String get incomingVoiceCallDecline => 'Afvis';

  @override
  String get incomingVoiceCallLabel => 'Indgående opkald';

  @override
  String get incomingVoiceCallIgnore => 'Ignorer';

  @override
  String get directVoiceCallNotEligible =>
      'Dette opkald kan ikke startes lige nu. Prøv igen om et øjeblik.';

  @override
  String get voiceJoinCallFailed =>
      'Kunne ikke oprette forbindelse til dette opkald. Tjek din forbindelse, og prøv igen.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Kunne ikke deltage i dette opkald. Tjek din forbindelse, og prøv igen.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Kunne ikke opdatere dette opkald på serveren. Tjek din forbindelse, og prøv igen.';

  @override
  String get dmAddNote => 'Tilføj note';

  @override
  String get dmEditGroup => 'Rediger gruppe';

  @override
  String get dmInviteToCommunity => 'Inviter til fællesskab';

  @override
  String get dmBlock => 'Bloker';

  @override
  String get dmLeaveGroup => 'Forlad gruppe';

  @override
  String get dmNoCommunitiesAvailable => 'Ingen fællesskaber tilgængelige';

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
  String get dmMuteFor3Days => 'I 3 dage';

  @override
  String get dmMuteForever => 'Indtil jeg slår det til igen';

  @override
  String get dmPinGroupDm => 'Fastgør gruppe-DM';

  @override
  String get dmUnpinGroupDm => 'Fjern fastgørelse af gruppebesked';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Gør besked til favorit';

  @override
  String get dmUnfavoriteDm => 'Fjern besked fra favoritter';

  @override
  String get dmFavoriteGroupDm => 'Gør gruppebesked til favorit';

  @override
  String get dmUnfavoriteGroupDm => 'Fjern gruppebesked fra favoritter';

  @override
  String get dmChangeFriendNickname => 'Skift vennens kaldenavn';

  @override
  String get dmRemoveFriend => 'Fjern ven';

  @override
  String get dmAddFriend => 'Tilføj ven';

  @override
  String get dmAcceptFriendRequest => 'Accepter venneanmodning';

  @override
  String get dmIgnoreFriendRequest => 'Ignorer venneanmodning';

  @override
  String get dmFriendRequestSent => 'Venneanmodning sendt';

  @override
  String get dmUnblock => 'Fjern blokering';

  @override
  String get dmDebugUser => 'Fejlfindingsbruger';

  @override
  String get dmDebugChannel => 'Fejlfindingskanal';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Fastgjort besked';

  @override
  String get dmUnpinned => 'Besked fjernet fra fastgjorte';

  @override
  String get dmMuted => 'Besked slået fra';

  @override
  String get dmUnmuted => 'Besked slået til igen';

  @override
  String get dmRemoveFriendConfirmTitle => 'Fjern ven';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Er du sikker på, at du vil fjerne $username som ven?';
  }

  @override
  String get dmBlockConfirmTitle => 'Bloker bruger';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Er du sikker på, at du vil blokere $username? De vil ikke kunne sende dig beskeder eller venneanmodninger.';
  }

  @override
  String get dmFriendRequestSentToast => 'Venneanmodning sendt';

  @override
  String get dmFriendRequestFailed => 'Kunne ikke sende venneanmodning';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Kunne ikke acceptere venneanmodning';

  @override
  String get dmRemoveFriendFailed => 'Kunne ikke fjerne ven';

  @override
  String get dmBlockFailed => 'Kunne ikke blokere bruger';

  @override
  String get dmUnblockFailed => 'Kunne ikke fjerne blokering af bruger';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Kunne ikke ignorere venneanmodning';

  @override
  String get dmAddFriends => 'Tilføj venner';

  @override
  String get addFriendSheetTitle => 'Tilføj ven';

  @override
  String get addFriendUsernameHint => 'Brugernavn#0000';

  @override
  String get addFriendUsernameLabel => 'Vennens brugernavn';

  @override
  String get addFriendSendRequest => 'Send anmodning';

  @override
  String get addFriendNoUserFound => 'Ingen bruger fundet med det brugernavn.';

  @override
  String get addFriendInvalidUsername =>
      'Indtast et gyldigt brugernavn (Brugernavn#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Venneanmodning sendt';

  @override
  String get addFriendClaimTitle => 'Gør krav på din konto';

  @override
  String get addFriendClaimDescription =>
      'Gør krav på din konto for at sende venneanmodninger.';

  @override
  String get addFriendVerifyTitle => 'Bekræft din e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Du skal bekræfte din e-mailadresse, før du kan sende venneanmodninger.';

  @override
  String get addFriendVerifyEmail => 'Bekræft e-mail';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Indgående venneanmodninger ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Udgående venneanmodninger ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Indgående venneanmodning';

  @override
  String get addFriendOutgoingStatus => 'Venneanmodning sendt';

  @override
  String get addFriendViewProfile => 'Vis profil';

  @override
  String get addFriendAccept => 'Accepter';

  @override
  String get addFriendIgnore => 'Ignorer';

  @override
  String get addFriendAcceptTitle => 'Accepter venneanmodning';

  @override
  String get addFriendIgnoreTitle => 'Ignorer venneanmodning';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Accepter venneanmodningen fra $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorer venneanmodningen fra $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Annuller anmodning';

  @override
  String get addFriendCancelRequestFailed =>
      'Kunne ikke annullere venneanmodningen. Prøv igen.';

  @override
  String get addFriendNotAcceptingRequests =>
      'De accepterer ikke venneanmodninger lige nu.';

  @override
  String get addFriendUnblockFirst =>
      'Fjern blokeringen af dem først for at sende en venneanmodning.';

  @override
  String get addFriendCannotSendToSelf =>
      'Du kan ikke sende en venneanmodning til dig selv.';

  @override
  String get addFriendAlreadyFriends =>
      'I er allerede venner med denne bruger.';

  @override
  String get addFriendClaimToSend =>
      'Afslut tilmeldingen for at sende venneanmodninger.';

  @override
  String get addFriendSendFailedGeneric =>
      'Kunne ikke sende venneanmodningen. Prøv igen.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder => 'Find din drømme-emoji';

  @override
  String get emojiSearchEmpty => 'Ingen emojis matcher din søgning';

  @override
  String get emojiAutocompleteDefaultLabel => 'Standard-emoji';

  @override
  String get emojiFrequentlyUsed => 'Ofte brugt';

  @override
  String get emojiTabGifs => 'GIF\'er';

  @override
  String get emojiTabMedia => 'Medier';

  @override
  String get emojiTabStickers => 'Klistermærker';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Søg efter GIF\'er';

  @override
  String get gifPickerSearchKlipy => 'Søg i KLIPY';

  @override
  String get gifPickerSearchTenor => 'Søg i Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoritter';

  @override
  String get gifPickerTrending => 'Populære GIF\'er';

  @override
  String get gifPickerNoResultsTitle => 'Ingen søgeresultater';

  @override
  String get gifPickerNoResultsDescription => 'Prøv et andet søgeord';

  @override
  String get gifPickerLoadFailedTitle => 'Kunne ikke indlæse GIF\'er';

  @override
  String get gifPickerLoadFailedBody => 'Tjek din forbindelse, og prøv igen.';

  @override
  String get emojiCategoryPeople => 'Personer';

  @override
  String get emojiCategoryNature => 'Natur';

  @override
  String get emojiCategoryFood => 'Mad & drikke';

  @override
  String get emojiCategoryActivity => 'Aktiviteter';

  @override
  String get emojiCategoryTravel => 'Rejser & steder';

  @override
  String get emojiCategoryObjects => 'Objekter';

  @override
  String get emojiCategorySymbols => 'Symboler';

  @override
  String get emojiCategoryFlags => 'Flag';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Lås op for $emojiCount ud af $communityCount med Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Få Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Vis mig ikke dette igen';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count brugerdefinerede emojis',
      one: '1 brugerdefineret emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fællesskaber',
      one: '1 fællesskab',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Advarsel om eksternt link';

  @override
  String get externalLinkWarningLeaving => 'Du er ved at forlade Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Eksterne links kan være farlige. Vær forsigtig.';

  @override
  String get externalLinkWarningDestinationUrl => 'Destinations-URL:';

  @override
  String get externalLinksSectionTitle => 'Eksterne links';

  @override
  String get externalLinksSectionDescription =>
      'Konfigurer, hvordan advarsler om eksterne links håndteres.';

  @override
  String get externalLinkWarningTrustPrefix => 'Stol altid på ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — spring denne advarsel over næste gang';

  @override
  String get externalLinkVisitSite => 'Besøg websted';

  @override
  String get externalLinkTrustAllLabel => 'Stol på alle eksterne links';

  @override
  String get externalLinkStripTrackingLabel =>
      'Fjern sporingsparametre fra URL\'er';

  @override
  String get externalLinkStripTrackingDescription =>
      'Fjern automatisk sporingsparametre (som utm_source, fbclid, gclid) fra URL\'er i beskeder, du sender. Rydder linket, før det når andre.';

  @override
  String get externalLinkTrustAllConfirmTitle => 'Stol på alle eksterne links?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Dette vil stole på alle eksterne links og springe advarslen over for hvert domæne. Dine eksisterende betroede domæner vil blive erstattet. Dette er mindre sikkert.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Stol på alle';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Stop med at stole på alle links?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Advarsler om eksterne links vil blive vist igen. Du skal tilføje betroede domæner individuelt.';

  @override
  String get externalLinkStopTrustingAllAction => 'Deaktiver stol på alle';

  @override
  String get externalLinkTrustedAllDescription =>
      'Alle eksterne links er betroede. Advarsler vil ikke blive vist.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Du har $count betroet domæne(r). Tilføj flere ved at markere afkrydsningsfeltet, når du besøger eksterne links.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Når aktiveret, vil ingen advarsler om eksterne links blive vist. Dette er mindre sikkert.';

  @override
  String get imageFileTooLarge =>
      'Billedfilen er for stor. Vælg venligst en fil, der er mindre end 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animerede avatarer kræver Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animerede bannere kræver Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animeret AVIF understøttes ikke';

  @override
  String get animatedAvifNotSupportedBody =>
      'Beskæring og rotation af animerede AVIF-filer understøttes endnu ikke. Hvis du fortsætter, uploades den i sin oprindelige form.';

  @override
  String get uploadAsIs => 'Upload som den er';

  @override
  String get croppingAnimatedNotSupported =>
      'Beskæring af animerede billeder understøttes endnu ikke. Den oprindelige upload vil blive brugt.';

  @override
  String get cropAvatar => 'Beskær avatar';

  @override
  String get cropBanner => 'Beskær banner';

  @override
  String get skip => 'Spring over';

  @override
  String get crop => 'Beskær';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Skift din Brugernavn';

  @override
  String get fluxerTagInputLabel => 'Brugernavn';

  @override
  String get fluxerTagDescriptionBase =>
      'Brugernavne kan kun indeholde bogstaver (a-z, A-Z), tal (0-9) og understregninger. Brugernavne er ufølsomme over for store og små bogstaver.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Brugernavne kan kun indeholde bogstaver (a-z, A-Z), tal (0-9) og understregninger. Brugernavne er ufølsomme over for store og små bogstaver. Du kan vælge enhver tilgængelig 4-cifret tag fra #0000 til #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Brugernavne kan kun indeholde bogstaver (a-z, A-Z), tal (0-9) og understregninger. Brugernavne er ufølsomme over for store og små bogstaver. Du kan vælge enhver tilgængelig 4-cifret tag fra #0001 til #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Mellem $min og $max tegn';
  }

  @override
  String get validationAllowedChars =>
      'Kun bogstaver (a-z, A-Z), tal (0-9) og understregninger (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Få Plutonium til at tilpasse din tag eller behold den, når du ændrer dit brugernavn';

  @override
  String get fluxerTagAlreadyTaken => 'Brugernavn er allerede taget';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Brugernavn $username#$discriminator er allerede taget. Fortsætter du, vil din discriminator blive omrullet automatisk.';
  }

  @override
  String get customTagIsTemporary => 'Brugerdefineret tag er midlertidig';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Din brugerdefinerede 4-cifrede tag er kun tilgængelig, mens dit Plutonium-abonnement er aktivt. Når dit abonnement udløber den $date, vil din tag vende tilbage til et tilfældigt tildelt nummer efter en 3-dages overgangsperiode.';
  }

  @override
  String get customTagTemporaryBody =>
      'Din brugerdefinerede 4-cifrede tag er kun tilgængelig, mens dit Plutonium-abonnement er aktivt. Når dit abonnement udløber, vil din tag vende tilbage til et tilfældigt tildelt nummer efter en 3-dages overgangsperiode.';

  @override
  String get iUnderstandContinue => 'Jeg forstår, fortsæt';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Hvis du gemmer denne Brugernavn, vil din brugerdefinerede 4-cifrede tag vende tilbage til et tilfældigt nummer, når dit Plutonium-abonnement udløber. Hvis dit abonnement ikke fornyes, har du en 3-dages overgangsperiode, før taggen ændres.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Din brugerdefinerede 4-cifrede tag (#$discriminator) er aktiv, mens dit Plutonium-abonnement er aktivt. Hvis dit abonnement udløber eller ikke fornyes efter en 3-dages overgangsperiode, vil din tag vende tilbage til et tilfældigt nummer.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Tilpas din 4-cifrede tag eller behold den, når du ændrer dit brugernavn';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Din Plutonium-prøveperiode udløber den $date. Opgrader for at beholde din brugerdefinerede tag og optjene et badge på din profil.';
  }

  @override
  String get premiumTrialActive =>
      'Du er på en Plutonium-prøveperiode. Opgrader for at beholde din brugerdefinerede tag og optjene et badge på din profil.';

  @override
  String get fluxerTagUpdated => 'Brugernavn opdateret';

  @override
  String get fluxerTagUpdateFailed =>
      'Kunne ikke opdatere Brugernavn. Prøv venligst igen.';

  @override
  String get continueAction => 'Fortsæt';

  @override
  String get profileCustomizationTitle => 'Profiltilpasning';

  @override
  String get profileCustomizationDescription =>
      'Rediger dit profils udseende og se en live-forhåndsvisning';

  @override
  String get usernameLabel => 'Brugernavn';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Kræv din konto for at ændre din Brugernavn';

  @override
  String get changeFluxerTag => 'Skift Brugernavn';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Tilpas din 4-cifrede tag (#$discriminator) som du vil med Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Skift dit brugernavn og 4-cifrede tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Din brugerdefinerede tag (#$discriminator) er knyttet til dit Plutonium-abonnement og vil blive gendannet til en tilfældig tag, hvis det udløber.';
  }

  @override
  String get displayNameLabel => 'Visningsnavn';

  @override
  String get pronounsLabel => 'Pronominer';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Skift avatar';

  @override
  String get removeAvatar => 'Fjern avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maks. 10MB. Anbefalet: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Skift banner';

  @override
  String get removeBanner => 'Fjern banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maks. 10MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Fremhævningsfarve';

  @override
  String get accentColorDescription =>
      'Tilpasser kantlinjen og bannerfarven på din profil';

  @override
  String get aboutMeLabel => 'Om mig';

  @override
  String get aboutMeHelperText => 'Du kan bruge links, emoji og Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Privatliv for Plutonium-badge';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Styr, hvordan dit Plutonium-badge vises for andre';

  @override
  String get hidePlutoniumBadgeLabel => 'Skjul Plutonium-badge helt';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Skjul dit Plutonium-badge fuldstændigt for andre brugere';

  @override
  String get hidePlutoniumPurchaseDate => 'Skjul købsdato for Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Skjul købsdato for Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Fjern hvornår du først købte Plutonium fra dit badge';

  @override
  String get maskVisionaryAsSubscription => 'Skjul Visionary som abonnement';

  @override
  String get maskVisionaryDescription =>
      'Vis din Visionary som et almindeligt abonnement i stedet';

  @override
  String get hideVisionaryIdBadge => 'Skjul Visionary ID-badge';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Skjul Visionary ID-badge (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Fjern dit Visionary ID-badge';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Du er på en Plutonium-prøveperiode — dit abonnement starter den $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Dit abonnement starter automatisk, når din prøveperiode slutter. Ingen handling er nødvendig.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Du er på en Plutonium-prøveperiode, der udløber den $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Du er på en Plutonium-prøveperiode';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maks. 10MB. Anbefalet: 512×512px. Animerede avatarer (GIF) kræver Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Tilpas din profil med et statisk eller animeret bannerbillede for at få den til at skille sig ud.';

  @override
  String get getPlutonium => 'Få Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Køb i appen er endnu ikke tilgængelige på denne platform. Følg med — kommer snart!';

  @override
  String get profilePreviewLabel => 'Forhåndsvisning';

  @override
  String get profilePreviewMessage => 'Besked';

  @override
  String get profilePreviewMemberSince => 'Fluxer-medlem siden';

  @override
  String get unclaimedAccountTitle => 'Ukrævet konto';

  @override
  String get unclaimedAccountDescription =>
      'Din konto er endnu ikke krænget. Uden en e-mail og adgangskode kan du miste adgangen. Kræv din konto nu for at sikre den.';

  @override
  String get claimAccount => 'Kræv konto';

  @override
  String get profileTypeLabel => 'Profiltype';

  @override
  String get profileTypeGlobal => 'Global profil';

  @override
  String get profileTypeGuildDescription =>
      'Du redigerer din profil pr. fællesskab. Denne profil vil kun være synlig i dette fællesskab og vil tilsidesætte din globale profil.';

  @override
  String get communityNicknameLabel => 'Fællesskabs-kaldenavn';

  @override
  String get perGuildPremiumUpsellText =>
      'Tilpasning af din avatar, banner, accentfarve og biografi for individuelle fællesskaber kræver Plutonium. Kaldenavn og pronominer i fællesskaber er gratis for alle.';

  @override
  String get avatarModeInherit => 'Brug global profil';

  @override
  String get avatarModeCustom => 'Brug brugerdefineret billede';

  @override
  String get avatarModeUnset => 'Vis ikke';

  @override
  String get profileSavedToast => 'Profil opdateret';

  @override
  String get profileEditButton => 'Rediger profil';

  @override
  String get profileNoteLabel => 'Note';

  @override
  String get profileNoteVisibility => '(kun synlig for dig)';

  @override
  String get profileNoteEmpty => 'Ingen note endnu.';

  @override
  String get sudoTitle => 'Bekræft din identitet';

  @override
  String get sudoDescription =>
      'Denne handling kræver bekræftelse for at fortsætte.';

  @override
  String get sudoAuthenticatorCode => 'Authenticator-kode';

  @override
  String get sudoMethodPassword => 'Adgangskode';

  @override
  String get sudoMethodTotp => 'Authenticator';

  @override
  String get sudoVerificationFailed => 'Bekræftelse mislykkedes. Prøv igen.';

  @override
  String get securityAccountTitle => 'Konto';

  @override
  String get securityAccountDescription =>
      'Administrer din e-mail, adgangskode og kontoindstillinger';

  @override
  String get securitySectionTitle => 'Sikkerhed';

  @override
  String get securitySectionDescription =>
      'Beskyt din konto med totrinsgodkendelse og adgangsnøgler';

  @override
  String get securityLoginEmailSectionTitle => 'E-mailindstillinger';

  @override
  String get securityLoginEmailSectionDescription =>
      'Administrer den e-mailadresse, du bruger til at logge ind på Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'E-mailadresse';

  @override
  String get securityLoginNoEmailSet => 'Ingen e-mailadresse angivet';

  @override
  String get securityLoginChangeEmail => 'Skift e-mail';

  @override
  String get securityLoginAddEmail => 'Tilføj e-mail';

  @override
  String get securityLoginReveal => 'Vis';

  @override
  String get securityLoginHide => 'Skjul';

  @override
  String get securityLoginPasswordSectionTitle => 'Adgangskode';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Skift din adgangskode for at holde din konto sikker';

  @override
  String get securityLoginCurrentPasswordLabel => 'Nuværende adgangskode';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Sidst ændret: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Sidst ændret: Aldrig';

  @override
  String get securityLoginNoPasswordSet => 'Ingen adgangskode angivet';

  @override
  String get securityLoginChangePassword => 'Skift adgangskode';

  @override
  String get securityLoginSetPassword => 'Angiv adgangskode';

  @override
  String get passwordChangeTitle => 'Skift adgangskode';

  @override
  String get passwordChangeIntroDescription =>
      'Vi sender en bekræftelseskode til din e-mailadresse for at bekræfte din identitet, før du skifter adgangskode.';

  @override
  String get passwordChangeStart => 'Start';

  @override
  String get passwordChangeVerifyTitle => 'Bekræft din e-mail';

  @override
  String get passwordChangeVerifyDescription =>
      'Indtast bekræftelseskoden, der blev sendt til din e-mailadresse.';

  @override
  String get passwordChangeVerificationCode => 'Bekræftelseskode';

  @override
  String get passwordChangeVerify => 'Bekræft';

  @override
  String get passwordChangeNewPasswordTitle => 'Angiv ny adgangskode';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Indtast din nye adgangskode nedenfor.';

  @override
  String get passwordChangeNewPassword => 'Ny adgangskode';

  @override
  String get passwordChangeConfirmPassword => 'Bekræft ny adgangskode';

  @override
  String get passwordChangeSubmit => 'Skift adgangskode';

  @override
  String get passwordChangeSuccess => 'Adgangskode ændret';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Adgangskoder stemmer ikke overens';

  @override
  String get passwordChangeInvalidCode => 'Ugyldig eller udløbet kode';

  @override
  String get emailChangeTitle => 'Skift e-mail';

  @override
  String get emailChangeIntroDescription =>
      'Vi sender bekræftelseskoder for at verificere din identitet, før vi ændrer din e-mailadresse.';

  @override
  String get emailChangeStart => 'Start';

  @override
  String get emailChangeVerifyOriginalTitle => 'Bekræft nuværende e-mail';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Indtast bekræftelseskoden, der blev sendt til din nuværende e-mailadresse.';

  @override
  String get emailChangeNewEmailTitle => 'Indtast ny e-mail';

  @override
  String get emailChangeNewEmailDescription =>
      'Indtast den nye e-mailadresse, du vil bruge.';

  @override
  String get emailChangeNewEmailLabel => 'Ny e-mail';

  @override
  String get emailChangeNewEmailSubmit => 'Send bekræftelseskode';

  @override
  String get emailChangeVerifyNewTitle => 'Bekræft ny e-mail';

  @override
  String get emailChangeVerifyNewDescription =>
      'Indtast bekræftelseskoden, der blev sendt til din nye e-mailadresse.';

  @override
  String get emailChangeSuccess => 'E-mail ændret';

  @override
  String get emailChangeInvalidCode => 'Ugyldig eller udløbet kode';

  @override
  String get resend => 'Send igen';

  @override
  String resendCountdown(int seconds) {
    return 'Send igen (${seconds}s)';
  }

  @override
  String get verificationCode => 'Bekræftelseskode';

  @override
  String get verify => 'Bekræft';

  @override
  String get enable => 'Aktivér';

  @override
  String get disable => 'Deaktivér';

  @override
  String get delete => 'Slet';

  @override
  String get save => 'Gem';

  @override
  String get securityTfaSectionTitle => 'To-faktor-godkendelse';

  @override
  String get securityTfaSectionDescription =>
      'Tilføj et ekstra sikkerhedslag til din konto';

  @override
  String get securityTfaAuthenticatorApp => 'Godkendelsesapp';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'To-faktor-godkendelse er aktiveret';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Brug en godkendelsesapp til at generere koder til totrinsgodkendelse';

  @override
  String get securityTfaBackupCodes => 'Sikkerhedskoder';

  @override
  String get securityTfaBackupCodesDescription =>
      'Se og administrer dine sikkerhedskoder til kontogendannelse';

  @override
  String get securityTfaViewCodes => 'Se koder';

  @override
  String get securityPasskeysSectionTitle => 'Adgangsnøgler';

  @override
  String get securityPasskeysSectionDescription =>
      'Brug adgangsnøgler til login uden adgangskode og totrinsgodkendelse';

  @override
  String get securityPasskeysRegistered => 'Registrerede adgangsnøgler';

  @override
  String get securityPasskeysNone => 'Ingen adgangsnøgler registreret';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'adgangsnøgler',
      one: 'adgangsnøgle',
    );
    return '$count $_temp0 registreret (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Tilføj adgangsnøgle';

  @override
  String securityPasskeysAdded(String date) {
    return 'Tilføjet: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Sidst brugt: $date';
  }

  @override
  String get securityPasskeysRename => 'Omdøb';

  @override
  String get securityPasskeysDeleteTitle => 'Slet adgangsnøgle';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Er du sikker på, at du vil slette adgangsnøglen \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Navngiv adgangsnøgle';

  @override
  String get securityPasskeyNameLabel => 'Adgangsnøglenavn';

  @override
  String get securityPasskeyNameHint =>
      'f.eks. YubiKey, iPhone, Arbejdscomputer';

  @override
  String get securityPhoneSectionTitle => 'Telefonnummer';

  @override
  String get securityPhoneSectionDescription =>
      'Administrer dit telefonnummer.';

  @override
  String get securityPhoneLabel => 'Telefonnummer';

  @override
  String get securityPhoneNone => 'Intet telefonnummer tilføjet.';

  @override
  String get securityPhoneAdd => 'Tilføj telefon';

  @override
  String get securityPhoneRemove => 'Fjern';

  @override
  String get securityPhoneRemoveTitle => 'Fjern telefonnummer';

  @override
  String get securityPhoneRemoveDescription =>
      'Er du sikker på, at du vil fjerne dit telefonnummer?';

  @override
  String get securityPhoneRemoved => 'Telefonnummer fjernet';

  @override
  String get securityClaimTitle => 'Sikkerhedsfunktioner';

  @override
  String get securityClaimDescription =>
      'Gør krav på din konto for at få adgang til sikkerhedsfunktioner som totrinsgodkendelse og adgangsnøgler.';

  @override
  String get securityVerifyEmailRequired =>
      'Du skal bekræfte din e-mailadresse, før du kan opsætte totrinsgodkendelse, adgangsnøgler eller SMS-bekræftelse.';

  @override
  String get totpEnableTitle => 'Opsætning af godkendelsesapp';

  @override
  String get totpEnableDescription =>
      'Scan QR-koden med din godkendelsesapp for at generere koder til totrinsgodkendelse.';

  @override
  String get totpEnableCodeLabel => 'Kode';

  @override
  String get totpEnableCodeHint =>
      'Indtast den 6-cifrede kode fra din godkendelsesapp';

  @override
  String get totpEnableSuccess => 'Totrinsgodkendelse er blevet aktiveret';

  @override
  String get totpDisableTitle => 'Fjern godkendelsesapp';

  @override
  String get totpDisableDescription =>
      'Indtast den 6-cifrede kode fra din godkendelsesapp for at deaktivere totrinsgodkendelse.';

  @override
  String get totpDisableSuccess => 'Totrinsgodkendelse deaktiveret';

  @override
  String get backupCodesTitle => 'Sikkerhedskopieringskoder';

  @override
  String get backupCodesWarning =>
      'Hvis du mister adgangen til din godkendelsesapp og ikke har disse koder, vil du blive permanent låst ude af din konto. Download eller kopier dem nu, og gem dem et sikkert sted.';

  @override
  String get backupCodesDownload => 'Download';

  @override
  String get backupCodesCopy => 'Kopiér';

  @override
  String get backupCodesCopied =>
      'Sikkerhedskopieringskoder kopieret til udklipsholderen';

  @override
  String get backupCodesAcknowledge =>
      'Jeg har downloadet eller kopieret mine sikkerhedskopieringskoder og gemt dem et sikkert sted.';

  @override
  String get backupCodesDone => 'Færdig';

  @override
  String get backupCodesViewTitle => 'Vis sikkerhedskopieringskoder';

  @override
  String get backupCodesViewDescription =>
      'Verifikation kan være påkrævet, før du kan se dine sikkerhedskopieringskoder.';

  @override
  String get phoneAddTitle => 'Tilføj telefonnummer';

  @override
  String get phoneAddLabel => 'Telefonnummer';

  @override
  String get phoneAddHint => 'Indtast dit telefonnummer';

  @override
  String get phoneAddFooter =>
      'Indtast dit telefonnummer. Vi sender dig en bekræftelseskode via SMS.';

  @override
  String get phoneAddSendCode => 'Send kode';

  @override
  String get phoneVerifyTitle => 'Bekræft telefonnummer';

  @override
  String get phoneVerifyDescription =>
      'Indtast bekræftelseskoden, der blev sendt til dit telefonnummer.';

  @override
  String get phoneAddSuccess => 'Telefonnummer tilføjet';

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
  String get dangerZoneSectionTitle => 'Farezone';

  @override
  String get dangerZoneSectionDescription =>
      'Uigenkaldelige og destruktive handlinger';

  @override
  String get dangerZoneDisableTitle => 'Deaktiver konto';

  @override
  String get dangerZoneDisableDescription =>
      'Deaktiver din konto midlertidigt. Du kan genaktivere den senere ved at logge ind igen.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Deaktivering af din konto vil logge dig ud af alle sessioner. Du kan genaktivere din konto når som helst ved at logge ind igen.';

  @override
  String get dangerZoneDeleteTitle => 'Slet konto';

  @override
  String get dangerZoneDeleteDescription =>
      'Slet din konto og alle tilknyttede data permanent. Denne handling kan ikke fortrydes.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Annuller dit aktive Plutonium-abonnement i Plutonium-indstillingerne, før du sletter din konto.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Kan ikke slette konto';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Du kan ikke slette din konto, mens du ejer communities. Overfør ejerskab af følgende communities først:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'og $count mere';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'For at overføre ejerskab skal du gå til $settingsPath og bruge muligheden for at overføre ejerskab.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Er du sikker på, at du vil slette din konto? Denne handling vil planlægge din konto til permanent sletning.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Du kan annullere sletteprocessen inden for 14 dage';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Efter 14 dage vil din konto blive slettet permanent';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Når sletningen er behandlet, kan du ikke genvinde adgangen til din konto';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Du vil ikke kunne slette dine sendte beskeder, efter din konto er slettet';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Hvis du vil eksportere dine data eller slette dine beskeder først, skal du besøge sektionen Privatlivsoverblik i Brugerindstillinger, før du fortsætter.';

  @override
  String get claimAccountTitle => 'Gør krav på din konto';

  @override
  String get claimAccountDescription =>
      'Gør krav på din konto ved at tilføje en e-mail og adgangskode. Vi sender en bekræftelseskode for at bekræfte din e-mail, før vi afslutter.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Adgangskode';

  @override
  String get claimAccountSendCode => 'Send kode';

  @override
  String get claimAccountVerifyDescription =>
      'Indtast den kode, vi sendte til din e-mail, for at bekræfte den. Din adgangskode vil blive indstillet, når koden er bekræftet.';

  @override
  String get claimAccountSuccess => 'Konto oprettet succesfuldt';

  @override
  String get importantInformation => 'Vigtig information:';

  @override
  String get genericError => 'Der opstod en fejl';

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
      other: '$count dage siden',
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
      one: '1 minut siden',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'lige nu';

  @override
  String get authorizedAppsTitle => 'Autoriserede applikationer';

  @override
  String get authorizedAppsDescription =>
      'Disse applikationer har fået adgang til din Fluxer-konto.';

  @override
  String get authorizedAppsEmptyTitle => 'Ingen autoriserede applikationer';

  @override
  String get authorizedAppsEmptyDescription =>
      'Du har ikke autoriseret nogen applikationer til at få adgang til din konto.';

  @override
  String get authorizedAppsLoadError =>
      'Kunne ikke indlæse autoriserede applikationer';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autoriseret den $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Tilladelser givet';

  @override
  String get authorizedAppsRevoke => 'Tilbagekald';

  @override
  String get authorizedAppsRevokeTitle => 'Tilbagekald applikationsadgang';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Er du sikker på, at du vil tilbagekalde adgangen for $appName? Denne applikation vil ikke længere have adgang til din konto.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Få adgang til dine grundlæggende profiloplysninger (brugernavn, avatar osv.)';

  @override
  String get authorizedAppsScopeEmail => 'Se din e-mailadresse';

  @override
  String get authorizedAppsScopeGuilds => 'Se de fællesskaber, du er medlem af';

  @override
  String get authorizedAppsScopeConnections => 'Se dine tilsluttede konti';

  @override
  String get authorizedAppsScopeBot =>
      'Tilføj en bot til et fællesskab med de ønskede tilladelser';

  @override
  String get authorizedAppsScopeAdmin =>
      'Få adgang til administrative slutpunkter';

  @override
  String get privacyPendingDeletionTitle => 'Afventer sletning';

  @override
  String get blockedUsersTitle => 'Blokerede brugere';

  @override
  String get blockedUsersDescription =>
      'Blokerede brugere kan ikke sende dig venneanmodninger eller skrive direkte til dig.';

  @override
  String get blockedUsersEmptyTitle => 'Ingen blokerede brugere';

  @override
  String get blockedUsersEmptyDescription =>
      'Du har ikke blokeret nogen endnu.';

  @override
  String get blockedUsersLoadError => 'Kunne ikke indlæse blokerede brugere';

  @override
  String get blockedUsersUnblock => 'Fjern blokering';

  @override
  String get blockedUsersUnblockTitle => 'Fjern blokering af bruger';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Er du sikker på, at du vil fjerne blokeringen af $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopiér Brugernavn';

  @override
  String get blockedUsersCopyId => 'Kopiér bruger-ID';

  @override
  String get userProfileLoadError => 'Kunne ikke indlæse profil';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'Prøv igen';

  @override
  String get userProfileMessage => 'Besked';

  @override
  String get userProfileVoiceCall => 'Stemmekald';

  @override
  String get userProfileVideoCall => 'Videoopkald';

  @override
  String get userProfileEditProfile => 'Rediger profil';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer personale';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer fællesskabsteam';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium-abonnent siden $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionær';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionær siden $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionær ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Fælles venner ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Fælles fællesskaber ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Fælles venner';

  @override
  String get userProfileMutualCommunitiesTitle => 'Fælles fællesskaber';

  @override
  String get userProfileNoMutualFriends => 'Ingen fælles venner fundet.';

  @override
  String get userProfileNoMutualCommunities =>
      'Ingen fælles fællesskaber fundet.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Kaldenavn: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Åbn DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Du har blokeret $username. Du kan ikke sende beskeder, medmindre du fjerner blokeringen.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Fjern blokering';

  @override
  String get userProfileOpenDm => 'Åbn DM';

  @override
  String get userProfileNoteTitle => 'Note';

  @override
  String get userProfileNoteVisibility => '(kun synlig for dig)';

  @override
  String get userProfileNoteSave => 'Gem';

  @override
  String get userProfileNoteDelete => 'Slet';

  @override
  String get userProfileNoteEmpty => 'Klik for at tilføje en note';

  @override
  String get userProfileMemberSince => 'Medlem siden';

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
  String get userProfileCopyUsername => 'Kopiér brugernavn';

  @override
  String get userProfileCopyUserId => 'Kopiér bruger-ID';

  @override
  String get userProfileViewMainProfile => 'Vis hovedprofil';

  @override
  String get userProfileViewCommunityProfile => 'Vis fællesskabsprofil';

  @override
  String get userProfileBlockUser => 'Bloker bruger';

  @override
  String get userProfileUnblockUser => 'Fjern blokering af bruger';

  @override
  String get userProfileRemoveFriend => 'Fjern ven';

  @override
  String get userProfileBlockConfirmTitle => 'Bloker bruger';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Er du sikker på, at du vil blokere $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Fjern blokering af bruger';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Er du sikker på, at du vil fjerne blokeringen af $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Fjern ven';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Er du sikker på, at du vil fjerne $username som ven?';
  }

  @override
  String get userProfileFailedOpenDm => 'Kunne ikke åbne DM';

  @override
  String get userProfileFailedSaveNote => 'Kunne ikke gemme note';

  @override
  String get userProfileActionFailed => 'Handling mislykkedes, prøv igen';

  @override
  String get userProfileChangeNickname => 'Skift kaldenavn';

  @override
  String get userProfileKick => 'Spark ud';

  @override
  String get userProfileBan => 'Banlys';

  @override
  String get userProfileTimeout => 'Tidsbegræns';

  @override
  String get userProfileRemoveTimeout => 'Fjern tidsbegrænsning';

  @override
  String get userProfileTransferOwnership => 'Overfør ejerskab';

  @override
  String get userProfileReportUser => 'Anmeld bruger';

  @override
  String get userProfileReportMessage => 'Anmeld besked';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Spark $username ud?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Er du sikker på, at du vil sparke $username ud? De kan genindtræde med en ny invitation.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Fjern timeout?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Fjernelse af timeout vil give $username mulighed for at sende beskeder, reagere og deltage i stemmekanaler igen.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Overfør ejerskab?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Overfør ejerskab af dette community til $username? Dette kan ikke fortrydes, og du vil miste alle ejerrettigheder.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Ban $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Ban-varighed';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Brugerdefineret varighed (sekunder)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Enhver værdi fra $min til $max sekunder';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Slet beskedhistorik';

  @override
  String get userProfileBanDeleteNone => 'Slet ingen';

  @override
  String get userProfileBanDelete24h => 'Forrige 24 timer';

  @override
  String get userProfileBanDelete7d => 'Forrige 7 dage';

  @override
  String get userProfileBanReasonLabel => 'Årsag (valgfri)';

  @override
  String get userProfileBanReasonHint => 'Indtast en årsag til ban';

  @override
  String get userProfileBanSubmit => 'Ban medlem';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Timeout $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Timeout-varighed';

  @override
  String get userProfileTimeoutSubmit => 'Timeout medlem';

  @override
  String get userProfileNicknameLabel => 'Kaldenavn';

  @override
  String get userProfileNicknameHint => 'Indtast et kaldenavn';

  @override
  String get userProfileNicknameSave => 'Gem';

  @override
  String userProfileKickSuccess(String username) {
    return 'Har smidt $username ud';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Har banlyst $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Har sat $username i timeout';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Har fjernet timeout for $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Kaldenavn opdateret';

  @override
  String get userProfileTransferSuccess => 'Ejerskab overført';

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
  String get duration3Days => '3 dage';

  @override
  String get duration5Days => '5 dage';

  @override
  String get duration1Week => '1 uge';

  @override
  String get duration2Weeks => '2 uger';

  @override
  String get duration1Month => '1 måned';

  @override
  String get durationCustom => 'Brugerdefineret...';

  @override
  String get iarReportUserTitle => 'Anmeld bruger';

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
      'Denne brugers profil indeholder upassende indhold';

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
  String get typingIndicatorHandful => 'En håndfuld tastaturkrigere samles...';

  @override
  String get typingIndicatorSymphony => 'En symfoni af tastetryk er i gang...';

  @override
  String get typingIndicatorFiesta =>
      'Det er en fuldblods skrive-fiesta herinde';

  @override
  String get typingIndicatorApocalypse =>
      'Hold da op, det er en skrive-apokalypse';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Glad for at du er her, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Velkommen, $username! Føl dig hjemme.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hej, $username! Dejligt at have dig her.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hej, $username! Hop ind, når du er klar.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hej $username, dejligt at se dig her!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hej $username! Håber du nyder dit ophold.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hej, $username, velkommen ombord!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Glad for at du kom, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Velkommen indenfor, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Velkommen, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Velkommen, $username! Vi er glade for, at du er her.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Velkommen, $username! Håber du nyder din tid her.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Velkommen, $username! Din næste samtale starter her.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Velkommen, $username. Vi er glade for at have dig her.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Dejligt at se dig, $username! Velkommen indenfor.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Du er her, $username! Dejligt at have dig med os.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Du er ankommet, $username! Lad os komme i gang.';
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
      other: '${count}m',
      one: '1m',
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
  String get linkedDevicesTitle => 'Mine enheder';

  @override
  String get linkedDevicesDescription =>
      'Se alle enheder, der er logget ind på din konto. Afbryd eventuelle sessioner, du ikke genkender.';

  @override
  String get linkedDevicesCurrentDevice => 'Nuværende enhed';

  @override
  String get linkedDevicesOtherDevices => 'Andre enheder';

  @override
  String get linkedDevicesEnterSelection => 'Gå til valgtilstand';

  @override
  String get linkedDevicesExitSelection => 'Afslut valgtilstand';

  @override
  String get linkedDevicesSelectAll => 'Vælg alle';

  @override
  String get linkedDevicesClearSelection => 'Ryd valg';

  @override
  String get linkedDevicesRevokeTooltip => 'Afbryd enhed';

  @override
  String get linkedDevicesSignOutAll => 'Log alle andre enheder ud';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Log $count enheder ud',
      one: 'Log 1 enhed ud',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Log $count enheder ud',
      one: 'Log 1 enhed ud',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Log alle andre enheder ud';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Dette vil logge de valgte enheder ud af din konto. Du skal logge ind igen på de enheder.',
      one:
          'Dette vil logge den valgte enhed ud af din konto. Du skal logge ind igen på den enhed.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Dette vil logge de valgte enheder ud af din konto. Du skal logge ind igen på de enheder.';

  @override
  String get linkedDevicesSignOutConfirm => 'Fortsæt';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Du skal logge ind igen på alle udloggede enheder';

  @override
  String get linkedDevicesLoadErrorTitle => 'Netværksfejl';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Vi har problemer med at forbinde til rum-tid-kontinuummet. Tjek venligst din forbindelse og prøv igen.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Enheder afbrudt',
      one: 'Enhed afbrudt',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Kunne ikke logge ud. Prøv igen.';

  @override
  String get linkedDevicesUnknownOs => 'Ukendt OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Ukendt platform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration langsom tilstand';
  }

  @override
  String get slowmodeTooltipActive =>
      'Du er i langsom tilstand. Vent venligst, før du sender en ny besked.';

  @override
  String get slowmodeTooltipImmune =>
      'Langsom tilstand er aktiveret, men du er immun.';

  @override
  String get slowmodeStatusEnabled => 'Slowmode is enabled';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Slowmode is active ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Slowmode is set to $durationLabel, but you are immune.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Slowmode is set to $durationLabel. Wait before sending another message.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Slowmode is set to $durationLabel for this channel.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Du kan ikke sende beskeder i denne kanal.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Systemmeddelelser fra $productName personale. Du kan ikke svare her.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Beskeder er midlertidigt sat på pause i dette fællesskab.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Du er blevet timeout. Beskeder, reaktioner og tale er sat på pause, indtil timeouten udløber.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Du skal gøre krav på din konto for at sende beskeder i dette fællesskab.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Du skal bekræfte din e-mail for at sende beskeder i dette fællesskab.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Din konto er for ny til at sende beskeder i dette fællesskab.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Du har ikke været medlem af dette fællesskab længe nok til at sende beskeder.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Du skal bekræfte et telefonnummer for at sende beskeder i dette fællesskab.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Bekræft e-mail';

  @override
  String get channelComposerBarrierVerifyPhone => 'Bekræft telefon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'For mange vedhæftninger (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'En eller flere filer overskrider størrelsesgrænsen';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Disse filer er for store til at sende sammen';

  @override
  String get chatAttachmentDropToUpload => 'Slip filer for at uploade';

  @override
  String get chatAttachmentDropToSend => 'Slip filer for at sende nu';

  @override
  String get chatAttachmentSendVoiceMessage => 'Send stemmemeddelelse';

  @override
  String get voiceMessageTitle => 'Stemmemeddelelse';

  @override
  String get voiceMessageHoldHint =>
      'Hold nede for at optage. Træk op for at låse, eller slip for at sende.';

  @override
  String get voiceMessageDiscard => 'Kassér stemmemeddelelse';

  @override
  String get voiceMessageSend => 'Send stemmemeddelelse';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Kan ikke starte optagelse. Giv adgang til mikrofon.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Stemmeoptagelse understøttes ikke på denne enhed.';

  @override
  String get voiceMessageMicInUse =>
      'Forlad taleopkaldet for at optage en stemmemeddelelse.';

  @override
  String get voiceMessageRecordingFailed => 'Optagelse mislykkedes. Prøv igen.';

  @override
  String get voiceMessageSendFailed =>
      'Kunne ikke sende stemmemeddelelse. Prøv igen.';

  @override
  String get voiceMessageRecordingHint =>
      'Tal nu. Tryk på Stop, når du er færdig — du kan trimme bagefter.';

  @override
  String get voiceMessageReviewHint =>
      'Træk i håndtagene for at trimme, og tryk derefter på Send.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Start optagelse';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Afspil';

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

    return 'Udvalg skal være mindst ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Rediger vedhæftning';

  @override
  String get chatAttachmentFilenameLabel => 'Filnavn';

  @override
  String get chatAttachmentDescriptionLabel => 'Beskrivelse';

  @override
  String get chatAttachmentDescriptionHint => 'Valgfri alt-tekst';

  @override
  String get chatAttachmentSpoilerLabel => 'Marker som spoiler';

  @override
  String get chatAttachmentRemove => 'Fjern vedhæftning';

  @override
  String get chatAttachmentDownload => 'Download';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Vedhæftning udløbet';

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
  String get chatAttachmentSourceBrowse => 'Gennemse filer';

  @override
  String get chatAttachmentPasteTooltip => 'Indsæt billede fra udklipsholder';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Vis spoiler';

  @override
  String get matureMediaRevealButton => 'Vis';

  @override
  String get matureMediaRevealHint => 'Klik for at vise';

  @override
  String get matureContentTitle => 'Modent indhold';

  @override
  String get matureCommunityTitle => 'Moden fællesskab';

  @override
  String get matureCategoryTitle => 'Moden kategori';

  @override
  String get matureChannelTitle => 'Moden kanal';

  @override
  String get communityContentWarningTitle => 'Advarsel om indhold i fællesskab';

  @override
  String get categoryContentWarningTitle => 'Advarsel om indhold i kategori';

  @override
  String get channelContentWarningTitle => 'Advarsel om indhold i kanal';

  @override
  String get defaultContentWarningBody => 'Dette indeholder følsomt indhold.';

  @override
  String get matureCommunityBody =>
      'Dette fællesskab er markeret for modent indhold og kan indeholde materiale, der kan være upassende for nogle brugere.';

  @override
  String get matureCategoryBody =>
      'Denne kategori er markeret for modent indhold og kan indeholde materiale, der kan være upassende for nogle brugere.';

  @override
  String get matureChannelBody =>
      'Denne kanal er markeret for modent indhold og kan indeholde materiale, der kan være upassende for nogle brugere.';

  @override
  String get matureVoiceChannelBody =>
      'Denne stemmekanal er markeret for modent indhold og kan indeholde materiale, der kan være upassende for nogle brugere.';

  @override
  String get matureLinkChannelBody =>
      'Denne linkkanal er markeret for modent indhold og kan åbne materiale, der kan være upassende for nogle brugere.';

  @override
  String get matureCommunityUnavailableBody =>
      'Dette modne fællesskab er ikke tilgængeligt for din konto.';

  @override
  String get matureCategoryUnavailableBody =>
      'Denne modne kategori er ikke tilgængelig for din konto.';

  @override
  String get matureChannelUnavailableBody =>
      'Denne modne kanal er ikke tilgængelig for din konto.';

  @override
  String get matureContentProceedButton => 'Fortsæt';

  @override
  String get matureContentUnderstandButton => 'Jeg forstår';

  @override
  String get matureContentOpenLinkButton => 'Åbn link';

  @override
  String get sensitiveContentSectionTitle => 'Følsomt indhold';

  @override
  String get sensitiveContentSectionDescription =>
      'Styr, hvordan modent eller følsomt medie filtreres i forskellige sammenhænge';

  @override
  String get sensitiveContentFriendDmLabel => 'Direkte beskeder fra venner';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Direkte beskeder fra andre';

  @override
  String get sensitiveContentGuildLabel => 'Beskeder i fællesskabskanaler';

  @override
  String get sensitiveContentFilterShow => 'Vis';

  @override
  String get sensitiveContentFilterBlur => 'Slør';

  @override
  String get sensitiveContentFilterBlock => 'Bloker';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Slør medie, indtil sikkerhedsscanning er færdig';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Når det er aktiveret, sløres billeder og videoer, indtil indholdssikkerhedsscanningen er færdig.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Denne indstilling er altid slået til for din konto.';

  @override
  String get sensitiveContentResetButton => 'Nulstil';

  @override
  String get sensitiveContentSaveButton => 'Gem';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '1 fil',
    );
    return 'Overfører $_temp0';
  }

  @override
  String get chatCancelUpload => 'Annuller overførsel';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Udløber den $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Udløber mellem $start og $end';
  }

  @override
  String get connectionsTitle => 'Forbindelser';

  @override
  String get connectionsDescription =>
      'Knyt eksterne konti og domæner til din Fluxer-profil. Verificerede forbindelser vil blive vist på din profil, så andre kan se dem.';

  @override
  String get connectionsEmptyTitle => 'Ingen forbindelser endnu';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Knyt din Bluesky-konto eller verificer domæneejerskab for at vise dem på din profil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verificer domæneejerskab for at vise det på din profil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domæne';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Tilføj Bluesky-forbindelse';

  @override
  String get connectionsAddDomainAriaLabel => 'Tilføj domæneforbindelse';

  @override
  String get connectionEdit => 'Rediger';

  @override
  String get connectionRemove => 'Fjern';

  @override
  String get connectionVerifiedLabel =>
      'Denne forbindelse er blevet verificeret.';

  @override
  String get connectionUnverifiedLabel =>
      'Denne forbindelse er ikke blevet verificeret.';

  @override
  String get connectionAddTitle => 'Tilføj forbindelse';

  @override
  String get connectionTypeLabel => 'Forbindelsestype';

  @override
  String get connectionHandleLabel => 'Brugernavn';

  @override
  String get connectionDomainLabel => 'Domæne';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Du har allerede denne forbindelse.';

  @override
  String get connectionConnectBluesky => 'Forbind med Bluesky';

  @override
  String get connectionContinue => 'Fortsæt';

  @override
  String get connectionVerifyTitle => 'Bekræft forbindelse';

  @override
  String get connectionVerifyInstructions =>
      'Brug posten herunder til at bevise ejerskab af domænet.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT-post';

  @override
  String get connectionDnsHostLabel => 'Vært';

  @override
  String get connectionDnsValueLabel => 'Værdi';

  @override
  String get connectionCopyHost => 'Kopiér vært';

  @override
  String get connectionCopyValue => 'Kopiér værdi';

  @override
  String get connectionCopied => 'Kopieret!';

  @override
  String get connectionTokenFileTitle => 'Server tokenfilen';

  @override
  String get connectionTokenFileDescription =>
      'Download **fluxer-verification** og placer den i din **.well-known**-mappe, så vi kan validere domænet.';

  @override
  String get connectionTokenFileDownload => 'Download fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Filen indeholder den verificeringstoken, vi vil hente fra **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Gem fluxer-verification';

  @override
  String get connectionVerifyButton => 'Verificer';

  @override
  String get connectionBack => 'Tilbage';

  @override
  String get connectionEditTitle => 'Rediger forbindelse';

  @override
  String get connectionEditDescription =>
      'Vælg, hvem der kan se denne forbindelse på din profil.';

  @override
  String get connectionVisibilityEveryone => 'Alle';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Tillad enhver at se denne forbindelse på din profil';

  @override
  String get connectionVisibilityFriends => 'Venner';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Tillad dine venner at se denne forbindelse';

  @override
  String get connectionVisibilityCommunityMembers => 'Fællesskabsmedlemmer';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Tillad medlemmer fra fællesskaber, du er en del af, at se denne forbindelse';

  @override
  String get connectionRemoveTitle => 'Fjern forbindelse';

  @override
  String get connectionRemoveDescription =>
      'Er du sikker på, at du vil fjerne denne forbindelse? Denne handling kan ikke fortrydes.';

  @override
  String get connectionRemoveConfirm => 'Fjern';

  @override
  String get connectionsLoadError => 'Kunne ikke indlæse forbindelser';

  @override
  String get connectionsReorderError => 'Kunne ikke opdatere rækkefølge';

  @override
  String get connectionInitiateFailed =>
      'Kunne ikke starte verificering. Prøv igen.';

  @override
  String get connectionVerifyFailed =>
      'Kunne ikke verificere. Tjek din DNS-record og prøv igen.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Kunne ikke starte Bluesky-autorisation.';

  @override
  String get connectionUpdateFailed => 'Kunne ikke opdatere forbindelse';

  @override
  String get connectionRemoveFailed => 'Kunne ikke fjerne forbindelse';

  @override
  String get connectionTokenSavedToast => 'Gemt fluxer-verificering';

  @override
  String get connectionTokenSaveFailedToast => 'Kunne ikke gemme fil';

  @override
  String get connectionEnterHandle => 'Indtast et Bluesky-håndtag.';

  @override
  String get connectionEnterDomain => 'Indtast et domæne.';

  @override
  String get lookAndFeelTitle => 'Udseende';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Vælg mellem mørk, kulfarvet eller lys udseende.';

  @override
  String get lookAndFeelHdrSectionTitle => 'High dynamic range';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Control how HDR images are displayed on HDR-capable monitors.';

  @override
  String get lookAndFeelHdrFullName => 'Full dynamic range';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Display HDR images at full brightness and color range.';

  @override
  String get lookAndFeelHdrStandardName => 'Standard range';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Tone-map HDR images to standard range, reducing peak brightness.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'High dynamic range display mode';

  @override
  String get lookAndFeelThemeDark => 'Mørkt tema';

  @override
  String get lookAndFeelThemeCoal => 'Kultema';

  @override
  String get lookAndFeelThemeLight => 'Lyst tema';

  @override
  String get lookAndFeelThemeSystem => 'Systemtema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synkroniser tema på tværs af enheder';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Når det er aktiveret, synkroniseres temaændringer til alle dine enheder. Når det er deaktiveret, bruger denne enhed sin egen tema-indstilling.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Systemtema deaktiverer automatisk synkronisering for at spore din systemspræference på denne enhed.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Kunne ikke synkronisere tema til din konto. Prøv igen.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Skalering af chat-skrifttype';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Juster skriftstørrelsen i chatområdet.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Chat font size';

  @override
  String get lookAndFeelAppZoomTitle => 'App zoom level';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Adjust the application\'s zoom level.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Messages';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Choose how messages are displayed in chat channels.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Space between message groups';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Message display mode';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Comfy';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Spacious layout with clear visual separation between messages.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Dense';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximizes visible messages with minimal spacing.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Hide user avatars';

  @override
  String get lookAndFeelInterfaceTitle => 'Brugerflade';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Tilpas brugerfladeelementer og adfærd.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Skrivningsindikatorer i kanal-liste';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Vælg, hvordan skrivningsindikatorer vises i kanal-listen, når nogen skriver i en kanal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Skrivningsindikator + avatarer';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Vis skrivningsindikator med brugeravatarer i kanal-listen';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Kun skrivningsindikator';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Vis kun skrivningsindikatoren uden avatarer';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Skjult';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Vis ikke skrivningsindikatorer i kanal-listen';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Vis skrivning i valgt kanal';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Når deaktiveret (standard), vises skrivningsindikatorer ikke i den kanal, du i øjeblikket ser.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'generel';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Tastaturhints';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Styr, om tastaturgenvejs-hints vises i værktøjstip.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Skjul tastaturhints i værktøjstip';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Når det er aktiveret, skjules genvejs-ikoner i værktøjstip-popups.';

  @override
  String get lookAndFeelNekoTitle => 'Diverse';

  @override
  String get lookAndFeelNekoDescription => 'Diverse brugerfladeindstillinger.';

  @override
  String get lookAndFeelShowNekoLabel => 'Vis Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Når det er aktiveret, vises Neko nær chat-inputfeltet.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => 'Adgang til stemmekanal';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Styr, hvordan du tilgår stemmekanaler i communities.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Kræv dobbeltklik for at tilgå stemmekanaler';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Når det er aktiveret, skal du dobbeltklikke på stemmekanaler for at tilgå dem. Når det er deaktiveret (standard), tilgår et enkelt klik kanalen med det samme.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Den hurtige brune ræv springer over den dovne hund.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Server-sidebar';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigurer, hvordan server-sidebaren viser direkte beskeder.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count communities er midlertidigt utilgængelige på grund af en fejl i flux-kondensatoren.',
      one:
          '1 community er midlertidigt utilgængelig på grund af en fejl i flux-kondensatoren.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Kollaps DM\'er i mappe';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Når det er aktiveret, kollapses ulæste DM\'er i server-sidebaren til en mappe på Fluxer-knappen. Klik på Fluxer-knappen, mens du er på DM-siden, for at udvide eller kollapse mappen.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanal-liste';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Styr opførslen af ulæste indikatorer for lydløse kanaler i kanal-lister.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Vis ulæst indikator på lydløse kanaler';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Når det er aktiveret, viser lydløse kanaler en svag ulæst indikator til venstre. Mentioner vises stadig uanset denne indstilling.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktiv nu';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Styr, hvordan Aktiv nu vises i appen.';

  @override
  String get lookAndFeelShowActiveNowLabel => 'Vis Aktiv nu på startskærmen';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Vis Aktiv nu på startskærmen for at vise venner, der er aktive i stemme. Du vil se en forhåndsvisning, kanalens kontekst, hvem der allerede er der, og en hurtig måde at deltage på.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoritter';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Styr synligheden af favoritter i hele appen.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Aktivér favoritter';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Når det er aktiveret, kan du markere kanaler som favoritter, og de vises i sektionen Favoritter. Når det er deaktiveret, skjules alle favorit-relaterede UI-elementer (knapper, menupunkter). Dine eksisterende favoritter bevares.';

  @override
  String get favoritesTitle => 'Favoritter';

  @override
  String get favoritesEmptyTitle => 'Ingen favoritter endnu';

  @override
  String get favoritesEmptyDescription =>
      'Stjernemarkér kanaler fra chat-headeren for at have dem her.';

  @override
  String get favoritesWelcomeTitle => 'Velkommen til favoritter';

  @override
  String get favoritesWelcomeDescription =>
      'Dit personlige rum til hurtig adgang til kanaler, DMs og grupper, du elsker. Tryk på stjernen på en hvilken som helst kanal for at tilføje den her.';

  @override
  String get favoritesWelcomeTip =>
      'Ikke noget for dig? Slå det fra når som helst.';

  @override
  String get favoritesDisableButton => 'Deaktiver favoritter';

  @override
  String get favoritesAddedToast => 'Tilføjet til favoritter';

  @override
  String get favoritesRemovedToast => 'Fjernet fra favoritter';

  @override
  String get favoritesHiddenToast => 'Favoritter skjult';

  @override
  String get favoritesMute => 'Slå favoritter fra';

  @override
  String get favoritesUnmute => 'Slå favoritter til';

  @override
  String get favoritesHeaderMenu => 'Favorit-menu';

  @override
  String get favoritesCreateCategory => 'Opret kategori';

  @override
  String get favoritesCategoryNameLabel => 'Kategorinavn';

  @override
  String get favoritesHideMutedChannels => 'Skjul slåede kanaler fra';

  @override
  String get favoritesShowMutedChannels => 'Vis slåede kanaler fra';

  @override
  String get favoritesSetNickname => 'Angiv kaldenavn';

  @override
  String get favoritesNicknameLabel => 'Kaldenavn';

  @override
  String get favoritesSaveNickname => 'Gem kaldenavn';

  @override
  String get favoritesMoveToCategory => 'Flyt til kategori';

  @override
  String get favoritesUncategorized => 'Ikke kategoriseret';

  @override
  String get favoritesOtherCategory => 'Andet';

  @override
  String get favoritesRemoveFromFavorites => 'Fjern fra favoritter';

  @override
  String get favoritesAddToFavorites => 'Tilføj til favoritter';

  @override
  String get favoritesHideConfirmTitle => 'Skjul favoritter';

  @override
  String get favoritesHideConfirmDescription =>
      'Dette vil skjule alle favoritrelaterede UI-elementer, inklusive knapper og menupunkter. Dine eksisterende favoritter vil blive bevaret og kan genaktiveres når som helst fra Indstillinger > Avanceret > Udseende.';

  @override
  String get favoritesDirectMessageSubtitle => 'Direkte besked';

  @override
  String get messagesMediaDisplayGroupTitle => 'Visning';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Styr, hvordan beskeder, medier og andet indhold vises.';

  @override
  String get messagesMediaMediaGroupTitle => 'Medier';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Tilpas præferencer for mediestørrelse og knapper.';

  @override
  String get messagesMediaInputGroupTitle => 'Input';

  @override
  String get messagesMediaInputGroupDescription =>
      'Tilpas indstillinger for beskedinput.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Sidebjælke';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigurer, hvordan community-sidebjælken vises.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Skjul dæmpede kanaler som standard';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Skjul automatisk dæmpede kanaler i sidebjælken, når du tilslutter dig nye communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Skjul dæmpede kanaler som standard?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Nye communities, du tilslutter dig, vil automatisk have dæmpede kanaler skjult. Vil du også anvende denne indstilling på alle dine eksisterende communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Stop med at skjule dæmpede kanaler som standard?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Nye communities, du tilslutter dig, vil ikke længere automatisk have dæmpede kanaler skjult. Vil du også vise dæmpede kanaler i alle dine eksisterende communities?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Anvend på alle communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Vis i alle communities';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Kun nye communities';

  @override
  String get messagesMediaDisplaySectionTitle => 'Medievisning';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Styr, hvordan billeder, videoer og andre medier vises. Alle medier ændres størrelse og konverteres. Ekstremt store filer, der ikke kan komprimeres til en forhåndsvisning, vil ikke blive indlejret uanset disse indstillinger.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Når de postes som links til chat';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Når de uploades direkte til Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Link-forhåndsvisninger';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Styr, hvordan weblink forhåndsvises i chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Vis embeds og forhåndsvis weblink';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaktioner';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Konfigurer emoji-reaktioner på beskeder';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Vis emoji-reaktioner på beskeder';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoiler-indhold';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Styr, hvordan spoiler-indhold vises';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Vis spoiler-indhold';

  @override
  String get messagesMediaSpoilersOnClickName => 'Ved klik';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Vis spoiler-indhold, når der klikkes';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'I kanaler, jeg modererer';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Vis altid spoiler-indhold i kanaler, hvor du har tilladelsen \"Administrer beskeder\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Altid';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Vis altid spoiler-indhold';

  @override
  String get messagesMediaSizeSectionTitle =>
      'Indstillinger for mediestørrelse';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Tilpas den maksimale visningsstørrelse for indlejret og vedhæftet medie. Mindre størrelser bruger mindre skærmplads, mens større størrelser viser flere detaljer.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Medie fra links (indlejringer)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Uploadede vedhæftninger';

  @override
  String get messagesMediaSizeCompactName => 'Kompakt (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Mindre mediestørrelse';

  @override
  String get messagesMediaSizeComfortableName => 'Komfortabel (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Større mediestørrelse med flere detaljer';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF-adfærd';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Styr, hvordan GIF\'er indsættes i chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Send automatisk GIF\'er, når de er valgt';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Udtryksautocompletion (kolon-autocompletion)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Styr, hvad der vises i udtryksautocompletion, når du skriver kolon. Tilpas, hvilke forslag der vises, så de passer til dine præferencer.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Vis standard-emojis i udtryksautocompletion';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Vis brugerdefinerede emojis i udtryksautocompletion';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Vis klistermærker i udtryksautocompletion';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Vis gemte medier i udtryksautocompletion';

  @override
  String get messagesMediaEditingSectionTitle => 'Redigering af beskeder';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Styr, hvad der sker med dit redigeringsudkast, når du annullerer.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Behold redigeringsudkast ved annullering';

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
      'DM-beskedforhåndsvisninger';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Styr, hvornår beskedforhåndsvisninger vises i DM-listen.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM-beskedforhåndsvisningstilstand';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Alle beskeder';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Vis beskedforhåndsvisninger for alle DM-samtaler';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Kun ubeskrevne DM\'er';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Vis kun beskedforhåndsvisninger for DM\'er med ubeskrevne beskeder';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ingen';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Vis ingen beskedforhåndsvisninger i DM-listen';

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
  String get dmListSentAnAttachment => 'Sendte en vedhæftning';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username fastgjorde en besked til denne kanal.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username tilføjede $userName til gruppen.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username tilføjede nogen til gruppen.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username har forladt gruppen.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username fjernede $userName fra gruppen.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username fjernede nogen fra gruppen.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username ændrede kanalnavnet til $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username ændrede kanalnavnet.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username ændrede kanalikonet.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username startede et opkald.';
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
  String get voiceConnectionConfirmTitle => 'Bekræftelse af stemmeforbindelse';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Du er allerede forbundet til denne stemmekanal fra $count andre enheder. Hvad vil du gøre?',
      one:
          'Du er allerede forbundet til denne stemmekanal fra 1 anden enhed. Hvad vil du gøre?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Skift til denne enhed';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Deltag bare (behold andre forbindelser)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Gør ingenting, jeg vil ikke deltage';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Dette er en stemmekanal. Opret forbindelse for at begynde at tale!';

  @override
  String get voiceChannelJoin => 'Deltag i stemmekanal';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Opret forbindelse til stemme';

  @override
  String get voiceChannelNoConnectPermission =>
      'Du har ikke tilladelse til at deltage i denne stemmekanal';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon, kamera og skærmdelingsindhold er end-to-end-krypteret.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon, kamera og skærmdelingsindhold er end-to-end-krypteret.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end-kryptering er utilgængelig, fordi en upassende deltager er i denne stemmekanal.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end-kryptering er utilgængelig, fordi en upassende deltager er i dette opkald.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Denne klient skal opdateres, før du kan deltage i dette krypterede opkald.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Kunne ikke starte din mikrofon. Du er stadig i opkaldet.';

  @override
  String get voiceChannelStatusConnecting => 'Forbinder...';

  @override
  String get voiceChannelStatusConnected => 'Forbundet';

  @override
  String get voiceChannelStatusError => 'Fejl';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobil enhed';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Desktop-enhed';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Fællesskabets mute';

  @override
  String get voiceParticipantTooltipMuted => 'Muted';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Fællesskabets døvhed';

  @override
  String get voiceParticipantTooltipDeafened => 'Døv';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Forbindelse: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deltagere',
      one: '1 deltager',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Forlad';

  @override
  String get voiceControlMute => 'Slå mikrofon fra';

  @override
  String get voiceControlUnmute => 'Slå mikrofon til';

  @override
  String get voiceControlDeafen => 'Slå lyd fra';

  @override
  String get voiceControlUndeafen => 'Slå lyd til';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Skærmdeling';

  @override
  String get voiceScreenShareNotificationText => 'Deler din skærm.';

  @override
  String get voiceControlMore => 'Mere';

  @override
  String get voiceControlDisconnect => 'Afbryd';

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
      other: '# ulæste beskeder',
      one: '# ulæst besked',
    );
    return 'Vis chat med $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Kameratilladelse er påkrævet for video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Kunne ikke starte skærmdeling. Prøv igen.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Tilladelse til skærmdeling blev nægtet.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Skærmdeling er ikke tilgængelig på denne enhed.';

  @override
  String get voiceWatchStream => 'Se stream';

  @override
  String get voiceStopWatching => 'Stop med at se med';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Stop med at se det aktuelle stream';

  @override
  String get voiceOwnScreenShareTitle => 'Du sender';

  @override
  String get voiceOwnScreenShareSubtitle => 'Dit stream er live for deltagere.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Se opkald';

  @override
  String get dmVoiceCallFullScreen => 'Fuld skærm';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Åbn opkald i fuld skærm';

  @override
  String get dmVoiceStripStatusConnecting => 'Forbinder…';

  @override
  String get dmVoiceStripStatusInCall => 'I opkald';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Stemmeopkald';

  @override
  String get dmVoiceCallBarConnecting => 'Forbinder…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direkte opkald';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Gruppekald';

  @override
  String get dmVoiceCallBarIssueFallback => 'Stemmeproblem';

  @override
  String get dmVoiceFullscreenTitle => 'Stemme';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Stemme forbundet';

  @override
  String get notificationsPageTitle => 'Notifikationer';

  @override
  String get notificationsFilterUnreads => 'Ulæste';

  @override
  String get notificationsFilterMentions => 'Nævnelser';

  @override
  String get notificationsBookmarksTooltip => 'Bogkærmærker';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrer nævnelser';

  @override
  String get notificationsMentionFiltersTitle => 'Nævnelsesfiltre';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Inkluder @alle og @her-nævnelser';

  @override
  String get notificationsMentionIncludeRoles => 'Inkluder rollenævnelser';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Inkluder alle fællesskabsnævnelser';

  @override
  String get notificationsNoUnreadTitle => 'Ingen ulæste beskeder';

  @override
  String get notificationsNoUnreadBody => 'Du er helt opdateret.';

  @override
  String get notificationsNoMentionsTitle => 'Ingen nylige nævnelser';

  @override
  String get notificationsNoMentionsBody =>
      'Alle @nævnelser af dig vil blive vist her i 7 dage.';

  @override
  String get notificationsMentionsEndTitle => 'Du er nået til slutningen';

  @override
  String get notificationsMentionsEndBody =>
      'Du har set alle dine seneste nævnelser. Bare rolig, der dukker flere op snart.';

  @override
  String get notificationsJump => 'Spring til';

  @override
  String get notificationsRemoveMentionTooltip => 'Fjern nævnelse';

  @override
  String get notificationsViewAllUnread => 'Se alle ulæste';

  @override
  String get notificationsMarkAsRead => 'Marker som læst';

  @override
  String get notificationsExpand => 'Udvid';

  @override
  String get notificationsCollapse => 'Fold sammen';

  @override
  String get notificationsMessageUnavailable =>
      'Denne besked kunne ikke indlæses.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining tegn tilbage';
  }

  @override
  String get characterCounterTooLong => 'Beskeden er for lang';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining tegn tilbage. Få $productName til at skrive op til $premiumMaxLength tegn.';
  }

  @override
  String get chatMessageFailedToSend => 'Besked kunne ikke sendes';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Din besked kunne ikke leveres. Dette skyldes normalt, at du ikke deler et fællesskab med modtageren, eller at modtageren kun accepterer direkte beskeder fra venner. Du skal muligvis også justere dine egne indstillinger for direkte beskeders privatliv i $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Din besked kunne ikke leveres. Du skal gøre krav på din konto for at sende direkte beskeder.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Din besked kunne ikke leveres. Du skal gøre krav på din konto for at sende beskeder.';

  @override
  String get chatSendFailureContentBlocked =>
      'Din besked kunne ikke leveres, fordi den blev flagget af vores sikkerhedssystemer. Hvis du mener, at dette er en fejl, bedes du kontakte support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Din besked kunne ikke leveres, fordi den indeholder modne emoji eller klistermærker, der ikke er tilladt i denne kontekst.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Kun du kan se denne besked.';

  @override
  String get chatClientSystemDismiss => 'Luk';

  @override
  String get privacyDashboardCommunicationSection => 'Kommunikation';

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
  String get chatMessageDeleteFailed => 'Sletning mislykkedes';

  @override
  String get chatMessageAddReaction => 'Tilføj reaktion';

  @override
  String get chatMessageEdit => 'Rediger besked';

  @override
  String get chatMessageReply => 'Svar';

  @override
  String get chatMessageForward => 'Videresend';

  @override
  String get forwardMessageTitle => 'Videresend besked';

  @override
  String get forwardSearchHint => 'Søg i kanaler eller DM\'er';

  @override
  String get forwardDirectMessagesSection => 'Direkte beskeder';

  @override
  String get forwardCommentHint => 'Tilføj en kommentar (valgfrit)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Send ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Ingen kanaler fundet';

  @override
  String get forwardSuccessToast => 'Besked videresendt';

  @override
  String get forwardFailed => 'Kunne ikke videresende besked';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Kommentarer er utilgængelige, fordi en valgt kanal har slowmode aktiveret.';

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
      'Du kan ikke sende beskeder her';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Du kan ikke indlejre links her';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Du kan ikke vedhæfte filer her';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Afsendelse af beskeder er deaktiveret i dette fællesskab';

  @override
  String get forwardDestinationTimedOut =>
      'Du er på timeout i dette fællesskab';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Slowmode - vent $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopiér besked';

  @override
  String get chatMessageTranslate => 'Translate';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Translated from $language';
  }

  @override
  String get chatMessageSeeOriginal => 'See original';

  @override
  String get chatMessageSeeTranslation => 'See translation';

  @override
  String get chatMessageTranslating => 'Translating…';

  @override
  String get chatMessageTranslateFailed => 'Couldn\'t translate this message.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Translation isn\'t available on this device.';

  @override
  String get chatMessageSpeak => 'Speak message';

  @override
  String get chatMessageStopSpeaking => 'Stop speaking';

  @override
  String get chatMessagePin => 'Fastgør besked';

  @override
  String get chatMessageUnpin => 'Fjern fastgørelse af besked';

  @override
  String get chatMessageUnpinIt => 'Fjern fastgørelse';

  @override
  String get chatMessageBookmark => 'Bogmærk besked';

  @override
  String get chatMessageRemoveBookmark => 'Fjern bogmærke';

  @override
  String get chatMessageMarkAsUnread => 'Marker som ulæst';

  @override
  String get chatMessageCopyMessageLink => 'Kopiér beskedlink';

  @override
  String get chatMessageCopyMessageId => 'Kopiér besked-ID';

  @override
  String get chatMessageViewReactions => 'Vis reaktioner';

  @override
  String get chatMessageRemoveAllReactions => 'Fjern alle reaktioner';

  @override
  String get chatMessageDebug => 'Fejlfindingsbesked';

  @override
  String get chatMessageDebugSheetTitle => 'Fejlfindingsbesked';

  @override
  String get chatMessageDebugCopyJson => 'Kopiér JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Besked-JSON kopieret til udklipsholder';

  @override
  String get chatReactionsSheetTitle => 'Reaktioner';

  @override
  String get chatReactionsSheetEmpty => 'Ingen har reageret på denne endnu.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Anmeld besked';

  @override
  String get iarReportMessageTitle => 'Anmeld besked';

  @override
  String get iarThisUserFallback => 'denne bruger';

  @override
  String get iarModalDescription =>
      'Anmeld en regelovertrædelse, eller find værktøjer til at administrere kontakt og præferencer.';

  @override
  String get iarPathStepAriaLabel => 'Hvad har du brug for?';

  @override
  String get iarCategoryStepTitle => 'Hvilken slags regel blev brudt?';

  @override
  String get iarReasonStepTitle => 'Hvilken regel blev brudt?';

  @override
  String get iarReasonSelectHint => 'Vælg en årsag';

  @override
  String get iarPickAnOptionToast => 'Vælg en mulighed for at fortsætte.';

  @override
  String get iarPickARuleToast => 'Vælg den regel, der blev brudt.';

  @override
  String get iarPathPlatform => 'Anmeld en platformregelovertrædelse';

  @override
  String get iarPathCommunity =>
      'Anmeld til administratorerne af dette fællesskab';

  @override
  String get iarPathPreferenceMessage => 'Jeg kan ikke lide dette indhold';

  @override
  String get iarCategoryTargetedHarmLabel => 'Trusler, chikane eller skade';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Mobning, trusler, had, vold, raids eller indhold, der fremmer selvskade.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Børnesikkerhed eller voksent indhold';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Mindreårige i fare, voksent indhold på et forkert sted eller uønsket adfærd.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privatliv eller udgivelse af sig som en anden';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, stalking, udgive sig for at være en anden eller en upassende profil.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Svindel, malware eller misinformation';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, bedrageri, ondsindede links eller falske påstande, der sandsynligvis vil forårsage skade i den virkelige verden.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Ulovlig aktivitet eller noget andet';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Ulovligt salg, kriminel facilitering eller en klar regelovertrædelse, der ikke passer ovenfor.';

  @override
  String get iarReasonHarassmentLabel => 'Chikane eller trusler';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Mobning, gentagen uønsket kontakt, stalking eller målrettet misbrug.';

  @override
  String get iarReasonHateLabel => 'Hadytringer';

  @override
  String get iarReasonHateMessageDescription =>
      'Slagsmål, dehumaniserende sprog eller angreb på beskyttede grupper.';

  @override
  String get iarReasonViolenceLabel => 'Vold eller voldelige trusler';

  @override
  String get iarReasonViolenceDescription =>
      'Troværdige trusler, grafisk vold eller glorificering af vold.';

  @override
  String get iarReasonMatureContentLabel => 'Voksent indhold eller chikane';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Uønsket adfærd eller voksent indhold på et forkert sted.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Børnesikkerhed eller udnyttelse af mindreårige';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming eller indhold, der udnytter børn.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Skadelig misinformation';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Falske påstande, der sandsynligvis vil forårsage skade i den virkelige verden.';

  @override
  String get iarReasonSpamLabel => 'Spam, svindel eller phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Masse-spam, bedrageri, falske giveaways eller misbrug af konto.';

  @override
  String get iarReasonMalwareLabel => 'Malware eller farlige links';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, tyveri af legitimationsoplysninger eller skadelige filer.';

  @override
  String get iarReasonPrivacyLabel => 'Privatlivskrænkelse';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, afslørede private oplysninger eller stalking.';

  @override
  String get iarReasonImpersonationLabel =>
      'Udgivelse af sig som en anden eller vildledende medier';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Udgive sig for at være en anden, herunder vildledende AI-genereret indhold.';

  @override
  String get iarReasonIllegalLabel => 'Ulovlig aktivitet';

  @override
  String get iarReasonIllegalDescription =>
      'Ulovligt salg, kriminel facilitering eller ulovlig aktivitet.';

  @override
  String get iarReasonSelfHarmLabel => 'Selvskade eller selvmord';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Fremme eller instruktioner, der opfordrer til selvskade eller spiseforstyrrelser.';

  @override
  String get iarReasonOtherLabel => 'En anden klar regelovertrædelse';

  @override
  String get iarReasonOtherDescription =>
      'Brug kun, hvis det tydeligt bryder Fluxers regler og ikke passer ovenfor.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Hvis en mindreårig er involveret, skal du bruge \"$childSafetyReason\" i stedet.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Hvis dette involverer CSAM eller udnyttelse af en mindreårig, skal du sende det nu og ikke dele materialet igen.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Hvis nogen kan være i umiddelbar fare, skal du kontakte de lokale nødtjenester, hvis du kan gøre det sikkert.';

  @override
  String get iarSafetyNoteViolence =>
      'Hvis dette er en troværdig umiddelbar trussel, skal du også kontakte de lokale nødtjenester.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Hvis dette er en umiddelbar terrorhandling, skal du også kontakte de lokale nødtjenester.';

  @override
  String get iarActionBlockUserTitle => 'Bloker denne bruger';

  @override
  String get iarActionBlockUserDescription =>
      'Stop beskeder og venneanmodninger.';

  @override
  String get iarActionBlockUserButton => 'Bloker';

  @override
  String get iarActionCopyMessageLinkTitle => 'Kopiér beskedlink';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Del med community-moderatorer.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopiér';

  @override
  String get iarActionCloseDmTitle => 'Luk denne DM';

  @override
  String get iarActionCloseDmDescription =>
      'Blokerer ikke. Du kan genåbne senere.';

  @override
  String get iarActionCloseDmButton => 'Luk DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Forlad fællesskabet';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Stop med at se dets indhold og medlemmer.';

  @override
  String get iarActionLeaveCommunityButton => 'Forlad';

  @override
  String get iarActionDmSettingsTitle => 'DM & venneanmodningsindstillinger';

  @override
  String get iarActionDmSettingsDescription =>
      'Skift hvem der kan kontakte dig.';

  @override
  String get iarActionCallSettingsTitle => 'Opkald & gruppechatindstillinger';

  @override
  String get iarActionCallSettingsDescription =>
      'Skift hvem der kan ringe til eller tilføje dig.';

  @override
  String get iarActionOpenButton => 'Åbn';

  @override
  String get iarActionDeleteMessageTitle => 'Slet denne besked';

  @override
  String get iarActionDeleteMessageDescription =>
      'Fjern den fra kanalen for alle.';

  @override
  String get iarActionDeleteMessageButton => 'Slet';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Slettet';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Denne besked er allerede blevet slettet.';

  @override
  String get iarActionBanUserTitle => 'Ban denne bruger';

  @override
  String get iarActionBanUserDescription =>
      'Åbn ban-dialogen for dette fællesskab.';

  @override
  String get iarActionBanUserButton => 'Ban';

  @override
  String get iarActionBanUserBannedButton => 'Bannet';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Denne bruger er allerede bannet fra fællesskabet.';

  @override
  String get iarCloseDmConfirmTitle => 'Luk DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Luk din nuværende DM med $name. Dette blokerer dem ikke; du kan genåbne senere.';
  }

  @override
  String get iarSuccessTitle => 'Rapport sendt';

  @override
  String get iarSuccessBody =>
      'Vores sikkerhedsteam gennemgår den. Vi sender dig en DM og en e-mail, når vi har truffet en afgørelse.';

  @override
  String get iarAlreadyReportedTitle => 'Allerede rapporteret';

  @override
  String get iarAlreadyReportedBody =>
      'Du har allerede rapporteret denne besked. Vores sikkerhedsteam gennemgår den.';

  @override
  String get iarBackButton => 'Tilbage';

  @override
  String get iarContinueButton => 'Fortsæt';

  @override
  String get iarSendReportButton => 'Send rapport';

  @override
  String get iarDoneButton => 'Færdig';

  @override
  String get iarCouldntSendToast => 'Kunne ikke sende rapporten. Prøv igen.';

  @override
  String get iarRateLimitedToast =>
      'Du rapporterer for hurtigt. Vent et øjeblik og prøv igen.';

  @override
  String get iarReportSentToast =>
      'Rapport sendt. Vores sikkerhedsteam vil gennemgå den.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Bloker $name? De vil ikke kunne sende dig beskeder eller venneanmodninger. Du kan fjerne blokeringen senere.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Kunne ikke blokere denne bruger. Prøv igen.';

  @override
  String get iarCloseDmSuccessToast => 'DM lukket.';

  @override
  String get iarCloseDmFailedToast => 'Kunne ikke lukke denne DM. Prøv igen.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Kunne ikke forlade dette fællesskab. Prøv igen.';

  @override
  String get chatMessageSuppressEmbeds => 'Undertryk embeds';

  @override
  String get chatMessageUnsuppressEmbeds => 'Genoptag embeds';

  @override
  String get chatMessageDelete => 'Slet besked';

  @override
  String get chatMessageDeleteConfirmTitle => 'Slet besked';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Er du sikker på, at du vil slette denne besked?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Mere';

  @override
  String get chatEditingMessage => 'Redigerer besked';

  @override
  String get chatReplyOriginalDeleted => 'Original besked blev slettet';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Original besked kunne ikke indlæses';

  @override
  String get chatReplyAttachedMedia => 'Besked indeholder vedhæftet medie';

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
  String get chatMessagesLoadError => 'Kunne ikke indlæse beskeder.';

  @override
  String get chatReplyMentionOverrideTitle => 'Overskriv omtale-præference?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname foretrækker at blive @nævnt i svar. Send alligevel uden omtale?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname foretrækker svar uden @mention. Send alligevel med mention?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorer præference';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klik for at deaktivere ping af brugeren, du svarer på.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klik for at aktivere ping af brugeren, du svarer på.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Mention svar-bruger';

  @override
  String get chatReplyMentionOn => 'Til';

  @override
  String get chatReplyMentionOff => 'Fra';

  @override
  String get chatReplyCancel => 'Annuller svar';

  @override
  String get chatEditMessageHint => 'Rediger besked';

  @override
  String get chatEditNoChanges => 'Ingen ændringer at gemme';

  @override
  String get chatChannelNotReady =>
      'Denne kanal er ikke klar endnu. Prøv igen om et øjeblik.';

  @override
  String get chatMessageEdited => '(redigeret)';

  @override
  String get chatMessageSilent => 'Dette var en @silent besked.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'I dag kl. $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'I går kl. $time';
  }

  @override
  String get mediaViewerImagePreview => 'Billedfremvisning';

  @override
  String get mediaViewerClose => 'Luk medievisning';

  @override
  String get mediaViewerOpenInBrowser => 'Åbn i browser';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Videresend';

  @override
  String get mediaViewerZoomIn => 'Zoom ind';

  @override
  String get mediaViewerZoomOut => 'Zoom ud';

  @override
  String get mediaViewerPreviousAttachment => 'Forrige vedhæftning';

  @override
  String get mediaViewerNextAttachment => 'Næste vedhæftning';

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
  String get chatAttachmentVideoToggleControls => 'Skift video-kontroller';

  @override
  String get chatAttachmentVideoMute => 'Slå video fra';

  @override
  String get chatAttachmentVideoUnmute => 'Slå video til';

  @override
  String get chatAttachmentVideoPlay => 'Afspil video';

  @override
  String get chatAttachmentVideoPause => 'Sæt video på pause';

  @override
  String get chatAttachmentVideoProgress => 'Video-fremskridt';

  @override
  String get chatVideoPlaybackFailed => 'Kunne ikke afspille denne video.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Giv besked til brugere med denne rolle, som har tilladelse til at se denne kanal.';

  @override
  String get addGuildModalTitle => 'Tilføj et fællesskab';

  @override
  String get addGuildModalLandingDescription =>
      'Opret et nyt fællesskab eller tilmeld dig et eksisterende.';

  @override
  String get addGuildCreateCommunity => 'Opret fællesskab';

  @override
  String get addGuildJoinCommunity => 'Tilmeld dig fællesskab';

  @override
  String get addGuildImportDiscordTemplate => 'Importer Discord-skabelon';

  @override
  String get addGuildJoinTitle => 'Tilmeld dig et fællesskab';

  @override
  String get addGuildJoinDescription =>
      'Indtast invite-linket for at tilmelde dig et fællesskab.';

  @override
  String get addGuildInviteLinkLabel => 'Invite-link';

  @override
  String get addGuildJoinSubmit => 'Tilmeld dig fællesskab';

  @override
  String get addGuildInviteInvalid =>
      'Denne invite er ugyldig eller er udløbet.';

  @override
  String get addGuildJoinFailed =>
      'Kunne ikke tilmelde dig fællesskabet. Prøv igen.';

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
  String get addGuildPackInstalled => 'Pakke installeret succesfuldt.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Fjern alle reaktioner';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Er du sikker på, at du vil fjerne alle reaktioner fra denne besked?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Fjern pin fra besked';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Send denne pin tilbage i tiden?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username pinnede $messageLink til denne kanal. Se $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'en besked';

  @override
  String get systemPinMessageAllPinsLink => 'alle pinned-beskeder';

  @override
  String get channelPinsEmptyTitle => 'Ingen fastgjorte beskeder';

  @override
  String get channelPinsEmptyDescription => 'Fastgjorte beskeder vises her.';

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
  String get personalNotesTitle => 'Personlige noter';

  @override
  String get personalNotesSubtitle =>
      'Dit private rum til tanker og påmindelser';

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
    return 'I begyndelsen var der intet. Så kom $channelName. Og det var godt.';
  }

  @override
  String get personalNotesComposerHint => 'Send en besked til dig selv';

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
  String get personalNotesPrivateSpace => 'Dit private rum';

  @override
  String get purgePersonalNotes => 'Ryd personlige noter';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Dette vil permanent slette alle beskeder og vedhæftede filer i dine personlige noter. Dette kan ikke fortrydes.';

  @override
  String get purgePersonalNotesConfirmButton => 'Ryd';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Rydde $count beskeder fra personlige noter';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Personlige noter var allerede tomme';

  @override
  String get purgePersonalNotesFailed => 'Kunne ikke rydde personlige noter';

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
  String get userSettingsSearchPlaceholder => 'Search settings...';

  @override
  String get userSettingsSearchFieldLabel => 'Search settings';

  @override
  String get userSettingsSearchClear => 'Clear search';

  @override
  String get userSettingsSearchNoResults => 'No settings found';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sikkerhed og login';

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
  String get userSettingsNavPrivacyDashboard => 'Privatlivsoverblik';

  @override
  String get userSettingsNavAuthorizedApps => 'Godkendte apps';

  @override
  String get userSettingsNavBlockedUsers => 'Blokerede brugere';

  @override
  String get userSettingsNavLinkedDevices => 'Tilsluttede enheder';

  @override
  String get userSettingsNavConnections => 'Forbindelser';

  @override
  String get userSettingsNavLookAndFeel => 'Udseende';

  @override
  String get userSettingsNavAccessibility => 'Tilgængelighed';

  @override
  String get userSettingsNavChat => 'Beskeder og medier';

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
  String get userSettingsNavLanguageAndTime => 'Sprog og tid';

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
  String get userSettingsNavAdvanced => 'Avanceret';

  @override
  String get advancedPerformanceReportingTitle => 'Ydelsesrapportering';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Hjælp med at forbedre Fluxer ved at dele anonyme data om nedbrud og ydeevne.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Send rapporter om nedbrud og ydeevne';

  @override
  String get advancedPerformanceReportingDescription =>
      'Alle rapporterede data er anonyme og sendes kun til Fluxers egen overvågningstjeneste — der bruges ingen tredjepartsudbydere.';

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
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Splash zoom animation';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Zoom the logo out when leaving the splash screen';

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
  String get userSettingsNavApplications => 'Applikationer';

  @override
  String get userSettingsNavAppLogs => 'App-logfiler';

  @override
  String get userSettingsNavDeveloperTools => 'Udviklerværktøjer';

  @override
  String get userSettingsNavLimitsConfig => 'Grænsekonfiguration';

  @override
  String get userSettingsNavFeatureFlags => 'Funktionsflag';

  @override
  String get userSettingsNavWhatsNew => 'Hvad er nyt';

  @override
  String get userSettingsNavLogOut => 'Log ud';

  @override
  String get quickSwitcherTabSearch => 'Søg';

  @override
  String get quickSwitcherTabFriends => 'Venner';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Søg efter kanaler, personer eller fællesskaber';

  @override
  String get quickSwitcherSearchFriends => 'Søg efter venner';

  @override
  String get quickSwitcherNoMatchesFound => 'Ingen resultater fundet';

  @override
  String get quickSwitcherEmptyHint =>
      'Prøv et andet navn, eller brug @ / # / ! / * præfikser til at filtrere resultater.';

  @override
  String get quickSwitcherSectionPeople => 'Personer';

  @override
  String get quickSwitcherSectionGroupMessages => 'Gruppebeskeder';

  @override
  String get quickSwitcherSectionTextChannels => 'Tekstkanaler';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Talekanaler';

  @override
  String get quickSwitcherSectionCommunities => 'Fællesskaber';

  @override
  String get quickSwitcherSectionSettings => 'Indstillinger';

  @override
  String get quickSwitcherHomeLabel => 'Hjem';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Direkte beskeder';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoritter';

  @override
  String get quickSwitcherUserSettingsLabel => 'Brugerindstillinger';

  @override
  String get quickSwitcherNotificationsLabel => 'Notifikationer';

  @override
  String get quickSwitcherBookmarksLabel => 'Bogærker';

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
  String get quickSwitcherMentionsLabel => 'Nævnelser';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Ingen venner endnu';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Tilføj en ven for at komme i gang.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Ingen venner matcher denne søgning';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Prøv et andet navn.';

  @override
  String get quickSwitcherSearchAliasUser => 'Bruger';

  @override
  String get quickSwitcherSearchAliasYou => 'Dig';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM\'er';

  @override
  String get quickSwitcherSearchAliasMessages => 'Beskeder';

  @override
  String get quickSwitcherSearchAliasFav => 'Fav';

  @override
  String get quickSwitcherSearchAliasStarred => 'Stjernemærkede';

  @override
  String get quickSwitcherSearchAliasInbox => 'Indbakke';

  @override
  String get quickSwitcherSearchAliasSaved => 'Gemte';

  @override
  String get uiClose => 'Luk';

  @override
  String get chatJumpToBottom => 'Spring til bunden';

  @override
  String get uiConfirm => 'Bekræft';

  @override
  String get uiLoading => 'Indlæser';

  @override
  String get uiUnsavedChanges => 'Ugemte ændringer';

  @override
  String get uiReset => 'Nulstil';

  @override
  String get uiOpenColorPicker => 'Åbn farvevælger';

  @override
  String get uiSelectPlaceholder => 'Vælg';

  @override
  String get uiSearchPlaceholder => 'Søg';

  @override
  String get uiNoOptionsFound => 'Ingen valgmuligheder fundet';

  @override
  String get uiDismissNotification => 'Luk notifikation';

  @override
  String get uiColorPickerTitle => 'Farvevælger';

  @override
  String get mentionConfirmTitle => 'Nævn alle?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Dette vil underrette $count medlemmer. Fortsæt?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Dette vil underrette $count online medlemmer. Fortsæt?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Nævn';

  @override
  String get composerEmojiUnavailable => 'Du kan ikke bruge denne emoji her.';

  @override
  String get instanceUrlLabel => 'Instans-URL';

  @override
  String get instanceUrlPlaceholder =>
      'Indtast instans-URL (f.eks. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Nulstil til Fluxer';

  @override
  String get instanceConnect => 'Forbind';

  @override
  String get instanceConnecting => 'Forbinder…';

  @override
  String get instanceConnectFailed =>
      'Kunne ikke oprette forbindelse til instans';

  @override
  String get recentInstances => 'Seneste instanser';

  @override
  String removeRecentInstance(String domain) {
    return 'Fjern $domain fra seneste instanser';
  }

  @override
  String get instanceSheetTitle => 'Opret forbindelse til instans';

  @override
  String get connectToDifferentInstance =>
      'Opret forbindelse til en anden instans';

  @override
  String get changeInstance => 'Skift';

  @override
  String get instanceConnectionRequired =>
      'Opret forbindelse til instansen for at logge ind';

  @override
  String get comingSoon => 'Kommer snart';

  @override
  String get guildNavbarDirectMessages => 'Direkte beskeder';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Udforsk communities, der kan opdages';

  @override
  String get discoveryExplore => 'Udforsk';

  @override
  String get discoveryExplorePublicCommunities =>
      'Udforsk offentlige communities';

  @override
  String get discoveryListingSubheading =>
      'Vil du have dit community listet her? Ansøg, hvis du opfylder kravene i dit communitys indstillinger > Udforskning.';

  @override
  String get discoverySearchCommunities => 'Søg i communities';

  @override
  String get discoveryFilterByLanguage => 'Filtrer efter sprog';

  @override
  String get discoveryAllLanguages => 'Alle sprog';

  @override
  String get discoveryAllCategories => 'Alle';

  @override
  String get discoveryCategoryGaming => 'Gaming';

  @override
  String get discoveryCategoryMusic => 'Musik';

  @override
  String get discoveryCategoryEntertainment => 'Underholdning';

  @override
  String get discoveryCategoryEducation => 'Uddannelse';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Videnskab og teknologi';

  @override
  String get discoveryCategoryContentCreator => 'Indholdsskaber';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime og manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Film og tv';

  @override
  String get discoveryCategoryOther => 'Andet';

  @override
  String get discoveryNoCommunitiesMatch => 'Ingen communities matcher.';

  @override
  String get discoveryJoinCommunity => 'Deltag i community';

  @override
  String get discoveryJoined => 'Deltog';

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
      other: '$countString medlemmer',
      one: '1 medlem',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Ingen beskrivelse.';

  @override
  String get discoveryCommunities => 'Communities';

  @override
  String get discoveryApps => 'Apps';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Kunne ikke deltage i dette community';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Noget gik galt. Prøv igen om et øjeblik.';

  @override
  String get discoveryJoinErrorFullTitle => 'Dette community er fuldt';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Dette community har nået sin medlemsgrænse, så du kan ikke deltage lige nu.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Du har nået community-grænsen';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Du er i det maksimale antal communities. Forlad et, og prøv igen.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Du kan ikke deltage i dette community';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Du er blevet udelukket fra dette community.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Dette community er ikke længere tilgængeligt';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Det kan have forladt udforskning eller deaktiveret nye tilmeldinger. Opdater siden, og du vil ikke se det igen.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Du går for hurtigt frem';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Vent et øjeblik, og prøv igen.';

  @override
  String get guildNavbarAddCommunity => 'Tilføj et community';

  @override
  String get guildNavbarHelp => 'Hjælp';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NY BESKED';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Skjul $folderName';
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
  String get guildNavbarGroupDm => 'Gruppens DM';

  @override
  String get guildNavbarCreateChannel => 'Opret kanal';

  @override
  String get guildNavbarChannelType => 'Kanaltype';

  @override
  String get guildNavbarTextChannel => 'Tekstkanal';

  @override
  String get guildNavbarTextChannelDescription =>
      'Send beskeder, billeder, GIF\'er og emoji';

  @override
  String get guildNavbarVoiceChannel => 'Talekanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Vær sammen med stemme, video og skærmdeling';

  @override
  String get guildNavbarLinkChannel => 'Link-kanal';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Hurtig adgang til et eksternt websted eller en ressource';

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
  String get guildNavbarCreateCategory => 'Opret kategori';

  @override
  String get guildNavbarNewCategoryHint => 'Ny kategori';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Inviter venner til $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Modtagere vil blive sendt til #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Søg efter venner';

  @override
  String get guildNavbarNoFriendsYet => 'Ingen venner endnu';

  @override
  String get guildNavbarNoResults => 'Ingen resultater';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Eller send et invitationslink til en ven:';

  @override
  String get guildNavbarInviteLink => 'Invitationslink';

  @override
  String get guildNavbarCopy => 'Kopiér';

  @override
  String get guildNavbarCopied => 'Kopieret!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Dit invitationslink udløber om 7 dage.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Dette invitationslink udløber aldrig.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Dit invitationslink udløber om $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Rediger invitationslink';

  @override
  String get guildNavbarInviteLinkSettings =>
      'Indstillinger for invitationslink';

  @override
  String get guildNavbarExpireAfter => 'Udløb efter';

  @override
  String get guildNavbarMaxUses => 'Maks. antal anvendelser';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Giv midlertidigt medlemskab';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Medlemmer fjernes, når de går offline, medmindre en rolle er tildelt';

  @override
  String get guildNavbarCreateNewLink => 'Opret nyt link';

  @override
  String get guildNavbarSent => 'Sendt';

  @override
  String get guildNavbarInvite => 'Inviter';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Forlad fællesskab';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Er du sikker på, at du vil forlade dette fællesskab? Du vil ikke længere kunne se nogen beskeder.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Forlad fællesskab';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Slet dine beskeder i dette fællesskab?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Slet permanent alle beskeder, du har sendt her, i alle kanaler. Kan ikke fortrydes.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Slet mine beskeder';

  @override
  String get guildNavbarDeletedYourMessages => 'Dine beskeder blev slettet';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Kunne ikke slette dine beskeder';

  @override
  String get guildNavbarRemoveOverride => 'Fjern tilsidesættelse';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Muted indtil $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Kun tilgængelig for Fluxer-personale';

  @override
  String get guildNavbarInvitesPaused =>
      'Invitationer er i øjeblikket sat på pause i dette fællesskab';

  @override
  String get guildNavbarDurationNever => 'aldrig';

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
  String get guildNavbarDuration7Days => '7 dage';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekunder';
  }

  @override
  String get guildNavbarNever => 'Aldrig';

  @override
  String get guildNavbarNoLimit => 'Ubegrænset';

  @override
  String get guildNavbarOneUse => '1 brug';

  @override
  String guildNavbarUses(int count) {
    return '$count brug';
  }

  @override
  String get guildMenuMarkAsRead => 'Marker som læst';

  @override
  String get guildPeekMoreOptions => 'Flere indstillinger';

  @override
  String get guildMenuInviteMembers => 'Inviter medlemmer';

  @override
  String get guildMenuCommunitySettings => 'Fællesskabsindstillinger';

  @override
  String get guildMenuEditCommunityProfile => 'Rediger fællesskabsprofil';

  @override
  String get guildMenuUnmuteCommunity => 'Fjern mute fra fællesskab';

  @override
  String get guildMenuMuteCommunity => 'Mute fællesskab';

  @override
  String get guildMenuHideMutedChannels => 'Skjul muted kanaler';

  @override
  String get guildMenuReportCommunity => 'Anmeld fællesskab';

  @override
  String get guildMenuDebugCommunity => 'Fejlfinding af fællesskab';

  @override
  String get guildMenuCopyCommunityId => 'Kopiér fællesskabs-ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Indtil $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Generelt';

  @override
  String get guildMenuSettingsRoles => 'Roller & tilladelser';

  @override
  String get guildMenuSettingsEmoji => 'Brugerdefinerede emojis';

  @override
  String get guildMenuSettingsStickers => 'Brugerdefinerede klistermærker';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sikkerhed & moderation';

  @override
  String get guildMenuSettingsActivityLog => 'Aktivitetslog';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl =>
      'Brugerdefineret invitations-URL';

  @override
  String get guildMenuSettingsDiscovery => 'Opdagelse';

  @override
  String get guildMenuSettingsMembers => 'Medlemmer';

  @override
  String get guildMenuSettingsInviteLinks => 'Invitationslinks';

  @override
  String get guildMenuSettingsBans => 'Bans';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Du har ikke tilladelse til at se denne fane i indstillingerne.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikon';

  @override
  String get guildSettingsUploadImage => 'Upload billede';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Upload et banner til din server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Navn';

  @override
  String get guildSettingsOverviewNameHint => 'Mit fantastiske fællesskab';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistik';

  @override
  String get guildSettingsOverviewMembers => 'Medlemmer';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Brug roller til at gruppere medlemmer og tildele tilladelser.';

  @override
  String get guildSettingsCreateRole => 'Opret rolle';

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
    return '$staticCount statiske, $animatedCount animerede emoji-pladser brugt';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Ingen brugerdefinerede emojis endnu.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count klistermærker uploadet';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Ingen brugerdefinerede klistermærker endnu.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Medlemsverifikation';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Vælg, hvad medlemmer skal have, før de kan sende beskeder eller sende direkte beskeder til community-medlemmer.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Medlemmer med roller kan omgå disse tjek. For offentlige rum anbefaler vi at aktivere verifikation.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Communities, der er angivet i Discovery, kræver mindst en verificeret e-mail. Ingen kan ikke vælges, mens Discovery er aktiveret.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Modent indhold og indholdsadvarsler';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigurer mærkning af modent indhold og valgfrie indholdsadvarsler for medlemmer.';

  @override
  String get guildSettingsModerationMatureToggle => 'Modent indhold';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marker dette community som indeholdende modent indhold.';

  @override
  String get guildSettingsVerificationNone => 'Ingen';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Ingen verifikation er påkrævet.';

  @override
  String get guildSettingsVerificationLow => 'Lav';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Kræver en verificeret e-mailadresse.';

  @override
  String get guildSettingsVerificationMedium => 'Medium';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Kræver en verificeret e-mailadresse og en konto, der er mindst 5 minutter gammel.';

  @override
  String get guildSettingsVerificationHigh => 'Høj';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Kræver alt i medium, plus at være medlem af community\'et i mindst 10 minutter.';

  @override
  String get guildSettingsVerificationHighest => 'Meget høj';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Kræver et verificeret telefonnummer.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Spor moderatorhandlinger på tværs af community\'et.';

  @override
  String get guildSettingsAuditLogEmpty => 'Ingen logs endnu';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderationshandlinger og community-ændringer vil blive vist her.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Alle brugere';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Alle handlinger';

  @override
  String get guildSettingsAuditLogNoReason => 'Ingen grund blev angivet.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Ukendt bruger';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Noget gik galt under indlæsning af aktivitetsloggen.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Kunne ikke indlæse aktivitetslogs';

  @override
  String get guildSettingsAuditLogReason => 'Grund';

  @override
  String get guildSettingsAuditLogSomeone => 'nogen';

  @override
  String get guildSettingsAuditLogSomething => 'noget';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'ukendt enhed';

  @override
  String get guildSettingsAuditLogNothing => 'intet';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Ukendt mål';

  @override
  String get auditLogActionGuildUpdate => 'Community opdateret';

  @override
  String get auditLogActionChannelCreate => 'Kanal oprettet';

  @override
  String get auditLogActionChannelUpdate => 'Kanal opdateret';

  @override
  String get auditLogActionChannelDelete => 'Kanal slettet';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanal-overskrivning tilføjet';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanal-overskrivning opdateret';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanal-overskrivning fjernet';

  @override
  String get auditLogActionMemberKick => 'Medlem sparket ud';

  @override
  String get auditLogActionMemberPrune => 'Medlemmer beskåret';

  @override
  String get auditLogActionMemberBanAdd => 'Medlem bandlyst';

  @override
  String get auditLogActionMemberBanRemove => 'Medlem fjernet fra bandlysning';

  @override
  String get auditLogActionMemberUpdate => 'Medlem opdateret';

  @override
  String get auditLogActionMemberRoleUpdate => 'Medlemsroller opdateret';

  @override
  String get auditLogActionMemberMove => 'Medlem flyttet';

  @override
  String get auditLogActionMemberDisconnect => 'Medlem frakoblet';

  @override
  String get auditLogActionBotAdd => 'Bot tilføjet';

  @override
  String get auditLogActionRoleCreate => 'Rolle oprettet';

  @override
  String get auditLogActionRoleUpdate => 'Rolle opdateret';

  @override
  String get auditLogActionRoleDelete => 'Rolle slettet';

  @override
  String get auditLogActionInviteCreate => 'Invitation oprettet';

  @override
  String get auditLogActionInviteUpdate => 'Invitation opdateret';

  @override
  String get auditLogActionInviteDelete => 'Invitation slettet';

  @override
  String get auditLogActionWebhookCreate => 'Webhook oprettet';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook opdateret';

  @override
  String get auditLogActionWebhookDelete => 'Webhook slettet';

  @override
  String get auditLogActionEmojiCreate => 'Emoji oprettet';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji opdateret';

  @override
  String get auditLogActionEmojiDelete => 'Emoji slettet';

  @override
  String get auditLogActionStickerCreate => 'Mærkat oprettet';

  @override
  String get auditLogActionStickerUpdate => 'Mærkat opdateret';

  @override
  String get auditLogActionStickerDelete => 'Mærkat slettet';

  @override
  String get auditLogActionMessageDelete => 'Besked slettet';

  @override
  String get auditLogActionMessageBulkDelete => 'Beskeder slettet';

  @override
  String get auditLogActionMessagePin => 'Besked fastgjort';

  @override
  String get auditLogActionMessageUnpin => 'Besked frigjort';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor opdaterede community-indstillingerne.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor oprettede kanalen $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor opdaterede kanalen $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor slettede kanalen $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor tilføjede kanalrettigheder for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor tilføjede kanalrettigheder for $target i $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor opdaterede kanalrettigheder for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor opdaterede kanalrettigheder for $target i $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor fjernede kanalrettigheder for $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor fjernede kanalrettigheder for $target i $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor sparkede $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor bannede $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor unbannede $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor opdaterede $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor opdaterede roller for $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor rensede inaktive medlemmer.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor rensede medlemmer inaktive i $days dage.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor flyttede $target til en anden stemmekanal.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor flyttede $target til $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor afbrød $target fra stemme.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor tilføjede botten $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor oprettede rollen $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor opdaterede rollen $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor slettede rollen $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor oprettede invitationen $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor oprettede invitationen $target til $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor opdaterede invitationen $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor opdaterede invitationen $target til $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor slettede invitationen $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor slettede invitationen $target til $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor oprettede webhooken $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor opdaterede webhooken $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor slettede webhooken $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor tilføjede emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor opdaterede emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor slettede emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor tilføjede sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor opdaterede sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor slettede sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor slettede en besked.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor slettede en besked i $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor slettede flere beskeder.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor slettede $count beskeder.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor slettede flere beskeder i $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor slettede $count beskeder i $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor fastgjorde en besked.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor fastgjorde en besked i $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor fjernede fastgørelse af en besked.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor fjernede fastgørelse af en besked i $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor udførte en audit-handling på $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Opdaterede $field fra $oldValue til $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Indstillede $field til $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Rydde $field (var $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Opdaterede $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Omdøbte fællesskabet til $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Opdaterede fællesskabets ikon.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Omdøbte kanalen til $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Rydde emnet.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Opdaterede emnet til $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Aktiverede voksenindhold.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Deaktiverede voksenindhold.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Indstillede kaldenavn til $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Fjernede kaldenavn $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Dæmpede medlemmet.';

  @override
  String get auditLogChangeUnmutedMember => 'Fjernede dæmpning af medlemmet.';

  @override
  String get auditLogChangeDeafenedMember => 'Døvede medlemmet.';

  @override
  String get auditLogChangeUndeafenedMember => 'Fjernede døvning af medlemmet.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Tilføjede $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Fjernede $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Besked: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Inviteret af $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Slettet # beskeder.',
      one: 'Slettet # besked.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fjernede # medlemmer.',
      one: 'Fjernede # medlem.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Denne invitation udløber aldrig.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Giver midlertidigt medlemskab.';

  @override
  String get auditLogOptionPermanentMembership => 'Giver permanent medlemskab.';

  @override
  String get guildSettingsLoadMore => 'Indlæs mere';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Administrer webhooks, der sender beskeder til kanaler.';

  @override
  String get guildSettingsWebhooksEmpty => 'Ingen webhooks konfigureret.';

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
  String get guildSettingsCopyUrl => 'Kopiér URL';

  @override
  String get guildSettingsCopiedUrl => 'URL kopieret til udklipsholder';

  @override
  String get guildSettingsDeleteWebhook => 'Slet webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Indstil et brugerdefineret invitationslink til din server.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Gem';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Brug';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count anvendelser';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Ansøg om at blive vist i serveropdagelse.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Kræver mindst $count medlemmer for at ansøge.';
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
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'gaming, kunst, musik';

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
  String get guildSettingsDiscoveryApply => 'Send ansøgning';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Træk tilbage';

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
      'Søg og administrer servermedlemmer.';

  @override
  String get guildSettingsMembersSearchHint => 'Søg efter medlemmer';

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
      'Se og tilbagekald aktive invitationslinks.';

  @override
  String get guildSettingsInvitesEmpty => 'Ingen aktive invitationer.';

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
    return '$uses / $maxUses anvendelser';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Udløber $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Se og administrer udelukkede brugere.';

  @override
  String get guildSettingsBansSearchHint => 'Søg efter udelukkelser';

  @override
  String get guildSettingsBansEmpty => 'Ingen udelukkede brugere.';

  @override
  String get guildSettingsBanPermanent => 'Permanent udelukkelse';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Udløber $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Udløber';

  @override
  String get guildSettingsUnban => 'Ophæv udelukkelse';

  @override
  String get guildSettingsBansLoading => 'Indlæser udelukkede brugere';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Ingen udelukkelser fundet, der matcher din søgning.';

  @override
  String get guildSettingsBanDetailsTitle => 'Udelukkelsesdetaljer';

  @override
  String get guildSettingsBanViewDetails => 'Vis detaljer';

  @override
  String get guildSettingsBannedOn => 'Udelukket den';

  @override
  String get guildSettingsBannedBy => 'Udelukket af';

  @override
  String get guildSettingsRevokeBanTitle => 'Ophæv udelukkelse';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Er du sikker på, at du vil ophæve udelukkelsen for $displayName? De vil kunne genindtræde i fællesskabet.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Udelukkelse ophævet for $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Kunne ikke indlæse udelukkelser. Prøv igen.';

  @override
  String get guildSettingsRevokeBanError =>
      'Kunne ikke ophæve udelukkelse. Prøv igen.';

  @override
  String get guildSettingsCommunitySettings => 'Fællesskabsindstillinger';

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
      'Administrer din fællesskabsprofil, kanaler og standardindstillinger.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Branding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Opdater dit ikon, navn, banner og invitationsbaggrund';

  @override
  String get guildSettingsOverviewBannerUpload => 'Upload banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Inaktive indstillinger';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Konfigurer AFK-kanal og timeout';

  @override
  String get guildSettingsOverviewSystemTitle => 'System & velkomst';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Vælg destination for system- og velkomstbeskeder';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Standardnotifikationer';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Fællesskaber med over 250 personer tvinges til indstillingen \"kun @omtaler\". Din oprindelige indstilling bevares og gendannes, hvis fællesskabet falder til under 250 medlemmer.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Avanceret';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Tillad fleksible tekstkanalnavne';

  @override
  String get guildSettingsOverviewHideOwnerCrown => 'Skjul community-ejerkrone';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Adskilt banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Viser banneret i sin egen sektion under community-headeren.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Upload ikon';

  @override
  String get guildSettingsOverviewRemoveImage => 'Fjern';

  @override
  String get guildSettingsOverviewSplashTitle => 'Baggrund for invitation';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Baggrund for chat-embed';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Vises i invite-embeds i chat.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Upload baggrund';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Intet community-banner';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Ingen baggrund for invitation';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Forhåndsvisning';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Se hvordan din invitation ser ud for besøgende.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Tekstkanalnavne';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Community-ejerkrone';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigurer, om kroneikonet vises ved siden af community-ejeren';

  @override
  String get guildSettingsSplashCardAlignment => 'Kortjustering';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Centreret';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Venstre';

  @override
  String get guildSettingsSplashAlignmentRight => 'Højre';

  @override
  String get guildSettingsSplashAlignmentHint => 'Gælder kun på brede skærme.';

  @override
  String get permissionReadMessageHistory => 'Læs beskedhistorik';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Skift hvad brugere uden \"$permission\" kan se';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Brug en dedikeret modal til at indstille en dato for grænsen for beskedhistorik for medlemmer, der ikke har $permission-tilladelsen.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Åbn grænse for beskedhistorik';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Grænse for beskedhistorik';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Aktivér grænse for beskedhistorik';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Grænsedato';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Medlemmer uden Læs beskedhistorik kan se beskeder sendt efter denne dato.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Grænse for beskedhistorik opdateret';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Tillad store bogstaver og mellemrum i tekstkanalnavne. Fra begrænser navne til små bogstaver med bindestreger og understregninger.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Skjuler kroneikonet ved siden af community-ejeren på alle overflader.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animerede ikoner kræver community-funktionen Animeret ikon.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animerede bannere kræver community-funktionen Animeret banner.';

  @override
  String get guildSettingsAfkChannel => 'AFK / inaktiv kanal';

  @override
  String get guildSettingsAfkChannelHint =>
      'Flyt medlemmer til denne kanal, når de er AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Ingen AFK-kanal';

  @override
  String get guildSettingsAfkTimeout => 'AFK-timeout';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minut';

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
  String get guildSettingsSystemChannel => 'Destinationskanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Velkomst- og systembeskeder vises her.';

  @override
  String get guildSettingsNoSystemChannel => 'Ingen systemkanal';

  @override
  String get guildSettingsHideJoinMessages => 'Skjul tilmeldingsbeskeder';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Undertrykker join-beskeder i destinationskanalen.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Standard notifikationsindstillinger';

  @override
  String get guildSettingsNotificationsAll => 'Alle beskeder';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Notificer om alle beskeder';

  @override
  String get guildSettingsNotificationsMentions => 'Kun @-omtaler';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Notificer kun om @-omtaler';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks. 10MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks. 10MB. Minimum: 960×540px (16:9). Vises i invite-embeds i chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Konfigurer verificering, indholdsfiltrering og indstillinger for modent indhold.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Fællesskaber, der er listet i Discovery, har begrænsede moderationsmuligheder.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Indholdsfiltrering';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Screen beskedder automatisk for eksplicit indhold i kanaler, der ikke er markeret som modent indhold.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Fællesskaber, der er listet i Discovery, skal scanne alle medlemmer. Denne indstilling kan ikke ændres, mens Discovery er aktiveret.';

  @override
  String get guildSettingsContentFilterOff => 'Fra';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Lad fællesskabet selv moderere';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Filtrer medlemmer uden roller';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Anbefales til de fleste fællesskaber';

  @override
  String get guildSettingsContentFilterAll => 'Filtrer alle';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maksimal beskyttelse til familievenlige rum';

  @override
  String get guildSettingsModerationMatureOff => 'Fra';

  @override
  String get guildSettingsModerationMatureOn => 'Til';

  @override
  String get guildSettingsContentWarningToggle => 'Vis en indholdsadvarsel';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Viser en samtykkeprompt før indtastning i en kanal.';

  @override
  String get guildSettingsContentWarningText =>
      'Brugerdefineret advarselstekst';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Dette indeholder følsomt indhold.';

  @override
  String get guildSettingsModeration2faTitle => '2FA-krav';

  @override
  String get guildSettingsModeration2faDescription =>
      'Kræv to-faktor-godkendelse for moderatorer, før de kan forbyde, sparke, timeout eller fjerne beskeder.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Kræv 2FA for moderationshandlinger';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Kun fællesskabsejeren kan ændre denne indstilling';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Aktivér 2FA på din konto for at ændre denne indstilling';

  @override
  String get guildSettingsEmojiSearchHint => 'Søg efter emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Upload emoji';

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
    return 'Ikke-animeret emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animeret emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Søg efter klistermærker';

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
    return 'Opret webhooks fra Kanalindstillinger. Rediger dem her.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Din vanity URL vil ikke virke, medmindre mindst én kanal er synlig for alle.';

  @override
  String get guildSettingsVanityUrlRemove => 'Fjern';

  @override
  String get guildSettingsBannedUsersTitle => 'Bannlyste brugere';

  @override
  String get guildSettingsInvitesTableInviter => 'Inviterer';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Kode';

  @override
  String get guildSettingsInvitesTableUses => 'Brug';

  @override
  String get guildSettingsInvitesTableCreated => 'Oprettet';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrer efter bruger';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrer efter handling';

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
