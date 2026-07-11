// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class FluxerLocalizationsIs extends FluxerLocalizations {
  FluxerLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get reconnectingTitle => 'Við klúðruðum því!';

  @override
  String get reconnectingBody =>
      'Eitthvað er að þjónunum.\nÞetta ætti að lagast á augnabliki!';

  @override
  String get gatewayReconnectingToast => 'Endurtengist…';

  @override
  String get gatewayConnectedToast => 'Tengt';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Mistókst að ræsa: $error';
  }

  @override
  String get retry => 'Reyna aftur';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Tenging rofin';

  @override
  String get splashViewOnStatusPage => 'Skoða á stöðusíðu';

  @override
  String get splashConnectionIssuesPrompt => 'Tengingarvandamál?';

  @override
  String get splashStatusPageLink => 'Stöðusíða';

  @override
  String get splashReadIncident => 'Lesa atvik';

  @override
  String get splashIncidentHistory => 'Saga atvika';

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
  String get welcomeBack => 'Velkomin aftur';

  @override
  String get email => 'Netfang';

  @override
  String get emailInvalid => 'Vinsamlegast sláðu inn gilt netfang.';

  @override
  String get password => 'Lykilorð';

  @override
  String get forgotPassword => 'Gleymt lykilorð?';

  @override
  String get logIn => 'Innskráning';

  @override
  String get logInWithPasskey => 'Innskráning með lykilskilríði';

  @override
  String continueWithSso(String provider) {
    return 'Haltu áfram með $provider';
  }

  @override
  String get ssoRequired => 'SSO er krafist til að fá aðgang að þessari síðu.';

  @override
  String get organizationSsoProvider =>
      'Skráðu þig inn með SSO-veitanda stofnunarinnar.';

  @override
  String get failedToStartSso => 'Mistókst að ræsa SSO';

  @override
  String get ssoCancelled => 'SSO-innskráning var hætt við';

  @override
  String preferSso(String provider) {
    return 'Viltu frekar nota SSO? Haltu áfram með $provider.';
  }

  @override
  String get logInViaBrowser => 'Innskráning í gegnum vafra';

  @override
  String get needAccountPrompt => 'Þarftu aðgang? ';

  @override
  String get register => 'Nýskráning';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Staðfestu að þú sért manneskja';

  @override
  String get captchaDescription =>
      'Við þurfum að ganga úr skugga um að þú sért ekki vélmenni. Vinsamlegast ljúktu við staðfestinguna hér að neðan.';

  @override
  String get captchaSwitchToHcaptcha => 'Vandamál? Prófaðu hCaptcha í staðinn';

  @override
  String get captchaSwitchToTurnstile => 'Prófaðu Turnstile í staðinn';

  @override
  String get cancel => 'Hætta við';

  @override
  String get ipAuthCheckEmail => 'Athugaðu netfangið þitt';

  @override
  String ipAuthDescription(String email) {
    return 'Við sendum tengil á heimild fyrir þessa innskráningu. Vinsamlegast opnaðu pósthólfið þitt fyrir $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Tenging rofin';

  @override
  String get ipAuthConnectionLostDescription =>
      'Við misstum tenginguna á meðan beðið var eftir heimild. Vinsamlegast reyndu aftur.';

  @override
  String get ipAuthLinkExpired => 'Innskráningartengill útrunninn';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Þessi heimildartengill rann út. Vinsamlegast skráðu þig inn aftur.';

  @override
  String get ipAuthResendEmail => 'Senda tölvupóst aftur';

  @override
  String get ipAuthResent => 'Sendur aftur';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Til baka';

  @override
  String get mfaTitle => 'Tveggja þátta auðkenning';

  @override
  String get mfaChooseMethod => 'Veldu staðfestingaraðferð';

  @override
  String get mfaMethodTotp => 'Auðkenningarforrit';

  @override
  String get mfaMethodWebauthn => 'Öryggislykill / Lykilskilríði';

  @override
  String get mfaTotpDescription =>
      'Sláðu inn 6 stafa kóðann úr auðkenningarforritinu þínu eða einn af öryggisafritunarkóðunum þínum.';

  @override
  String get mfaCodeLabel => 'Kóði';

  @override
  String get mfaTryAnotherMethod => 'Prófaðu aðra aðferð';

  @override
  String get mfaUseSecurityKey => 'Prófaðu öryggislykil / lykilorð í staðinn';

  @override
  String get accountSelectorTitle => 'Veldu aðgang';

  @override
  String get accountSelectorDescription =>
      'Veldu aðgang til að halda áfram, eða bættu við öðrum.';

  @override
  String get accountAdd => 'Bæta við aðgangi';

  @override
  String get accountRemove => 'Fjarlægja';

  @override
  String accountRemoveTitle(String username) {
    return 'Fjarlægja $username';
  }

  @override
  String get accountRemoveDescription =>
      'Þetta mun fjarlægja vistaða lotu fyrir þennan aðgang.';

  @override
  String get accountRemoveOnlyDescription =>
      'Þetta mun fjarlægja eina vistaða aðganginn á þessu tæki.';

  @override
  String get accountExpired => 'Rennbrotinn';

  @override
  String accountSessionExpired(String identifier) {
    return 'Lota rann út fyrir $identifier. Vinsamlegast skráðu þig inn aftur.';
  }

  @override
  String get accountManageTitle => 'Stjórna aðgangum';

  @override
  String get accountSwitchFailed =>
      'Tókst ekki að skipta um aðgang. Reyndu aftur.';

  @override
  String get profileTabMenuSwitchAccounts => 'Skipta um aðganga';

  @override
  String get statusChangeSheetTitle => 'Stilla stöðu';

  @override
  String get statusOnlineStatusSection => 'Staða á netinu';

  @override
  String get statusOnline => 'Á netinu';

  @override
  String get statusIdle => 'Aðgerðalaus';

  @override
  String get statusDnd => 'Ekki trufla';

  @override
  String get statusInvisible => 'Ósýnilegur';

  @override
  String get statusOffline => 'Aðgerðalaus';

  @override
  String get statusUntilIChangeIt => 'Þar til ég breyti því';

  @override
  String get statusDontClear => 'Ekki hreinsa';

  @override
  String get statusFor10Seconds => 'Í 10 sekúndur';

  @override
  String get statusClearAfter10Seconds => '10 sekúndur';

  @override
  String get statusClearAfter15Minutes => '15 mínútur';

  @override
  String get statusClearAfter30Minutes => '30 mínútur';

  @override
  String get statusClearAfter1Hour => '1 klukkustund';

  @override
  String get statusClearAfter3Hours => '3 klukkustundir';

  @override
  String get statusClearAfter4Hours => '4 klukkustundir';

  @override
  String get statusClearAfter8Hours => '8 klukkustundir';

  @override
  String get statusClearAfter24Hours => '24 klukkustundir';

  @override
  String get statusClearAfter3Days => '3 dagar';

  @override
  String get statusDndDescription => 'Þú munt ekki fá tilkynningar á skjáborði';

  @override
  String get statusInvisibleDescription => 'Þú munt virðast vera ótengdur';

  @override
  String get customStatusSetTitle => 'Stilla sérsniðna stöðu';

  @override
  String get customStatusCurrentHint => 'Sérsniðin staða';

  @override
  String get customStatusClear => 'Hreinsa sérsniðna stöðu';

  @override
  String get customStatusPlaceholder => 'Hvað er að gerast?';

  @override
  String get customStatusChooseEmoji => 'Veldu emoji';

  @override
  String get customStatusClearAfter => 'Hreinsa eftir';

  @override
  String get customStatusSave => 'Vista';

  @override
  String get accountActive => 'Virkur aðgangur';

  @override
  String get signOut => 'Skrá út';

  @override
  String get suspendedPermanentTitle => 'Aðgangi var lokað varanlega';

  @override
  String get suspendedTemporaryTitle => 'Aðgangi hefur verið lokað';

  @override
  String get suspendedPermanentDescription =>
      'Aðgangi þínum hefur verið lokað varanlega fyrir brot á notkunarskilmálum okkar.';

  @override
  String get suspendedTemporaryDescription =>
      'Aðgangi þínum hefur verið lokað tímabundið. Þú munt geta nálgast aðganginn þinn þegar lokunartímabilinu lýkur.';

  @override
  String get suspendedIssuedAt => 'Útgefið';

  @override
  String get suspendedEndsAt => 'Lýkur';

  @override
  String get suspendedDuration => 'Lengd';

  @override
  String get suspendedPermanent => 'Varandi';

  @override
  String get suspendedReason => 'Ástæða';

  @override
  String get suspendedAppealDeadline => 'Frestur til kæru';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Reikningnum þínum er áætlað að verða eytt þann $date.';
  }

  @override
  String get suspendedRecheck => 'Athuga hvort uppfærslur séu til';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Reyna aftur eftir ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Til baka á innskráningu';

  @override
  String get suspendedAppealTitle => 'Kæra';

  @override
  String get suspendedAppealHint =>
      'Útskýrðu hvers vegna kæru þinni ætti að vera vísað frá (lágmark 50 stafir)...';

  @override
  String get suspendedAppealSubmit => 'Senda kæru';

  @override
  String get suspendedAppealPending => 'Í bið eftir yfirferð';

  @override
  String get suspendedAppealAccepted => 'Kæra samþykkt';

  @override
  String get suspendedAppealRejected => 'Kæra hafnað';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Kæra þín hefur verið samþykkt og reikningur þinn hefur verið endurvirkjaður.';

  @override
  String get suspendedSignIn => 'Skráðu þig inn á reikninginn þinn';

  @override
  String get forgotPasswordTitle => 'Gleymdir þú lykilorðinu þínu?';

  @override
  String get forgotPasswordDescription =>
      'Sláðu inn netfangið þitt og við sendum þér tengil til að endurstilla lykilorðið þitt.';

  @override
  String get forgotPasswordSubmit => 'Senda endurstillingartengil';

  @override
  String get forgotPasswordSentTitle => 'Athugaðu netfangið þitt';

  @override
  String get forgotPasswordSentDescription =>
      'Við höfum sent leiðbeiningar um endurstillingar lykilorðs á netfangið þitt. Vinsamlegast athugaðu pósthólfið þitt og fylgdu tenglinum til að endurstilla lykilorðið þitt.';

  @override
  String get forgotPasswordBackToLogin => 'Fara aftur á innskráningu';

  @override
  String get resetPasswordTitle => 'Setja nýtt lykilorð';

  @override
  String get resetPasswordDescription =>
      'Sláðu inn nýja lykilorðið þitt hér að neðan til að ljúka endurstillingarferlinu.';

  @override
  String get resetPasswordNewPassword => 'Nýtt lykilorð';

  @override
  String get resetPasswordConfirm => 'Staðfesta nýtt lykilorð';

  @override
  String get resetPasswordSubmit => 'Endurstilla lykilorð';

  @override
  String get resetPasswordMismatch => 'Lykilorð passa ekki saman.';

  @override
  String get registerTitle => 'Búa til reikning';

  @override
  String get registerDisplayName => 'Sýna nafn (valfrjálst)';

  @override
  String get registerDisplayNameHint => 'Hvað ættu fólk að kalla þig?';

  @override
  String get registerUsername => 'Notandanafn (valfrjálst)';

  @override
  String get registerUsernameHint =>
      'Skildu eftir tómt fyrir handahófskennt notandanafn';

  @override
  String get registerUsernameTagHint =>
      '4 stafa merki verður bætt sjálfkrafa við til að tryggja einstakleika';

  @override
  String get registerDateOfBirth => 'Fæðingardagur';

  @override
  String get registerMonth => 'Mánuður';

  @override
  String get registerDay => 'Dagur';

  @override
  String get registerYear => 'Ár';

  @override
  String get registerConsent =>
      'Ég samþykki þjónustuskilmála og persónuverndarstefnu';

  @override
  String get registerConsentPrefix => 'Ég samþykki ';

  @override
  String get registerConsentTerms => 'þjónustuskilmála';

  @override
  String get registerConsentAnd => ' og ';

  @override
  String get registerConsentPrivacy => 'persónuverndarstefnu';

  @override
  String get registerConfirmPassword => 'Staðfesta lykilorð';

  @override
  String get registerSubmit => 'Búa til reikning';

  @override
  String get registerHaveAccount => 'Ertu nú þegar með reikning? ';

  @override
  String get passkeyNoCredentials =>
      'Engar lykilauðkennisupplýsingar fundust fyrir þetta forrit. Skráðu þig inn með tölvupósti og lykilorði í staðinn.';

  @override
  String get passkeyDeviceNotSupported =>
      'Lykilauðkennisupplýsingar eru ekki studdar á þessu tæki.';

  @override
  String get passkeyDomainNotAssociated =>
      'Lykilauðkennisupplýsingar eru ekki stilltar fyrir þetta forrit. Skráðu þig inn með tölvupósti og lykilorði í staðinn.';

  @override
  String get passkeyTimeout =>
      'Tími fyrir lykilauðkennisupplýsingar rann út. Vinsamlegast reyndu aftur.';

  @override
  String get passkeyNotAvailable =>
      'Lykilauðkennisupplýsingar eru ekki tiltækar fyrir þetta forrit. Skráðu þig inn með tölvupósti og lykilorði í staðinn.';

  @override
  String get passkeyFailed =>
      'Lykilorðsaðgangur mistókst. Vinsamlegast reyndu aftur.';

  @override
  String get errorUnableToCreateAccount =>
      'Ekki tókst að stofna reikning. Vinsamlegast reyndu aftur.';

  @override
  String get errorUnableToSignIn =>
      'Ekki er hægt að skrá þig inn núna. Vinsamlegast reyndu aftur.';

  @override
  String get errorInvalidEmailOrPassword => 'Ógilt netfang eða lykilorð.';

  @override
  String get errorUnableToSendResetLink =>
      'Ekki tókst að senda endurstillingartengil. Vinsamlegast reyndu aftur.';

  @override
  String get errorUnableToResetPassword =>
      'Ekki tókst að endurstilla lykilorð. Vinsamlegast reyndu aftur.';

  @override
  String get embedInviteJoin => 'Vertu með í samfélaginu';

  @override
  String get embedInviteGoTo => 'Fara í samfélagið';

  @override
  String embedInviteOnline(String count) {
    return '$count á netinu';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count meðlimir';
  }

  @override
  String get embedInviteUnknownTitle => 'Óþekkt boð';

  @override
  String get embedInviteUnknownSubtitle => 'Reyndu að biðja um nýtt boð.';

  @override
  String get embedInviteUnavailable => 'Boð ekki tiltækt';

  @override
  String get inviteAcceptTitle => 'Þú hefur verið beðinn um að taka þátt';

  @override
  String get inviteAcceptJoinButton => 'Vertu með í samfélaginu';

  @override
  String get inviteAcceptGoToButton => 'Fara í samfélagið';

  @override
  String get inviteAcceptInvitesPaused => 'Boðum hefur verið frestað';

  @override
  String get inviteAcceptNotFoundTitle => 'Boð ógilt';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Þetta boð gæti verið útrunnið eða ógilt.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Vertu með í hópnum';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Þú hefur verið beðinn um að taka þátt í hóp skilaboðum af $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'einhver';

  @override
  String get inviteAcceptEmojiPack => 'Emoji pakki';

  @override
  String get inviteAcceptStickerPack => 'Klistermerkjapakki';

  @override
  String get inviteAcceptInstallEmojiPack => 'Setja upp emoji pakka';

  @override
  String get inviteAcceptInstallStickerPack => 'Setja upp klistermerkjapakka';

  @override
  String get inviteAcceptPackInstallNote =>
      'Með því að samþykkja þetta boð er pakkanum settur upp sjálfkrafa.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Aðgangi að rás hafnað';

  @override
  String get channelAccessDeniedDescription =>
      'Þú hefur ekki aðgang að rásinni þar sem þessi skilaboð voru send.';

  @override
  String get messageJumpLinkNoAccess => 'Enginn aðgangur';

  @override
  String get okay => 'Í lagi';

  @override
  String get embedThemeTitle => 'Sameiginlegt þema';

  @override
  String get embedThemeSubtitle =>
      'Þessi viðskiptavinur styður ekki sérsniðin þemu.';

  @override
  String get embedThemeUnavailableButton => 'Þemu ekki tiltæk';

  @override
  String get privacySettings => 'Persónuverndarstillingar';

  @override
  String get privacyDirectMessages => 'Einkaskilaboð';

  @override
  String get privacyDirectMessagesDescription =>
      'Leyfa einkaskilaboð frá öðrum meðlimum í þessu samfélagi';

  @override
  String get privacyBotDirectMessages => 'Einkaskilaboð frá vélmennum';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Leyfa vélmennum frá þessu samfélagi að senda þér einkaskilaboð';

  @override
  String get privacyMutualDmsDisabled =>
      'Samfélagsstjórnendur hafa óvirkjað móttöku einkaskilaboða eingöngu frá sameiginlegum meðlimum í þessu samfélagi.';

  @override
  String get communityDebug => 'Samfélagsgreining';

  @override
  String get copiedToClipboard => 'Afritað á klemmuspjaldið';

  @override
  String get notificationSettings => 'Tilkyningastillingar';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Þagga $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Með því að þagga niður samfélag kemur í veg fyrir að ólesnar vísbendingar og tilkynningar birtist nema þú sért nefnd/ur';

  @override
  String get notificationCommunitySettings => 'Tilkyningastillingar samfélags';

  @override
  String get notificationAllMessages => 'Öll skilaboð';

  @override
  String get notificationOnlyMentions => 'Aðeins nefndir';

  @override
  String get notificationNothing => 'Ekkert';

  @override
  String get notificationSuppressEveryone => 'Bæla @allir og @hér';

  @override
  String get notificationSuppressRoles =>
      'Hætta við allar @nefningar á hlutverkum';

  @override
  String get notificationMobilePush => 'Farsímatilkynningar';

  @override
  String get notificationOverrides => 'Yfirskrifanir tilkynninga';

  @override
  String get notificationSelectChannel => 'Veldu rás eða flokk';

  @override
  String get notificationOnlyAtMentions => 'Aðeins @nefningar';

  @override
  String get notificationMuteChannel => 'Þagga rás';

  @override
  String get notificationUnmuteChannel => 'Afþagga rás';

  @override
  String get notificationNoCategory => 'Enginn flokkur';

  @override
  String get dmMarkAsRead => 'Merkja sem lesið';

  @override
  String get dmMuteConversation => 'Þagga skilaboð';

  @override
  String get dmUnmuteConversation => 'Afþagga skilaboð';

  @override
  String get dmPinDm => 'Festu skilaboð';

  @override
  String get dmUnpinDm => 'Aftengja skilaboð';

  @override
  String get dmAlwaysShowInSidebar => 'Sýna alltaf í hliðarstikunni';

  @override
  String get dmRemoveFromAlwaysShown => 'Fjarlægja úr alltaf sýndum';

  @override
  String get dmCloseDm => 'Loka skilaboðum';

  @override
  String get dmCloseDmConfirmTitle => 'Loka skilaboðum';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Ertu viss um að þú viljir loka DM þínum með $username? Þú getur alltaf opnað þau aftur síðar.';
  }

  @override
  String get dmCopyChannelId => 'Afrita rásarauðkenni';

  @override
  String get dmChannelIdCopied => 'Rásarauðkenni afritað';

  @override
  String get dmCopyUserId => 'Afrita notendauðkenni';

  @override
  String get dmUserIdCopied => 'Notendauðkenni afritað';

  @override
  String get dmViewProfile => 'Skoða prófíl';

  @override
  String get dmVoiceCall => 'Hringja raddsímtal';

  @override
  String get incomingVoiceCallTitle => 'Innkomandi raddsímtal';

  @override
  String get incomingVoiceCallAccept => 'Samþykkja';

  @override
  String get incomingVoiceCallDecline => 'Hafna';

  @override
  String get incomingVoiceCallLabel => 'Innkomandi símtal';

  @override
  String get incomingVoiceCallIgnore => 'Hunsa';

  @override
  String get directVoiceCallNotEligible =>
      'Ekki er hægt að hringja í þetta símtal núna. Reyndu aftur eftir augnablik.';

  @override
  String get voiceJoinCallFailed =>
      'Tókst ekki að tengjast þessu símtali. Athugaðu tenginguna þína og reyndu aftur.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Tókst ekki að taka þátt í þessu símtali. Athugaðu tenginguna þína og reyndu aftur.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Tókst ekki að uppfæra þetta símtal á netþjóninum. Athugaðu tenginguna þína og reyndu aftur.';

  @override
  String get dmAddNote => 'Bæta við minnismiða';

  @override
  String get dmEditGroup => 'Breyta hópi';

  @override
  String get dmInviteToCommunity => 'Bjóða í samfélag';

  @override
  String get dmBlock => 'Loka fyrir';

  @override
  String get dmLeaveGroup => 'Hætta í hóp';

  @override
  String get dmNoCommunitiesAvailable => 'Engin samfélög tiltæk';

  @override
  String dmGroupMemberCount(int count) {
    return '$count meðlimir';
  }

  @override
  String get dmMuteFor15Min => 'Í 15 mínútur';

  @override
  String get dmMuteFor30Min => 'Í 30 mínútur';

  @override
  String get dmMuteFor1Hour => 'Í 1 klukkustund';

  @override
  String get dmMuteFor3Hours => 'Í 3 klukkustundir';

  @override
  String get dmMuteFor4Hours => 'Í 4 klukkustundir';

  @override
  String get dmMuteFor8Hours => 'Í 8 klukkustundir';

  @override
  String get dmMuteFor24Hours => 'Í 24 klukkustundir';

  @override
  String get dmMuteFor3Days => 'Í 3 daga';

  @override
  String get dmMuteForever => 'Þar til ég kveiki aftur á því';

  @override
  String get dmPinGroupDm => 'Festu hóp skilaboð';

  @override
  String get dmUnpinGroupDm => 'Aflæsa hóp skilaboð';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Setja skilaboð í eftirlæti';

  @override
  String get dmUnfavoriteDm => 'Fjarlægja úr eftirlæti';

  @override
  String get dmFavoriteGroupDm => 'Setja hóp skilaboð í eftirlæti';

  @override
  String get dmUnfavoriteGroupDm => 'Fjarlægja hóp skilaboð úr eftirlæti';

  @override
  String get dmChangeFriendNickname => 'Breyta gælunafni vinar';

  @override
  String get dmRemoveFriend => 'Fjarlægja vin';

  @override
  String get dmAddFriend => 'Bæta við vini';

  @override
  String get dmAcceptFriendRequest => 'Samþykkja vinabeiðni';

  @override
  String get dmIgnoreFriendRequest => 'Hafna vinabeiðni';

  @override
  String get dmFriendRequestSent => 'Vinabeiðni send';

  @override
  String get dmUnblock => 'Aflæsa';

  @override
  String get dmDebugUser => 'Villaígræða notanda';

  @override
  String get dmDebugChannel => 'Villaígræða rás';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Vörumerkt skilaboð';

  @override
  String get dmUnpinned => 'Aflæst skilaboð';

  @override
  String get dmMuted => 'Þaggað skilaboð';

  @override
  String get dmUnmuted => 'Óþaggað skilaboð';

  @override
  String get dmRemoveFriendConfirmTitle => 'Fjarlægja vin';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Ertu viss um að þú viljir fjarlægja $username sem vin?';
  }

  @override
  String get dmBlockConfirmTitle => 'Læsa notanda';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Ertu viss um að þú viljir læsa $username? Hann/hún mun ekki geta sent þér skilaboð eða vinabeiðnir.';
  }

  @override
  String get dmFriendRequestSentToast => 'Vinabeiðni send';

  @override
  String get dmFriendRequestFailed => 'Tókst ekki að senda vinabeiðni';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Tókst ekki að samþykkja vinabeiðni';

  @override
  String get dmRemoveFriendFailed => 'Tókst ekki að fjarlægja vin';

  @override
  String get dmBlockFailed => 'Tókst ekki að læsa notanda';

  @override
  String get dmUnblockFailed => 'Tókst ekki að aflæsa notanda';

  @override
  String get dmIgnoreFriendRequestFailed => 'Tókst ekki að hafna vinabeiðni';

  @override
  String get dmAddFriends => 'Bæta við vinum';

  @override
  String get addFriendSheetTitle => 'Bæta við vini';

  @override
  String get addFriendUsernameHint => 'Notandanafn#0000';

  @override
  String get addFriendUsernameLabel => 'Notandanafn vinar';

  @override
  String get addFriendSendRequest => 'Senda beiðni';

  @override
  String get addFriendNoUserFound =>
      'Enginn notandi fannst með því notandanafni.';

  @override
  String get addFriendInvalidUsername =>
      'Sláðu inn gilt notandanafn (Notandanafn#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Vinabeiðni send';

  @override
  String get addFriendClaimTitle => 'Krefjast reikningsins þíns';

  @override
  String get addFriendClaimDescription =>
      'Krefjast reikningsins þíns til að senda vinabeiðnir.';

  @override
  String get addFriendVerifyTitle => 'Staðfesta netfangið þitt';

  @override
  String get addFriendVerifyDescription =>
      'Þú þarft að staðfesta netfangið þitt áður en þú getur sent vinabeiðnir.';

  @override
  String get addFriendVerifyEmail => 'Staðfesta netfang';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Innkomnar vinabeiðnir ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Útgefnar vinabeiðnir ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Innkominn vinabeiðni';

  @override
  String get addFriendOutgoingStatus => 'Vinabeiðni send';

  @override
  String get addFriendViewProfile => 'Skoða prófíl';

  @override
  String get addFriendAccept => 'Samþykkja';

  @override
  String get addFriendIgnore => 'Hafna';

  @override
  String get addFriendAcceptTitle => 'Samþykkja vinabeiðni';

  @override
  String get addFriendIgnoreTitle => 'Hafna vinabeiðni';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Samþykkja vinabeiðni frá $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Hafna vinabeiðni frá $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Hætta við beiðni';

  @override
  String get addFriendCancelRequestFailed =>
      'Ekki tókst að hætta við vinabeiðni. Reyndu aftur.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Þau eru ekki að taka við vinabeiðnum núna.';

  @override
  String get addFriendUnblockFirst =>
      'Aftengdu þau fyrst til að senda vinabeiðni.';

  @override
  String get addFriendCannotSendToSelf =>
      'Þú getur ekki sent vinabeiðni til sjálfs þín.';

  @override
  String get addFriendAlreadyFriends => 'Þið eruð nú þegar vinir.';

  @override
  String get addFriendClaimToSend =>
      'Ljúktu við skráningu til að senda vinabeiðnir.';

  @override
  String get addFriendSendFailedGeneric =>
      'Ekki tókst að senda vinabeiðni. Reyndu aftur.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Kerfi';

  @override
  String get emojiSearchPlaceholder => 'Finndu emoji drauma þinna';

  @override
  String get emojiSearchEmpty => 'Engin emoji passa við leitina þína';

  @override
  String get emojiAutocompleteDefaultLabel => 'Sjálfgefið emoji';

  @override
  String get emojiFrequentlyUsed => 'Oft notuð';

  @override
  String get emojiTabGifs => 'GIF myndir';

  @override
  String get emojiTabMedia => 'Miðlar';

  @override
  String get emojiTabStickers => 'Klistermerki';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Leita að GIF myndum';

  @override
  String get gifPickerSearchKlipy => 'Leita að KLIPY';

  @override
  String get gifPickerSearchTenor => 'Leita að Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Vinsælast';

  @override
  String get gifPickerTrending => 'Vinsælar GIF myndir';

  @override
  String get gifPickerNoResultsTitle => 'Engar niðurstöður';

  @override
  String get gifPickerNoResultsDescription => 'Prófaðu annað leitarorð';

  @override
  String get gifPickerLoadFailedTitle => 'Gat ekki hlaðið GIF-skrám';

  @override
  String get gifPickerLoadFailedBody =>
      'Athugaðu nettenginguna þína og reyndu aftur.';

  @override
  String get emojiCategoryPeople => 'Fólk';

  @override
  String get emojiCategoryNature => 'Náttúra';

  @override
  String get emojiCategoryFood => 'Matur og drykkur';

  @override
  String get emojiCategoryActivity => 'Afþreying';

  @override
  String get emojiCategoryTravel => 'Ferðalög og staðir';

  @override
  String get emojiCategoryObjects => 'Hlutir';

  @override
  String get emojiCategorySymbols => 'Tákn';

  @override
  String get emojiCategoryFlags => 'Fánar';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Opnaðu $emojiCount af $communityCount með Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Fá Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Ekki sýna þetta aftur';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sérsniðin emoji',
      one: '1 sérsniðið emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count samfélög',
      one: '1 samfélag',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Viðvörun um ytri tengil';

  @override
  String get externalLinkWarningLeaving => 'Þú ert að fara úr Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Utanaðkomandi tenglar geta verið hættulegir. Vinsamlegast vertu varkár.';

  @override
  String get externalLinkWarningDestinationUrl => 'Áfangastaður:';

  @override
  String get externalLinksSectionTitle => 'Utanaðkomandi tenglar';

  @override
  String get externalLinksSectionDescription =>
      'Stilla hvernig viðvörunum um utanaðkomandi tengla er sinnt.';

  @override
  String get externalLinkWarningTrustPrefix => 'Treysta alltaf ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — sleppa þessari viðvörun næst';

  @override
  String get externalLinkVisitSite => 'Hefja heimsókn';

  @override
  String get externalLinkTrustAllLabel => 'Treysta öllum utanaðkomandi tenglum';

  @override
  String get externalLinkStripTrackingLabel =>
      'Fjarlægja rakningarfæribreytur úr tenglum';

  @override
  String get externalLinkStripTrackingDescription =>
      'Fjarlægir sjálfkrafa rakningarfæribreytur (eins og utm_source, fbclid, gclid) úr tenglum í skilaboðum sem þú sendir. Hreinsar tengilinn áður en hann berst öðrum.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Treysta öllum utanaðkomandi tenglum?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Þetta mun treysta öllum utanaðkomandi tenglum og sleppa viðvörun fyrir hvern lén. Núverandi treystu lén verða skipt út. Þetta er óöruggara.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Treysta öllum';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Hætta að treysta öllum tenglum?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Utanaðkomandi tenglaviðvaranir verða birtar aftur. Þú þarft að bæta við treystum lénum fyrir sig.';

  @override
  String get externalLinkStopTrustingAllAction => 'Slökkva á trausti á öllum';

  @override
  String get externalLinkTrustedAllDescription =>
      'Allir utanaðkomandi tenglar eru treystir. Viðvaranir verða ekki birtar.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Þú hefur $count treyst(uð) lén. Bættu við fleirum með því að haka í reitinn þegar þú heimsækir utanaðkomandi tengla.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Þegar þetta er virkt verða engar utanaðkomandi tenglaviðvaranir birtar. Þetta er óöruggara.';

  @override
  String get imageFileTooLarge =>
      'Myndskrá er of stór. Vinsamlegast veldu skrá sem er minni en 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animeruð prófílmynd krefst Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animeruð borðar krefjast Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animeruð AVIF ekki studd';

  @override
  String get animatedAvifNotSupportedBody =>
      'Klipping og snúningur á animuðum AVIF-skrám er ekki studd ennþá. Ef þú heldur áfram verður hún hlaðið upp í upprunalegu formi.';

  @override
  String get uploadAsIs => 'Hlaða upp eins og er';

  @override
  String get croppingAnimatedNotSupported =>
      'Klipping á animuðum myndum er ekki studd ennþá. Upprunalega upphleðslan verður notuð.';

  @override
  String get cropAvatar => 'Snyrta prófílmynd';

  @override
  String get cropBanner => 'Snyrta borða';

  @override
  String get skip => 'Sleppa';

  @override
  String get crop => 'Snyrta';

  @override
  String get changeYourFluxerTag => 'Breyta FluxerTag þínum';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Notendanöfn mega aðeins innihalda bókstafi (a-z, A-Z), tölur (0-9) og undirstrik. Notendanöfn eru ekki háð stafamun.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Notendanöfn mega aðeins innihalda bókstafi (a-z, A-Z), tölur (0-9) og undirstrik. Notendanöfn eru ekki háð stafamun. Þú getur valið hvaða tiltæka 4-stafa merki sem er frá #0000 til #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Notendanöfn mega aðeins innihalda bókstafi (a-z, A-Z), tölur (0-9) og undirstrik. Notendanöfn eru ekki háð stafamun. Þú getur valið hvaða tiltæka 4-stafa merki sem er frá #0001 til #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Milli $min og $max stafir';
  }

  @override
  String get validationAllowedChars =>
      'Aðeins bókstafir (a-z, A-Z), tölur (0-9) og undirstrik (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Fáðu Plutonium til að sérsníða merkið þitt eða halda því þegar þú breytir notendanafni þínu';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag er þegar tekið';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTagið $username#$discriminator er þegar tekið. Ef þú heldur áfram verður diskrimínatorinn þinn sjálfkrafa endurvalinn.';
  }

  @override
  String get customTagIsTemporary => 'Sérsniðið merki er tímabundið';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Sérsniðið 4-stafa merkið þitt er aðeins fáanlegt á meðan Plutonium áskriftin þín er virk. Þegar áskriftin þín rennur út þann $date mun merkið þitt fara aftur í handahófskennt númer eftir 3 daga viðbótartíma.';
  }

  @override
  String get customTagTemporaryBody =>
      'Sérsniðið 4-stafa merkið þitt er aðeins fáanlegt á meðan Plutonium áskriftin þín er virk. Þegar áskriftin þín rennur út mun merkið þitt fara aftur í handahófskennt númer eftir 3 daga viðbótartíma.';

  @override
  String get iUnderstandContinue => 'Ég skil, halda áfram';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Ef þú vistar þetta FluxerTag mun sérsniðið 4-stafa merki þitt fara aftur í handahófskennt númer þegar Plutonium áskriftin þín rennur út. Ef áskriftin þín endurnýjast ekki, færðu 3 daga viðbótartíma áður en merkið breytist.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Sérsniðið 4-stafa merkið þitt (#$discriminator) er virkt á meðan Plutonium áskriftin þín er virk. Ef áskriftin þín rennur út eða endurnýjast ekki eftir 3 daga viðbótartíma, mun merkið þitt fara aftur í handahófskennt númer.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Sérsníðaðu 4-stafa merkið þitt eða haltu því þegar þú breytir notendanafni þínu';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Plutonium prufuáskriftin þín rennur út þann $date. Uppfærðu til að halda sérsniðna merkinu þínu og vinna þér inn merki á prófílnum þínum.';
  }

  @override
  String get premiumTrialActive =>
      'Þú ert í Plutonium prufuáskrift. Uppfærðu til að halda sérsniðna merkinu þínu og vinna þér inn merki á prófílnum þínum.';

  @override
  String get fluxerTagUpdated => 'FluxerTag uppfært';

  @override
  String get fluxerTagUpdateFailed =>
      'Tókst ekki að uppfæra FluxerTag. Vinsamlegast reyndu aftur.';

  @override
  String get continueAction => 'Halda áfram';

  @override
  String get profileCustomizationTitle => 'Sérsnið prófíls';

  @override
  String get profileCustomizationDescription =>
      'Breyttu útliti prófílsins þíns og sjáðu lifandi forskoðun';

  @override
  String get usernameLabel => 'Notendanafn';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Kröfðu reikninginn þinn til að breyta FluxerTag þínu';

  @override
  String get changeFluxerTag => 'Breyta FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Sérsníddu 4-stafa merkið þitt (#$discriminator) að vild með Plutonium';
  }

  @override
  String get changeUsernameAndTagHint => 'Breyta notandanafni og 4-stafa merki';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Sérsniðna merkið þitt (#$discriminator) er bundið Plutonium áskriftinni þinni og mun breytast í handahófskennt merki ef hún rennur út.';
  }

  @override
  String get displayNameLabel => 'Sýna nafn';

  @override
  String get pronounsLabel => 'Fornafn';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Breyta avatar';

  @override
  String get removeAvatar => 'Fjarlægja avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Ráðlagt: 512×512px';

  @override
  String get bannerLabel => 'Borði';

  @override
  String get changeBanner => 'Breyta borða';

  @override
  String get removeBanner => 'Fjarlægja borða';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10MB. Lágmark: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Aukalitur';

  @override
  String get accentColorDescription =>
      'Sérsniðir ramma og borðalit á prófílnum þínum';

  @override
  String get aboutMeLabel => 'Um mig';

  @override
  String get aboutMeHelperText => 'Þú getur notað tengla, emoji og Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Persónuvernd Plutonium merkis';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Stjórnaðu hvernig Plutonium merkið þitt er sýnt öðrum';

  @override
  String get hidePlutoniumBadgeLabel => 'Fela Plutonium merki algjörlega';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Fela Plutonium merkið þitt algjörlega fyrir öðrum notendum';

  @override
  String get hidePlutoniumPurchaseDate => 'Fela Plutonium kaupdagsetningu';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Fela Plutonium kaupdagsetningu ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Fjarlægja dagsetningu fyrstu Plutonium kaupa af merkinu þínu';

  @override
  String get maskVisionaryAsSubscription => 'Fela Visionary sem áskrift';

  @override
  String get maskVisionaryDescription =>
      'Sýna Visionary þinn sem venjulega áskrift í staðinn';

  @override
  String get hideVisionaryIdBadge => 'Fela Visionary ID merki';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Fela Visionary ID merki (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Fjarlægja Visionary ID merkið þitt';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Þú ert í Plutonium prufuáskrift — áskriftin þín hefst $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Áskriftin þín mun sjálfkrafa hefjast þegar prufuáskriftinni lýkur. Engin aðgerð þarf.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Þú ert í Plutonium prufuáskrift sem rennur út $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Þú ert í Plutonium prufuáskrift';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10MB. Ráðlagt: 512×512px. Animeruð avatar (GIF) krefst Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Sérsníddu prófílinn þinn með kyrrstæðu eða animeraðri borðamynd til að láta hann skera sig úr.';

  @override
  String get getPlutonium => 'Fáðu Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Innkaup í forriti eru ekki fáanleg á þessum vettvangi ennþá. Fylgstu með — kemur bráðum!';

  @override
  String get profilePreviewLabel => 'Forskoðun';

  @override
  String get profilePreviewMessage => 'Skilaboð';

  @override
  String get profilePreviewMemberSince => 'Fluxer meðlimur síðan';

  @override
  String get unclaimedAccountTitle => 'Ókrafinn reikningur';

  @override
  String get unclaimedAccountDescription =>
      'Reikningurinn þinn hefur ekki verið krafinn enn. Án tölvupósts og lykilorðs gætirðu misst aðgang. Krefðu reikninginn þinn núna til að tryggja hann.';

  @override
  String get claimAccount => 'Krefjast reiknings';

  @override
  String get profileTypeLabel => 'Tegund prófíls';

  @override
  String get profileTypeGlobal => 'Alheims prófíll';

  @override
  String get profileTypeGuildDescription =>
      'Þú ert að breyta prófílnum þínum fyrir samfélag. Þessi prófíll verður aðeins sýnilegur í þessu samfélagi og mun yfirskrifa alheims prófílinn þinn.';

  @override
  String get communityNicknameLabel => 'Gælunafn samfélags';

  @override
  String get perGuildPremiumUpsellText =>
      'Sérsniðnar persónur þínar, borðar, aukalitur og ævisögur fyrir einstök samfélög krefjast Plutonium. Nafn samfélags og fornafn eru ókeypis fyrir alla.';

  @override
  String get avatarModeInherit => 'Notaðu almenna prófíl';

  @override
  String get avatarModeCustom => 'Notaðu sérsniðna mynd';

  @override
  String get avatarModeUnset => 'Ekki sýna';

  @override
  String get profileSavedToast => 'Prófíll uppfærður';

  @override
  String get profileEditButton => 'Breyta prófíl';

  @override
  String get profileNoteLabel => 'Athugasemd';

  @override
  String get profileNoteVisibility => '(aðeins sýnilegt þér)';

  @override
  String get profileNoteEmpty => 'Engin athugasemd enn.';

  @override
  String get sudoTitle => 'Staðfestu auðkenni þitt';

  @override
  String get sudoDescription =>
      'Þessi aðgerð krefst staðfestingar til að halda áfram.';

  @override
  String get sudoAuthenticatorCode => 'Staðfestingarkóði';

  @override
  String get sudoMethodPassword => 'Lykilorð';

  @override
  String get sudoMethodTotp => 'Staðfestingartæki';

  @override
  String get sudoVerificationFailed =>
      'Staðfesting mistókst. Vinsamlegast reyndu aftur.';

  @override
  String get securityAccountTitle => 'Reikningur';

  @override
  String get securityAccountDescription =>
      'Stjórnaðu tölvupósti, lykilorði og reikningsstillingum þínum';

  @override
  String get securitySectionTitle => 'Öryggi';

  @override
  String get securitySectionDescription =>
      'Verndaðu reikninginn þinn með tvíþættri staðfestingu og lyklakortum';

  @override
  String get securityLoginEmailSectionTitle => 'Tölvupóststillingar';

  @override
  String get securityLoginEmailSectionDescription =>
      'Stjórnaðu tölvupóstfanginu sem þú notar til að skrá þig inn á Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Tölvupóstfang';

  @override
  String get securityLoginNoEmailSet => 'Ekkert tölvupóstfang stillt';

  @override
  String get securityLoginChangeEmail => 'Breyta tölvupósti';

  @override
  String get securityLoginAddEmail => 'Bæta við tölvupósti';

  @override
  String get securityLoginReveal => 'Sýna';

  @override
  String get securityLoginHide => 'Fela';

  @override
  String get securityLoginPasswordSectionTitle => 'Lykilorð';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Breyttu lykilorðinu þínu til að halda reikningnum þínum öruggum';

  @override
  String get securityLoginCurrentPasswordLabel => 'Núverandi lykilorð';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Síðast breytt: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Síðast breytt: Aldrei';

  @override
  String get securityLoginNoPasswordSet => 'Ekkert lykilorð stillt';

  @override
  String get securityLoginChangePassword => 'Breyta lykilorði';

  @override
  String get securityLoginSetPassword => 'Setja lykilorð';

  @override
  String get passwordChangeTitle => 'Breyta lykilorði';

  @override
  String get passwordChangeIntroDescription =>
      'Við munum senda staðfestingarkóða á tölvupóstfangið þitt til að staðfesta auðkenni þitt áður en þú breytir lykilorðinu þínu.';

  @override
  String get passwordChangeStart => 'Byrja';

  @override
  String get passwordChangeVerifyTitle => 'Staðfestu tölvupóstinn þinn';

  @override
  String get passwordChangeVerifyDescription =>
      'Sláðu inn staðfestingarkóðann sem sendur var á tölvupóstfangið þitt.';

  @override
  String get passwordChangeVerificationCode => 'Staðfestingarkóði';

  @override
  String get passwordChangeVerify => 'Staðfesta';

  @override
  String get passwordChangeNewPasswordTitle => 'Setja nýtt lykilorð';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Sláðu inn nýja lykilorðið þitt hér að neðan.';

  @override
  String get passwordChangeNewPassword => 'Nýtt lykilorð';

  @override
  String get passwordChangeConfirmPassword => 'Staðfesta nýtt lykilorð';

  @override
  String get passwordChangeSubmit => 'Breyta lykilorði';

  @override
  String get passwordChangeSuccess => 'Lykilorð breytt';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Lykilorð passa ekki';

  @override
  String get passwordChangeInvalidCode => 'Ógildur eða útrunninn kóði';

  @override
  String get emailChangeTitle => 'Breyta netfangi';

  @override
  String get emailChangeIntroDescription =>
      'Við sendum staðfestingarkóða til að sannreyna auðkenni þitt áður en netfanginu er breytt.';

  @override
  String get emailChangeStart => 'Hefja';

  @override
  String get emailChangeVerifyOriginalTitle => 'Staðfesta núverandi netfang';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Sláðu inn staðfestingarkóðann sem sendur var á núverandi netfang þitt.';

  @override
  String get emailChangeNewEmailTitle => 'Sláðu inn nýtt netfang';

  @override
  String get emailChangeNewEmailDescription =>
      'Sláðu inn nýja netfangið sem þú vilt nota.';

  @override
  String get emailChangeNewEmailLabel => 'Nýtt netfang';

  @override
  String get emailChangeNewEmailSubmit => 'Senda staðfestingarkóða';

  @override
  String get emailChangeVerifyNewTitle => 'Staðfesta nýtt netfang';

  @override
  String get emailChangeVerifyNewDescription =>
      'Sláðu inn staðfestingarkóðann sem sendur var á nýja netfangið þitt.';

  @override
  String get emailChangeSuccess => 'Netfangi breytt';

  @override
  String get emailChangeInvalidCode => 'Ógildur eða útrunninn kóði';

  @override
  String get resend => 'Sendu aftur';

  @override
  String resendCountdown(int seconds) {
    return 'Sendu aftur (${seconds}s)';
  }

  @override
  String get verificationCode => 'Staðfestingarkóði';

  @override
  String get verify => 'Staðfesta';

  @override
  String get enable => 'Virkja';

  @override
  String get disable => 'Afvirkja';

  @override
  String get delete => 'Eyða';

  @override
  String get save => 'Vista';

  @override
  String get securityTfaSectionTitle => 'Tveggja þátta auðkenning';

  @override
  String get securityTfaSectionDescription =>
      'Bættu við auka öryggislagi við reikninginn þinn';

  @override
  String get securityTfaAuthenticatorApp => 'Auðkenningarforrit';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Tveggja þátta auðkenning er virk';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Notaðu auðkenningarforrit til að búa til kóða fyrir tveggja þátta auðkenningu';

  @override
  String get securityTfaBackupCodes => 'Afritunarkóðar';

  @override
  String get securityTfaBackupCodesDescription =>
      'Skoðaðu og stjórnaðu afritunarkóðum þínum til endurheimtar reiknings';

  @override
  String get securityTfaViewCodes => 'Skoða kóða';

  @override
  String get securityPasskeysSectionTitle => 'Lykilorð';

  @override
  String get securityPasskeysSectionDescription =>
      'Notaðu lykilorð fyrir innskráningu án lykilorðs og tveggja þátta auðkenningu';

  @override
  String get securityPasskeysRegistered => 'Skráð lykilorð';

  @override
  String get securityPasskeysNone => 'Engin lykilorð skráð';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'lykilorð',
      one: 'lykilorð',
    );
    return '$count $_temp0 skráð (hámark 10)';
  }

  @override
  String get securityPasskeysAdd => 'Bæta við lykilorði';

  @override
  String securityPasskeysAdded(String date) {
    return 'Bætt við: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Síðast notað: $date';
  }

  @override
  String get securityPasskeysRename => 'Endurnefna';

  @override
  String get securityPasskeysDeleteTitle => 'Eyða lykilorði';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Ertu viss um að þú viljir eyða lykilorðinu \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Nefna lykilorð';

  @override
  String get securityPasskeyNameLabel => 'Nafn lykilorðs';

  @override
  String get securityPasskeyNameHint => 't.d. YubiKey, iPhone, Vinnutölva';

  @override
  String get securityPhoneSectionTitle => 'Símanúmer';

  @override
  String get securityPhoneSectionDescription => 'Stjórna símanúmerinu þínu.';

  @override
  String get securityPhoneLabel => 'Símanúmer';

  @override
  String get securityPhoneNone => 'Engu símanúmeri bætt við.';

  @override
  String get securityPhoneAdd => 'Bæta við síma';

  @override
  String get securityPhoneRemove => 'Fjarlægja';

  @override
  String get securityPhoneRemoveTitle => 'Fjarlægja símanúmer';

  @override
  String get securityPhoneRemoveDescription =>
      'Ertu viss um að þú viljir fjarlægja símanúmerið þitt?';

  @override
  String get securityPhoneRemoved => 'Símanúmeri hefur verið eytt';

  @override
  String get securityClaimTitle => 'Öryggisaðgerðir';

  @override
  String get securityClaimDescription =>
      'Krefstu reikningsins þíns til að fá aðgang að öryggisaðgerðum eins og tvíþættri auðkenningu og lyklum.';

  @override
  String get securityVerifyEmailRequired =>
      'Þú verður að staðfesta netfangið þitt áður en þú getur sett upp tvíþætta auðkenningu, lykla eða SMS-staðfestingu.';

  @override
  String get totpEnableTitle => 'Setja upp auðkenningarforrit';

  @override
  String get totpEnableDescription =>
      'Skannaðu QR kóðann með auðkenningarforritinu þínu til að búa til kóða fyrir tvíþætta auðkenningu.';

  @override
  String get totpEnableCodeLabel => 'Kóði';

  @override
  String get totpEnableCodeHint =>
      'Sláðu inn 6 stafa kóðann úr auðkenningarforritinu þínu';

  @override
  String get totpEnableSuccess => 'Tvíþætt auðkenning hefur verið virkjuð';

  @override
  String get totpDisableTitle => 'Fjarlægja auðkenningarforrit';

  @override
  String get totpDisableDescription =>
      'Sláðu inn 6 stafa kóðann úr auðkenningarforritinu þínu til að afvirkja tvíþætta auðkenningu.';

  @override
  String get totpDisableSuccess =>
      'Tvíþættri auðkenningu hefur verið afvirkjuð';

  @override
  String get backupCodesTitle => 'Afritunarkóðar';

  @override
  String get backupCodesWarning =>
      'Ef þú missir aðgang að auðkenningarforritinu þínu og hefur ekki þessa kóða, verður þú varanlega útilokaður frá reikningnum þínum. Hladdu niður eða afritaðu þá núna og geymdu þá á öruggum stað.';

  @override
  String get backupCodesDownload => 'Hlaða niður';

  @override
  String get backupCodesCopy => 'Afrita';

  @override
  String get backupCodesCopied => 'Afritunarkóðar afritaðir á klemmuspjaldið';

  @override
  String get backupCodesAcknowledge =>
      'Ég hef hlaðið niður eða afritað afritunarkóðana mína og geymt þá á öruggum stað.';

  @override
  String get backupCodesDone => 'Lokið';

  @override
  String get backupCodesViewTitle => 'Skoða afritunarkóða';

  @override
  String get backupCodesViewDescription =>
      'Staðfesting gæti verið nauðsynleg áður en afritunarkóðar eru skoðaðir.';

  @override
  String get phoneAddTitle => 'Bæta við símanúmeri';

  @override
  String get phoneAddLabel => 'Símanúmer';

  @override
  String get phoneAddHint => 'Sláðu inn símanúmerið þitt';

  @override
  String get phoneAddFooter =>
      'Sláðu inn símanúmerið þitt. Við sendum þér staðfestingarkóða með SMS.';

  @override
  String get phoneAddSendCode => 'Senda kóða';

  @override
  String get phoneVerifyTitle => 'Staðfesta símanúmer';

  @override
  String get phoneVerifyDescription =>
      'Sláðu inn staðfestingarkóðann sem sendur var á símanúmerið þitt.';

  @override
  String get phoneAddSuccess => 'Símanúmeri hefur verið bætt við';

  @override
  String get dangerZoneSectionTitle => 'Hættusvæði';

  @override
  String get dangerZoneSectionDescription =>
      'Óafturkræfar og eyðileggjandi aðgerðir';

  @override
  String get dangerZoneDisableTitle => 'Afvirkja reikning';

  @override
  String get dangerZoneDisableDescription =>
      'Afvirkja reikninginn þinn tímabundið. Þú getur endurvirkjað hann síðar með því að skrá þig aftur inn.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Afvirkjun reikningsins þíns mun skrá þig út úr öllum lotum. Þú getur endurvirkjað reikninginn þinn hvenær sem er með því að skrá þig inn aftur.';

  @override
  String get dangerZoneDeleteTitle => 'Eyða reikning';

  @override
  String get dangerZoneDeleteDescription =>
      'Eyða reikningnum þínum og öllum tengdum gögnum varanlega. Þessari aðgerð verður ekki hægt að snúa við.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Afskrá virka Plutonium áskrift þína í Plutonium stillingum áður en þú eyðir reikningnum þínum.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Ekki er hægt að eyða reikningi';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Þú getur ekki eytt reikningnum þínum á meðan þú átt samfélög. Flyttu eignarhald á eftirfarandi samfélögum fyrst:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'og $count fleiri';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Til að flytja eignarhald, farðu á $settingsPath og notaðu valkostinn til að flytja eignarhald.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Ertu viss um að þú viljir eyða reikningnum þínum? Þessi aðgerð mun áætla reikninginn þinn til varanlegrar eyðingar.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Þú getur hætt við eyðingarferlið innan 14 daga';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Eftir 14 daga verður reikningnum þínum eytt varanlega';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Þegar eyðing hefur verið unnin geturðu ekki endurheimt aðgang að reikningnum þínum';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Þú munt ekki geta eytt sendum skilaboðum þínum eftir að reikningnum þínum hefur verið eytt';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Ef þú vilt flytja út gögnin þín eða eyða skilaboðunum þínum fyrst, vinsamlegast farðu á kaflann Persónuverndarstýring í notendastillingum áður en þú heldur áfram.';

  @override
  String get claimAccountTitle => 'Krefjast reikningsins þíns';

  @override
  String get claimAccountDescription =>
      'Krefstu reikningsins þíns með því að bæta við netfangi og lykilorði. Við munum senda staðfestingarkóða til að staðfesta netfangið þitt áður en við klárum.';

  @override
  String get claimAccountEmailLabel => 'Netfang';

  @override
  String get claimAccountPasswordLabel => 'Lykilorð';

  @override
  String get claimAccountSendCode => 'Senda kóða';

  @override
  String get claimAccountVerifyDescription =>
      'Sláðu inn kóðann sem við sendum á netfangið þitt til að staðfesta það. Lykilorð þitt verður sett þegar kóðinn hefur verið staðfestur.';

  @override
  String get claimAccountSuccess => 'Reikningur tekinn með góðum árangri';

  @override
  String get importantInformation => 'Mikilvægar upplýsingar:';

  @override
  String get genericError => 'Villa kom upp';

  @override
  String get invalidCode => 'Ógildur kóði';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'fyrir $count árum',
      one: 'fyrir 1 ári',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'fyrir $count mánuðum',
      one: 'fyrir 1 mánuði',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'fyrir $count dögum',
      one: 'fyrir 1 degi',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'fyrir $count klukkustundum',
      one: 'fyrir 1 klukkustund',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'fyrir $count mínútum',
      one: 'fyrir 1 mínútu',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'rétt í þessu';

  @override
  String get authorizedAppsTitle => 'Leyfisveitt forrit';

  @override
  String get authorizedAppsDescription =>
      'Þessi forrit hafa fengið aðgang að Fluxer reikningnum þínum.';

  @override
  String get authorizedAppsEmptyTitle => 'Engin leyfisveitt forrit';

  @override
  String get authorizedAppsEmptyDescription =>
      'Þú hefur ekki veitt neinum forritum leyfi til aðgangs að reikningnum þínum.';

  @override
  String get authorizedAppsLoadError =>
      'Tókst ekki að hlaða leyfisveitt forrit';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Leyfi veitt $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Leyfi veitt';

  @override
  String get authorizedAppsRevoke => 'Afturkalla';

  @override
  String get authorizedAppsRevokeTitle => 'Afturkalla aðgang forrits';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Ertu viss um að þú viljir afturkalla aðgang fyrir $appName? Þetta forrit mun ekki lengur hafa aðgang að reikningnum þínum.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Aðgangur að grunnupplýsingum þínar (notandanafn, avatar, o.s.frv.)';

  @override
  String get authorizedAppsScopeEmail => 'Skoða netfang þitt';

  @override
  String get authorizedAppsScopeGuilds =>
      'Skoða samfélög sem þú ert meðlimur í';

  @override
  String get authorizedAppsScopeConnections => 'Skoða tengda reikninga þína';

  @override
  String get authorizedAppsScopeBot =>
      'Bæta við vélmenni í samfélag með beiðni um leyfi';

  @override
  String get authorizedAppsScopeAdmin => 'Aðgangur að stjórnunarviðmótum';

  @override
  String get privacyPendingDeletionTitle => 'Bíður eyðingar';

  @override
  String get blockedUsersTitle => 'Lokaðir notendur';

  @override
  String get blockedUsersDescription =>
      'Lokaðir notendur geta ekki sent þér vinabeiðnir eða skilaboð beint.';

  @override
  String get blockedUsersEmptyTitle => 'Engir lokaðir notendur';

  @override
  String get blockedUsersEmptyDescription =>
      'Þú hefur ekki lokað neinum ennþá.';

  @override
  String get blockedUsersLoadError => 'Tókst ekki að hlaða lokaða notendur';

  @override
  String get blockedUsersUnblock => 'Afnema blokkun';

  @override
  String get blockedUsersUnblockTitle => 'Afnema blokkun notanda';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Ertu viss um að þú viljir afnema blokkun á $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Afrita FluxerTag';

  @override
  String get blockedUsersCopyId => 'Afrita notendanafn';

  @override
  String get userProfileLoadError => 'Tókst ekki að hlaða prófíl';

  @override
  String get userProfileRetry => 'Reyna aftur';

  @override
  String get userProfileMessage => 'Skilaboð';

  @override
  String get userProfileVoiceCall => 'Raddsímtal';

  @override
  String get userProfileVideoCall => 'Myndsímtal';

  @override
  String get userProfileEditProfile => 'Breyta prófíl';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer starfsfólk';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer samfélagsteymi';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer samstarfsaðili';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium áskrifandi síðan $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary síðan $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Sameiginlegir vinir ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Sameiginleg samfélög ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Sameiginlegir vinir';

  @override
  String get userProfileMutualCommunitiesTitle => 'Sameiginleg samfélög';

  @override
  String get userProfileNoMutualFriends => 'Engir sameiginlegir vinir fundust.';

  @override
  String get userProfileNoMutualCommunities =>
      'Engin sameiginleg samfélög fundust.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Notendanafn: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Opna skilaboð';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Þú blokkkaðir $username. Þú munt ekki geta sent skilaboð nema þú aflokkir þeim.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Aflokka';

  @override
  String get userProfileOpenDm => 'Opna skilaboð';

  @override
  String get userProfileNoteTitle => 'Athugasemd';

  @override
  String get userProfileNoteVisibility => '(aðeins sýnilegt þér)';

  @override
  String get userProfileNoteSave => 'Vista';

  @override
  String get userProfileNoteDelete => 'Eyða';

  @override
  String get userProfileNoteEmpty => 'Smelltu til að bæta við athugasemd';

  @override
  String get userProfileMemberSince => 'Meðlimur síðan';

  @override
  String get userProfileAboutMe => 'Um mig';

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
  String get userProfileCopyUsername => 'Afrita notendanafn';

  @override
  String get userProfileCopyUserId => 'Afrita notendatölvupóst';

  @override
  String get userProfileViewMainProfile => 'Skoða aðalprófíl';

  @override
  String get userProfileViewCommunityProfile => 'Skoða samfélagssnið';

  @override
  String get userProfileBlockUser => 'Loka fyrir notanda';

  @override
  String get userProfileUnblockUser => 'Aflokka notanda';

  @override
  String get userProfileRemoveFriend => 'Fjarlægja vin';

  @override
  String get userProfileBlockConfirmTitle => 'Loka fyrir notanda';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Ertu viss um að þú viljir loka fyrir $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Aflokka notanda';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Ertu viss um að þú viljir aflokka $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Fjarlægja vin';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Ertu viss um að þú viljir fjarlægja $username sem vin?';
  }

  @override
  String get userProfileFailedOpenDm => 'Tókst ekki að opna skilaboð';

  @override
  String get userProfileFailedSaveNote => 'Tókst ekki að vista athugasemd';

  @override
  String get userProfileActionFailed =>
      'Aðgerð mistókst, vinsamlegast reyndu aftur';

  @override
  String get userProfileChangeNickname => 'Breyta notendanafni';

  @override
  String get userProfileKick => 'Rekja út';

  @override
  String get userProfileBan => 'Banna';

  @override
  String get userProfileTimeout => 'Tímabundinn banni';

  @override
  String get userProfileRemoveTimeout => 'Fjarlægja tímabundinn banni';

  @override
  String get userProfileTransferOwnership => 'Flytja eignarhald';

  @override
  String get userProfileReportUser => 'Tilkynt um notanda';

  @override
  String get userProfileReportMessage => 'Tilkynt um skilaboð';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Rekja út $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Ertu viss um að þú viljir reka út $username? Hann/hún getur komið aftur með nýju boði.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Fjarlægja tímabann?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Með því að fjarlægja tímabannið mun $username geta sent skilaboð, brugðist við og tekið þátt í raddrásir aftur.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Flytja eignarhald?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Flytja eignarhald þessa samfélags til $username? Þetta er óafturkræft og þú munt missa öll eigendaréttindi.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Banna $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Bannlengd';

  @override
  String get userProfileBanCustomSecondsLabel => 'Sérsniðin lengd (sekúndur)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Gildi frá $min til $max sekúndur';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Eyða skilaboðasögu';

  @override
  String get userProfileBanDeleteNone => 'Ekki eyða neinu';

  @override
  String get userProfileBanDelete24h => 'Síðastliðnar 24 klukkustundir';

  @override
  String get userProfileBanDelete7d => 'Síðastliðnir 7 dagar';

  @override
  String get userProfileBanReasonLabel => 'Ástæða (valfrjálst)';

  @override
  String get userProfileBanReasonHint => 'Sláðu inn ástæðu fyrir banninu';

  @override
  String get userProfileBanSubmit => 'Banna meðlim';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Tímabann á $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Tímabannslengd';

  @override
  String get userProfileTimeoutSubmit => 'Tímabanna meðlim';

  @override
  String get userProfileNicknameLabel => 'Nafn';

  @override
  String get userProfileNicknameHint => 'Sláðu inn annað nafn';

  @override
  String get userProfileNicknameSave => 'Vista';

  @override
  String userProfileKickSuccess(String username) {
    return 'Rekinn $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Bannaður $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Tímabannaður $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Fjarlægði tímabann fyrir $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Nafni breytt';

  @override
  String get userProfileTransferSuccess => 'Eignarhaldi flutt';

  @override
  String get durationPermanent => 'Varandi';

  @override
  String get duration60Seconds => '60 sekúndur';

  @override
  String get duration5Minutes => '5 mínútur';

  @override
  String get duration10Minutes => '10 mínútur';

  @override
  String get duration1Hour => '1 klukkustund';

  @override
  String get duration12Hours => '12 klukkustundir';

  @override
  String get duration1Day => '1 dagur';

  @override
  String get duration3Days => '3 dagar';

  @override
  String get duration5Days => '5 dagar';

  @override
  String get duration1Week => '1 vika';

  @override
  String get duration2Weeks => '2 vikur';

  @override
  String get duration1Month => '1 mánuður';

  @override
  String get durationCustom => 'Sérsniðið…';

  @override
  String get iarReportUserTitle => 'Tilkyna notanda';

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
  String get iarReasonInappropriateProfile => 'Óviðeigandi prófíll';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Þessi prófíll er óviðeigandi';

  @override
  String typingIndicatorOne(String name) {
    return '$name er að skrifa...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 og $name2 eru að skrifa...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 og $name3 eru að skrifa...';
  }

  @override
  String get typingIndicatorMultiple => 'Nokkrir eru að skrifa...';

  @override
  String get typingIndicatorHandful =>
      'Hópur af lyklaborðshetjum er að koma saman...';

  @override
  String get typingIndicatorSymphony =>
      'Hljómsveit af smellandi lyklum er í gangi...';

  @override
  String get typingIndicatorFiesta => 'Þetta er fullskorin skrifveiska hérna';

  @override
  String get typingIndicatorApocalypse => 'Vá, þetta er ritapókalýpsa';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Gaman að sjá þig, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Velkomin(n), $username! Láttu eins og heima hjá þér.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Halló, $username! Gaman að hafa þig hér.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Halló, $username! Vertu með þegar þú ert tilbúin(n).';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hæ $username, gaman að sjá þig hér!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hæ þú, $username! Vonandi nýturðu dvalarinnar.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hæ, $username, velkomin(n) um borð!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Gaman að þú gast komið, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Velkomin(n) inn, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Velkomin(n), $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Velkomin(n), $username! Við erum ánægð(ir) með að hafa þig hér.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Velkomin(n), $username! Vonandi nýturðu tímans hér.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Velkomin(n), $username! Næsta samtal þitt byrjar hér.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Velkomin(n), $username. Við erum ánægð(ir) með að hafa þig hér.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Gaman að sjá þig, $username! Velkomin(n) inn.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Þú ert komin(n), $username! Gaman að hafa þig með okkur.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Þú ert komin(n), $username! Byrjum.';
  }

  @override
  String get relativeTimeShortNow => 'núna';

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
      other: '$count klst',
      one: '1 klst',
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
      other: '$count mán',
      one: '1 mán',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count árs',
      one: '1 árs',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Tækin mín';

  @override
  String get linkedDevicesDescription =>
      'Skoðaðu öll tæki sem eru skráð inn á reikninginn þinn. Afturkallaðu allar lotur sem þú þekkir ekki.';

  @override
  String get linkedDevicesCurrentDevice => 'Núverandi tæki';

  @override
  String get linkedDevicesOtherDevices => 'Önnur tæki';

  @override
  String get linkedDevicesEnterSelection => 'Sláðu inn valham';

  @override
  String get linkedDevicesExitSelection => 'Hætta í valham';

  @override
  String get linkedDevicesSelectAll => 'Velja allt';

  @override
  String get linkedDevicesClearSelection => 'Hreinsa val';

  @override
  String get linkedDevicesRevokeTooltip => 'Afturkalla tæki';

  @override
  String get linkedDevicesSignOutAll => 'Skrá út öll önnur tæki';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skrá út $count tæki',
      one: 'Skrá út 1 tæki',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Skrá út $count tæki',
      one: 'Skrá út 1 tæki',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Skrá út öll önnur tæki';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Þetta mun skrá valin tæki út af reikningnum þínum. Þú þarft að skrá þig inn aftur á þeim tækjum.',
      one:
          'Þetta mun skrá valið tæki út af reikningnum þínum. Þú þarft að skrá þig inn aftur á því tæki.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Þetta mun skrá valin tæki út af reikningnum þínum. Þú þarft að skrá þig inn aftur á þeim tækjum.';

  @override
  String get linkedDevicesSignOutConfirm => 'Halda áfram';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Þú þarft að skrá þig aftur inn á öll útskráð tæki';

  @override
  String get linkedDevicesLoadErrorTitle => 'Netvilla';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Við eigum í erfiðleikum með að tengjast tíma-rumheimum. Vinsamlegast athugaðu tenginguna þína og reyndu aftur.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tæki afturkalluð',
      one: 'Tæki afturkallað',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Ekki tókst að skrá út. Reyndu aftur.';

  @override
  String get linkedDevicesUnknownOs => 'Óþekkt stýrikerfi';

  @override
  String get linkedDevicesUnknownPlatform => 'Óþekkt vettvangur';

  @override
  String slowmodeLabel(String duration) {
    return '$duration hægviðr';
  }

  @override
  String get slowmodeTooltipActive =>
      'Þú ert í hægviðri. Vinsamlegast bíddu áður en þú sendir aðra skilaboð.';

  @override
  String get slowmodeTooltipImmune => 'Hægviðr er virkt, en þú ert ónæm(ur).';

  @override
  String get channelNoSendPermissionHint =>
      'Þú getur ekki sent skilaboð í þessari rás.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Kerfisviðvaranir frá starfsfólki $productName. Þú getur ekki svarað hér.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Skilaboðum er frestað tímabundið í þessu samfélagi.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Þú ert með tímabundna útilokun. Skilaboðum, viðbrögðum og tali er frestað þar til útilokunin rennur út.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Þú þarft að gera tilkall til reikningsins þíns til að senda skilaboð í þessu samfélagi.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Þú þarft að staðfesta netfangið þitt til að senda skilaboð í þessu samfélagi.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Reikningurinn þinn er of nýr til að senda skilaboð í þessu samfélagi.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Þú hefur ekki verið meðlimur í þessu samfélagi nógu lengi til að senda skilaboð.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Þú þarft að staðfesta símanúmer til að senda skilaboð í þessu samfélagi.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Staðfesta netfang';

  @override
  String get channelComposerBarrierVerifyPhone => 'Staðfesta síma';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Of mörg viðhengi (hámark $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Einn eða fleiri skrár fara yfir stærðarmörkin';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Þessar skrár eru of stórar til að senda saman';

  @override
  String get chatAttachmentDropToUpload => 'Slepptu skrám til að hlaða upp';

  @override
  String get chatAttachmentDropToSend => 'Slepptu skrám til að senda núna';

  @override
  String get chatAttachmentSendVoiceMessage => 'Senda raddskilaboð';

  @override
  String get voiceMessageTitle => 'Raddskilaboð';

  @override
  String get voiceMessageHoldHint =>
      'Haltu til að taka upp. Dragðu upp til að læsa, eða slepptu til að senda.';

  @override
  String get voiceMessageDiscard => 'Fleygja raddskilaboðum';

  @override
  String get voiceMessageSend => 'Senda raddskilaboð';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Ekki er hægt að hefja upptöku. Leyfðu aðgang að hljóðnemanum.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Raddupptaka er ekki studd á þessu tæki.';

  @override
  String get voiceMessageMicInUse =>
      'Hættu í raddfundi til að taka upp raddskilaboð.';

  @override
  String get voiceMessageRecordingFailed => 'Upptaka mistókst. Reyndu aftur.';

  @override
  String get voiceMessageSendFailed =>
      'Ekki er hægt að senda raddskilaboð. Reyndu aftur.';

  @override
  String get voiceMessageRecordingHint =>
      'Talaðu núna. Ýttu á Hætta þegar þú ert búinn — þú getur snyrt síðar.';

  @override
  String get voiceMessageReviewHint =>
      'Dragðu handföngin til að snyrta, ýttu síðan á Senda.';

  @override
  String get voiceMessageStop => 'Hætta';

  @override
  String get voiceMessageStartRecording => 'Hefja upptöku';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Spila';

  @override
  String get voiceMessagePause => 'Hlé';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Val þarf að vera að minnsta kosti ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Breyta viðhengi';

  @override
  String get chatAttachmentFilenameLabel => 'Skráarnafn';

  @override
  String get chatAttachmentDescriptionLabel => 'Lýsing';

  @override
  String get chatAttachmentDescriptionHint => 'Valfrjáls alt texti';

  @override
  String get chatAttachmentSpoilerLabel => 'Merkja sem spoiler';

  @override
  String get chatAttachmentRemove => 'Fjarlægja viðhengi';

  @override
  String get chatAttachmentDownload => 'Hlaða niður';

  @override
  String get chatAttachmentExpiredTooltip => 'Viðhengi útrunnið';

  @override
  String get chatAttachmentSourceGallery => 'Myndasafn';

  @override
  String get chatAttachmentSourceCamera => 'Myndavél';

  @override
  String get chatAttachmentSourceBrowse => 'Vafra um skrár';

  @override
  String get chatAttachmentPasteTooltip => 'Líma mynd úr klemmuspjaldi';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Afhjúpa spoiler';

  @override
  String get matureMediaRevealButton => 'Afhjúpa';

  @override
  String get matureMediaRevealHint => 'Smelltu til að afhjúpa';

  @override
  String get matureContentTitle => 'Þroskað efni';

  @override
  String get matureCommunityTitle => 'Samfélag fyrir fullorðna';

  @override
  String get matureCategoryTitle => 'Flokkur fyrir fullorðna';

  @override
  String get matureChannelTitle => 'Rás fyrir fullorðna';

  @override
  String get communityContentWarningTitle => 'Viðvörun um efni samfélags';

  @override
  String get categoryContentWarningTitle => 'Viðvörun um efni flokks';

  @override
  String get channelContentWarningTitle => 'Viðvörun um efni rásar';

  @override
  String get defaultContentWarningBody => 'Þetta inniheldur viðkvæmt efni.';

  @override
  String get matureCommunityBody =>
      'Þetta samfélag er merkt fyrir efni fyrir fullorðna og gæti innihaldið efni sem gæti verið óviðeigandi fyrir suma notendur.';

  @override
  String get matureCategoryBody =>
      'Þessi flokkur er merktur fyrir efni fyrir fullorðna og gæti innihaldið efni sem gæti verið óviðeigandi fyrir suma notendur.';

  @override
  String get matureChannelBody =>
      'Þessi rás er merkt fyrir efni fyrir fullorðna og gæti innihaldið efni sem gæti verið óviðeigandi fyrir suma notendur.';

  @override
  String get matureVoiceChannelBody =>
      'Þessi röstás er merkt fyrir efni fyrir fullorðna og gæti innihaldið efni sem gæti verið óviðeigandi fyrir suma notendur.';

  @override
  String get matureLinkChannelBody =>
      'Þessi tenglarás er merkt fyrir efni fyrir fullorðna og gæti opnað efni sem gæti verið óviðeigandi fyrir suma notendur.';

  @override
  String get matureCommunityUnavailableBody =>
      'Þetta samfélag fyrir fullorðna er ekki tiltækt fyrir reikninginn þinn.';

  @override
  String get matureCategoryUnavailableBody =>
      'Þessi flokkur fyrir fullorðna er ekki tiltækur fyrir reikninginn þinn.';

  @override
  String get matureChannelUnavailableBody =>
      'Þessi rás fyrir fullorðna er ekki tiltæk fyrir reikninginn þinn.';

  @override
  String get matureContentProceedButton => 'Halda áfram';

  @override
  String get matureContentUnderstandButton => 'Ég skil';

  @override
  String get matureContentOpenLinkButton => 'Opna tengil';

  @override
  String get sensitiveContentSectionTitle => 'Viðkvæmt efni';

  @override
  String get sensitiveContentSectionDescription =>
      'Stjórnaðu hvernig efni fyrir fullorðna eða viðkvæmt efni er síað í mismunandi samhengi';

  @override
  String get sensitiveContentFriendDmLabel => 'Einkaskilaboð frá vinum';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Einkaskilaboð frá öðrum';

  @override
  String get sensitiveContentGuildLabel => 'Skilaboð í samfélagsrásum';

  @override
  String get sensitiveContentFilterShow => 'Sýna';

  @override
  String get sensitiveContentFilterBlur => 'Þoka';

  @override
  String get sensitiveContentFilterBlock => 'Loka';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Þoka miðla þar til öryggisskönnun lýkur';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Þegar þetta er virkt eru myndir og myndskeið þokuð þar til öryggisskönnun efnis lýkur.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Þessi stilling er alltaf virk fyrir reikninginn þinn.';

  @override
  String get sensitiveContentResetButton => 'Endurstilla';

  @override
  String get sensitiveContentSaveButton => 'Vista';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count skrám',
      one: '1 skrá',
    );
    return 'Hleður upp $_temp0';
  }

  @override
  String get chatCancelUpload => 'Hætta við hleðslu';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Rennur út $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Rennur út milli $start og $end';
  }

  @override
  String get connectionsTitle => 'Tengingar';

  @override
  String get connectionsDescription =>
      'Tengdu ytri reikninga og lén við Fluxer prófílinn þinn. Staðfestar tengingar verða sýndar á prófílnum þínum svo aðrir sjái.';

  @override
  String get connectionsEmptyTitle => 'Engar tengingar ennþá';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Tengdu Bluesky reikninginn þinn eða staðfestu lénseign til að sýna þau á prófílnum þínum.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Staðfestu lénseign til að sýna hana á prófílnum þínum.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Lén';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Bæta við Bluesky tengingu';

  @override
  String get connectionsAddDomainAriaLabel => 'Bæta við lénstengingu';

  @override
  String get connectionEdit => 'Breyta';

  @override
  String get connectionRemove => 'Fjarlægja';

  @override
  String get connectionVerifiedLabel => 'Þessi tenging hefur verið staðfest.';

  @override
  String get connectionUnverifiedLabel =>
      'Þessi tenging hefur ekki verið staðfest.';

  @override
  String get connectionAddTitle => 'Bæta við tengingu';

  @override
  String get connectionTypeLabel => 'Tegund tengingar';

  @override
  String get connectionHandleLabel => 'Handfang';

  @override
  String get connectionDomainLabel => 'Lén';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Þú ert nú þegar með þessa tengingu.';

  @override
  String get connectionConnectBluesky => 'Tengjast með Bluesky';

  @override
  String get connectionContinue => 'Halda áfram';

  @override
  String get connectionVerifyTitle => 'Staðfesta tengingu';

  @override
  String get connectionVerifyInstructions =>
      'Notaðu skrána hér að neðan til að sanna eignarhald á léninu.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT skrá';

  @override
  String get connectionDnsHostLabel => 'Hýsingur';

  @override
  String get connectionDnsValueLabel => 'Gildi';

  @override
  String get connectionCopyHost => 'Afrita hýsing';

  @override
  String get connectionCopyValue => 'Afrita gildi';

  @override
  String get connectionCopied => 'Afritað!';

  @override
  String get connectionTokenFileTitle => 'Gefa út token skrána';

  @override
  String get connectionTokenFileDescription =>
      'Hladdu niður **fluxer-verification** og settu hana í **.well-known** möppuna þína svo við getum sannreynt lénið.';

  @override
  String get connectionTokenFileDownload => 'Hlaða niður fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Skráin inniheldur staðfestingar token sem við munum sækja frá **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Vista fluxer-verification';

  @override
  String get connectionVerifyButton => 'Staðfesta';

  @override
  String get connectionBack => 'Til baka';

  @override
  String get connectionEditTitle => 'Breyta tengingu';

  @override
  String get connectionEditDescription =>
      'Veldu hver getur séð þessa tengingu á prófílnum þínum.';

  @override
  String get connectionVisibilityEveryone => 'Allir';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Leyfa öllum að sjá þessa tengingu á prófílnum þínum';

  @override
  String get connectionVisibilityFriends => 'Vinir';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Leyfa vinum þínum að sjá þessa tengingu';

  @override
  String get connectionVisibilityCommunityMembers => 'Samfélagsmeðlimir';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Leyfa meðlimum úr samfélögum sem þú ert í að sjá þessa tengingu';

  @override
  String get connectionRemoveTitle => 'Fjarlægja tengingu';

  @override
  String get connectionRemoveDescription =>
      'Ertu viss um að þú viljir fjarlægja þessa tengingu? Þessari aðgerð verður ekki hægt að snúa við.';

  @override
  String get connectionRemoveConfirm => 'Fjarlægja';

  @override
  String get connectionsLoadError => 'Tókst ekki að hlaða tengingar';

  @override
  String get connectionsReorderError => 'Tókst ekki að uppfæra röðun';

  @override
  String get connectionInitiateFailed =>
      'Gat ekki hafið staðfestingu. Reyndu aftur.';

  @override
  String get connectionVerifyFailed =>
      'Gat ekki staðfest. Athugaðu DNS skrána þína og reyndu aftur.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Gat ekki hafið Bluesky heimild.';

  @override
  String get connectionUpdateFailed => 'Gat ekki uppfært tengingu';

  @override
  String get connectionRemoveFailed => 'Gat ekki fjarlægt tengingu';

  @override
  String get connectionTokenSavedToast => 'Vistað fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Gat ekki vistað skrá';

  @override
  String get connectionEnterHandle => 'Sláðu inn Bluesky handfang.';

  @override
  String get connectionEnterDomain => 'Sláðu inn lén.';

  @override
  String get lookAndFeelTitle => 'Útlit og áferð';

  @override
  String get lookAndFeelThemeSectionTitle => 'Þema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Veldu á milli dökkrar, kolsvartrar eða ljósrar útfærslu.';

  @override
  String get lookAndFeelThemeDark => 'Dökkt þema';

  @override
  String get lookAndFeelThemeCoal => 'Kolþema';

  @override
  String get lookAndFeelThemeLight => 'Ljóst þema';

  @override
  String get lookAndFeelThemeSystem => 'Kerfisþema';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Samstilla þema á milli tækja';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Þegar þetta er virkt mun þema breytingar samstillast við öll tækin þín. Þegar þessu er óvirkt mun þetta tæki nota sitt eigið þema stillingu.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Kerfisþema óvirkir samstillingu sjálfkrafa til að fylgjast með óskum kerfisins þíns í þessu tæki.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Gat ekki samstillt þema við reikninginn þinn. Vinsamlegast reyndu aftur.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Skalastærð spjallleturs';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Stilltu leturstærðina á spjallasvæðinu.';

  @override
  String get lookAndFeelInterfaceTitle => 'Viðmót';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Sérsníða viðmótaþætti og hegðun.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Vísbendingar um aðgerðir í rásalista';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Veldu hvernig aðgerðavísbendingar birtast í rásalistanum þegar einhver er að skrifa í rás.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Aðgerðavísir + Avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Sýna aðgerðavísir með notendaavatörum í rásalistanum';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'Aðeins aðgerðavísir';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Sýna aðeins aðgerðavísinn án avatara';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Falið';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ekki sýna aðgerðavísbendingar í rásalistanum';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Sýna aðgerðir í völdu rás';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Þegar óvirkt (sjálfgefið) birtast aðgerðavísbendingar ekki í rásinni sem þú ert að skoða.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'almennt';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Vísbendingar um lyklaborð';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Stjórna hvort vísbendingar um flýtivísbendingar birtist í verkfæraskýringum.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Fela vísbendingar um lyklaborð í verkfæraskýringum';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Þegar þetta er virkt eru flýtivísbendingar faldir í sprettigluggaverkfærum.';

  @override
  String get lookAndFeelNekoTitle => 'Ýmislegt';

  @override
  String get lookAndFeelNekoDescription => 'Ýmis viðmótavalkostir.';

  @override
  String get lookAndFeelShowNekoLabel => 'Sýna Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Þegar þetta er virkt birtist Neko nálægt spjallinnsláttarstikunni.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Aðgerð við að tengjast raddrás';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Stjórna hvernig þú tengist raddrásum í samfélögum.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Krefjast tvísmells til að tengjast raddrásum';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Þegar þetta er virkt þarftu að tvísmella á raddrásir til að tengjast þeim. Þegar þessu er óvirkt (sjálfgefið) mun smella tengjast rásinni strax.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Hinn kjarni málsins er sá að það er ekki hægt að segja til um það.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Hliðarstika samfélags';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Sérsníða hvernig hliðarstika samfélagsins sýnir bein skilaboð.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count samfélög eru tímabundið óaðgengileg vegna bilunar í flúskapsúlu.',
      one: '1 samfélag er tímabundið óaðgengilegt vegna bilunar í flúskapsúlu.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Fella saman bein skilaboð í möppu';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Þegar þetta er virkt eru ólesin bein skilaboð í hliðarstiku samfélagsins felld saman í möppu á Fluxer hnappnum. Smelltu á Fluxer hnappinn á meðan þú ert á bein skilaboðasíðunni til að stækka eða fella saman möppuna.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Rásalisti';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Stjórna hegðun ólesinna vísbendinga fyrir þaggaðar rásir í rásalistum.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Sýna ólesna vísbendingu á þögguðum rásum';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Þegar þetta er virkt sýna þaggaðar rásir dofna ólesna vísbendingu til vinstri. Tilkynningar birtast enn óháð þessari stillingu.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Virkt núna';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Stjórna hvernig Virkt núna birtist um forritið.';

  @override
  String get lookAndFeelShowActiveNowLabel => 'Sýna Virkt núna á heimaskjánum';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Sýna Virkt núna á heimaskjánum til að birta vini sem eru virkir í raddvirkni. Þú munt sjá forskoðun, rásar samhengi, hverjir eru þegar þar, og fljótan hátt til að taka þátt.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Vinsamlegast';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Stjórna sýnileika vinsælla atriða um forritið.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Virkja Vinsamlegast';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Þegar þetta er virkt geturðu merkt rásir sem vinsælar og þær birtast í Vinsamlegast hlutanum. Þegar þessu er óvirkt verða allir viðmótshlutir sem tengjast vinsælum atriðum (hnappar, valmyndaratriði) faldir. Vinsamlegast atriðin þín verða varðveitt.';

  @override
  String get favoritesTitle => 'Vinsamlegast';

  @override
  String get favoritesEmptyTitle => 'Engar vinsælar ennþá';

  @override
  String get favoritesEmptyDescription =>
      'Stjörnumerktu rásir úr spjallhausnum til að hafa þær hér.';

  @override
  String get favoritesWelcomeTitle => 'Velkomin(n) í eftirlæti';

  @override
  String get favoritesWelcomeDescription =>
      'Þitt persónulega rými til að fá skjótan aðgang að rásum, DM og hópum sem þú elskar. Ýttu á stjörnuna á hvaða rás sem er til að bæta henni hér við.';

  @override
  String get favoritesWelcomeTip =>
      'Ekki fyrir þig? Slökktu á því hvenær sem er.';

  @override
  String get favoritesDisableButton => 'Slökkva á eftirlæti';

  @override
  String get favoritesAddedToast => 'Bætt við eftirlæti';

  @override
  String get favoritesRemovedToast => 'Fjarlægt úr eftirlæti';

  @override
  String get favoritesHiddenToast => 'Eftirlæti falin';

  @override
  String get favoritesMute => 'Þagga niður í eftirlæti';

  @override
  String get favoritesUnmute => 'Hætta að þagga niður í eftirlæti';

  @override
  String get favoritesHeaderMenu => 'Valmynd eftirlæta';

  @override
  String get favoritesCreateCategory => 'Búa til flokk';

  @override
  String get favoritesCategoryNameLabel => 'Nafn flokks';

  @override
  String get favoritesHideMutedChannels => 'Fela þaggaðar rásir';

  @override
  String get favoritesShowMutedChannels => 'Sýna þaggaðar rásir';

  @override
  String get favoritesSetNickname => 'Setja gælunafn';

  @override
  String get favoritesNicknameLabel => 'Gælunafn';

  @override
  String get favoritesSaveNickname => 'Vista gælunafn';

  @override
  String get favoritesMoveToCategory => 'Færa í flokk';

  @override
  String get favoritesUncategorized => 'Óflokkað';

  @override
  String get favoritesOtherCategory => 'Annað';

  @override
  String get favoritesRemoveFromFavorites => 'Fjarlægja úr eftirlæti';

  @override
  String get favoritesAddToFavorites => 'Bæta við eftirlæti';

  @override
  String get favoritesHideConfirmTitle => 'Fela eftirlæti';

  @override
  String get favoritesHideConfirmDescription =>
      'Þetta mun fela öll tengd notendaviðmótselement fyrir eftirlæti, þar á meðal hnappa og valmyndaratriði. Núverandi eftirlæti þín verða varðveitt og hægt er að virkja þau aftur hvenær sem er undir Stillingar > Ítarlegar > Útlit.';

  @override
  String get favoritesDirectMessageSubtitle => 'Einkaskilaboð';

  @override
  String get messagesMediaDisplayGroupTitle => 'Birting';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Stjórnaðu hvernig skilaboð, miðlar og annað efni birtist.';

  @override
  String get messagesMediaMediaGroupTitle => 'Miðlar';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Sérsníða stillingar fyrir stærð miðla og hnappa.';

  @override
  String get messagesMediaInputGroupTitle => 'Inntak';

  @override
  String get messagesMediaInputGroupDescription =>
      'Sérsníða stillingar fyrir skilaboðainntak.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Hliðarstika';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Stilltu hvernig samfélagshliðarstikan birtist.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Fela þaggaðar rásir sjálfgefið';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Fela sjálfkrafa þaggaðar rásir í hliðarstikunni þegar þú gengur til liðs við ný samfélög';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Fela þaggaðar rásir sjálfgefið?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Ný samfélög sem þú gengur til liðs við munu sjálfkrafa hafa þaggaðar rásir falnar. Viltu einnig beita þessari stillingu á öll núverandi samfélög þín?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Hætta að fela þaggaðar rásir sjálfgefið?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Ný samfélög sem þú gengur til liðs við munu ekki lengur hafa þaggaðar rásir falnar sjálfkrafa. Viltu einnig sýna þaggaðar rásir í öllum núverandi samfélögum þínum?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Nota á öll samfélög';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Sýna í öllum samfélögum';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Aðeins ný samfélög';

  @override
  String get messagesMediaDisplaySectionTitle => 'Birting miðla';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Stjórnaðu hvernig myndir, myndskeið og aðrir miðlar birtast. Allir miðlar eru stærðar og umbreyttir. Mjög stórar skrár sem ekki er hægt að þjappa í forskoðun verða ekki innbyggðar óháð þessum stillingum.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Þegar birt sem tenglar í spjalli';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Þegar hlaðið er upp beint í Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Forskoðun tengla';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Stjórnaðu hvernig veftenglar eru forsniðnir í spjalli';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Sýna innbyggingar og forsnið veftengla';

  @override
  String get messagesMediaReactionsSectionTitle => 'Viðbrögð';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Stilla emoji-viðbrögð við skilaboð';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Sýna emoji-viðbrögð við skilaboð';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoiler efni';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Stjórna hvernig spoiler efni er sýnt';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Sýna spoiler efni';

  @override
  String get messagesMediaSpoilersOnClickName => 'Við smell';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Sýna spoiler efni þegar smellt er á';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'Í rásum sem ég stýri';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Sýna alltaf spoiler efni í rásum þar sem þú hefur leyfi til að „Stjórna skilaboðum“';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Alltaf';

  @override
  String get messagesMediaSpoilersAlwaysDescription => 'Sýna alltaf spoilers';

  @override
  String get messagesMediaSizeSectionTitle => 'Stillingar fyrir miðlunarstærð';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Sérsníða hámarksstærð fyrir innbyggðan og meðfylgjandi miðlun. Minni stærðir nota minna skjápláss, en stærri stærðir sýna meiri smáatriði.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Miðlun frá tenglum (innbyggingar)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Meðfylgjandi skrár';

  @override
  String get messagesMediaSizeCompactName => 'Samfellt (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Minni miðlunarstærð';

  @override
  String get messagesMediaSizeComfortableName => 'Þægilegt (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Stærri miðlunarstærð með meiri smáatriðum';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF hegðun';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Stjórna hvernig GIF eru sett inn í spjall';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Senda GIF sjálfkrafa þegar valið er';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Sjálfvirk útfylling tjáninga (tvípunktur útfylling)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Stjórna hvað birtist í sjálfvirkri útfyllingu tjáninga þegar þú slærð inn tvípunkt. Sérsníða hvaða tillögur birtast til að passa við óskir þínar.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Sýna sjálfgefnar emojis í sjálfvirkri útfyllingu tjáninga';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Sýna sérsniðnar emojis í sjálfvirkri útfyllingu tjáninga';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Sýna límmiða í sjálfvirkri útfyllingu tjáninga';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Sýna vistaða miðlun í sjálfvirkri útfyllingu tjáninga';

  @override
  String get messagesMediaEditingSectionTitle => 'Breyting á skilaboðum';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Stjórna því sem gerist með drög að breytingum þínum þegar þú hættir við.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Geyma drög að breytingum við hætt við';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Vísbendingar um ólesin skilaboð';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Stjórna hvernig ólesnar vísbendingar skilaboða eru sýndar.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Sýna dofna vísbendingu um ólesin skilaboð í þögguðum rásum';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Sýna dökka vísbendingu um ólesin skilaboð við hlið þaggaðra beinaskilaboða og rása svo þú getir samt séð í fljótu bragði þegar það er virkni.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Forskoðun á DM skilaboðum';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Stjórna hvenær forsýn skilaboða eru sýndar í DM lista.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Forskoðunarstilling DM skilaboða';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Öll skilaboð';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Sýna forsýn skilaboða fyrir öll DM samtöl';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'Aðeins ólesin DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Sýna aðeins forsýn skilaboða fyrir DM með ólesnum skilaboðum';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Engin';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ekki sýna forsýn skilaboða í DM lista';

  @override
  String get dmListSentAnAttachment => 'Sendi viðhengi';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username festi skilaboð í þessa rás.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username bætti $userName við hópinn.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username bætti einhverjum við hópinn.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username hefur yfirgefið hópinn.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username fjarlægði $userName úr hópnum.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username fjarlægði einhvern úr hópnum.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username breytti heiti rásarinnar í $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username breytti heiti rásarinnar.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username breytti tákni rásarinnar.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username hóf símtal.';
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
  String get voiceConnectionConfirmTitle => 'Staðfesting raddtengingar';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Þú ert nú þegar tengd(ur) við þessa raddrás frá $count öðrum tækjum. Hvað viltu gera?',
      one:
          'Þú ert nú þegar tengd(ur) við þessa raddrás frá 1 öðru tæki. Hvað viltu gera?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Skipta yfir á þetta tæki';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Bara tengjast (halda öðrum tengingum)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ekki gera neitt, ég vil ekki tengjast';

  @override
  String get voiceChannelEmptyDescription =>
      'Þetta er raddrás. Tengstu til að byrja að tala!';

  @override
  String get voiceChannelJoin => 'Tengjast raddrás';

  @override
  String get voiceChannelJoinConnect => 'Tengjast rödd';

  @override
  String get voiceChannelNoConnectPermission =>
      'Þú hefur ekki leyfi til að tengjast þessari raddrás';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Hljóðnemi, myndavél og skjádeilingarefni eru end-to-end dulkóðuð.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Hljóðnemi, myndavél og skjádeilingarefni eru end-to-end dulkóðuð.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end dulkóðun er ekki tiltæk vegna þess að ósamþykktur þátttakandi er í þessari raddrás.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end dulkóðun er ekki tiltæk vegna þess að ósamþykktur þátttakandi er í þessu símtali.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Þessi viðskiptavinur verður að vera uppfærður áður en hægt er að tengjast þessu dulkóðuðu símtali.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Gat ekki ræst hljóðnemann þinn. Þú ert enn í símtalinu.';

  @override
  String get voiceChannelStatusConnecting => 'Tengist...';

  @override
  String get voiceChannelStatusConnected => 'Tengd(ur)';

  @override
  String get voiceChannelStatusError => 'Villa';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Farsímatæki';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Skjáborðstæki';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Samfélagshljóðnemi';

  @override
  String get voiceParticipantTooltipMuted => 'Hljóðnemi';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Samfélag heyrnarlaus';

  @override
  String get voiceParticipantTooltipDeafened => 'Heyrnarlaus';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Tenging: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count þátttakendur',
      one: '1 þátttakandi',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Hætta';

  @override
  String get voiceControlMute => 'Hljóðnemi';

  @override
  String get voiceControlUnmute => 'Afhjóða';

  @override
  String get voiceControlDeafen => 'Heyrnarlaus';

  @override
  String get voiceControlUndeafen => 'Afheyrnarlaus';

  @override
  String get voiceControlVideo => 'Myndband';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Skjádeiling';

  @override
  String get voiceScreenShareNotificationText => 'Deilir skjánum þínum.';

  @override
  String get voiceControlMore => 'Meira';

  @override
  String get voiceControlDisconnect => 'Aftengja';

  @override
  String get voiceControlChat => 'Spjall';

  @override
  String get voiceTextChatShow => 'Sýna spjall';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ólesin skilaboð',
      one: '# ólesið skilaboð',
    );
    return 'Sýna spjall með $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Myndavélarleyfi er nauðsynlegt fyrir myndband.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Gat ekki hafið skjádeilingu. Vinsamlegast reyndu aftur.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Skjádeilingarleyfi var hafnað.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Skjádeiling er ekki tiltæk á þessu tæki.';

  @override
  String get voiceWatchStream => 'Horfa á straum';

  @override
  String get voiceStopWatching => 'Hætta að horfa';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Hætta að horfa á strauminn';

  @override
  String get voiceOwnScreenShareTitle => 'Þú ert að senda út';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Straumnum þínum er streymt fyrir þátttakendur.';

  @override
  String get voiceLiveBadge => 'Í beinni';

  @override
  String get dmVoiceViewCall => 'Skoða símtal';

  @override
  String get dmVoiceCallFullScreen => 'Fullur skjár';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Opna símtal í fullum skjá';

  @override
  String get dmVoiceStripStatusConnecting => 'Tengist…';

  @override
  String get dmVoiceStripStatusInCall => 'Í símtali';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Radd símtal';

  @override
  String get dmVoiceCallBarConnecting => 'Tengist…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Beint símtal';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Hópsímtal';

  @override
  String get dmVoiceCallBarIssueFallback => 'Rökvilla';

  @override
  String get dmVoiceFullscreenTitle => 'Rödd';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Rödd tengd';

  @override
  String get notificationsPageTitle => 'Tilkynningar';

  @override
  String get notificationsFilterUnreads => 'Ólesnar';

  @override
  String get notificationsFilterMentions => 'Nefndir';

  @override
  String get notificationsBookmarksTooltip => 'Bókamerki';

  @override
  String get notificationsMentionFilterTooltip => 'Sía nefndir';

  @override
  String get notificationsMentionFiltersTitle => 'Nefndarsíur';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Senda @allir og @hér nefndir';

  @override
  String get notificationsMentionIncludeRoles => 'Senda hlutverkanefndir';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Innifela allar samfélagstilvísanir';

  @override
  String get notificationsNoUnreadTitle => 'Engin ólesin skilaboð';

  @override
  String get notificationsNoUnreadBody => 'Þú ert alveg með á nótunum.';

  @override
  String get notificationsNoMentionsTitle => 'Engar nýlegar tilvísanir';

  @override
  String get notificationsNoMentionsBody =>
      'Allar @tilvísanir til þín birtast hér í 7 daga.';

  @override
  String get notificationsMentionsEndTitle => 'Þú hefur náð endanum';

  @override
  String get notificationsMentionsEndBody =>
      'Þú hefur séð allar nýlegar tilvísanir þínar. Ekki hafa áhyggjur, fleiri munu birtast hér fljótlega.';

  @override
  String get notificationsJump => 'Hoppa';

  @override
  String get notificationsRemoveMentionTooltip => 'Fjarlægja tilvísun';

  @override
  String get notificationsViewAllUnread => 'Skoða allt ólesið';

  @override
  String get notificationsMarkAsRead => 'Merkja sem lesið';

  @override
  String get notificationsExpand => 'Stækka';

  @override
  String get notificationsCollapse => 'Minnka';

  @override
  String get notificationsMessageUnavailable =>
      'Ekki var hægt að hlaða þessi skilaboð.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining stafir eftir';
  }

  @override
  String get characterCounterTooLong => 'Skilaboð eru of löng';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining stafir eftir. Fáðu $productName til að skrifa allt að $premiumMaxLength stafi.';
  }

  @override
  String get chatMessageFailedToSend => 'Tókst ekki að senda skilaboð';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Ekki var hægt að afhenda skilaboðin þín. Þetta er venjulega vegna þess að þú deilir ekki samfélagi með viðtakandanum eða viðtakandinn tekur aðeins við beinum skilaboðum frá vinum. Þú gætir líka þurft að aðlaga eigin stillingar fyrir persónuleg skilaboð í $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Ekki var hægt að afhenda skilaboðin þín. Þú þarft að krefjast reikningsins þíns til að senda persónuleg skilaboð.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Ekki var hægt að afhenda skilaboðin þín. Þú þarft að krefjast reikningsins þíns til að senda skilaboð.';

  @override
  String get chatSendFailureContentBlocked =>
      'Ekki var hægt að afhenda skilaboðin þín vegna þess að þau voru merkt af öryggiskerfum okkar. Ef þú telur að þetta sé mistök, vinsamlegast hafðu samband við þjónustuver.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Ekki var hægt að afhenda skilaboðin þín vegna þess að þau innihalda fullorðinsemoji eða límmiða sem eru ekki leyfðir í þessu samhengi.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Aðeins þú getur séð þessi skilaboð.';

  @override
  String get chatClientSystemDismiss => 'Loka';

  @override
  String get privacyDashboardCommunicationSection => 'Samskipti';

  @override
  String get chatMessageDeleteFailed => 'Eyðing mistókst';

  @override
  String get chatMessageAddReaction => 'Bæta við emoji';

  @override
  String get chatMessageEdit => 'Breyta skilaboðum';

  @override
  String get chatMessageReply => 'Svara';

  @override
  String get chatMessageForward => 'Áframsenda';

  @override
  String get forwardMessageTitle => 'Áframsenda skilaboð';

  @override
  String get forwardSearchHint => 'Leita að rás eða einkaskilaboðum';

  @override
  String get forwardDirectMessagesSection => 'Einkaskilaboð';

  @override
  String get forwardCommentHint => 'Bæta við athugasemd (valfrjálst)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Senda ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Engar rásir fundust';

  @override
  String get forwardSuccessToast => 'Skilaboð send áfram';

  @override
  String get forwardFailed => 'Mistókst að senda skilaboð áfram';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Athugasemdir eru ekki tiltækar þar sem hægvirki er virkt í völdum rás.';

  @override
  String get forwardDestinationNoSendPermission =>
      'Þú getur ekki sent skilaboð hér';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Þú getur ekki sett inn tengla hér';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Þú getur ekki hlaðið upp skrám hér';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Sending skilaboða er óvirk í þessu samfélagi';

  @override
  String get forwardDestinationTimedOut => 'Þú ert í bið í þessu samfélagi';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Hægvirki - bíddu $remaining';
  }

  @override
  String get chatMessageCopyText => 'Afrita skilaboð';

  @override
  String get chatMessagePin => 'Pinna skilaboð';

  @override
  String get chatMessageUnpin => 'Afpinna skilaboð';

  @override
  String get chatMessageUnpinIt => 'Afpinna það';

  @override
  String get chatMessageBookmark => 'Bókamerki skilaboð';

  @override
  String get chatMessageRemoveBookmark => 'Fjarlægja bókamerki';

  @override
  String get chatMessageMarkAsUnread => 'Merkja sem ólesið';

  @override
  String get chatMessageCopyMessageLink => 'Afrita tengil á skilaboð';

  @override
  String get chatMessageCopyMessageId => 'Afrita skilaboðaauðkenni';

  @override
  String get chatMessageViewReactions => 'Skoða emojis';

  @override
  String get chatMessageRemoveAllReactions => 'Fjarlægja öll emojis';

  @override
  String get chatMessageDebug => 'Skoða skilaboð í smáatriðum';

  @override
  String get chatMessageDebugSheetTitle => 'Skoða skilaboð í smáatriðum';

  @override
  String get chatMessageDebugCopyJson => 'Afrita JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON skilaboða afritað á klemmuspjald';

  @override
  String get chatReactionsSheetTitle => 'Emojis';

  @override
  String get chatReactionsSheetEmpty => 'Enginn hefur brugðist við þessu enn.';

  @override
  String get chatMessageReport => 'Tilar skilaboð';

  @override
  String get iarReportMessageTitle => 'Tilar skilaboð';

  @override
  String get iarThisUserFallback => 'þessi notandi';

  @override
  String get iarModalDescription =>
      'Tilaðu brot á reglum, eða finndu verkfæri til að stjórna samskiptum og stillingum.';

  @override
  String get iarPathStepAriaLabel => 'Hvað þarftu?';

  @override
  String get iarCategoryStepTitle => 'Hvers konar regla var brotin?';

  @override
  String get iarReasonStepTitle => 'Hvaða regla var brotin?';

  @override
  String get iarReasonSelectHint => 'Veldu ástæðu';

  @override
  String get iarPickAnOptionToast => 'Veldu valkost til að halda áfram.';

  @override
  String get iarPickARuleToast => 'Veldu regluna sem var brotin.';

  @override
  String get iarPathPlatform => 'Tilaðu brot á vettvangsreglum';

  @override
  String get iarPathCommunity => 'Tilaðu umsjónarmönnum þessa samfélags';

  @override
  String get iarPathPreferenceMessage => 'Ég vil ekki sjá þetta efni';

  @override
  String get iarCategoryTargetedHarmLabel => 'Hótanir, áreiti eða skaði';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Einelti, hótanir, hatursáróður, ofbeldi, árásir eða efni sem hvetur til sjálfsskaða.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Öryggi barna eða óviðeigandi efni';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Börn í hættu, óviðeigandi efni á röngum stað eða óæskileg hegðun.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Persónuvernd eða blekking';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, ofsóknir, að þykjast vera einhver annar, eða óviðeigandi prófíll.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Svindl, spilliforrit eða falsfréttir';

  @override
  String get iarCategoryDeceptionDescription =>
      'Fiskiveiðar, svik, skaðlegir tenglar eða rangar fullyrðingar sem líklegar eru til að valda skaða í raunveruleikanum.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Ólögleg starfsemi eða eitthvað annað';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Ólögleg sala, auðveldan glæpi, eða augljós brot á reglum sem passa ekki hér að ofan.';

  @override
  String get iarReasonHarassmentLabel => 'Áreiti eða hótanir';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Einelti, ítrekaðar óumbeðnar tengiliðir, ofsóknir eða markvissa misnotkun.';

  @override
  String get iarReasonHateLabel => 'Hatursáróður';

  @override
  String get iarReasonHateMessageDescription =>
      'Niðrandi orð, ógeðfelld orðræða eða árásir á verndaða hópa.';

  @override
  String get iarReasonViolenceLabel => 'Ofbeldi eða ofbeldisfullar hótanir';

  @override
  String get iarReasonViolenceDescription =>
      'Trúverðugar hótanir, grafísk ofbeldi eða dýrkun ofbeldis.';

  @override
  String get iarReasonMatureContentLabel => 'Óviðeigandi efni eða áreiti';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Óæskileg hegðun eða óviðeigandi efni á röngum stað.';

  @override
  String get iarReasonChildSafetyLabel => 'Öryggi barna eða misnotkun á börnum';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Efni sem tengist barnamisnotkun eða útnýtingu barna.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Skaðlegar falsfréttir';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Rangt fullyrðingar sem líklegar eru til að valda skaða í raunveruleikanum.';

  @override
  String get iarReasonSpamLabel => 'Ruslpóstur, svindl eða fiskiveiðar';

  @override
  String get iarReasonSpamMessageDescription =>
      'Massaruslpóstur, svik, fölsk gjafaleikir eða misnotkun á reikningi.';

  @override
  String get iarReasonMalwareLabel => 'Spilliforrit eða hættulegir tenglar';

  @override
  String get iarReasonMalwareDescription =>
      'Spilliforrit, stolnir innskráningargögn eða skaðlegar skrár.';

  @override
  String get iarReasonPrivacyLabel => 'Persónuverndarbrot';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, afhjúpaðar persónulegar upplýsingar eða ofsóknir.';

  @override
  String get iarReasonImpersonationLabel => 'Blekking eða blekkandi miðlar';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Að þykjast vera einhver annar, þar með talið blekkandi gervigreindarefni.';

  @override
  String get iarReasonIllegalLabel => 'Ólögleg starfsemi';

  @override
  String get iarReasonIllegalDescription =>
      'Ólögleg sala, auðveldan glæpi eða ólögleg starfsemi.';

  @override
  String get iarReasonSelfHarmLabel => 'Sjálfsskaði eða sjálfsvíg';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Hvatning eða leiðbeiningar sem hvetja til sjálfsskaða eða átröskunar.';

  @override
  String get iarReasonOtherLabel => 'Annað augljóst brot á reglum';

  @override
  String get iarReasonOtherDescription =>
      'Notaðu aðeins ef það brýtur augljóslega gegn reglum Fluxer og passar ekki hér að ofan.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Ef barn er aðili, notaðu „$childSafetyReason“ í staðinn.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Ef þetta tengist CSAM eða misnotkun á barni, sendu það núna og ekki deila efninu aftur.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Ef einhver gæti verið í bráðri hættu, hafðu samband við staðbundna neyðarþjónustu ef þú getur gert það á öruggan hátt.';

  @override
  String get iarSafetyNoteViolence =>
      'Ef þetta er trúverðug bráð hætta, hafðu einnig samband við staðbundna neyðarþjónustu.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Ef þetta er bráð hryðjuverkaógn, hafðu einnig samband við staðbundna neyðarþjónustu.';

  @override
  String get iarActionBlockUserTitle => 'Lokaðu fyrir þennan notanda';

  @override
  String get iarActionBlockUserDescription =>
      'Hættu skilaboðum og vinabeiðnum.';

  @override
  String get iarActionBlockUserButton => 'Lokaðu fyrir';

  @override
  String get iarActionCopyMessageLinkTitle => 'Afrita tengil á skilaboð';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Deildu með mods samfélagsins.';

  @override
  String get iarActionCopyMessageLinkButton => 'Afrita';

  @override
  String get iarActionCloseDmTitle => 'Lokaðu þessu DM';

  @override
  String get iarActionCloseDmDescription =>
      'Lokar ekki. Þú getur opnað aftur síðar.';

  @override
  String get iarActionCloseDmButton => 'Loka skilaboðum';

  @override
  String get iarActionLeaveCommunityTitle => 'Hætta í samfélaginu';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Hættu að sjá efni og meðlimi þess.';

  @override
  String get iarActionLeaveCommunityButton => 'Hætta';

  @override
  String get iarActionDmSettingsTitle =>
      'Stillingar fyrir skilaboð og vinabeiðnir';

  @override
  String get iarActionDmSettingsDescription =>
      'Breyttu því hver getur haft samband við þig.';

  @override
  String get iarActionCallSettingsTitle =>
      'Stillingar fyrir símtöl og hópspjall';

  @override
  String get iarActionCallSettingsDescription =>
      'Breyttu því hver getur hringt í þig eða bætt þér við.';

  @override
  String get iarActionOpenButton => 'Opna';

  @override
  String get iarActionDeleteMessageTitle => 'Eyða þessum skilaboðum';

  @override
  String get iarActionDeleteMessageDescription =>
      'Fjarlægðu þau úr rásinni fyrir alla.';

  @override
  String get iarActionDeleteMessageButton => 'Eyða';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Eytt';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Þessi skilaboð hafa þegar verið eydd.';

  @override
  String get iarActionBanUserTitle => 'Banna þennan notanda';

  @override
  String get iarActionBanUserDescription =>
      'Opnaðu bannið fyrir þetta samfélag.';

  @override
  String get iarActionBanUserButton => 'Banna';

  @override
  String get iarActionBanUserBannedButton => 'Bannað';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Þessi notandi er þegar bannaður frá samfélaginu.';

  @override
  String get iarCloseDmConfirmTitle => 'Loka skilaboðum';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Lokaðu núverandi skilaboðum þínum með $name. Þetta bannar þeim ekki; þú getur opnað aftur síðar.';
  }

  @override
  String get iarSuccessTitle => 'Kvörtun send';

  @override
  String get iarSuccessBody =>
      'Öryggisteymi okkar er að fara yfir hana. Við munum senda þér skilaboð og tölvupóst þegar við höfum tekið ákvörðun.';

  @override
  String get iarAlreadyReportedTitle => 'Þegar kvartað';

  @override
  String get iarAlreadyReportedBody =>
      'Þú hefur þegar kvartað undan þessum skilaboðum. Öryggisteymi okkar er að fara yfir hana.';

  @override
  String get iarBackButton => 'Til baka';

  @override
  String get iarContinueButton => 'Halda áfram';

  @override
  String get iarSendReportButton => 'Senda kvörtun';

  @override
  String get iarDoneButton => 'Lokið';

  @override
  String get iarCouldntSendToast =>
      'Ekki tókst að senda kvörtunina. Vinsamlegast reyndu aftur.';

  @override
  String get iarRateLimitedToast =>
      'Þú ert að senda of margar kvartanir. Vinsamlegast bíddu smá stund og reyndu aftur.';

  @override
  String get iarReportSentToast =>
      'Kvörtun send. Öryggisteymi okkar mun fara yfir hana.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Banna $name? Þeir munu ekki geta sent þér skilaboð eða vinabeiðnir. Þú getur afbannað þá síðar.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Ekki tókst að banna þennan notanda. Vinsamlegast reyndu aftur.';

  @override
  String get iarCloseDmSuccessToast => 'Skilaboðum lokað.';

  @override
  String get iarCloseDmFailedToast =>
      'Ekki tókst að loka þessum skilaboðum. Vinsamlegast reyndu aftur.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Ekki tókst að yfirgefa þetta samfélag. Vinsamlegast reyndu aftur.';

  @override
  String get chatMessageSuppressEmbeds => 'Fela tenglaforblað';

  @override
  String get chatMessageUnsuppressEmbeds => 'Birta tenglaforblað';

  @override
  String get chatMessageDelete => 'Eyða skilaboðum';

  @override
  String get chatMessageDeleteConfirmTitle => 'Eyða skilaboðum';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Ertu viss um að þú viljir eyða þessum skilaboðum?';

  @override
  String get chatMessageMore => 'Meira';

  @override
  String get chatEditingMessage => 'Breyta skilaboðum';

  @override
  String get chatReplyOriginalDeleted => 'Upprunaleg skilaboð voru eydd';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Upprunaleg skilaboð tókst ekki að hlaða';

  @override
  String get chatReplyAttachedMedia => 'Skilaboð innihalda tengda miðla';

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
  String get chatMessagesLoadError => 'Ekki tókst að hlaða skilaboðum.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Yfirskrifa stillingar fyrir tilkynningu?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname kýs að vera @tilkynntur í svörum. Sendir þú án tilkynningar engu að síður?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname kýr að fá svar án @nefndar. Sendir þú samt með nefnd?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Hunsa ósk';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Smelltu til að hætta að pinga notandann sem þú ert að svara.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Smelltu til að pinga notandann sem þú ert að svara.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Nefna notanda sem svarað er til';

  @override
  String get chatReplyMentionOn => 'Kveikt';

  @override
  String get chatReplyMentionOff => 'Slökkt';

  @override
  String get chatReplyCancel => 'Hætta við svar';

  @override
  String get chatEditMessageHint => 'Breyta skilaboðum';

  @override
  String get chatEditNoChanges => 'Engar breytingar til að vista';

  @override
  String get chatChannelNotReady =>
      'Þessi rás er ekki tilbúin ennþá. Reyndu aftur eftir augnablik.';

  @override
  String get chatMessageEdited => '(breytt)';

  @override
  String get chatMessageSilent => 'Þetta voru @silent skilaboð.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Í dag kl. $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Í gær kl. $time';
  }

  @override
  String get mediaViewerImagePreview => 'Forskoðun myndar';

  @override
  String get mediaViewerClose => 'Loka myndskoðara';

  @override
  String get mediaViewerOpenInBrowser => 'Opna í vafra';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Áframsenda';

  @override
  String get mediaViewerZoomIn => 'Aðdráttur';

  @override
  String get mediaViewerZoomOut => 'Aðdráttur út';

  @override
  String get mediaViewerPreviousAttachment => 'Fyrri viðhengi';

  @override
  String get mediaViewerNextAttachment => 'Næsta viðhengi';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls =>
      'Birta/fela myndbandsstýringar';

  @override
  String get chatAttachmentVideoMute => 'Þagga myndband';

  @override
  String get chatAttachmentVideoUnmute => 'Afþagga myndband';

  @override
  String get chatAttachmentVideoPlay => 'Spila myndband';

  @override
  String get chatAttachmentVideoPause => 'Hlé á myndbandi';

  @override
  String get chatAttachmentVideoProgress => 'Staða myndbands';

  @override
  String get chatVideoPlaybackFailed => 'Gat ekki spilað þetta myndband.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Tilkynna notendum með þetta hlutverk sem hafa leyfi til að skoða þessa rás.';

  @override
  String get addGuildModalTitle => 'Bæta við samfélagi';

  @override
  String get addGuildModalLandingDescription =>
      'Búðu til nýtt samfélag eða gerðu þig aðili að því sem fyrir er.';

  @override
  String get addGuildCreateCommunity => 'Búa til samfélag';

  @override
  String get addGuildJoinCommunity => 'Gerast aðili að samfélagi';

  @override
  String get addGuildImportDiscordTemplate => 'Flytja inn Discord sniðmát';

  @override
  String get addGuildJoinTitle => 'Gerast aðili að samfélagi';

  @override
  String get addGuildJoinDescription =>
      'Sláðu inn boðstengilinn til að gerast aðili að samfélagi.';

  @override
  String get addGuildInviteLinkLabel => 'Boðstengill';

  @override
  String get addGuildJoinSubmit => 'Gerast aðili að samfélagi';

  @override
  String get addGuildInviteInvalid => 'Þetta boð er ógilt eða hefur runnið út.';

  @override
  String get addGuildJoinFailed =>
      'Gat ekki gerst aðili að samfélaginu. Vinsamlegast reyndu aftur.';

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
  String get addGuildPackInstalled => 'Pakki settur upp með góðum árangri.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Fjarlægja allar viðbrögð';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Ertu viss um að þú viljir fjarlægja allar viðbrögð frá þessum skilaboðum?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Aftengja skilaboð';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Sendir þú þessa tengingu aftur í tímann?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username tengdi $messageLink við þessa rás. Sjá $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'skilaboð';

  @override
  String get systemPinMessageAllPinsLink => 'öll tengd skilaboð';

  @override
  String get channelPinsEmptyTitle => 'Engar fastar skilaboð';

  @override
  String get channelPinsEmptyDescription => 'Fastar skilaboð birtast hér.';

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
  String get channelDetailsAddFriendsToGroup => 'Add friends to group';

  @override
  String get channelDetailsGroupInvites => 'Group invites';

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
  String get personalNotesTitle => 'Persónulegar minnispunkter';

  @override
  String get personalNotesSubtitle =>
      'Þinn einkarými fyrir hugsanir og áminningar';

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
    return 'Velkomin í $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Í upphafi var ekkert. Svo kom $channelName. Og það var gott.';
  }

  @override
  String get personalNotesComposerHint => 'Sendu skilaboð til þín';

  @override
  String get personalNotesPrivateSpace => 'Þinn einkarými';

  @override
  String get purgePersonalNotes => 'Eyða persónulegum minnispunktum';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Þetta mun eyða varanlega öllum skilaboðum og viðhengjum í persónulegum minnispunktum þínum. Þetta er ekki hægt að afturkalla.';

  @override
  String get purgePersonalNotesConfirmButton => 'Eyða';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Eyddi $count skilaboðum úr persónulegum minnispunktum';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Persónulegir minnispunkter voru þegar tómir';

  @override
  String get purgePersonalNotesFailed =>
      'Gat ekki hreinsað persónulega minnispunkta';

  @override
  String get userSettingsGroupYourAccount => 'ÞÍN REIKNINGUR';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Prófíll';

  @override
  String get userSettingsNavSecurityLogin => 'Öryggi og innskráning';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Gjafir og kóðar';

  @override
  String get userSettingsNavExpressionPacks => 'Tjáningarpakkar';

  @override
  String get userSettingsNavPrivacyDashboard => 'Persónuverndarstýring';

  @override
  String get userSettingsNavAuthorizedApps => 'Leyfisveitt forrit';

  @override
  String get userSettingsNavBlockedUsers => 'Lokaðir notendur';

  @override
  String get userSettingsNavLinkedDevices => 'Tengd tæki';

  @override
  String get userSettingsNavConnections => 'Tengingar';

  @override
  String get userSettingsNavLookAndFeel => 'Útlit og áferð';

  @override
  String get userSettingsNavAccessibility => 'Aðgengi';

  @override
  String get userSettingsNavMessagesAndMedia => 'Skilaboð og miðlar';

  @override
  String get userSettingsNavAudioAndVideo => 'Hljóð og mynd';

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
  String get userSettingsNavSoundsAndAlerts => 'Hljóð og tilkynningar';

  @override
  String get userSettingsNavLanguageAndTime => 'Tungumál og tími';

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
  String get userSettingsNavAdvanced => 'Ítarlegt';

  @override
  String get advancedPerformanceReportingTitle => 'Afkomuskýrslugerð';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Hjálpaðu til við að bæta Fluxer með því að deila nafnlausum hrun- og afkomugögnum.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Senda hrun- og afkomuskýrslur';

  @override
  String get advancedPerformanceReportingDescription =>
      'Öll gögn sem tilkynnt eru eru nafnlaus og eru aðeins send til eigin eftirlitsþjónustu Fluxer — engir þriðju aðilar eru notaðir.';

  @override
  String get userSettingsNavApplications => 'Forrit';

  @override
  String get userSettingsNavAppLogs => 'Forritaskrár';

  @override
  String get userSettingsNavDeveloperTools => 'Verktæki fyrir verktaki';

  @override
  String get userSettingsNavLimitsConfig => 'Takmarkanir stillingar';

  @override
  String get userSettingsNavFeatureFlags => 'Eiginleikaflaggir';

  @override
  String get userSettingsNavWhatsNew => 'Nýjungar';

  @override
  String get userSettingsNavLogOut => 'Útskráning';

  @override
  String get betaWarningTitle => 'Beta hugbúnaður';

  @override
  String get betaWarningMessage =>
      'Þetta er beta hugbúnaður. Ekki er allt tilbúið eða bætt við ennþá.';

  @override
  String get betaWarningReportIssues =>
      'Vinsamlegast tilkynntu öll vandamál sem þú finnur til samfélags Fluxer Mobile (þú verður að hafa Plutonium til að geta gengið í samfélagið eins og er).';

  @override
  String get betaWarningRepoLink => 'Skoða heimild á GitHub';

  @override
  String get betaWarningGotIt => 'Skilinn';

  @override
  String get quickSwitcherTabSearch => 'Leit';

  @override
  String get quickSwitcherTabFriends => 'Vinir';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Leita að rásum, fólki eða samfélögum';

  @override
  String get quickSwitcherSearchFriends => 'Leita að vinum';

  @override
  String get quickSwitcherNoMatchesFound => 'Engar niðurstöður fundust';

  @override
  String get quickSwitcherEmptyHint =>
      'Prófaðu annað nafn eða notaðu @ / # / ! / * forskeyti til að sía niðurstöður.';

  @override
  String get quickSwitcherSectionPeople => 'Fólk';

  @override
  String get quickSwitcherSectionGroupMessages => 'Hópskilaboð';

  @override
  String get quickSwitcherSectionTextChannels => 'Textarásir';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Raddrásir';

  @override
  String get quickSwitcherSectionCommunities => 'Samfélög';

  @override
  String get quickSwitcherSectionSettings => 'Stillingar';

  @override
  String get quickSwitcherHomeLabel => 'Heim';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Einkaskilaboð';

  @override
  String get quickSwitcherFavoritesLabel => 'Bóamerki';

  @override
  String get quickSwitcherUserSettingsLabel => 'Notendastillingar';

  @override
  String get quickSwitcherNotificationsLabel => 'Tilkynningar';

  @override
  String get quickSwitcherBookmarksLabel => 'Vafamerki';

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
  String get quickSwitcherMentionsLabel => 'Nafngreiningar';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Engir vinir ennþá';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Bættu við vini til að byrja.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Engir vinir passa við þessa leit';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Prófaðu annað nafn.';

  @override
  String get quickSwitcherSearchAliasUser => 'Notandi';

  @override
  String get quickSwitcherSearchAliasYou => 'Þú';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Skilaboð';

  @override
  String get quickSwitcherSearchAliasFav => 'Bóamerki';

  @override
  String get quickSwitcherSearchAliasStarred => 'Stjörnumerkt';

  @override
  String get quickSwitcherSearchAliasInbox => 'Innhólf';

  @override
  String get quickSwitcherSearchAliasSaved => 'Vistað';

  @override
  String get uiClose => 'Loka';

  @override
  String get chatJumpToBottom => 'Hoppa neðst';

  @override
  String get uiConfirm => 'Staðfesta';

  @override
  String get uiLoading => 'Hleður';

  @override
  String get uiUnsavedChanges => 'Óvistaðar breytingar';

  @override
  String get uiReset => 'Endurstilla';

  @override
  String get uiOpenColorPicker => 'Opna litaval';

  @override
  String get uiSelectPlaceholder => 'Velja';

  @override
  String get uiSearchPlaceholder => 'Leita';

  @override
  String get uiNoOptionsFound => 'Engir möguleikar fundust';

  @override
  String get uiDismissNotification => 'Loka tilkynningu';

  @override
  String get uiColorPickerTitle => 'Litaval';

  @override
  String get mentionConfirmTitle => 'Nefna alla?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Þetta mun tilkynna $count meðlimum. Halda áfram?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Þetta mun tilkynna $count virka meðlimi. Halda áfram?';
  }

  @override
  String get mentionConfirmButton => 'Nefna';

  @override
  String get composerEmojiUnavailable => 'Þú getur ekki notað þetta emoji hér.';

  @override
  String get instanceUrlLabel => 'URL á netþjóni';

  @override
  String get instanceUrlPlaceholder =>
      'Sláðu inn URL á netþjóni (t.d. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Endurstilla á Fluxer';

  @override
  String get instanceConnect => 'Tengjast';

  @override
  String get instanceConnecting => 'Samskipti…';

  @override
  String get instanceConnectFailed => 'Tókst ekki að tengjast við tengingu';

  @override
  String get recentInstances => 'Nýlegar tengingar';

  @override
  String removeRecentInstance(String domain) {
    return 'Fjarlægja $domain úr nýlegum tengingum';
  }

  @override
  String get instanceSheetTitle => 'Tengjast við tengingu';

  @override
  String get connectToDifferentInstance => 'Tengjast við aðra tengingu';

  @override
  String get changeInstance => 'Breyta';

  @override
  String get instanceConnectionRequired =>
      'Tengjast við tenginguna til að skrá þig inn';

  @override
  String get comingSoon => 'Væntanlegt';

  @override
  String get guildNavbarDirectMessages => 'Einkaskilaboð';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Kanna samfélög sem hægt er að uppgötva';

  @override
  String get discoveryExplore => 'Kanna';

  @override
  String get discoveryExplorePublicCommunities => 'Kanna opinber samfélög';

  @override
  String get discoveryListingSubheading =>
      'Viltu skrá samfélagið þitt hér? Sæktu um ef þú uppfyllir skilyrðin í stillingum samfélagsins þíns > Uppgötvun.';

  @override
  String get discoverySearchCommunities => 'Leita að samfélögum';

  @override
  String get discoveryFilterByLanguage => 'Sía eftir tungumáli';

  @override
  String get discoveryAllLanguages => 'Öll tungumál';

  @override
  String get discoveryAllCategories => 'Allt';

  @override
  String get discoveryCategoryGaming => 'Leikir';

  @override
  String get discoveryCategoryMusic => 'Tónlist';

  @override
  String get discoveryCategoryEntertainment => 'Skemmtun';

  @override
  String get discoveryCategoryEducation => 'Menntun';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Vísindi og tækni';

  @override
  String get discoveryCategoryContentCreator => 'Efnisframleiðandi';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime og Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Kvikmyndir og sjónvarp';

  @override
  String get discoveryCategoryOther => 'Annað';

  @override
  String get discoveryNoCommunitiesMatch => 'Engin samfélög passa.';

  @override
  String get discoveryJoinCommunity => 'Taka þátt í samfélagi';

  @override
  String get discoveryJoined => 'Tókst þátt';

  @override
  String discoveryOnlineCount(String count) {
    return '$count í beinni';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString meðlimir',
      one: '1 meðlimur',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Engin lýsing.';

  @override
  String get discoveryCommunities => 'Samfélög';

  @override
  String get discoveryApps => 'Forrit';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Tókst ekki að taka þátt í þessu samfélagi';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Eitthvað fór úrskeiðis. Vinsamlegast reyndu aftur eftir augnablik.';

  @override
  String get discoveryJoinErrorFullTitle => 'Þetta samfélag er fullt';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Þetta samfélag hefur náð hámarksfjölda meðlima, svo þú getur ekki tekið þátt núna.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Þú hefur náð hámarksfjölda samfélaga';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Þú ert í hámarksfjölda samfélaga. Farðu úr einu og reyndu aftur.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Þú getur ekki tekið þátt í þessu samfélagi';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Þú hefur verið bannaður frá þessu samfélagi.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Þetta samfélag er ekki lengur tiltækt';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Það gæti hafa yfirgefið uppgötvun eða slökkt á nýjum þátttakendum. Endurnýjaðu síðuna og þú munt ekki sjá það aftur.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Þú ert að fara of hratt';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Vinsamlegast bíddu augnablik og reyndu aftur.';

  @override
  String get guildNavbarAddCommunity => 'Bæta við samfélagi';

  @override
  String get guildNavbarHelp => 'Hjálp';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NÝ SKILABOÐ';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Loka $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Hóp-PM';

  @override
  String get guildNavbarCreateChannel => 'Búa til rás';

  @override
  String get guildNavbarChannelType => 'Tegund rásar';

  @override
  String get guildNavbarTextChannel => 'Textarás';

  @override
  String get guildNavbarTextChannelDescription =>
      'Senda skilaboð, myndir, GIF og emoji';

  @override
  String get guildNavbarVoiceChannel => 'Raddrás';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Hang out together with voice, video, and screen share';

  @override
  String get guildNavbarLinkChannel => 'Tengdrás';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Flýtaðgangur að ytri vefsíðu eða auðlind';

  @override
  String get guildNavbarNameLabel => 'Nafn';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Búa til flokk';

  @override
  String get guildNavbarNewCategoryHint => 'Nýr flokkur';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Bjóða vinum í $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Viðtakendur fara í #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Leita að vinum';

  @override
  String get guildNavbarNoFriendsYet => 'Engir vinir ennþá';

  @override
  String get guildNavbarNoResults => 'Engar niðurstöður';

  @override
  String get guildNavbarInviteLinkPrompt => 'Eða, senda boðstengil til vinar:';

  @override
  String get guildNavbarInviteLink => 'Boðstengill';

  @override
  String get guildNavbarCopy => 'Afrita';

  @override
  String get guildNavbarCopied => 'Afritað!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Boðstengillinn þinn rennur út eftir 7 daga.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Þessi boðstengill rennur aldrei út.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Boðstengillinn þinn rennur út eftir $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Breyta boðstengli';

  @override
  String get guildNavbarInviteLinkSettings => 'Stillingar boðstengils';

  @override
  String get guildNavbarExpireAfter => 'Rennur út eftir';

  @override
  String get guildNavbarMaxUses => 'Hámarksfjöldi nota';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Veita tímabundinn aðild';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Meðlimir verða fjarlægðir þegar þeir fara offline nema hlutverk sé úthlutað';

  @override
  String get guildNavbarCreateNewLink => 'Búa til nýjan tengil';

  @override
  String get guildNavbarSent => 'Sent';

  @override
  String get guildNavbarInvite => 'Bjóða';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Hætta í samfélagi';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Ertu viss um að þú viljir hætta í þessu samfélagi? Þú munt ekki lengur geta séð nein skilaboð.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Hætta í samfélagi';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Eyða skilaboðunum þínum í þessu samfélagi?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Eyða varanlega öllum skilaboðum sem þú hefur sent hér, í öllum rásum. Ekki er hægt að afturkalla.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Eyða skilaboðunum mínum';

  @override
  String get guildNavbarDeletedYourMessages => 'Eyddi skilaboðunum þínum';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Gat ekki eytt skilaboðunum þínum';

  @override
  String get guildNavbarRemoveOverride => 'Fjarlægja yfirskrift';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Þaggað til $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Aðeins aðgengilegt starfsfólki Fluxer';

  @override
  String get guildNavbarInvitesPaused => 'Boð eru nú í bið í þessu samfélagi';

  @override
  String get guildNavbarDurationNever => 'aldrei';

  @override
  String get guildNavbarDuration30Minutes => '30 mínútur';

  @override
  String get guildNavbarDuration1Hour => '1 klukkustund';

  @override
  String get guildNavbarDuration6Hours => '6 klukkustundir';

  @override
  String get guildNavbarDuration12Hours => '12 klukkustundir';

  @override
  String get guildNavbarDuration1Day => '1 dagur';

  @override
  String get guildNavbarDuration7Days => '7 dagar';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekúndur';
  }

  @override
  String get guildNavbarNever => 'Aldrei';

  @override
  String get guildNavbarNoLimit => 'Ótakmarkað';

  @override
  String get guildNavbarOneUse => '1 notkun';

  @override
  String guildNavbarUses(int count) {
    return '$count notkanir';
  }

  @override
  String get guildMenuMarkAsRead => 'Merkja sem lesið';

  @override
  String get guildPeekMoreOptions => 'Fleiri valkostir';

  @override
  String get guildMenuInviteMembers => 'Bjóða meðlimum';

  @override
  String get guildMenuCommunitySettings => 'Samfélagsstillingar';

  @override
  String get guildMenuEditCommunityProfile => 'Breyta samfélagssniði';

  @override
  String get guildMenuUnmuteCommunity => 'Afþagga samfélag';

  @override
  String get guildMenuMuteCommunity => 'Þagga samfélag';

  @override
  String get guildMenuHideMutedChannels => 'Fela þaggaðar rásir';

  @override
  String get guildMenuReportCommunity => 'Tilkynna samfélag';

  @override
  String get guildMenuDebugCommunity => 'Debug samfélag';

  @override
  String get guildMenuCopyCommunityId => 'Afrita samfélagsauðkenni';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Þar til $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Almennt';

  @override
  String get guildMenuSettingsRoles => 'Hlutverk & Leyfi';

  @override
  String get guildMenuSettingsEmoji => 'Sérsniðin emoji';

  @override
  String get guildMenuSettingsStickers => 'Sérsniðnir límmiðar';

  @override
  String get guildMenuSettingsSafetyModeration => 'Öryggi & Ráðgjöf';

  @override
  String get guildMenuSettingsActivityLog => 'Virkni skrá';

  @override
  String get guildMenuSettingsWebhooks => 'Vefkrókar';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Sérsniðin boðs URL';

  @override
  String get guildMenuSettingsDiscovery => 'Uppgötvun';

  @override
  String get guildMenuSettingsMembers => 'Meðlimir';

  @override
  String get guildMenuSettingsInviteLinks => 'Boðstenglar';

  @override
  String get guildMenuSettingsBans => 'Bönn';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Þú hefur ekki leyfi til að skoða þennan stilling flipa.';

  @override
  String get guildSettingsOverviewIconTitle => 'Táknið';

  @override
  String get guildSettingsUploadImage => 'Hlaða upp mynd';

  @override
  String get guildSettingsOverviewBannerTitle => 'Borði';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Hladdu upp borða fyrir netþjóninn þinn.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nafn';

  @override
  String get guildSettingsOverviewNameHint => 'Mitt frábæra samfélag';

  @override
  String get guildSettingsOverviewStatsTitle => 'Tölfræði';

  @override
  String get guildSettingsOverviewMembers => 'Meðlimir';

  @override
  String get guildSettingsOverviewOnline => 'Á netinu';

  @override
  String get guildSettingsRolesDescription =>
      'Notaðu hlutverk til að flokka meðlimi og úthluta leyfum.';

  @override
  String get guildSettingsCreateRole => 'Búa til hlutverk';

  @override
  String get guildSettingsRolesListTitle => 'Hlutverk';

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
    return '$staticCount kyrrstæð, $animatedCount hreyfanleg emoji pláss notuð';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Engin sérsniðin emoji ennþá.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count límmiðar hlaðið upp';
  }

  @override
  String get guildSettingsStickersEmpty => 'Engir sérsniðnir límmiðar ennþá.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Staðfesting meðlima';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Veldu hvað meðlimir þurfa að hafa áður en þeir geta sent skilaboð eða DM til samfélagsmeðlima.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Meðlimir með hlutverk geta framhjá þessum athugunum. Fyrir opinbera staði mælum við með að virkja staðfestingu.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Samfélög sem eru skráð í Uppgötvun krefjast að minnsta kosti staðfestrar netfangs. Ekkert er hægt að velja á meðan Uppgötvun er virk.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Þroskað efni og efnisviðvaranir';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Stilltu merkingar á þroskað efni og valfrjálsar efnisviðvaranir fyrir meðlimi.';

  @override
  String get guildSettingsModerationMatureToggle => 'Þroskað efni';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Merktu þetta samfélag sem innihaldandi þroskað efni.';

  @override
  String get guildSettingsVerificationNone => 'Ekkert';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Engin staðfesting er nauðsynleg.';

  @override
  String get guildSettingsVerificationLow => 'Lágt';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Krefst staðfestrar netfangs.';

  @override
  String get guildSettingsVerificationMedium => 'Miðlungs';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Krefst staðfestrar netfangs og reiknings sem er að minnsta kosti 5 mínútna gamall.';

  @override
  String get guildSettingsVerificationHigh => 'Hátt';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Krefst alls í miðlungs, auk þess að vera meðlimur í samfélaginu í að minnsta kosti 10 mínútur.';

  @override
  String get guildSettingsVerificationHighest => 'Mjög hátt';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Krefst staðfestrar símanúmers.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Fylgstu með aðgerðum stjórnenda í samfélaginu.';

  @override
  String get guildSettingsAuditLogEmpty => 'Engin logs ennþá';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Aðgerðir stjórnenda og breytingar á samfélaginu munu birtast hér.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Allir notendur';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Allar aðgerðir';

  @override
  String get guildSettingsAuditLogNoReason => 'Engin ástæða var gefin.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Óþekktur notandi';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Eitthvað fór úrskeiðis við hleðslu á virkniskrá.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Ekki er hægt að hlaða virkniskrár';

  @override
  String get guildSettingsAuditLogReason => 'Ástæða';

  @override
  String get guildSettingsAuditLogSomeone => 'einhver';

  @override
  String get guildSettingsAuditLogSomething => 'eitthvað';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'óþekkt atriði';

  @override
  String get guildSettingsAuditLogNothing => 'ekkert';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Óþekkt markmið';

  @override
  String get auditLogActionGuildUpdate => 'Samfélag uppfært';

  @override
  String get auditLogActionChannelCreate => 'Rás búin til';

  @override
  String get auditLogActionChannelUpdate => 'Rás uppfærð';

  @override
  String get auditLogActionChannelDelete => 'Rás eytt';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Rásar yfirskrift bætt við';

  @override
  String get auditLogActionChannelOverwriteUpdate => 'Rásar yfirskrift uppfærð';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Rásar yfirskrift fjarlægð';

  @override
  String get auditLogActionMemberKick => 'Meðlimur rekinn';

  @override
  String get auditLogActionMemberPrune => 'Meðlimir hreinsaðir';

  @override
  String get auditLogActionMemberBanAdd => 'Meðlimur bannaður';

  @override
  String get auditLogActionMemberBanRemove => 'Meðlimur afbannaður';

  @override
  String get auditLogActionMemberUpdate => 'Meðlimur uppfærður';

  @override
  String get auditLogActionMemberRoleUpdate => 'Hlutverk meðlima uppfærð';

  @override
  String get auditLogActionMemberMove => 'Meðlimur færður';

  @override
  String get auditLogActionMemberDisconnect => 'Meðlimur aftengdur';

  @override
  String get auditLogActionBotAdd => 'Vélmenni bætt við';

  @override
  String get auditLogActionRoleCreate => 'Hlutverk búið til';

  @override
  String get auditLogActionRoleUpdate => 'Hlutverk uppfært';

  @override
  String get auditLogActionRoleDelete => 'Hlutverki eytt';

  @override
  String get auditLogActionInviteCreate => 'Boði stofnað';

  @override
  String get auditLogActionInviteUpdate => 'Boði uppfært';

  @override
  String get auditLogActionInviteDelete => 'Boði eytt';

  @override
  String get auditLogActionWebhookCreate => 'Vefkrjóa stofnuð';

  @override
  String get auditLogActionWebhookUpdate => 'Vefkrjóa uppfærð';

  @override
  String get auditLogActionWebhookDelete => 'Vefkrjóa eytt';

  @override
  String get auditLogActionEmojiCreate => 'Emoji stofnað';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji uppfært';

  @override
  String get auditLogActionEmojiDelete => 'Emoji eytt';

  @override
  String get auditLogActionStickerCreate => 'Klistermiða stofnað';

  @override
  String get auditLogActionStickerUpdate => 'Klistermiða uppfært';

  @override
  String get auditLogActionStickerDelete => 'Klistermiða eytt';

  @override
  String get auditLogActionMessageDelete => 'Skilaboð eytt';

  @override
  String get auditLogActionMessageBulkDelete => 'Skilaboð eytt';

  @override
  String get auditLogActionMessagePin => 'Skilaboð fest';

  @override
  String get auditLogActionMessageUnpin => 'Skilaboð losuð';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor uppfærði stillingar samfélagsins.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor stofnaði rásina $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor uppfærði rásina $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor eyddi rásinni $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor bætti við rásarheimildum fyrir $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor bætti við rásarheimildum fyrir $target í rásinni $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor uppfærði rásarheimildir fyrir $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor uppfærði rásarheimildir fyrir $target í rásinni $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor fjarlægði rásarheimildir fyrir $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor fjarlægði rásarheimildir fyrir $target í rásinni $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor sparkaði $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor bannaði $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor afbannaði $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor uppfærði $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor uppfærði hlutverk fyrir $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor fjarlægði óvirka meðlimi.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor fjarlægði meðlimi sem höfðu verið óvirkir í $days daga.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor flutti $target í aðra raddrás.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor flutti $target í rásina $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor aftengdi $target frá rödd.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor bætti við botninum $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor stofnaði hlutverkið $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor uppfærði hlutverkið $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor eyddi hlutverkinu $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor stofnaði boðið $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor stofnaði boðið $target fyrir rásina $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor uppfærði boðið $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor uppfærði boðið $target fyrir rásina $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor eyddi boðinu $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor eyddi boðinu $target fyrir rásina $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor stofnaði vefkrjóa $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor uppfærði vefkrjóa $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor eyddi vefkrjóa $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor bætti við emojiinu $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor uppfærði emojið $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor eyddi emojiinu $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor bætti við límmiðanum $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor uppfærði límmiðann $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor eyddi límmiðanum $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor eyddi skilaboðum.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor eyddi skilaboðum í $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor eyddi mörgum skilaboðum.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor eyddi $count skilaboðum.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor eyddi mörgum skilaboðum í $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor eyddi $count skilaboðum í $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor festi skilaboð.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor festi skilaboð í $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor losaði skilaboð.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor losaði skilaboð í $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor framkvæmdi aðgerð á $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Uppfærði $field úr $oldValue í $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Stillti $field á $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Hreinsaði $field (var $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Uppfærði $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Endurnefndi samfélagið í $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Uppfærði tákn samfélagsins.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Endurnefndi rásina í $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Hreinsaði umræðuefnið.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Breytti um efni í $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Virkjaði efni fyrir fullorðna.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Afvirkjaði efni fyrir fullorðna.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Setti gælunafn á $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Fjarlægði gælunafn $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Þaggaði meðliminn.';

  @override
  String get auditLogChangeUnmutedMember => 'Afþaggaði meðliminn.';

  @override
  String get auditLogChangeDeafenedMember => 'Gaf meðlimnum heyrnarleysi.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Afneitaði meðlimi heyrnarleysi.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Bætti við $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Fjarlægði $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Rás: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Skilaboð: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Boðið af $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eyddi # skilaboðum.',
      one: 'Eyddi # skilaboðum.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fjarlægði # meðlimi.',
      one: 'Fjarlægði # meðlim.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'Þetta boð rennur aldrei út.';

  @override
  String get auditLogOptionTemporaryMembership => 'Gefur tímabundinn aðgang.';

  @override
  String get auditLogOptionPermanentMembership => 'Gefur varanlegan aðgang.';

  @override
  String get guildSettingsLoadMore => 'Hlaða meira';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Stjórna vekkjurum sem senda skilaboð í rásir.';

  @override
  String get guildSettingsWebhooksEmpty => 'Engir vekkjarar stilltir.';

  @override
  String get guildSettingsCopyUrl => 'Afrita slóð';

  @override
  String get guildSettingsCopiedUrl => 'Slóð afrituð í klemmuspjaldið';

  @override
  String get guildSettingsDeleteWebhook => 'Eyða vekkjara';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Stilltu sérsniðna tengil fyrir þjóninn þinn.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Vista';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Notkun';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count notkun';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Sæktu um að vera á lista í þjónnaskrá.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Þarf að minnsta kosti $count meðlimi til að sækja um.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Umsókn';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Staða';

  @override
  String get guildSettingsDiscoveryCategory => 'Flokkur';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Lýsing';

  @override
  String get guildSettingsDiscoveryTags => 'Merki';

  @override
  String get guildSettingsDiscoveryTagsHint => 'leikir, listir, tónlist';

  @override
  String get guildSettingsDiscoveryApply => 'Senda umsókn';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Afturkalla';

  @override
  String get guildSettingsMembersDescription =>
      'Leitaðu að og stjórnaðu meðlimum þjónsins.';

  @override
  String get guildSettingsMembersSearchHint => 'Leita að meðlimum';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count meðlimir';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Skoðaðu og afturkallaðu virka boðstengla.';

  @override
  String get guildSettingsInvitesEmpty => 'Engin virk boð.';

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
    return '$uses / $maxUses notkun';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Rennur út $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Skoðaðu og stjórnaðu bönnuðum notendum.';

  @override
  String get guildSettingsBansSearchHint => 'Leita að bönnum';

  @override
  String get guildSettingsBansEmpty => 'Engir bannaðir notendur.';

  @override
  String get guildSettingsBanPermanent => 'Varandi bann';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Rennur út $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Rennur út';

  @override
  String get guildSettingsUnban => 'Afturkalla bann';

  @override
  String get guildSettingsBansLoading => 'Hleður bönnuðum notendum';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Engin bönn fundust sem passa við leitina þína.';

  @override
  String get guildSettingsBanDetailsTitle => 'Bannupplýsingar';

  @override
  String get guildSettingsBanViewDetails => 'Skoða upplýsingar';

  @override
  String get guildSettingsBannedOn => 'Bannað þann';

  @override
  String get guildSettingsBannedBy => 'Bannað af';

  @override
  String get guildSettingsRevokeBanTitle => 'Afturkalla bann';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Ertu viss um að þú viljir afturkalla bannið fyrir $displayName? Þeir munu geta komið aftur í samfélagið.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Afturkallað bann fyrir $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Gat ekki hlaðið bönnum. Reyndu aftur.';

  @override
  String get guildSettingsRevokeBanError =>
      'Gat ekki afturkallað bann. Reyndu aftur.';

  @override
  String get guildSettingsCommunitySettings => 'Samfélagsstillingar';

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
      'Stjórnaðu prófíl, rásum og sjálfgefinni stillingum samfélagsins þíns.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Vörumerki';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Uppfærðu táknmynd, nafn, borða og bakgrunn boða';

  @override
  String get guildSettingsOverviewBannerUpload => 'Hlaða upp borða';

  @override
  String get guildSettingsOverviewIdleTitle => 'Aðgerðaleysisstillingar';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Stilltu AFK rás og tímamörk';

  @override
  String get guildSettingsOverviewSystemTitle => 'Kerfi og velkomin';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Veldu áfangastað fyrir kerfis- og velkominskilaboð';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Sjálfgefnar tilkynningar';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Samfélög með yfir 250 manns eru neydd til að nota stillinguna „aðeins tilkynningar“. Upprunalega stillingin þín er varðveitt og verður endurheimt ef samfélagið fer undir 250 meðlimi.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Ítarlegar stillingar';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Leyfa sveigjanlegum textarásarnöfnum';

  @override
  String get guildSettingsOverviewHideOwnerCrown => 'Fela eigendakórinn';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Aðskilinn borði';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Sýnir borðann í eigin hluta fyrir neðan haus samfélagsins.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Hlaða upp tákni';

  @override
  String get guildSettingsOverviewRemoveImage => 'Fjarlægja';

  @override
  String get guildSettingsOverviewSplashTitle => 'Bakgrunnur boðs';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Bakgrunnur innbyggðra skilaboða';

  @override
  String get guildSettingsOverviewEmbedSplashHint => 'Sýnt í boðum í spjalli.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Hlaða upp bakgrunni';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Enginn borði samfélagsins';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Enginn bakgrunnur boðs';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Forskoðun';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Sjáðu hvernig boð þitt lítur út fyrir gesti.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Nöfn textarása';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Eigendakór samfélagsins';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Stilltu hvort kórartáknið sé sýnt við hlið eiganda samfélagsins';

  @override
  String get guildSettingsSplashCardAlignment => 'Staðsetning korts';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Miðja';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Vinstri';

  @override
  String get guildSettingsSplashAlignmentRight => 'Hægri';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Gildir aðeins á breiðum skjám.';

  @override
  String get permissionReadMessageHistory => 'Lesa skilaboðasögu';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Breyta því sem notendur án \"$permission\" geta séð';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Notaðu sérstakan glugga til að setja dagsetningarmörk fyrir skilaboðasögu fyrir meðlimi sem hafa ekki $permission leyfið.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Opna mörk skilaboðasögu';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'Mörk skilaboðasögu';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Virkja mörk skilaboðasögu';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Mörkadagsetning';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Meðlimir án leyfis til að lesa skilaboðasögu geta séð skilaboð sem send voru eftir þessa dagsetningu.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Mörkum skilaboðasögu hefur verið breytt';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Leyfa stóra stafi og bil í nöfnum textarása. Af útilokar nöfn í lágstöfum með bandstrikum og undirstrikum.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Felur kórartáknið við hlið eiganda samfélagsins á öllum stöðum.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animeruð tákn krefjast Animeruð tákn eiginleika samfélagsins.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animeruð borðar krefjast Animeruð borði eiginleika samfélagsins.';

  @override
  String get guildSettingsAfkChannel => 'AFK / biðstöðu rás';

  @override
  String get guildSettingsAfkChannelHint =>
      'Færa meðlimi á þessa rás þegar þeir eru í AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Engin AFK rás';

  @override
  String get guildSettingsAfkTimeout => 'AFK biðtími';

  @override
  String get guildSettingsAfkTimeout1Min => '1 mínúta';

  @override
  String get guildSettingsAfkTimeout5Min => '5 mínútur';

  @override
  String get guildSettingsAfkTimeout15Min => '15 mínútur';

  @override
  String get guildSettingsAfkTimeout30Min => '30 mínútur';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 klukkustund';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekúndur';
  }

  @override
  String get guildSettingsSystemChannel => 'Ákvörðunarás';

  @override
  String get guildSettingsSystemChannelHint =>
      'Velkomin og kerfisskilaboð birtast hér.';

  @override
  String get guildSettingsNoSystemChannel => 'Engin kerfisrás';

  @override
  String get guildSettingsHideJoinMessages => 'Fela skilaboð um tengingu';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Hylur skilaboð um aðgang í ákvörðunarstöð.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Sjálfgefnar tilkynningastillingar';

  @override
  String get guildSettingsNotificationsAll => 'All skilaboð';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Tilkynna um öll skilaboð';

  @override
  String get guildSettingsNotificationsMentions => 'Aðeins nefndir';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Tilkynna aðeins um nefndir';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10MB. Lágmark: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10MB. Lágmark: 960×540px (16:9). Sýnt í boðs-embeds í spjalli.';

  @override
  String get guildSettingsModerationDescription =>
      'Stilltu staðfestingar, efnis síun og stillingar fyrir óviðeigandi efni.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Samfélög sem eru skráð í Uppgötvun hafa takmarkaðar stillingar fyrir eftirlit.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Efnis síun';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Skoðaðu skilaboð sjálfkrafa fyrir óviðeigandi efni í rásum sem ekki eru merktar sem óviðeigandi efni.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Samfélög sem eru skráð í Uppgötvun verða að skanna alla meðlimi. Þessari stillingu er ekki hægt að breyta meðan Uppgötvun er virk.';

  @override
  String get guildSettingsContentFilterOff => 'Af';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Láttu samfélagið sjá um sjálft sig';

  @override
  String get guildSettingsContentFilterNoRole => 'Sía meðlimi án hlutverka';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Mælt með fyrir flest samfélög';

  @override
  String get guildSettingsContentFilterAll => 'Sía alla';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Hámarksvernd fyrir fjölskylduvæna staði';

  @override
  String get guildSettingsModerationMatureOff => 'Af';

  @override
  String get guildSettingsModerationMatureOn => 'Á';

  @override
  String get guildSettingsContentWarningToggle => 'Sýna efnisviðvörun';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Kveikir á samþykkisbeiðni áður en farið er inn í neina rás.';

  @override
  String get guildSettingsContentWarningText => 'Sérsniðinn viðvörunartexti';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Þetta inniheldur viðkvæmt efni.';

  @override
  String get guildSettingsModeration2faTitle => '2FA krafa';

  @override
  String get guildSettingsModeration2faDescription =>
      'Krefjast tveggja þátta auðkenningar fyrir umsjónarmenn áður en þeir geta bannað, rekið, tímabundið lokað eða fjarlægt skilaboð.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Krefjast 2FA fyrir umsjónaraðgerðir';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Aðeins eigandi samfélagsins getur breytt þessari stillingu';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Virkjaðu 2FA á reikningnum þínum til að breyta þessari stillingu';

  @override
  String get guildSettingsEmojiSearchHint => 'Leita að emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Hlaða upp Emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Ekki-animeruð emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animeruð emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Leita að límmiðum';

  @override
  String get guildSettingsWebhooksInfo =>
      'Búðu til vekkróka frá stillingum rásar. Breyttu þeim hér.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Sérsniðna vefslóðin þín mun ekki virka nema að minnsta kosti ein rás sé sýnileg öllum.';

  @override
  String get guildSettingsVanityUrlRemove => 'Fjarlægja';

  @override
  String get guildSettingsBannedUsersTitle => 'Bönnuðir notendur';

  @override
  String get guildSettingsInvitesTableInviter => 'Boðberi';

  @override
  String get guildSettingsInvitesTableChannel => 'Rás';

  @override
  String get guildSettingsInvitesTableCode => 'Kóði';

  @override
  String get guildSettingsInvitesTableUses => 'Notkun';

  @override
  String get guildSettingsInvitesTableCreated => 'Búið til';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'Nýjustu fyrst';

  @override
  String get guildSettingsAuditLogFilterUser => 'Sía eftir notanda';

  @override
  String get guildSettingsAuditLogFilterAction => 'Sía eftir aðgerð';

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
