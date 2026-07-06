// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class FluxerLocalizationsCy extends FluxerLocalizations {
  FluxerLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get reconnectingTitle => 'Fe wnaethon ni gamio!';

  @override
  String get reconnectingBody =>
      'Mae rhywbeth o\'i le gyda\'r palvel. \nDylai gael ei drwsio mewn eiliad!';

  @override
  String get gatewayReconnectingToast => 'Ail-gysylltu…';

  @override
  String get gatewayConnectedToast => 'Wedi\'i gysylltu';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Methu dechrau: $error';
  }

  @override
  String get retry => 'Ceisiwch eto';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Wedi colli cysylltiad';

  @override
  String get splashViewOnStatusPage => 'Gweld ar dudalen statws';

  @override
  String get splashConnectionIssuesPrompt => 'Problemau cysylltiad?';

  @override
  String get splashStatusPageLink => 'Tudalen statws';

  @override
  String get splashReadIncident => 'Darllenwch ddigwyddiad';

  @override
  String get splashIncidentHistory => 'Hanes digwyddiadau';

  @override
  String get welcomeBack => 'Croeso yn ôl';

  @override
  String get email => 'E-bost';

  @override
  String get emailInvalid => 'Rhowch gyfeiriad e-bost dilys.';

  @override
  String get password => 'Cyfrinair';

  @override
  String get forgotPassword => 'Wedi anghofio eich cyfrinair?';

  @override
  String get logIn => 'Mewngofnodi';

  @override
  String get logInWithPasskey => 'Mewngofnodi gyda allwedd pas';

  @override
  String continueWithSso(String provider) {
    return 'Parhau gyda $provider';
  }

  @override
  String get ssoRequired => 'Mae angen SSO i gyrchu\'r ddaran hon.';

  @override
  String get organizationSsoProvider =>
      'Mewngofnodwch gyda darparwr un-signio eich sefydliad.';

  @override
  String get failedToStartSso => 'Methu dechrau SSO';

  @override
  String get ssoCancelled => 'Gohirwyd mewngofnodi SSO';

  @override
  String preferSso(String provider) {
    return 'Yn well gennych ddefnyddio SSO? Parhau gyda $provider.';
  }

  @override
  String get logInViaBrowser => 'Mewngofnodi trwy borwr';

  @override
  String get needAccountPrompt => 'Angen cyfrif? ';

  @override
  String get register => 'Cofrestru';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Gwirio eich bod yn ddynol';

  @override
  String get captchaDescription =>
      'Mae angen i ni sicrhau nad ydych chi\'n fot. Cwblhewch y dilysiad isod.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Gyrrwch broblemau? Rhowch gynnig ar hCaptcha yn lle hynny';

  @override
  String get captchaSwitchToTurnstile =>
      'Rhowch gynnig ar Turnstile yn lle hynny';

  @override
  String get cancel => 'Canslo';

  @override
  String get ipAuthCheckEmail => 'Gwirio eich e-bost';

  @override
  String ipAuthDescription(String email) {
    return 'Anfonwyd e-bost gyda dolen i awdurdodi\'r mewngofnodi hwn. Agorwch eich blwch derbynnydd ar gyfer $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Cysylltiad ar goll';

  @override
  String get ipAuthConnectionLostDescription =>
      'Gollwyd y cysylltiad wrth aros am awdurdodiad. Rhowch gynnig arall arni.';

  @override
  String get ipAuthLinkExpired => 'Dolen mewngofnodi wedi dod i ben';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Mae\'r ddolen awdurdodi hon wedi dod i ben. Mewngofnodwch eto.';

  @override
  String get ipAuthResendEmail => 'Ail-anfon e-bost';

  @override
  String get ipAuthResent => 'Ail-anfonwyd';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Yn ôl';

  @override
  String get mfaTitle => 'Awdurdodi dau ffactor';

  @override
  String get mfaChooseMethod => 'Dewiswch ddull dilysu';

  @override
  String get mfaMethodTotp => 'Ap dilysu';

  @override
  String get mfaMethodWebauthn => 'Allwedd Diogelwch / Passkey';

  @override
  String get mfaTotpDescription =>
      'Rhowch y cod 6 digid o\'ch ap dilysu neu un o\'ch codau wrth gefn.';

  @override
  String get mfaCodeLabel => 'Cod';

  @override
  String get mfaTryAnotherMethod => 'Rhowch gynnig ar ddull arall';

  @override
  String get mfaUseSecurityKey =>
      'Rhowch gynnig ar allwedd diogelwch / passkey yn lle hynny';

  @override
  String get accountSelectorTitle => 'Dewiswch gyfrif';

  @override
  String get accountSelectorDescription =>
      'Dewiswch gyfrif i barhau, neu ychwanegwch un arall.';

  @override
  String get accountAdd => 'Ychwanegu cyfrif';

  @override
  String get accountRemove => 'Dileáu';

  @override
  String accountRemoveTitle(String username) {
    return 'Dileáu $username';
  }

  @override
  String get accountRemoveDescription =>
      'Bydd hyn yn dileáu\'r sesiwn a arbedwyd ar gyfer y cyfrif hwn.';

  @override
  String get accountRemoveOnlyDescription =>
      'Bydd hyn yn dileáu\'r unig gyfrif a arbedwyd ar y ddyfais hon.';

  @override
  String get accountExpired => 'Drosodd';

  @override
  String accountSessionExpired(String identifier) {
    return 'Drosodd y sesiwn ar gyfer $identifier. Mewngofnodwch eto.';
  }

  @override
  String get accountManageTitle => 'Rheoli cyfrifon';

  @override
  String get accountSwitchFailed =>
      'Methodd newid cyfrifon. Rhowch gynnig arall arni.';

  @override
  String get profileTabMenuSwitchAccounts => 'Newid cyfrifon';

  @override
  String get statusChangeSheetTitle => 'Gosod statws';

  @override
  String get statusOnlineStatusSection => 'Statws ar-lein';

  @override
  String get statusOnline => 'Ar-lein';

  @override
  String get statusIdle => 'Anweithgar';

  @override
  String get statusDnd => 'Peidiwch ag aflonyddu';

  @override
  String get statusInvisible => 'Anweledig';

  @override
  String get statusOffline => 'Dall-lein';

  @override
  String get statusUntilIChangeIt => 'Nes i mi ei newid';

  @override
  String get statusDontClear => 'Peidiwch â dileu';

  @override
  String get statusFor10Seconds => 'Am 10 eiliad';

  @override
  String get statusClearAfter10Seconds => '10 eiliad';

  @override
  String get statusClearAfter15Minutes => '15 munud';

  @override
  String get statusClearAfter30Minutes => '30 munud';

  @override
  String get statusClearAfter1Hour => '1 awr';

  @override
  String get statusClearAfter3Hours => '3 awr';

  @override
  String get statusClearAfter4Hours => '4 awr';

  @override
  String get statusClearAfter8Hours => '8 awr';

  @override
  String get statusClearAfter24Hours => '24 awr';

  @override
  String get statusClearAfter3Days => '3 diwrnod';

  @override
  String get statusDndDescription => 'Ni chewch hysbysiadau ar gyfrifiadur';

  @override
  String get statusInvisibleDescription => 'Byddwch yn ymddangos yn all-lein';

  @override
  String get customStatusSetTitle => 'Gosod statws personol';

  @override
  String get customStatusCurrentHint => 'Statws personol';

  @override
  String get customStatusClear => 'Dileáu statws personol';

  @override
  String get customStatusPlaceholder => 'Beth sy\'n digwydd?';

  @override
  String get customStatusChooseEmoji => 'Dewiswch emoji';

  @override
  String get customStatusClearAfter => 'Dileáu ar ôl';

  @override
  String get customStatusSave => 'Cadw';

  @override
  String get accountActive => 'Cyfrif gweithredol';

  @override
  String get signOut => 'Allgofnodi';

  @override
  String get suspendedPermanentTitle => 'Cyfrif wedi\'i Atal yn Barhaol';

  @override
  String get suspendedTemporaryTitle => 'Cyfrif wedi\'i Atal';

  @override
  String get suspendedPermanentDescription =>
      'Mae eich cyfrif wedi\'i atal yn barhaol am dorri ein Telerau Gwasanaeth.';

  @override
  String get suspendedTemporaryDescription =>
      'Mae eich cyfrif wedi\'i atal dros dro. Byddwch yn gallu cyrchu eich cyfrif ar ôl i\'r cyfnod atal ddod i ben.';

  @override
  String get suspendedIssuedAt => 'Dyddiedig';

  @override
  String get suspendedEndsAt => 'Yn dod i ben';

  @override
  String get suspendedDuration => 'Hyd';

  @override
  String get suspendedPermanent => 'Parhaol';

  @override
  String get suspendedReason => 'Rheswm';

  @override
  String get suspendedAppealDeadline => 'Dyddiad Apêl';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Mae eich cyfrif wedi\'i drefnu i gael ei ddileu ar $date.';
  }

  @override
  String get suspendedRecheck => 'Gwirio am Ddiweddariadau';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Gwirio eto mewn ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Yn ôl i Mewngofnodi';

  @override
  String get suspendedAppealTitle => 'Apêl';

  @override
  String get suspendedAppealHint =>
      'Eglurwch pam y dylid ailystyried eich ataliad (o leiaf 50 nod)...';

  @override
  String get suspendedAppealSubmit => 'Cyflwyno Apêl';

  @override
  String get suspendedAppealPending => 'Ar Eich Aros i\'w Adolygu';

  @override
  String get suspendedAppealAccepted => 'Apêl Wedi\'i Dderbyn';

  @override
  String get suspendedAppealRejected => 'Apêl Wedi\'i Gwrthod';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Mae eich apêl wedi\'i derbyn ac mae eich cyfrif wedi\'i adfer.';

  @override
  String get suspendedSignIn => 'Mewngofnodi i\'ch Cyfrif';

  @override
  String get forgotPasswordTitle => 'Wedi anghofio\'ch cyfrinair?';

  @override
  String get forgotPasswordDescription =>
      'Teipiwch eich cyfeiriad e-bost a byddwn yn anfon dolen atoch i ailosod eich cyfrinair.';

  @override
  String get forgotPasswordSubmit => 'Anfon dolen ailosod';

  @override
  String get forgotPasswordSentTitle => 'Gwirioch eich e-bost';

  @override
  String get forgotPasswordSentDescription =>
      'Rydym wedi anfon cyfarwyddiadau i ailosod eich cyfrinair i\'ch cyfeiriad e-bost. Gwiriwch eich blwch derbyn a dilynwch y ddolen i ailosod eich cyfrinair.';

  @override
  String get forgotPasswordBackToLogin => 'Dychwelyd i fewngofnodi';

  @override
  String get resetPasswordTitle => 'Gosod cyfrinair newydd';

  @override
  String get resetPasswordDescription =>
      'Teipiwch eich cyfrinair newydd isod i gwblhau\'r broses ailosod.';

  @override
  String get resetPasswordNewPassword => 'Cyfrinair newydd';

  @override
  String get resetPasswordConfirm => 'Cadarnhau cyfrinair newydd';

  @override
  String get resetPasswordSubmit => 'Ailosod cyfrinair';

  @override
  String get resetPasswordMismatch => 'Mae cyfrineiriau yn anghydweddu.';

  @override
  String get registerTitle => 'Creu cyfrif';

  @override
  String get registerDisplayName => 'Enw Dangos (Dewisol)';

  @override
  String get registerDisplayNameHint => 'Beth ddylai pobl eich galw chi?';

  @override
  String get registerUsername => 'Defnyddiwr (Dewisol)';

  @override
  String get registerUsernameHint => 'Gadewch yn wag am enw defnyddiwr ar hap';

  @override
  String get registerUsernameTagHint =>
      'Ychwanegir tag 4 digid yn awtomatig i sicrhau unigrywiaeth';

  @override
  String get registerDateOfBirth => 'Dyddiad geni';

  @override
  String get registerMonth => 'Mis';

  @override
  String get registerDay => 'Dydd';

  @override
  String get registerYear => 'Blwyddyn';

  @override
  String get registerConsent =>
      'Rwy\'n cytuno i\'r Telerau Gwasanaeth a\'r Polisi Preifatrwydd';

  @override
  String get registerConsentPrefix => 'Rwy\'n cytuno i\'r ';

  @override
  String get registerConsentTerms => 'Telerau Gwasanaeth';

  @override
  String get registerConsentAnd => ' a ';

  @override
  String get registerConsentPrivacy => 'Polisi Preifatrwydd';

  @override
  String get registerConfirmPassword => 'Cadarnhau Cyfrinair';

  @override
  String get registerSubmit => 'Creu cyfrif';

  @override
  String get registerHaveAccount => 'Eisoes wedi\'ch cofrestru? ';

  @override
  String get passkeyNoCredentials =>
      'Ni chafwyd hyd i allweddau pas i\'r app hwn. Mewngofnodwch gyda\'r cyfeiriad e-bost a chyfrinair yn lle hynny.';

  @override
  String get passkeyDeviceNotSupported =>
      'Nid yw allweddau pas yn cael eu cefnogi ar y ddyfais hon.';

  @override
  String get passkeyDomainNotAssociated =>
      'Nid yw allweddau pas wedi\'u ffurfweddu ar gyfer yr app hwn. Mewngofnodwch gyda\'r cyfeiriad e-bost a chyfrinair yn lle hynny.';

  @override
  String get passkeyTimeout =>
      'Aeth dilysu allwedd pas yn rhy bell. Rhowch gynnig arall arni.';

  @override
  String get passkeyNotAvailable =>
      'Nid yw allweddau pas ar gael ar gyfer yr app hwn. Mewngofnodwch gyda\'r cyfeiriad e-bost a chyfrinair yn lle hynny.';

  @override
  String get passkeyFailed =>
      'Method pasys yn methu. Rhowch gynnig arall arni.';

  @override
  String get errorUnableToCreateAccount =>
      'Methu creu cyfrif. Rhowch gynnig arall arni.';

  @override
  String get errorUnableToSignIn =>
      'Methu mewngofnodi ar hyn o bryd. Rhowch gynnig arall arni.';

  @override
  String get errorInvalidEmailOrPassword => 'E-bost neu gyfrinair annilys.';

  @override
  String get errorUnableToSendResetLink =>
      'Methu anfon dolen ailosod. Rhowch gynnig arall arni.';

  @override
  String get errorUnableToResetPassword =>
      'Methu ailosod cyfrinair. Rhowch gynnig arall arni.';

  @override
  String get embedInviteJoin => 'Ymunwch â\'r Gymuned';

  @override
  String get embedInviteGoTo => 'Ewch i\'r Gymuned';

  @override
  String embedInviteOnline(String count) {
    return '$count Ar-lein';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Aelod';
  }

  @override
  String get embedInviteUnknownTitle => 'Gwahoddiad Anhysbys';

  @override
  String get embedInviteUnknownSubtitle =>
      'Rhowch gynnig ar ofyn am wahoddiad newydd.';

  @override
  String get embedInviteUnavailable => 'Gwahoddiad Ddim ar Gael';

  @override
  String get inviteAcceptTitle => 'Mae croeso i chi ymuno';

  @override
  String get inviteAcceptJoinButton => 'Ymunwch â\'r Gymuned';

  @override
  String get inviteAcceptGoToButton => 'Ewch i\'r Gymuned';

  @override
  String get inviteAcceptInvitesPaused => 'Gwahoddiadau Wedi\'u Oedi';

  @override
  String get inviteAcceptNotFoundTitle => 'Gwahoddiad Annilys';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Gall y gwahoddiad hwn fod wedi dod i ben neu fod yn annilys.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Ymunwch â\'r grŵp';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Mae croeso i chi ymuno â grŵp DM gan $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'rhywun';

  @override
  String get inviteAcceptEmojiPack => 'Pecyn emoji';

  @override
  String get inviteAcceptStickerPack => 'Pecyn sticeri';

  @override
  String get inviteAcceptInstallEmojiPack => 'Gosodwch y pecyn emoji';

  @override
  String get inviteAcceptInstallStickerPack => 'Gosodwch y pecyn sticeri';

  @override
  String get inviteAcceptPackInstallNote =>
      'Bydd derbyn y gwahoddiad hwn yn gosod y pecyn yn awtomatig.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Gwrthodwyd Mynediad i\'r Sianel';

  @override
  String get channelAccessDeniedDescription =>
      'Nid oes gennych fynediad i\'r sianel lle anfonwyd y neges hon.';

  @override
  String get messageJumpLinkNoAccess => 'Dim mynediad';

  @override
  String get okay => 'Iawn';

  @override
  String get embedThemeTitle => 'Them Dros Dro';

  @override
  String get embedThemeSubtitle =>
      'Nid yw\'r cleient hwn yn cefnogi themâu personol.';

  @override
  String get embedThemeUnavailableButton => 'Themâu ddim ar gael';

  @override
  String get privacySettings => 'Gosodiadau Preifatrwydd';

  @override
  String get privacyDirectMessages => 'Negeseuon Uniongyrchol';

  @override
  String get privacyDirectMessagesDescription =>
      'Caniatáu negeseuon uniongyrchol gan aelodau eraill yn y gymuned hon';

  @override
  String get privacyBotDirectMessages => 'Negeseuon Uniongyrchol Bot';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Caniatáu i botiau o\'r gymuned hon anfon negeseuon uniongyrchol atoch';

  @override
  String get privacyMutualDmsDisabled =>
      'Mae gweinyddwyr y gymuned wedi analluogi derbyn negeseuon uniongyrchol gan aelodau cyffredin yn unig yn y gymuned hon.';

  @override
  String get communityDebug => 'Debug Cymuned';

  @override
  String get copiedToClipboard => 'Wedi\'i gopïo i\'r clipfwrdd';

  @override
  String get notificationSettings => 'Gosodiadau Hysbysiadau';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Mudwch $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Mae mud an gymuned yn atal dangosyddion heb eu darllen a hysbysiadau rhag ymddangos oni bai eich bod yn cael eich crybwyll';

  @override
  String get notificationCommunitySettings => 'Gosodiadau Hysbysiadau Cymuned';

  @override
  String get notificationAllMessages => 'Pawb o\'r Negeseuon';

  @override
  String get notificationOnlyMentions => 'Crybwyllion yn Unig';

  @override
  String get notificationNothing => 'Dim';

  @override
  String get notificationSuppressEveryone => 'Atal @bawb a @yma';

  @override
  String get notificationSuppressRoles => 'Atal Gwahoddiadau Roliau i gyd';

  @override
  String get notificationMobilePush => 'Hysbysiadau Gwthio Symudol';

  @override
  String get notificationOverrides => 'Gwrthrediadau Hysbysiadau';

  @override
  String get notificationSelectChannel => 'Dewiswch sianel neu gategori';

  @override
  String get notificationOnlyAtMentions => 'Dim ond @ennillion';

  @override
  String get notificationMuteChannel => 'Mudwch Sianel';

  @override
  String get notificationUnmuteChannel => 'Dad-fwydwch Sianel';

  @override
  String get notificationNoCategory => 'Dim Categori';

  @override
  String get dmMarkAsRead => 'Marcio fel Wedi\'i Ddarllen';

  @override
  String get dmMuteConversation => 'Mudwch DM';

  @override
  String get dmUnmuteConversation => 'Dad-fwydwch DM';

  @override
  String get dmPinDm => 'Pinio DM';

  @override
  String get dmUnpinDm => 'Tynnu Pin DM';

  @override
  String get dmAlwaysShowInSidebar => 'Dangos Bob Amser yn y Bar Ochr';

  @override
  String get dmRemoveFromAlwaysShown => 'Tynnu o Bob Amser yn Dangos';

  @override
  String get dmCloseDm => 'Cau DM';

  @override
  String get dmCloseDmConfirmTitle => 'Cau DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Ydych chi\'n siŵr eich bod chi eisiau cau eich DM gyda $username? Gallwch ei ailagor bob amser yn ddiweddarach.';
  }

  @override
  String get dmCopyChannelId => 'Copïo ID Sianel';

  @override
  String get dmChannelIdCopied => 'ID Sianel wedi\'i gopïo';

  @override
  String get dmCopyUserId => 'Copïo ID Defnyddiwr';

  @override
  String get dmUserIdCopied => 'ID defnyddiwr wedi\'i gopïo';

  @override
  String get dmViewProfile => 'Gweld Proffil';

  @override
  String get dmVoiceCall => 'Dechrau Galwad Llais';

  @override
  String get incomingVoiceCallTitle => 'Galwad llais yn dod i mewn';

  @override
  String get incomingVoiceCallAccept => 'Derbyn';

  @override
  String get incomingVoiceCallDecline => 'Gwrthod';

  @override
  String get incomingVoiceCallLabel => 'Galwad yn dod i mewn';

  @override
  String get incomingVoiceCallIgnore => 'Anwybyddu';

  @override
  String get directVoiceCallNotEligible =>
      'Ni ellir cychwyn yr alwad hon ar hyn o bryd. Rhowch gynnig arall arni mewn eiliad.';

  @override
  String get voiceJoinCallFailed =>
      'Methodd cysylltu â\'r alwad hon. Gwiriwch eich cysylltiad a rhowch gynnig arall arni.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Methodd ymuno â\'r alwad hon. Gwiriwch eich cysylltiad a rhowch gynnig arall arni.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Methodd diweddaru\'r alwad hon ar y gweinydd. Gwiriwch eich cysylltiad a rhowch gynnig arall arni.';

  @override
  String get dmAddNote => 'Ychwanegu Nôd';

  @override
  String get dmEditGroup => 'Golygu Grŵp';

  @override
  String get dmInviteToCommunity => 'Gwahodd i Gymuned';

  @override
  String get dmBlock => 'Blocio';

  @override
  String get dmLeaveGroup => 'Gadael Grŵp';

  @override
  String get dmNoCommunitiesAvailable => 'Dim cymunedau ar gael';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Aelod';
  }

  @override
  String get dmMuteFor15Min => 'Am 15 munud';

  @override
  String get dmMuteFor30Min => 'Am 30 munud';

  @override
  String get dmMuteFor1Hour => 'Am 1 awr';

  @override
  String get dmMuteFor3Hours => 'Am 3 awr';

  @override
  String get dmMuteFor4Hours => 'Am 4 awr';

  @override
  String get dmMuteFor8Hours => 'Am 8 awr';

  @override
  String get dmMuteFor24Hours => 'Am 24 awr';

  @override
  String get dmMuteFor3Days => 'Am 3 diwrnod';

  @override
  String get dmMuteForever => 'Nes i mi ei droi yn ôl ymlaen';

  @override
  String get dmPinGroupDm => 'Pinio Grŵp DM';

  @override
  String get dmUnpinGroupDm => 'Dirymchwelyd DM Grŵp';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Hoffi DM';

  @override
  String get dmUnfavoriteDm => 'Diddymhoffi DM';

  @override
  String get dmFavoriteGroupDm => 'Hoffi DM Grŵp';

  @override
  String get dmUnfavoriteGroupDm => 'Diddymhoffi DM Grŵp';

  @override
  String get dmChangeFriendNickname => 'Newid Llysenw Ffrind';

  @override
  String get dmRemoveFriend => 'Dileu Ffrind';

  @override
  String get dmAddFriend => 'Ychwanegu Ffrind';

  @override
  String get dmAcceptFriendRequest => 'Derbyn Cais Ffrind';

  @override
  String get dmIgnoreFriendRequest => 'Anwybyddu Cais Ffrind';

  @override
  String get dmFriendRequestSent => 'Anfonwyd Cais Ffrind';

  @override
  String get dmUnblock => 'Datgloi';

  @override
  String get dmDebugUser => 'Defnyddiwr Debug';

  @override
  String get dmDebugChannel => 'Sianel Debug';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'DM Wedi\'i Binio';

  @override
  String get dmUnpinned => 'DM Heb ei Binio';

  @override
  String get dmMuted => 'DM Mud';

  @override
  String get dmUnmuted => 'DM Heb ei Fudo';

  @override
  String get dmRemoveFriendConfirmTitle => 'Dileu Ffrind';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Ydych chi\'n siŵr eich bod am ddileu $username fel ffrind?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blocio Defnyddiwr';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Ydych chi\'n siŵr eich bod am floccio $username? Ni allan nhw\'ch negesu chi nac anfon ceisiadau ffrind atoch.';
  }

  @override
  String get dmFriendRequestSentToast => 'Anfonwyd y cais ffrind';

  @override
  String get dmFriendRequestFailed => 'Methodd anfon y cais ffrind';

  @override
  String get dmAcceptFriendRequestFailed => 'Methodd derbyn y cais ffrind';

  @override
  String get dmRemoveFriendFailed => 'Methodd dileu\'r ffrind';

  @override
  String get dmBlockFailed => 'Methodd blocio\'r defnyddiwr';

  @override
  String get dmUnblockFailed => 'Methodd datgloi\'r defnyddiwr';

  @override
  String get dmIgnoreFriendRequestFailed => 'Methodd anwybyddu\'r cais ffrind';

  @override
  String get dmAddFriends => 'Ychwanegu ffrindiau';

  @override
  String get addFriendSheetTitle => 'Ychwanegu ffrind';

  @override
  String get addFriendUsernameHint => 'Defnyddiwr#0000';

  @override
  String get addFriendUsernameLabel => 'Defnyddiwr ffrind';

  @override
  String get addFriendSendRequest => 'Anfon cais';

  @override
  String get addFriendNoUserFound =>
      'Ni chafwyd defnyddiwr gyda\'r enw defnyddiwr hwnnw.';

  @override
  String get addFriendInvalidUsername =>
      'Rhowch enw defnyddiwr dilys (Defnyddiwr#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Anfonwyd y cais ffrind';

  @override
  String get addFriendClaimTitle => 'Hawlio\'ch cyfrif';

  @override
  String get addFriendClaimDescription =>
      'Hawliwch eich cyfrif i anfon ceisiadau ffrind.';

  @override
  String get addFriendVerifyTitle => 'Gwirio\'ch e-bost';

  @override
  String get addFriendVerifyDescription =>
      'Mae angen i chi wirio\'ch cyfeiriad e-bost cyn y gallwch anfon ceisiadau ffrind.';

  @override
  String get addFriendVerifyEmail => 'Gwirio e-bost';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Ceisiadau ffrind sy\'n dod i mewn ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Ceisiadau ffrind sy\'n mynd allan ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Cais ffrind sy\'n dod i mewn';

  @override
  String get addFriendOutgoingStatus => 'Anfonwyd y cais ffrind';

  @override
  String get addFriendViewProfile => 'Gweld proffil';

  @override
  String get addFriendAccept => 'Derbyn';

  @override
  String get addFriendIgnore => 'Anwybyddu';

  @override
  String get addFriendAcceptTitle => 'Derbyn y cais ffrind';

  @override
  String get addFriendIgnoreTitle => 'Anwybyddwch gais ffrind';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Derbyn y cais ffrind gan $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Anwybyddwch y cais ffrind gan $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Canslo cais';

  @override
  String get addFriendCancelRequestFailed =>
      'Methodd â chanslo\'r cais ffrind. Rhowch gynnig arall arni.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Nid ydynt yn derbyn ceisiadau ffrindiau ar hyn o bryd.';

  @override
  String get addFriendUnblockFirst =>
      'Datflociwch nhw yn gyntaf i anfon cais ffrind.';

  @override
  String get addFriendCannotSendToSelf =>
      'Ni allwch anfon cais ffrind i chi\'ch hun.';

  @override
  String get addFriendAlreadyFriends =>
      'Rydych chi eisoes yn ffrindiau gyda\'r defnyddiwr hwn.';

  @override
  String get addFriendClaimToSend =>
      'Gorffennwch gofrestru i anfon ceisiadau ffrindiau.';

  @override
  String get addFriendSendFailedGeneric =>
      'Methodd â hanfon y cais ffrind. Rhowch gynnig arall arni.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'System';

  @override
  String get emojiSearchPlaceholder =>
      'Dewch o hyd i\'r emoji o\'ch breuddwydion';

  @override
  String get emojiSearchEmpty => 'Dim emojis yn cyfateb i\'ch chwiliad';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji rhagosodedig';

  @override
  String get emojiFrequentlyUsed => 'Eitemau a ddefnyddir yn aml';

  @override
  String get emojiTabGifs => 'GIFs';

  @override
  String get emojiTabMedia => 'Cyfryngau';

  @override
  String get emojiTabStickers => 'Sticeri';

  @override
  String get emojiTabEmojis => 'Emjis';

  @override
  String get gifPickerSearch => 'Chwilio am GIFs';

  @override
  String get gifPickerSearchKlipy => 'Chwilio am KLIPY';

  @override
  String get gifPickerSearchTenor => 'Chwilio am Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Hoff';

  @override
  String get gifPickerTrending => 'GIFs sy\'n treio';

  @override
  String get gifPickerNoResultsTitle => 'Dim Canlyniadau Chwilio';

  @override
  String get gifPickerNoResultsDescription => 'Ceisiwch derm chwilio arall';

  @override
  String get gifPickerLoadFailedTitle => 'Methu llwytho GIFs';

  @override
  String get gifPickerLoadFailedBody =>
      'Gwiriwch eich cysylltiad a rhowch gynnig arall arni.';

  @override
  String get emojiCategoryPeople => 'Pobl';

  @override
  String get emojiCategoryNature => 'Natur';

  @override
  String get emojiCategoryFood => 'Bwyd a Diod';

  @override
  String get emojiCategoryActivity => 'Gweithgareddau';

  @override
  String get emojiCategoryTravel => 'Teithio a Mannau';

  @override
  String get emojiCategoryObjects => 'Gwrthrychau';

  @override
  String get emojiCategorySymbols => 'Symbolau';

  @override
  String get emojiCategoryFlags => 'Baneri';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Datgloi $emojiCount o $communityCount gyda Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Sicrhewch Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Peidiwch â dangos hyn eto';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emojïau personoliad',
      one: '1 emoji personoliad',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cymunedau',
      one: '1 cymuned',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Rhybudd Dolenni Allanol';

  @override
  String get externalLinkWarningLeaving => 'Rydych chi ar fin gadael Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Gall dolenni allanol fod yn beryglus. Byddwch yn ofalus.';

  @override
  String get externalLinkWarningDestinationUrl => 'Cyfeiriad y cyrchfan:';

  @override
  String get externalLinksSectionTitle => 'Dolenni Allanol';

  @override
  String get externalLinksSectionDescription =>
      'Gosodwch sut y caiff rhybyddion dolenni allanol eu trin.';

  @override
  String get externalLinkWarningTrustPrefix => 'Ymddiried bob amser yn ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — hepgorwch y rhybudd hwn y tro nesaf';

  @override
  String get externalLinkVisitSite => 'Ewch i\'r Safle';

  @override
  String get externalLinkTrustAllLabel => 'Ymddiried pob dolen allanol';

  @override
  String get externalLinkStripTrackingLabel =>
      'Dileu paramedrau olrhain o URLs';

  @override
  String get externalLinkStripTrackingDescription =>
      'Dileuwch baramedrau olrhain (fel utm_source, fbclid, gclid) yn awtomatig o URLs mewn negeseuon rydych chi\'n eu hanfon. Glanhau\'r ddolen cyn iddi gyrraedd neb arall.';

  @override
  String get externalLinkTrustAllConfirmTitle => 'Ymddiried pob dolen allanol?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Bydd hyn yn ymddiried pob dolen allanol ac yn neidio\'r rhybudd ar gyfer pob parth. Bydd eich parthau dibynadwy presennol yn cael eu disodli. Mae hyn yn llai diogel.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Ymddiried Pob Un';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Peidio ag ymddiried pob dolen?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Bydd rhybuddion dolen allanol yn cael eu harddangos eto. Bydd angen i chi ychwanegu parthau dibynadwy yn unigol.';

  @override
  String get externalLinkStopTrustingAllAction => 'Analluogi Ymddiried Pob Un';

  @override
  String get externalLinkTrustedAllDescription =>
      'Mae pob dolen allanol yn cael eu hymddiried. Ni fydd rhybuddion yn cael eu harddangos.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Mae gennych $count parth dibynadwy. Ychwanegwch fwy trwy wirio\'r blwch pan fyddwch yn ymweld â dolen allanol.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Pan fydd wedi\'i alluogi, ni fydd unrhyw rybuddion dolen allanol yn cael eu harddangos. Mae hyn yn llai diogel.';

  @override
  String get imageFileTooLarge =>
      'Mae\'r ffeil ddelwedd yn rhy fawr. Dewiswch ffeil sy\'n llai na 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Mae angen Plutonium ar gyfer avatars animeiddiedig';

  @override
  String get animatedBannersRequirePlutonium =>
      'Mae angen Plutonium ar gyfer baneri animeiddiedig';

  @override
  String get animatedAvifNotSupported =>
      'Nid yw AVIF animeiddiedig yn cael ei gefnogi';

  @override
  String get animatedAvifNotSupportedBody =>
      'Nid yw torri a chylchdroi ffeiliau AVIF animeiddiedig yn cael ei gefnogi eto. Os byddwch yn parhau, fe\'i huploadir yn ei ffurf wreiddiol.';

  @override
  String get uploadAsIs => 'Uplod fel y mae';

  @override
  String get croppingAnimatedNotSupported =>
      'Nid yw torri delweddau animeiddiedig yn cael ei gefnogi eto. Defnyddir yr uwchlwythiad gwreiddiol.';

  @override
  String get cropAvatar => 'Torri Avatar';

  @override
  String get cropBanner => 'Torri Baner';

  @override
  String get skip => 'Neidio';

  @override
  String get crop => 'Torri';

  @override
  String get changeYourFluxerTag => 'Newid eich FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Dim ond llythrennau (a-z, A-Z), rhifau (0-9), ac islinellau y gellir eu defnyddio mewn enwau defnyddiwr. Nid yw enwau defnyddiwr yn wahanol i feintiau llythrennau.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Dim ond llythrennau (a-z, A-Z), rhifau (0-9), ac islinellau y gellir eu defnyddio mewn enwau defnyddiwr. Nid yw enwau defnyddiwr yn wahanol i feintiau llythrennau. Gallwch ddewis unrhyw dag 4 digid ar gael o #0000 i #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Dim ond llythrennau (a-z, A-Z), rhifau (0-9), ac islinellau y gellir eu defnyddio mewn enwau defnyddiwr. Nid yw enwau defnyddiwr yn wahanol i feintiau llythrennau. Gallwch ddewis unrhyw dag 4 digid ar gael o #0001 i #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Rhwng $min a $max nod';
  }

  @override
  String get validationAllowedChars =>
      'Dim ond llythrennau (a-z, A-Z), rhifau (0-9), ac islinellau (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Sicrhewch blwtonium i addasu eich tag neu ei gadw wrth newid eich enw defnyddiwr';

  @override
  String get fluxerTagAlreadyTaken => 'Mae\'r FluxerTag eisoes wedi\'i gymryd';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Mae\'r FluxerTag $username#$discriminator eisoes wedi\'i gymryd. Bydd parhau yn ail-gylchu eich gwahaniaeth yn awtomatig.';
  }

  @override
  String get customTagIsTemporary => 'Mae Tag Personol yn Dros Dro';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Dim ond tra bod eich tanysgrifiad Plutonium yn weithredol y mae eich tag 4 digid personol ar gael. Pan ddaw eich tanysgrifiad i ben ar $date, bydd eich tag yn dychwelyd i rif a neilltuwyd ar hap ar ôl cyfnod gras o 3 diwrnod.';
  }

  @override
  String get customTagTemporaryBody =>
      'Dim ond tra bod eich tanysgrifiad Plutonium yn weithredol y mae eich tag 4 digid personol ar gael. Pan ddaw eich tanysgrifiad i ben, bydd eich tag yn dychwelyd i rif a neilltuwyd ar hap ar ôl cyfnod gras o 3 diwrnod.';

  @override
  String get iUnderstandContinue => 'Rwy\'n Deall, Parhau';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Os byddwch yn cadw\'r FluxerTag hwn, bydd eich tag 4 digid personol yn dychwelyd i rif ar hap pan ddaw eich tanysgrifiad Plutonium i ben. Os bydd eich tanysgrifiad yn methu ag adnewyddu, bydd gennych gyfnod gras o 3 diwrnod cyn i\'r tag newid.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Mae eich tag 4 digid personol (#$discriminator) yn weithredol tra bod eich tanysgrifiad Plutonium yn weithredol. Os daw eich tanysgrifiad i ben neu os bydd yn methu ag adnewyddu ar ôl cyfnod gras o 3 diwrnod, bydd eich tag yn dychwelyd i rif a neilltuwyd ar hap.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Addaswch eich tag 4 digid neu cadwch ef wrth newid eich enw defnyddiwr';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Daw eich treial Plutonium i ben ar $date. Uwchratiwch i gadw eich tag personol a chael bathodyn ar eich proffil.';
  }

  @override
  String get premiumTrialActive =>
      'Rydych chi ar dreial Plutonium. Uwchratiwch i gadw eich tag personol a chael bathodyn ar eich proffil.';

  @override
  String get fluxerTagUpdated => 'Mae\'r FluxerTag wedi\'i ddiweddaru';

  @override
  String get fluxerTagUpdateFailed =>
      'Methodd diweddaru\'r FluxerTag. Rhowch gynnig arall arni.';

  @override
  String get continueAction => 'Parhau';

  @override
  String get profileCustomizationTitle => 'Addasu Proffil';

  @override
  String get profileCustomizationDescription =>
      'Golygu ymddangosiad eich proffil a gweld rhagolwg byw';

  @override
  String get usernameLabel => 'Enw Defnyddiwr';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Hawlio eich cyfrif i newid eich FluxerTag';

  @override
  String get changeFluxerTag => 'Newch FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Addwch eich tag 4-digid (#$discriminator) i\'ch dant gyda Phlwtōniwm';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Newch eich enw defnyddiwr a\'ch tag 4-digid';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Mae eich tag personol (#$discriminator) yn gysylltiedig â\'ch tanysgrifiad Phlwtōniwm a bydd yn dychwelyd i dag ar hap os daw i ben.';
  }

  @override
  String get displayNameLabel => 'Enw Dangos';

  @override
  String get pronounsLabel => 'Rhagenwau';

  @override
  String get avatarLabel => 'Aelod-lun';

  @override
  String get changeAvatar => 'Newch yr Aelod-lun';

  @override
  String get removeAvatar => 'Dileu\'r Aelod-lun';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Uchafswm 10MB. Argymhellir: 512×512px';

  @override
  String get bannerLabel => 'Baner';

  @override
  String get changeBanner => 'Newch y Faner';

  @override
  String get removeBanner => 'Dileu\'r Faner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Uchafswm 10MB. Isafswm: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Lliw Accen';

  @override
  String get accentColorDescription =>
      'Yn personoli\'r ffin a lliw\'r faner ar eich proffil';

  @override
  String get aboutMeLabel => 'Amdanof Fi';

  @override
  String get aboutMeHelperText =>
      'Gallwch ddefnyddio dolenni, emoji, a Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Preifatrwydd Bathodyn Phlwtōniwm';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Rheoli sut mae eich bathodyn Phlwtōniwm yn cael ei arddangos i eraill';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Cuddio bathodyn Phlwtōniwm yn gyfan gwbl';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Cuddio\'ch bathodyn Phlwtōniwm yn llwyr rhag defnyddwyr eraill';

  @override
  String get hidePlutoniumPurchaseDate => 'Cuddio dyddiad prynu Phlwtōniwm';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Cuddio dyddiad prynu Phlwtōniwm ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Dileu pryd y prynoch Phlwtōniwm gyntaf o\'ch bathodyn';

  @override
  String get maskVisionaryAsSubscription => 'Masgio Gweledydd fel tanysgrifiad';

  @override
  String get maskVisionaryDescription =>
      'Dangos eich Gweledydd fel tanysgrifiad rheolaidd yn lle hynny';

  @override
  String get hideVisionaryIdBadge => 'Cuddio bathodyn ID Gweledydd';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Cuddio bathodyn ID Gweledydd (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Dileu\'ch bathodyn ID Gweledydd';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Rydych chi ar dreial Phlwtōniwm — bydd eich tanysgrifiad yn dechrau ar $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Bydd eich tanysgrifiad yn dechrau\'n awtomatig pan ddaw eich treial i ben. Dim angen gwneud dim.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Rydych chi ar dreial Phlwtōniwm sy\'n dod i ben ar $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Rydych chi ar dreial Phlwtōniwm';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Uchafswm 10MB. Argymhellir: 512×512px. Mae angen Phlwtōniwm ar gyfer aelod-luniau animeiddiedig (GIF).';

  @override
  String get bannerPlutoniumUpsell =>
      'Personolwch eich proffil gyda delwedd faner statig neu animeiddiedig i\'w gwneud yn arbennig.';

  @override
  String get getPlutonium => 'Cael Phlwtōniwm';

  @override
  String get plutoniumNotAvailableTitle => 'Phlwtōniwm';

  @override
  String get plutoniumNotAvailableBody =>
      'Nid yw pryniannau yn yr ap ar gael ar y platfform hwn eto. Arhoswch yn tiwn — yn fuan!';

  @override
  String get profilePreviewLabel => 'Rhagolwg';

  @override
  String get profilePreviewMessage => 'Neges';

  @override
  String get profilePreviewMemberSince => 'Aelod Fluxer Ers';

  @override
  String get unclaimedAccountTitle => 'Cyfrif Heb Hawlio';

  @override
  String get unclaimedAccountDescription =>
      'Nid yw eich cyfrif wedi\'i hawlio eto. Heb e-bost a chyfrinair, gallech golli mynediad. Hawliwch eich cyfrif nawr i\'w sicrhau.';

  @override
  String get claimAccount => 'Hawlio Cyfrif';

  @override
  String get profileTypeLabel => 'Math Proffil';

  @override
  String get profileTypeGlobal => 'Proffil Byd-eang';

  @override
  String get profileTypeGuildDescription =>
      'Rydych chi\'n golygu eich proffil fesul cymuned. Dim ond yn y gymuned hon y bydd y proffil hwn i\'w weld a bydd yn rhagori ar eich proffil byd-eang.';

  @override
  String get communityNicknameLabel => 'Llysenw Cymunedol';

  @override
  String get perGuildPremiumUpsellText =>
      'Mae addasu eich avatar, baner, lliw acen, a bio ar gyfer cymunedau unigol yn gofyn am Blatinwm. Mae llysenw cymunedol a rhagenwau yn rhad ac am ddim i bawb.';

  @override
  String get avatarModeInherit => 'Defnyddio Proffil Byd-Eang';

  @override
  String get avatarModeCustom => 'Defnyddio Delwedd Personol';

  @override
  String get avatarModeUnset => 'Peidio â Dangos';

  @override
  String get profileSavedToast => 'Wedi diweddaru proffil';

  @override
  String get profileEditButton => 'Golygu Proffil';

  @override
  String get profileNoteLabel => 'Nodyn';

  @override
  String get profileNoteVisibility => '(dim ond chi all ei weld)';

  @override
  String get profileNoteEmpty => 'Dim nodyn eto.';

  @override
  String get sudoTitle => 'Dilysu Eich Hunaniaeth';

  @override
  String get sudoDescription =>
      'Mae\'r weithred hon yn gofyn am ddilysu i barhau.';

  @override
  String get sudoAuthenticatorCode => 'Cod Dilysydd';

  @override
  String get sudoMethodPassword => 'Cyfrinair';

  @override
  String get sudoMethodTotp => 'Dilysydd';

  @override
  String get sudoVerificationFailed =>
      'Methodd y dilysu. Rhowch gynnig arall arni.';

  @override
  String get securityAccountTitle => 'Cyfrif';

  @override
  String get securityAccountDescription =>
      'Rheoli eich e-bost, cyfrinair, a gosodiadau cyfrif';

  @override
  String get securitySectionTitle => 'Diogelwch';

  @override
  String get securitySectionDescription =>
      'Amddiffyn eich cyfrif gyda dilysu dau ffactor a phasskeys';

  @override
  String get securityLoginEmailSectionTitle => 'Gosodiadau E-bost';

  @override
  String get securityLoginEmailSectionDescription =>
      'Rheoli\'r cyfeiriad e-bost rydych chi\'n ei ddefnyddio i fewngofnodi i Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'Cyfeiriad E-bost';

  @override
  String get securityLoginNoEmailSet => 'Dim cyfeiriad e-bost wedi\'i osod';

  @override
  String get securityLoginChangeEmail => 'Newid E-bost';

  @override
  String get securityLoginAddEmail => 'Ychwanegu E-bost';

  @override
  String get securityLoginReveal => 'Datgelu';

  @override
  String get securityLoginHide => 'Cuddio';

  @override
  String get securityLoginPasswordSectionTitle => 'Cyfrinair';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Newidiwch eich cyfrinair i gadw eich cyfrif yn ddiogel';

  @override
  String get securityLoginCurrentPasswordLabel => 'Cyfrinair Presennol';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Newidiwyd ddiwethaf: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Newidiwyd ddiwethaf: Byth';

  @override
  String get securityLoginNoPasswordSet => 'Dim cyfrinair wedi\'i osod';

  @override
  String get securityLoginChangePassword => 'Newid Cyfrinair';

  @override
  String get securityLoginSetPassword => 'Gosod Cyfrinair';

  @override
  String get passwordChangeTitle => 'Newid Cyfrinair';

  @override
  String get passwordChangeIntroDescription =>
      'Byddwn yn anfon cod dilysu i\'ch cyfeiriad e-bost i gadarnhau\'ch hunaniaeth cyn newid eich cyfrinair.';

  @override
  String get passwordChangeStart => 'Dechrau';

  @override
  String get passwordChangeVerifyTitle => 'Dilysu Eich E-bost';

  @override
  String get passwordChangeVerifyDescription =>
      'Nac ydych y cod dilysu a anfonwyd i\'ch cyfeiriad e-bost.';

  @override
  String get passwordChangeVerificationCode => 'Cod Dilysu';

  @override
  String get passwordChangeVerify => 'Dilysu';

  @override
  String get passwordChangeNewPasswordTitle => 'Gosod Cyfrinair Newydd';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Nac ydych eich cyfrinair newydd isod.';

  @override
  String get passwordChangeNewPassword => 'Cyfrinair Newydd';

  @override
  String get passwordChangeConfirmPassword => 'Cadarnhau Cyfrinair Newydd';

  @override
  String get passwordChangeSubmit => 'Newid Cyfrinair';

  @override
  String get passwordChangeSuccess => 'Wedi newid cyfrinair';

  @override
  String get passwordChangePasswordsDoNotMatch =>
      'Nid yw cyfrineiriau\'n cyfateb';

  @override
  String get passwordChangeInvalidCode => 'Cod annilys neu wedi dyddio';

  @override
  String get emailChangeTitle => 'New Email';

  @override
  String get emailChangeIntroDescription =>
      'Byddwn yn anfon codau dilysu i wirio\'ch hunaniaeth cyn newid eich cyfeiriad e-bost.';

  @override
  String get emailChangeStart => 'Dechrau';

  @override
  String get emailChangeVerifyOriginalTitle => 'Dilysu E-bost Presennol';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Rhowch y cod dilysu a anfonwyd i\'ch cyfeiriad e-bost presennol.';

  @override
  String get emailChangeNewEmailTitle => 'Rhowch E-bost Newydd';

  @override
  String get emailChangeNewEmailDescription =>
      'Rhowch y cyfeiriad e-bost newydd yr hoffech ei ddefnyddio.';

  @override
  String get emailChangeNewEmailLabel => 'E-bost Newydd';

  @override
  String get emailChangeNewEmailSubmit => 'Anfon Cod Dilysu';

  @override
  String get emailChangeVerifyNewTitle => 'Dilysu E-bost Newydd';

  @override
  String get emailChangeVerifyNewDescription =>
      'Rhowch y cod dilysu a anfonwyd i\'ch cyfeiriad e-bost newydd.';

  @override
  String get emailChangeSuccess => 'Newidiwyd yr e-bost';

  @override
  String get emailChangeInvalidCode => 'Cod annilys neu wedi dod i ben';

  @override
  String get resend => 'Ail-anfon';

  @override
  String resendCountdown(int seconds) {
    return 'Ail-anfon (${seconds}s)';
  }

  @override
  String get verificationCode => 'Cod Dilysu';

  @override
  String get verify => 'Dilysu';

  @override
  String get enable => 'Galluogi';

  @override
  String get disable => 'Analluogi';

  @override
  String get delete => 'Dileu';

  @override
  String get save => 'Cadw';

  @override
  String get securityTfaSectionTitle => 'Amdiffyniad Dau-Ffactor';

  @override
  String get securityTfaSectionDescription =>
      'Ychwanegwch haen ychwanegol o ddiogelwch i\'ch cyfrif';

  @override
  String get securityTfaAuthenticatorApp => 'Ap Dilysu';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Mae amddiffyniad dau-ffactor wedi\'i alluogi';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Defnyddiwch ap dilysydd i gynhyrchu codau ar gyfer dilysu dau-ffactor';

  @override
  String get securityTfaBackupCodes => 'Codau Wrth Gefn';

  @override
  String get securityTfaBackupCodesDescription =>
      'Gweld a rheoli eich codau wrth gefn ar gyfer adfer cyfrif';

  @override
  String get securityTfaViewCodes => 'Gweld Codau';

  @override
  String get securityPasskeysSectionTitle => 'Allweddau Pas';

  @override
  String get securityPasskeysSectionDescription =>
      'Defnyddiwch allweddau pas ar gyfer mewngofnodi heb gyfrinair a dilysu dau-ffactor';

  @override
  String get securityPasskeysRegistered => 'Allweddau Pas wedi\'u Cofrestru';

  @override
  String get securityPasskeysNone => 'Dim allweddau pas wedi\'u cofrestru';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'allweddau pas',
      one: 'allwedd pas',
    );
    return '$count $_temp0 wedi\'u cofrestru (uchafswm o 10)';
  }

  @override
  String get securityPasskeysAdd => 'Ychwanegu Allwedd Pas';

  @override
  String securityPasskeysAdded(String date) {
    return 'Ychwanegwyd: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Ddefnyddiwyd ddiwethaf: $date';
  }

  @override
  String get securityPasskeysRename => 'Ail-enwi';

  @override
  String get securityPasskeysDeleteTitle => 'Dileu Allwedd Pas';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Ydych chi\'n siŵr eich bod am ddileu\'r allwedd pas \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Enwi Allwedd Pas';

  @override
  String get securityPasskeyNameLabel => 'Enw Allwedd Pas';

  @override
  String get securityPasskeyNameHint =>
      'ee. YubiKey, iPhone, Cyfrifiadur Gwaith';

  @override
  String get securityPhoneSectionTitle => 'Rhif Ffôn';

  @override
  String get securityPhoneSectionDescription => 'Rheoli eich rhif ffôn.';

  @override
  String get securityPhoneLabel => 'Rhif Ffôn';

  @override
  String get securityPhoneNone => 'Dim rhif ffôn wedi\'i ychwanegu.';

  @override
  String get securityPhoneAdd => 'Ychwanegu Ffôn';

  @override
  String get securityPhoneRemove => 'Dileu';

  @override
  String get securityPhoneRemoveTitle => 'Dileu Rhif Ffôn';

  @override
  String get securityPhoneRemoveDescription =>
      'Ydych chi\'n siŵr eich bod am dynnu eich rhif ffôn?';

  @override
  String get securityPhoneRemoved => 'Rhif ffôn wedi\'i dynnu';

  @override
  String get securityClaimTitle => 'Nodweddion Diogelwch';

  @override
  String get securityClaimDescription =>
      'Hawlwch eich cyfrif i gael mynediad i nodweddion diogelwch fel dilysu dau ffactor a allweddi cyfrinair.';

  @override
  String get securityVerifyEmailRequired =>
      'Rhaid i chi ddilysu eich cyfeiriad e-bost cyn y gallwch osod dilysu dau ffactor, allweddi cyfrinair, neu ddilysu SMS.';

  @override
  String get totpEnableTitle => 'Gosod Ap Dilysu';

  @override
  String get totpEnableDescription =>
      'Sganiwch y cod QR gyda\'ch ap dilysu i greu codau ar gyfer dilysu dau ffactor.';

  @override
  String get totpEnableCodeLabel => 'Cod';

  @override
  String get totpEnableCodeHint => 'Rhowch y cod 6 digid o\'ch ap dilysu';

  @override
  String get totpEnableSuccess => 'Mae dilysu dau ffactor wedi\'i alluogi';

  @override
  String get totpDisableTitle => 'Tynnu Ap Dilysu';

  @override
  String get totpDisableDescription =>
      'Rhowch y cod 6 digid o\'ch ap dilysu i analluogi dilysu dau ffactor.';

  @override
  String get totpDisableSuccess => 'Dilysu dau ffactor wedi\'i analluogi';

  @override
  String get backupCodesTitle => 'Codau Wrth Gefn';

  @override
  String get backupCodesWarning =>
      'Os collwch chi fynediad i\'ch ap dilysu ac nad oes gennych y codau hyn, byddwch yn cael eich cloi allan o\'ch cyfrif yn barhaol. Dadlwythwch neu copïwch nhw nawr a\'u storio mewn lle diogel.';

  @override
  String get backupCodesDownload => 'Dadlwytho';

  @override
  String get backupCodesCopy => 'Copïo';

  @override
  String get backupCodesCopied =>
      'Codau wrth gefn wedi\'u copïo i\'r clipfwrdd';

  @override
  String get backupCodesAcknowledge =>
      'Rwyf wedi lawrlwytho neu gopïo fy nghodau wrth gefn ac wedi\'u storio mewn lle diogel.';

  @override
  String get backupCodesDone => 'Wedi';

  @override
  String get backupCodesViewTitle => 'Gweld Codau Wrth Gefn';

  @override
  String get backupCodesViewDescription =>
      'Efallai y bydd angen dilysu cyn gweld eich codau wrth gefn.';

  @override
  String get phoneAddTitle => 'Ychwanegu Rhif Ffôn';

  @override
  String get phoneAddLabel => 'Rhif Ffôn';

  @override
  String get phoneAddHint => 'Rhowch eich rhif ffôn';

  @override
  String get phoneAddFooter =>
      'Rhowch eich rhif ffôn. Byddwn yn anfon cod dilysu atoch trwy SMS.';

  @override
  String get phoneAddSendCode => 'Anfon Cod';

  @override
  String get phoneVerifyTitle => 'Dilysu Rhif Ffôn';

  @override
  String get phoneVerifyDescription =>
      'Rhowch y cod dilysu a anfonwyd i\'ch rhif ffôn.';

  @override
  String get phoneAddSuccess => 'Rhif ffôn wedi\'i ychwanegu';

  @override
  String get dangerZoneSectionTitle => 'Parth Perygl';

  @override
  String get dangerZoneSectionDescription =>
      'Gweithredoedd anadferadwy a dinistriol';

  @override
  String get dangerZoneDisableTitle => 'Analluogi Cyfrif';

  @override
  String get dangerZoneDisableDescription =>
      'Analluogwch eich cyfrif dros dro. Gallwch ei ailgyflwyno\'n ddiweddarach trwy fewngofnodi eto.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Bydd analluogi eich cyfrif yn eich allgofnodi o\'r holl sesiynau. Gallwch ailgyflwyno eich cyfrif ar unrhyw adeg trwy fewngofnodi eto.';

  @override
  String get dangerZoneDeleteTitle => 'Dileu Cyfrif';

  @override
  String get dangerZoneDeleteDescription =>
      'Dileuwch eich cyfrif a\'r holl ddata cysylltiedig yn barhaol. Ni ellir gwrthdroi\'r weithred hon.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Canslwch eich tanysgrifiad Plwtoniwm gweithredol yn gosodiadau Plwtoniwm cyn dileu eich cyfrif.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Methu dileu cyfrif';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Ni allwch ddileu eich cyfrif tra\'ch bod chi\'n berchen ar gymunedau. Trosglwyddwch berchnogaeth y canlynol cymunedau yn gyntaf:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'a $count eraill';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'I drosglwyddo perchnogaeth, ewch i $settingsPath a defnyddiwch yr opsiwn trosglwyddo perchnogaeth.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Ydych chi\'n siŵr eich bod am ddileu eich cyfrif? Bydd y weithred hon yn amserlennu eich cyfrif i\'w ddileu yn barhaol.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Gallwch ganslo\'r broses ddileu o fewn 14 diwrnod';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Ar ôl 14 diwrnod, bydd eich cyfrif yn cael ei ddileu yn barhaol';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Ar ôl i\'r dileu gael ei brosesu, ni allwch adfer mynediad i\'ch cyfrif';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Ni allwch ddileu eich negeseuon a anfonwyd ar ôl i\'ch cyfrif gael ei ddileu';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Os ydych chi am allforio eich data neu ddileu eich negeseuon yn gyntaf, ewch i\'r adran Dangosfwrdd Preifatrwydd yng Ngosodiadau Defnyddiwr cyn parhau.';

  @override
  String get claimAccountTitle => 'Hawlwch Eich Cyfrif';

  @override
  String get claimAccountDescription =>
      'Hawlwch eich cyfrif trwy ychwanegu e-bost a chyfrinair. Byddwn yn anfon cod dilysu i gadarnhau eich e-bost cyn gorffen.';

  @override
  String get claimAccountEmailLabel => 'E-bost';

  @override
  String get claimAccountPasswordLabel => 'Cyfrinair';

  @override
  String get claimAccountSendCode => 'Anfon Cod';

  @override
  String get claimAccountVerifyDescription =>
      'Rhowch y cod a anfonwyd gennym i\'ch e-bost i\'w ddilysu. Gosodir eich cyfrinair ar ôl cadarnhau\'r cod.';

  @override
  String get claimAccountSuccess => 'Wedi hawlio\'r cyfrif yn llwyddiannus';

  @override
  String get importantInformation => 'Gwybodaeth bwysig:';

  @override
  String get genericError => 'Digwyddodd gwall';

  @override
  String get invalidCode => 'Cod annilys';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blynedd yn ôl',
      one: '1 flwyddyn yn ôl',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mis yn ôl',
      one: '1 mis yn ôl',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diwrnodau yn ôl',
      one: '1 diwrnod yn ôl',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oriau yn ôl',
      one: '1 awr yn ôl',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count munudau yn ôl',
      one: '1 munud yn ôl',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'dim ond nawr';

  @override
  String get authorizedAppsTitle => 'Cymhwysiadau Awdurdodedig';

  @override
  String get authorizedAppsDescription =>
      'Mae\'r cymhwysiadau hyn wedi cael caniatâd i gyrchu eich cyfrif Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Dim Cymhwysiadau Awdurdodedig';

  @override
  String get authorizedAppsEmptyDescription =>
      'Nid ydych wedi awdurdodi unrhyw gymhwysiadau i gyrchu eich cyfrif.';

  @override
  String get authorizedAppsLoadError =>
      'Methodd Llwytho Cymhwysiadau Awdurdodedig';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Awdurdodedig ar $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Caniatâd wedi\'i roi';

  @override
  String get authorizedAppsRevoke => 'Diddymu';

  @override
  String get authorizedAppsRevokeTitle => 'Diddymu mynediad cymhwysiad';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Ydych chi\'n siŵr eich bod am ddiddymu mynediad ar gyfer $appName? Ni fydd gan y cymhwysiad hwn fynediad i\'ch cyfrif mwyach.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Cyrchu eich gwybodaeth proffil sylfaenol (enw defnyddiwr, avatar, ac ati)';

  @override
  String get authorizedAppsScopeEmail => 'Gweld eich cyfeiriad e-bost';

  @override
  String get authorizedAppsScopeGuilds =>
      'Gweld y cymunedau rydych chi\'n aelod ohonynt';

  @override
  String get authorizedAppsScopeConnections =>
      'Gweld eich cyfrifon cysylltiedig';

  @override
  String get authorizedAppsScopeBot =>
      'Ychwanegu bot i gymuned gyda chaniatâd gofynnol';

  @override
  String get authorizedAppsScopeAdmin => 'Cyrchu pwyntiau terfyn gweinyddol';

  @override
  String get privacyPendingDeletionTitle => 'Ar Eich Disgwyliad Dileu';

  @override
  String get blockedUsersTitle => 'Defnyddwyr wedi\'u Blocio';

  @override
  String get blockedUsersDescription =>
      'Ni all defnyddwyr wedi\'u blocio eich anfon ceisiadau ffrindiau nac anfon neges atoch yn uniongyrchol.';

  @override
  String get blockedUsersEmptyTitle => 'Dim Defnyddwyr Wedi\'u Blocio';

  @override
  String get blockedUsersEmptyDescription => 'Nid ydych wedi blocio neb eto.';

  @override
  String get blockedUsersLoadError =>
      'Methodd Llwytho Defnyddwyr Wedi\'u Blocio';

  @override
  String get blockedUsersUnblock => 'Dadflocio';

  @override
  String get blockedUsersUnblockTitle => 'Dadflocio Defnyddiwr';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Ydych chi\'n siŵr eich bod am ddadflocio $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Copïo FluxerTag';

  @override
  String get blockedUsersCopyId => 'Copïo ID Defnyddiwr';

  @override
  String get userProfileLoadError => 'Methodd llwytho proffil';

  @override
  String get userProfileRetry => 'Ceisiwch eto';

  @override
  String get userProfileMessage => 'Neges';

  @override
  String get userProfileVoiceCall => 'Galwad Llais';

  @override
  String get userProfileVideoCall => 'Galwad Fideo';

  @override
  String get userProfileEditProfile => 'Golygu Proffil';

  @override
  String get userProfileStaffBadgeTooltip => 'Staff Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Tîm Cymuned Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Partner Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Heliwr Bugiau Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Plwtoniwm Fluxer';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'tanysgrifiwr Plwtoniwm Fluxer er $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Gweledydd Fluxer';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Gweledydd er $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Gweledydd #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Ffrindiau Ar Y Cyd ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Cymunedau Ar Y Cyd ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Ffrindiau Ar Y Cyd';

  @override
  String get userProfileMutualCommunitiesTitle => 'Cymunedau Ar Y Cyd';

  @override
  String get userProfileNoMutualFriends =>
      'Ni chafwyd hyd i ffrindiau ar y cyd.';

  @override
  String get userProfileNoMutualCommunities =>
      'Ni chafwyd hyd i gymunedau ar y cyd.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Llysenw: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Agor DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Fe wnaethoch chi rwystro $username. Ni fyddwch yn gallu anfon negeseuon oni bai eich bod yn dadflocio nhw.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Dadflocio';

  @override
  String get userProfileOpenDm => 'Agor DM';

  @override
  String get userProfileNoteTitle => 'Nodyn';

  @override
  String get userProfileNoteVisibility => '(dim ond chi all ei weld)';

  @override
  String get userProfileNoteSave => 'Cadw';

  @override
  String get userProfileNoteDelete => 'Dileu';

  @override
  String get userProfileNoteEmpty => 'Cliciwch i ychwanegu nodyn';

  @override
  String get userProfileMemberSince => 'Aelod Ers';

  @override
  String get userProfileAboutMe => 'Amdan i Fi';

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
  String get userProfileCopyUsername => 'Copïo Enw Defnyddiwr';

  @override
  String get userProfileCopyUserId => 'Copïo ID Defnyddiwr';

  @override
  String get userProfileViewMainProfile => 'Gweld Prif Broffil';

  @override
  String get userProfileViewCommunityProfile => 'Gweld Proffil Cymuned';

  @override
  String get userProfileBlockUser => 'Rhwystro Defnyddiwr';

  @override
  String get userProfileUnblockUser => 'Dadflocio Defnyddiwr';

  @override
  String get userProfileRemoveFriend => 'Dileu Ffrind';

  @override
  String get userProfileBlockConfirmTitle => 'Rhwystro Defnyddiwr';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Ydych chi\'n siŵr eich bod am rwystro $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Dadflocio Defnyddiwr';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Ydych chi\'n siŵr eich bod am ddadflocio $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Dileu Ffrind';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Ydych chi\'n siŵr eich bod am ddileu $username fel ffrind?';
  }

  @override
  String get userProfileFailedOpenDm => 'Methwyd ag agor DM';

  @override
  String get userProfileFailedSaveNote => 'Methwyd â chadw\'r nodyn';

  @override
  String get userProfileActionFailed =>
      'Methodd y weithred, rhowch gynnig arall arni';

  @override
  String get userProfileChangeNickname => 'Newid llysenw';

  @override
  String get userProfileKick => 'Cicio';

  @override
  String get userProfileBan => 'Gwahardd';

  @override
  String get userProfileTimeout => 'Amser allan';

  @override
  String get userProfileRemoveTimeout => 'Dileu amser allan';

  @override
  String get userProfileTransferOwnership => 'Trosglwyddo perchnogaeth';

  @override
  String get userProfileReportUser => 'Adrodd am ddefnyddiwr';

  @override
  String get userProfileReportMessage => 'Adrodd am neges';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Cicio $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Ydych chi\'n siŵr eich bod am gicio $username? Gallant ailymuno gyda gwahoddiad newydd.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Diddymu\'r amseriad?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Bydd dileu\'r amseriad yn caniatáu i $username anfon negeseuon, ymateb, ac ymuno â sianeliadau llais eto.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Trosglwyddo perchnogaeth?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Trosglwyddo perchnogaeth y gymuned hon i $username? Mae hyn yn anadferadwy a byddwch yn colli pob hawl perchennog.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Gwahardd $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Hyd yr amser gwahardd';

  @override
  String get userProfileBanCustomSecondsLabel => 'Hyd personol (eiliadau)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Unrhyw werth o $min i $max eiliad';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Dileu hanes negeseuon';

  @override
  String get userProfileBanDeleteNone => 'Peidio â dileu unrhyw rai';

  @override
  String get userProfileBanDelete24h => '24 awr diwethaf';

  @override
  String get userProfileBanDelete7d => '7 diwrnod diwethaf';

  @override
  String get userProfileBanReasonLabel => 'Rheswm (dewisol)';

  @override
  String get userProfileBanReasonHint => 'Rhowch reswm dros y gwaharddiad';

  @override
  String get userProfileBanSubmit => 'Gwahardd aelod';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Amseriad allan $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Hyd amseriad allan';

  @override
  String get userProfileTimeoutSubmit => 'Amseriad allan aelod';

  @override
  String get userProfileNicknameLabel => 'Llysenw';

  @override
  String get userProfileNicknameHint => 'Rhowch lysenw';

  @override
  String get userProfileNicknameSave => 'Cadw';

  @override
  String userProfileKickSuccess(String username) {
    return 'Wedi cicio $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Wedi gwahardd $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Wedi rhoi amseriad allan i $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Wedi tynnu amseriad allan ar gyfer $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Wedi diweddaru\'r llysenw';

  @override
  String get userProfileTransferSuccess => 'Trosglwyddwyd perchnogaeth';

  @override
  String get durationPermanent => 'Parhaol';

  @override
  String get duration60Seconds => '60 eiliad';

  @override
  String get duration5Minutes => '5 munud';

  @override
  String get duration10Minutes => '10 munud';

  @override
  String get duration1Hour => '1 awr';

  @override
  String get duration12Hours => '12 awr';

  @override
  String get duration1Day => '1 diwrnod';

  @override
  String get duration3Days => '3 diwrnod';

  @override
  String get duration5Days => '5 diwrnod';

  @override
  String get duration1Week => '1 wythnos';

  @override
  String get duration2Weeks => '2 wythnos';

  @override
  String get duration1Month => '1 mis';

  @override
  String get durationCustom => 'Arferol…';

  @override
  String get iarReportUserTitle => 'Adrodd am ddefnyddiwr';

  @override
  String get iarReasonInappropriateProfile => 'Proffil amhriodol';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Mae proffil y defnyddiwr hwn yn cynnwys cynnwys amhriodol';

  @override
  String typingIndicatorOne(String name) {
    return 'Mae $name yn teipio...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return 'Mae $name1 a $name2 yn teipio...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return 'Mae $name1, $name2 a $name3 yn teipio...';
  }

  @override
  String get typingIndicatorMultiple => 'Mae sawl person yn teipio...';

  @override
  String get typingIndicatorHandful =>
      'Mae dyrnaid o feistri bysellfwrdd yn ymgasglu...';

  @override
  String get typingIndicatorSymphony =>
      'Mae symffoni o fysellfyrddau\'n digwydd...';

  @override
  String get typingIndicatorFiesta => 'Mae gwledd deipio lawn yn digwydd yma';

  @override
  String get typingIndicatorApocalypse => 'O, dyma apocalyps ysgrifennu!';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Rydw i\'n falch dy fod ti yma, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Croeso, $username! Teimla\'n gartrefol.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Helo, $username! Pleser dy gael yma.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Helo, $username! Ymunwch pryd bynnag fyddi di\'n barod.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hae $username, mae\'n bleser dy weld di yma!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hae di, $username! Gobeithio dy fod ti\'n mwynhau dy arhosiad.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hae, $username, croeso ar eich bwrdd!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Rydw i\'n falch dy fod ti wedi cyrraedd, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Croeso i mewn, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Croeso, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Croeso, $username! Rydyn ni\'n falch dy fod ti yma.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Croeso, $username! Gobeithio dy fod ti\'n mwynhau dy amser yma.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Croeso, $username! Dy nesaf sgwrs sy\'n dechrau yma.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Croeso, $username. Rydyn ni\'n hapus dy fod ti yma.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Da gen i\'ch gweld chi, $username! Croeso i mewn.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Rwyt ti yma, $username! Da gen i\'ch cael chi gyda ni.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Rwyt ti wedi cyrraedd, $username! Gad inni ddechrau.';
  }

  @override
  String get relativeTimeShortNow => 'nawr';

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
      other: '${count}y',
      one: '1y',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Fy Ndyfeisiau';

  @override
  String get linkedDevicesDescription =>
      'Gweld pob dyfais sydd wedi mewngofnodi i\'ch cyfrif ar hyn o bryd. Dirymwch unrhyw sesiynau nad ydych chi\'n eu hadnabod.';

  @override
  String get linkedDevicesCurrentDevice => 'Dyfais Gyfredol';

  @override
  String get linkedDevicesOtherDevices => 'Dyfeisiau Eraill';

  @override
  String get linkedDevicesEnterSelection => 'Mewnbynnu\'r Modd Dewis';

  @override
  String get linkedDevicesExitSelection => 'Gadael y Modd Dewis';

  @override
  String get linkedDevicesSelectAll => 'Dewis Pawb';

  @override
  String get linkedDevicesClearSelection => 'Clirio\'r Dewis';

  @override
  String get linkedDevicesRevokeTooltip => 'Dirymu dyfais';

  @override
  String get linkedDevicesSignOutAll => 'Allgofnodi pob dyfais arall';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Allgofnodi $count dyfais',
      one: 'Allgofnodi 1 dyfais',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Allgofnodi $count dyfais',
      one: 'Allgofnodi 1 dyfais',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => 'Allgofnodi pob dyfais arall';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bydd hyn yn allgofnodi\'r dyfeisiau dethol o\'ch cyfrif. Bydd angen i chi fewngofnodi eto ar y dyfeisiau hynny.',
      one:
          'Bydd hyn yn allgofnodi\'r ddyfais ddethol o\'ch cyfrif. Bydd angen i chi fewngofnodi eto ar y ddyfais honno.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Bydd hyn yn allgofnodi\'r dyfeisiau dethol o\'ch cyfrif. Bydd angen i chi fewngofnodi eto ar y dyfeisiau hynny.';

  @override
  String get linkedDevicesSignOutConfirm => 'Parhau';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Bydd yn rhaid i chi fewngofnodi eto ar bob dyfais a allgofnodwyd';

  @override
  String get linkedDevicesLoadErrorTitle => 'Gwall Rhwydwaith';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Mae problemau gyda ni\'n cysylltu â\'r parth amser-gofod. Gwiriwch eich cysylltiad a rhowch gynnig arall arni.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dyfeisiau wedi\'u dirymu',
      one: 'Dyfais wedi\'i dirymu',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Methodd allgofnodi. Rhowch gynnig arall arni.';

  @override
  String get linkedDevicesUnknownOs => 'OS Anhysbys';

  @override
  String get linkedDevicesUnknownPlatform => 'Llwyfan Anhysbys';

  @override
  String slowmodeLabel(String duration) {
    return '$duration slowmode';
  }

  @override
  String get slowmodeTooltipActive =>
      'Rydych chi mewn slowmode. Rhowch gynnig arall cyn anfon neges arall.';

  @override
  String get slowmodeTooltipImmune =>
      'Mae slowmode wedi\'i alluogi, ond rydych chi\'n imiwn.';

  @override
  String get channelNoSendPermissionHint =>
      'Allwch chi ddim anfon negesion yn y sianel hon.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Cyhoeddiadau system gan staff $productName. Ni allwch ymateb yma.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Mae negeseua yn cael ei oedi dros dro yn y gymuned hon.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Rydych chi wedi cael eich amseru allan. Mae negeseua, adweithiau, a llais wedi\'u hatal tan i\'r amseriad ddod i ben.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Mae angen i chi hawlio\'ch cyfrif i anfon negeseion yn y gymuned hon.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Mae angen i chi ddilysu\'ch e-bost i anfon negeseion yn y gymuned hon.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Mae eich cyfrif yn rhy newydd i anfon negeseion yn y gymuned hon.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Nid ydych chi wedi bod yn aelod o\'r gymuned hon ddigon hir i anfon negeseion.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Mae angen i chi ddilysu rhif ffôn i anfon negeseion yn y gymuned hon.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Dilysu e-bost';

  @override
  String get channelComposerBarrierVerifyPhone => 'Dilysu ffôn';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Gormod o atodiadau (uchafswm $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Mae un neu fwy o ffeiliau yn fwy na\'r terfyn maint';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Mae\'r ffeiliau hynny\'n rhy fawr i\'w hanfon gyda\'i gilydd';

  @override
  String get chatAttachmentDropToUpload => 'Gollwng ffeiliau i\'w lanlwytho';

  @override
  String get chatAttachmentDropToSend => 'Gollwng ffeiliau i\'w hanfon nawr';

  @override
  String get chatAttachmentSendVoiceMessage => 'Anfon neges llais';

  @override
  String get voiceMessageTitle => 'Neges llais';

  @override
  String get voiceMessageHoldHint =>
      'Daliwch i recordio. Tynnwch i fyny i gloi, neu rhyddhewch i\'w anfon.';

  @override
  String get voiceMessageDiscard => 'Taflwch neges llais';

  @override
  String get voiceMessageSend => 'Anfon neges llais';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Methu dechrau recordio. Caniatewch fynediad i\'r meicroffon.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Nid yw recordio llais yn cael ei gefnogi ar y ddyfais hon.';

  @override
  String get voiceMessageMicInUse =>
      'Gadewch yr alwad llais i recordio neges llais.';

  @override
  String get voiceMessageRecordingFailed =>
      'Methodd recordio. Rhowch gynnig arall arni.';

  @override
  String get voiceMessageSendFailed =>
      'Methu anfon neges llais. Rhowch gynnig arall arni.';

  @override
  String get voiceMessageRecordingHint =>
      'Siaradwch nawr. Pwyswch Stop pan fyddwch wedi gorffen — gallwch docio wedyn.';

  @override
  String get voiceMessageReviewHint =>
      'Tynnwch y dolenni i docio, yna pwyswch Anfon.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Dechrau recordio';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Chwarae';

  @override
  String get voiceMessagePause => 'Aros';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Rhaid i\'r detholiad fod yn ${secondsString}s o leiaf.';
  }

  @override
  String get chatAttachmentEditTitle => 'Golygu atodiad';

  @override
  String get chatAttachmentFilenameLabel => 'Enw ffeil';

  @override
  String get chatAttachmentDescriptionLabel => 'Disgrifiad';

  @override
  String get chatAttachmentDescriptionHint => 'Testun amgen dewisol';

  @override
  String get chatAttachmentSpoilerLabel => 'Marcio fel spoiler';

  @override
  String get chatAttachmentRemove => 'Tynnu atodiad';

  @override
  String get chatAttachmentDownload => 'Llwytho i lawr';

  @override
  String get chatAttachmentExpiredTooltip => 'Dododd yr atodiad i ben';

  @override
  String get chatAttachmentSourceGallery => 'Oriel';

  @override
  String get chatAttachmentSourceCamera => 'Camera';

  @override
  String get chatAttachmentSourceBrowse => 'Pori ffeiliau';

  @override
  String get chatAttachmentPasteTooltip => 'Gludo delwedd o\'r clipfwrdd';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Datgelu spoiler';

  @override
  String get matureMediaRevealButton => 'Datgelu';

  @override
  String get matureMediaRevealHint => 'Cliciwch i ddatgelu';

  @override
  String get matureContentTitle => 'Cynnwys aeddfed';

  @override
  String get matureCommunityTitle => 'Cymuned oedolion';

  @override
  String get matureCategoryTitle => 'Categori oedolion';

  @override
  String get matureChannelTitle => 'Sianel oedolion';

  @override
  String get communityContentWarningTitle => 'Rhybudd cynnwys cymunedol';

  @override
  String get categoryContentWarningTitle => 'Rhybudd cynnwys categori';

  @override
  String get channelContentWarningTitle => 'Rhybudd cynnwys sianel';

  @override
  String get defaultContentWarningBody =>
      'Mae hyn yn cynnwys cynnwys sensitif.';

  @override
  String get matureCommunityBody =>
      'Mae\'r gymuned hon wedi\'i nodi ar gyfer cynnwys oedolion ac efallai y bydd yn cynnwys deunydd a allai fod yn anaddas i rai defnyddwyr.';

  @override
  String get matureCategoryBody =>
      'Mae\'r categori hwn wedi\'i nodi ar gyfer cynnwys oedolion ac efallai y bydd yn cynnwys deunydd a allai fod yn anaddas i rai defnyddwyr.';

  @override
  String get matureChannelBody =>
      'Mae\'r sianel hon wedi\'i nodi ar gyfer cynnwys oedolion ac efallai y bydd yn cynnwys deunydd a allai fod yn anaddas i rai defnyddwyr.';

  @override
  String get matureVoiceChannelBody =>
      'Mae\'r sianel lais hon wedi\'i nodi ar gyfer cynnwys oedolion ac efallai y bydd yn cynnwys deunydd a allai fod yn anaddas i rai defnyddwyr.';

  @override
  String get matureLinkChannelBody =>
      'Mae\'r sianel ddolen hon wedi\'i nodi ar gyfer cynnwys oedolion ac efallai y bydd yn agor deunydd a allai fod yn anaddas i rai defnyddwyr.';

  @override
  String get matureCommunityUnavailableBody =>
      'Nid yw\'r gymuned oedolion hon ar gael i\'ch cyfrif.';

  @override
  String get matureCategoryUnavailableBody =>
      'Nid yw\'r categori oedolion hwn ar gael i\'ch cyfrif.';

  @override
  String get matureChannelUnavailableBody =>
      'Nid yw\'r sianel oedolion hon ar gael i\'ch cyfrif.';

  @override
  String get matureContentProceedButton => 'Parhau';

  @override
  String get matureContentUnderstandButton => 'Rwy\'n deall';

  @override
  String get matureContentOpenLinkButton => 'Agor dolen';

  @override
  String get sensitiveContentSectionTitle => 'Cynnwys sensitif';

  @override
  String get sensitiveContentSectionDescription =>
      'Rheoli sut mae cyfryngau oedolion neu sensitif yn cael eu hidlo mewn gwahanol gyd-destunau';

  @override
  String get sensitiveContentFriendDmLabel =>
      'Negeseuon uniongyrchol gan ffrindiau';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Negeseuon uniongyrchol gan eraill';

  @override
  String get sensitiveContentGuildLabel => 'Negeseuon mewn sianeli cymunedol';

  @override
  String get sensitiveContentFilterShow => 'Dangos';

  @override
  String get sensitiveContentFilterBlur => 'Niweidio';

  @override
  String get sensitiveContentFilterBlock => 'Blocio';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Niweidio cyfryngau nes bod y sgan diogelwch wedi\'i gwblhau';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Pan fydd wedi\'i alluogi, mae delweddau a fideos yn cael eu niweidio nes bod y sgan diogelwch cynnwys yn gorffen.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Mae\'r gosodiad hwn bob amser ymlaen ar gyfer eich cyfrif.';

  @override
  String get sensitiveContentResetButton => 'Ailosod';

  @override
  String get sensitiveContentSaveButton => 'Cadw';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ffeil',
      one: '1 ffeil',
    );
    return 'Yn uwchlwytho $_temp0';
  }

  @override
  String get chatCancelUpload => 'Canslo uwchlwytho';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Yn dod i ben ar $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Yn dod i ben rhwng $start a $end';
  }

  @override
  String get connectionsTitle => 'Cysylltiadau';

  @override
  String get connectionsDescription =>
      'Cysylltwch gyfrifon ac ardaloedd allanol i\'ch proffil Fluxer. Bydd cysylltiadau wedi\'u dilysu yn cael eu harddangos ar eich proffil i eraill eu gweld.';

  @override
  String get connectionsEmptyTitle => 'Dim cysylltiadau eto';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Cysylltwch eich cyfrif Bluesky neu ddilyswch berchnogaeth parth i\'w harddangos ar eich proffil.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Dilyswch berchnogaeth parth i\'w harddangos ar eich proffil.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Parth';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Ychwanegu cysylltiad Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Ychwanegu cysylltiad parth';

  @override
  String get connectionEdit => 'Golygu';

  @override
  String get connectionRemove => 'Dileu';

  @override
  String get connectionVerifiedLabel =>
      'Mae\'r cysylltiad hwn wedi\'i ddilysu.';

  @override
  String get connectionUnverifiedLabel =>
      'Nid yw\'r cysylltiad hwn wedi\'i ddilysu.';

  @override
  String get connectionAddTitle => 'Ychwanegu Cysylltiad';

  @override
  String get connectionTypeLabel => 'Math o Gysylltiad';

  @override
  String get connectionHandleLabel => 'Trin';

  @override
  String get connectionDomainLabel => 'Parthbarth';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Mae\'r cysylltiad hwn gennych eisoes.';

  @override
  String get connectionConnectBluesky => 'Cysylltu â Bluesky';

  @override
  String get connectionContinue => 'Parhau';

  @override
  String get connectionVerifyTitle => 'Dilysu Cysylltiad';

  @override
  String get connectionVerifyInstructions =>
      'Defnyddiwch y cofnod isod i brofi perchnogaeth parthbarth.';

  @override
  String get connectionDnsRecordTitle => 'Cofnod TXT DNS';

  @override
  String get connectionDnsHostLabel => 'Gwesteiwr';

  @override
  String get connectionDnsValueLabel => 'Gwerth';

  @override
  String get connectionCopyHost => 'Copïo gwesteiwr';

  @override
  String get connectionCopyValue => 'Copïo gwerth';

  @override
  String get connectionCopied => 'Wedi\'i gopïo!';

  @override
  String get connectionTokenFileTitle => 'Gwasanaethu\'r ffeil tocyn';

  @override
  String get connectionTokenFileDescription =>
      'Dadlwythwch **fluxer-verification** a\'i osod yn eich ffolder **.well-known** fel y gallwn ddilysu\'r parthbarth.';

  @override
  String get connectionTokenFileDownload => 'Dadlwytho fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Mae\'r ffeil yn cynnwys y tocyn dilysu y byddwn yn ei nôl o **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Cadw fluxer-verification';

  @override
  String get connectionVerifyButton => 'Dilysu';

  @override
  String get connectionBack => 'Yn ôl';

  @override
  String get connectionEditTitle => 'Golygu Cysylltiad';

  @override
  String get connectionEditDescription =>
      'Dewiswch pwy all weld y cysylltiad hwn ar eich proffil.';

  @override
  String get connectionVisibilityEveryone => 'Pawb';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Caniatáu i unrhyw un weld y cysylltiad hwn ar eich proffil';

  @override
  String get connectionVisibilityFriends => 'Ffrindiau';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Caniatewch i\'ch ffrindiau weld y cysylltiad hwn';

  @override
  String get connectionVisibilityCommunityMembers => 'Aelodau\'r Gymuned';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Caniatewch i aelodau o\'r cymunedau lle\'r ydych chi weld y cysylltiad hwn';

  @override
  String get connectionRemoveTitle => 'Dileu Cysylltiad';

  @override
  String get connectionRemoveDescription =>
      'Ydych chi\'n siŵr eich bod am ddileu\'r cysylltiad hwn? Ni ellir dadwneud y weithred hon.';

  @override
  String get connectionRemoveConfirm => 'Dileu';

  @override
  String get connectionsLoadError => 'Methodd llwytho cysylltiadau';

  @override
  String get connectionsReorderError => 'Methodd diweddaru\'r drefn';

  @override
  String get connectionInitiateFailed =>
      'Methodd cychwyn dilysu. Rhowch gynnig arall arni.';

  @override
  String get connectionVerifyFailed =>
      'Methodd dilysu. Gwiriwch eich cofnod DNS a rhowch gynnig arall arni.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Methodd cychwyn awdurdodiad Bluesky.';

  @override
  String get connectionUpdateFailed => 'Methodd diweddaru\'r cysylltiad';

  @override
  String get connectionRemoveFailed => 'Methodd dileu\'r cysylltiad';

  @override
  String get connectionTokenSavedToast => 'Cadwyd fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Methodd cadw\'r ffeil';

  @override
  String get connectionEnterHandle => 'Rhowch handlen Bluesky.';

  @override
  String get connectionEnterDomain => 'Rhowch barth.';

  @override
  String get lookAndFeelTitle => 'Ymddangosiad';

  @override
  String get lookAndFeelThemeSectionTitle => 'Them';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Dewiswch rhwng ymddangosiad tywyll, glo, neu ysgafn.';

  @override
  String get lookAndFeelThemeDark => 'Them Dywyll';

  @override
  String get lookAndFeelThemeCoal => 'Them Glo';

  @override
  String get lookAndFeelThemeLight => 'Them Ysgafn';

  @override
  String get lookAndFeelThemeSystem => 'Them System';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Cysoni them ar draws dyfeisiau';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Pan fydd wedi\'i alluogi, bydd newidiadau thema yn cydamseru i\'ch holl ddyfeisiau. Pan fydd wedi\'i analluogi, bydd y ddyfais hon yn defnyddio ei gosodiad thema ei hun.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Mae thema\'r system yn analluogi cydamseru yn awtomatig i olrhain eich hoffter system ar y ddyfais hon.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Methodd cydamseru thema i\'ch cyfrif. Rhowch gynnig arall arni.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Graddio Ffont Sgwrs';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Addaswch faint y ffont yn ardal y sgwrs.';

  @override
  String get lookAndFeelInterfaceTitle => 'Rhyngwyneb';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Addaswch elfennau ac ymddygiadau\'r rhyngwyneb.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Dangosyddion teipio rhestr sianel';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Dewiswch sut mae dangosyddion teipio yn ymddangos yn y rhestr sianel pan fydd rhywun yn teipio mewn sianel.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Dangosydd Teipio + Avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Dangos dangosydd teipio gyda avatars defnyddwyr yn y rhestr sianel';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Dangosydd Teipio yn Unig';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Dangos y dangosydd teipio yn unig heb avatars';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Cuddiedig';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Peidiwch â dangos dangosyddion teipio yn y rhestr sianel';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Dangos teipio ar sianel a ddewiswyd';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Pan fydd wedi\'i analluogi (rhagosodiad), ni fydd dangosyddion teipio yn ymddangos ar y sianel rydych chi\'n ei gweld ar hyn o bryd.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'cyffredinol';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Awgrymiadau Bysellfwrdd';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Rheoli a fydd awgrymiadau llwybr byr bysellfwrdd yn ymddangos y tu mewn i awgrymiadau offer.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Cuddio awgrymiadau bysellfwrdd mewn awgrymiadau offer';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Pan fydd wedi\'i alluogi, mae bathodynnau llwybr byr yn cael eu cuddio mewn pop-ups awgrymiadau offer.';

  @override
  String get lookAndFeelNekoTitle => 'Amrywiol';

  @override
  String get lookAndFeelNekoDescription => 'Opsiynau rhyngwyneb amrywiol.';

  @override
  String get lookAndFeelShowNekoLabel => 'Dangos Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Pan fydd wedi\'i alluogi, bydd Neko yn ymddangos ger y bar mewnbwn sgwrs.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => 'Ymuno â sianelau llais';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Rheoli sut rydych chi\'n ymuno â sianelau llais mewn cymunedau.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Gofyn am glicio dwbl i ymuno â sianelau llais';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Pan fydd wedi\'i alluogi, bydd angen i chi glicio ddwywaith ar sianelau llais i\'w cyrchu. Pan fydd wedi\'i analluogi (rhagosodiad), bydd un glicio yn ymuno â\'r sianel ar unwaith.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Y llwynog brown cyflym sy\'n neidio dros y ci diog.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Bar ochr yr achlysur';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Ffurfweddu sut mae\'r bar ochr achlysur yn arddangos negeseuon uniongyrchol.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count cymunedau ar gael dros dro oherwydd camweithio capasiydd fflwcs.',
      one: '1 cymuned ar gael dros dro oherwydd camweithio capasiydd fflwcs.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Crymchu DMau I Foldr';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Pan fydd wedi\'i alluogi, mae DMau heb eu darllen yn y bar ochr achlysur yn cael eu crychu i mewn i ffolder ar y botwm Fluxer. Cliciwch y botwm Fluxer tra\'ch bod ar dudalen DMau i ehangu neu grychu\'r ffolder.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Rhestr Sianelau';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Rheoli ymddygiad dangosydd heb ei ddarllen ar gyfer sianelau mud mewn rhestrau sianel.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Dangos dangosydd heb ei ddarllen ar sianelau mud';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Pan fydd wedi\'i alluogi, mae sianelau mud yn dangos dangosydd heb ei ddarllen wedi pylu ar yr ochr chwith. Mae sonion yn dal i ymddangos ni waeth beth yw\'r gosodiad hwn.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Nawr yn Weithredol';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Rheoli sut mae \'Nawr yn Weithredol\' yn ymddangos ledled yr ap.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Dangos \'Nawr yn Weithredol\' ar y dudalen gartref';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Dangos \'Nawr yn Weithredol\' ar y dudalen gartref i arddangos ffrindiau sy\'n weithredol mewn llais. Gwelwch ragolwg, y cyd-destun sianel, pwy sydd eisoes yno, a ffordd gyflym i ymuno.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Hoffion';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Rheoli gwelededd hoffion ledled yr ap.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Galluogi Hoffion';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Pan fydd wedi\'i alluogi, gallwch chi hoffi sianelau a byddant yn ymddangos yn yr adran Hoffion. Pan fydd wedi\'i analluogi, bydd pob elfen UI sy\'n gysylltiedig â hoffion (botymau, eitemau dewislen) yn cael eu cuddio. Bydd eich hoffion presennol yn cael eu cadw.';

  @override
  String get favoritesTitle => 'Hoffion';

  @override
  String get favoritesEmptyTitle => 'Dim hoffion eto';

  @override
  String get favoritesEmptyDescription =>
      'Serenwch sianeliadau o bennawd y sgwrs i\'w cadw yma.';

  @override
  String get favoritesWelcomeTitle => 'Croeso i ffefrynnau';

  @override
  String get favoritesWelcomeDescription =>
      'Eich gofod personol ar gyfer mynediad cyflym i sianeliadau, DMau, a grwpiau yr ydych yn eu hoffi. Gwasgwch y seren ar unrhyw sianel i\'w hychwanegu yma.';

  @override
  String get favoritesWelcomeTip => 'Ddim i chi? Diffoddwch ef ar unrhyw adeg.';

  @override
  String get favoritesDisableButton => 'Analluogi ffefrynnau';

  @override
  String get favoritesAddedToast => 'Ychwanegwyd at ffefrynnau';

  @override
  String get favoritesRemovedToast => 'Dilewyd o ffefrynnau';

  @override
  String get favoritesHiddenToast => 'Cuddwyd ffefrynnau';

  @override
  String get favoritesMute => 'Mudewch ffefrynnau';

  @override
  String get favoritesUnmute => 'Tynnwch fuddug ffefrynnau';

  @override
  String get favoritesHeaderMenu => 'Dewislen ffefrynnau';

  @override
  String get favoritesCreateCategory => 'Creu categori';

  @override
  String get favoritesCategoryNameLabel => 'Enw\'r categori';

  @override
  String get favoritesHideMutedChannels => 'Cuddio sianeliadau mud';

  @override
  String get favoritesShowMutedChannels => 'Dangos sianeliadau mud';

  @override
  String get favoritesSetNickname => 'Gosod llysenw';

  @override
  String get favoritesNicknameLabel => 'Llysenw';

  @override
  String get favoritesSaveNickname => 'Cadw llysenw';

  @override
  String get favoritesMoveToCategory => 'Symud i gategori';

  @override
  String get favoritesUncategorized => 'Heb ei gategori';

  @override
  String get favoritesOtherCategory => 'Arall';

  @override
  String get favoritesRemoveFromFavorites => 'Dileu o ffefrynnau';

  @override
  String get favoritesAddToFavorites => 'Ychwanegu at ffefrynnau';

  @override
  String get favoritesHideConfirmTitle => 'Cuddio ffefrynnau';

  @override
  String get favoritesHideConfirmDescription =>
      'Bydd hyn yn cuddio holl elfennau UI sy\'n gysylltiedig â ffefrynnau gan gynnwys botymau a mân-fanylion dewislen. Bydd eich ffefrynnau presennol yn cael eu cadw a gellir eu hail-alluogi ar unrhyw adeg o Gosodiadau > Uwch > Ymddangosiad.';

  @override
  String get favoritesDirectMessageSubtitle => 'Neges uniongyrchol';

  @override
  String get messagesMediaDisplayGroupTitle => 'Dangos';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Rheoli sut mae negeseuon, cyfryngau, a chynnwys arall yn cael eu harddangos.';

  @override
  String get messagesMediaMediaGroupTitle => 'Cyfryngau';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Addasu dewisiadau maint cyfryngau a botymau.';

  @override
  String get messagesMediaInputGroupTitle => 'Mewnbwn';

  @override
  String get messagesMediaInputGroupDescription =>
      'Addasu gosodiadau mewnbwn negeseuon.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Bar ochr';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Ffurfweddu sut mae bar ochr y gymuned yn cael ei arddangos.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Cuddio sianeliadau mud yn ddiofyn';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Cuddio sianeliadau mud yn awtomatig yn y bar ochr pan fyddwch chi\'n ymuno â chymunedau newydd';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Cuddio sianeliadau mud yn ddiofyn?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Bydd cymunedau newydd yr ydych yn ymuno â nhw yn cuddio sianeliadau mud yn awtomatig. A fyddech chi hefyd yn hoffi cymhwyso\'r gosodiad hwn i\'ch holl gymunedau presennol?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Peidio â chuddio sianeliadau mud yn ddiofyn?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Ni fydd cymunedau newydd yr ydych yn ymuno â nhw yn cuddio sianeliadau mud yn awtomatig mwyach. A fyddech chi hefyd yn hoffi dangos sianeliadau mud ym mhob un o\'ch cymunedau presennol?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Cymhwyso i bob cymuned';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Dangos ym mhob cymuned';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Cymunedau newydd yn unig';

  @override
  String get messagesMediaDisplaySectionTitle => 'Dangos cyfryngau';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Rheoli sut mae delweddau, fideos a chyfryngau eraill yn cael eu harddangos. Mae pob cyfrwng yn cael ei ail-feintio a\'i drosi. Ni fydd ffeiliau hynod fawr na ellir eu cywasgu i ragolwg yn cael eu hymgorffori ni waeth beth yw\'r gosodiadau hyn.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Pan fyddant wedi\'u postio fel dolenni i sgwrs';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Pan fyddant wedi\'u huwchlwytho\'n uniongyrchol i Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Rhagolygon dolen';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Rheoli sut mae dolenni gwefan yn cael eu rhagolwg mewn sgwrs';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Dangos rhagolygon a rhagolwg dolenni gwefan';

  @override
  String get messagesMediaReactionsSectionTitle => 'Adweithiau';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Gwneud gosodiadau adweithiau emoji ar negeseuon';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Dangos adweithiau emoji ar negeseuon';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Cynnwys Spoiler';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Rheoli sut mae cynnwys spoiler yn cael ei arddangos';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Dangos cynnwys spoiler';

  @override
  String get messagesMediaSpoilersOnClickName => 'Ar glicio';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Dangos cynnwys spoiler pan gaiff ei glicio';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Mewn sianeli rwy\'n eu gweinyddu';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Dangos cynnwys spoiler bob amser mewn sianeli lle mae gennych y caniatâd \"Gweinyddu Negeseuon\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Bob amser';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Dangos cynnwys spoiler bob amser';

  @override
  String get messagesMediaSizeSectionTitle => 'Dewisiadau Maint Cyfryngau';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Gwneud addasu\'r maint arddangos uchaf ar gyfer cyfryngau wedi\'u hymgorffori ac wedi\'u hatodi. Mae meintiau llai yn defnyddio llai o le sgrin, tra bod meintiau mwy yn dangos mwy o fanylion.';

  @override
  String get messagesMediaSizeEmbedLabel =>
      'Cyfryngau o ddolenni (ymgorfforiadau)';

  @override
  String get messagesMediaSizeAttachmentLabel =>
      'Atodiadau wedi\'u huwchlwytho';

  @override
  String get messagesMediaSizeCompactName => 'Cryno (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Maint cyfryngau llai';

  @override
  String get messagesMediaSizeComfortableName => 'Cyfforddus (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Maint cyfryngau mwy gyda mwy o fanylion';

  @override
  String get messagesMediaGifsSectionTitle => 'Ymddygiad GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Rheoli sut mae GIFs yn cael eu mewnosod i sgwrs';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Anfon GIFs yn awtomatig pan gaiff eu dewis';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Awtogwblhau mynegiant (awtogwblhau colon)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Rheoli beth sy\'n ymddangos yn awtogyflawni mynegiant pan fyddwch chi\'n teipio colon. Gwneud addasu pa awgrymiadau sy\'n cael eu harddangos i gyd-fynd â\'ch dewisiadau.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Dangos emojis diofyn mewn awtogyflawni mynegiant';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Dangos emojis personol mewn awtogyflawni mynegiant';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Dangos sticeri mewn awtogyflawni mynegiant';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Dangos cyfryngau wedi\'u cadw mewn awtogyflawni mynegiant';

  @override
  String get messagesMediaEditingSectionTitle => 'Golygu Negeseuon';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Rheoli beth sy\'n digwydd i\'ch drafft golygu pan fyddwch chi\'n canslo.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Cadw drafft golygu wrth ganslo';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Dangosyddion heb eu darllen';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Rheoli sut mae dangosyddion negeseuon heb eu darllen yn cael eu harddangos.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Dangos dangosydd heb ei ddarllen wedi pylu ar sianeli mud';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Dangos dangosydd heb ei ddarllen wedi\'i ddimio nesaf at negeseuon uniongyrchol a sianeli mud fel y gallwch chi weld ar yr olwg gyntaf pan fydd gweithgaredd.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Rhagolygon negeseuon DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Rheoli pryd mae rhagolygon negeseuon yn cael eu harddangos yn y rhestr DM.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Modd rhagolwg negeseuon DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Pawb';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Dangos rhagolygon negeseuon ar gyfer pob sgwrs DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'DM heb eu darllen yn unig';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Dangos rhagolygon negeseuon yn unig ar gyfer DMs gyda negeseuon heb eu darllen';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Dim';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Peidiwch â dangos rhagolygon negeseuon yn y rhestr DM';

  @override
  String get dmListSentAnAttachment => 'Anfonwyd atodiad';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username wedi pinio neges i\'r sianel hon.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username wedi ychwanegu $userName i\'r grŵp.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username wedi ychwanegu rhywun i\'r grŵp.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username wedi gadael y grŵp.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username aeth â $userName o\'r grŵp.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username aeth â rhywun o\'r grŵp.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username newidiodd enw\'r sianel i $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username newidiodd enw\'r sianel.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username newidiodd eicon y sianel.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username ddechreuodd alwad.';
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
  String get voiceConnectionConfirmTitle => 'Cadarnhad Cysylltiad Llais';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Rydych eisoes wedi\'ch cysylltu â\'r sianel llais hon o $count dyfais arall. Beth hoffech chi ei wneud?',
      one:
          'Rydych eisoes wedi\'ch cysylltu â\'r sianel llais hon o 1 ddyfais arall. Beth hoffech chi ei wneud?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Newid i\'r Ddyfais Hon';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Ymunwch (Cadw Cysylltiadau Eraill)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Peidio gwneud dim, nid wyf am ymuno';

  @override
  String get voiceChannelEmptyDescription =>
      'Dyma sianel lais. Cysylltwch i ddechrau siarad!';

  @override
  String get voiceChannelJoin => 'Ymunwch â\'r Sianel Llais';

  @override
  String get voiceChannelJoinConnect => 'Cysylltu â Llais';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nid oes gennych ganiatâd i ymuno â\'r sianel lais hon';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mae cynnwys meicroffon, camera, a rhannu sgrin wedi\'i amgryptio o\'r dechrau i\'r diwedd.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mae cynnwys meicroffon, camera, a rhannu sgrin wedi\'i amgryptio o\'r dechrau i\'r diwedd.';

  @override
  String get voiceChannelE2eeBroken =>
      'Nid yw amgryptio o\'r dechrau i\'r diwedd ar gael oherwydd bod cyfranogwr anghydnaws yn y sianel lais hon.';

  @override
  String get voiceCallE2eeBroken =>
      'Nid yw amgryptio o\'r dechrau i\'r diwedd ar gael oherwydd bod cyfranogwr anghydnaws yn yr alwad hon.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Rhaid diweddaru\'r cleient hwn cyn ymuno â\'r alwad amgryptiedig hon.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Methodd eich meicroffon â dechrau. Rydych chi\'n dal i fod yn yr alwad.';

  @override
  String get voiceChannelStatusConnecting => 'Yn cysylltu…';

  @override
  String get voiceChannelStatusConnected => 'Wedi\'i gysylltu';

  @override
  String get voiceChannelStatusError => 'Gwall';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Dyfais symudol';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Dyfais bwrdd gwaith';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Tawelwyd gan y gymuned';

  @override
  String get voiceParticipantTooltipMuted => 'Tawelwyd';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Byddwyd gan y gymuned';

  @override
  String get voiceParticipantTooltipDeafened => 'Byddwyd';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Cysylltiad: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cyfranogwr',
      one: '1 cyfranogwr',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Ymadael';

  @override
  String get voiceControlMute => 'Tawelu';

  @override
  String get voiceControlUnmute => 'Dirymu tawelwch';

  @override
  String get voiceControlDeafen => 'Byddwyo';

  @override
  String get voiceControlUndeafen => 'Dirymu byddwyo';

  @override
  String get voiceControlVideo => 'Fideo';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Rhannu sgrin';

  @override
  String get voiceScreenShareNotificationText => 'Yn rhannu eich sgrin.';

  @override
  String get voiceControlMore => 'Mwy';

  @override
  String get voiceControlDisconnect => 'Datgysylltu';

  @override
  String get voiceControlChat => 'Sgwrs';

  @override
  String get voiceTextChatShow => 'Dangos sgwrs';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# neges heb ei darllen',
      one: '# neges heb ei darllen',
    );
    return 'Dangos sgwrs gyda $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Mae angen caniatâd camera ar gyfer fideo.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Methodd cychwyn rhannu sgrin. Rhowch gynnig arall arni.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Gwrthodwyd caniatâd rhannu sgrin.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Nid yw rhannu sgrin ar gael ar y ddyfais hon.';

  @override
  String get voiceWatchStream => 'Gwylio\'r ffryd';

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
  String get privacyDashboardCommunicationSection => 'Cyfathrebu';

  @override
  String get chatMessageDeleteFailed => 'Methu Dileu Neges';

  @override
  String get chatMessageAddReaction => 'Ychwanegu Adwaith';

  @override
  String get chatMessageEdit => 'Golygu Neges';

  @override
  String get chatMessageReply => 'Ateb';

  @override
  String get chatMessageForward => 'Anfon Ymlaen';

  @override
  String get forwardMessageTitle => 'Anfon neges ymlaen';

  @override
  String get forwardSearchHint =>
      'Chwilio sianeliadau neu negeseuon uniongyrchol';

  @override
  String get forwardDirectMessagesSection => 'Negeseuon Uniongyrchol';

  @override
  String get forwardCommentHint => 'Ychwanegu sylw (dewisol)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Anfon ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Dim sianeliadau wedi\'u canfod';

  @override
  String get forwardSuccessToast => 'Neges wedi\'i hanfon ymlaen';

  @override
  String get forwardFailed => 'Methwyd anfon y neges ymlaen';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Nid yw sylwadau ar gael oherwydd bod slowmode wedi\'i alluogi mewn sianel ddethol.';

  @override
  String get forwardDestinationNoSendPermission =>
      'Allwch chi ddim anfon negeseuon yma';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Allwch chi ddim mewngyrchu dolenni yma';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Allwch chi ddim atodi ffeiliau yma';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Mae anfon negeseuon wedi\'i analluogi yn y gymuned hon';

  @override
  String get forwardDestinationTimedOut =>
      'Rydych chi ar amser allan yn y gymuned hon';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Slowmode - arhoswch $remaining';
  }

  @override
  String get chatMessageCopyText => 'Copïo Neges';

  @override
  String get chatMessagePin => 'Pinio neges';

  @override
  String get chatMessageUnpin => 'Dadbopio neges';

  @override
  String get chatMessageUnpinIt => 'Dadbopio hi';

  @override
  String get chatMessageBookmark => 'Cadw Neges';

  @override
  String get chatMessageRemoveBookmark => 'Dileu Cadw';

  @override
  String get chatMessageMarkAsUnread => 'Marciwch fel Heb Ddarllen';

  @override
  String get chatMessageCopyMessageLink => 'Copïo Dolenni Neges';

  @override
  String get chatMessageCopyMessageId => 'Copïo ID Neges';

  @override
  String get chatMessageViewReactions => 'Gweld adweithiau';

  @override
  String get chatMessageRemoveAllReactions => 'Dileu pob adwaith';

  @override
  String get chatMessageDebug => 'Debugio Neges';

  @override
  String get chatMessageDebugSheetTitle => 'Debugio neges';

  @override
  String get chatMessageDebugCopyJson => 'Copïo JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON neges wedi\'i gopïo i\'r clipfwrdd';

  @override
  String get chatReactionsSheetTitle => 'Adweithiau';

  @override
  String get chatReactionsSheetEmpty => 'Nid oes neb wedi ymateb gyda hyn eto.';

  @override
  String get chatMessageReport => 'Adrodd ar Neges';

  @override
  String get iarReportMessageTitle => 'Adrodd ar neges';

  @override
  String get iarThisUserFallback => 'y defnyddiwr hwn';

  @override
  String get iarModalDescription =>
      'Adrodd ar dorri rheol, neu dod o hyd i offer i reoli cyswllt a dewisiadau.';

  @override
  String get iarPathStepAriaLabel => 'Beth sydd ei angen arnoch?';

  @override
  String get iarCategoryStepTitle => 'Sert math o reol gafodd ei dorri?';

  @override
  String get iarReasonStepTitle => 'Sert ba reol gafodd ei dorri?';

  @override
  String get iarReasonSelectHint => 'Dewiswch reswm';

  @override
  String get iarPickAnOptionToast => 'Dewiswch opsiwn i barhau.';

  @override
  String get iarPickARuleToast => 'Dewiswch y rheol gafodd ei dorri.';

  @override
  String get iarPathPlatform => 'Adrodd ar dorri rheol y platfform';

  @override
  String get iarPathCommunity => 'Adrodd i reolwyr yr uned hon';

  @override
  String get iarPathPreferenceMessage => 'Dw i\'n hoffi\'r cynnwys yma';

  @override
  String get iarCategoryTargetedHarmLabel =>
      'Bygythiadau, aflonyddu, neu niwed';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bwlio, bygythiadau, casineb, trais, cyrchoedd, neu gynnwys sy\'n annog hunan-niwed.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Diogelwch plant neu gynnwys i oedolion';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Plant mewn perygl, cynnwys i oedolion yn y lle anghywir, neu ymddygiad diangen.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Preifatrwydd neu ffug-bersonoli';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxio, stelcio, esgusodi fel rhywun arall, neu broffil amhriodol.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Twyllod, maleiswedd, neu gamwybodaeth';

  @override
  String get iarCategoryDeceptionDescription =>
      'Seiber-swyddogaeth, twyll, dolenni maleisus, neu honiadau ffug sy\'n debygol o achosi niwed yn y byd go iawn.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Gweithgarwch anghyfreithlon neu rywbeth arall';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Gwerthiannau anghyfreithlon, hwylusydd troseddau, neu dorri rheol amlwg nad yw\'n cyd-fynd â\'r uchod.';

  @override
  String get iarReasonHarassmentLabel => 'Aflonyddu neu fygythiadau';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bwlio, cyswllt diangen dro ar ôl tro, stelcio, neu gam-drin wedi\'i dargedu.';

  @override
  String get iarReasonHateLabel => 'Araith gasineb';

  @override
  String get iarReasonHateMessageDescription =>
      'Geiriau sarhaus, iaith ddynol-yn-gwrthod, neu ymosodiadau ar grwpiau gwarchodedig.';

  @override
  String get iarReasonViolenceLabel => 'Trais neu fygythiadau trais';

  @override
  String get iarReasonViolenceDescription =>
      'Bygythiadau credadwy, trais graffig, neu ogoneddu trais.';

  @override
  String get iarReasonMatureContentLabel => 'Cynnwys i oedolion neu aflonyddu';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Ymddygiad diangen neu gynnwys i oedolion yn y lle anghywir.';

  @override
  String get iarReasonChildSafetyLabel => 'Diogelwch plant neu faleisio plant';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Cynnwys trin plant neu faleisio plant.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Camwybodaeth niweidiol';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Honiadau ffug sy\'n debygol o achosi niwed yn y byd go iawn.';

  @override
  String get iarReasonSpamLabel => 'Sbam, twyllod, neu seiber-swyddogaeth';

  @override
  String get iarReasonSpamMessageDescription =>
      'Sbam torfol, twyll, gwobrau ffug, neu gam-drin cyfrif.';

  @override
  String get iarReasonMalwareLabel => 'Maleiswedd neu ddolenni peryglus';

  @override
  String get iarReasonMalwareDescription =>
      'Maleiswedd, dwyn manylion mewngofnodi, neu ffeiliau niweidiol.';

  @override
  String get iarReasonPrivacyLabel => 'Torri preifatrwydd';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxio, gwybodaeth breifat wedi\'i datgelu, neu stelcio.';

  @override
  String get iarReasonImpersonationLabel =>
      'Ffug-bersonoli neu gyfryngau twyllodrus';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Esgusodi fel rhywun arall, gan gynnwys cynnwys wedi\'i greu gan AI yn dwyllo.';

  @override
  String get iarReasonIllegalLabel => 'Gweithgarwch anghyfreithlon';

  @override
  String get iarReasonIllegalDescription =>
      'Gwerthiannau anghyfreithlon, hwylusydd troseddau, neu weithgarwch anghyfreithlon.';

  @override
  String get iarReasonSelfHarmLabel => 'Hunan-niwed neu hunanladdiad';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Hyrwyddo neu gyfarwyddiadau\'n annog hunan-niwed neu anhwylderau bwyta.';

  @override
  String get iarReasonOtherLabel => 'Torri rheol amlwg arall';

  @override
  String get iarReasonOtherDescription =>
      'Defnyddiwch yn unig os yw\'n torri rheolau Fluxer yn amlwg ac nid yw\'n cyd-fynd â\'r uchod.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Os oes plentyn yn gysylltiedig, defnyddiwch \"$childSafetyReason\" yn lle hynny.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Os yw hyn yn cynnwys CSAM neu faleisio plentyn, anfonwch ef nawr ac peidiwch ag ail-rannu\'r deunydd.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Os yw rhywun mewn perygl ar unwaith, cysylltwch â gwasanaethau brys lleol os gallwch wneud hynny\'n ddiogel.';

  @override
  String get iarSafetyNoteViolence =>
      'Os yw hwn yn fygythiad ar unwaith y gellir ei gredu, cysylltwch â gwasanaethau brys lleol hefyd.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Os yw hwn yn fygythiad terfysgol ar unwaith, cysylltwch â gwasanaethau brys lleol hefyd.';

  @override
  String get iarActionBlockUserTitle => 'Rhwystro\'r defnyddiwr hwn';

  @override
  String get iarActionBlockUserDescription =>
      'Stopio negeseuon a cheisiadau ffrind.';

  @override
  String get iarActionBlockUserButton => 'Rhwystro';

  @override
  String get iarActionCopyMessageLinkTitle => 'Copïo dolen neges';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Rhannu gyda moddion cymunedol.';

  @override
  String get iarActionCopyMessageLinkButton => 'Copïo';

  @override
  String get iarActionCloseDmTitle => 'Cau\'r DM hwn';

  @override
  String get iarActionCloseDmDescription =>
      'Nid yw\'n rhwystro. Gallwch agor eto\'n hwyrach.';

  @override
  String get iarActionCloseDmButton => 'Cau DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Ylä lähteä yhteisöstä';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Lopeta sen sisällön ja jäsenten näkeminen.';

  @override
  String get iarActionLeaveCommunityButton => 'Ylä lähteä';

  @override
  String get iarActionDmSettingsTitle => 'DM- ja kaveripyyntöasetukset';

  @override
  String get iarActionDmSettingsDescription =>
      'Muuta, kuka voi ottaa sinuun yhteyttä.';

  @override
  String get iarActionCallSettingsTitle =>
      'Puhelu- ja ryhmäkeskusteluasetukset';

  @override
  String get iarActionCallSettingsDescription =>
      'Newidiwch pwy all eich galw neu ychwanegu atoch.';

  @override
  String get iarActionOpenButton => 'Agor';

  @override
  String get iarActionDeleteMessageTitle => 'Dileu\'r neges hon';

  @override
  String get iarActionDeleteMessageDescription =>
      'Tynnwch hi o\'r sianel i bawb.';

  @override
  String get iarActionDeleteMessageButton => 'Dileu';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Dilewyd';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Mae\'r neges hon eisoes wedi\'i dileu.';

  @override
  String get iarActionBanUserTitle => 'Gwahardd y defnyddiwr hwn';

  @override
  String get iarActionBanUserDescription =>
      'Agorwch y deialog gwahardd ar gyfer y gymuned hon.';

  @override
  String get iarActionBanUserButton => 'Gwahardd';

  @override
  String get iarActionBanUserBannedButton => 'Wedi\'i wahardd';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Mae\'r defnyddiwr hwn eisoes wedi\'i wahardd o\'r gymuned.';

  @override
  String get iarCloseDmConfirmTitle => 'Cau DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Cau eich DM presennol gyda $name. Nid yw hyn yn eich rhwystro; gallwch ailagor yn ddiweddarach.';
  }

  @override
  String get iarSuccessTitle => 'Anfonwyd yr adroddiad';

  @override
  String get iarSuccessBody =>
      'Mae ein tîm diogelwch yn ei adolygu. Byddwn yn anfon DM ac e-bost atoch pan fyddwn wedi cyrraedd dyfarniad.';

  @override
  String get iarAlreadyReportedTitle => 'Wedi\'i adrodd eisoes';

  @override
  String get iarAlreadyReportedBody =>
      'Rydych eisoes wedi adrodd ar y neges hon. Mae ein tîm diogelwch yn ei hadolygu.';

  @override
  String get iarBackButton => 'Yn ôl';

  @override
  String get iarContinueButton => 'Ymlaen';

  @override
  String get iarSendReportButton => 'Anfon adroddiad';

  @override
  String get iarDoneButton => 'Wedi';

  @override
  String get iarCouldntSendToast =>
      'Methodd yr anfon yr adroddiad. Rhowch gynnig arall arni.';

  @override
  String get iarRateLimitedToast =>
      'Rydych chi\'n adrodd yn rhy gyflym. Arhoswch ychydig a rhowch gynnig arall arni.';

  @override
  String get iarReportSentToast =>
      'Anfonwyd yr adroddiad. Bydd ein tîm diogelwch yn ei adolygu.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Blocio $name? Ni fyddant yn gallu anfon neges atoch na\'ch gwahodd i fod yn ffrindiau. Gallwch eu dadflocio yn ddiweddarach.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Methodd rhwystro\'r defnyddiwr hwn. Rhowch gynnig arall arni.';

  @override
  String get iarCloseDmSuccessToast => 'Caewyd y DM.';

  @override
  String get iarCloseDmFailedToast =>
      'Methodd cau\'r DM hwn. Rhowch gynnig arall arni.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Methodd gadael y gymuned hon. Rhowch gynnig arall arni.';

  @override
  String get chatMessageSuppressEmbeds => 'Cuddio Embeds';

  @override
  String get chatMessageUnsuppressEmbeds => 'Dangos Embeds';

  @override
  String get chatMessageDelete => 'Dileu Neges';

  @override
  String get chatMessageDeleteConfirmTitle => 'Dileu Neges';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Ydych chi\'n siŵr eich bod am ddileu\'r neges hon?';

  @override
  String get chatMessageMore => 'Mwy';

  @override
  String get chatEditingMessage => 'Yn golygu neges';

  @override
  String get chatReplyOriginalDeleted => 'Dileuwyd y neges wreiddiol';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Methodd llwytho\'r neges wreiddiol';

  @override
  String get chatReplyAttachedMedia =>
      'Mae\'r neges yn cynnwys cyfryngau wedi\'u hatodi';

  @override
  String get chatMessagesLoadError => 'Methodd llwytho negeseuon.';

  @override
  String get chatReplyMentionOverrideTitle => 'A ddylid newid y dewisleniad?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'Mae $authorNickname yn hoffi cael ei grybwyll drwy @ wrth ateb. Anfon heb y grybwylliad beth bynnag?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname yn well ganddo/ganddi ymatebion heb @wneud sylw. Anfon gyda\'r sylw beth bynnag?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Anwybyddu dewis';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Cliciwch i analluogi pingio\'r person rydych chi\'n ymateb iddo.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Cliciwch i alluogi pingio\'r person rydych chi\'n ymateb iddo.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Sôn am y person ymateb';

  @override
  String get chatReplyMentionOn => 'Ymlaen';

  @override
  String get chatReplyMentionOff => 'I ffwrdd';

  @override
  String get chatReplyCancel => 'Canslo ymateb';

  @override
  String get chatEditMessageHint => 'Golygu neges';

  @override
  String get chatEditNoChanges => 'Dim newidiadau i\'w cadw';

  @override
  String get chatChannelNotReady =>
      'Nid yw\'r sianel hon yn barod eto. Rhowch gynnig arall arni mewn moment. ';

  @override
  String get chatMessageEdited => '(wedi\'i olygu)';

  @override
  String get chatMessageSilent => 'Roedd hon yn neges @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Heddiw am $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Ddoe am $time';
  }

  @override
  String get mediaViewerImagePreview => 'Rhagolwg llun';

  @override
  String get mediaViewerClose => 'Cau gwyliwr y cyfryngau';

  @override
  String get mediaViewerOpenInBrowser => 'Agor yn y porwr';

  @override
  String get mediaViewerForward => 'Anfon ymlaen';

  @override
  String get mediaViewerZoomIn => 'Chwyddo i mewn';

  @override
  String get mediaViewerZoomOut => 'Chwyddo allan';

  @override
  String get mediaViewerPreviousAttachment => 'Ymlyniad blaenorol';

  @override
  String get mediaViewerNextAttachment => 'Ymlyniad nesaf';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls => 'Newid rheolyddion fideo';

  @override
  String get chatAttachmentVideoMute => 'Mud fideo';

  @override
  String get chatAttachmentVideoUnmute => 'Dad-fudo fideo';

  @override
  String get chatAttachmentVideoPlay => 'Chwarae fideo';

  @override
  String get chatAttachmentVideoPause => 'Sa draw fideo';

  @override
  String get chatAttachmentVideoProgress => 'Cynnydd fideo';

  @override
  String get chatVideoPlaybackFailed => 'Methodd chwarae\'r fideo hwn.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Hysbysu defnyddwyr gyda\'r rôl hon sydd â chaniatâd i weld y sianel hon.';

  @override
  String get addGuildModalTitle => 'Ychwanegu cymuned';

  @override
  String get addGuildModalLandingDescription =>
      'Creu cymuned newydd neu ymuno ag un sy\'n bod eisoes.';

  @override
  String get addGuildCreateCommunity => 'Creu cymuned';

  @override
  String get addGuildJoinCommunity => 'Ymuno â chymuned';

  @override
  String get addGuildImportDiscordTemplate => 'Mewnforio templed Discord';

  @override
  String get addGuildJoinTitle => 'Ymuno â chymuned';

  @override
  String get addGuildJoinDescription =>
      'Rhowch y ddolen wahoddiad i ymuno â chymuned.';

  @override
  String get addGuildInviteLinkLabel => 'Dolen wahoddiad';

  @override
  String get addGuildJoinSubmit => 'Ymuno â chymuned';

  @override
  String get addGuildInviteInvalid =>
      'Mae\'r gwahoddiad hwn yn annilys neu wedi dod i ben.';

  @override
  String get addGuildJoinFailed =>
      'Methodd ymuno â\'r gymuned. Rhowch gynnig arall arni.';

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
  String get addGuildPackInstalled => 'Pecyn wedi\'i osod yn llwyddiannus.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'Dileu Pob Adwaith';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Ydych chi\'n siŵr eich bod chi am ddileu\'r holl adweithiau o\'r neges hon?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Tynnu pin o neges';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Anfon yr hoelen hon yn ôl mewn amser?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username a osododd $messageLink i\'r sianel hon. Gweler $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'neges';

  @override
  String get systemPinMessageAllPinsLink => 'pob neges sydd wedi\'i hoelio';

  @override
  String get channelPinsEmptyTitle => 'Dim negeseuon wedi\'u pinio';

  @override
  String get channelPinsEmptyDescription =>
      'Bydd negeseuon wedi\'u pinio yn ymddangos yma.';

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
  String get channelDetailsAddFriendsToGroup => 'Add Friends to Group';

  @override
  String get channelDetailsGroupInvites => 'Group Invites';

  @override
  String get channelDetailsEditChannel => 'Edit Channel';

  @override
  String get channelDetailsDeleteChannel => 'Delete Channel';

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
  String get personalNotesTitle => 'Nodiadau personol';

  @override
  String get personalNotesSubtitle =>
      'Eich gofod preifat ar gyfer meddyliau a remynion';

  @override
  String groupDmWelcome(String displayName) {
    return 'Welcome to $displayName. Add friends to get the group going.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Edit group';

  @override
  String get groupDmWelcomeAddFriends => 'Add friends to group';

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Croeso i $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'I\'r dechreuad, nid oedd dim. Yna, daeth $channelName. Ac yr oedd yn dda.';
  }

  @override
  String get personalNotesComposerHint => 'Negeswch eich hun';

  @override
  String get personalNotesPrivateSpace => 'Eich gofod preifat';

  @override
  String get purgePersonalNotes => 'Dileu nodiadau personol';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Bydd hyn yn dileu pob neges ac atodiad yn eich nodiadau personol yn barhaol. Ni ellir dadwneud hyn.';

  @override
  String get purgePersonalNotesConfirmButton => 'Dileu';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Dilewyd $count neges o nodiadau personol';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Roedd nodiadau personol eisoes yn wag';

  @override
  String get purgePersonalNotesFailed => 'Ni allwyd clirio nodiadau personol';

  @override
  String get userSettingsGroupYourAccount => 'EICH CYFRIF';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Proffil';

  @override
  String get userSettingsNavSecurityLogin => 'Diogelwch a Mewngofnodi';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Rhoddion a Chodau';

  @override
  String get userSettingsNavExpressionPacks => 'Pecynnau Mynegiant';

  @override
  String get userSettingsNavPrivacyDashboard => 'Panel Preifatrwydd';

  @override
  String get userSettingsNavAuthorizedApps => 'Apiau Awdurdodedig';

  @override
  String get userSettingsNavBlockedUsers => 'Defnyddwyr wedi\'u Blocio';

  @override
  String get userSettingsNavLinkedDevices => 'Dyfeisiau Cysylltiedig';

  @override
  String get userSettingsNavConnections => 'Cysylltiadau';

  @override
  String get userSettingsNavLookAndFeel => 'Ymddangosiad';

  @override
  String get userSettingsNavAccessibility => 'Hygyrchedd';

  @override
  String get userSettingsNavMessagesAndMedia => 'Negeseuon a Chyfryngau';

  @override
  String get userSettingsNavAudioAndVideo => 'Sain a Fideo';

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
  String get userSettingsNavSoundsAndAlerts => 'Swn a Rhybuddion';

  @override
  String get userSettingsNavLanguageAndTime => 'Iaith ac Amser';

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
  String get userSettingsNavAdvanced => 'Uwch';

  @override
  String get advancedPerformanceReportingTitle => 'Adroddiadau perfformiad';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Helpwch i wella Fluxer trwy rannu data damweiniau a pherfformiad dienw.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Anfon adroddiadau damweiniau a pherfformiad';

  @override
  String get advancedPerformanceReportingDescription =>
      'Mae\'r holl ddata a adroddir yn ddienw ac fe\'i hanfonir yn unig at wasanaeth monitro Fluxer ei hun - ni ddefnyddir darparwyr trydydd parti.';

  @override
  String get userSettingsNavApplications => 'Cymhwysiadau';

  @override
  String get userSettingsNavAppLogs => 'Cofnodion Ap';

  @override
  String get userSettingsNavDeveloperTools => 'Offerynnau Datblygwr';

  @override
  String get userSettingsNavLimitsConfig => 'Ffurfweddu Terfynau';

  @override
  String get userSettingsNavFeatureFlags => 'Baneri Nodwedd';

  @override
  String get userSettingsNavWhatsNew => 'Beth sy\'n Newydd';

  @override
  String get userSettingsNavLogOut => 'Allgofnodi';

  @override
  String get betaWarningTitle => 'Meddalwedd beta';

  @override
  String get betaWarningMessage =>
      'Mae hwn yn feddalwedd beta. Nid yw popeth wedi\'i orffen neu ei ychwanegu eto.';

  @override
  String get betaWarningReportIssues =>
      'Rhowch wybod am unrhyw broblemau a geir i gymuned Fluxer Mobile (mae\'n rhaid i chi fod â Plutonium i allu ymuno â\'r gymuned ar hyn o bryd).';

  @override
  String get betaWarningRepoLink => 'Gweld ffynhonnell ar GitHub';

  @override
  String get betaWarningGotIt => 'Wedi\'i ddeall';

  @override
  String get quickSwitcherTabSearch => 'Chwilio';

  @override
  String get quickSwitcherTabFriends => 'Ffrindiau';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Chwilio am sianelau, pobl, neu gymunedau';

  @override
  String get quickSwitcherSearchFriends => 'Chwilio am ffrindiau';

  @override
  String get quickSwitcherNoMatchesFound => 'Dim canlyniadau';

  @override
  String get quickSwitcherEmptyHint =>
      'Rhowch gynnig ar enw gwahanol neu defnyddiwch ragddôt @ / # / ! / * i hidlo canlyniadau.';

  @override
  String get quickSwitcherSectionPeople => 'Pobl';

  @override
  String get quickSwitcherSectionGroupMessages => 'Negeseuon grŵp';

  @override
  String get quickSwitcherSectionTextChannels => 'Sianelau testun';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Sianelau llais';

  @override
  String get quickSwitcherSectionCommunities => 'Cymunedau';

  @override
  String get quickSwitcherSectionSettings => 'Gosodiadau';

  @override
  String get quickSwitcherHomeLabel => 'Hafan';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Negeseuon uniongyrchol';

  @override
  String get quickSwitcherFavoritesLabel => 'Hoffion';

  @override
  String get quickSwitcherUserSettingsLabel => 'Gosodiadau defnyddiwr';

  @override
  String get quickSwitcherNotificationsLabel => 'Hysbysiadau';

  @override
  String get quickSwitcherBookmarksLabel => 'Boch-nodau';

  @override
  String get quickSwitcherMentionsLabel => 'Soniadau';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Dim ffrindiau eto';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Ychwanegwch ffrind i ddechrau.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Dim ffrindiau\'n cyd-fynd â\'r chwiliad hwnnw';

  @override
  String get quickSwitcherFriendsNoMatchHint =>
      'Rhowch gynnig ar enw gwahanol.';

  @override
  String get quickSwitcherSearchAliasUser => 'Defnyddiwr';

  @override
  String get quickSwitcherSearchAliasYou => 'Ti';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Neg. uniongyrchol';

  @override
  String get quickSwitcherSearchAliasMessages => 'Negeseuon';

  @override
  String get quickSwitcherSearchAliasFav => 'Hoff';

  @override
  String get quickSwitcherSearchAliasStarred => 'Seren';

  @override
  String get quickSwitcherSearchAliasInbox => 'Bocs mewnol';

  @override
  String get quickSwitcherSearchAliasSaved => 'Wedi\'i gadw';

  @override
  String get uiClose => 'Cau';

  @override
  String get chatJumpToBottom => 'Neidio i\'r gwaelod';

  @override
  String get uiConfirm => 'Cadarnhau';

  @override
  String get uiLoading => 'Yn llwytho';

  @override
  String get uiUnsavedChanges => 'Newidiadau heb eu cadw';

  @override
  String get uiReset => 'Ailosod';

  @override
  String get uiOpenColorPicker => 'Agor dewiswr lliw';

  @override
  String get uiSelectPlaceholder => 'Dewis';

  @override
  String get uiSearchPlaceholder => 'Chwilio';

  @override
  String get uiNoOptionsFound => 'Dim opsiynau ar gael';

  @override
  String get uiDismissNotification => 'Gwaredu hysbysiad';

  @override
  String get uiColorPickerTitle => 'Dewiswr lliw';

  @override
  String get mentionConfirmTitle => 'Soni am bawb?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Bydd hyn yn hysbysu $count aelod. Parhau?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Bydd hyn yn hysbysu $count aelod ar-lein. Parhau?';
  }

  @override
  String get mentionConfirmButton => 'Soni';

  @override
  String get composerEmojiUnavailable =>
      'Nid allwch ddefnyddio\'r emoji hwnnw yma.';

  @override
  String get instanceUrlLabel => 'URL yr achos';

  @override
  String get instanceUrlPlaceholder => 'Rhowch URL yr achos (ee fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Ailosod i Fluxer';

  @override
  String get instanceConnect => 'Cysylltu';

  @override
  String get instanceConnecting => 'Yn cysylltu…';

  @override
  String get instanceConnectFailed => 'Methu cysylltu â\'r parth';

  @override
  String get recentInstances => 'Parthau diweddar';

  @override
  String removeRecentInstance(String domain) {
    return 'Dileu $domain o barthau diweddar';
  }

  @override
  String get instanceSheetTitle => 'Cysylltu â pharth';

  @override
  String get connectToDifferentInstance => 'Cysylltu â pharth gwahanol';

  @override
  String get changeInstance => 'Newid';

  @override
  String get instanceConnectionRequired => 'Cysylltu â\'r parth i fewngofnodi';

  @override
  String get comingSoon => 'Dewch yn fuan';

  @override
  String get guildNavbarDirectMessages => 'Negeseuon Uniongyrchol';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Archwilio Cymunedau i\'w Darganfod';

  @override
  String get discoveryExplore => 'Archwilio';

  @override
  String get discoveryExplorePublicCommunities =>
      'Archwilio cymunedau cyhoeddus';

  @override
  String get discoveryListingSubheading =>
      'Eisiau rhestru eich cymuned yma? Gwnewch gais os ydych yn bodloni\'r gofynion yn gosodiadau eich cymuned > Darganfod.';

  @override
  String get discoverySearchCommunities => 'Chwilio am gymunedau';

  @override
  String get discoveryFilterByLanguage => 'Hidlo yn ôl iaith';

  @override
  String get discoveryAllLanguages => 'Pob iaith';

  @override
  String get discoveryAllCategories => 'Pob un';

  @override
  String get discoveryCategoryGaming => 'Gemau';

  @override
  String get discoveryCategoryMusic => 'Cerddoriaeth';

  @override
  String get discoveryCategoryEntertainment => 'Adloniant';

  @override
  String get discoveryCategoryEducation => 'Addysg';

  @override
  String get discoveryCategoryScienceAndTechnology =>
      'Gwyddoniaeth a Thechnoleg';

  @override
  String get discoveryCategoryContentCreator => 'Crewr Cynnwys';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime a Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Ffilmiau a Theledu';

  @override
  String get discoveryCategoryOther => 'Arall';

  @override
  String get discoveryNoCommunitiesMatch => 'Dim cymunedau\'n cyd-fynd.';

  @override
  String get discoveryJoinCommunity => 'Ymuno â chymuned';

  @override
  String get discoveryJoined => 'Wedi ymuno';

  @override
  String discoveryOnlineCount(String count) {
    return '$count ar-lein';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString aelod',
      one: '1 aelod',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Dim disgrifiad.';

  @override
  String get discoveryCommunities => 'Cymunedau';

  @override
  String get discoveryApps => 'Apiau';

  @override
  String get discoveryJoinErrorGenericTitle => 'Methu ymuno â\'r gymuned hon';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Aeth rhywbeth o\'i le. Rhowch gynnig arall arni mewn eiliad.';

  @override
  String get discoveryJoinErrorFullTitle => 'Mae\'r gymuned hon yn llawn';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Mae\'r gymuned hon wedi cyrraedd ei marc uchaf o aelodau, felly allwch chi ddim ymuno ar hyn o bryd.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Rydych wedi cyrraedd y marc uchaf o gymunedau';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Rydych chi yn y nifer uchaf o gymunedau. Gadewch un a rhowch gynnig arall arni.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Allwch chi ddim ymuno â\'r gymuned hon';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Rydych wedi cael eich gwaharddu o\'r gymuned hon.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Nid yw\'r gymuned hon ar gael mwyach';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Efallai ei bod wedi gadael darganfod neu wedi diffodd aelodau newydd. Adnewyddwch yr dudalen ac ni welwch hi eto.';

  @override
  String get discoveryJoinErrorRateLimitTitle =>
      'Rydych chi\'n mynd yn rhy gyflym';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Aroswch eiliad a rhowch gynnig arall arni.';

  @override
  String get guildNavbarAddCommunity => 'Ychwanegu Cymuned';

  @override
  String get guildNavbarHelp => 'Help';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NEGES NEWYDD';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Cau<bos> $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Sgr a grŵp';

  @override
  String get guildNavbarCreateChannel => 'Creu sianel';

  @override
  String get guildNavbarChannelType => 'Math o sianel';

  @override
  String get guildNavbarTextChannel => 'Sianel destun';

  @override
  String get guildNavbarTextChannelDescription =>
      'Anfon negeseuon, delweddau, GIFs ac emoji';

  @override
  String get guildNavbarVoiceChannel => 'Sianel lais';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Cyd-fyw gyda llais, fideo a rhannu sgrin';

  @override
  String get guildNavbarLinkChannel => 'Cysylltu sianel';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Mynediad cyflym i wefan neu adnodd allanol';

  @override
  String get guildNavbarNameLabel => 'Enw';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarCreateCategory => 'Creu categori';

  @override
  String get guildNavbarNewCategoryHint => 'Categori newydd';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Gwahodd ffrindiau i $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Bydd derbynwyr yn cael eu cyfeirio i #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Chwilio am ffrindiau';

  @override
  String get guildNavbarNoFriendsYet => 'Dim ffrindiau eto';

  @override
  String get guildNavbarNoResults => 'Dim canlyniadau';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Neu, anfonwch ddolen wahodd i ffrind:';

  @override
  String get guildNavbarInviteLink => 'Dolen wahodd';

  @override
  String get guildNavbarCopy => 'Copïo';

  @override
  String get guildNavbarCopied => 'Wediu copïo!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Daw eich dolen wahodd i ben mewn 7 diwrnod.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Nid yw\'r ddolen wahodd hon byth yn dod i ben.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Daw eich dolen wahodd i ben mewn $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Golygu dolen wahodd';

  @override
  String get guildNavbarInviteLinkSettings => 'Gosodiadau dolen wahodd';

  @override
  String get guildNavbarExpireAfter => 'Dod i ben ar ôl';

  @override
  String get guildNavbarMaxUses => 'Uchafswm defnyddiau';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Rhoddwch aelodaeth dros dro';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Bydd aelodau\'n cael eu tynnu pan fyddant all-lein oni bai bod rôl yn cael ei neilltuo';

  @override
  String get guildNavbarCreateNewLink => 'Creu dolen newydd';

  @override
  String get guildNavbarSent => 'Anfonwyd';

  @override
  String get guildNavbarInvite => 'Gwahodd';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Gadael y gymuned';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Ydych chi\'n siŵr eich bod am adael y gymuned hon? Ni fyddwch yn gallu gweld unrhyw negeseuon bellach.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Gadael y gymuned';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Dileu eich negeseuon yn y gymuned hon?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Dileuwch yn barhaol bob neges yr ydych wedi\'i hanfon yma, ar draws pob sianel. Ni ellir ei ddirymu.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Dileu fy negeseuon';

  @override
  String get guildNavbarDeletedYourMessages => 'Wedi dileu eich negeseuon';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Methu â dileu eich negeseuon';

  @override
  String get guildNavbarRemoveOverride => 'Tynnu goruchwyliad';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Cael eich mudu tan $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Dim ond staff Fluxer all gyrchu';

  @override
  String get guildNavbarInvitesPaused =>
      'Mae gwahoddiadau ar hyn o bryd wedi\'u rhoi ar eu त्यांनी yn y gymuned hon';

  @override
  String get guildNavbarDurationNever => 'byth';

  @override
  String get guildNavbarDuration30Minutes => '30 munud';

  @override
  String get guildNavbarDuration1Hour => '1 awr';

  @override
  String get guildNavbarDuration6Hours => '6 awr';

  @override
  String get guildNavbarDuration12Hours => '12 awr';

  @override
  String get guildNavbarDuration1Day => '1 diwrnod';

  @override
  String get guildNavbarDuration7Days => '7 diwrnod';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count eiliad';
  }

  @override
  String get guildNavbarNever => 'Byth';

  @override
  String get guildNavbarNoLimit => 'Dim terfyn';

  @override
  String get guildNavbarOneUse => '1 defnydd';

  @override
  String guildNavbarUses(int count) {
    return '$count defnydd';
  }

  @override
  String get guildMenuMarkAsRead => 'Marciwch fel wedi\'i Ddarllen';

  @override
  String get guildPeekMoreOptions => 'Mwy o Opsiynau';

  @override
  String get guildMenuInviteMembers => 'Gwahodd Aelodau';

  @override
  String get guildMenuCommunitySettings => 'Gosodiadau Cymuned';

  @override
  String get guildMenuEditCommunityProfile => 'Golygu Proffil y Gymuned';

  @override
  String get guildMenuUnmuteCommunity => 'Diddymu Myndrau\'r Gymuned';

  @override
  String get guildMenuMuteCommunity => 'Myndrau\'r Gymuned';

  @override
  String get guildMenuHideMutedChannels => 'Cuddio Sianeli Myndrau';

  @override
  String get guildMenuReportCommunity => 'Adrodd am y Gymuned';

  @override
  String get guildMenuDebugCommunity => 'Debugio\'r Gymuned';

  @override
  String get guildMenuCopyCommunityId => 'Copïo ID\'r Gymuned';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Tan $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Cyffredinol';

  @override
  String get guildMenuSettingsRoles => 'Roliau a Hawliau';

  @override
  String get guildMenuSettingsEmoji => 'Emoji Personoli';

  @override
  String get guildMenuSettingsStickers => 'Sticeri Personoli';

  @override
  String get guildMenuSettingsSafetyModeration => 'Diogelwch a Moderadu';

  @override
  String get guildMenuSettingsActivityLog => 'Cofnod Gweithgaredd';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooks';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'URL Gwahodd Personoli';

  @override
  String get guildMenuSettingsDiscovery => 'Darganfod';

  @override
  String get guildMenuSettingsMembers => 'Aelodau';

  @override
  String get guildMenuSettingsInviteLinks => 'Dolenni Gwahodd';

  @override
  String get guildMenuSettingsBans => 'Gwaharddiadau';

  @override
  String get guildSettingsNoPermission =>
      'Nid oes gennych ganiatâd i weld y tab gosodiadau hwn.';

  @override
  String get guildSettingsOverviewIconTitle => 'Eicon';

  @override
  String get guildSettingsUploadImage => 'Llwytho Delwedd';

  @override
  String get guildSettingsOverviewBannerTitle => 'Baner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Llwythwch faner ar gyfer eich sesiwn.';

  @override
  String get guildSettingsOverviewNameTitle => 'Enw';

  @override
  String get guildSettingsOverviewNameHint => 'Fy nghymuned wych';

  @override
  String get guildSettingsOverviewStatsTitle => 'Ystadegau';

  @override
  String get guildSettingsOverviewMembers => 'Aelodau';

  @override
  String get guildSettingsOverviewOnline => 'Ar-lein';

  @override
  String get guildSettingsRolesDescription =>
      'Defnyddiwch rolau i grwpio aelodau a dyrannu caniatâd.';

  @override
  String get guildSettingsCreateRole => 'Creu Rôl';

  @override
  String get guildSettingsRolesListTitle => 'Roliau';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount statig, $animatedCount slotiau emoji animeiddiedig wedi\'u defnyddio';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Dim emoji personoli eto.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count sticer wedi\'u llwytho i fyny';
  }

  @override
  String get guildSettingsStickersEmpty => 'Dim sticeri personoli eto.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Gwirio aelodau';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Dewiswch beth mae\'n rhaid i aelodau ei gael cyn y gallant bostio neu anfon neges breifat i aelodau\'r gymuned.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Gall aelodau â rolau osgoi\'r gwiriadau hyn. Ar gyfer mannau cyhoeddus, rydym yn argymell galluogi dilysu.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Mae cymunedau sydd wedi\'u rhestru yn y Darganfod yn gofyn am o leiaf ebost wedi\'i ddilysu. Ni ellir dewis \'Dim\' tra bod y Darganfod wedi\'i alluogi.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Cynnwys aeddfed a rhybuddion cynnwys';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Ffurfweddu labelu cynnwys aeddfed a rhybuddion cynnwys dewisol i aelodau.';

  @override
  String get guildSettingsModerationMatureToggle => 'Cynnwys aeddfed';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Marcwch y gymuned hon fel un sy\'n cynnwys cynnwys aeddfed.';

  @override
  String get guildSettingsVerificationNone => 'Dim';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nid oes angen dilysu.';

  @override
  String get guildSettingsVerificationLow => 'Isel';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Mae angen cyfeiriad ebost wedi\'i ddilysu.';

  @override
  String get guildSettingsVerificationMedium => 'Canolig';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Mae angen cyfeiriad ebost wedi\'i ddilysu, a chyfrif sydd o leiaf 5 munud oed.';

  @override
  String get guildSettingsVerificationHigh => 'Uchel';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Mae angen popeth yn y canolig, ynghyd â bod yn aelod o\'r gymuned am o leiaf 10 munud.';

  @override
  String get guildSettingsVerificationHighest => 'Uchel iawn';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Mae angen rhif ffôn wedi\'i ddilysu.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Traciwch gweithredoedd gweinyddwyr ledled y gymuned.';

  @override
  String get guildSettingsAuditLogEmpty => 'Dim cofnodion eto';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Bydd gweithredoedd gweinyddiaeth a newidiadau cymunedol yn ymddangos yma.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Pob defnyddiwr';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Pob gweithred';

  @override
  String get guildSettingsAuditLogNoReason => 'Ni roddwyd unrhyw reswm.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Defnyddiwr anhysbys';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Aeth rhywbeth o\'i le wrth lwytho\'r cofnod gweithrediadau.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Methu llwytho cofnodion gweithrediadau';

  @override
  String get guildSettingsAuditLogReason => 'Reswm';

  @override
  String get guildSettingsAuditLogSomeone => 'rhywun';

  @override
  String get guildSettingsAuditLogSomething => 'rhywbeth';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'endid anhysbys';

  @override
  String get guildSettingsAuditLogNothing => 'dim byd';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Targed anhysbys';

  @override
  String get auditLogActionGuildUpdate => 'Cymuned wedi\'i diweddaru';

  @override
  String get auditLogActionChannelCreate => 'Sianel wedi\'i chreu';

  @override
  String get auditLogActionChannelUpdate => 'Sianel wedi\'i diweddaru';

  @override
  String get auditLogActionChannelDelete => 'Sianel wedi\'i dileu';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Gor-ysgrifennu sianel wedi\'i ychwanegu';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Gor-ysgrifennu sianel wedi\'i diweddaru';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Gor-ysgrifennu sianel wedi\'i symud';

  @override
  String get auditLogActionMemberKick => 'Aelod wedi\'i gicio allan';

  @override
  String get auditLogActionMemberPrune => 'Aelodau wedi\'u glanhau';

  @override
  String get auditLogActionMemberBanAdd => 'Aelod wedi\'i wahardd';

  @override
  String get auditLogActionMemberBanRemove => 'Aelod wedi\'i ddadwahardd';

  @override
  String get auditLogActionMemberUpdate => 'Aelod wedi\'i ddiweddaru';

  @override
  String get auditLogActionMemberRoleUpdate => 'Roliau aelod wedi\'u diweddaru';

  @override
  String get auditLogActionMemberMove => 'Aelod wedi\'i symud';

  @override
  String get auditLogActionMemberDisconnect => 'Aelod wedi\'i ddatgysylltu';

  @override
  String get auditLogActionBotAdd => 'Bot wedi\'i ychwanegu';

  @override
  String get auditLogActionRoleCreate => 'Rôl wedi\'i chreu';

  @override
  String get auditLogActionRoleUpdate => 'Rôl wedi\'i diweddaru';

  @override
  String get auditLogActionRoleDelete => 'Rôl wedi\'i dileu';

  @override
  String get auditLogActionInviteCreate => 'Gwahoddiad wedi\'i greu';

  @override
  String get auditLogActionInviteUpdate => 'Gwahoddiad wedi\'i ddiweddaru';

  @override
  String get auditLogActionInviteDelete => 'Gwahoddiad wedi\'i dileu';

  @override
  String get auditLogActionWebhookCreate => 'Webhook wedi\'i greu';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook wedi\'i ddiweddaru';

  @override
  String get auditLogActionWebhookDelete => 'Webhook wedi\'i dileu';

  @override
  String get auditLogActionEmojiCreate => 'Emoji wedi\'i greu';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji wedi\'i ddiweddaru';

  @override
  String get auditLogActionEmojiDelete => 'Emoji wedi\'i dileu';

  @override
  String get auditLogActionStickerCreate => 'Sticer wedi\'i greu';

  @override
  String get auditLogActionStickerUpdate => 'Sticer wedi\'i ddiweddaru';

  @override
  String get auditLogActionStickerDelete => 'Sticer wedi\'i dileu';

  @override
  String get auditLogActionMessageDelete => 'Neges wedi\'i dileu';

  @override
  String get auditLogActionMessageBulkDelete => 'Negeseuon wedi\'u dileu';

  @override
  String get auditLogActionMessagePin => 'Neges wedi\'i phinio';

  @override
  String get auditLogActionMessageUnpin => 'Neges wedi\'i dadbopio';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return 'Diweddarodd $actor y gosodiadau cymunedol.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return 'Crëodd $actor y sianel $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return 'Diweddarodd $actor y sianel $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return 'Dileodd $actor y sianel $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return 'Ychwanegodd $actor hawliau sianel ar gyfer $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'Ychwanegodd $actor hawliau sianel ar gyfer $target yn $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return 'Diweddarodd $actor hawliau sianel ar gyfer $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'Diweddarodd $actor hawliau sianel ar gyfer $target yn $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return 'Dileodd $actor hawliau sianel ar gyfer $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'Dileodd $actor hawliau sianel ar gyfer $target yn $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return 'Bwriodd $actor allan $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return 'Gwaharddodd $actor $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return 'Diddymodd $actor waharddiad $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return 'Diweddarodd $actor $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return 'Diweddarodd $actor rolau ar gyfer $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return 'Dileodd $actor aelodau anweithgar.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return 'Dileodd $actor aelodau anweithgar am $days diwrnod.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return 'Symudodd $actor $target i sianel lais arall.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'Symudodd $actor $target i $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return 'Datgysylltodd $actor $target o lais.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return 'Ychwanegodd $actor y bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return 'Crëodd $actor y rôl $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return 'Diweddarodd $actor y rôl $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return 'Dileodd $actor y rôl $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return 'Crëodd $actor y gwahoddiad $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'Crëodd $actor y gwahoddiad $target ar gyfer $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return 'Diweddarodd $actor y gwahoddiad $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'Diweddarodd $actor y gwahoddiad $target ar gyfer $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return 'Dileodd $actor y gwahoddiad $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return 'Dileodd $actor y gwahoddiad $target ar gyfer $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return 'Crëodd $actor y webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return 'Diweddarodd $actor y webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return 'Dileodd $actor y webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor ychwanegodd yr emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor diweddarodd yr emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor ddileisodd yr emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor ychwanegodd y sticer $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor diweddarodd y sticer $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor ddileisodd y sticer $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor ddileisodd neges.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor ddileisodd neges yn $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor ddileisodd nifer o negeseuon.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor ddileisodd $count neges.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor ddileisodd nifer o negeseuon yn $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor ddileisodd $count neges yn $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor gosododd neges i fyny.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor gosododd neges i fyny yn $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor tynnodd neges oddi ar ben.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor tynnodd neges oddi ar ben yn $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor perfformiodd weithred archwilio ar $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Diweddarwyd $field o $oldValue i $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Gosodwyd $field i $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Cliriwyd $field (oedd $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Diweddarwyd $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Ail-enwyd y gymuned yn $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Diweddarwyd eicon y gymuned.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Ail-enwyd y sianel yn $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Cliriwyd y pwnc.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Diweddarwyd y pwnc i $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Galluogwyd cynnwys ar gyfer oedolion.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Analluogwyd cynnwys ar gyfer oedolion.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Gosodwyd y llysenw i $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Dileiswyd y llysenw $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Tawelwyd yr aelod.';

  @override
  String get auditLogChangeUnmutedMember => 'Dad-diharddwyd yr aelod.';

  @override
  String get auditLogChangeDeafenedMember => 'Analluogwyd clyw yr aelod.';

  @override
  String get auditLogChangeUndeafenedMember => 'Adferwyd clyw yr aelod.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Ychwanegwyd $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Dileiswyd $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Sianel: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Neges: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Wedi\'i wahodd gan $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dileiswyd # neges.',
      one: 'Dileiswyd # neges.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dileiswyd # aelod.',
      one: 'Dileiswyd # aelod.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Nid yw\'r gwahoddiad hwn yn dod i ben.';

  @override
  String get auditLogOptionTemporaryMembership => 'Yn rhoi aelodaeth dros dro.';

  @override
  String get auditLogOptionPermanentMembership => 'Yn rhoi aelodaeth barhaol.';

  @override
  String get guildSettingsLoadMore => 'Llwytho mwy';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Rheoli webhookiau sy\'n postio negeseuon i sianeli.';

  @override
  String get guildSettingsWebhooksEmpty => 'Dim webhookiau wedi\'u ffurfweddu.';

  @override
  String get guildSettingsCopyUrl => 'Copïo URL';

  @override
  String get guildSettingsCopiedUrl => 'URL wedi\'i gopïo i\'r glipfwrdd';

  @override
  String get guildSettingsDeleteWebhook => 'Diledu webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Gosodwch ddolen wahoddiad arferol ar gyfer eich gweinydd.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Cadw';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Defnydd';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count o ddefnyddiau';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Gwneud cais i gael eich rhestru yn y darganfyddiad gweinydd.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Mae angen o leiaf $count aelod i wneud cais.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Cais';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Statws';

  @override
  String get guildSettingsDiscoveryCategory => 'Categori';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Disgrifiad';

  @override
  String get guildSettingsDiscoveryTags => 'Tagiau';

  @override
  String get guildSettingsDiscoveryTagsHint => 'gemau, celf, cerddoriaeth';

  @override
  String get guildSettingsDiscoveryApply => 'Cyflwyno Cais';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Tynnu\'n ôl';

  @override
  String get guildSettingsMembersDescription =>
      'Chwilio a rheoli aelodau\'r gweinydd.';

  @override
  String get guildSettingsMembersSearchHint => 'Chwilio aelodau';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count aelod';
  }

  @override
  String get guildSettingsInvitesDescription =>
      'Gweld a dirymu dolenni gwahoddiad gweithredol.';

  @override
  String get guildSettingsInvitesEmpty => 'Dim gwahoddiadau gweithredol.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses o ddefnyddiau';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Yn dod i ben $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Gweld a rheoli defnyddwyr sydd wedi\'u gwahardd.';

  @override
  String get guildSettingsBansSearchHint => 'Chwilio gwaharddiadau';

  @override
  String get guildSettingsBansEmpty => 'Dim defnyddwyr wedi\'u gwahardd.';

  @override
  String get guildSettingsBanPermanent => 'Gwaharddiad parhaol';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Yn dod i ben $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Yn dod i ben';

  @override
  String get guildSettingsUnban => 'Diddymu gwaharddiad';

  @override
  String get guildSettingsBansLoading =>
      'Yn llwytho defnyddwyr wedi\'u gwahardd';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Ni chafwyd gwaharddiadau yn cyfateb i\'ch chwiliad.';

  @override
  String get guildSettingsBanDetailsTitle => 'Manylion gwaharddiad';

  @override
  String get guildSettingsBanViewDetails => 'Gweld manylion';

  @override
  String get guildSettingsBannedOn => 'Gwaharddwyd ar';

  @override
  String get guildSettingsBannedBy => 'Gwaharddwyd gan';

  @override
  String get guildSettingsRevokeBanTitle => 'Dirymu gwaharddiad';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Ydych chi\'n siŵr eich bod am ddirymu\'r gwaharddiad ar gyfer $displayName? Byddant yn gallu ailymuno â\'r gymuned.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Dirymwyd gwaharddiad ar gyfer $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Methodd llwytho gwaharddiadau. Rhowch gynnig arall arni.';

  @override
  String get guildSettingsRevokeBanError =>
      'Methodd dirymu gwaharddiad. Rhowch gynnig arall arni.';

  @override
  String get guildSettingsCommunitySettings => 'Gosodiadau Cymuned';

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
      'Rheoli proffil eich cymuned, sianeli, a gosodiadau rhagosodedig.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Brandio';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Diweddarwch eich eicon, enw, baner, a chefndir gwahoddiad';

  @override
  String get guildSettingsOverviewBannerUpload => 'Llwytho baner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Gosodiadau segur';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Ffurfweddu sianel AFK ac amser allan';

  @override
  String get guildSettingsOverviewSystemTitle => 'System a chroeso';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Dewiswch gyrchfan ar gyfer negeseuon system a chroeso';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Hysbysiadau rhagosodedig';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Mae cymunedau â dros 250 o bobl yn cael eu gorfodi i\'r gosodiad \"dim ond sonion\". Mae eich gosodiad gwreiddiol yn cael ei gadw a bydd yn cael ei adfer os bydd y gymuned yn gostwng o dan 250 o aelodau.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Uwch';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Caniatáu enwau sianel testun hyblyg';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Cuddio coron perchennog y gymuned';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Baner ar wahân';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Yn dangos y faner yn ei hadran ei hun islaw\'r penawd cymuned.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Llwytho\'r eicon i fyny';

  @override
  String get guildSettingsOverviewRemoveImage => 'Dileu';

  @override
  String get guildSettingsOverviewSplashTitle => 'Cefndir gwahodd';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Cefndir amgodio sgwrs';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Yn cael ei ddangos mewn amgodion gwahodd mewn sgwrs.';

  @override
  String get guildSettingsOverviewUploadBackground =>
      'Llwytho\'r cefndir i fyny';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Dim baner gymuned';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Dim cefndir gwahodd';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Rhagolwg';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Gweld sut mae eich gwahodd yn edrych i ymwelwyr.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Enwau sianel testun';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Coron perchennog y gymuned';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Ffurfweddu a ddangosir yr eicon coron nesaf at berchnogion y gymuned';

  @override
  String get guildSettingsSplashCardAlignment => 'Aliniad cerdyn';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Canol';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Chwith';

  @override
  String get guildSettingsSplashAlignmentRight => 'Dde';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Dim ond yn berthnasol ar sgriniau llydan.';

  @override
  String get permissionReadMessageHistory => 'Darllen hanes negeseuon';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Newid yr hyn y gall defnyddwyr heb \"$permission\" ei weld';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Defnyddiwch foddol pwrpasol i osod dyddiad trothwy hanes negeseuon ar gyfer aelodau nad oes ganddynt y drwydded $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Agor trothwy hanes negeseuon';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Trothwy hanes negeseuon';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Galluogi trothwy hanes negeseuon';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Dyddiad trothwy';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Gall aelodau heb Ddarllen Hanes Negeseuon weld negeseuon a anfonwyd ar ôl y dyddiad hwn.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Diweddarwyd trothwy hanes negeseuon';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Caniatáu priflythrennau a bylchau mewn enwau sianel testun. Mae \'Diffodd\' yn cyfyngu enwau i lythrennau bach gyda llinellau islaw a atalnodau.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Yn cuddio\'r eicon coron nesaf at berchnogion y gymuned ar draws pob arwyneb.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Mae angen nodwedd cymuned \'Eiconau Animeiddiedig\' ar gyfer eiconau animeiddiedig.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Mae angen nodwedd cymuned \'Baneri Animeiddiedig\' ar gyfer baneri animeiddiedig.';

  @override
  String get guildSettingsAfkChannel => 'Sianel AFK / segur';

  @override
  String get guildSettingsAfkChannelHint =>
      'Symud aelodau i\'r sianel hon pan fyddant yn AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Dim sianel AFK';

  @override
  String get guildSettingsAfkTimeout => 'Amser allan AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 munud';

  @override
  String get guildSettingsAfkTimeout5Min => '5 munud';

  @override
  String get guildSettingsAfkTimeout15Min => '15 munud';

  @override
  String get guildSettingsAfkTimeout30Min => '30 munud';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 awr';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds eiliad';
  }

  @override
  String get guildSettingsSystemChannel => 'Sianel gyrchfan';

  @override
  String get guildSettingsSystemChannelHint =>
      'Bydd negeseuon croeso a negeseuon system yn ymddangos yma.';

  @override
  String get guildSettingsNoSystemChannel => 'Dim sianel system';

  @override
  String get guildSettingsHideJoinMessages => 'Cuddio negeseuon ymuno';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Yn cuddio negeseuon ymuno yn y sianel gyrchfan.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Gosodiadau hysbysiadau rhagosodedig';

  @override
  String get guildSettingsNotificationsAll => 'Pawb';

  @override
  String get guildSettingsNotificationsAllDescription => 'Hysbysu am bob neges';

  @override
  String get guildSettingsNotificationsMentions => 'Soniadau yn unig';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Hysbysu am soniadau yn unig';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Uchafswm 10MB. Isafswm: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Uchafswm 10MB. Isafswm: 960×540px (16:9). Yn cael ei arddangos mewn mewnblaniadau gwahodd mewn sgwrs.';

  @override
  String get guildSettingsModerationDescription =>
      'Ffurfweddu gosodiadau dilysu, hidlo cynnwys, a chynnwys ar gyfer oedolion.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Mae gan gymunedau sydd wedi\'u rhestru yn Discovery opsiynau cymedroli cyfyngedig.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Hidlo cynnwys';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Sgrinio negeseuon yn awtomatig am gynnwys amhriodol mewn sianeli nad ydynt wedi\'u marcio ar gyfer cynnwys ar gyfer oedolion.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Mae\'n ofynnol i gymunedau sydd wedi\'u rhestru yn Discovery sganio pob aelod. Ni ellir newid y gosodiad hwn tra bod Discovery wedi\'i alluogi.';

  @override
  String get guildSettingsContentFilterOff => 'I ffwrdd';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Gadewch i\'r gymuned hunan-gymedroli';

  @override
  String get guildSettingsContentFilterNoRole => 'Hidlo aelodau heb rannau';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Argymhellir ar gyfer y rhan fwyaf o gymunedau';

  @override
  String get guildSettingsContentFilterAll => 'Hidlo pawb';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Uchafswm o amddiffyniad ar gyfer mannau sy\'n addas i\'r teulu';

  @override
  String get guildSettingsModerationMatureOff => 'I ffwrdd';

  @override
  String get guildSettingsModerationMatureOn => 'Ymlaen';

  @override
  String get guildSettingsContentWarningToggle => 'Dangos rhybudd am gynnwys';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Yn troi anogwr caniatâd ymlaen cyn mynd i mewn i unrhyw sianel.';

  @override
  String get guildSettingsContentWarningText => 'Testun rhybudd personol';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Mae hyn yn cynnwys cynnwys sensitif.';

  @override
  String get guildSettingsModeration2faTitle => 'Gofyniad 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Gofynnwch am ddilysu dau-ffactor ar gyfer gweinyddwyr cyn y gallant wahardd, gicio, amseru allan, neu dynnu negeseuon.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Gofyn am 2FA ar gyfer gweithredoedd gweinyddu';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Dim ond perchennog y gymuned all newid y gosodiad hwn';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Galluogi 2FA ar eich cyfrif i newid y gosodiad hwn';

  @override
  String get guildSettingsEmojiSearchHint => 'Chwilio am emojis';

  @override
  String get guildSettingsEmojiUploadTitle => 'Uwchlwytho Emoji';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji heb animeiddio ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animeiddiedig ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Chwilio am sticeri';

  @override
  String get guildSettingsWebhooksInfo =>
      'Creu webhookiau o leoliadau Sianel. Golygu nhw yma.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Ni fydd eich URL gwagedd yn gweithio oni bai bod o leiaf un sianel yn weladwy i bawb.';

  @override
  String get guildSettingsVanityUrlRemove => 'Tynnu';

  @override
  String get guildSettingsBannedUsersTitle => 'Defnyddwyr gwaharddedig';

  @override
  String get guildSettingsInvitesTableInviter => 'Gwahoddwr';

  @override
  String get guildSettingsInvitesTableChannel => 'Sianel';

  @override
  String get guildSettingsInvitesTableCode => 'Cod';

  @override
  String get guildSettingsInvitesTableUses => 'Defnyddiau';

  @override
  String get guildSettingsInvitesTableCreated => 'Crëwyd';

  @override
  String get guildSettingsMembersSortNewest => 'Diweddaraf yn gyntaf';

  @override
  String get guildSettingsAuditLogFilterUser => 'Hidlo yn ôl defnyddiwr';

  @override
  String get guildSettingsAuditLogFilterAction => 'Hidlo yn ôl gweithred';

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
