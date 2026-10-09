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
  String get splashConnectionLost => 'Kapcsolat megszakadt';

  @override
  String get splashViewOnStatusPage => 'Megtekintés az állapotoldalon';

  @override
  String get splashConnectionIssuesPrompt => 'Kapcsolódási problémák?';

  @override
  String get splashStatusPageLink => 'Állapotoldal';

  @override
  String get splashReadIncident => 'Incidens megtekintése';

  @override
  String get splashIncidentHistory => 'Incidens előzmények';

  @override
  String get nagbarLearnMore => 'További információ';

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
    return 'Szia, $displayName! Fejezd be a fiókod regisztrációját, hogy ne veszítsd el a hozzáférésedet.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Szia, $displayName! Erősítsd meg az e-mail-címedet.';
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
  String get organizationSsoProvider =>
      'Jelentkezz be a szervezeted egységes bejelentkezési szolgáltatójával.';

  @override
  String get failedToStartSso =>
      'Nem sikerült elindítani az egységes bejelentkezést (SSO)';

  @override
  String get ssoCancelled => 'Az SSO bejelentkezés megszakítva';

  @override
  String preferSso(String provider) {
    return 'Inkább az SSO-t használnád? Folytatás a(z) $provider szolgáltatással.';
  }

  @override
  String get needAccountPrompt => 'Nincs még fiókod? ';

  @override
  String get register => 'Regisztráció';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => 'Mégse';

  @override
  String get ipAuthCheckEmail => 'Ellenőrizd az e-mailjeidet';

  @override
  String ipAuthDescription(String email) {
    return 'Küldtünk egy e-mailt a bejelentkezés engedélyezéséhez. Kérjük, nyisd meg a(z) $email postafiókodat.';
  }

  @override
  String get ipAuthConnectionLost => 'Kapcsolat megszakadt';

  @override
  String get ipAuthConnectionLostDescription =>
      'Elvesztettük a kapcsolatot az engedélyezésre várva. Kérjük, próbáld újra.';

  @override
  String get ipAuthLinkExpired => 'A bejelentkezési link lejárt';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Ez az engedélyezési link lejárt. Kérjük, jelentkezz be újra.';

  @override
  String get ipAuthResendEmail => 'E-mail újraküldése';

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
  String get mfaTitle => 'Kétlépcsős azonosítás';

  @override
  String get mfaChooseMethod => 'Válassz egy ellenőrzési módszert';

  @override
  String get mfaMethodTotp => 'Hitelesítő alkalmazás';

  @override
  String get mfaMethodWebauthn => 'Biztonsági kulcs / jelszókulcs';

  @override
  String get mfaTotpDescription =>
      'Add meg a 6 számjegyű kódot a hitelesítő alkalmazásodból, vagy az egyik biztonsági mentési kódodat.';

  @override
  String get mfaCodeLabel => 'Kód';

  @override
  String get mfaTryAnotherMethod => 'Próbálj másik módszert';

  @override
  String get mfaUseSecurityKey =>
      'Biztonsági kulcs vagy jelszókulcs használata';

  @override
  String get accountSelectorTitle => 'Fiók kiválasztása';

  @override
  String get accountSelectorDescription =>
      'Válassz egy fiókot a folytatáshoz, vagy adj hozzá egy másikat.';

  @override
  String get accountAdd => 'Fiók hozzáadása';

  @override
  String get accountRemoveDescription =>
      'Ezzel eltávolítja a mentett munkamenetet ehhez a fiókhoz.';

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
      'Nem sikerült fiókot váltani. Próbáld újra.';

  @override
  String get profileTabMenuSwitchAccounts => 'Fiókváltás';

  @override
  String get statusChangeSheetTitle => 'Állapot beállítása';

  @override
  String get statusOnlineStatusSection => 'Online állapot';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Inaktív';

  @override
  String get statusDnd => 'Ne zavarj';

  @override
  String get statusInvisible => 'Láthatatlan';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Amíg meg nem változtatom';

  @override
  String get statusDontClear => 'Ne töröld';

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
      'Nem fogsz értesítéseket kapni az asztali gépen';

  @override
  String get statusInvisibleDescription =>
      'Offline állapotban fogsz megjelenni';

  @override
  String get customStatusSetTitle => 'Egyéni állapot beállítása';

  @override
  String get customStatusCurrentHint => 'Egyéni állapot';

  @override
  String get customStatusClear => 'Egyéni állapot törlése';

  @override
  String get customStatusPlaceholder => 'Mi újság?';

  @override
  String get customStatusChooseEmoji => 'Válassz emojit';

  @override
  String get customStatusClearAfter => 'Törlés ennyi idő után';

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
  String get suspendedReason => 'Ok (indoklás)';

  @override
  String get suspendedAppealDeadline => 'Fellebbezési határidő';

  @override
  String suspendedDeletionWarning(String date) {
    return 'A fiókod törlése ekkor lesz ütemezve: $date.';
  }

  @override
  String get suspendedRecheck => 'Frissítések keresése';

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
      'Add meg az e-mail-címedet, és küldünk egy linket a jelszavad visszaállításához.';

  @override
  String get forgotPasswordSubmit => 'Jelszó-visszaállító link küldése';

  @override
  String get forgotPasswordSentTitle => 'Ellenőrizd az e-mailjeidet';

  @override
  String get forgotPasswordSentDescription =>
      'Küldtünk egy e-mailt a jelszavad visszaállításához. Kérjük, ellenőrizd a beérkezett üzeneteidet, és kövesd a linket a jelszavad visszaállításához.';

  @override
  String get forgotPasswordBackToLogin => 'Vissza a bejelentkezéshez';

  @override
  String get resetPasswordTitle => 'Új jelszó beállítása';

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
  String get recoverAccountTitle => 'Fiókod helyreállítása';

  @override
  String get recoverAccountDescription =>
      'Add meg a felhasználónevedet és a helyreállítási kulcsodat a helyreállítási csomagodból, majd válassz egy új jelszót.';

  @override
  String get recoverAccountNoKit =>
      'Nincs helyreállító csomagod? Kérj jelszó-visszaállítási linket az instanciád rendszergazdájától.';

  @override
  String get recoveryKitTitle => 'A helyreállító készleted';

  @override
  String get recoveryKitCreatedDescription =>
      'Ha elfelejted a jelszavadat, ez a készlet az egyetlen módja a fiókodba való visszajutásnak. Tárold biztonságos helyen, például jelszókezelőben vagy kinyomtatva.';

  @override
  String get recoveryKitReplacedDescription =>
      'A régi helyreállító kulcsod már nem működik. Tárold ezt az újat biztonságos helyen.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Jelszavad vissza lett állítva. A régi visszaállító kulcsod már nem érvényes. Tárold ezt az újat biztonságos helyen.';

  @override
  String get recoveryKitWarning =>
      'Aki birtokolja ezt a kulcsot, visszaállíthatja a jelszavát. Soha ne oszd meg senkivel.';

  @override
  String get recoveryKitKeyLabel => 'Helyreállítási kulcs';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return '$productName visszaállítási csomag';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Őrizd meg ezt az oldalt biztonságos helyen. Ha elfelejtenéd a jelszavadat, ezzel léphetsz be újra a fiókodba. Bárki, aki birtokolja ezt a visszaállítási kulcsot, visszaállíthatja a jelszavadat, ezért soha ne oszd meg senkivel.';

  @override
  String get recoveryKitInstanceLabel => 'Példány';

  @override
  String get recoveryKitCreatedAtLabel => 'Létrehozva';

  @override
  String get recoveryKitQrCaption =>
      'A beolvasással megnyithatod a helyreállítási oldalt, amelyen az adataid már ki vannak töltve.';

  @override
  String get recoveryKitStepsTitle => 'Fiókod helyreállításának módja';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Menj a(z) $recoverUrl címre, vagy olvasd be a QR-kódot.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Add meg a felhasználónevedet és ezt a helyreállítási kulcsot.';

  @override
  String get recoveryKitStepPassword =>
      'Válassz új jelszót. Új helyreállítási készletet kapsz, és ez a készlet nem fog működni.';

  @override
  String get recoveryKitBackupCodesTitle => 'Kétfaktoros biztonsági kódok';

  @override
  String get recoveryKitBackupCodesNote =>
      'Minden kód egyszer használható az automatikus hitelesítő alkalmazásod helyett.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Nem sikerült betölteni a biztonsági mentési kódokat.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'A kétlépcsős azonosítás tartalékkódjaim szerepeljenek a mentett képen';

  @override
  String get recoveryKitCopy => 'Másolás';

  @override
  String get recoveryKitCopied => 'Helyreállítási kulcs másolva';

  @override
  String get recoveryKitSaveImage => 'Kép mentése';

  @override
  String get recoveryKitSaved => 'Helyreállítási csomag mentve';

  @override
  String get recoveryKitSavedToPhotos =>
      'Helyreállítási csomag mentve a fotók közé';

  @override
  String get recoveryKitSaveFailed =>
      'Nem sikerült menteni a helyreállítási csomagot. Próbáld újra, vagy másold ki inkább a kulcsot.';

  @override
  String get recoveryKitAcknowledge =>
      'Elmentettem a helyreállító készletemet egy biztonságos helyre';

  @override
  String get recoveryKitCreateFailed =>
      'Nem sikerült létrehozni a helyreállító csomagot. Később is létrehozhatsz egyet a fiókbeállításaidban.';

  @override
  String get recoveryKitSectionTitle => 'Helyreállítási készlet';

  @override
  String get recoveryKitSectionDescription =>
      'Lehetővé teszi a jelszavad visszaállítását, ha elfelejtenéd.';

  @override
  String get recoveryKitNone => 'Még nincs helyreállítási csomagod';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Létrehozva: $time';
  }

  @override
  String get recoveryKitCreate => 'Helyreállítási készlet létrehozása';

  @override
  String get recoveryKitCreateNew => 'Új készlet létrehozása';

  @override
  String get recoveryKitReplaceTitle => 'Új helyreállítókészletet hoz létre?';

  @override
  String get recoveryKitReplaceDescription =>
      'Az aktuális készleted azonnal használhatatlanná válik, amint létrehozol egy újat.';

  @override
  String get recoveryKitReminderTitle =>
      'Helyezz el egy helyreállító készletet';

  @override
  String get recoveryKitReminderBody =>
      'Fiókodhoz nincs hozzárendelve e-mail cím. Ha elfelejted a jelszavadat, csak egy helyreállítási csomaggal tudsz visszajutni. Csak egy percet vesz igénybe.';

  @override
  String get registerUsernameSignInHint =>
      'Ezzel a felhasználónévvel jelentkezel be. Válassz egyet, amit meg fogsz jegyezni.';

  @override
  String get registerUsernameTaken => 'Ez a felhasználónév már foglalt';

  @override
  String get registerUsernameAvailable => 'Ez a felhasználónév szabad';

  @override
  String get claimAccountUsernameDescription =>
      'Foglald le a fiókodat egy felhasználónév és jelszó kiválasztásával. Ezekkel jelentkezel be, ezért olyanokat válassz, amiket meg fogsz jegyezni.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'A fiókod még nincs igényelve. Felhasználónév és jelszó nélkül nem tudsz bejelentkezni más eszközökről, és elveszítheted a hozzáférést a fiókodhoz. Igényeld a fiókodat most, hogy biztosítsd.';

  @override
  String get addFriendUsernameOnlyHint => 'Felhasználónév';

  @override
  String get registerTitle => 'Fiók létrehozása';

  @override
  String get registerDisplayName => 'Megjelenítendő név (opcionális)';

  @override
  String get registerDisplayNameHint => 'Hogyan szólítsanak?';

  @override
  String get registerUsername => 'Felhasználónév (opcionális)';

  @override
  String get registerUsernameHint =>
      'Hagyd üresen, ha véletlenszerű felhasználónevet szeretnél';

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
  String get registerConsentPrefix => 'Elfogadom a ';

  @override
  String get registerConsentTerms => 'Szolgáltatási feltételek';

  @override
  String get registerConsentAnd => ' és a ';

  @override
  String get registerConsentPrivacy => 'Adatvédelmi irányelvek';

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
  String get errorInvalidUsernameOrPassword =>
      'Érvénytelen felhasználónév vagy jelszó.';

  @override
  String get errorUnableToSendResetLink =>
      'Nem sikerült elküldeni az alaphelyzetbe állító linket. Kérjük, próbálkozzon újra.';

  @override
  String get errorUnableToResetPassword =>
      'Nem sikerült alaphelyzetbe állítani a jelszót. Kérjük, próbálkozzon újra.';

  @override
  String get embedInviteJoin => 'Csatlakozás a közösséghez';

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
  String get embedInviteUnavailable => 'Meghívó nem elérhető';

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
      'Ez a közösség szünetelteti a meghívókat. Később újra próbálkozhatsz.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName potenciális támadást észlelt ebben a közösségben. A meghívók szünetelnek, így az új felhasználók jelenleg nem csatlakozhatnak.';
  }

  @override
  String get inviteAcceptTitle => 'Meghívtak, hogy csatlakozz';

  @override
  String get inviteAcceptJoinButton => 'Csatlakozás a közösséghez';

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
  String get inviteAcceptJoinGroupButton => 'Csatlakozás a csoporthoz';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Meghívást kaptál egy csoportos DM-be $inviterName által';
  }

  @override
  String get inviteAcceptSomeone => 'valaki';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Csatorna-hozzáférés megtagadva';

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
  String get embedThemeWebOnly =>
      'Témákat csak weben vagy asztali gépen importálhatsz.';

  @override
  String get embedThemeImport => 'Téma importálása';

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
  String get embedGiftClaimHelp => 'Kattints az ajándékod beváltásához!';

  @override
  String get embedGiftAlreadyRedeemed => 'Már beváltva';

  @override
  String get embedGiftClaimAccountHelp =>
      'Az ajándék beváltásához fejezd be a fiókod regisztrációját.';

  @override
  String get embedGiftClaim => 'Ajándék beváltása';

  @override
  String get embedGiftClaimed => 'Ajándék beváltva';

  @override
  String get embedGiftClaimAccount =>
      'A beváltáshoz fejezd be a fiókregisztrációt';

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
  String get privacyDirectMessages => 'Közvetlen üzenetek';

  @override
  String get privacyDirectMessagesDescription =>
      'Engedélyezze a névtelen üzeneteket más tagoktól ebben a közösségben';

  @override
  String get privacyBotDirectMessages => 'Botok közvetlen üzenetei';

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
  String get notificationAllMessages => 'Összes üzenet';

  @override
  String get notificationOnlyMentions => 'Csak említések';

  @override
  String get notificationNothing => 'Semmi';

  @override
  String get notificationSuppressEveryone => '@everyone és @here elnyomása';

  @override
  String get notificationSuppressRoles => 'Elnyom minden szerep @említést';

  @override
  String get notificationMobilePush => 'Mobilos pushértesítések';

  @override
  String get notificationOverrides => 'Egyéni értesítési beállítások';

  @override
  String get notificationSelectChannel => 'Válassz csatornát vagy kategóriát';

  @override
  String get notificationOnlyAtMentions => 'Csak @említések';

  @override
  String get notificationMuteChannel => 'Csatorna némítása';

  @override
  String get notificationUnmuteChannel => 'Csatorna némításának feloldása';

  @override
  String get notificationUseCategoryDefault =>
      'Kategória alapértelmezésének használata';

  @override
  String get notificationUseCommunityDefault =>
      'A közösség alapértelmezett beállításainak használata';

  @override
  String get notificationNoCategory => 'Nincs kategória';

  @override
  String get dmMarkAsRead => 'Megjelölés olvasottként';

  @override
  String get dmMuteConversation => 'DM némítása';

  @override
  String get dmUnmuteConversation => 'DM némításának feloldása';

  @override
  String get dmPinDm => 'DM rögzítése';

  @override
  String get dmUnpinDm => 'DM rögzítésének feloldása';

  @override
  String get dmAlwaysShowInSidebar => 'Mindig megjelenít a sávban';

  @override
  String get dmRemoveFromAlwaysShown => 'Eltávolítás a mindig láthatókból';

  @override
  String get dmCloseDm => 'Közvetlen beszélgetés bezárása';

  @override
  String get dmCloseDmConfirmTitle => 'Közvetlen beszélgetés bezárása';

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
  String get dmChannelIdCopied => 'Csatornaazonosító kimásolva';

  @override
  String get dmCopyUserId => 'Felhasználói azonosító másolása';

  @override
  String get dmUserIdCopied => 'Felhasználói azonosító másolva';

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
  String get incomingVoiceCallIgnore => 'Elutasítás';

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
  String dmInviteSentFor(String communityName) {
    return 'A(z) $communityName közösségbe szóló meghívó elküldve';
  }

  @override
  String get dmInviteSendFailed =>
      'Nem sikerült elküldeni a meghívót. Próbáld újra.';

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
  String get dmPinGroupDm => 'Csoportos beszélgetés rögzítése';

  @override
  String get dmUnpinGroupDm => 'Csoportos beszélgetés rögzítésének feloldása';

  @override
  String get dmUnnamedGroup => 'Névtelen csoport';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName csoportja';
  }

  @override
  String get dmFavoriteDm => 'DM hozzáadása a kedvencekhez';

  @override
  String get dmUnfavoriteDm => 'DM eltávolítása a kedvencek közül';

  @override
  String get dmFavoriteGroupDm =>
      'Csoportos beszélgetés hozzáadása a kedvencekhez';

  @override
  String get dmUnfavoriteGroupDm =>
      'Csoportos beszélgetés eltávolítása a kedvencek közül';

  @override
  String get dmChangeFriendNickname => 'Ismerős becenevének módosítása';

  @override
  String get dmRemoveFriend => 'Eltávolítás az ismerősök közül';

  @override
  String get dmAddFriend => 'Ismerős hozzáadása';

  @override
  String get dmAcceptFriendRequest => 'Ismerősjelölés elfogadása';

  @override
  String get dmIgnoreFriendRequest => 'Ismerősjelölés mellőzése';

  @override
  String get dmFriendRequestSent => 'Ismerősjelölés elküldve';

  @override
  String get dmUnblock => 'Tiltás feloldása';

  @override
  String get dmDebugUser => 'Felhasználó hibakeresése';

  @override
  String get dmDebugChannel => 'Csatorna hibakeresése';

  @override
  String get dmDebugCategory => 'Kategória hibakeresése';

  @override
  String get dmPinned => 'Rögzített DM';

  @override
  String get dmUnpinned => 'Rögzítés feloldva (közvetlen üzenet)';

  @override
  String get dmMuted => 'Némított DM';

  @override
  String get dmUnmuted => 'Némítatlan DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Eltávolítás az ismerősök közül';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Biztosan eltávolítod $username barátként?';
  }

  @override
  String get dmBlockConfirmTitle => 'Felhasználó letiltása';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Biztosan blokkolni szeretnéd $username felhasználót? Nem tud majd üzenetet küldeni neked, és nem küldhet barát kéréseket.';
  }

  @override
  String get dmFriendRequestSentToast => 'Ismerősjelölés elküldve';

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
  String get dmAddFriends => 'Ismerősök hozzáadása';

  @override
  String get addFriendSheetTitle => 'Ismerős hozzáadása';

  @override
  String get addFriendUsernameHint => 'Felhasználónév#0000';

  @override
  String get addFriendUsernameLabel => 'Ismerős felhasználóneve';

  @override
  String get addFriendSendRequest => 'Kérés küldése';

  @override
  String get addFriendNoUserFound =>
      'Nem található felhasználó ezzel a felhasználónévvel.';

  @override
  String get addFriendInvalidUsername =>
      'Adjon meg érvényes felhasználónevet (Felhasználónév#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Ismerősjelölés elküldve';

  @override
  String get addFriendClaimTitle => 'Fejezd be a fiókod regisztrációját';

  @override
  String get addFriendClaimDescription =>
      'Fejezd be a fiókod regisztrációját, hogy ismerősjelöléseket küldhess.';

  @override
  String get addFriendVerifyTitle => 'E-mail-cím megerősítése';

  @override
  String get addFriendVerifyDescription =>
      'Ismerősjelölések küldése előtt meg kell erősítened az e-mail-címedet.';

  @override
  String get addFriendVerifyEmail => 'E-mail-cím megerősítése';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Bejövő barát kérések ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Kimenő barát kérések ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Bejövő ismerősjelölés';

  @override
  String get addFriendOutgoingStatus => 'Ismerősjelölés elküldve';

  @override
  String get addFriendViewProfile => 'Profil megtekintése';

  @override
  String get addFriendAccept => 'Elfogadás';

  @override
  String get addFriendIgnore => 'Elutasítás';

  @override
  String get addFriendAcceptTitle => 'Ismerősjelölés elfogadása';

  @override
  String get addFriendIgnoreTitle => 'Ismerősjelölés mellőzése';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Elfogadod $userName ismerősjelölését?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '$displayName ismerősjelölésének mellőzése?';
  }

  @override
  String get addFriendCancelRequest => 'Kérelem visszavonása';

  @override
  String get addFriendCancelRequestFailed =>
      'Nem sikerült visszavonni az ismerősjelölést. Próbáld újra.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Jelenleg nem fogad ismerősjelöléseket.';

  @override
  String get addFriendUnblockFirst =>
      'Ismerősjelölés küldéséhez előbb oldd fel a letiltását.';

  @override
  String get addFriendCannotSendToSelf =>
      'Nem küldhetsz magadnak ismerősjelölést.';

  @override
  String get addFriendAlreadyFriends =>
      'Már ismerősök vagytok ezzel a felhasználóval.';

  @override
  String get addFriendClaimToSend =>
      'Fejezd be a regisztrációt, hogy ismerősjelöléseket küldhess.';

  @override
  String get addFriendVerifyToSend =>
      'Ismerősjelölések küldése előtt erősítsd meg az e-mail-címedet.';

  @override
  String get addFriendFriendsListFull =>
      'Megtelt az ismerőslistád vagy az övé. Távolíts el valakit, és próbáld újra.';

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
      'Ez egy közösség egyéni emojija.';

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
  String get gifPickerNoResultsDescription => 'Próbálj másik keresőkifejezést';

  @override
  String get gifPickerLoadFailedTitle => 'Nem sikerült betölteni a GIF-eket';

  @override
  String get gifPickerLoadFailedBody =>
      'Ellenőrizd a kapcsolatot, és próbáld újra.';

  @override
  String get emojiCategoryPeople => 'Személyek';

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
  String get emojiPlutoniumUpsellDismiss => 'Ne mutasd többé';

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
  String get externalLinkWarningTitle => 'Figyelmeztetés külső hivatkozásnál';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Elhagyod a(z) $productName alkalmazást';
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
  String get externalLinkVisitSite => 'Webhely felkeresése';

  @override
  String get externalLinkTrustAllLabel =>
      'Minden külső link megjelölése megbízhatóként';

  @override
  String get externalLinkStripTrackingLabel =>
      'Követési paraméterek eltávolítása az URL-ekből';

  @override
  String get externalLinkStripTrackingDescription =>
      'Automatikusan eltávolítja a követési paramétereket (például utm_source, fbclid, gclid) az elküldött üzenetekben lévő URL-ekből. A linket megtisztítja, mielőtt az bárki máshoz eljutna.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Megbízol minden külső hivatkozásban?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Ez megbízhatónak jelöl minden külső hivatkozást, és kihagyja a figyelmeztetést minden domain esetében. A meglévő megbízható domainjeid felülíródnak. Ez kevésbé biztonságos.';

  @override
  String get externalLinkTrustAllConfirmAction =>
      'Összes megjelölése megbízhatóként';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Minden link megbízhatóságának megszüntetése?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'A külső hivatkozásokra vonatkozó figyelmeztetések újra megjelennek. A megbízható domaineket egyenként kell hozzáadnod.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Minden hivatkozás automatikus elfogadásának kikapcsolása';

  @override
  String get externalLinkTrustedAllDescription =>
      'Minden külső hivatkozás megbízható. A figyelmeztetések nem jelennek meg.';

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
  String get cropAvatar => 'Profilkép körbevágása';

  @override
  String get cropBanner => 'Borítókép körbevágása';

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
  String get fluxerTagDescriptionBase =>
      'A felhasználónevek csak betűket (a-z, A-Z), számokat (0-9) és aláhúzásjeleket tartalmazhatnak. A felhasználónevek nem különböztetik meg a kis- és nagybetűket.';

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
      'Csak betűk (a-z, A-Z), számok (0-9) és aláhúzásjelek (_)';

  @override
  String get fluxerTagAlreadyTaken => 'A felhasználónév már foglalt';

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
  String get fluxerTagUpdated => 'Felhasználónév frissítve';

  @override
  String get fluxerTagUpdateFailed =>
      'A Felhasználónév frissítése sikertelen. Kérlek, próbáld újra.';

  @override
  String get continueAction => 'Folytatás';

  @override
  String get profileCustomizationTitle => 'Profil testreszabása';

  @override
  String get profileCustomizationDescription =>
      'Profilod megjelenésének szerkesztése és élő előnézet megtekintése';

  @override
  String get usernameLabel => 'Felhasználónév';

  @override
  String get claimAccountToChangeFluxerTag =>
      'A felhasználóneved megváltoztatásához fejezd be a fiókod regisztrációját';

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
  String get accentColorLabel => 'Kiemelőszín';

  @override
  String get accentColorDescription =>
      'A profilod szegélyének és borítóképének színét szabályozza';

  @override
  String get aboutMeLabel => 'Rólam';

  @override
  String get aboutMeHelperText =>
      'Használhatsz linkeket, emojikat és Markdown-formázást.';

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
      'A Visionary megjelenítése normál előfizetésként';

  @override
  String get maskVisionaryDescription =>
      'A Visionary-előfizetés megjelenítése normál előfizetésként';

  @override
  String get hideVisionaryIdBadge =>
      'Visionary-azonosító jelvényének elrejtése';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Látnok azonosító jelvény elrejtése (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Visionary-azonosító jelvényének eltávolítása';

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
    return '$productName-tagság kezdete';
  }

  @override
  String get unclaimedAccountTitle => 'Befejezetlen regisztrációjú fiók';

  @override
  String get unclaimedAccountDescription =>
      'A fiókod még nincs igényelve. E-mail és jelszó nélkül elveszítheted a hozzáférést. Igényeld a fiókodat most a biztonság érdekében.';

  @override
  String get claimAccount => 'Fiókregisztráció befejezése';

  @override
  String get profileTypeLabel => 'Profiltípus';

  @override
  String get profileTypeGlobal => 'Globális profil';

  @override
  String get profileTypeGuildDescription =>
      'A közösségi profilodat szerkeszted. Ez a profil csak ebben a közösségben lesz látható, és felülírja a globális profilodat.';

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
  String get avatarModeUnset => 'Ne mutasd';

  @override
  String get profileSavedToast => 'Profil frissítve';

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
  String get securityLoginEmailAddressLabel => 'E-mail-cím';

  @override
  String get securityLoginNoEmailSet => 'Nincs beállítva e-mail-cím';

  @override
  String get securityLoginChangeEmail => 'E-mail-cím módosítása';

  @override
  String get securityLoginAddEmail => 'E-mail-cím hozzáadása';

  @override
  String get securityLoginReveal => 'Felfedés';

  @override
  String get securityLoginHide => 'Elrejtés';

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
  String get securityLoginNoPasswordSet => 'Nincs beállítva jelszó';

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
  String get passwordChangeStart => 'Kezdés';

  @override
  String get passwordChangeVerifyTitle => 'E-mail-cím megerősítése';

  @override
  String get passwordChangeVerifyDescription =>
      'Add meg az e-mail címedre küldött ellenőrző kódot.';

  @override
  String get passwordChangeVerificationCode => 'Ellenőrző kód';

  @override
  String get passwordChangeVerify => 'Ellenőrzés';

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
  String get passwordChangeSuccess => 'Jelszó megváltoztatva';

  @override
  String get passwordChangePasswordsDoNotMatch => 'A jelszavak nem egyeznek';

  @override
  String get passwordChangeInvalidCode => 'Érvénytelen vagy lejárt kód';

  @override
  String get emailChangeTitle => 'E-mail-cím módosítása';

  @override
  String get emailChangeIntroDescription =>
      'Az e-mail cím megváltoztatása előtt ellenőrző kódokat küldünk az Ön személyazonosságának igazolásához.';

  @override
  String get emailChangeStart => 'Kezdés';

  @override
  String get emailChangeVerifyOriginalTitle =>
      'Jelenlegi e-mail cím ellenőrzése';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Adja meg az aktuális e-mail címére küldött ellenőrző kódot.';

  @override
  String get emailChangeNewEmailTitle => 'Új e-mail-cím megadása';

  @override
  String get emailChangeNewEmailDescription =>
      'Adja meg az új e-mail címet, amelyet használni szeretne.';

  @override
  String get emailChangeNewEmailLabel => 'Új e-mail-cím';

  @override
  String get emailChangeNewEmailSubmit => 'Ellenőrző kód küldése';

  @override
  String get emailChangeVerifyNewTitle => 'Új e-mail cím ellenőrzése';

  @override
  String get emailChangeVerifyNewDescription =>
      'Adja meg az új e-mail címére küldött ellenőrző kódot.';

  @override
  String get emailChangeSuccess => 'E-mail-cím megváltoztatva';

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
  String get disable => 'Kikapcsolás';

  @override
  String get delete => 'Törlés';

  @override
  String get save => 'Mentés';

  @override
  String get securityTfaSectionTitle => 'Kétlépcsős azonosítás';

  @override
  String get securityTfaSectionDescription =>
      'Tedd még biztonságosabbá a fiókodat';

  @override
  String get securityTfaAuthenticatorApp => 'Hitelesítő alkalmazás';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'A kétlépcsős azonosítás engedélyezve van';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Használj hitelesítő alkalmazást a kétlépcsős azonosításhoz szükséges kódok generálásához';

  @override
  String get securityTfaBackupCodes => 'Biztonsági kódok';

  @override
  String get securityTfaBackupCodesDescription =>
      'Fiók-helyreállító biztonsági kódok megtekintése és kezelése';

  @override
  String get securityTfaViewCodes => 'Kódok megtekintése';

  @override
  String get securityPasskeysSectionTitle => 'Jelszókulcsok';

  @override
  String get securityPasskeysSectionDescription =>
      'Használjon jelszó nélküli kulcsokat a jelszó nélküli bejelentkezéshez és a kétfaktoros hitelesítéshez';

  @override
  String get securityPasskeysRegistered => 'Regisztrált jelszókulcsok';

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
  String get securityPasskeysAdd => 'Jelszókulcs hozzáadása';

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
  String get securityPasskeysDeleteTitle => 'Jelszókulcs törlése';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Biztosan törölni szeretné a(z) „$name” jelszó nélküli kulcsot?';
  }

  @override
  String get securityPasskeyNameTitle => 'Jelszókulcs elnevezése';

  @override
  String get securityPasskeyNameLabel => 'Jelszókulcs neve';

  @override
  String get securityPasskeyNameHint =>
      'pl. YubiKey, iPhone, munkahelyi számítógép';

  @override
  String get securityClaimTitle => 'Biztonsági funkciók';

  @override
  String get securityClaimDescription =>
      'Fejezd be a fiókod regisztrációját, hogy hozzáférhess a biztonsági funkciókhoz, például a kétlépcsős azonosításhoz és a jelszókulcsokhoz.';

  @override
  String get securityVerifyEmailRequired =>
      'E-mail címedet igazolnod kell, mielőtt beállíthatod a kétfaktoros hitelesítést vagy a jelszómentes belépést.';

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
  String get totpDisableSuccess => 'Kétlépcsős azonosítás kikapcsolva';

  @override
  String get backupCodesTitle => 'Biztonsági kódok';

  @override
  String get backupCodesWarning =>
      'Ha elveszíted a hozzáférést a hitelesítő alkalmazásodhoz, és nincsenek meg ezek a kódok, akkor véglegesen kizáródsz a fiókodból. Töltsd le vagy másold ki őket most, és tárold őket biztonságos helyen.';

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
  String get dangerZoneSectionTitle => 'Veszélyzóna';

  @override
  String get dangerZoneSectionDescription =>
      'Visszavonhatatlan és pusztító műveletek';

  @override
  String get dangerZoneDisableTitle => 'Fiók inaktiválása';

  @override
  String get dangerZoneDisableDescription =>
      'Ideiglenesen inaktiválhatod a fiókodat. Később újraaktiválhatod, ha bejelentkezel.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'A fiókod letiltása minden munkamenetből kiléptet. Bármikor újra aktiválhatod a fiókodat, ha újra bejelentkezel.';

  @override
  String get dangerZoneDeleteTitle => 'Fiók törlése';

  @override
  String get dangerZoneDeleteDescription =>
      'Véglegesen törli a fiókodat és minden kapcsolódó adatot. Ez nem vonható vissza.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'A fiókod törlése előtt mondd le az aktív Plutonium előfizetésedet a Plutonium beállításaiban.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'A fiók nem törölhető';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Nem törölheted a fiókodat, amíg közösségek tulajdonosa vagy. Először ruházd át a következő közösségek tulajdonjogát:';

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
      'Biztosan törölni szeretnéd a fiókodat? Ezzel a művelettel végleges törlésre jelölöd a fiókodat.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'A törlési folyamatot 14 napon belül visszavonhatod';

  @override
  String get dangerZoneDeleteBullet2 =>
      '14 nap múlva fiókod véglegesen törlődik';

  @override
  String get dangerZoneDeleteBullet3 =>
      'A törlés feldolgozása után nem tudod visszaállítani a fiókodhoz való hozzáférést';

  @override
  String get dangerZoneDeleteBullet4 =>
      'A fiókod törlése után nem tudod törölni a küldött üzeneteidet';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Ha exportálni szeretnéd az adataidat, vagy először törölni szeretnéd az üzeneteidet, kérjük, mielőtt folytatnád, keresd fel az Adatvédelmi irányítópultot a Felhasználói beállításokban.';

  @override
  String get claimAccountTitle => 'Fejezd be a fiókod regisztrációját';

  @override
  String get claimAccountDescription =>
      'Fejezd be a fiókod regisztrációját egy e-mail-cím és jelszó megadásával. A befejezés előtt ellenőrző kódot küldünk az e-mail-címed megerősítéséhez.';

  @override
  String get claimAccountEmailLabel => 'E-mail';

  @override
  String get claimAccountPasswordLabel => 'Jelszó';

  @override
  String get claimAccountSendCode => 'Kód küldése';

  @override
  String get claimAccountVerifyDescription =>
      'Add meg az e-mail-címedre küldött kódot az ellenőrzéshez. A jelszavad a kód megerősítése után lesz beállítva.';

  @override
  String get claimAccountSuccess => 'A fiókregisztráció sikeresen befejeződött';

  @override
  String get importantInformation => 'Fontos információ:';

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
      'Még egyetlen alkalmazásnak sem adtál hozzáférést a fiókodhoz.';

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
      'Hozzáférés az alapvető profiladataidhoz (felhasználónév, profilkép stb.)';

  @override
  String get authorizedAppsScopeEmail => 'E-mail-címed megtekintése';

  @override
  String get authorizedAppsScopeGuilds =>
      'Azoknak a közösségeknek a megtekintése, amelyeknek tagja vagy';

  @override
  String get authorizedAppsScopeConnections => 'Kapcsolt fiókok megtekintése';

  @override
  String get authorizedAppsScopeBot =>
      'Bot hozzáadása egy közösséghez a kért jogosultságokkal';

  @override
  String get authorizedAppsScopeAdmin => 'Adminisztratív végpontok elérése';

  @override
  String get applicationsTitle => 'Alkalmazások';

  @override
  String get applicationsCreate => 'Alkalmazás létrehozása';

  @override
  String get applicationsCreateSubmit => 'Létrehozás';

  @override
  String get applicationsCreateClaimTooltip =>
      'Alkalmazások létrehozásához fejezd be a fiókod regisztrációját.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Dokumentáció olvasása ($domain)';
  }

  @override
  String get applicationsLoadError =>
      'Nem sikerült betölteni az alkalmazásokat';

  @override
  String get applicationsLoadErrorDescription =>
      'Ellenőrizd a kapcsolatot, és próbáld újra.';

  @override
  String get applicationsEmptyTitle => 'Még nincsenek alkalmazások';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Hozd létre az első alkalmazásodat a(z) $apiName használatához.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Létrehozva: $date';
  }

  @override
  String get applicationsName => 'Alkalmazás neve';

  @override
  String get applicationsNameHint => 'Saját alkalmazás';

  @override
  String get applicationsNameRequired => 'Az alkalmazás neve kötelező';

  @override
  String get applicationsBackToList => 'Vissza a listához';

  @override
  String get applicationsDetailLoadError =>
      'Nem sikerült betölteni az alkalmazást';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Próbáld újra, vagy térj vissza az alkalmazások listájához.';

  @override
  String get applicationsId => 'Alkalmazásazonosító';

  @override
  String get applicationsCopyId => 'Azonosító másolása';

  @override
  String get applicationsSecretsTitle => 'Titkos kulcsok és tokenek';

  @override
  String get applicationsSecretsDescription =>
      'Őrizd meg őket biztonságosan. Az újragenerálás működésképtelenné teszi a meglévő integrációkat.';

  @override
  String get applicationsClientSecret => 'Kliens titkos kulcsa';

  @override
  String get applicationsBotToken => 'Bottoken';

  @override
  String get applicationsRegenerate => 'Újragenerálás';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Újragenerálod a kliens titkos kulcsát?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Újragenerálod a bot tokenjét?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Az újragenerálás érvényteleníti a jelenlegi titkos kulcsot. Frissítsd az összes kódot, amely a régi értéket használja.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Az újragenerálás érvényteleníti az aktuális tokent. Frissítsd az összes kódot, amely a régi értéket használja.';

  @override
  String get applicationsClientSecretRegenerated =>
      'A kliens titkos kulcsa újra lett generálva. Frissítsd az összes kódot, amely a régi kulcsot használja.';

  @override
  String get applicationsBotTokenRegenerated =>
      'A bottoken újra lett generálva. Frissítsd az összes kódot, amely a régi tokent használja.';

  @override
  String get applicationsRegenerateFailed =>
      'Nem sikerült újra létrehozni a titkos kulcsot';

  @override
  String get applicationsInfoTitle => 'Alkalmazás adatai';

  @override
  String get applicationsInfoDescription =>
      'Alapbeállítások és engedélyezett átirányítási URI-k.';

  @override
  String get applicationsPublicBot => 'Nyilvános bot';

  @override
  String get applicationsPublicBotDescription =>
      'Engedélyezi, hogy bárki meghívhassa ezt a botot a közösségeibe.';

  @override
  String get applicationsRequireCodeGrant =>
      'OAuth2 engedélyezési kód megkövetelése';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'A bot meghívásához átirányítási URI és engedélyezési kód szükséges.';

  @override
  String get applicationsRedirectUris => 'Átirányítási URI-k';

  @override
  String get applicationsAddRedirect => 'Átirányítás hozzáadása';

  @override
  String get applicationsDeleteRedirect => 'Átirányítási URI törlése';

  @override
  String get applicationsBotProfileTitle => 'Botprofil';

  @override
  String get applicationsBotProfileDescription =>
      'A botod profilképe, címkéje és részletes profiladatai.';

  @override
  String get applicationsBotAvatar => 'Bot profilképe';

  @override
  String get applicationsUsernameRequired => 'Felhasználónév megadása kötelező';

  @override
  String get applicationsUsernameTooLong =>
      'A felhasználónév legfeljebb 32 karakterből állhat';

  @override
  String get applicationsUsernameInvalid =>
      'A felhasználónév csak betűket, számokat és aláhúzásjeleket tartalmazhat';

  @override
  String get applicationsBotUsername => 'Bot felhasználóneve';

  @override
  String get applicationsDiscriminator => 'Számazonosító';

  @override
  String get applicationsBotBio => 'Bot bemutatkozása';

  @override
  String get applicationsBotBioHint =>
      'Egy segítőkész bot, ami csodálatos dolgokra képes!';

  @override
  String get applicationsNoBotBanner => 'A botnak nincs borítóképe';

  @override
  String get applicationsFriendlyBot => 'Barátságos bot';

  @override
  String get applicationsFriendlyBotDescription =>
      'A felhasználók kézi jóváhagyást igénylő ismerősjelöléseket küldhetnek ennek a botnak.';

  @override
  String get applicationsManualFriendApproval =>
      'Ismerősjelölések kézi jóváhagyásának megkövetelése';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'A botnak küldött ismerősjelöléseket kézzel kell jóváhagyni.';

  @override
  String get applicationsOauthBuilderTitle => 'OAuth2 URL-készítő';

  @override
  String get applicationsOauthBuilderDescription =>
      'Hozz létre egy engedélyezési URL-t hatókörökkel és jogosultságokkal.';

  @override
  String get applicationsScopes => 'Hatókörök';

  @override
  String get applicationsRedirectUri => 'Átirányítási URI';

  @override
  String get applicationsSelectRedirectUri => 'Átirányítási URI kiválasztása';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'Átirányítási URI szükséges, mert ez a bot OAuth2 engedélyezési kódot igényel.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'Átirányítási URI szükséges, ha a bot hatókörön kívül más hatókört is használsz.';

  @override
  String get applicationsBotPermissions => 'Botjogosultságok';

  @override
  String get applicationsAuthorizeUrl => 'URL engedélyezése';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Hatókörök kiválasztása (és átirányítási URI, ha szükséges)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Engedélyezési URL másolása';

  @override
  String get applicationsCopiedUrl => 'URL kimásolva a vágólapra';

  @override
  String get applicationsDangerTitle => 'Veszélyzóna';

  @override
  String get applicationsDangerSubtitle =>
      'Ezt nem lehet visszavonni. Az alkalmazás eltávolítása a botját is törli.';

  @override
  String get applicationsDangerHelper =>
      'Törlés után az alkalmazás és a hitelesítő adatai véglegesen eltávolításra kerülnek.';

  @override
  String get applicationsDelete => 'Alkalmazás törlése';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Biztosan törölni szeretnéd a(z) $name alkalmazást? Ez a művelet nem vonható vissza. Minden kapcsolódó adat, beleértve a botfelhasználót is, véglegesen törlődik.';
  }

  @override
  String get applicationsDeleteFailed => 'Nem sikerült törölni az alkalmazást';

  @override
  String get applicationsUpdated => 'Alkalmazás sikeresen frissítve';

  @override
  String get applicationsNoChanges => 'Nincs menthető változás';

  @override
  String get applicationsSearchBots => 'Alkalmazások és botok';

  @override
  String get applicationsSearchBotsDescription =>
      'Alkalmazások és botok létrehozása és kezelése a fiókodhoz';

  @override
  String get applicationsSearchInfoDescription =>
      'Alapvető alkalmazásadatok és átirányítási URI-k szerkesztése';

  @override
  String get applicationsSearchBotProfileDescription =>
      'A bot profilképének, címkéjének, bemutatkozásának, borítóképének és ismerősjelölési beállításainak szerkesztése';

  @override
  String get applicationsSearchOauthDescription =>
      'Engedélyezési URL létrehozása hatókörökkel, átirányításokkal és botjogosultságokkal';

  @override
  String get applicationsSearchSecretsDescription =>
      'Kliensek titkos kulcsainak és bottokeneknek a megtekintése és újragenerálása';

  @override
  String get applicationsSearchBotsKeyword => 'Botok';

  @override
  String get applicationsSearchDocumentation => 'Dokumentáció';

  @override
  String get blockedUsersTitle => 'Letiltott felhasználók';

  @override
  String get blockedUsersDescription =>
      'A letiltott felhasználók nem küldhetnek neked ismerősjelölést vagy közvetlen üzenetet.';

  @override
  String get blockedUsersEmptyTitle => 'Nincsenek letiltott felhasználók';

  @override
  String get blockedUsersEmptyDescription => 'Még senkit sem tiltottál le.';

  @override
  String get blockedUsersLoadError =>
      'Nem sikerült betölteni a letiltott felhasználókat';

  @override
  String get blockedUsersUnblock => 'Tiltás feloldása';

  @override
  String get blockedUsersUnblockTitle => 'Felhasználó letiltásának feloldása';

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
  String get userProfileVideoCall => 'Videóhívás';

  @override
  String get userProfileEditProfile => 'Profil szerkesztése';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName munkatárs';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName Közösségi Csapat';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName partner';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName hibavadász';
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
  String get userProfileNoMutualFriends => 'Nincsenek közös ismerősök.';

  @override
  String get userProfileNoMutualCommunities => 'Nincsenek közös közösségek.';

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
  String get userProfileNoteTitle => 'Megjegyzés';

  @override
  String get userProfileNoteVisibility => '(csak te láthatod)';

  @override
  String get userProfileNoteSave => 'Mentés';

  @override
  String get userProfileNoteDelete => 'Törlés';

  @override
  String get userProfileMemberSince => 'Tag ekkortól';

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
  String get profileLocalTimeSettingsTitle => 'Profil helyi ideje';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Állítsd be egyszer az időzónádat, hogy a(z) $productName a nyári időszámítás változásakor is naprakészen tarthassa az UTC-eltolódásodat. Mások csak az UTC-eltolódásodat látják, a pontos időzóna-azonosítódat nem.';
  }

  @override
  String get profileLocalTimeEditButton => 'Helyi idő szerkesztése';

  @override
  String get profileLocalTimeTimezoneLabel => 'Időzóna';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Válaszd ki, melyik időzóna alapján számolja ki a(z) $productName a profilodon megjelenő helyi idő UTC-eltolását.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Időzónák keresése';

  @override
  String get profileLocalTimeNotSet => 'Nincs beállítva';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Ha megosztod a helyi időt a profilodon, mások csak az aktuális UTC-eltolódásodat látják. A pontos időzóna-azonosítót, például ezt: $timezoneIdentifierExample, nem látják. A(z) $productName csak azért tárolja ezt az azonosítót, hogy az eltolódás a nyári időszámítás változásakor automatikusan frissülhessen.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Mindenki';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Bárki láthatja a helyi idődet, aki megtekintheti a teljes profilodat';

  @override
  String get profileLocalTimePrivacyFriends => 'Ismerősök';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Az ismerőseid láthatják a helyi idődet';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Közösségi tagok';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'A közösségeid tagjai láthatják a helyi idődet';

  @override
  String get userProfileSameTimeAsYou => 'Ugyanannyi az idő, mint nálad';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'Időeltérés hozzád képest: +$duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'Időeltérés hozzád képest: −$duration';
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
  String get userProfileUnblockUser => 'Felhasználó letiltásának feloldása';

  @override
  String get userProfileRemoveFriend => 'Eltávolítás az ismerősök közül';

  @override
  String get userProfileBlockConfirmTitle => 'Felhasználó letiltása';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Biztosan le szeretnéd tiltani $username felhasználót?';
  }

  @override
  String get userProfileUnblockConfirmTitle =>
      'Felhasználó letiltásának feloldása';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Biztosan fel szeretnéd oldani $username felhasználó tiltását?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle =>
      'Eltávolítás az ismerősök közül';

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
  String get userProfileTimeout => 'Ideiglenes korlátozás';

  @override
  String get userProfileRemoveTimeout => 'Ideiglenes korlátozás feloldása';

  @override
  String get userProfileTransferOwnership => 'Tulajdonjog átruházása';

  @override
  String get userProfileReportMessage => 'Üzenet bejelentése';

  @override
  String get userProfileReportUserProfile => 'Profil bejelentése';

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
  String get userProfileBanDeleteHistoryLabel => 'Üzenetelőzmények törlése';

  @override
  String get userProfileBanDeleteNone => 'Ne törölj semmit';

  @override
  String get userProfileBanDelete24h => 'Előző 24 óra';

  @override
  String get userProfileBanDelete7d => 'Előző 7 nap';

  @override
  String get userProfileBanReasonLabel => 'Ok (opcionális)';

  @override
  String get userProfileBanReasonHint => 'Add meg a kitiltás okát';

  @override
  String get userProfileBanSubmit => 'Tag kitiltása';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '$username némítása';
  }

  @override
  String get userProfileTimeoutDurationLabel =>
      'Ideiglenes korlátozás időtartama';

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
  String get userProfileTransferSuccess => 'Tulajdonjog átruházva';

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
  String get typingIndicatorMultiple => 'Többen is épp írnak...';

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
    return 'Szia, $username! Csatlakozz, amikor készen állsz.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Szia $username, örülünk, hogy itt vagy!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Szia, $username! Reméljük, jól érzed magad nálunk.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Szia, $username, üdv a fedélzeten!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Örülünk, hogy itt vagy, $username!';
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
    return 'Üdv, $username! Reméljük, jól érzed magad nálunk.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Üdv, $username! A következő beszélgetésed itt kezdődik.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Üdvözlünk, $username! Örülünk, hogy itt vagy.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Örülünk, hogy látunk, $username! Üdv a fedélzeten.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Szia, $username! Örülünk, hogy velünk vagy.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Megérkeztél, $username! Kezdjünk is hozzá.';
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
  String get linkedDevicesTitle => 'Saját eszközök';

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
  String get linkedDevicesSignOutAll =>
      'Kijelentkezés az összes többi eszközről';

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
      'Kijelentkezés az összes többi eszközről';

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
  String get linkedDevicesViewDetails => 'Részletek megtekintése';

  @override
  String get linkedDevicesDetailsTitle => 'Eszköz részletei';

  @override
  String get linkedDevicesDetailsDevice => 'Eszköz';

  @override
  String get linkedDevicesDetailsClient => 'Kliens';

  @override
  String get linkedDevicesDetailsLocation => 'Hely';

  @override
  String get linkedDevicesDetailsIp => 'IP-cím';

  @override
  String get linkedDevicesDetailsLastUsed => 'Utolsó használat';

  @override
  String get linkedDevicesCurrentSession => 'Jelenlegi munkamenet';

  @override
  String get linkedDevicesUnknown => 'Ismeretlen';

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
      'Ebben a csatornában nem küldhetsz üzeneteket.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Rendszerüzenetek a(z) $productName munkatársaitól. Itt nem válaszolhatsz.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Az üzenetküldés átmenetileg szünetel ebben a közösségben.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Ideiglenes korlátozás alatt állsz. A lejártáig nem küldhetsz üzeneteket, nem reagálhatsz és nem csatlakozhatsz hangbeszélgetéshez.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Ahhoz, hogy ebben a közösségben üzeneteket küldhess, be kell fejezned a fiókod regisztrációját.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Ahhoz, hogy üzeneteket küldhess ebben a közösségben, igazolnod kell az e-mail-címedet.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'A fiókod túl új ahhoz, hogy üzeneteket küldj ebben a közösségben.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Még nem vagy elég régóta tagja ennek a közösségnek ahhoz, hogy üzeneteket küldhess.';

  @override
  String get channelComposerBarrierVerifyEmail => 'E-mail-cím megerősítése';

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
      'Nem sikerült elindítani a felvételt. Engedélyezd a mikrofonhoz való hozzáférést.';

  @override
  String get voiceMessageMicInUse =>
      'Hagyd el a hanghívást a hangüzenet rögzítéséhez.';

  @override
  String get voiceMessageRecordingFailed =>
      'A felvétel sikertelen. Próbáld újra.';

  @override
  String get voiceMessageSendFailed =>
      'Nem sikerült elküldeni a hangüzenetet. Próbáld újra.';

  @override
  String get voiceMessagePlay => 'Lejátszás';

  @override
  String get voiceMessagePause => 'Szüneteltetés';

  @override
  String get voiceMessageSeekForward => 'Ugrás előre';

  @override
  String get voiceMessageSeekBackward => 'Vissza tekerés';

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
  String get chatTextualPreviewSyntaxHighlighting => 'Szintaxiskiemelés';

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
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Spoiler felfedése';

  @override
  String get matureMediaRevealButton => 'Felfedés';

  @override
  String get matureMediaRevealHint => 'Kattints a megjelenítéshez';

  @override
  String get matureContentTitle => 'Felnőtt tartalom';

  @override
  String get matureCommunityTitle => 'Felnőtt tartalmú közösség';

  @override
  String get matureCategoryTitle => 'Felnőtt tartalmú kategória';

  @override
  String get matureChannelTitle => 'Felnőtt tartalmú csatorna';

  @override
  String get communityContentWarningTitle =>
      'Közösségi tartalomra vonatkozó figyelmeztetés';

  @override
  String get categoryContentWarningTitle =>
      'A kategória tartalmára vonatkozó figyelmeztetés';

  @override
  String get channelContentWarningTitle =>
      'A csatorna tartalmára vonatkozó figyelmeztetés';

  @override
  String get defaultContentWarningBody => 'Ez érzékeny tartalmat tartalmaz.';

  @override
  String get matureCommunityBody =>
      'Ez a közösség felnőtt tartalomként van megjelölve, és olyan anyagokat tartalmazhat, amelyek egyes felhasználók számára nem megfelelőek.';

  @override
  String get matureCategoryBody =>
      'Ez a kategória felnőtt tartalommal van megjelölve, és olyan anyagokat tartalmazhat, amelyek egyes felhasználók számára nem megfelelőek.';

  @override
  String get matureChannelBody =>
      'Ez a csatorna felnőtt tartalommal van megjelölve, és olyan anyagokat tartalmazhat, amelyek egyes felhasználók számára nem megfelelőek.';

  @override
  String get matureVoiceChannelBody =>
      'Ez a hangcsatorna felnőtt tartalommal van megjelölve, és olyan anyagokat tartalmazhat, amelyek egyes felhasználók számára nem megfelelőek.';

  @override
  String get matureLinkChannelBody =>
      'Ez a linkcsatorna felnőtt tartalomként van megjelölve, és olyan anyagokat nyithat meg, amelyek egyes felhasználók számára nem megfelelőek.';

  @override
  String get matureCommunityUnavailableBody =>
      'Ez a felnőtt tartalmú közösség nem érhető el a fiókod számára.';

  @override
  String get matureCategoryUnavailableBody =>
      'Ez a felnőtt tartalmú kategória nem érhető el a fiókod számára.';

  @override
  String get matureChannelUnavailableBody =>
      'Ez a felnőtt tartalmú csatorna nem érhető el a fiókod számára.';

  @override
  String get matureContentProceedButton => 'Tovább';

  @override
  String get matureContentUnderstandButton => 'Értem';

  @override
  String get matureContentOpenLinkButton => 'Link megnyitása';

  @override
  String get sensitiveContentFriendDmLabel => 'Közvetlen üzenetek ismerősöktől';

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
  String chatAttachmentExpiresOn(String date) {
    return 'Lejár ekkor: $date';
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
  String get connectionsEmptyTitle => 'Még nincsenek összekapcsolt fiókok';

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
  String get connectionsAddDomainAriaLabel => 'Domainkapcsolat hozzáadása';

  @override
  String get connectionEdit => 'Szerkesztés';

  @override
  String get connectionRemove => 'Eltávolítás';

  @override
  String get connectionVerifiedLabel => 'Ez a kapcsolat ellenőrizve lett.';

  @override
  String get connectionUnverifiedLabel =>
      'Ez a kapcsolat még nincs ellenőrizve.';

  @override
  String get connectionAddTitle => 'Kapcsolat hozzáadása';

  @override
  String get connectionTypeLabel => 'Kapcsolat típusa';

  @override
  String get connectionHandleLabel => 'Azonosító';

  @override
  String get connectionDomainLabel => 'Domain';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Ez a kapcsolat már megvan.';

  @override
  String get connectionConnectBluesky => 'Csatlakozás Bluesky-val';

  @override
  String get connectionContinue => 'Folytatás';

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
  String get connectionCopyHost => 'Gazdagép másolása';

  @override
  String get connectionCopyValue => 'Érték másolása';

  @override
  String get connectionCopied => 'Másolva!';

  @override
  String get connectionTokenFileTitle => 'Tokenfájl kiszolgálása';

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
      'Bárki láthatja ezt a kapcsolatot a profilodon';

  @override
  String get connectionVisibilityFriends => 'Ismerősök';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Engedélyezd, hogy az ismerőseid lássák ezt a kapcsolatot';

  @override
  String get connectionVisibilityCommunityMembers => 'Közösségi tagok';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'A közösségeid tagjai láthatják ezt a kapcsolatot';

  @override
  String get connectionRemoveTitle => 'Fiók összekapcsolásának megszüntetése';

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
  String get lookAndFeelThemeSectionTitle => 'Téma';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Válassz a sötét, a szénszínű vagy a világos megjelenés között.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Nagy dinamikatartomány';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Állítsd be, hogyan jelenjenek meg a HDR-képek a HDR-képes monitorokon.';

  @override
  String get lookAndFeelHdrFullName => 'Teljes dinamikatartomány';

  @override
  String get lookAndFeelHdrFullDescription =>
      'HDR-képek megjelenítése teljes fényerővel és színskálával.';

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
  String get lookAndFeelThemeDarkLegacy => 'Sötét (régi) téma';

  @override
  String get lookAndFeelThemeCoal => 'Szén téma';

  @override
  String get lookAndFeelThemeLight => 'Világos téma';

  @override
  String get lookAndFeelThemeSystem => 'Rendszertéma';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Téma szinkronizálása az eszközökön';

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
  String get lookAndFeelThemeColorsTitle => 'Theme colors';

  @override
  String get lookAndFeelThemeColorsConfigureDescription =>
      'Customize individual theme colors for this device.';

  @override
  String lookAndFeelThemeColorsEditingMode(String mode) {
    return 'Editing $mode';
  }

  @override
  String get lookAndFeelThemeColorsSyncSectionTitle => 'Theme Studio sync';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioLabel =>
      'Use colors from Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioDescription =>
      'When enabled, color changes from Theme Studio on desktop apply on this device. When disabled, this device keeps its own colors.';

  @override
  String get lookAndFeelThemeColorsSyncToStudioLabel =>
      'Send color changes to Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncToStudioDescription =>
      'When enabled, colors you change here sync to Theme Studio on your other devices. When disabled, desktop Theme Studio keeps its own colors.';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioOffBanner =>
      'Desktop Theme Studio color changes will not apply on this device.';

  @override
  String get lookAndFeelThemeColorsEssentialSectionTitle => 'Essential colors';

  @override
  String get lookAndFeelThemeColorsChatBackgroundWallpaperNote =>
      'If you have a chat wallpaper set, you won\'t see this color.';

  @override
  String lookAndFeelThemeColorsResetForMode(String mode) {
    return 'Reset all colors for $mode';
  }

  @override
  String get lookAndFeelThemeColorsResetConfirmTitle => 'Reset theme colors?';

  @override
  String lookAndFeelThemeColorsResetConfirmBody(String mode) {
    return 'This removes your custom color overrides for $mode on this device.';
  }

  @override
  String get lookAndFeelThemeColorsGroupBrandButtons => 'Brand & buttons';

  @override
  String get lookAndFeelThemeColorsGroupChatSurfaces => 'Chat & messages';

  @override
  String get lookAndFeelThemeColorsGroupSidebars => 'Sidebars & navigation';

  @override
  String get lookAndFeelThemeColorsGroupText => 'Text';

  @override
  String get lookAndFeelThemeColorsGroupHeaders => 'Headers';

  @override
  String get lookAndFeelThemeColorsGroupStatus => 'Status';

  @override
  String get lookAndFeelThemeColorsGroupEmbedsMarkup => 'Embeds & mentions';

  @override
  String get lookAndFeelThemeColorsGroupAccentsAlerts => 'Accents & alerts';

  @override
  String get lookAndFeelThemeColorsGroupControls => 'Surfaces & controls';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Chat font scaling';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Adjust the font size in the chat area.';

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
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Csillagmező';

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
      'Felhasználói profilképek elrejtése';

  @override
  String get lookAndFeelInterfaceTitle => 'Felület';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Felület elemeinek és viselkedésének testreszabása.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'A csatornalista gépelésjelzői';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Válaszd ki, hogyan jelenjenek meg a gépelési jelzők a csatornalistában, amikor valaki gépel egy csatornában.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Gépelésjelző + profilképek';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Gépelésjelző megjelenítése profilképekkel a csatornalistában';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => 'Csak gépelésjelző';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Csak a gépelésjelző megjelenítése, profilképek nélkül';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Rejtett';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Ne jelenjenek meg a gépelési jelzők a csatornalistában';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Gépelés mutatása a kiválasztott csatornán';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Ha le van tiltva (alapértelmezett), a gépelési jelzők nem jelennek meg az éppen megtekintett csatornán.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'általános';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Billentyűzetsúgók';

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
      'A némított csatornák olvasatlanjelzőjének viselkedése a csatornalistákban.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Olvasatlan jelzése némított csatornákon';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Ha engedélyezve van, a némított csatornák halvány olvasatlan jelzőt mutatnak a bal oldalon. Az említések továbbra is megjelennek e beállításoktól függetlenül.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Most aktívak';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Szabályozd, hogyan jelenjen meg a Most aktív az alkalmazásban.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Most aktívak megjelenítése a kezdőképernyőn';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Jelenítsd meg a Most aktívak részt a kezdőképernyőn, hogy lásd a hangbeszélgetésekben részt vevő ismerőseidet. Előnézetet kapsz, láthatod a csatornát és a résztvevőket, és gyorsan csatlakozhatsz.';

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
  String get favoritesWelcomeTitle => 'Üdv a kedvencek között';

  @override
  String get favoritesWelcomeDescription =>
      'Személyes tered, ahol gyorsan elérheted a kedvenc csatornáidat, közvetlen üzeneteidet és csoportjaidat. Nyomd meg a csillagot bármelyik csatornán, hogy hozzáadd ide.';

  @override
  String get favoritesWelcomeTip => 'Nem neked való? Bármikor kikapcsolhatod.';

  @override
  String get favoritesDisableButton => 'Kedvencek kikapcsolása';

  @override
  String get favoritesAddedToast => 'Hozzáadva a kedvencekhez';

  @override
  String get favoritesRemovedToast => 'Eltávolítva a kedvencek közül';

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
  String get favoritesShowMutedChannels => 'Némított csatornák megjelenítése';

  @override
  String get favoritesSetNickname => 'Becenév beállítása';

  @override
  String get favoritesNicknameLabel => 'Becenév';

  @override
  String get favoritesSaveNickname => 'Becenév mentése';

  @override
  String get favoritesMoveToCategory => 'Áthelyezés kategóriába';

  @override
  String get favoritesUncategorized => 'Besorolatlan';

  @override
  String get favoritesOtherCategory => 'Egyéb';

  @override
  String get favoritesRemoveFromFavorites => 'Eltávolítás a kedvencekből';

  @override
  String get favoritesAddToFavorites => 'Hozzáadás a kedvencekhez';

  @override
  String get favoritesAddToSavedMedia => 'Hozzáadás a mentett médiához';

  @override
  String get favoritesRemoveFromSavedMedia =>
      'Eltávolítás a mentett média közül';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Hozzáadás az URL-alapú GIF-kedvencekhez';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Eltávolítás az URL-en alapuló GIF-kedvencek közül';

  @override
  String get savedMediaAddTitle => 'Hozzáadás a mentett médiához';

  @override
  String get savedMediaFormNameLabel => 'Név';

  @override
  String get savedMediaFormNameHint => 'Szuper médiatartalmam';

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
      'Alapértelmezés szerint elrejted a némított csatornákat?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Azokban a közösségekben, amelyekhez ezután csatlakozol, a némított csatornák automatikusan rejtve lesznek. Szeretnéd ezt a beállítást az összes meglévő közösségedre is alkalmazni?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Kikapcsolod a némított csatornák alapértelmezett elrejtését?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Azokban a közösségekben, amelyekhez ezután csatlakozol, a némított csatornák többé nem lesznek automatikusan elrejtve. Szeretnéd az összes meglévő közösségedben is megjeleníteni a némított csatornákat?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Alkalmazás az összes közösségre';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Megjelenítés az összes közösségben';

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
    return 'Közvetlenül a(z) $productName felületére történő feltöltéskor';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Linkelőnézetek';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Szabályozd, hogyan jelenjenek meg a weboldal linkek előnézetei a csevegésben';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Beágyazott tartalmak és webhelylinkek előnézetének megjelenítése';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reakciók';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Emoji reakciók beállítása üzenetekhez';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Emojireakciók megjelenítése az üzeneteken';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoilertartalom';

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
      'Spoiler tartalom megjelenítése kattintásra';

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
      'A spoilertartalom mindig legyen látható';

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
      'GIF-ek automatikus küldése kiválasztáskor';

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
      'Alapértelmezett emojik megjelenítése a kifejezés-automatikus kiegészítésben';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Egyéni emojik megjelenítése az automatikus kiegészítésben';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Matricák megjelenítése az automatikus kiegészítésben';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Mentett média megjelenítése a kifejezés-automatikus kiegészítésben';

  @override
  String get accessibilitySaturationTitle => 'Telítettség';

  @override
  String get accessibilityVisualGroupTitle => 'Vizuális';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Mindig aláhúzza a hivatkozásokat';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Alternatív szöveg megjelenítése a képeken';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Alternatív szöveg megjelenítése a képek alatt, ha elérhető.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Áthúzott szöveg halványítása';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM-üzenetek előnézete';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'DM-üzenetek előnézeti módja';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Összes üzenet';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Üzenetelőnézetek megjelenítése minden közvetlen beszélgetésnél';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Csak olvasatlan DM-ek';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Üzenetelőnézetek megjelenítése csak az olvasatlan üzeneteket tartalmazó közvetlen beszélgetéseknél';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Nincs';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Ne jelenjenek meg üzenetelőnézetek a DM-listában';

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
      'Válaszd ki a felolvasás sebességét.';

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
      'Az Esc billentyűvel léphetsz ki a billentyűzetes módból';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Billentyűparancsok megjelenítése a helyi menüben';

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
      'Animált emojik lejátszása';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'GIF-ek automatikus lejátszása';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'GIF-ek automatikus lejátszása, ha a(z) $productName fókuszban van';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Lejátszás a csökkentett mozgás ellenére.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'A csökkentett mozgás miatt szünetel. Kapcsold be az animált emojik folyamatos lejátszásához.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'A csökkentett mozgás miatt szünetel. Kapcsold be a GIF-ek folyamatos lejátszásához.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Matricaanimációk';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Matricaanimáció beállításai';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Folyamatos animáció';

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
      'Használd az eszközöd rendszerének mozgáscsökkentési beállítását, vagy szabd testre alább.';

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
      'Az animált emojik, GIF-ek és matricák működését az Animáció lapon szabályozhatod.';

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
  String get ttsSubstitutionSpoiler => 'spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '$emojiName emoji';
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
    return '$username üzenetet rögzített ebben a csatornában.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username hozzáadta $userName felhasználót a csoporthoz.';
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
    return '$username eltávolította $userName felhasználót a csoportból.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username eltávolított valakit a csoportból.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username megváltoztatta a csatorna nevét: $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username megváltoztatta a csatorna nevét.';
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
  String get systemCallDurationMinute => 'egy perc';

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
    return 'Az üzenet megtekintéséhez frissítsd a(z) $productName alkalmazást.';
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
      'Csatlakozás (egyéb kapcsolatok megtartása)';

  @override
  String get voiceConnectionConfirmDoNothing => 'Nem csatlakozom';

  @override
  String get voiceJoinFailedTitle => 'Nem sikerült csatlakozni a hanghíváshoz';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Nem tudtuk leválasztani a többi eszközödet. Próbáld meg újra egy pillanat múlva.';

  @override
  String get voiceChannelJoin => 'Csatlakozás a hangcsatornához';

  @override
  String get voiceCallJoin => 'Csatlakozás a híváshoz';

  @override
  String get voiceChannelJoinConnect => 'Csatlakozás hangcsatornához';

  @override
  String get voiceChannelNoConnectPermission =>
      'Nincs jogosultságod csatlakozni ehhez a hangcsatornához';

  @override
  String get voiceChannelE2eeEncrypted =>
      'A mikrofon-, kamera- és képernyőmegosztás során továbbított adatok végpontok közötti titkosítással vannak védve.';

  @override
  String get voiceCallE2eeEncrypted =>
      'A mikrofon-, kamera- és képernyőmegosztás során továbbított adatok végpontok közötti titkosítással vannak védve.';

  @override
  String get voiceChannelE2eeBroken =>
      'A végpontok közötti titkosítás nem érhető el, mert a hangcsatorna egyik résztvevőjének kliense nem támogatja.';

  @override
  String get voiceCallE2eeBroken =>
      'A végpontok közötti titkosítás nem érhető el, mert a hívás egyik résztvevőjének kliense nem támogatja.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Ezt az klienst frissíteni kell a titkosított hívásba való belépés előtt.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Nem sikerült elindítani a mikrofont. Továbbra is a hívásban vagy.';

  @override
  String get voiceChannelStatusConnecting => 'Csatlakozás…';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobileszköz';

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
  String get voiceParticipantTooltipDeafened => 'Hang kikapcsolva';

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
  String get voiceControlDeafen => 'Hang kikapcsolása';

  @override
  String get voiceControlUndeafen => 'Hang visszakapcsolása';

  @override
  String get voiceControlVideo => 'Videó';

  @override
  String get voiceControlFlipCamera => 'Kamera váltása';

  @override
  String get voiceControlScreenShare => 'Képernyőmegosztás';

  @override
  String get voiceScreenShareNotificationText => 'Megosztod a képernyődet.';

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
  String get voiceConnectionJitterLabel => 'Jitter';

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
  String get voiceParticipantMenuFocus => 'Felhasználó kiemelése';

  @override
  String get voiceParticipantMenuUnfocus => 'Kiemelés megszüntetése';

  @override
  String get voiceParticipantMenuCommunityMute =>
      'Mikrofon némítása közösségi szinten';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Hang kikapcsolása közösségi szinten';

  @override
  String get voiceParticipantMenuUserVolume => 'Felhasználó hangereje';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream hangereje';

  @override
  String get voiceParticipantMenuStopStreaming => 'Streamelés leállítása';

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
  String get voiceOutputRouteSpeaker => 'Hangszóró';

  @override
  String get voiceOutputRouteEarpiece => 'Beszédhangszóró';

  @override
  String get voiceOutputRouteHeadset => 'Fejhallgató';

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
  String get voiceWatchStream => 'Adás megtekintése';

  @override
  String get voiceStopWatching => 'Nézés leállítása';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Leállítja az aktuális stream megtekintését';

  @override
  String get voiceOwnScreenShareTitle => 'Te közvetítesz';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'A streamed élőben látható a résztvevők számára.';

  @override
  String get voiceLiveBadge => 'Élő';

  @override
  String get dmVoiceViewCall => 'Hívás megtekintése';

  @override
  String get dmVoiceCallFullScreen => 'Teljes képernyő';

  @override
  String get dmVoiceCallFullScreenTooltip =>
      'Hívás megnyitása teljes képernyőn';

  @override
  String get dmVoiceStripStatusConnecting => 'Csatlakozás…';

  @override
  String get dmVoiceStripStatusInCall => 'Hívásban';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Hanghívás';

  @override
  String get dmVoiceCallBarConnecting => 'Csatlakozás…';

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
  String get notificationsBookmarksTooltip => 'Mentett üzenetek';

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
      'Összes közösségi említés belefoglalása';

  @override
  String get notificationsNoUnreadTitle => 'Nincsenek olvasatlan üzenetek';

  @override
  String get notificationsNoUnreadBody => 'Mindent elolvastál.';

  @override
  String get notificationsNoMentionsTitle => 'Nincsenek legutóbbi említések';

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
  String get notificationsMarkAsRead => 'Megjelölés olvasottként';

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
      'Az üzenetedet nem sikerült kézbesíteni. Közvetlen üzenetek küldéséhez fejezd be a fiókod regisztrációját.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Az üzenetedet nem sikerült kézbesíteni. Üzenetek küldéséhez fejezd be a fiókod regisztrációját.';

  @override
  String get chatSendFailureContentBlocked =>
      'Az üzenetedet nem sikerült kézbesíteni, mert a biztonsági rendszereink megjelölték. Ha úgy gondolod, ez tévedés, kérjük, vedd fel a kapcsolatot az ügyfélszolgálattal.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'Az üzenetedet nem sikerült kézbesíteni, mert a biztonsági rendszereink megjelölték. Ha úgy gondolod, ez tévedés, kérjük, vedd fel a kapcsolatot ennek a példánynak az adminisztrátoraival.';

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
      'Ismerősök és közvetlen üzenetek';

  @override
  String get privacyDashboardActivitySharingSection => 'Tevékenységmegosztás';

  @override
  String get privacyDashboardSensitiveContentSection => 'Érzékeny tartalom';

  @override
  String get privacyDashboardDataExportSection => 'Adatexportálás';

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
      'A teljes profilod látható az ismerőseid és a közösségeid összes tagja számára';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Csak ismerősök és kis közösségek';

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
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Ismerősök ismerősei';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Közösségi tagok';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Közvetlen üzenetek';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Közvetlen üzenetek engedélyezése a közösség tagjaitól';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Közvetlen üzenetek engedélyezése közösségi botoktól';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Bejövő hívások';

  @override
  String get privacyDashboardAllowedCallers => 'Engedélyezett hívók';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Minden bejövő hívás letiltása';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Csak a barátaid hívhassanak (ajánlott)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Engedélyezd a barátoknak és további, általad választott csoportoknak';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Engedélyezd bárkinek, hogy felhívjon, akár idegeneknek is';

  @override
  String get privacyDashboardAdditionalGroups => 'További csoportok';

  @override
  String get privacyDashboardRingBehavior => 'Csengetés működése';

  @override
  String get privacyDashboardSilentCalls =>
      'Csengetés nélküli hívások mindenkitől';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Ki vehet fel csoportos beszélgetésekbe';

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
  String get privacyDashboardVoiceActivityTitle =>
      'Hangtevékenység a Most aktívak részben';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Hangtevékenység megosztása ismerősökkel';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Megosztod a hangtevékenységedet az összes ismerősöddel?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Leállítod a hangtevékenységed megosztását az összes ismerősöddel?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Megosztod a hangtevékenységedet az összes ismerősöddel, a később hozzáadottakkal is. Erről mindannyian frissítést kapnak, és a beállítást csak 24 óra múlva módosíthatod újra.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Leállítod a hangtevékenységed megosztását az összes ismerősöddel, a később hozzáadottakkal is. Erről mindannyian frissítést kapnak, és a beállítást csak 24 óra múlva módosíthatod újra.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Igen, megosztás az összes ismerőssel';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Igen, leállítom a megosztást';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Újra elérhető $time múlva';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Hangtevékenység megosztása frissítve';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Nem sikerült frissíteni a hangtevékenység megosztását';

  @override
  String get privacyDashboardDataExportDesc =>
      'Készíts letölthető archívumot a fiókadataidról, beleértve az üzeneteket és a mellékletek URL-jeit. A legtöbben mindent szeretnének exportálni, de alább szűkítheted a kört.';

  @override
  String get privacyDashboardExportMyData => 'Adataim exportálása';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Véglegesen törli a közvetlen és csoportos beszélgetésekben, valamint a közösségekben küldött üzeneteidet. A folyamat a háttérben fut, és közvetlen üzenetben értesítünk, ha elkészült.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Üzeneteim törlése';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Engedélyezed a közvetlen üzeneteket a közösség tagjaitól?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Letiltod a közvetlen üzeneteket a közösség tagjaitól?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Engedélyezed, hogy a botok közvetlen üzeneteket küldjenek neked?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Megtiltod, hogy a botok közvetlen üzeneteket küldjenek neked?';

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
  String get privacyDashboardDmConfirmBlockAll => 'Letiltás minden közösségben';

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
      'Exportáld az összes valaha elküldött üzenetedet, valamint az összes fiókbeállításodat, tagságodat és metaadatodat.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Egyéni kiválasztás';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Válaszd ki, mely beszélgetéstípusokat, közösségeket és időszakot szeretnéd belefoglalni az archívumba.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Válaszd ki, mit szeretnél belefoglalni';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Válaszd ki, mely beszélgetéstípusok üzeneteit szeretnéd törölni.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Csak azok a helyek, amikhez már nincs hozzáférésem';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Csak azokból a közösségekből és csoportos beszélgetésekből törölje az üzeneteidet, amelyeket elhagytál, vagy amelyekből eltávolítottak.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Mely beszélgetések';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Válaszd ki, milyen típusú beszélgetéseket szeretnél belefoglalni.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Nyitott közvetlen üzenetek';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Bezárt közvetlen beszélgetések';

  @override
  String get privacyDashboardDataRequestKindGroupDms =>
      'Csoportos beszélgetések';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Közösségek';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Mely közösségek';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Közösségi szűrő';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Minden, kivéve a kijelölteket';

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
  String get privacyDashboardDataRequestAllTime => 'Teljes időszak';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Egyéni időtartomány';

  @override
  String get privacyDashboardDataRequestStartDate => 'Kezdő dátum';

  @override
  String get privacyDashboardDataRequestEndDate => 'Befejezés dátuma';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Hagyd üresen bármelyik mezőt, ha a tartomány adott végét nem szeretnéd korlátozni.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Válassz ki legalább egy beszélgetéstípust, amelyre a művelet kiterjedjen.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'A kezdő dátumnak korábbinak kell lennie, mint a befejező dátum.';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'Áttekintés és megerősítés';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Letölthető archívumot készítünk az összes valaha elküldött üzenetedből, és e-mailben értesítünk, ha elkészült. Az e-mailben található letöltési link 7 nap után lejár.';

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
      'Bezárt közvetlen beszélgetések';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Közvetlen beszélgetések (megnyitottak és bezártak)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms =>
      'Csoportos beszélgetések';

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
  String get doubleTapReactionHint =>
      'Koppints duplán egy üzenetre, hogy reagálj ezzel:';

  @override
  String get doubleTapReactionEdit => 'Szerkesztés';

  @override
  String get doubleTapReactionEditTitle => 'Alapértelmezett szerkesztése';

  @override
  String get doubleTapReactionEditSubtitle =>
      'Válassz dupla koppintásos emojit';

  @override
  String get messagesMediaDoubleTapSectionTitle => 'Double tap';

  @override
  String get messagesMediaDoubleTapSectionDescription =>
      'Choose what happens when you double tap a message.';

  @override
  String get messagesMediaDoubleTapActionLabel => 'Double tap action';

  @override
  String get messagesMediaDoubleTapActionReactName => 'Add reaction';

  @override
  String get messagesMediaDoubleTapActionReactDescription =>
      'Adds your default double-tap emoji as a reaction.';

  @override
  String get messagesMediaDoubleTapActionEditName => 'Edit message';

  @override
  String get messagesMediaDoubleTapActionEditDescription =>
      'Opens the editor on messages you sent. Other messages are unchanged.';

  @override
  String get messagesMediaDoubleTapActionNoneName => 'Nothing';

  @override
  String get messagesMediaDoubleTapActionNoneDescription =>
      'Double tap is disabled.';

  @override
  String get chatMessageEdit => 'Üzenet szerkesztése';

  @override
  String get chatMessageReply => 'Válasz';

  @override
  String get notificationReplyPlaceholder => 'Üzenet';

  @override
  String get notificationReplyFailed => 'Nem sikerült elküldeni a választ';

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
      'Az üzenetküldés le van tiltva ebben a közösségben';

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
  String get chatMessageUnpin => 'Üzenet rögzítésének feloldása';

  @override
  String get chatMessageUnpinIt => 'Rögzítés feloldása';

  @override
  String get chatMessageBookmark => 'Üzenet mentése';

  @override
  String get chatMessageRemoveBookmark =>
      'Eltávolítás a mentett üzenetek közül';

  @override
  String get chatMessageMarkAsUnread => 'Olvasatlanként jelölés';

  @override
  String get chatMessageCopyMessageLink => 'Üzenetlink másolása';

  @override
  String get chatMessageOpenLink => 'Link megnyitása';

  @override
  String get chatMessageCopyLink => 'Link másolása';

  @override
  String get chatMessageCopyMessageId => 'Üzenetazonosító másolása';

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
  String get chatReactionsSheetEmpty => 'Még senki sem reagált így.';

  @override
  String get chatReactionAddFailed => 'Reakció hozzáadása sikertelen';

  @override
  String get chatReactionRemoveFailed => 'A reakció eltávolítása sikertelen';

  @override
  String get chatMessageReport => 'Üzenet bejelentése';

  @override
  String get reportFlowTitleMessage => 'Üzenet bejelentése';

  @override
  String get reportFlowTitleUserProfile => 'Profil bejelentése';

  @override
  String get reportFlowSummaryTitle => 'A bejelentésed ellenőrzése';

  @override
  String get reportFlowSummarySubtitle =>
      'Ellenőrizd, hogy minden rendben van-e, mielőtt elküldöd.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Csak olyat jelents be, amiről őszintén úgy gondolod, hogy megszegi a szabályokat. A bejelentésekkel való visszaélés ellentétes a $guidelines.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'közösségi irányelvek';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Csak olyat jelents be, amiről őszintén úgy gondolod, hogy megszegi a szabályokat, és kérjük, ne küldd el ugyanazt a bejelentést kétszer.';

  @override
  String get reportFlowSelectedMessage => 'Az általad bejelentett üzenet';

  @override
  String get reportFlowSelectedUser => 'Az általad bejelentett profil';

  @override
  String get reportFlowReportCategory => 'A válaszaid';

  @override
  String get reportFlowSubmit => 'Bejelentés küldése';

  @override
  String get reportFlowBack => 'Vissza';

  @override
  String get reportFlowNext => 'Tovább';

  @override
  String get reportFlowDone => 'Kész';

  @override
  String get reportFlowThankYouTitle => 'Bejelentés elküldve';

  @override
  String get reportFlowThankYouNoReportTitle => 'Köszönjük, hogy jelezted';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'A(z) $productName biztonsági csapata áttekinti a bejelentésedet. Nem fogjuk felfedni, hogy tőled érkezett.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Köszönjük, hogy szóltál. Ez önmagában nem sérti a szabályainkat, ezért nem küldtünk bejelentést. Ha valakit célba vesz, vagy gyalázkodó szavakat használ, jelentsd be újra, és válaszd a „Bántalmazó vagy káros tartalom” lehetőséget.';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Köszönjük, hogy szóltál. Ez önmagában nem sérti a szabályainkat, ezért nem küldtünk bejelentést.';

  @override
  String get reportFlowMoreYouCanDo => 'A lehetőségeid';

  @override
  String reportFlowBlockName(String name) {
    return '$name letiltása';
  }

  @override
  String get reportFlowBlockDescription =>
      'Elrejti az üzeneteit, és megakadályozza, hogy üzenetet küldjön neked';

  @override
  String get reportFlowBlockButton => 'Letiltás';

  @override
  String get reportFlowBlockedButton => 'Letiltva';

  @override
  String get reportFlowUrgentBanner =>
      'Ha valaki azonnali veszélyben van, először vedd fel a kapcsolatot a helyi segélyhívóval.';

  @override
  String get reportFlowLoadFailed =>
      'Nem sikerült betölteni a bejelentési űrlapot.';

  @override
  String get reportFlowTryAgain => 'Újra';

  @override
  String get reportFlowOutdated =>
      'A bejelentési űrlap megváltozott. Kérjük, kezdd újra.';

  @override
  String get reportFlowAlreadyReported => 'Már bejelentetted ezt az üzenetet.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Ezt a profilt ma már bejelentetted.';

  @override
  String get reportFlowRateLimited =>
      'Túl gyorsan küldöd a bejelentéseket. Próbáld újra később.';

  @override
  String get reportFlowSubmitFailed =>
      'A bejelentésedet nem sikerült elküldeni. Próbáld újra.';

  @override
  String get reportFlowAccountSetupRequired =>
      'A bejelentések küldéséhez fejezd be a fiókod regisztrációját, és erősítsd meg az e-mail-címedet.';

  @override
  String get chatMessageSuppressEmbeds => 'Beágyazott tartalmak elrejtése';

  @override
  String get chatMessageUnsuppressEmbeds =>
      'Beágyazott tartalmak megjelenítése';

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
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

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
  String get chatReplyAttachedMedia => 'Az üzenet médiamellékletet tartalmaz';

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
      'Felülbírálod az említési beállítást?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname szeretné, ha @említést kapna a válaszokban. Mégis elküldöd említés nélkül?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname nem szeretné, ha @említéssel válaszolnának neki. Elküldöd az említéssel együtt?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Beállítás mellőzése';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Kattints ide, ha nem szeretnéd értesíteni a felhasználót, akinek válaszolsz.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Kattints ide, hogy értesítést küldj annak a felhasználónak, akinek válaszolsz.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Válaszolt felhasználó említése';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Válasz visszavonása';

  @override
  String get chatEditMessageHint => 'Üzenet szerkesztése';

  @override
  String get chatEditNoChanges => 'Nincs menthető változás';

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
  String get mediaViewerClose => 'Médiafájl-nézegető bezárása';

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
  String get chatAttachmentVideoProgress => 'Videó előrehaladása';

  @override
  String get chatVideoPlaybackFailed => 'A videó nem játszható le.';

  @override
  String get chatImageCouldNotLoad => 'Nem sikerült betölteni a képet.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Az ezzel a szerepkörrel rendelkező, a csatorna megtekintésére jogosult felhasználók értesítése.';

  @override
  String get composerAutocompleteSuggestions => 'Javaslatok';

  @override
  String get composerAutocompleteCommandsHeading => 'Parancsok';

  @override
  String get composerAutocompleteChoicesHeading => 'Választási lehetőségek';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Opcionális argumentumok';

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
      'Ezt fűzi hozzá az üzenetedhez: (╯°□°)╯︵ ┻━┻.';

  @override
  String get composerCommandUnflipDescription =>
      'Ezt fűzi hozzá az üzenetedhez: ┬─┬ ノ( ゜-゜ノ).';

  @override
  String get composerCommandMeDescription =>
      'Műveleti üzenet küldése (dőlt betűvel).';

  @override
  String get composerCommandSpoilerDescription =>
      'Spoilerüzenet küldése (spoilerjelölők közé zárva).';

  @override
  String get composerCommandTtsDescription => 'Szövegfelolvasó üzenet küldése.';

  @override
  String get composerCommandNickDescription =>
      'Változtasd meg a beceneved ebben a közösségben.';

  @override
  String get composerCommandKickDescription =>
      'Tag kirúgása ebből a közösségből.';

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
      'A tag legutóbbi üzeneteiből törlendő időszak.';

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
    return 'Megváltoztattad a becenevedet ebben a közösségben. Korábbi becenév: **$previousNickname**. Új becenév: **$newNickname**.';
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
      'Új közösség létrehozása vagy csatlakozás egy meglévőhöz.';

  @override
  String get addGuildCreateCommunity => 'Közösség létrehozása';

  @override
  String get addGuildJoinCommunity => 'Csatlakozás a közösséghez';

  @override
  String get addGuildImportDiscordTemplate => 'Discord sablon importálása';

  @override
  String get addGuildJoinTitle => 'Csatlakozás közösséghez';

  @override
  String get addGuildJoinDescription =>
      'Írd be a meghívólinket a közösséghez való csatlakozáshoz.';

  @override
  String get addGuildInviteLinkLabel => 'Meghívólink';

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
      'Hozz létre egy közösséget, ahol az ismerőseiddel cseveghetsz.';

  @override
  String get addGuildCreateNameLabel => 'Közösség neve';

  @override
  String get addGuildCreateSubmit => 'Közösség létrehozása';

  @override
  String get addGuildCreateFailed =>
      'Nem sikerült létrehozni a közösséget. Kérlek, próbáld újra.';

  @override
  String get addGuildCreateClaimTitle => 'Fejezd be a fiókod regisztrációját';

  @override
  String get addGuildCreateClaimDescription =>
      'Közösség létrehozása előtt be kell fejezned a fiókod regisztrációját.';

  @override
  String get addGuildCreateVerifyTitle => 'E-mail-cím megerősítése';

  @override
  String get addGuildCreateVerifyDescription =>
      'Közösség létrehozása előtt meg kell erősítened az e-mail-címedet.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Új közösség létrehozásakor nem támogatottak az animált ikonok. Használj statikus képet.';

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
  String get addGuildCreateIconLabel => 'Közösség ikonja';

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
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Összes reakció eltávolítása';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Biztosan el szeretné távolítani az összes reakciót erről az üzenetről?';

  @override
  String get chatMessagePinConfirm => 'Rögzítés';

  @override
  String get chatMessagePinConfirmDescription =>
      'Rögzítsd ezt az üzenetet a csatornában, hogy mindenki láthassa.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Üzenet rögzítésének feloldása';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Visszaküldöd ezt a rögzítést az időben?';

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
      'A rögzített üzenetek itt jelennek meg.';

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
  String get channelDetailsDmSettingsTitle => 'DM-beállítások';

  @override
  String get channelDetailsInvitePeople => 'Emberek meghívása';

  @override
  String get channelDetailsCopyLink => 'Link másolása';

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
  String get channelSettingsEditCategory => 'Kategória szerkesztése';

  @override
  String get channelSettingsTabOverview => 'Áttekintés';

  @override
  String get channelSettingsTabPermissions => 'Jogosultságok';

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
  String get categoryCollapseAllCategories => 'Összes kategória összecsukása';

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
      'Próbáld újra egy kis idő múlva.';

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
  String get channelSettingsUnknownRole => 'Ismeretlen szerepkör';

  @override
  String get channelSettingsUnknownUser => 'Ismeretlen felhasználó';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Egyéni hozzáférési jogosultságok';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Hozzáférés szerkesztése ehhez: $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Vissza az egyéni jogosultságokhoz';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Alapértelmezett hozzáférés beállítása ehhez a csatornához';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Egyéni jogosultságok beállítása ehhez a szerepkörhöz';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Egyéni jogosultságok beállítása ehhez a taghoz';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Jogosultságok keresése…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Csatorna-hozzáférés frissítve';

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
      'A csatorna szinkronizálva van a szülőkategóriával';

  @override
  String get channelSettingsPermissionsAddOverride =>
      'Egyéni jogosultságok hozzáadása';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Szerepkörök vagy tagok keresése…';

  @override
  String get channelSettingsDeleteInvite => 'Meghívó törlése';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Törlöd ezt a meghívót? A művelet nem vonható vissza.';

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
      'A csatorna meghívólinkjeinek kezelése.';

  @override
  String get channelSettingsInvitesCreate => 'Meghívó létrehozása';

  @override
  String get channelSettingsInvitesEmpty => 'Nincsenek meghívólinkek';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Ennek a csatornának még nincsenek meghívólinkjei. Hozz létre egyet, hogy meghívhass embereket a csatornára.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Hiba történt a csatorna meghívólinkjeinek betöltésekor. Próbáld újra.';

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
      'Hiba történt a csatorna webhookjainak betöltésekor. Próbáld újra.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Létrehozta: $creator ekkor: $date';
  }

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
  String get channelSettingsWebhooksCopyUrl => 'Webhook URL-jének másolása';

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
      'Próbáld újra egy kis idő múlva.';

  @override
  String get channelMenuOpenChat => 'Csevegés megnyitása';

  @override
  String get channelMenuDuplicateChannel => 'Csatorna duplikálása';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Felnőtt tartalomra vonatkozó beleegyezés állapotának visszaállítása';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Törlöd az üzeneteidet ebből a csatornából?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Ez véglegesen törli az összes üzenetet, amit valaha küldtél ebben a csatornában. Ez a művelet nem vonható vissza.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Üzeneteim törlése';

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
  String get channelHeaderSearchFiltersTitle => 'Keresési szűrők';

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
      'a melléklet fájlnevének része';

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
  String get channelDetailsUnpinMessage => 'Üzenet rögzítésének feloldása';

  @override
  String get channelDetailsCopyMessageLink => 'Üzenetlink másolása';

  @override
  String get channelDetailsCopyMessageId => 'Üzenetazonosító másolása';

  @override
  String get channelDetailsMessageUnpinned => 'Üzenet rögzítése feloldva';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Jelenlegi közösség';

  @override
  String get channelDetailsSearchScopeCurrentDm =>
      'Aktuális közvetlen beszélgetés';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Összes közösség';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild =>
      'Csak közvetlen beszélgetések';

  @override
  String get channelDetailsSearchScopeAllDms => 'Összes közvetlen beszélgetés';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Csak nyitott DM-ek';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Nyitott közvetlen üzenetek';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Összes közvetlen beszélgetés + közösség';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Nyitott DM-ek + közösségek';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Keresés csak az aktuális közösségben';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Keresés csak az aktuális közvetlen beszélgetésben';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Az összes, jelenleg tagja általad elért közösségben';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Csak az összes közvetlen beszélgetésben, amelyben valaha részt vettél';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Az összes közvetlen beszélgetésben, amelyben valaha részt vettél';

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
  String get channelDetailsSearchSortNewest => 'Legújabb elöl';

  @override
  String get channelDetailsSearchSortOldest => 'Először a legrégebbiek';

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
  String get channelDetailsSearchContentImage => 'Képfeltöltés';

  @override
  String get channelDetailsSearchContentVideo => 'Videófeltöltés';

  @override
  String get channelDetailsSearchContentAudio => 'Hangfeltöltés';

  @override
  String get channelDetailsSearchContentFile => 'Fájlfeltöltés';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Linkelőnézet vagy beágyazott tartalom';

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
      'Lekért előnézetek és részletes beágyazott tartalmak, feltöltések nélkül';

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
      'A privát tered gondolatokhoz és emlékeztetőkhöz';

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
      'Az animált ikonok nem támogatottak. Használj statikus képet.';

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
  String get groupDmInvalidImage => 'Érvénytelen kép';

  @override
  String get groupDmInvalidImageBody =>
      'Ez a kép érvénytelen. Próbálj másikat.';

  @override
  String get groupDmAddFriends => 'Hozzáadás';

  @override
  String get groupDmOrSendInvite => 'vagy küldj meghívót egy ismerősödnek:';

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
  String get groupDmGroupFull =>
      'Ez a csoport megtelt. Távolíts el valakit, mielőtt további személyeket adnál hozzá.';

  @override
  String get groupDmRateLimited =>
      'Túl gyorsan haladsz. Várj egy pillanatot, és próbáld újra.';

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
      'Nem sikerült betölteni a meghívókat. Próbáld újra.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Visszavonod ezt a meghívót? Ez nem vonható vissza.';

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
    return 'Üzenet ide: #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Üzenet ide: @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Üzenet ide: $groupName';
  }

  @override
  String get groupDmComposerHint => 'Üzenetcsoport';

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
  String get personalNotesPrivateSpace => 'A privát tered';

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
  String get userSettingsSearchClear => 'Keresés törlése';

  @override
  String get userSettingsSearchNoResults => 'Nem található beállítás';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Biztonság és bejelentkezés';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Ajándékok';

  @override
  String get giftSettingsClaimAccountTitle =>
      'Fejezd be a fiókod regisztrációját';

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
      'Nem sikerült betölteni az ajándékokat';

  @override
  String get giftSettingsLoadFailedDescription => 'Próbáld újra később.';

  @override
  String get giftSettingsTryAgain => 'Újra';

  @override
  String get giftSettingsGiftUrl => 'Ajándék URL-je';

  @override
  String get giftSettingsCopy => 'Másolás';

  @override
  String get giftSettingsCopied => 'Másolva';

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
  String get giftSettingsShareWithFriend => 'Megosztás egy ismerőssel';

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
  String get premiumUpgradeNow => 'Csomagváltás most';

  @override
  String get premiumBuyGift => 'Ajándék vásárlása';

  @override
  String get premiumOneYearGift => '1 éves ajándék';

  @override
  String get premiumOneMonthGift => '1 hónapos ajándék';

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
  String get premiumReadyToUpgrade => 'Készen állsz a csomagváltásra?';

  @override
  String get premiumReadyToBuyGift => 'Készen állsz egy ajándék vásárlására?';

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
      'Az előnyöket a következő megújítási dátumig megtartod. Ezután 3 napos türelmi időszak áll rendelkezésedre, hogy újra előfizess és megőrizd az előfizetői előzményeidet.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Előfizetés lemondása';

  @override
  String get premiumPurchaseHistoryTitle => 'Vásárlási előzmények';

  @override
  String get premiumPurchaseHistoryDescription =>
      'A legutóbbi számláid. Az előfizetésed fizetési módjának módosításához adj hozzá vagy válassz ki egyet a számlázási portálon, és állítsd be alapértelmezettként.';

  @override
  String get premiumManagePaymentMethods => 'Fizetési módok kezelése';

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
  String get premiumGiftGraceEnded =>
      'Ajándékidőszakod lejárt. Iratkozz fel, hogy megtarthasd a(z) Plutonium előfizetést.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Most terhelünk. A fennmaradó ajándékidő a fizetett időszak után kerül hozzáadásra, így nem vész el.';

  @override
  String get premiumComparisonFeatureColumn => 'Funkció';

  @override
  String get premiumDisclaimerRefund =>
      'A fizetéstől számított 3 napon belül, 30 naponta egyszer önkiszolgáló visszatérítés kérhető. Az előfizetés visszatérítése megszünteti az előfizetést. Az EU/EGT vásárlói fizetéskor lemondanak a 14 napos elállási jogukról, hogy azonnal hozzáférhessenek a tartalomhoz. Banki visszaterhelés helyett használd az alkalmazáson belüli visszatérítési gombot. A banki visszaterhelés a fiókod végleges korlátozását eredményezheti. A fizetést a Stripe biztonságosan kezeli. A teljes kártyaszámodat soha nem látjuk.';

  @override
  String get premiumTermsOfService => 'Szolgáltatási feltételek';

  @override
  String get premiumPrivacyPolicy => 'Adatvédelmi irányelvek';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Nem sikerült elindítani a fizetést';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Hiba történt a fizetés elindításakor. Próbáld újra egy kis idő múlva.';

  @override
  String get premiumPlanUnavailable =>
      'Ez a csomag nem elérhető. Vedd fel a kapcsolatot az ügyfélszolgálattal.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Ez a csomag nem elérhető. Vedd fel a kapcsolatot ennek a példánynak az adminisztrátoraival.';

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
      'Hiba történt a számlázási portál megnyitásakor. Próbáld újra egy kis idő múlva.';

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
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'A vásárlások le vannak tiltva ehhez a fiókhoz. Ha úgy gondolod, hogy ez hiba, lépj kapcsolatba a $supportEmail címmel.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'A vásárlások le vannak tiltva ehhez a fiókhoz. Ha úgy gondolod, hogy ez hiba, lépj kapcsolatba ennek a példánynak az adminisztrátoraival.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Igényeld a fiókodat a Fluxer Plutonium megvásárlásához.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'A Fluxer Plutonium megvásárlásához először igazolnod kell az e-mail címedet.';

  @override
  String get premiumPerkCommunities => 'Közösségek';

  @override
  String get premiumPerkMessageCharacterLimit => 'Üzenet karakterkorlátja';

  @override
  String get premiumPerkBookmarkedMessages => 'Mentett üzenetek';

  @override
  String get premiumPerkFileUploadSize => 'Fájlfeltöltés mérete';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Animált emojik használata';

  @override
  String get premiumPerkVideoQuality => 'Videó minősége';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animált profilképek és borítóképek';

  @override
  String get premiumPerkEarlyAccess => 'Korai hozzáférés az új funkciókhoz';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Akár 4K/60fps felbontásig';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly vagy $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/hó';

  @override
  String get storePlutoniumYearSuffix => '/év';

  @override
  String get storePlutoniumPriceOr => 'vagy';

  @override
  String get storePlutoniumEmojiTitle => 'Emojijaid mindenhol';

  @override
  String get storePlutoniumEmojiBody =>
      'Hozd el a közösségeid egyedi emojijait és matricáit minden csevegésbe és közösségbe, ahol éppen vagy.';

  @override
  String get storePlutoniumProfileTitle => 'Egy profil, ami kitűnik';

  @override
  String get storePlutoniumProfileBody =>
      'Szerezz animált profilképet és borítóképet, előfizetői jelvényt, a kívánt négyjegyű címkét a felhasználóneved után*, és külön profilt minden közösséghez.';

  @override
  String get storePlutoniumFilesTitle => 'Fájlok küldése akár 500 MB-ig';

  @override
  String get storePlutoniumFilesBody =>
      'Ossz meg teljes hosszúságú videókat és nagy fájlokat anélkül, hogy előbb lekicsinyítenéd őket. Az ingyenes fiókok legfeljebb 25 MB-ot küldhetnek.';

  @override
  String get storePlutoniumCompareTitle =>
      'Ingyenes és Plutonium összehasonlítása';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Nem mindegyik funkció érhető el a mobilalkalmazásban. Néhány csak asztali gépen használható.';

  @override
  String get storePlutoniumNotAvailable => 'Nem elérhető';

  @override
  String get storePlutoniumAvailable => 'Elérhető';

  @override
  String get storePlutoniumCompareTag =>
      'Válaszd ki a felhasználóneved utáni 4 jegyű számot*';

  @override
  String get storePlutoniumCompareProfile => 'Külön profil minden közösséghez';

  @override
  String get storePlutoniumCompareBadge => 'Előfizetői jelvény a profilodon';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Elmenthető videohívási háttérképek';

  @override
  String get storePlutoniumCompareCommunities => 'Csatlakozható közösségek';

  @override
  String get storePlutoniumCompareCharacters => 'Karakterek egyetlen üzenetben';

  @override
  String get storePlutoniumCompareBookmarks =>
      'Üzenetek, amelyeket megjelölhetsz';

  @override
  String get storePlutoniumCompareUpload => 'Legnagyobb feltölthető fájl';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Médiaelemek, amelyeket elmenthetsz későbbre';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Animált emojik használata az üzenetekben';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Használj egyéni emojikat és matricákat bármelyik közösségben';

  @override
  String get storePlutoniumCompareVideo =>
      'Videohívás és képernyőmegosztás minősége';

  @override
  String get storePlutoniumCompareAvatar => 'Animált avatár és profilbanner';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Korai hozzáférés az új funkciókhoz';

  @override
  String get storePlutoniumCompareThemes => 'Egyéni témák az alkalmazáshoz';

  @override
  String get storePlutoniumVideoFree =>
      'Akár 720p felbontás 30 FPS sebességgel';

  @override
  String get storePlutoniumVideoPlutonium =>
      'Akár 4K felbontás 60 FPS sebességgel';

  @override
  String get storePlutoniumTagFootnote =>
      'Csak olyan címkét választhatsz, amellyel még senki más nem rendelkezik ugyanazzal a felhasználónévvel. A felhasználónevek nem különböztetik meg a kis- és nagybetűket, így a Mina#4821 és a mina#4821 ugyanannak számít. A #0000 címke a Fluxer Visionary tagok számára van fenntartva.';

  @override
  String get storePlutoniumLearnVisionary => 'Tudj meg többet a Visionaryról.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Csak a Fluxer nyílt forráskódú fejlesztését szeretnéd támogatni? ';

  @override
  String get storePlutoniumDonateLink => 'Adományozz inkább.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Az előfizetéssel támogatod a Fluxert, és feloldod a következőket';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Egyéni emojik és matricák bármely csevegésben';

  @override
  String get storePlutoniumHighlightProfile =>
      'Animált profil, jelvény és egyedi 4 számjegyű szám';

  @override
  String get storePlutoniumHighlightFiles => 'Feltöltések akár 500 MB-ig';

  @override
  String get storePlutoniumHighlightMessages =>
      'Akár 4000 karakteres üzenetek küldése';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Külön profil minden közösséghez';

  @override
  String get storePlutoniumHighlightsMore => 'És még sok más';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'A lemondásig automatikusan megújul a Google Playen keresztül.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Az App Store-on keresztül automatikusan megújul, amíg le nem mondod.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Már van Fluxer Plutonium előfizetésed.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Spórolj $percent%-ot';
  }

  @override
  String get storePlutoniumWaiting =>
      'Vásárlás megérkezett. A Plutonium itt jelenik meg, amint aktiválódik.';

  @override
  String get storePlutoniumUnavailable =>
      'Az alkalmazáson belüli előfizetések még nem érhetők el ezen az eszközön.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'A Visionary már tartalmazza az állandó hozzáférést, így nincs szükség ismétlődő előfizetésre.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Adatvédelmi irányítópult';

  @override
  String get userSettingsNavAuthorizedApps => 'Engedélyezett alkalmazások';

  @override
  String get userSettingsNavBlockedUsers => 'Letiltott felhasználók';

  @override
  String get userSettingsNavLinkedDevices => 'Összekapcsolt eszközök';

  @override
  String get userSettingsNavConnections => 'Kapcsolatok';

  @override
  String get userSettingsNavLookAndFeel => 'Megjelenés';

  @override
  String get userSettingsNavAccessibility => 'Kisegítő lehetőségek';

  @override
  String get userSettingsNavChat => 'Csevegés';

  @override
  String get userSettingsNavAudioAndVideo => 'Hang és videó';

  @override
  String get userSettingsNavShortcuts => 'Billentyűparancsok';

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
  String get audioAndVideoDefaultDeviceLabel => 'Alapértelmezett';

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
  String get audioAndVideoFocusedVoiceLabel => 'Beszédkiemelés';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Ajánlott. Megtisztítja a mikrofon hangját az érthető beszédhez.';

  @override
  String get audioAndVideoDirectInputLabel => 'Közvetlen bemenet';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Érintetlenül küldi a hangot. Akkor a legjobb, ha külső audioszoftvert használsz.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Egyéni';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Állítsd be az egyes beállításokat magad: zajszűrés, visszhangszűrés és erősítés.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Zajszűrés';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Továbbfejlesztett';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Szokványos';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Nincs';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Visszhangszűrés';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Automatikus erősítésszabályozás';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Kiegyenlíti a mikrofonod hangerejét. Kikapcsolásra kerül, ha a fejlett zajcsökkentés aktív.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mikrofonteszt';

  @override
  String get audioAndVideoMicTestStartLabel => 'Mikrofonteszt indítása';

  @override
  String get audioAndVideoMicTestStopLabel => 'Mikrofonteszt leállítása';

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Kamera tükrözése';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kamera minősége';

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
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Ez a példány jelenleg legfeljebb 720p 30 FPS-t engedélyez.';

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
      'Az operációs rendszer értesítési központját használja. A csatornánkénti és közösségenkénti beállításokhoz kattints jobb gombbal egy közösség ikonjára, és nyisd meg az értesítési beállításokat.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Pushértesítésekhez szükséges inaktivitási idő';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return 'A(z) $productName nem küld pushértesítéseket a mobileszközeidre, amikor a számítógépednél vagy. Válaszd ki, mennyi ideig kell inaktívnak lenned a számítógépen ahhoz, hogy pushértesítéseket kapj.';
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
      'Említési beállítás válaszokhoz';

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
      'A neked szóló válaszok alapértelmezés szerint tartalmazzanak @említést; a küldő kapjon figyelmeztetést, ha kikapcsolja';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Említés mellőzésének előnyben részesítése';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'A neked szóló válaszok alapértelmezés szerint ne tartalmazzanak @említést; a küldő kapjon figyelmeztetést, ha bekapcsolja';

  @override
  String get notificationsTtsSectionTitle => 'Értesítések szövegfelolvasással';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'A /tts paranccsal küldött szöveg felolvasásának engedélyezése';

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
      'Csak az éppen megtekintett csatorna üzeneteit olvassa fel. A felolvasás a csatornaváltásokat is követi.';

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
      'Beállítja az összes hangeffekt hangerőszintjét. Az egyes hangokhoz megadott egyéni hangerő figyelmen kívül hagyja ezt.';

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
      'Egyéni hangerő beállítása az egyes hangokhoz. Egyéni beállítás nélkül a hangok a fő hangerőt követik.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Aktív egyéni hangerő-beállítások: $overrideCount.';
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
    return '$label némítása';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '$label némításának feloldása';
  }

  @override
  String get notificationsSoundMessage => 'Közösségi üzenetek értesítései';

  @override
  String get notificationsSoundDirectMessage =>
      'Közvetlen üzenetek értesítései';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Az aktuális csatorna üzenetértesítései';

  @override
  String get notificationsSoundMute => 'Mikrofon némítása';

  @override
  String get notificationsSoundUnmute => 'Mikrofon némításának feloldása';

  @override
  String get notificationsSoundDeaf => 'Bejövő hang kikapcsolása';

  @override
  String get notificationsSoundUndeaf => 'Bejövő hang visszakapcsolása';

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
  String get notificationsPushRelaySectionTitle =>
      'Push-értesítések továbbítója';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return 'A(z) $pushProvider csak a saját szolgáltatásán keresztül kézbesít push-értesítéseket, ezért az eszköz értesítései a Fluxer továbbítóján haladnak át.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'A Fluxer push-továbbítójának használata';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Ha ezt kikapcsolod, az eszköz push-regisztrációja törlődik, és az eszköz nem kap több push-értesítést.';

  @override
  String get pushRelayConsentTitle => 'Push-értesítések továbbítója';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return 'A(z) $pushProvider csak a saját szolgáltatásán keresztül kézbesít push-értesítéseket, ezért az eszköz értesítései a Fluxer továbbítóján haladnak át.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Fogadd el a ';

  @override
  String get pushRelayConsentNoticeLink =>
      'push-továbbító adatvédelmi tájékoztatóját';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ', hogy bekapcsold a push-értesítéseket ezen az eszközön. Eszközönként csak egyszer kell elfogadnod.';

  @override
  String get pushRelayConsentAgree => 'Elfogadom és folytatom';

  @override
  String get pushRelayConsentDecline => 'Most nem';

  @override
  String get userSettingsNavLanguageAndTime => 'Nyelv és idő';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Felület nyelve';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Válaszd ki az alkalmazásban használt nyelvet';

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
    return 'Alkalmazás nyelvének időformátuma: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Rendszer időformátuma: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Rendszer területi beállításainak használata az időformátumhoz';

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
  String get userSettingsNavAppIcon => 'Alkalmazásikon';

  @override
  String get appIconSectionTitle => 'Alkalmazásikon';

  @override
  String get appIconSectionDescription =>
      'Válaszd ki, melyik ikon jelenjen meg a kezdőképernyődön.';

  @override
  String get appIconOptionDefault => 'Alapértelmezett';

  @override
  String get appIconOptionStarfield => 'Csillagmező';

  @override
  String get appIconOptionSweden => 'Svédország';

  @override
  String get appIconOptionGreyscale => 'Greyscale';

  @override
  String get appIconOptionRainbow => 'Rainbow';

  @override
  String get appIconOptionWaves => 'Waves';

  @override
  String get appIconOptionChromaticAberration => 'Chromatic aberration';

  @override
  String get appIconOptionDefaultBrutalist => 'Brutalist';

  @override
  String get appIconOptionGreyscaleBrutalist => 'Greyscale brutalist';

  @override
  String get appIconUnsupported =>
      'Az alkalmazásikon megváltoztatása nem érhető el ezen az eszközön.';

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
  String get advancedSettingsConfigure => 'Beállítás';

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
      'Szöveg kijelölésének engedélyezése az alkalmazásban';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Videótekerési bélyegképek engedélyezése';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Bélyegkép vagy aktuális képkocka videótekerés közben';

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
  String get advancedSettingKeyboardHintsLabel => 'Billentyűzetsúgók';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Billentyűparancsok jelzése a buboréksúgókban';

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
      'Állítsd be, mely gombok és jelzők jelenjenek meg a médiamellékleteken és a beágyazott tartalmakon';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Mellékletek feltöltése küldés előtt';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Mellékletek feltöltésének indítása, amint hozzáadod őket az üzenetbeviteli mezőhöz';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Követési paraméterek eltávolítása az URL-ekből';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automatikusan eltávolítja a követési paramétereket az elküldött üzenetekben lévő URL-ekből';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Minden külső link megjelölése megbízhatóként';

  @override
  String get advancedSettingSearchEnginesLabel => 'Keresőmotorok';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Kijelölt szöveg kereséséhez használt keresőmotorok beállítása';

  @override
  String get advancedSettingTranslatorsLabel => 'Fordítók';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Kijelölt szöveg fordításához használt szolgáltatók beállítása';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Képek fordított keresése';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Fordított képkereső szolgáltatók';

  @override
  String get advancedSettingMessageActionBarLabel => 'Üzenetműveletek sávja';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Az üzenet fölé vitt egérmutatónál megjelenő műveletsáv testreszabása';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Kifejezés-automatikus kiegészítés';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Válaszd ki, mi jelenjen meg, amikor kettőspontot írsz az üzenetbeviteli mezőbe';

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
      'Válaszd ki, hogyan görgessen a csevegés az üzenet elküldése után';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      '„Összes megjelölése olvasottként” megerősítés kihagyása';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'A beérkezett üzenetek összes olvasatlan csatornájának azonnali megjelölése olvasottként, megerősítés nélkül';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Némított csatornák elrejtése alapértelmezetten';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'A némított csatornák elrejtése a közösségi oldalsávokból';

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
      'Beágyazott tartalmak elrejtésére szolgáló gomb megjelenítése';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Üzenetműveletek sávjának megjelenítése';

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
  String get advancedSettingShowMediaButtonLabel => 'Médiagomb megjelenítése';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Matricák gomb megjelenítése';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Emojigomb megjelenítése';

  @override
  String get advancedSettingShowSendButtonLabel => 'Küldés gomb megjelenítése';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Új eszközre vonatkozó riasztások megjelenítése';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Rákérdezés új hangeszközök csatlakoztatásakor';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Kapcsolati hangerőszabályzók';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Résztvevőnként és eszközönként külön hangerőcsúszkák megjelenítése a hangmenükben';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Képernyőmegosztás előnézetének viselkedése';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Előnézetek, külön ablakok és streambélyegképek működése';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Képernyőmegosztási kodek';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Videokodek képernyőmegosztáshoz';

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
      'Saját stream előnézeti bélyegképének elrejtése';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Fejlesztői mód engedélyezése';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Fejlesztői mód engedélyezése';

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
      'Beépített keresőmotorok engedélyezése vagy letiltása. Az engedélyezett keresőmotorok megjelennek az üzenet helyi menüjében, amikor szöveget jelölsz ki.';

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
      'Beépített fordítók engedélyezése vagy letiltása. Az engedélyezett fordítók megjelennek az üzenet helyi menüjében, amikor szöveget jelölsz ki.';

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
      'Beépített fordított képkereső szolgáltatók engedélyezése vagy letiltása. Az engedélyezett szolgáltatók megjelennek a képek, profilképek, borítóképek, matricák és emojik helyi menüjében.';

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
  String get userSettingsLogOutConfirmTitle => 'Kijelentkezés?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Bármikor újra bejelentkezhetsz.';

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
      'Próbálj meg egy másik nevet, vagy használj @ / # / ! / * előtagokat az eredmények szűréséhez.';

  @override
  String get quickSwitcherSectionPeople => 'Személyek';

  @override
  String get quickSwitcherSectionGroupMessages => 'Csoportos üzenetek';

  @override
  String get quickSwitcherSectionTextChannels => 'Szöveges csatornák';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Hangcsatornák';

  @override
  String get quickSwitcherSectionCommunities => 'Közösségek';

  @override
  String get quickSwitcherSectionSettings => 'Beállítások';

  @override
  String get quickSwitcherHomeLabel => 'Kezdőlap';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Közvetlen üzenetek';

  @override
  String get quickSwitcherFavoritesLabel => 'Kedvencek';

  @override
  String get quickSwitcherUserSettingsLabel => 'Felhasználói beállítások';

  @override
  String get quickSwitcherNotificationsLabel => 'Értesítések';

  @override
  String get quickSwitcherBookmarksLabel => 'Mentett üzenetek';

  @override
  String get savedMessagesEmptyTitle => 'Nincsenek mentett üzenetek';

  @override
  String get savedMessagesEmptyBody =>
      'Mentsd el az üzeneteket, hogy később visszatérhess hozzájuk.';

  @override
  String get savedMessagesEndBody => 'Itt nincs több látnivaló.';

  @override
  String get savedMessagesRemoveTooltip =>
      'Eltávolítás a mentett üzenetek közül';

  @override
  String get savedMessagesAddedToast => 'Hozzáadva a mentett üzenetekhez';

  @override
  String get savedMessagesRemovedToast =>
      'Eltávolítva a mentett üzenetek közül';

  @override
  String get quickSwitcherMentionsLabel => 'Említések';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Még nincsenek ismerőseid';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Kezdéshez vegyél fel egy ismerőst.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Nincs a keresésnek megfelelő ismerős';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Próbálj meg egy másik nevet.';

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
  String get quickSwitcherSearchAliasInbox => 'Beérkezett üzenetek';

  @override
  String get quickSwitcherSearchAliasSaved => 'Mentve';

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
  String get uiUnsavedChanges => 'Nem mentett változások';

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
  String get instanceUrlHelper =>
      'Használd a fluxer.app címet a hivatalos példányhoz, vagy egy saját üzemeltetésű példány pontos URL-jét.';

  @override
  String get resetToDefaultInstance => 'Visszaállítás Fluxer-re';

  @override
  String get instanceConnect => 'Csatlakozás';

  @override
  String get instanceConnecting => 'Csatlakozás…';

  @override
  String get instanceConnectFailed => 'Nem sikerült csatlakozni az instanchoz';

  @override
  String get instanceInvalidDiscoveryResponse =>
      'This client cannot connect to this instance. The instance is likely out of date. If the instance is up to date, try updating this app.';

  @override
  String get recentInstances => 'Legutóbbi instanciák';

  @override
  String removeRecentInstance(String domain) {
    return '$domain eltávolítása a legutóbbi instanciák közül';
  }

  @override
  String get instanceSheetTitle => 'Csatlakozás instanchoz';

  @override
  String get changeInstance => 'Váltás';

  @override
  String get instanceConnectionRequired =>
      'Csatlakozz az instanchoz a bejelentkezéshez';

  @override
  String get comingSoon => 'Hamarosan';

  @override
  String get guildNavbarDirectMessages => 'Közvetlen üzenetek';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Fedezd fel a közösségeket';

  @override
  String get discoveryExplore => 'Felfedezés';

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
  String get discoveryAllLanguages => 'Összes nyelv';

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
  String get discoveryCategoryContentCreator => 'Tartalomkészítő';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime és manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmek és TV';

  @override
  String get discoveryCategoryOther => 'Egyéb';

  @override
  String get discoveryNoCommunitiesMatch => 'Nincs egyező közösség.';

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
  String get discoveryApps => 'Alkalmazások';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Nem sikerült csatlakozni ehhez a közösséghez';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Hiba történt. Próbáld újra egy kis idő múlva.';

  @override
  String get discoveryJoinErrorFullTitle => 'Ez a közösség megtelt';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Ez a közösség elérte a taglétszám-korlátját, így most nem tudsz csatlakozni.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Elérted a közösségek számának korlátját';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'A maximális számú közösségben vagy. Hagyj el egyet, és próbáld újra.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Nem csatlakozhatsz ehhez a közösséghez';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Ki lettél tiltva ebből a közösségből.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Ez a közösség már nem elérhető';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Lehet, hogy már nem szerepel a Felfedezésben, vagy letiltotta az új csatlakozásokat. Frissítsd az oldalt, és többé nem fogod látni.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Túl gyors vagy';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Kérjük, várj egy pillanatot, majd próbáld újra.';

  @override
  String get guildNavbarAddCommunity => 'Közösség hozzáadása';

  @override
  String get guildNavbarHelp => 'Súgó';

  @override
  String get scrollIndicatorNew => 'ÚJ';

  @override
  String get scrollIndicatorNewMessage => 'ÚJ ÜZENET';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '$folderName összecsukása';
  }

  @override
  String get guildNavbarGuildSelected => 'kiválasztva';

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
  String get authCheckStillWorking => 'Még dolgozunk rajta…';

  @override
  String get authVerificationFailed =>
      'Nem sikerült befejezni az ellenőrzést. Próbáld újra.';

  @override
  String get chatLoadingMessages => 'Üzenetek betöltése';

  @override
  String get friendsMessageFriend => 'Üzenet küldése';

  @override
  String get friendsFriendActions => 'Barát műveletek';

  @override
  String get friendsAcceptRequest => 'Ismerősjelölés elfogadása';

  @override
  String get friendsDeclineRequest => 'Meghívás elutasítása';

  @override
  String get friendsCancelRequest => 'Ismerősjelölés visszavonása';

  @override
  String get friendsOpenInbox => 'Beérkezett üzenetek';

  @override
  String get profileRemoveFriend => 'Eltávolítás az ismerősök közül';

  @override
  String get profileUnblockUser => 'Felhasználó letiltásának feloldása';

  @override
  String get profileAcceptFriendRequest => 'Ismerősjelölés elfogadása';

  @override
  String get profileCancelFriendRequest => 'Ismerősjelölés visszavonása';

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
  String get guildFolderIconStar => 'Csillag';

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
  String get guildBulkBlockDirectMessages => 'Közvetlen üzenetek letiltása';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Botok közvetlen üzeneteinek engedélyezése';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Botok közvetlen üzeneteinek letiltása';

  @override
  String get guildNavbarGroupDm => 'Csoportos beszélgetés';

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
  String get guildNavbarPrivateChannel => 'Private channel';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Only selected members and roles will be able to view this channel.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Add members or roles';

  @override
  String get guildNavbarAddMembersOrRolesHint => 'Search members or roles';

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
  String get guildNavbarSearchFriends => 'Ismerősök keresése';

  @override
  String get guildNavbarNoFriendsYet => 'Még nincsenek ismerőseid';

  @override
  String get guildNavbarNoResults => 'Nincs találat';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Vagy küldj meghívó linket egy barátnak:';

  @override
  String get guildNavbarInviteLink => 'Meghívólink';

  @override
  String get guildNavbarCopy => 'Másolás';

  @override
  String get guildNavbarCopied => 'Kimásolva!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'A meghívó linked 7 nap múlva lejár.';

  @override
  String get guildNavbarInviteNeverExpires => 'Ez a meghívólink sosem jár le.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'A meghívó linked ennyi idő múlva jár le: $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Meghívólink szerkesztése';

  @override
  String get guildNavbarInviteLinkSettings => 'Meghívólink beállításai';

  @override
  String get guildNavbarExpireAfter => 'Lejárati idő';

  @override
  String get guildNavbarMaxUses => 'Felhasználások maximális száma';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Ideiglenes tagság megadása';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'A tagokat eltávolítjuk, amikor offline állapotba kerülnek, hacsak nincs hozzárendelve szerepkör';

  @override
  String get guildNavbarCreateNewLink => 'Új hivatkozás létrehozása';

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
      'Törlöd az üzeneteidet ebből a közösségből?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Véglegesen töröl minden itt, minden csatornában küldött üzenetedet. Nem vonható vissza.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Üzeneteim törlése';

  @override
  String get guildNavbarDeletedYourMessages => 'Törölte az üzeneteidet';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Nem sikerült törölni az üzeneteket';

  @override
  String get guildNavbarRemoveOverride => 'Egyéni beállítás eltávolítása';

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
      'A meghívók jelenleg szünetelnek ebben a közösségben';

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
  String get guildNavbarNoLimit => 'Nincs korlát';

  @override
  String get guildNavbarOneUse => '1 használat';

  @override
  String guildNavbarUses(int count) {
    return '$count használat';
  }

  @override
  String get guildMenuMarkAsRead => 'Megjelölés olvasottként';

  @override
  String get guildPeekMoreOptions => 'További lehetőségek';

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
  String get guildMenuDebugCommunity => 'Közösség hibakeresése';

  @override
  String get guildMenuCopyCommunityId => 'Közösségi azonosító másolása';

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
  String get guildMenuSettingsDiscovery => 'Felfedezés';

  @override
  String get guildMenuSettingsMembers => 'Tagok';

  @override
  String get guildMenuSettingsInviteLinks => 'Meghívók';

  @override
  String get guildMenuSettingsBans => 'Kitiltások';

  @override
  String get guildMenuSettingsChannels => 'Csatornák';

  @override
  String get guildSettingsNoPermission =>
      'Nincs engedélyed megtekinteni ezt a beállítások lapot.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikon';

  @override
  String get guildSettingsOverviewBannerTitle => 'Borítókép';

  @override
  String get guildSettingsOverviewNameTitle => 'Név';

  @override
  String get guildSettingsOverviewNameHint => 'Szuper közösségem';

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
      'Szerepkör-beállítások és jogosultságok megadása';

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
      'Szerepkör külön megjelenítése';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Az ezzel a szerepkörrel rendelkező tagokat külön szakaszban jeleníti meg a taglistában.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Említések engedélyezése ehhez a szerepkörhöz';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'A(z) „$permission” engedéllyel rendelkező tagok mindig megemlíthetnek szerepköröket, függetlenül ettől a beállítástól.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Ezzel a gombbal gyorsan törölheted az összes jogosultságot.';

  @override
  String get guildSettingsRolesClearPermissions => 'Jogosultságok törlése';

  @override
  String get guildSettingsRolesPermissionsSection => 'Jogosultságok';

  @override
  String get guildSettingsRolesSearchPermissions => 'Jogosultságok keresése';

  @override
  String get guildSettingsRolesDenseLayout => 'Sűrű elrendezés';

  @override
  String get guildSettingsRolesComfyLayout => 'Kényelmes elrendezés';

  @override
  String get guildSettingsRolesSingleColumn => 'Egy oszlop';

  @override
  String get guildSettingsRolesTwoColumns => 'Két oszlop';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Nem található jogosultság';

  @override
  String get guildSettingsRolesHoistOrder =>
      'Külön megjelenített szerepkörök sorrendje';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Alaphelyzetbe állítás';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Húzd a szerepköröket a taglistában megjelenő sorrendjük beállításához.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Nincsenek külön megjelenített szerepkörök. Kapcsold be egy szerepkörnél a „Szerepkör külön megjelenítése” beállítást, hogy itt megjelenjen.';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Ehhez a engedélyek szerkesztéséhez a(z) „$permission” engedélyre van szükséged';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Nem szerkeszthetsz a legmagasabb szerepköröddel azonos vagy annál magasabb szintű szerepkört';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Nem adhatsz meg olyan jogosultságot, amellyel te sem rendelkezel';

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
      'A külön megjelenített szerepkörök sorrendje visszaállítva az alapértelmezettre';

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
      'Nem sikerült visszaállítani a külön megjelenített szerepkörök sorrendjét';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'Próbáld újra egy kis idő múlva.';

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
  String get permissionAdministrator => 'Rendszergazda';

  @override
  String get permissionAdministratorDescription =>
      'Minden jogosultságot megad, és megkerüli a csatornakorlátozásokat. Különösen érzékeny jogosultság.';

  @override
  String get permissionViewActivityLog => 'Tevékenységnapló megtekintése';

  @override
  String get permissionViewActivityLogDescription =>
      'A közösség módosításait és moderálási műveleteit rögzítő tevékenységnapló megtekintése.';

  @override
  String get permissionManageCommunity => 'Közösség kezelése';

  @override
  String get permissionManageCommunityDescription =>
      'Globális beállítások szerkesztése, például név, leírás és ikon.';

  @override
  String get permissionManageRoles => 'Szerepkörök kezelése';

  @override
  String get permissionManageRolesDescription =>
      'A legmagasabb szerepkörödnél alacsonyabb szerepkörök létrehozása, szerkesztése vagy törlése. Az egyéni csatornajogosultságok szerkesztését is lehetővé teszi.';

  @override
  String get permissionManageChannels => 'Csatornák kezelése';

  @override
  String get permissionManageChannel => 'Csatorna kezelése';

  @override
  String get permissionManageChannelDescription =>
      'A csatorna átnevezése és beállításainak szerkesztése.';

  @override
  String get permissionManagePermissions => 'Jogosultságok kezelése';

  @override
  String get permissionManagePermissionsDescription =>
      'Szerepkörök és tagok egyéni jogosultságainak szerkesztése ebben a csatornában.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Webhookok létrehozása, szerkesztése vagy törlése ehhez a csatornához.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'A csatorna taglistájának megtekintése.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'A csatorna meghívólinkjeinek kezelése.';

  @override
  String get permissionOverwriteDeny => 'Elutasítás';

  @override
  String get permissionOverwriteInherit => 'Semleges (örökölt)';

  @override
  String get permissionOverwriteAllow => 'Engedélyezés';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Ezekkel a gombokkal gyorsan beállíthatod az összes jogosultságot.';

  @override
  String get permissionManageChannelsDescription =>
      'Csatornák és kategóriák létrehozása, szerkesztése vagy törlése.';

  @override
  String get permissionKickMembers => 'Tagok kirúgása';

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
  String get permissionManageEmojiStickers => 'Emojik és matricák kezelése';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Más tagok által létrehozott emojik és matricák szerkesztése vagy törlése.';

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
      'Más közösségek emojijainak használata.';

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
  String get permissionTimeOutMembers => 'Tagok ideiglenes korlátozása';

  @override
  String get permissionTimeOutMembersDescription =>
      'Megakadályozza, hogy a tagok üzeneteket küldjenek, reakciókat használjanak és hanghívásokhoz csatlakozzanak egy bizonyos ideig.';

  @override
  String get permissionViewChannel => 'Csatorna megtekintése';

  @override
  String get permissionViewChannelMembers => 'Csatornatagok megtekintése';

  @override
  String get permissionViewChannelMembersDescription =>
      'A közösség csatornáihoz tartozó taglisták megtekintése.';

  @override
  String get permissionConnect => 'Csatlakozás';

  @override
  String get permissionSpeak => 'Beszéd';

  @override
  String get permissionStreamVideo => 'Videó streamelése';

  @override
  String get permissionUseVoiceActivity => 'Beszédérzékelés használata';

  @override
  String get permissionUseVoiceActivityDescription =>
      'E jogosultság nélkül adásgombot kell használni.';

  @override
  String get permissionPrioritySpeaker => 'Elsőbbségi beszélő';

  @override
  String get permissionMuteMembers => 'Tagok mikrofonjának némítása';

  @override
  String get permissionDeafenMembers => 'Hang kikapcsolása a tagoknál';

  @override
  String get permissionMoveMembers => 'Tagok áthelyezése';

  @override
  String get permissionMoveMembersDescription =>
      'Húzd át a tagokat az általuk elérhető csatornák között.';

  @override
  String get permissionSetVoiceRegion => 'Hangrégió beállítása';

  @override
  String get permissionManageThreads => 'Manage threads';

  @override
  String get permissionManageThreadsDescription =>
      'Rename, archive, lock and delete threads, set their slowmode, and view private threads.';

  @override
  String get permissionCreatePublicThreads => 'Create public threads';

  @override
  String get permissionCreatePublicThreadsDescription =>
      'Start threads that everyone who can view the channel can see.';

  @override
  String get permissionCreatePrivateThreads => 'Create private threads';

  @override
  String get permissionCreatePrivateThreadsDescription =>
      'Start invite-only threads.';

  @override
  String get permissionSendMessagesInThreads => 'Send messages in threads';

  @override
  String get permissionSendMessagesInThreadsDescription =>
      'Send messages in threads and forum posts.';

  @override
  String get threadErrorArchived => 'This thread is archived.';

  @override
  String get threadErrorLocked =>
      'This thread is locked. Only moderators can post or reopen it.';

  @override
  String get threadErrorAlreadyCreated =>
      'A thread already exists for this message.';

  @override
  String get threadErrorMaxActiveThreads =>
      'This community has reached its limit of active threads.';

  @override
  String get threadErrorMaxMembers =>
      'This thread has reached its member limit.';

  @override
  String get threadErrorMaxPinnedPosts =>
      'Only one post can be pinned in this forum.';

  @override
  String get threadErrorMaxForumTags => 'A forum can have at most 20 tags.';

  @override
  String get threadErrorTagNamesUnique => 'Tag names must be unique.';

  @override
  String get threadErrorNoTagsForEveryone =>
      'Add a tag everyone can use before requiring tags.';

  @override
  String get threadErrorTagRequired => 'Pick at least one tag for this post.';

  @override
  String get threadErrorUnknownTag =>
      'One of the selected tags no longer exists.';

  @override
  String get threadErrorInvalidNotificationSettings =>
      'Those notification settings are not valid for a thread.';

  @override
  String get threadErrorSearchIndexNotReady =>
      'Posts are still being indexed. Try again in a moment.';

  @override
  String get threadErrorInvalidChannelType =>
      'This action is not available in this channel.';

  @override
  String get threadCreate => 'Create thread';

  @override
  String get threadName => 'Thread name';

  @override
  String get threadNameRequired => 'Give the thread a name.';

  @override
  String get threadNewThreadPlaceholder => 'New thread';

  @override
  String get threadPrivate => 'Private thread';

  @override
  String get threadPrivateDescription =>
      'Only people you invite and moderators can see this thread.';

  @override
  String get threadStarterMessage => 'Message';

  @override
  String get threadStarterMessagePlaceholder =>
      'Enter a message to start the conversation!';

  @override
  String threadCreateCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can start another thread in $seconds seconds.',
      one: 'You can start another thread in 1 second.',
    );
    return '$_temp0';
  }

  @override
  String threadCreateFailed(String detail) {
    return 'Could not start the thread: $detail';
  }

  @override
  String get threadBrowserTitle => 'Threads';

  @override
  String get threadBrowserActive => 'Active';

  @override
  String get threadBrowserArchived => 'Closed';

  @override
  String get threadBrowserJoined => 'Joined';

  @override
  String get threadBrowserOtherActive => 'Other active threads';

  @override
  String get threadBrowserPublic => 'Public threads';

  @override
  String get threadBrowserPrivate => 'Private threads';

  @override
  String get threadBrowserEmpty =>
      'There are no threads. Stay focused on a conversation with a thread, a temporary text channel.';

  @override
  String get threadBrowserArchivedEmpty => 'There are no closed threads.';

  @override
  String get threadBrowserLoadMore => 'Load more';

  @override
  String get threadBrowserSearch => 'Search threads';

  @override
  String get threadBrowserSearchEmpty => 'No threads match';

  @override
  String get threadBrowserSearchEmptyHint =>
      'Try a different name or check the other tab.';

  @override
  String get threadBrowserSearchFailed =>
      'Couldn\'t search threads. Try again later.';

  @override
  String get threadBrowserSearchIndexing =>
      'Search is getting ready for this community. Trying again shortly...';

  @override
  String threadMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages',
      one: '1 message',
    );
    return '$_temp0';
  }

  @override
  String get threadFailedToMentionSomeRoles =>
      'Some mentioned roles were not added to this thread.';

  @override
  String get threadMembers => 'Thread members';

  @override
  String threadMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get threadMembersEmpty => 'Nobody has joined this thread yet.';

  @override
  String threadRemoveMember(String name) {
    return 'Remove $name from thread';
  }

  @override
  String get threadJoin => 'Join thread';

  @override
  String get threadLeave => 'Leave thread';

  @override
  String get threadJoinNotice =>
      'Join this thread to follow it in your channel list and get notifications.';

  @override
  String get threadArchivedNotice =>
      'This thread is closed. Sending a message will open it again.';

  @override
  String get threadLockedNotice =>
      'This thread is locked. Only moderators can send messages.';

  @override
  String get threadArchive => 'Close thread';

  @override
  String get threadUnarchive => 'Open thread again';

  @override
  String get threadLock => 'Lock thread';

  @override
  String get threadUnlock => 'Unlock thread';

  @override
  String get threadDelete => 'Delete thread';

  @override
  String threadDeleteConfirm(String threadName) {
    return 'Are you sure you want to delete $threadName? This cannot be undone.';
  }

  @override
  String get threadDeleted => 'Thread deleted';

  @override
  String get threadMarkAsRead => 'Mark as read';

  @override
  String get threadMute => 'Mute thread';

  @override
  String get threadUnmute => 'Unmute thread';

  @override
  String get threadMuted => 'Thread muted';

  @override
  String get threadUnmuted => 'Thread unmuted';

  @override
  String get threadNotificationSettings => 'Notification settings';

  @override
  String get threadNotificationParentDefault => 'Use channel default';

  @override
  String get threadCopyLink => 'Copy link';

  @override
  String get threadCopyId => 'Copy thread ID';

  @override
  String get threadMoreOptions => 'More options';

  @override
  String get threadSettings => 'Thread settings';

  @override
  String get threadSettingsSaved => 'Thread settings saved';

  @override
  String get threadAutoArchive => 'Hide after inactivity';

  @override
  String get threadAutoArchiveDescription =>
      'The thread stops showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultAutoArchive => 'Default hide after inactivity';

  @override
  String get threadDefaultAutoArchiveDescription =>
      'New threads stop showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultSlowmode => 'Default thread slowmode';

  @override
  String get threadAutoArchiveOneHour => '1 Hour';

  @override
  String get threadAutoArchiveOneDay => '24 Hours';

  @override
  String get threadAutoArchiveThreeDays => '3 Days';

  @override
  String get threadAutoArchiveOneWeek => '1 Week';

  @override
  String get threadInvitable => 'Allow anyone to invite';

  @override
  String get threadInvitableDescription =>
      'Members of this private thread can add other people.';

  @override
  String threadStartedBy(String name) {
    return 'Started by $name';
  }

  @override
  String get threadStarterDeleted => 'Original message was deleted.';

  @override
  String systemThreadCreated(
    String username,
    String threadLink,
    String allThreadsLink,
  ) {
    return '$username started a thread: $threadLink. See $allThreadsLink.';
  }

  @override
  String get systemThreadCreatedAllThreadsLink => 'all threads';

  @override
  String get systemThreadCreatedThreadFallback => 'a thread';

  @override
  String systemPreviewThreadCreated(String username) {
    return '$username started a thread.';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Még nincsenek egyéni hangulatjelek.';

  @override
  String get guildSettingsStickersEmpty => 'Még nincsenek egyéni matricák.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Tagellenőrzés';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Válaszd ki, hogy a tagoknak mivel kell rendelkezniük, mielőtt bejegyzéseket tehetnek közzé vagy közvetlen üzenetet küldhetnek a közösség tagjainak.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'A szerepkörrel rendelkező tagok megkerülhetik ezeket az ellenőrzéseket. Nyilvános terek esetén javasoljuk az ellenőrzés engedélyezését.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'A Felfedezésben szereplő közösségekhez legalább ellenőrzött e-mail cím szükséges. A Felfedezés engedélyezésekor a „Nincs” nem választható.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Felnőtt tartalom és tartalmi figyelmeztetések';

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
      'Megerősített e-mail-cím szükséges.';

  @override
  String get guildSettingsVerificationMedium => 'Közepes';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Ellenőrzött e-mail címet és legalább 5 perces fiókot igényel.';

  @override
  String get guildSettingsVerificationHigh => 'Magas';

  @override
  String get guildSettingsVerificationHighDescription =>
      'A közepes szint minden feltételét megköveteli, továbbá legalább 10 perces közösségi tagságot.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Kövesd nyomon a moderátori műveleteket a közösségben.';

  @override
  String get guildSettingsAuditLogEmpty => 'Még nincsenek naplók';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Itt jelennek meg a moderálási műveletek és a közösségi változások.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Minden felhasználó';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Minden művelet';

  @override
  String get guildSettingsAuditLogNoReason => 'Nem adott meg okot.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Ismeretlen felhasználó';

  @override
  String get guildSettingsAuditLogReason => 'Ok (indoklás)';

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
  String get auditLogActionChannelUpdate => 'A csatorna frissítve';

  @override
  String get auditLogActionChannelDelete => 'Csatorna törölve';

  @override
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

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
  String get auditLogActionMemberBanRemove => 'Tag kitiltása feloldva';

  @override
  String get auditLogActionMemberUpdate => 'Tag frissítve';

  @override
  String get auditLogActionMemberRoleUpdate => 'Tag szerepkörei frissítve';

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
  String get auditLogActionMessagePin => 'Üzenet rögzítve';

  @override
  String get auditLogActionMessageUnpin => 'Üzenet rögzítése feloldva';

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
  String auditLogSummaryThreadCreate(String actor, String target) {
    return '$actor started the thread $target.';
  }

  @override
  String auditLogSummaryThreadUpdate(String actor, String target) {
    return '$actor updated the thread $target.';
  }

  @override
  String auditLogSummaryThreadDelete(String actor, String target) {
    return '$actor deleted the thread $target.';
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
  String get guildSettingsWebhooksDescription =>
      'A közösségedben beállított összes webhook megtekintése és kezelése.';

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
      'Hiba történt a webhookok betöltésekor. Próbáld újra.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhookok frissítve';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Nem sikerült frissíteni a webhookokat';

  @override
  String get guildSettingsUnknownChannel => 'Ismeretlen csatorna';

  @override
  String get guildSettingsCopiedUrl => 'URL vágólapra másolva';

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
      'A közösséged szerepel a Felfedezésben. Alább frissítheted a bejegyzés adatait, vagy visszavonhatod, hogy eltávolítsd.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'A jelentkezésed felülvizsgálatra vár. Addig is frissítheted a bejegyzésed adatait, vagy visszavonhatod a jelentkezést.';

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
  String get guildSettingsDiscoveryApply => 'Alkalmazás';

  @override
  String get guildSettingsDiscoverySave => 'Mentés';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Visszavonás';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'A Felfedezésbe való jelentkezés elküldve';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'A Felfedezésben szereplő bejegyzés frissítve';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'A Felfedezésbe való jelentkezés visszavonva';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Nem sikerült visszavonni a jelentkezést';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Próbáld újra egy kis idő múlva.';

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
    return 'Csatlakozott a(z) $productName szolgáltatáshoz';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Csatlakozási mód';

  @override
  String get guildMembersColumnRoles => 'Szerepkörök';

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
  String get guildMembersJoinSourceVanityUrl => 'Egyéni meghívólink';

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
  String get guildMembersChannelListLabel => 'Tagok';

  @override
  String get guildSettingsInvitesTitle => 'Meghívók';

  @override
  String get guildSettingsInvitesDescription =>
      'A közösség összes meghívójának megtekintése. Új meghívó létrehozásához nyiss meg egy csatornát, és használd a meghívás gombot.';

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
      'Hiba történt a meghívók betöltésekor. Próbáld újra.';

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
      'Szünetelteted a meghívókat? Az új felhasználók nem tudnak csatlakozni meghívólinken keresztül, amíg újra nem engedélyezed. A meglévő tagokat ez nem érinti.';

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
  String get guildSettingsInvitesLabelInviter => 'Meghívó felhasználó:';

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
  String get guildSettingsBansDescription =>
      'Kitiltott felhasználók megtekintése és kezelése.';

  @override
  String get guildSettingsBansSearchHint => 'Kitiltások keresése';

  @override
  String get guildSettingsBansEmpty => 'Nincsenek letiltott felhasználók.';

  @override
  String get guildSettingsBanExpiresLabel => 'Lejár';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Nincs a keresésnek megfelelő kitiltás.';

  @override
  String get guildSettingsBanDetailsTitle => 'Kitiltás részletei';

  @override
  String get guildSettingsBanViewDetails => 'Részletek megtekintése';

  @override
  String get guildSettingsBannedOn => 'Kitiltva ekkor';

  @override
  String get guildSettingsBannedBy => 'Kitiltotta';

  @override
  String get guildSettingsRevokeBanTitle => 'Kitiltás visszavonása';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Biztos vagy benne, hogy vissza akarod vonni $displayName letiltását? Újra csatlakozhat a közösséghez.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return '$displayName letiltása visszavonva';
  }

  @override
  String get guildSettingsRevokeBanError =>
      'Nem sikerült visszavonni a letiltást. Próbáld újra.';

  @override
  String get guildSettingsCommunitySettings => 'Közösségi beállítások';

  @override
  String get guildSettingsDeleteCommunity => 'Közösség törlése';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Biztosan törölni szeretnéd ezt a közösséget? Ez a művelet nem vonható vissza. Minden csatorna, üzenet és beállítás véglegesen törlődik.';

  @override
  String get guildSettingsCommunityDeleted => 'Közösség törölve';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Nem sikerült törölni ezt a közösséget';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Arculat';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Profilkép, név, banner és meghívó háttér frissítése';

  @override
  String get guildSettingsOverviewBannerUpload => 'Borítókép feltöltése';

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
      'A 250 főnél nagyobb közösségekben kötelező a „Csak említések” beállítás. Az eredeti beállításod megmarad, és visszaáll, ha a közösség létszáma 250 alá csökken.';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Rugalmas szöveges csatornanevek engedélyezése';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Közösségtulajdonosi korona elrejtése';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Különálló borítókép';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'A borítóképet külön szakaszban jeleníti meg a közösség fejléce alatt.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Ikon feltöltése';

  @override
  String get guildSettingsOverviewRemoveImage => 'Eltávolítás';

  @override
  String get guildSettingsOverviewSplashTitle => 'Meghívó háttere';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Csevegésbe ágyazott tartalom háttere';

  @override
  String get guildSettingsOverviewUploadBackground => 'Háttér feltöltése';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Nincs közösségi borítókép';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Nincs meghívó-háttérkép';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Előnézet';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Nézd meg, hogyan néz ki a meghívód a látogatók számára.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Szöveges csatornák nevei';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Közösségtulajdonosi korona';

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
      'Csak széles képernyőn jelenik meg.';

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
      'Üzenetelőzmények küszöbértékének megnyitása';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Üzenetelőzmények küszöbértéke';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Üzenetelőzmények kezdődátumának engedélyezése';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Küszöbdátum';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Az Üzenetelőzmények olvasása engedéllyel nem rendelkező tagok e dátum után küldött üzeneteket tekinthetik meg.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Üzenetelőzmények küszöbértéke frissítve';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'A szöveges csatornanevek tartalmazhatnak nagybetűket és szóközöket. Kikapcsolva a nevek kisbetűsek, kötőjelekkel és aláhúzásokkal.';

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
  String get guildSettingsAfkChannel =>
      'AFK-csatorna / inaktív tagok csatornája';

  @override
  String get guildSettingsAfkChannelHint =>
      'Mozgassa a tagokat ebbe a csatornába, ha AFK-ban vannak.';

  @override
  String get guildSettingsNoAfkChannel => 'Nincs AFK-csatorna';

  @override
  String get guildSettingsAfkTimeout => 'AFK-időkorlát';

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
  String get guildSettingsNoSystemChannel => 'Nincs rendszerüzenet-csatorna';

  @override
  String get guildSettingsHideJoinMessages => 'Csatlakozási üzenetek elrejtése';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Elrejti a csatlakozási üzeneteket a célcsatornában.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Alapértelmezett értesítési beállítások';

  @override
  String get guildSettingsNotificationsAll => 'Összes üzenet';

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
  String get guildSettingsModerationContentFilterTitle => 'Tartalomszűrés';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Automatikusan ellenőrzi, hogy tartalmaznak-e explicit tartalmat a felnőtt tartalomra nem megjelölt csatornák üzenetei.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'A Discoveryben szereplő közösségek kötelesek minden tagot szűrni. Ez a beállítás nem változtatható meg, amíg a Discovery engedélyezve van.';

  @override
  String get guildSettingsContentFilterOff => 'Ki';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Engedd, hogy a közösség önmagát moderálja';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Szerepkör nélküli tagok üzeneteinek szűrése';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'A legtöbb közösség számára ajánlott';

  @override
  String get guildSettingsContentFilterAll => 'Minden tag üzeneteinek szűrése';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Maximális védelem a családbarát tereknek';

  @override
  String get guildSettingsContentWarningToggle =>
      'Tartalmi figyelmeztetés megjelenítése';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Bekapcsol egy beleegyezési felszólítást, mielőtt bármelyik csatornába belépnél.';

  @override
  String get guildSettingsContentWarningText => 'Egyéni figyelmeztető szöveg';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Ez érzékeny tartalmat tartalmaz.';

  @override
  String get guildSettingsModeration2faTitle => '2FA-követelmény';

  @override
  String get guildSettingsModeration2faDescription =>
      'Követeld meg a moderátoroktól a kétfaktoros hitelesítést, mielőtt kitilthatnak, eltávolíthatnak, időtúllépést adhatnak, vagy törölhetnek üzeneteket.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Kétlépcsős azonosítás megkövetelése a moderálási műveletekhez';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'A beállítás módosításához engedélyezd a kétlépcsős azonosítást a fiókodon';

  @override
  String get guildSettingsEmojiSearchHint => 'Emojik keresése';

  @override
  String get guildSettingsEmojiUploadTitle => 'Emoji feltöltése';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Emojihelyek';

  @override
  String get guildSettingsEmojiDropZone => 'Húzd ide az emojifájlokat';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Nem sikerült betölteni az emojikat. Próbáld újra később.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Nincs a keresésnek megfelelő emoji.';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Elérted az emojik maximális számát. Törölj néhány meglévő emojit, hogy helyet szabadíts fel.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Az emojik nevének legalább 2 karakterből kell állnia, és betűket, számokat és aláhúzásjeleket tartalmazhat. Az emojik méretének $maxSize alatt kell lennie. A statikus képeket automatikusan 128×128 képpontosra méretezzük és tömörítjük. Az animált emojiknak és az SVG-knek már feltöltéskor meg kell felelniük a méretkorlátnak.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Néhány emojit nem sikerült hozzáadni';

  @override
  String get guildSettingsEmojiRenameTitle => 'Emoji átnevezése';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 karakter, betűk, számok, aláhúzások.';

  @override
  String get guildSettingsEmojiColumnName => 'Név';

  @override
  String get guildSettingsEmojiColumnUploader => 'Feltöltötte';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Emoji törlése';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Törlés: $name?: Ez nem vonható vissza.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Emoji törlése a tárhelyről és a CDN-ről';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Az emoji nevének legalább 2 karakter hosszúnak kell lennie';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Az emoji neve legfeljebb 32 karakter hosszú lehet';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Érvénytelen emojinév';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Nem sikerült átnevezni ezt az emojit';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Nem sikerült törölni ezt az emojit';

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
      'Nem sikerült frissíteni az emoji másolási beállítását';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Nem sikerült frissíteni a matrica másolási beállítását';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Nem animált emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animált emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Matricák keresése';

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
      'Hiba történt a matricák betöltésekor. Próbáld újra.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Nincsenek a keresésnek megfelelő matricák.';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Elérted a matricák maximális számát. Törölj néhány meglévő matricát, hogy helyet szabadíts fel.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'A matricákat 320x320 képpontban mentjük, és a méretüknek $maxSize alatt kell lennie. A statikus képeket automatikusan átméretezzük és tömörítjük. Az animált matricáknak és SVG-knek már feltöltéskor bele kell férniük a korlátba.';
  }

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
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Webhook létrehozásához nyissa meg a(z) $channelSettingsPath oldalt. Itt továbbra is szerkeszthet és rendszerezhet minden létező webhookot.';
  }

  @override
  String get guildSettingsBannedUsersTitle => 'Kitiltott felhasználók';

  @override
  String get guildSettingsInvitesTableInviter => 'Meghívó felhasználó';

  @override
  String get guildSettingsInvitesTableChannel => 'Csatorna';

  @override
  String get guildSettingsInvitesTableCode => 'Kód';

  @override
  String get guildSettingsInvitesTableUses => 'Használatok';

  @override
  String get guildSettingsInvitesTableCreated => 'Létrehozva';

  @override
  String get guildSettingsInvitesTableExpires => 'Lejár';

  @override
  String get guildSettingsAuditLogFilterUser => 'Szűrés felhasználó szerint';

  @override
  String get guildSettingsAuditLogFilterAction => 'Szűrés művelet szerint';

  @override
  String get createDm => 'Közvetlen beszélgetés létrehozása';

  @override
  String get createGroupDm => 'Csoportos beszélgetés létrehozása';

  @override
  String get createDmNewMessage => 'Új üzenet';

  @override
  String get createDmSelectFriends => 'Ismerősök kiválasztása';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Válassz ismerősöket az üzenetküldéshez.';

  @override
  String get createDmSearchFriends => 'Ismerősök keresése';

  @override
  String get createDmNoFriendsFound => 'Nem található ismerős';

  @override
  String get createDmNoFriendsYet => 'Még nincsenek ismerőseid';

  @override
  String get createDmClaimToStartDms =>
      'Fejezd be a fiókod regisztrációját, hogy közvetlen beszélgetéseket kezdeményezhess.';

  @override
  String get createDmVerifyToStartDms =>
      'Közvetlen beszélgetések indításához erősítsd meg az e-mail-címedet.';

  @override
  String get createDmVerifyYourEmail => 'E-mail-cím megerősítése';

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
      'A következő személyek nem adhatók hozzá ehhez a csoportos beszélgetéshez:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Hozza létre a csoportos DM-et a fennmaradó $count címzettel, és hagyja figyelmen kívül a többit?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Nincs több címzett, akivel csoportos beszélgetést hozhatnál létre.';

  @override
  String get createDmUnaddableUserNotFound => 'A felhasználó nem található';

  @override
  String get createDmUnaddableBlocked =>
      'Ezt a felhasználót nem tudod üzenetben elérni';

  @override
  String get createDmUnaddableNotFriends => 'Nincs az ismerőseid között';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Nem engedi, hogy csoportos beszélgetésekhez adják';

  @override
  String get createDmFailed =>
      'Nem sikerült létrehozni a beszélgetést. Próbáld újra.';

  @override
  String get dmListMessagesTitle => 'Üzenetek';

  @override
  String get dmListDirectMessagesTitle => 'Közvetlen üzenetek';

  @override
  String get keybindsSearchShortcuts => 'Billentyűparancsok keresése';

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
  String get keybindActionGoToDms => 'Ugrás a közvetlen üzenetekhez';

  @override
  String get keybindActionGoToFirstCommunity => 'Ugrás az első közösséghez';

  @override
  String get keybindActionGoToSecondCommunity => 'Ugrás a második közösséghez';

  @override
  String get keybindActionGoToThirdCommunity => 'Ugrás a harmadik közösséghez';

  @override
  String get keybindActionGoToFourthCommunity => 'Ugrás a negyedik közösséghez';

  @override
  String get keybindActionGoToFifthCommunity => 'Ugrás az ötödik közösséghez';

  @override
  String get keybindActionGoToSixthCommunity => 'Ugrás a hatodik közösséghez';

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
  String get keybindActionStartDragAndDrop => 'Húzás és ejtés indítása';

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
  String get keybindActionStartGroupDm => 'Csoportos beszélgetés indítása';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Rögzített üzenetek megjelenítése/elrejtése';

  @override
  String get keybindActionToggleInbox =>
      'Beérkezett üzenetek megjelenítése/elrejtése';

  @override
  String get keybindActionMarkTopInboxRead =>
      'A beérkezett üzenetek legfelső csatornájának megjelölése olvasottként';

  @override
  String get keybindActionMarkAllInboxRead =>
      'A beérkezett üzenetek összes csatornájának megjelölése olvasottként';

  @override
  String get keybindActionToggleMemberList =>
      'Taglista vagy hangcsevegés be/ki kapcsolása';

  @override
  String get keybindActionToggleEmojiPicker =>
      'Emojiválasztó megnyitása/bezárása';

  @override
  String get keybindActionToggleGifPicker => 'GIF-választó megnyitása/bezárása';

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
  String get keybindActionFocusComposer => 'Fókuszálj a szövegmezőre';

  @override
  String get keybindActionUploadFile => 'Fájl feltöltése';

  @override
  String get keybindActionCopyChannelLink => 'Csatornalink másolása';

  @override
  String get keybindActionToggleSavedMedia =>
      'Mentett média megjelenítése/elrejtése';

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
  String get keybindActionToggleSoundboard => 'Hangpanel megnyitása/bezárása';

  @override
  String get keybindActionToggleCompactCallView =>
      'Kompakt hívásnézet kibontása vagy összecsukása';

  @override
  String get keybindActionPushToTalkPriority => 'Adásgomb (elsőbbségi)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Beszédérzékelés elsőbbséggel';

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

  @override
  String get assistantNeedsLogin =>
      'Először nyisd meg a Fluxert, és jelentkezz be.';

  @override
  String get assistantNotInVoice => 'Nem vagy hívásban.';

  @override
  String get assistantNotFound => 'A Fluxer nem találta.';

  @override
  String get assistantDmsDisabled =>
      'A közvetlen üzenetek le vannak tiltva ezen a példányon.';

  @override
  String get assistantFailed => 'A Fluxer nem tudta befejezni.';

  @override
  String get assistantOkMuted => 'Mikrofon némítva.';

  @override
  String get assistantOkUnmuted => 'Mikrofon némítása feloldva.';

  @override
  String get assistantOkLeftVoice => 'Elhagytad a hangcsatornát.';

  @override
  String get assistantOkJoinedVoice => 'Csatlakozás a hangcsatornához.';

  @override
  String get assistantOkStartedCall => 'Hívás indítása.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Állapot beállítva: $status.';
  }

  @override
  String get assistantOkOpened => 'Fluxer megnyitása.';

  @override
  String get assistantOkMessageSent => 'Üzenet elküldve.';

  @override
  String get assistantOkCustomStatusSet => 'Egyéni állapot frissítve.';

  @override
  String get assistantOkCustomStatusCleared => 'Egyéni állapot törölve.';

  @override
  String get guildNavbarAnnouncementChannel => 'Bejelentési csatorna';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Tegyél közzé frissítéseket, amelyeket más közösségek is követhetnek a saját csatornáikon';

  @override
  String get channelDetailsAnnouncementChannel => 'Bejelentési csatorna';

  @override
  String get channelSettingsAnnouncementChannel => 'Bejelentési csatorna';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Más közösségek is követhetik ezt a csatornát, és másolatot kaphatnak a közzétett tartalmakról.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Ne legyen többé bejelentési csatorna?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count csatorna követi ezt a csatornát. Szöveges csatornává alakítva megszűnnek ezek a követések.',
      one:
          '1 csatorna követi ezt a csatornát. Szöveges csatornává alakítva megszűnik ez a követés.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Ha szöveges csatornává alakítod ezt a csatornát, egyetlen csatorna sem fogja tovább követni.';

  @override
  String get channelSettingsConvertChannel => 'Átalakítás';

  @override
  String get channelSettingsConvertFailed =>
      'Nem sikerült átalakítani ezt a csatornát';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Ezt a csatornát még más csatornák követik. Az átalakítás előtt szüntesd meg ezeket a követéseket.';

  @override
  String get channelMenuFollow => 'Csatorna követése';

  @override
  String get channelFollowTitle => 'Kövesd ezt a csatornát';

  @override
  String get channelFollowBody =>
      'Válaszd ki, hová kerüljenek a közzétett üzenetei. A követést bármikor megszüntetheted a Közösségi beállítások → Webhookok menüpontban.';

  @override
  String get channelFollowCommunity => 'Közösség';

  @override
  String get channelFollowChannel => 'Csatorna';

  @override
  String get channelFollowAgeWarning =>
      'Ez egy korhatáros csatorna. Frissítések csak korhatáros csatornákra küldhetők.';

  @override
  String get channelFollowContentWarning =>
      'Ez a csatorna tartalmaz egy tartalomra vonatkozó figyelmeztetést. Frissítések csak tartalomra vonatkozó figyelmeztetéssel vagy korhatáros besorolással rendelkező csatornákra küldhetők.';

  @override
  String get channelFollowHiddenHint =>
      'A közösségek és csatornák, ahol nem tudsz webhookokat kezelni, el vannak rejtve.';

  @override
  String get channelFollowEmpty =>
      'Nem tudsz webhookokat kezelni egyetlen közösségben sem. Kérj meg egy rendszergazdát, hogy kövesse ezt a csatornát.';

  @override
  String get channelFollowSubmit => 'Követés';

  @override
  String get channelFollowFailed => 'Nem sikerült követni ezt a csatornát.';

  @override
  String get channelFollowSuccessTitle => 'A frissítések úton vannak!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'A(z) $sourceName csatornán közzétett üzenetek megjelennek a(z) #$targetName csatornán.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Értettem!';

  @override
  String get channelFollowBarrier =>
      'Kövesd ezt a csatornát, hogy ezeket a bejelentéseket egy általad választott csatornán kapd meg.';

  @override
  String get channelHeaderFollow => 'Csatorna követése';

  @override
  String get chatMessagePublish => 'Közzététel';

  @override
  String get chatMessagePublished => 'Közzétéve';

  @override
  String get chatMessagePublishConfirmTitle => 'Üzenet közzététele?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Ez másolatot küld minden csatornára, amely ezt a csatornát követi.';

  @override
  String get chatMessagePublishedToast => 'Üzenet közzétéve';

  @override
  String get chatMessageAlreadyPublished => 'Ez az üzenet már közzé van téve.';

  @override
  String get chatMessagePublishFailedTitle =>
      'Nem sikerült közzétenni ezt az üzenetet';

  @override
  String get chatMessagePublishFailedBody =>
      'Valami hiba történt. Próbáld újra egy pillanat múlva.';

  @override
  String get chatMessagePublishLimitTitle => 'Lassíts';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Újra közzéteheted $duration múlva.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Túl gyorsan teszel közzé. Próbáld újra egy pillanat múlva.';

  @override
  String get chatMessageDeletePublished =>
      'Ez azokat a másolatokat is eltávolítja, amelyeket az ezt a csatornát követő csatornákra küldtünk.';

  @override
  String get chatMessageEditPublishedTitle => 'Közzétett üzenet szerkesztése?';

  @override
  String get chatMessageEditPublishedBody =>
      'Ez frissíti azokat a másolatokat, amelyeket az ezt a csatornát követő csatornákra küldtünk.';

  @override
  String get chatMessageEditPublishedSave => 'Mentés';

  @override
  String get chatMessageEditLimitTitle => 'Lassíts';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Ezt a közzétett üzenetet újra szerkesztheted $duration múlva.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Túl gyorsan szerkeszted ezt a közzétett üzenetet. Próbáld újra egy pillanat múlva.';

  @override
  String get chatMessageOriginalDeleted => '[Eredeti üzenet törölve]';

  @override
  String get userTagCommunity => 'Közösség';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username beállította, hogy ez a csatorna kövesse ezt: $source. Az ott közzétett üzenetek itt jelennek meg.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username beállította, hogy ez a csatorna kövesse ezt: $source.';
  }

  @override
  String get publishNudgeNotSent => 'Még nem lett elküldve a követőknek.';

  @override
  String get publishNudgeHideForever => 'Ne mutasd újra';

  @override
  String get publishNudgeDismiss => 'Elvetés';

  @override
  String get channelSettingsFollowedChannels => 'Követett csatornák';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Bejelentési csatornák, amelyeket ez a csatorna követ. Szüntesd meg a követést, ha nem szeretnél több másolatot kapni.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'A közösség csatornái által követett bejelentési csatornák.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'Forrás: $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'A frissítések szünetelnek, mert a forráscsatorna már nem elérhető.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Megszünteted a(z) $name követését?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Ez a csatorna többé nem kap másolatokat attól a bejelentési csatornától.';

  @override
  String get channelSettingsUnfollow => 'Követés megszüntetése';

  @override
  String get crosspostCommunityTitle => 'Közösség';

  @override
  String get crosspostGoToCommunity => 'Ugrás a közösséghez';

  @override
  String get crosspostJoinCommunity => 'Csatlakozás a közösséghez';

  @override
  String get crosspostSourceFailed =>
      'Nem sikerült betölteni ezt a közösséget. Próbáld meg később újra.';

  @override
  String crosspostMembers(int count) {
    return '$count tag';
  }

  @override
  String crosspostOnline(int count) {
    return '$count online';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perc',
      one: '1 perc',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count másodperc',
      one: '1 másodperc',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Nem támogatott csatornatípus';

  @override
  String get channelUnsupportedBody =>
      'Az alkalmazás ezen verziója nem támogatja ezt a csatornatípust.';

  @override
  String get channelDetailsUnsupportedChannel => 'Nem támogatott csatorna';

  @override
  String get forumChannelTypeForum => 'Forum';

  @override
  String get forumChannelTypeForumDescription =>
      'Posts organized by topic and tags';

  @override
  String get forumChannelTypeMedia => 'Media';

  @override
  String get forumChannelTypeMediaDescription =>
      'Posts built around images and videos';

  @override
  String get forumNewPost => 'New post';

  @override
  String get forumNewMediaPost => 'New media post';

  @override
  String get forumSearchPosts => 'Search posts';

  @override
  String get forumViewOptions => 'Sort and view';

  @override
  String get forumSearchIndexing =>
      'Search is still being prepared for this community. Posts appear here as soon as it is ready.';

  @override
  String get forumNoPosts => 'There are no posts yet';

  @override
  String get forumNoPostsHint => 'Be the first to start a conversation here.';

  @override
  String get forumNoSearchResults => 'No posts match your search';

  @override
  String get forumNoSearchResultsHint =>
      'Try different words or clear the tag filter.';

  @override
  String get forumCreateFirstPost => 'Create the first post';

  @override
  String get forumOlderPosts => 'Older posts';

  @override
  String get forumPostsLoadFailed => 'Posts could not be loaded.';

  @override
  String get forumRetry => 'Try again';

  @override
  String get forumPostPinned => 'Pinned';

  @override
  String get forumPostLocked => 'Locked';

  @override
  String get forumPostArchived => 'Archived';

  @override
  String get forumPostNewBadge => 'NEW';

  @override
  String get forumPostStarterDeleted => 'The original message was deleted.';

  @override
  String forumPostSnippet(String author, String content) {
    return '$author: $content';
  }

  @override
  String forumPostNewMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new messages',
      one: '1 new message',
    );
    return '$_temp0';
  }

  @override
  String get forumPostReact => 'Add the default reaction';

  @override
  String get forumOpenPost => 'Open post';

  @override
  String get forumEditTags => 'Edit tags';

  @override
  String get forumSaveTags => 'Save tags';

  @override
  String forumTagsLimitHint(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pick up to $count tags.',
      one: 'Pick up to 1 tag.',
    );
    return '$_temp0';
  }

  @override
  String get forumPinPost => 'Pin post';

  @override
  String get forumUnpinPost => 'Unpin post';

  @override
  String get forumMarkPostRead => 'Mark as read';

  @override
  String get forumCopyPostLink => 'Copy link';

  @override
  String get forumPostGuidelines => 'Post guidelines';

  @override
  String get forumGuidelinesPlaceholder =>
      'Tell people what to post here and how to post it.';

  @override
  String get forumPostTitle => 'Title';

  @override
  String get forumPostMessage => 'Message';

  @override
  String get forumPostMessagePlaceholder =>
      'Write the first message of your post';

  @override
  String get forumPostMediaPlaceholder => 'Add a caption';

  @override
  String get forumPostTags => 'Tags';

  @override
  String get forumPostTagsRequired => 'Tags (required)';

  @override
  String get forumPostAddMedia => 'Add media';

  @override
  String get forumPostAddFile => 'Add file';

  @override
  String get forumPostRemoveAttachment => 'Remove attachment';

  @override
  String get forumPostSubmit => 'Post';

  @override
  String get forumPostTitleRequired => 'Give your post a title.';

  @override
  String get forumPostMediaRequired =>
      'Add at least one image or video to post here.';

  @override
  String get forumPostContentRequired => 'Write a message or add a file.';

  @override
  String get forumSortLatestActivity => 'Recently active';

  @override
  String get forumSortCreationTime => 'Date posted';

  @override
  String get forumLayoutList => 'List view';

  @override
  String get forumLayoutGallery => 'Gallery view';

  @override
  String get forumNewPostsUnread => 'Show unread for new posts';

  @override
  String get forumNewPostsUnreadDescription =>
      'Mark this channel unread when someone creates a post.';

  @override
  String get forumPostSlowmode => 'Post slowmode';

  @override
  String forumPostSlowmodeDescription(String bypassSlowmodePermissionLabel) {
    return 'Wait between creating posts. \"$bypassSlowmodePermissionLabel\" can bypass it.';
  }

  @override
  String get forumMessageSlowmode => 'Message slowmode in posts';

  @override
  String get forumMessageSlowmodeDescription =>
      'Slowmode applied to messages in new posts.';

  @override
  String get forumDefaultAutoArchive => 'Hide after inactivity';

  @override
  String get forumDefaultAutoArchiveDescription =>
      'New posts are archived after this long without activity.';

  @override
  String get forumDefaultReaction => 'Default reaction';

  @override
  String get forumSetDefaultReaction => 'Pick an emoji';

  @override
  String get forumChangeDefaultReaction => 'Change';

  @override
  String get forumRemoveDefaultReaction => 'Remove';

  @override
  String get forumDefaultSortOrder => 'Default sort order';

  @override
  String get forumDefaultLayout => 'Default layout';

  @override
  String get forumTagMatchSetting => 'Tag filter';

  @override
  String get forumTagMatchSome => 'Match any selected tag';

  @override
  String get forumTagMatchAll => 'Match all selected tags';

  @override
  String get forumRequireTag => 'Require tags';

  @override
  String get forumRequireTagDescription =>
      'People must pick at least one tag when they create a post.';

  @override
  String get forumHideMediaDownloads => 'Hide media download options';

  @override
  String get forumHideMediaDownloadsDescription =>
      'Hide download, open in browser and copy link for images and videos in posts.';

  @override
  String forumTagsTitle(int count, int max) {
    return 'Tags ($count/$max)';
  }

  @override
  String get forumTagsDescription =>
      'Tags help people find and filter posts. Only moderators can apply moderated tags.';

  @override
  String get forumCreateTag => 'Create tag';

  @override
  String get forumEditTag => 'Edit tag';

  @override
  String get forumSaveTag => 'Save tag';

  @override
  String get forumDeleteTag => 'Delete tag';

  @override
  String get forumTagName => 'Tag name';

  @override
  String get forumTagEmoji => 'Emoji';

  @override
  String get forumTagRemoveEmoji => 'Remove emoji';

  @override
  String get forumTagModerated => 'Only moderators can apply';

  @override
  String get forumTagModeratedDescription =>
      'Only members who can manage threads can apply or remove this tag.';

  @override
  String get forumTagModeratedBadge => 'Moderated';

  @override
  String forumPostCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can post again in $seconds seconds.',
      one: 'You can post again in 1 second.',
    );
    return '$_temp0';
  }
}
