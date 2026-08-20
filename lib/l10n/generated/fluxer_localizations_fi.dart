// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class FluxerLocalizationsFi extends FluxerLocalizations {
  FluxerLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get reconnectingTitle => 'Me mokasimme!';

  @override
  String get reconnectingBody =>
      'Palvelimissa on jotain vikaa.\nPäivittyy hetken kuluttua!';

  @override
  String get gatewayReconnectingToast => 'Yhdistetään uudelleen…';

  @override
  String get gatewayConnectedToast => 'Yhdistetty';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Käynnistys epäonnistui: $error';
  }

  @override
  String get retry => 'Yritä uudelleen';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Yhteys katkesi';

  @override
  String get splashViewOnStatusPage => 'Näytä tilasivulla';

  @override
  String get splashConnectionIssuesPrompt => 'Yhteysongelmia?';

  @override
  String get splashStatusPageLink => 'Tilasivu';

  @override
  String get splashReadIncident => 'Lue tapahtumasta';

  @override
  String get splashIncidentHistory => 'Tapahtumahistoria';

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
  String get welcomeBack => 'Tervetuloa takaisin';

  @override
  String get email => 'Sähköposti';

  @override
  String get emailInvalid => 'Anna kelvollinen sähköpostiosoite.';

  @override
  String get password => 'Salasana';

  @override
  String get forgotPassword => 'Unohditko salasanasi?';

  @override
  String get logIn => 'Kirjaudu sisään';

  @override
  String get logInWithPasskey => 'Kirjaudu sisään tunnusavaimella';

  @override
  String continueWithSso(String provider) {
    return 'Jatka tunnuksella $provider';
  }

  @override
  String get ssoRequired => 'Tähän instanssiin pääsy vaatii SSO:n.';

  @override
  String get organizationSsoProvider =>
      'Kirjaudu sisään organisaatiosi kertakirjautumispalveluntarjoajalla.';

  @override
  String get failedToStartSso => 'SSO:n aloitus epäonnistui';

  @override
  String get ssoCancelled => 'SSO-kirjautuminen peruutettiin';

  @override
  String preferSso(String provider) {
    return 'Haluatko käyttää SSO:ta? Jatka tunnuksella $provider.';
  }

  @override
  String get logInViaBrowser => 'Kirjaudu sisään selaimella';

  @override
  String get needAccountPrompt => 'Tarvitsetko tilin? ';

  @override
  String get register => 'Rekisteröidy';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Varmista, että olet ihminen';

  @override
  String get captchaDescription =>
      'Meidän on varmistettava, ettet ole botti. Suorita vahvistus alla.';

  @override
  String get captchaSwitchToHcaptcha => 'Ongelmia? Kokeile hCaptchaa';

  @override
  String get captchaSwitchToTurnstile => 'Kokeile Turnstilea';

  @override
  String get cancel => 'Peruuta';

  @override
  String get ipAuthCheckEmail => 'Tarkista sähköpostisi';

  @override
  String ipAuthDescription(String email) {
    return 'Lähetimme sähköpostitse linkin tämän kirjautumisen valtuuttamiseksi. Avaa postilaatikkosi osoitteessa $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Yhteys katkesi';

  @override
  String get ipAuthConnectionLostDescription =>
      'Yhteys katkesi valtuutusta odotellessa. Yritä uudelleen.';

  @override
  String get ipAuthLinkExpired => 'Kirjautumislinkki vanhentui';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Tämä valtuutuslinkki vanhentui. Kirjaudu sisään uudelleen.';

  @override
  String get ipAuthResendEmail => 'Lähetä sähköposti uudelleen';

  @override
  String get ipAuthResent => 'Lähetetty uudelleen';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Takaisin';

  @override
  String get mfaTitle => 'Kaksivaiheinen tunnistautuminen';

  @override
  String get mfaChooseMethod => 'Valitse vahvistusmenetelmä';

  @override
  String get mfaMethodTotp => 'Tunnistussovellus';

  @override
  String get mfaMethodWebauthn => 'Turva-avain / Tunnusavain';

  @override
  String get mfaTotpDescription =>
      'Syötä 6-numeroinen koodi tunnistussovelluksestasi tai yksi varmuuskoodistasi.';

  @override
  String get mfaCodeLabel => 'Koodi';

  @override
  String get mfaTryAnotherMethod => 'Kokeile toista menetelmää';

  @override
  String get mfaUseSecurityKey => 'Kokeile turva-avainta / passia';

  @override
  String get accountSelectorTitle => 'Valitse tili';

  @override
  String get accountSelectorDescription =>
      'Jatka valitsemalla tili tai lisää toinen.';

  @override
  String get accountAdd => 'Lisää tili';

  @override
  String get accountRemove => 'Poista';

  @override
  String accountRemoveTitle(String username) {
    return 'Poista $username';
  }

  @override
  String get accountRemoveDescription =>
      'Tämä poistaa tallennetun istunnon tälle tilille.';

  @override
  String get accountRemoveOnlyDescription =>
      'Tämä poistaa ainoan tallennetun tilin tästä laitteesta.';

  @override
  String get accountExpired => 'Vanhentunut';

  @override
  String accountSessionExpired(String identifier) {
    return 'Istunto vanhentui tunnuksella $identifier. Kirjaudu uudelleen.';
  }

  @override
  String get accountManageTitle => 'Hallitse tilejä';

  @override
  String get accountSwitchFailed =>
      'Tilin vaihtaminen epäonnistui. Yritä uudelleen.';

  @override
  String get profileTabMenuSwitchAccounts => 'Vaihda tilejä';

  @override
  String get statusChangeSheetTitle => 'Aseta tila';

  @override
  String get statusOnlineStatusSection => 'Online-tila';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Joutokäynti';

  @override
  String get statusDnd => 'Älä häiritse';

  @override
  String get statusInvisible => 'Näkymätön';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Kunnes vaihdan sen';

  @override
  String get statusDontClear => 'Älä poista';

  @override
  String get statusFor10Seconds => '10 sekunniksi';

  @override
  String get statusClearAfter10Seconds => '10 sekuntia';

  @override
  String get statusClearAfter15Minutes => '15 minuuttia';

  @override
  String get statusClearAfter30Minutes => '30 minuuttia';

  @override
  String get statusClearAfter1Hour => '1 tunti';

  @override
  String get statusClearAfter3Hours => '3 tuntia';

  @override
  String get statusClearAfter4Hours => '4 tuntia';

  @override
  String get statusClearAfter8Hours => '8 tuntia';

  @override
  String get statusClearAfter24Hours => '24 tuntia';

  @override
  String get statusClearAfter3Days => '3 päivää';

  @override
  String get statusDndDescription => 'Et saa ilmoituksia työpöydällä';

  @override
  String get statusInvisibleDescription => 'Näytät olevasi offline';

  @override
  String get customStatusSetTitle => 'Aseta mukautettu tila';

  @override
  String get customStatusCurrentHint => 'Mukautettu tila';

  @override
  String get customStatusClear => 'Poista mukautettu tila';

  @override
  String get customStatusPlaceholder => 'Mitä tapahtuu?';

  @override
  String get customStatusChooseEmoji => 'Valitse emoji';

  @override
  String get customStatusClearAfter => 'Poista jälkeen';

  @override
  String get customStatusSave => 'Tallenna';

  @override
  String get accountActive => 'Aktiivinen tili';

  @override
  String get signOut => 'Kirjaudu ulos';

  @override
  String get suspendedPermanentTitle => 'Tili pysyvästi estetty';

  @override
  String get suspendedTemporaryTitle => 'Tili estetty';

  @override
  String get suspendedPermanentDescription =>
      'Tilisi on pysyvästi estetty käyttöehtojemme rikkomisen vuoksi.';

  @override
  String get suspendedTemporaryDescription =>
      'Tilisi on väliaikaisesti estetty. Voit käyttää tiliäsi, kun estoaika päättyy.';

  @override
  String get suspendedIssuedAt => 'Myönnetty';

  @override
  String get suspendedEndsAt => 'Päättyy';

  @override
  String get suspendedDuration => 'Kesto';

  @override
  String get suspendedPermanent => 'Pysyvä';

  @override
  String get suspendedReason => 'Syy';

  @override
  String get suspendedAppealDeadline => 'Valitusmääräaika';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Tilisi poistetaan suunnitellusti $date.';
  }

  @override
  String get suspendedRecheck => 'Tarkista päivitykset';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Tarkista uudelleen ${seconds}s kuluttua';
  }

  @override
  String get suspendedBackToLogin => 'Takaisin kirjautumiseen';

  @override
  String get suspendedAppealTitle => 'Valitus';

  @override
  String get suspendedAppealHint =>
      'Selitä, miksi käyttösulku tulisi harkita uudelleen (vähintään 50 merkkiä)...';

  @override
  String get suspendedAppealSubmit => 'Lähetä valitus';

  @override
  String get suspendedAppealPending => 'Odottaa tarkistusta';

  @override
  String get suspendedAppealAccepted => 'Valitus hyväksytty';

  @override
  String get suspendedAppealRejected => 'Valitus hylätty';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Valituksesi on hyväksytty ja tilisi on palautettu.';

  @override
  String get suspendedSignIn => 'Kirjaudu tilillesi';

  @override
  String get forgotPasswordTitle => 'Unohditko salasanasi?';

  @override
  String get forgotPasswordDescription =>
      'Anna sähköpostiosoitteesi, niin lähetämme sinulle linkin salasanan vaihtamiseksi.';

  @override
  String get forgotPasswordSubmit => 'Lähetä salasanan vaihtolinkki';

  @override
  String get forgotPasswordSentTitle => 'Tarkista sähköpostisi';

  @override
  String get forgotPasswordSentDescription =>
      'Olemme lähettäneet ohjeet salasanan vaihtamiseksi sähköpostiosoitteeseesi. Tarkista postilaatikkosi ja seuraa linkkiä salasanan vaihtamiseksi.';

  @override
  String get forgotPasswordBackToLogin => 'Palaa kirjautumiseen';

  @override
  String get resetPasswordTitle => 'Aseta uusi salasana';

  @override
  String get resetPasswordDescription =>
      'Syötä uusi salasanasi alla oleviin kenttiin suorittaaksesi salasanan vaihtamisen.';

  @override
  String get resetPasswordNewPassword => 'Uusi salasana';

  @override
  String get resetPasswordConfirm => 'Vahvista uusi salasana';

  @override
  String get resetPasswordSubmit => 'Vaihda salasana';

  @override
  String get resetPasswordMismatch => 'Salasanat eivät täsmää.';

  @override
  String get registerTitle => 'Luo tili';

  @override
  String get registerDisplayName => 'Näyttönimi (valinnainen)';

  @override
  String get registerDisplayNameHint =>
      'Millä nimellä haluat tulla kutsutuksi?';

  @override
  String get registerUsername => 'Käyttäjänimi (valinnainen)';

  @override
  String get registerUsernameHint =>
      'Jätä tyhjäksi saadaksesi satunnaisen käyttäjänimen';

  @override
  String get registerUsernameTagHint =>
      '4-numeroinen tunniste lisätään automaattisesti yksilöllisyyden varmistamiseksi';

  @override
  String get registerDateOfBirth => 'Syntymäaika';

  @override
  String get registerMonth => 'Kuukausi';

  @override
  String get registerDay => 'Päivä';

  @override
  String get registerYear => 'Vuosi';

  @override
  String get registerConsent => 'Hyväksyn käyttöehdot ja tietosuojakäytännön';

  @override
  String get registerConsentPrefix => 'Hyväksyn ';

  @override
  String get registerConsentTerms => 'käyttöehdot';

  @override
  String get registerConsentAnd => ' ja ';

  @override
  String get registerConsentPrivacy => 'tietosuojakäytännön';

  @override
  String get registerConfirmPassword => 'Vahvista salasana';

  @override
  String get registerSubmit => 'Luo tili';

  @override
  String get registerHaveAccount => 'Onko sinulla jo tili? ';

  @override
  String get passkeyNoCredentials =>
      'Tälle sovellukselle ei löytynyt passkey-tunnuksia. Kirjaudu sisään sähköpostilla ja salasanalla.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkey-tunnuksia ei tueta tällä laitteella.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkey-tunnuksia ei ole määritetty tälle sovellukselle. Kirjaudu sisään sähköpostilla ja salasanalla.';

  @override
  String get passkeyTimeout =>
      'Passkey-tunnistautuminen aikakatkaistiin. Yritä uudelleen.';

  @override
  String get passkeyNotAvailable =>
      'Passkey-tunnukset eivät ole saatavilla tälle sovellukselle. Kirjaudu sisään sähköpostilla ja salasanalla.';

  @override
  String get passkeyFailed =>
      'Salasanatunnuksen tunnistautuminen epäonnistui. Yritä uudelleen.';

  @override
  String get errorUnableToCreateAccount =>
      'Tilin luominen ei onnistunut. Yritä uudelleen.';

  @override
  String get errorUnableToSignIn =>
      'Kirjautuminen ei onnistu tällä hetkellä. Yritä uudelleen.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Virheellinen sähköpostiosoite tai salasana.';

  @override
  String get errorUnableToSendResetLink =>
      'Nollauslinkin lähettäminen ei onnistunut. Yritä uudelleen.';

  @override
  String get errorUnableToResetPassword =>
      'Salasanan nollaaminen ei onnistunut. Yritä uudelleen.';

  @override
  String get embedInviteJoin => 'Liity yhteisöön';

  @override
  String get embedInviteGoTo => 'Siirry yhteisöön';

  @override
  String embedInviteOnline(String count) {
    return '$count verkossa';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count jäsentä';
  }

  @override
  String get embedInviteUnknownTitle => 'Tuntematon kutsu';

  @override
  String get embedInviteUnknownSubtitle => 'Yritä pyytää uutta kutsua.';

  @override
  String get embedInviteUnavailable => 'Kutsu ei saatavilla';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => 'Sinut on kutsuttu liittymään';

  @override
  String get inviteAcceptJoinButton => 'Liity yhteisöön';

  @override
  String get inviteAcceptGoToButton => 'Siirry yhteisöön';

  @override
  String get inviteAcceptInvitesPaused => 'Kutsuja on tauotettu';

  @override
  String get inviteAcceptNotFoundTitle => 'Kutsu virheellinen';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Tämä kutsu saattaa olla vanhentunut tai virheellinen.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Liity ryhmään';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Sinut on kutsunut ryhmäkeskusteluun $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'joku';

  @override
  String get inviteAcceptEmojiPack => 'Emojipaketti';

  @override
  String get inviteAcceptStickerPack => 'Tarrat';

  @override
  String get inviteAcceptInstallEmojiPack => 'Asenna emojipaketti';

  @override
  String get inviteAcceptInstallStickerPack => 'Asenna tarrat';

  @override
  String get inviteAcceptPackInstallNote =>
      'Tämän kutsun hyväksyminen asentaa paketin automaattisesti.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Kanavan käyttö estetty';

  @override
  String get channelAccessDeniedDescription =>
      'Sinulla ei ole pääsyä kanavalle, jonne tämä viesti lähetettiin.';

  @override
  String get messageJumpLinkNoAccess => 'Ei pääsyä';

  @override
  String get okay => 'Ok';

  @override
  String get embedThemeTitle => 'Jaettu teema';

  @override
  String get embedThemeSubtitle =>
      'Tämä asiakasohjelma ei tue mukautettuja teemoja.';

  @override
  String get embedThemeUnavailableButton => 'Teemat eivät saatavilla';

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
  String get privacySettings => 'Tietosuoja-asetukset';

  @override
  String get privacyDirectMessages => 'Suorat viestit';

  @override
  String get privacyDirectMessagesDescription =>
      'Salli muiden yhteisön jäsenten suorat viestit tähän yhteisöön';

  @override
  String get privacyBotDirectMessages => 'Bottien suorat viestit';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Salli tämän yhteisön botteja lähettää sinulle suoria viestejä';

  @override
  String get privacyMutualDmsDisabled =>
      'Yhteisön ylläpitäjät ovat poistaneet käytöstä suorien viestien vastaanottamisen vain tämän yhteisön keskinäisiltä jäseniltä.';

  @override
  String get communityDebug => 'Yhteisön virheenkorjaus';

  @override
  String get copiedToClipboard => 'Kopioitu leikepöydälle';

  @override
  String get notificationSettings => 'Ilmoitusasetukset';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Mykistä $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Yhteisön mykistäminen estää lukemattomien merkkien ja ilmoitusten ilmestymisen, ellet ole mainittu';

  @override
  String get notificationCommunitySettings => 'Yhteisön ilmoitusasetukset';

  @override
  String get notificationAllMessages => 'Kaikki viestit';

  @override
  String get notificationOnlyMentions => 'Vain maininnat';

  @override
  String get notificationNothing => 'Ei mitään';

  @override
  String get notificationSuppressEveryone =>
      'Estä @everyone- ja @here-maininnat';

  @override
  String get notificationSuppressRoles => 'Vaimenna kaikki roolimerkinnät';

  @override
  String get notificationMobilePush => 'Mobiilipush-ilmoitukset';

  @override
  String get notificationOverrides => 'Ilmoitusasetusten ohitukset';

  @override
  String get notificationSelectChannel => 'Valitse kanava tai luokka';

  @override
  String get notificationOnlyAtMentions => 'Vain @maininnat';

  @override
  String get notificationMuteChannel => 'Vaimenna kanava';

  @override
  String get notificationUnmuteChannel => 'Poista kanavan vaimennus';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Ei luokkaa';

  @override
  String get dmMarkAsRead => 'Merkitse luetuksi';

  @override
  String get dmMuteConversation => 'Vaimenna yksityisviesti';

  @override
  String get dmUnmuteConversation => 'Poista yksityisviestin vaimennus';

  @override
  String get dmPinDm => 'Kiinnitä yksityisviesti';

  @override
  String get dmUnpinDm => 'Poista yksityisviestin kiinnitys';

  @override
  String get dmAlwaysShowInSidebar => 'Näytä aina sivupalkissa';

  @override
  String get dmRemoveFromAlwaysShown => 'Poista aina näytettävistä';

  @override
  String get dmCloseDm => 'Sulje yksityisviesti';

  @override
  String get dmCloseDmConfirmTitle => 'Sulje yksityisviesti';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Haluatko varmasti sulkea yksityisviestisi käyttäjän $username kanssa? Voit avata sen uudelleen myöhemmin.';
  }

  @override
  String get dmCopyChannelId => 'Kopioi kanavan tunnus';

  @override
  String get dmChannelIdCopied => 'Kanavan tunnus kopioitu';

  @override
  String get dmCopyUserId => 'Kopioi käyttäjän tunnus';

  @override
  String get dmUserIdCopied => 'Käyttäjän tunnus kopioitu';

  @override
  String get dmViewProfile => 'Näytä profiili';

  @override
  String get dmVoiceCall => 'Aloita äänipuhelu';

  @override
  String get incomingVoiceCallTitle => 'Saapuva äänipuhelu';

  @override
  String get incomingVoiceCallAccept => 'Vastaa';

  @override
  String get incomingVoiceCallDecline => 'Hylkää';

  @override
  String get incomingVoiceCallLabel => 'Saapuva puhelu';

  @override
  String get incomingVoiceCallIgnore => 'Ohita';

  @override
  String get directVoiceCallNotEligible =>
      'Tätä puhelua ei voi aloittaa juuri nyt. Yritä uudelleen hetken kuluttua.';

  @override
  String get voiceJoinCallFailed =>
      'Yhteyttä tähän puheluun ei voitu muodostaa. Tarkista yhteytesi ja yritä uudelleen.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Puheluun ei voitu liittyä. Tarkista yhteytesi ja yritä uudelleen.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Puhelun tilapäivitys palvelimelle epäonnistui. Tarkista yhteytesi ja yritä uudelleen.';

  @override
  String get dmAddNote => 'Lisää muistiinpano';

  @override
  String get dmEditGroup => 'Muokkaa ryhmää';

  @override
  String get dmInviteToCommunity => 'Kutsu yhteisöön';

  @override
  String get dmBlock => 'Estä';

  @override
  String get dmLeaveGroup => 'Poistu ryhmästä';

  @override
  String get dmNoCommunitiesAvailable => 'Yhteisöjä ei ole saatavilla';

  @override
  String dmGroupMemberCount(int count) {
    return '$count jäsentä';
  }

  @override
  String get dmMuteFor15Min => '15 minuutiksi';

  @override
  String get dmMuteFor30Min => '30 minuutiksi';

  @override
  String get dmMuteFor1Hour => '1 tunniksi';

  @override
  String get dmMuteFor3Hours => '3 tunniksi';

  @override
  String get dmMuteFor4Hours => '4 tunniksi';

  @override
  String get dmMuteFor8Hours => '8 tunniksi';

  @override
  String get dmMuteFor24Hours => '24 tunniksi';

  @override
  String get dmMuteFor3Days => '3 päiväksi';

  @override
  String get dmMuteForever => 'Kunnes otan sen takaisin käyttöön';

  @override
  String get dmPinGroupDm => 'Kiinnitä ryhmäyksityisviesti';

  @override
  String get dmUnpinGroupDm => 'Poista ryhmäkeskustelun kiinnitys';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Lisää suosikkeihin';

  @override
  String get dmUnfavoriteDm => 'Poista suosikeista';

  @override
  String get dmFavoriteGroupDm => 'Lisää ryhmäkeskustelu suosikkeihin';

  @override
  String get dmUnfavoriteGroupDm => 'Poista ryhmäkeskustelun suosikeista';

  @override
  String get dmChangeFriendNickname => 'Muuta kaverin lempinimeä';

  @override
  String get dmRemoveFriend => 'Poista kaveri';

  @override
  String get dmAddFriend => 'Lisää kaveri';

  @override
  String get dmAcceptFriendRequest => 'Hyväksy kaveripyyntö';

  @override
  String get dmIgnoreFriendRequest => 'Hylkää kaveripyyntö';

  @override
  String get dmFriendRequestSent => 'Kaveripyyntö lähetetty';

  @override
  String get dmUnblock => 'Poista esto';

  @override
  String get dmDebugUser => 'Debuggaa käyttäjää';

  @override
  String get dmDebugChannel => 'Debuggaa kanavaa';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Kiinnitetty keskustelu';

  @override
  String get dmUnpinned => 'Poistettu keskustelun kiinnitys';

  @override
  String get dmMuted => 'Mykistetty keskustelu';

  @override
  String get dmUnmuted => 'Keskustelun mykistys poistettu';

  @override
  String get dmRemoveFriendConfirmTitle => 'Poista kaveri';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Haluatko varmasti poistaa $username kaverilistaltasi?';
  }

  @override
  String get dmBlockConfirmTitle => 'Estä käyttäjä';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Haluatko varmasti estää käyttäjän $username? Hän ei voi lähettää sinulle viestejä tai kaveripyyntöjä.';
  }

  @override
  String get dmFriendRequestSentToast => 'Kaveripyyntö lähetetty';

  @override
  String get dmFriendRequestFailed => 'Kaveripyynnön lähettäminen epäonnistui';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Kaveripyynnön hyväksyminen epäonnistui';

  @override
  String get dmRemoveFriendFailed => 'Kaverin poistaminen epäonnistui';

  @override
  String get dmBlockFailed => 'Käyttäjän estäminen epäonnistui';

  @override
  String get dmUnblockFailed => 'Eston poistaminen epäonnistui';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Kaveripyynnön hylkääminen epäonnistui';

  @override
  String get dmAddFriends => 'Lisää kavereita';

  @override
  String get addFriendSheetTitle => 'Lisää kaveri';

  @override
  String get addFriendUsernameHint => 'Käyttäjänimi#0000';

  @override
  String get addFriendUsernameLabel => 'Kaverin käyttäjänimi';

  @override
  String get addFriendSendRequest => 'Lähetä pyyntö';

  @override
  String get addFriendNoUserFound =>
      'Käyttäjää ei löytynyt tällä käyttäjänimellä.';

  @override
  String get addFriendInvalidUsername =>
      'Anna kelvollinen käyttäjänimi (Käyttäjänimi#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Kaveripyyntö lähetetty';

  @override
  String get addFriendClaimTitle => 'Lunasta tilisi';

  @override
  String get addFriendClaimDescription =>
      'Lunasta tilisi lähettääksesi kaveripyyntöjä.';

  @override
  String get addFriendVerifyTitle => 'Vahvista sähköpostisi';

  @override
  String get addFriendVerifyDescription =>
      'Sinun on vahvistettava sähköpostiosoitteesi ennen kuin voit lähettää kaveripyyntöjä.';

  @override
  String get addFriendVerifyEmail => 'Vahvista sähköposti';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Saapuneet kaveripyynnöt ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Lähetetyt kaveripyynnöt ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Saapunut kaveripyyntö';

  @override
  String get addFriendOutgoingStatus => 'Kaveripyyntö lähetetty';

  @override
  String get addFriendViewProfile => 'Näytä profiili';

  @override
  String get addFriendAccept => 'Hyväksy';

  @override
  String get addFriendIgnore => 'Hylkää';

  @override
  String get addFriendAcceptTitle => 'Hyväksy kaveripyyntö';

  @override
  String get addFriendIgnoreTitle => 'Jätä ystäväpyyntö huomiotta';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Hyväksytkö $userName:n ystäväpyynnön?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Jätätkö $displayName:n ystäväpyynnön huomiotta?';
  }

  @override
  String get addFriendCancelRequest => 'Peruuta pyyntö';

  @override
  String get addFriendCancelRequestFailed =>
      'Ystäväpyynnön peruuttaminen epäonnistui. Yritä uudelleen.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Hän ei hyväksy ystäväpyyntöjä tällä hetkellä.';

  @override
  String get addFriendUnblockFirst =>
      'Poista esto ensin lähettääksesi ystäväpyynnön.';

  @override
  String get addFriendCannotSendToSelf =>
      'Et voi lähettää ystäväpyyntöä itsellesi.';

  @override
  String get addFriendAlreadyFriends =>
      'Olette jo ystäviä tämän käyttäjän kanssa.';

  @override
  String get addFriendClaimToSend =>
      'Viimeistele rekisteröityminen lähettääksesi ystäväpyyntöjä.';

  @override
  String get addFriendSendFailedGeneric =>
      'Ystäväpyynnön lähettäminen epäonnistui. Yritä uudelleen.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Järjestelmä';

  @override
  String get emojiSearchPlaceholder => 'Etsi unelmiesi emoji';

  @override
  String get emojiSearchEmpty => 'Yhtään emojia ei löytynyt hakusanallasi';

  @override
  String get emojiAutocompleteDefaultLabel => 'Oletusemoji';

  @override
  String get emojiFrequentlyUsed => 'Usein käytetyt';

  @override
  String get emojiTabGifs => 'GIFit';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Tarrat';

  @override
  String get emojiTabEmojis => 'Emojit';

  @override
  String get gifPickerSearch => 'Hae GIFejä';

  @override
  String get gifPickerSearchKlipy => 'Hae KLIPYstä';

  @override
  String get gifPickerSearchTenor => 'Hae Tenorista';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Suosikit';

  @override
  String get gifPickerTrending => 'Trendaavat GIFit';

  @override
  String get gifPickerNoResultsTitle => 'Ei hakutuloksia';

  @override
  String get gifPickerNoResultsDescription => 'Kokeile toista hakusanaa';

  @override
  String get gifPickerLoadFailedTitle => 'GIF-tiedostojen lataus epäonnistui';

  @override
  String get gifPickerLoadFailedBody =>
      'Tarkista yhteytesi ja yritä uudelleen.';

  @override
  String get emojiCategoryPeople => 'Ihmiset';

  @override
  String get emojiCategoryNature => 'Luonto';

  @override
  String get emojiCategoryFood => 'Ruoka ja juoma';

  @override
  String get emojiCategoryActivity => 'Aktiviteetit';

  @override
  String get emojiCategoryTravel => 'Matkustus ja paikat';

  @override
  String get emojiCategoryObjects => 'Esineet';

  @override
  String get emojiCategorySymbols => 'Symbolit';

  @override
  String get emojiCategoryFlags => 'Liput';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Avaa $emojiCount $communityCount Plutoniumilla.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Hanki Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Älä näytä tätä uudelleen';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mukautettua emojia',
      one: '1 mukautettu emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yhteisöä',
      one: '1 yhteisö',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Varoitus ulkoisesta linkistä';

  @override
  String get externalLinkWarningLeaving => 'Olet poistumassa Fluxerista';

  @override
  String get externalLinkWarningDescription =>
      'Ulkoiset linkit voivat olla vaarallisia. Ole varovainen.';

  @override
  String get externalLinkWarningDestinationUrl => 'Kohdeosoite:';

  @override
  String get externalLinksSectionTitle => 'Ulkoiset linkit';

  @override
  String get externalLinksSectionDescription =>
      'Määritä, miten ulkoisten linkkien varoituksia käsitellään.';

  @override
  String get externalLinkWarningTrustPrefix => 'Luota aina ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — ohita tämä varoitus seuraavalla kerralla';

  @override
  String get externalLinkVisitSite => 'Vieraile sivustolla';

  @override
  String get externalLinkTrustAllLabel => 'Luota kaikkiin ulkoisiin linkkeihin';

  @override
  String get externalLinkStripTrackingLabel =>
      'Poista seuranta-parametrit URL-osoitteista';

  @override
  String get externalLinkStripTrackingDescription =>
      'Poista automaattisesti seuranta-parametrit (kuten utm_source, fbclid, gclid) lähettämistäsi viesteistä. Linkki puhdistuu ennen kuin se saavuttaa kenetkään muun.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Luotatko kaikkiin ulkoisiin linkkeihin?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Tämä luottaa kaikkiin ulkoisiin linkkeihin ja ohittaa varoituksen jokaiselle verkkotunnukselle. Nykyiset luotetut verkkotunnuksesi korvataan. Tämä on vähemmän turvallista.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Luota kaikkiin';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Lopetetaanko kaikkien linkkien luottaminen?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Ulkoisten linkkien varoitukset näytetään uudelleen. Sinun on lisättävä luotetut verkkotunnukset yksitellen.';

  @override
  String get externalLinkStopTrustingAllAction => 'Poista kaikkien luottaminen';

  @override
  String get externalLinkTrustedAllDescription =>
      'Kaikkiin ulkoisiin linkkeihin luotetaan. Varoituksia ei näytetä.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Sinulla on $count luotettua verkkotunnusta. Lisää lisää valitsemalla ruutu vieraillessasi ulkoisissa linkeissä.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Kun tämä on käytössä, ulkoisia linkkejä koskevia varoituksia ei näytetä. Tämä on vähemmän turvallista.';

  @override
  String get imageFileTooLarge =>
      'Kuvatiedosto on liian suuri. Valitse tiedosto, joka on pienempi kuin 10 Mt.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animoituja avatareja varten tarvitset Plutoniumin';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animoituja bannereita varten tarvitset Plutoniumin';

  @override
  String get animatedAvifNotSupported => 'Animoitu AVIF ei tuettu';

  @override
  String get animatedAvifNotSupportedBody =>
      'Animoitujen AVIF-tiedostojen rajaaminen ja kiertäminen ei ole vielä tuettua. Jos jatkat, se ladataan alkuperäisessä muodossaan.';

  @override
  String get uploadAsIs => 'Lataa sellaisenaan';

  @override
  String get croppingAnimatedNotSupported =>
      'Animoitujen kuvien rajaaminen ei ole vielä tuettua. Käytetään alkuperäistä latausta.';

  @override
  String get cropAvatar => 'Rajaa avatar';

  @override
  String get cropBanner => 'Rajaa banneri';

  @override
  String get skip => 'Ohita';

  @override
  String get crop => 'Rajaa';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Vaihda Käyttäjänimi';

  @override
  String get fluxerTagInputLabel => 'Käyttäjänimi';

  @override
  String get fluxerTagDescriptionBase =>
      'Käyttäjänimet voivat sisältää vain kirjaimia (a-z, A-Z), numeroita (0-9) ja alaviivoja. Käyttäjänimet eivät erota isoja ja pieniä kirjaimia.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Käyttäjänimet voivat sisältää vain kirjaimia (a-z, A-Z), numeroita (0-9) ja alaviivoja. Käyttäjänimet eivät erota isoja ja pieniä kirjaimia. Voit valita minkä tahansa saatavilla olevan 4-numeroisen tunnisteen väliltä #0000–#9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Käyttäjänimet voivat sisältää vain kirjaimia (a-z, A-Z), numeroita (0-9) ja alaviivoja. Käyttäjänimet eivät erota isoja ja pieniä kirjaimia. Voit valita minkä tahansa saatavilla olevan 4-numeroisen tunnisteen väliltä #0001–#9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Välillä $min ja $max merkkiä';
  }

  @override
  String get validationAllowedChars =>
      'Vain kirjaimet (a-z, A-Z), numerot (0-9) ja alaviivat (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Hanki Plutonium räätäljätäksesi tunnisteesi tai säilyttääksesi sen muuttaessasi käyttäjänimeäsi';

  @override
  String get fluxerTagAlreadyTaken => 'Käyttäjänimi on jo käytössä';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Käyttäjänimi $username#$discriminator on jo käytössä. Jatkamalla numeroarvosi arvotaan automaattisesti uudelleen.';
  }

  @override
  String get customTagIsTemporary => 'Mukautettu tunniste on väliaikainen';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Mukautettu 4-numeroinen tunniste on käytettävissä vain Plutonium-tilauksesi ollessa aktiivinen. Kun tilauksesi päättyy $date, tunnisteesi palautuu satunnaisesti arvottuun numeroon 3 päivän armonaikaa jälkeen.';
  }

  @override
  String get customTagTemporaryBody =>
      'Mukautettu 4-numeroinen tunniste on käytettävissä vain Plutonium-tilauksesi ollessa aktiivinen. Kun tilauksesi päättyy, tunnisteesi palautuu satunnaisesti arvottuun numeroon 3 päivän armonaikaa jälkeen.';

  @override
  String get iUnderstandContinue => 'Ymmärrän, jatka';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Jos tallennat tämän Käyttäjänimi, mukautettu 4-numeroinen tunnisteesi palautuu satunnaiseksi numeroksi Plutonium-tilauksesi päättyessä. Jos tilauksesi ei uusiudu, sinulla on 3 päivän armonaika ennen kuin tunniste muuttuu.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Mukautettu 4-numeroinen tunnisteesi (#$discriminator) on aktiivinen Plutonium-tilauksesi ollessa aktiivinen. Jos tilauksesi päättyy tai ei uusiudu 3 päivän armonaikaa jälkeen, tunnisteesi palautuu satunnaiseksi numeroksi.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Mukauta 4-numeroista tunnisteesi tai säilytä se muuttaessasi käyttäjänimeäsi';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Plutonium-kokeilujaksosi päättyy $date. Päivitä säilyttääksesi mukautetun tunnisteesi ja ansaitaksesi merkin profiiliisi.';
  }

  @override
  String get premiumTrialActive =>
      'Olet Plutonium-kokeilujaksolla. Päivitä säilyttääksesi mukautetun tunnisteesi ja ansaitaksesi merkin profiiliisi.';

  @override
  String get fluxerTagUpdated => 'Käyttäjänimi päivitetty';

  @override
  String get fluxerTagUpdateFailed =>
      'Käyttäjänimi päivitys epäonnistui. Yritä uudelleen.';

  @override
  String get continueAction => 'Jatka';

  @override
  String get profileCustomizationTitle => 'Profiilin mukauttaminen';

  @override
  String get profileCustomizationDescription =>
      'Muokkaa profiilisi ulkoasua ja näe reaaliaikainen esikatselu';

  @override
  String get usernameLabel => 'Käyttäjänimi';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Vahvista tilisi muuttaaksesi Käyttäjänimi';

  @override
  String get changeFluxerTag => 'Vaihda Käyttäjänimi';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Mukauta 4-numeroinen tunnuksesi (#$discriminator) Plutoniumilla';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Vaihda käyttäjänimesi ja 4-numeroinen tunnuksesi';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Mukautettu tunnuksesi (#$discriminator) on sidottu Plutonium-tilaukseesi ja palautuu satunnaiseksi tunnukseksi, jos se vanhenee.';
  }

  @override
  String get displayNameLabel => 'Näyttönimi';

  @override
  String get pronounsLabel => 'Pronominit';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Vaihda avataria';

  @override
  String get removeAvatar => 'Poista avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Suositus: 512×512px';

  @override
  String get bannerLabel => 'Banneri';

  @override
  String get changeBanner => 'Vaihda banneria';

  @override
  String get removeBanner => 'Poista banneri';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Vähintään: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Korostusväri';

  @override
  String get accentColorDescription =>
      'Mukauttaa profiilisi reunuksen ja bannerin väriä';

  @override
  String get aboutMeLabel => 'Minusta';

  @override
  String get aboutMeHelperText =>
      'Voit käyttää linkkejä, hymiöitä ja Markdownia.';

  @override
  String get emojiPickerTitle => 'Hymiöt';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium-merkin yksityisyys';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Hallitse, miten Plutonium-merkkisi näytetään muille';

  @override
  String get hidePlutoniumBadgeLabel => 'Piilota Plutonium-merkki kokonaan';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Piilota Plutonium-merkkisi kokonaan muilta käyttäjiltä';

  @override
  String get hidePlutoniumPurchaseDate => 'Piilota Plutonium-ostopäivämäärä';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Piilota Plutonium-ostopäivämäärä ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Poista Plutoniumin ostopäivämäärä merkistäsi';

  @override
  String get maskVisionaryAsSubscription => 'Peitä Visionary tilauksena';

  @override
  String get maskVisionaryDescription =>
      'Näytä Visionary tavallisena tilauksena';

  @override
  String get hideVisionaryIdBadge => 'Piilota Visionary ID -merkki';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Piilota Visionary ID -merkki (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Poista Visionary ID -merkkisi';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Olet Plutonium-kokeilujaksolla – tilauksesi alkaa $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Tilauksesi alkaa automaattisesti, kun kokeilujaksosi päättyy. Ei vaadi toimenpiteitä.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Olet Plutonium-kokeilujaksolla, joka päättyy $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Olet Plutonium-kokeilujaksolla';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10MB. Suositus: 512×512px. Animoitu avatar (GIF) vaatii Plutoniumin.';

  @override
  String get bannerPlutoniumUpsell =>
      'Mukauta profiiliasi staattisella tai animoidulla bannerikuvalla, jotta se erottuu.';

  @override
  String get getPlutonium => 'Hanki Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Sovelluksen sisäiset ostokset eivät ole vielä saatavilla tällä alustalla. Pysy kuulolla – tulossa pian!';

  @override
  String get profilePreviewLabel => 'Esikatselu';

  @override
  String get profilePreviewMessage => 'Viesti';

  @override
  String get profilePreviewMemberSince => 'Fluxer-jäsen vuodesta';

  @override
  String get unclaimedAccountTitle => 'Lunastamaton tili';

  @override
  String get unclaimedAccountDescription =>
      'Tiliäsi ei ole vielä lunastettu. Ilman sähköpostia ja salasanaa saatat menettää pääsyn. Lunasta tilisi nyt varmistaaksesi sen.';

  @override
  String get claimAccount => 'Lunasta tili';

  @override
  String get profileTypeLabel => 'Profiilityyppi';

  @override
  String get profileTypeGlobal => 'Globaali profiili';

  @override
  String get profileTypeGuildDescription =>
      'Muokkaat yhteisökohtaista profiiliasi. Tämä profiili näkyy vain tässä yhteisössä ja ohittaa globaalin profiilisi.';

  @override
  String get communityNicknameLabel => 'Yhteisön lempinimi';

  @override
  String get perGuildPremiumUpsellText =>
      'Yhteisökohtaisen avatarin, bannerin, tehostevärin ja kuvauksen mukauttaminen vaatii Plutoniumia. Yhteisön lempinimi ja pronominit ovat ilmaisia kaikille.';

  @override
  String get avatarModeInherit => 'Käytä globaalia profiilia';

  @override
  String get avatarModeCustom => 'Käytä mukautettua kuvaa';

  @override
  String get avatarModeUnset => 'Älä näytä';

  @override
  String get profileSavedToast => 'Profiili päivitetty';

  @override
  String get profileEditButton => 'Muokkaa profiilia';

  @override
  String get profileNoteLabel => 'Huomautus';

  @override
  String get profileNoteVisibility => '(näkyy vain sinulle)';

  @override
  String get profileNoteEmpty => 'Ei vielä huomautusta.';

  @override
  String get sudoTitle => 'Vahvista henkilöllisyytesi';

  @override
  String get sudoDescription =>
      'Tämä toiminto vaatii vahvistuksen jatkaaksesi.';

  @override
  String get sudoAuthenticatorCode => 'Todennuskoodi';

  @override
  String get sudoMethodPassword => 'Salasana';

  @override
  String get sudoMethodTotp => 'Todennussovellus';

  @override
  String get sudoVerificationFailed =>
      'Vahvistus epäonnistui. Yritä uudelleen.';

  @override
  String get securityAccountTitle => 'Tili';

  @override
  String get securityAccountDescription =>
      'Hallitse sähköpostiasi, salasanaasi ja tilisi asetuksia';

  @override
  String get securitySectionTitle => 'Suojaus';

  @override
  String get securitySectionDescription =>
      'Suojaa tilisi kaksivaiheisella todennuksella ja tunnistautumisavaimilla';

  @override
  String get securityLoginEmailSectionTitle => 'Sähköpostiasetukset';

  @override
  String get securityLoginEmailSectionDescription =>
      'Hallitse sähköpostiosoitetta, jolla kirjaudut Fluxeriin';

  @override
  String get securityLoginEmailAddressLabel => 'Sähköpostiosoite';

  @override
  String get securityLoginNoEmailSet => 'Sähköpostiosoitetta ei ole määritetty';

  @override
  String get securityLoginChangeEmail => 'Vaihda sähköpostiosoite';

  @override
  String get securityLoginAddEmail => 'Lisää sähköpostiosoite';

  @override
  String get securityLoginReveal => 'Näytä';

  @override
  String get securityLoginHide => 'Piilota';

  @override
  String get securityLoginPasswordSectionTitle => 'Salasana';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Vaihda salasanasi pitääksesi tilisi turvassa';

  @override
  String get securityLoginCurrentPasswordLabel => 'Nykyinen salasana';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Viimeksi vaihdettu: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Viimeksi vaihdettu: Ei koskaan';

  @override
  String get securityLoginNoPasswordSet => 'Salasanaa ei ole määritetty';

  @override
  String get securityLoginChangePassword => 'Vaihda salasana';

  @override
  String get securityLoginSetPassword => 'Määritä salasana';

  @override
  String get passwordChangeTitle => 'Vaihda salasana';

  @override
  String get passwordChangeIntroDescription =>
      'Lähetämme vahvistuskoodin sähköpostiosoitteeseesi henkilöllisyytesi vahvistamiseksi ennen salasanan vaihtamista.';

  @override
  String get passwordChangeStart => 'Aloita';

  @override
  String get passwordChangeVerifyTitle => 'Vahvista sähköpostisi';

  @override
  String get passwordChangeVerifyDescription =>
      'Syötä sähköpostiosoitteeseesi lähetetty vahvistuskoodi.';

  @override
  String get passwordChangeVerificationCode => 'Vahvistuskoodi';

  @override
  String get passwordChangeVerify => 'Vahvista';

  @override
  String get passwordChangeNewPasswordTitle => 'Määritä uusi salasana';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Syötä uusi salasanasi alla.';

  @override
  String get passwordChangeNewPassword => 'Uusi salasana';

  @override
  String get passwordChangeConfirmPassword => 'Vahvista uusi salasana';

  @override
  String get passwordChangeSubmit => 'Vaihda salasana';

  @override
  String get passwordChangeSuccess => 'Salasana vaihdettu';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Salasanat eivät täsmää';

  @override
  String get passwordChangeInvalidCode => 'Virheellinen tai vanhentunut koodi';

  @override
  String get emailChangeTitle => 'Vaihda sähköposti';

  @override
  String get emailChangeIntroDescription =>
      'Lähetämme vahvistuskoodeja henkilöllisyytesi varmistamiseksi ennen sähköpostiosoitteen vaihtamista.';

  @override
  String get emailChangeStart => 'Aloita';

  @override
  String get emailChangeVerifyOriginalTitle => 'Varmista nykyinen sähköposti';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Syötä nykyiseen sähköpostiisi lähetetty vahvistuskoodi.';

  @override
  String get emailChangeNewEmailTitle => 'Syötä uusi sähköposti';

  @override
  String get emailChangeNewEmailDescription =>
      'Syötä uusi sähköpostiosoite, jota haluat käyttää.';

  @override
  String get emailChangeNewEmailLabel => 'Uusi sähköposti';

  @override
  String get emailChangeNewEmailSubmit => 'Lähetä vahvistuskoodi';

  @override
  String get emailChangeVerifyNewTitle => 'Varmista uusi sähköposti';

  @override
  String get emailChangeVerifyNewDescription =>
      'Syötä uuteen sähköpostiisi lähetetty vahvistuskoodi.';

  @override
  String get emailChangeSuccess => 'Sähköposti vaihdettu';

  @override
  String get emailChangeInvalidCode => 'Virheellinen tai vanhentunut koodi';

  @override
  String get resend => 'Lähetä uudelleen';

  @override
  String resendCountdown(int seconds) {
    return 'Lähetä uudelleen ($seconds s)';
  }

  @override
  String get verificationCode => 'Vahvistuskoodi';

  @override
  String get verify => 'Varmista';

  @override
  String get enable => 'Ota käyttöön';

  @override
  String get disable => 'Poista käytöstä';

  @override
  String get delete => 'Poista';

  @override
  String get save => 'Tallenna';

  @override
  String get securityTfaSectionTitle => 'Kaksivaiheinen tunnistautuminen';

  @override
  String get securityTfaSectionDescription =>
      'Lisää tilillesi ylimääräinen suojauskerros';

  @override
  String get securityTfaAuthenticatorApp => 'Tunnistussovellus';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Kaksivaiheinen tunnistautuminen on käytössä';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Käytä tunnistussovellusta koodien luomiseen kaksivaiheista tunnistautumista varten';

  @override
  String get securityTfaBackupCodes => 'Varmuuskoodit';

  @override
  String get securityTfaBackupCodesDescription =>
      'Näytä ja hallitse varmuuskoodejasi tilin palauttamiseksi';

  @override
  String get securityTfaViewCodes => 'Näytä koodit';

  @override
  String get securityPasskeysSectionTitle => 'Passiavain';

  @override
  String get securityPasskeysSectionDescription =>
      'Käytä passiavaimia salasanattomaan kirjautumiseen ja kaksivaiheiseen tunnistautumiseen';

  @override
  String get securityPasskeysRegistered => 'Rekisteröidyt passiavaimet';

  @override
  String get securityPasskeysNone => 'Ei rekisteröityjä passiavaimia';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passavainta',
      one: 'passavain',
    );
    return '$count $_temp0 rekisteröity (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Lisää passavain';

  @override
  String securityPasskeysAdded(String date) {
    return 'Lisätty: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Viimeksi käytetty: $date';
  }

  @override
  String get securityPasskeysRename => 'Nimeä uudelleen';

  @override
  String get securityPasskeysDeleteTitle => 'Poista passavain';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Haluatko varmasti poistaa passiavaimen \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nimeä passavain';

  @override
  String get securityPasskeyNameLabel => 'Passiavaimen nimi';

  @override
  String get securityPasskeyNameHint => 'esim. YubiKey, iPhone, työtietokone';

  @override
  String get securityPhoneSectionTitle => 'Puhelinnumero';

  @override
  String get securityPhoneSectionDescription => 'Hallitse puhelinnumeroasi';

  @override
  String get securityPhoneLabel => 'Puhelinnumero';

  @override
  String get securityPhoneNone => 'Puhelinnumeroa ei ole lisätty.';

  @override
  String get securityPhoneAdd => 'Lisää puhelinnumero';

  @override
  String get securityPhoneRemove => 'Poista';

  @override
  String get securityPhoneRemoveTitle => 'Poista puhelinnumero';

  @override
  String get securityPhoneRemoveDescription =>
      'Haluatko varmasti poistaa puhelinnumerosi?';

  @override
  String get securityPhoneRemoved => 'Puhelinnumero poistettu';

  @override
  String get securityClaimTitle => 'Suojausominaisuudet';

  @override
  String get securityClaimDescription =>
      'Varmista tilisi, jotta voit käyttää suojausominaisuuksia, kuten kaksivaiheista tunnistautumista ja passkey-avaimia.';

  @override
  String get securityVerifyEmailRequired =>
      'Sinun on vahvistettava sähköpostiosoitteesi ennen kuin voit ottaa käyttöön kaksivaiheisen tunnistautumisen, passkey-avaimet tai tekstiviestivahvistuksen.';

  @override
  String get totpEnableTitle => 'Ota käyttöön todennussovellus';

  @override
  String get totpEnableDescription =>
      'Skannaa QR-koodi todennussovelluksellasi luodaksesi koodeja kaksivaiheista tunnistautumista varten.';

  @override
  String get totpEnableCodeLabel => 'Koodi';

  @override
  String get totpEnableCodeHint =>
      'Syötä 6-numeroinen koodi todennussovelluksestasi';

  @override
  String get totpEnableSuccess =>
      'Kaksivaiheinen tunnistautuminen on otettu käyttöön';

  @override
  String get totpDisableTitle => 'Poista todennussovellus';

  @override
  String get totpDisableDescription =>
      'Poista kaksivaiheinen tunnistautuminen käytöstä syöttämällä 6-numeroinen koodi todennussovelluksestasi.';

  @override
  String get totpDisableSuccess =>
      'Kaksivaiheinen tunnistautuminen poistettu käytöstä';

  @override
  String get backupCodesTitle => 'Varmuuskoodit';

  @override
  String get backupCodesWarning =>
      'Jos menetät pääsyn todennussovellukseesi etkä löydä näitä koodeja, tilisi lukittuu pysyvästi. Lataa tai kopioi ne nyt ja säilytä ne turvallisessa paikassa.';

  @override
  String get backupCodesDownload => 'Lataa';

  @override
  String get backupCodesCopy => 'Kopioi';

  @override
  String get backupCodesCopied => 'Varmuuskoodit kopioitu leikepöydälle';

  @override
  String get backupCodesAcknowledge =>
      'Olen ladannut tai kopioinut varmuuskoodini ja tallentanut ne turvalliseen paikkaan.';

  @override
  String get backupCodesDone => 'Valmis';

  @override
  String get backupCodesViewTitle => 'Näytä varmuuskoodit';

  @override
  String get backupCodesViewDescription =>
      'Vahvistus saattaa olla tarpeen ennen varmuuskoodien näyttämistä.';

  @override
  String get phoneAddTitle => 'Lisää puhelinnumero';

  @override
  String get phoneAddLabel => 'Puhelinnumero';

  @override
  String get phoneAddHint => 'Syötä puhelinnumerosi';

  @override
  String get phoneAddFooter =>
      'Syötä puhelinnumerosi. Lähetämme sinulle vahvistuskoodin tekstiviestillä.';

  @override
  String get phoneAddSendCode => 'Lähetä koodi';

  @override
  String get phoneVerifyTitle => 'Vahvista puhelinnumero';

  @override
  String get phoneVerifyDescription =>
      'Syötä puhelinnumeroosi lähetetty vahvistuskoodi.';

  @override
  String get phoneAddSuccess => 'Puhelinnumero lisätty';

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
  String get dangerZoneSectionTitle => 'Vaaravyöhyke';

  @override
  String get dangerZoneSectionDescription =>
      'Peruuttamattomat ja tuhoisat toiminnot';

  @override
  String get dangerZoneDisableTitle => 'Poista tili käytöstä';

  @override
  String get dangerZoneDisableDescription =>
      'Poista tilisi väliaikaisesti käytöstä. Voit aktivoida sen uudelleen myöhemmin kirjautumalla sisään.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Tilin käytöstä poistaminen kirjaa sinut ulos kaikista istunnoista. Voit ottaa tilisi uudelleen käyttöön milloin tahansa kirjautumalla sisään uudelleen.';

  @override
  String get dangerZoneDeleteTitle => 'Poista tili';

  @override
  String get dangerZoneDeleteDescription =>
      'Poista tilisi ja kaikki siihen liittyvät tiedot pysyvästi. Tätä toimintoa ei voi peruuttaa.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Peruuta aktiivinen Plutonium-tilauksesi Plutonium-asetuksista ennen tilin poistamista.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Tiliä ei voi poistaa';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Et voi poistaa tiliäsi, jos omistat yhteisöjä. Siirrä ensin omistajuus seuraaville yhteisöille:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'ja $count muuta';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Siirrä omistajuus siirtymällä kohtaan $settingsPath ja käyttämällä siirrä omistajuus -vaihtoehtoa.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Haluatko varmasti poistaa tilisi? Tämä toiminto ajoittaa tilisi pysyvän poistamisen.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Voit peruuttaa poistoprosessin 14 päivän kuluessa';

  @override
  String get dangerZoneDeleteBullet2 =>
      '14 päivän kuluttua tilisi poistetaan pysyvästi';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Kun poistaminen on käsitelty, et voi palauttaa pääsyä tiliisi';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Et voi poistaa lähettämiäsi viestejä tilisi poistamisen jälkeen';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Jos haluat viedä tietosi tai poistaa viestisi ensin, käy Tietosuojapaneeli-osiossa Käyttäjäasetuksissa ennen jatkamista.';

  @override
  String get claimAccountTitle => 'Varmista tilisi';

  @override
  String get claimAccountDescription =>
      'Varmista tilisi lisäämällä sähköposti ja salasana. Lähetämme vahvistuskoodin sähköpostisi vahvistamiseksi ennen lopettamista.';

  @override
  String get claimAccountEmailLabel => 'Sähköposti';

  @override
  String get claimAccountPasswordLabel => 'Salasana';

  @override
  String get claimAccountSendCode => 'Lähetä koodi';

  @override
  String get claimAccountVerifyDescription =>
      'Syötä sähköpostiisi lähettämämme koodi vahvistaaksesi sen. Salasanasi asetetaan koodin vahvistamisen jälkeen.';

  @override
  String get claimAccountSuccess => 'Tili lunastettu onnistuneesti';

  @override
  String get importantInformation => 'Tärkeää tietoa:';

  @override
  String get genericError => 'Tapahtui virhe';

  @override
  String get networkErrorMessage => 'Something went wrong. Please try again.';

  @override
  String get invalidCode => 'Virheellinen koodi';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vuotta sitten',
      one: '1 vuosi sitten',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuukautta sitten',
      one: '1 kuukausi sitten',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count päivää sitten',
      one: '1 päivä sitten',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tuntia sitten',
      one: '1 tunti sitten',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuuttia sitten',
      one: '1 minuutti sitten',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'juuri nyt';

  @override
  String get authorizedAppsTitle => 'Valtuutetut sovellukset';

  @override
  String get authorizedAppsDescription =>
      'Näille sovelluksille on myönnetty pääsy Fluxer-tiliisi.';

  @override
  String get authorizedAppsEmptyTitle => 'Ei valtuutettuja sovelluksia';

  @override
  String get authorizedAppsEmptyDescription =>
      'Et ole valtuuttanut yhtään sovellusta käyttämään tiliäsi.';

  @override
  String get authorizedAppsLoadError =>
      'Valtuutettujen sovellusten lataaminen epäonnistui';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Valtuutettu $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Myönnetyt käyttöoikeudet';

  @override
  String get authorizedAppsRevoke => 'Peruuta';

  @override
  String get authorizedAppsRevokeTitle => 'Peruuta sovelluksen käyttöoikeus';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Haluatko varmasti peruuttaa $appName:n käyttöoikeuden? Tämä sovellus ei enää pääse käyttämään tiliäsi.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Käytä perustietojasi (käyttäjänimi, avatar jne.)';

  @override
  String get authorizedAppsScopeEmail => 'Näe sähköpostiosoitteesi';

  @override
  String get authorizedAppsScopeGuilds => 'Näe yhteisöt, joihin kuulut';

  @override
  String get authorizedAppsScopeConnections => 'Näe yhdistetyt tilisi';

  @override
  String get authorizedAppsScopeBot =>
      'Lisää botti yhteisöön pyydetyillä käyttöoikeuksilla';

  @override
  String get authorizedAppsScopeAdmin => 'Käytä hallintapäätepisteitä';

  @override
  String get privacyPendingDeletionTitle => 'Poisto odottaa';

  @override
  String get blockedUsersTitle => 'Estetyt käyttäjät';

  @override
  String get blockedUsersDescription =>
      'Estetyt käyttäjät eivät voi lähettää sinulle kaveripyyntöjä tai viestejä suoraan.';

  @override
  String get blockedUsersEmptyTitle => 'Ei estettyjä käyttäjiä';

  @override
  String get blockedUsersEmptyDescription => 'Et ole estänyt ketään vielä.';

  @override
  String get blockedUsersLoadError =>
      'Estettyjen käyttäjien lataaminen epäonnistui';

  @override
  String get blockedUsersUnblock => 'Poista esto';

  @override
  String get blockedUsersUnblockTitle => 'Poista käyttäjän esto';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Haluatko varmasti poistaa $username:n eston?';
  }

  @override
  String get blockedUsersCopyTag => 'Kopioi Käyttäjänimi';

  @override
  String get blockedUsersCopyId => 'Kopioi käyttäjän ID';

  @override
  String get userProfileLoadError => 'Profiilin lataaminen epäonnistui';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'Yritä uudelleen';

  @override
  String get userProfileMessage => 'Viesti';

  @override
  String get userProfileVoiceCall => 'Äänipuhelu';

  @override
  String get userProfileVideoCall => 'Videopuhelu';

  @override
  String get userProfileEditProfile => 'Muokkaa profiilia';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer-henkilökunta';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer-yhteisötiimi';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer-kumppani';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium -tilaaja vuodesta $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary vuodesta $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Yhteiset ystävät ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Yhteiset yhteisöt ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Yhteiset ystävät';

  @override
  String get userProfileMutualCommunitiesTitle => 'Yhteiset yhteisöt';

  @override
  String get userProfileNoMutualFriends => 'Yhteisiä ystäviä ei löytynyt.';

  @override
  String get userProfileNoMutualCommunities =>
      'Yhteisiä yhteisöjä ei löytynyt.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Lempinimi: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Avaa yksityisviesti';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Estit käyttäjän $username. Et voi lähettää viestejä, ellet poista estoa.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Poista esto';

  @override
  String get userProfileOpenDm => 'Avaa yksityisviesti';

  @override
  String get userProfileNoteTitle => 'Muistiinpano';

  @override
  String get userProfileNoteVisibility => '(näkyy vain sinulle)';

  @override
  String get userProfileNoteSave => 'Tallenna';

  @override
  String get userProfileNoteDelete => 'Poista';

  @override
  String get userProfileNoteEmpty => 'Napauta lisätäksesi muistiinpanon';

  @override
  String get userProfileMemberSince => 'Jäsen vuodesta';

  @override
  String get userProfileAboutMe => 'Minusta';

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
  String get userProfileCopyUsername => 'Kopioi käyttäjänimi';

  @override
  String get userProfileCopyUserId => 'Kopioi käyttäjä-ID';

  @override
  String get userProfileViewMainProfile => 'Näytä pääprofiili';

  @override
  String get userProfileViewCommunityProfile => 'Näytä yhteisöprofiili';

  @override
  String get userProfileBlockUser => 'Estä käyttäjä';

  @override
  String get userProfileUnblockUser => 'Poista käyttäjän esto';

  @override
  String get userProfileRemoveFriend => 'Poista ystävä';

  @override
  String get userProfileBlockConfirmTitle => 'Estä käyttäjä';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Haluatko varmasti estää käyttäjän $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Poista käyttäjän esto';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Haluatko varmasti poistaa käyttäjän $username eston?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Poista ystävä';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Haluatko varmasti poistaa $username ystävistäsi?';
  }

  @override
  String get userProfileFailedOpenDm => 'Yksityisviestin avaaminen epäonnistui';

  @override
  String get userProfileFailedSaveNote =>
      'Muistiinpanon tallentaminen epäonnistui';

  @override
  String get userProfileActionFailed => 'Toiminto epäonnistui, yritä uudelleen';

  @override
  String get userProfileChangeNickname => 'Vaihda lempinimi';

  @override
  String get userProfileKick => 'Poista';

  @override
  String get userProfileBan => 'Estä';

  @override
  String get userProfileTimeout => 'Aseta aikakatkaisu';

  @override
  String get userProfileRemoveTimeout => 'Poista aikakatkaisu';

  @override
  String get userProfileTransferOwnership => 'Siirrä omistajuus';

  @override
  String get userProfileReportUser => 'Ilmoita käyttäjästä';

  @override
  String get userProfileReportMessage => 'Ilmoita viestistä';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Poista $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Haluatko varmasti poistaa käyttäjän $username? Hän voi liittyä uudelleen uudella kutsulla.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Poistetaanko mykistys?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Mykistyksen poistaminen sallii käyttäjän $username lähettää viestejä, reagoida ja liittyä äänikanaville uudelleen.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Siirretäänkö omistajuus?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Siirretäänkö tämän yhteisön omistajuus käyttäjälle $username? Tämä on peruuttamaton, ja menetät kaikki omistajan oikeudet.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Estä käyttäjä $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Eston kesto';

  @override
  String get userProfileBanCustomSecondsLabel =>
      'Mukautettu kesto (sekunteina)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Mikä tahansa arvo $min ja $max sekunnin välillä';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Poista viestihistoria';

  @override
  String get userProfileBanDeleteNone => 'Älä poista mitään';

  @override
  String get userProfileBanDelete24h => 'Edelliset 24 tuntia';

  @override
  String get userProfileBanDelete7d => 'Edelliset 7 päivää';

  @override
  String get userProfileBanReasonLabel => 'Syy (valinnainen)';

  @override
  String get userProfileBanReasonHint => 'Syötä syy estolle';

  @override
  String get userProfileBanSubmit => 'Estä jäsen';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Mykistä käyttäjä $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Mykistyksen kesto';

  @override
  String get userProfileTimeoutSubmit => 'Mykistä jäsen';

  @override
  String get userProfileNicknameLabel => 'Lempinimi';

  @override
  String get userProfileNicknameHint => 'Syötä lempinimi';

  @override
  String get userProfileNicknameSave => 'Tallenna';

  @override
  String userProfileKickSuccess(String username) {
    return 'Käyttäjä $username poistettu';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Käyttäjä $username estetty';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Käyttäjä $username mykistetty';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Käyttäjän $username mykistys poistettu';
  }

  @override
  String get userProfileNicknameSuccess => 'Lempinimi päivitetty';

  @override
  String get userProfileTransferSuccess => 'Omistajuus siirretty';

  @override
  String get durationPermanent => 'Pysyvä';

  @override
  String get duration60Seconds => '60 sekuntia';

  @override
  String get duration5Minutes => '5 minuuttia';

  @override
  String get duration10Minutes => '10 minuuttia';

  @override
  String get duration1Hour => '1 tunti';

  @override
  String get duration12Hours => '12 tuntia';

  @override
  String get duration1Day => '1 päivä';

  @override
  String get duration3Days => '3 päivää';

  @override
  String get duration5Days => '5 päivää';

  @override
  String get duration1Week => '1 viikko';

  @override
  String get duration2Weeks => '2 viikkoa';

  @override
  String get duration1Month => '1 kuukausi';

  @override
  String get durationCustom => 'Mukautettu…';

  @override
  String get iarReportUserTitle => 'Ilmoita käyttäjästä';

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
  String get iarReasonInappropriateProfile => 'Sopimaton profiili';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Tämän käyttäjän profiili sisältää sopimatonta sisältöä';

  @override
  String typingIndicatorOne(String name) {
    return 'Käyttäjä $name kirjoittaa...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Käyttäjät $name1 ja $name2 kirjoittavat...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Käyttäjät $name1, $name2 ja $name3 kirjoittavat...';
  }

  @override
  String get typingIndicatorMultiple => 'Useampi henkilö kirjoittaa...';

  @override
  String get typingIndicatorHandful =>
      'Kourallinen näppäimistösotureita kokoontuu...';

  @override
  String get typingIndicatorSymphony =>
      'Näppäinten kilinän sinfonia on käynnissä...';

  @override
  String get typingIndicatorFiesta => 'Täällä on täysi kirjoitusjuhla';

  @override
  String get typingIndicatorApocalypse => 'Vau, mikä kirjoitusapokalypsi';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Kiva kun olet täällä, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Tervetuloa, $username! Ole kuin kotona.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Hei, $username! Kiva kun olet täällä.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Hei, $username! Liity keskusteluun, kun olet valmis.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hei $username, kiva nähdä sinut täällä!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hei $username! Toivottavasti viihdyt.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hei, $username, tervetuloa mukaan!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Kiva kun pääsit perille, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Tervetuloa, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Tervetuloa, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Tervetuloa, $username! Olemme iloisia, että olet täällä.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Tervetuloa, $username! Toivottavasti viihdyt täällä.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Tervetuloa, $username! Seuraava keskustelusi alkaa tästä.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Tervetuloa, $username. Olemme iloisia, että olet täällä.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Kiva nähdä sinut, $username! Tervetuloa.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Olet täällä, $username! Hyvä saada sinut mukaan.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Olet saapunut, $username! Aloitetaan.';
  }

  @override
  String get relativeTimeShortNow => 'nyt';

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
      other: '$count kk',
      one: '1 kk',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count v',
      one: '1 v',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Omat laitteeni';

  @override
  String get linkedDevicesDescription =>
      'Näet kaikki laitteet, jotka ovat tällä hetkellä kirjautuneena tilillesi. Peruuta kaikki tunnistamattomat istunnot.';

  @override
  String get linkedDevicesCurrentDevice => 'Nykyinen laite';

  @override
  String get linkedDevicesOtherDevices => 'Muut laitteet';

  @override
  String get linkedDevicesEnterSelection => 'Siirry valintatilaan';

  @override
  String get linkedDevicesExitSelection => 'Poistu valintatilasta';

  @override
  String get linkedDevicesSelectAll => 'Valitse kaikki';

  @override
  String get linkedDevicesClearSelection => 'Tyhjennä valinta';

  @override
  String get linkedDevicesRevokeTooltip => 'Peruuta laite';

  @override
  String get linkedDevicesSignOutAll =>
      'Kirjaa ulos kaikista muista laitteista';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kirjaa ulos $count laitetta',
      one: 'Kirjaa ulos 1 laite',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kirjaa ulos $count laitetta',
      one: 'Kirjaa ulos 1 laite',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Kirjaa ulos kaikista muista laitteista';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tämä kirjaa valitut laitteet ulos tililtäsi. Sinun on kirjauduttava uudelleen sisään kyseisillä laitteilla.',
      one:
          'Tämä kirjaa valitun laitteen ulos tililtäsi. Sinun on kirjauduttava uudelleen sisään kyseisellä laitteella.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Tämä kirjaa valitut laitteet ulos tililtäsi. Sinun on kirjauduttava uudelleen sisään kyseisillä laitteilla.';

  @override
  String get linkedDevicesSignOutConfirm => 'Jatka';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Sinun on kirjauduttava uudelleen sisään kaikilla ulos kirjatuilla laitteilla';

  @override
  String get linkedDevicesLoadErrorTitle => 'Verkkovirhe';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Yhteyden muodostamisessa aikakauttajatkumoon on ongelmia. Tarkista yhteytesi ja yritä uudelleen.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Laitteet peruutettu',
      one: 'Laite peruutettu',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Uloskirjautuminen epäonnistui. Yritä uudelleen.';

  @override
  String get linkedDevicesUnknownOs => 'Tuntematon käyttöjärjestelmä';

  @override
  String get linkedDevicesUnknownPlatform => 'Tuntematon alusta';

  @override
  String slowmodeLabel(String duration) {
    return '$duration hidastettu';
  }

  @override
  String get slowmodeTooltipActive =>
      'Olet hidastetussa tilassa. Odota ennen kuin lähetät uuden viestin.';

  @override
  String get slowmodeTooltipImmune =>
      'Hidastettu tila on käytössä, mutta olet immuuni sille.';

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
      'Et voi lähettää viestejä tässä kanavassa.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Järjestelmäilmoitukset $productName henkilökunnalta. Et voi vastata tähän.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Viestintä on tilapäisesti keskeytetty tässä yhteisössä.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Olet aikakatkaistu. Viestintä, reaktiot ja puhe ovat keskeytettyinä, kunnes aikakatkaisu päättyy.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Sinun on lunastettava tilisi lähettääksesi viestejä tässä yhteisössä.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Sinun on vahvistettava sähköpostisi lähettääksesi viestejä tässä yhteisössä.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Tilisi on liian uusi lähettääksesi viestejä tässä yhteisössä.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Et ole ollut tämän yhteisön jäsen tarpeeksi kauan lähettääksesi viestejä.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Sinun on vahvistettava puhelinnumero lähettääksesi viestejä tässä yhteisössä.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Vahvista sähköposti';

  @override
  String get channelComposerBarrierVerifyPhone => 'Vahvista puhelinnumero';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Liian monta liitettä (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Yksi tai useampi tiedosto ylittää kokorajoituksen';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Nämä tiedostot ovat liian suuria lähetettäväksi yhdessä';

  @override
  String get chatAttachmentDropToUpload => 'Pudota tiedostot ladattavaksi';

  @override
  String get chatAttachmentDropToSend => 'Pudota tiedostot lähetettäväksi nyt';

  @override
  String get chatAttachmentSendVoiceMessage => 'Lähetä ääniviesti';

  @override
  String get voiceMessageTitle => 'Ääniviesti';

  @override
  String get voiceMessageHoldHint =>
      'Paina ja pidä tallentaaksesi. Vedä ylös lukitaksesi tai vapauta lähettääksesi.';

  @override
  String get voiceMessageDiscard => 'Hylkää ääniviesti';

  @override
  String get voiceMessageSend => 'Lähetä ääniviesti';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Tallennusta ei voitu aloittaa. Salli mikrofonin käyttöoikeus.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Äänitallennus ei ole tuettu tässä laitteessa.';

  @override
  String get voiceMessageMicInUse =>
      'Poistu äänipuhelusta tallentaaksesi ääniviestin.';

  @override
  String get voiceMessageRecordingFailed =>
      'Tallennus epäonnistui. Yritä uudelleen.';

  @override
  String get voiceMessageSendFailed =>
      'Ääniviestiä ei voitu lähettää. Yritä uudelleen.';

  @override
  String get voiceMessageRecordingHint =>
      'Puhu nyt. Paina Lopeta, kun olet valmis – voit leikata myöhemmin.';

  @override
  String get voiceMessageReviewHint =>
      'Vedä kahvoja leikataksesi, paina sitten Lähetä.';

  @override
  String get voiceMessageStop => 'Lopeta';

  @override
  String get voiceMessageStartRecording => 'Aloita tallennus';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Toista';

  @override
  String get voiceMessagePause => 'Keskeytä';

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

    return 'Valinnan on oltava vähintään ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Muokkaa liitettä';

  @override
  String get chatAttachmentFilenameLabel => 'Tiedostonimi';

  @override
  String get chatAttachmentDescriptionLabel => 'Kuvaus';

  @override
  String get chatAttachmentDescriptionHint =>
      'Valinnainen vaihtoehtoinen teksti';

  @override
  String get chatAttachmentSpoilerLabel => 'Merkitse spoileriksi';

  @override
  String get chatAttachmentRemove => 'Poista liite';

  @override
  String get chatAttachmentDownload => 'Lataa';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Liite vanhentunut';

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
  String get chatAttachmentSourceGallery => 'Galleria';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Selaa tiedostoja';

  @override
  String get chatAttachmentPasteTooltip => 'Liitä kuva leikepöydältä';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Paljasta spoiler';

  @override
  String get matureMediaRevealButton => 'Paljasta';

  @override
  String get matureMediaRevealHint => 'Napsauta paljastaaksesi';

  @override
  String get matureContentTitle => 'Arkaluontoinen sisältö';

  @override
  String get matureCommunityTitle => 'Kypsälle merkitty yhteisö';

  @override
  String get matureCategoryTitle => 'Kypsälle merkitty kategoria';

  @override
  String get matureChannelTitle => 'Kypsälle merkitty kanava';

  @override
  String get communityContentWarningTitle => 'Yhteisön sisältövaroitus';

  @override
  String get categoryContentWarningTitle => 'Kategorian sisältövaroitus';

  @override
  String get channelContentWarningTitle => 'Kanavan sisältövaroitus';

  @override
  String get defaultContentWarningBody =>
      'Tämä sisältää arkaluontoista sisältöä.';

  @override
  String get matureCommunityBody =>
      'Tämä yhteisö on merkitty kypsälle sisällölle ja saattaa sisältää materiaalia, joka ei sovi kaikille käyttäjille.';

  @override
  String get matureCategoryBody =>
      'Tämä kategoria on merkitty kypsälle sisällölle ja saattaa sisältää materiaalia, joka ei sovi kaikille käyttäjille.';

  @override
  String get matureChannelBody =>
      'Tämä kanava on merkitty kypsälle sisällölle ja saattaa sisältää materiaalia, joka ei sovi kaikille käyttäjille.';

  @override
  String get matureVoiceChannelBody =>
      'Tämä äänikanava on merkitty kypsälle sisällölle ja saattaa sisältää materiaalia, joka ei sovi kaikille käyttäjille.';

  @override
  String get matureLinkChannelBody =>
      'Tämä linkkikanava on merkitty kypsälle sisällölle ja saattaa avata materiaalia, joka ei sovi kaikille käyttäjille.';

  @override
  String get matureCommunityUnavailableBody =>
      'Tämä kypsälle merkitty yhteisö ei ole tilisi saatavilla.';

  @override
  String get matureCategoryUnavailableBody =>
      'Tämä kypsälle merkitty kategoria ei ole tilisi saatavilla.';

  @override
  String get matureChannelUnavailableBody =>
      'Tämä kypsälle merkitty kanava ei ole tilisi saatavilla.';

  @override
  String get matureContentProceedButton => 'Jatka';

  @override
  String get matureContentUnderstandButton => 'Ymmärrän';

  @override
  String get matureContentOpenLinkButton => 'Avaa linkki';

  @override
  String get sensitiveContentSectionTitle => 'Arkaluontoinen sisältö';

  @override
  String get sensitiveContentSectionDescription =>
      'Hallitse, miten kypsää tai arkaluontoista mediaa suodatetaan eri yhteyksissä';

  @override
  String get sensitiveContentFriendDmLabel => 'Suorat viestit ystäviltä';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Suorat viestit muilta';

  @override
  String get sensitiveContentGuildLabel => 'Viestit yhteisökanavilla';

  @override
  String get sensitiveContentFilterShow => 'Näytä';

  @override
  String get sensitiveContentFilterBlur => 'Sumenna';

  @override
  String get sensitiveContentFilterBlock => 'Estä';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Sumenna media turvatarkistuksen valmistumiseen asti';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Kun tämä on käytössä, kuvat ja videot sumennetaan, kunnes sisältötarkistus valmistuu.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Tämä asetus on aina käytössä tililläsi.';

  @override
  String get sensitiveContentResetButton => 'Nollaa';

  @override
  String get sensitiveContentSaveButton => 'Tallenna';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tiedostoa',
      one: '1 tiedosto',
    );
    return 'Ladataan $_temp0';
  }

  @override
  String get chatCancelUpload => 'Peruuta lataus';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Vanhenee $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Vanhenee välillä $start ja $end';
  }

  @override
  String get connectionsTitle => 'Yhteydet';

  @override
  String get connectionsDescription =>
      'Linkitä ulkoisia tilejä ja verkkotunnuksia Fluxer-profiiliisi. Vahvistetut yhteydet näytetään profiilissasi muiden nähtävillä.';

  @override
  String get connectionsEmptyTitle => 'Ei yhteyksiä vielä';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Linkitä Bluesky-tilisi tai vahvista verkkotunnuksen omistajuus näyttääksesi ne profiilissasi.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Vahvista verkkotunnuksen omistajuus näyttääksesi sen profiilissasi.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Verkkotunnus';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Lisää Bluesky-yhteys';

  @override
  String get connectionsAddDomainAriaLabel => 'Lisää verkkotunnusyhteys';

  @override
  String get connectionEdit => 'Muokkaa';

  @override
  String get connectionRemove => 'Poista';

  @override
  String get connectionVerifiedLabel => 'Tämä yhteys on vahvistettu.';

  @override
  String get connectionUnverifiedLabel => 'Tätä yhteyttä ei ole vahvistettu.';

  @override
  String get connectionAddTitle => 'Lisää yhteys';

  @override
  String get connectionTypeLabel => 'Yhteyden tyyppi';

  @override
  String get connectionHandleLabel => 'Käyttäjätunnus';

  @override
  String get connectionDomainLabel => 'Verkkotunnus';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Sinulla on jo tämä yhteys.';

  @override
  String get connectionConnectBluesky => 'Yhdistä Blueskyllä';

  @override
  String get connectionContinue => 'Jatka';

  @override
  String get connectionVerifyTitle => 'Vahvista yhteys';

  @override
  String get connectionVerifyInstructions =>
      'Käytä alla olevaa tietoa verkkotunnuksen omistajuuden todistamiseen.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT -tietue';

  @override
  String get connectionDnsHostLabel => 'Isäntä';

  @override
  String get connectionDnsValueLabel => 'Arvo';

  @override
  String get connectionCopyHost => 'Kopioi isäntä';

  @override
  String get connectionCopyValue => 'Kopioi arvo';

  @override
  String get connectionCopied => 'Kopioitu!';

  @override
  String get connectionTokenFileTitle => 'Tarjoa tunnistetiedostosi';

  @override
  String get connectionTokenFileDescription =>
      'Lataa **fluxer-verification** ja sijoita se **.well-known** -kansioosi, jotta voimme vahvistaa verkkotunnuksen.';

  @override
  String get connectionTokenFileDownload => 'Lataa fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Tiedosto sisältää vahvistustunnisteen, jonka haemme osoitteesta **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Tallenna fluxer-verification';

  @override
  String get connectionVerifyButton => 'Vahvista';

  @override
  String get connectionBack => 'Takaisin';

  @override
  String get connectionEditTitle => 'Muokkaa yhteyttä';

  @override
  String get connectionEditDescription =>
      'Valitse, kuka voi nähdä tämän yhteyden profiilissasi.';

  @override
  String get connectionVisibilityEveryone => 'Kaikki';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Salli kenen tahansa nähdä tämä yhteys profiilissasi';

  @override
  String get connectionVisibilityFriends => 'Ystävät';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Salli ystäviesi nähdä tämä yhteys';

  @override
  String get connectionVisibilityCommunityMembers => 'Yhteisön jäsenet';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Salli yhteisöjesi jäsenten nähdä tämä yhteys';

  @override
  String get connectionRemoveTitle => 'Poista yhteys';

  @override
  String get connectionRemoveDescription =>
      'Haluatko varmasti poistaa tämän yhteyden? Tätä toimintoa ei voi peruuttaa.';

  @override
  String get connectionRemoveConfirm => 'Poista';

  @override
  String get connectionsLoadError => 'Yhteyksien lataaminen epäonnistui';

  @override
  String get connectionsReorderError => 'Järjestyksen päivitys epäonnistui';

  @override
  String get connectionInitiateFailed =>
      'Vahvistuksen aloittaminen epäonnistui. Yritä uudelleen.';

  @override
  String get connectionVerifyFailed =>
      'Vahvistaminen epäonnistui. Tarkista DNS-tietueesi ja yritä uudelleen.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Bluesky-valtuutuksen aloittaminen epäonnistui.';

  @override
  String get connectionUpdateFailed => 'Yhteyden päivittäminen epäonnistui';

  @override
  String get connectionRemoveFailed => 'Yhteyden poistaminen epäonnistui';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification tallennettu';

  @override
  String get connectionTokenSaveFailedToast =>
      'Tiedoston tallentaminen epäonnistui';

  @override
  String get connectionEnterHandle => 'Syötä Bluesky-käyttäjätunnus.';

  @override
  String get connectionEnterDomain => 'Syötä verkkotunnus.';

  @override
  String get lookAndFeelTitle => 'Ulkoasu';

  @override
  String get lookAndFeelThemeSectionTitle => 'Teema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Valitse tumman, hiilenmustan tai vaalean ulkoasun välillä.';

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
  String get lookAndFeelThemeDark => 'Tumma teema';

  @override
  String get lookAndFeelThemeCoal => 'Hiiliteema';

  @override
  String get lookAndFeelThemeLight => 'Vaalea teema';

  @override
  String get lookAndFeelThemeSystem => 'Järjestelmän teema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synkronoi teema laitteiden välillä';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Kun käytössä teeman muutokset synkronoidaan kaikkiin laitteisiisi. Kun poissa käytöstä, tämä laite käyttää omaa teema-asetustaan.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Järjestelmäteema poistaa synkronoinnin automaattisesti käytöstä seuratakseen järjestelmäsi asetusta tällä laitteella.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Teeman synkronointi tiliisi epäonnistui. Yritä uudelleen.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Keskustelun fonttikoko';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Säädä fonttikokoa keskustelualueella.';

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
  String get lookAndFeelInterfaceTitle => 'Käyttöliittymä';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Mukauta käyttöliittymän elementtejä ja toimintoja.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Kanavalistan kirjoitusilmaisimet';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Valitse, miten kirjoitusilmaisimet näkyvät kanavalistassa, kun joku kirjoittaa kanavalla.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Kirjoitusilmaisin + avatarit';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Näytä kirjoitusilmaisin käyttäjien avatarien kanssa kanavalistassa';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Vain kirjoitusilmaisin';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Näytä vain kirjoitusilmaisin ilman avatareja';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Piilotettu';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Älä näytä kirjoitusilmaisimia kanavalistassa';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Näytä kirjoitus valitussa kanavassa';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Kun poissa käytöstä (oletus), kirjoitusilmaisimia ei näytetä kanavalla, jota katsot parhaillaan.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'yleinen';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Näppäimistöohjeet';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Hallitse, näkyvätkö näppäimistön pikakuvakeohjeet työkaluvihjeissä.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Piilota näppäimistöohjeet työkaluvihjeissä';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Kun käytössä, pikakuvakeilmaisimet piilotetaan työkaluvihjeiden ponnahdusikkunoissa.';

  @override
  String get lookAndFeelNekoTitle => 'Muut';

  @override
  String get lookAndFeelNekoDescription => 'Muut käyttöliittymävaihtoehdot.';

  @override
  String get lookAndFeelShowNekoLabel => 'Näytä Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Kun käytössä, Neko ilmestyy keskustelun syöttökentän lähelle.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Äänikanavan liittymiskäyttäytyminen';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Hallitse, miten liityt äänikanaville yhteisöissä.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Vaadi kaksoisnapsautus äänikanaville liittymiseksi';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Kun käytössä, sinun on kaksoisnapsautettava äänikanavia liittyäksesi niihin. Kun poissa käytöstä (oletus), yksittäinen napsautus liittää kanavalle välittömästi.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Nopea ruskea kettu hyppää laiskan koiran yli.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Palvelinvalikko';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Määritä, miten palvelinvalikko näyttää suorat viestit.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count yhteisöä ei ole väliaikaisesti käytettävissä flux capacitor -vian vuoksi.',
      one:
          '1 yhteisö ei ole väliaikaisesti käytettävissä flux capacitor -vian vuoksi.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Kokoa yksityisviestit kansioon';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Kun käytössä, lukemattomat yksityisviestit palvelinvalikossa kootaan Fluxer-painikkeen kansioon. Napsauta Fluxer-painiketta DM-sivulla laajentaaksesi tai kootaksesi kansion.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanavalista';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Hallitse lukemattomien ilmaisimien toimintaa mykistetyissä kanavissa kanavalistoissa.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Näytä lukemattomien ilmaisin mykistetyissä kanavissa';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Kun käytössä, mykistetyt kanavat näyttävät himmeän lukemattomien ilmaisimen vasemmalla puolella. Maininnat näkyvät edelleen tämän asetuksen mukaisesti.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Nyt aktiiviset';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Hallitse, miten Nyt aktiiviset näkyvät sovelluksessa.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Näytä Nyt aktiiviset aloitusnäytössä';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Näytä Nyt aktiiviset aloitusnäytössä, jotta näet äänikanavilla aktiiviset ystäväsi. Näet esikatselun, kanavan kontekstin, ketkä ovat jo paikalla ja nopean tavan liittyä.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Suosikit';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Hallitse suosikkien näkyvyyttä kaikkialla sovelluksessa.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Ota suosikit käyttöön';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Kun käytössä, voit lisätä kanavia suosikkeihin ja ne näkyvät Suosikit-osiossa. Kun poissa käytöstä, kaikki suosikkeihin liittyvät käyttöliittymäelementit (painikkeet, valikkokohteet) piilotetaan. Nykyiset suosikkisi säilytetään.';

  @override
  String get favoritesTitle => 'Suosikit';

  @override
  String get favoritesEmptyTitle => 'Ei vielä suosikkeja';

  @override
  String get favoritesEmptyDescription =>
      'Tähtää kanavia chat-otsikosta pitääksesi ne täällä.';

  @override
  String get favoritesWelcomeTitle => 'Tervetuloa suosikkeihin';

  @override
  String get favoritesWelcomeDescription =>
      'Henkilökohtainen tilasi nopeaan pääsyyn kanaviin, yksityisviesteihin ja ryhmiin, joista pidät. Paina tähteä missä tahansa kanavassa lisätäksesi sen tänne.';

  @override
  String get favoritesWelcomeTip =>
      'Ei sinua varten? Voit poistaa sen käytöstä milloin tahansa.';

  @override
  String get favoritesDisableButton => 'Poista suosikit käytöstä';

  @override
  String get favoritesAddedToast => 'Lisätty suosikkeihin';

  @override
  String get favoritesRemovedToast => 'Poistettu suosikeista';

  @override
  String get favoritesHiddenToast => 'Suosikit piilotettu';

  @override
  String get favoritesMute => 'Mykistä suosikit';

  @override
  String get favoritesUnmute => 'Poista suosikkien mykistys';

  @override
  String get favoritesHeaderMenu => 'Suosikkien valikko';

  @override
  String get favoritesCreateCategory => 'Luo kategoria';

  @override
  String get favoritesCategoryNameLabel => 'Kategorian nimi';

  @override
  String get favoritesHideMutedChannels => 'Piilota mykistetyt kanavat';

  @override
  String get favoritesShowMutedChannels => 'Näytä mykistetyt kanavat';

  @override
  String get favoritesSetNickname => 'Aseta lempinimi';

  @override
  String get favoritesNicknameLabel => 'Lempinimi';

  @override
  String get favoritesSaveNickname => 'Tallenna lempinimi';

  @override
  String get favoritesMoveToCategory => 'Siirrä kategoriaan';

  @override
  String get favoritesUncategorized => 'Luokittelemattomat';

  @override
  String get favoritesOtherCategory => 'Muu';

  @override
  String get favoritesRemoveFromFavorites => 'Poista suosikeista';

  @override
  String get favoritesAddToFavorites => 'Lisää suosikkeihin';

  @override
  String get favoritesHideConfirmTitle => 'Piilota suosikit';

  @override
  String get favoritesHideConfirmDescription =>
      'Tämä piilottaa kaikki suosikkeihin liittyvät käyttöliittymäelementit, mukaan lukien painikkeet ja valikkokohteet. Nykyiset suosikkisi säilytetään ja ne voidaan ottaa uudelleen käyttöön milloin tahansa kohdasta Asetukset > Lisäasetukset > Ulkoasu.';

  @override
  String get favoritesDirectMessageSubtitle => 'Suora viesti';

  @override
  String get messagesMediaDisplayGroupTitle => 'Näyttö';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Hallitse viestien, median ja muun sisällön näyttämistä.';

  @override
  String get messagesMediaMediaGroupTitle => 'Media';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Mukauta median kokomieltymyksiä ja painikkeita.';

  @override
  String get messagesMediaInputGroupTitle => 'Syöte';

  @override
  String get messagesMediaInputGroupDescription =>
      'Mukauta viestinsyötön asetuksia.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Sivupalkki';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Määritä, miten yhteisön sivupalkki näytetään.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Piilota mykistetyt kanavat oletuksena';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Piilota mykistetyt kanavat automaattisesti sivupalkista, kun liityt uusiin yhteisöihin';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Piilota mykistetyt kanavat oletuksena?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Uusista yhteisöistä, joihin liityt, mykistetyt kanavat piilotetaan automaattisesti. Haluatko soveltaa tätä asetusta myös kaikkiin nykyisiin yhteisöihisi?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Lopeta mykistettyjen kanavien piilottaminen oletuksena?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Uusista yhteisöistä, joihin liityt, mykistetyt kanavat eivät enää piiloudu automaattisesti. Haluatko myös näyttää mykistetyt kanavat kaikissa nykyisissä yhteisöissäsi?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Käytä kaikkiin yhteisöihin';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Näytä kaikissa yhteisöissä';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Vain uudet yhteisöt';

  @override
  String get messagesMediaDisplaySectionTitle => 'Median näyttö';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Hallitse kuvien, videoiden ja muun median näyttämistä. Kaikki media skaalataan ja muunnetaan. Erittäin suuria tiedostoja, joita ei voida pakata esikatseluun, ei upoteta näistä asetuksista riippumatta.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Kun lähetetty linkkeinä chattiin';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Kun ladattu suoraan Fluxeriin';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Linkkien esikatselut';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Hallitse, miten verkkosivustolinkit esikatsellaan chatissa';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Näytä upotukset ja esikatsele verkkosivustolinkkejä';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaktiot';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Määritä hymiö-reaktiot viesteihin';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Näytä hymiö-reaktiot viesteissä';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoilerisisältö';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Hallitse spoilerisisällön näyttämistä';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Näytä spoilerisisältö';

  @override
  String get messagesMediaSpoilersOnClickName => 'Napsautettaessa';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Näytä spoilerisisältö napsautettaessa';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Kanavilla, joita moderoin';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Näytä aina spoilerisisältö kanavilla, joissa sinulla on \"Hallitse viestejä\" -oikeus';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Aina';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Näytä aina spoilerisisältö';

  @override
  String get messagesMediaSizeSectionTitle => 'Median kokomääritykset';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Mukauta upotetun ja liitetyn median enimmäisnäyttökokoa. Pienemmät koot käyttävät vähemmän näyttötilaa, kun taas suuremmat koot näyttävät enemmän yksityiskohtia.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Linkkien media (upotukset)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Ladattujen liitteiden media';

  @override
  String get messagesMediaSizeCompactName => 'Tiivis (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Pienempi median koko';

  @override
  String get messagesMediaSizeComfortableName => 'Mukava (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Suurempi median koko enemmän yksityiskohtia';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF-toiminta';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Hallitse GIF-tiedostojen lisäämistä chat-keskusteluun';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Lähetä GIF-tiedostot automaattisesti valittaessa';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Ilmeiden automaattinen täydennys (kaksoispisteen automaattinen täydennys)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Hallitse, mitä ilmeiden automaattisessa täydennyksessä näkyy, kun kirjoitat kaksoispisteen. Mukauta, mitä ehdotuksia näytetään mieltymystesi mukaan.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Näytä oletusemojit ilmeiden automaattisessa täydennyksessä';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Näytä mukautetut emojit ilmeiden automaattisessa täydennyksessä';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Näytä tarrat ilmeiden automaattisessa täydennyksessä';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Näytä tallennettu media ilmeiden automaattisessa täydennyksessä';

  @override
  String get messagesMediaEditingSectionTitle => 'Viestien muokkaus';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Hallitse, mitä tapahtuu muokkausluonnokselle, kun peruutat.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Säilytä muokkausluonnos peruutettaessa';

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
      'Suorien viestien esikatselut';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Hallitse, milloin viestien esikatselut näytetään suorien viestien luettelossa.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Suorien viestien esikatselutila';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Kaikki viestit';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Näytä viestien esikatselut kaikista suorista viestikeskusteluista';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Vain lukemattomat suorat viestit';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Näytä viestien esikatselut vain suorista viesteistä, joissa on lukemattomia viestejä';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ei mitään';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Älä näytä viestien esikatseluita suorien viestien luettelossa';

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
  String get dmListSentAnAttachment => 'Lähetetty liite';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username kiinnitti viestin tähän kanavaan.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username lisäsi $userName ryhmään.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username lisäsi jonkun ryhmään.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username on poistunut ryhmästä.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username poisti käyttäjän $userName ryhmästä.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username poisti jonkun ryhmästä.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username muutti kanavan nimeksi $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username muutti kanavan nimeä.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username muutti kanavan kuvaketta.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username aloitti puhelun.';
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
  String get voiceConnectionConfirmTitle => 'Äänipuheluyhteyden vahvistus';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Olet jo yhdistetty tähän äänikanavaan $count muusta laitteesta. Mitä haluat tehdä?',
      one:
          'Olet jo yhdistetty tähän äänikanavaan 1 muusta laitteesta. Mitä haluat tehdä?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Vaihda tähän laitteeseen';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Liity vain (pidä muut yhteydet)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Älä tee mitään, en halua liittyä';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Tämä on äänikanava. Yhdistä aloittaaksesi puhumisen!';

  @override
  String get voiceChannelJoin => 'Liity äänikanavaan';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Yhdistä ääneen';

  @override
  String get voiceChannelNoConnectPermission =>
      'Sinulla ei ole lupaa liittyä tähän äänikanavaan';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofonin, kameran ja näytönjaon sisältö on päästä päähän salattua.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofonin, kameran ja näytönjaon sisältö on päästä päähän salattua.';

  @override
  String get voiceChannelE2eeBroken =>
      'Päästä päähän -salaus ei ole käytettävissä, koska tällä äänikanavalla on yhteensopimaton osallistuja.';

  @override
  String get voiceCallE2eeBroken =>
      'Päästä päähän -salaus ei ole käytettävissä, koska tässä puhelussa on yhteensopimaton osallistuja.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Tämä asiakasohjelma on päivitettävä ennen tähän salattuun puheluun liittymistä.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Mikrofonin käynnistäminen epäonnistui. Olet edelleen puhelussa.';

  @override
  String get voiceChannelStatusConnecting => 'Yhdistetään...';

  @override
  String get voiceChannelStatusConnected => 'Yhdistetty';

  @override
  String get voiceChannelStatusError => 'Virhe';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobiililaite';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Tietokonelaite';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Yhteisön mykistämä';

  @override
  String get voiceParticipantTooltipMuted => 'Mykistetty';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Yhteisön kuurottama';

  @override
  String get voiceParticipantTooltipDeafened => 'Kuurottunut';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Yhteys: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count osallistujaa',
      one: '1 osallistuja',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Poistu';

  @override
  String get voiceControlMute => 'Mykistä';

  @override
  String get voiceControlUnmute => 'Poista mykistys';

  @override
  String get voiceControlDeafen => 'Kuurota';

  @override
  String get voiceControlUndeafen => 'Poista kuurotus';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Näytönjako';

  @override
  String get voiceScreenShareNotificationText => 'Näyttösi jaetaan.';

  @override
  String get voiceControlMore => 'Lisää';

  @override
  String get voiceControlDisconnect => 'Katkaise yhteys';

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
  String get voicePrioritizeSpeakersLabel => 'Prioritize speakers';

  @override
  String get voiceTextChatShow => 'Näytä chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# lukematonta viestiä',
      one: '# lukematon viesti',
    );
    return 'Näytä chat, jossa on $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Kameran käyttöoikeus vaaditaan videota varten.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Näytönjaon käynnistäminen epäonnistui. Yritä uudelleen.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Näytönjaon käyttöoikeus evättiin.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Näytönjako ei ole käytettävissä tässä laitteessa.';

  @override
  String get voiceWatchStream => 'Katso striimiä';

  @override
  String get voiceStopWatching => 'Lopeta katselu';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Lopeta nykyisen striimin katselu';

  @override
  String get voiceOwnScreenShareTitle => 'Lähetät';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Striimisi on livenä osallistujille.';

  @override
  String get voiceLiveBadge => 'LIVE';

  @override
  String get dmVoiceViewCall => 'Näytä puhelu';

  @override
  String get dmVoiceCallFullScreen => 'Koko näyttö';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Avaa puhelu koko näytölle';

  @override
  String get dmVoiceStripStatusConnecting => 'Yhdistetään…';

  @override
  String get dmVoiceStripStatusInCall => 'Puhelussa';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Äänipuhelu';

  @override
  String get dmVoiceCallBarConnecting => 'Yhdistetään…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Suora puhelu';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Ryhmäpuhelu';

  @override
  String get dmVoiceCallBarIssueFallback => 'Ääniongelma';

  @override
  String get dmVoiceFullscreenTitle => 'Ääni';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Ääni yhdistetty';

  @override
  String get notificationsPageTitle => 'Ilmoitukset';

  @override
  String get notificationsFilterUnreads => 'Lukemattomat';

  @override
  String get notificationsFilterMentions => 'Maininnat';

  @override
  String get notificationsBookmarksTooltip => 'Kirjanmerkit';

  @override
  String get notificationsMentionFilterTooltip => 'Suodata mainintoja';

  @override
  String get notificationsMentionFiltersTitle => 'Mainintasuodattimet';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Sisällytä @kaikki- ja @tässä-maininnat';

  @override
  String get notificationsMentionIncludeRoles => 'Sisällytä roolien maininnat';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Sisällytä kaikki yhteisön maininnat';

  @override
  String get notificationsNoUnreadTitle => 'Ei lukemattomia viestejä';

  @override
  String get notificationsNoUnreadBody => 'Olet ajan tasalla.';

  @override
  String get notificationsNoMentionsTitle => 'Ei viimeaikaisia mainintoja';

  @override
  String get notificationsNoMentionsBody =>
      'Kaikki sinua koskevat @maininnat näkyvät täällä 7 päivän ajan.';

  @override
  String get notificationsMentionsEndTitle => 'Olet saavuttanut lopun';

  @override
  String get notificationsMentionsEndBody =>
      'Olet nähnyt kaikki viimeaikaiset mainintasi. Älä huoli, lisää ilmestyy pian.';

  @override
  String get notificationsJump => 'Siirry';

  @override
  String get notificationsRemoveMentionTooltip => 'Poista maininta';

  @override
  String get notificationsViewAllUnread => 'Näytä kaikki lukemattomat';

  @override
  String get notificationsMarkAsRead => 'Merkitse luetuksi';

  @override
  String get notificationsExpand => 'Laajenna';

  @override
  String get notificationsCollapse => 'Kutista';

  @override
  String get notificationsMessageUnavailable => 'Tätä viestiä ei voitu ladata.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining merkkiä jäljellä';
  }

  @override
  String get characterCounterTooLong => 'Viesti on liian pitkä';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining merkkiä jäljellä. Hanki $productName kirjoittaaksesi jopa $premiumMaxLength merkkiä.';
  }

  @override
  String get chatMessageFailedToSend => 'Viestin lähettäminen epäonnistui';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Viestiäsi ei voitu toimittaa. Tämä johtuu yleensä siitä, että et jaa yhteisöä vastaanottajan kanssa tai vastaanottaja hyväksyy suoria viestejä vain ystäviltä. Saatat myös joutua säätämään omia suorien viestien yksityisyysasetuksiasi kohdassa $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Viestiäsi ei voitu toimittaa. Sinun on lunastettava tilisi lähettääksesi suoria viestejä.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Viestiäsi ei voitu toimittaa. Sinun on lunastettava tilisi lähettääksesi viestejä.';

  @override
  String get chatSendFailureContentBlocked =>
      'Viestiäsi ei voitu toimittaa, koska turvajärjestelmämme liputtivat sen. Jos uskot tämän olevan virhe, ota yhteyttä tukeen.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Viestiäsi ei voitu toimittaa, koska se sisälsi aikuisille tarkoitettuja hymiöitä tai tarroja, joita ei sallita tässä yhteydessä.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Vain sinä näet tämän viestin.';

  @override
  String get chatClientSystemDismiss => 'Hylkää';

  @override
  String get privacyDashboardCommunicationSection => 'Viestintä';

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
  String get chatMessageDeleteFailed => 'Viestin poisto epäonnistui';

  @override
  String get chatMessageAddReaction => 'Lisää reaktio';

  @override
  String get chatMessageEdit => 'Muokkaa viestiä';

  @override
  String get chatMessageReply => 'Vastaa';

  @override
  String get chatMessageForward => 'Välitä';

  @override
  String get forwardMessageTitle => 'Välitä viesti';

  @override
  String get forwardSearchHint => 'Hae kanavia tai yksityisviestejä';

  @override
  String get forwardDirectMessagesSection => 'Yksityisviestit';

  @override
  String get forwardCommentHint => 'Lisää kommentti (valinnainen)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Lähetä ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Kanavia ei löytynyt';

  @override
  String get forwardSuccessToast => 'Viesti välitetty';

  @override
  String get forwardFailed => 'Viestin välittäminen epäonnistui';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Kommentit eivät ole käytettävissä, koska valitussa kanavassa on hidastila käytössä.';

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
      'Et voi lähettää viestejä tänne';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Et voi upottaa linkkejä tänne';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Et voi liittää tiedostoja tänne';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Viestien lähettäminen on estetty tässä yhteisössä';

  @override
  String get forwardDestinationTimedOut =>
      'Olet aikakatkaistuna tässä yhteisössä';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Hidastila – odota $remaining';
  }

  @override
  String get chatMessageCopyText => 'Kopioi viesti';

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
  String get chatMessagePin => 'Kiinnitä viesti';

  @override
  String get chatMessageUnpin => 'Poista viestin kiinnitys';

  @override
  String get chatMessageUnpinIt => 'Poista kiinnitys';

  @override
  String get chatMessageBookmark => 'Lisää kirjanmerkki';

  @override
  String get chatMessageRemoveBookmark => 'Poista kirjanmerkki';

  @override
  String get chatMessageMarkAsUnread => 'Merkitse lukemattomaksi';

  @override
  String get chatMessageCopyMessageLink => 'Kopioi viestilinkki';

  @override
  String get chatMessageCopyMessageId => 'Kopioi viestin ID';

  @override
  String get chatMessageViewReactions => 'Näytä reaktiot';

  @override
  String get chatMessageRemoveAllReactions => 'Poista kaikki reaktiot';

  @override
  String get chatMessageDebug => 'Viestin virheenkorjaus';

  @override
  String get chatMessageDebugSheetTitle => 'Viestin virheenkorjaus';

  @override
  String get chatMessageDebugCopyJson => 'Kopioi JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Viestin JSON kopioitu leikepöydälle';

  @override
  String get chatReactionsSheetTitle => 'Reaktiot';

  @override
  String get chatReactionsSheetEmpty => 'Kukaan ei ole vielä reagoinut tähän.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Ilmoita viestistä';

  @override
  String get iarReportMessageTitle => 'Ilmoita viestistä';

  @override
  String get iarThisUserFallback => 'tämä käyttäjä';

  @override
  String get iarModalDescription =>
      'Ilmoita sääntörikkomuksesta tai etsi työkaluja yhteystietojen ja asetusten hallintaan.';

  @override
  String get iarPathStepAriaLabel => 'Mitä tarvitset?';

  @override
  String get iarCategoryStepTitle => 'Minkä tyyppinen sääntö rikkoutui?';

  @override
  String get iarReasonStepTitle => 'Minkä säännön rikkoutui?';

  @override
  String get iarReasonSelectHint => 'Valitse syy';

  @override
  String get iarPickAnOptionToast => 'Valitse vaihtoehto jatkaaksesi.';

  @override
  String get iarPickARuleToast => 'Valitse rikkoutunut sääntö.';

  @override
  String get iarPathPlatform => 'Ilmoita alustan sääntörikkomuksesta';

  @override
  String get iarPathCommunity => 'Ilmoita tämän yhteisön moderaattoreille';

  @override
  String get iarPathPreferenceMessage => 'En halua tätä sisältöä';

  @override
  String get iarCategoryTargetedHarmLabel =>
      'Uhkaukset, häirintä tai vahingoittaminen';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Kiusaaminen, uhkaukset, vihapuhe, väkivalta, ryöstöhyökkäykset tai itsetuhoisuuteen yllyttävä sisältö.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Lasten turvallisuus tai kypsä sisältö';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Lapset vaarassa, kypsää sisältöä väärässä paikassa tai ei-toivottua käytöstä.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Yksityisyys tai identiteetin loukkaus';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, vainoaminen, esiintyminen jonkun muuna tai sopimaton profiili.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Huijaukset, haittaohjelmat tai väärä tieto';

  @override
  String get iarCategoryDeceptionDescription =>
      'Tietojenkalastelu, petokset, haitalliset linkit tai väitteet, jotka todennäköisesti aiheuttavat todellista vahinkoa.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Laittomaan toimintaan tai jotain muuta';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Laittomat myynnit, rikosten edistäminen tai selkeä sääntörikkomus, joka ei sovi yllä oleviin.';

  @override
  String get iarReasonHarassmentLabel => 'Häirintä tai uhkaukset';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Kiusaaminen, toistuva ei-toivottu yhteydenotto, vainoaminen tai kohdennettu väkivalta.';

  @override
  String get iarReasonHateLabel => 'Vihapuhe';

  @override
  String get iarReasonHateMessageDescription =>
      'Solvaukset, epäinhimillistävä kieli tai hyökkäykset suojeltuja ryhmiä vastaan.';

  @override
  String get iarReasonViolenceLabel => 'Väkivalta tai väkivaltauhkaukset';

  @override
  String get iarReasonViolenceDescription =>
      'Uskottavat uhkaukset, graafinen väkivalta tai väkivallan ihannointi.';

  @override
  String get iarReasonMatureContentLabel => 'Kypsä sisältö tai häirintä';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Ei-toivottu käytös tai kypsä sisältö väärässä paikassa.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Lasten turvallisuus tai alaikäisten hyväksikäyttö';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming tai alaikäisten hyväksikäyttöön liittyvä sisältö.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Haitallinen väärä tieto';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Väärät väitteet, jotka todennäköisesti aiheuttavat todellista vahinkoa.';

  @override
  String get iarReasonSpamLabel =>
      'Roskaposti, huijaukset tai tietojenkalastelu';

  @override
  String get iarReasonSpamMessageDescription =>
      'Massaräskäposti, petokset, väärennetyt lahjoitukset tai tilin väärinkäyttö.';

  @override
  String get iarReasonMalwareLabel => 'Haittaohjelmat tai vaaralliset linkit';

  @override
  String get iarReasonMalwareDescription =>
      'Haittaohjelmat, tunnusten varastaminen tai vaaralliset tiedostot.';

  @override
  String get iarReasonPrivacyLabel => 'Yksityisyyden loukkaus';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, paljastetut yksityiset tiedot tai vainoaminen.';

  @override
  String get iarReasonImpersonationLabel =>
      'Identiteetin loukkaus tai harhaanjohtava media';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Esiintyminen jonkun muuna, mukaan lukien harhaanjohtava tekoälyn luoma sisältö.';

  @override
  String get iarReasonIllegalLabel => 'Laittomaan toimintaan';

  @override
  String get iarReasonIllegalDescription =>
      'Laittomat myynnit, rikosten edistäminen tai laiton toiminta.';

  @override
  String get iarReasonSelfHarmLabel => 'Itsetuhoisuus tai itsemurha';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Itsetuhoisuuteen tai syömishäiriöihin yllyttävä tai niitä ohjeistava sisältö.';

  @override
  String get iarReasonOtherLabel => 'Muu selkeä sääntörikkomus';

  @override
  String get iarReasonOtherDescription =>
      'Käytä vain, jos se rikkoo selvästi Fluxerin sääntöjä eikä sovi yllä oleviin.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Jos alaikäinen on osallisena, käytä sen sijaan \"$childSafetyReason\".';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Jos tämä liittyy CSAM:iin tai alaikäisen hyväksikäyttöön, lähetä se nyt äläkä jaa materiaalia uudelleen.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Jos joku voi olla välittömässä vaarassa, ota yhteyttä paikallisiin hätäpalveluihin, jos voit tehdä sen turvallisesti.';

  @override
  String get iarSafetyNoteViolence =>
      'Jos tämä on uskottava välitön uhka, ota myös yhteyttä paikallisiin hätäpalveluihin.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Jos tämä on välitön terroristinen uhka, ota myös yhteyttä paikallisiin hätäpalveluihin.';

  @override
  String get iarActionBlockUserTitle => 'Estä tämä käyttäjä';

  @override
  String get iarActionBlockUserDescription =>
      'Lopeta viestit ja ystäväpyynnöt.';

  @override
  String get iarActionBlockUserButton => 'Estä';

  @override
  String get iarActionCopyMessageLinkTitle => 'Kopioi viestin linkki';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Jaa yhteisön moderaattoreille.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopioi';

  @override
  String get iarActionCloseDmTitle => 'Sulje tämä yksityisviesti';

  @override
  String get iarActionCloseDmDescription =>
      'Ei estä. Voit avata uudelleen myöhemmin.';

  @override
  String get iarActionCloseDmButton => 'Sulje yksityisviesti';

  @override
  String get iarActionLeaveCommunityTitle => 'Poistu yhteisöstä';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Lopeta sen sisällön ja jäsenten näkeminen.';

  @override
  String get iarActionLeaveCommunityButton => 'Poistu';

  @override
  String get iarActionDmSettingsTitle =>
      'Yksityisviestien ja kaveripyyntöjen asetukset';

  @override
  String get iarActionDmSettingsDescription =>
      'Muuta, kuka voi ottaa sinuun yhteyttä.';

  @override
  String get iarActionCallSettingsTitle =>
      'Puhelu- ja ryhmäkeskusteluasetukset';

  @override
  String get iarActionCallSettingsDescription =>
      'Muuta, kuka voi soittaa tai lisätä sinut.';

  @override
  String get iarActionOpenButton => 'Avaa';

  @override
  String get iarActionDeleteMessageTitle => 'Poista tämä viesti';

  @override
  String get iarActionDeleteMessageDescription =>
      'Poista se kanavalta kaikilta.';

  @override
  String get iarActionDeleteMessageButton => 'Poista';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Poistettu';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Tämä viesti on jo poistettu.';

  @override
  String get iarActionBanUserTitle => 'Estä tämä käyttäjä';

  @override
  String get iarActionBanUserDescription =>
      'Avaa estovalikko tälle yhteisölle.';

  @override
  String get iarActionBanUserButton => 'Estä';

  @override
  String get iarActionBanUserBannedButton => 'Estetty';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Tämä käyttäjä on jo estetty yhteisöstä.';

  @override
  String get iarCloseDmConfirmTitle => 'Sulje yksityisviesti';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Sulje nykyinen yksityisviestisi käyttäjän $name kanssa. Tämä ei estä heitä; voit avata sen uudelleen myöhemmin.';
  }

  @override
  String get iarSuccessTitle => 'Ilmoitus lähetetty';

  @override
  String get iarSuccessBody =>
      'Turvallisuustiimimme tarkistaa sen. Lähetämme sinulle yksityisviestin ja sähköpostin, kun olemme tehneet päätöksen.';

  @override
  String get iarAlreadyReportedTitle => 'Ilmoitettu jo';

  @override
  String get iarAlreadyReportedBody =>
      'Olet jo ilmoittanut tästä viestistä. Turvallisuustiimimme tarkistaa sen.';

  @override
  String get iarBackButton => 'Takaisin';

  @override
  String get iarContinueButton => 'Jatka';

  @override
  String get iarSendReportButton => 'Lähetä ilmoitus';

  @override
  String get iarDoneButton => 'Valmis';

  @override
  String get iarCouldntSendToast =>
      'Raporttia ei voitu lähettää. Yritä uudelleen.';

  @override
  String get iarRateLimitedToast =>
      'Ilmoitat liian nopeasti. Odota hetki ja yritä uudelleen.';

  @override
  String get iarReportSentToast =>
      'Ilmoitus lähetetty. Turvallisuustiimimme tarkistaa sen.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Estetäänkö $name? He eivät voi lähettää sinulle viestejä tai kaveripyyntöjä. Voit poistaa eston myöhemmin.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Tämän käyttäjän estäminen epäonnistui. Yritä uudelleen.';

  @override
  String get iarCloseDmSuccessToast => 'Yksityisviesti suljettu.';

  @override
  String get iarCloseDmFailedToast =>
      'Tämän yksityisviestin sulkeminen epäonnistui. Yritä uudelleen.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Tästä yhteisöstä poistuminen epäonnistui. Yritä uudelleen.';

  @override
  String get chatMessageSuppressEmbeds => 'Piilota esikatselut';

  @override
  String get chatMessageUnsuppressEmbeds => 'Näytä esikatselut';

  @override
  String get chatMessageDelete => 'Poista viesti';

  @override
  String get chatMessageDeleteConfirmTitle => 'Poista viesti';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Haluatko varmasti poistaa tämän viestin?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Lisää';

  @override
  String get chatEditingMessage => 'Muokataan viestiä';

  @override
  String get chatReplyOriginalDeleted => 'Alkuperäinen viesti poistettu';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Alkuperäistä viestiä ei voitu ladata';

  @override
  String get chatReplyAttachedMedia => 'Viesti sisältää liitteenä mediaa';

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
  String get chatMessagesLoadError => 'Viestien lataaminen epäonnistui.';

  @override
  String get chatReplyMentionOverrideTitle => 'Ohitetaanko mainintamieltymys?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname haluaa tulla @mainituksi vastauksissa. Lähetetäänkö silti ilman mainintaa?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname haluaa vastaukset ilman mainintaa. Lähetä maininta silti?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ohita asetukset';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Napsauta poistaaksesi vastattavan käyttäjän pingaamisen.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Napsauta ottaaksesi käyttöön vastattavan käyttäjän pingaamisen.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Mainitse vastattu käyttäjä';

  @override
  String get chatReplyMentionOn => 'Päällä';

  @override
  String get chatReplyMentionOff => 'Pois päältä';

  @override
  String get chatReplyCancel => 'Peruuta vastaus';

  @override
  String get chatEditMessageHint => 'Muokkaa viestiä';

  @override
  String get chatEditNoChanges => 'Ei muutoksia tallennettavaksi';

  @override
  String get chatChannelNotReady =>
      'Tämä kanava ei ole vielä valmis. Yritä hetken kuluttua uudelleen.';

  @override
  String get chatMessageEdited => '(muokattu)';

  @override
  String get chatMessageSilent => 'Tämä oli @silent-viesti.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Tänään klo $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Eilen klo $time';
  }

  @override
  String get mediaViewerImagePreview => 'Kuvan esikatselu';

  @override
  String get mediaViewerClose => 'Sulje medialaajennus';

  @override
  String get mediaViewerOpenInBrowser => 'Avaa selaimessa';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Välitä';

  @override
  String get mediaViewerZoomIn => 'Lähennä';

  @override
  String get mediaViewerZoomOut => 'Loitonna';

  @override
  String get mediaViewerPreviousAttachment => 'Edellinen liite';

  @override
  String get mediaViewerNextAttachment => 'Seuraava liite';

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
  String get chatAttachmentVideoToggleControls =>
      'Näytä/piilota videon ohjaimet';

  @override
  String get chatAttachmentVideoMute => 'Mykistä video';

  @override
  String get chatAttachmentVideoUnmute => 'Poista videon mykistys';

  @override
  String get chatAttachmentVideoPlay => 'Toista video';

  @override
  String get chatAttachmentVideoPause => 'Keskeytä video';

  @override
  String get chatAttachmentVideoProgress => 'Videon eteneminen';

  @override
  String get chatVideoPlaybackFailed => 'Videota ei voitu toistaa.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Ilmoita tämän roolin käyttäjille, joilla on oikeus tarkastella tätä kanavaa.';

  @override
  String get addGuildModalTitle => 'Lisää yhteisö';

  @override
  String get addGuildModalLandingDescription =>
      'Luo uusi yhteisö tai liity olemassa olevaan.';

  @override
  String get addGuildCreateCommunity => 'Luo yhteisö';

  @override
  String get addGuildJoinCommunity => 'Liity yhteisöön';

  @override
  String get addGuildImportDiscordTemplate => 'Tuo Discord-malli';

  @override
  String get addGuildJoinTitle => 'Liity yhteisöön';

  @override
  String get addGuildJoinDescription =>
      'Syötä kutsulinkki liittyäksesi yhteisöön.';

  @override
  String get addGuildInviteLinkLabel => 'Kutsulinkki';

  @override
  String get addGuildJoinSubmit => 'Liity yhteisöön';

  @override
  String get addGuildInviteInvalid =>
      'Tämä kutsu on virheellinen tai vanhentunut.';

  @override
  String get addGuildJoinFailed =>
      'Yhteisöön liittyminen epäonnistui. Yritä uudelleen.';

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
  String get addGuildPackInstalled => 'Paketti asennettu onnistuneesti.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Poista kaikki reaktiot';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Haluatko varmasti poistaa kaikki reaktiot tästä viestistä?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Poista viestin kiinnitys';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Palautetaanko tämä kiinnitys menneisyyteen?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username kiinnitti viestin $messageLink tähän kanavaan. Katso $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'viestin';

  @override
  String get systemPinMessageAllPinsLink => 'kaikki kiinnitetyt viestit';

  @override
  String get channelPinsEmptyTitle => 'Ei kiinnitettyjä viestejä';

  @override
  String get channelPinsEmptyDescription =>
      'Kiinnitetyt viestit näkyvät täällä.';

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
  String get personalNotesTitle => 'Henkilökohtaiset muistiinpanot';

  @override
  String get personalNotesSubtitle =>
      'Oma yksityinen tilasi ajatuksille ja muistutuksille';

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
    return 'Tervetuloa kanavalle $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Alussa ei ollut mitään. Sitten tuli $channelName. Ja se oli hyvää.';
  }

  @override
  String get personalNotesComposerHint => 'Lähetä viesti itsellesi';

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
  String get personalNotesPrivateSpace => 'Oma yksityinen tilasi';

  @override
  String get purgePersonalNotes => 'Tyhjennä henkilökohtaiset muistiinpanot';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Tämä poistaa pysyvästi jokaisen viestin ja liitteen henkilökohtaisista muistiinpanoistasi. Tätä ei voi peruuttaa.';

  @override
  String get purgePersonalNotesConfirmButton => 'Tyhjennä';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Tyhjennettiin $count viestiä henkilökohtaisista muistiinpanoista';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Henkilökohtaiset muistiinpanot olivat jo tyhjät';

  @override
  String get purgePersonalNotesFailed =>
      'Henkilökohtaisia muistiinpanoja ei voitu tyhjentää';

  @override
  String get userSettingsGroupYourAccount => 'TILISI';

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
  String get userSettingsNavProfile => 'Profiili';

  @override
  String get userSettingsNavSecurityLogin => 'Suojaus ja kirjautuminen';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Lahjat ja koodit';

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
  String get userSettingsNavPrivacyDashboard => 'Tietosuojakeskus';

  @override
  String get userSettingsNavAuthorizedApps => 'Valtuutetut sovellukset';

  @override
  String get userSettingsNavBlockedUsers => 'Estetyt käyttäjät';

  @override
  String get userSettingsNavLinkedDevices => 'Yhdistetyt laitteet';

  @override
  String get userSettingsNavConnections => 'Yhteydet';

  @override
  String get userSettingsNavLookAndFeel => 'Ulkoasu';

  @override
  String get userSettingsNavAccessibility => 'Esteettömyys';

  @override
  String get userSettingsNavChat => 'Viestit ja media';

  @override
  String get userSettingsNavAudioAndVideo => 'Ääni ja video';

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
  String get userSettingsNavLanguageAndTime => 'Kieli ja aika';

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
  String get userSettingsNavAdvanced => 'Lisäasetukset';

  @override
  String get advancedPerformanceReportingTitle => 'Suorituskyvyn raportointi';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Auta parantamaan Fluxeria jakamalla anonyymejä kaatumis- ja suorituskykytietoja.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Lähetä kaatumis- ja suorituskykyraportteja';

  @override
  String get advancedPerformanceReportingDescription =>
      'Kaikki raportoidut tiedot ovat anonyymejä ja lähetetään vain Fluxerin omaan valvontapalveluun – kolmansia osapuolia ei käytetä.';

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
  String get userSettingsNavApplications => 'Sovellukset';

  @override
  String get userSettingsNavAppLogs => 'Sovelluksen lokit';

  @override
  String get userSettingsNavDeveloperTools => 'Kehittäjätyökalut';

  @override
  String get userSettingsNavLimitsConfig => 'Rajoitusasetukset';

  @override
  String get userSettingsNavFeatureFlags => 'Ominaisuusliput';

  @override
  String get userSettingsNavWhatsNew => 'Uutta';

  @override
  String get userSettingsNavLogOut => 'Kirjaudu ulos';

  @override
  String get quickSwitcherTabSearch => 'Haku';

  @override
  String get quickSwitcherTabFriends => 'Ystävät';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Etsi kanavia, henkilöitä tai yhteisöjä';

  @override
  String get quickSwitcherSearchFriends => 'Etsi ystäviä';

  @override
  String get quickSwitcherNoMatchesFound => 'Ei osumia';

  @override
  String get quickSwitcherEmptyHint =>
      'Kokeile toista nimeä tai käytä @ / # / ! / * etuliitteitä tulosten suodattamiseen.';

  @override
  String get quickSwitcherSectionPeople => 'Ihmiset';

  @override
  String get quickSwitcherSectionGroupMessages => 'Ryhmäviestit';

  @override
  String get quickSwitcherSectionTextChannels => 'Tekstikanavat';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Äänikanavat';

  @override
  String get quickSwitcherSectionCommunities => 'Yhteisöt';

  @override
  String get quickSwitcherSectionSettings => 'Asetukset';

  @override
  String get quickSwitcherHomeLabel => 'Koti';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Suorat viestit';

  @override
  String get quickSwitcherFavoritesLabel => 'Suosikit';

  @override
  String get quickSwitcherUserSettingsLabel => 'Käyttäjäasetukset';

  @override
  String get quickSwitcherNotificationsLabel => 'Ilmoitukset';

  @override
  String get quickSwitcherBookmarksLabel => 'Kirjanmerkit';

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
  String get quickSwitcherMentionsLabel => 'Maininnat';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Ei ystäviä vielä';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Lisää ystävä aloittaaksesi.';

  @override
  String get quickSwitcherFriendsNoMatchTitle => 'Ystäviä ei vastaa hakua';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Kokeile toista nimeä.';

  @override
  String get quickSwitcherSearchAliasUser => 'Käyttäjä';

  @override
  String get quickSwitcherSearchAliasYou => 'Sinä';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Suorat viestit';

  @override
  String get quickSwitcherSearchAliasMessages => 'Viestit';

  @override
  String get quickSwitcherSearchAliasFav => 'Suos.';

  @override
  String get quickSwitcherSearchAliasStarred => 'Tähd.';

  @override
  String get quickSwitcherSearchAliasInbox => 'Saap.';

  @override
  String get quickSwitcherSearchAliasSaved => 'Tallenn.';

  @override
  String get uiClose => 'Sulje';

  @override
  String get chatJumpToBottom => 'Siirry alareunaan';

  @override
  String get uiConfirm => 'Vahvista';

  @override
  String get uiLoading => 'Ladataan';

  @override
  String get uiUnsavedChanges => 'Tallentamattomia muutoksia';

  @override
  String get uiReset => 'Nollaa';

  @override
  String get uiOpenColorPicker => 'Avaa värivalitsin';

  @override
  String get uiSelectPlaceholder => 'Valitse';

  @override
  String get uiSearchPlaceholder => 'Etsi';

  @override
  String get uiNoOptionsFound => 'Ei vaihtoehtoja';

  @override
  String get uiDismissNotification => 'Hylkää ilmoitus';

  @override
  String get uiColorPickerTitle => 'Värivalitsin';

  @override
  String get mentionConfirmTitle => 'Mainitaanko kaikki?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Tämä ilmoittaa $count jäsenelle. Jatka?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Tämä ilmoittaa $count paikalla olevalle jäsenelle. Jatka?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Mainitse';

  @override
  String get composerEmojiUnavailable => 'Et voi käyttää tätä emojia täällä.';

  @override
  String get instanceUrlLabel => 'Instanssin URL';

  @override
  String get instanceUrlPlaceholder =>
      'Syötä instanssin URL (esim. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Nollaa Fluxeriin';

  @override
  String get instanceConnect => 'Yhdistä';

  @override
  String get instanceConnecting => 'Yhdistetään…';

  @override
  String get instanceConnectFailed =>
      'Yhteyden muodostaminen instanssiin epäonnistui';

  @override
  String get recentInstances => 'Viimeisimmät instanssit';

  @override
  String removeRecentInstance(String domain) {
    return 'Poista $domain viimeisimmistä instansseista';
  }

  @override
  String get instanceSheetTitle => 'Yhdistä instanssiin';

  @override
  String get connectToDifferentInstance => 'Yhdistä toiseen instanssiin';

  @override
  String get changeInstance => 'Vaihda';

  @override
  String get instanceConnectionRequired => 'Yhdistä instanssiin kirjautuaksesi';

  @override
  String get comingSoon => 'Tulossa pian';

  @override
  String get guildNavbarDirectMessages => 'Suorat viestit';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Tutustu löydettäviin yhteisöihin';

  @override
  String get discoveryExplore => 'Tutustu';

  @override
  String get discoveryExplorePublicCommunities =>
      'Tutustu julkisiin yhteisöihin';

  @override
  String get discoveryListingSubheading =>
      'Haluatko listata yhteisösi tänne? Hae, jos täytät yhteisösi asetusten > Discovery vaatimukset.';

  @override
  String get discoverySearchCommunities => 'Etsi yhteisöjä';

  @override
  String get discoveryFilterByLanguage => 'Suodata kielen mukaan';

  @override
  String get discoveryAllLanguages => 'Kaikki kielet';

  @override
  String get discoveryAllCategories => 'Kaikki';

  @override
  String get discoveryCategoryGaming => 'Pelaaminen';

  @override
  String get discoveryCategoryMusic => 'Musiikki';

  @override
  String get discoveryCategoryEntertainment => 'Viihde';

  @override
  String get discoveryCategoryEducation => 'Koulutus';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Tiede ja teknologia';

  @override
  String get discoveryCategoryContentCreator => 'Sisällöntuottaja';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime ja manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Elokuvat ja TV';

  @override
  String get discoveryCategoryOther => 'Muu';

  @override
  String get discoveryNoCommunitiesMatch => 'Yhteisöjä ei löytynyt.';

  @override
  String get discoveryJoinCommunity => 'Liity yhteisöön';

  @override
  String get discoveryJoined => 'Liittynyt';

  @override
  String discoveryOnlineCount(String count) {
    return '$count verkossa';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString jäsentä',
      one: '1 jäsen',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Ei kuvausta.';

  @override
  String get discoveryCommunities => 'Yhteisöt';

  @override
  String get discoveryApps => 'Sovellukset';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Yhteisöön liittyminen epäonnistui';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Tapahtui virhe. Yritä uudelleen hetken kuluttua.';

  @override
  String get discoveryJoinErrorFullTitle => 'Tämä yhteisö on täynnä';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Tämä yhteisö on saavuttanut jäsenmääränsä rajoituksen, joten et voi liittyä juuri nyt.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Olet saavuttanut yhteisöjen enimmäismäärän';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Olet enimmäismäärässä yhteisöjä. Poistu yhdestä ja yritä uudelleen.';

  @override
  String get discoveryJoinErrorBannedTitle => 'Et voi liittyä tähän yhteisöön';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Sinut on estetty tästä yhteisöstä.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Tämä yhteisö ei ole enää saatavilla';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Se on saattanut poistua löydettävistä tai lopettaa uusien jäsenten vastaanottamisen. Päivitä sivu, niin et näe sitä enää.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Toimit liian nopeasti';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Odota hetki ja yritä uudelleen.';

  @override
  String get guildNavbarAddCommunity => 'Lisää yhteisö';

  @override
  String get guildNavbarHelp => 'Ohje';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'UUSI VIESTI';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Pienennä kansio $folderName';
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
  String get guildNavbarGroupDm => 'Ryhmä-DM';

  @override
  String get guildNavbarCreateChannel => 'Luo kanava';

  @override
  String get guildNavbarChannelType => 'Kanavatyyppi';

  @override
  String get guildNavbarTextChannel => 'Tekstikanava';

  @override
  String get guildNavbarTextChannelDescription =>
      'Lähetä viestejä, kuvia, GIF-tiedostoja ja hymiöitä';

  @override
  String get guildNavbarVoiceChannel => 'Äänikanava';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Oleskele yhdessä äänen, videon ja näytön jaon avulla';

  @override
  String get guildNavbarLinkChannel => 'Linkkikanava';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Pikakäyttö ulkoiseen verkkosivustoon tai resurssiin';

  @override
  String get guildNavbarNameLabel => 'Nimi';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Luo kategoria';

  @override
  String get guildNavbarNewCategoryHint => 'Uusi kategoria';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Kutsu ystäviä palveluun $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Vastaanottajat ohjataan kanavalle #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Etsi ystäviä';

  @override
  String get guildNavbarNoFriendsYet => 'Ei vielä ystäviä';

  @override
  String get guildNavbarNoResults => 'Ei tuloksia';

  @override
  String get guildNavbarInviteLinkPrompt => 'Tai lähetä kutsulinkki ystävälle:';

  @override
  String get guildNavbarInviteLink => 'Kutsulinkki';

  @override
  String get guildNavbarCopy => 'Kopioi';

  @override
  String get guildNavbarCopied => 'Kopioitu!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Kutsulinkkisi vanhenee 7 päivän kuluttua.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Tämä kutsulinkki ei vanhene koskaan.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Kutsulinkkisi vanhenee $duration kuluttua.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Muokkaa kutsulinkkiä';

  @override
  String get guildNavbarInviteLinkSettings => 'Kutsulinkkiasetukset';

  @override
  String get guildNavbarExpireAfter => 'Vanhenee ajan kuluttua';

  @override
  String get guildNavbarMaxUses => 'Maksimikäyttömäärä';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Myönnä väliaikainen jäsenyys';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Jäsenet poistetaan, kun he menevät offline-tilaan, ellei roolia ole määritetty';

  @override
  String get guildNavbarCreateNewLink => 'Luo uusi linkki';

  @override
  String get guildNavbarSent => 'Lähetetty';

  @override
  String get guildNavbarInvite => 'Kutsu';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Poistu yhteisöstä';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Haluatko varmasti poistua tästä yhteisöstä? Et voi enää nähdä viestejä.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Poistu yhteisöstä';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Poistetaanko viestisi tästä yhteisöstä?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Poista pysyvästi jokainen lähettämäsi viesti täällä, kaikissa kanavissa. Tätä ei voi peruuttaa.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Poista viestini';

  @override
  String get guildNavbarDeletedYourMessages => 'Poistit viestisi';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Viestien poistaminen epäonnistui';

  @override
  String get guildNavbarRemoveOverride => 'Poista ohitus';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Mykistetty asti $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Vain Fluxer-henkilökunnan käytettävissä';

  @override
  String get guildNavbarInvitesPaused =>
      'Kutsut ovat tällä hetkellä tauolla tässä yhteisössä';

  @override
  String get guildNavbarDurationNever => 'ei koskaan';

  @override
  String get guildNavbarDuration30Minutes => '30 minuuttia';

  @override
  String get guildNavbarDuration1Hour => '1 tunti';

  @override
  String get guildNavbarDuration6Hours => '6 tuntia';

  @override
  String get guildNavbarDuration12Hours => '12 tuntia';

  @override
  String get guildNavbarDuration1Day => '1 päivä';

  @override
  String get guildNavbarDuration7Days => '7 päivää';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekuntia';
  }

  @override
  String get guildNavbarNever => 'Ei koskaan';

  @override
  String get guildNavbarNoLimit => 'Ei rajaa';

  @override
  String get guildNavbarOneUse => '1 käyttökerta';

  @override
  String guildNavbarUses(int count) {
    return '$count käyttökertaa';
  }

  @override
  String get guildMenuMarkAsRead => 'Merkitse luetuksi';

  @override
  String get guildPeekMoreOptions => 'Lisää asetuksia';

  @override
  String get guildMenuInviteMembers => 'Kutsu jäseniä';

  @override
  String get guildMenuCommunitySettings => 'Yhteisön asetukset';

  @override
  String get guildMenuEditCommunityProfile => 'Muokkaa yhteisön profiilia';

  @override
  String get guildMenuUnmuteCommunity => 'Poista yhteisön mykistys';

  @override
  String get guildMenuMuteCommunity => 'Mykistä yhteisö';

  @override
  String get guildMenuHideMutedChannels => 'Piilota mykistetyt kanavat';

  @override
  String get guildMenuReportCommunity => 'Ilmoita yhteisöstä';

  @override
  String get guildMenuDebugCommunity => 'Yhteisön virheenkorjaus';

  @override
  String get guildMenuCopyCommunityId => 'Kopioi yhteisön ID';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Aikaan $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Yleiset';

  @override
  String get guildMenuSettingsRoles => 'Roolit ja käyttöoikeudet';

  @override
  String get guildMenuSettingsEmoji => 'Mukautetut emojit';

  @override
  String get guildMenuSettingsStickers => 'Mukautetut tarrat';

  @override
  String get guildMenuSettingsSafetyModeration => 'Turvallisuus ja moderointi';

  @override
  String get guildMenuSettingsActivityLog => 'Toimintaloki';

  @override
  String get guildMenuSettingsWebhooks => 'Webhookit';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Mukautettu kutsulinkki';

  @override
  String get guildMenuSettingsDiscovery => 'Löydettävyys';

  @override
  String get guildMenuSettingsMembers => 'Jäsenet';

  @override
  String get guildMenuSettingsInviteLinks => 'Kutsulinkit';

  @override
  String get guildMenuSettingsBans => 'Estot';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Sinulla ei ole oikeutta tarkastella tätä asetusten välilehteä.';

  @override
  String get guildSettingsOverviewIconTitle => 'Kuvake';

  @override
  String get guildSettingsUploadImage => 'Lataa kuva';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banneri';

  @override
  String get guildSettingsOverviewBannerHint => 'Lataa banneri palvelimellesi.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nimi';

  @override
  String get guildSettingsOverviewNameHint => 'Mahtava yhteisöni';

  @override
  String get guildSettingsOverviewStatsTitle => 'Tilastot';

  @override
  String get guildSettingsOverviewMembers => 'Jäsenet';

  @override
  String get guildSettingsOverviewOnline => 'Paikalla';

  @override
  String get guildSettingsRolesDescription =>
      'Käytä rooleja jäsenten ryhmittelyyn ja käyttöoikeuksien määrittämiseen.';

  @override
  String get guildSettingsCreateRole => 'Luo rooli';

  @override
  String get guildSettingsRolesListTitle => 'Roolit';

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
    return '$staticCount staattista, $animatedCount animoitua emojipaikkaa käytetty';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Ei mukautettuja emojeja vielä.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count tarraa ladattu';
  }

  @override
  String get guildSettingsStickersEmpty => 'Ei mukautettuja tarroja vielä.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Jäsenten vahvistus';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Valitse, mitä jäseniltä vaaditaan ennen kuin he voivat lähettää viestejä tai lähettää yksityisviestejä yhteisön jäsenille.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Roolin jäsenet voivat ohittaa nämä tarkistukset. Julkisia tiloja varten suosittelemme vahvistuksen käyttöönottoa.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Discoveryyn listatut yhteisöt vaativat vähintään vahvistetun sähköpostin. Mitään ei voi valita, kun Discovery on käytössä.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Kyseenalainen sisältö ja sisältövaroitukset';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Määritä kyseenalaisen sisällön merkinnät ja valinnaiset sisältövaroitukset jäsenille.';

  @override
  String get guildSettingsModerationMatureToggle => 'Kyseenalainen sisältö';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Merkitse tämä yhteisö kyseenalaista sisältöä sisältäväksi.';

  @override
  String get guildSettingsVerificationNone => 'Ei mitään';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Vahvistusta ei vaadita.';

  @override
  String get guildSettingsVerificationLow => 'Matala';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Vaatii vahvistetun sähköpostiosoitteen.';

  @override
  String get guildSettingsVerificationMedium => 'Keskitaso';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Vaatii vahvistetun sähköpostiosoitteen ja vähintään 5 minuuttia vanhan tilin.';

  @override
  String get guildSettingsVerificationHigh => 'Korkea';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Vaatii kaiken keskiverron lisäksi, että on ollut yhteisön jäsen vähintään 10 minuuttia.';

  @override
  String get guildSettingsVerificationHighest => 'Erittäin korkea';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Vaatii vahvistetun puhelinnumeron.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Seuraa moderaattorien toimia yhteisössä.';

  @override
  String get guildSettingsAuditLogEmpty => 'Ei lokeja vielä';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderaatiotoimet ja yhteisön muutokset näkyvät täällä.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Kaikki käyttäjät';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Kaikki toimet';

  @override
  String get guildSettingsAuditLogNoReason => 'Syyä ei annettu.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Tuntematon käyttäjä';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Aktiviteettilokin lataamisessa tapahtui virhe.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Aktiviteettilokeja ei voitu ladata';

  @override
  String get guildSettingsAuditLogReason => 'Syy';

  @override
  String get guildSettingsAuditLogSomeone => 'joku';

  @override
  String get guildSettingsAuditLogSomething => 'jotain';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'tuntematon entiteetti';

  @override
  String get guildSettingsAuditLogNothing => 'ei mitään';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Tuntematon kohde';

  @override
  String get auditLogActionGuildUpdate => 'Yhteisö päivitetty';

  @override
  String get auditLogActionChannelCreate => 'Kanava luotu';

  @override
  String get auditLogActionChannelUpdate => 'Kanava päivitetty';

  @override
  String get auditLogActionChannelDelete => 'Kanava poistettu';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanavan ylikirjoitus lisätty';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanavan ylikirjoitus päivitetty';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanavan ylikirjoitus poistettu';

  @override
  String get auditLogActionMemberKick => 'Jäsen potkittu';

  @override
  String get auditLogActionMemberPrune => 'Jäseniä poistettu';

  @override
  String get auditLogActionMemberBanAdd => 'Jäsen estetty';

  @override
  String get auditLogActionMemberBanRemove => 'Jäsen poistettu estolistalta';

  @override
  String get auditLogActionMemberUpdate => 'Jäsen päivitetty';

  @override
  String get auditLogActionMemberRoleUpdate => 'Jäsenen roolit päivitetty';

  @override
  String get auditLogActionMemberMove => 'Jäsen siirretty';

  @override
  String get auditLogActionMemberDisconnect => 'Jäsenen yhteys katkaistu';

  @override
  String get auditLogActionBotAdd => 'Botti lisätty';

  @override
  String get auditLogActionRoleCreate => 'Rooli luotu';

  @override
  String get auditLogActionRoleUpdate => 'Rooli päivitetty';

  @override
  String get auditLogActionRoleDelete => 'Rooli poistettu';

  @override
  String get auditLogActionInviteCreate => 'Kutsu luotu';

  @override
  String get auditLogActionInviteUpdate => 'Kutsu päivitetty';

  @override
  String get auditLogActionInviteDelete => 'Kutsu poistettu';

  @override
  String get auditLogActionWebhookCreate => 'Webhook luotu';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook päivitetty';

  @override
  String get auditLogActionWebhookDelete => 'Webhook poistettu';

  @override
  String get auditLogActionEmojiCreate => 'Emoji luotu';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji päivitetty';

  @override
  String get auditLogActionEmojiDelete => 'Emoji poistettu';

  @override
  String get auditLogActionStickerCreate => 'Tarra luotu';

  @override
  String get auditLogActionStickerUpdate => 'Tarra päivitetty';

  @override
  String get auditLogActionStickerDelete => 'Tarra poistettu';

  @override
  String get auditLogActionMessageDelete => 'Viesti poistettu';

  @override
  String get auditLogActionMessageBulkDelete => 'Viestit poistettu';

  @override
  String get auditLogActionMessagePin => 'Viesti kiinnitetty';

  @override
  String get auditLogActionMessageUnpin => 'Viesti irrotettu';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor päivitti yhteisön asetuksia.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor loi kanavan $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor päivitti kanavaa $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor poisti kanavan $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor lisäsi kanavan käyttöoikeuksia kohteelle $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor lisäsi kanavan käyttöoikeuksia kohteelle $target kanavassa $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor päivitti kanavan käyttöoikeuksia kohteelle $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor päivitti kanavan käyttöoikeuksia kohteelle $target kanavassa $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor poisti kanavan käyttöoikeuksia kohteelta $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor poisti kanavan käyttöoikeuksia kohteelta $target kanavassa $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor potkaisi jäsenen $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor bannasi jäsenen $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor poisti jäsenen $target bannin.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor päivitti jäsentä $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor päivitti jäsenen $target rooleja.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor poisti passiivisia jäseniä.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor poisti jäseniä, jotka ovat olleet passiivisia $days päivää.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor siirsi jäsenen $target toiseen äänikanavaan.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor siirsi jäsenen $target kanavaan $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor irrotti jäsenen $target äänestä.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor lisäsi botin $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor loi roolin $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor päivitti roolia $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor poisti roolin $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor loi kutsun $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor loi kutsun $target kanavalle $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor päivitti kutsua $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor päivitti kutsua $target kanavalle $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor poisti kutsun $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor poisti kutsun $target kanavalle $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor loi webhookin $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor päivitti webhookia $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor poisti webhookin $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor lisäsi emojin $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor päivitti emojin $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor poisti emojin $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor lisäsi tarran $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor päivitti tarran $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor poisti tarran $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor poisti viestin.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor poisti viestin kanavalta $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor poisti useita viestejä.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor poisti $count viestiä.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor poisti useita viestejä kanavalta $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor poisti $count viestiä kanavalta $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor kiinnitti viestin.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor kiinnitti viestin kanavalle $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor poisti viestin kiinnityksen.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor poisti viestin kiinnityksen kanavalta $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor suoritti tarkastustoiminnon kohteelle $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Päivitettiin $field kohteesta $oldValue kohteeksi $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Asetettiin $field arvoon $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Tyhjennettiin $field (oli $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Päivitettiin $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Yhteisön nimi muutettiin muotoon $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Yhteisön kuvake päivitettiin.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Kanavan nimi muutettiin muotoon $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Aihe tyhjennettiin.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Aiheen muutos: $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Sallittu arkaluontoinen sisältö.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Arkaluontoinen sisältö estetty.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Nimimerkki asetettu: $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Nimimerkki $nickname poistettu.';
  }

  @override
  String get auditLogChangeMutedMember => 'Jäsen mykistetty.';

  @override
  String get auditLogChangeUnmutedMember => 'Jäsenen mykistys poistettu.';

  @override
  String get auditLogChangeDeafenedMember => 'Jäsenen kuulo estetty.';

  @override
  String get auditLogChangeUndeafenedMember => 'Jäsenen kuulon esto poistettu.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Lisätty roolit: $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Poistettu roolit: $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanava: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Viesti: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Kutsunut: $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Poistettu # viestiä.',
      one: 'Poistettu # viesti.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Poistettu # jäsentä.',
      one: 'Poistettu # jäsen.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Tämä kutsu ei vanhene koskaan.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Myöntää väliaikaisen jäsenyyden.';

  @override
  String get auditLogOptionPermanentMembership => 'Myöntää pysyvän jäsenyyden.';

  @override
  String get guildSettingsLoadMore => 'Lataa lisää';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Hallitse webkoukkuja, jotka julkaisevat viestejä kanaville.';

  @override
  String get guildSettingsWebhooksEmpty => 'Webkoukkuja ei ole määritetty.';

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
  String get guildSettingsCopyUrl => 'Kopioi URL';

  @override
  String get guildSettingsCopiedUrl => 'URL kopioitu leikepöydälle';

  @override
  String get guildSettingsDeleteWebhook => 'Poista webkoukku';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Aseta mukautettu kutsulinkki palvelimellesi.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Tallenna';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Käyttö';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count käyttöä';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Hae mukaan palvelimen hakemistoon.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Vaatii vähintään $count jäsentä hakeaksesi.';
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
  String get guildSettingsDiscoveryCategory => 'Kategoria';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Kuvaus';

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
  String get guildSettingsDiscoveryTags => 'Tunnisteet';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'pelaaminen, taide, musiikki';

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
  String get guildSettingsDiscoveryApply => 'Lähetä hakemus';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Peruuta';

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
      'Etsi ja hallitse palvelimen jäseniä.';

  @override
  String get guildSettingsMembersSearchHint => 'Etsi jäseniä';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count jäsentä';
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
  String get guildSettingsMembersSortNewest => 'Uusimmat ensin';

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
      'Näytä ja peruuta aktiiviset kutsulinkit.';

  @override
  String get guildSettingsInvitesEmpty => 'Ei aktiivisia kutsuja.';

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
    return '$uses / $maxUses käyttöä';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Vanhenee $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Näytä ja hallitse estettyjä käyttäjiä.';

  @override
  String get guildSettingsBansSearchHint => 'Etsi estoja';

  @override
  String get guildSettingsBansEmpty => 'Ei estettyjä käyttäjiä.';

  @override
  String get guildSettingsBanPermanent => 'Pysyvä esto';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Päättyy $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Päättyy';

  @override
  String get guildSettingsUnban => 'Poista esto';

  @override
  String get guildSettingsBansLoading => 'Ladataan estettyjä käyttäjiä';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Ei estettyjä käyttäjiä löytynyt hakuehdoilla.';

  @override
  String get guildSettingsBanDetailsTitle => 'Eston tiedot';

  @override
  String get guildSettingsBanViewDetails => 'Näytä tiedot';

  @override
  String get guildSettingsBannedOn => 'Estetty';

  @override
  String get guildSettingsBannedBy => 'Estänyt';

  @override
  String get guildSettingsRevokeBanTitle => 'Peruuta esto';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Haluatko varmasti peruuttaa eston käyttäjältä $displayName? Hän voi liittyä takaisin yhteisöön.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Eston peruutus käyttäjältä $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Estojen lataus epäonnistui. Yritä uudelleen.';

  @override
  String get guildSettingsRevokeBanError =>
      'Eston peruutus epäonnistui. Yritä uudelleen.';

  @override
  String get guildSettingsCommunitySettings => 'Yhteisön asetukset';

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
      'Hallitse yhteisösi profiilia, kanavia ja oletusasetuksia.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Brändäys';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Päivitä kuvake, nimi, banneri ja kutsutausta';

  @override
  String get guildSettingsOverviewBannerUpload => 'Lataa banneri';

  @override
  String get guildSettingsOverviewIdleTitle => 'Lepotila-asetukset';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Määritä AFK-kanava ja aikakatkaisu';

  @override
  String get guildSettingsOverviewSystemTitle => 'Järjestelmä ja tervetuloa';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Valitse järjestelmä- ja tervetuloviestien kohde';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Oletusilmoitukset';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Yli 250 jäsenen yhteisöt pakotetaan \"vain maininnat\" -asetukseen. Alkuperäinen asetuksesi säilytetään ja palautetaan, jos yhteisön jäsenmäärä laskee alle 250.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Lisäasetukset';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Salli joustavat tekstikanavien nimet';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Piilota yhteisön omistajan kruunu';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Erillinen banneri';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Näyttää bannerin omassa osiossaan yhteisön otsikon alla.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Lataa kuvake';

  @override
  String get guildSettingsOverviewRemoveImage => 'Poista';

  @override
  String get guildSettingsOverviewSplashTitle => 'Kutsun tausta';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Chat-upotuksen tausta';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Näytetään kutsu-upotuksissa chatissa.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Lataa tausta';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Ei yhteisöbanneriä';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Ei kutsun taustaa';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Esikatselu';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Katso, miltä kutsusi näyttää vierailijoille.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Tekstikanavien nimet';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Yhteisön omistajan kruunu';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Määritä, näytetäänkö kruunikuvake yhteisön omistajan vieressä';

  @override
  String get guildSettingsSplashCardAlignment => 'Kortin tasaus';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Keskitä';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Vasen';

  @override
  String get guildSettingsSplashAlignmentRight => 'Oikea';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Koskee vain leveitä näyttöjä.';

  @override
  String get permissionReadMessageHistory => 'Lue viestihistoria';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Muuta, mitä käyttäjät ilman \"$permission\" voivat nähdä';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Käytä erillistä modaalia viestihistorian raja-arvon asettamiseen jäsenille, joilla ei ole $permission-oikeutta.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Avaa viestihistorian raja-arvo';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Viestihistorian raja-arvo';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Ota viestihistorian raja-arvo käyttöön';

  @override
  String get guildSettingsMessageHistoryThresholdDate =>
      'Raja-arvon päivämäärä';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Jäsenet, joilla ei ole viestihistorian lukuoikeutta, voivat tarkastella tämän päivämäärän jälkeen lähetettyjä viestejä.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Viestihistorian raja-arvo päivitetty';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Salli isot kirjaimet ja välilyönnit tekstikanavien nimissä. Pois päältä rajoittaa nimet pieniin kirjaimiin, väliviivoihin ja alaviivoihin.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Piilottaa kruunikuvakkeen yhteisön omistajan vierestä kaikissa näkymissä.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animoituja kuvakkeita varten tarvitaan Animoitu kuvake -yhteisöominaisuus.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animoituja bannereita varten tarvitaan Animoitu banneri -yhteisöominaisuus.';

  @override
  String get guildSettingsAfkChannel => 'AFK / joutilaskaanava';

  @override
  String get guildSettingsAfkChannelHint =>
      'Siirrä jäsenet tähän kanavaan, kun he ovat AFK-tilassa.';

  @override
  String get guildSettingsNoAfkChannel => 'Ei AFK-kanavaa';

  @override
  String get guildSettingsAfkTimeout => 'AFK-aikakatkaisu';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minuutti';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minuuttia';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minuuttia';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minuuttia';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 tunti';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekuntia';
  }

  @override
  String get guildSettingsSystemChannel => 'Kohdekanava';

  @override
  String get guildSettingsSystemChannelHint =>
      'Tervetuloa- ja järjestelmäviestit ilmestyvät tänne.';

  @override
  String get guildSettingsNoSystemChannel => 'Ei järjestelmäkanavaa';

  @override
  String get guildSettingsHideJoinMessages => 'Piilota liittymisviestit';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Piilottaa liittyviin liittyvät viestit kohdekanavalla.';

  @override
  String get guildSettingsDefaultNotifications => 'Oletusilmoitusasetukset';

  @override
  String get guildSettingsNotificationsAll => 'Kaikki viestit';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Ilmoita kaikista viesteistä';

  @override
  String get guildSettingsNotificationsMentions => 'Vain maininnat';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Ilmoita vain maininnoista';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Enintään 10 Mt. Vähintään: 960×540 pikseliä (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Enintään 10 Mt. Vähintään: 960×540 pikseliä (16:9). Näytetään kutsulinkeissä chatissa.';

  @override
  String get guildSettingsModerationDescription =>
      'Määritä vahvistus-, sisältösuodatus- ja kypsää sisältöä koskevat asetukset.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Discoveryyn listatuilla yhteisöillä on rajoitetut moderointivaihtoehdot.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Sisällön suodatus';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Tarkista automaattisesti viestit arkaluontoisen sisällön varalta kanavilla, joita ei ole merkitty kypsälle sisällölle.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Discoveryyn listattujen yhteisöjen on skannattava kaikki jäsenet. Tätä asetusta ei voi muuttaa, kun Discovery on käytössä.';

  @override
  String get guildSettingsContentFilterOff => 'Pois päältä';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Anna yhteisön itse moderoida';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Suodata jäsenet ilman rooleja';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Suositellaan useimmille yhteisöille';

  @override
  String get guildSettingsContentFilterAll => 'Suodata kaikki';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maksimaalinen suojaus perheystävällisille tiloille';

  @override
  String get guildSettingsModerationMatureOff => 'Pois päältä';

  @override
  String get guildSettingsModerationMatureOn => 'Käytössä';

  @override
  String get guildSettingsContentWarningToggle => 'Näytä sisältövaroitus';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Kytkee suostumuskehotteen ennen minkään kanavan avaamista.';

  @override
  String get guildSettingsContentWarningText => 'Mukautettu varoitusteksti';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Tämä sisältää arkaluontoista sisältöä.';

  @override
  String get guildSettingsModeration2faTitle => '2FA-vaatimus';

  @override
  String get guildSettingsModeration2faDescription =>
      'Vaadi kaksivaiheinen todennus moderaattoreilta ennen kuin he voivat estää, poistaa, aikakatkaista tai poistaa viestejä.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Vaadi 2FA moderointitoimintoihin';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Vain yhteisön omistaja voi muuttaa tätä asetusta';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Ota käyttöön 2FA tililläsi muuttaaksesi tätä asetusta';

  @override
  String get guildSettingsEmojiSearchHint => 'Etsi emojeita';

  @override
  String get guildSettingsEmojiUploadTitle => 'Lataa emoji';

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
    return 'Ei-animaatioemoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animaatioemoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Etsi tarroja';

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
    return 'Luo webhookkeja kanava-asetuksista. Muokkaa niitä täällä.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Mukautettu URL-osoitteesi ei toimi, ellei vähintään yksi kanava ole kaikkien nähtävissä.';

  @override
  String get guildSettingsVanityUrlRemove => 'Poista';

  @override
  String get guildSettingsBannedUsersTitle => 'Estetyt käyttäjät';

  @override
  String get guildSettingsInvitesTableInviter => 'Kutsuja';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanava';

  @override
  String get guildSettingsInvitesTableCode => 'Koodi';

  @override
  String get guildSettingsInvitesTableUses => 'Käyttökerrat';

  @override
  String get guildSettingsInvitesTableCreated => 'Luotu';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Suodata käyttäjän mukaan';

  @override
  String get guildSettingsAuditLogFilterAction => 'Suodata toiminnon mukaan';

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
  String get keybindActionPushToTalkPriority => 'Push to talk (priority)';

  @override
  String get keybindActionVoiceActivityPriority => 'Voice activity priority';

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

  @override
  String get clipboardPasteFailed =>
      'Couldn\'t paste. The clipboard was empty or blocked for this app.';
}
