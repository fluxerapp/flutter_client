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
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

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
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'This is a default emoji on $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'This emoji is from this community. You can use it everywhere.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'This is a custom emoji from a community.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'This is a custom emoji from a community. Ask the author for an invite to use this emoji.';

  @override
  String get emojiInfoFromHeader => 'This emoji is from';

  @override
  String get emojiInfoDiscoverableCommunity => 'Discoverable community';

  @override
  String get emojiInfoPrivateCommunity => 'Private community';

  @override
  String get emojiInfoVerifiedCommunity => 'Verified community';

  @override
  String get emojiInfoAddToFavorites => 'Add to Favorites';

  @override
  String get emojiInfoRemoveFromFavorites => 'Remove from Favorites';

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
  String get networkErrorMessage => 'Something went wrong. Please try again.';

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
  String get blockedUsersCopyTag => 'Felhasználónév másolása';

  @override
  String get blockedUsersCopyId => 'Felhasználói azonosító másolása';

  @override
  String get userProfileLoadError => 'Nem sikerült betölteni a profil';

  @override
  String get userProfileLoading => 'Loading profile';

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
  String get userProfileLocalTime => 'Helyi idő';

  @override
  String get userProfileSameTimeAsYou => 'Same time as you';

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
  String get voiceMessageSeekForward => 'Seek forward';

  @override
  String get voiceMessageSeekBackward => 'Seek backward';

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
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'A melléklet lejárt';

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
  String get accessibilitySaturationTitle => 'Telítettség';

  @override
  String get accessibilitySaturationDescription =>
      'Szabályozza, hogy mennyire élénken jelennek meg a témaszínek az alkalmazásban.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Always underline links';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Dim strikethrough text';

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
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Ez egy hangcsatorna. Csatlakozz, hogy beszélhess!';

  @override
  String get voiceChannelJoin => 'Csatlakozás a hangcsatornához';

  @override
  String get voiceCallJoin => 'Join call';

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
  String get voiceControlChat => 'Csevegés';

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
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

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
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

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
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

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
    return 'Attachment $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Dismiss';

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
  String get memberListPermissionDeniedTitle => 'You can\'t view members';

  @override
  String get memberListPermissionDeniedBody =>
      'You can\'t view the members of this channel in this community';

  @override
  String get memberListUnavailableTitle => 'Member list unavailable';

  @override
  String get memberListUnavailableBody =>
      'Member lists are temporarily unavailable in this community';

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
  String get userSettingsSearchPlaceholder => 'Search settings...';

  @override
  String get userSettingsSearchFieldLabel => 'Search settings';

  @override
  String get userSettingsSearchClear => 'Clear search';

  @override
  String get userSettingsSearchNoResults => 'No settings found';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Biztonság és bejelentkezés';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Ajándékok és kódok';

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
  String get userSettingsNavShortcuts => 'Shortcuts';

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
  String get audioAndVideoInCallBehaviorSectionTitle => 'In-call behavior';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Control confirmation prompts during voice and video calls.';

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
  String get userSettingsJoinFluxerLabs => 'Join Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'App Licenses';

  @override
  String get userSettingsAppLicensesDescription =>
      'Open-source software used by this app. This app is built with Flutter.';

  @override
  String get userSettingsAppLicensesLoadError => 'Could not load app licenses.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenses',
      one: '1 license',
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
  String get savedMessagesEmptyTitle => 'No bookmarks';

  @override
  String get savedMessagesEmptyBody =>
      'Bookmark messages to save them for later.';

  @override
  String get savedMessagesEndBody => 'There\'s nothing more to see here.';

  @override
  String get savedMessagesRemoveTooltip => 'Remove bookmark';

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
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
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
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

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
  String get guildMenuSettingsChannels => 'Channels';

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
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Legalább $count tagnak kell lennie a jelentkezéshez.';
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
  String get guildSettingsDiscoveryCategory => 'Kategória';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Leírás';

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
  String get guildSettingsDiscoveryTags => 'Címkék';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'játék, művészet, zene';

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
  String get guildSettingsDiscoveryApply => 'Jelentkezés elküldése';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Visszavonás';

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
      'Keresés és kezelés a szer tagjai között.';

  @override
  String get guildSettingsMembersSearchHint => 'Tagok keresése';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count tag';
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
  String get guildSettingsMembersSortNewest => 'Legújabb elöl';

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
      'Aktív meghívólinkek megtekintése és visszavonása.';

  @override
  String get guildSettingsInvitesEmpty => 'Nincsenek aktív meghívók.';

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
    return 'Nem animált emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animált emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Keresés matricák között';

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
    return 'Hozzon létre webhookokat a Csatorna beállításaiból. Szerkessze őket itt.';
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
  String get guildSettingsInvitesTableExpires => 'Expires';

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
