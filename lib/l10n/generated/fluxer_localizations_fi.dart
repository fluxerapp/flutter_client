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
      'Jotain on vialla tässä instanssissa.\nPitäisi korjaantua hetken kuluttua!';

  @override
  String get gatewayReconnectingToast => 'Yhdistetään uudelleen…';

  @override
  String get gatewayConnectedToast => 'Yhdistetty';

  @override
  String get sessionExpiredToast =>
      'Istuntosi on vanhentunut. Kirjaudu sisään uudelleen.';

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
  String get nagbarLearnMore => 'Lue lisää';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Huoltokatko on ajoitettu alkamaan klo $localizedTime. Odotettu kesto: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Huoltokatko käynnissä. Arvioitu kesto: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Huoltokatko on päättynyt.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hei $displayName, lunasta tilisi, jotta et menetä käyttöoikeutta.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hei $displayName, vahvista sähköpostiosoitteesi.';
  }

  @override
  String get nagbarOpenSettings => 'Avaa asetukset';

  @override
  String get systemPermissionSettingsTitle => 'Ota käyttöön lupa';

  @override
  String get systemPermissionSettingsOpenSettings => 'Avaa asetukset';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName ei pääse käyttämään mikrofonia. Voit ottaa sen käyttöön laitteesi yksityisyysasetuksissa.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName ei pääse käyttämään kameraasi. Voit ottaa sen käyttöön laitteesi yksityisyysasetuksissa.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName ei pääse käyttämään kuvakirjastoasi. Voit ottaa sen käyttöön laitteesi yksityisyysasetuksista.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName ei saa lähettää ilmoituksia. Voit ottaa sen käyttöön laitteesi asetuksista.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Tilauksesi uusiminen epäonnistui, mutta sinulla on vielä pääsy $productName etuihin $graceDate asti. Toimi nyt, tai menetät kaikki edut.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Tilauksesi $productName on päättynyt. Uusi tilaus nyt säilyttääksesi edut.';
  }

  @override
  String get nagbarManageSubscription => 'Hallinnoi tilausta';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Tervetuloa $productFullName:een. Tutustu $productName-etuusiisi ja hallinnoi tilaustasi.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Katso $productName-ominaisuudet';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Sinulla on uusi lahjakoodi odottamassa lahjavarastossasi.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Sinulla on $count uutta lahjakoodia odottamassa lahjainventaariossasi.';
  }

  @override
  String get nagbarViewGiftInventory => 'Näytä lahjavarasto';

  @override
  String get nagbarVisionaryMfa =>
      'Ota kaksivaiheinen tunnistautuminen käyttöön suojataksesi Visionary-tilisi.';

  @override
  String get nagbarEnableMfa => 'Ota 2FA käyttöön';

  @override
  String get nagbarTermsAcceptance =>
      'Olemme päivittäneet käyttöehtomme. Tarkista ja hyväksy ne jatkaaksesi.';

  @override
  String get nagbarReviewTerms => 'Tarkista ehdot';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Liity yhteisöön $communityName ja keskustele tiimin kanssa pysyäksesi ajan tasalla.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Liity yhteisöön $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Ota käyttöön ilmoitukset, niin et missaa viestejä ja mainintoja.';

  @override
  String get nagbarEnableNotifications => 'Ota ilmoitukset käyttöön';

  @override
  String get nagbarBillingPortalFailed =>
      'Portaalin avaaminen epäonnistui. Yritä uudelleen hetken kuluttua.';

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
  String get next => 'Seuraava';

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
  String get registerPendingApproval =>
      'Tilipyyntösi odottaa hyväksyntää. Voit kirjautua sisään, kun ylläpitäjä on hyväksynyt sen.';

  @override
  String get registerClosed =>
      'Rekisteröityminen on tällä hetkellä suljettu. Luo tili käyttämällä ylläpitäjältä saatua rekisteröitymislinkkiä.';

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
  String get errorServiceUnavailable =>
      'Tämä instanssi ei ole väliaikaisesti käytettävissä. Yritä uudelleen hetken kuluttua.';

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
  String get embedInviteJoinGroup => 'Liity ryhmään';

  @override
  String get embedInviteAlreadyJoined => 'Liitytty jo';

  @override
  String get embedInviteDisabled => 'Kutsut poissa käytöstä';

  @override
  String get embedInvitePaused => 'Kutsut tähän yhteisöön on keskeytetty.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName havaitsi mahdollisen hyökkäyksen, joten uudet käyttäjät eivät voi liittyä juuri nyt.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Yhteisö on keskeyttänyt kutsut. Voit yrittää myöhemmin uudelleen.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName havaitsi mahdollisen hyökkäyksen tässä yhteisössä. Kutsut on keskeytetty, joten uudet käyttäjät eivät voi liittyä juuri nyt.';
  }

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
  String get invalidDeepLinkTitle => 'Linkkiä ei voitu avata';

  @override
  String get invalidDeepLinkDescription =>
      'Tämä linkki saattaa olla rikki, saatavilla vain verkossa tai sinulla ei ehkä ole siihen käyttöoikeutta. Tarkista linkki ja yritä uudelleen.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Siirry etusivulle';

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
    return 'Visionary (elämänikäinen $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count päivää $productName -käyttöaikaa',
      one: '1 päivä $productName -käyttöaikaa',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count viikkoa palvelua $productName',
      one: '1 viikko palvelua $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuukautta $productName',
      one: '1 kuukausi $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vuotta $productName',
      one: '1 vuosi $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Lähettäjä: $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Lunasta lahjasi napauttamalla!';

  @override
  String get embedGiftAlreadyRedeemed => 'Lunastettu jo';

  @override
  String get embedGiftClaimAccountHelp => 'Lunasta lahja luomalla tili.';

  @override
  String get embedGiftClaim => 'Lunasta lahja';

  @override
  String get embedGiftClaimed => 'Lahja lunastettu';

  @override
  String get embedGiftClaimAccount => 'Lunasta tili';

  @override
  String get embedGiftUnknownTitle => 'Tuntematon lahja';

  @override
  String get embedGiftUnknownSubtitle =>
      'Tämä lahjakoodi on virheellinen tai jo käytetty.';

  @override
  String get embedGiftUnavailable => 'Lahja ei saatavilla';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Lunasta lahjasi aktivoidaksesi $productName -tilauksesi!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Tämä lahja on jo lunastettu.';

  @override
  String get giftAcceptMaybeLater => 'Ehkä myöhemmin';

  @override
  String get giftRedeemedToast => 'Lahja lunastettu!';

  @override
  String get giftRedeemInvalidTitle => 'Virheellinen lahjakoodi';

  @override
  String get giftRedeemInvalidMessage =>
      'Koodi on virheellinen tai jo käytetty.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Lahja on jo lunastettu';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Tämä koodi on jo lunastettu.';

  @override
  String get giftRedeemNotFoundTitle => 'Lahjaa ei löydy';

  @override
  String get giftRedeemNotFoundMessage => 'Koodia ei ole olemassa.';

  @override
  String get giftRedeemFailedTitle => 'Lahjan lunastus epäonnistui';

  @override
  String get giftRedeemFailedMessage =>
      'Lahjan lunastus epäonnistui. Yritä uudelleen.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Tämän lahjan lunastus ei onnistu';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary-tilit eivät voi lunastaa Plutonium-lahjoja. Kopioi linkki ja jaa se ystävällesi sen sijaan.';

  @override
  String get giftCopyLink => 'Kopioi lahjalinkki';

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
  String get notificationUseCategoryDefault => 'Käytä oletusarvoja luokasta';

  @override
  String get notificationUseCommunityDefault =>
      'Käytä yhteisön oletusasetuksia';

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
  String get dmDeleteMyMessagesTitle =>
      'Poistetaanko viestisi tästä keskustelusta?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Tämä poistaa pysyvästi kaikki viestit, jotka olet lähettänyt tässä keskustelussa. Toimintoa ei voi kumota.';

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
  String get dmUnnamedGroup => 'Nimetön ryhmä';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Ryhmä: $resolvedName';
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
  String get dmDebugCategory => 'Debuggaa kategoria';

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
  String get addFriendVerifyToSend =>
      'Vahvista sähköpostiosoitteesi ennen kaveripyyntöjen lähettämistä.';

  @override
  String get addFriendFriendsListFull =>
      'Ystävälistasi on täynnä tai sitten heidän listansa. Poista joku ja yritä uudelleen.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'Tämä on oletusemoji palvelussa $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Tämä emoji on tästä yhteisöstä. Voit käyttää sitä kaikkialla.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Tämä on yhteisön mukautettu emoji.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Tämä on yhteisön mukautettu emoji. Pyydä emojin tekijältä kutsua, jotta voit käyttää sitä.';

  @override
  String get emojiInfoFromHeader => 'Tämä emoji on peräisin';

  @override
  String get emojiInfoDiscoverableCommunity => 'Löydettävissä oleva yhteisö';

  @override
  String get emojiInfoPrivateCommunity => 'Yksityinen yhteisö';

  @override
  String get emojiInfoVerifiedCommunity => 'Vahvistettu yhteisö';

  @override
  String get emojiInfoAddToFavorites => 'Lisää suosikkeihin';

  @override
  String get emojiInfoRemoveFromFavorites => 'Poista suosikeista';

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
  String get gifPickerFavoritesEmptyTitle => 'Ei vielä suosikki-GIFejä';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Tähtää GIF-tiedosto nähdäksesi sen täällä.';

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
  String externalLinkWarningLeaving(String productName) {
    return 'Olet poistumassa ${productName}ista';
  }

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
  String profilePreviewMemberSince(String productName) {
    return '$productName-jäsen vuodesta';
  }

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'Hallitse sähköpostiosoitetta, jolla kirjaudut $productName';
  }

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
      'Lähetämme tekstiviestikoodin, kun se on saatavilla. Numerosi ei ole linkitetty tiliisi. Säilytämme vain salatun merkinnän ilman käyttäjätunnusta, jotta voimme tehdä enintään 2 vahvistusta noin 30 päivän aikana.';

  @override
  String get phoneAddSendCode => 'Lähetä koodi';

  @override
  String get phoneVerifyTitle => 'Vahvista puhelinnumero';

  @override
  String get phoneVerifyDescription =>
      'Syötä puhelinnumeroosi lähetetty vahvistuskoodi.';

  @override
  String get phoneAddSuccess => 'Puhelinnumero vahvistettu';

  @override
  String get phoneCountryLabel => 'Maa';

  @override
  String get phoneSearchCountries => 'Hae maita...';

  @override
  String get phoneNumberRequired => 'Puhelinnumero vaaditaan';

  @override
  String get phoneEnterValidNumber => 'Anna kelvollinen matkapuhelinnumero.';

  @override
  String get phoneCannotBeUsed =>
      'Tätä puhelinnumeroa ei voi käyttää. Kokeile toista matkapuhelinnumeroa tai ota yhteyttä tukeen.';

  @override
  String get phoneAlreadyUsed =>
      'Tätä puhelinnumeroa on jo käytetty. Kokeile toista numeroa tai ota yhteyttä tukeen.';

  @override
  String get phoneCodeDidNotWork =>
      'Koodi ei toiminut. Tarkista se ja yritä uudelleen.';

  @override
  String get phoneTooManyAttempts =>
      'Liian monta yritystä. Odota hetki ja yritä sitten uudelleen.';

  @override
  String get phoneSmsUnavailable =>
      'Tekstiviestivahvistus ei ole käytettävissä juuri nyt. Yritä myöhemmin uudelleen tai ota yhteyttä tukeen.';

  @override
  String get phoneNotEligible =>
      'Puhelinnumeron vahvistus ei ole käytettävissä tällä tilillä. Käytä toista menetelmää tai ota yhteyttä tukeen.';

  @override
  String get phoneCaptchaRequired =>
      'Selaimen tarkistus vaaditaan ennen puhelinnumeron vahvistamista. Yritä uudelleen kirjautumissivulta tai ota yhteyttä tukeen.';

  @override
  String get phoneSomethingWentWrong => 'Jokin meni pieleen. Yritä uudelleen.';

  @override
  String get phoneInboundExpensiveDescription =>
      'SMS-viestin lähettäminen tähän numeroon on liian kallista, joten pyydämme sinua lähettämään meille tekstiviestin sen sijaan. Voit myös ottaa yhteyttä tukeen, jotta voimme poistaa tämän vaatimuksen tililtäsi.';

  @override
  String get phoneInboundDefaultDescription =>
      'Sinun täytyy lähettää meille tekstiviesti puhelinnumerosi vahvistamiseksi.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Avaa puhelimen viestisovellus ja luo uusi tekstiviesti.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Lähetä koodi $code numeroon $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Odota, että vastaanotamme viestisi. Tämä voi kestää minuutin.';

  @override
  String get phoneInboundGetNewCode => 'Hae uusi koodi';

  @override
  String get phoneInboundChallengeCodeLabel => 'Koodi lähetettäväksi';

  @override
  String get phoneInboundOurNumberLabel => 'Lähetä numeroon';

  @override
  String get requiredActionTitle => 'Tili vaatii vahvistuksen';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Suorita vaadittu vahvistus, jotta voit jatkaa $productName-palvelun käyttöä.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Rekisteröitymisesi vaatii ylimääräisen roskapostitarkistuksen ennen kuin voit jatkaa.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Vahvista sähköpostiosoitteesi tai puhelinnumerosi jatkaaksesi $productName-palvelun käyttöä.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Jatkaaksesi $productName-palvelun käyttöä suorita alla olevat sähköpostin ja puhelimen vahvistusvaiheet.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Valitse vahvistustapa';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Suorita jokin alla olevista vahvistuspoluista jatkaaksesi $productName-palvelun käyttöä.';
  }

  @override
  String get requiredActionUseEmail => 'Käytä sähköpostia';

  @override
  String get requiredActionUsePhone => 'Käytä puhelinta';

  @override
  String get requiredActionCheckEmailTitle => 'Tarkista sähköpostisi';

  @override
  String get requiredActionCheckEmailDescription =>
      'Lähetimme vahvistuslinkin sähköpostiisi. Avaa se jatkaaksesi.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Lähetä vahvistussähköposti uudelleen';

  @override
  String get requiredActionVerificationEmailSent =>
      'Vahvistussähköposti lähetetty. Tarkista saapuneet-kansiosi.';

  @override
  String get requiredActionSignOut => 'Kirjaudu ulos';

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
  String get networkErrorMessage => 'Tapahtui virhe. Yritä uudelleen.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count viikkoa sitten',
      one: '1 viikko sitten',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuutin kuluttua',
      one: 'minuutin kuluttua',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tunnin kuluttua',
      one: 'tunnin kuluttua',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ' $count päivän kuluttua',
      one: 'päivän kuluttua',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: ' $count viikon kuluttua',
      one: 'viikon kuluttua',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuukauden kuluttua',
      one: 'kuukauden kuluttua',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vuoden kuluttua',
      one: 'vuoden kuluttua',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'juuri nyt';

  @override
  String get authorizedAppsTitle => 'Valtuutetut sovellukset';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Näille sovelluksille on myönnetty pääsy $productName-tiliisi.';
  }

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
  String get userProfileLoading => 'Ladataan profiilia';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName-henkilökunta';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName-yhteisötiimi';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName-kumppani';
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
    return '$productName Plutonium -tilaaja vuodesta $date';
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
    return '$productName Visionary vuodesta $date';
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
  String get userProfileRoles => 'Roolit';

  @override
  String get memberRoleAdd => 'Lisää rooli';

  @override
  String memberRoleRemove(String roleName) {
    return 'Poista rooli $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Tällä käyttäjällä ei ole rooleja tässä yhteisössä.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Ei rooleja vielä. Lisää rooleja täältä: $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Ei rooleja saatavilla';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Tässä yhteisössä ei ole tällä hetkellä rooleja määritettävänä, mutta voit luoda uuden roolin osoitteessa $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Yhteisön asetukset';

  @override
  String get guildSettingsRolesTab => 'Roolit';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Paikallinen aika';

  @override
  String get userProfileSameTimeAsYou => 'Sama aika kuin sinulla';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'sinua $duration edellä';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration sinua jäljessä';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours tuntia',
      one: '1 tunti',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuuttia',
      one: '1 minuutti',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours tuntia',
      one: '1 tunti',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes minuuttia',
      one: '1 minuutti',
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
  String get iarReportGuildTitle => 'Ilmianna yhteisö';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Jos tämä ilmoitus koskee tiettyä viestiä tässä yhteisössä, ilmoita siitä viestistä. Viesti-ilmoitukset antavat turvallisuustiimillemme selkeimmän kontekstin, ja lisätietojen lisääminen kommentteihin voi auttaa meitä käsittelemään sen nopeammin. Jatka yhteisöstä kokonaisuutena ilmoittamista vain, jos viestistä ilmoittaminen ei kattaisi laajempaa ongelmaa.';

  @override
  String get iarContinueToReportCommunity => 'Jatka yhteisön ilmoittamista';

  @override
  String get iarPreviewCommunitySubtitle => 'Yhteisö';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Häirintä tai kohdennettu kiusaaminen';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Yhteisöt mahdollistavat joukkohyökkäykset ja kohdistetun häirinnän.';

  @override
  String get iarReasonHateGuildDescription =>
      'Edistää vihaa suojeltuja ryhmiä kohtaan.';

  @override
  String get iarReasonTerrorismLabel =>
      'Terrorismi tai väkivaltainen ekstremismi';

  @override
  String get iarReasonTerrorismDescription =>
      'Edistää, rekrytoi tai koordinoi väkivaltaista ekstremistitoimintaa.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Aikuisviihde tai turvaton portitus';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Aikuisviihde ilman asianmukaista ikärajaa.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Vaarantaa alaikäisiä tai sisältää lapsiin kohdistuvaa hyväksikäyttöä.';

  @override
  String get iarReasonRaidLabel => 'Hyökkäyksen koordinointi';

  @override
  String get iarReasonRaidDescription =>
      'Koordinoi hyökkäyksiä, joukkoraportointia tai häirintää ihmisiä tai yhteisöjä vastaan.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Yhteisön tarkoitus on roskapostittaa, huijata tai väärinkäyttää alustaa.';

  @override
  String get iarReasonMalwareGuildLabel => 'Haittaohjelmien levitys';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Jakaa haittaohjelmia, kalastelee tunnuksia tai levittää haitallisia tiedostoja.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Yksityisyyden loukkaus tai doxxaus';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Jakaa henkilökohtaisia tietoja, vakoilee käyttäjiä tai koordinoi yksityisyyden loukkauksia.';

  @override
  String get iarReasonSelfHarmGuildLabel =>
      'Kannustaa itsensä vahingoittamiseen';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Kannustaa itsemurhaan, itsensä vahingoittamiseen tai syömishäiriöihin.';

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
  String get slowmodeStatusEnabled => 'Hidas tila käytössä';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Hidas tila aktiivinen ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Hidas tila on asetettu arvoon $durationLabel, mutta sinulla on vapautus.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Hidas tila on asetettu arvoon $durationLabel. Odota ennen kuin lähetät uuden viestin.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Hidas tila on asetettu arvoon $durationLabel tälle kanavalle.';
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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName ylittää kokorajoituksen ($fileSize)';
  }

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
      'Pidä pohjassa tallentaaksesi. Vedä roskakoriin poistaaksesi, liu\'uta ylös lukitaksesi tai vapauta lähettääksesi.';

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
  String get voiceMessageSeekForward => 'Siirry eteenpäin';

  @override
  String get voiceMessageSeekBackward => 'Siirry taaksepäin';

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
  String get chatAttachmentDownloadedToast => 'Tallennettu kuviin';

  @override
  String get chatAttachmentDownloadFailedToast => 'Liitteen lataus epäonnistui';

  @override
  String get chatAttachmentExpiredTooltip => 'Liite vanhentunut';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Näytä ($count riviä)',
      one: 'Näytä ($count rivi)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kutista ($count riviä)',
      one: 'Kutista ($count rivi)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Näytä ($count riviä)',
      one: 'Näytä ($count rivi)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kutista ($count riviä)',
      one: 'Kutista ($count rivi)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count riviä jäljellä)',
      one: '... ($count rivi jäljellä)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count riviä jäljellä)',
      one: '... ($count rivi jäljellä)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Näytä koko tiedosto';

  @override
  String get chatTextualPreviewChangeLanguage => 'Vaihda kieltä';

  @override
  String get chatTextualPreviewSearchLanguage => 'Etsi kieli…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntaksikorostus';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Ei tuloksia';

  @override
  String get chatTextualPreviewMoreOptions => 'Lisää valintoja';

  @override
  String get chatTextualPreviewWrapText => 'Rivitä teksti';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Tiedosto on liian suuri esikatseltavaksi (raja $previewLimitKb kt).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Esikatselua ei voi ladata.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Pelkkä teksti';

  @override
  String get chatTextualPreviewCopy => 'Kopioi';

  @override
  String get chatAttachmentSourceGallery => 'Galleria';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Selaa tiedostoja';

  @override
  String get chatAttachmentPasteTooltip => 'Liitä tiedosto leikepöydältä';

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
  String connectionsDescription(String productName) {
    return 'Linkitä ulkoisia tilejä ja verkkotunnuksia $productName-profiiliisi. Vahvistetut yhteydet näytetään profiilissasi muiden nähtävillä.';
  }

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
  String get lookAndFeelHdrSectionTitle => 'Korkea dynaaminen alue';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Hallitse, miten HDR-kuvat näkyvät HDR-yhteensopivilla näytöillä.';

  @override
  String get lookAndFeelHdrFullName => 'Täysi dynaaminen alue';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Näytä HDR-kuvat täydellä kirkkaudella ja väriskaalalla.';

  @override
  String get lookAndFeelHdrStandardName => 'Vakioalue';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Skaalaa HDR-kuvat vakioväriskaalalle, mikä vähentää kirkkauden huippua.';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'HDR-näyttötila';

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
  String get lookAndFeelChatFontSizeLabel => 'Keskustelun kirjasinkoko';

  @override
  String get lookAndFeelAppZoomTitle => 'Sovelluksen zoomaustaso';

  @override
  String get lookAndFeelAppZoomDescription => 'Säädä sovelluksen zoomaustasoa.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Keskustelun taustakuva';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Valitse tausta keskustelulle. Tämä pysyy tällä laitteella.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Tämä asetus pysyy tällä laitteella';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Keskustelun taustakuva tallennetaan vain tähän laitteeseen eikä synkronoidu muihin laitteisiin.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Oletus';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Mukautettu kuva';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Väri $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Liukuväri $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Himmennä taustakuva';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Kuvan asettaminen taustakuvaksi epäonnistui.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Viestit';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Valitse, miten viestit näytetään chat-kanavilla.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel => 'Viestiryhmien väli';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '$spacing px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Viestien näyttötila';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Mukava';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Tilava asettelu, jossa viestit erottuvat selkeästi toisistaan.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Tiivis';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maksimoi näkyvien viestien määrän minimaalisella välityksellä.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Piilota käyttäjäkuvat';

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
  String get communityTemporarilyUnavailable =>
      'Yhteisö tilapäisesti pois käytöstä';

  @override
  String get guildUnavailableDescription =>
      'Jokin meni pieleen. Korjaamme ongelmaa.';

  @override
  String get guildNotFoundTitle => 'Tämä ei ole etsimäsi yhteisö.';

  @override
  String get guildNotFoundDescription =>
      'Etsimääsi yhteisöä ei ehkä enää ole tai sinulla ei ole siihen pääsyä.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName on tällä hetkellä vain $productName-henkilöstön jäsenten käytettävissä';
  }

  @override
  String get guildNavbarTemporarilyUnavailable =>
      'väliaikaisesti pois käytöstä';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Kokoa yksityisviestit kansioon';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Kun käytössä, lukemattomat yksityisviestit palvelinvalikossa kootaan $productName-painikkeen kansioon. Napsauta $productName-painiketta DM-sivulla laajentaaksesi tai kootaksesi kansion.';
  }

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
  String get favoritesAddToSavedMedia => 'Tallenna mediaan';

  @override
  String get favoritesRemoveFromSavedMedia =>
      'Poista tallennetuista tiedostoista';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Lisää URL-osoitteesta ladattuihin GIF-suosikkeihin';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Poista URL-osoitteesta ladatuista GIF-suosikeista';

  @override
  String get savedMediaAddTitle => 'Tallenna mediaan';

  @override
  String get savedMediaFormNameLabel => 'Nimi';

  @override
  String get savedMediaFormNameHint => 'Omat mediat';

  @override
  String get savedMediaFormAltTextLabel => 'Alt-teksti';

  @override
  String get savedMediaFormAltTextHint => 'Kuvaile mediaa';

  @override
  String get savedMediaFormTagsLabel => 'Tunnisteet';

  @override
  String get savedMediaFormTagsHint => 'hauska, reaktio, työ';

  @override
  String get savedMediaSaveError => 'Tallennusmedian päivitys epäonnistui.';

  @override
  String get savedMediaNameRequired => 'Nimi on pakollinen.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Miten haluat tallentaa suosikkihyfisi?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Voit tallentaa tähtikuvioituja GIF-tiedostoja suosikkeihin URL-osoitteina tai ladata ne tallennettuun mediaasi. Valitse tapa, joka sopii käyttötapaasi. Voit muuttaa sitä milloin tahansa kohdassa Asetukset > Lisäasetukset > Media.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-only suosikit (oletus): synkronoidaan laitteidesi välillä, ei latausta, ei lasketa tallennettuun mediaan. Alkuperäinen media voi kadota, jos sen isäntä poistaa sen.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Tallennettu media: ladattu, merkittävä, haettavissa ja pysyvä, mutta se vähentää tallennetun median rajaasi.';

  @override
  String get gifFavoriteFirstTimeHint => 'Kysymme vain kerran.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'Käytä vain URL-osoitetta (suositeltu)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Käytä tallennettua mediaa';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Kun ladattu suoraan $productName';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'Kameran lataukset';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Valitse, säilytetäänkö laitteellasi sovelluksen sisäisellä kameralla otetut kuvat ja videot';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Tallenna laitteeseen';

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
  String get accessibilitySaturationTitle => 'Kylläisyys';

  @override
  String get accessibilitySaturationDescription =>
      'Säädä teeman värien eloisuutta koko sovelluksessa.';

  @override
  String get accessibilityVisualGroupTitle => 'Visuaalinen';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Alleviivaa linkit aina';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Himmennä yliviivattua tekstiä';

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
  String get accessibilityScreenReaderGroupTitle => 'Näytönlukuohjelma';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Määritä, miten $productName toimii ruudunlukijoiden kanssa.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Ilmoita uusista viesteistä';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Anna ruudunlukijoiden ilmoittaa uusista viesteistä niiden saapuessa avoimelle kanavalle. Ilmoitusääniin tämä ei vaikuta.';

  @override
  String get accessibilityTtsGroupTitle => 'Tekstistä puheeksi';

  @override
  String get accessibilityTtsGroupDescription =>
      'Valitse nopeus puhutulle tekstille.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => 'Puheen toistonopeus';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Toista näyte';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Hiljennä näyte';

  @override
  String get accessibilityPreviewButtonLabel => 'Esikatselupainike';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Tässä näkyy, miten linkit näkyvät: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Esikatselukäyttäjä';

  @override
  String get accessibilityKeyboardGroupTitle => 'Näppäimistö';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Näytä kohdistuskehys chat-tekstikentässä';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Esc-näppäin poistuu näppäimistötilasta';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Näytä pikavalikon pikanäppäimet';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Vahvista ennen puhelun aloittamista';

  @override
  String get accessibilityAnimationGroupTitle => 'Animaatio';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Vähennetty liike on käytössä, joten sisältöanimaatiot on oletusarvoisesti keskeytetty. Voit silti ottaa minkä tahansa niistä takaisin käyttöön, jotta se jatkaa toistoa.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Toista animoituja emojeita';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Toista GIF-kuvat automaattisesti';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Toista GIF-kuvat automaattisesti, kun $productName on käytössä';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Toistetaan, vaikka hidastettu liike on käytössä.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Keskeytetty vähennetyn liikkeen vuoksi. Ota käyttöön, jotta animoidut emojit jatkavat toistoa.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Keskeytetty vähennetyn liikkeen vuoksi. Ota käyttöön, jotta GIF-kuvat jatkavat toistoa.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Oletuksena pois päältä mobiililaitteilla akun keston ja datan säästämiseksi.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Tarranimoinnit';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Tarraselain-animaatioasetukset';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Animoi aina';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Tarrat animoituvat aina';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animoi vuorovaikutuksessa';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Tarrat animoituvat, kun napautat niitä';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Tarrat animoituvat, kun viet hiiren niiden päälle tai käytät niitä';

  @override
  String get accessibilityStickerNeverAnimateName => 'Älä koskaan animoi';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Tarrat eivät koskaan animoidu';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Aina animoitu, vaikka liikkeen vähennys on käytössä.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Vähennetty liike rajoittaa tarrat animoitumaan vain vuorovaikutuksessa. Valitse ”animoi aina” ohittaaksesi tämän.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Oletuksena animaatiot näkyvät mobiililaitteilla vain vuorovaikutuksen yhteydessä akun säästämiseksi.';

  @override
  String get accessibilityMotionGroupTitle => 'Liike';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Synkronoi vähennetty liike -asetus järjestelmän kanssa';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Käytä tämän laitteen järjestelmän pienempää liike-asetusta tai mukauta sitä alla.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Vähennä liikettä';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Poista animaatiot ja siirtymät käytöstä. Ohjataan tällä hetkellä järjestelmäasetuksistasi.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Poista animaatiot ja siirtymät käytöstä koko sovelluksessa.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animoidut emojit, GIF-kuvat ja tarrat pysyvät hallinnassasi Animaatio-välilehdellä.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Aloitetaanko puhelu?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Haluatko varmasti aloittaa tämän puhelun?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Aloita puhelu';

  @override
  String get accessibilityTtsSampleDescription =>
      'Kuule esimerkkilause valitsemallasi nopeudella.';

  @override
  String get accessibilityTtsSampleText =>
      'Olen tullut tulevaisuudesta. Tarvitsen apuasi päästäkseni takaisin vuoteen 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Puhesynteesi ei ole käytettävissä tässä laitteessa.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Puheen toisto epäonnistui. Yritä uudelleen tai tarkista, että ääni toimii.';

  @override
  String get ttsSubstitutionUnknownUser => 'tuntematon käyttäjä';

  @override
  String get ttsSubstitutionUnknownRole => 'tuntematon rooli';

  @override
  String get ttsSubstitutionUnknownChannel => 'tuntematon kanava';

  @override
  String get ttsSubstitutionCodeBlock => 'koodilohko';

  @override
  String get ttsSubstitutionSpoiler => 'spoileri';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'vinokomento $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName sanoi: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Vastauksena käyttäjälle $replyAuthorName, $authorName sanoi: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'lähetti tarran';

  @override
  String get ttsSentAttachment => 'lähetti liitteen';

  @override
  String ttsSentAttachments(int count) {
    return 'lähetetty $count liitettä';
  }

  @override
  String get ttsSentEmbed => 'lähetti upotuksen';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author lähetti viestin $summary';
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
  String get systemCallJoinTheCall => 'Liity puheluun';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username aloitti puhelun, joka kesti $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Missasit puhelun käyttäjältä $username, joka kesti $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Missasit puhelun käyttäjältä $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'muutama sekunti';

  @override
  String get systemCallDurationMinute => 'minuutti';

  @override
  String get systemCallDurationOneYear => '1 vuosi';

  @override
  String get systemCallDurationOneMonth => '1 kuukausi';

  @override
  String get systemCallDurationOneWeek => '1 viikko';

  @override
  String get systemCallDurationOneDay => '1 päivä';

  @override
  String get systemCallDurationOneHour => '1 tunti';

  @override
  String systemCallDurationYears(int count) {
    return '$count vuotta';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count kuukautta';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count viikkoa';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count päivää';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count tuntia';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minuuttia';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Päivitä $productName, jotta voit tarkastella tätä viestiä.';
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
  String get voiceJoinFailedTitle => 'Ei voitu liittyä äänipuheluun';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Et voi erottaa muita laitteitasi. Yritä uudelleen hetken kuluttua.';

  @override
  String get voiceChannelEmptyDescription =>
      'Tämä on äänikanava. Yhdistä aloittaaksesi puhumisen!';

  @override
  String get voiceChannelJoin => 'Liity äänikanavalle';

  @override
  String get voiceCallJoin => 'Liity puheluun';

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
  String get voiceControlFlipCamera => 'Vaihda kameraa';

  @override
  String get voiceControlScreenShare => 'Näytönjako';

  @override
  String get voiceScreenShareNotificationText => 'Näyttösi jaetaan.';

  @override
  String get voiceControlMore => 'Lisää';

  @override
  String get voiceControlDisconnect => 'Katkaise yhteys';

  @override
  String get voiceInChat => 'Äänichatissa';

  @override
  String get voiceConnectionFailed => 'Yhteyttä ei voitu muodostaa';

  @override
  String get voiceConnectionRetry => 'Yritä uudelleen';

  @override
  String get voiceConnectionDismiss => 'Poista';

  @override
  String get voiceConnectionDisconnected => 'Yhteys katkaistu';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Mitataan viivettä...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Siirry kanavalle $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Puheluyhteys';

  @override
  String get voiceConnectionAdvancedStats => 'Lisäasetukset';

  @override
  String get voiceShowCallAvatars => 'Näytä puhelun osallistujien kuvakkeet';

  @override
  String get voiceShowConnectionId => 'Näytä yhteyden tunnus';

  @override
  String get voiceAudioProcessing => 'Äänenkäsittely';

  @override
  String get voiceConnectionSessionSection => 'Istunto';

  @override
  String get voiceConnectionDurationLabel => 'Kesto';

  @override
  String get voiceConnectionParticipantsLabel => 'Osallistujat';

  @override
  String get voiceConnectionNetworkSection => 'Verkko';

  @override
  String get voiceConnectionPingLabel => 'Pingaa';

  @override
  String get voiceConnectionJitterLabel => 'Värinä';

  @override
  String get voiceConnectionSendLabel => 'Lähetä';

  @override
  String get voiceConnectionReceiveLabel => 'Vastaanota';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes min $seconds s';
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
    return '$bandwidth kt/s';
  }

  @override
  String get userAreaMuteMicrophone => 'Mykistä mikrofoni';

  @override
  String get userAreaUnmuteMicrophone => 'Poista mikrofonin mykistys';

  @override
  String get userAreaUserSettings => 'Käyttäjäasetukset';

  @override
  String get voiceParticipantMenuViewProfile => 'Näytä profiili';

  @override
  String get voiceParticipantMenuFocus => 'Kohdista tähän henkilöön';

  @override
  String get voiceParticipantMenuUnfocus => 'Poista kohdistus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Mykistä yhteisössä';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Mykistä yhteisössä';

  @override
  String get voiceParticipantMenuUserVolume => 'Käyttäjän äänenvoimakkuus';

  @override
  String get voiceParticipantMenuStreamVolume => 'Striimin äänenvoimakkuus';

  @override
  String get voiceParticipantMenuStopStreaming => 'Lopeta striimaus';

  @override
  String get voiceParticipantModerationFailed =>
      'Jäsenen tietojen päivittäminen epäonnistui. Yritä uudelleen.';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceCallViewModeLabel => 'Näytä';

  @override
  String get voiceCallViewModeGrid => 'Ruudukko';

  @override
  String get voiceCallViewModeFocus => 'Keskity';

  @override
  String get voicePanelSettingsSectionTitle => 'Ääniasetukset';

  @override
  String get voicePanelUseEarpieceLabel => 'Käytä kuuloketta';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Näytä vain videot';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Näytä vain osallistujat, joilla on kamera päällä.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Näytä oma kamerani';

  @override
  String get voicePrioritizeSpeakersLabel => 'Priorisoi puhujat';

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
  String get privacyDashboardProfilePrivacySection => 'Profiilin yksityisyys';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Ystävät ja suorat viestit';

  @override
  String get privacyDashboardActivitySharingSection => 'Aktiviteetin jakaminen';

  @override
  String get privacyDashboardSensitiveContentSection =>
      'Arkaluonteinen sisältö';

  @override
  String get privacyDashboardDataExportSection => 'Tietojen vienti';

  @override
  String get privacyDashboardDataDeletionSection => 'Tietojen poistaminen';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Kuka voi nähdä koko profiilisi';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Kaverit ja kaikki yhteisöt';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Koko profiilisi näkyy ystäville ja kaikille yhteisöjesi jäsenille';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Vain kaverit ja pienet yhteisöt';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Koko profiilisi näkyy ystäville ja yhteisöjen jäsenille, joissa on enintään 200 jäsentä';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Vain kaverit';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Koko profiilisi näkyy vain ystävillesi';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Kaveripyynnöt';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Kaikki';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Salli kenen tahansa lähettää sinulle kaveripyyntöjä';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Ystävien ystävät';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Salli ystävien ystävien lähettää sinulle pyyntöjä';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Yhteisön jäsenet';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Salli yhteisöjesi jäsenten lähettää sinulle pyyntöjä';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Suorat viestit';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Salli suorat viestit yhteisön jäseniltä';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Salli yhteisöjesi jäsenten lähettää sinulle yksityisviestejä';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Salli yhteisöbottien lähettämät suorat viestit';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Salli yhteisöistäsi tulevien bottien lähettää sinulle yksityisviestejä';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Hallitse, kuka voi lähettää sinulle kaveripyyntöjä ja yksityisviestejä';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Hallitse, kuka voi soittaa sinulle ja lisätä sinut ryhmäkeskusteluihin';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Saapuvat puhelut';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Hallitse, kuka voi soittaa sinulle';

  @override
  String get privacyDashboardAllowedCallers => 'Sallitut soittajat';

  @override
  String get privacyDashboardIncomingCallNobody => 'Ei kukaan';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Estä kaikki saapuvat puhelut';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Vain ystävät';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Salli vain ystävien soittaa sinulle (suositus)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Ystävät + Mukautettu';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Salli ystävät sekä lisäryhmät, jotka valitset';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Kaikki';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Salli kenen tahansa soittaa sinulle, myös tuntemattomien';

  @override
  String get privacyDashboardAdditionalGroups => 'Lisäryhmät';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Ystävien ystävät voivat soittaa sinulle';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Ihmiset yhteisöistä, joissa olette molemmat jäseninä, voivat soittaa sinulle';

  @override
  String get privacyDashboardRingBehavior => 'Renkaan toiminta';

  @override
  String get privacyDashboardSilentCalls => 'Hiljaiset puhelut kaikilta';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Kaikki puhelut ilmoittavat hiljaa soiton sijaan. Oletuksena ei-ystäviltä tulevat puhelut ovat aina hiljaisia.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Kuka voi lisätä sinut ryhmäkeskusteluihin';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Hallitse, kuka voi lisätä sinut ryhmäkeskusteluihin pyytämättä. Kuka tahansa voi silti lähettää sinulle kutsulinkkejä liittyäksesi.';

  @override
  String get privacyDashboardAllowedInvites => 'Sallitut kutsut';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Älä anna kenenkään lisätä sinua ryhmäkeskusteluihin kysymättä';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Salli vain ystävien lisätä sinut ilman pyyntöä (suositeltu)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Salli ystävien ja lisäryhmien lisätä sinut';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Salli kenen tahansa lisätä sinut ryhmäkeskusteluihin kysymättä';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Ystävien ystävät voivat lisätä sinut ryhmäkeskusteluihin';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Ihmiset yhteisöistä, joissa olette molemmat jäseninä, voivat lisätä sinut ryhmäkeskusteluihin';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Ääniaktiivisuus nyt aktiivisena -tilassa';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Jaa äänitoimintasi ystävien kanssa';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Jaetaanko äänitoiminta kaikkien kavereiden kanssa?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Lopetetaanko puheaktiivisuuden jakaminen kaikille kavereille?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Olet juuri aloittamassa puheaktiivisuutesi jakamisen kaikkien nykyisten ja tulevien ystäviesi kanssa. Tämä lähettää päivityksen heille kaikille, ja asetusta voi muuttaa uudelleen vasta 24 tunnin kuluttua.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Olet aikeissa lopettaa puheaktiivisuutesi jakamisen kaikkien nykyisten ja tulevien ystäviesi kanssa. Tästä lähetetään ilmoitus heille kaikille, ja asetusta voi muuttaa uudelleen vasta 24 tunnin kuluttua.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Kyllä, jaa kaikille kavereille';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Kyllä, lopeta jakaminen';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Käytettävissä uudelleen $time kuluttua';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Puheaktiivisuuden jakaminen päivitetty';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Äänen jakamisen tilaa ei voitu päivittää juuri nyt';

  @override
  String get privacyDashboardDataExportDesc =>
      'Luo ladattava arkisto tilitiedoistasi, mukaan lukien viestit ja liitteiden URL-osoitteet. Useimmat haluavat kaiken, mutta voit rajata sisältöä alla.';

  @override
  String get privacyDashboardExportMyData => 'Vie tietoni';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Poista pysyvästi lähettämäsi viestit suorista viesteistä, ryhmäviesteistä ja yhteisöistä. Toiminto suoritetaan taustalla, ja saat suoran viestin, kun se on valmis.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Poista viestini';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Sallitaanko suorat viestit yhteisön jäseniltä?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Estetäänkö yhteisön jäsenten suorat viestit?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Sallitaanko bottien lähettää sinulle suoria viestejä?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Estä botteja lähettämästä sinulle suoria viestejä?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Haluatko sallia suorat viestit myös nykyisten yhteisöjesi jäseniltä?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Haluatko estää myös suorat viestit nykyisten yhteisöjesi jäseniltä?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Haluatko sallia myös bottien lähettävän sinulle suoria viestejä nykyisistä yhteisöistäsi?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Haluatko estää botit myös nykyisistä yhteisöistäsi?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Voit muuttaa tätä asetusta myös yhteisökohtaisesti painamalla yhteisön nimeä pitkään ja valitsemalla Tietosuoja-asetukset.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Salli kaikille yhteisöille';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Estä kaikissa yhteisöissä';

  @override
  String get privacyDashboardDmConfirmSkip => 'Ohita tämä vaihe';

  @override
  String get privacyDashboardDataRequestGoBack => 'Takaisin';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Vie tietoni';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Poista viestini';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Käsittelemme tämän mahdollisimman pian. Saat sähköpostin, kun arkistosi on valmis.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Käsittelemme tämän mahdollisimman pian. Saat meiltä yksityisviestin, kun se on valmis.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Mitä sisällytetään';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Kaikki';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Vie kaikki lähettämäsi viestit sekä kaikki tilisi asetukset, jäsenyydet ja metatiedot.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Mukautettu valinta';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Valitse arkistoon sisällytettävät keskustelutyypit, yhteisöt ja aikaväli.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Valitse sisällytettävät kohteet';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Valitse, millaisia keskusteluja haluat siivota.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Vain paikat, joihin minulla ei ole enää pääsyä';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Poista viestejä vain yhteisöistä ja ryhmäkeskusteluista, joista olet lähtenyt tai joista sinut on poistettu.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Mitkä keskustelut';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Valitse keskustelutyypit, jotka haluat sisällyttää.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Suorat viestit';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Suljetut yksityisviestit';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Ryhmäkeskustelut';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Yhteisöt';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Mitkä yhteisöt';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Yhteisösuodatin';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Sisällytä kaikki valittuja lukuun ottamatta';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'Vain valitut';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Et ole tällä hetkellä missään yhteisössä.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Aikaväli';

  @override
  String get privacyDashboardDataRequestDateMode => 'Aikaväli';

  @override
  String get privacyDashboardDataRequestAllTime => 'Koko aika';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Mukautettu aikaväli';

  @override
  String get privacyDashboardDataRequestStartDate => 'Alkamispäivä';

  @override
  String get privacyDashboardDataRequestEndDate => 'Päättymispäivä';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Jätä toinen kenttä tyhjäksi, jos et halua asettaa rajaa kyseiseen ajanjakson päähän.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Valitse vähintään yksi keskustelutyyppi sisällytettäväksi.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Alkamispäivämäärän on oltava aikaisempi kuin päättymispäivämäärän.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Tarkista ja vahvista';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Luomme ladattavan arkiston kaikista lähettämistäsi viesteistä ja lähetämme sinulle sähköpostin, kun se on valmis. Sähköpostin latauslinkki vanhenee 7 päivän kuluttua.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Luomme ladattavan arkiston, joka vastaa alla olevia suodattimia, ja lähetämme sinulle sähköpostin, kun se on valmis. Sähköpostissa oleva latauslinkki vanhenee 7 päivän kuluttua.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Poista pysyvästi alla olevia suodattimia vastaavat viestit. Tätä toimintoa ei voi kumota.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Tätä toimintoa ei voi peruuttaa, kun se on aloitettu. Ilmoitamme sinulle yksityisviestillä, kun se on valmis.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Pyydä vientiä';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Poista viestejä';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Haku';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Keskustelut';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Yhteisöt';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Aikaväli';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Ei mitään';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Alkaen $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Aikaan $end asti';
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
      other: '# yhteisöä',
      one: '# yhteisö',
    );
    return 'Kaikki paitsi $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# yhteisöä',
      one: '# yhteisö',
    );
    return 'Vain $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Avoimet suorat viestit';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Suljetut suorat viestit';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Suorat viestit (avoimet ja suljetut)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Ryhmäkeskustelut';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Yhteisöt';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# tuntia',
      one: '# tunti',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuuttia',
      one: '# minuutti',
    );
    return '$_temp0 ja $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# tuntia',
      one: '# tunti',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minuuttia',
      one: '# minuutti',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# sekuntia',
      one: '# sekunti',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Yksityisyysasetusten lataaminen epäonnistui';

  @override
  String get privacyDashboardRetry => 'Yritä uudelleen';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Asetusten tallentaminen arkaluontoisiin sisältöihin epäonnistui.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Pyynnön suorittaminen epäonnistui.';

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
      'Odotetaan hidastetun tilan päättymistä yhdessä tai useammassa valitussa kanavassa.';

  @override
  String get slowmodeRateLimitedTitle => 'Hidas tila käytössä';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Hidas tila on käytössä – odota $duration ennen kuin lähetät uuden viestin.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Suora lataus on poissa käytöstä hidastuksen aikana.';

  @override
  String get shareMediaTitle => 'Jaa kohteeseen';

  @override
  String get shareMediaMessageHint => 'Lisää valinnainen viesti…';

  @override
  String get shareMediaSendButton => 'Lähetä';

  @override
  String get shareMediaSuccessToast => 'Media jaettu';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Jaettu kohteeseen $count kohteeseen';
  }

  @override
  String get shareMediaFailedToast => 'Median jakaminen epäonnistui';

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
  String get chatMessageCopyEmbedText => 'Kopioi upotuksen teksti';

  @override
  String get chatMessageTranslate => 'Käännä';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Käännetty kielestä $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Näytä alkuperäinen';

  @override
  String get chatMessageSeeTranslation => 'Näytä käännös';

  @override
  String get chatMessageTranslating => 'Kääntää…';

  @override
  String get chatMessageTranslateFailed => 'Viestiä ei voitu kääntää.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Käännös ei ole saatavilla tässä laitteessa.';

  @override
  String get chatMessageSpeak => 'Kuuntele viesti';

  @override
  String get chatMessageStopSpeaking => 'Lopeta puhuminen';

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
  String get chatMessageOpenLink => 'Avaa linkki';

  @override
  String get chatMessageCopyLink => 'Kopioi linkki';

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
  String get chatReactionAddFailed => 'Reaktion lisääminen epäonnistui';

  @override
  String get chatReactionRemoveFailed => 'Reaktion poistaminen epäonnistui';

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
  String iarReasonOtherDescription(String productName) {
    return 'Käytä vain, jos se rikkoo selvästi $productName sääntöjä eikä sovi yllä oleviin.';
  }

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
  String get chatMessageDeleteAttachment => 'Poista liite';

  @override
  String get chatMessageEditAttachmentAltText =>
      'Muokkaa vaihtoehtoista tekstiä';

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
      other: '$count estettyä viestiä',
      one: '1 estetty viesti',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potentiaalista roskapostiviestiä',
      one: '1 potentiaalinen roskapostiviesti',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Vastaus piilotettu, koska alkuperäinen kirjoittaja on estetty.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Vastaus piilotettu, koska alkuperäinen kirjoittaja on merkitty roskapostittajaksi.';

  @override
  String get devMarkAsSpamLocally => 'Merkitse roskapostiksi paikallisesti';

  @override
  String get devIgnoreSpamFlag => 'Ohita roskapostimerkintä';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'Median asetukset';

  @override
  String get mediaViewerCopyLink => 'Kopioi linkki';

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
    return 'Liite $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Sulje';

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
  String get composerAutocompleteSuggestions => 'Ehdotukset';

  @override
  String get composerAutocompleteCommandsHeading => 'Komennot';

  @override
  String get composerAutocompleteChoicesHeading => 'Valinnat';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Valinnaiset argumentit';

  @override
  String get composerAutocompleteChannelsHeading => 'Kanavat';

  @override
  String get composerAutocompleteMembersHeading => 'Jäsenet';

  @override
  String get composerAutocompleteUsersHeading => 'Käyttäjät';

  @override
  String get composerAutocompleteMentionsHeading => 'Maininnat';

  @override
  String get composerAutocompleteRolesHeading => 'Roolit';

  @override
  String get composerAutocompleteMediaHeading => 'Media';

  @override
  String get composerAutocompleteStickersHeading => 'Tarrat';

  @override
  String get composerAutocompleteGifsHeading => 'GIFit';

  @override
  String get composerAutocompleteNoGifs => 'Ei GIFejä löytynyt';

  @override
  String get composerCommandShrugDescription => 'Lisää viestiisi ¯\\_(ツ)_/¯.';

  @override
  String get composerCommandTableflipDescription =>
      'Lisää viestiisi (╯°□°)╯︵ ┻━┻.';

  @override
  String get composerCommandUnflipDescription =>
      'Lisää viestiisi ┬─┬ ノ( ゜-゜ノ).';

  @override
  String get composerCommandMeDescription =>
      'Lähetä toimintaviesti (kursivoitu).';

  @override
  String get composerCommandSpoilerDescription =>
      'Lähetä spoileriviesti (käärii spoileritageihin).';

  @override
  String get composerCommandTtsDescription =>
      'Lähetä tekstistä puheeksi -viesti.';

  @override
  String get composerCommandNickDescription =>
      'Vaihda lempinimesi tässä yhteisössä.';

  @override
  String get composerCommandKickDescription =>
      'Potkaise jäsen pois tästä yhteisöstä.';

  @override
  String get composerCommandBanDescription =>
      'Anna jäsenelle porttikielto tähän yhteisöön.';

  @override
  String get composerCommandMsgDescription =>
      'Lähetä suora viesti käyttäjälle.';

  @override
  String get composerCommandSavedDescription =>
      'Lähetä tallennettu mediatiedosto.';

  @override
  String get composerCommandStickerDescription => 'Lähetä tarra.';

  @override
  String get composerCommandGifDescription => 'Etsi ja lähetä GIF.';

  @override
  String get composerCommandMemberOption => 'Kohdejäsen.';

  @override
  String get composerCommandReasonOption => 'Syy (valinnainen).';

  @override
  String get composerCommandMessageOption => 'Viesti lähetettäväksi.';

  @override
  String get composerCommandQueryOption => 'Mitä etsitään.';

  @override
  String get composerCommandNicknameOption =>
      'Uusi lempinimesi, tai jätä tyhjäksi palauttaaksesi sen.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Kuinka paljon jäsenen viimeaikaisista viesteistä poistetaan.';

  @override
  String get composerCommandDeleteMessagesNone => 'Älä poista mitään';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Edelliset $count päivää';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Edelliset 24 tuntia';

  @override
  String get composerCommandOptionRequired =>
      'Tämä valinta on pakollinen. Anna arvo.';

  @override
  String get composerCommandClear => 'Tyhjennä komento';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Muutit lempinimesi tässä yhteisössä nimestä **$previousNickname** nimeen **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Tuntematon käyttäjä';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Viestin lähettäminen käyttäjälle **$username** epäonnistui. Heillä voi olla yksityisviestit pois päältä tai olet estetty.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count lisää';
  }

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
  String get addGuildCreateTitle => 'Luo yhteisö';

  @override
  String get addGuildCreateDescription =>
      'Luo yhteisö sinulle ja ystävillesi keskustelua varten.';

  @override
  String get addGuildCreateNameLabel => 'Yhteisön nimi';

  @override
  String get addGuildCreateSubmit => 'Luo yhteisö';

  @override
  String get addGuildCreateFailed =>
      'Yhteisön luominen epäonnistui. Yritä uudelleen.';

  @override
  String get addGuildCreateClaimTitle => 'Lunasta tilisi';

  @override
  String get addGuildCreateClaimDescription =>
      'Sinun on vahvistettava tilisi, ennen kuin voit luoda yhteisön.';

  @override
  String get addGuildCreateVerifyTitle => 'Vahvista sähköpostiosoitteesi';

  @override
  String get addGuildCreateVerifyDescription =>
      'Vahvista sähköpostiosoitteesi ennen kuin voit luoda yhteisön.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Uutta yhteisöä luotaessa ei tueta animoituja kuvakkeita. Käytä staattista kuvaa.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Luomalla yhteisön hyväksyt noudattavasi ja ylläpitäväsi ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName yhteisön säännöt';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Tämä instanssi on yhden yhteisön instanssi, joten lisäyhteisöjä ei voi luoda.';

  @override
  String get addGuildCreateChangeIcon => 'Vaihda kuvaketta';

  @override
  String get addGuildCreateIconLabel => 'Yhteisön kuvake';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Enintään 10 Mt. Suositus: 512×512 px';

  @override
  String get addGuildImportDescription =>
      'Liitä Discord-mallin URL-osoite tuodaksesi sen rakenteen uuteen yhteisöön.';

  @override
  String get addGuildImportUrlLabel => 'Mallin URL-osoite';

  @override
  String get addGuildImportUrlInvalid =>
      'Anna kelvollinen Discord-mallin URL-osoite tai koodi.';

  @override
  String get addGuildImportFetchFailed =>
      'Mallin hakeminen epäonnistui. Mallia ei ehkä ole olemassa tai ulkoinen palvelu ei ole käytettävissä.';

  @override
  String get addGuildImportInvalidResponse =>
      'Tämä ei näytä kelvolliselta mallivastaukselta.';

  @override
  String get addGuildImportTemplateLabel => 'Mallipohja';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount tekstikanavaa, $voiceChannelCount äänikanavaa, $categoryCount kategoriaa, $roleCount roolia';
  }

  @override
  String get addGuildImportRemoveIcon => 'Poista kuvake';

  @override
  String get addGuildImportTemplateInvalid =>
      'Yhteisömallin tiedot ovat virheellisiä tai vioittuneita.';

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
  String get channelDetailsFallbackTitle => 'Tiedot';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Ryhmä-DM · $count jäsentä';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Sulje keskustelusi henkilön $name kanssa?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Poistu ryhmästä $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Kanavan asetukset';

  @override
  String get channelDetailsGroupSettingsTitle => 'Ryhmän asetukset';

  @override
  String get channelDetailsDmSettingsTitle => 'DM-asetukset';

  @override
  String get channelDetailsInvitePeople => 'Kutsu ihmisiä';

  @override
  String get channelDetailsCopyLink => 'Kopioi linkki';

  @override
  String get channelMenuCopyChannelLink => 'Kopioi kanavalinkki';

  @override
  String get channelMenuCopyRedirectLink => 'Kopioi uudelleenohjauslinkki';

  @override
  String get channelDetailsAddFriendsToGroup => 'Lisää ystäviä ryhmään';

  @override
  String get channelDetailsGroupInvites => 'Ryhmäkutsut';

  @override
  String get channelDetailsEditChannel => 'Muokkaa kanavaa';

  @override
  String get channelDetailsDeleteChannel => 'Poista kanava';

  @override
  String get channelSettingsCategorySettingsTitle => 'Kategorian asetukset';

  @override
  String get channelSettingsEditCategory => 'Muokkaa kategoriaa';

  @override
  String get channelSettingsTabOverview => 'Yleiskatsaus';

  @override
  String get channelSettingsTabPermissions => 'Käyttöoikeudet';

  @override
  String get channelSettingsTabInvites => 'Kutsut';

  @override
  String get channelSettingsTabWebhooks => 'Webhookit';

  @override
  String get channelSettingsDeleteChannel => 'Poista kanava';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Haluatko varmasti poistaa kanavan $channelName? Tätä ei voi peruuttaa.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Haluatko varmasti poistaa kohteen $categoryName? Tätä ei voi peruuttaa.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Poista kategoria';

  @override
  String get channelSettingsChannelUpdated => 'Kanava päivitetty';

  @override
  String get channelSettingsChannelName => 'Kanavan nimi';

  @override
  String get channelSettingsCategoryName => 'Luokan nimi';

  @override
  String get channelSettingsMyCategory => 'Oma kategoria';

  @override
  String get categoryExpandCategory => 'Laajenna kategoria';

  @override
  String get categoryCollapseCategory => 'Tiivistä kategoria';

  @override
  String get categoryExpandAllCategories => 'Laajenna kaikki kategoriat';

  @override
  String get categoryCollapseAllCategories => 'Tiivistä kaikki kategoriat';

  @override
  String get categoryMuteCategory => 'Mykistä kategoria';

  @override
  String get categoryUnmuteCategory => 'Poista luokan mykistys';

  @override
  String get categoryCopyCategoryId => 'Kopioi luokan tunnus';

  @override
  String get categoryIdCopied => 'Kategorian tunnus kopioitu';

  @override
  String get channelSettingsChannelNamePlaceholder => 'yleiset';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Aihe';

  @override
  String get channelSettingsTopicPlaceholder => 'Lisää aihe tälle kanavalle';

  @override
  String get channelSettingsInsertEmoji => 'Lisää emoji';

  @override
  String get channelSettingsTopicTooLongTitle => 'Kanavan aihe on liian pitkä.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Lyhennä aihetta ja yritä uudelleen.';

  @override
  String get channelSettingsSlowmode => 'Hidas tila';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Viive viestien välillä. \"$bypassSlowmodePermissionLabel\" voi ohittaa sen.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Pois päältä';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds sekuntia';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minuuttia';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours tuntia';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minuutti';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour tunti';
  }

  @override
  String get channelSettingsVoiceQuality => 'Äänenlaatu';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Suurempi bittinopeus = parempi laatu ja suurempi kaistanleveyden käyttö.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kt/s';
  }

  @override
  String get channelSettingsParticipantLimit => 'Osallistujarajoitus';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maksimijäsenmäärä, jotka voivat liittyä kerralla. 0 tarkoittaa rajattomasti.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count osallistujaa',
      one: '1 osallistuja',
      zero: '∞ Ei rajaa',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Yhteysrajoitus';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Suurin aktiivisten yhteyksien määrä, jonka yksi jäsen voi pitää tässä kanavassa.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yhteyttä',
      one: '1 yhteys',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Puhealue';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Valitse äänialue tälle kanavalle. Automaattinen käyttää lähintä aluetta.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automaattinen';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Äänialueita ei voitu ladata';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Yritä hetken kuluttua uudelleen.';

  @override
  String get channelSettingsResetSlider => 'Palauta liukusäädin oletusarvoon';

  @override
  String get channelSettingsAdvanced => 'Lisäasetukset';

  @override
  String get channelSettingsMatureContentOverride =>
      'Aikuisille tarkoitetun sisällön ohitus';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Ohita tämän kanavan $scopeLevel-tason asetus. Kypsää sisältöä näytetään portin takana ennen sisäänpääsyä.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Peri';

  @override
  String get channelSettingsMatureContentOn => 'Päällä';

  @override
  String get channelSettingsMatureContentOff => 'Pois päältä';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Merkitse tämä kanava aikuisille suunnatuksi sisällöksi.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Jätä tämä kanava avoimeksi aikuisille suunnatulle sisällölle.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Periytynyt kohteesta $inheritedSourceLabel: päällä';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Periytynyt kohteesta $inheritedSourceLabel: pois päältä';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'kategoria';

  @override
  String get channelSettingsMatureContentCommunitySource => 'yhteisö';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategoria';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Yhteisö';

  @override
  String get channelSettingsContentWarningToggle =>
      'Näytä sisältövaroitus tällä kanavalla';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Näyttää suostumuskehotteen ennen tähän kanavaan liittymistä.';

  @override
  String get channelSettingsContentWarningText => 'Mukautettu varoitusteksti';

  @override
  String get channelSettingsContentWarningDefault =>
      'Sisältää arkaluonteista sisältöä.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Tarvitset luvan \"$manageChannelsPermissionLabel\" muokataksesi näitä käyttöoikeuksia.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Tarvitset luvan \"$manageRolesPermissionLabel\" muokataksesi näitä oikeuksia.';
  }

  @override
  String get channelSettingsUnknownRole => 'Tuntematon rooli';

  @override
  String get channelSettingsUnknownUser => 'Tuntematon käyttäjä';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'Pääsyn ohitukset';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Muokkaa käyttöoikeutta kohteelle $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => 'Takaisin ohituksiin';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Määritä tämän kanavan peruskäyttöoikeudet';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Määritä tämän roolin ohitukset';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Määritä tämän jäsenen ohitukset';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Hae käyttöoikeuksia…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Kanavan käyttöoikeudet päivitetty';

  @override
  String get channelSettingsPermissionsTitle => 'Käyttöoikeuksien hallinta';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Tämä kanava on synkronoitu yläluokan kanssa ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Tätä kanavaa ei ole synkronoitu yläluokan kanssa ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Synkronoi luokan kanssa';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanava synkronoitu yläluokan kanssa';

  @override
  String get channelSettingsPermissionsAddOverride => 'Lisää ohitus';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Hae rooleja tai jäseniä…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Roolit ja jäsenet';

  @override
  String get channelSettingsDeleteInvite => 'Poista kutsu';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Poistetaanko tämä kutsu? Toimintoa ei voi kumota.';

  @override
  String get channelSettingsCopyInviteCode => 'Kopioi kutsukoodi';

  @override
  String get channelSettingsCopyInviteUrl => 'Kopioi kutsulinkki';

  @override
  String get channelSettingsWebhookCreated => 'Webhook luotu';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Webhookin luominen epäonnistui';

  @override
  String get channelSettingsCreateWebhook => 'Luo webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Hallitse tämän kanavan kutsujen linkkejä.';

  @override
  String get channelSettingsInvitesCreate => 'Luo kutsu';

  @override
  String get channelSettingsInvitesEmpty => 'Ei kutsulinkkejä';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Tällä kanavalla ei ole vielä yhtään kutsulinkkiä. Luo sellainen kutsuaksesi ihmisiä tälle kanavalle.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Kutsulinkkien lataamisessa tälle kanavalle tapahtui virhe. Yritä uudelleen.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Hallinnoi saapuvia webhookeja, jotka voivat lähettää viestejä tälle kanavalle.';

  @override
  String get channelSettingsWebhooksEmpty => 'Ei webhookeja';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Tälle kanavalle ei ole määritetty Webhookeja. Luo Webhook, jotta ulkoiset sovellukset voivat lähettää viestejä.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Tämä kanava ei tue webhookeja.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Tarvitset \"$permission\"-oikeuden nähdäksesi ja muokataksesi tämän kanavan webhookeja.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Webhookien lataus epäonnistui';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Verkkokoukkujen lataamisessa tälle kanavalle tapahtui virhe. Yritä uudelleen.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Luonut $creator $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Tuntematon käyttäjä';

  @override
  String get channelSettingsWebhooksAvatar => 'Profiilikuva';

  @override
  String get channelSettingsWebhooksUploadImage => 'Lataa kuva';

  @override
  String get channelSettingsWebhooksRemove => 'Poista';

  @override
  String get channelSettingsWebhooksName => 'Nimi';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhookin nimi';

  @override
  String get channelSettingsWebhooksChannel => 'Kanava';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook-URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Kopioi webhook-URL';

  @override
  String get channelSettingsWebhooksDelete => 'Poista webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Verkkokoukun poistaminen epäonnistui';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Poistetaanko tämä webhook? Tätä ei voi peruuttaa.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Yritä hetken kuluttua uudelleen.';

  @override
  String get channelMenuOpenChat => 'Avaa chat';

  @override
  String get channelMenuDuplicateChannel => 'Monista kanava';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Nollaa aikuisille tarkoitetun sisällön hyväksyntä';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Poistetaanko viestisi tältä kanavalta?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Tämä poistaa pysyvästi kaikki viestit, jotka olet lähettänyt tällä kanavalla. Toimintoa ei voi kumota.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Poista viestini';

  @override
  String get channelMenuDeletedYourMessages => 'Poistit viestisi';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Viestejäsi ei voitu poistaa';

  @override
  String get channelDetailsSystemMessage => 'Järjestelmäviesti';

  @override
  String get channelDetailsTextChannel => 'Tekstikanava';

  @override
  String get channelDetailsVoiceChannel => 'Puhekanava';

  @override
  String get channelDetailsCategory => 'Kategoria';

  @override
  String get channelDetailsLinkChannel => 'Linkitä kanava';

  @override
  String get channelDetailsGenericChannel => 'Kanava';

  @override
  String get channelDetailsMutedConversation => 'Keskustelu mykistetty';

  @override
  String get channelDetailsUnmutedConversation =>
      'Keskustelu otettu takaisin käyttöön';

  @override
  String get channelDetailsMutedChannel => 'Kanava mykistetty';

  @override
  String get channelDetailsUnmutedChannel => 'Kanava mykistettiin';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Ilmoitusasetukset päivitetty';

  @override
  String get channelDetailsTabMembers => 'Jäsenet';

  @override
  String get channelDetailsTabPins => 'Kiinnitetyt viestit';

  @override
  String get channelDetailsActionMute => 'Mykistä';

  @override
  String get channelDetailsActionUnmute => 'Poista mykistys';

  @override
  String get channelDetailsActionSearch => 'Haku';

  @override
  String get channelDetailsActionMore => 'Lisää';

  @override
  String get channelDetailsMembersEmptyTitle => 'Ei jäseniä näytettäväksi';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Jäsenet ilmestyvät tähän, kun yhteisön tiedot on ladattu.';

  @override
  String get memberListPermissionDeniedTitle => 'Et voi tarkastella jäseniä';

  @override
  String get memberListPermissionDeniedBody =>
      'Et voi tarkastella tämän kanavan jäseniä tässä yhteisössä';

  @override
  String get memberListUnavailableTitle => 'Jäsenluettelo ei saatavilla';

  @override
  String get memberListUnavailableBody =>
      'Jäsenluettelot eivät ole tilapäisesti saatavilla tässä yhteisössä';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'Pinnejä ei voitu ladata';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Jäsenet, joilla on \"Kiinnitä viestit\" -oikeus, voivat kiinnittää viestejä kaikkien nähtäväksi.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Voit kiinnittää viestejä tähän keskusteluun, jotta kaikki näkevät ne.';

  @override
  String get channelDetailsPinsEndReached => 'Olet saavuttanut lopun';

  @override
  String get channelHeaderOpenDetails => 'Avaa kanavan tiedot';

  @override
  String get channelHeaderPinnedMessages => 'Kiinnitetyt viestit';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Pinnatut viestit, lukemattomat';

  @override
  String get channelHeaderMemberList => 'Jäsenluettelo';

  @override
  String get channelHeaderInbox => 'Saapuneet';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Ilmoitusasetukset, mykistetty';

  @override
  String get channelDetailsSearchTitle => 'Haku';

  @override
  String get channelDetailsSearchHint => 'Etsi viestejä';

  @override
  String get channelDetailsSearchFilterFrom => 'Lähettäjä';

  @override
  String get channelDetailsSearchFilterHas => 'Sisältää';

  @override
  String get channelDetailsSearchFilterIn => 'Kanavalla';

  @override
  String get channelDetailsSearchFilterMentions => 'Maininnat';

  @override
  String get channelDetailsSearchFilterMore => 'Lisää';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktiivinen';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kanavaa';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count käyttäjää';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Käyttäjä';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Botti';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Suodata kanavan mukaan';

  @override
  String get channelDetailsSearchChannelsHint => 'Hae kanavia';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Kanavia ei löytynyt';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Kiinnitetyt';

  @override
  String get channelDetailsSearchPinnedTrue => 'Vain kiinnitetyt';

  @override
  String get channelDetailsSearchPinnedFalse => 'Ei sisällä kiinnitettyjä';

  @override
  String get channelDetailsSearchClearFilter => 'Tyhjennä';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Tekijätyyppi';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Päivämäärä';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Päivämäärätila';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Valitse päivämäärä';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Linkin verkkotunnus';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Tiedostonimi sisältää';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Tiedostopääte';

  @override
  String get channelDetailsSearchContentPoll => 'Kysely';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Viestit, joissa on äänestys';

  @override
  String get channelDetailsSearchContentForward => 'Lähetä edelleen';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Välitetyt viestit';

  @override
  String get channelDetailsSearchFilterSort => 'Lajittele';

  @override
  String get channelHeaderSearchFiltersTitle => 'Haku suodattimet';

  @override
  String get channelHeaderSearchRecentTitle => 'Viimeisimmät haut';

  @override
  String get channelHeaderSearchUsersTitle => 'Käyttäjät';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanavat';

  @override
  String get channelHeaderSearchValuesTitle => 'Arvot';

  @override
  String get channelHeaderSearchDatesTitle => 'Päivämäärät';

  @override
  String get channelHeaderSearchDefaultBadge => 'Oletus';

  @override
  String get channelHeaderSearchClearHistory => 'Tyhjennä';

  @override
  String get channelHeaderSearchFilterDescFrom => 'käyttäjä';

  @override
  String get channelHeaderSearchFilterDescMentions => 'käyttäjä';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'linkki, upotus, kuva, video, ääni, tiedosto, tarra, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'päivämäärä tai aikaväli';

  @override
  String get channelHeaderSearchFilterDescOn => 'päivämäärä tai aikaväli';

  @override
  String get channelHeaderSearchFilterDescDuring => 'päivämäärä tai aikaväli';

  @override
  String get channelHeaderSearchFilterDescAfter => 'päivämäärä tai aikaväli';

  @override
  String get channelHeaderSearchFilterDescIn => 'kanava';

  @override
  String get channelHeaderSearchFilterDescPinned => 'tosi vai epätosi';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'käyttäjä, botti tai webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'isäntänimi, esim. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'osa liitteen tiedostonimeä';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'tiedostopääte, esim. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'aikaleima tai osuvuus';

  @override
  String get channelHeaderSearchFilterDescOrder => 'nouseva tai laskeva';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString tulosta',
      one: '1 tulos',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Suodata käyttäjän mukaan';

  @override
  String get channelDetailsSearchFilterByContent => 'Suodata sisällön mukaan';

  @override
  String get channelDetailsSearchSortBy => 'Järjestä tulokset';

  @override
  String get channelDetailsSearchIn => 'Hae kanavalta';

  @override
  String get channelDetailsSearchEmptyTitle => 'Hae tästä keskustelusta';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Kirjoita tekstiä, kirjoittaja tai sisältösuodatin viestien etsimiseksi.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Viestien indeksointi';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Yritä hetken kuluttua uudelleen, kun haku on valmis indeksoimaan tämän alueen.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Ei tuloksia';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Kokeile eri hakutermejä tai suodattimia.';

  @override
  String get channelDetailsMembersOnline => 'Paikalla';

  @override
  String get channelDetailsMembersOffline => 'Poissa';

  @override
  String get channelDetailsMemberYou => 'Sinä';

  @override
  String get channelDetailsSearchUsersHint => 'Hae käyttäjiä';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Kirjoita hakutermit jäsenten etsimiseksi';

  @override
  String get channelDetailsSearchUsersEmpty => 'Käyttäjiä ei löytynyt';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'Ei käyttäjiä saatavilla';

  @override
  String get channelDetailsDone => 'Valmis';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Näytä viestit, jotka sisältävät:';

  @override
  String get channelDetailsRetry => 'Yritä uudelleen';

  @override
  String get channelDetailsPinnedMessageTitle => 'Kiinnitetty viesti';

  @override
  String get channelDetailsSearchResultTitle => 'Haku';

  @override
  String get channelDetailsJumpToMessage => 'Siirry viestiin';

  @override
  String get channelDetailsUnpinMessage => 'Poista viestin kiinnitys';

  @override
  String get channelDetailsCopyMessageLink => 'Kopioi viestin linkki';

  @override
  String get channelDetailsCopyMessageId => 'Kopioi viestin tunnus';

  @override
  String get channelDetailsMessageUnpinned => 'Viestin kiinnitys poistettu';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Nykyinen yhteisö';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Nykyinen keskustelu';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Kaikki yhteisöt';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Kaikki yksityisviestit';

  @override
  String get channelDetailsSearchScopeAllDms => 'Kaikki yksityisviestit';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Vain avoimet yksityisviestit';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Suorat viestit';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Kaikki yksityisviestit + yhteisöt';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Avoinna olevat yksityisviestit ja yhteisöt';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Hae vain tästä yhteisöstä';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Hae vain tästä keskustelusta';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Kaikissa yhteisöissä, joissa olet tällä hetkellä';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Vain kaikista käymistäsi kahdenkeskisistä keskusteluista';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Kaikista käymistäsi kahdenkeskisistä keskusteluista';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Kaikissa avoimissa yksityisviesteissäsi';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Kaikissa avoimissa yksityisviesteissäsi';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Kaikissa keskusteluissa, joissa olet ollut + kaikissa yhteisöissä, joissa olet tällä hetkellä';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Kaikissa avoimissa yksityisviesteissäsi + kaikissa yhteisöissä, joissa olet tällä hetkellä';

  @override
  String get channelDetailsSearchSortNewest => 'Uusimmat ensin';

  @override
  String get channelDetailsSearchSortOldest => 'Vanhimmasta alkaen';

  @override
  String get channelDetailsSearchSortRelevance => 'Osuvimmat';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Näytä uusimmat viestit ensin';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Näytä vanhimmat viestit ensin';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Näytä ensin osuvimmat viestit';

  @override
  String get channelDetailsSearchContentImage => 'Kuvan lataus';

  @override
  String get channelDetailsSearchContentVideo => 'Videon lataus';

  @override
  String get channelDetailsSearchContentAudio => 'Äänilataus';

  @override
  String get channelDetailsSearchContentFile => 'Tiedoston lataus';

  @override
  String get channelDetailsSearchContentLink => 'Linkki';

  @override
  String get channelDetailsSearchContentEmbed => 'Linkin esikatselu tai upotus';

  @override
  String get channelDetailsSearchContentSticker => 'Tarra';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Vain lähetetyt kuvatiedostot';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Vain lähetetyt videotiedostot';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Vain lähetetyt äänitiedostot';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Mikä tahansa lähetetty liite';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Kirjoitettu URL-osoite viestitekstissä';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Ratkaistut esikatselut ja rikkaat upotukset, ei latauksia';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Tarra liitetty viestiin';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count tyyppiä';
  }

  @override
  String get personalNotesTitle => 'Henkilökohtaiset muistiinpanot';

  @override
  String get personalNotesSubtitle =>
      'Oma yksityinen tilasi ajatuksille ja muistutuksille';

  @override
  String groupDmWelcome(String displayName) {
    return 'Tervetuloa keskusteluun $displayName. Lisää ystäviä, niin ryhmä käynnistyy.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Muokkaa ryhmää';

  @override
  String get groupDmWelcomeAddFriends => 'Lisää ystäviä ryhmään';

  @override
  String get dmGroupInvites => 'Kutsut';

  @override
  String get groupDmEditTitle => 'Muokkaa ryhmää';

  @override
  String get groupDmEditDetailsTooltip => 'Muokkaa ryhmän tietoja';

  @override
  String get groupDmGroupName => 'Ryhmän nimi';

  @override
  String get groupDmMyGroup => 'Oma ryhmä';

  @override
  String get groupDmGroupNameMaxLength =>
      'Ryhmän nimi saa olla enintään 100 merkkiä pitkä';

  @override
  String get groupDmGroupIcon => 'Ryhmän kuvake';

  @override
  String get groupDmUploadIcon => 'Lataa kuvake';

  @override
  String get groupDmChangeIcon => 'Vaihda kuvaketta';

  @override
  String get groupDmRemoveIcon => 'Poista kuvake';

  @override
  String get groupDmUpdated => 'Ryhmä päivitetty';

  @override
  String get groupDmUpdateFailed =>
      'Ryhmän päivitys epäonnistui. Yritä uudelleen.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animoituja kuvakkeita ei tueta. Käytä staattista kuvaa.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animoidut kuvakkeet eivät ole tuettuja';

  @override
  String get groupDmIconFileTooLargeTitle => 'Kuvaketiedosto on liian suuri';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Kuvake on liian suuri. Valitse tiedosto, joka on pienempi kuin $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Kuvakkeen muotoa ei tueta';

  @override
  String get groupDmUnsupportedIconFormatBody =>
      'Tuettua tiedostotyyppiä ei tueta.';

  @override
  String get groupDmCouldntProcessImage => 'Kuvan käsittely epäonnistui';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Rajattua kuvaa ei voitu käsitellä. Yritä uudelleen.';

  @override
  String get groupDmInvalidImage => 'Virheellinen kuva';

  @override
  String get groupDmInvalidImageBody => 'Kuva on virheellinen. Kokeile toista.';

  @override
  String get groupDmAddFriends => 'Lisää';

  @override
  String get groupDmOrSendInvite => 'tai lähetä kutsu kaverille:';

  @override
  String get groupDmGenerateInviteLink => 'Luo kutsulinkki';

  @override
  String get groupDmCreateInvite => 'Luo';

  @override
  String get groupDmInviteExpires24Hours =>
      'Kutsusi vanhenee 24 tunnin kuluttua';

  @override
  String get groupDmAddFriendFailed =>
      'Ystävää ei voitu lisätä ryhmään. Yritä uudelleen.';

  @override
  String get groupDmAddFailed => 'Lisääminen ryhmään epäonnistui';

  @override
  String get groupDmGroupFull =>
      'Tämä ryhmä on täynnä. Poista joku ennen kuin lisäät lisää ihmisiä.';

  @override
  String get groupDmRateLimited =>
      'Toimit liian nopeasti. Odota hetki ja yritä uudelleen.';

  @override
  String get groupDmCreateInviteFailed => 'Kutsulinkin luominen epäonnistui';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Kutsulinkin luominen epäonnistui. Yritä uudelleen.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Kutsulinkkiä ei voitu luoda. Yritä uudelleen.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Sinulla ei ole lupaa luoda kutsua tähän kanavaan.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Tämä yhteisö on saavuttanut kutsujen enimmäismäärän.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Kutsun luominen on tilapäisesti poissa käytöstä tälle yhteisölle.';

  @override
  String get groupDmCopyInviteFailed => 'Kutsulinkin kopiointi epäonnistui';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Vain ryhmän omistaja voi hallita kutsuja.';

  @override
  String get groupDmNoInvitesCreated => 'Kutsuja ei luotu';

  @override
  String get groupDmLoadingInvites => 'Ladataan kutsuja...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Kutsujen lataus epäonnistui. Yritä uudelleen.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Peruta tämä kutsu? Toimintoa ei voi kumota.';

  @override
  String get groupDmInviteRevoked => 'Kutsu peruttu';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Luonut $name. Vanhenee $time.';
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
  String get composerOpenExpressionPicker => 'Avaa hymiövalitsin';

  @override
  String get composerShowKeyboard => 'Näytä näppäimistö';

  @override
  String get composerCloseAttachmentPanel => 'Sulje liitteiden valitsin';

  @override
  String get chatAttachmentPanelPhotos => 'Kuvat';

  @override
  String get chatAttachmentPanelFiles => 'Tiedostot';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Valokuvakirjaston käyttöoikeus tarvitaan';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Salli pääsy kuvakirjastoon selataksesi ja liittääksesi viimeisimpiä valokuvia ja videoita.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Avaa asetukset';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', lähetetään';

  @override
  String get messageAccessibilityFailedSuffix => ', lähetys epäonnistui';

  @override
  String get messageAccessibilityAttachmentSummary => 'liite';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count liitettä';
  }

  @override
  String get messageAccessibilityImageSummary => 'kuva';

  @override
  String get messageAccessibilityVideoSummary => 'video';

  @override
  String get messageAccessibilityAudioSummary => 'äänitiedosto';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'tarra $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'tiedosto $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => 'suojattu liite';

  @override
  String get messageAccessibilityEmbedSummary => 'upotus';

  @override
  String get messageAccessibilityEmptySummary => 'viesti';

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
  String get userSettingsSearchPlaceholder => 'Etsi asetuksia...';

  @override
  String get userSettingsSearchFieldLabel => 'Hae asetuksista';

  @override
  String get userSettingsSearchClear => 'Tyhjennä haku';

  @override
  String get userSettingsSearchNoResults => 'Asetuksia ei löytynyt';

  @override
  String get userSettingsNavProfile => 'Profiili';

  @override
  String get userSettingsNavSecurityLogin => 'Suojaus ja kirjautuminen';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Lahjat';

  @override
  String get giftSettingsClaimAccountTitle => 'Lunasta tilisi';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Lunasta tilisi lunastaaksesi tai hallinoidaksesi Plutonium-lahjoituskoodeja.';

  @override
  String get giftSettingsRedeemTitle => 'Lunasta lahja';

  @override
  String get giftSettingsRedeemDescription =>
      'Syötä lahjakoodi lunastaaksesi Plutoniumia tilillesi.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Anna lahjakoodi…';

  @override
  String get giftSettingsRedeemButton => 'Lunasta';

  @override
  String get giftSettingsRedeemSuccess =>
      'Lahja lunastettu onnistuneesti. Nauti Plutoniumistasi.';

  @override
  String get giftSettingsPurchasedTitle => 'Ostetut lahjat';

  @override
  String get giftSettingsPurchasedDescription =>
      'Hallinnoi ostamiasi Plutonium-lahjakoodeja. Jaa lahjalinkki jonkun erityisen kanssa tai lunasta se itsellesi!';

  @override
  String get giftSettingsEmptyTitle => 'Ei lahjoja vielä';

  @override
  String get giftSettingsEmptyDescription =>
      'Osta Plutonium-lahja Plutonium-välilehdeltä jakaaksesi sen ystävien kanssa.';

  @override
  String get giftSettingsGoToPlutonium => 'Siirry Plutoniumiin';

  @override
  String get giftSettingsLoadFailedTitle => 'Lahjavaraston lataus epäonnistui';

  @override
  String get giftSettingsLoadFailedDescription => 'Yritä myöhemmin uudelleen.';

  @override
  String get giftSettingsTryAgain => 'Yritä uudelleen';

  @override
  String get giftSettingsGiftUrl => 'Lahjan URL-osoite';

  @override
  String get giftSettingsCopy => 'Kopioi';

  @override
  String get giftSettingsCopied => 'Kopioitu';

  @override
  String get giftSettingsGiftUrlCopied => 'Lahjan URL kopioitu leikepöydälle!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Lahjan URL-osoitetta ei voitu kopioida';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Ostettu $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Lunastettu $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Lunastanut käyttäjä $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Tämä lahja on lunastettu';

  @override
  String get giftSettingsRedeemForYourself => 'Lunasta itsellesi';

  @override
  String get giftSettingsShareWithFriend => 'Jaa kaverille';

  @override
  String get premiumPlutoniumTagline =>
      'Avaa korkeammat rajat ja ainutlaatuiset ominaisuudet ja tue samalla riippumatonta viestintäalustaa.';

  @override
  String get premiumPurchaseMode => 'Ostotila';

  @override
  String get premiumForMe => 'Minulle';

  @override
  String get premiumAsAGift => 'Lahjaksi';

  @override
  String get premiumMonthly => 'Kuukausittain';

  @override
  String get premiumYearly => 'Vuosittain';

  @override
  String get premiumPerMonth => '/ kk';

  @override
  String get premiumPerYear => 'vuodessa';

  @override
  String get premiumOneTimePurchase => 'kertaluonteinen osto';

  @override
  String get premiumSave17 => 'Säästä 17 %';

  @override
  String get premiumUpgradeNow => 'Päivitä nyt';

  @override
  String get premiumBuyGift => 'Osta lahjaksi';

  @override
  String get premiumOneYearGift => '1 vuoden lahja';

  @override
  String get premiumOneMonthGift => '1 kuukauden lahja';

  @override
  String get premiumMostPopular => 'Suosituin';

  @override
  String get premiumScrollPrompt =>
      'Selaa alas nähdäksesi kaikki Plutoniumiin sisältyvät edut';

  @override
  String get premiumFreeVsPlutonium => 'Ilmainen vs. Plutonium';

  @override
  String get premiumFreeColumn => 'Ilmainen';

  @override
  String get premiumGiftSectionTitle => 'Lahjoita Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Jaa Plutonium-kokemus ystäviesi kanssa ostamalla lahjatilaus.';

  @override
  String get premiumGiftBannerOne => 'Sinulla on uusi lahjakoodi odottamassa!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Sinulla on $count uutta lahjakoodia odottamassa!';
  }

  @override
  String get premiumViewGifts => 'Näytä lahjat';

  @override
  String get premiumReadyToUpgrade => 'Valmiina päivitykseen?';

  @override
  String get premiumReadyToBuyGift => 'Haluatko ostaa lahjan?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Kuukausittain $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Vuosittain $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 vuosi $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 kuukausi $price';
  }

  @override
  String get premiumManageSubscription => 'Hallinnoi tilausta';

  @override
  String get premiumRedeemGiftCode => 'Lunasta lahjakoodi';

  @override
  String get premiumGiftBadge => 'Lahja';

  @override
  String get premiumCancelSubscriptionTitle => 'Peruuta tilaus?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Pidät etusi seuraavaan uusimispäivään asti, minkä jälkeen sinulla on kolmen päivän lisäaika tilata uudelleen ja säilyttää tilaushistoriasi.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Peruuta tilaus';

  @override
  String get premiumKeepSubscription => 'Säilytä tilaus';

  @override
  String get premiumPurchaseHistoryTitle => 'Ostohistoria';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Viimeisimmät laskusi. Jos haluat muuttaa tilauksesi maksutapaa, lisää tai valitse sellainen laskutusportaalissa ja aseta se oletukseksi.';

  @override
  String get premiumManagePaymentMethods => 'Hallinnoi maksutapoja';

  @override
  String get premiumBillingHistory => 'Laskutushistoria';

  @override
  String get premiumSelfServeRefundTitle => 'Itsepalvelupalautus';

  @override
  String get premiumSelfServeRefundButton => 'Palauta viimeisin ostos';

  @override
  String get premiumDisclaimerAgreementPrefix => 'Ostamalla hyväksyt meidän ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Ostamalla hyväksyit meidän ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' ja ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktiivinen kohteeseen $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Peruutetaan';

  @override
  String premiumCancelsOn(String date) {
    return 'Peruutus $date. Edut ovat voimassa siihen asti.';
  }

  @override
  String get premiumReactivateSubscription => 'Aktivoi uudelleen';

  @override
  String premiumGiftedUntil(String date) {
    return 'Lahjoitettu $date asti. Ei uusiudu automaattisesti.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Ominaisuus';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Ostamalla hyväksyt $terms ja $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Itsepalveluhyvitykset ovat saatavilla 3 päivän kuluessa maksusta, kerran 30 päivässä. Tilauksen hyvittäminen peruuttaa sen. EU-/ETA-alueen ostajat luopuvat 14 päivän peruuttamisoikeudesta kassalla saadakseen sisällön käyttöönsä välittömästi. Käytä sovelluksen sisäistä hyvityspainiketta takaisinmaksun sijaan. Takaisinmaksut voivat rajoittaa tiliäsi pysyvästi. Stripe käsittelee maksut turvallisesti. Emme koskaan näe koko korttinumeroasi.';

  @override
  String get premiumTermsOfService => 'Käyttöehdot';

  @override
  String get premiumPrivacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get premiumCheckoutStartFailedTitle => 'Kassan avaaminen epäonnistui';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Jokin meni pieleen maksua aloitettaessa. Yritä uudelleen hetken kuluttua.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Sinulla on lahjatilaus. Se ei uusiudu automaattisesti. Voit pidentää tilausta lunastamalla lisää lahjakoodeja. Toistuvat tilaukset voi aloittaa lahjatilauksen päätyttyä.';

  @override
  String get premiumPlanUnavailable =>
      'Tämä tilaus ei ole saatavilla. Ota yhteyttä tukeen.';

  @override
  String get premiumCompletePaymentTitle => 'Suorita maksu';

  @override
  String get premiumCompletePaymentBody =>
      'Siirryt nyt Stripeen maksun suorittamiseksi. Palaa Fluxeriin, kun olet suorittanut sen.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Valitse maksutapa';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Maksa automaattisella Pixillä valtuuttaaksesi toistuvat veloitukset suoraan brasilialaiselta pankkitililtäsi. Tai valitse käytä korttia syöttääksesi luottokorttitiedot Stripen seuraavalla näytöllä.';

  @override
  String get premiumUsePix => 'Käytä Pixiä';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Maksa UPI:lla luodaksesi Intian pankistasi RBI-yhteensopivan e-valtuutuksen. Tai valitse käytä korttia syöttääksesi luottokorttitiedot seuraavalla Stripe-näytöllä.';

  @override
  String get premiumUseUpi => 'Käytä UPIa';

  @override
  String get premiumUseCard => 'Käytä korttia';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Laskutusportaalia ei voitu avata';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Jokin meni vikaan laskutusportaalia avattaessa. Yritä uudelleen hetken kuluttua.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Olet jo Visionary-tilaaja';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary sisältää jo pysyvän käyttöoikeuden, joten toistuvaa tilausta ei tarvita. Voit silti ostaa lahjoja muille.';

  @override
  String get premiumExistingSubscriptionTitle => 'Tilaus on jo olemassa';

  @override
  String get premiumExistingSubscriptionBody =>
      'Löysimme tilillesi jo olemassa olevan Fluxer Plutonium -tilauksen. Hallinnoi sitä suojatussa laskutusportaalissa päivittääksesi maksutietoja tai tarkistaaksesi uusimisen tilan. Jos maksoit juuri, odota hetki ja avaa sivu uudelleen.';

  @override
  String get premiumPurchasesDisabledTitle =>
      'Ostokset eivät ole käytettävissä';

  @override
  String get premiumPurchasesDisabledBody =>
      'Ostokset on poistettu käytöstä tältä tililtä. Ota yhteyttä osoitteeseen support@fluxer.app, jos tämä näyttää virheelliseltä.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Lunasta tilisi ostaaksesi Fluxer Plutoniumia.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Sinun täytyy vahvistaa sähköpostisi ennen kuin voit ostaa Fluxer Plutoniumia.';

  @override
  String get premiumPerkCustomUsernameTag => 'Mukautettu käyttäjätunniste';

  @override
  String get premiumPerkPerCommunityProfiles => 'Yhteisökohtaiset profiilit';

  @override
  String get premiumPerkMessageScheduling => 'Viestien ajoitus';

  @override
  String get premiumPerkProfileBadge => 'Profiilimerkki';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Mukautetut videotaustat';

  @override
  String get premiumPerkEntranceSounds => 'Sisääntuloäänet';

  @override
  String get premiumPerkCommunities => 'Yhteisöt';

  @override
  String get premiumPerkMessageCharacterLimit => 'Viestin merkkirajoitus';

  @override
  String get premiumPerkBookmarkedMessages => 'Tallennetut viestit';

  @override
  String get premiumPerkFileUploadSize => 'Tiedoston enimmäiskoko';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emojit ja tarrapaketit';

  @override
  String get premiumPerkSavedMedia => 'Tallennettu media';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Käytä animoituja emojeita';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Globaali emoji- ja tarrasaatavuus';

  @override
  String get premiumPerkVideoQuality => 'Videon laatu';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animoidut avatarit ja profiilibannerit';

  @override
  String get premiumPerkEarlyAccess =>
      'Ennakkokäyttöoikeus uusiin ominaisuuksiin';

  @override
  String get premiumPerkCustomThemes => 'Mukautetut teemat';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Jopa 4K/60fps';

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
  String get userSettingsNavShortcuts => 'Pikakuvakkeet';

  @override
  String get audioAndVideoAudioSectionTitle => 'Ääni';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Määritä mikrofonisi, kaiuttimesi ja äänikäsittelysi.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Määritä kamerasi ja näytön jakamisen laatu.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Puhelun aikainen toiminta';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Hallitse vahvistuskehotteita ääni- ja videopuheluiden aikana.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Syöttölaite';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Äänentoistolaite';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Oletus';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Käytä kaiutinta';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Kun pois päältä, ääni toistetaan kuulokkeesta tai yhdistetyistä kuulokkeista.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Syöttöäänenvoimakkuus';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Äänenvoimakkuus';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Äänenkäsittely';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Kohdennettu ääni';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Suositeltu. Puhdistaa mikrofonin selkeää puhetta varten.';

  @override
  String get audioAndVideoDirectInputLabel => 'Suora syöte';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Lähettää äänesi muokkaamattomana. Paras, jos käytät ulkoista ääniohjelmistoa.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Mukautettu';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Säädä kaikki asetukset itse: melunvaimennus, kaiunpoisto ja vahvistus.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Melunvaimennus';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Parannettu';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Vakio';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Ei mitään';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Kaiunvaimennus';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automaattinen äänenvoimakkuuden säätö';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Tasoittaa mikrofonisi äänenvoimakkuutta. Pois päältä, kun parannettu vaimennus on käytössä.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mikrofonitesti';

  @override
  String get audioAndVideoMicTestStartLabel => 'Aloita mikrofonitesti';

  @override
  String get audioAndVideoMicTestStopLabel => 'Lopeta mikrofonitesti';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName tarvitsee mikrofonin käyttöoikeuden syötteesi testaamiseen.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Peilaa kamera';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kameran laatu';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle => 'Näytön jaon laatu';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Kuvataajuus';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 kuvaa sekunnissa';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p ja 60 FPS vaativat $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Tämä instanssi sallii tällä hetkellä näytönjaon enintään 720p-laadulla ja 30 FPS:llä.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName tarvitsee mikrofonin käyttöoikeuden luetteloidakseen laitteesi.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName tarvitsee kameran käyttöoikeuden luetteloidakseen laitteesi.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Älä kysy, kun piilotan kamerani';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Älä kysy, kun piilotan näytönjaon';

  @override
  String get userSettingsNavNotifications => 'Ilmoitukset';

  @override
  String get notificationsGeneralSectionTitle => 'Yleiset';

  @override
  String get notificationsEnableNotificationsLabel =>
      'Ota ilmoitukset käyttöön';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Saat ilmoituksia, kun vastaanotat viestejä. Sinun on ehkä sallittava $productName-ilmoitukset laitteesi asetuksista. Kanava- ja yhteisökohtaiset asetukset löydät yhteisön valikon ilmoitusasetuksista.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Ota työpöytäilmoitukset käyttöön';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Käyttää käyttöjärjestelmän ilmoituskeskusta. Kanava- tai yhteisökohtaiset säädöt saat esiin napsauttamalla yhteisön kuvaketta hiiren kakkospainikkeella ja avaamalla ilmoitusasetukset.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Ota selainilmoitukset käyttöön';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Saat ilmoituksia, kun vastaanotat viestejä. Sinun on ehkä sallittava ilmoitukset selaimesi asetuksista. Kanava- ja yhteisökohtaiset asetukset löydät napsauttamalla yhteisön kuvaketta hiiren kakkospainikkeella ja avaamalla ilmoitusasetukset.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Push-ilmoitusten passiivisuusaika';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName ei lähetä push-ilmoituksia mobiililaitteeseesi, kun olet aktiivisena tietokoneella. Valitse, kuinka kauan sinun on oltava käyttämättä työpöydällä, ennen kuin saat push-ilmoituksia.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minuutti';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minuuttia';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Mainintojen asetukset';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Vastausmainintojen asetukset';

  @override
  String get notificationsMentionNoPreferenceName => 'Ei asetusta';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Kunnioita lähettäjän tarkoitusta, ei varoitusta, kun he vaihtavat @-maininnan tilaa';

  @override
  String get notificationsMentionPreferMentionName => 'Ensisijainen @maininta';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Vastaa oletuksena mainintoihin ja varoita lähettäjää, jos hän poistaa sen käytöstä';

  @override
  String get notificationsMentionPreferNoMentionName => 'Ei mainintoja';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Vastaukset eivät oletuksena sisällä @mainintaa, ja lähettäjää varoitetaan, jos hän ottaa sen käyttöön';

  @override
  String get notificationsTtsSectionTitle => 'Teksti puheeksi -ilmoitukset';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Ota /tts-puhetoisto käyttöön';

  @override
  String get notificationsTtsEnableCommandDescription =>
      '/tts lukee viestisi ääneen. Jos asetus poistetaan käytöstä, komennot näkyvät tavallisena tekstinä.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Säädä toistonopeutta kohdassa ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Saavutettavuus';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Viestien automaattinen lukeminen ääneen';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Muuntaa saapuvan sisällön puheeksi riippumatta siitä, onko se peräisin /tts-komennosta.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Kaikki kanavat';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Lue kaikki saapuvat viestit ääneen riippumatta siitä, mikä kanava on auki.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Vain aktiivinen kanava';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Lukee ääneen vain kanavan, jota katselet. Lukeminen seuraa sinua kanavien välillä.';

  @override
  String get notificationsTtsModeNeverName => 'Ei koskaan automaattisesti';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Pysy hiljaa, ellet joku käytä /tts-komentoa manuaalisesti.';

  @override
  String get notificationsTtsModeAriaLabel => 'Lue kaikki viestit ääneen';

  @override
  String get notificationsSoundsSectionTitle => 'Äänet';

  @override
  String get notificationsMasterVolumeLabel => 'Yleisäänenvoimakkuus';

  @override
  String get notificationsMasterVolumeDescription =>
      'Määrittää kaikkien äänitehosteiden voimakkuuden. Yksittäisten äänien ohitukset eivät huomioi tätä asetusta.';

  @override
  String get notificationsResetToDefaultVolume => 'Palauta oletusvoimakkuus';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Poista kaikki ilmoitusäänet käytöstä';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Nykyiset ilmoitusääniasetuksesi säilytetään.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Näytä enemmän äänitehosteita';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Näytä vähemmän äänitehosteita';

  @override
  String get notificationsPreviewSound => 'Esikatsele ääntä';

  @override
  String get notificationsPerSoundVolumeTitle => 'Äänenvoimakkuus äänittäin';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Aseta mukautetut äänenvoimakkuudet yksittäisille äänille. Äänet, joilla ei ole omaa asetusta, noudattavat päääänenvoimakkuutta.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktiivisia mukautettuja äänivoimakkuusasetuksia: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Seuraa pääasetusta • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Palauta $label päääänenvoimakkuuteen';
  }

  @override
  String get notificationsResetAllOverrides => 'Palauta kaikki ohitukset';

  @override
  String notificationsMuteSound(String label) {
    return 'Mykistä $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Poista mykistys kohdasta $label';
  }

  @override
  String get notificationsSoundMessage => 'Yhteisön viesti-ilmoitukset';

  @override
  String get notificationsSoundDirectMessage => 'Suorien viestien ilmoitukset';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Nykyisen kanavan viesti-ilmoitukset';

  @override
  String get notificationsSoundMute => 'Äänetön';

  @override
  String get notificationsSoundUnmute => 'Äänen poisto mykistyksestä';

  @override
  String get notificationsSoundDeaf => 'Äänen mykistys';

  @override
  String get notificationsSoundUndeaf => 'Kuulokkeiden mykistyksen poisto';

  @override
  String get notificationsSoundUserJoin => 'Käyttäjä liittyy kanavalle';

  @override
  String get notificationsSoundUserLeave => 'Käyttäjä poistuu kanavalta';

  @override
  String get notificationsSoundUserMove => 'Käyttäjä siirsi kanavan';

  @override
  String get notificationsSoundViewerJoin => 'Katsoja liittyy lähetykseen';

  @override
  String get notificationsSoundViewerLeave => 'Katsoja poistuu lähetyksestä';

  @override
  String get notificationsSoundVoiceDisconnect => 'Puhelu katkaistu';

  @override
  String get notificationsSoundIncomingRing => 'Saapuva puhelu';

  @override
  String get notificationsSoundCameraOn => 'Kamera päällä';

  @override
  String get notificationsSoundCameraOff => 'Kamera pois päältä';

  @override
  String get notificationsSoundScreenShareStart => 'Näytön jakamisen aloitus';

  @override
  String get notificationsSoundScreenShareStop => 'Näytön jakaminen pysäytetty';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Push-ilmoitusten aikakatkaisun päivitys epäonnistui. Yritä uudelleen.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Ei voitu päivittää mainintamääritystä. Yritä uudelleen.';

  @override
  String get notificationsPermissionDeniedTitle => 'Ilmoitukset estetty';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Ilmoitusten käyttöönotto epäonnistui. Salli ilmoituslupa jatkaaksesi.';

  @override
  String get userSettingsNavLanguageAndTime => 'Kieli ja aika';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Käyttöliittymän kieli';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Valitse sovelluksessa käytettävä kieli';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Avaa kieliasetukset';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Ajan esitysmuoto';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Valitse, miten kellonajat näytetään sovelluksessa';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Ajan muodon valinta';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automaattinen';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 tuntia';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 tuntia';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Sovelluksen kieli: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Järjestelmän maa-asetus: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Käytä järjestelmän aikamuotoa';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Aikaformaatin päivitys epäonnistui';

  @override
  String get userSettingsNavDefaultApps => 'Oletussovellukset';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Verkkoselain';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Valitse, mikä selain avautuu, kun napautat linkkiä.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Jos sivustolle on asennettu sovellus, linkit avautuvat ensin siinä sovelluksessa.';

  @override
  String get defaultAppsWebBrowserInApp => 'Sovelluksen sisäinen selain';

  @override
  String get defaultAppsWebBrowserExternal => 'Ulkoinen selain';

  @override
  String get userSettingsNavAdvanced => 'Lisäasetukset';

  @override
  String get advancedPerformanceReportingTitle => 'Suorituskyvyn raportointi';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Auta parantamaan ${productName}ia jakamalla anonyymejä kaatumis- ja suorituskykytietoja.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Lähetä kaatumis- ja suorituskykyraportteja';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Kaikki raportoidut tiedot ovat anonyymejä ja lähetetään vain $productName omaan valvontapalveluun – kolmansia osapuolia ei käytetä.';
  }

  @override
  String get advancedSettingsConfigure => 'Määritä';

  @override
  String get advancedSettingsCategoryPrivacy => 'Tietosuoja';

  @override
  String get advancedSettingsCategoryAppearance => 'Ulkoasu';

  @override
  String get advancedSettingsCategoryAccessibility => 'Saavutettavuus';

  @override
  String get advancedSettingsCategoryChat => 'Keskustelu';

  @override
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Ääni';

  @override
  String get advancedSettingsCategoryDeveloper => 'Kehittäjä';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Ota tekstin valinta käyttöön';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Salli tekstin valinta sovelluksessa.';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Ota käyttöön videon siirtymispisteiden esikatsauskuvat';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Pienoiskuva tai reaaliaikainen kuva videon selaamisen aikana';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Värinäpalaute';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Värinäpalaute napautuksista ja toimista. Ei synkronoidu laitteiden välillä.';

  @override
  String get advancedSettingShowNekoLabel => 'Näytä Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko-kissa, joka jahtaa osoitintasi';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Näytä Neko chat-syötteessäsi';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Zoomausanimaatio';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Loitonna logoa, kun poistut aloitusnäytöstä';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Näppäimistövihjeet';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Näppäinkomentoihin liittyvät vihjeet työkaluvihjeissä.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Ota suosikit käyttöön';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Näytä suosikit koko sovelluksessa';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Äänikanavalle liittymisen toiminta';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Vahvistus tai kaksoisklikkaus liittymistä äänikanavaan.';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Vaadi kaksoisnapsautus äänikanaville liittymiseen';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Vahvista ennen puhekanaville liittymistä';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Lähetä GIF-kuvat automaattisesti, kun ne on valittu';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Lähetä GIF-kuvat automaattisesti valitsimesta ilman vahvistusta';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Tallenna GIF-suosikit tallennettuun mediaan';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Valitse, miten tähdellä merkityt GIF-suosikit tallennetaan';

  @override
  String get advancedSettingMediaButtonsLabel => 'Mediatoiminnot';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Mukauta, mitkä painikkeet ja indikaattorit näkyvät kuvien liitteissä ja upotuksissa';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Lataa liitteet ennen lähettämistä';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Aloita liitteiden lataaminen heti, kun ne on lisätty viestikenttään';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Poista seuranta-parametrit URL-osoitteista';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Poista seurantaparametrit automaattisesti lähettämiesi viestien URL-osoitteista';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Luota kaikkiin ulkoisiin linkkeihin';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Ohita ulkoisen linkin varoitus kaikille verkkotunnuksille';

  @override
  String get advancedSettingSearchEnginesLabel => 'Hakukoneet';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Määritä valitusta tekstistä käytettävät hakukoneet';

  @override
  String get advancedSettingTranslatorsLabel => 'Kääntäjät';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Määritä valitusta tekstistä käytettävät käännöspalveluntarjoajat';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Käänteinen kuvahaku';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Käänteisen kuvahaun tarjoajat';

  @override
  String get advancedSettingMessageActionBarLabel => 'Viestin toimintopalkki';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Mukauta viestien päällä näkyvää toimintopalkkia';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Ilmaisuautomaattinen täydennys';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Valitse, mitä näytetään, kun kirjoitat kaksoispisteen viestikenttään';

  @override
  String get advancedSettingInputButtonsLabel => 'Viestinsyötön painikkeet';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Valitse, mitkä painikkeet näytetään viestikentässä';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Vieritä alas viestiä lähettäessä';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Valitse, miten keskustelussa liikutaan viestin lähettämisen jälkeen';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Ohita \"Merkitse kaikki luetuiksi\" -vahvistus';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Merkitse kaikki lukemattomat saapuneet-kanavat luetuiksi heti kysymättä vahvistusta';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Piilota mykistetyt kanavat oletuksena';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Piilota mykistetyt kanavat yhteisön sivupalkeista';

  @override
  String get advancedSettingShowGifIndicatorLabel =>
      'Näytä GIF-kuvakkeen ilmaisin';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Näytä liitteen vanhenemisilmaisin';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Näytä poistopainike';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Näytä latauspainike';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Näytä suosikkipainike';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Näytä estä upotukset -painike';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Näytä viestin toimintopalkki';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Näytä vain Lisää-painike';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Näytä pikareaktiot';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Laajenna painamalla vaihtonäppäintä';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Näytä oletusemojit pikaehdotuksissa';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Näytä mukautetut emojit pikavalinnassa';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Näytä tarrat ilmaisujen automaattisessa täydennyksessä';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Näytä tallennettu media pikavalinnassa';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Näytä GIF-painike';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Näytä mediapainike';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Näytä tarrat-painike';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Näytä emoji-painike';

  @override
  String get advancedSettingShowSendButtonLabel => 'Näytä lähetyspainike';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Näytä uusien laitteiden ilmoitukset';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Pyydä uusia äänilaitteita';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Yhteyden äänenvoimakkuuden säätimet';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Näytä laitekohtaiset osallistujien äänenvoimakkuuden liukusäätimet äänivalikoissa';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Näytönjakamisen esikatselukäyttäytyminen';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Esikatselu-, ponnahdusikkuna- ja suoratoisto-kuvakaappakäyttäytyminen';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Näytönjaon koodekki';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Videokoodekki näytön jakamiseen';

  @override
  String get advancedSettingScreenShareCodecAuto =>
      'Automaattinen (suositeltu)';

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
      'Keskeytä näytön jakamisen esikatselu taustalla';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Piilota striimin esikatselukuva';

  @override
  String get advancedSettingDeveloperModeLabel => 'Ota kehittäjätila käyttöön';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Ota kehittäjätila käyttöön';

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
  String get advancedSettingTranslatorGoogle => 'Google-käännös';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Oletushakukone';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Valitse oletushakukone valitun tekstin hakuun.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Sisäänrakennetut hakukoneet';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Ota käyttöön tai poista käytöstä sisäänrakennetut hakukoneet. Käytössä olevat hakukoneet näkyvät viestin pikavalikossa, kun teksti on valittuna.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Mukautetut hakukoneet';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Lisää omat hakukoneesi mukautetulla URL-mallilla. Käytä `$query` paikkamerkkinä hakutekstille.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Lisää hakukone';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Ota käyttöön vähintään yksi hakukone alta.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Poista hakukone';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Oletuskääntäjä';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Valitse oletuskääntäjä, jota käytetään valitun tekstin kääntämiseen.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel =>
      'Sisäänrakennetut kääntäjät';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Ota käyttöön tai poista käytöstä sisäänrakennetut kääntäjät. Käytössä olevat kääntäjät näkyvät viestin pikavalikossa, kun teksti on valittuna.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Mukautetut kääntäjät';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Lisää omat kääntäjäsi mukautetulla URL-mallilla. Käytä `$query`-paikkamerkkiä käännettävälle tekstille.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Lisää kääntäjä';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Ota käyttöön vähintään yksi kääntäjä alta.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Poista kääntäjä';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Oletushaku kuvalla';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Valitse oletuspalvelu, jota käytetään kuvan käänteisessä kuvahaussa.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Sisäänrakennettu kuvahaku';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Ota käyttöön tai poista käytöstä sisäänrakennetut käänteisen kuvahaun tarjoajat. Käytössä olevat tarjoajat näkyvät kuvien, avatarien, bannerien, tarrojen ja emojien pikavalikossa.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Mukautettu käänteinen kuvahaku';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Lisää omat käänteisen kuvahaun tarjoajasi mukautetulla URL-mallilla. Käytä `$url` paikkamerkkinä kuvan URL-osoitteelle.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Lisää käänteinen kuvahaku';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Ota käyttöön vähintään yksi käänteisen kuvahaun tarjoaja alta.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel => 'Poista kuvahaku';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Lisää hakukone';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Muokkaa hakukonetta';

  @override
  String get advancedSettingAddTranslatorTitle => 'Lisää käännöspalvelu';

  @override
  String get advancedSettingEditTranslatorTitle => 'Muokkaa käännöspalvelua';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Lisää käänteisen kuvahaun hakukone';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Muokkaa käänteisen kuvahaun hakukonetta';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nimi';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL-malli';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder => 'Oma hakukone';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Oma kääntäjä';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Oma kuvahaku';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Käytä \'$query\' -kohtaa, johon hakuteksti lisätään.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Käytä \'$query\' siinä, missä käännettävä teksti tulisi lisätä.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Käytä \'$url\' siellä, missä kuv URL pitäisi lisätä.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Nimi on pakollinen.';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'URL-malli vaaditaan.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL-mallin on sisällettävä paikkamerkki $query.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL-mallin on sisällettävä paikkamerkki $url.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL-mallin on oltava kelvollinen URL-osoite.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Lisää';

  @override
  String get advancedSettingEditSearchProviderAction => 'Muokkaa';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Poista';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Haluatko varmasti poistaa haun $engineName?';
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
  String get userSettingsJoinFluxerLabs => 'Liity Fluxer Labsiin';

  @override
  String get userSettingsNavAppLicenses => 'Sovelluksen lisenssit';

  @override
  String get userSettingsAppLicensesDescription =>
      'Avoimen lähdekoodin ohjelmistot, joita tämä sovellus käyttää. Tämä sovellus on rakennettu Flutterilla.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Sovelluksen lisenssejä ei voitu ladata.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lisenssiä',
      one: '1 lisenssi',
    );
    return '$_temp0';
  }

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
  String get savedMessagesEmptyTitle => 'Ei kirjanmerkkejä';

  @override
  String get savedMessagesEmptyBody =>
      'Tallenna viestejä kirjanmerkkeihin myöhempää käyttöä varten.';

  @override
  String get savedMessagesEndBody => 'Ei tässä enempää nähtävää.';

  @override
  String get savedMessagesRemoveTooltip => 'Poista kirjanmerkki';

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
  String get uiSearch => 'Haku';

  @override
  String get uiStartCall => 'Aloita puhelu';

  @override
  String get uiStartVideoCall => 'Aloita videopuhelu';

  @override
  String get uiPlay => 'Toista';

  @override
  String get uiPause => 'Keskeytä';

  @override
  String get uiDownload => 'Lataa';

  @override
  String get uiMoreActions => 'Lisää toimintoja';

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
    return 'Tämä ilmoittaa $count jäsenelle, joilla on rooli $roleName. Jatkaako?';
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
  String get guildNavbarGuildSelected => 'valittu';

  @override
  String get guildNavbarGuildUnread => 'lukematon';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mainintaa',
      one: '1 maininta',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'vaimennettu';

  @override
  String get authShowPassword => 'Näytä salasana';

  @override
  String get authHidePassword => 'Piilota salasana';

  @override
  String get chatLoadingMessages => 'Ladataan viestejä';

  @override
  String get friendsMessageFriend => 'Viesti';

  @override
  String get friendsFriendActions => 'Ystävän toiminnot';

  @override
  String get friendsAcceptRequest => 'Hyväksy kaveripyyntö';

  @override
  String get friendsDeclineRequest => 'Hylkää kaveripyyntö';

  @override
  String get friendsCancelRequest => 'Peruuta kaveripyyntö';

  @override
  String get friendsOpenInbox => 'Saapuneet';

  @override
  String get profileRemoveFriend => 'Poista kaveri';

  @override
  String get profileUnblockUser => 'Poista esto';

  @override
  String get profileAcceptFriendRequest => 'Hyväksy kaveripyyntö';

  @override
  String get profileCancelFriendRequest => 'Peruuta kaveripyyntö';

  @override
  String get profileSendFriendRequest => 'Lisää kaveri';

  @override
  String get accountOverflowMenu => 'Tilin asetukset';

  @override
  String get navHome => 'Koti';

  @override
  String get navNotifications => 'Ilmoitukset';

  @override
  String get navYou => 'Sinä';

  @override
  String get guildFolderSettingsTitle => 'Kansion asetukset';

  @override
  String get guildFolderNameLabel => 'Kansion nimi';

  @override
  String get guildFolderColorLabel => 'Kansion väri';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Näytä kuvake, kun kutistettu';

  @override
  String get guildFolderIconLabel => 'Kansion kuvake';

  @override
  String get guildFolderDelete => 'Poista kansio';

  @override
  String get guildFolderIconFolder => 'Kansio';

  @override
  String get guildFolderIconStar => 'Tähdellä merkityt';

  @override
  String get guildFolderIconHeart => 'Sydän';

  @override
  String get guildFolderIconBookmark => 'Kirjanmerkki';

  @override
  String get guildFolderIconGameController => 'Peliohjain';

  @override
  String get guildFolderIconShield => 'Suojaus';

  @override
  String get guildFolderIconMusicNote => 'Musiikki';

  @override
  String get guildFolderMarkAsRead => 'Merkitse kansio luetuksi';

  @override
  String get guildBulkMuteCommunities => 'Mykistä yhteisöt';

  @override
  String get guildBulkUnmuteCommunities => 'Poista yhteisöjen mykistys';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Yhteisön ilmoitusasetukset';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Yhteisön yksityisyysasetukset';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Salli @everyone ja @here';

  @override
  String get guildBulkAllowRoleMentions => 'Salli roolimaininnat';

  @override
  String get guildBulkEnableMobilePush => 'Ota mobiili-ilmoitukset käyttöön';

  @override
  String get guildBulkDisableMobilePush =>
      'Poista mobiili-ilmoitukset käytöstä';

  @override
  String get guildBulkAllowDirectMessages => 'Salli suorat viestit';

  @override
  String get guildBulkBlockDirectMessages => 'Estä suorat viestit';

  @override
  String get guildBulkAllowBotDirectMessages => 'Salli botin suorat viestit';

  @override
  String get guildBulkBlockBotDirectMessages => 'Estä botin suorat viestit';

  @override
  String get guildNavbarGroupDm => 'Ryhmä-DM';

  @override
  String get guildNavbarCreateChannel => 'Luo kanava';

  @override
  String get guildNavbarChannelType => 'Kanavan tyyppi';

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
  String get guildNavbarChannelTypeSelection => 'Kanavan tyypin valinta';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Vain $productName-henkilökunnan käytettävissä';
  }

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
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Tarrat';

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
  String get guildMenuSettingsInviteLinks => 'Kutsut';

  @override
  String get guildMenuSettingsBans => 'Estot';

  @override
  String get guildMenuSettingsChannels => 'Kanavat';

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
  String get guildSettingsRolesNewRole => 'Uusi rooli';

  @override
  String get guildSettingsRolesDeleteRole => 'Poista rooli';

  @override
  String get guildSettingsRolesBackToRoles => 'Takaisin rooleihin';

  @override
  String get guildSettingsBackToSettings => 'Takaisin asetuksiin';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Muokkaa kohdetta „$name”';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Määritä rooliasetukset ja käyttöoikeudet';

  @override
  String get guildSettingsRolesDisplaySection => 'Näyttö';

  @override
  String get guildSettingsRolesRoleName => 'Roolin nimi';

  @override
  String get guildSettingsRolesRoleColor => 'Roolin väri';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Kirjoita väri (heksakoodi, rgb(), hsl() tai nimi) tai käytä valitsinta.';

  @override
  String get guildSettingsRolesShowSeparately => 'Näytä tämä rooli erillään';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Listaa tämän roolin jäsenet omassa osiossaan jäsenluettelossa.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Salli maininnat tälle roolille';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Jäsenet, joilla on $permission-oikeus, voivat aina mainita rooleja tästä asetuksesta riippumatta.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Tyhjennä kaikki oikeudet nopeasti tällä painikkeella.';

  @override
  String get guildSettingsRolesClearPermissions => 'Tyhjennä käyttöoikeudet';

  @override
  String get guildSettingsRolesPermissionsSection => 'Käyttöoikeudet';

  @override
  String get guildSettingsRolesSearchPermissions => 'Hae käyttöoikeuksia';

  @override
  String get guildSettingsRolesDenseLayout => 'Tiivis asettelu';

  @override
  String get guildSettingsRolesComfyLayout => 'Tiivis asettelu';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Vaihda tiiviiseen asetteluun';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Vaihda mukavaan asetteluun';

  @override
  String get guildSettingsRolesSingleColumn => 'Yksittäinen sarake';

  @override
  String get guildSettingsRolesTwoColumns => 'Kaksi saraketta';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Vaihda yksipalstaiseen näkymään';

  @override
  String get guildSettingsRolesSwitchToTwoColumns =>
      'Vaihda kaksipalstaiseen näkymään';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Ei käyttöoikeuksia';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'Mukautettu nostojärjestys';

  @override
  String get guildSettingsRolesHoistOrder => 'Näytä erillään -järjestys';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Palauta oletusasetukset';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Järjestä roolit vetämällä niitä, niin ne näkyvät jäsenluettelossa haluamassasi järjestyksessä.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Ei erillisiä rooleja. Ota käyttöön \"Näytä tämä rooli erillään\" roolissa nähdäksesi sen täällä.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Et voi muokata tätä roolia, koska se on korkein roolisi tai yläpuolellasi';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Tarvitset \"$permission\"-oikeuden muokataksesi näitä oikeuksia';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Et voi muokata roolia, joka on samalla tasolla tai ylempänä kuin korkein roolisi';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Et voi myöntää lupaa, jota sinulla ei ole';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Et voi poistaa tätä oikeutta, koska poistaisit sen itseltäsi';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Roolit päivitetty';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rooli luotu';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rooli poistettu';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Nostojärjestys palautettu oletukseksi';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Roolin nimi on pakollinen';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Anna roolille nimi ennen tallentamista.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Roolin luominen epäonnistui';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Roolien päivitys epäonnistui';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Roolin poistaminen epäonnistui';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return 'Roolia nimeltä \"$name\" ei voitu poistaa. Yritä uudelleen.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Korotuksen järjestystä ei voitu nollata';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Yritä hetken kuluttua uudelleen.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Haluatko varmasti poistaa roolin $name? Kaikilta tämän roolin saaneilta jäseniltä poistetaan rooli.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Koko yhteisö';

  @override
  String get permissionCategoryMessagesMedia => 'Viestit ja media';

  @override
  String get permissionCategoryModeration => 'Moderointi';

  @override
  String get permissionCategoryChannelAccess => 'Kanavan käyttöoikeus';

  @override
  String get permissionCategoryChannelManagement => 'Kanavien hallinta';

  @override
  String get permissionCategoryAudioVideo => 'Ääni ja video';

  @override
  String get permissionUnknown => 'Tuntematon käyttöoikeus';

  @override
  String get permissionAdministrator => 'Järjestelmänvalvoja';

  @override
  String get permissionAdministratorDescription =>
      'Myöntää kaikki oikeudet ja ohittaa kanavarajoitukset. Erittäin arkaluontoinen.';

  @override
  String get permissionViewActivityLog => 'Näytä toimintaloki';

  @override
  String get permissionViewActivityLogDescription =>
      'Lue yhteisön toimintaloki muutoksista ja moderointitoimista.';

  @override
  String get permissionManageCommunity => 'Hallinnoi yhteisöä';

  @override
  String get permissionManageCommunityDescription =>
      'Muokkaa yleisiä asetuksia, kuten nimeä, kuvausta ja kuvaketta.';

  @override
  String get permissionManageRoles => 'Hallinnoi rooleja';

  @override
  String get permissionManageRolesDescription =>
      'Voit luoda, muokata tai poistaa rooleja, jotka ovat oman korkeimman roolisi alapuolella. Voit myös muokata kanavakohtaisia käyttöoikeuksien ohituksia.';

  @override
  String get permissionManageChannels => 'Hallinnoi kanavia';

  @override
  String get permissionManageChannel => 'Hallinnoi kanavaa';

  @override
  String get permissionManageChannelDescription =>
      'Nimeä uudelleen ja muokkaa tämän kanavan asetuksia.';

  @override
  String get permissionManagePermissions => 'Hallinnoi käyttöoikeuksia';

  @override
  String get permissionManagePermissionsDescription =>
      'Muokkaa roolien ja jäsenten ohituksia tällä kanavalla.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Luo, muokkaa tai poista webhookeja tälle kanavalle.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Näytä tämän kanavan jäsenluettelo.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Hallitse tämän kanavan kutsujen linkkejä.';

  @override
  String get permissionOverwriteDeny => 'Estä';

  @override
  String get permissionOverwriteInherit => 'Neutraali (peri)';

  @override
  String get permissionOverwriteAllow => 'Salli';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Näillä painikkeilla voit määrittää kaikki käyttöoikeudet nopeasti.';

  @override
  String get permissionManageChannelsDescription =>
      'Luo, muokkaa tai poista kanavia ja kategorioita.';

  @override
  String get permissionKickMembers => 'Potkaise jäseniä';

  @override
  String get permissionBanMembers => 'Anna porttikielto jäsenille';

  @override
  String get permissionCreateInviteLinks => 'Luo kutsulinkkejä';

  @override
  String get permissionChangeOwnNickname => 'Vaihda oma lempinimi';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Päivitä oma lempinimesi.';

  @override
  String get permissionManageNicknames => 'Hallitse lempinimiä';

  @override
  String get permissionManageNicknamesDescription =>
      'Vaihda muiden jäsenten lempinimiä.';

  @override
  String get permissionCreateEmojiStickers => 'Luo emojeita ja tarroja';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Lataa uusia emojeita ja tarroja sekä hallinnoi omia luomuksiasi.';

  @override
  String get permissionManageEmojiStickers => 'Hallinnoi emojeita ja tarroja';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Muokkaa tai poista muiden jäsenten luomia emojeita ja tarroja.';

  @override
  String get permissionManageWebhooks => 'Hallinnoi webhookeja';

  @override
  String get permissionManageWebhooksDescription =>
      'Luo, muokkaa tai poista webhookeja.';

  @override
  String get permissionSendMessages => 'Lähetä viestejä';

  @override
  String get permissionSendTtsMessages => 'Lähetä tekstistä puheeksi -viestejä';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Lähetä puhesynteesiviestejä.';

  @override
  String get permissionManageMessages => 'Hallinnoi viestejä';

  @override
  String get permissionManageMessagesDescription =>
      'Poista muiden jäsenten viestejä. Kiinnitystä hallitaan erikseen.';

  @override
  String get permissionPinMessages => 'Kiinnitä viestejä';

  @override
  String get permissionEmbedLinks => 'Upota linkkejä';

  @override
  String get permissionAttachFiles => 'Liitä tiedostoja';

  @override
  String get permissionMentionEveryone =>
      'Käytä @everyone/@here- ja @rooli-mainintoja';

  @override
  String get permissionMentionEveryoneDescription =>
      'Mainitse kaikki tai mikä tahansa rooli (vaikka roolia ei olisi asetettu mainittavaksi).';

  @override
  String get permissionUseExternalEmoji => 'Käytä ulkoisia emojeita';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Käytä emojeita muista yhteisöistä.';

  @override
  String get permissionUseExternalStickers => 'Käytä ulkoisia tarroja';

  @override
  String get permissionAddReactions => 'Lisää reaktioita';

  @override
  String get permissionAddReactionsDescription =>
      'Lisää uusia reaktioita viesteihin.';

  @override
  String get permissionBypassSlowmode => 'Ohita hidastustila';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ohita kanavakohtaiset viestien lähetysrajoitukset.';

  @override
  String get permissionTimeOutMembers => 'Aseta jäsenille aikakatkaisu';

  @override
  String get permissionTimeOutMembersDescription =>
      'Estä jäseniä lähettämästä viestejä, reagoimasta ja liittymästä puhekanaville määräajaksi.';

  @override
  String get permissionViewChannel => 'Näytä kanava';

  @override
  String get permissionViewChannelMembers => 'Näytä kanavan jäsenet';

  @override
  String get permissionViewChannelMembersDescription =>
      'Näytä tämän yhteisön kanavien jäsenluettelo.';

  @override
  String get permissionConnect => 'Yhdistä';

  @override
  String get permissionSpeak => 'Puhu';

  @override
  String get permissionStreamVideo => 'Striimaa videota';

  @override
  String get permissionUseVoiceActivity => 'Käytä puheentunnistusta';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Ilman tätä lupaa puhetta voi lähettää vain painamalla lähetyspainiketta.';

  @override
  String get permissionPrioritySpeaker => 'Prioriteettipuhuja';

  @override
  String get permissionMuteMembers => 'Mykistä jäseniä';

  @override
  String get permissionDeafenMembers => 'Mykistä jäseniä';

  @override
  String get permissionMoveMembers => 'Siirrä jäseniä';

  @override
  String get permissionMoveMembersDescription =>
      'Vedä jäseniä kanavien välillä, joihin heillä on pääsy.';

  @override
  String get permissionSetVoiceRegion => 'Määritä puhepalvelun alue';

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
      'Tarkastele ja hallinnoi kaikkia yhteisöösi määritettyjä webhookeja.';

  @override
  String get guildSettingsWebhooksEmpty => 'Ei webhookeja';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Tässä yhteisössä ei ole vielä webhookeja. Luo sellainen osoitteessa $channelSettingsPath.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Tarvitset \"$permission\"-oikeuden yhteisön webhookien katseluun ja muokkaamiseen.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Webhookien lataus epäonnistui';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Verkkokoukkujen latauksessa tapahtui virhe. Yritä uudelleen.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhookit päivitetty';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Verkkokoukkujen päivitys epäonnistui';

  @override
  String get guildSettingsUnknownChannel => 'Tuntematon kanava';

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
      'Listaa yhteisösi Löydä-osiossa, jotta muut voivat löytää ja liittyä siihen.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Liian vähän jäseniä';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Yhteisössäsi on oltava vähintään $count jäsentä, ennen kuin se voidaan listata Löydöissä.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Tila:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Odottaa';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Hyväksytty';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Hylätty';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Poistettu';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Syy: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Yhteisösi näkyy Hakutoiminnossa. Voit päivittää tietoja alta tai poistaa yhteisön listauksesta.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Hakemuksesi odottaa tarkistusta. Voit edelleen päivittää ilmoituksesi tietoja tai peruuttaa hakemuksen.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategoria';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Valitse kategoria, joka kuvaa yhteisöäsi parhaiten. Voit muuttaa tätä milloin tahansa.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Ensisijainen kieli';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Yhteisösi puhuu eniten tätä kieltä. Käytetään hakutulosten suodattamiseen.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Kuvaus';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Kuvaile, mistä yhteisössäsi on kyse';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'Kuvaus tarvitaan.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Kuvaus on oltava vähintään $minLength merkkiä pitkä.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Kuvaus saa olla enintään $maxLength merkkiä pitkä.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Mukautetut tunnisteet';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Enintään $maxTags tunnisteella autat ihmisiä löytämään yhteisösi. Ne näkyvät Discovery-haussa.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'Lisää tunniste ja paina Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Lisää';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Poista tunniste $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Tagin lisääminen epäonnistui';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Tunnisteen on oltava 2–$maxLength merkkiä pitkä ja koostuttava kirjaimista ja numeroista.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Voit lisätä enintään $maxTags tunnisteetta.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Käytä';

  @override
  String get guildSettingsDiscoverySave => 'Tallenna';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Peruuta';

  @override
  String get guildSettingsDiscoveryApplicationSent => 'Hakemus lähetetty';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Hakemiston listaus päivitetty';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn => 'Hakemus peruutettu';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Hakemuksen peruminen epäonnistui';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Yritä hetken kuluttua uudelleen.';

  @override
  String get guildSettingsMembersDescription =>
      'Etsi ja hallitse palvelimen jäseniä.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Hae käyttäjänimellä tai tunnuksella';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count jäsentä';
  }

  @override
  String get guildMembersRecentTitle => 'Uudet jäsenet';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Näytetään $displayedCount/$totalCount jäsentä';
  }

  @override
  String get guildMembersSort => 'Lajittele';

  @override
  String get guildSettingsMembersSortNewest => 'Uusimmat ensin';

  @override
  String get guildMembersSortOldest => 'Vanhimmat ensin';

  @override
  String get guildMembersColumnName => 'Nimi';

  @override
  String get guildMembersColumnMemberSince => 'Jäsen alkaen';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Liittynyt palveluun $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Liittymistapa';

  @override
  String get guildMembersColumnRoles => 'Roolit';

  @override
  String get guildMembersColumnActions => 'Toiminnot';

  @override
  String get guildMembersFilterMemberSince => 'Jäsenyyden alkamisaika';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Suodata tilin luontipäivän mukaan';

  @override
  String get guildMembersFilterJoinMethod => 'Suodata liittymistavan mukaan';

  @override
  String get guildMembersFilterRoles => 'Suodata roolien mukaan';

  @override
  String get guildMembersFilterAll => 'Kaikki';

  @override
  String get guildMembersFilterPast1Hour => 'Viime tunti';

  @override
  String get guildMembersFilterPast24Hours => 'Viimeiset 24 tuntia';

  @override
  String get guildMembersFilterPast7Days => 'Viimeiset 7 päivää';

  @override
  String get guildMembersFilterPast2Weeks => 'Viimeiset 2 viikkoa';

  @override
  String get guildMembersFilterPast3Weeks => 'Viimeiset 3 viikkoa';

  @override
  String get guildMembersFilterPast4Weeks => 'Viimeiset 4 viikkoa';

  @override
  String get guildMembersFilterPast3Months => 'Viimeiset 3 kuukautta';

  @override
  String get guildMembersFilterCustomRange => 'Mukautettu aikaväli...';

  @override
  String get guildMembersDateRangeTitle => 'Mukautettu ajanjakso';

  @override
  String get guildMembersDateAfter => 'Päivämäärän jälkeen';

  @override
  String get guildMembersDateBefore => 'Ennen päivämäärää';

  @override
  String get guildMembersClearAll => 'Tyhjennä kaikki';

  @override
  String get guildMembersRowsPerPage => 'Rivejä sivulla';

  @override
  String get guildMembersEmptySearch => 'Kukaan ei vastaa hakua.';

  @override
  String get guildMembersLoadError =>
      'Jäsenten latauksessa tapahtui virhe. Yritä uudelleen myöhemmin.';

  @override
  String get guildMembersIndexing => 'Jäseniä indeksoidaan…';

  @override
  String get guildMembersGoToPage => 'Siirry sivulle';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Siirry sivulle $page';
  }

  @override
  String get guildMembersJumpToPage => 'Siirry sivulle';

  @override
  String get guildMembersJoinSourceCreator => 'Yhteisön luoja';

  @override
  String get guildMembersJoinSourceInvite => 'Kutsu';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Kutsu ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Kutsunut $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Mukautettu URL-osoite';

  @override
  String get guildMembersJoinSourceBotInvite => 'Botin kutsu';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Alustan ylläpitäjä';

  @override
  String get guildMembersJoinSourceDiscovery => 'Löytö';

  @override
  String get guildMembersJoinMethodUnknown => 'Tuntematon';

  @override
  String get guildMembersCommunityOwner => 'Yhteisön omistaja';

  @override
  String get guildMembersViewAllRoles => 'Näytä kaikki roolit';

  @override
  String get guildMembersJoinedJustNow => 'Juuri nyt';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuuttia sitten',
      one: '1 minuutti sitten',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tuntia sitten',
      one: '1 tunti sitten',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count päivää sitten',
      one: '1 päivä sitten',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Jäsenet';

  @override
  String get guildMembersChannelListSelected => 'Jäsenet, valittu';

  @override
  String get guildSettingsInvitesTitle => 'Kutsut';

  @override
  String get guildSettingsInvitesDescription =>
      'Näytä kaikki tämän yhteisön kutsut. Jos haluat luoda uuden kutsun, siirry kanavalle ja käytä kutsu-painiketta.';

  @override
  String get guildSettingsInvitesEmpty => 'Ei kutsulinkkejä';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Tällä yhteisöllä ei ole vielä kutsulinkkejä. Mene kanavalle ja luo kutsu, jotta voit kutsua ihmisiä.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Kutsujen lataus epäonnistui';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Kutsujen lataamisessa tapahtui virhe. Yritä uudelleen.';

  @override
  String get guildSettingsInvitesTryAgain => 'Yritä uudelleen';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Näytä luontipäivämäärä vanhentumispäivämäärän sijaan';

  @override
  String get guildSettingsInvitesPauseInvites => 'Keskeytä kutsut';

  @override
  String get guildSettingsInvitesEnableInvites => 'Ota kutsut käyttöön';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Keskeytä kutsut tähän yhteisöön';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Ota kutsut käyttöön tässä yhteisössä';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Keskeytetäänkö kutsut? Uudet käyttäjät eivät voi liittyä kutsulinkkien kautta, ennen kuin otat ne uudelleen käyttöön. Olemassa oleviin jäseniin tämä ei vaikuta.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Ota kutsut käyttöön? Käyttäjät voivat taas liittyä tähän yhteisöön kutsulinkkien kautta.';

  @override
  String get guildSettingsInvitesPause => 'Keskeytä';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Kutsut tähän yhteisöön on keskeytetty.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Kutsut on keskeytetty, koska $productName havaitsi mahdollisen hyökkäyksen. Uudet käyttäjät eivät voi liittyä juuri nyt.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Kutsuja:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanava:';

  @override
  String get guildSettingsInvitesLabelCode => 'Koodi:';

  @override
  String get guildSettingsInvitesLabelUses => 'Käyttää:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Luotu:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Vanhenee:';

  @override
  String get guildSettingsInvitesUnknown => 'Tuntematon';

  @override
  String get guildSettingsInvitesNoCategory => 'Ei kategoriaa';

  @override
  String get guildSettingsInvitesExpired => 'Vanhentunut';

  @override
  String get guildSettingsInvitesNever => 'Ei koskaan';

  @override
  String get guildSettingsInvitesCopyLink => 'Kopioi kutsulinkki';

  @override
  String get guildSettingsInvitesRevoke => 'Peruuta kutsu';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Kutsua ei voitu peruuttaa';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Linkki saattaa edelleen toimia. Yritä uudelleen hetken kuluttua.';

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
  String get guildSettingsEmojiSlotsTitle => 'Emojipaikat';

  @override
  String get guildSettingsEmojiDropZone =>
      'Vedä ja pudota emojitiedostot tähän';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Emojien lataus epäonnistui. Yritä uudelleen myöhemmin.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Hakua vastaavia emojeita ei löytynyt.';

  @override
  String get guildSettingsEmojiNoSlots => 'Ei emojipaikkoja vapaana';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Olet saavuttanut emojien enimmäismäärän. Poista joitakin olemassa olevia emojeita tehdäksesi tilaa.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emoji-nimien tulee olla vähintään 2 merkkiä pitkiä, ja niissä voidaan käyttää kirjaimia, numeroita ja alaviivoja. Emojien koko saa olla enintään $maxSize. Staattiset kuvat muokataan automaattisesti kokoon 128x128 pikseliä ja pakataan. Animoitujen emojien ja SVG-kuvien on oltava valmiiksi määritellyn koon mukaisia.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Ladataan emojeita';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojia',
      one: '# emoji',
    );
    return 'Ladataan $_temp0. Tämä voi kestää hetken.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Emojien lataaminen epäonnistui. Yritä uudelleen.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Joitakin emojeita ei voitu lisätä';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Tarkista nämä tiedostot ja yritä uudelleen pienemmillä tai yksinkertaisemmilla kuvilla.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Nimeä emoji uudelleen';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2–32 merkkiä, kirjaimia, numeroita, alaviivoja.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Nimi';

  @override
  String get guildSettingsEmojiColumnUploader => 'Lataaja';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Tuntematon';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Poista emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Poistetaanko :$name:? Tätä ei voi peruuttaa.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Poista tämä emoji tallennustilasta ja CDN:stä';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Emojin nimen on oltava vähintään 2 merkkiä pitkä';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Emojin nimen pituus saa olla enintään 32 merkkiä';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Virheellinen emojin nimi';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Hymiön nimeäminen epäonnistui';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Nimi palautettiin entiselleen. Yritä uudelleen hetken kuluttua.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Tätä emojia ei enää ole olemassa';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Se on ehkä poistettu. Nimi palautettiin entiselleen.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Et voi nimetä tätä emojia uudelleen';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Sinulla ei ole oikeutta nimetä tätä emojia uudelleen. Nimi palautettiin entiselleen.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Liian nopeasti';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Odota hetki ja yritä uudelleen nimeämistä.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Hymiön poistaminen epäonnistui';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Et voi poistaa tätä emojia';

  @override
  String get guildSettingsCloneEmojiTitle => 'Salli muiden kloonata emojisi';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Kun tämä on käytössä, muiden yhteisöjen jäsenet voivat käyttää sovelluksen sisäistä yhden napsautuksen \"Kloonaa\"-pikakuvaketta mukautetuille emojeillesi. Tämä ei estä heitä tallentamasta kuvaa ja lataamasta sitä itse.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Salli muiden kloonata tarrojasi';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Kun tämä on käytössä, muiden yhteisöjen jäsenet voivat käyttää sovelluksen \"Kloonaa\"-pikakuvaketta mukautetuissa tarroissasi. Tämä ei estä heitä tallentamasta kuvaa ja lataamasta sitä itse.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Vain jäsenet, joilla on $permission-oikeus, voivat muuttaa tätä.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Emojien kloonausta ei voitu päivittää';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Tarrojen kloonausta ei voitu päivittää';

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
  String get guildSettingsStickerSlotsTitle => 'Tarratilat';

  @override
  String get guildSettingsStickerUploadTitle => 'Lataa tarra';

  @override
  String get guildSettingsStickerDropZone =>
      'Vedä ja pudota tähän tarratiedosto (yksi kerrallaan)';

  @override
  String get guildSettingsStickerDensity => 'Tarrojen tiheys';

  @override
  String get guildSettingsStickerDensityCozy => 'Kotoisa';

  @override
  String get guildSettingsStickerDensityCompact => 'Tiivis';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'Tarragallerian lataus epäonnistui';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Tarrojen lataamisessa tapahtui virhe. Yritä uudelleen.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Hakua vastaavia tarroja ei löytynyt.';

  @override
  String get guildSettingsStickersEmptySearch => 'Tarroja ei löytynyt';

  @override
  String get guildSettingsStickerNoSlots => 'Ei tarrojen paikkoja saatavilla';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Olet saavuttanut tarrojen enimmäismäärän. Poista joitakin olemassa olevia tarroja tehdäksesi tilaa.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Tarrat tallennetaan kokoon 320x320 pikseliä, ja niiden koko saa olla enintään $maxSize. Staattiset kuvat muokataan automaattisesti ja pakataan. Animoitujen tarrojen ja SVG-kuvien on oltava valmiiksi määritellyn koon mukaisia.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => 'Tiedostomuotoa ei tueta';

  @override
  String get guildSettingsStickerAddTitle => 'Lisää tarra';

  @override
  String get guildSettingsStickerEditTitle => 'Muokkaa tarraa';

  @override
  String get guildSettingsStickerNameLabel => 'Nimi';

  @override
  String get guildSettingsStickerNameHint => 'Upea tarra';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Kuvaus';

  @override
  String get guildSettingsStickerDescriptionHint => 'Kuvaile tarraa';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tunnisteet ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Lisää tunniste';

  @override
  String get guildSettingsStickerTagAdd => 'Lisää';

  @override
  String get guildSettingsStickerNameRequired => 'Nimi on pakollinen';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Nimen on oltava vähintään 2 merkkiä pitkä';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Nimen on oltava enintään 30 merkkiä pitkä';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Kuvauksen on oltava enintään 500 merkkiä pitkä';

  @override
  String get guildSettingsStickerCreateFailedTitle => 'Tarraa ei voitu luoda';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Tarra on liian suuri';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Tarraa ei voitu pakata riittävästi';

  @override
  String get guildSettingsStickerDeleteTitle => 'Poista tarra';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Poistetaanko \"$name\"? Tätä ei voi peruuttaa.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Poista tämä tarra tallennustilasta ja CDN:stä';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Tämän tarran poistaminen epäonnistui';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Et voi poistaa tätä tarraa';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Luo webhook avaamalla $channelSettingsPath. Voit edelleen muokata ja järjestää kaikki olemassa olevat webhookit täällä.';
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
  String get guildSettingsInvitesTableExpires => 'Vanhenee';

  @override
  String get guildSettingsAuditLogFilterUser => 'Suodata käyttäjän mukaan';

  @override
  String get guildSettingsAuditLogFilterAction => 'Suodata toiminnon mukaan';

  @override
  String get createDm => 'Luo yksityisviesti';

  @override
  String get createGroupDm => 'Luo ryhmäkeskustelu';

  @override
  String get createDmNewMessage => 'Uusi viesti';

  @override
  String get createDmSelectFriends => 'Valitse ystäviä';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Valitse ystävät, joille lähetät viestin.';

  @override
  String get createDmSearchFriends => 'Hae ystäviä';

  @override
  String get createDmNoFriendsFound => 'Yhtään ystävää ei löytynyt';

  @override
  String get createDmNoFriendsYet => 'Sinulla ei ole vielä yhtään kaveria';

  @override
  String get createDmClaimToStartDms =>
      'Lunasta tilisi aloittaaksesi yksityisviestit.';

  @override
  String get createDmVerifyToStartDms =>
      'Vahvista sähköpostiosoitteesi aloittaaksesi yksityisviestit.';

  @override
  String get createDmVerifyYourEmail => 'Vahvista sähköpostiosoitteesi';

  @override
  String get createDmNewGroup => 'Uusi ryhmä';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Luo uusi ryhmä käyttäjän $userName kanssa';
  }

  @override
  String get createDmConfirmNewGroup => 'Vahvista uusi ryhmä';

  @override
  String get createDmCreateNewGroup => 'Luo uusi ryhmä';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Poista $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Sinulla on jo ryhmä näiden käyttäjien kanssa. Haluatko varmasti luoda uuden? Sekin sopii!';

  @override
  String get createDmNoActivityYet => 'Ei vielä toimintaa';

  @override
  String get createDmSomeUsersCantBeAdded => 'Joitakin käyttäjiä ei voi lisätä';

  @override
  String get createDmCreateWithoutThem => 'Luo ilman heitä';

  @override
  String get createDmUnaddableIntro =>
      'Seuraavia henkilöitä ei voi lisätä tähän ryhmäkeskusteluun:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Luo ryhmäkeskustelu jäljellä olevien $count vastaanottajan kanssa ja ohita muut?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Ei jäljellä olevia vastaanottajia ryhmäkeskustelun luomiseen.';

  @override
  String get createDmUnaddableUserNotFound => 'Käyttäjää ei löydy';

  @override
  String get createDmUnaddableBlocked =>
      'Et voi lähettää viestiä tälle käyttäjälle';

  @override
  String get createDmUnaddableNotFriends => 'Ei kaverilistallasi';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Ei voi lisätä ryhmäkeskusteluihin';

  @override
  String get createDmFailed => 'Keskustelua ei voitu luoda. Yritä uudelleen.';

  @override
  String get dmListMessagesTitle => 'Viestit';

  @override
  String get dmListDirectMessagesTitle => 'Suorat viestit';

  @override
  String get keybindsSearchShortcuts => 'Hae pikanäppäimiä';

  @override
  String get keybindSectionDefaults => 'Oletusasetukset';

  @override
  String get keybindSectionMessages => 'Viestit';

  @override
  String get keybindSectionNavigation => 'Navigointi';

  @override
  String get keybindSectionDragAndDrop => 'Vedä ja pudota';

  @override
  String get keybindSectionChat => 'Keskustelu';

  @override
  String get keybindSectionVoiceAndVideo => 'Puhelut';

  @override
  String get keybindSectionMisc => 'Muut';

  @override
  String get keybindActionShowShortcutsList => 'Näytä pikanäppäinten luettelo';

  @override
  String get keybindActionCopyText => 'Kopioi teksti';

  @override
  String get keybindActionMarkUnread => 'Merkitse lukemattomaksi';

  @override
  String get keybindActionFocusTextarea => 'Kohdista tekstikenttä';

  @override
  String get keybindActionSwitchCommunities => 'Vaihda yhteisöä';

  @override
  String get keybindActionSwitchChannels => 'Vaihda kanavien välillä';

  @override
  String get keybindActionHistoryBack => 'Siirry taaksepäin kanavahistoriassa';

  @override
  String get keybindActionHistoryForward =>
      'Siirry eteenpäin kanavahistoriassa';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Siirry lukemattomien kanavien välillä';

  @override
  String get keybindActionJumpMentionChannels =>
      'Siirry lukemattomien kanavien välillä, joissa on mainintoja';

  @override
  String get keybindActionJumpCurrentCall => 'Siirry puheluun';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Vaihda viimeisimmän yhteisön ja yksityisviestien välillä';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Vaihda edelliseen yhteisöön tai yksityisviesteihin';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Vaihda seuraavaan yhteisöön tai yksityisviesteihin';

  @override
  String get keybindActionGoToDms => 'Siirry yksityisviesteihin';

  @override
  String get keybindActionGoToFirstCommunity => 'Siirry ensimmäiseen yhteisöön';

  @override
  String get keybindActionGoToSecondCommunity => 'Siirry toiseen yhteisöön';

  @override
  String get keybindActionGoToThirdCommunity => 'Siirry kolmanteen yhteisöön';

  @override
  String get keybindActionGoToFourthCommunity => 'Siirry neljänteen yhteisöön';

  @override
  String get keybindActionGoToFifthCommunity => 'Siirry viidenteen yhteisöön';

  @override
  String get keybindActionGoToSixthCommunity => 'Siirry kuudenteen yhteisöön';

  @override
  String get keybindActionGoToSeventhCommunity =>
      'Siirry seitsemänteen yhteisöön';

  @override
  String get keybindActionGoToEighthCommunity =>
      'Siirry kahdeksanteen yhteisöön';

  @override
  String get keybindActionToggleQuickSwitcher => 'Vaihda pikahaku päälle/pois';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Luo yhteisö tai liity sellaiseen';

  @override
  String get keybindActionStartDragAndDrop => 'Aloita raahaus ja pudotus';

  @override
  String get keybindActionMove => 'Siirrä';

  @override
  String get keybindActionDropItem => 'Pudota esine';

  @override
  String get keybindActionCancel => 'Peruuta';

  @override
  String get keybindActionMarkCommunityRead => 'Merkitse yhteisö luetuksi';

  @override
  String get keybindActionMarkChannelRead => 'Merkitse kanava luetuksi';

  @override
  String get keybindActionStartGroupDm => 'Aloita ryhmäkeskustelu';

  @override
  String get keybindActionTogglePinnedMessages => 'Vaihda kiinnitetyt viestit';

  @override
  String get keybindActionToggleInbox => 'Vaihda Saapuneet-näkymää';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Merkitse ylin saapuneet-kanava luetuksi';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Merkitse kaikki saapuneet-kanavat luetuiksi';

  @override
  String get keybindActionToggleMemberList =>
      'Vaihda jäsenluettelon tai äänichatin näyttöä';

  @override
  String get keybindActionToggleEmojiPicker => 'Avaa tai sulje emojivalitsin';

  @override
  String get keybindActionToggleGifPicker => 'Avaa/sulje GIF-valitsin';

  @override
  String get keybindActionToggleStickerPicker => 'Avaa/sulje tarratyökalu';

  @override
  String get keybindActionScrollChatUp => 'Vieritä keskustelua ylöspäin';

  @override
  String get keybindActionScrollChatDown => 'Vieritä keskustelua alas';

  @override
  String get keybindActionJumpOldestUnread =>
      'Siirry vanhimpaan lukemattomaan viestiin';

  @override
  String get keybindActionFocusComposer => 'Siirrä kohdistus tekstikenttään';

  @override
  String get keybindActionUploadFile => 'Lähetä tiedosto';

  @override
  String get keybindActionCopyChannelLink => 'Kopioi kanavalinkki';

  @override
  String get keybindActionToggleSavedMedia => 'Vaihda tallennettu media';

  @override
  String get keybindActionSendVoiceMessage => 'Lähetä ääniviesti';

  @override
  String get keybindActionAnswerCall => 'Vastaa saapuvaan puheluun';

  @override
  String get keybindActionDeclineCall => 'Hylkää saapuva puhelu';

  @override
  String get keybindActionStartDmCall =>
      'Aloita puhelu yksityis- tai ryhmäkeskustelussa';

  @override
  String get keybindActionToggleSoundboard => 'Vaihda äänipöydän tilaa';

  @override
  String get keybindActionToggleCompactCallView =>
      'Laajenna tai kutista tiivis puhelunäkymä';

  @override
  String get keybindActionPushToTalkPriority =>
      'Puhu painamalla (prioriteetti)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Ääniaktiivisuuden prioriteetti';

  @override
  String get keybindActionOpenHelp => 'Avaa ohje';

  @override
  String get keybindActionSearchMessages => 'Hae viesteistä';

  @override
  String get keybindActionOpenContextMenu => 'Avaa pikavalikko';

  @override
  String get keybindActionOpenSettings => 'Avaa asetukset';

  @override
  String get keybindActionOpenThemeStudio =>
      'Avaa teemastudion ponnahdusikkuna';

  @override
  String get keybindActionZoomIn => 'Lähennä';

  @override
  String get keybindActionZoomOut => 'Loitonna';

  @override
  String get keybindActionZoomReset => 'Palauta zoomaus';

  @override
  String get clipboardPasteFailed =>
      'Ei voitu liittää. Leikepöytä oli tyhjä tai estetty tässä sovelluksessa.';

  @override
  String get homeQuickActionDms => 'Keskustelut';
}
