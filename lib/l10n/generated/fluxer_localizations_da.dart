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
      'Noget er galt med instansen.\nDet burde være fikset om et øjeblik!';

  @override
  String get gatewayReconnectingToast => 'Genopretter forbindelse…';

  @override
  String get gatewayConnectedToast => 'Forbundet';

  @override
  String get sessionExpiredToast =>
      'Din session er udløbet. Log venligst ind igen.';

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
  String get nagbarLearnMore => 'Læs mere';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Vedligeholdelse er planlagt til $localizedTime. Forventet varighed: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Vedligeholdelse er i gang. Forventet varighed: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Vedligeholdelse er afsluttet.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hej $displayName, gør krav på din konto for at undgå at miste adgang.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hej $displayName, bekræft venligst din e-mailadresse.';
  }

  @override
  String get nagbarOpenSettings => 'Åbn indstillinger';

  @override
  String get systemPermissionSettingsTitle => 'Aktivér tilladelse';

  @override
  String get systemPermissionSettingsOpenSettings => 'Åbn indstillinger';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName har ikke adgang til din mikrofon. Du kan aktivere den i din enheds privatlivsindstillinger.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName har ikke adgang til dit kamera. Du kan aktivere det i din enheds privatlivsindstillinger.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName har ikke adgang til dit fotobibliotek. Du kan aktivere det i din enheds privatlivsindstillinger.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName har ikke tilladelse til at sende notifikationer. Du kan aktivere det i dine enhedsindstillinger.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Dit abonnement kunne ikke fornyes, men du har stadig adgang til $productName-fordele indtil $graceDate. Gør noget nu, ellers mister du alle fordele.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Dit $productName-abonnement er udløbet. Forny nu for at beholde dine fordele.';
  }

  @override
  String get nagbarManageSubscription => 'Administrer abonnement';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Velkommen til $productFullName. Udforsk dine $productName-fordele og administrer dit abonnement.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Se $productName-funktioner';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Du har en ny gavekode, der venter i din gavebeholdning.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Du har $count nye gavekoder, der venter i din gavebeholdning.';
  }

  @override
  String get nagbarViewGiftInventory => 'Se gaveoversigt';

  @override
  String get nagbarVisionaryMfa =>
      'Aktivér totrinsgodkendelse for at beskytte din Visionary-konto.';

  @override
  String get nagbarEnableMfa => 'Aktivér 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Vi har opdateret vores vilkår. Gennemgå og accepter dem for at fortsætte.';

  @override
  String get nagbarReviewTerms => 'Gennemgå vilkår';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Tilmeld dig $communityName for at chatte med teamet og holde dig opdateret.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Tilmeld dig $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Aktivér notifikationer, så du ikke går glip af beskeder og omtaler.';

  @override
  String get nagbarEnableNotifications => 'Slå notifikationer til';

  @override
  String get nagbarBillingPortalFailed =>
      'Kunne ikke åbne faktureringsportalen. Prøv igen om et øjeblik.';

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
  String get next => 'Næste';

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
  String get registerPendingApproval =>
      'Din kontoanmodning afventer godkendelse. Du kan logge ind, når en administrator har godkendt den.';

  @override
  String get registerClosed =>
      'Registrering er i øjeblikket lukket. Brug et registreringslink fra en administrator for at oprette en konto.';

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
  String get errorServiceUnavailable =>
      'Denne instans er midlertidigt utilgængelig. Prøv igen om et øjeblik.';

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
  String get embedInviteJoinGroup => 'Tilmeld dig gruppen';

  @override
  String get embedInviteAlreadyJoined => 'Allerede medlem';

  @override
  String get embedInviteDisabled => 'Inviter deaktiveret';

  @override
  String get embedInvitePaused =>
      'Invitationer er sat på pause for dette fællesskab.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName har registreret et potentielt raid, så nye brugere kan ikke tilmelde sig lige nu.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Dette fællesskab har sat invitationer på pause. Du kan prøve igen senere.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName har registreret et potentielt raid i dette fællesskab. Invitationer er sat på pause, så nye brugere kan ikke tilmelde sig lige nu.';
  }

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
  String get invalidDeepLinkTitle => 'Link kunne ikke åbnes';

  @override
  String get invalidDeepLinkDescription =>
      'Dette link er muligvis brudt, kun tilgængeligt på nettet, eller du har muligvis ikke adgang. Tjek linket, og prøv igen.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Gå til startside';

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
    return 'Visionær (livstid $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dage med $productName',
      one: '1 dag med $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uger med $productName',
      one: '1 uge med $productName',
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
  String get embedGiftClaimHelp => 'Tryk for at indløse din gave!';

  @override
  String get embedGiftAlreadyRedeemed => 'Allerede indløst';

  @override
  String get embedGiftClaimAccountHelp =>
      'Opret din konto for at indløse gaven.';

  @override
  String get embedGiftClaim => 'Indløs gave';

  @override
  String get embedGiftClaimed => 'Gave indløst';

  @override
  String get embedGiftClaimAccount => 'Opret konto for at indløse';

  @override
  String get embedGiftUnknownTitle => 'Ukendt gave';

  @override
  String get embedGiftUnknownSubtitle =>
      'Denne gavekode er ugyldig eller er allerede indløst.';

  @override
  String get embedGiftUnavailable => 'Gave ikke tilgængelig';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Indløs din gave for at aktivere dit $productName-abonnement!';
  }

  @override
  String get giftAcceptAlreadyClaimed =>
      'Denne gave er allerede blevet indløst.';

  @override
  String get giftAcceptMaybeLater => 'Måske senere';

  @override
  String get giftRedeemedToast => 'Gave indløst!';

  @override
  String get giftRedeemInvalidTitle => 'Ugyldig gavekode';

  @override
  String get giftRedeemInvalidMessage =>
      'Koden er ugyldig eller allerede brugt.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Gave er allerede indløst';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'Denne kode er allerede indløst.';

  @override
  String get giftRedeemNotFoundTitle => 'Gave ikke fundet';

  @override
  String get giftRedeemNotFoundMessage => 'Denne kode findes ikke.';

  @override
  String get giftRedeemFailedTitle => 'Kunne ikke indløse gave';

  @override
  String get giftRedeemFailedMessage =>
      'Kunne ikke indløse denne gave. Prøv igen.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Kan ikke indløse denne gave';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary-konti kan ikke indløse Plutonium-gaver. Kopier linket for at dele det med en ven i stedet.';

  @override
  String get giftCopyLink => 'Kopiér gave-link';

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
  String get notificationUseCategoryDefault => 'Brug kategori som standard';

  @override
  String get notificationUseCommunityDefault => 'Brug fællesskabets standard';

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
  String get dmDeleteMyMessagesTitle => 'Slet dine beskeder i denne samtale?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Dette vil slette alle beskeder, du nogensinde har sendt i denne samtale, permanent. Dette kan ikke fortrydes.';

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
  String get dmUnnamedGroup => 'Navnløs gruppe';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Gruppen med $resolvedName';
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
  String get dmDebugCategory => 'Debug kategori';

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
  String get addFriendVerifyToSend =>
      'Bekræft din e-mail, før du sender venneanmodninger.';

  @override
  String get addFriendFriendsListFull =>
      'Din venneliste er fuld, eller også er deres. Fjern en ven, og prøv igen.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'Dette er en standard-emoji på $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Denne emoji kommer fra dette community. Du kan bruge den overalt.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Dette er en specialfremstillet emoji fra et fællesskab.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Dette er en specialfremstillet emoji fra et fællesskab. Spørg forfatteren om en invitation for at bruge denne emoji.';

  @override
  String get emojiInfoFromHeader => 'Denne emoji er fra';

  @override
  String get emojiInfoDiscoverableCommunity => 'Synligt fællesskab';

  @override
  String get emojiInfoPrivateCommunity => 'Privat community';

  @override
  String get emojiInfoVerifiedCommunity => 'Verificeret fællesskab';

  @override
  String get emojiInfoAddToFavorites => 'Tilføj til favoritter';

  @override
  String get emojiInfoRemoveFromFavorites => 'Fjern fra favoritter';

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
  String get gifPickerFavoritesEmptyTitle => 'Ingen foretrukne GIF\'er endnu';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Stjernemærk en GIF for at se den her.';

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
  String externalLinkWarningLeaving(String productName) {
    return 'Du er ved at forlade $productName';
  }

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
  String profilePreviewMemberSince(String productName) {
    return '$productName-medlem siden';
  }

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'Administrer den e-mailadresse, du bruger til at logge ind på $productName';
  }

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
      'Vi sender en SMS-kode, når den er tilgængelig. Dit nummer er ikke knyttet til din konto. Vi gemmer kun en krypteret markør, uden bruger-id, for at tillade højst 2 bekræftelser inden for ca. 30 dage.';

  @override
  String get phoneAddSendCode => 'Send kode';

  @override
  String get phoneVerifyTitle => 'Bekræft telefonnummer';

  @override
  String get phoneVerifyDescription =>
      'Indtast bekræftelseskoden, der blev sendt til dit telefonnummer.';

  @override
  String get phoneAddSuccess => 'Telefonnummer bekræftet';

  @override
  String get phoneCountryLabel => 'Land';

  @override
  String get phoneSearchCountries => 'Søg lande...';

  @override
  String get phoneNumberRequired => 'Telefonnummer er påkrævet';

  @override
  String get phoneEnterValidNumber => 'Indtast et gyldigt mobilnummer.';

  @override
  String get phoneCannotBeUsed =>
      'Dette telefonnummer kan ikke bruges. Prøv et andet mobilnummer, eller kontakt support.';

  @override
  String get phoneAlreadyUsed =>
      'Dette telefonnummer er allerede i brug. Prøv et andet nummer, eller kontakt support.';

  @override
  String get phoneCodeDidNotWork =>
      'Koden virkede ikke. Tjek den, og prøv igen.';

  @override
  String get phoneTooManyAttempts =>
      'For mange forsøg. Vent lidt, og prøv så igen.';

  @override
  String get phoneSmsUnavailable =>
      'SMS-bekræftelse er ikke tilgængelig lige nu. Prøv igen senere, eller kontakt support.';

  @override
  String get phoneNotEligible =>
      'Telefonbekræftelse er ikke tilgængelig for denne konto. Brug en anden metode, eller kontakt support.';

  @override
  String get phoneCaptchaRequired =>
      'Der kræves et browsertjek, før telefonbekræftelse kan udføres. Prøv igen fra loginskærmen, eller kontakt support.';

  @override
  String get phoneSomethingWentWrong => 'Der opstod en fejl. Prøv igen.';

  @override
  String get phoneInboundExpensiveDescription =>
      'At sende en SMS til dette telefonnummer er for dyrt, så vi beder dig om at sende os en SMS i stedet. Du kan også kontakte support for at få os til at fjerne dette krav fra din konto.';

  @override
  String get phoneInboundDefaultDescription =>
      'Vi skal bruge en SMS fra dig for at bekræfte dit telefonnummer.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Åbn din telefons beskedapp, og opret en ny sms.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Send koden $code til $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Vent på, at vi modtager din besked. Det kan tage et minut.';

  @override
  String get phoneInboundGetNewCode => 'Få ny kode';

  @override
  String get phoneInboundChallengeCodeLabel => 'Kode til at sende';

  @override
  String get phoneInboundOurNumberLabel => 'Send til';

  @override
  String get requiredActionTitle => 'Kontobekræftelse påkrævet';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Gennemfør den påkrævede bekræftelse for at fortsætte med at bruge $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Din registrering kræver et ekstra anti-spam-tjek, før du kan fortsætte.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Bekræft din e-mail eller telefon for at fortsætte med at bruge $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Gennemfør de påkrævede trin til bekræftelse af e-mail og telefon herunder for at fortsætte med at bruge $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Vælg en bekræftelsesmetode';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Gennemfør en af bekræftelsesvejene herunder for at fortsætte med at bruge $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Brug e-mail';

  @override
  String get requiredActionUsePhone => 'Brug telefon';

  @override
  String get requiredActionCheckEmailTitle => 'Tjek din e-mail';

  @override
  String get requiredActionCheckEmailDescription =>
      'Vi har sendt et bekræftelseslink til din e-mailadresse. Åbn det for at fortsætte.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Send bekræftelsesmail igen';

  @override
  String get requiredActionVerificationEmailSent =>
      'Bekræftelsesmail sendt. Tjek din indbakke.';

  @override
  String get requiredActionSignOut => 'Log ud';

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
  String get networkErrorMessage => 'Der gik noget galt. Prøv igen.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uger siden',
      one: '1 uge siden',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count minutter',
      one: 'om 1 minut',
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
      other: 'om $count dage',
      one: 'om 1 dag',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'om $count uger',
      one: 'om 1 uge',
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
  String get relativeTimeJustNow => 'lige nu';

  @override
  String get authorizedAppsTitle => 'Autoriserede applikationer';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Disse applikationer har fået adgang til din $productName-konto.';
  }

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
  String get userProfileLoading => 'Indlæser profil';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName personale';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName fællesskabsteam';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName partner';
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
    return '$productName Visionær';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Visionær siden $date';
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
  String get userProfileRoles => 'Roller';

  @override
  String get memberRoleAdd => 'Tilføj rolle';

  @override
  String memberRoleRemove(String roleName) {
    return 'Fjern rolle $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Denne bruger har ingen roller i dette fællesskab.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Ingen roller endnu. Tilføj roller under $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Ingen roller tilgængelige';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Der er ingen roller at tildele i dette community lige nu, men du kan oprette en ny rolle i $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Fællesskabsindstillinger';

  @override
  String get guildSettingsRolesTab => 'Roller';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Lokaltid';

  @override
  String get userProfileSameTimeAsYou => 'Samme tid som dig';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration foran dig';
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
      other: '$hours timer',
      one: '1 time',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minutter',
      one: '1 minut',
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
      one: '1 minut',
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
  String get iarReportGuildTitle => 'Anmeld fællesskab';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Hvis denne anmeldelse handler om en specifik besked i dette fællesskab, skal du anmelde den besked i stedet. Beskedanmeldelser giver vores sikkerhedsteam den tydeligste kontekst, og hvis du tilføjer detaljer i kommentarerne, kan det hjælpe os med at gennemgå den hurtigere. Fortsæt kun med at anmelde fællesskabet som helhed, hvis en beskedanmeldelse ikke ville dække det bredere problem.';

  @override
  String get iarContinueToReportCommunity =>
      'Fortsæt med at anmelde fællesskab';

  @override
  String get iarPreviewCommunitySubtitle => 'Fællesskab';

  @override
  String get iarReasonHarassmentGuildLabel => 'Chikane eller målrettet misbrug';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Fællesskaber kan føre til koordinerede angreb eller målrettet chikane.';

  @override
  String get iarReasonHateGuildDescription =>
      'Fremmer had mod beskyttede grupper.';

  @override
  String get iarReasonTerrorismLabel => 'Terrorisme eller voldelig ekstremisme';

  @override
  String get iarReasonTerrorismDescription =>
      'Fremmer, rekrutterer til eller koordinerer voldelig ekstremistisk aktivitet.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Modent indhold eller usikker afskærmning';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Modent indhold uden korrekt afskærmning.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Bringes mindreårige i fare eller indeholder materiale med udnyttelse af børn.';

  @override
  String get iarReasonRaidLabel => 'Koordinering af raid';

  @override
  String get iarReasonRaidDescription =>
      'Koordinerer raids, brigading eller chikane mod personer eller fællesskaber.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Fællesskabet eksisterer for at spamme, svindle eller misbruge platformen.';

  @override
  String get iarReasonMalwareGuildLabel => 'Distribution af malware';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distribuerer malware, stjæler loginoplysninger eller skadelige filer.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Krænkelse af privatlivets fred eller doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Deler personlige oplysninger, stalker brugere eller koordinerer misbrug af privatlivets fred.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Opmuntrer til selvskade';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Opmuntrer til selvmord, selvskade eller spiseforstyrrelser.';

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
  String get slowmodeStatusEnabled => 'Langsom tilstand er aktiveret';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Langsom tilstand er aktiv ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Langsom tilstand er sat til $durationLabel, men du er fritaget.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Langsom tilstand er sat til $durationLabel. Vent, før du sender en ny besked.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Langsom tilstand er sat til $durationLabel for denne kanal.';
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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName overskrider størrelsesgrænsen ($fileSize)';
  }

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
      'Hold for at optage. Træk til papirkurven for at slette, skub op for at låse, eller slip for at sende.';

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
  String get voiceMessageSeekForward => 'Spol frem';

  @override
  String get voiceMessageSeekBackward => 'Spol tilbage';

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
  String get chatAttachmentDownloadedToast => 'Gemt i billeder';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Kunne ikke downloade vedhæftning';

  @override
  String get chatAttachmentExpiredTooltip => 'Vedhæftning udløbet';

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
      other: 'Vis ($count rækker)',
      one: 'Vis ($count række)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skjul ($count rækker)',
      one: 'Skjul ($count række)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count linjer tilbage)',
      one: '... ($count linje tilbage)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rækker tilbage)',
      one: '... ($count række tilbage)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Se hele filen';

  @override
  String get chatTextualPreviewChangeLanguage => 'Skift sprog';

  @override
  String get chatTextualPreviewSearchLanguage => 'Søg efter sprog…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntaksfremhævning';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Ingen resultater fundet';

  @override
  String get chatTextualPreviewMoreOptions => 'Flere valgmuligheder';

  @override
  String get chatTextualPreviewWrapText => 'Ombryd tekst';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Filen er for stor til forhåndsvisning (grænse $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Kunne ikke indlæse forhåndsvisning.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Almindelig tekst';

  @override
  String get chatTextualPreviewCopy => 'Kopiér';

  @override
  String get chatAttachmentSourceGallery => 'Galleri';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Gennemse filer';

  @override
  String get chatAttachmentPasteTooltip => 'Indsæt fil fra udklipsholder';

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
  String connectionsDescription(String productName) {
    return 'Knyt eksterne konti og domæner til din $productName-profil. Verificerede forbindelser vil blive vist på din profil, så andre kan se dem.';
  }

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
  String get lookAndFeelHdrSectionTitle => 'Højt dynamisk område';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Styr, hvordan HDR-billeder vises på HDR-kompatible skærme.';

  @override
  String get lookAndFeelHdrFullName => 'Fuld dynamisk rækkevidde';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Vis HDR-billeder med fuld lysstyrke og farveområde.';

  @override
  String get lookAndFeelHdrStandardName => 'Standardområde';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Tone-map HDR-billeder til standardområde, hvilket reducerer den maksimale lysstyrke.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Visningstilstand for højt dynamisk område';

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
  String get lookAndFeelChatFontSizeLabel => 'Skriftstørrelse i chat';

  @override
  String get lookAndFeelAppZoomTitle => 'Appens zoomniveau';

  @override
  String get lookAndFeelAppZoomDescription => 'Juster appens zoomniveau.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Chatbaggrund';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Vælg en baggrund til chatten. Den forbliver på denne enhed.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Denne indstilling forbliver på denne enhed';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Chatbaggrund gemmes kun på denne enhed og synkroniseres ikke til andre enheder.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Standard';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Brugerdefineret billede';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Farve $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradient $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Dæmpet baggrund';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Kunne ikke indstille dette billede som dit baggrundsbillede.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Beskeder';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Vælg, hvordan beskeder vises i chatkanaler.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Mellemrum mellem beskedgrupper';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Visning af beskeder';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Behagelig';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Rummeligt layout med tydelig visuel adskillelse mellem beskeder.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Tæt';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maksimerer synlige beskeder med minimal afstand.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Skjul brugeravatarer';

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
  String get communityTemporarilyUnavailable =>
      'Fællesskabet er midlertidigt utilgængeligt';

  @override
  String get guildUnavailableDescription =>
      'Der gik noget galt. Vi arbejder på det.';

  @override
  String get guildNotFoundTitle =>
      'Dette er ikke det fællesskab, du leder efter.';

  @override
  String get guildNotFoundDescription =>
      'Det fællesskab, du leder efter, er muligvis blevet slettet, eller også har du ikke adgang til det.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName er i øjeblikket kun tilgængelig for $productName-medarbejdere';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => '(midlertidigt utilgængelig)';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Kollaps DM\'er i mappe';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Når det er aktiveret, kollapses ulæste DM\'er i server-sidebaren til en mappe på $productName-knappen. Klik på $productName-knappen, mens du er på DM-siden, for at udvide eller kollapse mappen.';
  }

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
  String get favoritesAddToSavedMedia => 'Føj til gemte medier';

  @override
  String get favoritesRemoveFromSavedMedia => 'Fjern fra gemte medier';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Tilføj til URL-baserede GIF-favoritter';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Fjern fra URL-baserede GIF-favoritter';

  @override
  String get savedMediaAddTitle => 'Føj til gemte medier';

  @override
  String get savedMediaFormNameLabel => 'Navn';

  @override
  String get savedMediaFormNameHint => 'Mine fantastiske medier';

  @override
  String get savedMediaFormAltTextLabel => 'Alternativ tekst';

  @override
  String get savedMediaFormAltTextHint => 'Beskriv mediet';

  @override
  String get savedMediaFormTagsLabel => 'Tags';

  @override
  String get savedMediaFormTagsHint => 'sjov, reaktion, arbejde';

  @override
  String get savedMediaSaveError => 'Kunne ikke opdatere gemte medier.';

  @override
  String get savedMediaNameRequired => 'Navn er påkrævet.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Hvordan skal vi gemme dine GIF-favoritter?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Du kan gemme stjernemarkerede GIF\'er som favoritter kun med URL eller uploade dem til dine gemte medier. Vælg den, der passer til, hvordan du bruger dem. Du kan ændre det når som helst i Indstillinger > Avanceret > Medier.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-only favoritter (standard): synkroniseret på tværs af dine enheder, ingen upload, tæller ikke med i gemte medier. De originale medier kan forsvinde, hvis værten fjerner dem.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Gemte medier: uploadede, tagbare, søgbare og permanente, men de tæller med i din grænse for gemte medier.';

  @override
  String get gifFavoriteFirstTimeHint => 'Vi spørger kun én gang.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Brug kun URL (anbefalet)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Brug gemte medier';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Når de uploades direkte til $productName';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'Kameraoverførsler';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Vælg, om billeder og videoer taget med kameraet i appen gemmes på din enhed';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Gem på enhed';

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
  String get accessibilitySaturationTitle => 'Mætning';

  @override
  String get accessibilitySaturationDescription =>
      'Juster, hvor levende temafarver vises i hele appen.';

  @override
  String get accessibilityVisualGroupTitle => 'Visuelt';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Altid understreg links';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Dæmp gennemstreget tekst';

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
  String get accessibilityScreenReaderGroupTitle => 'Skærmlæser';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Styr, hvordan $productName fungerer med skærmlæsere.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Læs nye beskeder op';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Lad skærmlæsere annoncere nye beskeder, når de ankommer i den åbne kanal. Notifikationslyde påvirkes ikke.';

  @override
  String get accessibilityTtsGroupTitle => 'Tekst til tale';

  @override
  String get accessibilityTtsGroupDescription =>
      'Vælg en hastighed for talte tekster.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Afspilningshastighed for tale';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Afspil eksempel';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Støjfri prøve';

  @override
  String get accessibilityPreviewButtonLabel => 'Forhåndsvisningsknap';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Sådan vises links: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Forhåndsvisning af bruger';

  @override
  String get accessibilityKeyboardGroupTitle => 'Tastatur';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Vis fokusring på chattekstfelt';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Escape-tasten afslutter tastaturtilstand';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Vis genveje til kontekstmenu';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Bekræft, før opkald startes';

  @override
  String get accessibilityAnimationGroupTitle => 'Animation';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Reduceret bevægelse er slået til, så indholdsanimationer er som standard sat på pause. Du kan stadig slå dem til igen for at afspille dem.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'Afspil animerede emojis';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Afspil GIF\'er automatisk';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Afspil automatisk GIF\'er, når $productName er i fokus';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Afspiller trods reduceret bevægelse.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Sat på pause på grund af reduceret bevægelse. Slå til for at beholde animerede emojis.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Sat på pause på grund af reduceret bevægelse. Slå til for at afspille GIF\'er.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Standardindstillingen er slået fra på mobil for at spare på batteri og data.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Stickeranimationer';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Præference for klistermærkeanimation';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Vis altid animationer';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Klistermærker animeres altid';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animer ved interaktion';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Klistermærker animeres, når du trykker på dem';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Klistermærker animeres, når du holder musen over dem eller interagerer med dem';

  @override
  String get accessibilityStickerNeverAnimateName => 'Aldrig animer';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Klistermærker animeres aldrig';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Altid animeret på trods af reduceret bevægelse.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Begrænset bevægelse begrænser klistermærker til at animere ved interaktion. Vælg altid animer for at tilsidesætte.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Standardindstillingen er at animere ved interaktion på mobil for at spare på batteriet.';

  @override
  String get accessibilityMotionGroupTitle => 'Bevægelse';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Synkroniser indstilling for reduceret bevægelse med systemet';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Brug enhedens systemindstilling for reduceret bevægelse, eller tilpas den nedenfor.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reducer bevægelse';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Deaktiver animationer og overgange. Styres i øjeblikket af dine systemindstillinger.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Deaktiver animationer og overgange i hele appen.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animerede emojis, GIF\'er og stickers forbliver under din kontrol i fanen Animation.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Start opkald?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Er du sikker på, at du vil starte denne opkald?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Start opkald';

  @override
  String get accessibilityTtsSampleDescription =>
      'Hør eksempellinjen læst op med den valgte hastighed.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, jeg er fra fremtiden. Jeg kom hertil i en tidsmaskine, som du opfandt. Nu har jeg brug for din hjælp til at komme tilbage til år 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Talegenkendelse er ikke tilgængelig på denne enhed.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Afspilning af tale mislykkedes. Prøv igen, eller tjek, at lyden virker.';

  @override
  String get ttsSubstitutionUnknownUser => 'Ukendt bruger';

  @override
  String get ttsSubstitutionUnknownRole => 'ukendt rolle';

  @override
  String get ttsSubstitutionUnknownChannel => 'ukendt kanal';

  @override
  String get ttsSubstitutionCodeBlock => 'kodeblok';

  @override
  String get ttsSubstitutionSpoiler => 'skjult';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'skråstreg $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName sagde: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Svarer $replyAuthorName: $authorName sagde: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'sendte et klistermærke';

  @override
  String get ttsSentAttachment => 'sendte en vedhæftet fil';

  @override
  String ttsSentAttachments(int count) {
    return 'sendt $count vedhæftede filer';
  }

  @override
  String get ttsSentEmbed => 'sendte en indlejring';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author sendte $summary';
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
  String get systemCallJoinTheCall => 'Deltag i opkaldet';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username started et opkald, der varede $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Du missede et opkald fra $username, som varede $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Du missede et opkald fra $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'få sekunder';

  @override
  String get systemCallDurationMinute => 'et minut';

  @override
  String get systemCallDurationOneYear => '1 år';

  @override
  String get systemCallDurationOneMonth => '1 måned';

  @override
  String get systemCallDurationOneWeek => '1 uge';

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
    return '$count uger';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count dage';
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
    return 'Opdater $productName for at se denne besked.';
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
  String get voiceJoinFailedTitle => 'Kunne ikke deltage i stemmekanal';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Kunne ikke afbryde forbindelsen til dine andre enheder. Prøv igen om et øjeblik.';

  @override
  String get voiceChannelEmptyDescription =>
      'Dette er en stemmekanal. Opret forbindelse for at begynde at tale!';

  @override
  String get voiceChannelJoin => 'Deltag i talechat';

  @override
  String get voiceCallJoin => 'Deltag i opkald';

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
  String get voiceControlFlipCamera => 'Skift kamera';

  @override
  String get voiceControlScreenShare => 'Skærmdeling';

  @override
  String get voiceScreenShareNotificationText => 'Deler din skærm.';

  @override
  String get voiceControlMore => 'Mere';

  @override
  String get voiceControlDisconnect => 'Afbryd';

  @override
  String get voiceInChat => 'I talechat';

  @override
  String get voiceConnectionFailed => 'Forbindelse mislykkedes';

  @override
  String get voiceConnectionRetry => 'Prøv igen';

  @override
  String get voiceConnectionDismiss => 'Luk';

  @override
  String get voiceConnectionDisconnected => 'Afbrudt';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Måler svartid ...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Gå til $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Stemmeopkald';

  @override
  String get voiceConnectionAdvancedStats => 'Avanceret';

  @override
  String get voiceShowCallAvatars => 'Vis opkaldsavatarer';

  @override
  String get voiceShowConnectionId => 'Vis forbindelses-id';

  @override
  String get voiceAudioProcessing => 'Lydbehandling';

  @override
  String get voiceConnectionSessionSection => 'Session';

  @override
  String get voiceConnectionDurationLabel => 'Varighed';

  @override
  String get voiceConnectionParticipantsLabel => 'Deltagere';

  @override
  String get voiceConnectionNetworkSection => 'Netværk';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Send';

  @override
  String get voiceConnectionReceiveLabel => 'Modtag';

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
  String get userAreaMuteMicrophone => 'Slå mikrofon fra';

  @override
  String get userAreaUnmuteMicrophone => 'Slå mikrofon til';

  @override
  String get userAreaUserSettings => 'Brugerindstillinger';

  @override
  String get voiceParticipantMenuViewProfile => 'Se profil';

  @override
  String get voiceParticipantMenuFocus => 'Fokuser på denne person';

  @override
  String get voiceParticipantMenuUnfocus => 'Fjern fokus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Slå lyden fra for medlem';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Slå lyd fra i community';

  @override
  String get voiceParticipantMenuUserVolume => 'Brugervolumen';

  @override
  String get voiceParticipantMenuStreamVolume => 'Streamlydstyrke';

  @override
  String get voiceParticipantMenuStopStreaming => 'Stop streaming';

  @override
  String get voiceParticipantModerationFailed =>
      'Kunne ikke opdatere det medlem. Prøv igen.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Vis';

  @override
  String get voiceCallViewModeGrid => 'Gitter';

  @override
  String get voiceCallViewModeFocus => 'Fokus';

  @override
  String get voicePanelSettingsSectionTitle => 'Stemmeindstillinger';

  @override
  String get voicePanelUseEarpieceLabel => 'Brug øresnegl';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Vis kun videoer';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Vis kun deltagere, der har deres kamera tændt.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Vis mit eget kamera';

  @override
  String get voicePrioritizeSpeakersLabel => 'Prioritér talere';

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
  String get privacyDashboardProfilePrivacySection => 'Profilsynlighed';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Venner og direkte beskeder';

  @override
  String get privacyDashboardActivitySharingSection => 'Aktivitetsdeling';

  @override
  String get privacyDashboardSensitiveContentSection => 'Følsomt indhold';

  @override
  String get privacyDashboardDataExportSection => 'Eksporter data';

  @override
  String get privacyDashboardDataDeletionSection => 'Sletning af data';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Hvem kan se din fulde profil';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Venner og alle fællesskaber';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Din fulde profil er synlig for venner og alle i dine fællesskaber';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Kun venner og små fællesskaber';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Din fulde profil er synlig for venner og medlemmer af dine fællesskaber med 200 eller færre medlemmer';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Kun venner';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Din fulde profil er kun synlig for dine venner';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Venneanmodninger';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Alle';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Tillad alle at sende dig venneanmodninger';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Venner af venner';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Tillad venner af dine venner at sende dig anmodninger';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Fællesskabsmedlemmer';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Tillad medlemmer fra fællesskaber, du er en del af, at sende dig anmodninger';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direkte beskeder';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Tillad direkte beskeder fra fællesskabsmedlemmer';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Tillad medlemmer fra fællesskaber, du er en del af, at sende dig direkte beskeder';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Tillad direkte beskeder fra community-bots';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Tillad bots fra fællesskaber, du er en del af, at sende dig direkte beskeder';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Styr, hvem der kan sende dig venneanmodninger og direkte beskeder';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Styr, hvem der kan ringe til dig, og hvem der kan tilføje dig til gruppechats';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Indgående opkald';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Styr, hvem der kan ringe til dig';

  @override
  String get privacyDashboardAllowedCallers => 'Tilladte opkaldere';

  @override
  String get privacyDashboardIncomingCallNobody => 'Ingen';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Bloker alle indgående opkald';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Kun venner';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Tillad kun venner at ringe til dig (anbefalet)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Venner + Brugerdefineret';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Tillad venner plus yderligere grupper, du vælger';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Alle';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Tillad alle at ringe til dig, selv fremmede';

  @override
  String get privacyDashboardAdditionalGroups => 'Yderligere grupper';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Folk, der er venner med dine venner, kan ringe til dig';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Folk fra fællesskaber, I begge er en del af, kan ringe til dig';

  @override
  String get privacyDashboardRingBehavior => 'Ringadfærd';

  @override
  String get privacyDashboardSilentCalls => 'Stilleopkald fra alle';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Alle opkald vil notificere lydløst i stedet for at ringe. Som standard er opkald fra ikke-venner altid lydløse.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Hvem kan tilføje dig til gruppechats';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Styr, hvem der kan tilføje dig til gruppechats uden at spørge. Alle kan stadig sende dig invitationslinks for at deltage.';

  @override
  String get privacyDashboardAllowedInvites => 'Tilladte invitationer';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Lad ingen tilføje dig til gruppechats uden at spørge';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Tillad kun venner at tilføje dig uden at spørge (anbefales)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Tillad venner plus yderligere grupper at tilføje dig';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Tillad alle at tilføje dig til gruppechats uden at spørge';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Folk, der er venner med dine venner, kan tilføje dig til gruppechats';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Personer fra fællesskaber, I begge er en del af, kan tilføje dig til gruppechats';

  @override
  String get privacyDashboardVoiceActivityTitle => 'Stemmeaktivitet i aktiv nu';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Del din stemmeaktivitet med venner';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Del stemmeaktivitet med alle venner?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Stop deling af stemmeaktivitet med alle venner?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Du er ved at begynde at dele din stemmeaktivitet med alle dine venner, også fremtidige. Dette sender en opdatering til dem alle og kan først ændres igen om 24 timer.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Du er ved at stoppe med at dele din stemmeaktivitet med alle dine venner, også fremtidige. Dette sender en opdatering til dem alle og kan først ændres igen om 24 timer.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Ja, del med alle venner';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Ja, stop deling';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Tilgængelig igen om $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Deling af stemmeaktivitet opdateret';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Kunne ikke opdatere deling af stemmeaktivitet lige nu';

  @override
  String get privacyDashboardDataExportDesc =>
      'Opret et arkiv, der kan downloades, med dine kontodata, herunder beskeder og vedhæftede URL\'er. De fleste vil have det hele, men du kan indsnævre omfanget nedenfor.';

  @override
  String get privacyDashboardExportMyData => 'Eksporter mine data';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Fjern permanent beskeder, du har sendt i direkte beskeder, gruppedirekte beskeder og fællesskaber. Arbejdet udføres i baggrunden, og du får en direkte besked, når det er færdigt.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Slet mine beskeder';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Tillad direkte beskeder fra fællesskabsmedlemmer?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Bloker direkte beskeder fra fællesskabsmedlemmer?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Tillad bots at sende dig direkte beskeder?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Bloker bots fra at sende dig direkte beskeder?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Vil du også tillade direkte beskeder fra medlemmer af dine eksisterende fællesskaber?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Vil du også blokere direkte beskeder fra medlemmer af dine eksisterende fællesskaber?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Vil du også tillade bots fra dine eksisterende fællesskaber at sende dig direkte beskeder?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Vil du også blokere bots fra dine eksisterende fællesskaber?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Du kan også ændre denne indstilling pr. fællesskab ved at trykke og holde på fællesskabets navn og vælge Privatlivsindstillinger.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Tillad for alle fællesskaber';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Bloker for alle fællesskaber';

  @override
  String get privacyDashboardDmConfirmSkip => 'Spring dette trin over';

  @override
  String get privacyDashboardDataRequestGoBack => 'Gå tilbage';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Eksporter mine data';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Slet mine beskeder';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Vi behandler dette hurtigst muligt. Du får en e-mail, når dit arkiv er klar.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Vi behandler dette hurtigst muligt. Du får en direkte besked fra os, når det er færdigt.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Hvad skal medtages';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Alt';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Eksporter alle beskeder, du nogensinde har sendt, plus alle dine kontoindstillinger, medlemskaber og metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Brugerdefineret valg';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Vælg, hvilke samtaletyper, fællesskaber og tidsrum der skal inkluderes i arkivet.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Vælg, hvad der skal inkluderes';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Vælg, hvilke typer samtaler der skal ryddes op i.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Kun steder, jeg ikke længere har adgang til';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Slet kun beskeder fra fællesskaber og gruppe-DM\'er, du har forladt eller er blevet fjernet fra.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Hvilke samtaler';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Vælg, hvilke typer samtaler du vil inkludere.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Åbne DMs';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Lukkede direkte beskeder';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Gruppechats';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Fællesskaber';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle =>
      'Hvilke fællesskaber';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Fællesskabsfilter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Inkluder alle undtagen valgte';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Kun de valgte';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Du er ikke medlem af nogen fællesskaber lige nu.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Tidsinterval';

  @override
  String get privacyDashboardDataRequestDateMode => 'Tidsinterval';

  @override
  String get privacyDashboardDataRequestAllTime => 'Altid';

  @override
  String get privacyDashboardDataRequestCustomRange =>
      'Brugerdefineret interval';

  @override
  String get privacyDashboardDataRequestStartDate => 'Startdato';

  @override
  String get privacyDashboardDataRequestEndDate => 'Slutdato';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Lad et af felterne stå tomt for at lade den ende af vinduet være ubegrænset.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Vælg mindst én samtaletype, der skal inkluderes.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Startdatoen skal være før slutdatoen.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Gennemse og bekræft';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Vi opretter et arkiv, der kan downloades, med alle de beskeder, du nogensinde har sendt, og sender dig en e-mail, når det er klar. Downloadlinket i den e-mail udløber efter 7 dage.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Vi opretter et arkiv, der kan downloades, som matcher filtrene nedenfor, og sender dig en e-mail, når det er klar. Downloadlinket i e-mailen udløber efter 7 dage.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Slet permanent de meddelelser, der matcher filtrene nedenfor. Dette kan ikke fortrydes.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Der er ingen fortrydelsesret, når dette er startet. Vi sender dig en direkte besked, når det er færdigt.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Anmod om eksport';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Slet beskeder';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Søgeområde';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Samtaler';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Fællesskaber';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Tidsinterval';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Ingen';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Fra $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Indtil $end';
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
      other: '# fællesskaber',
      one: '# fællesskab',
    );
    return 'Alle undtagen $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# fællesskaber',
      one: '# fællesskab',
    );
    return 'Kun $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Åbne direkte beskeder';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Lukkede direkte beskeder';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Direkte beskeder (åbne og lukkede)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Gruppechats';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Fællesskaber';

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
      one: '# minut',
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
      'Kunne ikke indlæse privatlivsindstillinger';

  @override
  String get privacyDashboardRetry => 'Prøv igen';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Kunne ikke gemme indstillinger for følsomt indhold.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Kunne ikke fuldføre anmodning.';

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
      'Venter på, at slowmode udløber i en eller flere valgte kanaler.';

  @override
  String get slowmodeRateLimitedTitle => 'Langsom tilstand aktiv';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Slowmode er slået til – vent $duration, før du sender en ny besked.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Direkte upload er deaktiveret under slowmotion.';

  @override
  String get shareMediaTitle => 'Del til';

  @override
  String get shareMediaMessageHint => 'Tilføj en valgfri besked…';

  @override
  String get shareMediaSendButton => 'Send';

  @override
  String get shareMediaSuccessToast => 'Medier delt';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Delt med $count destinationer';
  }

  @override
  String get shareMediaFailedToast => 'Kunne ikke dele medier';

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
  String get chatMessageCopyEmbedText => 'Kopiér embed-tekst';

  @override
  String get chatMessageTranslate => 'Oversæt';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Oversat fra $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Se original';

  @override
  String get chatMessageSeeTranslation => 'Se oversættelse';

  @override
  String get chatMessageTranslating => 'Oversætter…';

  @override
  String get chatMessageTranslateFailed => 'Kunne ikke oversætte denne besked.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Oversættelse er ikke tilgængelig på denne enhed.';

  @override
  String get chatMessageSpeak => 'Læs besked op';

  @override
  String get chatMessageStopSpeaking => 'Stop med at tale';

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
  String get chatMessageOpenLink => 'Åbn link';

  @override
  String get chatMessageCopyLink => 'Kopiér link';

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
  String get chatReactionAddFailed => 'Kunne ikke tilføje reaktion';

  @override
  String get chatReactionRemoveFailed => 'Kunne ikke fjerne reaktion';

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
  String iarReasonOtherDescription(String productName) {
    return 'Brug kun, hvis det tydeligt bryder $productName regler og ikke passer ovenfor.';
  }

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
  String get chatMessageDeleteAttachment => 'Slet vedhæftning';

  @override
  String get chatMessageEditAttachmentAltText => 'Rediger alternativ tekst';

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
      other: '$count blokerede beskeder',
      one: '1 blokeret besked',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potentielle spam-beskeder',
      one: '1 potentiel spam-besked',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Svar skjult, fordi den oprindelige forfatter er blokeret.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Svar skjult, fordi den oprindelige forfatter er markeret som spammer.';

  @override
  String get devMarkAsSpamLocally => 'Markér som spam lokalt';

  @override
  String get devIgnoreSpamFlag => 'Ignorer spammarkering';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'Medieindstillinger';

  @override
  String get mediaViewerCopyLink => 'Kopiér link';

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
    return 'Vedhæftning $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Luk';

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
  String get composerAutocompleteUsersHeading => 'Brugere';

  @override
  String get composerAutocompleteMentionsHeading => 'Omtaler';

  @override
  String get composerAutocompleteRolesHeading => 'Roller';

  @override
  String get composerAutocompleteMediaHeading => 'Medier';

  @override
  String get composerAutocompleteStickersHeading => 'Klistermærker';

  @override
  String get composerAutocompleteGifsHeading => 'GIF\'er';

  @override
  String get composerAutocompleteNoGifs => 'Ingen GIF\'er fundet';

  @override
  String get composerCommandShrugDescription =>
      'Tilføjer ¯\\_(ツ)_/¯ til din besked.';

  @override
  String get composerCommandTableflipDescription =>
      'Tilføjer (╯°□°)╯︵ ┻━┻ til din besked.';

  @override
  String get composerCommandUnflipDescription =>
      'Tilføjer ┬─┬ ノ( ゜-゜ノ) til din besked.';

  @override
  String get composerCommandMeDescription =>
      'Send en handlingsbesked (vises med kursiv).';

  @override
  String get composerCommandSpoilerDescription =>
      'Send en spoilerbesked (pakkes ind i spoilertags).';

  @override
  String get composerCommandTtsDescription => 'Send en tekst-til-tale-besked.';

  @override
  String get composerCommandNickDescription =>
      'Skift dit kaldenavn i dette fællesskab.';

  @override
  String get composerCommandKickDescription =>
      'Smide et medlem ud af dette fællesskab.';

  @override
  String get composerCommandBanDescription =>
      'Bandlys et medlem fra dette fællesskab.';

  @override
  String get composerCommandMsgDescription =>
      'Send en direkte besked til en bruger.';

  @override
  String get composerCommandSavedDescription => 'Send et gemt medieelement.';

  @override
  String get composerCommandStickerDescription => 'Send et klistermærke.';

  @override
  String get composerCommandGifDescription => 'Søg efter og send en GIF.';

  @override
  String get composerCommandMemberOption => 'Medlemmet, der skal målrettes.';

  @override
  String get composerCommandReasonOption => 'Årsag (valgfri).';

  @override
  String get composerCommandMessageOption => 'Beskeden, der skal sendes.';

  @override
  String get composerCommandQueryOption => 'Hvad du skal søge efter.';

  @override
  String get composerCommandNicknameOption =>
      'Dit nye kaldenavn, eller lad stå tomt for at nulstille det.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Hvor meget af medlemmets seneste beskedhistorik der skal slettes.';

  @override
  String get composerCommandDeleteMessagesNone => 'Slet ingen';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Tidligere $count dage';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Seneste 24 timer';

  @override
  String get composerCommandOptionRequired =>
      'Denne indstilling er påkrævet. Angiv venligst en værdi.';

  @override
  String get composerCommandClear => 'Ryd kommando';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Du ændrede dit kaldenavn i dette fællesskab fra **$previousNickname** til **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Ukendt bruger';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Kunne ikke sende en besked til **$username**. De har muligvis deaktiveret direkte beskeder, eller du er muligvis blokeret.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count mere';
  }

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
  String get addGuildCreateTitle => 'Opret et fællesskab';

  @override
  String get addGuildCreateDescription =>
      'Opret et fællesskab, hvor du og dine venner kan chatte.';

  @override
  String get addGuildCreateNameLabel => 'Navn på fællesskab';

  @override
  String get addGuildCreateSubmit => 'Opret fællesskab';

  @override
  String get addGuildCreateFailed => 'Kunne ikke oprette community. Prøv igen.';

  @override
  String get addGuildCreateClaimTitle => 'Gør krav på din konto';

  @override
  String get addGuildCreateClaimDescription =>
      'Du skal bekræfte din konto, før du kan oprette et fællesskab.';

  @override
  String get addGuildCreateVerifyTitle => 'Bekræft din e-mail';

  @override
  String get addGuildCreateVerifyDescription =>
      'Du skal bekræfte din e-mailadresse, før du kan oprette et fællesskab.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Animerede ikoner understøttes ikke, når du opretter et nyt fællesskab. Brug et statisk billede.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Ved at oprette et fællesskab accepterer du at følge og overholde ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName community guidelines';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Denne instans er et enkelt fællesskab, så yderligere fællesskaber kan ikke oprettes.';

  @override
  String get addGuildCreateChangeIcon => 'Skift ikon';

  @override
  String get addGuildCreateIconLabel => 'Fællesskabsikon';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Maks. 10 MB. Anbefalet: 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Indsæt en Discord-skabelon-URL for at importere dens struktur til et nyt fællesskab.';

  @override
  String get addGuildImportUrlLabel => 'Skabelon-URL';

  @override
  String get addGuildImportUrlInvalid =>
      'Indtast en gyldig Discord-skabelon URL eller kode.';

  @override
  String get addGuildImportFetchFailed =>
      'Kunne ikke hente community-skabelonen. Skabelonen findes muligvis ikke, eller den eksterne tjeneste er utilgængelig.';

  @override
  String get addGuildImportInvalidResponse =>
      'Dette ligner ikke et gyldigt skabelonsvar.';

  @override
  String get addGuildImportTemplateLabel => 'Skabelon';

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
      'Skabelondataet for fællesskabet er ugyldigt eller forkert formateret.';

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
  String get channelDetailsFallbackTitle => 'Detaljer';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Gruppechat · $count medlemmer';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Luk din samtale med $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Forlad $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Kanalindstillinger';

  @override
  String get channelDetailsGroupSettingsTitle => 'Gruppens indstillinger';

  @override
  String get channelDetailsDmSettingsTitle => 'DM-indstillinger';

  @override
  String get channelDetailsInvitePeople => 'Inviter folk';

  @override
  String get channelDetailsCopyLink => 'Kopiér link';

  @override
  String get channelMenuCopyChannelLink => 'Kopiér kanallink';

  @override
  String get channelMenuCopyRedirectLink => 'Kopiér omdirigeringslink';

  @override
  String get channelDetailsAddFriendsToGroup => 'Tilføj venner til gruppen';

  @override
  String get channelDetailsGroupInvites => 'Gruppeinvitationer';

  @override
  String get channelDetailsEditChannel => 'Rediger kanal';

  @override
  String get channelDetailsDeleteChannel => 'Slet kanal';

  @override
  String get channelSettingsCategorySettingsTitle => 'Kategoriindstillinger';

  @override
  String get channelSettingsEditCategory => 'Rediger kategori';

  @override
  String get channelSettingsTabOverview => 'Oversigt';

  @override
  String get channelSettingsTabPermissions => 'Tilladelser';

  @override
  String get channelSettingsTabInvites => 'Invitationer';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Slet kanal';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Er du sikker på, at du vil slette $channelName? Dette kan ikke fortrydes.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Er du sikker på, at du vil slette $categoryName? Dette kan ikke fortrydes.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Slet kategori';

  @override
  String get channelSettingsChannelUpdated => 'Kanal opdateret';

  @override
  String get channelSettingsChannelName => 'Kanalnavn';

  @override
  String get channelSettingsCategoryName => 'Kategorinavn';

  @override
  String get channelSettingsMyCategory => 'Min kategori';

  @override
  String get categoryExpandCategory => 'Udvid kategori';

  @override
  String get categoryCollapseCategory => 'Skjul kategori';

  @override
  String get categoryExpandAllCategories => 'Udvid alle kategorier';

  @override
  String get categoryCollapseAllCategories => 'Skjul alle kategorier';

  @override
  String get categoryMuteCategory => 'Slå kategori fra';

  @override
  String get categoryUnmuteCategory => 'Slå kategori til';

  @override
  String get categoryCopyCategoryId => 'Kopiér kategori-id';

  @override
  String get categoryIdCopied => 'Kategori-ID kopieret';

  @override
  String get channelSettingsChannelNamePlaceholder => 'Generelt';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Emne';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Tilføj et emne til denne kanal';

  @override
  String get channelSettingsInsertEmoji => 'Indsæt emoji';

  @override
  String get channelSettingsTopicTooLongTitle => 'Kanalemnet er for langt.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Forkort emnet, og prøv igen.';

  @override
  String get channelSettingsSlowmode => 'Langsom tilstand';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Ventetid mellem beskeder. \"$bypassSlowmodePermissionLabel\" kan tilsidesætte dette.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Fra';

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
    return '$oneMinute minut';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour time';
  }

  @override
  String get channelSettingsVoiceQuality => 'Stemmekvalitet';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Højere bitrate = bedre kvalitet og højere båndbreddeforbrug.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Antal deltagere';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maksimalt antal medlemmer, der kan deltage ad gangen. 0 betyder ubegrænset.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deltagere',
      one: '1 deltager',
      zero: '∞ Ingen grænse',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Forbindelsesgrænse';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maksimalt antal aktive forbindelser, et medlem kan have i denne kanal.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count forbindelser',
      one: '1 forbindelse',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Stemmeregion';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Vælg en stemmeregion for denne kanal. Automatisk bruger den nærmeste region.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatisk';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Kunne ikke indlæse stemmeregioner';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Prøv igen om et øjeblik.';

  @override
  String get channelSettingsResetSlider => 'Nulstil skyder til standardværdi';

  @override
  String get channelSettingsAdvanced => 'Avanceret';

  @override
  String get channelSettingsMatureContentOverride => 'Tilsidesæt voksenindhold';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Overskriv indstillingen for $scopeLevel-niveau for denne kanal. Modent indhold vises bag en port, før man kommer ind.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Arv';

  @override
  String get channelSettingsMatureContentOn => 'Til';

  @override
  String get channelSettingsMatureContentOff => 'Fra';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Marker denne kanal som indhold for voksne.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Lad denne kanal være åben for voksent indhold.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Arvet fra $inheritedSourceLabel: til';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Arvet fra $inheritedSourceLabel: slået fra';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'Kategori';

  @override
  String get channelSettingsMatureContentCommunitySource => 'fællesskab';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategori';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Fællesskab';

  @override
  String get channelSettingsContentWarningToggle =>
      'Vis en indholdsadvarsel i denne kanal';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Viser en anmodning om samtykke, før du går ind i denne kanal.';

  @override
  String get channelSettingsContentWarningText => 'Tilpasset advarselstekst';

  @override
  String get channelSettingsContentWarningDefault =>
      'Dette indeholder følsomt indhold.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Du skal have tilladelsen \"$manageChannelsPermissionLabel\" for at redigere disse tilladelser.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Du skal have tilladelsen \"$manageRolesPermissionLabel\" for at redigere disse tilladelser.';
  }

  @override
  String get channelSettingsUnknownRole => 'Ukendt rolle';

  @override
  String get channelSettingsUnknownUser => 'Ukendt bruger';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Adgangstilsidesættelser';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Rediger adgang for $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Tilbage til tilsidesættelser';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Konfigurer grundlæggende adgang for denne kanal';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Konfigurer tilsidesættelser for denne rolle';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Konfigurer tilsidesættelser for dette medlem';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Søg tilladelser…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Kanaladgang opdateret';

  @override
  String get channelSettingsPermissionsTitle => 'Adgangskontrol';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Denne kanal er synkroniseret med den overordnede kategori ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Denne kanal er ikke synkroniseret med den overordnede kategori ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Synkroniser med kategori';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanal synkroniseret med overordnet kategori';

  @override
  String get channelSettingsPermissionsAddOverride => 'Tilføj tilsidesættelse';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Søg efter roller eller medlemmer …';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Roller og medlemmer';

  @override
  String get channelSettingsDeleteInvite => 'Slet invitation';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Slet denne invitation? Kan ikke fortrydes.';

  @override
  String get channelSettingsCopyInviteCode => 'Kopiér invitationskode';

  @override
  String get channelSettingsCopyInviteUrl => 'Kopiér invitationslink';

  @override
  String get channelSettingsWebhookCreated => 'Webhook oprettet';

  @override
  String get channelSettingsWebhookCreateFailed => 'Kunne ikke oprette webhook';

  @override
  String get channelSettingsCreateWebhook => 'Opret webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Administrer invitationslinks for denne kanal.';

  @override
  String get channelSettingsInvitesCreate => 'Opret invitation';

  @override
  String get channelSettingsInvitesEmpty => 'Ingen invitationslinks';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Denne kanal har ingen invitationslinks endnu. Opret et for at invitere folk til kanalen.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Der opstod en fejl under indlæsning af invitationslinkene til denne kanal. Prøv igen.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Administrer indgående webhooks, der kan sende beskeder til denne kanal.';

  @override
  String get channelSettingsWebhooksEmpty => 'Ingen webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Der er ingen webhooks konfigureret for denne kanal. Opret en webhook for at give eksterne applikationer mulighed for at sende beskeder.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Denne kanal understøtter ikke webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Du skal bruge \"$permission\"-tilladelsen for at se og redigere webhooks for denne kanal.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Kunne ikke indlæse webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Der opstod en fejl under indlæsning af webhooks for denne kanal. Prøv igen.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Oprettet af $creator den $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Ukendt bruger';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Upload billede';

  @override
  String get channelSettingsWebhooksRemove => 'Fjern';

  @override
  String get channelSettingsWebhooksName => 'Navn';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhooks navn';

  @override
  String get channelSettingsWebhooksChannel => 'Kanal';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook-URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopiér webhook-URL';

  @override
  String get channelSettingsWebhooksDelete => 'Slet webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Kunne ikke slette denne webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Slet denne webhook? Kan ikke fortrydes.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Prøv igen om et øjeblik.';

  @override
  String get channelMenuOpenChat => 'Åbn chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplikér kanal';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Nulstil aftale om voksenindhold';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Slet dine beskeder i denne kanal?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Dette vil slette alle de beskeder, du nogensinde har sendt i denne kanal, permanent. Dette kan ikke fortrydes.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Slet mine beskeder';

  @override
  String get channelMenuDeletedYourMessages => 'Dine beskeder er slettet';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Kunne ikke slette dine beskeder';

  @override
  String get channelDetailsSystemMessage => 'Systembesked';

  @override
  String get channelDetailsTextChannel => 'Tekstkanal';

  @override
  String get channelDetailsVoiceChannel => 'Stemmekanal';

  @override
  String get channelDetailsCategory => 'Kategori';

  @override
  String get channelDetailsLinkChannel => 'Link kanal';

  @override
  String get channelDetailsGenericChannel => 'Kanal';

  @override
  String get channelDetailsMutedConversation => 'Samtale slået fra';

  @override
  String get channelDetailsUnmutedConversation => 'Samtale slået fra lydløs';

  @override
  String get channelDetailsMutedChannel => 'Kanal slået fra';

  @override
  String get channelDetailsUnmutedChannel => 'Kanalen er slået fra lydløs';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Notifikationsindstillinger opdateret';

  @override
  String get channelDetailsTabMembers => 'Medlemmer';

  @override
  String get channelDetailsTabPins => 'Fastgjorte beskeder';

  @override
  String get channelDetailsActionMute => 'Slå lyd fra';

  @override
  String get channelDetailsActionUnmute => 'Slå lyd til';

  @override
  String get channelDetailsActionSearch => 'Søg';

  @override
  String get channelDetailsActionMore => 'Mere';

  @override
  String get channelDetailsMembersEmptyTitle => 'Ingen medlemmer at vise';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Medlemmer vil dukke op her, når community-dataene er indlæst.';

  @override
  String get memberListPermissionDeniedTitle => 'Du kan ikke se medlemmerne';

  @override
  String get memberListPermissionDeniedBody =>
      'Du kan ikke se medlemmerne af denne kanal i dette fællesskab';

  @override
  String get memberListUnavailableTitle => 'Medlemsliste er ikke tilgængelig';

  @override
  String get memberListUnavailableBody =>
      'Medlemslister er midlertidigt utilgængelige i dette fællesskab';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'Filer kunne ikke indlæses';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Medlemmer med tilladelsen \"Fastgør beskeder\" kan fastgøre beskeder, så alle kan se dem.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Du kan fastgøre beskeder i denne samtale, så alle kan se dem.';

  @override
  String get channelDetailsPinsEndReached => 'Du har nået slutningen';

  @override
  String get channelHeaderOpenDetails => 'Åbn kanaloplysninger';

  @override
  String get channelHeaderPinnedMessages => 'Fastgjorte beskeder';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Fastgjorte beskeder, ulæste';

  @override
  String get channelHeaderMemberList => 'Medlemsliste';

  @override
  String get channelHeaderInbox => 'Indbakke';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Notifikationsindstillinger, slået fra';

  @override
  String get channelDetailsSearchTitle => 'Søg';

  @override
  String get channelDetailsSearchHint => 'Søg i beskeder';

  @override
  String get channelDetailsSearchFilterFrom => 'Fra';

  @override
  String get channelDetailsSearchFilterHas => 'Har';

  @override
  String get channelDetailsSearchFilterIn => 'I';

  @override
  String get channelDetailsSearchFilterMentions => 'Omtaler';

  @override
  String get channelDetailsSearchFilterMore => 'Mere';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktiv';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kanaler';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count brugere';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Bruger';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filtrer efter kanal';

  @override
  String get channelDetailsSearchChannelsHint => 'Søg kanaler';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Ingen kanaler fundet';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Fastgjort';

  @override
  String get channelDetailsSearchPinnedTrue => 'Kun fastgjorte';

  @override
  String get channelDetailsSearchPinnedFalse => 'Ekskluder fastgjorte';

  @override
  String get channelDetailsSearchClearFilter => 'Ryd';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Forfattertype';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Dato';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Datotilstand';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Vælg en dato';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link-værtsnavn';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Filnavn indeholder';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Filer-udvidelse';

  @override
  String get channelDetailsSearchContentPoll => 'Afstemning';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Beskeder med en afstemning';

  @override
  String get channelDetailsSearchContentForward => 'Videresend';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Videresendte beskeder';

  @override
  String get channelDetailsSearchFilterSort => 'Sortér';

  @override
  String get channelHeaderSearchFiltersTitle => 'Søg efter filtre';

  @override
  String get channelHeaderSearchRecentTitle => 'Seneste søgninger';

  @override
  String get channelHeaderSearchUsersTitle => 'Brugere';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanaler';

  @override
  String get channelHeaderSearchValuesTitle => 'Værdier';

  @override
  String get channelHeaderSearchDatesTitle => 'Datoer';

  @override
  String get channelHeaderSearchDefaultBadge => 'Standard';

  @override
  String get channelHeaderSearchClearHistory => 'Ryd';

  @override
  String get channelHeaderSearchFilterDescFrom => 'en bruger';

  @override
  String get channelHeaderSearchFilterDescMentions => 'en bruger';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, embed, billede, video, lyd, fil, sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'en dato eller et datointerval';

  @override
  String get channelHeaderSearchFilterDescOn => 'en dato eller et datointerval';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'en dato eller et datointerval';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'en dato eller et datointerval';

  @override
  String get channelHeaderSearchFilterDescIn => 'en kanal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'sandt eller falsk';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'bruger, bot eller webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'et værtsnavn, f.eks. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'del af et vedhæftet filnavn';

  @override
  String get channelHeaderSearchFilterDescFileType => 'en filtype, f.eks. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'tidsstempel eller relevans';

  @override
  String get channelHeaderSearchFilterDescOrder => 'stigende eller faldende';

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
  String get channelDetailsSearchFilterByUser => 'Filtrer efter bruger';

  @override
  String get channelDetailsSearchFilterByContent => 'Filtrer efter indhold';

  @override
  String get channelDetailsSearchSortBy => 'Sortér resultater efter';

  @override
  String get channelDetailsSearchIn => 'Søg i';

  @override
  String get channelDetailsSearchEmptyTitle => 'Søg i denne samtale';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Indtast tekst, en forfatter eller et indholdsfilter for at finde beskeder.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Beskeder indekseres';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Prøv igen om lidt, når søgningen er færdig med at indeksere dette omfang.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Ingen resultater';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Prøv andre søgetermer eller filtre.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

  @override
  String get channelDetailsMemberYou => 'Dig';

  @override
  String get channelDetailsSearchUsersHint => 'Søg brugere';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Skriv for at søge efter medlemmer';

  @override
  String get channelDetailsSearchUsersEmpty => 'Ingen brugere fundet';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Ingen brugere tilgængelige';

  @override
  String get channelDetailsDone => 'Udført';

  @override
  String get channelDetailsHasFilterPrompt => 'Vis beskeder, der indeholder:';

  @override
  String get channelDetailsRetry => 'Prøv igen';

  @override
  String get channelDetailsPinnedMessageTitle => 'Fastgjort besked';

  @override
  String get channelDetailsSearchResultTitle => 'Søgeresultat';

  @override
  String get channelDetailsJumpToMessage => 'Spring til besked';

  @override
  String get channelDetailsUnpinMessage => 'Fjern pin fra besked';

  @override
  String get channelDetailsCopyMessageLink => 'Kopiér meddelelseslink';

  @override
  String get channelDetailsCopyMessageId => 'Kopiér besked-id';

  @override
  String get channelDetailsMessageUnpinned => 'Besked frigjort';

  @override
  String get channelDetailsSearchScopeCurrentCommunity =>
      'Nuværende fællesskab';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Aktuel DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Alle fællesskaber';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Alle private beskeder';

  @override
  String get channelDetailsSearchScopeAllDms => 'Alle private beskeder';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Kun åbne DMs';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Åbne DMs';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Alle DM\'er + Fællesskaber';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Åbne DM\'er + Fællesskaber';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Søg kun i det aktuelle fællesskab';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Søg kun i denne direkte besked';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'På tværs af alle fællesskaber, du er medlem af';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Kun på tværs af alle de private chats, du nogensinde har været med i';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'I alle de private chats, du har været med i';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'På tværs af alle dine åbne DM\'er';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'På tværs af alle dine åbne DMs';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'På tværs af alle direkte beskeder, du nogensinde har været i + alle fællesskaber, du aktuelt er i';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'På tværs af alle åbne DMs + alle fællesskaber, du er medlem af';

  @override
  String get channelDetailsSearchSortNewest => 'Nyeste først';

  @override
  String get channelDetailsSearchSortOldest => 'Ældste først';

  @override
  String get channelDetailsSearchSortRelevance => 'Mest relevant';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Vis nyeste beskeder først';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Vis ældste beskeder først';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Vis de mest relevante beskeder først';

  @override
  String get channelDetailsSearchContentImage => 'Billedupload';

  @override
  String get channelDetailsSearchContentVideo => 'Videooverførsel';

  @override
  String get channelDetailsSearchContentAudio => 'Lydoverførsel';

  @override
  String get channelDetailsSearchContentFile => 'Filoverførsel';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Link-forhåndsvisning eller indlejring';

  @override
  String get channelDetailsSearchContentSticker => 'Mærkat';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Kun uploadede billedfiler';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Kun uploadede videofiler';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Kun uploadede lydfiler';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Alle vedhæftede filer';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Skrev URL i meddelelsesteksten';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Løste forhåndsvisninger og rich embeds, ikke uploads';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker vedhæftet beskeden';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count typer';
  }

  @override
  String get personalNotesTitle => 'Personlige noter';

  @override
  String get personalNotesSubtitle =>
      'Dit private rum til tanker og påmindelser';

  @override
  String groupDmWelcome(String displayName) {
    return 'Velkommen til $displayName. Tilføj venner for at få gang i gruppen.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Rediger gruppe';

  @override
  String get groupDmWelcomeAddFriends => 'Tilføj venner til gruppen';

  @override
  String get dmGroupInvites => 'Invitationer';

  @override
  String get groupDmEditTitle => 'Rediger gruppe';

  @override
  String get groupDmEditDetailsTooltip => 'Rediger gruppeoplysninger';

  @override
  String get groupDmGroupName => 'Gruppenavn';

  @override
  String get groupDmMyGroup => 'Min gruppe';

  @override
  String get groupDmGroupNameMaxLength =>
      'Gruppenavnet må ikke overstige 100 tegn';

  @override
  String get groupDmGroupIcon => 'Gruppeikon';

  @override
  String get groupDmUploadIcon => 'Upload ikon';

  @override
  String get groupDmChangeIcon => 'Skift ikon';

  @override
  String get groupDmRemoveIcon => 'Fjern ikon';

  @override
  String get groupDmUpdated => 'Gruppe opdateret';

  @override
  String get groupDmUpdateFailed => 'Kunne ikke opdatere gruppen. Prøv igen.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animerede ikoner understøttes ikke. Brug et statisk billede.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animerede ikoner understøttes ikke';

  @override
  String get groupDmIconFileTooLargeTitle => 'Ikonfilen er for stor';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Filen er for stor. Vælg en fil, der er mindre end $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Ikke-understøttet ikonformat';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Ikke-understøttet filtype.';

  @override
  String get groupDmCouldntProcessImage => 'Kunne ikke behandle billede';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Kunne ikke behandle det beskårede billede. Prøv igen.';

  @override
  String get groupDmInvalidImage => 'Ugyldigt billede';

  @override
  String get groupDmInvalidImageBody => 'Billedet er ugyldigt. Prøv et andet.';

  @override
  String get groupDmAddFriends => 'Tilføj';

  @override
  String get groupDmOrSendInvite => 'eller send en invitation til en ven:';

  @override
  String get groupDmGenerateInviteLink => 'Generér invitationslink';

  @override
  String get groupDmCreateInvite => 'Opret';

  @override
  String get groupDmInviteExpires24Hours =>
      'Din invitation udløber om 24 timer';

  @override
  String get groupDmAddFriendFailed =>
      'Kunne ikke tilføje denne ven til gruppen. Prøv venligst igen.';

  @override
  String get groupDmAddFailed => 'Kunne ikke føje til gruppe';

  @override
  String get groupDmGroupFull =>
      'Denne gruppe er fuld. Fjern en person, før du tilføjer flere.';

  @override
  String get groupDmRateLimited =>
      'Du er for hurtig. Vent et øjeblik, og prøv igen.';

  @override
  String get groupDmCreateInviteFailed => 'Kunne ikke oprette invitationslink';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Kunne ikke oprette et invitationslink. Prøv venligst igen.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Kunne ikke oprette et invitationlink. Prøv igen.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Du har ikke tilladelse til at oprette en invitation i denne kanal.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Dette community har nået sin grænse for invitationer.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Oprettelse af invitationer er midlertidigt deaktiveret for dette community.';

  @override
  String get groupDmCopyInviteFailed => 'Kunne ikke kopiere invitationslink';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Kun gruppeejeren kan administrere invitationer.';

  @override
  String get groupDmNoInvitesCreated => 'Ingen invitationer oprettet';

  @override
  String get groupDmLoadingInvites => 'Indlæser invitationer ...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Kunne ikke indlæse invitationer. Prøv igen.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Træk denne invitation tilbage? Kan ikke fortrydes.';

  @override
  String get groupDmInviteRevoked => 'Invitation tilbagekaldt';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Oprettet af $name. Udløber om $time.';
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
  String get composerOpenExpressionPicker => 'Åbn udtryksvælger';

  @override
  String get composerShowKeyboard => 'Vis tastatur';

  @override
  String get composerCloseAttachmentPanel => 'Luk vedhæftningsvælger';

  @override
  String get chatAttachmentPanelPhotos => 'Fotos';

  @override
  String get chatAttachmentPanelFiles => 'Filer';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Adgang til fotobibliotek nødvendig';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Tillad adgang til fotobiblioteket for at gennemse og vedhæfte seneste billeder og videoer.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Åbn indstillinger';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', sender';

  @override
  String get messageAccessibilityFailedSuffix => ', kunne ikke sendes';

  @override
  String get messageAccessibilityAttachmentSummary => 'en vedhæftning';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count vedhæftninger';
  }

  @override
  String get messageAccessibilityImageSummary => 'et billede';

  @override
  String get messageAccessibilityVideoSummary => 'en video';

  @override
  String get messageAccessibilityAudioSummary => 'en lydfil';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'klistermærke $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'fil $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'en vedhæftet spoiler';

  @override
  String get messageAccessibilityEmbedSummary => 'en indlejring';

  @override
  String get messageAccessibilityEmptySummary => 'en besked';

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
  String get userSettingsSearchPlaceholder => 'Søg i indstillinger...';

  @override
  String get userSettingsSearchFieldLabel => 'Søg i indstillinger';

  @override
  String get userSettingsSearchClear => 'Ryd søgning';

  @override
  String get userSettingsSearchNoResults => 'Ingen indstillinger fundet';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Sikkerhed og login';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Gavers';

  @override
  String get giftSettingsClaimAccountTitle => 'Gør krav på din konto';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Gør krav på din konto for at indløse eller administrere Plutonium-gavekoder.';

  @override
  String get giftSettingsRedeemTitle => 'Indløs en gave';

  @override
  String get giftSettingsRedeemDescription =>
      'Indtast en gavekode for at indløse Plutonium til din konto.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Indtast gavekode…';

  @override
  String get giftSettingsRedeemButton => 'Indløs';

  @override
  String get giftSettingsRedeemSuccess => 'Gave indløst. Nyd din Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Købte gaver';

  @override
  String get giftSettingsPurchasedDescription =>
      'Administrer dine købte Plutonium-gavekoder. Del gave-URL\'en med en speciel person, eller indløs den selv!';

  @override
  String get giftSettingsEmptyTitle => 'Ingen gaver endnu';

  @override
  String get giftSettingsEmptyDescription =>
      'Køb en Plutonium-gave fra Plutonium-fanen for at dele med venner.';

  @override
  String get giftSettingsGoToPlutonium => 'Gå til Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'Kunne ikke indlæse gaveoversigt';

  @override
  String get giftSettingsLoadFailedDescription => 'Prøv igen senere.';

  @override
  String get giftSettingsTryAgain => 'Prøv igen';

  @override
  String get giftSettingsGiftUrl => 'Gave-URL';

  @override
  String get giftSettingsCopy => 'Kopiér';

  @override
  String get giftSettingsCopied => 'Kopieret';

  @override
  String get giftSettingsGiftUrlCopied =>
      'Gave-URL kopieret til udklipsholder!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Kunne ikke kopiere gave-URL';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Købt $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Indløst $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Indløst af $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Denne gave er blevet indløst';

  @override
  String get giftSettingsRedeemForYourself => 'Indløs til dig selv';

  @override
  String get giftSettingsShareWithFriend => 'Del med en ven';

  @override
  String get premiumPlutoniumTagline =>
      'Lås op for højere grænser og eksklusive funktioner, og støt samtidig en uafhængig kommunikationsplatform.';

  @override
  String get premiumPurchaseMode => 'Købstilstand';

  @override
  String get premiumForMe => 'Til mig';

  @override
  String get premiumAsAGift => 'Som gave';

  @override
  String get premiumMonthly => 'Månedligt';

  @override
  String get premiumYearly => 'Årligt';

  @override
  String get premiumPerMonth => 'pr. måned';

  @override
  String get premiumPerYear => 'pr. år';

  @override
  String get premiumOneTimePurchase => 'engangskøb';

  @override
  String get premiumSave17 => 'Spar 17 %';

  @override
  String get premiumUpgradeNow => 'Opgrader nu';

  @override
  String get premiumBuyGift => 'Køb gave';

  @override
  String get premiumOneYearGift => '1 års gave';

  @override
  String get premiumOneMonthGift => '1 måneds gave';

  @override
  String get premiumMostPopular => 'Mest populær';

  @override
  String get premiumScrollPrompt =>
      'Rul ned for at se alle fordelene ved Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Gratis vs Plutonium';

  @override
  String get premiumFreeColumn => 'Gratis';

  @override
  String get premiumGiftSectionTitle => 'Giv Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Giv dine venner Plutonium-oplevelsen ved at købe et gaveabonnement.';

  @override
  String get premiumGiftBannerOne =>
      'Du har en ny gavekode, der venter på dig!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Du har $count nye gavekoder, der venter på dig!';
  }

  @override
  String get premiumViewGifts => 'Se gaver';

  @override
  String get premiumReadyToUpgrade => 'Klar til at opgradere?';

  @override
  String get premiumReadyToBuyGift => 'Klar til at købe en gave?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Månedligt $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Årligt $price';
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
  String get premiumRedeemGiftCode => 'Indløs gavekode';

  @override
  String get premiumGiftBadge => 'Gave';

  @override
  String get premiumCancelSubscriptionTitle => 'Annuller abonnement?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Du beholder dine fordele indtil din næste fornyelsesdato og har derefter en respitperiode på 3 dage til at genabonnere og bevare din abonnementshistorik.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Annuller abonnement';

  @override
  String get premiumKeepSubscription => 'Behold abonnement';

  @override
  String get premiumPurchaseHistoryTitle => 'Købshistorik';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Dine seneste fakturaer. For at ændre betalingsmetoden for dit abonnement, skal du tilføje eller vælge en i faktureringsportalen og gøre den til standard.';

  @override
  String get premiumManagePaymentMethods => 'Administrer betalingsmetoder';

  @override
  String get premiumBillingHistory => 'Faktureringshistorik';

  @override
  String get premiumSelfServeRefundTitle => 'Selvbetjent refusion';

  @override
  String get premiumSelfServeRefundButton => 'Tilbagebetal seneste køb';

  @override
  String get premiumDisclaimerAgreementPrefix => 'Ved køb accepterer du vores ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Ved køb accepterede du vores ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' og ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktiv indtil $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Annullerer';

  @override
  String premiumCancelsOn(String date) {
    return 'Opsiges den $date. Fordele forbliver aktive indtil da.';
  }

  @override
  String get premiumReactivateSubscription => 'Genaktiver';

  @override
  String premiumGiftedUntil(String date) {
    return 'Givet indtil $date. Fornyes ikke automatisk.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Funktion';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Ved køb accepterer du vores $terms og $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Selvbetjent refusion er tilgængelig inden for 3 dage efter betaling, én gang hver 30. dag. Refusion af et abonnement annullerer det. Købere fra EU/EØS frasiger sig den 14-dages fortrydelsesret ved kassen for at få øjeblikkelig adgang til indhold. Brug refusionsknappen i appen i stedet for en tilbageførsel. Tilbageførsler kan permanent begrænse din konto. Stripe håndterer betaling sikkert. Vi ser aldrig dit fulde kortnummer.';

  @override
  String get premiumTermsOfService => 'Servicevilkår';

  @override
  String get premiumPrivacyPolicy => 'Fortrolighedspolitik';

  @override
  String get premiumCheckoutStartFailedTitle => 'Kunne ikke starte betaling';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Der opstod en fejl under start af betaling. Prøv venligst igen om et øjeblik.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Du har i øjeblikket et gaveabonnement. Det fornys ikke automatisk. Du kan indløse flere gavekoder for at forlænge det. Du kan starte et tilbagevendende abonnement, når din gaveperiode udløber.';

  @override
  String get premiumPlanUnavailable =>
      'Denne plan er ikke tilgængelig. Kontakt support.';

  @override
  String get premiumCompletePaymentTitle => 'Gennemfør betaling';

  @override
  String get premiumCompletePaymentBody =>
      'Du navigerer nu til Stripe for at gennemføre betalingen. Vend tilbage til Fluxer, når du er færdig.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Vælg betalingsmetode';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Betal med Pix automático for at godkende tilbagevendende betalinger direkte fra din brasilianske bank. Eller vælg brug kort for at indtaste et kreditkort på Stripes næste skærm.';

  @override
  String get premiumUsePix => 'Brug Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Betal med UPI for at opsætte en RBI-kompatibel e-mandat fra din indiske bank. Eller vælg brug kort for at indtaste et kreditkort på Stripes næste skærm.';

  @override
  String get premiumUseUpi => 'Brug UPI';

  @override
  String get premiumUseCard => 'Brug kort';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Kunne ikke åbne faktureringsportalen';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Der opstod en fejl under åbning af faktureringsportalen. Prøv venligst igen om et øjeblik.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Du er allerede Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary inkluderer allerede permanent adgang, så et tilbagevendende abonnement er ikke nødvendigt. Du kan stadig købe gaver til andre.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abonnementet findes allerede';

  @override
  String get premiumExistingSubscriptionBody =>
      'Vi fandt et eksisterende Fluxer Plutonium-abonnement til denne konto. Administrer det i den sikre faktureringsportal for at opdatere betalingsoplysninger eller kontrollere fornyelsesstatus. Hvis du lige har betalt, skal du vente et minut og genåbne denne side.';

  @override
  String get premiumPurchasesDisabledTitle => 'Køb er ikke tilgængelige';

  @override
  String get premiumPurchasesDisabledBody =>
      'Køb er deaktiveret for denne konto. Kontakt support@fluxer.app, hvis dette ser forkert ud.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Gør krav på din konto for at købe Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Du skal bekræfte din e-mail, før du kan købe Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Brugerdefineret brugernavn';

  @override
  String get premiumPerkPerCommunityProfiles => 'Profiler pr. fællesskab';

  @override
  String get premiumPerkMessageScheduling => 'Planlægning af beskeder';

  @override
  String get premiumPerkProfileBadge => 'Profilbadge';

  @override
  String get premiumPerkCustomVideoBackgrounds =>
      'Brugerdefinerede video-baggrunde';

  @override
  String get premiumPerkEntranceSounds => 'Lyd ved indgang';

  @override
  String get premiumPerkCommunities => 'Fællesskaber';

  @override
  String get premiumPerkMessageCharacterLimit => 'Tegnbegrænsning for beskeder';

  @override
  String get premiumPerkBookmarkedMessages => 'Bogmærkede beskeder';

  @override
  String get premiumPerkFileUploadSize => 'Filoverførselsstørrelse';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji- og sticker-pakker';

  @override
  String get premiumPerkSavedMedia => 'Gemte medier';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Brug animerede emojis';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Adgang til emojis og stickers globalt';

  @override
  String get premiumPerkVideoQuality => 'Videokvalitet';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animerede avatarer og profilbannere';

  @override
  String get premiumPerkEarlyAccess => 'Tidlig adgang til nye funktioner';

  @override
  String get premiumPerkCustomThemes => 'Brugerdefinerede temaer';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Op til 4K/60 fps';

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
  String get userSettingsNavShortcuts => 'Genveje';

  @override
  String get audioAndVideoAudioSectionTitle => 'Lyd';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Konfigurer din mikrofon, højttalere og stemmebehandling.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Indstil kvaliteten for dit kamera og skærmdeling.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'Adfærd under opkald';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Styr bekræftelsesprompter under tale- og videoopkald.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Inputenhed';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Udenhed';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Standard';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Brug højttaler';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Når den er slået fra, afspilles lyd via ørestykket eller tilsluttede hovedtelefoner.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Indgangslydstyrke';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Lydstyrke for output';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Stemmebehandling';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Fokuseret stemme';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Anbefales. Renser din mikrofon for klar tale.';

  @override
  String get audioAndVideoDirectInputLabel => 'Direkte input';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Sender din lyd uændret. Bedst, hvis du bruger ekstern lydsoftware.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Brugerdefineret';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Juster hver indstilling selv: støjdæmpning, ekkoreducering og forstærkning.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Støjreduktion';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Forbedret';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Ingen';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Annullering af ekko';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatisk forstærkningskontrol';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Udglatter din mikrofonvolumen. Slået fra, når forbedret undertrykkelse er slået til.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mikrofontest';

  @override
  String get audioAndVideoMicTestStartLabel => 'Start mikrofontest';

  @override
  String get audioAndVideoMicTestStopLabel => 'Stop mikrofontest';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName skal bruge adgang til mikrofonen for at teste din lyd.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Spejl kamera';

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
      'Kvalitet af skærmdeling';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Billedhastighed';

  @override
  String get audioAndVideoFrameRate15Label => '15 billeder/sek';

  @override
  String get audioAndVideoFrameRate30Label => '30 billeder/sek';

  @override
  String get audioAndVideoFrameRate60Label => '60 billeder/sek';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p og 60 FPS kræver $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Denne instans tillader i øjeblikket skærmdeling op til 720p ved 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName skal have adgang til mikrofonen for at vise dine enheder.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName skal have adgang til kameraet for at vise dine enheder.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Spørg ikke, når jeg skjuler mit kamera';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Spørg ikke, når jeg skjuler min skærmdeling';

  @override
  String get userSettingsNavNotifications => 'Notifikationer';

  @override
  String get notificationsGeneralSectionTitle => 'Generelt';

  @override
  String get notificationsEnableNotificationsLabel => 'Slå notifikationer til';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Få notifikationer, når du modtager beskeder. Du skal muligvis tillade notifikationer for $productName i dine enhedsindstillinger. For kontrol pr. kanal/pr. fællesskab skal du åbne notifikationsindstillingerne fra et fællesskabs menu.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Slå notifikationer til på computeren';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Bruger OS\'ens notifikationscenter. For notifikationsindstillinger pr. kanal/fællesskab skal du højreklikke på et fællesskabsikon og åbne notifikationsindstillingerne.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Slå browsernotifikationer til';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Få besked, når du modtager beskeder. Du skal muligvis tillade notifikationer i dine browserindstillinger. For at styre notifikationer for specifikke kanaler/fællesskaber skal du højreklikke på et fællesskabsikon og åbne notifikationsindstillingerne.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Inaktivitetstimeout for push-notifikationer';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName forhindrer, at der sendes push-notifikationer til dine mobilenheder, når du er ved din computer. Vælg hvor længe du skal være inaktiv på din computer, før du modtager push-notifikationer.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minut';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minutter';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Indstillinger for omtale';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Indstillinger for omtale i svar';

  @override
  String get notificationsMentionNoPreferenceName => 'Ingen præference';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respekter afsenderens hensigt, uden advarsel når de slår @-omtaler til/fra';

  @override
  String get notificationsMentionPreferMentionName => 'Foretræk omtale';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Standard svarer på @omtaler dig og advarer afsenderen, hvis de deaktiverer det';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Foretræk ingen @omtaler';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Svar udelader som standard @omtaler og advarer afsenderen, hvis de aktiverer det';

  @override
  String get notificationsTtsSectionTitle => 'Tekst-til-tale-notifikationer';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Slå /tts taleafspilning til';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Lad /tts læse din besked højt. Hvis du deaktiverer indstillingen, forbliver disse kommandoer som almindelig tekst.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Juster afspilningshastighed i ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Tilgængelighed';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatisk oplæsning af beskeder';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Konverterer indgående indhold til tale, uanset om det kom fra /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Alle kanaler';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Få alle indgående beskeder læst op, uanset hvilken kanal der er åben.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Kun aktiv kanal';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Oplæser kun den kanal, du ser. Oplæsningen følger dig mellem kanaler.';

  @override
  String get notificationsTtsModeNeverName => 'Aldrig automatisk';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Forbliv lydløs, medmindre nogen manuelt kører /tts.';

  @override
  String get notificationsTtsModeAriaLabel => 'Læs alle beskeder højt';

  @override
  String get notificationsSoundsSectionTitle => 'Lyde';

  @override
  String get notificationsMasterVolumeLabel => 'Overordnet lydstyrke';

  @override
  String get notificationsMasterVolumeDescription =>
      'Indstiller niveauet for alle lydeffekter. Individuelle lydindstillinger tilsidesætter dette.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Nulstil til standardlydstyrke';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Slå alle notifikationslyde fra';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Dine eksisterende notifikationslydindstillinger bevares.';

  @override
  String get notificationsShowMoreSoundEffects => 'Vis flere lydeffekter';

  @override
  String get notificationsShowFewerSoundEffects => 'Vis færre lydeffekter';

  @override
  String get notificationsPreviewSound => 'Afspil lyd';

  @override
  String get notificationsPerSoundVolumeTitle => 'Lydstyrke pr. lyd';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Indstil individuelle lydstyrker for hver lyd. Lyde uden en tilpasset indstilling følger den overordnede lydstyrke.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktive brugerdefinerede lydstyrkeindstillinger: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Følger master • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Nulstil $label til hovedlydstyrke';
  }

  @override
  String get notificationsResetAllOverrides => 'Nulstil alle tilsidesættelser';

  @override
  String notificationsMuteSound(String label) {
    return 'Slå lyden fra for $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Slå lyden til for $label';
  }

  @override
  String get notificationsSoundMessage =>
      'Notifikationer for fællesskabsbeskeder';

  @override
  String get notificationsSoundDirectMessage =>
      'Notifikationer for direkte beskeder';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Notifikationer for beskeder i nuværende kanal';

  @override
  String get notificationsSoundMute => 'Slå stemme fra';

  @override
  String get notificationsSoundUnmute => 'Slå lyd til';

  @override
  String get notificationsSoundDeaf => 'Slå lyd fra (stemme)';

  @override
  String get notificationsSoundUndeaf => 'Ikke-døvstemt stemme';

  @override
  String get notificationsSoundUserJoin => 'Bruger tilslutter sig kanal';

  @override
  String get notificationsSoundUserLeave => 'Bruger forlader kanal';

  @override
  String get notificationsSoundUserMove => 'Bruger flyttede kanal';

  @override
  String get notificationsSoundViewerJoin => 'Seer tilslutter sig stream';

  @override
  String get notificationsSoundViewerLeave => 'Seer forlader stream';

  @override
  String get notificationsSoundVoiceDisconnect => 'Stemme afbrudt';

  @override
  String get notificationsSoundIncomingRing => 'Indgående opkald';

  @override
  String get notificationsSoundCameraOn => 'Kamera til';

  @override
  String get notificationsSoundCameraOff => 'Kamera fra';

  @override
  String get notificationsSoundScreenShareStart => 'Skærmdeling starter';

  @override
  String get notificationsSoundScreenShareStop => 'Skærmdeling stoppet';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Kunne ikke opdatere push-notifikationers timeout. Prøv igen.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Kunne ikke opdatere præference for omtale. Prøv igen.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notifikationer blokeret';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Kunne ikke aktivere notifikationer. Tillad notifikationstilladelse for at fortsætte.';

  @override
  String get userSettingsNavLanguageAndTime => 'Sprog og tid';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Brugergrænsefladesprog';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Vælg det sprog, der bruges i hele appen';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Åbn sprogindstillinger';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Tidsformat';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Vælg, hvordan klokkeslæt vises i appen';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Valg af tidsformat';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automatisk';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-timers';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-timers';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Appsprog: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Systemsprog: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Brug systemets sprogindstillinger til tidsformat';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Kunne ikke opdatere tidsformat';

  @override
  String get userSettingsNavDefaultApps => 'Standardapps';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Webbrowser';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Vælg hvilken browser der åbnes, når du trykker på et link.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Hvis en app er installeret til et websted, åbnes links i den app først.';

  @override
  String get defaultAppsWebBrowserInApp => 'Browser i appen';

  @override
  String get defaultAppsWebBrowserExternal => 'Ekstern browser';

  @override
  String get userSettingsNavAdvanced => 'Avanceret';

  @override
  String get advancedPerformanceReportingTitle => 'Ydelsesrapportering';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Hjælp med at forbedre $productName ved at dele anonyme data om nedbrud og ydeevne.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Send rapporter om nedbrud og ydeevne';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Alle rapporterede data er anonyme og sendes kun til $productName egen overvågningstjeneste — der bruges ingen tredjepartsudbydere.';
  }

  @override
  String get advancedSettingsConfigure => 'Konfigurer';

  @override
  String get advancedSettingsCategoryPrivacy => 'Anonymitet';

  @override
  String get advancedSettingsCategoryAppearance => 'Udseende';

  @override
  String get advancedSettingsCategoryAccessibility => 'Tilgængelighed';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Medier';

  @override
  String get advancedSettingsCategoryVoice => 'Stemme';

  @override
  String get advancedSettingsCategoryDeveloper => 'Udvikler';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'Slå tekstvalg til';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Tillad at vælge tekst i appen';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Aktiver miniaturebilleder til videosekvenser';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatur eller livebillede, mens videoen afspilles';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptisk feedback';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibrationsfeedback til tryk og handlinger. Synkroniseres ikke på tværs af enheder.';

  @override
  String get advancedSettingShowNekoLabel => 'Vis Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko-kat, der jager din markør';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Vis Neko på din chat-input';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Zoomanimation ved start';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Zoom ud på logoet, når du forlader startskærmen';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Tastaturtips';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Vis genvejstips i værktøjstips';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Slå favoritter til';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Vis favoritter i hele appen';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Adfærd ved deltagelse i stemmekanal';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Bekræftelse eller dobbeltklik ved deltagelse i fællesskabets talechat';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Kræv dobbeltklik for at deltage i stemmekanaler';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Bekræft, før du deltager i stemmekanaler';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Send GIF\'er automatisk, når de er valgt';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Send automatisk GIF\'er fra vælgeren uden bekræftelse';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Gem GIF-favoritter som gemte medier';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Vælg, hvordan dine foretrukne GIF\'er gemmes';

  @override
  String get advancedSettingMediaButtonsLabel => 'Medieknapper';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Tilpas, hvilke knapper og indikatorer der vises på mediefiler og indlejringer';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Upload vedhæftede filer før afsendelse';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Begynd at uploade vedhæftede filer, så snart de er tilføjet i beskedfeltet';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Fjern sporingsparametre fra webadresser';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Fjern automatisk sporingsparametre fra webadresser i beskeder, du sender';

  @override
  String get advancedSettingTrustAllLinksLabel => 'Stol på alle eksterne links';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Spring advarsel om eksternt link over for alle domæner';

  @override
  String get advancedSettingSearchEnginesLabel => 'Søgemaskiner';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Konfigurer søgemaskiner, der bruges til at søge i valgt tekst';

  @override
  String get advancedSettingTranslatorsLabel => 'Oversættere';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Konfigurer oversættelsesudbydere, der bruges til udvalgt tekst';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Søg billede omvendt';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Udbydere af omvendt billedsøgning';

  @override
  String get advancedSettingMessageActionBarLabel =>
      'Handlingslinje for beskeder';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Tilpas den handlingslinje, der vises, når du holder musen over beskeder';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Autofuldførelse af udtryk';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Vælg hvad der vises, når du skriver et kolon i beskedfeltet';

  @override
  String get advancedSettingInputButtonsLabel => 'Beskedinputknapper';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Vælg hvilke knapper der skal vises i beskedfeltet';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Rul til bunden, når du sender en besked';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Vælg hvordan samtalen skal fortsætte efter du har sendt en besked';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Spring \"Markér alle som læst\"-bekræftelse over';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Markér alle ulæste indbakkekanaler som læst med det samme, uden at spørge om bekræftelse';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Skjul lydløse kanaler som standard';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Skjul kanaler, du har slået lyden fra, fra fællesskabets sidepaneler';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Vis GIF-indikator';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Vis indikator for udløb af vedhæftet fil';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Vis slet-knap';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Vis download-knap';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Vis favoritknap';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Vis knap til at skjule indlejringer';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Vis handlingslinje for beskeder';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'Vis kun mere-knap';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Vis hurtige reaktioner';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Aktiver Skift for at udvide';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Vis standard-emojis i forslag til emojis';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Vis tilpassede emojis i forslag til autoudfyldelse';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Vis stickers i forslag til udtryk';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Vis gemte medier i forslag til udtryk';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Vis GIF-knap';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Vis medieknap';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Vis knap til stickers';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Vis emoji-knap';

  @override
  String get advancedSettingShowSendButtonLabel => 'Vis send-knap';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Vis notifikationer om nye enheder';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Vis prompt for nye lydenheder';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Forbindelsesvolumenkontrol';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Vis lydstyrkeskyderen for deltagere pr. enhed i stemmemenuer';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Adfærd for skærmdeling (forhåndsvisning)';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Forhåndsvisning, popout og opførsel for stream-miniaturer';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Codec til skærmdeling';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Videokodek til skærmdeling';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatisk (anbefales)';

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
      'Sæt forhåndsvisning af skærmdeling på pause i baggrunden';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Skjul miniature for forhåndsvisning af min stream';

  @override
  String get advancedSettingDeveloperModeLabel => 'Slå udviklertilstand til';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Slå udviklertilstand til';

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
  String get advancedSettingTranslatorGoogle => 'Google Oversæt';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Standard søgemaskine';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Vælg, hvilken søgemaskine der skal bruges som standard, når du søger efter markeret tekst.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Indbyggede søgemaskiner';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Slå indbyggede søgemaskiner til eller fra. Aktiverede søgemaskiner vises i meddelelsens kontekstmenu, når tekst er valgt.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Tilpassede søgemaskiner';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Tilføj dine egne søgemaskiner med et brugerdefineret URL-mønster. Brug \'$query\' som pladsholder for søgeteksten.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Tilføj søgemaskine';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Aktiver mindst én søgemaskine herunder.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Fjern søgemaskine';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Standardoversætter';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Vælg, hvilken oversætter der skal bruges som standard, når du oversætter markeret tekst.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Indbyggede oversættere';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Slå indbyggede oversættere til eller fra. Aktiverede oversættere vises i meddelelsens kontekstmenu, når tekst er valgt.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Tilpassede oversættere';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Tilføj dine egne oversættere med et brugerdefineret URL-mønster. Brug \'$query\' som pladsholder for den tekst, der skal oversættes.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Tilføj oversætter';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Aktiver mindst én oversætter herunder.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Fjern oversætter';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Standard omvendt billedsøgning';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Vælg, hvilken tjeneste til omvendt billedsøgning der skal bruges som standard, når du søger efter et billede.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Indbygget omvendt billedsøgning';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Slå indbyggede udbydere af omvendt billedsøgning til eller fra. Aktiverede udbydere vises i kontekstmenuen for billeder, avatarer, bannere, stickers og emojis.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Tilpasset omvendt billedsøgning';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Tilføj dine egne udbydere af omvendt billedsøgning med et brugerdefineret URL-mønster. Brug \'$url\' som pladsholder for billedets URL.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Tilføj omvendt billedsøgning';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Aktivér mindst én udbyder af omvendt billedsøgning herunder.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Fjern omvendt billedsøgning';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Tilføj søgemaskine';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Rediger søgemaskine';

  @override
  String get advancedSettingAddTranslatorTitle => 'Tilføj oversættelsesudbyder';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Rediger oversættelsesudbyder';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Tilføj søgemaskine til omvendt billedsøgning';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Rediger søgemaskine til omvendt billedsøgning';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Navn';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL-mønster';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Min søgemaskine';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Min oversætter';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Min omvendte billedsøgning';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Brug \'$query\' hvor søgeteksten skal indsættes.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Brug \'$query\' hvor teksten, der skal oversættes, skal indsættes.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Brug \'$url\' hvor billedets URL skal indsættes.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Navn er påkrævet.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'URL-mønster er påkrævet.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL-mønsteret skal indeholde pladsholderen \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL-mønsteret skal indeholde pladsholderen \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL-mønsteret skal være en gyldig URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Tilføj';

  @override
  String get advancedSettingEditSearchProviderAction => 'Rediger';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Fjern';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Er du sikker på, at du vil fjerne $engineName?';
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
  String get userSettingsJoinFluxerLabs => 'Deltag i Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'App-licenser';

  @override
  String get userSettingsAppLicensesDescription =>
      'Open source-software, der bruges af denne app. Denne app er bygget med Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Kunne ikke indlæse app-licenser.';

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
  String get savedMessagesEmptyTitle => 'Ingen bogmærker';

  @override
  String get savedMessagesEmptyBody =>
      'Bogmærk beskeder for at gemme dem til senere.';

  @override
  String get savedMessagesEndBody => 'Der er ikke mere at se her.';

  @override
  String get savedMessagesRemoveTooltip => 'Fjern bogmærke';

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
  String get uiSearch => 'Søg';

  @override
  String get uiStartCall => 'Start opkald';

  @override
  String get uiStartVideoCall => 'Start videoopkald';

  @override
  String get uiPlay => 'Afspil';

  @override
  String get uiPause => 'Sæt på pause';

  @override
  String get uiDownload => 'Download';

  @override
  String get uiMoreActions => 'Flere handlinger';

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
    return 'Dette vil give besked til $count medlemmer med rollen $roleName. Fortsæt?';
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
  String get guildNavbarGuildSelected => 'valgt';

  @override
  String get guildNavbarGuildUnread => 'ulæst';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count omtaler',
      one: '1 omtale',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'slået lyd fra';

  @override
  String get authShowPassword => 'Vis adgangskode';

  @override
  String get authHidePassword => 'Skjul adgangskode';

  @override
  String get chatLoadingMessages => 'Indlæser beskeder';

  @override
  String get friendsMessageFriend => 'Besked';

  @override
  String get friendsFriendActions => 'Vennehandlinger';

  @override
  String get friendsAcceptRequest => 'Accepter venneanmodning';

  @override
  String get friendsDeclineRequest => 'Afvis venneanmodning';

  @override
  String get friendsCancelRequest => 'Annuller venneanmodning';

  @override
  String get friendsOpenInbox => 'Indbakke';

  @override
  String get profileRemoveFriend => 'Fjern ven';

  @override
  String get profileUnblockUser => 'Fjern blokering af bruger';

  @override
  String get profileAcceptFriendRequest => 'Accepter venneanmodning';

  @override
  String get profileCancelFriendRequest => 'Annuller venneanmodning';

  @override
  String get profileSendFriendRequest => 'Tilføj ven';

  @override
  String get accountOverflowMenu => 'Kontoindstillinger';

  @override
  String get navHome => 'Hjem';

  @override
  String get navNotifications => 'Notifikationer';

  @override
  String get navYou => 'Dig';

  @override
  String get guildFolderSettingsTitle => 'Mappeindstillinger';

  @override
  String get guildFolderNameLabel => 'Mappenavn';

  @override
  String get guildFolderColorLabel => 'Mappefarve';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Vis ikon, når mappen er skjult';

  @override
  String get guildFolderIconLabel => 'Mappeikon';

  @override
  String get guildFolderDelete => 'Slet mappe';

  @override
  String get guildFolderIconFolder => 'Mappe';

  @override
  String get guildFolderIconStar => 'Stjerne';

  @override
  String get guildFolderIconHeart => 'Hjerte';

  @override
  String get guildFolderIconBookmark => 'Bogmærke';

  @override
  String get guildFolderIconGameController => 'Spilcontroller';

  @override
  String get guildFolderIconShield => 'Skjold';

  @override
  String get guildFolderIconMusicNote => 'Musiknote';

  @override
  String get guildFolderMarkAsRead => 'Markér mappe som læst';

  @override
  String get guildBulkMuteCommunities =>
      'Slå notifikationer fra for fællesskaber';

  @override
  String get guildBulkUnmuteCommunities => 'Slå lyd til for fællesskaber';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Notifikationsindstillinger for fællesskabet';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Indstillinger for fællesskabets anonymitet';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Tillad @everyone og @here';

  @override
  String get guildBulkAllowRoleMentions => 'Tillad rolletags';

  @override
  String get guildBulkEnableMobilePush => 'Slå mobilnotifikationer til';

  @override
  String get guildBulkDisableMobilePush => 'Deaktiver mobilnotifikationer';

  @override
  String get guildBulkAllowDirectMessages => 'Tillad direkte beskeder';

  @override
  String get guildBulkBlockDirectMessages => 'Bloker direkte beskeder';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Tillad direkte beskeder fra bot';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Bloker direkte beskeder fra bots';

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
  String get guildNavbarChannelTypeSelection => 'Vælg kanaltype';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Kun tilgængelig for $productName-personale';
  }

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
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Klistermærker';

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
  String get guildMenuSettingsInviteLinks => 'Invitationer';

  @override
  String get guildMenuSettingsBans => 'Bans';

  @override
  String get guildMenuSettingsChannels => 'Kanaler';

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
  String get guildSettingsRolesNewRole => 'Ny rolle';

  @override
  String get guildSettingsRolesDeleteRole => 'Slet rolle';

  @override
  String get guildSettingsRolesBackToRoles => 'Tilbage til roller';

  @override
  String get guildSettingsBackToSettings => 'Tilbage til indstillinger';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Rediger \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Konfigurer rolleindstillinger og tilladelser';

  @override
  String get guildSettingsRolesDisplaySection => 'Vis';

  @override
  String get guildSettingsRolesRoleName => 'Rollenavn';

  @override
  String get guildSettingsRolesRoleColor => 'Rollefarve';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Skriv en farve (hex, rgb(), hsl() eller navn), eller brug farvevælgeren.';

  @override
  String get guildSettingsRolesShowSeparately => 'Vis denne rolle separat';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Viser medlemmer med denne rolle i deres egen sektion på medlemslisten.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Tillad omtaler for denne rolle';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Medlemmer med tilladelsen \"$permission\" kan altid nævne roller, uanset denne indstilling.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Brug denne knap til hurtigt at rydde alle tilladelser.';

  @override
  String get guildSettingsRolesClearPermissions => 'Ryd tilladelser';

  @override
  String get guildSettingsRolesPermissionsSection => 'Tilladelser';

  @override
  String get guildSettingsRolesSearchPermissions => 'Søg tilladelser';

  @override
  String get guildSettingsRolesDenseLayout => 'Kompakt layout';

  @override
  String get guildSettingsRolesComfyLayout => 'Behageligt layout';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Skift til kompakt visning';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Skift til kompakt layout';

  @override
  String get guildSettingsRolesSingleColumn => 'Enkelt kolonne';

  @override
  String get guildSettingsRolesTwoColumns => 'To kolonner';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Skift til enkelt kolonne';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Skift til to kolonner';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Ingen tilladelser fundet';

  @override
  String get guildSettingsRolesCustomHoistOrder =>
      'Brugerdefineret rækkefølge for fremhævelse';

  @override
  String get guildSettingsRolesHoistOrder => 'Visningsrækkefølge';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Nulstil til standard';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Træk roller for at tilpasse den rækkefølge, de vises i på medlemslisten.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Ingen fremhævede roller. Aktivér \"Vis denne rolle separat\" for en rolle for at se den her.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Du kan ikke redigere denne rolle, da det er din højeste rolle eller over dig';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Du skal have \"$permission\"-tilladelsen for at redigere disse tilladelser';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Du kan ikke redigere en rolle, der er på niveau med eller over din højeste rolle';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Du kan ikke give en tilladelse, du ikke selv har';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Du kan ikke fjerne denne tilladelse, da du ville fjerne den fra dig selv';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Roller opdateret';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rolle oprettet';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rolle slettet';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Rækkefølgen for fremhævelse er nulstillet til standard';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Rollenavn er påkrævet';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Giv rollen et navn, før du gemmer.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Kunne ikke oprette rolle';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Kunne ikke opdatere roller';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Kunne ikke slette rolle';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" kunne ikke slettes. Prøv igen.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Kunne ikke nulstille rækkefølgen for fremhævelse';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Prøv igen om et øjeblik.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Er du sikker på, at du vil slette rollen $name? Medlemmer med denne rolle vil ikke længere have den.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Hele fællesskabet';

  @override
  String get permissionCategoryMessagesMedia => 'Beskeder og medier';

  @override
  String get permissionCategoryModeration => 'Moderat';

  @override
  String get permissionCategoryChannelAccess => 'Kanaladgang';

  @override
  String get permissionCategoryChannelManagement => 'Kanaladministration';

  @override
  String get permissionCategoryAudioVideo => 'Lyd og video';

  @override
  String get permissionUnknown => 'Ukendt tilladelse';

  @override
  String get permissionAdministrator => 'Administrator';

  @override
  String get permissionAdministratorDescription =>
      'Giver alle tilladelser og omgår kanalbegrænsninger. Meget følsomt.';

  @override
  String get permissionViewActivityLog => 'Se aktivitetslog';

  @override
  String get permissionViewActivityLogDescription =>
      'Læs fællesskabets aktivitetslog over ændringer og moderation.';

  @override
  String get permissionManageCommunity => 'Administrer fællesskab';

  @override
  String get permissionManageCommunityDescription =>
      'Rediger globale indstillinger som navn, beskrivelse og ikon.';

  @override
  String get permissionManageRoles => 'Administrer roller';

  @override
  String get permissionManageRolesDescription =>
      'Opret, rediger eller slet roller under din højeste rolle. Giver også mulighed for at redigere tilsidesættelser af kanaltilladelser.';

  @override
  String get permissionManageChannels => 'Administrer kanaler';

  @override
  String get permissionManageChannel => 'Administrer kanal';

  @override
  String get permissionManageChannelDescription =>
      'Omdøb og rediger indstillingerne for denne kanal.';

  @override
  String get permissionManagePermissions => 'Administrer tilladelser';

  @override
  String get permissionManagePermissionsDescription =>
      'Rediger tilsidesættelser for roller og medlemmer i denne kanal.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Opret, rediger eller slet webhooks for denne kanal.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Se medlemslisten for denne kanal.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Administrer invitationslinks for denne kanal.';

  @override
  String get permissionOverwriteDeny => 'Afvis';

  @override
  String get permissionOverwriteInherit => 'Neutral (nedarvet)';

  @override
  String get permissionOverwriteAllow => 'Tillad';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Brug disse knapper til hurtigt at indstille alle tilladelser.';

  @override
  String get permissionManageChannelsDescription =>
      'Opret, rediger eller slet kanaler og kategorier.';

  @override
  String get permissionKickMembers => 'Smide medlemmer ud';

  @override
  String get permissionBanMembers => 'Bandlys medlemmer';

  @override
  String get permissionCreateInviteLinks => 'Opret invitationslinks';

  @override
  String get permissionChangeOwnNickname => 'Skift eget kaldenavn';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Opdater dit eget kaldenavn.';

  @override
  String get permissionManageNicknames => 'Administrer kaldenavne';

  @override
  String get permissionManageNicknamesDescription =>
      'Skift andre medlemmers kaldenavne.';

  @override
  String get permissionCreateEmojiStickers => 'Opret emoji og stickers';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Upload nye emoji og stickers, og administrer dine egne kreationer.';

  @override
  String get permissionManageEmojiStickers => 'Administrer emoji og stickers';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Rediger eller slet emoji og stickers, der er oprettet af andre medlemmer.';

  @override
  String get permissionManageWebhooks => 'Administrer webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Opret, rediger eller slet webhooks.';

  @override
  String get permissionSendMessages => 'Send beskeder';

  @override
  String get permissionSendTtsMessages => 'Send TTS-beskeder';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Send tekst-til-tale-beskeder.';

  @override
  String get permissionManageMessages => 'Administrer beskeder';

  @override
  String get permissionManageMessagesDescription =>
      'Slet andre medlemmers beskeder. Fastgørelse styres separat.';

  @override
  String get permissionPinMessages => 'Fastgør beskeder';

  @override
  String get permissionEmbedLinks => 'Integrer links';

  @override
  String get permissionAttachFiles => 'Vedhæft filer';

  @override
  String get permissionMentionEveryone => 'Brug @everyone/@here og @rolle';

  @override
  String get permissionMentionEveryoneDescription =>
      'Nævn alle eller en hvilken som helst rolle (også selvom rollen ikke er indstillet til at kunne nævnes).';

  @override
  String get permissionUseExternalEmoji => 'Brug eksterne emoji';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Brug emoji fra andre fællesskaber.';

  @override
  String get permissionUseExternalStickers => 'Brug eksterne stickers';

  @override
  String get permissionAddReactions => 'Tilføj reaktioner';

  @override
  String get permissionAddReactionsDescription =>
      'Tilføj nye reaktioner til beskeder.';

  @override
  String get permissionBypassSlowmode => 'Omgå slowmode';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignorer beskedhastighedsgrænser pr. kanal.';

  @override
  String get permissionTimeOutMembers => 'Sæt medlemmer på pause';

  @override
  String get permissionTimeOutMembersDescription =>
      'Forhindr medlemmer i at sende beskeder, reagere og deltage i tale i en periode.';

  @override
  String get permissionViewChannel => 'Se kanal';

  @override
  String get permissionViewChannelMembers => 'Se kanalmedlemmer';

  @override
  String get permissionViewChannelMembersDescription =>
      'Se medlemslisten for kanaler i dette fællesskab.';

  @override
  String get permissionConnect => 'Opret forbindelse';

  @override
  String get permissionSpeak => 'Tal';

  @override
  String get permissionStreamVideo => 'Stream video';

  @override
  String get permissionUseVoiceActivity => 'Brug stemmeaktivitet';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Uden denne tilladelse skal du bruge tryk og tal.';

  @override
  String get permissionPrioritySpeaker => 'Prioritetstaler';

  @override
  String get permissionMuteMembers => 'Slå medlemmer fra';

  @override
  String get permissionDeafenMembers => 'Slå lyden fra for medlemmer';

  @override
  String get permissionMoveMembers => 'Flyt medlemmer';

  @override
  String get permissionMoveMembersDescription =>
      'Træk medlemmer mellem kanaler, de har adgang til.';

  @override
  String get permissionSetVoiceRegion => 'Angiv stemmeregion';

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
      'Se og administrer alle webhooks, der er konfigureret i dit fællesskab.';

  @override
  String get guildSettingsWebhooksEmpty => 'Ingen webhooks';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Dette community har ingen webhooks endnu. Gå til $channelSettingsPath for at oprette en.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Du skal have tilladelsen \"$permission\" for at se og redigere webhooks for dette community.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Kunne ikke indlæse webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Der opstod en fejl under indlæsning af webhooks. Prøv igen.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks opdateret';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Kunne ikke opdatere webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Ukendt kanal';

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
      'Vis dit fællesskab i Oplev, så andre kan finde og tilmelde sig det.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Ikke nok medlemmer';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Dit fællesskab skal have mindst $count medlemmer, før det kan vises i Opdag.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Afventer';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Godkendt';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Afvist';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Fjernet';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Årsag: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Dit fællesskab er vist i Oplev. Du kan opdatere dine oplysninger herunder eller trække det tilbage for at fjerne det.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Din ansøgning afventer gennemgang. Du kan stadig opdatere dine fortegnelsesoplysninger eller trække ansøgningen tilbage.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategori';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Vælg den kategori, der bedst beskriver dit fællesskab. Du kan ændre dette når som helst.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primært sprog';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Det sprog, de fleste i dit fællesskab taler. Bruges til at filtrere resultater i Opdag.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Beskrivelse';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Beskriv, hvad dit fællesskab handler om';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'En beskrivelse er påkrævet.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Beskrivelsen skal være mindst $minLength tegn.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Beskeden må højst være på $maxLength tegn.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Tags';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Op til $maxTags tags hjælper folk med at finde dit community. De vises i Discovery-søgning.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Tilføj et tag, og tryk på Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Tilføj';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Fjern tagget $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Kunne ikke tilføje tag';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Tags skal være på 2 til $maxLength tegn og alfanumeriske.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Du kan kun tilføje op til $maxTags tags.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Anvend';

  @override
  String get guildSettingsDiscoverySave => 'Gem';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Træk tilbage';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Ansøgning om opdagelse sendt';

  @override
  String get guildSettingsDiscoveryListingUpdated => 'Oversigt opdateret';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Ansøgning om opdagelse trukket tilbage';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Kunne ikke trække ansøgning tilbage';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Prøv igen om et øjeblik.';

  @override
  String get guildSettingsMembersDescription =>
      'Søg og administrer servermedlemmer.';

  @override
  String get guildSettingsMembersSearchHint => 'Søg efter brugernavn eller id';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count medlemmer';
  }

  @override
  String get guildMembersRecentTitle => 'Nye medlemmer';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Viser $displayedCount af $totalCount medlemmer i alt';
  }

  @override
  String get guildMembersSort => 'Sortér';

  @override
  String get guildSettingsMembersSortNewest => 'Nyeste først';

  @override
  String get guildMembersSortOldest => 'Ældste først';

  @override
  String get guildMembersColumnName => 'Navn';

  @override
  String get guildMembersColumnMemberSince => 'Medlem siden';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Blev medlem af $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Sådan blev du medlem';

  @override
  String get guildMembersColumnRoles => 'Roller';

  @override
  String get guildMembersColumnActions => 'Handlinger';

  @override
  String get guildMembersFilterMemberSince => 'Filtrer efter medlem siden';

  @override
  String get guildMembersFilterJoinedProduct => 'Filtrer efter oprettelsesdato';

  @override
  String get guildMembersFilterJoinMethod => 'Filtrer efter tilmeldingsmetode';

  @override
  String get guildMembersFilterRoles => 'Filtrer efter roller';

  @override
  String get guildMembersFilterAll => 'Alle';

  @override
  String get guildMembersFilterPast1Hour => 'Seneste time';

  @override
  String get guildMembersFilterPast24Hours => 'Seneste 24 timer';

  @override
  String get guildMembersFilterPast7Days => 'Seneste 7 dage';

  @override
  String get guildMembersFilterPast2Weeks => 'Seneste 2 uger';

  @override
  String get guildMembersFilterPast3Weeks => 'Seneste 3 uger';

  @override
  String get guildMembersFilterPast4Weeks => 'Seneste 4 uger';

  @override
  String get guildMembersFilterPast3Months => 'Seneste 3 måneder';

  @override
  String get guildMembersFilterCustomRange => 'Brugerdefineret interval...';

  @override
  String get guildMembersDateRangeTitle => 'Brugerdefineret datointerval';

  @override
  String get guildMembersDateAfter => 'Efter dato';

  @override
  String get guildMembersDateBefore => 'Før dato';

  @override
  String get guildMembersClearAll => 'Ryd alle';

  @override
  String get guildMembersRowsPerPage => 'Rækker pr. side';

  @override
  String get guildMembersEmptySearch => 'Ingen matcher den søgning.';

  @override
  String get guildMembersLoadError =>
      'Der opstod en fejl under indlæsning af medlemmer. Prøv igen senere.';

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
  String get guildMembersJoinSourceCreator => 'Fællesskabets skaber';

  @override
  String get guildMembersJoinSourceInvite => 'Inviter';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Inviter ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Inviteret af $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Vanity-URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Bot-invitation';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Platformadministrator';

  @override
  String get guildMembersJoinSourceDiscovery => 'Opdagelse';

  @override
  String get guildMembersJoinMethodUnknown => 'Ukendt';

  @override
  String get guildMembersCommunityOwner => 'Fællesskabsejer';

  @override
  String get guildMembersViewAllRoles => 'Se alle roller';

  @override
  String get guildMembersJoinedJustNow => 'Lige nu';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutter siden',
      one: '1 minut siden',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gange siden',
      one: '1 time siden',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dage siden',
      one: '1 dag siden',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Medlemmer';

  @override
  String get guildMembersChannelListSelected => 'Medlemmer valgt';

  @override
  String get guildSettingsInvitesTitle => 'Invitationer';

  @override
  String get guildSettingsInvitesDescription =>
      'Se alle invitationer til dette fællesskab. For at oprette en ny invitation skal du gå til en kanal og bruge invitationsknappen.';

  @override
  String get guildSettingsInvitesEmpty => 'Ingen invitationslinks';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Dette fællesskab har ingen invitationslinks endnu. Gå til en kanal, og opret en invitation for at invitere folk.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Kunne ikke indlæse invitationer';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Der opstod en fejl under indlæsning af invitationerne. Prøv igen.';

  @override
  String get guildSettingsInvitesTryAgain => 'Prøv igen';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Vis oprettelsesdato i stedet for udløbsdato';

  @override
  String get guildSettingsInvitesPauseInvites => 'Sæt invitationer på pause';

  @override
  String get guildSettingsInvitesEnableInvites => 'Slå invitationer til';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Sæt invitationer på pause for dette fællesskab';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Slå invitationer til for dette fællesskab';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Sæt invitationer på pause? Nye brugere kan ikke tilmelde sig via invitationslinks, før du genaktiverer dem. Eksisterende medlemmer påvirkes ikke.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Aktiver invitationer? Brugere vil igen kunne deltage i dette fællesskab via invitationslinks.';

  @override
  String get guildSettingsInvitesPause => 'Sæt på pause';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Invitationer er sat på pause for dette fællesskab.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Invitationer er sat på pause, fordi $productName har registreret et potentielt raid. Nye brugere kan ikke tilmelde sig lige nu.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Inviteret af:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kode:';

  @override
  String get guildSettingsInvitesLabelUses => 'Bruger:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Oprettet:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Udløber:';

  @override
  String get guildSettingsInvitesUnknown => 'Ukendt';

  @override
  String get guildSettingsInvitesNoCategory => 'Ingen kategori';

  @override
  String get guildSettingsInvitesExpired => 'Udløbet';

  @override
  String get guildSettingsInvitesNever => 'Aldrig';

  @override
  String get guildSettingsInvitesCopyLink => 'Kopiér invitationslink';

  @override
  String get guildSettingsInvitesRevoke => 'Træk invitation tilbage';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Kunne ikke tilbagekalde invitation';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Linket fungerer muligvis stadig. Prøv igen om et øjeblik.';

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
  String get guildSettingsEmojiSlotsTitle => 'Emoji-pladser';

  @override
  String get guildSettingsEmojiDropZone => 'Træk og slip emoji-filer her';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Kunne ikke indlæse emojis. Prøv igen senere.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Ingen emojis fundet, der matcher din søgning.';

  @override
  String get guildSettingsEmojiNoSlots => 'Ingen ledige emoji-pladser';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Du har nået det maksimale antal emojis. Slet nogle eksisterende emojis for at gøre plads.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emoji-navne skal have mindst 2 tegn og kan bruge bogstaver, tal og understregninger. Emoji\'er skal være under $maxSize. Statiske billeder ændres størrelse til 128x128 pixels og komprimeres automatisk. Animerede emoji\'er og SVG\'er skal allerede passe ind i grænsen.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Uploader emojis';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojis',
      one: '# emoji',
    );
    return 'Overfører $_temp0. Det kan tage lidt tid.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Kunne ikke uploade emojis. Prøv igen.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Nogle emojis kunne ikke tilføjes';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Gennemgå disse filer, og prøv igen med mindre eller enklere billeder.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Omdøb emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 tegn, bogstaver, tal, understreger.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Navn';

  @override
  String get guildSettingsEmojiColumnUploader => 'Uploadet af';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Ukendt';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Slet emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Slet :$name:? Kan ikke fortrydes.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Slet denne emoji fra lager og CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Emoji-navnet skal være på mindst 2 tegn';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Emonavnet må højst være 32 tegn langt';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Ugyldigt emoji-navn';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Kunne ikke omdøbe denne emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Navnet blev gendannet til det, det var før. Prøv venligst igen om et øjeblik.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Denne emoji findes ikke længere';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Den er muligvis blevet slettet. Navnet blev gendannet til det, det var før.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Du kan ikke omdøbe denne emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Du har ikke tilladelse til at omdøbe denne emoji. Navnet blev gendannet til det oprindelige.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Du er for hurtig';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Vent venligst et øjeblik, og prøv at omdøbe igen.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Kunne ikke slette denne emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Du kan ikke slette denne emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Tillad andre at klone dine emojis';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Når den er aktiveret, kan medlemmer af andre fællesskaber bruge genvejen \"Klon\" med ét klik i appen på dine tilpassede emojis. Dette forhindrer dem ikke i at gemme billedet og uploade det selv.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Tillad andre at klone dine klistermærker';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Når den er aktiveret, kan medlemmer af andre fællesskaber bruge genvejen \"Klon\" med ét klik i appen på dine tilpassede klistermærker. Dette forhindrer dem ikke i at gemme billedet og uploade det selv.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Kun medlemmer med \"$permission\"-tilladelsen kan ændre dette.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Kunne ikke opdatere kloning af emoji';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Kunne ikke opdatere kloningsindstilling for klistermærker';

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
  String get guildSettingsStickerSlotsTitle => 'Stickerpladser';

  @override
  String get guildSettingsStickerUploadTitle => 'Upload klistermærke';

  @override
  String get guildSettingsStickerDropZone =>
      'Træk og slip en stickerfil her (én ad gangen)';

  @override
  String get guildSettingsStickerDensity => 'Klistermærketæthed';

  @override
  String get guildSettingsStickerDensityCozy => 'Hyggelig';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompakt';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Kunne ikke indlæse klistermærker';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Der opstod en fejl under indlæsning af klistermærkerne. Prøv igen.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Ingen klistermærker fundet, der matcher din søgning.';

  @override
  String get guildSettingsStickersEmptySearch => 'Ingen stickers fundet';

  @override
  String get guildSettingsStickerNoSlots => 'Ingen ledige klistermærkepladser';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Du har nået det maksimale antal klistermærker. Slet nogle eksisterende klistermærker for at gøre plads.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Klistermærker gemmes i 320x320 pixels og skal være under $maxSize. Statiske billeder ændres størrelse og komprimeres automatisk. Animerede klistermærker og SVG\'er skal allerede passe ind i grænsen.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Ikke-understøttet stickerfil';

  @override
  String get guildSettingsStickerAddTitle => 'Tilføj sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Rediger sticker';

  @override
  String get guildSettingsStickerNameLabel => 'Navn';

  @override
  String get guildSettingsStickerNameHint => 'Mit fede sticker';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Beskrivelse';

  @override
  String get guildSettingsStickerDescriptionHint => 'Beskriv klistermærket';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tags ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Tilføj et tag';

  @override
  String get guildSettingsStickerTagAdd => 'Tilføj';

  @override
  String get guildSettingsStickerNameRequired => 'Navn skal udfyldes';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Navnet skal være på mindst 2 tegn';

  @override
  String get guildSettingsStickerNameTooLong => 'Navnet må højst være 30 tegn';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Beskrivelsen må højst være 500 tegn';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Kunne ikke oprette dette klistermærke';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Klistermærket er for stort';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Klistermærket kunne ikke komprimeres nok';

  @override
  String get guildSettingsStickerDeleteTitle => 'Slet sticker';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Slet \"$name\"? Kan ikke fortrydes.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Slet dette sticker fra lager og CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Kunne ikke slette dette klistermærke';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Du kan ikke slette dette klistermærke';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'For at oprette en webhook skal du åbne $channelSettingsPath. Du kan stadig redigere og organisere alle eksisterende webhooks her.';
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
  String get guildSettingsInvitesTableExpires => 'Udløber';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrer efter bruger';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrer efter handling';

  @override
  String get createDm => 'Opret direkte besked';

  @override
  String get createGroupDm => 'Opret gruppedm';

  @override
  String get createDmNewMessage => 'Ny besked';

  @override
  String get createDmSelectFriends => 'Vælg venner';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Vælg venner at sende besked til.';

  @override
  String get createDmSearchFriends => 'Søg venner';

  @override
  String get createDmNoFriendsFound => 'Ingen venner fundet';

  @override
  String get createDmNoFriendsYet => 'Du har ingen venner endnu';

  @override
  String get createDmClaimToStartDms =>
      'Gør krav på din konto for at starte direkte beskeder.';

  @override
  String get createDmVerifyToStartDms =>
      'Bekræft din e-mail for at starte direkte beskeder.';

  @override
  String get createDmVerifyYourEmail => 'Bekræft din e-mail';

  @override
  String get createDmNewGroup => 'Ny gruppe';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Opret en ny gruppe med $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Bekræft ny gruppe';

  @override
  String get createDmCreateNewGroup => 'Opret ny gruppe';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Fjern $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Du har allerede en gruppe med disse brugere. Vil du virkelig oprette en ny? Det er også helt fint!';

  @override
  String get createDmNoActivityYet => 'Ingen aktivitet endnu';

  @override
  String get createDmSomeUsersCantBeAdded => 'Nogle brugere kan ikke tilføjes';

  @override
  String get createDmCreateWithoutThem => 'Opret uden dem';

  @override
  String get createDmUnaddableIntro =>
      'Følgende personer kan ikke føjes til denne gruppe-DM:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Opret gruppechatten med de resterende $count modtager(e) og spring resten over?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Ingen tilbageværende modtagere at oprette en gruppe-DM med.';

  @override
  String get createDmUnaddableUserNotFound => 'Brugeren blev ikke fundet';

  @override
  String get createDmUnaddableBlocked =>
      'Du kan ikke sende beskeder til denne bruger';

  @override
  String get createDmUnaddableNotFriends => 'Ikke på din venneliste';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Kan ikke føjes til gruppe-DM\'er';

  @override
  String get createDmFailed => 'Kunne ikke oprette samtalen. Prøv igen.';

  @override
  String get dmListMessagesTitle => 'Beskeder';

  @override
  String get dmListDirectMessagesTitle => 'Direkte beskeder';

  @override
  String get keybindsSearchShortcuts => 'Søg genveje';

  @override
  String get keybindSectionDefaults => 'Standard';

  @override
  String get keybindSectionMessages => 'Beskeder';

  @override
  String get keybindSectionNavigation => 'Navigation';

  @override
  String get keybindSectionDragAndDrop => 'Træk og slip';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Stemme og video';

  @override
  String get keybindSectionMisc => 'Diverse';

  @override
  String get keybindActionShowShortcutsList => 'Vis liste over tastaturgenveje';

  @override
  String get keybindActionCopyText => 'Kopiér tekst';

  @override
  String get keybindActionMarkUnread => 'Markér som ulæst';

  @override
  String get keybindActionFocusTextarea => 'Fokuser tekstfelt';

  @override
  String get keybindActionSwitchCommunities => 'Skift mellem fællesskaber';

  @override
  String get keybindActionSwitchChannels => 'Skift kanal';

  @override
  String get keybindActionHistoryBack => 'Gå tilbage i kanalhistorikken';

  @override
  String get keybindActionHistoryForward =>
      'Gå frem i historikken for viste kanaler';

  @override
  String get keybindActionJumpUnreadChannels => 'Skift mellem ulæste kanaler';

  @override
  String get keybindActionJumpMentionChannels =>
      'Skift mellem ulæste kanaler med omtaler';

  @override
  String get keybindActionJumpCurrentCall => 'Gå til det aktuelle opkald';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Skift mellem seneste fællesskab og direkte beskeder';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Skift til forrige fællesskab eller direkte beskeder';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Skift til næste fællesskab eller direkte beskeder';

  @override
  String get keybindActionGoToDms => 'Gå til direkte beskeder';

  @override
  String get keybindActionGoToFirstCommunity => 'Gå til første fællesskab';

  @override
  String get keybindActionGoToSecondCommunity => 'Gå til andet fællesskab';

  @override
  String get keybindActionGoToThirdCommunity => 'Gå til tredje fællesskab';

  @override
  String get keybindActionGoToFourthCommunity => 'Gå til fjerde fællesskab';

  @override
  String get keybindActionGoToFifthCommunity => 'Gå til femte fællesskab';

  @override
  String get keybindActionGoToSixthCommunity => 'Gå til sjette fællesskab';

  @override
  String get keybindActionGoToSeventhCommunity => 'Gå til syvende fællesskab';

  @override
  String get keybindActionGoToEighthCommunity => 'Gå til ottende fællesskab';

  @override
  String get keybindActionToggleQuickSwitcher => 'Slå hurtigskifter til/fra';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Opret eller tilmeld dig et fællesskab';

  @override
  String get keybindActionStartDragAndDrop => 'Start træk og slip';

  @override
  String get keybindActionMove => 'Flyt';

  @override
  String get keybindActionDropItem => 'Smid genstand';

  @override
  String get keybindActionCancel => 'Annuller';

  @override
  String get keybindActionMarkCommunityRead => 'Markér fællesskab som læst';

  @override
  String get keybindActionMarkChannelRead => 'Markér kanal som læst';

  @override
  String get keybindActionStartGroupDm => 'Start en gruppesamtale';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Slå fastgjorte beskeder til/fra';

  @override
  String get keybindActionToggleInbox => 'Slå indbakken til/fra';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Markér øverste indbakke-kanal som læst';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Markér alle indbakke-kanaler som læst';

  @override
  String get keybindActionToggleMemberList =>
      'Slå medlemslisten eller talechat til/fra';

  @override
  String get keybindActionToggleEmojiPicker => 'Slå emoji-vælgeren til/fra';

  @override
  String get keybindActionToggleGifPicker => 'Slå GIF-vælgeren til/fra';

  @override
  String get keybindActionToggleStickerPicker => 'Slå sticker-vælgeren til/fra';

  @override
  String get keybindActionScrollChatUp => 'Rul chat op';

  @override
  String get keybindActionScrollChatDown => 'Rul chat ned';

  @override
  String get keybindActionJumpOldestUnread => 'Gå til den ældste ulæste besked';

  @override
  String get keybindActionFocusComposer => 'Fokuser tekstfeltet';

  @override
  String get keybindActionUploadFile => 'Upload en fil';

  @override
  String get keybindActionCopyChannelLink => 'Kopiér kanallink';

  @override
  String get keybindActionToggleSavedMedia => 'Slå gemte medier til/fra';

  @override
  String get keybindActionSendVoiceMessage => 'Send talebesked';

  @override
  String get keybindActionAnswerCall => 'Besvar det indgående opkald';

  @override
  String get keybindActionDeclineCall => 'Afvis indgående opkald';

  @override
  String get keybindActionStartDmCall =>
      'Start et opkald i en direkte besked eller gruppe';

  @override
  String get keybindActionToggleSoundboard => 'Slå soundboard til/fra';

  @override
  String get keybindActionToggleCompactCallView =>
      'Udvid eller skjul kompakt opkaldsvisning';

  @override
  String get keybindActionPushToTalkPriority => 'Tryk for at tale (prioritet)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Prioritet for stemmeaktivitet';

  @override
  String get keybindActionOpenHelp => 'Åbn hjælp';

  @override
  String get keybindActionSearchMessages => 'Søg i beskeder';

  @override
  String get keybindActionOpenContextMenu => 'Åbn genvejsmenuen';

  @override
  String get keybindActionOpenSettings => 'Åbn dine indstillinger';

  @override
  String get keybindActionOpenThemeStudio => 'Åbn temastudie-popout';

  @override
  String get keybindActionZoomIn => 'Zoom ind';

  @override
  String get keybindActionZoomOut => 'Zoom ud';

  @override
  String get keybindActionZoomReset => 'Nulstil zoom';

  @override
  String get clipboardPasteFailed =>
      'Kunne ikke indsætte. Udklipsholderen var tom eller blokeret for denne app.';

  @override
  String get homeQuickActionDms => 'Beskeder';
}
