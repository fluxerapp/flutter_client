// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class FluxerLocalizationsHu extends FluxerLocalizations {
  FluxerLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get reconnectingTitle => 'Valami elromlott!';

  @override
  String get reconnectingBody =>
      'Valami gond van a szerverekkel.\nMindjárt megjavul!';

  @override
  String get gatewayReconnectingToast => 'Újracsatlakozás…';

  @override
  String get gatewayConnectedToast => 'Csatlakoztatva';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'Indítás sikertelen: $error';
  }

  @override
  String get retry => 'Újrapróbálkozás';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Kapcsolat elveszett';

  @override
  String get splashViewOnStatusPage => 'Megtekintés az állapotoldalon';

  @override
  String get splashConnectionIssuesPrompt => 'Kapcsolati problémák?';

  @override
  String get splashStatusPageLink => 'Állapotoldal';

  @override
  String get splashReadIncident => 'Incidens megtekintése';

  @override
  String get splashIncidentHistory => 'Incidens előzmények';

  @override
  String get welcomeBack => 'Üdv újra';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'Kérjük, adj meg érvényes e-mail címet.';

  @override
  String get password => 'Jelszó';

  @override
  String get forgotPassword => 'Elfelejtetted a jelszavad?';

  @override
  String get logIn => 'Bejelentkezés';

  @override
  String get logInWithPasskey => 'Bejelentkezés kulcstartóval';

  @override
  String continueWithSso(String provider) {
    return 'Folytatás a(z) $provider szolgáltatással';
  }

  @override
  String get ssoRequired =>
      'Az ehhez az instanciához való hozzáféréshez SSO szükséges.';

  @override
  String get organizationSsoProvider =>
      'Jelentkezz be a szervezet egyetlen bejelentkezési szolgáltatójával.';

  @override
  String get failedToStartSso => 'Nem sikerült elindítani az SSO-t';

  @override
  String get ssoCancelled => 'Az SSO bejelentkezés megszakítva';

  @override
  String preferSso(String provider) {
    return 'Inkább az SSO-t használnád? Folytatás a(z) $provider szolgáltatással.';
  }

  @override
  String get logInViaBrowser => 'Bejelentkezés böngészőn keresztül';

  @override
  String get needAccountPrompt => 'Nincs fiókod? ';

  @override
  String get register => 'Regisztráció';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Igazold, hogy ember vagy';

  @override
  String get captchaDescription =>
      'Biztosítanunk kell, hogy nem vagy bot. Kérjük, végezd el az alábbi ellenőrzést.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Problémáid vannak? Próbáld meg az hCaptcha-t';

  @override
  String get captchaSwitchToTurnstile => 'Próbáld meg a Turnstile-t';

  @override
  String get cancel => 'Mégse';

  @override
  String get ipAuthCheckEmail => 'Ellenőrizd az e-mailedet';

  @override
  String ipAuthDescription(String email) {
    return 'Küldtünk egy e-mailt a bejelentkezés engedélyezéséhez. Kérjük, nyisd meg a(z) $email postafiókodat.';
  }

  @override
  String get ipAuthConnectionLost => 'Kapcsolat elveszett';

  @override
  String get ipAuthConnectionLostDescription =>
      'Elvesztettük a kapcsolatot az engedélyezésre várva. Kérjük, próbáld újra.';

  @override
  String get ipAuthLinkExpired => 'A bejelentkezési link lejárt';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Ez az engedélyezési link lejárt. Kérjük, jelentkezz be újra.';

  @override
  String get ipAuthResendEmail => 'Újraküldés';

  @override
  String get ipAuthResent => 'Újraküldve';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds mp';
  }

  @override
  String get back => 'Vissza';

  @override
  String get mfaTitle => 'Kétfaktoros hitelesítés';

  @override
  String get mfaChooseMethod => 'Válassz egy ellenőrzési módszert';

  @override
  String get mfaMethodTotp => 'Hitelesítő alkalmazás';

  @override
  String get mfaMethodWebauthn => 'Biztonsági kulcs / Jelszókulcs';

  @override
  String get mfaTotpDescription =>
      'Add meg a 6 számjegyű kódot a hitelesítő alkalmazásodból, vagy az egyik biztonsági mentési kódodat.';

  @override
  String get mfaCodeLabel => 'Kód';

  @override
  String get mfaTryAnotherMethod => 'Próbálj másik módszert';

  @override
  String get mfaUseSecurityKey => 'Próbáld meg biztonsági kulccsal / jelszóval';

  @override
  String get accountSelectorTitle => 'Válassz egy fiókot';

  @override
  String get accountSelectorDescription =>
      'Válassz egy fiókot a folytatáshoz, vagy adj hozzá egy másikat.';

  @override
  String get accountAdd => 'Fiók hozzáadása';

  @override
  String get accountRemove => 'Eltávolítás';

  @override
  String accountRemoveTitle(String username) {
    return '$username eltávolítása';
  }

  @override
  String get accountRemoveDescription =>
      'Ez eltávolítja az ehhez a fiókhoz mentett munkamenetet.';

  @override
  String get accountRemoveOnlyDescription =>
      'Ez eltávolítja az egyetlen mentett fiókot ezen az eszközön.';

  @override
  String get accountExpired => 'Lejárt';

  @override
  String accountSessionExpired(String identifier) {
    return 'A munkamenet lejárt: $identifier. Kérlek, jelentkezz be újra.';
  }

  @override
  String get accountManageTitle => 'Fiókok kezelése';

  @override
  String get accountSwitchFailed =>
      'Nem sikerült váltani a fiókok között. Próbáld újra.';

  @override
  String get profileTabMenuSwitchAccounts => 'Fiókok váltása';

  @override
  String get statusChangeSheetTitle => 'Állapot beállítása';

  @override
  String get statusOnlineStatusSection => 'Online állapot';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Szünetel';

  @override
  String get statusDnd => 'Ne zavarjanak';

  @override
  String get statusInvisible => 'Láthatatlan';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Amíg nem változtatom meg';

  @override
  String get statusDontClear => 'Ne törölje';

  @override
  String get statusFor10Seconds => '10 másodpercig';

  @override
  String get statusClearAfter10Seconds => '10 másodperc';

  @override
  String get statusClearAfter15Minutes => '15 perc';

  @override
  String get statusClearAfter30Minutes => '30 perc';

  @override
  String get statusClearAfter1Hour => '1 óra';

  @override
  String get statusClearAfter3Hours => '3 óra';

  @override
  String get statusClearAfter4Hours => '4 óra';

  @override
  String get statusClearAfter8Hours => '8 óra';

  @override
  String get statusClearAfter24Hours => '24 óra';

  @override
  String get statusClearAfter3Days => '3 nap';

  @override
  String get statusDndDescription =>
      'Nem fogsz értesítéseket kapni asztali gépen';

  @override
  String get statusInvisibleDescription => 'Offline állapotban leszel látható';

  @override
  String get customStatusSetTitle => 'Egyéni állapot beállítása';

  @override
  String get customStatusCurrentHint => 'Egyéni állapot';

  @override
  String get customStatusClear => 'Egyéni állapot törlése';

  @override
  String get customStatusPlaceholder => 'Mi történik?';

  @override
  String get customStatusChooseEmoji => 'Válassz egy emojit';

  @override
  String get customStatusClearAfter => 'Törlés ekkor:';

  @override
  String get customStatusSave => 'Mentés';

  @override
  String get accountActive => 'Aktív fiók';

  @override
  String get signOut => 'Kijelentkezés';

  @override
  String get suspendedPermanentTitle => 'Fiók véglegesen felfüggesztve';

  @override
  String get suspendedTemporaryTitle => 'Fiók felfüggesztve';

  @override
  String get suspendedPermanentDescription =>
      'A fiókod véglegesen felfüggesztésre került a Szolgáltatási Feltételek megsértése miatt.';

  @override
  String get suspendedTemporaryDescription =>
      'A fiókod ideiglenesen felfüggesztésre került. A felfüggesztési időszak végeztével újra hozzáférhetsz a fiókodhoz.';

  @override
  String get suspendedIssuedAt => 'Kiadva';

  @override
  String get suspendedEndsAt => 'Vége';

  @override
  String get suspendedDuration => 'Időtartam';

  @override
  String get suspendedPermanent => 'Végleges';

  @override
  String get suspendedReason => 'Indok';

  @override
  String get suspendedAppealDeadline => 'Fellebbezési határidő';

  @override
  String suspendedDeletionWarning(String date) {
    return 'A fiókod törlése ekkor lesz ütemezve: $date.';
  }

  @override
  String get suspendedRecheck => 'Frissítések ellenőrzése';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Újrapróbálkozás $seconds mp múlva';
  }

  @override
  String get suspendedBackToLogin => 'Vissza a bejelentkezéshez';

  @override
  String get suspendedAppealTitle => 'Fellebbezés';

  @override
  String get suspendedAppealHint =>
      'Magyarázd el, miért kellene felülvizsgálni a felfüggesztésedet (minimum 50 karakter)...';

  @override
  String get suspendedAppealSubmit => 'Fellebbezés küldése';

  @override
  String get suspendedAppealPending => 'Felülvizsgálat alatt';

  @override
  String get suspendedAppealAccepted => 'Fellebbezés elfogadva';

  @override
  String get suspendedAppealRejected => 'Fellebbezés elutasítva';

  @override
  String get suspendedAppealAcceptedDescription =>
      'A fellebbezésedet elfogadtuk, és a fiókod helyreállítva.';

  @override
  String get suspendedSignIn => 'Bejelentkezés a fiókodba';

  @override
  String get forgotPasswordTitle => 'Elfelejtetted a jelszavad?';

  @override
  String get forgotPasswordDescription =>
      'Add meg az e-mail címedet, és küldünk egy linket a jelszavad visszaállításához.';

  @override
  String get forgotPasswordSubmit => 'Visszaállítási link küldése';

  @override
  String get forgotPasswordSentTitle => 'Ellenőrizd az e-mailjeidet';

  @override
  String get forgotPasswordSentDescription =>
      'Küldtünk egy e-mailt a jelszavad visszaállításához. Kérjük, ellenőrizd a beérkezett üzeneteidet, és kövesd a linket a jelszavad visszaállításához.';

  @override
  String get forgotPasswordBackToLogin => 'Vissza a bejelentkezéshez';

  @override
  String get resetPasswordTitle => 'Állíts be új jelszót';

  @override
  String get resetPasswordDescription =>
      'Add meg az új jelszavadat az alábbi mezőbe a visszaállítási folyamat befejezéséhez.';

  @override
  String get resetPasswordNewPassword => 'Új jelszó';

  @override
  String get resetPasswordConfirm => 'Új jelszó megerősítése';

  @override
  String get resetPasswordSubmit => 'Jelszó visszaállítása';

  @override
  String get resetPasswordMismatch => 'A jelszavak nem egyeznek.';

  @override
  String get registerTitle => 'Fiók létrehozása';

  @override
  String get registerDisplayName => 'Megjelenítendő név (Opcionális)';

  @override
  String get registerDisplayNameHint => 'Hogyan szólítsanak téged?';

  @override
  String get registerUsername => 'Felhasználónév (Opcionális)';

  @override
  String get registerUsernameHint =>
      'Hagyd üresen a véletlenszerű felhasználónévhez';

  @override
  String get registerUsernameTagHint =>
      'Egy 4 számjegyű címke automatikusan hozzáadásra kerül az egyediség biztosítása érdekében';

  @override
  String get registerDateOfBirth => 'Születési dátum';

  @override
  String get registerMonth => 'Hónap';

  @override
  String get registerDay => 'Nap';

  @override
  String get registerYear => 'Év';

  @override
  String get registerConsent =>
      'Elfogadom a Felhasználási feltételeket és az Adatvédelmi irányelveket';

  @override
  String get registerConsentPrefix => 'Elfogadom a ';

  @override
  String get registerConsentTerms => 'Felhasználási feltételeket';

  @override
  String get registerConsentAnd => ' és a ';

  @override
  String get registerConsentPrivacy => 'Adatvédelmi irányelveket';

  @override
  String get registerConfirmPassword => 'Jelszó megerősítése';

  @override
  String get registerSubmit => 'Fiók létrehozása';

  @override
  String get registerHaveAccount => 'Már van fiókod? ';

  @override
  String get passkeyNoCredentials =>
      'Nincsenek hitelesítő adatok ehhez az alkalmazáshoz. Jelentkezz be inkább e-maillel és jelszóval.';

  @override
  String get passkeyDeviceNotSupported =>
      'A jelszavak nem támogatottak ezen az eszközön.';

  @override
  String get passkeyDomainNotAssociated =>
      'A jelszavak nincsenek konfigurálva ehhez az alkalmazáshoz. Jelentkezz be inkább e-maillel és jelszóval.';

  @override
  String get passkeyTimeout =>
      'A jelszó-hitelesítés időtúllépése. Kérjük, próbáld újra.';

  @override
  String get passkeyNotAvailable =>
      'A jelszavak nem érhetők el ehhez az alkalmazáshoz. Jelentkezz be inkább e-maillel és jelszóval.';

  @override
  String get passkeyFailed =>
      'A jelszóazonosító hitelesítése sikertelen volt. Kérjük, próbálkozzon újra.';

  @override
  String get errorUnableToCreateAccount =>
      'Nem sikerült létrehozni a fiókot. Kérjük, próbálkozzon újra.';

  @override
  String get errorUnableToSignIn =>
      'Jelenleg nem tudunk bejelentkezni. Kérjük, próbálkozzon újra.';

  @override
  String get errorInvalidEmailOrPassword =>
      'Érvénytelen e-mail cím vagy jelszó.';

  @override
  String get errorUnableToSendResetLink =>
      'Nem sikerült elküldeni az alaphelyzetbe állító linket. Kérjük, próbálkozzon újra.';

  @override
  String get errorUnableToResetPassword =>
      'Nem sikerült alaphelyzetbe állítani a jelszót. Kérjük, próbálkozzon újra.';

  @override
  String get embedInviteJoin => 'Csatlakozz a közösséghez';

  @override
  String get embedInviteGoTo => 'Ugrás a közösséghez';

  @override
  String embedInviteOnline(String count) {
    return '$count online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count tag';
  }

  @override
  String get embedInviteUnknownTitle => 'Ismeretlen meghívó';

  @override
  String get embedInviteUnknownSubtitle => 'Próbálj meg új meghívót kérni.';

  @override
  String get embedInviteUnavailable => 'A meghívó nem elérhető';

  @override
  String get inviteAcceptTitle => 'Meghívást kaptál, hogy csatlakozz';

  @override
  String get inviteAcceptJoinButton => 'Csatlakozz a közösséghez';

  @override
  String get inviteAcceptGoToButton => 'Ugrás a közösséghez';

  @override
  String get inviteAcceptInvitesPaused => 'Meghívók szüneteltetve';

  @override
  String get inviteAcceptNotFoundTitle => 'Érvénytelen meghívó';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Ez a meghívó lejárt vagy érvénytelen lehet.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Csatlakozz a csoporthoz';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Meghívást kaptál egy csoportos DM-be $inviterName által';
  }

  @override
  String get inviteAcceptSomeone => 'valaki';

  @override
  String get inviteAcceptEmojiPack => 'Emoji csomag';

  @override
  String get inviteAcceptStickerPack => 'Matrica csomag';

  @override
  String get inviteAcceptInstallEmojiPack => 'Emoji csomag telepítése';

  @override
  String get inviteAcceptInstallStickerPack => 'Matrica csomag telepítése';

  @override
  String get inviteAcceptPackInstallNote =>
      'A meghívó elfogadása automatikusan telepíti a csomagot.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Nincs hozzáférés a csatornához';

  @override
  String get channelAccessDeniedDescription =>
      'Nincs hozzáférésed ahhoz a csatornához, ahová ezt az üzenetet küldték.';

  @override
  String get messageJumpLinkNoAccess => 'Nincs hozzáférés';

  @override
  String get okay => 'Rendben';

  @override
  String get embedThemeTitle => 'Megosztott téma';

  @override
  String get embedThemeSubtitle =>
      'Ez az ügyfél nem támogatja az egyéni témákat.';

  @override
  String get embedThemeUnavailableButton => 'Témák nem elérhetők';

  @override
  String get privacySettings => 'Adatvédelmi beállítások';

  @override
  String get privacyDirectMessages => 'Névtelen üzenetek';

  @override
  String get privacyDirectMessagesDescription =>
      'Engedélyezze a névtelen üzeneteket más tagoktól ebben a közösségben';

  @override
  String get privacyBotDirectMessages => 'Botok névtelen üzenetei';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Engedélyezze, hogy a közösség botjai névtelen üzeneteket küldjenek neked';

  @override
  String get privacyMutualDmsDisabled =>
      'A közösség rendszergazdái letiltották a kizárólag kölcsönös tagoktól érkező névtelen üzenetek fogadását ebben a közösségben.';

  @override
  String get communityDebug => 'Közösségi hibakeresés';

  @override
  String get copiedToClipboard => 'Vágólapra másolva';

  @override
  String get notificationSettings => 'Értesítési beállítások';

  @override
  String notificationMuteGuild(String guildName) {
    return '$guildName némítása';
  }

  @override
  String get notificationMuteDescription =>
      'Egy közösség némítása megakadályozza a jelöletlen üzenetek és értesítések megjelenését, hacsak nem említettek téged.';

  @override
  String get notificationCommunitySettings =>
      'Közösségi értesítési beállítások';

  @override
  String get notificationAllMessages => 'Minden üzenet';

  @override
  String get notificationOnlyMentions => 'Csak említések';

  @override
  String get notificationNothing => 'Semmi';

  @override
  String get notificationSuppressEveryone => '@everyone és @here elnyomása';

  @override
  String get notificationSuppressRoles => 'Elnyom minden szerep @említést';

  @override
  String get notificationMobilePush => 'Mobil push értesítések';

  @override
  String get notificationOverrides => 'Értesítési felülbírálatok';

  @override
  String get notificationSelectChannel =>
      'Válassz egy csatornát vagy kategóriát';

  @override
  String get notificationOnlyAtMentions => 'Csak @említések';

  @override
  String get notificationMuteChannel => 'Némítsa el a csatornát';

  @override
  String get notificationUnmuteChannel => 'Csatorna némításának feloldása';

  @override
  String get notificationNoCategory => 'Nincs kategória';

  @override
  String get dmMarkAsRead => 'Jelölje olvasottként';

  @override
  String get dmMuteConversation => 'Némítsa el a DM-et';

  @override
  String get dmUnmuteConversation => 'DM némításának feloldása';

  @override
  String get dmPinDm => 'Személyes üzenet rögzítése';

  @override
  String get dmUnpinDm => 'Személyes üzenet rögzítésének feloldása';

  @override
  String get dmAlwaysShowInSidebar => 'Mindig megjelenít a sávban';

  @override
  String get dmRemoveFromAlwaysShown => 'Eltávolítás a mindig láthatókból';

  @override
  String get dmCloseDm => 'DM bezárása';

  @override
  String get dmCloseDmConfirmTitle => 'DM bezárása';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Biztosan bezárod a(z) $username felhasználóval folytatott DM-et? Később bármikor újra megnyithatod.';
  }

  @override
  String get dmCopyChannelId => 'Csatornaazonosító másolása';

  @override
  String get dmChannelIdCopied => 'Csatornaazonosító másolva';

  @override
  String get dmCopyUserId => 'Felhasználóazonosító másolása';

  @override
  String get dmUserIdCopied => 'Felhasználóazonosító másolva';

  @override
  String get dmViewProfile => 'Profil megtekintése';

  @override
  String get dmVoiceCall => 'Hanghívás indítása';

  @override
  String get incomingVoiceCallTitle => 'Bejövő hanghívás';

  @override
  String get incomingVoiceCallAccept => 'Elfogadás';

  @override
  String get incomingVoiceCallDecline => 'Elutasítás';

  @override
  String get incomingVoiceCallLabel => 'Bejövő hívás';

  @override
  String get incomingVoiceCallIgnore => 'Figyelmen kívül hagyás';

  @override
  String get directVoiceCallNotEligible =>
      'Ez a hívás jelenleg nem indítható el. Próbáld meg később.';

  @override
  String get voiceJoinCallFailed =>
      'Nem sikerült csatlakozni ehhez a híváshoz. Ellenőrizd a kapcsolatodat, és próbáld meg újra.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Nem sikerült csatlakozni ehhez a híváshoz. Ellenőrizd a kapcsolatodat, és próbáld meg újra.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Nem sikerült frissíteni ezt a hívást a szerveren. Ellenőrizd a kapcsolatodat, és próbáld meg újra.';

  @override
  String get dmAddNote => 'Jegyzet hozzáadása';

  @override
  String get dmEditGroup => 'Csoport szerkesztése';

  @override
  String get dmInviteToCommunity => 'Meghívás közösségbe';

  @override
  String get dmBlock => 'Letiltás';

  @override
  String get dmLeaveGroup => 'Csoport elhagyása';

  @override
  String get dmNoCommunitiesAvailable => 'Nincsenek elérhető közösségek';

  @override
  String dmGroupMemberCount(int count) {
    return '$count tag';
  }

  @override
  String get dmMuteFor15Min => '15 percre';

  @override
  String get dmMuteFor30Min => '30 percre';

  @override
  String get dmMuteFor1Hour => '1 órára';

  @override
  String get dmMuteFor3Hours => '3 órára';

  @override
  String get dmMuteFor4Hours => '4 órára';

  @override
  String get dmMuteFor8Hours => '8 órára';

  @override
  String get dmMuteFor24Hours => '24 órára';

  @override
  String get dmMuteFor3Days => '3 napra';

  @override
  String get dmMuteForever => 'Amíg vissza nem kapcsolom';

  @override
  String get dmPinGroupDm => 'Csoportos DM rögzítése';

  @override
  String get dmUnpinGroupDm => 'Pineltlenítés csoportos DM';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'Kedvenc DM';

  @override
  String get dmUnfavoriteDm => 'Nem kedvelt DM';

  @override
  String get dmFavoriteGroupDm => 'Kedvenc csoportos DM';

  @override
  String get dmUnfavoriteGroupDm => 'Nem kedvelt csoportos DM';

  @override
  String get dmChangeFriendNickname => 'Barát becenevének módosítása';

  @override
  String get dmRemoveFriend => 'Barát eltávolítása';

  @override
  String get dmAddFriend => 'Barát hozzáadása';

  @override
  String get dmAcceptFriendRequest => 'Barát kérés elfogadása';

  @override
  String get dmIgnoreFriendRequest => 'Barát kérés figyelmen kívül hagyása';

  @override
  String get dmFriendRequestSent => 'Elküldött barát kérés';

  @override
  String get dmUnblock => 'Feloldás';

  @override
  String get dmDebugUser => 'Felhasználó hibakeresése';

  @override
  String get dmDebugChannel => 'Csatorna hibakeresése';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'Pinelt DM';

  @override
  String get dmUnpinned => 'Pineltlenített DM';

  @override
  String get dmMuted => 'Némított DM';

  @override
  String get dmUnmuted => 'Némítatlan DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Barát eltávolítása';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Biztosan eltávolítod $username barátként?';
  }

  @override
  String get dmBlockConfirmTitle => 'Felhasználó blokkolása';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Biztosan blokkolni szeretnéd $username felhasználót? Nem tud majd üzenetet küldeni neked, és nem küldhet barát kéréseket.';
  }

  @override
  String get dmFriendRequestSentToast => 'Barát kérés elküldve';

  @override
  String get dmFriendRequestFailed => 'Nem sikerült elküldeni a barát kérést';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Nem sikerült elfogadni a barát kérést';

  @override
  String get dmRemoveFriendFailed => 'Nem sikerült eltávolítani a barátot';

  @override
  String get dmBlockFailed => 'Nem sikerült blokkolni a felhasználót';

  @override
  String get dmUnblockFailed =>
      'Nem sikerült feloldani a felhasználó blokkolását';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Nem sikerült figyelmen kívül hagyni a barát kérést';

  @override
  String get dmAddFriends => 'Barátok hozzáadása';

  @override
  String get addFriendSheetTitle => 'Barát hozzáadása';

  @override
  String get addFriendUsernameHint => 'Felhasználónév#0000';

  @override
  String get addFriendUsernameLabel => 'Barát felhasználóneve';

  @override
  String get addFriendSendRequest => 'Kérés küldése';

  @override
  String get addFriendNoUserFound =>
      'Nem található felhasználó ezzel a felhasználónévvel.';

  @override
  String get addFriendInvalidUsername =>
      'Adjon meg érvényes felhasználónevet (Felhasználónév#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Barát kérés elküldve';

  @override
  String get addFriendClaimTitle => 'Igényeld a fiókodat';

  @override
  String get addFriendClaimDescription =>
      'Igényeld a fiókodat a barát kérések küldéséhez.';

  @override
  String get addFriendVerifyTitle => 'Erősítsd meg az e-mail címedet';

  @override
  String get addFriendVerifyDescription =>
      'E-mail címedet igazolnod kell, mielőtt barát kéréseket küldhetsz.';

  @override
  String get addFriendVerifyEmail => 'E-mail igazolása';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Bejövő barát kérések ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Kimenő barát kérések ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Bejövő barát kérés';

  @override
  String get addFriendOutgoingStatus => 'Elküldött barát kérés';

  @override
  String get addFriendViewProfile => 'Profil megtekintése';

  @override
  String get addFriendAccept => 'Elfogadás';

  @override
  String get addFriendIgnore => 'Figyelmen kívül hagyás';

  @override
  String get addFriendAcceptTitle => 'Barát kérés elfogadása';

  @override
  String get addFriendIgnoreTitle => 'Barátkérés figyelmen kívül hagyása';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Elfogadod a(z) $userName barátfelkérését?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Figyelmen kívül hagyod a(z) $displayName barátfelkérését?';
  }

  @override
  String get addFriendCancelRequest => 'Kérés törlése';

  @override
  String get addFriendCancelRequestFailed =>
      'Nem sikerült törölni a barátfelkérést. Próbáld újra.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Jelenleg nem fogadnak barátfelkéréseket.';

  @override
  String get addFriendUnblockFirst =>
      'Először blokkold fel, hogy barátfelkérést küldhess.';

  @override
  String get addFriendCannotSendToSelf =>
      'Nem küldhetsz magadnak barátfelkérést.';

  @override
  String get addFriendAlreadyFriends =>
      'Már barátok vagytok ezzel a felhasználóval.';

  @override
  String get addFriendClaimToSend =>
      'Fejezd be a regisztrációt a barátfelkérések küldéséhez.';

  @override
  String get addFriendSendFailedGeneric =>
      'Nem sikerült elküldeni a barátfelkérést. Próbáld újra.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Rendszer';

  @override
  String get emojiSearchPlaceholder => 'Keresd meg álmaid emojiját';

  @override
  String get emojiSearchEmpty =>
      'Nincs olyan emoji, ami megfelelne a keresésednek';

  @override
  String get emojiAutocompleteDefaultLabel => 'Alapértelmezett emoji';

  @override
  String get emojiFrequentlyUsed => 'Gyakran használt';

  @override
  String get emojiTabGifs => 'GIF-ek';

  @override
  String get emojiTabMedia => 'Média';

  @override
  String get emojiTabStickers => 'Matricák';

  @override
  String get emojiTabEmojis => 'Emojik';

  @override
  String get gifPickerSearch => 'GIF-ek keresése';

  @override
  String get gifPickerSearchKlipy => 'KLIPY keresése';

  @override
  String get gifPickerSearchTenor => 'Tenor keresése';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Kedvencek';

  @override
  String get gifPickerTrending => 'Felkapott GIF-ek';

  @override
  String get gifPickerNoResultsTitle => 'Nincs találat';

  @override
  String get gifPickerNoResultsDescription =>
      'Próbálj meg más keresőkifejezést';

  @override
  String get gifPickerLoadFailedTitle => 'Nem sikerült betölteni a GIF-eket';

  @override
  String get gifPickerLoadFailedBody =>
      'Ellenőrizd a kapcsolatodat, és próbáld újra.';

  @override
  String get emojiCategoryPeople => 'Emberek';

  @override
  String get emojiCategoryNature => 'Természet';

  @override
  String get emojiCategoryFood => 'Étel és ital';

  @override
  String get emojiCategoryActivity => 'Tevékenységek';

  @override
  String get emojiCategoryTravel => 'Utazás és helyek';

  @override
  String get emojiCategoryObjects => 'Tárgyak';

  @override
  String get emojiCategorySymbols => 'Szimbólumok';

  @override
  String get emojiCategoryFlags => 'Zászlók';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return '$emojiCount darab emojit oldhatsz fel $communityCount közösségből a Plutoniummal.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Szerezz Plutoniumot';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Ne mutasd meg újra';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count egyéni emojit',
      one: '1 egyéni emojit',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count közösséget',
      one: '1 közösséget',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Külső hivatkozás figyelmeztetés';

  @override
  String get externalLinkWarningLeaving => 'Elhagyod a Fluxert';

  @override
  String get externalLinkWarningDescription =>
      'A külső hivatkozások veszélyesek lehetnek. Kérjük, légy óvatos.';

  @override
  String get externalLinkWarningDestinationUrl => 'Cél URL:';

  @override
  String get externalLinksSectionTitle => 'Külső hivatkozások';

  @override
  String get externalLinksSectionDescription =>
      'Konfiguráld, hogyan kezelje a rendszer a külső hivatkozásokra vonatkozó figyelmeztetéseket.';

  @override
  String get externalLinkWarningTrustPrefix => 'Mindig megbízik ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — kihagyja ezt a figyelmeztetést a következő alkalommal';

  @override
  String get externalLinkVisitSite => 'Webhely megtekintése';

  @override
  String get externalLinkTrustAllLabel =>
      'Minden külső hivatkozás megbízhatóként jelölése';

  @override
  String get externalLinkStripTrackingLabel =>
      'Követési paraméterek eltávolítása a hivatkozásokból';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatikus eltávolítja a követési paramétereket (pl. utm_source, fbclid, gclid) az általad küldött üzenetekben lévő hivatkozásokból. Tisztítja a hivatkozást, mielőtt bárki más eléri azt.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Minden külső hivatkozás megbízhatóként jelölése?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Ez minden külső hivatkozást megbízhatóként jelöl, és kihagyja a figyelmeztetést minden domain esetén. A meglévő megbízható domainjeid felülírásra kerülnek. Ez kevésbé biztonságos.';

  @override
  String get externalLinkTrustAllConfirmAction =>
      'Mind megbízhatóként jelölése';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Minden hivatkozás megbízhatóként jelölésének leállítása?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'A külső hivatkozásokra vonatkozó figyelmeztetések újra megjelennek. Egyedileg kell hozzáadnod a megbízható domaineket.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Megbízhatóként jelölés kikapcsolása';

  @override
  String get externalLinkTrustedAllDescription =>
      'Minden külső hivatkozás megbízható. Nem jelennek meg figyelmeztetések.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return '$count megbízható domain van megadva. Továbbiakat a jelölőnégyzet bepipálásával adhatsz hozzá, amikor külső hivatkozásokat tekintesz meg.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Ha engedélyezve van, nem jelennek meg figyelmeztetések a külső hivatkozásokra. Ez kevésbé biztonságos.';

  @override
  String get imageFileTooLarge =>
      'A képfájl túl nagy. Válassz kisebb, 10 MB alatti fájlt.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Az animált avatarokhoz Plutonium szükséges';

  @override
  String get animatedBannersRequirePlutonium =>
      'Az animált bannerekhez Plutonium szükséges';

  @override
  String get animatedAvifNotSupported => 'Animált AVIF nem támogatott';

  @override
  String get animatedAvifNotSupportedBody =>
      'Az animált AVIF fájlok vágása és forgatása még nem támogatott. Ha folytatod, az eredeti formájában lesz feltöltve.';

  @override
  String get uploadAsIs => 'Feltöltés változatlanul';

  @override
  String get croppingAnimatedNotSupported =>
      'Az animált képek vágása még nem támogatott. Az eredeti feltöltés kerül felhasználásra.';

  @override
  String get cropAvatar => 'Avatar vágása';

  @override
  String get cropBanner => 'Banner vágása';

  @override
  String get skip => 'Kihagyás';

  @override
  String get crop => 'Vágás';

  @override
  String get changeYourFluxerTag => 'FluxerTag módosítása';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

  @override
  String get fluxerTagDescriptionBase =>
      'A felhasználónevek csak betűket (a-z, A-Z), számokat (0-9) és aláhúzásjeleket tartalmazhatnak. A felhasználónevek nem érzékenyek a kis- és nagybetűk megkülönböztetésére.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'A felhasználónevek csak betűket (a-z, A-Z), számokat (0-9) és aláhúzásjeleket tartalmazhatnak. A felhasználónevek nem érzékenyek a kis- és nagybetűk megkülönböztetésére. Bármilyen elérhető 4 számjegyű taget választhatsz a #0000-tól a #9999-ig.';

  @override
  String get fluxerTagDescriptionPremium =>
      'A felhasználónevek csak betűket (a-z, A-Z), számokat (0-9) és aláhúzásjeleket tartalmazhatnak. A felhasználónevek nem érzékenyek a kis- és nagybetűk megkülönböztetésére. Bármilyen elérhető 4 számjegyű taget választhatsz a #0001-től a #9999-ig.';

  @override
  String validationLengthRange(int min, int max) {
    return '$min és $max karakter között';
  }

  @override
  String get validationAllowedChars =>
      'Csak betűk (a-z, A-Z), számok (0-9) és aláhúzásjel (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Szerezz Plutoniumot a tagod testreszabásához, vagy tartsd meg a felhasználóneved módosításakor';

  @override
  String get fluxerTagAlreadyTaken => 'FluxerTag már foglalt';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'A(z) $username#$discriminator FluxerTag már foglalt. A folytatás automatikusan újragenerálja a megkülönböztető jeledet.';
  }

  @override
  String get customTagIsTemporary => 'Egyéni tag ideiglenes';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Az egyéni 4 számjegyű tagod csak akkor érhető el, amíg a Plutonium előfizetésed aktív. Amikor az előfizetésed lejár $date napon, a tagod egy véletlenszerűen hozzárendelt számra változik egy 3 napos türelmi idő után.';
  }

  @override
  String get customTagTemporaryBody =>
      'Az egyéni 4 számjegyű tagod csak akkor érhető el, amíg a Plutonium előfizetésed aktív. Amikor az előfizetésed lejár, a tagod egy véletlenszerűen hozzárendelt számra változik egy 3 napos türelmi idő után.';

  @override
  String get iUnderstandContinue => 'Értem, folytatás';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Ha elmented ezt a FluxerTag-et, az egyéni 4 számjegyű tagod véletlenszerű számra változik, amikor a Plutonium előfizetésed véget ér. Ha az előfizetésed nem újul meg, 3 napos türelmi időd lesz, mielőtt a tag megváltozik.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Az egyéni 4 számjegyű tagod (#$discriminator) aktív, amíg a Plutonium előfizetésed aktív. Ha az előfizetésed véget ér, vagy nem újul meg egy 3 napos türelmi idő után, a tagod véletlenszerű számra változik.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Szabd testre a 4 számjegyű tagodat, vagy tartsd meg a felhasználóneved módosításakor';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'A Plutonium próbaidőszakod $date napon jár le. Frissíts, hogy megtartsd az egyéni tagodat, és szerezz egy jelvényt a profilodban.';
  }

  @override
  String get premiumTrialActive =>
      'Plutonium próbaidőszakon vagy. Frissíts, hogy megtartsd az egyéni tagodat, és szerezz egy jelvényt a profilodban.';

  @override
  String get fluxerTagUpdated => 'FluxerTag frissítve';

  @override
  String get fluxerTagUpdateFailed =>
      'A FluxerTag frissítése sikertelen. Kérlek, próbáld újra.';

  @override
  String get continueAction => 'Tovább';

  @override
  String get profileCustomizationTitle => 'Profil testreszabása';

  @override
  String get profileCustomizationDescription =>
      'Módosítsd a profilod megjelenését, és nézd meg az élő előnézetet';

  @override
  String get usernameLabel => 'Felhasználónév';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Fiók igénylése a FluxerTag módosításához';

  @override
  String get changeFluxerTag => 'FluxerTag módosítása';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Tetszés szerint alakítsd 4 számjegyű FluxerTagged (#$discriminator) Plutoniummal';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Felhasználónév és 4 számjegyű tag módosítása';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Az egyéni tagged (#$discriminator) Plutonium előfizetésedhez kötődik, és véletlenszerű tagra vált, ha lejár.';
  }

  @override
  String get displayNameLabel => 'Megjelenítendő név';

  @override
  String get pronounsLabel => 'Névmások';

  @override
  String get avatarLabel => 'Profilkép';

  @override
  String get changeAvatar => 'Profilkép módosítása';

  @override
  String get removeAvatar => 'Profilkép eltávolítása';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Max. 10 MB. Ajánlott: 512×512px';

  @override
  String get bannerLabel => 'Borítókép';

  @override
  String get changeBanner => 'Borítókép módosítása';

  @override
  String get removeBanner => 'Borítókép eltávolítása';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Max. 10 MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Kiemelő szín';

  @override
  String get accentColorDescription =>
      'A profilod szegélyének és borítóképének színét alakítja';

  @override
  String get aboutMeLabel => 'Rólam';

  @override
  String get aboutMeHelperText =>
      'Használhatsz linkeket, emojikat és Markdown formázást.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium jelvény adatvédelme';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Szabályozd, hogyan jelenjen meg a Plutonium jelvényed mások számára';

  @override
  String get hidePlutoniumBadgeLabel => 'Plutonium jelvény teljes elrejtése';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Teljesen rejtsd el a Plutonium jelvényedet más felhasználók elől';

  @override
  String get hidePlutoniumPurchaseDate =>
      'Plutonium vásárlási dátumának elrejtése';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Plutonium vásárlási dátumának elrejtése ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Távolítsd el a Plutonium vásárlásának dátumát a jelvényedről';

  @override
  String get maskVisionaryAsSubscription =>
      'Látnok jelvény előfizetésként való megjelenítése';

  @override
  String get maskVisionaryDescription =>
      'Mutasd a Látnok jelvényedet egy normál előfizetésként';

  @override
  String get hideVisionaryIdBadge => 'Látnok azonosító jelvény elrejtése';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Látnok azonosító jelvény elrejtése (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Távolítsd el a Látnok azonosító jelvényedet';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Plutonium próbaidőszakon vagy – az előfizetésed $date-án kezdődik';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Az előfizetésed automatikusan elindul, amikor a próbaidőszak véget ér. Nincs teendőd.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Plutonium próbaidőszakon vagy, amely $date-án jár le';
  }

  @override
  String get premiumTrialActiveProfile => 'Plutonium próbaidőszakon vagy';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Max. 10 MB. Ajánlott: 512×512px. Animált profilképek (GIF) Plutoniumot igényelnek.';

  @override
  String get bannerPlutoniumUpsell =>
      'Tedd egyedivé a profilodat egy álló vagy animált borítóképével, hogy kitűnjön.';

  @override
  String get getPlutonium => 'Plutonium beszerzése';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Az alkalmazáson belüli vásárlások még nem érhetők el ezen a platformon. Maradj velünk – hamarosan!';

  @override
  String get profilePreviewLabel => 'Előnézet';

  @override
  String get profilePreviewMessage => 'Üzenet';

  @override
  String get profilePreviewMemberSince => 'Fluxer tag';

  @override
  String get unclaimedAccountTitle => 'Nem igényelt fiók';

  @override
  String get unclaimedAccountDescription =>
      'A fiókod még nincs igényelve. E-mail és jelszó nélkül elveszítheted a hozzáférést. Igényeld a fiókodat most a biztonság érdekében.';

  @override
  String get claimAccount => 'Fiók igénylése';

  @override
  String get profileTypeLabel => 'Profil típusa';

  @override
  String get profileTypeGlobal => 'Globális profil';

  @override
  String get profileTypeGuildDescription =>
      'Közösségenkénti profilodat szerkeszted. Ez a profil csak ebben a közösségben lesz látható, és felülírja a globális profilodat.';

  @override
  String get communityNicknameLabel => 'Közösségi becenév';

  @override
  String get perGuildPremiumUpsellText =>
      'Az avatar, a banner, a kiemelőszín és az életrajz testreszabása az egyes közösségekhez Plutoniumot igényel. A közösségi becenév és a névmások mindenki számára ingyenesek.';

  @override
  String get avatarModeInherit => 'Globális profil használata';

  @override
  String get avatarModeCustom => 'Egyéni kép használata';

  @override
  String get avatarModeUnset => 'Ne jelenjen meg';

  @override
  String get profileSavedToast => 'Profil frissítve';

  @override
  String get profileEditButton => 'Profil szerkesztése';

  @override
  String get profileNoteLabel => 'Jegyzet';

  @override
  String get profileNoteVisibility => '(csak te láthatod)';

  @override
  String get profileNoteEmpty => 'Még nincs jegyzet.';

  @override
  String get sudoTitle => 'Hitelesítsd az adataidat';

  @override
  String get sudoDescription =>
      'Ez a művelet hitelesítést igényel a folytatáshoz.';

  @override
  String get sudoAuthenticatorCode => 'Hitelesítő kód';

  @override
  String get sudoMethodPassword => 'Jelszó';

  @override
  String get sudoMethodTotp => 'Hitelesítő';

  @override
  String get sudoVerificationFailed =>
      'A hitelesítés sikertelen volt. Kérlek, próbáld újra.';

  @override
  String get securityAccountTitle => 'Fiók';

  @override
  String get securityAccountDescription =>
      'Kezeld az e-mail címedet, jelszavadat és fiókbeállításaidat';

  @override
  String get securitySectionTitle => 'Biztonság';

  @override
  String get securitySectionDescription =>
      'Védje meg fiókodat kétfaktoros hitelesítéssel és jelszavaimáddal';

  @override
  String get securityLoginEmailSectionTitle => 'E-mail beállítások';

  @override
  String get securityLoginEmailSectionDescription =>
      'Kezeld azt az e-mail címet, amellyel bejelentkezel a Fluxerbe';

  @override
  String get securityLoginEmailAddressLabel => 'E-mail cím';

  @override
  String get securityLoginNoEmailSet => 'Nincs e-mail cím beállítva';

  @override
  String get securityLoginChangeEmail => 'E-mail cím módosítása';

  @override
  String get securityLoginAddEmail => 'E-mail cím hozzáadása';

  @override
  String get securityLoginReveal => 'Mutat';

  @override
  String get securityLoginHide => 'Elrejt';

  @override
  String get securityLoginPasswordSectionTitle => 'Jelszó';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Változtasd meg a jelszavadat a fiókod biztonságban tartása érdekében';

  @override
  String get securityLoginCurrentPasswordLabel => 'Jelenlegi jelszó';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Utoljára módosítva: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'Utoljára módosítva: Soha';

  @override
  String get securityLoginNoPasswordSet => 'Nincs jelszó beállítva';

  @override
  String get securityLoginChangePassword => 'Jelszó módosítása';

  @override
  String get securityLoginSetPassword => 'Jelszó beállítása';

  @override
  String get passwordChangeTitle => 'Jelszó módosítása';

  @override
  String get passwordChangeIntroDescription =>
      'Elküldünk egy ellenőrző kódot az e-mail címedre, hogy megerősítsük személyazonosságodat, mielőtt módosítanánk a jelszavadat.';

  @override
  String get passwordChangeStart => 'Indítás';

  @override
  String get passwordChangeVerifyTitle => 'Hitelesítsd az e-mailedet';

  @override
  String get passwordChangeVerifyDescription =>
      'Add meg az e-mail címedre küldött ellenőrző kódot.';

  @override
  String get passwordChangeVerificationCode => 'Ellenőrző kód';

  @override
  String get passwordChangeVerify => 'Hitelesítés';

  @override
  String get passwordChangeNewPasswordTitle => 'Új jelszó beállítása';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Add meg az új jelszavadat lent.';

  @override
  String get passwordChangeNewPassword => 'Új jelszó';

  @override
  String get passwordChangeConfirmPassword => 'Új jelszó megerősítése';

  @override
  String get passwordChangeSubmit => 'Jelszó módosítása';

  @override
  String get passwordChangeSuccess => 'Jelszó módosítva';

  @override
  String get passwordChangePasswordsDoNotMatch => 'A jelszavak nem egyeznek';

  @override
  String get passwordChangeInvalidCode => 'Érvénytelen vagy lejárt kód';

  @override
  String get emailChangeTitle => 'E-mail cím módosítása';

  @override
  String get emailChangeIntroDescription =>
      'Az e-mail cím megváltoztatása előtt ellenőrző kódokat küldünk az Ön személyazonosságának igazolásához.';

  @override
  String get emailChangeStart => 'Indítás';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'Jelenlegi e-mail cím ellenőrzése';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Adja meg az aktuális e-mail címére küldött ellenőrző kódot.';

  @override
  String get emailChangeNewEmailTitle => 'Új e-mail cím megadása';

  @override
  String get emailChangeNewEmailDescription =>
      'Adja meg az új e-mail címet, amelyet használni szeretne.';

  @override
  String get emailChangeNewEmailLabel => 'Új e-mail cím';

  @override
  String get emailChangeNewEmailSubmit => 'Ellenőrző kód küldése';

  @override
  String get emailChangeVerifyNewTitle => 'Új e-mail cím ellenőrzése';

  @override
  String get emailChangeVerifyNewDescription =>
      'Adja meg az új e-mail címére küldött ellenőrző kódot.';

  @override
  String get emailChangeSuccess => 'E-mail cím módosítva';

  @override
  String get emailChangeInvalidCode => 'Érvénytelen vagy lejárt kód';

  @override
  String get resend => 'Újraküldés';

  @override
  String resendCountdown(int seconds) {
    return 'Újraküldés ($seconds mp)';
  }

  @override
  String get verificationCode => 'Ellenőrző kód';

  @override
  String get verify => 'Ellenőrzés';

  @override
  String get enable => 'Engedélyezés';

  @override
  String get disable => 'Letiltás';

  @override
  String get delete => 'Törlés';

  @override
  String get save => 'Mentés';

  @override
  String get securityTfaSectionTitle => 'Kétfaktoros hitelesítés';

  @override
  String get securityTfaSectionDescription =>
      'Adjunk hozzá egy extra biztonsági réteget a fiókjához';

  @override
  String get securityTfaAuthenticatorApp => 'Hitelesítő alkalmazás';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'A kétfaktoros hitelesítés engedélyezve van';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Használjon hitelesítő alkalmazást kódok generálásához a kétfaktoros hitelesítéshez';

  @override
  String get securityTfaBackupCodes => 'Biztonsági mentési kódok';

  @override
  String get securityTfaBackupCodesDescription =>
      'Tekintse meg és kezelje a biztonsági mentési kódjait a fiók helyreállításához';

  @override
  String get securityTfaViewCodes => 'Kódok megtekintése';

  @override
  String get securityPasskeysSectionTitle => 'Jelszó nélküli kulcsok';

  @override
  String get securityPasskeysSectionDescription =>
      'Használjon jelszó nélküli kulcsokat a jelszó nélküli bejelentkezéshez és a kétfaktoros hitelesítéshez';

  @override
  String get securityPasskeysRegistered => 'Regisztrált jelszó nélküli kulcsok';

  @override
  String get securityPasskeysNone =>
      'Nincsenek regisztrált jelszó nélküli kulcsok';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'jelszó nélküli kulcs',
      one: 'jelszó nélküli kulcs',
    );
    return '$count $_temp0 regisztrálva (max. 10)';
  }

  @override
  String get securityPasskeysAdd => 'Jelszó nélküli kulcs hozzáadása';

  @override
  String securityPasskeysAdded(String date) {
    return 'Hozzáadva: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Utoljára használva: $date';
  }

  @override
  String get securityPasskeysRename => 'Átnevezés';

  @override
  String get securityPasskeysDeleteTitle => 'Jelszó nélküli kulcs törlése';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Biztosan törölni szeretné a(z) „$name” jelszó nélküli kulcsot?';
  }

  @override
  String get securityPasskeyNameTitle => 'Jelszó nélküli kulcs elnevezése';

  @override
  String get securityPasskeyNameLabel => 'Jelszó nélküli kulcs neve';

  @override
  String get securityPasskeyNameHint =>
      'pl. YubiKey, iPhone, Munkahelyi számítógép';

  @override
  String get securityPhoneSectionTitle => 'Telefonszám';

  @override
  String get securityPhoneSectionDescription => 'Kezelje telefonszámát.';

  @override
  String get securityPhoneLabel => 'Telefonszám';

  @override
  String get securityPhoneNone => 'Nincs hozzáadott telefonszám.';

  @override
  String get securityPhoneAdd => 'Telefonszám hozzáadása';

  @override
  String get securityPhoneRemove => 'Eltávolítás';

  @override
  String get securityPhoneRemoveTitle => 'Telefonszám eltávolítása';

  @override
  String get securityPhoneRemoveDescription =>
      'Biztosan el szeretnéd távolítani a telefonszámodat?';

  @override
  String get securityPhoneRemoved => 'Telefonszám eltávolítva';

  @override
  String get securityClaimTitle => 'Biztonsági funkciók';

  @override
  String get securityClaimDescription =>
      'Igényeld a fiókodat a biztonsági funkciók, például a kétfaktoros hitelesítés és a jelszómentes belépés eléréséhez.';

  @override
  String get securityVerifyEmailRequired =>
      'E-mail címedet igazolnod kell, mielőtt beállíthatod a kétfaktoros hitelesítést, a jelszómentes belépést vagy az SMS-ellenőrzést.';

  @override
  String get totpEnableTitle => 'Hitelesítő alkalmazás beállítása';

  @override
  String get totpEnableDescription =>
      'Olvassa be a QR-kódot a hitelesítő alkalmazásoddal, hogy kódokat generáljon a kétfaktoros hitelesítéshez.';

  @override
  String get totpEnableCodeLabel => 'Kód';

  @override
  String get totpEnableCodeHint =>
      'Add meg a 6 számjegyű kódot a hitelesítő alkalmazásodból';

  @override
  String get totpEnableSuccess => 'A kétfaktoros hitelesítés engedélyezve lett';

  @override
  String get totpDisableTitle => 'Hitelesítő alkalmazás eltávolítása';

  @override
  String get totpDisableDescription =>
      'Add meg a 6 számjegyű kódot a hitelesítő alkalmazásodból a kétfaktoros hitelesítés letiltásához.';

  @override
  String get totpDisableSuccess => 'A kétfaktoros hitelesítés letiltva';

  @override
  String get backupCodesTitle => 'Biztonsági mentési kódok';

  @override
  String get backupCodesWarning =>
      'Ha elveszíted a hozzáférést a hitelesítő alkalmazásodhoz, és nincsenek meg ezek a kódok, akkor véglegesen kizáródsz a fiókodból. Töltsd le vagy másold ki őket most, és tárold őket biztonságos helyen.';

  @override
  String get backupCodesDownload => 'Letöltés';

  @override
  String get backupCodesCopy => 'Másolás';

  @override
  String get backupCodesCopied =>
      'A biztonsági mentési kódok a vágólapra másolva';

  @override
  String get backupCodesAcknowledge =>
      'Letöltöttem vagy kimásoltam a biztonsági mentési kódjaimat, és biztonságos helyen tároltam őket.';

  @override
  String get backupCodesDone => 'Kész';

  @override
  String get backupCodesViewTitle => 'Biztonsági mentési kódok megtekintése';

  @override
  String get backupCodesViewDescription =>
      'A biztonsági mentési kódok megtekintése előtt ellenőrzésre lehet szükség.';

  @override
  String get phoneAddTitle => 'Telefonszám hozzáadása';

  @override
  String get phoneAddLabel => 'Telefonszám';

  @override
  String get phoneAddHint => 'Add meg a telefonszámodat';

  @override
  String get phoneAddFooter =>
      'Add meg a telefonszámodat. SMS-ben küldünk egy ellenőrző kódot.';

  @override
  String get phoneAddSendCode => 'Kód küldése';

  @override
  String get phoneVerifyTitle => 'Telefonszám ellenőrzése';

  @override
  String get phoneVerifyDescription =>
      'Add meg a telefonszámodra küldött ellenőrző kódot.';

  @override
  String get phoneAddSuccess => 'Telefonszám hozzáadva';

  @override
  String get dangerZoneSectionTitle => 'Veszélyzóna';

  @override
  String get dangerZoneSectionDescription =>
      'Visszavonhatatlan és pusztító műveletek';

  @override
  String get dangerZoneDisableTitle => 'Fiók letiltása';

  @override
  String get dangerZoneDisableDescription =>
      'Ideiglenesen tiltsd le a fiókodat. Később újra aktiválhatod, ha újra bejelentkezel.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'A fiókod letiltása minden munkamenetből kiléptet. Bármikor újra aktiválhatod a fiókodat, ha újra bejelentkezel.';

  @override
  String get dangerZoneDeleteTitle => 'Fiók törlése';

  @override
  String get dangerZoneDeleteDescription =>
      'Véglegesen törölje a fiókodat és az összes kapcsolódó adatot. Ez a művelet nem vonható vissza.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'A fiókod törlése előtt mondd le az aktív Plutonium előfizetésedet a Plutonium beállításaiban.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount =>
      'Nem lehet törölni a fiókot';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Nem törölheted a fiókodat, amíg közösségek tulajdonosa vagy. Először ruházd át a tulajdonjogot a következő közösségekre:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'és még $count ';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'A tulajdonjog átruházásához menj a $settingsPath menüpontra, és használd a tulajdonjog átruházása opciót.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Biztosan törölni szeretnéd a fiókodat? Ez a művelet ütemezni fogja a fiókod végleges törlését.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'A törlési folyamatot 14 napon belül lemondhatod';

  @override
  String get dangerZoneDeleteBullet2 =>
      '14 nap elteltével a fiókod véglegesen törlődik';

  @override
  String get dangerZoneDeleteBullet3 =>
      'A törlés feldolgozása után nem tudod visszanyerni a hozzáférést a fiókodhoz';

  @override
  String get dangerZoneDeleteBullet4 =>
      'A fiókod törlése után nem tudod törölni a küldött üzeneteidet';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Ha exportálni szeretnéd az adataidat, vagy először törölni szeretnéd az üzeneteidet, kérjük, mielőtt folytatnád, keresd fel az Adatvédelmi irányítópultot a Felhasználói beállításokban.';

  @override
  String get claimAccountTitle => 'Igényeld a fiókodat';

  @override
  String get claimAccountDescription =>
      'Igényeld a fiókodat egy e-mail cím és jelszó hozzáadásával. Elküldünk egy ellenőrző kódot az e-mail címed megerősítéséhez, mielőtt befejeznéd.';

  @override
  String get claimAccountEmailLabel => 'E-mail cím';

  @override
  String get claimAccountPasswordLabel => 'Jelszó';

  @override
  String get claimAccountSendCode => 'Kód küldése';

  @override
  String get claimAccountVerifyDescription =>
      'Írd be az e-mail címedre küldött kódot a hitelesítéshez. A jelszavad a kód megerősítése után lesz beállítva.';

  @override
  String get claimAccountSuccess => 'Fiók sikeresen igényelve';

  @override
  String get importantInformation => 'Fontos információk:';

  @override
  String get genericError => 'Hiba történt';

  @override
  String get invalidCode => 'Érvénytelen kód';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éve',
      one: '1 éve',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hónapja',
      one: '1 hónapja',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count napja',
      one: '1 napja',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count órája',
      one: '1 órája',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perce',
      one: '1 perce',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'épp most';

  @override
  String get authorizedAppsTitle => 'Engedélyezett alkalmazások';

  @override
  String get authorizedAppsDescription =>
      'Ezek az alkalmazások kaptak hozzáférést a Fluxer-fiókodhoz.';

  @override
  String get authorizedAppsEmptyTitle => 'Nincsenek engedélyezett alkalmazások';

  @override
  String get authorizedAppsEmptyDescription =>
      'Még nem engedélyeztél semmilyen alkalmazást a fiókod elérésére.';

  @override
  String get authorizedAppsLoadError =>
      'Nem sikerült betölteni az engedélyezett alkalmazásokat';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return '$date napon engedélyezve';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Engedélyek megadva';

  @override
  String get authorizedAppsRevoke => 'Visszavonás';

  @override
  String get authorizedAppsRevokeTitle =>
      'Alkalmazás hozzáférésének visszavonása';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Biztosan vissza akarod vonni a hozzáférést a(z) $appName számára? Ez az alkalmazás ezután nem fér hozzá a fiókodhoz.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Hozzáférést biztosít az alapvető profilinformációidhoz (felhasználónév, avatar stb.)';

  @override
  String get authorizedAppsScopeEmail => 'Az e-mail címed megtekintése';

  @override
  String get authorizedAppsScopeGuilds =>
      'A közösségek, amelyeknek tagja vagy, megtekintése';

  @override
  String get authorizedAppsScopeConnections =>
      'Csatlakoztatott fiókjaid megtekintése';

  @override
  String get authorizedAppsScopeBot =>
      'Bot hozzáadása egy közösséghez a kért engedélyekkel';

  @override
  String get authorizedAppsScopeAdmin => 'Adminisztratív végpontok elérése';

  @override
  String get privacyPendingDeletionTitle => 'Függőben lévő törlés';

  @override
  String get blockedUsersTitle => 'Letiltott felhasználók';

  @override
  String get blockedUsersDescription =>
      'A letiltott felhasználók nem küldhetnek neked barátfelkérést vagy közvetlen üzenetet.';

  @override
  String get blockedUsersEmptyTitle => 'Nincsenek letiltott felhasználók';

  @override
  String get blockedUsersEmptyDescription => 'Még nem tiltottál le senkit.';

  @override
  String get blockedUsersLoadError =>
      'Nem sikerült betölteni a letiltott felhasználókat';

  @override
  String get blockedUsersUnblock => 'Feloldás';

  @override
  String get blockedUsersUnblockTitle => 'Felhasználó feloldása';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Biztosan fel akarod oldani a(z) $username letiltását?';
  }

  @override
  String get blockedUsersCopyTag => 'FluxerTag másolása';

  @override
  String get blockedUsersCopyId => 'Felhasználói azonosító másolása';

  @override
  String get userProfileLoadError => 'Nem sikerült betölteni a profil';

  @override
  String get userProfileRetry => 'Újrapróbálkozás';

  @override
  String get userProfileMessage => 'Üzenet';

  @override
  String get userProfileVoiceCall => 'Hanghívás';

  @override
  String get userProfileVideoCall => 'Videohívás';

  @override
  String get userProfileEditProfile => 'Profil szerkesztése';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer Csapat';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Közösségi Csapat';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Bug Hunter';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium előfizető $date óta';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary $date óta';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID: $sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Közös ismerősök ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Közös közösségek ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Közös ismerősök';

  @override
  String get userProfileMutualCommunitiesTitle => 'Közös közösségek';

  @override
  String get userProfileNoMutualFriends => 'Nem található közös ismerős.';

  @override
  String get userProfileNoMutualCommunities => 'Nem található közös közösség.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Becenév: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'DM megnyitása';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Letiltottad $username felhasználót. Nem tudsz üzenetet küldeni, amíg fel nem oldod a tiltást.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Tiltás feloldása';

  @override
  String get userProfileOpenDm => 'DM megnyitása';

  @override
  String get userProfileNoteTitle => 'Jegyzet';

  @override
  String get userProfileNoteVisibility => '(csak neked látható)';

  @override
  String get userProfileNoteSave => 'Mentés';

  @override
  String get userProfileNoteDelete => 'Törlés';

  @override
  String get userProfileNoteEmpty => 'Koppints a jegyzet hozzáadásához';

  @override
  String get userProfileMemberSince => 'Tagság kezdete';

  @override
  String get userProfileAboutMe => 'Rólam';

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
  String get userProfileCopyUsername => 'Felhasználónév másolása';

  @override
  String get userProfileCopyUserId => 'Felhasználói azonosító másolása';

  @override
  String get userProfileViewMainProfile => 'Fő profil megtekintése';

  @override
  String get userProfileViewCommunityProfile => 'Közösségi profil megtekintése';

  @override
  String get userProfileBlockUser => 'Felhasználó letiltása';

  @override
  String get userProfileUnblockUser => 'Felhasználó feloldása';

  @override
  String get userProfileRemoveFriend => 'Ismerős eltávolítása';

  @override
  String get userProfileBlockConfirmTitle => 'Felhasználó letiltása';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Biztosan le szeretnéd tiltani $username felhasználót?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Felhasználó feloldása';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Biztosan fel szeretnéd oldani $username felhasználó tiltását?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Ismerős eltávolítása';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Biztosan el szeretnéd távolítani $username ismerőseid közül?';
  }

  @override
  String get userProfileFailedOpenDm => 'Nem sikerült megnyitni a DM-et';

  @override
  String get userProfileFailedSaveNote => 'Nem sikerült menteni a jegyzetet';

  @override
  String get userProfileActionFailed => 'A művelet sikertelen, próbáld újra';

  @override
  String get userProfileChangeNickname => 'Becenév módosítása';

  @override
  String get userProfileKick => 'Kirúgás';

  @override
  String get userProfileBan => 'Kitiltás';

  @override
  String get userProfileTimeout => 'Időtúllépés';

  @override
  String get userProfileRemoveTimeout => 'Időtúllépés eltávolítása';

  @override
  String get userProfileTransferOwnership => 'Tulajdonjog átadása';

  @override
  String get userProfileReportUser => 'Felhasználó jelentése';

  @override
  String get userProfileReportMessage => 'Üzenet jelentése';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '$username kirúgása?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Biztosan ki szeretnéd rúgni $username felhasználót? Új meghívóval újra csatlakozhat.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Eltávolítod a némítást?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'A némítás eltávolítása lehetővé teszi $username számára, hogy újra üzeneteket küldjön, reagáljon és csatlakozzon hangcsatornákhoz.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Átadod a tulajdonjogot?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Átadod ennek a közösségnek a tulajdonjogát $username számára? Ez visszafordíthatatlan, és elveszíted az összes tulajdonosi jogosultságot.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '$username kitiltása';
  }

  @override
  String get userProfileBanDurationLabel => 'Kitiltás időtartama';

  @override
  String get userProfileBanCustomSecondsLabel => 'Egyéni időtartam (másodperc)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Bármilyen érték $min és $max másodperc között';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Üzenethalmaz törlése';

  @override
  String get userProfileBanDeleteNone => 'Ne törölj semmit';

  @override
  String get userProfileBanDelete24h => 'Előző 24 óra';

  @override
  String get userProfileBanDelete7d => 'Előző 7 nap';

  @override
  String get userProfileBanReasonLabel => 'Indok (nem kötelező)';

  @override
  String get userProfileBanReasonHint => 'Add meg a kitiltás okát';

  @override
  String get userProfileBanSubmit => 'Tag kitiltása';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '$username némítása';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Némítás időtartama';

  @override
  String get userProfileTimeoutSubmit => 'Tag némítása';

  @override
  String get userProfileNicknameLabel => 'Becenév';

  @override
  String get userProfileNicknameHint => 'Adj meg egy becenevet';

  @override
  String get userProfileNicknameSave => 'Mentés';

  @override
  String userProfileKickSuccess(String username) {
    return '$username eltávolítva';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username kitiltva';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username némítva';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Eltávolítva a némítás $username számára';
  }

  @override
  String get userProfileNicknameSuccess => 'Becenév frissítve';

  @override
  String get userProfileTransferSuccess => 'Tulajdonjog átadva';

  @override
  String get durationPermanent => 'Végleges';

  @override
  String get duration60Seconds => '60 másodperc';

  @override
  String get duration5Minutes => '5 perc';

  @override
  String get duration10Minutes => '10 perc';

  @override
  String get duration1Hour => '1 óra';

  @override
  String get duration12Hours => '12 óra';

  @override
  String get duration1Day => '1 nap';

  @override
  String get duration3Days => '3 nap';

  @override
  String get duration5Days => '5 nap';

  @override
  String get duration1Week => '1 hét';

  @override
  String get duration2Weeks => '2 hét';

  @override
  String get duration1Month => '1 hónap';

  @override
  String get durationCustom => 'Egyéni…';

  @override
  String get iarReportUserTitle => 'Felhasználó jelentése';

  @override
  String get iarReasonInappropriateProfile => 'Nem megfelelő profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Ez a felhasználó profilja nem megfelelő tartalmat tartalmaz';

  @override
  String typingIndicatorOne(String name) {
    return '$name ír...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 és $name2 írnak...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 és $name3 írnak...';
  }

  @override
  String get typingIndicatorMultiple => 'Többen írnak...';

  @override
  String get typingIndicatorHandful =>
      'Egy maréknyi billentyűzet-harcos gyülekezik...';

  @override
  String get typingIndicatorSymphony =>
      'A billentyűk koppanásának szimfóniája zajlik...';

  @override
  String get typingIndicatorFiesta => 'Itt teljes kiőrlésű író-parti zajlik';

  @override
  String get typingIndicatorApocalypse => 'Hú, ez egy írói apokalipszis';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Örülünk, hogy itt vagy, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Üdv, $username! Érezd magad otthon.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Szia, $username! Örülünk, hogy itt vagy.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Szia, $username! Csak csatlakozz, amikor készen állsz.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Szia $username, örülünk, hogy itt vagy!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Szia, $username! Reméljük, élvezed a tartózkodásodat.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Szia, $username, üdv a fedélzeten!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Örülünk, hogy megérkeztél, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Üdv, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Üdv, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Üdv, $username! Örülünk, hogy itt vagy.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Üdv, $username! Reméljük, élvezed az itt töltött idődet.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Üdv, $username! A következő beszélgetésed itt kezdődik.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Üdv, $username. Örülünk, hogy itt vagy.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Örülünk, hogy látunk, $username! Üdv!';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Itt vagy, $username! Jó, hogy velünk vagy.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Megérkeztél, $username! Kezdjük el.';
  }

  @override
  String get relativeTimeShortNow => 'most';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}p',
      one: '1p',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countó',
      one: '1ó',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}n',
      one: '1n',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}h',
      one: '1h',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$counté',
      one: '1é',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Csatlakoztatott eszközök';

  @override
  String get linkedDevicesDescription =>
      'Tekintsd meg az összes eszközt, amely jelenleg be van jelentkezve a fiókodba. Vonj vissza minden olyan munkamenetet, amelyet nem ismersz fel.';

  @override
  String get linkedDevicesCurrentDevice => 'Jelenlegi eszköz';

  @override
  String get linkedDevicesOtherDevices => 'Egyéb eszközök';

  @override
  String get linkedDevicesEnterSelection => 'Kiválasztás mód bekapcsolása';

  @override
  String get linkedDevicesExitSelection => 'Kiválasztás mód kikapcsolása';

  @override
  String get linkedDevicesSelectAll => 'Összes kijelölése';

  @override
  String get linkedDevicesClearSelection => 'Kijelölés törlése';

  @override
  String get linkedDevicesRevokeTooltip => 'Eszköz visszavonása';

  @override
  String get linkedDevicesSignOutAll => 'Kijelentkeztetés minden más eszközről';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Jelentkeztess ki $count eszközt',
      one: 'Jelentkeztess ki 1 eszközt',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Jelentkeztess ki $count eszközt',
      one: 'Jelentkeztess ki 1 eszközt',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Jelentkeztetés minden más eszközről';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ez kijelentkezteti a kijelölt eszközöket a fiókodból. Újra be kell jelentkezned azokon az eszközökön.',
      one:
          'Ez kijelentkezteti a kijelölt eszközt a fiókodból. Újra be kell jelentkezned azon az eszközön.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Ez kijelentkezteti a kijelölt eszközöket a fiókodból. Újra be kell jelentkezned azokon az eszközökön.';

  @override
  String get linkedDevicesSignOutConfirm => 'Folytatás';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Minden kijelentkeztetett eszközön újra be kell jelentkezned';

  @override
  String get linkedDevicesLoadErrorTitle => 'Hálózati hiba';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Problémáink vannak a tér-idő kontinuumhoz való kapcsolódással. Kérjük, ellenőrizd a kapcsolatodat, és próbáld újra.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eszközök visszavonva',
      one: 'Eszköz visszavonva',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Nem sikerült kijelentkeztetni. Próbáld újra.';

  @override
  String get linkedDevicesUnknownOs => 'Ismeretlen operációs rendszer';

  @override
  String get linkedDevicesUnknownPlatform => 'Ismeretlen platform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration lassú mód';
  }

  @override
  String get slowmodeTooltipActive =>
      'Lassú módban vagy. Kérlek, várj, mielőtt újabb üzenetet küldesz.';

  @override
  String get slowmodeTooltipImmune =>
      'A lassú mód engedélyezve van, de immunis vagy rá.';

  @override
  String get channelNoSendPermissionHint =>
      'Nem küldhetsz üzeneteket ebben a csatornában.';

  @override
  String systemDmComposerBarrier(String productName) {
    return '$productName munkatársaitól érkező rendszerértesítések. Ide nem válaszolhatsz.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Az üzenetküldés ideiglenesen szüneteltetve van ebben a közösségben.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Időkérésen vagy. Az üzenetküldés, reakciók és hanghívások szüneteltetve vannak az időkorlát lejártáig.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Igényelned kell a fiókodat az üzenetküldéshez ebben a közösségben.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Igényelned kell az e-mail címed igazolását az üzenetküldéshez ebben a közösségben.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'A fiókod túl új az üzenetküldéshez ebben a közösségben.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Nem vagy tagja ennek a közösségnek elég régóta az üzenetküldéshez.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Igazolnod kell egy telefonszámot az üzenetküldéshez ebben a közösségben.';

  @override
  String get channelComposerBarrierVerifyEmail => 'E-mail igazolása';

  @override
  String get channelComposerBarrierVerifyPhone => 'Telefonszám igazolása';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Túl sok melléklet ($max max)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'Egy vagy több fájl meghaladja a méretkorlátot';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Ezek a fájlok túl nagyok ahhoz, hogy együtt elküldhetők legyenek';

  @override
  String get chatAttachmentDropToUpload => 'Húzd ide a fájlokat a feltöltéshez';

  @override
  String get chatAttachmentDropToSend =>
      'Húzd ide a fájlokat az azonnali küldéshez';

  @override
  String get chatAttachmentSendVoiceMessage => 'Hangüzenet küldése';

  @override
  String get voiceMessageTitle => 'Hangüzenet';

  @override
  String get voiceMessageHoldHint =>
      'Tartsd lenyomva a rögzítéshez. Húzd felfelé a rögzítés zárolásához, vagy engedd el a küldéshez.';

  @override
  String get voiceMessageDiscard => 'Hangüzenet elvetése';

  @override
  String get voiceMessageSend => 'Hangüzenet küldése';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Nem lehet elindítani a rögzítést. Engedélyezd a mikrofon hozzáférését.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'A hangrögzítés nem támogatott ezen az eszközön.';

  @override
  String get voiceMessageMicInUse =>
      'Hagyd el a hanghívást a hangüzenet rögzítéséhez.';

  @override
  String get voiceMessageRecordingFailed =>
      'A rögzítés sikertelen volt. Próbáld újra.';

  @override
  String get voiceMessageSendFailed =>
      'Nem lehet elküldeni a hangüzenetet. Próbáld újra.';

  @override
  String get voiceMessageRecordingHint =>
      'Beszélj most. Nyomd meg a Leállítás gombot, ha végeztél – később vághatsz.';

  @override
  String get voiceMessageReviewHint =>
      'Húzd a fogantyúkat a vágáshoz, majd nyomd meg a Küldés gombot.';

  @override
  String get voiceMessageStop => 'Leállítás';

  @override
  String get voiceMessageStartRecording => 'Rögzítés indítása';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Lejátszás';

  @override
  String get voiceMessagePause => 'Szünet';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'A kiválasztásnak legalább $secondsString mp-nek kell lennie.';
  }

  @override
  String get chatAttachmentEditTitle => 'Melléklet szerkesztése';

  @override
  String get chatAttachmentFilenameLabel => 'Fájlnév';

  @override
  String get chatAttachmentDescriptionLabel => 'Leírás';

  @override
  String get chatAttachmentDescriptionHint => 'Opcionális alternatív szöveg';

  @override
  String get chatAttachmentSpoilerLabel => 'Megjelölés spoilerként';

  @override
  String get chatAttachmentRemove => 'Melléklet eltávolítása';

  @override
  String get chatAttachmentDownload => 'Letöltés';

  @override
  String get chatAttachmentExpiredTooltip => 'A melléklet lejárt';

  @override
  String get chatAttachmentSourceGallery => 'Galéria';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Fájlok tallózása';

  @override
  String get chatAttachmentPasteTooltip => 'Kép beillesztése a vágólapról';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Spoiler megjelenítése';

  @override
  String get matureMediaRevealButton => 'Megjelenítés';

  @override
  String get matureMediaRevealHint => 'Kattints a megjelenítéshez';

  @override
  String get matureContentTitle => 'Felnőtt tartalom';

  @override
  String get matureCommunityTitle => 'Érett közösség';

  @override
  String get matureCategoryTitle => 'Érett kategória';

  @override
  String get matureChannelTitle => 'Érett csatorna';

  @override
  String get communityContentWarningTitle =>
      'Közösségi tartalomra vonatkozó figyelmeztetés';

  @override
  String get categoryContentWarningTitle =>
      'Kategóriára vonatkozó tartalomra vonatkozó figyelmeztetés';

  @override
  String get channelContentWarningTitle =>
      'Csatornára vonatkozó tartalomra vonatkozó figyelmeztetés';

  @override
  String get defaultContentWarningBody => 'Ez érzékeny tartalmat tartalmaz.';

  @override
  String get matureCommunityBody =>
      'Ez a közösség érett tartalomra van jelölve, és olyan anyagokat tartalmazhat, amelyek némely felhasználó számára nem megfelelőek.';

  @override
  String get matureCategoryBody =>
      'Ez a kategória érett tartalomra van jelölve, és olyan anyagokat tartalmazhat, amelyek némely felhasználó számára nem megfelelőek.';

  @override
  String get matureChannelBody =>
      'Ez a csatorna érett tartalomra van jelölve, és olyan anyagokat tartalmazhat, amelyek némely felhasználó számára nem megfelelőek.';

  @override
  String get matureVoiceChannelBody =>
      'Ez a hangcsatorna érett tartalomra van jelölve, és olyan anyagokat tartalmazhat, amelyek némely felhasználó számára nem megfelelőek.';

  @override
  String get matureLinkChannelBody =>
      'Ez a linkcsatorna érett tartalomra van jelölve, és olyan anyagokat nyithat meg, amelyek némely felhasználó számára nem megfelelőek.';

  @override
  String get matureCommunityUnavailableBody =>
      'Ez az érett közösség nem elérhető a fiókod számára.';

  @override
  String get matureCategoryUnavailableBody =>
      'Ez az érett kategória nem elérhető a fiókod számára.';

  @override
  String get matureChannelUnavailableBody =>
      'Ez az érett csatorna nem elérhető a fiókod számára.';

  @override
  String get matureContentProceedButton => 'Tovább';

  @override
  String get matureContentUnderstandButton => 'Értem';

  @override
  String get matureContentOpenLinkButton => 'Hivatkozás megnyitása';

  @override
  String get sensitiveContentSectionTitle => 'Érzékeny tartalom';

  @override
  String get sensitiveContentSectionDescription =>
      'Szabályozd, hogyan szűrődjön az érett vagy érzékeny média különböző kontextusokban';

  @override
  String get sensitiveContentFriendDmLabel => 'Közvetlen üzenetek barátoktól';

  @override
  String get sensitiveContentNonFriendDmLabel => 'Közvetlen üzenetek másoktól';

  @override
  String get sensitiveContentGuildLabel => 'Üzenetek közösségi csatornákon';

  @override
  String get sensitiveContentFilterShow => 'Megjelenítés';

  @override
  String get sensitiveContentFilterBlur => 'Elmosás';

  @override
  String get sensitiveContentFilterBlock => 'Letiltás';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Média elmosása a biztonsági vizsgálat befejezéséig';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Ha engedélyezve van, a képek és videók elmosódnak, amíg a tartalombiztonsági vizsgálat be nem fejeződik.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Ez a beállítás mindig be van kapcsolva a fiókod számára.';

  @override
  String get sensitiveContentResetButton => 'Visszaállítás';

  @override
  String get sensitiveContentSaveButton => 'Mentés';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fájl',
      one: '1 fájl',
    );
    return '$_temp0 feltöltése folyamatban';
  }

  @override
  String get chatCancelUpload => 'Feltöltés megszakítása';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Lejárat: $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Lejárat: $start és $end között';
  }

  @override
  String get connectionsTitle => 'Kapcsolatok';

  @override
  String get connectionsDescription =>
      'Külső fiókok és domainek összekapcsolása a Fluxer profiloddal. A hitelesített kapcsolatok megjelennek a profilodon, hogy mások is láthassák őket.';

  @override
  String get connectionsEmptyTitle => 'Még nincsenek kapcsolatok';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Kapcsold össze a Bluesky-fiókodat, vagy hitelesítsd a domain tulajdonjogát, hogy megjelenjenek a profilodon.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Hitelesítsd a domain tulajdonjogát, hogy megjelenjen a profilodon.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domain';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Bluesky kapcsolat hozzáadása';

  @override
  String get connectionsAddDomainAriaLabel => 'Domain kapcsolat hozzáadása';

  @override
  String get connectionEdit => 'Szerkesztés';

  @override
  String get connectionRemove => 'Eltávolítás';

  @override
  String get connectionVerifiedLabel => 'Ez a kapcsolat hitelesítve lett.';

  @override
  String get connectionUnverifiedLabel =>
      'Ez a kapcsolat nem lett hitelesítve.';

  @override
  String get connectionAddTitle => 'Kapcsolat hozzáadása';

  @override
  String get connectionTypeLabel => 'Kapcsolat típusa';

  @override
  String get connectionHandleLabel => 'Felhasználónév';

  @override
  String get connectionDomainLabel => 'Tartomány';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Ez a kapcsolat már létezik.';

  @override
  String get connectionConnectBluesky => 'Csatlakozás Bluesky-val';

  @override
  String get connectionContinue => 'Tovább';

  @override
  String get connectionVerifyTitle => 'Kapcsolat ellenőrzése';

  @override
  String get connectionVerifyInstructions =>
      'Használd az alábbi rekordot a tartomány tulajdonjogának igazolásához.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT rekord';

  @override
  String get connectionDnsHostLabel => 'Gazda';

  @override
  String get connectionDnsValueLabel => 'Érték';

  @override
  String get connectionCopyHost => 'Gazda másolása';

  @override
  String get connectionCopyValue => 'Érték másolása';

  @override
  String get connectionCopied => 'Másolva!';

  @override
  String get connectionTokenFileTitle => 'A token fájl kiszolgálása';

  @override
  String get connectionTokenFileDescription =>
      'Töltsd le a **fluxer-verification** fájlt, és helyezd el a **.well-known** mappába, hogy érvényesíteni tudjuk a tartományt.';

  @override
  String get connectionTokenFileDownload => 'fluxer-verification letöltése';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'A fájl tartalmazza az ellenőrző tokent, amelyet a **$dnsUrl** címről fogunk lekérni.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'fluxer-verification mentése';

  @override
  String get connectionVerifyButton => 'Ellenőrzés';

  @override
  String get connectionBack => 'Vissza';

  @override
  String get connectionEditTitle => 'Kapcsolat szerkesztése';

  @override
  String get connectionEditDescription =>
      'Válaszd ki, ki láthatja ezt a kapcsolatot a profilodon.';

  @override
  String get connectionVisibilityEveryone => 'Mindenki';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Engedélyezd bárkinek, hogy lássa ezt a kapcsolatot a profilodon';

  @override
  String get connectionVisibilityFriends => 'Ismerősök';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Engedélyezd az ismerőseidnek, hogy lássák ezt a kapcsolatot';

  @override
  String get connectionVisibilityCommunityMembers => 'Közösségi tagok';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Engedélyezd a közösségeid tagjainak, hogy lássák ezt a kapcsolatot';

  @override
  String get connectionRemoveTitle => 'Kapcsolat eltávolítása';

  @override
  String get connectionRemoveDescription =>
      'Biztosan el akarod távolítani ezt a kapcsolatot? Ez a művelet nem vonható vissza.';

  @override
  String get connectionRemoveConfirm => 'Eltávolítás';

  @override
  String get connectionsLoadError => 'A kapcsolatok betöltése sikertelen';

  @override
  String get connectionsReorderError => 'A sorrend frissítése sikertelen';

  @override
  String get connectionInitiateFailed =>
      'Nem sikerült elindítani az ellenőrzést. Próbáld újra.';

  @override
  String get connectionVerifyFailed =>
      'Nem sikerült ellenőrizni. Ellenőrizd a DNS rekordodat, és próbáld újra.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Nem sikerült elindítani a Bluesky engedélyezést.';

  @override
  String get connectionUpdateFailed => 'Nem sikerült frissíteni a kapcsolatot';

  @override
  String get connectionRemoveFailed =>
      'Nem sikerült eltávolítani a kapcsolatot';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification mentve';

  @override
  String get connectionTokenSaveFailedToast => 'Nem sikerült a fájl mentése';

  @override
  String get connectionEnterHandle => 'Adjon meg egy Bluesky felhasználónevet.';

  @override
  String get connectionEnterDomain => 'Adjon meg egy tartományt.';

  @override
  String get lookAndFeelTitle => 'Megjelenés';

  @override
  String get lookAndFeelThemeSectionTitle => 'Téma';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Válassz a sötét, a szénszínű vagy a világos megjelenés között.';

  @override
  String get lookAndFeelThemeDark => 'Sötét téma';

  @override
  String get lookAndFeelThemeCoal => 'Szén téma';

  @override
  String get lookAndFeelThemeLight => 'Világos téma';

  @override
  String get lookAndFeelThemeSystem => 'Rendszertéma';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Szinkronizálja a témát az eszközök között';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Ha engedélyezve van, a téma módosításai szinkronizálódnak az összes eszközöddel. Ha le van tiltva, ez az eszköz a saját téma-beállítását használja.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'A Rendszer téma automatikusan letiltja a szinkronizálást, hogy ezen az eszközön kövesse a rendszered preferenciáit.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Nem sikerült szinkronizálni a témát a fiókoddal. Kérlek, próbáld újra.';

  @override
  String get lookAndFeelChatFontScalingTitle =>
      'Csevegés betűméretének skálázása';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Állítsd be a betűméretet a csevegési területen.';

  @override
  String get lookAndFeelInterfaceTitle => 'Felület';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Felület elemek és viselkedések testreszabása.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Csatornalista gépelési jelzői';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Válaszd ki, hogyan jelenjenek meg a gépelési jelzők a csatornalistában, amikor valaki gépel egy csatornában.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Gépelési jelző + Avatárok';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Gépelési jelző megjelenítése felhasználói avatárokkal a csatornalistában';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'Csak gépelési jelző';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Csak a gépelési jelző megjelenítése avatárok nélkül';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Rejtett';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ne jelenjenek meg gépelési jelzők a csatornalistában';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Gépelés mutatása a kiválasztott csatornán';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Ha le van tiltva (alapértelmezett), a gépelési jelzők nem jelennek meg az éppen megtekintett csatornán.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'általános';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Billentyűzet tippek';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Szabályozd, hogy a billentyűparancs-tippek megjelenjenek-e az eszköztippekben.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Billentyűzet tippek elrejtése az eszköztippekben';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Ha engedélyezve van, a parancsikonok elrejtésre kerülnek az eszköztippekben.';

  @override
  String get lookAndFeelNekoTitle => 'Egyéb';

  @override
  String get lookAndFeelNekoDescription => 'Egyéb felületi opciók.';

  @override
  String get lookAndFeelShowNekoLabel => 'Neko mutatása';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Ha engedélyezve van, Neko megjelenik a csevegés láblécében.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Hangcsatornához való csatlakozás viselkedése';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Szabályozd, hogyan csatlakozz hangcsatornákhoz a közösségekben.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Dupla kattintás szükséges a hangcsatornákhoz való csatlakozáshoz';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Ha engedélyezve van, dupla kattintással csatlakozhatsz a hangcsatornákhoz. Ha le van tiltva (alapértelmezett), egyetlen kattintással azonnal csatlakozol a csatornához.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'A gyors barna róka átugrik a lusta kutya felett.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Kiszolgáló oldalsáv';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Konfiguráld, hogyan jelenítse meg a kiszolgáló oldalsáv a közvetlen üzeneteket.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count közösség átmenetileg nem elérhető egy fluxus kondenzátor meghibásodása miatt.',
      one:
          '1 közösség átmenetileg nem elérhető egy fluxus kondenzátor meghibásodása miatt.',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'DM-ek összecsukása mappába';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Ha engedélyezve van, az olvasatlan DM-ek a kiszolgáló oldalsávban a Fluxer gomb mappájába lesznek összecsukva. Kattints a Fluxer gombra a DM-ek oldalon a mappa kibontásához vagy összecsukásához.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Csatornalista';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Szabályozd az olvasatlan jelzők viselkedését a némított csatornákon a csatornalistákban.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Olvasatlan jelző mutatása némított csatornákon';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Ha engedélyezve van, a némított csatornák halvány olvasatlan jelzőt mutatnak a bal oldalon. Az említések továbbra is megjelennek e beállításoktól függetlenül.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Most aktív';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Szabályozd, hogyan jelenjen meg a Most aktív az alkalmazásban.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Most aktív mutatása a kezdőképernyőn';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Mutasd a Most aktív funkciót a kezdőképernyőn, hogy lásd az aktív barátaidat hangcsatornákban. Látni fogsz egy előnézetet, a csatorna kontextusát, hogy kik vannak már ott, és gyors módot a csatlakozásra.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Kedvencek';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Szabályozd a kedvencek láthatóságát az alkalmazásban.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Kedvencek engedélyezése';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Ha engedélyezve van, csatornákat kedvelhetsz meg, és azok megjelennek a Kedvencek részben. Ha le van tiltva, az összes kedvencekkel kapcsolatos UI elem (gombok, menüelemek) el lesz rejtve. Meglévő kedvenceid megmaradnak.';

  @override
  String get favoritesTitle => 'Kedvencek';

  @override
  String get favoritesEmptyTitle => 'Még nincsenek kedvencek';

  @override
  String get favoritesEmptyDescription =>
      'Jelöld a csatornákat a csevegés fejlécében, hogy itt tartsd őket.';

  @override
  String get favoritesWelcomeTitle => 'Üdvözlünk a Kedvencek között';

  @override
  String get favoritesWelcomeDescription =>
      'A személyes helyed a kedvelt csatornák, DM-ek és csoportok gyors eléréséhez. Nyomd meg a csillagot bármelyik csatornán, hogy hozzáadd ide.';

  @override
  String get favoritesWelcomeTip => 'Nem neked való? Bármikor kikapcsolhatod.';

  @override
  String get favoritesDisableButton => 'Kedvencek kikapcsolása';

  @override
  String get favoritesAddedToast => 'Hozzáadva a Kedvencekhez';

  @override
  String get favoritesRemovedToast => 'Eltávolítva a Kedvencekből';

  @override
  String get favoritesHiddenToast => 'Kedvencek elrejtve';

  @override
  String get favoritesMute => 'Kedvencek némítása';

  @override
  String get favoritesUnmute => 'Kedvencek némításának feloldása';

  @override
  String get favoritesHeaderMenu => 'Kedvencek menü';

  @override
  String get favoritesCreateCategory => 'Kategória létrehozása';

  @override
  String get favoritesCategoryNameLabel => 'Kategória neve';

  @override
  String get favoritesHideMutedChannels => 'Némított csatornák elrejtése';

  @override
  String get favoritesShowMutedChannels => 'Némított csatornák mutatása';

  @override
  String get favoritesSetNickname => 'Becenév beállítása';

  @override
  String get favoritesNicknameLabel => 'Becenév';

  @override
  String get favoritesSaveNickname => 'Becenév mentése';

  @override
  String get favoritesMoveToCategory => 'Áthelyezés kategóriába';

  @override
  String get favoritesUncategorized => 'Kategoriálatlan';

  @override
  String get favoritesOtherCategory => 'Más';

  @override
  String get favoritesRemoveFromFavorites => 'Eltávolítás a Kedvencekből';

  @override
  String get favoritesAddToFavorites => 'Hozzáadás a Kedvencekhez';

  @override
  String get favoritesHideConfirmTitle => 'Kedvencek elrejtése';

  @override
  String get favoritesHideConfirmDescription =>
      'Ez elrejti az összes kedvencekkel kapcsolatos UI elemet, beleértve a gombokat és menüelemeket. Meglévő kedvenceid megmaradnak, és bármikor újra engedélyezheted őket a Beállítások > Speciális > Megjelenés menüpontban.';

  @override
  String get favoritesDirectMessageSubtitle => 'Közvetlen üzenet';

  @override
  String get messagesMediaDisplayGroupTitle => 'Megjelenítés';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Szabályozd, hogyan jelenjenek meg az üzenetek, média és egyéb tartalmak.';

  @override
  String get messagesMediaMediaGroupTitle => 'Média';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Szabja testre a média méretére és gombjaira vonatkozó beállításokat.';

  @override
  String get messagesMediaInputGroupTitle => 'Bevitel';

  @override
  String get messagesMediaInputGroupDescription =>
      'Szabja testre az üzenetbeviteli beállításokat.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Oldalsáv';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Konfigurálja a közösségi oldalsáv megjelenítését.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Némított csatornák elrejtése alapértelmezetten';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Automatikus némított csatornák elrejtése az oldalsávban, amikor új közösségekhez csatlakozol';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Némított csatornák elrejtése alapértelmezetten?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Az új közösségek, amelyekhez csatlakozol, automatikusan elrejtik a némított csatornákat. Szeretnéd ezt a beállítást az összes meglévő közösségedre is alkalmazni?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Némított csatornák elrejtésének leállítása alapértelmezetten?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Az új közösségek, amelyekhez csatlakozol, nem rejtik el automatikusan a némított csatornákat. Szeretnéd megmutatni a némított csatornákat az összes meglévő közösségedben?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Alkalmazás minden közösségre';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Mutatás minden közösségben';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Csak új közösségek';

  @override
  String get messagesMediaDisplaySectionTitle => 'Média megjelenítése';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Szabályozd, hogyan jelenjenek meg a képek, videók és egyéb médiaelemek. Minden média átméretezésre és konvertálásra kerül. Az extrém nagy fájlok, amelyeket nem lehet előnézetbe tömöríteni, nem lesznek beágyazva, függetlenül ezektől a beállításoktól.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Amikor linkként van közzétéve a csevegésben';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Amikor közvetlenül a Fluxerbe van feltöltve';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Link előnézetek';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Szabályozd, hogyan jelenjenek meg a weboldal linkek előnézetei a csevegésben';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Előnézetek és weboldal linkek megjelenítése';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakciók';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Emoji reakciók beállítása üzenetekhez';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Emoji reakciók megjelenítése az üzeneteken';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Rejtett tartalom';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'A rejtett tartalom megjelenítésének szabályozása';

  @override
  String get messagesMediaSpoilersRadioLabel =>
      'Rejtett tartalom megjelenítése';

  @override
  String get messagesMediaSpoilersOnClickName => 'Kattintásra';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Rejtett tartalom megjelenítése kattintáskor';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Az általam moderált csatornákon';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Mindig jelenítse meg a rejtett tartalmat azokon a csatornákon, ahol \"Üzenetek kezelése\" engedéllyel rendelkezik';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Mindig';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Mindig jelenítse meg a rejtett tartalmat';

  @override
  String get messagesMediaSizeSectionTitle => 'Média méretpreferenciák';

  @override
  String get messagesMediaSizeSectionDescription =>
      'A beágyazott és mellékelt média maximális megjelenítési méretének testreszabása. A kisebb méretek kevesebb helyet foglalnak, míg a nagyobbak több részletet mutatnak.';

  @override
  String get messagesMediaSizeEmbedLabel =>
      'Hivatkozásokból származó média (beágyazások)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Feltöltött mellékletek';

  @override
  String get messagesMediaSizeCompactName => 'Kompakt (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Kisebb média méret';

  @override
  String get messagesMediaSizeComfortableName => 'Kényelmes (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Nagyobb média méret, több részlettel';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF viselkedés';

  @override
  String get messagesMediaGifsSectionDescription =>
      'A GIF-ek csevegésbe való beszúrásának szabályozása';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Automatikus küldés kiválasztott GIF-ek esetén';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Kifejezés automatikus kiegészítése (kettőspontos kiegészítés)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Szabályozza, hogy mi jelenjen meg a kifejezés automatikus kiegészítésében, amikor kettőspontot ír. Testreszabhatja, hogy mely javaslatok jelenjenek meg a preferenciáinak megfelelően.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Alapértelmezett emojik megjelenítése a kifejezés automatikus kiegészítésében';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Egyéni emojik megjelenítése a kifejezés automatikus kiegészítésében';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Matricák megjelenítése a kifejezés automatikus kiegészítésében';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mentett média megjelenítése a kifejezés automatikus kiegészítésében';

  @override
  String get messagesMediaEditingSectionTitle => 'Üzenet szerkesztése';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Szabályozza, mi történjen a szerkesztési piszkozatával, amikor törli.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Szerkesztési piszkozat megőrzése törléskor';

  @override
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => 'Olvasatlan jelzők';

  @override
  String get accessibilityUnreadGroupDescription =>
      'Az olvasatlan üzenetjelzők megjelenítésének szabályozása.';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      'Halvány olvasatlan jelző megjelenítése némított csatornákon';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      'Halványított olvasatlan jelző megjelenítése a némított közvetlen üzenetek és csatornák mellett, így egy pillantással továbbra is láthatja, ha van aktivitás.';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM üzenetelőnézetek';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Szabályozza, mikor jelenjenek meg üzenetelőnézetek a DM listában.';

  @override
  String get accessibilityDmMessagePreviewModeLabel => 'DM üzenetelőnézet mód';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Minden üzenet';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Üzenetelőnézetek megjelenítése minden DM csevegéshez';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Csak olvasatlan DM-ek';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Csak az olvasatlan üzenetekkel rendelkező DM-ekhez jelenítsen meg üzenetelőnézeteket';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nincs';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ne jelenítsen meg üzenetelőnézeteket a DM listában';

  @override
  String get dmListSentAnAttachment => 'Mellékletet küldött';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username rögzített egy üzenetet ebbe a csatornába.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username hozzáadta $userName elemet a csoporthoz.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username hozzáadott valakit a csoporthoz.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username elhagyta a csoportot.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username eltávolította $userName elemet a csoportból.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username eltávolított valakit a csoportból.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username átnevezte a csatornát erre: $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username átnevezte a csatornát.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username megváltoztatta a csatorna ikonját.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username hívást indított.';
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
  String get voiceConnectionConfirmTitle => 'Hangkapcsolat megerősítése';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Már $count másik eszközről csatlakoztál ehhez a hangcsatornához. Mit szeretnél tenni?',
      one:
          'Már 1 másik eszközről csatlakoztál ehhez a hangcsatornához. Mit szeretnél tenni?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Váltás erre az eszközre';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Csatlakozás (tartsd meg a többi kapcsolatot)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Ne csinálj semmit, nem akarok csatlakozni';

  @override
  String get voiceChannelEmptyDescription =>
      'Ez egy hangcsatorna. Csatlakozz, hogy beszélhess!';

  @override
  String get voiceChannelJoin => 'Csatlakozás a hangcsatornához';

  @override
  String get voiceChannelJoinConnect => 'Csatlakozás hanghoz';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nincs engedélyed csatlakozni ehhez a hangcsatornához';

  @override
  String get voiceChannelE2eeEncrypted =>
      'A mikrofon, a kamera és a képernyőmegosztás tartalma végponttól végpontig titkosított.';

  @override
  String get voiceCallE2eeEncrypted =>
      'A mikrofon, a kamera és a képernyőmegosztás tartalma végponttól végpontig titkosított.';

  @override
  String get voiceChannelE2eeBroken =>
      'A végponttól végpontig tartó titkosítás nem érhető el, mert egy nem támogatott résztvevő van ebben a hangcsatornában.';

  @override
  String get voiceCallE2eeBroken =>
      'A végponttól végpontig tartó titkosítás nem érhető el, mert egy nem támogatott résztvevő van ebben a hívásban.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Ezt az klienst frissíteni kell a titkosított hívásba való belépés előtt.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nem sikerült elindítani a mikrofont. Továbbra is a hívásban vagy.';

  @override
  String get voiceChannelStatusConnecting => 'Csatlakozás…';

  @override
  String get voiceChannelStatusConnected => 'Csatlakoztatva';

  @override
  String get voiceChannelStatusError => 'Hiba';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobil eszköz';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Asztali eszköz';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Közösség némította le';

  @override
  String get voiceParticipantTooltipMuted => 'Némítva';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Közösség süketítette le';

  @override
  String get voiceParticipantTooltipDeafened => 'Süketítve';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Kapcsolat: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count résztvevő',
      one: '1 résztvevő',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Kilépés';

  @override
  String get voiceControlMute => 'Némítás';

  @override
  String get voiceControlUnmute => 'Némítás feloldása';

  @override
  String get voiceControlDeafen => 'Süketítés';

  @override
  String get voiceControlUndeafen => 'Süketítés feloldása';

  @override
  String get voiceControlVideo => 'Videó';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'Képernyőmegosztás';

  @override
  String get voiceScreenShareNotificationText => 'Megosztod a képernyődet.';

  @override
  String get voiceControlMore => 'Továbbiak';

  @override
  String get voiceControlDisconnect => 'Kapcsolat bontása';

  @override
  String get voiceControlChat => 'Csevegés';

  @override
  String get voiceTextChatShow => 'Csevegés megjelenítése';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# olvasatlan üzenet',
      one: '# olvasatlan üzenet',
    );
    return 'Csevegés megjelenítése $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'A videóhoz kamerahasználati engedély szükséges.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Nem sikerült elindítani a képernyőmegosztást. Kérlek, próbáld újra.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'A képernyőmegosztási engedély megtagadva.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'A képernyőmegosztás nem érhető el ezen az eszközön.';

  @override
  String get voiceWatchStream => 'Stream megtekintése';

  @override
  String get voiceStopWatching => 'Leállítás';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Leállítja az aktuális stream megtekintését';

  @override
  String get voiceOwnScreenShareTitle => 'Te közvetítesz';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'A streamed élőben látható a résztvevők számára.';

  @override
  String get voiceLiveBadge => 'ÉLŐ';

  @override
  String get dmVoiceViewCall => 'Hívás megtekintése';

  @override
  String get dmVoiceCallFullScreen => 'Teljes képernyő';

  @override
  String get dmVoiceCallFullScreenTooltip =>
      'Hívás megnyitása teljes képernyőn';

  @override
  String get dmVoiceStripStatusConnecting => 'Kapcsolódás…';

  @override
  String get dmVoiceStripStatusInCall => 'Hívásban';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Hanghívás';

  @override
  String get dmVoiceCallBarConnecting => 'Kapcsolódás…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Közvetlen hívás';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Csoportos hívás';

  @override
  String get dmVoiceCallBarIssueFallback => 'Hangprobléma';

  @override
  String get dmVoiceFullscreenTitle => 'Hang';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Hangkapcsolat létrejött';

  @override
  String get notificationsPageTitle => 'Értesítések';

  @override
  String get notificationsFilterUnreads => 'Olvasatlanok';

  @override
  String get notificationsFilterMentions => 'Említések';

  @override
  String get notificationsBookmarksTooltip => 'Könyvjelzők';

  @override
  String get notificationsMentionFilterTooltip => 'Említések szűrése';

  @override
  String get notificationsMentionFiltersTitle => 'Említésszűrők';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Tartalmazza a @everyone és @here említéseket';

  @override
  String get notificationsMentionIncludeRoles =>
      'Tartalmazza a szerepkör említéseket';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Tartalmazza az összes közösségi említést';

  @override
  String get notificationsNoUnreadTitle => 'Nincsenek olvasatlan üzenetek';

  @override
  String get notificationsNoUnreadBody => 'Minden naprakész.';

  @override
  String get notificationsNoMentionsTitle => 'Nincsenek új említések';

  @override
  String get notificationsNoMentionsBody =>
      'Minden, ami téged említ, itt jelenik meg 7 napig.';

  @override
  String get notificationsMentionsEndTitle => 'Elérted a végét';

  @override
  String get notificationsMentionsEndBody =>
      'Láttad az összes új említésedet. Ne aggódj, hamarosan újabbak jelennek meg itt.';

  @override
  String get notificationsJump => 'Ugrás';

  @override
  String get notificationsRemoveMentionTooltip => 'Említés eltávolítása';

  @override
  String get notificationsViewAllUnread => 'Összes olvasatlan megtekintése';

  @override
  String get notificationsMarkAsRead => 'Olvasottként jelölés';

  @override
  String get notificationsExpand => 'Kibontás';

  @override
  String get notificationsCollapse => 'Összecsukás';

  @override
  String get notificationsMessageUnavailable => 'Az üzenet nem tölthető be.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining karakter maradt';
  }

  @override
  String get characterCounterTooLong => 'Az üzenet túl hosszú';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining karakter maradt. Szerezd meg a(z) $productName terméket, hogy akár $premiumMaxLength karaktert írhass.';
  }

  @override
  String get chatMessageFailedToSend => 'Az üzenet küldése sikertelen';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Az üzenetedet nem lehetett kézbesíteni. Ez általában azért van, mert nem osztasz meg közösséget a címzettel, vagy a címzett csak a barátaitól fogad közvetlen üzeneteket. Lehet, hogy a saját közvetlen üzenetküldési adatvédelmi beállításaidat is módosítanod kell a(z) $settingsPath oldalon.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Az üzenetedet nem lehetett kézbesíteni. Fiókod igénylésével tudsz közvetlen üzeneteket küldeni.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Az üzenetedet nem lehetett kézbesíteni. Fiókod igénylésével tudsz üzeneteket küldeni.';

  @override
  String get chatSendFailureContentBlocked =>
      'Az üzenetedet nem lehetett kézbesíteni, mert a biztonsági rendszereink jelölték. Ha úgy gondolod, hogy ez hiba, kérjük, lépj kapcsolatba az ügyfélszolgálattal.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Az üzenetedet nem lehetett kézbesíteni, mert olyan felnőtt tartalmú hangulatjeleket vagy matricákat tartalmaz, amelyek ebben a kontextusban nem engedélyezettek.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Csak te láthatod ezt az üzenetet.';

  @override
  String get chatClientSystemDismiss => 'Elvetés';

  @override
  String get privacyDashboardCommunicationSection => 'Kommunikáció';

  @override
  String get chatMessageDeleteFailed => 'Törlés sikertelen';

  @override
  String get chatMessageAddReaction => 'Reakció hozzáadása';

  @override
  String get chatMessageEdit => 'Üzenet szerkesztése';

  @override
  String get chatMessageReply => 'Válasz';

  @override
  String get chatMessageForward => 'Továbbítás';

  @override
  String get forwardMessageTitle => 'Üzenet továbbítása';

  @override
  String get forwardSearchHint => 'Csatornák vagy DM-ek keresése';

  @override
  String get forwardDirectMessagesSection => 'Közvetlen üzenetek';

  @override
  String get forwardCommentHint => 'Megjegyzés hozzáadása (opcionális)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Küldés ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Nem található csatorna';

  @override
  String get forwardSuccessToast => 'Üzenet továbbítva';

  @override
  String get forwardFailed => 'Az üzenet továbbítása sikertelen';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Megjegyzések nem érhetők el, mert a kiválasztott csatornán be van kapcsolva a lassú mód.';

  @override
  String get forwardDestinationNoSendPermission =>
      'Nem küldhetsz ide üzeneteket';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Nem tudsz ide linkeket beágyazni';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Nem tudsz ide fájlokat csatolni';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Üzenetküldés letiltva ebben a közösségben';

  @override
  String get forwardDestinationTimedOut =>
      'Időkérésben vagy ebben a közösségben';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Lassú mód – várj $remaining';
  }

  @override
  String get chatMessageCopyText => 'Üzenet másolása';

  @override
  String get chatMessagePin => 'Üzenet rögzítése';

  @override
  String get chatMessageUnpin => 'Üzenet rögzítésének megszüntetése';

  @override
  String get chatMessageUnpinIt => 'Rögzítés megszüntetése';

  @override
  String get chatMessageBookmark => 'Üzenet könyvjelzőzése';

  @override
  String get chatMessageRemoveBookmark => 'Könyvjelző eltávolítása';

  @override
  String get chatMessageMarkAsUnread => 'Megjelölés olvasatlanként';

  @override
  String get chatMessageCopyMessageLink => 'Üzenet hivatkozásának másolása';

  @override
  String get chatMessageCopyMessageId => 'Üzenet ID másolása';

  @override
  String get chatMessageViewReactions => 'Reakciók megtekintése';

  @override
  String get chatMessageRemoveAllReactions => 'Összes reakció eltávolítása';

  @override
  String get chatMessageDebug => 'Üzenet hibakeresése';

  @override
  String get chatMessageDebugSheetTitle => 'Üzenet hibakeresése';

  @override
  String get chatMessageDebugCopyJson => 'JSON másolása';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Üzenet JSON másolva a vágólapra';

  @override
  String get chatReactionsSheetTitle => 'Reakciók';

  @override
  String get chatReactionsSheetEmpty => 'Még senki sem reagált erre.';

  @override
  String get chatMessageReport => 'Üzenet jelentése';

  @override
  String get iarReportMessageTitle => 'Üzenet jelentése';

  @override
  String get iarThisUserFallback => 'ezt a felhasználót';

  @override
  String get iarModalDescription =>
      'Jelents egy szabálysértést, vagy keress eszközöket a kapcsolatok és beállítások kezeléséhez.';

  @override
  String get iarPathStepAriaLabel => 'Mire van szükséged?';

  @override
  String get iarCategoryStepTitle => 'Milyen szabálysértés történt?';

  @override
  String get iarReasonStepTitle => 'Melyik szabálysértés történt?';

  @override
  String get iarReasonSelectHint => 'Válassz okot';

  @override
  String get iarPickAnOptionToast => 'Válassz egy opciót a folytatáshoz.';

  @override
  String get iarPickARuleToast => 'Válaszd ki a megsértett szabályt.';

  @override
  String get iarPathPlatform => 'Platformszabály-sértés jelentése';

  @override
  String get iarPathCommunity =>
      'Jelentés ennek a közösségnek a moderátorainak';

  @override
  String get iarPathPreferenceMessage => 'Nem kedvelem ezt a tartalmat';

  @override
  String get iarCategoryTargetedHarmLabel => 'Fenyegetés, zaklatás vagy kár';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Zaklatás, gyűlöletbeszéd, erőszak, rajtaütés vagy önkárosításra buzdító tartalom.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Gyermekvédelem vagy felnőtt tartalom';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Kiskorúak veszélyben, felnőtt tartalom nem megfelelő helyen, vagy nem kívánt viselkedés.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Adatvédelem vagy személyiséglopás';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, zaklatás, másnak kiadni magát, vagy nem megfelelő profil.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Csalás, kártevő szoftver vagy félretájékoztatás';

  @override
  String get iarCategoryDeceptionDescription =>
      'Adathalászat, csalás, kártékony linkek vagy valós kárt okozó hamis állítások.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Illegális tevékenység vagy valami más';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Illegális értékesítés, bűncselekmény elősegítése, vagy egyértelmű szabályszegés, ami nem illeszkedik a fentiekhez.';

  @override
  String get iarReasonHarassmentLabel => 'Zaklatás vagy fenyegetés';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Zaklatás, ismételt nem kívánt kapcsolatfelvétel, követés vagy célzott bántalmazás.';

  @override
  String get iarReasonHateLabel => 'Gyűlöletbeszéd';

  @override
  String get iarReasonHateMessageDescription =>
      'Sértő kifejezések, dehumanizáló nyelv vagy védett csoportok elleni támadások.';

  @override
  String get iarReasonViolenceLabel =>
      'Erőszak vagy erőszakkal való fenyegetés';

  @override
  String get iarReasonViolenceDescription =>
      'Hiteles fenyegetések, grafikus erőszak vagy erőszak dicsőítése.';

  @override
  String get iarReasonMatureContentLabel => 'Felnőtt tartalom vagy zaklatás';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Nem kívánt viselkedés vagy felnőtt tartalom nem megfelelő helyen.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Gyermekvédelem vagy kiskorúak kizsákmányolása';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Grooming vagy kiskorúakat kizsákmányoló tartalom.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Káros félretájékoztatás';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Valós kárt okozó hamis állítások.';

  @override
  String get iarReasonSpamLabel => 'Spam, csalás vagy adathalászat';

  @override
  String get iarReasonSpamMessageDescription =>
      'Tömeges spam, csalás, hamis nyereményjátékok vagy fiók-visszaélés.';

  @override
  String get iarReasonMalwareLabel => 'Kártevő szoftver vagy veszélyes linkek';

  @override
  String get iarReasonMalwareDescription =>
      'Kártevő szoftver, jelszólopás vagy káros fájlok.';

  @override
  String get iarReasonPrivacyLabel => 'Adatvédelmi sérelem';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, kiszivárgott privát információk vagy zaklatás.';

  @override
  String get iarReasonImpersonationLabel =>
      'Személyiséglopás vagy megtévesztő média';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Másoknak kiadni magát, beleértve a megtévesztő AI által generált tartalmat is.';

  @override
  String get iarReasonIllegalLabel => 'Illegális tevékenység';

  @override
  String get iarReasonIllegalDescription =>
      'Illegális értékesítés, bűncselekmény elősegítése vagy jogellenes tevékenység.';

  @override
  String get iarReasonSelfHarmLabel => 'Önkárosítás vagy öngyilkosság';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Önkárosításra vagy evészavarokra buzdító promóció vagy utasítások.';

  @override
  String get iarReasonOtherLabel => 'Egyéb egyértelmű szabályszegés';

  @override
  String get iarReasonOtherDescription =>
      'Csak akkor használd, ha egyértelműen megszegi a Fluxer szabályait, és nem illeszkedik a fentiekhez.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Ha kiskorú érintett, használd ehelyett a(z) „$childSafetyReason” opciót.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Ha ez kiskorúak sérelmére elkövetett szexuális bűncselekményt (CSAM) vagy kizsákmányolást érint, küldd el azonnal, és ne oszd meg újra az anyagot.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Ha valaki azonnali veszélyben lehet, lépj kapcsolatba a helyi segélyhívóval, ha ezt biztonságosan megteheted.';

  @override
  String get iarSafetyNoteViolence =>
      'Ha ez egy hiteles, közvetlen fenyegetés, szintén lépj kapcsolatba a helyi segélyhívóval.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Ha ez egy közvetlen terrorfenyegetés, szintén lépj kapcsolatba a helyi segélyhívóval.';

  @override
  String get iarActionBlockUserTitle => 'Blokkolás';

  @override
  String get iarActionBlockUserDescription =>
      'Üzenetek és barátfelkérések blokkolása.';

  @override
  String get iarActionBlockUserButton => 'Blokkolás';

  @override
  String get iarActionCopyMessageLinkTitle => 'Üzenet hivatkozásának másolása';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Oszd meg a közösségi moderátorokkal.';

  @override
  String get iarActionCopyMessageLinkButton => 'Másolás';

  @override
  String get iarActionCloseDmTitle => 'DM bezárása';

  @override
  String get iarActionCloseDmDescription =>
      'Nem blokkol. Később újra megnyithatod.';

  @override
  String get iarActionCloseDmButton => 'DM bezárása';

  @override
  String get iarActionLeaveCommunityTitle => 'Elhagyom a közösséget';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Ne lássam a tartalmát és a tagjait.';

  @override
  String get iarActionLeaveCommunityButton => 'Elhagyás';

  @override
  String get iarActionDmSettingsTitle => 'DM és ismerős kérés beállításai';

  @override
  String get iarActionDmSettingsDescription => 'Változtasd meg, ki érhet el.';

  @override
  String get iarActionCallSettingsTitle =>
      'Hívás és csoportos csevegés beállításai';

  @override
  String get iarActionCallSettingsDescription =>
      'Változtasd meg, ki hívhat vagy adhat hozzá.';

  @override
  String get iarActionOpenButton => 'Megnyitás';

  @override
  String get iarActionDeleteMessageTitle => 'Töröld ezt az üzenetet';

  @override
  String get iarActionDeleteMessageDescription =>
      'Távolítsd el mindenki számára a csatornából.';

  @override
  String get iarActionDeleteMessageButton => 'Törlés';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Törölve';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'Ez az üzenet már törölve lett.';

  @override
  String get iarActionBanUserTitle => 'Tiltsd le ezt a felhasználót';

  @override
  String get iarActionBanUserDescription =>
      'Nyisd meg a letiltási párbeszédablakot ehhez a közösséghez.';

  @override
  String get iarActionBanUserButton => 'Letiltás';

  @override
  String get iarActionBanUserBannedButton => 'Letiltva';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Ez a felhasználó már le van tiltva a közösségből.';

  @override
  String get iarCloseDmConfirmTitle => 'DM bezárása';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Zárd be a jelenlegi DM-edet $name felhasználóval. Ez nem blokkolja őket; később újra megnyithatod.';
  }

  @override
  String get iarSuccessTitle => 'Jelentés elküldve';

  @override
  String get iarSuccessBody =>
      'Biztonsági csapatunk áttekinti. DM-ben és e-mailben értesítünk, amint döntést hoztunk.';

  @override
  String get iarAlreadyReportedTitle => 'Már jelentetted';

  @override
  String get iarAlreadyReportedBody =>
      'Már jelentetted ezt az üzenetet. Biztonsági csapatunk áttekinti.';

  @override
  String get iarBackButton => 'Vissza';

  @override
  String get iarContinueButton => 'Tovább';

  @override
  String get iarSendReportButton => 'Jelentés küldése';

  @override
  String get iarDoneButton => 'Kész';

  @override
  String get iarCouldntSendToast =>
      'Nem sikerült elküldeni a jelentést. Kérlek, próbáld újra.';

  @override
  String get iarRateLimitedToast =>
      'Túl gyorsan jelentesz. Kérlek, várj egy pillanatot, és próbáld újra.';

  @override
  String get iarReportSentToast =>
      'Jelentés elküldve. Biztonsági csapatunk áttekinti.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Blokkolod $name felhasználót? Nem tud majd üzenetet küldeni neked, vagy ismerősnek jelölni. Később feloldhatod a blokkot.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Nem sikerült blokkolni ezt a felhasználót. Kérlek, próbáld újra.';

  @override
  String get iarCloseDmSuccessToast => 'DM bezárva.';

  @override
  String get iarCloseDmFailedToast =>
      'Nem sikerült bezárni ezt a DM-et. Kérlek, próbáld újra.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Nem sikerült elhagyni ezt a közösséget. Kérlek, próbáld újra.';

  @override
  String get chatMessageSuppressEmbeds => 'Lejáratás elnyomása';

  @override
  String get chatMessageUnsuppressEmbeds => 'Lejáratás megjelenítése';

  @override
  String get chatMessageDelete => 'Üzenet törlése';

  @override
  String get chatMessageDeleteConfirmTitle => 'Üzenet törlése';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Biztosan törölni szeretnéd ezt az üzenetet?';

  @override
  String get chatMessageMore => 'Továbbiak';

  @override
  String get chatEditingMessage => 'Üzenet szerkesztése';

  @override
  String get chatReplyOriginalDeleted => 'Az eredeti üzenet törölve lett';

  @override
  String get chatReplyOriginalFailedToLoad =>
      'Az eredeti üzenet betöltése sikertelen';

  @override
  String get chatReplyAttachedMedia => 'Az üzenet mellékelt médiát tartalmaz';

  @override
  String get chatMessagesLoadError => 'Nem sikerült betölteni az üzeneteket.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Felülírjam az említés beállításait?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname felhasználó preferálja az @említéseket a válaszokban. Küldjem el említés nélkül így is?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname nem szeretné, ha válaszaid @mentionnel érkeznének. Küldjem mégis a mentionnel?';
  }

  @override
  String get chatReplyMentionIgnorePreference =>
      'Figyelmen kívül hagyom az előnyben részesítést';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Kattints ide, hogy ne értesítsd a felhasználót, akinek válaszolsz.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Kattints ide, hogy értesítsd a felhasználót, akinek válaszolsz.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Válaszolt felhasználó említése';

  @override
  String get chatReplyMentionOn => 'Be';

  @override
  String get chatReplyMentionOff => 'Ki';

  @override
  String get chatReplyCancel => 'Válasz törlése';

  @override
  String get chatEditMessageHint => 'Üzenet szerkesztése';

  @override
  String get chatEditNoChanges => 'Nincsenek menthető változtatások';

  @override
  String get chatChannelNotReady =>
      'Ez a csatorna még nem áll készen. Próbáld meg később.';

  @override
  String get chatMessageEdited => '(szerkesztve)';

  @override
  String get chatMessageSilent => 'Ez egy @silent üzenet volt.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Ma $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Tegnap $time';
  }

  @override
  String get mediaViewerImagePreview => 'Kép előnézete';

  @override
  String get mediaViewerClose => 'Médiaablak bezárása';

  @override
  String get mediaViewerOpenInBrowser => 'Megnyitás böngészőben';

  @override
  String get mediaViewerForward => 'Továbbítás';

  @override
  String get mediaViewerZoomIn => 'Nagyítás';

  @override
  String get mediaViewerZoomOut => 'Kicsinyítés';

  @override
  String get mediaViewerPreviousAttachment => 'Előző melléklet';

  @override
  String get mediaViewerNextAttachment => 'Következő melléklet';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String get chatAttachmentVideoToggleControls =>
      'Videóvezérlők megjelenítése/elrejtése';

  @override
  String get chatAttachmentVideoMute => 'Videó némítása';

  @override
  String get chatAttachmentVideoUnmute => 'Videó hangosítása';

  @override
  String get chatAttachmentVideoPlay => 'Videó lejátszása';

  @override
  String get chatAttachmentVideoPause => 'Videó szüneteltetése';

  @override
  String get chatAttachmentVideoProgress => 'Videó állása';

  @override
  String get chatVideoPlaybackFailed => 'A videó nem játszható le.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Értesíti az ezzel a szerepkörrel rendelkező felhasználókat, akiknek van engedélyük a csatorna megtekintésére.';

  @override
  String get addGuildModalTitle => 'Közösség hozzáadása';

  @override
  String get addGuildModalLandingDescription =>
      'Hozzon létre új közösséget, vagy csatlakozzon egy meglévőhöz.';

  @override
  String get addGuildCreateCommunity => 'Közösség létrehozása';

  @override
  String get addGuildJoinCommunity => 'Közösséghez csatlakozás';

  @override
  String get addGuildImportDiscordTemplate => 'Discord sablon importálása';

  @override
  String get addGuildJoinTitle => 'Csatlakozás egy közösséghez';

  @override
  String get addGuildJoinDescription =>
      'Adja meg a meghívó linket a közösséghez való csatlakozáshoz.';

  @override
  String get addGuildInviteLinkLabel => 'Meghívó link';

  @override
  String get addGuildJoinSubmit => 'Csatlakozás a közösséghez';

  @override
  String get addGuildInviteInvalid => 'Ez a meghívó érvénytelen, vagy lejárt.';

  @override
  String get addGuildJoinFailed =>
      'Nem sikerült csatlakozni a közösséghez. Kérjük, próbálja újra.';

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
  String get addGuildPackInstalled => 'A csomag sikeresen telepítve.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Összes reakció eltávolítása';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Biztosan el szeretné távolítani az összes reakciót erről az üzenetről?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Üzenet leválasztása';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Visszatekerjük ezt a pin-t az időben?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username rögzítette $messageLink ebben a csatornában. Lásd: $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'egy üzenetet';

  @override
  String get systemPinMessageAllPinsLink => 'az összes rögzített üzenetet';

  @override
  String get channelPinsEmptyTitle => 'Nincsenek rögzített üzenetek';

  @override
  String get channelPinsEmptyDescription =>
      'Itt jelennek meg a rögzített üzenetek.';

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
  String get personalNotesTitle => 'Személyes jegyzetek';

  @override
  String get personalNotesSubtitle =>
      'A saját privát helyed gondolatoknak és emlékeztetőknek';

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
    return 'Üdvözlünk a(z) $channelName csatornában';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Kezdetben nem volt semmi. Aztán jött a(z) $channelName. És jó volt.';
  }

  @override
  String get personalNotesComposerHint => 'Írj magadnak üzenetet';

  @override
  String get personalNotesPrivateSpace => 'A saját privát helyed';

  @override
  String get purgePersonalNotes => 'Személyes jegyzetek törlése';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Ez véglegesen törölni fog minden üzenetet és mellékletet a személyes jegyzeteidből. Ezt nem lehet visszavonni.';

  @override
  String get purgePersonalNotesConfirmButton => 'Törlés';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count üzenet törölve a személyes jegyzeteidből';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty =>
      'A személyes jegyzetek már üresek voltak';

  @override
  String get purgePersonalNotesFailed =>
      'Nem sikerült törölni a személyes jegyzeteket';

  @override
  String get userSettingsGroupYourAccount => 'A SZÁMLÁD';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Biztonság és bejelentkezés';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Ajándékok és kódok';

  @override
  String get userSettingsNavExpressionPacks => 'Emotikon csomagok';

  @override
  String get userSettingsNavPrivacyDashboard => 'Adatvédelmi irányítópult';

  @override
  String get userSettingsNavAuthorizedApps => 'Engedélyezett alkalmazások';

  @override
  String get userSettingsNavBlockedUsers => 'Letiltott felhasználók';

  @override
  String get userSettingsNavLinkedDevices => 'Csatlakoztatott eszközök';

  @override
  String get userSettingsNavConnections => 'Kapcsolatok';

  @override
  String get userSettingsNavLookAndFeel => 'Megjelenés';

  @override
  String get userSettingsNavAccessibility => 'Kisegítő lehetőségek';

  @override
  String get userSettingsNavMessagesAndMedia => 'Üzenetek és média';

  @override
  String get userSettingsNavAudioAndVideo => 'Hang és videó';

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
  String get userSettingsNavSoundsAndAlerts => 'Hangok és riasztások';

  @override
  String get userSettingsNavLanguageAndTime => 'Nyelv és idő';

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
  String get userSettingsNavAdvanced => 'Speciális';

  @override
  String get advancedPerformanceReportingTitle => 'Teljesítményjelentés';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Segíts a Fluxer fejlesztésében névtelen hiba- és teljesítményadatok megosztásával.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Küldj hiba- és teljesítményjelentéseket';

  @override
  String get advancedPerformanceReportingDescription =>
      'Az összes jelentett adat névtelen, és csak a Fluxer saját felügyeleti szolgáltatásába kerül – nem használunk harmadik féltől származó szolgáltatókat.';

  @override
  String get userSettingsNavApplications => 'Alkalmazások';

  @override
  String get userSettingsNavAppLogs => 'Alkalmazásnaplók';

  @override
  String get userSettingsNavDeveloperTools => 'Fejlesztői eszközök';

  @override
  String get userSettingsNavLimitsConfig => 'Korlátok konfigurálása';

  @override
  String get userSettingsNavFeatureFlags => 'Funkciójelzők';

  @override
  String get userSettingsNavWhatsNew => 'Újdonságok';

  @override
  String get userSettingsNavLogOut => 'Kijelentkezés';

  @override
  String get betaWarningTitle => 'Béta szoftver';

  @override
  String get betaWarningMessage =>
      'Ez egy béta szoftver. Még nem minden funkció készült el vagy lett hozzáadva.';

  @override
  String get betaWarningReportIssues =>
      'Kérjük, jelentsd az esetleges problémákat a Fluxer Mobile közösségnek (jelenleg Plutoniummal tudsz csak csatlakozni a közösséghez).';

  @override
  String get betaWarningRepoLink => 'Forrás megtekintése a GitHubon';

  @override
  String get betaWarningGotIt => 'Értettem';

  @override
  String get quickSwitcherTabSearch => 'Keresés';

  @override
  String get quickSwitcherTabFriends => 'Ismerősök';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Csatornák, személyek vagy közösségek keresése';

  @override
  String get quickSwitcherSearchFriends => 'Ismerősök keresése';

  @override
  String get quickSwitcherNoMatchesFound => 'Nincs találat';

  @override
  String get quickSwitcherEmptyHint =>
      'Próbálkozz más névvel, vagy használj @ / # / ! / * előtagokat az eredmények szűréséhez.';

  @override
  String get quickSwitcherSectionPeople => 'Személyek';

  @override
  String get quickSwitcherSectionGroupMessages => 'Csoportos üzenetek';

  @override
  String get quickSwitcherSectionTextChannels => 'Szöveges csatornák';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Hangcsatornák';

  @override
  String get quickSwitcherSectionCommunities => 'Közösségek';

  @override
  String get quickSwitcherSectionSettings => 'Beállítások';

  @override
  String get quickSwitcherHomeLabel => 'Kezdőlap';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Névjegyek';

  @override
  String get quickSwitcherFavoritesLabel => 'Kedvencek';

  @override
  String get quickSwitcherUserSettingsLabel => 'Felhasználói beállítások';

  @override
  String get quickSwitcherNotificationsLabel => 'Értesítések';

  @override
  String get quickSwitcherBookmarksLabel => 'Könyvjelzők';

  @override
  String get quickSwitcherMentionsLabel => 'Említések';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Még nincsenek ismerősök';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Adj hozzá egy ismerőst az indításhoz.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nincs ismerős, aki megfelelne a keresésnek';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Próbálkozz más névvel.';

  @override
  String get quickSwitcherSearchAliasUser => 'Felhasználó';

  @override
  String get quickSwitcherSearchAliasYou => 'Te';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Üzenetek';

  @override
  String get quickSwitcherSearchAliasMessages => 'Üzenetek';

  @override
  String get quickSwitcherSearchAliasFav => 'Kedvenc';

  @override
  String get quickSwitcherSearchAliasStarred => 'Csillagozott';

  @override
  String get quickSwitcherSearchAliasInbox => 'Beérkezett';

  @override
  String get quickSwitcherSearchAliasSaved => 'Mentett';

  @override
  String get uiClose => 'Bezárás';

  @override
  String get chatJumpToBottom => 'Ugrás alulra';

  @override
  String get uiConfirm => 'Megerősítés';

  @override
  String get uiLoading => 'Betöltés';

  @override
  String get uiUnsavedChanges => 'Nem mentett módosítások';

  @override
  String get uiReset => 'Visszaállítás';

  @override
  String get uiOpenColorPicker => 'Színválasztó megnyitása';

  @override
  String get uiSelectPlaceholder => 'Kiválasztás';

  @override
  String get uiSearchPlaceholder => 'Keresés';

  @override
  String get uiNoOptionsFound => 'Nincs találat';

  @override
  String get uiDismissNotification => 'Értesítés elvetése';

  @override
  String get uiColorPickerTitle => 'Színválasztó';

  @override
  String get mentionConfirmTitle => 'Mindenkit említesz?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Ez $count tagot értesít. Folytatod?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Ez $count online tagot értesít. Folytatod?';
  }

  @override
  String get mentionConfirmButton => 'Említés';

  @override
  String get composerEmojiUnavailable => 'Nem használhatod ezt az emojit itt.';

  @override
  String get instanceUrlLabel => 'Példány URL';

  @override
  String get instanceUrlPlaceholder =>
      'Add meg a példány URL-jét (pl. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Visszaállítás Fluxer-re';

  @override
  String get instanceConnect => 'Csatlakozás';

  @override
  String get instanceConnecting => 'Csatlakozás…';

  @override
  String get instanceConnectFailed => 'Nem sikerült csatlakozni az instanchoz';

  @override
  String get recentInstances => 'Legutóbbi instanciák';

  @override
  String removeRecentInstance(String domain) {
    return '$domain eltávolítása a legutóbbi instanciák közül';
  }

  @override
  String get instanceSheetTitle => 'Csatlakozás instanchoz';

  @override
  String get connectToDifferentInstance => 'Csatlakozás egy másik instanchoz';

  @override
  String get changeInstance => 'Váltás';

  @override
  String get instanceConnectionRequired =>
      'Csatlakozz az instanchoz a bejelentkezéshez';

  @override
  String get comingSoon => 'Hamarosan';

  @override
  String get guildNavbarDirectMessages => 'Névjegyek';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Fedezd fel a közösségeket';

  @override
  String get discoveryExplore => 'Fedezd fel';

  @override
  String get discoveryExplorePublicCommunities =>
      'Nyilvános közösségek felfedezése';

  @override
  String get discoveryListingSubheading =>
      'Szeretnéd, hogy a közösséged itt szerepeljen? Jelentkezz, ha megfelelsz a követelményeknek a közösséged beállításaiban > Felfedezés.';

  @override
  String get discoverySearchCommunities => 'Közösségek keresése';

  @override
  String get discoveryFilterByLanguage => 'Szűrés nyelv szerint';

  @override
  String get discoveryAllLanguages => 'Minden nyelv';

  @override
  String get discoveryAllCategories => 'Összes';

  @override
  String get discoveryCategoryGaming => 'Játék';

  @override
  String get discoveryCategoryMusic => 'Zene';

  @override
  String get discoveryCategoryEntertainment => 'Szórakozás';

  @override
  String get discoveryCategoryEducation => 'Oktatás';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Tudomány és technológia';

  @override
  String get discoveryCategoryContentCreator => 'Tartalomgyártó';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime és manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmek és TV';

  @override
  String get discoveryCategoryOther => 'Egyéb';

  @override
  String get discoveryNoCommunitiesMatch => 'Nincs találat.';

  @override
  String get discoveryJoinCommunity => 'Csatlakozás a közösséghez';

  @override
  String get discoveryJoined => 'Csatlakoztál';

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
      other: '$countString tag',
      one: '1 tag',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Nincs leírás.';

  @override
  String get discoveryCommunities => 'Közösségek';

  @override
  String get discoveryApps => 'Appok';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Nem sikerült csatlakozni ehhez a közösséghez';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Valami hiba történt. Kérlek, próbáld újra később.';

  @override
  String get discoveryJoinErrorFullTitle => 'Ez a közösség tele van';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Ez a közösség elérte a taglétszám-korlátját, így jelenleg nem tudsz csatlakozni.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Elérted a közösségi limiteket';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'A maximális számú közösségben vagy. Hagyj el egyet, és próbáld újra.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Nem csatlakozhatsz ehhez a közösséghez';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Kitiltottak ebből a közösségből.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Ez a közösség már nem elérhető';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Lehet, hogy kilépett a felfedezésből, vagy kikapcsolta az új csatlakozásokat. Frissítsd az oldalt, és nem fogod újra látni.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Túl gyorsan próbálkozol';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Kérlek, várj egy pillanatot, és próbáld újra.';

  @override
  String get guildNavbarAddCommunity => 'Közösség hozzáadása';

  @override
  String get guildNavbarHelp => 'Súgó';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'ÚJ ÜZENET';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Mappa kinyitása: $folderName';
  }

  @override
  String get guildNavbarGroupDm => 'Csoportos DM';

  @override
  String get guildNavbarCreateChannel => 'Csatorna létrehozása';

  @override
  String get guildNavbarChannelType => 'Csatornatípus';

  @override
  String get guildNavbarTextChannel => 'Szöveges csatorna';

  @override
  String get guildNavbarTextChannelDescription =>
      'Üzenetek, képek, GIF-ek és emojik küldése';

  @override
  String get guildNavbarVoiceChannel => 'Hangcsatorna';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Lógj együtt hanggal, videóval és képernyőmegosztással';

  @override
  String get guildNavbarLinkChannel => 'Hivatkozás csatorna';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Gyors hozzáférés egy külső webhelyhez vagy erőforráshoz';

  @override
  String get guildNavbarNameLabel => 'Név';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarCreateCategory => 'Kategória létrehozása';

  @override
  String get guildNavbarNewCategoryHint => 'Új kategória';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Hívj meg barátokat ide: $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'A címzetteket ide irányítjuk: #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Barátok keresése';

  @override
  String get guildNavbarNoFriendsYet => 'Még nincsenek barátok';

  @override
  String get guildNavbarNoResults => 'Nincs találat';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Vagy küldj meghívó linket egy barátnak:';

  @override
  String get guildNavbarInviteLink => 'Meghívó link';

  @override
  String get guildNavbarCopy => 'Másolás';

  @override
  String get guildNavbarCopied => 'Kimásolva!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'A meghívó linked 7 nap múlva lejár.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Ez a meghívó link soha nem jár le.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'A meghívó linked ennyi idő múlva jár le: $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Meghívó link szerkesztése';

  @override
  String get guildNavbarInviteLinkSettings => 'Meghívó link beállításai';

  @override
  String get guildNavbarExpireAfter => 'Lejárat után';

  @override
  String get guildNavbarMaxUses => 'Maximális felhasználások száma';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Ideiglenes tagság megadása';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'A tagokat eltávolítjuk, amikor offline állapotba kerülnek, hacsak nincs hozzárendelve szerepkör';

  @override
  String get guildNavbarCreateNewLink => 'Új link létrehozása';

  @override
  String get guildNavbarSent => 'Elküldve';

  @override
  String get guildNavbarInvite => 'Meghívás';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Közösség elhagyása';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Biztosan el akarod hagyni ezt a közösséget? Többé nem láthatsz üzeneteket.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Közösség elhagyása';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Töröljem az üzeneteimet ebben a közösségben?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Véglegesen töröl minden itt, minden csatornában küldött üzenetedet. Nem vonható vissza.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Üzeneteim törlése';

  @override
  String get guildNavbarDeletedYourMessages => 'Törölte az üzeneteidet';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Nem sikerült törölni az üzeneteidet';

  @override
  String get guildNavbarRemoveOverride => 'Felülírás eltávolítása';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Némítva eddig: $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Csak a Fluxer személyzetének hozzáférhető';

  @override
  String get guildNavbarInvitesPaused =>
      'A meghívók jelenleg szüneteltetve vannak ebben a közösségben';

  @override
  String get guildNavbarDurationNever => 'soha';

  @override
  String get guildNavbarDuration30Minutes => '30 perc';

  @override
  String get guildNavbarDuration1Hour => '1 óra';

  @override
  String get guildNavbarDuration6Hours => '6 óra';

  @override
  String get guildNavbarDuration12Hours => '12 óra';

  @override
  String get guildNavbarDuration1Day => '1 nap';

  @override
  String get guildNavbarDuration7Days => '7 nap';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count másodperc';
  }

  @override
  String get guildNavbarNever => 'Soha';

  @override
  String get guildNavbarNoLimit => 'Nincs limit';

  @override
  String get guildNavbarOneUse => '1 használat';

  @override
  String guildNavbarUses(int count) {
    return '$count használat';
  }

  @override
  String get guildMenuMarkAsRead => 'Jelölés olvasottként';

  @override
  String get guildPeekMoreOptions => 'További opciók';

  @override
  String get guildMenuInviteMembers => 'Tagok meghívása';

  @override
  String get guildMenuCommunitySettings => 'Közösségi beállítások';

  @override
  String get guildMenuEditCommunityProfile => 'Közösségi profil szerkesztése';

  @override
  String get guildMenuUnmuteCommunity => 'Közösség némításának feloldása';

  @override
  String get guildMenuMuteCommunity => 'Közösség némítása';

  @override
  String get guildMenuHideMutedChannels => 'Némított csatornák elrejtése';

  @override
  String get guildMenuReportCommunity => 'Közösség jelentése';

  @override
  String get guildMenuDebugCommunity => 'Közösség hibakeresése';

  @override
  String get guildMenuCopyCommunityId => 'Közösség ID másolása';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return '$formattedTime-ig';
  }

  @override
  String get guildMenuSettingsGeneral => 'Általános';

  @override
  String get guildMenuSettingsRoles => 'Szerepkörök és engedélyek';

  @override
  String get guildMenuSettingsEmoji => 'Egyéni hangulatjelek';

  @override
  String get guildMenuSettingsStickers => 'Egyéni matricák';

  @override
  String get guildMenuSettingsSafetyModeration => 'Biztonság és moderálás';

  @override
  String get guildMenuSettingsActivityLog => 'Tevékenységnapló';

  @override
  String get guildMenuSettingsWebhooks => 'Webhookok';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Egyéni meghívó URL';

  @override
  String get guildMenuSettingsDiscovery => 'Felfedezés';

  @override
  String get guildMenuSettingsMembers => 'Tagok';

  @override
  String get guildMenuSettingsInviteLinks => 'Meghívó linkek';

  @override
  String get guildMenuSettingsBans => 'Tiltások';

  @override
  String get guildSettingsNoPermission =>
      'Nincs engedélyed megtekinteni ezt a beállítások lapot.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikon';

  @override
  String get guildSettingsUploadImage => 'Kép feltöltése';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Tölts fel egy bannert a szerveredhez.';

  @override
  String get guildSettingsOverviewNameTitle => 'Név';

  @override
  String get guildSettingsOverviewNameHint => 'Az én fantasztikus közösségem';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statisztikák';

  @override
  String get guildSettingsOverviewMembers => 'Tagok';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Szerepkörök használatával csoportosíthatod a tagokat és engedélyeket adhatsz meg.';

  @override
  String get guildSettingsCreateRole => 'Szerepkör létrehozása';

  @override
  String get guildSettingsRolesListTitle => 'Szerepkörök';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount statikus, $animatedCount animált hangulatjel hely használatban';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Még nincsenek egyéni hangulatjelek.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count matrica feltöltve';
  }

  @override
  String get guildSettingsStickersEmpty => 'Még nincsenek egyéni matricák.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Tag ellenőrzés';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Válaszd meg, hogy a tagoknak mi feleljen meg, mielőtt posztolhatnak vagy üzenetet küldhetnek a közösség tagjainak.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'A szerepkörrel rendelkező tagok átugorhatják ezeket az ellenőrzéseket. Nyilvános helyekhez javasoljuk az ellenőrzés engedélyezését.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'A Felfedezésben szereplő közösségekhez legalább ellenőrzött e-mail cím szükséges. A Felfedezés engedélyezésekor a „Nincs” nem választható.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Felnőtt tartalom és figyelmeztetések';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfiguráld a felnőtt tartalom címkézését és az opcionális figyelmeztetéseket a tagok számára.';

  @override
  String get guildSettingsModerationMatureToggle => 'Felnőtt tartalom';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Jelöld meg ezt a közösséget felnőtt tartalommal.';

  @override
  String get guildSettingsVerificationNone => 'Nincs';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Nincs szükség ellenőrzésre.';

  @override
  String get guildSettingsVerificationLow => 'Alacsony';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Ellenőrzött e-mail címet igényel.';

  @override
  String get guildSettingsVerificationMedium => 'Közepes';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Ellenőrzött e-mail címet és legalább 5 perces fiókot igényel.';

  @override
  String get guildSettingsVerificationHigh => 'Magas';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Mindent igényel, ami a közepesnél, plusz legalább 10 perc tagság a közösségben.';

  @override
  String get guildSettingsVerificationHighest => 'Nagyon magas';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Ellenőrzött telefonszámot igényel.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Kövesd nyomon a moderátori tevékenységeket a közösségben.';

  @override
  String get guildSettingsAuditLogEmpty => 'Még nincsenek naplók';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'A moderálási műveletek és a közösségi változások itt jelennek meg.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Minden felhasználó';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Minden művelet';

  @override
  String get guildSettingsAuditLogNoReason => 'Nem adott meg okot.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Ismeretlen felhasználó';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Hiba történt az eseménynapló betöltése közben.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Nem sikerült betölteni az eseménynaplókat';

  @override
  String get guildSettingsAuditLogReason => 'Ok';

  @override
  String get guildSettingsAuditLogSomeone => 'valaki';

  @override
  String get guildSettingsAuditLogSomething => 'valami';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'ismeretlen entitás';

  @override
  String get guildSettingsAuditLogNothing => 'semmi';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Ismeretlen célpont';

  @override
  String get auditLogActionGuildUpdate => 'Közösség frissítve';

  @override
  String get auditLogActionChannelCreate => 'Csatorna létrehozva';

  @override
  String get auditLogActionChannelUpdate => 'Csatorna frissítve';

  @override
  String get auditLogActionChannelDelete => 'Csatorna törölve';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Csatorna felülírás hozzáadva';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Csatorna felülírás frissítve';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Csatorna felülírás eltávolítva';

  @override
  String get auditLogActionMemberKick => 'Tag kirúgva';

  @override
  String get auditLogActionMemberPrune => 'Tagok törölve';

  @override
  String get auditLogActionMemberBanAdd => 'Tag kitiltva';

  @override
  String get auditLogActionMemberBanRemove => 'Tag kitiltása visszavonva';

  @override
  String get auditLogActionMemberUpdate => 'Tag frissítve';

  @override
  String get auditLogActionMemberRoleUpdate => 'Tag szerepkörök frissítve';

  @override
  String get auditLogActionMemberMove => 'Tag áthelyezve';

  @override
  String get auditLogActionMemberDisconnect => 'Tag leválasztva';

  @override
  String get auditLogActionBotAdd => 'Bot hozzáadva';

  @override
  String get auditLogActionRoleCreate => 'Szerepkör létrehozva';

  @override
  String get auditLogActionRoleUpdate => 'Szerepkör frissítve';

  @override
  String get auditLogActionRoleDelete => 'Szerepkör törölve';

  @override
  String get auditLogActionInviteCreate => 'Meghívó létrehozva';

  @override
  String get auditLogActionInviteUpdate => 'Meghívó frissítve';

  @override
  String get auditLogActionInviteDelete => 'Meghívó törölve';

  @override
  String get auditLogActionWebhookCreate => 'Webhook létrehozva';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook frissítve';

  @override
  String get auditLogActionWebhookDelete => 'Webhook törölve';

  @override
  String get auditLogActionEmojiCreate => 'Emoji létrehozva';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji frissítve';

  @override
  String get auditLogActionEmojiDelete => 'Emoji törölve';

  @override
  String get auditLogActionStickerCreate => 'Matrica létrehozva';

  @override
  String get auditLogActionStickerUpdate => 'Matrica frissítve';

  @override
  String get auditLogActionStickerDelete => 'Matrica törölve';

  @override
  String get auditLogActionMessageDelete => 'Üzenet törölve';

  @override
  String get auditLogActionMessageBulkDelete => 'Üzenetek törölve';

  @override
  String get auditLogActionMessagePin => 'Üzenet bejelölve';

  @override
  String get auditLogActionMessageUnpin => 'Üzenet bejelölésének megszüntetése';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor frissítette a közösség beállításait.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor létrehozta a(z) $target csatornát.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor frissítette a(z) $target csatornát.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor törölte a(z) $target csatornát.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor csatornaengedélyeket adott $target számára.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor csatornaengedélyeket adott $target számára a(z) $channel csatornában.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor frissítette a csatornaengedélyeket $target számára.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor frissítette a csatornaengedélyeket $target számára a(z) $channel csatornában.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor eltávolította a csatornaengedélyeket $target számára.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor eltávolította a csatornaengedélyeket $target számára a(z) $channel csatornában.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor kirúgta $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor kitiltotta $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor feloldotta $target kitiltását.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor frissítette $target adatait.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor frissítette $target szerepköreit.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor eltávolította az inaktív tagokat.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor eltávolította az inaktív tagokat $days nap után.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor áthelyezte $target egy másik hangcsatornába.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor áthelyezte $target a(z) $channel csatornába.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor leválasztotta $target a hangkapcsolatról.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor hozzáadta a(z) $target botot.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor létrehozta a(z) $target szerepkört.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor frissítette a(z) $target szerepkört.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor törölte a(z) $target szerepkört.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor létrehozta a(z) $target meghívót.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor létrehozta a(z) $target meghívót a(z) $channel csatornához.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor frissítette a(z) $target meghívót.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor frissítette a(z) $target meghívót a(z) $channel csatornához.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor törölte a(z) $target meghívót.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor törölte a(z) $target meghívót a(z) $channel csatornához.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor létrehozta a(z) $target webhookot.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor frissítette a(z) $target webhookot.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor törölte a(z) $target webhookot.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor hozzáadta a(z) $target emojit.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor frissítette a(z) $target emojit.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor törölte a(z) $target emojit.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor hozzáadta a(z) $target matricát.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor frissítette a(z) $target matricát.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor törölte a(z) $target matricát.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor törölt egy üzenetet.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor törölt egy üzenetet itt: $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor több üzenetet törölt.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor $count üzenetet törölt.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor több üzenetet törölt itt: $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor $count üzenetet törölt itt: $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor bekapcsolt egy üzenetet.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor bekapcsolt egy üzenetet itt: $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor kikapcsolt egy üzenetet.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor kikapcsolt egy üzenetet itt: $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor auditálási műveletet hajtott végre a(z) $target elemmel.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '$field frissítve erről: $oldValue, erre: $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '$field beállítva erre: $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '$field törölve (ez volt: $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '$field frissítve.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'A közösség átnevezve erre: $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'A közösség ikonja frissítve.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'A csatorna átnevezve erre: $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'A téma törölve.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'A téma frissítve erre: $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Érett tartalom engedélyezve.';

  @override
  String get auditLogChangeDisabledMatureContent => 'Érett tartalom letiltva.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Becenév beállítva erre: $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Becenév eltávolítva: $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'A tag némítva.';

  @override
  String get auditLogChangeUnmutedMember => 'A tag némítása feloldva.';

  @override
  String get auditLogChangeDeafenedMember => 'A tag süketítve.';

  @override
  String get auditLogChangeUndeafenedMember => 'A tag süketítése feloldva.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '$roles hozzáadva.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '$roles eltávolítva.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Csatorna: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Üzenet: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Meghívta: $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Törölve # üzenet.',
      one: 'Törölve 1 üzenet.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eltávolítva # tag.',
      one: 'Eltávolítva 1 tag.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Ez a meghívó soha nem jár le.';

  @override
  String get auditLogOptionTemporaryMembership => 'Ideiglenes tagságot ad.';

  @override
  String get auditLogOptionPermanentMembership => 'Állandó tagságot ad.';

  @override
  String get guildSettingsLoadMore => 'Több betöltése';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Webhookok kezelése, amelyek üzeneteket küldenek a csatornákba.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nincsenek beállított webhookok.';

  @override
  String get guildSettingsCopyUrl => 'URL másolása';

  @override
  String get guildSettingsCopiedUrl => 'URL másolva a vágólapra';

  @override
  String get guildSettingsDeleteWebhook => 'Webhook törlése';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Állíts be egyéni meghívólinket a szerveredhez.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Mentés';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Használat';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count használat';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Jelentkezz, hogy felkerülj a szerverek felfedezése közé.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Legalább $count tagnak kell lennie a jelentkezéshez.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => 'Jelentkezés';

  @override
  String get guildSettingsDiscoveryStatusTitle => 'Állapot';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategória';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Leírás';

  @override
  String get guildSettingsDiscoveryTags => 'Címkék';

  @override
  String get guildSettingsDiscoveryTagsHint => 'játék, művészet, zene';

  @override
  String get guildSettingsDiscoveryApply => 'Jelentkezés elküldése';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Visszavonás';

  @override
  String get guildSettingsMembersDescription =>
      'Keresés és kezelés a szer tagjai között.';

  @override
  String get guildSettingsMembersSearchHint => 'Tagok keresése';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count tag';
  }

  @override
  String get guildSettingsInvitesDescription =>
      'Aktív meghívólinkek megtekintése és visszavonása.';

  @override
  String get guildSettingsInvitesEmpty => 'Nincsenek aktív meghívók.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses használat';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Lejár: $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Letiltott felhasználók megtekintése és kezelése.';

  @override
  String get guildSettingsBansSearchHint => 'Letiltások keresése';

  @override
  String get guildSettingsBansEmpty => 'Nincsenek letiltott felhasználók.';

  @override
  String get guildSettingsBanPermanent => 'Végleges letiltás';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Lejár: $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Lejár';

  @override
  String get guildSettingsUnban => 'Feloldás';

  @override
  String get guildSettingsBansLoading => 'Letiltott felhasználók betöltése';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nem található letiltás a keresésnek megfelelően.';

  @override
  String get guildSettingsBanDetailsTitle => 'Letiltás részletei';

  @override
  String get guildSettingsBanViewDetails => 'Részletek megtekintése';

  @override
  String get guildSettingsBannedOn => 'Letiltva ekkor:';

  @override
  String get guildSettingsBannedBy => 'Letiltotta:';

  @override
  String get guildSettingsRevokeBanTitle => 'Letiltás visszavonása';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Biztos vagy benne, hogy vissza akarod vonni $displayName letiltását? Újra csatlakozhat a közösséghez.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return '$displayName letiltása visszavonva';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Nem sikerült betölteni a letiltásokat. Próbáld újra.';

  @override
  String get guildSettingsRevokeBanError =>
      'Nem sikerült visszavonni a letiltást. Próbáld újra.';

  @override
  String get guildSettingsCommunitySettings => 'Közösségi beállítások';

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
      'Közösséged profiljának, csatornáinak és alapértelmezett beállításainak kezelése.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Arculat';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Profilkép, név, banner és meghívó háttér frissítése';

  @override
  String get guildSettingsOverviewBannerUpload => 'Banner feltöltése';

  @override
  String get guildSettingsOverviewIdleTitle => 'Inaktivitási beállítások';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'AFK csatorna és időtúllépés konfigurálása';

  @override
  String get guildSettingsOverviewSystemTitle => 'Rendszer és üdvözlés';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Rendszer- és üdvözlő üzenetek célállomásának kiválasztása';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Alapértelmezett értesítések';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'A 250 főt meghaladó közösségek automatikusan az „csak említések” beállításra kerülnek. Az eredeti beállításod megmarad, és visszaállítódik, ha a közösség 250 fő alá csökken.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Speciális';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Engedélyezze a rugalmas szöveges csatornaneveket';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Elrejtés a közösség tulajdonosának koronája';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Elválasztott banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'A bannert a közösség fejlécétől elkülönülve jeleníti meg.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Ikon feltöltése';

  @override
  String get guildSettingsOverviewRemoveImage => 'Eltávolítás';

  @override
  String get guildSettingsOverviewSplashTitle => 'Meghívó háttér';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Csevegés beágyazás háttér';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Megjelenik a csevegésben lévő meghívó beágyazásokban.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Háttér feltöltése';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Nincs közösségi banner';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Nincs meghívó háttér';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Előnézet';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Tekintse meg, hogyan néz ki a meghívója a látogatók számára.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Szöveges csatornanevek';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Közösség tulajdonosának koronája';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Konfigurálja, hogy a korona ikonja megjelenjen-e a közösség tulajdonosa mellett';

  @override
  String get guildSettingsSplashCardAlignment => 'Kártya igazítása';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Középre';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Balra';

  @override
  String get guildSettingsSplashAlignmentRight => 'Jobbra';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Csak széles képernyőkön érvényes.';

  @override
  String get permissionReadMessageHistory => 'Üzenetelőzmények olvasása';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Állítsa be, mit láthatnek a(z) \"$permission\" engedéllyel nem rendelkező felhasználók';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Használjon egy külön ablakot az üzenetelőzmények küszöb dátumának beállításához azoknak a tagoknak, akik nem rendelkeznek a(z) $permission engedéllyel.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Üzenetelőzmények küszöb megnyitása';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Üzenetelőzmények küszöb';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Üzenetelőzmények küszöb engedélyezése';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Küszöb dátum';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Az Üzenetelőzmények olvasása engedéllyel nem rendelkező tagok e dátum után küldött üzeneteket tekinthetik meg.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Üzenetelőzmények küszöb frissítve';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Engedélyezze a nagybetűket és a szóközöket a szöveges csatornanevekben. Kikapcsolva a neveket kisbetűsre korlátozza kötőjelekkel és aláhúzásokkal.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Elrejti a korona ikont a közösség tulajdonosa mellett minden felületen.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Az animált ikonokhoz az Animált ikon közösségi funkció szükséges.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Az animált bannerekhez az Animált banner közösségi funkció szükséges.';

  @override
  String get guildSettingsAfkChannel => 'AFK / tétlen csatorna';

  @override
  String get guildSettingsAfkChannelHint =>
      'Mozgassa a tagokat ebbe a csatornába, ha AFK-ban vannak.';

  @override
  String get guildSettingsNoAfkChannel => 'Nincs AFK csatorna';

  @override
  String get guildSettingsAfkTimeout => 'AFK időtúllépés';

  @override
  String get guildSettingsAfkTimeout1Min => '1 perc';

  @override
  String get guildSettingsAfkTimeout5Min => '5 perc';

  @override
  String get guildSettingsAfkTimeout15Min => '15 perc';

  @override
  String get guildSettingsAfkTimeout30Min => '30 perc';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 óra';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds másodperc';
  }

  @override
  String get guildSettingsSystemChannel => 'Célcsatorna';

  @override
  String get guildSettingsSystemChannelHint =>
      'Az üdvözlő és rendszerüzenetek itt jelennek meg.';

  @override
  String get guildSettingsNoSystemChannel => 'Nincs rendszercsatorna';

  @override
  String get guildSettingsHideJoinMessages => 'Csatlakozási üzenetek elrejtése';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Elrejti a csatlakozási üzeneteket a célcsatornában.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Alapértelmezett értesítési beállítások';

  @override
  String get guildSettingsNotificationsAll => 'Minden üzenet';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Értesítés minden üzenetről';

  @override
  String get guildSettingsNotificationsMentions => 'Csak említések';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Értesítés csak említésekről';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max. 10 MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Max. 10 MB. Minimum: 960×540px (16:9). Megjelenik a meghívó beágyazásokban a csevegésben.';

  @override
  String get guildSettingsModerationDescription =>
      'Állítsd be az ellenőrzést, a tartalom szűrését és az érett tartalom beállításait.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'A Discoveryben szereplő közösségek moderálási lehetőségei korlátozottak.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Tartalomszűrés';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automatikus üzenetszűrés explicit tartalomra az érett tartalomra nem jelölt csatornákban.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'A Discoveryben szereplő közösségek kötelesek minden tagot szűrni. Ez a beállítás nem változtatható meg, amíg a Discovery engedélyezve van.';

  @override
  String get guildSettingsContentFilterOff => 'Ki';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Hagyd, hogy a közösség önszabályozzon';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Szűrés szerepkör nélküli tagoknál';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Ajánlott a legtöbb közösség számára';

  @override
  String get guildSettingsContentFilterAll => 'Mindenki szűrése';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximális védelem a családbarát helyek számára';

  @override
  String get guildSettingsModerationMatureOff => 'Ki';

  @override
  String get guildSettingsModerationMatureOn => 'Be';

  @override
  String get guildSettingsContentWarningToggle =>
      'Tartalomfigyelmeztetés megjelenítése';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Bekapcsol egy beleegyezési felszólítást, mielőtt bármelyik csatornába belépnél.';

  @override
  String get guildSettingsContentWarningText => 'Egyéni figyelmeztető szöveg';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Ez érzékeny tartalmat tartalmaz.';

  @override
  String get guildSettingsModeration2faTitle =>
      'Kétfaktoros hitelesítés követelmény';

  @override
  String get guildSettingsModeration2faDescription =>
      'Követeld meg a moderátoroktól a kétfaktoros hitelesítést, mielőtt kitilthatnak, eltávolíthatnak, időtúllépést adhatnak, vagy törölhetnek üzeneteket.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Kétfaktoros hitelesítés követelése moderálási műveletekhez';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Csak a közösség tulajdonosa módosíthatja ezt a beállítást';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Engedélyezd a kétfaktoros hitelesítést a fiókodban a beállítás módosításához';

  @override
  String get guildSettingsEmojiSearchHint => 'Keresés emojik között';

  @override
  String get guildSettingsEmojiUploadTitle => 'Emoji feltöltése';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Nem animált emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animált emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Keresés matricák között';

  @override
  String get guildSettingsWebhooksInfo =>
      'Hozzon létre webhookokat a Csatorna beállításaiból. Szerkessze őket itt.';

  @override
  String get guildSettingsVanityUrlWarning =>
      'Az egyéni URL-je nem fog működni, hacsak legalább egy csatorna nem látható mindenki számára.';

  @override
  String get guildSettingsVanityUrlRemove => 'Eltávolítás';

  @override
  String get guildSettingsBannedUsersTitle => 'Kitiltott felhasználók';

  @override
  String get guildSettingsInvitesTableInviter => 'Meghívó';

  @override
  String get guildSettingsInvitesTableChannel => 'Csatorna';

  @override
  String get guildSettingsInvitesTableCode => 'Kód';

  @override
  String get guildSettingsInvitesTableUses => 'Felhasználások';

  @override
  String get guildSettingsInvitesTableCreated => 'Létrehozva';

  @override
  String get guildSettingsMembersSortNewest => 'Legújabb elöl';

  @override
  String get guildSettingsAuditLogFilterUser => 'Szűrés felhasználó szerint';

  @override
  String get guildSettingsAuditLogFilterAction => 'Szűrés művelet szerint';

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
