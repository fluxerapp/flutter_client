// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class FluxerLocalizationsSk extends FluxerLocalizations {
  FluxerLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get reconnectingTitle => 'Niečo sme pokazili!';

  @override
  String get reconnectingBody =>
      'Niečo je zle so servermi.\nMalo by sa to čoskoro vyriešiť!';

  @override
  String get gatewayReconnectingToast => 'Pripojenie…';

  @override
  String get gatewayConnectedToast => 'Pripojené';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Spustenie zlyhalo: $error';
  }

  @override
  String get retry => 'Skúsiť znova';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Spojenie prerušené';

  @override
  String get splashViewOnStatusPage => 'Zobraziť na stránke stavu';

  @override
  String get splashConnectionIssuesPrompt => 'Problémy s pripojením?';

  @override
  String get splashStatusPageLink => 'Stránka stavu';

  @override
  String get splashReadIncident => 'Prečítať incident';

  @override
  String get splashIncidentHistory => 'História incidentov';

  @override
  String get welcomeBack => 'Vitajte späť';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'Zadajte platnú e-mailovú adresu.';

  @override
  String get password => 'Heslo';

  @override
  String get forgotPassword => 'Zabudli ste heslo?';

  @override
  String get logIn => 'Prihlásiť sa';

  @override
  String get logInWithPasskey => 'Prihlásiť sa pomocou kľúča';

  @override
  String continueWithSso(String provider) {
    return 'Pokračovať s $provider';
  }

  @override
  String get ssoRequired => 'Na prístup k tomuto inštancii je vyžadované SSO.';

  @override
  String get organizationSsoProvider =>
      'Prihláste sa pomocou poskytovateľa jednotného prihlásenia vašej organizácie.';

  @override
  String get failedToStartSso => 'Spustenie SSO zlyhalo';

  @override
  String get ssoCancelled => 'Prihlásenie SSO bolo zrušené';

  @override
  String preferSso(String provider) {
    return 'Preferujete používať SSO? Pokračujte s $provider.';
  }

  @override
  String get logInViaBrowser => 'Prihlásiť sa cez prehliadač';

  @override
  String get needAccountPrompt => 'Potrebujete účet? ';

  @override
  String get register => 'Registrovať sa';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Overte, že ste človek';

  @override
  String get captchaDescription =>
      'Musíme sa uistiť, že nie ste robot. Dokončite overenie nižšie.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Máte problémy? Skúste namiesto toho hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Skúste namiesto toho Turnstile';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get ipAuthCheckEmail => 'Skontrolujte svoj e-mail';

  @override
  String ipAuthDescription(String email) {
    return 'Poslali sme e-mail s odkazom na autorizáciu tohto prihlásenia. Otvorte si prosím doručenú poštu pre $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Spojenie prerušené';

  @override
  String get ipAuthConnectionLostDescription =>
      'Počas čakania na autorizáciu sme stratili spojenie. Skúste to znova.';

  @override
  String get ipAuthLinkExpired => 'Odkaz na prihlásenie vypršal';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Tento odkaz na autorizáciu vypršal. Prihláste sa prosím znova.';

  @override
  String get ipAuthResendEmail => 'Poslať e-mail znova';

  @override
  String get ipAuthResent => 'Odoslané znova';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}s';
  }

  @override
  String get back => 'Späť';

  @override
  String get mfaTitle => 'Dvojfaktorová autentizácia';

  @override
  String get mfaChooseMethod => 'Vyberte metódu overenia';

  @override
  String get mfaMethodTotp => 'Aplikácia na overenie';

  @override
  String get mfaMethodWebauthn => 'Bezpečnostný kľúč / Kľúč';

  @override
  String get mfaTotpDescription =>
      'Zadajte 6-miestny kód z vašej aplikácie na overenie alebo jeden z vašich záložných kódov.';

  @override
  String get mfaCodeLabel => 'Kód';

  @override
  String get mfaTryAnotherMethod => 'Skúsiť inú metódu';

  @override
  String get mfaUseSecurityKey =>
      'Namiesto toho vyskúšajte bezpečnostný kľúč / prístupový kľúč';

  @override
  String get accountSelectorTitle => 'Vyberte účet';

  @override
  String get accountSelectorDescription =>
      'Vyberte účet na pokračovanie alebo pridajte iný.';

  @override
  String get accountAdd => 'Pridať účet';

  @override
  String get accountRemove => 'Odstrániť';

  @override
  String accountRemoveTitle(String username) {
    return 'Odstrániť $username';
  }

  @override
  String get accountRemoveDescription =>
      'Týmto sa odstráni uložená relácia pre tento účet.';

  @override
  String get accountRemoveOnlyDescription =>
      'Týmto sa odstráni jediný uložený účet na tomto zariadení.';

  @override
  String get accountExpired => 'Platnosť vypršala';

  @override
  String accountSessionExpired(String identifier) {
    return 'Platnosť relácie pre $identifier vypršala. Prihláste sa znova.';
  }

  @override
  String get accountManageTitle => 'Spravovať účty';

  @override
  String get accountSwitchFailed =>
      'Prepnutie účtov sa nepodarilo. Skúste to znova.';

  @override
  String get profileTabMenuSwitchAccounts => 'Prepnutie účtov';

  @override
  String get statusChangeSheetTitle => 'Nastaviť stav';

  @override
  String get statusOnlineStatusSection => 'Stav online';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Nečinný';

  @override
  String get statusDnd => 'Nerušiť';

  @override
  String get statusInvisible => 'Neviditeľný';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Kým to nezmením';

  @override
  String get statusDontClear => 'Neodstrániť';

  @override
  String get statusFor10Seconds => 'Na 10 sekúnd';

  @override
  String get statusClearAfter10Seconds => '10 sekúnd';

  @override
  String get statusClearAfter15Minutes => '15 minút';

  @override
  String get statusClearAfter30Minutes => '30 minút';

  @override
  String get statusClearAfter1Hour => '1 hodina';

  @override
  String get statusClearAfter3Hours => '3 hodiny';

  @override
  String get statusClearAfter4Hours => '4 hodiny';

  @override
  String get statusClearAfter8Hours => '8 hodín';

  @override
  String get statusClearAfter24Hours => '24 hodín';

  @override
  String get statusClearAfter3Days => '3 dni';

  @override
  String get statusDndDescription =>
      'Nebudete dostávať upozornenia na počítači';

  @override
  String get statusInvisibleDescription => 'Budete sa zobrazovať ako offline';

  @override
  String get customStatusSetTitle => 'Nastaviť vlastný stav';

  @override
  String get customStatusCurrentHint => 'Vlastný stav';

  @override
  String get customStatusClear => 'Odstrániť vlastný stav';

  @override
  String get customStatusPlaceholder => 'Čo sa deje?';

  @override
  String get customStatusChooseEmoji => 'Vybrať emoji';

  @override
  String get customStatusClearAfter => 'Odstrániť po';

  @override
  String get customStatusSave => 'Uložiť';

  @override
  String get accountActive => 'Aktívny účet';

  @override
  String get signOut => 'Odhlásiť sa';

  @override
  String get suspendedPermanentTitle => 'Účet trvalo pozastavený';

  @override
  String get suspendedTemporaryTitle => 'Účet pozastavený';

  @override
  String get suspendedPermanentDescription =>
      'Váš účet bol trvalo pozastavený za porušenie našich Podmienok služby.';

  @override
  String get suspendedTemporaryDescription =>
      'Váš účet bol dočasne pozastavený. K svojmu účtu budete mať prístup po skončení obdobia pozastavenia.';

  @override
  String get suspendedIssuedAt => 'Vydané';

  @override
  String get suspendedEndsAt => 'Končí';

  @override
  String get suspendedDuration => 'Trvanie';

  @override
  String get suspendedPermanent => 'Trvalo';

  @override
  String get suspendedReason => 'Dôvod';

  @override
  String get suspendedAppealDeadline => 'Lehota na odvolanie';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Váš účet je naplánovaný na odstránenie dňa $date.';
  }

  @override
  String get suspendedRecheck => 'Skontrolovať aktualizácie';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Skontrolovať znova o ${seconds}s';
  }

  @override
  String get suspendedBackToLogin => 'Späť na prihlásenie';

  @override
  String get suspendedAppealTitle => 'Odvolanie';

  @override
  String get suspendedAppealHint =>
      'Vysvetlite, prečo by malo byť vaše pozastavenie prehodnotené (minimálne 50 znakov)...';

  @override
  String get suspendedAppealSubmit => 'Odoslať odvolanie';

  @override
  String get suspendedAppealPending => 'Čaká na preskúmanie';

  @override
  String get suspendedAppealAccepted => 'Odvolanie prijaté';

  @override
  String get suspendedAppealRejected => 'Odvolanie zamietnuté';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Vaše odvolanie bolo prijaté a váš účet bol obnovený.';

  @override
  String get suspendedSignIn => 'Prihláste sa do svojho účtu';

  @override
  String get forgotPasswordTitle => 'Zabudli ste heslo?';

  @override
  String get forgotPasswordDescription =>
      'Zadajte svoju e-mailovú adresu a pošleme vám odkaz na obnovenie hesla.';

  @override
  String get forgotPasswordSubmit => 'Odoslať odkaz na obnovenie';

  @override
  String get forgotPasswordSentTitle => 'Skontrolujte svoj e-mail';

  @override
  String get forgotPasswordSentDescription =>
      'Odkaz na obnovenie hesla sme poslali na vašu e-mailovú adresu. Skontrolujte si doručenú poštu a postupujte podľa pokynov v odkaze na obnovenie hesla.';

  @override
  String get forgotPasswordBackToLogin => 'Návrat na prihlásenie';

  @override
  String get resetPasswordTitle => 'Nastaviť nové heslo';

  @override
  String get resetPasswordDescription =>
      'Zadajte svoje nové heslo nižšie, aby ste dokončili proces obnovenia.';

  @override
  String get resetPasswordNewPassword => 'Nové heslo';

  @override
  String get resetPasswordConfirm => 'Potvrdiť nové heslo';

  @override
  String get resetPasswordSubmit => 'Obnoviť heslo';

  @override
  String get resetPasswordMismatch => 'Heslá sa nezhodujú.';

  @override
  String get registerTitle => 'Vytvoriť účet';

  @override
  String get registerDisplayName => 'Zobrazované meno (voliteľné)';

  @override
  String get registerDisplayNameHint => 'Ako vás majú ľudia volať?';

  @override
  String get registerUsername => 'Používateľské meno (voliteľné)';

  @override
  String get registerUsernameHint =>
      'Nechajte prázdne pre náhodné používateľské meno';

  @override
  String get registerUsernameTagHint =>
      'Štítok so 4 číslicami sa automaticky pridá na zaistenie jedinečnosti';

  @override
  String get registerDateOfBirth => 'Dátum narodenia';

  @override
  String get registerMonth => 'Mesiac';

  @override
  String get registerDay => 'Deň';

  @override
  String get registerYear => 'Rok';

  @override
  String get registerConsent =>
      'Súhlasím s Podmienkami služby a Zásadami ochrany osobných údajov';

  @override
  String get registerConsentPrefix => 'Súhlasím s ';

  @override
  String get registerConsentTerms => 'Podmienkami služby';

  @override
  String get registerConsentAnd => ' a ';

  @override
  String get registerConsentPrivacy => 'Zásadami ochrany osobných údajov';

  @override
  String get registerConfirmPassword => 'Potvrdiť heslo';

  @override
  String get registerSubmit => 'Vytvoriť účet';

  @override
  String get registerHaveAccount => 'Už máte účet? ';

  @override
  String get passkeyNoCredentials =>
      'Pre túto aplikáciu neboli nájdené žiadne passkeys. Namiesto toho sa prihláste pomocou e-mailu a hesla.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkeys nie sú na tomto zariadení podporované.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkeys nie sú pre túto aplikáciu nakonfigurované. Namiesto toho sa prihláste pomocou e-mailu a hesla.';

  @override
  String get passkeyTimeout =>
      'Autentifikácia pomocou passkey vypršala. Skúste to znova.';

  @override
  String get passkeyNotAvailable =>
      'Passkeys nie sú pre túto aplikáciu dostupné. Namiesto toho sa prihláste pomocou e-mailu a hesla.';

  @override
  String get passkeyFailed =>
      'Autentizácia pomocou hesla zlyhala. Skúste to znova.';

  @override
  String get errorUnableToCreateAccount =>
      'Účet sa nepodarilo vytvoriť. Skúste to znova.';

  @override
  String get errorUnableToSignIn =>
      'Prihlásenie momentálne nie je možné. Skúste to znova.';

  @override
  String get errorInvalidEmailOrPassword => 'Neplatný e-mail alebo heslo.';

  @override
  String get errorUnableToSendResetLink =>
      'Odkaz na obnovenie hesla sa nepodarilo odoslať. Skúste to znova.';

  @override
  String get errorUnableToResetPassword =>
      'Heslo sa nepodarilo obnoviť. Skúste to znova.';

  @override
  String get embedInviteJoin => 'Pripojiť sa ku komunite';

  @override
  String get embedInviteGoTo => 'Prejsť do komunity';

  @override
  String embedInviteOnline(String count) {
    return '$count online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count členov';
  }

  @override
  String get embedInviteUnknownTitle => 'Neznáme pozvanie';

  @override
  String get embedInviteUnknownSubtitle => 'Skúste požiadať o nové pozvanie.';

  @override
  String get embedInviteUnavailable => 'Pozvanie nedostupné';

  @override
  String get inviteAcceptTitle => 'Boli ste pozvaní sa pripojiť';

  @override
  String get inviteAcceptJoinButton => 'Pripojiť sa ku komunite';

  @override
  String get inviteAcceptGoToButton => 'Prejsť do komunity';

  @override
  String get inviteAcceptInvitesPaused => 'Pozvania pozastavené';

  @override
  String get inviteAcceptNotFoundTitle => 'Pozvanie je neplatné';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Toto pozvanie môže byť neplatné alebo vypršané.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Pripojiť sa do skupiny';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Boli ste pozvaní do skupinového DM od $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'niekto';

  @override
  String get inviteAcceptEmojiPack => 'Balík emotikonov';

  @override
  String get inviteAcceptStickerPack => 'Balík nálepiek';

  @override
  String get inviteAcceptInstallEmojiPack => 'Nainštalovať balík emotikonov';

  @override
  String get inviteAcceptInstallStickerPack => 'Nainštalovať balík nálepiek';

  @override
  String get inviteAcceptPackInstallNote =>
      'Prijatím tohto pozvania sa balík automaticky nainštaluje.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Prístup do kanála odoprený';

  @override
  String get channelAccessDeniedDescription =>
      'Nemáte prístup do kanála, kde bolo toto hlásenie odoslané.';

  @override
  String get messageJumpLinkNoAccess => 'Bez prístupu';

  @override
  String get okay => 'OK';

  @override
  String get embedThemeTitle => 'Zdieľaná téma';

  @override
  String get embedThemeSubtitle => 'Tento klient nepodporuje vlastné témy.';

  @override
  String get embedThemeUnavailableButton => 'Témy nedostupné';

  @override
  String get privacySettings => 'Nastavenia súkromia';

  @override
  String get privacyDirectMessages => 'Priame správy';

  @override
  String get privacyDirectMessagesDescription =>
      'Povoliť priame správy od ostatných členov v tejto komunite';

  @override
  String get privacyBotDirectMessages => 'Priame správy od botov';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Povoliť botom z tejto komunity posielať vám priame správy';

  @override
  String get privacyMutualDmsDisabled =>
      'Administrátori komunity zakázali prijímanie priamych správ výlučne od vzájomných členov v tejto komunite.';

  @override
  String get communityDebug => 'Ladeniu komunity';

  @override
  String get copiedToClipboard => 'Skopírované do schránky';

  @override
  String get notificationSettings => 'Nastavenia upozornení';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Stlmiť $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Stlmenie komunity zabráni zobrazovaniu neprečítaných indikátorov a upozornení, pokiaľ nie ste spomenutí.';

  @override
  String get notificationCommunitySettings => 'Nastavenia upozornení komunity';

  @override
  String get notificationAllMessages => 'Všetky správy';

  @override
  String get notificationOnlyMentions => 'Iba spomenutia';

  @override
  String get notificationNothing => 'Nič';

  @override
  String get notificationSuppressEveryone => 'Potlačiť @everyone a @here';

  @override
  String get notificationSuppressRoles => 'Potlačiť všetky zmienky o rolách';

  @override
  String get notificationMobilePush => 'Mobilné oznámenia';

  @override
  String get notificationOverrides => 'Prepísania oznámení';

  @override
  String get notificationSelectChannel => 'Vyberte kanál alebo kategóriu';

  @override
  String get notificationOnlyAtMentions => 'Iba zmienky';

  @override
  String get notificationMuteChannel => 'Stlmiť kanál';

  @override
  String get notificationUnmuteChannel => 'Zrušiť stlmenie kanála';

  @override
  String get notificationNoCategory => 'Bez kategórie';

  @override
  String get dmMarkAsRead => 'Označiť ako prečítané';

  @override
  String get dmMuteConversation => 'Stlmiť DM';

  @override
  String get dmUnmuteConversation => 'Zrušiť stlmenie DM';

  @override
  String get dmPinDm => 'Pripnúť DM';

  @override
  String get dmUnpinDm => 'Odopnúť DM';

  @override
  String get dmAlwaysShowInSidebar => 'Vždy zobraziť v postrannom paneli';

  @override
  String get dmRemoveFromAlwaysShown => 'Odstrániť z vždy zobrazených';

  @override
  String get dmCloseDm => 'Zavrieť DM';

  @override
  String get dmCloseDmConfirmTitle => 'Zavrieť DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Naozaj chcete zavrieť váš DM s používateľom $username? Môžete ho kedykoľvek znova otvoriť.';
  }

  @override
  String get dmCopyChannelId => 'Skopírovať ID kanála';

  @override
  String get dmChannelIdCopied => 'ID kanála bolo skopírované';

  @override
  String get dmCopyUserId => 'Skopírovať ID používateľa';

  @override
  String get dmUserIdCopied => 'ID používateľa bolo skopírované';

  @override
  String get dmViewProfile => 'Zobraziť profil';

  @override
  String get dmVoiceCall => 'Začať hlasový hovor';

  @override
  String get incomingVoiceCallTitle => 'Prichádzajúci hlasový hovor';

  @override
  String get incomingVoiceCallAccept => 'Prijať';

  @override
  String get incomingVoiceCallDecline => 'Odmietnuť';

  @override
  String get incomingVoiceCallLabel => 'Prichádzajúci hovor';

  @override
  String get incomingVoiceCallIgnore => 'Ignorovať';

  @override
  String get directVoiceCallNotEligible =>
      'Tento hovor sa momentálne nedá začať. Skúste to znova o chvíľu.';

  @override
  String get voiceJoinCallFailed =>
      'Nepodarilo sa pripojiť k tomuto hovoru. Skontrolujte svoje pripojenie a skúste to znova.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Nepodarilo sa pripojiť k tomuto hovoru. Skontrolujte svoje pripojenie a skúste to znova.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Nepodarilo sa aktualizovať tento hovor na serveri. Skontrolujte svoje pripojenie a skúste to znova.';

  @override
  String get dmAddNote => 'Pridať poznámku';

  @override
  String get dmEditGroup => 'Upraviť skupinu';

  @override
  String get dmInviteToCommunity => 'Pozvať do komunity';

  @override
  String get dmBlock => 'Blokovať';

  @override
  String get dmLeaveGroup => 'Opustiť skupinu';

  @override
  String get dmNoCommunitiesAvailable => 'Žiadne komunity nie sú k dispozícii';

  @override
  String dmGroupMemberCount(int count) {
    return '$count členov';
  }

  @override
  String get dmMuteFor15Min => 'Na 15 minút';

  @override
  String get dmMuteFor30Min => 'Na 30 minút';

  @override
  String get dmMuteFor1Hour => 'Na 1 hodinu';

  @override
  String get dmMuteFor3Hours => 'Na 3 hodiny';

  @override
  String get dmMuteFor4Hours => 'Na 4 hodiny';

  @override
  String get dmMuteFor8Hours => 'Na 8 hodín';

  @override
  String get dmMuteFor24Hours => 'Na 24 hodín';

  @override
  String get dmMuteFor3Days => 'Na 3 dni';

  @override
  String get dmMuteForever => 'Až kým to nezruším';

  @override
  String get dmPinGroupDm => 'Pripnúť skupinový DM';

  @override
  String get dmUnpinGroupDm => 'Odopnúť skupinovú DM';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Obľúbená DM';

  @override
  String get dmUnfavoriteDm => 'Zrušiť obľúbenú DM';

  @override
  String get dmFavoriteGroupDm => 'Obľúbená skupinová DM';

  @override
  String get dmUnfavoriteGroupDm => 'Zrušiť obľúbenú skupinovú DM';

  @override
  String get dmChangeFriendNickname => 'Zmeniť prezývku priateľa';

  @override
  String get dmRemoveFriend => 'Odstrániť priateľa';

  @override
  String get dmAddFriend => 'Pridať priateľa';

  @override
  String get dmAcceptFriendRequest => 'Prijímať žiadosť o priateľstvo';

  @override
  String get dmIgnoreFriendRequest => 'Ignorovať žiadosť o priateľstvo';

  @override
  String get dmFriendRequestSent => 'Odoslaná žiadosť o priateľstvo';

  @override
  String get dmUnblock => 'Odblokovať';

  @override
  String get dmDebugUser => 'Ladiť používateľa';

  @override
  String get dmDebugChannel => 'Ladiť kanál';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Pripnutá DM';

  @override
  String get dmUnpinned => 'Odopnutá DM';

  @override
  String get dmMuted => 'Stlmená DM';

  @override
  String get dmUnmuted => 'Nenastavené stlmenie DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Odstrániť priateľa';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Naozaj chcete odstrániť $username ako priateľa?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blokovať používateľa';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Naozaj chcete zablokovať $username? Nebude vám môcť posielať správy ani posielať žiadosti o priateľstvo.';
  }

  @override
  String get dmFriendRequestSentToast => 'Žiadosť o priateľstvo odoslaná';

  @override
  String get dmFriendRequestFailed =>
      'Odoslanie žiadosti o priateľstvo zlyhalo';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Prijatie žiadosti o priateľstvo zlyhalo';

  @override
  String get dmRemoveFriendFailed => 'Odstránenie priateľa zlyhalo';

  @override
  String get dmBlockFailed => 'Blokovanie používateľa zlyhalo';

  @override
  String get dmUnblockFailed => 'Odblokovanie používateľa zlyhalo';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Ignorovanie žiadosti o priateľstvo zlyhalo';

  @override
  String get dmAddFriends => 'Pridať priateľov';

  @override
  String get addFriendSheetTitle => 'Pridať priateľa';

  @override
  String get addFriendUsernameHint => 'Používateľské meno#0000';

  @override
  String get addFriendUsernameLabel => 'Používateľské meno priateľa';

  @override
  String get addFriendSendRequest => 'Odoslať žiadosť';

  @override
  String get addFriendNoUserFound =>
      'Používateľ s týmto používateľským menom nebol nájdený.';

  @override
  String get addFriendInvalidUsername =>
      'Zadajte platné používateľské meno (Používateľské meno#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Žiadosť o priateľstvo odoslaná';

  @override
  String get addFriendClaimTitle => 'Nárokujte si svoj účet';

  @override
  String get addFriendClaimDescription =>
      'Nárokujte si svoj účet, aby ste mohli posielať žiadosti o priateľstvo.';

  @override
  String get addFriendVerifyTitle => 'Overte svoj e-mail';

  @override
  String get addFriendVerifyDescription =>
      'Pred odoslaním žiadostí o priateľstvo si musíte overiť svoju e-mailovú adresu.';

  @override
  String get addFriendVerifyEmail => 'Overiť e-mail';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Prichádzajúce žiadosti o priateľstvo ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Odchádzajúce žiadosti o priateľstvo ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Prichádzajúca žiadosť o priateľstvo';

  @override
  String get addFriendOutgoingStatus => 'Žiadosť o priateľstvo odoslaná';

  @override
  String get addFriendViewProfile => 'Zobraziť profil';

  @override
  String get addFriendAccept => 'Prijať';

  @override
  String get addFriendIgnore => 'Ignorovať';

  @override
  String get addFriendAcceptTitle => 'Prijať žiadosť o priateľstvo';

  @override
  String get addFriendIgnoreTitle => 'Ignorovať žiadosť o priateľstvo';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Prijmeš žiadosť o priateľstvo od používateľa $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Ignorovať žiadosť o priateľstvo od používateľa $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Zrušiť žiadosť';

  @override
  String get addFriendCancelRequestFailed =>
      'Nepodarilo sa zrušiť žiadosť o priateľstvo. Skúste to znova.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Momentálne neprijímajú žiadosti o priateľstvo.';

  @override
  String get addFriendUnblockFirst =>
      'Najprv ich odblokujte, aby ste mohli poslať žiadosť o priateľstvo.';

  @override
  String get addFriendCannotSendToSelf =>
      'Nemôžete si poslať žiadosť o priateľstvo sami sebe.';

  @override
  String get addFriendAlreadyFriends =>
      'Už ste priatelia s týmto používateľom.';

  @override
  String get addFriendClaimToSend =>
      'Dokončite registráciu na posielanie žiadostí o priateľstvo.';

  @override
  String get addFriendSendFailedGeneric =>
      'Nepodarilo sa odoslať žiadosť o priateľstvo. Skúste to znova.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Systém';

  @override
  String get emojiSearchPlaceholder => 'Nájdite emoji svojich snov';

  @override
  String get emojiSearchEmpty =>
      'Žiadne emoji nezodpovedajú vášmu vyhľadávaniu';

  @override
  String get emojiAutocompleteDefaultLabel => 'Predvolený emoji';

  @override
  String get emojiFrequentlyUsed => 'Často používané';

  @override
  String get emojiTabGifs => 'GIFy';

  @override
  String get emojiTabMedia => 'Médiá';

  @override
  String get emojiTabStickers => 'Nálepky';

  @override
  String get emojiTabEmojis => 'Emoji';

  @override
  String get gifPickerSearch => 'Hľadať GIFy';

  @override
  String get gifPickerSearchKlipy => 'Hľadať KLIPY';

  @override
  String get gifPickerSearchTenor => 'Hľadať Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Obľúbené';

  @override
  String get gifPickerTrending => 'Populárne GIFy';

  @override
  String get gifPickerNoResultsTitle => 'Žiadne výsledky vyhľadávania';

  @override
  String get gifPickerNoResultsDescription =>
      'Vyskúšajte iný výraz vyhľadávania';

  @override
  String get gifPickerLoadFailedTitle => 'Nepodarilo sa načítať GIFy';

  @override
  String get gifPickerLoadFailedBody =>
      'Skontrolujte svoje pripojenie a skúste to znova.';

  @override
  String get emojiCategoryPeople => 'Ľudia';

  @override
  String get emojiCategoryNature => 'Príroda';

  @override
  String get emojiCategoryFood => 'Jedlo a nápoje';

  @override
  String get emojiCategoryActivity => 'Aktivity';

  @override
  String get emojiCategoryTravel => 'Cestovanie a miesta';

  @override
  String get emojiCategoryObjects => 'Objekty';

  @override
  String get emojiCategorySymbols => 'Symboly';

  @override
  String get emojiCategoryFlags => 'Vlajky';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Odomknite $emojiCount z $communityCount pomocou Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Získať Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Už mi to nezobrazovať';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vlastných emoji',
      one: '1 vlastný emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count komunít',
      one: '1 komunita',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Varovanie pred externým odkazom';

  @override
  String get externalLinkWarningLeaving => 'Chystáte sa opustiť Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'Externé odkazy môžu byť nebezpečné. Buďte opatrní.';

  @override
  String get externalLinkWarningDestinationUrl => 'Cieľová URL:';

  @override
  String get externalLinksSectionTitle => 'Externé odkazy';

  @override
  String get externalLinksSectionDescription =>
      'Nastavte, ako sa majú spracovávať varovania pred externými odkazmi.';

  @override
  String get externalLinkWarningTrustPrefix => 'Vždy dôverovať ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — preskočiť toto varovanie nabudúce';

  @override
  String get externalLinkVisitSite => 'Navštíviť stránku';

  @override
  String get externalLinkTrustAllLabel => 'Dôverovať všetkým externým odkazom';

  @override
  String get externalLinkStripTrackingLabel =>
      'Odstrániť sledovacie parametre z URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automaticky odstráňte sledovacie parametre (ako utm_source, fbclid, gclid) z URL v správach, ktoré posielate. Vyčistí odkaz predtým, ako sa dostane k niekomu inému.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Dôverovať všetkým externým odkazom?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Týmto dôverujete všetkým externým odkazom a preskočíte varovanie pre každú doménu. Vaše existujúce dôveryhodné domény budú nahradené. Toto je menej bezpečné.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Dôverovať všetkým';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Prestať dôverovať všetkým odkazom?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Varovania pred externými odkazmi sa opäť zobrazia. Dôveryhodné domény budete musieť pridať individuálne.';

  @override
  String get externalLinkStopTrustingAllAction => 'Zakázať dôveru všetkým';

  @override
  String get externalLinkTrustedAllDescription =>
      'Všetkým externým odkazom je dôverované. Varovania sa nebudú zobrazovať.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Máte $count dôveryhodnú doménu/y. Pridajte ďalšie zaškrtnutím políčka pri návšteve externých odkazov.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Keď je povolené, nezobrazia sa žiadne varovania pred externými odkazmi. Toto je menej bezpečné.';

  @override
  String get imageFileTooLarge =>
      'Súbor obrázka je príliš veľký. Vyberte súbor menší ako 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animované avatary vyžadujú Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animované bannery vyžadujú Plutonium';

  @override
  String get animatedAvifNotSupported => 'Animované AVIF nie je podporované';

  @override
  String get animatedAvifNotSupportedBody =>
      'Orezávanie a otáčanie animovaných súborov AVIF ešte nie je podporované. Ak budete pokračovať, súbor sa nahraje v pôvodnej forme.';

  @override
  String get uploadAsIs => 'Nahrať tak ako je';

  @override
  String get croppingAnimatedNotSupported =>
      'Orezávanie animovaných obrázkov ešte nie je podporované. Použije sa pôvodný nahraný súbor.';

  @override
  String get cropAvatar => 'Orezať avatar';

  @override
  String get cropBanner => 'Orezať banner';

  @override
  String get skip => 'Preskočiť';

  @override
  String get crop => 'Orezať';

  @override
  String get changeYourFluxerTag => 'Zmeniť váš FluxerTag';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'Používateľské mená môžu obsahovať iba písmená (a-z, A-Z), čísla (0-9) a podčiarkovníky. Používateľské mená nerozlišujú veľkosť písmen.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Používateľské mená môžu obsahovať iba písmená (a-z, A-Z), čísla (0-9) a podčiarkovníky. Používateľské mená nerozlišujú veľkosť písmen. Môžete si vybrať akýkoľvek dostupný 4-ciferný tag od #0000 do #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Používateľské mená môžu obsahovať iba písmená (a-z, A-Z), čísla (0-9) a podčiarkovníky. Používateľské mená nerozlišujú veľkosť písmen. Môžete si vybrať akýkoľvek dostupný 4-ciferný tag od #0001 do #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Medzi $min a $max znakmi';
  }

  @override
  String get validationAllowedChars =>
      'Iba písmená (a-z, A-Z), čísla (0-9) a podčiarkovníky (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Získajte Plutonium na prispôsobenie vášho tagu alebo si ho ponechajte pri zmene používateľského mena';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag je už obsadený';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'FluxerTag $username#$discriminator je už obsadený. Pokračovaním automaticky pregenerujete váš diskriminátor.';
  }

  @override
  String get customTagIsTemporary => 'Vlastný tag je dočasný';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Váš vlastný 4-ciferný tag je k dispozícii iba počas aktívneho predplatného Plutonium. Keď vaše predplatné vyprší dňa $date, váš tag sa po 3-dňovej lehote vráti na náhodne pridelené číslo.';
  }

  @override
  String get customTagTemporaryBody =>
      'Váš vlastný 4-ciferný tag je k dispozícii iba počas aktívneho predplatného Plutonium. Keď vaše predplatné vyprší, váš tag sa po 3-dňovej lehote vráti na náhodne pridelené číslo.';

  @override
  String get iUnderstandContinue => 'Rozumiem, pokračovať';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Ak uložíte tento FluxerTag, váš vlastný 4-ciferný tag sa po skončení vášho predplatného Plutonium vráti na náhodné číslo. Ak sa vaše predplatné neobnoví, budete mať 3-dňovú lehotu, kým sa tag nezmení.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Váš vlastný 4-ciferný tag (#$discriminator) je aktívny počas aktívneho predplatného Plutonium. Ak vaše predplatné skončí alebo sa po 3-dňovej lehote neobnoví, váš tag sa vráti na náhodné číslo.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Prispôsobte si svoj 4-ciferný tag alebo si ho ponechajte pri zmene používateľského mena';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Vaša skúšobná verzia Plutonium vyprší dňa $date. Vylepšite si účet, aby ste si ponechali vlastný tag a získali odznak na svojom profile.';
  }

  @override
  String get premiumTrialActive =>
      'Ste na skúšobnej verzii Plutonium. Vylepšite si účet, aby ste si ponechali vlastný tag a získali odznak na svojom profile.';

  @override
  String get fluxerTagUpdated => 'FluxerTag bol aktualizovaný';

  @override
  String get fluxerTagUpdateFailed =>
      'Nepodarilo sa aktualizovať FluxerTag. Skúste to znova.';

  @override
  String get continueAction => 'Pokračovať';

  @override
  String get profileCustomizationTitle => 'Prispôsobenie profilu';

  @override
  String get profileCustomizationDescription =>
      'Upravte vzhľad svojho profilu a zobrazte si náhľad v reálnom čase';

  @override
  String get usernameLabel => 'Používateľské meno';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Overte si svoj účet, aby ste mohli zmeniť svoj FluxerTag';

  @override
  String get changeFluxerTag => 'Zmeniť FluxerTag';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Prispôsobte si svoj 4-miestny tag (#$discriminator) podľa svojich predstáv pomocou Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Zmeniť používateľské meno a 4-miestny tag';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Váš vlastný tag (#$discriminator) je viazaný na vaše predplatné Plutonium a po jeho vypršaní sa vráti na náhodný tag.';
  }

  @override
  String get displayNameLabel => 'Zobrazované meno';

  @override
  String get pronounsLabel => 'Zájmená';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Zmeniť avatar';

  @override
  String get removeAvatar => 'Odstrániť avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max 10 MB. Odporúčané: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Zmeniť banner';

  @override
  String get removeBanner => 'Odstrániť banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max 10 MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Farba zvýraznenia';

  @override
  String get accentColorDescription =>
      'Prispôsobuje farbu okraja a banneru na vašom profile';

  @override
  String get aboutMeLabel => 'O mne';

  @override
  String get aboutMeHelperText => 'Môžete používať odkazy, emoji a Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Súkromie odznaku Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Ovládajte, ako sa váš odznak Plutonium zobrazuje ostatným';

  @override
  String get hidePlutoniumBadgeLabel => 'Úplne skryť odznak Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Úplne skryte svoj odznak Plutonium pred ostatnými používateľmi';

  @override
  String get hidePlutoniumPurchaseDate => 'Skryť dátum nákupu Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Skryť dátum nákupu Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Odstráňte dátum prvého nákupu Plutonium z vášho odznaku';

  @override
  String get maskVisionaryAsSubscription => 'Skryť Visionary ako predplatné';

  @override
  String get maskVisionaryDescription =>
      'Zobraziť váš Visionary ako bežné predplatné';

  @override
  String get hideVisionaryIdBadge => 'Skryť odznak ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Skryť odznak ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Odstráňte svoj odznak ID Visionary';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Ste v skúšobnej verzii Plutonium — vaše predplatné začína $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Vaše predplatné sa automaticky spustí po skončení skúšobnej verzie. Nevyžaduje sa žiadna akcia.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Ste v skúšobnej verzii Plutonium, ktorá vyprší $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Ste v skúšobnej verzii Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max 10 MB. Odporúčané: 512×512px. Animované avatary (GIF) vyžadujú Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Prispôsobte si svoj profil statickým alebo animovaným obrázkom banneru, aby vynikol.';

  @override
  String get getPlutonium => 'Získať Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Nákupy v aplikácii ešte nie sú na tejto platforme dostupné. Zostaňte naladení — čoskoro!';

  @override
  String get profilePreviewLabel => 'Ukážka';

  @override
  String get profilePreviewMessage => 'Správa';

  @override
  String get profilePreviewMemberSince => 'Členom Fluxer od';

  @override
  String get unclaimedAccountTitle => 'Nevyžiadaný účet';

  @override
  String get unclaimedAccountDescription =>
      'Váš účet ešte nie je vyžiadaný. Bez e-mailu a hesla môžete prísť o prístup. Vyžiadajte si svoj účet teraz, aby ste si ho zabezpečili.';

  @override
  String get claimAccount => 'Vyžiadať účet';

  @override
  String get profileTypeLabel => 'Typ profilu';

  @override
  String get profileTypeGlobal => 'Globálny profil';

  @override
  String get profileTypeGuildDescription =>
      'Upravujete svoj profil pre komunitu. Tento profil bude viditeľný iba v tejto komunite a prepíše váš globálny profil.';

  @override
  String get communityNicknameLabel => 'Prezývka v komunite';

  @override
  String get perGuildPremiumUpsellText =>
      'Prispôsobenie vášho avatara, bannera, akcentovej farby a životopisu pre jednotlivé komunity vyžaduje Plutónium. Pre prezývku komunity a zámená je všetko zadarmo pre každého.';

  @override
  String get avatarModeInherit => 'Použiť globálny profil';

  @override
  String get avatarModeCustom => 'Použiť vlastný obrázok';

  @override
  String get avatarModeUnset => 'Nezobraziť';

  @override
  String get profileSavedToast => 'Profil bol aktualizovaný';

  @override
  String get profileEditButton => 'Upraviť profil';

  @override
  String get profileNoteLabel => 'Poznámka';

  @override
  String get profileNoteVisibility => '(viditeľné iba pre vás)';

  @override
  String get profileNoteEmpty => 'Zatiaľ žiadna poznámka.';

  @override
  String get sudoTitle => 'Overte svoju identitu';

  @override
  String get sudoDescription => 'Táto akcia vyžaduje overenie na pokračovanie.';

  @override
  String get sudoAuthenticatorCode => 'Kód autentifikátora';

  @override
  String get sudoMethodPassword => 'Heslo';

  @override
  String get sudoMethodTotp => 'Autentifikátor';

  @override
  String get sudoVerificationFailed => 'Overenie zlyhalo. Skúste to znova.';

  @override
  String get securityAccountTitle => 'Účet';

  @override
  String get securityAccountDescription =>
      'Spravujte svoju e-mailovú adresu, heslo a nastavenia účtu';

  @override
  String get securitySectionTitle => 'Zabezpečenie';

  @override
  String get securitySectionDescription =>
      'Chráňte svoj účet pomocou dvojfaktorovej autentifikácie a heslových kľúčov';

  @override
  String get securityLoginEmailSectionTitle => 'Nastavenia e-mailu';

  @override
  String get securityLoginEmailSectionDescription =>
      'Spravujte e-mailovú adresu, ktorú používate na prihlásenie do Fluxeru';

  @override
  String get securityLoginEmailAddressLabel => 'E-mailová adresa';

  @override
  String get securityLoginNoEmailSet => 'Nenastavená e-mailová adresa';

  @override
  String get securityLoginChangeEmail => 'Zmeniť e-mail';

  @override
  String get securityLoginAddEmail => 'Pridať e-mail';

  @override
  String get securityLoginReveal => 'Zobraziť';

  @override
  String get securityLoginHide => 'Skryť';

  @override
  String get securityLoginPasswordSectionTitle => 'Heslo';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Zmeňte svoje heslo, aby bol váš účet v bezpečí';

  @override
  String get securityLoginCurrentPasswordLabel => 'Súčasné heslo';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Posledná zmena: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Posledná zmena: Nikdy';

  @override
  String get securityLoginNoPasswordSet => 'Nenastavené heslo';

  @override
  String get securityLoginChangePassword => 'Zmeniť heslo';

  @override
  String get securityLoginSetPassword => 'Nastaviť heslo';

  @override
  String get passwordChangeTitle => 'Zmeniť heslo';

  @override
  String get passwordChangeIntroDescription =>
      'Pred zmenou hesla vám pošleme overovací kód na vašu e-mailovú adresu, aby sme potvrdili vašu totožnosť.';

  @override
  String get passwordChangeStart => 'Začať';

  @override
  String get passwordChangeVerifyTitle => 'Overte svoj e-mail';

  @override
  String get passwordChangeVerifyDescription =>
      'Zadajte overovací kód odoslaný na vašu e-mailovú adresu.';

  @override
  String get passwordChangeVerificationCode => 'Overovací kód';

  @override
  String get passwordChangeVerify => 'Overiť';

  @override
  String get passwordChangeNewPasswordTitle => 'Nastaviť nové heslo';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Nižšie zadajte svoje nové heslo.';

  @override
  String get passwordChangeNewPassword => 'Nové heslo';

  @override
  String get passwordChangeConfirmPassword => 'Potvrdiť nové heslo';

  @override
  String get passwordChangeSubmit => 'Zmeniť heslo';

  @override
  String get passwordChangeSuccess => 'Heslo bolo zmenené';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Heslá sa nezhodujú';

  @override
  String get passwordChangeInvalidCode => 'Neplatný alebo vypršaný kód';

  @override
  String get emailChangeTitle => 'Zmeniť e-mail';

  @override
  String get emailChangeIntroDescription =>
      'Pred zmenou e-mailovej adresy vám pošleme overovacie kódy na overenie vašej identity.';

  @override
  String get emailChangeStart => 'Začať';

  @override
  String get emailChangeVerifyOriginalTitle => 'Overiť aktuálny e-mail';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Zadajte overovací kód odoslaný na vašu aktuálnu e-mailovú adresu.';

  @override
  String get emailChangeNewEmailTitle => 'Zadajte nový e-mail';

  @override
  String get emailChangeNewEmailDescription =>
      'Zadajte novú e-mailovú adresu, ktorú chcete použiť.';

  @override
  String get emailChangeNewEmailLabel => 'Nový e-mail';

  @override
  String get emailChangeNewEmailSubmit => 'Odoslať overovací kód';

  @override
  String get emailChangeVerifyNewTitle => 'Overiť nový e-mail';

  @override
  String get emailChangeVerifyNewDescription =>
      'Zadajte overovací kód odoslaný na vašu novú e-mailovú adresu.';

  @override
  String get emailChangeSuccess => 'E-mail bol zmenený';

  @override
  String get emailChangeInvalidCode => 'Neplatný alebo vypršaný kód';

  @override
  String get resend => 'Znovu odoslať';

  @override
  String resendCountdown(int seconds) {
    return 'Znovu odoslať (${seconds}s)';
  }

  @override
  String get verificationCode => 'Overovací kód';

  @override
  String get verify => 'Overiť';

  @override
  String get enable => 'Povoliť';

  @override
  String get disable => 'Zakázať';

  @override
  String get delete => 'Odstrániť';

  @override
  String get save => 'Uložiť';

  @override
  String get securityTfaSectionTitle => 'Dvojfaktorové overenie';

  @override
  String get securityTfaSectionDescription =>
      'Pridajte k svojmu účtu ďalšiu vrstvu zabezpečenia';

  @override
  String get securityTfaAuthenticatorApp => 'Aplikácia na overenie';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Dvojfaktorové overenie je povolené';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Použite aplikáciu na overenie na generovanie kódov pre dvojfaktorové overenie';

  @override
  String get securityTfaBackupCodes => 'Záložné kódy';

  @override
  String get securityTfaBackupCodesDescription =>
      'Zobraziť a spravovať svoje záložné kódy na obnovenie účtu';

  @override
  String get securityTfaViewCodes => 'Zobraziť kódy';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'Použite passkeys na prihlásenie bez hesla a dvojfaktorové overenie';

  @override
  String get securityPasskeysRegistered => 'Registrované passkeys';

  @override
  String get securityPasskeysNone => 'Neregistrované žiadne passkeys';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$count $_temp0 registrovaných (max 10)';
  }

  @override
  String get securityPasskeysAdd => 'Pridať passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'Pridané: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Naposledy použité: $date';
  }

  @override
  String get securityPasskeysRename => 'Premenovať';

  @override
  String get securityPasskeysDeleteTitle => 'Odstrániť passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Ste si istí, že chcete odstrániť passkey „$name“?';
  }

  @override
  String get securityPasskeyNameTitle => 'Názov passkey';

  @override
  String get securityPasskeyNameLabel => 'Názov passkey';

  @override
  String get securityPasskeyNameHint =>
      'napr. YubiKey, iPhone, pracovný počítač';

  @override
  String get securityPhoneSectionTitle => 'Telefónne číslo';

  @override
  String get securityPhoneSectionDescription =>
      'Spravovať svoje telefónne číslo.';

  @override
  String get securityPhoneLabel => 'Telefónne číslo';

  @override
  String get securityPhoneNone => 'Nie je pridané žiadne telefónne číslo.';

  @override
  String get securityPhoneAdd => 'Pridať telefón';

  @override
  String get securityPhoneRemove => 'Odstrániť';

  @override
  String get securityPhoneRemoveTitle => 'Odstrániť telefónne číslo';

  @override
  String get securityPhoneRemoveDescription =>
      'Ste si istí, že chcete odstrániť svoje telefónne číslo?';

  @override
  String get securityPhoneRemoved => 'Telefónne číslo bolo odstránené';

  @override
  String get securityClaimTitle => 'Bezpečnostné funkcie';

  @override
  String get securityClaimDescription =>
      'Nárokujte si svoj účet, aby ste získali prístup k bezpečnostným funkciám, ako je dvojfaktorová autentizácia a prístupové kľúče.';

  @override
  String get securityVerifyEmailRequired =>
      'Pred nastavením dvojfaktorovej autentizácie, prístupových kľúčov alebo SMS overenia musíte overiť svoju e-mailovú adresu.';

  @override
  String get totpEnableTitle => 'Nastaviť aplikáciu Authenticator';

  @override
  String get totpEnableDescription =>
      'Naskenujte QR kód pomocou svojej aplikácie Authenticator a vygenerujte kódy pre dvojfaktorovú autentizáciu.';

  @override
  String get totpEnableCodeLabel => 'Kód';

  @override
  String get totpEnableCodeHint =>
      'Zadajte 6-miestny kód z vašej aplikácie Authenticator';

  @override
  String get totpEnableSuccess => 'Dvojfaktorová autentizácia bola aktivovaná';

  @override
  String get totpDisableTitle => 'Odstrániť aplikáciu Authenticator';

  @override
  String get totpDisableDescription =>
      'Zadajte 6-miestny kód z vašej aplikácie Authenticator na deaktiváciu dvojfaktorovej autentizácie.';

  @override
  String get totpDisableSuccess => 'Dvojfaktorová autentizácia deaktivovaná';

  @override
  String get backupCodesTitle => 'Záložné kódy';

  @override
  String get backupCodesWarning =>
      'Ak stratíte prístup k svojej aplikácii Authenticator a nebudete mať tieto kódy, budete navždy zablokovaní zo svojho účtu. Stiahnite si ich alebo skopírujte teraz a uložte ich na bezpečné miesto.';

  @override
  String get backupCodesDownload => 'Stiahnuť';

  @override
  String get backupCodesCopy => 'Kopírovať';

  @override
  String get backupCodesCopied => 'Záložné kódy skopírované do schránky';

  @override
  String get backupCodesAcknowledge =>
      'Stiahol/a som si alebo skopíroval/a záložné kódy a uložil/a som ich na bezpečné miesto.';

  @override
  String get backupCodesDone => 'Hotovo';

  @override
  String get backupCodesViewTitle => 'Zobraziť záložné kódy';

  @override
  String get backupCodesViewDescription =>
      'Pred zobrazením záložných kódov môže byť potrebné overenie.';

  @override
  String get phoneAddTitle => 'Pridať telefónne číslo';

  @override
  String get phoneAddLabel => 'Telefónne číslo';

  @override
  String get phoneAddHint => 'Zadajte svoje telefónne číslo';

  @override
  String get phoneAddFooter =>
      'Zadajte svoje telefónne číslo. Pošleme vám overovací kód cez SMS.';

  @override
  String get phoneAddSendCode => 'Odoslať kód';

  @override
  String get phoneVerifyTitle => 'Overiť telefónne číslo';

  @override
  String get phoneVerifyDescription =>
      'Zadajte overovací kód odoslaný na vaše telefónne číslo.';

  @override
  String get phoneAddSuccess => 'Telefónne číslo bolo pridané';

  @override
  String get dangerZoneSectionTitle => 'Nebezpečná zóna';

  @override
  String get dangerZoneSectionDescription => 'Nenávratné a deštruktívne akcie';

  @override
  String get dangerZoneDisableTitle => 'Deaktivovať účet';

  @override
  String get dangerZoneDisableDescription =>
      'Dočasne deaktivujte svoj účet. Môžete ho neskôr znova aktivovať prihlásením.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Deaktivácia vášho účtu vás odhlási zo všetkých relácií. Svoj účet môžete kedykoľvek znova aktivovať opätovným prihlásením.';

  @override
  String get dangerZoneDeleteTitle => 'Odstrániť účet';

  @override
  String get dangerZoneDeleteDescription =>
      'Trvalo odstráňte svoj účet a všetky pridružené údaje. Túto akciu nie je možné vziať späť.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Pred odstránením účtu zrušte svoje aktívne predplatné Plutonium v nastaveniach Plutonium.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Účet nie je možné odstrániť';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Nemôžete odstrániť svoj účet, ak vlastníte komunity. Najprv preneste vlastníctvo nasledujúcich komunít:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'a ešte $count';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Ak chcete preniesť vlastníctvo, prejdite na $settingsPath a použite možnosť prenosu vlastníctva.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Ste si istí, že chcete odstrániť svoj účet? Táto akcia naplánuje váš účet na trvalé odstránenie.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Proces odstránenia môžete zrušiť do 14 dní';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Po 14 dňoch bude váš účet trvalo odstránený';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Po spracovaní odstránenia nebudete môcť získať prístup k svojmu účtu';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Po odstránení účtu nebudete môcť odstrániť svoje odoslané správy';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Ak chcete exportovať svoje údaje alebo najprv odstrániť svoje správy, pred pokračovaním navštívte sekciu Súkromie v Nastaveniach používateľa.';

  @override
  String get claimAccountTitle => 'Nárokujte si svoj účet';

  @override
  String get claimAccountDescription =>
      'Nárokujte si svoj účet pridaním e-mailu a hesla. Pred dokončením vám pošleme overovací kód na potvrdenie vášho e-mailu.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Heslo';

  @override
  String get claimAccountSendCode => 'Odoslať kód';

  @override
  String get claimAccountVerifyDescription =>
      'Zadajte kód, ktorý sme vám poslali na e-mail, na jeho overenie. Vaše heslo bude nastavené po potvrdení kódu.';

  @override
  String get claimAccountSuccess => 'Účet úspešne získaný';

  @override
  String get importantInformation => 'Dôležité informácie:';

  @override
  String get genericError => 'Vyskytla sa chyba';

  @override
  String get invalidCode => 'Neplatný kód';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count rokmi',
      one: 'pred 1 rokom',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count mesiacmi',
      one: 'pred 1 mesiacom',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count dňami',
      one: 'pred 1 dňom',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count hodinami',
      one: 'pred 1 hodinou',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count minútami',
      one: 'pred 1 minútou',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'práve teraz';

  @override
  String get authorizedAppsTitle => 'Autorizované aplikácie';

  @override
  String get authorizedAppsDescription =>
      'Týmto aplikáciám bol udelený prístup k vášmu účtu Fluxer.';

  @override
  String get authorizedAppsEmptyTitle => 'Žiadne autorizované aplikácie';

  @override
  String get authorizedAppsEmptyDescription =>
      'Zatiaľ ste neautorizovali žiadne aplikácie na prístup k vášmu účtu.';

  @override
  String get authorizedAppsLoadError =>
      'Nepodarilo sa načítať autorizované aplikácie';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Autorizované dňa $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Udelené povolenia';

  @override
  String get authorizedAppsRevoke => 'Odvolať';

  @override
  String get authorizedAppsRevokeTitle => 'Odvolať prístup k aplikácii';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Ste si istí, že chcete odvolať prístup pre $appName? Táto aplikácia už nebude mať prístup k vášmu účtu.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Prístup k vašim základným informáciám o profile (používateľské meno, avatar atď.)';

  @override
  String get authorizedAppsScopeEmail => 'Zobraziť vašu e-mailovú adresu';

  @override
  String get authorizedAppsScopeGuilds =>
      'Zobraziť komunity, ktorých ste členom';

  @override
  String get authorizedAppsScopeConnections => 'Zobraziť vaše prepojené účty';

  @override
  String get authorizedAppsScopeBot =>
      'Pridať bota do komunity s požadovanými povoleniami';

  @override
  String get authorizedAppsScopeAdmin =>
      'Prístup k administratívnym koncovým bodom';

  @override
  String get privacyPendingDeletionTitle => 'Čaká sa na odstránenie';

  @override
  String get blockedUsersTitle => 'Blokovaní používatelia';

  @override
  String get blockedUsersDescription =>
      'Blokovaní používatelia vám nemôžu posielať žiadosti o priateľstvo ani vás priamo kontaktovať.';

  @override
  String get blockedUsersEmptyTitle => 'Žiadni blokovaní používatelia';

  @override
  String get blockedUsersEmptyDescription => 'Zatiaľ ste nikoho neblokovali.';

  @override
  String get blockedUsersLoadError =>
      'Nepodarilo sa načítať blokovaných používateľov';

  @override
  String get blockedUsersUnblock => 'Odomknúť';

  @override
  String get blockedUsersUnblockTitle => 'Odomknúť používateľa';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Ste si istí, že chcete odomknúť používateľa $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Skopírovať FluxerTag';

  @override
  String get blockedUsersCopyId => 'Skopírovať ID používateľa';

  @override
  String get userProfileLoadError => 'Nepodarilo sa načítať profil';

  @override
  String get userProfileRetry => 'Skúsiť znova';

  @override
  String get userProfileMessage => 'Správa';

  @override
  String get userProfileVoiceCall => 'Hlasový hovor';

  @override
  String get userProfileVideoCall => 'Videohovor';

  @override
  String get userProfileEditProfile => 'Upraviť profil';

  @override
  String get userProfileStaffBadgeTooltip => 'Personál Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'Tím komunity Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'Partner Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Lovca chýb Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Predplatiteľ Fluxer Plutonium od $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary od $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Visionary #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Spoloční priatelia ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Spoločné komunity ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Spoloční priatelia';

  @override
  String get userProfileMutualCommunitiesTitle => 'Spoločné komunity';

  @override
  String get userProfileNoMutualFriends =>
      'Nenašli sa žiadni spoloční priatelia.';

  @override
  String get userProfileNoMutualCommunities =>
      'Nenašli sa žiadne spoločné komunity.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Prezývka: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Otvoriť DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Blokovali ste používateľa $username. Nebudete môcť posielať správy, pokiaľ ho neodblokujete.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Odblokovať';

  @override
  String get userProfileOpenDm => 'Otvoriť DM';

  @override
  String get userProfileNoteTitle => 'Poznámka';

  @override
  String get userProfileNoteVisibility => '(viditeľné iba pre vás)';

  @override
  String get userProfileNoteSave => 'Uložiť';

  @override
  String get userProfileNoteDelete => 'Odstrániť';

  @override
  String get userProfileNoteEmpty => 'Kliknite sem a pridajte poznámku';

  @override
  String get userProfileMemberSince => 'Členom od';

  @override
  String get userProfileAboutMe => 'O mne';

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
  String get userProfileCopyUsername => 'Skopírovať používateľské meno';

  @override
  String get userProfileCopyUserId => 'Skopírovať ID používateľa';

  @override
  String get userProfileViewMainProfile => 'Zobraziť hlavný profil';

  @override
  String get userProfileViewCommunityProfile => 'Zobraziť komunitný profil';

  @override
  String get userProfileBlockUser => 'Blokovať používateľa';

  @override
  String get userProfileUnblockUser => 'Odblokovať používateľa';

  @override
  String get userProfileRemoveFriend => 'Odstrániť priateľa';

  @override
  String get userProfileBlockConfirmTitle => 'Blokovať používateľa';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Ste si istí, že chcete zablokovať používateľa $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Odblokovať používateľa';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Ste si istí, že chcete odblokovať používateľa $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Odstrániť priateľa';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Ste si istí, že chcete odstrániť používateľa $username z priateľov?';
  }

  @override
  String get userProfileFailedOpenDm => 'Nepodarilo sa otvoriť DM';

  @override
  String get userProfileFailedSaveNote => 'Nepodarilo sa uložiť poznámku';

  @override
  String get userProfileActionFailed => 'Akcia zlyhala, skúste to znova';

  @override
  String get userProfileChangeNickname => 'Zmeniť prezývku';

  @override
  String get userProfileKick => 'Vykázať';

  @override
  String get userProfileBan => 'Zakázať';

  @override
  String get userProfileTimeout => 'Dočasne zablokovať';

  @override
  String get userProfileRemoveTimeout => 'Odstrániť dočasné zablokovanie';

  @override
  String get userProfileTransferOwnership => 'Preniesť vlastníctvo';

  @override
  String get userProfileReportUser => 'Nahlásiť používateľa';

  @override
  String get userProfileReportMessage => 'Nahlásiť správu';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Vykázať používateľa $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Ste si istí, že chcete vykázaním používateľa $username? Môže sa znova pripojiť pomocou nového pozvania.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Odstrániť časový limit?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Odstránením časového limitu umožníte používateľovi $username opäť posielať správy, reagovať a pripájať sa k hlasovým kanálom.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Preniesť vlastníctvo?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Preniesť vlastníctvo tejto komunity na používateľa $username? Toto je nevratné a stratíte všetky práva vlastníka.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Zakázať používateľa $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Trvanie zákazu';

  @override
  String get userProfileBanCustomSecondsLabel => 'Vlastné trvanie (sekundy)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Akékoľvek číslo od $min do $max sekúnd';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Odstrániť históriu správ';

  @override
  String get userProfileBanDeleteNone => 'Neodstrániť žiadne';

  @override
  String get userProfileBanDelete24h => 'Predchádzajúcich 24 hodín';

  @override
  String get userProfileBanDelete7d => 'Predchádzajúcich 7 dní';

  @override
  String get userProfileBanReasonLabel => 'Dôvod (voliteľné)';

  @override
  String get userProfileBanReasonHint => 'Zadajte dôvod zákazu';

  @override
  String get userProfileBanSubmit => 'Zakázať člena';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Časový limit pre používateľa $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Trvanie časového limitu';

  @override
  String get userProfileTimeoutSubmit => 'Nastaviť časový limit člena';

  @override
  String get userProfileNicknameLabel => 'Prezývka';

  @override
  String get userProfileNicknameHint => 'Zadajte prezývku';

  @override
  String get userProfileNicknameSave => 'Uložiť';

  @override
  String userProfileKickSuccess(String username) {
    return 'Používateľ $username bol odstránený';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Používateľ $username bol zakázaný';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Používateľovi $username bol nastavený časový limit';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Časový limit pre používateľa $username bol odstránený';
  }

  @override
  String get userProfileNicknameSuccess => 'Prezývka aktualizovaná';

  @override
  String get userProfileTransferSuccess => 'Vlastníctvo prenesené';

  @override
  String get durationPermanent => 'Trvalo';

  @override
  String get duration60Seconds => '60 sekúnd';

  @override
  String get duration5Minutes => '5 minút';

  @override
  String get duration10Minutes => '10 minút';

  @override
  String get duration1Hour => '1 hodina';

  @override
  String get duration12Hours => '12 hodín';

  @override
  String get duration1Day => '1 deň';

  @override
  String get duration3Days => '3 dni';

  @override
  String get duration5Days => '5 dní';

  @override
  String get duration1Week => '1 týždeň';

  @override
  String get duration2Weeks => '2 týždne';

  @override
  String get duration1Month => '1 mesiac';

  @override
  String get durationCustom => 'Vlastné…';

  @override
  String get iarReportUserTitle => 'Nahlásiť používateľa';

  @override
  String get iarReasonInappropriateProfile => 'Nevhodný profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Profil tohto používateľa obsahuje nevhodný obsah';

  @override
  String typingIndicatorOne(String name) {
    return '$name píše...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 a $name2 píšu...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 a $name3 píšu...';
  }

  @override
  String get typingIndicatorMultiple => 'Niekoľko ľudí píše...';

  @override
  String get typingIndicatorHandful =>
      'Zhromažďuje sa hŕstka písacích bojovníkov...';

  @override
  String get typingIndicatorSymphony => 'Prebieha symfónia kláves...';

  @override
  String get typingIndicatorFiesta => 'Je tu plná písacia fiestá';

  @override
  String get typingIndicatorApocalypse => 'Ach, to je apokalypsa písania';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Tešíme sa, že si tu, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Vitaj, $username! Cíť sa ako doma.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Ahoj, $username! Tešíme sa, že si tu.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Ahoj, $username! Zapoj sa, kedykoľvek budeš pripravený.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Ahoj $username, skvelé ťa tu vidieť!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Ahoj, $username! Dúfame, že sa ti tu bude páčiť.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Ahoj, $username, vitaj na palube!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Tešíme sa, že si dorazil, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Vitaj, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Vitaj, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Vitaj, $username! Sme radi, že si tu.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Vitaj, $username! Dúfame, že si tu užiješ svoj čas.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Vitaj, $username! Tvoja ďalšia konverzácia začína tu.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Vitaj, $username. Sme radi, že ťa tu máme.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Rád ťa vidím, $username! Vitaj.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Si tu, $username! Dobré, že si s nami.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Dorazil si, $username! Poďme začať.';
  }

  @override
  String get relativeTimeShortNow => 'teraz';

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
      other: '$count h',
      one: '1 h',
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
      other: '$count mes',
      one: '1 mes',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count r',
      one: '1 r',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Moje zariadenia';

  @override
  String get linkedDevicesDescription =>
      'Zobrazte všetky zariadenia, ktoré sú momentálne prihlásené do vášho účtu. Zrušte platnosť akýchkoľvek relácií, ktoré nepoznáte.';

  @override
  String get linkedDevicesCurrentDevice => 'Aktuálne zariadenie';

  @override
  String get linkedDevicesOtherDevices => 'Ostatné zariadenia';

  @override
  String get linkedDevicesEnterSelection => 'Režim výberu';

  @override
  String get linkedDevicesExitSelection => 'Ukončiť režim výberu';

  @override
  String get linkedDevicesSelectAll => 'Vybrať všetko';

  @override
  String get linkedDevicesClearSelection => 'Zrušiť výber';

  @override
  String get linkedDevicesRevokeTooltip => 'Zrušiť zariadenie';

  @override
  String get linkedDevicesSignOutAll => 'Odhlásiť všetky ostatné zariadenia';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odhlásiť $count zariadení',
      one: 'Odhlásiť 1 zariadenie',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odhlásiť $count zariadení',
      one: 'Odhlásiť 1 zariadenie',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Odhlásiť všetky ostatné zariadenia';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Týmto sa odhlásia vybrané zariadenia z vášho účtu. Na týchto zariadeniach sa budete musieť znova prihlásiť.',
      one:
          'Týmto sa odhlási vybrané zariadenie z vášho účtu. Na tomto zariadení sa budete musieť znova prihlásiť.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Týmto sa odhlásia vybrané zariadenia z vášho účtu. Na týchto zariadeniach sa budete musieť znova prihlásiť.';

  @override
  String get linkedDevicesSignOutConfirm => 'Pokračovať';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Na všetkých odhlásených zariadeniach sa budete musieť znova prihlásiť';

  @override
  String get linkedDevicesLoadErrorTitle => 'Chyba siete';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Máme problémy s pripojením k časopriestorovému kontinuu. Skontrolujte svoje pripojenie a skúste to znova.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zariadenia boli zrušené',
      one: 'Zariadenie bolo zrušené',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Nepodarilo sa odhlásiť. Skúste to znova.';

  @override
  String get linkedDevicesUnknownOs => 'Neznámy OS';

  @override
  String get linkedDevicesUnknownPlatform => 'Neznáma platforma';

  @override
  String slowmodeLabel(String duration) {
    return '$duration režim spomalenia';
  }

  @override
  String get slowmodeTooltipActive =>
      'Ste v režime spomalenia. Pred odoslaním ďalšej správy počkajte.';

  @override
  String get slowmodeTooltipImmune =>
      'Režim spomalenia je zapnutý, ale ste imúnny.';

  @override
  String get channelNoSendPermissionHint =>
      'Nemôžete posielať správy v tomto kanáli.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Systémové oznámenia od zamestnancov $productName. Tu nemôžete odpovedať.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Posielanie správ je v tejto komunite dočasne pozastavené.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Ste časovo obmedzený. Posielanie správ, reakcie a hlas sú pozastavené, kým časový limit nevyprší.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Musíte si nárokovať svoj účet, aby ste mohli posielať správy v tejto komunite.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Musíte overiť svoj e-mail, aby ste mohli posielať správy v tejto komunite.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Váš účet je príliš nový na posielanie správ v tejto komunite.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Nie ste členom tejto komunity dostatočne dlho na posielanie správ.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Musíte overiť telefónne číslo, aby ste mohli posielať správy v tejto komunite.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Overiť e-mail';

  @override
  String get channelComposerBarrierVerifyPhone => 'Overiť telefón';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Príliš veľa príloh (max $max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Jedna alebo viacero súborov presahuje limit veľkosti';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Tieto súbory sú príliš veľké na odoslanie spolu';

  @override
  String get chatAttachmentDropToUpload => 'Pustite súbory na nahranie';

  @override
  String get chatAttachmentDropToSend => 'Pustite súbory na okamžité odoslanie';

  @override
  String get chatAttachmentSendVoiceMessage => 'Odoslať hlasovú správu';

  @override
  String get voiceMessageTitle => 'Hlasová správa';

  @override
  String get voiceMessageHoldHint =>
      'Podržte na nahrávanie. Potiahnite nahor na uzamknutie alebo uvoľnite na odoslanie.';

  @override
  String get voiceMessageDiscard => 'Zahodiť hlasovú správu';

  @override
  String get voiceMessageSend => 'Odoslať hlasovú správu';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nemožno začať nahrávanie. Povoliť prístup k mikrofónu.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Nahrávanie hlasu nie je na tomto zariadení podporované.';

  @override
  String get voiceMessageMicInUse =>
      'Opustite hlasový hovor a nahrajte hlasovú správu.';

  @override
  String get voiceMessageRecordingFailed =>
      'Nahrávanie zlyhalo. Skúste to znova.';

  @override
  String get voiceMessageSendFailed =>
      'Hlasovú správu sa nepodarilo odoslať. Skúste to znova.';

  @override
  String get voiceMessageRecordingHint =>
      'Hovorte teraz. Po dokončení stlačte Stop – môžete potom orezať.';

  @override
  String get voiceMessageReviewHint =>
      'Potiahnite úchytkami na orezať, potom stlačte Odoslať.';

  @override
  String get voiceMessageStop => 'Stop';

  @override
  String get voiceMessageStartRecording => 'Začať nahrávanie';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Prehrať';

  @override
  String get voiceMessagePause => 'Pozastaviť';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Výber musí mať minimálne $secondsString s.';
  }

  @override
  String get chatAttachmentEditTitle => 'Upraviť prílohu';

  @override
  String get chatAttachmentFilenameLabel => 'Názov súboru';

  @override
  String get chatAttachmentDescriptionLabel => 'Popis';

  @override
  String get chatAttachmentDescriptionHint => 'Voliteľný alternatívny text';

  @override
  String get chatAttachmentSpoilerLabel => 'Označiť ako spojler';

  @override
  String get chatAttachmentRemove => 'Odstrániť prílohu';

  @override
  String get chatAttachmentDownload => 'Stiahnuť';

  @override
  String get chatAttachmentExpiredTooltip => 'Príloha vypršala';

  @override
  String get chatAttachmentSourceGallery => 'Galéria';

  @override
  String get chatAttachmentSourceCamera => 'Fotoaparát';

  @override
  String get chatAttachmentSourceBrowse => 'Prehľadávať súbory';

  @override
  String get chatAttachmentPasteTooltip => 'Prilepiť obrázok zo schránky';

  @override
  String get chatAttachmentSpoiler => 'Spojler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Zobraziť spojler';

  @override
  String get matureMediaRevealButton => 'Zobraziť';

  @override
  String get matureMediaRevealHint => 'Kliknite na zobrazenie';

  @override
  String get matureContentTitle => 'Nevhodný obsah';

  @override
  String get matureCommunityTitle => 'Prehľadná komunita';

  @override
  String get matureCategoryTitle => 'Prehľadná kategória';

  @override
  String get matureChannelTitle => 'Prehľadný kanál';

  @override
  String get communityContentWarningTitle => 'Upozornenie na obsah komunity';

  @override
  String get categoryContentWarningTitle => 'Upozornenie na obsah kategórie';

  @override
  String get channelContentWarningTitle => 'Upozornenie na obsah kanála';

  @override
  String get defaultContentWarningBody => 'Toto obsahuje citlivý obsah.';

  @override
  String get matureCommunityBody =>
      'Táto komunita je označená ako obsah pre dospelých a môže obsahovať materiál, ktorý nemusí byť vhodný pre niektorých používateľov.';

  @override
  String get matureCategoryBody =>
      'Táto kategória je označená ako obsah pre dospelých a môže obsahovať materiál, ktorý nemusí byť vhodný pre niektorých používateľov.';

  @override
  String get matureChannelBody =>
      'Tento kanál je označený ako obsah pre dospelých a môže obsahovať materiál, ktorý nemusí byť vhodný pre niektorých používateľov.';

  @override
  String get matureVoiceChannelBody =>
      'Tento hlasový kanál je označený ako obsah pre dospelých a môže obsahovať materiál, ktorý nemusí byť vhodný pre niektorých používateľov.';

  @override
  String get matureLinkChannelBody =>
      'Tento prepojený kanál je označený ako obsah pre dospelých a môže otvárať materiál, ktorý nemusí byť vhodný pre niektorých používateľov.';

  @override
  String get matureCommunityUnavailableBody =>
      'Táto prehľadná komunita nie je dostupná pre váš účet.';

  @override
  String get matureCategoryUnavailableBody =>
      'Táto prehľadná kategória nie je dostupná pre váš účet.';

  @override
  String get matureChannelUnavailableBody =>
      'Tento prehľadný kanál nie je dostupný pre váš účet.';

  @override
  String get matureContentProceedButton => 'Pokračovať';

  @override
  String get matureContentUnderstandButton => 'Rozumiem';

  @override
  String get matureContentOpenLinkButton => 'Otvoriť prepojenie';

  @override
  String get sensitiveContentSectionTitle => 'Citlivý obsah';

  @override
  String get sensitiveContentSectionDescription =>
      'Ovládajte, ako sa v rôznych kontextoch filtrujú zrelé alebo citlivé médiá';

  @override
  String get sensitiveContentFriendDmLabel => 'Priame správy od priateľov';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Priame správy od ostatných';

  @override
  String get sensitiveContentGuildLabel => 'Správy v komunitných kanáloch';

  @override
  String get sensitiveContentFilterShow => 'Zobraziť';

  @override
  String get sensitiveContentFilterBlur => 'Rozmazať';

  @override
  String get sensitiveContentFilterBlock => 'Blokovať';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Rozmazať médiá až po dokončení bezpečnostnej kontroly';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Keď je táto možnosť zapnutá, obrázky a videá sa rozmazávajú, kým sa nedokončí kontrola bezpečnosti obsahu.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Toto nastavenie je pre váš účet vždy zapnuté.';

  @override
  String get sensitiveContentResetButton => 'Resetovať';

  @override
  String get sensitiveContentSaveButton => 'Uložiť';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count súborov',
      one: '1 súbor',
    );
    return 'Nahrávam $_temp0';
  }

  @override
  String get chatCancelUpload => 'Zrušiť nahrávanie';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Platnosť vyprší $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Platnosť vyprší medzi $start a $end';
  }

  @override
  String get connectionsTitle => 'Pripojenia';

  @override
  String get connectionsDescription =>
      'Prepojte externé účty a domény s vaším profilom Fluxer. Overené pripojenia sa zobrazia vo vašom profile, aby ich mohli vidieť ostatní.';

  @override
  String get connectionsEmptyTitle => 'Zatiaľ žiadne pripojenia';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Prepojte svoj účet Bluesky alebo overte vlastníctvo domény, aby sa zobrazili vo vašom profile.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Overte vlastníctvo domény, aby sa zobrazila vo vašom profile.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Doména';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Pridať pripojenie Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Pridať pripojenie domény';

  @override
  String get connectionEdit => 'Upraviť';

  @override
  String get connectionRemove => 'Odstrániť';

  @override
  String get connectionVerifiedLabel => 'Toto pripojenie bolo overené.';

  @override
  String get connectionUnverifiedLabel => 'Toto pripojenie nebolo overené.';

  @override
  String get connectionAddTitle => 'Pridať pripojenie';

  @override
  String get connectionTypeLabel => 'Typ pripojenia';

  @override
  String get connectionHandleLabel => 'Handle';

  @override
  String get connectionDomainLabel => 'Doména';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Tento účet už máte pripojený.';

  @override
  String get connectionConnectBluesky => 'Pripojiť cez Bluesky';

  @override
  String get connectionContinue => 'Pokračovať';

  @override
  String get connectionVerifyTitle => 'Overiť pripojenie';

  @override
  String get connectionVerifyInstructions =>
      'Pomocou nižšie uvedeného záznamu preukážte vlastníctvo domény.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT záznam';

  @override
  String get connectionDnsHostLabel => 'Hostiteľ';

  @override
  String get connectionDnsValueLabel => 'Hodnota';

  @override
  String get connectionCopyHost => 'Skopírovať hostiteľa';

  @override
  String get connectionCopyValue => 'Skopírovať hodnotu';

  @override
  String get connectionCopied => 'Skopírované!';

  @override
  String get connectionTokenFileTitle => 'Nahrať súbor s tokenom';

  @override
  String get connectionTokenFileDescription =>
      'Stiahnite si súbor **fluxer-verification** a umiestnite ho do svojho priečinka **.well-known**, aby sme mohli overiť doménu.';

  @override
  String get connectionTokenFileDownload => 'Stiahnuť fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Súbor obsahuje overovací token, ktorý načítame z adresy **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Uložiť fluxer-verification';

  @override
  String get connectionVerifyButton => 'Overiť';

  @override
  String get connectionBack => 'Späť';

  @override
  String get connectionEditTitle => 'Upraviť pripojenie';

  @override
  String get connectionEditDescription =>
      'Vyberte, kto môže vidieť toto pripojenie na vašom profile.';

  @override
  String get connectionVisibilityEveryone => 'Každý';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Povoliť komukoľvek vidieť toto pripojenie na vašom profile';

  @override
  String get connectionVisibilityFriends => 'Priatelia';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Povoliť priateľom vidieť toto pripojenie';

  @override
  String get connectionVisibilityCommunityMembers => 'Členovia komunity';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Povoliť členom komunít, ku ktorým patríte, vidieť toto pripojenie';

  @override
  String get connectionRemoveTitle => 'Odstrániť pripojenie';

  @override
  String get connectionRemoveDescription =>
      'Ste si istí, že chcete toto pripojenie odstrániť? Túto akciu nie je možné vziať späť.';

  @override
  String get connectionRemoveConfirm => 'Odstrániť';

  @override
  String get connectionsLoadError => 'Nepodarilo sa načítať pripojenia';

  @override
  String get connectionsReorderError => 'Nepodarilo sa aktualizovať poradie';

  @override
  String get connectionInitiateFailed =>
      'Overenie sa nepodarilo spustiť. Skúste to znova.';

  @override
  String get connectionVerifyFailed =>
      'Nepodarilo sa overiť. Skontrolujte svoj DNS záznam a skúste to znova.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Nepodarilo sa spustiť autorizáciu Bluesky.';

  @override
  String get connectionUpdateFailed => 'Nepodarilo sa aktualizovať pripojenie';

  @override
  String get connectionRemoveFailed => 'Nepodarilo sa odstrániť pripojenie';

  @override
  String get connectionTokenSavedToast =>
      'Súbor fluxer-verification bol uložený';

  @override
  String get connectionTokenSaveFailedToast => 'Nepodarilo sa uložiť súbor';

  @override
  String get connectionEnterHandle => 'Zadajte používateľské meno Bluesky.';

  @override
  String get connectionEnterDomain => 'Zadajte doménu.';

  @override
  String get lookAndFeelTitle => 'Vzhľad a dojem';

  @override
  String get lookAndFeelThemeSectionTitle => 'Téma';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Vyberte si medzi tmavým, uhľovým alebo svetlým vzhľadom.';

  @override
  String get lookAndFeelThemeDark => 'Tmavá téma';

  @override
  String get lookAndFeelThemeCoal => 'Uhoľná téma';

  @override
  String get lookAndFeelThemeLight => 'Svetlá téma';

  @override
  String get lookAndFeelThemeSystem => 'Systémová téma';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Synchronizovať tému na všetkých zariadeniach';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Keď je zapnuté, zmeny motívu sa zosynchronizujú na všetky vaše zariadenia. Keď je vypnuté, toto zariadenie použije vlastné nastavenie motívu.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Systémový motív automaticky vypne synchronizáciu, aby sledoval preferencie vášho systému na tomto zariadení.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Nepodarilo sa synchronizovať motív s vaším účtom. Skúste to znova.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Škálovanie písma chatu';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Upravte veľkosť písma v oblasti chatu.';

  @override
  String get lookAndFeelInterfaceTitle => 'Rozhranie';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Prispôsobte prvky a správanie rozhrania.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indikátory písania v zozname kanálov';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Vyberte, ako sa zobrazujú indikátory písania v zozname kanálov, keď niekto píše v kanáli.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indikátor písania + Avatary';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Zobraziť indikátor písania s používateľskými avatarmi v zozname kanálov';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Len indikátor písania';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Zobraziť len indikátor písania bez avatarov';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Skryté';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Nezobrazovať indikátory písania v zozname kanálov';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Zobraziť písanie vo vybranom kanáli';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Keď je vypnuté (predvolené), indikátory písania sa nezobrazia v kanáli, ktorý práve prezeráte.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'všeobecný';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Nápovedy ku klávesnici';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Ovládajte, či sa nápovedy klávesových skratiek zobrazujú v nástrojových tipoch.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Skryť nápovedy ku klávesnici v nástrojových tipoch';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Keď je zapnuté, odznaky skratiek sú skryté v kontextových oknách.';

  @override
  String get lookAndFeelNekoTitle => 'Rôzne';

  @override
  String get lookAndFeelNekoDescription => 'Rôzne možnosti rozhrania.';

  @override
  String get lookAndFeelShowNekoLabel => 'Zobraziť Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Keď je zapnuté, Neko sa zobrazí v päte chatu.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Správanie pri pripojení do hlasového kanála';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Ovládajte, ako sa pripájate do hlasových kanálov v komunitách.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Vyžadovať dvojklik na pripojenie do hlasových kanálov';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Keď je zapnuté, budete musieť dvakrát kliknúť na hlasové kanály, aby ste sa k nim pripojili. Keď je vypnuté (predvolené), jedným kliknutím sa okamžite pripojíte do kanála.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Rýchla hnedá líška skáče cez lenivého psa.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Bočný panel komunity';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfigurujte, ako bočný panel komunity zobrazuje priame správy.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count komunít je dočasne nedostupných z dôvodu poruchy časového kondenzátora.',
      one:
          '1 komunita je dočasne nedostupná z dôvodu poruchy časového kondenzátora.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'Zbaliť priame správy do priečinka';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Keď je zapnuté, nepričítané priame správy v bočnom paneli komunity sa zbalia do priečinka na tlačidle Fluxer. Kliknutím na tlačidlo Fluxer na stránke priamych správ priečinok rozbalíte alebo zbalíte.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Zoznam kanálov';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Ovládajte správanie indikátora neprečítaných správ pre stlmené kanály v zoznamoch kanálov.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Zobraziť indikátor neprečítaných správ v stlmených kanáloch';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Keď je zapnuté, stlmené kanály zobrazujú slabý indikátor neprečítaných správ na ľavej strane. Upozornenia sa zobrazia bez ohľadu na toto nastavenie.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Práve aktívni';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Ovládajte, ako sa funkcia Práve aktívni zobrazuje v celej aplikácii.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Zobraziť Práve aktívni na domovskej obrazovke';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Zobraziť Práve aktívni na domovskej obrazovke, aby sa zobrazili priatelia aktívni v hlasovom režime. Uvidíte ukážku, kontext kanála, kto už je tam, a rýchly spôsob, ako sa pripojiť.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Obľúbené';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Ovládajte viditeľnosť obľúbených položiek v celej aplikácii.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Povoliť obľúbené';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Keď je zapnuté, môžete označiť kanály ako obľúbené a zobrazia sa v sekcii Obľúbené. Keď je vypnuté, všetky prvky používateľského rozhrania súvisiace s obľúbenými položkami (tlačidlá, položky ponuky) budú skryté. Vaše existujúce obľúbené položky zostanú zachované.';

  @override
  String get favoritesTitle => 'Obľúbené';

  @override
  String get favoritesEmptyTitle => 'Zatiaľ žiadne obľúbené';

  @override
  String get favoritesEmptyDescription =>
      'Obľúbené kanály z hlavičky chatu si sem môžete pripnúť.';

  @override
  String get favoritesWelcomeTitle => 'Vitajte vo obľúbených';

  @override
  String get favoritesWelcomeDescription =>
      'Váš osobný priestor pre rýchly prístup ku kanálom, priamym správam a skupinám, ktoré máte radi. Stlačením hviezdičky pri akomkoľvek kanáli ho sem pridáte.';

  @override
  String get favoritesWelcomeTip => 'Nie je to pre vás? Kedykoľvek to vypnite.';

  @override
  String get favoritesDisableButton => 'Zakázať obľúbené';

  @override
  String get favoritesAddedToast => 'Pridané do obľúbených';

  @override
  String get favoritesRemovedToast => 'Odstránené z obľúbených';

  @override
  String get favoritesHiddenToast => 'Obľúbené skryté';

  @override
  String get favoritesMute => 'Stlmiť obľúbené';

  @override
  String get favoritesUnmute => 'Zrušiť stlmenie obľúbených';

  @override
  String get favoritesHeaderMenu => 'Menu obľúbených';

  @override
  String get favoritesCreateCategory => 'Vytvoriť kategóriu';

  @override
  String get favoritesCategoryNameLabel => 'Názov kategórie';

  @override
  String get favoritesHideMutedChannels => 'Skryť stlmené kanály';

  @override
  String get favoritesShowMutedChannels => 'Zobraziť stlmené kanály';

  @override
  String get favoritesSetNickname => 'Nastaviť prezývku';

  @override
  String get favoritesNicknameLabel => 'Prezývka';

  @override
  String get favoritesSaveNickname => 'Uložiť prezývku';

  @override
  String get favoritesMoveToCategory => 'Presunúť do kategórie';

  @override
  String get favoritesUncategorized => 'Nekategorizované';

  @override
  String get favoritesOtherCategory => 'Iné';

  @override
  String get favoritesRemoveFromFavorites => 'Odstrániť z obľúbených';

  @override
  String get favoritesAddToFavorites => 'Pridať do obľúbených';

  @override
  String get favoritesHideConfirmTitle => 'Skryť obľúbené';

  @override
  String get favoritesHideConfirmDescription =>
      'Týmto sa skryjú všetky prvky používateľského rozhrania súvisiace s obľúbenými, vrátane tlačidiel a položiek menu. Vaše existujúce obľúbené položky zostanú zachované a môžete ich kedykoľvek znova povoliť v Nastaveniach > Pokročilé > Vzhľad.';

  @override
  String get favoritesDirectMessageSubtitle => 'Priama správa';

  @override
  String get messagesMediaDisplayGroupTitle => 'Zobrazenie';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Ovládajte, ako sa zobrazujú správy, médiá a iný obsah.';

  @override
  String get messagesMediaMediaGroupTitle => 'Médiá';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Prispôsobte si preferencie veľkosti médií a tlačidlá.';

  @override
  String get messagesMediaInputGroupTitle => 'Vstup';

  @override
  String get messagesMediaInputGroupDescription =>
      'Prispôsobte si nastavenia vstupu správ.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Bočný panel';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Nakonfigurujte, ako sa zobrazuje bočný panel komunity.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Predvolene skryť stlmené kanály';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automaticky skryť stlmené kanály v bočnom paneli, keď sa pripojíte k novým komunitám';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Predvolene skryť stlmené kanály?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Nové komunity, ku ktorým sa pripojíte, budú mať automaticky skryté stlmené kanály. Chcete toto nastavenie použiť aj na všetky vaše existujúce komunity?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Prestať predvolene skrývať stlmené kanály?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Nové komunity, ku ktorým sa pripojíte, už nebudú mať automaticky skryté stlmené kanály. Chcete zobraziť stlmené kanály aj vo všetkých vašich existujúcich komunitách?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Použiť na všetky komunity';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Zobraziť vo všetkých komunitách';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Len nové komunity';

  @override
  String get messagesMediaDisplaySectionTitle => 'Zobrazenie médií';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Ovládajte, ako sa zobrazujú obrázky, videá a iné médiá. Všetky médiá sa menia veľkosť a konvertujú. Extrémne veľké súbory, ktoré nemožno komprimovať do náhľadu, sa nebudú vkladať bez ohľadu na tieto nastavenia.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Keď sú zverejnené ako odkazy do chatu';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Pri nahrávaní priamo do Fluxeru';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Návrhy odkazov';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Ovládajte, ako sa v chate zobrazujú náhľady webových odkazov';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Zobraziť náhľady a ukážky webových odkazov';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakcie';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Nastaviť emoji reakcie na správy';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Zobraziť emoji reakcie na správach';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Obsah s upozornením';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Ovládať zobrazenie obsahu s upozornením';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Zobraziť obsah s upozornením';

  @override
  String get messagesMediaSpoilersOnClickName => 'Po kliknutí';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Zobraziť obsah s upozornením po kliknutí';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'V kanáloch, ktoré moderujem';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Vždy zobraziť obsah s upozornením v kanáloch, kde máte povolenie „Spravovať správy“';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Vždy';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Vždy zobraziť obsah s upozornením';

  @override
  String get messagesMediaSizeSectionTitle => 'Preferencie veľkosti médií';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Prispôsobte maximálnu veľkosť zobrazenia pre vložené a pripojené médiá. Menšie veľkosti zaberajú menej miesta, zatiaľ čo väčšie zobrazujú viac detailov.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Médiá z odkazov (vložené)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Nahrané prílohy';

  @override
  String get messagesMediaSizeCompactName => 'Kompaktné (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Menšia veľkosť médií';

  @override
  String get messagesMediaSizeComfortableName => 'Pohodlné (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Väčšia veľkosť médií s viac detailmi';

  @override
  String get messagesMediaGifsSectionTitle => 'Správanie GIFov';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Ovládať vkladanie GIFov do chatu';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automaticky poslať GIFy po výbere';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Automatické dopĺňanie výrazov (dopĺňanie dvojbodkou)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Ovládať, čo sa zobrazí v automatickom dopĺňaní výrazov pri písaní dvojbodky. Prispôsobte si návrhy, aby zodpovedali vašim preferenciám.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Zobraziť predvolené emoji v automatickom dopĺňaní výrazov';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Zobraziť vlastné emoji v automatickom dopĺňaní výrazov';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Zobraziť nálepky v automatickom dopĺňaní výrazov';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Zobraziť uložené médiá v automatickom dopĺňaní výrazov';

  @override
  String get messagesMediaEditingSectionTitle => 'Úprava správ';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Ovládať, čo sa stane s vašou rozpracovanou úpravou pri zrušení.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Zachovať rozpracovanú úpravu pri zrušení';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Indikátory neprečítaných správ';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Ovládať zobrazenie indikátorov neprečítaných správ.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Zobraziť tlmený indikátor neprečítaných správ v tichých kanáloch';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Zobraziť stlmený indikátor neprečítaných správ vedľa tichých priamych správ a kanálov, aby ste na prvý pohľad videli aktivitu.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'Ukážky správ v priamych správach';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Ovládať, kedy sa zobrazujú ukážky správ v zozname priamych správ.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Režim ukážky správ v priamych správach';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Všetky správy';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Zobraziť ukážky správ pre všetky konverzácie v priamych správach';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Len neprečítané priame správy';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Zobraziť ukážky správ len pre priame správy s neprečítanými správami';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Žiadne';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Nezobrazovať ukážky správ v zozname priamych správ';

  @override
  String get dmListSentAnAttachment => 'Poslal prílohu';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username pripol správu do tohto kanála.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username pridal používateľa $userName do skupiny.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username pridal niekoho do skupiny.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username opustil skupinu.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username odstránil používateľa $userName zo skupiny.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username odstránil niekoho zo skupiny.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username zmenil názov kanála na $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username zmenil názov kanála.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username zmenil ikonu kanála.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username začal hovor.';
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
  String get voiceConnectionConfirmTitle => 'Potvrdenie hlasového pripojenia';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'K tomuto hlasovému kanálu ste už pripojení z $count ďalších zariadení. Čo chcete urobiť?',
      one:
          'K tomuto hlasovému kanálu ste už pripojení z 1 ďalšieho zariadenia. Čo chcete urobiť?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Prepnúť na toto zariadenie';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Pripojiť sa (ponechať ostatné pripojenia)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Nerobiť nič, nechcem sa pripojiť';

  @override
  String get voiceChannelEmptyDescription =>
      'Toto je hlasový kanál. Pripojte sa a začnite hovoriť!';

  @override
  String get voiceChannelJoin => 'Pripojiť sa k hlasovému kanálu';

  @override
  String get voiceChannelJoinConnect => 'Pripojiť sa k hlasovému kanálu';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nemáte povolenie pripojiť sa k tomuto hlasovému kanálu';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Obsah z mikrofónu, kamery a zdieľania obrazovky je šifrovaný end-to-end.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Obsah z mikrofónu, kamery a zdieľania obrazovky je šifrovaný end-to-end.';

  @override
  String get voiceChannelE2eeBroken =>
      'End-to-end šifrovanie nie je k dispozícii, pretože v tomto hlasovom kanáli je nepodporovaný účastník.';

  @override
  String get voiceCallE2eeBroken =>
      'End-to-end šifrovanie nie je k dispozícii, pretože v tomto hovore je nepodporovaný účastník.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Tento klient musí byť aktualizovaný pred pripojením k tomuto šifrovanému hovoru.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nepodarilo sa spustiť váš mikrofón. V hovore zostávate.';

  @override
  String get voiceChannelStatusConnecting => 'Pripojovanie…';

  @override
  String get voiceChannelStatusConnected => 'Pripojené';

  @override
  String get voiceChannelStatusError => 'Chyba';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobilné zariadenie';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Počítačové zariadenie';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Komunita stlmila';

  @override
  String get voiceParticipantTooltipMuted => 'Stlmené';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'Komunita umlčala';

  @override
  String get voiceParticipantTooltipDeafened => 'Umlčané';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Pripojenie: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count účastníkov',
      one: '1 účastník',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Odísť';

  @override
  String get voiceControlMute => 'Stlmiť';

  @override
  String get voiceControlUnmute => 'Zrušiť stlmenie';

  @override
  String get voiceControlDeafen => 'Umlčať';

  @override
  String get voiceControlUndeafen => 'Zrušiť umlčanie';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Zdieľať obrazovku';

  @override
  String get voiceScreenShareNotificationText => 'Zdieľate svoju obrazovku.';

  @override
  String get voiceControlMore => 'Viac';

  @override
  String get voiceControlDisconnect => 'Odpojiť';

  @override
  String get voiceControlChat => 'Chat';

  @override
  String get voiceTextChatShow => 'Zobraziť chat';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# neprečítanými správami',
      one: '# neprečítanou správou',
    );
    return 'Zobraziť chat s $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Pre video je potrebné povolenie kamery.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nepodarilo sa spustiť zdieľanie obrazovky. Skúste to znova.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Povolenie na zdieľanie obrazovky bolo odmietnuté.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Zdieľanie obrazovky nie je na tomto zariadení k dispozícii.';

  @override
  String get voiceWatchStream => 'Sledovať stream';

  @override
  String get voiceStopWatching => 'Prestať sledovať';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Prestať sledovať aktuálny stream';

  @override
  String get voiceOwnScreenShareTitle => 'Vysielate';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Váš stream je pre účastníkov živý.';

  @override
  String get voiceLiveBadge => 'Živé';

  @override
  String get dmVoiceViewCall => 'Zobraziť hovor';

  @override
  String get dmVoiceCallFullScreen => 'Celá obrazovka';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Otvoriť hovor na celú obrazovku';

  @override
  String get dmVoiceStripStatusConnecting => 'Pripojovanie…';

  @override
  String get dmVoiceStripStatusInCall => 'V hovore';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Hlasový hovor';

  @override
  String get dmVoiceCallBarConnecting => 'Pripojovanie…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Priamy hovor';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Skupinový hovor';

  @override
  String get dmVoiceCallBarIssueFallback => 'Problém s hlasom';

  @override
  String get dmVoiceFullscreenTitle => 'Hlas';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Hlas pripojený';

  @override
  String get notificationsPageTitle => 'Upozornenia';

  @override
  String get notificationsFilterUnreads => 'Neprečítané';

  @override
  String get notificationsFilterMentions => 'Spomienky';

  @override
  String get notificationsBookmarksTooltip => 'Záložky';

  @override
  String get notificationsMentionFilterTooltip => 'Filtrovať spomienky';

  @override
  String get notificationsMentionFiltersTitle => 'Filtre spomienok';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Zahrnúť spomienky @everyone a @here';

  @override
  String get notificationsMentionIncludeRoles => 'Zahrnúť spomienky na roly';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Zahrnúť všetky komunitné spomienky';

  @override
  String get notificationsNoUnreadTitle => 'Žiadne neprečítané správy';

  @override
  String get notificationsNoUnreadBody => 'Všetko ste dohnali.';

  @override
  String get notificationsNoMentionsTitle => 'Žiadne nedávne spomienky';

  @override
  String get notificationsNoMentionsBody =>
      'Všetky spomienky na vás sa tu zobrazia po dobu 7 dní.';

  @override
  String get notificationsMentionsEndTitle => 'Dosiahli ste koniec';

  @override
  String get notificationsMentionsEndBody =>
      'Videli ste všetky svoje nedávne spomienky. Nebojte sa, čoskoro sa tu objavia ďalšie.';

  @override
  String get notificationsJump => 'Prejsť';

  @override
  String get notificationsRemoveMentionTooltip => 'Odstrániť spomienku';

  @override
  String get notificationsViewAllUnread => 'Zobraziť všetky neprečítané';

  @override
  String get notificationsMarkAsRead => 'Označiť ako prečítané';

  @override
  String get notificationsExpand => 'Rozbaliť';

  @override
  String get notificationsCollapse => 'Zbaliť';

  @override
  String get notificationsMessageUnavailable =>
      'Túto správu sa nepodarilo načítať.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining znakov zostáva';
  }

  @override
  String get characterCounterTooLong => 'Správa je príliš dlhá';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining znakov zostáva. Získajte $productName na napísanie až $premiumMaxLength znakov.';
  }

  @override
  String get chatMessageFailedToSend => 'Správu sa nepodarilo odoslať';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Vaša správa nemohla byť doručená. Zvyčajne je to preto, že s príjemcom nezdieľate komunitu alebo príjemca prijíma priame správy iba od priateľov. Možno budete musieť tiež upraviť svoje vlastné nastavenia súkromia priamych správ v časti $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Vaša správa nemohla byť doručená. Na odosielanie priamych správ si musíte účet nárokovať.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Vaša správa nemohla byť doručená. Na odosielanie správ si musíte účet nárokovať.';

  @override
  String get chatSendFailureContentBlocked =>
      'Vaša správa nemohla byť doručená, pretože bola označená našimi bezpečnostnými systémami. Ak si myslíte, že ide o chybu, kontaktujte podporu.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Vaša správa nemohla byť doručená, pretože obsahuje nevhodné emoji alebo nálepky, ktoré nie sú v tomto kontexte povolené.';

  @override
  String get chatClientSystemOnlyYouCanSee => 'Túto správu vidíte iba vy.';

  @override
  String get chatClientSystemDismiss => 'Zavrieť';

  @override
  String get privacyDashboardCommunicationSection => 'Komunikácia';

  @override
  String get chatMessageDeleteFailed => 'Odstránenie správy zlyhalo';

  @override
  String get chatMessageAddReaction => 'Pridať reakciu';

  @override
  String get chatMessageEdit => 'Upraviť správu';

  @override
  String get chatMessageReply => 'Odpovedať';

  @override
  String get chatMessageForward => 'Preposlať';

  @override
  String get forwardMessageTitle => 'Preposlať správu';

  @override
  String get forwardSearchHint => 'Hľadať kanály alebo priame správy';

  @override
  String get forwardDirectMessagesSection => 'Priame správy';

  @override
  String get forwardCommentHint => 'Pridať komentár (voliteľné)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Odoslať ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Nenašli sa žiadne kanály';

  @override
  String get forwardSuccessToast => 'Správa bola preposlaná';

  @override
  String get forwardFailed => 'Preposlanie správy zlyhalo';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Komentáre nie sú k dispozícii, pretože vybraný kanál má zapnutý režim spomalenia.';

  @override
  String get forwardDestinationNoSendPermission =>
      'Sem nemôžete posielať správy';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Sem nemôžete vkladať odkazy';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Sem nemôžete pripájať súbory';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Odosielanie správ je v tejto komunite zakázané';

  @override
  String get forwardDestinationTimedOut =>
      'Ste v tejto komunite v časovom limite';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Režim spomalenia – počkajte $remaining';
  }

  @override
  String get chatMessageCopyText => 'Skopírovať správu';

  @override
  String get chatMessagePin => 'Pripnúť správu';

  @override
  String get chatMessageUnpin => 'Odpnúť správu';

  @override
  String get chatMessageUnpinIt => 'Odpnúť ju';

  @override
  String get chatMessageBookmark => 'Pridať správu do záložiek';

  @override
  String get chatMessageRemoveBookmark => 'Odstrániť záložku správy';

  @override
  String get chatMessageMarkAsUnread => 'Označiť ako neprečítané';

  @override
  String get chatMessageCopyMessageLink => 'Skopírovať odkaz na správu';

  @override
  String get chatMessageCopyMessageId => 'Skopírovať ID správy';

  @override
  String get chatMessageViewReactions => 'Zobraziť reakcie';

  @override
  String get chatMessageRemoveAllReactions => 'Odstrániť všetky reakcie';

  @override
  String get chatMessageDebug => 'Ladiť správu';

  @override
  String get chatMessageDebugSheetTitle => 'Ladenie správy';

  @override
  String get chatMessageDebugCopyJson => 'Skopírovať JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON správy bol skopírovaný do schránky';

  @override
  String get chatReactionsSheetTitle => 'Reakcie';

  @override
  String get chatReactionsSheetEmpty => 'Zatiaľ nikto nereagoval.';

  @override
  String get chatMessageReport => 'Nahlásiť správu';

  @override
  String get iarReportMessageTitle => 'Nahlásiť správu';

  @override
  String get iarThisUserFallback => 'tohto používateľa';

  @override
  String get iarModalDescription =>
      'Nahláste porušenie pravidiel alebo nájdite nástroje na správu kontaktov a preferencií.';

  @override
  String get iarPathStepAriaLabel => 'Čo potrebujete?';

  @override
  String get iarCategoryStepTitle => 'Aký druh pravidla bol porušený?';

  @override
  String get iarReasonStepTitle => 'Ktoré pravidlo bolo porušené?';

  @override
  String get iarReasonSelectHint => 'Vyberte dôvod';

  @override
  String get iarPickAnOptionToast => 'Vyberte možnosť na pokračovanie.';

  @override
  String get iarPickARuleToast => 'Vyberte porušené pravidlo.';

  @override
  String get iarPathPlatform => 'Nahlásiť porušenie pravidiel platformy';

  @override
  String get iarPathCommunity => 'Nahlásiť moderátorom tejto komunity';

  @override
  String get iarPathPreferenceMessage => 'Nepáči sa mi tento obsah';

  @override
  String get iarCategoryTargetedHarmLabel =>
      'Vyhrážky, obťažovanie alebo škoda';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Šikanovanie, vyhrážky, nenávisť, násilie, nájazdy alebo obsah podporujúci sebapoškodzovanie.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Bezpečnosť detí alebo chúlostivý obsah';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Ohrozené deti, chúlostivý obsah na nesprávnom mieste alebo nevítané správanie.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Súkromie alebo vydávanie sa za inú osobu';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Zverejnenie osobných údajov, sledovanie, vydávanie sa za niekoho alebo nevhodný profil.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Podvody, škodlivý softvér alebo dezinformácie';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, podvody, škodlivé odkazy alebo falošné tvrdenia, ktoré pravdepodobne spôsobia škodu v reálnom svete.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Nezákonná činnosť alebo niečo iné';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Nezákonný predaj, uľahčovanie trestnej činnosti alebo zjavné porušenie pravidiel, ktoré nezodpovedá vyššie uvedeným kategóriám.';

  @override
  String get iarReasonHarassmentLabel => 'Obťažovanie alebo vyhrážky';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Šikanovanie, opakovaný nežiaduci kontakt, sledovanie alebo cielené urážky.';

  @override
  String get iarReasonHateLabel => 'Nenávistné prejavy';

  @override
  String get iarReasonHateMessageDescription =>
      'Urážky, dehumanizujúci jazyk alebo útoky na chránené skupiny.';

  @override
  String get iarReasonViolenceLabel => 'Násilie alebo vyhrážky násilím';

  @override
  String get iarReasonViolenceDescription =>
      'Dôveryhodné vyhrážky, grafické násilie alebo glorifikácia násilia.';

  @override
  String get iarReasonMatureContentLabel =>
      'Obsah pre dospelých alebo obťažovanie';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Nevítané správanie alebo obsah pre dospelých na nesprávnom mieste.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Bezpečnosť detí alebo vykorisťovanie maloletých';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Obsah týkajúci sa groomingu alebo vykorisťovania detí.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Škodlivé dezinformácie';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Falošné tvrdenia, ktoré pravdepodobne spôsobia škodu v reálnom svete.';

  @override
  String get iarReasonSpamLabel => 'Spam, podvody alebo phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Hromadný spam, podvody, falošné súťaže alebo zneužitie účtu.';

  @override
  String get iarReasonMalwareLabel =>
      'Škodlivý softvér alebo nebezpečné odkazy';

  @override
  String get iarReasonMalwareDescription =>
      'Škodlivý softvér, krádež prihlasovacích údajov alebo škodlivé súbory.';

  @override
  String get iarReasonPrivacyLabel => 'Porušenie súkromia';

  @override
  String get iarReasonPrivacyDescription =>
      'Zverejnenie osobných údajov, odhalenie súkromných informácií alebo sledovanie.';

  @override
  String get iarReasonImpersonationLabel =>
      'Vydávanie sa za inú osobu alebo klamlivé médiá';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Vydávanie sa za niekoho iného, vrátane klamlivého obsahu generovaného umelou inteligenciou.';

  @override
  String get iarReasonIllegalLabel => 'Nezákonná činnosť';

  @override
  String get iarReasonIllegalDescription =>
      'Nezákonný predaj, uľahčovanie trestnej činnosti alebo nezákonná činnosť.';

  @override
  String get iarReasonSelfHarmLabel => 'Sebapoškodzovanie alebo samovražda';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Propagácia alebo návod na sebapoškodzovanie alebo poruchy príjmu potravy.';

  @override
  String get iarReasonOtherLabel => 'Iné zjavné porušenie pravidiel';

  @override
  String get iarReasonOtherDescription =>
      'Použite iba v prípade, že jasne porušuje pravidlá Fluxeru a nezodpovedá vyššie uvedeným kategóriám.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Ak sa týka maloletých, namiesto toho použite „$childSafetyReason“.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Ak sa to týka CSAM alebo vykorisťovania maloletých, odošlite to teraz a nezdieľajte materiál znova.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Ak je niekto v bezprostrednom nebezpečenstve, ak je to bezpečné, kontaktujte miestne pohotovostné služby.';

  @override
  String get iarSafetyNoteViolence =>
      'Ak ide o dôveryhodnú bezprostrednú hrozbu, kontaktujte tiež miestne pohotovostné služby.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Ak ide o bezprostrednú teroristickú hrozbu, kontaktujte tiež miestne pohotovostné služby.';

  @override
  String get iarActionBlockUserTitle => 'Blokovať tohto používateľa';

  @override
  String get iarActionBlockUserDescription =>
      'Zastaviť správy a žiadosti o priateľstvo.';

  @override
  String get iarActionBlockUserButton => 'Blokovať';

  @override
  String get iarActionCopyMessageLinkTitle => 'Skopírovať odkaz na správu';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Zdieľajte s moderátormi komunity.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopírovať';

  @override
  String get iarActionCloseDmTitle => 'Zavrieť tento priamy rozhovor';

  @override
  String get iarActionCloseDmDescription =>
      'Nezablokuje. Môžete ho znova otvoriť neskôr.';

  @override
  String get iarActionCloseDmButton => 'Zavrieť DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Opustiť komunitu';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Prestaňte vidieť jej obsah a členov.';

  @override
  String get iarActionLeaveCommunityButton => 'Opustiť';

  @override
  String get iarActionDmSettingsTitle =>
      'Nastavenia DM a žiadostí o priateľstvo';

  @override
  String get iarActionDmSettingsDescription =>
      'Zmeňte, kto vás môže kontaktovať.';

  @override
  String get iarActionCallSettingsTitle =>
      'Nastavenia hovorov a skupinových chatov';

  @override
  String get iarActionCallSettingsDescription =>
      'Zmeňte, kto vám môže volať alebo vás pridať.';

  @override
  String get iarActionOpenButton => 'Otvoriť';

  @override
  String get iarActionDeleteMessageTitle => 'Odstrániť túto správu';

  @override
  String get iarActionDeleteMessageDescription =>
      'Odstráňte ju z kanála pre všetkých.';

  @override
  String get iarActionDeleteMessageButton => 'Odstrániť';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Odstránené';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Táto správa už bola odstránená.';

  @override
  String get iarActionBanUserTitle => 'Zablokovať tohto používateľa';

  @override
  String get iarActionBanUserDescription =>
      'Otvoriť dialógové okno zablokovania pre túto komunitu.';

  @override
  String get iarActionBanUserButton => 'Zablokovať';

  @override
  String get iarActionBanUserBannedButton => 'Zablokovaný';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Tento používateľ je už z komunity zablokovaný.';

  @override
  String get iarCloseDmConfirmTitle => 'Zavrieť DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Zavrite váš aktuálny DM s $name. Toto ich neblokuje; môžete ich znova otvoriť neskôr.';
  }

  @override
  String get iarSuccessTitle => 'Nahlásenie odoslané';

  @override
  String get iarSuccessBody =>
      'Náš bezpečnostný tím ho preveruje. Pošleme vám DM a e-mail, keď dospejeme k verdiktu.';

  @override
  String get iarAlreadyReportedTitle => 'Už nahlásené';

  @override
  String get iarAlreadyReportedBody =>
      'Túto správu ste už nahlásili. Náš bezpečnostný tím ju preveruje.';

  @override
  String get iarBackButton => 'Späť';

  @override
  String get iarContinueButton => 'Pokračovať';

  @override
  String get iarSendReportButton => 'Odoslať nahlásenie';

  @override
  String get iarDoneButton => 'Hotovo';

  @override
  String get iarCouldntSendToast =>
      'Nahlásenie sa nepodarilo odoslať. Skúste to znova.';

  @override
  String get iarRateLimitedToast =>
      'Nahlásujete príliš rýchlo. Počkajte chvíľu a skúste to znova.';

  @override
  String get iarReportSentToast =>
      'Nahlásenie odoslané. Náš bezpečnostný tím ho preverí.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Zablokovať $name? Nebude vám môcť posielať správy ani posielať žiadosti o priateľstvo. Môžete ich neskôr odblokovať.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Nepodarilo sa zablokovať tohto používateľa. Skúste to znova.';

  @override
  String get iarCloseDmSuccessToast => 'DM bol zatvorený.';

  @override
  String get iarCloseDmFailedToast =>
      'Nepodarilo sa zavrieť tento DM. Skúste to znova.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Nepodarilo sa opustiť túto komunitu. Skúste to znova.';

  @override
  String get chatMessageSuppressEmbeds => 'Potlačiť náhľady';

  @override
  String get chatMessageUnsuppressEmbeds => 'Zobraziť náhľady';

  @override
  String get chatMessageDelete => 'Odstrániť správu';

  @override
  String get chatMessageDeleteConfirmTitle => 'Odstrániť správu';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Ste si istí, že chcete odstrániť túto správu?';

  @override
  String get chatMessageMore => 'Viac';

  @override
  String get chatEditingMessage => 'Upravuje sa správa';

  @override
  String get chatReplyOriginalDeleted => 'Pôvodná správa bola odstránená';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Pôvodnú správu sa nepodarilo načítať';

  @override
  String get chatReplyAttachedMedia => 'Správa obsahuje priložené médiá';

  @override
  String get chatMessagesLoadError => 'Nepodarilo sa načítať správy.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Prepísať preferenciu upozornenia?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return 'Autor $authorNickname preferuje @upozornenia pri odpovediach. Napriek tomu poslať bez upozornenia?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname preferuje odpovede bez označenia @. Napriek tomu poslať s označením?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Ignorovať preferenciu';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Kliknutím zakážete upozornenie používateľa, ktorému odpovedáte.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Kliknutím povolíte upozornenie používateľa, ktorému odpovedáte.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Označit používateľa, ktorému odpovedáte';

  @override
  String get chatReplyMentionOn => 'Zapnuté';

  @override
  String get chatReplyMentionOff => 'Vypnuté';

  @override
  String get chatReplyCancel => 'Zrušiť odpoveď';

  @override
  String get chatEditMessageHint => 'Upraviť správu';

  @override
  String get chatEditNoChanges => 'Žiadne zmeny na uloženie';

  @override
  String get chatChannelNotReady =>
      'Tento kanál ešte nie je pripravený. Skúste to znova o chvíľu.';

  @override
  String get chatMessageEdited => '(upravené)';

  @override
  String get chatMessageSilent => 'Toto bola @silent správa.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Dnes o $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Včera o $time';
  }

  @override
  String get mediaViewerImagePreview => 'Náhľad obrázka';

  @override
  String get mediaViewerClose => 'Zavrieť prehliadač médií';

  @override
  String get mediaViewerOpenInBrowser => 'Otvoriť v prehliadači';

  @override
  String get mediaViewerForward => 'Poslať ďalej';

  @override
  String get mediaViewerZoomIn => 'Priblížiť';

  @override
  String get mediaViewerZoomOut => 'Oddialiť';

  @override
  String get mediaViewerPreviousAttachment => 'Predchádzajúci príloha';

  @override
  String get mediaViewerNextAttachment => 'Ďalšia príloha';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls =>
      'Prepnúť ovládacie prvky videa';

  @override
  String get chatAttachmentVideoMute => 'Stlmiť video';

  @override
  String get chatAttachmentVideoUnmute => 'Zapnúť zvuk videa';

  @override
  String get chatAttachmentVideoPlay => 'Prehrať video';

  @override
  String get chatAttachmentVideoPause => 'Pozastaviť video';

  @override
  String get chatAttachmentVideoProgress => 'Priebeh videa';

  @override
  String get chatVideoPlaybackFailed => 'Toto video sa nepodarilo prehrať.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Upozorniť používateľov s touto rolou, ktorí majú povolenie zobraziť tento kanál.';

  @override
  String get addGuildModalTitle => 'Pridať komunitu';

  @override
  String get addGuildModalLandingDescription =>
      'Vytvorte novú komunitu alebo sa pripojte k existujúcej.';

  @override
  String get addGuildCreateCommunity => 'Vytvoriť komunitu';

  @override
  String get addGuildJoinCommunity => 'Pripojiť sa ku komunite';

  @override
  String get addGuildImportDiscordTemplate => 'Importovať šablónu Discordu';

  @override
  String get addGuildJoinTitle => 'Pripojiť sa ku komunite';

  @override
  String get addGuildJoinDescription =>
      'Zadajte odkaz na pozvánku na pripojenie ku komunite.';

  @override
  String get addGuildInviteLinkLabel => 'Odkaz na pozvánku';

  @override
  String get addGuildJoinSubmit => 'Pripojiť sa ku komunite';

  @override
  String get addGuildInviteInvalid =>
      'Táto pozvánka je neplatná alebo vypršala.';

  @override
  String get addGuildJoinFailed =>
      'Nepodarilo sa pripojiť ku komunite. Skúste to znova.';

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
  String get addGuildPackInstalled => 'Balík bol úspešne nainštalovaný.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Odstrániť všetky reakcie';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Ste si istí, že chcete odstrániť všetky reakcie z tejto správy?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Odopnúť správu';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Poslať túto pripnutú správu späť v čase?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username pripol $messageLink do tohto kanála. Pozrite si $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'správu';

  @override
  String get systemPinMessageAllPinsLink => 'všetky pripnuté správy';

  @override
  String get channelPinsEmptyTitle => 'Žiadne pripnuté správy';

  @override
  String get channelPinsEmptyDescription => 'Pripnuté správy sa zobrazia tu.';

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
  String get personalNotesTitle => 'Osobné poznámky';

  @override
  String get personalNotesSubtitle =>
      'Váš súkromný priestor na myšlienky a pripomienky';

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
    return 'Vitajte v $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Na začiatku nebolo nič. Potom prišiel $channelName. A bolo to dobré.';
  }

  @override
  String get personalNotesComposerHint => 'Napíšte si správu';

  @override
  String get personalNotesPrivateSpace => 'Váš súkromný priestor';

  @override
  String get purgePersonalNotes => 'Odstrániť osobné poznámky';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Týmto natrvalo odstránite každú správu a prílohu vo svojich osobných poznámkach. Toto sa nedá vziať späť.';

  @override
  String get purgePersonalNotesConfirmButton => 'Odstrániť';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Odstránených $count správ z osobných poznámok';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'Osobné poznámky boli už prázdne';

  @override
  String get purgePersonalNotesFailed =>
      'Nepodarilo sa vyčistiť osobné poznámky';

  @override
  String get userSettingsGroupYourAccount => 'VÁŠ ÚČET';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Zabezpečenie a prihlásenie';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Darčeky a kódy';

  @override
  String get userSettingsNavExpressionPacks => 'Balíky výrazov';

  @override
  String get userSettingsNavPrivacyDashboard => 'Panel ochrany osobných údajov';

  @override
  String get userSettingsNavAuthorizedApps => 'Autorizované aplikácie';

  @override
  String get userSettingsNavBlockedUsers => 'Blokovaní používatelia';

  @override
  String get userSettingsNavLinkedDevices => 'Prepojené zariadenia';

  @override
  String get userSettingsNavConnections => 'Pripojenia';

  @override
  String get userSettingsNavLookAndFeel => 'Vzhľad';

  @override
  String get userSettingsNavAccessibility => 'Prístupnosť';

  @override
  String get userSettingsNavMessagesAndMedia => 'Správy a médiá';

  @override
  String get userSettingsNavAudioAndVideo => 'Zvuk a video';

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
  String get userSettingsNavSoundsAndAlerts => 'Zvuky a upozornenia';

  @override
  String get userSettingsNavLanguageAndTime => 'Jazyk a čas';

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
  String get userSettingsNavAdvanced => 'Pokročilé';

  @override
  String get advancedPerformanceReportingTitle => 'Hlásenie výkonu';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Pomôžte vylepšiť Fluxer zdieľaním anonymných údajov o pádoch a výkone.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Odosielať hlásenia o pádoch a výkone';

  @override
  String get advancedPerformanceReportingDescription =>
      'Všetky hlásené údaje sú anonymné a odosielajú sa iba do vlastnej monitorovacej služby Fluxeru — nepoužívajú sa žiadni poskytovatelia tretích strán.';

  @override
  String get userSettingsNavApplications => 'Aplikácie';

  @override
  String get userSettingsNavAppLogs => 'Záznamy aplikácie';

  @override
  String get userSettingsNavDeveloperTools => 'Nástroje pre vývojárov';

  @override
  String get userSettingsNavLimitsConfig => 'Konfigurácia limitov';

  @override
  String get userSettingsNavFeatureFlags => 'Príznaky funkcií';

  @override
  String get userSettingsNavWhatsNew => 'Čo je nové';

  @override
  String get userSettingsNavLogOut => 'Odhlásiť sa';

  @override
  String get betaWarningTitle => 'Beta softvér';

  @override
  String get betaWarningMessage =>
      'Toto je beta softvér. Nie všetko je dokončené alebo pridané.';

  @override
  String get betaWarningReportIssues =>
      'Prosím, nahláste akékoľvek problémy, ktoré nájdete, komunite Fluxer Mobile (momentálne sa môžete pripojiť do komunity iba s Plutonium).';

  @override
  String get betaWarningRepoLink => 'Zobraziť zdroj na GitHub';

  @override
  String get betaWarningGotIt => 'Rozumiem';

  @override
  String get quickSwitcherTabSearch => 'Hľadať';

  @override
  String get quickSwitcherTabFriends => 'Priatelia';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Hľadať kanály, ľudí alebo komunity';

  @override
  String get quickSwitcherSearchFriends => 'Hľadať priateľov';

  @override
  String get quickSwitcherNoMatchesFound => 'Nenašli sa žiadne výsledky';

  @override
  String get quickSwitcherEmptyHint =>
      'Skúste iné meno alebo použite predpony @ / # / ! / * na filtrovanie výsledkov.';

  @override
  String get quickSwitcherSectionPeople => 'Ľudia';

  @override
  String get quickSwitcherSectionGroupMessages => 'Skupinové správy';

  @override
  String get quickSwitcherSectionTextChannels => 'Textové kanály';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Hlasové kanály';

  @override
  String get quickSwitcherSectionCommunities => 'Komunity';

  @override
  String get quickSwitcherSectionSettings => 'Nastavenia';

  @override
  String get quickSwitcherHomeLabel => 'Domov';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Priame správy';

  @override
  String get quickSwitcherFavoritesLabel => 'Obľúbené';

  @override
  String get quickSwitcherUserSettingsLabel => 'Nastavenia používateľa';

  @override
  String get quickSwitcherNotificationsLabel => 'Upozornenia';

  @override
  String get quickSwitcherBookmarksLabel => 'Záložky';

  @override
  String get quickSwitcherMentionsLabel => 'Spomienky';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Zatiaľ žiadni priatelia';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Pridajte priateľa a začnite.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Žiadni priatelia nezodpovedajú vyhľadávaniu';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Skúste iné meno.';

  @override
  String get quickSwitcherSearchAliasUser => 'Používateľ';

  @override
  String get quickSwitcherSearchAliasYou => 'Vy';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Správy';

  @override
  String get quickSwitcherSearchAliasMessages => 'Správy';

  @override
  String get quickSwitcherSearchAliasFav => 'Obľúbené';

  @override
  String get quickSwitcherSearchAliasStarred => 'Obľúbené';

  @override
  String get quickSwitcherSearchAliasInbox => 'Doručené';

  @override
  String get quickSwitcherSearchAliasSaved => 'Uložené';

  @override
  String get uiClose => 'Zavrieť';

  @override
  String get chatJumpToBottom => 'Prejsť na koniec';

  @override
  String get uiConfirm => 'Potvrdiť';

  @override
  String get uiLoading => 'Načítava sa';

  @override
  String get uiUnsavedChanges => 'Nezmenené zmeny';

  @override
  String get uiReset => 'Resetovať';

  @override
  String get uiOpenColorPicker => 'Otvoriť výber farieb';

  @override
  String get uiSelectPlaceholder => 'Vybrať';

  @override
  String get uiSearchPlaceholder => 'Hľadať';

  @override
  String get uiNoOptionsFound => 'Nenašli sa žiadne možnosti';

  @override
  String get uiDismissNotification => 'Zavrieť upozornenie';

  @override
  String get uiColorPickerTitle => 'Výber farieb';

  @override
  String get mentionConfirmTitle => 'Spomenúť všetkých?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Toto upozorní $count členov. Pokračovať?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Toto upozorní $count online členov. Pokračovať?';
  }

  @override
  String get mentionConfirmButton => 'Spomenúť';

  @override
  String get composerEmojiUnavailable => 'Túto emotikonu tu nemôžete použiť.';

  @override
  String get instanceUrlLabel => 'URL inštancie';

  @override
  String get instanceUrlPlaceholder =>
      'Zadajte URL inštancie (napr. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Resetovať na Fluxer';

  @override
  String get instanceConnect => 'Pripojiť';

  @override
  String get instanceConnecting => 'Pripojenie…';

  @override
  String get instanceConnectFailed => 'Nepodarilo sa pripojiť k inštancii';

  @override
  String get recentInstances => 'Nedávne inštancie';

  @override
  String removeRecentInstance(String domain) {
    return 'Odstrániť $domain z nedávnych inštancií';
  }

  @override
  String get instanceSheetTitle => 'Pripojiť sa k inštancii';

  @override
  String get connectToDifferentInstance => 'Pripojiť sa k inej inštancii';

  @override
  String get changeInstance => 'Zmeniť';

  @override
  String get instanceConnectionRequired =>
      'Pripojte sa k inštancii na prihlásenie';

  @override
  String get comingSoon => 'Čoskoro';

  @override
  String get guildNavbarDirectMessages => 'Priame správy';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Preskúmať objaviteľné komunity';

  @override
  String get discoveryExplore => 'Preskúmať';

  @override
  String get discoveryExplorePublicCommunities => 'Preskúmať verejné komunity';

  @override
  String get discoveryListingSubheading =>
      'Chcete svoju komunitu uviesť tu? Požiadajte, ak spĺňate požiadavky v nastaveniach vašej komunity > Objavovanie.';

  @override
  String get discoverySearchCommunities => 'Hľadať komunity';

  @override
  String get discoveryFilterByLanguage => 'Filtrovať podľa jazyka';

  @override
  String get discoveryAllLanguages => 'Všetky jazyky';

  @override
  String get discoveryAllCategories => 'Všetky';

  @override
  String get discoveryCategoryGaming => 'Hranie hier';

  @override
  String get discoveryCategoryMusic => 'Hudba';

  @override
  String get discoveryCategoryEntertainment => 'Zábava';

  @override
  String get discoveryCategoryEducation => 'Vzdelávanie';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Veda a technika';

  @override
  String get discoveryCategoryContentCreator => 'Tvorca obsahu';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime a manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmy a TV';

  @override
  String get discoveryCategoryOther => 'Iné';

  @override
  String get discoveryNoCommunitiesMatch => 'Žiadne komunity sa nezhodujú.';

  @override
  String get discoveryJoinCommunity => 'Pripojiť sa ku komunite';

  @override
  String get discoveryJoined => 'Pripojený';

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
      other: '$countString členov',
      one: '1 člen',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Bez popisu.';

  @override
  String get discoveryCommunities => 'Komunity';

  @override
  String get discoveryApps => 'Aplikácie';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Nepodarilo sa pripojiť k tejto komunite';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Niečo sa pokazilo. Skúste to znova o chvíľu.';

  @override
  String get discoveryJoinErrorFullTitle => 'Táto komunita je plná';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Táto komunita dosiahla limit členov, takže sa momentálne nemôžete pripojiť.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Dosiahli ste limit komunít';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Ste v maximálnom počte komunít. Opustite jednu a skúste to znova.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Nemôžete sa pripojiť k tejto komunite';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Boli ste z tejto komunity zabanovaný.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Táto komunita už nie je k dispozícii';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Možno opustila objavovanie alebo zakázala nové pripojenia. Obnovte stránku a už ju neuvidíte.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Ste príliš rýchly';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Počkajte chvíľu a skúste to znova.';

  @override
  String get guildNavbarAddCommunity => 'Pridať komunitu';

  @override
  String get guildNavbarHelp => 'Pomoc';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'NOVÁ SPRÁVA';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Zbaliť $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Skupinový DM';

  @override
  String get guildNavbarCreateChannel => 'Vytvoriť kanál';

  @override
  String get guildNavbarChannelType => 'Typ kanála';

  @override
  String get guildNavbarTextChannel => 'Textový kanál';

  @override
  String get guildNavbarTextChannelDescription =>
      'Odosielajte správy, obrázky, GIFy a emotikony';

  @override
  String get guildNavbarVoiceChannel => 'Hlasový kanál';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Stretnite sa spolu pomocou hlasu, videa a zdieľania obrazovky';

  @override
  String get guildNavbarLinkChannel => 'Odkaz na kanál';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Rýchly prístup k externému webu alebo zdroju';

  @override
  String get guildNavbarNameLabel => 'Názov';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarCreateCategory => 'Vytvoriť kategóriu';

  @override
  String get guildNavbarNewCategoryHint => 'Nová kategória';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Pozvite priateľov do $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Príjemcovia budú presmerovaní na #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Hľadať priateľov';

  @override
  String get guildNavbarNoFriendsYet => 'Zatiaľ žiadni priatelia';

  @override
  String get guildNavbarNoResults => 'Žiadne výsledky';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Alebo pošlite odkaz na pozvánku priateľovi:';

  @override
  String get guildNavbarInviteLink => 'Odkaz na pozvánku';

  @override
  String get guildNavbarCopy => 'Kopírovať';

  @override
  String get guildNavbarCopied => 'Skopírované!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Váš odkaz na pozvánku vyprší o 7 dní.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Tento odkaz na pozvánku nikdy nevyprší.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Váš odkaz na pozvánku vyprší po $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Upraviť odkaz na pozvánku';

  @override
  String get guildNavbarInviteLinkSettings => 'Nastavenia odkazu na pozvánku';

  @override
  String get guildNavbarExpireAfter => 'Vypršať po';

  @override
  String get guildNavbarMaxUses => 'Maximálny počet použití';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Udeľte dočasné členstvo';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Členovia budú odstránení, keď budú offline, pokiaľ im nebude pridelená rola';

  @override
  String get guildNavbarCreateNewLink => 'Vytvoriť nový odkaz';

  @override
  String get guildNavbarSent => 'Odoslané';

  @override
  String get guildNavbarInvite => 'Pozvať';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Opustiť komunitu';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Ste si istí, že chcete opustiť túto komunitu? Nebudete môcť vidieť žiadne správy.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Opustiť komunitu';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Odstrániť vaše správy v tejto komunite?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Trvalo odstráňte každú správu, ktorú ste tu poslali, naprieč všetkými kanálmi. Nedá sa vrátiť späť.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Odstrániť moje správy';

  @override
  String get guildNavbarDeletedYourMessages => 'Vaše správy boli odstránené';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Vaše správy sa nepodarilo odstrániť';

  @override
  String get guildNavbarRemoveOverride => 'Odstrániť prepísanie';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Stlmené do $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Prístupné iba pre zamestnancov Fluxer';

  @override
  String get guildNavbarInvitesPaused =>
      'Pozvánky sú v tejto komunite momentálne pozastavené';

  @override
  String get guildNavbarDurationNever => 'nikdy';

  @override
  String get guildNavbarDuration30Minutes => '30 minút';

  @override
  String get guildNavbarDuration1Hour => '1 hodina';

  @override
  String get guildNavbarDuration6Hours => '6 hodín';

  @override
  String get guildNavbarDuration12Hours => '12 hodín';

  @override
  String get guildNavbarDuration1Day => '1 deň';

  @override
  String get guildNavbarDuration7Days => '7 dní';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count sekúnd';
  }

  @override
  String get guildNavbarNever => 'Nikdy';

  @override
  String get guildNavbarNoLimit => 'Bez limitu';

  @override
  String get guildNavbarOneUse => '1 použitie';

  @override
  String guildNavbarUses(int count) {
    return '$count použití';
  }

  @override
  String get guildMenuMarkAsRead => 'Označiť ako prečítané';

  @override
  String get guildPeekMoreOptions => 'Viac možností';

  @override
  String get guildMenuInviteMembers => 'Pozvať členov';

  @override
  String get guildMenuCommunitySettings => 'Nastavenia komunity';

  @override
  String get guildMenuEditCommunityProfile => 'Upraviť profil komunity';

  @override
  String get guildMenuUnmuteCommunity => 'Zrušiť stlmenie komunity';

  @override
  String get guildMenuMuteCommunity => 'Stlmiť komunitu';

  @override
  String get guildMenuHideMutedChannels => 'Skryť stlmené kanály';

  @override
  String get guildMenuReportCommunity => 'Nahlásiť komunitu';

  @override
  String get guildMenuDebugCommunity => 'Debugovať komunitu';

  @override
  String get guildMenuCopyCommunityId => 'Skopírovať ID komunity';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Do $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Všeobecné';

  @override
  String get guildMenuSettingsRoles => 'Roly a povolenia';

  @override
  String get guildMenuSettingsEmoji => 'Vlastné emotikony';

  @override
  String get guildMenuSettingsStickers => 'Vlastné nálepky';

  @override
  String get guildMenuSettingsSafetyModeration => 'Bezpečnosť a moderovanie';

  @override
  String get guildMenuSettingsActivityLog => 'Záznam aktivít';

  @override
  String get guildMenuSettingsWebhooks => 'Webhooky';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Vlastná URL pozvánky';

  @override
  String get guildMenuSettingsDiscovery => 'Objavovanie';

  @override
  String get guildMenuSettingsMembers => 'Členovia';

  @override
  String get guildMenuSettingsInviteLinks => 'Odkazy na pozvánky';

  @override
  String get guildMenuSettingsBans => 'Zákazy';

  @override
  String get guildSettingsNoPermission =>
      'Nemáte povolenie na zobrazenie tejto karty nastavení.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikona';

  @override
  String get guildSettingsUploadImage => 'Nahrať obrázok';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Nahrajte banner pre váš server.';

  @override
  String get guildSettingsOverviewNameTitle => 'Názov';

  @override
  String get guildSettingsOverviewNameHint => 'Moja úžasná komunita';

  @override
  String get guildSettingsOverviewStatsTitle => 'Štatistiky';

  @override
  String get guildSettingsOverviewMembers => 'Členovia';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Použite roly na zoskupenie členov a priradenie povolení.';

  @override
  String get guildSettingsCreateRole => 'Vytvoriť rolu';

  @override
  String get guildSettingsRolesListTitle => 'Roly';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount statických, $animatedCount animovaných slotov pre emotikony použitých';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Zatiaľ žiadne vlastné emotikony.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count nálepiek nahraných';
  }

  @override
  String get guildSettingsStickersEmpty => 'Zatiaľ žiadne vlastné nálepky.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Overenie členov';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Vyberte, čo musia mať členovia, než budú môcť posielať správy alebo posielať priame správy členom komunity.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Členovia s rolami môžu tieto kontroly obísť. Pre verejné priestory odporúčame povoliť overenie.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Komunity uvedené v sekcii Objavovanie vyžadujú minimálne overený e-mail. Pri povolenej funkcii Objavovanie nie je možné vybrať možnosť Žiadne.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Dospelý obsah a varovania pred obsahom';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Nastavte označovanie dospelého obsahu a voliteľné varovania pred obsahom pre členov.';

  @override
  String get guildSettingsModerationMatureToggle => 'Dospelý obsah';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Označte túto komunitu ako obsahujúcu dospelý obsah.';

  @override
  String get guildSettingsVerificationNone => 'Žiadne';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nevyžaduje sa žiadne overenie.';

  @override
  String get guildSettingsVerificationLow => 'Nízke';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Vyžaduje overenú e-mailovú adresu.';

  @override
  String get guildSettingsVerificationMedium => 'Stredné';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Vyžaduje overenú e-mailovú adresu a účet starý minimálne 5 minút.';

  @override
  String get guildSettingsVerificationHigh => 'Vysoké';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Vyžaduje všetko zo strednej úrovne a navyše členstvo v komunite minimálne 10 minút.';

  @override
  String get guildSettingsVerificationHighest => 'Veľmi vysoké';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Vyžaduje overené telefónne číslo.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Sledujte akcie moderátorov v celej komunite.';

  @override
  String get guildSettingsAuditLogEmpty => 'Zatiaľ žiadne záznamy';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Akcie moderátorov a zmeny komunity sa zobrazia tu.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Všetci používatelia';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Všetky akcie';

  @override
  String get guildSettingsAuditLogNoReason => 'Dôvod nebol uvedený.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Neznámy používateľ';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Pri načítavaní denníka aktivít sa niečo pokazilo.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Nepodarilo sa načítať denníky aktivít';

  @override
  String get guildSettingsAuditLogReason => 'Dôvod';

  @override
  String get guildSettingsAuditLogSomeone => 'niekto';

  @override
  String get guildSettingsAuditLogSomething => 'niečo';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'neznáma entita';

  @override
  String get guildSettingsAuditLogNothing => 'nič';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Neznámy cieľ';

  @override
  String get auditLogActionGuildUpdate => 'Komunita aktualizovaná';

  @override
  String get auditLogActionChannelCreate => 'Kanál vytvorený';

  @override
  String get auditLogActionChannelUpdate => 'Kanál aktualizovaný';

  @override
  String get auditLogActionChannelDelete => 'Kanál odstránený';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Prepísanie kanála pridané';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Prepísanie kanála aktualizované';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Prepísanie kanála odstránené';

  @override
  String get auditLogActionMemberKick => 'Člen vylúčený';

  @override
  String get auditLogActionMemberPrune => 'Členovia odstránení';

  @override
  String get auditLogActionMemberBanAdd => 'Člen zablokovaný';

  @override
  String get auditLogActionMemberBanRemove => 'Člen odblokovaný';

  @override
  String get auditLogActionMemberUpdate => 'Člen aktualizovaný';

  @override
  String get auditLogActionMemberRoleUpdate => 'Roly člena aktualizované';

  @override
  String get auditLogActionMemberMove => 'Člen presunutý';

  @override
  String get auditLogActionMemberDisconnect => 'Člen odpojený';

  @override
  String get auditLogActionBotAdd => 'Robot pridaný';

  @override
  String get auditLogActionRoleCreate => 'Rola vytvorená';

  @override
  String get auditLogActionRoleUpdate => 'Rola aktualizovaná';

  @override
  String get auditLogActionRoleDelete => 'Rola odstránená';

  @override
  String get auditLogActionInviteCreate => 'Pozvánka vytvorená';

  @override
  String get auditLogActionInviteUpdate => 'Pozvánka aktualizovaná';

  @override
  String get auditLogActionInviteDelete => 'Pozvánka odstránená';

  @override
  String get auditLogActionWebhookCreate => 'Webhook vytvorený';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook aktualizovaný';

  @override
  String get auditLogActionWebhookDelete => 'Webhook odstránený';

  @override
  String get auditLogActionEmojiCreate => 'Emoji vytvorené';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji aktualizované';

  @override
  String get auditLogActionEmojiDelete => 'Emoji odstránené';

  @override
  String get auditLogActionStickerCreate => 'Nálepka vytvorená';

  @override
  String get auditLogActionStickerUpdate => 'Nálepka aktualizovaná';

  @override
  String get auditLogActionStickerDelete => 'Nálepka odstránená';

  @override
  String get auditLogActionMessageDelete => 'Správa odstránená';

  @override
  String get auditLogActionMessageBulkDelete => 'Správy odstránené';

  @override
  String get auditLogActionMessagePin => 'Správa pripnutá';

  @override
  String get auditLogActionMessageUnpin => 'Správa odopnutá';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor aktualizoval/a nastavenia komunity.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor vytvoril/a kanál $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor aktualizoval/a kanál $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor odstránil/a kanál $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor pridal/a povolenia kanála pre $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor pridal/a povolenia kanála pre $target v kanáli $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor aktualizoval/a povolenia kanála pre $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor aktualizoval/a povolenia kanála pre $target v kanáli $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor odstránil/a povolenia kanála pre $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor odstránil/a povolenia kanála pre $target v kanáli $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor vyhodil/a $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor zablokoval/a $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor odblokoval/a $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor aktualizoval/a $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor aktualizoval/a roly pre $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor odstránil/a neaktívnych členov.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor odstránil/a členov neaktívnych $days dní.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor presunul/a $target do iného hlasového kanála.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor presunul/a $target do kanála $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor odpojil/a $target z hlasového pripojenia.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor pridal/a bota $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor vytvoril/a rolu $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor aktualizoval/a rolu $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor odstránil/a rolu $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor vytvoril/a pozvánku $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor vytvoril/a pozvánku $target pre kanál $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor aktualizoval/a pozvánku $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor aktualizoval/a pozvánku $target pre kanál $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor odstránil/a pozvánku $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor odstránil/a pozvánku $target pre kanál $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor vytvoril/a webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor aktualizoval/a webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor odstránil/a webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor pridal emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor aktualizoval emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor odstránil emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor pridal nálepku $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor aktualizoval nálepku $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor odstránil nálepku $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor odstránil správu.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor odstránil správu v kanáli $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor odstránil viacero správ.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor odstránil $count správ.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor odstránil viacero správ v kanáli $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor odstránil $count správ v kanáli $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor pripol správu.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor pripol správu v kanáli $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor odopäl správu.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor odopäl správu v kanáli $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor vykonal auditnú akciu na $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Aktualizované $field z $oldValue na $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Nastavené $field na $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Vymazané $field (bolo $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Aktualizované $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Komunita premenovaná na $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Ikona komunity aktualizovaná.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Kanál premenovaný na $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Téma vymazaná.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Téma aktualizovaná na $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Zapnutý obsah pre dospelých.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Vypnutý obsah pre dospelých.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Prezývka nastavená na $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Prezývka $nickname odstránená.';
  }

  @override
  String get auditLogChangeMutedMember => 'Člen umlčaný.';

  @override
  String get auditLogChangeUnmutedMember => 'Člen odmlčaný.';

  @override
  String get auditLogChangeDeafenedMember => 'Člen ohlušený.';

  @override
  String get auditLogChangeUndeafenedMember => 'Člen odohlušený.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Pridané roly $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Odstránené roly $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanál: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Správa: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Pozvaný používateľom $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odstránené # správy.',
      one: 'Odstránená # správa.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odstránení # členovia.',
      one: 'Odstránený # člen.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'Tento odkaz nikdy nevyprší.';

  @override
  String get auditLogOptionTemporaryMembership => 'Udeľuje dočasné členstvo.';

  @override
  String get auditLogOptionPermanentMembership => 'Udeľuje trvalé členstvo.';

  @override
  String get guildSettingsLoadMore => 'Načítať viac';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Spravujte webhooky, ktoré zverejňujú správy v kanáloch.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nekonfigurované žiadne webhooky.';

  @override
  String get guildSettingsCopyUrl => 'Skopírovať URL';

  @override
  String get guildSettingsCopiedUrl => 'URL skopírovaná do schránky';

  @override
  String get guildSettingsDeleteWebhook => 'Odstrániť webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Nastavte vlastný odkaz na pozvánku pre váš server.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Uložiť';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Použitie';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count použití';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Požiadajte o zaradenie do zoznamu objavovania serverov.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Na požiadanie je potrebných aspoň $count členov.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Žiadosť';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Stav';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategória';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Popis';

  @override
  String get guildSettingsDiscoveryTags => 'Značky';

  @override
  String get guildSettingsDiscoveryTagsHint => 'hry, umenie, hudba';

  @override
  String get guildSettingsDiscoveryApply => 'Odoslať žiadosť';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Stiahnuť';

  @override
  String get guildSettingsMembersDescription =>
      'Vyhľadávajte a spravujte členov servera.';

  @override
  String get guildSettingsMembersSearchHint => 'Vyhľadať členov';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count členov';
  }

  @override
  String get guildSettingsInvitesDescription =>
      'Zobraziť a zrušiť platné odkazy na pozvánky.';

  @override
  String get guildSettingsInvitesEmpty => 'Žiadne aktívne pozvánky.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses použití';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Vyprší $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Zobraziť a spravovať zablokovaných používateľov.';

  @override
  String get guildSettingsBansSearchHint => 'Vyhľadať zákazy';

  @override
  String get guildSettingsBansEmpty => 'Žiadni zablokovaní používatelia.';

  @override
  String get guildSettingsBanPermanent => 'Trvalý zákaz';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Vyprší $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Vyprší';

  @override
  String get guildSettingsUnban => 'Zrušiť zákaz';

  @override
  String get guildSettingsBansLoading =>
      'Načítavajú sa zablokovaní používatelia';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nenašli sa žiadne zákazy zodpovedajúce vášmu vyhľadávaniu.';

  @override
  String get guildSettingsBanDetailsTitle => 'Podrobnosti o zákaze';

  @override
  String get guildSettingsBanViewDetails => 'Zobraziť podrobnosti';

  @override
  String get guildSettingsBannedOn => 'Zablokovaný dňa';

  @override
  String get guildSettingsBannedBy => 'Zablokovaný používateľom';

  @override
  String get guildSettingsRevokeBanTitle => 'Zrušiť zákaz';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Ste si istí, že chcete zrušiť zákaz pre $displayName? Bude sa môcť znova pripojiť ku komunite.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Zákaz pre $displayName zrušený';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Nepodarilo sa načítať zákazy. Skúste to znova.';

  @override
  String get guildSettingsRevokeBanError =>
      'Nepodarilo sa zrušiť zákaz. Skúste to znova.';

  @override
  String get guildSettingsCommunitySettings => 'Nastavenia komunity';

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
      'Spravujte profil, kanály a predvolené nastavenia vašej komunity.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Značka';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Aktualizujte svoju ikonu, názov, banner a pozadie pozvánky';

  @override
  String get guildSettingsOverviewBannerUpload => 'Nahrať banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Nastavenia nečinnosti';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Nakonfigurujte AFK kanál a časový limit';

  @override
  String get guildSettingsOverviewSystemTitle => 'Systém a privítanie';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Vyberte cieľ pre systémové a uvítacie správy';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Predvolené upozornenia';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Komunity s viac ako 250 ľuďmi sú nútené použiť nastavenie „iba zmienky“. Vaše pôvodné nastavenie je zachované a obnoví sa, ak komunita klesne pod 250 členov.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Pokročilé';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Povoliť flexibilné názvy textových kanálov';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Skryť korunu vlastníka komunity';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Samostatný banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Zobrazí banner vo vlastnej sekcii pod hlavičkou komunity.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Nahrať ikonu';

  @override
  String get guildSettingsOverviewRemoveImage => 'Odstrániť';

  @override
  String get guildSettingsOverviewSplashTitle => 'Pozadie pozvánky';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'Pozadie vloženia chatu';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Zobrazí sa vo vloženiach pozvánok v chate.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Nahrať pozadie';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Žiadny banner komunity';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Žiadne pozadie pozvánky';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Ukážka';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Pozrite sa, ako vaša pozvánka vyzerá pre návštevníkov.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Názvy textových kanálov';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Koruna vlastníka komunity';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Nastavte, či sa ikona koruny zobrazí vedľa vlastníka komunity';

  @override
  String get guildSettingsSplashCardAlignment => 'Zarovnanie karty';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Stred';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Vľavo';

  @override
  String get guildSettingsSplashAlignmentRight => 'Vpravo';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Platí len na širokých obrazovkách.';

  @override
  String get permissionReadMessageHistory => 'Čítať históriu správ';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Zmeniť, čo môžu vidieť používatelia bez \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Použite špecializované okno na nastavenie dátumu prahu histórie správ pre členov, ktorí nemajú povolenie $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Otvoriť prah histórie správ';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'Prah histórie správ';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Povoliť prah histórie správ';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Dátum prahu';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Členovia bez povolenia Čítať históriu správ si môžu pozrieť správy odoslané po tomto dátume.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Prah histórie správ bol aktualizovaný';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Povoliť veľké písmená a medzery v názvoch textových kanálov. Vypnuté obmedzuje názvy na malé písmená s pomlčkami a podčiarkovníkmi.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Skryje ikonu koruny vedľa vlastníka komunity na všetkých miestach.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animované ikony vyžadujú funkciu komunity Animovaná ikona.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animované bannery vyžadujú funkciu komunity Animovaný banner.';

  @override
  String get guildSettingsAfkChannel => 'AFK / nečinný kanál';

  @override
  String get guildSettingsAfkChannelHint =>
      'Presuňte členov do tohto kanála, keď sú AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Žiadny AFK kanál';

  @override
  String get guildSettingsAfkTimeout => 'AFK časový limit';

  @override
  String get guildSettingsAfkTimeout1Min => '1 minúta';

  @override
  String get guildSettingsAfkTimeout5Min => '5 minút';

  @override
  String get guildSettingsAfkTimeout15Min => '15 minút';

  @override
  String get guildSettingsAfkTimeout30Min => '30 minút';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 hodina';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds sekúnd';
  }

  @override
  String get guildSettingsSystemChannel => 'Cieľový kanál';

  @override
  String get guildSettingsSystemChannelHint =>
      'Správy s privítaním a systémové správy sa zobrazia tu.';

  @override
  String get guildSettingsNoSystemChannel => 'Žiadny systémový kanál';

  @override
  String get guildSettingsHideJoinMessages => 'Skryť správy o pripojení';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Potláča správy o pripojení v cieľovom kanáli.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Predvolené nastavenia upozornení';

  @override
  String get guildSettingsNotificationsAll => 'Všetky správy';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Upozorňovať na všetky správy';

  @override
  String get guildSettingsNotificationsMentions => 'Iba zmienky';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Upozorňovať iba na zmienky';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max 10 MB. Minimum: 960×540px (16:9). Zobrazuje sa v odkazoch na pozvánky v chate.';

  @override
  String get guildSettingsModerationDescription =>
      'Nastavte overovanie, filtrovanie obsahu a nastavenia pre nevhodný obsah.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Komunity uvedené v Discovery majú obmedzené možnosti moderovania.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Filtrovanie obsahu';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automaticky skenovať správy na explicitný obsah v kanáloch, ktoré nie sú označené ako nevhodné.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Komunity uvedené v Discovery musia skenovať všetkých členov. Toto nastavenie nie je možné zmeniť, kým je povolené Discovery.';

  @override
  String get guildSettingsContentFilterOff => 'Vypnuté';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Nechajte komunitu moderovať sa sama';

  @override
  String get guildSettingsContentFilterNoRole => 'Filtrovať členov bez rolí';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Odporúčané pre väčšinu komunít';

  @override
  String get guildSettingsContentFilterAll => 'Filtrovať všetkých';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximálna ochrana pre rodinné priestory';

  @override
  String get guildSettingsModerationMatureOff => 'Vypnuté';

  @override
  String get guildSettingsModerationMatureOn => 'Zapnuté';

  @override
  String get guildSettingsContentWarningToggle =>
      'Zobraziť upozornenie na obsah';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Zapína výzvu na súhlas pred vstupom do akéhokoľvek kanála.';

  @override
  String get guildSettingsContentWarningText => 'Vlastný text upozornenia';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Toto obsahuje citlivý obsah.';

  @override
  String get guildSettingsModeration2faTitle => 'Požiadavka na 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Vyžadovať dvojfaktorové overenie pre moderátorov predtým, ako môžu zablokovať, vylúčiť, umlčať alebo odstrániť správy.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Vyžadovať 2FA pre akcie moderovania';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Iba vlastník komunity môže zmeniť toto nastavenie';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Zapnite 2FA na svojom účte, aby ste mohli zmeniť toto nastavenie';

  @override
  String get guildSettingsEmojiSearchHint => 'Hľadať emotikony';

  @override
  String get guildSettingsEmojiUploadTitle => 'Nahrať emotikon';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Neanimované emotikony ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animované emotikony ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Hľadať nálepky';

  @override
  String get guildSettingsWebhooksInfo =>
      'Vytvorte webhooky z nastavení kanála. Upravte ich tu.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Vaša vlastná URL nebude fungovať, pokiaľ aspoň jeden kanál nebude viditeľný pre všetkých.';

  @override
  String get guildSettingsVanityUrlRemove => 'Odstrániť';

  @override
  String get guildSettingsBannedUsersTitle => 'Zablokovaní používatelia';

  @override
  String get guildSettingsInvitesTableInviter => 'Pozývajúci';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanál';

  @override
  String get guildSettingsInvitesTableCode => 'Kód';

  @override
  String get guildSettingsInvitesTableUses => 'Použití';

  @override
  String get guildSettingsInvitesTableCreated => 'Vytvorené';

  @override
  String get guildSettingsMembersSortNewest => 'Najnovší prvý';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filtrovať podľa používateľa';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filtrovať podľa akcie';

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
