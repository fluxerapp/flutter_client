// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class FluxerLocalizationsGa extends FluxerLocalizations {
  FluxerLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get reconnectingTitle => 'Rinneamar botán!';

  @override
  String get reconnectingBody =>
      'Tá rud éigin cearr leis na freastalaithe.\nBa chóir é a shocrú i soicind!';

  @override
  String get gatewayReconnectingToast => 'Ag athnascadh…';

  @override
  String get gatewayConnectedToast => 'Ceangailte';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Theip ar thosú: $error';
  }

  @override
  String get retry => 'Déan iarracht arís';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Caillteadh nasc';

  @override
  String get splashViewOnStatusPage => 'Féach ar leathanach stádais';

  @override
  String get splashConnectionIssuesPrompt => 'Fadhbanna nasc?';

  @override
  String get splashStatusPageLink => 'Leathanach stádais';

  @override
  String get splashReadIncident => 'Léigh eachtra';

  @override
  String get splashIncidentHistory => 'Stair eachtraí';

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
  String get welcomeBack => 'Fáilte ar ais';

  @override
  String get email => 'Ríomhphost';

  @override
  String get emailInvalid => 'Seoladh ríomhphoist bailí le do thoil.';

  @override
  String get password => 'Focal faire';

  @override
  String get forgotPassword => 'An ndearna tú dearmad ar do phasfhocal?';

  @override
  String get logIn => 'Logáil isteach';

  @override
  String get logInWithPasskey => 'Logáil isteach le heochair phas';

  @override
  String continueWithSso(String provider) {
    return 'Lean ar aghaidh le $provider';
  }

  @override
  String get ssoRequired =>
      'Tá SSO ag teastáil chun rochtain a fháil ar an instans seo.';

  @override
  String get organizationSsoProvider =>
      'Sínigh isteach le soláthraí singil-sínithe d’eagraíochta.';

  @override
  String get failedToStartSso => 'Theip ar SSO a thosú';

  @override
  String get ssoCancelled => 'Cuireadh isteach SSO ar ceal';

  @override
  String preferSso(String provider) {
    return 'Ar fearr leat úsáid a bhaint as SSO? Lean ar aghaidh le $provider.';
  }

  @override
  String get logInViaBrowser => 'Logáil isteach tríd an mbrabhálaí';

  @override
  String get needAccountPrompt => 'An bhfuil cuntas uait? ';

  @override
  String get register => 'Cláraigh';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Deimhnigh gur duine thú';

  @override
  String get captchaDescription =>
      'Caithfimid a chinntiú nach bhfuil tú i do róbat. Comhlánaigh an fíorú thíos le do thoil.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Fadhbanna? Bain triail as hCaptcha ina ionad sin';

  @override
  String get captchaSwitchToTurnstile =>
      'Bain triail as Turnstile ina ionad sin';

  @override
  String get cancel => 'Cealaigh';

  @override
  String get ipAuthCheckEmail => 'Seiceáil do ríomhphost';

  @override
  String ipAuthDescription(String email) {
    return 'Sheolamar ríomhphost le nasc chun an logáil isteach seo a údarú. Oscail do bhosca isteach le haghaidh $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Caillteadh nasc';

  @override
  String get ipAuthConnectionLostDescription =>
      'Chaill muid an nasc agus muid ag fanacht le húdarú. Bain triail eile as le do thoil.';

  @override
  String get ipAuthLinkExpired => 'D\'éag an nasc sínithe isteach';

  @override
  String get ipAuthLinkExpiredDescription =>
      'D\'éag an nasc údaraithe seo. Sínigh isteach arís le do thoil.';

  @override
  String get ipAuthResendEmail => 'Seol ríomhphost arís';

  @override
  String get ipAuthResent => 'Seolta arís';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Ar ais';

  @override
  String get mfaTitle => 'Dheimhniú dhá fhachtóir';

  @override
  String get mfaChooseMethod => 'Roghnaigh modh fíoraithe';

  @override
  String get mfaMethodTotp => 'Aip Údaraithe';

  @override
  String get mfaMethodWebauthn => 'Eochair Slándála / Eochair Phas';

  @override
  String get mfaTotpDescription =>
      'Cuir isteach an cód 6-dhigití ó d’aip údaraithe nó ceann de do chóid chúltaca.';

  @override
  String get mfaCodeLabel => 'Cód';

  @override
  String get mfaTryAnotherMethod => 'Bain triail as modh eile';

  @override
  String get mfaUseSecurityKey =>
      ' Bain triail as eochair slándála / pasfhocal mar mhalairt';

  @override
  String get accountSelectorTitle => 'Roghnaigh cuntas';

  @override
  String get accountSelectorDescription =>
      'Roghnaigh cuntas chun leanúint ar aghaidh, nó cuir ceann eile leis.';

  @override
  String get accountAdd => 'Cuir cuntas leis';

  @override
  String get accountRemove => 'Bain';

  @override
  String accountRemoveTitle(String username) {
    return 'Bain $username';
  }

  @override
  String get accountRemoveDescription =>
      'Bainfidh sé seo an seisiún sábháilte don chuntas seo.';

  @override
  String get accountRemoveOnlyDescription =>
      'Bainfidh sé seo an t-aon chuntas sábháilte ar an ngléas seo.';

  @override
  String get accountExpired => 'Éagtha';

  @override
  String accountSessionExpired(String identifier) {
    return 'D\'éag an seisiún do $identifier. Logáil isteach arís le do thoil.';
  }

  @override
  String get accountManageTitle => 'Bainistigh cuntais';

  @override
  String get accountSwitchFailed =>
      'Níorbh fhéidir cuntais a athrú. Bain triail eile as.';

  @override
  String get profileTabMenuSwitchAccounts => 'Athraigh cuntais';

  @override
  String get statusChangeSheetTitle => 'Socraigh stádas';

  @override
  String get statusOnlineStatusSection => 'Stádas ar líne';

  @override
  String get statusOnline => 'Ar líne';

  @override
  String get statusIdle => 'Dífhostaithe';

  @override
  String get statusDnd => 'Ná cuir isteach';

  @override
  String get statusInvisible => 'Dofheicthe';

  @override
  String get statusOffline => 'As líne';

  @override
  String get statusUntilIChangeIt => 'Go dtí go n-athróidh mé é';

  @override
  String get statusDontClear => 'Ná glan';

  @override
  String get statusFor10Seconds => 'Ar feadh 10 soicind';

  @override
  String get statusClearAfter10Seconds => '10 soicind';

  @override
  String get statusClearAfter15Minutes => '15 nóiméad';

  @override
  String get statusClearAfter30Minutes => '30 nóiméad';

  @override
  String get statusClearAfter1Hour => '1 uair an chloig';

  @override
  String get statusClearAfter3Hours => '3 uair an chloig';

  @override
  String get statusClearAfter4Hours => '4 uair an chloig';

  @override
  String get statusClearAfter8Hours => '8 n-uaire';

  @override
  String get statusClearAfter24Hours => '24 uair an chloig';

  @override
  String get statusClearAfter3Days => '3 lá';

  @override
  String get statusDndDescription => 'Ní bhfaighidh tú fógraí ar an deasc';

  @override
  String get statusInvisibleDescription => 'Beidh tú le feiceáil as líne';

  @override
  String get customStatusSetTitle => 'Socraigh stádas saincheaptha';

  @override
  String get customStatusCurrentHint => 'Stádas saincheaptha';

  @override
  String get customStatusClear => 'Glan stádas saincheaptha';

  @override
  String get customStatusPlaceholder => 'Cad atá ar siúl?';

  @override
  String get customStatusChooseEmoji => 'Roghnaigh emoji';

  @override
  String get customStatusClearAfter => 'Glan tar éis';

  @override
  String get customStatusSave => 'Sábháil';

  @override
  String get accountActive => 'Cuntas gníomhach';

  @override
  String get signOut => 'Sínigh amach';

  @override
  String get suspendedPermanentTitle => 'Cuntas Ar Fionraí Go Buan';

  @override
  String get suspendedTemporaryTitle => 'Cuntas Ar Fionraí';

  @override
  String get suspendedPermanentDescription =>
      'Tá do chuntas ar fionraí go buan mar gheall ar shárú ar ár dTéarmaí Seirbhíse.';

  @override
  String get suspendedTemporaryDescription =>
      'Tá do chuntas ar fionraí go sealadach. Beidh tú in ann rochtain a fháil ar do chuntas nuair a bheidh an tréimhse fionraí thart.';

  @override
  String get suspendedIssuedAt => 'Eisíodh';

  @override
  String get suspendedEndsAt => 'Críochnaíonn';

  @override
  String get suspendedDuration => 'Ré';

  @override
  String get suspendedPermanent => 'Buan';

  @override
  String get suspendedReason => 'Cúis';

  @override
  String get suspendedAppealDeadline => 'Spriocdháta Achomhairc';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Tá do chuntas sceidealta le scriosadh ar $date.';
  }

  @override
  String get suspendedRecheck => 'Seiceáil le haghaidh Nuashonruithe';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Seiceáil arís i ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Ar ais go dtí Logáil Isteach';

  @override
  String get suspendedAppealTitle => 'Achomharc';

  @override
  String get suspendedAppealHint =>
      'Mínigh cén fáth ar chóir athbhreithniú a dhéanamh ar do phionós (íosmhéid 50 carachtar)...';

  @override
  String get suspendedAppealSubmit => 'Seol Achomharc';

  @override
  String get suspendedAppealPending => 'Ag Feitheamh ar Athbhreithniú';

  @override
  String get suspendedAppealAccepted => 'Achomharc Glactha';

  @override
  String get suspendedAppealRejected => 'Achomharc Diúltaithe';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Glacadh le d\'achomharc agus cuireadh do chuntas ar ais.';

  @override
  String get suspendedSignIn => 'Sínigh Isteach i Do Chuntas';

  @override
  String get forgotPasswordTitle => 'Dearmad ar do phasfhocal?';

  @override
  String get forgotPasswordDescription =>
      'Iontrálann do sheoladh ríomhphoist agus seolfaimid nasc chugat chun do phasfhocal a athshocrú.';

  @override
  String get forgotPasswordSubmit => 'Seol nasc athshocraithe';

  @override
  String get forgotPasswordSentTitle => 'Seiceáil do ríomhphost';

  @override
  String get forgotPasswordSentDescription =>
      'Tá treoracha athshocraithe phasfhocail seolta againn chuig do sheoladh ríomhphoist. Seiceáil do bhosca isteach agus lean an nasc chun do phasfhocal a athshocrú.';

  @override
  String get forgotPasswordBackToLogin => 'Fill ar logáil isteach';

  @override
  String get resetPasswordTitle => 'Socrú pasfhocal nua';

  @override
  String get resetPasswordDescription =>
      'Iontrálann do phasfhocal nua thíos chun an próiseas athshocraithe a chríochnú.';

  @override
  String get resetPasswordNewPassword => 'Pasfhocal nua';

  @override
  String get resetPasswordConfirm => 'Deimhnigh pasfhocal nua';

  @override
  String get resetPasswordSubmit => 'Athshocraigh pasfhocal';

  @override
  String get resetPasswordMismatch => 'Ní mheaitseálann na pasfhocail.';

  @override
  String get registerTitle => 'Cruthaigh cuntas';

  @override
  String get registerDisplayName => 'Ainm Taispeána (Roghnach)';

  @override
  String get registerDisplayNameHint =>
      'Cad ba chóir a thabhairt ar dhaoine ort?';

  @override
  String get registerUsername => 'Úsáideoir (Roghnach)';

  @override
  String get registerUsernameHint =>
      'Fág folamh le haghaidh úsáideoir randamach';

  @override
  String get registerUsernameTagHint =>
      'Cuirfear clib 4-dhigit leis go huathoibríoch chun uathúlacht a chinntiú';

  @override
  String get registerDateOfBirth => 'Dáta breithe';

  @override
  String get registerMonth => 'Mí';

  @override
  String get registerDay => 'Lá';

  @override
  String get registerYear => 'Bliain';

  @override
  String get registerConsent =>
      'Aontaím leis na Téarmaí Seirbhíse agus an Polasaí Príobháideachta';

  @override
  String get registerConsentPrefix => 'Aontaím leis na ';

  @override
  String get registerConsentTerms => 'Téarmaí Seirbhíse';

  @override
  String get registerConsentAnd => ' agus ';

  @override
  String get registerConsentPrivacy => 'Polasaí Príobháideachta';

  @override
  String get registerConfirmPassword => 'Deimhnigh Pasfhocal';

  @override
  String get registerSubmit => 'Cruthaigh cuntas';

  @override
  String get registerHaveAccount => 'An bhfuil cuntas agat cheana féin? ';

  @override
  String get passkeyNoCredentials =>
      'Ní bhfuarthas aon phasfhocal don aip seo. Logáil isteach le ríomhphost agus pasfhocal ina ionad sin.';

  @override
  String get passkeyDeviceNotSupported =>
      'Ní thacaítear le pasfhocail ar an bhfeiste seo.';

  @override
  String get passkeyDomainNotAssociated =>
      'Níl pasfhocail cumraithe don aip seo. Logáil isteach le ríomhphost agus pasfhocal ina ionad sin.';

  @override
  String get passkeyTimeout =>
      'Tháinig deireadh le hamú pasfhocal. Bain triail eile as le do thoil.';

  @override
  String get passkeyNotAvailable =>
      'Níl pasfhocail ar fáil don aip seo. Logáil isteach le ríomhphost agus pasfhocal ina ionad sin.';

  @override
  String get passkeyFailed => 'The paschlíochán teip. Bain triail eile as.';

  @override
  String get errorUnableToCreateAccount =>
      'Ní féidir cuntas a chruthú. Bain triail eile as.';

  @override
  String get errorUnableToSignIn =>
      'Ní féidir logáil isteach faoi láthair. Bain triail eile as.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Ríomhphost nó pasfhocal neamhbhailí.';

  @override
  String get errorUnableToSendResetLink =>
      'Ní féidir nasc athshocraithe a sheoladh. Bain triail eile as.';

  @override
  String get errorUnableToResetPassword =>
      'Ní féidir an focal faire a athshocrú. Bain triail eile as.';

  @override
  String get embedInviteJoin => 'Ceangail leis an bpobal';

  @override
  String get embedInviteGoTo => 'Téigh go dtí an pobal';

  @override
  String embedInviteOnline(String count) {
    return '$count Ar líne';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Ball';
  }

  @override
  String get embedInviteUnknownTitle => 'Cuireadh Anaithnid';

  @override
  String get embedInviteUnknownSubtitle =>
      'Bain triail as cuireadh nua a iarraidh.';

  @override
  String get embedInviteUnavailable => 'Cuireadh ar fáil';

  @override
  String get inviteAcceptTitle => 'Tá cuireadh faighte agat chun teacht';

  @override
  String get inviteAcceptJoinButton => 'Ceangail leis an bpobal';

  @override
  String get inviteAcceptGoToButton => 'Téigh go dtí an pobal';

  @override
  String get inviteAcceptInvitesPaused => 'Cuirí ar fionraí';

  @override
  String get inviteAcceptNotFoundTitle => 'Cuireadh neamhbhailí';

  @override
  String get inviteAcceptNotFoundDescription =>
      'D\'fhéadfadh an cuireadh seo a bheith imithe in éag nó neamhbhailí.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Ceangail leis an ngrúpa';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Tá cuireadh faighte agat chun grúpa comhrá príobháideach a cheangal le $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'duine éigin';

  @override
  String get inviteAcceptEmojiPack => 'Pacáiste Greamáin';

  @override
  String get inviteAcceptStickerPack => 'Pacáiste Greamáin';

  @override
  String get inviteAcceptInstallEmojiPack => 'Suiteáil an pacáiste greamáin';

  @override
  String get inviteAcceptInstallStickerPack => 'Suiteáil an pacáiste greamáin';

  @override
  String get inviteAcceptPackInstallNote =>
      'Suiteálfar an pacáiste go huathoibríoch nuair a ghlacann tú leis an gcuireadh seo.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Diúltaíodh rochtain ar an gcainéal';

  @override
  String get channelAccessDeniedDescription =>
      'Níl rochtain agat ar an gcainéal inar seoladh an teachtaireacht seo.';

  @override
  String get messageJumpLinkNoAccess => 'Gan rochtain';

  @override
  String get okay => 'Ceart go leor';

  @override
  String get embedThemeTitle => 'Téama comhroinnte';

  @override
  String get embedThemeSubtitle =>
      'Ní thacaíonn an cliant seo le téamaí saincheaptha.';

  @override
  String get embedThemeUnavailableButton => 'Téamaí ar fáil';

  @override
  String get privacySettings => 'Socruithe Príobháideachta';

  @override
  String get privacyDirectMessages => 'Teachtaireachtaí Príobháideacha';

  @override
  String get privacyDirectMessagesDescription =>
      'Ceadaigh teachtaireachtaí príobháideacha ó bhaill eile sa phobal seo';

  @override
  String get privacyBotDirectMessages => 'Teachtaireachtaí Príobháideacha Bot';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Ceadaigh do bhotaí ón bpobal seo teachtaireachtaí príobháideacha a sheoladh chugat';

  @override
  String get privacyMutualDmsDisabled =>
      'Tá cosc curtha ag riarthóirí an phobail ar theachtaireachtaí príobháideacha a fháil ó bhaill a bhfuil aithne acu orthu sa phobal seo amháin.';

  @override
  String get communityDebug => 'Dífhabhtú Pobail';

  @override
  String get copiedToClipboard => 'Cóipeáladh chuig an ngearrthaisce';

  @override
  String get notificationSettings => 'Socruithe Fógraí';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Balbhaigh $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Má bhalbhaíonn tú pobal, ní bheidh táscairí gan léamh ná fógraí le feiceáil mura luaitear thú.';

  @override
  String get notificationCommunitySettings => 'Socruithe Fógraí Pobail';

  @override
  String get notificationAllMessages => 'Gach Teachtaireacht';

  @override
  String get notificationOnlyMentions => 'Luaigh Amháin';

  @override
  String get notificationNothing => 'Ní dhéanfar aon rud';

  @override
  String get notificationSuppressEveryone => 'S বায়ú @gach duine agus @anseo';

  @override
  String get notificationSuppressRoles => 'Cealaigh Gach Lua @Ról';

  @override
  String get notificationMobilePush => 'Fógraí Brú Ar Soghluaiste';

  @override
  String get notificationOverrides => 'Sáruithe Fógra';

  @override
  String get notificationSelectChannel => 'Roghnaigh cainéal nó catagóir';

  @override
  String get notificationOnlyAtMentions => 'Nod@anna Amháin';

  @override
  String get notificationMuteChannel => 'Balbhaigh Cainéal';

  @override
  String get notificationUnmuteChannel => 'Díbalbhain Cainéal';

  @override
  String get notificationNoCategory => 'Gan Catagóir';

  @override
  String get dmMarkAsRead => 'Marcáil mar Léite';

  @override
  String get dmMuteConversation => 'Balbhaigh DM';

  @override
  String get dmUnmuteConversation => 'Díbalbhain DM';

  @override
  String get dmPinDm => 'Greamán DM';

  @override
  String get dmUnpinDm => 'Díghreamán DM';

  @override
  String get dmAlwaysShowInSidebar => 'Taispeáin I gcónaí sa Bharra Taoibh';

  @override
  String get dmRemoveFromAlwaysShown => 'Bain as Taispeántas I gcónaí';

  @override
  String get dmCloseDm => 'Dún DM';

  @override
  String get dmCloseDmConfirmTitle => 'Dún DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'An bhfuil tú cinnte gur mian leat do DM le $username a dhúnadh? Is féidir leat é a athoscailt i gcónaí níos déanaí.';
  }

  @override
  String get dmCopyChannelId => 'Cóipeáil ID Cainéal';

  @override
  String get dmChannelIdCopied => 'Cóipeáladh ID Cainéal';

  @override
  String get dmCopyUserId => 'Cóipeáil ID Úsáideora';

  @override
  String get dmUserIdCopied => 'Cóipeáladh ID Úsáideora';

  @override
  String get dmViewProfile => 'Féach Próifíl';

  @override
  String get dmVoiceCall => 'Tosaigh Glao Guth';

  @override
  String get incomingVoiceCallTitle => 'Glao guth isteach';

  @override
  String get incomingVoiceCallAccept => 'Glac';

  @override
  String get incomingVoiceCallDecline => 'Diúltaigh';

  @override
  String get incomingVoiceCallLabel => 'Glao isteach';

  @override
  String get incomingVoiceCallIgnore => 'Déan neamhaird';

  @override
  String get directVoiceCallNotEligible =>
      'Ní féidir an glao seo a thosú faoi láthair. Bain triail eile as i gceann nóiméid.';

  @override
  String get voiceJoinCallFailed =>
      'Níorbh fhéidir ceangal leis an nglao seo. Seiceáil do nasc agus bain triail eile as.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Níorbh fhéidir an glao seo a nascadh. Seiceáil do nasc agus bain triail eile as.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Níorbh fhéidir an glao seo a nuashonrú ar an bhfreastalaí. Seiceáil do nasc agus bain triail eile as.';

  @override
  String get dmAddNote => 'Cuir Nóta Leis';

  @override
  String get dmEditGroup => 'Cuir Grúpa in Eagar';

  @override
  String get dmInviteToCommunity => 'Tairg Comhaltas';

  @override
  String get dmBlock => 'Cuir Bloc';

  @override
  String get dmLeaveGroup => 'Fág Grúpa';

  @override
  String get dmNoCommunitiesAvailable => 'Níl comhaltais ar fáil';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Comhaltaí';
  }

  @override
  String get dmMuteFor15Min => 'Ar feadh 15 nóiméad';

  @override
  String get dmMuteFor30Min => 'Ar feadh 30 nóiméad';

  @override
  String get dmMuteFor1Hour => 'Ar feadh 1 uair';

  @override
  String get dmMuteFor3Hours => 'Ar feadh 3 huaire';

  @override
  String get dmMuteFor4Hours => 'Ar feadh 4 huaire';

  @override
  String get dmMuteFor8Hours => 'Ar feadh 8 n-uaire';

  @override
  String get dmMuteFor24Hours => 'Ar feadh 24 uair';

  @override
  String get dmMuteFor3Days => 'Ar feadh 3 lá';

  @override
  String get dmMuteForever => 'Go dtí go n-athróidh mé ar ais é';

  @override
  String get dmPinGroupDm => 'Greamán Grúpa DM';

  @override
  String get dmUnpinGroupDm => 'Díbhlocáil DM Grúpa';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Nóta DM';

  @override
  String get dmUnfavoriteDm => 'Bain Nóta DM';

  @override
  String get dmFavoriteGroupDm => 'Nóta DM Grúpa';

  @override
  String get dmUnfavoriteGroupDm => 'Bain Nóta DM Grúpa';

  @override
  String get dmChangeFriendNickname => 'Athraigh Leasainm Cara';

  @override
  String get dmRemoveFriend => 'Bain Cara';

  @override
  String get dmAddFriend => 'Cuir Cara leis';

  @override
  String get dmAcceptFriendRequest => 'Glac le hiarratas cara';

  @override
  String get dmIgnoreFriendRequest => 'Déan neamhaird d\'iarratas cara';

  @override
  String get dmFriendRequestSent => 'Seoladh iarratas cara';

  @override
  String get dmUnblock => 'Díbhlocáil';

  @override
  String get dmDebugUser => 'Deaschódáil Úsáideoir';

  @override
  String get dmDebugChannel => 'Deaschódáil Cainéal';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'DM faoi ghlas';

  @override
  String get dmUnpinned => 'DM gan ghlas';

  @override
  String get dmMuted => 'DM balbhaithe';

  @override
  String get dmUnmuted => 'DM díbhailbhaithe';

  @override
  String get dmRemoveFriendConfirmTitle => 'Bain Cara';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'An bhfuil tú cinnte gur mian leat $username a bhaint mar chara?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blocáil Úsáideoir';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'An bhfuil tú cinnte gur mian leat $username a bhlocáil? Ní bheidh siad in ann teachtaireacht a chur chugat nó iarratais cara a sheoladh chugat.';
  }

  @override
  String get dmFriendRequestSentToast => 'Seoladh iarratas cara';

  @override
  String get dmFriendRequestFailed => 'Teip ar iarratas cara a sheoladh';

  @override
  String get dmAcceptFriendRequestFailed => 'Teip ar iarratas cara a ghlacadh';

  @override
  String get dmRemoveFriendFailed => 'Teip ar chara a bhaint';

  @override
  String get dmBlockFailed => 'Teip ar úsáideoir a bhlocáil';

  @override
  String get dmUnblockFailed => 'Teip ar úsáideoir a dhíbhlocáil';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Teip ar iarratas cara a dhéanamh neamhaird';

  @override
  String get dmAddFriends => 'Cuir cairde leis';

  @override
  String get addFriendSheetTitle => 'Cuir cara leis';

  @override
  String get addFriendUsernameHint => 'Ainm úsáideora#0000';

  @override
  String get addFriendUsernameLabel => 'Ainm úsáideora an chara';

  @override
  String get addFriendSendRequest => 'Seol iarratas';

  @override
  String get addFriendNoUserFound =>
      'Ní bhfuarthas aon úsáideoir leis an ainm úsáideora sin.';

  @override
  String get addFriendInvalidUsername =>
      'Cuir isteach ainm úsáideora bailí (Ainm úsáideora#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Seoladh iarratas cara';

  @override
  String get addFriendClaimTitle => 'Faigh do chuntas';

  @override
  String get addFriendClaimDescription =>
      'Faigh do chuntas chun iarratais cara a sheoladh.';

  @override
  String get addFriendVerifyTitle => 'Fíoraigh do ríomhphost';

  @override
  String get addFriendVerifyDescription =>
      'Ní mór duit do sheoladh ríomhphoist a fhíorú sula mbeidh tú in ann iarratais cara a sheoladh.';

  @override
  String get addFriendVerifyEmail => 'Fíoraigh ríomhphost';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Iarratais cara ag teacht isteach ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Iarratais cara ag dul amach ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Iarratas cara ag teacht isteach';

  @override
  String get addFriendOutgoingStatus => 'Seoladh iarratas cara';

  @override
  String get addFriendViewProfile => 'Féach ar phróifíl';

  @override
  String get addFriendAccept => 'Glac leis';

  @override
  String get addFriendIgnore => 'Déan neamhaird';

  @override
  String get addFriendAcceptTitle => 'Glac le hiarratas cara';

  @override
  String get addFriendIgnoreTitle => 'Déan neamhaird d\'iarratas cara';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'An nglacfar an t-iarratas cara ó $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'An ndéanfar neamhaird den iarratas cara ó $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Cealaigh iarratas';

  @override
  String get addFriendCancelRequestFailed =>
      'Níorbh fhéidir an t-iarratas cara a chealú. Bain triail eile as.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Níl siad ag glacadh le hiarratais cara faoi láthair.';

  @override
  String get addFriendUnblockFirst =>
      'Díbhlocáil iad ar dtús chun iarratas cara a sheoladh.';

  @override
  String get addFriendCannotSendToSelf =>
      'Ní féidir leat iarratas cara a sheoladh chugat féin.';

  @override
  String get addFriendAlreadyFriends =>
      'Tá sibh i bhur gcairde cheana féin leis an úsáideoir seo.';

  @override
  String get addFriendClaimToSend =>
      'Críochnaigh clárú chun iarratais cara a sheoladh.';

  @override
  String get addFriendSendFailedGeneric =>
      'Níorbh fhéidir an t-iarratas cara a sheoladh. Bain triail eile as.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Córas';

  @override
  String get emojiSearchPlaceholder => 'Faigh an emoji de do bhrionglóidí';

  @override
  String get emojiSearchEmpty => 'Ní thagann aon emojis le do chuardach';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji réamhshocraithe';

  @override
  String get emojiFrequentlyUsed => 'Úsáidtear go minic';

  @override
  String get emojiTabGifs => 'GIFanna';

  @override
  String get emojiTabMedia => 'Meáin';

  @override
  String get emojiTabStickers => 'Greamáin';

  @override
  String get emojiTabEmojis => 'Emojis';

  @override
  String get gifPickerSearch => 'Cuardaigh GIFanna';

  @override
  String get gifPickerSearchKlipy => 'Cuardaigh KLIPY';

  @override
  String get gifPickerSearchTenor => 'Cuardaigh Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Roghanna Móra';

  @override
  String get gifPickerTrending => 'GIFanna Treallach';

  @override
  String get gifPickerNoResultsTitle => 'Gan Torthaí Cuardaigh';

  @override
  String get gifPickerNoResultsDescription =>
      'Bain triail as téarma cuardaigh eile';

  @override
  String get gifPickerLoadFailedTitle => 'Níorbh fhéidir GIFanna a luchtú';

  @override
  String get gifPickerLoadFailedBody =>
      'Seiceáil do nasc agus bain triail eile as.';

  @override
  String get emojiCategoryPeople => 'Daoine & Gáirí';

  @override
  String get emojiCategoryNature => 'Ainmhithe & Nádúr';

  @override
  String get emojiCategoryFood => 'Bia & Deoch';

  @override
  String get emojiCategoryActivity => 'Gníomhaíochtaí';

  @override
  String get emojiCategoryTravel => 'Taisteal & Áiteanna';

  @override
  String get emojiCategoryObjects => 'Rudaí';

  @override
  String get emojiCategorySymbols => 'Siombailí';

  @override
  String get emojiCategoryFlags => 'Bratacha';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Díghlasáil $emojiCount ó $communityCount le Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Faigh Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Ná taispeáin seo arís';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emojis saincheaptha',
      one: '1 emoji saincheaptha',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pobail',
      one: '1 pobal',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Rabhadh Nasc Seachtrach';

  @override
  String get externalLinkWarningLeaving => 'Tá tú ar tí Fluxer a fhágáil';

  @override
  String get externalLinkWarningDescription =>
      'Is féidir le naisc sheachtracha a bheith contúirteach. Bí cúramach le do thoil.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL ceann scríbe:';

  @override
  String get externalLinksSectionTitle => 'Naisc Sheachtracha';

  @override
  String get externalLinksSectionDescription =>
      'Cumraigh conas a láimhseáiltear rabhaillí nasc seachtrach.';

  @override
  String get externalLinkWarningTrustPrefix => 'Bí muinín i gcónaí as ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — scipeáil an rabhadh seo an chéad uair eile';

  @override
  String get externalLinkVisitSite => 'Tabhair Cuairt ar Láithreán';

  @override
  String get externalLinkTrustAllLabel => 'Iontaobhas le gach nasc seachtrach';

  @override
  String get externalLinkStripTrackingLabel =>
      'Bain paraiméadair rianaithe ó URLanna';

  @override
  String get externalLinkStripTrackingDescription =>
      'Bain paraiméadair rianaithe (cosúil le utm_source, fbclid, gclid) go huathoibríoch ó URLanna i dteachtaireachtaí a sheolann tú. Glanann sé an nasc sula sroicheann sé aon duine eile.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Iontaobhas le gach nasc seachtrach?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Cuirfidh sé seo muinín i ngach nasc seachtrach agus scipeálfaidh sé an rabhadh do gach fearann. Cuirfear do chuid fearann iontaofa reatha ar ceal. Tá sé seo níos lú slán.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Iontaobhas Le Gach Ceann';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Stop ag cur muinín i ngach nasc?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Taispeánfar rabhaillí naisc sheachtraigh arís. Beidh ort fearainn iontaofa a chur leis ina n-aonair.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Díchumasaigh Iontaobhas Le Gach Ceann';

  @override
  String get externalLinkTrustedAllDescription =>
      'Tá muinín ag gach nasc seachtrach. Ní thaispeánfar rabhaillí.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Tá $count fearann iontaofa agat. Cuir níos mó leis trí tic a chur sa bhosca nuair a thugann tú cuairt ar naisc sheachtracha.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Nuair a bheidh sé cumasaithe, ní thaispeánfar aon rabhaillí naisc sheachtraigh. Tá sé seo níos lú slán.';

  @override
  String get imageFileTooLarge =>
      'Tá comhad na híomhá ró-mhór. Roghnaigh comhad níos lú ná 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Teastaíonn Plutonium ó avatars beoite';

  @override
  String get animatedBannersRequirePlutonium =>
      'Teastaíonn Plutonium ó bhratacha beoite';

  @override
  String get animatedAvifNotSupported => 'Ní thacaítear le AVIF beoite';

  @override
  String get animatedAvifNotSupportedBody =>
      'Ní thacaítear le comhaid AVIF beoite a ghearradh agus a rothlú go fóill. Má leanann tú ar aghaidh, uaslódálfar é ina fhoirm bhunaidh.';

  @override
  String get uploadAsIs => 'Uaslódáil Mar Atá';

  @override
  String get croppingAnimatedNotSupported =>
      'Ní thacaítear le híomhánna beoite a ghearradh go fóill. Úsáidfear an t-uaslódáil bunaidh.';

  @override
  String get cropAvatar => 'Gearr Avatar';

  @override
  String get cropBanner => 'Gearr Bratach';

  @override
  String get skip => 'Scip';

  @override
  String get crop => 'Gearr';

  @override
  String get changeYourFluxerTag => 'Athraigh Do FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Ní féidir le hainmneacha úsáideoirí ach litreacha (a-z, A-Z), uimhreacha (0-9), agus poncanna (underscore) a bheith iontu. Tá ainmneacha úsáideoirí neamh-íogair ó thaobh cás de.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Ní féidir le hainmneacha úsáideoirí ach litreacha (a-z, A-Z), uimhreacha (0-9), agus poncanna (underscore) a bheith iontu. Tá ainmneacha úsáideoirí neamh-íogair ó thaobh cás de. Is féidir leat aon chlib 4-dhigit atá ar fáil a roghnú ó #0000 go #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Ní féidir le hainmneacha úsáideoirí ach litreacha (a-z, A-Z), uimhreacha (0-9), agus poncanna (underscore) a bheith iontu. Tá ainmneacha úsáideoirí neamh-íogair ó thaobh cás de. Is féidir leat aon chlib 4-dhigit atá ar fáil a roghnú ó #0001 go #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Idir $min agus $max carachtar';
  }

  @override
  String get validationAllowedChars =>
      'Litreacha (a-z, A-Z), uimhreacha (0-9), agus poncanna (_) amháin';

  @override
  String get discriminatorPremiumTooltip =>
      'Faigh Plutonium chun do chlib a shaincheapadh nó coinnigh é nuair a athraíonn tú d\'ainm úsáideora';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag Tógtha Cheana Féin';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Tá an FluxerTag $username#$discriminator tógtha cheana féin. Má leanann tú ar aghaidh, déanfar do dhíograitheoir a athrollú go huathoibríoch.';
  }

  @override
  String get customTagIsTemporary => 'Is Sealadach an Chlib Saincheaptha';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Níl do chlib 4-dhigit saincheaptha ar fáil ach fad is atá do shíntiús Plutonium gníomhach. Nuair a thiocfaidh deireadh le do shíntiús ar $date, fillfidh do chlib ar uimhir randamach tar éis tréimhse grásta 3 lá.';
  }

  @override
  String get customTagTemporaryBody =>
      'Níl do chlib 4-dhigit saincheaptha ar fáil ach fad is atá do shíntiús Plutonium gníomhach. Nuair a thiocfaidh deireadh le do shíntiús, fillfidh do chlib ar uimhir randamach tar éis tréimhse grásta 3 lá.';

  @override
  String get iUnderstandContinue => 'Tuigim, Lean Ar Aghaidh';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Má shábhálann tú an FluxerTag seo, fillfidh do chlib 4-dhigit saincheaptha ar uimhir randamach nuair a bheidh deireadh le do shíntiús Plutonium. Má theipeann ar do shíntiús athnuachan, beidh tréimhse grásta 3 lá agat sula n-athróidh an chlib.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Tá do chlib 4-dhigit saincheaptha (#$discriminator) gníomhach fad is atá do shíntiús Plutonium gníomhach. Má chríochnaíonn do shíntiús nó má theipeann air athnuachan tar éis tréimhse grásta 3 lá, fillfidh do chlib ar uimhir randamach.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Saincheap do chlib 4-dhigit nó coinnigh é nuair a athraíonn tú d\'ainm úsáideora';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Tiocfaidh do thriail Plutonium chun deiridh ar $date. Uasghrádaigh chun do chlib saincheaptha a choinneáil agus chun comhartha ar do phróifíl a thuilleamh.';
  }

  @override
  String get premiumTrialActive =>
      'Tá tú ar thriail Plutonium. Uasghrádaigh chun do chlib saincheaptha a choinneáil agus chun comhartha ar do phróifíl a thuilleamh.';

  @override
  String get fluxerTagUpdated => 'FluxerTag Nuashonraithe';

  @override
  String get fluxerTagUpdateFailed =>
      'Teip ar FluxerTag a nuashonrú. Bain triail as arís.';

  @override
  String get continueAction => 'Lean Ar Aghaidh';

  @override
  String get profileCustomizationTitle => 'Saincheapadh Próifíle';

  @override
  String get profileCustomizationDescription =>
      'Cuir cuma do phróifíle in eagar agus féach réamhamharc beo';

  @override
  String get usernameLabel => 'Ainm Úsáideora';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Éiligh do chuntas chun do FluxerTag a athrú';

  @override
  String get changeFluxerTag => 'Athraigh FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Saincheap do 4-dhigit tag (#$discriminator) mar is mian leat le Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Athraigh d\'ainm úsáideora agus do 4-dhigit tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Tá do 4-dhigit tag féin (#$discriminator) ceangailte le do shíntiús Plutonium agus fillfidh sé ar thag randamach má théann sé in éag.';
  }

  @override
  String get displayNameLabel => 'Ainm Taispeána';

  @override
  String get pronounsLabel => 'Forainmneacha';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Athraigh Avatar';

  @override
  String get removeAvatar => 'Bain Avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Uasmhéid 10MB. Molta: 512×512px';

  @override
  String get bannerLabel => 'Bratach';

  @override
  String get changeBanner => 'Athraigh Bratach';

  @override
  String get removeBanner => 'Bain Bratach';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Uasmhéid 10MB. Íosmhéid: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Dath Aiceanta';

  @override
  String get accentColorDescription =>
      'Saincheapann sé an teorainn agus dath na brataí ar do phróifíl';

  @override
  String get aboutMeLabel => 'Fúm féin';

  @override
  String get aboutMeHelperText =>
      'Is féidir leat naisc, emoji, agus Markdown a úsáid.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Príobháideacht Bhaiste Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Rialú conas a thaispeántar do bhaiste Plutonium do dhaoine eile';

  @override
  String get hidePlutoniumBadgeLabel => 'Folaigh baiste Plutonium go hiomlán';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Folaigh do bhaiste Plutonium go hiomlán ó úsáideoirí eile';

  @override
  String get hidePlutoniumPurchaseDate => 'Folaigh dáta ceannaigh Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Folaigh dáta ceannaigh Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Bain an t-am ar cheannaigh tú Plutonium den chéad uair ó do bhaiste';

  @override
  String get maskVisionaryAsSubscription => 'Maslaigh Visionary mar shíntiús';

  @override
  String get maskVisionaryDescription =>
      'Taispeáin do Visionary mar shíntiús rialta ina ionad sin';

  @override
  String get hideVisionaryIdBadge => 'Folaigh baiste ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Folaigh baiste ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Bain do bhaiste ID Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Tá tú ar thriail Plutonium — tosóidh do shíntiús ar $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Cuirfear tús go huathoibríoch le do shíntiús nuair a chríochnóidh do thriail. Ní gá aon ghníomh.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Tá tú ar thriail Plutonium a chríochnaíonn ar $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Tá tú ar thriail Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Uasmhéid 10MB. Molta: 512×512px. Teastaíonn Plutonium le haghaidh avatars beoite (GIF).';

  @override
  String get bannerPlutoniumUpsell =>
      'Saincheap do phróifíl le híomhá bratach statach nó beoite chun í a dhéanamh seasamh amach.';

  @override
  String get getPlutonium => 'Faigh Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Níl ceannacháin in-app ar fáil ar an ardán seo fós. Fan go dlúth — ag teacht go luath!';

  @override
  String get profilePreviewLabel => 'Réamhamharc';

  @override
  String get profilePreviewMessage => 'Teachtaireacht';

  @override
  String get profilePreviewMemberSince => 'Ball Fluxer Ó';

  @override
  String get unclaimedAccountTitle => 'Cuntas Neamh-éilithe';

  @override
  String get unclaimedAccountDescription =>
      'Níl do chuntas éilithe fós. Gan ríomhphost agus pasfhocal, d’fhéadfá rochtain a chailleadh. Éiligh do chuntas anois chun é a dhaingniú.';

  @override
  String get claimAccount => 'Éiligh Cuntas';

  @override
  String get profileTypeLabel => 'Cineál Próifíle';

  @override
  String get profileTypeGlobal => 'Próifíl Dhomhanda';

  @override
  String get profileTypeGuildDescription =>
      'Tá tú ag cur in eagar do phróifíl in aghaidh an phobail. Ní bheidh an phróifíl seo infheicthe ach sa phobal seo agus beidh sí ag sárú do phróifíl dhomhanda.';

  @override
  String get communityNicknameLabel => 'Leasainm an Phobail';

  @override
  String get perGuildPremiumUpsellText =>
      'Éilíonn Míotóireacht do phróifíl, do bhratach, do dhath accent, agus do bheathaisnéis do phobail aonair. Is saor in aisce do gach duine ainm comharthaíochta an phobail agus forainmneacha.';

  @override
  String get avatarModeInherit => 'Úsáid Próifíl Dhomhanda';

  @override
  String get avatarModeCustom => 'Úsáid Íomhá Saincheaptha';

  @override
  String get avatarModeUnset => 'Ná Taispeáin';

  @override
  String get profileSavedToast => 'Próifíl nuashonraithe';

  @override
  String get profileEditButton => 'Cuir Próifíl in Eagar';

  @override
  String get profileNoteLabel => 'Nóta';

  @override
  String get profileNoteVisibility => '(infheicthe duitse amháin)';

  @override
  String get profileNoteEmpty => 'Níl nóta ar bith fós.';

  @override
  String get sudoTitle => 'Deimhnigh D\'Aitheantas';

  @override
  String get sudoDescription =>
      'Éilíonn an gníomh seo dearbhú chun leanúint ar aghaidh.';

  @override
  String get sudoAuthenticatorCode => 'Cód Fíordheimhnitheora';

  @override
  String get sudoMethodPassword => 'Focal Scoir';

  @override
  String get sudoMethodTotp => 'Fíordheimhnitheoir';

  @override
  String get sudoVerificationFailed =>
      'Theip ar an bhfíorú. Bain triail eile as le do thoil.';

  @override
  String get securityAccountTitle => 'Cuntas';

  @override
  String get securityAccountDescription =>
      'Bainistigh do ríomhphost, focal scoir, agus socruithe cuntais';

  @override
  String get securitySectionTitle => 'Slándáil';

  @override
  String get securitySectionDescription =>
      'Cosain do chuntas le fíordheimhniú dhá fhachtóir agus le pasghnéithe';

  @override
  String get securityLoginEmailSectionTitle => 'Socruithe Ríomhphoist';

  @override
  String get securityLoginEmailSectionDescription =>
      'Bainistigh an seoladh ríomhphoist a úsáideann tú chun logáil isteach i Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Seoladh Ríomhphoist';

  @override
  String get securityLoginNoEmailSet => 'Níl seoladh ríomhphoist socraithe';

  @override
  String get securityLoginChangeEmail => 'Athraigh Ríomhphost';

  @override
  String get securityLoginAddEmail => 'Cuir Ríomhphost leis';

  @override
  String get securityLoginReveal => 'Nocht';

  @override
  String get securityLoginHide => 'Folaigh';

  @override
  String get securityLoginPasswordSectionTitle => 'Focal Scoir';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Athraigh do phasfhocal chun do chuntas a choinneáil slán';

  @override
  String get securityLoginCurrentPasswordLabel => 'Focal Scoir Reatha';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Athraíodh an uair dheireanach: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Athraíodh an uair dheireanach: Riamh';

  @override
  String get securityLoginNoPasswordSet => 'Níl focal scoir socraithe';

  @override
  String get securityLoginChangePassword => 'Athraigh Focal Scoir';

  @override
  String get securityLoginSetPassword => 'Socraigh Focal Scoir';

  @override
  String get passwordChangeTitle => 'Athraigh Focal Scoir';

  @override
  String get passwordChangeIntroDescription =>
      'Seolfaimid cód fíoraithe chuig do sheoladh ríomhphoist chun d\'aitheantas a dheimhniú sula n-athrófar do phasfhocal.';

  @override
  String get passwordChangeStart => 'Tosaigh';

  @override
  String get passwordChangeVerifyTitle => 'Deimhnigh Do Ríomhphost';

  @override
  String get passwordChangeVerifyDescription =>
      'Iontráil an cód fíoraithe a seoladh chuig do sheoladh ríomhphoist.';

  @override
  String get passwordChangeVerificationCode => 'Cód Fíoraithe';

  @override
  String get passwordChangeVerify => 'Deimhnigh';

  @override
  String get passwordChangeNewPasswordTitle => 'Socraigh Focal Scoir Nua';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Iontráil do phasfhocal nua thíos.';

  @override
  String get passwordChangeNewPassword => 'Focal Scoir Nua';

  @override
  String get passwordChangeConfirmPassword => 'Deimhnigh Focal Scoir Nua';

  @override
  String get passwordChangeSubmit => 'Athraigh Focal Scoir';

  @override
  String get passwordChangeSuccess => 'Athraíodh an focal scoir';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Ní mheaitseálann na focail scoir';

  @override
  String get passwordChangeInvalidCode => 'Cód neamhbhailí nó éagtha';

  @override
  String get emailChangeTitle => 'Athraigh Ríomhphost';

  @override
  String get emailChangeIntroDescription =>
      'Seolfaimid cóid fíoraithe chun d\'aitheantas a dheimhniú sula n-athrófar do sheoladh ríomhphoist.';

  @override
  String get emailChangeStart => 'Tosaigh';

  @override
  String get emailChangeVerifyOriginalTitle => 'Deimhnigh Ríomhphost Reatha';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Iontráil an cód fíoraithe a seoladh chuig do sheoladh ríomhphoist reatha.';

  @override
  String get emailChangeNewEmailTitle => 'Iontráil Ríomhphost Nua';

  @override
  String get emailChangeNewEmailDescription =>
      'Iontráil an seoladh ríomhphoist nua ar mhaith leat a úsáid.';

  @override
  String get emailChangeNewEmailLabel => 'Ríomhphost Nua';

  @override
  String get emailChangeNewEmailSubmit => 'Seol Cód Fíoraithe';

  @override
  String get emailChangeVerifyNewTitle => 'Deimhnigh Ríomhphost Nua';

  @override
  String get emailChangeVerifyNewDescription =>
      'Iontráil an cód fíoraithe a seoladh chuig do sheoladh ríomhphoist nua.';

  @override
  String get emailChangeSuccess => 'Athraithe Ríomhphost';

  @override
  String get emailChangeInvalidCode => 'Cód neamhbhailí nó caite';

  @override
  String get resend => 'Seol Arís';

  @override
  String resendCountdown(int seconds) {
    return 'Seol Arís (${seconds}s)';
  }

  @override
  String get verificationCode => 'Cód Fíoraithe';

  @override
  String get verify => 'Deimhnigh';

  @override
  String get enable => 'Cumasaigh';

  @override
  String get disable => 'Díchumasaigh';

  @override
  String get delete => 'Scrios';

  @override
  String get save => 'Sábháil';

  @override
  String get securityTfaSectionTitle => 'Dá-Fhachtóir Fíordheimhniú';

  @override
  String get securityTfaSectionDescription =>
      'Cuir sraith bhreise slándála le do chuntas';

  @override
  String get securityTfaAuthenticatorApp => 'Aip Fíordheimhnithe';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Tá fíordheimhniú dhá fhachtóir cumasaithe';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Úsáid aip fíordheimhnithe chun cóid a ghiniúint le haghaidh fíordheimhnithe dhá fhachtóir';

  @override
  String get securityTfaBackupCodes => 'Códanna Cúltaca';

  @override
  String get securityTfaBackupCodesDescription =>
      'Féach ar agus bainistigh do chóid chúltaca chun aisghabháil cuntais';

  @override
  String get securityTfaViewCodes => 'Féach ar Chóid';

  @override
  String get securityPasskeysSectionTitle => 'Eochracha Pas';

  @override
  String get securityPasskeysSectionDescription =>
      'Úsáid eochracha pas chun logáil isteach gan phasfhocal agus fíordheimhniú dhá fhachtóir';

  @override
  String get securityPasskeysRegistered => 'Eochracha Pas Cláraithe';

  @override
  String get securityPasskeysNone => 'Níl aon eochracha pas cláraithe';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'eochracha pas',
      one: 'eochair phas',
    );
    return '$count $_temp0 cláraithe (uasmhéid 10)';
  }

  @override
  String get securityPasskeysAdd => 'Cuir Eochair Phas Leis';

  @override
  String securityPasskeysAdded(String date) {
    return 'Curtha leis: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Úsáideadh an uair dheireanach: $date';
  }

  @override
  String get securityPasskeysRename => 'Athainmnigh';

  @override
  String get securityPasskeysDeleteTitle => 'Scrios Eochair Phas';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'An bhfuil tú cinnte gur mhaith leat an eochair phas \"$name\" a scriosadh?';
  }

  @override
  String get securityPasskeyNameTitle => 'Ainmnigh Eochair Phas';

  @override
  String get securityPasskeyNameLabel => 'Ainm Eochair Phas';

  @override
  String get securityPasskeyNameHint =>
      'm.sh., YubiKey, iPhone, Ríomhaire Oibre';

  @override
  String get securityPhoneSectionTitle => 'Uimhir Ghutháin';

  @override
  String get securityPhoneSectionDescription =>
      'Bainistigh d\'uimhir ghutháin.';

  @override
  String get securityPhoneLabel => 'Uimhir Ghutháin';

  @override
  String get securityPhoneNone => 'Níl aon uimhir ghutháin curtha leis.';

  @override
  String get securityPhoneAdd => 'Cuir Fón Leis';

  @override
  String get securityPhoneRemove => 'Bain';

  @override
  String get securityPhoneRemoveTitle => 'Bain Uimhir Ghutháin';

  @override
  String get securityPhoneRemoveDescription =>
      'An bhfuil tú cinnte gur mian leat d\'uimhir ghutháin a bhaint?';

  @override
  String get securityPhoneRemoved => 'Baineadh an uimhir ghutháin';

  @override
  String get securityClaimTitle => 'Gnéithe Slándála';

  @override
  String get securityClaimDescription =>
      'Éiligh do chuntas chun rochtain a fháil ar ghnéithe slándála mar fíordheimhniú dhá fhachtóir agus pasfhreagair. ';

  @override
  String get securityVerifyEmailRequired =>
      'Caithfidh tú do sheoladh ríomhphoist a fhíorú sula féidir leat fíordheimhniú dhá fhachtóir, pasfhreagair, nó fíordheimhniú SMS a shocrú.';

  @override
  String get totpEnableTitle => 'Socrúchán Aip Fíordheimhnithe';

  @override
  String get totpEnableDescription =>
      'Scan an cód QR le d\'aip fíordheimhnithe chun cóid a ghiniúint le haghaidh fíordheimhnithe dhá fhachtóir.';

  @override
  String get totpEnableCodeLabel => 'Cód';

  @override
  String get totpEnableCodeHint =>
      'Cuir isteach an cód 6-dhigit ón d\'aip fíordheimhnithe';

  @override
  String get totpEnableSuccess =>
      'Tá fíordheimhniú dhá fhachtóir curtha ar bun';

  @override
  String get totpDisableTitle => 'Bain Aip Fíordheimhnithe';

  @override
  String get totpDisableDescription =>
      'Cuir isteach an cód 6-dhigit ón d\'aip fíordheimhnithe chun fíordheimhniú dhá fhachtóir a dhíchumasú.';

  @override
  String get totpDisableSuccess => 'Díchumasaíodh fíordheimhniú dhá fhachtóir';

  @override
  String get backupCodesTitle => 'Códanna Cúltaca';

  @override
  String get backupCodesWarning =>
      'Má chailleann tú rochtain ar d\'aip fíordheimhnithe agus mura bhfuil na cóid seo agat, beidh tú faoi ghlas go buan ón d\'chuntas. Íoslódáil nó cóipeáil iad anois agus stóráil iad in áit shábháilte.';

  @override
  String get backupCodesDownload => 'Íoslódáil';

  @override
  String get backupCodesCopy => 'Cóipeáil';

  @override
  String get backupCodesCopied =>
      'Cóipeáladh cóid chúltaca chuig an ghearrthaisce';

  @override
  String get backupCodesAcknowledge =>
      'Tá mo chóid chúltaca íoslódáilte nó cóipeáilte agam agus stóráilte agam in áit shábháilte.';

  @override
  String get backupCodesDone => 'Críochnaithe';

  @override
  String get backupCodesViewTitle => 'Féach ar Chódanna Cúltaca';

  @override
  String get backupCodesViewDescription =>
      'D\'fhéadfadh go mbeadh gá le fíordheimhniú sula bhfeicfear do chóid chúltaca.';

  @override
  String get phoneAddTitle => 'Cuir Uimhir Ghutháin Leis';

  @override
  String get phoneAddLabel => 'Uimhir Ghutháin';

  @override
  String get phoneAddHint => 'Cuir isteach d\'uimhir ghutháin';

  @override
  String get phoneAddFooter =>
      'Cuir isteach d\'uimhir ghutháin. Seolfaimid cód fíoraithe chugat trí SMS.';

  @override
  String get phoneAddSendCode => 'Seol Cód';

  @override
  String get phoneVerifyTitle => 'Fíoraigh Uimhir Ghutháin';

  @override
  String get phoneVerifyDescription =>
      'Cuir isteach an cód fíoraithe a seoladh chuig d\'uimhir ghutháin.';

  @override
  String get phoneAddSuccess => 'Cuireadh uimhir ghutháin leis';

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
  String get dangerZoneSectionTitle => 'Crios Contúirte';

  @override
  String get dangerZoneSectionDescription =>
      'Gníomhartha dochreidte agus millteach';

  @override
  String get dangerZoneDisableTitle => 'Díchumasaigh Cuntas';

  @override
  String get dangerZoneDisableDescription =>
      'Díchumasaigh do chuntas go sealadach. Is féidir leat é a athghníomhachtú níos déanaí trí logáil isteach arís.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Má dhíchumasaíonn tú do chuntas, logálfar amach thú ó gach seisiún. Is féidir leat do chuntas a athghníomhachtú am ar bith trí logáil isteach arís.';

  @override
  String get dangerZoneDeleteTitle => 'Scrios Cuntas';

  @override
  String get dangerZoneDeleteDescription =>
      'Scrios do chuntas agus na sonraí go léir a bhaineann leis go buan. Ní féidir an gníomh seo a aisiompú.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Cealaigh d\' síntiús Plutonium gníomhach i socruithe Plutonium sula scriosann tú do chuntas.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Ní féidir cuntas a scriosadh';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Ní féidir leat do chuntas a scriosadh agus tú i do úinéir ar phobail. Aistrigh úinéireacht na bpobail seo a leanas ar dtús:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'agus $count níos mó';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Chun úinéireacht a aistriú, téigh go dtí $settingsPath agus bain úsáid as an rogha úinéireacht a aistriú.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'An bhfuil tú cinnte gur mian leat do chuntas a scriosadh? Sceidealófar do chuntas le haghaidh scriosadh buan.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Is féidir leat an próiseas scriosadh a chur ar ceal laistigh de 14 lá';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Tar éis 14 lá, scriosfar do chuntas go buan';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Nuair a bheidh an scriosadh próiseáilte, ní bheidh tú in ann rochtain ar do chuntas a aisghabháil';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Ní bheidh tú in ann do theachtaireachtaí seolta a scriosadh tar éis do chuntas a scriosadh';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Más mian leat do shonraí a onnmhairiú nó do theachtaireachtaí a scriosadh ar dtús, tabhair cuairt ar an rannán Painéal Príobháideachta i Socruithe Úsáideora sula leanann tú ar aghaidh.';

  @override
  String get claimAccountTitle => 'Éiligh Do Chuntas';

  @override
  String get claimAccountDescription =>
      'Éiligh do chuntas trí ríomhphost agus pasfhocal a chur leis. Seolfaimid cód fíoraithe chun do ríomhphost a dheimhniú sula gcríochnófar é.';

  @override
  String get claimAccountEmailLabel => 'Ríomhphost';

  @override
  String get claimAccountPasswordLabel => 'Focal faire';

  @override
  String get claimAccountSendCode => 'Seol Cód';

  @override
  String get claimAccountVerifyDescription =>
      'Iontráláil an cód a sheolaimid chuig do ríomhphost chun é a fhíorú. Socrófar do phasfhocal nuair a dheimhnítear an cód.';

  @override
  String get claimAccountSuccess => 'Éirí leis an gcuntas a éileamh';

  @override
  String get importantInformation => 'Eolas tábhachtach:';

  @override
  String get genericError => 'Tharla earráid';

  @override
  String get invalidCode => 'Cód neamhbhailí';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bliain ó shin',
      one: '1 bhliain ó shin',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count míonna ó shin',
      one: '1 mhí ó shin',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count laethanta ó shin',
      one: '1 lá ó shin',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uaireanta an chloig ó shin',
      one: '1 uair an chloig ó shin',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nóiméid ó shin',
      one: '1 nóiméad ó shin',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'díreach anois';

  @override
  String get authorizedAppsTitle => 'Feidhmchláir Údaraithe';

  @override
  String get authorizedAppsDescription =>
      'Tá rochtain ar do chuntas Fluxer tugtha do na feidhmchláir seo.';

  @override
  String get authorizedAppsEmptyTitle => 'Gan Feidhmchláir Údaraithe';

  @override
  String get authorizedAppsEmptyDescription =>
      'Níor údaraiú tú d\'aon fheidhmchlár rochtain a fháil ar do chuntas.';

  @override
  String get authorizedAppsLoadError =>
      'Teip ar Feidhmchláir Údaraithe a luchtú';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Údaraithe ar $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Ceadanna tugtha';

  @override
  String get authorizedAppsRevoke => 'Cealaigh';

  @override
  String get authorizedAppsRevokeTitle => 'Ceartaigh rochtain feidhmchláir';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'An bhfuil tú cinnte gur mhaith leat rochtain a chealú do $appName? Ní bheidh rochtain ar do chuntas ag an bhfeidhmchlár seo a thuilleadh.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Rochtain ar do bhunfhaisnéis próifíle (ainm úsáideora, avatar, etc.)';

  @override
  String get authorizedAppsScopeEmail => 'Féach ar do sheoladh ríomhphoist';

  @override
  String get authorizedAppsScopeGuilds =>
      'Féach ar na pobail a bhfuil tú i do bhall díobh';

  @override
  String get authorizedAppsScopeConnections => 'Féach ar do chuntais nasctha';

  @override
  String get authorizedAppsScopeBot => 'Cuir bot le pobal le ceadanna iarrtha';

  @override
  String get authorizedAppsScopeAdmin =>
      'Rochtain ar chríochphointí riaracháin';

  @override
  String get privacyPendingDeletionTitle => 'Ag feitheamh le scriosadh';

  @override
  String get blockedUsersTitle => 'Úsáideoirí Blocáilte';

  @override
  String get blockedUsersDescription =>
      'Ní féidir le húsáideoirí blocáilte iarratais cairde a sheoladh chugat nó teachtaireacht a chur chugat go díreach.';

  @override
  String get blockedUsersEmptyTitle => 'Gan Úsáideoirí Blocáilte';

  @override
  String get blockedUsersEmptyDescription =>
      'Níor bhlocáil tú aon duine go fóill.';

  @override
  String get blockedUsersLoadError => 'Teip ar Úsáideoirí Blocáilte a luchtú';

  @override
  String get blockedUsersUnblock => 'Díbhlocáil';

  @override
  String get blockedUsersUnblockTitle => 'Díbhlocáil Úsáideoir';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'An bhfuil tú cinnte gur mhaith leat $username a dhíbhlocáil?';
  }

  @override
  String get blockedUsersCopyTag => 'Cóipeáil FluxerTag';

  @override
  String get blockedUsersCopyId => 'Cóipeáil ID Úsáideora';

  @override
  String get userProfileLoadError => 'Níorbh fhéidir próifíl a luchtú';

  @override
  String get userProfileRetry => 'Athriail';

  @override
  String get userProfileMessage => 'Teachtaireacht';

  @override
  String get userProfileVoiceCall => 'Glao Gutháin';

  @override
  String get userProfileVideoCall => 'Glao Físe';

  @override
  String get userProfileEditProfile => 'Cuir Próifíl in Eagar';

  @override
  String get userProfileStaffBadgeTooltip => 'Foireann Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Foireann Pobail Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Comhpháirtí Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Sealgair Bugaí Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Plútóniam Fluxer';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Liostáil Plútóniam Fluxer ó $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Físghníomhaí Fluxer';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Físghníomhaí ó $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Físghníomhaí #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Cairde Comónta ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Pobail Chomónta ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Cairde Comónta';

  @override
  String get userProfileMutualCommunitiesTitle => 'Pobail Chomónta';

  @override
  String get userProfileNoMutualFriends => 'Ní bhfuarthas aon gcairde comónta.';

  @override
  String get userProfileNoMutualCommunities =>
      'Ní bhfuarthas aon phobail chomónta.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Leasainm: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Oscail DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Chuir tú bac ar $username. Ní bheidh tú in ann teachtaireachtaí a sheoladh mura ndíghlasálann tú iad.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Díghlasáil';

  @override
  String get userProfileOpenDm => 'Oscail DM';

  @override
  String get userProfileNoteTitle => 'Nóta';

  @override
  String get userProfileNoteVisibility => '(infheicthe duit amháin)';

  @override
  String get userProfileNoteSave => 'Sábháil';

  @override
  String get userProfileNoteDelete => 'Scrios';

  @override
  String get userProfileNoteEmpty => 'Cliceáil chun nóta a chur leis';

  @override
  String get userProfileMemberSince => 'Ball Ó';

  @override
  String get userProfileAboutMe => 'Fúmsa';

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
  String get userProfileCopyUsername => 'Cóipeáil Ainm Úsáideora';

  @override
  String get userProfileCopyUserId => 'Cóipeáil ID Úsáideora';

  @override
  String get userProfileViewMainProfile => 'Féach Príomhphróifíl';

  @override
  String get userProfileViewCommunityProfile => 'Féach Próifíl Pobail';

  @override
  String get userProfileBlockUser => 'Cuir bac ar úsáideoir';

  @override
  String get userProfileUnblockUser => 'Díghlasáil úsáideoir';

  @override
  String get userProfileRemoveFriend => 'Bain cara';

  @override
  String get userProfileBlockConfirmTitle => 'Cuir bac ar úsáideoir';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'An bhfuil tú cinnte gur mian leat bac a chur ar $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Díghlasáil úsáideoir';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'An bhfuil tú cinnte gur mian leat $username a dhíghlasáil?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Bain cara';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'An bhfuil tú cinnte gur mian leat $username a bhaint mar chara?';
  }

  @override
  String get userProfileFailedOpenDm => 'Theip ar DM a oscailt';

  @override
  String get userProfileFailedSaveNote => 'Theip ar nóta a shábháil';

  @override
  String get userProfileActionFailed =>
      'Theip ar an ngníomh, bain triail eile as';

  @override
  String get userProfileChangeNickname => 'Athraigh leasainm';

  @override
  String get userProfileKick => 'Caith amach';

  @override
  String get userProfileBan => 'Díbhe';

  @override
  String get userProfileTimeout => 'Cuir ar fionraí';

  @override
  String get userProfileRemoveTimeout => 'Bain fionraí';

  @override
  String get userProfileTransferOwnership => 'Aistrigh úinéireacht';

  @override
  String get userProfileReportUser => 'Tuairiscigh ar úsáideoir';

  @override
  String get userProfileReportMessage => 'Tuairiscigh ar theachtaireacht';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Caith amach $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'An bhfuil tú cinnte gur mian leat $username a chaitheamh amach? Is féidir leo filleadh le cuireadh nua.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Bain an t-am teoranta?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Má bhaintear an t-am teoranta, beidh $username in ann teachtaireachtaí a sheoladh, imoibriú, agus cainéil gutha a nascadh arís.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Aistriú úinéireachta?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Aistriú úinéireacht an phobail seo chuig $username? Tá sé seo do-aisiompaithe agus caillfidh tú gach pribhléid úinéara.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Díbirt $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Ré an dibhearta';

  @override
  String get userProfileBanCustomSecondsLabel => 'Ré saincheaptha (soicindí)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Aon luach ó $min go $max soicindí';
  }

  @override
  String get userProfileBanDeleteHistoryLabel =>
      'Scrios stair teachtaireachtaí';

  @override
  String get userProfileBanDeleteNone => 'Ná scrios aon cheann';

  @override
  String get userProfileBanDelete24h => '24 uair an chloig roimhe seo';

  @override
  String get userProfileBanDelete7d => '7 lá roimhe seo';

  @override
  String get userProfileBanReasonLabel => 'Cúis (roghnach)';

  @override
  String get userProfileBanReasonHint => 'Cuir isteach cúis leis an dibhearta';

  @override
  String get userProfileBanSubmit => 'Díbirt ball';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Am teoranta do $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Ré an ama teoranta';

  @override
  String get userProfileTimeoutSubmit => 'Am teoranta don bhall';

  @override
  String get userProfileNicknameLabel => 'Leasainm';

  @override
  String get userProfileNicknameHint => 'Cuir isteach leasainm';

  @override
  String get userProfileNicknameSave => 'Sábháil';

  @override
  String userProfileKickSuccess(String username) {
    return 'Chaith $username amach';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Díbearadh $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Am teoranta do $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Baineadh an t-am teoranta do $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Nuashonraíodh an leasainm';

  @override
  String get userProfileTransferSuccess => 'Aistríodh an úinéireacht';

  @override
  String get durationPermanent => 'Buan';

  @override
  String get duration60Seconds => '60 soicind';

  @override
  String get duration5Minutes => '5 nóiméad';

  @override
  String get duration10Minutes => '10 nóiméad';

  @override
  String get duration1Hour => '1 uair an chloig';

  @override
  String get duration12Hours => '12 uair an chloig';

  @override
  String get duration1Day => '1 lá';

  @override
  String get duration3Days => '3 lá';

  @override
  String get duration5Days => '5 lá';

  @override
  String get duration1Week => '1 seachtain';

  @override
  String get duration2Weeks => '2 sheachtain';

  @override
  String get duration1Month => '1 mhí';

  @override
  String get durationCustom => 'Saincheaptha…';

  @override
  String get iarReportUserTitle => 'Tuairiscigh ar úsáideoir';

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
  String get iarReasonInappropriateProfile => 'Próifíl mhí-oiriúnach';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Tá ábhar míchuí i bpróifíl an úsáideora seo';

  @override
  String typingIndicatorOne(String name) {
    return 'Tá $name ag scríobh...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Tá $name1 agus $name2 ag scríobh...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Tá $name1, $name2 agus $name3 ag scríobh...';
  }

  @override
  String get typingIndicatorMultiple => 'Tá roinnt daoine ag scríobh...';

  @override
  String get typingIndicatorHandful =>
      'Tá dornán de laochra méarchláir ag bailiú...';

  @override
  String get typingIndicatorSymphony =>
      'Tá siansa de mhéara ag cnagadh ar siúl...';

  @override
  String get typingIndicatorFiesta => 'Is féasta scríofa iomlán é seo anseo';

  @override
  String get typingIndicatorApocalypse =>
      'Aifreann scríofa, is aifreann scríofa é seo';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Is mór an sásamh duit a bheith anseo, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Fáilte, $username! Mothaigh ar do shuaimhneas.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Dia duit, $username! Is mór an sásamh duit a bheith anseo.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Dia duit, $username! Léim isteach nuair a bhíonn tú réidh.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hey $username, is mór an sásamh thú a fheiceáil anseo!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hey a chara, $username! Tá súil agam go mbainfidh tú sult as do chuairt.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hey, $username, fáilte ar bord!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Is mór an sásamh gur tháinig tú, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Fáilte isteach, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Fáilte, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Fáilte, $username! Is mór an sásamh linn thú a bheith anseo.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Fáilte, $username! Tá súil agam go mbainfidh tú sult as d\'am anseo.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Fáilte, $username! Tosaíonn do chéad chomhrá eile anseo.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Fáilte, $username. Is mór an sásamh linn thú a bheith anseo.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Is mór an sásamh thú a fheiceáil, $username! Fáilte isteach.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Tá tú anseo, $username! Is maith an rud thú a bheith linn.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Tá tú tagtha, $username! Tosaimis.';
  }

  @override
  String get relativeTimeShortNow => 'anois';

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
      other: '${count}mh',
      one: '1mh',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}b',
      one: '1b',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Mo Gléasanna';

  @override
  String get linkedDevicesDescription =>
      'Féach ar gach gléas atá logáilte isteach i do chuntas faoi láthair. Cealaigh aon seisiúin nach n-aithníonn tú.';

  @override
  String get linkedDevicesCurrentDevice => 'Ghléas Reatha';

  @override
  String get linkedDevicesOtherDevices => 'Ghléasanna Eile';

  @override
  String get linkedDevicesEnterSelection => 'Téigh isteach i Mód Roghnaithe';

  @override
  String get linkedDevicesExitSelection => 'Fág Mód Roghnaithe';

  @override
  String get linkedDevicesSelectAll => 'Roghnaigh Gach Ceann';

  @override
  String get linkedDevicesClearSelection => 'Glan Roghnú';

  @override
  String get linkedDevicesRevokeTooltip => 'Cealaigh gléas';

  @override
  String get linkedDevicesSignOutAll => 'Sínigh amach gach gléas eile';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sínigh amach $count gléasanna',
      one: 'Sínigh amach 1 ghléas',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sínigh amach $count gléasanna',
      one: 'Sínigh amach 1 ghléas',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Sínigh amach gach gléas eile';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Sínfidh sé seo na gléasanna roghnaithe amach as do chuntas. Beidh ort logáil isteach arís ar na gléasanna sin.',
      one:
          'Sínfidh sé seo an gléas roghnaithe amach as do chuntas. Beidh ort logáil isteach arís ar an ngléas sin.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Dícheanglófar na gléasanna roghnaithe ó do chuntas. Beidh ort logáil isteach arís ar na gléasanna sin.';

  @override
  String get linkedDevicesSignOutConfirm => 'Lean ar aghaidh';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Beidh ort logáil isteach arís ar gach gléas a dícheanglófar';

  @override
  String get linkedDevicesLoadErrorTitle => 'Earráid Líonra';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Tá fadhb againn ag nascadh leis an leanúnachas spás-ama. Seiceáil do nasc agus bain triail eile as.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gléasanna dícheangailte',
      one: 'Gléas dícheangailte',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Níorbh fhéidir dícheangal. Bain triail eile as.';

  @override
  String get linkedDevicesUnknownOs => 'OS Anaithnid';

  @override
  String get linkedDevicesUnknownPlatform => 'Ardán Anaithnid';

  @override
  String slowmodeLabel(String duration) {
    return '$duration modh mall';
  }

  @override
  String get slowmodeTooltipActive =>
      'Tá tú i mód mall. Fan sula seolann tú teachtaireacht eile.';

  @override
  String get slowmodeTooltipImmune =>
      'Tá mód mall cumasaithe, ach tá tú díolmhaithe.';

  @override
  String get channelNoSendPermissionHint =>
      'Ní féidir teachtaireachtaí a sheoladh sa chainéal seo.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Fógraí córais ó fhoireann $productName. Ní féidir leat freagairt anseo.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Tá teachtaireachtaí ar sos go sealadach sa phobal seo.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Tá tú ar sos. Tá teachtaireachtaí, imoibrithe, agus guth ar sos go dtí go dtí go rachaidh an t-am sos as feidhm.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Caithfidh tú d\'fhógra a éileamh chun teachtaireachtaí a sheoladh sa phobal seo.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Caithfidh tú do ríomhphost a fhíorú chun teachtaireachtaí a sheoladh sa phobal seo.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Tá do chuntas ró-nua chun teachtaireachtaí a sheoladh sa phobal seo.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Níor bhall den phobal seo thú le fada go leor chun teachtaireachtaí a sheoladh.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Caithfidh tú uimhir ghutháin a fhíorú chun teachtaireachtaí a sheoladh sa phobal seo.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Fíoraigh ríomhphost';

  @override
  String get channelComposerBarrierVerifyPhone => 'Fíoraigh fón';

  @override
  String chatAttachmentTooMany(int max) {
    return 'An iomarca comhad ceangailte (uasmhéid $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Sáraíonn ceann amháin nó níos mó de na comhaid an teorainn mhéide';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Tá na comhaid seo ró-mhór le seoladh le chéile';

  @override
  String get chatAttachmentDropToUpload => 'Scáip comhaid chun iad a uaslódáil';

  @override
  String get chatAttachmentDropToSend =>
      'Scáip comhaid chun iad a sheoladh anois';

  @override
  String get chatAttachmentSendVoiceMessage => 'Seol teachtaireacht gutha';

  @override
  String get voiceMessageTitle => 'Teachtaireacht gutha';

  @override
  String get voiceMessageHoldHint =>
      'Coinnigh chun taifeadadh. Tarraing suas chun glasáil, nó scaoil chun seoladh.';

  @override
  String get voiceMessageDiscard => 'Scrios teachtaireacht gutha';

  @override
  String get voiceMessageSend => 'Seol teachtaireacht gutha';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Ní féidir tosú ag taifeadadh. Ceadaigh rochtain ar an micreafón.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Ní thacaítear le taifeadadh gutha ar an bhfeiste seo.';

  @override
  String get voiceMessageMicInUse =>
      'Fág an glao gutha chun teachtaireacht gutha a thaifeadadh.';

  @override
  String get voiceMessageRecordingFailed =>
      'Theip ar thaifeadadh. Bain triail eile as.';

  @override
  String get voiceMessageSendFailed =>
      'Teip cur ar theachtaireacht gutha. Bain triail eile as.';

  @override
  String get voiceMessageRecordingHint =>
      'Labhair anois. Brúigh Stop nuair a bheidh tú críochnaithe — is féidir leat a ghearradh ina dhiaidh sin.';

  @override
  String get voiceMessageReviewHint =>
      'Tarraing na hanlaí chun a ghearradh, ansin brúigh Seol.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Tosaigh ag taifeadadh';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Seinn';

  @override
  String get voiceMessagePause => 'Sos';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Ní mór go mbeadh an rogha ar a laghad ${secondsString}s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Cuir ceangaltán in eagar';

  @override
  String get chatAttachmentFilenameLabel => 'Ainm comhaid';

  @override
  String get chatAttachmentDescriptionLabel => 'Cur síos';

  @override
  String get chatAttachmentDescriptionHint => 'Nóta alt roghnach';

  @override
  String get chatAttachmentSpoilerLabel => 'Marcáil mar spoiler';

  @override
  String get chatAttachmentRemove => 'Bain ceangaltán';

  @override
  String get chatAttachmentDownload => 'Íosluchtaigh';

  @override
  String get chatAttachmentExpiredTooltip => ' Chuaigh ceangaltán in éag';

  @override
  String get chatAttachmentSourceGallery => 'Gailearaí';

  @override
  String get chatAttachmentSourceCamera => 'Ceamara';

  @override
  String get chatAttachmentSourceBrowse => 'Brabhsáil comhaid';

  @override
  String get chatAttachmentPasteTooltip => 'Greamaigh íomhá ón ghearrthaisce';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Nocht spoiler';

  @override
  String get matureMediaRevealButton => 'Nocht';

  @override
  String get matureMediaRevealHint => 'Cliceáil chun nochtadh';

  @override
  String get matureContentTitle => 'Ábhar aibí';

  @override
  String get matureCommunityTitle => 'Pobail aibí';

  @override
  String get matureCategoryTitle => 'Catagóirí aibí';

  @override
  String get matureChannelTitle => 'Cainéil aibí';

  @override
  String get communityContentWarningTitle => 'Rabhadh ábhair pobail';

  @override
  String get categoryContentWarningTitle => 'Rabhadh ábhair catagóire';

  @override
  String get channelContentWarningTitle => 'Rabhadh ábhair cainéil';

  @override
  String get defaultContentWarningBody => 'Tá ábhar íogair anseo.';

  @override
  String get matureCommunityBody =>
      'Tá an pobal seo marcáilte le haghaidh ábhar aibí agus d\'fhéadfadh ábhar a bheith ann nach bhfuil oiriúnach do roinnt úsáideoirí.';

  @override
  String get matureCategoryBody =>
      'Tá an catagóir seo marcáilte le haghaidh ábhar aibí agus d\'fhéadfadh ábhar a bheith ann nach bhfuil oiriúnach do roinnt úsáideoirí.';

  @override
  String get matureChannelBody =>
      'Tá an cainéal seo marcáilte le haghaidh ábhar aibí agus d\'fhéadfadh ábhar a bheith ann nach bhfuil oiriúnach do roinnt úsáideoirí.';

  @override
  String get matureVoiceChannelBody =>
      'Tá an cainéal guth seo marcáilte le haghaidh ábhar aibí agus d\'fhéadfadh ábhar a bheith ann nach bhfuil oiriúnach do roinnt úsáideoirí.';

  @override
  String get matureLinkChannelBody =>
      'Tá an cainéal nasc seo marcáilte le haghaidh ábhar aibí agus d\'fhéadfadh sé ábhar a oscailt nach bhfuil oiriúnach do roinnt úsáideoirí.';

  @override
  String get matureCommunityUnavailableBody =>
      'Níl an pobal aibí seo ar fáil do do chuntas.';

  @override
  String get matureCategoryUnavailableBody =>
      'Níl an catagóir aibí seo ar fáil do do chuntas.';

  @override
  String get matureChannelUnavailableBody =>
      'Níl an cainéal aibí seo ar fáil do do chuntas.';

  @override
  String get matureContentProceedButton => 'Lean ar aghaidh';

  @override
  String get matureContentUnderstandButton => 'Tuigim';

  @override
  String get matureContentOpenLinkButton => 'Oscail nasc';

  @override
  String get sensitiveContentSectionTitle => 'Ábhar íogair';

  @override
  String get sensitiveContentSectionDescription =>
      'Rialú conas a scagtar meáin aibí nó íogair i gcomhthéacsanna éagsúla';

  @override
  String get sensitiveContentFriendDmLabel =>
      'Teachtaireachtaí príobháideacha ó chairde';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Teachtaireachtaí príobháideacha ó dhaoine eile';

  @override
  String get sensitiveContentGuildLabel => 'Teachtaireachtaí i gcainéil pobail';

  @override
  String get sensitiveContentFilterShow => 'Taispeáin';

  @override
  String get sensitiveContentFilterBlur => 'Cealaigh';

  @override
  String get sensitiveContentFilterBlock => 'Cuir bac air';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Cealaigh meáin go dtí go gcríochnóidh an scanadh sábháilteachta';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Nuair a bhíonn sé cumasaithe, cealaítear íomhánna agus físeáin go dtí go gcríochnóidh an scanadh sábháilteachta ábhair.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Tá an socrú seo ar siúl i gcónaí do do chuntas.';

  @override
  String get sensitiveContentResetButton => 'Athshocraigh';

  @override
  String get sensitiveContentSaveButton => 'Sábháil';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comhad',
      one: '1 comhad',
    );
    return 'Ag uaslódáil $_temp0';
  }

  @override
  String get chatCancelUpload => 'Cealaigh uaslódáil';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Éagfaidh ar $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Éagfaidh idir $start agus $end';
  }

  @override
  String get connectionsTitle => 'Naisc';

  @override
  String get connectionsDescription =>
      'Ceangail cuntais agus fearainn sheachtracha le do phróifíl Fluxer. Beidh naisc fhíoraithe le feiceáil ar do phróifíl do dhaoine eile.';

  @override
  String get connectionsEmptyTitle => 'Gan naisc fós';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Ceangail do chuntas Bluesky nó fíoraigh úinéireacht fearainn chun iad a thaispeáint ar do phróifíl.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Fíoraigh úinéireacht fearainn chun é a thaispeáint ar do phróifíl.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Fearann';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Cuir nasc Bluesky leis';

  @override
  String get connectionsAddDomainAriaLabel => 'Cuir nasc fearainn leis';

  @override
  String get connectionEdit => 'Cuir in eagar';

  @override
  String get connectionRemove => 'Bain';

  @override
  String get connectionVerifiedLabel => 'Tá an nasc seo fíoraithe.';

  @override
  String get connectionUnverifiedLabel => 'Níl an nasc seo fíoraithe.';

  @override
  String get connectionAddTitle => 'Cuir Nasc leis';

  @override
  String get connectionTypeLabel => 'Cineál Nasc';

  @override
  String get connectionHandleLabel => 'Láimhseálaí';

  @override
  String get connectionDomainLabel => 'Fearann';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Tá an nasc seo agat cheana féin.';

  @override
  String get connectionConnectBluesky => 'Ceangail le Bluesky';

  @override
  String get connectionContinue => 'Ar Aghaidh';

  @override
  String get connectionVerifyTitle => 'Deimhnigh Nasc';

  @override
  String get connectionVerifyInstructions =>
      'Úsáid an taifead thíos chun úinéireacht an fhearainn a chruthú.';

  @override
  String get connectionDnsRecordTitle => 'Taifead TXT DNS';

  @override
  String get connectionDnsHostLabel => 'Óstach';

  @override
  String get connectionDnsValueLabel => 'Luach';

  @override
  String get connectionCopyHost => 'Cóipeáil óstach';

  @override
  String get connectionCopyValue => 'Cóipeáil luach';

  @override
  String get connectionCopied => 'Cóipeáladh!';

  @override
  String get connectionTokenFileTitle => 'Freastal ar an gcomhad comhartha';

  @override
  String get connectionTokenFileDescription =>
      'Íosluchtaigh **fluxer-verification** agus cuir sa bhfillteán **.well-known** é ionas gur féidir linn an fearann a bhailídiú.';

  @override
  String get connectionTokenFileDownload => 'Íosluchtaigh fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Tá an comhartha fíoraithe sa chomhad a ghnóthóidh muid ó **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Sábháil fluxer-verification';

  @override
  String get connectionVerifyButton => 'Deimhnigh';

  @override
  String get connectionBack => 'Ar Ais';

  @override
  String get connectionEditTitle => 'Cuir Nasc in Eagar';

  @override
  String get connectionEditDescription =>
      'Roghnaigh cé is féidir an nasc seo a fheiceáil ar do phróifíl.';

  @override
  String get connectionVisibilityEveryone => 'Gach Duine';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Lig do dhuine ar bith an nasc seo a fheiceáil ar do phróifíl';

  @override
  String get connectionVisibilityFriends => 'Cairde';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Lig do do chairde an nasc seo a fheiceáil';

  @override
  String get connectionVisibilityCommunityMembers => 'Baill Pobail';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Lig do bhaill ó phobail a bhfuil tú iontu an nasc seo a fheiceáil';

  @override
  String get connectionRemoveTitle => 'Bain Nasc';

  @override
  String get connectionRemoveDescription =>
      'An bhfuil tú cinnte gur mhaith leat an nasc seo a bhaint? Ní féidir an gníomh seo a chur ar ceal.';

  @override
  String get connectionRemoveConfirm => 'Bain';

  @override
  String get connectionsLoadError => 'Theip ar naisc a luchtú';

  @override
  String get connectionsReorderError => 'Theip ar ord a nuashonrú';

  @override
  String get connectionInitiateFailed =>
      'Níorbh fhéidir an dearbhú a thosú. Bain triail eile as.';

  @override
  String get connectionVerifyFailed =>
      'Níorbh fhéidir a dhearbhú. Seiceáil do thaifead DNS agus bain triail eile as.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Níorbh fhéidir údarú Bluesky a thosú.';

  @override
  String get connectionUpdateFailed => 'Níorbh fhéidir an nasc a nuashonrú';

  @override
  String get connectionRemoveFailed => 'Níorbh fhéidir an nasc a bhaint';

  @override
  String get connectionTokenSavedToast => 'Sábháladh fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast =>
      'Níorbh fhéidir an comhad a shábháil';

  @override
  String get connectionEnterHandle => 'Cuir isteach láimhseálaí Bluesky.';

  @override
  String get connectionEnterDomain => 'Cuir isteach fearann.';

  @override
  String get lookAndFeelTitle => 'Cuma & Mothú';

  @override
  String get lookAndFeelThemeSectionTitle => 'Téama';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Roghnaigh idir cuma dorcha, guail, nó éadrom.';

  @override
  String get lookAndFeelThemeDark => 'Téama Dorcha';

  @override
  String get lookAndFeelThemeCoal => 'Téama Guail';

  @override
  String get lookAndFeelThemeLight => 'Téama Éadrom';

  @override
  String get lookAndFeelThemeSystem => 'Téama Córais';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sioncrónaigh téama ar fud gléasanna';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Nuair a bheidh sé cumasaithe, sioncrónófar athruithe téama chuig do ghléasanna go léir. Nuair a bheidh sé díchumasaithe, úsáidfidh an gléas seo a shocruithe téama féin.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Díchumasaíonn téama an chórais sioncrónú go huathoibríoch chun do rogha córais ar an ngléas seo a rianú.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Níorbh fhéidir an téama a shioncrónú le do chuntas. Bain triail eile as le do thoil.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Scálú Cló Comhrá';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Coigeartaigh an méid cló sa limistéar comhrá.';

  @override
  String get lookAndFeelInterfaceTitle => 'Comhéadan';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Saincheap eilimintí agus iompraíochtaí an chomhéadain.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Táscairí clóscríofa liosta cainéal';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Roghnaigh conas a thaispeánfar táscairí clóscríofa i liosta na gcainéal nuair a bhíonn duine ag clóscríobh i gcainéal.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Táscaire Clóscríofa + Avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Taispeáin táscaire clóscríofa le avatars úsáideoirí i liosta na gcainéal';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Táscaire Clóscríofa Amháin';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Taispeáin an táscaire clóscríofa gan avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Folaigh';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ná taispeáin táscairí clóscríofa i liosta na gcainéal';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Taispeáin clóscríobh ar an gcainéal roghnaithe';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Nuair a dhíchumasaítear (réamhshocraithe), ní bheidh táscairí clóscríofa le feiceáil ar an gcainéal atá á fheiceáil agat faoi láthair.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'ginearálta';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Leideanna Méarchláir';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Rialú an dtaispeánfar leideanna aicearraí méarchláir laistigh de leidí uirlisí.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Folaigh leideanna méarchláir i leidí uirlisí';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Nuair a bheidh sé cumasaithe, folaítear na suaitheantais aicearraí i leidí uirlisí.';

  @override
  String get lookAndFeelNekoTitle => 'Ilghnéitheach';

  @override
  String get lookAndFeelNekoDescription =>
      'Roghanna comhéadain ilghnéitheacha.';

  @override
  String get lookAndFeelShowNekoLabel => 'Taispeáin Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Nuair a bheidh sé cumasaithe, feictear Neko in aice leis an mbarra ionchuir comhrá.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Iompraíocht dul isteach cainéal gutha';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Rialú conas a théann tú isteach i gcainéil gutha i bpobail.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Ceanglais cliceáil faoi dhó chun cainéil gutha a iontráil';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Nuair a bheidh sé cumasaithe, beidh ort cliceáil faoi dhó ar chainéil gutha chun iad a iontráil. Nuair a dhíchumasaítear (réamhshocraithe), cliceáil amháin a iontrálfaidh an cainéal láithreach.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Léimeann an sionnach donn tapa thar an madra leisciúil.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Líne taoisigh pobail';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Cumraigh conas a thaispeánann an líne taoisigh pobail teachtaireachtaí díreacha.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count pobal neamh-infhaighte go sealadach mar gheall ar mhainneachtain caipín sreafa.',
      one:
          'Tá 1 phobal neamh-infhaighte go sealadach mar gheall ar mhainneachtain caipín sreafa.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Comhbhrúigh DManna I bhFillteán';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Nuair a bheidh sé cumasaithe, comhbhrúitear DManna gan léamh sa líne taoisigh pobail isteach i bhfillteán ar an gcnaipe Fluxer. Cliceáil ar an gcnaipe Fluxer agus tú ar an leathanach DManna chun an fillteán a leathnú nó a chomhbhrú.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Liosta Cainéal';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Rialú iompraíocht táscaire gan léamh do chainéil chiúine i liostaí cainéal.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Taispeáin táscaire gan léamh ar chainéil chiúine';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Nuair a bheidh sé cumasaithe, taispeánann cainéil chiúine barra gan léamh faded ar an taobh clé. Feictear luaite go fóill beag beann ar an socrú seo.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Gníomhach Anois';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Rialú conas a thagann Gníomhach Anois chun cinn ar fud an aip.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Taispeáin Gníomhach Anois ar an scáileán baile';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Taispeáin Gníomhach Anois ar an scáileán baile chun cairde atá gníomhach i nguth a thabhairt suas. Feicfidh tú réamhamharc, an comhthéacs cainéal, cé atá ann cheana féin, agus bealach tapa chun isteach.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Roghanna is fearr leat';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Rialú infheictheacht na roghanna is fearr leat ar fud an aip.';

  @override
  String get lookAndFeelEnableFavoritesLabel =>
      'Cumasaigh Roghanna is fearr leat';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Nuair a bheidh sé cumasaithe, is féidir leat cainéil a roghnú mar rogha is fearr leat agus beidh siad le feiceáil sa rannóg Roghanna is fearr leat. Nuair a dhíchumasaítear, folaítear na heilimintí UI go léir a bhaineann le roghanna is fearr leat (cnaipe, míreanna roghchláir). Coimeádfar do roghanna is fearr leat atá ann cheana féin.';

  @override
  String get favoritesTitle => 'Roghanna is fearr leat';

  @override
  String get favoritesEmptyTitle => 'Níl roghanna is fearr leat fós';

  @override
  String get favoritesEmptyDescription =>
      'Star channels from the chat header to keep them here.';

  @override
  String get favoritesWelcomeTitle => 'Fáilte go dtí na roghnaithe';

  @override
  String get favoritesWelcomeDescription =>
      'Do spás pearsanta chun rochtain thapa a fháil ar chainéil, DManna, agus grúpaí is breá leat. Brúigh an réalta ar aon chainéal chun é a chur leis anseo.';

  @override
  String get favoritesWelcomeTip => 'Ní leat é? Díchumasaigh é am ar bith.';

  @override
  String get favoritesDisableButton => 'Díchumasaigh roghnaithe';

  @override
  String get favoritesAddedToast => 'Curtha le Roghanna';

  @override
  String get favoritesRemovedToast => 'Bainte ó Roghanna';

  @override
  String get favoritesHiddenToast => 'Folaíodh roghnaithe';

  @override
  String get favoritesMute => 'Balbhaigh roghnaithe';

  @override
  String get favoritesUnmute => 'Díbalbhaigh roghnaithe';

  @override
  String get favoritesHeaderMenu => 'Roghchlár roghnaithe';

  @override
  String get favoritesCreateCategory => 'Cruthaigh catagóir';

  @override
  String get favoritesCategoryNameLabel => 'Ainm catagóire';

  @override
  String get favoritesHideMutedChannels => 'Folaigh cainéil bhalbhaithe';

  @override
  String get favoritesShowMutedChannels => 'Taispeáin cainéil bhalbhaithe';

  @override
  String get favoritesSetNickname => 'Sainigh leasainm';

  @override
  String get favoritesNicknameLabel => 'Leasainm';

  @override
  String get favoritesSaveNickname => 'Sábháil leasainm';

  @override
  String get favoritesMoveToCategory => 'Aistrigh go catagóir';

  @override
  String get favoritesUncategorized => 'Gan catagóiriú';

  @override
  String get favoritesOtherCategory => 'Eile';

  @override
  String get favoritesRemoveFromFavorites => 'Bain ó Roghanna';

  @override
  String get favoritesAddToFavorites => 'Cuir le Roghanna';

  @override
  String get favoritesHideConfirmTitle => 'Folaigh roghnaithe';

  @override
  String get favoritesHideConfirmDescription =>
      'Folaighfidh sé seo na heilimintí UI go léir a bhaineann le roghnaithe, lena n-áirítear cnaipí agus míreanna roghchláir. Coimeádfar do roghnaithe reatha agus is féidir iad a chumasú arís am ar bith ó Socruithe > Casta > Cuma.';

  @override
  String get favoritesDirectMessageSubtitle => 'Teachtaireacht Dhíreach';

  @override
  String get messagesMediaDisplayGroupTitle => 'Taispeántas';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Rialú ar an gcaoi a dtaispeántar teachtaireachtaí, meáin, agus ábhar eile.';

  @override
  String get messagesMediaMediaGroupTitle => 'Meáin';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Saincheap roghanna méid meán agus cnaipí.';

  @override
  String get messagesMediaInputGroupTitle => 'Ionchur';

  @override
  String get messagesMediaInputGroupDescription =>
      'Saincheap socruithe ionchuir teachtaireachtaí.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Barra Taobh';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Cumraigh an chaoi a dtaispeántar barra taobh an phobail.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Folaigh cainéil bhalbhaithe de réir réamhshocraithe';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Folaigh go huathoibríoch cainéil bhalbhaithe sa bharra taobh nuair a théann tú isteach i bpobail nua';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Folaigh cainéil bhalbhaithe de réir réamhshocraithe?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Foilseofar cainéil bhalbhaithe go huathoibríoch sna pobail nua a dtabharfaidh tú cuairt orthu. Ar mhaith leat an socrú seo a chur i bhfeidhm ar do chuid pobal go léir freisin?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Stop ag folaigh cainéil bhalbhaithe de réir réamhshocraithe?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Ní bheidh cainéil bhalbhaithe folaigh go huathoibríoch sna pobail nua a dtabharfaidh tú cuairt orthu. Ar mhaith leat cainéil bhalbhaithe a thaispeáint i do chuid pobal go léir freisin?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Cuir i bhfeidhm ar gach pobal';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Taispeáin i ngach pobal';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Pobail nua amháin';

  @override
  String get messagesMediaDisplaySectionTitle => 'Taispeántas Meán';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Rialú ar an gcaoi a dtaispeántar íomhánna, físeáin agus meáin eile. Déantar gach meán a athmhéadú agus a thiontú. Ní bheidh comhaid an-mhóra nach féidir a chomhbhrú isteach i réamhamharc leabaithe, beag beann ar na socruithe seo.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Nuair a chuirtear mar naisc le comhrá';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Nuair a uaslódáiltear go díreach chuig Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Réamhamhairc Nasc';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Rialú ar an gcaoi a ndéantar naisc suíomh Gréasáin a réamhamharc sa chomhrá';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Taispeáin leabaithe agus réamhamharc naisc suíomh Gréasáin';

  @override
  String get messagesMediaReactionsSectionTitle => 'Iarmhairtí';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Cumraigh iarmhairtí emoji ar theachtaireachtaí';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Taispeáin iarmhairtí emoji ar theachtaireachtaí';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Ábhar Spoiléir';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Rialú ar an gcaoi a dtaispeántar ábhar spoiléir';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Taispeáin ábhar spoiléir';

  @override
  String get messagesMediaSpoilersOnClickName => 'Ar chliceáil';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Taispeáin ábhar spoiléir nuair a chliceáiltear air';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'I gcainéil a mhodraím';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Taispeáin ábhar spoiléir i gcónaí i gcainéil ina bhfuil an cead \"Bainistigh Teachtaireachtaí\" agat';

  @override
  String get messagesMediaSpoilersAlwaysName => 'I gcónaí';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Taispeáin ábhar spoiléir i gcónaí';

  @override
  String get messagesMediaSizeSectionTitle => 'Roghanna Méid Meán';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Saincheap an méid taispeána uasta do mheáin leabaithe agus ceangailte. Úsáideann méideanna níos lú níos lú spáis scáileáin, cé go dtaispeánann méideanna níos mó níos mó sonraí.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Meáin ó naisc (leabaithe)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Ceanglóirí uaslódáilte';

  @override
  String get messagesMediaSizeCompactName => 'Dlúth (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Méid meán níos lú';

  @override
  String get messagesMediaSizeComfortableName => 'Compordach (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Méid meán níos mó le níos mó sonraí';

  @override
  String get messagesMediaGifsSectionTitle => 'Iompar GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Rialú ar an gcaoi a gcuirtear GIFanna isteach sa chomhrá';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Seol GIFanna go huathoibríoch nuair a roghnaítear iad';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Uathchríochnú léirithe (uathchríochnú déchlóis)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Rialú ar an méid a thagann suas san uathchríochnú léirithe nuair a chlóscríobhann tú déchlóis. Saincheap na moltaí a thagann suas chun freagairt do roghanna.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Taispeáin emojis réamhshocraithe in uathchríochnú léirithe';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Taispeáin emojis saincheaptha in uathchríochnú léirithe';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Taispeáin greamáin in uathchríochnú léirithe';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Taispeáin meáin shábháilte in uathchríochnú léirithe';

  @override
  String get messagesMediaEditingSectionTitle =>
      'Eagarthóireacht Teachtaireachta';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Rialú ar an méid a tharlaíonn do dhréacht eagarthóireachta nuair a chuireann tú ar ceal é.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Sábháil dréacht eagarthóireachta ar chealú';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Táscairí gan léamh';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Rialú ar an gcaoi a dtaispeántar táscairí teachtaireachtaí gan léamh.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Taispeáin táscaire doiléir gan léamh ar chainéil balbhaithe';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Taispeáin táscaire doiléir gan léamh in aice le teachtaireachtaí príobháideacha agus cainéil balbhaithe ionas gur féidir leat a fheiceáil fós go gasta nuair a bhíonn gníomhaíocht ann.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Réamhamhairc teachtaireachtaí DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Rialú ar an uair a thaispeántar réamhamhairc teachtaireachtaí i liosta DM.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Mód réamhamhairc teachtaireachtaí DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Gach teachtaireacht';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Taispeáin réamhamhairc teachtaireachtaí do gach comhrá DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'DManna gan léamh amháin';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Taispeáin réamhamhairc teachtaireachtaí do DManna le teachtaireachtaí gan léamh amháin';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Ní dhéanfar aon cheann';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ná taispeáin réamhamhairc teachtaireachtaí i liosta DM';

  @override
  String get dmListSentAnAttachment => 'Sheol ceanglóir';

  @override
  String systemPreviewPinnedMessage(String username) {
    return 'Chuir $username teachtaireacht suas chuig an gcainéal seo.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return 'Chuir $username $userName leis an ngrúpa.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return 'Chuir $username duine éigin leis an ngrúpa.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return 'D\'fhág $username an grúpa.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username a bhain sé $userName as an ngrúpa.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username a bhain sé duine éigin as an ngrúpa.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username d\'athraigh sé ainm an chainéil go $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username d\'athraigh sé ainm an chainéil.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username d\'athraigh sé deilbhín an chainéil.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username thosaigh sé glao.';
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
  String get voiceConnectionConfirmTitle => 'Deimhniú Ceangail Guth';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tá tú ceangailte cheana féin leis an gcainéal guth seo ó $count ghléas eile. Cad ba mhaith leat a dhéanamh?',
      one:
          'Tá tú ceangailte cheana féin leis an gcainéal guth seo ó 1 ghléas eile. Cad ba mhaith leat a dhéanamh?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Aistrigh go Gléas Seo';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Ceangail Díreach (Coinnigh Naisc Eile)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ná déan rud ar bith, níl mé ag iarraidh ceangal';

  @override
  String get voiceChannelEmptyDescription =>
      'Is cainéal guth é seo. Ceangail chun tosú ag caint!';

  @override
  String get voiceChannelJoin => 'Ceangail le Cainéal Guth';

  @override
  String get voiceChannelJoinConnect => 'Ceangail le Guth';

  @override
  String get voiceChannelNoConnectPermission =>
      'Níl cead agat an cainéal guth seo a nascadh';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Tá micreafón, ceamara, agus ábhar comhroinnte scáileáin criptithe ó cheann go ceann.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Tá micreafón, ceamara, agus ábhar comhroinnte scáileáin criptithe ó cheann go ceann.';

  @override
  String get voiceChannelE2eeBroken =>
      'Níl criptiú ó cheann go ceann ar fáil mar go bhfuil rannpháirtí nach dtacaítear leis sa chainéal guth seo.';

  @override
  String get voiceCallE2eeBroken =>
      'Níl criptiú ó cheann go ceann ar fáil mar go bhfuil rannpháirtí nach dtacaítear leis sa ghlao seo.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Ní mór an cliant seo a nuashonrú sula nascann tú leis an nglao criptithe seo.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Níorbh fhéidir do mhicreafón a thosú. Tá tú fós sa ghlao.';

  @override
  String get voiceChannelStatusConnecting => 'Ag ceangal…';

  @override
  String get voiceChannelStatusConnected => 'Ceangailte';

  @override
  String get voiceChannelStatusError => 'Earráid';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Gléas soghluaiste';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Gléas deisce';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Balbhaithe ag an bpobal';

  @override
  String get voiceParticipantTooltipMuted => 'Balbhaithe';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Bodharaithe ag an bpobal';

  @override
  String get voiceParticipantTooltipDeafened => 'Bodharaithe';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Nasc: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rannpháirtí',
      one: '1 rannpháirtí',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Fág';

  @override
  String get voiceControlMute => 'Balbh';

  @override
  String get voiceControlUnmute => 'Díbhá';

  @override
  String get voiceControlDeafen => 'Bodhar';

  @override
  String get voiceControlUndeafen => 'Díbhodhar';

  @override
  String get voiceControlVideo => 'Físeán';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Comhroinnt scáileáin';

  @override
  String get voiceScreenShareNotificationText => 'Ag comhroinnt do scáileáin.';

  @override
  String get voiceControlMore => 'Níos mó';

  @override
  String get voiceControlDisconnect => 'Dícheangail';

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
  String get voiceControlChat => 'Comhrá';

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
  String get voiceTextChatShow => 'Taispeáin comhrá';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# teachtaireacht nár léadh',
      one: '# teachtaireacht nár léadh',
    );
    return 'Taispeáin comhrá le $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Tá cead ceamara ag teastáil le haghaidh físe.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Níorbh fhéidir comhroinnt scáileáin a thosú. Bain triail eile as.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Diúltaíodh cead comhroinnte scáileáin.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Níl comhroinnt scáileáin ar fáil ar an ngléas seo.';

  @override
  String get voiceWatchStream => 'Féach ar Sruth';

  @override
  String get voiceStopWatching => 'Stop Watching';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Stop watching the current stream';

  @override
  String get voiceOwnScreenShareTitle => 'You are broadcasting';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Your stream is live for participants.';

  @override
  String get voiceLiveBadge => 'Live';

  @override
  String get dmVoiceViewCall => 'View call';

  @override
  String get dmVoiceCallFullScreen => 'Full screen';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Open call in full screen';

  @override
  String get dmVoiceStripStatusConnecting => 'Connecting…';

  @override
  String get dmVoiceStripStatusInCall => 'In call';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Voice call';

  @override
  String get dmVoiceCallBarConnecting => 'Connecting…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Direct call';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Group call';

  @override
  String get dmVoiceCallBarIssueFallback => 'Voice issue';

  @override
  String get dmVoiceFullscreenTitle => 'Voice';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Voice connected';

  @override
  String get notificationsPageTitle => 'Notifications';

  @override
  String get notificationsFilterUnreads => 'Unreads';

  @override
  String get notificationsFilterMentions => 'Mentions';

  @override
  String get notificationsBookmarksTooltip => 'Bookmarks';

  @override
  String get notificationsMentionFilterTooltip => 'Filter mentions';

  @override
  String get notificationsMentionFiltersTitle => 'Mention filters';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Include @everyone and @here mentions';

  @override
  String get notificationsMentionIncludeRoles => 'Include role mentions';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Include all community mentions';

  @override
  String get notificationsNoUnreadTitle => 'No Unread Messages';

  @override
  String get notificationsNoUnreadBody => 'You\'re all caught up.';

  @override
  String get notificationsNoMentionsTitle => 'No Recent Mentions';

  @override
  String get notificationsNoMentionsBody =>
      'All @mentions of you will appear here for 7 days.';

  @override
  String get notificationsMentionsEndTitle => 'You\'ve reached the end';

  @override
  String get notificationsMentionsEndBody =>
      'You\'ve seen all your recent mentions. Don\'t fret, more will appear here soon.';

  @override
  String get notificationsJump => 'Jump';

  @override
  String get notificationsRemoveMentionTooltip => 'Remove mention';

  @override
  String get notificationsViewAllUnread => 'View all unread';

  @override
  String get notificationsMarkAsRead => 'Mark as read';

  @override
  String get notificationsExpand => 'Expand';

  @override
  String get notificationsCollapse => 'Collapse';

  @override
  String get notificationsMessageUnavailable =>
      'This message couldn\'t be loaded.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining characters left';
  }

  @override
  String get characterCounterTooLong => 'Message is too long';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining characters left. Get $productName to write up to $premiumMaxLength characters.';
  }

  @override
  String get chatMessageFailedToSend => 'Failed to send message';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Your message could not be delivered. This is usually because you don\'t share a community with the recipient or the recipient is only accepting direct messages from friends. You may also need to adjust your own direct message privacy settings in $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Your message could not be delivered. You need to claim your account to send direct messages.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Your message could not be delivered. You need to claim your account to send messages.';

  @override
  String get chatSendFailureContentBlocked =>
      'Your message could not be delivered because it was flagged by our safety systems. If you believe this is a mistake, please contact support.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Your message could not be delivered because it contains mature emoji or stickers that are not allowed in this context.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Only you can see this message.';

  @override
  String get chatClientSystemDismiss => 'Dismiss';

  @override
  String get privacyDashboardCommunicationSection => 'Cumarsáid';

  @override
  String get chatMessageDeleteFailed => 'Teip ar Scriosadh Teachtaireachta';

  @override
  String get chatMessageAddReaction => 'Cuir Imoibriú Leis';

  @override
  String get chatMessageEdit => 'Cuir Teachtaireacht in Eagar';

  @override
  String get chatMessageReply => 'Freagair';

  @override
  String get chatMessageForward => 'Ar Aghaidh';

  @override
  String get forwardMessageTitle => 'Ar aghaidh teachtaireacht';

  @override
  String get forwardSearchHint => 'Cuardaigh cainéil nó DManna';

  @override
  String get forwardDirectMessagesSection => 'Teachtaireachtaí Díreacha';

  @override
  String get forwardCommentHint => 'Cuir trácht leis (roghnach)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Seol ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Ní bhfuarthas aon chainéal';

  @override
  String get forwardSuccessToast => 'Ar aghaidh teachtaireacht';

  @override
  String get forwardFailed => 'Theip ar theachtaireacht a chur ar aghaidh';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Níl tráchtanna ar fáil mar go bhfuil mallmhuirear gníomhach ar chainéal roghnaithe.';

  @override
  String get forwardDestinationNoSendPermission =>
      'Ní féidir leat teachtaireachtaí a sheoladh anseo';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Ní féidir leat naisc a leabú anseo';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Ní féidir leat comhaid a cheangail anseo';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Tá seoladh teachtaireachtaí díchumasaithe sa phobal seo';

  @override
  String get forwardDestinationTimedOut => 'Tá tú ar sos sa phobal seo';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Mallsaoireacht - fan $remaining';
  }

  @override
  String get chatMessageCopyText => 'Cóipeáil Teachtaireacht';

  @override
  String get chatMessagePin => 'Greamóidh teachtaireacht';

  @override
  String get chatMessageUnpin => 'Díghreamóidh teachtaireacht';

  @override
  String get chatMessageUnpinIt => 'Díghreamóidh é';

  @override
  String get chatMessageBookmark => 'Cuir Teachtaireacht in Áirithe';

  @override
  String get chatMessageRemoveBookmark => 'Bain Áirithint';

  @override
  String get chatMessageMarkAsUnread => 'Marcáil mar Neamhléite';

  @override
  String get chatMessageCopyMessageLink => 'Cóipeáil Nasc Teachtaireachta';

  @override
  String get chatMessageCopyMessageId => 'Cóipeáil ID Teachtaireachta';

  @override
  String get chatMessageViewReactions => 'Féach ar imoibrithe';

  @override
  String get chatMessageRemoveAllReactions => 'Bain gach imoibriú';

  @override
  String get chatMessageDebug => 'Teachtaireacht Dífhabhtaithe';

  @override
  String get chatMessageDebugSheetTitle => 'Teachtaireacht dífhabhtaithe';

  @override
  String get chatMessageDebugCopyJson => 'Cóipeáil JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Cóipeáladh JSON teachtaireachta chuig an gearrthaisce';

  @override
  String get chatReactionsSheetTitle => 'Imoibrithe';

  @override
  String get chatReactionsSheetEmpty =>
      'Níor fhreagair éinne leis seo go fóill.';

  @override
  String get chatMessageReport => 'Tuairiscigh Teachtaireacht';

  @override
  String get iarReportMessageTitle => 'Tuairiscigh teachtaireacht';

  @override
  String get iarThisUserFallback => 'an t-úsáideoir seo';

  @override
  String get iarModalDescription =>
      'Tuairiscigh sárú rialach, nó faigh uirlisí chun teagmháil agus roghanna a bhainistiú.';

  @override
  String get iarPathStepAriaLabel => 'Cad a theastaíonn uait?';

  @override
  String get iarCategoryStepTitle => 'Cén cineál rialach a briseadh?';

  @override
  String get iarReasonStepTitle => 'Cén riail a briseadh?';

  @override
  String get iarReasonSelectHint => 'Roghnaigh cúis';

  @override
  String get iarPickAnOptionToast =>
      'Roghnaigh rogha chun leanúint ar aghaidh.';

  @override
  String get iarPickARuleToast => 'Roghnaigh an riail a briseadh.';

  @override
  String get iarPathPlatform => 'Tuairiscigh sárú rialacháin ardáin';

  @override
  String get iarPathCommunity => 'Tuairiscigh do mhodhnóirí an phobail seo';

  @override
  String get iarPathPreferenceMessage => 'Ní thaitníonn an t-ábhar seo liom';

  @override
  String get iarCategoryTargetedHarmLabel => 'Bagraí, ciapadh, nó dochar';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bulaíocht, bagairtí, fuath, foréigean, ruathair, nó ábhar a spreagann féindhochar.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Sábháilteacht leanaí nó ábhar aibí';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Leanaí i mbaol, ábhar aibí san áit mhícheart, nó iompar nach dteastaíonn.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Príobháideacht nó d’aithint';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxáil, faireachán, ligean ort gur duine eile thú, nó próifíl mhíchuí.';

  @override
  String get iarCategoryDeceptionLabel => 'Scamanna, malware, nó drochíde';

  @override
  String get iarCategoryDeceptionDescription =>
      'Fisín, calaois, naisc dhainséaracha, nó éilimh bhréagacha a d’fhéadfadh dochar sa saol fíor a dhéanamh.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Gníomhaíocht neamhdhleathach nó rud éigin eile';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Díolacháin neamhdhleathacha, comhchealú coireachta, nó sárú soiléir rialacha nach n-oirfeadh thuas.';

  @override
  String get iarReasonHarassmentLabel => 'Ciapadh nó bagairtí';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bulaíocht, teagmháil athchleachtach nach dteastaíonn, faireachán, nó ionsaí dírithe.';

  @override
  String get iarReasonHateLabel => 'Caint fhuatha';

  @override
  String get iarReasonHateMessageDescription =>
      'Mí-úsáid, teanga dhí-dhaonnaithe, nó ionsaithe ar ghrúpaí cosanta.';

  @override
  String get iarReasonViolenceLabel => 'Foréigean nó bagairtí foréigneacha';

  @override
  String get iarReasonViolenceDescription =>
      'Bagraí inchreidte, foréigean grafach, nó glóiriú foréigin.';

  @override
  String get iarReasonMatureContentLabel => 'Ábhar aibí nó ciapadh';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Iompar nach dteastaíonn nó ábhar aibí san áit mhícheart.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Sábháilteacht leanaí nó saothrú mionaoiseach';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Ábhar grooming nó saothrú leanaí.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Drochíde dhainséarach';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Éilimh bhréagacha a d’fhéadfadh dochar sa saol fíor a dhéanamh.';

  @override
  String get iarReasonSpamLabel => 'Spam, scamanna, nó fisín';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam ollmhór, calaois, bronntanais bhréagacha, nó mí-úsáid cuntais.';

  @override
  String get iarReasonMalwareLabel => 'Malware nó naisc dhainséaracha';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, goid creidiúna, nó comhaid dhainséaracha.';

  @override
  String get iarReasonPrivacyLabel => 'Sárú príobháideachta';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxáil, faisnéis phríobháideach nochta, nó faireachán.';

  @override
  String get iarReasonImpersonationLabel =>
      'D’aithint nó meáin mheabhlaireachta';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Ag ligean ort gur duine eile thú, lena n-áirítear ábhar giniúna AI meabhlach.';

  @override
  String get iarReasonIllegalLabel => 'Gníomhaíocht neamhdhleathach';

  @override
  String get iarReasonIllegalDescription =>
      'Díolacháin neamhdhleathacha, comhchealú coireachta, nó gníomhaíocht neamhdhleathach.';

  @override
  String get iarReasonSelfHarmLabel => 'Féindhochar nó féinmharú';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Cur chun cinn nó treoracha ag spreagadh féindhochair nó neamhoird itheacháin.';

  @override
  String get iarReasonOtherLabel => 'Sárú soiléir rialacha eile';

  @override
  String get iarReasonOtherDescription =>
      'Ná húsáid ach amháin má sháraíonn sé rialacha Fluxer go soiléir agus mura n-oirfeadh sé thuas.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Má tá mionaoiseach i gceist, bain úsáid as \"$childSafetyReason\" ina ionad.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Má bhaineann sé seo le CSAM nó saothrú mionaoisigh, seol é anois agus ná athsheol an t-ábhar.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Má tá duine i mbaol láithreach, déan teagmháil le seirbhísí éigeandála áitiúla más féidir leat é sin a dhéanamh go sábháilte.';

  @override
  String get iarSafetyNoteViolence =>
      'Má tá bagairt fhoréigin inchreidte ann, déan teagmháil le seirbhísí éigeandála áitiúla freisin.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Má tá bagairt sceimhlitheoireachta láithreach ann, déan teagmháil le seirbhísí éigeandála áitiúla freisin.';

  @override
  String get iarActionBlockUserTitle => 'Cuir bac ar an úsáideoir seo';

  @override
  String get iarActionBlockUserDescription =>
      'Stop teachtaireachtaí agus iarrataí cairde.';

  @override
  String get iarActionBlockUserButton => 'Cuir bac ar';

  @override
  String get iarActionCopyMessageLinkTitle => 'Cóipeáil nasc teachtaireachta';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Comhroinn le modhnóirí pobail.';

  @override
  String get iarActionCopyMessageLinkButton => 'Cóipeáil';

  @override
  String get iarActionCloseDmTitle => 'Dún an DM seo';

  @override
  String get iarActionCloseDmDescription =>
      'Ní chuireann sé bac. Is féidir leat é a athoscailt níos déanaí.';

  @override
  String get iarActionCloseDmButton => 'Dún DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Fág an pobal';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Stop ag féachaint ar a bhfuil ann agus ar a chuid ball.';

  @override
  String get iarActionLeaveCommunityButton => 'Fág';

  @override
  String get iarActionDmSettingsTitle => 'Socruithe DM & iarrataí cara';

  @override
  String get iarActionDmSettingsDescription =>
      'Athraigh cé atá in ann teagmháil a dhéanamh leat.';

  @override
  String get iarActionCallSettingsTitle => 'Socruithe glaonna & comhrá grúpa';

  @override
  String get iarActionCallSettingsDescription =>
      'Athraigh cé atá in ann glaoch ort nó tú a chur leis.';

  @override
  String get iarActionOpenButton => 'Oscail';

  @override
  String get iarActionDeleteMessageTitle => 'Scrios an teachtaireacht seo';

  @override
  String get iarActionDeleteMessageDescription =>
      'Bain é ón gcainéal do chách.';

  @override
  String get iarActionDeleteMessageButton => 'Scrios';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Scriosta';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Scriosadh an teachtaireacht seo cheana féin.';

  @override
  String get iarActionBanUserTitle => 'Toirmisc an t-úsáideoir seo';

  @override
  String get iarActionBanUserDescription =>
      'Oscail an dialóg toirmisc don phobal seo.';

  @override
  String get iarActionBanUserButton => 'Toirmisc';

  @override
  String get iarActionBanUserBannedButton => 'Toirmisc';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Tá an t-úsáideoir seo toirmisc cheana féin ón bpobal.';

  @override
  String get iarCloseDmConfirmTitle => 'Dún DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Dún do DM reatha le $name. Ní chuireann sé seo cosc orthu; is féidir leat athoscailt níos déanaí.';
  }

  @override
  String get iarSuccessTitle => 'Tuairisc seolta';

  @override
  String get iarSuccessBody =>
      'Tá ár bhfoireann slándála á hathbhreithniú. Seolfaimid DM agus ríomhphost chugat nuair a bheidh breithiúnas bainte amach againn.';

  @override
  String get iarAlreadyReportedTitle => 'Tuairiscíodh cheana féin';

  @override
  String get iarAlreadyReportedBody =>
      'Tá an teachtaireacht seo tuairiscithe agat cheana féin. Tá ár bhfoireann slándála á hathbhreithniú.';

  @override
  String get iarBackButton => 'Ar ais';

  @override
  String get iarContinueButton => 'Ar aghaidh';

  @override
  String get iarSendReportButton => 'Seol tuairisc';

  @override
  String get iarDoneButton => 'Críochnaithe';

  @override
  String get iarCouldntSendToast =>
      'Níorbh fhéidir an tuairisc a sheoladh. Bain triail eile as le do thoil.';

  @override
  String get iarRateLimitedToast =>
      'Tá tú ag tuairisciú ró-ghasta. Fan nóiméad agus bain triail eile as le do thoil.';

  @override
  String get iarReportSentToast =>
      'Tuairisc seolta. Déanfaidh ár bhfoireann slándála athbhreithniú uirthi.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Bloc $name? Ní bheidh siad in ann teachtaireacht a chur chugat nó iarrataí cara a sheoladh chugat. Is féidir leat iad a dhíbhlocáil níos déanaí.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Níorbh fhéidir an t-úsáideoir seo a bhlocáil. Bain triail eile as le do thoil.';

  @override
  String get iarCloseDmSuccessToast => 'DM dúnta.';

  @override
  String get iarCloseDmFailedToast =>
      'Níorbh fhéidir an DM seo a dhúnadh. Bain triail eile as le do thoil.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Níorbh fhéidir an pobal seo a fhágáil. Bain triail eile as le do thoil.';

  @override
  String get chatMessageSuppressEmbeds => 'Ceilt Nascphointí';

  @override
  String get chatMessageUnsuppressEmbeds => 'Taispeáin Nascphointí';

  @override
  String get chatMessageDelete => 'Scrios Teachtaireacht';

  @override
  String get chatMessageDeleteConfirmTitle => 'Scrios Teachtaireacht';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'An bhfuil tú cinnte gur mhaith leat an teachtaireacht seo a scriosadh?';

  @override
  String get chatMessageMore => 'Tuilleadh';

  @override
  String get chatEditingMessage => 'Ag cur in eagar teachtaireacht';

  @override
  String get chatReplyOriginalDeleted => 'Scriosadh an teachtaireacht bhunaidh';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Theip ar an teachtaireacht bhunaidh a luchtú';

  @override
  String get chatReplyAttachedMedia =>
      'Tá meáin cheangailte leis an teachtaireacht';

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
  String get chatMessagesLoadError =>
      'Níorbh fhéidir teachtaireachtaí a luchtú.';

  @override
  String get chatReplyMentionOverrideTitle => 'Sárú ar rogha lua?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'Is fearr le $authorNickname @lua ar fhreagraí. An seoladh gan an lua mar sin féin?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname is móide freagraí gan @luaigh. Seol le luaigh ar aon nós?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Déan neamhaird den rogha';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Cliceáil chun an duine a bhfuil tú ag freagairt dó a dhíchumasú.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Cliceáil chun an duine a bhfuil tú ag freagairt dó a chumasú.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Luaigh úsáideoir freagraithe';

  @override
  String get chatReplyMentionOn => 'Ar';

  @override
  String get chatReplyMentionOff => 'As';

  @override
  String get chatReplyCancel => 'Cealaigh freagra';

  @override
  String get chatEditMessageHint => 'Edit message';

  @override
  String get chatEditNoChanges => 'Níor athraíodh rud ar bith le sábháil';

  @override
  String get chatChannelNotReady =>
      'Níl an cainéal seo réidh fós. Bain triail eile as ar ball.';

  @override
  String get chatMessageEdited => '(eagarthóireacht)';

  @override
  String get chatMessageSilent => 'Bhí seo ina @silent teachtaireacht.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Inniu ag $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Inné ag $time';
  }

  @override
  String get mediaViewerImagePreview => 'Réamhamharc ar íomhá';

  @override
  String get mediaViewerClose => 'Dún amharcóir meán';

  @override
  String get mediaViewerOpenInBrowser => 'Oscail sa bhrabhálaí';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'Ar aghaidh';

  @override
  String get mediaViewerZoomIn => 'Zúmáil isteach';

  @override
  String get mediaViewerZoomOut => 'Zúmáil amach';

  @override
  String get mediaViewerPreviousAttachment => 'Comhad iattac séimhéad';

  @override
  String get mediaViewerNextAttachment => 'Comhad iattac seo chugainn';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Athraigh rialuithe físe';

  @override
  String get chatAttachmentVideoMute => 'Balbhaigh físeán';

  @override
  String get chatAttachmentVideoUnmute => 'Díbalbhaigh físeán';

  @override
  String get chatAttachmentVideoPlay => 'Seinn físeán';

  @override
  String get chatAttachmentVideoPause => 'Cuir físeán ar sos';

  @override
  String get chatAttachmentVideoProgress => 'Dul chun cinn físe';

  @override
  String get chatVideoPlaybackFailed =>
      'Níorbh fhéidir an físeán seo a sheinm.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Cuir in iúl d\'úsáideoirí leis an ról seo a bhfuil cead acu an cainéal seo a fheiceáil.';

  @override
  String get addGuildModalTitle => 'Cuir pobal leis';

  @override
  String get addGuildModalLandingDescription =>
      'Cruthaigh pobal nua nó bí le pobal atá ann cheana.';

  @override
  String get addGuildCreateCommunity => 'Cruthaigh pobal';

  @override
  String get addGuildJoinCommunity => 'Bí le pobal';

  @override
  String get addGuildImportDiscordTemplate => 'Iompórtáil teimpléad Discord';

  @override
  String get addGuildJoinTitle => 'Bí le pobal';

  @override
  String get addGuildJoinDescription =>
      'Iontráil an nasc cuireadh chun pobal a bhaint amach.';

  @override
  String get addGuildInviteLinkLabel => 'Nasc cuireadh';

  @override
  String get addGuildJoinSubmit => 'Bí le pobal';

  @override
  String get addGuildInviteInvalid =>
      'Tá an cuireadh seo neamhbhailí nó tá sé imithe in éag.';

  @override
  String get addGuildJoinFailed =>
      'Níorbh fhéidir leis an bpobal a bhaint amach. Bain triail eile as.';

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
  String get addGuildPackInstalled => 'Suiteáladh an pacáiste go rathúil.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'Bain Gachimoibriú';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'An bhfuil tú cinnte gur mhaith leat gach imoibriú ón teachtaireacht seo a bhaint?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Díphionnaigh teachtaireacht';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Seol an biorán seo ar ais in am?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username ancaire $messageLink chuig an gcainéal seo. Féach $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'teachtaireacht';

  @override
  String get systemPinMessageAllPinsLink => 'gach teachtaireacht ancaire';

  @override
  String get channelPinsEmptyTitle => 'Níl teachtaireachtaí greamaithe';

  @override
  String get channelPinsEmptyDescription =>
      'Taispeánfar teachtaireachtaí greamaithe anseo.';

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
  String get personalNotesTitle => 'Nótaí pearsanta';

  @override
  String get personalNotesSubtitle =>
      'Do spás príobháideach le haghaidh smaointe agus meabhrúchán';

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
    return 'Fáilte go $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Ar an tús, ní raibh tada ann. Ansin, bhí $channelName. Agus bhí sé go maith.';
  }

  @override
  String get personalNotesComposerHint => 'Seol teachtaireacht chugat féin';

  @override
  String get personalNotesPrivateSpace => 'Do spás príobháideach';

  @override
  String get purgePersonalNotes => 'Scrios nótaí pearsanta';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Scriosfaidh sé seo go buan gach teachtaireacht agus gabháltas i do nótaí pearsanta. Ní féidir é seo a chur ar ceal.';

  @override
  String get purgePersonalNotesConfirmButton => 'Scrios';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Scriosadh $count teachtaireacht ó nótaí pearsanta';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Bhí nótaí pearsanta folamh cheana féin';

  @override
  String get purgePersonalNotesFailed =>
      'Níorbh fhéidir nótaí pearsanta a ghlanadh';

  @override
  String get userSettingsGroupYourAccount => 'DO CHUNTAS';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Próifíl';

  @override
  String get userSettingsNavSecurityLogin => 'Slándáil & Logáil Isteach';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Bronntanais & Códanna';

  @override
  String get userSettingsNavPrivacyDashboard => 'Painéal Príobháideachta';

  @override
  String get userSettingsNavAuthorizedApps => 'Aipeanna Údaraithe';

  @override
  String get userSettingsNavBlockedUsers => 'Úsáideoirí Blocáilte';

  @override
  String get userSettingsNavLinkedDevices => 'Gairis Nasctha';

  @override
  String get userSettingsNavConnections => 'Naisc';

  @override
  String get userSettingsNavLookAndFeel => 'Cuma & Mothú';

  @override
  String get userSettingsNavAccessibility => 'Inrochtaineacht';

  @override
  String get userSettingsNavChat => 'Teachtaireachtaí & Meáin';

  @override
  String get userSettingsNavAudioAndVideo => 'Fuaim & Físeán';

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
  String get userSettingsNavLanguageAndTime => 'Teanga & Am';

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
  String get userSettingsNavAdvanced => 'Ardroghanna';

  @override
  String get advancedPerformanceReportingTitle => 'Tuairisciú feidhmíochta';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Cuidigh le Fluxer a fheabhsú trí shonraí timpiste agus feidhmíochta anaithnid a roinnt.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Seol tuairiscí timpiste agus feidhmíochta';

  @override
  String get advancedPerformanceReportingDescription =>
      'Tá gach sonraí tuairiscithe anaithnid agus ní sheoltar ach chuig seirbhís monatóireachta Fluxer féin — ní úsáidtear aon soláthraithe tríú páirtí.';

  @override
  String get userSettingsNavApplications => 'Aipeanna';

  @override
  String get userSettingsNavAppLogs => 'Logaí Aipe';

  @override
  String get userSettingsNavDeveloperTools => 'Uirlisí Forbróra';

  @override
  String get userSettingsNavLimitsConfig => 'Cumraíocht Teorainneacha';

  @override
  String get userSettingsNavFeatureFlags => 'Bratacha Gné';

  @override
  String get userSettingsNavWhatsNew => 'Cad atá Nua';

  @override
  String get userSettingsNavLogOut => 'Logáil Amach';

  @override
  String get betaWarningTitle => 'Bogearraí béite';

  @override
  String get betaWarningMessage =>
      'Is bogearraí béite é seo. Níl gach rud críochnaithe nó curtha leis fós.';

  @override
  String get betaWarningReportIssues =>
      'Tabhair tuairisc ar aon fhadhbanna a aimsíonn tú chuig pobal Fluxer Mobile (caithfidh Plutonium a bheith agat chun a bheith in ann an pobal a nascadh faoi láthair).';

  @override
  String get betaWarningRepoLink => 'Féach foinse ar GitHub';

  @override
  String get betaWarningGotIt => 'Tuigeadh é';

  @override
  String get quickSwitcherTabSearch => 'Cuardach';

  @override
  String get quickSwitcherTabFriends => 'Cairde';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Cuardaigh canálacha, daoine, nó pobail';

  @override
  String get quickSwitcherSearchFriends => 'Cuardaigh cairde';

  @override
  String get quickSwitcherNoMatchesFound => 'Ní bhfuarthas aon mheaitseáil';

  @override
  String get quickSwitcherEmptyHint =>
      'Bain triail as ainm eile nó bain úsáid as na réimíreanna @ / # / ! / * chun torthaí a scagadh.';

  @override
  String get quickSwitcherSectionPeople => 'Daoine';

  @override
  String get quickSwitcherSectionGroupMessages => 'Teachtaireachtaí Grúpa';

  @override
  String get quickSwitcherSectionTextChannels => 'Cainéil téacs';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Cainéil gutha';

  @override
  String get quickSwitcherSectionCommunities => 'Pobail';

  @override
  String get quickSwitcherSectionSettings => 'Socruithe';

  @override
  String get quickSwitcherHomeLabel => 'Baile';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Teachtaireachtaí Díreacha';

  @override
  String get quickSwitcherFavoritesLabel => 'Roghanna';

  @override
  String get quickSwitcherUserSettingsLabel => 'Socruithe Úsáideora';

  @override
  String get quickSwitcherNotificationsLabel => 'Fógraí';

  @override
  String get quickSwitcherBookmarksLabel => 'Nodlai';

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
  String get quickSwitcherMentionsLabel => 'Luaitear';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Gan cairde fós';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Cuir cara leis chun tosú.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Ní mheaitseálann aon chairde sin';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Bain triail as ainm eile.';

  @override
  String get quickSwitcherSearchAliasUser => 'Úsáideoir';

  @override
  String get quickSwitcherSearchAliasYou => 'Tusa';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DMs';

  @override
  String get quickSwitcherSearchAliasMessages => 'Teachtaireachtaí';

  @override
  String get quickSwitcherSearchAliasFav => 'Rogh.';

  @override
  String get quickSwitcherSearchAliasStarred => 'Nodlai';

  @override
  String get quickSwitcherSearchAliasInbox => 'Bosca isteach';

  @override
  String get quickSwitcherSearchAliasSaved => 'Sábháilte';

  @override
  String get uiClose => 'Dún';

  @override
  String get chatJumpToBottom => 'Léim go dtí an bun';

  @override
  String get uiConfirm => 'Deimhnigh';

  @override
  String get uiLoading => 'Ag luchtú';

  @override
  String get uiUnsavedChanges => 'Athruithe neamhshábháilte';

  @override
  String get uiReset => 'Athshocraigh';

  @override
  String get uiOpenColorPicker => 'Oscail an roghnóir dathanna';

  @override
  String get uiSelectPlaceholder => 'Roghnaigh';

  @override
  String get uiSearchPlaceholder => 'Cuardaigh';

  @override
  String get uiNoOptionsFound => 'Ní bhfuarthas aon roghanna';

  @override
  String get uiDismissNotification => 'Díbhe an fógra';

  @override
  String get uiColorPickerTitle => 'Roghnóir dathanna';

  @override
  String get mentionConfirmTitle => 'Luaigh gach duine?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Cuirfidh sé seo $count ball in iúl. Lean ar aghaidh?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Cuirfidh sé seo $count ball ar líne in iúl. Lean ar aghaidh?';
  }

  @override
  String get mentionConfirmButton => 'Luaigh';

  @override
  String get composerEmojiUnavailable =>
      'Ní féidir leat an emoji sin a úsáid anseo.';

  @override
  String get instanceUrlLabel => 'URL an Chórais';

  @override
  String get instanceUrlPlaceholder =>
      'Iontráil URL an chórais (m.sh. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Athshocraigh go Fluxer';

  @override
  String get instanceConnect => 'Ceangail';

  @override
  String get instanceConnecting => 'Ag ceangal…';

  @override
  String get instanceConnectFailed => 'Teip ar an nasc leis an instans';

  @override
  String get recentInstances => 'Insteansanna le déanaí';

  @override
  String removeRecentInstance(String domain) {
    return 'Bain $domain ó insteansanna le déanaí';
  }

  @override
  String get instanceSheetTitle => 'Ceangail leis an instans';

  @override
  String get connectToDifferentInstance => 'Ceangail le hinsteans eile';

  @override
  String get changeInstance => 'Athraigh';

  @override
  String get instanceConnectionRequired =>
      'Ceangail leis an instans chun logáil isteach';

  @override
  String get comingSoon => 'Ag teacht go luath';

  @override
  String get guildNavbarDirectMessages => 'Teachtaireachtaí Díreacha';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Aimsigh Pobail Infheicthe';

  @override
  String get discoveryExplore => 'Aimsigh';

  @override
  String get discoveryExplorePublicCommunities => 'Aimsigh pobail phoiblí';

  @override
  String get discoveryListingSubheading =>
      'Ar mhaith leat do phobal a liostáil anseo? Déan iarratas má chomhlíonann tú na riachtanais i socruithe do phobail > Aimsigh.';

  @override
  String get discoverySearchCommunities => 'Cuardaigh pobail';

  @override
  String get discoveryFilterByLanguage => 'Scagaire de réir teanga';

  @override
  String get discoveryAllLanguages => 'Gach teanga';

  @override
  String get discoveryAllCategories => 'Gach ceann';

  @override
  String get discoveryCategoryGaming => 'Cearrbhachas';

  @override
  String get discoveryCategoryMusic => 'Ceol';

  @override
  String get discoveryCategoryEntertainment => 'Siamsaíocht';

  @override
  String get discoveryCategoryEducation => 'Oideachas';

  @override
  String get discoveryCategoryScienceAndTechnology =>
      'Eolaíocht & Teicneolaíocht';

  @override
  String get discoveryCategoryContentCreator => 'Cruthaitheoir Ábhar';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Scannáin & Teilifís';

  @override
  String get discoveryCategoryOther => 'Eile';

  @override
  String get discoveryNoCommunitiesMatch => 'Ní thagann aon phobail leis.';

  @override
  String get discoveryJoinCommunity => 'Bí i bpobal';

  @override
  String get discoveryJoined => 'Bainteach';

  @override
  String discoveryOnlineCount(String count) {
    return '$count ar líne';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ball',
      one: '1 ball',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Gan cur síos.';

  @override
  String get discoveryCommunities => 'Pobail';

  @override
  String get discoveryApps => 'Aipeanna';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Níorbh fhéidir leis an bpobal seo a bheith páirteach';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Tharla rud éigin mícheart. Bain triail eile as i gceann nóiméid.';

  @override
  String get discoveryJoinErrorFullTitle => 'Tá an pobal seo lán';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Tá an pobal seo tar éis a theorainn ball a bhaint amach, mar sin ní féidir leat a bheith páirteach faoi láthair.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Tá an teorainn pobail bainte amach agat';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Tá tú sa líon uasta pobal. Fág ceann amháin agus bain triail eile as.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Ní féidir leat a bheith páirteach sa phobal seo';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Tá cosc curtha ort ón bpobal seo.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Níl an pobal seo ar fáil a thuilleadh';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'D\'fhéadfadh sé gur fhág sé an aimsíocht nó gur mhúin sé pobail nua isteach. Athnuaigh an leathanach agus ní fheicfidh tú arís é.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Tá tú ag dul ró-ghasta';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Fan nóiméad agus bain triail eile as.';

  @override
  String get guildNavbarAddCommunity => 'Cuir Pobal leis';

  @override
  String get guildNavbarHelp => 'Cabhair';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'TEACHTAIREACHT NUA';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Dún $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Grúpa DM';

  @override
  String get guildNavbarCreateChannel => 'Cruthaigh Caint';

  @override
  String get guildNavbarChannelType => 'Cineál Cainte';

  @override
  String get guildNavbarTextChannel => 'Caint Téacs';

  @override
  String get guildNavbarTextChannelDescription =>
      'Seol teachtaireachtaí, íomhánna, GIFanna, agus emoji';

  @override
  String get guildNavbarVoiceChannel => 'Caint Guth';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Caith am le chéile le guth, físeán, agus scáileánscáileán';

  @override
  String get guildNavbarLinkChannel => 'Nasc Caint';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Rochtain thapa ar shuíomh gréasáin nó acmhainn sheachtrach';

  @override
  String get guildNavbarNameLabel => 'Ainm';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Cruthaigh Catagóir';

  @override
  String get guildNavbarNewCategoryHint => 'Catagóir Nua';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Téigh cuireadh chuig cairde chuig $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Tógfar faighteoirí chuig #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Cuardaigh cairde';

  @override
  String get guildNavbarNoFriendsYet => 'Gan cairde fós';

  @override
  String get guildNavbarNoResults => 'Gan torthaí';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Nó, seol nasc cuireadh chuig cara:';

  @override
  String get guildNavbarInviteLink => 'Nasc cuireadh';

  @override
  String get guildNavbarCopy => 'Cóipeáil';

  @override
  String get guildNavbarCopied => 'Cóipeáladh!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Díreach 7 lá a mhairfidh do nasc cuireadh.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Ní dhéanfaidh an nasc cuireadh seo dul in éag riamh.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Díreach $duration a mhairfidh do nasc cuireadh.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Cuir nasc cuireadh in eagar';

  @override
  String get guildNavbarInviteLinkSettings => 'Socruithe nasc cuireadh';

  @override
  String get guildNavbarExpireAfter => 'Díreach Tar éis';

  @override
  String get guildNavbarMaxUses => 'Uasmhéid Úsáidí';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Deonaigh Ballraíocht Shealadach';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Bainfear baill nuair a théann siad as líne mura sannfar ról';

  @override
  String get guildNavbarCreateNewLink => 'Cruthaigh Nasc Nua';

  @override
  String get guildNavbarSent => 'Seolta';

  @override
  String get guildNavbarInvite => 'Cuir cuireadh';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Fág an Pobail';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'An bhfuil tú cinnte gur mhaith leat an pobal seo a fhágáil? Ní bheidh tú in ann teachtaireachtaí ar bith a fheiceáil a thuilleadh.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Fág an Pobail';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Scrios do theachtaireachtaí sa phobail seo?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Scrios go buan gach teachtaireacht a sheol tú anseo, ar gach caint. Ní féidir é a chur ar ceal.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm =>
      'Scrios Mo Theachtaireachtaí';

  @override
  String get guildNavbarDeletedYourMessages => 'Scriosadh do theachtaireachtaí';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Níorbh fhéidir do theachtaireachtaí a scriosadh';

  @override
  String get guildNavbarRemoveOverride => 'Bain an sárú';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Caomhnaithe go dtí $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Naisc le foireann Fluxer amháin';

  @override
  String get guildNavbarInvitesPaused =>
      'Tá cuireadh ar fionraí faoi láthair sa phobail seo';

  @override
  String get guildNavbarDurationNever => 'riamh';

  @override
  String get guildNavbarDuration30Minutes => '30 nóiméad';

  @override
  String get guildNavbarDuration1Hour => '1 uair an chloig';

  @override
  String get guildNavbarDuration6Hours => '6 uair an chloig';

  @override
  String get guildNavbarDuration12Hours => '12 uair an chloig';

  @override
  String get guildNavbarDuration1Day => '1 lá';

  @override
  String get guildNavbarDuration7Days => '7 lá';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count soicind';
  }

  @override
  String get guildNavbarNever => 'Riamh';

  @override
  String get guildNavbarNoLimit => 'Gan teorainn';

  @override
  String get guildNavbarOneUse => '1 úsáid';

  @override
  String guildNavbarUses(int count) {
    return '$count úsáidí';
  }

  @override
  String get guildMenuMarkAsRead => 'Marcáil mar Léite';

  @override
  String get guildPeekMoreOptions => 'Tuilleadh Roghanna';

  @override
  String get guildMenuInviteMembers => 'Téalainn Baill';

  @override
  String get guildMenuCommunitySettings => 'Socruithe Pobail';

  @override
  String get guildMenuEditCommunityProfile =>
      'Cuir Próifíl an Phobail in Eagar';

  @override
  String get guildMenuUnmuteCommunity => 'Dí-bhain an tost ón bPobal';

  @override
  String get guildMenuMuteCommunity => 'Caith tost ar an bPobal';

  @override
  String get guildMenuHideMutedChannels => 'Folaigh Cainséil Bhainiste';

  @override
  String get guildMenuReportCommunity => 'Tuarascáil ar an bPobal';

  @override
  String get guildMenuDebugCommunity => 'Dífhabhtáil an Pobail';

  @override
  String get guildMenuCopyCommunityId => 'Cóipeáil ID an Phobail';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Go dtí $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Ginearálta';

  @override
  String get guildMenuSettingsRoles => 'Róil & Ceadanna';

  @override
  String get guildMenuSettingsEmoji => 'Emóji Saincheaptha';

  @override
  String get guildMenuSettingsStickers => 'Greamáin Saincheaptha';

  @override
  String get guildMenuSettingsSafetyModeration => 'Sábháilteacht & Muiríneacht';

  @override
  String get guildMenuSettingsActivityLog => 'Log Gníomhaíochta';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'URL Cuireadh Saincheaptha';

  @override
  String get guildMenuSettingsDiscovery => 'Fionnachtain';

  @override
  String get guildMenuSettingsMembers => 'Baill';

  @override
  String get guildMenuSettingsInviteLinks => 'Naisc Cuireadh';

  @override
  String get guildMenuSettingsBans => 'Toirmisc';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Níl cead agat an cluaisín socruithe seo a fheiceáil.';

  @override
  String get guildSettingsOverviewIconTitle => 'Deilbhín';

  @override
  String get guildSettingsUploadImage => 'Uaslódáil Íomhá';

  @override
  String get guildSettingsOverviewBannerTitle => 'Bratach';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Uaslódáil bratach do do fhreastalaí.';

  @override
  String get guildSettingsOverviewNameTitle => 'Ainm';

  @override
  String get guildSettingsOverviewNameHint => 'Mo phobal iontach';

  @override
  String get guildSettingsOverviewStatsTitle => 'Staitisticí';

  @override
  String get guildSettingsOverviewMembers => 'Baill';

  @override
  String get guildSettingsOverviewOnline => 'Ar Líne';

  @override
  String get guildSettingsRolesDescription =>
      'Úsáid róil chun baill a ghrúpáil agus chun ceadanna a shannadh.';

  @override
  String get guildSettingsCreateRole => 'Cruthaigh Ról';

  @override
  String get guildSettingsRolesListTitle => 'Róil';

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
    return '$staticCount emóji statach, $animatedCount emóji beoite á n-úsáid';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Níl emóji saincheaptha ar bith fós.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count greamáin uaslódáilte';
  }

  @override
  String get guildSettingsStickersEmpty =>
      'Níl greamáin saincheaptha ar bith fós.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Fíorú ball';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Roghnaigh cad ba chóir a bheith ag baill sula mbeidh siad in ann baill pobail a phostáil nó a sheoladh teachtaireachtaí príobháideacha dóibh.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Is féidir le baill a bhfuil róil acu na seiceálacha seo a sheachbhóthar. Maidir le spásanna poiblí, molaimid dearbhú a chumasú.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Teastaíonn ríomhphost deimhnithe ar a laghad ó phobail atá liostaithe i Discovery. Ní féidir \'Aon cheann\' a roghnú agus Discovery cumasaithe.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Ábhar aibí & foláirimh ábhair';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Cumraigh lipéadú ábhair aibí agus foláirimh ábhair roghnacha do bhaill.';

  @override
  String get guildSettingsModerationMatureToggle => 'Ábhar aibí';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marcáil an pobal seo mar ábhar aibí.';

  @override
  String get guildSettingsVerificationNone => 'Aon cheann';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Ní theastaíonn aon dearbhú.';

  @override
  String get guildSettingsVerificationLow => 'Íseal';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Teastaíonn seoladh ríomhphoist deimhnithe.';

  @override
  String get guildSettingsVerificationMedium => 'Meánach';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Teastaíonn seoladh ríomhphoist deimhnithe, agus cuntas atá 5 nóiméad d\'aois ar a laghad.';

  @override
  String get guildSettingsVerificationHigh => 'Ard';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Teastaíonn gach rud sa mheánach, móide a bheith i do bhall den phobal ar feadh 10 nóiméad ar a laghad.';

  @override
  String get guildSettingsVerificationHighest => 'An-ard';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Teastaíonn uimhir ghutháin deimhnithe.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Rianaigh gníomhartha modhnóirí ar fud an phobail.';

  @override
  String get guildSettingsAuditLogEmpty => 'Níl logaí fós';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Beidh gníomhartha modhnóireachta agus athruithe pobail le feiceáil anseo.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Gach úsáideoir';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Gach gníomh';

  @override
  String get guildSettingsAuditLogNoReason => 'Níor tugadh aon chúis.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Úsáideoir anaithnid';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Tharla rud éigin mícheart agus an loga gníomhaíochta á luchtú.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Ní féidir logaí gníomhaíochta a luchtú';

  @override
  String get guildSettingsAuditLogReason => 'Cúis';

  @override
  String get guildSettingsAuditLogSomeone => 'duine éigin';

  @override
  String get guildSettingsAuditLogSomething => 'rud éigin';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'eintiteas anaithnid';

  @override
  String get guildSettingsAuditLogNothing => 'rud ar bith';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Sprioc anaithnid';

  @override
  String get auditLogActionGuildUpdate => 'Pobal nuashonraithe';

  @override
  String get auditLogActionChannelCreate => 'Cainéal cruthaithe';

  @override
  String get auditLogActionChannelUpdate => 'Cainéal nuashonraithe';

  @override
  String get auditLogActionChannelDelete => 'Cainéal scriosta';

  @override
  String get auditLogActionChannelOverwriteCreate => 'Sárú cainéil curtha leis';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Sárú cainéil nuashonraithe';

  @override
  String get auditLogActionChannelOverwriteDelete => 'Sárú cainéil bainte';

  @override
  String get auditLogActionMemberKick => 'Ball caite amach';

  @override
  String get auditLogActionMemberPrune => 'Baill scuabtha';

  @override
  String get auditLogActionMemberBanAdd => 'Ball toirmiscthe';

  @override
  String get auditLogActionMemberBanRemove => 'Ball dí-toirmiscthe';

  @override
  String get auditLogActionMemberUpdate => 'Ball nuashonraithe';

  @override
  String get auditLogActionMemberRoleUpdate => 'Róil bhaill nuashonraithe';

  @override
  String get auditLogActionMemberMove => 'Ball bogtha';

  @override
  String get auditLogActionMemberDisconnect => 'Ball dícheangailte';

  @override
  String get auditLogActionBotAdd => 'Bot curtha leis';

  @override
  String get auditLogActionRoleCreate => 'Ról cruthaithe';

  @override
  String get auditLogActionRoleUpdate => 'Ról nuashonraithe';

  @override
  String get auditLogActionRoleDelete => 'Ról scriosta';

  @override
  String get auditLogActionInviteCreate => 'Cuireadh cruthaithe';

  @override
  String get auditLogActionInviteUpdate => 'Cuireadh nuashonraithe';

  @override
  String get auditLogActionInviteDelete => 'Cuireadh scriosta';

  @override
  String get auditLogActionWebhookCreate => 'Webhook cruthaithe';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook nuashonraithe';

  @override
  String get auditLogActionWebhookDelete => 'Webhook scriosta';

  @override
  String get auditLogActionEmojiCreate => 'Emoji cruthaithe';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji nuashonraithe';

  @override
  String get auditLogActionEmojiDelete => 'Emoji scriosta';

  @override
  String get auditLogActionStickerCreate => 'Greamán cruthaithe';

  @override
  String get auditLogActionStickerUpdate => 'Greamán nuashonraithe';

  @override
  String get auditLogActionStickerDelete => 'Greamán scriosta';

  @override
  String get auditLogActionMessageDelete => 'Teachtaireacht scriosta';

  @override
  String get auditLogActionMessageBulkDelete => 'Teachtaireachtaí scriosta';

  @override
  String get auditLogActionMessagePin => 'Teachtaireacht socraithe';

  @override
  String get auditLogActionMessageUnpin => 'Teachtaireacht díshocraithe';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor rinne socruithe an phobail a nuashonrú.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor chruthaigh an cainéal $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor rinne an cainéal $target a nuashonrú.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor scrios an cainéal $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor chuir ceadanna cainéil leis do $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor chuir ceadanna cainéil leis do $target sa chainéal $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor rinne ceadanna cainéil a nuashonrú do $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor rinne ceadanna cainéil a nuashonrú do $target sa chainéal $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor a díchuimhnigh $target cearta cainéil.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a díchuimhnigh $target cearta cainéil i $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor a chaith amach $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor a choisc $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor a scaoil $target ón gcoisc.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor a nuashonraigh $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor a nuashonraigh róil do $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor a ghlanadh baill éighníomhacha.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor a ghlanadh baill éighníomhacha ar feadh $days lá.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor a bhog $target chuig cainéal gutha eile.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a bhog $target chuig $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor a dhínasc $target ón nguth.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor a chuir an bot $target leis.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor a chruthaigh an ról $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor a nuashonraigh an ról $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor a scrios an ról $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor a chruthaigh an cuireadh $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a chruthaigh an cuireadh $target do $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor a nuashonraigh an cuireadh $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a nuashonraigh an cuireadh $target do $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor a scrios an cuireadh $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor a scrios an cuireadh $target do $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor a chruthaigh an webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor a nuashonraigh an webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor a scrios an webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor added the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor updated the emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor deleted the emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor added the sticker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor updated the sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor deleted the sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor deleted a message.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor deleted a message in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor deleted multiple messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor deleted $count messages.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor deleted multiple messages in $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor deleted $count messages in $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor pinned a message.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor pinned a message in $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor unpinned a message.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor unpinned a message in $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor performed an audit action on $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Updated $field from $oldValue to $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Set $field to $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Cleared $field (was $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Updated $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Renamed the community to $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Updated the community icon.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Renamed the channel to $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Cleared the topic.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Updated the topic to $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Enabled mature content.';

  @override
  String get auditLogChangeDisabledMatureContent => 'Disabled mature content.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Set nickname to $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Removed nickname $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Muted the member.';

  @override
  String get auditLogChangeUnmutedMember => 'Unmuted the member.';

  @override
  String get auditLogChangeDeafenedMember => 'Deafened the member.';

  @override
  String get auditLogChangeUndeafenedMember => 'Undeafened the member.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Added $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Removed $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Channel: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Message: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Invited by $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Deleted # messages.',
      one: 'Deleted # message.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Removed # members.',
      one: 'Removed # member.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'This invite never expires.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Grants temporary membership.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Grants permanent membership.';

  @override
  String get guildSettingsLoadMore => 'Load more';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Manage webhooks that post messages to channels.';

  @override
  String get guildSettingsWebhooksEmpty => 'No webhooks configured.';

  @override
  String get guildSettingsCopyUrl => 'Copy URL';

  @override
  String get guildSettingsCopiedUrl => 'URL copied to clipboard';

  @override
  String get guildSettingsDeleteWebhook => 'Delete webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Socraigh nasc cuireadh saincheaptha do do fhreastalaí.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Sábháil';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Úsáid';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count úsáidí';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Déan iarratas chun a bheith liostaithe i bhfionnachtain freastalaí.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Teastaíonn ar a laghad $count ball chun iarratas a dhéanamh.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Iarratas';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Stádas';

  @override
  String get guildSettingsDiscoveryCategory => 'Catagóir';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Cur síos';

  @override
  String get guildSettingsDiscoveryTags => 'Clibeanna';

  @override
  String get guildSettingsDiscoveryTagsHint => 'cluichí, ealaín, ceol';

  @override
  String get guildSettingsDiscoveryApply => 'Cuir Iarratas isteach';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Tarraing siar';

  @override
  String get guildSettingsMembersDescription =>
      'Cuardaigh agus bainistigh baill an fhreastalaí.';

  @override
  String get guildSettingsMembersSearchHint => 'Cuardaigh baill';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count baill';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Féach agus cealaigh naisc cuireadh gníomhacha.';

  @override
  String get guildSettingsInvitesEmpty => 'Níl cuireadh gníomhach ann.';

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
    return '$uses / $maxUses úsáidí';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Éagann $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Féach agus bainistigh úsáideoirí toirmiscthe.';

  @override
  String get guildSettingsBansSearchHint => 'Cuardaigh toirmisc';

  @override
  String get guildSettingsBansEmpty => 'Níl úsáideoir toirmiscthe ann.';

  @override
  String get guildSettingsBanPermanent => 'Toirmeasc buan';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Éagann $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Éagann';

  @override
  String get guildSettingsUnban => 'Dí-toirmisc';

  @override
  String get guildSettingsBansLoading => 'Ag luchtú úsáideoirí toirmiscthe';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Ní bhfuarthas aon toirmisc a mheaitseálann do chuardach.';

  @override
  String get guildSettingsBanDetailsTitle => 'Sonraí toirmisc';

  @override
  String get guildSettingsBanViewDetails => 'Féach sonraí';

  @override
  String get guildSettingsBannedOn => 'Toirmisceadh ar';

  @override
  String get guildSettingsBannedBy => 'Toirmisceadh ag';

  @override
  String get guildSettingsRevokeBanTitle => 'Cealaigh toirmeasc';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'An bhfuil tú cinnte gur mhaith leat an toirmeasc a chealú do $displayName? Beidh siad in ann filleadh ar an bpobal.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Cealaíodh toirmeasc do $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Níorbh fhéidir na toirmisc a luchtú. Bain triail eile as.';

  @override
  String get guildSettingsRevokeBanError =>
      'Níorbh fhéidir an toirmeasc a chealú. Bain triail eile as.';

  @override
  String get guildSettingsCommunitySettings => 'Socruithe Pobail';

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
      'Bainistigh próifíl, cainéil, agus socruithe réamhshocraithe do phobail.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Branding';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Nuashonraigh d\'íocón, d\'ainm, do bhratach, agus cúlra cuireadh';

  @override
  String get guildSettingsOverviewBannerUpload => 'Uaslódáil bratach';

  @override
  String get guildSettingsOverviewIdleTitle => 'Socruithe neamhghníomhacha';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Cumraigh cainéal AFK agus am teoranta';

  @override
  String get guildSettingsOverviewSystemTitle => 'Córas & fáilte';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Roghnaigh ceann scríbe do theachtaireachtaí córais agus fáilte';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Fógraí réamhshocraithe';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Tá pobail le breis agus 250 duine faoi cheangal leis an socrú \"luaitear amháin\". Coimeádtar do shocrú bunaidh agus cuirfear ar ais é má thiteann an pobal faoi bhun 250 ball.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Ardráiteacha';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Ceadaigh ainmneacha cainéal téacs solúbtha';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Folaigh coróin úinéir an phobail';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Meirgí scoite';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Taispeánann an meirgí ina rannán féin faoin gceannchlár pobail.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Uaslódáil deilbhín';

  @override
  String get guildSettingsOverviewRemoveImage => 'Bain';

  @override
  String get guildSettingsOverviewSplashTitle => 'Cúlra cuireadh';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Cúlra leabaithe comhrá';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Taispeántar i leabaithe cuireadh sa chomhrá.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Uaslódáil cúlra';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Gan meirgí pobail';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Gan cúlra cuireadh';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Réamhamharc';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Féach conas a bhreathnaíonn do chuireadh do chuairteoirí.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Ainmneacha cainéal téacs';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Coróin úinéir an phobail';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Cumraigh an bhfuil an deilbhín corónach le feiceáil in aice le húinéir an phobail';

  @override
  String get guildSettingsSplashCardAlignment => 'Ailínithe cárta';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Lár';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Clé';

  @override
  String get guildSettingsSplashAlignmentRight => 'Deas';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Ní bhaineann sé seo ach le scáileáin leathana.';

  @override
  String get permissionReadMessageHistory => 'Léigh stair teachtaireachtaí';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Athraigh cad is féidir le húsáideoirí gan \"$permission\" a fheiceáil';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Úsáid modúl tiomnaithe chun dáta tairsigh stair teachtaireachtaí a shocrú do bhaill nach bhfuil an cead $permission acu.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Oscail tairseach stair teachtaireachtaí';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Tairseach stair teachtaireachtaí';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Cumasaigh tairseach stair teachtaireachtaí';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Dáta tairsigh';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Is féidir le baill nach bhfuil Stair Teachtaireachtaí Léite acu teachtaireachtaí a cuireadh tar éis an dáta seo a fheiceáil.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Nuashonraíodh tairseach stair teachtaireachtaí';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Ceadaigh litreacha móra agus spásanna in ainmneacha cainéal téacs. Teorannaíonn as gach rud go litreacha beaga le hyphens agus underscores.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Folaíonn sé an deilbhín corónach in aice le húinéir an phobail ar fud gach dromchla.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Teastaíonn gné Pobail Deilbhíní Beoite le haghaidh deilbhíní beoite.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Teastaíonn gné Meirgí Beoite Pobail le haghaidh meirgí beoite.';

  @override
  String get guildSettingsAfkChannel => 'Cainéal AFK / díomhaoin';

  @override
  String get guildSettingsAfkChannelHint =>
      'Bog baill chuig an gcainéal seo nuair a bhíonn siad AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Gan cainéal AFK';

  @override
  String get guildSettingsAfkTimeout => 'Am múchta AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 nóiméad';

  @override
  String get guildSettingsAfkTimeout5Min => '5 nóiméad';

  @override
  String get guildSettingsAfkTimeout15Min => '15 nóiméad';

  @override
  String get guildSettingsAfkTimeout30Min => '30 nóiméad';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 uair an chloig';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds soicind';
  }

  @override
  String get guildSettingsSystemChannel => 'Cainéal cinn scríbe';

  @override
  String get guildSettingsSystemChannelHint =>
      'Beidh teachtaireachtaí fáilte agus córais le feiceáil anseo.';

  @override
  String get guildSettingsNoSystemChannel => 'Gan cainéal córais';

  @override
  String get guildSettingsHideJoinMessages =>
      'Folaigh teachtaireachtaí isteach';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Cuireann sé bac ar theachtaireachtaí isteach sa chainéal ceann scríbe.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Socruithe fógra réamhshocraithe';

  @override
  String get guildSettingsNotificationsAll => 'Gach teachtaireacht';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Fógraigh ar gach teachtaireacht';

  @override
  String get guildSettingsNotificationsMentions => 'Luaigh amháin';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Fógraigh ar luaigh amháin';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Uasmhéid 10MB. Íosmhéid: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Uasmhéid 10MB. Íosmhéid: 960×540px (16:9). Taispeántar i naisc cuireadh sa chomhrá.';

  @override
  String get guildSettingsModerationDescription =>
      'Cumraigh socruithe fíoraithe, scagadh ábhair, agus ábhar aibí.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Tá roghanna srianta maidir le smacht ar phobail atá liostaithe i Discovery.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Scagadh ábhair';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Scag teachtaireachtaí go huathoibríoch le haghaidh ábhar follasach i gcainéil nach bhfuil marcáilte le haghaidh ábhar aibí.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Tá sé de cheangal ar phobail atá liostaithe i Discovery gach ball a scanadh. Ní féidir an socrú seo a athrú fad is atá Discovery cumasaithe.';

  @override
  String get guildSettingsContentFilterOff => 'As';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Lig don phobal féin-rialáil';

  @override
  String get guildSettingsContentFilterNoRole => 'Scag baill gan róil';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Molta don chuid is mó de na pobail';

  @override
  String get guildSettingsContentFilterAll => 'Scag gach duine';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Uasmhéid cosanta do spásanna atá oiriúnach don teaghlach';

  @override
  String get guildSettingsModerationMatureOff => 'As';

  @override
  String get guildSettingsModerationMatureOn => 'Ar';

  @override
  String get guildSettingsContentWarningToggle => 'Taispeáin rabhadh ábhair';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Casann sé pras toilithe sula dtéann tú isteach in aon chainéal.';

  @override
  String get guildSettingsContentWarningText => 'Téacs rabhaidh saincheaptha';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Tá ábhar íogair anseo.';

  @override
  String get guildSettingsModeration2faTitle => 'Riachtanas 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Ceanglais dhá fhachtóir fíordheimhnithe do mhodhnóirí sula féidir leo teachtaireachtaí a thoirmeasc, a chiceáil, a chur ar fionraí, nó a bhaint.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Ceanglais 2FA d\'ghníomhartha modhnóireachta';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Ní féidir ach le húinéir an phobail an socrú seo a athrú';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Cumasaigh 2FA ar do chuntas chun an socrú seo a athrú';

  @override
  String get guildSettingsEmojiSearchHint => 'Aimsigh emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Uaslódáil Emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji neamhghníomhach ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji gníomhach ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Aimsigh greamáin';

  @override
  String get guildSettingsWebhooksInfo =>
      'Cruthaigh webhooks ó shocruithe cainéil. Cuir iad in eagar anseo.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Ní oibreoidh do vanity URL mura mbeidh ar a laghad cainéal amháin infheicthe do chách.';

  @override
  String get guildSettingsVanityUrlRemove => 'Bain';

  @override
  String get guildSettingsBannedUsersTitle => 'Úsáideoirí toirmiscthe';

  @override
  String get guildSettingsInvitesTableInviter => 'Tairgeoir';

  @override
  String get guildSettingsInvitesTableChannel => 'Cainéal';

  @override
  String get guildSettingsInvitesTableCode => 'Cód';

  @override
  String get guildSettingsInvitesTableUses => 'Úsáidí';

  @override
  String get guildSettingsInvitesTableCreated => 'Cruthaithe';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => 'An ceann is nuaí ar dtús';

  @override
  String get guildSettingsAuditLogFilterUser => 'Scagaigh de réir úsáideora';

  @override
  String get guildSettingsAuditLogFilterAction => 'Scagaigh de réir gnímh';

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
