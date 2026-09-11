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
      'Valami hiba történt az instanciával.\nHamarosan javítjuk!';

  @override
  String get gatewayReconnectingToast => 'Újracsatlakozás…';

  @override
  String get gatewayConnectedToast => 'Csatlakoztatva';

  @override
  String get sessionExpiredToast =>
      'A munkamenet lejárt. Kérlek, jelentkezz be újra.';

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
  String get nagbarLearnMore => 'Tudjon meg többet';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Karbantartás ütemezve ekkorra: $localizedTime. Várható időtartam: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Karbantartás folyamatban. Várható időtartam: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'A karbantartás befejeződött.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Szia, $displayName! Igazold a fiókodat, hogy ne veszítsd el a hozzáférésed.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Szia, $displayName! Kérjük, erősítsd meg az e-mail címedet.';
  }

  @override
  String get nagbarOpenSettings => 'Beállítások megnyitása';

  @override
  String get systemPermissionSettingsTitle => 'Engedélyezze az engedélyt';

  @override
  String get systemPermissionSettingsOpenSettings => 'Beállítások megnyitása';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return 'A(z) $productName nem fér hozzá a mikrofonodhoz. Engedélyezheted az eszköz adatvédelmi beállításaiban.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return 'A(z) $productName nem fér hozzá a kamerádhoz. Engedélyezheted az eszköz adatvédelmi beállításaiban.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return 'A(z) $productName nem fér hozzá a fotókönyvtáradhoz. Engedélyezheted az eszközöd adatvédelmi beállításaiban.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return 'A(z) $productName nem rendelkezik értesítések küldésére vonatkozó engedéllyel. Ezt az eszközöd beállításaiban engedélyezheted.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Előfizetésed nem újult meg, de továbbra is élvezheted a(z) $productName előnyeit $graceDate-ig. Cselekedj most, különben elveszíted az összes előnyt.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'A(z) $productName előfizetésed lejárt. Újítsd meg most, hogy megtartsd a kedvezményeket.';
  }

  @override
  String get nagbarManageSubscription => 'Előfizetés kezelése';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Üdvözöljük a(z) $productFullName szolgáltatásban! Fedezze fel $productName előnyeit, és kezelje előfizetését.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Tekintsd meg a $productName funkcióit';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Van egy új ajándékkódod az ajándéklistádon.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return '$count új ajándékkód vár a tárhelyeden.';
  }

  @override
  String get nagbarViewGiftInventory => 'Ajándékok megtekintése';

  @override
  String get nagbarVisionaryMfa =>
      'Engedélyezd a kétfaktoros hitelesítést a Visionary-fiókod védelméhez.';

  @override
  String get nagbarEnableMfa => 'Engedélyezd a 2FA-t';

  @override
  String get nagbarTermsAcceptance =>
      'Frissítettük a feltételeinket. Kérjük, tekintse át és fogadja el őket a folytatáshoz.';

  @override
  String get nagbarReviewTerms => 'Feltételek áttekintése';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Csatlakozz a(z) $communityName közösséghez, hogy beszélgethess a csapattal és naprakész maradj.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Csatlakozás a(z) $communityName közösséghez';
  }

  @override
  String get nagbarPushNotification =>
      'Engedélyezd az értesítéseket, hogy ne maradj le az üzenetekről és a megemlítésekről.';

  @override
  String get nagbarEnableNotifications => 'Értesítések engedélyezése';

  @override
  String get nagbarBillingPortalFailed =>
      'Nem sikerült megnyitni a számlázási portált. Kérjük, próbálkozzon újra egy pillanat múlva.';

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
  String get next => 'Tovább';

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
  String get registerPendingApproval =>
      'A fiókkérelmed jóváhagyásra vár. Bejelentkezhetsz, miután egy admin jóváhagyta.';

  @override
  String get registerClosed =>
      'A regisztráció jelenleg zárva van. Fiók létrehozásához használj egy admintól kapott regisztrációs hivatkozást.';

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
  String get errorServiceUnavailable =>
      'Ez az példány átmenetileg nem elérhető. Próbálkozzon újra egy pillanat múlva.';

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
  String get embedInviteJoinGroup => 'Csatlakozás a csoporthoz';

  @override
  String get embedInviteAlreadyJoined => 'Már csatlakoztál';

  @override
  String get embedInviteDisabled => 'Meghívók letiltva';

  @override
  String get embedInvitePaused => 'A meghívók szünetelnek ebben a közösségben.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName potenciális támadást észlelt, ezért az új felhasználók most nem csatlakozhatnak.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Ez a közösség szünetelteti a meghívásokat. Később újra próbálkozhatsz.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName potenciális támadást észlelt ebben a közösségben. A meghívások szünetelnek, így az új felhasználók jelenleg nem csatlakozhatnak.';
  }

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
  String get invalidDeepLinkTitle => 'A hivatkozás nem nyitható meg';

  @override
  String get invalidDeepLinkDescription =>
      'Lehet, hogy ez a hivatkozás hibás, csak webes böngészőben érhető el, vagy nincs hozzáférésed. Ellenőrizd a hivatkozást, és próbáld meg újra.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Ugrás a kezdőoldalra';

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
  String embedGiftVisionaryLifetime(String productName) {
    return 'Látnok (élethossziglan $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nap $productName előfizetésből',
      one: '1 nap $productName előfizetésből',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hét $productName',
      one: '1 hét $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hónap $productName',
      one: '1 hónap $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count év $productName',
      one: '1 év $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Küldte: $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Kattints az ajándékod igényléséhez!';

  @override
  String get embedGiftAlreadyRedeemed => 'Már beváltva';

  @override
  String get embedGiftClaimAccountHelp =>
      'Regisztrálj, hogy beválthasd ezt az ajándékot.';

  @override
  String get embedGiftClaim => 'Ajándék igénylése';

  @override
  String get embedGiftClaimed => 'Ajándék beváltva';

  @override
  String get embedGiftClaimAccount => 'Fiók igénylése a beváltáshoz';

  @override
  String get embedGiftUnknownTitle => 'Ismeretlen ajándék';

  @override
  String get embedGiftUnknownSubtitle =>
      'Ez az ajándékkód érvénytelen vagy már felhasználták.';

  @override
  String get embedGiftUnavailable => 'Ajándék nem elérhető';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Aktiváld a $productName előfizetésedet az ajándékod igénylésével!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Ezt az ajándékot már beváltották.';

  @override
  String get giftAcceptMaybeLater => 'Talán később';

  @override
  String get giftRedeemedToast => 'Ajándék beváltva!';

  @override
  String get giftRedeemInvalidTitle => 'Érvénytelen ajándékkód';

  @override
  String get giftRedeemInvalidMessage =>
      'Ez a kód érvénytelen vagy már felhasználták.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Az ajándék már be lett váltva';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Ez a kód már be lett váltva.';

  @override
  String get giftRedeemNotFoundTitle => 'Az ajándék nem található';

  @override
  String get giftRedeemNotFoundMessage => 'Ez a kód nem létezik.';

  @override
  String get giftRedeemFailedTitle => 'Ajándék beváltása sikertelen';

  @override
  String get giftRedeemFailedMessage =>
      'Nem sikerült beváltani az ajándékot. Próbáld újra.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Nem váltható be ez az ajándék';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'A Visionary fiókok nem tudják beváltani a Plutonium ajándékokat. Másold a linket, hogy megosztd a barátaiddal.';

  @override
  String get giftCopyLink => 'Ajándéklink másolása';

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
  String get notificationUseCategoryDefault =>
      'Kategória alapértelmezett használata';

  @override
  String get notificationUseCommunityDefault =>
      'A közösség alapértelmezett beállításainak használata';

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
  String get dmDeleteMyMessagesTitle =>
      'Törlöd az üzeneteidet ebből a beszélgetésből?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Ez véglegesen törli az összes üzenetet, amit valaha küldtél ebben a beszélgetésben. Ez nem vonható vissza.';

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
  String get dmUnnamedGroup => 'Névtelen csoport';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName csoportja';
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
  String get dmDebugCategory => 'Kategória hibakeresése';

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
  String get addFriendVerifyToSend =>
      'Ellenőrizd az e-mail címed, mielőtt barátkérelmeket küldenél.';

  @override
  String get addFriendFriendsListFull =>
      'A barátlistád vagy az övék tele van. Távolíts el valakit, és próbáld újra.';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'Ez egy alapértelmezett emoji a $productName alkalmazásban.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Ez az emojit ebből a közösségből származik. Bárhol használhatod.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Ez egy egyéni hangulatjel egy közösségből.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Ez egy közösségi egyéni hangulatjel. Kérd el a szerzőtől a meghívót, hogy használni tudd.';

  @override
  String get emojiInfoFromHeader => 'Ez az emoji innen származik:';

  @override
  String get emojiInfoDiscoverableCommunity => 'Felfedezhető közösség';

  @override
  String get emojiInfoPrivateCommunity => 'Privát közösség';

  @override
  String get emojiInfoVerifiedCommunity => 'Ellenőrzött közösség';

  @override
  String get emojiInfoAddToFavorites => 'Hozzáadás a kedvencekhez';

  @override
  String get emojiInfoRemoveFromFavorites => 'Eltávolítás a kedvencekből';

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
  String get gifPickerFavoritesEmptyTitle => 'Még nincsenek kedvenc GIF-ek';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Jelölj csillaggal egy GIF-et, hogy itt lásd.';

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
  String externalLinkWarningLeaving(String productName) {
    return 'Elhagyod a ${productName}t';
  }

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
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Felhasználónév módosítása';

  @override
  String get fluxerTagInputLabel => 'Felhasználónév';

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
  String get fluxerTagAlreadyTaken => 'Felhasználónév már foglalt';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'A(z) $username#$discriminator Felhasználónév már foglalt. A folytatás automatikusan újragenerálja a megkülönböztető jeledet.';
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
      'Ha elmented ezt a Felhasználónév-et, az egyéni 4 számjegyű tagod véletlenszerű számra változik, amikor a Plutonium előfizetésed véget ér. Ha az előfizetésed nem újul meg, 3 napos türelmi időd lesz, mielőtt a tag megváltozik.';

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
  String get fluxerTagUpdated => 'Felhasználónév frissítve';

  @override
  String get fluxerTagUpdateFailed =>
      'A Felhasználónév frissítése sikertelen. Kérlek, próbáld újra.';

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
      'Fiók igénylése a Felhasználónév módosításához';

  @override
  String get changeFluxerTag => 'Felhasználónév módosítása';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Tetszés szerint alakítsd 4 számjegyű Felhasználónév (#$discriminator) Plutoniummal';
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
  String profilePreviewMemberSince(String productName) {
    return '$productName tag';
  }

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'Kezeld azt az e-mail címet, amellyel bejelentkezel a $productName';
  }

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
      'SMS kódot küldünk, amint elérhető lesz. A számod nincs összekapcsolva a fiókoddal. Csak egy titkosított jelölőt tárolunk, felhasználói azonosító nélkül, hogy legfeljebb 2 ellenőrzést engedélyezzünk körülbelül 30 napon belül.';

  @override
  String get phoneAddSendCode => 'Kód küldése';

  @override
  String get phoneVerifyTitle => 'Telefonszám ellenőrzése';

  @override
  String get phoneVerifyDescription =>
      'Add meg a telefonszámodra küldött ellenőrző kódot.';

  @override
  String get phoneAddSuccess => 'Telefonszám ellenőrizve';

  @override
  String get phoneCountryLabel => 'Ország';

  @override
  String get phoneSearchCountries => 'Országok keresése...';

  @override
  String get phoneNumberRequired => 'Telefonszám megadása kötelező';

  @override
  String get phoneEnterValidNumber => 'Adjon meg érvényes mobilszámot.';

  @override
  String get phoneCannotBeUsed =>
      'Ez a telefonszám nem használható. Próbáljon meg egy másik mobilszámot, vagy lépjen kapcsolatba az ügyfélszolgálattal.';

  @override
  String get phoneAlreadyUsed =>
      'Ezt a telefonszámot már használták. Próbáljon meg egy másik számot, vagy lépjen kapcsolatba az ügyfélszolgálattal.';

  @override
  String get phoneCodeDidNotWork =>
      'Ez a kód nem működött. Ellenőrizd, és próbáld újra.';

  @override
  String get phoneTooManyAttempts =>
      'Túl sok próbálkozás. Várj egy kicsit, majd próbáld újra.';

  @override
  String get phoneSmsUnavailable =>
      'Az SMS-ellenőrzés jelenleg nem érhető el. Próbálja újra később, vagy lépjen kapcsolatba az ügyfélszolgálattal.';

  @override
  String get phoneNotEligible =>
      'A telefonszám-ellenőrzés nem érhető el ehhez a fiókhoz. Használjon másik módszert, vagy lépjen kapcsolatba az ügyfélszolgálattal.';

  @override
  String get phoneCaptchaRequired =>
      'A telefonszám ellenőrzése előtt böngészőellenőrzés szükséges. Próbálja újra a bejelentkezési oldalról, vagy lépjen kapcsolatba az ügyfélszolgálattal.';

  @override
  String get phoneSomethingWentWrong => 'Hiba történt. Próbálja újra.';

  @override
  String get phoneInboundExpensiveDescription =>
      'SMS küldése erre a telefonszámra túl drága, ezért kérjük, hogy Ön küldjön nekünk SMS-t. A támogatási csapatunkkal is felveheti a kapcsolatot, hogy eltávolíttassa ezt a követelményt a fiókjából.';

  @override
  String get phoneInboundDefaultDescription =>
      'SMS-ben kell igazolnod a telefonszámodat.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Nyisd meg a telefonod üzenetküldő alkalmazását, és hozz létre egy új szöveges üzenetet.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Küldd el a $code kódot a $number címre.';
  }

  @override
  String get phoneInboundStepWait =>
      'Várj, amíg megkapjuk az üzeneted. Ez egy percet vehet igénybe.';

  @override
  String get phoneInboundGetNewCode => 'Új kód kérése';

  @override
  String get phoneInboundChallengeCodeLabel => 'Küldendő kód';

  @override
  String get phoneInboundOurNumberLabel => 'Küldés ide';

  @override
  String get requiredActionTitle => 'Fiókellenőrzés szükséges';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'A $productName további használatához végezze el a szükséges ellenőrzést.';
  }

  @override
  String get requiredActionIntroPhone =>
      'A folytatáshoz a regisztrációdhoz egy további spamellenőrzésre van szükség.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Igazolja e-mail címét vagy telefonszámát, hogy továbbra is használhassa a(z) $productName alkalmazást.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'A $productName további használatához végezze el az alábbi e-mail- és telefonszám-ellenőrzési lépéseket.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Válassz ellenőrzési módszert';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'A $productName további használatához végezze el az alábbi ellenőrzési módok egyikét.';
  }

  @override
  String get requiredActionUseEmail => 'E-mail használata';

  @override
  String get requiredActionUsePhone => 'Telefon használata';

  @override
  String get requiredActionCheckEmailTitle => 'Ellenőrizd az e-mailjeidet';

  @override
  String get requiredActionCheckEmailDescription =>
      'Küldtünk egy ellenőrző linket az e-mail címedre. Nyisd meg a folytatáshoz.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Megerősítő e-mail újraküldése';

  @override
  String get requiredActionVerificationEmailSent =>
      'Ellenőrző e-mail elküldve. Nézd meg a beérkező üzeneteidet.';

  @override
  String get requiredActionSignOut => 'Kijelentkezés';

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
  String get networkErrorMessage =>
      'Valami hiba történt. Kérlek, próbáld újra.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hete',
      one: '1 hete',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perc múlva',
      one: '1 perc múlva',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count órán belül',
      one: '1 órán belül',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nap múlva',
      one: '1 nap múlva',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hét múlva',
      one: '1 hét múlva',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hónap múlva',
      one: '1 hónap múlva',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éven belül',
      one: '1 éven belül',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'épp most';

  @override
  String get authorizedAppsTitle => 'Engedélyezett alkalmazások';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Ezek az alkalmazások kaptak hozzáférést a $productName-fiókodhoz.';
  }

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
  String get blockedUsersCopyTag => 'Felhasználónév másolása';

  @override
  String get blockedUsersCopyId => 'Felhasználói azonosító másolása';

  @override
  String get userProfileLoadError => 'Nem sikerült betölteni a profil';

  @override
  String get userProfileLoading => 'Profil betöltése';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName Csapat';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName Közösségi Csapat';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName Partner';
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
    return '$productName Plutonium előfizető $date óta';
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
    return '$productName Visionary $date óta';
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
  String get userProfileRoles => 'Szerepkörök';

  @override
  String get memberRoleAdd => 'Szerepkör hozzáadása';

  @override
  String memberRoleRemove(String roleName) {
    return '$roleName szerepkör eltávolítása';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Ennek a felhasználónak nincsenek szerepkörei ebben a közösségben.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Még nincsenek szerepkörök. Szerepkörök hozzáadása itt: $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Nincsenek elérhető szerepkörök';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Ebben a közösségben jelenleg nincsenek kiosztható szerepkörök, de létrehozhatsz egy újat itt: $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Közösségi beállítások';

  @override
  String get guildSettingsRolesTab => 'Szerepkörök';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Helyi idő';

  @override
  String get userProfileSameTimeAsYou => 'Ugyanaz az időzóna, mint a tiéd';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'Ennyivel előtted: $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'Ennyivel mögötted: $duration';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours óra',
      one: '1 óra',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes perc',
      one: '1 perc',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours óra',
      one: '1 óra',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes perc',
      one: '1 perc',
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
  String get iarReportGuildTitle => 'Közösség jelentése';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Ha ez a bejelentés a közösség egy adott üzenetére vonatkozik, inkább azt az üzenetet jelentsd. Az üzenetjelentések adják a legvilágosabb kontextust biztonsági csapatunknak, és a megjegyzésekben megadott részletek segíthetnek nekünk gyorsabban áttekinteni. Csak akkor folytasd a közösség egészének jelentésével, ha egy üzenet jelentése nem fogná át a szélesebb problémát.';

  @override
  String get iarContinueToReportCommunity =>
      'Folytatás a közösség jelentéséhez';

  @override
  String get iarPreviewCommunitySubtitle => 'Közösség';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Zaklatás vagy célzott visszaélés';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'A közösség megkönnyíti a tömeges támadásokat vagy a célzott zaklatást.';

  @override
  String get iarReasonHateGuildDescription =>
      'Gyűlöletet szít védett csoportok ellen.';

  @override
  String get iarReasonTerrorismLabel =>
      'Terrorizmus vagy erőszakos szélsőségesség';

  @override
  String get iarReasonTerrorismDescription =>
      'Erőszakos szélsőséges tevékenységet népszerűsít, toboroz vagy koordinál.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Érett tartalom vagy nem biztonságos korlátozás';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Érett tartalom megfelelő korhatár-besorolás nélkül.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Kiskorúakat veszélyeztet, vagy gyermekek kizsákmányolásával kapcsolatos tartalmat tartalmaz.';

  @override
  String get iarReasonRaidLabel => 'Rajtaütés koordinálása';

  @override
  String get iarReasonRaidDescription =>
      'Koordinálja a rajtaütéseket, a brigádos támadásokat vagy a zaklatást személyek vagy közösségek ellen.';

  @override
  String get iarReasonSpamGuildDescription =>
      'A közösség a platform spam-elésére, átverésére vagy visszaélésére szolgál.';

  @override
  String get iarReasonMalwareGuildLabel => 'Kártevő terjesztése';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Kártevőket, hitelesítőadat-lopást vagy káros fájlokat terjeszt.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Adatvédelmi szabálysértés vagy doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Személyes adatokat oszt meg, felhasználókat zaklat, vagy a magánélet megsértését koordinálja.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Önsértésre buzdít';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Öngyilkosságra, önkárosításra vagy étkezési zavarokra buzdít.';

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
  String get slowmodeStatusEnabled => 'A lassú mód be van kapcsolva';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Lassú mód aktív ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'A lassú mód $durationLabel értékre van állítva, de te mentesülsz alóla.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'A lassú mód $durationLabel értékre van állítva. Várj, mielőtt újabb üzenetet küldenél.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'A lassú mód $durationLabel értékre van állítva ezen a csatornán.';
  }

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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName meghaladja a méretkorlátot ($fileSize)';
  }

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
      'Tartsd lenyomva a rögzítéshez. Húzd a kukába a törléshez, csúsztasd felfelé a zároláshoz, vagy engedd el a küldéshez.';

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
  String get voiceMessageSeekForward => 'Ugrás előre';

  @override
  String get voiceMessageSeekBackward => 'Vissza tekerés';

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
  String get chatAttachmentDownloadedToast => 'Mentve a fotók közé';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Nem sikerült letölteni a mellékletet';

  @override
  String get chatAttachmentExpiredTooltip => 'A melléklet lejárt';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kibontás ($count sor)',
      one: 'Kibontás ($count sor)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Összecsukás ($count sor)',
      one: 'Összecsukás ($count sor)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bontás ($count sor)',
      one: 'Bontás ($count sor)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Összecsukás ($count sor)',
      one: 'Összecsukás ($count sor)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count sor maradt)',
      one: '... ($count sor maradt)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count sor maradt)',
      one: '... ($count sor maradt)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Teljes fájl megtekintése';

  @override
  String get chatTextualPreviewChangeLanguage => 'Nyelv módosítása';

  @override
  String get chatTextualPreviewSearchLanguage => 'Nyelv keresése…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Szintaxis kiemelés';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Nincs találat';

  @override
  String get chatTextualPreviewMoreOptions => 'További lehetőségek';

  @override
  String get chatTextualPreviewWrapText => 'Szövegtörés';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'A fájl túl nagy a beágyazott előnézethez (korlát: $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'Nem sikerült betölteni az előnézetet.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Egyszerű szöveg';

  @override
  String get chatTextualPreviewCopy => 'Másolás';

  @override
  String get chatAttachmentSourceGallery => 'Galéria';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Fájlok tallózása';

  @override
  String get chatAttachmentPasteTooltip => 'Fájl beillesztése a vágólapról';

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
  String connectionsDescription(String productName) {
    return 'Külső fiókok és domainek összekapcsolása a $productName profiloddal. A hitelesített kapcsolatok megjelennek a profilodon, hogy mások is láthassák őket.';
  }

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
  String get lookAndFeelHdrSectionTitle => 'Nagy dinamikatartomány';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Beállítás, hogy az HDR képek hogyan jelenjenek meg HDR-képes monitorokon.';

  @override
  String get lookAndFeelHdrFullName => 'Teljes dinamikatartomány';

  @override
  String get lookAndFeelHdrFullDescription =>
      'HDR képek megjelenítése teljes fényerővel és színskálával.';

  @override
  String get lookAndFeelHdrStandardName => 'Normál tartomány';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'A HDR képek tónusleképezése normál tartományba, csökkentve a csúcsfényerőt.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Nagy dinamikatartományú megjelenítési mód';

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
  String get lookAndFeelChatFontScalingTitle => 'Csevegés betűméretezése';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Állítsd be a betűméretet a csevegési területen.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Csevegés betűmérete';

  @override
  String get lookAndFeelAppZoomTitle => 'Alkalmazás nagyítási szintje';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Az alkalmazás nagyítási szintjének beállítása.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Csevegés háttere';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Válassz hátteret a csevegéshez. Ez az eszközön marad.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Ez a beállítás ezen az eszközön marad';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'A csevegés háttere csak ezen az eszközön van mentve, és nem szinkronizálódik más eszközökre.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Alapértelmezett';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Egyéni kép';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Szín $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradiens $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Háttérkép elsötétítése';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Nem sikerült beállítani ezt a képet háttérképként.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Üzenetek';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Válaszd ki, hogyan jelenjenek meg az üzenetek a csevegőcsatornákon.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Térköz az üzenetcsoportok között';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel =>
      'Üzenetek megjelenítési módja';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Kényelmes';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Tágas elrendezés, világos vizuális elkülönítéssel az üzenetek között.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Sűrű';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximalizálja a látható üzenetek számát minimális térközzel.';

  @override
  String get lookAndFeelHideUserAvatarsLabel =>
      'Felhasználói avatárok elrejtése';

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
  String get communityTemporarilyUnavailable =>
      'A közösség átmenetileg nem elérhető';

  @override
  String get guildUnavailableDescription =>
      'Valami hiba történt. Dolgozunk rajta.';

  @override
  String get guildNotFoundTitle => 'Ez nem az a közösség, amit keresel.';

  @override
  String get guildNotFoundDescription =>
      'Lehet, hogy a keresett közösséget törölték, vagy nincs hozzáférésed.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'A(z) $communityName jelenleg csak a(z) $productName munkatársai számára érhető el';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'átmenetileg nem elérhető';

  @override
  String get lookAndFeelCollapseDMsLabel => 'DM-ek összecsukása mappába';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Ha engedélyezve van, az olvasatlan DM-ek a kiszolgáló oldalsávban a $productName gomb mappájába lesznek összecsukva. Kattints a $productName gombra a DM-ek oldalon a mappa kibontásához vagy összecsukásához.';
  }

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
  String get favoritesAddToSavedMedia => 'Mentés a médiatárba';

  @override
  String get favoritesRemoveFromSavedMedia =>
      'Eltávolítás a mentett médiák közül';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'GIF-fájlok hozzáadása URL alapján (feltöltés nélkül) a kedvencekhez.';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Eltávolítás az URL-en alapuló GIF-kedvencek közül';

  @override
  String get savedMediaAddTitle => 'Mentés a médiatárba';

  @override
  String get savedMediaFormNameLabel => 'Név';

  @override
  String get savedMediaFormNameHint => 'Saját média';

  @override
  String get savedMediaFormAltTextLabel => 'Alternatív szöveg';

  @override
  String get savedMediaFormAltTextHint => 'Média leírása';

  @override
  String get savedMediaFormTagsLabel => 'Címkék';

  @override
  String get savedMediaFormTagsHint => 'vicces, reakció, munka';

  @override
  String get savedMediaSaveError => 'Nem sikerült frissíteni a mentett médiát.';

  @override
  String get savedMediaNameRequired => 'Név megadása kötelező.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Hogyan mentsük el a GIF kedvenceidet?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Elmentheted a kedvenc GIF-jeidet URL-ként, vagy feltöltheted őket a mentett médiatárba. Válaszd ki, amelyik jobban illik a használatodhoz. Bármikor módosíthatod a Beállítások > Speciális > Média menüpontban.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-only kedvencek (alapértelmezett): szinkronizálva az eszközeid között, nincs feltöltés, nem számít bele a mentett médiába. Az eredeti média eltűnhet, ha a tárhely eltávolítja azt.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Média mentve: feltölthető, címkézhető, kereshető és megmarad, de beleszámít a mentett média korlátodba.';

  @override
  String get gifFavoriteFirstTimeHint => 'Csak egyszer kérdezzük meg.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Csak URL használata (ajánlott)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Média mentése';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Amikor közvetlenül a $productName van feltöltve';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'Kameraképek feltöltése';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Válaszd ki, hogy az alkalmazáson belüli kamerával készített fényképek és videók megmaradjanak-e az eszközödön';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Mentés eszközre';

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
  String get accessibilitySaturationTitle => 'Telítettség';

  @override
  String get accessibilitySaturationDescription =>
      'Szabályozza, hogy mennyire élénken jelennek meg a témaszínek az alkalmazásban.';

  @override
  String get accessibilityVisualGroupTitle => 'Vizuális';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Mindig aláhúzza a hivatkozásokat';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Áthúzott szöveg halványítása';

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
  String get accessibilityScreenReaderGroupTitle => 'Képernyőolvasó';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Vezérlés, hogyan működik a(z) $productName a képernyőolvasókkal.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Új üzenetek bemondása';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'A képernyőolvasók felolvassák az új üzeneteket, amint azok megérkeznek a megnyitott csatornára. Az értesítési hangok változatlanok maradnak.';

  @override
  String get accessibilityTtsGroupTitle => 'Szövegfelolvasás';

  @override
  String get accessibilityTtsGroupDescription =>
      'Válassza ki a beszélt szöveg sebességét.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Beszédlejátszás sebessége';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Minta lejátszása';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Minta elnémítása';

  @override
  String get accessibilityPreviewButtonLabel => 'Előnézet gomb';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Így jelennek meg a hivatkozások: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Előnézeti felhasználó';

  @override
  String get accessibilityKeyboardGroupTitle => 'Billentyűzet';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Fókuszgyűrű megjelenítése a csevegés szövegmezőjén';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Az Esc billentyűvel léphet ki a billentyűzet módból';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Helyi menü parancsikonok megjelenítése';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Megerősítés hívás indítása előtt';

  @override
  String get accessibilityAnimationGroupTitle => 'Animáció';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'A csökkentett mozgás be van kapcsolva, így a tartalmi animációk alapértelmezetten szünetelnek. Ettől függetlenül bármelyiket újra bekapcsolhatod a lejátszáshoz.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Animált hangulatjelek lejátszása';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'GIF-ek automatikus lejátszása';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'GIF-ek automatikus lejátszása, ha a $productName fókuszban van';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Lejátszás a csökkentett mozgás ellenére.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Szüneteltetve a csökkentett mozgás miatt. Kapcsolja be az animált hangulatjelek lejátszásához.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Szüneteltetve a csökkentett mozgás miatt. Kapcsolja be a GIF-ek lejátszásához.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Mobilon alapértelmezetten ki van kapcsolva az akkumulátor-üzemidő és az adatforgalom kímélése érdekében.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Matricaanimációk';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Matricaanimáció beállításai';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Mindig animálja';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'A matricák mindig animálva lesznek';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animálás interakciókor';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'A matricák megnyomásra animálódnak';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'A matricák animálódnak, ha föléjük viszed az egeret, vagy interakcióba lépsz velük';

  @override
  String get accessibilityStickerNeverAnimateName => 'Soha ne animáljon';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'A matricák sosem fognak animálódni';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Mindig animált, a csökkentett mozgás ellenére.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'A csökkentett mozgás korlátozza a matricák animálását interakcióra. Az „mindig animálja” választásával felülbírálhatja.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Alapértelmezés szerint mobilon interakcióra animál, az akkumulátor kímélése érdekében.';

  @override
  String get accessibilityMotionGroupTitle => 'Mozgás';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Rendszer mozgáscsökkentési beállításainak szinkronizálása';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Használja az eszköz rendszerének csökkentett mozgásra vonatkozó beállítását, vagy szabja testre alább.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Mozgás csökkentése';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Animációk és átmenetek letiltása. Jelenleg a rendszerbeállítások vezérlik.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Animációk és átmenetek kikapcsolása az alkalmazásban.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Az animált hangulatjelek, GIF-ek és matricák az Animáció lapon maradnak az irányítása alatt.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Hívás indítása?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Biztosan el akarod indítani ezt a hívást?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Hívás indítása';

  @override
  String get accessibilityTtsSampleDescription =>
      'Hallgasd meg a mintamondatot a kiválasztott sebességgel.';

  @override
  String get accessibilityTtsSampleText =>
      'Doki, a jövőből jöttem. Azzal az időgéppel érkeztem, amit te találtál fel. Most a segítségedre van szükségem, hogy visszajussak 1985-be.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'A szövegbeszéd nem érhető el ezen az eszközön.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'A beszédlejátszás sikertelen. Próbáld újra, vagy ellenőrizd, hogy működik-e a hangkimenet.';

  @override
  String get ttsSubstitutionUnknownUser => 'ismeretlen felhasználó';

  @override
  String get ttsSubstitutionUnknownRole => 'ismeretlen szerepkör';

  @override
  String get ttsSubstitutionUnknownChannel => 'ismeretlen csatorna';

  @override
  String get ttsSubstitutionCodeBlock => 'kódblokk';

  @override
  String get ttsSubstitutionSpoiler => 'Plutonium';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '$emojiName hangulatjel';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/$commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName mondta: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return '$replyAuthorName üzenetére válaszolva $authorName ezt mondta: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'matricát küldött';

  @override
  String get ttsSentAttachment => 'mellékletet küldött';

  @override
  String ttsSentAttachments(int count) {
    return 'elküldött $count melléklet';
  }

  @override
  String get ttsSentEmbed => 'beágyazott tartalmat küldött';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author küldött: $summary';
  }

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
  String get systemCallJoinTheCall => 'Csatlakozás a híváshoz';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username indított egy hívást, amely $duration ideig tartott.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Lekésteél egy hívást $username-tól, amely $duration ideig tartott.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Lekésted a hívást erről: $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'néhány másodperc';

  @override
  String get systemCallDurationMinute => 'egy perce';

  @override
  String get systemCallDurationOneYear => '1 év';

  @override
  String get systemCallDurationOneMonth => '1 hónap';

  @override
  String get systemCallDurationOneWeek => '1 hét';

  @override
  String get systemCallDurationOneDay => '1 nap';

  @override
  String get systemCallDurationOneHour => '1 óra';

  @override
  String systemCallDurationYears(int count) {
    return '$count év';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count hónap';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count hét';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count nap';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count óra';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count perc';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Frissítse a(z) $productName alkalmazást az üzenet megtekintéséhez.';
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
  String get voiceJoinFailedTitle => 'Nem sikerült csatlakozni a hanghíváshoz';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Nem tudtuk leválasztani a többi eszközödet. Próbáld meg újra egy pillanat múlva.';

  @override
  String get voiceChannelEmptyDescription =>
      'Ez egy hangcsatorna. Csatlakozz, hogy beszélhess!';

  @override
  String get voiceChannelJoin => 'Csatlakozás a hangcsatornához';

  @override
  String get voiceCallJoin => 'Csatlakozás a híváshoz';

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
  String get voiceControlFlipCamera => 'Kamera váltása';

  @override
  String get voiceControlScreenShare => 'Képernyőmegosztás';

  @override
  String get voiceScreenShareNotificationText => 'Megosztod a képernyődet.';

  @override
  String get voiceControlMore => 'Továbbiak';

  @override
  String get voiceControlDisconnect => 'Kapcsolat bontása';

  @override
  String get voiceInChat => 'Hangcsevegésben';

  @override
  String get voiceConnectionFailed => 'Kapcsolat nem sikerült';

  @override
  String get voiceConnectionRetry => 'Újra';

  @override
  String get voiceConnectionDismiss => 'Elvetés';

  @override
  String get voiceConnectionDisconnected => 'Kapcsolat megszakadt';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Késleltetés mérése...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Ugrás ide: $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Hangkapcsolat';

  @override
  String get voiceConnectionAdvancedStats => 'Speciális';

  @override
  String get voiceShowCallAvatars =>
      'Hívásban lévők profilképeinek megjelenítése';

  @override
  String get voiceShowConnectionId => 'Kapcsolatazonosító megjelenítése';

  @override
  String get voiceAudioProcessing => 'Hangfeldolgozás';

  @override
  String get voiceConnectionSessionSection => 'Munkamenet';

  @override
  String get voiceConnectionDurationLabel => 'Időtartam';

  @override
  String get voiceConnectionParticipantsLabel => 'Résztvevők';

  @override
  String get voiceConnectionNetworkSection => 'Hálózat';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Zavar';

  @override
  String get voiceConnectionSendLabel => 'Küldés';

  @override
  String get voiceConnectionReceiveLabel => 'Vétel';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes p $seconds mp';
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
  String get userAreaMuteMicrophone => 'Mikrofon némítása';

  @override
  String get userAreaUnmuteMicrophone => 'Mikrofon némításának feloldása';

  @override
  String get userAreaUserSettings => 'Felhasználói beállítások';

  @override
  String get voiceParticipantMenuViewProfile => 'Profil megtekintése';

  @override
  String get voiceParticipantMenuFocus => 'Fókuszálás erre a személyre';

  @override
  String get voiceParticipantMenuUnfocus => 'Fókusz feloldása';

  @override
  String get voiceParticipantMenuCommunityMute => 'Közösségi némítás';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Közösségi némítás';

  @override
  String get voiceParticipantMenuUserVolume => 'Felhasználó hangereje';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream hangereje';

  @override
  String get voiceParticipantMenuStopStreaming => 'Leállítás';

  @override
  String get voiceParticipantModerationFailed =>
      'Nem sikerült frissíteni a tagot. Kérlek, próbáld újra.';

  @override
  String get voiceControlChat => 'Csevegés';

  @override
  String get voiceCallViewModeLabel => 'Megtekintés';

  @override
  String get voiceCallViewModeGrid => 'Rács';

  @override
  String get voiceCallViewModeFocus => 'Fókusz';

  @override
  String get voicePanelSettingsSectionTitle => 'Hangbeállítások';

  @override
  String get voicePanelUseEarpieceLabel =>
      'Hangszóró helyett a telefon hangszóróját használja';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Csak a videók megjelenítése';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Csak azokat a résztvevőket jeleníti meg, akik bekapcsolták a kamerájukat.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Saját kamera megjelenítése';

  @override
  String get voicePrioritizeSpeakersLabel => 'Beszélők előtérbe helyezése';

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
  String get privacyDashboardProfilePrivacySection => 'Profil adatvédelme';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Barátok és közvetlen üzenetek';

  @override
  String get privacyDashboardActivitySharingSection => 'Aktivitásmegosztás';

  @override
  String get privacyDashboardSensitiveContentSection => 'Érzékeny tartalom';

  @override
  String get privacyDashboardDataExportSection => 'Adat exportálása';

  @override
  String get privacyDashboardDataDeletionSection => 'Adattörlés';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Ki láthatja a teljes profilodat';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Ismerősök és minden közösség';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Teljes profilod látható az ismerőseid és a közösségeid tagjai számára';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Csak barátok és kis közösségek';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'A teljes profilod látható az ismerőseid és a 200 vagy annál kevesebb tagot számláló közösségeid tagjai számára';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Csak ismerősök';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'A teljes profilod csak az ismerőseid számára látható';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Ismerősjelölések';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Mindenki';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Bárki küldhet neked ismerősnek jelölési kérést';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Ismerősök ismerősei';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Engedélyezd, hogy a barátaid barátai is küldhessenek neked kéréseket';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Közösség tagjai';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Engedélyezd, hogy a közösségeid tagjai kérjenek ismerősnek.';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Közvetlen üzenetek';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Közvetlen üzenetek engedélyezése a közösség tagjaitól';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Engedélyezd, hogy a közösségeid tagjai közvetlen üzeneteket küldhessenek neked';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Közvetlen üzenetek engedélyezése közösségi botoktól';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Engedélyezd a botoknak, hogy közvetlen üzeneteket küldjenek neked az általad használt közösségekből';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Vezéreld, ki küldhet neked ismerős- és közvetlen üzeneteket.';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Vezérelheted, hogy ki hívhasson téged, és ki vehessen fel csoportos csevegésekbe';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Bejövő hívások';

  @override
  String get privacyDashboardIncomingCallsDesc => 'Vezéreld, ki hívhat téged';

  @override
  String get privacyDashboardAllowedCallers => 'Engedélyezett hívók';

  @override
  String get privacyDashboardIncomingCallNobody => 'Senki';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blokkolj minden beérkező hívást';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Csak barátok';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Csak a barátaid hívhassanak (ajánlott)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Ismerősök + Egyéni';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Engedélyezd a barátoknak és további, általad választott csoportoknak';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Mindenki';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Engedélyezd bárkinek, hogy felhívjon, akár idegeneknek is';

  @override
  String get privacyDashboardAdditionalGroups => 'További csoportok';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'A barátaid barátai is felhívhatnak.';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Azok, akikkel mindkettőtöknek van közös közössége, felhívhatnak.';

  @override
  String get privacyDashboardRingBehavior => 'Gyűrű viselkedése';

  @override
  String get privacyDashboardSilentCalls => 'Némított hívások mindenkitől';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Minden hívás néma értesítést küld csengés helyett. Alapértelmezetten a nem ismerősöktől érkező hívások mindig némák.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Ki vehet fel csoportos csevegésekbe';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Szabhatod, ki adhat hozzá csoportos csevegésekhez kérés nélkül. Bárki küldhet neked meghívó linket a csatlakozáshoz.';

  @override
  String get privacyDashboardAllowedInvites => 'Engedélyezett meghívások';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Senki se vehessen fel csoportos csevegésekbe kérés nélkül';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Csak a barátaid adhatnak hozzá kérés nélkül (ajánlott)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Engedélyezd barátoknak és további csoportoknak, hogy hozzáadjanak';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Bárki hozzáadhat csoportos csevegésekhez anélkül, hogy engedélyt kérne';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'A barátaid barátai felvehetnek csoportos csevegésekbe';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Azok, akikkel mindkettőtöknek van közös közössége, felvehetnek csoportos csevegésekbe.';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Hangtevékenység az „Aktív most\" funkcióban';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Hangtevékenység megosztása ismerősökkel';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Megosztod a hangtevékenységet az összes barátoddal?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Leállítja a hangtevékenység megosztását az összes baráttal?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Mostantól megosztod a hangtevékenységedet az összes barátoddal, beleértve a jövőbelieket is. Ez frissítést küld nekik, és csak 24 óra múlva módosítható újra.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Hamarosan leállítod a hangtevékenységed megosztását az összes barátoddal, beleértve a jövőbelieket is. Ez frissítést küld nekik, és csak 24 óra múlva módosítható újra.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Igen, megosztás az összes baráttal';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Igen, leállítom a megosztást';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Újra elérhető ekkor: $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Hangtevékenység megosztása frissítve';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Nem sikerült frissíteni a hangtevékenység megosztását';

  @override
  String get privacyDashboardDataExportDesc =>
      'Készítsen letölthető archívumot fiókadatairól, beleértve az üzeneteket és a csatolmányok URL-jeit. A legtöbben mindent szeretnének, de alább szűkítheti a kört.';

  @override
  String get privacyDashboardExportMyData => 'Adataim exportálása';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Véglegesen törli az üzeneteket, amelyeket közvetlen üzenetekben, csoportos közvetlen üzenetekben és közösségekben küldött. A folyamat a háttérben fut, és közvetlen üzenetben értesítjük, ha elkészült.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Üzeneteim törlése';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Engedélyezi a közvetlen üzeneteket a közösség tagjaitól?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Letiltod a közvetlen üzeneteket a közösség tagjaitól?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Engedélyezi, hogy botok közvetlen üzeneteket küldjenek Önnek?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blokkolja, hogy botok közvetlen üzeneteket küldjenek Önnek?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Szeretnéd engedélyezni a közvetlen üzeneteket a meglévő közösségeid tagjaitól is?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Szeretnéd letiltani a közvetlen üzeneteket a meglévő közösségeid tagjaitól is?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Szeretnéd, hogy a meglévő közösségeid botjai is küldhessenek neked közvetlen üzeneteket?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Szeretnéd blokkolni a botokat a meglévő közösségeidből is?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Ezt a beállítást közösségenként is módosíthatod, ha hosszan nyomod a közösség nevét, és kiválasztod az Adatvédelmi beállítások lehetőséget.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Engedélyezés minden közösség számára';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Blokkolás minden közösségben';

  @override
  String get privacyDashboardDmConfirmSkip => 'Lépés kihagyása';

  @override
  String get privacyDashboardDataRequestGoBack => 'Vissza';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Adataim exportálása';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Üzeneteim törlése';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'A lehető leghamarabb feldolgozzuk. E-mailt kapsz, ha az archívumod elkészült.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'A lehető leghamarabb feldolgozzuk. Ha elkészültünk, DM-et kapsz tőlünk.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Mit tartalmazzon';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Mindent';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Exportálja az összes elküldött üzenetét, valamint az összes fiókbeállítását, tagságát és metaadatát.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Egyéni kiválasztás';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Válassza ki, mely beszélgetéstípusokat, közösségeket és időszakot szeretné belefoglalni az archívumba.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Válassza ki, mit szeretne belefoglalni';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Válaszd ki, milyen típusú beszélgetéseket szeretnél törölni.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Csak azok a helyek, amikhez már nincs hozzáférésem';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Csak azokat az üzeneteket törölje, amelyek olyan közösségekből és csoportos közvetlen üzenetekből származnak, amelyeket elhagyott, vagy amelyekből eltávolították.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Melyik beszélgetések';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Válaszd ki, milyen típusú beszélgetéseket szeretnél belefoglalni.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Nyitott közvetlen üzenetek';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Lezárt DM-ek';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Csoportos DM-ek';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Közösségek';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Mely közösségek';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Közösségi szűrő';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Mindent belefoglal, kivéve a kiválasztottat';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Csak a kiválasztottak';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Jelenleg nem vagy tagja egyetlen közösségnek sem.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Időtartomány';

  @override
  String get privacyDashboardDataRequestDateMode => 'Időtartomány';

  @override
  String get privacyDashboardDataRequestAllTime => 'Mindig';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Egyéni időtartomány';

  @override
  String get privacyDashboardDataRequestStartDate => 'Kezdő dátum';

  @override
  String get privacyDashboardDataRequestEndDate => 'Befejezés dátuma';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Hagyja üresen bármelyik mezőt, ha a tartományt azon a végén korlátlanul szeretné hagyni.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Válasszon ki legalább egy beszélgetéstípust a felvételhez.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'A kezdő dátumnak korábbinak kell lennie, mint a befejező dátum.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Áttekintés és megerősítés';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Összeállítunk egy letölthető archívumot az összes elküldött üzenetéről, és e-mailben értesítjük, ha elkészült. Az e-mailben található letöltési link 7 nap múlva lejár.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Létrehozunk egy letölthető archívumot az alábbi szűrők alapján, és e-mailben értesítünk, ha elkészült. Az e-mailben található letöltési link 7 nap múlva lejár.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Véglegesen törli az alábbi szűrőknek megfelelő üzeneteket. Ez a művelet nem vonható vissza.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Ha elindult, már nincs visszaút. DM-ben értesítünk, ha elkészült.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Exportálás kérése';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Üzenetek törlése';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Hatókör';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Beszélgetések';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Közösségek';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Időtartomány';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Nincs';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Ettől: $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Eddig: $end';
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
      other: '# közösséget',
      one: '# közösséget',
    );
    return 'Összes, kivéve $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# közösség',
      one: '# közösség',
    );
    return 'Csak $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Nyitott közvetlen üzenetek';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Lezárt közvetlen üzenetek';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Közvetlen üzenetek (nyitott és zárt)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Csoportos DM-ek';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Közösségek';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# óra',
      one: '# óra',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# perc',
      one: '# perc',
    );
    return '$_temp0 és $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# óra',
      one: '# óra',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# perc',
      one: '# perc',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# másodperc',
      one: '# másodperc',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'A titoktartási beállítások betöltése sikertelen';

  @override
  String get privacyDashboardRetry => 'Újrapróbálkozás';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Nem sikerült menteni az érzékeny tartalom beállításait.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'A kérés teljesítése sikertelen.';

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
  String get forwardSendSlowmodeBlocked =>
      'Várakozás, amíg a lassú mód lejár egy vagy több kiválasztott csatornán.';

  @override
  String get slowmodeRateLimitedTitle => 'Lassú mód aktív';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'A lassú mód be van kapcsolva – várj $duration mielőtt újat küldenél.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Közvetlen feltöltés nem engedélyezett lassú módban.';

  @override
  String get shareMediaTitle => 'Megosztás';

  @override
  String get shareMediaMessageHint => 'Adj hozzá egy opcionális üzenetet…';

  @override
  String get shareMediaSendButton => 'Küldés';

  @override
  String get shareMediaSuccessToast => 'Média megosztva';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Megosztva $count célállomásra';
  }

  @override
  String get shareMediaFailedToast => 'Média megosztása sikertelen';

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
  String get chatMessageCopyEmbedText => 'Embed szövegének másolása';

  @override
  String get chatMessageTranslate => 'Fordítás';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Fordítva innen: $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Eredeti megtekintése';

  @override
  String get chatMessageSeeTranslation => 'Fordítás megtekintése';

  @override
  String get chatMessageTranslating => 'Fordítás…';

  @override
  String get chatMessageTranslateFailed =>
      'Nem sikerült lefordítani ezt az üzenetet.';

  @override
  String get chatMessageTranslateUnavailable =>
      'A fordítás nem érhető el ezen az eszközön.';

  @override
  String get chatMessageSpeak => 'Üzenet felolvasása';

  @override
  String get chatMessageStopSpeaking => 'Felolvasás leállítása';

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
  String get chatMessageOpenLink => 'Link megnyitása';

  @override
  String get chatMessageCopyLink => 'Link másolása';

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
  String get chatReactionAddFailed => 'Reakció hozzáadása sikertelen';

  @override
  String get chatReactionRemoveFailed => 'A reakció eltávolítása sikertelen';

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
  String iarReasonOtherDescription(String productName) {
    return 'Csak akkor használd, ha egyértelműen megszegi a $productName szabályait, és nem illeszkedik a fentiekhez.';
  }

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
  String get chatMessageDeleteAttachment => 'Melléklet törlése';

  @override
  String get chatMessageEditAttachmentAltText =>
      'Alternatív szöveg szerkesztése';

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
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count letiltott üzenet',
      one: '1 letiltott üzenet',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potenciális spammelő üzenet',
      one: '1 potenciális spammelő üzenet',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'A válasz elrejtve, mert az eredeti szerző le van tiltva.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'A válasz elrejtve, mert az eredeti szerző spammerként van megjelölve.';

  @override
  String get devMarkAsSpamLocally => 'Jelölés spamként (csak nálam)';

  @override
  String get devIgnoreSpamFlag => 'Spamjelzés figyelmen kívül hagyása';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'Médiaopciók';

  @override
  String get mediaViewerCopyLink => 'Link másolása';

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
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Melléklet $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Elvetés';

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
  String get composerAutocompleteSuggestions => 'Javaslatok';

  @override
  String get composerAutocompleteCommandsHeading => 'Parancsok';

  @override
  String get composerAutocompleteChoicesHeading => 'Választások';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Opcionális argumentumok';

  @override
  String get composerAutocompleteChannelsHeading => 'Csatornák';

  @override
  String get composerAutocompleteMembersHeading => 'Tagok';

  @override
  String get composerAutocompleteUsersHeading => 'Felhasználók';

  @override
  String get composerAutocompleteMentionsHeading => 'Említések';

  @override
  String get composerAutocompleteRolesHeading => 'Szerepkörök';

  @override
  String get composerAutocompleteMediaHeading => 'Média';

  @override
  String get composerAutocompleteStickersHeading => 'Matricák';

  @override
  String get composerAutocompleteGifsHeading => 'GIF-ek';

  @override
  String get composerAutocompleteNoGifs => 'Nem található GIF';

  @override
  String get composerCommandShrugDescription =>
      'Hozzáfűzi a ¯\\_(ツ)_/¯ jelet az üzenetedhez.';

  @override
  String get composerCommandTableflipDescription =>
      'Hozzáfűzi ezt: (╯°□°)╯︵ ┻━┻ az üzenetéhez.';

  @override
  String get composerCommandUnflipDescription =>
      'Ezt fűzi hozzá az üzenetedhez: ┬─┬ ノ( ゜-゜ノ).';

  @override
  String get composerCommandMeDescription =>
      'Műveleti üzenet küldése (dőlt betűvel).';

  @override
  String get composerCommandSpoilerDescription =>
      'Spoiler üzenet küldése (spoiler címkék közé zárja).';

  @override
  String get composerCommandTtsDescription => 'Szövegfelolvasó üzenet küldése.';

  @override
  String get composerCommandNickDescription =>
      'Változtasd meg a beceneved ebben a közösségben.';

  @override
  String get composerCommandKickDescription =>
      'Tag eltávolítása a közösségből.';

  @override
  String get composerCommandBanDescription =>
      'Tag kitiltása ebből a közösségből.';

  @override
  String get composerCommandMsgDescription =>
      'Közvetlen üzenet küldése egy felhasználónak.';

  @override
  String get composerCommandSavedDescription => 'Mentett médiaelem küldése.';

  @override
  String get composerCommandStickerDescription => 'Matrica küldése.';

  @override
  String get composerCommandGifDescription => 'GIF keresése és küldése.';

  @override
  String get composerCommandMemberOption => 'A célzott tag.';

  @override
  String get composerCommandReasonOption => 'Indoklás (nem kötelező).';

  @override
  String get composerCommandMessageOption => 'Az üzenet, amit elküldesz.';

  @override
  String get composerCommandQueryOption => 'Mit keress.';

  @override
  String get composerCommandNicknameOption =>
      'Az új beceneved, vagy hagyd üresen az alapértelmezés visszaállításához.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'A tagadott tag nemrég küldött üzeneteinek mennyi előzményét töröljük.';

  @override
  String get composerCommandDeleteMessagesNone => 'Ne törölj semmit';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Előző $count nap';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Előző 24 óra';

  @override
  String get composerCommandOptionRequired =>
      'Ez az opció kötelező. Kérlek, adj meg egy értéket.';

  @override
  String get composerCommandClear => 'Parancs törlése';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Megváltoztattad a becenevedet ebben a közösségben: **$previousNickname**-ről **$newNickname**-re.';
  }

  @override
  String get composerCommandUnknownUser => 'Ismeretlen felhasználó';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Nem sikerült üzenetet küldeni **$username** számára. Lehetséges, hogy kikapcsolta az üzenetküldést, vagy blokkolva lettél.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count további';
  }

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
  String get addGuildCreateTitle => 'Közösség létrehozása';

  @override
  String get addGuildCreateDescription =>
      'Közösség létrehozása, ahol tudsz beszélgetni a barátaiddal.';

  @override
  String get addGuildCreateNameLabel => 'Közösség neve';

  @override
  String get addGuildCreateSubmit => 'Közösség létrehozása';

  @override
  String get addGuildCreateFailed =>
      'Nem sikerült létrehozni a közösséget. Kérlek, próbáld újra.';

  @override
  String get addGuildCreateClaimTitle => 'Igényeld a fiókod';

  @override
  String get addGuildCreateClaimDescription =>
      'Közösség létrehozása előtt igényelned kell a fiókodat.';

  @override
  String get addGuildCreateVerifyTitle => 'Erősítsd meg az email címed';

  @override
  String get addGuildCreateVerifyDescription =>
      'Közösség létrehozása előtt meg kell erősítened az email címedet.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Az animált ikonok nem támogatottak új közösség létrehozásakor. Használj statikus képet.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'A közösség létrehozásával beleegyezel, hogy betartod a ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName közösségi irányelveket';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Ez a példány egyetlen közösség, így további közösségek nem hozhatók létre.';

  @override
  String get addGuildCreateChangeIcon => 'Ikon módosítása';

  @override
  String get addGuildCreateIconLabel => 'Közösségi ikon';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Max 10MB. Javasolt: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Illessz be egy Discord sablon URL-t, hogy annak struktúráját importáld egy új közösségbe.';

  @override
  String get addGuildImportUrlLabel => 'Sablon URL-je';

  @override
  String get addGuildImportUrlInvalid =>
      'Adj meg egy érvényes Discord sablon URL-t vagy kódot.';

  @override
  String get addGuildImportFetchFailed =>
      'Nem sikerült lekérni a közösségsablont. Lehetséges, hogy a sablon nem létezik, vagy a külső szolgáltatás nem érhető el.';

  @override
  String get addGuildImportInvalidResponse =>
      'Ez nem tűnik érvényes sablonválasznak.';

  @override
  String get addGuildImportTemplateLabel => 'Sablon';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount szöveges, $voiceChannelCount hang, $categoryCount kategória, $roleCount szerepkör';
  }

  @override
  String get addGuildImportRemoveIcon => 'Ikon eltávolítása';

  @override
  String get addGuildImportTemplateInvalid =>
      'A közösségsablon adatai érvénytelenek vagy hibásan formázottak.';

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
  String get channelDetailsFallbackTitle => 'Részletek';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Csoportos DM · $count tag';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Bezárja a beszélgetést ezzel: $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Elhagyod a(z) $name csoportot?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Csatornabeállítások';

  @override
  String get channelDetailsGroupSettingsTitle => 'Csoportbeállítások';

  @override
  String get channelDetailsDmSettingsTitle => 'Személyes üzenetek beállításai';

  @override
  String get channelDetailsInvitePeople => 'Emberek meghívása';

  @override
  String get channelDetailsCopyLink => 'Hivatkozás másolása';

  @override
  String get channelMenuCopyChannelLink => 'Csatornalink másolása';

  @override
  String get channelMenuCopyRedirectLink => 'Átirányítási hivatkozás másolása';

  @override
  String get channelDetailsAddFriendsToGroup =>
      'Ismerősök hozzáadása a csoporthoz';

  @override
  String get channelDetailsGroupInvites => 'Csoportmeghívók';

  @override
  String get channelDetailsEditChannel => 'Csatorna szerkesztése';

  @override
  String get channelDetailsDeleteChannel => 'Csatorna törlése';

  @override
  String get channelSettingsCategorySettingsTitle => 'Kategóriabeállítások';

  @override
  String get channelSettingsEditCategory => 'Kategória szerkesztése';

  @override
  String get channelSettingsTabOverview => 'Áttekintés';

  @override
  String get channelSettingsTabPermissions => 'Engedélyek';

  @override
  String get channelSettingsTabInvites => 'Meghívók';

  @override
  String get channelSettingsTabWebhooks => 'Webhookok';

  @override
  String get channelSettingsDeleteChannel => 'Csatorna törlése';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Biztosan törölni szeretnéd a(z) $channelName csatornát? Ezt nem lehet visszavonni.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Biztosan törölni szeretnéd a(z) $categoryName kategóriát? Ezt nem lehet visszavonni.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Kategória törlése';

  @override
  String get channelSettingsChannelUpdated => 'A csatorna frissítve';

  @override
  String get channelSettingsChannelName => 'Csatornanév';

  @override
  String get channelSettingsCategoryName => 'Kategória neve';

  @override
  String get channelSettingsMyCategory => 'Saját kategória';

  @override
  String get categoryExpandCategory => 'Kategória kibontása';

  @override
  String get categoryCollapseCategory => 'Kategória összecsukása';

  @override
  String get categoryExpandAllCategories => 'Összes kategória kibontása';

  @override
  String get categoryCollapseAllCategories => 'Összes kategória becsukása';

  @override
  String get categoryMuteCategory => 'Kategória némítása';

  @override
  String get categoryUnmuteCategory => 'Kategória némításának feloldása';

  @override
  String get categoryCopyCategoryId => 'Kategóriaazonosító másolása';

  @override
  String get categoryIdCopied => 'Kategóriaazonosító másolva';

  @override
  String get channelSettingsChannelNamePlaceholder => 'általános';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Téma';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Adj hozzá témát ehhez a csatornához';

  @override
  String get channelSettingsInsertEmoji => 'Emoji beszúrása';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'A csatorna témája túl hosszú.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Rövidítsd le a témát, és próbáld újra.';

  @override
  String get channelSettingsSlowmode => 'Lassú mód';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Üzenetek közötti várakozási idő. A \"$bypassSlowmodePermissionLabel\" felülbírálhatja ezt.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Ki';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds másodperc';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes perc';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours óra';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute perc';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour óra';
  }

  @override
  String get channelSettingsVoiceQuality => 'Hangminőség';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Nagyobb bitráta = jobb minőség és nagyobb sávszélesség-használat.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Résztvevők korlátja';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Legfeljebb ennyi tag csatlakozhat egyszerre. A 0 korlátlan.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count résztvevő',
      one: '1 résztvevő',
      zero: '∞ Nincs korlátozás',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Kapcsolatkorlát';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Egy tag által ebben a csatornában fenntartható maximális aktív kapcsolatok száma.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kapcsolat',
      one: '1 kapcsolat',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Hangrégió';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Válassz hangrégiót ehhez a csatornához. Az Automatikus a legközelebbi régiót használja.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatikus';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Nem sikerült betölteni a hangrégiókat';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Próbálja meg újra egy pillanat múlva.';

  @override
  String get channelSettingsResetSlider =>
      'Csúszka visszaállítása alapértelmezett értékre';

  @override
  String get channelSettingsAdvanced => 'Speciális';

  @override
  String get channelSettingsMatureContentOverride =>
      'Felnőtt tartalom felülbírálása';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'A csatornára vonatkozó, $scopeLevel szintű beállítás felülbírálása. Az érett tartalom belépés előtt kapu mögött jelenik meg.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Öröklés';

  @override
  String get channelSettingsMatureContentOn => 'Be';

  @override
  String get channelSettingsMatureContentOff => 'Ki';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Megjelöli ezt a csatornát, mint amely felnőtteknek szóló tartalmat jelenít meg.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Hagyd ezt a csatornát felnőtt tartalomra megnyitva.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Örökölt: $inheritedSourceLabel: bekapcsolva';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Örökölt: $inheritedSourceLabel: ki';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'kategória';

  @override
  String get channelSettingsMatureContentCommunitySource => 'közösség';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategória';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Közösség';

  @override
  String get channelSettingsContentWarningToggle =>
      'Tartalmi figyelmeztetés megjelenítése ebben a csatornában';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Bekapcsol egy hozzájárulási felszólítást, mielőtt belépnél ebbe a csatornába.';

  @override
  String get channelSettingsContentWarningText => 'Egyéni figyelmeztető szöveg';

  @override
  String get channelSettingsContentWarningDefault =>
      'Ez érzékeny tartalmat tartalmaz.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'A(z) \"$manageChannelsPermissionLabel\" engedély szükséges ezen engedélyek szerkesztéséhez.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'A(z) \"$manageRolesPermissionLabel\" engedély szükséges ezen jogosultságok szerkesztéséhez.';
  }

  @override
  String get channelSettingsUnknownRole => 'Ismeretlen szerepkör';

  @override
  String get channelSettingsUnknownUser => 'Ismeretlen felhasználó';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Hozzáférési felülbírálások';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Hozzáférés szerkesztése ehhez: $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Vissza a felülbírálásokhoz';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Alapértelmezett hozzáférés beállítása ehhez a csatornához';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Felülbírálások konfigurálása ehhez a szerepkörhöz';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Tag felülbírálási beállításai';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Engedélyek keresése…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Csatorna hozzáférés frissítve';

  @override
  String get channelSettingsPermissionsTitle => 'Hozzáférések kezelése';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Ez a csatorna szinkronizálva van a szülő kategóriával ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Ez a csatorna nincs szinkronizálva a szülő kategóriával ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Szinkronizálás kategóriával';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'A csatorna szinkronizálva van a szülő kategóriával';

  @override
  String get channelSettingsPermissionsAddOverride => 'Felülbírálás hozzáadása';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Szerepek vagy tagok keresése…';

  @override
  String get channelSettingsPermissionsRolesAndMembers =>
      'Szerepkörök és tagok';

  @override
  String get channelSettingsDeleteInvite => 'Meghívó törlése';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Törli ezt a meghívót? A művelet nem vonható vissza.';

  @override
  String get channelSettingsCopyInviteCode => 'Meghívókód másolása';

  @override
  String get channelSettingsCopyInviteUrl => 'Meghívó URL-jének másolása';

  @override
  String get channelSettingsWebhookCreated => 'Webhook létrehozva';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Nem sikerült létrehozni a webhookot';

  @override
  String get channelSettingsCreateWebhook => 'Webhook létrehozása';

  @override
  String get channelSettingsInvitesDescription =>
      'Kezelje a csatorna meghívási hivatkozásait.';

  @override
  String get channelSettingsInvitesCreate => 'Meghívó létrehozása';

  @override
  String get channelSettingsInvitesEmpty => 'Nincsenek meghívólinkek';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Ennek a csatornának még nincsenek meghívólinkjei. Hozz létre egyet, hogy meghívhass embereket a csatornára.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Hiba történt a csatorna meghívólinkjeinek betöltésekor. Próbálja újra.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Bejövő webhookok kezelése, amelyek üzeneteket tehetnek közzé ezen a csatornán.';

  @override
  String get channelSettingsWebhooksEmpty => 'Nincsenek webhookok';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Ehhez a csatornához nincsenek konfigurálva webhookok. Hozz létre egy webhookot, hogy külső alkalmazások üzeneteket küldhessenek.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Ez a csatorna nem támogatja a webhookokat.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Ehhez a csatornához tartozó webhookok megtekintéséhez és szerkesztéséhez a(z) „$permission” engedélyre van szükséged.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Nem sikerült betölteni a webhookokat';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Hiba történt a csatorna webhookjainak betöltésekor. Próbálja újra.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Létrehozta: $creator ekkor: $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Ismeretlen felhasználó';

  @override
  String get channelSettingsWebhooksAvatar => 'Profilkép';

  @override
  String get channelSettingsWebhooksUploadImage => 'Kép feltöltése';

  @override
  String get channelSettingsWebhooksRemove => 'Eltávolítás';

  @override
  String get channelSettingsWebhooksName => 'Név';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook neve';

  @override
  String get channelSettingsWebhooksChannel => 'Csatorna';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Webhook URL másolása';

  @override
  String get channelSettingsWebhooksDelete => 'Webhook törlése';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Nem sikerült törölni a webhookot';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Töröljem ezt a webhookot? Nem vonható vissza.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Próbálja meg újra egy pillanat múlva.';

  @override
  String get channelMenuOpenChat => 'Csevegés megnyitása';

  @override
  String get channelMenuDuplicateChannel => 'Csatorna duplikálása';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Felnőtt tartalomra vonatkozó megállapodás állapotának visszaállítása';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Törli az üzeneteit ebből a csatornából?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Ez véglegesen törli az összes üzenetet, amit valaha küldtél ebben a csatornában. Ez a művelet nem vonható vissza.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Saját üzeneteim törlése';

  @override
  String get channelMenuDeletedYourMessages => 'Törölted az üzeneteidet';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Nem sikerült törölni az üzeneteket';

  @override
  String get channelDetailsSystemMessage => 'Rendszerüzenet';

  @override
  String get channelDetailsTextChannel => 'Szöveges csatorna';

  @override
  String get channelDetailsVoiceChannel => 'Hangcsatorna';

  @override
  String get channelDetailsCategory => 'Kategória';

  @override
  String get channelDetailsLinkChannel => 'Csatorna linkelése';

  @override
  String get channelDetailsGenericChannel => 'Csatorna';

  @override
  String get channelDetailsMutedConversation => 'Némított beszélgetés';

  @override
  String get channelDetailsUnmutedConversation =>
      'Beszélgetés némításának feloldása';

  @override
  String get channelDetailsMutedChannel => 'Csatorna némítva';

  @override
  String get channelDetailsUnmutedChannel => 'Csatorna némítása megszüntetve';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Értesítési beállítások frissítve';

  @override
  String get channelDetailsTabMembers => 'Tagok';

  @override
  String get channelDetailsTabPins => 'Rögzítettek';

  @override
  String get channelDetailsActionMute => 'Némítás';

  @override
  String get channelDetailsActionUnmute => 'Némítás feloldása';

  @override
  String get channelDetailsActionSearch => 'Keresés';

  @override
  String get channelDetailsActionMore => 'Továbbiak';

  @override
  String get channelDetailsMembersEmptyTitle => 'Nincsenek tagok';

  @override
  String get channelDetailsMembersEmptyBody =>
      'A tagok itt jelennek meg, amint a közösség adatai betöltődtek.';

  @override
  String get memberListPermissionDeniedTitle => 'Nem tekintheted meg a tagokat';

  @override
  String get memberListPermissionDeniedBody =>
      'Nem tekintheted meg a csatorna tagjait ebben a közösségben';

  @override
  String get memberListUnavailableTitle => 'A taglista nem érhető el';

  @override
  String get memberListUnavailableBody =>
      'A taglisták átmenetileg nem érhetők el ebben a közösségben';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'A tűzések nem tölthetők be';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Az \"Üzenetek rögzítése\" engedéllyel rendelkező tagok rögzíthetik az üzeneteket, hogy mindenki láthassa.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Ebben a beszélgetésben üzeneteket tűzhetsz ki, hogy mindenki lássa őket.';

  @override
  String get channelDetailsPinsEndReached => 'Elérted a végét';

  @override
  String get channelHeaderOpenDetails => 'Csatorna részleteinek megnyitása';

  @override
  String get channelHeaderPinnedMessages => 'Rögzített üzenetek';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Közvetlen üzenetek, olvasatlan';

  @override
  String get channelHeaderMemberList => 'Taglista';

  @override
  String get channelHeaderInbox => 'Beérkezett üzenetek';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Értesítési beállítások, némítva';

  @override
  String get channelDetailsSearchTitle => 'Keresés';

  @override
  String get channelDetailsSearchHint => 'Üzenetek keresése';

  @override
  String get channelDetailsSearchFilterFrom => 'Feladó';

  @override
  String get channelDetailsSearchFilterHas => 'Tartalmazza';

  @override
  String get channelDetailsSearchFilterIn => 'Ebben';

  @override
  String get channelDetailsSearchFilterMentions => 'Említések';

  @override
  String get channelDetailsSearchFilterMore => 'Továbbiak';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktív';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count csatorna';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count felhasználó';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Felhasználó';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Szűrés csatorna szerint';

  @override
  String get channelDetailsSearchChannelsHint => 'Csatornák keresése';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Nem található csatorna';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Rögzített';

  @override
  String get channelDetailsSearchPinnedTrue => 'Csak bejelöltek';

  @override
  String get channelDetailsSearchPinnedFalse => 'A rögzítettek kivétele';

  @override
  String get channelDetailsSearchClearFilter => 'Törlés';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Szerző típusa';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Dátum';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Dátummód';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Válassz egy dátumot';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Hivatkozás gazdagép';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'A fájlnév tartalmazza a következőt';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Fájltípus';

  @override
  String get channelDetailsSearchContentPoll => 'Szavazás';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Üzenetek szavazással';

  @override
  String get channelDetailsSearchContentForward => 'Továbbítás';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Továbbított üzenetek';

  @override
  String get channelDetailsSearchFilterSort => 'Rendezés';

  @override
  String get channelHeaderSearchFiltersTitle => 'Szűrők keresése';

  @override
  String get channelHeaderSearchRecentTitle => 'Legutóbbi keresések';

  @override
  String get channelHeaderSearchUsersTitle => 'Felhasználók';

  @override
  String get channelHeaderSearchChannelsTitle => 'Csatornák';

  @override
  String get channelHeaderSearchValuesTitle => 'Értékek';

  @override
  String get channelHeaderSearchDatesTitle => 'Dátumok';

  @override
  String get channelHeaderSearchDefaultBadge => 'Alapértelmezett';

  @override
  String get channelHeaderSearchClearHistory => 'Törlés';

  @override
  String get channelHeaderSearchFilterDescFrom => 'egy felhasználó';

  @override
  String get channelHeaderSearchFilterDescMentions => 'egy felhasználó';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, beágyazás, kép, videó, hang, fájl, matrica, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'dátum vagy dátumtartomány';

  @override
  String get channelHeaderSearchFilterDescOn => 'dátum vagy dátumtartomány';

  @override
  String get channelHeaderSearchFilterDescDuring => 'dátum vagy dátumtartomány';

  @override
  String get channelHeaderSearchFilterDescAfter => 'dátum vagy dátumtartomány';

  @override
  String get channelHeaderSearchFilterDescIn => 'egy csatorna';

  @override
  String get channelHeaderSearchFilterDescPinned => 'igaz vagy hamis';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'felhasználó, bot vagy webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'egy hosztnév, pl. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'a csatolmány fájlnevének része';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'fájlkiterjesztés, pl. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'idő vagy relevancia';

  @override
  String get channelHeaderSearchFilterDescOrder => 'növekvő vagy csökkenő';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString eredmény',
      one: '1 eredmény',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Szűrés felhasználó szerint';

  @override
  String get channelDetailsSearchFilterByContent => 'Szűrés tartalom szerint';

  @override
  String get channelDetailsSearchSortBy => 'Eredmények rendezése';

  @override
  String get channelDetailsSearchIn => 'Keresés itt';

  @override
  String get channelDetailsSearchEmptyTitle => 'Keresés ebben a beszélgetésben';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Írj be szöveget, szerzőt vagy tartalom-szűrőt az üzenetek kereséséhez.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'Az üzenetek indexelése folyamatban van';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Próbáld meg később, amint a keresés befejezi az indexelést ezen a hatókörön.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Nincs találat';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Próbálj más keresési kifejezéseket vagy szűrőket.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

  @override
  String get channelDetailsMemberYou => 'Te';

  @override
  String get channelDetailsSearchUsersHint => 'Felhasználók keresése';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Írj be a tagok kereséséhez';

  @override
  String get channelDetailsSearchUsersEmpty => 'Nem található felhasználó';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Nincsenek elérhető felhasználók';

  @override
  String get channelDetailsDone => 'Kész';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Az alábbiakat tartalmazó üzenetek megjelenítése:';

  @override
  String get channelDetailsRetry => 'Újrapróbálkozás';

  @override
  String get channelDetailsPinnedMessageTitle => 'Rögzített üzenet';

  @override
  String get channelDetailsSearchResultTitle => 'Keresési eredmény';

  @override
  String get channelDetailsJumpToMessage => 'Ugrás az üzenethez';

  @override
  String get channelDetailsUnpinMessage =>
      'Üzenet eltávolítása a tűzött üzenetek közül';

  @override
  String get channelDetailsCopyMessageLink => 'Üzenet hivatkozásának másolása';

  @override
  String get channelDetailsCopyMessageId => 'Üzenetazonosító másolása';

  @override
  String get channelDetailsMessageUnpinned => 'Üzenet rögzítése feloldva';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Jelenlegi közösség';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Jelenlegi DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Minden közösség';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Összes privát üzenet';

  @override
  String get channelDetailsSearchScopeAllDms => 'Összes DM';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Csak privát üzenetek';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Nyitott közvetlen üzenetek';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Minden DM + Közösség';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Nyitott DM-ek + Közösségek';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Csak az aktuális közösségben keress';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Csak az aktuális DM-ben keressen';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Az összes, jelenleg tagja általad elért közösségben';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Csak az összes privát üzenetben, amiben valaha is részt vettél';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Az összes privát beszélgetésben, amiben valaha részt vettél';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Minden megnyitott privát üzenetedben';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Minden megnyitott privát üzenetedben';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Minden DM-ben, ahol valaha voltál + minden Közösségben, ahol jelenleg vagy';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Minden megnyitott privát üzenetben + minden csatlakozott Közösségben';

  @override
  String get channelDetailsSearchSortNewest => 'Legújabbak';

  @override
  String get channelDetailsSearchSortOldest => 'Legrégebbi';

  @override
  String get channelDetailsSearchSortRelevance => 'Legrelevánsabb';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Legutóbbi üzenetek elöl';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Először a legrégebbi üzenetek mutatása';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'A legrelevánsabb üzenetek jelenjenek meg először';

  @override
  String get channelDetailsSearchContentImage => 'Kép feltöltése';

  @override
  String get channelDetailsSearchContentVideo => 'Videó feltöltés';

  @override
  String get channelDetailsSearchContentAudio => 'Hangfeltöltés';

  @override
  String get channelDetailsSearchContentFile => 'Fájlfeltöltés';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed => 'Link előnézet vagy beágyazás';

  @override
  String get channelDetailsSearchContentSticker => 'Matrica';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Csak feltöltött képfájlok';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Csak feltöltött videófájlok';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Csak feltöltött hangfájlok';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Bármely feltöltött melléklet';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL beírva az üzenet szövegébe';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Feloldott előnézetek és gazdag beágyazások, nem feltöltések';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Matrica csatolva az üzenethez';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count típus';
  }

  @override
  String get personalNotesTitle => 'Személyes jegyzetek';

  @override
  String get personalNotesSubtitle =>
      'A saját privát helyed gondolatoknak és emlékeztetőknek';

  @override
  String groupDmWelcome(String displayName) {
    return 'Üdvözöljük itt: $displayName. Hívj meg barátokat, hogy elkezdődjön a társalgás.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Csoport szerkesztése';

  @override
  String get groupDmWelcomeAddFriends => 'Ismerősök hozzáadása a csoporthoz';

  @override
  String get dmGroupInvites => 'Meghívók';

  @override
  String get groupDmEditTitle => 'Csoport szerkesztése';

  @override
  String get groupDmEditDetailsTooltip => 'Csoportadatok szerkesztése';

  @override
  String get groupDmGroupName => 'Csoport neve';

  @override
  String get groupDmMyGroup => 'Saját csoportom';

  @override
  String get groupDmGroupNameMaxLength =>
      'A csoport neve legfeljebb 100 karakterből állhat';

  @override
  String get groupDmGroupIcon => 'Csoport ikonja';

  @override
  String get groupDmUploadIcon => 'Ikon feltöltése';

  @override
  String get groupDmChangeIcon => 'Ikon módosítása';

  @override
  String get groupDmRemoveIcon => 'Ikon eltávolítása';

  @override
  String get groupDmUpdated => 'Csoport frissítve';

  @override
  String get groupDmUpdateFailed =>
      'Nem sikerült frissíteni a csoportot. Próbáld újra.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animált ikonok használata nem támogatott. Használjon statikus képet.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Az animált ikonok nem támogatottak';

  @override
  String get groupDmIconFileTooLargeTitle => 'Az ikonfájl túl nagy';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'A fájl mérete túl nagy. Válassz ennél kisebb fájlt: $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Nem támogatott ikonformátum';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Nem támogatott fájltípus.';

  @override
  String get groupDmCouldntProcessImage => 'Nem sikerült feldolgozni a képet';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Nem sikerült feldolgozni a kivágott képet. Próbálja újra.';

  @override
  String get groupDmInvalidImage => 'Érvénytelen kép';

  @override
  String get groupDmInvalidImageBody =>
      'Ez a kép érvénytelen. Próbálkozzon egy másikkal.';

  @override
  String get groupDmAddFriends => 'Hozzáadás';

  @override
  String get groupDmOrSendInvite => 'vagy küldj meghívót egy barátodnak:';

  @override
  String get groupDmGenerateInviteLink => 'Meghívólink generálása';

  @override
  String get groupDmCreateInvite => 'Létrehozás';

  @override
  String get groupDmInviteExpires24Hours => 'A meghívód 24 óra múlva lejár';

  @override
  String get groupDmAddFriendFailed =>
      'Nem sikerült hozzáadni ezt az ismerőst a csoporthoz. Kérjük, próbáld újra.';

  @override
  String get groupDmAddFailed => 'Nem sikerült hozzáadni a csoporthoz';

  @override
  String get groupDmGroupFull =>
      'Ez a csoport megtelt. Távolíts el valakit, mielőtt további személyeket adnál hozzá.';

  @override
  String get groupDmRateLimited =>
      'Túl gyorsan haladsz. Várj egy pillanatot, és próbáld újra.';

  @override
  String get groupDmCreateInviteFailed =>
      'Nem sikerült meghívólinket létrehozni';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Nem sikerült meghívólinket létrehozni. Kérjük, próbáld újra.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Nem sikerült meghívó linket létrehozni. Kérlek, próbáld újra.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Nincs engedélyed meghívót létrehozni ebben a csatornában.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Ez a közösség elérte a meghívási limitet.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Meghívó létrehozása ideiglenesen nem elérhető ehhez a közösséghez.';

  @override
  String get groupDmCopyInviteFailed =>
      'Nem sikerült kimásolni a meghívólinket';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Csak a csoport tulajdonosa kezelheti a meghívókat.';

  @override
  String get groupDmNoInvitesCreated => 'Még nincsenek meghívók létrehozva';

  @override
  String get groupDmLoadingInvites => 'Meghívók betöltése…';

  @override
  String get groupDmInvitesLoadFailed =>
      'Nem sikerült betölteni a meghívókat. Próbálja újra.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Visszavonja ezt a meghívót? Nem vonható vissza.';

  @override
  String get groupDmInviteRevoked => 'Meghívó visszavonva';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Létrehozta: $name. Lejár: $time.';
  }

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
  String get composerOpenExpressionPicker =>
      'Emoji és médiaválasztó megnyitása';

  @override
  String get composerShowKeyboard => 'Billentyűzet megjelenítése';

  @override
  String get composerCloseAttachmentPanel => 'Mellékletválasztó bezárása';

  @override
  String get chatAttachmentPanelPhotos => 'Képek';

  @override
  String get chatAttachmentPanelFiles => 'Fájlok';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'A fotótár eléréséhez engedély szükséges';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Engedélyezze a fotókönyvtár elérését a legutóbbi fotók és videók böngészéséhez és csatolásához.';

  @override
  String get chatAttachmentLibraryPermissionSettings =>
      'Beállítások megnyitása';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => 'küldés alatt';

  @override
  String get messageAccessibilityFailedSuffix => ', küldés sikertelen';

  @override
  String get messageAccessibilityAttachmentSummary => 'egy melléklet';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count melléklet';
  }

  @override
  String get messageAccessibilityImageSummary => 'egy kép';

  @override
  String get messageAccessibilityVideoSummary => 'egy videó';

  @override
  String get messageAccessibilityAudioSummary => 'egy hangfájl';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'matrica $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'fájl: $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'egy rejtett melléklet';

  @override
  String get messageAccessibilityEmbedSummary => 'beágyazás';

  @override
  String get messageAccessibilityEmptySummary => 'egy üzenet';

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
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Beállítások keresése...';

  @override
  String get userSettingsSearchFieldLabel => 'Beállítások keresése';

  @override
  String get userSettingsSearchClear => 'Keresés törlése';

  @override
  String get userSettingsSearchNoResults => 'Nincsenek beállítások';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Biztonság és bejelentkezés';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Ajándékok';

  @override
  String get giftSettingsClaimAccountTitle => 'Fiók igénylése';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Foglald le a fiókodat a Plutonium ajándékkódok beváltásához vagy kezeléséhez.';

  @override
  String get giftSettingsRedeemTitle => 'Ajándék beváltása';

  @override
  String get giftSettingsRedeemDescription =>
      'Adj meg egy ajándékkódot, hogy Plutoniumot válts be a fiókodban.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Ajándékkód megadása…';

  @override
  String get giftSettingsRedeemButton => 'Beváltás';

  @override
  String get giftSettingsRedeemSuccess =>
      'Ajándék sikeresen beváltva. Jó szórakozást a Plutoniummal!';

  @override
  String get giftSettingsPurchasedTitle => 'Megvásárolt ajándékok';

  @override
  String get giftSettingsPurchasedDescription =>
      'Kezeld a megvásárolt Plutonium ajándékkódjaidat. Oszd meg az ajándék URL-t valakivel, akit szeretsz, vagy váltsd be magadnak!';

  @override
  String get giftSettingsEmptyTitle => 'Még nincsenek ajándékok';

  @override
  String get giftSettingsEmptyDescription =>
      'Vásárolj Plutonium ajándékot a Plutonium fülön, hogy megoszd a barátaiddal.';

  @override
  String get giftSettingsGoToPlutonium => 'Ugrás a Plutoniumra';

  @override
  String get giftSettingsLoadFailedTitle =>
      'Nem sikerült betölteni az ajándéklistát';

  @override
  String get giftSettingsLoadFailedDescription => 'Próbálja újra később.';

  @override
  String get giftSettingsTryAgain => 'Újra';

  @override
  String get giftSettingsGiftUrl => 'Ajándék URL-je';

  @override
  String get giftSettingsCopy => 'Másolás';

  @override
  String get giftSettingsCopied => 'Másolva';

  @override
  String get giftSettingsGiftUrlCopied =>
      'Az ajándék URL-je a vágólapra másolva!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'Nem sikerült kimásolni az ajándék URL-jét';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Megvásárolva: $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Beváltva: $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Beváltotta: $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Ez az ajándék már be lett váltva';

  @override
  String get giftSettingsRedeemForYourself => 'Beváltás magadnak';

  @override
  String get giftSettingsShareWithFriend => 'Megosztás egy baráttal';

  @override
  String get premiumPlutoniumTagline =>
      'Oldj fel magasabb limiteket és exkluzív funkciókat, miközben támogatsz egy független kommunikációs platformot.';

  @override
  String get premiumPurchaseMode => 'Vásárlási mód';

  @override
  String get premiumForMe => 'Nekem';

  @override
  String get premiumAsAGift => 'Ajándékként';

  @override
  String get premiumMonthly => 'Havi';

  @override
  String get premiumYearly => 'Éves';

  @override
  String get premiumPerMonth => 'havonta';

  @override
  String get premiumPerYear => 'évente';

  @override
  String get premiumOneTimePurchase => 'egyszeri vásárlás';

  @override
  String get premiumSave17 => '17% megtakarítás';

  @override
  String get premiumUpgradeNow => 'Frissítés most';

  @override
  String get premiumBuyGift => 'Ajándék vásárlása';

  @override
  String get premiumOneYearGift => '1 éves ajándék';

  @override
  String get premiumOneMonthGift => '1 hónapos ajándék';

  @override
  String get premiumMostPopular => 'Legnépszerűbb';

  @override
  String get premiumScrollPrompt =>
      'Görgess lefelé, hogy megtekintsd a Plutonium összes előnyét';

  @override
  String get premiumFreeVsPlutonium => 'Ingyenes vs. Plutonium';

  @override
  String get premiumFreeColumn => 'Ingyenes';

  @override
  String get premiumGiftSectionTitle => 'Plutonium ajándékozása';

  @override
  String get premiumGiftSectionDescription =>
      'Oszd meg a Plutonium élményt barátaiddal egy ajándék-előfizetés megvásárlásával.';

  @override
  String get premiumGiftBannerOne => 'Új ajándékkód vár rád!';

  @override
  String premiumGiftBannerMany(int count) {
    return '$count új ajándékkód vár rád!';
  }

  @override
  String get premiumViewGifts => 'Ajándékok megtekintése';

  @override
  String get premiumReadyToUpgrade => 'Készen állsz a frissítésre?';

  @override
  String get premiumReadyToBuyGift => 'Készen állsz egy ajándék vásárlására?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Havi $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Éves $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 év $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 hónap $price';
  }

  @override
  String get premiumManageSubscription => 'Előfizetés kezelése';

  @override
  String get premiumRedeemGiftCode => 'Ajándékkód beváltása';

  @override
  String get premiumGiftBadge => 'Ajándék';

  @override
  String get premiumCancelSubscriptionTitle => 'Előfizetés lemondása?';

  @override
  String get premiumCancelSubscriptionBody =>
      'A kedvezményeket a következő megújítási dátumig megtartja, majd 3 nap türelmi idő áll rendelkezésére az újbóli feliratkozáshoz, hogy megőrizze előfizetői előzményeit.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Előfizetés lemondása';

  @override
  String get premiumKeepSubscription => 'Előfizetés megtartása';

  @override
  String get premiumPurchaseHistoryTitle => 'Vásárlási előzmények';

  @override
  String get premiumPurchaseHistoryDescription =>
      'A legutóbbi számláid. Az előfizetésed fizetési módjának módosításához adj hozzá vagy válassz ki egyet a számlázási portálon, és állítsd be alapértelmezettként.';

  @override
  String get premiumManagePaymentMethods => 'Fizetési módok kezelése';

  @override
  String get premiumBillingHistory => 'Számlázási előzmények';

  @override
  String get premiumSelfServeRefundTitle => 'Önkiszolgáló visszatérítés';

  @override
  String get premiumSelfServeRefundButton =>
      'Legutóbbi vásárlás visszatérítése';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'A vásárlással elfogadja a következőket ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'A vásárlással elfogadta a következőket ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' és ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktív: $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Lemondás folyamatban';

  @override
  String premiumCancelsOn(String date) {
    return 'Lemondás: $date. A kedvezmények addig maradnak érvényben.';
  }

  @override
  String get premiumReactivateSubscription => 'Újraaktiválás';

  @override
  String premiumGiftedUntil(String date) {
    return 'Ajándékba kapott, $date-ig. Nem újul meg automatikusan.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Funkció';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'A vásárlással elfogadod a(z) $terms és $privacy feltételeinket.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Önkiszolgáló visszatérítés a fizetéstől számított 3 napon belül, 30 naponta egyszer. Az előfizetés visszatérítése annak lemondását vonja maga után. Az EU/EGT vásárlók lemondanak a 14 napos elállási jogról a fizetéskor, hogy azonnal hozzáférjenek a tartalomhoz. Használja az alkalmazáson belüli visszatérítési gombot a visszaterhelés helyett. A visszaterhelések véglegesen korlátozhatják fiókját. A Stripe biztonságosan kezeli a fizetést. Soha nem látjuk a teljes kártyaszámát.';

  @override
  String get premiumTermsOfService => 'Szolgáltatási feltételek';

  @override
  String get premiumPrivacyPolicy => 'Adatvédelmi irányelvek';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Nem sikerült elindítani a fizetést';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Hiba történt a fizetés elindításakor. Kérjük, próbálja meg újra később.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Jelenleg ajándék-előfizetésed van. Ez nem fog megújulni. További ajándékkódokat válthatsz be a meghosszabbításához. Ismétlődő előfizetéseket az ajándékidőszak lejárta után indíthatsz.';

  @override
  String get premiumPlanUnavailable =>
      'Ez a csomag nem elérhető. Vedd fel a kapcsolatot az ügyfélszolgálattal.';

  @override
  String get premiumCompletePaymentTitle => 'Fizetés befejezése';

  @override
  String get premiumCompletePaymentBody =>
      'Most a rendszer átirányít a Stripe oldalára a fizetés befejezéséhez. Miután befejezted, térj vissza a Fluxerbe.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Fizetési mód kiválasztása';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Fizess automatikus Pix-szel, hogy jóváhagyd az ismétlődő terheléseket közvetlenül a brazil bankszámládról. Vagy válaszd a kártyás fizetést, hogy megadd a hitelkártya adataidat a Stripe következő képernyőjén.';

  @override
  String get premiumUsePix => 'Használj Pixet';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Fizess UPI-vel, hogy RBI-kompatibilis e-felhatalmazást állíts be indiai bankszámládról. Vagy válaszd a kártyás fizetést, és add meg a hitelkártya adataidat a Stripe következő képernyőjén.';

  @override
  String get premiumUseUpi => 'UPI használata';

  @override
  String get premiumUseCard => 'Kártya használata';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Nem sikerült megnyitni a számlázási portált';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Hiba történt a számlázási portál megnyitásakor. Kérjük, próbálja meg újra később.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Már Visionary vagy';

  @override
  String get premiumAlreadyVisionaryBody =>
      'A Visionary már tartalmazza az állandó hozzáférést, így nincs szükség ismétlődő előfizetésre. Továbbra is vásárolhatsz ajándékokat másoknak.';

  @override
  String get premiumExistingSubscriptionTitle => 'Az előfizetés már létezik';

  @override
  String get premiumExistingSubscriptionBody =>
      'Már találtunk egy meglévő Fluxer Plutonium előfizetést ehhez a fiókhoz. Kezeld a biztonságos számlázási portálon a fizetési adatok frissítéséhez vagy az újítási állapot ellenőrzéséhez. Ha most fizettél, várj egy percet, és nyisd meg újra ezt az oldalt.';

  @override
  String get premiumPurchasesDisabledTitle => 'Vásárlások nem elérhetők';

  @override
  String get premiumPurchasesDisabledBody =>
      'A vásárlások le vannak tiltva ehhez a fiókhoz. Ha úgy gondolod, hogy ez hiba, lépj kapcsolatba a support@fluxer.app címmel.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Igényeld a fiókodat a Fluxer Plutonium megvásárlásához.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'A Fluxer Plutonium megvásárlásához először igazolnod kell az e-mail címedet.';

  @override
  String get premiumPerkCustomUsernameTag => 'Egyéni felhasználónév-címke';

  @override
  String get premiumPerkPerCommunityProfiles => 'Közösségenkénti profilok';

  @override
  String get premiumPerkMessageScheduling => 'Üzenet ütemezése';

  @override
  String get premiumPerkProfileBadge => 'Profiljelvény';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Egyéni videóhátterek';

  @override
  String get premiumPerkEntranceSounds => 'Belépési hangok';

  @override
  String get premiumPerkCommunities => 'Közösségek';

  @override
  String get premiumPerkMessageCharacterLimit =>
      'Üzenet karaktereinek korlátja';

  @override
  String get premiumPerkBookmarkedMessages => 'Mentett üzenetek';

  @override
  String get premiumPerkFileUploadSize => 'Fájlfeltöltés mérete';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji és matricacsomagok';

  @override
  String get premiumPerkSavedMedia => 'Mentett média';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Animált emojik használata';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Globális hangulatjel- és matricaelérés';

  @override
  String get premiumPerkVideoQuality => 'Videó minősége';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animált avatárok és profil bannerek';

  @override
  String get premiumPerkEarlyAccess => 'Korai hozzáférés az új funkciókhoz';

  @override
  String get premiumPerkCustomThemes => 'Egyéni témák';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Akár 4K/60fps felbontásig';

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
  String get userSettingsNavChat => 'Üzenetek és média';

  @override
  String get userSettingsNavAudioAndVideo => 'Hang és videó';

  @override
  String get userSettingsNavShortcuts => 'Gyorsbillentyűk';

  @override
  String get audioAndVideoAudioSectionTitle => 'Hang';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Állítsd be a mikrofonodat, hangszóróidat és a hangfeldolgozást.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Videó';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Állítsd be a kamerádat és a képernyőmegosztás minőségét.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Hívás közbeni viselkedés';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Megerősítő üzenetek megjelenítése hang- és videohívások közben.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Bemeneti eszköz';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Kimeneti eszköz';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Alapértelmezet';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Hangszóró használata';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Amikor ki van kapcsolva, akkor a hang a beszédhangszórón vagy a csatlakoztatott fejhallgatón játszódik le.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Bemeneti hangerő';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Kimeneti hangerő';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Hangfeldolgozás';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Fókuszált hang';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Ajánlott. Megtisztítja a mikrofonod hangját a tiszta beszédhanghoz.';

  @override
  String get audioAndVideoDirectInputLabel => 'Közvetlen bemenet';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Módosítás nélkül továbbítja a hangod. Akkor a legjobb, ha külső hangszoftvert használsz.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Egyedi';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Minden beállítást te állítasz be: zajcsökkentés, visszhangkioltás és erősítés.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Zajcsökkentés';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Fejlett';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Szokványos';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Nincs';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Visszhangkioltás';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Erősítés automatikus beállítása';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Kiegyenlíti a mikrofonod hangerejét. Kikapcsolásra kerül, ha a fejlett zajcsökkentés aktív.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mikrofonpróba';

  @override
  String get audioAndVideoMicTestStartLabel => 'Mikrofonpróba indítása';

  @override
  String get audioAndVideoMicTestStopLabel => 'Mikrofonpróba leállítása';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return 'A $productName-nek mikrofon-hozzáférésre van szüksége a bemenet teszteléséhez.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Kamera tükrözése';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kameraminőség';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Képernyőmegosztás minősége';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Képkockasebesség';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return 'Az 1080p 60 FPS beállításhoz $premiumProductName szükséges.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Ez a példány jelenleg legfeljebb 720p 30 FPS-t engedélyez.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return 'A $productName-nek mikrofon-hozzáférésre van szüksége az eszközeid listázásához.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return 'A(z) $productName alkalmazásnak kamera-hozzáférésre van szüksége az eszközök listázásához.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Ne kérdezze, ha elrejtem a kamerámat';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Ne kérdezze, amikor elrejtem a képernyőmegosztásomat';

  @override
  String get userSettingsNavNotifications => 'Értesítések';

  @override
  String get notificationsGeneralSectionTitle => 'Általános';

  @override
  String get notificationsEnableNotificationsLabel =>
      'Értesítések engedélyezése';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Értesítést kapsz, ha üzeneteket fogadsz. Lehet, hogy engedélyezned kell az értesítéseket a(z) $productName számára az eszközöd beállításaiban. A csatornánkénti/közösségenkénti vezérlőkhöz nyisd meg az értesítési beállításokat egy közösség menüjéből.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Asztali értesítések engedélyezése';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Az operációs rendszer értesítési központját használja. A csatornánkénti/közösségenkénti vezérlőkhöz kattintson jobb gombbal egy közösség ikonjára, és nyissa meg az értesítési beállításokat.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Böngészőértesítések engedélyezése';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Értesítést kapsz, ha üzeneteket fogadsz. Lehet, hogy engedélyezned kell az értesítéseket a böngészőbeállításaidban. A csatornánkénti/közösségenkénti vezérléshez kattints jobb gombbal egy közösség ikonjára, és nyisd meg az értesítési beállításokat.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Inaktív push értesítések időtúllépése';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return 'A $productName nem küld értesítéseket a mobil eszközödre, amikor éppen a számítógépednél vagy. Válaszd ki, mennyi idő inaktivitás után szeretnéd újra megkapni az értesítéseket.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute perc';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes perc';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'Említés beállításai';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Említésre vonatkozó válaszbeállítások';

  @override
  String get notificationsMentionNoPreferenceName => 'Nincs preferencia';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Tartsa tiszteletben a küldő szándékát, figyelmeztetés nélkül, amikor be- vagy kikapcsolja az @ említést';

  @override
  String get notificationsMentionPreferMentionName =>
      '@említés előnyben részesítése';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Alapértelmezés szerint válaszol az @említésre, és figyelmezteti a küldőt, ha kikapcsolja azt';

  @override
  String get notificationsMentionPreferNoMentionName => 'Nincs @említés';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Az alapértelmezett válaszok kihagyják az @említést, és figyelmeztetik a küldőt, ha engedélyezi azt';

  @override
  String get notificationsTtsSectionTitle =>
      'Szöveges üzenet-szintézis értesítések';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'TTS felolvasás engedélyezése';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'A /tts felolvassa az üzenetedet. A beállítás kikapcsolásával ezek a parancsok sima szövegként jelennek meg.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Lejátszási sebesség beállítása a következőben ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Kisegítő lehetőségek';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Üzenetek automatikus felolvasása';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'A bejövő tartalmat beszéddé alakítja, függetlenül attól, hogy a /tts paranccsal érkezett-e.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Minden csatorna';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Minden bejövő üzenet felolvasása, függetlenül attól, hogy melyik csatorna van megnyitva.';

  @override
  String get notificationsTtsModeCurrentChannelName =>
      'Csak az aktív csatornán';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Csak az éppen megtekintett csatornát meséli el. A felolvasás követi Önt a csatornák között.';

  @override
  String get notificationsTtsModeNeverName => 'Soha ne automatikusan';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Maradjon csendben, hacsak valaki manuálisan nem futtatja a /tts parancsot.';

  @override
  String get notificationsTtsModeAriaLabel => 'Összes üzenet felolvasása';

  @override
  String get notificationsSoundsSectionTitle => 'Hangok';

  @override
  String get notificationsMasterVolumeLabel => 'Fő hangerő';

  @override
  String get notificationsMasterVolumeDescription =>
      'Beállítja az összes hangeffektus hangerejét. Az egyedi hangeffektusok felülbírálják ezt a beállítást.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Alapértelmezett hangerő visszaállítása';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Összes értesítési hang kikapcsolása';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'A meglévő értesítési hangbeállításaid megmaradnak.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Több hangeffektus megjelenítése';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Kevesebb hangeffektus megjelenítése';

  @override
  String get notificationsPreviewSound => 'Hang előnézete';

  @override
  String get notificationsPerSoundVolumeTitle => 'Hangonkénti hangerő';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Egyedi hangerő beállítása az egyes hangokhoz. Azok a hangok, amelyekhez nincs felülbírálás, az alap hangerőt követik.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktív, egyéni hangbeállítások: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Fő beállítás követése • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'A(z) $label visszaállítása a fő hangerőre';
  }

  @override
  String get notificationsResetAllOverrides =>
      'Összes felülbírálás visszaállítása';

  @override
  String notificationsMuteSound(String label) {
    return 'Némít $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Hangosíts fel $label';
  }

  @override
  String get notificationsSoundMessage => 'Közösségi üzenetek értesítései';

  @override
  String get notificationsSoundDirectMessage =>
      'Közvetlen üzenetek értesítései';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Aktuális csatorna üzenetértesítések';

  @override
  String get notificationsSoundMute => 'Hang némítása';

  @override
  String get notificationsSoundUnmute => 'Némítás feloldása';

  @override
  String get notificationsSoundDeaf => 'Hang némítása';

  @override
  String get notificationsSoundUndeaf => 'Némítás feloldása (hang)';

  @override
  String get notificationsSoundUserJoin =>
      'Felhasználó csatlakozik a csatornához';

  @override
  String get notificationsSoundUserLeave => 'Felhasználó elhagyja a csatornát';

  @override
  String get notificationsSoundUserMove => 'Felhasználó áthelyezte a csatornát';

  @override
  String get notificationsSoundViewerJoin =>
      'Néző csatlakozott az élő közvetítéshez';

  @override
  String get notificationsSoundViewerLeave =>
      'A néző elhagyja az élő közvetítést';

  @override
  String get notificationsSoundVoiceDisconnect => 'Hanghívás megszakadt';

  @override
  String get notificationsSoundIncomingRing => 'Bejövő hívás';

  @override
  String get notificationsSoundCameraOn => 'Kamera bekapcsolva';

  @override
  String get notificationsSoundCameraOff => 'Kamera kikapcsolva';

  @override
  String get notificationsSoundScreenShareStart => 'Képernyőmegosztás indítása';

  @override
  String get notificationsSoundScreenShareStop =>
      'Képernyőmegosztás leállítása';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Nem sikerült frissíteni a push értesítések időtúllépését. Próbáld újra.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Nem sikerült frissíteni az említés beállításait. Próbálja újra.';

  @override
  String get notificationsPermissionDeniedTitle => 'Értesítések letiltva';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Nem sikerült engedélyezni az értesítéseket. Engedélyezze az értesítési hozzáférést a folytatáshoz.';

  @override
  String get userSettingsNavLanguageAndTime => 'Nyelv és idő';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Felület nyelve';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Válaszd ki az alkalmazásban használt nyelvet';

  @override
  String get languageAndTimeOpenLanguageSettings =>
      'Nyelvi beállítások megnyitása';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Időformátum';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Válaszd ki, hogyan jelenjenek meg az időpontok az alkalmazásban';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Időformátum kiválasztása';

  @override
  String get languageAndTimeTimeFormatAuto => 'Automatikus';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 órás';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 órás';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Alkalmazás nyelve: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Rendszernyelv: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Rendszernyelv használata az időformátumhoz';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'A formátum frissítése sikertelen';

  @override
  String get userSettingsNavDefaultApps => 'Alapértelmezett alkalmazások';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Webböngésző';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Válaszd ki, melyik böngésző nyissa meg a hivatkozásokat.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Ha egy webhelyhez telepítettél egy alkalmazást, a hivatkozások először abban az alkalmazásban nyílnak meg.';

  @override
  String get defaultAppsWebBrowserInApp => 'Alkalmazáson belüli böngésző';

  @override
  String get defaultAppsWebBrowserExternal => 'Külső böngésző';

  @override
  String get userSettingsNavAdvanced => 'Speciális';

  @override
  String get advancedPerformanceReportingTitle => 'Teljesítményjelentés';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Segíts a $productName fejlesztésében névtelen hiba- és teljesítményadatok megosztásával.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Küldj hiba- és teljesítményjelentéseket';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Az összes jelentett adat névtelen, és csak a $productName saját felügyeleti szolgáltatásába kerül – nem használunk harmadik féltől származó szolgáltatókat.';
  }

  @override
  String get advancedSettingsConfigure => 'Konfigurálás';

  @override
  String get advancedSettingsCategoryPrivacy => 'Adatvédelem';

  @override
  String get advancedSettingsCategoryAppearance => 'Megjelenés';

  @override
  String get advancedSettingsCategoryAccessibility => 'Kisegítő lehetőségek';

  @override
  String get advancedSettingsCategoryChat => 'Csevegés';

  @override
  String get advancedSettingsCategoryMedia => 'Média';

  @override
  String get advancedSettingsCategoryVoice => 'Hang';

  @override
  String get advancedSettingsCategoryDeveloper => 'Fejlesztő';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Szövegkijelölés engedélyezése';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Lehetővé teszi a szöveg kiválasztását az alkalmazásban.';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Engedélyezze a videókeresés miniatűrjeit';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Miniatűr vagy élő kép a videó lejátszása közben';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Rezgés visszajelzés';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Rezgés visszajelzés koppintásokra és műveletekre. Nem szinkronizálódik az eszközök között.';

  @override
  String get advancedSettingShowNekoLabel => 'Neko megjelenítése';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko macska, amely követi az egérmutatót';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Mutasd a Neko-t a csevegőbeíráskor';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Csobbanás nagyítás animáció';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'A logó kicsinyítése a kezdőképernyőről való kilépéskor';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Billentyűzet-tippek';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Billentyűparancs-segédletek a tooltipokban.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Kedvencek engedélyezése';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'A kedvencek megjelenítése az alkalmazásban';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Csatlakozási viselkedés hangcsatornán';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Megerősítés vagy dupla kattintás a közösségi hangcsatornákhoz való csatlakozáshoz.';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Dupla kattintás szükséges a hangcsatornákhoz való csatlakozáshoz';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Megerősítés hangcsatornákhoz való csatlakozás előtt';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'GIF-ek automatikus küldése kiválasztáskor';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'GIF-ek automatikus küldése a választóból megerősítés nélkül';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'GIF-kedvencek mentése mentett médiaként';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Válaszd ki, hogyan tároljuk a csillagozott GIF-kedvenceket';

  @override
  String get advancedSettingMediaButtonsLabel => 'Médiagombok';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Testre szabhatja, hogy mely gombok és jelzők jelenjenek meg a médiafájlokhoz csatolt képeken és beágyazásokon';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Töltsön fel mellékleteket a küldés előtt';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'A csatolt fájlok feltöltése azonnal elkezdődik, amint azok hozzáadódnak az üzenetbe';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Követési paraméterek eltávolítása az URL-ekből';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automatikusan eltávolítja a követési paramétereket az elküldött üzenetekben lévő URL-ekből';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Minden külső hivatkozás megbízható';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Külső linkre figyelmeztetés kihagyása minden domainhez';

  @override
  String get advancedSettingSearchEnginesLabel => 'Keresőmotorok';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'A kiválasztott szövegből használt keresőmotorok konfigurálása';

  @override
  String get advancedSettingTranslatorsLabel => 'Fordítók';

  @override
  String get advancedSettingTranslatorsDescription =>
      'A kiválasztott szövegből használt fordítói szolgáltatók konfigurálása';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Képek fordított keresése';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Fordított képkereső szolgáltatók';

  @override
  String get advancedSettingMessageActionBarLabel => 'Üzenet műveletsáv';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Azon műveletsáv testreszabása, amely az üzenetek fölé mozgatva jelenik meg';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Kifejezés-automatikus kiegészítés';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Válaszd ki, mi jelenjen meg, amikor beírsz egy kettőspontot az üzenetbeveteli mezőben';

  @override
  String get advancedSettingInputButtonsLabel => 'Üzenetbeviteli gombok';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Válaszd ki, mely gombok jelenjenek meg az üzenetbeviteli mezőben';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Görgetés az aljára üzenetküldéskor';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Válaszd ki, hogy a csevegés hogyan folytatódik az üzenet küldése után';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      '\"Összes megjelölése olvasottként\" megerősítés kihagyása';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Az összes olvasatlan beérkező csatorna azonnali megjelölése olvasottként, megerősítés kérése nélkül';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Némított csatornák elrejtése alapértelmezetten';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Elrejtett csatornák a közösségi oldalsávokból';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'GIF-jelző megjelenítése';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Melléklet lejárati jelzőjének megjelenítése';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Törlés gomb megjelenítése';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'Letöltés gomb megjelenítése';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Kedvenc gomb megjelenítése';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Beágyazások elrejtése gomb megjelenítése';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Üzenetkezelő sáv megjelenítése';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Csak a további gomb megjelenítése';

  @override
  String get advancedSettingShowQuickReactionsLabel =>
      'Gyorsreakciók megjelenítése';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Shift billentyűvel kibontás engedélyezése';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Alapértelmezett emojik megjelenítése a kifejezés-automatikus kiegészítésben';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Egyéni emojik megjelenítése az automatikus kiegészítésben';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Matricák megjelenítése az automatikus kiegészítésben';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Mentett média megjelenítése a kifejezés-automatikus kiegészítésben';

  @override
  String get advancedSettingShowGifsButtonLabel => 'GIF-gomb megjelenítése';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Média gomb megjelenítése';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Matricák gomb megjelenítése';

  @override
  String get advancedSettingShowEmojiButtonLabel =>
      'Hangulatjel gomb megjelenítése';

  @override
  String get advancedSettingShowSendButtonLabel => 'Küldés gomb megjelenítése';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Új eszközre vonatkozó riasztások megjelenítése';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Kérje az új audioeszközöket';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Kapcsolati hangerőszabályzók';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Mutasd az eszközspecifikus hangerőszabályzókat a hangmenükben';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Képernyőmegosztás előnézetének viselkedése';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Előnézet, külön ablakban való megjelenítés és videó miniatűr viselkedése';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Képernyőmegosztás kodek';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Videó kodek képernyőmegosztáshoz';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatikus (ajánlott)';

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
      'A képernyőmegosztás előnézetének szüneteltetése a háttérben';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Streamelőnézetem miniatűrjének elrejtése';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Fejlesztői mód engedélyezése';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Fejlesztői mód engedélyezése';

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
  String get advancedSettingTranslatorGoogle => 'Google Fordító';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Alapértelmezett keresőmotor';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Válaszd ki, melyik keresőmotort használja az alkalmazás alapértelmezés szerint a kijelölt szöveg keresésekor.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Beépített keresőmotorok';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Beépített keresőmotorok engedélyezése vagy letiltása. Az engedélyezett motorok megjelennek az üzenet helyi menüjében, amikor szöveget jelöl ki.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Egyéni keresőmotorok';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Saját keresőmotorok hozzáadása egyéni URL-mintával. Használd a(z) „$query” kifejezést a keresési szöveg helyőrzőjeként.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Keresőmotor hozzáadása';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Engedélyezz legalább egy keresőmotort az alábbiak közül.';

  @override
  String get advancedSettingRemoveSearchEngineLabel =>
      'Keresőmotor eltávolítása';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Alapértelmezett fordító';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Válaszd ki, melyik fordító legyen az alapértelmezett a kijelölt szöveg fordításakor.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Beépített fordítók';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Beépített fordítók engedélyezése vagy letiltása. Az engedélyezett fordítók megjelennek az üzenet helyi menüjében, ha szöveget jelöl ki.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Egyéni fordítók';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Fordíts le saját fordítókat egyéni URL-mintával. Használd a „$query” kifejezést a lefordítandó szöveg helyőrzőjeként.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Fordító hozzáadása';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Engedélyezz legalább egy fordítót az alábbiak közül.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Fordító eltávolítása';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Alapértelmezett fordított képkeresés';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Válaszd ki, melyik fordított képkereső szolgáltatást használja az alkalmazás alapértelmezetten, amikor képet keresel.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Beépített fordított képkeresés';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Beépített fordított képkereső szolgáltatók engedélyezése vagy letiltása. Az engedélyezett szolgáltatók megjelennek a képek, avatárok, bannerek, matricák és hangulatjelek helyi menüjében.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Egyéni fordított képkeresés';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Adjon hozzá saját fordított képkereső szolgáltatókat egyéni URL-mintával. Használja a \'$url\' helyőrzőt a kép URL-jéhez.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Fordított képkeresés hozzáadása';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Engedélyezz legalább egy fordított képkereső szolgáltatót alább.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Fordított képkeresés eltávolítása';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Keresőmotor hozzáadása';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Keresőmotor szerkesztése';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Fordítószolgáltató hozzáadása';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Fordításszolgáltató szerkesztése';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Fordított képkereső hozzáadása';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Fordított képkereső szerkesztése';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Név';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL-minta';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Saját keresőmotor';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Saját fordító';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Saját fordított képkeresés';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Használd a(z) „$query” kifejezést, ahová a keresési szöveget be kell illeszteni.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Használd a(z) „$query” kifejezést, ahol a lefordítandó szövegnek kell megjelennie.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Használd a(z) \'$url\' kifejezést, ahová a kép URL-jét be kell illeszteni.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired =>
      'Név megadása kötelező.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'URL-minta megadása kötelező.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'A URL mintának tartalmaznia kell a(z) „$query” helyőrzőt.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'A URL mintának tartalmaznia kell a(z) „$url” helyőrzőt.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Az URL-mintának érvényes URL-nek kell lennie.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Hozzáadás';

  @override
  String get advancedSettingEditSearchProviderAction => 'Szerkesztés';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Eltávolítás';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Biztosan el szeretnéd távolítani a(z) $engineName keresőmotort?';
  }

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
  String get userSettingsJoinFluxerLabs => 'Csatlakozz a Fluxer Labshoz';

  @override
  String get userSettingsNavAppLicenses => 'Alkalmazáslicencek';

  @override
  String get userSettingsAppLicensesDescription =>
      'A szoftver nyílt forráskódú komponenseket használ. Ez az alkalmazás Flutterrel készült.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Nem sikerült betölteni az alkalmazáslicenceket.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenc',
      one: '1 licenc',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Kijelentkezés';

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
  String get savedMessagesEmptyTitle => 'Nincsenek könyvjelzők';

  @override
  String get savedMessagesEmptyBody =>
      'Üzenetek könyvjelzőzése későbbi megtekintéshez.';

  @override
  String get savedMessagesEndBody => 'Itt nincs több látnivaló.';

  @override
  String get savedMessagesRemoveTooltip => 'Könyvjelző eltávolítása';

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
  String get uiSearch => 'Keresés';

  @override
  String get uiStartCall => 'Hívás indítása';

  @override
  String get uiStartVideoCall => 'Videóhívás indítása';

  @override
  String get uiPlay => 'Lejátszás';

  @override
  String get uiPause => 'Szüneteltetés';

  @override
  String get uiDownload => 'Letöltés';

  @override
  String get uiMoreActions => 'További műveletek';

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
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Ez értesíteni fogja a(z) $count tagokat a(z) $roleName szerepkörrel. Folytatja?';
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
  String get guildNavbarGuildSelected => 'Kiválasztva';

  @override
  String get guildNavbarGuildUnread => 'olvasatlan';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count említés',
      one: '1 említés',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'némítva';

  @override
  String get authShowPassword => 'Jelszó megjelenítése';

  @override
  String get authHidePassword => 'Jelszó elrejtése';

  @override
  String get chatLoadingMessages => 'Üzenetek betöltése';

  @override
  String get friendsMessageFriend => 'Üzenet küldése';

  @override
  String get friendsFriendActions => 'Barát műveletek';

  @override
  String get friendsAcceptRequest => 'Ismerős felkérés elfogadása';

  @override
  String get friendsDeclineRequest => 'Meghívás elutasítása';

  @override
  String get friendsCancelRequest => 'Barátkérelem visszavonása';

  @override
  String get friendsOpenInbox => 'Beérkezett üzenetek';

  @override
  String get profileRemoveFriend => 'Eltávolítás az ismerősök közül';

  @override
  String get profileUnblockUser => 'Felhasználó feloldása';

  @override
  String get profileAcceptFriendRequest => 'Ismerős felkérés elfogadása';

  @override
  String get profileCancelFriendRequest => 'Barátkérelem visszavonása';

  @override
  String get profileSendFriendRequest => 'Ismerős hozzáadása';

  @override
  String get accountOverflowMenu => 'Fiókbeállítások';

  @override
  String get navHome => 'Kezdőlap';

  @override
  String get navNotifications => 'Értesítések';

  @override
  String get navYou => 'Te';

  @override
  String get guildFolderSettingsTitle => 'Mappa beállításai';

  @override
  String get guildFolderNameLabel => 'Mappanév';

  @override
  String get guildFolderColorLabel => 'Mappa színe';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Ikon megjelenítése összecsukott állapotban';

  @override
  String get guildFolderIconLabel => 'Mappa ikonja';

  @override
  String get guildFolderDelete => 'Mappa törlése';

  @override
  String get guildFolderIconFolder => 'Mappa';

  @override
  String get guildFolderIconStar => 'Csillagozás';

  @override
  String get guildFolderIconHeart => 'Szív';

  @override
  String get guildFolderIconBookmark => 'Könyvjelző';

  @override
  String get guildFolderIconGameController => 'Játékvezérlő';

  @override
  String get guildFolderIconShield => 'Pajzs';

  @override
  String get guildFolderIconMusicNote => 'Zenei hangjegy';

  @override
  String get guildFolderMarkAsRead => 'Mappa megjelölése olvasottként';

  @override
  String get guildBulkMuteCommunities => 'Közösségek némítása';

  @override
  String get guildBulkUnmuteCommunities => 'Közösségek némításának feloldása';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Közösségi értesítési beállítások';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Közösségi adatvédelmi beállítások';

  @override
  String get guildBulkAllowEveryoneAndHere =>
      'Engedélyezze az @everyone és az @here használatát';

  @override
  String get guildBulkAllowRoleMentions => 'Szerepkör-említések engedélyezése';

  @override
  String get guildBulkEnableMobilePush => 'Mobilértesítések engedélyezése';

  @override
  String get guildBulkDisableMobilePush => 'Mobilértesítések kikapcsolása';

  @override
  String get guildBulkAllowDirectMessages => 'Közvetlen üzenetek engedélyezése';

  @override
  String get guildBulkBlockDirectMessages => 'Közvetlen üzenetek blokkolása';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Botok közvetlen üzeneteinek engedélyezése';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Botok közvetlen üzeneteinek blokkolása';

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
  String get guildNavbarChannelTypeSelection => 'Csatornatípus kiválasztása';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Csak a $productName személyzetének hozzáférhető';
  }

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
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Matricák';

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
  String get guildMenuSettingsInviteLinks => 'Meghívók';

  @override
  String get guildMenuSettingsBans => 'Tiltások';

  @override
  String get guildMenuSettingsChannels => 'Csatornák';

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
  String get guildSettingsRolesNewRole => 'Új szerepkör';

  @override
  String get guildSettingsRolesDeleteRole => 'Szerepkör törlése';

  @override
  String get guildSettingsRolesBackToRoles => 'Vissza a szerepkörökhöz';

  @override
  String get guildSettingsBackToSettings => 'Vissza a beállításokhoz';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Szerkesztés: „$name”';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Szerepkör-beállítások és engedélyek konfigurálása';

  @override
  String get guildSettingsRolesDisplaySection => 'Megjelenítés';

  @override
  String get guildSettingsRolesRoleName => 'Szerepkör neve';

  @override
  String get guildSettingsRolesRoleColor => 'Szerepkör színe';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Írj be egy színt (hex, rgb(), hsl() vagy név) vagy használd a színválasztót.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Szerepkör megjelenítése külön';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Felsorolja az ezzel a szerepkörrel rendelkező tagokat a saját szakaszukban a taglistán.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Említések engedélyezése ehhez a szerepkörhöz';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'A(z) „$permission” engedéllyel rendelkező tagok mindig megemlíthetnek szerepköröket, függetlenül ettől a beállítástól.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Ezzel a gombbal gyorsan törölheted az összes engedélyt.';

  @override
  String get guildSettingsRolesClearPermissions => 'Engedélyek törlése';

  @override
  String get guildSettingsRolesPermissionsSection => 'Engedélyek';

  @override
  String get guildSettingsRolesSearchPermissions => 'Engedélyek keresése';

  @override
  String get guildSettingsRolesDenseLayout => 'Sűrű elrendezés';

  @override
  String get guildSettingsRolesComfyLayout => 'Kényelmes elrendezés';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Váltás sűrű elrendezésre';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Átváltás kényelmes elrendezésre';

  @override
  String get guildSettingsRolesSingleColumn => 'Egy oszlop';

  @override
  String get guildSettingsRolesTwoColumns => 'Két oszlop';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Váltás egyoszlopos nézetre';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Váltás két oszlopra';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Nincsenek engedélyek';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'Egyéni kiemelési sorrend';

  @override
  String get guildSettingsRolesHoistOrder => 'Kiemelési sorrend';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Alaphelyzetbe állítás';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Húzd a rangokat a sorrendjük testreszabásához a taglistában.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Nincsenek kiemelt szerepek. Ahhoz, hogy itt lásd, engedélyezd a \"Szerep megjelenítése külön\" opciót egy szerepnél.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Ezt a szerepkört nem szerkesztheted, mert ez a legmagasabb szerepköröd, vagy nálad magasabb rangú';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Ehhez a engedélyek szerkesztéséhez a(z) „$permission” engedélyre van szükséged';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Nem szerkeszthetsz olyan rangot, amely a legmagasabb rangoddal azonos vagy annál magasabb';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Nem adhatsz olyan engedélyt, amivel te sem rendelkezel';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Nem távolíthatod el ezt az engedélyt, mert akkor magadtól is elvennéd';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Szerepkörök sikeresen frissítve';

  @override
  String get guildSettingsRolesCreatedSuccess =>
      'Szerepkör sikeresen létrehozva';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Szerepkör sikeresen törölve';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'A kiemelési sorrend visszaállítva az alapértelmezettre';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Szerepkör neve kötelező';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Adj nevet a szerepkörnek mentés előtt.';

  @override
  String get guildSettingsRolesCreateFailedTitle =>
      'Nem sikerült létrehozni a szerepkört';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Nem sikerült frissíteni a szerepköröket';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Nem sikerült törölni a szerepkört';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '„$name” nem törölhető. Próbáld újra.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Nem sikerült visszaállítani az emelési sorrendet';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Próbálja meg újra egy pillanat múlva.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Biztosan törölni szeretnéd a(z) $name szerepkört? Az ezzel a szerepkörrel rendelkező tagok elveszítik azt.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Egész közösség';

  @override
  String get permissionCategoryMessagesMedia => 'Üzenetek és média';

  @override
  String get permissionCategoryModeration => 'Moderálás';

  @override
  String get permissionCategoryChannelAccess => 'Csatorna-hozzáférés';

  @override
  String get permissionCategoryChannelManagement => 'Csatornakezelés';

  @override
  String get permissionCategoryAudioVideo => 'Hang és videó';

  @override
  String get permissionUnknown => 'Ismeretlen engedély';

  @override
  String get permissionAdministrator => 'Rendszergazda';

  @override
  String get permissionAdministratorDescription =>
      'Minden engedélyt megad, és megkerüli a csatornakorlátozásokat. Rendkívül érzékeny.';

  @override
  String get permissionViewActivityLog => 'Tevékenységi napló megtekintése';

  @override
  String get permissionViewActivityLogDescription =>
      'Olvassa el a közösség változási és moderálási naplóját.';

  @override
  String get permissionManageCommunity => 'Közösség kezelése';

  @override
  String get permissionManageCommunityDescription =>
      'Globális beállítások szerkesztése, például név, leírás és ikon.';

  @override
  String get permissionManageRoles => 'Szerepkörök kezelése';

  @override
  String get permissionManageRolesDescription =>
      'Szerepkörök létrehozása, szerkesztése vagy törlése a legmagasabb szerepköröd alatt. Lehetővé teszi a csatornaengedély-felülírások szerkesztését is.';

  @override
  String get permissionManageChannels => 'Csatornák kezelése';

  @override
  String get permissionManageChannel => 'Csatorna kezelése';

  @override
  String get permissionManageChannelDescription =>
      'Átnevezheted és szerkesztheted a csatorna beállításait.';

  @override
  String get permissionManagePermissions => 'Engedélyek kezelése';

  @override
  String get permissionManagePermissionsDescription =>
      'A szerepkörök és tagok felülírásainak szerkesztése ebben a csatornában.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Webhooks létrehozása, szerkesztése vagy törlése ehhez a csatornához.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Tekintse meg a csatorna taglistáját.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Kezelje a csatorna meghívási hivatkozásait.';

  @override
  String get permissionOverwriteDeny => 'Elutasítás';

  @override
  String get permissionOverwriteInherit => 'Semleges (örökölt)';

  @override
  String get permissionOverwriteAllow => 'Engedélyezés';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Ezekkel a gombokkal gyorsan beállíthatod az összes engedélyt.';

  @override
  String get permissionManageChannelsDescription =>
      'Csatornák és kategóriák létrehozása, szerkesztése vagy törlése.';

  @override
  String get permissionKickMembers => 'Tagok eltávolítása';

  @override
  String get permissionBanMembers => 'Tagok kitiltása';

  @override
  String get permissionCreateInviteLinks => 'Meghívólinkek létrehozása';

  @override
  String get permissionChangeOwnNickname => 'Saját becenév módosítása';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Szerkeszd a saját beceneved.';

  @override
  String get permissionManageNicknames => 'Becenevek kezelése';

  @override
  String get permissionManageNicknamesDescription =>
      'Más tagok becenevének módosítása.';

  @override
  String get permissionCreateEmojiStickers => 'Emojik és matricák létrehozása';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Új emojik és matricák feltöltése, valamint saját alkotások kezelése.';

  @override
  String get permissionManageEmojiStickers =>
      'Hangulatjelek és matricák kezelése';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Más tagok által létrehozott hangulatjelek és matricák szerkesztése vagy törlése.';

  @override
  String get permissionManageWebhooks => 'Webhookok kezelése';

  @override
  String get permissionManageWebhooksDescription =>
      'Webhookok létrehozása, szerkesztése vagy törlése.';

  @override
  String get permissionSendMessages => 'Üzenetek küldése';

  @override
  String get permissionSendTtsMessages => 'TTS-üzenetek küldése';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Szöveges üzenetek küldése szövegből beszéddé alakítással.';

  @override
  String get permissionManageMessages => 'Üzenetek kezelése';

  @override
  String get permissionManageMessagesDescription =>
      'Más tagok üzeneteinek törlése. A rögzítés külön szabályozható.';

  @override
  String get permissionPinMessages => 'Üzenetek rögzítése';

  @override
  String get permissionEmbedLinks => 'Hivatkozások beágyazása';

  @override
  String get permissionAttachFiles => 'Fájlok csatolása';

  @override
  String get permissionMentionEveryone =>
      'Használj @everyone/@here és @szerepkör';

  @override
  String get permissionMentionEveryoneDescription =>
      'Mindenki vagy bármelyik szerepkör megemlítése (akkor is, ha a szerepkör nincs beállítva megemlíthetőként).';

  @override
  String get permissionUseExternalEmoji => 'Külső emojik használata';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Hangulatjelek használata más közösségekből.';

  @override
  String get permissionUseExternalStickers => 'Külső matricák használata';

  @override
  String get permissionAddReactions => 'Reakciók hozzáadása';

  @override
  String get permissionAddReactionsDescription =>
      'Új reakciók hozzáadása az üzenetekhez.';

  @override
  String get permissionBypassSlowmode => 'Lassú mód megkerülése';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Csatornánkénti üzenetküldési korlátok figyelmen kívül hagyása.';

  @override
  String get permissionTimeOutMembers => 'Tagok időleges korlátozása';

  @override
  String get permissionTimeOutMembersDescription =>
      'Megakadályozza, hogy a tagok üzeneteket küldjenek, reakciókat használjanak és hanghívásokhoz csatlakozzanak egy bizonyos ideig.';

  @override
  String get permissionViewChannel => 'Csatorna megtekintése';

  @override
  String get permissionViewChannelMembers => 'Csatornatagok megtekintése';

  @override
  String get permissionViewChannelMembersDescription =>
      'Tekintse meg a közösség csatornáinak taglistáját.';

  @override
  String get permissionConnect => 'Csatlakozás';

  @override
  String get permissionSpeak => 'Beszéd';

  @override
  String get permissionStreamVideo => 'Videó streamelése';

  @override
  String get permissionUseVoiceActivity => 'Hangaktivitás használata';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Ezen engedély nélkül az adóvevő funkció használata kötelező.';

  @override
  String get permissionPrioritySpeaker => 'Prioritásos beszélő';

  @override
  String get permissionMuteMembers => 'Tagok némítása';

  @override
  String get permissionDeafenMembers => 'Tagok némítása';

  @override
  String get permissionMoveMembers => 'Tagok áthelyezése';

  @override
  String get permissionMoveMembersDescription =>
      'Húzd át a tagokat az általuk elérhető csatornák között.';

  @override
  String get permissionSetVoiceRegion => 'Hangrégió beállítása';

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
      'Az összes közösségedben konfigurált webhook megtekintése és kezelése.';

  @override
  String get guildSettingsWebhooksEmpty => 'Nincsenek webhookok';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Ebben a közösségben még nincsenek webhookok. Hozzon létre egyet a(z) $channelSettingsPath oldalon.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'A közösség webhookjainak megtekintéséhez és szerkesztéséhez a(z) \"$permission\" engedélyre van szükséged.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle =>
      'Nem sikerült betölteni a webhookokat';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Hiba történt a webhookok betöltésekor. Próbálja újra.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhookok frissítve';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Nem sikerült frissíteni a webhookokat';

  @override
  String get guildSettingsUnknownChannel => 'Ismeretlen csatorna';

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
      'Tedd közzé a közösségedet a Felfedezésben, hogy mások is megtalálhassák és csatlakozhassanak hozzá.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'Nincs elég tag';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'A közösségednek legalább $count taggal kell rendelkeznie, mielőtt felkerülhetne a Felfedezésbe.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Állapot:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Függőben';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Jóváhagyva';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Elutasítva';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Eltávolítva';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Ok: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'A közösséged szerepel a Felfedezésben. Az adatait alább frissítheted, vagy visszavonhatod a listázást.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Jelentkezésed felülvizsgálat alatt van. Továbbra is frissítheted a hirdetés részleteit, vagy visszavonhatod a jelentkezést.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategória';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Válaszd ki a kategóriát, amely a legjobban leírja a közösségedet. Ezt bármikor megváltoztathatod.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Elsődleges nyelv';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'A közösségedben leggyakrabban használt nyelv. Ezzel szűrheted a Felfedezés találatait.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Leírás';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Írd le, miről szól a közösséged';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Leírás megadása kötelező.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'A leírásnak legalább $minLength karakter hosszúnak kell lennie.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'A leírás legfeljebb $maxLength karakter hosszú lehet.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Egyéni címkék';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Legfeljebb $maxTags címke segít a közösséged megtalálásában. Ezek a Felfedezés keresőben jelennek meg.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Adj meg egy címkét, majd nyomd meg az Entert';

  @override
  String get guildSettingsDiscoveryAddTag => 'Hozzáadás';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return '$tag címke eltávolítása';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Nem sikerült hozzáadni a címkét';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'A címkéknek 2–$maxLength karakter hosszúságúaknak és alfanumerikusaknak kell lenniük.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Legfeljebb $maxTags címkét adhatsz hozzá.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Alkalmaz';

  @override
  String get guildSettingsDiscoverySave => 'Mentés';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Visszavonás';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Felfedezési kérelem elküldve';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Felfedezési lista frissítve';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Felfedezési kérelem visszavonva';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Nem sikerült visszavonni a jelentkezést';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Próbálja meg újra egy pillanat múlva.';

  @override
  String get guildSettingsMembersDescription =>
      'Keresés és kezelés a szer tagjai között.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Keresés felhasználónév vagy azonosító alapján';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count tag';
  }

  @override
  String get guildMembersRecentTitle => 'Legutóbbi tagok';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return '$displayedCount a(z) $totalCount tagból';
  }

  @override
  String get guildMembersSort => 'Rendezés';

  @override
  String get guildSettingsMembersSortNewest => 'Legújabb elöl';

  @override
  String get guildMembersSortOldest => 'Először a legrégebbiek';

  @override
  String get guildMembersColumnName => 'Név';

  @override
  String get guildMembersColumnMemberSince => 'Tag ekkortól';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Csatlakozott a $productName szolgáltatáshoz';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Csatlakozási mód';

  @override
  String get guildMembersColumnRoles => 'Szerepkörök';

  @override
  String get guildMembersColumnActions => 'Műveletek';

  @override
  String get guildMembersFilterMemberSince => 'Szűrés tagság kezdete szerint';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Szűrés fióklétrehozás dátuma szerint';

  @override
  String get guildMembersFilterJoinMethod => 'Szűrés csatlakozási mód szerint';

  @override
  String get guildMembersFilterRoles => 'Szűrés szerepkörök szerint';

  @override
  String get guildMembersFilterAll => 'Összes';

  @override
  String get guildMembersFilterPast1Hour => 'Elmúlt 1 óra';

  @override
  String get guildMembersFilterPast24Hours => 'Elmúlt 24 óra';

  @override
  String get guildMembersFilterPast7Days => 'Elmúlt 7 nap';

  @override
  String get guildMembersFilterPast2Weeks => 'Elmúlt 2 hét';

  @override
  String get guildMembersFilterPast3Weeks => 'Elmúlt 3 hét';

  @override
  String get guildMembersFilterPast4Weeks => 'Elmúlt 4 hét';

  @override
  String get guildMembersFilterPast3Months => 'Elmúlt 3 hónap';

  @override
  String get guildMembersFilterCustomRange => 'Egyéni tartomány...';

  @override
  String get guildMembersDateRangeTitle => 'Egyéni dátumtartomány';

  @override
  String get guildMembersDateAfter => 'Dátum után';

  @override
  String get guildMembersDateBefore => 'Dátum előtt';

  @override
  String get guildMembersClearAll => 'Összes törlése';

  @override
  String get guildMembersRowsPerPage => 'Sorok száma oldalanként';

  @override
  String get guildMembersEmptySearch => 'Senki sem felel meg a keresésnek.';

  @override
  String get guildMembersLoadError =>
      'Hiba történt a tagok betöltésekor. Próbáld újra később.';

  @override
  String get guildMembersIndexing => 'Tagok indexelése…';

  @override
  String get guildMembersGoToPage => 'Ugrás az oldalra';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Ugrás a(z) $page oldalra';
  }

  @override
  String get guildMembersJumpToPage => 'Ugrás az oldalra';

  @override
  String get guildMembersJoinSourceCreator => 'Közösség létrehozója';

  @override
  String get guildMembersJoinSourceInvite => 'Meghívás';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Meghívás ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Meghívta: $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Egyedi URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Bot meghívása';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Platformadmin';

  @override
  String get guildMembersJoinSourceDiscovery => 'Felfedezés';

  @override
  String get guildMembersJoinMethodUnknown => 'Ismeretlen';

  @override
  String get guildMembersCommunityOwner => 'Közösség tulajdonosa';

  @override
  String get guildMembersViewAllRoles => 'Összes szerepkör megtekintése';

  @override
  String get guildMembersJoinedJustNow => 'Most';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perce',
      one: '1 perce',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count órája',
      one: '1 órája',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count napja',
      one: '1 napja',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Tagok';

  @override
  String get guildMembersChannelListSelected => 'Tagok, kiválasztva';

  @override
  String get guildSettingsInvitesTitle => 'Meghívók';

  @override
  String get guildSettingsInvitesDescription =>
      'Tekintse meg a közösség összes meghívóját. Új meghívó létrehozásához lépjen egy csatornára, és használja a meghívás gombot.';

  @override
  String get guildSettingsInvitesEmpty => 'Nincsenek meghívólinkek';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Ennek a közösségnek még nincsenek meghívólinkjei. Menj egy csatornára, és hozz létre egy meghívót, hogy meghívhass embereket.';

  @override
  String get guildSettingsInvitesLoadFailedTitle =>
      'Meghívók betöltése sikertelen';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Hiba történt a meghívók betöltésekor. Próbálja újra.';

  @override
  String get guildSettingsInvitesTryAgain => 'Újra';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Létrehozás dátumának megjelenítése a lejárati dátum helyett';

  @override
  String get guildSettingsInvitesPauseInvites => 'Meghívók szüneteltetése';

  @override
  String get guildSettingsInvitesEnableInvites => 'Meghívók engedélyezése';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Meghívók szüneteltetése ebben a közösségben';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Meghívók engedélyezése ehhez a közösséghez';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Szünetelteted a meghívásokat? Az új felhasználók nem tudnak csatlakozni meghívólinken keresztül, amíg újra nem engedélyezed. A meglévő tagokat ez nem érinti.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Meghívók engedélyezése? A felhasználók ismét meghívólinkeken keresztül csatlakozhatnak ehhez a közösséghez.';

  @override
  String get guildSettingsInvitesPause => 'Szüneteltetés';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'A meghívók szünetelnek ebben a közösségben.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'A meghívók szünetelnek, mert a(z) $productName potenciális támadást észlelt. Az új felhasználók jelenleg nem csatlakozhatnak.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Meghívó:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Csatorna:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kód:';

  @override
  String get guildSettingsInvitesLabelUses => 'Használat:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Létrehozva:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Lejár:';

  @override
  String get guildSettingsInvitesUnknown => 'Ismeretlen';

  @override
  String get guildSettingsInvitesNoCategory => 'Nincs kategória';

  @override
  String get guildSettingsInvitesExpired => 'Lejárt';

  @override
  String get guildSettingsInvitesNever => 'Soha';

  @override
  String get guildSettingsInvitesCopyLink => 'Meghívólink másolása';

  @override
  String get guildSettingsInvitesRevoke => 'Meghívó visszavonása';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Nem sikerült visszavonni a meghívót';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Lehet, hogy a link még működik. Próbáld meg újra egy pillanat múlva.';

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
  String get guildSettingsEmojiSlotsTitle => 'Emojihelyek';

  @override
  String get guildSettingsEmojiDropZone => 'Húzd ide az emojifájlokat';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Nem sikerült betölteni az emojikat. Próbálja meg később.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nincs a keresésnek megfelelő hangulatjel.';

  @override
  String get guildSettingsEmojiNoSlots => 'Nincs elérhető hangulatjel-hely';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Elérted a maximális hangulatjel-számot. Törölj néhány meglévő hangulatjelet, hogy helyet csinálj.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Az emojiknak legalább 2 karakterből kell állniuk, és betűket, számokat és alulvonásokat tartalmazhatnak. Az emojik mérete legfeljebb $maxSize lehet. A statikus képek automatikusan átméretezésre kerülnek 128x128 pixeles méretre és tömörítésre kerülnek. Az animált emojiknak és SVG-knek már meg kell felelniük a korlátozásnak.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Emojik feltöltése';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# hangulatjel',
      one: '# hangulatjel',
    );
    return 'Feltöltés: $_temp0. Ez eltarthat egy ideig.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Nem sikerült feltölteni az emojikat. Próbáld újra.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Néhány hangulatjel nem adható hozzá';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Nézd át ezeket a fájlokat, és próbáld újra kisebb vagy egyszerűbb képekkel.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Emoji átnevezése';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 karakter, betűk, számok, aláhúzások.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Név';

  @override
  String get guildSettingsEmojiColumnUploader => 'Feltöltötte';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Ismeretlen';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Hangulatjel törlése';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Törlés: $name?: Ez nem vonható vissza.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Eltávolítás a tárhelyről és a CDN-ről';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Az emoji nevének legalább 2 karakter hosszúnak kell lennie';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Az emoji neve legfeljebb 32 karakter hosszú lehet';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Érvénytelen hangulatjelnév';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Nem sikerült átnevezni ezt az emojit';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'A név visszaállt az eredetire. Kérjük, próbálja meg újra egy pillanat múlva.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Ez az emoji már nem létezik';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Lehet, hogy törölték. A név visszaállt az eredetire.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Nem nevezheted át ezt az emojit';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Nincs jogosultságod az emoji átnevezéséhez. A név visszaállt az eredetire.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Túl gyors vagy';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Kérjük, várjon egy pillanatot, majd próbálja meg újra az átnevezést.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Nem sikerült törölni ezt az emojit';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Nem törölheted ezt az emojit';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Engedélyezd másoknak az emojid klónozását';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Ha engedélyezve van, más közösségek tagjai is használhatják az alkalmazáson belüli egykattintásos \"Klónozás\" parancsikont az egyéni emojijaidon. Ez nem akadályozza meg őket abban, hogy elmentsék a képet, és maguk töltsék fel.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Engedélyezi, hogy mások klónozzák a matricáit';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Ha engedélyezve van, más közösségek tagjai is használhatják az alkalmazáson belüli egykattintásos \"Klónozás\" parancsikont az egyéni matricáidon. Ez nem akadályozza meg őket abban, hogy elmentsék a képet, és maguk töltsék fel.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Csak a(z) \"$permission\" engedéllyel rendelkező tagok módosíthatják ezt.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Nem sikerült frissíteni az emoji klónozást';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Nem sikerült frissíteni a matrica klónozását';

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
  String get guildSettingsStickerSlotsTitle => 'Matricahelyek';

  @override
  String get guildSettingsStickerUploadTitle => 'Matrica feltöltése';

  @override
  String get guildSettingsStickerDropZone =>
      'Húzz ide egy matricafájlt (egyet egyszerre)';

  @override
  String get guildSettingsStickerDensity => 'Matricasűrűség';

  @override
  String get guildSettingsStickerDensityCozy => 'Hangulatos';

  @override
  String get guildSettingsStickerDensityCompact => 'Kompakt';

  @override
  String get guildSettingsStickersLoadFailedTitle =>
      'A matricák betöltése sikertelen';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Hiba történt a matricák betöltésekor. Próbálja újra.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nincsenek a keresésnek megfelelő matricák.';

  @override
  String get guildSettingsStickersEmptySearch => 'Nincsenek matricák';

  @override
  String get guildSettingsStickerNoSlots => 'Nincsenek elérhető matricafiókok';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Elérte a matricák maximális számát. Töröljön néhány meglévő matricát, hogy helyet szabadítson fel.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'A matricákat 320x320 pixeles méretben mentjük, és legfeljebb $maxSize méretűek lehetnek. A statikus képek automatikusan átméretezésre kerülnek és tömörítésre kerülnek. Az animált matricáknak és SVG-knek már meg kell felelniük a korlátozásnak.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Nem támogatott matrica fájl';

  @override
  String get guildSettingsStickerAddTitle => 'Matrica hozzáadása';

  @override
  String get guildSettingsStickerEditTitle => 'Matrica szerkesztése';

  @override
  String get guildSettingsStickerNameLabel => 'Név';

  @override
  String get guildSettingsStickerNameHint => 'Szuper matricám';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Leírás';

  @override
  String get guildSettingsStickerDescriptionHint => 'Matrica leírása';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Címkék ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Címke hozzáadása';

  @override
  String get guildSettingsStickerTagAdd => 'Hozzáadás';

  @override
  String get guildSettingsStickerNameRequired => 'Név megadása kötelező';

  @override
  String get guildSettingsStickerNameTooShort =>
      'A névnek legalább 2 karakter hosszúnak kell lennie';

  @override
  String get guildSettingsStickerNameTooLong =>
      'A név legfeljebb 30 karakterből állhat';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'A leírás legfeljebb 500 karakter lehet';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Nem sikerült létrehozni a matricát';

  @override
  String get guildSettingsStickerTooLargeTitle => 'A matrica túl nagy';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'A matrica nem tömöríthető eléggé';

  @override
  String get guildSettingsStickerDeleteTitle => 'Matrica törlése';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Törlés „$name”? Nem vonható vissza.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Matrica törlése a tárhelyről és a CDN-ről';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Nem sikerült törölni ezt a matricát';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Nem törölheted ezt a matricát';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Webhook létrehozásához nyissa meg a(z) $channelSettingsPath oldalt. Itt továbbra is szerkeszthet és rendszerezhet minden létező webhookot.';
  }

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
  String get guildSettingsInvitesTableExpires => 'Lejár';

  @override
  String get guildSettingsAuditLogFilterUser => 'Szűrés felhasználó szerint';

  @override
  String get guildSettingsAuditLogFilterAction => 'Szűrés művelet szerint';

  @override
  String get createDm => 'DM létrehozása';

  @override
  String get createGroupDm => 'Csoportos DM létrehozása';

  @override
  String get createDmNewMessage => 'Új üzenet';

  @override
  String get createDmSelectFriends => 'Ismerősök kiválasztása';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Válassz barátokat az üzenetküldéshez.';

  @override
  String get createDmSearchFriends => 'Barátok keresése';

  @override
  String get createDmNoFriendsFound => 'Nincsenek barátok';

  @override
  String get createDmNoFriendsYet => 'Még nincsenek ismerőseid';

  @override
  String get createDmClaimToStartDms =>
      'Igazold a fiókodat, hogy elkezdhess privát üzeneteket küldeni.';

  @override
  String get createDmVerifyToStartDms =>
      'Igazold az e-mail címed a közvetlen üzenetek indításához.';

  @override
  String get createDmVerifyYourEmail => 'E-mail-cím ellenőrzése';

  @override
  String get createDmNewGroup => 'Új csoport';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Új csoport létrehozása $userName felhasználóval';
  }

  @override
  String get createDmConfirmNewGroup => 'Új csoport megerősítése';

  @override
  String get createDmCreateNewGroup => 'Új csoport létrehozása';

  @override
  String createDmRemoveFriend(String displayName) {
    return '$displayName eltávolítása';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Már van egy csoportod ezekkel a felhasználókkal. Biztosan újat szeretnél létrehozni? Az is rendben van!';

  @override
  String get createDmNoActivityYet => 'Még nincs aktivitás';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Néhány felhasználó nem adható hozzá';

  @override
  String get createDmCreateWithoutThem => 'Létrehozás nélkülük';

  @override
  String get createDmUnaddableIntro =>
      'A következő személyek nem adhatók hozzá ehhez a csoportos DM-hez:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Hozza létre a csoportos DM-et a fennmaradó $count címzettel, és hagyja figyelmen kívül a többit?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Nincs több címzett, akivel csoportos közvetlen üzenetet hozhatnál létre.';

  @override
  String get createDmUnaddableUserNotFound => 'A felhasználó nem található';

  @override
  String get createDmUnaddableBlocked =>
      'Ezt a felhasználót nem tudod üzenetben elérni';

  @override
  String get createDmUnaddableNotFriends => 'Nincs a barátlistádon';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Nem adható hozzá csoportos DM-ekhez';

  @override
  String get createDmFailed =>
      'Nem sikerült létrehozni a beszélgetést. Próbáld újra.';

  @override
  String get dmListMessagesTitle => 'Üzenetek';

  @override
  String get dmListDirectMessagesTitle => 'Direct Messages';

  @override
  String get keybindsSearchShortcuts => 'Gyorsbillentyűk keresése';

  @override
  String get keybindSectionDefaults => 'Alapértelmezett';

  @override
  String get keybindSectionMessages => 'Üzenetek';

  @override
  String get keybindSectionNavigation => 'Navigáció';

  @override
  String get keybindSectionDragAndDrop => 'Fogd és vidd';

  @override
  String get keybindSectionChat => 'Csevegés';

  @override
  String get keybindSectionVoiceAndVideo => 'Hang és videó';

  @override
  String get keybindSectionMisc => 'Egyéb';

  @override
  String get keybindActionShowShortcutsList =>
      'Billentyűparancsok listájának megjelenítése';

  @override
  String get keybindActionCopyText => 'Szöveg másolása';

  @override
  String get keybindActionMarkUnread => 'Olvasatlanként jelölés';

  @override
  String get keybindActionFocusTextarea => 'Fókuszálás a szövegmezőre';

  @override
  String get keybindActionSwitchCommunities => 'Váltás a közösségek között';

  @override
  String get keybindActionSwitchChannels => 'Váltás a csatornák között';

  @override
  String get keybindActionHistoryBack =>
      'Visszalépés a megtekintett csatornaelőzményekben';

  @override
  String get keybindActionHistoryForward =>
      'Előre a megtekintett csatornaelőzményekben';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Ugrás az olvasatlan csatornák között';

  @override
  String get keybindActionJumpMentionChannels =>
      'Ugrás az olvasatlan, említéseket tartalmazó csatornák között';

  @override
  String get keybindActionJumpCurrentCall => 'Ugrás az aktuális híváshoz';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Váltás az utolsó közösség és a közvetlen üzenetek között';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Váltás az előző közösségre vagy DM-ekre';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Váltás a következő közösségre vagy DM-re';

  @override
  String get keybindActionGoToDms => 'Ugrás az üzenetekhez';

  @override
  String get keybindActionGoToFirstCommunity => 'Ugrás az első közösséghez';

  @override
  String get keybindActionGoToSecondCommunity => 'Ugrás a második közösségre';

  @override
  String get keybindActionGoToThirdCommunity => 'Ugrás a harmadik közösséghez';

  @override
  String get keybindActionGoToFourthCommunity => 'Ugrás a negyedik közösséghez';

  @override
  String get keybindActionGoToFifthCommunity => 'Ugrás az ötödik közösséghez';

  @override
  String get keybindActionGoToSixthCommunity => 'Ugrás a hatodik közösségre';

  @override
  String get keybindActionGoToSeventhCommunity => 'Ugrás a hetedik közösséghez';

  @override
  String get keybindActionGoToEighthCommunity =>
      'Ugrás a nyolcadik közösséghez';

  @override
  String get keybindActionToggleQuickSwitcher => 'Gyorsváltó be/ki kapcsolása';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Közösség létrehozása vagy csatlakozás';

  @override
  String get keybindActionStartDragAndDrop => 'Húzd ide';

  @override
  String get keybindActionMove => 'Áthelyezés';

  @override
  String get keybindActionDropItem => 'Elem eldobása';

  @override
  String get keybindActionCancel => 'Mégse';

  @override
  String get keybindActionMarkCommunityRead =>
      'Közösség megjelölése olvasottként';

  @override
  String get keybindActionMarkChannelRead =>
      'Csatorna megjelölése olvasottként';

  @override
  String get keybindActionStartGroupDm => 'Csoportos DM indítása';

  @override
  String get keybindActionTogglePinnedMessages => 'Rögzített üzenetek váltása';

  @override
  String get keybindActionToggleInbox => 'Bejövő üzenetek váltása';

  @override
  String get keybindActionMarkTopInboxRead =>
      'A legfelső beérkező csatorna megjelölése olvasottként';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Összes bejövő csatorna megjelölése olvasottként';

  @override
  String get keybindActionToggleMemberList =>
      'Taglista vagy hangcsevegés be/ki kapcsolása';

  @override
  String get keybindActionToggleEmojiPicker =>
      'Hangulatjel-választó megjelenítése/elrejtése';

  @override
  String get keybindActionToggleGifPicker => 'GIF-választó kapcsolása';

  @override
  String get keybindActionToggleStickerPicker =>
      'Matricaválasztó megnyitása/bezárása';

  @override
  String get keybindActionScrollChatUp => 'Csevegés görgetése felfelé';

  @override
  String get keybindActionScrollChatDown => 'Csevegés görgetése lefelé';

  @override
  String get keybindActionJumpOldestUnread =>
      'Ugrás a legrégebbi olvasatlan üzenetre';

  @override
  String get keybindActionFocusComposer => 'Fókuszáljon a szövegmezőre';

  @override
  String get keybindActionUploadFile => 'Fájl feltöltése';

  @override
  String get keybindActionCopyChannelLink => 'Csatornalink másolása';

  @override
  String get keybindActionToggleSavedMedia => 'Mentett média váltása';

  @override
  String get keybindActionSendVoiceMessage => 'Hangüzenet küldése';

  @override
  String get keybindActionAnswerCall => 'Bejövő hívás fogadása';

  @override
  String get keybindActionDeclineCall => 'Bejövő hívás elutasítása';

  @override
  String get keybindActionStartDmCall =>
      'Hívás indítása DM-ben vagy csoportban';

  @override
  String get keybindActionToggleSoundboard => 'Hangtábla be/ki kapcsolása';

  @override
  String get keybindActionToggleCompactCallView =>
      'Kompakt hívásnézet kibontása vagy összecsukása';

  @override
  String get keybindActionPushToTalkPriority => 'Adás gomb (prioritás)';

  @override
  String get keybindActionVoiceActivityPriority => 'Hangaktivitás prioritása';

  @override
  String get keybindActionOpenHelp => 'Súgó megnyitása';

  @override
  String get keybindActionSearchMessages => 'Üzenetek keresése';

  @override
  String get keybindActionOpenContextMenu => 'A helyi menü megnyitása';

  @override
  String get keybindActionOpenSettings => 'Beállítások megnyitása';

  @override
  String get keybindActionOpenThemeStudio =>
      'Témastúdió felugró ablakának megnyitása';

  @override
  String get keybindActionZoomIn => 'Nagyítás';

  @override
  String get keybindActionZoomOut => 'Kicsinyítés';

  @override
  String get keybindActionZoomReset => 'Nagyítás visszaállítása';

  @override
  String get clipboardPasteFailed =>
      'Nem sikerült beilleszteni. A vágólap üres volt, vagy az alkalmazás nem férhetett hozzá.';

  @override
  String get homeQuickActionDms => 'Személyes üzenetek';
}
